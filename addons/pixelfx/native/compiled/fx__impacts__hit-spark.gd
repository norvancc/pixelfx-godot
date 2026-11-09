@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/hit-spark.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "ray", _S.function_value(_e, "_f0"))
	_S.define(_e, "diamond", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Hit spark"}, {"desc": "The everyday hit: a sharp, lopsided cross flare with one long ray along the blow round a white diamond core, then a cone of sparks and hot chips that fall and bounce."}, {"tags": ["impact", "hit", "spark", "combat", "directional", "one-shot"]}, {"size": [136, 80]}, {"origin": [44, 64]}, {"duration": 0.5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffe26b", "#fff3a6", "#ffffff"]}, {"height": 20}, {"aim": 0.1}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "L", _S.arg(_args, 4))
	_S.define(_e, "w", _S.arg(_args, 5))
	_S.define(_e, "C", _S.arg(_args, 6))
	_S.define(_e, "from", _S.coalesce(_S.arg(_args, 7), func(): return 0))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "d", _S.binary("*", _S.read(_v0, "from"), _S.read(_v0, "L")))
	while _S.truth(_S.binary("<=", _S.read(_v0, "d"), _S.read(_v0, "L"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "u", _S.binary("/", _S.read(_v1, "d"), _S.read(_v1, "L")))
		_S.define(_v1, "hw", _S.binary("*", _S.read(_v1, "w"), _S.invoke(_S.read(_v1, "Math"), "pow", [_S.binary("-", 1, _S.read(_v1, "u")), 1.6])))
		_S.define(_v1, "col", (_S.read(_v1, "WHITE") if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.3)) else (_S.prop(_S.read(_v1, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.62)) else (_S.prop(_S.read(_v1, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.88)) else _S.prop(_S.read(_v1, "C"), 3)))))
		_S.invoke(_S.read(_v1, "p"), "px", [_S.binary("+", _S.read(_v1, "x"), _S.binary("*", _S.read(_v1, "c"), _S.read(_v1, "d"))), _S.binary("+", _S.read(_v1, "y"), _S.binary("*", _S.read(_v1, "s"), _S.read(_v1, "d"))), _S.read(_v1, "col")])
		if _S.truth(_S.binary(">", _S.read(_v1, "hw"), 0.45)):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "o", 0.5)
			while _S.truth(_S.binary("<=", _S.read(_v2, "o"), _S.read(_v2, "hw"))):
				for _v3 in _S.array([_S.unary("-", _S.read(_v2, "o")), _S.read(_v2, "o")]):
					var _v4 = _S.scope(_v2)
					_S.define(_v4, "e", _v3)
					_S.invoke(_S.read(_v4, "p"), "px", [_S.binary("-", _S.binary("+", _S.read(_v4, "x"), _S.binary("*", _S.read(_v4, "c"), _S.read(_v4, "d"))), _S.binary("*", _S.read(_v4, "s"), _S.read(_v4, "e"))), _S.binary("+", _S.binary("+", _S.read(_v4, "y"), _S.binary("*", _S.read(_v4, "s"), _S.read(_v4, "d"))), _S.binary("*", _S.read(_v4, "c"), _S.read(_v4, "e"))), (_S.prop(_S.read(_v4, "C"), 5) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v4, "u"), 0.3), func(): return _S.binary("<", _S.read(_v4, "o"), 1))) else _S.prop(_S.read(_v4, "C"), 4))])
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "o", 0.5, "+=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "d", 0.5, "+=", false)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "C", _S.arg(_args, 4))
	var _v5 = _S.scope(_e)
	_S.define(_v5, "dy", _S.binary("-", _S.unary("-", _S.read(_v5, "r")), 1))
	while _S.truth(_S.binary("<=", _S.read(_v5, "dy"), _S.binary("+", _S.read(_v5, "r"), 1))):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "dx", _S.binary("-", _S.unary("-", _S.read(_v6, "r")), 1))
		while _S.truth(_S.binary("<=", _S.read(_v6, "dx"), _S.binary("+", _S.read(_v6, "r"), 1))):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "m", _S.binary("+", _S.invoke(_S.read(_v7, "Math"), "abs", [_S.read(_v7, "dx")]), _S.invoke(_S.read(_v7, "Math"), "abs", [_S.read(_v7, "dy")])))
			if _S.truth(_S.binary("<=", _S.read(_v7, "m"), _S.read(_v7, "r"))):
				_S.invoke(_S.read(_v7, "p"), "px", [_S.binary("+", _S.read(_v7, "x"), _S.read(_v7, "dx")), _S.binary("+", _S.read(_v7, "y"), _S.read(_v7, "dy")), _S.read(_v7, "WHITE")])
			else:
				if _S.truth(_S.binary("===", _S.read(_v7, "m"), _S.binary("+", _S.read(_v7, "r"), 1))):
					_S.invoke(_S.read(_v7, "p"), "px", [_S.binary("+", _S.read(_v7, "x"), _S.read(_v7, "dx")), _S.binary("+", _S.read(_v7, "y"), _S.read(_v7, "dy")), _S.prop(_S.read(_v7, "C"), 3)])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "dx", 1, "+=", true)
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "dy", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "X", 0)
	_S.define(_e, "Y", _S.unary("-", _S.prop(_S.read(_e, "o"), "height")))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "aim"))
	_S.define(_e, "floor", _S.function_value(_e, "_f3"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "tilt", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.08), 0.08]))
	_S.define(_e, "rays", [_S.merge([{"a": _S.binary("+", _S.read(_e, "A"), _S.read(_e, "tilt"))}, {"L": _S.invoke(_S.read(_e, "R"), "range", [33, 37])}, {"w": 2.2}]), _S.merge([{"a": _S.binary("+", _S.binary("+", _S.read(_e, "A"), _S.prop(_S.read(_e, "Math"), "PI")), _S.read(_e, "tilt"))}, {"L": _S.invoke(_S.read(_e, "R"), "range", [8, 10])}, {"w": 2.2}]), _S.merge([{"a": _S.binary("+", _S.binary("-", _S.read(_e, "A"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)), _S.read(_e, "tilt"))}, {"L": _S.invoke(_S.read(_e, "R"), "range", [15, 18])}, {"w": 2.6}]), _S.merge([{"a": _S.binary("+", _S.binary("+", _S.read(_e, "A"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)), _S.read(_e, "tilt"))}, {"L": _S.invoke(_S.read(_e, "R"), "range", [10, 12])}, {"w": 2.3}]), _S.merge([{"a": _S.binary("+", _S.binary("-", _S.read(_e, "A"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 4)), _S.read(_e, "tilt"))}, {"L": _S.invoke(_S.read(_e, "R"), "range", [5, 7])}, {"w": 1}])])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.read(_e, "Y"), 38, _S.prop(_S.read(_e, "C"), 4), 0.35, 0.18])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.binary("+", _S.read(_e, "X"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "A")]), 10)), _S.binary("+", _S.read(_e, "Y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "A")]), 10)), 22, _S.prop(_S.read(_e, "C"), 5), 0.45, 0.1])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.unary("-", 2), 26, _S.prop(_S.read(_e, "C"), 3), 0.22, 0.22])
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), 9)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "a", _S.binary("-", _S.binary("+", _S.read(_v9, "A"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 0.6), 0.6])), 0.15))
		_S.define(_v9, "v", _S.invoke(_S.read(_v9, "R"), "range", [170, 360]))
		_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "SPARK"), _S.binary("+", _S.read(_v9, "X"), 1), _S.read(_v9, "Y"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "v")), 40), _S.invoke(_S.read(_v9, "R"), "range", [0.25, 0.45]), _S.read(_v9, "WHITE"), 1, (_S.invoke(_S.read(_v9, "R"), "range", [0.01, 0.03]) if _S.truth(_S.binary(">", _S.read(_v9, "i"), 6)) else 0)])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), 6)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "a", _S.binary("-", _S.binary("+", _S.read(_v11, "A"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 1.1), 0.5])), 0.3))
		_S.define(_v11, "v", _S.invoke(_S.read(_v11, "R"), "range", [70, 170]))
		_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "GRIT"), _S.binary("+", _S.read(_v11, "X"), 1), _S.read(_v11, "Y"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "v")), _S.invoke(_S.read(_v11, "R"), "range", [30, 80])), _S.invoke(_S.read(_v11, "R"), "range", [0.35, 0.45]), _S.invoke(_S.read(_v11, "R"), "pick", [[_S.prop(_S.read(_v11, "C"), 5), _S.prop(_S.read(_v11, "C"), 4), _S.prop(_S.read(_v11, "C"), 4), _S.prop(_S.read(_v11, "C"), 3)]]), 1])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.025)):
		var _v12 = _S.scope(_e)
		for _v13 in _S.array(_S.read(_v12, "rays")):
			var _v14 = _S.scope(_v12)
			_S.define(_v14, "r", _v13)
			_S.call_value(_S.read(_v14, "ray"), [_S.read(_v14, "p"), _S.read(_v14, "X"), _S.read(_v14, "Y"), _S.prop(_S.read(_v14, "r"), "a"), _S.prop(_S.read(_v14, "r"), "L"), _S.prop(_S.read(_v14, "r"), "w"), _S.read(_v14, "C")])
		_S.call_value(_S.read(_v12, "diamond"), [_S.read(_v12, "p"), _S.read(_v12, "X"), _S.read(_v12, "Y"), 4, _S.read(_v12, "C")])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.058)):
			var _v15 = _S.scope(_e)
			for _v16 in _S.array(_S.read(_v15, "rays")):
				var _v17 = _S.scope(_v15)
				_S.define(_v17, "r", _v16)
				_S.call_value(_S.read(_v17, "ray"), [_S.read(_v17, "p"), _S.read(_v17, "X"), _S.read(_v17, "Y"), _S.prop(_S.read(_v17, "r"), "a"), _S.binary("*", _S.prop(_S.read(_v17, "r"), "L"), 1.2), _S.binary("*", _S.prop(_S.read(_v17, "r"), "w"), 0.55), _S.read(_v17, "C"), 0.12])
			_S.call_value(_S.read(_v15, "diamond"), [_S.read(_v15, "p"), _S.read(_v15, "X"), _S.read(_v15, "Y"), 3, _S.read(_v15, "C")])
		else:
			if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.092)):
				var _v18 = _S.scope(_e)
				_S.define(_v18, "r", _S.prop(_S.read(_v18, "rays"), 0))
				_S.call_value(_S.read(_v18, "ray"), [_S.read(_v18, "p"), _S.read(_v18, "X"), _S.read(_v18, "Y"), _S.prop(_S.read(_v18, "r"), "a"), _S.binary("*", _S.prop(_S.read(_v18, "r"), "L"), 1.3), 0.6, [_S.prop(_S.read(_v18, "C"), 0), _S.prop(_S.read(_v18, "C"), 1), _S.prop(_S.read(_v18, "C"), 2), _S.prop(_S.read(_v18, "C"), 3), _S.prop(_S.read(_v18, "C"), 3), _S.prop(_S.read(_v18, "C"), 4)], 0.4])
	_S.define(_e, "pop", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "t")), 0.045)]))
	if _S.truth(_S.binary(">", _S.read(_e, "pop"), 0.02)):
		var _v19 = _S.scope(_e)
		_S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "X"), _S.read(_v19, "Y"), 22, _S.prop(_S.read(_v19, "C"), 4), _S.binary("*", 0.3, _S.read(_v19, "pop"))])
		_S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "X"), _S.read(_v19, "Y"), 7, _S.read(_v19, "WHITE"), _S.binary("*", 0.15, _S.read(_v19, "pop"))])
		_S.invoke(_S.read(_v19, "p"), "glowLine", [_S.read(_v19, "X"), _S.read(_v19, "Y"), _S.binary("+", _S.read(_v19, "X"), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "A")]), 26)), _S.binary("+", _S.read(_v19, "Y"), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "A")]), 26)), 4, _S.prop(_S.read(_v19, "C"), 5), _S.binary("*", 0.25, _S.read(_v19, "pop"))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
