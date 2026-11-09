@tool
extends "../../core/effect.gd"
## Native port of pinned PixelFX 0.3.0 algorithms; MIT (c) Patch / Hugo Duprez.
const _C = preload("../../core/color.gd")
const _M = preload("../../core/math.gd")
const _P = preload("../../core/particles.gd")
const _S = preload("../../core/sim.gd")
const _E = preload("../../core/ease.gd")
const _A = preload("../analytic_helpers.gd")
const _R = preload("../native_bridge.gd")
const _B = preload("../native_bridge.gd")
## Source: src/fx/ice/frost-breath.js
const META = {"id":"pixelfx.frost_breath","name":"Frost breath","desc":"A cone of icy wind blowing right: frost puffs billow out, swell and sink, wind streaks race through, ice crystals tumble and glint off a white-hot mouth.","tags":["ice","breath","frost","cone","wind","directional","loop"],"size":[184,104],"origin":[12,50],"duration":1.2,"loop":true,"fps":30,"bg":"dark","options":{"palette":["#151a3d","#212f6b","#2c58aa","#3a8bd8","#62c8f4","#a6ecff","#dcfbff","#ffffff"],"spread":0.21,"power":1,"seed":11},"cacheable":true,"layers":["back","front"]}
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
			var limits = {"spread":[0.08,0.42],"power":[0.25,2]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-32, -160, 368, 240)
var SINK = 9
func puff(p, C, x, y, r, a, k, front):
	var body = (C[int(5)] if front else C[int(4)])
	var cap = (C[int(7)] if front else C[int(6)])
	var soft = func(q, _unused1=null, _unused2=null, _unused3=null):
		return func(d, _unused1=null, _unused2=null, _unused3=null):
			return (q * (1 - (d * d)))
	p.disc(x, y, r, body, soft.call((a * 0.6)))
	p.disc((x + (r * 0.06)), (y + (r * 0.12)), (r * 0.68), _C.mix(body, C[int(3)], 0.3), soft.call((a * 0.5)))
	if (k < 0.55):
		p.disc((x - (r * 0.25)), (y - (r * 0.3)), (r * 0.5), cap, soft.call(((a * 0.7) * (1 - (float(k) / 0.55)))))
	p.glow(x, y, (r * 1.7), C[int(4)], (0.1 * a))
func gust(p, C, t, o):
	var ph = (float(t) / META.duration)
	var sp = (tan(o.spread) * 1.08)
	var S = o.seed
	p.each(2, (-46), 170, 46, func(x, y, sx, sy):
		var u = (float(x) / 170)
		var hw = (2.5 + (x * sp))
		var yc = ((7 * u) * u)
		var v = (float((y - yc)) / hw)
		if (((v * v) >= 1) if ((v * v) >= 1) else (u >= 1)):
			return null
		var n = _M.tile_fbm(((x * 0.055) - (ph * 10)), (((y - yc) * 0.15) + 7), 10, 0, S, 2)
		var edge = (((1 - (v * v)) * ((float(u) / 0.08) if (u < 0.08) else 1)) * pow((1 - u), 0.8))
		var d = (clampf(((0.5 + (n * 1.3)) + (((1 - absf(v)) * 0.35) * pow((1 - u), 1.5))), 0.0, 1.0) * edge)
		if (d < 0.08):
			return null
		p.blend_px(sx, sy, (C[int(7)] if (d > 0.72) else (C[int(6)] if (d > 0.52) else (C[int(5)] if (d > 0.32) else C[int(4)]))), (minf(0.78, (d * 0.95)) * clampf((float((d - 0.08)) / 0.3), 0.0, 1.0)))
		if (d > 0.3):
			p.add(sx, sy, (C[int(6)] if (d > 0.6) else C[int(5)]), (0.2 * d)))
func draw_back(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var D = META.duration
	var S = o.seed
	var sp = o.spread
	gust(p, C, t, o)
	_P.cycle(t, D, 12, S, func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(1, 1.25), func(age, life, r, _unused3=null):
		var th = r.range_value((-sp), sp)
		var v = (r.range_value(170, 230) * o.power)
		var _tuple1 = _P.fly(3, r.range_value((-1), 1), (v * cos(th)), (v * sin(th)), age, SINK, 1.4)
		var x = _tuple1[0]
		var y = _tuple1[1]
		var k = (float(age) / life)
		var rad = (2 + (12 * pow(k, 0.75)))
		puff(p, C, x, minf(y, (40 - rad)), rad, ((0.75 * pow((1 - k), 1.2)) * minf(1, (float(age) / 0.08))), k, false))
func draw(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var D = META.duration
	var S = o.seed
	var sp = o.spread
	var ph = (float(t) / D)
	p.glow_line(4, 0, 120, 6, 24, C[int(4)], 0.26)
	p.glow_line(2, 0, 50, 1, 9, C[int(6)], 0.3)
	p.glow(60, 4, 44, C[int(3)], 0.16)
	_P.cycle(t, D, 10, (S + 1), func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(0.7, 0.95), func(age, life, r, _unused3=null):
		var th = r.range_value(((-sp) * 0.8), (sp * 0.8))
		var v = (r.range_value(190, 260) * o.power)
		var _tuple2 = _P.fly(3, r.range_value((-1), 1), (v * cos(th)), (v * sin(th)), age, SINK, 1.6)
		var x = _tuple2[0]
		var y = _tuple2[1]
		var k = (float(age) / life)
		var rad = (1.5 + (8 * pow(k, 0.7)))
		puff(p, C, x, minf(y, (40 - rad)), rad, ((0.85 * pow((1 - k), 1.3)) * minf(1, (float(age) / 0.06))), k, true))
	_P.cycle(t, D, 18, (S + 2), func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(0.8, 1.1), func(age, life, r, _unused3=null):
		var th = r.range_value(((-sp) * 1.1), (sp * 1.1))
		var v = r.range_value(120, 190)
		var _tuple3 = _P.fly(4, 0, (v * cos(th)), (v * sin(th)), age, (SINK * 1.4), 1.5)
		var x = _tuple3[0]
		var y = _tuple3[1]
		var k = (float(age) / life)
		var sw = (sin(((age * 9) + r.range_value(0, TAU))) * 1.5)
		if ((k < 0.85) if (k < 0.85) else (fmod((age * 30), 2) < 1)):
			p.px(x, (y + sw), (_C.WHITE if r.chance(0.5) else C[int(6)])))
	_P.cycle(t, D, 26, (S + 3), func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(0.22, 0.36), func(age, life, r, _unused3=null):
		var th = r.range_value(((-sp) * 0.9), (sp * 0.9))
		var v = r.range_value(280, 380)
		var _tuple4 = _P.fly(6, r.range_value((-2), 2), (v * cos(th)), (v * sin(th)), age, 0, 0.9)
		var x = _tuple4[0]
		var y = _tuple4[1]
		var _tuple5 = _P.fly_v((v * cos(th)), (v * sin(th)), age, 0, 0.9)
		var vx = _tuple5[0]
		var vy = _tuple5[1]
		var s = _R.hypot([vx, vy])
		var L = (4 + (s * 0.03))
		var ux = (float(vx) / s)
		var uy = (float(vy) / s)
		var k = (float(age) / life)
		p.line((x - (ux * L)), (y - (uy * L)), x, y, func(u, _unused1=null, _unused2=null, _unused3=null):
			return (_C.WHITE if (u > 0.8) else (C[int(6)] if (u > 0.4) else C[int(4)])), func(u, _unused1=null, _unused2=null, _unused3=null):
			return ((1 if (u > 0.35) else (float(u) / 0.35)) * (1 if (k < 0.75) else (float((1 - k)) / 0.25))))
		p.glow(x, y, 3, C[int(5)], (0.3 * (1 - k))))
	_P.cycle(t, D, 9, (S + 4), func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(0.65, 0.9), func(age, life, r, _unused3=null):
		var th = r.range_value((-sp), sp)
		var v = r.range_value(150, 230)
		var _tuple6 = _P.fly(5, 0, (v * cos(th)), (v * sin(th)), age, SINK, 1.1)
		var x = _tuple6[0]
		var y = _tuple6[1]
		var k = (float(age) / life)
		var a = (r.range_value(0, TAU) + ((age * r.range_value(9, 15)) * r.sign_value()))
		var L = r.range_value(1.5, 2.6)
		var ca = cos(a)
		var sa = sin(a)
		if ((k > 0.85) and (fmod((age * 30), 2) < 1)):
			return null
		p.line((x - (ca * L)), (y - (sa * L)), (x + (ca * L)), (y + (sa * L)), C[int(5)])
		p.px((x + (ca * L)), (y + (sa * L)), _C.WHITE)
		var gl = cos((a * 2))
		if (gl > 0.92):
			for _tuple7 in [[1, 0], [(-1), 0], [0, 1], [0, (-1)]]:
				var dx = _tuple7[0]
				var dy = _tuple7[1]
				p.px((x + dx), (y + dy), C[int(6)])
			p.px(x, y, _C.WHITE)
			p.glow(x, y, 6, C[int(5)], 0.5)
		else:
			p.glow(x, y, 3, C[int(5)], 0.2))
	if true:
		var i = 0
		while (i < 3):
			var L = (9 + (6 * _M.loop_noise(ph, 1.2, (S + (i * 7)))))
			var dy = ((i - 1) * 1.4)
			p.line(2, (dy * 0.5), (2 + L), dy, func(u, _unused1=null, _unused2=null, _unused3=null):
				return (_C.WHITE if (u < 0.5) else C[int(6)]), func(u, _unused1=null, _unused2=null, _unused3=null):
				return (1 if (u < 0.6) else (1 - (float((u - 0.6)) / 0.4))))
			i += 1.0
	p.ellipse(2.5, 0, 4.6, 3, C[int(6)])
	p.ellipse(2, 0, 3, 1.8, _C.WHITE)
	var fl = (0.85 + (0.15 * sin(((ph * TAU) * 3))))
	p.glow(2, 0, 24, C[int(5)], (0.7 * fl))
	p.glow(2, 0, 9, _C.WHITE, (0.5 * fl))
