@tool
extends RefCounted
## Scalar sky geometry and billow fields from the pinned upstream algorithms.
const M=preload("../core/math.gd")
const C=preload("../core/color.gd")
const N=preload("noise_kernels.gd")
const Bridge=preload("../effects/simulation_bridge.gd")
const Painter=preload("painter.gd")
const Pickup=preload("pickup_kernels.gd")
static func _semantics():return load("res://addons/pixelfx/native/semantics.gd")
static func black_disk(x:float,z:float,t:float,bands:Array):
	var radius:float=sqrt(x*x+z*z)
	for band in bands:
		if radius<band.r0 or radius>band.r1:continue
		var width:float=(radius-band.r0)/(band.r1-band.r0);var phase:float=atan2(z,x)-(TAU*band.n*t)/4
		var streak:float=0.62+0.22*cos(7*phase+radius*0.8+band.k)+0.16*cos(13*phase-radius*1.6+band.k*2);var lane:float=0.72+0.28*cos(radius*2.3+band.k);var edge:float=M.smooth(0,0.18,width)*(1-M.smooth(0.78,1,width))
		return [band.hot*streak*lane*(0.35+0.65*edge),-x/radius]
	return null
static func black_hole(e,a,_receiver):
	var p:Painter=a[0];var palette:Array=a[1];var t:float=a[2];var pulse:float=a[3];var bands:Array=_semantics().read(e,"BANDS");var ct:float=_semantics().read(e,"CT");var st:float=_semantics().read(e,"ST");var ice:int=_semantics().read(e,"ICE");var ramp:Array=[palette[1],palette[2],palette[3],palette[4],palette[5],palette[6],palette[7],0xffffffff]
	p.each(-62,-112,62,-28,func(x:float,y:float,sx:int,sy:int):
		var dy:float=y+70;var u:float=x*ct+dy*st;var v:float=-x*st+dy*ct;var r:float=sqrt(u*u+v*v);var sample=null
		if v>0:sample=black_disk(u,-v/0.25,t,bands)
		if sample==null and r>13.5:
			var k:float=1-(17.5*17.5)/(r*r);var bu:float=u*k;var bv:float=v*k;var si:float=0.46 if k>0 else 0.25
			if -bv/si>0:sample=black_disk(bu,-bv/si,t,bands)
		if sample==null or sample[0]<0.06:
			if r<13.5-0.4:p.put(sx,sy,palette[0]);return
			if r<13.5+0.7:
				var angle:float=atan2(v,u);var flash:float=0.5+0.5*cos(3*angle+(TAU*2*t)/4)+pulse*0.4;var color:int=0xffffffff if flash>0.55 else palette[7];p.put(sx,sy,color);p.add(sx,sy,color,0.3)
			return
		var intensity:float=sample[0]*1.3*(1+0.55*sample[1])*(1+0.25*pulse);var f:float=clampf(intensity,0,1)*7;var i:int=floori(f)
		if f-i>(Painter.BAYER[((floori(y)&3)<<2)|(floori(x)&3)]+0.5)/16.0:i=mini(7,i+1)
		if i==0 and intensity<0.12:return
		var color:int=ramp[i]
		if sample[1]>0.35 and i>=5:color=C.mix(color,ice,minf(1,(sample[1]-0.35)*2))
		if sample[1]< -0.4 and i>=2 and i<6:color=C.mix(color,palette[3],0.35)
		p.put(sx,sy,color)
		if i>=4 and ((floori(x)+floori(y))&1)==0:p.add(sx,sy,color,0.3*minf(1,intensity-0.35))
	)
static func storm_cloud(e,a,_receiver):
	var semantics=_semantics();var p:Painter=a[0];var billows:Array=a[1];var phase:float=a[2];var seed:int=a[3];var dark:Array=a[4];var palette:Array=a[5];var flashes=a[6];var field:PackedFloat32Array=[];field.resize(168*70);var gx:PackedFloat32Array=[];gx.resize(field.size());var gy:PackedFloat32Array=[];gy.resize(field.size());var lit:PackedFloat32Array=[];lit.resize(field.size())
	for i in range(billows.size()):
		var b:Dictionary=billows[i];var k:float=semantics.coalesce(semantics.invoke(flashes,"get",[i]),func():return 0);var r2:float=b.r*b.r;var ry:float=b.r*b.sq
		for y in range(maxi(0,floori(b.y-ry+162)),mini(70,ceili(b.y+ry+162))):
			for x in range(maxi(0,floori(b.x-b.r+84)),mini(168,ceili(b.x+b.r+84))):
				var dx:float=x-84+0.5-b.x;var dy:float=(y-162+0.5-b.y)/b.sq;var d2:float=(dx*dx+dy*dy)/r2
				if d2>=1:continue
				var j:int=y*168+x;var u:float=1-d2;var c:float=u*u;field[j]+=c;gx[j]+=(-4*u*dx)/r2;gy[j]+=(-4*u*dy)/(r2*b.sq)
				if k:lit[j]+=k*(0.25+0.75*c)
	var ramp:Array=dark.duplicate();ramp.append_array([palette[3],palette[4],palette[5],palette[6]])
	for y in range(70):
		var cy:float=y-162+0.5
		for x in range(168):
			var j:int=y*168+x
			if field[j]<0.35-0.06:continue
			var cx:float=x-84+0.5;var base:float=-100+1.5*N.tile_noise(cx*0.12+9*phase,3,9,0,seed+5);var value:float=field[j]*(1-M.smooth(base-3,base,cy))+0.05*N.tile_noise(cx*0.21+18*phase,cy*0.21,18,0,seed)
			if value<0.35:continue
			var length:float=Bridge.hypot([gx[j],gy[j]])
			if length==0:length=1
			var lam:float=-(gx[j]*0.42+gy[j]*0.9)/length;var edge:float=minf(1,length*5)*(1 if value<0.35+0.08 else 0.55);var h:float=1-2*clampf((cy+156)/56,0,1);var level:float=2.7+2.2*h+1.3*lam*edge+0.4*N.tile_noise(cx*0.16+12*phase,cy*0.16,12,0,seed+9)
			if value<0.35+0.05 and lam>0.3 and h> -0.5:level+=1
			if cy>base-6:level-=1
			var i:int=clampi(M.js_round(level),0,dark.size()-1);var light:float=lit[j]*(0.7+0.6*N.tile_noise(cx*0.2-14*phase,cy*0.2,14,0,seed+3))
			if light>0.12:i=mini(ramp.size()-1,i+M.js_round(light*5.5))
			p.px(cx,cy,ramp[i])
	semantics.read(e,"FIELD").floats=field;semantics.read(e,"GX").floats=gx;semantics.read(e,"GY").floats=gy;semantics.read(e,"LIT").floats=lit
static func storm_scud(_e,a,_receiver):
	var p:Painter=a[0];var phase:float=a[1];var seed:int=a[2];var palette:Array=a[3];var rng=M.rng([seed,13])
	for w in range(6):
		var x0:float=rng.range_value(-60,60);var y0:float=-100+rng.range_value(3,9);var rx:float=rng.range_value(10,20);var ry:float=rng.range_value(1.3,2.2);var off:float=rng.next();var u:float=fmod(phase+off,1);var alpha:float=pow(sin(PI*u),0.8);var xc:float=x0+16*(u-0.5);var y:int=floori(y0-ry-1)
		while y<=y0+ry+1:
			var x:int=floori(xc-rx-1)
			while x<=xc+rx+1:
				var dx:float=(x+0.5-xc)/rx;var dy:float=(y+0.5-y0)/ry;var noise:float=N.tile_noise((x+0.5)*0.35+10*phase+w*7,(y+0.5)*0.5,10,0,seed+20+w);var value:float=(1-dx*dx-dy*dy)*alpha+0.6*noise-0.25
				if value>0:p.blend(x+0.5,y+0.5,palette[2] if value>0.4 else palette[3],minf(0.6,0.2+value*0.7))
				x+=1
			y+=1
static func falling_leaf(e,a,_receiver):
	var semantics=_semantics();var q=a[0];var x:float=a[1];var y:float=a[2];var size:float=a[3];var angle:float=a[4];var flip:float=a[5];var shape:int=a[6];var palette:Array=a[7];var alpha:float=a[8];var back:bool=flip< -0.25;var fs:float=0.35+0.65*absf(flip);var c:float=cos(angle);var s:float=sin(angle);var width:float=size*0.9;var extent:float=size+1.5;var face:Array=[C.mix(palette[1],C.hex("#9c8a78"),0.2),C.mix(palette[2],C.hex("#c8b49c"),0.22),C.mix(palette[3],C.hex("#e0d0b8"),0.22)] if back else [palette[2],palette[3],palette[4]];var rim:int=palette[0];var vein:int=C.mix(palette[2],C.hex("#e8dcc8"),0.5) if back else palette[1]
	var shade=func(px:float,py:float,out):
		var dx:float=px-x;var dy:float=py-y;var lu:float=(dx*c+dy*s)/size;var lv:float=(-dx*s+dy*c)/(width*fs);var d:float
		if shape==1:d=Bridge.hypot([lu,lv*1.1])/(0.62+0.38*pow(absf(cos(2.5*atan2(lv,lu))),1.5))
		else:d=9 if absf(lu)>=1 else (lv*lv)/((0.36*(1-lu*lu)*(1.15-0.3*lu)) if shape==0 else (0.16*(1-lu*lu)))
		if lu< -1.25 or lu>1.1:return
		if lu< -0.92 and absf(lv*width*fs)<0.5:out.c=rim;out.a=alpha;return
		if d>1.32:return
		out.a=alpha;out.c=rim if d>1 else vein if absf(lv*width*fs)<0.45 and lu> -0.9 and lu<0.75 else face[2] if lv< -0.15 else face[1] if lv<0.35 else face[0]
	if q is Painter:q.shade(x-extent,y-extent,x+extent,y+extent,shade)
	else:semantics.invoke(q,"shade",[x-extent,y-extent,x+extent,y+extent,shade])
static func power_star(e,a,_receiver):
	var semantics=_semantics();var p:Painter=a[0];var palette:Array=a[1];var cx:float=a[2];var cy:float=a[3];var rotation:float=a[4];var scale:float=a[5];var layer=semantics.read(e,"L");var lighting_angle:float=semantics.read(e,"LA");var ink:int=semantics.read(e,"INK");var frame=layer.f
	Pickup.begin(null,[floori(cx)-21,floori(cy)-21],layer)
	for y in range(floori(cy)-21,floori(cy)+21):
		for x in range(floori(cx)-21,floori(cx)+21):
			var dx:float=(x+0.5-cx)/scale;var dy:float=(y+0.5-cy)/scale;var radius:float=Bridge.hypot([dx,dy])
			if radius>12:continue
			var angle:float=atan2(dy,dx)-rotation+PI/2;angle=fmod(fmod(angle,TAU)+TAU,TAU);var k:int=floori(angle/(PI/5));var half:int=k%2;var tip:float=(floori(k/2.0)+half)*((2*PI)/5);var tip_angle:float=tip-PI/2+rotation;var inner_angle:float=tip_angle+(-1 if half else 1)*(PI/5);var tx:float=cos(tip_angle)*11.5;var ty:float=sin(tip_angle)*11.5;var ix:float=cos(inner_angle)*5.2;var iy:float=sin(inner_angle)*5.2;var ex:float=ix-tx;var ey:float=iy-ty;var side:float=(dx-tx)*ey-(dy-ty)*ex;var center_side:float=-tx*ey+ty*ex
			if side*center_side<0:continue
			var normal:float=tip_angle+(-1 if half else 1)*(PI/2);var light:float=cos(normal-lighting_angle);var ridge:bool=absf(sin(atan2(dy,dx)-tip_angle))*radius<0.6;var color:int
			if radius<1.2:color=0xffffffff
			elif ridge:
				var toward:float=cos(tip_angle-lighting_angle);color=0xffffffff if toward>0.3 else palette[6] if toward> -0.4 else palette[5]
			else:color=palette[6 if light>0.6 else 5 if light>0.15 else 4 if light> -0.35 else 3 if light> -0.75 else 2]
			var j:int=Pickup._index(frame,x,y)
			if j>=0:frame.color[j]=color
	Pickup.outline(null,[ink],layer);Pickup.draw(null,[p],layer)
static func power_star_back(e,a,_receiver):
	var semantics=_semantics();var p:Painter=a[0];var t:float=a[1];var palette:Array=C.fit(a[2].palette,8);var phase:float=t/semantics.read(e,"meta").duration;var y:float=-25-1.5*sin(phase*TAU*2);var swell:float=semantics.call_value(semantics.read(e,"swell"),[phase]);var spin:float=phase*((TAU/10)*2)
	semantics.call_value(semantics.read(e,"blobShadow"),[p,0,9+2*swell,0.7])
	for i in range(10):
		var angle:float=spin+(i*TAU)/10;var length:float=(22 if i%2 else 34)*(1+0.18*swell);var ca:float=cos(angle);var sa:float=sin(angle);var width:float=0.06 if i%2 else 0.09
		p.each(-length-2,y-length-2,length+2,y+length+2,func(x:float,yy:float,sx:int,sy:int):
			var ry:float=yy-y;var d:float=x*ca+ry*sa
			if d<8 or d>length:return
			var q:float=absf(x*sa-ry*ca);var hw:float=0.5+d*width
			if q>hw+1.5:return
			var strength:float=(0.32+0.22*swell)*(1 if q<hw else 1-(q-hw)/1.5)*pow(1-d/length,1.2)*minf(1,(d-8)/4)
			if strength>0:p.add(sx,sy,palette[6] if q<hw*0.5 else palette[5],strength)
		)
		if i%2==0:
			var d0:float=11.5+3;var d1:float=minf(length*0.88,(-2-y)/sa if sa>0.05 else INF)
			if d1>d0:p.line(ca*d0,y+sa*d0,ca*d1,y+sa*d1,func(u):return palette[6] if u<0.35 else palette[5],func(u):return (1 if u<0.5 else 1.6-u*1.4)*(0.75+0.35*swell))
