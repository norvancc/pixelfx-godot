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
## Source: src/fx/ice/ice-spikes.js
const META = {"id":"pixelfx.ice_spikes","name":"Ice spikes","desc":"A frost line races along the floor and clusters of jagged ice blades burst up behind it in a rising wave, glint, flash white together and shatter into toppling shards.","tags":["ice","spikes","ground","wave","directional","magic","one-shot"],"size":[264,112],"origin":[24,96],"duration":3,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#151a3d","#212f6b","#2c58aa","#3a8bd8","#62c8f4","#a6ecff","#dcfbff","#ffffff"],"reach":172,"height":56,"seed":3},"cacheable":false,"layers":["back","front"]}
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
			var limits = {"reach":[60,240],"height":[24,88]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	for field in fields:
		if field.name in ["count","shafts"]: field.type=TYPE_INT; field.default=int(field.default)
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-188, -224, 592, 368)
var START = 0.04
var RUN = 0.44
var SHIMMER = 0.74
var TREMBLE = 1.2
var FLASH = 1.36
var SHATTER = 1.42
var MELT = 1.75
var o = {}
var C
var R
var REACH
var ps
var bits
var lights
var panes
var clusters
var crest
var _capture_t_24
var _capture_broke_25
var _capture_trembled_26
func create(options: Dictionary):
	o = options
	C = _C.fit(o.palette, 8)
	R = _M.Rng.new(o.seed)
	REACH = o.reach
	ps = _S.Particles.new({"rng": R, "ground": _R.weak_callback(self, "floor_y"), "sparks": [C[int(7)], C[int(6)], C[int(5)], C[int(4)]], "haze": C[int(5)]})
	bits = _R.Bits.new({"ground": _R.weak_callback(self, "floor_y")})
	lights = _S.Lights.new()

	panes = _I.Panes.new({"ground": _R.weak_callback(self, "floor_y"), "onCrumble": _R.weak_callback(self, "_weak_callback_0"), "onLand": _R.weak_callback(self, "_weak_callback_1")})



	clusters = []
	if true:
		var x = 10
		while (x < (REACH - 2)):
			var q = (float(x) / REACH)
			var H = ((o.height * env(q)) * R.range_value(0.88, 1.06))
			var W = clampf((H * 0.36), 5, 14)
			var lean = (H * R.range_value(0.2, 0.34))
			var list = [{"dx": (W * R.range_value(0.35, 0.6)), "h": (H * R.range_value(0.5, 0.7)), "w": (W * 0.7), "lean": (H * R.range_value(0.4, 0.6)), "back": true, "delay": R.range_value(0.02, 0.05), "jag": (R.range_value(0.35, 0.6) if R.chance(0.5) else (-1))}, {"dx": 0, "h": H, "w": W, "lean": lean, "back": false, "delay": 0, "jag": (R.range_value(0.32, 0.58) if R.chance(0.7) else (-1)), "main": true}]
			if (H > 14):
				_R.push_items(list, [{"dx": ((-W) * R.range_value(0.35, 0.55)), "h": (H * R.range_value(0.24, 0.4)), "w": (W * 0.55), "lean": ((-H) * R.range_value(0, 0.12)), "back": false, "delay": R.range_value(0.03, 0.07), "jag": (-1)}])
			_R.push_items(clusters, [{"x": x, "q": q, "H": H, "W": W, "blades": list, "main": list[int(1)], "t0": (reachedAt(x) + 0.012), "up": false}])
			x += R.range_value(20, 26)
	crest = _R.reduce_array(clusters, func(a, c, _unused2=null, _unused3=null):
		return (c if (c.H > a.H) else a), clusters[int(0)])
	_capture_t_24 = [0]
	_capture_broke_25 = [false]
	_capture_trembled_26 = [false]




	return self
func floor_y(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	return 0
func splinter(x, y, vx, n):
	if true:
		var i = 0
		while (i < n):
			bits.add({"kind": _S.B.SHARD, "x": (x + R.range_value((-2), 2)), "y": (y - 1), "vx": ((vx * 0.5) + R.range_value((-45), 45)), "vy": (-R.range_value(30, 100)), "g": 0.8, "drag": 0.6, "bounce": 0.35, "life": R.range_value(0.4, 0.75), "a": R.range_value(0, TAU), "va": R.range_value((-18), 18), "s": R.range_value(1.2, 2.4), "c": C[int(R.int_value(4, 7))]})
			i += 1.0
func front(t, _unused1=null, _unused2=null, _unused3=null):
	return (REACH * (1 - pow((1 - _M.seg(t, START, (START + RUN))), 1.7)))
func reachedAt(x, _unused1=null, _unused2=null, _unused3=null):
	return (START + (RUN * (1 - pow((1 - clampf((float(x) / REACH), 0.0, 1.0)), (float(1) / 1.7)))))
func env(q, _unused1=null, _unused2=null, _unused3=null):
	return (0.28 + (0.72 * exp((-pow((float((q - 0.64)) / 0.3), 2)))))
func pose(c, b, _unused2=null, _unused3=null):
	var g = _E.out_back(clampf((float(((_capture_t_24[0] - c.t0) - b.delay)) / 0.09), 0.0, 1.0), 2.2)
	var x = (c.x + b.dx)
	return {"g": g, "x": x, "tx": (x + (b.lean * g)), "ty": ((-b.h) * g), "white": ((((_capture_t_24[0] - c.t0) - b.delay) < 0.03) if (((_capture_t_24[0] - c.t0) - b.delay) < 0.03) else ((_capture_t_24[0] >= FLASH) and (_capture_t_24[0] < SHATTER)))}
func drawClusters(p, _unused1=null, _unused2=null, _unused3=null):
	if (_capture_t_24[0] >= SHATTER):
		return null
	for pass_value in [0, 1, 2]:
		for c in clusters:
			if (_capture_t_24[0] < c.t0):
				continue
			var jx = ((1 if fmod((floori((_capture_t_24[0] * 40)) + _M.js_round(c.x)), 2) else 0) if ((_capture_t_24[0] >= TREMBLE) and (_capture_t_24[0] < FLASH)) else 0)
			for b in c.blades:
				if (((pass_value == 0) != b.back) if ((pass_value == 0) != b.back) else ((pass_value == 1) != (not (not b.get("main"))))):
					continue
				var s = pose(c, b)
				if (s.g <= 0):
					continue
				var gl = (float(((_capture_t_24[0] - SHIMMER) - (c.q * 0.34))) / 0.2)
				_I.blade(p, (s.x + jx), 0, (s.tx + jx), s.ty, b.w, C, {"white": s.white, "jag": b.jag, "dim": (1 if b.back else 0), "glint": (gl if ((gl >= 0) and (gl <= 1)) else (-1))})
			if (pass_value == 2):
				var pop = clampf((1 - (float((_capture_t_24[0] - c.t0)) / 0.15)), 0.0, 1.0)
				var wh = (_capture_t_24[0] >= FLASH)
				p.glow((c.x + (c.main.lean * 0.4)), ((-c.H) * 0.45), ((c.H * 0.9) + 10), C[int(4)], (((0.16 + (0.42 * pop)) + (0.4 if wh else 0)) * (0.85 + (0.15 * sin(((_capture_t_24[0] * 3) + c.x))))))
				if (pop > 0):
					p.glow(c.x, (-2), 14, _C.WHITE, (0.55 * pop))
func drawFrost(p, _unused1=null, _unused2=null, _unused3=null):
	var fr = front(_capture_t_24[0])
	if true:
		var x = (-3)
		while (x <= minf(fr, (REACH + 6))):
			var q = clampf((float(x) / REACH), 0.0, 1.0)
			var age = (_capture_t_24[0] - reachedAt(maxf(0, x)))
			var a = (1 - _M.smooth((MELT + (q * 0.35)), ((MELT + (q * 0.35)) + 0.6), _capture_t_24[0]))
			if ((a <= 0) if (a <= 0) else (age < 0)):
				x += 1.0
				continue
			var h = _M.rand([x, 17])
			var grow = _M.smooth(0, 0.3, age)
			var head = (((fr - x) < 3) and (fr < REACH))
			p.dot(x, 0, (_C.WHITE if ((head if head else (age < 0.06)) if (head if head else (age < 0.06)) else (h < 0.3)) else C[int(6)]), a)
			var L = (_M.js_round((grow * (1 + (_M.rand([x, 5]) * 2.6)))) if (h < 0.45) else 0)
			if true:
				var j = 1
				while (j <= L):
					p.dot(x, (-j), (_C.WHITE if (j == L) else C[int(5)]), a)
					j += 1.0
			if ((L > 1) and (_M.rand([x, 9]) < 0.5)):
				p.dot((x + 1), ((-L) + 1), C[int(6)], a)
			var D = ((grow * (2 + (_M.rand([x, 11]) * 4))) * (1 - (q * 0.3)))
			if true:
				var j = 1
				while (j <= D):
					p.dot(x, j, (_C.WHITE if (_M.rand([((x * 31) + j), 7]) < 0.06) else (C[int(5)] if (j < 2) else (C[int(4)] if (j < 4) else C[int(3)]))), (a * (1.1 - (float(j) / (D + 1)))))
					j += 1.0
			if head:
				p.dot(x, (-1), _C.WHITE)
			x += 1.0
	if ((fr < REACH) and (_capture_t_24[0] > START)):
		p.glow(fr, (-2), 16, C[int(6)], 0.6)
		p.glow(fr, (-1), 7, _C.WHITE, 0.6)
func breakBlade(c, b, _unused2=null, _unused3=null):
	var s = pose(c, b)
	var ax = (s.tx - s.x)
	var ay = s.ty
	var L = (_R.hypot([ax, ay]) if _R.hypot([ax, ay]) else 1)
	var nx = (float((-ay)) / L)
	var ny = (float(ax) / L)
	var hw = (float(b.w) / 2)
	var tri = [[(s.x - (nx * hw)), ((-ny) * hw)], [s.tx, s.ty], [(s.x + (nx * hw)), (ny * hw)]]
	var ang = (atan2(ay, ax) + (float(PI) / 2))
	var parts = [tri]
	if (b.h > 9):
		parts = _R.flat_map(parts, func(poly, _unused1=null, _unused2=null, _unused3=null):
			return _I.split_poly(poly, (s.x + (ax * 0.4)), (ay * 0.4), ang))
	if (b.h > 22):
		parts = _R.flat_map(parts, func(poly, _unused1=null, _unused2=null, _unused3=null):
			return (_I.split_poly(poly, (s.x + (ax * 0.72)), (ay * 0.72), ang) if poly.any(func(_arg0, _unused1=null, _unused2=null, _unused3=null):
				var y = _B.at(_arg0, 1)
				return (y < (ay * 0.5))) else [poly]))
	for part in parts:
		var mx = 0
		var my = 0
		for _tuple1 in part:
			var x = _tuple1[0]
			var y = _tuple1[1]
			mx += x
			my += y
		mx /= part.size()
		my /= part.size()
		var up = clampf((float((-my)) / 40), 0.0, 1.0)
		panes.add({"pts": _B.map_indexed(part, func(_arg0, _unused1=null, _unused2=null, _unused3=null):
			var x = _B.at(_arg0, 0)
			var y = _B.at(_arg0, 1)
			return [(x - mx), (y - my)]), "x": mx, "y": my, "vx": R.range_value((-25), 60), "vy": ((-R.range_value(40, 130)) * (0.5 + up)), "a": 0, "va": R.range_value((-8), 8), "f": R.range_value((-0.7), 0.7), "vf": R.range_value((-6), 6), "lit": (0.45 if b.back else 0.75), "g": 0.9, "drag": 0.6, "bounce": 0.3, "solid": true, "ridge": atan2(ay, ax), "brittle": (2 if (b.h > 30) else 1), "crumble": R.range_value(0.12, 0.4), "life": R.range_value(1, 1.4)})
	if true:
		var i = 0
		while (i < (2 + (float(b.h) / 7))):
			var u = R.next()
			bits.add({"kind": (_S.B.CHUNK if R.chance(0.15) else _S.B.SHARD), "x": ((s.x + (ax * u)) + R.range_value((-1.5), 1.5)), "y": (ay * u), "vx": R.range_value((-60), 90), "vy": (-R.range_value(60, 230)), "g": 0.9, "drag": 0.6, "bounce": 0.3, "life": R.range_value(0.7, 1.3), "a": R.range_value(0, TAU), "va": R.range_value((-20), 20), "s": R.range_value(1.2, 3.2), "c": C[int(R.int_value(4, 7))], "ramp": [C[int(1)], C[int(3)], C[int(4)], C[int(6)], C[int(7)]]})
			i += 1.0
func update(dt: float, _options: Dictionary) -> void:
	_capture_t_24[0] += dt
	if (((_capture_t_24[0] - dt) <= START) and (_capture_t_24[0] > START)):
		if true:
			var i = 0
			while (i < 4):
				ps.spawn(_S.P.VAPOUR, R.range_value(0, 6), (-R.range_value(0, 3)), R.range_value(10, 60), (-R.range_value(2, 12)), R.range_value(0.4, 0.7), C[int(6)], R.range_value(2, 3.2))
				i += 1.0
		lights.add(4, (-4), 26, C[int(5)], 0.6, 0.25)
	var fr = front(_capture_t_24[0])
	if ((_capture_t_24[0] > START) and (fr < (REACH - 1))):
		if R.chance(0.5):
			ps.spawn(_S.P.STREAK, (fr - R.range_value(4, 12)), (-R.range_value(1, 3)), R.range_value(40, 80), (-R.range_value(0, 6)), R.range_value(0.08, 0.14), (C[int(6)] if R.chance(0.5) else _C.WHITE))
		if R.chance(0.3):
			ps.spawn(_S.P.FLAKE, fr, (-1), R.range_value(10, 50), (-R.range_value(20, 70)), R.range_value(0.5, 0.9), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.5, 1.2))
		if R.chance(0.12):
			ps.spawn(_S.P.VAPOUR, fr, (-R.range_value(0, 3)), R.range_value(20, 60), (-R.range_value(2, 10)), R.range_value(0.4, 0.7), C[int(6)], R.range_value(1.6, 2.8))
	for c in clusters:
		if (c.up if c.up else (_capture_t_24[0] < c.t0)):
			continue
		c.up = true
		var big = (c == crest)
		var n = (3 + _M.js_round((float(c.H) / 8)))
		if true:
			var i = 0
			while (i < n):
				var a = ((float((-PI)) / 2) + R.range_value((-1.1), 1))
				var sp = (R.range_value(60, 190) * (0.45 + (float(c.H) / 44)))
				bits.add({"kind": _S.B.SHARD, "x": (c.x + R.range_value((-3), 3)), "y": (-1), "vx": ((cos(a) * sp) + 25), "vy": (sin(a) * sp), "g": 0.8, "drag": 0.6, "bounce": 0.3, "life": R.range_value(0.6, 1.1), "a": R.range_value(0, TAU), "va": R.range_value((-18), 18), "s": R.range_value(1.2, 3), "c": C[int(R.int_value(5, 7))]})
				i += 1.0
		ps.spawn(_S.P.VAPOUR, c.x, (-1), R.range_value((-10), 40), (-R.range_value(2, 10)), R.range_value(0.5, 0.9), C[int(6)], (R.range_value(2.2, 3.4) * (0.6 + (float(c.H) / 60))))
		if true:
			var i = 0
			while (i < 2):
				ps.spawn(_S.P.FLAKE, (c.x + R.range_value((-4), 4)), (-R.range_value(2, (c.H * 0.5))), R.range_value((-20), 40), (-R.range_value(20, 60)), R.range_value(0.6, 1.1), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.5, 1.3))
				i += 1.0
		if (c.H > 16):
			ps.spawn(_S.P.STAR, (c.x + c.main.lean), ((-c.H) * 0.96), 0, (-4), R.range_value(0.3, 0.5), _C.WHITE, R.range_value(1.4, 2.6), 0.08)
		lights.add(c.x, ((-c.H) * 0.4), (16 + (c.H * 0.6)), C[int(5)], 0.5, 0.18)
		if big:
			lights.add(c.x, ((-c.H) * 0.5), 54, _C.WHITE, 0.5, 0.14)
			if true:
				var i = 0
				while (i < 4):
					ps.spawn(_S.P.VAPOUR, (c.x + R.range_value((-6), 6)), (-R.range_value(0, 4)), R.range_value((-40), 60), (-R.range_value(4, 16)), R.range_value(0.6, 1), C[int(6)], R.range_value(3, 4.5))
					i += 1.0
	if (((_capture_t_24[0] > (START + RUN)) and (_capture_t_24[0] < TREMBLE)) and R.chance(0.09)):
		var c = R.pick(clusters)
		var b = R.pick(c.blades)
		var s = pose(c, b)
		var u = R.range_value(0.3, 0.95)
		ps.spawn(_S.P.STAR, (s.x + ((s.tx - s.x) * u)), (s.ty * u), 0, (-3), R.range_value(0.25, 0.5), (_C.WHITE if R.chance(0.6) else C[int(6)]), R.range_value(0.6, 2))
	if ((not _capture_trembled_26[0]) and (_capture_t_24[0] >= TREMBLE)):
		_capture_trembled_26[0] = true
		for c in clusters:
			if true:
				var i = 0
				while (i < 2):
					bits.add({"kind": _S.B.SHARD, "x": (c.x + R.range_value((-4), 4)), "y": (-R.range_value(4, (c.H * 0.8))), "vx": R.range_value((-20), 20), "vy": (-R.range_value(0, 30)), "g": 0.8, "drag": 0.5, "bounce": 0.3, "life": R.range_value(0.3, 0.6), "a": R.range_value(0, TAU), "va": R.range_value((-18), 18), "s": R.range_value(1, 1.8), "c": C[int(R.int_value(5, 7))]})
					i += 1.0
	if ((not _capture_broke_25[0]) and (_capture_t_24[0] >= SHATTER)):
		_capture_broke_25[0] = true
		for c in clusters:
			for b in c.blades:
				breakBlade(c, b)
			if true:
				var i = 0
				while (i < 2):
					ps.spawn(_S.P.VAPOUR, (c.x + R.range_value((-6), 6)), (-R.range_value(1, 8)), R.range_value((-30), 50), (-R.range_value(4, 18)), R.range_value(0.6, 1.1), C[int(6)], (R.range_value(2.4, 4) * (0.7 + (float(c.H) / 60))))
					i += 1.0
			if R.chance(0.7):
				ps.spawn(_S.P.STAR, (c.x + R.range_value((-6), 6)), (-R.range_value(4, c.H)), R.range_value((-10), 10), (-R.range_value(6, 20)), R.range_value(0.4, 0.8), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(1, 2.2))
			if true:
				var i = 0
				while (i < 2):
					ps.spawn(_S.P.FLAKE, (c.x + R.range_value((-6), 6)), (-R.range_value(4, c.H)), R.range_value((-30), 60), (-R.range_value(30, 90)), R.range_value(0.9, 1.5), (_C.WHITE if R.chance(0.6) else C[int(6)]), R.range_value(0.5, 1.5))
					i += 1.0
			lights.add(c.x, ((-c.H) * 0.5), (22 + c.H), _C.WHITE, 0.45, 0.12)
		if true:
			var i = 0
			while (i < 5):
				lights.add((float((REACH * (i + 0.5))) / 5), (-18), 40, C[int(4)], 0.4, 0.5)
				i += 1.0
	if (((_capture_broke_25[0] and (_capture_t_24[0] < (SHATTER + 0.8))) and R.chance(0.1)) and bits.list.size()):
		var b = R.pick(bits.list)
		ps.spawn(_S.P.STAR, b.x, (b.y - 1), 0, (-3), R.range_value(0.2, 0.4), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.6, 1.5))
	ps.update(dt)
	bits.update(dt)
	panes.update(dt)
	lights.update(dt)
	_I.end_by(_capture_t_24[0], META.duration, [ps, bits, panes])
func draw_back(p, _time_argument: float, _options: Dictionary) -> void:
	drawFrost(p)
	ps.draw(p, "back")
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	drawClusters(p)
	var k = ((1 - _M.smooth(MELT, (MELT + 0.9), _capture_t_24[0])) * _M.smooth(START, (START + 0.3), _capture_t_24[0]))
	var fr = front(_capture_t_24[0])
	if true:
		var i = 0
		while (i < 6):
			p.glow((float((fr * (i + 0.5))) / 6), (-3), 26, C[int(4)], (0.15 * k))
			i += 1.0
	if ((_capture_t_24[0] >= FLASH) and (_capture_t_24[0] < (SHATTER + 0.1))):
		for c in clusters:
			_A.sparkle(p, (c.x + c.main.lean), (-c.H), (6 * (1 - clampf((float((_capture_t_24[0] - FLASH)) / 0.16), 0.0, 1.0))), C[int(6)], C[int(4)], 0.4)
	panes.draw(p, C)
	bits.draw(p)
	ps.draw(p, "front")
	lights.draw(p)
func _weak_callback_0(q, _unused1=null, _unused2=null, _unused3=null):
	splinter(q.x, 0, 0, 3)
	ps.spawn(_S.P.VAPOUR, q.x, (-1), R.range_value((-12), 12), (-R.range_value(2, 8)), R.range_value(0.4, 0.7), C[int(6)], R.range_value(1.4, 2.2))
func _weak_callback_1(q, x, y, v):
	if (v < 110):
		return null
	ps.spawn(_S.P.VAPOUR, x, (y - 1), R.range_value((-20), 20), (-R.range_value(2, 8)), R.range_value(0.4, 0.7), C[int(6)], R.range_value(1.4, 2.4))
	splinter(x, y, q.vx, 3)
	if R.chance(0.3):
		ps.spawn(_S.P.STAR, x, (y - 2), 0, (-5), R.range_value(0.2, 0.4), _C.WHITE, R.range_value(0.8, 1.6))
