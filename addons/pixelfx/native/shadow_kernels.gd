@tool
extends RefCounted
const C=preload("../core/color.gd")
const M=preload("../core/math.gd")
const Painter=preload("painter.gd")
static func _semantics():return load("res://addons/pixelfx/native/semantics.gd")
static func _annulus(x:float,y:float,r0:float,r1:float,fn:Callable):
	var inner:float=r0*r0 if r0>0 else -1;var outer:float=r1*r1
	for py in range(floori(y-r1),ceili(y+r1)+1):
		var cy:float=py+0.5;var dy:float=cy-y;var dy2:float=dy*dy
		if dy2>=outer:continue
		var xo:float=sqrt(outer-dy2);var xi:float=sqrt(inner-dy2) if dy2<inner else 0;var px:int=floori(x-xo);var end:int=ceili(x+xo)
		while px<=end:
			var cx:float=px+0.5;var dx:float=cx-x
			if xi>0 and dx> -xi and dx<xi:px=maxi(px,floori(x+xi)-1)+1;continue
			var d2:float=dx*dx+dy2
			if d2<outer and d2>=inner:fn.call(cx,cy,sqrt(d2))
			px+=1
static func halo(_e,a,_receiver):
	var p:Painter=a[0];var x:float=a[1];var y:float=a[2];var r0:float=a[3];var r1:float=a[4];var c:int=C.hex(a[5]);var k:float=a[6]
	if r1<=r0 or k<=0.004:return
	var width:float=r1-r0
	_annulus(x,y,maxf(0,r0),r1,func(cx,cy,d):
		var f:float=1-(d-r0)/width;p.light(cx,cy,c,f*f*k))
static func ring_light(_e,a,_receiver):
	var p:Painter=a[0];var x:float=a[1];var y:float=a[2];var radius:float=a[3];var width:float=a[4];var color:int=C.hex(a[5]);var k:float=a[6];var keep=a[7] if a.size()>7 else null;var semantics=_semantics()
	if width<1 or k<=0.004:return
	_annulus(x,y,maxf(0,radius-width),radius+width,func(cx,cy,d):
		if keep!=null and not semantics.truth(semantics.call_value(keep,[cx,cy])):return
		var f:float=1-absf(d-radius)/width;p.light(cx,cy,color,f*f*k))
static func ring_fast(_e,args,_receiver):
	var p:Painter=args[0];var x:float=args[1];var y:float=args[2];var radius:float=args[3];var width:float=args[4];var color=args[5];var alpha=args[6] if args.size()>6 else 1;var fc:bool=color is Object or color is Callable;var fa:bool=alpha is Object or alpha is Callable;var semantics=_semantics()
	if radius<=0:return
	var r0:float=maxf(0,radius-width);var divisor:float=radius-r0
	if divisor==0:divisor=1
	_annulus(x,y,r0,radius,func(cx,cy,d):
		var v:float=(d-r0)/divisor;var angle:float=atan2(cy-y,cx-x) if fc or fa else 0
		p.dot(cx,cy,semantics.call_value(color,[v,angle]) if fc else color,semantics.call_value(alpha,[v,angle]) if fa else alpha))
static func puffs_draw(_e,a,receiver):
	var p:Painter=a[0];var kind:int=a[1];var light=a[2] if a.size()>2 else null;var ramp:Array=receiver.F;var count:int=ramp.size()
	for q in receiver.list:
		if q.delay>0 or q.k!=kind:continue
		var k:float=q.life/q.max;var age:float=1-k;var x:float=q.x;var y:float=q.y
		if q.k==0:
			var heat:float=minf(0.999,pow(age,0.62)+fmod(q.seed,1)*0.1);var index:int=mini(count-2,floori(heat*(count-1)));var r:float=q.size*(0.55+0.45*minf(1,age*7))*(1-age*0.55);var color:int=ramp[index]
			if index>=count-3:p.disc(x,y,r,color,minf(1,k*3)*0.8)
			else:
				p.circle(x,y,r,ramp[mini(count-1,index+2)]);p.circle(x-r*0.16,y-r*0.22,r*0.78,color)
				if r>1.6:p.circle(x,y-r*0.9,r*0.42,color)
				if index<=3 and r>1.8:p.circle(x-r*0.28,y-r*0.34,r*0.36,ramp[maxi(0,index-1)])
				if index<6:p.glow(x,y,r*2.4+2,color,0.2*k)
			continue
		var r:float=q.size*(0.65+minf(1,age*2.5)*0.45+age*0.45);var alpha:float=minf(1,age*10)*minf(1,k*2.2)*0.72;var body:int=C.mix(receiver.soot[0],receiver.soot[1],age);var edge:float=alpha*0.5;var core:float=1-(1-alpha*0.5)*(1-alpha*0.62)
		p.disc(x,y+r*0.06,r,body,func(d,_angle):return core if d<0.72 else edge)
		var lk:float=light.k if light!=null else 0
		if lk<0.5:p.disc(x-r*0.2,y-r*0.32,r*0.48,receiver.cap,alpha*0.32*(1-age*0.7)*(1-lk*2))
		if lk<=0.02:continue
		var lx:float=light.x-x;var ly:float=light.y-y;var length:float=sqrt(lx*lx+ly*ly)
		if length==0:length=1
		var ux:float=lx/length;var uy:float=ly/length;var lit:float=minf(1,light.k*clampf(1.3-length/light.reach,0,1))*alpha
		if lit<=0.02:continue
		p.disc(x+ux*r*0.26,y+uy*r*0.26,r*0.72,receiver.rim[2],lit*0.55);p.disc(x+ux*r*0.5,y+uy*r*0.5,r*0.46,receiver.rim[1],lit*0.5)
		if r>3:p.disc(x+ux*r*0.68,y+uy*r*0.68,r*0.24,receiver.rim[0],lit*0.4)
