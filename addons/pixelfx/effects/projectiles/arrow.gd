@tool
extends "../../core/effect.gd"
## Native port of pinned PixelFX 0.3.0 algorithms; MIT (c) Patch / Hugo Duprez.
const _C = preload("../../core/color.gd")
const _M = preload("../../core/math.gd")
const _P = preload("../../core/particles.gd")
const _S = preload("../../core/sim.gd")
const _E = preload("../../core/ease.gd")
const _A = preload("../analytic_helpers.gd")
const _J = preload("projectiles_common.gd")
const _B = preload("b2_common.gd")
## Source: src/fx/projectiles/arrow.js
const META = {"id":"pixelfx.arrow","name":"Arrow","desc":"An arrow in flight: a steel broadhead catching the light, a wooden shaft, fletching fluttering in the wind, streaks of air peeling off its head and swirling off its feathers.","tags":["projectile","arrow","bow","medieval","directional","loop"],"size":[112,32],"origin":[92,16],"duration":0.6,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#7a1f2c","#b8323c","#e8e2d6","#ffffff"],"wood":["#3a2414","#6e4422","#a8723c","#d8a868"],"steel":["#2e3648","#5a6680","#9aa6ba","#dfe7f2"],"wind":"#b8c8e8","seed":3},"cacheable":true,"layers":["front"]}
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
	return Rect2i(-188, -112, 304, 224)
var HEAD = ["..LL....", "..sLLL..", "bbsSSSSW", "..dDDD..", "..DD...."]
var FLETCH = [["AAa.........", ".aAAa.......", "..aaAAa.....", "nkkkkkkkkkkk", "..cCCc......", ".cCCc.......", "CCc........."], [".AAa........", "..aAAa......", "..aaAAAa....", "nkkkkkkkkkkk", "..cCCCc.....", "..cCCc......", ".CCc........"], ["AAAa........", "aAAa........", ".aaAAa......", "nkkkkkkkkkkk", "..ccCc......", "cCCc........", "CCc........."]]
func draw(p, t: float, o: Dictionary) -> void:
	var PL = _C.fit(o.palette, 4)
	var W = _C.fit(o.wood, 4)
	var ST = _C.fit(o.steel, 4)
	var wind = _B.color(o.wind)
	var S = o.seed
	var D = META.duration
	var fr = floori(((t * 30) + 0.000001))
	var ph = (float(t) / D)
	var left = ((-META.origin[int(0)]) + 2)
	var LEN = 36
	_A.beat(t, D, 9, S, func(r):
		return r.range_value(0.14, 0.26), func(age, life, r):
		var k = (float(age) / life)
		var top = ((-1) if r.chance(0.5) else 1)
		var from = ((-3) if r.chance(0.6) else ((-LEN) + 6))
		var x0 = (from - (age * r.range_value(160, 240)))
		var len = (r.range_value(8, 16) * (0.5 + k))
		var y = (0.5 + (top * (r.range_value(3, 5) + (k * r.range_value(1, 2.5)))))
		if ((x0 - len) < left):
			return null
		var c = (wind if (k < 0.4) else _C.mix(wind, _B.color("#2a2540"), ((k - 0.4) * 1.2)))
		p.line(x0, y, (x0 - len), y, func(u):
			return (_C.mix(wind, _C.WHITE, 0.5) if ((u < 0.25) and (k < 0.4)) else c), func(u):
			return (1 if (u < 0.65) else (float((1 - u)) / 0.35))))
	_A.beat(t, D, 6, (S + 3), func(r):
		return r.range_value(0.15, 0.25), func(age, life, r):
		var k = (float(age) / life)
		var cx = (((-LEN) - 2) - (age * r.range_value(100, 150)))
		var cy = (0.5 + (r.sign_value() * r.range_value(2, 4)))
		var a = ((age * 30) + r.range_value(0, TAU))
		var rr = (1.2 + (k * 1.5))
		if (cx < (left + 4)):
			return null
		if true:
			var i = 0
			while (i < 4):
				p.dot((cx + (cos((a + (i * 0.5))) * rr)), (cy + (sin((a + (i * 0.5))) * rr)), wind, ((1 - k) * (1 - (i * 0.2))))
				i += 1.0)
	p.line(((-LEN) + 11), 0, (-7), 0, W[int(2)])
	if true:
		var x = ((-LEN) + 14)
		while (x < (-8)):
			p.px(x, 0, W[int(3)])
			x += 6
	var pose = FLETCH[int(floori((_M.rand([fr, S]) * 3)))]
	p.sprite(pose, {"a": PL[int(2)], "A": PL[int(3)], "c": PL[int(0)], "C": PL[int(1)], "k": W[int(1)], "n": W[int(0)]}, (-LEN), (-3))
	p.sprite(HEAD, {"L": ST[int(3)], "s": ST[int(2)], "S": ST[int(2)], "d": ST[int(0)], "D": ST[int(1)], "b": W[int(0)], "W": _C.WHITE}, (-7), (-2))
	var g = fmod((ph * 2), 1)
	if (g < 0.25):
		_A.sparkle(p, ((-5) + (g * 16)), (-1), (1 + _M.js_round((2 * sin(((float(g) / 0.25) * PI))))), _C.WHITE, ST[int(3)], 0.25)
