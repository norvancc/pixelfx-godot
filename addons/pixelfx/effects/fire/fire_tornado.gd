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
## Source: src/fx/fire/fire-tornado.js
const META = {"id":"pixelfx.fire_tornado","name":"Fire tornado","desc":"A spinning funnel of fire: spiral bands turning round it, licks flung off its sides, a ring of flame whirling at its foot, embers orbiting it in and out of view.","tags":["fire","tornado","vortex","spell","aoe","loop"],"size":[120,152],"origin":[60,136],"duration":2,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"height":80,"seed":4},"cacheable":true,"layers":["front"]}
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
	return Rect2i(-156, -232, 312, 344)
var D = META.duration
var NL = _B.noise_for(D)
var SMOKE1 = _B.color("#5b5566")
var SPIN = 3
func draw(p, t: float, o: Dictionary) -> void:
	var F = _C.fit(o.palette, 9)
	var H = _B.hot_first(F)
	var S = o.seed
	var HT = o.height
	var ph = (float(t) / D)
	var N = func(rate, seed_value=0, off=0):
		return NL.call(t, rate, seed_value, off)
	var GLOW = _C.mix(_C.mix(H[int(3)], H[int(4)], 0.5), _C.WHITE, 0.25)
	var SMOKE = _C.mix(SMOKE1, H[int(6)], 0.25)
	var EMB = [H[int(1)], H[int(2)], H[int(4)], H[int(6)]]
	var cx = func(v, tt=t):
		return (((3.2 * sin(((v * 4.2) - (((float(tt) / D) * TAU) * 2)))) * v) + ((2 * sin(((float(tt) / D) * TAU))) * v))
	var rad = func(v):
		return (3.5 + (15 * pow(v, 1.35)))
	var spin = func(v, tt=t):
		return ((((float(tt) / D) * TAU) * SPIN) + (v * 5.5))
	var orbit = []
	_P.looped(t, D, 30, (S + 500), func(r, _unused1=null):
		return {"v0": r.range_value(0.02, 0.7), "rise": r.range_value(0.12, 0.3), "a": r.range_value(0, TAU), "w": r.range_value(4, 7), "out": r.range_value(4, 12), "life": r.range_value(1.2, 2.4), "big": r.chance(0.2)}, func(q, age, _unused2=null):
		var v = (q.v0 + (q.rise * age))
		var R = ((rad.call(minf(1, v)) + q.out) + (age * 4))
		var a = (q.a + (q.w * age))
		var k = (1 - (float(age) / q.life))
		var x = (cx.call(minf(1, v), t) + (cos(a) * R))
		var y = (((-v) * HT) + ((sin(a) * R) * 0.28))
		var z = sin(a)
		orbit.append({"x": x, "y": y, "z": z, "k": k, "vx": (((-sin(a)) * R) * q.w), "vy": (((cos(a) * R) * q.w) * 0.28), "big": q.big}))
	var embers = func(front):
		for e in orbit:
			if (((e.z >= 0) != front) if ((e.z >= 0) != front) else (e.k <= 0)):
				continue
			var sp = (sqrt((e.vx)*(e.vx) + (e.vy)*(e.vy)) if sqrt((e.vx)*(e.vx) + (e.vy)*(e.vy)) else 1)
			var L = minf(5, (1 + (sp * 0.025)))
			var c = (EMB[int(0)] if (e.k > 0.6) else (EMB[int(1)] if (e.k > 0.3) else EMB[int(2)]))
			p.line((e.x - ((float(e.vx) / sp) * L)), (e.y - ((float(e.vy) / sp) * L)), e.x, e.y, func(u):
				return (c if (u > 0.6) else (EMB[int(3)] if front else H[int(7)])))
			if front:
				p.glow(e.x, e.y, 4, c, (0.4 * e.k))
			else:
				p.glow(e.x, e.y, 3, c, (0.15 * e.k))
	var ring = func(front):
		if true:
			var i = 0
			while (i < 12):
				var a = (((float(i) / 12) * TAU) + (((float(t) / D) * TAU) * 2))
				var z = sin(a)
				if ((z >= 0) != front):
					i += 1.0
					continue
				var n = (((S * 3) + i) * 19)
				var R = (12 + (2 * N.call(2, n)))
				var x = (cos(a) * R)
				var y = ((z * R) * 0.25)
				var h = ((5 + (5 * (0.5 + (0.5 * N.call(5, (n + 1)))))) * (1 if front else 0.8))
				_F.flame_tongue(p, x, y, h, 1.6, ((-cos((a + (float(PI) / 2)))) * 3), N, n, H, (_F.LAYERS if front else _F.BACK_LAYERS))
				i += 1.0
	_P.looped(t, D, 20, (S + 300), func(r, _unused1=null):
		return {"a": r.range_value(0, TAU), "life": r.range_value(1.2, 2), "s": r.range_value(2.5, 4), "vy": (-r.range_value(12, 22))}, func(q, age, _unused2=null):
		var R = (rad.call(1) * (0.8 + (age * 0.5)))
		var a = (q.a + (age * 3))
		var x = (cx.call(1, (t - age)) + (cos(a) * R))
		var y = ((((-HT) - 2) + (q.vy * age)) + ((sin(a) * R) * 0.25))
		_F.smoke_puff(p, x, y, (1 - (float(age) / q.life)), q.s, SMOKE))
	_F.floor_light(p, 0, 0.5, 40, 8, GLOW, 0.4)
	embers.call(false)
	ring.call(false)
	var fl = (0.85 + (0.15 * N.call(7, (S + 1))))
	if true:
		var y = 0
		while (y >= ((-HT) * 1.2)):
			var v = (float((-y)) / HT)
			var vv = minf(1, v)
			var c = cx.call(vv)
			var r = (rad.call(vv) * (1 + (0.08 * N.call(3, (S + 2), (y * 0.1)))))
			var sp = spin.call(v)
			var cut = clampf((float((v - 0.72)) / 0.42), 0.0, 1.0)
			var lickL = (0.3 * maxf(0, _M.pnoise((((-y) * 0.22) + (ph * 18)), 18, (S + 3))))
			var lickR = (0.3 * maxf(0, _M.pnoise(((((-y) * 0.22) + (ph * 18)) + 9), 18, (S + 4))))
			if true:
				var x = floori((c - (r * 1.35)))
				while (x <= ceili((c + (r * 1.35)))):
					var dx = (float(((x + 0.5) - c)) / r)
					var edge = (1 + (lickL if (dx < 0) else lickR))
					if (absf(dx) > edge):
						x += 1.0
						continue
					var th = asin(clampf(dx, (-1), 1))
					var depth = cos(th)
					var tear = (0.18 * _M.pnoise((((y * 0.45) + (dx * 2)) - (ph * 30)), 30, (S + 6)))
					var band = (0.5 + (0.5 * sin((((th + sp) + tear) * 3))))
					var streak = ((band * band) * band)
					if ((cut > 0) and (band < ((0.35 + (cut * 0.6)) + (0.1 * _M.pnoise(((x * 0.7) + (ph * 20)), 20, (S + 5)))))):
						x += 1.0
						continue
					var heat = (((((0.22 + (0.36 * depth)) + (0.5 * streak)) - (0.22 * vv)) + (0.1 * (1 - vv))) - (0.25 * cut))
					if (absf(dx) > 1):
						heat = (0.3 - ((absf(dx) - 1) * 1.5))
					heat *= fl
					var col = (H[int(0)] if (heat > 0.95) else (H[int(1)] if (heat > 0.82) else (H[int(2)] if (heat > 0.7) else (H[int(3)] if (heat > 0.58) else (H[int(4)] if (heat > 0.46) else (H[int(5)] if (heat > 0.34) else (H[int(6)] if (heat > 0.2) else H[int(7)])))))))
					p.px(x, y, col)
					x += 1.0
			if ((fmod(y, 10) == 0) and (v <= 1)):
				p.glow(c, y, ((r * 2) + 8), GLOW, (0.22 * fl))
			y -= 1.0
	_P.looped(t, D, 70, (S + 200), func(r, _unused1=null):
		return {"v": r.range_value(0.05, 0.95), "side": r.sign_value(), "sp": r.range_value(20, 50), "life": r.range_value(0.25, 0.5), "s": r.range_value(1.4, 2.8), "f": r.next()}, func(q, age, _unused2=null):
		var tb = (t - age)
		var x0 = (cx.call(q.v, tb) + (q.side * rad.call(q.v)))
		var y0 = ((-q.v) * HT)
		var _tuple1 = _P.drift(x0, y0, (q.side * q.sp), ((-q.sp) * 0.6), age, 0, (-60), 3, 3)
		var x = _tuple1[0]
		var y = _tuple1[1]
		_F.fire_puff(p, x, y, (1 - (float(age) / q.life)), q.s, q.f, H, 0.1, ((-q.side) * 0.6), (-0.8)))
	ring.call(true)
	embers.call(true)
	p.glow(0, ((-HT) * 0.5), 80, GLOW, (0.28 * fl))
	p.glow(0, (-6), 18, H[int(2)], (0.3 * fl))
