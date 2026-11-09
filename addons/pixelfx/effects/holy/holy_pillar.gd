@tool
extends "../../core/effect.gd"
## Native port of pinned PixelFX 0.3.0 algorithms; MIT (c) Patch / Hugo Duprez.
const _C = preload("../../core/color.gd")
const _M = preload("../../core/math.gd")
const _P = preload("../../core/particles.gd")
const _S = preload("../../core/sim.gd")
const _E = preload("../../core/ease.gd")
const _A = preload("../analytic_helpers.gd")
const _H = preload("holy_common.gd")
const _R = preload("../simulation_bridge.gd")
const _B = preload("../simulation_bridge.gd")
## Source: src/fx/holy/holy-pillar.js
const META = {"id":"pixelfx.holy_pillar","name":"Holy pillar","desc":"Light breaks through from above: a sun opens at the top and a fan of shafts converges on the mark, pulsing, while a sigil burns on the floor; then the fan folds shut.","tags":["holy","pillar","light","rays","aoe","sigil","ground","one-shot"],"size":[192,232],"origin":[96,204],"duration":3.5,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#3b1d2a","#7a3a2c","#c4652e","#f0a040","#ffd25e","#fff0a0","#fffbe0","#ffffff"],"shafts":7,"seed":3},"cacheable":false,"layers":["back","front"]}
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
		elif value is bool:
			fields.append({"name":key,"type":TYPE_BOOL,"default":value})
		elif key == "seed": fields.append({"name":key,"type":TYPE_INT,"default":int(value)})
		else:
			var limits = {"shafts":[3,12]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	for field in fields:
		if field.name in ["count","shafts"]: field.type=TYPE_INT; field.default=int(field.default)
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-192, -300, 384, 424)
var TOP = (-204)
var PY = (-1)
var SUN = (TOP + 38)
var SY = 0.24
var RX = 26
var OPEN = 0.3
var HIT = 0.66
var FOLD = 2.05
var SHUT = 2.45
var LIFT = 2.75
func frac(x):
	return (x - floori(x))
var o = {}
var C
var N
var R
var mid
var WING
var ps
var lights
var feathers
var shafts
var motes
var DMAX
var row
var core
var _capture_t_28
var _capture_hit_29
var _capture_shut_30
var _capture_glinted_31
func create(options: Dictionary):
	o = options
	C = _C.fit(o.palette, 8)
	N = maxf(3, _R.bitwise("|", o.shafts, 0))
	R = _M.Rng.new(o.seed)
	mid = (float((N - 1)) / 2)
	WING = [C[int(2)], C[int(3)], C[int(4)], C[int(5)], C[int(6)], _C.WHITE]
	ps = _S.Particles.new({"rng": R, "ground": _R.weak_callback(self, "_weak_callback_0"), "sparks": [_C.WHITE, C[int(6)], C[int(5)], C[int(3)]]})
	lights = _S.Lights.new()
	feathers = _H.Feathers.new(R, 0)
	shafts = _B.make_array(N, func(_unused, i, _unused2=null, _unused3=null):
		var off = (i - mid)
		var far = (float(absf(off)) / mid)
		return {"th": ((off * (float(0.4) / mid)) + R.range_value((-0.02), 0.02)), "spread": (R.range_value(0.05, 0.085) * (1 - (far * 0.25))), "b": ((1 - (far * 0.35)) * R.range_value(0.8, 1)), "ph": R.range_value(0, 1), "far": far})
	motes = _B.make_array(72, func(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
		return {"x": R.range_value((-80), 80), "y": R.range_value(0, 1), "v": R.range_value(7, 18), "amp": R.range_value(0.5, 2.5), "f": R.range_value(0.6, 1.5), "ph": R.range_value(0, TAU)})
	if true:
		var i = 0
		while (i < 6):
			feathers.add({"x": R.range_value((-46), 46), "y": R.range_value((-150), (-100)), "vx": R.range_value((-8), 8), "vy": R.range_value(0, 8), "a": R.range_value((-0.4), 0.4), "len": R.range_value(7, 9), "wid": R.range_value(1.9, 2.3), "life": R.range_value(1.4, 1.7), "sink": R.range_value(26, 36), "back": (fmod(i, 3) == 0), "delay": (((HIT + 0.1) + (i * 0.16)) + R.range_value(0, 0.08))})
			i += 1.0
	DMAX = (PY - TOP)
	row = _R.buffer_array("Float32Array", 192)
	core = _R.buffer_array("Uint8Array", 192)
	_capture_t_28 = [0]
	_capture_hit_29 = [false]
	_capture_shut_30 = [false]
	_capture_glinted_31 = [false]










	return self
func fan(p):
	var k = fade(_capture_t_28[0])
	if (k <= 0):
		return null
	var lift = liftD(_capture_t_28[0])
	if true:
		var y = ceili(TOP)
		while (y < PY):
			var dy = (PY - (y + 0.5))
			row.fill_value(0)
			core.fill_value(0)
			var any = false
			for s in shafts:
				var a = angle(s, _capture_t_28[0])
				var ca = cos(a)
				var d = (float(dy) / ca)
				if ((d < lift) if (d < lift) else (d < (frontD(s, _capture_t_28[0]) - 6))):
					continue
				var xc = (tan(a) * dy)
				var hw = (float((float(width(s, d, _capture_t_28[0])) / 2)) / ca)
				var soft = (_M.smooth((frontD(s, _capture_t_28[0]) - 6), (frontD(s, _capture_t_28[0]) + 4), d) * _M.smooth(lift, (lift + 6), d))
				var I0 = (((s.b * pulse(s, d, _capture_t_28[0])) * soft) * k)
				if true:
					var x = floori((xc - hw))
					while (x <= ceili((xc + hw))):
						var v = (float(((x + 0.5) - xc)) / hw)
						var i = (x + 96)
						if (((i < 0) if (i < 0) else (i >= 192)) if ((i < 0) if (i < 0) else (i >= 192)) else (absf(v) >= 1)):
							x += 1.0
							continue
						row.set_value(int(i), (row.get_value(int(i)) + (I0 * pow((1 - (v * v)), 1.3))))
						any = true
						x += 1.0
				var ci = (_M.js_round((xc - 0.5)) + 96)
				if ((ci >= 0) and (ci < 192)):
					core.set_value(int(ci), maxf(core.get_value(int(ci)), minf(255, (I0 * 200))))
			if (not any):
				y += 1.0
				continue
			if true:
				var i = 0
				while (i < 192):
					var I = row.get_value(int(i))
					if (I < 0.02):
						i += 1.0
						continue
					var x = (i - 96)
					p.blend(x, y, C[int(6)], minf(0.6, (I * 0.38)))
					p.light(x, y, C[int(4)], minf(0.9, (I * 0.32)))
					if core.get_value(int(i)):
						p.dot(x, y, (_C.WHITE if (core.get_value(int(i)) > 150) else C[int(6)]), minf(1, (float(core.get_value(int(i))) / 180)))
					i += 1.0
			y += 1.0
	if (_capture_t_28[0] > (HIT - 0.05)):
		p.glow(0, (PY - 3), 20, C[int(5)], (0.5 * k))
func sun(p):
	var r = ((15 * _E.out_back(_M.seg(_capture_t_28[0], 0.02, 0.45), 1.8)) * (1 - _E.in_back(_M.seg(_capture_t_28[0], SHUT, (LIFT + 0.1)), 1.5)))
	if (r > 0.5):
		var spin = (_capture_t_28[0] * 0.6)
		p.glow(0, SUN, minf(32, (r * 3)), C[int(4)], 0.5)
		p.glow(0, SUN, (r * 1.4), _C.WHITE, 0.35)
		p.circle(0, SUN, (r * 0.45), _C.WHITE)
		_H.oval(p, 0, SUN, (r * 0.62), (r * 0.62), C[int(6)], 1)
		_H.oval(p, 0, SUN, r, r, func(g, _unused1=null, _unused2=null, _unused3=null):
			return (_C.WHITE if (sin(((g * 6) + (spin * 4))) > 0.5) else C[int(5)]), 1)
		if true:
			var j = 0
			while (j < 16):
				var g = (spin + (float((j * TAU)) / 16))
				var l = (3 if fmod(j, 2) else 6)
				p.line((cos(g) * (r + 2)), (SUN + (sin(g) * (r + 2))), (cos(g) * ((r + 2) + l)), (SUN + (sin(g) * ((r + 2) + l))), func(u, _unused1=null, _unused2=null, _unused3=null):
					return (C[int(6)] if (u < 0.4) else C[int(4)]), func(u, _unused1=null, _unused2=null, _unused3=null):
					return (1.1 - u))
				j += 1.0
	if ((_capture_t_28[0] > LIFT) and (_capture_t_28[0] < (LIFT + 0.3))):
		_A.sparkle(p, 0, SUN, (10 * (1 - (float((_capture_t_28[0] - LIFT)) / 0.3))), _C.WHITE, C[int(5)], 0.6)
func sigil(p, back):
	if (_capture_t_28[0] < HIT):
		return null
	var u = _M.seg(_capture_t_28[0], HIT, (HIT + 0.2))
	var heat = (1 - _M.smooth(SHUT, (SHUT + 0.8), _capture_t_28[0]))
	var out = (1 - _M.smooth((SHUT + 0.4), (SHUT + 1), _capture_t_28[0]))
	if (out <= 0):
		return null
	var keep = ((func(g, _unused1=null, _unused2=null, _unused3=null):
		return (sin(g) < 0)) if back else (func(g, _unused1=null, _unused2=null, _unused3=null):
		return (sin(g) >= 0)))
	var burnt = func(g, _unused1=null, _unused2=null, _unused3=null):
		return (absf((fmod((fmod(((g - (float(PI) / 2)) + PI), TAU) + TAU), TAU) - PI)) <= ((u * PI) + 0.01))
	var col = func(g, hot, _unused2=null, _unused3=null):
		if (not burnt.call(g)):
			return 0
		var flick = (_M.rand([_M.js_round((g * 40)), floori((_capture_t_28[0] * 20))]) < 0.18)
		return (_C.WHITE if ((_capture_t_28[0] < (HIT + 0.08)) if (_capture_t_28[0] < (HIT + 0.08)) else (flick and (heat > 0.4))) else ((C[int(6)] if hot else C[int(5)]) if (heat > 0.6) else (C[int(4)] if (heat > 0.3) else (C[int(3)] if (heat > 0.1) else C[int(2)]))))
	_H.oval(p, 0, 0, RX, (RX * SY), func(g, _unused1=null, _unused2=null, _unused3=null):
		return col.call(g, true), out, func(g, _unused1=null, _unused2=null, _unused3=null):
		return (keep.call(g) and burnt.call(g)))
	_H.oval(p, 0, 0, (RX * 0.72), ((RX * 0.72) * SY), func(g, _unused1=null, _unused2=null, _unused3=null):
		return col.call(g, false), out, func(g, _unused1=null, _unused2=null, _unused3=null):
		return (keep.call(g) and burnt.call(g)))
	if true:
		var j = 0
		while (j < 12):
			var g = ((_capture_t_28[0] * 0.35) + (float((j * TAU)) / 12))
			if ((not keep.call(g)) if (not keep.call(g)) else (not burnt.call(g))):
				j += 1.0
				continue
			var c = col.call(g, (fmod(j, 2) == 0))
			var r0 = (RX * 0.78)
			var r1 = (RX * (0.95 if (fmod(j, 3) == 0) else 0.88))
			if c:
				p.line((cos(g) * r0), ((sin(g) * r0) * SY), (cos(g) * r1), ((sin(g) * r1) * SY), c, out)
			j += 1.0
	if (not back):
		if true:
			var i = (-2)
			while (i <= 2):
				p.glow(((i * RX) * 0.45), (-2), 16, C[int(4)], (((0.34 - (absf(i) * 0.05)) * out) * (0.5 + (0.5 * heat))))
				i += 1.0
		p.glow(0, (-1), 10, _C.WHITE, ((0.3 * heat) * out))
func angle(s, tt, _unused2=null, _unused3=null):
	var st = (s.far * 0.1)
	var open = _E.out_back(_M.seg(tt, (OPEN + st), ((OPEN + st) + 0.42)), 1.5)
	var fold = _R.in_out_cubic(_M.seg(tt, (FOLD - (s.far * 0.1)), SHUT))
	return ((s.th * open) * (1 - fold))
func frontD(s, tt, _unused2=null, _unused3=null):
	return (DMAX * (1 - _E.in_quad(_M.seg(tt, (OPEN + (s.far * 0.06)), (HIT + (s.far * 0.06))))))
func liftD(tt, _unused1=null, _unused2=null, _unused3=null):
	return (DMAX * _E.in_quad(_M.seg(tt, (SHUT + 0.05), LIFT)))
func fade(tt, _unused1=null, _unused2=null, _unused3=null):
	return (_M.smooth(OPEN, (OPEN + 0.1), tt) * (1 - _M.smooth((LIFT - 0.05), (LIFT + 0.05), tt)))
func width(s, d, tt, _unused3=null):
	return ((1.4 + (d * s.spread)) * lerpf(1, 0.25, _M.smooth(SHUT, LIFT, tt)))
func pulse(s, d, tt, _unused3=null):
	if ((tt < HIT) if (tt < HIT) else (tt > SHUT)):
		return 1
	var D = (DMAX * (1 - frac(((float((tt - HIT)) / 0.6) + s.ph))))
	return (1 + (0.9 * exp((-pow((float((d - D)) / 12), 2)))))
func lightAt(x, y, _unused2=null, _unused3=null):
	var dy = (PY - y)
	if (dy <= 0):
		return 0
	var I = 0
	for s in shafts:
		var a = angle(s, _capture_t_28[0])
		var d = (float(dy) / cos(a))
		var xc = (tan(a) * dy)
		var hw = (float((float(width(s, d, _capture_t_28[0])) / 2)) / cos(a))
		if ((d < liftD(_capture_t_28[0])) if (d < liftD(_capture_t_28[0])) else (d < frontD(s, _capture_t_28[0]))):
			continue
		var v = (float((x - xc)) / hw)
		if (absf(v) < 1):
			I += ((1 - (v * v)) * s.b)
	return (I * fade(_capture_t_28[0]))
func update(dt: float, _options: Dictionary) -> void:
	_capture_t_28[0] += dt
	if ((_capture_t_28[0] < (OPEN + 0.1)) and R.chance(0.5)):
		var a = R.range_value(0, TAU)
		var D = R.range_value(22, 34)
		var x = (cos(a) * D)
		var y = (SUN + (sin(a) * D))
		var T = R.range_value(0.18, 0.28)
		var v = (float(((D - 10) * 3)) / (exp((3 * T)) - 1))
		ps.spawn(_S.P.STREAK, x, y, ((float((-x)) / D) * v), ((float((SUN - y)) / D) * v), T, (C[int(6)] if R.chance(0.5) else C[int(5)]))
	if ((not _capture_hit_29[0]) and (_capture_t_28[0] >= HIT)):
		_capture_hit_29[0] = true
		lights.add(0, (-30), 64, C[int(5)], 0.85, 0.5)
		lights.add(0, (-6), 30, _C.WHITE, 0.8, 0.12)
		if true:
			var i = 0
			while (i < 26):
				var a = ((float((-PI)) / 2) + R.range_value((-1.2), 1.2))
				var sp = R.range_value(70, 190)
				ps.spawn(_S.P.SPARK, R.range_value((-3), 3), (-2), (cos(a) * sp), (sin(a) * sp), R.range_value(0.25, 0.6))
				i += 1.0
	if (((_capture_t_28[0] > HIT) and (_capture_t_28[0] < (SHUT + 0.1))) and R.chance(0.35)):
		var g = R.range_value(0, TAU)
		var r = (RX * (1 if R.chance(0.5) else 0.72))
		ps.spawn(_S.P.EMBER, (cos(g) * r), (((sin(g) * r) * SY) - 1), R.range_value((-6), 6), (-R.range_value(12, 30)), R.range_value(0.5, 0.8), C[int(5)], 1, 0, (4 if (sin(g) < 0) else 0))
	if (((_capture_t_28[0] > HIT) and (_capture_t_28[0] < FOLD)) and R.chance(0.05)):
		ps.spawn(_S.P.STAR, (R.range_value((-1), 1) * 40), (-R.range_value(20, 160)), 0, R.range_value(2, 8), R.range_value(0.3, 0.6), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.8, 1.8))
	if ((not _capture_shut_30[0]) and (_capture_t_28[0] >= SHUT)):
		_capture_shut_30[0] = true
		lights.add(0, (-60), 70, C[int(5)], 0.7, 0.35)
		if true:
			var i = 0
			while (i < 12):
				ps.spawn(_S.P.STAR, R.range_value((-4), 4), (-R.range_value(10, 170)), R.range_value((-25), 25), R.range_value((-10), 10), R.range_value(0.4, 0.8), (_C.WHITE if R.chance(0.5) else C[int(6)]), R.range_value(0.8, 2))
				i += 1.0
	if ((not _capture_glinted_31[0]) and (_capture_t_28[0] >= LIFT)):
		_capture_glinted_31[0] = true
		lights.add(0, SUN, 40, _C.WHITE, 0.6, 0.2)
	ps.update(dt)
	feathers.update(dt)
	lights.update(dt)
func draw_back(p, _time_argument: float, _options: Dictionary) -> void:
	fan(p)
	sigil(p, true)
	feathers.draw(p, WING, "back")
	ps.draw(p, "back")
func draw(p, _time_argument: float, _options: Dictionary) -> void:
	sigil(p, false)
	for m in motes:
		var y = (TOP + fmod((fmod(((m.y * DMAX) + (_capture_t_28[0] * m.v)), DMAX) + DMAX), DMAX))
		var x = (m.x + (sin(((_capture_t_28[0] * m.f) + m.ph)) * m.amp))
		var I = lightAt(x, y)
		if (I < 0.2):
			continue
		p.dot(x, y, (_C.WHITE if (I > 0.7) else C[int(6)]), minf(1, (I * 1.3)))
		p.light(x, y, C[int(5)], (0.4 * minf(1, I)))
	sun(p)
	if ((_capture_t_28[0] > (HIT - 0.02)) and (_capture_t_28[0] < (HIT + 0.25))):
		_A.sparkle(p, 0, (PY - 2), (12 * (1 - (float((_capture_t_28[0] - HIT)) / 0.25))), _C.WHITE, C[int(5)], 0.7)
	if ((_capture_t_28[0] > SHUT) and (_capture_t_28[0] < (SHUT + 0.2))):
		_A.sparkle(p, 0, (PY - 2), (8 * (1 - (float((_capture_t_28[0] - SHUT)) / 0.2))), _C.WHITE, C[int(5)], 0.5)
	feathers.draw(p, WING, "front")
	ps.draw(p, "front")
	lights.draw(p)
func _weak_callback_0(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
	return 0
