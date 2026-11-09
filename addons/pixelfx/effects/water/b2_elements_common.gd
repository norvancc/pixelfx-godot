@tool
extends "../native_bridge.gd"
## Additional src/fx/water/_lib.js functions; MIT (c) Patch / Hugo Duprez.
const Water = preload("water_common.gd")

static func rock() -> Array:
	var result = []
	for value in Water.ROCK: result.append(Colors.hex(value))
	return result

static func billow(p, x, y, r, colors: Array, a=1.0) -> void:
	if r < 0.9:
		p.dot(x, y, colors[6], a)
		return
	p.circle(x+r*0.12, y+r*0.2, r, colors[4], a)
	p.circle(x, y, r*0.84, colors[6], a)
	if r > 1.6: p.circle(x-r*0.3, y-r*0.32, r*0.46, Colors.WHITE, a)
