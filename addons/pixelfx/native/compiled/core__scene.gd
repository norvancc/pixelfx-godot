@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/scene.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "hex", _S.import_value("core/color.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/color.js", "mix"))
	_S.define(_e, "rand", _S.import_value("core/math.js", "rand"))
	_S.define(_e, "backdrop", _S.function_value(_e, "_f0"))
	_S.define(_e, "SKY", _S.call_value(_S.read(_e, "hex"), ["#15131d"]))
	_S.define(_e, "SKY_TOP", _S.call_value(_S.read(_e, "hex"), ["#0d0b14"]))
	_S.define(_e, "SKY_LOW", _S.call_value(_S.read(_e, "hex"), ["#221d33"]))
	_S.define(_e, "FLOOR_EDGE", _S.call_value(_S.read(_e, "hex"), ["#4a4263"]))
	_S.define(_e, "FLOOR", _S.call_value(_S.read(_e, "hex"), ["#2b2639"]))
	_S.define(_e, "FLOOR_DARK", _S.call_value(_S.read(_e, "hex"), ["#211d2d"]))
	_S.define(_e, "MORTAR", _S.call_value(_S.read(_e, "hex"), ["#1a1724"]))
	_S.define(_e, "BAYER", [0, 8, 2, 10, 12, 4, 14, 6, 3, 11, 1, 9, 15, 7, 13, 5])
	_S.define(_e, "BACKDROPS", ["dark", "ground", "sky", "light", "black"])
	_exports["BACKDROPS"] = _S.read(_e, "BACKDROPS")
	_exports["backdrop"] = _S.read(_e, "backdrop")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "kind", _S.arg(_args, 0))
	_S.define(_e, "w", _S.arg(_args, 1))
	_S.define(_e, "h", _S.arg(_args, 2))
	_S.define(_e, "groundY", _S.coalesce(_S.arg(_args, 3), func(): return _S.read(_e, "h")))
	_S.define(_e, "out", _S.construct(_S.read(_e, "Uint32Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "h"))]))
	if _S.truth(_S.binary("===", _S.read(_e, "kind"), "light")):
		return _S.invoke(_S.read(_e, "out"), "fill", [_S.call_value(_S.read(_e, "hex"), ["#ebe8f0"])])
	if _S.truth(_S.binary("===", _S.read(_e, "kind"), "black")):
		return _S.invoke(_S.read(_e, "out"), "fill", [_S.call_value(_S.read(_e, "hex"), ["#000000"])])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "y"), _S.read(_v0, "h"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "x"), _S.read(_v1, "w"))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "c", _S.read(_v2, "SKY"))
			if _S.truth(_S.binary("===", _S.read(_v2, "kind"), "sky")):
				var _v3 = _S.scope(_v2)
				_S.define(_v3, "t", _S.binary("/", _S.read(_v3, "y"), _S.invoke(_S.read(_v3, "Math"), "max", [1, _S.binary("-", _S.read(_v3, "h"), 1)])))
				_S.define(_v3, "step", _S.binary("|", _S.binary("+", _S.binary("*", _S.read(_v3, "t"), 5), _S.binary("/", _S.prop(_S.read(_v3, "BAYER"), _S.binary("|", _S.binary("<<", _S.binary("&", _S.read(_v3, "y"), 3), 2), _S.binary("&", _S.read(_v3, "x"), 3))), 16)), 0))
				_S.write(_v3, "c", _S.call_value(_S.read(_v3, "mix"), [_S.read(_v3, "SKY_TOP"), _S.read(_v3, "SKY_LOW"), _S.invoke(_S.read(_v3, "Math"), "min", [1, _S.binary("/", _S.read(_v3, "step"), 4)])]), "=", false)
				_S.define(_v3, "r", _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "x"), _S.read(_v3, "y"), 77]))
				if _S.truth(_S.binary(">", _S.read(_v3, "r"), 0.994)):
					_S.write(_v3, "c", _S.call_value(_S.read(_v3, "mix"), [_S.read(_v3, "c"), _S.call_value(_S.read(_v3, "hex"), ["#cfc8ff"]), _S.binary("+", 0.35, _S.binary("*", _S.binary("-", _S.read(_v3, "r"), 0.994), 90))]), "=", false)
			if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v2, "kind"), "ground"), func(): return _S.binary(">=", _S.read(_v2, "y"), _S.read(_v2, "groundY")))):
				var _v4 = _S.scope(_v2)
				_S.define(_v4, "gy", _S.binary("-", _S.read(_v4, "y"), _S.read(_v4, "groundY")))
				if _S.truth(_S.binary("===", _S.read(_v4, "gy"), 0)):
					_S.write(_v4, "c", _S.read(_v4, "FLOOR_EDGE"), "=", false)
				else:
					var _v5 = _S.scope(_v4)
					_S.define(_v5, "row", _S.invoke(_S.read(_v5, "Math"), "floor", [_S.binary("/", _S.binary("-", _S.read(_v5, "gy"), 1), 5)]))
					_S.define(_v5, "off", (6 if _S.truth(_S.binary("%", _S.read(_v5, "row"), 2)) else 0))
					_S.define(_v5, "mortar", _S.logical("||", _S.binary("===", _S.binary("%", _S.binary("-", _S.read(_v5, "gy"), 1), 5), 4), func(): return _S.binary("===", _S.binary("%", _S.binary("+", _S.read(_v5, "x"), _S.read(_v5, "off")), 12), 0)))
					_S.write(_v5, "c", (_S.read(_v5, "MORTAR") if _S.truth(_S.read(_v5, "mortar")) else (_S.read(_v5, "FLOOR") if _S.truth(_S.binary("<", _S.read(_v5, "gy"), 3)) else _S.read(_v5, "FLOOR_DARK"))), "=", false)
			_S.set_prop(_S.read(_v2, "out"), _S.binary("+", _S.binary("*", _S.read(_v2, "y"), _S.read(_v2, "w")), _S.read(_v2, "x")), _S.read(_v2, "c"), "=", false)
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "x", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	return _S.read(_e, "out")
