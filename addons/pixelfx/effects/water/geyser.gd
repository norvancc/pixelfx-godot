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
## Source: src/fx/water/geyser.js
const META = {"id":"pixelfx.geyser","name":"Geyser","desc":"A pool heaves and burbles faster and faster, then blasts a white column of water skyward with a churning foam head; it rains back down in drops and steam, slumps and sputters out.","tags":["water","geyser","eruption","steam","column","nature","one-shot"],"size":[184,168],"origin":[92,146],"duration":5,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#0a1630","#123063","#1b5596","#2a7fc4","#45a9e3","#86d3f5","#cdf1ff","#ffffff"],"height":100,"seed":4},"cacheable":false,"layers":["back","front"]}
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
	return Rect2i(-188, -342, 376, 560)
var SY = 0.22
var G = 820
var ERUPT = 1.15
var FALL = 2.6
var GONE = 3.3
var SPURTS = [[0.46, 7], [0.72, 12], [0.92, 9], [1.04, 15], [(GONE + 0.15), 15], [(GONE + 0.55), 8]]
var o = {}
var C
var R
var HMAX
var S
var ps
var mist
var lights
var rings
var plinks
var pops
var V0
var _capture_t_20
var drops
var done
func create(options: Dictionary):
	o = options
	C = _C.fit(o.palette, 8)
	R = _M.Rng.new(o.seed)
	HMAX = o.height
	S = o.seed
	ps = _S.Particles.new({"rng": R})
	mist = _W.Mist.new()
	lights = _S.Lights.new()
	rings = _W.Ripples.new({"sy": SY})
	plinks = []
	pops = []
	V0 = sqrt(((2 * G) * HMAX))
	_capture_t_20 = [0]


	drops = _W.Drops.new({"sy": SY, "g": G, "on_land": _R.weak_callback(self, "_weak_callback_0")})



	done = _R.NativeSet.new()



	return self
func column(p, H, thin):
	if (H < 1):
		return null
	var tau = func(h, _unused1=null, _unused2=null, _unused3=null):
		return (float((V0 - sqrt(maxf(0, ((V0 * V0) - ((2 * G) * minf(h, (HMAX * 0.96)))))))) / G)
	p.shade((-22), ((-H) - 2), 22, 0, func(x, y, out, _unused3=null):
		var h = (-y)
		var v = (float(h) / H)
		var sway = ((_M.noise(((_capture_t_20[0] * 1.6) + (h * 0.025)), (S + 5)) * 2.5) * v)
		var rag = (_M.noise2(((h * 0.2) - (_capture_t_20[0] * 11)), (3 if (x < sway) else 7), (S + 6)) * (0.5 + (1.8 * v)))
		var w = (((3.6 + (7.5 * pow(v, 1.8))) * thin) + rag)
		var q = (float((x - sway)) / maxf(1, w))
		var aq = absf(q)
		if (aq > 1):
			return null
		var X = floori(x)
		var streak = _M.noise2(((X * 1.618) + 0.3), ((tau.call(h) - _capture_t_20[0]) * 14), S)
		var body = _M.noise2((floori((float((x + 40)) / 2)) * 2.3), ((tau.call(h) - _capture_t_20[0]) * 5), (S + 1))
		var lvl = (0 if (aq < 0.42) else (1 if (aq < 0.7) else (2 if (aq < 0.9) else 3)))
		if (q > 0.38):
			lvl += 1.0
		if (streak > 0.28):
			lvl -= 1.0
		if (body < (-0.4)):
			lvl += 1.0
		out.c = [_C.WHITE, C[int(6)], C[int(5)], C[int(4)], C[int(3)]][int(clampf(lvl, 0, 4))])
	p.glow_line(0, 0, 0, (-H), (16 + (8 * thin)), C[int(5)], (0.12 * thin))
func foamHead(p, H, k, back):
	if ((k <= 0.01) if (k <= 0.01) else (H < 4)):
		return null
	if back:
		if true:
			var i = 0
			while (i < 16):
				var side = (1 if fmod(i, 2) else (-1))
				var x0 = ((side * (5 + (9 * _M.rand([i, (S + 20)])))) * k)
				var len = ((14 + (26 * _M.rand([i, (S + 21)]))) * k)
				var speed = (70 + (50 * _M.rand([i, (S + 22)])))
				if true:
					var j = 0
					while (j < 3):
						var f = fmod((((float((_capture_t_20[0] * speed)) / len) + (float(j) / 3)) + _M.rand([i, (S + 23)])), 1)
						var y0 = (((-H) + 2) + (f * len))
						var x = (x0 + (((side * f) * f) * 6))
						var L = (1 + (((4 * f) * (1 - f)) * 2))
						if (f < 0.85):
							p.line(x, y0, (x + (side * 0.6)), (y0 + L), (C[int(6)] if (f < 0.4) else (C[int(5)] if (f < 0.7) else C[int(4)])))
						j += 1.0
				i += 1.0
	if true:
		var i = 0
		while (i < 12):
			var a = (((float(i) / 12) * TAU) + (_capture_t_20[0] * (1.3 if fmod(i, 2) else (-1.1))))
			var z = sin(a)
			if ((z < 0) != back):
				i += 1.0
				continue
			var rho = ((3 + (7 * _M.rand([i, S]))) * k)
			var x = (((cos(a) * rho) * 1.25) + (_M.noise(((_capture_t_20[0] * 3) + i), (S + 8)) * 2.5))
			var y = (((((-H) + ((z * rho) * 0.45)) + ((float(rho) / 10) * 4)) - (4 * (1 - (float(rho) / (10 * k))))) + (_M.noise((((_capture_t_20[0] * 3) + i) + 50), (S + 9)) * 2.5))
			var r = (((2 + (2.6 * _M.rand([i, (S + 2)]))) + (0.7 * sin(((_capture_t_20[0] * 7) + i)))) * k)
			if back:
				_B.billow(p, x, y, r, [C[int(0)], C[int(1)], C[int(2)], C[int(3)], C[int(3)], C[int(4)], C[int(5)], C[int(5)]])
			else:
				p.circle((x + (r * 0.15)), (y + (r * 0.25)), r, C[int(4)])
				p.circle(x, y, (r * 0.82), (C[int(5)] if (rho > (6 * k)) else C[int(6)]))
				p.circle((x - (r * 0.25)), (y - (r * 0.3)), (r * 0.5), _C.WHITE)
			i += 1.0
	if (not back):
		p.glow(0, ((-H) - 2), 38, C[int(5)], (0.34 * k))
func poolR(tt, _unused1=null, _unused2=null, _unused3=null):
	return (((12 + (7 * _M.smooth(0, 1, tt))) + (15 * _E.out_cubic(clampf((float((tt - ERUPT)) / 1.2), 0.0, 1.0)))) * (1 - (0.25 * _M.smooth(GONE, 4.6, tt))))
func poolK(tt, _unused1=null, _unused2=null, _unused3=null):
	return (_M.smooth(0, 0.2, tt) * (1 - _M.smooth(4, 4.85, tt)))
func top(tt, _unused1=null, _unused2=null, _unused3=null):
	if ((tt < ERUPT) if (tt < ERUPT) else (tt > GONE)):
		return 0
	return (((HMAX * _E.out_cubic(clampf((float((tt - ERUPT)) / 0.3), 0.0, 1.0))) * (0.93 + (0.07 * _M.noise((tt * 2.2), S)))) * (1 - _E.in_quad(clampf((float((tt - FALL)) / (GONE - FALL)), 0.0, 1.0))))
func head(tt, _unused1=null, _unused2=null, _unused3=null):
	return (_M.smooth((ERUPT + 0.08), (ERUPT + 0.3), tt) * (1 - _M.smooth((FALL + 0.1), (FALL + 0.45), tt)))
func spurt(tt, _unused1=null, _unused2=null, _unused3=null):
	var h = 0
	for _tuple1 in SPURTS:
		var s0 = _tuple1[0]
		var hs = _tuple1[1]
		h = maxf(h, (hs * sin((PI * clampf((float((tt - s0)) / 0.2), 0.0, 1.0)))))
	return h
func once(key, at, _unused2=null, _unused3=null):
	return (((not done.has(key)) and (_capture_t_20[0] >= at)) and done.add(key))
func emit(rate, dt, _unused2=null, _unused3=null):
	return R.chance(minf(1, (rate * dt)))
func update(dt: float, _options: Dictionary) -> void:
	_capture_t_20[0] += dt
	var H = top(_capture_t_20[0])
	var hk = head(_capture_t_20[0])
	var k = (float(_capture_t_20[0]) / ERUPT)
	if ((_capture_t_20[0] < ERUPT) and emit((1.5 + ((9 * k) * k)), dt)):
		var a = R.range_value(0, TAU)
		var r = R.range_value(0, 7)
		var x = (cos(a) * r)
		var z = (sin(a) * r)
		_R.push_items(pops, [{"x": x, "y": ((z * SY) - R.range_value(1, 3)), "age": 0, "r": R.range_value(1, 2)}])
		rings.add(x, z, 1, R.range_value(5, 9), 0.55, {"n": 1, "k": 0.85})
		if true:
			var i = 0
			while (i < R.int_value(1, 3)):
				drops.add({"x": x, "z": z, "h": 2, "vx": R.range_value((-25), 25), "vz": R.range_value((-15), 15), "vh": R.range_value(50, 120), "s": 1, "small": true, "life": 1})
				i += 1.0
	if ((_capture_t_20[0] < ERUPT) and emit((3 + (7 * k)), dt)):
		mist.add(R.range_value((-8), 8), (-R.range_value(1, 5)), R.range_value((-10), 10), (-R.range_value(6, 18)), 2, R.range_value(5, 9), R.range_value(0.9, 1.5), C[int(6)], 0.22)
	for _tuple2 in SPURTS:
		var s0 = _tuple2[0]
		var hs = _tuple2[1]
		if once((str("spurt") + str(s0)), (s0 + 0.08)):
			if true:
				var i = 0
				while (i < (3 + _M.js_round((float(hs) / 4)))):
					var a = R.range_value(0, TAU)
					var v = R.range_value(10, 40)
					drops.add({"x": 0, "z": 0, "h": (hs * 0.8), "vx": (cos(a) * v), "vz": (sin(a) * v), "vh": R.range_value(20, 90), "s": (2 if R.chance(0.3) else 1)})
					i += 1.0
	if once("erupt", ERUPT):
		lights.add(0, (-26), 64, C[int(5)], 0.85, 0.6)
		lights.add(0, (-4), 28, _C.WHITE, 0.75, 0.1)
		rings.add(0, 0, 6, 40, 1.2, {"n": 2, "gap": 3, "k": 1.2, "hot": 0.12, "glint": 1})
		if true:
			var i = 0
			while (i < 44):
				var a = R.range_value(0, TAU)
				var v = R.range_value(30, 120)
				drops.add({"x": (cos(a) * 3), "z": (sin(a) * 3), "h": R.range_value(2, 10), "vx": (cos(a) * v), "vz": (sin(a) * v), "vh": R.range_value(180, 400), "s": (3 if R.chance(0.15) else (2 if R.chance(0.35) else 1)), "delay": R.range_value(0, 0.12)})
				i += 1.0
		if true:
			var i = 0
			while (i < 12):
				var s = (1 if fmod(i, 2) else (-1))
				mist.add((s * R.range_value(3, 9)), (-R.range_value(1, 6)), (s * R.range_value(30, 80)), (-R.range_value(4, 18)), 3, R.range_value(9, 14), R.range_value(1.2, 1.9), (C[int(6)] if R.chance(0.5) else _C.WHITE), 0.3, R.range_value(0, 0.15))
				i += 1.0
		if true:
			var i = 0
			while (i < 14):
				ps.spawn(_S.P.STAR, R.range_value((-16), 16), (-R.range_value(8, 80)), R.range_value((-10), 10), (-6), R.range_value(0.3, 0.7), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(1, 2.6), R.range_value(0.05, 0.5))
				i += 1.0
	if (hk > 0):
		if emit((60 * hk), dt):
			var a = R.range_value(0, TAU)
			var v = R.range_value(10, 60)
			drops.add({"x": R.range_value((-9), 9), "z": R.range_value((-4), 4), "h": (H + R.range_value((-8), 3)), "vx": (cos(a) * v), "vz": (sin(a) * v), "vh": R.range_value((-40), 60), "s": (3 if R.chance(0.08) else (2 if R.chance(0.3) else 1))})
		if emit((9 * hk), dt):
			mist.add(R.range_value((-8), 8), ((-H) + R.range_value((-6), 2)), R.range_value((-34), 34), (-R.range_value(14, 34)), 3, R.range_value(8, 13), R.range_value(0.9, 1.4), (C[int(6)] if R.chance(0.6) else _C.WHITE), 0.2)
		if emit((5 * hk), dt):
			mist.add((R.sign_value() * R.range_value(3, 9)), (-R.range_value(1, 6)), (R.sign_value() * R.range_value(20, 50)), (-R.range_value(2, 10)), 3, R.range_value(8, 12), R.range_value(1, 1.6), C[int(6)], 0.22)
		if emit((40 * hk), dt):
			var s = R.sign_value()
			var hh = R.range_value(8, (H * 0.95))
			ps.spawn(_S.P.FLAKE, (s * (3 + (6 * pow((float(hh) / H), 1.8)))), (-hh), (s * R.range_value(10, 45)), R.range_value((-20), 10), R.range_value(0.6, 1.2), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.6, 1.3))
		if emit((4 * hk), dt):
			rings.add(R.range_value((-2), 2), R.range_value((-2), 2), 4, (poolR(_capture_t_20[0]) * R.range_value(0.7, 1)), 0.9, {"n": 1, "k": 0.8})
		if emit((7 * hk), dt):
			ps.spawn(_S.P.STAR, R.range_value((-14), 14), (-R.range_value(10, (H + 8))), R.range_value((-6), 6), (-4), R.range_value(0.25, 0.55), (_C.WHITE if R.chance(0.4) else C[int(6)]), R.range_value(0.8, 2.2), 0)
	if once("collapse", (FALL + 0.12)):
		if true:
			var i = 0
			while (i < 40):
				var a = R.range_value(0, TAU)
				var v = R.range_value(15, 80)
				drops.add({"x": R.range_value((-6), 6), "z": R.range_value((-3), 3), "h": (top(_capture_t_20[0]) + R.range_value((-8), 4)), "vx": (cos(a) * v), "vz": (sin(a) * v), "vh": R.range_value((-40), 60), "s": (3 if R.chance(0.12) else (2 if R.chance(0.35) else 1)), "delay": R.range_value(0, 0.25)})
				i += 1.0
		if true:
			var i = 0
			while (i < 6):
				mist.add(R.range_value((-8), 8), ((-top(_capture_t_20[0])) + R.range_value((-6), 6)), R.range_value((-34), 34), (-R.range_value(10, 26)), 4, R.range_value(9, 13), R.range_value(0.8, 1.2), C[int(6)], 0.18)
				i += 1.0
	if true:
		var i = (pops.size() - 1)
		while (i >= 0):
			if (_R.assign_member(pops[int(i)], "age", dt, "+=") > 0.12):
				pops.remove_at(int(i))
			i -= 1.0
	if true:
		var i = (plinks.size() - 1)
		while (i >= 0):
			if (_R.assign_member(plinks[int(i)], "age", dt, "+=") > 0.14):
				plinks.remove_at(int(i))
			i -= 1.0
	drops.update(dt)
	rings.update(dt)
	mist.update(dt)
	ps.update(dt)
	lights.update(dt)
func draw_back(p, _time_argument: float, _options: Dictionary) -> void:
	var pr = poolR(_capture_t_20[0])
	var pk = poolK(_capture_t_20[0])
	if (pk > 0):
		p.each((-pr), ((-pr) * SY), pr, (pr * SY), func(x, y, sx, sy):
			var d = (pow((float(x) / pr), 2) + pow((float(y) / (pr * SY)), 2))
			if (d > 1):
				return null
			p.blend_px(sx, sy, (C[int(2)] if (d < 0.15) else C[int(1)]), ((0.6 * pk) * minf(1, ((1 - d) * 4))))
			if (((y < 0) and (d > 0.78)) and (d < 0.95)):
				p.blend_px(sx, sy, C[int(4)], (0.7 * pk)))
	rings.draw(p, C, (-1))
	var u = (float((_capture_t_20[0] - ERUPT)) / 0.4)
	if ((u > 0) and (u < 1)):
		_W.ring(p, 0, 0.5, (6 + (42 * _E.out_cubic(u))), SY, (1.5 * (1 - u)), C, {"n": 3, "gap": (1.6 + (2 * u)), "half": (-1), "hot": (u < 0.3), "seed": 9})
	foamHead(p, top(_capture_t_20[0]), head(_capture_t_20[0]), true)
	drops.draw(p, C, "back")
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	var H = top(_capture_t_20[0])
	var hk = head(_capture_t_20[0])
	var k = clampf((float(_capture_t_20[0]) / ERUPT), 0.0, 1.0)
	var thin = (_M.smooth(ERUPT, (ERUPT + 0.12), _capture_t_20[0]) * (1 - (0.55 * _M.smooth(FALL, GONE, _capture_t_20[0]))))
	rings.draw(p, C, 1)
	var u = (float((_capture_t_20[0] - ERUPT)) / 0.4)
	if ((u > 0) and (u < 1)):
		_W.ring(p, 0, 0.5, (6 + (42 * _E.out_cubic(u))), SY, (1.5 * (1 - u)), C, {"n": 3, "gap": (1.6 + (2 * u)), "half": 1, "hot": (u < 0.3), "seed": 9})
	var fk = (_M.smooth(ERUPT, (ERUPT + 0.3), _capture_t_20[0]) * (1 - _M.smooth((GONE - 0.3), 4.4, _capture_t_20[0])))
	if (fk > 0):
		_W.lace(p, 0, 0, (8 + (10 * fk)), (((8 + (10 * fk)) * SY) + 0.5), fk, C, _capture_t_20[0], S)
	if (_capture_t_20[0] < (ERUPT + 0.05)):
		var beat = pow(maxf(0, sin((_capture_t_20[0] * (8 + ((18 * k) * k))))), 3)
		var rd = ((4 + (3.5 * k)) + (1.5 * beat))
		var hd = ((1.5 + (3 * k)) + (3 * beat))
		p.shade(((-rd) - 1), ((-hd) - 1), (rd + 1), 0.5, func(x, y, out, _unused3=null):
			var dx = (float(x) / rd)
			var dy = (float(y) / hd)
			var d = ((dx * dx) + (dy * dy))
			if ((d > 1) if (d > 1) else (y > 0.5)):
				return null
			var lit = (((-dx) * 0.7) - (dy * 0.7))
			var rim = (d > 0.68)
			out.c = ((_C.WHITE if (lit > 0.3) else (C[int(6)] if (lit > (-0.15)) else C[int(4)])) if rim else (C[int(6)] if (lit > 0.55) else (C[int(5)] if (lit > 0.12) else (C[int(4)] if (lit > (-0.3)) else C[int(3)])))))
		p.px(((-rd) * 0.35), ((-hd) * 0.6), _C.WHITE)
		p.glow(0, (-5), ((16 + (16 * k)) + (8 * beat)), C[int(5)], ((0.06 + (0.12 * k)) + (0.12 * beat)))
	var sp = spurt(_capture_t_20[0])
	if ((sp > 1) and (H < 1)):
		p.shade((-2), ((-sp) - 1), 2, 0, func(x, y, out, _unused3=null):
			var q = (float(x) / (1 + (0.8 * (1 + (float(y) / sp)))))
			if (absf(q) > 1):
				return null
			out.c = (C[int(6)] if (q < (-0.3)) else (_C.WHITE if (q < 0.35) else C[int(5)])))
		p.circle(0, (-sp), 1.3, C[int(6)])
		p.px(0, ((-sp) - 1), _C.WHITE)
		p.glow_line(0, 0, 0, (-sp), 8, C[int(5)], 0.3)
	column(p, H, thin)
	if ((hk > 0) if (hk > 0) else ((H > 1) and (_capture_t_20[0] < GONE))):
		if true:
			var i = 0
			while (i < 7):
				var a = (((float(i) / 7) * TAU) + (_capture_t_20[0] * 2.1))
				var r = (4 + (2 * sin(((_capture_t_20[0] * 5) + (i * 1.7)))))
				var x = ((cos(a) * r) * 1.3)
				var y = (((sin(a) * r) * SY) - 2)
				_B.billow(p, x, y, ((1.6 + (1.2 * _M.rand([i, (S + 4)]))) * maxf(hk, (thin * 0.6))), C)
				i += 1.0
	foamHead(p, H, hk, false)
	for q in pops:
		var g = (float(q.age) / 0.12)
		for _tuple3 in [[1, 0], [(-1), 0], [0.7, (-0.7)], [(-0.7), (-0.7)], [0, (-1)]]:
			var dx = _tuple3[0]
			var dy = _tuple3[1]
			p.dot((q.x + (dx * (q.r + (3 * g)))), (q.y + (dy * (q.r + (3 * g)))), C[int(6)], (1 - g))
	for q in plinks:
		var g = (float(q.age) / 0.14)
		if (g < 0.5):
			p.px(q.x, q.y, _C.WHITE)
		if (q.s > 1):
			p.line(q.x, (q.y - 1), q.x, ((q.y - 1) - (3 * (1 - g))), (_C.WHITE if (g < 0.4) else C[int(6)]))
		p.glow(q.x, q.y, 4, C[int(5)], (0.25 * (1 - g)))
	drops.draw(p, C, "front")
	var f = (float((_capture_t_20[0] - ERUPT)) / 0.07)
	if ((f >= 0) and (f < 1)):
		p.circle(0, (-4), (7 * (1 - (f * 0.4))), _C.WHITE)
		p.ellipse(0, 0, 12, 2.6, func(d, _unused1=null, _unused2=null, _unused3=null):
			return (_C.WHITE if (d < 0.6) else C[int(6)]))
	ps.draw(p)
	mist.draw(p, C[int(5)])
	lights.draw(p)
	if (H > 1):
		p.glow_line(0, 0, 0, (-H), 26, C[int(4)], (0.2 * thin))
	p.glow(0, (-2), 46, C[int(4)], (0.24 * maxf(hk, ((0.3 * k) * (1 if (_capture_t_20[0] < ERUPT) else 0)))))
	p.glow(0, 2, 60, C[int(3)], (0.12 * poolK(_capture_t_20[0])))
func _weak_callback_0(d, _unused1=null, _unused2=null, _unused3=null):
	var inPool = (_R.hypot([d.x, d.z]) < poolR(_capture_t_20[0]))
	rings.add(d.x, d.z, 0.6, ((2.5 if inPool else 1.5) + (d.s * 1.6)), (0.32 + (d.s * 0.1)), {"n": 1, "k": (0.95 if inPool else 0.7), "hot": 0.05})
	_R.push_items(plinks, [{"x": d.x, "y": (d.z * SY), "s": d.s, "age": 0}])
	if ((d.s > 1) and (not d.get("small"))):
		if true:
			var i = 0
			while (i < 2):
				var a = R.range_value(0, TAU)
				var v = R.range_value(8, 28)
				drops.add({"x": d.x, "z": d.z, "h": 0.5, "vx": (cos(a) * v), "vz": (sin(a) * v), "vh": R.range_value(45, 95), "s": 1, "small": true, "life": 1})
				i += 1.0
