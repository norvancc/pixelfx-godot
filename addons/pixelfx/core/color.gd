@tool
extends RefCounted
## Packed ABGR integers, matching upstream Uint32 RGBA byte layout.
const WHITE: int = 0xffffffff
const BLACK: int = 0xff000000
const SMOKE_RAMP = [0xff726f7b, 0xff60565d, 0xff483d43, 0xff30262b, 0xff1e171a]

static func rgb(r: float, g: float, b: float) -> int: return 0xff000000 | ((int(b) & 255) << 16) | ((int(g) & 255) << 8) | (int(r) & 255)
static func hex(value) -> int:
	if value is int or value is float: return int(value) & 0xffffffff
	var s: String = str(value).trim_prefix("#")
	if s.length() == 3: s = s[0] + s[0] + s[1] + s[1] + s[2] + s[2]
	var v := s.substr(0, 6).hex_to_int()
	return rgb((v >> 16) & 255, (v >> 8) & 255, v & 255)
static func to_hex(c: int) -> String: return "#%02x%02x%02x" % [c & 255, (c >> 8) & 255, (c >> 16) & 255]
static func mix(a: int, b: int, t: float) -> int:
	t = clampf(t, 0, 1)
	return rgb(lerpf(a & 255, b & 255, t), lerpf((a >> 8) & 255, (b >> 8) & 255, t), lerpf((a >> 16) & 255, (b >> 16) & 255, t))
static func scale_color(c: int, k: float) -> int: return rgb(minf(255, (c & 255) * k), minf(255, ((c >> 8) & 255) * k), minf(255, ((c >> 16) & 255) * k))
static func luma(c: int) -> float: return (0.299 * (c & 255) + 0.587 * ((c >> 8) & 255) + 0.114 * ((c >> 16) & 255)) / 255
static func fit(colors: Array, n: int) -> Array:
	assert(not colors.is_empty() and n > 0)
	var out: Array = []
	for i in range(n): out.append(hex(colors[floori(float(i * (colors.size() - 1)) / maxi(1, n - 1) + 0.5)]))
	return out
static func at(colors: Array, t: float) -> int: return colors[clampi(floori(t * colors.size()), 0, colors.size() - 1)]
static func blend(colors: Array, t: float) -> int:
	if colors.size() == 1: return colors[0]
	var x := clampf(t, 0, 1) * (colors.size() - 1)
	var i := mini(colors.size() - 2, floori(x))
	return mix(colors[i], colors[i + 1], x - i)
