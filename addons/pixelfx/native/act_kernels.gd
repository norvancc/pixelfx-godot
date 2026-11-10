@tool
extends RefCounted
## Pixel transfer for the pinned actor choreography; pose/simulation state stays in its lexical scope.
const Frame=preload("../core/frame.gd")
const Painter=preload("painter.gd")
const M=preload("../core/math.gd")
const C=preload("../core/color.gd")
static func _s():return load("res://addons/pixelfx/native/semantics.gd")
static func _read(e,key):return _s().read(e,key)
static func _call(fn,a):return _s().call_value(fn,a)
static func _invoke(o,key,a):return _s().invoke(o,key,a)
static func _copy(target:Frame,field:String,sx:int,sy:int,value:int,fx:int,fy:int,rx:int,ry:int,lean:float,crouch:float,flip:bool):
	var ly:int=sy-fy;var k:float=clampf((-11.0-ly)/7,0,1);var f:float=clampf((-1.0-ly)/6,0,1)
	var dx:int=M.js_round(lean*k+rx*f);var dy:int=M.js_round(crouch*k+ry*f);var px:int=sx+(-dx if flip else dx);var py:int=sy+dy
	if px<0 or py<0 or px>=target.w or py>=target.h:return
	var i:int=py*target.w+px
	if field=="light":
		var previous:int=target.light[i]
		target.light[i]=0xff000000|(mini(255,((previous>>16)&255)+((value>>16)&255))<<16)|(mini(255,((previous>>8)&255)+((value>>8)&255))<<8)|mini(255,(previous&255)+(value&255))
	elif ((value>>24)&255)==255 or target.color[i]==0:target.color[i]=value
	else:
		var blend:float=((value>>24)&255)/255.0;var previous:int=target.color[i]
		target.color[i]=(maxi((value>>24)&255,(previous>>24)&255)<<24)|(M.js_round(((value>>16)&255)*blend+((previous>>16)&255)*(1-blend))<<16)|(M.js_round(((value>>8)&255)*blend+((previous>>8)&255)*(1-blend))<<8)|M.js_round((value&255)*blend+(previous&255)*(1-blend))
static func _paint(frame:Frame,pose:Dictionary,i:int,color:int,bx:int,by:int,mirror:bool,ghosts:bool):
	var px:int=bx-int(_s().prop(pose.xs,i))-1 if mirror else bx+int(_s().prop(pose.xs,i));var py:int=by+int(_s().prop(pose.ys,i))
	if px<0 or py<0 or px>=frame.w or py>=frame.h:return
	frame.color[py*frame.w+px]=color
	if ghosts:frame.light[py*frame.w+px]=0
static func _luma(value:int)->float:return (0.3*(value&255)+0.59*((value>>8)&255)+0.11*((value>>16)&255))/255
static func _carry(value:int,rest:int,own:int)->int:
	var luminance:float=_luma(value)
	if luminance>0.9 or ((value>>24)&255)<255:return value
	var k:float=maxf(0.45,minf(1.5,_luma(own)/maxf(0.08,_luma(rest))))
	return 0xff000000|(mini(255,M.js_round(((value>>16)&255)*k))<<16)|(mini(255,M.js_round(((value>>8)&255)*k))<<8)|mini(255,M.js_round((value&255)*k))
static func draw(e,args,_receiver):
	var frame:Frame=args[0];var opts:Dictionary=args[1] if args.size()>1 else {};var body:bool=opts.get("body",true);var show_target:bool=opts.get("target",true)
	var semantics=_s();var q=_read(e,"last")
	if q==null:q=_call(_read(e,"poseNow"),[])
	var active:bool=_read(e,"t")>=0;var fx=_read(e,"fx");var act:Dictionary=_read(e,"a");var meta:Dictionary=_read(e,"meta");var module:Dictionary=_read(e,"mod");var flip:bool=_read(e,"flip")
	var origin_x:int=_read(e,"X");var origin_y:int=_read(e,"Y");var fx_x:int=origin_x-frame.ox;var fx_y:int=origin_y-frame.oy;var targets:Array=_read(e,"targets") if show_target else [];var specks:Array=_read(e,"specks");var ghosts:Array=_read(e,"ghosts")
	var draw_targets=func():
		for target in targets:_invoke(target,"draw",[semantics.frame_buffer(frame,"color"),frame.w,frame.h,fx_x,fx_y,flip])
	var draw_straw=func():
		for target in targets:_invoke(target,"drawStraw",[semantics.frame_buffer(frame,"color"),frame.w,frame.h,fx_x,fx_y,flip])
	var dust:Array=_read(e,"DUST")
	var draw_dust=func():
		for mote in specks:
			var color:int=mote.c if mote.c else dust[mini(3,floori((mote.age/mote.life)*4))];var lx:int=M.js_round(mote.x);var py:int=fx_y+M.js_round(mote.y)
			for i in range(2 if mote.big else 1):
				var px:int=fx_x-lx-i-1 if flip else fx_x+lx+i
				if px>=0 and py>=0 and px<frame.w and py<frame.h:frame.color[py*frame.w+px]=color
	if not body:
		if active:_invoke(fx,"draw",[frame,"back"])
		draw_targets.call()
		if active:_invoke(fx,"draw",[frame,"front"])
		draw_straw.call()
		if frame.track_writes:frame.touch(0,0);frame.touch(frame.w-1,frame.h-1)
		return
	var rx:int=M.js_round(q.get("x",0));var ry:int=M.js_round(q.get("y",0));var bx:int=fx_x+(-rx if flip else rx);var by:int=fx_y+ry;var pose:Dictionary=_call(_read(e,"posed"),[q])
	var shadow=func():
		var half:int=10+((int(absf(q.ffx-q.fbx)) if q.has("ffx") and q.has("fbx") else 0)>>1)-mini(8,int(absf(ry))>>1);var cx:int=fx_x+(-rx if flip else rx)
		if fx_y<0 or fx_y>=frame.h:return
		for dy in range(2):
			for x in range(-half+dy*2,half-dy*2+1):
				var px:int=cx+x;var index:int=(fx_y+dy)*frame.w+px
				if px<0 or px>=frame.w or fx_y+dy>=frame.h:continue
				frame.color[index]=(frame.color[index]&0xffffff)|(maxi((frame.color[index]>>24)&255,110)<<24)
	var ghost_color:int=_read(e,"gc")
	var draw_ghosts=func():
		for ghost in ghosts:
			var gr:Dictionary=_call(_read(e,"posed"),[ghost.q]);var gx:int=fx_x+(-M.js_round(ghost.q.get("x",0)) if flip else M.js_round(ghost.q.get("x",0)));var gy:int=fx_y+M.js_round(ghost.q.get("y",0));var k:float=0.5*(1-ghost.age/0.16)
			var red:float=(ghost_color&255)*k;var green:float=((ghost_color>>8)&255)*k;var blue:float=((ghost_color>>16)&255)*k
			for i in range(int(gr.n)):
				var px:int=gx-int(semantics.prop(gr.xs,i))-1 if flip else gx+int(semantics.prop(gr.xs,i));var py:int=gy+int(semantics.prop(gr.ys,i))
				if px<0 or py<0 or px>=frame.w or py>=frame.h:continue
				var index:int=py*frame.w+px;var previous:int=frame.light[index]
				frame.light[index]=0xff000000|(int(minf(255,((previous>>16)&255)+blue))<<16)|(int(minf(255,((previous>>8)&255)+green))<<8)|int(minf(255,(previous&255)+red))
	if not act.get("onBody",false):
		if active:_invoke(fx,"draw",[frame,"back"])
		draw_targets.call();shadow.call();draw_ghosts.call()
		for i in range(int(pose.n)):_paint(frame,pose,i,semantics.prop(pose.color,i),bx,by,flip,not ghosts.is_empty())
		if active:_invoke(fx,"draw",[frame,"front"])
		draw_straw.call();draw_dust.call()
		if frame.track_writes:frame.touch(0,0);frame.touch(frame.w-1,frame.h-1)
		return
	var scratch:Dictionary=_call(_read(e,"scratchFor"),[frame]);var back:Frame=scratch.a;var front:Frame=scratch.b;back.clear();front.clear()
	if active:_invoke(fx,"draw",[back,"back"])
	front.color=back.color.duplicate();front.light=back.light.duplicate()
	var t:float=_read(e,"t");var duration:float=_read(e,"D");var tt:float=(0 if t<0 else fmod(t,duration)) if meta.get("loop",false) else clampf(t,0,duration)
	var alpha:float=_call(_read(e,"actorAlphaOf"),[module,tt,fx.options]) if active else 1
	var actor=fx.options.get("actor")
	if actor==null:actor=_call(_read(e,"stockActor"),[2])
	var painter=Painter.new(front);painter.place(fx_x,fx_y,flip);_call(_read(e,"drawActor"),[painter,actor,alpha])
	if active:_invoke(fx,"draw",[front,"front"])
	var follow:float=act.get("follow",1);var lean:float=q.get("lean",0)*follow;var crouch:float=q.get("crouch",0)*follow
	var rest_mask:PackedInt64Array=_read(e,"REST_MASK").ints;var rest_pixels:PackedInt64Array=_read(e,"REST_PX").ints;var nearest:PackedInt64Array=_read(e,"NEAREST").ints
	draw_targets.call();shadow.call()
	for sy in range(frame.h):
		for sx in range(frame.w):
			var value:int=back.color[sy*frame.w+sx]
			if value!=0:_copy(frame,"color",sx,sy,value,fx_x,fx_y,rx,ry,lean,crouch,flip)
	draw_ghosts.call()
	for i in range(int(pose.n)):
		var source:int=semantics.prop(pose.src,i);var rest:int=nearest[source] if source>=0 else -1
		if rest<0:
			if alpha>0.5:_paint(frame,pose,i,semantics.prop(pose.color,i),bx,by,flip,not ghosts.is_empty())
			continue
		var col:int=rest%24;var row:int=rest/24;var sx:int=fx_x-(col-12)-1 if flip else fx_x+col-12;var sy:int=fx_y+row-38
		var value:int=front.color[sy*frame.w+sx] if sx>=0 and sy>=0 and sx<frame.w and sy<frame.h else rest_pixels[rest]
		if value==0:continue
		var own:int=semantics.prop(pose.color,i);_paint(frame,pose,i,own if value==rest_pixels[rest] else _carry(value,rest_pixels[rest],own),bx,by,flip,not ghosts.is_empty())
	for sy in range(frame.h):
		for sx in range(frame.w):
			var index:int=sy*frame.w+sx;var col:int=(fx_x-sx-1 if flip else sx-fx_x)+12;var row:int=sy-fx_y+38;var rest:bool=col>=0 and row>=0 and col<24 and row<38 and rest_mask[row*24+col]==1
			if front.color[index]!=0 and front.color[index]!=back.color[index] and not rest:_copy(frame,"color",sx,sy,front.color[index],fx_x,fx_y,rx,ry,lean,crouch,flip)
			if front.light[index]&0xffffff:_copy(frame,"light",sx,sy,front.light[index],fx_x,fx_y,rx,ry,lean,crouch,flip)
	draw_straw.call();draw_dust.call()
	if frame.track_writes:frame.touch(0,0);frame.touch(frame.w-1,frame.h-1)
