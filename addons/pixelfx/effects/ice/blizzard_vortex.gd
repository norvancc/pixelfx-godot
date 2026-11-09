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
## Source: src/fx/ice/blizzard-vortex.js
const META = {"id":"pixelfx.blizzard_vortex","name":"Blizzard vortex","desc":"A swirling snow tornado: wind bands spin up a leaning funnel, flakes and ice crystals orbit in front and behind, snow boils at its foot and cold light fills its throat.","tags":["ice","snow","blizzard","tornado","vortex","wind","loop"],"size":[128,116],"origin":[64,102],"duration":2,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#151a3d","#212f6b","#2c58aa","#3a8bd8","#62c8f4","#a6ecff","#dcfbff","#ffffff"],"height":80,"seed":17},"cacheable":true,"layers":["back","front"]}
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
			var limits = {"height":[24,120]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-160, -238, 320, 388)
var TILT = 0.24
func radius(h, H):
	return (4 + (28 * pow(clampf((float(h) / H), 0.0, 1.0), 1.35)))
func axis(h, H, ph):
	return ((((5 * sin(((TAU * ph) + (h * 0.05)))) + (1.5 * sin((((TAU * ph) * 2) - (h * 0.11))))) * (float(h) / H)) - (2 * (float(h) / H)))
func streaks(p, C, t, o, front):
	var D = META.duration
	var H = o.height
	var ph = (float(t) / D)
	_P.cycle(t, D, 58, (o.seed + 9), func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(0.5, 0.9), func(age, life, r, _unused3=null):
		var h0 = r.range_value(2, H)
		var w = (r.range_value(8, 12) * (1.45 - (float(h0) / H)))
		var th = (r.range_value(0, TAU) + (age * w))
		var k = (float(age) / life)
		var fade = (minf(1, (float(age) / 0.08)) * ((float((1 - k)) / 0.3) if (k > 0.7) else 1))
		var L = r.range_value(0.7, 1.5)
		var m = ceili((float(L) / 0.07))
		if true:
			var j = 0
			while (j <= m):
				var a = (th - (j * 0.07))
				var s = sin(a)
				if ((s >= 0) != front):
					j += 1.0
					continue
				var h = minf((H + 4), ((h0 + (age * 16)) - (j * 0.25)))
				var R = (radius(minf(h, H), H) * (1 + minf(0.3, (maxf(0, (h - (H * 0.84))) * 0.03))))
				var u = (float(j) / m)
				var x = (axis(minf(h, H), H, ph) + (cos(a) * R))
				var y = ((-h) + ((s * R) * TILT))
				var c = ((_C.WHITE if (u < 0.15) else (C[int(6)] if (u < 0.5) else C[int(5)])) if front else (C[int(5)] if (u < 0.3) else (C[int(4)] if (u < 0.6) else C[int(3)])))
				p.dot(x, y, c, ((fade * (1 if (u < 0.6) else (1.5 - (u * 1.2)))) * (1 if front else 0.85)))
				j += 1.0)
func body(p, C, ph, H):
	p.each((-44), ((-H) - 6), 44, 2, func(x, y, sx, sy):
		var h = (-y)
		if ((h < 0) if (h < 0) else (h > (H + 4))):
			return null
		var R = radius(h, H)
		var dx = (x - axis(h, H, ph))
		var u = (float(dx) / R)
		if ((u * u) >= 1):
			return null
		var k = (float(h) / H)
		var rim = pow(absf(u), 3)
		var swirl = ((sin((((asin(u) * 3) - ((TAU * ph) * 2)) + (h * 0.2))) * 0.5) + 0.5)
		var a = (((((0.07 + (0.24 * rim)) + (0.12 * swirl)) * clampf((float((1 - absf(u))) / 0.18), 0.0, 1.0)) * (maxf(0, (float((1 - k)) / 0.3)) if (k > 0.7) else 1)) * ((float(h) / 4) if (h < 4) else 1))
		if (a < 0.03):
			return null
		p.blend_px(sx, sy, (C[int(6)] if (rim > 0.5) else (C[int(5)] if (swirl > 0.6) else C[int(4)])), a)
		if ((rim > 0.3) if (rim > 0.3) else (swirl > 0.75)):
			p.add(sx, sy, C[int(5)], ((0.16 * maxf(rim, (swirl - 0.5))) * (1 - (k * 0.5)))))
func orbiters(p, C, t, o, front):
	var D = META.duration
	var H = o.height
	var ph = (float(t) / D)
	_P.cycle(t, D, 76, o.seed, func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(0.9, 1.6), func(age, life, r, i):
		var h0 = r.range_value(0, (H * 0.6))
		var h = (h0 + (age * r.range_value(14, 30)))
		var k = (float(age) / life)
		if (h > (H + 8)):
			return null
		var w = (r.range_value(7, 11) * (1.5 - (float(h) / H)))
		var th = (r.range_value(0, TAU) + (age * w))
		var out = ((1 + r.range_value(0.05, 0.3)) + minf(0.35, (maxf(0, (h - (H * 0.82))) * 0.04)))
		var R = (radius(minf(h, H), H) * out)
		var s = sin(th)
		if ((s >= 0) != front):
			return null
		var x = (axis(minf(h, H), H, ph) + (cos(th) * R))
		var y = ((-h) + ((s * R) * TILT))
		var big = (fmod(i, 5) == 0)
		var fade = (minf(1, (float(age) / 0.1)) * ((float((1 - k)) / 0.2) if (k > 0.8) else 1))
		if (fade <= 0):
			return null
		var th2 = (th - 0.25)
		var x2 = (axis(minf(h, H), H, ph) + (cos(th2) * R))
		var y2 = (((-h) + 2) + ((sin(th2) * R) * TILT))
		if front:
			p.line(x2, y2, x, y, func(u, _unused1=null, _unused2=null, _unused3=null):
				return (C[int(6)] if (u > 0.6) else C[int(4)]), func(u, _unused1=null, _unused2=null, _unused3=null):
				return (u * fade))
			p.dot(x, y, (_C.WHITE if big else (_C.WHITE if r.chance(0.5) else C[int(6)])), fade)
			if big:
				for _tuple1 in [[1, 0], [(-1), 0], [0, 1], [0, (-1)]]:
					var dx = _tuple1[0]
					var dy = _tuple1[1]
					p.dot((x + dx), (y + dy), C[int(6)], fade)
				p.glow(x, y, 5, C[int(5)], (0.35 * fade))
		else:
			p.line(x2, y2, x, y, C[int(3)], func(u, _unused1=null, _unused2=null, _unused3=null):
				return ((u * fade) * 0.8))
			p.dot(x, y, (C[int(5)] if big else C[int(4)]), fade))
func foot(p, C, t, o, front):
	var D = META.duration
	var ph = (float(t) / D)
	_P.cycle(t, D, 12, (o.seed + 5), func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(0.8, 1.2), func(age, life, r, _unused3=null):
		var th = (r.range_value(0, TAU) + (age * r.range_value(4, 6)))
		var R = (9 + (age * r.range_value(8, 16)))
		var s = sin(th)
		var k = (float(age) / life)
		if ((s >= 0) != front):
			return null
		var x = (axis(0, 1, ph) + (cos(th) * R))
		var y = (((-2) - (age * r.range_value(4, 10))) + ((s * R) * 0.2))
		var rad = (2 + (4 * k))
		var a = ((0.5 * pow((1 - k), 1.2)) * minf(1, (float(age) / 0.1)))
		p.disc(x, y, rad, (C[int(6)] if front else C[int(5)]), func(d, _unused1=null, _unused2=null, _unused3=null):
			return (a * (1 - (d * d))))
		p.disc((x - (rad * 0.25)), (y - (rad * 0.3)), (rad * 0.5), _C.WHITE, func(d, _unused1=null, _unused2=null, _unused3=null):
			return (((a * 0.5) * (1 - (d * d))) * (1 - k))))
func draw_back(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var H = o.height
	var ph = (float(t) / META.duration)
	if true:
		var x = (-30)
		while (x <= 30):
			var d = (float(absf(x)) / 30)
			var hgt = _M.js_round(((1 - (d * d)) * (1.5 + (_M.rand([x, 3]) * 1.5))))
			if true:
				var j = 0
				while (j < hgt):
					p.px(x, (-j), (_C.WHITE if (j == (hgt - 1)) else C[int(5)]))
					j += 1.0
			p.dot(x, 0, C[int(6)], (1 - (d * 0.5)))
			p.dot(x, 1, C[int(4)], (0.8 - (d * 0.6)))
			x += 1.0
	p.glow(0, (-2), 40, C[int(4)], 0.22)
	foot(p, C, t, o, false)
	streaks(p, C, t, o, false)
	orbiters(p, C, t, o, false)
func draw(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var H = o.height
	var ph = (float(t) / META.duration)
	body(p, C, ph, H)
	p.glow(axis((H * 0.45), H, ph), ((-H) * 0.45), 40, C[int(4)], 0.3)
	p.glow(axis((H * 0.15), H, ph), ((-H) * 0.15), 18, C[int(5)], (0.4 + (0.1 * sin(((TAU * ph) * 4)))))
	p.glow(axis((H * 0.05), H, ph), (-3), 10, _C.WHITE, 0.3)
	streaks(p, C, t, o, true)
	orbiters(p, C, t, o, true)
	foot(p, C, t, o, true)
	_P.cycle(t, META.duration, 10, (o.seed + 3), func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(0.9, 1.3), func(age, life, r, _unused3=null):
		var th = r.range_value(0, TAU)
		var R = (radius(H, H) * (0.6 + (age * 0.9)))
		var k = (float(age) / life)
		var rad = (3 + (6 * k))
		var Rc = minf(R, 36)
		var x = (axis(H, H, ph) + (cos(th) * Rc))
		var y = ((((-H) - 2) - (age * 4)) + ((sin(th) * Rc) * TILT))
		var a = ((0.24 * (1 - k)) * minf(1, (float(age) / 0.15)))
		p.disc(x, y, (rad * 0.8), C[int(6)], func(d, _unused1=null, _unused2=null, _unused3=null):
			return (a * (1 - (d * d))))
		p.glow(x, y, (rad * 1.5), C[int(4)], (0.08 * (1 - k))))
