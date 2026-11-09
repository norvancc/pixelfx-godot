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
## Source: src/fx/projectiles/cannonball.js
const META = {"id":"pixelfx.cannonball","name":"Cannon shot","desc":"A cannon fires from a muzzle `height` px above the floor (the origin): a white flash, a tongue of flame, the ball arcing off trailing smoke, a big gunsmoke cloud rolling out.","tags":["projectile","cannon","cannonball","smoke","flash","directional","one-shot"],"size":[208,116],"origin":[48,102],"duration":3.8,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"smoke":["#3a3542","#55505e","#736d7c","#938d9b","#b3adba","#d2cdd6","#ece8ee"],"iron":["#141218","#2c2a34","#4c4a58","#8a8898"],"height":12,"seed":4},"cacheable":false,"layers":["front"]}
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
			var limits = {"height":[8,80]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-144, -266, 400, 444)
var ANG = (-0.32)
var F1 = (float(1) / 30)
var o = {}
var F
var SM
var IR
var H
var MY
var R
var ps
var smoke
var lights
var ca
var sa
var right
var top
var ball
var jit
var t
var wisp
func create(options: Dictionary):
	o = options
	F = _C.fit(o.palette, 9)
	SM = _C.fit(o.smoke, 7)
	IR = _C.fit(o.iron, 4)
	H = o.height
	MY = (-H)
	R = _M.Rng.new(o.seed)
	ps = _S.Particles.new({"rng": R, "ground": func(_unused0=null):
		return 0, "sparks": [F[int(7)], F[int(6)], F[int(4)], F[int(3)]]})
	smoke = _B.Smoke.new(R)
	lights = _S.Lights.new()
	ca = cos(ANG)
	sa = sin(ANG)
	right = ((META.size[int(0)] - META.origin[int(0)]) - 3)
	top = ((-META.origin[int(1)]) + 3)
	ball = {"x": 4, "y": MY, "vx": (ca * 330), "vy": (sa * 330), "out": false}
	jit = _B.make_array(16, func(_unused0=null, _unused1=null):
		return R.next())
	lights.add(12, (MY - 2), 44, _B.color("#ffb060"), 1, 0.35)
	lights.add(6, MY, 18, _C.WHITE, 0.9, 0.08)
	if true:
		var i = 0
		while (i < 22):
			var a = (ANG + R.range_value((-0.45), 0.45))
			var sp = R.range_value(140, 380)
			ps.spawn(_S.P.SPARK, 6, MY, (cos(a) * sp), (sin(a) * sp), R.range_value(0.1, 0.4))
			i += 1.0
	if true:
		var i = 0
		while (i < 10):
			var a = (ANG + R.range_value((-0.3), 0.3))
			var sp = R.range_value(70, 170)
			ps.spawn(_S.P.SPARK, 6, MY, (cos(a) * sp), (sin(a) * sp), R.range_value(0.5, 0.9))
			i += 1.0
	if true:
		var i = 0
		while (i < 8):
			var a = (ANG + R.range_value((-0.5), 0.3))
			var sp = R.range_value(40, 110)
			ps.spawn(_S.P.EMBER, 8, MY, (cos(a) * sp), (sin(a) * sp), R.range_value(0.7, 1.4), F[int(5)], 2)
			i += 1.0
	if true:
		var i = 0
		while (i < 34):
			var a = (ANG + R.range_value((-0.4), 0.35))
			var sp = (R.range_value(40, 260) * (1.1 if (i < 12) else 0.75))
			smoke.add({"x": (6 + R.range_value(0, 6)), "y": (MY + R.range_value((-2), 2)), "vx": (cos(a) * sp), "vy": (sin(a) * sp), "r0": R.range_value(3, 4.5), "r1": R.range_value(9, 16), "life": R.range_value(2.7, 3.5), "a": R.range_value(0.6, 0.75), "b": R.range_value(0.9, 1), "drag": R.range_value(2.2, 3.2), "rise": R.range_value(7, 13), "grow": R.range_value(1.5, 2.4), "curl": R.range_value((-1.2), 0.4), "warm": 1, "delay": R.range_value(0, 0.05)})
			i += 1.0
	t = 0
	wisp = 0
	return self
func update(dt: float, _options: Dictionary) -> void:
	t += dt
	if (not ball.out):
		var x0 = ball.x
		var y0 = ball.y
		ball.vy += (260 * dt)
		ball.x += (ball.vx * dt)
		ball.y += (ball.vy * dt)
		if true:
			wisp += (float(sqrt(((ball.x - x0))*((ball.x - x0)) + ((ball.y - y0))*((ball.y - y0)))) / 2)
			while (wisp > 1):
				var f = R.next()
				var x = (x0 + ((ball.x - x0) * f))
				var y = (y0 + ((ball.y - y0) * f))
				if (((x < (right - 8)) and (x > 24)) and (t < 0.6)):
					smoke.add({"x": (x - 3), "y": y, "vx": ((-ball.vx) * 0.04), "vy": ((-ball.vy) * 0.04), "r0": 1, "r1": (R.range_value(2.5, 3.6) * (1 - t)), "life": R.range_value(0.7, 1.1), "a": (0.5 * (1 - t)), "b": 0.95, "drag": 2, "rise": 5, "grow": 2})
				wisp -= 1.0
		if ((ball.x > right) if (ball.x > right) else (ball.y < top)):
			ball.out = true
	ps.update(dt)
	smoke.update(dt)
	lights.update(dt)
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	var pop = exp((float((-(t + 0.008))) / 0.06))
	var list = smoke.puffs()
	for q in list:
		q.w *= (0.2 + (pop * 1.3))
	_J.cloud(p, list, SM, [SM[int(0)], _C.mix(F[int(1)], SM[int(1)], 0.5), _C.mix(F[int(2)], SM[int(2)], 0.45), F[int(3)], F[int(4)], F[int(6)], F[int(7)]], {"dens": 1.35, "max": 0.86, "lit": 1.3})
	ps.draw(p)
	if (not ball.out):
		var x = ball.x
		var y = ball.y
		p.circle(x, y, 3.2, IR[int(0)])
		p.circle(x, y, 2.6, IR[int(1)])
		p.circle((x - 0.7), (y - 0.7), 1.8, IR[int(2)])
		p.px((x - 1), (y - 1.5), IR[int(3)])
		p.px((x - 2), (y - 1), IR[int(3)])
		p.px((x + 1.5), (y + 1), (F[int(5)] if (t < 0.3) else IR[int(2)]))
		p.glow(x, y, 6, F[int(4)], (0.45 * clampf((1 - (float(t) / 0.5)), 0.0, 1.0)))
	if (t < (3 * F1)):
		var f = (1 if (t < F1) else (2 if (t < (2 * F1)) else 3))
		var k = ((1 if (f == 1) else (1.15 if (f == 2) else 0.8)) * 1.3)
		var L = [{"off": 0, "a": 0, "len": (12 * k), "wid": (5 * k), "core": 0.55}, {"off": 2, "a": 0, "len": ((24 + (jit[int(0)] * 8)) * k), "wid": (2.2 * k), "core": 0.4}]
		if true:
			var i = 0
			while (i < 6):
				var a = (((-1) if (i < 3) else 1) * ((0.4 + (fmod(i, 3) * 0.45)) + (jit[int((i + 1))] * 0.2)))
				var down = sin((ANG + a))
				var len = (((8 + (jit[int((i + 7))] * 7)) * k) * (0.7 if (f == 3) else 1))
				if (down > 0.1):
					len = minf(len, (float((H - 3)) / down))
				L.append({"off": 2, "a": a, "len": len, "wid": (1.6 * k), "core": 0.25})
				i += 1.0
		_B.flash(p, 4, MY, ANG, L, ([_C.WHITE, F[int(7)], F[int(6)], F[int(3)]] if (f == 1) else ([F[int(7)], F[int(6)], F[int(4)], F[int(2)]] if (f == 2) else [F[int(5)], F[int(4)], F[int(3)], F[int(1)]])), f)
		if (f == 1):
			p.circle(7, (MY - 1), 6.5, _C.WHITE)
			p.ring(7, (MY - 1), 7.5, 1, F[int(7)])
	lights.draw(p)
	p.glow(14, 0, 22, F[int(4)], (0.25 * pop))
