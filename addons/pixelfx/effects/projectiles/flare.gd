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
## Source: src/fx/projectiles/flare.js
const META = {"id":"pixelfx.flare","name":"Signal flare","desc":"A signal flare streaks up off the ground trailing sparks and smoke, bursts, and hangs as a pulsing red star that drips sparks under its own red-lit smoke, then gutters out.","tags":["projectile","flare","signal","fire","smoke","light","one-shot"],"size":[152,232],"origin":[76,226],"duration":5,"loop":false,"fps":30,"bg":"sky","options":{"palette":["#2a0610","#5c0d1c","#9a1428","#d8243a","#ff4d5e","#ff8a94","#ffd0d4","#ffffff"],"smoke":["#1e1a26","#2e2938","#433d4d","#5b5466","#77707f","#958e9c","#b3acb9"],"height":150,"seed":2},"cacheable":false,"layers":["front"]}
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
			var limits = {"height":[60,180]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-172, -352, 344, 484)
var RISE = 0.85
var BURN = 3.1
var o = {}
var C
var SM
var H
var R
var ps
var smoke
var lights
var WR
var t
var burst
var emit
var drip
func create(options: Dictionary):
	o = options
	C = _C.fit(o.palette, 8)
	SM = _C.fit(o.smoke, 7)
	H = o.height
	R = _M.Rng.new(o.seed)
	ps = _S.Particles.new({"rng": R, "ground": func(_unused0=null):
		return 0, "sparks": [_C.WHITE, C[int(6)], C[int(4)], C[int(2)]]})
	smoke = _B.Smoke.new(R)
	lights = _S.Lights.new()
	WR = [C[int(0)], C[int(1)], _C.mix(C[int(2)], SM[int(2)], 0.45), _C.mix(C[int(3)], SM[int(3)], 0.35), C[int(4)], C[int(5)], C[int(6)]]


	t = 0
	burst = false
	emit = 0
	drip = 0
	lights.add(0, (-3), 26, C[int(4)], 0.8, 0.25)
	if true:
		var i = 0
		while (i < 5):
			smoke.add({"x": R.range_value((-3), 3), "y": (-2), "vx": R.range_value((-25), 25), "vy": (-R.range_value(5, 20)), "r0": 2, "r1": R.range_value(4, 6), "life": R.range_value(1, 1.6), "a": 0.5, "warm": 0.8, "rise": 6})
			i += 1.0
	return self
func rise(t):
	return [((sin((t * 3)) * 2) * (float(t) / RISE)), ((-H) * _E.out_cubic(clampf((float(t) / RISE), 0.0, 1.0)))]
func star(t):
	var u = (t - RISE)
	return [((sin((u * 1.6)) * 3) + rise(RISE)[int(0)]), (((-H) + (u * 9)) + (sin((u * 2.3)) * 1.5))]
func update(dt: float, _options: Dictionary) -> void:
	t += dt
	if (t < RISE):
		var _tuple1 = rise(t)
		var x = _tuple1[0]
		var y = _tuple1[1]
		var _tuple2 = rise(maxf(0, (t - dt)))
		var px = _tuple2[0]
		var py = _tuple2[1]
		if true:
			emit += (float(sqrt(((x - px))*((x - px)) + ((y - py))*((y - py)))) / 1.5)
			while (emit > 1):
				smoke.add({"x": (x + R.range_value((-0.6), 0.6)), "y": (y + 4), "vx": R.range_value((-6), 6), "vy": R.range_value(0, 8), "r0": 1.3, "r1": R.range_value(3, 4.8), "life": R.range_value(1.4, 2.1), "a": 0.5, "b": 0.95, "warm": 0.9, "rise": 3, "drag": 2, "grow": 1.4})
				emit -= 1.0
		if R.chance(0.5):
			ps.spawn(_S.P.SPARK, x, (y + 3), R.range_value((-40), 40), R.range_value(20, 90), R.range_value(0.2, 0.45))
	else:
		if (not burst):
			burst = true
			var _tuple3 = star(t)
			var x = _tuple3[0]
			var y = _tuple3[1]
			lights.add(x, y, 64, C[int(4)], 0.9, 0.5)
			lights.add(x, y, 24, _C.WHITE, 0.8, 0.12)
			if true:
				var i = 0
				while (i < 30):
					var a = R.range_value(0, TAU)
					var sp = R.range_value(70, 190)
					ps.spawn(_S.P.SPARK, x, y, (cos(a) * sp), ((sin(a) * sp) - 30), R.range_value(0.25, 0.7))
					i += 1.0
			if true:
				var i = 0
				while (i < 10):
					smoke.add({"x": (x + R.range_value((-3), 3)), "y": (y + R.range_value((-3), 3)), "vx": R.range_value((-40), 40), "vy": R.range_value((-40), 10), "r0": 2.5, "r1": R.range_value(6, 9), "life": R.range_value(1.6, 2.4), "a": 0.55, "warm": 1, "rise": 10, "drag": 2.5})
					i += 1.0
		else:
			if (t < (RISE + BURN)):
				var _tuple4 = star(t)
				var x = _tuple4[0]
				var y = _tuple4[1]
				var k = (float((t - RISE)) / BURN)
				var power = (1 - _M.smooth(0.75, 1, k))
				if true:
					drip += ((dt * 26) * power)
					while (drip > 1):
						ps.spawn(_S.P.SPARK, (x + R.range_value((-1.5), 1.5)), (y + 2), R.range_value((-30), 30), R.range_value(10, 60), R.range_value(0.35, 0.8))
						drip -= 1.0
				if R.chance(((dt * 18) * power)):
					smoke.add({"x": (x + R.range_value((-1.5), 1.5)), "y": (y - 2), "vx": R.range_value((-8), 8), "vy": (-R.range_value(15, 30)), "r0": 2, "r1": R.range_value(6, 10), "life": (R.range_value(1.6, 2.4) * (1 - (0.4 * k))), "a": 0.5, "b": 0.85, "warm": 1, "rise": 14, "drag": 1.6, "grow": 1.2})
	ps.update(dt)
	smoke.update(dt)
	lights.update(dt)
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	var list = smoke.puffs()
	var lit = ((1 - _M.smooth(0.75, 1, (float((t - RISE)) / BURN))) if ((t > RISE) and (t < (RISE + BURN))) else 0)
	if (lit > 0):
		var _tuple5 = star(t)
		var sx = _tuple5[0]
		var sy = _tuple5[1]
		for q in list:
			q.w = maxf(q.w, (lit * exp((float((-sqrt(((q.x - sx))*((q.x - sx)) + ((q.y - sy))*((q.y - sy))))) / 26))))
	_J.cloud(p, list, SM, WR, {"dens": 1.4, "max": 0.8, "lit": 1.3})
	ps.draw(p)
	if (t < RISE):
		var _tuple6 = rise(t)
		var x = _tuple6[0]
		var y = _tuple6[1]
		p.line(x, (y + 1), x, (y + 5), func(u):
			return (C[int(6)] if (u < 0.3) else (C[int(4)] if (u < 0.7) else C[int(3)])))
		p.px(x, y, _C.WHITE)
		p.px(x, (y - 1), C[int(6)])
		p.glow(x, y, 14, C[int(4)], 0.6)
		p.glow(x, y, 4, _C.WHITE, 0.4)
	else:
		if (t < (RISE + BURN)):
			var _tuple7 = star(t)
			var x = _tuple7[0]
			var y = _tuple7[1]
			var u = (t - RISE)
			var k = (float(u) / BURN)
			var fr = floori((t * 30))
			var fl = ((0.8 + (0.2 * _M.rand([fr, 3]))) + (0.08 * sin((u * 19))))
			var die = (1 - _M.smooth(0.78, 1, k))
			if (u < 0.25):
				var e = (float(u) / 0.25)
				_S.flare(p, x, y, ((22 * (1 - e)) + 3), (1 - e), C)
				if (e < 0.25):
					p.circle(x, y, ((5 * (1 - (e * 3))) + 1), _C.WHITE)
			var r = ((2 + (0.6 * fl)) * (0.4 + (0.6 * die)))
			p.circle(x, y, (r + 1.2), C[int(3)])
			p.circle(x, y, r, (C[int(5)] if (die > 0.4) else C[int(4)]))
			if (die > 0.25):
				p.circle((x - 0.3), (y - 0.3), (r * 0.55), (_C.WHITE if (die > 0.6) else C[int(6)]))
			if ((die > 0.15) and (_M.rand([fr, 9]) > 0.15)):
				_A.sparkle(p, x, y, _M.js_round(((5 + (3 * fl)) * die)), C[int(6)], C[int(4)], (0.5 * die))
			p.glow(x, y, (70 * (0.6 + (0.4 * die))), C[int(3)], ((0.55 * fl) * die))
			p.glow(x, y, 22, C[int(4)], ((0.5 * fl) * die))
			p.glow(x, y, 6, _C.WHITE, (0.35 * die))
	lights.draw(p)
