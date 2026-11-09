@tool
extends "../../core/effect.gd"
## Native port of pinned PixelFX 0.3.0 algorithms; MIT (c) Patch / Hugo Duprez.
const _C = preload("../../core/color.gd")
const _M = preload("../../core/math.gd")
const _P = preload("../../core/particles.gd")
const _S = preload("../../core/sim.gd")
const _E = preload("../../core/ease.gd")
const _A = preload("../analytic_helpers.gd")
const _H = preload("holy_common.gd")
const _R = preload("../simulation_bridge.gd")
const _B = preload("../simulation_bridge.gd")
## Source: src/fx/holy/feather-burst.js
const META = {"id":"pixelfx.feather_burst","name":"Feather burst","desc":"A white puff pops and throws feathers that brake hard, then rock from side to side as they sink and fade, with down drifting after them.","tags":["holy","feather","burst","poof","angel","bird","one-shot"],"size":[160,160],"origin":[80,60],"duration":3,"loop":false,"fps":30,"bg":"dark","options":{"palette":["#4a4560","#7a7494","#aaa5c2","#d6d3e6","#f4f3fa","#ffffff"],"glow":"#fff0c0","seed":4},"cacheable":false,"layers":["back","front"]}
func metadata() -> Dictionary: return META
func parameter_schema() -> Array[Dictionary]:
	var fields: Array[Dictionary] = []
	for key in META.options:
		var value = META.options[key]
		if value is Array:
			var colors = PackedColorArray()
			for item in value: colors.append(Color(item))
			fields.append({"name":key,"type":TYPE_PACKED_COLOR_ARRAY,"default":colors})
		elif value is String:
			fields.append({"name":key,"type":TYPE_COLOR,"default":Color(value)})
		elif value is bool:
			fields.append({"name":key,"type":TYPE_BOOL,"default":value})
		elif key == "seed": fields.append({"name":key,"type":TYPE_INT,"default":int(value)})
		else:
			var limits = {}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	for field in fields:
		if field.name in ["count","shafts"]: field.type=TYPE_INT; field.default=int(field.default)
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-176, -156, 352, 352)
var o = {}
var F
var G
var R
var ps
var lights
var loose
var lobes
var _capture_t_10
func create(options: Dictionary):
	o = options
	F = _C.fit(o.palette, 6)
	G = _B.color(o.glow)
	R = _M.Rng.new(o.seed)
	ps = _S.Particles.new({"rng": R, "ground": _R.weak_callback(self, "_weak_callback_0"), "sparks": [_C.WHITE, F[int(4)], F[int(3)], F[int(2)]]})
	lights = _S.Lights.new()
	loose = _H.Feathers.new(R, 1000000)
	lobes = _B.make_array(11, func(_unused, i, _unused2=null, _unused3=null):
		var a = (((float(i) / 11) * TAU) + R.range_value((-0.25), 0.25))
		var d = R.range_value(5, 14)
		return {"x": (cos(a) * d), "y": ((sin(a) * d) * 0.8), "r0": R.range_value(2.5, 4), "r1": R.range_value(6, 9.5), "life": R.range_value(0.45, 0.8)})
	if true:
		var i = 0
		while (i < 20):
			var a = (((float(i) / 20) * TAU) + R.range_value((-0.15), 0.15))
			var sp = R.range_value(110, 230)
			var up = (0.7 if (sin(a) < 0) else 0.9)
			loose.add({"x": (cos(a) * 3), "y": (sin(a) * 3), "vx": (cos(a) * sp), "vy": (((sin(a) * sp) * up) - 20), "a": (a + R.range_value((-0.5), 0.5)), "len": R.range_value(10, 14), "wid": R.range_value(2.6, 3.4), "life": R.range_value(1.9, 2.6), "delay": R.range_value(0, 0.03), "sink": R.range_value(26, 38), "amp": R.range_value(8, 13)})
			i += 1.0
	if true:
		var i = 0
		while (i < 10):
			var a = R.range_value(0, TAU)
			var sp = R.range_value(50, 130)
			loose.add({"x": 0, "y": 0, "vx": (cos(a) * sp), "vy": ((sin(a) * sp) - 20), "a": R.range_value(0, TAU), "len": R.range_value(6, 8), "wid": R.range_value(1.8, 2.2), "life": R.range_value(1.6, 2.4), "back": true, "sink": R.range_value(18, 28)})
			i += 1.0
	if true:
		var i = 0
		while (i < 26):
			var a = R.range_value(0, TAU)
			var sp = R.range_value(30, 140)
			ps.spawn(_S.P.FLAKE, R.range_value((-3), 3), R.range_value((-3), 3), (cos(a) * sp), ((sin(a) * sp) - 15), R.range_value(1.4, 2.6), (_C.WHITE if R.chance(0.6) else F[int(4)]), R.range_value(0.6, 1.6))
			i += 1.0
	if true:
		var i = 0
		while (i < 10):
			var a = R.range_value(0, TAU)
			var sp = R.range_value(60, 160)
			ps.spawn(_S.P.STAR, 0, 0, (cos(a) * sp), (sin(a) * sp), R.range_value(0.3, 0.6), (_C.WHITE if R.chance(0.5) else G), R.range_value(0.8, 2.2))
			i += 1.0
	lights.add(0, 0, 50, G, 0.75, 0.45)
	lights.add(0, 0, 20, _C.WHITE, 0.7, 0.1)
	_capture_t_10 = [0]

	return self
func puff(p):
	for l in lobes:
		var u = (float(_capture_t_10[0]) / l.life)
		if (u >= 1):
			continue
		var e = _E.out_cubic(u)
		var x = (l.x * (0.4 + (e * 1.3)))
		var y = ((l.y * (0.4 + (e * 1.3))) - (u * 5))
		var r = ((l.r0 + ((l.r1 - l.r0) * _E.out_cubic(minf(1, (u * 3))))) * (1 - _E.in_quad(u)))
		if (r < 0.6):
			continue
		p.circle(x, y, (r + 0.8), F[int(2)])
		p.circle(x, y, r, func(d, a, _unused2=null, _unused3=null):
			return (F[int(3)] if ((d > 0.55) and (sin((a + 0.8)) > 0.3)) else (_C.WHITE if ((d < 0.45) and (sin((a + 0.8)) < (-0.2))) else F[int(4)])))
func update(dt: float, _options: Dictionary) -> void:
	_capture_t_10[0] += dt
	if ((((_capture_t_10[0] > 0.3) and (_capture_t_10[0] < 2.2)) and loose.count) and R.chance(0.14)):
		var q = R.pick(loose.list)
		if (q.delay <= 0):
			ps.spawn(_S.P.STAR, (q.x + R.range_value((-2), 2)), (q.y + R.range_value((-1), 1)), 0, 0, R.range_value(0.2, 0.4), (_C.WHITE if R.chance(0.5) else G), R.range_value(1, 2.2))
	ps.update(dt)
	loose.update(dt)
	lights.update(dt)
func draw_back(p, _time_argument: float, _options: Dictionary) -> void:
	loose.draw(p, F, "back")
	ps.draw(p, "back")
	puff(p)
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	if (_capture_t_10[0] < 0.07):
		p.circle(0, 0, (9 * (1 - (float(_capture_t_10[0]) / 0.14))), _C.WHITE)
	if (_capture_t_10[0] < 0.25):
		var u = (float(_capture_t_10[0]) / 0.25)
		p.ring(0, 0, (6 + (24 * _E.out_cubic(u))), maxf(1, (2.5 * (1 - u))), func(v, _unused1=null, _unused2=null, _unused3=null):
			return (_C.WHITE if (v > 0.5) else _C.mix(F[int(4)], G, 0.4)), (1.1 - u))
	if (_capture_t_10[0] < 0.2):
		_A.sparkle(p, 0, 0, (10 * (1 - (float(_capture_t_10[0]) / 0.2))), _C.WHITE, G, 0.6)
	p.glow(0, 4, 46, G, (0.28 * (1 - _M.smooth(0, 1.3, _capture_t_10[0]))))
	loose.draw(p, F, "front")
	ps.draw(p, "front")
	lights.draw(p)
func _weak_callback_0(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	return INF
