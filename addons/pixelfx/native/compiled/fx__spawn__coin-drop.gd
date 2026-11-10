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

static func _f1(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_COIN = _S.read(_parent,"COIN")
	var _n_PAL = _S.read(_parent,"PAL")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_ph_b3 = _S.arg(_args,3)
	var _n_c_b4 = cos(_n_ph_b3)
	var _n_sx_b5 = absf(_n_c_b4)
	if _S.truth((_n_sx_b5 < 0.28)):
		if true:
			var _n_dy_b7 = (-3)
			while _S.truth((_n_dy_b7 <= 3)):
				_S.invoke(_n_p_b0,"px",[_n_x_b1, (_n_y_b2 + _n_dy_b7), (_S.index_value(_n_C,1) if _S.truth(_S.binary("===",absf(_n_dy_b7),3)) else (_S.index_value(_n_C,6) if _S.truth((_n_dy_b7 < 0)) else _S.index_value(_n_C,5)))])
				_n_dy_b7 += 1.0
		if _S.truth((_n_sx_b5 > 0.12)):
			if true:
				var _n_dy_b8 = (-2)
				while _S.truth((_n_dy_b8 <= 2)):
					_S.invoke(_n_p_b0,"px",[(_n_x_b1 + (1 if _S.truth((_n_c_b4 > 0)) else (-1))), (_n_y_b2 + _n_dy_b8), _S.index_value(_n_C,3)])
					_n_dy_b8 += 1.0
		return null
	var _n_half_b6 = (4 * _n_sx_b5)
	if true:
		var _n_px_b9 = floori((_n_x_b1 - _n_half_b6))
		while _S.truth((_n_px_b9 < ceili((_n_x_b1 + _n_half_b6)))):
			var _n_col_b10 = floori(((float(((_n_px_b9 + 0.5) - _n_x_b1))/_n_sx_b5) + 4))
			if _S.truth(((_n_col_b10 < 0) if _S.truth((_n_col_b10 < 0)) else (_n_col_b10 > 7))):
				_n_px_b9 += 1.0
				continue
			if _S.truth((_n_c_b4 < 0)):
				_n_col_b10 = (7 - _n_col_b10)
			if true:
				var _n_row_b11 = 0
				while _S.truth((_n_row_b11 < 8)):
					var _n_ch_b12 = _S.index_value(_S.index_value(_n_COIN,_n_row_b11),_n_col_b10)
					if _S.truth(_S.binary("!==",_n_ch_b12,".")):
						_S.invoke(_n_p_b0,"px",[_n_px_b9, floori(((_n_y_b2 - 4) + _n_row_b11)+0.5), _S.index_value(_n_PAL,_n_ch_b12)])
					_n_row_b11 += 1.0
			_n_px_b9 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	return 0
	return null

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

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_C = _S.read(_parent,"C")
	var _n_coins = _S.read(_parent,"coins")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_coins):
		var _n_c_b1 = _iter_0
		if _S.truth(((_n_t < _S.named_value(_n_c_b1,"out")) if _S.truth(_S.named_value(_n_c_b1,"rest")) else _S.named_value(_n_c_b1,"rest"))):
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_c_b1,"x"), (-1), 7, _S.index_value(_n_C,4), 0.18])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_SM = _S.read(_parent,"SM")
	var _n_CY = _S.read(_parent,"CY")
	var _n_balls = _S.read(_parent,"balls")
	var _n_t = _S.read(_parent,"t")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_flare = _S.read(_parent,"flare")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_FLAT = _S.read(_parent,"FLAT")
	var _n_PAL = _S.read(_parent,"PAL")
	var _n_drawCoin = _S.read(_parent,"drawCoin")
	var _n_coins = _S.read(_parent,"coins")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array([0, 1, 2]):
		var _n_layer_b1 = _iter_0
		for _iter_1 in _S.array(_n_balls):
			var _n_b_b2 = _iter_1
			var _n_age_b3 = (_S.named_value(_n_b_b2,"max") - _S.named_value(_n_b_b2,"life"))
			var _n_k_b4 = (float(_S.named_value(_n_b_b2,"life"))/_S.named_value(_n_b_b2,"max"))
			var _n_r_b5 = ((_S.named_value(_n_b_b2,"r") * (0.6 + (0.6 * _S.invoke(_n_ease,"outCubic",[clampf((float(_n_age_b3)/0.2),0.0,1.0)])))) * ((float(_n_k_b4)/0.35) if _S.truth((_n_k_b4 < 0.35)) else 1))
			if _S.truth((_n_r_b5 < 0.6)):
				continue
			if _S.truth(_S.binary("===",_n_layer_b1,0)):
				_S.invoke(_n_p_b0,"disc",[(_S.named_value(_n_b_b2,"x") + (_n_r_b5 * 0.15)), (_S.named_value(_n_b_b2,"y") + (_n_r_b5 * 0.2)), _n_r_b5, _S.index_value(_n_SM,1), 0.8])
			else:
				if _S.truth(_S.binary("===",_n_layer_b1,1)):
					_S.invoke(_n_p_b0,"disc",[(_S.named_value(_n_b_b2,"x") - (_n_r_b5 * 0.06)), (_S.named_value(_n_b_b2,"y") - (_n_r_b5 * 0.08)), (_n_r_b5 * 0.86), (_S.index_value(_n_SM,1) if _S.truth((_S.named_value(_n_b_b2,"y") > (_n_CY + 2))) else _S.index_value(_n_SM,2)), 0.85])
				else:
					if _S.truth((_S.named_value(_n_b_b2,"y") < (_n_CY + 2))):
						_S.invoke(_n_p_b0,"disc",[(_S.named_value(_n_b_b2,"x") - (_n_r_b5 * 0.28)), (_S.named_value(_n_b_b2,"y") - (_n_r_b5 * 0.34)), (_n_r_b5 * 0.4), _S.index_value(_n_SM,3), 0.85])
	if _S.truth((_n_t < 0.07)):
		var _n_k_b6 = (float(_n_t)/0.07)
		_S.invoke(_n_p_b0,"circle",[0, _n_CY, (8 + (2 * _n_k_b6)), _S.index_value(_n_C,6)])
		_S.invoke(_n_p_b0,"circle",[0, _n_CY, (6 + (2 * _n_k_b6)), _n_WHITE])
		_S.call_value(_n_flare,[_n_p_b0, 0, _n_CY, (16 * (1 - (_n_k_b6 * 0.5))), (1 - _n_k_b6), _n_C])
	for _iter_2 in _S.array(_n_coins):
		var _n_c_b7 = _iter_2
		if _S.truth(((_n_t < _S.named_value(_n_c_b7,"born")) if _S.truth((_n_t < _S.named_value(_n_c_b7,"born"))) else (_n_t > (_S.named_value(_n_c_b7,"out") + 0.12)))):
			continue
		if _S.truth((_n_t > _S.named_value(_n_c_b7,"out"))):
			var _n_k_b8 = (float((_n_t - _S.named_value(_n_c_b7,"out")))/0.12)
			_S.call_value(_n_sparkle,[_n_p_b0, _S.named_value(_n_c_b7,"x"), (-2), floori((5 * (1 - _n_k_b8))+0.5), _n_WHITE, _S.index_value(_n_C,5), 0.5])
			_S.invoke(_n_p_b0,"ring",[_S.named_value(_n_c_b7,"x"), (-3), (2 + (5 * _S.invoke(_n_ease,"outCubic",[_n_k_b8]))), 1, _S.index_value(_n_C,6), (1.1 - _n_k_b8)])
			continue
		if _S.truth(_S.named_value(_n_c_b7,"rest")):
			_S.invoke(_n_p_b0,"sprite",[_n_FLAT, _n_PAL, (floori(_S.named_value(_n_c_b7,"x")+0.5) - 3), (-3)])
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_c_b7,"x"), (-2), 6, _S.index_value(_n_C,5), 0.25])
			var _n_g_b9 = (float(fmod(((_n_t - _S.named_value(_n_c_b7,"restAt")) + _S.named_value(_n_c_b7,"glint")),0.95))/0.95)
			if _S.truth((_n_g_b9 < 0.2)):
				_S.call_value(_n_sparkle,[_n_p_b0, (_S.named_value(_n_c_b7,"x") - 1), (-3), floori((3 * sin(((float(_n_g_b9)/0.2) * PI)))+0.5), _n_WHITE, _S.index_value(_n_C,5), 0.4])
		else:
			_S.call_value(_n_drawCoin,[_n_p_b0, _S.named_value(_n_c_b7,"x"), _S.named_value(_n_c_b7,"y"), _S.named_value(_n_c_b7,"ph")])
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_c_b7,"x"), _S.named_value(_n_c_b7,"y"), 8, _S.index_value(_n_C,4), 0.3])
			if _S.truth((absf(cos(_S.named_value(_n_c_b7,"ph"))) > 0.96)):
				_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_c_b7,"x") - 1), (_S.named_value(_n_c_b7,"y") - 2), _n_WHITE])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
