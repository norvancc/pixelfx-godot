@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/whirlpool.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "foam", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Whirlpool"}, {"desc": "Seen from above, dark water winds into a vortex: foam arms spiral in, darkening as they're drawn down into a deep eye with a lit far rim, flecks of foam circling in after them."}, {"tags": ["water", "whirlpool", "vortex", "maelstrom", "swirl", "top-down", "loop"]}, {"size": [128, 84]}, {"origin": [64, 42]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "R", 60)
	_S.define(_e, "SY", 0.6)
	_S.define(_e, "K", 2.4)
	_S.define(_e, "EYE", 0.16)
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "rho", _S.arg(_args, 0))
	_S.define(_e, "th", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "log", [_S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "rho"), 0.02])]))
	_S.define(_e, "a", _S.binary("+", _S.binary("+", _S.read(_e, "th"), _S.binary("*", _S.read(_e, "K"), _S.read(_e, "s"))), _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))))
	_S.define(_e, "b", _S.binary("+", _S.binary("+", _S.read(_e, "th"), _S.binary("*", _S.binary("*", _S.read(_e, "K"), 1.35), _S.read(_e, "s"))), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2)))
	_S.define(_e, "one", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("*", 7, _S.read(_e, "a")), _S.binary("*", 0.9, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", 3, _S.read(_e, "a")), _S.binary("*", _S.read(_e, "s"), 4))])))]))), 26]))
	_S.define(_e, "two", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("*", 11, _S.read(_e, "b")), 1.3)]))), 34]), 0.7))
	_S.define(_e, "three", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", 17, _S.binary("+", _S.binary("+", _S.read(_e, "th"), _S.binary("*", _S.binary("*", _S.read(_e, "K"), 0.8), _S.read(_e, "s"))), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 3)))]))), 30]), 0.8), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.binary("-", _S.read(_e, "rho"), _S.read(_e, "EYE")), 2.2))])))
	_S.define(_e, "dash", _S.binary("+", 0.55, _S.binary("*", 0.45, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.read(_e, "s"), 22), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 4)), _S.binary("*", _S.read(_e, "a"), 2))]))))
	return _S.binary("*", _S.binary("+", _S.binary("+", _S.read(_e, "one"), _S.read(_e, "two")), _S.read(_e, "three")), _S.read(_e, "dash"))

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "ry", _S.binary("*", _S.read(_e, "R"), _S.read(_e, "SY")))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", _S.read(_e, "R")), _S.unary("-", _S.read(_e, "ry")), _S.read(_e, "R"), _S.read(_e, "ry"), _S.function_value(_e, "_f2")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 30, _S.prop(_S.read(_e, "o"), "seed"), _S.function_value(_e, "_f3"), _S.function_value(_e, "_f4")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 8, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 3), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, _S.binary("*", _S.read(_e, "R"), 0.9), _S.prop(_S.read(_e, "C"), 4), 0.2])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "R"), _S.read(_e, "EYE")), 1.6), 6), _S.prop(_S.read(_e, "C"), 5), 0.28])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("*", _S.binary("*", _S.unary("-", _S.read(_e, "ry")), _S.read(_e, "EYE")), 0.8), 14, _S.prop(_S.read(_e, "C"), 5), 0.32])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "R")))
	_S.define(_e, "dy", _S.binary("/", _S.read(_e, "y"), _S.read(_e, "ry")))
	_S.define(_e, "rho", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	if _S.truth(_S.binary(">", _S.read(_e, "rho"), 1)):
		return null
	_S.define(_e, "th", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]))
	if _S.truth(_S.binary("<", _S.read(_e, "rho"), _S.read(_e, "EYE"))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "far", _S.binary("/", _S.unary("-", _S.read(_v0, "dy")), _S.read(_v0, "rho")))
		_S.define(_v0, "wall", _S.binary("/", _S.binary("-", _S.binary("/", _S.read(_v0, "rho"), _S.read(_v0, "EYE")), 0.35), 0.65))
		if _S.truth(_S.binary(">", _S.read(_v0, "far"), 0)):
			_S.set_prop(_S.read(_v0, "out"), "c", ((_S.prop(_S.read(_v0, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v0, "far"), 0.6)) else _S.prop(_S.read(_v0, "C"), 4)) if _S.truth(_S.binary(">", _S.read(_v0, "wall"), 0.8)) else (_S.prop(_S.read(_v0, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v0, "wall"), 0.45)) else (_S.prop(_S.read(_v0, "C"), 2) if _S.truth(_S.binary(">", _S.read(_v0, "wall"), 0.15)) else _S.prop(_S.read(_v0, "C"), 0)))), "=", false)
		else:
			_S.set_prop(_S.read(_v0, "out"), "c", (_S.prop(_S.read(_v0, "C"), 2) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v0, "wall"), 0.85), func(): return _S.binary(">", _S.read(_v0, "far"), _S.unary("-", 0.5)))) else _S.prop(_S.read(_v0, "C"), 0)), "=", false)
		return null
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "rho"), _S.read(_e, "EYE")), _S.binary("-", 1, _S.read(_e, "EYE"))))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.62, 1, _S.read(_e, "k")])))
	_S.invoke(_S.read(_e, "p"), "blend", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 0) if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.25)) else _S.prop(_S.read(_e, "C"), 1)), _S.binary("*", _S.binary("-", 0.75, _S.binary("*", 0.25, _S.read(_e, "k"))), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.8, 1, _S.read(_e, "k")])))])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0.3), func(): return _S.binary("<", _S.read(_e, "k"), 0.8))):
		_S.invoke(_S.read(_e, "p"), "blend", [_S.read(_e, "x"), _S.read(_e, "y"), _S.prop(_S.read(_e, "C"), 2), _S.binary("*", 0.18, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.binary("-", _S.read(_e, "k"), 0.3)), 0.5)]))])
	if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.035)):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "g", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v1, "Math"), "cos", [_S.binary("-", _S.binary("*", _S.read(_v1, "th"), 9), _S.binary("*", _S.binary("*", _S.read(_v1, "ph"), _S.read(_v1, "TAU")), 6))]))))
		_S.set_prop(_S.read(_v1, "out"), "c", (_S.read(_v1, "WHITE") if _S.truth(_S.binary(">", _S.read(_v1, "g"), 0.7)) else (_S.prop(_S.read(_v1, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v1, "g"), 0.3)) else _S.prop(_S.read(_v1, "C"), 4))), "=", false)
		return null
	_S.define(_e, "I", _S.binary("*", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "foam"), [_S.read(_e, "rho"), _S.read(_e, "th"), _S.read(_e, "ph")]), _S.read(_e, "fade")), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("-", _S.read(_e, "k"), 0.08), 4)])), _S.binary("+", 0.45, _S.binary("*", 0.55, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 1.25)]))])))))
	if _S.truth(_S.binary(">", _S.read(_e, "I"), 0.12)):
		var _v2 = _S.scope(_e)
		_S.set_prop(_S.read(_v2, "out"), "c", (_S.read(_v2, "WHITE") if _S.truth(_S.binary(">", _S.read(_v2, "I"), 0.75)) else (_S.prop(_S.read(_v2, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v2, "I"), 0.45)) else (_S.prop(_S.read(_v2, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v2, "I"), 0.25)) else _S.prop(_S.read(_v2, "C"), 4)))), "=", false)
		if _S.truth(_S.binary(">", _S.read(_v2, "I"), 0.25)):
			_S.last([_S.set_prop(_S.read(_v2, "out"), "l", _S.prop(_S.read(_v2, "C"), 5), "=", false), _S.set_prop(_S.read(_v2, "out"), "k", _S.binary("+", 0.08, _S.binary("*", 0.14, _S.invoke(_S.read(_v2, "Math"), "min", [1, _S.read(_v2, "I")]))), "=", false)])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [1.2, 2.2])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "rho", _S.binary("-", 0.8, _S.binary("*", _S.binary("*", 0.62, _S.read(_e, "u")), _S.read(_e, "u"))))
	_S.define(_e, "a0", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "th", _S.binary("-", _S.read(_e, "a0"), _S.binary("*", _S.read(_e, "K"), _S.invoke(_S.read(_e, "Math"), "log", [_S.read(_e, "rho")]))))
	_S.define(_e, "ang", _S.binary("-", _S.read(_e, "th"), _S.binary("*", _S.read(_e, "age"), _S.binary("+", 1.5, _S.binary("/", 2.2, _S.read(_e, "rho"))))))
	_S.define(_e, "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]), _S.read(_e, "rho")), _S.read(_e, "R")))
	_S.define(_e, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]), _S.read(_e, "rho")), _S.read(_e, "ry")))
	_S.define(_e, "ang2", _S.binary("+", _S.read(_e, "ang"), _S.binary("/", 0.12, _S.read(_e, "rho"))))
	_S.define(_e, "x2", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang2")]), _S.read(_e, "rho")), _S.read(_e, "R")))
	_S.define(_e, "y2", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang2")]), _S.read(_e, "rho")), _S.read(_e, "ry")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0.85), func(): return _S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), _S.binary("*", _S.binary("-", _S.read(_e, "u"), 0.85), 6)))):
		return null
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x2"), _S.read(_e, "y2"), _S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.2)) else (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "C"), 6)))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.25, 0.45])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "rho", _S.invoke(_S.read(_e, "r"), "range", [0.35, 0.8]))
	_S.define(_e, "th", _S.binary("-", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]), _S.binary("*", _S.read(_e, "age"), 2.5)))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "age")), _S.read(_e, "life"))]))
	_S.define(_e, "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "rho")), _S.read(_e, "R")))
	_S.define(_e, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]), _S.read(_e, "rho")), _S.read(_e, "ry")))
	if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "foam"), [_S.read(_e, "rho"), _S.read(_e, "th"), _S.read(_e, "ph")]), 0.35)):
		return null
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "WHITE")])
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.55)):
		for _v3 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
			var _v4 = _S.scope(_e)
			var _v5 = _v3
			_S.define(_v4, "dx", _S.prop(_v5, 0))
			_S.define(_v4, "dy", _S.prop(_v5, 1))
			_S.invoke(_S.read(_v4, "p"), "px", [_S.binary("+", _S.read(_v4, "x"), _S.read(_v4, "dx")), _S.binary("+", _S.read(_v4, "y"), _S.read(_v4, "dy")), _S.prop(_S.read(_v4, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 5, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.4, _S.read(_e, "k"))])
	return null
