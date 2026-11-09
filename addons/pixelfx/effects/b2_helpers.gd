@tool
extends RefCounted
## Small adapters for native ports of JavaScript's array callbacks and loop noise.
const Colors = preload("../core/color.gd")
const MathFX = preload("../core/math.gd")

static func color(value) -> int:
	return Colors.hex(value.to_html(false) if value is Color else value)

static func hot_first(ramp: Array) -> Array:
	var result = ramp.duplicate()
	result.reverse()
	return result

static func noise_for(duration: float) -> Callable:
	return func(t, rate, seed_value=0, offset=0):
		return MathFX.noise_for(t, duration, rate, seed_value, offset)

static func make_array(count: int, create: Callable) -> Array:
	var result = []
	for i in range(count): result.append(create.call(null, i))
	return result

static func map_indexed(values: Array, transform: Callable) -> Array:
	var result = []
	for i in range(values.size()): result.append(transform.call(values[i], i))
	return result

static func at(values: Array, index: int):
	return values[index] if index < values.size() else null

static func in_out_sine(t: float) -> float:
	return -(cos(PI*t)-1)/2

static func each_indexed(values: Array, visit: Callable) -> void:
	for i in range(values.size()): visit.call(values[i], i)
