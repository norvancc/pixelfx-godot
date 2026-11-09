@tool
extends "../../core/effect.gd"
## Port of src/fx/explosions/small-explosion.js from the pinned PixelFX source.
## The blast intentionally keeps a live particle list: rocks land, brands continue burning and dust is spawned on impact.
const C = preload("../../core/color.gd")
const M = preload("../../core/math.gd")
const Sim = preload("../../core/sim.gd")
const P = Sim.P
const PF = Sim.PF
const B = Sim.B
const E = preload("../../core/ease.gd")
const F = preload("../fire_common.gd")

const META := {
	"id": "pixelfx.small_explosion", "name": "Small explosion", "duration": 5.4, "loop": false, "fps": 30,
	"cacheable": false, "layers": ["back", "front"],
	"options": {"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"], "stone": "#4a3f69", "size": 1.0, "seed": 7},
}
const SOOT = 0xff120a0d
const SOOT2 = 0xff1d1217
const OUTLINE = 0xff22141a
var _ramp: Array
var _rng
var _ps
var _rocks
var _lights
var _blazes
var _flashes: Array
var _rings: Array
var _st: Dictionary
var _t = 0.0
var _size = 1.0
var _rad = 18.0
var _y = -5.4
func metadata() -> Dictionary: return META

func parameter_schema() -> Array[Dictionary]:
	var palette := PackedColorArray(); for value in META.options.palette: palette.append(Color(value))
	return [
		{"name": "size", "type": TYPE_FLOAT, "default": 1.0, "min": 0.5, "max": 2.0, "hint": PROPERTY_HINT_RANGE, "hint_string": "0.5,2,0.05"},
		{"name": "seed", "type": TYPE_INT, "default": 7},
		{"name": "light", "type": TYPE_FLOAT, "default": 1.0, "min": 0.0, "max": 3.0, "hint": PROPERTY_HINT_RANGE, "hint_string": "0,3,0.05"},
		{"name": "palette", "type": TYPE_PACKED_COLOR_ARRAY, "default": palette},
		{"name": "stone", "type": TYPE_COLOR, "default": Color("#4a3f69")},
	]

func bounds(o: Dictionary) -> Rect2i:
	# Bound the drag-limited dust wake and rising smoke, rather than uploading empty 512² layers.
	var width = ceili(128*o.size+32); var top = ceili(148*sqrt(o.size)+96)
	return Rect2i(-width,-top,width*2,top+ceili(64*maxf(1,o.size)))

func _land(x: float,y: float) -> void:
	_blazes.add(x,y-0.25,_rng.range_value(0.9,1.5),_rng.range_value(0.55,0.85))

func create(o: Dictionary):
	_ramp = C.fit(o.palette,8); _size = o.size; _rad = 18*_size; _y = -_rad*0.3; _t = 0.0
	var power = 0.9*pow(_size,0.8); var earth = 1.6
	var stone = C.hex(o.stone.to_html(false) if o.stone is Color else o.stone)
	_st = {"light":C.mix(C.scale_color(stone,1.35),C.WHITE,0.08),"body":stone,"shade":C.scale_color(stone,0.64),"dust":C.mix(C.scale_color(stone,1.2),C.rgb(150,140,150),0.3)}
	_rng = M.Rng.new(o.seed)
	var floor_fn = func(_x): return 0.0
	_ps = Sim.Particles.new({"rng":_rng,"ground":floor_fn,"sparks":[_ramp[6],_ramp[5],_ramp[3],_ramp[2]],"on_land":_land})
	_blazes = Sim.Blazes.new(_ps); _rocks = Sim.Bits.new({"ground":floor_fn}); _lights = Sim.Lights.new(); _flashes = []; _rings = []
	var r = _rng; var rad = _rad; var y = _y
	_flashes.append({"r":rad*1.05,"life":0.06,"max":0.06})
	_rings.append({"r0":rad*0.45,"r1":rad*2.7,"life":0.34,"max":0.34,"thick":3.0,"c":_ramp[5]})
	_rings.append({"r0":rad*0.3,"r1":rad*1.6,"life":0.22,"max":0.22,"thick":1.8,"c":_ramp[3]})
	_lights.add(0,y,rad*3.4,C.rgb(255,176,96),0.6*power,0.7); _lights.add(0,y,rad*1.6,C.WHITE,0.6,0.08)
	for i in range(5): _ps.spawn(P.FIRE,r.range_value(-2.5,2.5),y+r.range_value(-2.5,2.5),r.range_value(-20,20),r.range_value(-40,-10),r.range_value(0.18,0.3),0,r.range_value(rad*0.4,rad*0.55))
	for i in range(M.js_round(28*power)):
		var a = r.range_value(0,TAU); var d = r.range_value(0,rad*0.55); var sp = r.range_value(40,210)*power
		_ps.spawn(P.FIRE,cos(a)*d,y+sin(a)*d,cos(a)*sp,sin(a)*sp*0.8-40,r.range_value(0.55,1.15),0,r.range_value(rad*0.22,rad*0.46),0,PF.SMOKES | PF.BIG if r.chance(0.45) else 0)
	for i in range(5):
		var a = r.range_value(0,TAU); var d = r.range_value(rad*0.1,rad*0.5)
		_ps.spawn(P.SMOKE,cos(a)*d,y+sin(a)*d,cos(a)*30,sin(a)*20-30,r.range_value(0.9,1.5),C.rgb(34,29,38),r.range_value(rad*0.15,rad*0.26),r.range_value(0.06,0.2),PF.BIG)
	for i in range(5): _ps.spawn(P.FIRE,r.range_value(-rad*0.25,rad*0.25),y,r.range_value(-12,12),r.range_value(-180,-100),r.range_value(0.8,1.3),0,r.range_value(rad*0.24,rad*0.36),r.range_value(0,0.1),PF.SMOKES | PF.BIG if r.chance(0.6) else 0)
	for i in range(M.js_round(10*power)):
		var a = r.range_value(0,TAU); var d = r.range_value(0,rad*0.7); var sp = r.range_value(15,100)
		_ps.spawn(P.SMOKE,cos(a)*d,y+sin(a)*d,cos(a)*sp,sin(a)*sp*0.6-35,r.range_value(1.8,2.8),0,r.range_value(rad*0.26,rad*0.44),r.range_value(0.12,0.45),PF.BIG)
	for i in range(M.js_round(80*power)):
		var a = r.range_value(0,TAU); var sp = r.range_value(140,380)*power
		_ps.spawn(P.SPARK,0,y,cos(a)*sp,sin(a)*sp-70,r.range_value(0.18,0.6))
	for i in range(M.js_round(40*power)):
		var a = r.range_value(0,TAU); var sp = r.range_value(30,150)
		_ps.spawn(P.EMBER,cos(a)*rad*0.4,y+sin(a)*rad*0.4,cos(a)*sp,sin(a)*sp-75,r.range_value(1.2,2.6),_ramp[3])
	# Upstream reevaluates this random loop bound on every iteration.
	var i = 0
	while i < M.js_round(r.range_value(9,14)*maxf(0,power-0.55)):
		var a = -PI/2+r.range_value(-1.35,1.35); var sp = r.range_value(170,330)
		_ps.spawn(P.BRAND,0,y,cos(a)*sp,sin(a)*sp,r.range_value(0.7,1.3)); i += 1
	for j in range(M.js_round(rad*0.5)):
		var side = r.sign_value()
		_ps.spawn(P.SMOKE,side*r.range_value(0,rad*0.6),-r.range_value(1,5+rad*0.04),side*r.range_value(3,9.5)*rad,-r.range_value(2,15),r.range_value(1.1,2.0),_st.dust,r.range_value(4,7)+rad/6,r.range_value(0,0.06),PF.BIG)
	for j in range(ceili(26*minf(1.5,_size))):
		_rocks.add({"kind":B.CHUNK,"x":r.range_value(-0.4,0.4)*rad,"y":-3.0,"vx":r.range_value(-9,9)*rad*0.25,"vy":-r.range_value(7,16)*rad*0.9,"g":1.0,"drag":0.4,"bounce":0.3,"life":r.range_value(1.8,2.6),"a":r.range_value(0,TAU),"va":r.range_value(-16,16),"s":r.int_value(1,3)})
	for j in range(M.js_round(earth*rad*4)):
		var u = r.range_value(-1,1); var a = -PI/2+u*0.5; var sp = r.range_value(5,15)*rad*(1-0.45*absf(u))
		_ps.spawn(P.GRIT,u*0.25*rad,-1,cos(a)*sp,sin(a)*sp,r.range_value(1.2,2.2),r.pick([_st.light,_st.body,_st.body,_st.shade]),2 if r.chance(0.45) else 1)
	for j in range(M.js_round(earth*12)):
		_ps.spawn(P.SMOKE,r.range_value(-0.3,0.3)*rad,-r.range_value(2,rad*0.6),r.range_value(-15,15),-r.range_value(60,190)*earth*0.6,r.range_value(1.6,2.6),_st.dust,r.range_value(5,9)*sqrt(_size)+rad/7,r.range_value(0,0.15),PF.BIG)
	return self

func update(dt: float,_o: Dictionary) -> void:
	_t += dt
	for items in [_flashes,_rings]:
		for i in range(items.size()-1,-1,-1):
			items[i].life -= dt
			if items[i].life <= 0: items.remove_at(i)
	_rocks.update(dt)
	for b in _rocks.list:
		if b.rest and not b.get("dusted",false):
			b.dusted = true
			for i in range(3): _ps.spawn(P.DUST,b.x+_rng.range_value(-1.5,1.5),-0.5,_rng.sign_value()*_rng.range_value(10,55)*0.6,-_rng.range_value(2,22),_rng.range_value(0.3,0.65),_st.dust,_rng.range_value(1.3,2.8))
	_blazes.update(dt); _ps.update(dt); _lights.update(dt)

func _scorch(p) -> void:
	var fade = 1-M.smooth(META.duration-1.2,META.duration-0.2,_t)
	if fade <= 0 or _t == 0: return
	var rx = 22*_size*minf(1,_t/0.08); var heat = _ramp.duplicate(); heat.reverse()
	for y in range(3):
		for x in range(floori(-rx),ceili(rx)+1):
			var dx = (x+0.5)/rx; var dy = (y+0.5)/4; var d = sqrt(dx*dx+dy*dy)
			if d > 1: continue
			var k = M.rand([x*31+y,3]); var temp = pow(clampf(1-_t/(1.2+_rad/14),0,1),1.4)*(1.25-d)-k*0.35
			if temp > 0.06:
				var c = heat[mini(heat.size()-1,floori((1-minf(1,temp))*(heat.size()-1)))]; p.dot(x,y,c,fade)
				if (x & 3) == 0: p.glow(x+0.5,y,6,c,0.18*temp*fade)
			else: p.dot(x,y,SOOT if d < 0.5 else SOOT2,(1.0 if d < 0.95-k*0.3 else 1-d)*fade)

func _rock(p,b: Dictionary) -> void:
	var r = 0.6+b.s*0.75; var fade = minf(1,b.life/0.5); var lx = cos(b.a)*r*0.4; var ly = sin(b.a)*r*0.4
	p.shade(b.x-r-1,b.y-r-1,b.x+r+1,b.y+r+1,func(x,y,out):
		var dx = x-b.x; var dy = y-b.y; var d = sqrt(dx*1.15*dx*1.15+dy*dy)
		if d > r+0.9: return
		var lit = dx*lx+dy*ly
		out.c = OUTLINE if d > r else (_st.light if lit < -0.4 else (_st.shade if lit > 0.6 else _st.body)); out.a = fade
	)

func draw_back(p,_time: float,_o: Dictionary) -> void:
	_scorch(p); _ps.draw(p,"back"); _blazes.draw_back(p)
	var k = _t/0.5
	if k < 1: Sim.band(p,0,0.5,80*_size*E.out_cubic(k),0.16,maxf(1,(2+_rad/9)*(1-k)),1.15-k,[_st.body,_st.light,_ramp[3],_ramp[6]],func(a): return sin(a)<0)

func draw(p,_time: float,_o: Dictionary) -> void:
	var k = _t/0.5
	if k < 1: Sim.band(p,0,0.5,80*_size*E.out_cubic(k),0.16,maxf(1,(2+_rad/9)*(1-k)),1.15-k,[_st.body,_st.light,_ramp[3],_ramp[6]],func(a): return sin(a)>=0)
	for b in _rocks.list: _rock(p,b)
	_ps.draw(p,"front")
	for f in _flashes:
		var k2 = f.life/f.max; var r = f.r*(0.8+0.2*k2)
		p.circle(0,_y,r+1.2,_ramp[2]); p.circle(0,_y,r,_ramp[6] if k2>0.45 else _ramp[5]); p.circle(0,_y,r*0.6,C.WHITE if k2>0.45 else _ramp[6])
	for ring in _rings:
		var k2 = ring.life/ring.max; var e = 1-pow(k2,3)
		p.ring(0,_y,ring.r0+(ring.r1-ring.r0)*e,maxf(1,ring.thick*k2+0.4),ring.c,minf(1,k2*1.6))
	_lights.draw(p)
