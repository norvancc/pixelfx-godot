@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/water-jet.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "bead", _S.import_value("fx/water/_lib.js", "bead"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Water jet"}, {"desc": "A pressurised stream blasts right: a tight glassy rod with surges running down it that swells, roughens, bends under its weight and breaks into chunks, spray and mist."}, {"tags": ["water", "jet", "stream", "hose", "spray", "directional", "loop"]}, {"size": [188, 80]}, {"origin": [14, 32]}, {"duration": 1}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"length": 118}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "G", 520)
	_S.define(_e, "SPEED", 260)
	_S.define(_e, "drop", _S.function_value(_e, "_f6"))
	_S.define(_e, "thick", _S.function_value(_e, "_f7"))
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
	_S.define(_e, "L", _S.prop(_S.read(_e, "o"), "length"))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "T", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "X", 0)
	while _S.truth(_S.binary("<=", _S.read(_v0, "X"), _S.binary("+", _S.read(_v0, "L"), 3))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", _S.binary("+", _S.read(_v1, "X"), 0.5))
		_S.define(_v1, "u", _S.binary("/", _S.read(_v1, "x"), _S.read(_v1, "L")))
		if _S.truth(_S.binary(">", _S.read(_v1, "u"), 1)):
			break
		_S.define(_v1, "yc", _S.call_value(_S.read(_v1, "drop"), [_S.read(_v1, "x"), _S.read(_v1, "L")]))
		_S.define(_v1, "rough", _S.call_value(_S.read(_v1, "smooth"), [0.25, 1, _S.read(_v1, "u")]))
		_S.define(_v1, "sd", _S.binary("-", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v1, "x"), _S.binary("*", _S.binary("*", _S.read(_v1, "ph"), _S.read(_v1, "SPEED")), 2)), 130), 130), 130), 65))
		_S.define(_v1, "w0", _S.binary("+", _S.call_value(_S.read(_v1, "thick"), [_S.read(_v1, "x"), _S.read(_v1, "L")]), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("*", _S.read(_v1, "sd"), _S.read(_v1, "sd"))), 90)]), 1.4), _S.binary("-", 1, _S.binary("*", _S.read(_v1, "u"), 0.5)))))
		_S.define(_v1, "up", _S.binary("+", _S.read(_v1, "w0"), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v1, "tileNoise"), [_S.binary("-", _S.binary("*", _S.read(_v1, "x"), 0.18), _S.binary("*", _S.read(_v1, "ph"), 30)), 9, 30, 0, _S.binary("+", _S.read(_v1, "S"), 1)]), 2.2), _S.read(_v1, "rough"))))
		_S.define(_v1, "dn", _S.binary("+", _S.read(_v1, "w0"), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v1, "tileNoise"), [_S.binary("-", _S.binary("*", _S.read(_v1, "x"), 0.18), _S.binary("*", _S.read(_v1, "ph"), 30)), 3, 30, 0, _S.binary("+", _S.read(_v1, "S"), 1)]), 2.2), _S.read(_v1, "rough"))))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "Y", _S.invoke(_S.read(_v2, "Math"), "floor", [_S.binary("-", _S.read(_v2, "yc"), _S.read(_v2, "up"))]))
		while _S.truth(_S.binary("<=", _S.read(_v2, "Y"), _S.invoke(_S.read(_v2, "Math"), "ceil", [_S.binary("+", _S.read(_v2, "yc"), _S.read(_v2, "dn"))]))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "y", _S.binary("+", _S.read(_v3, "Y"), 0.5))
			_S.define(_v3, "q", _S.binary("/", _S.binary("-", _S.read(_v3, "y"), _S.read(_v3, "yc")), _S.invoke(_S.read(_v3, "Math"), "max", [0.8, (_S.read(_v3, "up") if _S.truth(_S.binary("<", _S.read(_v3, "y"), _S.read(_v3, "yc"))) else _S.read(_v3, "dn"))])))
			_S.define(_v3, "aq", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.read(_v3, "q")]))
			if _S.truth(_S.binary(">", _S.read(_v3, "aq"), 1)):
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "Y", 1, "+=", true)
				continue
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v3, "u"), 0.55), func(): return _S.binary("<", _S.call_value(_S.read(_v3, "tileNoise"), [_S.binary("-", _S.binary("*", _S.read(_v3, "x"), 0.12), _S.binary("*", _S.read(_v3, "ph"), 25)), _S.binary("*", _S.binary("-", _S.read(_v3, "y"), _S.read(_v3, "yc")), 0.25), 25, 0, _S.binary("+", _S.read(_v3, "S"), 2)]), _S.binary("+", _S.unary("-", 0.9), _S.binary("*", 1.6, _S.call_value(_S.read(_v3, "smooth"), [0.55, 1, _S.read(_v3, "u")])))))):
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "Y", 1, "+=", true)
				continue
			_S.define(_v3, "streak", _S.call_value(_S.read(_v3, "tileNoise"), [_S.binary("-", _S.binary("*", _S.read(_v3, "x"), 0.06), _S.binary("*", _S.read(_v3, "ph"), 40)), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "floor", [_S.binary("+", _S.binary("-", _S.read(_v3, "y"), _S.read(_v3, "yc")), 20)]), 1.7), 40, 0, _S.read(_v3, "S")]))
			_S.define(_v3, "lvl", (0 if _S.truth(_S.binary("<", _S.read(_v3, "aq"), 0.2)) else (1 if _S.truth(_S.binary("<", _S.read(_v3, "aq"), 0.48)) else (2 if _S.truth(_S.binary("<", _S.read(_v3, "aq"), 0.78)) else 3))))
			if _S.truth(_S.binary(">", _S.read(_v3, "streak"), 0.35)):
				_S.write(_v3, "lvl", _S.invoke(_S.read(_v3, "Math"), "max", [0, _S.binary("-", _S.read(_v3, "lvl"), 1)]), "=", false)
			if _S.truth(_S.binary(">", _S.read(_v3, "q"), 0.4)):
				_S.write(_v3, "lvl", _S.invoke(_S.read(_v3, "Math"), "min", [3, _S.binary("+", _S.read(_v3, "lvl"), 1)]), "=", false)
			_S.invoke(_S.read(_v3, "p"), "px", [_S.read(_v3, "X"), _S.read(_v3, "Y"), _S.prop([_S.read(_v3, "WHITE"), _S.prop(_S.read(_v3, "C"), 6), _S.prop(_S.read(_v3, "C"), 5), _S.prop(_S.read(_v3, "C"), 4)], _S.read(_v3, "lvl"))])
			if _S.truth(_S.binary("===", _S.read(_v3, "lvl"), 0)):
				_S.invoke(_S.read(_v3, "p"), "light", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.prop(_S.read(_v3, "C"), 5), 0.12])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "Y", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "X", 1, "+=", true)
	_S.define(_e, "fl", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "T"), 6)]))))
	_S.invoke(_S.read(_e, "p"), "circle", [0, 0, _S.binary("*", 4.4, _S.read(_e, "fl")), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "circle", [0, 0, _S.binary("*", 3.4, _S.read(_e, "fl")), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "circle", [0, 0, _S.binary("*", 2.2, _S.read(_e, "fl")), _S.read(_e, "WHITE")])
	var _v4 = _S.scope(_e)
	_S.define(_v4, "a", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "a"), _S.read(_v4, "TAU"))):
		_S.invoke(_S.read(_v4, "p"), "dot", [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.binary("+", _S.read(_v4, "a"), _S.binary("*", _S.read(_v4, "T"), 2))]), 5.2), _S.read(_v4, "fl")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.binary("+", _S.read(_v4, "a"), _S.binary("*", _S.read(_v4, "T"), 2))]), 5.2), _S.read(_v4, "fl")), _S.prop(_S.read(_v4, "C"), 5), 0.6])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "a", 0.35, "+=", false)
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, 24, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.6, _S.read(_e, "fl"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, 8, _S.read(_e, "WHITE"), _S.binary("*", 0.4, _S.read(_e, "fl"))])
	var _v5 = _S.scope(_e)
	_S.define(_v5, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "k"), 6)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "x", _S.binary("+", _S.binary("*", _S.read(_v6, "L"), 0.82), _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_v6, "k"), 13), _S.binary("*", _S.read(_v6, "ph"), _S.read(_v6, "SPEED"))), 78)))
		_S.define(_v6, "y", _S.binary("+", _S.binary("+", _S.call_value(_S.read(_v6, "drop"), [_S.invoke(_S.read(_v6, "Math"), "min", [_S.read(_v6, "x"), _S.read(_v6, "L")]), _S.read(_v6, "L")]), (_S.binary("*", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_v6, "x"), _S.read(_v6, "L")), 60), 2), 10) if _S.truth(_S.binary(">", _S.read(_v6, "x"), _S.read(_v6, "L"))) else 0)), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.binary("*", _S.read(_v6, "k"), 2.1)]), 1.5)))
		if _S.truth(_S.binary("<", _S.read(_v6, "x"), _S.binary("+", _S.read(_v6, "L"), 34))):
			_S.call_value(_S.read(_v6, "bead"), [_S.read(_v6, "p"), _S.read(_v6, "x"), _S.read(_v6, "y"), _S.read(_v6, "SPEED"), 40, (3 if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v6, "k"), 3), 0)) else 2), _S.read(_v6, "C")])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "k", 1, "+=", true)
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 70, _S.binary("+", _S.read(_e, "S"), 3), _S.function_value(_e, "_f1"), _S.function_value(_e, "_f2")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 12, _S.binary("+", _S.read(_e, "S"), 4), _S.function_value(_e, "_f3"), _S.function_value(_e, "_f4")])
	var _v7 = _S.scope(_e)
	_S.define(_v7, "x", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "x"), _S.read(_v7, "L"))):
		_S.invoke(_S.read(_v7, "p"), "glow", [_S.read(_v7, "x"), _S.call_value(_S.read(_v7, "drop"), [_S.read(_v7, "x"), _S.read(_v7, "L")]), _S.binary("+", 14, _S.binary("*", _S.read(_v7, "x"), 0.1)), _S.prop(_S.read(_v7, "C"), 4), _S.binary("*", 0.26, _S.binary("-", 1, _S.binary("*", _S.binary("/", _S.read(_v7, "x"), _S.read(_v7, "L")), 0.5)))])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "x", 10, "+=", false)
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("*", _S.read(_e, "L"), 0.9), _S.call_value(_S.read(_e, "drop"), [_S.binary("*", _S.read(_e, "L"), 0.9), _S.read(_e, "L")]), 26, _S.prop(_S.read(_e, "C"), 5), 0.22])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.2, 0.42])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "r"), "next", [])]))
	_S.define(_e, "x0", _S.binary("*", _S.read(_e, "L"), _S.binary("+", 0.3, _S.binary("*", 0.7, _S.read(_e, "f")))))
	_S.define(_e, "y0", _S.binary("+", _S.call_value(_S.read(_e, "drop"), [_S.read(_e, "x0"), _S.read(_e, "L")]), _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1), 1]), _S.call_value(_S.read(_e, "thick"), [_S.read(_e, "x0"), _S.read(_e, "L")]))))
	_S.define(_e, "vx", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [150, 270]), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.read(_e, "f")))))
	_S.define(_e, "vy", _S.binary("+", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1), 1]), 110), _S.read(_e, "f")), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 10), 20])))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.read(_e, "vx"), _S.read(_e, "age"))))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.read(_e, "vy"), _S.read(_e, "age"))), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "G")), _S.read(_e, "age")), _S.read(_e, "age"))))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary(">", _S.read(_e, "x"), _S.binary("+", _S.read(_e, "L"), 50)), func(): return _S.binary(">", _S.read(_e, "y"), 40)), func(): return _S.binary("<", _S.read(_e, "y"), _S.unary("-", 28))), func(): return _S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0.75), func(): return _S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), _S.binary("*", _S.binary("-", _S.read(_e, "k"), 0.75), 4))))):
		return null
	if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.45)):
		_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.5)) else _S.prop(_S.read(_e, "C"), 6))])
	else:
		_S.call_value(_S.read(_e, "bead"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "vx"), _S.binary("+", _S.read(_e, "vy"), _S.binary("*", _S.read(_e, "G"), _S.read(_e, "age"))), (2 if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.2)) else 1), _S.read(_e, "C")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.7, 1])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "x", _S.binary("+", _S.binary("*", _S.read(_e, "L"), _S.invoke(_S.read(_e, "r"), "range", [0.7, 1])), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [20, 45]))))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", _S.call_value(_S.read(_e, "drop"), [_S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "x"), _S.read(_e, "L")]), _S.read(_e, "L")]), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 5), 5])), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [4, 14]))))
	_S.define(_e, "rad", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [3, 5]), _S.binary("*", _S.read(_e, "k"), _S.invoke(_S.read(_e, "r"), "range", [5, 9]))))
	_S.define(_e, "a", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0.1, 0.18]), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "k"), 0.15)])), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "k")), 1.5])))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "rad"), _S.prop(_S.read(_e, "C"), 6), _S.function_value(_e, "_f5")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "a"), _S.binary("-", 1, _S.binary("*", _S.read(_e, "d"), _S.read(_e, "d"))))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	return _S.binary("*", _S.binary("**", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "L")), 2), 9)

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	return _S.binary("+", 2.6, _S.binary("*", 5.4, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("/", _S.read(_e, "x"), _S.read(_e, "L")), 1.1])))
