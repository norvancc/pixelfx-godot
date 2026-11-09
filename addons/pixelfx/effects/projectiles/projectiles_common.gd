@tool
extends RefCounted
## Selected projectiles/_lib.js helpers: wake, merged smoke, pixelShape and spark.
const C = preload("../../core/color.gd")
const M = preload("../../core/math.gd")
static func wake(x: float,y: float,vx: float,vy: float,age: float,speed: float,k: float,g: float=0) -> Array:
	var e = exp(-k*age); var f = (1-e)/k; var vt = g/k
	return [x+vx*f-speed*age,y+vt*age+(vy-vt)*f,vx*e-speed,vt+(vy-vt)*e]
static func _blur(src: PackedFloat32Array,w: int,h: int,step: int,r: int) -> PackedFloat32Array:
	var result = PackedFloat32Array(); result.resize(src.size())
	var n = w if step==1 else h; var lines = h if step==1 else w; var k = 1.0/(2*r+1)
	for line in range(lines):
		var base = line*w if step==1 else line; var acc = 0.0
		for j in range(-r,r+1):
			if j>=0 and j<n: acc+=src[base+j*step]
		for j in range(n):
			result[base+j*step] = acc*k
			var a = j-r; var b = j+r+1
			if a>=0: acc -= src[base+a*step]
			if b<n: acc += src[base+b*step]
	return result
static func cloud(p,list: Array,ramp: Array,warm_ramp: Array,opts: Dictionary={}) -> void:
	if list.is_empty(): return
	var x0 = INF; var y0 = INF; var x1 = -INF; var y1 = -INF
	for q in list:
		x0 = minf(x0,floor(q.x-q.r)); x1 = maxf(x1,ceil(q.x+q.r)); y0 = minf(y0,floor(q.y-q.r)); y1 = maxf(y1,ceil(q.y+q.r))
	var w = int(x1-x0+3); var h = int(y1-y0+3); var density = PackedFloat32Array(); var light = PackedFloat32Array(); var fire = PackedFloat32Array()
	density.resize(w*h); light.resize(w*h); fire.resize(w*h); x0-=1; y0-=1
	for q in list:
		var r = q.r; var r2 = r*r
		for y in range(floori(q.y-r),ceili(q.y+r)+1):
			var dy = y+0.5-q.y
			for x in range(floori(q.x-r),ceili(q.x+r)+1):
				var dx = x+0.5-q.x; var d2 = (dx*dx+dy*dy)/r2
				if d2>=1: continue
				var k = sqrt(1-d2)*q.a; var i = int((y-y0)*w+(x-x0))
				density[i] += k; light[i] += k*q.b; fire[i] += k*q.w*(0.5+0.5*clampf(0.5+dx/r,0,1))
	var blurred = _blur(_blur(density,w,h,1,2),w,h,w,2); var n = ramp.size(); var dens = opts.get("dens",1.5); var max_alpha = opts.get("max",0.86); var lit = opts.get("lit",1.0)
	p.each(x0+1,y0+1,x1+1,y1+1,func(lx,ly,sx,sy):
		var cx = floori(lx)-int(x0); var cy = floori(ly)-int(y0)
		if cx<1 or cy<1 or cx>=w-1 or cy>=h-1: return
		var i = cy*w+cx; var d = density[i]
		if d<0.05: return
		var a = minf(max_alpha,ceil((1-exp(-d*dens))*6)/6)
		if a<0.15: return
		var gy = blurred[i+w]-blurred[i-w]; var gx = blurred[i+1]-blurred[i-1]
		var up = clampf(0.5+atan((gy*0.9+gx*0.35)/(blurred[i]*0.16+0.03))*0.42*lit,0,1)
		var heat = fire[i]/d; var j = clampi(M.js_round((light[i]/d)*(0.3+0.7*up)*(n-1)+0.25+heat*1.5),0,n-1)
		p.blend_px(sx,sy,C.mix(ramp[j],warm_ramp[j],minf(0.9,ceil(heat*10)/10)) if heat>0.03 else ramp[j],a)
	)
static func spark(p,x: float,y: float,vx: float,vy: float,k: float,colors: Array,glow: float=0.45) -> void:
	var sp = sqrt(vx*vx+vy*vy)
	if sp==0: sp=1.0
	var ux = vx/sp; var uy = vy/sp; var length = minf(9,1+sp*0.022); var head = colors[0] if k>0.6 else (colors[1] if k>0.3 else colors[2])
	p.line(x-ux*length,y-uy*length,x-ux*length*0.4,y-uy*length*0.4,head if k>0.5 else colors[3]); p.line(x-ux*length*0.45,y-uy*length*0.45,x,y,head); p.glow(x,y,3,head,glow*k)
static func pixel_shape(x0: int,y0: int,w: int,h: int,build: Callable) -> Dictionary:
	var grid = []
	for j in range(h):
		var row = []
		row.resize(w); row.fill("."); grid.append(row)
	var set_pixel = func(x,y,ch):
		var i = x-x0; var j = y-y0
		if i>=0 and j>=0 and i<w and j<h: grid[j][i] = ch
	build.call(set_pixel)
	var solid = func(i,j): return i>=0 and j>=0 and i<w and j<h and grid[j][i] not in [".","o"]
	for j in range(h):
		for i in range(w):
			if grid[j][i]=="." and (solid.call(i-1,j) or solid.call(i+1,j) or solid.call(i,j-1) or solid.call(i,j+1)): grid[j][i]="o"
	var rows = []
	for row in grid: rows.append("".join(row))
	return {"rows":rows,"x0":x0,"y0":y0}
