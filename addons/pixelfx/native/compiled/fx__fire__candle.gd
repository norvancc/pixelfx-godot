@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/candle.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "flameTongue", _S.import_value("fx/fire/_lib.js", "flameTongue"))
	_S.define(_e, "smokePuff", _S.import_value("fx/fire/_lib.js", "smokePuff"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "floorLight", _S.import_value("fx/fire/_lib.js", "floorLight"))
	_S.define(_e, "dish", _S.function_value(_e, "_f0"))
	_S.define(_e, "candle", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Candle"}, {"desc": "A wax candle in a brass dish: a calm flame with a blue root that sways and stretches, a halo of light, motes drifting in it, a bead of wax running down a drip."}, {"tags": ["fire", "candle", "prop", "light", "calm", "ambient", "loop"]}, {"size": [56, 76]}, {"origin": [28, 64]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"root": ["#1b2a8a", "#3a62e0", "#7fb4ff"]}, {"wax": ["#2e201e", "#5e4436", "#8e6e58", "#b8957a", "#d8b896", "#f0dcc0"]}, {"brass": ["#2a1a10", "#6a4a1e", "#b4862e", "#e8c060", "#fff0b0"]}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "TOP", _S.unary("-", 16))
	_S.define(_e, "WICK", _S.binary("-", _S.read(_e, "TOP"), 3))
	_S.define(_e, "CALM", [[1, 1, 5], [0.8, 0.88, 3], [0.6, 0.72, 2], [0.38, 0.52, 1], [0.18, 0.3, 0]])
	_S.define(_e, "DRIP", _S.merge([{"x": 4}, {"y0": _S.binary("+", _S.read(_e, "TOP"), 2)}, {"y1": _S.unary("-", 7)}]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "B", _S.arg(_args, 1))
	_S.define(_e, "H", _S.arg(_args, 2))
	_S.define(_e, "fl", _S.arg(_args, 3))
	_S.invoke(_S.read(_e, "p"), "ellipse", [0, 1, 10, 2.6, _S.function_value(_e, "_f1")])
	_S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 8), 2, 17, 1, _S.prop(_S.read(_e, "B"), 1)])
	_S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 7), 3, 15, 1, _S.prop(_S.read(_e, "B"), 0)])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "B"), 0) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.82)) else ((_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "B"), 3), _S.prop(_S.read(_e, "H"), 3), _S.binary("*", 0.3, _S.read(_e, "fl"))]) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.6)) else _S.prop(_S.read(_e, "B"), 2)) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.unary("-", 0.2))) else (_S.prop(_S.read(_e, "B"), 1) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.55)) else _S.prop(_S.read(_e, "B"), 2))))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "X", _S.arg(_args, 1))
	_S.define(_e, "H", _S.arg(_args, 2))
	_S.define(_e, "fl", _S.arg(_args, 3))
	_S.define(_e, "L", _S.read(_e, "TOP"))
	_S.define(_e, "cols", [_S.prop(_S.read(_e, "X"), 1), _S.prop(_S.read(_e, "X"), 4), _S.prop(_S.read(_e, "X"), 5), _S.prop(_S.read(_e, "X"), 4), _S.prop(_S.read(_e, "X"), 4), _S.prop(_S.read(_e, "X"), 3), _S.prop(_S.read(_e, "X"), 3), _S.prop(_S.read(_e, "X"), 2), _S.prop(_S.read(_e, "X"), 0)])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 9)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", _S.binary("-", _S.read(_v1, "i"), 4))
		_S.invoke(_S.read(_v1, "p"), "rect", [_S.read(_v1, "x"), _S.binary("+", _S.read(_v1, "L"), 1), 1, _S.binary("-", _S.unary("-", _S.read(_v1, "L")), 2), _S.prop(_S.read(_v1, "cols"), _S.read(_v1, "i"))])
		if _S.truth(_S.binary("===", _S.read(_v1, "i"), 2)):
			_S.invoke(_S.read(_v1, "p"), "rect", [_S.read(_v1, "x"), _S.unary("-", 8), 1, 7, _S.prop(_S.read(_v1, "X"), 4)])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 3), _S.unary("-", 1), 7, 1, _S.prop(_S.read(_e, "X"), 2)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.unary("-", 4), _S.unary("-", 1), _S.prop(_S.read(_e, "X"), 0)])
	_S.invoke(_S.read(_e, "p"), "px", [4, _S.unary("-", 1), _S.prop(_S.read(_e, "X"), 0)])
	_S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 3), _S.read(_e, "L"), 7, 1, _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "X"), 5), _S.prop(_S.read(_e, "H"), 2), _S.binary("*", 0.25, _S.read(_e, "fl"))])])
	_S.invoke(_S.read(_e, "p"), "px", [_S.unary("-", 4), _S.read(_e, "L"), _S.prop(_S.read(_e, "X"), 1)])
	_S.invoke(_S.read(_e, "p"), "px", [4, _S.read(_e, "L"), _S.prop(_S.read(_e, "X"), 1)])
	_S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 2), _S.binary("+", _S.read(_e, "L"), 1), 5, 1, _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "X"), 5), _S.prop(_S.read(_e, "H"), 1), _S.binary("*", 0.5, _S.read(_e, "fl"))])])
	_S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 1), _S.binary("+", _S.read(_e, "L"), 1), 3, 1, _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "X"), 4), _S.prop(_S.read(_e, "H"), 2), _S.binary("*", 0.45, _S.read(_e, "fl"))])])
	_S.define(_e, "y1", _S.prop(_S.read(_e, "DRIP"), "y1"))
	_S.invoke(_S.read(_e, "p"), "rect", [3, _S.binary("+", _S.read(_e, "L"), 1), 1, _S.binary("-", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "L")), 1), _S.prop(_S.read(_e, "X"), 4)])
	_S.invoke(_S.read(_e, "p"), "rect", [4, _S.binary("+", _S.read(_e, "L"), 2), 1, _S.binary("-", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "L")), 2), _S.prop(_S.read(_e, "X"), 3)])
	_S.invoke(_S.read(_e, "p"), "px", [5, _S.binary("+", _S.read(_e, "L"), 3), _S.prop(_S.read(_e, "X"), 0)])
	_S.invoke(_S.read(_e, "p"), "rect", [5, _S.binary("+", _S.read(_e, "L"), 4), 1, _S.binary("-", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "L")), 4), _S.prop(_S.read(_e, "X"), 0)])
	_S.invoke(_S.read(_e, "p"), "rect", [3, _S.read(_e, "y1"), 2, 2, _S.prop(_S.read(_e, "X"), 4)])
	_S.invoke(_S.read(_e, "p"), "px", [5, _S.read(_e, "y1"), _S.prop(_S.read(_e, "X"), 3)])
	_S.invoke(_S.read(_e, "p"), "px", [5, _S.binary("+", _S.read(_e, "y1"), 1), _S.prop(_S.read(_e, "X"), 2)])
	_S.invoke(_S.read(_e, "p"), "px", [6, _S.read(_e, "y1"), _S.prop(_S.read(_e, "X"), 0)])
	_S.invoke(_S.read(_e, "p"), "px", [6, _S.binary("+", _S.read(_e, "y1"), 1), _S.prop(_S.read(_e, "X"), 0)])
	_S.invoke(_S.read(_e, "p"), "rect", [3, _S.binary("+", _S.read(_e, "y1"), 2), 3, 1, _S.prop(_S.read(_e, "X"), 0)])
	_S.invoke(_S.read(_e, "p"), "px", [3, _S.binary("+", _S.read(_e, "L"), 2), _S.prop(_S.read(_e, "X"), 5)])
	_S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 4), _S.binary("+", _S.read(_e, "L"), 1), 1, 4, _S.prop(_S.read(_e, "X"), 4)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.unary("-", 5), _S.binary("+", _S.read(_e, "L"), 3), _S.prop(_S.read(_e, "X"), 1)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.unary("-", 5), _S.binary("+", _S.read(_e, "L"), 4), _S.prop(_S.read(_e, "X"), 1)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.unary("-", 4), _S.binary("+", _S.read(_e, "L"), 5), _S.prop(_S.read(_e, "X"), 3)])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "hotFirst"), [_S.read(_e, "F")]))
	_S.define(_e, "RT", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "root"), 3]))
	_S.define(_e, "X", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "wax"), 6]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "brass"), 5]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "N", _S.function_value(_e, "_f4"))
	_S.define(_e, "fl", _S.binary("+", _S.binary("+", 0.86, _S.binary("*", 0.08, _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), 2, _S.binary("+", _S.read(_e, "S"), 1)]))), _S.binary("*", 0.06, _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), 7, _S.binary("+", _S.read(_e, "S"), 2)]))))
	_S.define(_e, "stretch", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), 0.75, _S.binary("+", _S.read(_e, "S"), 3)]), 0.3)]), 0.6))
	_S.define(_e, "h", _S.binary("*", _S.binary("*", 12, _S.binary("+", 1, _S.read(_e, "stretch"))), _S.binary("+", 0.94, _S.binary("*", 0.06, _S.read(_e, "fl")))))
	_S.define(_e, "sway", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), 0.5, _S.binary("+", _S.read(_e, "S"), 4)]), 1.6), _S.binary("*", _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), 1.5, _S.binary("+", _S.read(_e, "S"), 5)]), 0.5)))
	_S.define(_e, "GLOW", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), 0.5]), _S.read(_e, "WHITE"), 0.3]))
	_S.define(_e, "cy", _S.binary("-", _S.read(_e, "WICK"), _S.binary("*", _S.read(_e, "h"), 0.4)))
	_S.call_value(_S.read(_e, "floorLight"), [_S.read(_e, "p"), 0, 1, 26, 5, _S.read(_e, "GLOW"), _S.binary("*", 0.3, _S.read(_e, "fl"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("*", _S.read(_e, "sway"), 0.3), _S.read(_e, "cy"), _S.binary("*", 38, _S.read(_e, "fl")), _S.read(_e, "GLOW"), _S.binary("*", 0.42, _S.read(_e, "fl"))])
	_S.invoke(_S.read(_e, "p"), "glowRing", [_S.binary("*", _S.read(_e, "sway"), 0.3), _S.read(_e, "cy"), 10, 4, _S.prop(_S.read(_e, "H"), 2), _S.binary("*", 0.12, _S.read(_e, "fl"))])
	_S.call_value(_S.read(_e, "dish"), [_S.read(_e, "p"), _S.read(_e, "B"), _S.read(_e, "H"), _S.read(_e, "fl")])
	_S.call_value(_S.read(_e, "candle"), [_S.read(_e, "p"), _S.read(_e, "X"), _S.read(_e, "H"), _S.read(_e, "fl")])
	_S.define(_e, "run", _S.binary("/", _S.binary("%", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "D")))
	_S.define(_e, "swell", _S.call_value(_S.read(_e, "smooth"), [0, 0.3, _S.read(_e, "run")]))
	_S.define(_e, "slide", _S.call_value(_S.read(_e, "smooth"), [0.3, 0.85, _S.read(_e, "run")]))
	_S.define(_e, "set", _S.call_value(_S.read(_e, "smooth"), [0.85, 1, _S.read(_e, "run")]))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "set"), 1), func(): return _S.binary(">", _S.read(_e, "swell"), 0.15))):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "by", _S.invoke(_S.read(_v2, "Math"), "round", [_S.binary("+", _S.prop(_S.read(_v2, "DRIP"), "y0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v2, "DRIP"), "y1"), _S.prop(_S.read(_v2, "DRIP"), "y0")), _S.read(_v2, "slide")))]))
		_S.invoke(_S.read(_v2, "p"), "px", [_S.prop(_S.read(_v2, "DRIP"), "x"), _S.read(_v2, "by"), _S.call_value(_S.read(_v2, "mix"), [_S.prop(_S.read(_v2, "X"), 5), _S.prop(_S.read(_v2, "H"), 1), _S.binary("*", 0.4, _S.read(_v2, "fl"))])])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v2, "swell"), 0.6), func(): return _S.binary("<", _S.read(_v2, "set"), 0.5))):
			_S.last([_S.invoke(_S.read(_v2, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v2, "DRIP"), "x"), 1), _S.read(_v2, "by"), _S.prop(_S.read(_v2, "X"), 4)]), _S.invoke(_S.read(_v2, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v2, "DRIP"), "x"), 1), _S.binary("+", _S.read(_v2, "by"), 1), _S.prop(_S.read(_v2, "X"), 2)])])
	_S.invoke(_S.read(_e, "p"), "line", [0, _S.read(_e, "TOP"), 0, _S.binary("+", _S.read(_e, "WICK"), 1), _S.prop(_S.read(_e, "X"), 0)])
	_S.invoke(_S.read(_e, "p"), "px", [0, _S.binary("+", _S.read(_e, "WICK"), 1), _S.prop(_S.read(_e, "H"), 4)])
	_S.call_value(_S.read(_e, "flameTongue"), [_S.read(_e, "p"), 0, _S.binary("+", _S.read(_e, "WICK"), 1), _S.read(_e, "h"), 2.6, _S.read(_e, "sway"), _S.read(_e, "N"), _S.binary("*", _S.read(_e, "S"), 31), _S.read(_e, "H"), _S.read(_e, "CALM"), 0.25, 0.6])
	var _v3 = _S.scope(_e)
	_S.define(_v3, "dx", _S.unary("-", 2))
	while _S.truth(_S.binary("<=", _S.read(_v3, "dx"), 2)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "a", _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "abs", [_S.read(_v4, "dx")]), 0.2)))
		_S.invoke(_S.read(_v4, "p"), "dot", [_S.read(_v4, "dx"), _S.binary("+", _S.read(_v4, "WICK"), 1), (_S.prop(_S.read(_v4, "RT"), 0) if _S.truth(_S.binary("===", _S.invoke(_S.read(_v4, "Math"), "abs", [_S.read(_v4, "dx")]), 2)) else _S.prop(_S.read(_v4, "RT"), 1)), _S.read(_v4, "a")])
		if _S.truth(_S.binary("<=", _S.invoke(_S.read(_v4, "Math"), "abs", [_S.read(_v4, "dx")]), 1)):
			_S.invoke(_S.read(_v4, "p"), "dot", [_S.read(_v4, "dx"), _S.binary("+", _S.read(_v4, "WICK"), 2), _S.prop(_S.read(_v4, "RT"), 0), 0.7])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "dx", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "px", [0, _S.read(_e, "WICK"), _S.prop(_S.read(_e, "RT"), 2)])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 6, _S.binary("+", _S.read(_e, "S"), 300), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 10, _S.binary("+", _S.read(_e, "S"), 400), _S.function_value(_e, "_f7"), _S.function_value(_e, "_f8")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("*", _S.read(_e, "sway"), 0.5), _S.binary("-", _S.read(_e, "WICK"), _S.binary("*", _S.read(_e, "h"), 0.3)), 10, _S.prop(_S.read(_e, "H"), 1), _S.binary("*", 0.35, _S.read(_e, "fl"))])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rate", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	_S.define(_e, "off", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), _S.binary("*", _S.read(_e, "rate"), 0.35), _S.read(_e, "seed"), _S.read(_e, "off")])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"vx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1.5), 1.5])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [8, 12]))}, {"life": _S.invoke(_S.read(_e, "r"), "range", [1.4, 2.2])}, {"s": _S.invoke(_S.read(_e, "r"), "range", [0.8, 1.2])}])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v5 = _S.call_value(_S.read(_e, "drift"), [_S.read(_e, "sway"), _S.binary("-", _S.read(_e, "WICK"), _S.read(_e, "h")), _S.prop(_S.read(_e, "q"), "vx"), _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"), 1, _S.unary("-", 6), 1, 0.8])
	_S.define(_e, "x", _S.prop(_v5, 0))
	_S.define(_e, "y", _S.prop(_v5, 1))
	_S.call_value(_S.read(_e, "smokePuff"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.call_value(_S.read(_e, "NL"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), 0.6, _S.binary("+", _S.read(_e, "S"), 60)]), _S.binary("+", 1, _S.binary("*", _S.read(_e, "age"), 2)))), _S.read(_e, "y"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))), _S.prop(_S.read(_e, "q"), "s"), 0, false, 0.6])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"x": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 20), 20])}, {"y": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 44), _S.unary("-", 8)])}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 3), 3])}, {"vy": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 4), 2])}, {"life": _S.invoke(_S.read(_e, "r"), "range", [2.5, 4])}, {"ph": _S.invoke(_S.read(_e, "r"), "range", [0, 6.3])}])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "q"), "x"), _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), _S.read(_e, "age"))), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 1.3), _S.prop(_S.read(_e, "q"), "ph"))]), 2)))
	_S.define(_e, "y", _S.binary("+", _S.prop(_S.read(_e, "q"), "y"), _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"))))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy"))]))
	_S.define(_e, "k", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 2), _S.binary("*", _S.binary("-", _S.prop(_S.read(_e, "q"), "life"), _S.read(_e, "age")), 2)]), _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1.2, _S.binary("/", _S.read(_e, "d"), 26))])))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.15)):
		_S.last([_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "H"), 1) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.6)) else _S.prop(_S.read(_e, "H"), 3)), _S.read(_e, "k")]), _S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.prop(_S.read(_e, "H"), 2), _S.binary("*", 0.2, _S.read(_e, "k"))])])
	return null
