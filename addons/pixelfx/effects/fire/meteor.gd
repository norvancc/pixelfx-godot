@tool
extends "../../core/effect.gd"
## Native port of pinned PixelFX 0.3.0 algorithms; MIT (c) Patch / Hugo Duprez.
const _C = preload("../../core/color.gd")
const _M = preload("../../core/math.gd")
const _P = preload("../../core/particles.gd")
const _S = preload("../../core/sim.gd")
const _E = preload("../../core/ease.gd")
const _A = preload("../analytic_helpers.gd")
const _F = preload("../fire_common.gd")
const _R = preload("../simulation_bridge.gd")
const _B = preload("b2_sim_common.gd")
## Source: src/fx/fire/meteor.js
const META = {"id":"pixelfx.meteor","name":"Meteor","desc":"A burning rock streaks in from the upper left in a comet of fire and smashes into the floor: a white flash, a fireball, rocks and brands thrown, a glowing crater that cools.","tags":["fire","meteor","impact","explosion","spell","debris","one-shot"],"size":[272,232],"origin":[150,208],"duration":5,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"stone":"#4a3f69","rock":["#120e16","#2a2230","#463a4a","#6a5a66"],"seed":9},"cacheable":false,"layers":["back","front"]}
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
	return Rect2i(-246, -304, 464, 424)
var HIT = 0.62
var FROM = [(-112), (-142)]
var SOOT = _B.color("#0d0a12")
var SOOT2 = _B.color("#17121d")
var OUTLINE = _B.color("#1a1422")
var WARM = _C.rgb(255, 176, 96)
func stone(c):
	c = _B.color(c)
	return {"light": _C.mix(_C.scale_color(c, 1.35), _C.WHITE, 0.08), "body": c, "shade": _C.scale_color(c, 0.64), "dust": _C.mix(_C.scale_color(c, 1.2), _C.rgb(150, 140, 150), 0.3)}
func rock(p, b, st):
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
		out.c = (OUTLINE if (d > r) else (st.light if (lit < (-0.4)) else (st.shade if (lit > 0.6) else st.body)))
		out.a = fade)
var o = {}
var F
var H
var RK
var st
var R
var S
var blazes
var ps
var bits
var lights
var GLOW
var len
var ux
var uy
var _capture_t_42
var _capture_hit_43
var _capture_last_44
func create(options: Dictionary):
	o = options
	F = _C.fit(o.palette, 9)
	H = _B.hot_first(F)
	RK = _C.fit(o.rock, 4)
	st = stone(o.stone)
	R = _M.Rng.new(o.seed)
	S = (o.seed * 11)
	blazes = null
	ps = _S.Particles.new({"rng": R, "ground": _R.weak_callback(self, "floor_y"), "sparks": [H[int(1)], H[int(2)], H[int(4)], H[int(5)]], "on_land": _R.weak_callback(self, "_weak_callback_0")})
	blazes = _S.Blazes.new(ps)
	bits = _R.Bits.new({"ground": _R.weak_callback(self, "floor_y")})
	lights = _S.Lights.new()
	GLOW = _C.mix(_C.mix(H[int(3)], H[int(4)], 0.5), _C.WHITE, 0.25)
	len = _R.hypot([FROM[int(0)], FROM[int(1)]])
	ux = (float((-FROM[int(0)])) / len)
	uy = (float((-FROM[int(1)])) / len)

	_capture_t_42 = [0]
	_capture_hit_43 = [false]
	_capture_last_44 = [pos(0)]


	return self
func floor_y(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	return 0
func pos(tt, _unused1=null, _unused2=null, _unused3=null):
	var k = ((_E.in_quad(clampf((float(tt) / HIT), 0.0, 1.0)) * 0.35) + (clampf((float(tt) / HIT), 0.0, 1.0) * 0.65))
	return [(FROM[int(0)] * (1 - k)), (FROM[int(1)] * (1 - k))]
func meteor(p, x, y, R0, cool, alpha=1):
	p.shade(((x - R0) - 2), ((y - R0) - 2), ((x + R0) + 2), ((y + R0) + 2), func(px, py, out, _unused3=null):
		out.a = alpha
		var dx = (px - x)
		var dy = (py - y)
		var d = _R.hypot([dx, dy])
		var a = atan2(dy, dx)
		var rr = (R0 * ((1 + (0.18 * _M.noise(((a * 2.2) + 3), S))) + (0.1 * _M.noise((a * 5), (S + 1)))))
		if (d > (rr + 1)):
			return null
		if (d > rr):
			return OUTLINE
		var face = (float(((dx * ux) + (dy * uy))) / maxf(1, d))
		var heat = ((1 - cool) * (((face * 0.6) + 0.5) - ((float(d) / rr) * 0.25)))
		if (heat > 0.62):
			return (H[int(0)] if (heat > 0.85) else (H[int(1)] if (heat > 0.74) else H[int(2)]))
		if (heat > 0.42):
			return H[int(4)]
		var h = _M.rand([floori((px - x)), floori((py - y)), (S + 3)])
		if (h < (0.22 * (1 - (cool * 0.7)))):
			return (H[int(4)] if ((1 - cool) > 0.5) else H[int(6)])
		return (RK[int(2)] if (((dx * (-0.6)) + (dy * (-0.8))) > 0) else (RK[int(0)] if ((float(d) / rr) > 0.6) else RK[int(1)])))
func crater(p, _unused1=null, _unused2=null, _unused3=null):
	if (_capture_t_42[0] < HIT):
		return null
	var a = (_capture_t_42[0] - HIT)
	var end = (1 - _M.smooth((META.duration - 1), (META.duration - 0.15), _capture_t_42[0]))
	var rx = (36 * minf(1, (float(a) / 0.08)))
	var ry = 6
	if true:
		var y = (-1)
		while (y <= 3):
			if true:
				var x = floori((-rx))
				while (x <= ceili(rx)):
					var dx = (float((x + 0.5)) / rx)
					var dy = (float((y + 0.5)) / ry)
					var d = sqrt(((dx * dx) + (dy * dy)))
					if (d > 1):
						x += 1.0
						continue
					var k = _M.rand([((x * 31) + y), (S + 5)])
					var T = ((pow(clampf((1 - (float(a) / 2.6)), 0.0, 1.0), 1.3) * (1.25 - d)) - (k * 0.35))
					if (T > 0.06):
						var ramp = [H[int(0)], H[int(1)], H[int(2)], H[int(3)], H[int(4)], H[int(5)], H[int(6)], H[int(7)], H[int(8)]]
						var c = ramp[int(minf(8, floori(((1 - minf(1, T)) * 8))))]
						p.dot(x, y, c, end)
						if (_R.bitwise("&", x, 3) == 0):
							p.glow((x + 0.5), y, 7, c, ((0.2 * T) * end))
					else:
						p.dot(x, y, (SOOT if (d < 0.55) else SOOT2), ((1 if (d < (0.95 - (k * 0.3))) else (1 - d)) * end))
					x += 1.0
			y += 1.0
	if true:
		var x = (-40)
		while (x <= 40):
			var e = (float(absf(x)) / 40)
			var hh = (0 if (e < 0.7) else _M.js_round(((2.4 * sin(((float((e - 0.7)) / 0.3) * PI))) * (0.6 + (0.4 * _M.rand([x, (S + 7)]))))))
			if true:
				var j = 0
				while (j < hh):
					p.dot(x, ((-1) - j), (_C.mix(st.light, H[int(4)], (0.5 * clampf((1 - (float(a) / 2)), 0.0, 1.0))) if (j == (hh - 1)) else st.shade), end)
					j += 1.0
			if hh:
				p.dot(x, 0, OUTLINE, end)
			x += 1.0
func update(dt: float, _options: Dictionary) -> void:
	_capture_t_42[0] += dt
	if (_capture_t_42[0] < HIT):
		var _tuple1 = pos(_capture_t_42[0])
		var x = _tuple1[0]
		var y = _tuple1[1]
		var vx = (float((x - _capture_last_44[0][int(0)])) / dt)
		var vy = (float((y - _capture_last_44[0][int(1)])) / dt)
		_capture_last_44[0] = [x, y]
		if true:
			var i = 0
			while (i < 3):
				if (not R.chance(((0.8 * dt) * 60))):
					i += 1.0
					continue
				ps.spawn(_S.P.FIRE, ((x - (ux * R.range_value(2, 8))) + R.range_value((-3), 3)), ((y - (uy * R.range_value(2, 8))) + R.range_value((-3), 3)), ((vx * 0.15) + R.range_value((-20), 20)), ((vy * 0.15) + R.range_value((-30), 10)), R.range_value(0.3, 0.6), 0, R.range_value(3, 6), 0, (_R.bitwise("|", _S.PF.SMOKES, _S.PF.BIG) if R.chance(0.65) else 0))
				i += 1.0
		if R.chance(((0.6 * dt) * 60)):
			ps.spawn(_S.P.SPARK, x, y, ((vx * 0.35) + R.range_value((-80), 80)), ((vy * 0.35) + R.range_value((-80), 40)), R.range_value(0.2, 0.5))
		if R.chance(((0.3 * dt) * 60)):
			ps.spawn(_S.P.EMBER, x, y, ((vx * 0.1) + R.range_value((-30), 30)), ((vy * 0.1) + R.range_value((-40), 0)), R.range_value(0.8, 1.6), H[int(3)], (2 if R.chance(0.2) else 1))
	else:
		if (not _capture_hit_43[0]):
			_capture_hit_43[0] = true
			lights.add(0, (-40), 100, WARM, 0.95, 0.9)
			lights.add(0, (-20), 46, _C.WHITE, 0.9, 0.12)
			if true:
				var i = 0
				while (i < 34):
					var a = (((float((-PI)) / 2) + R.range_value((-1.3), 1.3)) + 0.25)
					var sp = R.range_value(50, 210)
					ps.spawn(_S.P.FIRE, R.range_value((-6), 6), (-R.range_value(2, 10)), (cos(a) * sp), (((sin(a) * sp) * 0.75) - 30), R.range_value(0.5, 1.1), 0, R.range_value(5, 9), 0, (_R.bitwise("|", _S.PF.SMOKES, _S.PF.BIG) if R.chance(0.5) else 0))
					i += 1.0
			if true:
				var i = 0
				while (i < 9):
					ps.spawn(_S.P.FIRE, R.range_value((-6), 6), (-6), R.range_value((-14), 14), (-R.range_value(130, 220)), R.range_value(0.8, 1.2), 0, R.range_value(6, 8.5), R.range_value(0, 0.12), _R.bitwise("|", _S.PF.SMOKES, _S.PF.BIG))
					i += 1.0
			if true:
				var i = 0
				while (i < 20):
					var a = R.range_value((-PI), 0)
					var d = R.range_value(4, 18)
					ps.spawn(_S.P.SMOKE, (cos(a) * d), (-R.range_value(6, 24)), (cos(a) * R.range_value(10, 40)), (-R.range_value(30, 110)), R.range_value(1.8, 2.8), 0, R.range_value(8, 12), R.range_value(0.15, 0.5), _S.PF.BIG)
					i += 1.0
			if true:
				var i = 0
				while (i < 16):
					var s = R.sign_value()
					ps.spawn(_S.P.SMOKE, (s * R.range_value(4, 18)), (-R.range_value(1, 5)), ((s * R.range_value(60, 130)) + 10), (-R.range_value(2, 12)), R.range_value(1.2, 2), st.dust, R.range_value(5, 8), R.range_value(0, 0.06), _S.PF.BIG)
					i += 1.0
			if true:
				var i = 0
				while (i < 90):
					var a = (((float((-PI)) / 2) + R.range_value((-1.3), 1.3)) + 0.15)
					var sp = R.range_value(100, 300)
					ps.spawn(_S.P.SPARK, 0, (-4), (cos(a) * sp), (sin(a) * sp), R.range_value(0.2, 0.7))
					i += 1.0
			if true:
				var i = 0
				while (i < 36):
					var a = R.range_value(0, TAU)
					var sp = R.range_value(40, 150)
					ps.spawn(_S.P.EMBER, (cos(a) * 8), ((-8) + (sin(a) * 6)), (cos(a) * sp), ((sin(a) * sp) - 70), R.range_value(1.2, 2.6), H[int(3)])
					i += 1.0
			if true:
				var i = 0
				while (i < 10):
					var a = ((float((-PI)) / 2) + R.range_value((-1), 1.05))
					var sp = R.range_value(130, 240)
					ps.spawn(_S.P.BRAND, 0, (-6), (cos(a) * sp), (sin(a) * sp), R.range_value(0.7, 1.3))
					i += 1.0
			if true:
				var i = 0
				while (i < 28):
					bits.add({"kind": _S.B.CHUNK, "x": R.range_value((-8), 8), "y": (-3), "vx": R.range_value((-80), 110), "vy": (-R.range_value(140, 340)), "g": 1, "drag": 0.4, "bounce": 0.3, "life": R.range_value(1.8, 2.8), "a": R.range_value(0, TAU), "va": R.range_value((-16), 16), "s": R.int_value(1, 3), "ramp": [OUTLINE, st.shade, st.body, st.light, _C.mix(st.light, _C.WHITE, 0.3)]})
					i += 1.0
			if true:
				var i = 0
				while (i < 80):
					var u = R.range_value((-1), 1)
					var a = (((float((-PI)) / 2) + (u * 0.7)) + 0.15)
					var sp = (R.range_value(90, 270) * (1 - (0.4 * absf(u))))
					ps.spawn(_S.P.GRIT, (u * 6), (-1), (cos(a) * sp), (sin(a) * sp), R.range_value(1.2, 2.2), R.pick([st.light, st.body, st.body, st.shade]), (2 if R.chance(0.45) else 1))
					i += 1.0
	bits.update(dt)
	for b in bits.list:
		if (b.rest and (not b.get("dusted"))):
			b.dusted = true
			if true:
				var i = 0
				while (i < 3):
					ps.spawn(_S.P.DUST, (b.x + R.range_value((-1.5), 1.5)), (-0.5), (R.sign_value() * R.range_value(8, 35)), (-R.range_value(2, 18)), R.range_value(0.3, 0.6), st.dust, R.range_value(1.3, 2.6))
					i += 1.0
	blazes.update(dt)
	ps.update(dt)
	lights.update(dt)
func draw_back(p, _time_argument: float, _options: Dictionary) -> void:
	crater(p)
	_B.sim_draw(p, ps, H, "back")
	blazes.draw_back(p)
	var k = (float((_capture_t_42[0] - HIT)) / 0.5)
	if ((k > 0) and (k < 1)):
		_S.band(p, 0, 0.5, (110 * _E.out_cubic(k)), 0.16, maxf(1, (5 * (1 - k))), (1.15 - k), [st.body, st.light, H[int(4)], H[int(1)]], func(g, _unused1=null, _unused2=null, _unused3=null):
			return (sin(g) < 0))
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	var k = (float((_capture_t_42[0] - HIT)) / 0.5)
	if ((k > 0) and (k < 1)):
		_S.band(p, 0, 0.5, (110 * _E.out_cubic(k)), 0.16, maxf(1, (5 * (1 - k))), (1.15 - k), [st.body, st.light, H[int(4)], H[int(1)]], func(g, _unused1=null, _unused2=null, _unused3=null):
			return (sin(g) >= 0), (k < 0.12))
	for b in bits.list:
		rock(p, b, st)
	if (_capture_t_42[0] < HIT):
		var _tuple2 = pos(_capture_t_42[0])
		var x = _tuple2[0]
		var y = _tuple2[1]
		var NZ = func(rate, seed_value=0, off=0, _unused3=null):
			return _M.noise(((_capture_t_42[0] * rate) + off), seed_value)
		_F.floor_light(p, 0, 0.5, (30 + (40 * (float(_capture_t_42[0]) / HIT))), 7, GLOW, (0.5 * pow((float(_capture_t_42[0]) / HIT), 2)))
		_B.each_indexed([[36, 7, 0], [26, 7.5, (-2.5)], [26, 7.5, 2.5], [16, 8, 0]], func(_arg0, i, _unused2=null, _unused3=null):
			var L = _B.at(_arg0, 0)
			var w = _B.at(_arg0, 1)
			var off = _B.at(_arg0, 2)
			var n = ((S + i) * 13)
			_F.flame_blade(p, (x - (uy * off)), (y + (ux * off)), (-ux), (-uy), (L * (0.85 + (0.25 * NZ.call(5, n)))), w, (NZ.call(3, (n + 3)) * 3), NZ, n, H, _F.LAYERS, 0.5, 1.6))
		meteor(p, x, y, 6.5, 0)
		p.glow(x, y, 46, GLOW, 0.55)
		p.glow(x, y, 12, H[int(1)], 0.4)
	else:
		var a = (_capture_t_42[0] - HIT)
		var cool = clampf((float(a) / 2.8), 0.0, 1.0)
		var end = (1 - _M.smooth((META.duration - 1.1), (META.duration - 0.2), _capture_t_42[0]))
		if (end > 0):
			meteor(p, 0, 0, 5.5, cool, end)
			p.glow(0, (-2), 22, GLOW, ((0.4 * (1 - cool)) * end))
	_B.sim_draw(p, ps, H, "front")
	var f = (float((_capture_t_42[0] - HIT)) / 0.08)
	if ((f > 0) and (f < 1)):
		p.circle(0, (-6), ((11 * (1 - (f * 0.3))) + 1.5), H[int(3)])
		p.circle(0, (-6), (11 * (1 - (f * 0.3))), (H[int(1)] if (f < 0.5) else H[int(2)]))
		p.circle(0, (-6), (7 * (1 - (f * 0.3))), (_C.WHITE if (f < 0.5) else H[int(1)]))
	var fr = (float((_capture_t_42[0] - HIT)) / 0.24)
	if ((fr > 0) and (fr < 1)):
		_S.flare(p, 0, (-6), (44 * pow((1 - fr), 1.4)), (1 - fr), [H[int(6)], H[int(4)], H[int(2)], H[int(1)]])
	lights.draw(p)
func _weak_callback_0(x, y, _unused2=null, _unused3=null):
	return blazes.add(x, (y - 0.25), R.range_value(0.9, 1.6), R.range_value(0.5, 0.85))
