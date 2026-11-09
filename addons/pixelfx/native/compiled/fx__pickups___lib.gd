@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "createFrame", _S.import_value("core/index.js", "createFrame"))
	_S.define(_e, "Painter", _S.import_value("core/index.js", "Painter"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "ramp", _S.import_value("core/index.js", "ramp"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "fit", _S.function_value(_e, "_f0"))
	_S.define(_e, "shadow", _S.function_value(_e, "_f2"))
	_S.define(_e, "twinkle", _S.function_value(_e, "_f3"))
	_S.define(_e, "pillow", _S.function_value(_e, "_f4"))
	_S.define(_e, "heartSdf", _S.function_value(_e, "_f6"))
	_S.define(_e, "blobShadow", _S.function_value(_e, "_f7"))
	_S.define(_e, "glint", _S.function_value(_e, "_f8"))
	_S.define(_e, "pool", _S.function_value(_e, "_f9"))
	_S.define(_e, "coin", _S.function_value(_e, "_f11"))
	_S.define(_e, "gemlet", _S.function_value(_e, "_f13"))
	_S.define(_e, "brilliant", _S.function_value(_e, "_f15"))
	_S.define(_e, "prism", _S.function_value(_e, "_f16"))
	_S.define(_e, "drawGem", _S.function_value(_e, "_f17"))
	_S.define(_e, "coin3d", _S.function_value(_e, "_f21"))
	_exports["fit"] = _S.read(_e, "fit")
	_S.define(_e, "Layer", _S.class_value("Layer", _S.function_value(_e, "_f23"), {"begin": _S.function_value(_e, "_f24"), "idx": _S.function_value(_e, "_f25"), "get": _S.function_value(_e, "_f26"), "set": _S.function_value(_e, "_f27"), "fill": _S.function_value(_e, "_f28"), "outline": _S.function_value(_e, "_f29"), "map": _S.function_value(_e, "_f30"), "draw": _S.function_value(_e, "_f31")}, {}, {}, null))
	_exports["Layer"] = _S.read(_e, "Layer")
	_S.define(_e, "SHADOW", _S.call_value(_S.read(_e, "hex"), ["#100e17"]))
	_exports["shadow"] = _S.read(_e, "shadow")
	_exports["twinkle"] = _S.read(_e, "twinkle")
	_S.define(_e, "bob", _S.function_value(_e, "_f32"))
	_exports["bob"] = _S.read(_e, "bob")
	_exports["pillow"] = _S.read(_e, "pillow")
	_exports["heartSdf"] = _S.read(_e, "heartSdf")
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#0b0814"]))
	_exports["blobShadow"] = _S.read(_e, "blobShadow")
	_exports["glint"] = _S.read(_e, "glint")
	_exports["pool"] = _S.read(_e, "pool")
	_exports["coin"] = _S.read(_e, "coin")
	_exports["gemlet"] = _S.read(_e, "gemlet")
	_exports["brilliant"] = _S.read(_e, "brilliant")
	_exports["prism"] = _S.read(_e, "prism")
	_exports["drawGem"] = _S.read(_e, "drawGem")
	_exports["coin3d"] = _S.read(_e, "coin3d")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "palette", _S.arg(_args, 0))
	_S.define(_e, "n", _S.coalesce(_S.arg(_args, 1), func(): return 8))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "ramp"), [_S.read(_e, "palette")]))
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "r"), "length"))):
		return _S.invoke(_S.call_value(_S.read(_e, "Array"), [_S.read(_e, "n")]), "fill", [_S.read(_e, "WHITE")])
	if _S.truth(_S.binary(">=", _S.prop(_S.read(_e, "r"), "length"), _S.binary("-", _S.read(_e, "n"), 1))):
		var _v0 = _S.scope(_e)
		while _S.truth(_S.binary("<", _S.prop(_S.read(_v0, "r"), "length"), _S.read(_v0, "n"))):
			_S.invoke(_S.read(_v0, "r"), "push", [_S.prop(_S.read(_v0, "r"), _S.binary("-", _S.prop(_S.read(_v0, "r"), "length"), 1))])
		return _S.read(_v0, "r")
	return _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "n")}]), _S.function_value(_e, "_f1")])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.prop(_S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("/", _S.binary("*", _S.read(_e, "i"), _S.binary("-", _S.prop(_S.read(_e, "r"), "length"), 1)), _S.binary("-", _S.read(_e, "n"), 1))]))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "rx", _S.arg(_args, 2))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 3), func(): return 1))
	if _S.truth(_S.binary("<", _S.read(_e, "rx"), 1)):
		return null
	var _v1 = _S.scope(_e)
	_S.define(_v1, "row", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "row"), 2)):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "w", _S.binary("-", _S.read(_v2, "rx"), _S.binary("*", _S.read(_v2, "row"), 2)))
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "i", _S.invoke(_S.read(_v3, "Math"), "floor", [_S.binary("-", _S.read(_v3, "x"), _S.read(_v3, "w"))]))
		while _S.truth(_S.binary("<", _S.read(_v3, "i"), _S.invoke(_S.read(_v3, "Math"), "ceil", [_S.binary("+", _S.read(_v3, "x"), _S.read(_v3, "w"))]))):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "e", _S.binary("/", _S.invoke(_S.read(_v4, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_v4, "i"), 0.5), _S.read(_v4, "x"))]), _S.read(_v4, "w")))
			if _S.truth(_S.binary("<=", _S.read(_v4, "e"), 1)):
				_S.invoke(_S.read(_v4, "p"), "dot", [_S.read(_v4, "i"), _S.read(_v4, "row"), _S.read(_v4, "SHADOW"), (_S.read(_v4, "k") if _S.truth(_S.read(_v4, "row")) else _S.binary("*", _S.read(_v4, "k"), (1 if _S.truth(_S.binary("<", _S.read(_v4, "e"), 0.8)) else 0.5)))])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "row", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "s", _S.arg(_args, 3))
	_S.define(_e, "c", _S.arg(_args, 4))
	_S.define(_e, "mid", _S.coalesce(_S.arg(_args, 5), func(): return _S.read(_e, "c")))
	_S.define(_e, "core", _S.coalesce(_S.arg(_args, 6), func(): return _S.read(_e, "WHITE")))
	_S.write(_e, "s", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "s")]), "=", false)
	if _S.truth(_S.binary("<=", _S.read(_e, "s"), 0)):
		return null
	var _v5 = _S.scope(_e)
	_S.define(_v5, "d", 1)
	while _S.truth(_S.binary("<=", _S.read(_v5, "d"), _S.binary("-", _S.read(_v5, "s"), 1))):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "k", (_S.read(_v6, "mid") if _S.truth(_S.binary("<", _S.read(_v6, "d"), _S.binary("/", _S.read(_v6, "s"), 2))) else _S.read(_v6, "c")))
		_S.last([_S.invoke(_S.read(_v6, "p"), "px", [_S.binary("+", _S.read(_v6, "x"), _S.read(_v6, "d")), _S.read(_v6, "y"), _S.read(_v6, "k")]), _S.invoke(_S.read(_v6, "p"), "px", [_S.binary("-", _S.read(_v6, "x"), _S.read(_v6, "d")), _S.read(_v6, "y"), _S.read(_v6, "k")]), _S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "x"), _S.binary("+", _S.read(_v6, "y"), _S.read(_v6, "d")), _S.read(_v6, "k")]), _S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "x"), _S.binary("-", _S.read(_v6, "y"), _S.read(_v6, "d")), _S.read(_v6, "k")])])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "d", 1, "+=", true)
	if _S.truth(_S.binary(">=", _S.read(_e, "s"), 4)):
		_S.last([_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.read(_e, "x"), 1), _S.binary("+", _S.read(_e, "y"), 1), _S.read(_e, "c")]), _S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "x"), 1), _S.binary("-", _S.read(_e, "y"), 1), _S.read(_e, "c")]), _S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.read(_e, "x"), 1), _S.binary("-", _S.read(_e, "y"), 1), _S.read(_e, "c")]), _S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "x"), 1), _S.binary("+", _S.read(_e, "y"), 1), _S.read(_e, "c")])])
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "core")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "L", _S.arg(_args, 0))
	_S.define(_e, "x0", _S.arg(_args, 1))
	_S.define(_e, "y0", _S.arg(_args, 2))
	_S.define(_e, "x1", _S.arg(_args, 3))
	_S.define(_e, "y1", _S.arg(_args, 4))
	_S.define(_e, "sdf", _S.arg(_args, 5))
	_S.define(_e, "color", _S.arg(_args, 6))
	var _v7 = _S.coalesce(_S.arg(_args, 7), func(): return _S.merge([]))
	_S.define(_e, "bevel", _S.coalesce(_S.prop(_v7, "bevel"), func(): return 3))
	_S.define(_e, "light", _S.coalesce(_S.prop(_v7, "light"), func(): return [_S.unary("-", 0.5), _S.unary("-", 0.6), 0.62]))
	_S.define(_e, "clip", _S.coalesce(_S.prop(_v7, "clip"), func(): return null))
	_S.invoke(_S.read(_e, "L"), "fill", [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.read(_e, "x1"), _S.read(_e, "y1"), _S.function_value(_e, "_f5")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "d", _S.call_value(_S.read(_e, "sdf"), [_S.read(_e, "x"), _S.read(_e, "y")]))
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "d"), 0), func(): return _S.logical("&&", _S.read(_e, "clip"), func(): return _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "x"), _S.read(_e, "y")])))):
		return 0
	_S.define(_e, "e", _S.unary("-", _S.read(_e, "d")))
	_S.define(_e, "gx", _S.binary("-", _S.call_value(_S.read(_e, "sdf"), [_S.binary("+", _S.read(_e, "x"), 0.5), _S.read(_e, "y")]), _S.call_value(_S.read(_e, "sdf"), [_S.binary("-", _S.read(_e, "x"), 0.5), _S.read(_e, "y")])))
	_S.define(_e, "gy", _S.binary("-", _S.call_value(_S.read(_e, "sdf"), [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 0.5)]), _S.call_value(_S.read(_e, "sdf"), [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 0.5)])))
	_S.define(_e, "gl", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "gx"), _S.read(_e, "gy")]), func(): return 1))
	_S.write(_e, "gx", _S.read(_e, "gl"), "/=", false)
	_S.write(_e, "gy", _S.read(_e, "gl"), "/=", false)
	_S.define(_e, "k", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.read(_e, "e"), _S.read(_e, "bevel")))]), 1.25))
	_S.define(_e, "sn", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "k")]))
	_S.define(_e, "cs", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "k")]))
	return _S.call_value(_S.read(_e, "color"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "gx"), _S.read(_e, "sn")), _S.prop(_S.read(_e, "light"), 0)), _S.binary("*", _S.binary("*", _S.read(_e, "gy"), _S.read(_e, "sn")), _S.prop(_S.read(_e, "light"), 1))), _S.binary("*", _S.read(_e, "cs"), _S.prop(_S.read(_e, "light"), 2))), _S.read(_e, "e"), _S.read(_e, "x"), _S.read(_e, "y")])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "cx", _S.arg(_args, 2))
	_S.define(_e, "cy", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "h", _S.coalesce(_S.arg(_args, 5), func(): return _S.read(_e, "w")))
	_S.define(_e, "S", _S.binary("/", _S.read(_e, "w"), 1.14))
	_S.define(_e, "X", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.read(_e, "S")))
	_S.define(_e, "Y", _S.binary("+", _S.binary("/", _S.unary("-", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy"))), _S.binary("/", _S.read(_e, "h"), 1.14)), 0.12))
	_S.define(_e, "q", _S.binary("-", _S.binary("+", _S.binary("*", _S.read(_e, "X"), _S.read(_e, "X")), _S.binary("*", _S.read(_e, "Y"), _S.read(_e, "Y"))), 1))
	_S.define(_e, "f", _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_e, "q"), _S.read(_e, "q")), _S.read(_e, "q")), _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "X"), _S.read(_e, "X")), _S.read(_e, "Y")), _S.read(_e, "Y")), _S.read(_e, "Y"))))
	_S.define(_e, "gx", _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("*", 6, _S.read(_e, "X")), _S.read(_e, "q")), _S.read(_e, "q")), _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", 2, _S.read(_e, "X")), _S.read(_e, "Y")), _S.read(_e, "Y")), _S.read(_e, "Y"))))
	_S.define(_e, "gy", _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("*", 6, _S.read(_e, "Y")), _S.read(_e, "q")), _S.read(_e, "q")), _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", 3, _S.read(_e, "X")), _S.read(_e, "X")), _S.read(_e, "Y")), _S.read(_e, "Y"))))
	return _S.binary("*", _S.binary("/", _S.read(_e, "f"), _S.invoke(_S.read(_e, "Math"), "max", [_S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "gx"), _S.read(_e, "gy")]), 0.6])), _S.read(_e, "S"))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "rx", _S.arg(_args, 2))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 3), func(): return 1))
	_S.define(_e, "y", _S.coalesce(_S.arg(_args, 4), func(): return 0))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "rx"), 0.8), func(): return _S.binary("<=", _S.read(_e, "k"), 0))):
		return null
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", _S.invoke(_S.read(_v8, "Math"), "floor", [_S.binary("-", _S.read(_v8, "x"), _S.read(_v8, "rx"))]))
	while _S.truth(_S.binary("<=", _S.read(_v8, "i"), _S.invoke(_S.read(_v8, "Math"), "ceil", [_S.binary("+", _S.read(_v8, "x"), _S.read(_v8, "rx"))]))):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "u", _S.binary("/", _S.invoke(_S.read(_v9, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_v9, "i"), 0.5), _S.read(_v9, "x"))]), _S.read(_v9, "rx")))
		if _S.truth(_S.binary(">", _S.read(_v9, "u"), 1)):
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
			continue
		_S.define(_v9, "a", _S.binary("*", _S.read(_v9, "k"), _S.binary("-", 1, _S.binary("*", _S.read(_v9, "u"), _S.read(_v9, "u")))))
		_S.invoke(_S.read(_v9, "p"), "dot", [_S.read(_v9, "i"), _S.read(_v9, "y"), _S.read(_v9, "INK"), _S.binary("*", _S.read(_v9, "a"), 1.1)])
		if _S.truth(_S.binary("<", _S.read(_v9, "u"), 0.6)):
			_S.invoke(_S.read(_v9, "p"), "dot", [_S.read(_v9, "i"), _S.binary("+", _S.read(_v9, "y"), 1), _S.read(_v9, "INK"), _S.binary("*", _S.read(_v9, "a"), 0.6)])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "arm", _S.arg(_args, 3))
	_S.define(_e, "c", _S.arg(_args, 4))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 5), func(): return 0.4))
	_S.define(_e, "tip", _S.coalesce(_S.arg(_args, 6), func(): return _S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 0.8])))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "arm")]))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]))
	if _S.truth(_S.binary("<", _S.read(_e, "n"), 0)):
		return null
	var _v10 = _S.scope(_e)
	_S.define(_v10, "d", 1)
	while _S.truth(_S.binary("<=", _S.read(_v10, "d"), _S.read(_v10, "n"))):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "cc", (_S.read(_v11, "tip") if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v11, "d"), _S.read(_v11, "n")), func(): return _S.binary(">", _S.read(_v11, "n"), 1))) else _S.read(_v11, "c")))
		_S.last([_S.invoke(_S.read(_v11, "p"), "px", [_S.binary("+", _S.read(_v11, "X"), _S.read(_v11, "d")), _S.read(_v11, "Y"), _S.read(_v11, "cc")]), _S.invoke(_S.read(_v11, "p"), "px", [_S.binary("-", _S.read(_v11, "X"), _S.read(_v11, "d")), _S.read(_v11, "Y"), _S.read(_v11, "cc")]), _S.invoke(_S.read(_v11, "p"), "px", [_S.read(_v11, "X"), _S.binary("+", _S.read(_v11, "Y"), _S.read(_v11, "d")), _S.read(_v11, "cc")]), _S.invoke(_S.read(_v11, "p"), "px", [_S.read(_v11, "X"), _S.binary("-", _S.read(_v11, "Y"), _S.read(_v11, "d")), _S.read(_v11, "cc")])])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "d", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "X"), _S.read(_e, "Y"), (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "n"), 0)) else _S.read(_e, "c"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.read(_e, "X"), 0.5), _S.binary("+", _S.read(_e, "Y"), 0.5), _S.binary("+", 3, _S.binary("*", _S.read(_e, "n"), 2.5)), _S.read(_e, "c"), _S.read(_e, "k")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "rx", _S.arg(_args, 3))
	_S.define(_e, "ry", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "k", _S.arg(_args, 6))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "k"), 0.004), func(): return _S.binary("<", _S.read(_e, "rx"), 1))):
		return null
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "rx")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ry")), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "rx")), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "ry")), _S.function_value(_e, "_f10")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")), _S.read(_e, "rx")))
	_S.define(_e, "dy", _S.binary("/", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")), _S.read(_e, "ry")))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy"))))
	if _S.truth(_S.binary(">=", _S.read(_e, "d"), 1)):
		return null
	_S.define(_e, "f", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "d")])))
	_S.set_prop(_S.read(_e, "out"), "l", _S.read(_e, "c"), "=", false)
	_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.binary("*", _S.read(_e, "f"), _S.read(_e, "f")), _S.read(_e, "k")), "=", false)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "L", _S.arg(_args, 0))
	_S.define(_e, "p", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "r", _S.arg(_args, 4))
	_S.define(_e, "ax", _S.arg(_args, 5))
	_S.define(_e, "spin", _S.arg(_args, 6))
	_S.define(_e, "C", _S.arg(_args, 7))
	_S.define(_e, "white", _S.coalesce(_S.arg(_args, 8), func(): return false))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 9), func(): return 1))
	_S.define(_e, "snap", _S.coalesce(_S.arg(_args, 10), func(): return true))
	_S.define(_e, "X", (_S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]) if _S.truth(_S.read(_e, "snap")) else _S.read(_e, "x")))
	_S.define(_e, "Y", (_S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]) if _S.truth(_S.read(_e, "snap")) else _S.read(_e, "y")))
	_S.define(_e, "cs", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "spin")]))
	_S.define(_e, "sn", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "spin")]))
	_S.define(_e, "b", _S.invoke(_S.read(_e, "Math"), "max", [0.5, _S.binary("*", _S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "cs")]))]))
	_S.define(_e, "th", _S.binary("*", _S.binary("*", 1.2, _S.read(_e, "sn")), _S.invoke(_S.read(_e, "Math"), "sign", [_S.logical("||", _S.read(_e, "cs"), func(): return 1)])))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ax")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ax")]))
	_S.define(_e, "face", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "cs")]))
	_S.define(_e, "R", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.read(_e, "r")]), 2))
	_S.invoke(_S.read(_e, "L"), "begin", [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "X")]), _S.read(_e, "R")), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "Y")]), _S.read(_e, "R"))])
	_S.invoke(_S.read(_e, "L"), "fill", [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "X")]), _S.read(_e, "R")), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "Y")]), _S.read(_e, "R")), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "X")]), _S.read(_e, "R")), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "Y")]), _S.read(_e, "R")), _S.function_value(_e, "_f12")])
	_S.invoke(_S.invoke(_S.read(_e, "L"), "outline", [_S.prop(_S.read(_e, "C"), 1)]), "draw", [_S.read(_e, "p"), 0, 0, _S.read(_e, "a")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "X")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "Y")))
	_S.define(_e, "u", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sa"))))
	_S.define(_e, "w", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ca"))))
	_S.define(_e, "ef", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("/", _S.read(_e, "u"), _S.read(_e, "r")), _S.binary("/", _S.read(_e, "w"), _S.read(_e, "b"))]))
	_S.define(_e, "er", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("/", _S.read(_e, "u"), _S.read(_e, "r")), _S.binary("/", _S.binary("-", _S.read(_e, "w"), _S.read(_e, "th")), _S.read(_e, "b"))]))
	if _S.truth(_S.logical("&&", _S.read(_e, "white"), func(): return _S.logical("||", _S.binary("<=", _S.read(_e, "ef"), 1), func(): return _S.binary("<=", _S.read(_e, "er"), 1)))):
		return _S.read(_e, "WHITE")
	if _S.truth(_S.binary("<=", _S.read(_e, "ef"), 1)):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "lit", _S.binary("/", _S.unary("-", _S.binary("+", _S.binary("*", _S.read(_v12, "dx"), 0.62), _S.binary("*", _S.read(_v12, "dy"), 0.78))), _S.invoke(_S.read(_v12, "Math"), "max", [1, _S.invoke(_S.read(_v12, "Math"), "hypot", [_S.read(_v12, "dx"), _S.read(_v12, "dy")])])))
		_S.define(_v12, "dim", (1 if _S.truth(_S.binary("<", _S.read(_v12, "face"), 0.45)) else 0))
		if _S.truth(_S.binary("<", _S.read(_v12, "b"), 1.1)):
			return (_S.prop(_S.read(_v12, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v12, "lit"), 0)) else _S.prop(_S.read(_v12, "C"), 4))
		if _S.truth(_S.binary(">", _S.read(_v12, "ef"), 0.72)):
			return _S.prop(_S.read(_v12, "C"), _S.binary("-", (6 if _S.truth(_S.binary(">", _S.read(_v12, "lit"), 0.3)) else (5 if _S.truth(_S.binary(">", _S.read(_v12, "lit"), _S.unary("-", 0.35))) else 3)), _S.read(_v12, "dim")))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v12, "b"), 2.2), func(): return _S.binary(">", _S.read(_v12, "ef"), 0.42))):
			return _S.prop(_S.read(_v12, "C"), _S.binary("-", (4 if _S.truth(_S.binary(">", _S.read(_v12, "lit"), 0.2)) else 5), _S.read(_v12, "dim")))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v12, "face"), 0.6), func(): return _S.binary(">", _S.read(_v12, "lit"), 0.5))):
			return _S.prop(_S.read(_v12, "C"), 7)
		return _S.prop(_S.read(_v12, "C"), _S.binary("-", 5, _S.read(_v12, "dim")))
	if _S.truth(_S.binary("<=", _S.read(_e, "er"), 1)):
		return (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "w"), _S.read(_e, "th"))]), _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "w")]))) else _S.prop(_S.read(_e, "C"), 3))
	return 0

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "L", _S.arg(_args, 0))
	_S.define(_e, "p", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "r", _S.arg(_args, 4))
	_S.define(_e, "ang", _S.arg(_args, 5))
	_S.define(_e, "G", _S.arg(_args, 6))
	_S.define(_e, "white", _S.coalesce(_S.arg(_args, 7), func(): return false))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 8), func(): return 1))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "G"), "length"))
	_S.define(_e, "R", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.read(_e, "r"), 1.4)]), 2))
	_S.define(_e, "ct", _S.binary("*", _S.read(_e, "r"), 0.75))
	_S.define(_e, "tw", _S.binary("*", _S.read(_e, "r"), 0.5))
	_S.define(_e, "pv", _S.binary("*", _S.read(_e, "r"), 1.3))
	_S.invoke(_S.read(_e, "L"), "begin", [_S.binary("-", _S.read(_e, "X"), _S.read(_e, "R")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "R"))])
	_S.invoke(_S.read(_e, "L"), "fill", [_S.binary("-", _S.read(_e, "X"), _S.read(_e, "R")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "R")), _S.binary("-", _S.binary("+", _S.read(_e, "X"), _S.read(_e, "R")), 1), _S.binary("-", _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "R")), 1), _S.function_value(_e, "_f14")])
	_S.invoke(_S.invoke(_S.read(_e, "L"), "outline", [_S.prop(_S.read(_e, "G"), 0)]), "draw", [_S.read(_e, "p"), 0, 0, _S.read(_e, "a")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "X")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "Y")))
	_S.define(_e, "u", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sa"))))
	_S.define(_e, "w", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ca"))))
	_S.define(_e, "facet", null)
	if _S.truth(_S.binary("<", _S.read(_e, "w"), 0)):
		var _v13 = _S.scope(_e)
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v13, "w"), _S.unary("-", _S.read(_v13, "ct"))), func(): return _S.binary(">", _S.invoke(_S.read(_v13, "Math"), "abs", [_S.read(_v13, "u")]), _S.binary("-", _S.read(_v13, "r"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v13, "w")), _S.read(_v13, "ct")), _S.binary("-", _S.read(_v13, "r"), _S.read(_v13, "tw"))))))):
			return 0
		_S.write(_v13, "facet", (0 if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v13, "w"), _S.binary("*", _S.unary("-", _S.read(_v13, "ct")), 0.45)), func(): return _S.binary("<", _S.invoke(_S.read(_v13, "Math"), "abs", [_S.read(_v13, "u")]), _S.binary("*", _S.read(_v13, "tw"), 0.95)))) else (1 if _S.truth(_S.binary("<", _S.read(_v13, "u"), 0)) else 2)), "=", false)
	else:
		var _v14 = _S.scope(_e)
		if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v14, "w"), _S.read(_v14, "pv")), func(): return _S.binary(">", _S.invoke(_S.read(_v14, "Math"), "abs", [_S.read(_v14, "u")]), _S.binary("*", _S.read(_v14, "r"), _S.binary("-", 1, _S.binary("/", _S.read(_v14, "w"), _S.read(_v14, "pv"))))))):
			return 0
		_S.write(_v14, "facet", (4 if _S.truth(_S.binary("<", _S.invoke(_S.read(_v14, "Math"), "abs", [_S.read(_v14, "u")]), 0.5)) else (3 if _S.truth(_S.binary("<", _S.read(_v14, "u"), 0)) else 5)), "=", false)
	if _S.truth(_S.read(_e, "white")):
		return _S.read(_e, "WHITE")
	_S.define(_e, "N", _S.prop([[0, _S.unary("-", 1)], [_S.unary("-", 0.7), _S.unary("-", 0.7)], [0.7, _S.unary("-", 0.7)], [_S.unary("-", 0.6), 0.8], [0, 1], [0.6, 0.8]], _S.read(_e, "facet")))
	_S.define(_e, "nx", _S.binary("-", _S.binary("*", _S.prop(_S.read(_e, "N"), 0), _S.read(_e, "ca")), _S.binary("*", _S.prop(_S.read(_e, "N"), 1), _S.read(_e, "sa"))))
	_S.define(_e, "ny", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "N"), 0), _S.read(_e, "sa")), _S.binary("*", _S.prop(_S.read(_e, "N"), 1), _S.read(_e, "ca"))))
	_S.define(_e, "l", _S.unary("-", _S.binary("+", _S.binary("*", _S.read(_e, "nx"), 0.62), _S.binary("*", _S.read(_e, "ny"), 0.78))))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("===", _S.read(_e, "facet"), 0), func(): return _S.binary(">", _S.read(_e, "l"), 0.3)), func(): return _S.binary("<", _S.read(_e, "u"), 0))):
		return _S.read(_e, "WHITE")
	return (_S.prop(_S.read(_e, "G"), _S.binary("-", _S.read(_e, "n"), 1)) if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.6)) else (_S.prop(_S.read(_e, "G"), _S.binary("-", _S.read(_e, "n"), 2)) if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.2)) else (_S.prop(_S.read(_e, "G"), _S.binary("-", _S.read(_e, "n"), 3)) if _S.truth(_S.binary(">", _S.read(_e, "l"), _S.unary("-", 0.2))) else (_S.prop(_S.read(_e, "G"), _S.binary("-", _S.read(_e, "n"), 4)) if _S.truth(_S.binary(">", _S.read(_e, "l"), _S.unary("-", 0.6))) else _S.prop(_S.read(_e, "G"), _S.binary("-", _S.read(_e, "n"), 5))))))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	var _v15 = _S.coalesce(_S.arg(_args, 0), func(): return _S.merge([]))
	_S.define(_e, "r", _S.coalesce(_S.prop(_v15, "r"), func(): return 7.5))
	_S.define(_e, "crown", _S.coalesce(_S.prop(_v15, "crown"), func(): return 3.6))
	_S.define(_e, "table", _S.coalesce(_S.prop(_v15, "table"), func(): return 0.52))
	_S.define(_e, "pavilion", _S.coalesce(_S.prop(_v15, "pavilion"), func(): return 8))
	_S.define(_e, "girdle", _S.coalesce(_S.prop(_v15, "girdle"), func(): return 0.8))
	_S.define(_e, "n", _S.coalesce(_S.prop(_v15, "n"), func(): return 8))
	_S.define(_e, "planes", [_S.merge([{"n": [0, 1, 0]}, {"d": _S.binary("+", _S.read(_e, "crown"), _S.binary("/", _S.read(_e, "girdle"), 2))}, {"kind": 0}])])
	_S.define(_e, "cs", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "crown"), _S.binary("*", _S.read(_e, "r"), _S.binary("-", 1, _S.read(_e, "table")))]))
	_S.define(_e, "ps", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "pavilion"), _S.read(_e, "r")]))
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), _S.binary("*", _S.read(_v16, "n"), 2))):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "a", _S.binary("/", _S.binary("*", _S.read(_v17, "i"), _S.prop(_S.read(_v17, "Math"), "PI")), _S.read(_v17, "n")))
		_S.define(_v17, "half", _S.binary("%", _S.read(_v17, "i"), 2))
		_S.define(_v17, "c", (_S.invoke(_S.read(_v17, "Math"), "min", [1.45, _S.binary("+", _S.read(_v17, "cs"), 0.22)]) if _S.truth(_S.read(_v17, "half")) else _S.read(_v17, "cs")))
		_S.define(_v17, "pv", (_S.binary("-", _S.read(_v17, "ps"), 0.1) if _S.truth(_S.read(_v17, "half")) else _S.read(_v17, "ps")))
		_S.invoke(_S.read(_v17, "planes"), "push", [_S.merge([{"n": [_S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "c")]), _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")])), _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "c")]), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "c")]), _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]))]}, {"d": _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v17, "r"), _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "c")])), (1.012 if _S.truth(_S.read(_v17, "half")) else 1)), _S.binary("*", _S.binary("/", _S.read(_v17, "girdle"), 2), _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "c")])))}, {"kind": (2 if _S.truth(_S.read(_v17, "half")) else 1)}])])
		_S.invoke(_S.read(_v17, "planes"), "push", [_S.merge([{"n": [_S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), 0, _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")])]}, {"d": _S.binary("*", _S.read(_v17, "r"), (1 if _S.truth(_S.read(_v17, "half")) else 1))}, {"kind": 3}])])
		_S.invoke(_S.read(_v17, "planes"), "push", [_S.merge([{"n": [_S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "pv")]), _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")])), _S.unary("-", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "pv")])), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "pv")]), _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]))]}, {"d": _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v17, "r"), _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "pv")])), (1.03 if _S.truth(_S.read(_v17, "half")) else 1)), _S.binary("*", _S.binary("/", _S.read(_v17, "girdle"), 2), _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "pv")])))}, {"kind": (5 if _S.truth(_S.read(_v17, "half")) else 4)}])])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	return _S.merge([{"planes": _S.read(_e, "planes")}, {"r": _S.read(_e, "r")}, {"top": _S.binary("+", _S.read(_e, "crown"), _S.binary("/", _S.read(_e, "girdle"), 2))}, {"bottom": _S.binary("+", _S.read(_e, "pavilion"), _S.binary("/", _S.read(_e, "girdle"), 2))}])

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	var _v18 = _S.coalesce(_S.arg(_args, 0), func(): return _S.merge([]))
	_S.define(_e, "r", _S.coalesce(_S.prop(_v18, "r"), func(): return 4.6))
	_S.define(_e, "half", _S.coalesce(_S.prop(_v18, "half"), func(): return 5.5))
	_S.define(_e, "top", _S.coalesce(_S.prop(_v18, "top"), func(): return 7.5))
	_S.define(_e, "bottom", _S.coalesce(_S.prop(_v18, "bottom"), func(): return 6))
	_S.define(_e, "n", _S.coalesce(_S.prop(_v18, "n"), func(): return 6))
	_S.define(_e, "planes", [])
	_S.define(_e, "ct", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "top"), _S.read(_e, "r")]))
	_S.define(_e, "cb", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "bottom"), _S.read(_e, "r")]))
	var _v19 = _S.scope(_e)
	_S.define(_v19, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v19, "i"), _S.read(_v19, "n"))):
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "a", _S.binary("/", _S.binary("*", _S.read(_v20, "i"), _S.read(_v20, "TAU")), _S.read(_v20, "n")))
		_S.invoke(_S.read(_v20, "planes"), "push", [_S.merge([{"n": [_S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), 0, _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")])]}, {"d": _S.read(_v20, "r")}, {"kind": 6}])])
		_S.invoke(_S.read(_v20, "planes"), "push", [_S.merge([{"n": [_S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "ct")]), _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")])), _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "ct")]), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "ct")]), _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]))]}, {"d": _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "ct")]), _S.read(_v20, "r")), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "ct")]), _S.read(_v20, "half")))}, {"kind": 7}])])
		_S.invoke(_S.read(_v20, "planes"), "push", [_S.merge([{"n": [_S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "cb")]), _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")])), _S.unary("-", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "cb")])), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "cb")]), _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]))]}, {"d": _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "cb")]), _S.read(_v20, "r")), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "cb")]), _S.read(_v20, "half")))}, {"kind": 8}])])
		_v19 = _S.iteration(_v19)
		_S.write(_v19, "i", 1, "+=", true)
	return _S.merge([{"planes": _S.read(_e, "planes")}, {"r": _S.binary("/", _S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "n"))]))}, {"top": _S.binary("+", _S.read(_e, "half"), _S.read(_e, "top"))}, {"bottom": _S.binary("+", _S.read(_e, "half"), _S.read(_e, "bottom"))}])

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "L", _S.arg(_args, 0))
	_S.define(_e, "p", _S.arg(_args, 1))
	_S.define(_e, "g", _S.arg(_args, 2))
	_S.define(_e, "x", _S.arg(_args, 3))
	_S.define(_e, "y", _S.arg(_args, 4))
	_S.define(_e, "spin", _S.arg(_args, 5))
	_S.define(_e, "C", _S.arg(_args, 6))
	var _v21 = _S.coalesce(_S.arg(_args, 7), func(): return _S.merge([]))
	_S.define(_e, "tilt", _S.coalesce(_S.prop(_v21, "tilt"), func(): return 0.32))
	_S.define(_e, "white", _S.coalesce(_S.prop(_v21, "white"), func(): return false))
	_S.define(_e, "a", _S.coalesce(_S.prop(_v21, "a"), func(): return 1))
	_S.define(_e, "edges", _S.coalesce(_S.prop(_v21, "edges"), func(): return true))
	_S.define(_e, "gain", _S.coalesce(_S.prop(_v21, "gain"), func(): return 1))
	_S.define(_e, "cs", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "spin")]))
	_S.define(_e, "sn", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "spin")]))
	_S.define(_e, "ct", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "tilt")]))
	_S.define(_e, "st", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "tilt")]))
	_S.define(_e, "P", _S.invoke(_S.prop(_S.read(_e, "g"), "planes"), "map", [_S.function_value(_e, "_f18")]))
	_S.define(_e, "Lx", _S.unary("-", 0.55))
	_S.define(_e, "Ly", 0.72)
	_S.define(_e, "Lz", 0.42)
	_S.define(_e, "D", [0, _S.unary("-", _S.read(_e, "st")), _S.unary("-", _S.read(_e, "ct"))])
	_S.define(_e, "V", [0, _S.read(_e, "st"), _S.read(_e, "ct")])
	_S.define(_e, "Hl", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("+", _S.read(_e, "Lx"), _S.prop(_S.read(_e, "V"), 0)), _S.binary("+", _S.read(_e, "Ly"), _S.prop(_S.read(_e, "V"), 1)), _S.binary("+", _S.read(_e, "Lz"), _S.prop(_S.read(_e, "V"), 2))]))
	_S.define(_e, "H", [_S.binary("/", _S.binary("+", _S.read(_e, "Lx"), _S.prop(_S.read(_e, "V"), 0)), _S.read(_e, "Hl")), _S.binary("/", _S.binary("+", _S.read(_e, "Ly"), _S.prop(_S.read(_e, "V"), 1)), _S.read(_e, "Hl")), _S.binary("/", _S.binary("+", _S.read(_e, "Lz"), _S.prop(_S.read(_e, "V"), 2)), _S.read(_e, "Hl"))])
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.define(_e, "R", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.prop(_S.read(_e, "g"), "r")]), 2))
	_S.define(_e, "top", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_e, "g"), "top"), 2)]))
	_S.define(_e, "bot", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_e, "g"), "bottom"), 2)]))
	_S.define(_e, "best", _S.unary("-", 1))
	_S.define(_e, "bx", _S.read(_e, "X"))
	_S.define(_e, "by", _S.read(_e, "Y"))
	_S.define(_e, "ids", _S.construct(_S.read(_e, "Map"), []))
	_S.invoke(_S.read(_e, "L"), "begin", [_S.binary("-", _S.read(_e, "X"), _S.read(_e, "R")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "top"))])
	_S.invoke(_S.read(_e, "L"), "fill", [_S.binary("-", _S.read(_e, "X"), _S.read(_e, "R")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "top")), _S.binary("+", _S.read(_e, "X"), _S.read(_e, "R")), _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "bot")), _S.function_value(_e, "_f19")])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "white")), func(): return _S.read(_e, "edges"))):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "out", [])
		for _v28 in _S.array(_S.read(_v27, "ids")):
			var _v29 = _S.scope(_v27)
			var _v30 = _v28
			_S.define(_v29, "key", _S.prop(_v30, 0))
			_S.define(_v29, "id", _S.prop(_v30, 1))
			var _v31 = _S.scope(_v29)
			_S.define(_v31, "kx", _S.invoke(_S.read(_v31, "Math"), "floor", [_S.binary("/", _S.read(_v31, "key"), 1000)]))
			_S.define(_v31, "ky", _S.binary("-", _S.read(_v31, "key"), _S.binary("*", _S.read(_v31, "kx"), 1000)))
			_S.define(_v31, "x", _S.binary("-", _S.read(_v31, "kx"), 500))
			_S.define(_v31, "y", _S.binary("-", _S.read(_v31, "ky"), 500))
			_S.define(_v31, "r", _S.invoke(_S.read(_v31, "ids"), "get", [_S.binary("+", _S.read(_v31, "key"), 1000)]))
			_S.define(_v31, "d", _S.invoke(_S.read(_v31, "ids"), "get", [_S.binary("+", _S.read(_v31, "key"), 1)]))
			if _S.truth(_S.logical("||", _S.logical("&&", _S.binary("!==", _S.read(_v31, "r"), null), func(): return _S.binary("!==", _S.read(_v31, "r"), _S.read(_v31, "id"))), func(): return _S.logical("&&", _S.binary("!==", _S.read(_v31, "d"), null), func(): return _S.binary("!==", _S.read(_v31, "d"), _S.read(_v31, "id"))))):
				var _v32 = _S.scope(_v31)
				_S.define(_v32, "c", _S.binary(">>>", _S.invoke(_S.read(_v32, "L"), "get", [_S.read(_v32, "x"), _S.read(_v32, "y")]), 0))
				_S.define(_v32, "i", _S.invoke(_S.read(_v32, "C"), "findIndex", [_S.function_value(_v32, "_f20")]))
				_S.define(_v32, "pav", _S.invoke([4, 5, 8], "includes", [_S.prop(_S.prop(_S.read(_v32, "P"), _S.read(_v32, "id")), "kind")]))
				if _S.truth(_S.binary(">", _S.read(_v32, "i"), 0)):
					_S.invoke(_S.read(_v32, "out"), "push", [[_S.read(_v32, "x"), _S.read(_v32, "y"), (_S.prop(_S.read(_v32, "C"), _S.invoke(_S.read(_v32, "Math"), "max", [1, _S.binary("-", _S.read(_v32, "i"), 1)])) if _S.truth(_S.read(_v32, "pav")) else _S.prop(_S.read(_v32, "C"), _S.invoke(_S.read(_v32, "Math"), "min", [7, _S.binary("+", _S.read(_v32, "i"), 1)])))]])
		for _v33 in _S.array(_S.read(_v27, "out")):
			var _v34 = _S.scope(_v27)
			var _v35 = _v33
			_S.define(_v34, "x", _S.prop(_v35, 0))
			_S.define(_v34, "y", _S.prop(_v35, 1))
			_S.define(_v34, "c", _S.prop(_v35, 2))
			_S.invoke(_S.read(_v34, "L"), "set", [_S.read(_v34, "x"), _S.read(_v34, "y"), _S.read(_v34, "c")])
	_S.invoke(_S.invoke(_S.read(_e, "L"), "outline", [_S.prop(_S.read(_e, "C"), 0)]), "draw", [_S.read(_e, "p"), 0, 0, _S.read(_e, "a")])
	return _S.merge([{"x": _S.read(_e, "bx")}, {"y": _S.read(_e, "by")}, {"k": _S.read(_e, "best")}])

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.merge([{"n": [_S.binary("-", _S.binary("*", _S.prop(_S.prop(_S.read(_e, "q"), "n"), 0), _S.read(_e, "cs")), _S.binary("*", _S.prop(_S.prop(_S.read(_e, "q"), "n"), 2), _S.read(_e, "sn"))), _S.prop(_S.prop(_S.read(_e, "q"), "n"), 1), _S.binary("+", _S.binary("*", _S.prop(_S.prop(_S.read(_e, "q"), "n"), 0), _S.read(_e, "sn")), _S.binary("*", _S.prop(_S.prop(_S.read(_e, "q"), "n"), 2), _S.read(_e, "cs")))]}, {"d": _S.prop(_S.read(_e, "q"), "d")}, {"kind": _S.prop(_S.read(_e, "q"), "kind")}])

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "X")))
	_S.define(_e, "sy", _S.unary("-", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "Y"))))
	_S.define(_e, "o", [_S.read(_e, "sx"), _S.binary("*", _S.read(_e, "sy"), _S.read(_e, "ct")), _S.binary("*", _S.unary("-", _S.read(_e, "sy")), _S.read(_e, "st"))])
	_S.define(_e, "t0", _S.unary("-", 1000000000))
	_S.define(_e, "t1", 1000000000)
	_S.define(_e, "hit", null)
	for _v22 in _S.array(_S.read(_e, "P")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "q", _v22)
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "nd", _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.prop(_S.read(_v24, "q"), "n"), 0), _S.prop(_S.read(_v24, "D"), 0)), _S.binary("*", _S.prop(_S.prop(_S.read(_v24, "q"), "n"), 1), _S.prop(_S.read(_v24, "D"), 1))), _S.binary("*", _S.prop(_S.prop(_S.read(_v24, "q"), "n"), 2), _S.prop(_S.read(_v24, "D"), 2))))
		_S.define(_v24, "no", _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.prop(_S.read(_v24, "q"), "n"), 0), _S.prop(_S.read(_v24, "o"), 0)), _S.binary("*", _S.prop(_S.prop(_S.read(_v24, "q"), "n"), 1), _S.prop(_S.read(_v24, "o"), 1))), _S.binary("*", _S.prop(_S.prop(_S.read(_v24, "q"), "n"), 2), _S.prop(_S.read(_v24, "o"), 2))))
		if _S.truth(_S.binary("<", _S.invoke(_S.read(_v24, "Math"), "abs", [_S.read(_v24, "nd")]), 0.000001)):
			var _v25 = _S.scope(_v24)
			if _S.truth(_S.binary(">", _S.read(_v25, "no"), _S.prop(_S.read(_v25, "q"), "d"))):
				return 0
			continue
		_S.define(_v24, "tt", _S.binary("/", _S.binary("-", _S.prop(_S.read(_v24, "q"), "d"), _S.read(_v24, "no")), _S.read(_v24, "nd")))
		if _S.truth(_S.binary("<", _S.read(_v24, "nd"), 0)):
			var _v26 = _S.scope(_v24)
			if _S.truth(_S.binary(">", _S.read(_v26, "tt"), _S.read(_v26, "t0"))):
				_S.last([_S.write(_v26, "t0", _S.read(_v26, "tt"), "=", false), _S.write(_v26, "hit", _S.read(_v26, "q"), "=", false)])
		else:
			if _S.truth(_S.binary("<", _S.read(_v24, "tt"), _S.read(_v24, "t1"))):
				_S.write(_v24, "t1", _S.read(_v24, "tt"), "=", false)
	if _S.truth(_S.logical("||", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">", _S.read(_e, "t0"), _S.read(_e, "t1")))):
		return 0
	if _S.truth(_S.read(_e, "white")):
		return _S.read(_e, "WHITE")
	_S.invoke(_S.read(_e, "ids"), "set", [_S.binary("+", _S.binary("+", _S.binary("*", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "px")]), 500), 1000), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "py")])), 500), _S.invoke(_S.read(_e, "P"), "indexOf", [_S.read(_e, "hit")])])
	_S.define(_e, "n", _S.prop(_S.read(_e, "hit"), "n"))
	_S.define(_e, "pav", _S.logical("||", _S.logical("||", _S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 4), func(): return _S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 5)), func(): return _S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 8)))
	_S.define(_e, "m", ([_S.prop(_S.read(_e, "n"), 0), _S.binary("*", _S.unary("-", _S.prop(_S.read(_e, "n"), 1)), 0.6), _S.prop(_S.read(_e, "n"), 2)] if _S.truth(_S.read(_e, "pav")) else _S.read(_e, "n")))
	_S.define(_e, "ml", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.prop(_S.read(_e, "m"), 0), _S.prop(_S.read(_e, "m"), 1), _S.prop(_S.read(_e, "m"), 2)]))
	_S.define(_e, "lam", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("/", _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "m"), 0), _S.read(_e, "Lx")), _S.binary("*", _S.prop(_S.read(_e, "m"), 1), _S.read(_e, "Ly"))), _S.binary("*", _S.prop(_S.read(_e, "m"), 2), _S.read(_e, "Lz"))), _S.read(_e, "ml"))]))
	_S.define(_e, "spec", _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("/", _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "m"), 0), _S.prop(_S.read(_e, "H"), 0)), _S.binary("*", _S.prop(_S.read(_e, "m"), 1), _S.prop(_S.read(_e, "H"), 1))), _S.binary("*", _S.prop(_S.read(_e, "m"), 2), _S.prop(_S.read(_e, "H"), 2))), _S.read(_e, "ml"))]), 18]))
	_S.define(_e, "b", (_S.binary("+", 0.02, _S.binary("*", 0.72, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "lam"), 2.4]))) if _S.truth(_S.read(_e, "pav")) else (_S.binary("+", 0.12, _S.binary("*", 0.4, _S.read(_e, "lam"))) if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 3)) else _S.binary("+", 0.04, _S.binary("*", 0.66, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "lam"), 1.8]))))))
	if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 6)):
		_S.write(_e, "b", _S.binary("+", 0.16, _S.binary("*", 0.66, _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("/", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "n"), 0), _S.read(_e, "Lx")), _S.binary("*", _S.prop(_S.read(_e, "n"), 2), _S.read(_e, "Lz"))), _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "Lx"), _S.read(_e, "Lz")]))]), 1.3]))), "=", false)
	else:
		if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 7)):
			_S.write(_e, "b", _S.binary("+", 0.22, _S.binary("*", 0.62, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "lam"), 1.2]))), "=", false)
		else:
			if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 9)):
				_S.write(_e, "b", _S.binary("+", 0.62, _S.binary("*", 0.25, _S.read(_e, "lam"))), "=", false)
			else:
				if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 10)):
					_S.write(_e, "b", _S.binary("+", _S.binary("+", 0.3, _S.binary("*", 0.5, _S.read(_e, "lam"))), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "px"), _S.read(_e, "X"))]), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "py"), _S.read(_e, "Y"))]), 43]), 0.5), 0.08)), "=", false)
	if _S.truth(_S.binary("!==", _S.prop(_S.read(_e, "hit"), "kind"), 9)):
		_S.write(_e, "b", _S.read(_e, "gain"), "*=", false)
	if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 0)):
		_S.write(_e, "b", 0.04, "-=", false)
	_S.define(_e, "s", _S.binary("+", _S.read(_e, "b"), _S.binary("*", _S.read(_e, "spec"), 0.6)))
	if _S.truth(_S.binary(">", _S.read(_e, "s"), _S.read(_e, "best"))):
		_S.last([_S.write(_e, "best", _S.read(_e, "s"), "=", false), _S.write(_e, "bx", _S.read(_e, "px"), "=", false), _S.write(_e, "by", _S.read(_e, "py"), "=", false)])
	if _S.truth(_S.binary(">", _S.read(_e, "spec"), 0.8)):
		return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.read(_e, "pav")) else _S.read(_e, "WHITE"))
	return _S.prop(_S.read(_e, "C"), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.invoke(_S.read(_e, "Math"), "min", [6, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", 1, _S.binary("*", _S.read(_e, "s"), 5.6))])])]))

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	return _S.binary("===", _S.binary(">>>", _S.read(_e, "k"), 0), _S.read(_e, "c"))

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "L", _S.arg(_args, 0))
	_S.define(_e, "p", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "r", _S.arg(_args, 4))
	_S.define(_e, "th", _S.arg(_args, 5))
	_S.define(_e, "theta", _S.arg(_args, 6))
	_S.define(_e, "C", _S.arg(_args, 7))
	var _v36 = _S.coalesce(_S.arg(_args, 8), func(): return _S.merge([]))
	_S.define(_e, "a", _S.coalesce(_S.prop(_v36, "a"), func(): return 1))
	_S.define(_e, "white", _S.coalesce(_S.prop(_v36, "white"), func(): return false))
	_S.define(_e, "ct", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "theta")]))
	_S.define(_e, "st", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "theta")]))
	_S.define(_e, "sg", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.read(_e, "ct"), 0)) else 1))
	_S.define(_e, "act", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "ct")]))
	_S.define(_e, "ast", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "st")]))
	_S.define(_e, "xc", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "th"), 2), _S.read(_e, "st")), _S.read(_e, "sg")))
	_S.define(_e, "nfx", _S.binary("*", _S.read(_e, "st"), _S.read(_e, "sg")))
	_S.define(_e, "Lx", _S.unary("-", 0.55))
	_S.define(_e, "Ly", 0.45)
	_S.define(_e, "Lz", 0.7)
	_S.define(_e, "Ln", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "Lx"), _S.read(_e, "Ly"), _S.read(_e, "Lz")]))
	_S.define(_e, "lam", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_e, "nfx"), _S.read(_e, "Lx")), _S.binary("*", _S.read(_e, "act"), _S.read(_e, "Lz"))), _S.read(_e, "Ln")))
	_S.define(_e, "Hx", _S.binary("/", _S.read(_e, "Lx"), _S.read(_e, "Ln")))
	_S.define(_e, "Hz", _S.binary("+", _S.binary("/", _S.read(_e, "Lz"), _S.read(_e, "Ln")), 1))
	_S.define(_e, "Hn", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "Hx"), _S.read(_e, "Hz")]))
	_S.define(_e, "base", _S.invoke(_S.read(_e, "Math"), "max", [2, _S.invoke(_S.read(_e, "Math"), "min", [5, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", 2, _S.binary("*", _S.read(_e, "lam"), 3.2))])])]))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.define(_e, "B", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.read(_e, "r"), _S.read(_e, "th"))]), 2))
	_S.define(_e, "flash", 0)
	_S.invoke(_S.read(_e, "L"), "begin", [_S.binary("-", _S.read(_e, "X"), _S.read(_e, "B")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "B"))])
	_S.invoke(_S.read(_e, "L"), "fill", [_S.binary("-", _S.read(_e, "X"), _S.read(_e, "B")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "B")), _S.binary("+", _S.read(_e, "X"), _S.read(_e, "B")), _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "B")), _S.function_value(_e, "_f22")])
	_S.invoke(_S.invoke(_S.read(_e, "L"), "outline", [_S.prop(_S.read(_e, "C"), 1)]), "draw", [_S.read(_e, "p"), 0, 0, _S.read(_e, "a")])
	return _S.read(_e, "flash")

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "X")))
	_S.define(_e, "sy", _S.unary("-", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "Y"))))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "sy")]), _S.read(_e, "r"))):
		return 0
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("**", _S.binary("/", _S.read(_e, "sy"), _S.read(_e, "r")), 2))]))
	_S.define(_e, "hw", _S.binary("*", _S.binary("*", _S.read(_e, "r"), _S.read(_e, "s")), _S.read(_e, "act")))
	_S.define(_e, "xr", _S.binary("*", _S.binary("*", _S.binary("*", _S.unary("-", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.read(_e, "st"), 0)) else 1)), _S.read(_e, "s")), _S.read(_e, "r")), _S.read(_e, "ct")))
	_S.define(_e, "rw", _S.binary("*", _S.binary("/", _S.read(_e, "th"), 2), _S.read(_e, "ast")))
	if _S.truth(_S.logical("&&", _S.read(_e, "white"), func(): return _S.logical("||", _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "sx"), _S.read(_e, "xc"))]), _S.read(_e, "hw")), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "sx"), _S.read(_e, "xr"))]), _S.binary("+", _S.read(_e, "rw"), 0.05))))):
		return _S.read(_e, "WHITE")
	if _S.truth(_S.logical("&&", _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "sx"), _S.read(_e, "xc"))]), _S.read(_e, "hw")), func(): return _S.binary(">", _S.read(_e, "act"), 0.08))):
		var _v37 = _S.scope(_e)
		_S.define(_v37, "fx", _S.binary("/", _S.binary("-", _S.read(_v37, "sx"), _S.read(_v37, "xc")), _S.read(_v37, "act")))
		_S.define(_v37, "fy", _S.read(_v37, "sy"))
		_S.define(_v37, "d", _S.binary("/", _S.invoke(_S.read(_v37, "Math"), "hypot", [_S.read(_v37, "fx"), _S.read(_v37, "fy")]), _S.read(_v37, "r")))
		_S.define(_v37, "tx", _S.binary("+", _S.read(_v37, "nfx"), _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v37, "fx"), _S.read(_v37, "r")), 0.3), _S.read(_v37, "act"))))
		_S.define(_v37, "sp", _S.invoke(_S.read(_v37, "Math"), "pow", [_S.invoke(_S.read(_v37, "Math"), "max", [0, _S.binary("/", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_v37, "tx"), _S.read(_v37, "Hx")), _S.binary("*", _S.read(_v37, "act"), _S.read(_v37, "Hz"))), _S.read(_v37, "Hn")), _S.invoke(_S.read(_v37, "Math"), "hypot", [_S.read(_v37, "tx"), _S.read(_v37, "act")]))]), 130]))
		_S.write(_v37, "flash", _S.invoke(_S.read(_v37, "Math"), "max", [_S.read(_v37, "flash"), _S.read(_v37, "sp")]), "=", false)
		_S.define(_v37, "lit", _S.binary("/", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v37, "fx")), 0.6), _S.binary("*", _S.read(_v37, "fy"), 0.8)), _S.invoke(_S.read(_v37, "Math"), "max", [0.5, _S.invoke(_S.read(_v37, "Math"), "hypot", [_S.read(_v37, "fx"), _S.read(_v37, "fy")])])))
		_S.define(_v37, "k", null)
		if _S.truth(_S.binary(">", _S.read(_v37, "d"), 0.76)):
			_S.write(_v37, "k", _S.binary("+", _S.read(_v37, "base"), (2 if _S.truth(_S.binary(">", _S.read(_v37, "lit"), 0.75)) else (1 if _S.truth(_S.binary(">", _S.read(_v37, "lit"), 0.3)) else (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.read(_v37, "lit"), _S.unary("-", 0.35))) else 0)))), "=", false)
		else:
			var _v38 = _S.scope(_v37)
			_S.define(_v38, "q", _S.binary("/", _S.binary("+", _S.invoke(_S.read(_v38, "Math"), "abs", [_S.read(_v38, "fx")]), _S.invoke(_S.read(_v38, "Math"), "abs", [_S.read(_v38, "fy")])), _S.binary("*", _S.read(_v38, "r"), 0.52)))
			_S.write(_v38, "k", (_S.binary("-", _S.read(_v38, "base"), 1) if _S.truth(_S.binary(">=", _S.read(_v38, "q"), 1)) else (_S.binary("+", _S.read(_v38, "base"), 1) if _S.truth(_S.binary("<", _S.read(_v38, "q"), 0.45)) else (_S.binary("+", _S.read(_v38, "base"), 1) if _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_v38, "fx"), 0), func(): return _S.binary(">=", _S.read(_v38, "fy"), 0))) else (_S.binary("-", _S.read(_v38, "base"), 2) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v38, "fx"), 0), func(): return _S.binary("<", _S.read(_v38, "fy"), 0))) else _S.read(_v38, "base"))))), "=", false)
		if _S.truth(_S.binary(">", _S.read(_v37, "sp"), 0.5)):
			return (_S.read(_v37, "WHITE") if _S.truth(_S.binary(">", _S.read(_v37, "sp"), 0.8)) else _S.prop(_S.read(_v37, "C"), _S.invoke(_S.read(_v37, "Math"), "min", [7, _S.binary("+", _S.read(_v37, "k"), 2)])))
		return _S.prop(_S.read(_v37, "C"), _S.invoke(_S.read(_v37, "Math"), "max", [2, _S.invoke(_S.read(_v37, "Math"), "min", [6, _S.read(_v37, "k")])]))
	if _S.truth(_S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "sx"), _S.read(_e, "xr"))]), _S.binary("+", _S.read(_e, "rw"), 0.05))):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "cphi", (_S.unary("-", _S.read(_v39, "s")) if _S.truth(_S.binary("<", _S.read(_v39, "xr"), 0)) else _S.read(_v39, "s")))
		_S.define(_v39, "n", [_S.binary("*", _S.read(_v39, "cphi"), _S.read(_v39, "ct")), _S.binary("/", _S.read(_v39, "sy"), _S.read(_v39, "r")), _S.binary("*", _S.unary("-", _S.read(_v39, "cphi")), _S.read(_v39, "st"))])
		_S.define(_v39, "l", _S.binary("/", _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v39, "n"), 0), _S.read(_v39, "Lx")), _S.binary("*", _S.prop(_S.read(_v39, "n"), 1), _S.read(_v39, "Ly"))), _S.binary("*", _S.prop(_S.read(_v39, "n"), 2), _S.read(_v39, "Lz"))), _S.read(_v39, "Ln")))
		_S.define(_v39, "groove", _S.binary("%", _S.invoke(_S.read(_v39, "Math"), "floor", [_S.binary("*", _S.binary("+", _S.invoke(_S.read(_v39, "Math"), "asin", [_S.binary("/", _S.read(_v39, "sy"), _S.read(_v39, "r"))]), _S.prop(_S.read(_v39, "Math"), "PI")), 9)]), 2))
		_S.define(_v39, "edge", _S.logical("&&", _S.binary(">", _S.invoke(_S.read(_v39, "Math"), "abs", [_S.binary("-", _S.read(_v39, "sx"), _S.read(_v39, "xr"))]), _S.binary("-", _S.read(_v39, "rw"), 0.6)), func(): return _S.binary("===", _S.invoke(_S.read(_v39, "Math"), "sign", [_S.binary("-", _S.read(_v39, "sx"), _S.read(_v39, "xr"))]), _S.invoke(_S.read(_v39, "Math"), "sign", [_S.binary("-", _S.read(_v39, "xc"), _S.read(_v39, "xr"))]))))
		return _S.prop(_S.read(_v39, "C"), _S.invoke(_S.read(_v39, "Math"), "max", [1, _S.invoke(_S.read(_v39, "Math"), "min", [6, _S.binary("+", _S.binary("-", _S.invoke(_S.read(_v39, "Math"), "round", [_S.binary("+", 2.6, _S.binary("*", _S.read(_v39, "l"), 2.6))]), _S.read(_v39, "groove")), (1 if _S.truth(_S.read(_v39, "edge")) else 0))])]))
	return 0

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "w", _S.coalesce(_S.arg(_args, 0), func(): return 64))
	_S.define(_e, "h", _S.coalesce(_S.arg(_args, 1), func(): return 64))
	_S.set_prop(_S.read(_e, "this"), "f", _S.call_value(_S.read(_e, "createFrame"), [_S.read(_e, "w"), _S.read(_e, "h")]), "=", false)
	_S.set_prop(_S.read(_e, "this"), "q", _S.construct(_S.read(_e, "Painter"), [_S.prop(_S.read(_e, "this"), "f")]), "=", false)
	_S.set_prop(_S.read(_e, "this"), "tmp", _S.construct(_S.read(_e, "Uint32Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "h"))]), "=", false)
	return null

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x0", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	_S.define(_e, "f", _S.prop(_S.read(_e, "this"), "f"))
	_S.set_prop(_S.read(_e, "f"), "ox", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x0")]), "=", false)
	_S.set_prop(_S.read(_e, "f"), "oy", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y0")]), "=", false)
	_S.invoke(_S.prop(_S.read(_e, "f"), "color"), "fill", [0])
	_S.invoke(_S.prop(_S.read(_e, "f"), "light"), "fill", [0])
	return _S.invoke(_S.invoke(_S.prop(_S.read(_e, "this"), "q"), "reset", []), "place", [0, 0])

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "f", _S.prop(_S.read(_e, "this"), "f"))
	_S.define(_e, "i", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), _S.prop(_S.read(_e, "f"), "ox")))
	_S.define(_e, "j", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), _S.prop(_S.read(_e, "f"), "oy")))
	return (_S.unary("-", 1) if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "i"), 0), func(): return _S.binary("<", _S.read(_e, "j"), 0)), func(): return _S.binary(">=", _S.read(_e, "i"), _S.prop(_S.read(_e, "f"), "w"))), func(): return _S.binary(">=", _S.read(_e, "j"), _S.prop(_S.read(_e, "f"), "h")))) else _S.binary("+", _S.binary("*", _S.read(_e, "j"), _S.prop(_S.read(_e, "f"), "w")), _S.read(_e, "i")))

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "this"), "idx", [_S.read(_e, "x"), _S.read(_e, "y")]))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "i"), 0)) else _S.prop(_S.prop(_S.prop(_S.read(_e, "this"), "f"), "color"), _S.read(_e, "i")))

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "this"), "idx", [_S.read(_e, "x"), _S.read(_e, "y")]))
	if _S.truth(_S.binary(">=", _S.read(_e, "i"), 0)):
		_S.set_prop(_S.prop(_S.prop(_S.read(_e, "this"), "f"), "color"), _S.read(_e, "i"), _S.read(_e, "c"), "=", false)
	return null

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x0", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	_S.define(_e, "x1", _S.arg(_args, 2))
	_S.define(_e, "y1", _S.arg(_args, 3))
	_S.define(_e, "fn", _S.arg(_args, 4))
	var _v40 = _S.scope(_e)
	_S.define(_v40, "y", _S.invoke(_S.read(_v40, "Math"), "floor", [_S.read(_v40, "y0")]))
	while _S.truth(_S.binary("<=", _S.read(_v40, "y"), _S.read(_v40, "y1"))):
		var _v41 = _S.scope(_v40)
		_S.define(_v41, "x", _S.invoke(_S.read(_v41, "Math"), "floor", [_S.read(_v41, "x0")]))
		while _S.truth(_S.binary("<=", _S.read(_v41, "x"), _S.read(_v41, "x1"))):
			var _v42 = _S.scope(_v41)
			_S.define(_v42, "c", _S.call_value(_S.read(_v42, "fn"), [_S.binary("+", _S.read(_v42, "x"), 0.5), _S.binary("+", _S.read(_v42, "y"), 0.5)]))
			if _S.truth(_S.read(_v42, "c")):
				_S.invoke(_S.read(_v42, "this"), "set", [_S.read(_v42, "x"), _S.read(_v42, "y"), _S.read(_v42, "c")])
			_v41 = _S.iteration(_v41)
			_S.write(_v41, "x", 1, "+=", true)
		_v40 = _S.iteration(_v40)
		_S.write(_v40, "y", 1, "+=", true)
	return null

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "corners", _S.coalesce(_S.arg(_args, 1), func(): return false))
	_S.define(_e, "f", _S.prop(_S.read(_e, "this"), "f"))
	_S.define(_e, "C", _S.prop(_S.read(_e, "f"), "color"))
	_S.define(_e, "T", _S.prop(_S.read(_e, "this"), "tmp"))
	_S.define(_e, "w", _S.prop(_S.read(_e, "f"), "w"))
	_S.define(_e, "h", _S.prop(_S.read(_e, "f"), "h"))
	_S.invoke(_S.read(_e, "T"), "fill", [0])
	var _v43 = _S.scope(_e)
	_S.define(_v43, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v43, "j"), _S.read(_v43, "h"))):
		var _v44 = _S.scope(_v43)
		_S.define(_v44, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v44, "i"), _S.read(_v44, "w"))):
			var _v45 = _S.scope(_v44)
			_S.define(_v45, "k", _S.binary("+", _S.binary("*", _S.read(_v45, "j"), _S.read(_v45, "w")), _S.read(_v45, "i")))
			if _S.truth(_S.prop(_S.read(_v45, "C"), _S.read(_v45, "k"))):
				_v44 = _S.iteration(_v44)
				_S.write(_v44, "i", 1, "+=", true)
				continue
			_S.define(_v45, "n", _S.logical("||", _S.logical("||", _S.logical("||", _S.logical("&&", _S.binary(">", _S.read(_v45, "i"), 0), func(): return _S.prop(_S.read(_v45, "C"), _S.binary("-", _S.read(_v45, "k"), 1))), func(): return _S.logical("&&", _S.binary("<", _S.read(_v45, "i"), _S.binary("-", _S.read(_v45, "w"), 1)), func(): return _S.prop(_S.read(_v45, "C"), _S.binary("+", _S.read(_v45, "k"), 1)))), func(): return _S.logical("&&", _S.binary(">", _S.read(_v45, "j"), 0), func(): return _S.prop(_S.read(_v45, "C"), _S.binary("-", _S.read(_v45, "k"), _S.read(_v45, "w"))))), func(): return _S.logical("&&", _S.binary("<", _S.read(_v45, "j"), _S.binary("-", _S.read(_v45, "h"), 1)), func(): return _S.prop(_S.read(_v45, "C"), _S.binary("+", _S.read(_v45, "k"), _S.read(_v45, "w"))))))
			if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v45, "n")), func(): return _S.read(_v45, "corners"))):
				_S.write(_v45, "n", _S.logical("||", _S.logical("||", _S.logical("||", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v45, "i"), 0), func(): return _S.binary(">", _S.read(_v45, "j"), 0)), func(): return _S.prop(_S.read(_v45, "C"), _S.binary("-", _S.binary("-", _S.read(_v45, "k"), _S.read(_v45, "w")), 1))), func(): return _S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v45, "i"), _S.binary("-", _S.read(_v45, "w"), 1)), func(): return _S.binary(">", _S.read(_v45, "j"), 0)), func(): return _S.prop(_S.read(_v45, "C"), _S.binary("+", _S.binary("-", _S.read(_v45, "k"), _S.read(_v45, "w")), 1)))), func(): return _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v45, "i"), 0), func(): return _S.binary("<", _S.read(_v45, "j"), _S.binary("-", _S.read(_v45, "h"), 1))), func(): return _S.prop(_S.read(_v45, "C"), _S.binary("-", _S.binary("+", _S.read(_v45, "k"), _S.read(_v45, "w")), 1)))), func(): return _S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v45, "i"), _S.binary("-", _S.read(_v45, "w"), 1)), func(): return _S.binary("<", _S.read(_v45, "j"), _S.binary("-", _S.read(_v45, "h"), 1))), func(): return _S.prop(_S.read(_v45, "C"), _S.binary("+", _S.binary("+", _S.read(_v45, "k"), _S.read(_v45, "w")), 1)))), "=", false)
			if _S.truth(_S.read(_v45, "n")):
				_S.set_prop(_S.read(_v45, "T"), _S.read(_v45, "k"), (_S.call_value(_S.read(_v45, "c"), [_S.binary("+", _S.read(_v45, "i"), _S.prop(_S.read(_v45, "f"), "ox")), _S.binary("+", _S.read(_v45, "j"), _S.prop(_S.read(_v45, "f"), "oy")), _S.read(_v45, "n")]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_v45, "c")), "function")) else _S.read(_v45, "c")), "=", false)
			_v44 = _S.iteration(_v44)
			_S.write(_v44, "i", 1, "+=", true)
		_v43 = _S.iteration(_v43)
		_S.write(_v43, "j", 1, "+=", true)
	var _v46 = _S.scope(_e)
	_S.define(_v46, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v46, "k"), _S.binary("*", _S.read(_v46, "w"), _S.read(_v46, "h")))):
		if _S.truth(_S.prop(_S.read(_v46, "T"), _S.read(_v46, "k"))):
			_S.set_prop(_S.read(_v46, "C"), _S.read(_v46, "k"), _S.prop(_S.read(_v46, "T"), _S.read(_v46, "k")), "=", false)
		_v46 = _S.iteration(_v46)
		_S.write(_v46, "k", 1, "+=", true)
	return _S.read(_e, "this")

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "fn", _S.arg(_args, 0))
	_S.define(_e, "f", _S.prop(_S.read(_e, "this"), "f"))
	_S.define(_e, "C", _S.prop(_S.read(_e, "f"), "color"))
	var _v47 = _S.scope(_e)
	_S.define(_v47, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v47, "k"), _S.prop(_S.read(_v47, "C"), "length"))):
		if _S.truth(_S.prop(_S.read(_v47, "C"), _S.read(_v47, "k"))):
			_S.set_prop(_S.read(_v47, "C"), _S.read(_v47, "k"), _S.logical("||", _S.call_value(_S.read(_v47, "fn"), [_S.binary("+", _S.binary("%", _S.read(_v47, "k"), _S.prop(_S.read(_v47, "f"), "w")), _S.prop(_S.read(_v47, "f"), "ox")), _S.binary("+", _S.invoke(_S.read(_v47, "Math"), "floor", [_S.binary("/", _S.read(_v47, "k"), _S.prop(_S.read(_v47, "f"), "w"))]), _S.prop(_S.read(_v47, "f"), "oy")), _S.prop(_S.read(_v47, "C"), _S.read(_v47, "k"))]), func(): return _S.prop(_S.read(_v47, "C"), _S.read(_v47, "k"))), "=", false)
		_v47 = _S.iteration(_v47)
		_S.write(_v47, "k", 1, "+=", true)
	return _S.read(_e, "this")

static func _f31(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "dx", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	_S.define(_e, "dy", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 3), func(): return 1))
	_S.define(_e, "clip", _S.coalesce(_S.arg(_args, 4), func(): return null))
	_S.define(_e, "f", _S.prop(_S.read(_e, "this"), "f"))
	_S.define(_e, "C", _S.prop(_S.read(_e, "f"), "color"))
	var _v48 = _S.scope(_e)
	_S.define(_v48, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v48, "k"), _S.prop(_S.read(_v48, "C"), "length"))):
		var _v49 = _S.scope(_v48)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v49, "C"), _S.read(_v49, "k")))):
			_v48 = _S.iteration(_v48)
			_S.write(_v48, "k", 1, "+=", true)
			continue
		_S.define(_v49, "x", _S.binary("+", _S.binary("+", _S.binary("%", _S.read(_v49, "k"), _S.prop(_S.read(_v49, "f"), "w")), _S.prop(_S.read(_v49, "f"), "ox")), _S.read(_v49, "dx")))
		if _S.truth(_S.logical("&&", _S.read(_v49, "clip"), func(): return _S.logical("||", _S.binary("<", _S.read(_v49, "x"), _S.prop(_S.read(_v49, "clip"), 0)), func(): return _S.binary(">=", _S.read(_v49, "x"), _S.prop(_S.read(_v49, "clip"), 1))))):
			_v48 = _S.iteration(_v48)
			_S.write(_v48, "k", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v49, "p"), "dot", [_S.read(_v49, "x"), _S.binary("+", _S.binary("+", _S.invoke(_S.read(_v49, "Math"), "floor", [_S.binary("/", _S.read(_v49, "k"), _S.prop(_S.read(_v49, "f"), "w"))]), _S.prop(_S.read(_v49, "f"), "oy")), _S.read(_v49, "dy")), _S.prop(_S.read(_v49, "C"), _S.read(_v49, "k")), _S.read(_v49, "a")])
		_v48 = _S.iteration(_v48)
		_S.write(_v48, "k", 1, "+=", true)
	return _S.read(_e, "this")

static func _f32(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ph", _S.arg(_args, 0))
	_S.define(_e, "amp", _S.arg(_args, 1))
	_S.define(_e, "n", _S.coalesce(_S.arg(_args, 2), func(): return 1))
	_S.define(_e, "off", _S.coalesce(_S.arg(_args, 3), func(): return 0))
	return _S.binary("*", _S.unary("-", _S.read(_e, "amp")), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("+", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "n")), _S.read(_e, "off")), _S.read(_e, "TAU"))]))
