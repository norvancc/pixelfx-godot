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
const _B = preload("b2_common.gd")
## Source: src/fx/projectiles/plasma-shot.js
const META = {"id":"pixelfx.plasma_shot","name":"Plasma shot","desc":"A glowing plasma blob: hot knots churning in its core, a corona crackling over its skin, its tail necking into droplets that tear off, cool and wink out behind.","tags":["projectile","plasma","energy","sci-fi","directional","loop"],"size":[144,60],"origin":[108,30],"duration":0.8,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#061a1c","#0b3b34","#0f6a4a","#18a05a","#3fd46a","#8cf57e","#d6ffc4","#ffffff"],"size":6,"speed":200,"seed":3},"cacheable":true,"layers":["front"]}
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
			var limits = {"size":[3,14],"speed":[0,520]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-212, -134, 352, 268)
func draw(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var R = o.size
	var V = o.speed
	var S = o.seed
	var D = META.duration
	var w = (float((TAU * t)) / D)
	var fr = floori(((t * 30) + 0.000001))
	var left = ((-META.origin[int(0)]) + 2)
	var T0 = ((-R) * 3.2)
	var tail = func(x):
		return (sin(((x * 0.2) + (w * 2))) * (0.3 + ((float((T0 - x)) / 44) * 1.8)))
	if true:
		var x = T0
		while (x > (T0 - 44)):
			var u = (float((T0 - x)) / 44)
			var y = tail.call(x)
			p.dot(x, y, (C[int(6)] if (u < 0.2) else (C[int(5)] if (u < 0.45) else C[int(4)])), (1 if (u < 0.55) else (float((1 - u)) / 0.45)))
			if (u < 0.3):
				p.px(x, (y + 1), (C[int(5)] if (u < 0.15) else C[int(4)]))
			x -= 1
	var balls = [{"x": 0, "y": 0, "r": R, "h": 1, "core": 0.8}]
	if true:
		var i = 0
		while (i < 3):
			var a = ((w * [2, (-3), 5][int(i)]) + (float((i * TAU)) / 3))
			var d = (R * (0.5 + (0.1 * sin(((w * 3) + (i * 2))))))
			balls.append({"x": ((cos(a) * d) - 0.4), "y": ((sin(a) * d) * 0.8), "r": (R * 0.32), "h": 1, "core": 1})
			i += 1.0
	if true:
		var i = 1
		while (i <= 6):
			var x = ((-R) * (0.5 + (i * 0.42)))
			var wag = (sin(((w * 2) - (i * 0.9))) * (0.3 + (i * 0.28)))
			var r = (R * (0.62 - (i * 0.08)))
			balls.append({"x": x, "y": wag, "r": r, "h": (0.96 - (i * 0.05)), "core": (float(sqrt(((5.2 - (i * 0.65)) * 0.3))) / r)})
			i += 1.0
	var drops = []
	_P.cycle(t, D, 11, S, func(r):
		return r.range_value(0.34, 0.5), func(age, life, r, _unused3=null):
		var k = (float(age) / life)
		var pull = r.range_value(450, 800)
		var x = ((((-R) * 2.9) - (((0.5 * pull) * age) * age)) - (r.range_value(0, 16) * age))
		var y = ((sin((((w * 2) - 5.4) + (age * 12))) * 2) + ((r.range_value((-30), 30) * age) * (0.4 + age)))
		var rad = ((R * r.range_value(0.3, 0.48)) * (1 - (k * 0.6)))
		drops.append({"x": x, "y": y, "r": rad, "h": (0.97 * (1 - (k * 0.75))), "core": (float(sqrt(((maxf(0, (1 - (k * 1.3))) * 7) * 0.3))) / rad), "k": k}))
	var all = (balls + drops)
	p.shade((((-R) * 2.6) - 60), (((-R) * 2) - 8), (R * 1.6), ((R * 2) + 8), func(x, y, _unused2=null):
		var f = 0
		var heat = 0
		var hh = 0
		for b in all:
			var dx = (x - b.x)
			var dy = (y - b.y)
			var d2 = ((dx * dx) + (dy * dy))
			var q = (float(d2) / ((4 * b.r) * b.r))
			if (q < 1):
				var c = (float(((1 - q) * (1 - q))) / 0.5625)
				f += c
				heat += (c * b.h)
			if b.core:
				hh += (float((((b.core * b.core) * b.r) * b.r)) / (d2 + 0.3))
		if (f < 1):
			return null
		var lvl = (7 if (hh > 10) else (6 if (hh > 4.6) else (5 if (hh > 2.2) else (4 if (f > 1.4) else 3))))
		var cap = _M.js_round((2 + ((float(heat) / f) * 5.4)))
		return C[int(maxf(2, minf(((lvl + 1) if ((x > (R * 0.3)) and (lvl < 5)) else lvl), cap)))])
	if true:
		var j = 0
		while (j < 3):
			var g = _M.rng([fr, j, S])
			var a0 = g.range_value((-2.3), 2.3)
			var span = (g.range_value(0.45, 0.9) * g.sign_value())
			var n = 6
			var hgt = g.range_value(1.5, 3.5)
			var pts = []
			if true:
				var i = 0
				while (i <= n):
					var a = (a0 + (float((span * i)) / n))
					var rr = (((R + 0.6) + (hgt * sin((float((PI * i)) / n)))) + (g.range_value((-0.5), 0.5) if fmod(i, n) else 0))
					pts.append([((cos(a) * rr) - 0.4), ((sin(a) * rr) * 0.92)])
					i += 1.0
			p.polyline(pts, (C[int(5)] if j else C[int(6)]))
			p.px(pts[int(3)][int(0)], pts[int(3)][int(1)], _C.WHITE)
			p.glow(pts[int(3)][int(0)], pts[int(3)][int(1)], 6, C[int(5)], 0.4)
			j += 1.0
	if true:
		var j = 0
		while (j < 4):
			var g = _M.rng([fr, (j + 9), S])
			var a = g.range_value((-2.2), 2.2)
			var l = g.range_value(1.5, 4)
			var r0 = (R + 1)
			var x0 = ((cos(a) * r0) - 0.4)
			var y0 = ((sin(a) * r0) * 0.92)
			p.line(x0, y0, (x0 + (cos(a) * l)), (y0 + (sin(a) * l)), (C[int(4)] if fmod(j, 2) else C[int(5)]))
			j += 1.0
	var SP = [_C.WHITE, C[int(6)], C[int(5)], C[int(3)]]
	_A.beat(t, D, 14, (S + 5), func(r):
		return r.range_value(0.12, 0.3), func(age, life, r):
		var a = r.range_value((-2.4), 2.4)
		var sp = r.range_value(60, 130)
		var _tuple1 = _J.wake((cos(a) * (R + 1)), (sin(a) * (R + 1)), (cos(a) * sp), (sin(a) * sp), age, (V * 0.7), 4, 0)
		var x = _tuple1[0]
		var y = _tuple1[1]
		var vx = _tuple1[2]
		var vy = _tuple1[3]
		if ((x > (left + 4)) and (absf(y) < 26)):
			_B.spark(p, x, y, vx, vy, (1 - (float(age) / life)), SP, 0.4, 0.015, 6))
	var pulse = (0.85 + (0.15 * sin((w * 4))))
	p.glow((-2), 0, 34, C[int(3)], (0.8 * pulse))
	p.glow(0, 0, 16, C[int(4)], (0.35 * pulse))
	p.glow(1, 0, 7, C[int(6)], (0.3 * pulse))
	p.glow_line((-R), 0, ((-R) * 4.6), 0, 7, C[int(3)], 0.3)
	for d in drops:
		if (d.x < (left + 4)):
			continue
		if ((d.k < 0.6) and (d.x < ((-R) * 3.5))):
			p.px(d.x, d.y, (C[int(7)] if (d.k < 0.3) else C[int(6)]))
		p.glow(d.x, d.y, (3 + (d.r * 2)), C[int(2)], (0.6 * (1 - d.k)))
