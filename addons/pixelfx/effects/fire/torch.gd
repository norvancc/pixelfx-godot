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
## Source: src/fx/fire/torch.js
const META = {"id":"pixelfx.torch","name":"Torch","desc":"A wall torch on an iron bracket: a licking flame leaping off a pitch-soaked wrap, licks and puffs torn off its tips, smoke, embers, a flickering light on the wall.","tags":["fire","torch","prop","light","wall","dungeon","loop"],"size":[72,120],"origin":[36,94],"duration":2,"loop":true,"fps":30,"bg":"dark","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"wood":["#0e080a","#24130f","#3b2216","#5a3520","#8a5a34","#b9884f"],"iron":["#0d0b12","#1e1b26","#363242","#5b5566","#8a8396"],"seed":4},"cacheable":true,"layers":["front"]}
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
	return Rect2i(-132, -190, 264, 312)
var D = META.duration
var NL = _B.noise_for(D)
var BASE = (-16)
var TONGUES = [[(-1.9), (-1), 0.74, 2, 1], [2.1, (-1), 0.7, 2, 1], [(-3.4), 0.5, 0.42, 1.6, 0], [3.6, 0.5, 0.46, 1.6, 0], [0, 0, 1, 2.9, 0]]
func plate(p, I, H, fl):
	p.shade((-5.5), (-5.5), 5.5, 11.5, func(x, y, _unused2=null):
		if ((((x < (-5)) if (x < (-5)) else (x > 5)) if ((x < (-5)) if (x < (-5)) else (x > 5)) else (y < (-5))) if (((x < (-5)) if (x < (-5)) else (x > 5)) if ((x < (-5)) if (x < (-5)) else (x > 5)) else (y < (-5))) else (y > 11)):
			return I[int(0)]
		var rv = ((absf(x) < 0.6) and ((absf((y + 3.5)) < 0.6) if (absf((y + 3.5)) < 0.6) else (absf((y - 9.5)) < 0.6)))
		if rv:
			return _C.mix(I[int(4)], H[int(3)], (0.35 * fl))
		if ((y < (-4)) if (y < (-4)) else (x < (-4))):
			return _C.mix(I[int(3)], H[int(4)], (0.3 * fl))
		if ((y > 10) if (y > 10) else (x > 4)):
			return I[int(1)]
		return (I[int(2)] if (y < 2) else I[int(1)]))
func handle(p, W):
	p.shade((-3), (-12), 3, 15, func(x, y, _unused2=null):
		var half = (1.3 + (clampf((float((14 - y)) / 26), 0.0, 1.0) * 0.9))
		if ((absf(x) > (half + 0.5)) if (absf(x) > (half + 0.5)) else (y > 14.5)):
			return null
		if ((absf(x) > (half - 0.5)) if (absf(x) > (half - 0.5)) else (y > 13.5)):
			return W[int(0)]
		var g = _M.rand([floori((float(y) / 3)), _M.js_round(x), 9])
		return ((W[int(2)] if (g < 0.3) else W[int(4)]) if (x < (-0.3)) else (W[int(1)] if (g < 0.4) else W[int(2)])))
func ring(p, I, H, fl):
	p.rect((-3), (-2), 7, 4, I[int(0)])
	p.rect((-2), (-1), 5, 1, _C.mix(I[int(4)], H[int(3)], (0.3 * fl)))
	p.rect((-2), 0, 5, 1, I[int(2)])
func _wrap(p, W, I, H, t):
	p.shade((-6), (BASE - 2), 6, (-9), func(x, y, out):
		var v = (float((y - (BASE - 1.5))) / 7.5)
		var half = (4.6 - (v * 1.9))
		if (((absf(x) > (half + 0.5)) if (absf(x) > (half + 0.5)) else (y < (BASE - 1.5))) if ((absf(x) > (half + 0.5)) if (absf(x) > (half + 0.5)) else (y < (BASE - 1.5))) else (y > (-9.5))):
			return null
		if ((absf(x) > (half - 0.5)) if (absf(x) > (half - 0.5)) else (y > (-10.5))):
			return W[int(0)]
		var cord = (fmod(floori(((y - (x * 0.6)) + 40)), 3) == 0)
		var h = _M.rand([floori(x), floori(y), 31])
		if (v < 0.45):
			if (h < 0.42):
				var g = (0.5 + (0.5 * sin(((((float(t) / D) * PI) * 4) + (h * 40)))))
				out.k = (0.3 * g)
				return (H[int(2)] if (g > 0.66) else (H[int(4)] if (g > 0.33) else H[int(5)]))
			return (W[int(0)] if (h < 0.75) else W[int(1)])
		if cord:
			return I[int(2)]
		return (W[int(3)] if (x < (-1)) else (W[int(2)] if (x < 1.5) else W[int(1)])))
func draw(p, t: float, o: Dictionary) -> void:
	var F = _C.fit(o.palette, 9)
	var H = _B.hot_first(F)
	var W = _C.fit(o.wood, 6)
	var I = _C.fit(o.iron, 5)
	var S = o.seed
	var fl0 = ((0.74 + (0.16 * NL.call(t, 7.3, (S + 1)))) + (0.1 * NL.call(t, 19, (S + 2))))
	plate(p, I, H, fl0)
	handle(p, W)
	ring(p, I, H, fl0)
	_B.burn(p, t, TONGUES, {"H": H, "D": D, "NL": NL, "S": S, "x": 0, "y": BASE, "height": 20, "lean": 0.12, "spread": 4, "puffs": 10, "licks": 5, "smoke": 7, "smokeSize": 2.3, "smokeLife": [1.3, 2.1], "embers": 7, "glowR": 48, "glow": 1.25, "wind": 2, "mid": func():
		return _wrap(p, W, I, H, t)})
