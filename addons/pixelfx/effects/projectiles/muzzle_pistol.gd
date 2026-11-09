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
## Source: src/fx/projectiles/muzzle-pistol.js
const META = {"id":"pixelfx.muzzle_pistol","name":"Pistol shot","desc":"One pistol shot from a muzzle `height` px above the floor (the origin): a spiky white-cored flash, sparks, a curl of smoke hooking up and back, a casing that bounces and settles.","tags":["projectile","muzzle","gun","pistol","flash","smoke","casing","directional","one-shot"],"size":[96,72],"origin":[44,66],"duration":1.8,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"brass":["#4a2e10","#8c5c1c","#d9a441","#ffe39a"],"smoke":["#26222e","#3b3644","#544e5e","#6f6979","#8c8596","#aca5b5","#cbc4d2"],"height":26,"seed":3},"cacheable":false,"layers":["front"]}
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
	return Rect2i(-140, -216, 288, 372)
var F1 = (float(1) / 30)
var o = {}
var F
var B
var SM
var H
var MY
var R
var ps
var smoke
var shapeSeed
var tilt
var shell
var t
func create(options: Dictionary):
	o = options
	F = _C.fit(o.palette, 9)
	B = _C.fit(o.brass, 4)
	SM = _C.fit(o.smoke, 7)
	H = o.height
	MY = (-H)
	R = _M.Rng.new(o.seed)
	ps = _S.Particles.new({"rng": R, "ground": func(_unused0=null):
		return 0, "sparks": [F[int(7)], F[int(6)], F[int(4)], F[int(3)]]})
	smoke = _B.Smoke.new(R)
	shapeSeed = R.int_value(0, 1000000)
	tilt = R.range_value((-0.05), 0.05)
	if true:
		var i = 0
		while (i < 6):
			var a = R.range_value((-0.3), 0.3)
			var sp = R.range_value(180, 400)
			ps.spawn(_S.P.SPARK, 3, MY, (cos(a) * sp), (sin(a) * sp), R.range_value(0.06, 0.16))
			i += 1.0
	if true:
		var i = 0
		while (i < 5):
			var a = R.range_value((-0.35), 0.25)
			var sp = R.range_value(60, 160)
			ps.spawn(_S.P.EMBER, 3, MY, (cos(a) * sp), (sin(a) * sp), R.range_value(0.25, 0.5), F[int(5)])
			i += 1.0
	if true:
		var i = 0
		while (i < 3):
			smoke.add({"x": 3, "y": MY, "vx": R.range_value(70, 120), "vy": R.range_value((-12), 6), "r0": 1.6, "r1": R.range_value(4.5, 6), "life": R.range_value(0.8, 1.05), "a": 0.55, "drag": 3.5, "rise": 10, "warm": 0.9, "delay": (i * 0.012)})
			i += 1.0
	if true:
		var i = 0
		while (i < 14):
			var k = (float(i) / 13)
			smoke.add({"x": 2, "y": MY, "vx": ((115 - (75 * k)) + R.range_value((-12), 12)), "vy": (((-6) - (10 * k)) + R.range_value((-5), 5)), "r0": 1.4, "r1": ((3.6 + (k * 2.6)) * R.range_value(0.75, 1.25)), "life": (1.15 + (k * 0.3)), "a": 0.62, "b": R.range_value(0.85, 1), "drag": 2.2, "rise": 6, "curl": (((-4.4) + (k * 1.8)) + R.range_value((-0.5), 0.5)), "grow": 1.6, "warm": 0.7, "delay": (0.02 + (i * 0.022))})
			i += 1.0
	smoke.add({"x": (-7), "y": (MY - 2), "vx": (-6), "vy": (-18), "r0": 1.2, "r1": 4, "life": 1.05, "a": 0.4, "rise": 8, "delay": 0.03})
	shell = {"vx": (-R.range_value(25, 45)), "vy": (-R.range_value(95, 130)), "va": (R.sign_value() * R.range_value(22, 32)), "a0": R.range_value(0, 6.28)}
	t = 0
	return self
func update(dt: float, _options: Dictionary) -> void:
	t += dt
	ps.update(dt)
	smoke.update(dt)
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	var pop = exp((float((-(t + 0.008))) / 0.035))
	var list = smoke.puffs()
	for q in list:
		q.w *= (0.4 + pop)
	_J.cloud(p, list, SM, [SM[int(0)], _C.mix(F[int(1)], SM[int(1)], 0.5), _C.mix(F[int(2)], SM[int(2)], 0.4), F[int(3)], F[int(4)], F[int(5)], F[int(7)]], {"dens": 1.5, "max": 0.8, "lit": 1.4})
	if (t < META.duration):
		_B.draw_casing(p, _B.casing((-7), (MY - 1), shell.vx, shell.vy, shell.va, t, 850, (-0.5), 0.42, shell.a0), B, minf(1, (float(((META.duration - 0.05) - t)) / 0.3)))
	if (t < (2 * F1)):
		var f = (1 if (t < F1) else 2)
		var L = _B.flash_shape(_M.rng([shapeSeed]), f, {"size": 1.15, "spike": [15, 22], "diag": [7, 12], "cross": [4.5, 8], "back": [3, 5.5]})
		_B.flash(p, 0, MY, tilt, L, ([_C.WHITE, F[int(7)], F[int(6)], F[int(3)]] if (f == 1) else [F[int(7)], F[int(6)], F[int(4)], F[int(2)]]), (f + o.seed))
	ps.draw(p)
	p.glow(4, MY, 30, F[int(4)], (0.85 * pop))
	p.glow(2, MY, 8, _C.WHITE, (0.5 * pop))
	p.glow(4, 0, 16, F[int(4)], (0.2 * pop))
