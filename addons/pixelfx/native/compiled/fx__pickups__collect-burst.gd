@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/collect-burst.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Collect burst"}, {"desc": "The moment of pickup: a white flash and a cross of light, a thin ring snapping out ahead of a softer one, twinkles thrown wide on curving paths that brake, hang and wink out."}, {"tags": ["pickup", "collect", "burst", "sparkle", "reward", "one-shot"]}, {"size": [112, 108]}, {"origin": [56, 94]}, {"duration": 1.35}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0516", "#3d0a33", "#701560", "#b0228f", "#f53cd1", "#ff86e6", "#ffd2f6", "#ffffff"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CY", _S.unary("-", 30))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.read(_e, "CY"), 36, _S.prop(_S.read(_e, "C"), 5), 0.85, 0.32])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.read(_e, "CY"), 14, _S.read(_e, "WHITE"), 0.75, 0.08])
	_S.define(_e, "stars", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 14}]), _S.function_value(_e, "_f1")]))
	_S.define(_e, "motes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 7}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 14), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.2), 0.2])))
	_S.define(_e, "sp", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [145, 225]), (1.12 if _S.truth(_S.binary("===", _S.binary("%", _S.read(_e, "i"), 3), 0)) else 0.85)))
	return _S.merge([{"x": 0}, {"y": _S.read(_e, "CY")}, {"a": _S.read(_e, "a")}, {"sp": _S.read(_e, "sp")}, {"turn": _S.binary("*", (1 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.unary("-", 1)), _S.invoke(_S.read(_e, "R"), "range", [2.5, 5]))}, {"life": _S.invoke(_S.read(_e, "R"), "range", [0.75, 1.15])}, {"age": 0}, {"size": (2.6 if _S.truth(_S.binary("===", _S.binary("%", _S.read(_e, "i"), 3), 0)) else _S.invoke(_S.read(_e, "R"), "range", [1.2, 2]))}, {"tr": []}, {"c": (_S.read(_e, "WHITE") if _S.truth(_S.binary("===", _S.binary("%", _S.read(_e, "i"), 4), 0)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.prop(_S.read(_e, "C"), 5)))}, {"ph": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.merge([{"x": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 8), 8])}, {"y": _S.binary("+", _S.read(_e, "CY"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 4), 6]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [12, 30]))}, {"life": _S.invoke(_S.read(_e, "R"), "range", [0.5, 0.9])}, {"d": _S.invoke(_S.read(_e, "R"), "range", [0.05, 0.25])}, {"w": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v0 in _S.array(_S.read(_e, "stars")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		var _v2 = _S.scope(_v1)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v2, "s"), "age"), _S.prop(_S.read(_v2, "s"), "life"))):
			continue
		_S.set_prop(_S.read(_v2, "s"), "age", _S.read(_v2, "dt"), "+=", false)
		_S.invoke(_S.prop(_S.read(_v2, "s"), "tr"), "unshift", [[_S.prop(_S.read(_v2, "s"), "x"), _S.prop(_S.read(_v2, "s"), "y")]])
		if _S.truth(_S.binary(">", _S.prop(_S.prop(_S.read(_v2, "s"), "tr"), "length"), 4)):
			_S.invoke(_S.prop(_S.read(_v2, "s"), "tr"), "pop", [])
		_S.set_prop(_S.read(_v2, "s"), "a", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v2, "s"), "turn"), _S.read(_v2, "dt")), _S.invoke(_S.read(_v2, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.prop(_S.read(_v2, "s"), "age"), 1.5))])), "+=", false)
		_S.set_prop(_S.read(_v2, "s"), "sp", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v2, "s"), "sp"), 4.3), _S.read(_v2, "dt")), "-=", false)
		_S.set_prop(_S.read(_v2, "s"), "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.prop(_S.read(_v2, "s"), "a")]), _S.prop(_S.read(_v2, "s"), "sp")), _S.read(_v2, "dt")), "+=", false)
		_S.set_prop(_S.read(_v2, "s"), "y", _S.binary("+", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.prop(_S.read(_v2, "s"), "a")]), _S.prop(_S.read(_v2, "s"), "sp")), _S.read(_v2, "dt")), _S.binary("*", _S.binary("*", 6, _S.prop(_S.read(_v2, "s"), "age")), _S.read(_v2, "dt"))), "+=", false)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v2, "s"), "y"), _S.unary("-", 2))):
			_S.last([_S.set_prop(_S.read(_v2, "s"), "y", _S.unary("-", 2), "=", false), _S.set_prop(_S.read(_v2, "s"), "a", _S.unary("-", _S.invoke(_S.read(_v2, "Math"), "abs", [_S.prop(_S.read(_v2, "s"), "a")])), "=", false), _S.set_prop(_S.read(_v2, "s"), "sp", 0.5, "*=", false)])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.07)):
		_S.invoke(_S.read(_e, "p"), "circle", [0, _S.read(_e, "CY"), _S.binary("+", _S.binary("*", 5.5, _S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.07))), 1), _S.read(_e, "WHITE")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.16)):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "k", _S.binary("-", 1, _S.binary("/", _S.read(_v3, "t"), 0.16)))
		_S.define(_v3, "L", _S.binary("*", _S.binary("*", 26, _S.invoke(_S.read(_v3, "ease"), "outCubic", [_S.invoke(_S.read(_v3, "Math"), "min", [1, _S.binary("+", _S.binary("/", _S.read(_v3, "t"), 0.03), 0.4)])])), _S.read(_v3, "k")))
		for _v4 in _S.array([[1, 0, 1], [_S.unary("-", 1), 0, 1], [0, 1, 0.6], [0, _S.unary("-", 1), 0.6]]):
			var _v5 = _S.scope(_v3)
			var _v6 = _v4
			_S.define(_v5, "dx", _S.prop(_v6, 0))
			_S.define(_v5, "dy", _S.prop(_v6, 1))
			_S.define(_v5, "l", _S.prop(_v6, 2))
			_S.invoke(_S.read(_v5, "p"), "line", [0, _S.read(_v5, "CY"), _S.binary("*", _S.binary("*", _S.read(_v5, "dx"), _S.read(_v5, "L")), _S.read(_v5, "l")), _S.binary("+", _S.read(_v5, "CY"), _S.binary("*", _S.binary("*", _S.read(_v5, "dy"), _S.read(_v5, "L")), _S.read(_v5, "l"))), _S.function_value(_v5, "_f5"), _S.function_value(_v5, "_f6")])
		_S.invoke(_S.read(_v3, "p"), "glow", [0, _S.read(_v3, "CY"), _S.binary("+", _S.binary("*", 20, _S.read(_v3, "k")), 4), _S.prop(_S.read(_v3, "C"), 5), _S.binary("*", 0.6, _S.read(_v3, "k"))])
	_S.define(_e, "u1", _S.binary("/", _S.read(_e, "t"), 0.32))
	if _S.truth(_S.binary("<", _S.read(_e, "u1"), 1)):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "r", _S.binary("+", 3, _S.binary("*", 23, _S.invoke(_S.read(_v7, "ease"), "outExpo", [_S.read(_v7, "u1")]))))
		_S.invoke(_S.read(_v7, "p"), "ring", [0, _S.read(_v7, "CY"), _S.read(_v7, "r"), 1, (_S.read(_v7, "WHITE") if _S.truth(_S.binary("<", _S.read(_v7, "u1"), 0.3)) else _S.prop(_S.read(_v7, "C"), 6)), _S.binary("-", 1.3, _S.binary("*", _S.read(_v7, "u1"), 1.2))])
		_S.invoke(_S.read(_v7, "p"), "glowRing", [0, _S.read(_v7, "CY"), _S.read(_v7, "r"), 4, _S.prop(_S.read(_v7, "C"), 5), _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_v7, "u1")))])
	_S.define(_e, "u2", _S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.04), 0.5))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u2"), 0), func(): return _S.binary("<", _S.read(_e, "u2"), 1))):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "r", _S.binary("+", 2, _S.binary("*", 16, _S.invoke(_S.read(_v8, "ease"), "outCubic", [_S.read(_v8, "u2")]))))
		_S.invoke(_S.read(_v8, "p"), "ring", [0, _S.read(_v8, "CY"), _S.read(_v8, "r"), _S.invoke(_S.read(_v8, "Math"), "max", [1, _S.binary("*", 2.6, _S.binary("-", 1, _S.read(_v8, "u2")))]), _S.prop(_S.read(_v8, "C"), 5), _S.binary("-", 1, _S.read(_v8, "u2"))])
	for _v9 in _S.array(_S.read(_e, "stars")):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "s", _v9)
		var _v11 = _S.scope(_v10)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v11, "s"), "age"), _S.prop(_S.read(_v11, "s"), "life"))):
			continue
		_S.define(_v11, "k", _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_v11, "s"), "age"), _S.prop(_S.read(_v11, "s"), "life"))))
		_S.define(_v11, "tw", _S.binary("+", 0.65, _S.binary("*", 0.35, _S.invoke(_S.read(_v11, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v11, "s"), "age"), 26), _S.prop(_S.read(_v11, "s"), "ph"))]))))
		_S.invoke(_S.prop(_S.read(_v11, "s"), "tr"), "forEach", [_S.function_value(_v11, "_f7")])
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v11, "k"), 0.3), func(): return _S.binary("<", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v11, "s"), "age"), 40), _S.prop(_S.read(_v11, "s"), "ph"))]), 0))):
			continue
		_S.call_value(_S.read(_v11, "glint"), [_S.read(_v11, "p"), _S.prop(_S.read(_v11, "s"), "x"), _S.prop(_S.read(_v11, "s"), "y"), _S.invoke(_S.read(_v11, "Math"), "round", [_S.binary("*", _S.binary("*", _S.prop(_S.read(_v11, "s"), "size"), _S.read(_v11, "tw")), _S.invoke(_S.read(_v11, "Math"), "min", [1, _S.binary("*", _S.read(_v11, "k"), 2.5)]))]), _S.prop(_S.read(_v11, "s"), "c"), _S.binary("*", 0.45, _S.read(_v11, "k"))])
	for _v13 in _S.array(_S.read(_e, "motes")):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "m", _v13)
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "a", _S.binary("-", _S.read(_v15, "t"), _S.prop(_S.read(_v15, "m"), "d")))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v15, "a"), 0), func(): return _S.binary(">", _S.read(_v15, "a"), _S.prop(_S.read(_v15, "m"), "life")))):
			continue
		_S.define(_v15, "k", _S.binary("-", 1, _S.binary("/", _S.read(_v15, "a"), _S.prop(_S.read(_v15, "m"), "life"))))
		_S.define(_v15, "x", _S.binary("+", _S.prop(_S.read(_v15, "m"), "x"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v15, "a"), 6), _S.prop(_S.read(_v15, "m"), "w"))]), 1.5)))
		_S.define(_v15, "y", _S.binary("+", _S.prop(_S.read(_v15, "m"), "y"), _S.binary("*", _S.prop(_S.read(_v15, "m"), "vy"), _S.read(_v15, "a"))))
		_S.invoke(_S.read(_v15, "p"), "dot", [_S.read(_v15, "x"), _S.read(_v15, "y"), (_S.prop(_S.read(_v15, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v15, "k"), 0.5)) else _S.prop(_S.read(_v15, "C"), 5)), _S.binary("*", _S.read(_v15, "k"), 1.5)])
		_S.invoke(_S.read(_v15, "p"), "glow", [_S.binary("+", _S.read(_v15, "x"), 0.5), _S.binary("+", _S.read(_v15, "y"), 0.5), 3, _S.prop(_S.read(_v15, "C"), 5), _S.binary("*", 0.3, _S.read(_v15, "k"))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.65)) else _S.prop(_S.read(_e, "C"), 5)))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else _S.binary("*", _S.binary("-", 1, _S.read(_e, "u")), 2)), _S.binary("+", 0.5, _S.read(_e, "k")))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v12 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v12, 0))
	_S.define(_e, "y", _S.prop(_v12, 1))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.logical("&&", _S.binary(">", _S.read(_e, "i"), 0), func(): return _S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "i"), 2)) else _S.prop(_S.read(_e, "C"), 4)), _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_e, "i"), 4)), _S.read(_e, "k")), 1.4)]))
