@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/laser-bolt.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "beat", _S.import_value("fx/projectiles/_lib.js", "beat"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Laser bolt"}, {"desc": "A red laser bolt: a white-hot core in a rounded head, red bands tapering back, pulses racing down it, a tail that shimmers apart into wavering dashes."}, {"tags": ["projectile", "laser", "energy", "sci-fi", "directional", "loop"]}, {"size": [128, 32]}, {"origin": [108, 16]}, {"duration": 0.5}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#2a0610", "#5c0d1c", "#9a1428", "#d8243a", "#ff4d5e", "#ff8a94", "#ffd0d4", "#ffffff"]}, {"length": 40}, {"seed": 2}])}]))
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
	_S.define(_e, "L", _S.prop(_S.read(_e, "o"), "length"))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "fr", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 30), 0.000001)]))
	_S.define(_e, "left", _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 2))
	_S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t"), _S.read(_e, "D"), 14, _S.read(_e, "S"), _S.function_value(_e, "_f1"), _S.function_value(_e, "_f2")])
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "L")), 1), _S.unary("-", 5), 4, 6, _S.function_value(_e, "_f3")])
	for _v0 in _S.array([0, _S.prop(_S.read(_e, "Math"), "PI")]):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		var _v2 = _S.scope(_v1)
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "d", 2)
		while _S.truth(_S.binary("<", _S.read(_v3, "d"), _S.binary("*", _S.read(_v3, "L"), 0.7))):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "a", _S.binary("+", _S.binary("-", _S.binary("*", _S.read(_v4, "d"), 0.45), _S.binary("*", _S.binary("*", _S.read(_v4, "ph"), _S.read(_v4, "TAU")), 3)), _S.read(_v4, "s")))
			_S.define(_v4, "y", _S.binary("+", 0.5, _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.binary("+", _S.binary("*", 2.2, _S.binary("-", 1, _S.binary("/", _S.read(_v4, "d"), _S.read(_v4, "L")))), 0.6))))
			if _S.truth(_S.binary(">", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), 0.3)):
				_S.invoke(_S.read(_v4, "p"), "dot", [_S.unary("-", _S.read(_v4, "d")), _S.read(_v4, "y"), (_S.read(_v4, "WHITE") if _S.truth(_S.binary(">", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), 0.8)) else _S.prop(_S.read(_v4, "C"), 6))])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "d", 1, "+=", false)
	_S.define(_e, "g", _S.binary("+", 0.75, _S.binary("*", 0.25, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2)]))))
	_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 1, 0.5, _S.binary("+", 3, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "g"), 2)])), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 4), 0.5])
	_S.invoke(_S.read(_e, "p"), "glowLine", [1, 0.5, _S.unary("-", _S.read(_e, "L")), 0.5, 9, _S.prop(_S.read(_e, "C"), 3), 0.4])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.unary("-", 2), 0.5, 20, _S.prop(_S.read(_e, "C"), 3), _S.binary("*", 0.5, _S.read(_e, "g"))])
	_S.invoke(_S.read(_e, "p"), "glow", [1, 0.5, 6, _S.read(_e, "WHITE"), 0.25])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.18, 0.3])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "x0", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_e, "L")), 0.8), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [150, 230]))))
	_S.define(_e, "len", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [3, 7]), _S.binary("-", 1, _S.binary("*", _S.read(_e, "k"), 0.5))))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", 0.5, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "x0"), 0.25), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2))]), _S.binary("+", 0.5, _S.binary("*", _S.read(_e, "k"), 1.5)))), _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.6), 0.6]), _S.read(_e, "k"))))
	if _S.truth(_S.logical("||", _S.binary("<", _S.binary("-", _S.read(_e, "x0"), _S.read(_e, "len")), _S.read(_e, "left")), func(): return _S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "fr"), _S.invoke(_S.read(_e, "r"), "int", [0, 999])]), _S.binary("*", _S.read(_e, "k"), 0.5)))):
		return null
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x0"), _S.read(_e, "y"), _S.binary("-", _S.read(_e, "x0"), _S.read(_e, "len")), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.3)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.6)) else _S.prop(_S.read(_e, "C"), 3)))])
	if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.4)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("-", _S.read(_e, "x0"), _S.binary("/", _S.read(_e, "len"), 2)), _S.read(_e, "y"), 4, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.3, _S.binary("-", 1, _S.read(_e, "k")))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "d", _S.binary("+", _S.unary("-", _S.read(_e, "x")), 3))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "L"), 3)))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary(">", _S.read(_e, "u"), 1))):
		return null
	_S.define(_e, "head", (_S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("**", _S.binary("/", _S.binary("-", 3, _S.read(_e, "d")), 3), 2))])]) if _S.truth(_S.binary("<", _S.read(_e, "d"), 3)) else 1))
	_S.define(_e, "w", _S.binary("*", _S.binary("*", _S.binary("+", _S.binary("*", 3.4, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "u")), 0.9])), 0.5), _S.read(_e, "head")), _S.binary("+", 1, _S.binary("*", 0.08, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_e, "d"), 0.9), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 4))])))))
	_S.define(_e, "v", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "y"), 0.5)]), _S.read(_e, "w")))
	if _S.truth(_S.binary(">", _S.read(_e, "v"), 1.2)):
		return null
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "v"), 1), func(): return _S.logical("||", _S.binary(">", _S.read(_e, "u"), 0.5), func(): return _S.binary(">", _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), _S.read(_e, "fr")]), 0.6)))):
		return null
	_S.define(_e, "pulse", (1 if _S.truth(_S.binary("<", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("*", _S.read(_e, "d"), 0.05), _S.binary("*", _S.read(_e, "ph"), 3)), 1), 1), 1), 0.12)) else 0))
	_S.define(_e, "lvl", ((7 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.6)) else 6) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.22)) else (_S.binary("-", 6, (1 if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.5)) else 0)) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.45)) else (4 if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.72)) else (3 if _S.truth(_S.binary("<=", _S.read(_e, "v"), 1)) else 2)))))
	return _S.prop(_S.read(_e, "C"), _S.invoke(_S.read(_e, "Math"), "min", [7, _S.binary("+", _S.read(_e, "lvl"), (_S.read(_e, "pulse") if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.72)) else 0))]))
