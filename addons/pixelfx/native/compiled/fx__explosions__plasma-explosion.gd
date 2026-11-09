@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/plasma-explosion.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "bolt", _S.import_value("core/index.js", "bolt"))
	_S.define(_e, "forks", _S.import_value("core/index.js", "forks"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "cull", _S.import_value("fx/explosions/_lib.js", "cull"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "shell", _S.function_value(_e, "_f5"))
	_S.define(_e, "tilted", _S.function_value(_e, "_f6"))
	_S.define(_e, "arc", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Plasma explosion"}, {"desc": "A blue-violet energy blast with no smoke: a white flash, a ball of plasma swelling into a thinning shell, shock rings in and out of depth, lightning arcs crackling off it."}, {"tags": ["explosion", "plasma", "energy", "electric", "magic", "sci-fi", "one-shot"]}, {"size": [224, 200]}, {"origin": [112, 100]}, {"duration": 1.7}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#0a0828", "#1a1c6e", "#2c3cc0", "#4a7cf0", "#7cc0ff", "#c8ecff", "#ffffff"]}, {"accent": ["#1c0a30", "#4a1a8c", "#8a3ce0", "#c48cff", "#f0d8ff"]}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "BALL", 0.55)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "V", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "accent"), 5]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "V"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.invoke(_S.read(_e, "lights"), "add", [0, 0, 96, _S.prop(_S.read(_e, "C"), 4), 1, 0.6])
	_S.invoke(_S.read(_e, "lights"), "add", [0, 0, 40, _S.read(_e, "WHITE"), 0.9, 0.1])
	_S.invoke(_S.read(_e, "lights"), "add", [0, 0, 70, _S.prop(_S.read(_e, "V"), 2), 0.5, 1.1])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 46)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.invoke(_S.read(_v1, "R"), "range", [0, _S.read(_v1, "TAU")]))
		_S.define(_v1, "sp", _S.invoke(_S.read(_v1, "R"), "range", [140, 360]))
		_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "MOTE"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), 4), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), 4), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), _S.invoke(_S.read(_v1, "R"), "range", [0.2, 0.42]), _S.invoke(_S.read(_v1, "R"), "pick", [[_S.prop(_S.read(_v1, "C"), 6), _S.prop(_S.read(_v1, "C"), 5), _S.prop(_S.read(_v1, "C"), 4), _S.prop(_S.read(_v1, "V"), 3)]]), _S.invoke(_S.read(_v1, "R"), "range", [0.7, 1.1])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 26)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
		_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [40, 140]))
		_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "FLAKE"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), 10), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), 10), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.invoke(_S.read(_v3, "R"), "range", [0.8, 1.5]), _S.invoke(_S.read(_v3, "R"), "pick", [[_S.prop(_S.read(_v3, "C"), 5), _S.prop(_S.read(_v3, "V"), 3), _S.prop(_S.read(_v3, "V"), 4)]]), _S.invoke(_S.read(_v3, "R"), "range", [0.6, 1.6])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f1")}, {"drawBack": _S.function_value(_e, "_f2")}, {"draw": _S.function_value(_e, "_f3")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.12), func(): return _S.binary("<", _S.read(_e, "t"), 0.9)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 30, _S.read(_e, "dt"))]))):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "a", _S.invoke(_S.read(_v4, "R"), "range", [0, _S.read(_v4, "TAU")]))
		_S.define(_v4, "r", _S.call_value(_S.read(_v4, "shell"), [_S.read(_v4, "t")]))
		_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "r")), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "r")), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.invoke(_S.read(_v4, "R"), "range", [10, 40])), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.invoke(_S.read(_v4, "R"), "range", [10, 40])), _S.invoke(_S.read(_v4, "R"), "range", [0.3, 0.6]), (_S.prop(_S.read(_v4, "C"), 5) if _S.truth(_S.invoke(_S.read(_v4, "R"), "chance", [0.5])) else _S.prop(_S.read(_v4, "V"), 4)), _S.invoke(_S.read(_v4, "R"), "range", [0.5, 1.8])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 3), _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 3), _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 0), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 3), _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 1), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 3)])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "tilted"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "C"), _S.read(_e, "V"), true])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "BALL"))):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "u", _S.binary("/", _S.read(_v5, "t"), _S.read(_v5, "BALL")))
		_S.define(_v5, "r", _S.call_value(_S.read(_v5, "shell"), [_S.read(_v5, "t")]))
		_S.define(_v5, "hollow", _S.call_value(_S.read(_v5, "smooth"), [0.35, 1, _S.read(_v5, "u")]))
		_S.define(_v5, "boil", _S.invoke(_S.read(_v5, "Math"), "floor", [_S.binary("*", _S.read(_v5, "t"), 20)]))
		_S.invoke(_S.read(_v5, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_v5, "r")), 3), _S.binary("-", _S.unary("-", _S.read(_v5, "r")), 3), _S.binary("+", _S.read(_v5, "r"), 3), _S.binary("+", _S.read(_v5, "r"), 3), _S.function_value(_v5, "_f4")])
		_S.invoke(_S.read(_v5, "p"), "glow", [0, 0, _S.binary("+", _S.binary("*", _S.read(_v5, "r"), 1.6), 6), _S.prop(_S.read(_v5, "C"), 4), _S.binary("*", 0.6, _S.binary("-", 1, _S.read(_v5, "u")))])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.07)):
		_S.invoke(_S.read(_e, "p"), "circle", [0, 0, _S.binary("-", 9, _S.binary("*", _S.read(_e, "t"), 60)), _S.read(_e, "WHITE")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.25)):
		_S.call_value(_S.read(_e, "flare"), [_S.read(_e, "p"), 0, 0, _S.binary("*", 52, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.25)), 1.3])), _S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.25)), _S.read(_e, "C")])
	_S.define(_e, "u1", _S.binary("/", _S.read(_e, "t"), 0.42))
	if _S.truth(_S.binary("<", _S.read(_e, "u1"), 1)):
		var _v6 = _S.scope(_e)
		_S.invoke(_S.read(_v6, "p"), "ring", [0, 0, _S.binary("+", 8, _S.binary("*", 84, _S.invoke(_S.read(_v6, "ease"), "outCubic", [_S.read(_v6, "u1")]))), _S.invoke(_S.read(_v6, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_v6, "u1")))]), (_S.read(_v6, "WHITE") if _S.truth(_S.binary("<", _S.read(_v6, "u1"), 0.25)) else _S.prop(_S.read(_v6, "C"), 5)), _S.binary("-", 1.15, _S.read(_v6, "u1"))])
		_S.invoke(_S.read(_v6, "p"), "glowRing", [0, 0, _S.binary("+", 8, _S.binary("*", 84, _S.invoke(_S.read(_v6, "ease"), "outCubic", [_S.read(_v6, "u1")]))), 5, _S.prop(_S.read(_v6, "C"), 4), _S.binary("*", 0.35, _S.binary("-", 1, _S.read(_v6, "u1")))])
	_S.define(_e, "u2", _S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.06), 0.6))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u2"), 0), func(): return _S.binary("<", _S.read(_e, "u2"), 1))):
		_S.invoke(_S.read(_e, "p"), "ring", [0, 0, _S.binary("+", 6, _S.binary("*", 60, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "u2")]))), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 2, _S.binary("-", 1, _S.read(_e, "u2")))]), _S.prop(_S.read(_e, "V"), 3), _S.binary("-", 1.1, _S.read(_e, "u2"))])
	_S.define(_e, "left", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.15, 0.85, _S.read(_e, "t")])))
	_S.define(_e, "strike", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 18)]))
	if _S.truth(_S.binary(">", _S.read(_e, "left"), 0)):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "r", _S.call_value(_S.read(_v7, "rng"), [_S.prop(_S.read(_v7, "o"), "seed"), _S.read(_v7, "strike"), 17]))
		_S.define(_v7, "n", _S.binary("+", 2, _S.invoke(_S.read(_v7, "Math"), "round", [_S.binary("*", 4, _S.read(_v7, "left"))])))
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), _S.read(_v8, "n"))):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "a", _S.invoke(_S.read(_v9, "r"), "range", [0, _S.read(_v9, "TAU")]))
			_S.define(_v9, "L", _S.binary("*", _S.invoke(_S.read(_v9, "r"), "range", [26, 58]), _S.binary("+", 0.45, _S.binary("*", 0.55, _S.read(_v9, "left")))))
			_S.define(_v9, "path", _S.call_value(_S.read(_v9, "bolt"), [_S.read(_v9, "r"), 0, 0, _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "L")), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "L")), _S.merge([{"jag": 0.28}, {"depth": 4}])]))
			_S.call_value(_S.read(_v9, "arc"), [_S.read(_v9, "p"), _S.read(_v9, "path"), _S.read(_v9, "C"), _S.read(_v9, "V"), _S.binary("*", 0.8, _S.read(_v9, "left"))])
			if _S.truth(_S.invoke(_S.read(_v9, "r"), "chance", [0.5])):
				for _v10 in _S.array(_S.call_value(_S.read(_v9, "forks"), [_S.read(_v9, "r"), _S.read(_v9, "path"), _S.merge([{"count": 1}, {"len": 14}, {"jag": 0.35}])])):
					var _v11 = _S.scope(_v9)
					_S.define(_v11, "f", _v10)
					_S.call_value(_S.read(_v11, "arc"), [_S.read(_v11, "p"), _S.read(_v11, "f"), _S.read(_v11, "C"), _S.read(_v11, "V"), _S.binary("*", 0.5, _S.read(_v11, "left"))])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
		_S.define(_v7, "rs", _S.call_value(_S.read(_v7, "shell"), [_S.read(_v7, "t")]))
		var _v12 = _S.scope(_v7)
		_S.define(_v12, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), 3)):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "a", _S.invoke(_S.read(_v13, "r"), "range", [0, _S.read(_v13, "TAU")]))
			_S.define(_v13, "b", _S.binary("+", _S.read(_v13, "a"), _S.invoke(_S.read(_v13, "r"), "range", [0.3, 0.6])))
			_S.call_value(_S.read(_v13, "arc"), [_S.read(_v13, "p"), _S.call_value(_S.read(_v13, "bolt"), [_S.read(_v13, "r"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "rs")), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "rs")), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "b")]), _S.read(_v13, "rs")), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "b")]), _S.read(_v13, "rs")), _S.merge([{"jag": 0.4}, {"depth": 3}])]), _S.read(_v13, "C"), _S.read(_v13, "V"), _S.binary("*", 0.6, _S.read(_v13, "left"))])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "tilted"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "C"), _S.read(_e, "V"), false])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y")]))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "y"), _S.read(_e, "x")]))
	_S.define(_e, "edge", _S.binary("*", _S.read(_e, "r"), _S.binary("+", 1, _S.binary("*", 0.1, _S.call_value(_S.read(_e, "noise"), [_S.binary("+", _S.binary("*", _S.read(_e, "a"), 3), _S.binary("*", _S.read(_e, "boil"), 0.7)), 3])))))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "edge"))):
		return null
	_S.define(_e, "v", _S.binary("/", _S.read(_e, "d"), _S.read(_e, "edge")))
	if _S.truth(_S.binary("<", _S.read(_e, "v"), _S.binary("*", _S.read(_e, "hollow"), 0.92))):
		return null
	_S.define(_e, "n", _S.call_value(_S.read(_e, "noise"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "a"), 4), _S.binary("*", _S.read(_e, "d"), 0.25)), _S.binary("*", _S.read(_e, "boil"), 0.5)), 5]))
	_S.define(_e, "w", _S.binary("+", _S.read(_e, "v"), _S.binary("*", _S.read(_e, "n"), 0.14)))
	_S.define(_e, "fil", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("+", _S.binary("*", _S.read(_e, "a"), 5), _S.binary("*", _S.read(_e, "d"), 0.32)), _S.binary("*", _S.read(_e, "t"), 14)), _S.binary("*", _S.read(_e, "n"), 2.5))])]), 0.1))
	_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", 0.25, _S.binary("-", 1, _S.read(_e, "u"))), "=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.9)):
		return _S.prop(_S.read(_e, "V"), 2)
	if _S.truth(_S.logical("&&", _S.read(_e, "fil"), func(): return _S.binary(">", _S.read(_e, "v"), 0.3))):
		return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else _S.prop(_S.read(_e, "C"), 5))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "w"), _S.binary("-", 0.32, _S.binary("*", _S.read(_e, "u"), 0.25)))) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "w"), 0.52)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "w"), 0.72)) else ((_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else _S.prop(_S.read(_e, "V"), 3)) if _S.truth(_S.binary("<", _S.read(_e, "w"), 0.86)) else _S.prop(_S.read(_e, "V"), 2)))))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", 5, _S.binary("*", 30, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "BALL"))])])))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "V", _S.arg(_args, 3))
	_S.define(_e, "back", _S.arg(_args, 4))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.03), 0.5))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "u"), 0), func(): return _S.binary(">=", _S.read(_e, "u"), 1))):
		return null
	_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 4, _S.binary("+", 12, _S.binary("*", 86, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "u")]))), 0.28, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 4, _S.binary("-", 1, _S.read(_e, "u")))]), _S.binary("-", 1.15, _S.read(_e, "u")), [_S.prop(_S.read(_e, "V"), 1), _S.prop(_S.read(_e, "V"), 2), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5)], _S.function_value(_e, "_f7"), _S.binary("<", _S.read(_e, "u"), 0.15)])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("===", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "back"))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "path", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "V", _S.arg(_args, 3))
	_S.define(_e, "k", _S.arg(_args, 4))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0.05)):
		return null
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 1)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), _S.prop(_S.read(_v14, "path"), "length"))):
		var _v15 = _S.scope(_v14)
		var _v16 = _S.prop(_S.read(_v15, "path"), _S.binary("-", _S.read(_v15, "i"), 1))
		_S.define(_v15, "ax", _S.prop(_v16, 0))
		_S.define(_v15, "ay", _S.prop(_v16, 1))
		var _v17 = _S.prop(_S.read(_v15, "path"), _S.read(_v15, "i"))
		_S.define(_v15, "bx", _S.prop(_v17, 0))
		_S.define(_v15, "by", _S.prop(_v17, 1))
		_S.invoke(_S.read(_v15, "p"), "glowLine", [_S.read(_v15, "ax"), _S.read(_v15, "ay"), _S.read(_v15, "bx"), _S.read(_v15, "by"), 5, _S.prop(_S.read(_v15, "V"), 2), _S.binary("*", 0.18, _S.read(_v15, "k"))])
		_S.invoke(_S.read(_v15, "p"), "line", [_S.binary("+", _S.read(_v15, "ax"), 1), _S.read(_v15, "ay"), _S.binary("+", _S.read(_v15, "bx"), 1), _S.read(_v15, "by"), _S.prop(_S.read(_v15, "C"), 4), _S.binary("*", _S.read(_v15, "k"), 0.8)])
		_S.invoke(_S.read(_v15, "p"), "line", [_S.read(_v15, "ax"), _S.read(_v15, "ay"), _S.read(_v15, "bx"), _S.read(_v15, "by"), (_S.read(_v15, "WHITE") if _S.truth(_S.binary("<", _S.read(_v15, "i"), _S.binary("*", _S.prop(_S.read(_v15, "path"), "length"), 0.6))) else _S.prop(_S.read(_v15, "C"), 5)), _S.invoke(_S.read(_v15, "Math"), "min", [1, _S.binary("*", _S.read(_v15, "k"), 1.4)])])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	return null
