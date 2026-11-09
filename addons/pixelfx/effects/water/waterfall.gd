@tool
extends "../../core/effect.gd"
## Native port of pinned PixelFX 0.3.0 algorithms; MIT (c) Patch / Hugo Duprez.
const _C = preload("../../core/color.gd")
const _M = preload("../../core/math.gd")
const _P = preload("../../core/particles.gd")
const _S = preload("../../core/sim.gd")
const _E = preload("../../core/ease.gd")
const _A = preload("../analytic_helpers.gd")
const _W = preload("water_common.gd")
const _R = preload("../native_bridge.gd")
const _B = preload("b2_elements_common.gd")
## Source: src/fx/water/waterfall.js
const META = {"id":"pixelfx.waterfall","name":"Waterfall","desc":"A river pours from a notch in a rock outcrop: a white curl, a deep sheet that splits into strands, churning foam, spray, drifting mist and rings on a dark pool.","tags":["water","waterfall","cascade","foam","mist","ambient","loop"],"size":[144,136],"origin":[72,118],"duration":2,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#0a1630","#123063","#1b5596","#2a7fc4","#45a9e3","#86d3f5","#cdf1ff","#ffffff"],"height":92,"width":13,"ledge":true,"seed":5},"cacheable":true,"layers":["back","front"]}
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
			var limits = {"height":[40,160],"width":[5,32]}
			fields.append({"name":key,"type":TYPE_FLOAT,"default":float(value),"min":limits[key][0],"max":limits[key][1],"hint":PROPERTY_HINT_RANGE,"hint_string":str(limits[key][0])+","+str(limits[key][1])+",0.1"})
	fields.append({"name":"light","type":TYPE_FLOAT,"default":1.0,"min":0.0,"max":3.0,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,3,0.05"})
	return fields
func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-168, -282, 336, 464)
var D = META.duration
var SY = 0.2
var G = 760
var POOL = [56, 11]
func halfW(W, d, H):
	return (W + (3.2 * pow(clampf((float(d) / H), 0.0, 1.0), 1.6)))
func sheet(p, C, ph, H, W, S):
	if true:
		var y = ((-H) + 2)
		while (y <= (-1)):
			var d = ((y + 0.5) + H)
			var v = (float(d) / H)
			var s = sqrt((d + 3))
			var hw0 = halfW(W, d, H)
			var split = _M.smooth(0.56, 0.95, v)
			var glass = (1 - _M.smooth(4, 24, d))
			var wl = (_M.tile_noise(2, ((s * 1.4) - (ph * 12)), 0, 12, (S + 2)) * (0.4 + (1.8 * v)))
			var wr = (_M.tile_noise(11, ((s * 1.4) - (ph * 12)), 0, 12, (S + 2)) * (0.4 + (1.8 * v)))
			var fan = ((_M.tile_noise(3, ((s * 0.8) - (ph * 4)), 0, 4, (S + 61)) * 1.6) if (split > 0) else 0)
			var sd = ((s * 1.5) - (ph * 20))
			var sb = ((s * 0.45) - (ph * 6))
			if true:
				var X = ((-W) - 8)
				while (X <= (W + 8)):
					var x = (X + 0.5)
					var hw = (hw0 + (wl if (x < 0) else wr))
					var ax = absf(x)
					if (ax > hw):
						X += 1.0
						continue
					var e = (float(ax) / hw)
					var edge = false
					if (split > 0):
						var f = fmod((fmod((float((((float(x) / (1 + (0.22 * split))) + fan) + 64)) / 5.4), 1) + 1), 1)
						if (f > (1 - (0.46 * split))):
							X += 1.0
							continue
						edge = (f < 0.2)
					var dash = _M.tile_noise(((X * 1.618) + 0.31), sd, 0, 20, S)
					if (((_M.rand([X, (S + 60)]) < 0.48) and (e < 0.86)) and (not edge)):
						p.blend(x, (y + 0.5), (C[int(4)] if (dash > 0.45) else (C[int(3)] if (glass > 0.5) else C[int(2)])), (0.7 if (dash > 0.45) else (0.42 + (0.15 * v))))
						X += 1.0
						continue
					var broad = _M.tile_noise((floori((float((x + 40)) / 3)) * 2.7), sb, 0, 6, (S + 1))
					var b = (((((((-0.34) + (0.46 * v)) + (0.3 * broad)) - (glass * 0.5)) + ((0.35 * _M.smooth(0.7, 1, e)) * (1 if (x < 0) else 0.3))) - ((0.12 * e) if (x > 0) else 0)) + (0.3 if edge else 0))
					if (dash > (0.2 - (0.22 * v))):
						b += (0.36 + (0.7 * (dash - 0.2)))
					if (b > (-0.2)):
						p.px(X, y, (_C.WHITE if (b > 0.62) else (C[int(6)] if (b > 0.34) else (C[int(5)] if (b > 0.08) else C[int(4)]))))
					else:
						p.blend(x, (y + 0.5), C[int(3)], 0.8)
					X += 1.0
			y += 1.0
	_P.cycle((ph * D), D, 16, (S + 30), 0.4, func(age, life, r, _unused3=null):
		var side = r.sign_value()
		var d0 = r.range_value(14, (H * 0.7))
		var d = ((d0 + (50 * age)) + ((260 * age) * age))
		var k = (float(age) / life)
		if (d > (H - 6)):
			return null
		var x = (side * ((halfW(W, d, H) + 1.5) + (age * r.range_value(6, 16))))
		var y = ((-H) + d)
		var len = (2 + (6 * k))
		p.line(x, (y - len), x, y, func(u, _unused1=null, _unused2=null, _unused3=null):
			return (C[int(6)] if (u > 0.7) else C[int(4)]), (1 - (k * 0.5))))
var ROCKS = _R.NativeMap.new()
func rockMap(lumps, x0, y0, w, hgt, Lx, Ly, Lz, S):
	var id = _R.fill_array(_R.typed_array("Int8Array", (w * hgt)), (-1))
	var lit = _R.typed_array("Float32Array", (w * hgt))
	if true:
		var j = 0
		while (j < hgt):
			if true:
				var i = 0
				while (i < w):
					var x = ((x0 + i) + 0.5)
					var y = ((y0 + j) + 0.5)
					var _capture_best_74 = [(-1)]
					var _capture_z_75 = [(-1000000000)]
					var _capture_l_76 = [0]
					_B.each_indexed(lumps, func(_arg0, k, _unused2=null, _unused3=null):
						var cx = _B.at(_arg0, 0)
						var cy = _B.at(_arg0, 1)
						var rx = _B.at(_arg0, 2)
						var ry = _B.at(_arg0, 3)
						var nx = (float((x - cx)) / rx)
						var ny = (float((y - cy)) / ry)
						var r2 = ((nx * nx) + (ny * ny))
						if (r2 >= 1):
							return null
						var nz = sqrt((1 - r2))
						var depth = ((nz * ry) + ((-6) if (k == 5) else ((-3) if (k == 2) else ((-1) if (k > 2) else 0))))
						if (depth > _capture_z_75[0]):
							_capture_z_75[0] = depth
							_capture_best_74[0] = k
							_capture_l_76[0] = (((nx * Lx) + (ny * Ly)) + (nz * Lz)))
					id[int(((j * w) + i))] = _capture_best_74[0]
					lit[int(((j * w) + i))] = (_capture_l_76[0] + (0.2 * _M.tile_noise((x * 0.32), (y * 0.32), 0, 0, (S + 70))))
					i += 1.0
			j += 1.0
	return {"id": id, "lit": lit}
func outcrop(p, C, ph, H, W, S):
	var ST = _B.rock()
	var Lx = (-0.55)
	var Ly = (-0.72)
	var Lz = 0.42
	var lumps = [[((-W) - 11), ((-H) - 4), 13, 10], [(W + 8), ((-H) - 2), 9, 7.5], [0, ((-H) + 3.5), (W + 3), 4.2], [((-W) - 21), ((-H) + 4), 7, 5.5], [(W + 15), ((-H) + 4.5), 5, 4], [(-2), ((-H) - 5), (W + 7), 6.5]]
	var x0 = ((-W) - 29)
	var x1 = (W + 21)
	var y0 = ((-H) - 15)
	var y1 = ((-H) + 10)
	var w = ((x1 - x0) + 1)
	var hgt = ((y1 - y0) + 1)
	var key = ("" + str(W) + "|" + str(H) + "|" + str(S) + "")
	var map = ROCKS.get(key)
	if (not map):
		map = rockMap(lumps, x0, y0, w, hgt, Lx, Ly, Lz, S)
		ROCKS.set_value(key, map)
	var _tuple1 = map
	var id = _tuple1.id
	var lit = _tuple1.lit
	p.each(((-W) - 26), (-H), (W + 18), ((-H) + 20), func(x, y, sx, sy):
		var k = (1 - _R.hypot([(float((x + 4)) / (W + 22)), (float((y + H)) / 20)]))
		if (k > 0):
			p.blend_px(sx, sy, ST[int(0)], (0.4 * minf(1, (k * 3)))))
	var at = func(i, j, _unused2=null, _unused3=null):
		return ((-1) if ((((i < 0) if (i < 0) else (j < 0)) if ((i < 0) if (i < 0) else (j < 0)) else (i >= w)) if (((i < 0) if (i < 0) else (j < 0)) if ((i < 0) if (i < 0) else (j < 0)) else (i >= w)) else (j >= hgt)) else id[int(((j * w) + i))])
	if true:
		var j = 0
		while (j < hgt):
			if true:
				var i = 0
				while (i < w):
					var k = id[int(((j * w) + i))]
					var x = (x0 + i)
					var y = (y0 + j)
					if ((((((k == 2) if (k == 2) else (k == 5)) if ((k == 2) if (k == 2) else (k == 5)) else (k < 0)) and (y >= ((-H) - 5))) and (y < ((-H) + 1))) and (absf((x + 0.5)) < (W + 1.5))):
						i += 1.0
						continue
					if (k < 0):
						if ((((at.call((i - 1), j) >= 0) if (at.call((i - 1), j) >= 0) else (at.call((i + 1), j) >= 0)) if ((at.call((i - 1), j) >= 0) if (at.call((i - 1), j) >= 0) else (at.call((i + 1), j) >= 0)) else (at.call(i, (j - 1)) >= 0)) if (((at.call((i - 1), j) >= 0) if (at.call((i - 1), j) >= 0) else (at.call((i + 1), j) >= 0)) if ((at.call((i - 1), j) >= 0) if (at.call((i - 1), j) >= 0) else (at.call((i + 1), j) >= 0)) else (at.call(i, (j - 1)) >= 0)) else (at.call(i, (j + 1)) >= 0)):
							p.px(x, y, ST[int(0)])
						i += 1.0
						continue
					var r = at.call((i + 1), j)
					var b = at.call(i, (j + 1))
					if ((((r >= 0) and (r != k)) and (r < k)) if (((r >= 0) and (r != k)) and (r < k)) else ((b >= 0) and (b != k))):
						p.px(x, y, ST[int(1)])
						i += 1.0
						continue
					var l = lit[int(((j * w) + i))]
					var wet = ((absf((x + 0.5)) < (W + 6)) and (y > ((-H) - 9)))
					var c = (ST[int(5)] if (l > 0.9) else (ST[int(4)] if (l > 0.64) else (ST[int(3)] if (l > 0.3) else (ST[int(2)] if (l > (-0.05)) else ST[int(1)]))))
					if (k == 5):
						c = (ST[int(3)] if (l > 0.7) else (ST[int(2)] if (l > 0.2) else ST[int(1)]))
					if ((at.call(i, (j - 1)) < 0) and (l > 0.25)):
						c = ST[int(5)]
					if wet:
						c = (ST[int(4)] if (l > 0.9) else (ST[int(3)] if (l > 0.64) else (ST[int(2)] if (l > 0.3) else ST[int(1)])))
						if ((l > 0.3) and (_M.tile_noise((x * 0.9), ((y * 0.6) - (ph * 8)), 0, 8, (S + 71)) > 0.42)):
							c = (C[int(6)] if (l > 0.6) else C[int(4)])
					p.px(x, y, c)
					i += 1.0
			j += 1.0
	if true:
		var q = 0
		while (q < 3):
			var L = lumps[int(fmod(q, 2))]
			var cx = floori((L[int(0)] + (((-0.5) if (q == 2) else 0.15) * L[int(2)])))
			var cy = floori((L[int(1)] + (L[int(3)] * (0.1 if (q == 2) else (-0.25)))))
			var len = (3 + floori((_M.rand([q, (S + 74)]) * 4)))
			var dx = (1 if (_M.rand([q, (S + 75)]) < 0.5) else (-1))
			if true:
				var n = 0
				while (n <= len):
					var x = (cx + (_M.js_round((n * 0.6)) * dx))
					var y = (cy + n)
					var i = (x - x0)
					var j = (y - y0)
					if (((at.call(i, j) < 0) if (at.call(i, j) < 0) else (at.call(i, j) > 1)) if ((at.call(i, j) < 0) if (at.call(i, j) < 0) else (at.call(i, j) > 1)) else (at.call(i, (j + 1)) < 0)):
						break
					p.px(x, y, (ST[int(1)] if (n == len) else ST[int(0)]))
					if (n == 0):
						p.px((x - dx), (y - 1), ST[int(4)])
					n += 1.0
			q += 1.0
	for sx in [((-W) - 3), (W + 3)]:
		if true:
			var y = ((-H) - 2)
			while (y < ((-H) + 7)):
				var g = fmod((fmod(((y * 0.35) - (ph * 6)), 1) + 1), 1)
				var i = (floori(sx) - x0)
				var j = (floori(y) - y0)
				if (at.call(i, j) >= 0):
					p.px(sx, y, (C[int(6)] if (g < 0.3) else C[int(3)]))
				y += 1.0
func river(p, C, ph, H, W, S):
	var top = ((-H) - 6)
	p.shade(((-W) - 3), top, (W + 3), (-H), func(x, y, out, _unused3=null):
		var back = ((top + 1.5) + (_M.tile_noise((x * 0.3), 4, 0, 0, (S + 62)) * 1.5))
		var v = (float((y - back)) / ((-H) - back))
		var hw = ((W + 2) - ((1 - v) * 3))
		if ((y < back) if (y < back) else (absf(x) > hw)):
			return null
		var n = _M.tile_noise((x * 0.32), (((y - top) * 0.7) - (ph * 8)), 0, 8, (S + 3))
		out.c = (C[int(6)] if (n > 0.66) else (C[int(5)] if (n > 0.4) else (C[int(3)] if (v < 0.5) else C[int(4)]))))
func curl(p, C, ph, H, W, S):
	if true:
		var x = (-W)
		while (x <= W):
			var g = _M.tile_noise((x * 0.45), (ph * 4), 0, 4, (S + 4))
			p.px(x, ((-H) - 1), C[int(4)])
			p.px(x, (-H), _C.WHITE)
			p.px(x, ((-H) + 1), (C[int(6)] if (g > 0.2) else C[int(5)]))
			x += 1.0
	p.glow_line((-W), (-H), W, (-H), 6, C[int(6)], 0.18)
	p.glow(0, (-H), 34, C[int(5)], 0.2)
	_P.cycle((ph * D), D, 4, (S + 5), 0.36, func(age, life, r, _unused3=null):
		var k = sin((float((PI * age)) / life))
		var x = r.range_value((-W), W)
		if (k > 0.5):
			for _tuple2 in [[1, 0], [(-1), 0], [0, 1], [0, (-1)]]:
				var dx = _tuple2[0]
				var dy = _tuple2[1]
				p.px((x + dx), ((-H) + dy), C[int(6)])
		p.glow(x, (-H), 6, C[int(5)], (0.4 * k)))
func pool(p, C, ph, W, S):
	var _tuple3 = POOL
	var RX = _tuple3[0]
	var RY = _tuple3[1]
	var cy = 2
	var T = (ph * TAU)
	var cols = []
	if true:
		var X = (-RX)
		while (X < RX):
			var x = (X + 0.5)
			_R.push_items(cols, [[sin(((x * 0.11) - (T * 2))), ((sin((T + (x * 0.05))) * 1.4) + (x * 0.13))]])
			X += 1.0
	if true:
		var Y = floori((cy - RY))
		while (Y < (cy + RY)):
			var y = (Y + 0.5)
			var dy = (float((y - cy)) / RY)
			var sy = sin(((y * 0.5) + T))
			if true:
				var X = (-RX)
				while (X < RX):
					var x = (X + 0.5)
					var dx = (float(x) / RX)
					var d = ((dx * dx) + (dy * dy))
					if (d > 1):
						X += 1.0
						continue
					p.blend(x, y, (C[int(2)] if (d < 0.12) else C[int(1)]), (0.62 * minf(1, ((1 - d) * 4))))
					var _tuple4 = cols[int((X + RX))]
					var cx1 = _tuple4[0]
					var cx2 = _tuple4[1]
					var u = ((x * 0.2) + (1.8 * sy))
					var w = ((y * 0.55) + (1.8 * cx1))
					var f = ((maxf(0, (1 - (absf((sin(u) + sin(w))) * 2.6))) + (0.6 * maxf(0, (1 - (absf(sin((cx2 + (y * 0.3)))) * 3))))) * (1 - d))
					if (f > 0.5):
						p.light(x, y, C[int(5)], (0.18 * f))
					X += 1.0
			Y += 1.0
	if true:
		var i = 0
		while (i < 7):
			var a = (PI * (1.12 + (0.76 * (float((i + 0.5)) / 7))))
			var x = ((cos(a) * RX) * 0.96)
			var y = (cy + ((sin(a) * RY) * 0.96))
			var g = sin((((ph * TAU) * 2) + (i * 2.4)))
			if (g > 0.2):
				p.px(x, y, (C[int(6)] if (g > 0.8) else C[int(4)]))
			i += 1.0
	p.shade(((-W) - 3), 3, (W + 3), 10, func(x, y, out, _unused3=null):
		var n = _M.tile_noise((x * 0.9), (((y - 3) * 0.35) + (ph * 6)), 0, 6, (S + 6))
		var k = (1 - (float((y - 3)) / 7))
		if ((absf(x) > ((W + 2) - ((y - 3) * 0.4))) if (absf(x) > ((W + 2) - ((y - 3) * 0.4))) else (n < (0.25 + ((1 - k) * 0.4)))):
			return null
		out.c = (C[int(6)] if ((n > 0.6) and (k > 0.6)) else C[int(5)]))
func foam(p, C, t, ph, W, S):
	var R = (W + 10)
	p.shade((-R), (-13), R, 3, func(x, y, out, _unused3=null):
		var ax = absf(x)
		var lump = ((_M.tile_noise((x * 0.22), (ph * 6), 0, 6, (S + 7)) * 3) + (_M.tile_noise(((x * 0.55) + 9), (ph * 12), 0, 12, (S + 8)) * 1.5))
		var top = (((-8) + lump) + (pow((float(ax) / R), 2) * 7))
		if ((ax > (R - (maxf(0, ((-y) - 1)) * 0.6))) if (ax > (R - (maxf(0, ((-y) - 1)) * 0.6))) else (y < top)):
			return null
		var n = _M.tile_noise((x * 0.5), (((y - top) * 0.5) - (ph * 10)), 0, 10, (S + 9))
		var boil = _M.tile_noise(((x * 0.42) + 3), ((y * 0.42) - (ph * 8)), 0, 8, (S + 12))
		var u = (y - top)
		if (y > 1):
			out.c = (C[int(5)] if (n > 0) else C[int(4)])
		else:
			if (u < 1.2):
				out.c = _C.WHITE
			else:
				if (boil < (-0.3)):
					out.c = (C[int(4)] if (u > 4) else C[int(5)])
				else:
					if (boil < (-0.05)):
						out.c = C[int(6)]
					else:
						out.c = (_C.WHITE if (n > (-0.2)) else C[int(6)]))
	_P.cycle(t, D, 30, (S + 10), 0.7, func(age, life, r, _unused3=null):
		var k = (float(age) / life)
		var side = r.sign_value()
		var x0 = (r.range_value((-W), W) * 0.9)
		var sp = r.range_value(2, 8)
		var up = r.range_value(2, 8)
		var x = (x0 + ((side * _E.out_cubic(k)) * sp))
		var y = ((-r.range_value(2, 5)) - (_E.out_cubic(k) * up))
		var rad = (r.range_value(1.4, 3) * pow(sin((PI * k)), 0.7))
		if (rad > 0.6):
			_B.billow(p, x, y, rad, C))
	_P.cycle(t, D, 18, (S + 11), 1, func(age, life, r, _unused3=null):
		var side = r.sign_value()
		var x0 = (side * r.range_value(2, (W + 4)))
		var vx = (side * r.range_value(12, 60))
		var vy = (-r.range_value(70, 150))
		var z = r.range_value((-3), 9)
		var s = (2 if (r.next() < 0.3) else 1)
		var land = (z * SY)
		var tl = (float(((-vy) + sqrt(((vy * vy) + ((2 * G) * (land + 5)))))) / G)
		if (age < tl):
			_W.bead(p, (x0 + (vx * age)), (((-5) + (vy * age)) + (((0.5 * G) * age) * age)), vx, (vy + (G * age)), s, C)
		else:
			if (age < (tl + 0.35)):
				_W.ring(p, (x0 + (vx * tl)), land, (1 + ((age - tl) * 12)), SY, (1 - (float((age - tl)) / 0.35)), C, {"n": 1}))
func mist(p, C, t, S, n, seed_value):
	_P.cycle(t, D, n, (S + seed_value), func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(1.8, 2.8), func(age, life, r, _unused3=null):
		var k = (float(age) / life)
		var side = r.sign_value()
		var drift = _E.out_cubic(k)
		var x = (side * (r.range_value(3, 12) + (drift * r.range_value(24, 48))))
		var y = ((-r.range_value(2, 7)) - (k * r.range_value(3, 12)))
		var rad = (r.range_value(4, 6) + (k * r.range_value(5, 9)))
		var a = ((r.range_value(0.2, 0.3) * minf(1, (float(k) / 0.12))) * pow((1 - k), 1.7))
		p.disc(x, y, rad, C[int(6)], func(d, _unused1=null, _unused2=null, _unused3=null):
			return (a * (1 - (d * d))))
		if (a > 0.05):
			p.glow(x, y, (rad * 1.2), C[int(4)], (0.35 * a)))
func draw_back(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var ph = (float(t) / D)
	var W = o.width
	pool(p, C, ph, W, o.seed)
	if true:
		var i = 0
		while (i < 3):
			var f = fmod((ph + (float(i) / 3)), 1)
			_W.ring(p, 0, 1, ((W + 6) + (f * 38)), SY, (0.95 * pow((1 - f), 1.5)), C, {"n": 1, "half": (-1), "seed": (i + 1)})
			i += 1.0
	mist(p, C, t, o.seed, 7, 20)
func draw(p, t: float, o: Dictionary) -> void:
	var C = _C.fit(o.palette, 8)
	var ph = (float(t) / D)
	var H = o.height
	var W = o.width
	var S = o.seed
	var T = (ph * TAU)
	if true:
		var i = 0
		while (i < 3):
			var f = fmod((ph + (float(i) / 3)), 1)
			_W.ring(p, 0, 1, ((W + 6) + (f * 38)), SY, (0.95 * pow((1 - f), 1.5)), C, {"n": 1, "half": 1, "seed": (i + 1), "glint": ((1 - (f * 2.5)) if (f < 0.4) else 0)})
			i += 1.0
	river(p, C, ph, H, W, S)
	if o.ledge:
		outcrop(p, C, ph, H, W, S)
	sheet(p, C, ph, H, W, S)
	curl(p, C, ph, H, W, S)
	foam(p, C, t, ph, W, S)
	mist(p, C, t, S, 5, 21)
	_P.cycle(t, D, 12, (S + 50), func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(0.2, 0.4), func(age, life, r, _unused3=null):
		var k = sin((float((PI * age)) / life))
		var low = (r.next() < 0.45)
		var d = ((H - r.range_value(4, 16)) if low else r.range_value(12, (H - 16)))
		var x = (r.range_value(((-W) - 10), (W + 10)) if low else (r.range_value((-0.8), 0.8) * halfW(W, d, H)))
		var y = (((-H) + d) - ((float(age) / life) * (6 if low else (-10))))
		p.px(x, y, _C.WHITE)
		if (k > 0.55):
			for _tuple5 in [[1, 0], [(-1), 0], [0, 1], [0, (-1)]]:
				var dx = _tuple5[0]
				var dy = _tuple5[1]
				p.px((x + dx), (y + dy), C[int(6)])
		if ((k > 0.85) and (r.next() < 0.5)):
			for _tuple6 in [[2, 0], [(-2), 0], [0, 2], [0, (-2)]]:
				var dx = _tuple6[0]
				var dy = _tuple6[1]
				p.px((x + dx), (y + dy), C[int(5)])
		p.glow(x, y, 5, C[int(5)], (0.35 * k)))
	_P.cycle(t, D, 34, (S + 51), func(g, _unused1=null, _unused2=null, _unused3=null):
		return g.range_value(0.9, 1.6), func(age, life, r, _unused3=null):
		var k = (float(age) / life)
		var side = r.sign_value()
		var x = ((side * (r.range_value(0, (W + 6)) + (k * r.range_value(6, 22)))) + (sin(((age * 5) + r.range_value(0, TAU))) * 1.2))
		var y = ((-r.range_value(3, 10)) - (k * r.range_value(10, 34)))
		if ((k > 0.7) and (r.next() < ((k - 0.7) * 3.3))):
			return null
		p.px(x, y, (_C.WHITE if ((k < 0.4) and (r.next() < 0.5)) else C[int(6)])))
	p.glow_line(0, ((-H) + 6), 0, (-8), 26, C[int(4)], 0.12)
	p.glow(0, (-5), 40, C[int(5)], (0.32 + (0.05 * sin((T * 2)))))
	p.glow(0, 4, 50, C[int(3)], 0.14)
