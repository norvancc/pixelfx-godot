@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/wisp.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Swarm", _S.import_value("fx/critters/_lib.js", "Swarm"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "lnoise", _S.import_value("fx/critters/_lib.js", "lnoise"))
	_S.define(_e, "tongue", _S.import_value("fx/critters/_lib.js", "tongue"))
	_S.define(_e, "firePuff", _S.import_value("fx/critters/_lib.js", "firePuff"))
	_S.define(_e, "shadow", _S.import_value("fx/critters/_lib.js", "shadow"))
	_S.define(_e, "at", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Wisp"}, {"desc": "A will-o'-the-wisp loops a figure-eight over the floor: a little soul-flame with a face, its flame tail licking up and streaming behind, shedding puffs and sparks."}, {"tags": ["critter", "wisp", "spirit", "flame", "magic", "flying", "loop"]}, {"size": [128, 104]}, {"origin": [64, 96]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0a1f2e", "#0f3d52", "#14707e", "#1fa8a8", "#4fe0c8", "#a8fff0", "#ffffff"]}, {"hover": 36}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SWARM", _S.construct(_S.read(_e, "Swarm"), []))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "hover", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")))
	return _S.merge([{"x": _S.binary("*", 34, _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))}, {"y": _S.binary("-", _S.unary("-", _S.read(_e, "hover")), _S.binary("*", 10, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", 2, _S.read(_e, "a"))])))}, {"vx": _S.binary("*", _S.binary("/", _S.binary("*", 34, _S.read(_e, "TAU")), _S.read(_e, "D")), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))}, {"vy": _S.binary("*", _S.binary("/", _S.binary("*", _S.unary("-", 20), _S.read(_e, "TAU")), _S.read(_e, "D")), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", 2, _S.read(_e, "a"))]))}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "heat", [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 3)])
	_S.define(_e, "lean", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "S"), "vx")), 80), _S.unary("-", 0.9), 0.9]))
	_S.define(_e, "stretch", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.prop(_S.read(_e, "S"), "vy"), 120), _S.unary("-", 0.3), 0.4]))
	_S.define(_e, "X", _S.prop(_S.read(_e, "S"), "x"))
	_S.define(_e, "Y", _S.prop(_S.read(_e, "S"), "y"))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 30, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7), 1), _S.function_value(_e, "_f2"), _S.function_value(_e, "_f3")])
	_S.define(_e, "tails", [[_S.unary("-", 3.5), 13, 2.5, 3], [3.5, 14, 2.5, 7], [0, 20, 3.2, 11]])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "li", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "li"), 4)):
		for _v2 in _S.array(_S.read(_v1, "tails")):
			var _v3 = _S.scope(_v1)
			var _v4 = _v2
			_S.define(_v3, "dx", _S.prop(_v4, 0))
			_S.define(_v3, "h", _S.prop(_v4, 1))
			_S.define(_v3, "w", _S.prop(_v4, 2))
			_S.define(_v3, "n", _S.prop(_v4, 3))
			var _v5 = _S.scope(_v3)
			_S.define(_v5, "hh", _S.binary("*", _S.binary("+", _S.read(_v5, "h"), _S.binary("*", _S.binary("*", 0.25, _S.read(_v5, "h")), _S.call_value(_S.read(_v5, "lnoise"), [_S.read(_v5, "t"), _S.read(_v5, "D"), 9, _S.read(_v5, "n"), 5]))), _S.binary("+", 1, _S.read(_v5, "stretch"))))
			_S.call_value(_S.read(_v5, "tongue"), [_S.read(_v5, "p"), _S.binary("+", _S.read(_v5, "X"), _S.read(_v5, "dx")), _S.binary("-", _S.read(_v5, "Y"), 2), _S.read(_v5, "hh"), _S.read(_v5, "w"), _S.binary("+", _S.binary("*", _S.call_value(_S.read(_v5, "lnoise"), [_S.read(_v5, "t"), _S.read(_v5, "D"), 6, _S.read(_v5, "n"), 40]), 1.5), _S.binary("*", _S.binary("*", _S.read(_v5, "lean"), _S.read(_v5, "hh")), 0.9)), _S.read(_v5, "t"), _S.read(_v5, "D"), _S.read(_v5, "n"), _S.read(_v5, "heat"), _S.read(_v5, "li")])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "li", 1, "+=", true)
	_S.define(_e, "R", 7.5)
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_e, "X"), _S.read(_e, "R")), 2), _S.binary("-", _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "R")), 2), _S.binary("+", _S.binary("+", _S.read(_e, "X"), _S.read(_e, "R")), 2), _S.binary("+", _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "R")), 2), _S.function_value(_e, "_f4")])
	_S.define(_e, "look", _S.invoke(_S.read(_e, "Math"), "round", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.prop(_S.read(_e, "S"), "vx"), 60), _S.unary("-", 1), 1])]))
	_S.define(_e, "blink", _S.logical("&&", _S.binary(">", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "t"), _S.read(_e, "D")]), 2.2), func(): return _S.binary("<", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "t"), _S.read(_e, "D")]), 2.28)))
	for _v6 in _S.array([_S.unary("-", 1), 1]):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "s", _v6)
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "ex", _S.binary("+", _S.binary("-", _S.binary("+", _S.invoke(_S.read(_v8, "Math"), "round", [_S.read(_v8, "X")]), _S.binary("*", _S.read(_v8, "s"), 2)), (0 if _S.truth(_S.binary(">", _S.read(_v8, "s"), 0)) else 1)), _S.read(_v8, "look")))
		_S.define(_v8, "ey", _S.binary("-", _S.invoke(_S.read(_v8, "Math"), "round", [_S.read(_v8, "Y")]), 1))
		if _S.truth(_S.read(_v8, "blink")):
			_S.last([_S.invoke(_S.read(_v8, "p"), "px", [_S.read(_v8, "ex"), _S.binary("+", _S.read(_v8, "ey"), 1), _S.prop(_S.read(_v8, "C"), 1)]), _S.invoke(_S.read(_v8, "p"), "px", [_S.binary("+", _S.read(_v8, "ex"), 1), _S.binary("+", _S.read(_v8, "ey"), 1), _S.prop(_S.read(_v8, "C"), 1)])])
		else:
			var _v9 = _S.scope(_v8)
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "k", 0)
			while _S.truth(_S.binary("<", _S.read(_v10, "k"), 3)):
				_S.last([_S.invoke(_S.read(_v10, "p"), "px", [_S.read(_v10, "ex"), _S.binary("+", _S.read(_v10, "ey"), _S.read(_v10, "k")), _S.prop(_S.read(_v10, "C"), 1)]), _S.invoke(_S.read(_v10, "p"), "px", [_S.binary("+", _S.read(_v10, "ex"), 1), _S.binary("+", _S.read(_v10, "ey"), _S.read(_v10, "k")), _S.prop(_S.read(_v10, "C"), 1)])])
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "k", 1, "+=", true)
			_S.invoke(_S.read(_v9, "p"), "px", [_S.binary("+", _S.read(_v9, "ex"), (1 if _S.truth(_S.binary(">", _S.read(_v9, "look"), 0)) else 0)), _S.read(_v9, "ey"), _S.prop(_S.read(_v9, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "X")]), _S.read(_e, "look")), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "Y")]), 3), _S.prop(_S.read(_e, "C"), 2)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "X")]), 1), _S.read(_e, "look")), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "Y")]), 3), _S.prop(_S.read(_e, "C"), 2)])
	_S.define(_e, "sw", _S.invoke(_S.read(_e, "SWARM"), "begin", [_S.read(_e, "t")]))
	_S.set_prop(_S.prop(_S.read(_e, "sw"), "ps"), "sparks", [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)], "=", false)
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 26, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7), 2), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	_S.invoke(_S.read(_e, "sw"), "draw", [_S.read(_e, "p")])
	_S.define(_e, "fl", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.call_value(_S.read(_e, "lnoise"), [_S.read(_e, "t"), _S.read(_e, "D"), 22, 0, 9]))))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.read(_e, "X"), _S.binary("*", _S.read(_e, "lean"), 3)), _S.binary("-", _S.read(_e, "Y"), 6), _S.binary("*", 46, _S.read(_e, "fl")), _S.prop(_S.read(_e, "C"), 4), 0.38])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "X"), _S.binary("-", _S.read(_e, "Y"), 1), 13, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.35, _S.read(_e, "fl"))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.3, 0.6])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "S0", _S.call_value(_S.read(_e, "at"), [_S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), _S.read(_e, "D")]), _S.prop(_S.read(_e, "o"), "hover")]))
	var _v0 = _S.call_value(_S.read(_e, "fly"), [_S.binary("+", _S.prop(_S.read(_e, "S0"), "x"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 3), 3])), _S.binary("-", _S.prop(_S.read(_e, "S0"), "y"), _S.invoke(_S.read(_e, "r"), "range", [0, 4])), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [6, 16])), _S.read(_e, "age"), _S.unary("-", 40), 2.5])
	_S.define(_e, "x", _S.prop(_v0, 0))
	_S.define(_e, "y", _S.prop(_v0, 1))
	_S.call_value(_S.read(_e, "firePuff"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.read(_e, "L"))), _S.invoke(_S.read(_e, "r"), "range", [1.2, 2.6]), _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), 100), _S.read(_e, "heat")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "X")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "Y")))
	_S.define(_e, "ang", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]))
	_S.define(_e, "rr", _S.binary("+", _S.binary("+", _S.read(_e, "R"), _S.binary("*", 0.7, _S.call_value(_S.read(_e, "lnoise"), [_S.read(_e, "t"), _S.read(_e, "D"), 16, _S.binary("+", _S.binary("*", _S.read(_e, "ang"), 1.6), 10), 3]))), (_S.unary("-", 0.6) if _S.truth(_S.binary(">", _S.read(_e, "dy"), 0)) else 0)))
	_S.define(_e, "d", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]), _S.read(_e, "rr")))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		return 0
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.42)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.68)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.88)) else _S.prop(_S.read(_e, "C"), 3))))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.8, 1.6])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "S0", _S.call_value(_S.read(_e, "at"), [_S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), _S.read(_e, "D")]), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "s", _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), 100))
	var _v11 = _S.call_value(_S.read(_e, "fly"), [_S.binary("+", _S.prop(_S.read(_e, "S0"), "x"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 5), 5])), _S.binary("-", _S.prop(_S.read(_e, "S0"), "y"), _S.invoke(_S.read(_e, "r"), "range", [4, 12])), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [20, 45])), _S.read(_e, "age"), _S.unary("-", 15), 1.6])
	_S.define(_e, "x", _S.prop(_v11, 0))
	_S.define(_e, "y", _S.prop(_v11, 1))
	_S.invoke(_S.read(_e, "sw"), "add", [_S.prop(_S.read(_e, "P"), "EMBER"), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2.3), _S.read(_e, "s"))]), 3), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "age")]))), _S.read(_e, "y"), 0, 0, _S.read(_e, "age"), _S.read(_e, "L"), _S.prop(_S.read(_e, "C"), 4), (2 if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.3])) else 1), 0, _S.read(_e, "s")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "near", _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.unary("-", _S.prop(_S.read(_e, "S"), "y")), 24), 30))]))
	_S.call_value(_S.read(_e, "shadow"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "S"), "x"), 0, 7, 1.2, _S.prop(_S.read(_e, "C"), 0), 0.4])
	var _v12 = _S.scope(_e)
	_S.define(_v12, "x", _S.unary("-", 24))
	while _S.truth(_S.binary("<=", _S.read(_v12, "x"), 24)):
		_S.invoke(_S.read(_v12, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_v12, "S"), "x"), _S.read(_v12, "x")), _S.unary("-", 1), 16, _S.prop(_S.read(_v12, "C"), 4), _S.binary("*", _S.binary("+", 0.08, _S.binary("*", 0.1, _S.read(_v12, "near"))), _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v12, "Math"), "abs", [_S.read(_v12, "x")]), 32)))])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "x", 6, "+=", false)
	return null
