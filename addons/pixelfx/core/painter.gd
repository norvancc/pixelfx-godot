@tool
extends RefCounted
## Software pixel rasterizer. Ported from PixelFX Painter; see ../LICENSE.
const Frame = preload("frame.gd")
const M = preload("math.gd")
const BAYER = [0, 8, 2, 10, 12, 4, 14, 6, 3, 11, 1, 9, 15, 7, 13, 5]
var frame: Frame
var tx := 0.0
var ty := 0.0
var fx := 1.0
var cs := 1.0
var sn := 0.0
var fade := 1.0
var light_k := 1.0
var layer := "front"

func _init(target: Frame) -> void: frame = target
func reset() -> void:
	tx = 0; ty = 0; fx = 1; cs = 1; sn = 0; fade = 1; light_k = 1; layer = "front"
func place(x: float, y: float, flip: bool = false, angle: float = 0) -> void:
	tx = x; ty = y; fx = -1 if flip else 1; cs = cos(angle); sn = sin(angle)
func to_x(x: float, y: float) -> float: return tx + x * fx * cs - y * sn
func to_y(x: float, y: float) -> float: return ty + x * fx * sn + y * cs
func from_x(x: float, y: float) -> float: return ((x - tx) * cs + (y - ty) * sn) * fx
func from_y(x: float, y: float) -> float: return -(x - tx) * sn + (y - ty) * cs
func cell_x(x: float, y: float) -> int: return floori(to_x(floor(x) + 0.5, floor(y) + 0.5))
func cell_y(x: float, y: float) -> int: return floori(to_y(floor(x) + 0.5, floor(y) + 0.5))

func put(sx: int, sy: int, c: int, a: float = 1) -> void:
	if not c: return
	a *= fade
	if a < 1 and a <= (BAYER[((sy & 3) << 2) | (sx & 3)] + 0.5) / 16.0: return
	var x := sx - frame.ox; var y := sy - frame.oy
	if x < 0 or y < 0 or x >= frame.w or y >= frame.h: return
	frame.color[y * frame.w + x] = c

func add(sx: int, sy: int, c: int, k: float = 1) -> void:
	k *= fade * light_k
	if k <= 0.004: return
	var x := sx - frame.ox; var y := sy - frame.oy
	if x < 0 or y < 0 or x >= frame.w or y >= frame.h: return
	var i := y * frame.w + x; var d: int = frame.light[i]
	var r := int(minf(255, (d & 255) + (c & 255) * k))
	var g := int(minf(255, ((d >> 8) & 255) + ((c >> 8) & 255) * k))
	var b := int(minf(255, ((d >> 16) & 255) + ((c >> 16) & 255) * k))
	frame.light[i] = 0xff000000 | (b << 16) | (g << 8) | r

func blend_px(sx: int, sy: int, c: int, a: float) -> void:
	a *= fade
	if not c or a <= 0.004: return
	var x := sx - frame.ox; var y := sy - frame.oy
	if x < 0 or y < 0 or x >= frame.w or y >= frame.h: return
	var i := y * frame.w + x; var d: int = frame.color[i]
	var da := ((d >> 24) & 255) / 255.0
	var oa := a + da * (1 - a); var k := a / oa
	var r := int((c & 255) * k + (d & 255) * (1 - k)) & 255
	var g := int(((c >> 8) & 255) * k + ((d >> 8) & 255) * (1 - k)) & 255
	var b := int(((c >> 16) & 255) * k + ((d >> 16) & 255) * (1 - k)) & 255
	frame.color[i] = ((int(oa * 255) & 255) << 24) | (b << 16) | (g << 8) | r

func blend(x: float, y: float, c: int, a: float) -> void: blend_px(cell_x(x, y), cell_y(x, y), c, a)
func px(x: float, y: float, c: int) -> void: put(cell_x(x, y), cell_y(x, y), c)
func dot(x: float, y: float, c: int, a: float = 1) -> void:
	if a > 0: put(cell_x(x, y), cell_y(x, y), c, a)
func light(x: float, y: float, c: int, k: float = 1) -> void: add(cell_x(x, y), cell_y(x, y), c, k)
func read_pixel(x: float, y: float) -> int:
	var sx := cell_x(x, y) - frame.ox; var sy := cell_y(x, y) - frame.oy
	if sx < 0 or sy < 0 or sx >= frame.w or sy >= frame.h: return 0
	return frame.color[sy * frame.w + sx]

func each(x0: float, y0: float, x1: float, y1: float, fn: Callable) -> void:
	var ax := INF; var bx := -INF; var ay := INF; var by := -INF
	for k in range(4):
		var x := x1 if k & 1 else x0; var y := y1 if k & 2 else y0
		var sx := to_x(x, y); var sy := to_y(x, y)
		ax = minf(ax, sx); bx = maxf(bx, sx); ay = minf(ay, sy); by = maxf(by, sy)
	for sy in range(maxi(floori(ay), frame.oy), mini(ceili(by), frame.oy + frame.h - 1) + 1):
		for sx in range(maxi(floori(ax), frame.ox), mini(ceili(bx), frame.ox + frame.w - 1) + 1):
			fn.call(from_x(sx + 0.5, sy + 0.5), from_y(sx + 0.5, sy + 0.5), sx, sy)

func shade(x0: float, y0: float, x1: float, y1: float, fn: Callable) -> void:
	var out := {"c": 0, "a": 1.0, "l": 0, "k": 0.0}
	each(x0, y0, x1, y1, func(lx, ly, sx, sy):
		out.c = 0; out.a = 1.0; out.l = 0; out.k = 0.0
		var result = fn.call(lx, ly, out)
		var c: int = result if result else out.c
		if c: put(sx, sy, c, out.a)
		if out.k > 0: add(sx, sy, out.l if out.l else c, out.k)
	)

static func evaluate(v, args: Array): return v.callv(args) if v is Callable else v
func line(x0: float, y0: float, x1: float, y1: float, c, a = 1.0) -> void:
	var sx := cell_x(x0, y0); var sy := cell_y(x0, y0)
	var ex := cell_x(x1, y1); var ey := cell_y(x1, y1)
	var dx := absi(ex - sx); var dy := -absi(ey - sy)
	var stepx := 1 if sx < ex else -1; var stepy := 1 if sy < ey else -1
	var n := maxi(1, maxi(dx, -dy)); var err := dx + dy; var i := 0
	while true:
		var u := float(i) / n; i += 1
		put(sx, sy, evaluate(c, [u]), evaluate(a, [u]))
		if sx == ex and sy == ey: break
		var e2 := 2 * err
		if e2 >= dy: err += dy; sx += stepx
		if e2 <= dx: err += dx; sy += stepy
func polyline(pts: Array, c, a = 1.0) -> void:
	for i in range(1, pts.size()): line(pts[i - 1][0], pts[i - 1][1], pts[i][0], pts[i][1], c, a)
func circle(cx: float, cy: float, r: float, c, a = 1.0) -> void:
	if r < 0.6:
		dot(cx, cy, evaluate(c, [0, 0]), evaluate(a, [0, 0])); return
	shade(cx-r, cy-r, cx+r, cy+r, func(x, y, o):
		var dx: float = x-cx; var dy: float = y-cy; var d2 := dx*dx+dy*dy
		if d2 > r*r: return
		var args := [sqrt(d2)/r, atan2(dy, dx)]
		o.c = evaluate(c, args); o.a = evaluate(a, args)
	)
func disc(cx: float, cy: float, r: float, c, a) -> void:
	if r < 0.5:
		blend(cx, cy, evaluate(c, [0, 0]), evaluate(a, [0, 0])); return
	each(cx-r, cy-r, cx+r, cy+r, func(x, y, sx, sy):
		var dx: float = x-cx; var dy: float = y-cy; var d2 := dx*dx+dy*dy
		if d2 > r*r: return
		var args := [sqrt(d2)/r, atan2(dy, dx)]
		blend_px(sx, sy, evaluate(c, args), evaluate(a, args))
	)
func ellipse(cx: float, cy: float, rx: float, ry: float, c, a = 1.0) -> void:
	if rx <= 0 or ry <= 0: return
	shade(cx-rx, cy-ry, cx+rx, cy+ry, func(x, y, o):
		var dx: float = (x-cx)/rx; var dy: float = (y-cy)/ry; var d2 := dx*dx+dy*dy
		if d2 > 1: return
		var args := [sqrt(d2), atan2(dy, dx)]
		o.c = evaluate(c, args); o.a = evaluate(a, args)
	)
func ring(cx: float, cy: float, r: float, width: float, c, a = 1.0) -> void:
	var r0 := maxf(0, r-width)
	shade(cx-r, cy-r, cx+r, cy+r, func(x, y, o):
		var dx: float = x-cx; var dy: float = y-cy; var d2 := dx*dx+dy*dy
		if d2 > r*r or d2 < r0*r0: return
		var v := (sqrt(d2)-r0) / (r-r0 if r != r0 else 1.0) if width > 0 else 1.0
		var args := [v, atan2(dy, dx)]
		o.c = evaluate(c, args); o.a = evaluate(a, args)
	)
func arc(cx: float, cy: float, r: float, width, a0: float, a1: float, c, a = 1.0) -> void:
	var span := a1-a0
	if span <= 0: return
	shade(cx-r, cy-r, cx+r, cy+r, func(x, y, o):
		var dx: float = x-cx; var dy: float = y-cy; var d := sqrt(dx*dx+dy*dy)
		if d > r: return
		var ang := fposmod(atan2(dy, dx)-a0, TAU)
		if ang > span: return
		var u := ang/span; var ww: float = evaluate(width, [u])
		if ww <= 0 or d < r-ww: return
		var args := [u, (d-(r-ww))/ww]
		o.c = evaluate(c, args); o.a = evaluate(a, args)
	)
func beam(x0: float, y0: float, x1: float, y1: float, width: float, c, a = 1.0) -> void:
	var r := width/2; var dx := x1-x0; var dy := y1-y0; var l2 := dx*dx+dy*dy
	if l2 == 0: l2 = 1e-9
	if r <= 0: return
	shade(minf(x0,x1)-r, minf(y0,y1)-r, maxf(x0,x1)+r, maxf(y0,y1)+r, func(x, y, o):
		var u := clampf(((x-x0)*dx+(y-y0)*dy)/l2,0,1)
		var px_value: float = x0+dx*u-x; var py_value: float = y0+dy*u-y
		var d2: float = px_value*px_value+py_value*py_value
		if d2 > r*r: return
		var args := [u,sqrt(d2)/r]
		o.c = evaluate(c,args); o.a = evaluate(a,args)
	)
func rect(x: float, y: float, w: float, h: float, c: int, a: float = 1) -> void:
	if sn == 0:
		for yy in range(M.js_round(y), M.js_round(y+h)):
			for xx in range(M.js_round(x), M.js_round(x+w)): put(cell_x(xx,yy),cell_y(xx,yy),c,a)
		return
	shade(x,y,x+w,y+h,func(lx,ly,o):
		if lx < x or ly < y or lx >= x+w or ly >= y+h: return
		o.c=c; o.a=a
	)
func poly(pts: Array, c, a = 1.0) -> void:
	var x0 := INF; var y0 := INF; var x1 := -INF; var y1 := -INF
	for point in pts:
		x0=minf(x0,point[0]); y0=minf(y0,point[1]); x1=maxf(x1,point[0]); y1=maxf(y1,point[1])
	shade(x0,y0,x1,y1,func(x,y,o):
		var inside := false; var j := pts.size()-1
		for i in range(pts.size()):
			var xi: float=pts[i][0]; var yi: float=pts[i][1]; var xj: float=pts[j][0]; var yj: float=pts[j][1]
			if (yi > y) != (yj > y) and x < (xj-xi)*(y-yi)/(yj-yi)+xi: inside=not inside
			j=i
		if inside: o.c=evaluate(c,[x,y]); o.a=evaluate(a,[x,y])
	)
func tri(x0: float,y0: float,x1: float,y1: float,x2: float,y2: float,c,a=1.0) -> void: poly([[x0,y0],[x1,y1],[x2,y2]],c,a)

func glow(x: float, y: float, r: float, c: int, k: float = 0.5) -> void:
	if r < 1 or k <= 0.004: return
	var cx := to_x(x,y); var cy := to_y(x,y)
	for sy in range(maxi(frame.oy,floori(cy-r)), mini(frame.oy+frame.h-1,ceili(cy+r))+1):
		var dy := (sy+0.5-cy)/r
		for sx in range(maxi(frame.ox,floori(cx-r)), mini(frame.ox+frame.w-1,ceili(cx+r))+1):
			var dx := (sx+0.5-cx)/r; var d := dx*dx+dy*dy
			if d >= 1: continue
			var f := 1-sqrt(d)
			add(sx,sy,c,f*f*k)
func glow_line(x0: float,y0: float,x1: float,y1: float,r: float,c: int,k: float=0.5) -> void:
	if r < 1 or k <= 0.004: return
	var ax := to_x(x0,y0); var ay := to_y(x0,y0); var bx := to_x(x1,y1); var by := to_y(x1,y1)
	var dx := bx-ax; var dy := by-ay; var l2 := dx*dx+dy*dy
	if l2 == 0: l2=1e-9
	for sy in range(maxi(frame.oy,floori(minf(ay,by)-r)),mini(frame.oy+frame.h-1,ceili(maxf(ay,by)+r))+1):
		for sx in range(maxi(frame.ox,floori(minf(ax,bx)-r)),mini(frame.ox+frame.w-1,ceili(maxf(ax,bx)+r))+1):
			var px_value := sx+0.5; var py_value := sy+0.5
			var u := clampf(((px_value-ax)*dx+(py_value-ay)*dy)/l2,0,1)
			var ex := ax+dx*u-px_value; var ey := ay+dy*u-py_value
			var d := sqrt(ex*ex+ey*ey)/r
			if d >= 1: continue
			var f := 1-d
			add(sx,sy,c,f*f*k)
func glow_ring(x: float,y: float,radius: float,r: float,c: int,k: float=0.5) -> void:
	if r < 1 or k <= 0.004: return
	var cx := to_x(x,y); var cy := to_y(x,y); var e := radius+r
	for sy in range(maxi(frame.oy,floori(cy-e)),mini(frame.oy+frame.h-1,ceili(cy+e))+1):
		for sx in range(maxi(frame.ox,floori(cx-e)),mini(frame.ox+frame.w-1,ceili(cx+e))+1):
			var dx := sx+0.5-cx; var dy := sy+0.5-cy
			var d := absf(sqrt(dx*dx+dy*dy)-radius)/r
			if d >= 1: continue
			var f := 1-d
			add(sx,sy,c,f*f*k)

func sprite(rows: Array,palette: Dictionary,x: float,y: float,opts: Dictionary={}) -> void:
	var k: float = opts.get("scale",1.0); var alpha: float = opts.get("a",1.0); var width: int = rows[0].length() if not rows.is_empty() else 0
	for r in range(rows.size()):
		for q in range(rows[r].length()):
			var ch: String = rows[r][q]
			if ch in ["."," "]: continue
			var color_value = opts.get("tint",palette.get(ch,0))
			if not color_value: continue
			var c: int = preload("color.gd").hex(color_value)
			var column: int = width-1-q if opts.get("flip",false) else q; var row: int = rows.size()-1-r if opts.get("flipY",false) else r
			if k == 1: dot(x+column,y+row,c,alpha)
			else: rect(x+column*k,y+row*k,k,k,c,alpha)
