@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/frost-breath.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "flyV", _S.import_value("core/index.js", "flyV"))
	_S.define(_e, "loopNoise", _S.import_value("core/index.js", "loopNoise"))
	_S.define(_e, "tileFbm", _S.import_value("core/index.js", "tileFbm"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "puff", _S.function_value(_e, "_f0"))
	_S.define(_e, "gust", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Frost breath"}, {"desc": "A cone of icy wind blowing right: frost puffs billow out, swell and sink, wind streaks race through, ice crystals tumble and glint off a white-hot mouth."}, {"tags": ["ice", "breath", "frost", "cone", "wind", "directional", "loop"]}, {"size": [184, 104]}, {"origin": [12, 50]}, {"duration": 1.2}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"spread": 0.21}, {"power": 1}, {"seed": 11}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SINK", 9)
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "r", _S.arg(_args, 4))
	_S.define(_e, "a", _S.arg(_args, 5))
	_S.define(_e, "k", _S.arg(_args, 6))
	_S.define(_e, "front", _S.arg(_args, 7))
	_S.define(_e, "body", (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.read(_e, "front")) else _S.prop(_S.read(_e, "C"), 4)))
	_S.define(_e, "cap", (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.read(_e, "front")) else _S.prop(_S.read(_e, "C"), 6)))
	_S.define(_e, "soft", _S.function_value(_e, "_f1"))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.read(_e, "body"), _S.call_value(_S.read(_e, "soft"), [_S.binary("*", _S.read(_e, "a"), 0.6)])])
	_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.06)), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.12)), _S.binary("*", _S.read(_e, "r"), 0.68), _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "body"), _S.prop(_S.read(_e, "C"), 3), 0.3]), _S.call_value(_S.read(_e, "soft"), [_S.binary("*", _S.read(_e, "a"), 0.5)])])
	if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.55)):
		_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.25)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.3)), _S.binary("*", _S.read(_e, "r"), 0.5), _S.read(_e, "cap"), _S.call_value(_S.read(_e, "soft"), [_S.binary("*", _S.binary("*", _S.read(_e, "a"), 0.7), _S.binary("-", 1, _S.binary("/", _S.read(_e, "k"), 0.55)))])])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 1.7), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.1, _S.read(_e, "a"))])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.function_value(_e, "_f2")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "q"), _S.binary("-", 1, _S.binary("*", _S.read(_e, "d"), _S.read(_e, "d"))))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "o", _S.arg(_args, 3))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	_S.define(_e, "sp", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "tan", [_S.prop(_S.read(_e, "o"), "spread")]), 1.08))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.invoke(_S.read(_e, "p"), "each", [2, _S.unary("-", 46), 170, 46, _S.function_value(_e, "_f4")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.arg(_args, 2))
	_S.define(_e, "sy", _S.arg(_args, 3))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "x"), 170))
	_S.define(_e, "hw", _S.binary("+", 2.5, _S.binary("*", _S.read(_e, "x"), _S.read(_e, "sp"))))
	_S.define(_e, "yc", _S.binary("*", _S.binary("*", 7, _S.read(_e, "u")), _S.read(_e, "u")))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "yc")), _S.read(_e, "hw")))
	if _S.truth(_S.logical("||", _S.binary(">=", _S.binary("*", _S.read(_e, "v"), _S.read(_e, "v")), 1), func(): return _S.binary(">=", _S.read(_e, "u"), 1))):
		return null
	_S.define(_e, "n", _S.call_value(_S.read(_e, "tileFbm"), [_S.binary("-", _S.binary("*", _S.read(_e, "x"), 0.055), _S.binary("*", _S.read(_e, "ph"), 10)), _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "yc")), 0.15), 7), 10, 0, _S.read(_e, "S"), 2]))
	_S.define(_e, "edge", _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.binary("*", _S.read(_e, "v"), _S.read(_e, "v"))), (_S.binary("/", _S.read(_e, "u"), 0.08) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.08)) else 1)), _S.binary("**", _S.binary("-", 1, _S.read(_e, "u")), 0.8)))
	_S.define(_e, "d", _S.binary("*", _S.call_value(_S.read(_e, "clamp"), [_S.binary("+", _S.binary("+", 0.5, _S.binary("*", _S.read(_e, "n"), 1.3)), _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")])), 0.35), _S.binary("**", _S.binary("-", 1, _S.read(_e, "u")), 1.5)))]), _S.read(_e, "edge")))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.08)):
		return null
	_S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.72)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.52)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.32)) else _S.prop(_S.read(_e, "C"), 4)))), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [0.78, _S.binary("*", _S.read(_e, "d"), 0.95)]), _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "d"), 0.08), 0.3)]))])
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.3)):
		_S.invoke(_S.read(_e, "p"), "add", [_S.read(_e, "sx"), _S.read(_e, "sy"), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.6)) else _S.prop(_S.read(_e, "C"), 5)), _S.binary("*", 0.2, _S.read(_e, "d"))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "sp", _S.prop(_S.read(_e, "o"), "spread"))
	_S.call_value(_S.read(_e, "gust"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "o")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 12, _S.read(_e, "S"), _S.function_value(_e, "_f6"), _S.function_value(_e, "_f7")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [1, 1.25])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", _S.read(_e, "sp")), _S.read(_e, "sp")]))
	_S.define(_e, "v", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [170, 230]), _S.prop(_S.read(_e, "o"), "power")))
	var _v0 = _S.call_value(_S.read(_e, "fly"), [3, _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1), 1]), _S.binary("*", _S.read(_e, "v"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")])), _S.binary("*", _S.read(_e, "v"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")])), _S.read(_e, "age"), _S.read(_e, "SINK"), 1.4])
	_S.define(_e, "x", _S.prop(_v0, 0))
	_S.define(_e, "y", _S.prop(_v0, 1))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "rad", _S.binary("+", 2, _S.binary("*", 12, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "k"), 0.75]))))
	_S.call_value(_S.read(_e, "puff"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "y"), _S.binary("-", 40, _S.read(_e, "rad"))]), _S.read(_e, "rad"), _S.binary("*", _S.binary("*", 0.75, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "k")), 1.2])), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "age"), 0.08)])), _S.read(_e, "k"), false])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "sp", _S.prop(_S.read(_e, "o"), "spread"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.invoke(_S.read(_e, "p"), "glowLine", [4, 0, 120, 6, 24, _S.prop(_S.read(_e, "C"), 4), 0.26])
	_S.invoke(_S.read(_e, "p"), "glowLine", [2, 0, 50, 1, 9, _S.prop(_S.read(_e, "C"), 6), 0.3])
	_S.invoke(_S.read(_e, "p"), "glow", [60, 4, 44, _S.prop(_S.read(_e, "C"), 3), 0.16])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 10, _S.binary("+", _S.read(_e, "S"), 1), _S.function_value(_e, "_f9"), _S.function_value(_e, "_f10")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 18, _S.binary("+", _S.read(_e, "S"), 2), _S.function_value(_e, "_f11"), _S.function_value(_e, "_f12")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 26, _S.binary("+", _S.read(_e, "S"), 3), _S.function_value(_e, "_f13"), _S.function_value(_e, "_f14")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 9, _S.binary("+", _S.read(_e, "S"), 4), _S.function_value(_e, "_f17"), _S.function_value(_e, "_f18")])
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), 3)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "L", _S.binary("+", 9, _S.binary("*", 6, _S.call_value(_S.read(_v11, "loopNoise"), [_S.read(_v11, "ph"), 1.2, _S.binary("+", _S.read(_v11, "S"), _S.binary("*", _S.read(_v11, "i"), 7))]))))
		_S.define(_v11, "dy", _S.binary("*", _S.binary("-", _S.read(_v11, "i"), 1), 1.4))
		_S.invoke(_S.read(_v11, "p"), "line", [2, _S.binary("*", _S.read(_v11, "dy"), 0.5), _S.binary("+", 2, _S.read(_v11, "L")), _S.read(_v11, "dy"), _S.function_value(_v11, "_f19"), _S.function_value(_v11, "_f20")])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "ellipse", [2.5, 0, 4.6, 3, _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "ellipse", [2, 0, 3, 1.8, _S.read(_e, "WHITE")])
	_S.define(_e, "fl", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 3)]))))
	_S.invoke(_S.read(_e, "p"), "glow", [2, 0, 24, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.7, _S.read(_e, "fl"))])
	_S.invoke(_S.read(_e, "p"), "glow", [2, 0, 9, _S.read(_e, "WHITE"), _S.binary("*", 0.5, _S.read(_e, "fl"))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.7, 0.95])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "r"), "range", [_S.binary("*", _S.unary("-", _S.read(_e, "sp")), 0.8), _S.binary("*", _S.read(_e, "sp"), 0.8)]))
	_S.define(_e, "v", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [190, 260]), _S.prop(_S.read(_e, "o"), "power")))
	var _v1 = _S.call_value(_S.read(_e, "fly"), [3, _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1), 1]), _S.binary("*", _S.read(_e, "v"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")])), _S.binary("*", _S.read(_e, "v"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")])), _S.read(_e, "age"), _S.read(_e, "SINK"), 1.6])
	_S.define(_e, "x", _S.prop(_v1, 0))
	_S.define(_e, "y", _S.prop(_v1, 1))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "rad", _S.binary("+", 1.5, _S.binary("*", 8, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "k"), 0.7]))))
	_S.call_value(_S.read(_e, "puff"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "y"), _S.binary("-", 40, _S.read(_e, "rad"))]), _S.read(_e, "rad"), _S.binary("*", _S.binary("*", 0.85, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "k")), 1.3])), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "age"), 0.06)])), _S.read(_e, "k"), true])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.8, 1.1])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "r"), "range", [_S.binary("*", _S.unary("-", _S.read(_e, "sp")), 1.1), _S.binary("*", _S.read(_e, "sp"), 1.1)]))
	_S.define(_e, "v", _S.invoke(_S.read(_e, "r"), "range", [120, 190]))
	var _v2 = _S.call_value(_S.read(_e, "fly"), [4, 0, _S.binary("*", _S.read(_e, "v"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")])), _S.binary("*", _S.read(_e, "v"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")])), _S.read(_e, "age"), _S.binary("*", _S.read(_e, "SINK"), 1.4), 1.5])
	_S.define(_e, "x", _S.prop(_v2, 0))
	_S.define(_e, "y", _S.prop(_v2, 1))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "sw", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 9), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))]), 1.5))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "k"), 0.85), func(): return _S.binary("<", _S.binary("%", _S.binary("*", _S.read(_e, "age"), 30), 2), 1))):
		_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "sw")), (_S.read(_e, "WHITE") if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.5])) else _S.prop(_S.read(_e, "C"), 6))])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.22, 0.36])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "r"), "range", [_S.binary("*", _S.unary("-", _S.read(_e, "sp")), 0.9), _S.binary("*", _S.read(_e, "sp"), 0.9)]))
	_S.define(_e, "v", _S.invoke(_S.read(_e, "r"), "range", [280, 380]))
	var _v3 = _S.call_value(_S.read(_e, "fly"), [6, _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 2), 2]), _S.binary("*", _S.read(_e, "v"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")])), _S.binary("*", _S.read(_e, "v"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")])), _S.read(_e, "age"), 0, 0.9])
	_S.define(_e, "x", _S.prop(_v3, 0))
	_S.define(_e, "y", _S.prop(_v3, 1))
	var _v4 = _S.call_value(_S.read(_e, "flyV"), [_S.binary("*", _S.read(_e, "v"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")])), _S.binary("*", _S.read(_e, "v"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")])), _S.read(_e, "age"), 0, 0.9])
	_S.define(_e, "vx", _S.prop(_v4, 0))
	_S.define(_e, "vy", _S.prop(_v4, 1))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "vx"), _S.read(_e, "vy")]))
	_S.define(_e, "L", _S.binary("+", 4, _S.binary("*", _S.read(_e, "s"), 0.03)))
	_S.define(_e, "ux", _S.binary("/", _S.read(_e, "vx"), _S.read(_e, "s")))
	_S.define(_e, "uy", _S.binary("/", _S.read(_e, "vy"), _S.read(_e, "s")))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "L"))), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "L"))), _S.read(_e, "x"), _S.read(_e, "y"), _S.function_value(_e, "_f15"), _S.function_value(_e, "_f16")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.3, _S.binary("-", 1, _S.read(_e, "k")))])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.8)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.4)) else _S.prop(_S.read(_e, "C"), 4)))

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", (1 if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.35)) else _S.binary("/", _S.read(_e, "u"), 0.35)), (1 if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.75)) else _S.binary("/", _S.binary("-", 1, _S.read(_e, "k")), 0.25)))

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.65, 0.9])

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", _S.read(_e, "sp")), _S.read(_e, "sp")]))
	_S.define(_e, "v", _S.invoke(_S.read(_e, "r"), "range", [150, 230]))
	var _v5 = _S.call_value(_S.read(_e, "fly"), [5, 0, _S.binary("*", _S.read(_e, "v"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")])), _S.binary("*", _S.read(_e, "v"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")])), _S.read(_e, "age"), _S.read(_e, "SINK"), 1.1])
	_S.define(_e, "x", _S.prop(_v5, 0))
	_S.define(_e, "y", _S.prop(_v5, 1))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "a", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]), _S.binary("*", _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [9, 15])), _S.invoke(_S.read(_e, "r"), "sign", []))))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "r"), "range", [1.5, 2.6]))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0.85), func(): return _S.binary("<", _S.binary("%", _S.binary("*", _S.read(_e, "age"), 30), 2), 1))):
		return null
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "L"))), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "L"))), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "L"))), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "L"))), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "L"))), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "L"))), _S.read(_e, "WHITE")])
	_S.define(_e, "gl", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "a"), 2)]))
	if _S.truth(_S.binary(">", _S.read(_e, "gl"), 0.92)):
		var _v6 = _S.scope(_e)
		for _v7 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
			var _v8 = _S.scope(_v6)
			var _v9 = _v7
			_S.define(_v8, "dx", _S.prop(_v9, 0))
			_S.define(_v8, "dy", _S.prop(_v9, 1))
			_S.invoke(_S.read(_v8, "p"), "px", [_S.binary("+", _S.read(_v8, "x"), _S.read(_v8, "dx")), _S.binary("+", _S.read(_v8, "y"), _S.read(_v8, "dy")), _S.prop(_S.read(_v8, "C"), 6)])
		_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.read(_v6, "WHITE")])
		_S.invoke(_S.read(_v6, "p"), "glow", [_S.read(_v6, "x"), _S.read(_v6, "y"), 6, _S.prop(_S.read(_v6, "C"), 5), 0.5])
	else:
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.prop(_S.read(_e, "C"), 5), 0.2])
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else _S.prop(_S.read(_e, "C"), 6))

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.6)) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "u"), 0.6), 0.4)))
