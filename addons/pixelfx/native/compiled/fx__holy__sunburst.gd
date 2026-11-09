@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/sunburst.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "GOLD", _S.import_value("fx/holy/_lib.js", "GOLD"))
	_S.define(_e, "ray", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Sunburst"}, {"desc": "A white-hot core in a gold corona; long and short rays turn slowly round it, breathing, with glints running out along them that wink at the tips."}, {"tags": ["holy", "sun", "radiant", "rays", "light", "glow", "loop"]}, {"size": [128, 128]}, {"origin": [64, 64]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": _S.read(_e, "GOLD")}, {"rays": 8}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CORE", 4.5)
	_S.define(_e, "RING", 7.5)
	_S.define(_e, "R0", 9)
	_S.define(_e, "frac", _S.function_value(_e, "_f8"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "a", _S.arg(_args, 2))
	_S.define(_e, "L", _S.arg(_args, 3))
	_S.define(_e, "w0", _S.arg(_args, 4))
	_S.define(_e, "k", _S.arg(_args, 5))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	_S.define(_e, "x1", _S.binary("*", _S.read(_e, "ca"), _S.binary("+", _S.read(_e, "R0"), _S.read(_e, "L"))))
	_S.define(_e, "y1", _S.binary("*", _S.read(_e, "sa"), _S.binary("+", _S.read(_e, "R0"), _S.read(_e, "L"))))
	_S.define(_e, "pad", _S.binary("+", _S.read(_e, "w0"), 1))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "min", [0, _S.read(_e, "x1")]), _S.read(_e, "pad")), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "min", [0, _S.read(_e, "y1")]), _S.read(_e, "pad")), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "x1")]), _S.read(_e, "pad")), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "y1")]), _S.read(_e, "pad")), _S.function_value(_e, "_f1")])
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.binary("*", _S.read(_e, "ca"), _S.read(_e, "R0")), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "R0")), _S.binary("*", _S.read(_e, "ca"), _S.binary("+", _S.read(_e, "R0"), _S.binary("*", _S.read(_e, "L"), 0.8))), _S.binary("*", _S.read(_e, "sa"), _S.binary("+", _S.read(_e, "R0"), _S.binary("*", _S.read(_e, "L"), 0.8))), 5, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.16, _S.read(_e, "k"))])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "along", _S.binary("-", _S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "y"), _S.read(_e, "sa"))), _S.read(_e, "R0")))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "along"), _S.read(_e, "L")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary(">", _S.read(_e, "u"), 1))):
		return null
	_S.define(_e, "across", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "x")), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "y"), _S.read(_e, "ca")))]))
	_S.define(_e, "w", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "w0"), 2), _S.binary("-", 1, _S.binary("*", _S.read(_e, "u"), 0.85))), 0.25))
	if _S.truth(_S.binary(">", _S.read(_e, "across"), _S.read(_e, "w"))):
		return null
	_S.define(_e, "spine", _S.binary("<", _S.read(_e, "across"), 0.5))
	_S.define(_e, "rim", _S.logical("&&", _S.binary(">", _S.read(_e, "across"), _S.binary("-", _S.read(_e, "w"), 0.6)), func(): return _S.binary(">", _S.read(_e, "w"), 0.9)))
	_S.set_prop(_S.read(_e, "out"), "c", ((_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.4)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.75)) else _S.prop(_S.read(_e, "C"), 5))) if _S.truth(_S.read(_e, "spine")) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.logical("&&", _S.read(_e, "rim"), func(): return _S.binary(">", _S.read(_e, "u"), 0.15))) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.62)) else _S.prop(_S.read(_e, "C"), 4))))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", (_S.read(_e, "k") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.72)) else _S.binary("*", _S.binary("*", _S.read(_e, "k"), _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "u"), 0.72), 0.28))), 1.2)), "=", false)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "N", _S.binary("*", _S.prop(_S.read(_e, "o"), "rays"), 2))
	_S.define(_e, "T", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "rot", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")), _S.binary("/", _S.binary("*", 2, _S.read(_e, "TAU")), _S.read(_e, "N"))))
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, 62, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.3, _S.binary("*", 0.06, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")), _S.read(_e, "TAU")), 2)])))])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.read(_v0, "N"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.binary("+", _S.read(_v1, "rot"), _S.binary("/", _S.binary("*", _S.binary("+", _S.read(_v1, "i"), 0.5), _S.read(_v1, "TAU")), _S.read(_v1, "N"))))
		_S.define(_v1, "L", _S.binary("+", 14, _S.binary("*", 6, _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v1, "a"), 3), _S.binary("*", _S.binary("/", _S.read(_v1, "t"), _S.read(_v1, "T")), _S.read(_v1, "TAU")))]))))
		_S.invoke(_S.read(_v1, "p"), "line", [_S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.binary("+", _S.read(_v1, "R0"), 1)), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.binary("+", _S.read(_v1, "R0"), 1)), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.binary("+", _S.read(_v1, "R0"), _S.read(_v1, "L"))), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.binary("+", _S.read(_v1, "R0"), _S.read(_v1, "L"))), _S.function_value(_v1, "_f3"), _S.function_value(_v1, "_f4")])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), _S.read(_v2, "N"))):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "a", _S.binary("+", _S.read(_v3, "rot"), _S.binary("/", _S.binary("*", _S.read(_v3, "i"), _S.read(_v3, "TAU")), _S.read(_v3, "N"))))
		_S.define(_v3, "long", _S.binary("===", _S.binary("%", _S.read(_v3, "i"), 2), 0))
		_S.define(_v3, "breathe", _S.binary("+", 0.86, _S.binary("*", 0.14, _S.invoke(_S.read(_v3, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_v3, "a"), 3), _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v3, "t"), _S.read(_v3, "T")), _S.read(_v3, "TAU")), 2))]))))
		_S.define(_v3, "L", _S.binary("*", (36 if _S.truth(_S.read(_v3, "long")) else 21), _S.read(_v3, "breathe")))
		_S.call_value(_S.read(_v3, "ray"), [_S.read(_v3, "p"), _S.read(_v3, "C"), _S.read(_v3, "a"), _S.read(_v3, "L"), (4 if _S.truth(_S.read(_v3, "long")) else 2.6), 1])
		if _S.truth(_S.read(_v3, "long")):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "g", _S.call_value(_S.read(_v4, "frac"), [_S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v4, "t"), _S.read(_v4, "T")), 2), _S.binary("/", _S.binary("*", _S.read(_v4, "a"), 3), _S.read(_v4, "TAU")))]))
			_S.define(_v4, "r", _S.binary("+", _S.read(_v4, "R0"), _S.binary("*", _S.read(_v4, "g"), _S.read(_v4, "L"))))
			if _S.truth(_S.binary("<", _S.read(_v4, "g"), 0.9)):
				var _v5 = _S.scope(_v4)
				_S.invoke(_S.read(_v5, "p"), "px", [_S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "r")), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "r")), _S.read(_v5, "WHITE")])
				_S.invoke(_S.read(_v5, "p"), "glow", [_S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "r")), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "r")), 5, _S.prop(_S.read(_v5, "C"), 6), _S.binary("*", 0.45, _S.binary("-", 1, _S.read(_v5, "g")))])
			else:
				_S.call_value(_S.read(_v4, "sparkle"), [_S.read(_v4, "p"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.binary("+", _S.read(_v4, "R0"), _S.read(_v4, "L"))), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.binary("+", _S.read(_v4, "R0"), _S.read(_v4, "L"))), _S.binary("+", 1, _S.binary("*", 3, _S.invoke(_S.read(_v4, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v4, "g"), 0.9), 0.1), _S.prop(_S.read(_v4, "Math"), "PI"))]))), _S.read(_v4, "WHITE"), _S.prop(_S.read(_v4, "C"), 6), 0.5])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "RING")), 2), _S.binary("-", _S.unary("-", _S.read(_e, "RING")), 2), _S.binary("+", _S.read(_e, "RING"), 2), _S.binary("+", _S.read(_e, "RING"), 2), _S.function_value(_e, "_f5")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, 16, _S.read(_e, "WHITE"), 0.28])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "T"), 10, _S.prop(_S.read(_e, "o"), "seed"), _S.function_value(_e, "_f6"), _S.function_value(_e, "_f7")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else _S.prop(_S.read(_e, "C"), 5))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("-", 0.7, _S.binary("*", _S.read(_e, "u"), 0.8))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y")]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "RING"))):
		return null
	_S.define(_e, "flick", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "y"), _S.read(_e, "x")]), 5), _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")), _S.read(_e, "TAU")), 3))]))))
	_S.set_prop(_S.read(_e, "out"), "c", (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "d"), _S.read(_e, "CORE"))) else ((_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "flick"), 0.6)) else _S.prop(_S.read(_e, "C"), 6)) if _S.truth(_S.binary("<", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "CORE"), 1.5))) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "flick"), 0.5)) else _S.prop(_S.read(_e, "C"), 4)))), "=", false)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.35, 0.7])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "R"), "range", [16, 44]))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")), _S.prop(_S.read(_e, "Math"), "PI"))]))
	_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "d")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "d")), _S.binary("+", 1, _S.binary("*", _S.binary("*", 2.4, _S.read(_e, "k")), _S.invoke(_S.read(_e, "R"), "range", [0.5, 1]))), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.4, _S.read(_e, "k"))])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("-", _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]))
