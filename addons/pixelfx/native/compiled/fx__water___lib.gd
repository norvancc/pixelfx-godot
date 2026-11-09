@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "noise2", _S.import_value("core/index.js", "noise2"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "bead", _S.function_value(_e, "_f0"))
	_S.define(_e, "ring", _S.function_value(_e, "_f2"))
	_S.define(_e, "lace", _S.function_value(_e, "_f3"))
	_S.define(_e, "billow", _S.function_value(_e, "_f5"))
	_S.define(_e, "pebble", _S.function_value(_e, "_f6"))
	_S.define(_e, "WATER", ["#0a1630", "#123063", "#1b5596", "#2a7fc4", "#45a9e3", "#86d3f5", "#cdf1ff", "#ffffff"])
	_exports["WATER"] = _S.read(_e, "WATER")
	_S.define(_e, "ROCK", ["#141219", "#221f2b", "#34303f", "#4a4558", "#655f74", "#8a8498"])
	_exports["ROCK"] = _S.read(_e, "ROCK")
	_exports["bead"] = _S.read(_e, "bead")
	_S.define(_e, "Drops", _S.class_value("Drops", _S.function_value(_e, "_f8"), {"add": _S.function_value(_e, "_f9"), "update": _S.function_value(_e, "_f11"), "draw": _S.function_value(_e, "_f12")}, {"count": _S.function_value(_e, "_f10")}, {}, null))
	_exports["Drops"] = _S.read(_e, "Drops")
	_exports["ring"] = _S.read(_e, "ring")
	_S.define(_e, "Ripples", _S.class_value("Ripples", _S.function_value(_e, "_f13"), {"add": _S.function_value(_e, "_f14"), "update": _S.function_value(_e, "_f16"), "draw": _S.function_value(_e, "_f17")}, {"count": _S.function_value(_e, "_f15")}, {}, null))
	_exports["Ripples"] = _S.read(_e, "Ripples")
	_exports["lace"] = _S.read(_e, "lace")
	_S.define(_e, "Mist", _S.class_value("Mist", _S.function_value(_e, "_f18"), {"add": _S.function_value(_e, "_f19"), "update": _S.function_value(_e, "_f21"), "draw": _S.function_value(_e, "_f22")}, {"count": _S.function_value(_e, "_f20")}, {}, null))
	_exports["Mist"] = _S.read(_e, "Mist")
	_exports["billow"] = _S.read(_e, "billow")
	_exports["pebble"] = _S.read(_e, "pebble")
	_S.define(_e, "rock", _S.function_value(_e, "_f25"))
	_exports["rock"] = _S.read(_e, "rock")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "vx", _S.arg(_args, 3))
	_S.define(_e, "vy", _S.arg(_args, 4))
	_S.define(_e, "s", _S.arg(_args, 5))
	_S.define(_e, "C", _S.arg(_args, 6))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	_S.define(_e, "sp", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "vx"), _S.read(_e, "vy")]), func(): return 1))
	_S.define(_e, "ux", _S.binary("/", _S.read(_e, "vx"), _S.read(_e, "sp")))
	_S.define(_e, "uy", _S.binary("/", _S.read(_e, "vy"), _S.read(_e, "sp")))
	_S.define(_e, "tail", _S.invoke(_S.read(_e, "Math"), "min", [5, _S.binary("*", _S.read(_e, "sp"), 0.011)]))
	if _S.truth(_S.binary(">=", _S.read(_e, "tail"), 1)):
		_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ux"), _S.binary("+", _S.read(_e, "tail"), 1))), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "uy"), _S.binary("+", _S.read(_e, "tail"), 1))), _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ux"), 1.2)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "uy"), 1.2)), _S.function_value(_e, "_f1"), _S.read(_e, "a")])
	if _S.truth(_S.binary(">=", _S.read(_e, "s"), 3)):
		var _v0 = _S.scope(_e)
		_S.invoke(_S.read(_v0, "p"), "circle", [_S.read(_v0, "x"), _S.read(_v0, "y"), 1.75, _S.prop(_S.read(_v0, "C"), 4), _S.read(_v0, "a")])
		_S.invoke(_S.read(_v0, "p"), "circle", [_S.binary("-", _S.read(_v0, "x"), 0.25), _S.binary("-", _S.read(_v0, "y"), 0.25), 1.15, _S.prop(_S.read(_v0, "C"), 6), _S.read(_v0, "a")])
		_S.invoke(_S.read(_v0, "p"), "dot", [_S.binary("-", _S.read(_v0, "x"), 0.7), _S.binary("-", _S.read(_v0, "y"), 0.7), _S.read(_v0, "WHITE"), _S.read(_v0, "a")])
	else:
		if _S.truth(_S.binary(">=", _S.read(_e, "s"), 2)):
			var _v1 = _S.scope(_e)
			_S.define(_v1, "X", _S.invoke(_S.read(_v1, "Math"), "floor", [_S.read(_v1, "x")]))
			_S.define(_v1, "Y", _S.invoke(_S.read(_v1, "Math"), "floor", [_S.read(_v1, "y")]))
			_S.invoke(_S.read(_v1, "p"), "dot", [_S.read(_v1, "X"), _S.read(_v1, "Y"), _S.read(_v1, "WHITE"), _S.read(_v1, "a")])
			_S.invoke(_S.read(_v1, "p"), "dot", [_S.binary("+", _S.read(_v1, "X"), 1), _S.read(_v1, "Y"), _S.prop(_S.read(_v1, "C"), 6), _S.read(_v1, "a")])
			_S.invoke(_S.read(_v1, "p"), "dot", [_S.read(_v1, "X"), _S.binary("+", _S.read(_v1, "Y"), 1), _S.prop(_S.read(_v1, "C"), 5), _S.read(_v1, "a")])
			_S.invoke(_S.read(_v1, "p"), "dot", [_S.binary("+", _S.read(_v1, "X"), 1), _S.binary("+", _S.read(_v1, "Y"), 1), _S.prop(_S.read(_v1, "C"), 4), _S.read(_v1, "a")])
		else:
			_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "sp"), 160)) else _S.prop(_S.read(_e, "C"), 5)), _S.read(_e, "a")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.45)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "s"), 1)) else _S.prop(_S.read(_e, "C"), 4)))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "cx", _S.arg(_args, 1))
	_S.define(_e, "cy", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "sy", _S.arg(_args, 4))
	_S.define(_e, "k", _S.arg(_args, 5))
	_S.define(_e, "C", _S.arg(_args, 6))
	var _v2 = _S.coalesce(_S.arg(_args, 7), func(): return _S.merge([]))
	_S.define(_e, "n", _S.coalesce(_S.prop(_v2, "n"), func(): return 2))
	_S.define(_e, "gap", _S.coalesce(_S.prop(_v2, "gap"), func(): return 3))
	_S.define(_e, "half", _S.coalesce(_S.prop(_v2, "half"), func(): return 0))
	_S.define(_e, "hot", _S.coalesce(_S.prop(_v2, "hot"), func(): return false))
	_S.define(_e, "glint", _S.coalesce(_S.prop(_v2, "glint"), func(): return 0))
	_S.define(_e, "seed", _S.coalesce(_S.prop(_v2, "seed"), func(): return 0))
	_S.define(_e, "wob", _S.coalesce(_S.prop(_v2, "wob"), func(): return 0))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "k"), 0.02), func(): return _S.binary("<", _S.read(_e, "r"), 0.5))):
		return null
	var _v3 = _S.scope(_e)
	_S.define(_v3, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "j"), _S.read(_v3, "n"))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "rr", _S.binary("-", _S.read(_v4, "r"), _S.binary("*", _S.read(_v4, "j"), _S.read(_v4, "gap"))))
		if _S.truth(_S.binary("<", _S.read(_v4, "rr"), 0.6)):
			break
		_S.define(_v4, "kj", _S.binary("*", _S.read(_v4, "k"), _S.binary("-", 1, _S.binary("*", _S.read(_v4, "j"), 0.42))))
		_S.define(_v4, "m", _S.invoke(_S.read(_v4, "Math"), "max", [6, _S.invoke(_S.read(_v4, "Math"), "ceil", [_S.binary("*", _S.binary("*", _S.read(_v4, "rr"), _S.read(_v4, "TAU")), 1.3)])]))
		_S.define(_v4, "need", _S.binary("-", 1.15, _S.binary("*", 2.3, _S.invoke(_S.read(_v4, "Math"), "min", [1, _S.binary("*", _S.read(_v4, "kj"), 1.25)]))))
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), _S.read(_v5, "m"))):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "a", _S.binary("*", _S.binary("/", _S.read(_v6, "i"), _S.read(_v6, "m")), _S.read(_v6, "TAU")))
			_S.define(_v6, "s", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]))
			_S.define(_v6, "near", _S.binary(">", _S.read(_v6, "s"), 0))
			if _S.truth(_S.logical("||", _S.logical("&&", _S.binary(">", _S.read(_v6, "half"), 0), func(): return _S.unary("!", _S.read(_v6, "near"))), func(): return _S.logical("&&", _S.binary("<", _S.read(_v6, "half"), 0), func(): return _S.read(_v6, "near")))):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "i", 1, "+=", true)
				continue
			if _S.truth(_S.binary("<", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_v6, "noise"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v6, "a"), 4.7), _S.binary("*", _S.read(_v6, "seed"), 13.1)), _S.binary("*", _S.read(_v6, "j"), 5.3)), _S.read(_v6, "seed")]), 0.65), _S.binary("*", _S.call_value(_S.read(_v6, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v6, "a"), 11.3), _S.binary("*", _S.read(_v6, "seed"), 7.7)), _S.binary("+", _S.read(_v6, "seed"), 3)]), 0.35)), _S.read(_v6, "need"))):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "i", 1, "+=", true)
				continue
			_S.define(_v6, "lit", _S.binary("*", _S.binary("*", _S.read(_v6, "kj"), (1 if _S.truth(_S.read(_v6, "near")) else 0.7)), _S.binary("-", 0.88, _S.binary("*", 0.12, _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")])))))
			_S.define(_v6, "c", (_S.read(_v6, "WHITE") if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_v6, "hot"), func(): return _S.read(_v6, "near")), func(): return _S.binary("===", _S.read(_v6, "j"), 0))) else _S.prop(_S.read(_v6, "C"), (6 if _S.truth(_S.binary(">", _S.read(_v6, "lit"), 0.7)) else (5 if _S.truth(_S.binary(">", _S.read(_v6, "lit"), 0.38)) else 4)))))
			_S.define(_v6, "ra", (_S.binary("+", _S.read(_v6, "rr"), _S.binary("*", _S.read(_v6, "wob"), _S.call_value(_S.read(_v6, "noise"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v6, "a"), 2.6), _S.binary("*", _S.read(_v6, "seed"), 1.9)), _S.read(_v6, "j")), _S.binary("+", _S.read(_v6, "seed"), 11)]))) if _S.truth(_S.read(_v6, "wob")) else _S.read(_v6, "rr")))
			_S.define(_v6, "x", _S.binary("+", _S.read(_v6, "cx"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "ra"))))
			_S.define(_v6, "y", _S.binary("+", _S.read(_v6, "cy"), _S.binary("*", _S.binary("*", _S.read(_v6, "s"), _S.read(_v6, "ra")), _S.read(_v6, "sy"))))
			_S.invoke(_S.read(_v6, "p"), "dot", [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.read(_v6, "c")])
			if _S.truth(_S.binary("===", _S.read(_v6, "j"), 0)):
				_S.invoke(_S.read(_v6, "p"), "light", [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.prop(_S.read(_v6, "C"), 4), _S.binary("*", 0.3, _S.read(_v6, "lit"))])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "j", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "glint"), 0), func(): return _S.binary(">=", _S.read(_e, "half"), 0))):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "x", _S.binary("+", _S.read(_v7, "cx"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [2.05]), _S.read(_v7, "r"))))
		_S.define(_v7, "y", _S.binary("+", _S.read(_v7, "cy"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [2.05]), _S.read(_v7, "r")), _S.read(_v7, "sy"))))
		_S.invoke(_S.read(_v7, "p"), "px", [_S.read(_v7, "x"), _S.read(_v7, "y"), _S.read(_v7, "WHITE")])
		_S.invoke(_S.read(_v7, "p"), "glow", [_S.read(_v7, "x"), _S.read(_v7, "y"), _S.binary("+", 3, _S.binary("*", _S.read(_v7, "glint"), 2)), _S.prop(_S.read(_v7, "C"), 5), _S.binary("*", 0.35, _S.read(_v7, "glint"))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "cx", _S.arg(_args, 1))
	_S.define(_e, "cy", _S.arg(_args, 2))
	_S.define(_e, "rx", _S.arg(_args, 3))
	_S.define(_e, "ry", _S.arg(_args, 4))
	_S.define(_e, "k", _S.arg(_args, 5))
	_S.define(_e, "C", _S.arg(_args, 6))
	_S.define(_e, "t", _S.arg(_args, 7))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 8), func(): return 0))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "k"), 0.01), func(): return _S.binary("<", _S.read(_e, "rx"), 1))):
		return null
	_S.define(_e, "sy", _S.binary("/", _S.read(_e, "ry"), _S.read(_e, "rx")))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "cx"), _S.read(_e, "rx")), _S.binary("-", _S.read(_e, "cy"), _S.read(_e, "ry")), _S.binary("+", _S.read(_e, "cx"), _S.read(_e, "rx")), _S.binary("+", _S.read(_e, "cy"), _S.read(_e, "ry")), _S.function_value(_e, "_f4")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.read(_e, "rx")))
	_S.define(_e, "dy", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")), _S.read(_e, "ry")))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy"))))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		return null
	_S.define(_e, "u", _S.binary("*", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), 0.36))
	_S.define(_e, "v", _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")), _S.read(_e, "sy")), 0.36))
	_S.define(_e, "n", _S.call_value(_S.read(_e, "noise2"), [_S.binary("+", _S.read(_e, "u"), _S.binary("*", _S.read(_e, "seed"), 7.13)), _S.binary("-", _S.read(_e, "v"), _S.binary("*", _S.read(_e, "t"), 0.35)), _S.read(_e, "seed")]))
	_S.define(_e, "m", _S.call_value(_S.read(_e, "noise2"), [_S.binary("-", _S.binary("*", _S.read(_e, "u"), 2.2), _S.binary("*", _S.read(_e, "t"), 0.3)), _S.binary("+", _S.binary("*", _S.read(_e, "v"), 2.2), _S.binary("*", _S.read(_e, "seed"), 3.1)), _S.binary("+", _S.read(_e, "seed"), 9)]))
	_S.define(_e, "net", _S.binary("+", _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "n")]), 4.6)), _S.binary("*", _S.read(_e, "m"), 0.3)))
	_S.define(_e, "need", _S.binary("-", 1.02, _S.binary("*", _S.read(_e, "k"), _S.binary("-", 1.15, _S.binary("*", _S.read(_e, "d"), 0.9)))))
	if _S.truth(_S.binary("<", _S.read(_e, "net"), _S.read(_e, "need"))):
		return null
	_S.set_prop(_S.read(_e, "o"), "c", (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "net"), _S.binary("+", _S.read(_e, "need"), 0.4))) else _S.prop(_S.read(_e, "C"), 6)), "=", false)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "C", _S.arg(_args, 4))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 5), func(): return 1))
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 0.9)):
		return _S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.12)), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.2)), _S.read(_e, "r"), _S.prop(_S.read(_e, "C"), 4), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.84), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "a")])
	if _S.truth(_S.binary(">", _S.read(_e, "r"), 1.6)):
		_S.invoke(_S.read(_e, "p"), "circle", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.3)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.32)), _S.binary("*", _S.read(_e, "r"), 0.46), _S.read(_e, "WHITE"), _S.read(_e, "a")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "ST", _S.arg(_args, 4))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "r")), 1), _S.binary("-", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "r")), 1), _S.function_value(_e, "_f7")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("*", _S.read(_e, "dx"), 1.1), _S.read(_e, "dy")]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "r"), 0.8))):
		return null
	_S.define(_e, "lit", _S.binary("/", _S.binary("+", _S.read(_e, "dx"), _S.read(_e, "dy")), _S.invoke(_S.read(_e, "Math"), "max", [0.5, _S.read(_e, "r")])))
	_S.set_prop(_S.read(_e, "o"), "c", (_S.prop(_S.read(_e, "ST"), 0) if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "r"))) else (_S.prop(_S.read(_e, "ST"), 5) if _S.truth(_S.binary("<", _S.read(_e, "lit"), _S.unary("-", 0.7))) else (_S.prop(_S.read(_e, "ST"), 4) if _S.truth(_S.binary("<", _S.read(_e, "lit"), 0.2)) else (_S.prop(_S.read(_e, "ST"), 3) if _S.truth(_S.binary("<", _S.read(_e, "lit"), 0.8)) else _S.prop(_S.read(_e, "ST"), 2))))), "=", false)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	var _v8 = _S.coalesce(_S.arg(_args, 0), func(): return _S.merge([]))
	_S.define(_e, "sy", _S.coalesce(_S.prop(_v8, "sy"), func(): return 0.22))
	_S.define(_e, "g", _S.coalesce(_S.prop(_v8, "g"), func(): return 820))
	_S.define(_e, "drag", _S.coalesce(_S.prop(_v8, "drag"), func(): return 0.35))
	_S.define(_e, "onLand", _S.coalesce(_S.prop(_v8, "onLand"), func(): return null))
	_S.set_prop(_S.read(_e, "this"), "sy", _S.read(_e, "sy"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "g", _S.read(_e, "g"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "drag", _S.read(_e, "drag"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "onLand", _S.read(_e, "onLand"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "life", _S.logical("??", _S.prop(_S.read(_e, "d"), "life"), func(): return 4))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"x": 0}, {"z": 0}, {"h": 0}, {"vx": 0}, {"vz": 0}, {"vh": 0}, {"s": 1}, {"delay": 0}, _S.read(_e, "d"), {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}])])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.prop(_S.prop(_S.read(_e, "this"), "list"), "length")

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("*", _S.prop(_S.read(_e, "this"), "drag"), _S.read(_e, "dt")))
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v9, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v9, "i"), 0)):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "d", _S.prop(_S.prop(_S.read(_v10, "this"), "list"), _S.read(_v10, "i")))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v10, "d"), "delay"), 0)):
			var _v11 = _S.scope(_v10)
			_S.set_prop(_S.read(_v11, "d"), "delay", _S.read(_v11, "dt"), "-=", false)
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v10, "d"), "life", _S.read(_v10, "dt"), "-=", false), 0)):
			var _v12 = _S.scope(_v10)
			_S.invoke(_S.prop(_S.read(_v12, "this"), "list"), "splice", [_S.read(_v12, "i"), 1])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v10, "d"), "vh", _S.binary("*", _S.prop(_S.read(_v10, "this"), "g"), _S.read(_v10, "dt")), "-=", false)
		_S.set_prop(_S.read(_v10, "d"), "vx", _S.binary("*", _S.prop(_S.read(_v10, "d"), "vx"), _S.read(_v10, "k")), "-=", false)
		_S.set_prop(_S.read(_v10, "d"), "vz", _S.binary("*", _S.prop(_S.read(_v10, "d"), "vz"), _S.read(_v10, "k")), "-=", false)
		_S.set_prop(_S.read(_v10, "d"), "vh", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v10, "d"), "vh"), _S.read(_v10, "k")), 0.5), "-=", false)
		_S.set_prop(_S.read(_v10, "d"), "x", _S.binary("*", _S.prop(_S.read(_v10, "d"), "vx"), _S.read(_v10, "dt")), "+=", false)
		_S.set_prop(_S.read(_v10, "d"), "z", _S.binary("*", _S.prop(_S.read(_v10, "d"), "vz"), _S.read(_v10, "dt")), "+=", false)
		_S.set_prop(_S.read(_v10, "d"), "h", _S.binary("*", _S.prop(_S.read(_v10, "d"), "vh"), _S.read(_v10, "dt")), "+=", false)
		if _S.truth(_S.logical("&&", _S.binary("<=", _S.prop(_S.read(_v10, "d"), "h"), 0), func(): return _S.binary("<", _S.prop(_S.read(_v10, "d"), "vh"), 0))):
			var _v13 = _S.scope(_v10)
			_S.set_prop(_S.read(_v13, "d"), "h", 0, "=", false)
			_S.invoke(_S.prop(_S.read(_v13, "this"), "list"), "splice", [_S.read(_v13, "i"), 1])
			_S.optional_call(_S.prop(_S.read(_v13, "this"), "onLand"), [_S.read(_v13, "d")])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "-=", true)
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "layer", _S.arg(_args, 2))
	for _v14 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "d", _v14)
		var _v16 = _S.scope(_v15)
		if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.prop(_S.read(_v16, "d"), "delay"), 0), func(): return _S.logical("&&", _S.binary("===", _S.read(_v16, "layer"), "back"), func(): return _S.binary(">=", _S.prop(_S.read(_v16, "d"), "z"), 0))), func(): return _S.logical("&&", _S.binary("===", _S.read(_v16, "layer"), "front"), func(): return _S.binary("<", _S.prop(_S.read(_v16, "d"), "z"), 0)))):
			continue
		_S.define(_v16, "x", _S.prop(_S.read(_v16, "d"), "x"))
		_S.define(_v16, "y", _S.binary("-", _S.binary("*", _S.prop(_S.read(_v16, "d"), "z"), _S.prop(_S.read(_v16, "this"), "sy")), _S.prop(_S.read(_v16, "d"), "h")))
		_S.call_value(_S.read(_v16, "bead"), [_S.read(_v16, "p"), _S.read(_v16, "x"), _S.read(_v16, "y"), _S.prop(_S.read(_v16, "d"), "vx"), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v16, "d"), "vz"), _S.prop(_S.read(_v16, "this"), "sy")), _S.prop(_S.read(_v16, "d"), "vh")), _S.prop(_S.read(_v16, "d"), "s"), _S.read(_v16, "C"), _S.invoke(_S.read(_v16, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v16, "d"), "life"), 0.2)])])
		_S.invoke(_S.read(_v16, "p"), "glow", [_S.read(_v16, "x"), _S.read(_v16, "y"), _S.binary("+", 2.5, _S.prop(_S.read(_v16, "d"), "s")), _S.prop(_S.read(_v16, "C"), 5), _S.binary("+", 0.1, _S.binary("*", 0.05, _S.prop(_S.read(_v16, "d"), "s")))])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	var _v17 = _S.coalesce(_S.arg(_args, 0), func(): return _S.merge([]))
	_S.define(_e, "sy", _S.coalesce(_S.prop(_v17, "sy"), func(): return 0.22))
	_S.set_prop(_S.read(_e, "this"), "sy", _S.read(_e, "sy"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "z", _S.arg(_args, 1))
	_S.define(_e, "r0", _S.arg(_args, 2))
	_S.define(_e, "r1", _S.arg(_args, 3))
	_S.define(_e, "life", _S.arg(_args, 4))
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 5), func(): return _S.merge([])))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"z": _S.read(_e, "z")}, {"r0": _S.read(_e, "r0")}, {"r1": _S.read(_e, "r1")}, {"life": _S.read(_e, "life")}, {"age": _S.unary("-", _S.logical("??", _S.prop(_S.read(_e, "o"), "delay"), func(): return 0))}, {"k": _S.logical("??", _S.prop(_S.read(_e, "o"), "k"), func(): return 1)}, {"n": _S.logical("??", _S.prop(_S.read(_e, "o"), "n"), func(): return 2)}, {"gap": _S.logical("??", _S.prop(_S.read(_e, "o"), "gap"), func(): return 3)}, {"hot": _S.logical("??", _S.prop(_S.read(_e, "o"), "hot"), func(): return 0.1)}, {"glint": _S.logical("??", _S.prop(_S.read(_e, "o"), "glint"), func(): return 0)}, {"seed": _S.set_prop(_S.read(_e, "this"), "seq", _S.binary("+", _S.logical("??", _S.prop(_S.read(_e, "this"), "seq"), func(): return 0), 1), "=", false)}])])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.prop(_S.prop(_S.read(_e, "this"), "list"), "length")

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	var _v18 = _S.scope(_e)
	_S.define(_v18, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v18, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v18, "i"), 0)):
		if _S.truth(_S.binary(">=", _S.set_prop(_S.prop(_S.prop(_S.read(_v18, "this"), "list"), _S.read(_v18, "i")), "age", _S.read(_v18, "dt"), "+=", false), _S.prop(_S.prop(_S.prop(_S.read(_v18, "this"), "list"), _S.read(_v18, "i")), "life"))):
			_S.invoke(_S.prop(_S.read(_v18, "this"), "list"), "splice", [_S.read(_v18, "i"), 1])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "i", 1, "-=", true)
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "half", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	for _v19 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "q", _v19)
		var _v21 = _S.scope(_v20)
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v21, "q"), "age"), 0)):
			continue
		_S.define(_v21, "u", _S.binary("/", _S.prop(_S.read(_v21, "q"), "age"), _S.prop(_S.read(_v21, "q"), "life")))
		_S.define(_v21, "r", _S.binary("+", _S.prop(_S.read(_v21, "q"), "r0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v21, "q"), "r1"), _S.prop(_S.read(_v21, "q"), "r0")), _S.binary("-", 1, _S.invoke(_S.read(_v21, "Math"), "pow", [_S.binary("-", 1, _S.read(_v21, "u")), 2.6])))))
		_S.define(_v21, "k", _S.binary("*", _S.prop(_S.read(_v21, "q"), "k"), _S.invoke(_S.read(_v21, "Math"), "pow", [_S.binary("-", 1, _S.read(_v21, "u")), 1.7])))
		_S.call_value(_S.read(_v21, "ring"), [_S.read(_v21, "p"), _S.prop(_S.read(_v21, "q"), "x"), _S.binary("*", _S.prop(_S.read(_v21, "q"), "z"), _S.prop(_S.read(_v21, "this"), "sy")), _S.read(_v21, "r"), _S.prop(_S.read(_v21, "this"), "sy"), _S.read(_v21, "k"), _S.read(_v21, "C"), _S.merge([{"n": _S.prop(_S.read(_v21, "q"), "n")}, {"gap": _S.binary("*", _S.prop(_S.read(_v21, "q"), "gap"), _S.binary("+", 0.55, _S.binary("*", 0.6, _S.read(_v21, "u"))))}, {"half": _S.read(_v21, "half")}, {"hot": _S.binary("<", _S.prop(_S.read(_v21, "q"), "age"), _S.prop(_S.read(_v21, "q"), "hot"))}, {"glint": _S.binary("*", _S.prop(_S.read(_v21, "q"), "glint"), _S.read(_v21, "k"))}, {"seed": _S.prop(_S.read(_v21, "q"), "seed")}])])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "vy", _S.arg(_args, 3))
	_S.define(_e, "r0", _S.arg(_args, 4))
	_S.define(_e, "r1", _S.arg(_args, 5))
	_S.define(_e, "life", _S.arg(_args, 6))
	_S.define(_e, "c", _S.arg(_args, 7))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 8), func(): return 0.25))
	_S.define(_e, "delay", _S.coalesce(_S.arg(_args, 9), func(): return 0))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"vx": _S.read(_e, "vx")}, {"vy": _S.read(_e, "vy")}, {"r0": _S.read(_e, "r0")}, {"r1": _S.read(_e, "r1")}, {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}, {"c": _S.call_value(_S.read(_e, "hex"), [_S.read(_e, "c")])}, {"a": _S.read(_e, "a")}, {"delay": _S.read(_e, "delay")}])])
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.prop(_S.prop(_S.read(_e, "this"), "list"), "length")

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	var _v22 = _S.scope(_e)
	_S.define(_v22, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v22, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v22, "i"), 0)):
		var _v23 = _S.scope(_v22)
		_S.define(_v23, "m", _S.prop(_S.prop(_S.read(_v23, "this"), "list"), _S.read(_v23, "i")))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v23, "m"), "delay"), 0)):
			var _v24 = _S.scope(_v23)
			_S.set_prop(_S.read(_v24, "m"), "delay", _S.read(_v24, "dt"), "-=", false)
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v23, "m"), "life", _S.read(_v23, "dt"), "-=", false), 0)):
			var _v25 = _S.scope(_v23)
			_S.invoke(_S.prop(_S.read(_v25, "this"), "list"), "splice", [_S.read(_v25, "i"), 1])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v23, "m"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v23, "m"), "vx"), 2.4), _S.read(_v23, "dt")), "-=", false)
		_S.set_prop(_S.read(_v23, "m"), "vy", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v23, "m"), "vy"), 2.4), _S.read(_v23, "dt")), _S.binary("*", 7, _S.read(_v23, "dt"))), "-=", false)
		_S.set_prop(_S.read(_v23, "m"), "x", _S.binary("*", _S.prop(_S.read(_v23, "m"), "vx"), _S.read(_v23, "dt")), "+=", false)
		_S.set_prop(_S.read(_v23, "m"), "y", _S.binary("*", _S.prop(_S.read(_v23, "m"), "vy"), _S.read(_v23, "dt")), "+=", false)
		_v22 = _S.iteration(_v22)
		_S.write(_v22, "i", 1, "-=", true)
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "haze", _S.arg(_args, 1))
	for _v26 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "m", _v26)
		var _v28 = _S.scope(_v27)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v28, "m"), "delay"), 0)):
			continue
		_S.define(_v28, "age", _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_v28, "m"), "life"), _S.prop(_S.read(_v28, "m"), "max"))))
		_S.define(_v28, "r", _S.binary("+", _S.prop(_S.read(_v28, "m"), "r0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v28, "m"), "r1"), _S.prop(_S.read(_v28, "m"), "r0")), _S.binary("-", 1, _S.invoke(_S.read(_v28, "Math"), "pow", [_S.binary("-", 1, _S.read(_v28, "age")), 2.2])))))
		_S.define(_v28, "a", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v28, "m"), "a"), _S.invoke(_S.read(_v28, "Math"), "min", [1, _S.binary("/", _S.read(_v28, "age"), 0.12)])), _S.invoke(_S.read(_v28, "Math"), "pow", [_S.binary("-", 1, _S.read(_v28, "age")), 1.4])))
		if _S.truth(_S.binary("<", _S.read(_v28, "a"), 0.01)):
			continue
		_S.invoke(_S.read(_v28, "p"), "disc", [_S.prop(_S.read(_v28, "m"), "x"), _S.prop(_S.read(_v28, "m"), "y"), _S.read(_v28, "r"), _S.prop(_S.read(_v28, "m"), "c"), _S.function_value(_v28, "_f23")])
		_S.invoke(_S.read(_v28, "p"), "disc", [_S.binary("-", _S.prop(_S.read(_v28, "m"), "x"), _S.binary("*", _S.read(_v28, "r"), 0.2)), _S.binary("-", _S.prop(_S.read(_v28, "m"), "y"), _S.binary("*", _S.read(_v28, "r"), 0.32)), _S.binary("*", _S.read(_v28, "r"), 0.55), _S.read(_v28, "WHITE"), _S.function_value(_v28, "_f24")])
		if _S.truth(_S.read(_v28, "haze")):
			_S.invoke(_S.read(_v28, "p"), "glow", [_S.prop(_S.read(_v28, "m"), "x"), _S.prop(_S.read(_v28, "m"), "y"), _S.binary("*", _S.read(_v28, "r"), 1.5), _S.read(_v28, "haze"), _S.binary("*", _S.binary("/", _S.binary("*", 0.16, _S.read(_v28, "a")), _S.prop(_S.read(_v28, "m"), "a")), _S.invoke(_S.read(_v28, "Math"), "min", [1, _S.binary("*", _S.prop(_S.read(_v28, "m"), "a"), 3)]))])
	return null

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.read(_e, "a"), _S.binary("-", 1, _S.binary("*", _S.read(_e, "d"), _S.read(_e, "d")))), _S.binary("-", 1, _S.binary("*", _S.read(_e, "d"), 0.5)))

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "a"), 0.25), _S.binary("-", 1, _S.read(_e, "d"))), _S.binary("-", 1, _S.read(_e, "d")))

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.invoke(_S.read(_e, "ROCK"), "map", [_S.read(_e, "hex")])
