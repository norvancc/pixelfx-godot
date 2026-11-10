@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "bodyOf", _S.function_value(_e, "_f0"))
	_S.define(_e, "rimOf", _S.function_value(_e, "_f3"))
	_exports["bodyOf"] = _S.read(_e, "bodyOf")
	_exports["rimOf"] = _S.read(_e, "rimOf")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "actor", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "m", _S.prop(_S.read(_e, "actor"), "mask"))
	_S.define(_e, "px", _S.prop(_S.read(_e, "actor"), "pixels"))
	_S.define(_e, "list", [])
	_S.define(_e, "cells", _S.invoke(_S.construct(_S.read(_e, "Array"), [_S.binary("*", _S.prop(_S.read(_e, "m"), "w"), _S.prop(_S.read(_e, "m"), "h"))]), "fill", [null]))
	_S.define(_e, "on", _S.function_value(_e, "_f1"))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "my", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "my"), _S.prop(_S.read(_v0, "m"), "h"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "mx", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "mx"), _S.prop(_S.read(_v1, "m"), "w"))):
			var _v2 = _S.scope(_v1)
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "mx"), _S.read(_v2, "my")]))):
				_v1 = _S.iteration(_v1)
				_S.write(_v1, "mx", 1, "+=", true)
				continue
			_S.define(_v2, "own", _S.prop(_S.read(_v2, "px"), _S.binary("+", _S.binary("*", _S.read(_v2, "my"), _S.prop(_S.read(_v2, "m"), "w")), _S.read(_v2, "mx"))))
			_S.define(_v2, "c", (_S.call_value(_S.read(_v2, "hex"), [_S.read(_v2, "own")]) if _S.truth(_S.read(_v2, "own")) else _S.prop(_S.read(_v2, "C"), _S.invoke(_S.read(_v2, "Math"), "max", [1, _S.invoke(_S.read(_v2, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_v2, "C"), "length"), 2), _S.invoke(_S.read(_v2, "Math"), "round", [_S.binary("*", _S.binary("-", _S.prop(_S.read(_v2, "C"), "length"), 2), _S.binary("-", 0.85, _S.binary("*", _S.binary("/", _S.read(_v2, "my"), _S.prop(_S.read(_v2, "m"), "h")), 0.5)))])])]))))
			_S.define(_v2, "b", _S.merge([{"x": _S.binary("+", _S.prop(_S.read(_v2, "actor"), "x"), _S.read(_v2, "mx"))}, {"y": _S.binary("+", _S.prop(_S.read(_v2, "actor"), "y"), _S.read(_v2, "my"))}, {"mx": _S.read(_v2, "mx")}, {"my": _S.read(_v2, "my")}, {"c": _S.read(_v2, "c")}, {"edge": _S.logical("||", _S.logical("||", _S.logical("||", _S.unary("!", _S.call_value(_S.read(_v2, "on"), [_S.binary("-", _S.read(_v2, "mx"), 1), _S.read(_v2, "my")])), func(): return _S.unary("!", _S.call_value(_S.read(_v2, "on"), [_S.binary("+", _S.read(_v2, "mx"), 1), _S.read(_v2, "my")]))), func(): return _S.unary("!", _S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "mx"), _S.binary("-", _S.read(_v2, "my"), 1)]))), func(): return _S.unary("!", _S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "mx"), _S.binary("+", _S.read(_v2, "my"), 1)])))}]))
			_S.invoke(_S.read(_v2, "list"), "push", [_S.read(_v2, "b")])
			_S.set_prop(_S.read(_v2, "cells"), _S.binary("+", _S.binary("*", _S.read(_v2, "my"), _S.prop(_S.read(_v2, "m"), "w")), _S.read(_v2, "mx")), _S.read(_v2, "b"), "=", false)
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "mx", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "my", 1, "+=", true)
	return _S.merge([{"list": _S.read(_e, "list")}, {"w": _S.prop(_S.read(_e, "m"), "w")}, {"h": _S.prop(_S.read(_e, "m"), "h")}, {"x": _S.prop(_S.read(_e, "actor"), "x")}, {"y": _S.prop(_S.read(_e, "actor"), "y")}, {"on": _S.read(_e, "on")}, {"cell": _S.function_value(_e, "_f2")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_m = _S.read(_parent,"m")
	var _n_mx_b0 = _S.arg(_args,0)
	var _n_my_b1 = _S.arg(_args,1)
	return (not _S.truth(not _S.truth(_S.index_value(_S.named_value(_n_m,"data"),((_n_my_b1 * _S.named_value(_n_m,"w")) + _n_mx_b0)))) if _S.truth(((_n_my_b1 < _S.named_value(_n_m,"h")) if _S.truth(((_n_mx_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_my_b1 >= 0) if _S.truth((_n_mx_b0 >= 0)) else (_n_mx_b0 >= 0))) else ((_n_my_b1 >= 0) if _S.truth((_n_mx_b0 >= 0)) else (_n_mx_b0 >= 0)))) else ((_n_mx_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_my_b1 >= 0) if _S.truth((_n_mx_b0 >= 0)) else (_n_mx_b0 >= 0))) else ((_n_my_b1 >= 0) if _S.truth((_n_mx_b0 >= 0)) else (_n_mx_b0 >= 0))))) else ((_n_my_b1 < _S.named_value(_n_m,"h")) if _S.truth(((_n_mx_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_my_b1 >= 0) if _S.truth((_n_mx_b0 >= 0)) else (_n_mx_b0 >= 0))) else ((_n_my_b1 >= 0) if _S.truth((_n_mx_b0 >= 0)) else (_n_mx_b0 >= 0)))) else ((_n_mx_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_my_b1 >= 0) if _S.truth((_n_mx_b0 >= 0)) else (_n_mx_b0 >= 0))) else ((_n_my_b1 >= 0) if _S.truth((_n_mx_b0 >= 0)) else (_n_mx_b0 >= 0)))))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_cells = _S.read(_parent,"cells")
	var _n_m = _S.read(_parent,"m")
	var _n_on = _S.read(_parent,"on")
	var _n_mx_b0 = _S.arg(_args,0)
	var _n_my_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_cells,((_n_my_b1 * _S.named_value(_n_m,"w")) + _n_mx_b0)) if _S.truth(_S.call_value(_n_on,[_n_mx_b0, _n_my_b1])) else null)
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_body_b0 = _S.arg(_args,0)
	var _n_out_b1 = []
	if true:
		var _n_my_b2 = (-1)
		while _S.truth((_n_my_b2 <= _S.named_value(_n_body_b0,"h"))):
			if true:
				var _n_mx_b3 = (-1)
				while _S.truth((_n_mx_b3 <= _S.named_value(_n_body_b0,"w"))):
					if _S.truth(_S.logical("&&",not _S.truth(_S.invoke(_n_body_b0,"on",[_n_mx_b3, _n_my_b2])),func():return _S.logical("||",_S.logical("||",_S.logical("||",_S.invoke(_n_body_b0,"on",[(_n_mx_b3 - 1), _n_my_b2]),func():return _S.invoke(_n_body_b0,"on",[(_n_mx_b3 + 1), _n_my_b2])),func():return _S.invoke(_n_body_b0,"on",[_n_mx_b3, (_n_my_b2 - 1)])),func():return _S.invoke(_n_body_b0,"on",[_n_mx_b3, (_n_my_b2 + 1)])))):
						_S.invoke(_n_out_b1,"push",[{"x":(_S.named_value(_n_body_b0,"x") + _n_mx_b3),"y":(_S.named_value(_n_body_b0,"y") + _n_my_b2),"mx":_n_mx_b3,"my":_n_my_b2}])
					_n_mx_b3 += 1.0
			_n_my_b2 += 1.0
	return _n_out_b1
	return null
