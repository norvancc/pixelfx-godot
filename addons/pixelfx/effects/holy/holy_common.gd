@tool
class_name PixelFXHolyHelpers
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
## Source: src/fx/holy/_lib.js
const GOLD = ["#3b1d2a", "#7a3a2c", "#c4652e", "#f0a040", "#ffd25e", "#fff0a0", "#fffbe0", "#ffffff"]
const GREEN = ["#0e2a24", "#14472f", "#1d6e3a", "#2f9a45", "#5cc654", "#a0e46c", "#dcffb4", "#ffffff"]
const ASH = ["#16131c", "#26222f", "#3a3546", "#524c5e", "#6e6878", "#8c8796"]
static func oval(p, cx, cy, rx, ry, c, a=1, keep=null):
	if (rx < 0.5):
		return null
	var n = (ceili(((maxf(rx, ry) * TAU) * 1.5)) + 6)
	var fc = (c is Callable)
	var fa = (a is Callable)
	if true:
		var j = 0
		while (j < n):
			var g = ((float(j) / n) * TAU)
			if (keep and (not keep.call(g))):
				j += 1.0
				continue
			p.dot((cx + (cos(g) * rx)), (cy + (sin(g) * ry)), (c.call(g) if fc else c), (a.call(g) if fa else a))
			j += 1.0
static func FAR(g):
	return (sin(g) < 0)
static func NEAR(g):
	return (sin(g) >= 0)
static func feather(p, x, y, ang, len, wid, R, a=1, side=1, hot=0, quill=0.02):
	if ((len < 1.5) if (len < 1.5) else (a <= 0.02)):
		return null
	var n = R.size()
	var ca = cos(ang)
	var sa = sin(ang)
	var x1 = (x + (ca * len))
	var y1 = (y + (sa * len))
	var pad = (wid + 1.2)
	var h = (hot > 0.5)
	var edge = (R[int((n - 3))] if h else R[int((n - 5))])
	var lead = (_C.WHITE if h else R[int((n - 2))])
	var B = ([_C.WHITE, _C.WHITE, R[int((n - 2))]] if h else [R[int((n - 2))], R[int((n - 3))], R[int((n - 4))]])
	p.each((minf(x, x1) - pad), (minf(y, y1) - pad), (maxf(x, x1) + pad), (maxf(y, y1) + pad), func(px, py, sx, sy):
		var dx = (px - x)
		var dy = (py - y)
		var u = (float(((dx * ca) + (dy * sa))) / len)
		if ((u < 0) if (u < 0) else (u > 1.05)):
			return null
		var v = ((((-dx) * sa) + (dy * ca)) * side)
		var av = absf(v)
		var w = ((wid * sqrt(clampf((float((u - quill)) / 0.22), 0.0, 1.0))) * sqrt(maxf(0, (1 - pow(maxf(0, (float((u - 0.55)) / 0.47)), 2)))))
		var lim = ((w * 0.42) if (v < 0) else w)
		var fade = (1 if (u < 0.72) else (1 - ((u - 0.72) * 1.6)))
		if ((av < 0.5) and (u < 0.9)):
			return p.put(sx, sy, (_C.WHITE if (u < 0.5) else B[int(0)]), a)
		if ((av > (lim + 0.05)) if (av > (lim + 0.05)) else (w < 0.5)):
			return null
		if ((lim - av) < 1):
			return (p.put(sx, sy, (B[int(2)] if (u > 0.85) else edge), (a * fade)) if (v > 0) else p.put(sx, sy, lead, a))
		if (u < 0.72):
			return p.put(sx, sy, (B[int(0)] if (u < 0.38) else B[int(1)]), a)
		p.blend_px(sx, sy, B[int(2)], (a * fade)))
class Feathers:
	extends RefCounted
	var R
	var floor
	var list
	func _init(rng, floor_y=0):
		self.R = rng
		self.floor = floor_y
		self.list = []
	func add(f):
		var R = self.R
		_R.push_items(self.list, [_R.merge_dicts([{"vx": 0}, {"vy": 0}, {"a": 0}, {"len": 7}, {"wid": 2}, {"delay": 0}, {"back": false}, {"side": R.sign_value()}, {"ph": R.range_value(0, TAU)}, {"w": R.range_value(3.2, 4.6)}, {"amp": R.range_value(6, 11)}, {"sink": R.range_value(14, 24)}, {"va": R.range_value((-9), 9)}, {"tilt": R.range_value((-0.35), 0.35)}, f, {"max": f.life}, {"age": 0}, {"landed": false}])])
	var count: int:
		get: return self.list.size()
	func update(dt):
		if true:
			var i = (self.list.size() - 1)
			while (i >= 0):
				var f = self.list[int(i)]
				if (f.delay > 0):
					f.delay -= dt
					i -= 1.0
					continue
				if (_R.assign_member(f, "life", dt, "-=") <= 0):
					self.list.remove_at(int(i))
					i -= 1.0
					continue
				f.age += dt
				if f.landed:
					f.a += (((_M.js_round((float(f.a) / PI)) * PI) - f.a) * minf(1, (dt * 10)))
					i -= 1.0
					continue
				f.vx -= ((f.vx * 3.4) * dt)
				f.vy -= ((f.vy * 3.4) * dt)
				var s = _M.smooth(0.1, 0.6, f.age)
				var ph = ((f.age * f.w) + f.ph)
				var c = cos(ph)
				f.x += ((f.vx + (((sin(ph) * f.amp) * s) * 0.9)) * dt)
				f.y += ((f.vy + ((f.sink * s) * (((c * c) * 1.5) - 0.2))) * dt)
				var rest = (((_M.js_round((float(f.a) / PI)) * PI) + f.tilt) + (sin(ph) * 0.6))
				f.a += (((f.va * dt) * (1 - s)) + ((rest - f.a) * minf(1, ((dt * 5) * s))))
				if (f.y >= (self.floor - 0.5)):
					f.y = (self.floor - 0.5)
					f.landed = true
					f.life = minf(f.life, 0.6)
				i -= 1.0
	func draw(p, R, layer):
		for f in self.list:
			if ((f.delay > 0) if (f.delay > 0) else (layer and (("back" if f.back else "front") != layer))):
				continue
			var k = (float(f.life) / f.max)
			var a = minf(minf(1, (float(f.life) / 0.45)), (float(f.age) / 0.06))
			var ca = cos(f.a)
			var sa = sin(f.a)
			PixelFXHolyHelpers.feather(p, (f.x - (float((ca * f.len)) / 2)), (f.y - (float((sa * f.len)) / 2)), f.a, f.len, f.wid, R, a, f.side, (1 if (f.age < 0.06) else 0), 0.2)
			p.glow(f.x, f.y, (4 + (f.len * 0.5)), R[int((R.size() - 3))], ((0.22 * a) * (0.4 + (0.6 * k))))
static func plus(p, x, y, L, th, R, a=1, glint=false):
	var n = R.size()
	var X = _M.js_round(x)
	var Y = _M.js_round(y)
	var w = (1 if (th > 1) else 0)
	var ins = func(i, j, _unused2=null, _unused3=null):
		return (((absf(i) <= w) and (absf(j) <= L)) if ((absf(i) <= w) and (absf(j) <= L)) else ((absf(j) <= w) and (absf(i) <= L)))
	if true:
		var j = ((-L) - 1)
		while (j <= (L + 1)):
			if true:
				var i = ((-L) - 1)
				while (i <= (L + 1)):
					if (not ins.call(i, j)):
						if (w and (((ins.call((i - 1), j) if ins.call((i - 1), j) else ins.call((i + 1), j)) if (ins.call((i - 1), j) if ins.call((i - 1), j) else ins.call((i + 1), j)) else ins.call(i, (j - 1))) if ((ins.call((i - 1), j) if ins.call((i - 1), j) else ins.call((i + 1), j)) if (ins.call((i - 1), j) if ins.call((i - 1), j) else ins.call((i + 1), j)) else ins.call(i, (j - 1))) else ins.call(i, (j + 1)))):
							p.dot((X + i), (Y + j), R[int(maxf(0, (n - 6)))], (a * 0.9))
						i += 1.0
						continue
					var c = null
					if (not w):
						c = (_C.WHITE if ((i == 0) and (j == 0)) else (R[int((n - 3))] if ((absf(i) + absf(j)) >= L) else R[int((n - 2))]))
					else:
						if ((i == 0) and (j == 0)):
							c = _C.WHITE
						else:
							if ((i == 0) if (i == 0) else (j == 0)):
								c = (R[int((n - 2))] if ((absf(i) + absf(j)) < L) else R[int((n - 3))])
							else:
								c = (R[int((n - 3))] if ((i < 0) if (i < 0) else (j < 0)) else R[int((n - 5))])
					if (glint and (((i == 0) and (j == (-L))) if ((i == 0) and (j == (-L))) else ((i == (-L)) and (j == 0)))):
						c = _C.WHITE
					p.dot((X + i), (Y + j), c, a)
					i += 1.0
			j += 1.0
