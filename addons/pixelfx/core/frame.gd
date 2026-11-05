@tool
extends RefCounted
## Mutable buffers owned by the frame (avoid PackedArray copy-on-write in Painter).
var w: int
var h: int
var ox: int
var oy: int
var color := PackedInt64Array()
var light := PackedInt64Array()
var rgba := PackedByteArray()

func _init(width: int, height: int, origin_x: int = 0, origin_y: int = 0) -> void:
	assert(width > 0 and height > 0)
	w = width; h = height; ox = origin_x; oy = origin_y
	color.resize(w * h); light.resize(w * h); rgba.resize(w * h * 4)
	clear()

func clear() -> void:
	color.fill(0); light.fill(0)

static func byte_clamp(x: float) -> int:
	# Uint8ClampedArray uses round-to-nearest, ties-to-even; Godot round() does not.
	x = clampf(x, 0, 255)
	var low := floori(x)
	if x - low == 0.5: return low if low % 2 == 0 else low + 1
	return floori(x + 0.5)

func composite(bg = null, light_k: float = 1) -> PackedByteArray:
	rgba.fill(0)
	for i in range(w * h):
		var c: int = color[i]; var l: int = light[i] & 0xffffff
		if c == 0 and l == 0 and bg == null: continue
		var ca: int = (c >> 24) & 255
		var r: float = c & 255; var g: float = (c >> 8) & 255; var b: float = (c >> 16) & 255; var a: float = ca
		if ca != 255 and bg != null:
			var k: int = bg if bg is int else bg[i]
			var f: float = ca / 255.0
			r = r * f + (k & 255) * (1 - f); g = g * f + ((k >> 8) & 255) * (1 - f); b = b * f + ((k >> 16) & 255) * (1 - f); a = 255
		if l:
			var lr: float = (l & 255) * light_k; var lg: float = ((l >> 8) & 255) * light_k; var lb: float = ((l >> 16) & 255) * light_k
			if a < 255:
				var pa := a / 255
				var na := minf(1, maxf(pa, maxf(lr, maxf(lg, lb)) / 255))
				if na > 0:
					r = minf(255, (r * pa + lr) / na); g = minf(255, (g * pa + lg) / na); b = minf(255, (b * pa + lb) / na); a = na * 255
			else:
				r = minf(255, r + lr); g = minf(255, g + lg); b = minf(255, b + lb)
		var j := i * 4
		rgba[j] = byte_clamp(r); rgba[j + 1] = byte_clamp(g); rgba[j + 2] = byte_clamp(b); rgba[j + 3] = byte_clamp(a)
	return rgba

func image(bg = null) -> Image:
	return Image.create_from_data(w, h, false, Image.FORMAT_RGBA8, composite(bg))
