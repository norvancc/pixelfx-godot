@tool
extends "../../core/effect.gd"
## Native port of pinned PixelFX 0.3.0 algorithms; MIT (c) Patch / Hugo Duprez.
const _C = preload("../../core/color.gd")
const _M = preload("../../core/math.gd")
const _P = preload("../../core/particles.gd")
const _S = preload("../../core/sim.gd")
const _E = preload("../../core/ease.gd")
const _A = preload("../analytic_helpers.gd")
const _F = preload("../fire_common.gd")
const _B = preload("b2_common.gd")
## Source: src/fx/fire/flamethrower.js
const META = {"id":"pixelfx.flamethrower","name":"Flamethrower","desc":"A pressurised jet shooting right: a blue pilot at the nozzle, a tight stream with surges racing down it, a sputter, burning drops falling off, a tip that curls up into smoke.","tags":["fire","flamethrower","stream","weapon","directional","loop"],"size":[184,104],"origin":[30,60],"duration":1.6,"loop":true,"fps":30,"bg":"dark","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"pilot":["#1b2a8a","#3a62e0","#a8d4ff"],"reach":112,"speed":280,"seed":3},"cacheable":true,"layers":["front"]}
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
			var limits = {"reach":[64,160],"speed":[60,520]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-174, -156, 472, 296)
var D = META.duration
var NL = _B.noise_for(D)
var SOOT = _B.color("#2a2430")
var COUGH = 0.55
func flow(te):
	var u = fmod((fmod(te, D) + D), D)
	return ((1 - (_M.smooth(COUGH, (COUGH + 0.04), u) * (1 - _M.smooth((COUGH + 0.1), (COUGH + 0.16), u)))) + (0.25 * exp((-((float(((u - COUGH) - 0.2)) / 0.05) ** 2)))))
func draw(p, t: float, o: Dictionary) -> void:
	var F = _C.fit(o.palette, 9)
	var H = _B.hot_first(F)
	var PL = _C.fit(o.pilot, 3)
	var S = o.seed
	var L = o.reach
	var V = o.speed
	var N = func(rate, seed_value=0, off=0):
		return NL.call(t, rate, seed_value, off)
	var GLOW = _C.mix(_C.mix(H[int(3)], H[int(4)], 0.5), _C.WHITE, 0.25)
	var SPARKS = [H[int(1)], H[int(2)], H[int(4)], H[int(5)]]
	var SMOKE = _C.mix(SOOT, H[int(7)], 0.3)
	var cy = func(x):
		return ((5 * ((float(x) / L) ** 2)) + ((N.call(1.2, (S + 9), (x * 0.02)) * 2.2) * ((float(x) / L) ** 1.5)))
	var width = func(x):
		return ((2.1 + (5 * pow((float(x) / L), 0.7))) * flow((t - (float(x) / V))))
	var fire = []
	var smoke = []
	_P.looped(t, D, 80, (S + 100), func(r, _unused1=null):
		return {"a0": r.range_value((-0.3), 0.5), "R": r.range_value(9, 15), "w": r.range_value(5, 7.5), "up": r.range_value(4, 12), "dx": r.range_value((-6), 2), "fl": r.range_value(0.38, 0.62), "sl": r.range_value(0.6, 1), "s": r.range_value(2.4, 4.4), "f": r.next(), "life": 1.6}, func(q, age, _unused2=null):
		var tb = (t - age)
		var k = flow((tb - (float(L) / V)))
		if (k < 0.4):
			return null
		var x0 = (L + q.dx)
		var y0 = cy.call(L)
		var a = ((minf(age, q.fl) * q.w) + q.a0)
		var x = (x0 + (q.R * sin(a)))
		var y = ((y0 - (q.R * (1 - cos(a)))) - (q.up * age))
		if (age < q.fl):
			fire.append([(float(age) / q.fl), x, y, q, k])
			return null
		if ((age - q.fl) < q.sl):
			smoke.append([(float((age - q.fl)) / q.sl), (x - ((age - q.fl) * 6)), (y - ((age - q.fl) * 16)), q]))
	for _tuple1 in smoke:
		var u = _tuple1[0]
		var x = _tuple1[1]
		var y = _tuple1[2]
		var q = _tuple1[3]
		_F.smoke_puff(p, x, y, (1 - u), (q.s * 1.2), SMOKE, true, 0.85)
	fire.sort_custom(func(a, b):
		return ((b[int(0)] - a[int(0)]) < 0))
	for _tuple2 in fire:
		var u = _tuple2[0]
		var x = _tuple2[1]
		var y = _tuple2[2]
		var q = _tuple2[3]
		var k = _tuple2[4]
		_F.fire_puff(p, x, y, (1 - u), ((q.s * (0.8 + (1.1 * u))) * k), q.f, H, 0.1)
	if true:
		var i = 0
		while (i < 13):
			var n = (((S * 3) + i) * 19)
			var ph = fmod(((i * 0.618) + (float(t) / D)), 1)
			var x = (10 + (ph * (L - 14)))
			var k = flow((t - (float(x) / V)))
			if (k < 0.35):
				i += 1.0
				continue
			var h = ((((2 + (11 * (float(x) / L))) * (0.55 + (0.6 * (0.5 + (0.5 * N.call(5, (n + 1))))))) * k) * minf(1, ((1 - ph) * 6)))
			_F.flame_tongue(p, x, (cy.call(x) - (width.call(x) * 0.6)), h, (1.1 + (1.6 * (float(x) / L))), ((-h) * 0.55), N, n, H, _F.LAYERS)
			i += 1.0
	var P = _M.js_round((D * 3))
	if true:
		var x = 0
		while (x <= L):
			var c = cy.call(x)
			var w = (width.call(x) * (1 + (0.15 * _M.pnoise(((x * 0.4) - ((float(t) / D) * 24)), 24, (S + 4)))))
			if (w < 0.4):
				x += 1.0
				continue
			var surge = (1 if (fmod((fmod(((x * 0.035) - ((float(t) / D) * P)), 1) + 1), 1) < 0.12) else 0)
			if true:
				var y = floori(((c - w) - 1))
				while (y <= ceili(((c + w) + 1))):
					var q = (float(absf(((y + 0.5) - c))) / w)
					if (q > 1.15):
						y += 1.0
						continue
					var lvl = ((0 if (q < 0.3) else (1 if (q < 0.55) else (2 if (q < 0.78) else (3 if (q < 1) else 4)))) + (1 if ((x > (L * 0.45)) and (q < 0.55)) else 0))
					lvl = maxf(0, minf(4, (lvl - surge)))
					if ((lvl == 4) and (_M.pnoise((((x * 0.5) + (y * 7.3)) - ((float(t) / D) * 40)), 40, (S + 6)) < 0)):
						y += 1.0
						continue
					p.px(x, y, [H[int(0)], H[int(2)], H[int(4)], H[int(6)], H[int(7)]][int(lvl)])
					y += 1.0
			for ph in [0, PI]:
				var a = (((x * 0.22) - ((((float(t) / D) * PI) * 2) * 9)) + ph)
				var sy = (c + ((sin(a) * w) * 0.55))
				if ((cos(a) > (-0.1)) and (w > 1.2)):
					p.px(x, sy, (H[int(0)] if (cos(a) > 0.55) else H[int(1)]))
			x += 1.0
	var pk = flow(t)
	if true:
		var x = 0
		while (x < 6):
			if true:
				var y = (-2)
				while (y <= 2):
					if (absf(y) <= (2 - (x * 0.3))):
						p.px(x, y, ((PL[int(2)] if (x < 2) else PL[int(1)]) if (absf(y) < 1) else PL[int(0)]))
					y += 1.0
			x += 1.0
	_F.solid(p, 1, 0, (1.6 * pk), _C.WHITE)
	_P.looped(t, D, 10, (S + 200), func(r, _unused1=null):
		return {"d": r.range_value(20, 95), "vx": r.range_value(0.3, 0.6), "vy": r.range_value((-25), 15), "life": r.range_value(0.35, 0.6)}, func(q, age, _unused2=null):
		var tb = (t - age)
		if (flow((tb - (float(q.d) / V))) < 0.5):
			return null
		var at = func(a):
			return _P.drift(q.d, cy.call(q.d), (V * q.vx), q.vy, a, 0, 260, 1.2, 0.5)
		if true:
			var j = 4
			while (j >= 1):
				var a = (age - (j * 0.035))
				if (a < 0):
					j -= 1.0
					continue
				var _tuple3 = at.call(a)
				var x = _tuple3[0]
				var y = _tuple3[1]
				_F.fire_puff(p, x, y, (1 - minf(0.99, ((j * 0.18) + ((float(age) / q.life) * 0.4)))), (1.8 - (j * 0.25)), 0.3, H, 0.06)
				j -= 1.0
		var _tuple4 = at.call(age)
		var x = _tuple4[0]
		var y = _tuple4[1]
		var k = (1 - (float(age) / q.life))
		p.px(x, y, (H[int(0)] if (k > 0.5) else H[int(2)]))
		p.px((x + 1), y, H[int(3)])
		p.glow(x, y, 6, H[int(3)], (0.45 * k)))
	_P.looped(t, D, 12, (S + 300), func(r, _unused1=null):
		return {"born": (COUGH + r.range_value(0, 0.08)), "a": r.range_value((-0.8), 0.8), "v": r.range_value(120, 240), "life": r.range_value(0.2, 0.45)}, func(q, age, _unused2=null):
		var u = fmod((fmod((t - age), D) + D), D)
		if (absf((u - q.born)) > 0.06):
			return null
		var _tuple5 = _P.drift(4, 0, (cos(q.a) * q.v), (sin(q.a) * q.v), age, 0, 300, 2.5, 2.5)
		var x = _tuple5[0]
		var y = _tuple5[1]
		var vx = _tuple5[2]
		var vy = _tuple5[3]
		_F.spark(p, x, y, vx, vy, (1 - (float(age) / q.life)), SPARKS))
	_P.looped(t, D, 5, (S + 350), func(r, _unused1=null):
		return {"born": (COUGH + r.range_value(0.01, 0.1)), "v": r.range_value(90, 170), "vy": r.range_value((-30), 10), "life": r.range_value(0.25, 0.4), "s": r.range_value(1.6, 2.6)}, func(q, age, _unused2=null):
		var u = fmod((fmod((t - age), D) + D), D)
		if (absf((u - q.born)) > 0.05):
			return null
		var _tuple6 = _P.drift(4, 0, q.v, q.vy, age, 0, 200, 2, 1)
		var x = _tuple6[0]
		var y = _tuple6[1]
		_F.fire_puff(p, x, y, (1 - (float(age) / q.life)), q.s, 0.2, H, 0.1, (-0.86), (-0.5)))
	var u = fmod((fmod(t, D) + D), D)
	var a = (u - COUGH)
	if ((a > 0) and (a < 0.7)):
		_F.smoke_puff(p, (8 + (a * 20)), ((-a) * 18), (1 - (float(a) / 0.7)), 3, SMOKE, false, 0.8)
	p.glow(2, 0, (34 * pk), GLOW, (0.8 * pk))
	p.glow(2, 0, 9, PL[int(2)], (0.45 * pk))
	if true:
		var d = 8
		while (d <= L):
			p.glow(d, cy.call(d), (12 + (d * 0.16)), GLOW, (0.3 * flow((t - (float(d) / V)))))
			d += 8
	p.glow(L, (cy.call(L) - 10), 52, GLOW, (0.34 * flow((t - (float(L) / V)))))
