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
## Source: src/fx/ice/ice-shatter.js
const META = {"id":"pixelfx.ice_shatter","name":"Ice shatter","desc":"A block of ice takes a hit from the left: it jolts, cracks race over its faces, it flashes white and bursts into chunks that tumble, bounce and skid off in a roll of ice dust.","tags":["ice","shatter","break","destroy","impact","directional","one-shot"],"size":[224,112],"origin":[68,90],"duration":2.8,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#151a3d","#212f6b","#2c58aa","#3a8bd8","#62c8f4","#a6ecff","#dcfbff","#ffffff"],"seed":6},"cacheable":false,"layers":["back","front"]}
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
	return Rect2i(-164, -186, 416, 304)
var HIT = 0.26
var CRACK2 = 0.4
var SHIVER = 0.54
var FLASH = 0.62
var BURST = 0.68
var FRONT = [[(-16), 0], [(-16), (-28)], [12, (-28)], [12, 0]]
var TOP = [[(-16), (-28)], [(-8), (-34)], [20, (-34)], [12, (-28)]]
var SIDE = [[12, 0], [12, (-28)], [20, (-34)], [20, (-6)]]
var SIL = [[(-16), 0], [(-16), (-28)], [(-8), (-34)], [20, (-34)], [20, (-6)], [12, 0]]
var HIT_AT = [(-16), (-15)]
var PLANE = [[(-16), (-21)], [(-5), (-28)], [3, (-13)], [(-16), (-9)]]
var SHADE = [[5, (-28)], [12, (-28)], [12, (-10)]]
var o = {}
var C
var R
var ps
var bits
var lights
var scuffs
var panes
var veins
var bubbles
var cracks
var cracks2
var _capture_t_30
var _capture_struck_31
var _capture_burst_32
var _capture_wave2_33
var _capture_white_34
func create(options: Dictionary):
	o = options

	C = _C.fit(o.palette, 8)
	R = _M.Rng.new(o.seed)
	ps = _S.Particles.new({"rng": R, "ground": _R.weak_callback(self, "floor_y"), "sparks": [C[int(7)], C[int(6)], C[int(5)], C[int(4)]], "haze": C[int(5)]})
	bits = _R.Bits.new({"ground": _R.weak_callback(self, "floor_y")})
	lights = _S.Lights.new()
	scuffs = []

	panes = _I.Panes.new({"ground": _R.weak_callback(self, "floor_y"), "onLand": _R.weak_callback(self, "_weak_callback_0"), "onSkid": _R.weak_callback(self, "_weak_callback_1"), "onCrumble": _R.weak_callback(self, "_weak_callback_2")})
	veins = []
	bubbles = []
	if true:
		var k = 0
		while (k < 3):
			var x = R.range_value((-12), 8)
			var y = R.range_value((-24), (-6))
			var a = R.range_value(0, TAU)
			if true:
				var i = 0
				while (i < 9):
					a += R.range_value((-0.6), 0.6)
					x += (cos(a) * 1.5)
					y += (sin(a) * 1.2)
					if ((((x < (-14)) if (x < (-14)) else (x > 10)) if ((x < (-14)) if (x < (-14)) else (x > 10)) else (y < (-26))) if (((x < (-14)) if (x < (-14)) else (x > 10)) if ((x < (-14)) if (x < (-14)) else (x > 10)) else (y < (-26))) else (y > (-2))):
						break
					_R.push_items(veins, [[floori(x), floori(y)]])
					i += 1.0
			k += 1.0
	if true:
		var k = 0
		while (k < 5):
			_R.push_items(bubbles, [[R.int_value((-12), 8), R.int_value((-23), (-4)), (1 if R.chance(0.4) else 0)]])
			k += 1.0

	cracks = _I.fractures(R, inside, (HIT_AT[int(0)] + 1), HIT_AT[int(1)], 4, {"len": 8, "a0": (-0.9), "spread": 1.9})
	cracks2 = _I.fractures(R, inside, (HIT_AT[int(0)] + 1), HIT_AT[int(1)], 6, {"len": 18, "a0": (-1.3), "spread": 2.7, "fork": 0.16})
	_capture_t_30 = [0]
	_capture_struck_31 = [false]
	_capture_burst_32 = [false]
	_capture_wave2_33 = [false]
	_capture_white_34 = [false]




	return self
func chop(pts, max, depth, _unused3=null):
	var c = _I.centroid(pts)
	return ([pts] if ((c.area < max) if (c.area < max) else (depth > 4)) else _R.flat_map(_I.split_poly(pts, (c.x + R.range_value((-1), 1)), (c.y + R.range_value((-1), 1)), R.range_value(0, PI)), func(q, _unused1=null, _unused2=null, _unused3=null):
		return chop(q, max, (depth + 1))))
func floor_y(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	return 0
func splinter(x, y, vx, n):
	if true:
		var i = 0
		while (i < n):
			bits.add({"kind": _S.B.SHARD, "x": (x + R.range_value((-2), 2)), "y": (y - 1), "vx": ((vx * 0.6) + R.range_value((-35), 45)), "vy": (-R.range_value(30, 100)), "g": 0.8, "drag": 0.6, "bounce": 0.35, "life": R.range_value(0.4, 0.8), "a": R.range_value(0, TAU), "va": R.range_value((-18), 18), "s": R.range_value(1.2, 2.4), "c": C[int(R.int_value(4, 7))]})
			i += 1.0
func inside(x, y, _unused2=null, _unused3=null):
	return _I.in_poly(SIL, x, y)
func jolt(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	return (2 if ((_capture_t_30[0] >= HIT) and (_capture_t_30[0] < (HIT + 0.05))) else (1 if ((_capture_t_30[0] >= (HIT + 0.05)) and (_capture_t_30[0] < (HIT + 0.12))) else ((1 if fmod(floori((_capture_t_30[0] * 40)), 2) else 0) if ((_capture_t_30[0] >= SHIVER) and (_capture_t_30[0] < FLASH)) else 0)))
func drawBlock(p, _unused1=null, _unused2=null, _unused3=null):
	if (_capture_t_30[0] >= BURST):
		return null
	var jx = jolt()
	var wh = (_capture_t_30[0] >= FLASH)
	var sweep = ((-40) + (70 * _M.seg(_capture_t_30[0], 0.04, 0.3)))
	var sh = func(pts, _unused1=null, _unused2=null, _unused3=null):
		return _B.map_indexed(pts, func(_arg0, _unused1=null, _unused2=null, _unused3=null):
			var x = _B.at(_arg0, 0)
			var y = _B.at(_arg0, 1)
			return [(x + jx), y])
	p.poly(sh.call([[(-17), 1], [(-17), (-28.5)], [(-8.3), (-35.2)], [21, (-35.2)], [21, (-5.6)], [12.5, 1]]), C[int(0)])
	if wh:
		p.poly(sh.call(SIL), _C.WHITE)
		return null
	p.poly(sh.call(FRONT), func(x, y, _unused2=null, _unused3=null):
		var lx = (x - jx)
		var d = (lx + (y * 0.8))
		if ((absf((d - sweep)) < 1.3) and (y < (-6))):
			return _C.WHITE
		if ((y < (-9)) and ((absf((d + 21)) < 1.1) if (absf((d + 21)) < 1.1) else (absf((d + 16.5)) < 0.6))):
			return C[int(6)]
		if ((((absf((lx + 7.5)) < 0.5) and (y < (-6))) if ((absf((lx + 7.5)) < 0.5) and (y < (-6))) else ((absf((y + 5.5)) < 0.5) and (lx > (-8)))) and (fmod((floori(lx) + floori(y)), 2) == 0)):
			return C[int(5)]
		if _I.in_poly(PLANE, lx, y):
			return (C[int(6)] if (y < (-25.5)) else C[int(5)])
		if _I.in_poly(SHADE, lx, y):
			return C[int(3)]
		return (C[int(5)] if (y < (-25.5)) else (C[int(4)] if (y < (-8)) else (C[int(3)] if (y < (-2.5)) else C[int(2)]))))
	p.poly(sh.call(TOP), func(x, y, _unused2=null, _unused3=null):
		return (C[int(7)] if (y > (-29.5)) else (C[int(5)] if (y < (-32.5)) else (C[int(7)] if (_M.rand([floori(x), floori(y), 3]) < 0.08) else C[int(6)]))))
	p.poly(sh.call(SIDE), func(x, y, _unused2=null, _unused3=null):
		var lx = (x - jx)
		return (C[int(3)] if (lx < 13.5) else (C[int(3)] if ((absf((lx - 16.5)) < 0.6) and (y < (-8))) else (C[int(1)] if (y > (((lx - 12) * (-0.75)) - 3)) else C[int(2)]))))
	for _tuple1 in veins:
		var x = _tuple1[0]
		var y = _tuple1[1]
		p.px((x + jx), y, C[int(5)])
	for _tuple2 in bubbles:
		var x = _tuple2[0]
		var y = _tuple2[1]
		var big = _tuple2[2]
		p.px((x + jx), y, C[int(6)])
		if big:
			p.px(((x + jx) + 1), y, C[int(5)])
			p.px((x + jx), (y + 1), C[int(5)])
	var E = func(a, b, c, _unused3=null):
		return p.line((a[int(0)] + jx), a[int(1)], (b[int(0)] + jx), b[int(1)], c)
	E.call([(-16), (-28)], [12, (-28)], _C.WHITE)
	E.call([(-16), (-28)], [(-8), (-34)], C[int(6)])
	E.call([(-8), (-34)], [20, (-34)], C[int(5)])
	E.call([12, (-28)], [20, (-34)], C[int(7)])
	E.call([(-16), (-1)], [(-16), (-28)], C[int(5)])
	E.call([12, (-1)], [12, (-28)], C[int(6)])
	E.call([20, (-6)], [20, (-34)], C[int(3)])
	E.call([13, (-1)], [20, (-6)], C[int(1)])
	if (_capture_t_30[0] >= HIT):
		_I.draw_fractures(p, cracks, ((_capture_t_30[0] - HIT) * 170), C, {"ox": jx})
	if (_capture_t_30[0] >= CRACK2):
		_I.draw_fractures(p, cracks2, ((_capture_t_30[0] - CRACK2) * 200), C, {"ox": jx})
func drawFloor(p, _unused1=null, _unused2=null, _unused3=null):
	var out = (1 - _M.smooth((BURST + 0.6), (BURST + 1.5), _capture_t_30[0]))
	if (out > 0):
		if true:
			var x = (-22)
			while (x <= 26):
				var d = (float(absf((x - 2))) / 24)
				var h = _M.rand([x, 41])
				var a = (out * clampf((float((1.1 - d)) / 0.25), 0.0, 1.0))
				if (a <= 0):
					x += 1.0
					continue
				p.dot(x, 0, (_C.WHITE if (h < 0.35) else C[int(6)]), a)
				if ((h < 0.4) and ((x < (-16)) if (x < (-16)) else (x > 20))):
					p.dot(x, (-1), C[int(5)], a)
				if true:
					var j = 1
					while (j <= (1 + _M.js_round(((_M.rand([x, 7]) * 3) * (1 - d))))):
						p.dot(x, j, (C[int(5)] if (j < 2) else C[int(4)]), (a * (1 - (float(j) / 5))))
						j += 1.0
				x += 1.0
	for s in scuffs:
		var a = (1 - (float(s.t) / 0.9))
		if (a > 0):
			p.dot(s.x, 0, (_C.WHITE if (s.t < 0.15) else C[int(6)]), a)
			p.dot(s.x, 1, C[int(4)], (a * 0.6))
func explode(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	for _tuple3 in [[FRONT, 0.6, 46], [TOP, 1, 40], [SIDE, 0.3, 46]]:
		var face = _tuple3[0]
		var tone = _tuple3[1]
		var max = _tuple3[2]
		for part in chop(face, max, 0):
			var m = _I.centroid(part)
			var dx = (m.x - HIT_AT[int(0)])
			var dy = (m.y - HIT_AT[int(1)])
			var d = (_R.hypot([dx, dy]) if _R.hypot([dx, dy]) else 1)
			var sp = (R.range_value(50, 150) * (0.7 + (0.3 * (1 - (float(d) / 40)))))
			panes.add({"pts": _B.map_indexed(part, func(_arg0, _unused1=null, _unused2=null, _unused3=null):
				var x = _B.at(_arg0, 0)
				var y = _B.at(_arg0, 1)
				return [(x - m.x), (y - m.y)]), "x": m.x, "y": m.y, "vx": ((((float(dx) / d) * sp) * 0.9) + R.range_value(40, 110)), "vy": ((((float(dy) / d) * sp) * 0.4) - R.range_value(60, 200)), "a": 0, "va": R.range_value((-10), 10), "f": R.range_value((-0.9), 0.9), "vf": R.range_value((-7), 7), "tone": tone, "lit": tone, "g": 0.9, "drag": 0.5, "bounce": 0.38, "solid": true, "brittle": 3, "crumble": R.range_value(0.25, 0.6), "life": R.range_value(1.5, 1.9)})
	if true:
		var i = 0
		while (i < 46):
			var x = R.range_value((-15), 19)
			var y = (-R.range_value(1, 33))
			var dx = (x - HIT_AT[int(0)])
			var dy = (y - HIT_AT[int(1)])
			var d = (_R.hypot([dx, dy]) if _R.hypot([dx, dy]) else 1)
			var sp = R.range_value(60, 200)
			if (not inside(x, y)):
				i += 1.0
				continue
			bits.add({"kind": (_S.B.CHUNK if R.chance(0.15) else _S.B.SHARD), "x": x, "y": y, "vx": ((((float(dx) / d) * sp) * 0.8) + R.range_value(20, 90)), "vy": ((((float(dy) / d) * sp) * 0.4) - R.range_value(60, 240)), "g": 0.85, "drag": 0.6, "bounce": 0.32, "life": R.range_value(0.8, 1.4), "a": R.range_value(0, TAU), "va": R.range_value((-22), 22), "s": R.range_value(1.2, 3.4), "c": C[int(R.int_value(4, 7))], "ramp": [C[int(1)], C[int(3)], C[int(4)], C[int(6)], C[int(7)]]})
			i += 1.0
	if true:
		var i = 0
		while (i < 9):
			ps.spawn(_S.P.VAPOUR, R.range_value((-6), 18), (-R.range_value(1, 6)), R.range_value(10, 130), (-R.range_value(2, 12)), R.range_value(0.6, 1.1), C[int(6)], R.range_value(2.2, 3.8))
			i += 1.0
	if true:
		var i = 0
		while (i < 5):
			ps.spawn(_S.P.DUST, R.range_value((-6), 16), (-R.range_value(1, 4)), R.range_value(30, 110), (-R.range_value(2, 8)), R.range_value(0.5, 0.9), C[int(5)], R.range_value(1.6, 2.8))
			i += 1.0
	if true:
		var i = 0
		while (i < 4):
			ps.spawn(_S.P.VAPOUR, R.range_value((-8), 18), (-R.range_value(8, 28)), R.range_value((-10), 50), (-R.range_value(8, 24)), R.range_value(0.6, 1), C[int(6)], R.range_value(2.6, 4))
			i += 1.0
	if true:
		var i = 0
		while (i < 16):
			var a = R.range_value(((-PI) * 0.9), (-0.1))
			var sp = R.range_value(40, 140)
			ps.spawn(_S.P.FLAKE, R.range_value((-8), 16), (-R.range_value(6, 28)), ((cos(a) * sp) + 20), (sin(a) * sp), R.range_value(1, 1.6), (_C.WHITE if R.chance(0.6) else C[int(6)]), R.range_value(0.5, 1.6))
			i += 1.0
	if true:
		var i = 0
		while (i < 7):
			ps.spawn(_S.P.STAR, R.range_value((-14), 40), (-R.range_value(4, 40)), R.range_value((-8), 16), (-R.range_value(4, 16)), R.range_value(0.4, 0.8), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(1, 2.4))
			i += 1.0
	lights.add(2, (-17), 64, _C.WHITE, 0.85, 0.14)
	lights.add(16, (-18), 86, C[int(4)], 0.5, 0.55)
func update(dt: float, _options: Dictionary) -> void:
	_capture_t_30[0] += dt
	if ((not _capture_struck_31[0]) and (_capture_t_30[0] >= HIT)):
		_capture_struck_31[0] = true
		lights.add(HIT_AT[int(0)], HIT_AT[int(1)], 24, _C.WHITE, 0.6, 0.08)
		lights.add((HIT_AT[int(0)] + 6), HIT_AT[int(1)], 40, C[int(5)], 0.4, 0.3)
		if true:
			var i = 0
			while (i < 12):
				var a = (PI + R.range_value((-0.9), 0.9))
				var sp = R.range_value(50, 120)
				ps.spawn(_S.P.SPARK, (HIT_AT[int(0)] - 1), HIT_AT[int(1)], (cos(a) * sp), ((sin(a) * sp) - 40), R.range_value(0.15, 0.4))
				i += 1.0
		if true:
			var i = 0
			while (i < 6):
				var a = (PI + R.range_value((-1), 0.8))
				var sp = R.range_value(40, 100)
				bits.add({"kind": _S.B.SHARD, "x": (HIT_AT[int(0)] - 1), "y": (HIT_AT[int(1)] + R.range_value((-2), 2)), "vx": (cos(a) * sp), "vy": ((sin(a) * sp) - 60), "g": 0.85, "drag": 0.6, "bounce": 0.3, "life": R.range_value(0.5, 0.9), "a": R.range_value(0, TAU), "va": R.range_value((-20), 20), "s": R.range_value(1.2, 2.4), "c": C[int(R.int_value(5, 7))]})
				i += 1.0
	if ((not _capture_wave2_33[0]) and (_capture_t_30[0] >= CRACK2)):
		_capture_wave2_33[0] = true
		lights.add(0, (-16), 36, C[int(6)], 0.35, 0.15)
		if true:
			var i = 0
			while (i < 3):
				bits.add({"kind": _S.B.SHARD, "x": R.range_value((-14), 18), "y": (-R.range_value(4, 30)), "vx": R.range_value((-30), 30), "vy": (-R.range_value(10, 50)), "g": 0.85, "drag": 0.6, "bounce": 0.3, "life": R.range_value(0.4, 0.7), "a": R.range_value(0, TAU), "va": R.range_value((-20), 20), "s": R.range_value(1, 2), "c": C[int(R.int_value(5, 7))]})
				i += 1.0
	if ((not _capture_white_34[0]) and (_capture_t_30[0] >= FLASH)):
		_capture_white_34[0] = true
		lights.add(2, (-17), 44, _C.WHITE, 0.7, 0.08)
	if ((not _capture_burst_32[0]) and (_capture_t_30[0] >= BURST)):
		_capture_burst_32[0] = true
		explode()
	if (((_capture_burst_32[0] and (_capture_t_30[0] < (BURST + 1))) and R.chance(0.08)) and bits.list.size()):
		var b = R.pick(bits.list)
		ps.spawn(_S.P.STAR, b.x, (b.y - 1), 0, (-3), R.range_value(0.2, 0.4), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.6, 1.5))
	if true:
		var i = (scuffs.size() - 1)
		while (i >= 0):
			if (_R.assign_member(scuffs[int(i)], "t", dt, "+=") > 0.9):
				scuffs.remove_at(int(i))
			i -= 1.0
	ps.update(dt)
	bits.update(dt)
	panes.update(dt)
	lights.update(dt)
	_I.end_by(_capture_t_30[0], META.duration, [ps, bits, panes])
func draw_back(p, _time_argument: float, _options: Dictionary) -> void:
	drawFloor(p)
	ps.draw(p, "back")
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	drawBlock(p)
	var h = (_capture_t_30[0] - HIT)
	if ((h >= 0) and (h < 0.2)):
		_A.sparkle(p, (HIT_AT[int(0)] - 1), HIT_AT[int(1)], ((9 * _E.out_back(minf(1, (float(h) / 0.04)))) * (1 - (float(h) / 0.2))), C[int(6)], C[int(4)], 0.7)
		if (h < 0.08):
			_S.flare(p, (HIT_AT[int(0)] - 1), HIT_AT[int(1)], (14 * (1 - (float(h) / 0.08))), (1 - (float(h) / 0.08)), C)
	var k = (1 - _M.smooth(BURST, (BURST + 0.4), _capture_t_30[0]))
	var crk = _M.smooth(HIT, FLASH, _capture_t_30[0])
	if (k > 0):
		p.glow(2, (-17), 34, C[int(4)], ((0.16 + (0.22 * crk)) * k))
		p.glow(2, (-2), 30, C[int(4)], (0.14 * k))
	if ((_capture_t_30[0] >= FLASH) and (_capture_t_30[0] < (BURST + 0.12))):
		_S.flare(p, 2, (-17), (26 * (1 - clampf((float((_capture_t_30[0] - FLASH)) / 0.18), 0.0, 1.0))), (1 - clampf((float((_capture_t_30[0] - FLASH)) / 0.18), 0.0, 1.0)), C)
	panes.draw(p, C)
	bits.draw(p)
	ps.draw(p, "front")
	lights.draw(p)
func _weak_callback_0(q, x, y, v):
	if (v < 100):
		return null
	ps.spawn(_S.P.VAPOUR, x, (y - 1), ((q.vx * 0.3) + R.range_value((-15), 15)), (-R.range_value(2, 10)), R.range_value(0.4, 0.7), C[int(6)], R.range_value(1.6, 2.8))
	splinter(x, y, q.vx, 2)
	if R.chance(0.3):
		ps.spawn(_S.P.STAR, x, (y - 3), 0, (-5), R.range_value(0.2, 0.4), _C.WHITE, R.range_value(0.8, 1.6))
func _weak_callback_1(q, x, _unused2=null, _unused3=null):
	if R.chance(0.5):
		_R.push_items(scuffs, [{"x": _M.js_round((x + R.range_value((-1), 1))), "t": 0}])
func _weak_callback_2(q, _unused1=null, _unused2=null, _unused3=null):
	splinter(q.x, 0, q.vx, 3)
	ps.spawn(_S.P.VAPOUR, q.x, (-1), R.range_value((-10), 14), (-R.range_value(2, 6)), R.range_value(0.4, 0.7), C[int(6)], R.range_value(1.2, 2))
