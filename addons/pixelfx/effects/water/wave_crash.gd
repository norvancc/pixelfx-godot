@tool
extends "../../core/effect.gd"
## Native port of pinned PixelFX 0.3.0 algorithms; MIT (c) Patch / Hugo Duprez.
const _C = preload("../../core/color.gd")
const _M = preload("../../core/math.gd")
const _P = preload("../../core/particles.gd")
const _S = preload("../../core/sim.gd")
const _E = preload("../../core/ease.gd")
const _A = preload("../analytic_helpers.gd")
const _W = preload("water_common.gd")
const _R = preload("../simulation_bridge.gd")
const _B = preload("b2_elements_common.gd")
## Source: src/fx/water/wave-crash.js
const META = {"id":"pixelfx.wave_crash","name":"Wave crash","desc":"A swell rolls in and steepens, its lip throws forward and curls over a dark barrel, then crashes into a burst of white foam and spray that surges on and fades to lace.","tags":["water","wave","crash","surf","foam","spray","one-shot"],"size":[224,104],"origin":[112,86],"duration":3.2,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#0a1630","#123063","#1b5596","#2a7fc4","#45a9e3","#86d3f5","#cdf1ff","#ffffff"],"seed":6},"cacheable":false,"layers":["back","front"]}
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
	return Rect2i(-208, -182, 416, 296)
var SY = 0.22
var G = 820
var CRASH = 1.2
var LIP0 = 0.62
var EDGE = 110
func crestX(t):
	return (((-80) + (72 * _R.in_out_sine((float(t) / CRASH)))) if (t < CRASH) else ((-8) + (30 * _E.out_cubic(clampf((float((t - CRASH)) / 1.4), 0.0, 1.0)))))
func crestH(t):
	return ((5 + (33 * _R.in_out_sine(clampf((float(t) / (CRASH * 0.92)), 0.0, 1.0)))) if (t < CRASH) else ((38 * (1 - _E.out_cubic(clampf((float((t - CRASH)) / 0.45), 0.0, 1.0)))) + (5 * (1 - _M.smooth(CRASH, (CRASH + 1.6), t)))))
func faceW(t):
	return ((24 - (16 * _M.smooth(0.3, CRASH, t))) if (t < CRASH) else (8 + (14 * _M.smooth(CRASH, (CRASH + 0.6), t))))
func lipK(t):
	return clampf((float((t - LIP0)) / (CRASH - LIP0)), 0.0, 1.0)
var o = {}
var C
var R
var S
var ps
var mist
var lights
var rings
var puffs
var plinks
var drops
var _capture_t_26
var _capture_crashed_27
func create(options: Dictionary):
	o = options
	C = _C.fit(o.palette, 8)
	R = _M.Rng.new(o.seed)
	S = o.seed
	ps = _S.Particles.new({"rng": R})
	mist = _W.Mist.new()
	lights = _S.Lights.new()
	rings = _W.Ripples.new({"sy": SY})
	puffs = []
	plinks = []
	drops = _W.Drops.new({"sy": SY, "g": G, "on_land": _R.weak_callback(self, "_weak_callback_0")})
	_capture_t_26 = [0]
	_capture_crashed_27 = [false]






	return self
func body(p, fade):
	var xc = crestX(_capture_t_26[0])
	var A = crestH(_capture_t_26[0])
	if true:
		var X = (-EDGE)
		while (X < EDGE):
			var x = (X + 0.5)
			var h = height(x, _capture_t_26[0])
			var edge = (1 - _M.smooth((EDGE - 24), EDGE, absf(x)))
			if ((h < 0.6) if (h < 0.6) else (edge <= 0)):
				X += 1.0
				continue
			var face = (x > xc)
			var near = exp((-pow((float((x - xc)) / 9), 2)))
			var a = ((fade * edge) * 1.4)
			if true:
				var Y = floori((-h))
				while (Y < 0):
					var y = (Y + 0.5)
					var u = (float((y + h)) / h)
					var depth = (y + h)
					var c = null
					if (depth < 1):
						c = (_C.WHITE if (((near > 0.5) and (A > 14)) and (_M.noise(((x * 0.6) + (_capture_t_26[0] * 9)), S) > (-0.35))) else (C[int(5)] if face else C[int(6)]))
					else:
						if (((depth < 2.4) and (near > 0.35)) and (A > 14)):
							c = (_C.WHITE if (_M.noise2((x * 0.5), ((y * 0.5) + (_capture_t_26[0] * 6)), (S + 1)) > (-0.1)) else C[int(6)])
						else:
							var win = ((near * (1 - u)) * 1.6)
							var up = _M.noise2((((x * 0.9) - (y * 0.35)) * 0.8), ((y * 0.12) + (_capture_t_26[0] * 5)), (S + 2))
							var wind = _M.noise2(((x * 0.18) - (_capture_t_26[0] * 2)), (y * 0.9), (S + 3))
							var fi = (6 if ((up > 0.55) and (u < 0.85)) else (5 if (win > 0.8) else (4 if ((win > 0.45) if (win > 0.45) else (up > 0.3)) else (3 if ((win > 0.2) if (win > 0.2) else (up > 0.05)) else (2 if (u < 0.6) else 1)))))
							var bi = (4 if (u < 0.14) else (4 if (wind > 0.55) else (3 if ((wind > 0.25) if (wind > 0.25) else (u < 0.32)) else (2 if (u < 0.7) else 1))))
							c = C[int(_M.js_round((bi + ((fi - bi) * _M.smooth((xc - 5), (xc + 5), x)))))]
					p.dot(X, Y, c, a)
					Y += 1.0
			X += 1.0
func curl(p):
	var k = lipK(_capture_t_26[0])
	if ((k <= 0) if (k <= 0) else (_capture_t_26[0] >= CRASH)):
		return null
	var cells = _R.SimulationMap.new()
	if true:
		var s = 0
		while (s <= 1):
			var _tuple1 = lip(s, _capture_t_26[0])
			var x = _tuple1[0]
			var y = _tuple1[1]
			var w = _tuple1[2]
			var _tuple2 = lip(minf(1, (s + 0.012)), _capture_t_26[0])
			var x2 = _tuple2[0]
			var y2 = _tuple2[1]
			var tx = (x2 - x)
			var ty = (y2 - y)
			var l = (_R.hypot([tx, ty]) if _R.hypot([tx, ty]) else 1)
			var nx = (float(ty) / l)
			var ny = (float((-tx)) / l)
			if true:
				var q = 0
				while (q <= 1):
					var px = (x + ((nx * (q - 0.5)) * w))
					var py = (y + ((ny * (q - 0.5)) * w))
					var key = ((floori(py) * 1024) + floori(px))
					var c = (_C.WHITE if (q < 0.18) else ((_C.WHITE if (s > 0.8) else C[int(6)]) if (q < 0.36) else (C[int(5)] if (q < 0.56) else (C[int(4)] if (q < 0.76) else C[int(3)]))))
					var cur = cells.get(key)
					if ((not cur) if (not cur) else (q < cur.q)):
						cells.set_value(key, {"x": px, "y": py, "c": c, "q": q})
					q += (float(0.5) / maxf(1, w))
			s += 0.012
	for c in cells.entries_values():
		p.px(c.x, c.y, c.c)
	if true:
		var s = 0
		while (s <= 1):
			var _tuple3 = lip(s, _capture_t_26[0])
			var x = _tuple3[0]
			var y = _tuple3[1]
			var w = _tuple3[2]
			p.glow(x, y, (6 + w), C[int(5)], (0.24 * k))
			s += 0.125
	var _tuple4 = lip(1, _capture_t_26[0])
	var tx = _tuple4[0]
	var ty = _tuple4[1]
	var g = sin((PI * clampf((float((k - 0.55)) / 0.45), 0.0, 1.0)))
	if (g > 0.05):
		_A.sparkle(p, tx, ty, (6 * g), C[int(6)], C[int(5)], (0.5 * g))
	var _tuple5 = lip(0.6, _capture_t_26[0])
	var bx = _tuple5[0]
	var by = _tuple5[1]
	p.glow((bx - 3), (by + 8), 16, C[int(4)], (0.25 * k))
func sea(p, fade):
	if true:
		var X = (-EDGE)
		while (X < EDGE):
			var x = (X + 0.5)
			var edge = (1 - _M.smooth((EDGE - 30), EDGE, absf(x)))
			var a = (fade * edge)
			if (a <= 0.02):
				X += 1.0
				continue
			var g = _M.noise(((x * 0.3) - (_capture_t_26[0] * 3)), (S + 4))
			p.dot(X, 0, (C[int(6)] if (g > 0.55) else C[int(4)]), (a * 1.2))
			p.blend(x, 1.5, C[int(2)], (0.6 * a))
			p.blend(x, 2.5, C[int(1)], (0.45 * a))
			X += 1.0
func height(x, tt, _unused2=null, _unused3=null):
	var xc = crestX(tt)
	var A = crestH(tt)
	var dx = (x - xc)
	return (A * exp((-pow((float(dx) / (30 if (dx < 0) else faceW(tt))), 2))))
func lip(s, tt, _unused2=null, _unused3=null):
	var k = lipK(tt)
	var xc = crestX(tt)
	var A = crestH(tt)
	return [((xc + 1) + ((s * 30) * pow(k, 0.8))), (((-A) - (((4 * s) * (1 - s)) * (1 + (4 * k)))) + ((((s * s) * A) * _E.in_quad(k)) * 0.98)), ((11 - (8.5 * s)) * (0.5 + (0.5 * k)))]
func puff(x, y, vx, vy, r0, r1, life, delay=0):
	_R.push_items(puffs, [{"x": x, "y": y, "vx": vx, "vy": vy, "r0": r0, "r1": r1, "life": life, "max": life, "delay": delay}])
	return null
func update(dt: float, _options: Dictionary) -> void:
	_capture_t_26[0] += dt
	var k = lipK(_capture_t_26[0])
	if (((_capture_t_26[0] < CRASH) and (crestH(_capture_t_26[0]) > 14)) and R.chance(0.5)):
		var xc = crestX(_capture_t_26[0])
		var A = crestH(_capture_t_26[0])
		ps.spawn(_S.P.FLAKE, (xc + R.range_value((-4), 3)), ((-A) - R.range_value(0, 2)), (-R.range_value(20, 60)), (-R.range_value(10, 40)), R.range_value(0.5, 0.9), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.6, 1.3))
	if (((k > 0.3) and (_capture_t_26[0] < CRASH)) and R.chance(0.35)):
		var _tuple6 = lip(1, _capture_t_26[0])
		var x = _tuple6[0]
		var y = _tuple6[1]
		drops.add({"x": x, "z": R.range_value((-3), 3), "h": (-y), "vx": R.range_value(30, 90), "vz": R.range_value((-10), 10), "vh": R.range_value((-20), 40), "s": (2 if R.chance(0.3) else 1)})
	if ((not _capture_crashed_27[0]) and (_capture_t_26[0] >= CRASH)):
		_capture_crashed_27[0] = true
		var _tuple7 = lip(1, (CRASH - 0.001))
		var X0 = _tuple7[0]
		lights.add(X0, (-20), 56, C[int(5)], 0.8, 0.55)
		lights.add(X0, (-4), 22, _C.WHITE, 0.6, 0.1)
		if true:
			var i = 0
			while (i < 46):
				var a = (R.range_value((-0.9), 0.6) * PI)
				var v = R.range_value(30, 120)
				drops.add({"x": (X0 + R.range_value((-6), 6)), "z": R.range_value((-4), 4), "h": R.range_value(2, 8), "vx": (((cos(a) * v) * 0.85) + 18), "vz": ((sin(a) * v) * 0.5), "vh": R.range_value(120, 320), "s": (3 if R.chance(0.15) else (2 if R.chance(0.35) else 1)), "delay": R.range_value(0, 0.1)})
				i += 1.0
		if true:
			var i = 0
			while (i < 14):
				drops.add({"x": (X0 + R.range_value((-3), 3)), "z": R.range_value((-2), 2), "h": R.range_value(2, 6), "vx": R.range_value((-15), 25), "vz": R.range_value((-8), 8), "vh": R.range_value(220, 300), "s": (2 if R.chance(0.3) else 1), "delay": R.range_value(0.04, 0.16)})
				i += 1.0
		if true:
			var i = 0
			while (i < 34):
				puff((X0 + R.range_value((-12), 10)), (-R.range_value(2, 12)), R.range_value((-40), 130), (-R.range_value(30, 150)), R.range_value(1, 2), R.range_value(1.8, 4.2), R.range_value(0.4, 0.95), R.range_value(0, 0.14))
				i += 1.0
		if true:
			var i = 0
			while (i < 34):
				var a = R.range_value(((-PI) * 0.95), ((-PI) * 0.05))
				var v = R.range_value(40, 160)
				ps.spawn(_S.P.FLAKE, (X0 + R.range_value((-8), 8)), (-R.range_value(4, 14)), ((cos(a) * v) + 25), (sin(a) * v), R.range_value(0.6, 1.3), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.6, 1.4), R.range_value(0, 0.1))
				i += 1.0
		if true:
			var i = 0
			while (i < 12):
				mist.add((X0 + R.range_value((-10), 14)), (-R.range_value(3, 16)), R.range_value((-20), 70), (-R.range_value(6, 24)), 3, R.range_value(9, 15), R.range_value(1.1, 1.7), (C[int(6)] if R.chance(0.5) else _C.WHITE), 0.26, R.range_value(0, 0.2))
				i += 1.0
		if true:
			var i = 0
			while (i < 10):
				ps.spawn(_S.P.STAR, (X0 + R.range_value((-20), 24)), (-R.range_value(6, 40)), 0, (-5), R.range_value(0.3, 0.6), C[int(6)], R.range_value(1, 2.4), R.range_value(0.05, 0.4))
				i += 1.0
		rings.add(X0, 0, 6, 40, 1.2, {"n": 2, "gap": 3, "k": 1.1, "hot": 0.12})
	if ((_capture_crashed_27[0] and (_capture_t_26[0] < (CRASH + 1.1))) and R.chance((0.45 * (1 - (float((_capture_t_26[0] - CRASH)) / 1.1))))):
		var x = (crestX(_capture_t_26[0]) + R.range_value((-6), 14))
		puff(x, (-R.range_value(1, 4)), R.range_value(10, 40), (-R.range_value(10, 40)), R.range_value(0.9, 1.8), R.range_value(1.8, 3.6), R.range_value(0.4, 0.8))
	if ((_capture_crashed_27[0] and (_capture_t_26[0] < (CRASH + 0.8))) and R.chance(0.12)):
		mist.add((crestX(_capture_t_26[0]) + R.range_value((-8), 8)), (-R.range_value(2, 6)), R.range_value(10, 40), (-R.range_value(3, 10)), 3, R.range_value(7, 11), R.range_value(0.8, 1.1), C[int(6)], 0.2)
	if true:
		var i = (puffs.size() - 1)
		while (i >= 0):
			var f = puffs[int(i)]
			if (f.delay > 0):
				f.delay -= dt
				i -= 1.0
				continue
			if (_R.assign_member(f, "life", dt, "-=") <= 0):
				puffs.remove_at(int(i))
				i -= 1.0
				continue
			f.vx -= ((f.vx * 2.5) * dt)
			f.vy += ((160 - (f.vy * 2.5)) * dt)
			f.x += (f.vx * dt)
			f.y = minf((f.y + (f.vy * dt)), (-1))
			i -= 1.0
	if true:
		var i = (plinks.size() - 1)
		while (i >= 0):
			if (_R.assign_member(plinks[int(i)], "age", dt, "+=") > 0.12):
				plinks.remove_at(int(i))
			i -= 1.0
	drops.update(dt)
	rings.update(dt)
	mist.update(dt)
	ps.update(dt)
	lights.update(dt)
func draw_back(p, _time_argument: float, _options: Dictionary) -> void:
	var fade = (_M.smooth(0, 0.25, _capture_t_26[0]) * (1 - _M.smooth((META.duration - 0.7), (META.duration - 0.1), _capture_t_26[0])))
	sea(p, fade)
	rings.draw(p, C, (-1))
	drops.draw(p, C, "back")
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	var fade = (_M.smooth(0, 0.25, _capture_t_26[0]) * (1 - _M.smooth((META.duration - 0.7), (META.duration - 0.1), _capture_t_26[0])))
	body(p, fade)
	curl(p)
	rings.draw(p, C, 1)
	if _capture_crashed_27[0]:
		var k = (1 - _M.smooth((CRASH + 0.4), (META.duration - 0.15), _capture_t_26[0]))
		var x0 = (-20)
		var x1 = (crestX(_capture_t_26[0]) + 10)
		if true:
			var X = floori(x0)
			while (X < x1):
				var x = (X + 0.5)
				var n = (1 - (absf(_M.noise2((x * 0.35), (_capture_t_26[0] * 0.8), (S + 7))) * 4))
				if (n > (1.15 - (k * 1.1))):
					p.px(X, 0, (_C.WHITE if (n > (1.4 - k)) else C[int(6)]))
				if (n > (1.4 - (k * 0.9))):
					p.px(X, 1, C[int(5)])
				X += 1.0
	for f in puffs:
		if (f.delay > 0):
			continue
		var g = (1 - (float(f.life) / f.max))
		var r = ((f.r0 + ((f.r1 - f.r0) * _E.out_cubic(g))) * (1 - _M.smooth(0.7, 1, g)))
		if (r > 0.6):
			_B.billow(p, f.x, f.y, r, C)
	for q in plinks:
		if (q.age < 0.06):
			p.px(q.x, q.y, _C.WHITE)
		p.glow(q.x, q.y, 4, C[int(5)], (0.25 * (1 - (float(q.age) / 0.12))))
	drops.draw(p, C, "front")
	var f = (float((_capture_t_26[0] - CRASH)) / 0.08)
	if ((f >= 0) and (f < 1)):
		var _tuple8 = lip(1, (CRASH - 0.001))
		var X0 = _tuple8[0]
		p.circle(X0, (-3), (8 * (1 - (f * 0.4))), _C.WHITE)
		p.ellipse(X0, 0, 14, 2.6, func(d, _unused1=null, _unused2=null, _unused3=null):
			return (_C.WHITE if (d < 0.6) else C[int(6)]))
	ps.draw(p)
	mist.draw(p, C[int(5)])
	lights.draw(p)
	if (_capture_t_26[0] < CRASH):
		p.glow((crestX(_capture_t_26[0]) + 4), ((-crestH(_capture_t_26[0])) + 2), 26, C[int(4)], (0.22 * _M.smooth(0.2, CRASH, _capture_t_26[0])))
		p.glow_line((crestX(_capture_t_26[0]) - 26), ((-crestH(_capture_t_26[0])) * 0.45), crestX(_capture_t_26[0]), (-crestH(_capture_t_26[0])), 10, C[int(5)], (0.14 * _M.smooth(0.2, CRASH, _capture_t_26[0])))
	else:
		p.glow(crestX(_capture_t_26[0]), (-10), 34, C[int(4)], (0.26 * (1 - _M.smooth(CRASH, (META.duration - 0.3), _capture_t_26[0]))))
func _weak_callback_0(d, _unused1=null, _unused2=null, _unused3=null):
	rings.add(d.x, d.z, 0.6, (2 + (d.s * 1.8)), (0.3 + (d.s * 0.1)), {"n": 1, "k": 0.9, "hot": 0.05})
	_R.push_items(plinks, [{"x": d.x, "y": (d.z * SY), "age": 0}])
