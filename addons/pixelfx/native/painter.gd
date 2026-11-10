@tool
extends "../core/painter.gd"
## Additional upstream Painter APIs required by actor, UI and transition ports.
static var _glow_rows:Dictionary={}
var clipped: bool = false
var weather_clipped: bool = false
var weather_screen_bounds=Rect2i()
var clip_bounds=Rect2(0,0,320,180)
func _init(target, clip_screen=false):
	super(target)
	clipped=clip_screen
func inside(sx,sy) -> bool:
	if weather_clipped and sn==0:
		return sx>=weather_screen_bounds.position.x and sx<weather_screen_bounds.end.x and sy>=weather_screen_bounds.position.y and sy<weather_screen_bounds.end.y
	if sn==0 and cs==1:
		var x:float=(sx+0.5-tx)*fx;var y:float=sy+0.5-ty
		return x>=clip_bounds.position.x and y>=clip_bounds.position.y and x<clip_bounds.end.x and y<clip_bounds.end.y
	var lx=from_x(sx+0.5,sy+0.5);var ly=from_y(sx+0.5,sy+0.5)
	return lx>=clip_bounds.position.x and ly>=clip_bounds.position.y and lx<clip_bounds.end.x and ly<clip_bounds.end.y
func put(sx:int,sy:int,c:int,a:float=1) -> void:
	if c==0:return
	a*=fade
	if a<1 and a<=(BAYER[((sy&3)<<2)|(sx&3)]+0.5)/16.0:return
	var x=sx-frame.ox;var y=sy-frame.oy
	if x<0 or y<0 or x>=frame.w or y>=frame.h or clipped and not inside(sx,sy):return
	frame.color[y*frame.w+x]=c
	if frame.track_writes:frame.touch(x,y)
func add(sx:int,sy:int,c:int,k:float=1) -> void:
	k*=fade*light_k
	if k<=0.004:return
	var x=sx-frame.ox;var y=sy-frame.oy
	if x<0 or y<0 or x>=frame.w or y>=frame.h or clipped and not inside(sx,sy):return
	var i=y*frame.w+x;var previous:int=frame.light[i]
	frame.light[i]=0xff000000 | (int(minf(255,((previous>>16)&255)+((c>>16)&255)*k))<<16) | (int(minf(255,((previous>>8)&255)+((c>>8)&255)*k))<<8) | int(minf(255,(previous&255)+(c&255)*k))
	if frame.track_writes:frame.touch(x,y)
func blend_px(sx:int,sy:int,c:int,a:float) -> void:
	a*=fade
	if c==0 or a<=0.004:return
	var x=sx-frame.ox;var y=sy-frame.oy
	if x<0 or y<0 or x>=frame.w or y>=frame.h or clipped and not inside(sx,sy):return
	var i=y*frame.w+x;var previous:int=frame.color[i]
	if previous==0 and is_finite(a):
		frame.color[i]=((int(a*255)&255)<<24)|(c&0xffffff)
		if frame.track_writes:frame.touch(x,y)
		return
	var da=((previous>>24)&255)/255.0;var oa=a+da*(1-a);var ratio=a/oa
	frame.color[i]=((int(oa*255)&255)<<24) | ((int(((c>>16)&255)*ratio+((previous>>16)&255)*(1-ratio))&255)<<16) | ((int(((c>>8)&255)*ratio+((previous>>8)&255)*(1-ratio))&255)<<8) | (int((c&255)*ratio+(previous&255)*(1-ratio))&255)
	if frame.track_writes:frame.touch(x,y)
func px(x:float,y:float,c:int) -> void:
	var lx=floor(x)+0.5;var ly=floor(y)+0.5
	put(floori(tx+lx*fx*cs-ly*sn),floori(ty+lx*fx*sn+ly*cs),c)
func dot(x:float,y:float,c:int,a:float=1) -> void:
	if not a>0:return
	var lx=floor(x)+0.5;var ly=floor(y)+0.5
	put(floori(tx+lx*fx*cs-ly*sn),floori(ty+lx*fx*sn+ly*cs),c,a)
func blend(x:float,y:float,c:int,a:float) -> void:
	var lx=floor(x)+0.5;var ly=floor(y)+0.5
	blend_px(floori(tx+lx*fx*cs-ly*sn),floori(ty+lx*fx*sn+ly*cs),c,a)
func mask(m,x,y,c,a=1):
	var semantics=load("res://addons/pixelfx/native/semantics.gd")
	for my in range(int(m.h)):
		for mx in range(int(m.w)):
			if semantics.truth(semantics.prop(m.data,my*int(m.w)+mx)):
				dot(x+mx,y+my,evaluate(c,[mx,my]),evaluate(a,[mx,my]))
func outline(m,x,y,c,a=1):
	var semantics=load("res://addons/pixelfx/native/semantics.gd")
	var at=func(mx,my):return mx>=0 and my>=0 and mx<m.w and my<m.h and semantics.truth(semantics.prop(m.data,int(my*m.w+mx)))
	for my in range(-1,int(m.h)+1):
		for mx in range(-1,int(m.w)+1):
			if not at.call(mx,my) and (at.call(mx-1,my) or at.call(mx+1,my) or at.call(mx,my-1) or at.call(mx,my+1)):
				dot(x+mx,y+my,evaluate(c,[mx,my]),evaluate(a,[mx,my]))
func measure(value,opts: Dictionary={}):
	var semantics=load("res://addons/pixelfx/native/semantics.gd")
	var font=semantics.module("core/font.js");var name=opts.get("font","mini");var k=opts.get("scale",1)
	return [semantics.call_value(font.textWidth,[value,name])*k,font.FONTS[name].h*k]
func text(value,x,y,c,opts: Dictionary={}):
	var semantics=load("res://addons/pixelfx/native/semantics.gd")
	var font=semantics.module("core/font.js");var name=opts.get("font","mini");var k=opts.get("scale",1);var a=opts.get("a",1)
	var w=semantics.call_value(font.textWidth,[value,name])*k
	var left=M.js_round(x-w/2 if opts.get("align")=="center" else x-w if opts.get("align")=="right" else x);var top=M.js_round(y)
	if opts.get("outline")!=null:
		semantics.call_value(font.rasterText,[value,name,func(gx,gy):rect(left+gx*k-1,top+gy*k-1,k+2,k+2,opts.outline,a)])
	if opts.get("shadow")!=null:
		semantics.call_value(font.rasterText,[value,name,func(gx,gy):rect(left+gx*k+1,top+gy*k+1,k,k,opts.shadow,a)])
	semantics.call_value(font.rasterText,[value,name,func(gx,gy):rect(left+gx*k,top+gy*k,k,k,evaluate(c,[gx,gy]),a)])

func glow(x: float, y: float, r: float, c: int, k: float = 0.5) -> void:
	if weather_clipped and (sn!=0 or cs!=1 or tx!=floor(tx) or ty!=floor(ty)):
		weather_glow(x,y,r,c,k);return
	if clipped and (sn!=0 or cs!=1):
		super(x,y,r,c,k);return
	if r < 1 or k <= 0.004: return
	var cx:float=to_x(x,y);var cy:float=to_y(x,y)
	var rows:Array=glow_geometry(cx,cy,r)
	var buffer:PackedInt64Array=frame.light;frame.light=PackedInt64Array();var multiplier:float=fade*light_k
	var start_x:int=floori(cx-r);var start_y:int=floori(cy-r)
	if not rows.is_empty():
		for sy in range(maxi(frame.oy,floori(cy-r)), mini(frame.oy+frame.h-1,ceili(cy+r))+1):
			var weights:PackedFloat64Array=rows[sy-start_y]
			for sx in range(maxi(frame.ox,floori(cx-r)), mini(frame.ox+frame.w-1,ceili(cx+r))+1):
				if clipped and not inside(sx,sy):continue
				var weight:float=weights[sx-start_x]
				if weight<0:continue
				var strength:float=(weight*k)*multiplier
				if strength<=0.004:continue
				var index:int=(sy-frame.oy)*frame.w+sx-frame.ox;var previous_light:int=buffer[index]
				buffer[index]=0xff000000|(int(minf(255,((previous_light>>16)&255)+((c>>16)&255)*strength))<<16)|(int(minf(255,((previous_light>>8)&255)+((c>>8)&255)*strength))<<8)|int(minf(255,(previous_light&255)+(c&255)*strength))
	else:
		for sy in range(maxi(frame.oy,floori(cy-r)), mini(frame.oy+frame.h-1,ceili(cy+r))+1):
			var dy:float=(sy+0.5-cy)/r
			for sx in range(maxi(frame.ox,floori(cx-r)), mini(frame.ox+frame.w-1,ceili(cx+r))+1):
				if clipped and not inside(sx,sy):continue
				var dx:float=(sx+0.5-cx)/r;var d:float=dx*dx+dy*dy
				if d>=1:continue
				var f:float=1-sqrt(d);var strength:float=(f*f*k)*multiplier
				if strength<=0.004:continue
				var index:int=(sy-frame.oy)*frame.w+sx-frame.ox;var previous_light:int=buffer[index]
				buffer[index]=0xff000000|(int(minf(255,((previous_light>>16)&255)+((c>>16)&255)*strength))<<16)|(int(minf(255,((previous_light>>8)&255)+((c>>8)&255)*strength))<<8)|int(minf(255,(previous_light&255)+(c&255)*strength))
	frame.light=buffer
	if frame.track_writes:
		var lower=Vector2i(maxi(0,floori(cx-r)-frame.ox),maxi(0,floori(cy-r)-frame.oy))
		var upper=Vector2i(mini(frame.w-1,ceili(cx+r)-frame.ox),mini(frame.h-1,ceili(cy+r)-frame.oy))
		if lower.x<=upper.x and lower.y<=upper.y:frame.touch(lower.x,lower.y);frame.touch(upper.x,upper.y)
func weather_glow(x:float,y:float,r:float,c:int,k:float) -> void:
	# Weather's upstream override samples local cells before placement, including rotation.
	if r<1 or k<=0.004:return
	var x0:int=maxi(int(clip_bounds.position.x),floori(x-r));var x1:int=mini(int(clip_bounds.end.x)-1,ceili(x+r))
	var y0:int=maxi(int(clip_bounds.position.y),floori(y-r));var y1:int=mini(int(clip_bounds.end.y)-1,ceili(y+r))
	var buffer:PackedInt64Array=frame.light;frame.light=PackedInt64Array();var multiplier:float=fade*light_k
	for py in range(y0,y1+1):
		var dy:float=(py+0.5-y)/r
		for px in range(x0,x1+1):
			var dx:float=(px+0.5-x)/r;var d:float=dx*dx+dy*dy
			if d>=1:continue
			var f:float=1-sqrt(d);var strength:float=(f*f*k)*multiplier
			if strength<=0.004:continue
			var sx:int=floori(tx+(px+0.5)*fx*cs-(py+0.5)*sn);var sy:int=floori(ty+(px+0.5)*fx*sn+(py+0.5)*cs)
			var lx:int=sx-frame.ox;var ly:int=sy-frame.oy
			if lx<0 or ly<0 or lx>=frame.w or ly>=frame.h or not inside(sx,sy):continue
			var index:int=ly*frame.w+lx;var previous:int=buffer[index]
			buffer[index]=0xff000000|(int(minf(255,((previous>>16)&255)+((c>>16)&255)*strength))<<16)|(int(minf(255,((previous>>8)&255)+((c>>8)&255)*strength))<<8)|int(minf(255,(previous&255)+(c&255)*strength))
			if frame.track_writes:frame.touch(lx,ly)
	frame.light=buffer

func glow_line(x0: float,y0: float,x1: float,y1: float,r: float,c: int,k: float=0.5) -> void:
	if clipped and (sn!=0 or cs!=1):
		super(x0,y0,x1,y1,r,c,k);return
	if r < 1 or k <= 0.004: return
	var buffer:PackedInt64Array=frame.light;frame.light=PackedInt64Array();var multiplier:float=fade*light_k
	var ax := to_x(x0,y0); var ay := to_y(x0,y0); var bx := to_x(x1,y1); var by := to_y(x1,y1)
	var dx := bx-ax; var dy := by-ay; var l2 := dx*dx+dy*dy
	if l2 == 0: l2=1e-9
	for sy in range(maxi(frame.oy,floori(minf(ay,by)-r)),mini(frame.oy+frame.h-1,ceili(maxf(ay,by)+r))+1):
		for sx in range(maxi(frame.ox,floori(minf(ax,bx)-r)),mini(frame.ox+frame.w-1,ceili(maxf(ax,bx)+r))+1):
			if clipped and not inside(sx,sy):continue
			var px_value := sx+0.5; var py_value := sy+0.5
			var u := clampf(((px_value-ax)*dx+(py_value-ay)*dy)/l2,0,1)
			var ex := ax+dx*u-px_value; var ey := ay+dy*u-py_value
			var d := sqrt(ex*ex+ey*ey)/r
			if d >= 1: continue
			var f := 1-d
			var strength:float=(f*f*k)*multiplier
			if strength<=0.004:continue
			var index:int=(sy-frame.oy)*frame.w+sx-frame.ox;var previous_light:int=buffer[index]
			buffer[index]=0xff000000 | (int(minf(255,((previous_light>>16)&255)+((c>>16)&255)*strength))<<16) | (int(minf(255,((previous_light>>8)&255)+((c>>8)&255)*strength))<<8) | int(minf(255,(previous_light&255)+(c&255)*strength))
	frame.light=buffer
	if frame.track_writes:
		var lower=Vector2i(maxi(0,floori(minf(ax,bx)-r)-frame.ox),maxi(0,floori(minf(ay,by)-r)-frame.oy))
		var upper=Vector2i(mini(frame.w-1,ceili(maxf(ax,bx)+r)-frame.ox),mini(frame.h-1,ceili(maxf(ay,by)+r)-frame.oy))
		if lower.x<=upper.x and lower.y<=upper.y:frame.touch(lower.x,lower.y);frame.touch(upper.x,upper.y)


func glow_ring(x: float,y: float,radius: float,r: float,c: int,k: float=0.5) -> void:
	if clipped and (sn!=0 or cs!=1):
		super(x,y,radius,r,c,k);return
	if r < 1 or k <= 0.004: return
	var buffer:PackedInt64Array=frame.light;frame.light=PackedInt64Array();var multiplier:float=fade*light_k
	var cx := to_x(x,y); var cy := to_y(x,y); var e := radius+r
	for sy in range(maxi(frame.oy,floori(cy-e)),mini(frame.oy+frame.h-1,ceili(cy+e))+1):
		for sx in range(maxi(frame.ox,floori(cx-e)),mini(frame.ox+frame.w-1,ceili(cx+e))+1):
			if clipped and not inside(sx,sy):continue
			var dx := sx+0.5-cx; var dy := sy+0.5-cy
			var d := absf(sqrt(dx*dx+dy*dy)-radius)/r
			if d >= 1: continue
			var f := 1-d
			var strength:float=(f*f*k)*multiplier
			if strength<=0.004:continue
			var index:int=(sy-frame.oy)*frame.w+sx-frame.ox;var previous_light:int=buffer[index]
			buffer[index]=0xff000000 | (int(minf(255,((previous_light>>16)&255)+((c>>16)&255)*strength))<<16) | (int(minf(255,((previous_light>>8)&255)+((c>>8)&255)*strength))<<8) | int(minf(255,(previous_light&255)+(c&255)*strength))

	frame.light=buffer
	if frame.track_writes:
		var lower=Vector2i(maxi(0,floori(cx-e)-frame.ox),maxi(0,floori(cy-e)-frame.oy))
		var upper=Vector2i(mini(frame.w-1,ceili(cx+e)-frame.ox),mini(frame.h-1,ceili(cy+e)-frame.oy))
		if lower.x<=upper.x and lower.y<=upper.y:frame.touch(lower.x,lower.y);frame.touch(upper.x,upper.y)


func _touch_box(x0: int,y0: int,x1: int,y1: int) -> void:
	if frame.track_writes and x0<=x1 and y0<=y1:frame.touch(x0,y0);frame.touch(x1,y1)
func disc(cx:float,cy:float,r:float,c,a) -> void:
	if clipped or c is Callable or a is Callable or sn!=0:
		super(cx,cy,r,c,a);return
	if r<0.5:blend(cx,cy,c,a);return
	var alpha:float=a*fade;var color_value:int=c
	if color_value==0 or alpha<=0.004:return
	var ax=to_x(cx-r,cy-r);var bx=to_x(cx+r,cy+r)
	var x0=maxi(floori(minf(ax,bx)),frame.ox);var x1=mini(ceili(maxf(ax,bx)),frame.ox+frame.w-1)
	var y0=maxi(floori(ty+cy-r),frame.oy);var y1=mini(ceili(ty+cy+r),frame.oy+frame.h-1)
	var buffer:PackedInt64Array=frame.color;frame.color=PackedInt64Array();var radius2:float=r*r;var transparent_color=((int(alpha*255)&255)<<24)|(color_value&0xffffff)
	for sy in range(y0,y1+1):
		var dy=(sy+0.5-ty)-cy;var dy2=dy*dy
		for sx in range(x0,x1+1):
			var dx=(sx+0.5-tx)*fx-cx
			if dx*dx+dy2>radius2:continue
			var index:int=(sy-frame.oy)*frame.w+sx-frame.ox;var previous:int=buffer[index]
			if previous==0:buffer[index]=transparent_color;continue
			var da=((previous>>24)&255)/255.0;var oa=alpha+da*(1-alpha);var ratio=alpha/oa
			buffer[index]=((int(oa*255)&255)<<24)|((int(((color_value>>16)&255)*ratio+((previous>>16)&255)*(1-ratio))&255)<<16)|((int(((color_value>>8)&255)*ratio+((previous>>8)&255)*(1-ratio))&255)<<8)|(int((color_value&255)*ratio+(previous&255)*(1-ratio))&255)
	frame.color=buffer;_touch_box(x0-frame.ox,y0-frame.oy,x1-frame.ox,y1-frame.oy)
func circle(cx:float,cy:float,r:float,c,a=1.0) -> void:
	if clipped or c is Callable or a is Callable or sn!=0:
		super(cx,cy,r,c,a);return
	if r<0.6:dot(cx,cy,c,a);return
	var alpha:float=a*fade;var color_value:int=c
	if color_value==0:return
	var ax=to_x(cx-r,cy-r);var bx=to_x(cx+r,cy+r)
	var x0=maxi(floori(minf(ax,bx)),frame.ox);var x1=mini(ceili(maxf(ax,bx)),frame.ox+frame.w-1)
	var y0=maxi(floori(ty+cy-r),frame.oy);var y1=mini(ceili(ty+cy+r),frame.oy+frame.h-1)
	var buffer:PackedInt64Array=frame.color;frame.color=PackedInt64Array();var radius2:float=r*r
	for sy in range(y0,y1+1):
		var dy=(sy+0.5-ty)-cy;var dy2=dy*dy
		for sx in range(x0,x1+1):
			var dx=(sx+0.5-tx)*fx-cx
			if dx*dx+dy2>radius2 or alpha<1 and alpha<=(BAYER[((sy&3)<<2)|(sx&3)]+0.5)/16.0:continue
			buffer[(sy-frame.oy)*frame.w+sx-frame.ox]=color_value
	frame.color=buffer;_touch_box(x0-frame.ox,y0-frame.oy,x1-frame.ox,y1-frame.oy)

# Avoid per-pixel transform method dispatch while retaining the same arithmetic order.
func each(x0:float,y0:float,x1:float,y1:float,fn:Callable) -> void:
	var ax=INF;var bx=-INF;var ay=INF;var by=-INF
	for k in range(4):
		var x:float=x1 if k&1 else x0;var y:float=y1 if k&2 else y0
		var sx:float=tx+x*fx*cs-y*sn;var sy:float=ty+x*fx*sn+y*cs
		ax=minf(ax,sx);bx=maxf(bx,sx);ay=minf(ay,sy);by=maxf(by,sy)
	for sy in range(maxi(floori(ay),frame.oy),mini(ceili(by),frame.oy+frame.h-1)+1):
		for sx in range(maxi(floori(ax),frame.ox),mini(ceili(bx),frame.ox+frame.w-1)+1):
			var dx:float=sx+0.5-tx;var dy:float=sy+0.5-ty
			fn.call((dx*cs+dy*sn)*fx,-dx*sn+dy*cs,sx,sy)
func line(x0:float,y0:float,x1:float,y1:float,c,a=1.0) -> void:
	if c is Callable or a is Callable:
		super(x0,y0,x1,y1,c,a);return
	var sx=cell_x(x0,y0);var sy=cell_y(x0,y0);var ex=cell_x(x1,y1);var ey=cell_y(x1,y1)
	var dx=absi(ex-sx);var dy=-absi(ey-sy);var stepx=1 if sx<ex else -1;var stepy=1 if sy<ey else -1;var err=dx+dy
	while true:
		put(sx,sy,c,a)
		if sx==ex and sy==ey:break
		var e2=2*err
		if e2>=dy:err+=dy;sx+=stepx
		if e2<=dx:err+=dx;sy+=stepy

func pixel_span(x0:int,x1:int,y:int,c:int)->void:
	if clipped or sn!=0 or fade<1:
		for x in range(x0,x1+1):px(x,y,c)
		return
	if c==0:return
	var sy:int=floori(ty+y+0.5)-frame.oy
	if sy<0 or sy>=frame.h:return
	var ax:int=floori(tx+(x0+0.5)*fx)-frame.ox;var bx:int=floori(tx+(x1+0.5)*fx)-frame.ox
	var left:int=maxi(0,mini(ax,bx));var right:int=mini(frame.w-1,maxi(ax,bx));var row:int=sy*frame.w
	var buffer:PackedInt64Array=frame.color;frame.color=PackedInt64Array()
	for x in range(left,right+1):buffer[row+x]=c
	frame.color=buffer
	_touch_box(left,sy,right,sy)
func light(x:float,y:float,c:int,k:float=1)->void:
	var lx:float=floor(x)+0.5;var ly:float=floor(y)+0.5
	add(floori(tx+lx*fx*cs-ly*sn),floori(ty+lx*fx*sn+ly*cs),c,k)

static func glow_geometry(cx:float,cy:float,r:float)->Array:
	var geometry_key=var_to_bytes([cx,cy,r]);var rows:Array=[]
	if r>=16 and r<=128 and cx==floor(cx) and cy==floor(cy) and r==floor(r):
		if _glow_rows.has(geometry_key):rows=_glow_rows[geometry_key]
		else:
			for row_y in range(floori(cy-r),ceili(cy+r)+1):
				var dy:float=(row_y+0.5-cy)/r;var samples=PackedFloat64Array()
				for row_x in range(floori(cx-r),ceili(cx+r)+1):
					var dx:float=(row_x+0.5-cx)/r;var d:float=dx*dx+dy*dy
					if d>=1:samples.append(-1);continue
					var f:float=1-sqrt(d);samples.append(f*f)
				rows.append(samples)
			if _glow_rows.size()>=32:_glow_rows.clear()
			_glow_rows[geometry_key]=rows
	return rows
