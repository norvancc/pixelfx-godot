@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/flamethrower.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "pnoise", _S.import_value("fx/fire/_lib.js", "pnoise"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "flameTongue", _S.import_value("fx/fire/_lib.js", "flameTongue"))
	_S.define(_e, "firePuff", _S.import_value("fx/fire/_lib.js", "firePuff"))
	_S.define(_e, "smokePuff", _S.import_value("fx/fire/_lib.js", "smokePuff"))
	_S.define(_e, "spark", _S.import_value("fx/fire/_lib.js", "spark"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "solid", _S.import_value("fx/fire/_lib.js", "solid"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Flamethrower"}, {"desc": "A pressurised jet shooting right: a blue pilot at the nozzle, a tight stream with surges racing down it, a sputter, burning drops falling off, a tip that curls up into smoke."}, {"tags": ["fire", "flamethrower", "stream", "weapon", "directional", "loop"]}, {"size": [184, 104]}, {"origin": [30, 60]}, {"duration": 1.6}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"pilot": ["#1b2a8a", "#3a62e0", "#a8d4ff"]}, {"reach": 112}, {"speed": 280}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#2a2430"]))
	_S.define(_e, "COUGH", 0.55)
	_S.define(_e, "flow", _S.function_value(_e, "_f14"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "hotFirst"), [_S.read(_e, "F")]))
	_S.define(_e, "PL", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "pilot"), 3]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "L", _S.prop(_S.read(_e, "o"), "reach"))
	_S.define(_e, "V", _S.prop(_S.read(_e, "o"), "speed"))
	_S.define(_e, "N", _S.function_value(_e, "_f1"))
	_S.define(_e, "GLOW", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), 0.5]), _S.read(_e, "WHITE"), 0.25]))
	_S.define(_e, "SPARKS", [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 5)])
	_S.define(_e, "SMOKE", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "SOOT"), _S.prop(_S.read(_e, "H"), 7), 0.3]))
	_S.define(_e, "cy", _S.function_value(_e, "_f2"))
	_S.define(_e, "width", _S.function_value(_e, "_f3"))
	_S.define(_e, "fire", [])
	_S.define(_e, "smoke", [])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 80, _S.binary("+", _S.read(_e, "S"), 100), _S.function_value(_e, "_f4"), _S.function_value(_e, "_f5")])
	for _v0 in _S.array(_S.read(_e, "smoke")):
		var _v1 = _S.scope(_e)
		var _v2 = _v0
		_S.define(_v1, "u", _S.prop(_v2, 0))
		_S.define(_v1, "x", _S.prop(_v2, 1))
		_S.define(_v1, "y", _S.prop(_v2, 2))
		_S.define(_v1, "q", _S.prop(_v2, 3))
		_S.call_value(_S.read(_v1, "smokePuff"), [_S.read(_v1, "p"), _S.read(_v1, "x"), _S.read(_v1, "y"), _S.binary("-", 1, _S.read(_v1, "u")), _S.binary("*", _S.prop(_S.read(_v1, "q"), "s"), 1.2), _S.read(_v1, "SMOKE"), true, 0.85])
	_S.invoke(_S.read(_e, "fire"), "sort", [_S.function_value(_e, "_f6")])
	for _v3 in _S.array(_S.read(_e, "fire")):
		var _v4 = _S.scope(_e)
		var _v5 = _v3
		_S.define(_v4, "u", _S.prop(_v5, 0))
		_S.define(_v4, "x", _S.prop(_v5, 1))
		_S.define(_v4, "y", _S.prop(_v5, 2))
		_S.define(_v4, "q", _S.prop(_v5, 3))
		_S.define(_v4, "k", _S.prop(_v5, 4))
		_S.call_value(_S.read(_v4, "firePuff"), [_S.read(_v4, "p"), _S.read(_v4, "x"), _S.read(_v4, "y"), _S.binary("-", 1, _S.read(_v4, "u")), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v4, "q"), "s"), _S.binary("+", 0.8, _S.binary("*", 1.1, _S.read(_v4, "u")))), _S.read(_v4, "k")), _S.prop(_S.read(_v4, "q"), "f"), _S.read(_v4, "H"), 0.1])
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 13)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "n", _S.binary("*", _S.binary("+", _S.binary("*", _S.read(_v7, "S"), 3), _S.read(_v7, "i")), 19))
		_S.define(_v7, "ph", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_v7, "i"), 0.618), _S.binary("/", _S.read(_v7, "t"), _S.read(_v7, "D"))), 1))
		_S.define(_v7, "x", _S.binary("+", 10, _S.binary("*", _S.read(_v7, "ph"), _S.binary("-", _S.read(_v7, "L"), 14))))
		_S.define(_v7, "k", _S.call_value(_S.read(_v7, "flow"), [_S.binary("-", _S.read(_v7, "t"), _S.binary("/", _S.read(_v7, "x"), _S.read(_v7, "V")))]))
		if _S.truth(_S.binary("<", _S.read(_v7, "k"), 0.35)):
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
			continue
		_S.define(_v7, "h", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("+", 2, _S.binary("*", 11, _S.binary("/", _S.read(_v7, "x"), _S.read(_v7, "L")))), _S.binary("+", 0.55, _S.binary("*", 0.6, _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_v7, "N"), [5, _S.binary("+", _S.read(_v7, "n"), 1)])))))), _S.read(_v7, "k")), _S.invoke(_S.read(_v7, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_v7, "ph")), 6)])))
		_S.call_value(_S.read(_v7, "flameTongue"), [_S.read(_v7, "p"), _S.read(_v7, "x"), _S.binary("-", _S.call_value(_S.read(_v7, "cy"), [_S.read(_v7, "x")]), _S.binary("*", _S.call_value(_S.read(_v7, "width"), [_S.read(_v7, "x")]), 0.6)), _S.read(_v7, "h"), _S.binary("+", 1.1, _S.binary("*", 1.6, _S.binary("/", _S.read(_v7, "x"), _S.read(_v7, "L")))), _S.binary("*", _S.unary("-", _S.read(_v7, "h")), 0.55), _S.read(_v7, "N"), _S.read(_v7, "n"), _S.read(_v7, "H"), _S.read(_v7, "LAYERS")])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	_S.define(_e, "P", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "D"), 3)]))
	var _v8 = _S.scope(_e)
	_S.define(_v8, "x", 0)
	while _S.truth(_S.binary("<=", _S.read(_v8, "x"), _S.read(_v8, "L"))):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "c", _S.call_value(_S.read(_v9, "cy"), [_S.read(_v9, "x")]))
		_S.define(_v9, "w", _S.binary("*", _S.call_value(_S.read(_v9, "width"), [_S.read(_v9, "x")]), _S.binary("+", 1, _S.binary("*", 0.15, _S.call_value(_S.read(_v9, "pnoise"), [_S.binary("-", _S.binary("*", _S.read(_v9, "x"), 0.4), _S.binary("*", _S.binary("/", _S.read(_v9, "t"), _S.read(_v9, "D")), 24)), 24, _S.binary("+", _S.read(_v9, "S"), 4)])))))
		if _S.truth(_S.binary("<", _S.read(_v9, "w"), 0.4)):
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "x", 1, "+=", true)
			continue
		_S.define(_v9, "surge", (1 if _S.truth(_S.binary("<", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("*", _S.read(_v9, "x"), 0.035), _S.binary("*", _S.binary("/", _S.read(_v9, "t"), _S.read(_v9, "D")), _S.read(_v9, "P"))), 1), 1), 1), 0.12)) else 0))
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "y", _S.invoke(_S.read(_v10, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_v10, "c"), _S.read(_v10, "w")), 1)]))
		while _S.truth(_S.binary("<=", _S.read(_v10, "y"), _S.invoke(_S.read(_v10, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.read(_v10, "c"), _S.read(_v10, "w")), 1)]))):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "q", _S.binary("/", _S.invoke(_S.read(_v11, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_v11, "y"), 0.5), _S.read(_v11, "c"))]), _S.read(_v11, "w")))
			if _S.truth(_S.binary(">", _S.read(_v11, "q"), 1.15)):
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "y", 1, "+=", true)
				continue
			_S.define(_v11, "lvl", _S.binary("+", (0 if _S.truth(_S.binary("<", _S.read(_v11, "q"), 0.3)) else (1 if _S.truth(_S.binary("<", _S.read(_v11, "q"), 0.55)) else (2 if _S.truth(_S.binary("<", _S.read(_v11, "q"), 0.78)) else (3 if _S.truth(_S.binary("<", _S.read(_v11, "q"), 1)) else 4)))), (1 if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v11, "x"), _S.binary("*", _S.read(_v11, "L"), 0.45)), func(): return _S.binary("<", _S.read(_v11, "q"), 0.55))) else 0)))
			_S.write(_v11, "lvl", _S.invoke(_S.read(_v11, "Math"), "max", [0, _S.invoke(_S.read(_v11, "Math"), "min", [4, _S.binary("-", _S.read(_v11, "lvl"), _S.read(_v11, "surge"))])]), "=", false)
			if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v11, "lvl"), 4), func(): return _S.binary("<", _S.call_value(_S.read(_v11, "pnoise"), [_S.binary("-", _S.binary("+", _S.binary("*", _S.read(_v11, "x"), 0.5), _S.binary("*", _S.read(_v11, "y"), 7.3)), _S.binary("*", _S.binary("/", _S.read(_v11, "t"), _S.read(_v11, "D")), 40)), 40, _S.binary("+", _S.read(_v11, "S"), 6)]), 0))):
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "y", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v11, "p"), "px", [_S.read(_v11, "x"), _S.read(_v11, "y"), _S.prop([_S.prop(_S.read(_v11, "H"), 0), _S.prop(_S.read(_v11, "H"), 2), _S.prop(_S.read(_v11, "H"), 4), _S.prop(_S.read(_v11, "H"), 6), _S.prop(_S.read(_v11, "H"), 7)], _S.read(_v11, "lvl"))])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "y", 1, "+=", true)
		for _v12 in _S.array([0, _S.prop(_S.read(_v9, "Math"), "PI")]):
			var _v13 = _S.scope(_v9)
			_S.define(_v13, "ph", _v12)
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "a", _S.binary("+", _S.binary("-", _S.binary("*", _S.read(_v14, "x"), 0.22), _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v14, "t"), _S.read(_v14, "D")), _S.prop(_S.read(_v14, "Math"), "PI")), 2), 9)), _S.read(_v14, "ph")))
			_S.define(_v14, "sy", _S.binary("+", _S.read(_v14, "c"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "w")), 0.55)))
			if _S.truth(_S.logical("&&", _S.binary(">", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.unary("-", 0.1)), func(): return _S.binary(">", _S.read(_v14, "w"), 1.2))):
				_S.invoke(_S.read(_v14, "p"), "px", [_S.read(_v14, "x"), _S.read(_v14, "sy"), (_S.prop(_S.read(_v14, "H"), 0) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), 0.55)) else _S.prop(_S.read(_v14, "H"), 1))])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "x", 1, "+=", true)
	_S.define(_e, "pk", _S.call_value(_S.read(_e, "flow"), [_S.read(_e, "t")]))
	var _v15 = _S.scope(_e)
	_S.define(_v15, "x", 0)
	while _S.truth(_S.binary("<", _S.read(_v15, "x"), 6)):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "y", _S.unary("-", 2))
		while _S.truth(_S.binary("<=", _S.read(_v16, "y"), 2)):
			if _S.truth(_S.binary("<=", _S.invoke(_S.read(_v16, "Math"), "abs", [_S.read(_v16, "y")]), _S.binary("-", 2, _S.binary("*", _S.read(_v16, "x"), 0.3)))):
				_S.invoke(_S.read(_v16, "p"), "px", [_S.read(_v16, "x"), _S.read(_v16, "y"), ((_S.prop(_S.read(_v16, "PL"), 2) if _S.truth(_S.binary("<", _S.read(_v16, "x"), 2)) else _S.prop(_S.read(_v16, "PL"), 1)) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v16, "Math"), "abs", [_S.read(_v16, "y")]), 1)) else _S.prop(_S.read(_v16, "PL"), 0))])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "y", 1, "+=", true)
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "x", 1, "+=", true)
	_S.call_value(_S.read(_e, "solid"), [_S.read(_e, "p"), 1, 0, _S.binary("*", 1.6, _S.read(_e, "pk")), _S.read(_e, "WHITE")])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 10, _S.binary("+", _S.read(_e, "S"), 200), _S.function_value(_e, "_f7"), _S.function_value(_e, "_f8")])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 12, _S.binary("+", _S.read(_e, "S"), 300), _S.function_value(_e, "_f10"), _S.function_value(_e, "_f11")])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 5, _S.binary("+", _S.read(_e, "S"), 350), _S.function_value(_e, "_f12"), _S.function_value(_e, "_f13")])
	var _v23 = _S.scope(_e)
	_S.define(_v23, "u", _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_v23, "t"), _S.read(_v23, "D")), _S.read(_v23, "D")), _S.read(_v23, "D")))
	_S.define(_v23, "a", _S.binary("-", _S.read(_v23, "u"), _S.read(_v23, "COUGH")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v23, "a"), 0), func(): return _S.binary("<", _S.read(_v23, "a"), 0.7))):
		_S.call_value(_S.read(_v23, "smokePuff"), [_S.read(_v23, "p"), _S.binary("+", 8, _S.binary("*", _S.read(_v23, "a"), 20)), _S.binary("*", _S.unary("-", _S.read(_v23, "a")), 18), _S.binary("-", 1, _S.binary("/", _S.read(_v23, "a"), 0.7)), 3, _S.read(_v23, "SMOKE"), false, 0.8])
	_S.invoke(_S.read(_e, "p"), "glow", [2, 0, _S.binary("*", 34, _S.read(_e, "pk")), _S.read(_e, "GLOW"), _S.binary("*", 0.8, _S.read(_e, "pk"))])
	_S.invoke(_S.read(_e, "p"), "glow", [2, 0, 9, _S.prop(_S.read(_e, "PL"), 2), _S.binary("*", 0.45, _S.read(_e, "pk"))])
	var _v24 = _S.scope(_e)
	_S.define(_v24, "d", 8)
	while _S.truth(_S.binary("<=", _S.read(_v24, "d"), _S.read(_v24, "L"))):
		_S.invoke(_S.read(_v24, "p"), "glow", [_S.read(_v24, "d"), _S.call_value(_S.read(_v24, "cy"), [_S.read(_v24, "d")]), _S.binary("+", 12, _S.binary("*", _S.read(_v24, "d"), 0.16)), _S.read(_v24, "GLOW"), _S.binary("*", 0.3, _S.call_value(_S.read(_v24, "flow"), [_S.binary("-", _S.read(_v24, "t"), _S.binary("/", _S.read(_v24, "d"), _S.read(_v24, "V")))]))])
		_v24 = _S.iteration(_v24)
		_S.write(_v24, "d", 8, "+=", false)
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "L"), _S.binary("-", _S.call_value(_S.read(_e, "cy"), [_S.read(_e, "L")]), 10), 52, _S.read(_e, "GLOW"), _S.binary("*", 0.34, _S.call_value(_S.read(_e, "flow"), [_S.binary("-", _S.read(_e, "t"), _S.binary("/", _S.read(_e, "L"), _S.read(_e, "V")))]))])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rate", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	_S.define(_e, "off", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), _S.read(_e, "rate"), _S.read(_e, "seed"), _S.read(_e, "off")])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("*", 5, _S.binary("**", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "L")), 2)), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "N"), [1.2, _S.binary("+", _S.read(_e, "S"), 9), _S.binary("*", _S.read(_e, "x"), 0.02)]), 2.2), _S.binary("**", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "L")), 1.5)))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("+", 2.1, _S.binary("*", 5, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("/", _S.read(_e, "x"), _S.read(_e, "L")), 0.7]))), _S.call_value(_S.read(_e, "flow"), [_S.binary("-", _S.read(_e, "t"), _S.binary("/", _S.read(_e, "x"), _S.read(_e, "V")))]))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"a0": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.3), 0.5])}, {"R": _S.invoke(_S.read(_e, "r"), "range", [9, 15])}, {"w": _S.invoke(_S.read(_e, "r"), "range", [5, 7.5])}, {"up": _S.invoke(_S.read(_e, "r"), "range", [4, 12])}, {"dx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 6), 2])}, {"fl": _S.invoke(_S.read(_e, "r"), "range", [0.38, 0.62])}, {"sl": _S.invoke(_S.read(_e, "r"), "range", [0.6, 1])}, {"s": _S.invoke(_S.read(_e, "r"), "range", [2.4, 4.4])}, {"f": _S.invoke(_S.read(_e, "r"), "next", [])}, {"life": 1.6}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "tb", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "flow"), [_S.binary("-", _S.read(_e, "tb"), _S.binary("/", _S.read(_e, "L"), _S.read(_e, "V")))]))
	if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.4)):
		return null
	_S.define(_e, "x0", _S.binary("+", _S.read(_e, "L"), _S.prop(_S.read(_e, "q"), "dx")))
	_S.define(_e, "y0", _S.call_value(_S.read(_e, "cy"), [_S.read(_e, "L")]))
	_S.define(_e, "a", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl")]), _S.prop(_S.read(_e, "q"), "w")), _S.prop(_S.read(_e, "q"), "a0")))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.prop(_S.read(_e, "q"), "R"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))))
	_S.define(_e, "y", _S.binary("-", _S.binary("-", _S.read(_e, "y0"), _S.binary("*", _S.prop(_S.read(_e, "q"), "R"), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")])))), _S.binary("*", _S.prop(_S.read(_e, "q"), "up"), _S.read(_e, "age"))))
	if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl"))):
		return _S.invoke(_S.read(_e, "fire"), "push", [[_S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl")), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "q"), _S.read(_e, "k")]])
	if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl")), _S.prop(_S.read(_e, "q"), "sl"))):
		_S.invoke(_S.read(_e, "smoke"), "push", [[_S.binary("/", _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl")), _S.prop(_S.read(_e, "q"), "sl")), _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl")), 6)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl")), 16)), _S.read(_e, "q")]])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "b"), 0), _S.prop(_S.read(_e, "a"), 0))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"d": _S.invoke(_S.read(_e, "r"), "range", [20, 95])}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [0.3, 0.6])}, {"vy": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 25), 15])}, {"life": _S.invoke(_S.read(_e, "r"), "range", [0.35, 0.6])}])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "tb", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")))
	if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "flow"), [_S.binary("-", _S.read(_e, "tb"), _S.binary("/", _S.prop(_S.read(_e, "q"), "d"), _S.read(_e, "V")))]), 0.5)):
		return null
	_S.define(_e, "at", _S.function_value(_e, "_f9"))
	var _v17 = _S.scope(_e)
	_S.define(_v17, "j", 4)
	while _S.truth(_S.binary(">=", _S.read(_v17, "j"), 1)):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "a", _S.binary("-", _S.read(_v18, "age"), _S.binary("*", _S.read(_v18, "j"), 0.035)))
		if _S.truth(_S.binary("<", _S.read(_v18, "a"), 0)):
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "j", 1, "-=", true)
			continue
		var _v19 = _S.call_value(_S.read(_v18, "at"), [_S.read(_v18, "a")])
		_S.define(_v18, "x", _S.prop(_v19, 0))
		_S.define(_v18, "y", _S.prop(_v19, 1))
		_S.call_value(_S.read(_v18, "firePuff"), [_S.read(_v18, "p"), _S.read(_v18, "x"), _S.read(_v18, "y"), _S.binary("-", 1, _S.invoke(_S.read(_v18, "Math"), "min", [0.99, _S.binary("+", _S.binary("*", _S.read(_v18, "j"), 0.18), _S.binary("*", _S.binary("/", _S.read(_v18, "age"), _S.prop(_S.read(_v18, "q"), "life")), 0.4))])), _S.binary("-", 1.8, _S.binary("*", _S.read(_v18, "j"), 0.25)), 0.3, _S.read(_v18, "H"), 0.06])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "j", 1, "-=", true)
	var _v20 = _S.call_value(_S.read(_e, "at"), [_S.read(_e, "age")])
	_S.define(_e, "x", _S.prop(_v20, 0))
	_S.define(_e, "y", _S.prop(_v20, 1))
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))))
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "H"), 0) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.5)) else _S.prop(_S.read(_e, "H"), 2))])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.read(_e, "x"), 1), _S.read(_e, "y"), _S.prop(_S.read(_e, "H"), 3)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 6, _S.prop(_S.read(_e, "H"), 3), _S.binary("*", 0.45, _S.read(_e, "k"))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "drift"), [_S.prop(_S.read(_e, "q"), "d"), _S.call_value(_S.read(_e, "cy"), [_S.prop(_S.read(_e, "q"), "d")]), _S.binary("*", _S.read(_e, "V"), _S.prop(_S.read(_e, "q"), "vx")), _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "a"), 0, 260, 1.2, 0.5])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"born": _S.binary("+", _S.read(_e, "COUGH"), _S.invoke(_S.read(_e, "r"), "range", [0, 0.08]))}, {"a": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.8), 0.8])}, {"v": _S.invoke(_S.read(_e, "r"), "range", [120, 240])}, {"life": _S.invoke(_S.read(_e, "r"), "range", [0.2, 0.45])}])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "u", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), _S.read(_e, "D")), _S.read(_e, "D")), _S.read(_e, "D")))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "u"), _S.prop(_S.read(_e, "q"), "born"))]), 0.06)):
		return null
	var _v21 = _S.call_value(_S.read(_e, "drift"), [4, 0, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "q"), "a")]), _S.prop(_S.read(_e, "q"), "v")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "q"), "a")]), _S.prop(_S.read(_e, "q"), "v")), _S.read(_e, "age"), 0, 300, 2.5, 2.5])
	_S.define(_e, "x", _S.prop(_v21, 0))
	_S.define(_e, "y", _S.prop(_v21, 1))
	_S.define(_e, "vx", _S.prop(_v21, 2))
	_S.define(_e, "vy", _S.prop(_v21, 3))
	_S.call_value(_S.read(_e, "spark"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "vx"), _S.read(_e, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))), _S.read(_e, "SPARKS")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"born": _S.binary("+", _S.read(_e, "COUGH"), _S.invoke(_S.read(_e, "r"), "range", [0.01, 0.1]))}, {"v": _S.invoke(_S.read(_e, "r"), "range", [90, 170])}, {"vy": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 30), 10])}, {"life": _S.invoke(_S.read(_e, "r"), "range", [0.25, 0.4])}, {"s": _S.invoke(_S.read(_e, "r"), "range", [1.6, 2.6])}])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "u", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), _S.read(_e, "D")), _S.read(_e, "D")), _S.read(_e, "D")))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "u"), _S.prop(_S.read(_e, "q"), "born"))]), 0.05)):
		return null
	var _v22 = _S.call_value(_S.read(_e, "drift"), [4, 0, _S.prop(_S.read(_e, "q"), "v"), _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"), 0, 200, 2, 1])
	_S.define(_e, "x", _S.prop(_v22, 0))
	_S.define(_e, "y", _S.prop(_v22, 1))
	_S.call_value(_S.read(_e, "firePuff"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))), _S.prop(_S.read(_e, "q"), "s"), 0.2, _S.read(_e, "H"), 0.1, _S.unary("-", 0.86), _S.unary("-", 0.5)])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "te", _S.arg(_args, 0))
	_S.define(_e, "u", _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "te"), _S.read(_e, "D")), _S.read(_e, "D")), _S.read(_e, "D")))
	return _S.binary("+", _S.binary("-", 1, _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "COUGH"), _S.binary("+", _S.read(_e, "COUGH"), 0.04), _S.read(_e, "u")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "COUGH"), 0.1), _S.binary("+", _S.read(_e, "COUGH"), 0.16), _S.read(_e, "u")])))), _S.binary("*", 0.25, _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "u"), _S.read(_e, "COUGH")), 0.2), 0.05), 2))])))
