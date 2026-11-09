@tool
extends "../../core/effect.gd"
## Native port of pinned PixelFX 0.3.0 algorithms; MIT (c) Patch / Hugo Duprez.
const _C = preload("../../core/color.gd")
const _M = preload("../../core/math.gd")
const _P = preload("../../core/particles.gd")
const _S = preload("../../core/sim.gd")
const _E = preload("../../core/ease.gd")
const _A = preload("../analytic_helpers.gd")
const _I = preload("ice_common.gd")
const _R = preload("../simulation_bridge.gd")
const _B = preload("../simulation_bridge.gd")
## Source: src/fx/ice/snowflake-burst.js
const META = {"id":"pixelfx.snowflake_burst","name":"Snowflake burst","desc":"A cold pop: frost gathers and flashes white in a ring, then crisp six-armed snowflakes spin out, slow, twinkle and drift down to settle and melt.","tags":["ice","snow","snowflake","burst","magic","one-shot"],"size":[140,120],"origin":[70,106],"duration":3.2,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#151a3d","#212f6b","#2c58aa","#3a8bd8","#62c8f4","#a6ecff","#dcfbff","#ffffff"],"count":9,"seed":8},"cacheable":false,"layers":["front"]}
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
			var limits = {"count":[1,18]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	for field in fields:
		if field.name in ["count","shafts"]: field.type=TYPE_INT; field.default=int(field.default)
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-166, -202, 332, 312)
var POP = 0.16
var CY = (-48)
var o = {}
var C
var R
var ps
var lights
var flakes
var SIZES
var _capture_t_12
var _capture_popped_13
func create(options: Dictionary):
	o = options
	C = _C.fit(o.palette, 8)
	R = _M.Rng.new(o.seed)
	ps = _S.Particles.new({"rng": R, "ground": _R.weak_callback(self, "floor_y"), "sparks": [C[int(7)], C[int(6)], C[int(5)], C[int(4)]], "haze": C[int(5)]})
	lights = _S.Lights.new()
	flakes = []
	SIZES = [2, 0, 1, 0, 2, 0, 1, 0, 1]
	if true:
		var i = 0
		while (i < o.count):
			var z = SIZES[int(fmod(i, SIZES.size()))]
			var r = (R.range_value(9.5, 11.5) if (z == 2) else (R.range_value(6, 7.5) if (z == 1) else R.range_value(3, 4.5)))
			var a = ((((float(i) / o.count) * TAU) + R.range_value((-0.3), 0.3)) + 0.4)
			var sp = (R.range_value(80, 120) * (1.4 - (float(r) / 14)))
			_R.push_items(flakes, [{"x": 0, "y": CY, "vx": (cos(a) * sp), "vy": (((sin(a) * sp) * 0.85) - 20), "r": r, "rot": R.range_value(0, TAU), "w0": (R.sign_value() * R.range_value(7, 12)), "w1": (R.sign_value() * R.range_value(0.4, 1)), "d": _I.flake_design(R), "life": R.range_value(2.1, 2.8), "age": 0, "ph": R.range_value(0, TAU), "tw": R.range_value(0.5, 0.85), "tw0": R.range_value(0.15, 0.6), "rest": false, "popped": false}])
			i += 1.0
	_capture_t_12 = [0]
	_capture_popped_13 = [false]

	return self
func floor_y(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	return 0
func sz(f, _unused1=null, _unused2=null, _unused3=null):
	return ((f.r * minf(1, _E.out_back(clampf((float(f.age) / 0.18), 0.0, 1.0), 2))) * minf(1, (float((f.life - f.age)) / 0.35)))
func update(dt: float, _options: Dictionary) -> void:
	_capture_t_12[0] += dt
	if ((_capture_t_12[0] < (POP - 0.03)) and R.chance(0.8)):
		var a = R.range_value(0, TAU)
		var D = R.range_value(22, 44)
		var T = R.range_value(0.12, 0.16)
		var v = (float((D * 3)) / (exp((3 * T)) - 1))
		ps.spawn(_S.P.STREAK, (cos(a) * D), (CY + (sin(a) * D)), ((-cos(a)) * v), ((-sin(a)) * v), T, (C[int(6)] if R.chance(0.5) else C[int(5)]))
	if ((not _capture_popped_13[0]) and (_capture_t_12[0] >= POP)):
		_capture_popped_13[0] = true
		lights.add(0, CY, 44, _C.WHITE, 0.8, 0.1)
		lights.add(0, CY, 72, C[int(4)], 0.5, 0.6)
		if true:
			var i = 0
			while (i < 22):
				var a = R.range_value(0, TAU)
				var sp = R.range_value(80, 150)
				ps.spawn(_S.P.MOTE, 0, CY, (cos(a) * sp), (sin(a) * sp), R.range_value(0.25, 0.5), (C[int(6)] if R.chance(0.5) else C[int(5)]), R.range_value(0.6, 1))
				i += 1.0
		if true:
			var i = 0
			while (i < 18):
				var a = R.range_value((-PI), 0.2)
				var sp = R.range_value(30, 110)
				ps.spawn(_S.P.FLAKE, 0, CY, (cos(a) * sp), (sin(a) * sp), R.range_value(1, 1.6), (_C.WHITE if R.chance(0.6) else C[int(6)]), R.range_value(0.5, 1.5))
				i += 1.0
		if true:
			var i = 0
			while (i < 12):
				var a = R.range_value(0, TAU)
				var d = R.range_value(10, 44)
				ps.spawn(_S.P.STAR, (cos(a) * d), (CY + ((sin(a) * d) * 0.85)), 0, R.range_value(2, 6), R.range_value(0.3, 0.6), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.8, 2.2), R.range_value(0.08, 1.6))
				i += 1.0
	if _capture_popped_13[0]:
		for f in flakes:
			f.age += dt
			if (f.age >= f.life):
				continue
			if (not f.rest):
				f.vx -= ((f.vx * 2.8) * dt)
				f.vy -= (((f.vy * 2.8) * dt) - (26 * dt))
				f.x += ((f.vx * dt) + ((sin(((_capture_t_12[0] * 1.8) + f.ph)) * 5) * dt))
				f.y += (f.vy * dt)
				f.rot += ((f.w1 + ((f.w0 - f.w1) * exp(((-f.age) * 2.5)))) * dt)
				if (f.y > ((-sz(f)) * 0.3)):
					f.rest = true
					f.y = (-1)
					f.life = minf(f.life, (f.age + 0.6))
			if ((not f.popped) and ((f.life - f.age) < 0.1)):
				f.popped = true
				if true:
					var i = 0
					while (i < 2):
						ps.spawn(_S.P.STAR, (f.x + R.range_value((-2), 2)), (f.y + R.range_value((-2), 2)), R.range_value((-6), 6), (-R.range_value(2, 8)), R.range_value(0.2, 0.4), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.8, 1.6))
						i += 1.0
	ps.update(dt)
	lights.update(dt)
	_I.end_by(_capture_t_12[0], META.duration, [ps])
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	if (_capture_t_12[0] < POP):
		var k = (float(_capture_t_12[0]) / POP)
		_I.snowflake(p, 0, CY, (1 + ((3.2 * k) * k)), (_capture_t_12[0] * 20), flakes[int(0)].d, C, {"hot": k})
		p.glow(0, CY, (8 + (14 * k)), C[int(5)], (0.3 + (0.4 * k)))
	var q = (_capture_t_12[0] - POP)
	if ((q >= 0) and (q < 0.4)):
		if (q < 0.07):
			p.circle(0, CY, ((6 * (1 - (float(q) / 0.07))) + 1), _C.WHITE)
		_S.flare(p, 0, CY, (28 * pow(maxf(0, (1 - (float(q) / 0.26))), 1.5)), (1 - (float(q) / 0.26)), C)
		var e = _E.out_cubic((float(q) / 0.4))
		var r = (5 + (34 * e))
		p.ring(0, CY, r, maxf(1, (2.4 * (1 - e))), (_C.WHITE if (q < 0.08) else (C[int(6)] if (q < 0.2) else C[int(5)])), (1.15 - e))
		p.glow_ring(0, CY, r, 5, C[int(5)], (0.4 * (1 - e)))
	if _capture_popped_13[0]:
		p.glow(0, CY, 46, C[int(4)], (0.3 * (1 - _M.smooth(POP, (POP + 1.6), _capture_t_12[0]))))
	for f in flakes:
		if ((not _capture_popped_13[0]) if (not _capture_popped_13[0]) else (f.age >= f.life)):
			continue
		var r = sz(f)
		var tw = (pow(maxf(0, sin(((float((f.age - f.tw0)) / f.tw) * TAU))), 8) * (1 if (f.age > f.tw0) else 0))
		if f.rest:
			var L = maxf(1, _M.js_round(((r * 1.2) * (float((f.life - f.age)) / 0.6))))
			if true:
				var i = (-L)
				while (i <= L):
					p.px((f.x + i), (-1), (C[int(5)] if (absf(i) == L) else (_C.WHITE if (i == 0) else C[int(6)])))
					i += 1.0
			p.glow(f.x, (-1), (3 + L), C[int(4)], 0.3)
			continue
		_I.snowflake(p, f.x, f.y, r, f.rot, f.d, C, {"hot": maxf(tw, (1 - clampf((float(f.age) / 0.12), 0.0, 1.0)))})
		p.glow(f.x, f.y, (6 + (r * 1.4)), C[int(4)], 0.12)
		if (tw > 0.5):
			_S.flare(p, f.x, f.y, ((3 + (r * 0.7)) * tw), tw, C)
	ps.draw(p)
	lights.draw(p)
