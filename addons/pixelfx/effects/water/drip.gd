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
## Source: src/fx/water/drip.js
const META = {"id":"pixelfx.drip","name":"Drip","desc":"A bead swells under a wet stone tip and catches the light, pinches off, falls stretched by its speed and plinks into a puddle with a crown, a ring and a tiny rebound.","tags":["water","drip","drop","puddle","cave","ambient","loop"],"size":[72,88],"origin":[36,78],"duration":1.6,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#0a1630","#123063","#1b5596","#2a7fc4","#45a9e3","#86d3f5","#cdf1ff","#ffffff"],"height":62,"source":true,"seed":1},"cacheable":true,"layers":["back","front"]}
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
			var limits = {"height":[24,120]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-132, -232, 264, 396)
var D = META.duration
var SY = 0.28
var G = 760
var LET = 0.78
var PRX = 20
func dripstone(p, H):
	var ST = _B.rock()
	var top = ((-H) - 14)
	p.shade((-24), top, 22, ((-H) + 0.5), func(x, y, out, _unused3=null):
		var under = ((((top + 7) + (sin((x * 0.45)) * 1.2)) + (sin(((x * 1.3) + 1)) * 0.6)) - (absf((x + 4)) * 0.12))
		var cone = ((-H) - (absf(x) * 1.25))
		var bottom = maxf(under, minf(cone, (-H)))
		var span = (24 if (x < 0) else 22)
		if ((y > bottom) if (y > bottom) else (absf(x) > (span - (maxf(0, ((top + 3) - y)) * 4)))):
			return null
		var rim = ((y > (bottom - 1)) if (y > (bottom - 1)) else (absf(x) > (span - 1)))
		var lx = (float((x + 24)) / 46)
		var v = (float((y - top)) / 14)
		out.c = (ST[int(0)] if rim else (ST[int(1)] if (v < 0.25) else ((ST[int(4)] if (x < 0) else ST[int(2)]) if ((y > under) and (absf(x) < 6)) else (ST[int(4)] if (lx < 0.3) else (ST[int(3)] if (lx < 0.62) else ST[int(2)])))))
		if ((((not rim) and (absf(((x - 9) - ((y - top) * 0.4))) < 0.5)) and (v > 0.3)) and (v < 0.7)):
			out.c = ST[int(0)])
	if true:
		var y = ((-H) - 7)
		while (y < (-H)):
			p.px((-1), y, (C_WET[int(1)] if (y > ((-H) - 3)) else C_WET[int(0)]))
			y += 1.0
	p.px((-1), ((-H) - 2), _C.WHITE)
var C_WET = _B.map_indexed(["#5d6a86", "#9fb6d6"], func(h, _unused1=null, _unused2=null, _unused3=null):
	return (int((int((int(_R.parse_int(_R.slice_value(h, 1, 3), 16)) | int((int(_R.parse_int(_R.slice_value(h, 3, 5), 16)) << int(8))))) | int((int(_R.parse_int(_R.slice_value(h, 5, 7), 16)) << int(16))))) | int(4278190080)))
func puddle(p, C):
	var ry = (PRX * SY)
	if true:
		var Y = floori((-ry))
		while (Y < ry):
			if true:
				var X = (-PRX)
				while (X < PRX):
					var x = (X + 0.5)
					var y = (Y + 0.5)
					var d = (pow((float(x) / PRX), 2) + pow((float(y) / ry), 2))
					if (d > 1):
						X += 1.0
						continue
					p.blend(x, y, C[int(1)], (0.72 * minf(1, ((1 - d) * 5))))
					X += 1.0
			Y += 1.0
	if true:
		var X = ((-PRX) + 3)
		while (X < (PRX - 3)):
			var x = (X + 0.5)
			var y = ((-sqrt((1 - pow((float(x) / PRX), 2)))) * ry)
			p.dot(x, (y + 0.5), (C[int(4)] if (absf(x) < (PRX * 0.5)) else C[int(3)]), 0.95)
			X += 1.0
func draw_back(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	puddle(p, C)
	var u = (t - landAt(o.height))
	if (u >= 0):
		_W.ring(p, 0, 0, (2 + (17 * _E.out_cubic((float(u) / 0.75)))), SY, (1.1 * (1 - (float(u) / 0.75))), C, {"n": 2, "gap": 2.5, "half": (-1), "seed": 1, "wob": 0.4})
	var v = (((t - landAt(o.height)) - REBOUND) - BACK)
	if (v >= 0):
		_W.ring(p, 0, 0, (1.5 + (9 * _E.out_cubic((float(v) / 0.5)))), SY, (0.9 * (1 - (float(v) / 0.5))), C, {"n": 1, "half": (-1), "seed": 2})
func landAt(H):
	return (LET + sqrt((float((2 * H)) / G)))
var REBOUND = 0.06
var BACK = 0.2
func draw(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var H = o.height
	var land = landAt(H)
	if o.source:
		dripstone(p, H)
	if (t < LET):
		var k = (float(t) / LET)
		var r = (0.7 + (2.3 * _E.in_quad(k)))
		var wob = ((0.15 * sin((t * 26))) * k)
		var neck = (_M.smooth(0.82, 1, k) * 2.5)
		var cy = (((-H) + r) + neck)
		if (neck > 0.2):
			p.line(0, (-H), 0, (cy - r), C[int(5)])
		p.ellipse(0, cy, (r * (1 - wob)), ((r * (1 + wob)) + (0.3 * k)), func(d, a, _unused2=null, _unused3=null):
			return ((C[int(5)] if ((cos(a) < 0) and (sin(a) < 0.3)) else C[int(3)]) if (d > 0.72) else (C[int(6)] if ((d < 0.35) and (cos(a) > 0)) else C[int(4)])))
		if (r > 1):
			p.px(((-r) * 0.4), (cy - (r * 0.45)), _C.WHITE)
		p.glow(0, cy, (4 + (r * 2)), C[int(5)], (0.14 + (0.14 * k)))
	else:
		var s = (float((t - LET)) / 0.15)
		if (s < 1):
			p.ellipse(0, ((-H) + 0.8), (1.2 * (1 - (s * 0.6))), (1 + (sin((s * PI)) * 0.8)), C[int(4)])
	var f = (t - LET)
	if ((f > 0) and (t < land)):
		var y = (((-H) + 3) + (((0.5 * G) * f) * f))
		var vy = (G * f)
		_W.bead(p, 0, y, 0, vy, 3, C)
		p.glow(0, y, 6, C[int(5)], 0.2)
	var u = (t - land)
	if (u >= 0):
		_W.ring(p, 0, 0, (2 + (17 * _E.out_cubic((float(u) / 0.75)))), SY, (1.1 * (1 - (float(u) / 0.75))), C, {"n": 2, "gap": 2.5, "half": 1, "hot": (u < 0.08), "seed": 1, "wob": 0.4, "glint": ((1 - (u * 2)) if (u < 0.5) else 0)})
		if (u < 0.06):
			p.px(0, 0, _C.WHITE)
			p.px((-1), 0, C[int(6)])
			p.px(1, 0, C[int(6)])
			p.glow(0, (-1), 10, C[int(5)], (0.5 * (1 - (float(u) / 0.06))))
		for _tuple1 in [[(-26), 70], [24, 64], [(-6), 90]]:
			var vx = _tuple1[0]
			var vh = _tuple1[1]
			var h = ((vh * u) - (((0.5 * G) * u) * u))
			if ((h > 0) and (u < 0.3)):
				p.px((vx * u), (-h), (_C.WHITE if (u < 0.1) else C[int(6)]))
		var r = (u - REBOUND)
		var h = ((52 * r) - (((((0.5 * G) * 0.5) * r) * r) * 2))
		if ((r > 0) and (h > 0)):
			p.line(0, (-1), 0, ((-h) + 1), C[int(5)])
			p.circle(0, (-h), 1.1, C[int(6)])
			p.px(0, ((-h) - 1), _C.WHITE)
		var v = ((u - REBOUND) - BACK)
		if (v >= 0):
			_W.ring(p, 0, 0, (1.5 + (9 * _E.out_cubic((float(v) / 0.5)))), SY, (0.9 * (1 - (float(v) / 0.5))), C, {"n": 1, "half": 1, "seed": 2, "hot": (v < 0.06)})
		p.glow(0, 0, 18, C[int(4)], (0.22 * (1 - clampf((float(u) / 0.6), 0.0, 1.0))))
	var sh = (0 if (sin((t * 20)) > 0) else 1)
	p.px(((-1) + sh), 2, C[int(4)])
	if ((f > 0) and (t < land)):
		var ry = (2 + ((((0.5 * G) * f) * f) * 0.04))
		p.px(sh, minf(4, ry), C[int(5)])
	p.glow(0, ((-H) + 2), 8, C[int(5)], 0.16)
	p.glow(0, 0, 26, C[int(3)], 0.14)
