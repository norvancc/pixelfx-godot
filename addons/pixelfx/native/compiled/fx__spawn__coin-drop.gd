@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/coin-drop.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Coin drop"}, {"desc": "An enemy goes up in a soft poof and gold coins spin out of it, bounce with a glint on each hit, settle on the floor, twinkle, and wink out one by one."}, {"tags": ["spawn", "death", "loot", "coins", "gold", "drop", "pickup", "ground", "one-shot"]}, {"size": [160, 88]}, {"origin": [80, 78]}, {"duration": 3}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#2a1606", "#5c3208", "#9a5a0c", "#d48c14", "#f5b82a", "#ffe066", "#fff6c4", "#ffffff"]}, {"smoke": ["#3a3450", "#6c6688", "#a8a2c0", "#dcd8ea"]}, {"coins": 7}, {"seed": 23}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CY", _S.unary("-", 16))
	_S.define(_e, "COIN", ["..oooo..", ".ohhlmo.", "ohlmmmdo", "ohmdhmdo", "olmdhmdo", "olmmmmdo", ".oddddo.", "..oooo.."])
	_S.define(_e, "FLAT", [".lhhhl.", "olmmmdo", ".odddo."])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "drawCoin", _S.function_value(_e, "_f1"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "SM", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "smoke"), 4]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "PAL", _S.merge([{"o": _S.prop(_S.read(_e, "C"), 1)}, {"h": _S.prop(_S.read(_e, "C"), 6)}, {"l": _S.prop(_S.read(_e, "C"), 5)}, {"m": _S.prop(_S.read(_e, "C"), 4)}, {"d": _S.prop(_S.read(_e, "C"), 3)}]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "coins", [])
	_S.define(_e, "balls", [])
	var _v7 = _S.scope(_e)
	_S.define(_v7, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "i"), 10)):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v8, "i"), 10), _S.read(_v8, "TAU")), _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 0.25), 0.25])))
		_S.define(_v8, "sp", _S.invoke(_S.read(_v8, "R"), "range", [60, 100]))
		_S.define(_v8, "life", _S.invoke(_S.read(_v8, "R"), "range", [0.55, 0.85]))
		_S.invoke(_S.read(_v8, "balls"), "push", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), 2)}, {"y": _S.binary("+", _S.read(_v8, "CY"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), 2))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), 0.7), 10)}, {"r": _S.invoke(_S.read(_v8, "R"), "range", [4, 6])}, {"life": _S.read(_v8, "life")}, {"max": _S.read(_v8, "life")}])])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "i", 1, "+=", true)
	_S.define(_e, "n", _S.prop(_S.read(_e, "o"), "coins"))
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), _S.read(_v9, "n"))):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "u", (_S.binary("-", _S.binary("/", _S.read(_v10, "i"), _S.binary("-", _S.read(_v10, "n"), 1)), 0.5) if _S.truth(_S.binary(">", _S.read(_v10, "n"), 1)) else 0))
		_S.define(_v10, "a", _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v10, "Math"), "PI")), 2), _S.binary("*", _S.read(_v10, "u"), 1.6)), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 0.1), 0.1])))
		_S.define(_v10, "sp", _S.invoke(_S.read(_v10, "R"), "range", [230, 300]))
		_S.invoke(_S.read(_v10, "coins"), "push", [_S.merge([{"x": _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 3), 3])}, {"y": _S.read(_v10, "CY")}, {"vx": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), 0.4)}, {"vy": _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "sp"))}, {"ph": _S.invoke(_S.read(_v10, "R"), "range", [0, _S.read(_v10, "TAU")])}, {"w": _S.binary("*", _S.invoke(_S.read(_v10, "R"), "range", [9, 15]), _S.invoke(_S.read(_v10, "R"), "sign", []))}, {"rest": false}, {"hits": 0}, {"out": _S.binary("+", _S.binary("+", 2.15, _S.binary("*", _S.read(_v10, "i"), 0.07)), _S.invoke(_S.read(_v10, "R"), "range", [0, 0.1]))}, {"glint": _S.invoke(_S.read(_v10, "R"), "range", [1.2, 1.9])}, {"born": _S.invoke(_S.read(_v10, "R"), "range", [0.04, 0.12])}])])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), 8)):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "a", _S.invoke(_S.read(_v12, "R"), "range", [0, _S.read(_v12, "TAU")]))
		_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "R"), "range", [50, 120]))
		_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "STAR"), 0, _S.read(_v12, "CY"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), 20), _S.invoke(_S.read(_v12, "R"), "range", [0.3, 0.6]), _S.invoke(_S.read(_v12, "R"), "pick", [[_S.read(_v12, "WHITE"), _S.prop(_S.read(_v12, "C"), 6), _S.prop(_S.read(_v12, "C"), 5)]]), _S.invoke(_S.read(_v12, "R"), "range", [0.8, 1.8])])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.read(_e, "CY"), 44, _S.prop(_S.read(_e, "C"), 4), 0.7, 0.4])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.read(_e, "CY"), 20, _S.read(_e, "WHITE"), 0.7, 0.1])
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"drawBack": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "ph", _S.arg(_args, 3))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ph")]))
	_S.define(_e, "sx", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "c")]))
	if _S.truth(_S.binary("<", _S.read(_e, "sx"), 0.28)):
		var _v0 = _S.scope(_e)
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "dy", _S.unary("-", 3))
		while _S.truth(_S.binary("<=", _S.read(_v1, "dy"), 3)):
			_S.invoke(_S.read(_v1, "p"), "px", [_S.read(_v1, "x"), _S.binary("+", _S.read(_v1, "y"), _S.read(_v1, "dy")), (_S.prop(_S.read(_v1, "C"), 1) if _S.truth(_S.binary("===", _S.invoke(_S.read(_v1, "Math"), "abs", [_S.read(_v1, "dy")]), 3)) else (_S.prop(_S.read(_v1, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v1, "dy"), 0)) else _S.prop(_S.read(_v1, "C"), 5)))])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "dy", 1, "+=", true)
		if _S.truth(_S.binary(">", _S.read(_v0, "sx"), 0.12)):
			var _v2 = _S.scope(_v0)
			_S.define(_v2, "dy", _S.unary("-", 2))
			while _S.truth(_S.binary("<=", _S.read(_v2, "dy"), 2)):
				_S.invoke(_S.read(_v2, "p"), "px", [_S.binary("+", _S.read(_v2, "x"), (1 if _S.truth(_S.binary(">", _S.read(_v2, "c"), 0)) else _S.unary("-", 1))), _S.binary("+", _S.read(_v2, "y"), _S.read(_v2, "dy")), _S.prop(_S.read(_v2, "C"), 3)])
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "dy", 1, "+=", true)
		return null
	_S.define(_e, "half", _S.binary("*", 4, _S.read(_e, "sx")))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "px", _S.invoke(_S.read(_v3, "Math"), "floor", [_S.binary("-", _S.read(_v3, "x"), _S.read(_v3, "half"))]))
	while _S.truth(_S.binary("<", _S.read(_v3, "px"), _S.invoke(_S.read(_v3, "Math"), "ceil", [_S.binary("+", _S.read(_v3, "x"), _S.read(_v3, "half"))]))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "col", _S.invoke(_S.read(_v4, "Math"), "floor", [_S.binary("+", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v4, "px"), 0.5), _S.read(_v4, "x")), _S.read(_v4, "sx")), 4)]))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v4, "col"), 0), func(): return _S.binary(">", _S.read(_v4, "col"), 7))):
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "px", 1, "+=", true)
			continue
		if _S.truth(_S.binary("<", _S.read(_v4, "c"), 0)):
			_S.write(_v4, "col", _S.binary("-", 7, _S.read(_v4, "col")), "=", false)
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "row", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "row"), 8)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "ch", _S.prop(_S.prop(_S.read(_v6, "COIN"), _S.read(_v6, "row")), _S.read(_v6, "col")))
			if _S.truth(_S.binary("!==", _S.read(_v6, "ch"), ".")):
				_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "px"), _S.invoke(_S.read(_v6, "Math"), "round", [_S.binary("+", _S.binary("-", _S.read(_v6, "y"), 4), _S.read(_v6, "row"))]), _S.prop(_S.read(_v6, "PAL"), _S.read(_v6, "ch"))])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "row", 1, "+=", true)
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "px", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", _S.binary("-", _S.prop(_S.read(_v13, "balls"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v13, "i"), 0)):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "b", _S.prop(_S.read(_v14, "balls"), _S.read(_v14, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v14, "b"), "life", _S.read(_v14, "dt"), "-=", false), 0)):
			var _v15 = _S.scope(_v14)
			_S.invoke(_S.read(_v15, "balls"), "splice", [_S.read(_v15, "i"), 1])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v14, "b"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v14, "b"), "vx"), 7), _S.read(_v14, "dt")), "-=", false)
		_S.set_prop(_S.read(_v14, "b"), "vy", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v14, "b"), "vy"), 7), _S.read(_v14, "dt")), _S.binary("*", 26, _S.read(_v14, "dt"))), "-=", false)
		_S.set_prop(_S.read(_v14, "b"), "x", _S.binary("*", _S.prop(_S.read(_v14, "b"), "vx"), _S.read(_v14, "dt")), "+=", false)
		_S.set_prop(_S.read(_v14, "b"), "y", _S.binary("*", _S.prop(_S.read(_v14, "b"), "vy"), _S.read(_v14, "dt")), "+=", false)
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "-=", true)
	for _v16 in _S.array(_S.read(_e, "coins")):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "c", _v16)
		var _v18 = _S.scope(_v17)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v18, "c"), "gone")), func(): return _S.binary(">=", _S.read(_v18, "t"), _S.prop(_S.read(_v18, "c"), "out")))):
			var _v19 = _S.scope(_v18)
			_S.set_prop(_S.read(_v19, "c"), "gone", true, "=", false)
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v20, "j"), 5)):
				var _v21 = _S.scope(_v20)
				_S.define(_v21, "a", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v21, "Math"), "PI")), 0]))
				_S.define(_v21, "sp", _S.invoke(_S.read(_v21, "R"), "range", [25, 60]))
				_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "STAR"), _S.prop(_S.read(_v21, "c"), "x"), _S.unary("-", 3), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), _S.read(_v21, "sp")), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "a")]), _S.read(_v21, "sp")), _S.invoke(_S.read(_v21, "R"), "range", [0.3, 0.55]), _S.invoke(_S.read(_v21, "R"), "pick", [[_S.read(_v21, "WHITE"), _S.prop(_S.read(_v21, "C"), 6), _S.prop(_S.read(_v21, "C"), 5)]]), _S.invoke(_S.read(_v21, "R"), "range", [0.7, 1.4])])
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "j", 1, "+=", true)
			_S.invoke(_S.read(_v19, "lights"), "add", [_S.prop(_S.read(_v19, "c"), "x"), _S.unary("-", 3), 14, _S.prop(_S.read(_v19, "C"), 5), 0.6, 0.2])
		if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v18, "t"), _S.prop(_S.read(_v18, "c"), "born")), func(): return _S.binary(">", _S.read(_v18, "t"), _S.prop(_S.read(_v18, "c"), "out"))), func(): return _S.prop(_S.read(_v18, "c"), "rest"))):
			continue
		_S.set_prop(_S.read(_v18, "c"), "vy", _S.binary("*", 820, _S.read(_v18, "dt")), "+=", false)
		_S.set_prop(_S.read(_v18, "c"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v18, "c"), "vx"), 0.4), _S.read(_v18, "dt")), "-=", false)
		_S.set_prop(_S.read(_v18, "c"), "x", _S.binary("*", _S.prop(_S.read(_v18, "c"), "vx"), _S.read(_v18, "dt")), "+=", false)
		_S.set_prop(_S.read(_v18, "c"), "y", _S.binary("*", _S.prop(_S.read(_v18, "c"), "vy"), _S.read(_v18, "dt")), "+=", false)
		_S.set_prop(_S.read(_v18, "c"), "ph", _S.binary("*", _S.prop(_S.read(_v18, "c"), "w"), _S.read(_v18, "dt")), "+=", false)
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v18, "c"), "y"), _S.unary("-", 1.5)), func(): return _S.binary(">", _S.prop(_S.read(_v18, "c"), "vy"), 0))):
			var _v22 = _S.scope(_v18)
			_S.set_prop(_S.read(_v22, "c"), "y", _S.unary("-", 1.5), "=", false)
			_S.set_prop(_S.read(_v22, "c"), "hits", 1, "+=", true)
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "STAR"), _S.prop(_S.read(_v22, "c"), "x"), _S.unary("-", 3), 0, _S.unary("-", 8), 0.25, _S.read(_v22, "WHITE"), (2.2 if _S.truth(_S.binary("===", _S.prop(_S.read(_v22, "c"), "hits"), 1)) else 1.4)])
			var _v23 = _S.scope(_v22)
			_S.define(_v23, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v23, "j"), 2)):
				_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v23, "c"), "x"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 1), 1])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v23, "R"), "sign", []), _S.invoke(_S.read(_v23, "R"), "range", [8, 24])), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [2, 8])), _S.invoke(_S.read(_v23, "R"), "range", [0.25, 0.45]), _S.prop(_S.read(_v23, "SM"), 1), _S.invoke(_S.read(_v23, "R"), "range", [1, 1.8])])
				_v23 = _S.iteration(_v23)
				_S.write(_v23, "j", 1, "+=", true)
			_S.invoke(_S.read(_v22, "lights"), "add", [_S.prop(_S.read(_v22, "c"), "x"), _S.unary("-", 3), 12, _S.prop(_S.read(_v22, "C"), 5), 0.5, 0.15])
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v22, "c"), "vy"), 110)):
				_S.last([_S.set_prop(_S.read(_v22, "c"), "vy", _S.unary("-", 0.45), "*=", false), _S.set_prop(_S.read(_v22, "c"), "vx", 0.7, "*=", false), _S.set_prop(_S.read(_v22, "c"), "w", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v22, "c"), "w"), 0.8), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 2), 2])), "=", false)])
			else:
				_S.last([_S.set_prop(_S.read(_v22, "c"), "rest", true, "=", false), _S.set_prop(_S.read(_v22, "c"), "vx", _S.set_prop(_S.read(_v22, "c"), "vy", 0, "=", false), "=", false), _S.set_prop(_S.read(_v22, "c"), "restAt", _S.read(_v22, "t"), "=", false)])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v24 in _S.array(_S.read(_e, "coins")):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "c", _v24)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v25, "c"), "rest"), func(): return _S.binary("<", _S.read(_v25, "t"), _S.prop(_S.read(_v25, "c"), "out")))):
			_S.invoke(_S.read(_v25, "p"), "glow", [_S.prop(_S.read(_v25, "c"), "x"), _S.unary("-", 1), 7, _S.prop(_S.read(_v25, "C"), 4), 0.18])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v26 in _S.array([0, 1, 2]):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "layer", _v26)
		for _v28 in _S.array(_S.read(_v27, "balls")):
			var _v29 = _S.scope(_v27)
			_S.define(_v29, "b", _v28)
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "age", _S.binary("-", _S.prop(_S.read(_v30, "b"), "max"), _S.prop(_S.read(_v30, "b"), "life")))
			_S.define(_v30, "k", _S.binary("/", _S.prop(_S.read(_v30, "b"), "life"), _S.prop(_S.read(_v30, "b"), "max")))
			_S.define(_v30, "r", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v30, "b"), "r"), _S.binary("+", 0.6, _S.binary("*", 0.6, _S.invoke(_S.read(_v30, "ease"), "outCubic", [_S.call_value(_S.read(_v30, "clamp"), [_S.binary("/", _S.read(_v30, "age"), 0.2)])])))), (_S.binary("/", _S.read(_v30, "k"), 0.35) if _S.truth(_S.binary("<", _S.read(_v30, "k"), 0.35)) else 1)))
			if _S.truth(_S.binary("<", _S.read(_v30, "r"), 0.6)):
				continue
			if _S.truth(_S.binary("===", _S.read(_v30, "layer"), 0)):
				_S.invoke(_S.read(_v30, "p"), "disc", [_S.binary("+", _S.prop(_S.read(_v30, "b"), "x"), _S.binary("*", _S.read(_v30, "r"), 0.15)), _S.binary("+", _S.prop(_S.read(_v30, "b"), "y"), _S.binary("*", _S.read(_v30, "r"), 0.2)), _S.read(_v30, "r"), _S.prop(_S.read(_v30, "SM"), 1), 0.8])
			else:
				if _S.truth(_S.binary("===", _S.read(_v30, "layer"), 1)):
					_S.invoke(_S.read(_v30, "p"), "disc", [_S.binary("-", _S.prop(_S.read(_v30, "b"), "x"), _S.binary("*", _S.read(_v30, "r"), 0.06)), _S.binary("-", _S.prop(_S.read(_v30, "b"), "y"), _S.binary("*", _S.read(_v30, "r"), 0.08)), _S.binary("*", _S.read(_v30, "r"), 0.86), (_S.prop(_S.read(_v30, "SM"), 1) if _S.truth(_S.binary(">", _S.prop(_S.read(_v30, "b"), "y"), _S.binary("+", _S.read(_v30, "CY"), 2))) else _S.prop(_S.read(_v30, "SM"), 2)), 0.85])
				else:
					if _S.truth(_S.binary("<", _S.prop(_S.read(_v30, "b"), "y"), _S.binary("+", _S.read(_v30, "CY"), 2))):
						_S.invoke(_S.read(_v30, "p"), "disc", [_S.binary("-", _S.prop(_S.read(_v30, "b"), "x"), _S.binary("*", _S.read(_v30, "r"), 0.28)), _S.binary("-", _S.prop(_S.read(_v30, "b"), "y"), _S.binary("*", _S.read(_v30, "r"), 0.34)), _S.binary("*", _S.read(_v30, "r"), 0.4), _S.prop(_S.read(_v30, "SM"), 3), 0.85])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.07)):
		var _v31 = _S.scope(_e)
		_S.define(_v31, "k", _S.binary("/", _S.read(_v31, "t"), 0.07))
		_S.invoke(_S.read(_v31, "p"), "circle", [0, _S.read(_v31, "CY"), _S.binary("+", 8, _S.binary("*", 2, _S.read(_v31, "k"))), _S.prop(_S.read(_v31, "C"), 6)])
		_S.invoke(_S.read(_v31, "p"), "circle", [0, _S.read(_v31, "CY"), _S.binary("+", 6, _S.binary("*", 2, _S.read(_v31, "k"))), _S.read(_v31, "WHITE")])
		_S.call_value(_S.read(_v31, "flare"), [_S.read(_v31, "p"), 0, _S.read(_v31, "CY"), _S.binary("*", 16, _S.binary("-", 1, _S.binary("*", _S.read(_v31, "k"), 0.5))), _S.binary("-", 1, _S.read(_v31, "k")), _S.read(_v31, "C")])
	for _v32 in _S.array(_S.read(_e, "coins")):
		var _v33 = _S.scope(_e)
		_S.define(_v33, "c", _v32)
		var _v34 = _S.scope(_v33)
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v34, "t"), _S.prop(_S.read(_v34, "c"), "born")), func(): return _S.binary(">", _S.read(_v34, "t"), _S.binary("+", _S.prop(_S.read(_v34, "c"), "out"), 0.12)))):
			continue
		if _S.truth(_S.binary(">", _S.read(_v34, "t"), _S.prop(_S.read(_v34, "c"), "out"))):
			var _v35 = _S.scope(_v34)
			_S.define(_v35, "k", _S.binary("/", _S.binary("-", _S.read(_v35, "t"), _S.prop(_S.read(_v35, "c"), "out")), 0.12))
			_S.call_value(_S.read(_v35, "sparkle"), [_S.read(_v35, "p"), _S.prop(_S.read(_v35, "c"), "x"), _S.unary("-", 2), _S.invoke(_S.read(_v35, "Math"), "round", [_S.binary("*", 5, _S.binary("-", 1, _S.read(_v35, "k")))]), _S.read(_v35, "WHITE"), _S.prop(_S.read(_v35, "C"), 5), 0.5])
			_S.invoke(_S.read(_v35, "p"), "ring", [_S.prop(_S.read(_v35, "c"), "x"), _S.unary("-", 3), _S.binary("+", 2, _S.binary("*", 5, _S.invoke(_S.read(_v35, "ease"), "outCubic", [_S.read(_v35, "k")]))), 1, _S.prop(_S.read(_v35, "C"), 6), _S.binary("-", 1.1, _S.read(_v35, "k"))])
			continue
		if _S.truth(_S.prop(_S.read(_v34, "c"), "rest")):
			var _v36 = _S.scope(_v34)
			_S.invoke(_S.read(_v36, "p"), "sprite", [_S.read(_v36, "FLAT"), _S.read(_v36, "PAL"), _S.binary("-", _S.invoke(_S.read(_v36, "Math"), "round", [_S.prop(_S.read(_v36, "c"), "x")]), 3), _S.unary("-", 3)])
			_S.invoke(_S.read(_v36, "p"), "glow", [_S.prop(_S.read(_v36, "c"), "x"), _S.unary("-", 2), 6, _S.prop(_S.read(_v36, "C"), 5), 0.25])
			_S.define(_v36, "g", _S.binary("/", _S.binary("%", _S.binary("+", _S.binary("-", _S.read(_v36, "t"), _S.prop(_S.read(_v36, "c"), "restAt")), _S.prop(_S.read(_v36, "c"), "glint")), 0.95), 0.95))
			if _S.truth(_S.binary("<", _S.read(_v36, "g"), 0.2)):
				_S.call_value(_S.read(_v36, "sparkle"), [_S.read(_v36, "p"), _S.binary("-", _S.prop(_S.read(_v36, "c"), "x"), 1), _S.unary("-", 3), _S.invoke(_S.read(_v36, "Math"), "round", [_S.binary("*", 3, _S.invoke(_S.read(_v36, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_v36, "g"), 0.2), _S.prop(_S.read(_v36, "Math"), "PI"))]))]), _S.read(_v36, "WHITE"), _S.prop(_S.read(_v36, "C"), 5), 0.4])
		else:
			var _v37 = _S.scope(_v34)
			_S.call_value(_S.read(_v37, "drawCoin"), [_S.read(_v37, "p"), _S.prop(_S.read(_v37, "c"), "x"), _S.prop(_S.read(_v37, "c"), "y"), _S.prop(_S.read(_v37, "c"), "ph")])
			_S.invoke(_S.read(_v37, "p"), "glow", [_S.prop(_S.read(_v37, "c"), "x"), _S.prop(_S.read(_v37, "c"), "y"), 8, _S.prop(_S.read(_v37, "C"), 4), 0.3])
			if _S.truth(_S.binary(">", _S.invoke(_S.read(_v37, "Math"), "abs", [_S.invoke(_S.read(_v37, "Math"), "cos", [_S.prop(_S.read(_v37, "c"), "ph")])]), 0.96)):
				_S.invoke(_S.read(_v37, "p"), "px", [_S.binary("-", _S.prop(_S.read(_v37, "c"), "x"), 1), _S.binary("-", _S.prop(_S.read(_v37, "c"), "y"), 2), _S.read(_v37, "WHITE")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
