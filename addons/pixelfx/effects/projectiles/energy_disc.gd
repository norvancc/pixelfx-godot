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
## Source: src/fx/projectiles/energy-disc.js
const META = {"id":"pixelfx.energy_disc","name":"Energy disc","desc":"A sawblade of crackling energy spinning flat out as it flies: hooked teeth bright on their leading edges, a white hub, spiral arms churning, sparks flung off the teeth.","tags":["projectile","disc","saw","energy","sci-fi","directional","loop"],"size":[120,52],"origin":[92,26],"duration":0.5,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#0a0f2e","#172a78","#2550d0","#3f8cff","#7cc8ff","#c8f0ff","#ffffff"],"size":9,"teeth":8,"speed":220,"seed":5},"cacheable":true,"layers":["front"]}
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
		elif key == "teeth": fields.append({"name":key,"type":TYPE_INT,"default":int(value),"min":4,"max":16,"hint":PROPERTY_HINT_RANGE,"hint_string":"4,16,1"})
		else:
			var limits = {"size":[3,14],"teeth":[4,16],"speed":[0,520]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-193, -127, 322, 254)
func draw(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 7)
	var R = o.size
	var N = o.teeth
	var V = o.speed
	var S = o.seed
	var D = META.duration
	var left = ((-META.origin[int(0)]) + 2)
	var rot = (float(((TAU * 3) * t)) / D)
	var seg = (float(TAU) / N)
	var frac = func(x):
		return (x - floori(x))
	_A.beat(t, D, 8, (S + 4), func(r):
		return r.range_value(0.12, 0.22), func(age, life, r):
		var k = (float(age) / life)
		var side = ((-1) if r.chance(0.5) else 1)
		var x0 = ((-2) - (age * r.range_value(180, 260)))
		var len = (r.range_value(8, 16) * (0.5 + k))
		var y = (side * (R + r.range_value(0.5, 3)))
		if ((x0 - len) < left):
			return null
		p.line(x0, y, (x0 - len), y, (C[int(5)] if (k < 0.35) else (C[int(4)] if (k < 0.7) else C[int(3)])), func(u):
			return (1 if (u < 0.65) else (float((1 - u)) / 0.35))))
	p.glow_line((-2), 0, (-26), 0, 8, C[int(3)], 0.35)
	var SP = [_C.WHITE, C[int(5)], C[int(4)], C[int(3)]]
	_A.beat(t, D, 20, S, func(r):
		return r.range_value(0.12, 0.3), func(age, life, r):
		var a = ((rot - (r.range_value(0, TAU) * 0)) + r.range_value(0, TAU))
		var tip = (R + 3.5)
		var x0 = (cos(a) * tip)
		var y0 = (sin(a) * tip)
		var v = r.range_value(120, 230)
		var _tuple1 = _J.wake(x0, y0, ((-sin(a)) * v), (cos(a) * v), age, (V * 0.6), 2.4, 60)
		var x = _tuple1[0]
		var y = _tuple1[1]
		var vx = _tuple1[2]
		var vy = _tuple1[3]
		if ((x > (left + 8)) and (absf(y) < 23)):
			_B.spark(p, x, y, vx, vy, (1 - (float(age) / life)), SP, 0.45, 0.014, 7))
	p.shade(((-R) - 5), ((-R) - 5), (R + 5), (R + 5), func(x, y, _unused2=null):
		var r = sqrt((x)*(x) + (y)*(y))
		var th = atan2(y, x)
		if (r > (R + 4.6)):
			return null
		if (r <= R):
			if (r < 1.8):
				return _C.WHITE
			if (r < 2.9):
				return C[int(1)]
			if (r > (R - 1.1)):
				return C[int(5)]
			var arm = sin(((3 * (th - (rot * 0.5))) - (r * 0.85)))
			return (C[int(5)] if (arm > 0.65) else (C[int(4)] if (arm > 0.2) else (C[int(3)] if (arm > (-0.3)) else C[int(2)])))
		var ph = frac.call((float((th - rot)) / seg))
		var h = (4.2 * pow(ph, 1.4))
		if ((r - R) < h):
			return (_C.WHITE if (ph > 0.86) else (C[int(6)] if (ph > 0.6) else (C[int(5)] if (ph > 0.35) else C[int(4)])))
		if ((r - R) < 1.6):
			return C[int(2)])
	var fr = floori(((t * 30) + 0.000001))
	if true:
		var j = 0
		while (j < 3):
			var g = _M.rng([fr, j, S])
			var a0 = g.range_value(0, TAU)
			var pts = []
			if true:
				var i = 0
				while (i <= 4):
					var rr = (2.5 + (float(((R - 3) * i)) / 4))
					var a = ((a0 + (i * 0.25)) + (g.range_value((-0.35), 0.35) if i else 0))
					pts.append([(cos(a) * rr), (sin(a) * rr)])
					i += 1.0
			p.polyline(pts, (C[int(6)] if j else _C.WHITE))
			j += 1.0
	p.ring(0, 0, (R + 0.5), 1, C[int(6)])
	p.glow(0, 0, 30, C[int(3)], 0.4)
	p.glow(0, 0, 6, C[int(5)], 0.35)
	p.glow((cos(rot) * R), (sin(rot) * R), 5, C[int(6)], 0.4)
