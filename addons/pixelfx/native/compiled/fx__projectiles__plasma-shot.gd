@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/plasma-shot.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "beat", _S.import_value("fx/projectiles/_lib.js", "beat"))
	_S.define(_e, "wake", _S.import_value("fx/projectiles/_lib.js", "wake"))
	_S.define(_e, "spark", _S.import_value("fx/projectiles/_lib.js", "spark"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Plasma shot"}, {"desc": "A glowing plasma blob: hot knots churning in its core, a corona crackling over its skin, its tail necking into droplets that tear off, cool and wink out behind."}, {"tags": ["projectile", "plasma", "energy", "sci-fi", "directional", "loop"]}, {"size": [144, 60]}, {"origin": [108, 30]}, {"duration": 0.8}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#061a1c", "#0b3b34", "#0f6a4a", "#18a05a", "#3fd46a", "#8cf57e", "#d6ffc4", "#ffffff"]}, {"size": 6}, {"speed": 200}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
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
	_S.define(_e, "R", _S.prop(_S.read(_e, "o"), "size"))
	_S.define(_e, "V", _S.prop(_S.read(_e, "o"), "speed"))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "w", _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), _S.read(_e, "D")))
	_S.define(_e, "fr", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 30), 0.000001)]))
	_S.define(_e, "left", _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 2))
	_S.define(_e, "T0", _S.binary("*", _S.unary("-", _S.read(_e, "R")), 3.2))
	_S.define(_e, "tail", _S.function_value(_e, "_f1"))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "x", _S.read(_v0, "T0"))
	while _S.truth(_S.binary(">", _S.read(_v0, "x"), _S.binary("-", _S.read(_v0, "T0"), 44))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "u", _S.binary("/", _S.binary("-", _S.read(_v1, "T0"), _S.read(_v1, "x")), 44))
		_S.define(_v1, "y", _S.call_value(_S.read(_v1, "tail"), [_S.read(_v1, "x")]))
		_S.invoke(_S.read(_v1, "p"), "dot", [_S.read(_v1, "x"), _S.read(_v1, "y"), (_S.prop(_S.read(_v1, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.2)) else (_S.prop(_S.read(_v1, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.45)) else _S.prop(_S.read(_v1, "C"), 4))), (1 if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.55)) else _S.binary("/", _S.binary("-", 1, _S.read(_v1, "u")), 0.45))])
		if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.3)):
			_S.invoke(_S.read(_v1, "p"), "px", [_S.read(_v1, "x"), _S.binary("+", _S.read(_v1, "y"), 1), (_S.prop(_S.read(_v1, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.15)) else _S.prop(_S.read(_v1, "C"), 4))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "x", 1, "-=", false)
	_S.define(_e, "balls", [_S.merge([{"x": 0}, {"y": 0}, {"r": _S.read(_e, "R")}, {"h": 1}, {"core": 0.8}])])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 3)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "a", _S.binary("+", _S.binary("*", _S.read(_v3, "w"), _S.prop([2, _S.unary("-", 3), 5], _S.read(_v3, "i"))), _S.binary("/", _S.binary("*", _S.read(_v3, "i"), _S.read(_v3, "TAU")), 3)))
		_S.define(_v3, "d", _S.binary("*", _S.read(_v3, "R"), _S.binary("+", 0.5, _S.binary("*", 0.1, _S.invoke(_S.read(_v3, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v3, "w"), 3), _S.binary("*", _S.read(_v3, "i"), 2))])))))
		_S.invoke(_S.read(_v3, "balls"), "push", [_S.merge([{"x": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "d")), 0.4)}, {"y": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "d")), 0.8)}, {"r": _S.binary("*", _S.read(_v3, "R"), 0.32)}, {"h": 1}, {"core": 1}])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 1)
	while _S.truth(_S.binary("<=", _S.read(_v4, "i"), 6)):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "x", _S.binary("*", _S.unary("-", _S.read(_v5, "R")), _S.binary("+", 0.5, _S.binary("*", _S.read(_v5, "i"), 0.42))))
		_S.define(_v5, "wag", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_v5, "w"), 2), _S.binary("*", _S.read(_v5, "i"), 0.9))]), _S.binary("+", 0.3, _S.binary("*", _S.read(_v5, "i"), 0.28))))
		_S.define(_v5, "r", _S.binary("*", _S.read(_v5, "R"), _S.binary("-", 0.62, _S.binary("*", _S.read(_v5, "i"), 0.08))))
		_S.invoke(_S.read(_v5, "balls"), "push", [_S.merge([{"x": _S.read(_v5, "x")}, {"y": _S.read(_v5, "wag")}, {"r": _S.read(_v5, "r")}, {"h": _S.binary("-", 0.96, _S.binary("*", _S.read(_v5, "i"), 0.05))}, {"core": _S.binary("/", _S.invoke(_S.read(_v5, "Math"), "sqrt", [_S.binary("*", _S.binary("-", 5.2, _S.binary("*", _S.read(_v5, "i"), 0.65)), 0.3)]), _S.read(_v5, "r"))}])])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	_S.define(_e, "drops", [])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 11, _S.read(_e, "S"), _S.function_value(_e, "_f2"), _S.function_value(_e, "_f3")])
	_S.define(_e, "all", _S.invoke(_S.read(_e, "balls"), "concat", [_S.read(_e, "drops")]))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("*", _S.unary("-", _S.read(_e, "R")), 2.6), 60), _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_e, "R")), 2), 8), _S.binary("*", _S.read(_e, "R"), 1.6), _S.binary("+", _S.binary("*", _S.read(_e, "R"), 2), 8), _S.function_value(_e, "_f4")])
	var _v10 = _S.scope(_e)
	_S.define(_v10, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "j"), 3)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "g", _S.call_value(_S.read(_v11, "rng"), [_S.read(_v11, "fr"), _S.read(_v11, "j"), _S.read(_v11, "S")]))
		_S.define(_v11, "a0", _S.invoke(_S.read(_v11, "g"), "range", [_S.unary("-", 2.3), 2.3]))
		_S.define(_v11, "span", _S.binary("*", _S.invoke(_S.read(_v11, "g"), "range", [0.45, 0.9]), _S.invoke(_S.read(_v11, "g"), "sign", [])))
		_S.define(_v11, "n", 6)
		_S.define(_v11, "hgt", _S.invoke(_S.read(_v11, "g"), "range", [1.5, 3.5]))
		_S.define(_v11, "pts", [])
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "i", 0)
		while _S.truth(_S.binary("<=", _S.read(_v12, "i"), _S.read(_v12, "n"))):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "a", _S.binary("+", _S.read(_v13, "a0"), _S.binary("/", _S.binary("*", _S.read(_v13, "span"), _S.read(_v13, "i")), _S.read(_v13, "n"))))
			_S.define(_v13, "rr", _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_v13, "R"), 0.6), _S.binary("*", _S.read(_v13, "hgt"), _S.invoke(_S.read(_v13, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_v13, "Math"), "PI"), _S.read(_v13, "i")), _S.read(_v13, "n"))]))), (_S.invoke(_S.read(_v13, "g"), "range", [_S.unary("-", 0.5), 0.5]) if _S.truth(_S.binary("%", _S.read(_v13, "i"), _S.read(_v13, "n"))) else 0)))
			_S.invoke(_S.read(_v13, "pts"), "push", [[_S.binary("-", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "rr")), 0.4), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "rr")), 0.92)]])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
		_S.invoke(_S.read(_v11, "p"), "polyline", [_S.read(_v11, "pts"), (_S.prop(_S.read(_v11, "C"), 5) if _S.truth(_S.read(_v11, "j")) else _S.prop(_S.read(_v11, "C"), 6))])
		_S.invoke(_S.read(_v11, "p"), "px", [_S.prop(_S.prop(_S.read(_v11, "pts"), 3), 0), _S.prop(_S.prop(_S.read(_v11, "pts"), 3), 1), _S.read(_v11, "WHITE")])
		_S.invoke(_S.read(_v11, "p"), "glow", [_S.prop(_S.prop(_S.read(_v11, "pts"), 3), 0), _S.prop(_S.prop(_S.read(_v11, "pts"), 3), 1), 6, _S.prop(_S.read(_v11, "C"), 5), 0.4])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "j", 1, "+=", true)
	var _v14 = _S.scope(_e)
	_S.define(_v14, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "j"), 4)):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "g", _S.call_value(_S.read(_v15, "rng"), [_S.read(_v15, "fr"), _S.binary("+", _S.read(_v15, "j"), 9), _S.read(_v15, "S")]))
		_S.define(_v15, "a", _S.invoke(_S.read(_v15, "g"), "range", [_S.unary("-", 2.2), 2.2]))
		_S.define(_v15, "l", _S.invoke(_S.read(_v15, "g"), "range", [1.5, 4]))
		_S.define(_v15, "r0", _S.binary("+", _S.read(_v15, "R"), 1))
		_S.define(_v15, "x0", _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "r0")), 0.4))
		_S.define(_v15, "y0", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "r0")), 0.92))
		_S.invoke(_S.read(_v15, "p"), "line", [_S.read(_v15, "x0"), _S.read(_v15, "y0"), _S.binary("+", _S.read(_v15, "x0"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "l"))), _S.binary("+", _S.read(_v15, "y0"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "l"))), (_S.prop(_S.read(_v15, "C"), 4) if _S.truth(_S.binary("%", _S.read(_v15, "j"), 2)) else _S.prop(_S.read(_v15, "C"), 5))])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "j", 1, "+=", true)
	_S.define(_e, "SP", [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)])
	_S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t"), _S.read(_e, "D"), 14, _S.binary("+", _S.read(_e, "S"), 5), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	_S.define(_e, "pulse", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "w"), 4)]))))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.unary("-", 2), 0, 34, _S.prop(_S.read(_e, "C"), 3), _S.binary("*", 0.8, _S.read(_e, "pulse"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, 16, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.35, _S.read(_e, "pulse"))])
	_S.invoke(_S.read(_e, "p"), "glow", [1, 0, 7, _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.3, _S.read(_e, "pulse"))])
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.unary("-", _S.read(_e, "R")), 0, _S.binary("*", _S.unary("-", _S.read(_e, "R")), 4.6), 0, 7, _S.prop(_S.read(_e, "C"), 3), 0.3])
	for _v17 in _S.array(_S.read(_e, "drops")):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "d", _v17)
		var _v19 = _S.scope(_v18)
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v19, "d"), "x"), _S.binary("+", _S.read(_v19, "left"), 4))):
			continue
		if _S.truth(_S.logical("&&", _S.binary("<", _S.prop(_S.read(_v19, "d"), "k"), 0.6), func(): return _S.binary("<", _S.prop(_S.read(_v19, "d"), "x"), _S.binary("*", _S.unary("-", _S.read(_v19, "R")), 3.5)))):
			_S.invoke(_S.read(_v19, "p"), "px", [_S.prop(_S.read(_v19, "d"), "x"), _S.prop(_S.read(_v19, "d"), "y"), (_S.prop(_S.read(_v19, "C"), 7) if _S.truth(_S.binary("<", _S.prop(_S.read(_v19, "d"), "k"), 0.3)) else _S.prop(_S.read(_v19, "C"), 6))])
		_S.invoke(_S.read(_v19, "p"), "glow", [_S.prop(_S.read(_v19, "d"), "x"), _S.prop(_S.read(_v19, "d"), "y"), _S.binary("+", 3, _S.binary("*", _S.prop(_S.read(_v19, "d"), "r"), 2)), _S.prop(_S.read(_v19, "C"), 2), _S.binary("*", 0.6, _S.binary("-", 1, _S.prop(_S.read(_v19, "d"), "k")))])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "x"), 0.2), _S.binary("*", _S.read(_e, "w"), 2))]), _S.binary("+", 0.3, _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_e, "T0"), _S.read(_e, "x")), 44), 1.8)))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.34, 0.5])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "pull", _S.invoke(_S.read(_e, "r"), "range", [450, 800]))
	_S.define(_e, "x", _S.binary("-", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_e, "R")), 2.9), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "pull")), _S.read(_e, "age")), _S.read(_e, "age"))), _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0, 16]), _S.read(_e, "age"))))
	_S.define(_e, "y", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.read(_e, "w"), 2), 5.4), _S.binary("*", _S.read(_e, "age"), 12))]), 2), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 30), 30]), _S.read(_e, "age")), _S.binary("+", 0.4, _S.read(_e, "age")))))
	_S.define(_e, "rad", _S.binary("*", _S.binary("*", _S.read(_e, "R"), _S.invoke(_S.read(_e, "r"), "range", [0.3, 0.48])), _S.binary("-", 1, _S.binary("*", _S.read(_e, "k"), 0.6))))
	_S.invoke(_S.read(_e, "drops"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"r": _S.read(_e, "rad")}, {"h": _S.binary("*", 0.97, _S.binary("-", 1, _S.binary("*", _S.read(_e, "k"), 0.75)))}, {"core": _S.binary("/", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.read(_e, "k"), 1.3))]), 7), 0.3)]), _S.read(_e, "rad"))}, {"k": _S.read(_e, "k")}])])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "f", 0)
	_S.define(_e, "heat", 0)
	_S.define(_e, "hh", 0)
	for _v6 in _S.array(_S.read(_e, "all")):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "b", _v6)
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "dx", _S.binary("-", _S.read(_v8, "x"), _S.prop(_S.read(_v8, "b"), "x")))
		_S.define(_v8, "dy", _S.binary("-", _S.read(_v8, "y"), _S.prop(_S.read(_v8, "b"), "y")))
		_S.define(_v8, "d2", _S.binary("+", _S.binary("*", _S.read(_v8, "dx"), _S.read(_v8, "dx")), _S.binary("*", _S.read(_v8, "dy"), _S.read(_v8, "dy"))))
		_S.define(_v8, "q", _S.binary("/", _S.read(_v8, "d2"), _S.binary("*", _S.binary("*", 4, _S.prop(_S.read(_v8, "b"), "r")), _S.prop(_S.read(_v8, "b"), "r"))))
		if _S.truth(_S.binary("<", _S.read(_v8, "q"), 1)):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "c", _S.binary("/", _S.binary("*", _S.binary("-", 1, _S.read(_v9, "q")), _S.binary("-", 1, _S.read(_v9, "q"))), 0.5625))
			_S.write(_v9, "f", _S.read(_v9, "c"), "+=", false)
			_S.write(_v9, "heat", _S.binary("*", _S.read(_v9, "c"), _S.prop(_S.read(_v9, "b"), "h")), "+=", false)
		if _S.truth(_S.prop(_S.read(_v8, "b"), "core")):
			_S.write(_v8, "hh", _S.binary("/", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v8, "b"), "core"), _S.prop(_S.read(_v8, "b"), "core")), _S.prop(_S.read(_v8, "b"), "r")), _S.prop(_S.read(_v8, "b"), "r")), _S.binary("+", _S.read(_v8, "d2"), 0.3)), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "f"), 1)):
		return null
	_S.define(_e, "lvl", (7 if _S.truth(_S.binary(">", _S.read(_e, "hh"), 10)) else (6 if _S.truth(_S.binary(">", _S.read(_e, "hh"), 4.6)) else (5 if _S.truth(_S.binary(">", _S.read(_e, "hh"), 2.2)) else (4 if _S.truth(_S.binary(">", _S.read(_e, "f"), 1.4)) else 3)))))
	_S.define(_e, "cap", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", 2, _S.binary("*", _S.binary("/", _S.read(_e, "heat"), _S.read(_e, "f")), 5.4))]))
	return _S.prop(_S.read(_e, "C"), _S.invoke(_S.read(_e, "Math"), "max", [2, _S.invoke(_S.read(_e, "Math"), "min", [(_S.binary("+", _S.read(_e, "lvl"), 1) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "R"), 0.3)), func(): return _S.binary("<", _S.read(_e, "lvl"), 5))) else _S.read(_e, "lvl")), _S.read(_e, "cap")])]))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.12, 0.3])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 2.4), 2.4]))
	_S.define(_e, "sp", _S.invoke(_S.read(_e, "r"), "range", [60, 130]))
	var _v16 = _S.call_value(_S.read(_e, "wake"), [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.binary("+", _S.read(_e, "R"), 1)), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.binary("+", _S.read(_e, "R"), 1)), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "sp")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "sp")), _S.read(_e, "age"), _S.binary("*", _S.read(_e, "V"), 0.7), 4, 0])
	_S.define(_e, "x", _S.prop(_v16, 0))
	_S.define(_e, "y", _S.prop(_v16, 1))
	_S.define(_e, "vx", _S.prop(_v16, 2))
	_S.define(_e, "vy", _S.prop(_v16, 3))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "x"), _S.binary("+", _S.read(_e, "left"), 4)), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "y")]), 26))):
		_S.call_value(_S.read(_e, "spark"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "vx"), _S.read(_e, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life"))), _S.read(_e, "SP"), 0.4, 0.015, 6])
	return null
