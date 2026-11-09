@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/fish-school.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "bubble", _S.import_value("fx/critters/_lib.js", "bubble"))
	_S.define(_e, "fish", _S.function_value(_e, "_f0"))
	_S.define(_e, "place", _S.function_value(_e, "_f8"))
	_S.define(_e, "caustics", _S.function_value(_e, "_f9"))
	_S.define(_e, "draw", _S.function_value(_e, "_f10"))
	_S.define(_e, "meta", _S.merge([{"name": "Fish school"}, {"desc": "A school of fish holds station in two depth rows: bodies wag into swinging tails, one darts ahead now and then, bubbles rise and caustic light ripples over them."}, {"tags": ["critter", "fish", "school", "sea", "underwater", "swim", "loop"]}, {"size": [136, 80]}, {"origin": [68, 40]}, {"duration": 4.8}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#0a1a2a", "#123552", "#1d5a7e", "#2f8aa8", "#62bccc", "#bfe8e6", "#f4fff8"]}, {"stripe": ["#5a1e14", "#d8582a", "#ffa04a"]}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 28), _S.unary("-", 12), 34, 24]))
	_S.define(_e, "SCHOOL", [[_S.unary("-", 34), _S.unary("-", 16), 0.72, true, 0.1], [2, _S.unary("-", 20), 0.68, true, 0.55], [30, _S.unary("-", 10), 0.7, true, 0.3], [_S.unary("-", 22), 4, 1, false, 0.8], [12, _S.unary("-", 4), 1, false, 0.2], [_S.unary("-", 40), _S.unary("-", 2), 0.95, false, 0.45], [26, 14, 0.96, false, 0.65]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "Sp", _S.arg(_args, 2))
	_S.define(_e, "s", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "ph", _S.arg(_args, 5))
	_S.define(_e, "dart", _S.arg(_args, 6))
	_S.invoke(_S.read(_e, "g"), "clear", [])
	_S.define(_e, "L", _S.binary("*", 15, _S.read(_e, "s")))
	_S.define(_e, "H", _S.binary("*", 8, _S.read(_e, "s")))
	_S.define(_e, "beats", _S.binary("+", 12, (6 if _S.truth(_S.binary(">", _S.read(_e, "dart"), 0)) else 0)))
	_S.define(_e, "w", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), _S.read(_e, "beats")), _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))))
	_S.define(_e, "amp", _S.binary("*", _S.binary("+", 1.3, _S.binary("*", 1.2, _S.read(_e, "dart"))), _S.read(_e, "s")))
	_S.define(_e, "bend", _S.function_value(_e, "_f1"))
	_S.define(_e, "prof", _S.function_value(_e, "_f2"))
	_S.define(_e, "hh", _S.function_value(_e, "_f3"))
	_S.invoke(_S.read(_e, "g"), "shade", [_S.unary("-", _S.read(_e, "L")), _S.unary("-", _S.read(_e, "H")), 0, _S.read(_e, "H"), _S.function_value(_e, "_f4")])
	_S.define(_e, "tb", _S.call_value(_S.read(_e, "bend"), [1]))
	_S.define(_e, "ta", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "atan", [_S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "amp"), 1.8), 0.9), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("-", _S.read(_e, "w"), 4)]))]), 0.8))
	_S.define(_e, "TL", _S.binary("*", 6, _S.read(_e, "s")))
	_S.define(_e, "hb", _S.call_value(_S.read(_e, "hh"), [1]))
	_S.define(_e, "rot", _S.function_value(_e, "_f5"))
	_S.invoke(_S.read(_e, "g"), "poly", [[_S.call_value(_S.read(_e, "rot"), [_S.unary("-", 0.5), _S.unary("-", _S.read(_e, "hb"))]), _S.call_value(_S.read(_e, "rot"), [_S.read(_e, "TL"), _S.binary("-", _S.unary("-", _S.read(_e, "hb")), _S.binary("*", 3.4, _S.read(_e, "s")))]), _S.call_value(_S.read(_e, "rot"), [_S.binary("*", _S.read(_e, "TL"), 0.62), 0]), _S.call_value(_S.read(_e, "rot"), [_S.read(_e, "TL"), _S.binary("+", _S.read(_e, "hb"), _S.binary("*", 3.4, _S.read(_e, "s")))]), _S.call_value(_S.read(_e, "rot"), [_S.unary("-", 0.5), _S.read(_e, "hb")])], _S.function_value(_e, "_f6"), 0.88])
	_S.define(_e, "d0", 0.34)
	_S.define(_e, "d1", 0.66)
	_S.invoke(_S.read(_e, "g"), "poly", [[[_S.binary("*", _S.unary("-", _S.read(_e, "d0")), _S.read(_e, "L")), _S.binary("+", _S.binary("-", _S.call_value(_S.read(_e, "bend"), [_S.read(_e, "d0")]), _S.call_value(_S.read(_e, "hh"), [_S.read(_e, "d0")])), 0.5)], [_S.binary("*", _S.unary("-", _S.binary("+", _S.read(_e, "d0"), 0.08)), _S.read(_e, "L")), _S.binary("-", _S.binary("-", _S.call_value(_S.read(_e, "bend"), [_S.read(_e, "d0")]), _S.call_value(_S.read(_e, "hh"), [_S.read(_e, "d0")])), _S.binary("*", 3.6, _S.read(_e, "s")))], [_S.binary("*", _S.unary("-", _S.read(_e, "d1")), _S.read(_e, "L")), _S.binary("+", _S.binary("-", _S.call_value(_S.read(_e, "bend"), [_S.read(_e, "d1")]), _S.call_value(_S.read(_e, "hh"), [_S.read(_e, "d1")])), 0.5)]], _S.function_value(_e, "_f7"), 0.85])
	_S.define(_e, "pf", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "w"), 0.5)]), 1.2))
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("*", _S.unary("-", 0.34), _S.read(_e, "L")), _S.binary("+", _S.binary("+", _S.call_value(_S.read(_e, "bend"), [0.34]), _S.binary("*", 1.5, _S.read(_e, "s"))), _S.binary("*", _S.read(_e, "pf"), 0.3)), _S.prop(_S.read(_e, "C"), 4), 0.85])
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("-", _S.binary("*", _S.unary("-", 0.34), _S.read(_e, "L")), 1), _S.binary("+", _S.binary("+", _S.call_value(_S.read(_e, "bend"), [0.34]), _S.binary("*", 2, _S.read(_e, "s"))), _S.binary("*", _S.read(_e, "pf"), 0.6)), _S.prop(_S.read(_e, "C"), 4), 0.85])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", _S.unary("-", 2))
	while _S.truth(_S.binary("<=", _S.read(_v0, "y"), 1)):
		_S.invoke(_S.read(_v0, "g"), "set", [_S.binary("*", _S.unary("-", 0.26), _S.read(_v0, "L")), _S.binary("+", _S.call_value(_S.read(_v0, "bend"), [0.26]), _S.binary("*", _S.read(_v0, "y"), _S.read(_v0, "s"))), _S.prop(_S.read(_v0, "C"), 2)])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	_S.define(_e, "ex", _S.binary("-", _S.binary("*", _S.unary("-", 0.13), _S.read(_e, "L")), 1))
	_S.define(_e, "ey", _S.binary("-", _S.call_value(_S.read(_e, "bend"), [0.13]), _S.binary("*", 0.25, _S.read(_e, "H"))))
	_S.invoke(_S.read(_e, "g"), "set", [_S.read(_e, "ex"), _S.read(_e, "ey"), _S.prop(_S.read(_e, "C"), 0)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("+", _S.read(_e, "ex"), 1), _S.read(_e, "ey"), _S.prop(_S.read(_e, "C"), 0)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.read(_e, "ex"), _S.binary("+", _S.read(_e, "ey"), 1), _S.prop(_S.read(_e, "C"), 1)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("+", _S.read(_e, "ex"), 1), _S.binary("+", _S.read(_e, "ey"), 1), _S.prop(_S.read(_e, "C"), 0)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("+", _S.read(_e, "ex"), 1), _S.read(_e, "ey"), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "g"), "outline", [_S.prop(_S.read(_e, "C"), 0)])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.read(_e, "amp"), _S.binary("**", _S.read(_e, "u"), 1.8)), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.read(_e, "w"), _S.binary("*", 4, _S.read(_e, "u")))]))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("/", _S.read(_e, "u"), 0.3)]) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else _S.binary("-", 1, _S.binary("*", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "u"), 0.3), 0.7), 1.5), 0.72)))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("/", _S.read(_e, "H"), 2), _S.call_value(_S.read(_e, "prof"), [_S.read(_e, "u")]))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.unary("-", _S.read(_e, "x")), _S.read(_e, "L")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.call_value(_S.read(_e, "bend"), [_S.read(_e, "u")])))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "hh"), [_S.read(_e, "u")]))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary(">", _S.read(_e, "u"), 1)), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "dy")]), _S.read(_e, "h")))):
		return 0
	_S.define(_e, "v", _S.binary("/", _S.read(_e, "dy"), _S.read(_e, "h")))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "v"), _S.unary("-", 0.12)), func(): return _S.binary("<", _S.read(_e, "v"), 0.12)), func(): return _S.binary(">", _S.read(_e, "u"), 0.22)), func(): return _S.binary("<", _S.read(_e, "u"), 0.92))):
		return (_S.prop(_S.read(_e, "Sp"), 1) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else _S.prop(_S.read(_e, "Sp"), (2 if _S.truth(_S.binary("<", _S.read(_e, "v"), 0)) else 1)))
	if _S.truth(_S.binary("<", _S.read(_e, "v"), _S.unary("-", 0.6))):
		return (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "u"), 0.5), func(): return _S.binary("<", _S.read(_e, "v"), _S.unary("-", 0.8)))) else _S.prop(_S.read(_e, "C"), 2))
	if _S.truth(_S.binary("<", _S.read(_e, "v"), _S.unary("-", 0.12))):
		return _S.prop(_S.read(_e, "C"), 3)
	if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.5)):
		return _S.prop(_S.read(_e, "C"), 4)
	return (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.86)) else _S.prop(_S.read(_e, "C"), 5))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "dx", _S.arg(_args, 0))
	_S.define(_e, "dy", _S.arg(_args, 1))
	return [_S.unary("-", _S.binary("-", _S.binary("+", _S.read(_e, "L"), _S.binary("*", _S.read(_e, "dx"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ta")]))), _S.binary("*", _S.read(_e, "dy"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ta")])))), _S.binary("+", _S.binary("+", _S.read(_e, "tb"), _S.binary("*", _S.read(_e, "dx"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ta")]))), _S.binary("*", _S.read(_e, "dy"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ta")])))]

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.binary("-", _S.read(_e, "tb"), 1))) else _S.prop(_S.read(_e, "C"), 3))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary("%", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]), 2)) else _S.prop(_S.read(_e, "C"), 4))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "f", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	var _v1 = _S.read(_e, "f")
	_S.define(_e, "bx", _S.prop(_v1, 0))
	_S.define(_e, "by", _S.prop(_v1, 1))
	_S.define(_e, "ph", _S.prop(_v1, 4))
	_S.define(_e, "a", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")))
	_S.define(_e, "dt", _S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.binary("%", _S.binary("*", _S.binary("*", _S.read(_e, "i"), 0.71), _S.read(_e, "D")), _S.read(_e, "D"))), _S.read(_e, "D")]))
	_S.define(_e, "dart", ((_S.invoke(_S.read(_e, "ease"), "outCubic", [_S.binary("/", _S.read(_e, "dt"), 0.25)]) if _S.truth(_S.binary("<", _S.read(_e, "dt"), 0.25)) else (_S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.binary("/", _S.binary("-", _S.read(_e, "dt"), 0.25), 1.35)])) if _S.truth(_S.binary("<", _S.read(_e, "dt"), 1.6)) else 0)) if _S.truth(_S.binary("===", _S.read(_e, "i"), 4)) else 0))
	return _S.merge([{"x": _S.binary("+", _S.binary("+", _S.read(_e, "bx"), _S.binary("*", 3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.read(_e, "a"), _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")))]))), _S.binary("*", 8, _S.read(_e, "dart")))}, {"y": _S.binary("+", _S.read(_e, "by"), _S.binary("*", 1.8, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", 2, _S.read(_e, "a")), _S.binary("*", _S.read(_e, "ph"), 5))])))}, {"dart": (_S.binary("-", 1, _S.binary("/", _S.read(_e, "dt"), 0.6)) if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_e, "i"), 4), func(): return _S.binary("<", _S.read(_e, "dt"), 0.6))) else 0)}])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "a", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "y", _S.unary("-", 38))
	while _S.truth(_S.binary("<", _S.read(_v2, "y"), 38)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "x", _S.unary("-", 66))
		while _S.truth(_S.binary("<", _S.read(_v3, "x"), 66)):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "fall", _S.binary("*", _S.call_value(_S.read(_v4, "clamp"), [_S.binary("-", 1, _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_v4, "x"), 64), 2), _S.binary("**", _S.binary("/", _S.read(_v4, "y"), 40), 2)))]), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.call_value(_S.read(_v4, "clamp"), [_S.binary("+", _S.binary("/", _S.unary("-", _S.read(_v4, "y")), 40), 0.6)])))))
			if _S.truth(_S.binary("<=", _S.read(_v4, "fall"), 0)):
				_v3 = _S.iteration(_v3)
				_S.write(_v3, "x", 1, "+=", true)
				continue
			_S.define(_v4, "u", _S.binary("+", _S.binary("*", _S.read(_v4, "x"), 0.16), _S.binary("*", 1.9, _S.invoke(_S.read(_v4, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v4, "y"), 0.12), _S.read(_v4, "a"))]))))
			_S.define(_v4, "v", _S.binary("+", _S.binary("*", _S.read(_v4, "y"), 0.19), _S.binary("*", 1.9, _S.invoke(_S.read(_v4, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_v4, "x"), 0.1), _S.read(_v4, "a"))]))))
			_S.define(_v4, "n1", _S.binary("+", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "u")]), _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "v")])))
			_S.define(_v4, "sh", _S.binary("+", 0.75, _S.binary("*", 0.25, _S.invoke(_S.read(_v4, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.read(_v4, "x"), 0.05), _S.binary("*", _S.read(_v4, "y"), 0.04)), _S.binary("*", 2, _S.read(_v4, "a")))]))))
			_S.define(_v4, "f", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "abs", [_S.read(_v4, "n1")]), 5))]), _S.read(_v4, "fall")), _S.read(_v4, "sh")))
			if _S.truth(_S.binary(">", _S.read(_v4, "f"), 0.55)):
				_S.invoke(_S.read(_v4, "p"), "light", [_S.read(_v4, "x"), _S.read(_v4, "y"), _S.prop(_S.read(_v4, "C"), 4), 0.3])
			else:
				if _S.truth(_S.binary(">", _S.read(_v4, "f"), 0.25)):
					_S.invoke(_S.read(_v4, "p"), "light", [_S.read(_v4, "x"), _S.read(_v4, "y"), _S.prop(_S.read(_v4, "C"), 3), 0.14])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "x", 1, "+=", true)
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "y", 1, "+=", true)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "Sp", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "stripe"), 3]))
	_S.define(_e, "g", _S.read(_e, "GRID"))
	for _v5 in _S.array([[_S.unary("-", 30), 10, 0], [14, 7, 2.1], [44, 12, 4]]):
		var _v6 = _S.scope(_e)
		var _v7 = _v5
		_S.define(_v6, "x0", _S.prop(_v7, 0))
		_S.define(_v6, "w", _S.prop(_v7, 1))
		_S.define(_v6, "ph", _S.prop(_v7, 2))
		var _v8 = _S.scope(_v6)
		_S.define(_v8, "sw", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v8, "t"), _S.read(_v8, "D")), _S.read(_v8, "TAU")), _S.read(_v8, "ph"))]), 4))
		_S.invoke(_S.read(_v8, "p"), "glowLine", [_S.binary("-", _S.binary("+", _S.read(_v8, "x0"), _S.read(_v8, "sw")), 12), _S.unary("-", 40), _S.binary("+", _S.binary("+", _S.read(_v8, "x0"), _S.read(_v8, "sw")), 8), 40, _S.read(_v8, "w"), _S.prop(_S.read(_v8, "C"), 4), 0.05])
	for _v9 in _S.array([true, false]):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "back", _v9)
		_S.invoke(_S.read(_v10, "SCHOOL"), "forEach", [_S.function_value(_v10, "_f11")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 9, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 13), 1), _S.function_value(_e, "_f13"), _S.function_value(_e, "_f14")])
	_S.call_value(_S.read(_e, "caustics"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 8), 74, _S.prop(_S.read(_e, "C"), 2), 0.2])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.unary("-", 6), _S.unary("-", 18), 40, _S.prop(_S.read(_e, "C"), 3), 0.1])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	if _S.truth(_S.binary("!==", _S.prop(_S.read(_e, "f"), 3), _S.read(_e, "back"))):
		return null
	_S.define(_e, "P", _S.call_value(_S.read(_e, "place"), [_S.read(_e, "f"), _S.read(_e, "i"), _S.read(_e, "t")]))
	_S.call_value(_S.read(_e, "fish"), [_S.read(_e, "g"), _S.read(_e, "C"), _S.read(_e, "Sp"), _S.prop(_S.read(_e, "f"), 2), _S.read(_e, "t"), _S.prop(_S.read(_e, "f"), 4), _S.prop(_S.read(_e, "P"), "dart")])
	if _S.truth(_S.read(_e, "back")):
		var _v11 = _S.scope(_e)
		_S.invoke(_S.read(_v11, "g"), "recolor", [_S.function_value(_v11, "_f12")])
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p"), 1, _S.prop(_S.read(_e, "P"), "x"), _S.prop(_S.read(_e, "P"), "y")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	return _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.prop(_S.read(_e, "C"), 1), 0.42])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.6, 2.6])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "f", _S.prop(_S.read(_e, "SCHOOL"), _S.binary("%", _S.read(_e, "i"), _S.prop(_S.read(_e, "SCHOOL"), "length"))))
	_S.define(_e, "P", _S.call_value(_S.read(_e, "place"), [_S.read(_e, "f"), _S.binary("%", _S.read(_e, "i"), _S.prop(_S.read(_e, "SCHOOL"), "length")), _S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), _S.read(_e, "D")])]))
	_S.define(_e, "rad", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0.6, 1.6]), _S.prop(_S.read(_e, "f"), 2)))
	_S.define(_e, "ph", _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), _S.read(_e, "TAU")))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "P"), "x"), 1), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), _S.binary("+", 4, _S.binary("/", 2, _S.read(_e, "rad")))), _S.read(_e, "ph"))]), _S.binary("+", 0.5, _S.binary("*", _S.read(_e, "rad"), 0.7)))))
	_S.define(_e, "y", _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "P"), "y"), 1), _S.binary("*", _S.binary("+", 16, _S.binary("*", 12, _S.read(_e, "rad"))), _S.read(_e, "age"))))
	if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 38))):
		return null
	_S.call_value(_S.read(_e, "bubble"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "rad"), [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)], _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 4), _S.binary("*", _S.binary("-", _S.read(_e, "L"), _S.read(_e, "age")), 3), _S.binary("/", _S.binary("+", _S.read(_e, "y"), 38), 4)])])
	return null
