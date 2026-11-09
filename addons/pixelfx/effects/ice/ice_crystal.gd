@tool
extends "../../core/effect.gd"
## Native port of pinned PixelFX 0.3.0 algorithms; MIT (c) Patch / Hugo Duprez.
const _C = preload("../../core/color.gd")
const _M = preload("../../core/math.gd")
const _P = preload("../../core/particles.gd")
const _S = preload("../../core/sim.gd")
const _E = preload("../../core/ease.gd")
const _A = preload("../analytic_helpers.gd")
const _R = preload("../native_bridge.gd")
const _B = preload("../native_bridge.gd")
## Source: src/fx/ice/ice-crystal.js
const META = {"id":"pixelfx.ice_crystal","name":"Ice crystal","desc":"A floating ice crystal turning slowly in its own cold light: its facets brighten and darken as they turn, glints flash on them, frost motes circle it.","tags":["ice","crystal","gem","pickup","float","magic","loop"],"size":[96,100],"origin":[48,92],"duration":3,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#151a3d","#212f6b","#2c58aa","#3a8bd8","#62c8f4","#a6ecff","#dcfbff","#ffffff"],"height":34,"seed":21},"cacheable":true,"layers":["back","front"]}
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
			var limits = {"height":[16,60]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-144, -214, 288, 344)
var TIP = 0.28
var LIGHT = norm([(-0.55), (-0.75), (-0.45)])
func norm(_arg0):
	var x = _B.at(_arg0, 0)
	var y = _B.at(_arg0, 1)
	var z = _B.at(_arg0, 2)
	var l = (_R.hypot([x, y, z]) if _R.hypot([x, y, z]) else 1)
	return [(float(x) / l), (float(y) / l), (float(z) / l)]
func crystalFaces(th, R):
	var ct = cos(TIP)
	var st = sin(TIP)
	var P = func(x, y, z, _unused3=null):
		return [x, ((y * ct) - (z * st)), ((y * st) + (z * ct))]
	var ring = func(y, _unused1=null, _unused2=null, _unused3=null):
		return _B.make_array(6, func(_unused, k, _unused2=null, _unused3=null):
			return P.call((cos((th + (float((k * TAU)) / 6))) * R), y, (sin((th + (float((k * TAU)) / 6))) * R)))
	var top = ring.call(((-R) * 0.45))
	var bot = ring.call((R * 0.45))
	var A = P.call(0, ((-R) * 2.2), 0)
	var Z = P.call(0, (R * 1.7), 0)
	var faces = []
	if true:
		var k = 0
		while (k < 6):
			var j = fmod((k + 1), 6)
			_R.push_items(faces, [[A, top[int(j)], top[int(k)]], [top[int(k)], top[int(j)], bot[int(j)], bot[int(k)]], [bot[int(k)], bot[int(j)], Z]])
			k += 1.0
	var out = []
	for f in faces:
		var _tuple1 = f
		var a = _tuple1[0]
		var b = _tuple1[1]
		var c = _tuple1[2]
		var u = [(b[int(0)] - a[int(0)]), (b[int(1)] - a[int(1)]), (b[int(2)] - a[int(2)])]
		var v = [(c[int(0)] - a[int(0)]), (c[int(1)] - a[int(1)]), (c[int(2)] - a[int(2)])]
		var n = norm([((u[int(1)] * v[int(2)]) - (u[int(2)] * v[int(1)])), ((u[int(2)] * v[int(0)]) - (u[int(0)] * v[int(2)])), ((u[int(0)] * v[int(1)]) - (u[int(1)] * v[int(0)]))])
		var cx = (float(_R.reduce_array(f, func(s, q, _unused2=null, _unused3=null):
			return (s + q[int(0)]), 0)) / f.size())
		var cy = (float(_R.reduce_array(f, func(s, q, _unused2=null, _unused3=null):
			return (s + q[int(1)]), 0)) / f.size())
		var cz = (float(_R.reduce_array(f, func(s, q, _unused2=null, _unused3=null):
			return (s + q[int(2)]), 0)) / f.size())
		if ((((n[int(0)] * cx) + (n[int(1)] * cy)) + (n[int(2)] * cz)) < 0):
			n = _B.map_indexed(n, func(q, _unused1=null, _unused2=null, _unused3=null):
				return (-q))
		if (n[int(2)] >= (-0.02)):
			continue
		var lit = maxf(0, (((n[int(0)] * LIGHT[int(0)]) + (n[int(1)] * LIGHT[int(1)])) + (n[int(2)] * LIGHT[int(2)])))
		var h = norm([LIGHT[int(0)], LIGHT[int(1)], (LIGHT[int(2)] - 1)])
		var spec = maxf(0, (((n[int(0)] * h[int(0)]) + (n[int(1)] * h[int(1)])) + (n[int(2)] * h[int(2)])))
		_R.push_items(out, [{"pts": _B.map_indexed(f, func(q, _unused1=null, _unused2=null, _unused3=null):
			return [q[int(0)], q[int(1)]]), "lit": lit, "spec": spec, "cx": cx, "cy": cy}])
	return out
func hullOf(pts):
	var P = _R.sort_array(_R.concat_arrays([pts]), func(a, b, _unused2=null, _unused3=null):
		return (((a[int(0)] - b[int(0)]) if (a[int(0)] - b[int(0)]) else (a[int(1)] - b[int(1)])) < 0))
	var cross = func(o, a, b, _unused3=null):
		return (((a[int(0)] - o[int(0)]) * (b[int(1)] - o[int(1)])) - ((a[int(1)] - o[int(1)]) * (b[int(0)] - o[int(0)])))
	var lo = []
	var hi = []
	for q in P:
		while ((lo.size() >= 2) and (cross.call(lo[int((lo.size() - 2))], lo[int((lo.size() - 1))], q) <= 0)):
			lo.pop_back()
		_R.push_items(lo, [q])
	for q in _R.reverse_array(P):
		while ((hi.size() >= 2) and (cross.call(hi[int((hi.size() - 2))], hi[int((hi.size() - 1))], q) <= 0)):
			hi.pop_back()
		_R.push_items(hi, [q])
	return (_R.slice_value(lo, 0, (-1)) + _R.slice_value(hi, 0, (-1)))
func draw_back(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var ph = (float(t) / META.duration)
	var bob = (sin((TAU * ph)) * 2.5)
	var Y = ((-o.height) + bob)
	var s = (1 - (float(bob) / 12))
	var rx = (11 * s)
	if true:
		var x = floori((-rx))
		while (x <= rx):
			var f = (1 - pow((float(x) / rx), 2))
			p.blend((x + 0.5), 0, C[int(0)], (0.65 * f))
			if (absf(x) < (rx * 0.6)):
				p.blend((x + 0.5), 1, C[int(0)], (0.4 * f))
			x += 1.0
	p.glow(0, (-1), 24, C[int(4)], (0.2 + (0.05 * sin(((TAU * ph) * 2)))))
	motes(p, C, t, o, Y, false)
func motes(p, C, t, o, Y, front):
	var D = META.duration
	_P.cycle(t, D, 16, o.seed, func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(1.6, 2.6), func(age, life, r, i):
		var th = (r.range_value(0, TAU) + (age * r.range_value(1.6, 2.6)))
		var R = r.range_value(14, 22)
		var y = ((Y + r.range_value((-14), 12)) - (age * r.range_value(3, 7)))
		var s = sin(th)
		var k = (float(age) / life)
		if ((s >= 0) != front):
			return null
		var x = (cos(th) * R)
		var yy = (y + ((s * R) * 0.3))
		var a = (minf(1, (float(age) / 0.2)) * ((float((1 - k)) / 0.25) if (k > 0.75) else 1))
		if front:
			p.dot(x, yy, (_C.WHITE if (fmod(i, 4) == 0) else C[int(6)]), a)
			if (fmod(i, 4) == 0):
				for _tuple2 in [[1, 0], [(-1), 0], [0, 1], [0, (-1)]]:
					var dx = _tuple2[0]
					var dy = _tuple2[1]
					p.dot((x + dx), (yy + dy), C[int(5)], a)
			p.glow(x, yy, 4, C[int(5)], (0.3 * a))
		else:
			p.dot(x, yy, C[int(4)], (a * 0.9)))
func draw(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var ph = (float(t) / META.duration)
	var bob = (sin((TAU * ph)) * 2.5)
	var Y = ((-o.height) + bob)
	var R = 8
	p.glow(0, Y, 34, C[int(3)], 0.26)
	p.glow(0, Y, 14, C[int(5)], (0.18 + (0.08 * sin(((TAU * ph) * 3)))))
	var faces = crystalFaces(((float(TAU) / 6) * ph), R)
	var hull = hullOf(_R.flat_map(faces, func(f, _unused1=null, _unused2=null, _unused3=null):
		return f.pts))
	var mx = 0
	var my = 0
	for _tuple3 in hull:
		var x = _tuple3[0]
		var y = _tuple3[1]
		mx += x
		my += y
	mx /= hull.size()
	my /= hull.size()
	p.poly(_B.map_indexed(hull, func(_arg0, _unused1=null, _unused2=null, _unused3=null):
		var x = _B.at(_arg0, 0)
		var y = _B.at(_arg0, 1)
		var d = (_R.hypot([(x - mx), (y - my)]) if _R.hypot([(x - mx), (y - my)]) else 1)
		return [(x + ((float((x - mx)) / d) * 1.2)), ((y + Y) + ((float((y - my)) / d) * 1.2))]), C[int(1)])
	for f in faces:
		var c = (_C.WHITE if (f.spec > 0.985) else C[int(clampf(_M.js_round((1 + (pow(f.lit, 1.4) * 6.6))), 1, 7))])
		p.poly(_B.map_indexed(f.pts, func(_arg0, _unused1=null, _unused2=null, _unused3=null):
			var x = _B.at(_arg0, 0)
			var y = _B.at(_arg0, 1)
			return [x, (y + Y)]), c)
	for f in faces:
		if true:
			var i = 0
			while (i < f.pts.size()):
				var _tuple4 = f.pts[int(i)]
				var x0 = _tuple4[0]
				var y0 = _tuple4[1]
				var _tuple5 = f.pts[int(fmod((i + 1), f.pts.size()))]
				var x1 = _tuple5[0]
				var y1 = _tuple5[1]
				p.line(x0, (y0 + Y), x1, (y1 + Y), (C[int(7)] if (f.lit > 0.6) else (C[int(6)] if (f.lit > 0.3) else C[int(4)])))
				i += 1.0
	for f in faces:
		if (f.spec > 0.96):
			_A.sparkle(p, f.cx, (f.cy + Y), _M.js_round((2 + ((f.spec - 0.96) * 150))), C[int(6)], C[int(4)], 0.5)
	var g = fmod((ph * 2), 1)
	if (g < 0.12):
		_A.sparkle(p, 0, (Y - ((R * 2.2) * cos(TIP))), _M.js_round((5 * sin(((float(g) / 0.12) * PI)))), C[int(6)], C[int(4)], 0.6)
	motes(p, C, t, o, Y, true)
