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
## Source: src/fx/projectiles/muzzle-shotgun.js
const META = {"id":"pixelfx.muzzle_shotgun","name":"Shotgun blast","desc":"A shotgun blast from a muzzle `height` px above the floor (the origin): a wide ragged fan of flame, pellet streaks, a heavy rolling smoke cloud, a red shell kicked out on the pump.","tags":["projectile","muzzle","gun","shotgun","flash","smoke","casing","directional","one-shot"],"size":[160,88],"origin":[44,82],"duration":3.2,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"smoke":["#221e2a","#36313f","#4e4858","#6a6474","#888192","#a8a1b1","#c8c1cf"],"shell":["#4a0f14","#9a1e22","#d8423a","#8c5c1c","#e9b54a"],"height":26,"seed":5},"cacheable":false,"layers":["front"]}
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
	return Rect2i(-140, -232, 352, 388)
var F1 = (float(1) / 30)
func fan(R, f):
	var k = (1 if (f == 1) else (0.82 if (f == 2) else 0.55))
	var w = (1 if (f == 1) else 1.25)
	var L = [{"off": 0.5, "a": 0, "len": (11 * k), "wid": (3.6 * w), "core": 0.5}]
	if true:
		var i = 0
		while (i < 9):
			var u = ((float(i) / 8) - 0.5)
			var a = ((u * 1.15) + (R[int((i * 3))] * 0.12))
			var len = (((17 + (11 * (1 - (absf(u) * 1.4)))) + (R[int(((i * 3) + 1))] * 7)) * k)
			L.append({"off": 2, "a": a, "len": len, "wid": ((1.7 + R[int(((i * 3) + 2))]) * w), "core": (0.32 if (f == 1) else 0)})
			i += 1.0
	if (f == 1):
		for s in [(-1), 1]:
			L.append({"off": 1, "a": (s * (1.6 + (R[int((27 + int((s > 0))))] * 0.4))), "len": (5 + (R[int(29)] * 3)), "wid": 1.2, "core": 0})
	return L
var o = {}
var F
var SM
var SH
var H
var MY
var R
var ps
var smoke
var right
var jit
var pellets
var shell
var t
func create(options: Dictionary):
	o = options
	F = _C.fit(o.palette, 9)
	SM = _C.fit(o.smoke, 7)
	SH = _C.fit(o.shell, 5)
	H = o.height
	MY = (-H)
	R = _M.Rng.new(o.seed)
	ps = _S.Particles.new({"rng": R, "ground": func(_unused0=null):
		return 0, "sparks": [F[int(7)], F[int(6)], F[int(4)], F[int(3)]]})
	smoke = _B.Smoke.new(R)
	right = ((META.size[int(0)] - META.origin[int(0)]) - 2)
	jit = _B.make_array(32, func(_unused0=null, _unused1=null):
		return R.next())
	pellets = _B.make_array(10, func(_unused0=null, _unused1=null):
		return {"a": R.range_value((-0.13), 0.13), "v": R.range_value(900, 1150), "d0": R.range_value(0, 4)})
	if true:
		var i = 0
		while (i < 16):
			var a = R.range_value((-0.55), 0.55)
			var sp = R.range_value(180, 460)
			ps.spawn(_S.P.SPARK, 4, MY, (cos(a) * sp), ((sin(a) * sp) - 20), R.range_value(0.08, 0.3))
			i += 1.0
	if true:
		var i = 0
		while (i < 7):
			var a = R.range_value((-0.5), 0.3)
			var sp = R.range_value(70, 200)
			ps.spawn(_S.P.EMBER, 4, MY, (cos(a) * sp), (sin(a) * sp), R.range_value(0.4, 0.9), F[int(5)])
			i += 1.0
	if true:
		var i = 0
		while (i < 26):
			var a = R.range_value((-0.45), 0.35)
			var sp = (R.range_value(60, 230) * (1.15 if (i < 8) else 0.8))
			smoke.add({"x": (4 + R.range_value(0, 4)), "y": (MY + R.range_value((-1.5), 1.5)), "vx": (cos(a) * sp), "vy": (sin(a) * sp), "r0": R.range_value(2.5, 3.5), "r1": R.range_value(7, 12.5), "life": R.range_value(2.1, 2.9), "a": R.range_value(0.55, 0.72), "b": R.range_value(0.9, 1), "drag": R.range_value(2.6, 3.6), "rise": R.range_value(9, 15), "grow": R.range_value(1.8, 2.8), "warm": 1, "delay": R.range_value(0, 0.04)})
			i += 1.0
	if true:
		var i = 0
		while (i < 6):
			smoke.add({"x": 2, "y": MY, "vx": R.range_value(15, 50), "vy": (-R.range_value(10, 25)), "r0": 1.5, "r1": R.range_value(4, 6), "life": R.range_value(1.8, 2.4), "a": 0.5, "b": 1, "drag": 2, "rise": 10, "curl": (-R.range_value(1.5, 3)), "warm": 0.6, "delay": (0.08 + (i * 0.05))})
			i += 1.0
	shell = {"t0": 0.42, "vx": (-R.range_value(30, 55)), "vy": (-R.range_value(110, 150)), "va": (R.sign_value() * R.range_value(16, 24)), "a0": R.range_value(0, 6.28)}
	t = 0
	return self
func update(dt: float, _options: Dictionary) -> void:
	t += dt
	ps.update(dt)
	smoke.update(dt)
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	var pop = exp((float((-(t + 0.008))) / 0.05))
	var list = smoke.puffs()
	for q in list:
		q.w *= (0.25 + (pop * 1.2))
	_J.cloud(p, list, SM, [SM[int(0)], _C.mix(F[int(1)], SM[int(1)], 0.5), _C.mix(F[int(2)], SM[int(2)], 0.4), F[int(3)], F[int(4)], F[int(5)], F[int(7)]], {"dens": 1.4, "max": 0.86, "lit": 1.4})
	if ((t > shell.t0) and (t < (META.duration - 0.05))):
		var k = _B.casing((-9), MY, shell.vx, shell.vy, shell.va, (t - shell.t0), 850, (-1), 0.35, shell.a0)
		var ca = cos(k.a)
		var sa = sin(k.a)
		var fade = clampf((float(((META.duration - 0.05) - t)) / 0.3), 0.0, 1.0)
		if true:
			var d = (-1.5)
			while (d <= 1.5):
				p.dot((k.x + (ca * d)), ((k.y + (sa * d)) - 0.5), ((SH[int(4)] if (d > 1.2) else SH[int(3)]) if (d > 0.8) else (SH[int(2)] if (d > (-0.6)) else SH[int(1)])), fade)
				d += 0.5
		if true:
			var d = (-1)
			while (d <= 1):
				p.dot(((k.x + (ca * d)) - sa), (((k.y + (sa * d)) + ca) - 0.5), (SH[int(3)] if (d > 0.6) else SH[int(0)]), fade)
				d += 0.5
		if ((k.hit >= 0) and (k.hit < 0.07)):
			p.glow(k.x, k.y, 5, SH[int(4)], (0.5 * (1 - (float(k.hit) / 0.07))))
	if (t < (3 * F1)):
		var f = (1 if (t < F1) else (2 if (t < (2 * F1)) else 3))
		_B.flash(p, 0, MY, 0, fan(jit, f), ([_C.WHITE, F[int(7)], F[int(6)], F[int(3)]] if (f == 1) else ([F[int(7)], F[int(6)], F[int(4)], F[int(2)]] if (f == 2) else [F[int(5)], F[int(4)], F[int(3)], F[int(1)]])), (f + 9))
	if (t < 0.2):
		for q in pellets:
			var head = ((6 + q.d0) + (q.v * t))
			var tail = maxf(4, (head - 26))
			var ca = cos(q.a)
			var sa = sin(q.a)
			if true:
				var d = tail
				while (d <= head):
					var x = (ca * d)
					if (x > right):
						break
					var u = (float((d - tail)) / maxf(1, (head - tail)))
					p.dot(x, (MY + (sa * d)), (_C.WHITE if (u > 0.85) else (F[int(6)] if (u > 0.5) else F[int(4)])), (1 if (u > 0.3) else (float(u) / 0.3)))
					d += 0.5
			if ((ca * head) < right):
				p.glow((ca * head), (MY + (sa * head)), 4, F[int(6)], 0.5)
	ps.draw(p)
	p.glow(8, MY, 46, F[int(4)], (0.95 * pop))
	p.glow(4, MY, 12, _C.WHITE, (0.6 * pop))
	p.glow(10, 0, 30, F[int(4)], (0.28 * pop))
