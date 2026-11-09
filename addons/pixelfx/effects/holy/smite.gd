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
## Source: src/fx/holy/smite.js
const META = {"id":"pixelfx.smite","name":"Smite","desc":"A glint marks the spot, then a bolt of light drops like a hammer: a white flash, a shockwave over the floor, stone chips flying and cracks that glow and cool.","tags":["holy","smite","strike","impact","light","ground","one-shot"],"size":[224,176],"origin":[112,148],"duration":2.8,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#3b1d2a","#7a3a2c","#c4652e","#f0a040","#ffd25e","#fff0a0","#fffbe0","#ffffff"],"stone":"#5a5066","seed":9},"cacheable":false,"layers":["back","front"]}
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
	return Rect2i(-208, -244, 416, 368)
var TOP = (-148)
var SY = 0.38
var MARK = 0.42
var HIT = 0.54
var LEN = 44
var OUTLINE = _B.color("#1a1422")
func chip(p, b, st):
	var r = (0.6 + (b.s * 0.7))
	var fade = minf(1, (float(b.life) / 0.5))
	var lx = ((cos(b.a) * r) * 0.4)
	var ly = ((sin(b.a) * r) * 0.4)
	p.shade(((b.x - r) - 1), ((b.y - r) - 1), ((b.x + r) + 1), ((b.y + r) + 1), func(x, y, out, _unused3=null):
		var dx = (x - b.x)
		var dy = (y - b.y)
		var d = _R.hypot([(dx * 1.2), dy])
		if (d > (r + 0.9)):
			return null
		var lit = ((dx * lx) + (dy * ly))
		out.c = (OUTLINE if (d > r) else (st[int(3)] if (lit < (-0.3)) else (st[int(1)] if (lit > 0.5) else st[int(2)])))
		out.a = fade)
var o = {}
var C
var R
var s0
var st
var dust
var ps
var chips
var lights
var cracks
var _capture_t_33
var _capture_hit_34
func create(options: Dictionary):
	o = options
	C = _C.fit(o.palette, 8)
	R = _M.Rng.new(o.seed)
	s0 = _B.color(o.stone)
	st = [_C.scale_color(s0, 0.5), _C.scale_color(s0, 0.75), s0, _C.mix(_C.scale_color(s0, 1.4), _C.WHITE, 0.1)]
	dust = _C.mix(s0, _B.color("#8a8094"), 0.4)
	ps = _S.Particles.new({"rng": R, "ground": _R.weak_callback(self, "_weak_callback_0"), "sparks": [_C.WHITE, C[int(6)], C[int(5)], C[int(3)]]})
	chips = _R.Bits.new({"ground": _R.weak_callback(self, "_weak_callback_1")})
	lights = _S.Lights.new()
	cracks = _B.make_array(7, func(_unused, i, _unused2=null, _unused3=null):
		var a = ((0.12 + ((float(i) / 6) * (PI - 0.24))) + R.range_value((-0.12), 0.12))
		var L = (R.range_value(30, 54) * (0.6 if (absf(sin(a)) > 0.7) else 1))
		var pts = _B.map_indexed(_R.bolt(R, 0, 0, (cos(a) * L), (sin(a) * L), {"jag": 0.28, "depth": 4}), func(_arg0, _unused1=null, _unused2=null, _unused3=null):
			var x = _B.at(_arg0, 0)
			var z = _B.at(_arg0, 1)
			return [x, (z * SY)])
		var fork = (_R.bolt(R, pts[int(floori((pts.size() * 0.5)))][0], pts[int(floori((pts.size() * 0.5)))][1], (pts[int(floori((pts.size() * 0.5)))][int(0)] + ((cos((a + (R.sign_value() * 0.7))) * L) * 0.35)), (pts[int(floori((pts.size() * 0.5)))][int(1)] + (((sin((a + (R.sign_value() * 0.7))) * L) * 0.35) * SY)), {"jag": 0.3, "depth": 3}) if (pts.size() > 6) else null)
		return {"pts": pts, "fork": fork, "L": L, "cool": R.range_value(1.6, 2.1)})
	_capture_t_33 = [0]
	_capture_hit_34 = [false]



	return self
func hammer(p):
	if ((_capture_t_33[0] < MARK) if (_capture_t_33[0] < MARK) else (_capture_t_33[0] >= (HIT + 0.06))):
		return null
	var y1 = (0 if (_capture_t_33[0] >= HIT) else tipY(_capture_t_33[0]))
	var y0 = maxf((TOP + 5), (y1 - (LEN * ((1 - (float((_capture_t_33[0] - HIT)) / 0.06)) if (_capture_t_33[0] >= HIT) else 1))))
	var white = (_capture_t_33[0] >= HIT)
	if (y1 < (TOP + 12)):
		return null
	for _tuple1 in [[(-5), 0.6], [(-2), 0.9], [2, 0.8], [5, 0.5]]:
		var dx = _tuple1[0]
		var k = _tuple1[1]
		if (y0 > (TOP + 2)):
			p.line(dx, maxf(TOP, (y0 - 70)), dx, y0, func(u, _unused1=null, _unused2=null, _unused3=null):
				return (C[int(6)] if (u > 0.7) else C[int(4)]), func(u, _unused1=null, _unused2=null, _unused3=null):
				return (u * k))
	if ((y1 - 3) > y0):
		p.beam(0, y0, 0, (y1 - 3), 9, func(u, v, _unused2=null, _unused3=null):
			return (_C.WHITE if (white if white else (v < 0.35)) else (C[int(6)] if (v < 0.7) else C[int(5)])))
	p.beam(0, (y1 - 6), 0, (y1 - 1), 13, func(u, v, _unused2=null, _unused3=null):
		return (_C.WHITE if ((v < 0.6) if (v < 0.6) else white) else C[int(6)]))
	p.glow_line(0, (y0 + 10), 0, y1, 16, C[int(5)], 0.6)
	p.glow(0, (y1 - 4), minf(22, ((y1 - TOP) - 6)), _C.WHITE, 0.5)
func crack(p):
	if (_capture_t_33[0] < HIT):
		return null
	var grow = _E.out_cubic(_M.seg(_capture_t_33[0], HIT, (HIT + 0.1)))
	for c in cracks:
		for path in ([c.pts, c.fork] if c.fork else [c.pts]):
			var n = maxf(1, _M.js_round(((path.size() - 1) * grow)))
			if true:
				var i = 0
				while (i < n):
					var _tuple2 = path[int(i)]
					var x0 = _tuple2[0]
					var y0 = _tuple2[1]
					var _tuple3 = path[int((i + 1))]
					var x1 = _tuple3[0]
					var y1 = _tuple3[1]
					var d = (float(_R.hypot([x0, (float(y0) / SY)])) / c.L)
					var heat = clampf(((1 - (float((_capture_t_33[0] - HIT)) / c.cool)) - (d * 0.5)), 0.0, 1.0)
					if (heat <= 0):
						i += 1.0
						continue
					var col = (_C.WHITE if (heat > 0.85) else (C[int(6)] if (heat > 0.65) else (C[int(5)] if (heat > 0.45) else (C[int(4)] if (heat > 0.3) else (C[int(3)] if (heat > 0.18) else C[int(2)])))))
					p.line(x0, y0, x1, y1, col, ((float(heat) / 0.12) if (heat < 0.12) else 1))
					if ((d < 0.45) and (path == c.pts)):
						p.line(x0, (y0 + 1), x1, (y1 + 1), (C[int(4)] if (heat > 0.5) else C[int(2)]), ((float(heat) / 0.12) if (heat < 0.12) else 1))
					if (fmod(i, 2) == 0):
						p.glow(x0, y0, 10, C[int(4)], (0.45 * heat))
					i += 1.0
	var h = clampf((1 - (float((_capture_t_33[0] - HIT)) / 1.6)), 0.0, 1.0)
	if (h > 0):
		_H.oval(p, 0, 0, 5, 1.6, (_C.WHITE if (h > 0.6) else (C[int(5)] if (h > 0.3) else C[int(3)])), minf(1, (h * 3)))
		p.glow(0, 0, 18, C[int(4)], (0.45 * h))
func tipY(tt, _unused1=null, _unused2=null, _unused3=null):
	return lerpf((TOP - 6), 0, _E.in_cubic(_M.seg(tt, MARK, HIT)))
func update(dt: float, _options: Dictionary) -> void:
	_capture_t_33[0] += dt
	if ((_capture_t_33[0] < MARK) and R.chance(0.25)):
		ps.spawn(_S.P.STAR, R.range_value((-10), 10), (-R.range_value(0, 18)), 0, (-R.range_value(4, 12)), R.range_value(0.2, 0.4), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.5, 1.2))
	if ((((_capture_t_33[0] > MARK) and (_capture_t_33[0] < HIT)) and (tipY(_capture_t_33[0]) > (TOP + 50))) and R.chance(0.6)):
		ps.spawn(_S.P.MOTE, (R.sign_value() * R.range_value(4, 7)), (tipY(_capture_t_33[0]) - R.range_value(4, 30)), R.range_value((-20), 20), (-R.range_value(10, 40)), R.range_value(0.15, 0.3), C[int(6)], 0.7)
	if ((not _capture_hit_34[0]) and (_capture_t_33[0] >= HIT)):
		_capture_hit_34[0] = true
		lights.add(0, (-24), 92, C[int(5)], 1, 0.6)
		lights.add(0, (-8), 40, _C.WHITE, 0.9, 0.12)
		if true:
			var i = 0
			while (i < 60):
				var a = ((float((-PI)) / 2) + R.range_value((-1.25), 1.25))
				var sp = R.range_value(110, 280)
				ps.spawn(_S.P.SPARK, R.range_value((-3), 3), (-2), (cos(a) * sp), (sin(a) * sp), R.range_value(0.25, 0.75))
				i += 1.0
		if true:
			var i = 0
			while (i < 16):
				var a = ((float((-PI)) / 2) + R.range_value((-1), 1))
				var sp = R.range_value(60, 160)
				ps.spawn(_S.P.STAR, R.range_value((-4), 4), (-4), (cos(a) * sp), (sin(a) * sp), R.range_value(0.4, 0.9), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.8, 2.4))
				i += 1.0
		if true:
			var i = 0
			while (i < 14):
				var a = ((float((-PI)) / 2) + R.range_value((-1.2), 1.2))
				var sp = R.range_value(90, 230)
				chips.add({"kind": _S.B.CHUNK, "x": R.range_value((-5), 5), "y": (-2), "vx": (cos(a) * sp), "vy": (sin(a) * sp), "g": 1, "drag": 0.4, "bounce": 0.35, "life": R.range_value(1.2, 1.8), "a": R.range_value(0, TAU), "va": R.range_value((-14), 14), "s": R.int_value(1, 3)})
				i += 1.0
		if true:
			var i = 0
			while (i < 34):
				var a = ((float((-PI)) / 2) + R.range_value((-1), 1))
				var sp = R.range_value(60, 220)
				ps.spawn(_S.P.GRIT, R.range_value((-4), 4), (-1), (cos(a) * sp), (sin(a) * sp), R.range_value(0.9, 1.5), R.pick(_R.slice_value(st, 1)), (2 if R.chance(0.4) else 1))
				i += 1.0
		if true:
			var i = 0
			while (i < 9):
				var s = R.sign_value()
				ps.spawn(_S.P.SMOKE, (s * R.range_value(2, 10)), (-R.range_value(1, 4)), (s * R.range_value(50, 130)), (-R.range_value(2, 12)), R.range_value(0.7, 1.2), _C.mix(dust, C[int(4)], 0.18), R.range_value(3.5, 6), R.range_value(0, 0.06), _S.PF.BIG)
				i += 1.0
		if true:
			var i = 0
			while (i < 4):
				ps.spawn(_S.P.SMOKE, R.range_value((-4), 4), (-R.range_value(2, 8)), R.range_value((-8), 8), (-R.range_value(20, 45)), R.range_value(1.2, 1.8), _C.mix(dust, C[int(5)], 0.25), R.range_value(4, 6), R.range_value(0.05, 0.3))
				i += 1.0
	if (((_capture_t_33[0] > HIT) and (_capture_t_33[0] < (HIT + 1.3))) and R.chance(0.5)):
		var c = R.pick(cracks)
		var q = R.pick(c.pts)
		if R.chance(0.75):
			ps.spawn(_S.P.EMBER, q[int(0)], (q[int(1)] - 1), R.range_value((-8), 8), (-R.range_value(15, 35)), R.range_value(0.5, 0.9), C[int(5)])
		else:
			ps.spawn(_S.P.STAR, q[int(0)], (q[int(1)] - 2), 0, (-R.range_value(4, 12)), R.range_value(0.3, 0.6), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.8, 1.8))
	chips.update(dt)
	ps.update(dt)
	lights.update(dt)
func draw_back(p, _time_argument: float, _options: Dictionary) -> void:
	crack(p)
	ps.draw(p, "back")
	var k = _M.seg(_capture_t_33[0], HIT, (HIT + 0.42))
	if ((_capture_t_33[0] >= HIT) and (k < 1)):
		_S.band(p, 0, 0, (6 + (84 * _E.out_cubic(k))), (SY * 0.8), maxf(1, (5 * (1 - k))), (1.15 - k), _R.slice_value(C, 3), func(g, _unused1=null, _unused2=null, _unused3=null):
			return (sin(g) < 0), (k < 0.12))
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	if (_capture_t_33[0] < HIT):
		var u = _M.seg(_capture_t_33[0], 0, MARK)
		var k = _M.smooth(0, 0.08, _capture_t_33[0])
		var spin = (_capture_t_33[0] * 3)
		var rr = lerpf(26, 8, _R.in_out_cubic(u))
		_H.oval(p, 0, 0, rr, (rr * SY), func(g, _unused1=null, _unused2=null, _unused3=null):
			return (_C.WHITE if (sin(((g * 4) + spin)) > 0) else C[int(5)]), (k * (0.65 + (0.35 * sin((_capture_t_33[0] * 40))))))
		_H.oval(p, 0, 1, rr, (rr * SY), C[int(3)], (k * 0.6), func(g, _unused1=null, _unused2=null, _unused3=null):
			return (sin(g) > 0))
		var L = ((3 + (8 * _E.out_back(clampf((float(_capture_t_33[0]) / 0.2), 0.0, 1.0), 2))) * ((1 + (0.6 * _M.seg(_capture_t_33[0], MARK, HIT))) if (_capture_t_33[0] > MARK) else 1))
		if true:
			var i = 0
			while (i < 4):
				var a = ((spin * 0.3) + (float((i * PI)) / 2))
				var len = ((L * 0.6) if fmod(i, 2) else L)
				p.line(0, (-2), (cos(a) * len), ((-2) + (sin(a) * len)), func(v, _unused1=null, _unused2=null, _unused3=null):
					return (_C.WHITE if (v < 0.4) else C[int(5)]), func(v, _unused1=null, _unused2=null, _unused3=null):
					return (1.2 - v))
				i += 1.0
		p.px(0, (-2), _C.WHITE)
		p.glow(0, (-2), (14 + (10 * u)), C[int(5)], (0.5 * k))
		p.glow_line(0, (TOP + 6), 0, (-2), 5, C[int(4)], (0.12 * u))
	hammer(p)
	var ai = _M.seg(_capture_t_33[0], (HIT + 0.04), (HIT + 0.55))
	if ((_capture_t_33[0] > (HIT + 0.04)) and (ai < 1)):
		var w = (1 + (4 * pow((1 - ai), 2)))
		p.beam(0, (TOP + 4), 0, (-4), w, func(u, v, _unused2=null, _unused3=null):
			return (_C.WHITE if (v < 0.5) else C[int(5)]), func(u, _unused1=null, _unused2=null, _unused3=null):
			return ((0.3 + (0.7 * u)) * (1 - (ai * 0.5))))
		p.glow_line(0, (TOP + 16), 0, (-6), 10, C[int(5)], (0.4 * (1 - ai)))
	var k = _M.seg(_capture_t_33[0], HIT, (HIT + 0.42))
	if ((_capture_t_33[0] >= HIT) and (k < 1)):
		_S.band(p, 0, 0, (6 + (84 * _E.out_cubic(k))), (SY * 0.8), maxf(1, (5 * (1 - k))), (1.15 - k), _R.slice_value(C, 3), func(g, _unused1=null, _unused2=null, _unused3=null):
			return (sin(g) >= 0), (k < 0.12))
	var d = _M.seg(_capture_t_33[0], HIT, (HIT + 0.28))
	if ((_capture_t_33[0] >= HIT) and (d < 1)):
		var r = (8 + (40 * _E.out_cubic(d)))
		p.arc(0, 0, r, maxf(1, (3 * (1 - d))), PI, TAU, func(u, v, _unused2=null, _unused3=null):
			return (_C.WHITE if ((d < 0.2) if (d < 0.2) else (v > 0.6)) else C[int(5)]), (1.1 - d))
		if true:
			var g = (PI * 1.1)
			while (g < (TAU - 0.2)):
				p.glow((cos(g) * r), (sin(g) * r), 8, C[int(5)], (0.3 * (1 - d)))
				g += 0.5
	if ((_capture_t_33[0] >= HIT) and (_capture_t_33[0] < (HIT + 0.07))):
		p.circle(0, (-6), 16, _C.WHITE)
		p.circle(0, (-6), 19, C[int(6)], 0.6)
	for b in chips.list:
		chip(p, b, st)
	ps.draw(p, "front")
	if ((_capture_t_33[0] >= HIT) and (_capture_t_33[0] < (HIT + 0.25))):
		_A.sparkle(p, 0, (-8), (16 * (1 - (float((_capture_t_33[0] - HIT)) / 0.25))), _C.WHITE, C[int(5)], 0.7)
	lights.draw(p)
func _weak_callback_0(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	return 0
func _weak_callback_1(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	return 0
