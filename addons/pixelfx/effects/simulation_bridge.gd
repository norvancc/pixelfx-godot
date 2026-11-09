@tool
extends "native_bridge.gd"
## Native collection and shape helpers used by the second B2 simulation slice.
## Shape algorithm: pinned PixelFX src/core/shapes.js; MIT (c) Patch / Hugo Duprez.

class NativeSet:
	extends RefCounted
	var storage: Dictionary = {}
	func has(key) -> bool: return storage.has(key)
	func add(key):
		storage[key] = true
		return self

class SimulationMap:
	extends RefCounted
	var storage: Dictionary = {}
	func get(key): return storage.get(key)
	func set_value(key, value):
		storage[key] = value
		return self
	func entries_values() -> Array: return storage.values()

static func assign_member(object, key, value, operation: String):
	match operation:
		"=": object[key] = value
		"+=": object[key] += value
		"-=": object[key] -= value
		"*=": object[key] *= value
		"/=": object[key] = float(object[key])/value
	return object[key]

static func call_optional(object, key: String, arguments: Array):
	var callback = object.get(key)
	if callback is Callable and callback.is_valid(): return callback.callv(arguments)
	return null

static func bolt(r, x0, y0, x1, y1, options: Dictionary = {}) -> Array:
	var jag = options.get("jag", 0.22)
	var depth = options.get("depth", 5)
	var points = [[x0,y0],[x1,y1]]
	for _step in range(depth):
		var next = [points[0]]
		for i in range(1,points.size()):
			var ax = points[i-1][0]; var ay = points[i-1][1]
			var bx = points[i][0]; var by = points[i][1]
			var dx = bx-ax; var dy = by-ay
			var length = hypot([dx,dy])
			var off = (r.next()*2-1)*jag*length
			next.append([(ax+bx)/2+(-dy/(length if length else 1))*off,(ay+by)/2+(dx/(length if length else 1))*off])
			next.append(points[i])
		points = next
	return points

const Sim = preload("../core/sim.gd")
const ColorFX = preload("../core/color.gd")
const MathFXSim = preload("../core/math.gd")

static func in_out_cubic(t: float) -> float:
	return 4*t*t*t if t < 0.5 else 1-pow(-2*t+2,3)/2

class Bits:
	extends Sim.Bits
	var count: int:
		get: return list.size()
	func draw(p) -> void:
		for b in list:
			var alpha = minf(1,b.life/0.4); var ca = cos(b.a); var sa = sin(b.a)
			if b.kind == Sim.B.SHARD:
				var d = -b.s/2
				while d <= b.s/2:
					p.dot(b.x+ca*d,b.y+sa*d,ColorFX.WHITE if d > b.s/2-0.6 else ColorFX.hex(b.c),alpha)
					d += 0.5
			elif b.kind == Sim.B.DRIP:
				p.dot(b.x,b.y,ColorFX.hex(b.c),alpha)
				p.dot(b.x,b.y-1,ColorFX.hex(b.c),alpha*0.5)
			else:
				var ramp = []
				for value in b.get("ramp",["#1c2030","#3a4a66","#6e86a8","#a8c0dc","#e8f2ff"]): ramp.append(ColorFX.hex(value))
				var n = ramp.size(); var x = MathFXSim.js_round(b.x); var y = MathFXSim.js_round(b.y); var radius = ceili(b.s)+1
				for py in range(-radius,radius+1):
					for px in range(-radius,radius+1):
						var u = (px+0.5)*ca+(py+0.5)*sa; var v = -(px+0.5)*sa+(py+0.5)*ca
						var distance = absf(u)/b.s+absf(v)/(b.s*0.62)
						if distance > 1.3: continue
						var color = ramp[0] if distance > 1 else (ramp[n-1] if u < 0 else ramp[n-2]) if v < 0 else ramp[n-3] if u < 0 else ramp[maxi(1,n-4)]
						p.dot(x+px,y+py,color,alpha)

static func weak_callback(owner: RefCounted, method: String) -> Callable:
	# Simulation callbacks must not keep their owning module alive in a reference cycle.
	var reference = weakref(owner)
	return func(a=null,b=null,c=null,d=null):
		var instance = reference.get_ref()
		return instance.call(method,a,b,c,d) if instance != null else null

class NumericBuffer:
	extends RefCounted
	var floats = PackedFloat32Array()
	var bytes = PackedByteArray()
	var is_float: bool
	func _init(kind: String, count: int) -> void:
		is_float = kind == "Float32Array"
		if is_float: floats.resize(count)
		else: bytes.resize(count)
	func get_value(index: int): return floats[index] if is_float else bytes[index]
	func set_value(index: int, value) -> void:
		if is_float: floats[index] = value
		else: bytes[index] = int(value)&255
	func fill_value(value):
		if is_float: floats.fill(value)
		else: bytes.fill(int(value)&255)
		return self

static func buffer_array(kind: String, count: int) -> NumericBuffer:
	return NumericBuffer.new(kind,count)

static func bitwise(operation: String, a, b) -> int:
	var left = int(a)&0xffffffff; var right = int(b)&0xffffffff
	var signed_left = left-0x100000000 if left>=0x80000000 else left
	var result: int
	match operation:
		"&": result=left&right
		"|": result=left|right
		"^": result=left^right
		"<<": result=left<<(right&31)
		">>": result=signed_left>>(right&31)
		">>>": return left>>(right&31)
	result &= 0xffffffff
	return result-0x100000000 if result>=0x80000000 else result
