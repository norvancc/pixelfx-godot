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
## Source: src/fx/projectiles/magic-missile.js
const META = {"id":"pixelfx.magic_missile","name":"Magic missile","desc":"Motes gather into an arcane orb at a hand `height` px above the floor (the origin); it weaves to its target trailing a twisting ribbon and bursts into a star of light.","tags":["projectile","magic","arcane","missile","spell","directional","one-shot"],"size":[208,112],"origin":[24,104],"duration":1.9,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#140a26","#2b1252","#481c88","#6b2cc0","#9a48ec","#c684ff","#ecc8ff","#ffffff"],"height":26,"reach":112,"seed":6},"cacheable":false,"layers":["front"]}
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
			var limits = {"height":[8,80],"reach":[64,160]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-168, -254, 496, 412)
var CHARGE = 0.2
var FLY = 0.62
var o = {}
var C
var H
var X1
var R
var ps
var lights
var t
var burst
var trail
func create(options: Dictionary):
	o = options
	C = _C.fit(o.palette, 8)
	H = o.height
	X1 = o.reach
	R = _M.Rng.new(o.seed)
	ps = _S.Particles.new({"rng": R, "ground": func(_unused0=null):
		return 0, "sparks": [_C.WHITE, C[int(6)], C[int(5)], C[int(4)]]})
	lights = _S.Lights.new()

	t = 0
	burst = false
	trail = []
	return self
func pos(u):
	return [((X1 * _B.in_out_sine(u)) + (sin((u * PI)) * 6)), ((-H) + ((sin(((u * TAU) * 1.5)) * 9) * sin((u * PI))))]
func update(dt: float, _options: Dictionary) -> void:
	t += dt
	if (t < CHARGE):
		if R.chance(0.8):
			var a = R.range_value(0, TAU)
			var d = R.range_value(12, 26)
			var sp = (float(d) / 0.14)
			ps.spawn(_S.P.MOTE, (cos(a) * d), ((-H) + (sin(a) * d)), (((-cos(a)) * sp) - ((sin(a) * sp) * 0.5)), (((-sin(a)) * sp) + ((cos(a) * sp) * 0.5)), 0.14, R.pick([C[int(5)], C[int(6)], _C.WHITE]), 0.8)
	else:
		if (t < (CHARGE + FLY)):
			var u = (float((t - CHARGE)) / FLY)
			var _tuple1 = pos(u)
			var x = _tuple1[0]
			var y = _tuple1[1]
			trail.append({"x": x, "y": y, "t": t})
			if R.chance(0.6):
				ps.spawn(_S.P.MOTE, x, y, R.range_value((-50), 50), R.range_value((-50), 50), R.range_value(0.2, 0.4), R.pick([C[int(4)], C[int(5)], C[int(6)]]), 0.7)
			if R.chance(0.25):
				ps.spawn(_S.P.STAR, (x + R.range_value((-3), 3)), (y + R.range_value((-3), 3)), R.range_value((-10), 10), R.range_value((-10), 10), R.range_value(0.25, 0.5), C[int(6)], R.range_value(0.6, 1.6))
		else:
			if (not burst):
				burst = true
				var y = (-H)
				lights.add(X1, y, 52, C[int(4)], 0.95, 0.55)
				lights.add(X1, y, 22, _C.WHITE, 0.8, 0.12)
				if true:
					var i = 0
					while (i < 26):
						var a = R.range_value(0, TAU)
						var sp = (R.range_value(60, 150) * (1 - (0.65 * maxf(0, sin(a)))))
						ps.spawn((_S.P.MOTE if fmod(i, 3) else _S.P.STAR), X1, y, (cos(a) * sp), (sin(a) * sp), R.range_value(0.25, 0.45), R.pick([C[int(5)], C[int(6)], _C.WHITE]), R.range_value(0.8, 1.8))
						i += 1.0
				if true:
					var i = 0
					while (i < 18):
						var a = R.range_value(0, TAU)
						var sp = (R.range_value(110, 240) * (1 - (0.5 * maxf(0, sin(a)))))
						ps.spawn(_S.P.SPARK, X1, y, (cos(a) * sp), ((sin(a) * sp) - 30), R.range_value(0.12, 0.3))
						i += 1.0
				if true:
					var i = 0
					while (i < 14):
						var a = R.range_value(0, TAU)
						var d = R.range_value(4, 22)
						ps.spawn(_S.P.STAR, (X1 + (cos(a) * d)), (y + ((sin(a) * d) * 0.8)), 0, (-R.range_value(2, 8)), R.range_value(0.5, 1.1), R.pick([C[int(6)], _C.WHITE, C[int(5)]]), R.range_value(0.8, 2.6), R.range_value(0.05, 0.45))
						i += 1.0
	ps.update(dt)
	lights.update(dt)
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	var now = t
	var keep = trail.filter(func(q):
		return ((now - q.t) < 0.32))
	if true:
		var i = 1
		while (i < keep.size()):
			var a = keep[int((i - 1))]
			var b = keep[int(i)]
			var dx = (b.x - a.x)
			var dy = (b.y - a.y)
			var l = (sqrt((dx)*(dx) + (dy)*(dy)) if sqrt((dx)*(dx) + (dy)*(dy)) else 1)
			var nx = (float((-dy)) / l)
			var ny = (float(dx) / l)
			if true:
				var f = 0
				while (f < 1):
					var tt = (a.t + ((b.t - a.t) * f))
					var k = (1 - (float((now - tt)) / 0.32))
					var tw = sin((tt * 26))
					var w = (((3.2 * k) * absf(tw)) + 0.4)
					var face = (tw > 0)
					var x = (a.x + (dx * f))
					var y = (a.y + (dy * f))
					if true:
						var s = (-w)
						while (s <= w):
							var edge = (absf(s) > (w - 0.8))
							var c = ((C[int(6)] if edge else (C[int(5)] if (k > 0.6) else C[int(4)])) if face else (C[int(4)] if edge else C[int(2)]))
							p.dot((x + (nx * s)), (y + (ny * s)), c, (1 if (k > 0.35) else (float(k) / 0.35)))
							s += 0.5
					f += (float(0.5) / l)
			if (fmod(i, 3) == 0):
				p.glow(b.x, b.y, 6, C[int(4)], (0.25 * (1 - (float((now - b.t)) / 0.32))))
			i += 1.0
	ps.draw(p)
	if (t < (CHARGE + FLY)):
		var k = ((float(t) / CHARGE) if (t < CHARGE) else 1)
		var _tuple2 = ([0, (-H)] if (t < CHARGE) else pos((float((t - CHARGE)) / FLY)))
		var x = _tuple2[0]
		var y = _tuple2[1]
		var r = (1 + (3 * _E.out_back(k)))
		p.circle(x, y, (r + 1.4), C[int(3)])
		p.circle(x, y, (r + 0.4), C[int(5)])
		p.circle((x - 0.4), (y - 0.4), (r * 0.55), _C.WHITE)
		if true:
			var i = 0
			while (i < 3):
				var a = ((t * 14) + (float((i * TAU)) / 3))
				p.px((x + (cos(a) * (r + 3))), (y + ((sin(a) * (r + 3)) * 0.6)), (C[int(6)] if i else _C.WHITE))
				i += 1.0
		p.glow(x, y, 20, C[int(4)], (0.65 * k))
		p.glow(x, y, 7, C[int(6)], (0.5 * k))
	var q = ((t - CHARGE) - FLY)
	if ((q >= 0) and (q < 0.5)):
		var e = (float(q) / 0.5)
		if (e < 0.5):
			_S.flare(p, X1, (-H), ((26 * pow((1 - (e * 2)), 1.2)) + 2), (1 - (e * 2)), C)
		if (e < 0.12):
			p.circle(X1, (-H), ((6 * (1 - (float(e) / 0.12))) + 1), _C.WHITE)
		p.ring(X1, (-H), (4 + (20 * _E.out_cubic(e))), maxf(1, (2.5 * (1 - e))), (C[int(6)] if (e < 0.3) else C[int(5)]), minf(1, ((1 - e) * 1.5)))
		if (e < 0.4):
			_A.sparkle(p, X1, (-H), (7 * (1 - (float(e) / 0.4))), C[int(6)], C[int(4)], (0.6 * (1 - (float(e) / 0.4))))
	lights.draw(p)
	_M.smooth
