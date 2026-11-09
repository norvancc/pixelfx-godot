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
## Source: src/fx/projectiles/bullet-tracer.js
const META = {"id":"pixelfx.bullet_tracer","name":"Bullet tracer","desc":"A white-hot slug tearing along, its tracer burning behind it in a long streak that sputters and cools from white through gold to red, shedding sparks and a thread of smoke.","tags":["projectile","bullet","tracer","gun","directional","loop"],"size":[200,40],"origin":[184,18],"duration":0.6,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"smoke":["#2e2a36","#46404f","#625b6b","#817a8a","#a39caa"],"length":120,"speed":520,"seed":4},"cacheable":true,"layers":["front"]}
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
			var limits = {"length":[60,160],"speed":[0,520]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-320, -114, 472, 232)
var SLUG = ["..oyyp..", ".ypwwwwp", "ywwwwwww", ".ypwwwwp", "..oyyp.."]
func draw(p, t: float, o: Dictionary) -> void:
	var F = _C.fit(o.palette, 9)
	var SM = _C.fit(o.smoke, 5)
	var S = o.seed
	var D = META.duration
	var L = o.length
	var V = o.speed
	var fr = floori(((t * 30) + 0.000001))
	var ph = (float((TAU * t)) / D)
	var left = ((-META.origin[int(0)]) + 2)
	var puffs = []
	_A.beat(t, D, 18, (S + 7), func(r):
		return r.range_value(0.5, 0.7), func(age, life, r):
		var k = (float(age) / life)
		var x = (((-L) * r.range_value(0.45, 0.8)) - (age * 90))
		var y = ((0.5 + ((sin(((age * 6) + r.range_value(0, TAU))) * age) * 3)) - ((age * age) * 8))
		if (x < (left + 6)):
			return null
		puffs.append({"x": x, "y": y, "r": (1.2 + (age * 4)), "a": (((0.55 * (1 - k)) * minf(1, (age * 8))) * _M.smooth(left, (left + 30), x)), "b": (0.95 - (k * 0.4)), "w": 0}))
	_J.cloud(p, puffs, SM, SM, {"dens": 1.2, "max": 0.6})
	var heat = func(d):
		return (((1 - pow((float(d) / L), 0.8)) + (_M.noise(((d * 0.12) - (t * 40)), S) * 0.12)) + (0.08 * sin(((d * 0.35) - (ph * 9)))))
	var yAt = func(d):
		return (0.5 + ((sin(((d * 0.09) + (ph * 2))) * (float(d) / L)) * 0.8))
	var HOT = (L * 0.32)
	p.shade(((-HOT) - 1), (-4), 1, 5, func(x, y, _unused2=null):
		var d = (-x)
		var u = (float(d) / HOT)
		if ((u < 0) if (u < 0) else (u > 1)):
			return null
		var w = (0.7 + ((2.3 * pow((1 - u), 1.4)) * (0.9 + (0.1 * sin(((d * 0.8) - (ph * 12)))))))
		var v = (float(absf((y - yAt.call(d)))) / w)
		if (v > 1):
			return null
		var h = heat.call(d)
		return ((_C.WHITE if (h > 0.8) else F[int(7)]) if (v < 0.38) else ((F[int(7)] if (h > 0.75) else (F[int(6)] if (h > 0.6) else F[int(5)])) if (v < 0.7) else (F[int(5)] if (u < 0.5) else F[int(4)]))))
	if true:
		var d = HOT
		while (d <= L):
			var u = (float(d) / L)
			var h = heat.call(d)
			if ((u > 0.55) and (_M.rand([floori((float(d) / 3)), fr, S]) < ((u - 0.55) * 1.6))):
				d += 0.5
				continue
			var c = (F[int(6)] if (h > 0.55) else (F[int(5)] if (h > 0.42) else (F[int(4)] if (h > 0.3) else (F[int(3)] if (h > 0.18) else (F[int(2)] if (h > 0.08) else F[int(1)])))))
			p.dot((-d), yAt.call(d), c, (1 if (u < 0.85) else (float((1 - u)) / 0.15)))
			d += 0.5
	p.glow_line((-2), 1, ((-L) * 0.45), 1, 6, F[int(4)], 0.35)
	p.glow_line((-2), 1, ((-L) * 0.2), 1, 3, F[int(7)], 0.3)
	var SP = [F[int(7)], F[int(6)], F[int(4)], F[int(3)]]
	_A.beat(t, D, 16, (S + 2), func(r):
		return r.range_value(0.1, 0.28), func(age, life, r):
		var _tuple1 = _J.wake((-r.range_value(4, (L * 0.5))), (0.5 + r.range_value((-0.5), 1)), (-r.range_value(10, 80)), r.range_value((-60), 50), age, (V * 0.35), 3, 260)
		var x = _tuple1[0]
		var y = _tuple1[1]
		var vx = _tuple1[2]
		var vy = _tuple1[3]
		if (x > (left + 8)):
			_B.spark(p, x, y, vx, vy, (1 - (float(age) / life)), SP, 0.45, 0.012, 6))
	p.sprite(SLUG, {"w": _C.WHITE, "p": F[int(7)], "y": F[int(6)], "o": F[int(5)]}, (-1), (-1))
	p.glow(2, 1, 24, F[int(4)], 0.5)
	p.glow(3, 1, 8, _C.WHITE, 0.55)
