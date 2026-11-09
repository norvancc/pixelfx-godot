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
## Source: src/fx/ice/icicle-fall.js
const META = {"id":"pixelfx.icicle_fall","name":"Icicle fall","desc":"An icicle drips and trembles, snaps off its frosted root, drops, stabs the floor and bursts into skidding shards, splinters and rolling frost.","tags":["ice","icicle","fall","trap","shatter","one-shot"],"size":[152,120],"origin":[76,100],"duration":2.6,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#151a3d","#212f6b","#2c58aa","#3a8bd8","#62c8f4","#a6ecff","#dcfbff","#ffffff"],"seed":4},"cacheable":false,"layers":["back","front"]}
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
	return Rect2i(-172, -196, 344, 312)
var ROOT = (-80)
var LEN = 36
var W = 12
var DRIP = 0.16
var TREMBLE = 0.3
var SNAP = 0.6
var FREE = (SNAP + 0.04)
var FALL_T = sqrt((float((2 * ((-ROOT) - LEN))) / _S.GRAVITY))
var IMPACT = (FREE + FALL_T)
func icicle(p, C, x, top, len, w, opts={}):
	var hw = func(u, _unused1=null, _unused2=null, _unused3=null):
		return (((((float(w) / 2) * pow((1 - u), 0.75)) * (1 + (0.14 * sin(((u * 13) + 0.5))))) * (1.15 if (u < 0.08) else 1)) + 0.3)
	var tilt = opts.get("tilt", 0)
	var cut = opts.get("cut", 0)
	p.shade(((x - (float(w) / 2)) - 4), (top - 1), (((x + (float(w) / 2)) + 4) + (absf(tilt) * len)), ((top + len) + 1), func(px, py, o, _unused3=null):
		var u = (float((py - top)) / len)
		var cx = ((x + ((tilt * len) * u)) + (0.7 * sin(((u * 6) + 1))))
		var s = (px - cx)
		if ((u < cut) if (u < cut) else (u > 1)):
			return null
		var h = hw.call(u)
		if (absf(s) > (h + 1)):
			return null
		if (absf(s) > h):
			o.c = C[int(1)]
			return null
		if opts.get("white"):
			o.c = _C.WHITE
			return o.c
		var q = (float(s) / h)
		var ring = (sin(((u * 13) + 0.5)) > 0.7)
		var c = (_C.WHITE if (u > 0.88) else (C[int(6)] if (q < (-0.72)) else ((C[int(7)] if ring else C[int(5)]) if (q < (-0.2)) else ((C[int(7)] if (u < 0.72) else C[int(6)]) if (q < 0.18) else (C[int(2)] if (q > 0.8) else (C[int(5)] if (((absf((q - 0.45)) < 0.1) and (u > 0.15)) and (u < 0.6)) else (C[int(4)] if (q < 0.6) else C[int(3)])))))))
		if (((opts.glint >= 0) and (q < 0.25)) and (absf((u - opts.glint)) < 0.06)):
			c = _C.WHITE
		o.c = c)
var o = {}
var C
var R
var ps
var bits
var lights
var panes
var rime
var _capture_t_43
var _capture_snapped_44
var _capture_landed_45
var _capture_dripped_46
var y
func create(options: Dictionary):
	o = options
	C = _C.fit(o.palette, 8)
	R = _M.Rng.new(o.seed)
	ps = _S.Particles.new({"rng": R, "ground": _R.weak_callback(self, "floor_y"), "sparks": [C[int(7)], C[int(6)], C[int(5)], C[int(4)]], "haze": C[int(5)]})
	bits = _R.Bits.new({"ground": _R.weak_callback(self, "floor_y")})
	lights = _S.Lights.new()

	panes = _I.Panes.new({"ground": _R.weak_callback(self, "floor_y"), "onLand": _R.weak_callback(self, "_weak_callback_0"), "onCrumble": _R.weak_callback(self, "_weak_callback_1")})
	rime = []
	if true:
		var x = (-18)
		while (x <= 18):
			var h = _M.rand([x, o.seed, 2])
			var d = (float(absf(x)) / 18)
			_R.push_items(rime, [{"x": x, "h": (1 + _M.js_round(((0.6 + (h * 1.8)) * (1 - (d * 0.7))))), "stub": ((2 + _M.js_round(((_M.rand([x, 5]) * 5) * (1 - (d * 0.5))))) if ((h < 0.3) and (absf(x) > 7)) else 0)}])
			x += 1.0
	_capture_t_43 = [0]
	_capture_snapped_44 = [false]
	_capture_landed_45 = [false]
	_capture_dripped_46 = [false]
	y = 0

	return self
func floor_y(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	return 0
func splinter(x, y, vx, n):
	if true:
		var i = 0
		while (i < n):
			bits.add({"kind": _S.B.SHARD, "x": (x + R.range_value((-2), 2)), "y": (y - 1), "vx": ((vx * 0.5) + R.range_value((-45), 45)), "vy": (-R.range_value(30, 100)), "g": 0.8, "drag": 0.6, "bounce": 0.35, "life": R.range_value(0.4, 0.75), "a": R.range_value(0, TAU), "va": R.range_value((-18), 18), "s": R.range_value(1.2, 2.4), "c": C[int(R.int_value(4, 7))]})
			i += 1.0
func top(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	return (ROOT + (0 if (_capture_t_43[0] < FREE) else ((0.5 * _S.GRAVITY) * pow((_capture_t_43[0] - FREE), 2))))
func update(dt: float, _options: Dictionary) -> void:
	_capture_t_43[0] += dt
	if ((not _capture_dripped_46[0]) and (_capture_t_43[0] >= DRIP)):
		_capture_dripped_46[0] = true
		bits.add({"kind": _S.B.DRIP, "x": 0.5, "y": ((ROOT + LEN) + 1), "vy": 20, "g": 0.9, "life": 1.2, "c": C[int(6)]})
	if (((_capture_t_43[0] > TREMBLE) and (_capture_t_43[0] < SNAP)) and R.chance(0.25)):
		ps.spawn(_S.P.FLAKE, R.range_value((-6), 6), (ROOT + R.range_value(0, 3)), R.range_value((-8), 8), R.range_value(5, 20), R.range_value(0.6, 1.1), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.5, 1.1))
	if ((not _capture_snapped_44[0]) and (_capture_t_43[0] >= SNAP)):
		_capture_snapped_44[0] = true
		lights.add(0, (ROOT + 4), 24, _C.WHITE, 0.6, 0.1)
		lights.add(0, (ROOT + 4), 32, C[int(5)], 0.4, 0.3)
		if true:
			var i = 0
			while (i < 7):
				var a = R.range_value(0, TAU)
				var sp = R.range_value(30, 110)
				bits.add({"kind": _S.B.SHARD, "x": R.range_value((-4), 4), "y": (ROOT + 2), "vx": (cos(a) * sp), "vy": ((sin(a) * sp) - 20), "g": 0.8, "drag": 0.8, "bounce": 0.3, "life": R.range_value(0.5, 0.9), "a": R.range_value(0, TAU), "va": R.range_value((-20), 20), "s": R.range_value(1, 2), "c": C[int(R.int_value(5, 7))]})
				i += 1.0
		if true:
			var i = 0
			while (i < 3):
				ps.spawn(_S.P.VAPOUR, R.range_value((-5), 5), (ROOT + 2), R.range_value((-25), 25), R.range_value((-5), 5), R.range_value(0.4, 0.7), C[int(6)], R.range_value(1.6, 2.6))
				i += 1.0
		if true:
			var i = 0
			while (i < 5):
				ps.spawn(_S.P.FLAKE, R.range_value((-6), 6), (ROOT + 2), R.range_value((-30), 30), R.range_value((-20), 20), R.range_value(0.6, 1.2), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.5, 1.3))
				i += 1.0
	if (((_capture_t_43[0] > FREE) and (_capture_t_43[0] < IMPACT)) and R.chance(0.5)):
		var tp = top()
		ps.spawn(_S.P.MOTE, R.range_value((-3), 3), (tp + R.range_value(0, (LEN * 0.6))), R.range_value((-10), 10), R.range_value((-40), (-10)), R.range_value(0.2, 0.35), (C[int(6)] if R.chance(0.5) else C[int(5)]), 0.6)
	if ((not _capture_landed_45[0]) and (_capture_t_43[0] >= IMPACT)):
		_capture_landed_45[0] = true
		var tp = (-LEN)
		lights.add(0, (-16), 46, _C.WHITE, 0.85, 0.12)
		lights.add(0, (-16), 58, C[int(4)], 0.5, 0.5)
		var parts = [[[(float((-W)) / 2), tp], [(float(W) / 2), tp], [0.5, 0]]]
		for v in [0.3, 0.58, 0.8]:
			parts = _R.flat_map(parts, func(poly, _unused1=null, _unused2=null, _unused3=null):
				return _I.split_poly(poly, 0, ((tp + (LEN * v)) + R.range_value((-2), 2)), R.range_value((-0.4), 0.4)))
		parts = _R.flat_map(parts, func(poly, _unused1=null, _unused2=null, _unused3=null):
			return (_I.split_poly(poly, _I.centroid(poly).x, _I.centroid(poly).y, ((float(PI) / 2) + R.range_value((-0.5), 0.5))) if (_I.centroid(poly).area > 22) else [poly]))
		for part in parts:
			var m = _I.centroid(part)
			var side = ((-1) if (m.x < 0.5) else 1)
			var low = clampf((float((-m.y)) / LEN), 0.0, 1.0)
			panes.add({"pts": _B.map_indexed(part, func(_arg0, _unused1=null, _unused2=null, _unused3=null):
				var x = _B.at(_arg0, 0)
				var y = _B.at(_arg0, 1)
				return [(x - m.x), (y - m.y)]), "x": m.x, "y": m.y, "vx": ((side * R.range_value(30, 110)) + R.range_value((-15), 15)), "vy": ((-R.range_value(70, 200)) * (0.4 + low)), "a": 0, "va": R.range_value((-12), 12), "f": R.range_value((-0.7), 0.7), "vf": R.range_value((-8), 8), "lit": 0.75, "g": 0.9, "drag": 0.6, "bounce": 0.35, "solid": true, "ridge": (float(PI) / 2), "brittle": 2, "crumble": R.range_value(0.15, 0.45), "life": R.range_value(1, 1.4)})
		if true:
			var i = 0
			while (i < 52):
				var a = ((float((-PI)) / 2) + R.range_value((-1.25), 1.25))
				var sp = R.range_value(60, 230)
				bits.add({"kind": (_S.B.CHUNK if R.chance(0.15) else _S.B.SHARD), "x": R.range_value((-3), 3), "y": (-R.range_value(1, 10)), "vx": (cos(a) * sp), "vy": (sin(a) * sp), "g": 0.85, "drag": 0.6, "bounce": 0.32, "life": R.range_value(0.6, 1.2), "a": R.range_value(0, TAU), "va": R.range_value((-22), 22), "s": R.range_value(1.2, 3), "c": C[int(R.int_value(4, 7))], "ramp": [C[int(1)], C[int(3)], C[int(4)], C[int(6)], C[int(7)]]})
				i += 1.0
		if true:
			var i = 0
			while (i < 10):
				var s = R.sign_value()
				ps.spawn(_S.P.VAPOUR, (s * R.range_value(0, 8)), (-R.range_value(1, 6)), (s * R.range_value(25, 90)), (-R.range_value(2, 14)), R.range_value(0.6, 1.1), C[int(6)], R.range_value(2.2, 3.8))
				i += 1.0
		if true:
			var i = 0
			while (i < 12):
				ps.spawn(_S.P.FLAKE, R.range_value((-6), 6), (-R.range_value(2, 16)), R.range_value((-70), 70), (-R.range_value(30, 110)), R.range_value(1, 1.5), (_C.WHITE if R.chance(0.6) else C[int(6)]), R.range_value(0.5, 1.5))
				i += 1.0
		if true:
			var i = 0
			while (i < 6):
				ps.spawn(_S.P.STAR, R.range_value((-24), 24), (-R.range_value(4, 34)), R.range_value((-10), 10), (-R.range_value(4, 14)), R.range_value(0.4, 0.8), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(1, 2.2))
				i += 1.0
	if (((_capture_landed_45[0] and (_capture_t_43[0] < (IMPACT + 0.9))) and R.chance(0.08)) and bits.list.size()):
		var b = R.pick(bits.list)
		ps.spawn(_S.P.STAR, b.x, (b.y - 1), 0, (-3), R.range_value(0.2, 0.4), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.6, 1.4))
	ps.update(dt)
	bits.update(dt)
	panes.update(dt)
	lights.update(dt)
	_I.end_by(_capture_t_43[0], META.duration, [ps, bits, panes])
func draw_back(p, _time_argument: float, _options: Dictionary) -> void:
	if ((_capture_t_43[0] > TREMBLE) and (_capture_t_43[0] < (IMPACT + 0.05))):
		var k = ((_M.seg(_capture_t_43[0], TREMBLE, FREE) * 0.35) if (_capture_t_43[0] < FREE) else (0.35 + (0.65 * _M.seg(_capture_t_43[0], FREE, IMPACT))))
		var rx = (3 + (7 * k))
		if true:
			var x = floori((-rx))
			while (x <= rx):
				var f = (1 - pow((float(x) / rx), 2))
				p.blend((x + 0.5), 0, C[int(0)], ((0.7 * k) * f))
				if (absf(x) < (rx * 0.7)):
					p.blend((x + 0.5), 1, C[int(0)], ((0.45 * k) * f))
				x += 1.0
	if (_capture_t_43[0] >= IMPACT):
		var g = _E.out_cubic(_M.seg(_capture_t_43[0], IMPACT, (IMPACT + 0.25)))
		var out = (1 - _M.smooth((IMPACT + 0.8), (IMPACT + 1.5), _capture_t_43[0]))
		if true:
			var x = (-26)
			while (x <= 26):
				var d = (float(absf((x + 0.5))) / 26)
				var h = _M.rand([x, 23])
				var a = (out * clampf((float(((g * 1.15) - d)) / 0.15), 0.0, 1.0))
				if (a <= 0):
					x += 1.0
					continue
				p.dot(x, 0, (_C.WHITE if ((h < 0.35) if (h < 0.35) else (d > (g - 0.12))) else C[int(6)]), a)
				if (h < 0.4):
					if true:
						var j = 1
						while (j <= _M.js_round(((1 + (_M.rand([x, 3]) * 2.5)) * (1 - d)))):
							p.dot((x + (signf(x) * (1 if (j > 1) else 0))), (-j), (_C.WHITE if (j > 1) else C[int(5)]), a)
							j += 1.0
				if true:
					var j = 1
					while (j <= _M.js_round(((2 + (_M.rand([x, 7]) * 3)) * (1 - (d * 0.6))))):
						p.dot(x, j, (C[int(5)] if (j < 2) else C[int(4)]), (a * (1.1 - (float(j) / 6))))
						j += 1.0
				x += 1.0
		var k = _M.seg(_capture_t_43[0], IMPACT, (IMPACT + 0.35))
		if (k < 1):
			_S.band(p, 0, 0.5, (6 + (34 * _E.out_cubic(k))), 0.18, maxf(1, (4 * (1 - k))), (1.1 - k), [C[int(3)], C[int(4)], C[int(5)], C[int(6)]], func(a, _unused1=null, _unused2=null, _unused3=null):
				return (sin(a) < 0))
	ps.draw(p, "back")
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	var ra = (1 - _M.smooth((META.duration - 0.7), (META.duration - 0.2), _capture_t_43[0]))
	for r in rime:
		if true:
			var j = 0
			while (j < (r.h + 1)):
				p.dot(r.x, ((ROOT - 1) - j), (_C.WHITE if (j == r.h) else (C[int(6)] if (j == (r.h - 1)) else (C[int(3)] if (j == 0) else C[int(5)]))), ra)
				j += 1.0
		if true:
			var j = 0
			while (j < r.stub):
				p.dot(r.x, (ROOT + j), (_C.WHITE if (j == (r.stub - 1)) else (C[int(5)] if (j == 0) else C[int(4)])), ra)
				j += 1.0
		if (r.stub > 4):
			p.dot((r.x + 1), ROOT, C[int(3)], ra)
	if _capture_snapped_44[0]:
		if true:
			var x = ((float((-W)) / 2) + 1)
			while (x <= ((float(W) / 2) - 1)):
				var L = (1 + _M.js_round((_M.rand([x, 77]) * 2.5)))
				if true:
					var j = 0
					while (j < L):
						p.dot(x, (ROOT + j), ((_C.WHITE if (_capture_t_43[0] < (SNAP + 0.15)) else C[int(6)]) if (j == (L - 1)) else (C[int(5)] if (x < 0) else C[int(3)])), ra)
						j += 1.0
				x += 1.0
	p.glow(0, ROOT, 18, C[int(4)], (0.3 * ra))
	if (_capture_t_43[0] >= IMPACT):
		var k = _M.seg(_capture_t_43[0], IMPACT, (IMPACT + 0.35))
		if (k < 1):
			_S.band(p, 0, 0.5, (6 + (34 * _E.out_cubic(k))), 0.18, maxf(1, (4 * (1 - k))), (1.1 - k), [C[int(3)], C[int(4)], C[int(5)], C[int(6)]], func(a, _unused1=null, _unused2=null, _unused3=null):
				return (sin(a) >= 0), (k < 0.15))
		if (_capture_t_43[0] < (IMPACT + 0.22)):
			_A.sparkle(p, 0.5, (-3), ((10 * _E.out_back(minf(1, (float((_capture_t_43[0] - IMPACT)) / 0.05)))) * (1 - (float((_capture_t_43[0] - IMPACT)) / 0.22))), C[int(6)], C[int(4)], 0.7)
	if (_capture_t_43[0] < IMPACT):
		var tp = top()
		var jx = (((1 if fmod(floori((_capture_t_43[0] * 36)), 2) else 0) * _M.js_round(((_M.seg(_capture_t_43[0], TREMBLE, SNAP) * 1.4) + 0.4))) if ((_capture_t_43[0] > TREMBLE) and (_capture_t_43[0] < SNAP)) else 0)
		var falling = (_capture_t_43[0] >= FREE)
		var sp = ((_S.GRAVITY * (_capture_t_43[0] - FREE)) if falling else 0)
		if falling:
			for _tuple1 in [[(-3), 0.7], [0.5, 1], [4, 0.6]]:
				var dx = _tuple1[0]
				var k = _tuple1[1]
				var L = (minf(30, (sp * 0.07)) * k)
				if (L > 2):
					p.line(dx, (tp - L), dx, (tp + 3), func(u, _unused1=null, _unused2=null, _unused3=null):
						return (C[int(6)] if (u > 0.75) else (C[int(4)] if (u > 0.4) else C[int(3)])))
		var gl = (float((_capture_t_43[0] - 0.04)) / 0.3)
		icicle(p, C, (jx + 0.5), tp, LEN, W, {"white": ((_capture_t_43[0] >= (IMPACT - 0.025)) if (_capture_t_43[0] >= (IMPACT - 0.025)) else ((_capture_t_43[0] >= SNAP) and (_capture_t_43[0] < (SNAP + 0.03)))), "glint": (gl if ((gl >= 0) and (gl <= 1)) else (-1))})
		if (_capture_snapped_44[0] and (_capture_t_43[0] < (SNAP + 0.12))):
			p.line(((float((-W)) / 2) - 1), (ROOT + 1), ((float(W) / 2) + 1), (ROOT + 1), _C.WHITE)
		p.glow(0.5, (tp + (LEN * 0.5)), 20, C[int(4)], 0.28)
		if (_capture_t_43[0] < DRIP):
			var s = _M.seg(_capture_t_43[0], 0, DRIP)
			p.dot(0.5, ((ROOT + LEN) + 1), C[int(6)], s)
			if (s > 0.6):
				p.px(0.5, ((ROOT + LEN) + 2), _C.WHITE)
	panes.draw(p, C)
	bits.draw(p)
	ps.draw(p, "front")
	lights.draw(p)
func _weak_callback_0(q, x, y, v):
	if (v < 100):
		return null
	ps.spawn(_S.P.VAPOUR, x, (y - 1), R.range_value((-15), 15), (-R.range_value(2, 8)), R.range_value(0.4, 0.6), C[int(6)], R.range_value(1.4, 2.2))
	splinter(x, y, q.vx, 2)
func _weak_callback_1(q, _unused1=null, _unused2=null, _unused3=null):
	return splinter(q.x, 0, q.vx, 3)
