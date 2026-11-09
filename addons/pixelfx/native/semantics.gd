@tool
extends RefCounted
## Runtime support for ahead-of-time GDScript ports. No source parsing or JavaScript engine at runtime.
## Preserves JS lexical bindings, numeric buffers, callbacks, prototypes and collection behavior.
const Registry = preload("registry.gd")
const MathFX = preload("../core/math.gd")
const ColorFX = preload("../core/color.gd")
const Frame = preload("../core/frame.gd")
const Painter = preload("painter.gd")
const Bridge = preload("../effects/simulation_bridge.gd")
static var modules: Dictionary = {}
static var session_cleaner
class SessionCleaner:
	extends Node
	func _exit_tree():
		load("res://addons/pixelfx/native/semantics.gd").shutdown()
static var errors: Array = []
static var function_refs: Array = []

class Scope:
	extends RefCounted
	var parent
	var values: Dictionary = {}
	var executable: Script
	func _init(p=null, s=null):
		parent=p
		executable=s if s != null else (p.executable if p != null else null)
class ImportValue:
	extends RefCounted
	var module_id: String
	var name
	func _init(m,n):module_id=m;name=n
class FunctionValue:
	extends RefCounted
	var environment
	var method: String
	var properties: Dictionary={}
	func _init(e, m): environment=e; method=m
	func invoke(args: Array, receiver=null):
		return environment.executable.call(method, environment, args, receiver)
	func callback() -> Callable:
		return func(a=null,b=null,c=null,d=null): return invoke([a,b,c,d])
class NativeMethod:
	extends RefCounted
	var object
	var name: String
	func _init(o,n): object=o; name=n
class Buffer:
	extends RefCounted
	var kind: String
	var floats=PackedFloat32Array()
	var doubles=PackedFloat64Array()
	var ints=PackedInt64Array()
	var owner
	var field: String
	func _init(k: String, input=0):
		kind=k
		var count=int(input) if input is float or input is int else input.size()
		if k=="Float32Array": floats.resize(count)
		elif k=="Float64Array": doubles.resize(count)
		else: ints.resize(count)
		if not (input is float or input is int):
			for i in range(count): put(i,input[i])
	func size() -> int:
		if owner != null: return owner.get(field).size()
		return floats.size() if kind=="Float32Array" else doubles.size() if kind=="Float64Array" else ints.size()
	func at(i: int):
		if i<0 or i>=size(): return null
		if owner != null: return owner.get(field)[i]
		return floats[i] if kind=="Float32Array" else doubles[i] if kind=="Float64Array" else ints[i]
	func put(i: int,v):
		if i<0 or i>=size(): return v
		if owner != null:
			var values=owner.get(field); values[i]=int(v)&0xffffffff; owner.set(field,values)
		elif kind=="Float32Array": floats[i]=float(v) if v!=null else 0.0
		elif kind=="Float64Array": doubles[i]=float(v) if v!=null else 0.0
		elif kind=="Uint8ClampedArray": ints[i]=Frame.byte_clamp(float(v))
		else:
			var value=int(v) if v!=null else 0
			match kind:
				"Uint8Array": value&=255
				"Int8Array": value&=255; value=value-256 if value>=128 else value
				"Uint16Array": value&=65535
				"Int16Array": value&=65535; value=value-65536 if value>=32768 else value
				"Uint32Array": value&=0xffffffff
				"Int32Array": value&=0xffffffff; value=value-0x100000000 if value>=0x80000000 else value
			ints[i]=value
		return v
class Collection:
	extends RefCounted
	var items: Array = []
	var is_set: bool
	func _init(set_mode=false): is_set=set_mode
	func index(key) -> int:
		for i in range(items.size()):
			if is_same(items[i][0],key): return i
		return -1

static func scope(parent=null, script=null): return Scope.new(parent,script)
static func iteration(e):
	var result=Scope.new(e.parent,e.executable); result.values=e.values.duplicate(); return result
static func define(e,key,value): e.values[key]=value; return value
static func read(e,key):
	var current=e
	while current!=null:
		if current.values.has(key):
			var value=current.values[key]
			if value is ImportValue:
				var imported=module(value.module_id)
				return imported if value.name==null else prop(imported,value.name)
			return value
		current=current.parent
	return builtin(key)
static func write(e,key,value,operation="=",post=false):
	var current=e
	while current.parent!=null and not current.values.has(key): current=current.parent
	var old=current.values.get(key)
	var result=value if operation=="=" else binary(operation.trim_suffix("="),old,value)
	current.values[key]=result
	return old if post else result
static func function_value(e,method):
	var result=FunctionValue.new(e,method); function_refs.append(weakref(result)); return result
static func arg(args,index): return args[index] if index<args.size() else null
static func coalesce(value, fallback: Callable): return fallback.call() if value==null else value
static func logical(operation,left,right: Callable):
	if operation=="??": return right.call() if left==null else left
	if operation=="&&": return right.call() if truth(left) else left
	return left if truth(left) else right.call()
static func truth(value) -> bool:
	if value==null: return false
	if value is bool: return value
	if value is int or value is float: return value!=0 and not is_nan(float(value))
	if value is String: return not value.is_empty()
	return true
static func number(value) -> float:
	if value==null: return 0.0
	if value is bool: return 1.0 if value else 0.0
	if value is String: return float(value) if value.is_valid_float() else NAN
	return float(value)
static func integer(value) -> int:
	var n=number(value)
	return int(n) if is_finite(n) else 0
static func string(value) -> String:
	if value==null: return "undefined"
	if value is bool: return "true" if value else "false"
	if value is float and is_finite(value) and value==floor(value): return str(int(value))
	return str(value)
static func unary(operation,value):
	match operation:
		"!": return not truth(value)
		"-": return -number(value)
		"+": return number(value)
		"~": return signed32(~integer(value))
		"void": return null
		"typeof":
			if value==null: return "undefined"
			if value is FunctionValue or value is NativeMethod or value is Callable or value is Dictionary and value.has("__builtin"): return "function"
			if value is int or value is float: return "number"
			if value is bool: return "boolean"
			if value is String: return "string"
			return "object"
	fail("Unknown unary operation "+str(operation)); return null
static func signed32(n):
	var result=integer(n)&0xffffffff
	return result-0x100000000 if result>=0x80000000 else result
static func binary(operation,a,b):
	match operation:
		"+": return string(a)+string(b) if a is String or b is String else number(a)+number(b)
		"-": return number(a)-number(b)
		"*": return number(a)*number(b)
		"/": return number(a)/number(b) if number(b)!=0 else (NAN if number(a)==0 else INF*signf(number(a))*signf(number(b)))
		"%": return fmod(number(a),number(b)) if number(b)!=0 else NAN
		"**": return pow(number(a),number(b))
		"<": return a<b if a is String and b is String else number(a)<number(b)
		">": return a>b if a is String and b is String else number(a)>number(b)
		"<=": return a<=b if a is String and b is String else number(a)<=number(b)
		">=": return a>=b if a is String and b is String else number(a)>=number(b)
		"===", "==":
			if a==null or b==null: return a==null and b==null
			if a is Object or b is Object or a is Dictionary or b is Dictionary or a is Array or b is Array: return is_same(a,b)
			if typeof(a)!=typeof(b) and not (a is int or a is float) and not (b is int or b is float): return false
			if (a is String)!=(b is String) or (a is bool)!=(b is bool): return false
			return a==b
		"!==", "!=": return not binary("===",a,b)
		"&": return signed32(integer(a)&integer(b))
		"|": return signed32(integer(a)|integer(b))
		"^": return signed32(integer(a)^integer(b))
		"<<": return signed32(integer(a)<<(integer(b)&31))
		">>": return signed32(a)>>(integer(b)&31)
		">>>": return (integer(a)&0xffffffff)>>(integer(b)&31)
		"in": return prop(a,b)!=null
		"instanceof": return a is Dictionary and is_same(a.get("__class"),b)
	fail("Unknown binary operation "+str(operation)); return null
static func array(value) -> Array:
	if value==null: return []
	if value is Array: return value
	if value is Buffer:
		var result: Array=[]
		for i in range(value.size()): result.append(value.at(i))
		return result
	if value is String:
		var result: Array=[]
		for i in range(value.length()): result.append(value[i])
		return result
	if value is Collection: return value.items.duplicate() if not value.is_set else value.items.map(func(x): return x[0])
	if value is PackedByteArray or value is PackedInt64Array or value is PackedFloat32Array or value is PackedFloat64Array: return Array(value)
	if value is Dictionary and value.has("length"):
		var result: Array=[]; result.resize(int(value.length)); return result
	fail("Value is not iterable: "+str(value).left(100)); return []
static func concat(parts: Array) -> Array:
	var result: Array=[]
	for part in parts: result.append_array(array(part))
	return result
static func merge(parts: Array) -> Dictionary:
	var result: Dictionary={}
	for part in parts:
		if part is Dictionary:
			for key in part:
				if str(key)=="__getters":
					if not result.has(key): result[key]={}
					result[key].merge(part[key],true)
				else: result[key]=part[key]
	return result
static func omit(value, excluded: Array):
	var result: Dictionary={}
	for key in keys(value):
		if key not in excluded: result[key]=prop(value,key)
	return result
static func last(values: Array): return values.back() if not values.is_empty() else null
static func keys(value) -> Array:
	if value is Dictionary: return value.keys().filter(func(k): return not str(k).begins_with("__"))
	var result: Array=[]
	for i in range(array(value).size()): result.append(str(i))
	return result
static func prop(object,key,receiver=null):
	if receiver==null:receiver=object
	if object==null: return null
	if object is Dictionary:
		if object.has("__builtin"):
			if object.__builtin=="Math" and key in ["PI","SQRT2","E"]:return {"PI":PI,"SQRT2":sqrt(2.0),"E":exp(1.0)}[key]
			return builtin(object.__builtin+"."+str(key))
		if object.has(key): return object[key]
		if object.get("__getters",{}).has(key): return call_value(object.__getters[key],[],receiver)
		if object.has("__proto"): return prop(object.__proto,key,receiver)
		if key is String and ["call","bind","test"].has(key): return NativeMethod.new(object,key)
		return null
	if object is Array or object is String or object is Buffer:
		if str(key)=="length": return object.length() if object is String else object.size()
		if key is int or key is float or str(key).is_valid_int():
			var i=int(key); var count=object.length() if object is String else object.size()
			if i<0 or i>=count: return null
			return object.at(i) if object is Buffer else object[i]
		return NativeMethod.new(object,str(key))
	if object is FunctionValue:
		return object.properties[key] if object.properties.has(key) else NativeMethod.new(object,str(key))
	if object is NativeMethod or object is Callable: return NativeMethod.new(object,str(key))
	if object is Collection: return object.items.size() if key=="size" else NativeMethod.new(object,str(key))
	if object is Object:
		if object is Painter:
			if key in ["w","h","ox","oy"]: return object.frame.get(key)
			if key in ["C","L"]: return frame_buffer(object.frame,"color" if key=="C" else "light")
		if object is Frame and key in ["color","light"]: return frame_buffer(object,key)
		var name=member_name(str(key))
		if object.has_method(name): return NativeMethod.new(object,str(key))
		return object.get(name)
	return null
static func member_name(key: String) -> String:
	return {"toX":"to_x","toY":"to_y","fromX":"from_x","fromY":"from_y","cellX":"cell_x","cellY":"cell_y","glowLine":"glow_line","glowRing":"glow_ring","blendPx":"blend_px","lightK":"light_k","range":"range_value","int":"int_value","sign":"sign_value"}.get(key,key)
static func set_prop(object,key,value,operation="=",post=false):
	if object==null: fail("Write to null member "+str(key)); return null
	var old=prop(object,key)
	var result=value if operation=="=" else (value if operation=="??=" and old==null else old if operation=="??=" else binary(operation.trim_suffix("="),old,value))
	if object is FunctionValue:object.properties[key]=result
	elif object is Buffer: object.put(integer(key),result)
	elif object is Array:
		if str(key)=="length": object.resize(integer(result))
		elif integer(key)>=0:
			if integer(key)>=object.size(): object.resize(integer(key)+1)
			object[integer(key)]=result
	elif object is Dictionary:
		if object.get("__setters",{}).has(key): call_value(object.__setters[key],[result],object)
		else: object[key]=result
	elif object is Object: object.set(member_name(str(key)),result)
	return old if post else result
static func delete_prop(object,key):
	if object is Dictionary: object.erase(key)
	return true
static func destructure(e,names,value):
	for i in range(names.size()):
		if names[i]!=null: write(e,names[i],prop(value,i))
	return value
static func class_value(name,constructor,methods,getters,setters,base=null):
	var proto={"__getters":getters,"__setters":setters};proto.merge(methods)
	return {"__class_name":name,"__constructor":constructor,"__prototype":proto,"__base":base}
static func construct(kind,args: Array):
	if kind is Dictionary and kind.has("__builtin"): return call_builtin(kind.__builtin,args,true)
	if kind is Dictionary and kind.has("__class_name"):
		if kind.__class_name=="Clipped": return Painter.new(arg(args,0),true)
		var object={"__class":kind,"__proto":kind.__prototype}
		call_value(kind.__constructor,args,object);return object
	fail("Invalid constructor "+str(kind).left(100)); return null
static func super_value(object): return object.get("__class",{}).get("__base") if object is Dictionary else object
static func call_value(fn,args: Array,receiver=null):
	if fn is FunctionValue: return fn.invoke(args,receiver)
	if fn is NativeMethod: return invoke(fn.object,fn.name,args)
	if fn is Callable: return fn.callv(args)
	if fn is Dictionary and fn.has("__builtin"): return call_builtin(fn.__builtin,args)
	if fn is Dictionary and fn.has("__bound"): return call_value(fn.__bound,fn.args+args,fn.receiver)
	fail("Value is not callable: "+str(fn).left(120)); return null
static func invoke(object,key,args: Array):
	if object==null: fail("Call on null: "+str(key)); return null
	if object is Dictionary:
		if object.has("__builtin"):
			if object.__builtin=="RegExp" and key=="test":
				var pattern=RegEx.new();pattern.compile(("(?i)" if "i" in object.flags else "")+object.pattern)
				return pattern.search(string(arg(args,0)))!=null
			return call_builtin(object.__builtin+"."+str(key),args)
		if key in ["call","bind"] and object.has("__bound"): return call_value(object,args.slice(1),arg(args,0))
		var fn=prop(object,key)
		if fn!=null: return call_value(fn,args,object)
		fail("Missing method "+str(key)); return null
	if object is FunctionValue and object.properties.has(key):return call_value(object.properties[key],args,object)
	if key=="call" and (object is FunctionValue or object is NativeMethod or object is Callable): return call_value(object,args.slice(1),arg(args,0))
	if key=="bind": return {"__bound":object,"receiver":arg(args,0),"args":args.slice(1)}
	if object is Collection:
		var index=object.index(arg(args,0))
		match key:
			"get": return object.items[index][1] if index>=0 else null
			"has": return index>=0
			"set","add":
				var pair=[arg(args,0),arg(args,1)]
				if index>=0: object.items[index]=pair
				else: object.items.append(pair)
				return object
			"delete":
				if index>=0: object.items.remove_at(index)
				return index>=0
			"clear": object.items.clear(); return null
			"values": return object.items.map(func(x):return x[0] if object.is_set else x[1])
			"entries": return object.items.duplicate()
	if object is Array or object is Buffer:
		var values=array(object)
		match key:
			"entries":
				var pairs: Array=[]
				for i in range(values.size()):pairs.append([i,values[i]])
				return pairs
			"values":return values
			"keys":
				var indices: Array=[]
				for i in range(values.size()):indices.append(i)
				return indices
			"map","flatMap","filter","some","every","find","findIndex","forEach":
				var result: Array=[]
				for i in range(values.size()):
					var value=call_value(arg(args,0),[values[i],i,object])
					match key:
						"map": result.append(value)
						"flatMap": result.append_array(array(value))
						"filter":
							if truth(value): result.append(values[i])
						"some":
							if truth(value): return true
						"every":
							if not truth(value): return false
						"find":
							if truth(value): return values[i]
						"findIndex":
							if truth(value): return i
				if key=="some": return false
				if key=="every": return true
				if key=="find": return null
				if key=="findIndex": return -1
				return result
			"reduce":
				var result=arg(args,1)
				for i in range(values.size()): result=call_value(arg(args,0),[result,values[i],i,object])
				return result
			"fill":
				for i in range(values.size()):
					if object is Buffer: object.put(i,arg(args,0))
					else: object[i]=arg(args,0)
				return object
			"push": object.append_array(args); return object.size()
			"pop": return object.pop_back()
			"shift": return object.pop_front()
			"unshift":
				for i in range(args.size()-1,-1,-1): object.push_front(args[i])
				return object.size()
			"slice": return values.slice(integer(arg(args,0)),integer(arg(args,1)) if args.size()>1 else values.size())
			"splice":
				var start=integer(arg(args,0));start=maxi(0,values.size()+start) if start<0 else mini(values.size(),start)
				var count=integer(arg(args,1)) if args.size()>1 else values.size()-start
				var removed=values.slice(start,start+count)
				for i in range(mini(count,object.size()-start)): object.remove_at(start)
				for i in range(args.size()-1,1,-1): object.insert(start,args[i])
				return removed
			"sort":
				stable_sort(values,null if args.is_empty() else args[0])
				if object is Buffer:
					for i in range(values.size()):object.put(i,values[i])
				return object
			"reverse":
				values.reverse()
				if object is Buffer:
					for i in range(values.size()):object.put(i,values[i])
				return object
			"concat": return concat([values]+args.map(func(x):return x if x is Array else [x]))
			"join": return (string(arg(args,0)) if not args.is_empty() else ",").join(values.map(func(x):return string(x)))
			"indexOf","includes": return values.find(arg(args,0)) if key=="indexOf" else values.has(arg(args,0))
			"at": return values[integer(args[0])] if absi(integer(args[0]))<=values.size() else null
			"flat": return concat(values)
			"set":
				for i in range(array(arg(args,0)).size()):set_prop(object,i+integer(arg(args,1)),prop(args[0],i))
				return null
	if object is String:
		match key:
			"split": return Array(object.split(string(arg(args,0))))
			"replace": return object.replace(string(arg(args,0)),string(arg(args,1)))
			"toUpperCase": return object.to_upper()
			"toLowerCase": return object.to_lower()
			"slice","substring": return object.substr(integer(arg(args,0)),integer(args[1])-integer(args[0]) if args.size()>1 else -1)
			"padStart": return object.lpad(integer(args[0]),string(args[1]))
			"charCodeAt": return object.unicode_at(integer(arg(args,0)))
			"indexOf": return object.find(string(arg(args,0)))
			"includes": return object.contains(string(arg(args,0)))
	if object is int or object is float:
		if key=="toString": return "%x"%integer(object) if arg(args,0)==16 else string(object)
	if object is Object:
		var name="read_pixel" if object is Painter and key=="get" else member_name(str(key))
		if object.has_method(name):
			var converted: Array=[]
			for value in args: converted.append(value.callback() if value is FunctionValue else value)
			var result=object.callv(name,converted)
			return object if key in ["reset","place"] else result
	fail("Unsupported method "+str(key)+" on "+str(object).left(100));return null
static func builtin(name): return {"__builtin":name}
static func regex(pattern,flags): return {"__builtin":"RegExp","pattern":pattern,"flags":flags}
static func call_builtin(name: String,args: Array,constructing=false):
	var a=arg(args,0);var b=arg(args,1)
	if name.begins_with("Math."):
		var n=number(a)
		match name.trim_prefix("Math."):
			"floor": return floor(n)
			"ceil": return ceil(n)
			"round": return floor(n+0.5)
			"trunc": return integer(n)
			"abs": return absf(n)
			"sign": return signf(n)
			"sin": return sin(n)
			"cos": return cos(n)
			"tan": return tan(n)
			"asin": return asin(n)
			"acos": return acos(n)
			"atan": return atan(n)
			"atan2": return atan2(n,number(b))
			"sqrt": return sqrt(n)
			"exp": return exp(n)
			"log": return log(n)
			"log2": return log(n)/log(2.0)
			"pow": return pow(n,number(b))
			"cbrt": return signf(n)*pow(absf(n),1.0/3)
			"hypot": return Bridge.hypot(args)
			"imul": return signed32(MathFX.imul(integer(a),integer(b)))
			"min","max":
				var result=INF if name=="Math.min" else -INF
				for value in args: result=minf(result,number(value)) if name=="Math.min" else maxf(result,number(value))
				return result
	if name in ["Array.from","Float32Array.from","Uint32Array.from","Uint8Array.from","Float64Array.from","Int32Array.from"]:
		var values=array(a)
		if b!=null:
			for i in range(values.size()): values[i]=call_value(b,[values[i],i])
		return values if name=="Array.from" else Buffer.new(name.trim_suffix(".from"),values)
	match name:
		"Object.keys": return keys(a)
		"Object.values": return keys(a).map(func(k):return prop(a,k))
		"Object.entries": return keys(a).map(func(k):return [k,prop(a,k)])
		"Object.fromEntries":
			var result: Dictionary={}
			for item in array(a):result[prop(item,0)]=prop(item,1)
			return result
		"Object.assign":
			for source in args.slice(1):
				for k in keys(source):set_prop(a,k,prop(source,k))
			return a
		"Object.create": return {"__proto":a}
		"Object.getPrototypeOf": return a.get("__proto") if a is Dictionary else a
		"Array.isArray": return a is Array
		"Array":
			var result: Array=[]
			if args.size()==1 and (a is int or a is float): result.resize(integer(a))
			else: result=args.duplicate()
			return result
		"Uint8Array","Uint8ClampedArray","Int8Array","Uint16Array","Int16Array","Uint32Array","Int32Array","Float32Array","Float64Array": return Buffer.new(name,0 if a==null else array(a) if a is Buffer else a)
		"Set","Map","WeakMap":
			var result=Collection.new(name=="Set")
			if a!=null:
				for value in array(a):result.items.append([value,null] if name=="Set" else value)
			return result
		"String": return string(a)
		"Number": return number(a)
		"Boolean": return truth(a)
		"parseInt": return string(a).hex_to_int() if b==16 else integer(a)
		"isFinite","Number.isFinite": return is_finite(number(a))
		"Error": return string(a)
		"Painter": return Painter.new(a)
		"native.weather_clip":
			var result=Painter.new(a.frame,true)
			for key in ["tx","ty","fx","cs","sn","fade","light_k","layer"]:result.set(key,a.get(key))
			result.clip_bounds=Rect2(-b.origin[0],-b.origin[1],b.size[0],b.size[1])
			return result
		"native.createFrame": return Frame.new(integer(a),integer(b),integer(arg(args,2)),integer(arg(args,3)))
		"native.clearFrame": a.clear();return a
		"native.painterFor": return Painter.new(a)
		"native.composite":
			var bytes=a.composite(arg(args,2),number(arg(args,3)) if args.size()>3 else 1.0)
			for i in range(bytes.size()):set_prop(b,i,bytes[i])
			return b
		"native.rand": return MathFX.rand(args)
		"native.hash": return MathFX.hash_numbers(args)
		"native.rng": return MathFX.rng(args)
		"native.Rng": return MathFX.Rng.new(integer(a) if a!=null else 1)
		"native.hex": return ColorFX.rgb(a.r*255,a.g*255,a.b*255) if a is Color else ColorFX.hex(a)
		"native.fit": return ColorFX.fit(array(a),integer(b))
		"native.rgb": return ColorFX.rgb(number(a),number(b),number(arg(args,2)))
		"native.mix": return ColorFX.mix(integer(a),integer(b),number(arg(args,2)))
		"native.luma": return ColorFX.luma(integer(a))
		"native.scale": return ColorFX.scale_color(integer(a),number(b))
		"native.toHex": return ColorFX.to_hex(integer(a))
	if name.begins_with("native.math."):
		var native_name={"lerp":"lerpf","invLerp":"inv_lerp","remap":"remap_value","tileNoise":"tile_noise","tileFbm":"tile_fbm","loopNoise":"loop_noise","pingpong":"ping_pong"}.get(name.trim_prefix("native.math."),name.trim_prefix("native.math."))
		var math_script: Script=MathFX
		if math_script.has_method(native_name):return math_script.callv(native_name,args)
	fail("Unknown builtin "+name);return null
static func frame_buffer(frame,field):
	var result=Buffer.new("Uint32Array");result.owner=frame;result.field=field;return result
static func module(id: String) -> Dictionary:
	if modules.has(id):return modules[id]
	if id=="core/painter.js":
		modules[id]={"Painter":builtin("Painter")};return modules[id]
	if not Registry.PATHS.has(id):fail("Missing module "+id);return {}
	var exports: Dictionary={}; modules[id]=exports
	var script=load(Registry.PATHS[id])
	if script==null or not script.can_instantiate():fail("Cannot compile module "+id);return exports
	exports.merge(script.build(script),true)
	var fast: Dictionary={}
	if id=="core/math.js":
		for key in ["rand","hash","rng","Rng"]:fast[key]=builtin("native."+key)
		for key in ["fract","seg","smooth","bump","noise","noise2","fbm","tileNoise","tileFbm","loopNoise","invLerp","remap"]:fast[key]=builtin("native.math."+key)
	if id=="core/color.js":
		for key in ["hex","fit","rgb","mix","luma","scale","toHex"]:fast[key]=builtin("native."+key)
	if id=="fx/weather/_lib.js":fast["clip"]=builtin("native.weather_clip")
	if id=="core/fx.js":
		for key in ["createFrame","clearFrame","painterFor","composite"]:fast[key]=builtin("native."+key)
	if not fast.is_empty():
		exports.merge(fast,true)
		for key in fast:define(exports.__scope,key,fast[key])
	return exports
static func fail(message):
	var text=string(message)
	if text not in errors:
		errors.append(text);push_error(text)

static func optional_call(fn,args: Array):return call_value(fn,args) if fn!=null else null

static func shutdown() -> void:
	# Function scopes own closure cycles. Sever every tracked function first,
	# without recursively walking the weather caches or their large pixel arrays.
	for reference in function_refs:
		var fn=reference.get_ref()
		if fn!=null:fn.environment=null;fn.properties.clear()
	function_refs.clear();modules.clear();live_owners.clear()

static func import_value(module_id,name):return ImportValue.new(module_id,name)

static var live_owners: Dictionary={}
static var draw_calls=0
static func register_owner(owner,field="_instance") -> void:
	if session_cleaner==null or session_cleaner.get_ref()==null:
		var tree=Engine.get_main_loop()
		if tree is SceneTree:
			var cleaner=SessionCleaner.new();cleaner.name="PixelFXNativeSession"
			session_cleaner=weakref(cleaner);tree.root.add_child.call_deferred(cleaner)
	live_owners[owner.get_instance_id()]=[weakref(owner),field]
static func collect_after_draw() -> void:
	draw_calls+=1
	# Drop expired weak handles without scanning pixel caches every frame.
	if draw_calls%120==0:function_refs=function_refs.filter(func(reference):return reference.get_ref()!=null)
static func collect() -> void:
	# Godot reference counting does not collect lexical closure cycles. Mark native
	# modules and live effect owners, then sever only unreachable function scopes.
	var pending: Array=[modules]
	for id in live_owners.keys():
		var owner=live_owners[id][0].get_ref()
		if owner==null:live_owners.erase(id)
		else:pending.append(owner.get(live_owners[id][1]))
	var marked: Dictionary={};var containers: Array=[]
	while not pending.is_empty():
		var value=pending.pop_back()
		if value is Scope or value is FunctionValue or value is NativeMethod or value is Collection:
			var id=value.get_instance_id()
			if marked.has(id):continue
			marked[id]=true
			if value is Scope:pending.append(value.values);pending.append(value.parent)
			elif value is FunctionValue:pending.append(value.environment);pending.append(value.properties)
			elif value is NativeMethod:pending.append(value.object)
			elif value is Collection:pending.append(value.items)
		elif value is Array or value is Dictionary:
			var seen=false
			for prior in containers:
				if is_same(prior,value):seen=true;break
			if seen:continue
			containers.append(value)
			pending.append_array(value.values() if value is Dictionary else value)
	var retained: Array=[]
	for reference in function_refs:
		var fn=reference.get_ref()
		if fn==null:continue
		if marked.has(fn.get_instance_id()):retained.append(reference)
		else:fn.environment=null
	function_refs=retained
static func stable_sort(values: Array,compare=null) -> void:
	# ECMAScript requires stable sort; Godot's unstable sort also rejects the
	# upstream Frozen effect's randomized comparator. Stable merging remains bounded.
	var count=values.size()
	if count<2:return
	var less=func(a,b):return string(a)<string(b) if compare==null else number(call_value(compare,[a,b]))<0
	if count<64:
		var run=2
		var descending=less.call(values[1],values[0])
		while run<count and (less.call(values[run],values[run-1]) if descending else not less.call(values[run],values[run-1])):run+=1
		if descending:
			var segment=values.slice(0,run);segment.reverse()
			for i in range(run):values[i]=segment[i]
		for i in range(run,count):
			var pivot=values[i];var left=0;var right=i
			while left<right:
				var middle=(left+right)>>1
				if less.call(pivot,values[middle]):right=middle
				else:left=middle+1
			for j in range(i,left,-1):values[j]=values[j-1]
			values[left]=pivot
		return
	var work=values.duplicate();var width=1
	while width<count:
		for left in range(0,count,width*2):
			var middle=mini(left+width,count);var right=mini(left+width*2,count);var a=left;var b=middle
			for out in range(left,right):
				if a<middle and (b>=right or not less.call(values[b],values[a])):work[out]=values[a];a+=1
				else:work[out]=values[b];b+=1
		for i in range(count):values[i]=work[i]
		width*=2
