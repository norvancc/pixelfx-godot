@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/toxic-puddle.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "surf", _S.function_value(_e, "_f0"))
	_S.define(_e, "pool", _S.function_value(_e, "_f1"))
	_S.define(_e, "bubbles", _S.function_value(_e, "_f2"))
	_S.define(_e, "ribbon", _S.function_value(_e, "_f5"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f6"))
	_S.define(_e, "draw", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Toxic puddle"}, {"desc": "Black tar lit from inside by chartreuse veins and a glowing rim, an oily sheen drifting on it; glossy bubbles dome, stretch and pop, vapour curls up in fraying ribbons."}, {"tags": ["nature", "poison", "toxic", "sludge", "tar", "puddle", "hazard", "ground", "loop"]}, {"size": [176, 100]}, {"origin": [88, 86]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#06070a", "#0c100c", "#141a10", "#1e2814", "#2e3c18", "#5a7a1c", "#a6d42a", "#ecff86"]}, {"sheen": ["#2a1648", "#5a2e8e", "#1e7a86", "#6adccc"]}, {"width": 42}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "W", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.read(_e, "W"))]))
	_S.define(_e, "ph", _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), _S.read(_e, "D")))
	_S.define(_e, "lens", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_e, "d"), _S.read(_e, "d")))]), 6.6), (_S.binary("*", 1.6, _S.call_value(_S.read(_e, "smooth"), [0.8, 0.9, _S.read(_e, "d")])) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.8)) else 0)))
	_S.define(_e, "swell", _S.binary("+", _S.binary("*", _S.binary("**", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_e, "x"), 0.09), _S.read(_e, "ph"))])]), 6), 1.2), _S.binary("*", _S.binary("**", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "x"), 0.06), _S.binary("*", _S.read(_e, "ph"), 2)), 1)])]), 8), 0.9)))
	return _S.unary("-", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.read(_e, "lens"), _S.binary("*", _S.read(_e, "swell"), _S.binary("-", 1, _S.read(_e, "d"))))]))

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "Sh", _S.arg(_args, 2))
	_S.define(_e, "W", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "seed", _S.arg(_args, 5))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "x", _S.invoke(_S.read(_v0, "Math"), "floor", [_S.binary("-", _S.unary("-", _S.read(_v0, "W")), 1)]))
	while _S.truth(_S.binary("<=", _S.read(_v0, "x"), _S.invoke(_S.read(_v0, "Math"), "ceil", [_S.binary("+", _S.read(_v0, "W"), 1)]))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "d", _S.binary("/", _S.invoke(_S.read(_v1, "Math"), "abs", [_S.binary("+", _S.read(_v1, "x"), 0.5)]), _S.read(_v1, "W")))
		if _S.truth(_S.binary(">", _S.read(_v1, "d"), 1.03)):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "x", 1, "+=", true)
			continue
		_S.define(_v1, "top", _S.call_value(_S.read(_v1, "surf"), [_S.binary("+", _S.read(_v1, "x"), 0.5), _S.read(_v1, "W"), _S.read(_v1, "t")]))
		_S.define(_v1, "oil", _S.binary("+", _S.binary("*", 0.6, _S.call_value(_S.read(_v1, "tileNoise"), [_S.binary("*", _S.read(_v1, "x"), 0.08), _S.binary("*", _S.read(_v1, "ph"), 4), 0, 4, _S.read(_v1, "seed")])), _S.binary("*", 0.6, _S.call_value(_S.read(_v1, "tileNoise"), [_S.binary("-", _S.binary("*", _S.read(_v1, "x"), 0.11), _S.binary("*", _S.read(_v1, "ph"), 4)), 1, 4, 0, _S.binary("+", _S.read(_v1, "seed"), 1)]))))
		_S.define(_v1, "hue", _S.call_value(_S.read(_v1, "tileNoise"), [_S.binary("*", _S.read(_v1, "x"), 0.05), _S.binary("+", _S.binary("*", _S.read(_v1, "ph"), 2), 7), 0, 2, _S.binary("+", _S.read(_v1, "seed"), 3)]))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "y", _S.read(_v2, "top"))
		while _S.truth(_S.binary("<=", _S.read(_v2, "y"), 2)):
			var _v3 = _S.scope(_v2)
			if _S.truth(_S.logical("||", _S.logical("&&", _S.binary("===", _S.read(_v3, "y"), 2), func(): return _S.binary(">", _S.read(_v3, "d"), 0.75)), func(): return _S.logical("&&", _S.binary("===", _S.read(_v3, "y"), 1), func(): return _S.binary(">", _S.read(_v3, "d"), 0.9)))):
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "y", 1, "+=", true)
				continue
			_S.define(_v3, "c", null)
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v3, "d"), 0.93), func(): return _S.binary("<=", _S.read(_v3, "y"), 0))):
				_S.write(_v3, "c", (_S.prop(_S.read(_v3, "C"), 7) if _S.truth(_S.binary("===", _S.read(_v3, "y"), _S.read(_v3, "top"))) else _S.prop(_S.read(_v3, "C"), 6)), "=", false)
			else:
				if _S.truth(_S.binary("===", _S.read(_v3, "y"), _S.read(_v3, "top"))):
					var _v4 = _S.scope(_v3)
					_S.define(_v4, "glint", _S.logical("||", _S.binary("<", _S.invoke(_S.read(_v4, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("*", _S.read(_v4, "x"), 0.07), _S.binary("*", _S.read(_v4, "ph"), 3)), 1), 1), 1), 0.5)]), 0.012), func(): return _S.binary("<", _S.call_value(_S.read(_v4, "rand"), [_S.read(_v4, "x"), _S.invoke(_S.read(_v4, "Math"), "floor", [_S.binary("*", _S.read(_v4, "t"), 10)])]), 0.015)))
					_S.write(_v4, "c", (_S.read(_v4, "WHITE") if _S.truth(_S.read(_v4, "glint")) else ((_S.prop(_S.read(_v4, "Sh"), 3) if _S.truth(_S.binary(">", _S.read(_v4, "hue"), 0)) else _S.prop(_S.read(_v4, "Sh"), 2)) if _S.truth(_S.binary(">", _S.read(_v4, "oil"), 0.55)) else ((_S.prop(_S.read(_v4, "Sh"), 1) if _S.truth(_S.binary(">", _S.read(_v4, "hue"), 0)) else _S.prop(_S.read(_v4, "C"), 5)) if _S.truth(_S.binary(">", _S.read(_v4, "oil"), 0.15)) else _S.prop(_S.read(_v4, "C"), 5)))), "=", false)
					if _S.truth(_S.read(_v4, "glint")):
						_S.invoke(_S.read(_v4, "p"), "light", [_S.read(_v4, "x"), _S.read(_v4, "y"), _S.prop(_S.read(_v4, "C"), 7), 0.5])
				else:
					if _S.truth(_S.binary("===", _S.read(_v3, "y"), _S.binary("+", _S.read(_v3, "top"), 1))):
						_S.write(_v3, "c", (_S.prop(_S.read(_v3, "Sh"), 0) if _S.truth(_S.binary(">", _S.read(_v3, "oil"), 0.4)) else _S.prop(_S.read(_v3, "C"), 3)), "=", false)
					else:
						if _S.truth(_S.binary(">=", _S.read(_v3, "y"), 1)):
							_S.write(_v3, "c", _S.prop(_S.read(_v3, "C"), 0), "=", false)
						else:
							var _v5 = _S.scope(_v3)
							_S.define(_v5, "pulse", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v5, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.read(_v5, "TAU"), _S.read(_v5, "t")), _S.read(_v5, "D")), _S.binary("*", _S.read(_v5, "x"), 0.03))]))))
							_S.define(_v5, "v", _S.invoke(_S.read(_v5, "Math"), "abs", [_S.binary("+", _S.call_value(_S.read(_v5, "tileNoise"), [_S.binary("*", _S.read(_v5, "x"), 0.09), _S.binary("+", _S.binary("*", _S.read(_v5, "y"), 0.75), _S.binary("*", _S.read(_v5, "ph"), 4)), 0, 4, _S.binary("+", _S.read(_v5, "seed"), 7)]), _S.binary("*", 0.2, _S.invoke(_S.read(_v5, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v5, "TAU"), _S.read(_v5, "t")), 2), _S.read(_v5, "D")), _S.binary("*", _S.read(_v5, "x"), 0.15))])))]))
							_S.define(_v5, "w", _S.binary("+", 0.6, _S.binary("*", 0.6, _S.read(_v5, "pulse"))))
							_S.write(_v5, "c", (_S.prop(_S.read(_v5, "C"), 7) if _S.truth(_S.binary("<", _S.read(_v5, "v"), _S.binary("*", 0.035, _S.read(_v5, "w")))) else (_S.prop(_S.read(_v5, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v5, "v"), _S.binary("*", 0.08, _S.read(_v5, "w")))) else (_S.prop(_S.read(_v5, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v5, "v"), _S.binary("*", 0.14, _S.read(_v5, "w")))) else _S.prop(_S.read(_v5, "C"), 1)))), "=", false)
							if _S.truth(_S.binary("<", _S.read(_v5, "v"), _S.binary("*", 0.08, _S.read(_v5, "w")))):
								_S.invoke(_S.read(_v5, "p"), "light", [_S.read(_v5, "x"), _S.read(_v5, "y"), _S.prop(_S.read(_v5, "C"), 6), _S.binary("+", 0.25, _S.binary("*", 0.3, _S.read(_v5, "pulse")))])
			_S.invoke(_S.read(_v3, "p"), "px", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.read(_v3, "c")])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "y", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v1, "d"), 0.9), func(): return _S.binary("<=", _S.read(_v1, "d"), 1.03))):
			_S.invoke(_S.read(_v1, "p"), "px", [_S.read(_v1, "x"), _S.binary("-", _S.read(_v1, "top"), 1), _S.prop(_S.read(_v1, "C"), 1)])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "x", 1, "+=", true)
	for _v6 in _S.array([_S.unary("-", 1), 1]):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "s", _v6)
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "k", 1)
		while _S.truth(_S.binary("<=", _S.read(_v8, "k"), 6)):
			_S.invoke(_S.read(_v8, "p"), "dot", [_S.binary("*", _S.read(_v8, "s"), _S.binary("+", _S.read(_v8, "W"), _S.read(_v8, "k"))), 0, (_S.prop(_S.read(_v8, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v8, "k"), 3)) else _S.prop(_S.read(_v8, "C"), 5)), _S.binary("-", 1, _S.binary("/", _S.read(_v8, "k"), 7))])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "k", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "Sh", _S.arg(_args, 2))
	_S.define(_e, "W", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "seed", _S.arg(_args, 5))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 8, _S.read(_e, "seed"), _S.function_value(_e, "_f3"), _S.function_value(_e, "_f4")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [2.4, 3.2])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "swell", _S.invoke(_S.read(_e, "R"), "range", [1, 1.6]))
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.7), 0.7]), _S.read(_e, "W")))
	_S.define(_e, "rmax", _S.invoke(_S.read(_e, "R"), "range", [4.5, 8]))
	_S.define(_e, "sy", _S.binary("+", _S.call_value(_S.read(_e, "surf"), [_S.read(_e, "x"), _S.read(_e, "W"), _S.read(_e, "t")]), 0.5))
	if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.read(_e, "swell"))):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "k", _S.binary("/", _S.read(_v9, "age"), _S.read(_v9, "swell")))
		_S.define(_v9, "st", _S.call_value(_S.read(_v9, "smooth"), [0.65, 1, _S.read(_v9, "k")]))
		_S.define(_v9, "gr", _S.invoke(_S.read(_v9, "ease"), "outCubic", [_S.invoke(_S.read(_v9, "Math"), "min", [1, _S.binary("*", _S.read(_v9, "k"), 1.3)])]))
		_S.define(_v9, "rx", _S.binary("*", _S.binary("*", _S.read(_v9, "rmax"), _S.read(_v9, "gr")), _S.binary("-", 1, _S.binary("*", 0.18, _S.read(_v9, "st")))))
		_S.define(_v9, "ry", _S.binary("*", _S.binary("*", _S.read(_v9, "rmax"), _S.read(_v9, "gr")), _S.binary("+", 1, _S.binary("*", 0.5, _S.read(_v9, "st")))))
		_S.define(_v9, "X", _S.invoke(_S.read(_v9, "Math"), "round", [_S.read(_v9, "x")]))
		_S.define(_v9, "Y", _S.invoke(_S.read(_v9, "Math"), "round", [_S.read(_v9, "sy")]))
		_S.define(_v9, "inner", _S.binary("+", 0.35, _S.binary("*", 0.65, _S.read(_v9, "k"))))
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "j", _S.binary("-", _S.unary("-", _S.invoke(_S.read(_v10, "Math"), "ceil", [_S.read(_v10, "ry")])), 1))
		while _S.truth(_S.binary("<=", _S.read(_v10, "j"), 0)):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "i", _S.binary("-", _S.unary("-", _S.invoke(_S.read(_v11, "Math"), "ceil", [_S.read(_v11, "rx")])), 1))
			while _S.truth(_S.binary("<=", _S.read(_v11, "i"), _S.binary("+", _S.invoke(_S.read(_v11, "Math"), "ceil", [_S.read(_v11, "rx")]), 1))):
				var _v12 = _S.scope(_v11)
				_S.define(_v12, "dd", _S.invoke(_S.read(_v12, "Math"), "hypot", [_S.binary("/", _S.read(_v12, "i"), _S.invoke(_S.read(_v12, "Math"), "max", [0.6, _S.read(_v12, "rx")])), _S.binary("/", _S.read(_v12, "j"), _S.invoke(_S.read(_v12, "Math"), "max", [0.6, _S.read(_v12, "ry")]))]))
				if _S.truth(_S.binary(">", _S.read(_v12, "dd"), 1.1)):
					_v11 = _S.iteration(_v11)
					_S.write(_v11, "i", 1, "+=", true)
					continue
				_S.define(_v12, "c", null)
				if _S.truth(_S.binary(">", _S.read(_v12, "dd"), 0.9)):
					_S.write(_v12, "c", _S.prop(_S.read(_v12, "C"), 0), "=", false)
				else:
					if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v12, "dd"), _S.binary("*", 0.55, _S.read(_v12, "inner"))), func(): return _S.binary(">", _S.read(_v12, "j"), _S.binary("*", _S.unary("-", _S.read(_v12, "ry")), 0.75)))):
						_S.write(_v12, "c", (_S.prop(_S.read(_v12, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v12, "dd"), _S.binary("*", 0.3, _S.read(_v12, "inner")))) else _S.prop(_S.read(_v12, "C"), 5)), "=", false)
					else:
						if _S.truth(_S.binary("<", _S.read(_v12, "dd"), _S.binary("*", 0.8, _S.read(_v12, "inner")))):
							_S.write(_v12, "c", _S.prop(_S.read(_v12, "C"), 4), "=", false)
						else:
							_S.write(_v12, "c", (_S.prop(_S.read(_v12, "C"), 2) if _S.truth(_S.binary("<", _S.read(_v12, "j"), _S.binary("*", _S.unary("-", _S.read(_v12, "ry")), 0.5))) else _S.prop(_S.read(_v12, "C"), 3)), "=", false)
				_S.invoke(_S.read(_v12, "p"), "px", [_S.binary("+", _S.read(_v12, "X"), _S.read(_v12, "i")), _S.binary("+", _S.read(_v12, "Y"), _S.read(_v12, "j")), _S.read(_v12, "c")])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "i", 1, "+=", true)
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "j", 1, "+=", true)
		if _S.truth(_S.binary(">", _S.read(_v9, "rx"), 1.8)):
			var _v13 = _S.scope(_v9)
			_S.define(_v13, "a", 3.5)
			while _S.truth(_S.binary("<", _S.read(_v13, "a"), 4.7)):
				_S.invoke(_S.read(_v13, "p"), "px", [_S.binary("+", _S.read(_v13, "X"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "rx")), 0.68)), _S.binary("+", _S.read(_v13, "Y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "ry")), 0.68)), (_S.prop(_S.read(_v13, "Sh"), 3) if _S.truth(_S.binary("<", _S.read(_v13, "a"), 3.9)) else (_S.prop(_S.read(_v13, "C"), 7) if _S.truth(_S.binary("<", _S.read(_v13, "a"), 4.3)) else _S.prop(_S.read(_v13, "Sh"), 1)))])
				_v13 = _S.iteration(_v13)
				_S.write(_v13, "a", 0.16, "+=", false)
		if _S.truth(_S.binary(">", _S.read(_v9, "rx"), 1.2)):
			_S.last([_S.invoke(_S.read(_v9, "p"), "px", [_S.binary("-", _S.read(_v9, "X"), _S.invoke(_S.read(_v9, "Math"), "round", [_S.binary("*", _S.read(_v9, "rx"), 0.35)])), _S.binary("-", _S.read(_v9, "Y"), _S.invoke(_S.read(_v9, "Math"), "round", [_S.binary("*", _S.read(_v9, "ry"), 0.62)])), _S.read(_v9, "WHITE")]), _S.invoke(_S.read(_v9, "p"), "px", [_S.binary("+", _S.binary("-", _S.read(_v9, "X"), _S.invoke(_S.read(_v9, "Math"), "round", [_S.binary("*", _S.read(_v9, "rx"), 0.35)])), 1), _S.binary("-", _S.read(_v9, "Y"), _S.invoke(_S.read(_v9, "Math"), "round", [_S.binary("*", _S.read(_v9, "ry"), 0.62)])), _S.prop(_S.read(_v9, "C"), 7)])])
		_S.invoke(_S.read(_v9, "p"), "glow", [_S.read(_v9, "x"), _S.binary("-", _S.read(_v9, "sy"), _S.binary("*", _S.read(_v9, "ry"), 0.5)), _S.binary("+", 7, _S.binary("*", _S.read(_v9, "rx"), 1.4)), _S.prop(_S.read(_v9, "C"), 6), _S.binary("*", _S.binary("+", 0.2, _S.binary("*", 0.35, _S.read(_v9, "st"))), _S.read(_v9, "gr"))])
		return null
	_S.define(_e, "e", _S.binary("-", _S.read(_e, "age"), _S.read(_e, "swell")))
	if _S.truth(_S.binary("<", _S.read(_e, "e"), 0.3)):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "k", _S.binary("/", _S.read(_v14, "e"), 0.3))
		_S.define(_v14, "rr", _S.binary("+", 2, _S.binary("*", 14, _S.invoke(_S.read(_v14, "ease"), "outCubic", [_S.read(_v14, "k")]))))
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "a", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "a"), _S.read(_v15, "TAU"))):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "rx2", _S.binary("+", _S.read(_v16, "x"), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.read(_v16, "rr"))))
			_S.define(_v16, "ry2", _S.binary("+", _S.read(_v16, "sy"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.read(_v16, "rr")), 0.22)))
			if _S.truth(_S.binary("<", _S.invoke(_S.read(_v16, "Math"), "abs", [_S.read(_v16, "rx2")]), _S.binary("*", _S.read(_v16, "W"), 0.95))):
				_S.invoke(_S.read(_v16, "p"), "dot", [_S.read(_v16, "rx2"), _S.read(_v16, "ry2"), (_S.read(_v16, "WHITE") if _S.truth(_S.binary("<", _S.read(_v16, "k"), 0.4)) else (_S.prop(_S.read(_v16, "C"), 7) if _S.truth(_S.binary("<", _S.read(_v16, "k"), 0.7)) else _S.prop(_S.read(_v16, "C"), 6))), _S.binary("*", _S.binary("-", 1, _S.read(_v16, "k")), 1.4)])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "a", _S.binary("/", 0.5, _S.read(_v15, "rr")), "+=", false)
		_S.invoke(_S.read(_v14, "p"), "glowRing", [_S.read(_v14, "x"), _S.read(_v14, "sy"), _S.read(_v14, "rr"), 3, _S.prop(_S.read(_v14, "C"), 6), _S.binary("*", 0.35, _S.binary("-", 1, _S.read(_v14, "k")))])
		if _S.truth(_S.binary("<", _S.read(_v14, "e"), 0.1)):
			_S.invoke(_S.read(_v14, "p"), "glow", [_S.read(_v14, "x"), _S.binary("-", _S.read(_v14, "sy"), 2), 18, _S.prop(_S.read(_v14, "C"), 6), _S.binary("*", 0.7, _S.binary("-", 1, _S.binary("/", _S.read(_v14, "e"), 0.1)))])
	var _v17 = _S.scope(_e)
	_S.define(_v17, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v17, "j"), 7)):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "vx", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v18, "rand"), [_S.read(_v18, "j"), _S.read(_v18, "seed"), _S.invoke(_S.read(_v18, "Math"), "round", [_S.binary("*", _S.read(_v18, "x"), 10)])]), 0.5), 80))
		_S.define(_v18, "vy", _S.binary("-", _S.unary("-", 45), _S.binary("*", _S.call_value(_S.read(_v18, "rand"), [_S.read(_v18, "j"), _S.binary("+", _S.read(_v18, "seed"), 3), _S.invoke(_S.read(_v18, "Math"), "round", [_S.binary("*", _S.read(_v18, "x"), 10)])]), 70)))
		var _v19 = _S.call_value(_S.read(_v18, "fly"), [_S.read(_v18, "x"), _S.binary("-", _S.read(_v18, "sy"), 2), _S.read(_v18, "vx"), _S.read(_v18, "vy"), _S.read(_v18, "e"), 420])
		_S.define(_v18, "dx", _S.prop(_v19, 0))
		_S.define(_v18, "dy", _S.prop(_v19, 1))
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v18, "dy"), _S.read(_v18, "sy")), func(): return _S.binary("<", _S.read(_v18, "e"), 0.6))):
			var _v20 = _S.scope(_v18)
			_S.invoke(_S.read(_v20, "p"), "px", [_S.read(_v20, "dx"), _S.read(_v20, "dy"), _S.prop(_S.read(_v20, "C"), 1)])
			_S.invoke(_S.read(_v20, "p"), "px", [_S.read(_v20, "dx"), _S.binary("-", _S.read(_v20, "dy"), 1), (_S.prop(_S.read(_v20, "Sh"), 3) if _S.truth(_S.binary("&", _S.read(_v20, "j"), 1)) else _S.prop(_S.read(_v20, "C"), 6))])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "j", 1, "+=", true)
	_S.call_value(_S.read(_e, "ribbon"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "x"), _S.binary("-", _S.read(_e, "sy"), 2), _S.read(_e, "e"), _S.binary("-", _S.read(_e, "L"), _S.read(_e, "swell")), _S.read(_e, "R"), 0.9])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "x0", _S.arg(_args, 2))
	_S.define(_e, "y0", _S.arg(_args, 3))
	_S.define(_e, "age", _S.arg(_args, 4))
	_S.define(_e, "life", _S.arg(_args, 5))
	_S.define(_e, "R", _S.arg(_args, 6))
	_S.define(_e, "k", _S.arg(_args, 7))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "len", _S.invoke(_S.read(_e, "R"), "range", [16, 26]))
	_S.define(_e, "rise", _S.invoke(_S.read(_e, "R"), "range", [9, 14]))
	_S.define(_e, "amp", _S.invoke(_S.read(_e, "R"), "range", [2, 4.5]))
	_S.define(_e, "w", _S.invoke(_S.read(_e, "R"), "range", [0.18, 0.3]))
	_S.define(_e, "ph", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "head", _S.binary("*", _S.read(_e, "rise"), _S.read(_e, "age")))
	_S.define(_e, "tail", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "head"), _S.read(_e, "len"))]))
	_S.define(_e, "fray", _S.call_value(_S.read(_e, "smooth"), [0.35, 0.85, _S.read(_e, "u")]))
	_S.define(_e, "fade", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, 0.12, _S.read(_e, "u")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.5, 1, _S.read(_e, "u")]))), _S.read(_e, "k")))
	if _S.truth(_S.binary("<", _S.read(_e, "fade"), 0.02)):
		return null
	_S.define(_e, "GREY", _S.call_value(_S.read(_e, "hex"), ["#b4b8ae"]))
	_S.define(_e, "n", (3 if _S.truth(_S.binary(">", _S.read(_e, "fray"), 0.05)) else 1))
	var _v21 = _S.scope(_e)
	_S.define(_v21, "h", _S.read(_v21, "tail"))
	while _S.truth(_S.binary("<=", _S.read(_v21, "h"), _S.read(_v21, "head"))):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "s", _S.binary("/", _S.binary("-", _S.read(_v22, "h"), _S.read(_v22, "tail")), _S.invoke(_S.read(_v22, "Math"), "max", [1, _S.binary("-", _S.read(_v22, "head"), _S.read(_v22, "tail"))])))
		_S.define(_v22, "cx", _S.binary("+", _S.read(_v22, "x0"), _S.binary("*", _S.binary("*", _S.read(_v22, "amp"), _S.invoke(_S.read(_v22, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v22, "h"), _S.read(_v22, "w")), _S.read(_v22, "ph")), _S.binary("*", _S.read(_v22, "age"), 1.6))])), _S.binary("+", 0.3, _S.read(_v22, "s")))))
		_S.define(_v22, "y", _S.binary("-", _S.read(_v22, "y0"), _S.read(_v22, "h")))
		_S.define(_v22, "a", _S.binary("*", _S.binary("*", _S.read(_v22, "fade"), _S.invoke(_S.read(_v22, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v22, "Math"), "PI"), _S.read(_v22, "s"))])), 0.45))
		_S.define(_v22, "lit", _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.read(_v22, "h"), 22))]), _S.binary("-", 1, _S.binary("*", 0.6, _S.read(_v22, "fray")))))
		_S.define(_v22, "VAP", _S.call_value(_S.read(_v22, "mix"), [_S.read(_v22, "GREY"), _S.prop(_S.read(_v22, "C"), 6), _S.binary("*", 0.75, _S.read(_v22, "lit"))]))
		var _v23 = _S.scope(_v22)
		_S.define(_v23, "q", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "q"), _S.read(_v23, "n"))):
			var _v24 = _S.scope(_v23)
			_S.define(_v24, "off", (0 if _S.truth(_S.binary("===", _S.read(_v24, "n"), 1)) else _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v24, "fray"), _S.read(_v24, "s")), _S.binary("-", _S.read(_v24, "q"), 1)), 3), _S.binary("*", _S.binary("*", _S.read(_v24, "fray"), 2.5), _S.invoke(_S.read(_v24, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v24, "h"), _S.binary("+", 0.35, _S.binary("*", _S.read(_v24, "q"), 0.17))), _S.binary("*", _S.read(_v24, "ph"), _S.binary("+", _S.read(_v24, "q"), 1))), _S.binary("*", _S.read(_v24, "age"), 2))])))))
			_S.invoke(_S.read(_v24, "p"), "blend", [_S.binary("+", _S.read(_v24, "cx"), _S.read(_v24, "off")), _S.read(_v24, "y"), _S.read(_v24, "VAP"), _S.binary("*", _S.binary("*", _S.read(_v24, "a"), (1 if _S.truth(_S.binary("===", _S.read(_v24, "n"), 1)) else _S.binary("-", 0.65, _S.binary("*", 0.25, _S.read(_v24, "fray"))))), _S.binary("+", 0.8, _S.binary("*", 0.4, _S.read(_v24, "lit"))))])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "q", 1, "+=", true)
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "h", 0.5, "+=", false)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "Sh", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "sheen"), 4]))
	_S.define(_e, "W", _S.prop(_S.read(_e, "o"), "width"))
	_S.define(_e, "pulse", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), 2), _S.read(_e, "D"))]))))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 3), _S.binary("*", _S.read(_e, "W"), 1.25), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.22, _S.read(_e, "pulse"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 10), _S.binary("*", _S.read(_e, "W"), 1.1), _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.1, _S.read(_e, "pulse"))])
	for _v25 in _S.array([_S.unary("-", 1), 1]):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "s", _v25)
		_S.invoke(_S.read(_v26, "p"), "glow", [_S.binary("*", _S.read(_v26, "s"), _S.read(_v26, "W")), _S.unary("-", 1), 12, _S.prop(_S.read(_v26, "C"), 6), _S.binary("*", 0.35, _S.read(_v26, "pulse"))])
	_S.call_value(_S.read(_e, "pool"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "Sh"), _S.read(_e, "W"), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "Sh", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "sheen"), 4]))
	_S.define(_e, "W", _S.prop(_S.read(_e, "o"), "width"))
	_S.call_value(_S.read(_e, "bubbles"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "Sh"), _S.read(_e, "W"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7), 1)])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 9, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 13), 4), _S.function_value(_e, "_f8"), _S.function_value(_e, "_f9")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [2.4, 3.4])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.85), 0.85]), _S.read(_e, "W")))
	_S.call_value(_S.read(_e, "ribbon"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "x"), _S.binary("-", _S.call_value(_S.read(_e, "surf"), [_S.read(_e, "x"), _S.read(_e, "W"), _S.read(_e, "t")]), 1), _S.read(_e, "age"), _S.read(_e, "L"), _S.read(_e, "R"), 0.75])
	return null
