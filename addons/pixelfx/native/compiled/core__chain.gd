@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/chain.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "createFx", _S.import_value("core/fx.js", "createFx"))
	_S.define(_e, "chain", _S.function_value(_e, "_f0"))
	_exports["chain"] = _S.read(_e, "chain")
	_S.define(_e, "shiftKeys", _S.function_value(_e, "_f8"))
	_exports["shiftKeys"] = _S.read(_e, "shiftKeys")
	_S.define(_e, "shiftHits", _S.function_value(_e, "_f10"))
	_exports["shiftHits"] = _S.read(_e, "shiftHits")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "cues", _S.arg(_args, 0))
	return _S.function_value(_e, "_f1")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "list", _S.invoke(_S.read(_e, "cues"), "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "at", _S.function_value(_e, "_f3"))
	_S.define(_e, "each", _S.function_value(_e, "_f4"))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v0 = _S.arg(_args, 0)
	_S.define(_e, "fx", _S.prop(_v0, "fx"))
	_S.define(_e, "t", _S.prop(_v0, "t"))
	_S.define(_e, "until", _S.prop(_v0, "until"))
	_S.define(_e, "x", _S.prop(_v0, "x"))
	_S.define(_e, "y", _S.prop(_v0, "y"))
	_S.define(_e, "flip", _S.prop(_v0, "flip"))
	_S.define(_e, "opts", _S.omit(_v0, ["fx","t","until","x","y","flip"]))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"fx": _S.read(_e, "fx")}, {"t": _S.logical("??", _S.read(_e, "t"), func(): return 0)}, {"until": _S.logical("??", _S.read(_e, "until"), func(): return INF)}, {"x": _S.logical("??", _S.read(_e, "x"), func(): return 0)}, {"y": _S.logical("??", _S.read(_e, "y"), func(): return 0)}, {"flip": _S.unary("!", _S.unary("!", _S.read(_e, "flip")))}, {"opts": _S.merge([_S.read(_e, "opts"), {"seed": _S.binary("+", _S.logical("??", _S.prop(_S.read(_e, "o"), "seed"), func(): return 1), _S.read(_e, "i"))}])}, {"inst": null}, {"over": false}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return (_S.call_value(_S.read(_e, "v"), [_S.read(_e, "t")]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_e, "v")), "function")) else _S.read(_e, "v"))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "layer", _S.arg(_args, 1))
	var _v1 = _S.read(_e, "p")
	_S.define(_e, "frame", _S.prop(_v1, "frame"))
	_S.define(_e, "tx", _S.prop(_v1, "tx"))
	_S.define(_e, "ty", _S.prop(_v1, "ty"))
	_S.define(_e, "sign", _S.prop(_v1, "fx"))
	_S.define(_e, "cs", _S.prop(_v1, "cs"))
	_S.define(_e, "sn", _S.prop(_v1, "sn"))
	_S.define(_e, "fade", _S.prop(_v1, "fade"))
	_S.define(_e, "lightK", _S.prop(_v1, "lightK"))
	for _v2 in _S.array(_S.read(_e, "list")):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "c", _v2)
		var _v4 = _S.scope(_v3)
		if _S.truth(_S.logical("||", _S.unary("!", _S.prop(_S.read(_v4, "c"), "inst")), func(): return _S.prop(_S.read(_v4, "c"), "over"))):
			continue
		_S.set_prop(_S.prop(_S.prop(_S.read(_v4, "c"), "inst"), "options"), "x", _S.binary("+", _S.read(_v4, "tx"), _S.binary("*", _S.read(_v4, "sign"), _S.call_value(_S.read(_v4, "at"), [_S.prop(_S.read(_v4, "c"), "x")]))), "=", false)
		_S.set_prop(_S.prop(_S.prop(_S.read(_v4, "c"), "inst"), "options"), "y", _S.binary("+", _S.read(_v4, "ty"), _S.call_value(_S.read(_v4, "at"), [_S.prop(_S.read(_v4, "c"), "y")])), "=", false)
		_S.set_prop(_S.prop(_S.prop(_S.read(_v4, "c"), "inst"), "options"), "flip", _S.binary("!==", _S.binary("<", _S.read(_v4, "sign"), 0), _S.prop(_S.read(_v4, "c"), "flip")), "=", false)
		_S.invoke(_S.prop(_S.read(_v4, "c"), "inst"), "draw", [_S.read(_v4, "frame"), _S.read(_v4, "layer")])
	_S.invoke(_S.read(_e, "Object"), "assign", [_S.read(_e, "p"), _S.merge([{"tx": _S.read(_e, "tx")}, {"ty": _S.read(_e, "ty")}, {"fx": _S.read(_e, "sign")}, {"cs": _S.read(_e, "cs")}, {"sn": _S.read(_e, "sn")}, {"fade": _S.read(_e, "fade")}, {"lightK": _S.read(_e, "lightK")}])])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v5 in _S.array(_S.read(_e, "list")):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "c", _v5)
		var _v7 = _S.scope(_v6)
		if _S.truth(_S.logical("||", _S.prop(_S.read(_v7, "c"), "over"), func(): return _S.binary("<", _S.read(_v7, "t"), _S.prop(_S.read(_v7, "c"), "t")))):
			continue
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v7, "c"), "inst"))):
			_S.set_prop(_S.read(_v7, "c"), "inst", _S.call_value(_S.read(_v7, "createFx"), [_S.prop(_S.read(_v7, "c"), "fx"), _S.prop(_S.read(_v7, "c"), "opts")]), "=", false)
		else:
			_S.invoke(_S.prop(_S.read(_v7, "c"), "inst"), "update", [_S.read(_v7, "dt")])
		if _S.truth(_S.logical("||", _S.binary(">=", _S.read(_v7, "t"), _S.prop(_S.read(_v7, "c"), "until")), func(): return _S.logical("&&", _S.invoke(_S.prop(_S.read(_v7, "c"), "inst"), "done", []), func(): return _S.unary("!", _S.prop(_S.prop(_S.prop(_S.read(_v7, "c"), "fx"), "meta"), "loop"))))):
			_S.set_prop(_S.read(_v7, "c"), "over", true, "=", false)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "each"), [_S.read(_e, "p"), "back"])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "each"), [_S.read(_e, "p"), "front"])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "keys", _S.arg(_args, 0))
	_S.define(_e, "dt", _S.arg(_args, 1))
	var _v8 = _S.coalesce(_S.arg(_args, 2), func(): return _S.merge([]))
	_S.define(_e, "dx", _S.coalesce(_S.prop(_v8, "dx"), func(): return 0))
	_S.define(_e, "over", _S.omit(_v8, ["dx"]))
	return _S.invoke(_S.read(_e, "keys"), "map", [_S.function_value(_e, "_f9")])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v9 = _S.arg(_args, 0)
	_S.define(_e, "t", _S.prop(_v9, 0))
	_S.define(_e, "pose", _S.prop(_v9, 1))
	_S.define(_e, "how", _S.prop(_v9, 2))
	return [_S.binary("+", _S.read(_e, "t"), _S.read(_e, "dt")), _S.merge([_S.read(_e, "pose"), _S.read(_e, "over"), {"x": _S.binary("+", _S.logical("??", _S.prop(_S.read(_e, "pose"), "x"), func(): return 0), _S.read(_e, "dx"))}]), _S.read(_e, "how")]

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "hits", _S.arg(_args, 0))
	_S.define(_e, "dt", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "hits"), "map", [_S.function_value(_e, "_f11")])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "h", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "h"), {"t": _S.binary("+", _S.prop(_S.read(_e, "h"), "t"), _S.read(_e, "dt"))}])
