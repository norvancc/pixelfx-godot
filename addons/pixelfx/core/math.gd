@tool
extends RefCounted
## PixelFX deterministic math. JS bitwise results are explicitly masked to uint32.
## Port of patch-gg/pixelfx 0.3.0; see ../LICENSE and ../README.md.

static func imul(a: int, b: int) -> int:
	# Split multiplication avoids signed int64 overflow while matching Math.imul.
	return ((a & 65535) * (b & 65535) + (((a >> 16) * (b & 65535) + (a & 65535) * (b >> 16)) << 16)) & 0xffffffff

static func hash_numbers(ns: Array) -> int:
	var h: int = 0x9e3779b9
	for n in ns:
		h = imul(h ^ (int(n) & 0xffffffff), 0x85ebca6b)
		h ^= h >> 13
		h = imul(h, 0xc2b2ae35)
		h ^= h >> 16
	return h & 0xffffffff

static func rand(ns: Array) -> float:
	return hash_numbers(ns) / 4294967296.0

class Rng:
	extends RefCounted
	var s: int
	func _init(seed_value: int = 1) -> void:
		s = seed_value & 0xffffffff
		if s == 0: s = 1
	func next() -> float:
		s = (s + 0x6d2b79f5) & 0xffffffff
		var t: int = s
		t = imul_local(t ^ (t >> 15), t | 1)
		t ^= (t + imul_local(t ^ (t >> 7), t | 61)) & 0xffffffff
		return ((t ^ (t >> 14)) & 0xffffffff) / 4294967296.0
	static func imul_local(a: int, b: int) -> int:
		return ((a & 65535) * (b & 65535) + (((a >> 16) * (b & 65535) + (a & 65535) * (b >> 16)) << 16)) & 0xffffffff
	func range_value(a: float, b: float) -> float: return a + (b - a) * next()
	func int_value(a: int, b: int) -> int: return floori(range_value(a, b + 1))
	func chance(p: float) -> bool: return next() < p
	func sign_value() -> int: return -1 if next() < 0.5 else 1
	func pick(items: Array): return items[floori(next() * items.size())]
	func gauss() -> float: return (next() + next() + next() + next() - 2) * 1.732

static func rng(ns: Array) -> Rng: return Rng.new(hash_numbers(ns))
static func js_round(x: float) -> int: return floori(x + 0.5)
static func fract(x: float) -> float: return x - floor(x)
static func inv_lerp(a: float, b: float, x: float) -> float: return 0.0 if a == b else (x - a) / (b - a)
static func remap_value(x: float, a0: float, a1: float, b0: float, b1: float) -> float: return lerpf(b0, b1, inv_lerp(a0, a1, x))
static func seg(t: float, t0: float, t1: float) -> float: return clampf((t - t0) / (t1 - t0), 0, 1)
static func smooth(e0: float, e1: float, x: float) -> float:
	var t := seg(x, e0, e1)
	return t * t * (3 - 2 * t)
static func bump(t: float, t0: float, t1: float) -> float: return 0.0 if t <= t0 or t >= t1 else sin(PI * seg(t, t0, t1))
static func ping_pong(x: float) -> float: return 1 - absf(fposmod(x, 2) - 1)

static func noise(x: float, seed_value: int = 0) -> float:
	var i := floori(x)
	var f := x - i
	return lerpf(rand([i, seed_value]), rand([i + 1, seed_value]), f * f * (3 - 2 * f)) * 2 - 1

static func pnoise(x: float, period: int, seed_value: int = 0) -> float:
	var i := floori(x)
	var f := x - i
	return lerpf(rand([posmod(i, period), seed_value]), rand([posmod(i + 1, period), seed_value]), f * f * (3 - 2 * f)) * 2 - 1

static func noise_for(t: float, duration: float, rate: float, seed_value: int = 0, off: float = 0) -> float:
	if duration == 0: return noise(t * rate + off, seed_value)
	var period := maxi(1, js_round(rate * duration))
	return pnoise(t / duration * period + off, period, seed_value)

static func tile_noise(x: float, y: float, px: int = 0, py: int = 0, seed_value: int = 0) -> float:
	var ix := floori(x); var iy := floori(y)
	var fx := x - ix; var fy := y - iy
	var ux := fx * fx * (3 - 2 * fx); var uy := fy * fy * (3 - 2 * fy)
	var x0 := posmod(ix, px) if px else ix; var x1 := posmod(ix + 1, px) if px else ix + 1
	var y0 := posmod(iy, py) if py else iy; var y1 := posmod(iy + 1, py) if py else iy + 1
	return lerpf(lerpf(rand([x0, y0, seed_value]), rand([x1, y0, seed_value]), ux), lerpf(rand([x0, y1, seed_value]), rand([x1, y1, seed_value]), ux), uy) * 2 - 1

static func noise2(x: float, y: float, seed_value: int = 0) -> float: return tile_noise(x, y, 0, 0, seed_value)
static func fbm(x: float, y: float, seed_value: int = 0, octaves: int = 3) -> float:
	var s := 0.0; var a := 0.5; var n := 0.0
	for o in range(octaves):
		s += noise2(x, y, seed_value + o * 101) * a; n += a
		x *= 2.03; y *= 2.03; a *= 0.5
	return s / n
static func tile_fbm(x: float, y: float, px: int = 0, py: int = 0, seed_value: int = 0, octaves: int = 3) -> float:
	var s := 0.0; var a := 0.5; var n := 0.0; var k := 1
	for o in range(octaves):
		s += tile_noise(x * k, y * k, px * k, py * k, seed_value + o * 101) * a; n += a; a *= 0.5; k *= 2
	return s / n
static func loop_noise(phase: float, radius: float = 1, seed_value: int = 0) -> float:
	return noise2(cos(phase * TAU) * radius + 50, sin(phase * TAU) * radius + 50, seed_value)
