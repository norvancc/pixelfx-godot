@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/blizzard-vortex.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "streaks", _S.function_value(_e, "_f0"))
	_S.define(_e, "body", _S.function_value(_e, "_f3"))
	_S.define(_e, "orbiters", _S.function_value(_e, "_f5"))
	_S.define(_e, "foot", _S.function_value(_e, "_f11"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f16"))
	_S.define(_e, "draw", _S.function_value(_e, "_f17"))
	_S.define(_e, "meta", _S.merge([{"name": "Blizzard vortex"}, {"desc": "A swirling snow tornado: wind bands spin up a leaning funnel, flakes and ice crystals orbit in front and behind, snow boils at its foot and cold light fills its throat."}, {"tags": ["ice", "snow", "blizzard", "tornado", "vortex", "wind", "loop"]}, {"size": [128, 116]}, {"origin": [64, 102]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"height": 80}, {"seed": 17}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "TILT", 0.24)
	_S.define(_e, "radius", _S.function_value(_e, "_f21"))
	_S.define(_e, "axis", _S.function_value(_e, "_f22"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "o", _S.arg(_args, 3))
	_S.define(_e, "front", _S.arg(_args, 4))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 58, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 9), _S.function_value(_e, "_f1"), _S.function_value(_e, "_f2")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.5, 0.9])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "h0", _S.invoke(_S.read(_e, "r"), "range", [2, _S.read(_e, "H")]))
	_S.define(_e, "w", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [8, 12]), _S.binary("-", 1.45, _S.binary("/", _S.read(_e, "h0"), _S.read(_e, "H")))))
	_S.define(_e, "th", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]), _S.binary("*", _S.read(_e, "age"), _S.read(_e, "w"))))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "fade", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "age"), 0.08)]), (_S.binary("/", _S.binary("-", 1, _S.read(_e, "k")), 0.3) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.7)) else 1)))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "r"), "range", [0.7, 1.5]))
	_S.define(_e, "m", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("/", _S.read(_e, "L"), 0.07)]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "j", 0)
	while _S.truth(_S.binary("<=", _S.read(_v0, "j"), _S.read(_v0, "m"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.binary("-", _S.read(_v1, "th"), _S.binary("*", _S.read(_v1, "j"), 0.07)))
		_S.define(_v1, "s", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]))
		if _S.truth(_S.binary("!==", _S.binary(">=", _S.read(_v1, "s"), 0), _S.read(_v1, "front"))):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "j", 1, "+=", true)
			continue
		_S.define(_v1, "h", _S.invoke(_S.read(_v1, "Math"), "min", [_S.binary("+", _S.read(_v1, "H"), 4), _S.binary("-", _S.binary("+", _S.read(_v1, "h0"), _S.binary("*", _S.read(_v1, "age"), 16)), _S.binary("*", _S.read(_v1, "j"), 0.25))]))
		_S.define(_v1, "R", _S.binary("*", _S.call_value(_S.read(_v1, "radius"), [_S.invoke(_S.read(_v1, "Math"), "min", [_S.read(_v1, "h"), _S.read(_v1, "H")]), _S.read(_v1, "H")]), _S.binary("+", 1, _S.invoke(_S.read(_v1, "Math"), "min", [0.3, _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "max", [0, _S.binary("-", _S.read(_v1, "h"), _S.binary("*", _S.read(_v1, "H"), 0.84))]), 0.03)]))))
		_S.define(_v1, "u", _S.binary("/", _S.read(_v1, "j"), _S.read(_v1, "m")))
		_S.define(_v1, "x", _S.binary("+", _S.call_value(_S.read(_v1, "axis"), [_S.invoke(_S.read(_v1, "Math"), "min", [_S.read(_v1, "h"), _S.read(_v1, "H")]), _S.read(_v1, "H"), _S.read(_v1, "ph")]), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "R"))))
		_S.define(_v1, "y", _S.binary("+", _S.unary("-", _S.read(_v1, "h")), _S.binary("*", _S.binary("*", _S.read(_v1, "s"), _S.read(_v1, "R")), _S.read(_v1, "TILT"))))
		_S.define(_v1, "c", ((_S.read(_v1, "WHITE") if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.15)) else (_S.prop(_S.read(_v1, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.5)) else _S.prop(_S.read(_v1, "C"), 5))) if _S.truth(_S.read(_v1, "front")) else (_S.prop(_S.read(_v1, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.3)) else (_S.prop(_S.read(_v1, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.6)) else _S.prop(_S.read(_v1, "C"), 3)))))
		_S.invoke(_S.read(_v1, "p"), "dot", [_S.read(_v1, "x"), _S.read(_v1, "y"), _S.read(_v1, "c"), _S.binary("*", _S.binary("*", _S.read(_v1, "fade"), (1 if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.6)) else _S.binary("-", 1.5, _S.binary("*", _S.read(_v1, "u"), 1.2)))), (1 if _S.truth(_S.read(_v1, "front")) else 0.85))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "j", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "H", _S.arg(_args, 3))
	_S.invoke(_S.read(_e, "p"), "each", [_S.unary("-", 44), _S.binary("-", _S.unary("-", _S.read(_e, "H")), 6), 44, 2, _S.function_value(_e, "_f4")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.arg(_args, 2))
	_S.define(_e, "sy", _S.arg(_args, 3))
	_S.define(_e, "h", _S.unary("-", _S.read(_e, "y")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "h"), 0), func(): return _S.binary(">", _S.read(_e, "h"), _S.binary("+", _S.read(_e, "H"), 4)))):
		return null
	_S.define(_e, "R", _S.call_value(_S.read(_e, "radius"), [_S.read(_e, "h"), _S.read(_e, "H")]))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.call_value(_S.read(_e, "axis"), [_S.read(_e, "h"), _S.read(_e, "H"), _S.read(_e, "ph")])))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "dx"), _S.read(_e, "R")))
	if _S.truth(_S.binary(">=", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u")), 1)):
		return null
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "h"), _S.read(_e, "H")))
	_S.define(_e, "rim", _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "u")]), 3]))
	_S.define(_e, "swirl", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "asin", [_S.read(_e, "u")]), 3), _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "ph")), 2)), _S.binary("*", _S.read(_e, "h"), 0.2))]), 0.5), 0.5))
	_S.define(_e, "a", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("+", _S.binary("+", 0.07, _S.binary("*", 0.24, _S.read(_e, "rim"))), _S.binary("*", 0.12, _S.read(_e, "swirl"))), _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "u")])), 0.18)])), (_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("/", _S.binary("-", 1, _S.read(_e, "k")), 0.3)]) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.7)) else 1)), (_S.binary("/", _S.read(_e, "h"), 4) if _S.truth(_S.binary("<", _S.read(_e, "h"), 4)) else 1)))
	if _S.truth(_S.binary("<", _S.read(_e, "a"), 0.03)):
		return null
	_S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "rim"), 0.5)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "swirl"), 0.6)) else _S.prop(_S.read(_e, "C"), 4))), _S.read(_e, "a")])
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "rim"), 0.3), func(): return _S.binary(">", _S.read(_e, "swirl"), 0.75))):
		_S.invoke(_S.read(_e, "p"), "add", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", _S.binary("*", 0.16, _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "rim"), _S.binary("-", _S.read(_e, "swirl"), 0.5)])), _S.binary("-", 1, _S.binary("*", _S.read(_e, "k"), 0.5)))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "o", _S.arg(_args, 3))
	_S.define(_e, "front", _S.arg(_args, 4))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 76, _S.prop(_S.read(_e, "o"), "seed"), _S.function_value(_e, "_f6"), _S.function_value(_e, "_f7")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.9, 1.6])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "h0", _S.invoke(_S.read(_e, "r"), "range", [0, _S.binary("*", _S.read(_e, "H"), 0.6)]))
	_S.define(_e, "h", _S.binary("+", _S.read(_e, "h0"), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [14, 30]))))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	if _S.truth(_S.binary(">", _S.read(_e, "h"), _S.binary("+", _S.read(_e, "H"), 8))):
		return null
	_S.define(_e, "w", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [7, 11]), _S.binary("-", 1.5, _S.binary("/", _S.read(_e, "h"), _S.read(_e, "H")))))
	_S.define(_e, "th", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]), _S.binary("*", _S.read(_e, "age"), _S.read(_e, "w"))))
	_S.define(_e, "out", _S.binary("+", _S.binary("+", 1, _S.invoke(_S.read(_e, "r"), "range", [0.05, 0.3])), _S.invoke(_S.read(_e, "Math"), "min", [0.35, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "h"), _S.binary("*", _S.read(_e, "H"), 0.82))]), 0.04)])))
	_S.define(_e, "R", _S.binary("*", _S.call_value(_S.read(_e, "radius"), [_S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "h"), _S.read(_e, "H")]), _S.read(_e, "H")]), _S.read(_e, "out")))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]))
	if _S.truth(_S.binary("!==", _S.binary(">=", _S.read(_e, "s"), 0), _S.read(_e, "front"))):
		return null
	_S.define(_e, "x", _S.binary("+", _S.call_value(_S.read(_e, "axis"), [_S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "h"), _S.read(_e, "H")]), _S.read(_e, "H"), _S.read(_e, "ph")]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "R"))))
	_S.define(_e, "y", _S.binary("+", _S.unary("-", _S.read(_e, "h")), _S.binary("*", _S.binary("*", _S.read(_e, "s"), _S.read(_e, "R")), _S.read(_e, "TILT"))))
	_S.define(_e, "big", _S.binary("===", _S.binary("%", _S.read(_e, "i"), 5), 0))
	_S.define(_e, "fade", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "age"), 0.1)]), (_S.binary("/", _S.binary("-", 1, _S.read(_e, "k")), 0.2) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.8)) else 1)))
	if _S.truth(_S.binary("<=", _S.read(_e, "fade"), 0)):
		return null
	_S.define(_e, "th2", _S.binary("-", _S.read(_e, "th"), 0.25))
	_S.define(_e, "x2", _S.binary("+", _S.call_value(_S.read(_e, "axis"), [_S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "h"), _S.read(_e, "H")]), _S.read(_e, "H"), _S.read(_e, "ph")]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th2")]), _S.read(_e, "R"))))
	_S.define(_e, "y2", _S.binary("+", _S.binary("+", _S.unary("-", _S.read(_e, "h")), 2), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th2")]), _S.read(_e, "R")), _S.read(_e, "TILT"))))
	if _S.truth(_S.read(_e, "front")):
		var _v2 = _S.scope(_e)
		_S.invoke(_S.read(_v2, "p"), "line", [_S.read(_v2, "x2"), _S.read(_v2, "y2"), _S.read(_v2, "x"), _S.read(_v2, "y"), _S.function_value(_v2, "_f8"), _S.function_value(_v2, "_f9")])
		_S.invoke(_S.read(_v2, "p"), "dot", [_S.read(_v2, "x"), _S.read(_v2, "y"), (_S.read(_v2, "WHITE") if _S.truth(_S.read(_v2, "big")) else (_S.read(_v2, "WHITE") if _S.truth(_S.invoke(_S.read(_v2, "r"), "chance", [0.5])) else _S.prop(_S.read(_v2, "C"), 6))), _S.read(_v2, "fade")])
		if _S.truth(_S.read(_v2, "big")):
			var _v3 = _S.scope(_v2)
			for _v4 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
				var _v5 = _S.scope(_v3)
				var _v6 = _v4
				_S.define(_v5, "dx", _S.prop(_v6, 0))
				_S.define(_v5, "dy", _S.prop(_v6, 1))
				_S.invoke(_S.read(_v5, "p"), "dot", [_S.binary("+", _S.read(_v5, "x"), _S.read(_v5, "dx")), _S.binary("+", _S.read(_v5, "y"), _S.read(_v5, "dy")), _S.prop(_S.read(_v5, "C"), 6), _S.read(_v5, "fade")])
			_S.invoke(_S.read(_v3, "p"), "glow", [_S.read(_v3, "x"), _S.read(_v3, "y"), 5, _S.prop(_S.read(_v3, "C"), 5), _S.binary("*", 0.35, _S.read(_v3, "fade"))])
	else:
		var _v7 = _S.scope(_e)
		_S.invoke(_S.read(_v7, "p"), "line", [_S.read(_v7, "x2"), _S.read(_v7, "y2"), _S.read(_v7, "x"), _S.read(_v7, "y"), _S.prop(_S.read(_v7, "C"), 3), _S.function_value(_v7, "_f10")])
		_S.invoke(_S.read(_v7, "p"), "dot", [_S.read(_v7, "x"), _S.read(_v7, "y"), (_S.prop(_S.read(_v7, "C"), 5) if _S.truth(_S.read(_v7, "big")) else _S.prop(_S.read(_v7, "C"), 4)), _S.read(_v7, "fade")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "C"), 4))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "u"), _S.read(_e, "fade"))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "fade")), 0.8)

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "o", _S.arg(_args, 3))
	_S.define(_e, "front", _S.arg(_args, 4))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 12, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 5), _S.function_value(_e, "_f12"), _S.function_value(_e, "_f13")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.8, 1.2])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "th", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [4, 6]))))
	_S.define(_e, "R", _S.binary("+", 9, _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [8, 16]))))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	if _S.truth(_S.binary("!==", _S.binary(">=", _S.read(_e, "s"), 0), _S.read(_e, "front"))):
		return null
	_S.define(_e, "x", _S.binary("+", _S.call_value(_S.read(_e, "axis"), [0, 1, _S.read(_e, "ph")]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "R"))))
	_S.define(_e, "y", _S.binary("+", _S.binary("-", _S.unary("-", 2), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [4, 10]))), _S.binary("*", _S.binary("*", _S.read(_e, "s"), _S.read(_e, "R")), 0.2)))
	_S.define(_e, "rad", _S.binary("+", 2, _S.binary("*", 4, _S.read(_e, "k"))))
	_S.define(_e, "a", _S.binary("*", _S.binary("*", 0.5, _S.binary("**", _S.binary("-", 1, _S.read(_e, "k")), 1.2)), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "age"), 0.1)])))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "rad"), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.read(_e, "front")) else _S.prop(_S.read(_e, "C"), 5)), _S.function_value(_e, "_f14")])
	_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "rad"), 0.25)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "rad"), 0.3)), _S.binary("*", _S.read(_e, "rad"), 0.5), _S.read(_e, "WHITE"), _S.function_value(_e, "_f15")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "a"), _S.binary("-", 1, _S.binary("*", _S.read(_e, "d"), _S.read(_e, "d"))))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "a"), 0.5), _S.binary("-", 1, _S.binary("*", _S.read(_e, "d"), _S.read(_e, "d")))), _S.binary("-", 1, _S.read(_e, "k")))

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	var _v8 = _S.scope(_e)
	_S.define(_v8, "x", _S.unary("-", 30))
	while _S.truth(_S.binary("<=", _S.read(_v8, "x"), 30)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "d", _S.binary("/", _S.invoke(_S.read(_v9, "Math"), "abs", [_S.read(_v9, "x")]), 30))
		_S.define(_v9, "hgt", _S.invoke(_S.read(_v9, "Math"), "round", [_S.binary("*", _S.binary("-", 1, _S.binary("*", _S.read(_v9, "d"), _S.read(_v9, "d"))), _S.binary("+", 1.5, _S.binary("*", _S.call_value(_S.read(_v9, "rand"), [_S.read(_v9, "x"), 3]), 1.5)))]))
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "j"), _S.read(_v10, "hgt"))):
			_S.invoke(_S.read(_v10, "p"), "px", [_S.read(_v10, "x"), _S.unary("-", _S.read(_v10, "j")), (_S.read(_v10, "WHITE") if _S.truth(_S.binary("===", _S.read(_v10, "j"), _S.binary("-", _S.read(_v10, "hgt"), 1))) else _S.prop(_S.read(_v10, "C"), 5))])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "j", 1, "+=", true)
		_S.invoke(_S.read(_v9, "p"), "dot", [_S.read(_v9, "x"), 0, _S.prop(_S.read(_v9, "C"), 6), _S.binary("-", 1, _S.binary("*", _S.read(_v9, "d"), 0.5))])
		_S.invoke(_S.read(_v9, "p"), "dot", [_S.read(_v9, "x"), 1, _S.prop(_S.read(_v9, "C"), 4), _S.binary("-", 0.8, _S.binary("*", _S.read(_v9, "d"), 0.6))])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "x", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 2), 40, _S.prop(_S.read(_e, "C"), 4), 0.22])
	_S.call_value(_S.read(_e, "foot"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "o"), false])
	_S.call_value(_S.read(_e, "streaks"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "o"), false])
	_S.call_value(_S.read(_e, "orbiters"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "o"), false])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	_S.call_value(_S.read(_e, "body"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "ph"), _S.read(_e, "H")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.call_value(_S.read(_e, "axis"), [_S.binary("*", _S.read(_e, "H"), 0.45), _S.read(_e, "H"), _S.read(_e, "ph")]), _S.binary("*", _S.unary("-", _S.read(_e, "H")), 0.45), 40, _S.prop(_S.read(_e, "C"), 4), 0.3])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.call_value(_S.read(_e, "axis"), [_S.binary("*", _S.read(_e, "H"), 0.15), _S.read(_e, "H"), _S.read(_e, "ph")]), _S.binary("*", _S.unary("-", _S.read(_e, "H")), 0.15), 18, _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.4, _S.binary("*", 0.1, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "ph")), 4)])))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.call_value(_S.read(_e, "axis"), [_S.binary("*", _S.read(_e, "H"), 0.05), _S.read(_e, "H"), _S.read(_e, "ph")]), _S.unary("-", 3), 10, _S.read(_e, "WHITE"), 0.3])
	_S.call_value(_S.read(_e, "streaks"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "o"), true])
	_S.call_value(_S.read(_e, "orbiters"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "o"), true])
	_S.call_value(_S.read(_e, "foot"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "o"), true])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), 10, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 3), _S.function_value(_e, "_f18"), _S.function_value(_e, "_f19")])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.9, 1.3])

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "R", _S.binary("*", _S.call_value(_S.read(_e, "radius"), [_S.read(_e, "H"), _S.read(_e, "H")]), _S.binary("+", 0.6, _S.binary("*", _S.read(_e, "age"), 0.9))))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "rad", _S.binary("+", 3, _S.binary("*", 6, _S.read(_e, "k"))))
	_S.define(_e, "Rc", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "R"), 36]))
	_S.define(_e, "x", _S.binary("+", _S.call_value(_S.read(_e, "axis"), [_S.read(_e, "H"), _S.read(_e, "H"), _S.read(_e, "ph")]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "Rc"))))
	_S.define(_e, "y", _S.binary("+", _S.binary("-", _S.binary("-", _S.unary("-", _S.read(_e, "H")), 2), _S.binary("*", _S.read(_e, "age"), 4)), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]), _S.read(_e, "Rc")), _S.read(_e, "TILT"))))
	_S.define(_e, "a", _S.binary("*", _S.binary("*", 0.24, _S.binary("-", 1, _S.read(_e, "k"))), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "age"), 0.15)])))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.read(_e, "rad"), 0.8), _S.prop(_S.read(_e, "C"), 6), _S.function_value(_e, "_f20")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.read(_e, "rad"), 1.5), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.08, _S.binary("-", 1, _S.read(_e, "k")))])
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "a"), _S.binary("-", 1, _S.binary("*", _S.read(_e, "d"), _S.read(_e, "d"))))

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "h", _S.arg(_args, 0))
	_S.define(_e, "H", _S.arg(_args, 1))
	return _S.binary("+", 4, _S.binary("*", 28, _S.invoke(_S.read(_e, "Math"), "pow", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "h"), _S.read(_e, "H"))]), 1.35])))

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "h", _S.arg(_args, 0))
	_S.define(_e, "H", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	return _S.binary("-", _S.binary("*", _S.binary("+", _S.binary("*", 5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "ph")), _S.binary("*", _S.read(_e, "h"), 0.05))])), _S.binary("*", 1.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "ph")), 2), _S.binary("*", _S.read(_e, "h"), 0.11))]))), _S.binary("/", _S.read(_e, "h"), _S.read(_e, "H"))), _S.binary("*", 2, _S.binary("/", _S.read(_e, "h"), _S.read(_e, "H"))))
