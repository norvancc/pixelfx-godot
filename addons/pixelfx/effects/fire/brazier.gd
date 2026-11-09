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
## Source: src/fx/fire/brazier.js
const META = {"id":"pixelfx.brazier","name":"Brazier","desc":"An iron bowl on a tripod heaped with glowing coals and a big roaring fire, sparks and embers streaming up off it, light on the iron and the floor.","tags":["fire","brazier","prop","light","sparks","ambient","loop"],"size":[112,148],"origin":[56,136],"duration":3,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"iron":["#0b0910","#1c1924","#302c3a","#4c4658","#78708a"],"seed":8},"cacheable":true,"layers":["front"]}
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
	return Rect2i(-152, -232, 304, 340)
var D = META.duration
var NL = _B.noise_for(D)
var RIM = (-25)
var RX = 15
var RY = 3
var TONGUES = [[(-7), (-1.5), 0.5, 2, 1], [7.2, (-1.5), 0.55, 2, 1], [(-3), (-2.5), 0.84, 2.2, 1], [3.3, (-2.5), 0.86, 2.2, 1], [(-11.5), 0.5, 0.2, 1.5, 0], [11.5, 0.5, 0.22, 1.5, 0], [(-8.3), 0, 0.34, 2, 0], [8.5, 0, 0.38, 2, 0], [(-4.7), (-0.5), 0.6, 2.8, 0], [4.9, (-0.5), 0.64, 2.8, 0], [0, (-1), 1, 3.6, 0]]
func stand(p, I, H, fl):
	var leg = func(x0, y0, x1, y1):
		p.line(x0, y0, x1, y1, I[int(0)])
		p.line((x0 + 1), y0, (x1 + 1), y1, I[int(2)])
		p.line((x0 + 2), y0, (x1 + 2), y1, I[int(0)])
	p.ellipse(0, (-9), 9, 1.8, func(d, _unused1=null):
		return (I[int(2)] if (d > 0.6) else 0))
	leg.call((-6), (-17), (-12), (-1))
	leg.call(4, (-17), 10, (-1))
	p.rect((-14), (-1), 5, 1, I[int(2)])
	p.rect((-15), 0, 6, 1, I[int(0)])
	p.px((-15), (-1), I[int(3)])
	p.rect(9, (-1), 5, 1, I[int(2)])
	p.rect(9, 0, 6, 1, I[int(0)])
	p.px(13, (-1), I[int(3)])
	p.rect((-1), (-16), 3, 15, I[int(0)])
	p.rect(0, (-16), 1, 15, _C.mix(I[int(3)], H[int(4)], (0.15 * fl)))
	p.rect((-2), (-1), 5, 1, I[int(2)])
	p.rect((-2), 0, 5, 1, I[int(0)])
	p.ellipse(0, (-9), 9, 1.8, func(d, a):
		return ((I[int(0)] if (d > 0.85) else I[int(3)]) if ((sin(a) > 0) and (d > 0.55)) else 0))
func bowl(p, I, H, fl):
	p.shade(((-RX) - 1), (RIM - 1), (RX + 1), (RIM + 9), func(x, y, _unused2=null):
		var v = (float((y - RIM)) / 9)
		var hw = ((RX * sqrt(maxf(0, (1 - ((v * v) * 0.9))))) - (((v - 0.5) * 6) if (v > 0.5) else 0))
		if ((absf(x) > (hw + 0.5)) if (absf(x) > (hw + 0.5)) else (y < RIM)):
			return null
		if ((absf(x) > (hw - 0.5)) if (absf(x) > (hw - 0.5)) else (v > 0.92)):
			return I[int(0)]
		if (y < (RIM + 1)):
			return _C.mix(I[int(3)], H[int(4)], (0.5 * fl))
		if (y < (RIM + 2)):
			return I[int(2)]
		if (y < (RIM + 3)):
			return (_C.mix(I[int(4)], H[int(4)], (0.25 * fl)) if (fmod(_M.js_round(x), 4) == 0) else I[int(0)])
		return (I[int(2)] if (x < ((-RX) * 0.45)) else (I[int(1)] if (x < (RX * 0.25)) else I[int(0)])))
func coals(p, I, H, t, S):
	p.shade((-RX), (RIM - 6), RX, (RIM + 1), func(x, y, out):
		var top = ((RIM - 1) - (4 * maxf(0, (1 - ((float(x) / (RX - 1)) ** 2)))))
		if (((y < top) if (y < top) else (y > (RIM + 0.5))) if ((y < top) if (y < top) else (y > (RIM + 0.5))) else (absf(x) > (RX - 0.5))):
			return null
		var lump = _M.rand([floori((float((x + (floori(y) * 1.5))) / 3)), floori((float(y) / 2)), (S + 20)])
		var edge = (y < (top + 1))
		if ((_M.rand([floori(x), floori(y), (S + 21)]) < 0.16) if (_M.rand([floori(x), floori(y), (S + 21)]) < 0.16) else (edge and (lump < 0.3))):
			return I[int(0)]
		var g = ((0.5 + (0.5 * sin(((((float(t) / D) * PI) * 4) + (lump * 40))))) * (0.7 if edge else 1))
		out.k = (0.3 * g)
		return (H[int(2)] if (g > 0.72) else (H[int(3)] if (g > 0.5) else (H[int(4)] if (g > 0.3) else (H[int(5)] if (g > 0.15) else H[int(6)])))))
func draw(p, t: float, o: Dictionary) -> void:
	var F = _C.fit(o.palette, 9)
	var H = _B.hot_first(F)
	var I = _C.fit(o.iron, 5)
	var S = o.seed
	var fl = ((0.74 + (0.16 * NL.call(t, 7.3, (S + 1)))) + (0.1 * NL.call(t, 19, (S + 2))))
	var GLOW = _C.mix(_C.mix(H[int(3)], H[int(4)], 0.5), _C.WHITE, 0.25)
	var SPARKS = [H[int(1)], H[int(2)], H[int(4)], H[int(5)]]
	var EMB = [H[int(1)], H[int(2)], H[int(4)], H[int(6)]]
	_F.floor_light(p, 0, 0.5, 40, 7, GLOW, (0.32 * fl))
	stand(p, I, H, fl)
	p.ellipse(0, RIM, RX, RY, func(d, a):
		return ((I[int(0)] if (d > 0.88) else _C.mix(I[int(3)], H[int(4)], (0.3 * fl))) if ((sin(a) < 0) and (d > 0.7)) else 0))
	_B.burn(p, t, TONGUES, {"H": H, "D": D, "NL": NL, "S": S, "x": 0, "y": RIM, "height": 32, "lean": 0.1, "spread": 7, "puffs": 8, "licks": 4, "smoke": 14, "smokeSize": 3, "smokeLife": [1.6, 2.4], "embers": 10, "glowR": 58, "glow": 1.4, "wind": 3, "mid": func():
		coals(p, I, H, t, S)
		bowl(p, I, H, fl)})
	_P.looped(t, D, 60, (S + 600), func(r, _unused1=null):
		var side = r.range_value((-1), 1)
		return {"x": (side * 8), "y": (RIM - r.range_value(4, 18)), "vx": (side * r.range_value(10, 40)), "vy": (-r.range_value(70, 150)), "life": r.range_value(0.7, 1.7), "a": r.range_value(0, 6.3), "w": r.range_value(1.8, 3.2), "m": r.range_value(3, 8), "big": r.chance(0.12)}, func(q, age, _unused2=null):
		var _tuple1 = _P.drift(q.x, q.y, q.vx, q.vy, age, 0, (-22), 1.9, 1.9)
		var x = _tuple1[0]
		var y = _tuple1[1]
		var vx = _tuple1[2]
		var vy = _tuple1[3]
		var k = (1 - (float(age) / q.life))
		var wob = ((q.m * (sin(((age * q.w) + q.a)) - sin(q.a))) * minf(1, (age * 1.5)))
		var wv = (((q.m * q.w) * cos(((age * q.w) + q.a))) * minf(1, (age * 1.5)))
		if (sqrt(((vx + wv))*((vx + wv)) + (vy)*(vy)) > 40):
			_F.spark(p, (x + wob), y, (vx + wv), vy, k, SPARKS)
		else:
			_F.ember(p, (x + wob), y, k, (2 if q.big else 1), EMB, ((age * 40) + q.a)))
