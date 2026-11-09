@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "GRAVITY", _S.import_value("core/index.js", "GRAVITY"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "inPoly", _S.function_value(_e, "_f0"))
	_S.define(_e, "centroid", _S.function_value(_e, "_f1"))
	_S.define(_e, "splitPoly", _S.function_value(_e, "_f4"))
	_S.define(_e, "iceOf", _S.function_value(_e, "_f7"))
	_S.define(_e, "glassPoly", _S.function_value(_e, "_f8"))
	_S.define(_e, "blade", _S.function_value(_e, "_f9"))
	_S.define(_e, "flakeDesign", _S.function_value(_e, "_f15"))
	_S.define(_e, "snowflake", _S.function_value(_e, "_f16"))
	_S.define(_e, "endBy", _S.function_value(_e, "_f17"))
	_S.define(_e, "fractures", _S.function_value(_e, "_f18"))
	_S.define(_e, "drawFractures", _S.function_value(_e, "_f20"))
	_exports["inPoly"] = _S.read(_e, "inPoly")
	_exports["centroid"] = _S.read(_e, "centroid")
	_exports["splitPoly"] = _S.read(_e, "splitPoly")
	_exports["iceOf"] = _S.read(_e, "iceOf")
	_exports["glassPoly"] = _S.read(_e, "glassPoly")
	_S.define(_e, "Panes", _S.class_value("Panes", _S.function_value(_e, "_f22"), {"add": _S.function_value(_e, "_f24"), "corners": _S.function_value(_e, "_f26"), "seat": _S.function_value(_e, "_f28"), "update": _S.function_value(_e, "_f29"), "draw": _S.function_value(_e, "_f30")}, {"count": _S.function_value(_e, "_f25")}, {}, null))
	_exports["Panes"] = _S.read(_e, "Panes")
	_exports["blade"] = _S.read(_e, "blade")
	_exports["flakeDesign"] = _S.read(_e, "flakeDesign")
	_exports["snowflake"] = _S.read(_e, "snowflake")
	_exports["endBy"] = _S.read(_e, "endBy")
	_exports["fractures"] = _S.read(_e, "fractures")
	_exports["drawFractures"] = _S.read(_e, "drawFractures")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "inside", false)
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	_S.define(_v0, "j", _S.binary("-", _S.prop(_S.read(_v0, "pts"), "length"), 1))
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.prop(_S.read(_v0, "pts"), "length"))):
		var _v1 = _S.scope(_v0)
		var _v2 = _S.prop(_S.read(_v1, "pts"), _S.read(_v1, "i"))
		_S.define(_v1, "xi", _S.prop(_v2, 0))
		_S.define(_v1, "yi", _S.prop(_v2, 1))
		var _v3 = _S.prop(_S.read(_v1, "pts"), _S.read(_v1, "j"))
		_S.define(_v1, "xj", _S.prop(_v3, 0))
		_S.define(_v1, "yj", _S.prop(_v3, 1))
		if _S.truth(_S.logical("&&", _S.binary("!==", _S.binary(">", _S.read(_v1, "yi"), _S.read(_v1, "y")), _S.binary(">", _S.read(_v1, "yj"), _S.read(_v1, "y"))), func(): return _S.binary("<", _S.read(_v1, "x"), _S.binary("+", _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v1, "xj"), _S.read(_v1, "xi")), _S.binary("-", _S.read(_v1, "y"), _S.read(_v1, "yi"))), _S.binary("-", _S.read(_v1, "yj"), _S.read(_v1, "yi"))), _S.read(_v1, "xi"))))):
			_S.write(_v1, "inside", _S.unary("!", _S.read(_v1, "inside")), "=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "j", _S.write(_v0, "i", 1, "+=", true), "=", false)
	return _S.read(_e, "inside")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "a", 0)
	_S.define(_e, "cx", 0)
	_S.define(_e, "cy", 0)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	_S.define(_v4, "j", _S.binary("-", _S.prop(_S.read(_v4, "pts"), "length"), 1))
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), _S.prop(_S.read(_v4, "pts"), "length"))):
		var _v5 = _S.scope(_v4)
		var _v6 = _S.prop(_S.read(_v5, "pts"), _S.read(_v5, "j"))
		_S.define(_v5, "x0", _S.prop(_v6, 0))
		_S.define(_v5, "y0", _S.prop(_v6, 1))
		var _v7 = _S.prop(_S.read(_v5, "pts"), _S.read(_v5, "i"))
		_S.define(_v5, "x1", _S.prop(_v7, 0))
		_S.define(_v5, "y1", _S.prop(_v7, 1))
		_S.define(_v5, "k", _S.binary("-", _S.binary("*", _S.read(_v5, "x0"), _S.read(_v5, "y1")), _S.binary("*", _S.read(_v5, "x1"), _S.read(_v5, "y0"))))
		_S.write(_v5, "a", _S.read(_v5, "k"), "+=", false)
		_S.write(_v5, "cx", _S.binary("*", _S.binary("+", _S.read(_v5, "x0"), _S.read(_v5, "x1")), _S.read(_v5, "k")), "+=", false)
		_S.write(_v5, "cy", _S.binary("*", _S.binary("+", _S.read(_v5, "y0"), _S.read(_v5, "y1")), _S.read(_v5, "k")), "+=", false)
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "j", _S.write(_v4, "i", 1, "+=", true), "=", false)
	if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "a")]), 0.000001)):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "n", _S.prop(_S.read(_v8, "pts"), "length"))
		return _S.merge([{"x": _S.binary("/", _S.invoke(_S.read(_v8, "pts"), "reduce", [_S.function_value(_v8, "_f2"), 0]), _S.read(_v8, "n"))}, {"y": _S.binary("/", _S.invoke(_S.read(_v8, "pts"), "reduce", [_S.function_value(_v8, "_f3"), 0]), _S.read(_v8, "n"))}, {"area": 0}])
	return _S.merge([{"x": _S.binary("/", _S.read(_e, "cx"), _S.binary("*", 3, _S.read(_e, "a")))}, {"y": _S.binary("/", _S.read(_e, "cy"), _S.binary("*", 3, _S.read(_e, "a")))}, {"area": _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "a")]), 2)}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("+", _S.read(_e, "s"), _S.prop(_S.read(_e, "q"), 0))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("+", _S.read(_e, "s"), _S.prop(_S.read(_e, "q"), 1))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "nx", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")])))
	_S.define(_e, "ny", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))
	_S.define(_e, "side", _S.function_value(_e, "_f5"))
	_S.define(_e, "L", [])
	_S.define(_e, "Rt", [])
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), _S.prop(_S.read(_v9, "pts"), "length"))):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "p", _S.prop(_S.read(_v10, "pts"), _S.read(_v10, "i")))
		_S.define(_v10, "q", _S.prop(_S.read(_v10, "pts"), _S.binary("%", _S.binary("+", _S.read(_v10, "i"), 1), _S.prop(_S.read(_v10, "pts"), "length"))))
		_S.define(_v10, "sp", _S.call_value(_S.read(_v10, "side"), [_S.read(_v10, "p")]))
		_S.define(_v10, "sq", _S.call_value(_S.read(_v10, "side"), [_S.read(_v10, "q")]))
		_S.invoke((_S.read(_v10, "L") if _S.truth(_S.binary(">=", _S.read(_v10, "sp"), 0)) else _S.read(_v10, "Rt")), "push", [_S.read(_v10, "p")])
		if _S.truth(_S.binary("!==", _S.binary(">=", _S.read(_v10, "sp"), 0), _S.binary(">=", _S.read(_v10, "sq"), 0))):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "u", _S.binary("/", _S.read(_v11, "sp"), _S.binary("-", _S.read(_v11, "sp"), _S.read(_v11, "sq"))))
			_S.define(_v11, "m", [_S.binary("+", _S.prop(_S.read(_v11, "p"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v11, "q"), 0), _S.prop(_S.read(_v11, "p"), 0)), _S.read(_v11, "u"))), _S.binary("+", _S.prop(_S.read(_v11, "p"), 1), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v11, "q"), 1), _S.prop(_S.read(_v11, "p"), 1)), _S.read(_v11, "u")))])
			_S.invoke(_S.read(_v11, "L"), "push", [_S.read(_v11, "m")])
			_S.invoke(_S.read(_v11, "Rt"), "push", [_S.read(_v11, "m")])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	return _S.invoke([_S.read(_e, "L"), _S.read(_e, "Rt")], "filter", [_S.function_value(_e, "_f6")])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("*", _S.binary("-", _S.prop(_S.read(_e, "q"), 0), _S.read(_e, "x")), _S.read(_e, "nx")), _S.binary("*", _S.binary("-", _S.prop(_S.read(_e, "q"), 1), _S.read(_e, "y")), _S.read(_e, "ny")))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.binary(">=", _S.prop(_S.read(_e, "s"), "length"), 3)

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "n", _S.prop(_S.read(_e, "C"), "length"))
	_S.define(_e, "l", _S.call_value(_S.read(_e, "luma"), [_S.read(_e, "c")]))
	return _S.prop(_S.read(_e, "C"), _S.call_value(_S.read(_e, "clamp"), [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("/", _S.binary("*", (2 if _S.truth(_S.binary("<", _S.read(_e, "l"), 0.12)) else _S.binary("+", 2, _S.binary("*", _S.read(_e, "l"), 5.2))), _S.binary("-", _S.read(_e, "n"), 1)), 7)]), 1, _S.binary("-", _S.read(_e, "n"), 1)]))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "pts", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "x0", INF)
	_S.define(_e, "y0", INF)
	_S.define(_e, "x1", _S.unary("-", INF))
	_S.define(_e, "y1", _S.unary("-", INF))
	for _v12 in _S.array(_S.read(_e, "pts")):
		var _v13 = _S.scope(_e)
		var _v14 = _v12
		_S.define(_v13, "x", _S.prop(_v14, 0))
		_S.define(_v13, "y", _S.prop(_v14, 1))
		_S.last([_S.write(_v13, "x0", _S.invoke(_S.read(_v13, "Math"), "min", [_S.read(_v13, "x0"), _S.read(_v13, "x")]), "=", false), _S.write(_v13, "x1", _S.invoke(_S.read(_v13, "Math"), "max", [_S.read(_v13, "x1"), _S.read(_v13, "x")]), "=", false), _S.write(_v13, "y0", _S.invoke(_S.read(_v13, "Math"), "min", [_S.read(_v13, "y0"), _S.read(_v13, "y")]), "=", false), _S.write(_v13, "y1", _S.invoke(_S.read(_v13, "Math"), "max", [_S.read(_v13, "y1"), _S.read(_v13, "y")]), "=", false)])
	var _v15 = _S.scope(_e)
	_S.define(_v15, "y", _S.invoke(_S.read(_v15, "Math"), "floor", [_S.read(_v15, "y0")]))
	while _S.truth(_S.binary("<=", _S.read(_v15, "y"), _S.invoke(_S.read(_v15, "Math"), "ceil", [_S.read(_v15, "y1")]))):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "x", _S.invoke(_S.read(_v16, "Math"), "floor", [_S.read(_v16, "x0")]))
		while _S.truth(_S.binary("<=", _S.read(_v16, "x"), _S.invoke(_S.read(_v16, "Math"), "ceil", [_S.read(_v16, "x1")]))):
			if _S.truth(_S.call_value(_S.read(_v16, "inPoly"), [_S.read(_v16, "pts"), _S.binary("+", _S.read(_v16, "x"), 0.5), _S.binary("+", _S.read(_v16, "y"), 0.5)])):
				_S.invoke(_S.read(_v16, "p"), "blend", [_S.read(_v16, "x"), _S.read(_v16, "y"), _S.read(_v16, "c"), _S.read(_v16, "a")])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "x", 1, "+=", true)
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "y", 1, "+=", true)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "bx", _S.arg(_args, 1))
	_S.define(_e, "by", _S.arg(_args, 2))
	_S.define(_e, "tx", _S.arg(_args, 3))
	_S.define(_e, "ty", _S.arg(_args, 4))
	_S.define(_e, "w", _S.arg(_args, 5))
	_S.define(_e, "C", _S.arg(_args, 6))
	_S.define(_e, "opts", _S.coalesce(_S.arg(_args, 7), func(): return _S.merge([])))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "tx"), _S.read(_e, "bx")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "ty"), _S.read(_e, "by")))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "L"), 1.5), func(): return _S.binary("<", _S.read(_e, "w"), 0.5))):
		return null
	_S.define(_e, "ux", _S.binary("/", _S.read(_e, "dx"), _S.read(_e, "L")))
	_S.define(_e, "uy", _S.binary("/", _S.read(_e, "dy"), _S.read(_e, "L")))
	_S.define(_e, "nx", _S.unary("-", _S.read(_e, "uy")))
	_S.define(_e, "ny", _S.read(_e, "ux"))
	_S.define(_e, "a", _S.logical("??", _S.prop(_S.read(_e, "opts"), "a"), func(): return 1))
	_S.define(_e, "dim", _S.logical("??", _S.prop(_S.read(_e, "opts"), "dim"), func(): return 0))
	_S.define(_e, "jag", _S.logical("??", _S.prop(_S.read(_e, "opts"), "jag"), func(): return _S.unary("-", 1)))
	_S.define(_e, "glint", _S.logical("??", _S.prop(_S.read(_e, "opts"), "glint"), func(): return _S.unary("-", 1)))
	_S.define(_e, "K", _S.function_value(_e, "_f10"))
	_S.define(_e, "hw", _S.binary("/", _S.read(_e, "w"), 2))
	_S.define(_e, "left", _S.function_value(_e, "_f11"))
	_S.define(_e, "right", _S.function_value(_e, "_f12"))
	_S.define(_e, "ridge", _S.function_value(_e, "_f13"))
	_S.define(_e, "pad", _S.binary("+", _S.read(_e, "hw"), 2))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "bx"), _S.read(_e, "tx")]), _S.read(_e, "pad")), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "by"), _S.read(_e, "ty")]), _S.read(_e, "pad")), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "bx"), _S.read(_e, "tx")]), _S.read(_e, "pad")), _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "by"), _S.read(_e, "ty")]), _S.function_value(_e, "_f14")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "C"), _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", _S.read(_e, "i"), _S.read(_e, "dim")), 0, _S.binary("-", _S.prop(_S.read(_e, "C"), "length"), 1)]))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("*", _S.read(_e, "hw"), _S.binary("-", 1, _S.read(_e, "u"))), 0.35)

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "hw"), _S.binary("-", 1, _S.read(_e, "u"))), (0.55 if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "jag"), 0), func(): return _S.binary(">", _S.read(_e, "u"), _S.read(_e, "jag")))) else 1)), 0.35)

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.unary("-", _S.read(_e, "w")), 0.12), _S.binary("-", 1, _S.read(_e, "u")))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "rx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "bx")))
	_S.define(_e, "ry", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "by")))
	_S.define(_e, "u", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_e, "rx"), _S.read(_e, "ux")), _S.binary("*", _S.read(_e, "ry"), _S.read(_e, "uy"))), _S.read(_e, "L")))
	_S.define(_e, "s", _S.binary("+", _S.binary("*", _S.read(_e, "rx"), _S.read(_e, "nx")), _S.binary("*", _S.read(_e, "ry"), _S.read(_e, "ny"))))
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0)):
		return null
	_S.define(_e, "l", _S.call_value(_S.read(_e, "left"), [_S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "u"), 1])]))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "right"), [_S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "u"), 1])]))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.read(_e, "u"), 1), func(): return _S.binary("<", _S.read(_e, "s"), _S.unary("-", _S.read(_e, "l")))), func(): return _S.binary(">", _S.read(_e, "s"), _S.read(_e, "r")))):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "over", (_S.binary("*", _S.binary("-", _S.read(_v17, "u"), 1), _S.read(_v17, "L")) if _S.truth(_S.binary(">", _S.read(_v17, "u"), 1)) else 0))
		_S.define(_v17, "out", _S.invoke(_S.read(_v17, "Math"), "max", [_S.read(_v17, "over"), (_S.binary("-", _S.unary("-", _S.read(_v17, "l")), _S.read(_v17, "s")) if _S.truth(_S.binary("<", _S.read(_v17, "s"), _S.unary("-", _S.read(_v17, "l")))) else _S.binary("-", _S.read(_v17, "s"), _S.read(_v17, "r")))]))
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v17, "out"), 1), func(): return _S.binary("<", _S.read(_v17, "u"), _S.binary("+", 1, _S.binary("/", 1, _S.read(_v17, "L")))))):
			var _v18 = _S.scope(_v17)
			_S.set_prop(_S.read(_v18, "o"), "c", _S.call_value(_S.read(_v18, "K"), [0]), "=", false)
			_S.set_prop(_S.read(_v18, "o"), "a", _S.read(_v18, "a"), "=", false)
		return null
	_S.set_prop(_S.read(_e, "o"), "a", _S.read(_e, "a"), "=", false)
	if _S.truth(_S.prop(_S.read(_e, "opts"), "white")):
		return _S.set_prop(_S.read(_e, "o"), "c", _S.read(_e, "WHITE"), "=", false)
	_S.define(_e, "rd", _S.call_value(_S.read(_e, "ridge"), [_S.read(_e, "u")]))
	_S.define(_e, "c", null)
	if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.88)):
		_S.write(_e, "c", _S.read(_e, "WHITE"), "=", false)
	else:
		if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "s"), _S.read(_e, "rd"))]), 0.55)):
			_S.write(_e, "c", _S.call_value(_S.read(_e, "K"), [6]), "=", false)
		else:
			if _S.truth(_S.binary("<", _S.read(_e, "s"), _S.read(_e, "rd"))):
				_S.write(_e, "c", (_S.call_value(_S.read(_e, "K"), [6]) if _S.truth(_S.binary("<", _S.binary("+", _S.read(_e, "s"), _S.read(_e, "l")), 1)) else (_S.call_value(_S.read(_e, "K"), [5]) if _S.truth(_S.binary(">", _S.binary("/", _S.binary("+", _S.read(_e, "s"), _S.read(_e, "l")), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("+", _S.read(_e, "rd"), _S.read(_e, "l"))])), 0.55)) else _S.call_value(_S.read(_e, "K"), [4]))), "=", false)
			else:
				_S.write(_e, "c", (_S.call_value(_S.read(_e, "K"), [1]) if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "r"), _S.read(_e, "s")), 1.1)) else (_S.call_value(_S.read(_e, "K"), [2]) if _S.truth(_S.binary(">", _S.binary("/", _S.binary("-", _S.read(_e, "s"), _S.read(_e, "rd")), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("-", _S.read(_e, "r"), _S.read(_e, "rd"))])), 0.5)) else _S.call_value(_S.read(_e, "K"), [3]))), "=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "jag"), 0), func(): return _S.binary("<", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "u"), _S.read(_e, "jag"))]), _S.read(_e, "L")), 0.8)), func(): return _S.binary(">", _S.read(_e, "s"), _S.read(_e, "rd")))):
		_S.write(_e, "c", _S.call_value(_S.read(_e, "K"), [6]), "=", false)
	else:
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_e, "s"), _S.read(_e, "rd")), func(): return _S.binary("!==", _S.read(_e, "c"), _S.call_value(_S.read(_e, "K"), [6]))), func(): return _S.binary("<", _S.binary("%", _S.binary("^", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), 73856093), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), 19349663)), 997), 30))):
			_S.write(_e, "c", _S.call_value(_S.read(_e, "K"), [7]), "=", false)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "glint"), 0), func(): return _S.binary("<=", _S.read(_e, "s"), _S.binary("+", _S.read(_e, "rd"), 0.6)))):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "g", _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "abs", [_S.binary("-", _S.read(_v19, "u"), _S.read(_v19, "glint"))]), _S.read(_v19, "L")))
		if _S.truth(_S.binary("<", _S.read(_v19, "g"), 0.8)):
			_S.write(_v19, "c", _S.read(_v19, "WHITE"), "=", false)
		else:
			if _S.truth(_S.binary("<", _S.read(_v19, "g"), 1.8)):
				_S.write(_v19, "c", _S.call_value(_S.read(_v19, "K"), [6]), "=", false)
	_S.set_prop(_S.read(_e, "o"), "c", _S.read(_e, "c"), "=", false)
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "R"), "int", [1, 3]))
	_S.define(_e, "branches", [])
	var _v20 = _S.scope(_e)
	_S.define(_v20, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v20, "i"), _S.read(_v20, "n"))):
		_S.invoke(_S.read(_v20, "branches"), "push", [[_S.binary("+", 0.38, _S.binary("/", _S.binary("*", 0.4, _S.binary("+", _S.read(_v20, "i"), _S.invoke(_S.read(_v20, "R"), "range", [0.2, 0.8]))), _S.read(_v20, "n"))), _S.binary("*", _S.invoke(_S.read(_v20, "R"), "range", [0.24, 0.36]), _S.binary("-", 1, _S.binary("*", _S.read(_v20, "i"), 0.15)))]])
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "i", 1, "+=", true)
	return _S.merge([{"branches": _S.read(_e, "branches")}, {"plate": _S.invoke(_S.read(_e, "R"), "chance", [0.45])}, {"fork": _S.invoke(_S.read(_e, "R"), "chance", [0.45])}])

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "rot", _S.arg(_args, 4))
	_S.define(_e, "d", _S.arg(_args, 5))
	_S.define(_e, "C", _S.arg(_args, 6))
	_S.define(_e, "opts", _S.coalesce(_S.arg(_args, 7), func(): return _S.merge([])))
	_S.define(_e, "n", _S.prop(_S.read(_e, "C"), "length"))
	_S.define(_e, "a", _S.logical("??", _S.prop(_S.read(_e, "opts"), "a"), func(): return 1))
	_S.define(_e, "hot", _S.logical("??", _S.prop(_S.read(_e, "opts"), "hot"), func(): return 0))
	_S.write(_e, "rot", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("/", _S.read(_e, "rot"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 18))]), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 18)), "=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 1.2)):
		var _v21 = _S.scope(_e)
		_S.invoke(_S.read(_v21, "p"), "dot", [_S.read(_v21, "x"), _S.read(_v21, "y"), _S.read(_v21, "WHITE"), _S.read(_v21, "a")])
		return null
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 2.6)):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "pose", _S.binary("%", _S.invoke(_S.read(_v22, "Math"), "floor", [_S.binary("/", _S.binary("+", _S.binary("%", _S.read(_v22, "rot"), _S.binary("/", _S.prop(_S.read(_v22, "Math"), "PI"), 3)), _S.binary("/", _S.prop(_S.read(_v22, "Math"), "PI"), 3)), _S.binary("/", _S.prop(_S.read(_v22, "Math"), "PI"), 6))]), 2))
		_S.define(_v22, "pts", ([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]] if _S.truth(_S.read(_v22, "pose")) else [[1, 1], [_S.unary("-", 1), _S.unary("-", 1)], [1, _S.unary("-", 1)], [_S.unary("-", 1), 1]]))
		for _v23 in _S.array(_S.read(_v22, "pts")):
			var _v24 = _S.scope(_v22)
			var _v25 = _v23
			_S.define(_v24, "dx", _S.prop(_v25, 0))
			_S.define(_v24, "dy", _S.prop(_v25, 1))
			_S.invoke(_S.read(_v24, "p"), "dot", [_S.binary("+", _S.read(_v24, "x"), _S.read(_v24, "dx")), _S.binary("+", _S.read(_v24, "y"), _S.read(_v24, "dy")), (_S.read(_v24, "WHITE") if _S.truth(_S.binary(">", _S.read(_v24, "hot"), 0.5)) else _S.prop(_S.read(_v24, "C"), _S.binary("-", _S.read(_v24, "n"), 3))), _S.read(_v24, "a")])
		_S.invoke(_S.read(_v22, "p"), "dot", [_S.read(_v22, "x"), _S.read(_v22, "y"), _S.read(_v22, "WHITE"), _S.read(_v22, "a")])
		_S.invoke(_S.read(_v22, "p"), "glow", [_S.read(_v22, "x"), _S.read(_v22, "y"), 4, _S.prop(_S.read(_v22, "C"), _S.binary("-", _S.read(_v22, "n"), 3)), _S.binary("*", 0.2, _S.read(_v22, "a"))])
		return null
	_S.define(_e, "arm", (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "hot"), 0.5)) else _S.prop(_S.read(_e, "C"), _S.binary("-", _S.read(_e, "n"), 2))))
	_S.define(_e, "br", (_S.prop(_S.read(_e, "C"), _S.binary("-", _S.read(_e, "n"), 2)) if _S.truth(_S.binary(">", _S.read(_e, "hot"), 0.5)) else _S.prop(_S.read(_e, "C"), _S.binary("-", _S.read(_e, "n"), 3))))
	_S.define(_e, "big", _S.binary(">=", _S.read(_e, "r"), 7))
	_S.define(_e, "branches", ([] if _S.truth(_S.binary("<", _S.read(_e, "r"), 4)) else (_S.invoke(_S.prop(_S.read(_e, "d"), "branches"), "slice", [0, 2]) if _S.truth(_S.read(_e, "big")) else [[0.58, 0.36]])))
	var _v26 = _S.scope(_e)
	_S.define(_v26, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v26, "k"), 6)):
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "g", _S.binary("+", _S.read(_v27, "rot"), _S.binary("/", _S.binary("*", _S.read(_v27, "k"), _S.read(_v27, "TAU")), 6)))
		_S.define(_v27, "ca", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "g")]))
		_S.define(_v27, "sa", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "g")]))
		_S.invoke(_S.read(_v27, "p"), "line", [_S.read(_v27, "x"), _S.read(_v27, "y"), _S.binary("+", _S.read(_v27, "x"), _S.binary("*", _S.read(_v27, "ca"), _S.read(_v27, "r"))), _S.binary("+", _S.read(_v27, "y"), _S.binary("*", _S.read(_v27, "sa"), _S.read(_v27, "r"))), _S.read(_v27, "arm"), _S.read(_v27, "a")])
		for _v28 in _S.array(_S.read(_v27, "branches")):
			var _v29 = _S.scope(_v27)
			var _v30 = _v28
			_S.define(_v29, "u", _S.prop(_v30, 0))
			_S.define(_v29, "l", _S.prop(_v30, 1))
			var _v31 = _S.scope(_v29)
			_S.define(_v31, "bx", _S.binary("+", _S.read(_v31, "x"), _S.binary("*", _S.binary("*", _S.read(_v31, "ca"), _S.read(_v31, "r")), _S.read(_v31, "u"))))
			_S.define(_v31, "by", _S.binary("+", _S.read(_v31, "y"), _S.binary("*", _S.binary("*", _S.read(_v31, "sa"), _S.read(_v31, "r")), _S.read(_v31, "u"))))
			_S.define(_v31, "bl", _S.invoke(_S.read(_v31, "Math"), "max", [1, _S.binary("*", _S.read(_v31, "r"), _S.read(_v31, "l"))]))
			for _v32 in _S.array([_S.unary("-", 1), 1]):
				var _v33 = _S.scope(_v31)
				_S.define(_v33, "s", _v32)
				_S.invoke(_S.read(_v33, "p"), "line", [_S.read(_v33, "bx"), _S.read(_v33, "by"), _S.binary("+", _S.read(_v33, "bx"), _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "cos", [_S.binary("+", _S.read(_v33, "g"), _S.binary("/", _S.binary("*", _S.read(_v33, "s"), _S.prop(_S.read(_v33, "Math"), "PI")), 3))]), _S.read(_v33, "bl"))), _S.binary("+", _S.read(_v33, "by"), _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.binary("+", _S.read(_v33, "g"), _S.binary("/", _S.binary("*", _S.read(_v33, "s"), _S.prop(_S.read(_v33, "Math"), "PI")), 3))]), _S.read(_v33, "bl"))), _S.read(_v33, "br"), _S.read(_v33, "a")])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v27, "d"), "fork"), func(): return _S.read(_v27, "big")), func(): return _S.unary("!", _S.prop(_S.read(_v27, "d"), "plate")))):
			for _v34 in _S.array([_S.unary("-", 1), 1]):
				var _v35 = _S.scope(_v27)
				_S.define(_v35, "s", _v34)
				_S.invoke(_S.read(_v35, "p"), "dot", [_S.binary("+", _S.binary("+", _S.read(_v35, "x"), _S.binary("*", _S.read(_v35, "ca"), _S.read(_v35, "r"))), _S.binary("*", _S.invoke(_S.read(_v35, "Math"), "cos", [_S.binary("+", _S.read(_v35, "g"), _S.binary("*", _S.read(_v35, "s"), 0.9))]), 1.2)), _S.binary("+", _S.binary("+", _S.read(_v35, "y"), _S.binary("*", _S.read(_v35, "sa"), _S.read(_v35, "r"))), _S.binary("*", _S.invoke(_S.read(_v35, "Math"), "sin", [_S.binary("+", _S.read(_v35, "g"), _S.binary("*", _S.read(_v35, "s"), 0.9))]), 1.2)), _S.read(_v35, "br"), _S.read(_v35, "a")])
		_S.invoke(_S.read(_v27, "p"), "dot", [_S.binary("+", _S.read(_v27, "x"), _S.binary("*", _S.read(_v27, "ca"), _S.read(_v27, "r"))), _S.binary("+", _S.read(_v27, "y"), _S.binary("*", _S.read(_v27, "sa"), _S.read(_v27, "r"))), _S.read(_v27, "WHITE"), _S.read(_v27, "a")])
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "k", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "d"), "plate"), func(): return _S.read(_e, "big"))):
		var _v36 = _S.scope(_e)
		_S.define(_v36, "q", _S.binary("*", _S.read(_v36, "r"), 0.34))
		var _v37 = _S.scope(_v36)
		_S.define(_v37, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v37, "k"), 6)):
			var _v38 = _S.scope(_v37)
			_S.define(_v38, "g0", _S.binary("+", _S.binary("+", _S.read(_v38, "rot"), _S.binary("/", _S.prop(_S.read(_v38, "Math"), "PI"), 6)), _S.binary("/", _S.binary("*", _S.read(_v38, "k"), _S.read(_v38, "TAU")), 6)))
			_S.define(_v38, "g1", _S.binary("+", _S.read(_v38, "g0"), _S.binary("/", _S.read(_v38, "TAU"), 6)))
			_S.invoke(_S.read(_v38, "p"), "line", [_S.binary("+", _S.read(_v38, "x"), _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "cos", [_S.read(_v38, "g0")]), _S.read(_v38, "q"))), _S.binary("+", _S.read(_v38, "y"), _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "sin", [_S.read(_v38, "g0")]), _S.read(_v38, "q"))), _S.binary("+", _S.read(_v38, "x"), _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "cos", [_S.read(_v38, "g1")]), _S.read(_v38, "q"))), _S.binary("+", _S.read(_v38, "y"), _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "sin", [_S.read(_v38, "g1")]), _S.read(_v38, "q"))), _S.prop(_S.read(_v38, "C"), _S.binary("-", _S.read(_v38, "n"), 3)), _S.read(_v38, "a")])
			_v37 = _S.iteration(_v37)
			_S.write(_v37, "k", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 3, _S.binary("*", _S.read(_e, "r"), 1.2)), _S.prop(_S.read(_e, "C"), _S.binary("-", _S.read(_e, "n"), 4)), _S.binary("*", _S.binary("+", 0.14, _S.binary("*", 0.35, _S.read(_e, "hot"))), _S.read(_e, "a"))])
	if _S.truth(_S.binary(">", _S.read(_e, "hot"), 0.3)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 2, _S.binary("*", _S.read(_e, "r"), 0.5)), _S.read(_e, "WHITE"), _S.binary("*", _S.binary("*", 0.3, _S.read(_e, "hot")), _S.read(_e, "a"))])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "D", _S.arg(_args, 1))
	_S.define(_e, "systems", _args.slice(2))
	_S.define(_e, "left", _S.invoke(_S.read(_e, "Math"), "max", [0.001, _S.binary("-", _S.binary("-", _S.read(_e, "D"), 0.05), _S.read(_e, "t"))]))
	for _v39 in _S.array(_S.read(_e, "systems")):
		var _v40 = _S.scope(_e)
		_S.define(_v40, "sys", _v39)
		for _v41 in _S.array(_S.prop(_S.read(_v40, "sys"), "list")):
			var _v42 = _S.scope(_v40)
			_S.define(_v42, "q", _v41)
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v42, "q"), "life"), _S.read(_v42, "left"))):
				_S.set_prop(_S.read(_v42, "q"), "life", _S.read(_v42, "left"), "=", false)
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "inside", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "n", _S.arg(_args, 4))
	_S.define(_e, "opts", _S.coalesce(_S.arg(_args, 5), func(): return _S.merge([])))
	_S.define(_e, "out", [])
	_S.define(_e, "step", _S.logical("??", _S.prop(_S.read(_e, "opts"), "step"), func(): return [1.6, 2.6]))
	_S.define(_e, "len", _S.logical("??", _S.prop(_S.read(_e, "opts"), "len"), func(): return 18))
	_S.define(_e, "fork", _S.logical("??", _S.prop(_S.read(_e, "opts"), "fork"), func(): return 0.16))
	_S.define(_e, "a0", _S.logical("??", _S.prop(_S.read(_e, "opts"), "a0"), func(): return _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])))
	_S.define(_e, "spread", _S.logical("??", _S.prop(_S.read(_e, "opts"), "spread"), func(): return _S.read(_e, "TAU")))
	_S.define(_e, "walk", _S.function_value(_e, "_f19"))
	var _v45 = _S.scope(_e)
	_S.define(_v45, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v45, "i"), _S.read(_v45, "n"))):
		_S.call_value(_S.read(_v45, "walk"), [_S.read(_v45, "x"), _S.read(_v45, "y"), 0, _S.binary("+", _S.binary("+", _S.read(_v45, "a0"), _S.binary("*", _S.binary("/", _S.read(_v45, "i"), _S.read(_v45, "n")), _S.read(_v45, "spread"))), _S.binary("*", _S.invoke(_S.read(_v45, "R"), "range", [_S.unary("-", 0.3), 0.3]), _S.invoke(_S.read(_v45, "Math"), "min", [1, _S.binary("/", _S.read(_v45, "spread"), _S.read(_v45, "TAU"))]))), _S.read(_v45, "len"), 0])
		_v45 = _S.iteration(_v45)
		_S.write(_v45, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "d", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "len", _S.arg(_args, 4))
	_S.define(_e, "depth", _S.arg(_args, 5))
	_S.define(_e, "pts", [[_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "d")]])
	var _v43 = _S.scope(_e)
	_S.define(_v43, "s", 0)
	while _S.truth(_S.binary("<", _S.read(_v43, "s"), _S.read(_v43, "len"))):
		var _v44 = _S.scope(_v43)
		_S.write(_v44, "a", _S.invoke(_S.read(_v44, "R"), "range", [_S.unary("-", 0.55), 0.55]), "+=", false)
		_S.define(_v44, "st", _S.invoke(_S.read(_v44, "R"), "range", [_S.prop(_S.read(_v44, "step"), 0), _S.prop(_S.read(_v44, "step"), 1)]))
		_S.define(_v44, "nx", _S.binary("+", _S.read(_v44, "x"), _S.binary("*", _S.invoke(_S.read(_v44, "Math"), "cos", [_S.read(_v44, "a")]), _S.read(_v44, "st"))))
		_S.define(_v44, "ny", _S.binary("+", _S.read(_v44, "y"), _S.binary("*", _S.invoke(_S.read(_v44, "Math"), "sin", [_S.read(_v44, "a")]), _S.read(_v44, "st"))))
		if _S.truth(_S.unary("!", _S.call_value(_S.read(_v44, "inside"), [_S.read(_v44, "nx"), _S.read(_v44, "ny")]))):
			break
		_S.last([_S.write(_v44, "x", _S.read(_v44, "nx"), "=", false), _S.write(_v44, "y", _S.read(_v44, "ny"), "=", false), _S.write(_v44, "d", _S.read(_v44, "st"), "+=", false)])
		_S.invoke(_S.read(_v44, "pts"), "push", [[_S.read(_v44, "x"), _S.read(_v44, "y"), _S.read(_v44, "d")]])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v44, "depth"), 2), func(): return _S.binary(">", _S.prop(_S.read(_v44, "pts"), "length"), 2)), func(): return _S.invoke(_S.read(_v44, "R"), "chance", [_S.read(_v44, "fork")]))):
			_S.call_value(_S.read(_v44, "walk"), [_S.read(_v44, "x"), _S.read(_v44, "y"), _S.read(_v44, "d"), _S.binary("+", _S.read(_v44, "a"), _S.binary("*", _S.invoke(_S.read(_v44, "R"), "sign", []), _S.invoke(_S.read(_v44, "R"), "range", [0.6, 1.2]))), _S.invoke(_S.read(_v44, "Math"), "ceil", [_S.binary("*", _S.read(_v44, "len"), 0.5)]), _S.binary("+", _S.read(_v44, "depth"), 1)])
		_v43 = _S.iteration(_v43)
		_S.write(_v43, "s", 1, "+=", true)
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "pts"), "length"), 1)):
		_S.invoke(_S.read(_e, "out"), "push", [_S.read(_e, "pts")])
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "cracks", _S.arg(_args, 1))
	_S.define(_e, "reach", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "opts", _S.coalesce(_S.arg(_args, 4), func(): return _S.merge([])))
	_S.define(_e, "n", _S.prop(_S.read(_e, "C"), "length"))
	_S.define(_e, "ox", _S.logical("??", _S.prop(_S.read(_e, "opts"), "ox"), func(): return 0))
	_S.define(_e, "oy", _S.logical("??", _S.prop(_S.read(_e, "opts"), "oy"), func(): return 0))
	_S.define(_e, "hot", _S.logical("??", _S.prop(_S.read(_e, "opts"), "hot"), func(): return true))
	_S.define(_e, "a", _S.logical("??", _S.prop(_S.read(_e, "opts"), "a"), func(): return 1))
	_S.define(_e, "seg", _S.function_value(_e, "_f21"))
	for _v48 in _S.array(_S.read(_e, "cracks")):
		var _v49 = _S.scope(_e)
		_S.define(_v49, "pts", _v48)
		var _v50 = _S.scope(_v49)
		_S.define(_v50, "i", 1)
		while _S.truth(_S.binary("<", _S.read(_v50, "i"), _S.prop(_S.read(_v50, "pts"), "length"))):
			var _v51 = _S.scope(_v50)
			_S.define(_v51, "s", _S.call_value(_S.read(_v51, "seg"), [_S.read(_v51, "pts"), _S.read(_v51, "i")]))
			if _S.truth(_S.unary("!", _S.read(_v51, "s"))):
				break
			_S.invoke(_S.read(_v51, "p"), "line", [_S.prop(_S.read(_v51, "s"), 0), _S.binary("+", _S.prop(_S.read(_v51, "s"), 1), 1), _S.prop(_S.read(_v51, "s"), 2), _S.binary("+", _S.prop(_S.read(_v51, "s"), 3), 1), _S.prop(_S.read(_v51, "C"), _S.invoke(_S.read(_v51, "Math"), "min", [2, _S.binary("-", _S.read(_v51, "n"), 1)])), _S.read(_v51, "a")])
			_v50 = _S.iteration(_v50)
			_S.write(_v50, "i", 1, "+=", true)
	for _v52 in _S.array(_S.read(_e, "cracks")):
		var _v53 = _S.scope(_e)
		_S.define(_v53, "pts", _v52)
		var _v54 = _S.scope(_v53)
		_S.define(_v54, "i", 1)
		while _S.truth(_S.binary("<", _S.read(_v54, "i"), _S.prop(_S.read(_v54, "pts"), "length"))):
			var _v55 = _S.scope(_v54)
			_S.define(_v55, "s", _S.call_value(_S.read(_v55, "seg"), [_S.read(_v55, "pts"), _S.read(_v55, "i")]))
			if _S.truth(_S.unary("!", _S.read(_v55, "s"))):
				break
			_S.define(_v55, "tip", _S.logical("&&", _S.read(_v55, "hot"), func(): return _S.prop(_S.read(_v55, "s"), 4)))
			_S.invoke(_S.read(_v55, "p"), "line", [_S.prop(_S.read(_v55, "s"), 0), _S.prop(_S.read(_v55, "s"), 1), _S.prop(_S.read(_v55, "s"), 2), _S.prop(_S.read(_v55, "s"), 3), (_S.read(_v55, "WHITE") if _S.truth(_S.read(_v55, "tip")) else _S.prop(_S.read(_v55, "C"), _S.binary("-", _S.read(_v55, "n"), 2))), _S.read(_v55, "a")])
			if _S.truth(_S.read(_v55, "tip")):
				_S.invoke(_S.read(_v55, "p"), "glow", [_S.prop(_S.read(_v55, "s"), 2), _S.prop(_S.read(_v55, "s"), 3), 5, _S.prop(_S.read(_v55, "C"), _S.binary("-", _S.read(_v55, "n"), 3)), _S.binary("*", 0.5, _S.read(_v55, "a"))])
			else:
				if _S.truth(_S.binary("%", _S.read(_v55, "i"), 2)):
					_S.invoke(_S.read(_v55, "p"), "glow", [_S.prop(_S.read(_v55, "s"), 2), _S.prop(_S.read(_v55, "s"), 3), 3, _S.prop(_S.read(_v55, "C"), _S.binary("-", _S.read(_v55, "n"), 3)), _S.binary("*", 0.18, _S.read(_v55, "a"))])
			_v54 = _S.iteration(_v54)
			_S.write(_v54, "i", 1, "+=", true)
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	var _v46 = _S.prop(_S.read(_e, "pts"), _S.binary("-", _S.read(_e, "i"), 1))
	_S.define(_e, "x0", _S.prop(_v46, 0))
	_S.define(_e, "y0", _S.prop(_v46, 1))
	_S.define(_e, "d0", _S.prop(_v46, 2))
	var _v47 = _S.prop(_S.read(_e, "pts"), _S.read(_e, "i"))
	_S.define(_e, "x1", _S.prop(_v47, 0))
	_S.define(_e, "y1", _S.prop(_v47, 1))
	_S.define(_e, "d1", _S.prop(_v47, 2))
	if _S.truth(_S.binary(">=", _S.read(_e, "d0"), _S.read(_e, "reach"))):
		return null
	_S.define(_e, "u", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.binary("-", _S.read(_e, "reach"), _S.read(_e, "d0")), _S.invoke(_S.read(_e, "Math"), "max", [0.01, _S.binary("-", _S.read(_e, "d1"), _S.read(_e, "d0"))]))]))
	return [_S.binary("+", _S.read(_e, "x0"), _S.read(_e, "ox")), _S.binary("+", _S.read(_e, "y0"), _S.read(_e, "oy")), _S.binary("+", _S.binary("+", _S.read(_e, "x0"), _S.read(_e, "ox")), _S.binary("*", _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), _S.read(_e, "u"))), _S.binary("+", _S.binary("+", _S.read(_e, "y0"), _S.read(_e, "oy")), _S.binary("*", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0")), _S.read(_e, "u"))), _S.binary("<", _S.binary("-", _S.read(_e, "reach"), _S.read(_e, "d1")), 3)]

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "opts", _S.coalesce(_S.arg(_args, 0), func(): return _S.merge([])))
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	_S.set_prop(_S.read(_e, "this"), "ground", _S.logical("??", _S.prop(_S.read(_e, "opts"), "ground"), func(): return _S.function_value(_e, "_f23")), "=", false)
	_S.set_prop(_S.read(_e, "this"), "onLand", _S.logical("??", _S.prop(_S.read(_e, "opts"), "onLand"), func(): return null), "=", false)
	_S.set_prop(_S.read(_e, "this"), "onCrumble", _S.logical("??", _S.prop(_S.read(_e, "opts"), "onCrumble"), func(): return null), "=", false)
	_S.set_prop(_S.read(_e, "this"), "onSkid", _S.logical("??", _S.prop(_S.read(_e, "opts"), "onSkid"), func(): return null), "=", false)
	return null

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return INF

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "life", _S.logical("??", _S.prop(_S.read(_e, "q"), "life"), func(): return 1))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"vx": 0}, {"vy": 0}, {"a": 0}, {"va": 0}, {"f": 0}, {"vf": 0}, {"lit": 0.6}, {"g": 1}, {"drag": 0.3}, {"bounce": 0.35}, {"rest": false}, {"brittle": false}, _S.read(_e, "q"), {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}])])
	return null

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.prop(_S.prop(_S.read(_e, "this"), "list"), "length")

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "q"), "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "q"), "a")]))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "q"), "f")]))
	return _S.invoke(_S.prop(_S.read(_e, "q"), "pts"), "map", [_S.function_value(_e, "_f27")])

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v56 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v56, 0))
	_S.define(_e, "y", _S.prop(_v56, 1))
	_S.define(_e, "yy", _S.binary("*", _S.read(_e, "y"), _S.read(_e, "k")))
	return [_S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "q"), "x"), _S.binary("*", _S.read(_e, "x"), _S.read(_e, "ca"))), _S.binary("*", _S.read(_e, "yy"), _S.read(_e, "sa"))), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "q"), "y"), _S.binary("*", _S.read(_e, "x"), _S.read(_e, "sa"))), _S.binary("*", _S.read(_e, "yy"), _S.read(_e, "ca")))]

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "low", _S.unary("-", INF))
	for _v57 in _S.array(_S.invoke(_S.read(_e, "this"), "corners", [_S.read(_e, "q")])):
		var _v58 = _S.scope(_e)
		_S.define(_v58, "c", _v57)
		_S.write(_v58, "low", _S.invoke(_S.read(_v58, "Math"), "max", [_S.read(_v58, "low"), _S.prop(_S.read(_v58, "c"), 1)]), "=", false)
	return _S.read(_e, "low")

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	var _v59 = _S.scope(_e)
	_S.define(_v59, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v59, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v59, "i"), 0)):
		var _v60 = _S.scope(_v59)
		_S.define(_v60, "q", _S.prop(_S.prop(_S.read(_v60, "this"), "list"), _S.read(_v60, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v60, "q"), "life", _S.read(_v60, "dt"), "-=", false), 0)):
			var _v61 = _S.scope(_v60)
			_S.invoke(_S.prop(_S.read(_v61, "this"), "list"), "splice", [_S.read(_v61, "i"), 1])
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "i", 1, "-=", true)
			continue
		_S.define(_v60, "floor", _S.binary("-", _S.invoke(_S.read(_v60, "this"), "ground", [_S.prop(_S.read(_v60, "q"), "x")]), 0.5))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v60, "q"), "rest"), func(): return _S.binary("!==", _S.prop(_S.read(_v60, "q"), "crumble"), null)), func(): return _S.binary(">", _S.set_prop(_S.read(_v60, "q"), "restT", _S.binary("+", _S.logical("??", _S.prop(_S.read(_v60, "q"), "restT"), func(): return 0), _S.read(_v60, "dt")), "=", false), _S.prop(_S.read(_v60, "q"), "crumble")))):
			var _v62 = _S.scope(_v60)
			_S.optional_call(_S.prop(_S.read(_v62, "this"), "onCrumble"), [_S.read(_v62, "q")])
			_S.invoke(_S.prop(_S.read(_v62, "this"), "list"), "splice", [_S.read(_v62, "i"), 1])
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "i", 1, "-=", true)
			continue
		if _S.truth(_S.prop(_S.read(_v60, "q"), "rest")):
			var _v63 = _S.scope(_v60)
			if _S.truth(_S.binary(">", _S.invoke(_S.read(_v63, "Math"), "abs", [_S.prop(_S.read(_v63, "q"), "vx")]), 8)):
				_S.optional_call(_S.prop(_S.read(_v63, "this"), "onSkid"), [_S.read(_v63, "q"), _S.prop(_S.read(_v63, "q"), "x"), _S.binary("+", _S.read(_v63, "floor"), 0.5)])
			_S.set_prop(_S.read(_v63, "q"), "x", _S.binary("*", _S.prop(_S.read(_v63, "q"), "vx"), _S.read(_v63, "dt")), "+=", false)
			_S.set_prop(_S.read(_v63, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v63, "q"), "vx"), 7), _S.read(_v63, "dt")), "-=", false)
			_S.set_prop(_S.read(_v63, "q"), "a", _S.binary("*", _S.prop(_S.read(_v63, "q"), "va"), _S.read(_v63, "dt")), "+=", false)
			_S.set_prop(_S.read(_v63, "q"), "va", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v63, "q"), "va"), 9), _S.read(_v63, "dt")), "-=", false)
			_S.set_prop(_S.read(_v63, "q"), "vf", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v63, "q"), "vf"), 9), _S.read(_v63, "dt")), "-=", false)
			_S.set_prop(_S.read(_v63, "q"), "f", _S.binary("*", _S.prop(_S.read(_v63, "q"), "vf"), _S.read(_v63, "dt")), "+=", false)
			_S.set_prop(_S.read(_v63, "q"), "y", _S.binary("-", _S.invoke(_S.read(_v63, "this"), "seat", [_S.read(_v63, "q")]), _S.read(_v63, "floor")), "-=", false)
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v60, "q"), "vy", _S.binary("*", _S.binary("*", _S.read(_v60, "GRAVITY"), _S.prop(_S.read(_v60, "q"), "g")), _S.read(_v60, "dt")), "+=", false)
		_S.set_prop(_S.read(_v60, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v60, "q"), "vx"), _S.prop(_S.read(_v60, "q"), "drag")), _S.read(_v60, "dt")), "-=", false)
		_S.set_prop(_S.read(_v60, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v60, "q"), "vy"), _S.prop(_S.read(_v60, "q"), "drag")), _S.read(_v60, "dt")), "-=", false)
		_S.set_prop(_S.read(_v60, "q"), "x", _S.binary("*", _S.prop(_S.read(_v60, "q"), "vx"), _S.read(_v60, "dt")), "+=", false)
		_S.set_prop(_S.read(_v60, "q"), "y", _S.binary("*", _S.prop(_S.read(_v60, "q"), "vy"), _S.read(_v60, "dt")), "+=", false)
		_S.set_prop(_S.read(_v60, "q"), "a", _S.binary("*", _S.prop(_S.read(_v60, "q"), "va"), _S.read(_v60, "dt")), "+=", false)
		_S.set_prop(_S.read(_v60, "q"), "f", _S.binary("*", _S.prop(_S.read(_v60, "q"), "vf"), _S.read(_v60, "dt")), "+=", false)
		_S.define(_v60, "low", _S.invoke(_S.read(_v60, "this"), "seat", [_S.read(_v60, "q")]))
		if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<=", _S.prop(_S.read(_v60, "q"), "g"), 0), func(): return _S.binary("<", _S.read(_v60, "low"), _S.read(_v60, "floor"))), func(): return _S.binary("<=", _S.prop(_S.read(_v60, "q"), "vy"), 0))):
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v60, "q"), "y", _S.binary("-", _S.read(_v60, "low"), _S.read(_v60, "floor")), "-=", false)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v60, "q"), "vy"), 70)):
			_S.last([_S.set_prop(_S.read(_v60, "q"), "hits", _S.binary("+", _S.logical("??", _S.prop(_S.read(_v60, "q"), "hits"), func(): return 0), 1), "=", false), _S.optional_call(_S.prop(_S.read(_v60, "this"), "onLand"), [_S.read(_v60, "q"), _S.prop(_S.read(_v60, "q"), "x"), _S.binary("+", _S.read(_v60, "floor"), 0.5), _S.prop(_S.read(_v60, "q"), "vy")])])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v60, "q"), "brittle"), func(): return _S.binary(">", _S.prop(_S.read(_v60, "q"), "vy"), 70)), func(): return _S.binary(">=", _S.prop(_S.read(_v60, "q"), "hits"), _S.prop(_S.read(_v60, "q"), "brittle")))):
			var _v64 = _S.scope(_v60)
			_S.invoke(_S.prop(_S.read(_v64, "this"), "list"), "splice", [_S.read(_v64, "i"), 1])
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "i", 1, "-=", true)
			continue
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v60, "q"), "vy"), 70), func(): return _S.binary(">", _S.prop(_S.read(_v60, "q"), "bounce"), 0))):
			var _v65 = _S.scope(_v60)
			_S.set_prop(_S.read(_v65, "q"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v65, "q"), "vy")), _S.prop(_S.read(_v65, "q"), "bounce")), "=", false)
			_S.set_prop(_S.read(_v65, "q"), "vx", 0.75, "*=", false)
			_S.set_prop(_S.read(_v65, "q"), "va", 0.6, "*=", false)
			_S.set_prop(_S.read(_v65, "q"), "vf", 0.5, "*=", false)
		else:
			var _v66 = _S.scope(_v60)
			_S.set_prop(_S.read(_v66, "q"), "rest", true, "=", false)
			_S.set_prop(_S.read(_v66, "q"), "vy", 0, "=", false)
		_v59 = _S.iteration(_v59)
		_S.write(_v59, "i", 1, "-=", true)
	return null

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "n", _S.prop(_S.read(_e, "C"), "length"))
	for _v67 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v68 = _S.scope(_e)
		_S.define(_v68, "q", _v67)
		var _v69 = _S.scope(_v68)
		_S.define(_v69, "a", _S.invoke(_S.read(_v69, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v69, "q"), "life"), 0.35)]))
		_S.define(_v69, "pts", _S.invoke(_S.read(_v69, "this"), "corners", [_S.read(_v69, "q")]))
		_S.define(_v69, "k", _S.invoke(_S.read(_v69, "Math"), "cos", [_S.prop(_S.read(_v69, "q"), "f")]))
		_S.define(_v69, "face", _S.invoke(_S.read(_v69, "Math"), "abs", [_S.read(_v69, "k")]))
		_S.define(_v69, "lv", _S.binary("*", _S.prop(_S.read(_v69, "q"), "lit"), _S.binary("+", 0.35, _S.binary("*", 0.65, _S.read(_v69, "face")))))
		_S.define(_v69, "flash", _S.logical("&&", _S.binary(">", _S.read(_v69, "face"), 0.97), func(): return _S.unary("!", _S.prop(_S.read(_v69, "q"), "rest"))))
		if _S.truth(_S.binary(">", _S.read(_v69, "face"), 0.25)):
			var _v70 = _S.scope(_v69)
			if _S.truth(_S.logical("&&", _S.prop(_S.read(_v70, "q"), "solid"), func(): return _S.binary("!==", _S.prop(_S.read(_v70, "q"), "tone"), null))):
				var _v71 = _S.scope(_v70)
				_S.invoke(_S.read(_v71, "p"), "poly", [_S.read(_v71, "pts"), (_S.prop(_S.read(_v71, "C"), _S.binary("-", _S.read(_v71, "n"), 1)) if _S.truth(_S.read(_v71, "flash")) else _S.prop(_S.read(_v71, "C"), _S.call_value(_S.read(_v71, "clamp"), [_S.invoke(_S.read(_v71, "Math"), "round", [_S.binary("+", 1, _S.binary("*", _S.binary("*", _S.prop(_S.read(_v71, "q"), "tone"), 5), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_v71, "face")))))]), 1, _S.binary("-", _S.read(_v71, "n"), 2)]))), _S.read(_v71, "a")])
			else:
				if _S.truth(_S.prop(_S.read(_v70, "q"), "solid")):
					var _v72 = _S.scope(_v70)
					_S.define(_v72, "rr", _S.logical("??", _S.prop(_S.read(_v72, "q"), "ridge"), func(): return _S.binary("/", _S.unary("-", _S.prop(_S.read(_v72, "Math"), "PI")), 2)))
					_S.define(_v72, "cr", _S.invoke(_S.read(_v72, "Math"), "cos", [_S.read(_v72, "rr")]))
					_S.define(_v72, "sr", _S.invoke(_S.read(_v72, "Math"), "sin", [_S.read(_v72, "rr")]))
					_S.define(_v72, "ca", _S.invoke(_S.read(_v72, "Math"), "cos", [_S.prop(_S.read(_v72, "q"), "a")]))
					_S.define(_v72, "sa", _S.invoke(_S.read(_v72, "Math"), "sin", [_S.prop(_S.read(_v72, "q"), "a")]))
					_S.define(_v72, "rx", _S.binary("-", _S.binary("*", _S.read(_v72, "cr"), _S.read(_v72, "ca")), _S.binary("*", _S.binary("*", _S.read(_v72, "sr"), _S.read(_v72, "k")), _S.read(_v72, "sa"))))
					_S.define(_v72, "ry", _S.binary("+", _S.binary("*", _S.read(_v72, "cr"), _S.read(_v72, "sa")), _S.binary("*", _S.binary("*", _S.read(_v72, "sr"), _S.read(_v72, "k")), _S.read(_v72, "ca"))))
					_S.define(_v72, "nx", _S.unary("-", _S.read(_v72, "ry")))
					_S.define(_v72, "ny", _S.read(_v72, "rx"))
					if _S.truth(_S.binary("<", _S.binary("+", _S.binary("*", _S.read(_v72, "nx"), _S.unary("-", 0.55)), _S.binary("*", _S.read(_v72, "ny"), _S.unary("-", 0.84))), 0)):
						_S.last([_S.write(_v72, "nx", _S.unary("-", _S.read(_v72, "nx")), "=", false), _S.write(_v72, "ny", _S.unary("-", _S.read(_v72, "ny")), "=", false)])
					_S.define(_v72, "lit", (_S.prop(_S.read(_v72, "C"), _S.binary("-", _S.read(_v72, "n"), 1)) if _S.truth(_S.read(_v72, "flash")) else _S.prop(_S.read(_v72, "C"), _S.call_value(_S.read(_v72, "clamp"), [_S.invoke(_S.read(_v72, "Math"), "round", [_S.binary("+", 3, _S.binary("*", _S.read(_v72, "lv"), 3))]), 3, _S.binary("-", _S.read(_v72, "n"), 2)]))))
					_S.define(_v72, "deep", _S.prop(_S.read(_v72, "C"), _S.call_value(_S.read(_v72, "clamp"), [_S.invoke(_S.read(_v72, "Math"), "round", [_S.binary("+", 1, _S.binary("*", _S.read(_v72, "lv"), 2))]), 1, 3])))
					_S.invoke(_S.read(_v72, "p"), "poly", [_S.read(_v72, "pts"), _S.function_value(_v72, "_f31"), _S.read(_v72, "a")])
				else:
					_S.call_value(_S.read(_v70, "glassPoly"), [_S.read(_v70, "p"), _S.read(_v70, "pts"), (_S.prop(_S.read(_v70, "C"), _S.binary("-", _S.read(_v70, "n"), 1)) if _S.truth(_S.read(_v70, "flash")) else _S.prop(_S.read(_v70, "C"), _S.call_value(_S.read(_v70, "clamp"), [_S.invoke(_S.read(_v70, "Math"), "round", [_S.binary("+", 3, _S.binary("*", _S.read(_v70, "lv"), 3))]), 3, _S.binary("-", _S.read(_v70, "n"), 2)]))), _S.binary("*", _S.binary("+", _S.binary("+", 0.3, _S.binary("*", 0.35, _S.read(_v70, "lv"))), (0.3 if _S.truth(_S.read(_v70, "flash")) else 0)), _S.read(_v70, "a"))])
		_S.define(_v69, "cx", 0)
		_S.define(_v69, "cy", 0)
		_S.define(_v69, "top", 0)
		for _v73 in _S.array(_S.read(_v69, "pts")):
			var _v74 = _S.scope(_v69)
			var _v75 = _v73
			_S.define(_v74, "x", _S.prop(_v75, 0))
			_S.define(_v74, "y", _S.prop(_v75, 1))
			_S.last([_S.write(_v74, "cx", _S.read(_v74, "x"), "+=", false), _S.write(_v74, "cy", _S.read(_v74, "y"), "+=", false)])
		_S.write(_v69, "cx", _S.prop(_S.read(_v69, "pts"), "length"), "/=", false)
		_S.write(_v69, "cy", _S.prop(_S.read(_v69, "pts"), "length"), "/=", false)
		var _v76 = _S.scope(_v69)
		_S.define(_v76, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v76, "i"), _S.prop(_S.read(_v76, "pts"), "length"))):
			var _v77 = _S.scope(_v76)
			var _v78 = _S.prop(_S.read(_v77, "pts"), _S.read(_v77, "i"))
			_S.define(_v77, "x0", _S.prop(_v78, 0))
			_S.define(_v77, "y0", _S.prop(_v78, 1))
			var _v79 = _S.prop(_S.read(_v77, "pts"), _S.binary("%", _S.binary("+", _S.read(_v77, "i"), 1), _S.prop(_S.read(_v77, "pts"), "length")))
			_S.define(_v77, "x1", _S.prop(_v79, 0))
			_S.define(_v77, "y1", _S.prop(_v79, 1))
			_S.define(_v77, "nx", _S.binary("-", _S.read(_v77, "y1"), _S.read(_v77, "y0")))
			_S.define(_v77, "ny", _S.binary("-", _S.read(_v77, "x0"), _S.read(_v77, "x1")))
			if _S.truth(_S.binary("<", _S.binary("+", _S.binary("*", _S.read(_v77, "nx"), _S.binary("-", _S.binary("/", _S.binary("+", _S.read(_v77, "x0"), _S.read(_v77, "x1")), 2), _S.read(_v77, "cx"))), _S.binary("*", _S.read(_v77, "ny"), _S.binary("-", _S.binary("/", _S.binary("+", _S.read(_v77, "y0"), _S.read(_v77, "y1")), 2), _S.read(_v77, "cy")))), 0)):
				_S.last([_S.write(_v77, "nx", _S.unary("-", _S.read(_v77, "nx")), "=", false), _S.write(_v77, "ny", _S.unary("-", _S.read(_v77, "ny")), "=", false)])
			_S.define(_v77, "l", _S.logical("||", _S.invoke(_S.read(_v77, "Math"), "hypot", [_S.read(_v77, "nx"), _S.read(_v77, "ny")]), func(): return 1))
			_S.define(_v77, "lit", _S.binary("/", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_v77, "nx")), 0.55), _S.binary("*", _S.read(_v77, "ny"), 0.84)), _S.read(_v77, "l")))
			_S.invoke(_S.read(_v77, "p"), "line", [_S.read(_v77, "x0"), _S.read(_v77, "y0"), _S.read(_v77, "x1"), _S.read(_v77, "y1"), (_S.prop(_S.read(_v77, "C"), _S.binary("-", _S.read(_v77, "n"), 1)) if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v77, "face"), 0.25), func(): return _S.binary(">", _S.read(_v77, "lit"), 0.35))) else (_S.prop(_S.read(_v77, "C"), _S.binary("-", _S.read(_v77, "n"), 2)) if _S.truth(_S.binary(">", _S.read(_v77, "lit"), _S.unary("-", 0.25))) else (_S.prop(_S.read(_v77, "C"), 1) if _S.truth(_S.prop(_S.read(_v77, "q"), "solid")) else _S.prop(_S.read(_v77, "C"), _S.invoke(_S.read(_v77, "Math"), "max", [2, _S.binary("-", _S.read(_v77, "n"), 4)]))))), _S.read(_v77, "a")])
			if _S.truth(_S.binary("<", _S.prop(_S.prop(_S.read(_v77, "pts"), _S.read(_v77, "i")), 1), _S.prop(_S.prop(_S.read(_v77, "pts"), _S.read(_v77, "top")), 1))):
				_S.write(_v77, "top", _S.read(_v77, "i"), "=", false)
			_v76 = _S.iteration(_v76)
			_S.write(_v76, "i", 1, "+=", true)
		if _S.truth(_S.binary(">", _S.read(_v69, "face"), 0.7)):
			_S.invoke(_S.read(_v69, "p"), "dot", [_S.prop(_S.prop(_S.read(_v69, "pts"), _S.read(_v69, "top")), 0), _S.prop(_S.prop(_S.read(_v69, "pts"), _S.read(_v69, "top")), 1), _S.read(_v69, "WHITE"), _S.read(_v69, "a")])
		_S.invoke(_S.read(_v69, "p"), "glow", [_S.read(_v69, "cx"), _S.read(_v69, "cy"), 5, _S.prop(_S.read(_v69, "C"), _S.binary("-", _S.read(_v69, "n"), 3)), _S.binary("*", (0.5 if _S.truth(_S.read(_v69, "flash")) else 0.14), _S.read(_v69, "a"))])
	return null

static func _f31(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "q"), "x")), _S.read(_e, "nx")), _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "q"), "y")), _S.read(_e, "ny"))))
	return (_S.read(_e, "lit") if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.6)) else (_S.prop(_S.read(_e, "C"), _S.binary("-", _S.read(_e, "n"), 2)) if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.unary("-", 0.6))) else _S.read(_e, "deep")))
