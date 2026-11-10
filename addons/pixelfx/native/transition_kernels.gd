@tool
extends RefCounted
const Painter=preload("painter.gd")
const C=preload("../core/color.gd")
const M=preload("../core/math.gd")
static func diamond_draw(e,args,_receiver):
	var semantics=load("res://addons/pixelfx/native/semantics.gd");var p0:Painter=args[0];var t:float=args[1];var options:Dictionary=args[2];var palette:Array=C.fit(options.palette,8);var ink:int=semantics.call_builtin("native.hex",[options.color]);var p:Painter=semantics.call_value(semantics.read(e,"clipTo"),[p0]);var diamonds:Array=semantics.call_value(semantics.read(e,"lattice"),[options.seed]);var glints:Array=[];var faces:Array=[[palette[2],palette[1],palette[0]],[palette[1],palette[0],palette[0]],[palette[1],palette[0],palette[0]],[palette[0],palette[0],ink]]
	for d in diamonds:
		var ki:float=(t-d.tin)/0.24;var ko:float=(t-d.tout)/0.24
		if d.glint and ko>0.7 and ko<1.5:glints.append([d,(ko-0.7)/0.8,0])
		if ki<=0 or ko>=1:continue
		var size:float=17*(1-(3*ko*ko*ko-2*ko*ko) if ko>0 else 1+3.2*pow(minf(1,ki)-1,3)+2.2*pow(minf(1,ki)-1,2));var heat:float=M.smooth(0,0.35,ko) if ko>0 else 1-M.smooth(0.45,1.25,ki)
		if size<0.5:continue
		var settled:bool=heat<=0
		for y in range(maxi(0,floori(d.cy-size)),mini(179,ceili(d.cy+size))+1):
			var dy:float=y+0.5-d.cy;var width:float=size-absf(dy)
			if width<=0:continue
			var x0:int=maxi(0,ceili(d.cx-width-0.5));var x1:int=mini(319,floori(d.cx+width-0.5))
			if x1<x0:continue
			if settled:
				if p0.sn==0 and p0.cs==1:p0.pixel_span(x0,x1,y,ink)
				else:p0.rect(x0,y,x1-x0+1,1,ink)
				continue
			var step:int=0 if heat>0.66 else 1 if heat>0.33 else 2
			for x in range(x0,x1+1):
				var dx:float=x+0.5-d.cx;var edge:float=size-absf(dx)-absf(dy);var quadrant:int=(0 if dy<0 else 2)+(0 if dx<0 else 1);var vr:bool=dx> -1 and dx<=0;var hr:bool=dy> -1 and dy<=0;var color:int
				if edge<1:
					var rim:int=[0xffffffff if heat>0.5 else palette[6],palette[6] if heat>0.5 else palette[5],palette[5] if heat>0.5 else palette[4],palette[4] if heat>0.5 else palette[3]][quadrant];color=rim if heat>0.15 else ink
					if heat>0.15:p0.light(x,y,palette[5],0.4*heat*(1 if quadrant==0 else 0.6))
				elif edge<2 and quadrant==0 and heat>0.4:color=palette[5]
				elif (vr or hr) and heat>0.3:
					var tip:bool=vr and dy< -size+4;var sheen:bool=absf(fmod(fmod(x+y-t*260,90)+90,90)-45)<3;color=0xffffffff if tip or sheen and heat>0.5 else (palette[6] if heat>0.6 else palette[5]) if vr and dy<0 else palette[3] if heat>0.6 else palette[2]
				else:color=faces[quadrant][step] if heat>0.15 else ink
				p0.px(x,y,color)
		if not settled:p.glow(d.cx,d.cy,size+6,palette[4],0.22*heat)
		if ki>0.6 and ki<1.8 and d.glint:glints.append([d,(ki-0.6)/1.2,size])
	for item in glints:
		var d:Dictionary=item[0];var u:float=item[1];var size:float=item[2]
		if u<=0 or u>=1:continue
		semantics.call_value(semantics.read(e,"glint"),[p,d.cx,d.cy-size if size else d.cy,9*pow(sin(PI*u),0.7),d.spin+u*1.5,palette[6],palette[5]])
class PixelCursor:
	extends RefCounted
	var painter:Painter
	var fast:bool
	var tx:float
	var ty:float
	var flip:float
	var sx:int=0
	var sy:int=0
	var index:int=0
	func at(value):
		index=int(value)
		if fast:sx=floori(tx+((index%320)+0.5)*flip);sy=floori(ty+int(index/320.0)+0.5)
	func put(color:int,alpha:float=1):
		if fast:painter.put(sx,sy,color,alpha)
		else:painter.dot((index%320)+0.5,int(index/320.0)+0.5,color,alpha)
	func add(color:int,strength:float):
		if fast:painter.add(sx,sy,color,strength)
		else:painter.light((index%320)+0.5,int(index/320.0)+0.5,color,strength)
	func blend(color:int,alpha:float):
		if fast:painter.blend_px(sx,sy,color,alpha)
		else:painter.blend((index%320)+0.5,int(index/320.0)+0.5,color,alpha)
static func pixels(_e,a,_r):
	var p:Painter=a[0];var cursor=PixelCursor.new();cursor.painter=p;cursor.fast=p.sn==0 and p.cs==1;cursor.tx=p.tx;cursor.ty=p.ty;cursor.flip=p.fx
	return {"at":cursor.at,"put":cursor.put,"add":cursor.add,"blend":cursor.blend,"__native_owner":cursor}

class FieldIndex:
	extends RefCounted
	var sorted:PackedFloat32Array=[]
	func below(value:float)->int:
		var left:int=0;var right:int=sorted.size()
		while left<right:
			var middle:int=(left+right)>>1
			if sorted[middle]<value:left=middle+1
			else:right=middle
		return left
static func field(_e,a,_receiver):
	var semantics=load("res://addons/pixelfx/native/semantics.gd");var fn=a[0];var minimum:float=a[1] if a.size()>1 else 0.45;var maximum:float=a[2] if a.size()>2 else 3;var values:PackedFloat32Array=[];values.resize(320*180);var gradients:PackedFloat32Array=[];gradients.resize(values.size());var vertical:PackedFloat32Array=[];vertical.resize(values.size());var low:float=INF;var high:float=-INF;var bridge=preload("../effects/simulation_bridge.gd")
	for y in range(180):
		for x in range(320):
			var value:float=semantics.call_value(fn,[x+0.5,y+0.5]);values[y*320+x]=value;low=minf(low,value);high=maxf(high,value)
	for y in range(180):
		var ya:int=maxi(0,y-1);var yb:int=mini(179,y+1)
		for x in range(320):
			var xa:int=maxi(0,x-1);var xb:int=mini(319,x+1);var gx:float=(values[y*320+xb]-values[y*320+xa])/(xb-xa);var gy:float=(values[yb*320+x]-values[ya*320+x])/(yb-ya);var length:float=bridge.hypot([gx,gy]);gradients[y*320+x]=1/clampf(length,minimum,maximum);vertical[y*320+x]=gy/length if length>1e-6 else 0
	var order:PackedInt64Array=[];order.resize(values.size());var scratch:PackedInt64Array=[];scratch.resize(order.size())
	for i in range(order.size()):order[i]=i
	var run:int=1
	while run<order.size():
		var left:int=0
		while left<order.size():
			var middle:int=mini(left+run,order.size());var right:int=mini(left+run*2,order.size());var i:int=left;var j:int=middle
			for k in range(left,right):
				if j>=right or i<middle and values[order[i]]<=values[order[j]]:scratch[k]=order[i];i+=1
				else:scratch[k]=order[j];j+=1
			left+=run*2
		var swap:PackedInt64Array=order;order=scratch;scratch=swap;run*=2
	var index=FieldIndex.new();index.sorted.resize(values.size())
	for i in range(order.size()):index.sorted[i]=values[order[i]]
	var f=semantics.Buffer.new("Float32Array");f.floats=values;var g=semantics.Buffer.new("Float32Array");g.floats=gradients;var ny=semantics.Buffer.new("Float32Array");ny.floats=vertical;var indices=semantics.Buffer.new("Uint32Array");indices.ints=order
	return {"f":f,"g":g,"ny":ny,"lo":low,"hi":high,"order":indices,"below":index.below,"__native_owner":index}

static func burn_slice(e,deep:bool):
	var semantics=load("res://addons/pixelfx/native/semantics.gd");var order:PackedInt64Array=semantics.read(e,"ord").ints;var first:int=semantics.read(e,"c0" if deep else "a0");var end:int=semantics.read(e,"c1" if deep else "a1");var in_phase:bool=semantics.read(e,"inPhase");var k:float=semantics.read(e,"k");var values:PackedFloat32Array=semantics.read(e,"f").floats;var gradients:PackedFloat32Array=semantics.read(e,"g").floats;var phases=semantics.read(e,"ph");var phase_data:PackedInt64Array=phases.ints;var flecks:PackedFloat32Array=semantics.read(e,"fleck").floats;var heats:PackedFloat32Array=semantics.read(e,"heat").floats;var veins:PackedFloat32Array=semantics.read(e,"vein").floats;var jitter:PackedFloat32Array=semantics.read(e,"jit").floats
	var flames:PackedFloat32Array=semantics.read(e,"FL").floats;var heat_variation:PackedFloat32Array=semantics.read(e,"HV").floats;var twinkles:PackedInt64Array=semantics.read(e,"TW").ints;var ramp:Array=semantics.read(e,"F");var line:Array=semantics.read(e,"line");var cursor:PixelCursor=semantics.read(e,"px").__native_owner;var warm:int=semantics.read(e,"WARM");var scorch:int=semantics.read(e,"SCORCH");var char_color:int=semantics.read(e,"CHAR");var ink:int=semantics.read(e,"ink");var fade:float=semantics.read(e,"fade");var smoulder:float=semantics.read(e,"sk");var smoulder_radius:float=semantics.read(e,"SR");var low:float=semantics.read(e,"B").lo
	for j in range(first,end):
		var i:int=order[j];cursor.at(i)
		if deep and flecks[i]==0:cursor.put(ink);continue
		var distance:float=k-values[i] if in_phase else values[i]-k;var pixels_from_edge:float=distance*gradients[i]
		if distance<0:
			if in_phase and pixels_from_edge> -2.5:cursor.blend(scorch,0.5*(1+pixels_from_edge/2.5))
			var u:float=maxf(0,1+distance/24);var v:float=1+distance/48;cursor.add(warm,(0.3*u*u+0.12*v*v)*flames[phase_data[i]]);continue
		var heat:float=clampf(heats[i]+heat_variation[phase_data[i]],0,1);var thickness:float=0.6+0.6*heat;var u:float=pixels_from_edge/thickness
		if u<6.4:
			if u<0.9:line.append(i)
			cursor.put((ramp[8] if heat>0.6 else ramp[7]) if u<0.9 else ramp[6] if u<1.7 else ramp[5] if u<2.4 else ramp[4] if u<3.1 else ramp[3] if u<3.8 else ramp[2] if u<4.6 else ramp[1] if u<5.5 else ramp[0])
			if u<4.6:cursor.add(warm,0.45*(1-u/4.6)*(0.7+0.3*heat))
			continue
		if smoulder>0 and values[i]<low+smoulder_radius:
			var h:float=(1-(values[i]-low)/smoulder_radius)*smoulder*(0.7+0.6*heat)
			if veins[i]<0.04+0.08*h:
				cursor.put(ramp[6] if h>0.95 else ramp[5] if h>0.75 else ramp[4] if h>0.55 else ramp[3] if h>0.38 else ramp[2] if h>0.22 else ramp[1]);cursor.add(warm,0.4*h);continue
			cursor.add(warm,0.2*h*h)
		var remaining:float=flecks[i]*(0.8+0.4*heat)
		if remaining>0 and pixels_from_edge<remaining:
			var v:float=(pixels_from_edge-6.4*thickness)/maxf(1,remaining-6.4*thickness)
			if v<1 and twinkles[(phase_data[i]*5)&63] and not (fade<1 and fade<=jitter[i]/1.5+0.5):
				cursor.put(ramp[4] if v<0.3 else ramp[3] if v<0.55 else ramp[2] if v<0.8 else ramp[1]);cursor.add(warm,0.3*(1-v));continue
		if distance<22:cursor.add(warm,0.2*pow(1-distance/22,2))
		cursor.put(char_color if u-6.4<1.6*thickness+jitter[i] else ink)

static func burn_initialize(e):
	var semantics=load("res://addons/pixelfx/native/semantics.gd");var noise=preload("noise_kernels.gd");var math=preload("../core/math.gd");var seed:int=semantics.read(e,"seed");var heats:PackedFloat32Array=[];heats.resize(320*180);var phases:PackedInt64Array=[];phases.resize(heats.size());var flecks:PackedFloat32Array=[];flecks.resize(heats.size());var jitter:PackedFloat32Array=[];jitter.resize(heats.size());var veins:PackedFloat32Array=[];veins.resize(heats.size())
	for i in range(heats.size()):
		var x:int=i%320;var y:int=i/320;heats[i]=0.5+0.5*noise.noise2(x/13.0,y/13.0,seed+41);phases[i]=mini(63,floori((0.5+0.5*noise.noise2(x/23.0,y/23.0,seed+43))*64));flecks[i]=9+22*math.rand([x,y,seed+47]) if math.rand([x,y,seed+45])<0.04 else 0;jitter[i]=(math.rand([x,y,seed+49])-0.5)*1.5
		var rx:float=x*0.8+y*0.6;var ry:float=y*0.8-x*0.6;veins[i]=minf(absf(noise.noise2(rx/11,ry/9,seed+61)),absf(noise.noise2(ry/5.5,rx/5,seed+63))*1.5)
	semantics.read(e,"heat").floats=heats;semantics.read(e,"ph").ints=phases;semantics.read(e,"fleck").floats=flecks;semantics.read(e,"jit").floats=jitter;semantics.read(e,"vein").floats=veins
