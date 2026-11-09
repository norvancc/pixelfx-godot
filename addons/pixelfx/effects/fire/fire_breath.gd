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
## Source: src/fx/fire/fire-breath.js
const META = {"id":"pixelfx.fire_breath","name":"Fire breath","desc":"A roaring cone of fire streaming right from the mouth: white-hot at the lips, billowing out and cooling to red and smoke at its edges, sparks thrown out ahead.","tags":["fire","breath","dragon","stream","cone","directional","loop"],"size":[160,116],"origin":[12,72],"duration":1.5,"loop":true,"fps":30,"bg":"dark","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"spread":0.24,"speed":320,"seed":6},"cacheable":true,"layers":["front"]}
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
			var limits = {"spread":[0.12,0.36],"speed":[0,520]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-108, -168, 352, 308)
var D = META.duration
var NL = _B.noise_for(D)
var SMOKE1 = _B.color("#5b5566")
var COOL_LAYERS = [[1, 1, 7], [0.72, 0.82, 6], [0.44, 0.58, 5]]
var JET = [[42, 4.2, 0], [32, 3.8, (-0.08)], [30, 3.8, 0.08], [20, 4.6, 0]]
func draw(p, t: float, o: Dictionary) -> void:
	var F = _C.fit(o.palette, 9)
	var H = _B.hot_first(F)
	var S = o.seed
	var A = o.spread
	var V = o.speed
	var N = func(rate, seed_value=0, off=0):
		return NL.call(t, rate, seed_value, off)
	var GLOW = _C.mix(_C.mix(H[int(3)], H[int(4)], 0.5), _C.WHITE, 0.25)
	var SMOKE = _C.mix(SMOKE1, H[int(6)], 0.3)
	var SPARKS = [H[int(1)], H[int(2)], H[int(4)], H[int(5)]]
	var EMB = [H[int(1)], H[int(2)], H[int(4)], H[int(6)]]
	var roar = func(tt):
		return (0.85 + (0.15 * NL.call(tt, 3, (S + 1))))
	var sway = func(tt):
		return (NL.call(tt, 1.3, (S + 2)) * 0.05)
	var fire = []
	var smoke = []
	_P.looped(t, D, 260, (S + 100), func(r, _unused1=null):
		var e = r.range_value((-1), 1)
		var fl = (r.range_value(0.42, 0.8) * (1 - (0.3 * absf(e))))
		var sm = r.chance((0.2 + (0.4 * absf(e))))
		return {"e": e, "sp": r.range_value(0.75, 1.1), "fl": fl, "sm": sm, "sl": r.range_value(0.5, 0.85), "s": r.range_value(3, 5.2), "f": r.next(), "ox": r.range_value(4, 10), "life": (fl + (0.85 if sm else 0))}, func(q, age, _unused2=null):
		var tb = (t - age)
		var a = (((q.e * A) + sway.call(tb)) - 0.04)
		var v = ((V * q.sp) * roar.call(tb))
		var ta = minf(age, q.fl)
		var _tuple1 = _P.drift(q.ox, (q.e * 1.5), (cos(a) * v), (sin(a) * v), ta, 0, (-100), 2, 2.4)
		var x = _tuple1[0]
		var y = _tuple1[1]
		var vx = _tuple1[2]
		var vy = _tuple1[3]
		if (age < q.fl):
			fire.append([age, x, y, q])
			return null
		if ((not q.sm) if (not q.sm) else ((age - q.fl) > q.sl)):
			return null
		var sa = (age - q.fl)
		var _tuple2 = _P.drift(x, y, (vx * 0.5), ((vy * 0.6) - 8), sa, 0, (-26), 1.8, 1.2)
		var sx = _tuple2[0]
		var sy = _tuple2[1]
		smoke.append([sa, sx, sy, q]))
	for _tuple3 in smoke:
		var sa = _tuple3[0]
		var x = _tuple3[1]
		var y = _tuple3[2]
		var q = _tuple3[3]
		_F.smoke_puff(p, x, y, (1 - (float(sa) / q.sl)), (q.s * 1.1), SMOKE, true, 0.7)
	fire.sort_custom(func(a, b):
		return ((b[int(0)] - a[int(0)]) < 0))
	for _tuple4 in fire:
		var age = _tuple4[0]
		var x = _tuple4[1]
		var y = _tuple4[2]
		var q = _tuple4[3]
		var u = (float(age) / q.fl)
		var edge = absf(q.e)
		var size = (q.s * (0.75 + (1.6 * u)))
		var heat = minf(0.999, ((pow(u, 1.5) * (0.85 + (0.2 * edge))) + ((0.3 * edge) * edge)))
		var tear = clampf((float((u - 0.32)) / 0.2), 0.0, 1.0)
		_F.fire_puff(p, x, y, (1 - heat), (size * (1 - (0.55 * tear))), q.f, H, 0.1, (-0.5), (-0.86))
		if (tear > 0):
			var n = floori((q.f * 100000))
			var h = (((size * (1.5 + (0.5 * N.call(4, n)))) * (1.2 - (heat * 0.6))) * tear)
			_F.flame_tongue(p, x, (y + (size * 0.3)), h, ((size * 0.5) * (1.1 - (heat * 0.5))), (((-h) * 0.4) + (N.call(2.5, (n + 1)) * 2)), N, n, H, (_F.LAYERS if (heat < 0.45) else (_F.BACK_LAYERS if (heat < 0.72) else COOL_LAYERS)))
	if true:
		var i = 0
		while (i < 6):
			var n = (((S * 3) + i) * 19)
			var side = (1 if fmod(i, 2) else (-1))
			var d = ((18 + ((int(i) >> int(1)) * 16)) + (N.call(2, n) * 4))
			var L = ((9 + (5 * (0.5 + (0.5 * N.call(5, (n + 1)))))) * (1 - (float(d) / 120)))
			var ex = d
			var ey = ((((side * d) * A) * 0.85) - (d * 0.06))
			_F.flame_blade(p, ex, ey, 0.75, ((side * 0.45) - 0.48), L, (1.6 + (L * 0.08)), ((-side) * 3), N, n, H, _F.LAYERS)
			i += 1.0
	_P.looped(t, D, 70, (S + 250), func(r, _unused1=null):
		return {"e": r.range_value((-0.6), 0.6), "v": r.range_value(330, 470), "life": r.range_value(0.12, 0.26), "l": r.range_value(4, 9)}, func(q, age, _unused2=null):
		var a = ((q.e * A) - 0.03)
		var _tuple5 = _P.drift(6, (q.e * 2), (cos(a) * q.v), (sin(a) * q.v), age, 0, (-60), 2, 2)
		var x = _tuple5[0]
		var y = _tuple5[1]
		var vx = _tuple5[2]
		var vy = _tuple5[3]
		var sp = sqrt((vx)*(vx) + (vy)*(vy))
		var k = (1 - (float(age) / q.life))
		var L = (q.l * (float(sp) / 400))
		p.line((x - ((float(vx) / sp) * L)), (y - ((float(vy) / sp) * L)), x, y, func(u):
			return ((H[int(0)] if (k > 0.5) else H[int(1)]) if (u > 0.6) else (H[int(2)] if (k > 0.5) else H[int(3)]))))
	_B.each_indexed(JET, func(_arg0, i):
		var len = _B.at(_arg0, 0)
		var w = _B.at(_arg0, 1)
		var a = _B.at(_arg0, 2)
		var n = (((S * 5) + i) * 17)
		var L = ((len * roar.call(t)) * (0.85 + (0.2 * N.call(5, n))))
		var aa = (a + sway.call(t))
		_F.flame_blade(p, 0, 0, cos(aa), sin(aa), L, w, (N.call(3, (n + 3)) * 3), N, n, H, _F.LAYERS, 0.5, 1.5))
	_P.looped(t, D, 40, (S + 300), func(r, _unused1=null):
		return {"d": r.range_value(4, 60), "e": r.range_value((-1), 1), "v": r.range_value(140, 280), "life": r.range_value(0.25, 0.55)}, func(q, age, _unused2=null):
		var a = (((q.e * A) * 1.8) - 0.12)
		var _tuple6 = _P.drift(q.d, ((q.e * q.d) * A), (cos(a) * q.v), ((sin(a) * q.v) - 30), age, 0, 190, 2, 2)
		var x = _tuple6[0]
		var y = _tuple6[1]
		var vx = _tuple6[2]
		var vy = _tuple6[3]
		_F.spark(p, x, y, vx, vy, (1 - (float(age) / q.life)), SPARKS))
	_P.looped(t, D, 18, (S + 400), func(r, _unused1=null):
		return {"x": r.range_value(50, 100), "y": r.range_value((-14), 6), "vx": r.range_value(10, 40), "vy": (-r.range_value(20, 50)), "life": r.range_value(0.8, 1.4), "s": (2 if r.chance(0.2) else 1), "ph": r.range_value(0, 6.3)}, func(q, age, _unused2=null):
		var _tuple7 = _P.drift(q.x, q.y, q.vx, q.vy, age, 0, (-30), 1.6, 1.6)
		var x = _tuple7[0]
		var y = _tuple7[1]
		_F.ember(p, (x + (5 * (sin(((age * 2.3) + q.ph)) - sin(q.ph)))), y, (1 - (float(age) / q.life)), q.s, EMB, ((age * 40) + q.ph)))
	var k = roar.call(t)
	p.glow(3, 0, (34 * k), GLOW, (0.75 * k))
	p.glow(3, 0, 10, H[int(0)], 0.55)
	if true:
		var d = 10
		while (d < 126):
			p.glow(d, ((-d) * 0.1), (10 + (d * 0.2)), GLOW, ((0.32 * k) * (1 - (float(d) / 150))))
			d += 8
	p.glow(64, (-12), 96, GLOW, (0.16 * k))
