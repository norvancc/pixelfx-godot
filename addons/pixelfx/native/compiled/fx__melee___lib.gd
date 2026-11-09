@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "through", _S.function_value(_e, "_f0"))
	_S.define(_e, "onSwing", _S.function_value(_e, "_f1"))
	_S.define(_e, "travel", _S.function_value(_e, "_f2"))
	_S.define(_e, "plane", _S.function_value(_e, "_f3"))
	_S.define(_e, "smear", _S.function_value(_e, "_f4"))
	_S.define(_e, "trace", _S.function_value(_e, "_f6"))
	_S.define(_e, "glowAlong", _S.function_value(_e, "_f7"))
	_S.define(_e, "slash", _S.function_value(_e, "_f8"))
	_S.define(_e, "shavings", _S.function_value(_e, "_f12"))
	_S.define(_e, "stone", _S.function_value(_e, "_f13"))
	_S.define(_e, "rock", _S.function_value(_e, "_f14"))
	_S.define(_e, "cracks", _S.function_value(_e, "_f16"))
	_S.define(_e, "star", _S.function_value(_e, "_f17"))
	_S.define(_e, "sliver", _S.function_value(_e, "_f18"))
	_S.define(_e, "along", _S.function_value(_e, "_f19"))
	_S.define(_e, "swing", _S.function_value(_e, "_f20"))
	_exports["swing"] = _S.read(_e, "swing")
	_exports["through"] = _S.read(_e, "through")
	_exports["onSwing"] = _S.read(_e, "onSwing")
	_exports["travel"] = _S.read(_e, "travel")
	_exports["plane"] = _S.read(_e, "plane")
	_exports["smear"] = _S.read(_e, "smear")
	_exports["trace"] = _S.read(_e, "trace")
	_exports["glowAlong"] = _S.read(_e, "glowAlong")
	_exports["slash"] = _S.read(_e, "slash")
	_S.define(_e, "slashEnd", _S.function_value(_e, "_f21"))
	_exports["slashEnd"] = _S.read(_e, "slashEnd")
	_exports["shavings"] = _S.read(_e, "shavings")
	_exports["stone"] = _S.read(_e, "stone")
	_S.define(_e, "OUTLINE", _S.call_value(_S.read(_e, "hex"), ["#1a1422"]))
	_exports["rock"] = _S.read(_e, "rock")
	_exports["cracks"] = _S.read(_e, "cracks")
	_exports["star"] = _S.read(_e, "star")
	_exports["sliver"] = _S.read(_e, "sliver")
	_exports["along"] = _S.read(_e, "along")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "th", _S.arg(_args, 2))
	_S.define(_e, "dir", _S.arg(_args, 3))
	_S.define(_e, "R", _S.arg(_args, 4))
	_S.define(_e, "span", _S.arg(_args, 5))
	_S.define(_e, "at", _S.coalesce(_S.arg(_args, 6), func(): return 0.55))
	_S.define(_e, "extra", _S.coalesce(_S.arg(_args, 7), func(): return _S.merge([])))
	_S.define(_e, "a", _S.binary("-", _S.read(_e, "th"), _S.binary("/", _S.binary("*", _S.read(_e, "dir"), _S.prop(_S.read(_e, "Math"), "PI")), 2)))
	return _S.call_value(_S.read(_e, "swing"), [_S.merge([{"cx": _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "R")))}, {"cy": _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "R")))}, {"R": _S.read(_e, "R")}, {"sy": 1}, {"rot": 0}, {"a0": _S.binary("-", _S.read(_e, "a"), _S.binary("*", _S.binary("*", _S.read(_e, "dir"), _S.read(_e, "span")), _S.read(_e, "at")))}, {"dir": _S.read(_e, "dir")}, {"span": _S.read(_e, "span")}, _S.read(_e, "extra")])])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	_S.define(_e, "u", _S.arg(_args, 2))
	_S.define(_e, "a", _S.binary("+", _S.prop(_S.read(_e, "s"), "a0"), _S.binary("*", _S.prop(_S.read(_e, "s"), "dir"), _S.read(_e, "u"))))
	_S.define(_e, "lx", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "r")))
	_S.define(_e, "ly", _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "r")), _S.prop(_S.read(_e, "s"), "sy")), _S.binary("*", _S.prop(_S.read(_e, "s"), "k"), _S.binary("-", _S.prop(_S.read(_e, "s"), "R"), _S.read(_e, "r")))))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "s"), "rot")]))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "s"), "rot")]))
	return [_S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "s"), "cx"), _S.binary("*", _S.read(_e, "lx"), _S.read(_e, "c"))), _S.binary("*", _S.read(_e, "ly"), _S.read(_e, "n"))), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "s"), "cy"), _S.binary("*", _S.read(_e, "lx"), _S.read(_e, "n"))), _S.binary("*", _S.read(_e, "ly"), _S.read(_e, "c")))]

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "u", _S.arg(_args, 1))
	var _v0 = _S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "s"), _S.prop(_S.read(_e, "s"), "R"), _S.read(_e, "u")])
	_S.define(_e, "x0", _S.prop(_v0, 0))
	_S.define(_e, "y0", _S.prop(_v0, 1))
	var _v1 = _S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "s"), _S.prop(_S.read(_e, "s"), "R"), _S.binary("+", _S.read(_e, "u"), 0.01)])
	_S.define(_e, "x1", _S.prop(_v1, 0))
	_S.define(_e, "y1", _S.prop(_v1, 1))
	_S.define(_e, "l", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0"))]), func(): return 1))
	return _S.merge([{"x": _S.read(_e, "x0")}, {"y": _S.read(_e, "y0")}, {"dx": _S.binary("/", _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), _S.read(_e, "l"))}, {"dy": _S.binary("/", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0")), _S.read(_e, "l"))}, {"a": _S.binary("+", _S.prop(_S.read(_e, "s"), "a0"), _S.binary("*", _S.prop(_S.read(_e, "s"), "dir"), _S.read(_e, "u")))}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "s"), "rot")]))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "s"), "rot")]))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "s"), "cx")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "s"), "cy")))
	_S.define(_e, "lx", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "c")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "n"))))
	_S.define(_e, "ly", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "n")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "c"))))
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "s"), "k"))):
		return [_S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "lx"), _S.binary("/", _S.read(_e, "ly"), _S.prop(_S.read(_e, "s"), "sy"))]), _S.invoke(_S.read(_e, "Math"), "atan2", [_S.binary("/", _S.read(_e, "ly"), _S.prop(_S.read(_e, "s"), "sy")), _S.read(_e, "lx")])]
	_S.define(_e, "m", _S.binary("+", _S.read(_e, "ly"), _S.binary("*", _S.prop(_S.read(_e, "s"), "k"), _S.prop(_S.read(_e, "s"), "R"))))
	_S.define(_e, "A", _S.binary("-", _S.binary("*", _S.prop(_S.read(_e, "s"), "sy"), _S.prop(_S.read(_e, "s"), "sy")), _S.binary("*", _S.prop(_S.read(_e, "s"), "k"), _S.prop(_S.read(_e, "s"), "k"))))
	_S.define(_e, "B", _S.binary("*", _S.binary("*", 2, _S.read(_e, "m")), _S.prop(_S.read(_e, "s"), "k")))
	_S.define(_e, "Cc", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "lx"), _S.read(_e, "lx")), _S.prop(_S.read(_e, "s"), "sy")), _S.prop(_S.read(_e, "s"), "sy")), _S.binary("*", _S.read(_e, "m"), _S.read(_e, "m"))))
	_S.define(_e, "r", _S.binary("/", _S.binary("+", _S.unary("-", _S.read(_e, "B")), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_e, "B"), _S.read(_e, "B")), _S.binary("*", _S.binary("*", 4, _S.read(_e, "A")), _S.read(_e, "Cc")))])), _S.binary("*", 2, _S.read(_e, "A"))))
	return [_S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "atan2", [_S.binary("/", _S.binary("-", _S.read(_e, "m"), _S.binary("*", _S.prop(_S.read(_e, "s"), "k"), _S.read(_e, "r"))), _S.prop(_S.read(_e, "s"), "sy")), _S.read(_e, "lx")])]

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "u0", _S.arg(_args, 2))
	_S.define(_e, "u1", _S.arg(_args, 3))
	_S.define(_e, "wMax", _S.arg(_args, 4))
	_S.define(_e, "fn", _S.arg(_args, 5))
	_S.define(_e, "half", _S.coalesce(_S.arg(_args, 6), func(): return 0))
	_S.define(_e, "pad", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "u1"), _S.read(_e, "u0")), 0.005)):
		return null
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "s"), "rot")]))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "s"), "rot")]))
	_S.define(_e, "A", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "s"), "R"), _S.read(_e, "pad")), 1))
	_S.define(_e, "Bn", _S.binary("+", _S.binary("*", _S.read(_e, "A"), _S.prop(_S.read(_e, "s"), "sy")), _S.binary("*", _S.prop(_S.read(_e, "s"), "k"), _S.binary("+", _S.read(_e, "wMax"), 2))))
	_S.define(_e, "hx", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("*", _S.read(_e, "A"), _S.read(_e, "c")), _S.binary("*", _S.read(_e, "Bn"), _S.read(_e, "n"))]), 1))
	_S.define(_e, "hy", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("*", _S.read(_e, "A"), _S.read(_e, "n")), _S.binary("*", _S.read(_e, "Bn"), _S.read(_e, "c"))]), 1))
	_S.define(_e, "rIn", _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "s"), "R"), _S.read(_e, "wMax")), 1))
	_S.define(_e, "over", _S.binary("+", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "n")]), _S.read(_e, "A")), _S.binary("*", _S.prop(_S.read(_e, "s"), "k"), _S.binary("+", _S.read(_e, "wMax"), 2))), 2))
	_S.define(_e, "y0", (_S.binary("-", _S.prop(_S.read(_e, "s"), "cy"), _S.read(_e, "over")) if _S.truth(_S.binary(">", _S.read(_e, "half"), 0)) else _S.binary("-", _S.prop(_S.read(_e, "s"), "cy"), _S.read(_e, "hy"))))
	_S.define(_e, "y1", (_S.binary("+", _S.prop(_S.read(_e, "s"), "cy"), _S.read(_e, "over")) if _S.truth(_S.binary("<", _S.read(_e, "half"), 0)) else _S.binary("+", _S.prop(_S.read(_e, "s"), "cy"), _S.read(_e, "hy"))))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.prop(_S.read(_e, "s"), "cx"), _S.read(_e, "hx")), _S.read(_e, "y0"), _S.binary("+", _S.prop(_S.read(_e, "s"), "cx"), _S.read(_e, "hx")), _S.read(_e, "y1"), _S.function_value(_e, "_f5")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	var _v2 = _S.call_value(_S.read(_e, "plane"), [_S.read(_e, "s"), _S.read(_e, "x"), _S.read(_e, "y")])
	_S.define(_e, "r", _S.prop(_v2, 0))
	_S.define(_e, "a", _S.prop(_v2, 1))
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "r"), _S.binary("+", _S.prop(_S.read(_e, "s"), "R"), _S.read(_e, "pad"))), func(): return _S.binary("<", _S.read(_e, "r"), _S.read(_e, "rIn")))):
		return null
	if _S.truth(_S.logical("&&", _S.read(_e, "half"), func(): return _S.binary("!==", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 0)) else 1), _S.read(_e, "half")))):
		return null
	_S.define(_e, "u", _S.binary("%", _S.binary("*", _S.prop(_S.read(_e, "s"), "dir"), _S.binary("-", _S.read(_e, "a"), _S.prop(_S.read(_e, "s"), "a0"))), _S.read(_e, "TAU")))
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0)):
		_S.write(_e, "u", _S.read(_e, "TAU"), "+=", false)
	while _S.truth(_S.binary("<", _S.read(_e, "u"), _S.read(_e, "u0"))):
		_S.write(_e, "u", _S.read(_e, "TAU"), "+=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "u"), _S.read(_e, "u1"))):
		return null
	return _S.call_value(_S.read(_e, "fn"), [_S.read(_e, "u"), _S.read(_e, "r"), _S.read(_e, "out"), _S.read(_e, "a")])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "u0", _S.arg(_args, 3))
	_S.define(_e, "u1", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "a", _S.arg(_args, 6))
	_S.define(_e, "half", _S.coalesce(_S.arg(_args, 7), func(): return 0))
	_S.define(_e, "step", _S.coalesce(_S.arg(_args, 8), func(): return 0.6))
	_S.define(_e, "du", _S.binary("/", _S.read(_e, "step"), _S.invoke(_S.read(_e, "Math"), "max", [4, _S.read(_e, "r")])))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "u", _S.read(_v3, "u0"))
	while _S.truth(_S.binary("<=", _S.read(_v3, "u"), _S.read(_v3, "u1"))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "g", _S.binary("+", _S.prop(_S.read(_v4, "s"), "a0"), _S.binary("*", _S.prop(_S.read(_v4, "s"), "dir"), _S.read(_v4, "u"))))
		if _S.truth(_S.logical("&&", _S.read(_v4, "half"), func(): return _S.binary("!==", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "g")]), 0)) else 1), _S.read(_v4, "half")))):
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "u", _S.read(_v3, "du"), "+=", false)
			continue
		var _v5 = _S.call_value(_S.read(_v4, "onSwing"), [_S.read(_v4, "s"), _S.read(_v4, "r"), _S.read(_v4, "u")])
		_S.define(_v4, "x", _S.prop(_v5, 0))
		_S.define(_v4, "y", _S.prop(_v5, 1))
		_S.define(_v4, "k", (_S.call_value(_S.read(_v4, "a"), [_S.read(_v4, "u")]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_v4, "a")), "function")) else _S.read(_v4, "a")))
		if _S.truth(_S.binary(">", _S.read(_v4, "k"), 0)):
			_S.invoke(_S.read(_v4, "p"), "dot", [_S.read(_v4, "x"), _S.read(_v4, "y"), (_S.call_value(_S.read(_v4, "c"), [_S.read(_v4, "u")]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_v4, "c")), "function")) else _S.read(_v4, "c")), _S.read(_v4, "k")])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "u", _S.read(_v3, "du"), "+=", false)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "u0", _S.arg(_args, 3))
	_S.define(_e, "u1", _S.arg(_args, 4))
	_S.define(_e, "rad", _S.arg(_args, 5))
	_S.define(_e, "c", _S.arg(_args, 6))
	_S.define(_e, "k", _S.arg(_args, 7))
	_S.define(_e, "half", _S.coalesce(_S.arg(_args, 8), func(): return 0))
	_S.define(_e, "step", _S.coalesce(_S.arg(_args, 9), func(): return 0.35))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "u", _S.read(_v6, "u0"))
	while _S.truth(_S.binary("<=", _S.read(_v6, "u"), _S.read(_v6, "u1"))):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "g", _S.binary("+", _S.prop(_S.read(_v7, "s"), "a0"), _S.binary("*", _S.prop(_S.read(_v7, "s"), "dir"), _S.read(_v7, "u"))))
		if _S.truth(_S.logical("&&", _S.read(_v7, "half"), func(): return _S.binary("!==", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "g")]), 0)) else 1), _S.read(_v7, "half")))):
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "u", _S.read(_v6, "step"), "+=", false)
			continue
		var _v8 = _S.call_value(_S.read(_v7, "onSwing"), [_S.read(_v7, "s"), _S.read(_v7, "r"), _S.read(_v7, "u")])
		_S.define(_v7, "x", _S.prop(_v8, 0))
		_S.define(_v7, "y", _S.prop(_v8, 1))
		_S.define(_v7, "kk", (_S.call_value(_S.read(_v7, "k"), [_S.read(_v7, "u")]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_v7, "k")), "function")) else _S.read(_v7, "k")))
		if _S.truth(_S.binary(">", _S.read(_v7, "kk"), 0.004)):
			_S.invoke(_S.read(_v7, "p"), "glow", [_S.read(_v7, "x"), _S.read(_v7, "y"), _S.read(_v7, "rad"), _S.read(_v7, "c"), _S.read(_v7, "kk")])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "u", _S.read(_v6, "step"), "+=", false)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "half", _S.coalesce(_S.arg(_args, 3), func(): return 0))
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "s"), "t0")))
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0)):
		return null
	_S.define(_e, "R", _S.prop(_S.read(_e, "s"), "ramp"))
	_S.define(_e, "n", _S.prop(_S.read(_e, "R"), "length"))
	_S.define(_e, "life", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "s"), "sweep"), _S.prop(_S.read(_e, "s"), "hold")), _S.prop(_S.read(_e, "s"), "trail")))
	_S.define(_e, "hot", _S.logical("??", _S.prop(_S.read(_e, "s"), "hot"), func(): return 0))
	_S.define(_e, "head", _S.invoke(_S.read(_e, "ease"), "outExpo", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "u"), _S.prop(_S.read(_e, "s"), "sweep"))])]))
	_S.define(_e, "tail", _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.prop(_S.read(_e, "s"), "sweep"), _S.prop(_S.read(_e, "s"), "hold")), _S.read(_e, "life"), _S.read(_e, "u")]))
	_S.define(_e, "age", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "u"), _S.read(_e, "life"))]))
	_S.define(_e, "U", _S.binary("*", _S.prop(_S.read(_e, "s"), "span"), _S.read(_e, "head")))
	_S.define(_e, "T", _S.binary("*", _S.prop(_S.read(_e, "s"), "span"), _S.read(_e, "tail")))
	_S.define(_e, "W", _S.binary("*", _S.prop(_S.read(_e, "s"), "W"), _S.binary("-", 1, _S.binary("*", _S.read(_e, "tail"), 0.55))))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "tail"), 1), func(): return _S.binary(">", _S.binary("-", _S.read(_e, "U"), _S.read(_e, "T")), 0.01))):
		var _v9 = _S.scope(_e)
		_S.call_value(_S.read(_v9, "smear"), [_S.read(_v9, "p"), _S.read(_v9, "s"), _S.read(_v9, "T"), _S.read(_v9, "U"), _S.read(_v9, "W"), _S.function_value(_v9, "_f9"), _S.read(_v9, "half")])
		_S.call_value(_S.read(_v9, "glowAlong"), [_S.read(_v9, "p"), _S.read(_v9, "s"), _S.binary("-", _S.prop(_S.read(_v9, "s"), "R"), _S.binary("*", _S.read(_v9, "W"), 0.4)), _S.read(_v9, "T"), _S.read(_v9, "U"), _S.binary("+", 5, _S.read(_v9, "W")), _S.prop(_S.read(_v9, "R"), _S.binary("-", _S.read(_v9, "n"), 3)), _S.function_value(_v9, "_f10"), _S.read(_v9, "half"), 0.3])
	_S.define(_e, "th", _S.binary("*", 0.7, _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "u"), _S.prop(_S.read(_e, "s"), "sweep")), _S.prop(_S.read(_e, "s"), "hold")), _S.binary("+", _S.prop(_S.read(_e, "s"), "trail"), 0.2))]))))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "tail"), 0.02), func(): return _S.binary(">", _S.read(_e, "th"), 0))):
		_S.call_value(_S.read(_e, "trace"), [_S.read(_e, "p"), _S.read(_e, "s"), _S.binary("-", _S.prop(_S.read(_e, "s"), "R"), 0.5), 0, _S.read(_e, "T"), _S.prop(_S.read(_e, "R"), 2), _S.function_value(_e, "_f11"), _S.read(_e, "half")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "uu", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "uu"), _S.read(_e, "T")), _S.binary("-", _S.read(_e, "U"), _S.read(_e, "T"))))
	_S.define(_e, "w", _S.binary("*", _S.read(_e, "W"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "v"), (1 if _S.truth(_S.prop(_S.read(_e, "s"), "lens")) else 2.2)]))]), (0.75 if _S.truth(_S.prop(_S.read(_e, "s"), "lens")) else 0.6)])))
	if _S.truth(_S.binary("<", _S.read(_e, "w"), 0.35)):
		return null
	_S.define(_e, "q", _S.binary("/", _S.binary("-", _S.prop(_S.read(_e, "s"), "R"), _S.read(_e, "r")), _S.read(_e, "w")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "q"), 0), func(): return _S.binary(">", _S.read(_e, "q"), 1))):
		return null
	_S.define(_e, "ci", (0 if _S.truth(_S.logical("||", _S.logical("&&", _S.binary("<", _S.read(_e, "q"), 0.22), func(): return _S.binary("<", _S.read(_e, "age"), 0.5)), func(): return _S.binary("<", _S.read(_e, "q"), _S.binary("*", _S.read(_e, "hot"), 0.7)))) else _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.binary("+", _S.binary("-", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "q"), _S.binary("-", _S.read(_e, "n"), 1)), 0.75), _S.binary("*", _S.read(_e, "age"), 2.4)), _S.binary("*", _S.read(_e, "v"), 0.8)), 0.4), _S.binary("*", _S.read(_e, "hot"), 3))])))
	_S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "R"), _S.binary("-", _S.binary("-", _S.read(_e, "n"), 1), _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "ci"), 0, _S.binary("-", _S.read(_e, "n"), 1)]))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "v"), (0.1 if _S.truth(_S.prop(_S.read(_e, "s"), "lens")) else 0.4))]), "=", false)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "uu", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.binary("+", 0.22, _S.binary("*", _S.read(_e, "hot"), 0.3)), _S.binary("-", 1, _S.read(_e, "age"))), _S.binary("/", _S.binary("-", _S.read(_e, "uu"), _S.read(_e, "T")), _S.binary("-", _S.read(_e, "U"), _S.read(_e, "T"))))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "uu", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "th"), _S.binary("+", 0.4, _S.binary("/", _S.binary("*", 0.6, _S.read(_e, "uu")), _S.prop(_S.read(_e, "s"), "span"))))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "ps", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	_S.define(_e, "s", _S.arg(_args, 2))
	_S.define(_e, "n", _S.arg(_args, 3))
	_S.define(_e, "colors", _S.arg(_args, 4))
	_S.define(_e, "from", _S.coalesce(_S.arg(_args, 5), func(): return 0.3))
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), _S.read(_v10, "n"))):
		var _v11 = _S.scope(_v10)
		var _v12 = _S.call_value(_S.read(_v11, "onSwing"), [_S.read(_v11, "s"), _S.prop(_S.read(_v11, "s"), "R"), _S.binary("*", _S.prop(_S.read(_v11, "s"), "span"), _S.invoke(_S.read(_v11, "R"), "range", [_S.read(_v11, "from"), 1]))])
		_S.define(_v11, "x", _S.prop(_v12, 0))
		_S.define(_v11, "y", _S.prop(_v12, 1))
		_S.define(_v11, "ox", _S.binary("-", _S.read(_v11, "x"), _S.prop(_S.read(_v11, "s"), "cx")))
		_S.define(_v11, "oy", _S.binary("-", _S.read(_v11, "y"), _S.prop(_S.read(_v11, "s"), "cy")))
		_S.define(_v11, "l", _S.logical("||", _S.invoke(_S.read(_v11, "Math"), "hypot", [_S.read(_v11, "ox"), _S.read(_v11, "oy")]), func(): return 1))
		_S.define(_v11, "sp", _S.invoke(_S.read(_v11, "R"), "range", [30, 100]))
		_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "MOTE"), _S.read(_v11, "x"), _S.read(_v11, "y"), _S.binary("*", _S.binary("/", _S.read(_v11, "ox"), _S.read(_v11, "l")), _S.read(_v11, "sp")), _S.binary("-", _S.invoke(_S.read(_v11, "Math"), "min", [25, _S.binary("*", _S.binary("/", _S.read(_v11, "oy"), _S.read(_v11, "l")), _S.read(_v11, "sp"))]), 10), _S.invoke(_S.read(_v11, "R"), "range", [0.25, 0.55]), _S.invoke(_S.read(_v11, "R"), "pick", [_S.read(_v11, "colors")]), 0.6])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.write(_e, "c", _S.call_value(_S.read(_e, "hex"), [_S.read(_e, "c")]), "=", false)
	return _S.merge([{"light": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 1.35]), _S.read(_e, "WHITE"), 0.08])}, {"body": _S.read(_e, "c")}, {"shade": _S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 0.64])}, {"dust": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 1.2]), _S.call_value(_S.read(_e, "rgb"), [150, 140, 150]), 0.3])}, {"dark": _S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 0.42])}])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "st", _S.arg(_args, 2))
	_S.define(_e, "r", _S.binary("+", 0.6, _S.binary("*", _S.prop(_S.read(_e, "b"), "s"), 0.75)))
	_S.define(_e, "fade", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_e, "b"), "life"), 0.5)]))
	_S.define(_e, "lx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "b"), "a")]), _S.read(_e, "r")), 0.4))
	_S.define(_e, "ly", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "b"), "a")]), _S.read(_e, "r")), 0.4))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "r")), 1), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "r")), 1), _S.function_value(_e, "_f15")])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "b"), "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "b"), "y")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("*", _S.read(_e, "dx"), 1.15), _S.read(_e, "dy")]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "r"), 0.9))):
		return null
	_S.define(_e, "lit", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "lx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ly"))))
	_S.set_prop(_S.read(_e, "out"), "c", (_S.read(_e, "OUTLINE") if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "r"))) else (_S.prop(_S.read(_e, "st"), "light") if _S.truth(_S.binary("<", _S.read(_e, "lit"), _S.unary("-", 0.4))) else (_S.prop(_S.read(_e, "st"), "shade") if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.6)) else _S.prop(_S.read(_e, "st"), "body")))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "fade"), "=", false)
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "x0", _S.arg(_args, 1))
	_S.define(_e, "n", _S.arg(_args, 2))
	_S.define(_e, "reach", _S.arg(_args, 3))
	_S.define(_e, "depth", _S.coalesce(_S.arg(_args, 4), func(): return 7))
	_S.define(_e, "bias", _S.coalesce(_S.arg(_args, 5), func(): return 0.3))
	_S.define(_e, "out", [])
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), _S.read(_v13, "n"))):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "side", (1 if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [_S.binary("+", 0.5, _S.binary("*", _S.read(_v14, "bias"), 0.5))])) else _S.unary("-", 1)))
		_S.define(_v14, "L", _S.binary("*", _S.binary("*", _S.read(_v14, "reach"), _S.invoke(_S.read(_v14, "R"), "range", [0.45, 1])), (1 if _S.truth(_S.binary("<", _S.read(_v14, "i"), 2)) else 0.7)))
		_S.define(_v14, "pts", [[_S.binary("+", _S.read(_v14, "x0"), _S.binary("*", _S.read(_v14, "side"), _S.invoke(_S.read(_v14, "R"), "range", [0, 1.5]))), 0]])
		_S.define(_v14, "x", _S.prop(_S.prop(_S.read(_v14, "pts"), 0), 0))
		_S.define(_v14, "y", 0)
		while _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v14, "Math"), "abs", [_S.binary("-", _S.read(_v14, "x"), _S.read(_v14, "x0"))]), _S.read(_v14, "L")), func(): return _S.binary("<", _S.read(_v14, "y"), _S.read(_v14, "depth")))):
			var _v15 = _S.scope(_v14)
			_S.write(_v15, "x", _S.binary("*", _S.read(_v15, "side"), _S.invoke(_S.read(_v15, "R"), "range", [1.5, 3.5])), "+=", false)
			_S.write(_v15, "y", _S.invoke(_S.read(_v15, "Math"), "min", [_S.read(_v15, "depth"), _S.invoke(_S.read(_v15, "Math"), "max", [0, _S.binary("+", _S.read(_v15, "y"), _S.binary("*", _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 0.6), 1.6]), (1 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v15, "Math"), "abs", [_S.binary("-", _S.read(_v15, "x"), _S.read(_v15, "x0"))]), 3)) else 0.3)))])]), "=", false)
			_S.invoke(_S.read(_v15, "pts"), "push", [[_S.invoke(_S.read(_v15, "Math"), "round", [_S.read(_v15, "x")]), _S.invoke(_S.read(_v15, "Math"), "round", [_S.read(_v15, "y")])]])
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.invoke(_S.read(_v15, "R"), "chance", [0.18]), func(): return _S.binary(">", _S.prop(_S.read(_v15, "pts"), "length"), 3)), func(): return _S.binary("<", _S.read(_v15, "y"), _S.binary("-", _S.read(_v15, "depth"), 2)))):
				var _v16 = _S.scope(_v15)
				_S.define(_v16, "f", [[_S.invoke(_S.read(_v16, "Math"), "round", [_S.read(_v16, "x")]), _S.invoke(_S.read(_v16, "Math"), "round", [_S.read(_v16, "y")])]])
				_S.define(_v16, "fx", _S.read(_v16, "x"))
				_S.define(_v16, "fy", _S.read(_v16, "y"))
				var _v17 = _S.scope(_v16)
				_S.define(_v17, "j", _S.invoke(_S.read(_v17, "R"), "int", [1, 3]))
				while _S.truth(_S.binary(">", _S.read(_v17, "j"), 0)):
					_S.last([_S.write(_v17, "fx", _S.binary("*", _S.read(_v17, "side"), _S.invoke(_S.read(_v17, "R"), "range", [1, 3])), "+=", false), _S.write(_v17, "fy", _S.invoke(_S.read(_v17, "R"), "range", [0.8, 2]), "+=", false), _S.invoke(_S.read(_v17, "f"), "push", [[_S.invoke(_S.read(_v17, "Math"), "round", [_S.read(_v17, "fx")]), _S.invoke(_S.read(_v17, "Math"), "round", [_S.invoke(_S.read(_v17, "Math"), "min", [_S.binary("+", _S.read(_v17, "depth"), 1), _S.read(_v17, "fy")])])]])])
					_v17 = _S.iteration(_v17)
					_S.write(_v17, "j", 1, "-=", true)
				_S.invoke(_S.read(_v16, "out"), "push", [_S.merge([{"pts": _S.read(_v16, "f")}, {"at": _S.binary("/", _S.invoke(_S.read(_v16, "Math"), "abs", [_S.binary("-", _S.read(_v16, "x"), _S.read(_v16, "x0"))]), _S.read(_v16, "reach"))}, {"fork": true}])])
		_S.invoke(_S.read(_v14, "out"), "push", [_S.merge([{"pts": _S.read(_v14, "pts")}, {"at": 0}, {"fork": false}])])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "spikes", _S.arg(_args, 3))
	_S.define(_e, "sc", _S.arg(_args, 4))
	_S.define(_e, "th", _S.arg(_args, 5))
	_S.define(_e, "core", _S.arg(_args, 6))
	_S.define(_e, "body", _S.arg(_args, 7))
	_S.define(_e, "inner", _S.arg(_args, 8))
	_S.define(_e, "rim", _S.arg(_args, 9))
	for _v18 in _S.array([0, 1, 2]):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "pass", _v18)
		for _v20 in _S.array(_S.read(_v19, "spikes")):
			var _v21 = _S.scope(_v19)
			_S.define(_v21, "s", _v20)
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "c", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.prop(_S.read(_v22, "s"), "a")]))
			_S.define(_v22, "sn", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.prop(_S.read(_v22, "s"), "a")]))
			_S.define(_v22, "L", _S.binary("*", _S.prop(_S.read(_v22, "s"), "len"), _S.read(_v22, "sc")))
			var _v23 = _S.scope(_v22)
			_S.define(_v23, "d", 0)
			while _S.truth(_S.binary("<=", _S.read(_v23, "d"), _S.read(_v23, "L"))):
				var _v24 = _S.scope(_v23)
				_S.define(_v24, "hw0", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v24, "s"), "w"), _S.read(_v24, "th")), _S.binary("-", 1, _S.binary("/", _S.read(_v24, "d"), _S.read(_v24, "L")))), _S.invoke(_S.read(_v24, "Math"), "min", [1, _S.binary("+", 0.5, _S.binary("/", _S.read(_v24, "d"), 3))])))
				_S.define(_v24, "hw", (_S.binary("+", _S.read(_v24, "hw0"), 0.8) if _S.truth(_S.binary("===", _S.read(_v24, "pass"), 0)) else (_S.read(_v24, "hw0") if _S.truth(_S.binary("===", _S.read(_v24, "pass"), 1)) else _S.binary("*", _S.read(_v24, "hw0"), 0.45))))
				if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v24, "pass"), 2), func(): return _S.binary(">", _S.read(_v24, "d"), _S.binary("*", _S.read(_v24, "L"), 0.55)))):
					break
				var _v25 = _S.scope(_v24)
				_S.define(_v25, "o", _S.unary("-", _S.read(_v25, "hw")))
				while _S.truth(_S.binary("<=", _S.read(_v25, "o"), _S.read(_v25, "hw"))):
					_S.invoke(_S.read(_v25, "p"), "px", [_S.binary("-", _S.binary("+", _S.read(_v25, "x"), _S.binary("*", _S.read(_v25, "c"), _S.read(_v25, "d"))), _S.binary("*", _S.read(_v25, "sn"), _S.read(_v25, "o"))), _S.binary("+", _S.binary("+", _S.read(_v25, "y"), _S.binary("*", _S.read(_v25, "sn"), _S.read(_v25, "d"))), _S.binary("*", _S.read(_v25, "c"), _S.read(_v25, "o"))), (_S.read(_v25, "rim") if _S.truth(_S.binary("===", _S.read(_v25, "pass"), 0)) else ((_S.read(_v25, "inner") if _S.truth(_S.binary("<", _S.read(_v25, "d"), _S.binary("*", _S.read(_v25, "L"), 0.35))) else _S.read(_v25, "body")) if _S.truth(_S.binary("===", _S.read(_v25, "pass"), 1)) else _S.read(_v25, "core")))])
					_v25 = _S.iteration(_v25)
					_S.write(_v25, "o", 0.5, "+=", false)
				_v23 = _S.iteration(_v23)
				_S.write(_v23, "d", 0.5, "+=", false)
	_S.define(_e, "r", _S.binary("*", _S.binary("*", 2.4, _S.read(_e, "sc")), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "th")])))
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "r"), 0.8), _S.read(_e, "inner")])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.read(_e, "core")])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "r", _S.arg(_args, 4))
	_S.define(_e, "arc", _S.arg(_args, 5))
	_S.define(_e, "c", _S.arg(_args, 6))
	_S.define(_e, "k", _S.arg(_args, 7))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.binary("*", _S.read(_e, "r"), _S.read(_e, "arc")), 2.2)]))
	var _v26 = _S.scope(_e)
	_S.define(_v26, "j", 0)
	while _S.truth(_S.binary("<=", _S.read(_v26, "j"), _S.read(_v26, "n"))):
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "u", _S.binary("-", _S.binary("/", _S.read(_v27, "j"), _S.read(_v27, "n")), 0.5))
		_S.define(_v27, "th", _S.binary("+", _S.read(_v27, "a"), _S.binary("*", _S.read(_v27, "u"), _S.read(_v27, "arc"))))
		_S.define(_v27, "w", _S.binary("*", 1.4, _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "abs", [_S.read(_v27, "u")]), 2))))
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "o", _S.binary("*", _S.unary("-", _S.read(_v28, "w")), 0.5))
		while _S.truth(_S.binary("<=", _S.read(_v28, "o"), _S.binary("+", _S.binary("*", _S.read(_v28, "w"), 0.5), 0.01))):
			_S.invoke(_S.read(_v28, "p"), "dot", [_S.binary("+", _S.read(_v28, "x"), _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "cos", [_S.read(_v28, "th")]), _S.binary("+", _S.read(_v28, "r"), _S.read(_v28, "o")))), _S.binary("+", _S.read(_v28, "y"), _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "sin", [_S.read(_v28, "th")]), _S.binary("+", _S.read(_v28, "r"), _S.read(_v28, "o")))), _S.read(_v28, "c"), _S.read(_v28, "k")])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "o", 0.5, "+=", false)
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "j", 1, "+=", true)
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "len", _S.arg(_args, 1))
	_S.define(_e, "fn", _S.arg(_args, 2))
	_S.define(_e, "d", 0)
	var _v29 = _S.scope(_e)
	_S.define(_v29, "i", 1)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v29, "i"), _S.prop(_S.read(_v29, "pts"), "length")), func(): return _S.binary("<", _S.read(_v29, "d"), _S.read(_v29, "len")))):
		var _v30 = _S.scope(_v29)
		var _v31 = _S.prop(_S.read(_v30, "pts"), _S.binary("-", _S.read(_v30, "i"), 1))
		_S.define(_v30, "x0", _S.prop(_v31, 0))
		_S.define(_v30, "y0", _S.prop(_v31, 1))
		var _v32 = _S.prop(_S.read(_v30, "pts"), _S.read(_v30, "i"))
		_S.define(_v30, "x1", _S.prop(_v32, 0))
		_S.define(_v30, "y1", _S.prop(_v32, 1))
		_S.define(_v30, "l", _S.invoke(_S.read(_v30, "Math"), "hypot", [_S.binary("-", _S.read(_v30, "x1"), _S.read(_v30, "x0")), _S.binary("-", _S.read(_v30, "y1"), _S.read(_v30, "y0"))]))
		_S.define(_v30, "f", _S.invoke(_S.read(_v30, "Math"), "min", [1, _S.binary("/", _S.binary("-", _S.read(_v30, "len"), _S.read(_v30, "d")), _S.read(_v30, "l"))]))
		_S.call_value(_S.read(_v30, "fn"), [_S.read(_v30, "x0"), _S.read(_v30, "y0"), _S.binary("+", _S.read(_v30, "x0"), _S.binary("*", _S.binary("-", _S.read(_v30, "x1"), _S.read(_v30, "x0")), _S.read(_v30, "f"))), _S.binary("+", _S.read(_v30, "y0"), _S.binary("*", _S.binary("-", _S.read(_v30, "y1"), _S.read(_v30, "y0")), _S.read(_v30, "f"))), _S.read(_v30, "d")])
		_S.write(_v30, "d", _S.read(_v30, "l"), "+=", false)
		_v29 = _S.iteration(_v29)
		_S.write(_v29, "i", 1, "+=", true)
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "o", _S.arg(_args, 0))
	return _S.merge([{"cx": 0}, {"cy": 0}, {"R": 30}, {"sy": 1}, {"rot": 0}, {"a0": 0}, {"dir": 1}, {"k": 0}, _S.read(_e, "o")])

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "travel"), [_S.merge([_S.read(_e, "s"), {"R": _S.binary("-", _S.prop(_S.read(_e, "s"), "R"), _S.binary("*", _S.prop(_S.read(_e, "s"), "W"), 0.3))}]), _S.prop(_S.read(_e, "s"), "span")])
