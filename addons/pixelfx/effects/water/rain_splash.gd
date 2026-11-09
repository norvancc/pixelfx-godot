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
const _R = preload("../native_bridge.gd")
const _B = preload("b2_elements_common.gd")
## Source: src/fx/water/rain-splash.js
const META = {"id":"pixelfx.rain_splash","name":"Rain splash","desc":"A low close-up on one puddle in the rain: big drops land in crowns that throw beads and a rebound jet, rings spread and interfere, a lamp's reflection wobbles on the water.","tags":["water","rain","splash","puddle","close-up","ambient","loop"],"size":[176,80],"origin":[88,50],"duration":2.4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#0a1630","#123063","#1b5596","#2a7fc4","#45a9e3","#86d3f5","#cdf1ff","#ffffff"],"seed":9},"cacheable":true,"layers":["back","front"]}
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
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-184, -146, 368, 272)
var D = META.duration
var SY = 0.3
var RX = 92
var G = 640
var N = 8
var LAMP = 34
func drops(S):
	return _B.make_array(N, func(_unused, i, _unused2=null, _unused3=null):
		return {"x": ((_M.rand([i, S]) - 0.5) * 120), "z": ((_M.rand([i, (S + 1)]) - 0.5) * 50), "t0": ((float((i + (0.25 * _M.rand([i, (S + 2)])))) / N) * D), "H": (10 + (4 * _M.rand([i, (S + 3)]))), "J": (7 + (4 * _M.rand([i, (S + 4)]))), "spin": (_M.rand([i, (S + 5)]) * TAU), "i": i})
func ageOf(t, t0):
	return fmod((fmod((t - t0), D) + D), D)
func ringR(a):
	return (3 + (34 * pow((float(a) / 1.8), 0.7)))
func ringK(a):
	return (((1.3 * pow((1 - (float(a) / 1.8)), 1.3)) * minf(1, (float(a) / 0.06))) if (a < 1.8) else 0)
func crownH(a, H):
	return ((H * pow(sin((PI * clampf((float(a) / 0.3), 0.0, 1.0))), 0.8)) * (1 if (a < 0.3) else 0))
func crownR(a):
	return (1.5 + (4.5 * sqrt(clampf((float(a) / 0.3), 0.0, 1.0))))
func jetH(a, J):
	return ((J * sin((float((PI * (a - 0.26))) / 0.3))) if ((a > 0.26) and (a < 0.56)) else 0)
func field(x, z, list):
	var h = 0
	for q in list:
		var dx = (x - q.x)
		if ((dx > (q.R + 10)) if (dx > (q.R + 10)) else (dx < ((-q.R) - 10))):
			continue
		var d = (_R.hypot([dx, (z - q.z)]) - q.R)
		var w = (3.6 + (q.a * 3))
		if ((d > (2 * w)) if (d > (2 * w)) else (d < ((-3) * w))):
			continue
		h += ((q.k * cos((d * 1.1))) * exp((-pow((float(d) / w), 2))))
	return h
func draw_back(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var S = o.seed
	var ry = (RX * SY)
	var ph = (float(t) / D)
	var list = _B.map_indexed(_B.map_indexed(drops(S), func(q, _unused1=null, _unused2=null, _unused3=null):
		return _R.merge_dicts([q, {"a": ageOf(t, q.t0)}])).filter(func(q, _unused1=null, _unused2=null, _unused3=null):
		return (q.a < 1.8)), func(q, _unused1=null, _unused2=null, _unused3=null):
		return _R.merge_dicts([q, {"R": ringR(q.a)}, {"k": ringK(q.a)}]))
	if true:
		var Y = floori((-ry))
		while (Y < ry):
			var y = (Y + 0.5)
			var z = (float(y) / SY)
			var act = list.filter(func(q, _unused1=null, _unused2=null, _unused3=null):
				return (absf((z - q.z)) <= (q.R + 12)))
			var far = (float((y + ry)) / (2 * ry))
			var dashW = ((1.5 + (far * 4)) * (0.35 + (0.65 * (0.5 + (0.5 * sin((((Y * 1.73) + ((ph * TAU) * 3)) + (sin((Y * 0.61)) * 3))))))))
			var hPrev = 0
			if true:
				var X = (-88)
				while (X < 88):
					var x = (X + 0.5)
					var d = (pow((float(x) / RX), 2) + pow((float(y) / ry), 2))
					if (d > 1):
						X += 1.0
						continue
					var edge = minf(1, ((1 - d) * 6))
					p.blend(x, y, C[int(0)], ((0.62 + (0.2 * far)) * edge))
					if (far < 0.45):
						p.blend(x, y, C[int(2)], ((0.3 * (1 - (float(far) / 0.45))) * edge))
					var h = (field(x, z, act) if act.size() else 0)
					var hx = (h - hPrev)
					hPrev = h
					if (h > 0.24):
						p.blend(x, y, (C[int(5)] if (h > 0.75) else C[int(4)]), (minf(0.95, ((h - 0.24) * 2.2)) * edge))
					else:
						if (h < (-0.4)):
							p.blend(x, y, C[int(0)], (minf(0.85, (((-h) - 0.4) * 1.8)) * edge))
					if ((x < (LAMP - 14)) if (x < (LAMP - 14)) else (x > (LAMP + 14))):
						X += 1.0
						continue
					var lx = absf((((x - LAMP) - (hx * 9)) - (sin(((y * 0.8) + ((ph * TAU) * 2))) * 1.4)))
					if (lx < dashW):
						var k = ((1 - (float(lx) / dashW)) * edge)
						p.px(X, Y, (_C.WHITE if (k > 0.72) else (C[int(6)] if (k > 0.35) else C[int(5)])))
						p.light(x, y, C[int(5)], (0.2 * k))
					X += 1.0
			Y += 1.0
	if true:
		var X = (-82)
		while (X < 82):
			var x = (X + 0.5)
			var y = ((-sqrt(maxf(0, (1 - pow((float(x) / RX), 2))))) * ry)
			p.px(X, (y + 0.5), (C[int(6)] if (absf((x - LAMP)) < 10) else C[int(3)]))
			X += 1.0
	for q in drops(S):
		crown(p, C, q, ageOf(t, q.t0), true)
func crown(p, C, q, a, back):
	var h = crownH(a, q.H)
	if (h < 1):
		return null
	var r0 = crownR(a)
	var cy = (q.z * SY)
	if true:
		var f = 0
		while (f < 10):
			var ang = (q.spin + ((float(f) / 10) * TAU))
			var s = sin(ang)
			if ((s < 0) != back):
				f += 1.0
				continue
			var tip = (h * (0.75 + (0.25 * _M.rand([q.i, f, 7]))))
			var lean = (0.35 * tip)
			var x0 = (q.x + (cos(ang) * r0))
			var y0 = (cy + ((s * r0) * SY))
			var x1 = (q.x + (cos(ang) * (r0 + lean)))
			var y1 = ((cy + ((s * (r0 + lean)) * SY)) - tip)
			p.line(x0, y0, x1, y1, ((func(u, _unused1=null, _unused2=null, _unused3=null):
				return (C[int(5)] if (u > 0.7) else C[int(3)])) if back else (func(u, _unused1=null, _unused2=null, _unused3=null):
				return (_C.WHITE if (u > 0.75) else (C[int(6)] if (u > 0.35) else C[int(5)])))))
			if ((a > 0.08) and (a < 0.17)):
				p.px(x1, (y1 - 1), (C[int(5)] if back else _C.WHITE))
			f += 1.0
	if (not back):
		p.glow(q.x, (cy - (h * 0.6)), (6 + (h * 0.6)), C[int(5)], (0.3 * (float(h) / q.H)))
func draw(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var S = o.seed
	for q in drops(S):
		var a = ageOf(t, q.t0)
		var cy = (q.z * SY)
		var pre = (D - a)
		if ((pre < 0.14) and (((cy - (pre * 520)) - 10) > (-48))):
			var y = (cy - (pre * 520))
			p.line(q.x, (y - 10), q.x, (y - 4), C[int(4)])
			p.line(q.x, (y - 4), q.x, y, C[int(6)])
		if (a < 0.05):
			p.px(q.x, cy, _C.WHITE)
			p.glow(q.x, (cy - 2), 12, C[int(5)], (0.5 * (1 - (float(a) / 0.05))))
		crown(p, C, q, a, false)
		if ((a > 0.16) and (a < 0.8)):
			if true:
				var f = 0
				while (f < 10):
					var ang = (q.spin + ((float(f) / 10) * TAU))
					var tip = (crownH(0.16, q.H) * (0.75 + (0.25 * _M.rand([q.i, f, 7]))))
					var r0 = (crownR(0.16) + (tip * 0.35))
					var v = (22 + (18 * _M.rand([q.i, f, 8])))
					var vh = (40 + (30 * _M.rand([q.i, f, 9])))
					var tt = (a - 0.16)
					var hh = ((tip + (vh * tt)) - (((0.5 * G) * tt) * tt))
					var bx = (q.x + (cos(ang) * (r0 + (v * tt))))
					var bz = (q.z + (sin(ang) * (r0 + (v * tt))))
					var by = (bz * SY)
					if (hh > 0):
						_W.bead(p, bx, (by - hh), (cos(ang) * v), ((-(vh - (G * tt))) + ((sin(ang) * v) * SY)), (2 if (_M.rand([q.i, f, 10]) < 0.4) else 1), C)
					else:
						var land = (float((vh + sqrt(((vh * vh) + ((2 * G) * tip))))) / G)
						var since = (tt - land)
						if (since < 0.05):
							p.px(bx, by, _C.WHITE)
						if (since < 0.35):
							_W.ring(p, bx, by, (1 + (since * 12)), SY, (1 - (float(since) / 0.35)), C, {"n": 1, "half": 1, "seed": ((q.i * 10) + f)})
					f += 2
		var jh = jetH(a, q.J)
		if (jh > 0.8):
			p.line(q.x, (cy - 1), q.x, (cy - jh), func(u, _unused1=null, _unused2=null, _unused3=null):
				return (_C.WHITE if (u > 0.6) else C[int(6)]))
			p.px((q.x + 1), (cy - 1), C[int(5)])
			if (a < 0.41):
				p.circle(q.x, ((cy - jh) - 0.5), 1.2, C[int(6)])
			p.glow(q.x, (cy - (jh * 0.6)), 6, C[int(5)], 0.3)
		var ba = (a - 0.41)
		var bh = (((q.J + 1) + (24 * ba)) - (((0.5 * G) * ba) * ba))
		if ((ba > 0) and (bh > 0)):
			p.circle(q.x, (cy - bh), 1.1, C[int(6)])
			p.px(q.x, ((cy - bh) - 1), _C.WHITE)
	for q in drops(S):
		var a = ageOf(t, q.t0)
		if (a < 1.8):
			_W.ring(p, q.x, (q.z * SY), ringR(a), SY, (0.75 * ringK(a)), C, {"n": 1, "half": 1, "hot": (a < 0.1), "seed": q.i, "wob": (0.5 + a)})
	_P.cycle(t, D, 16, (S + 20), 0.5, func(age, life, r, _unused3=null):
		var x = r.range_value((-80), 80)
		var z = r.range_value((-26), 26)
		var y = (z * SY)
		var s = (age - 0.1)
		if (s < 0):
			var yy = (y - ((0.1 - age) * 600))
			if ((yy - 6) < (-48)):
				return null
			p.line(x, (yy - 6), x, yy, func(u, _unused1=null, _unused2=null, _unused3=null):
				return (C[int(5)] if (u > 0.6) else C[int(3)]))
		else:
			if ((s < 0.4) and ((pow((float(x) / RX), 2) + pow((float(y) / (RX * SY)), 2)) < 0.9)):
				if (s < 0.04):
					p.px(x, y, C[int(6)])
				_W.ring(p, x, y, (1 + (s * 9)), SY, (0.8 * (1 - (float(s) / 0.4))), C, {"n": 1, "half": 1, "seed": 40}))
	p.glow(LAMP, (-6), 30, C[int(4)], 0.16)
