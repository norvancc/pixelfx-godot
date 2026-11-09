@tool
extends "../../core/effect.gd"
## Port of src/fx/fire/campfire.js from the pinned PixelFX source.
## The emitter is closed-form and loopable; every particle is reconstructed from (time, seed).
const C = preload("../../core/color.gd")
const M = preload("../../core/math.gd")
const P = preload("../../core/particles.gd")
const F = preload("../fire_common.gd")

const D := 3.0
const META := {
	"id": "pixelfx.campfire", "name": "Campfire", "duration": D, "loop": true, "fps": 30,
	"cacheable": true, "layers": ["front"],
	"options": {
		"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"],
		"wood": ["#0e080a", "#24130f", "#3b2216", "#5a3520", "#8a5a34", "#b9884f"], "height": 22.0, "seed": 3,
	},
}
const LOGS := [[-19.0, 2.0, 15.0, -12.0, 3.4], [19.0, 2.0, -15.0, -12.0, 3.4]]
const TONGUES := [[-7.5, -7.0, 0.42, 1.8,1], [7.5, -7.0, 0.46, 1.8,1], [-3.0, -9.0, 0.78, 2.0,1], [3.2, -9.0, 0.82, 2.0,1], [-12.0, -3.0, 0.14, 1.3], [12.5, -3.0, 0.16, 1.3], [-9.5, -4.5, 0.3, 1.9], [9.5, -4.5, 0.34, 1.9], [-5.0, -6.0, 0.6, 2.6], [5.2, -6.0, 0.66, 2.6], [0.0, -7.0, 1.0, 3.4]]

func metadata() -> Dictionary: return META

func parameter_schema() -> Array[Dictionary]:
	var palette := PackedColorArray(); var wood := PackedColorArray()
	for value in META.options.palette: palette.append(Color(value))
	for value in META.options.wood: wood.append(Color(value))
	return [
		{"name": "height", "type": TYPE_FLOAT, "default": 22.0, "min": 8.0, "max": 48.0, "hint": PROPERTY_HINT_RANGE, "hint_string": "8,48,1"},
		{"name": "seed", "type": TYPE_INT, "default": 3},
		{"name": "light", "type": TYPE_FLOAT, "default": 1.0, "min": 0.0, "max": 3.0, "hint": PROPERTY_HINT_RANGE, "hint_string": "0,3,0.05"},
		{"name": "palette", "type": TYPE_PACKED_COLOR_ARRAY, "default": palette},
		{"name": "wood", "type": TYPE_PACKED_COLOR_ARRAY, "default": wood},
	]

func bounds(o: Dictionary) -> Rect2i: return Rect2i(-96,-ceili(o.height+112),192,ceili(o.height+208))
func _draw_log(p,L: Array,w: Array,hot: Array,u0: float,u1: float,t: float,seed_value: int) -> void:
	var x0 = L[0]; var y0 = L[1]; var x1 = L[2]; var y1 = L[3]; var r = L[4]; var dx = x1-x0; var dy = y1-y0; var length = sqrt(dx*dx+dy*dy); var ax = dx/length; var ay = dy/length
	var nx = -ay; var ny = ax
	if ny < 0: nx = -nx; ny = -ny
	var rim = 1-1.05/r
	p.shade(minf(x0,x1)-r-1,minf(y0,y1)-r-1,maxf(x0,x1)+r+1,maxf(y0,y1)+r+1,func(x,y,out):
		var along = (x-x0)*ax+(y-y0)*ay; var u = along/length; var side = ((x-x0)*nx+(y-y0)*ny)/r
		if u < u0 or u > u1 or absf(side)>1: return 0
		var burn = clampf(1.2-absf(x)/8,0,1); var lane = M.js_round(side*r*0.85); var run = M.rand([floori(along/3),lane,seed_value])
		if absf(side)>rim or along>length-1: return hot[7] if side<0 and burn>0.4 else w[0]
		if burn>0.35 and lane<2:
			if run<0.55 and lane>-2:
				var g = 0.5+0.5*sin((t/D)*PI*6+M.rand([floori(along/2),lane,seed_value+1])*6.3); out.k = 0.3*burn*g
				return hot[3] if g>0.72 else (hot[4] if g>0.4 else hot[5])
			return w[1] if lane < -1 else w[0]
		if lane <= -2: return w[2] if run<0.25 else C.mix(w[3],hot[4],0.45*burn)
		if lane == -1: return w[1] if run<0.45 else w[2]
		if lane == 0: return w[1] if run<0.2 else w[2]
		return w[0] if run<0.4 else w[1]
	)
	if u0 <= 0: p.ellipse(x0,y0,r*0.62,r+0.2,func(d,_a): return w[0] if d>0.78 else (w[5] if d>0.56 else (w[4] if d>0.32 else w[3])))
func _coals(p,w: Array,hot: Array,t: float,seed_value: int) -> void:
	var ash = C.fit(["#2a2530","#4a4350","#6b6270"],3)
	p.shade(-15,-3,15,2,func(x,y,out):
		var dx = x/14; var dy = (y+0.3)/2.2; var d = dx*dx+dy*dy
		if d>1: return 0
		var h = M.rand([floori(x/2),floori(y),seed_value+20])
		if d>0.55 and h<0.55: return ash[2 if h<0.15 else (1 if h<0.32 else 0)]
		if h>0.5:
			var g = (0.5+0.5*sin((t/D)*PI*4+h*40))*(1.1-d); out.k = 0.35*g
			return hot[2] if g>0.7 else (hot[3] if g>0.5 else (hot[4] if g>0.3 else hot[5]))
		return w[1] if h>0.3 else w[0]
	)
func draw(p,t: float,o: Dictionary) -> void:
	var fire = C.fit(o.palette,9); var hot = fire.duplicate(); hot.reverse(); var wood = C.fit(o.wood,6); var seed_value = o.seed; var r = M.Rng.new(seed_value); var hc = o.height
	var N = func(rate,seed_arg=0,off=0): return M.noise_for(t,D,rate,seed_arg,off)
	var fla = func(tt): return 0.74+0.16*M.noise_for(tt,D,7.3,seed_value+1)+0.1*M.noise_for(tt,D,19,seed_value+2)
	var fl = fla.call(t); var glow = C.mix(C.mix(hot[3],hot[4],0.5),C.WHITE,0.25); var smoke_color = C.mix(C.hex("#5b5566"),hot[6],0.25)
	var sparks = [hot[1],hot[2],hot[4],hot[5]]; var emb = [hot[1],hot[2],hot[4],hot[6]]; var tongues = []
	for i in range(TONGUES.size()):
		var q = TONGUES[i]
		tongues.append({"dx":q[0]+r.range_value(-0.4,0.4),"y":q[1],"h":3+hc*q[2]*r.range_value(0.92,1.08),"w":q[3]*r.range_value(0.9,1.1),"back":q[4] if q.size()>4 else 0,"env":q[2],"n":(seed_value*7+i)*13})
	var lean = func(tt): return M.noise_for(tt,D,0.67,seed_value+90)*0.12
	var height_fn = func(i,tt):
		var q = tongues[i]; var leap = maxf(0,M.noise_for(tt,D,2.6,q.n+70)-0.55)*1.4
		return (q.h+0.25*q.h*M.noise_for(tt,D,3.3,q.n)+q.h*leap)*(0.9+0.1*fla.call(tt))
	var sweep = func(i,tt,h): return M.noise_for(tt,D,2.2,tongues[i].n+40)*(1+h*0.08)+lean.call(tt)*h*0.9-clampf(tongues[i].dx*0.3,-2.5,2.5)
	var tip = func(i,tt):
		var h = height_fn.call(i,tt); return [tongues[i].dx+sweep.call(i,tt,h)*0.85,tongues[i].y-h*0.88+3,h]
	var tongue_at = func(i):
		var q = tongues[i]; var h = height_fn.call(i,t)
		F.flame_tongue(p,q.dx,q.y,h,q.w,sweep.call(i,t,h),N,q.n,hot,F.BACK_LAYERS if q.back else (F.BIG_LAYERS if q.w>2.2 else F.LAYERS),0.5,1.1+h*0.04)
	P.looped(t,D,48,seed_value+300,func(g,_i): return {"x":g.range_value(-5,5),"y":-hc*0.8-g.range_value(0,8),"vx":g.range_value(-2,2),"vy":-g.range_value(10,17),"life":g.range_value(2,2.9),"s":g.range_value(2.4,3.8)},func(q,age,_i):
		var d = P.drift(q.x,q.y,q.vx,q.vy,age,4,-20,1.6,1)
		F.smoke_puff(p,d[0]+M.noise_for(t-age,D,0.8,seed_value+60)*(2+3*age),d[1],1-age/q.life,q.s,smoke_color)
	)
	var puffs = []
	P.looped(t,D,tongues.size()*24,seed_value+200,func(g,j):
		var i = j % tongues.size(); var fire_life = g.range_value(0.14,0.3); var smokes = g.chance(0.45)
		return {"i":i,"fire":fire_life,"smokes":smokes,"sl":g.range_value(0.8,1.4),"ox":g.range_value(-1,1),"oy":g.range_value(0,4),"vx":g.range_value(-4,4),"vy":-g.range_value(15,30),"s":g.range_value(0.8,1.6)*(0.8+0.6*tongues[i].env),"f":g.next(),"life":fire_life+(1.4 if smokes else 0.0)},func(q,age,_i):
		var at = tip.call(q.i,t-age); var d = P.drift(at[0]+q.ox,at[1]+q.oy,q.vx,q.vy,minf(age,q.fire),0,-95,5,3.2)
		if age<q.fire: puffs.append([d[0],d[1],1-age/q.fire,q.s,q.f]); return
		if age-q.fire>q.sl: return
		var sd = P.drift(d[0],d[1],d[2]*0.6,d[3]*0.6-6,age-q.fire,2,-16,1.6,1.2)
		F.smoke_puff(p,sd[0],sd[1],1-(age-q.fire)/q.sl,q.s*0.7,0)
	)
	_coals(p,wood,hot,t,seed_value)
	for log_data in LOGS: _draw_log(p,log_data,wood,hot,0.56,1,t,seed_value+11)
	for i in range(tongues.size()):
		if tongues[i].back: tongue_at.call(i)
	P.looped(t,D,90,seed_value+210,func(g,_i): return {"x":g.range_value(-10,10),"y":-g.range_value(3,8),"vx":g.range_value(-5,5),"vy":-g.range_value(20,40),"life":g.range_value(0.16,0.3),"s":g.range_value(1,1.8),"f":g.next()},func(q,age,_i):
		var d = P.drift(q.x,q.y,q.vx,q.vy,age,0,-95,5,3.2); F.fire_puff(p,d[0],d[1],1-age/q.life,q.s,q.f,hot)
	)
	for i in range(tongues.size()):
		if not tongues[i].back: tongue_at.call(i)
	P.looped(t,D,tongues.size()*12,seed_value+220,func(g,j): return {"i":j%tongues.size(),"vx":g.range_value(-3,3),"vy":-g.range_value(12,22),"s":g.range_value(0.9,1.6)*(0.8+0.5*tongues[j%tongues.size()].env),"life":0.26},func(q,age,_i):
		var at = tip.call(q.i,t-age); F.lick(p,at[0]+q.vx*age,at[1]-2+q.vy*age,1-age/q.life,q.s,hot)
	)
	for q in puffs: F.fire_puff(p,q[0],q[1],q[2],q[3],q[4],hot)
	for log_data in LOGS: _draw_log(p,log_data,wood,hot,0,0.56,t,seed_value+11)
	P.looped(t,D,4,seed_value+400,func(g,_i): return {"x":g.range_value(-9,9),"y":-g.range_value(4,9),"n":g.int_value(3,5),"seed":g.int_value(0,1000000),"life":0.7},func(q,age,_i):
		if age<0.08: p.px(q.x,q.y,C.WHITE); p.glow(q.x,q.y,12,hot[1],0.7*(1-age/0.08))
		var g = M.Rng.new(q.seed)
		for j in range(q.n):
			var a = -PI/2+g.range_value(-0.8,0.8); var sp = g.range_value(110,220); var life = g.range_value(0.25,0.6)
			if age>=life: continue
			var d = F.spark_at(q.x,q.y,cos(a)*sp,sin(a)*sp,age,0); F.spark(p,d[0],d[1],d[2],d[3],1-age/life,sparks)
	)
	P.looped(t,D,36,seed_value+500,func(g,_i): return {"x":g.range_value(-7,7),"y":-g.range_value(8,18),"vx":g.range_value(-15,15),"vy":-g.range_value(25,60),"life":g.range_value(1.1,2.5),"s":2.0 if g.chance(0.15) else g.range_value(1,1.6),"a":g.range_value(0,6.3),"b":g.range_value(0,6.3)},func(q,age,_i):
		var d = P.drift(q.x,q.y,q.vx,q.vy,age,0,-30,1.6,1.6); F.ember(p,d[0]+7*(sin(age*2.3+q.a)-sin(q.a)),d[1]+2*(sin(age*3+q.b)-sin(q.b)),1-age/q.life,q.s,emb,age*40+q.a)
	)
	var br = 0.92+0.08*N.call(0.67,seed_value+3); var lx = lean.call(t)*12
	p.glow(lx,-8,74*br*(0.9+0.1*fl),glow,0.3*fl)
	for q in [[-6,-17,0.85],[0,-21,1.0],[6,-17,0.85]]:
		p.glow(q[0]+lx,q[1],46*br,glow,0.3*q[2]*fl); p.glow(q[0]*0.6,q[1]+13,15,hot[2],0.16*q[2]*fl)
	p.glow(0,-3,9,hot[0],0.16*fl); F.floor_light(p,0,0.5,48,8,glow,0.3*fl)
