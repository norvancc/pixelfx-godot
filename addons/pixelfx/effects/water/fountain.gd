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
## Source: src/fx/water/fountain.js
const META = {"id":"pixelfx.fountain","name":"Fountain","desc":"A stone basin; a jet rises from its spout and blooms into glassy arcs that break into beads, fall back and plink into the water with rings.","tags":["water","fountain","jet","basin","prop","ambient","loop"],"size":[120,104],"origin":[60,96],"duration":2,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#0a1630","#123063","#1b5596","#2a7fc4","#45a9e3","#86d3f5","#cdf1ff","#ffffff"],"seed":3},"cacheable":true,"layers":["back","front"]}
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
	return Rect2i(-156, -192, 312, 296)
var D = META.duration
var SY = 0.34
var G = 600
var RIM = 10
var RX = 36
var IN = 29.5
var JET = 54
var ARCS = 12
var BY = ((-RX) * SY)
var LEVEL = (RIM - 1.2)
func arcs(S):
	return _B.make_array(ARCS, func(_unused, i, _unused2=null, _unused3=null):
		var a = (((float((i + 0.5)) / ARCS) * TAU) + (_M.rand([i, S]) * 0.25))
		var vr = (38 + (14 * _M.rand([i, (S + 1)])))
		var vh = (30 + (26 * _M.rand([i, (S + 2)])))
		var tl = (float((vh + sqrt(((vh * vh) + ((2 * G) * (JET - LEVEL)))))) / G)
		return {"a": a, "vr": vr, "vh": vh, "tl": tl, "ca": cos(a), "sa": sin(a)})
func along(q, tau):
	var r = (q.vr * tau)
	var h = ((JET + (q.vh * tau)) - (((0.5 * G) * tau) * tau))
	return [(q.ca * r), ((BY + ((q.sa * r) * SY)) - h), h]
func inEll(x, y, rx, cy):
	return ((pow((float(x) / rx), 2) + pow((float((y - cy)) / (rx * SY)), 2)) <= 1)
func basin(p, ST, half):
	var cy = (BY - RIM)
	var ry = (RX * SY)
	p.shade(((-RX) - 1), ((cy - ry) - 1), (RX + 1), 1, func(x, y, out, _unused3=null):
		if inEll(x, y, RX, cy):
			if inEll(x, y, IN, cy):
				return null
			var near = (y > cy)
			if (near != (half > 0)):
				return null
			var outer = ((((not inEll(x, (y - 1), RX, cy)) if (not inEll(x, (y - 1), RX, cy)) else (not inEll(x, (y + 1), RX, cy))) if ((not inEll(x, (y - 1), RX, cy)) if (not inEll(x, (y - 1), RX, cy)) else (not inEll(x, (y + 1), RX, cy))) else (not inEll((x - 1), y, RX, cy))) if (((not inEll(x, (y - 1), RX, cy)) if (not inEll(x, (y - 1), RX, cy)) else (not inEll(x, (y + 1), RX, cy))) if ((not inEll(x, (y - 1), RX, cy)) if (not inEll(x, (y - 1), RX, cy)) else (not inEll(x, (y + 1), RX, cy))) else (not inEll((x - 1), y, RX, cy))) else (not inEll((x + 1), y, RX, cy)))
			var inner = (((inEll(x, (y - 1), IN, cy) if inEll(x, (y - 1), IN, cy) else inEll(x, (y + 1), IN, cy)) if (inEll(x, (y - 1), IN, cy) if inEll(x, (y - 1), IN, cy) else inEll(x, (y + 1), IN, cy)) else inEll((x - 1), y, IN, cy)) if ((inEll(x, (y - 1), IN, cy) if inEll(x, (y - 1), IN, cy) else inEll(x, (y + 1), IN, cy)) if (inEll(x, (y - 1), IN, cy) if inEll(x, (y - 1), IN, cy) else inEll(x, (y + 1), IN, cy)) else inEll((x - 1), y, IN, cy)) else inEll((x + 1), y, IN, cy))
			var a = atan2((float((y - cy)) / ry), (float(x) / RX))
			var lit = (((-cos(a)) * 0.65) - (sin(a) * 0.45))
			out.c = (ST[int(0)] if outer else ((ST[int(2)] if (y < cy) else ST[int(1)]) if inner else (ST[int(5)] if (lit > 0.4) else (ST[int(4)] if (lit > (-0.05)) else (ST[int(3)] if (lit > (-0.45)) else ST[int(2)])))))
			return null
		if ((half < 0) if (half < 0) else (absf(x) >= RX)):
			return null
		var dx = (float(x) / RX)
		var top = (cy + (sqrt((1 - (dx * dx))) * ry))
		var base = (top + RIM)
		if ((y < top) if (y < top) else (y > base)):
			return null
		var u = ((asin(clampf(dx, 0.0, 1.0)) * RX) * 0.62)
		var block = fmod((fmod((float((u + 40)) / 9), 1) + 1), 1)
		var row = (y - top)
		var course = (1 if (row > (RIM * 0.5)) else 0)
		var joint = (fmod((fmod((float(((u + 40) + (course * 4.5))) / 9), 1) + 1), 1) < 0.1)
		out.c = (ST[int(0)] if (((y > (base - 1)) if (y > (base - 1)) else (absf(x) > (RX - 1))) if ((y > (base - 1)) if (y > (base - 1)) else (absf(x) > (RX - 1))) else (row < 1)) else (ST[int(1)] if (joint if joint else (absf((row - (RIM * 0.5))) < 0.5)) else (ST[int(4)] if (dx < (-0.4)) else (ST[int(3)] if (dx < 0.3) else ST[int(2)]))))
		if (((row >= 1) and (row < 2)) and (not joint)):
			out.c = (ST[int(2)] if (dx < 0) else ST[int(1)]))
func pool(p, C, ph):
	var rx = IN
	var ry = (rx * SY)
	var cy = (BY - LEVEL)
	var T = (ph * TAU)
	if true:
		var Y = floori((cy - ry))
		while (Y < (cy + ry)):
			if true:
				var X = (-ceili(rx))
				while (X < rx):
					var x = (X + 0.5)
					var y = (Y + 0.5)
					var dx = (float(x) / rx)
					var dy = (float((y - cy)) / ry)
					var d = ((dx * dx) + (dy * dy))
					if (d > 1):
						X += 1.0
						continue
					p.blend(x, y, (C[int(3)] if (dy < (-0.55)) else C[int(1)]), (0.8 if (dy < (-0.55)) else 0.85))
					var u = ((x * 0.25) + (1.6 * sin(((y * 0.6) + T))))
					var w = ((y * 0.7) + (1.6 * sin(((x * 0.14) - (T * 2)))))
					var f = (maxf(0, (1 - (absf((sin(u) + sin(w))) * 2.6))) * (1 - d))
					if (f > 0.35):
						p.light(x, y, C[int(5)], (0.3 * f))
					X += 1.0
			Y += 1.0
func draw_back(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var ph = (float(t) / D)
	var S = o.seed
	var ST = _B.rock()
	var Q = arcs(S)
	basin(p, ST, (-1))
	pool(p, C, ph)
	for q in Q:
		if (q.sa < 0):
			arc(p, C, q, ph, true)
func arc(p, C, q, ph, back):
	var prev = null
	if true:
		var tau = 0
		while (tau <= q.tl):
			var _tuple1 = along(q, tau)
			var x = _tuple1[0]
			var y = _tuple1[1]
			var u = (float(tau) / q.tl)
			if (prev and (u < 0.66)):
				p.line(prev[int(0)], prev[int(1)], x, y, ((C[int(5)] if (u < 0.25) else C[int(4)]) if back else (_C.WHITE if (u < 0.2) else (C[int(6)] if (u < 0.45) else C[int(5)]))))
			prev = [x, y]
			tau += 0.012
	if true:
		var k = 0
		while (k < 6):
			var u = ((fmod(((ph * 2) + (float(k) / 6)), 1) * 0.42) + 0.58)
			var tau = (u * q.tl)
			var _tuple2 = along(q, tau)
			var x = _tuple2[0]
			var y = _tuple2[1]
			var vy = (((q.vh - (G * tau)) * (-1)) + ((q.sa * q.vr) * SY))
			_W.bead(p, x, y, (q.ca * q.vr), vy, (1 if back else (2 if (fmod(k, 3) == 0) else 1)), ([C[int(0)], C[int(1)], C[int(2)], C[int(2)], C[int(3)], C[int(4)], C[int(5)], C[int(5)]] if back else C))
			k += 1.0
	var g = (fmod(((ph * 4) + q.a), 1) * 0.6)
	var _tuple3 = along(q, (g * q.tl))
	var gx = _tuple3[0]
	var gy = _tuple3[1]
	p.px(gx, gy, _C.WHITE)
	if (not back):
		p.glow(gx, gy, 3, C[int(5)], 0.3)
func draw(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var ph = (float(t) / D)
	var S = o.seed
	var ST = _B.rock()
	var Q = arcs(S)
	var T = (ph * TAU)
	p.shade((-3.5), (BY - 16), 3.5, ((BY - LEVEL) + 0.5), func(x, y, out, _unused3=null):
		var w = (3.4 if (y < (BY - 14)) else 2.2)
		if (absf(x) > w):
			return null
		out.c = (ST[int(0)] if ((absf(x) > (w - 0.8)) if (absf(x) > (w - 0.8)) else (y < (BY - 15.5))) else (ST[int(4)] if (x < (-0.6)) else (ST[int(3)] if (x < 0.8) else ST[int(2)]))))
	p.shade((-3), ((BY - JET) - 1), 3, (BY - 16), func(x, y, out, _unused3=null):
		var v = (float(((BY - 16) - y)) / (JET - 16))
		var sway = ((sin(((T * 2) + (v * 5))) * 0.5) * v)
		var w = ((1.3 + (0.5 * v)) + (0.3 * sin(((T * 3) + (y * 0.4)))))
		var q = (float((x - sway)) / w)
		if (absf(q) > 1):
			return null
		var n = _M.tile_noise((x * 0.9), ((y * 0.15) + (ph * 16)), 0, 16, S)
		out.c = (C[int(6)] if (q < (-0.4)) else ((_C.WHITE if (n > (-0.3)) else C[int(6)]) if (q < 0.35) else C[int(5)])))
	p.circle(0, ((BY - JET) - 1), 2.4, C[int(6)])
	p.circle((-0.4), ((BY - JET) - 1.5), 1.4, _C.WHITE)
	p.glow(0, (BY - JET), 22, C[int(5)], (0.46 + (0.06 * sin((T * 4)))))
	p.glow(0, ((BY - JET) - 1), 8, _C.WHITE, 0.3)
	_P.cycle(t, D, 10, (S + 30), func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(0.2, 0.35), func(age, life, r, _unused3=null):
		var q = Q[int(floori((r.next() * ARCS)))]
		var _tuple4 = along(q, (r.range_value(0.1, 0.7) * q.tl))
		var x = _tuple4[0]
		var y = _tuple4[1]
		var k = sin((float((PI * age)) / life))
		if (q.sa < (-0.3)):
			return null
		p.px(x, y, _C.WHITE)
		if (k > 0.6):
			for _tuple5 in [[1, 0], [(-1), 0], [0, 1], [0, (-1)]]:
				var dx = _tuple5[0]
				var dy = _tuple5[1]
				p.px((x + dx), (y + dy), C[int(6)])
		p.glow(x, y, 5, C[int(5)], (0.4 * k)))
	if true:
		var i = 0
		while (i < 4):
			p.px((sin(((T * 3) + (i * 1.7))) * 2.5), ((BY - 16) - fmod(i, 2)), (C[int(6)] if fmod(i, 2) else _C.WHITE))
			i += 1.0
	for q in Q:
		if (q.sa >= 0):
			arc(p, C, q, ph, false)
	_B.each_indexed(Q, func(q, i, _unused2=null, _unused3=null):
		var f = fmod(((ph * 2) + _M.rand([i, (S + 9)])), 1)
		var _tuple6 = along(q, q.tl)
		var x = _tuple6[0]
		var y = _tuple6[1]
		_W.ring(p, x, y, (2 + (f * 8)), SY, (0.8 * pow((1 - f), 1.3)), C, {"n": 1, "half": 1, "seed": i})
		var g = fmod(((ph * 6) + _M.rand([i, (S + 10)])), 1)
		if (g < 0.15):
			p.px(x, (y - 1), _C.WHITE)
		if ((g < 0.3) and (q.sa > (-0.2))):
			p.line(x, (y - 1), (x + ((_M.rand([i, (S + 11)]) - 0.5) * 2)), ((y - 1) - (3 * (1 - (float(g) / 0.3)))), C[int(6)])
		p.glow(x, y, 6, C[int(5)], (0.18 * (1 - g))))
	basin(p, ST, 1)
	_P.cycle(t, D, 16, (S + 20), func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(0.8, 1.4), func(age, life, r, _unused3=null):
		var k = (float(age) / life)
		var a = r.range_value(0, TAU)
		var rr = (r.range_value(4, 20) + (k * 6))
		var x = (cos(a) * rr)
		var y = (((BY - JET) + r.range_value((-4), 16)) + (k * 10))
		if ((k > 0.75) and (r.next() < ((k - 0.75) * 4))):
			return null
		p.px(x, y, (_C.WHITE if (r.next() < 0.4) else C[int(6)])))
	p.glow_line(0, (BY - 16), 0, (BY - JET), 10, C[int(5)], 0.18)
	p.glow(0, ((BY - LEVEL) - 2), 46, C[int(4)], (0.26 + (0.03 * sin((T * 2)))))
	p.glow(0, ((BY - LEVEL) - 20), 30, C[int(5)], 0.12)
