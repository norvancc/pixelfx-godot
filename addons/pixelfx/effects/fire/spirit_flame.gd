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
## Source: src/fx/fire/spirit-flame.js
const META = {"id":"pixelfx.spirit_flame","name":"Spirit flame","desc":"A cold blue-teal ghost fire floating in the air: a bright rim round a hollow dark heart, a wave climbing its wispy tail, curls breaking off, cold sparks rising.","tags":["fire","spirit","ghost","magic","cold","ambient","loop"],"size":[80,124],"origin":[40,94],"duration":3,"loop":true,"fps":30,"bg":"dark","options":{"palette":["#040a16","#08203a","#0b3a52","#0f5e6e","#16908e","#2cc4b4","#7ef0dc","#c8fff2","#ffffff"],"seed":7},"cacheable":true,"layers":["front"]}
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
	return Rect2i(-136, -190, 272, 316)
var D = META.duration
var NL = _B.noise_for(D)
var GHOST = [[1, 1, 1], [0.8, 0.92, 3], [0.6, 0.78, 6], [0.3, 0.42, 2], [0.14, 0.22, 0]]
func ghostTongue(p, x, y, h, w, centre, N, n, H, layers, jit=0.5):
	for _tuple1 in layers:
		var lw = _tuple1[0]
		var lh = _tuple1[1]
		var ri = _tuple1[2]
		var L = (h * lh)
		var c = H[int(ri)]
		if true:
			var r = 0
			while (r <= L):
				var u = (float(r) / maxf(1, L))
				var v = (float(r) / h)
				var half = ((((w * lw) * pow((1 - u), 0.75)) * minf(1, (float((r + 1.5)) / 4))) + ((N.call(6, n, (r * 0.4)) * jit) * u))
				if (half < 0.3):
					r += 1.0
					continue
				var cx = (x + centre.call(v, r))
				var Y = _M.js_round((y - r))
				if true:
					var px = _M.js_round((cx - half))
					var x1 = _M.js_round((cx + half))
					while (px <= x1):
						p.px(px, Y, c)
						px += 1.0
				r += 1.0
func draw(p, t: float, o: Dictionary) -> void:
	var F = _C.fit(o.palette, 9)
	var H = _B.hot_first(F)
	var S = o.seed
	var ph = (float(t) / D)
	var N = func(rate, seed_value=0, off=0):
		return NL.call(t, rate, seed_value, off)
	var COLD = _C.mix(H[int(3)], _C.WHITE, 0.15)
	var bob = (sin((ph * TAU)) * 1.5)
	var lean = (N.call(0.67, (S + 2)) * 3)
	var wave = func(v, r, k=0):
		return (((((sin((((r * 0.24) - ((ph * TAU) * 2)) + k)) * 2.2) + (sin((((r * 0.11) - (ph * TAU)) + (k * 0.5))) * 3.2)) * v) * v) + ((lean * v) * v))
	var H0 = (44 * (0.92 + (0.08 * N.call(1.3, (S + 3)))))
	var y0 = bob
	var br = (0.9 + (0.1 * N.call(2, (S + 4))))
	p.glow(0, (y0 - 16), 60, COLD, (0.36 * br))
	p.glow((wave.call(0.5, 20) * 0.5), (y0 - 20), 26, H[int(2)], (0.2 * br))
	_P.looped(t, D, 40, (S + 300), func(r, _unused1=null):
		return {"x": r.range_value((-4), 4), "y": ((-H0) * r.range_value(0.55, 0.95)), "vx": r.range_value((-7), 7), "vy": (-r.range_value(10, 22)), "life": r.range_value(1, 1.9), "s": r.range_value(1.4, 2.8), "a": r.range_value(0, TAU), "w": r.range_value(2, 3.5)}, func(q, age, _unused2=null):
		var tb = (t - age)
		var _tuple2 = _P.drift((q.x + (wave.call(0.9, 26, 0) * 0.5)), (q.y + y0), q.vx, q.vy, age, 0, (-6), 1.2, 0.6)
		var x = _tuple2[0]
		var y = _tuple2[1]
		var k = (1 - (float(age) / q.life))
		var cx = (x + ((sin(((age * q.w) + q.a)) * 3) * (age + 0.2)))
		var a = (minf(1, (age * 5)) * k)
		_F.soft(p, cx, y, (q.s * (0.8 + (age * 0.8))), H[int(4)], (0.35 * a))
		_F.soft(p, (cx - 0.4), (y - 0.6), ((q.s * 0.5) * (0.8 + (age * 0.5))), H[int(2)], ((0.4 * a) * k))
		p.glow(cx, y, 6, H[int(3)], (0.15 * a)))
	var wl = maxf(0, (0.25 + (0.55 * N.call(1.7, (S + 6)))))
	var wr = maxf(0, (0.25 + (0.55 * N.call(1.7, (S + 7)))))
	if (wl > 0.12):
		ghostTongue(p, (-4), (y0 - 4), (H0 * wl), 2.4, func(v, r):
			return ((wave.call(v, r, 2.1) - ((6 * v) * v)) + ((3 * sin(((v * 5) - ((ph * TAU) * 2)))) * v)), N, ((S * 11) + 1), H, GHOST)
	if (wr > 0.12):
		ghostTongue(p, 4.2, (y0 - 4), (H0 * wr), 2.4, func(v, r):
			return ((wave.call(v, r, (-1.8)) + ((6 * v) * v)) - ((3 * sin((((v * 5) - ((ph * TAU) * 2)) + 1))) * v)), N, ((S * 11) + 2), H, GHOST)
	ghostTongue(p, 0, y0, H0, 8.6, func(v, r):
		return wave.call(v, r), N, (S * 11), H, GHOST, 0.6)
	for k in [0, 1]:
		if true:
			var r = 4
			while (r < (H0 * 0.72)):
				var v = (float(r) / H0)
				var x = (wave.call(v, r) + ((sin((((r * 0.35) - ((ph * TAU) * 3)) + (k * PI))) * 2.2) * (1 - v)))
				var on = (sin((((r * 0.2) - ((ph * TAU) * 4)) + (k * 2))) > 0.2)
				if on:
					p.px(x, (y0 - r), (H[int(2)] if k else H[int(1)]))
				r += 1.0
	for v in [0.2, 0.45, 0.7]:
		p.glow(wave.call(v, (H0 * v)), (y0 - (H0 * v)), 12, H[int(2)], (0.16 * br))
	p.glow(0, (y0 - 4), 9, H[int(1)], (0.22 + (0.06 * N.call(3, (S + 5)))))
	_P.looped(t, D, 34, (S + 400), func(r, _unused1=null):
		return {"x": r.range_value((-7), 7), "y": (-r.range_value(4, 28)), "vx": r.range_value((-12), 12), "vy": (-r.range_value(14, 34)), "life": r.range_value(0.9, 1.8), "a": r.range_value(0, TAU)}, func(q, age, _unused2=null):
		var _tuple3 = _P.drift(q.x, (q.y + y0), q.vx, q.vy, age, 0, (-10), 1.2, 1.2)
		var x = _tuple3[0]
		var y = _tuple3[1]
		var k = (1 - (float(age) / q.life))
		var tw = (0.5 + (0.5 * sin(((age * 14) + q.a))))
		var sx = (x + (sin(((age * 3) + q.a)) * 3))
		if ((k * (0.4 + (0.6 * tw))) < 0.2):
			return null
		p.px(sx, y, (H[int(0)] if ((tw > 0.7) and (k > 0.5)) else (H[int(1)] if (k > 0.5) else H[int(3)])))
		if ((tw > 0.85) and (k > 0.6)):
			p.px((sx - 1), y, H[int(3)])
			p.px((sx + 1), y, H[int(3)])
			p.px(sx, (y - 1), H[int(3)])
			p.px(sx, (y + 1), H[int(3)])
		p.glow(sx, y, 4, H[int(2)], (0.3 * k)))
