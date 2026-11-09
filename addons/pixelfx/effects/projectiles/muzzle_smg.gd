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
## Source: src/fx/projectiles/muzzle-smg.js
const META = {"id":"pixelfx.muzzle_smg","name":"SMG burst","desc":"Sustained fire at twelve rounds a second: each shot a different spiky flash with a white core, sparks, smoke wisps piling up and drifting, brass casings bouncing on the floor.","tags":["projectile","muzzle","gun","automatic","flash","smoke","casing","directional","loop"],"size":[112,72],"origin":[56,66],"duration":1,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"brass":["#4a2e10","#8c5c1c","#d9a441","#ffe39a"],"smoke":["#26222e","#3b3644","#544e5e","#6f6979","#8c8596","#aca5b5","#cbc4d2"],"height":26,"seed":6},"cacheable":true,"layers":["front"]}
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
			var limits = {"height":[8,80]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-152, -216, 304, 372)
var SHOTS = 12
var F1 = (float(1) / 30)
func shots(t, D, life, fn):
	if true:
		var s = 0
		while (s < SHOTS):
			if true:
				var age = fposmod(((t - (float((s * D)) / SHOTS)) + 1e-7), D)
				while (age < life):
					fn.call(s, age)
					age += D
			s += 1.0
func draw(p, t: float, o: Dictionary) -> void:
	var F = _C.fit(o.palette, 9)
	var B = _C.fit(o.brass, 4)
	var SM = _C.fit(o.smoke, 7)
	var S = o.seed
	var D = META.duration
	var H = o.height
	var MX = 0
	var MY = (-H)
	var SP = [F[int(7)], F[int(6)], F[int(4)], F[int(3)]]
	var top = ((-META.origin[int(1)]) + 1)
	var pop_box = [0.0]
	shots(t, D, 0.2, func(s, age):
		pop_box[0] = maxf(pop_box[0], exp((float((-(age + 0.008))) / 0.035)))
		return pop_box[0])
	var puffs = []
	shots(t, D, 2.2, func(s, age):
		if true:
			var j = 0
			while (j < 3):
				var r = _M.rng([S, s, j, 3])
				var life = r.range_value(1.5, 2.2)
				var dl = (j * 0.03)
				if ((age < dl) if (age < dl) else ((age - dl) >= life)):
					j += 1.0
					continue
				var a = (age - dl)
				var k = (float(a) / life)
				var port = (j == 2)
				var vx = (r.range_value((-12), 6) if port else (r.range_value(45, 100) * (1 - (j * 0.4))))
				var vy = ((-r.range_value(14, 26)) if port else (-r.range_value(4, 16)))
				var x = (((((-7) if port else (MX + 3)) + (float((vx * (1 - exp(((-3.2) * a))))) / 3.2)) - ((r.range_value(3, 7) * a) * a)) + ((sin(((a * 2.1) + r.range_value(0, TAU))) * a) * 2.5))
				var y = ((((MY - 2) if port else MY) + (float((vy * (1 - exp(((-2.4) * a))))) / 2.4)) - (((0.5 * r.range_value(9, 16)) * a) * a))
				var rad = ((1 if port else 1.2) + (r.range_value(2, 4.5) * (1 - exp(((-1.4) * a)))))
				if ((y - rad) < (top + 1)):
					j += 1.0
					continue
				var edge = minf(1, (float(((y - rad) - top)) / 12))
				puffs.append({"x": x, "y": y, "r": rad, "a": (((minf(1, (a * 10)) * pow((1 - k), 1.6)) * (0.24 if port else 0.34)) * edge), "b": clampf((0.92 - (k * 0.6)), 0.0, 1.0), "w": (pop_box[0] * exp((float((-sqrt(((x - MX))*((x - MX)) + ((y - MY))*((y - MY))))) / 9)))})
				j += 1.0)
	_J.cloud(p, puffs, SM, [SM[int(0)], _C.mix(F[int(1)], SM[int(1)], 0.5), _C.mix(F[int(2)], SM[int(2)], 0.4), F[int(3)], F[int(4)], F[int(5)], F[int(7)]], {"dens": 1.4, "max": 0.7, "lit": 1.3})
	shots(t, D, D, func(s, age):
		var r = _M.rng([S, s, 7])
		var k = _B.casing((-7), (MY - 1), (-r.range_value(18, 48)), (-r.range_value(85, 135)), (r.sign_value() * r.range_value(20, 32)), age, 850, (-0.5), 0.42, r.range_value(0, TAU))
		_B.draw_casing(p, k, B, clampf((float((D - age)) / 0.25), 0.0, 1.0)))
	shots(t, D, (2 * F1), func(s, age):
		var r = _M.rng([S, s])
		var f = (1 if (age < F1) else 2)
		var tilt = r.range_value((-0.06), 0.06)
		var L = _B.flash_shape(r, f, {"size": r.range_value(0.95, 1.2), "spike": [12, 21], "diag": [6, 11], "cross": [4, 7.5], "back": [2.5, 5]})
		var C = ([_C.WHITE, F[int(7)], F[int(6)], F[int(3)]] if (f == 1) else [F[int(7)], F[int(6)], F[int(4)], F[int(2)]])
		_B.flash(p, MX, MY, tilt, L, C, ((s * 7) + f)))
	shots(t, D, 0.3, func(s, age):
		if true:
			var j = 0
			while (j < 5):
				var r = _M.rng([S, s, j, 11])
				var life = (r.range_value(0.05, 0.16) * (1.8 if (j > 2) else 1))
				if (age >= life):
					j += 1.0
					continue
				var a = r.range_value((-0.3), 0.3)
				var sp = (r.range_value(170, 380) * (0.5 if (j > 2) else 1))
				var _tuple1 = _P.fly((MX + 2), MY, (cos(a) * sp), (sin(a) * sp), age, 420, 2.2)
				var x = _tuple1[0]
				var y = _tuple1[1]
				var _tuple2 = _P.fly_v((cos(a) * sp), (sin(a) * sp), age, 420, 2.2)
				var vx = _tuple2[0]
				var vy = _tuple2[1]
				if (j > 2):
					p.px(x, y, (F[int(6)] if ((float(age) / life) < 0.5) else F[int(4)]))
				else:
					_B.spark(p, x, y, vx, vy, (1 - (float(age) / life)), SP, 0.45, 0.011)
				j += 1.0)
	shots(t, D, 0.15, func(s, age):
		var k = exp((float((-(age + 0.008))) / 0.03))
		p.glow((MX + 4), MY, 26, F[int(4)], (0.8 * k))
		p.glow((MX + 2), MY, 7, _C.WHITE, (0.45 * k))
		p.glow((MX + 2), 0, 12, F[int(4)], (0.16 * k)))
