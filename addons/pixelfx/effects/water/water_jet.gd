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
## Source: src/fx/water/water-jet.js
const META = {"id":"pixelfx.water_jet","name":"Water jet","desc":"A pressurised stream blasts right: a tight glassy rod with surges running down it that swells, roughens, bends under its weight and breaks into chunks, spray and mist.","tags":["water","jet","stream","hose","spray","directional","loop"],"size":[188,80],"origin":[14,32],"duration":1,"loop":true,"fps":30,"bg":"dark","options":{"palette":["#0a1630","#123063","#1b5596","#2a7fc4","#45a9e3","#86d3f5","#cdf1ff","#ffffff"],"length":118,"seed":3},"cacheable":true,"layers":["front"]}
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
			var limits = {"length":[40,160]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-152, -128, 464, 272)
var D = META.duration
var G = 520
var SPEED = 260
func drop(x, L):
	return (((float(x) / L) ** 2) * 9)
func thick(x, L):
	return (2.6 + (5.4 * pow((float(x) / L), 1.1)))
func draw(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var ph = (float(t) / D)
	var L = o.length
	var S = o.seed
	var T = (ph * TAU)
	if true:
		var X = 0
		while (X <= (L + 3)):
			var x = (X + 0.5)
			var u = (float(x) / L)
			if (u > 1):
				break
			var yc = drop(x, L)
			var rough = _M.smooth(0.25, 1, u)
			var sd = (fmod((fmod((x - ((ph * SPEED) * 2)), 130) + 130), 130) - 65)
			var w0 = (thick(x, L) + ((exp((float((-(sd * sd))) / 90)) * 1.4) * (1 - (u * 0.5))))
			var up = (w0 + ((_M.tile_noise(((x * 0.18) - (ph * 30)), 9, 30, 0, (S + 1)) * 2.2) * rough))
			var dn = (w0 + ((_M.tile_noise(((x * 0.18) - (ph * 30)), 3, 30, 0, (S + 1)) * 2.2) * rough))
			if true:
				var Y = floori((yc - up))
				while (Y <= ceili((yc + dn))):
					var y = (Y + 0.5)
					var q = (float((y - yc)) / maxf(0.8, (up if (y < yc) else dn)))
					var aq = absf(q)
					if (aq > 1):
						Y += 1.0
						continue
					if ((u > 0.55) and (_M.tile_noise(((x * 0.12) - (ph * 25)), ((y - yc) * 0.25), 25, 0, (S + 2)) < ((-0.9) + (1.6 * _M.smooth(0.55, 1, u))))):
						Y += 1.0
						continue
					var streak = _M.tile_noise(((x * 0.06) - (ph * 40)), (floori(((y - yc) + 20)) * 1.7), 40, 0, S)
					var lvl = (0 if (aq < 0.2) else (1 if (aq < 0.48) else (2 if (aq < 0.78) else 3)))
					if (streak > 0.35):
						lvl = maxf(0, (lvl - 1))
					if (q > 0.4):
						lvl = minf(3, (lvl + 1))
					p.px(X, Y, [_C.WHITE, C[int(6)], C[int(5)], C[int(4)]][int(lvl)])
					if (lvl == 0):
						p.light(x, y, C[int(5)], 0.12)
					Y += 1.0
			X += 1.0
	var fl = (0.85 + (0.15 * sin((T * 6))))
	p.circle(0, 0, (4.4 * fl), C[int(5)])
	p.circle(0, 0, (3.4 * fl), C[int(6)])
	p.circle(0, 0, (2.2 * fl), _C.WHITE)
	if true:
		var a = 0
		while (a < TAU):
			p.dot(((cos((a + (T * 2))) * 5.2) * fl), ((sin((a + (T * 2))) * 5.2) * fl), C[int(5)], 0.6)
			a += 0.35
	p.glow(0, 0, 24, C[int(5)], (0.6 * fl))
	p.glow(0, 0, 8, _C.WHITE, (0.4 * fl))
	if true:
		var k = 0
		while (k < 6):
			var x = ((L * 0.82) + fmod(((k * 13) + (ph * SPEED)), 78))
			var y = ((drop(minf(x, L), L) + ((((float((x - L)) / 60) ** 2) * 10) if (x > L) else 0)) + (sin((k * 2.1)) * 1.5))
			if (x < (L + 34)):
				_W.bead(p, x, y, SPEED, 40, (3 if (fmod(k, 3) == 0) else 2), C)
			k += 1.0
	_P.cycle(t, D, 70, (S + 3), func(g):
		return g.range_value(0.2, 0.42), func(age, life, r, _unused3=null):
		var f = sqrt(r.next())
		var x0 = (L * (0.3 + (0.7 * f)))
		var y0 = (drop(x0, L) + (r.range_value((-1), 1) * thick(x0, L)))
		var vx = (r.range_value(150, 270) * (0.55 + (0.45 * f)))
		var vy = (((r.range_value((-1), 1) * 110) * f) + r.range_value((-10), 20))
		var x = (x0 + (vx * age))
		var y = ((y0 + (vy * age)) + (((0.5 * G) * age) * age))
		var k = (float(age) / life)
		if ((((x > (L + 50)) if (x > (L + 50)) else (y > 40)) if ((x > (L + 50)) if (x > (L + 50)) else (y > 40)) else (y < (-28))) if (((x > (L + 50)) if (x > (L + 50)) else (y > 40)) if ((x > (L + 50)) if (x > (L + 50)) else (y > 40)) else (y < (-28))) else ((k > 0.75) and (r.next() < ((k - 0.75) * 4)))):
			return null
		if (r.next() < 0.45):
			p.px(x, y, (_C.WHITE if (k < 0.5) else C[int(6)]))
		else:
			_W.bead(p, x, y, vx, (vy + (G * age)), (2 if (r.next() < 0.2) else 1), C))
	_P.cycle(t, D, 12, (S + 4), func(g):
		return g.range_value(0.7, 1), func(age, life, r, _unused3=null):
		var k = (float(age) / life)
		var x = ((L * r.range_value(0.7, 1)) + (age * r.range_value(20, 45)))
		var y = ((drop(minf(x, L), L) + r.range_value((-5), 5)) + (age * r.range_value(4, 14)))
		var rad = (r.range_value(3, 5) + (k * r.range_value(5, 9)))
		var a = ((r.range_value(0.1, 0.18) * minf(1, (float(k) / 0.15))) * pow((1 - k), 1.5))
		p.disc(x, y, rad, C[int(6)], func(d, _unused1=null):
			return (a * (1 - (d * d)))))
	if true:
		var x = 0
		while (x < L):
			p.glow(x, drop(x, L), (14 + (x * 0.1)), C[int(4)], (0.26 * (1 - ((float(x) / L) * 0.5))))
			x += 10
	p.glow((L * 0.9), drop((L * 0.9), L), 26, C[int(5)], 0.22)
