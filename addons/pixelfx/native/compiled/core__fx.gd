@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/fx.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Painter", _S.import_value("core/painter.js", "Painter"))
	_S.define(_e, "clamp", _S.import_value("core/math.js", "clamp"))
	_S.define(_e, "stockActor", _S.import_value("core/actor.js", "stockActor"))
	_S.define(_e, "fit", _S.import_value("core/color.js", "fit"))
	_S.define(_e, "toHex", _S.import_value("core/color.js", "toHex"))
	_S.define(_e, "createFrame", _S.function_value(_e, "_f0"))
	_S.define(_e, "clearFrame", _S.function_value(_e, "_f1"))
	_S.define(_e, "painterFor", _S.function_value(_e, "_f2"))
	_S.define(_e, "resolveOptions", _S.function_value(_e, "_f3"))
	_S.define(_e, "createFx", _S.function_value(_e, "_f4"))
	_S.define(_e, "composite", _S.function_value(_e, "_f10"))
	_exports["createFrame"] = _S.read(_e, "createFrame")
	_exports["clearFrame"] = _S.read(_e, "clearFrame")
	_S.define(_e, "painters", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["painterFor"] = _S.read(_e, "painterFor")
	_S.define(_e, "FADE", 0.3)
	_S.define(_e, "isRamp", _S.function_value(_e, "_f11"))
	_exports["resolveOptions"] = _S.read(_e, "resolveOptions")
	_exports["createFx"] = _S.read(_e, "createFx")
	_exports["composite"] = _S.read(_e, "composite")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "w", _S.arg(_args, 0))
	_S.define(_e, "h", _S.arg(_args, 1))
	_S.define(_e, "ox", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "oy", _S.coalesce(_S.arg(_args, 3), func(): return 0))
	return _S.merge([{"w": _S.read(_e, "w")}, {"h": _S.read(_e, "h")}, {"ox": _S.read(_e, "ox")}, {"oy": _S.read(_e, "oy")}, {"color": _S.construct(_S.read(_e, "Uint32Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "h"))])}, {"light": _S.construct(_S.read(_e, "Uint32Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "h"))])}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "f", _S.arg(_args, 0))
	_S.invoke(_S.prop(_S.read(_e, "f"), "color"), "fill", [0])
	_S.invoke(_S.prop(_S.read(_e, "f"), "light"), "fill", [0])
	return _S.read(_e, "f")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "frame", _S.arg(_args, 0))
	_S.define(_e, "p", _S.invoke(_S.read(_e, "painters"), "get", [_S.read(_e, "frame")]))
	if _S.truth(_S.unary("!", _S.read(_e, "p"))):
		_S.invoke(_S.read(_e, "painters"), "set", [_S.read(_e, "frame"), _S.write(_e, "p", _S.construct(_S.read(_e, "Painter"), [_S.read(_e, "frame")]), "=", false)])
	return _S.invoke(_S.read(_e, "p"), "reset", [])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "meta", _S.arg(_args, 0))
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 1), func(): return _S.merge([])))
	_S.define(_e, "opts", _S.merge([_S.logical("??", _S.prop(_S.read(_e, "meta"), "options"), func(): return _S.merge([])), _S.read(_e, "o")]))
	for _v0 in _S.array(_S.invoke(_S.read(_e, "Object"), "entries", [_S.logical("??", _S.prop(_S.read(_e, "meta"), "options"), func(): return _S.merge([]))])):
		var _v1 = _S.scope(_e)
		var _v2 = _v0
		_S.define(_v1, "k", _S.prop(_v2, 0))
		_S.define(_v1, "def", _S.prop(_v2, 1))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.call_value(_S.read(_v1, "isRamp"), [_S.read(_v1, "def")]), func(): return _S.call_value(_S.read(_v1, "isRamp"), [_S.prop(_S.read(_v1, "o"), _S.read(_v1, "k"))])), func(): return _S.binary("!==", _S.prop(_S.prop(_S.read(_v1, "o"), _S.read(_v1, "k")), "length"), _S.prop(_S.read(_v1, "def"), "length")))):
			_S.set_prop(_S.read(_v1, "opts"), _S.read(_v1, "k"), _S.invoke(_S.call_value(_S.read(_v1, "fit"), [_S.prop(_S.read(_v1, "o"), _S.read(_v1, "k")), _S.prop(_S.read(_v1, "def"), "length")]), "map", [_S.read(_v1, "toHex")]), "=", false)
	if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "meta"), "actor"), func(): return _S.unary("!", _S.prop(_S.read(_e, "opts"), "actor")))):
		_S.set_prop(_S.read(_e, "opts"), "actor", _S.call_value(_S.read(_e, "stockActor"), [(2 if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "meta"), "actor"), 2)) else 1)]), "=", false)
	return _S.read(_e, "opts")

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "mod", _S.arg(_args, 0))
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 1), func(): return _S.merge([])))
	_S.define(_e, "meta", _S.logical("??", _S.prop(_S.read(_e, "mod"), "meta"), func(): return _S.merge([])))
	_S.define(_e, "opts", _S.call_value(_S.read(_e, "resolveOptions"), [_S.read(_e, "meta"), _S.read(_e, "o")]))
	_S.define(_e, "impl", (_S.invoke(_S.read(_e, "mod"), "create", [_S.read(_e, "opts")]) if _S.truth(_S.prop(_S.read(_e, "mod"), "create")) else _S.read(_e, "mod")))
	_S.define(_e, "D", _S.logical("??", _S.prop(_S.read(_e, "meta"), "duration"), func(): return 1))
	_S.define(_e, "t", 0)
	_S.define(_e, "stopAt", INF)
	return _S.merge([{"meta": _S.read(_e, "meta")}, {"options": _S.read(_e, "opts")}, {"__getters": {"t": _S.function_value(_e, "_f5")}}, {"update": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}, {"stop": _S.function_value(_e, "_f8")}, {"done": _S.function_value(_e, "_f9")}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.read(_e, "t")

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "impl"), "update"))):
		return null
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "max", [1, _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("-", _S.binary("*", _S.read(_e, "dt"), 120), 1e-9)])]))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), _S.read(_v3, "n"))):
		_S.invoke(_S.read(_v3, "impl"), "update", [_S.binary("/", _S.read(_v3, "dt"), _S.read(_v3, "n")), _S.read(_v3, "opts")])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "frame", _S.arg(_args, 0))
	_S.define(_e, "layer", _S.arg(_args, 1))
	_S.define(_e, "p", _S.call_value(_S.read(_e, "painterFor"), [_S.read(_e, "frame")]))
	_S.invoke(_S.read(_e, "p"), "place", [_S.logical("??", _S.prop(_S.read(_e, "opts"), "x"), func(): return 0), _S.logical("??", _S.prop(_S.read(_e, "opts"), "y"), func(): return 0), _S.unary("!", _S.unary("!", _S.prop(_S.read(_e, "opts"), "flip"))), _S.logical("??", _S.prop(_S.read(_e, "opts"), "angle"), func(): return 0)])
	_S.set_prop(_S.read(_e, "p"), "fade", (1 if _S.truth(_S.binary("===", _S.read(_e, "stopAt"), INF)) else _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "stopAt")), _S.read(_e, "FADE")))])), "=", false)
	_S.set_prop(_S.read(_e, "p"), "lightK", _S.logical("??", _S.prop(_S.read(_e, "opts"), "light"), func(): return 1), "=", false)
	_S.define(_e, "tt", (_S.binary("%", _S.read(_e, "t"), _S.read(_e, "D")) if _S.truth(_S.prop(_S.read(_e, "meta"), "loop")) else _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "t"), _S.read(_e, "D")])))
	if _S.truth(_S.logical("&&", _S.binary("!==", _S.read(_e, "layer"), "front"), func(): return _S.prop(_S.read(_e, "impl"), "drawBack"))):
		var _v4 = _S.scope(_e)
		_S.set_prop(_S.read(_v4, "p"), "layer", "back", "=", false)
		_S.invoke(_S.read(_v4, "impl"), "drawBack", [_S.read(_v4, "p"), _S.read(_v4, "tt"), _S.read(_v4, "opts")])
	if _S.truth(_S.binary("!==", _S.read(_e, "layer"), "back")):
		var _v5 = _S.scope(_e)
		_S.set_prop(_S.read(_v5, "p"), "layer", "front", "=", false)
		_S.invoke(_S.read(_v5, "impl"), "draw", [_S.read(_v5, "p"), _S.read(_v5, "tt"), _S.read(_v5, "opts")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	if _S.truth(_S.binary("===", _S.read(_e, "stopAt"), INF)):
		_S.write(_e, "stopAt", _S.read(_e, "t"), "=", false)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.logical("||", _S.binary(">=", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "stopAt")), _S.read(_e, "FADE")), func(): return _S.logical("&&", _S.unary("!", _S.prop(_S.read(_e, "meta"), "loop")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "D"))))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "f", _S.arg(_args, 0))
	_S.define(_e, "out", _S.arg(_args, 1))
	_S.define(_e, "bg", _S.coalesce(_S.arg(_args, 2), func(): return null))
	_S.define(_e, "lightK", _S.coalesce(_S.arg(_args, 3), func(): return 1))
	_S.define(_e, "n", _S.binary("*", _S.prop(_S.read(_e, "f"), "w"), _S.prop(_S.read(_e, "f"), "h")))
	_S.define(_e, "C", _S.prop(_S.read(_e, "f"), "color"))
	_S.define(_e, "L", _S.prop(_S.read(_e, "f"), "light"))
	_S.define(_e, "flat", _S.binary("===", _S.unary("typeof", _S.read(_e, "bg")), "number"))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), _S.read(_v6, "n"))):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "c", _S.prop(_S.read(_v7, "C"), _S.read(_v7, "i")))
		_S.define(_v7, "l", _S.binary("&", _S.prop(_S.read(_v7, "L"), _S.read(_v7, "i")), 16777215))
		_S.define(_v7, "r", null)
		_S.define(_v7, "g", null)
		_S.define(_v7, "b", null)
		_S.define(_v7, "a", null)
		_S.define(_v7, "ca", _S.binary(">>>", _S.read(_v7, "c"), 24))
		if _S.truth(_S.binary("===", _S.read(_v7, "ca"), 255)):
			var _v8 = _S.scope(_v7)
			_S.write(_v8, "r", _S.binary("&", _S.read(_v8, "c"), 255), "=", false)
			_S.write(_v8, "g", _S.binary("&", _S.binary(">>>", _S.read(_v8, "c"), 8), 255), "=", false)
			_S.write(_v8, "b", _S.binary("&", _S.binary(">>>", _S.read(_v8, "c"), 16), 255), "=", false)
			_S.write(_v8, "a", 255, "=", false)
		else:
			if _S.truth(_S.binary("===", _S.read(_v7, "bg"), null)):
				var _v9 = _S.scope(_v7)
				_S.write(_v9, "r", _S.binary("&", _S.read(_v9, "c"), 255), "=", false)
				_S.write(_v9, "g", _S.binary("&", _S.binary(">>>", _S.read(_v9, "c"), 8), 255), "=", false)
				_S.write(_v9, "b", _S.binary("&", _S.binary(">>>", _S.read(_v9, "c"), 16), 255), "=", false)
				_S.write(_v9, "a", _S.read(_v9, "ca"), "=", false)
			else:
				var _v10 = _S.scope(_v7)
				_S.define(_v10, "k", (_S.read(_v10, "bg") if _S.truth(_S.read(_v10, "flat")) else _S.prop(_S.read(_v10, "bg"), _S.read(_v10, "i"))))
				_S.define(_v10, "f", _S.binary("/", _S.read(_v10, "ca"), 255))
				_S.write(_v10, "r", _S.binary("+", _S.binary("*", _S.binary("&", _S.read(_v10, "c"), 255), _S.read(_v10, "f")), _S.binary("*", _S.binary("&", _S.read(_v10, "k"), 255), _S.binary("-", 1, _S.read(_v10, "f")))), "=", false)
				_S.write(_v10, "g", _S.binary("+", _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v10, "c"), 8), 255), _S.read(_v10, "f")), _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v10, "k"), 8), 255), _S.binary("-", 1, _S.read(_v10, "f")))), "=", false)
				_S.write(_v10, "b", _S.binary("+", _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v10, "c"), 16), 255), _S.read(_v10, "f")), _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v10, "k"), 16), 255), _S.binary("-", 1, _S.read(_v10, "f")))), "=", false)
				_S.write(_v10, "a", 255, "=", false)
		if _S.truth(_S.read(_v7, "l")):
			var _v11 = _S.scope(_v7)
			_S.define(_v11, "lr", _S.binary("*", _S.binary("&", _S.read(_v11, "l"), 255), _S.read(_v11, "lightK")))
			_S.define(_v11, "lg", _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v11, "l"), 8), 255), _S.read(_v11, "lightK")))
			_S.define(_v11, "lb", _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v11, "l"), 16), 255), _S.read(_v11, "lightK")))
			if _S.truth(_S.binary("<", _S.read(_v11, "a"), 255)):
				var _v12 = _S.scope(_v11)
				_S.define(_v12, "pa", _S.binary("/", _S.read(_v12, "a"), 255))
				_S.define(_v12, "pr", _S.binary("+", _S.binary("*", _S.read(_v12, "r"), _S.read(_v12, "pa")), _S.read(_v12, "lr")))
				_S.define(_v12, "pg", _S.binary("+", _S.binary("*", _S.read(_v12, "g"), _S.read(_v12, "pa")), _S.read(_v12, "lg")))
				_S.define(_v12, "pb", _S.binary("+", _S.binary("*", _S.read(_v12, "b"), _S.read(_v12, "pa")), _S.read(_v12, "lb")))
				_S.define(_v12, "na", _S.invoke(_S.read(_v12, "Math"), "min", [1, _S.invoke(_S.read(_v12, "Math"), "max", [_S.read(_v12, "pa"), _S.binary("/", _S.invoke(_S.read(_v12, "Math"), "max", [_S.read(_v12, "lr"), _S.read(_v12, "lg"), _S.read(_v12, "lb")]), 255)])]))
				if _S.truth(_S.binary(">", _S.read(_v12, "na"), 0)):
					var _v13 = _S.scope(_v12)
					_S.write(_v13, "r", _S.invoke(_S.read(_v13, "Math"), "min", [255, _S.binary("/", _S.read(_v13, "pr"), _S.read(_v13, "na"))]), "=", false)
					_S.write(_v13, "g", _S.invoke(_S.read(_v13, "Math"), "min", [255, _S.binary("/", _S.read(_v13, "pg"), _S.read(_v13, "na"))]), "=", false)
					_S.write(_v13, "b", _S.invoke(_S.read(_v13, "Math"), "min", [255, _S.binary("/", _S.read(_v13, "pb"), _S.read(_v13, "na"))]), "=", false)
					_S.write(_v13, "a", _S.binary("*", _S.read(_v13, "na"), 255), "=", false)
			else:
				var _v14 = _S.scope(_v11)
				_S.write(_v14, "r", _S.invoke(_S.read(_v14, "Math"), "min", [255, _S.binary("+", _S.read(_v14, "r"), _S.read(_v14, "lr"))]), "=", false)
				_S.write(_v14, "g", _S.invoke(_S.read(_v14, "Math"), "min", [255, _S.binary("+", _S.read(_v14, "g"), _S.read(_v14, "lg"))]), "=", false)
				_S.write(_v14, "b", _S.invoke(_S.read(_v14, "Math"), "min", [255, _S.binary("+", _S.read(_v14, "b"), _S.read(_v14, "lb"))]), "=", false)
		_S.define(_v7, "j", _S.binary("*", _S.read(_v7, "i"), 4))
		_S.set_prop(_S.read(_v7, "out"), _S.read(_v7, "j"), _S.read(_v7, "r"), "=", false)
		_S.set_prop(_S.read(_v7, "out"), _S.binary("+", _S.read(_v7, "j"), 1), _S.read(_v7, "g"), "=", false)
		_S.set_prop(_S.read(_v7, "out"), _S.binary("+", _S.read(_v7, "j"), 2), _S.read(_v7, "b"), "=", false)
		_S.set_prop(_S.read(_v7, "out"), _S.binary("+", _S.read(_v7, "j"), 3), _S.read(_v7, "a"), "=", false)
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return _S.logical("&&", _S.logical("&&", _S.invoke(_S.read(_e, "Array"), "isArray", [_S.read(_e, "v")]), func(): return _S.binary(">", _S.prop(_S.read(_e, "v"), "length"), 0)), func(): return _S.invoke(_S.read(_e, "v"), "every", [_S.function_value(_e, "_f12")]))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.logical("||", _S.binary("===", _S.unary("typeof", _S.read(_e, "c")), "number"), func(): return _S.invoke(_S.regex("^#[0-9a-f]{3,8}$", "i"), "test", [_S.read(_e, "c")]))
