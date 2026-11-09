@tool
extends "b2_helpers.gd"
## JavaScript collection semantics used by native ports. Runtime executes only GDScript.

class NativeMap:
	extends RefCounted
	var values: Dictionary = {}
	func get(key): return values.get(key)
	func set_value(key, value):
		values[key] = value
		return self

static func concat_arrays(parts: Array) -> Array:
	var result: Array = []
	for values in parts: result.append_array(values)
	return result

static func merge_dicts(parts: Array) -> Dictionary:
	var result: Dictionary = {}
	for values in parts: result.merge(values, true)
	return result

static func push_items(values: Array, items: Array) -> int:
	values.append_array(items)
	return values.size()

static func sort_array(values: Array, compare: Callable) -> Array:
	values.sort_custom(compare)
	return values

static func reverse_array(values: Array) -> Array:
	values.reverse()
	return values

static func flat_map(values: Array, transform: Callable) -> Array:
	var result: Array = []
	for i in range(values.size()): result.append_array(transform.call(values[i], i))
	return result

static func reduce_array(values: Array, transform: Callable, initial):
	var result = initial
	for value in values: result = transform.call(result, value)
	return result

static func typed_array(kind: String, count):
	var result
	if kind == "Float32Array": result = PackedFloat32Array()
	else: result = PackedInt32Array()
	result.resize(int(count))
	return result

static func fill_array(values, value):
	values.fill(value)
	return values

static func slice_value(value, begin=0, end=null):
	var count = value.length() if value is String else value.size()
	var first = clampi(int(begin)+count if begin < 0 else int(begin), 0, count)
	var last = count if end == null else clampi(int(end)+count if end < 0 else int(end), 0, count)
	if value is String: return value.substr(first, maxi(0, last-first))
	return value.slice(first, maxi(first, last))

static func parse_int(value: String, radix=10) -> int:
	return value.hex_to_int() if radix == 16 else int(value)

static func hypot(values: Array) -> float:
	# V8 scales before squaring and compensates the sum; sqrt(x*x+y*y)
	# changes rounding and can select a different integer alpha channel.
	var maximum = 0.0
	var has_nan = false
	for value in values:
		if is_inf(float(value)): return INF
		if is_nan(float(value)): has_nan = true
		maximum = maxf(maximum, absf(float(value)))
	if has_nan: return NAN
	if maximum == 0: return 0.0
	var total = 0.0
	var compensation = 0.0
	for value in values:
		var normalized = absf(float(value))/maximum
		var term = normalized*normalized-compensation
		var preliminary = total+term
		compensation = (preliminary-total)-term
		total = preliminary
	return sqrt(total)*maximum
