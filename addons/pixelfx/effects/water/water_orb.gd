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
const _B = preload("b2_common.gd")
## Source: src/fx/water/water-orb.js
const META = {"id":"pixelfx.water_orb","name":"Water orb","desc":"A sphere of water floats and wobbles: a current circles inside it, the floor shows upside down through it, it shines, light gathers on the floor under it, and drips fall and plink.","tags":["water","orb","sphere","magic","float","ambient","loop"],"size":[100,108],"origin":[50,100],"duration":3,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#0a1630","#123063","#1b5596","#2a7fc4","#45a9e3","#86d3f5","#cdf1ff","#ffffff"],"radius":19,"seed":2},"cacheable":true,"layers":["back","front"]}
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
		elif key == "seed": fields.append({"name":key,"type":TYPE_INT,"default":int(value)})
		else:
			var limits = {"radius":[8,30]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-157, -207, 314, 322)
var D = META.duration
var SY = 0.3
var G = 700
var DRIP = 1.5
var LET = 0.5
func center(ph):
	return [0, ((-52) + (sin((ph * TAU)) * 2))]
func skin(a, R, ph):
	var sag = ((((maxf(0, sin(a)) ** 6) * 2.2) * _M.smooth(0.1, LET, (float(fmod((ph * D), DRIP)) / DRIP))) * (1 if ((float(fmod((ph * D), DRIP)) / DRIP) < LET) else 0))
	return (((R + (sin(((a * 3) + ((ph * TAU) * 2))) * 0.6)) + (sin(((a * 5) - ((ph * TAU) * 3))) * 0.35)) + sag)
func motes(ph, R):
	return _B.make_array(7, func(_unused, i):
		var a = (((float(i) / 7) * TAU) + ((ph * TAU) * (1 if fmod(i, 2) else (-1))))
		var r = ((R + 5) + (fmod(i, 3) * 3))
		var tilt = ((i - 3) * 0.22)
		var x = (cos(a) * r)
		var z = sin(a)
		return {"x": (x * cos(tilt)), "y": ((x * sin(tilt)) + ((z * r) * 0.28)), "z": z, "i": i})
func draw_back(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var ph = (float(t) / D)
	var R = o.radius
	var _tuple1 = center(ph)
	var cx = _tuple1[0]
	var cy = _tuple1[1]
	p.glow(cx, 0, 22, C[int(5)], 0.32)
	p.shade((cx - 9), (-2), (cx + 9), 2, func(x, y, out):
		var d = ((float(((x - cx) ** 2)) / 64) + (float(((y * 2.5) ** 2)) / 9))
		if (d > 1):
			return null
		out.c = (_C.WHITE if (d < 0.25) else (C[int(6)] if (d < 0.6) else C[int(5)]))
		out.a = (1.2 - d))
	for m in motes(ph, R):
		if (m.z < 0):
			p.px((cx + m.x), (cy + m.y), C[int(4)])
	p.glow(cx, cy, (R * 3.2), C[int(4)], (0.3 + (0.05 * sin(((ph * TAU) * 2)))))
func draw(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var ph = (float(t) / D)
	var R = o.radius
	var _tuple2 = center(ph)
	var cx = _tuple2[0]
	var cy = _tuple2[1]
	var T = (ph * TAU)
	p.shade(((cx - R) - 4), ((cy - R) - 4), ((cx + R) + 4), ((cy + R) + 6), func(x, y, out):
		var dx = (x - cx)
		var dy = (y - cy)
		var d = sqrt((dx)*(dx) + (dy)*(dy))
		var a = atan2(dy, dx)
		var r = skin(a, R, ph)
		if (d > r):
			return null
		var q = (float(d) / r)
		var lit = (float((float(((-dx) - dy)) / sqrt(2.0))) / maxf(0.5, d))
		if (q > 0.9):
			out.c = (_C.WHITE if (lit > 0.35) else (C[int(5)] if (lit > (-0.2)) else C[int(3)]))
			return null
		var gather = (maxf(0, (float((float((dx + dy)) / sqrt(2.0))) / r)) * q)
		p.blend(x, y, (C[int(4)] if (gather > 0.45) else (C[int(3)] if (gather > 0.25) else (C[int(2)] if (q > 0.7) else C[int(1)]))), (0.7 if (gather > 0.25) else (0.35 + (0.3 * q)))))
	if true:
		var k = 0
		while (k < 3):
			var rr = (R * (0.38 + (0.2 * k)))
			var tilt = ((-0.5) + (k * 0.35))
			var spin = ((T * ((-2) if fmod(k, 2) else 3)) + (k * 2))
			if true:
				var s = 0
				while (s < 1):
					var a = (spin + (s * TAU))
					var x = (cos(a) * rr)
					var z = sin(a)
					var y = (((x * sin(tilt)) * 0.6) + ((z * rr) * 0.62))
					var dash = fmod(((s * 3) + (k * 0.3)), 1)
					if (dash > 0.62):
						s += 0.012
						continue
					p.px((cx + (x * cos(tilt))), (cy + y), ((_C.WHITE if (dash < 0.1) else (C[int(6)] if (dash < 0.4) else C[int(5)])) if (z > 0) else C[int(3)]))
					s += 0.012
			k += 1.0
	_P.cycle(t, D, 8, o.seed, func(g):
		return g.range_value(1, 1.8), func(age, life, r, _unused3=null):
		var k = (float(age) / life)
		var x = ((r.range_value((-0.5), 0.5) * R) + (sin(((age * 4) + r.range_value(0, TAU))) * 1.5))
		var y = ((R * 0.6) - ((k * R) * 1.2))
		if (sqrt((x)*(x) + (y)*(y)) > (R * 0.8)):
			return null
		p.px((cx + x), (cy + y), (C[int(6)] if (k < 0.8) else _C.WHITE))
		if (r.next() < 0.35):
			p.px(((cx + x) + 1), (cy + y), C[int(5)]))
	p.arc(cx, cy, (R * 0.74), 1.8, (PI * 1.12), (PI * 1.4), func(u, v):
		return (_C.WHITE if (((u > 0.25) and (u < 0.75)) and (v > 0.4)) else C[int(6)]))
	p.px((cx - (R * 0.45)), (cy - (R * 0.62)), _C.WHITE)
	p.px((cx + (R * 0.48)), (cy + (R * 0.5)), C[int(6)])
	p.px(((cx + (R * 0.48)) + 1), (cy + (R * 0.5)), C[int(5)])
	for m in motes(ph, R):
		if (m.z >= 0):
			p.px((cx + m.x), (cy + m.y), _C.WHITE)
			p.px(((cx + m.x) - ((-1) if fmod(m.i, 2) else 1)), (cy + m.y), C[int(5)])
			p.glow((cx + m.x), (cy + m.y), 4, C[int(5)], 0.35)
	var dt = (float(fmod(t, DRIP)) / DRIP)
	var fall = (fmod(t, DRIP) - (DRIP * LET))
	var y0 = ((cy + R) + 3)
	var land = sqrt((float((2 * (-y0))) / G))
	if ((fall < 0) and (dt > 0.2)):
		var s = _M.smooth(0.2, LET, dt)
		p.circle(cx, (((cy + R) + 1) + (s * 1.5)), (0.8 + (s * 1.2)), C[int(5)])
		p.px((cx - 0.5), ((cy + R) + (s * 1.5)), C[int(6)])
	else:
		if ((fall >= 0) and (fall < land)):
			_W.bead(p, cx, (y0 + (((0.5 * G) * fall) * fall)), 0, (G * fall), 2, C)
		else:
			if (fall >= land):
				var since = (fall - land)
				if (since < 0.08):
					p.px(cx, 0, _C.WHITE)
				_W.ring(p, cx, 0, (1.5 + (since * 18)), SY, (1.1 * (1 - (float(since) / 0.4))), C, {"n": 1, "half": 1, "seed": 3, "hot": (since < 0.05)})
	var fx = (cx + (R * 0.36))
	var fy = (cy + (R * 0.4))
	var pulse = (0.8 + (0.2 * sin((T * 4))))
	p.circle(fx, fy, 1.6, C[int(6)])
	p.px(fx, fy, _C.WHITE)
	p.glow(fx, fy, 9, C[int(5)], (0.45 * pulse))
	p.glow(cx, cy, (R * 1.4), C[int(5)], 0.22)
	p.glow((cx - (R * 0.4)), (cy - (R * 0.5)), 6, _C.WHITE, 0.25)
