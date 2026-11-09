@tool
extends "../b2_helpers.gd"
## Native port of pinned PixelFX 0.3.0 algorithms; MIT (c) Patch / Hugo Duprez.
const _C = preload("../../core/color.gd")
const _M = preload("../../core/math.gd")
const _P = preload("../../core/particles.gd")
const _S = preload("../../core/sim.gd")
const _E = preload("../../core/ease.gd")
const _A = preload("../analytic_helpers.gd")
const _J = preload("projectiles_common.gd")
const _B = preload("../b2_helpers.gd")
static func spark(p, x, y, vx, vy, k, S, glow=0.45, stretch=0.022, max=9):
	var sp = (sqrt((vx)*(vx) + (vy)*(vy)) if sqrt((vx)*(vx) + (vy)*(vy)) else 1)
	var ux = (float(vx) / sp)
	var uy = (float(vy) / sp)
	var len = minf(max, (1 + (sp * stretch)))
	var head = (S[int(0)] if (k > 0.6) else (S[int(1)] if (k > 0.3) else S[int(2)]))
	p.line((x - (ux * len)), (y - (uy * len)), (x - ((ux * len) * 0.4)), (y - ((uy * len) * 0.4)), (head if (k > 0.5) else S[int(3)]))
	p.line((x - ((ux * len) * 0.45)), (y - ((uy * len) * 0.45)), x, y, head)
	p.glow(x, y, 3, head, (glow * k))
static func flash_shape(r, f, options={}):
	var size = options.get("size", 1)
	var spike = options.get("spike", [12, 20])
	var diag = options.get("diag", [5, 10])
	var cross = options.get("cross", [3, 6])
	var back = options.get("back", [2, 4.5])
	var core = options.get("core", 0.7)
	var k = (1 if (f == 1) else 0.6)
	var w = (1 if (f == 1) else 0.72)
	var S = size
	var L = [{"off": 0.5, "a": r.range_value((-0.08), 0.08), "len": ((r.range_value(5.5, 8) * S) * k), "wid": ((r.range_value(2.1, 2.6) * S) * w), "core": (0.5 * core)}, {"off": 2, "a": r.range_value((-0.07), 0.07), "len": ((r.range_value(spike[int(0)], spike[int(1)]) * S) * k), "wid": ((r.range_value(1, 1.3) * S) * w), "core": (0.35 * core)}]
	var ray = func(a, len, wid, on):
		if on:
			L.append({"off": r.range_value(0.5, 2), "a": a, "len": ((len * S) * k), "wid": ((wid * S) * w), "core": (0.25 * core)})
		return null
	for s in [(-1), 1]:
		ray.call((s * r.range_value(0.3, 0.8)), r.range_value(diag[int(0)], diag[int(1)]), r.range_value(1.1, 1.5), r.chance(0.85))
		ray.call((s * r.range_value(1.15, 1.7)), r.range_value(cross[int(0)], cross[int(1)]), r.range_value(1, 1.3), r.chance(0.6))
		ray.call((s * r.range_value(2, 2.7)), r.range_value(back[int(0)], back[int(1)]), 1, (r.chance(0.7) and (f == 1)))
	return L
static func profile(l, u):
	var k = (float(u) / l.len)
	return ((l.wid * pow(maxf(0, (1 - k)), 0.8)) * minf(1, (0.45 + (k * 3))))
static func flash(p, x, y, a, L, C, seed_value):
	var c = cos(a)
	var s = sin(a)
	var ext = 2
	for l in L:
		ext = maxf(ext, ((l.off + l.len) + 2))
	p.shade((x - ext), (y - ext), (x + ext), (y + ext), func(px, py, _unused2=null):
		var dx = (px - x)
		var dy = (py - y)
		var along = ((dx * c) + (dy * s))
		var across = (((-dx) * s) + (dy * c))
		var m = (-9)
		var hot = false
		var warm = false
		for l in L:
			var ca = cos(l.a)
			var sa = sin(l.a)
			var lu = (((along - l.off) * ca) + (across * sa))
			var lv = (((-(along - l.off)) * sa) + (across * ca))
			if ((lu < (-1.5)) if (lu < (-1.5)) else (lu > (l.len + 1))):
				continue
			var r = profile(l, maxf(0, lu))
			var mm = (r - absf(lv))
			if (mm > m):
				m = mm
			if ((lu < (l.len * l.core)) and (absf(lv) <= (r * 0.5))):
				hot = true
			if (mm > (r * 0.4)):
				warm = true
		var dm = (1.6 - sqrt(((along - 0.5))*((along - 0.5)) + (across)*(across)))
		if (dm > m):
			m = dm
		if (dm > 0.6):
			hot = true
		m += (((_M.rand([((floori(px) * 73) + (floori(py) * 151)), seed_value]) - 0.5) * 0.5) * minf(1, (float(ext) / 14)))
		if (m < (-0.85)):
			return null
		return (C[int(3)] if (m < 0) else (C[int(0)] if hot else (C[int(1)] if warm else C[int(2)]))))
	return ext
static func casing(x, y, vx, vy, va, age, g, floor_y, bounce=0.42, a0=0):
	var t0 = 0
	var a = a0
	var hit = (-1)
	if true:
		var n = 0
		while (n < 6):
			var d = (floor_y - y)
			var T = (float(((-vy) + sqrt(maxf(0, ((vy * vy) + ((2 * g) * d)))))) / g)
			if ((age - t0) < T):
				var u = (age - t0)
				return {"x": (x + (vx * u)), "y": ((y + (vy * u)) + (((0.5 * g) * u) * u)), "a": (a + (va * u)), "rest": false, "hit": hit}
			x += (vx * T)
			a += (va * T)
			t0 += T
			hit = (age - t0)
			var vin = (vy + (g * T))
			y = floor_y
			if ((vin * bounce) < 45):
				var u = (age - t0)
				var k = 7
				var s = (float((1 - exp(((-k) * u)))) / k)
				return {"x": (x + ((vx * 0.6) * s)), "y": floor_y, "a": (_M.js_round((float(a) / PI)) * PI), "rest": true, "hit": hit}
			vy = ((-vin) * bounce)
			vx *= 0.55
			va *= 0.6
			n += 1.0
	return {"x": x, "y": floor_y, "a": (_M.js_round((float(a) / PI)) * PI), "rest": true, "hit": hit}
static func draw_casing(p, k, B, fade=1):
	var ca = cos(k.a)
	var sa = sin(k.a)
	var x = k.x
	var y = (k.y - 0.5)
	p.dot((x - ca), (y - sa), B[int(1)], fade)
	p.dot(x, y, B[int(2)], fade)
	p.dot((x + ca), (y + sa), B[int(3)], fade)
	if ((k.hit >= 0) and (k.hit < 0.07)):
		p.px((x + (ca * 0.5)), (y - 1), _C.WHITE)
		p.glow(x, y, 5, B[int(3)], (0.55 * (1 - (float(k.hit) / 0.07))))

class Smoke:
	extends RefCounted
	var R
	var list: Array = []
	var t = 0.0
	func _init(rng) -> void: R = rng
	func add(q: Dictionary) -> void:
		var item = {"vx":0.0,"vy":0.0,"drag":2.5,"rise":12.0,"grow":2.0,"curl":0.0,"a":0.6,"b":0.85,"warm":0.0,"delay":0.0,"age":0.0,"seed":R.next()*100}
		item.merge(q,true)
		list.append(item)
	func update(dt: float) -> void:
		t += dt
		for i in range(list.size()-1,-1,-1):
			var q = list[i]
			if q.delay > 0:
				q.delay -= dt
				continue
			q.age += dt
			if q.age >= q.life:
				list.remove_at(i)
				continue
			if q.curl:
				var c = cos(q.curl*dt); var s = sin(q.curl*dt); var vx = q.vx
				q.vx = vx*c-q.vy*s
				q.vy = vx*s+q.vy*c
			q.vy -= q.rise*dt
			q.vx += sin(t*1.3+q.seed)*8*dt
			q.vx -= q.vx*q.drag*dt
			q.vy -= q.vy*q.drag*dt
			q.x += q.vx*dt
			q.y += q.vy*dt
	func puffs() -> Array:
		var result = []
		for q in list:
			if q.delay > 0: continue
			var k = q.age/q.life
			result.append({"x":q.x,"y":q.y,"r":q.r0+(q.r1-q.r0)*(1-exp(-q.grow*q.age)),"a":q.a*minf(1,q.age*30)*pow(1-k,1.3),"b":q.b*(1-k*0.5),"w":q.warm*exp(-q.age*5)})
		return result
