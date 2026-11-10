@tool
extends RefCounted
## Pinned stone rasterization, preserving per-pixel facets and Float32 row edges.
const M=preload("../core/math.gd")
const Bridge=preload("../effects/simulation_bridge.gd")
const Painter=preload("painter.gd")
static func _in_poly(points:Array,x:float,y:float)->bool:
	var inside:bool=false;var j:int=points.size()-1
	for i in range(points.size()):
		var xi:float=points[i][0];var yi:float=points[i][1];var xj:float=points[j][0];var yj:float=points[j][1]
		if (yi>y)!=(yj>y) and x<((xj-xi)*(y-yi))/(yj-yi)+xi:inside=not inside
		j=i
	return inside
static func _at(mask:PackedByteArray,i:int,j:int,n:int)->bool:return i>=0 and j>=0 and i<n and j<n and mask[j*n+i]==1
static func draw_rock(_e,a,_receiver):
	var p:Painter=a[0];var x:float=a[1];var y:float=a[2];var size:float=a[3];var angle:float=a[4];var points:Array=a[5];var ramp:Array=a[6];var alpha:float=a[7] if a.size()>7 else 1;var white:bool=a[8] if a.size()>8 else false;var top:int=ramp.size()-2
	if size<1.4:p.dot(x,y,ramp[top-1],alpha);p.dot(x+1,y,ramp[top-3],alpha);return
	var ca:float=cos(angle);var sa:float=sin(angle);var vertices:Array=[];var angles:PackedFloat64Array=[];var lit:PackedFloat64Array=[]
	for pt in points:vertices.append([(pt[0]*ca-pt[1]*sa)*size,(pt[0]*sa+pt[1]*ca)*size])
	for i in range(vertices.size()):
		var ax:float=vertices[i][0];var ay:float=vertices[i][1];var bx:float=vertices[(i+1)%vertices.size()][0];var by:float=vertices[(i+1)%vertices.size()][1];var ex:float=bx-ax;var ey:float=by-ay;var length:float=Bridge.hypot([ex,ey])
		if length==0:length=1
		var nx:float=ey/length;var ny:float=-ex/length
		if nx*(ax+bx)+ny*(ay+by)<0:nx=-nx;ny=-ny
		lit.append(nx* -0.6+ny* -0.8);angles.append(atan2(ay,ax))
	var x0:int=floori(x)-ceili(size*1.25)-1;var y0:int=floori(y)-ceili(size*1.25)-1;var n:int=mini(62,2*ceili(size*1.25)+3);var mask:PackedByteArray=[];mask.resize(n*n);var faces:PackedByteArray=[];faces.resize(n*n)
	for j in range(n):
		for i in range(n):
			var dx:float=x0+i+0.5-x;var dy:float=y0+j+0.5-y;var k:int=j*n+i
			if not _in_poly(vertices,dx,dy):continue
			mask[k]=1;var g:float=atan2(dy,dx)
			for q in range(angles.size()):
				var delta:float=fmod(g-angles[q],TAU);var span:float=fmod(angles[(q+1)%angles.size()]-angles[q],TAU)
				if delta<0:delta+=TAU
				if span<0:span+=TAU
				if delta<=span:faces[k]=q;break
	for j in range(-1,n+1):
		for i in range(-1,n+1):
			if not _at(mask,i,j,n):
				if _at(mask,i-1,j,n) or _at(mask,i+1,j,n) or _at(mask,i,j-1,n) or _at(mask,i,j+1,n):p.dot(x0+i,y0+j,ramp[0],alpha)
				continue
			if white:p.dot(x0+i,y0+j,0xffffffff,alpha);continue
			var light:float=lit[faces[j*n+i]];var color:int=ramp[top] if light>0.55 else ramp[top-1] if light>0.15 else ramp[top-2] if light> -0.3 else ramp[top-3]
			if not _at(mask,i-1,j,n) or not _at(mask,i+1,j,n) or not _at(mask,i,j-1,n) or not _at(mask,i,j+1,n):color=ramp[top+1] if light>0.3 else ramp[maxi(1,top-4)] if light< -0.2 else color
			p.dot(x0+i,y0+j,color,alpha)

class SpikeRows:
	extends RefCounted
	var left:PackedFloat32Array=[]
	var right:PackedFloat32Array=[]
	var u:PackedFloat32Array=[]
	var y0:int
	var clip:float
	var half:int
	func inside(px:int,py:int)->bool:
		var k:int=py-y0;var fx:float=px+0.5
		if k<0 or k>=u.size() or fx<left[k] or fx>right[k]:return false
		if clip<1 and u[k]>clip+(M.rand([px,77])-0.5)*0.07:return false
		if half==0:return true
		var q:float=((fx-left[k])/maxf(0.5,right[k]-left[k]))*2-1
		return q< -0.18 if half<0 else q>= -0.18
static func _half_width(u:float,side:int,width:float,notches:Array)->float:
	var value:float=(width/2)*pow(maxf(0,1-u),0.85)+0.3
	for notch in notches:
		if notch.side==side and u>notch.u and u<notch.u+0.07:value-=notch.d*(1-u*0.5)
	return maxf(0,value)
static func draw_spike(_e,a,_receiver):
	var p:Painter=a[0];var x:float=a[1];var base:float=a[2];var height:float=a[3];var width:float=a[4];var lean:float=a[5];var look:Dictionary=a[6];var ramp:Array=a[7];var opts:Dictionary=a[8] if a.size()>8 else {}
	if height<1.5:return
	var alpha:float=opts.get("a",1);var white:bool=opts.get("white",false);var glint:float=opts.get("glint",-1);var floor_y:float=opts.get("floor",INF);var rows=SpikeRows.new();rows.y0=floori(base-height)-2;rows.clip=opts.get("clip",1);rows.half=opts.get("half",0);var count:int=mini(400,ceili(base)-rows.y0+2);rows.left.resize(count);rows.right.resize(count);rows.u.resize(count)
	for k in range(count):
		var u:float=(base-(rows.y0+k+0.5))/height;rows.u[k]=u
		if u<0 or u>1 or rows.y0+k+0.5>floor_y:rows.left[k]=INF;rows.right[k]=-INF
		else:rows.left[k]=x+lean*u-_half_width(u,-1,width,look.notches);rows.right[k]=x+lean*u+_half_width(u,1,width,look.notches)
	var x0:int=floori(x-width/2-absf(lean)-2);var x1:int=ceili(x+width/2+absf(lean)+2)
	for py in range(floori(base-height)-1,ceili(base)):
		for px in range(x0,x1+1):
			if not rows.inside(px,py):
				if py+0.5<=floor_y and (rows.inside(px-1,py) or rows.inside(px+1,py) or rows.inside(px,py+1) or rows.inside(px,py-1) and py<base-1):p.dot(px,py,ramp[0],alpha)
				continue
			if white:p.dot(px,py,0xffffffff,alpha);continue
			var k:int=py-rows.y0;var u:float=rows.u[k];var center:float=x+lean*u;var left:float=rows.left[k];var right:float=rows.right[k];var fx:float=px+0.5;var band:int=0;var stratum:bool=false
			for s in look.strata:
				var distance:float=u*height-s*height-look.slope*(fx-center)
				if distance>0:band+=1
				if absf(distance)<0.5:stratum=true
			var jog:float=(M.rand([band,look.seed])-0.5)*0.3;var q:float=((fx-left)/maxf(0.5,right-left))*2-1;var qr:float=-0.18+jog;var color_index:int
			if u>0.93:color_index=7 if q<qr+0.3 else 5
			elif absf(q-qr)<maxf(0.09,0.55/maxf(1,right-left)):color_index=7
			elif q<qr:color_index=7 if fx-left<1 else 6 if q< -0.5+jog else 5
			else:color_index=3 if right-fx<1 else 4 if q<0.38+jog else 2
			if stratum and color_index<7:color_index-=1
			var fleck:float=M.rand([px*7+3,py*13+5])
			if fleck<0.035:color_index=7 if q<qr else color_index-1
			elif fleck>0.965:color_index-=1
			if glint>=0 and q<qr+0.1:
				var distance:float=absf(u-glint)
				if distance<0.035:color_index=8
				elif distance<0.07:color_index=maxi(color_index,7)
			p.dot(px,py,0xffffffff if color_index>=8 else ramp[clampi(color_index,0,ramp.size()-1)],alpha)
	if opts.get("crack",0)<=0 or not opts.has("cracks"):return
	for path in opts.cracks:
		var m:int=maxi(1,floori(path.size()*opts.crack))
		for k in range(1,m):
			var u0:float=path[k-1][0];var v0:float=path[k-1][1];var u1:float=path[k][0];var v1:float=path[k][1];var ax:float=x+lean*u0+v0*_half_width(u0,-1 if v0<0 else 1,width,look.notches);var ay:float=base-u0*height;var bx:float=x+lean*u1+v1*_half_width(u1,-1 if v1<0 else 1,width,look.notches);var by:float=base-u1*height
			if u1>rows.clip:break
			if not rows.inside(floori(ax),floori(ay)) or not rows.inside(floori(bx),floori(by)):continue
			var hot:float=opts.get("heat",0);var glow=opts.get("glowRamp")
			if hot>0.05 and glow!=null:
				p.line(ax+1,ay,bx+1,by,ramp[0],alpha);p.line(ax,ay,bx,by,glow[4] if hot>0.7 else glow[3] if hot>0.4 else glow[2] if hot>0.2 else glow[1],alpha)
				if k%2==0:p.glow(bx,by,7,glow[2],0.35*hot)
			else:p.line(ax,ay,bx,by,ramp[0],alpha);p.dot(bx+1,by-1,ramp[6],alpha*0.7)

class ThornRows:
	extends RefCounted
	var centers:PackedFloat64Array=[]
	var radii:PackedFloat64Array=[]
	var y0:int
	func inside(px:int,py:int)->bool:
		var i:int=py-y0
		return i>=0 and i<radii.size() and radii[i]>=0 and absf(px+0.5-centers[i])<=radii[i]
static func thorn(_e,a,_receiver):
	var p:Painter=a[0];var s:Dictionary=a[1];var height:float=a[2];var ramp:Array=a[3];var opts:Dictionary=a[4]
	if height<1.5:return
	var x:float=s.x;var width:float=s.w;var hook:float=s.hook;var lean:float=s.lean;var base:float=opts.get("base",0);var white:bool=opts.get("white",false);var alpha:float=opts.get("a",1);var top:int=floori(base-height)-1;var bottom:int=mini(0,ceili(base));var rows=ThornRows.new();rows.y0=top-1;rows.centers.resize(bottom-top+3);rows.radii.resize(rows.centers.size())
	for i in range(rows.radii.size()):
		var py:int=rows.y0+i;var u:float=(base-(py+0.5))/height
		if u<0 or u>1 or py+0.5>0:rows.radii[i]=-1;continue
		rows.centers[i]=x+lean*u+hook*pow(u,2.4);rows.radii[i]=(width/2)*pow(1-u,0.9)+0.25
	for py in range(top,bottom+1):
		for px in range(floori(x-width-6),ceili(x+width/2+absf(lean)+absf(hook)+2)+1):
			if not rows.inside(px,py):
				if py<=0 and (rows.inside(px-1,py) or rows.inside(px+1,py) or rows.inside(px,py+1) or rows.inside(px,py-1)):p.dot(px,py,ramp[0],alpha)
				continue
			if white:p.px(px,py,0xffffffff);continue
			var u:float=(base-(py+0.5))/height;var center:float=rows.centers[py-rows.y0];var radius:float=rows.radii[py-rows.y0];var q:float=(px+0.5-(center-radius))/(2*radius);var color:int=4 if q<0 else 6 if q<0.16 else 5 if q<0.36 else 7 if q<0.46 else 4 if q<0.7 else 3 if q<0.86 else 2
			if u>0.86:color=7 if q<0.6 else 5
			if color<7 and color>2 and M.rand([px,floori((py+0.5-base)/3),s.seed])<0.12:color-=1
			p.px(px,py,ramp[color])
	if not white and height>14:
		var y0:float=base-0.34*height;var y1:float=base-0.46*height;var e0:float=x+lean*0.34+hook*pow(0.34,2.4)-((width/2)*pow(1-0.34,0.9)+0.25);var e1:float=x+lean*0.46+hook*pow(0.46,2.4)-((width/2)*pow(1-0.46,0.9)+0.25);var length:float=width*0.45
		if y0<=0:
			p.tri(e0+0.5,y0,e1+0.5,y1,e1-length,y1-length*0.7,ramp[3]);p.line(e1,y1,e1-length,y1-length*0.7,ramp[6]);p.px(e1-length,y1-length*0.7,ramp[7]);p.line(e0,y0+1,e1-length+1,y1-length*0.7+1,ramp[0])
