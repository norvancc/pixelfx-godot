@tool
extends RefCounted
## Direct native kernels for pinned algorithms. Generated functions retain their lexical state.
const Explosions=preload("explosion_kernels.gd")
const GridKernels=preload("grid_kernels.gd")
const ActKernels=preload("act_kernels.gd")
const Weather=preload("weather_kernels.gd")
const GhostKernels=preload("ghost_kernels.gd")
const GeometryKernels=preload("geometry_kernels.gd")
const ProjectileKernels=preload("projectile_kernels.gd")
const PickupKernels=preload("pickup_kernels.gd")
const UIKernels=preload("ui_kernels.gd")
const TransitionKernels=preload("transition_kernels.gd")
const NatureKernels=preload("nature_kernels.gd")
const ParticleKernels=preload("particle_kernels.gd")
const SkyKernels=preload("sky_kernels.gd")
const ShadowKernels=preload("shadow_kernels.gd")
static func shadow_puffs_draw(e,a,r):return ShadowKernels.puffs_draw(e,a,r)
static func shadow_halo(e,a,r):return ShadowKernels.halo(e,a,r)
static func shadow_ring_light(e,a,r):return ShadowKernels.ring_light(e,a,r)
static func shadow_ring_fast(e,a,r):return ShadowKernels.ring_fast(e,a,r)
static func sky_black_hole(e,a,r):return SkyKernels.black_hole(e,a,r)
static func sky_storm_cloud(e,a,r):return SkyKernels.storm_cloud(e,a,r)
static func sky_storm_scud(e,a,r):return SkyKernels.storm_scud(e,a,r)
static func sky_falling_leaf(e,a,r):return SkyKernels.falling_leaf(e,a,r)
static func sky_power_star(e,a,r):return SkyKernels.power_star(e,a,r)
static func sky_power_star_back(e,a,r):return SkyKernels.power_star_back(e,a,r)
static func nature_draw_rock(e,a,r):return NatureKernels.draw_rock(e,a,r)
static func nature_draw_spike(e,a,r):return NatureKernels.draw_spike(e,a,r)
static func nature_thorn(e,a,r):return NatureKernels.thorn(e,a,r)
static func weather_rain_mist(e,a,r):return Weather.rain_mist(e,a,r)
static func weather_rain_floor(e,a,r):return Weather.rain_floor(e,a,r)
static func weather_rain_back(e,a,r):return Weather.rain_back(e,a,r)
static func melee_smear(e,a,r):return GeometryKernels.melee_smear(e,a,r)
static func transition_pixels(e,a,r):return TransitionKernels.pixels(e,a,r)
static func transition_field(e,a,r):return TransitionKernels.field(e,a,r)
static func transition_diamond_draw(e,a,r):return TransitionKernels.diamond_draw(e,a,r)
static func ui_draw_word(e,a,r):return UIKernels.draw_word(e,a,r)
static func projectile_cloud(e,a,r):return ProjectileKernels.cloud(e,a,r)
static func pickup_layer_begin(e,a,r):return PickupKernels.begin(e,a,r)
static func pickup_layer_idx(e,a,r):return PickupKernels.idx(e,a,r)
static func pickup_layer_get(e,a,r):return PickupKernels.get_value(e,a,r)
static func pickup_layer_set(e,a,r):return PickupKernels.set_value(e,a,r)
static func pickup_layer_fill(e,a,r):return PickupKernels.fill(e,a,r)
static func pickup_layer_outline(e,a,r):return PickupKernels.outline(e,a,r)
static func pickup_layer_map(e,a,r):return PickupKernels.map_pixels(e,a,r)
static func pickup_layer_draw(e,a,r):return PickupKernels.draw(e,a,r)
static func pickup_draw_gem(e,a,r):return PickupKernels.draw_gem(e,a,r)
static func weather_storm_deck(e,a,r):return Weather.storm_deck(e,a,r)
static func geometry_edge_distance(e,a,r):return GeometryKernels.edge_distance(e,a,r)
static func geometry_black_star(e,a,r):return GeometryKernels.black_star(e,a,r)
static func geometry_in_star(e,a,r):return GeometryKernels.in_star(e,a,r)
static func impact_frame_draw(e,a,r):return GeometryKernels.impact_frame_draw(e,a,r)
static func ghost_state(e,a,r):return GhostKernels.state(e,a,r)
static func weather_fog_bank_row(e,a,r):return Weather.fog_bank_row(e,a,r)
static func weather_fog_streak_row(e,a,r):return Weather.fog_streak_row(e,a,r)
static func weather_blizzard_sheet_row(e,a,r):return Weather.blizzard_sheet_row(e,a,r)
static func weather_blizzard_ground_row(e,a,r):return Weather.blizzard_ground_row(e,a,r)
static func weather_storm_veil_pixel(e,a,r):return Weather.storm_veil_pixel(e,a,r)
static func weather_god_rays_row(e,a,r):return Weather.god_rays_row(e,a,r)
static func weather_snow_haze_pixel(e,a,r):return Weather.snow_haze_pixel(e,a,r)
const NativeFrame=preload("../core/frame.gd")
const NativePainter=preload("painter.gd")
const Particles=preload("../core/particles.gd")
const BLESSING_RAYS=[[-0.62,0.16,1,0.3],[-0.2,0.2,2,1.7],[0.22,0.14,1,4.1],[0.6,0.18,2,2.6]]
const M=preload("../core/math.gd")
const C=preload("../core/color.gd")
const Sim=preload("../core/sim.gd")
const Shapes=preload("../effects/analytic_helpers.gd")
const Bridge=preload("../effects/simulation_bridge.gd")
const Fire=preload("../effects/fire_common.gd")
const FireSim=preload("../effects/fire/b2_sim_common.gd")
const Ice=preload("../effects/ice/ice_common.gd")
const Holy=preload("../effects/holy/holy_common.gd")
static func _read(e,key):return load("res://addons/pixelfx/native/semantics.gd").read(e,key)
static func _call(fn,args):return load("res://addons/pixelfx/native/semantics.gd").call_value(fn,args)
static func _arg(args,index,fallback=null):return args[index] if index<args.size() else fallback
static func _callback(value):return value.callback() if value is Object and value.has_method("callback") else value
static func _particles(receiver):
	if not receiver.has("__native_proxy"):receiver.__native_proxy=Sim.Particles.new()
	var proxy=receiver.__native_proxy
	proxy.list=receiver.list;proxy.R=receiver.R;proxy.t=receiver.t;proxy.sparks=receiver.sparks;proxy.haze=receiver.haze if receiver.haze!=null else 0
	proxy.ground=_callback(receiver.ground);proxy.on_land=_callback(receiver.onLand) if receiver.onLand!=null else Callable()
	return proxy
static func particles_draw(_e,args,receiver):
	ParticleKernels.draw(_particles(receiver),args[0],str(args[1]) if args.size()>1 and args[1]!=null else "")
static func particles_update(_e,args,receiver):
	var proxy=_particles(receiver);proxy.update(args[0]);receiver.t=proxy.t
static func _bits(receiver):
	if not receiver.has("__native_proxy"):receiver.__native_proxy=Bridge.Bits.new()
	var proxy=receiver.__native_proxy;proxy.list=receiver.list;proxy.ground=_callback(receiver.ground);return proxy
static func bits_draw(_e,args,receiver):_bits(receiver).draw(args[0])
static func bits_update(_e,args,receiver):_bits(receiver).update(args[0])
static func _lights(receiver):
	if not receiver.has("__native_proxy"):receiver.__native_proxy=Sim.Lights.new()
	var proxy=receiver.__native_proxy;proxy.list=receiver.list;return proxy
static func lights_draw(_e,args,receiver):_lights(receiver).draw(args[0])
static func lights_update(_e,args,receiver):_lights(receiver).update(args[0])
static func sparkle(_e,a,_receiver):Shapes.sparkle(a[0],a[1],a[2],a[3],a[4],_arg(a,5,a[4]),_arg(a,6,0.6))
static func flare(_e,a,_receiver):Sim.flare(a[0],a[1],a[2],a[3],a[4],a[5])
static func band(_e,a,_receiver):
	var p:NativePainter=a[0];var cx:float=a[1];var cy:float=a[2];var radius:float=a[3];var sy:float=a[4];var thickness:float=a[5];var k:float=a[6]
	if radius<=0 or k<=0:return
	var ramp:Array=C.fit(a[7],a[7].size());var n:int=ramp.size();var keep=_callback(_arg(a,8,func(_g):return true));var hot:bool=_arg(a,9,false);var count:int=ceili(radius*TAU*1.2)
	var offsets:PackedFloat64Array=[];var colors:PackedInt64Array=[];var alphas:PackedFloat64Array=[];var offset:float=thickness
	while offset>=0:
		var u:float=offset/thickness
		offsets.append(offset);colors.append((C.WHITE if hot else ramp[n-1]) if u<0.15 else ramp[n-2] if u<0.4 else ramp[n-3] if u<0.7 else ramp[n-4]);alphas.append(k*(1.2 if u<0.4 else 1.15-u));offset-=0.5
	var target:NativeFrame=p.frame;var min_x:int=target.w;var min_y:int=target.h;var max_x:int=-1;var max_y:int=-1
	for j in range(count):
		var angle:float=(float(j)/count)*TAU;var ca:float=cos(angle);var sa:float=sin(angle)
		if not keep.call(angle):continue
		for i in range(offsets.size()):
			var color_value:int=colors[i];var alpha:float=alphas[i]
			if p.clipped:p.dot(cx+ca*(radius-offsets[i]),cy+sa*(radius-offsets[i])*sy,color_value,alpha);continue
			if color_value==0 or not alpha>0:continue
			var lx:float=floor(cx+ca*(radius-offsets[i]))+0.5;var ly:float=floor(cy+sa*(radius-offsets[i])*sy)+0.5
			var px:int=floori(p.tx+lx*p.fx*p.cs-ly*p.sn);var py:int=floori(p.ty+lx*p.fx*p.sn+ly*p.cs);alpha*=p.fade
			if alpha<1 and alpha<=(NativePainter.BAYER[((py&3)<<2)|(px&3)]+0.5)/16.0:continue
			var x:int=px-target.ox;var y:int=py-target.oy
			if x<0 or y<0 or x>=target.w or y>=target.h:continue
			target.color[y*target.w+x]=color_value
			min_x=mini(min_x,x);min_y=mini(min_y,y);max_x=maxi(max_x,x);max_y=maxi(max_y,y)
	if target.track_writes and min_x<=max_x:target.touch(min_x,min_y);target.touch(max_x,max_y)
static func oval(_e,a,_receiver):Holy.oval(a[0],a[1],a[2],a[3],a[4],_callback(a[5]),_callback(_arg(a,6,1)),_callback(_arg(a,7)))
static func feather(_e,a,_receiver):
	var p:NativePainter=a[0];var x:float=a[1];var y:float=a[2];var angle:float=a[3];var length:float=a[4];var width:float=a[5];var ramp:Array=a[6];var alpha:float=_arg(a,7,1);var side:float=_arg(a,8,1);var hot:float=_arg(a,9,0);var quill:float=_arg(a,10,0.02)
	if length<1.5 or alpha<=0.02:return
	var n:int=ramp.size();var ca:float=cos(angle);var sa:float=sin(angle);var x1:float=x+ca*length;var y1:float=y+sa*length;var pad:float=width+1.2;var h:bool=hot>0.5
	var edge:int=ramp[n-3] if h else ramp[n-5];var lead:int=C.WHITE if h else ramp[n-2];var colors:Array=[C.WHITE,C.WHITE,ramp[n-2]] if h else [ramp[n-2],ramp[n-3],ramp[n-4]]
	if not p.clipped and p.sn==0:
		var ax:float=p.tx+(minf(x,x1)-pad)*p.fx;var bx:float=p.tx+(maxf(x,x1)+pad)*p.fx
		for sy in range(maxi(floori(p.ty+minf(y,y1)-pad),p.frame.oy),mini(ceili(p.ty+maxf(y,y1)+pad),p.frame.oy+p.frame.h-1)+1):
			var py:float=sy+0.5-p.ty
			var scan_left:int=maxi(floori(minf(ax,bx)),p.frame.ox);var scan_right:int=mini(ceili(maxf(ax,bx)),p.frame.ox+p.frame.w-1)
			if absf(sa)>0.000001:
				var row_center:float=x+(py-y)*ca/sa;var row_half:float=maxf(width+0.05,0.5)/absf(sa)
				var row_a:float=p.tx+(row_center-row_half)*p.fx;var row_b:float=p.tx+(row_center+row_half)*p.fx
				scan_left=maxi(scan_left,floori(minf(row_a,row_b))-2);scan_right=mini(scan_right,ceili(maxf(row_a,row_b))+2)
			for sx in range(scan_left,scan_right+1):
				var px:float=(sx+0.5-p.tx)*p.fx
				var dx:float=px-x;var dy:float=py-y;var u:float=(dx*ca+dy*sa)/length
				if u<0 or u>1.05:continue
				var v:float=(-dx*sa+dy*ca)*side;var av:float=absf(v)
				if av>maxf(width+0.05,0.5):continue
				var w:float=width*sqrt(clampf((u-quill)/0.22,0,1))*sqrt(maxf(0,1-pow(maxf(0,(u-0.55)/0.47),2)))
				var lim:float=w*0.42 if v<0 else w;var fade:float=1 if u<0.72 else 1-(u-0.72)*1.6
				if av<0.5 and u<0.9:p.put(sx,sy,C.WHITE if u<0.5 else colors[0],alpha);continue
				if av>lim+0.05 or w<0.5:continue
				if lim-av<1:
					if v>0:p.put(sx,sy,colors[2] if u>0.85 else edge,alpha*fade)
					else:p.put(sx,sy,lead,alpha)
					continue
				if u<0.72:p.put(sx,sy,colors[0] if u<0.38 else colors[1],alpha);continue
				p.blend_px(sx,sy,colors[2],alpha*fade)
		return
	p.each(minf(x,x1)-pad,minf(y,y1)-pad,maxf(x,x1)+pad,maxf(y,y1)+pad,func(px:float,py:float,sx:int,sy:int):
		var dx:float=px-x;var dy:float=py-y;var u:float=(dx*ca+dy*sa)/length
		if u<0 or u>1.05:return
		var v:float=(-dx*sa+dy*ca)*side;var av:float=absf(v)
		if av>maxf(width+0.05,0.5):return
		var w:float=width*sqrt(clampf((u-quill)/0.22,0,1))*sqrt(maxf(0,1-pow(maxf(0,(u-0.55)/0.47),2)))
		var lim:float=w*0.42 if v<0 else w;var fade:float=1 if u<0.72 else 1-(u-0.72)*1.6
		if av<0.5 and u<0.9:p.put(sx,sy,C.WHITE if u<0.5 else colors[0],alpha);return
		if av>lim+0.05 or w<0.5:return
		if lim-av<1:
			if v>0:p.put(sx,sy,colors[2] if u>0.85 else edge,alpha*fade)
			else:p.put(sx,sy,lead,alpha)
			return
		if u<0.72:p.put(sx,sy,colors[0] if u<0.38 else colors[1],alpha);return
		p.blend_px(sx,sy,colors[2],alpha*fade)
	)
static func flame_tongue(_e,a,_receiver):Fire.flame_tongue(a[0],a[1],a[2],a[3],a[4],a[5],_callback(a[6]),a[7],a[8],_arg(a,9,Fire.LAYERS),_arg(a,10,0.5),_arg(a,11,1.1))
static func fire_sim_draw(_e,a,_receiver):FireSim.sim_draw(a[0],_particles(a[1]),a[2],str(a[3]) if a.size()>3 and a[3]!=null else "")
static func _crystal_inside(px:float,py:float,x:float,base:float,h:float,w:float,lean:float)->bool:
	var u:float=(base-(py+0.5))/h
	return u>=0 and u<=1 and absf(px+0.5-(x+lean*u))<=(w/2)*(1-u)+0.35
static func crystal(_e,a,_receiver):
	var p:NativePainter=a[0];var x:float=a[1];var base:float=a[2];var h:float=a[3];var w:float=a[4];var lean:float=a[5]
	if h<1.5:return
	var ramp:Array=C.fit(a[6],a[6].size());var n:int=ramp.size();var opts:Dictionary=_arg(a,7,{})
	var alpha:float=opts.get("a",1);var top:float=base-h;var ridge0:float=x-w*0.14;var glint:float=opts.get("glint",-1)
	for py in range(floori(top)-1,ceili(base)):
		var row_u:float=(base-(py+0.5))/h;var row_center:float=x+lean*row_u;var row_half:float=(w/2)*(1-row_u)+0.35;var row_on=row_u>=0 and row_u<=1
		var next_u:float=(base-(py+1+0.5))/h;var next_center:float=x+lean*next_u;var next_half:float=(w/2)*(1-next_u)+0.35;var next_on=next_u>=0 and next_u<=1
		var prev_u:float=(base-(py-1+0.5))/h;var prev_center:float=x+lean*prev_u;var prev_half:float=(w/2)*(1-prev_u)+0.35;var prev_on=prev_u>=0 and prev_u<=1 and py<base-1
		for px in range(floori(x-w/2-absf(lean)-2),ceili(x+w/2+absf(lean)+2)+1):
			if not row_on or absf(px+0.5-row_center)>row_half:
				if row_on and (absf(px-1+0.5-row_center)<=row_half or absf(px+1+0.5-row_center)<=row_half) or next_on and absf(px+0.5-next_center)<=next_half or prev_on and absf(px+0.5-prev_center)<=prev_half:p.dot(px,py,ramp[0],alpha)
				continue
			if opts.get("white",false):p.dot(px,py,C.WHITE,alpha);continue
			var u:float=(base-(py+0.5))/h;var rx:float=ridge0+(x+lean-ridge0)*u;var center:float=x+lean*u;var hw:float=(w/2)*(1-u)+0.35;var fx:float=px+0.5
			var col
			if u>0.9:col=C.WHITE
			elif absf(fx-rx)<0.55:col=ramp[maxi(0,n-2)]
			elif fx<rx:col=ramp[maxi(0,n-2)] if fx-(center-hw)<1 else ramp[maxi(0,n-3)] if (fx-(center-hw))/maxf(1,rx-(center-hw))>0.55 else ramp[maxi(0,n-4)]
			else:col=ramp[maxi(0,n-1-mini(n-2,6))] if center+hw-fx<1.2 else ramp[maxi(0,n-6)] if (fx-rx)/maxf(1,center+hw-rx)>0.5 else ramp[maxi(0,n-5)]
			if glint>=0 and fx<=rx+0.6:
				var g=absf(u-glint)
				if g<0.05:col=C.WHITE
				elif g<0.1:col=ramp[maxi(0,n-2)]
			p.dot(px,py,col,alpha)
static func _blessing_ray(q:float,t:float,weights:Array=[])->float:
	var intensity:float=0.3*maxf(0,1-q*q)
	for i in range(4):
		var ray:Array=BLESSING_RAYS[i]
		intensity+=exp(-pow((q-ray[0])/ray[1],2))*(weights[i] if not weights.is_empty() else 0.55+0.45*sin((t/3)*TAU*ray[2]+ray[3]))*0.6
	return intensity*M.smooth(1.25,0.75,absf(q))
static func blessing_back(_e,a,_receiver):
	var p:NativePainter=a[0];var t:float=a[1];var ramp:Array=C.fit(a[2].palette,8)
	var weights=[]
	for ray in BLESSING_RAYS:weights.append(0.55+0.45*sin((t/3)*TAU*ray[2]+ray[3]))
	p.each(-24,-108,24,0.5,func(x:float,y:float,sx:int,sy:int):
		var half_w:float=5+(20-5)*((y+108)/108)
		var intensity:float=_blessing_ray(x/half_w,t,weights)*(0.6+0.4*M.smooth(-108,0,y))
		if intensity<0.02:return
		p.blend_px(sx,sy,ramp[6],intensity*0.13);p.add(sx,sy,ramp[4],intensity*0.22)
	)
	for ray in [[-0.2,0.2,2,1.7],[0.22,0.14,1,4.1]]:
		for y in range(-108,-1):
			var pulse=0.5+0.5*sin(y*0.11-(t/3)*TAU*3+ray[3]);var half_w:float=5+(20-5)*((y+108)/108.0)
			p.dot(ray[0]*half_w,y,C.WHITE if pulse>0.85 else ramp[6],(0.1+0.45*pulse)*(0.5+0.5*sin((t/3)*TAU*ray[2]+ray[3]))*M.smooth(-108,-88,y))
	p.glow(0,-4,30,ramp[4],0.22)
static func fire_ring_scorch(e,a,_receiver):
	var p:NativePainter=a[0];var t:float=_read(e,"t");var reach:float=_read(e,"REACH");var hot:Array=_read(e,"H");var seed:int=_read(e,"S")
	var front=reach*(1-pow(1-clampf((t-0.32)/0.75,0,1),3));var end=1-M.smooth(2.7,3.75,t)
	if front<1 or end<=0:return
	_fire_ring_geometry(e,reach,seed)
	var x0:int=floori(-front);var x1:int=ceili(front);var y0:int=floori(-front*0.2);var y1:int=ceili(front*0.2)
	if not p.clipped and p.sn==0:
		var target:NativeFrame=p.frame;var frame_w:int=target.w;var frame_h:int=target.h;var fade:float=p.fade;var light_k:float=p.light_k
		for cell in e.values.__scorch:
			var x:int=cell[0];var y:int=cell[1];var d:float=cell[2]
			if d>front or x<x0 or x>x1 or y<y0 or y>y1:continue
			var sx:int=floori(p.tx+(x+0.5)*p.fx);var sy:int=floori(p.ty+y+0.5);var lx:int=sx-target.ox;var ly:int=sy-target.oy
			if lx<0 or ly<0 or lx>=frame_w or ly>=frame_h:continue
			var index:int=ly*frame_w+lx;var since:float=t-cell[3];var h:float=cell[4];var heat:float=1-since/(1.2+h*0.9)
			if heat>0 and h<0.03+0.06*heat:
				var c:int=hot[3] if heat>0.7 else hot[4] if heat>0.45 else hot[5] if heat>0.2 else hot[6]
				if fade>=1 or fade>(NativePainter.BAYER[((sy&3)<<2)|(sx&3)]+0.5)/16.0:target.color[index]=c
				var strength:float=(0.3*heat)*(fade*light_k)
				if strength>0.004:
					var previous:int=target.light[index];var tint:int=hot[4]
					target.light[index]=0xff000000|(int(minf(255,((previous>>16)&255)+((tint>>16)&255)*strength))<<16)|(int(minf(255,((previous>>8)&255)+((tint>>8)&255)*strength))<<8)|int(minf(255,(previous&255)+(tint&255)*strength))
				if target.track_writes:target.touch(lx,ly)
				continue
			var alpha:float=minf(1,since*3)*(0.55-(d/reach)*0.25)*end*fade
			if alpha<=0.004:continue
			var c:int=0xff120a0d if h<0.5 else 0xff1d1217;var previous:int=target.color[index]
			if previous==0:target.color[index]=((int(alpha*255)&255)<<24)|(c&0xffffff)
			else:
				var da:float=((previous>>24)&255)/255.0;var oa:float=alpha+da*(1-alpha);var ratio:float=alpha/oa
				target.color[index]=((int(oa*255)&255)<<24)|((int(((c>>16)&255)*ratio+((previous>>16)&255)*(1-ratio))&255)<<16)|((int(((c>>8)&255)*ratio+((previous>>8)&255)*(1-ratio))&255)<<8)|(int((c&255)*ratio+(previous&255)*(1-ratio))&255)
			if target.track_writes:target.touch(lx,ly)
		return
	for cell in e.values.__scorch:
		var x:int=cell[0];var y:int=cell[1];var d:float=cell[2]
		if d>front or x<x0 or x>x1 or y<y0 or y>y1:continue
		var since:float=t-cell[3];var h:float=cell[4];var heat:float=1-since/(1.2+h*0.9)
		if heat>0 and h<0.03+0.06*heat:
			p.px(x,y,hot[3] if heat>0.7 else hot[4] if heat>0.45 else hot[5] if heat>0.2 else hot[6]);p.light(x,y,hot[4],0.3*heat);continue
		p.blend(x,y,0xff120a0d if h<0.5 else 0xff1d1217,minf(1,since*3)*(0.55-(d/reach)*0.25)*end)
static func _fire_ring_geometry(e,reach:float,seed:int):
	if e.values.has("__scorch"):return
	var cells=[]
	for y in range(floori(-reach*0.2),ceili(reach*0.2)+1):
		for x in range(floori(-reach),ceili(reach)+1):
			var d:float=Bridge.hypot([x+0.5,(y+0.5)/0.2])
			if d>reach:continue
			cells.append([x,y,d,0.32+0.75*(1-pow(1-minf(1,d/reach),1.0/3)),M.rand([x,y,seed])])
	e.values.__scorch=cells
static func fire_ring_create(e,a,receiver):
	var method:String=e.executable.get_script_constant_map().ACCELERATED.find_key("fire_ring_create")
	var instance:Dictionary=e.executable.call(method,e,a,receiver)
	var environment=instance.draw.environment
	_fire_ring_geometry(environment,_read(environment,"REACH"),_read(environment,"S"))
	var options:Dictionary=a[0]
	if options.get("angle",0)==0:NativePainter.glow_geometry(options.get("x",0),options.get("y",0)-6,92)
	return instance
static func nova_frost(_e,a,_receiver):
	var p:NativePainter=a[0];var ramp:Array=a[1];var reach:float=a[4];var alpha:float=a[5];var edge:float=a[6]
	for x in range(floori(a[2]),ceili(a[3])+1):
		var d=absf(x+0.5);var q=d/reach;var k=clampf((alpha*1.15-q)/0.15,0,1)
		if k<=0:continue
		var h=M.rand([x,17]);var fresh=edge>0 and d>edge-3;var tuft=M.js_round((1+M.rand([x,5])*3)*(1-q*0.6)) if h<0.45 else 0
		var depth=(4+M.rand([x,11])*4)*(1-q*0.5)
		p.dot(x,0,C.WHITE if fresh or h<0.25 else ramp[6],k)
		for j in range(1,tuft+1):p.dot(x,-j,C.WHITE if j==tuft else ramp[5],k)
		if tuft>1 and M.rand([x,9])<0.5:p.dot(x+(-1 if M.rand([x,3])<0.5 else 1),-tuft+1,ramp[6],k)
		for j in range(1,floori(depth)+1):
			var v=j/depth;p.dot(x,j,C.WHITE if M.rand([x*31+j,7])<0.06 else ramp[6] if v<0.25 else ramp[5] if v<0.55 else ramp[4],k*(1.1-v)*(1.3 if fresh else 1))
static func fire_ring_flames(e,a,_receiver):
	var p:NativePainter=a[0];var back:bool=a[1];var t:float=_read(e,"t");var sites:Array=_read(e,"sites");var hot:Array=_read(e,"H")
	if not e.values.has("__ring_noise"):e.values.__ring_noise={}
	var randoms:Dictionary=e.values.__ring_noise
	var noise=func(rate,seed=0,off=0):return _sample_noise(t*rate+off,seed,randoms)
	for s in sites:
		if s.back!=back:continue
		var age:float=t-s.t0
		if age<0 or age>s.life:continue
		var u:float=age/s.life;var rise:float=1+3*pow(clampf(age/0.08,0,1)-1,3)+2*pow(clampf(age/0.08,0,1)-1,2)
		var fade:float=1-pow(maxf(0,(u-0.1)/0.9),1.3)
		var height:float=s.h*rise*fade*(0.85+0.15*_sample_noise(t*3.3,s.n,randoms))*(1+0.5*maxf(0,_sample_noise(t*2.6,s.n+70,randoms)-0.55))
		if height<1:continue
		var layers:Array=(Fire.BACK_LAYERS if back else Fire.LAYERS) if u<0.3 else Fire.BACK_LAYERS if u<0.65 else [[1,1,7],[0.7,0.8,6],[0.4,0.55,5]]
		_ring_tongue(p,s.x,s.y,height,s.w*(0.6+0.4*fade),noise.call(2.2,s.n+40)*1.5-s.x*0.02,t,s.n,hot,layers,randoms)
static func shield_film(_e,a,_receiver):
	var p:NativePainter=a[0];var t:float=a[1];var o=a[2];var back:bool=a[3];var ramp:Array=C.fit(o.palette,8);var radius:float=o.radius
	var sheen=-1.7+3.4*clampf(fmod(t/2.4,1)/0.55,0,1)
	p.each(-radius-1,-22-radius-1,radius+1,-22+radius+1,func(x:float,y:float,sx:int,sy:int):
		var d:float=Bridge.hypot([x,y+22])/radius
		if d>=1:return
		var q:float=(x-(y+22))/(radius*1.414);var hot:float=maxf(0,1-absf(q-sheen)/0.22)
		var alpha:float=(0.07 if back else 0.03)+0.26*pow(d,6)+0.2*hot*(0.3 if back else 1.0)
		p.blend_px(sx,sy,ramp[6] if hot>0.5 and not back else ramp[5],alpha)
	)
static func _sphere(radius:float,lat:float,lon:float)->Array:
	var x=radius*cos(lat)*sin(lon);var y=radius*sin(lat);var z=radius*cos(lat)*cos(lon)
	return [x,-22-(y*cos(0.34)-z*sin(0.34)),y*sin(0.34)+z*cos(0.34)]
static func shield_lattice(_e,a,_receiver):
	var p:NativePainter=a[0];var t:float=a[1];var o=a[2];var back:bool=a[3];var ramp:Array=C.fit(o.palette,8);var radius:float=o.radius
	var phi=(t/2.4)*(PI/4);var sheen=-1.7+3.4*clampf(fmod(t/2.4,1)/0.55,0,1);var seen={}
	var dot=func(point):
		var x:float=point[0];var y:float=point[1];var z:float=point[2]
		if (z<0)!=back:return
		var key=floori(x)*1000+floori(y);var f=absf(z)/radius;var q:float=(x-(y+22))/(radius*1.414);var hot=absf(q-sheen)<0.12;var previous=seen.get(key)
		if previous==null or f<previous[2]:seen[key]=[x,y,f,hot or (previous[3] if previous!=null else false)]
	for k in range(8):
		var lon=phi+(k*PI)/4;var lat=-PI/2
		while lat<=PI/2:dot.call(_sphere(radius,lat,lon));lat+=0.7/radius
	var lon=0.0
	while lon<TAU:dot.call(_sphere(radius,0,lon));lon+=0.7/radius
	for point in seen.values():
		var x=point[0];var y=point[1];var f=point[2];var hot=point[3]
		if back:p.blend(x,y,ramp[4],0.32)
		elif hot:p.px(x,y,C.WHITE)
		elif f<0.4:p.px(x,y,ramp[6])
		else:p.blend(x,y,ramp[6] if f<0.7 else ramp[5],0.8 if f<0.7 else 0.55)
static func heal_petal(e,a,_receiver):
	var p:NativePainter=a[0];var k=int(a[1]);var back:bool=a[2];var t:float=_read(e,"t");var pe=_read(e,"petals")[k];var ramp:Array=_read(e,"C")
	var g=pe.a+t*0.4;var near=sin(g)>=0;var bloom:float=_call(_read(e,"bloom"),[k,t])
	if near==back or bloom<=0.02:return
	var ca=cos(g);var sa=sin(g);var rb=6.0;var rt=rb+9*minf(1.2,bloom);var h=(7 if k%2 else 9)*bloom
	var bx=ca*rb;var by=sa*rb*0.3;var tx=ca*rt;var ty=sa*rt*0.3-h;var length=Bridge.hypot([tx-bx,ty-by])
	if length<1.5:return
	var ux=(tx-bx)/length;var uy=(ty-by)/length;var width=pe.w*minf(1,bloom)*(0.35+0.65*absf(sa));var pad=width+1
	p.each(minf(bx,tx)-pad,minf(by,ty)-pad,maxf(bx,tx)+pad,maxf(by,ty)+pad,func(x:float,y:float,sx:int,sy:int):
		var dx:float=x-bx;var dy:float=y-by;var u:float=(dx*ux+dy*uy)/length
		if u<0 or u>1:return
		var half_width:float=width*pow(sin(PI*pow(u,0.6)),0.7)+0.2;var v:float=absf(-dx*uy+dy*ux)/half_width
		if v>1:return
		if u>0.9:p.put(sx,sy,C.WHITE,1);return
		if v>0.7:p.put(sx,sy,ramp[3] if u<0.3 else ramp[5] if u<0.7 else ramp[6],1);return
		if v<0.2 and u>0.15 and u<0.85:p.put(sx,sy,ramp[5] if u<0.55 else ramp[6],0.75 if back else 0.85);return
		p.blend_px(sx,sy,ramp[3] if u<0.45 else ramp[4],0.6 if back else 0.45)
	)
	p.glow(tx,ty,5,ramp[5],0.35*minf(1,bloom))
static func resurrection_shaft(e,a,_receiver):
	var p:NativePainter=a[0];var t:float=_read(e,"t");var ramp:Array=_read(e,"C");var rays:Array=_read(e,"rays");var cores:Array=_read(e,"cores");var motes:Array=_read(e,"motes");var profile=_read(e,"profile")
	var k=M.smooth(0,0.12,t)*(1-M.smooth(3.0,3.75,t))
	if k<=0:return
	for i in range(profile.size()):
		var q=(i-60)/40.0;var intensity=0.0
		for ray in rays:
			var d=(q-ray.o)/ray.w;intensity+=ray.b*exp(-d*d)*(0.72+0.28*sin(t*ray.f+ray.ph))
		profile.put(i,(intensity*0.6+0.35*maxf(0,1-q*q))*M.smooth(1.25,0.7,absf(q)))
	var u=clampf(t/0.6,0,1);var fade=clampf((t-2.9)/(3.6-2.9),0,1)
	var shaft_w=(0.4+(1-0.4)*(1-pow(1-u,3)))*(1+(0.12-1)*pow(fade,3))
	var half_w=func(y):return (8+(25-8)*((y+140)/140))*shaft_w
	var front=-140+(1+140)*pow(clampf(t/0.34,0,1),2);var w0=half_w.call(0.0)*1.3;var profile_values:PackedFloat32Array=profile.floats
	if not p.clipped and p.sn==0:
		var target:NativeFrame=p.frame;var pixels:PackedInt64Array=target.color;var lights:PackedInt64Array=target.light;target.color=PackedInt64Array();target.light=PackedInt64Array()
		var left:int=maxi(target.ox,floori(minf(p.tx+(-w0-1)*p.fx,p.tx+(w0+1)*p.fx)));var right:int=mini(target.ox+target.w-1,ceili(maxf(p.tx+(-w0-1)*p.fx,p.tx+(w0+1)*p.fx)))
		for sy in range(maxi(target.oy,floori(p.ty-140)),mini(target.oy+target.h-1,ceili(p.ty+minf(front,0.5)))+1):
			var y:float=sy+0.5-p.ty;var row_width:float=(8+(25-8)*((y+140)/140))*shaft_w
			var row_shade:float=0.75+0.25*M.smooth(-140,0,y);var row_front:float=M.smooth(front,front-10,y)
			for sx in range(left,right+1):
				var x:float=(sx+0.5-p.tx)*p.fx;var q:float=x/row_width
				if q< -1.5 or q>1.5:continue
				var intensity:float=profile_values[M.js_round(q*40)+60]*k*row_shade*row_front
				if intensity<=0.01:continue
				var index:int=(sy-target.oy)*target.w+sx-target.ox;var color_value:int=ramp[6];var alpha:float=intensity*0.24*p.fade
				if color_value!=0 and alpha>0.004:
					var previous:int=pixels[index]
					if previous==0:pixels[index]=((int(alpha*255)&255)<<24)|(color_value&0xffffff)
					else:
						var da:float=((previous>>24)&255)/255.0;var oa:float=alpha+da*(1-alpha);var ratio:float=alpha/oa
						pixels[index]=((int(oa*255)&255)<<24)|((int(((color_value>>16)&255)*ratio+((previous>>16)&255)*(1-ratio))&255)<<16)|((int(((color_value>>8)&255)*ratio+((previous>>8)&255)*(1-ratio))&255)<<8)|(int((color_value&255)*ratio+(previous&255)*(1-ratio))&255)
				var strength:float=(intensity*0.3)*(p.fade*p.light_k)
				if strength>0.004:
					var previous:int=lights[index];var tint:int=ramp[4]
					lights[index]=0xff000000|(int(minf(255,((previous>>16)&255)+((tint>>16)&255)*strength))<<16)|(int(minf(255,((previous>>8)&255)+((tint>>8)&255)*strength))<<8)|int(minf(255,(previous&255)+(tint&255)*strength))
		target.color=pixels;target.light=lights
		if target.track_writes:target.touch(maxi(0,left-target.ox),maxi(0,floori(p.ty-140)-target.oy));target.touch(mini(target.w-1,right-target.ox),mini(target.h-1,ceili(p.ty+minf(front,0.5))-target.oy))
	else:
		p.each(-w0-1,-140,w0+1,minf(front,0.5),func(x:float,y:float,sx:int,sy:int):
			var q:float=x/half_w.call(y)
			if q < -1.5 or q > 1.5:return
			var intensity:float=profile_values[M.js_round(q*40)+60]*k*(0.75+0.25*M.smooth(-140,0,y))*M.smooth(front,front-10,y)
			if intensity<=0.01:return
			p.blend_px(sx,sy,ramp[6],intensity*0.24);p.add(sx,sy,ramp[4],intensity*0.3)
		)
	for ray in cores:
		var shimmer=0.75+0.25*sin(t*ray.f+ray.ph)
		for y in range(-140,ceili(minf(front,0))):
			var pulse=0.5+0.5*sin(y*0.13-t*11+ray.ph)
			p.dot(ray.o*half_w.call(float(y)),y,C.WHITE if pulse>0.8 else ramp[6],k*shimmer*(0.15+0.55*pulse)*M.smooth(front,front-10,y))
	if t<0.34+0.05 and front> -126:
		var fy=minf(front,0);p.glow(0,fy,14,ramp[5],0.7*k)
		for dy in range(-6,1):p.dot(0,fy+dy,C.WHITE if dy> -3 else ramp[6],1+dy/7.0)
	for mote in motes:
		var y=-140+fmod(fmod(mote.y*140+t*mote.v,140)+140,140)
		if y>front:continue
		var width=half_w.call(y);var x=mote.q*width+sin(t*mote.f+mote.ph)*mote.amp;var index=M.js_round((x/width)*40)+60
		var intensity:float=profile.at(index)*k if index>=0 and index<profile.size() else NAN
		if intensity<0.25:continue
		p.dot(x,y,C.WHITE if intensity>0.75 else ramp[6] if intensity>0.5 else ramp[5],minf(1,intensity*1.4));p.light(x,y,ramp[5],intensity*0.5)
static func _at(buffer,index:int):return buffer[index] if buffer is Array or buffer is PackedByteArray or buffer is PackedInt64Array else buffer.at(index)
static func actor_shape(e,a,_receiver):
	var actor=a[0];var cache=_read(e,"SHAPES");var cached=cache.index(actor.mask)
	if cached>=0:
		var result=cache.items[cached][1]
		if result.x==actor.x and result.y==actor.y:return result
	var mask=actor.mask
	var inside=func(i,j):return i>=0 and j>=0 and i<mask.w and j<mask.h and i==floor(i) and j==floor(j) and _at(mask.data,int(j*mask.w+i))>0
	var edge=[];var out=[]
	for j in range(-1,int(mask.h)+1):
		for i in range(-1,int(mask.w)+1):
			var neighbors=int(inside.call(i-1,j))+int(inside.call(i+1,j))+int(inside.call(i,j-1))+int(inside.call(i,j+1))
			if inside.call(i,j):
				if neighbors<4:edge.append([actor.x+i,actor.y+j])
			elif neighbors:out.append([actor.x+i,actor.y+j])
	var result={"x":actor.x,"y":actor.y,"edge":edge,"out":out,"top":actor.y,"bottom":actor.y+mask.h,"at":func(x,y):return inside.call(floor(x)-actor.x,floor(y)-actor.y)}
	if cached>=0:cache.items[cached]=[actor.mask,result]
	else:cache.items.append([actor.mask,result])
	return result
static func resurrection_body(e,a,_receiver):
	var p:NativePainter=a[0];var t:float=_read(e,"t")
	if t>=1.15+0.6:return
	var actor=_read(e,"A");var shape=_read(e,"S");var ramp:Array=_read(e,"C");var ash:Array=_read(e,"AS")
	var y_line:float=_call(_read(e,"climbY"),[t]);var mask=actor.mask
	for j in range(int(mask.h)):
		for i in range(int(mask.w)):
			var color_value:int=_at(actor.pixels,j*int(mask.w)+i)
			if color_value==0:continue
			var mapped=0
			if t<1.15:
				var d=actor.y+j-y_line
				if d< -0.5:mapped=ash[clampi(floori(C.luma(color_value)*1.1*ash.size()),0,ash.size()-1)]
				elif d<0.5:mapped=C.WHITE
				elif d<1.5:mapped=ramp[6]
				else:
					var k=exp(-(d-1.5)/4)*0.7
					if k>0.08:mapped=C.mix(color_value,ramp[5],k)
			else:
				var u=t-1.15
				if u<0.06:mapped=C.WHITE
				elif u<0.45:mapped=C.mix(color_value,ramp[5],0.55*pow(1-u/0.45,2))
			if mapped:p.dot(actor.x+i,actor.y+j,mapped,1)
	if t<1.15:
		for point in shape.out:
			var d=point[1]-y_line
			if d< -0.5 or d>12:continue
			p.dot(point[0],point[1],C.WHITE if d<1 else ramp[5] if d<5 else ramp[4],1 if d<1 else 1.1-d/12)
		if t>0.5:p.glow(0,y_line,26,ramp[4],0.5);p.glow(0,y_line,8,C.WHITE,0.3);p.glow(0,-18,36,ramp[5],0.16*M.seg(t,0.5,1.15))
	else:
		var u=t-1.15
		if u<0.25:
			for point in shape.out:p.dot(point[0],point[1],C.WHITE if u<0.08 else ramp[5],1-u/0.25)
static func wing_along(_e,a,_receiver):
	var points:Array=a[0];var at:float=a[1];var length=0.0;var lengths=[]
	for i in range(1,points.size()):
		var segment=Bridge.hypot([points[i][0]-points[i-1][0],points[i][1]-points[i-1][1]]);length+=segment;lengths.append(segment)
	var d=at*length
	for i in range(lengths.size()):
		if d<=lengths[i] or i==lengths.size()-1:
			var f=clampf(d/lengths[i],0,1) if lengths[i] else 0
			return [points[i][0]+(points[i+1][0]-points[i][0])*f,points[i][1]+(points[i+1][1]-points[i][1])*f]
		d-=lengths[i]
	return points[-1]
static func _out_back(t:float,s:float)->float:return 0.0 if t<=0 else 1.0 if t>=1 else 1+(s+1)*pow(t-1,3)+s*pow(t-1,2)
static func _wing_beat(t:float)->float:
	if t<1.95:return 0
	if t<2.25:return -0.34*(-(cos(PI*M.seg(t,1.95,2.25))-1)/2)
	if t<2.37:return -0.34+(0.66+0.34)*pow(M.seg(t,2.25,2.37),2)
	return 0.66*(1-_out_back(M.seg(t,2.37,2.8),1.3))
static func resurrection_wing(e,a,_receiver):
	var t:float=a[0];var side:float=a[1];var quills:Array=_read(e,"quills")
	if not e.values.has("__wing_poses"):e.values.__wing_poses={}
	var cache:Dictionary=e.values.__wing_poses;var key=var_to_bytes([t,side])
	if cache.has(key):return cache[key]
	if cache.size()>=128:cache.clear()
	var oa=_out_back(M.seg(t,1.1,1.1+0.4),1.6);var rotation=_wing_beat(t);var angular_velocity=(_wing_beat(t)-_wing_beat(t-0.03))/0.03
	var folded=[[0,0],[2,-2],[3,-3],[4,-3]];var open=[[0,0],[7,-9],[15,-19],[20,-27]];var arm=[]
	for i in range(4):arm.append([folded[i][0]+(open[i][0]-folded[i][0])*oa,folded[i][1]+(open[i][1]-folded[i][1])*oa])
	var cr=cos(rotation);var sr=sin(rotation);var out=[];var alpha=M.smooth(1.1,1.1+0.1,t)
	var place=func(x,y):return [side*(4+x*cr-y*sr),-20+x*sr+y*cr]
	for i in range(quills.size()):
		var q=quills[i];var off=q.off[0 if side>0 else 1]
		if t>=off+0.05:continue
		var opening=_out_back(M.seg(t,1.1+q.open,1.1+q.open+0.42),2);var point=wing_along(null,[arm,q.s],null);var base=place.call(point[0],point[1])
		var angle=q.fold+(q.ang-q.fold)*opening+rotation-clampf(angular_velocity*0.045*[1,0.5,0.3][int(q.kind)],-0.5,0.5)
		out.append({"i":i,"q":q,"x":base[0],"y":base[1],"ang":angle if side>0 else PI-angle,"len":q.len*(0.3+(1-0.3)*opening),"wid":q.wid,"a":alpha,"hot":1 if t<1.1+q.open+0.07 or t>=off else 0})
	var placed_arm=[]
	for point in arm:placed_arm.append(place.call(point[0],point[1]))
	var result={"out":out,"arm":placed_arm};cache[key]=result;return result
static func freeze_floor(_e,a,_receiver):
	var p:NativePainter=a[0];var ramp:Array=a[1];var t:float=a[2];var out:float=a[3]
	for x in range(-38,39):
		var d=absf(x+0.5)/38;var arrive=0.16*(1-d);var age=t-arrive
		if age<0:continue
		var alpha=out*clampf((1.12-d)/0.2,0,1);var growth=M.smooth(0,0.4,age);var h=M.rand([x,31]);var side=-1 if x<0 else 1
		if alpha<=0:continue
		p.dot(x,0,C.WHITE if age<0.05 or h<0.3 else ramp[6],alpha)
		if h<0.55:
			var length=M.js_round(growth*(1+M.rand([x,7])*3.4)*(1-d*0.55))
			for j in range(1,length+1):p.dot(x,-j,C.WHITE if j==length else ramp[5],alpha)
			if length>=2:p.dot(x+side,-length+1,ramp[6],alpha)
			if length>=4:p.dot(x-side,-length+2,ramp[5],alpha)
		var depth=growth*(2+M.rand([x,11])*4)*(1-d*0.5)
		for j in range(1,floori(depth)+1):p.dot(x,j,C.WHITE if M.rand([x*13+j,5])<0.07 else ramp[5] if j<2 else ramp[4] if j<4 else ramp[3],alpha*(1.05-j/(depth+1)))
static func freeze_character(e,a,_receiver):
	var p:NativePainter=a[0];var t:float=_read(e,"t");var actor=_read(e,"A");var ramp:Array=_read(e,"C");var width:int=_read(e,"W");var height:int=_read(e,"H");var order:Array=_read(e,"order");var reach=_read(e,"reach");var ice=_read(e,"ice");var feathers:Array=_read(e,"feathers")
	var thaw=pow(M.seg(t,2.52,2.52+0.36),2)*(height+2)-2 if t>=2.52 else -1.0
	for index in order:
		var age=t-reach.at(index)
		if age<0:break
		var x=int(index)%width;var y=int(index)/width
		if y<thaw:continue
		p.px(actor.x+x,actor.y+y,ramp[7] if y<thaw+1.2 and t>=2.52 else C.WHITE if age<0.016 else ramp[6] if age<0.045 else ice.at(index))
		if age<0.03:p.light(actor.x+x,actor.y+y,ramp[6],0.3)
	if t>=2.52:return
	for feather_data in feathers:
		var growth=clampf((t-feather_data.at)/0.08,0,1)
		if growth<=0:continue
		var length=M.js_round(feather_data.L*growth)
		for j in range(length):p.px(feather_data.x+feather_data.dx*j,feather_data.y+feather_data.dy*j,C.WHITE if j==length-1 else ramp[6])
static func freeze_block(e,a,_receiver):
	var p:NativePainter=a[0];var t:float=_read(e,"t")
	if t>=2.52 or t<0.6-0.08:return
	var ramp:Array=_read(e,"C");var facets:Array=_read(e,"FACETS");var ids=_read(e,"fid");var edges:Array=_read(e,"EDGES")
	var jolt=1 if t>=2.2 and t<2.2+0.06 else (1 if int(floor(t*40))%2 else -1) if t>=2.34 and t<2.46 else 0;var white=t>=2.46
	for facet in facets:
		var shine=0.0
		for sweep in [1.12,1.82]:shine=maxf(shine,sin(PI*clampf((t-sweep-facet.d*0.32)/0.13,0,1)))
		facet.g=shine*(0.35+0.65*facet.lit)
	for y in range(-53,0):
		for x in range(-18,18):
			var id=int(ids.at((y+53)*36+x+18))
			if id<0:continue
			var facet=facets[id];var age=t-facet.at
			if age<0:continue
			if white:p.px(x+jolt,y,C.WHITE);continue
			if age<0.03:p.blend(x+jolt,y,ramp[7],0.55);continue
			var fresh=1-clampf((age-0.03)/0.1,0,1);var shine=facet.g
			p.blend(x+jolt,y,ramp[6] if fresh>0.5 or shine>0.5 else facet.tint,facet.alpha+0.25*fresh+0.15*shine)
			if shine>0.05:p.light(x+jolt,y,ramp[5],0.42*shine)
	for edge in edges:
		if edge.floor or t<edge.at:continue
		var x0=edge.a[0];var y0=edge.a[1];var x1=edge.b[0];var y1=edge.b[1];var fresh=false
		for facet in edge.fs:
			if t-facet.at<0.1 or facet.g>0.6:fresh=true;break
		if edge.outer and edge.lit<0 and not white:p.line(x0+jolt+1,y0,x1+jolt+1,y1,ramp[1])
		if edge.outer:p.glow_line(x0+jolt,y0,x1+jolt,y1,5,ramp[4],0.1)
		p.line(x0+jolt,y0,x1+jolt,y1,ramp[6] if white else C.WHITE if fresh else (C.WHITE if edge.lit>0.3 else ramp[6] if edge.lit> -0.2 else ramp[4]) if edge.outer else ramp[6] if (y0+y1)/2.0< -30 else ramp[5])
	for facet in facets:
		var age=t-facet.at
		if age< -0.07 or age>=0:continue
		var left=((age+0.07)/0.07)*facet.len
		for k in range(facet.pts.size()):
			if left<=0:break
			var point=facet.pts[k];var next=facet.pts[(k+1)%facet.pts.size()];var length=Bridge.hypot([next[0]-point[0],next[1]-point[1]]);var v=minf(1,left/length);left-=length
			p.line(point[0]+jolt,point[1],point[0]+jolt+(next[0]-point[0])*v,point[1]+(next[1]-point[1])*v,C.WHITE)
			if v<1:p.glow(point[0]+jolt+(next[0]-point[0])*v,point[1]+(next[1]-point[1])*v,6,ramp[6],0.6)
	if t>=2.2 and not white:_call(_read(e,"drawFractures"),[p,_read(e,"cracks"),(t-2.2)*150,ramp,{"ox":jolt}])
	if t>=2.34 and not white:_call(_read(e,"drawFractures"),[p,_read(e,"cracks2"),(t-2.34)*190,ramp,{"ox":jolt}])
static func nova_ring(e,a,_receiver):
	var p:NativePainter=a[0];var back:bool=a[1];var t:float=_read(e,"t")
	if t<0.42:return
	var u=clampf((t-0.42)/(0.62+0.15),0,1)
	if u>=1:return
	var ramp:Array=_read(e,"C");var reach:float=_read(e,"REACH");var front=reach*(1-pow(1-clampf((t-0.42)/0.62,0,1),3))
	band(null,[p,0,0,front+2,0.16,maxf(2,10*pow(1-u,0.7)),1 if u<0.75 else (1-u)/0.25,ramp,func(g):return (sin(g)<0)==back,t-0.42<0.1],null)
	if not back:
		for side in [-1,1]:p.glow(side*(front+2),-2,22,ramp[5],0.55*(1-u))

static func _ring_tongue(p:NativePainter,x:float,y:float,h:float,w:float,sx:float,t:float,n:int,hot:Array,layers:Array,randoms:Dictionary):
	var noise9=PackedFloat64Array();var noise4=PackedFloat64Array()
	for r in range(floori(h)+1):
		noise9.append(_sample_noise(t*9+r*0.45,n,randoms));noise4.append(_sample_noise(t*4+r*0.2,n+7,randoms))
	for entry in layers:
		var scale:float=entry[1];var extent:float=h*scale;var color_value:int=hot[int(entry[2])];var width:float=w*entry[0]
		for r in range(floori(extent)+1):
			var u:float=r/maxf(1,extent);var half:float=width*pow(1-u,0.85)*minf(1,(r+1.5)/3.5)+noise9[r]*0.5
			if half<0.3:continue
			var cx:float=x+sx*u*u*scale+noise4[r]*u*1.1;var yy:int=M.js_round(y-r)
			p.pixel_span(M.js_round(cx-half),M.js_round(cx+half),yy,color_value)
static func fire_ring_ring(e,a,_receiver):
	var p:NativePainter=a[0];var back:bool=a[1];var t:float=_read(e,"t");var reach:float=_read(e,"REACH");var hot:Array=_read(e,"H");var k=(t-0.32)/(0.75+0.1)
	if k<0 or k>=1:return
	var front=reach*(1-pow(1-clampf((t-0.32)/0.75,0,1),3))
	band(null,[p,0,0,front+1.5,0.2,maxf(1.5,6*(1-k)),1 if k<0.75 else (1-k)/0.25,[hot[6],hot[4],hot[2],hot[1]],func(g):return (sin(g)<0)==back,k<0.12],null)
static func cycle(_e,a,_receiver):Particles.cycle(a[0],a[1],a[2],a[3],_callback(a[4]),_callback(a[5]))
static func recolor(_e,a,_receiver):
	var p:NativePainter=a[0];var actor=a[1];var fn=_callback(a[2]);var alpha=_callback(_arg(a,3,1));var pixels=actor.pixels
	if pixels==null:return
	for j in range(int(actor.mask.h)):
		for i in range(int(actor.mask.w)):
			var c:int=_at(pixels,j*int(actor.mask.w)+i)
			if c==0:continue
			var x:float=actor.x+i;var y:float=actor.y+j;var mapped=fn.call(c,x,y)
			if mapped:p.dot(x,y,mapped,alpha.call(x,y) if alpha is Callable else alpha)

static func _sample_noise(x:float,seed:int,randoms:Dictionary)->float:
	var i:int=floori(x);var f:float=x-i;var key:int=(seed<<32)|(i&0xffffffff);var next_key:int=(seed<<32)|((i+1)&0xffffffff)
	if not randoms.has(key):randoms[key]=M.rand([i,seed])
	if not randoms.has(next_key):randoms[next_key]=M.rand([i+1,seed])
	return lerpf(randoms[key],randoms[next_key],f*f*(3-2*f))*2-1
static func resurrection_pool(e,a,_receiver):
	var p:NativePainter=a[0];var back:bool=a[1];var t:float=_read(e,"t");var ramp:Array=_read(e,"C")
	var k:float=M.smooth(0,0.12,t)*(1-M.smooth(3.0,3.75,t))*M.smooth(0.34-0.05,0.34+0.1,t)
	var u:float=M.seg(t,0,0.6);var fade:float=M.seg(t,2.9,3.6);var width:float=(8+(25-8)*((0.0+140)/140))*(0.4+(1-0.4)*(1-pow(1-u,3)))*(1+(0.12-1)*pow(fade,3))*1.25
	if k<=0:return
	if back:p.glow(0,-2,width*1.6,ramp[4],0.3*k);return
	for y in range(4):
		for x in range(floori(-width),floori(width)+1):
			var d:float=Bridge.hypot([x/width,y/4.0])
			if d>=1:continue
			var alpha:float=k*(sqrt(1-d)*1.2 if y==0 else (1-d)*0.9)
			p.dot(x,y,ramp[5] if y else C.WHITE,alpha) if d<0.3 else p.dot(x,y,ramp[5] if d<0.6 else ramp[4] if d<0.85 else ramp[3],alpha)

static func ice_in_poly(_e,a,_receiver):return _in_poly(a[0],a[1],a[2])
static func _in_poly(points:Array,x:float,y:float)->bool:
	var inside:bool=false;var j:int=points.size()-1
	for i in range(points.size()):
		var xi:float=points[i][0];var yi:float=points[i][1];var xj:float=points[j][0];var yj:float=points[j][1]
		if (yi>y)!=(yj>y) and x<(xj-xi)*(y-yi)/(yj-yi)+xi:inside=not inside
		j=i
	return inside
static func ice_centroid(_e,a,_receiver):return Ice.centroid(a[0])
static func ice_of(_e,a,_receiver):return Ice.ice_of(a[0],a[1])

static func shield_draw(e,a,_receiver):
	var p:NativePainter=a[0];var t:float=a[1];var o:Dictionary=a[2];var ramp:Array=C.fit(o.palette,8);var radius:float=o.radius;var rf:float=sqrt(radius*radius-22*22);var actor=o.actor
	if actor!=null:
		for point in _call(_read(e,"shapeOf"),[actor]).out:p.light(point[0],point[1],ramp[5],0.3)
	shield_film(e,[p,t,o,false],null);shield_lattice(e,[p,t,o,false],null)
	var sheen:float=-1.7+3.4*clampf(fmod(t/2.4,1)/0.55,0,1);var count:int=ceili(radius*TAU*1.4)
	for j in range(count):
		var g:float=(float(j)/count)*TAU;var ca:float=cos(g);var sa:float=sin(g);var x:float=ca*radius;var y:float=-22+sa*radius;var q:float=(x-(y+22))/(radius*1.414)
		var lit:float=cos(g+2.36);var hot:bool=absf(q-sheen)<0.15
		p.dot(x,y,C.WHITE if hot or lit>0.75 else ramp[6] if lit> -0.2 else ramp[5],1)
		p.dot(ca*(radius-1),-22+sa*(radius-1),ramp[4],0.35+0.3*lit)
	p.glow_ring(0,-22,radius,6,ramp[4],0.32)
	var phi:float=(t/2.4)*(PI/4)
	for k in range(8):
		var point:Array=_sphere(radius,0,phi+(k*PI)/4);var x:float=point[0];var y:float=point[1];var z:float=point[2]
		if z<radius*0.15:continue
		p.px(x,y,C.WHITE)
		if z>radius*0.45:
			for offset in [[1,0],[-1,0],[0,1],[0,-1]]:p.blend(x+offset[0],y+offset[1],ramp[6],0.7)
		p.glow(x,y,4,ramp[5],0.3)
	var pole:Array=_sphere(radius,PI/2,0)
	Shapes.sparkle(p,pole[0],pole[1],2+M.js_round(1.5+1.5*sin((t/2.4)*TAU*2)),C.WHITE,ramp[6],0.45)
	for off in [0,PI]:
		var g:float=(t/2.4)*TAU+off+0.8;Shapes.sparkle(p,cos(g)*radius,-22+sin(g)*radius,2,C.WHITE,ramp[6],0.4)
	var g:float=3.55
	while g<4.2:p.px(cos(g)*radius*0.74,-22+sin(g)*radius*0.74,C.WHITE if g>3.7 and g<4.05 else ramp[6]);g+=0.04
	p.px(cos(3.4)*radius*0.62,-22+sin(3.4)*radius*0.62,C.WHITE)
	g=0.45
	while g<0.8:p.dot(cos(g)*radius*0.8,-22+sin(g)*radius*0.8,ramp[5],0.6);g+=0.05
	Holy.oval(p,0,0,rf,rf*0.26,func(angle):return C.WHITE if sin(angle)>0.6 else ramp[6],1,func(angle):return sin(angle)>=0)
	for i in range(-2,3):p.glow(i*rf*0.5,0,12,ramp[4],0.18)
	Particles.cycle(t,2.4,9,o.seed,func(random):return random.range_value(0.35,0.6),func(age,life,random,_index):
		var point:Array=_sphere(radius,random.range_value(-1.2,1.3),random.range_value(0,TAU)+phi);var k:float=sin((age/life)*PI)
		if point[2]<0:return
		Shapes.sparkle(p,point[0],point[1],1+2.5*k*random.range_value(0.6,1),C.WHITE,ramp[6],0.45*k)
	)
	Particles.cycle(t,2.4,12,o.seed+1,func(random):return random.range_value(1.2,2.2),func(age,life,random,_index):
		var x0:float=random.range_value(-0.7,0.7)*radius;var u:float=age/life;var x:float=x0+sin(u*6+random.range_value(0,6))*2;var y:float=-22+radius*0.75-u*radius*1.4
		if Bridge.hypot([x,y+22])>radius-2:return
		p.dot(x,y,ramp[6] if u<0.5 else ramp[5],sin(u*PI));p.light(x,y,ramp[5],0.4*sin(u*PI))
	)

static func _panes(receiver):
	if not receiver.has("__native_proxy"):receiver.__native_proxy=Ice.Panes.new()
	var proxy=receiver.__native_proxy;proxy.list=receiver.list;proxy.ground=_callback(receiver.ground)
	proxy.onLand=_callback(receiver.onLand);proxy.onCrumble=_callback(receiver.onCrumble);proxy.onSkid=_callback(receiver.onSkid)
	return proxy
static func panes_draw(_e,a,receiver):_panes(receiver).draw(a[0],a[1])
static func panes_update(_e,a,receiver):
	var dt:float=a[0];var proxy=_panes(receiver);var items:Array=receiver.list
	for i in range(items.size()-1,-1,-1):
		var q:Dictionary=items[i];q.life-=dt
		if q.life<=0:items.remove_at(i);continue
		var floor_y:float=proxy.ground.call(q.x)-0.5
		if q.rest and q.get("crumble")!=null:
			q.restT=q.get("restT",0)+dt
			if q.restT>q.crumble:
				if proxy.onCrumble!=null:proxy.onCrumble.call(q)
				items.remove_at(i);continue
		if q.rest:
			if absf(q.vx)>8 and proxy.onSkid!=null:proxy.onSkid.call(q,q.x,floor_y+0.5)
			q.x+=q.vx*dt;q.vx-=q.vx*7*dt;q.a+=q.va*dt;q.va-=q.va*9*dt;q.vf-=q.vf*9*dt;q.f+=q.vf*dt;q.y-=proxy.seat(q)-floor_y;continue
		q.vy+=Sim.GRAVITY*q.g*dt;q.vx-=q.vx*q.drag*dt;q.vy-=q.vy*q.drag*dt;q.x+=q.vx*dt;q.y+=q.vy*dt;q.a+=q.va*dt;q.f+=q.vf*dt
		var low:float=proxy.seat(q)
		if q.g<=0 or low<floor_y or q.vy<=0:continue
		q.y-=low-floor_y
		if q.vy>70:
			q.hits=q.get("hits",0)+1
			if proxy.onLand!=null:proxy.onLand.call(q,q.x,floor_y+0.5,q.vy)
		if q.brittle and q.vy>70 and q.hits>=float(q.brittle):items.remove_at(i);continue
		if q.vy>70 and q.bounce>0:q.vy=-q.vy*q.bounce;q.vx*=0.75;q.va*=0.6;q.vf*=0.5
		else:q.rest=true;q.vy=0
static func _feathers(receiver):
	if not receiver.has("__native_proxy"):receiver.__native_proxy=Holy.Feathers.new(receiver.R,receiver.floor)
	var proxy=receiver.__native_proxy;proxy.list=receiver.list;proxy.floor=receiver.floor;return proxy
static func feathers_update(_e,a,receiver):_feathers(receiver).update(a[0])
static func feathers_draw(e,a,receiver):
	var p:NativePainter=a[0];var ramp:Array=a[1];var layer:String=str(a[2]) if a.size()>2 and a[2]!=null else ""
	for f in receiver.list:
		if f.delay>0 or not layer.is_empty() and ("back" if f.back else "front")!=layer:continue
		var k:float=f.life/f.max;var alpha:float=minf(minf(1,f.life/0.45),f.age/0.06);var ca:float=cos(f.a);var sa:float=sin(f.a)
		feather(e,[p,f.x-ca*f.len/2,f.y-sa*f.len/2,f.a,f.len,f.wid,ramp,alpha,f.side,1 if f.age<0.06 else 0,0.2],null)
		p.glow(f.x,f.y,4+f.len*0.5,ramp[ramp.size()-3],0.22*alpha*(0.4+0.6*k))
static func freeze_on(e,a,_receiver):
	var x:float=a[0];var y:float=a[1];var actor=_read(e,"A");var width:int=_read(e,"W");var height:int=_read(e,"H")
	return x>=0 and y>=0 and x<width and y<height and _at(actor.mask.data,int(y*width+x))>0

static func resurrection_draw_wing(e,a,_receiver):
	var p:NativePainter=a[0];var side:float=a[1];var t:float=_read(e,"t");var pose:Dictionary=resurrection_wing(e,[t,side],null);var feathers:Array=pose.out;var arm:Array=pose.arm
	if feathers.is_empty():return
	var ramp:Array=_read(e,"C");var wing_ramp:Array=_read(e,"WING");var quills:Array=_read(e,"quills");var order:Array=feathers.duplicate();order.sort_custom(func(f,g):return f.q.ang>g.q.ang)
	for f in order:
		if f.q.kind!=2:feather(e,[p,f.x,f.y,f.ang,f.len,f.wid,wing_ramp,f.a,side,f.hot],null)
	for f in order:
		if f.q.kind==2:feather(e,[p,f.x,f.y,f.ang,f.len,f.wid,wing_ramp,f.a,side,f.hot],null)
	var k:float=float(feathers.size())/quills.size();var alpha:float=feathers[0].a
	if k>0.5:
		var underside=[]
		for point in arm:underside.append([point[0],point[1]+1])
		p.polyline(underside,ramp[5],alpha);p.polyline(arm,C.WHITE,alpha)
	p.glow(side*28,-36,38,ramp[4],0.26*alpha*k)
	var g:float=fmod((t-1.1-0.45)*1.3,1)
	if k>0.9 and t>1.1+0.45 and g<0.8:
		var point:Array=wing_along(null,[arm,g/0.8],null);Shapes.sparkle(p,point[0],point[1],2+sin((g/0.8)*PI)*2,C.WHITE,ramp[6],0.4)
	p.glow_line(arm[0][0],arm[0][1],arm[3][0],arm[3][1],7,ramp[5],0.25*alpha*k)
	if t>2.25+0.03 and t<2.37+0.14:
		var history=[]
		for j in range(10):history.append(resurrection_wing(e,[maxf(2.25+0.01,t-j*0.012),side],null).out)
		for index in [6,8,10]:
			var points=[]
			for past in history:
				for f in past:
					if f.i==index:points.append([f.x+cos(f.ang)*(f.len-1),f.y+sin(f.ang)*(f.len-1)]);break
			var fade:float=1-M.smooth(2.37,2.37+0.14,t)
			for j in range(1,points.size()):p.line(points[j-1][0],points[j-1][1],points[j][0],points[j][1],C.WHITE if j<3 else ramp[6] if j<6 else ramp[4],fade*(1.1-j/10.0))

static func fire_ring_back(e,a,_receiver):
	var p:NativePainter=a[0];var t:float=_read(e,"t");var reach:float=_read(e,"REACH");var hot:Array=_read(e,"H");var glow:int=_read(e,"GLOW")
	fire_ring_scorch(e,[p],null);fire_ring_ring(e,[p,true],null);fire_ring_flames(e,[p,true],null);FireSim.sim_draw(p,_particles(_read(e,"ps")),hot,"back")
	var front:float=reach*(1-pow(1-clampf((t-0.32)/0.75,0,1),3));var k:float=0 if t<0.32 else 1-M.smooth(0.32+0.75,0.32+0.75+1.4,t)
	if k>0:
		for i in range(16):p.glow(cos((i/16.0)*TAU)*front,sin((i/16.0)*TAU)*front*0.2-3,16,glow,0.2*k)
static func fire_ring_draw(e,a,_receiver):
	var p:NativePainter=a[0];var t:float=_read(e,"t");var hot:Array=_read(e,"H");var glow:int=_read(e,"GLOW")
	fire_ring_ring(e,[p,false],null);fire_ring_flames(e,[p,false],null);FireSim.sim_draw(p,_particles(_read(e,"ps")),hot,"front")
	if t<0.32:p.glow(0,-3,8+22*(t/0.32),glow,0.6*(t/0.32))
	if t>=0.32 and t<0.32+0.1:
		var k:float=1-(t-0.32)/0.1;p.ellipse(0,-1,14*(0.6+0.4*k),4,hot[2]);p.ellipse(0,-1,9*(0.6+0.4*k),2.6,C.WHITE if k>0.5 else hot[1])
	var k:float=M.smooth(0.32-0.05,0.32,t)*(1-M.smooth(0.32+0.75*0.5,0.32+0.75+1.2,t))
	if k>0:p.glow(0,-6,92,glow,0.3*k)
	_lights(_read(e,"lights")).draw(p)
static func nova_crystals(e,a,_receiver):
	var p:NativePainter=a[0];var back:bool=a[1];var t:float=_read(e,"t");var sites:Array=_read(e,"sites");var ramp:Array=_read(e,"C");var dim:Array=_read(e,"DIM");var melt:float=M.smooth(1.95,1.95+0.7,t)
	for site in sites:
		if not site.up or site.back!=back or melt>=1:continue
		var growth:float=_out_back(clampf((t-site.t0)/0.1,0,1),2.6);var white:bool=t<site.t0+0.03;var sweep:float=fmod((t-site.t0)*0.7+site.phase*3,1.6)/0.5
		for part in site.parts:crystal(e,[p,site.x+part.dx,-1 if back else 0,part.h*growth*(1-melt),part.w*(1-melt*0.3),part.lean*growth*(1-melt),dim if back else ramp,{"white":white,"glint":sweep if sweep<=1 else -1}],null)
static func nova_draw(e,a,_receiver):
	var p:NativePainter=a[0];var t:float=_read(e,"t");var reach:float=_read(e,"REACH");var ramp:Array=_read(e,"C")
	nova_ring(e,[p,false],null);nova_crystals(e,[p,false],null)
	if t<0.42:_call(_read(e,"snowflake"),[p,ramp,0,-24,(2+5.5*pow(t/0.42,2))*(1+0.25*exp(-pow(t-0.42*0.55,2)/0.002)+0.3*exp(-pow(t-0.42*0.85,2)/0.002)),t*4,t/0.42])
	elif t<0.42+0.22:
		var alpha:float=(t-0.42)/0.22;Sim.flare(p,0,-24,36*pow(1-alpha,1.5),1-alpha,ramp);p.glow(0,-24,46,C.WHITE,0.6*(1-alpha))
	if t>0.42:
		var k:float=(1-M.smooth(1.95,1.95+0.7+0.3,t))*(0.85+0.15*sin(t*2.4));var front:float=reach*(1-pow(1-clampf((t-0.42)/0.62,0,1),3))
		for i in range(-3,4):p.glow((i/3.5)*front,-4,26,ramp[4],0.16*k)
	_bits(_read(e,"bits")).draw(p);_particles(_read(e,"ps")).draw(p,"front");_lights(_read(e,"lights")).draw(p)

static func resurrection_halo(e,a,_receiver):
	var p:NativePainter=a[0];var t:float=_read(e,"t");var ramp:Array=_read(e,"C");var hx:float=_read(e,"HX");var hy:float=_read(e,"HY");var rx:float=_read(e,"HRX");var ry:float=_read(e,"HRY");var h0:float=_read(e,"H0");var h1:float=_read(e,"H1")
	var form:float=1-pow(1-M.seg(t,h0,h1),3);var k:float=1-M.smooth(3.35,3.9,t)
	if form<=0 or k<=0:return
	var white:bool=t>=h1 and t<h1+0.06;var glint:float=(t-h1)*4.2+PI/2
	for j in range(96):
		var g:float=(j/96.0)*TAU;var from_front:float=absf(fmod(fmod(g-PI/2+PI,TAU)+TAU,TAU)-PI)
		if from_front>form*PI+0.02:continue
		var x:float=hx+cos(g)*rx*(0.9+0.1*form);var y:float=hy+sin(g)*ry;var near:bool=sin(g)>=0
		var distance:float=absf(fmod(fmod(g-glint+PI,TAU)+TAU,TAU)-PI);var hot:bool=white or distance<0.22 or from_front>form*PI-0.3
		if near:p.dot(x,y,C.WHITE if hot else ramp[6],k);p.dot(x,y+1,ramp[6] if hot else ramp[4],k)
		else:p.dot(x,y,ramp[6] if hot else ramp[5],k*0.9)
	p.glow(hx,hy,20,ramp[4],0.4*k*form);p.glow(hx,hy+1,9,C.WHITE,0.2*k*form)
	var gx:float=hx+cos(glint)*rx;var gy:float=hy+sin(glint)*ry
	if t>h1 and sin(glint)>0.2:Shapes.sparkle(p,gx,gy+0.5,2+2*sin(glint),ramp[6],ramp[4],0.35*k)
	if t>=h1 and t<h1+0.3:Shapes.sparkle(p,hx,hy+ry+0.5,7*(1-(t-h1)/0.3),C.WHITE,ramp[5],0.6)

static func _resurrection_wave(e,p,t:float,back:bool):
	if t<=0.34 or t>=0.34+0.4:return
	var u:float=M.seg(t,0.34,0.34+0.4);var ramp:Array=_read(e,"C")
	band(e,[p,0,0,4+32*(1-pow(1-u,3)),0.18,2.5*(1-u)+0.5,1.1-u,ramp.slice(3),func(g):return sin(g)<0 if back else sin(g)>=0,t<0.34+0.06],null)
static func resurrection_back(e,a,_receiver):
	var p:NativePainter=a[0];var t:float=_read(e,"t");var wing_ramp:Array=_read(e,"WING")
	resurrection_shaft(e,[p],null);resurrection_pool(e,[p,true],null);_resurrection_wave(e,p,t,true)
	for side in [-1,1]:resurrection_draw_wing(e,[p,side],null)
	feathers_draw(e,[p,wing_ramp,"back"],_read(e,"loose"));_particles(_read(e,"ps")).draw(p,"back")
static func resurrection_draw(e,a,_receiver):
	var p:NativePainter=a[0];var t:float=_read(e,"t");var ramp:Array=_read(e,"C");var shape:Dictionary=_read(e,"S");var wing_ramp:Array=_read(e,"WING");var sc:float=_read(e,"SC")
	resurrection_pool(e,[p,false],null);_resurrection_wave(e,p,t,false);resurrection_body(e,[p],null)
	if t>2.37-0.03 and t<2.37+0.45:
		var u:float=M.seg(t,2.37-0.03,2.37+0.45);var front:float=10+70*(1-pow(1-u,3))
		for side in [-1,1]:
			for d in range(12):p.dot(side*(front-d),0,C.WHITE if d<2 else ramp[6] if d<5 else ramp[4],(1-u)*(1-d/12.0)*1.3)
	var wk:float=M.smooth(1.1,1.1+0.2,t)*(1-M.smooth(sc,sc+0.3,t))
	if wk>0:
		for point in shape.out:
			if point[1]< -8:p.light(point[0],point[1],ramp[5],0.55*wk)
		p.glow(0,-34,76,ramp[4],0.14*wk)
	resurrection_halo(e,[p],null)
	if t>=1.15 and t<1.15+0.22:Sim.flare(p,0,shape.top-1,22*(1-(t-1.15)/0.22),1-(t-1.15)/0.22,ramp.slice(3))
	feathers_draw(e,[p,wing_ramp,"front"],_read(e,"loose"));_particles(_read(e,"ps")).draw(p,"front");_lights(_read(e,"lights")).draw(p)

static func weather_field(e,a,r):return Weather.field(e,a,r)
static func weather_sample(e,a,r):return Weather.sample(e,a,r)
static func weather_pass(e,a,r):return Weather.shader_pass(e,a,r)
static func weather_trips(e,a,r):return Weather.trips(e,a,r)

static func weather_rows(e,a,r):return Weather.shader_rows(e,a,r)

static func act_draw(e,a,r):return ActKernels.draw(e,a,r)

static func grid_idx(e,a,r):return GridKernels.idx(e,a,r)

static func grid_set_value(e,a,r):return GridKernels.set_value(e,a,r)

static func grid_get_value(e,a,r):return GridKernels.get_value(e,a,r)

static func grid_shade(e,a,r):return GridKernels.shade(e,a,r)

static func grid_ellipse(e,a,r):return GridKernels.ellipse(e,a,r)

static func grid_line(e,a,r):return GridKernels.line(e,a,r)

static func grid_draw(e,a,r):return GridKernels.draw(e,a,r)

static func grid_outline(e,a,r):return GridKernels.outline(e,a,r)

static func grid_clear(e,a,r):return GridKernels.clear(e,a,r)

static func explosion_lobe(e,a,r):return Explosions.lobe(e,a,r)
static func arcane_floor_ring(e,a,r):return Explosions.floor_ring(e,a,r)

static func aurora_blur(e,a,r):return Weather.aurora_blur(e,a,r)

static func aurora_curtain(e,a,r):return Weather.aurora_curtain(e,a,r)

static func aurora_row(e,a,r):return Weather.aurora_row(e,a,r)
