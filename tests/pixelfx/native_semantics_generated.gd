@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX acceptance-fixture.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("res://addons/pixelfx/native/semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "directNumeric", _S.function_value(_e, "_f0"))
	_S.define(_e, "directProbe", _S.function_value(_e, "_f1"))
	_S.define(_e, "result", _S.function_value(_e, "_f2"))
	_S.define(_e, "intrinsicArguments", _S.function_value(_e, "_f6"))
	_S.define(_e, "readonlyCallbacks", _S.function_value(_e, "_f7"))
	_S.define(_e, "mutableCallbacks", _S.function_value(_e, "_f11"))
	_exports["result"] = _S.read(_e, "result")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_out_b0 = _S.arg(_args,0)
	var _n_input_b1 = _S.arg(_args,1)
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < 4)):
			if _S.truth(_S.binary("===",_n_i_b4,1)):
				_n_i_b4 += 1.0
				continue
			_S.set_prop(_n_out_b0,_n_i_b4,(float(sin((_n_input_b1 + _n_i_b4)))/3),"=")
			_n_i_b4 += 1.0
	var _n_total_b2 = 0
	for _iter_0 in _S.array(_n_out_b0):
		var _n_value_b5 = _iter_0
		_n_total_b2 += _n_value_b5
	var _n_payload_b3 = {"input":_n_input_b1,"0":7}
	var _n_input_b6 = 2
	_n_total_b2 += _n_input_b6
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < 2)):
			_n_total_b2 += _n_i_b7
			_n_i_b7 += 1.0
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < 2)):
			_n_total_b2 -= _n_i_b8
			_n_i_b8 += 1.0
	_n_total_b2 -= (((_S.named_value(_n_payload_b3,"input") - _S.named_value(_n_payload_b3,"input")) + _S.index_value(_n_payload_b3,"0")) - 7)
	return [floori((-0.5)+0.5), floori((_n_total_b2 * 10000)), _S.index_value(_n_out_b0,1), floori((maxf(1,_n_total_b2) * 1000000)), _S.unary("+","6"), _S.unary("~",4294967295), (27 + _S.number((_n_input_b1 > 0))), (5 - _S.number((_n_input_b1 < 0))), (_S.number(true) * 3), pow(_S.number((_n_input_b1 > 0)),2), (float(4)/_S.number((_n_input_b1 > 0)))]
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_directNumeric = _S.read(_parent,"directNumeric")
	var _n_Float32Array = _S.read(_parent,"Float32Array")
	var _n_input_b0 = _S.arg(_args,0)
	return _S.call_value(_n_directNumeric,[_S.construct(_n_Float32Array,[4]), _n_input_b0])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "xs", [3, 8, 13])
	_S.destructure_targets([_S.prop(_S.read(_e, "xs"), 2), _S.prop(_S.read(_e, "xs"), 0)], [{"object":_S.read(_e, "xs"),"key":0}, {"object":_S.read(_e, "xs"),"key":2}])
	_S.define(_e, "trace", [])
	var _v7 = _S.scope(_e)
	_S.define(_v7, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "i"), 6)):
		var _v8 = _S.scope(_v7)
		var _v9 = _S.binary("%", _S.read(_v8, "i"), 3)
		var _v10 = false
		var _v11 = false
		while true:
			if _v10 or _S.binary("===", _v9, 0):
				_v10 = true
				_S.invoke(_S.read(_v8, "trace"), "push", [[_S.read(_v8, "i"), "continue"]])
				_v11 = true
				break
			if _v10 or _S.binary("===", _v9, 1):
				_v10 = true
				if _S.truth(_S.binary(">", _S.read(_v8, "i"), 0)):
					var _v12 = _S.scope(_v8)
					_S.invoke(_S.read(_v12, "trace"), "push", [[_S.read(_v12, "i"), "break"]])
					break
				_S.invoke(_S.read(_v8, "trace"), "push", ["unreachable"])
			if _v10 or true:
				_v10 = true
				_S.invoke(_S.read(_v8, "trace"), "push", [[_S.read(_v8, "i"), "default"]])
			break
		if _v11:
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v8, "trace"), "push", [[_S.read(_v8, "i"), "tail"]])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "i", 1, "+=", true)
	_S.define(_e, "callbacks", [])
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), 4)):
		_S.invoke(_S.read(_v13, "callbacks"), "push", [_S.function_value(_v13, "_f3")])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	_S.define(_e, "shared", 0)
	_S.define(_e, "add", _S.function_value(_e, "_f4"))
	_S.define(_e, "glyphs", _S.merge([{"0": "zero"}, {"1": "one"}]))
	_S.set_prop(_S.read(_e, "glyphs"), "2", "two", "=", false)
	_S.define(_e, "map", _S.construct(_S.read(_e, "Map"), [[["null", null], ["zero", 0]]]))
	_S.define(_e, "numericKeys", _S.construct(_S.read(_e, "Map"), [[[_S.invoke(_S.read(_e, "Math"), "floor", [2.3]), "two"], [NAN, "nan"]]]))
	_S.define(_e, "loopKey", 0)
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), 2)):
		_S.write(_v14, "loopKey", 1, "+=", true)
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	return _S.merge([{"numberKeys": [_S.invoke(_S.read(_e, "numericKeys"), "get", [_S.read(_e, "loopKey")]), _S.invoke(_S.read(_e, "numericKeys"), "get", [NAN])]}, {"intrinsic": _S.call_value(_S.read(_e, "intrinsicArguments"), [])}, {"readonly": _S.call_value(_S.read(_e, "readonlyCallbacks"), [2])}, {"mutable": _S.call_value(_S.read(_e, "mutableCallbacks"), [])}, {"direct": _S.call_value(_S.read(_e, "directProbe"), [0.37])}, {"mapNumbers": [_S.binary("<", _S.relational_get(_S.read(_e, "map"), ["missing"]), 1), _S.binary("<", _S.relational_get(_S.read(_e, "map"), ["null"]), 1), _S.binary("<", _S.relational_get(_S.read(_e, "map"), ["zero"]), 1)]}, {"keys": _S.invoke(_S.read(_e, "Object"), "keys", [_S.read(_e, "glyphs")])}, {"glyph": _S.prop(_S.read(_e, "glyphs"), "1")}, {"xs": _S.read(_e, "xs")}, {"trace": _S.read(_e, "trace")}, {"iteration": _S.invoke(_S.read(_e, "callbacks"), "map", [_S.function_value(_e, "_f5")])}, {"shared": [_S.call_value(_S.read(_e, "add"), []), _S.call_value(_S.read(_e, "add"), []), _S.read(_e, "shared")]}])

static func _f3(_parent,_args:Array,_this=null):
	var _n_i = _S.read(_parent,"i")
	return _n_i
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.write(_e, "shared", 1, "+=", false)

static func _f5(_parent,_args:Array,_this=null):
	var _n_f_b0 = _S.arg(_args,0)
	return _S.call_value(_n_f_b0,[])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_inputs_b0 = [2, 8, 0.25, 99]
	var _n_value_b1 = _S.numeric_lerp(_S.invoke(_n_inputs_b0,"shift",[]),_S.invoke(_n_inputs_b0,"shift",[]),_S.invoke(_n_inputs_b0,"shift",[]))
	return [_n_value_b1, _n_inputs_b0]
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_input_b0 = _S.arg(_args,0)
	var _n_callbacks_b1 = []
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < 4)):
			_S.invoke(_n_callbacks_b1,"push",[_S.function_value(_S.capture(_parent,{"input":_n_input_b0,"i":_n_i_b4,"this":_this}),"_f8")])
			_n_i_b4 += 1.0
	var _object_0 = {"x":_n_input_b0}
	var _n_x_b2 = _S.named_value(_object_0,"x")
	var _n_y_b3 = _S.coalesce(_S.named_value(_object_0,"y"),func():return 3)
	return [_S.invoke(_n_callbacks_b1,"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f9")]), _S.invoke([_n_x_b2, _n_y_b3],"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f10")])]
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_input = _S.read(_parent,"input")
	var _n_i = _S.read(_parent,"i")
	return (_n_input + _n_i)
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_f_b0 = _S.arg(_args,0)
	return _S.call_value(_n_f_b0,[])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_v_b0 = _S.arg(_args,0)
	return (_n_v_b0 * 2)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "value", 1)
	_S.define(_e, "read", _S.function_value(_e, "_f12"))
	_S.write(_e, "value", 4, "=", false)
	_S.define(_e, "change", _S.function_value(_e, "_f13"))
	_S.call_value(_S.read(_e, "change"), [])
	return _S.call_value(_S.read(_e, "read"), [])

static func _f12(_parent,_args:Array,_this=null):
	var _n_value = _S.read(_parent,"value")
	return _n_value
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.write(_e, "value", 1, "+=", false)
