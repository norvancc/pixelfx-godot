@tool
extends RefCounted
## Merged smoke density and lighting, retaining each Float32 accumulation.
const C=preload("../core/color.gd")
const Painter=preload("painter.gd")
static func _blur(source:PackedFloat32Array,width:int,height:int,step:int,radius:int)->PackedFloat32Array:
	var result:PackedFloat32Array=[];result.resize(source.size());var count:int=width if step==1 else height;var lines:int=height if step==1 else width;var inverse:float=1.0/(2*radius+1)
	for line in range(lines):
		var base:int=line*width if step==1 else line;var accumulator:float=0
		for j in range(-radius,radius+1):
			if j>=0 and j<count:accumulator+=source[base+j*step]
		for j in range(count):
			result[base+j*step]=accumulator*inverse;var previous:int=j-radius;var next:int=j+radius+1
			if previous>=0:accumulator-=source[base+previous*step]
			if next<count:accumulator+=source[base+next*step]
	return result
static func cloud(_e,a,_receiver):
	var p:Painter=a[0];var list:Array=a[1];var ramp:Array=a[2];var warm:Array=a[3];var options:Dictionary=a[4] if a.size()>4 else {};var density:float=options.get("dens",1.5);var maximum:float=options.get("max",0.86);var clip=options.get("clip");var lit:float=options.get("lit",1)
	if list.is_empty():return
	var x0:int=2147483647;var y0:int=2147483647;var x1:int=-2147483647;var y1:int=-2147483647
	for puff in list:x0=mini(x0,floori(puff.x-puff.r));x1=maxi(x1,ceili(puff.x+puff.r));y0=mini(y0,floori(puff.y-puff.r));y1=maxi(y1,ceili(puff.y+puff.r))
	var width:int=x1-x0+3;var height:int=y1-y0+3;var depths:PackedFloat32Array=[];depths.resize(width*height);var levels:PackedFloat32Array=[];levels.resize(width*height);var fire:PackedFloat32Array=[];fire.resize(width*height);x0-=1;y0-=1
	for puff in list:
		var radius:float=puff.r;var radius2:float=radius*radius;var px:float=puff.x;var py:float=puff.y;var alpha:float=puff.a;var brightness:float=puff.b;var heat:float=puff.w
		for y in range(floori(py-radius),ceili(py+radius)+1):
			var dy:float=y+0.5-py
			for x in range(floori(px-radius),ceili(px+radius)+1):
				var dx:float=x+0.5-px;var d2:float=(dx*dx+dy*dy)/radius2
				if d2>=1:continue
				var k:float=sqrt(1-d2)*alpha;var index:int=(y-y0)*width+x-x0
				depths[index]+=k;levels[index]+=k*brightness;fire[index]+=k*heat*(0.5+0.5*clampf(0.5+dx/radius,0,1))
	var blurred:PackedFloat32Array=_blur(_blur(depths,width,height,1,2),width,height,width,2);var count:int=ramp.size();var semantics=load("res://addons/pixelfx/native/semantics.gd")
	p.each(x0+1,y0+1,x1+1,y1+1,func(lx:float,ly:float,sx:int,sy:int):
		var cx:int=floori(lx)-x0;var cy:int=floori(ly)-y0
		if cx<1 or cy<1 or cx>=width-1 or cy>=height-1:return
		var index:int=cy*width+cx;var depth:float=depths[index]
		if depth<0.05 or clip!=null and not semantics.truth(semantics.call_value(clip,[lx,ly])):return
		var alpha:float=minf(maximum,ceili((1-exp(-depth*density))*6)/6.0)
		if alpha<0.15:return
		var gy:float=blurred[index+width]-blurred[index-width];var gx:float=blurred[index+1]-blurred[index-1];var up:float=clampf(0.5+atan((gy*0.9+gx*0.35)/(blurred[index]*0.16+0.03))*0.42*lit,0,1);var heat:float=fire[index]/depth;var level:int=clampi(floori((levels[index]/depth)*(0.3+0.7*up)*(count-1)+0.25+heat*1.5+0.5),0,count-1)
		p.blend_px(sx,sy,C.mix(ramp[level],warm[level],minf(0.9,ceili(heat*10)/10.0)) if heat>0.03 else ramp[level],alpha)
	)
