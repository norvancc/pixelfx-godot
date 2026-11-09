@tool
class_name PixelFXIceHelpers
extends RefCounted
## Native port of pinned PixelFX 0.3.0 algorithms; MIT (c) Patch / Hugo Duprez.
const _C = preload("../../core/color.gd")
const _M = preload("../../core/math.gd")
const _P = preload("../../core/particles.gd")
const _S = preload("../../core/sim.gd")
const _E = preload("../../core/ease.gd")
const _A = preload("../analytic_helpers.gd")
const _R = preload("../simulation_bridge.gd")
const _B = _R
## Source: src/fx/ice/_lib.js
static func in_poly(pts, x, y):
	var inside = false
	if true:
		var i = 0
		var j = (pts.size() - 1)
		while (i < pts.size()):
			var _tuple1 = pts[int(i)]
			var xi = _tuple1[0]
			var yi = _tuple1[1]
			var _tuple2 = pts[int(j)]
			var xj = _tuple2[0]
			var yj = _tuple2[1]
			if (((yi > y) != (yj > y)) and (x < ((float(((xj - xi) * (y - yi))) / (yj - yi)) + xi))):
				inside = (not inside)
			j = i
			i += 1.0
	return inside
static func centroid(pts):
	var a = 0
	var cx = 0
	var cy = 0
	if true:
		var i = 0
		var j = (pts.size() - 1)
		while (i < pts.size()):
			var _tuple3 = pts[int(j)]
			var x0 = _tuple3[0]
			var y0 = _tuple3[1]
			var _tuple4 = pts[int(i)]
			var x1 = _tuple4[0]
			var y1 = _tuple4[1]
			var k = ((x0 * y1) - (x1 * y0))
			a += k
			cx += ((x0 + x1) * k)
			cy += ((y0 + y1) * k)
			j = i
			i += 1.0
	if (absf(a) < 0.000001):
		var n = pts.size()
		return {"x": (float(_R.reduce_array(pts, func(s, q, _unused2=null, _unused3=null):
			return (s + q[int(0)]), 0)) / n), "y": (float(_R.reduce_array(pts, func(s, q, _unused2=null, _unused3=null):
			return (s + q[int(1)]), 0)) / n), "area": 0}
	return {"x": (float(cx) / (3 * a)), "y": (float(cy) / (3 * a)), "area": (float(absf(a)) / 2)}
static func split_poly(pts, x, y, a):
	var nx = (-sin(a))
	var ny = cos(a)
	var side = func(q, _unused1=null, _unused2=null, _unused3=null):
		return (((q[int(0)] - x) * nx) + ((q[int(1)] - y) * ny))
	var L = []
	var Rt = []
	if true:
		var i = 0
		while (i < pts.size()):
			var p = pts[int(i)]
			var q = pts[int(fmod((i + 1), pts.size()))]
			var sp = side.call(p)
			var sq = side.call(q)
			_R.push_items((L if (sp >= 0) else Rt), [p])
			if ((sp >= 0) != (sq >= 0)):
				var u = (float(sp) / (sp - sq))
				var m = [(p[int(0)] + ((q[int(0)] - p[int(0)]) * u)), (p[int(1)] + ((q[int(1)] - p[int(1)]) * u))]
				_R.push_items(L, [m])
				_R.push_items(Rt, [m])
			i += 1.0
	return [L, Rt].filter(func(s, _unused1=null, _unused2=null, _unused3=null):
		return (s.size() >= 3))
static func ice_of(c, C):
	var n = C.size()
	var l = _C.luma(c)
	return C[int(clampf(_M.js_round((float(((2 if (l < 0.12) else (2 + (l * 5.2))) * (n - 1))) / 7)), 1, (n - 1)))]
static func glass_poly(p, pts, c, a):
	var x0 = INF
	var y0 = INF
	var x1 = (-INF)
	var y1 = (-INF)
	for _tuple5 in pts:
		var x = _tuple5[0]
		var y = _tuple5[1]
		x0 = minf(x0, x)
		x1 = maxf(x1, x)
		y0 = minf(y0, y)
		y1 = maxf(y1, y)
	if true:
		var y = floori(y0)
		while (y <= ceili(y1)):
			if true:
				var x = floori(x0)
				while (x <= ceili(x1)):
					if in_poly(pts, (x + 0.5), (y + 0.5)):
						p.blend(x, y, c, a)
					x += 1.0
			y += 1.0
class Panes:
	extends RefCounted
	var list
	var ground
	var onLand
	var onCrumble
	var onSkid
	func _init(opts={}):
		self.list = []
		self.ground = opts.get("ground", func(_unused0=null, _unused1=null, _unused2=null, _unused3=null):
			return INF)
		self.onLand = opts.get("onLand", null)
		self.onCrumble = opts.get("onCrumble", null)
		self.onSkid = opts.get("onSkid", null)
	func add(q):
		var life = q.get("life", 1)
		_R.push_items(self.list, [_R.merge_dicts([{"vx": 0}, {"vy": 0}, {"a": 0}, {"va": 0}, {"f": 0}, {"vf": 0}, {"lit": 0.6}, {"g": 1}, {"drag": 0.3}, {"bounce": 0.35}, {"rest": false}, {"brittle": false}, q, {"life": life}, {"max": life}])])
	var count: int:
		get: return self.list.size()
	func corners(q):
		var ca = cos(q.a)
		var sa = sin(q.a)
		var k = cos(q.f)
		return _B.map_indexed(q.pts, func(_arg0, _unused1=null, _unused2=null, _unused3=null):
			var x = _B.at(_arg0, 0)
			var y = _B.at(_arg0, 1)
			var yy = (y * k)
			return [((q.x + (x * ca)) - (yy * sa)), ((q.y + (x * sa)) + (yy * ca))])
	func seat(q):
		var low = (-INF)
		for c in self.corners(q):
			low = maxf(low, c[int(1)])
		return low
	func update(dt):
		if true:
			var i = (self.list.size() - 1)
			while (i >= 0):
				var q = self.list[int(i)]
				if (_R.assign_member(q, "life", dt, "-=") <= 0):
					self.list.remove_at(int(i))
					i -= 1.0
					continue
				var floor_y = (self.ground.call(q.x) - 0.5)
				if ((q.rest and (q.get("crumble") != null)) and (_R.assign_member(q, "restT", (q.get("restT", 0) + dt), "=") > q.crumble)):
					_R.call_optional(self, "onCrumble", [q])
					self.list.remove_at(int(i))
					i -= 1.0
					continue
				if q.rest:
					if (absf(q.vx) > 8):
						_R.call_optional(self, "onSkid", [q, q.x, (floor_y + 0.5)])
					q.x += (q.vx * dt)
					q.vx -= ((q.vx * 7) * dt)
					q.a += (q.va * dt)
					q.va -= ((q.va * 9) * dt)
					q.vf -= ((q.vf * 9) * dt)
					q.f += (q.vf * dt)
					q.y -= (self.seat(q) - floor_y)
					i -= 1.0
					continue
				q.vy += ((_S.GRAVITY * q.g) * dt)
				q.vx -= ((q.vx * q.drag) * dt)
				q.vy -= ((q.vy * q.drag) * dt)
				q.x += (q.vx * dt)
				q.y += (q.vy * dt)
				q.a += (q.va * dt)
				q.f += (q.vf * dt)
				var low = self.seat(q)
				if (((q.g <= 0) if (q.g <= 0) else (low < floor_y)) if ((q.g <= 0) if (q.g <= 0) else (low < floor_y)) else (q.vy <= 0)):
					i -= 1.0
					continue
				q.y -= (low - floor_y)
				if (q.vy > 70):
					q.hits = (q.get("hits", 0) + 1)
					_R.call_optional(self, "onLand", [q, q.x, (floor_y + 0.5), q.vy])
				if ((q.brittle and (q.vy > 70)) and (q.hits >= q.brittle)):
					self.list.remove_at(int(i))
					i -= 1.0
					continue
				if ((q.vy > 70) and (q.bounce > 0)):
					q.vy = ((-q.vy) * q.bounce)
					q.vx *= 0.75
					q.va *= 0.6
					q.vf *= 0.5
				else:
					q.rest = true
					q.vy = 0
				i -= 1.0
	func draw(p, C):
		var n = C.size()
		for q in self.list:
			var a = minf(1, (float(q.life) / 0.35))
			var pts = self.corners(q)
			var k = cos(q.f)
			var face = absf(k)
			var lv = (q.lit * (0.35 + (0.65 * face)))
			var flash = ((face > 0.97) and (not q.rest))
			if (face > 0.25):
				if (q.get("solid") and (q.get("tone") != null)):
					p.poly(pts, (C[int((n - 1))] if flash else C[int(clampf(_M.js_round((1 + ((q.tone * 5) * (0.6 + (0.4 * face))))), 1, (n - 2)))]), a)
				else:
					if q.get("solid"):
						var rr = q.get("ridge", (float((-PI)) / 2))
						var cr = cos(rr)
						var sr = sin(rr)
						var ca = cos(q.a)
						var sa = sin(q.a)
						var rx = ((cr * ca) - ((sr * k) * sa))
						var ry = ((cr * sa) + ((sr * k) * ca))
						var nx = (-ry)
						var ny = rx
						if (((nx * (-0.55)) + (ny * (-0.84))) < 0):
							nx = (-nx)
							ny = (-ny)
						var lit = (C[int((n - 1))] if flash else C[int(clampf(_M.js_round((3 + (lv * 3))), 3, (n - 2)))])
						var deep = C[int(clampf(_M.js_round((1 + (lv * 2))), 1, 3))]
						p.poly(pts, func(x, y, _unused2=null, _unused3=null):
							var d = (((x - q.x) * nx) + ((y - q.y) * ny))
							return (lit if (d > 0.6) else (C[int((n - 2))] if (d > (-0.6)) else deep)), a)
					else:
						PixelFXIceHelpers.glass_poly(p, pts, (C[int((n - 1))] if flash else C[int(clampf(_M.js_round((3 + (lv * 3))), 3, (n - 2)))]), (((0.3 + (0.35 * lv)) + (0.3 if flash else 0)) * a))
			var cx = 0
			var cy = 0
			var top = 0
			for _tuple6 in pts:
				var x = _tuple6[0]
				var y = _tuple6[1]
				cx += x
				cy += y
			cx /= pts.size()
			cy /= pts.size()
			if true:
				var i = 0
				while (i < pts.size()):
					var _tuple7 = pts[int(i)]
					var x0 = _tuple7[0]
					var y0 = _tuple7[1]
					var _tuple8 = pts[int(fmod((i + 1), pts.size()))]
					var x1 = _tuple8[0]
					var y1 = _tuple8[1]
					var nx = (y1 - y0)
					var ny = (x0 - x1)
					if (((nx * ((float((x0 + x1)) / 2) - cx)) + (ny * ((float((y0 + y1)) / 2) - cy))) < 0):
						nx = (-nx)
						ny = (-ny)
					var l = (_R.hypot([nx, ny]) if _R.hypot([nx, ny]) else 1)
					var lit = (float((((-nx) * 0.55) - (ny * 0.84))) / l)
					p.line(x0, y0, x1, y1, (C[int((n - 1))] if ((face < 0.25) if (face < 0.25) else (lit > 0.35)) else (C[int((n - 2))] if (lit > (-0.25)) else (C[int(1)] if q.get("solid") else C[int(maxf(2, (n - 4)))]))), a)
					if (pts[int(i)][int(1)] < pts[int(top)][int(1)]):
						top = i
					i += 1.0
			if (face > 0.7):
				p.dot(pts[int(top)][int(0)], pts[int(top)][int(1)], _C.WHITE, a)
			p.glow(cx, cy, 5, C[int((n - 3))], ((0.5 if flash else 0.14) * a))
static func blade(p, bx, by, tx, ty, w, C, opts={}):
	var dx = (tx - bx)
	var dy = (ty - by)
	var L = _R.hypot([dx, dy])
	if ((L < 1.5) if (L < 1.5) else (w < 0.5)):
		return null
	var ux = (float(dx) / L)
	var uy = (float(dy) / L)
	var nx = (-uy)
	var ny = ux
	var a = opts.get("a", 1)
	var dim = opts.get("dim", 0)
	var jag = opts.get("jag", (-1))
	var glint = opts.get("glint", (-1))
	var K = func(i, _unused1=null, _unused2=null, _unused3=null):
		return C[int(clampf((i - dim), 0, (C.size() - 1)))]
	var hw = (float(w) / 2)
	var left = func(u, _unused1=null, _unused2=null, _unused3=null):
		return ((hw * (1 - u)) + 0.35)
	var right = func(u, _unused1=null, _unused2=null, _unused3=null):
		return (((hw * (1 - u)) * (0.55 if ((jag >= 0) and (u > jag)) else 1)) + 0.35)
	var ridge = func(u, _unused1=null, _unused2=null, _unused3=null):
		return (((-w) * 0.12) * (1 - u))
	var pad = (hw + 2)
	p.shade((minf(bx, tx) - pad), (minf(by, ty) - pad), (maxf(bx, tx) + pad), maxf(by, ty), func(x, y, o, _unused3=null):
		var rx = (x - bx)
		var ry = (y - by)
		var u = (float(((rx * ux) + (ry * uy))) / L)
		var s = ((rx * nx) + (ry * ny))
		if (u < 0):
			return null
		var l = left.call(minf(u, 1))
		var r = right.call(minf(u, 1))
		if (((u > 1) if (u > 1) else (s < (-l))) if ((u > 1) if (u > 1) else (s < (-l))) else (s > r)):
			var over = (((u - 1) * L) if (u > 1) else 0)
			var out = maxf(over, (((-l) - s) if (s < (-l)) else (s - r)))
			if ((out < 1) and (u < (1 + (float(1) / L)))):
				o.c = K.call(0)
				o.a = a
			return null
		o.a = a
		if opts.get("white"):
			o.c = _C.WHITE
			return o.c
		var rd = ridge.call(u)
		var c = null
		if (u > 0.88):
			c = _C.WHITE
		else:
			if (absf((s - rd)) < 0.55):
				c = K.call(6)
			else:
				if (s < rd):
					c = (K.call(6) if ((s + l) < 1) else (K.call(5) if ((float((s + l)) / maxf(1, (rd + l))) > 0.55) else K.call(4)))
				else:
					c = (K.call(1) if ((r - s) < 1.1) else (K.call(2) if ((float((s - rd)) / maxf(1, (r - rd))) > 0.5) else K.call(3)))
		if (((jag >= 0) and ((absf((u - jag)) * L) < 0.8)) and (s > rd)):
			c = K.call(6)
		else:
			if (((s < rd) and (c != K.call(6))) and (fmod(_R.bitwise("^", (floori(x) * 73856093), (floori(y) * 19349663)), 997) < 30)):
				c = K.call(7)
		if ((glint >= 0) and (s <= (rd + 0.6))):
			var g = (absf((u - glint)) * L)
			if (g < 0.8):
				c = _C.WHITE
			else:
				if (g < 1.8):
					c = K.call(6)
		o.c = c)
static func flake_design(R):
	var n = R.int_value(1, 3)
	var branches = []
	if true:
		var i = 0
		while (i < n):
			_R.push_items(branches, [[(0.38 + (float((0.4 * (i + R.range_value(0.2, 0.8)))) / n)), (R.range_value(0.24, 0.36) * (1 - (i * 0.15)))]])
			i += 1.0
	return {"branches": branches, "plate": R.chance(0.45), "fork": R.chance(0.45)}
static func snowflake(p, x, y, r, rot, d, C, opts={}):
	var n = C.size()
	var a = opts.get("a", 1)
	var hot = opts.get("hot", 0)
	rot = (_M.js_round((float(rot) / (float(PI) / 18))) * (float(PI) / 18))
	if (r < 1.2):
		p.dot(x, y, _C.WHITE, a)
		return null
	if (r < 2.6):
		var pose = fmod(floori((float((fmod(rot, (float(PI) / 3)) + (float(PI) / 3))) / (float(PI) / 6))), 2)
		var pts = ([[1, 0], [(-1), 0], [0, 1], [0, (-1)]] if pose else [[1, 1], [(-1), (-1)], [1, (-1)], [(-1), 1]])
		for _tuple9 in pts:
			var dx = _tuple9[0]
			var dy = _tuple9[1]
			p.dot((x + dx), (y + dy), (_C.WHITE if (hot > 0.5) else C[int((n - 3))]), a)
		p.dot(x, y, _C.WHITE, a)
		p.glow(x, y, 4, C[int((n - 3))], (0.2 * a))
		return null
	var arm = (_C.WHITE if (hot > 0.5) else C[int((n - 2))])
	var br = (C[int((n - 2))] if (hot > 0.5) else C[int((n - 3))])
	var big = (r >= 7)
	var branches = ([] if (r < 4) else (_R.slice_value(d.branches, 0, 2) if big else [[0.58, 0.36]]))
	if true:
		var k = 0
		while (k < 6):
			var g = (rot + (float((k * TAU)) / 6))
			var ca = cos(g)
			var sa = sin(g)
			p.line(x, y, (x + (ca * r)), (y + (sa * r)), arm, a)
			for _tuple10 in branches:
				var u = _tuple10[0]
				var l = _tuple10[1]
				var bx = (x + ((ca * r) * u))
				var by = (y + ((sa * r) * u))
				var bl = maxf(1, (r * l))
				for s in [(-1), 1]:
					p.line(bx, by, (bx + (cos((g + (float((s * PI)) / 3))) * bl)), (by + (sin((g + (float((s * PI)) / 3))) * bl)), br, a)
			if ((d.fork and big) and (not d.plate)):
				for s in [(-1), 1]:
					p.dot(((x + (ca * r)) + (cos((g + (s * 0.9))) * 1.2)), ((y + (sa * r)) + (sin((g + (s * 0.9))) * 1.2)), br, a)
			p.dot((x + (ca * r)), (y + (sa * r)), _C.WHITE, a)
			k += 1.0
	if (d.plate and big):
		var q = (r * 0.34)
		if true:
			var k = 0
			while (k < 6):
				var g0 = ((rot + (float(PI) / 6)) + (float((k * TAU)) / 6))
				var g1 = (g0 + (float(TAU) / 6))
				p.line((x + (cos(g0) * q)), (y + (sin(g0) * q)), (x + (cos(g1) * q)), (y + (sin(g1) * q)), C[int((n - 3))], a)
				k += 1.0
	p.px(x, y, _C.WHITE)
	p.glow(x, y, (3 + (r * 1.2)), C[int((n - 4))], ((0.14 + (0.35 * hot)) * a))
	if (hot > 0.3):
		p.glow(x, y, (2 + (r * 0.5)), _C.WHITE, ((0.3 * hot) * a))
static func draw_fractures(p, cracks, reach, C, opts={}):
	var n = C.size()
	var ox = opts.get("ox", 0)
	var oy = opts.get("oy", 0)
	var hot = opts.get("hot", true)
	var a = opts.get("a", 1)
	var seg = func(pts, i, _unused2=null, _unused3=null):
		var _tuple11 = pts[int((i - 1))]
		var x0 = _tuple11[0]
		var y0 = _tuple11[1]
		var d0 = _tuple11[2]
		var _tuple12 = pts[int(i)]
		var x1 = _tuple12[0]
		var y1 = _tuple12[1]
		var d1 = _tuple12[2]
		if (d0 >= reach):
			return null
		var u = minf(1, (float((reach - d0)) / maxf(0.01, (d1 - d0))))
		return [(x0 + ox), (y0 + oy), ((x0 + ox) + ((x1 - x0) * u)), ((y0 + oy) + ((y1 - y0) * u)), ((reach - d1) < 3)]
	for pts in cracks:
		if true:
			var i = 1
			while (i < pts.size()):
				var s = seg.call(pts, i)
				if (not s):
					break
				p.line(s[int(0)], (s[int(1)] + 1), s[int(2)], (s[int(3)] + 1), C[int(minf(2, (n - 1)))], a)
				i += 1.0
	for pts in cracks:
		if true:
			var i = 1
			while (i < pts.size()):
				var s = seg.call(pts, i)
				if (not s):
					break
				var tip = (hot and s[int(4)])
				p.line(s[int(0)], s[int(1)], s[int(2)], s[int(3)], (_C.WHITE if tip else C[int((n - 2))]), a)
				if tip:
					p.glow(s[int(2)], s[int(3)], 5, C[int((n - 3))], (0.5 * a))
				else:
					if fmod(i, 2):
						p.glow(s[int(2)], s[int(3)], 3, C[int((n - 3))], (0.18 * a))
				i += 1.0

static func end_by(time: float, duration: float, systems: Array) -> void:
	var remaining = maxf(0.001,duration-0.05-time)
	for system in systems:
		for item in system.list:
			if item.life > remaining: item.life = remaining

static func fractures(random, inside: Callable, x, y, count, options: Dictionary = {}) -> Array:
	var result: Array = []
	var step = options.get("step",[1.6,2.6]); var length = options.get("len",18)
	var fork = options.get("fork",0.16)
	# Null-coalescing evaluates the random fallback only when a0 is absent.
	var start_angle = options.a0 if options.has("a0") else random.range_value(0,TAU); var spread = options.get("spread",TAU)
	for i in range(count):
		_fracture_walk(result,random,inside,x,y,0,start_angle+(float(i)/count)*spread+random.range_value(-0.3,0.3)*minf(1,spread/TAU),length,0,step,fork)
	return result

static func _fracture_walk(result: Array, random, inside: Callable, x, y, distance, angle, length, depth, step: Array, fork):
	var points = [[x,y,distance]]
	for _i in range(length):
		angle += random.range_value(-0.55,0.55)
		var stride = random.range_value(step[0],step[1])
		var nx = x+cos(angle)*stride; var ny = y+sin(angle)*stride
		if not inside.call(nx,ny): break
		x=nx; y=ny; distance+=stride; points.append([x,y,distance])
		if depth < 2 and points.size() > 2 and random.chance(fork):
			_fracture_walk(result,random,inside,x,y,distance,angle+random.sign_value()*random.range_value(0.6,1.2),ceili(length*0.5),depth+1,step,fork)
	if points.size() > 1: result.append(points)
