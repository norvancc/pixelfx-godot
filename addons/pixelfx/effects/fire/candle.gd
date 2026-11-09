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
## Source: src/fx/fire/candle.js
const META = {"id":"pixelfx.candle","name":"Candle","desc":"A wax candle in a brass dish: a calm flame with a blue root that sways and stretches, a halo of light, motes drifting in it, a bead of wax running down a drip.","tags":["fire","candle","prop","light","calm","ambient","loop"],"size":[56,76],"origin":[28,64],"duration":4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"root":["#1b2a8a","#3a62e0","#7fb4ff"],"wax":["#2e201e","#5e4436","#8e6e58","#b8957a","#d8b896","#f0dcc0"],"brass":["#2a1a10","#6a4a1e","#b4862e","#e8c060","#fff0b0"],"seed":2},"cacheable":true,"layers":["front"]}
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
	return Rect2i(-124, -160, 248, 268)
var D = META.duration
var NL = _B.noise_for(D)
var TOP = (-16)
var WICK = (TOP - 3)
var CALM = [[1, 1, 5], [0.8, 0.88, 3], [0.6, 0.72, 2], [0.38, 0.52, 1], [0.18, 0.3, 0]]
var DRIP = {"x": 4, "y0": (TOP + 2), "y1": (-7)}
func dish(p, B, H, fl):
	p.ellipse(0, 1, 10, 2.6, func(d, a):
		return (B[int(0)] if (d > 0.82) else ((_C.mix(B[int(3)], H[int(3)], (0.3 * fl)) if (d > 0.6) else B[int(2)]) if (sin(a) < (-0.2)) else (B[int(1)] if (d > 0.55) else B[int(2)]))))
	p.rect((-8), 2, 17, 1, B[int(1)])
	p.rect((-7), 3, 15, 1, B[int(0)])
func candle(p, X, H, fl):
	var L = TOP
	var cols = [X[int(1)], X[int(4)], X[int(5)], X[int(4)], X[int(4)], X[int(3)], X[int(3)], X[int(2)], X[int(0)]]
	if true:
		var i = 0
		while (i < 9):
			var x = (i - 4)
			p.rect(x, (L + 1), 1, ((-L) - 2), cols[int(i)])
			if (i == 2):
				p.rect(x, (-8), 1, 7, X[int(4)])
			i += 1.0
	p.rect((-3), (-1), 7, 1, X[int(2)])
	p.px((-4), (-1), X[int(0)])
	p.px(4, (-1), X[int(0)])
	p.rect((-3), L, 7, 1, _C.mix(X[int(5)], H[int(2)], (0.25 * fl)))
	p.px((-4), L, X[int(1)])
	p.px(4, L, X[int(1)])
	p.rect((-2), (L + 1), 5, 1, _C.mix(X[int(5)], H[int(1)], (0.5 * fl)))
	p.rect((-1), (L + 1), 3, 1, _C.mix(X[int(4)], H[int(2)], (0.45 * fl)))
	var y1 = DRIP.y1
	p.rect(3, (L + 1), 1, ((y1 - L) - 1), X[int(4)])
	p.rect(4, (L + 2), 1, ((y1 - L) - 2), X[int(3)])
	p.px(5, (L + 3), X[int(0)])
	p.rect(5, (L + 4), 1, ((y1 - L) - 4), X[int(0)])
	p.rect(3, y1, 2, 2, X[int(4)])
	p.px(5, y1, X[int(3)])
	p.px(5, (y1 + 1), X[int(2)])
	p.px(6, y1, X[int(0)])
	p.px(6, (y1 + 1), X[int(0)])
	p.rect(3, (y1 + 2), 3, 1, X[int(0)])
	p.px(3, (L + 2), X[int(5)])
	p.rect((-4), (L + 1), 1, 4, X[int(4)])
	p.px((-5), (L + 3), X[int(1)])
	p.px((-5), (L + 4), X[int(1)])
	p.px((-4), (L + 5), X[int(3)])
func draw(p, t: float, o: Dictionary) -> void:
	var F = _C.fit(o.palette, 9)
	var H = _B.hot_first(F)
	var RT = _C.fit(o.root, 3)
	var X = _C.fit(o.wax, 6)
	var B = _C.fit(o.brass, 5)
	var S = o.seed
	var N = func(rate, seed_value=0, off=0):
		return NL.call(t, (rate * 0.35), seed_value, off)
	var fl = ((0.86 + (0.08 * NL.call(t, 2, (S + 1)))) + (0.06 * NL.call(t, 7, (S + 2))))
	var stretch = (maxf(0, (NL.call(t, 0.75, (S + 3)) - 0.3)) * 0.6)
	var h = ((12 * (1 + stretch)) * (0.94 + (0.06 * fl)))
	var sway = ((NL.call(t, 0.5, (S + 4)) * 1.6) + (NL.call(t, 1.5, (S + 5)) * 0.5))
	var GLOW = _C.mix(_C.mix(H[int(3)], H[int(4)], 0.5), _C.WHITE, 0.3)
	var cy = (WICK - (h * 0.4))
	_F.floor_light(p, 0, 1, 26, 5, GLOW, (0.3 * fl))
	p.glow((sway * 0.3), cy, (38 * fl), GLOW, (0.42 * fl))
	p.glow_ring((sway * 0.3), cy, 10, 4, H[int(2)], (0.12 * fl))
	dish(p, B, H, fl)
	candle(p, X, H, fl)
	var run = (float(fmod(t, D)) / D)
	var swell = _M.smooth(0, 0.3, run)
	var slide = _M.smooth(0.3, 0.85, run)
	var set_pixel = _M.smooth(0.85, 1, run)
	if ((set_pixel < 1) and (swell > 0.15)):
		var by = _M.js_round((DRIP.y0 + ((DRIP.y1 - DRIP.y0) * slide)))
		p.px(DRIP.x, by, _C.mix(X[int(5)], H[int(1)], (0.4 * fl)))
		if ((swell > 0.6) and (set_pixel < 0.5)):
			p.px((DRIP.x + 1), by, X[int(4)])
			p.px((DRIP.x + 1), (by + 1), X[int(2)])
	p.line(0, TOP, 0, (WICK + 1), X[int(0)])
	p.px(0, (WICK + 1), H[int(4)])
	_F.flame_tongue(p, 0, (WICK + 1), h, 2.6, sway, N, (S * 31), H, CALM, 0.25, 0.6)
	if true:
		var dx = (-2)
		while (dx <= 2):
			var a = (1 - (absf(dx) * 0.2))
			p.dot(dx, (WICK + 1), (RT[int(0)] if (absf(dx) == 2) else RT[int(1)]), a)
			if (absf(dx) <= 1):
				p.dot(dx, (WICK + 2), RT[int(0)], 0.7)
			dx += 1.0
	p.px(0, WICK, RT[int(2)])
	_P.looped(t, D, 6, (S + 300), func(r, _unused1=null):
		return {"vx": r.range_value((-1.5), 1.5), "vy": (-r.range_value(8, 12)), "life": r.range_value(1.4, 2.2), "s": r.range_value(0.8, 1.2)}, func(q, age, _unused2=null):
		var _tuple1 = _P.drift(sway, (WICK - h), q.vx, q.vy, age, 1, (-6), 1, 0.8)
		var x = _tuple1[0]
		var y = _tuple1[1]
		_F.smoke_puff(p, (x + (NL.call((t - age), 0.6, (S + 60)) * (1 + (age * 2)))), y, (1 - (float(age) / q.life)), q.s, 0, false, 0.6))
	_P.looped(t, D, 10, (S + 400), func(r, _unused1=null):
		return {"x": r.range_value((-20), 20), "y": r.range_value((-44), (-8)), "vx": r.range_value((-3), 3), "vy": r.range_value((-4), 2), "life": r.range_value(2.5, 4), "ph": r.range_value(0, 6.3)}, func(q, age, _unused2=null):
		var x = ((q.x + (q.vx * age)) + (sin(((age * 1.3) + q.ph)) * 2))
		var y = (q.y + (q.vy * age))
		var d = sqrt((x)*(x) + ((y - cy))*((y - cy)))
		var k = (minf(minf(1, (age * 2)), ((q.life - age) * 2)) * clampf((1.2 - (float(d) / 26)), 0.0, 1.0))
		if (k > 0.15):
			p.dot(x, y, (H[int(1)] if (k > 0.6) else H[int(3)]), k)
			p.glow(x, y, 3, H[int(2)], (0.2 * k)))
	p.glow((sway * 0.5), (WICK - (h * 0.3)), 10, H[int(1)], (0.35 * fl))
