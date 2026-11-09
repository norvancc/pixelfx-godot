@tool
extends "../core/painter.gd"
## Additional upstream Painter APIs required by actor, UI and transition ports.
var clipped: bool = false
var clip_bounds=Rect2(0,0,320,180)
func _init(target, clip_screen=false):
	super(target)
	clipped=clip_screen
func inside(sx,sy) -> bool:
	var lx=from_x(sx+0.5,sy+0.5);var ly=from_y(sx+0.5,sy+0.5)
	return lx>=clip_bounds.position.x and ly>=clip_bounds.position.y and lx<clip_bounds.end.x and ly<clip_bounds.end.y
func put(sx: int,sy: int,c: int,a: float=1) -> void:
	if not clipped or inside(sx,sy):super(sx,sy,c,a)
func add(sx: int,sy: int,c: int,k: float=1) -> void:
	if not clipped or inside(sx,sy):super(sx,sy,c,k)
func blend_px(sx: int,sy: int,c: int,a: float) -> void:
	if not clipped or inside(sx,sy):super(sx,sy,c,a)
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
