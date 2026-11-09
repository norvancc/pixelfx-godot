@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/arcane-beam.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "flyV", _S.import_value("core/index.js", "flyV"))
	_S.define(_e, "loopNoise", _S.import_value("core/index.js", "loopNoise"))
	_S.define(_e, "fract", _S.import_value("core/index.js", "fract"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "bayer", _S.import_value("fx/arcane/_lib.js", "bayer"))
	_S.define(_e, "mote", _S.import_value("fx/arcane/_lib.js", "mote"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "D", 1.2)
	_S.define(_e, "HX", 15)
	_S.define(_e, "HY", _S.unary("-", 24))
	_S.define(_e, "L", 168)
	_S.define(_e, "W", 6)
	_S.define(_e, "meta", _S.merge([{"name": "Arcane beam"}, {"desc": "A beam fires right from the hand: a white core, strands twisting round it, pulses running down it, a flaring source and an end that sprays sparks."}, {"tags": ["arcane", "beam", "laser", "ray", "magic", "directional", "loop"]}, {"size": [264, 100]}, {"origin": [26, 84]}, {"duration": _S.read(_e, "D")}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 10}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "AIM", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}, {"crouch": 4}, {"lean": 4}, {"fx": 18}, {"fy": _S.unary("-", 24)}, {"bx": 13}, {"by": _S.unary("-", 20)}, {"ffx": 11}, {"fbx": _S.unary("-", 9)}, {"toeB": true}]))
	_S.define(_e, "PULL", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}, {"crouch": 4}, {"lean": _S.unary("-", 3)}, {"fx": 1}, {"fy": _S.unary("-", 20)}, {"bx": 4}, {"by": _S.unary("-", 22)}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 186}])}, {"poses": [[_S.unary("-", 0.62), _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}])], [_S.unary("-", 0.3), _S.read(_e, "PULL")], [_S.unary("-", 0.04), _S.merge([_S.read(_e, "PULL"), {"crouch": 5}, {"lean": _S.unary("-", 4)}])], [0, _S.merge([_S.read(_e, "AIM"), {"crouch": 3}]), "snap"], [0.3, _S.read(_e, "AIM")], [0.6, _S.merge([_S.read(_e, "AIM"), {"crouch": 5}, {"lean": 3}])], [0.9, _S.read(_e, "AIM")], [1.2, _S.merge([_S.read(_e, "AIM"), {"crouch": 3}])]]}, {"hits": [_S.merge([{"t": 0.1}, {"push": 0.5}, {"straw": 3}, {"flash": 0.02}, {"y": _S.unary("-", 24)}]), _S.merge([{"t": 0.7}, {"push": 0.5}, {"straw": 3}, {"flash": 0.02}, {"y": _S.unary("-", 24)}])]}, {"dust": [_S.merge([{"t": 0}, {"x": _S.unary("-", 10)}, {"n": 5}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "EX", _S.binary("+", _S.read(_e, "HX"), _S.read(_e, "L")))
	_S.define(_e, "LV", [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2)])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "d", 0)
	while _S.truth(_S.binary("<=", _S.read(_v0, "d"), _S.read(_v0, "L"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", _S.binary("+", _S.read(_v1, "HX"), _S.read(_v1, "d")))
		_S.define(_v1, "w", _S.binary("*", _S.binary("*", _S.read(_v1, "W"), _S.binary("+", 1, _S.binary("*", 0.12, _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_v1, "d"), 0.35), _S.binary("*", _S.binary("*", _S.read(_v1, "ph"), _S.read(_v1, "TAU")), 8))])))), _S.invoke(_S.read(_v1, "Math"), "min", [1, _S.binary("/", _S.binary("+", _S.read(_v1, "d"), 3), 7)])))
		_S.define(_v1, "pulse", (1 if _S.truth(_S.binary("<", _S.call_value(_S.read(_v1, "fract"), [_S.binary("-", _S.binary("*", _S.read(_v1, "d"), 0.025), _S.binary("*", _S.read(_v1, "ph"), 4))]), 0.07)) else 0))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "q0", _S.binary("*", _S.unary("-", _S.read(_v2, "w")), 1.3))
		while _S.truth(_S.binary("<=", _S.read(_v2, "q0"), _S.binary("*", _S.read(_v2, "w"), 1.3))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "q", _S.binary("/", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.read(_v3, "q0")]), _S.read(_v3, "w")))
			_S.define(_v3, "y", _S.binary("+", _S.read(_v3, "HY"), _S.read(_v3, "q0")))
			_S.define(_v3, "lv", (0 if _S.truth(_S.binary("<", _S.read(_v3, "q"), 0.2)) else (1 if _S.truth(_S.binary("<", _S.read(_v3, "q"), 0.4)) else (2 if _S.truth(_S.binary("<", _S.read(_v3, "q"), 0.62)) else (3 if _S.truth(_S.binary("<", _S.read(_v3, "q"), 0.85)) else (4 if _S.truth(_S.binary("<", _S.read(_v3, "q"), 1)) else 5))))))
			_S.write(_v3, "lv", _S.invoke(_S.read(_v3, "Math"), "max", [0, _S.binary("-", _S.read(_v3, "lv"), _S.read(_v3, "pulse"))]), "=", false)
			if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v3, "lv"), 5), func(): return _S.binary(">", _S.call_value(_S.read(_v3, "bayer"), [_S.read(_v3, "x"), _S.read(_v3, "y")]), _S.binary("/", _S.binary("-", 1.3, _S.read(_v3, "q")), 0.3)))):
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "q0", 0.5, "+=", false)
				continue
			_S.invoke(_S.read(_v3, "p"), "px", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.prop(_S.read(_v3, "LV"), _S.read(_v3, "lv"))])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "q0", 0.5, "+=", false)
		var _v4 = _S.scope(_v1)
		_S.define(_v4, "s", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "s"), 3)):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "a", _S.binary("+", _S.binary("-", _S.binary("*", _S.read(_v5, "d"), 0.17), _S.binary("*", _S.binary("*", _S.read(_v5, "ph"), _S.read(_v5, "TAU")), 6)), _S.binary("/", _S.binary("*", _S.read(_v5, "s"), _S.read(_v5, "TAU")), 3)))
			_S.define(_v5, "off", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "w")), 1.05))
			if _S.truth(_S.binary(">", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.unary("-", 0.15))):
				_S.invoke(_S.read(_v5, "p"), "dot", [_S.read(_v5, "x"), _S.binary("+", _S.read(_v5, "HY"), _S.read(_v5, "off")), (_S.read(_v5, "WHITE") if _S.truth(_S.binary(">", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), 0.55)) else _S.prop(_S.read(_v5, "C"), 6))])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "s", 1, "+=", true)
		if _S.truth(_S.binary("===", _S.binary("&", _S.invoke(_S.read(_v1, "Math"), "round", [_S.binary("*", _S.read(_v1, "d"), 2)]), 11), 0)):
			_S.invoke(_S.read(_v1, "p"), "glow", [_S.read(_v1, "x"), _S.read(_v1, "HY"), _S.binary("+", _S.binary("*", _S.read(_v1, "w"), 2.2), 4), _S.prop(_S.read(_v1, "C"), 5), 0.2])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "d", 0.5, "+=", false)
	_S.define(_e, "fr", _S.binary("+", 4.2, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 10)]), 0.6)))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 4)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "a", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v7, "ph"), _S.read(_v7, "TAU")), 2.5), _S.binary("/", _S.binary("*", _S.read(_v7, "i"), _S.read(_v7, "TAU")), 4)))
		_S.define(_v7, "l", _S.binary("+", 7, _S.binary("*", 3, _S.invoke(_S.read(_v7, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v7, "ph"), _S.read(_v7, "TAU")), 6), _S.read(_v7, "i"))]))))
		_S.invoke(_S.read(_v7, "p"), "line", [_S.read(_v7, "HX"), _S.read(_v7, "HY"), _S.binary("+", _S.read(_v7, "HX"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "l"))), _S.binary("+", _S.read(_v7, "HY"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "l"))), _S.function_value(_v7, "_f1"), _S.function_value(_v7, "_f2")])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "HX"), _S.read(_e, "HY"), _S.binary("+", _S.read(_e, "fr"), 1.5), _S.prop(_S.read(_e, "C"), 4)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "HX"), _S.read(_e, "HY"), _S.read(_e, "fr"), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "HX"), _S.read(_e, "HY"), _S.binary("*", _S.read(_e, "fr"), 0.6), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "HX"), _S.read(_e, "HY"), 32, _S.prop(_S.read(_e, "C"), 5), 0.8])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 10, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 3), 1), 0.18, _S.function_value(_e, "_f3")])
	_S.define(_e, "ir", _S.binary("+", 5, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 12)]), 0.8)))
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), 7)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "a", _S.binary("+", _S.prop(_S.read(_v9, "Math"), "PI"), _S.binary("*", _S.binary("-", _S.read(_v9, "i"), 3), 0.36)))
		_S.define(_v9, "l", _S.binary("+", 8, _S.binary("*", 8, _S.invoke(_S.read(_v9, "Math"), "abs", [_S.call_value(_S.read(_v9, "loopNoise"), [_S.read(_v9, "ph"), 4, _S.binary("+", _S.binary("*", _S.read(_v9, "S"), 7), _S.read(_v9, "i"))])]))))
		_S.invoke(_S.read(_v9, "p"), "line", [_S.read(_v9, "EX"), _S.read(_v9, "HY"), _S.binary("+", _S.read(_v9, "EX"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "l"))), _S.binary("+", _S.read(_v9, "HY"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "l"))), _S.function_value(_v9, "_f4"), _S.function_value(_v9, "_f5")])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	var _v10 = _S.scope(_e)
	_S.define(_v10, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "k"), 3)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "q", _S.call_value(_S.read(_v11, "fract"), [_S.binary("+", _S.binary("*", _S.read(_v11, "ph"), 3), _S.binary("/", _S.read(_v11, "k"), 3))]))
		_S.invoke(_S.read(_v11, "p"), "ring", [_S.read(_v11, "EX"), _S.read(_v11, "HY"), _S.binary("+", 3, _S.binary("*", 15, _S.invoke(_S.read(_v11, "ease"), "outCubic", [_S.read(_v11, "q")]))), _S.invoke(_S.read(_v11, "Math"), "max", [1, _S.binary("*", 2, _S.binary("-", 1, _S.read(_v11, "q")))]), (_S.read(_v11, "WHITE") if _S.truth(_S.binary("<", _S.read(_v11, "q"), 0.25)) else _S.prop(_S.read(_v11, "C"), 5)), _S.binary("-", 1.1, _S.read(_v11, "q"))])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "k", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "EX"), _S.read(_e, "HY"), _S.binary("+", _S.read(_e, "ir"), 1.5), _S.prop(_S.read(_e, "C"), 4)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "EX"), _S.read(_e, "HY"), _S.read(_e, "ir"), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "EX"), _S.read(_e, "HY"), _S.binary("*", _S.read(_e, "ir"), 0.55), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "EX"), _S.read(_e, "HY"), 40, _S.prop(_S.read(_e, "C"), 5), 0.9])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "EX"), _S.read(_e, "HY"), 12, _S.read(_e, "WHITE"), 0.6])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 220, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 3), 2), _S.function_value(_e, "_f6"), _S.function_value(_e, "_f7")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 6, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 3), 3), 0.3, _S.function_value(_e, "_f9")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 7, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 3), 5), _S.function_value(_e, "_f10"), _S.function_value(_e, "_f11")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 16, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 3), 4), _S.function_value(_e, "_f13"), _S.function_value(_e, "_f14")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "EX"), _S.unary("-", 1), 30, _S.prop(_S.read(_e, "C"), 5), 0.25])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.read(_e, "HX"), _S.binary("/", _S.read(_e, "L"), 2)), _S.unary("-", 1), 60, _S.prop(_S.read(_e, "C"), 4), 0.12])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else _S.prop(_S.read(_e, "C"), 6))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.6)) else _S.binary("-", 1.6, _S.read(_e, "u")))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "dd", _S.binary("+", _S.binary("*", 16, _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))), 3))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "HX"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "dd"))))
	_S.define(_e, "y", _S.binary("+", _S.read(_e, "HY"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "dd"))))
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")), 0.6)) else _S.prop(_S.read(_e, "C"), 6))])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.4)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.prop(_S.read(_e, "C"), 6)))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.6)) else _S.binary("-", 1.6, _S.read(_e, "u")))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.18, 0.5])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "a", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), 1.5), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1.7), 0.45])))
	_S.define(_e, "sp", _S.invoke(_S.read(_e, "r"), "range", [70, 260]))
	_S.define(_e, "vx", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "sp")))
	_S.define(_e, "vy", _S.binary("-", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "sp")), 30))
	var _v12 = _S.call_value(_S.read(_e, "fly"), [_S.read(_e, "EX"), _S.read(_e, "HY"), _S.read(_e, "vx"), _S.read(_e, "vy"), _S.read(_e, "age"), 480, 2.2])
	_S.define(_e, "x", _S.prop(_v12, 0))
	_S.define(_e, "y", _S.prop(_v12, 1))
	var _v13 = _S.call_value(_S.read(_e, "flyV"), [_S.read(_e, "vx"), _S.read(_e, "vy"), _S.read(_e, "age"), 480, 2.2])
	_S.define(_e, "ux", _S.prop(_v13, 0))
	_S.define(_e, "uy", _S.prop(_v13, 1))
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life"))))
	if _S.truth(_S.binary(">", _S.read(_e, "y"), _S.unary("-", 1))):
		return null
	_S.define(_e, "head", (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.6)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.3)) else _S.prop(_S.read(_e, "C"), 5))))
	_S.define(_e, "sp2", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "ux"), _S.read(_e, "uy")]), func(): return 1))
	_S.define(_e, "len", _S.invoke(_S.read(_e, "Math"), "min", [8, _S.binary("+", 1, _S.binary("*", _S.read(_e, "sp2"), 0.022))]))
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("/", _S.read(_e, "ux"), _S.read(_e, "sp2")), _S.read(_e, "len"))), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("/", _S.read(_e, "uy"), _S.read(_e, "sp2")), _S.read(_e, "len"))), _S.read(_e, "x"), _S.read(_e, "y"), _S.function_value(_e, "_f8")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.read(_e, "head"), _S.binary("*", 0.45, _S.read(_e, "k"))])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "head") if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.5)) else _S.prop(_S.read(_e, "C"), 4))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")), _S.prop(_S.read(_e, "Math"), "PI"))]))
	_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "EX"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 12), 4])), _S.binary("+", _S.read(_e, "HY"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 12), 12])), _S.binary("+", 1, _S.binary("*", 2.5, _S.read(_e, "k"))), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.4, _S.read(_e, "k"))])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.8, 1.2])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "x", _S.binary("-", _S.binary("+", _S.read(_e, "EX"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 8), 4])), _S.binary("*", _S.read(_e, "q"), 6)))
	_S.define(_e, "y", _S.binary("-", _S.binary("-", _S.read(_e, "HY"), 4), _S.binary("*", _S.read(_e, "q"), _S.invoke(_S.read(_e, "r"), "range", [14, 24]))))
	_S.define(_e, "rad", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [3, 5]), _S.binary("+", 0.7, _S.binary("*", 0.8, _S.read(_e, "q")))))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "rad"), _S.prop(_S.read(_e, "C"), 4), _S.function_value(_e, "_f12")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "dd", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", 0.28, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "q"), _S.prop(_S.read(_e, "Math"), "PI"))])), _S.binary("-", 1, _S.binary("*", _S.read(_e, "dd"), _S.read(_e, "dd"))))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.3, 0.6])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.read(_e, "HX"), _S.invoke(_S.read(_e, "r"), "range", [10, _S.binary("-", _S.read(_e, "L"), 10)])), _S.binary("*", _S.read(_e, "q"), 20)))
	_S.define(_e, "y", _S.binary("+", _S.read(_e, "HY"), _S.binary("*", _S.invoke(_S.read(_e, "r"), "sign", []), _S.binary("+", _S.binary("+", _S.read(_e, "W"), 1), _S.binary("*", _S.read(_e, "q"), _S.invoke(_S.read(_e, "r"), "range", [4, 10]))))))
	_S.call_value(_S.read(_e, "mote"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), 40, _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "HY")), 1.5), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.5])) else _S.prop(_S.read(_e, "C"), 5)), 0.6, _S.binary("-", 1, _S.read(_e, "q")), 0.3])
	return null
