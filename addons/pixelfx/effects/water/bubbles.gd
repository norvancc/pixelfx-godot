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
const _R = preload("../native_bridge.gd")
const _B = preload("b2_elements_common.gd")
## Source: src/fx/water/bubbles.js
const META = {"id":"pixelfx.bubbles","name":"Bubbles","desc":"Bubbles stream up from a vent of pebbles, wobbling and swelling as they rise, flare as they cross shafts of light from the surface, then dome up and pop there.","tags":["water","bubbles","underwater","vent","ambient","loop"],"size":[104,112],"origin":[52,104],"duration":4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#0a1630","#123063","#1b5596","#2a7fc4","#45a9e3","#86d3f5","#cdf1ff","#ffffff"],"seed":4},"cacheable":true,"layers":["back","front"]}
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
			var limits = {}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-148, -200, 296, 304)
var D = META.duration
var TOP = (-92)
var HALF = 48
func surfaceY(x, ph):
	return ((TOP + (sin(((x * 0.13) + ((ph * TAU) * 2))) * 1.1)) + (sin(((x * 0.051) - (ph * TAU))) * 1.3))
func shaft(x, y, ph):
	var u = (x + ((y - TOP) * 0.32))
	var s = ((sin(((u * 0.16) + (ph * TAU))) * 0.6) + (sin((((u * 0.07) - (ph * TAU)) + 1)) * 0.4))
	return (float(maxf(0, (s - 0.35))) / 0.65)
func bubble(p, C, x, y, r, q, lit):
	if (r < 0.9):
		p.px(x, y, (_C.WHITE if (lit > 0.3) else (C[int(5)] if (r < 0.7) else C[int(6)])))
		return null
	if (r < 1.5):
		var X = floori(x)
		var Y = floori(y)
		p.px(X, Y, _C.WHITE)
		p.px((X + 1), Y, C[int(6)])
		p.px(X, (Y + 1), C[int(5)])
		p.px((X + 1), (Y + 1), C[int(4)])
		p.glow((x + 0.5), (y + 0.5), 3, C[int(5)], (0.12 + (0.2 * lit)))
		return null
	var rx = (r * (1 + q))
	var ry = (r * (1 - q))
	p.shade(((x - rx) - 1), ((y - ry) - 1), ((x + rx) + 1), ((y + ry) + 1), func(px, py, out, _unused3=null):
		var dx = (float((px - x)) / rx)
		var dy = (float((py - y)) / ry)
		var d = (_R.hypot([dx, dy]) * r)
		if (d > (r + 0.5)):
			return null
		var l = (float((float(((-dx) - dy)) / sqrt(2.0))) / maxf(0.01, (float(d) / r)))
		if (d > (r - 0.6)):
			out.c = (C[int(6)] if (l > 0.45) else (C[int(3)] if (l < (-0.55)) else C[int(4)]))
		else:
			p.blend(px, py, C[int(5)], (0.16 + (0.2 * lit))))
	p.px(_M.js_round((x - (rx * 0.45))), _M.js_round((y - (ry * 0.45))), _C.WHITE)
	if (r >= 2.5):
		p.px((_M.js_round((x - (rx * 0.45))) + 1), _M.js_round((y - (ry * 0.45))), C[int(6)])
	if (r >= 2):
		p.px(_M.js_round((x + (rx * 0.5))), _M.js_round((y + (ry * 0.5))), C[int(6)])
	p.glow(x, y, ((r * 2.4) + 2), C[int(5)], (0.12 + (0.3 * lit)))
var MOUTHS = [(-5), 1, 6]
func each(t, S, fn):
	_P.cycle(t, D, 46, S, func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(2.2, 3.4), func(age, life, r, i):
		var m = MOUTHS[int(fmod(i, 3))]
		var r0 = (r.range_value(0.5, 1.4) if (r.next() < 0.7) else r.range_value(1.6, 2.6))
		var vy = ((30 + (9 * r0)) + r.range_value((-4), 4))
		var wf = r.range_value(3, 6)
		var wa = (0.8 + (r0 * 1.2))
		var ph0 = r.range_value(0, TAU)
		var drift = r.range_value((-4), 4)
		var y = ((-2) - (vy * age))
		var k = clampf((float((-y)) / (-TOP)), 0.0, 1.0)
		var x = ((m + (drift * k)) + ((sin(((age * wf) + ph0)) * wa) * k))
		fn.call({"x": x, "y": y, "r": (r0 * (1 + (0.45 * k))), "q": ((0.12 * sin((((age * wf) * 2) + ph0))) * minf(1, (float(r0) / 2))), "i": i, "age": age, "vy": vy}))
func draw_back(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var ph = (float(t) / D)
	if true:
		var Y = (TOP - 2)
		while (Y < 0):
			if true:
				var X = (-HALF)
				while (X < HALF):
					var x = (X + 0.5)
					var y = (Y + 0.5)
					var sy = surfaceY(x, ph)
					if (y < sy):
						X += 1.0
						continue
					var e = (1 - _M.smooth((HALF - 14), HALF, absf(x)))
					var depth = (float((y - TOP)) / (-TOP))
					p.blend(x, y, C[int(1)], ((0.22 + (0.22 * depth)) * e))
					var s = ((shaft(x, y, ph) * (1 - (depth * 0.7))) * e)
					if (s > 0.05):
						p.light(x, y, C[int(4)], (0.2 * s))
					X += 1.0
			Y += 1.0
	if true:
		var X = (-HALF)
		while (X < HALF):
			var x = (X + 0.5)
			var e = (1 - _M.smooth((HALF - 14), HALF, absf(x)))
			var s = shaft(x, (-2), ph)
			var c = maxf(0, (1 - (absf(sin(((x * 0.42) + (sin(((x * 0.11) + ((ph * TAU) * 2))) * 2.2)))) * 2.4)))
			if (((s * c) * e) > 0.05):
				p.light(x, (-1), C[int(5)], (((0.5 * s) * c) * e))
				p.light(x, (-2), C[int(4)], (((0.25 * s) * c) * e))
				p.light(x, 0, C[int(4)], (((0.3 * s) * c) * e))
			X += 1.0
	var ST = _B.rock()
	for _tuple1 in [[(-9), (-1.5), 2.4], [(-4), (-1), 1.8], [3.5, (-1.2), 2.2], [9, (-1.4), 2.6], [0, (-0.6), 1.4], [(-12.5), (-0.8), 1.6]]:
		var x = _tuple1[0]
		var y = _tuple1[1]
		var rr = _tuple1[2]
		p.shade(((x - rr) - 1), ((y - rr) - 1), ((x + rr) + 1), ((y + rr) + 1), func(px, py, out, _unused3=null):
			var dx = (px - x)
			var dy = (py - y)
			var d = _R.hypot([(dx * 1.1), dy])
			if ((d > (rr + 0.7)) if (d > (rr + 0.7)) else (py > 0)):
				return null
			out.c = (ST[int(0)] if (d > rr) else (ST[int(5)] if ((dx + dy) < ((-rr) * 0.6)) else (ST[int(3)] if ((dx + dy) < (rr * 0.3)) else ST[int(2)]))))
	for m in MOUTHS:
		p.px(m, (-1), ST[int(0)])
func draw(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var ph = (float(t) / D)
	var S = o.seed
	_P.cycle(t, D, 26, (S + 7), D, func(age, life, r, _unused3=null):
		var x = (r.range_value(((-HALF) + 6), (HALF - 6)) + (sin((((float(age) / D) * TAU) + r.range_value(0, TAU))) * 3))
		var y = ((TOP + 6) + fmod((r.range_value(0, 86) + (age * 4)), 86))
		var s = shaft(x, y, ph)
		var tw = sin(((((float(age) / D) * TAU) * 3) + r.range_value(0, TAU)))
		if ((tw < (-0.3)) and (s < 0.2)):
			return null
		p.px(x, y, (_C.WHITE if (s > 0.4) else (C[int(5)] if (tw > 0.6) else C[int(4)])))
		if (s > 0.4):
			p.glow(x, y, 3, C[int(5)], (0.25 * s)))
	each(t, S, func(b, _unused1=null, _unused2=null, _unused3=null):
		var sy = surfaceY(b.x, ph)
		if (b.y > (sy + b.r)):
			bubble(p, C, b.x, b.y, b.r, b.q, shaft(b.x, b.y, ph))
		else:
			var since = (float(((sy + b.r) - b.y)) / b.vy)
			if ((since < 0.12) and (b.r >= 1.4)):
				if true:
					var a = PI
					while (a <= (TAU + 0.01)):
						p.px((b.x + (cos(a) * b.r)), (sy + ((sin(a) * b.r) * 0.9)), C[int(6)])
						a += (float(0.4) / b.r)
				p.px((b.x - (b.r * 0.4)), (sy - (b.r * 0.6)), _C.WHITE)
			else:
				if (since < (0.32 if (b.r >= 1.4) else 0.2)):
					var k = clampf((float((since - (0.12 if (b.r >= 1.4) else 0))) / 0.2), 0.0, 1.0)
					var w = maxf(1, ((b.r + 1) + (k * 4)))
					if true:
						var a = 0
						while (a < PI):
							if (sin(a) > 0.15):
								p.dot((b.x + (cos(a) * w)), (sy + ((sin(a) * w) * 0.3)), (_C.WHITE if (k < 0.4) else C[int(5)]), (1.2 - k))
							a += (float(0.5) / w)
					if ((b.r >= 1.4) and (k < 0.6)):
						p.px((b.x - 2), ((sy - 2) - (k * 4)), C[int(6)])
						p.px((b.x + 2), ((sy - 3) - (k * 5)), C[int(6)]))
	if true:
		var X = (-HALF)
		while (X < HALF):
			var x = (X + 0.5)
			var y = surfaceY(x, ph)
			var e = (1 - _M.smooth((HALF - 12), HALF, absf(x)))
			var glint = ((sin(((x * 0.37) - ((ph * TAU) * 3))) * sin(((x * 0.13) + (ph * TAU)))) > 0.55)
			p.dot(X, y, (_C.WHITE if glint else C[int(5)]), (e * 1.3))
			p.dot(X, (y + 1), C[int(3)], (e * 1.3))
			if ((int(X) & int(3)) == 0):
				p.glow(x, (y + 1), 7, C[int(5)], ((0.22 if glint else 0.1) * e))
			X += 1.0
