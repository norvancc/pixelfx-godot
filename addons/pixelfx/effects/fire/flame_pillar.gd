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
## Source: src/fx/fire/flame-pillar.js
const META = {"id":"pixelfx.flame_pillar","name":"Flame pillar","desc":"The floor cracks and glows, a column of fire erupts white-hot and roars, spewing embers and shedding flame, then collapses into rolling smoke.","tags":["fire","pillar","eruption","spell","ground","one-shot"],"size":[184,256],"origin":[92,232],"duration":5,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"stone":"#4a3f69","height":140,"seed":5},"cacheable":false,"layers":["back","front"]}
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
			var limits = {"height":[40,200]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	for field in fields:
		if field.name in ["count","shafts"]: field.type=TYPE_INT; field.default=int(field.default)
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-188, -388, 376, 568)
var ERUPT = 0.55
var RISE = 0.12
var FALL = 1.95
var GONE = 2.45
var SOOT = _B.color("#0d0a12")
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
var HMAX
var st
var R
var ps
var bits
var lights
var GLOW
var S
var cracks
var strands
var _capture_t_41
var _capture_erupted_42
var _capture_fell_43
func create(options: Dictionary):
	o = options
	F = _C.fit(o.palette, 9)
	H = _B.hot_first(F)
	HMAX = o.height
	st = stone(o.stone)
	R = _M.Rng.new(o.seed)
	ps = _S.Particles.new({"rng": R, "ground": _R.weak_callback(self, "floor_y"), "sparks": [H[int(1)], H[int(2)], H[int(4)], H[int(5)]]})
	bits = _R.Bits.new({"ground": _R.weak_callback(self, "floor_y")})
	lights = _S.Lights.new()
	GLOW = _C.mix(_C.mix(H[int(3)], H[int(4)], 0.5), _C.WHITE, 0.25)
	S = (o.seed * 13)
	cracks = []

	if true:
		var i = 0
		while (i < 9):
			var a = (((float(i) / 9) * TAU) + R.range_value((-0.25), 0.25))
			var pts = crack(R.range_value((-1), 1), R.range_value((-0.3), 0.3), a, R.range_value(20, 40), R.range_value(0, 0.16), 1)
			var j = (3 + R.int_value(0, (pts.size() - 6)))
			if (pts.size() > 8):
				crack(pts[int(j)][int(0)], pts[int(j)][int(1)], (a + (R.sign_value() * R.range_value(0.5, 1))), R.range_value(6, 14), (0.18 + R.range_value(0, 0.15)), 0)
			i += 1.0
	strands = _B.make_array(7, func(_unused, i, _unused2=null, _unused3=null):
		return {"o": ((_M.rand([i, S, 1]) - 0.5) * 1.4), "w": (0.05 + (_M.rand([i, S, 2]) * 0.06)), "f": (1 + (_M.rand([i, S, 3]) * 2))})
	_capture_t_41 = [0]
	_capture_erupted_42 = [false]
	_capture_fell_43 = [false]





	return self
func column(p):
	var h = height(_capture_t_41[0])
	var w0 = width(_capture_t_41[0])
	if ((h < 1) if (h < 1) else (w0 < 0.3)):
		return null
	if (_capture_t_41[0] < (FALL + 0.25)):
		var k = clampf((float(w0) / 12), 0.0, 1.0)
		var NZ = func(rate, seed_value, off, _unused3=null):
			return _M.noise(((_capture_t_41[0] * rate) + off), seed_value)
		if true:
			var i = 0
			while (i < 5):
				var n = ((S + i) * 17)
				var dx = (((i - 2) * w0) * 0.4)
				var th = (((12 + (12 * (0.5 + (0.5 * _M.noise(((_capture_t_41[0] * 3.3) + i), n))))) * k) * (1.2 if (i == 2) else (0.6 if (fmod(i, 4) == 0) else 0.9)))
				_F.flame_tongue(p, (dx + (_M.noise((_capture_t_41[0] * 2), (n + 2)) * 1.5)), ((-h) + 12), th, ((3.4 * k) * (0.7 if (fmod(i, 4) == 0) else 1)), (((-dx) * 0.3) + (_M.noise((_capture_t_41[0] * 2.2), (n + 1)) * 3)), NZ, n, H, _F.LAYERS)
				i += 1.0
	var lvlC = [H[int(0)], H[int(1)], H[int(2)], H[int(3)], H[int(4)], H[int(5)], H[int(6)], H[int(7)]]
	if true:
		var y = 0
		while (y >= (-h)):
			var v = (float((-y)) / h)
			var cx = ((_M.noise((((-y) * 0.04) + (_capture_t_41[0] * 1.6)), (S + 2)) * 1.6) * v)
			var foot = (1 + (0.7 * pow(maxf(0, (1 - (float((-y)) / 12))), 2)))
			var top = (1 - (_M.smooth(0.82, 1, v) * 0.7))
			var wl = (((w0 * foot) * top) * (1 + (0.65 * pow(maxf(0, _M.noise(((y * 0.2) + (_capture_t_41[0] * 8)), (S + 3))), 1.5))))
			var wr = (((w0 * foot) * top) * (1 + (0.65 * pow(maxf(0, _M.noise(((y * 0.2) + (_capture_t_41[0] * 8)), (S + 4))), 1.5))))
			var pulse = (1 if (fmod((((-y) * 0.032) + (_capture_t_41[0] * 3.6)), 1) < 0.09) else 0)
			if true:
				var x = floori((cx - (wl * 1.15)))
				while (x <= ceili((cx + (wr * 1.15)))):
					var dx = ((x + 0.5) - cx)
					var q = (float(absf(dx)) / (wl if (dx < 0) else wr))
					if (q > 1.15):
						x += 1.0
						continue
					var lvl = (0 if (q < 0.12) else (1 if (q < 0.26) else (2 if (q < 0.42) else (3 if (q < 0.56) else (4 if (q < 0.7) else (5 if (q < 0.84) else (6 if (q < 0.96) else 7)))))))
					for s in strands:
						if (absf((((float(dx) / w0) - s.o) - (0.06 * sin((((_capture_t_41[0] * s.f) * 3) + (s.o * 9)))))) < s.w):
							lvl = maxf(0, (lvl - 1))
					lvl = maxf(0, (lvl - pulse))
					if ((lvl == 7) and (_M.rand([x, y, floori((_capture_t_41[0] * 20))]) < 0.5)):
						x += 1.0
						continue
					p.px(x, y, lvlC[int(lvl)])
					x += 1.0
			if (fmod(y, 12) == 0):
				p.glow(cx, y, ((w0 * 2.4) + 8), GLOW, (0.28 * clampf((float(w0) / 12), 0.0, 1.0)))
			y -= 1.0
	p.glow(0, ((-h) * 0.45), 92, GLOW, (0.3 * clampf((float(w0) / 12), 0.0, 1.0)))
func cracksDraw(p):
	var k = heat(_capture_t_41[0])
	if (k <= (-0.05)):
		return null
	for c in cracks:
		var n = floori((c.pts.size() * clampf((float((_capture_t_41[0] - c.t0)) / c.grow), 0.0, 1.0)))
		if true:
			var i = 1
			while (i < n):
				var u = (float(i) / c.pts.size())
				var hot = (k * (1 - (0.45 * u)))
				var _tuple1 = c.pts[int((i - 1))]
				var x0 = _tuple1[0]
				var y0 = _tuple1[1]
				var _tuple2 = c.pts[int(i)]
				var x1 = _tuple2[0]
				var y1 = _tuple2[1]
				if (hot < 0):
					var a = (1 + (hot * 3))
					if (a > 0):
						p.line(x0, y0, x1, y1, SOOT, a)
					i += 1.0
					continue
				var col = (H[int(1)] if (hot > 0.85) else (H[int(2)] if (hot > 0.65) else (H[int(4)] if (hot > 0.45) else (H[int(5)] if (hot > 0.25) else (H[int(6)] if (hot > 0.1) else H[int(7)])))))
				if ((c.w and (i < (c.pts.size() * 0.5))) and (hot > 0.2)):
					p.line(x0, (y0 + 1), x1, (y1 + 1), (H[int(5)] if (hot > 0.6) else H[int(6)]))
					p.line(x0, (y0 - 1), x1, (y1 - 1), H[int(7)])
				p.line(x0, y0, x1, y1, col)
				if (fmod(i, 2) == 0):
					p.glow(x1, y1, (5 + (7 * hot)), GLOW, (0.3 * hot))
				i += 1.0
	if (k > 0):
		_F.floor_light(p, 0, 0.5, 44, 8, GLOW, (0.35 * k))
func floor_y(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	return 0
func crack(x, y, a, len, t0, w):
	var pts = [[x, y]]
	if true:
		var d = 0
		while (d < len):
			a += R.range_value((-0.55), 0.55)
			x += (cos(a) * 2)
			y += (sin(a) * 0.76)
			_R.push_items(pts, [[x, y]])
			d += 2
	_R.push_items(cracks, [{"pts": pts, "t0": t0, "grow": R.range_value(0.22, 0.36), "w": w}])
	return pts
func height(tt, _unused1=null, _unused2=null, _unused3=null):
	return (0 if (tt < ERUPT) else ((HMAX * _E.out_cubic((float((tt - ERUPT)) / RISE))) if (tt < (ERUPT + RISE)) else ((HMAX * (1 + (0.05 * _M.noise((tt * 3), S)))) if (tt < FALL) else (HMAX * (1 - _E.in_quad(clampf((float((tt - FALL)) / (GONE - FALL)), 0.0, 1.0)))))))
func width(tt, _unused1=null, _unused2=null, _unused3=null):
	return (0 if (tt < ERUPT) else (((12 * (1 + (0.45 * exp(((-(tt - ERUPT)) * 7))))) * (0.94 + (0.06 * _M.noise((tt * 9), (S + 1))))) if (tt < FALL) else ((12 * (1 - _M.smooth(FALL, GONE, tt))) + (1.5 * (1 - _M.smooth((GONE - 0.1), GONE, tt))))))
func heat(tt, _unused1=null, _unused2=null, _unused3=null):
	return (((_M.smooth(0, ERUPT, tt) * 0.75) + (0.25 * _M.smooth((ERUPT - 0.05), (ERUPT + 0.1), tt))) - (_M.smooth((GONE - 0.3), (META.duration - 0.6), tt) * 1.05))
func update(dt: float, _options: Dictionary) -> void:
	_capture_t_41[0] += dt
	if ((_capture_t_41[0] < ERUPT) and R.chance((((0.6 * dt) * 60) * _M.smooth(0.15, ERUPT, _capture_t_41[0])))):
		ps.spawn(_S.P.FIRE, R.range_value((-5), 5), (-1), R.range_value((-6), 6), (-R.range_value(20, 45)), R.range_value(0.15, 0.3), 0, R.range_value(1, 2.2))
	if ((_capture_t_41[0] < ERUPT) and R.chance((((0.5 * dt) * 60) * _M.smooth(0, ERUPT, _capture_t_41[0])))):
		var c = R.pick(cracks)
		var i = R.int_value(0, (floori((c.pts.size() * clampf((float((_capture_t_41[0] - c.t0)) / c.grow), 0.0, 1.0))) - 1))
		if (i >= 0):
			var _tuple3 = c.pts[int(i)]
			var x = _tuple3[0]
			var y = _tuple3[1]
			if R.chance(0.5):
				ps.spawn(_S.P.FIRE, x, (y - 1), R.range_value((-5), 5), (-R.range_value(15, 35)), R.range_value(0.15, 0.3), 0, R.range_value(0.8, 1.6))
			else:
				ps.spawn(_S.P.EMBER, x, (y - 1), R.range_value((-15), 15), (-R.range_value(30, 70)), R.range_value(0.5, 1), H[int(3)], 1)
	if ((not _capture_erupted_42[0]) and (_capture_t_41[0] >= ERUPT)):
		_capture_erupted_42[0] = true
		lights.add(0, (-40), 90, WARM, 0.7, 0.6)
		lights.add(0, (-8), 44, _C.WHITE, 0.7, 0.1)
		if true:
			var i = 0
			while (i < 70):
				var a = ((float((-PI)) / 2) + R.range_value((-1.1), 1.1))
				var sp = R.range_value(100, 260)
				ps.spawn(_S.P.SPARK, R.range_value((-4), 4), (-2), (cos(a) * sp), (sin(a) * sp), R.range_value(0.25, 0.7))
				i += 1.0
		if true:
			var i = 0
			while (i < 18):
				bits.add({"kind": _S.B.CHUNK, "x": R.range_value((-6), 6), "y": (-2), "vx": R.range_value((-110), 110), "vy": (-R.range_value(150, 330)), "g": 1, "drag": 0.4, "bounce": 0.3, "life": R.range_value(1.6, 2.4), "a": R.range_value(0, TAU), "va": R.range_value((-16), 16), "s": R.int_value(1, 3)})
				i += 1.0
		if true:
			var i = 0
			while (i < 60):
				var a = ((float((-PI)) / 2) + R.range_value((-0.9), 0.9))
				var sp = R.range_value(80, 260)
				ps.spawn(_S.P.GRIT, R.range_value((-5), 5), (-1), (cos(a) * sp), (sin(a) * sp), R.range_value(1, 1.8), R.pick([st.light, st.body, st.body, st.shade]), (2 if R.chance(0.4) else 1))
				i += 1.0
		if true:
			var i = 0
			while (i < 14):
				var s = R.sign_value()
				ps.spawn(_S.P.SMOKE, (s * R.range_value(2, 10)), (-R.range_value(1, 4)), (s * R.range_value(40, 110)), (-R.range_value(2, 10)), R.range_value(1, 1.8), st.dust, R.range_value(4, 7), R.range_value(0, 0.06), _S.PF.BIG)
				i += 1.0
	var h = height(_capture_t_41[0])
	var w = width(_capture_t_41[0])
	if (((_capture_t_41[0] > ERUPT) and (_capture_t_41[0] < GONE)) and (h > 4)):
		if R.chance(((0.9 * dt) * 60)):
			var s = R.sign_value()
			var y = (-R.range_value(4, (h * 0.9)))
			ps.spawn(_S.P.FIRE, ((s * w) * R.range_value(0.7, 1.1)), y, (s * R.range_value(15, 40)), (-R.range_value(30, 70)), R.range_value(0.25, 0.5), 0, R.range_value(1.6, 3.2), 0, (_S.PF.SMOKES if R.chance(0.35) else 0))
		if R.chance(((0.7 * dt) * 60)):
			ps.spawn(_S.P.FIRE, R.range_value((-w), w), ((-h) + R.range_value(0, 6)), R.range_value((-20), 20), (-R.range_value(30, 80)), R.range_value(0.35, 0.7), 0, R.range_value(3, 5.5), 0, (_R.bitwise("|", _S.PF.SMOKES, (_S.PF.BIG if (_capture_t_41[0] < (FALL - 0.3)) else 0)) if R.chance(0.6) else 0))
		if ((_capture_t_41[0] < FALL) and R.chance(((0.5 * dt) * 60))):
			ps.spawn(_S.P.EMBER, (R.range_value((-w), w) * 0.6), ((-h) + 4), R.range_value((-60), 60), (-R.range_value(50, 110)), R.range_value(0.7, 1.3), H[int(3)], (2 if R.chance(0.2) else 1))
	if ((_capture_t_41[0] >= FALL) and (not _capture_fell_43[0])):
		_capture_fell_43[0] = true
	if ((_capture_fell_43[0] and (_capture_t_41[0] < (GONE - 0.1))) and R.chance(((1.6 * dt) * 60))):
		ps.spawn(_S.P.FIRE, R.range_value(((-w) - 2), (w + 2)), ((-h) - R.range_value(0, 8)), R.range_value((-30), 30), (-R.range_value(10, 50)), R.range_value(0.4, 0.75), 0, R.range_value(3.5, 6.5), 0, _S.PF.SMOKES)
	bits.update(dt)
	for b in bits.list:
		if (b.rest and (not b.get("dusted"))):
			b.dusted = true
			if true:
				var i = 0
				while (i < 3):
					ps.spawn(_S.P.DUST, (b.x + R.range_value((-1.5), 1.5)), (-0.5), (R.sign_value() * R.range_value(8, 35)), (-R.range_value(2, 18)), R.range_value(0.3, 0.6), st.dust, R.range_value(1.3, 2.6))
					i += 1.0
	ps.update(dt)
	lights.update(dt)
func draw_back(p, _time_argument: float, _options: Dictionary) -> void:
	cracksDraw(p)
	_B.sim_draw(p, ps, H, "back")
	var k = (float((_capture_t_41[0] - ERUPT)) / 0.45)
	if ((k > 0) and (k < 1)):
		_S.band(p, 0, 0.5, (84 * _E.out_cubic(k)), 0.18, maxf(1, (4 * (1 - k))), (1.15 - k), [st.body, st.light, H[int(4)], H[int(1)]], func(g, _unused1=null, _unused2=null, _unused3=null):
			return (sin(g) < 0))
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	column(p)
	for b in bits.list:
		rock(p, b, st)
	_B.sim_draw(p, ps, H, "front")
	var k = (float((_capture_t_41[0] - ERUPT)) / 0.45)
	if ((k > 0) and (k < 1)):
		_S.band(p, 0, 0.5, (84 * _E.out_cubic(k)), 0.18, maxf(1, (4 * (1 - k))), (1.15 - k), [st.body, st.light, H[int(4)], H[int(1)]], func(g, _unused1=null, _unused2=null, _unused3=null):
			return (sin(g) >= 0), (k < 0.15))
	var f = (float((_capture_t_41[0] - ERUPT)) / 0.08)
	if ((f > 0) and (f < 1)):
		p.ellipse(0, (-2), (16 * (1 - (f * 0.3))), 6, H[int(2)])
		p.ellipse(0, (-3), (11 * (1 - (f * 0.3))), 4, (_C.WHITE if (f < 0.5) else H[int(1)]))
	lights.draw(p)
