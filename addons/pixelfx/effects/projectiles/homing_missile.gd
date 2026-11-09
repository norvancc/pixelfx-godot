@tool
extends "../../core/effect.gd"
## Native port of pinned PixelFX 0.3.0 algorithms; MIT (c) Patch / Hugo Duprez.
const _C = preload("../../core/color.gd")
const _M = preload("../../core/math.gd")
const _P = preload("../../core/particles.gd")
const _S = preload("../../core/sim.gd")
const _E = preload("../../core/ease.gd")
const _A = preload("../analytic_helpers.gd")
const _J = preload("projectiles_common.gd")
const _R = preload("../simulation_bridge.gd")
const _B = preload("b2_sim_common.gd")
## Source: src/fx/projectiles/homing-missile.js
const META = {"id":"pixelfx.homing_missile","name":"Homing missile","desc":"A missile kicks off, arcs up, rolls over and dives onto its target (the origin), its smoke trail left hanging in the air, and hits in a fiery blast of flame, sparks and rocks.","tags":["projectile","missile","rocket","homing","smoke","explosion","one-shot"],"size":[248,140],"origin":[160,120],"duration":3.8,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"metal":["#25243a","#3e4058","#61667f","#8e97b0","#c4cce0"],"smoke":["#26222e","#3b3644","#544e5e","#6f6979","#8c8596","#aca5b5","#cbc4d2"],"stone":"#4a3f69","seed":8},"cacheable":false,"layers":["back","front"]}
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
	return Rect2i(-256, -216, 440, 332)
var FLY = 1.15
var PATH = [[(-130), (-22)], [(-114), (-110)], [(-30), (-120)], [0, 0]]
func at(u):
	var v = (1 - u)
	var a = ((v * v) * v)
	var b = (((3 * v) * v) * u)
	var c = (((3 * v) * u) * u)
	var d = ((u * u) * u)
	return [((((a * PATH[int(0)][int(0)]) + (b * PATH[int(1)][int(0)])) + (c * PATH[int(2)][int(0)])) + (d * PATH[int(3)][int(0)])), ((((a * PATH[int(0)][int(1)]) + (b * PATH[int(1)][int(1)])) + (c * PATH[int(2)][int(1)])) + (d * PATH[int(3)][int(1)]))]
func heading(u):
	var v = (1 - u)
	var d = func(i, _unused1=null, _unused2=null, _unused3=null):
		return (((((3 * v) * v) * (PATH[int(1)][int(i)] - PATH[int(0)][int(i)])) + (((6 * v) * u) * (PATH[int(2)][int(i)] - PATH[int(1)][int(i)]))) + (((3 * u) * u) * (PATH[int(3)][int(i)] - PATH[int(2)][int(i)])))
	return atan2(d.call(1), d.call(0))
func progress(t):
	return pow(clampf((float(t) / FLY), 0.0, 1.0), 1.45)
var MISSILE = ["ff..........", ".fhhhhhhhre.", "nmmmmmmmmrrw", ".fsssssssrd.", "ff.........."]
var o = {}
var F
var M
var SM
var R
var st
var stone
var ps
var smoke
var rocks
var lights
var pal
var _capture_t_32
var _capture_emit_33
var _capture_hit_34
func create(options: Dictionary):
	o = options
	F = _C.fit(o.palette, 9)
	M = _C.fit(o.metal, 5)
	SM = _C.fit(o.smoke, 7)
	R = _M.Rng.new(o.seed)
	st = _B.color(o.stone)
	stone = {"light": _C.mix(_C.scale_color(st, 1.35), _C.WHITE, 0.08), "body": st, "shade": _C.scale_color(st, 0.64), "dust": _C.mix(_C.scale_color(st, 1.2), _B.color("#968c96"), 0.3)}
	ps = _S.Particles.new({"rng": R, "ground": _R.weak_callback(self, "floor_y"), "sparks": [F[int(7)], F[int(6)], F[int(4)], F[int(3)]]})
	smoke = _B.Smoke.new(R)
	rocks = _R.Bits.new({"ground": _R.weak_callback(self, "floor_y")})
	lights = _S.Lights.new()
	pal = {"f": M[int(1)], "h": M[int(4)], "m": M[int(3)], "s": M[int(1)], "n": M[int(0)], "r": F[int(2)], "e": F[int(3)], "d": F[int(1)], "w": _C.WHITE}
	_capture_t_32 = [0]
	_capture_emit_33 = [0]
	_capture_hit_34 = [false]
	lights.add(PATH[int(0)][int(0)], PATH[int(0)][int(1)], 30, F[int(4)], 0.7, 0.25)
	if true:
		var i = 0
		while (i < 6):
			smoke.add({"x": (PATH[int(0)][int(0)] + 2), "y": (PATH[int(0)][int(1)] + 2), "vx": R.range_value((-30), 20), "vy": R.range_value((-10), 15), "r0": 2, "r1": R.range_value(5, 7.5), "life": R.range_value(1.2, 1.8), "a": 0.6, "warm": 1, "rise": 8})
			i += 1.0

	return self
func floor_y(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	return 0
func blast(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	var Y = (-6)
	lights.add(0, (Y - 2), 52, _B.color("#ffb060"), 0.8, 0.8)
	lights.add(0, (Y - 2), 30, _C.WHITE, 0.75, 0.1)
	if true:
		var i = 0
		while (i < 26):
			var a = R.range_value(0, TAU)
			var d = R.range_value(0, 6)
			var sp = R.range_value(30, 170)
			ps.spawn(_S.P.FIRE, (cos(a) * d), (Y + (sin(a) * d)), (cos(a) * sp), (((sin(a) * sp) * 0.75) - 40), R.range_value(0.45, 0.95), 0, R.range_value(3.2, 6.5))
			i += 1.0
	if true:
		var i = 0
		while (i < 5):
			ps.spawn(_S.P.FIRE, R.range_value((-3), 3), Y, R.range_value((-10), 10), (-R.range_value(90, 150)), R.range_value(0.7, 1.1), 0, R.range_value(4, 5.5), R.range_value(0, 0.08))
			i += 1.0
	if true:
		var i = 0
		while (i < 70):
			var a = R.range_value((PI + 0.12), (TAU - 0.12))
			var sp = R.range_value(110, 280)
			ps.spawn(_S.P.SPARK, 0, Y, (cos(a) * sp), ((sin(a) * sp) - 40), R.range_value(0.2, 0.65))
			i += 1.0
	if true:
		var i = 0
		while (i < 22):
			var a = R.range_value(PI, TAU)
			var sp = R.range_value(30, 110)
			ps.spawn(_S.P.EMBER, (cos(a) * 4), (Y + (sin(a) * 4)), (cos(a) * sp), ((sin(a) * sp) - 50), R.range_value(0.9, 1.6), F[int(4)])
			i += 1.0
	if true:
		var i = 0
		while (i < 16):
			rocks.add({"kind": _S.B.CHUNK, "x": R.range_value((-5), 5), "y": (-2), "vx": R.range_value((-110), 110), "vy": (-R.range_value(140, 290)), "g": 1, "drag": 0.4, "bounce": 0.3, "life": R.range_value(1.5, 2.2), "a": R.range_value(0, TAU), "va": R.range_value((-16), 16), "s": R.int_value(1, 2)})
			i += 1.0
	if true:
		var i = 0
		while (i < 60):
			var u = R.range_value((-1), 1)
			var a = ((float((-PI)) / 2) + (u * 0.55))
			var sp = (R.range_value(80, 220) * (1 - (0.4 * absf(u))))
			ps.spawn(_S.P.GRIT, (u * 4), (-1), (cos(a) * sp), (sin(a) * sp), R.range_value(1, 1.8), R.pick([stone.light, stone.body, stone.body, stone.shade]), (2 if R.chance(0.4) else 1))
			i += 1.0
	if true:
		var i = 0
		while (i < 18):
			var a = R.range_value((PI * 1.15), (PI * 1.85))
			var sp = R.range_value(20, 90)
			smoke.add({"x": (cos(a) * 4), "y": (Y + (sin(a) * 4)), "vx": ((cos(a) * sp) * 0.7), "vy": ((sin(a) * sp) - (45 * (float(i) / 18))), "r0": 3, "r1": R.range_value(8, 14), "life": R.range_value(1.7, 2.2), "a": 0.62, "b": 0.88, "warm": 1, "rise": (30 + (i * 2)), "drag": 1.8, "delay": R.range_value(0.05, 0.35)})
			i += 1.0
	if true:
		var i = 0
		while (i < 12):
			var s = R.sign_value()
			smoke.add({"x": (s * R.range_value(0, 6)), "y": (-3), "vx": (s * R.range_value(60, 150)), "vy": (-R.range_value(3, 12)), "r0": 2.5, "r1": R.range_value(6, 9), "life": R.range_value(1.1, 1.7), "a": 0.5, "b": 0.75, "warm": 0.3, "rise": 6, "drag": 3})
			i += 1.0
func update(dt: float, _options: Dictionary) -> void:
	_capture_t_32[0] += dt
	if (_capture_t_32[0] < FLY):
		var u = progress(_capture_t_32[0])
		var _tuple1 = at(u)
		var x = _tuple1[0]
		var y = _tuple1[1]
		var h = heading(u)
		var cx = cos(h)
		var cy = sin(h)
		var _tuple2 = at(progress(maxf(0, (_capture_t_32[0] - dt))))
		var px = _tuple2[0]
		var py = _tuple2[1]
		if true:
			_capture_emit_33[0] += (float(_R.hypot([(x - px), (y - py)])) / 1.5)
			while (_capture_emit_33[0] > 1):
				var f = (float((_capture_emit_33[0] - 1)) / maxf(0.000001, (float(_R.hypot([(x - px), (y - py)])) / 1.5)))
				var ex = (x + ((px - x) * f))
				var ey = (y + ((py - y) * f))
				smoke.add({"x": ((ex - (cx * 7)) + R.range_value((-0.6), 0.6)), "y": ((ey - (cy * 7)) + R.range_value((-0.6), 0.6)), "vx": (((-cx) * R.range_value(10, 30)) + R.range_value((-6), 6)), "vy": (((-cy) * R.range_value(10, 30)) + R.range_value((-6), 6)), "r0": 1.4, "r1": R.range_value(3.5, 6), "life": R.range_value(1.5, 2.3), "a": 0.5, "b": 0.9, "warm": 0.8, "rise": 4, "drag": 3, "grow": 1.2})
				_capture_emit_33[0] -= 1.0
		if R.chance(0.35):
			var a = ((h + PI) + R.range_value((-0.5), 0.5))
			var sp = R.range_value(40, 140)
			ps.spawn(_S.P.SPARK, (x - (cx * 7)), (y - (cy * 7)), (cos(a) * sp), (sin(a) * sp), R.range_value(0.15, 0.35))
	else:
		if (not _capture_hit_34[0]):
			_capture_hit_34[0] = true
			blast()
	for b in rocks.list:
		if (b.rest and (not b.get("dusted"))):
			b.dusted = true
			if true:
				var i = 0
				while (i < 2):
					ps.spawn(_S.P.DUST, (b.x + R.range_value((-1), 1)), (-0.5), (R.sign_value() * R.range_value(8, 30)), (-R.range_value(2, 14)), R.range_value(0.3, 0.6), stone.dust, R.range_value(1.2, 2.2))
					i += 1.0
	ps.update(dt)
	smoke.update(dt)
	rocks.update(dt)
	lights.update(dt)
func draw_back(p, _time_argument: float, _options: Dictionary) -> void:
	if _capture_hit_34[0]:
		var k = (_capture_t_32[0] - FLY)
		var fade = (1 - _M.smooth((META.duration - 1), (META.duration - 0.2), _capture_t_32[0]))
		var rx = (16 * minf(1, (float(k) / 0.06)))
		if true:
			var y = 0
			while (y <= 2):
				if true:
					var x = floori((-rx))
					while (x <= ceili(rx)):
						var d = _R.hypot([(float((x + 0.5)) / rx), (float((y + 0.5)) / 4)])
						if (d > 1):
							x += 1.0
							continue
						var T = ((pow(clampf((1 - (float(k) / 1.4)), 0.0, 1.0), 1.4) * (1.25 - d)) - (_M.rand([((x * 31) + y), 3]) * 0.35))
						p.dot(x, y, (F[int(maxf(1, minf(8, _M.js_round((T * 8)))))] if (T > 0.06) else (_B.color("#0d0a12") if (d < 0.5) else _B.color("#17121d"))), fade)
						x += 1.0
				y += 1.0
		var q = (float(k) / 0.45)
		if (q < 1):
			_S.band(p, 0, 0.5, (60 * (1 - pow((1 - q), 3))), 0.16, maxf(1, (4 * (1 - q))), (1.15 - q), [stone.body, stone.light, F[int(4)], F[int(7)]], func(g, _unused1=null, _unused2=null, _unused3=null):
				return (sin(g) < 0))
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	var list = smoke.puffs()
	_J.cloud(p, list, SM, [SM[int(0)], _C.mix(F[int(1)], SM[int(1)], 0.5), _C.mix(F[int(2)], SM[int(2)], 0.4), F[int(3)], F[int(4)], F[int(6)], F[int(7)]], {"dens": 1.4, "max": 0.82, "lit": 1.4})
	if _capture_hit_34[0]:
		var q = (float((_capture_t_32[0] - FLY)) / 0.45)
		if (q < 1):
			_S.band(p, 0, 0.5, (60 * (1 - pow((1 - q), 3))), 0.16, maxf(1, (4 * (1 - q))), (1.15 - q), [stone.body, stone.light, F[int(4)], F[int(7)]], func(g, _unused1=null, _unused2=null, _unused3=null):
				return (sin(g) >= 0))
	for b in rocks.list:
		var r = (0.6 + (b.s * 0.75))
		var fade = minf(1, (float(b.life) / 0.5))
		var lx = ((cos(b.a) * r) * 0.4)
		var ly = ((sin(b.a) * r) * 0.4)
		p.shade(((b.x - r) - 1), ((b.y - r) - 1), ((b.x + r) + 1), ((b.y + r) + 1), func(x, y, out, _unused3=null):
			var dx = (x - b.x)
			var dy = (y - b.y)
			var d = _R.hypot([(dx * 1.15), dy])
			if (d > (r + 0.9)):
				return null
			var lit = ((dx * lx) + (dy * ly))
			out.c = (_B.color("#1a1422") if (d > r) else (stone.light if (lit < (-0.4)) else (stone.shade if (lit > 0.6) else stone.body)))
			out.a = fade)
	ps.draw(p)
	if (_capture_t_32[0] < FLY):
		var u = progress(_capture_t_32[0])
		var _tuple3 = at(u)
		var x = _tuple3[0]
		var y = _tuple3[1]
		var h = heading(u)
		var cx = cos(h)
		var cy = sin(h)
		var fr = floori((_capture_t_32[0] * 30))
		var J = (5 + (3 * _M.rand([fr, 7])))
		if true:
			var d = 0
			while (d <= J):
				var v = (float(d) / J)
				var c = (_C.WHITE if (v < 0.3) else (F[int(6)] if (v < 0.6) else F[int(4)]))
				p.dot((x - (cx * (6.5 + d))), (y - (cy * (6.5 + d))), c)
				if (v < 0.5):
					p.dot(((x - (cx * (6.5 + d))) - (cy * 0.8)), ((y - (cy * (6.5 + d))) + (cx * 0.8)), F[int(5)])
				d += 0.5
		_B.turn_sprite(p, MISSILE, pal, x, y, h, 6, 2.5)
		p.glow((x - (cx * 8)), (y - (cy * 8)), 18, F[int(4)], 0.5)
		p.glow((x - (cx * 7)), (y - (cy * 7)), 6, F[int(7)], 0.5)
	var k = (_capture_t_32[0] - FLY)
	if ((k >= 0) and (k < 0.07)):
		var r = (14 * (0.8 + (0.2 * (1 - (float(k) / 0.07)))))
		p.circle(0, (-6), (r + 1.2), F[int(3)])
		p.circle(0, (-6), r, (F[int(7)] if (k < 0.035) else F[int(6)]))
		p.circle(0, (-6), (r * 0.6), (_C.WHITE if (k < 0.035) else F[int(7)]))
	if ((k >= 0) and (k < 0.3)):
		var rr = (8 + (30 * (1 - pow((1 - (float(k) / 0.3)), 3))))
		p.ring(0, (-6), rr, maxf(1, ((2.5 * (1 - (float(k) / 0.3))) + 0.4)), F[int(5)], func(v, ang, _unused2=null, _unused3=null):
			return (0 if (((-6) + (sin(ang) * rr)) > 0) else minf(1, ((1 - (float(k) / 0.3)) * 1.6))))
	lights.draw(p)
