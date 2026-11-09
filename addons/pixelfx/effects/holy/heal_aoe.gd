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
## Source: src/fx/holy/heal-aoe.js
const META = {"id":"pixelfx.heal_aoe","name":"Healing ring","desc":"A seed of green light sinks into the floor and a soft ring rolls out from it; the floor glows where it passes and plus signs sprout and float up.","tags":["holy","heal","aoe","ring","plus","ground","one-shot"],"size":[256,136],"origin":[128,104],"duration":2.9,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#0e2a24","#14472f","#1d6e3a","#2f9a45","#5cc654","#a0e46c","#dcffb4","#ffffff"],"reach":104,"seed":6},"cacheable":false,"layers":["back","front"]}
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
			var limits = {"reach":[40,160]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	for field in fields:
		if field.name in ["count","shafts"]: field.type=TYPE_INT; field.default=int(field.default)
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-280, -200, 560, 328)
var SY = 0.2
var SEED = 0.3
var ROLL = 1
var o = {}
var C
var REACH
var R
var ps
var lights
var sites
var riders
var _capture_t_15
var _capture_released_16
func create(options: Dictionary):
	o = options
	C = _C.fit(o.palette, 8)
	REACH = o.reach
	R = _M.Rng.new(o.seed)
	ps = _S.Particles.new({"rng": R, "ground": _R.weak_callback(self, "_weak_callback_0"), "sparks": [_C.WHITE, C[int(6)], C[int(5)], C[int(4)]]})
	lights = _S.Lights.new()


	sites = _B.make_array(26, func(_unused, i, _unused2=null, _unused3=null):
		var a = R.range_value(0, TAU)
		var d = (REACH * sqrt(R.range_value(0.04, 0.92)))
		var big = (fmod(i, 5) < 2)
		return {"x": (cos(a) * d), "z": (sin(a) * d), "t0": (passed(d) + R.range_value(0, 0.06)), "rise": R.range_value(18, 34), "life": R.range_value(0.9, 1.3), "sway": R.range_value(0, TAU), "L": ((3 + (1 if (fmod(i, 5) == 0) else 0)) if big else (1 if (fmod(i, 5) == 2) else 2)), "thick": (3 if big else 1), "popped": false})
	riders = _B.make_array(14, func(_unused, i, _unused2=null, _unused3=null):
		return {"a": (((float(i) / 14) * TAU) + R.range_value((-0.2), 0.2)), "w": (R.range_value(0.6, 1.1) * (1 if fmod(i, 2) else (-1)))})
	_capture_t_15 = [0]
	_capture_released_16 = [false]



	return self
func wash(p):
	var fr = front(_capture_t_15[0])
	if ((fr < 2) if (fr < 2) else (_capture_t_15[0] > 2.6)):
		return null
	p.shade(((-fr) - 1), (((-fr) * SY) - 1), (fr + 1), ((fr * SY) + 1), func(x, y, out, _unused3=null):
		var d = _R.hypot([x, (float(y) / SY)])
		if (d > fr):
			return null
		var age = (_capture_t_15[0] - passed(d))
		var k = ((exp((float((-age)) / 0.35)) * _M.smooth(fr, (fr - 6), d)) * (1 - _M.smooth(1.4, 1.9, _capture_t_15[0])))
		if (k < 0.04):
			return null
		out.l = C[int(4)]
		out.k = (0.32 * k))
func ring(p, back):
	if (_capture_t_15[0] < SEED):
		return null
	var u = _M.seg(_capture_t_15[0], SEED, ((SEED + ROLL) + 0.25))
	var fr = front(_capture_t_15[0])
	var k = (1 if (u < 0.7) else (float((1 - u)) / 0.3))
	if (k <= 0):
		return null
	var keep = ((func(g, _unused1=null, _unused2=null, _unused3=null):
		return (sin(g) < 0)) if back else (func(g, _unused1=null, _unused2=null, _unused3=null):
		return (sin(g) >= 0)))
	_S.band(p, 0, 0, fr, SY, maxf(2, (7 * (1 - (u * 0.7)))), k, _R.slice_value(C, 2), keep, (_capture_t_15[0] < (SEED + 0.08)))
	_H.oval(p, 0, 0, (fr + 1), ((fr + 1) * SY), func(g, _unused1=null, _unused2=null, _unused3=null):
		return (_C.WHITE if (sin(g) > 0.3) else C[int(6)]), (k * (0.7 if back else 1)), keep)
	if true:
		var j = 0
		var n = ceili((fr * 0.9))
		while (j < n):
			var g = ((float(j) / n) * TAU)
			var near = (sin(g) >= 0)
			if ((near == back) if (near == back) else (_M.rand([j, floori((_capture_t_15[0] * 20))]) > 0.45)):
				j += 1.0
				continue
			var x = (cos(g) * fr)
			var y = ((sin(g) * fr) * SY)
			var h = (((1 + (_M.rand([j, 7]) * 4)) * k) * (1 if near else 0.6))
			if true:
				var i = 1
				while (i <= h):
					p.dot(x, (y - i), (_C.WHITE if (i > (h - 1)) else C[int(6)]), (k * (1.2 - (float(i) / (h + 1)))))
					i += 1.0
			j += 1.0
	for r in riders:
		var g = (r.a + ((r.w * (_capture_t_15[0] - SEED)) * 2.2))
		var near = (sin(g) >= 0)
		if (near == back):
			continue
		var x = (cos(g) * fr)
		var y = ((sin(g) * fr) * SY)
		if near:
			_A.sparkle(p, x, (y - 1), (2 + (1 if (sin(((_capture_t_15[0] * 9) + (r.a * 5))) > 0.3) else 0)), _C.WHITE, C[int(6)], (0.35 * k))
		else:
			p.dot(x, y, C[int(6)], k)
	if (not back):
		if true:
			var i = 0
			while (i < 8):
				var g = ((float(i) / 8) * TAU)
				p.glow((cos(g) * fr), (((sin(g) * fr) * SY) - 2), 16, C[int(4)], (0.22 * k))
				i += 1.0
func sprouts(p, back):
	for s in sites:
		var a = (_capture_t_15[0] - s.t0)
		if (((a < 0) if (a < 0) else (a > s.life)) if ((a < 0) if (a < 0) else (a > s.life)) else ((s.z < 0) != back)):
			continue
		var u = (float(a) / s.life)
		var h = (s.rise * _E.out_cubic(u))
		var x = (s.x + ((sin(((a * 4) + s.sway)) * 1.5) * u))
		var y = (((s.z * SY) - 2) - h)
		var pop = _E.out_back(clampf((float(a) / 0.12), 0.0, 1.0), 2.6)
		var end = (s.life - 0.15)
		var L = maxf(1, _M.js_round(((s.L * pop) - (1 if back else 0))))
		if (a < 0.04):
			_A.sparkle(p, x, y, 3, _C.WHITE, C[int(6)], 0.5)
		else:
			if (a < end):
				_H.plus(p, x, y, L, (1 if (back and (L < 3)) else s.thick), (_R.slice_value(C, 0, 7) if back else C), (0.8 if back else 1), ((not back) and (sin(((a * 12) + (s.sway * 3))) > 0.8)))
			else:
				var v = (float((a - end)) / 0.15)
				for _tuple1 in [[1, 1], [1, (-1)], [(-1), 1], [(-1), (-1)]]:
					var dx = _tuple1[0]
					var dy = _tuple1[1]
					p.dot((x + (dx * (2 + (v * 5)))), ((y + (dy * (2 + (v * 5)))) - (v * 2)), (_C.WHITE if (v < 0.4) else C[int(6)]), (1 - v))
		if (u < 0.5):
			if true:
				var j = 1
				while (j < (h * (1 - (u * 2)))):
					p.dot(s.x, (((((s.z * SY) - 2) - h) + j) + 3), C[int(5)], (((1 - (float(j) / h)) * (1 - (u * 2))) * (0.5 if back else 0.8)))
					j += 1.5
		p.glow(x, y, (7 + (L * 2)), C[int(5)], ((0.2 if back else 0.34) * (1 if (a < end) else (1 - (float((a - end)) / 0.15)))))
func front(tt, _unused1=null, _unused2=null, _unused3=null):
	return (0 if (tt < SEED) else (REACH * _E.out_cubic(_M.seg(tt, SEED, (SEED + ROLL)))))
func passed(d, _unused1=null, _unused2=null, _unused3=null):
	return (SEED + (ROLL * (1 - pow((1 - minf(0.999, (float(d) / REACH))), 1.0/3.0))))
func update(dt: float, _options: Dictionary) -> void:
	_capture_t_15[0] += dt
	if ((_capture_t_15[0] < (SEED - 0.04)) and R.chance(0.7)):
		var a = R.range_value(0, TAU)
		var D = R.range_value(24, 48)
		var x = (cos(a) * D)
		var y = (((sin(a) * D) * SY) - R.range_value(1, 8))
		var T = R.range_value(0.16, 0.24)
		var l = (_R.hypot([x, (y + 3)]) if _R.hypot([x, (y + 3)]) else 1)
		var v = (float((l * 3)) / (exp((3 * T)) - 1))
		ps.spawn(_S.P.STREAK, x, y, ((float((-x)) / l) * v), ((float(((-3) - y)) / l) * v), T, (C[int(6)] if R.chance(0.5) else C[int(5)]))
	if ((not _capture_released_16[0]) and (_capture_t_15[0] >= SEED)):
		_capture_released_16[0] = true
		lights.add(0, (-16), 76, C[int(5)], 0.85, 0.55)
		lights.add(0, (-6), 28, _C.WHITE, 0.8, 0.12)
		if true:
			var i = 0
			while (i < 10):
				ps.spawn(_S.P.MOTE, R.range_value((-2), 2), (-R.range_value(2, 10)), R.range_value((-25), 25), (-R.range_value(80, 170)), R.range_value(0.3, 0.6), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.6, 1))
				i += 1.0
		if true:
			var i = 0
			while (i < 16):
				var a = R.range_value((PI * 1.05), (PI * 1.95))
				var sp = R.range_value(40, 120)
				ps.spawn(_S.P.STAR, 0, (-3), (cos(a) * sp), (sin(a) * sp), R.range_value(0.4, 0.8), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.6, 2))
				i += 1.0
	for s in sites:
		if ((not s.popped) and (_capture_t_15[0] >= s.t0)):
			s.popped = true
			if true:
				var i = 0
				while (i < 3):
					ps.spawn(_S.P.STAR, (s.x + R.range_value((-3), 3)), ((s.z * SY) - 1), R.range_value((-10), 10), (-R.range_value(15, 40)), R.range_value(0.3, 0.6), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.5, 1.2), 0, (4 if (s.z < 0) else 0))
					i += 1.0
	if (((_capture_t_15[0] > (SEED + 0.1)) and (_capture_t_15[0] < 1.9)) and R.chance(0.35)):
		var fr = front(_capture_t_15[0])
		var a = R.range_value(0, TAU)
		var d = (fr * sqrt(R.next()))
		ps.spawn(_S.P.EMBER, (cos(a) * d), (((sin(a) * d) * SY) - 1), R.range_value((-5), 5), (-R.range_value(10, 30)), R.range_value(0.5, 1), C[int(5)], 1, 0, (4 if (sin(a) < 0) else 0))
	ps.update(dt)
	lights.update(dt)
func draw_back(p, _time_argument: float, _options: Dictionary) -> void:
	wash(p)
	ring(p, true)
	sprouts(p, true)
	ps.draw(p, "back")
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	ring(p, false)
	if (_capture_t_15[0] < SEED):
		var k = (float(_capture_t_15[0]) / SEED)
		_A.sparkle(p, 0, (-3), (2 + ((4 * k) * k)), _C.WHITE, C[int(6)], (0.3 + (0.4 * k)))
		p.glow(0, (-3), (10 + (16 * k)), C[int(4)], (0.5 * k))
	else:
		if (_capture_t_15[0] < (SEED + 0.2)):
			_S.flare(p, 0, (-3), (22 * pow((1 - (float((_capture_t_15[0] - SEED)) / 0.2)), 1.5)), (1 - (float((_capture_t_15[0] - SEED)) / 0.2)), _R.slice_value(C, 3))
	var g = _M.seg(_capture_t_15[0], SEED, (SEED + 0.5))
	if ((g > 0) and (g < 1)):
		var top = (((-4) - (46 * _E.out_cubic(minf(1, (g * 2.2))))) - (10 * g))
		var bot = ((-2) - (50 * _E.in_quad(_M.seg(g, 0.35, 1))))
		var w = (1 + (2.4 * (1 - g)))
		if ((bot - top) > 2):
			p.beam(0, bot, 0, top, (w * 2), func(u, v, _unused2=null, _unused3=null):
				return (_C.WHITE if (v < 0.45) else (C[int(5)] if (u > 0.8) else C[int(6)])))
			p.glow_line(0, bot, 0, top, 12, C[int(5)], (0.55 * (1 - g)))
			_A.sparkle(p, 0, top, ((4 * (1 - g)) + 1), _C.WHITE, C[int(6)], (0.5 * (1 - g)))
	sprouts(p, false)
	ps.draw(p, "front")
	lights.draw(p)
func _weak_callback_0(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	return 0
