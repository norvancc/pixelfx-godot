@tool
extends RefCounted
## Direct geometry tests for procedural wings and dark-star masks.
const M=preload("../core/math.gd")
const Bridge=preload("../effects/simulation_bridge.gd")
const Painter=preload("painter.gd")
static func melee_smear(_e,a,_receiver):
	var p:Painter=a[0];var s:Dictionary=a[1];var u0:float=a[2];var u1:float=a[3];var width:float=a[4];var fn=a[5];var half:int=a[6] if a.size()>6 else 0;var pad:float=a[7] if a.size()>7 else 1
	if u1-u0<0.005:return
	var c:float=cos(s.rot);var n:float=sin(s.rot);var extent:float=s.R+pad+1;var bn:float=extent*s.sy+s.k*(width+2);var hx:float=Bridge.hypot([extent*c,bn*n])+1;var hy:float=Bridge.hypot([extent*n,bn*c])+1;var inner:float=s.R-width-1;var over:float=absf(n)*extent+s.k*(width+2)+2;var y0:float=s.cy-over if half>0 else s.cy-hy;var y1:float=s.cy+over if half<0 else s.cy+hy;var cx:float=s.cx;var cy:float=s.cy;var scale_y:float=s.sy;var cone:float=s.k;var radius:float=s.R;var direction:float=s.dir;var start_angle:float=s.a0;var semantics=load("res://addons/pixelfx/native/semantics.gd");var out={"c":0,"a":1.0,"l":0,"k":0.0}
	p.each(cx-hx,y0,cx+hx,y1,func(x:float,y:float,sx:int,sy:int):
		var dx:float=x-cx;var dy:float=y-cy;var lx:float=dx*c+dy*n;var ly:float=-dx*n+dy*c;var r:float;var angle:float
		if cone==0:r=Bridge.hypot([lx,ly/scale_y]);angle=atan2(ly/scale_y,lx)
		else:
			var m:float=ly+cone*radius;var aa:float=scale_y*scale_y-cone*cone;var bb:float=2*m*cone;var cc:float=lx*lx*scale_y*scale_y+m*m;r=(-bb+sqrt(bb*bb+4*aa*cc))/(2*aa);angle=atan2((m-cone*r)/scale_y,lx)
		if r>radius+pad or r<inner or half!=0 and (-1 if sin(angle)<0 else 1)!=half:return
		var u:float=fmod(direction*(angle-start_angle),TAU)
		if u<0:u+=TAU
		while u<u0:u+=TAU
		if u>u1:return
		out.c=0;out.a=1.0;out.l=0;out.k=0.0
		var result=semantics.call_value(fn,[u,r,out,angle]);var color:int=result if semantics.truth(result) else out.c
		if color:p.put(sx,sy,color,out.a)
		if out.k>0:p.add(sx,sy,out.l if out.l else color,out.k)
	)
static func impact_frame_draw(e,a,_receiver):
	var semantics=load("res://addons/pixelfx/native/semantics.gd");var t:float=semantics.read(e,"t");var frame:int=floori(t/(1.0/30)+1e-6)
	if frame>=8:return
	var p:Painter=a[0];var width:int=semantics.read(e,"W");var height:int=semantics.read(e,"H");var x0:float=semantics.read(e,"x0");var y0:float=semantics.read(e,"y0");var mask:PackedInt64Array=semantics.read(e,"masks")[frame].ints;var inverted:bool=frame==2 or frame==3;var paper:int=semantics.read(e,"PAPER");var ink:int=paper if inverted else semantics.read(e,"INK");var fill:int=semantics.read(e,"INK") if inverted else paper
	p.each(x0,y0,x0+width,y0+height,func(x:float,y:float,sx:int,sy:int):
		var i:int=floori(x-x0);var j:int=floori(y-y0)
		if i<0 or j<0 or i>=width or j>=height:return
		var value:int=mask[j*width+i];var color:int=ink if value==1 else (fill if frame<4 else paper) if value==2 else 0
		if color:p.put(sx,sy,color)
	)
static func edge_distance(_e,a,_r):
	var points:Array=a[0];var x:float=a[1];var y:float=a[2];var distance:float=INF;var previous:int=points.size()-1
	for i in range(points.size()):
		var ax:float=points[previous][0];var ay:float=points[previous][1];var bx:float=points[i][0];var by:float=points[i][1];var dx:float=bx-ax;var dy:float=by-ay;var length:float=dx*dx+dy*dy
		if length==0:length=1
		var u:float=clampf(((x-ax)*dx+(y-ay)*dy)/length,0,1);var px:float=ax+dx*u-x;var py:float=ay+dy*u-y
		distance=minf(distance,Bridge.hypot([px,py]));previous=i
	return distance
static func in_star(_e,a,_r):return star_contains(a[0],a[1],a[2],a[3],a[4],a[5],a[6] if a.size()>6 else 0.42)
static func star_contains(x:float,y:float,cx:float,cy:float,length:float,angle:float,q:float)->bool:
	if length<=0:return false
	var c:float=cos(angle);var s:float=sin(angle);var dx:float=x-cx;var dy:float=y-cy;var u:float=absf(dx*c+dy*s)/length;var v:float=absf(-dx*s+dy*c)/length
	return u<1 and v<1 and minf(u,v)<=pow(0.5,1/q) and pow(u,q)+pow(v,q)<=1
class StarMask:
	extends RefCounted
	var center_y:float
	var radius:int
	var width:int
	var data:PackedByteArray=[]
	func at(x:float,y:float)->bool:
		var i:int=floori(x)+radius;var j:int=floori(y-center_y)+radius
		return i>=0 and j>=0 and i<width and j<width and data[j*width+i]==1
	func draw(p:Painter,color:int,rim:int,skip)->void:
		var semantics=load("res://addons/pixelfx/native/semantics.gd")
		for j in range(width):
			for i in range(width):
				var x:float=i-radius+0.5;var y:float=center_y+j-radius+0.5
				if data[j*width+i]:p.px(x,y,color)
				elif rim and not semantics.truth(semantics.call_value(skip,[x,y])) and (at(x-1,y) or at(x+1,y) or at(x,y-1) or at(x,y+1)):p.px(x,y,rim)
	func unlight(p:Painter)->void:
		for j in range(width):
			for i in range(width):
				if not data[j*width+i]:continue
				var x:float=i-radius+0.5;var y:float=center_y+j-radius+0.5;var sx:int=p.cell_x(x,y)-p.frame.ox;var sy:int=p.cell_y(x,y)-p.frame.oy
				if sx>=0 and sy>=0 and sx<p.frame.w and sy<p.frame.h:p.frame.light[sy*p.frame.w+sx]=0
static func black_star(_e,a,_r):
	var cy:float=a[0];var length:float=a[1];var angle:float=a[2];var short_arm:float=a[3] if a.size()>3 else 0.46;var q:float=a[4] if a.size()>4 else 0.32
	var result=StarMask.new();result.center_y=cy;result.radius=ceili(length)+2;result.width=result.radius*2+1;result.data.resize(result.width*result.width)
	for j in range(result.width):
		for i in range(result.width):
			var x:float=i-result.radius+0.5;var y:float=cy+j-result.radius+0.5
			if star_contains(x,y,0,cy,length,angle,q) or star_contains(x,y,0,cy,length*short_arm,angle+PI/4,q):result.data[j*result.width+i]=1
	for arm in range(4):
		var ca:float=cos(angle+(arm*PI)/2);var sa:float=sin(angle+(arm*PI)/2);var d:float=0
		while d<length-1:
			var i:int=floori(ca*d)+result.radius;var j:int=floori(sa*d)+result.radius;result.data[j*result.width+i]=1;d+=0.5
	# Callable targets are weak; the returned value owns the procedural mask.
	return {"R0":result.radius,"at":result.at,"draw":result.draw,"unlight":result.unlight,"__native_owner":result}

static func impact_frame_masks(e):
	var semantics=load("res://addons/pixelfx/native/semantics.gd");var width:int=semantics.read(e,"W");var height:int=semantics.read(e,"H");var x0:float=semantics.read(e,"x0");var y0:float=semantics.read(e,"y0");var sets:Array=semantics.read(e,"sets");var jitter:Array=semantics.read(e,"jit");var phases:Array=semantics.read(e,"ph");var masks:Array=semantics.read(e,"masks")
	for frame in range(8):
		var data:PackedInt64Array=[];data.resize(width*height);var wedges:Array=sets[frame%2];var count:int=wedges.size();var jx:float=jitter[frame%2][0] if frame<4 else 0;var jy:float=jitter[frame%2][1] if frame<4 else 0;var reach:float=0 if frame<4 else pow((frame-3)/4.5,1.5);var thin:float=1 if frame<4 else 1-(frame-3)/5.5
		for j in range(height):
			for i in range(width):
				var x:float=x0+i+0.5-jx;var y:float=y0+j+0.5-jy;var radius:float=Bridge.hypot([x,y*1.35]);var angle:float=atan2(y*1.35,x);var slot:int=floori((fmod(fmod(angle,TAU)+TAU,TAU))/(TAU/count));var line:bool=false
				for k in range(-1,2):
					if line:break
					var wedge:Dictionary=wedges[posmod(slot+k+count,count)];var delta:float=fmod(fmod(angle-wedge.a,TAU)+TAU,TAU)
					if delta>PI:delta=TAU-delta
					var inner:float=wedge.inner+reach*150;var half:float=wedge.w*clampf((radius-inner)/40,0,1)*thin;line=radius>inner and delta*radius<maxf(0.5,half)
				if frame<4:
					var central_radius:float=Bridge.hypot([x,y*1.1]);var a:float=atan2(y*1.1,x);var phase:float=phases[frame];var spikes:float=10+6*absf(sin(a*5+phase))+4*absf(sin(a*11+phase*2.7))+2*sin(a*23+phase);var core:float=spikes*(0.85 if frame==0 else 1+frame*0.08)
					data[j*width+i]=(2 if central_radius<4+frame else 1) if central_radius<core else 1 if line else 2
				else:data[j*width+i]=2 if line else 0
		var buffer=semantics.Buffer.new("Uint8Array");buffer.ints=data;masks.append(buffer)
