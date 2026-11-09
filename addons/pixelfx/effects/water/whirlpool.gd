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
## Source: src/fx/water/whirlpool.js
const META = {"id":"pixelfx.whirlpool","name":"Whirlpool","desc":"Seen from above, dark water winds into a vortex: foam arms spiral in, darkening as they're drawn down into a deep eye with a lit far rim, flecks of foam circling in after them.","tags":["water","whirlpool","vortex","maelstrom","swirl","top-down","loop"],"size":[128,84],"origin":[64,42],"duration":3,"loop":true,"fps":30,"bg":"dark","options":{"palette":["#0a1630","#123063","#1b5596","#2a7fc4","#45a9e3","#86d3f5","#cdf1ff","#ffffff"],"seed":5},"cacheable":true,"layers":["front"]}
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
			var limits = {}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-160, -138, 320, 276)
var D = META.duration
var R = 60
var SY = 0.6
var K = 2.4
var EYE = 0.16
func foam(rho, th, ph):
	var s = log(maxf(rho, 0.02))
	var a = ((th + (K * s)) + (ph * TAU))
	var b = ((th + ((K * 1.35) * s)) + ((ph * TAU) * 2))
	var one = pow((0.5 + (0.5 * cos(((7 * a) + (0.9 * sin(((3 * a) + (s * 4)))))))), 26)
	var two = (pow((0.5 + (0.5 * cos(((11 * b) + 1.3)))), 34) * 0.7)
	var three = ((pow((0.5 + (0.5 * cos((17 * ((th + ((K * 0.8) * s)) + ((ph * TAU) * 3)))))), 30) * 0.8) * maxf(0, (1 - ((rho - EYE) * 2.2))))
	var dash = (0.55 + (0.45 * sin((((s * 22) - ((ph * TAU) * 4)) + (a * 2)))))
	return (((one + two) + three) * dash)
func draw(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var ph = (float(t) / D)
	var ry = (R * SY)
	p.shade((-R), (-ry), R, ry, func(x, y, out):
		var dx = (float(x) / R)
		var dy = (float(y) / ry)
		var rho = sqrt((dx)*(dx) + (dy)*(dy))
		if (rho > 1):
			return null
		var th = atan2(dy, dx)
		if (rho < EYE):
			var far = (float((-dy)) / rho)
			var wall = (float(((float(rho) / EYE) - 0.35)) / 0.65)
			if (far > 0):
				out.c = ((C[int(5)] if (far > 0.6) else C[int(4)]) if (wall > 0.8) else (C[int(3)] if (wall > 0.45) else (C[int(2)] if (wall > 0.15) else C[int(0)])))
			else:
				out.c = (C[int(2)] if ((wall > 0.85) and (far > (-0.5))) else C[int(0)])
			return null
		var k = (float((rho - EYE)) / (1 - EYE))
		var fade = (1 - _M.smooth(0.62, 1, k))
		p.blend(x, y, (C[int(0)] if (k < 0.25) else C[int(1)]), ((0.75 - (0.25 * k)) * (1 - _M.smooth(0.8, 1, k))))
		if ((k > 0.3) and (k < 0.8)):
			p.blend(x, y, C[int(2)], (0.18 * sin((float((PI * (k - 0.3))) / 0.5))))
		if (k < 0.035):
			var g = (0.5 + (0.5 * cos(((th * 9) - ((ph * TAU) * 6)))))
			out.c = (_C.WHITE if (g > 0.7) else (C[int(6)] if (g > 0.3) else C[int(4)]))
			return null
		var I = (((foam(rho, th, ph) * fade) * minf(1, ((k - 0.08) * 4))) * (0.45 + (0.55 * sin((PI * minf(1, (k * 1.25)))))))
		if (I > 0.12):
			out.c = (_C.WHITE if (I > 0.75) else (C[int(6)] if (I > 0.45) else (C[int(5)] if (I > 0.25) else C[int(4)])))
			if (I > 0.25):
				out.l = C[int(5)]
				out.k = (0.08 + (0.14 * minf(1, I))))
	_P.cycle(t, D, 30, o.seed, func(g):
		return g.range_value(1.2, 2.2), func(age, life, r, _unused3=null):
		var u = (float(age) / life)
		var rho = (0.8 - ((0.62 * u) * u))
		var a0 = r.range_value(0, TAU)
		var th = (a0 - (K * log(rho)))
		var ang = (th - (age * (1.5 + (float(2.2) / rho))))
		var x = ((cos(ang) * rho) * R)
		var y = ((sin(ang) * rho) * ry)
		var ang2 = (ang + (float(0.12) / rho))
		var x2 = ((cos(ang2) * rho) * R)
		var y2 = ((sin(ang2) * rho) * ry)
		if ((u > 0.85) and (r.next() < ((u - 0.85) * 6))):
			return null
		p.line(x2, y2, x, y, (C[int(5)] if (u < 0.2) else (_C.WHITE if (u < 0.6) else C[int(6)]))))
	_P.cycle(t, D, 8, (o.seed + 3), func(g):
		return g.range_value(0.25, 0.45), func(age, life, r, _unused3=null):
		var rho = r.range_value(0.35, 0.8)
		var th = (r.range_value(0, TAU) - (age * 2.5))
		var k = sin((float((PI * age)) / life))
		var x = ((cos(th) * rho) * R)
		var y = ((sin(th) * rho) * ry)
		if (foam(rho, th, ph) < 0.35):
			return null
		p.px(x, y, _C.WHITE)
		if (k > 0.55):
			for _tuple1 in [[1, 0], [(-1), 0], [0, 1], [0, (-1)]]:
				var dx = _tuple1[0]
				var dy = _tuple1[1]
				p.px((x + dx), (y + dy), C[int(6)])
		p.glow(x, y, 5, C[int(5)], (0.4 * k)))
	p.glow(0, 0, (R * 0.9), C[int(4)], 0.2)
	p.glow(0, 0, (((R * EYE) * 1.6) + 6), C[int(5)], 0.28)
	p.glow(0, (((-ry) * EYE) * 0.8), 14, C[int(5)], 0.32)
