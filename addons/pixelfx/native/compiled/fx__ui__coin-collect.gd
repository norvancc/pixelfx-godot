@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/coin-collect.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "spell", _S.import_value("fx/ui/_lib.js", "spell"))
	_S.define(_e, "drawWord", _S.import_value("fx/ui/_lib.js", "drawWord"))
	_S.define(_e, "panel", _S.import_value("fx/ui/_lib.js", "panel"))
	_S.define(_e, "coin", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Coin collect"}, {"desc": "A coin bursts into a fountain of spinning coins that hang, then zip one by one into a HUD counter that pops and ticks up, glints and folds away."}, {"tags": ["ui", "coins", "pickup", "reward", "hud", "counter", "one-shot"]}, {"size": [176, 116]}, {"origin": [60, 102]}, {"duration": 2.45}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#2a1405", "#5c3008", "#9a5a0e", "#d48e18", "#f5b92c", "#ffde5e", "#fff4bc", "#ffffff"]}, {"count": 10}, {"from": 12}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "POP", 0.3)
	_S.define(_e, "FLY0", 0.58)
	_S.define(_e, "GAP", 0.075)
	_S.define(_e, "FLY", 0.28)
	_S.define(_e, "FOLD", 2)
	_S.define(_e, "CY", _S.unary("-", 16))
	_S.define(_e, "HX", 50)
	_S.define(_e, "HY", _S.unary("-", 88))
	_S.define(_e, "HW", 60)
	_S.define(_e, "HH", 22)
	_S.define(_e, "IX", _S.binary("+", _S.read(_e, "HX"), 12))
	_S.define(_e, "IY", _S.binary("+", _S.read(_e, "HY"), 11))
	_S.define(_e, "INK", _S.merge([{"outline": _S.call_value(_S.read(_e, "hex"), ["#0d0a14"])}, {"rim": _S.call_value(_S.read(_e, "hex"), ["#4a4060"])}, {"top": _S.call_value(_S.read(_e, "hex"), ["#2a2338"])}, {"body": _S.call_value(_S.read(_e, "hex"), ["#1e1929"])}, {"low": _S.call_value(_S.read(_e, "hex"), ["#141019"])}]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_r_b4 = _S.arg(_args,4)
	var _n_w_b5 = _S.arg(_args,5)
	var _n_white_b6 = _S.coalesce(_S.arg(_args,6),func():return false)
	var _n_rx_b7 = maxf(0.7,(_n_r_b4 * _n_w_b5))
	var _n_ry_b8 = _n_r_b4
	_S.invoke(_n_p_b0,"shade",[((_n_x_b2 - _n_rx_b7) - 1), ((_n_y_b3 - _n_ry_b8) - 1), ((_n_x_b2 + _n_rx_b7) + 1), ((_n_y_b3 + _n_ry_b8) + 1), _S.function_value(_S.capture(_parent,{"x":_n_x_b2,"rx":_n_rx_b7,"y":_n_y_b3,"ry":_n_ry_b8,"white":_n_white_b6,"C":_n_C_b1,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_rx = _S.read(_parent,"rx")
	var _n_y = _S.read(_parent,"y")
	var _n_ry = _S.read(_parent,"ry")
	var _n_white = _S.read(_parent,"white")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_u_b2 = (float((_n_px_b0 - _n_x))/_n_rx)
	var _n_v_b3 = (float((_n_py_b1 - _n_y))/_n_ry)
	var _n_d_b4 = _S.Bridge.hypot([_n_u_b2, _n_v_b3])
	if _S.truth((_n_d_b4 > 1)):
		return null
	var _n_e_b5 = ((1 - _n_d_b4) * minf((_n_rx * 1.6),_n_ry))
	if _S.truth(_n_white):
		return (_S.index_value(_n_C,6) if _S.truth((_n_e_b5 < 1)) else _n_WHITE)
	if _S.truth((_n_e_b5 < 1)):
		return _S.index_value(_n_C,1)
	if _S.truth((_n_rx < 2)):
		return (_S.index_value(_n_C,6) if _S.truth((_n_v_b3 < (-0.2))) else (_S.index_value(_n_C,4) if _S.truth((_n_v_b3 < 0.4)) else _S.index_value(_n_C,3)))
	if _S.truth((_n_e_b5 < 2)):
		return (_S.index_value(_n_C,6) if _S.truth(((_n_u_b2 + _n_v_b3) < (-0.2))) else _S.index_value(_n_C,3))
	if _S.truth(_S.logical("&&",(absf((_n_px_b0 - _n_x)) < 0.55),func():return (absf(_n_v_b3) < 0.5))):
		return _S.index_value(_n_C,3)
	if _S.truth(((absf(_n_v_b3) < 0.5) if _S.truth((((_n_px_b0 - _n_x) < 1.55) if _S.truth(((_n_px_b0 - _n_x) >= 0.55)) else ((_n_px_b0 - _n_x) >= 0.55))) else (((_n_px_b0 - _n_x) < 1.55) if _S.truth(((_n_px_b0 - _n_x) >= 0.55)) else ((_n_px_b0 - _n_x) >= 0.55)))):
		return _S.index_value(_n_C,7)
	var _n_l_b6 = (-((_n_u_b2 * 0.6) + (_n_v_b3 * 0.8)))
	return (_S.index_value(_n_C,7) if _S.truth((_n_l_b6 > 0.4)) else (_S.index_value(_n_C,6) if _S.truth((_n_l_b6 > 0.05)) else (_S.index_value(_n_C,5) if _S.truth((_n_l_b6 > (-0.35))) else _S.index_value(_n_C,4))))
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "N", _S.call_value(_S.read(_e, "clamp"), [_S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "o"), "count")]), 1, 12]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f3")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	_S.define(_e, "coins", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "N")}]), _S.function_value(_e, "_f4")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	_S.define(_e, "count", _S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "o"), "from")]))
	_S.define(_e, "bump", 0)
	_S.define(_e, "flash", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f3(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_N = _S.read(_parent,"N")
	var _n_CY = _S.read(_parent,"CY")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_FLY0 = _S.read(_parent,"FLY0")
	var _n_GAP = _S.read(_parent,"GAP")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_s_b2 = (((float(_n_i_b1)/maxf(1,(_n_N - 1))) * 2) - 1)
	return {"x":0,"y":_n_CY,"vx":((_n_s_b2 * _S.invoke(_n_R,"range",[55, 90])) + _S.invoke(_n_R,"range",[(-12), 12])),"vy":(-_S.invoke(_n_R,"range",[170, 285])),"ph":_S.invoke(_n_R,"range",[0, _n_TAU]),"spin":(_S.invoke(_n_R,"range",[9, 14]) * _S.invoke(_n_R,"sign",[])),"state":0,"t0":(_n_FLY0 + (_n_i_b1 * _n_GAP)),"fx":0,"fy":0,"trail":[],"bob":_S.invoke(_n_R,"range",[0, _n_TAU])}
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")))):
		var _v0 = _S.scope(_e)
		_S.write(_v0, "popped", true, "=", false)
		_S.invoke(_S.read(_v0, "lights"), "add", [0, _S.read(_v0, "CY"), 46, _S.read(_v0, "WHITE"), 0.8, 0.14])
		_S.invoke(_S.read(_v0, "lights"), "add", [0, _S.read(_v0, "CY"), 48, _S.prop(_S.read(_v0, "C"), 5), 0.6, 0.5])
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), 14)):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v2, "i"), 14), _S.read(_v2, "TAU")), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 0.2), 0.2])))
			_S.define(_v2, "sp", _S.invoke(_S.read(_v2, "R"), "range", [80, 170]))
			_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "an")]), 3), _S.binary("+", _S.read(_v2, "CY"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "an")]), 3)), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "an")]), _S.read(_v2, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "an")]), _S.read(_v2, "sp")), 30), _S.invoke(_S.read(_v2, "R"), "range", [0.15, 0.35])])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
		var _v3 = _S.scope(_v0)
		_S.define(_v3, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "i"), 4)):
			_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "DUST"), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v3, "R"), "sign", []), _S.invoke(_S.read(_v3, "R"), "range", [15, 40])), _S.unary("-", _S.invoke(_S.read(_v3, "R"), "range", [2, 8])), _S.invoke(_S.read(_v3, "R"), "range", [0.3, 0.5]), _S.call_value(_S.read(_v3, "hex"), ["#5a4f6e"]), _S.invoke(_S.read(_v3, "R"), "range", [1.5, 2.5])])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
		var _v4 = _S.scope(_v0)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), 10)):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v5, "i"), 10), _S.read(_v5, "TAU")), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 0.2), 0.2])))
			_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "R"), "range", [70, 130]))
			_S.define(_v5, "down", (0.25 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "an")]), 0)) else 1))
			_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "an")]), 6), _S.binary("+", _S.read(_v5, "CY"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "an")]), 6)), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "an")]), _S.read(_v5, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "an")]), _S.read(_v5, "sp")), _S.read(_v5, "down")), _S.invoke(_S.read(_v5, "R"), "range", [0.35, 0.6]), _S.invoke(_S.read(_v5, "R"), "pick", [[_S.prop(_S.read(_v5, "C"), 7), _S.prop(_S.read(_v5, "C"), 6), _S.prop(_S.read(_v5, "C"), 5)]]), (0.6 if _S.truth(_S.binary("%", _S.read(_v5, "i"), 3)) else _S.invoke(_S.read(_v5, "R"), "range", [1.2, 2]))])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
	for _v6 in _S.array(_S.read(_e, "coins")):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "c", _v6)
		var _v8 = _S.scope(_v7)
		if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v8, "popped")), func(): return _S.binary("===", _S.prop(_S.read(_v8, "c"), "state"), 3))):
			continue
		_S.set_prop(_S.read(_v8, "c"), "ph", _S.binary("*", _S.prop(_S.read(_v8, "c"), "spin"), _S.read(_v8, "dt")), "+=", false)
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v8, "c"), "state"), 2)):
			var _v9 = _S.scope(_v8)
			if _S.truth(_S.binary("===", _S.prop(_S.read(_v9, "c"), "state"), 0)):
				var _v10 = _S.scope(_v9)
				_S.set_prop(_S.read(_v10, "c"), "vy", _S.binary("*", 640, _S.read(_v10, "dt")), "+=", false)
				_S.set_prop(_S.read(_v10, "c"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v10, "c"), "vx"), 2.2), _S.read(_v10, "dt")), "-=", false)
				if _S.truth(_S.binary(">", _S.prop(_S.read(_v10, "c"), "vy"), 0)):
					_S.set_prop(_S.read(_v10, "c"), "state", 1, "=", false)
			else:
				_S.last([_S.set_prop(_S.read(_v9, "c"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v9, "c"), "vy"), 7), _S.read(_v9, "dt")), "-=", false), _S.set_prop(_S.read(_v9, "c"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v9, "c"), "vx"), 4), _S.read(_v9, "dt")), "-=", false)])
			_S.set_prop(_S.read(_v9, "c"), "x", _S.binary("*", _S.prop(_S.read(_v9, "c"), "vx"), _S.read(_v9, "dt")), "+=", false)
			_S.set_prop(_S.read(_v9, "c"), "y", _S.binary("*", _S.prop(_S.read(_v9, "c"), "vy"), _S.read(_v9, "dt")), "+=", false)
			if _S.truth(_S.binary(">=", _S.read(_v9, "t"), _S.prop(_S.read(_v9, "c"), "t0"))):
				_S.last([_S.set_prop(_S.read(_v9, "c"), "state", 2, "=", false), _S.set_prop(_S.read(_v9, "c"), "fx", _S.prop(_S.read(_v9, "c"), "x"), "=", false), _S.set_prop(_S.read(_v9, "c"), "fy", _S.binary("+", _S.prop(_S.read(_v9, "c"), "y"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v9, "t"), 6), _S.prop(_S.read(_v9, "c"), "bob"))]), 1.5)), "=", false)])
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v8, "c"), "state"), 2)):
			var _v11 = _S.scope(_v8)
			_S.define(_v11, "u", _S.call_value(_S.read(_v11, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v11, "t"), _S.prop(_S.read(_v11, "c"), "t0")), _S.read(_v11, "FLY"))]))
			_S.define(_v11, "e", _S.binary("*", _S.read(_v11, "u"), _S.read(_v11, "u")))
			_S.define(_v11, "mx", _S.binary("+", _S.prop(_S.read(_v11, "c"), "fx"), _S.binary("*", _S.binary("-", _S.read(_v11, "IX"), _S.prop(_S.read(_v11, "c"), "fx")), 0.35)))
			_S.define(_v11, "my", _S.binary("-", _S.invoke(_S.read(_v11, "Math"), "min", [_S.prop(_S.read(_v11, "c"), "fy"), _S.read(_v11, "IY")]), 26))
			_S.set_prop(_S.read(_v11, "c"), "x", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_v11, "e")), _S.binary("-", 1, _S.read(_v11, "e"))), _S.prop(_S.read(_v11, "c"), "fx")), _S.binary("*", _S.binary("*", _S.binary("*", 2, _S.binary("-", 1, _S.read(_v11, "e"))), _S.read(_v11, "e")), _S.read(_v11, "mx"))), _S.binary("*", _S.binary("*", _S.read(_v11, "e"), _S.read(_v11, "e")), _S.read(_v11, "IX"))), "=", false)
			_S.set_prop(_S.read(_v11, "c"), "y", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_v11, "e")), _S.binary("-", 1, _S.read(_v11, "e"))), _S.prop(_S.read(_v11, "c"), "fy")), _S.binary("*", _S.binary("*", _S.binary("*", 2, _S.binary("-", 1, _S.read(_v11, "e"))), _S.read(_v11, "e")), _S.read(_v11, "my"))), _S.binary("*", _S.binary("*", _S.read(_v11, "e"), _S.read(_v11, "e")), _S.read(_v11, "IY"))), "=", false)
			_S.invoke(_S.prop(_S.read(_v11, "c"), "trail"), "unshift", [[_S.prop(_S.read(_v11, "c"), "x"), _S.prop(_S.read(_v11, "c"), "y")]])
			if _S.truth(_S.binary(">", _S.prop(_S.prop(_S.read(_v11, "c"), "trail"), "length"), 7)):
				_S.invoke(_S.prop(_S.read(_v11, "c"), "trail"), "pop", [])
			if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.25])):
				_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v11, "c"), "x"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("+", _S.prop(_S.read(_v11, "c"), "y"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 2), 2])), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 8), 8]), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 4), 10]), _S.invoke(_S.read(_v11, "R"), "range", [0.2, 0.4]), _S.invoke(_S.read(_v11, "R"), "pick", [[_S.prop(_S.read(_v11, "C"), 7), _S.prop(_S.read(_v11, "C"), 6)]]), 0.6])
			if _S.truth(_S.binary(">=", _S.read(_v11, "u"), 1)):
				var _v12 = _S.scope(_v11)
				_S.set_prop(_S.read(_v12, "c"), "state", 3, "=", false)
				_S.write(_v12, "count", 1, "+=", true)
				_S.write(_v12, "bump", 1, "=", false)
				_S.write(_v12, "flash", 1, "=", false)
				_S.invoke(_S.read(_v12, "lights"), "add", [_S.read(_v12, "IX"), _S.read(_v12, "IY"), 26, _S.prop(_S.read(_v12, "C"), 5), 0.6, 0.25])
				var _v13 = _S.scope(_v12)
				_S.define(_v13, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v13, "i"), 3)):
					var _v14 = _S.scope(_v13)
					_S.define(_v14, "an", _S.invoke(_S.read(_v14, "R"), "range", [0, _S.read(_v14, "TAU")]))
					_S.define(_v14, "sp", _S.invoke(_S.read(_v14, "R"), "range", [18, 40]))
					_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "STAR"), _S.binary("+", _S.read(_v14, "IX"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "an")]), 5)), _S.binary("+", _S.read(_v14, "IY"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "an")]), 5)), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "an")]), _S.read(_v14, "sp")), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "an")]), _S.read(_v14, "sp")), _S.invoke(_S.read(_v14, "Math"), "min", [_S.invoke(_S.read(_v14, "R"), "range", [0.25, 0.45]), _S.binary("-", _S.read(_v14, "end"), _S.read(_v14, "t"))]), _S.invoke(_S.read(_v14, "R"), "pick", [[_S.prop(_S.read(_v14, "C"), 7), _S.prop(_S.read(_v14, "C"), 6)]]), (0.6 if _S.truth(_S.read(_v14, "i")) else _S.invoke(_S.read(_v14, "R"), "range", [1.2, 1.8]))])
					_v13 = _S.iteration(_v13)
					_S.write(_v13, "i", 1, "+=", true)
	_S.write(_e, "bump", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "bump"), _S.binary("/", _S.read(_e, "dt"), 0.14))]), "=", false)
	_S.write(_e, "flash", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "flash"), _S.binary("/", _S.read(_e, "dt"), 0.07))]), "=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_POP = _S.read(_parent,"POP")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_band = _S.read(_parent,"band")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = (float((_n_t - _n_POP))/0.45)
	if _S.truth(((_n_k_b1 < 1) if _S.truth((_n_k_b1 > 0)) else (_n_k_b1 > 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (4 + (34 * _S.invoke(_n_ease,"outCubic",[_n_k_b1]))), 0.22, maxf(1,(3 * (1 - _n_k_b1))), (1.15 - _n_k_b1), _n_C, _S.function_value(_S.capture(_parent,{"this":_this}),"_f7")])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), 0.45))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 4, _S.binary("*", 34, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))), 0.22, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), _S.read(_e, "C"), _S.function_value(_e, "_f9")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POP"), 0.02))):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "y", _S.binary("+", _S.read(_v15, "CY"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.binary("*", _S.read(_v15, "t"), 9)]), 1.5)))
		_S.define(_v15, "w", _S.invoke(_S.read(_v15, "Math"), "abs", [_S.invoke(_S.read(_v15, "Math"), "cos", [_S.binary("*", _S.read(_v15, "t"), 7)])]))
		_S.invoke(_S.read(_v15, "p"), "ellipse", [0, 0.5, _S.binary("-", 6, _S.binary("*", 0.5, _S.invoke(_S.read(_v15, "Math"), "sin", [_S.binary("*", _S.read(_v15, "t"), 9)]))), 1.3, _S.call_value(_S.read(_v15, "hex"), ["#0d0a14"]), 0.6])
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v16, "i"), 2)):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "an", _S.binary("+", _S.binary("*", _S.read(_v17, "t"), 7), _S.binary("*", _S.read(_v17, "i"), _S.prop(_S.read(_v17, "Math"), "PI"))))
			_S.define(_v17, "ox", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "an")]), 11))
			_S.define(_v17, "oy", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "an")]), 3))
			if _S.truth(_S.binary("<", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "an")]), 0)):
				_S.invoke(_S.read(_v17, "p"), "px", [_S.read(_v17, "ox"), _S.binary("+", _S.read(_v17, "y"), _S.read(_v17, "oy")), _S.prop(_S.read(_v17, "C"), 4)])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
		_S.call_value(_S.read(_v15, "coin"), [_S.read(_v15, "p"), _S.read(_v15, "C"), 0, _S.read(_v15, "y"), 7, _S.invoke(_S.read(_v15, "Math"), "max", [0.12, _S.read(_v15, "w")]), _S.binary(">", _S.read(_v15, "t"), _S.binary("-", _S.read(_v15, "POP"), 0.04))])
		var _v18 = _S.scope(_v15)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), 2)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "an", _S.binary("+", _S.binary("*", _S.read(_v19, "t"), 7), _S.binary("*", _S.read(_v19, "i"), _S.prop(_S.read(_v19, "Math"), "PI"))))
			_S.define(_v19, "ox", _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "an")]), 11))
			_S.define(_v19, "oy", _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "an")]), 3))
			if _S.truth(_S.binary(">=", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "an")]), 0)):
				_S.last([_S.invoke(_S.read(_v19, "p"), "px", [_S.read(_v19, "ox"), _S.binary("+", _S.read(_v19, "y"), _S.read(_v19, "oy")), _S.prop(_S.read(_v19, "C"), 7)]), _S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "ox"), _S.binary("+", _S.read(_v19, "y"), _S.read(_v19, "oy")), 4, _S.prop(_S.read(_v19, "C"), 5), 0.4])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
		_S.invoke(_S.read(_v15, "p"), "glow", [0, _S.read(_v15, "y"), 20, _S.prop(_S.read(_v15, "C"), 5), _S.binary("+", 0.45, _S.binary("*", 0.4, _S.call_value(_S.read(_v15, "seg"), [_S.read(_v15, "t"), _S.binary("-", _S.read(_v15, "POP"), 0.15), _S.read(_v15, "POP")])))])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v15, "t"), 0.06), func(): return _S.binary("<", _S.read(_v15, "t"), 0.2))):
			_S.call_value(_S.read(_v15, "sparkle"), [_S.read(_v15, "p"), _S.unary("-", 3), _S.binary("-", _S.read(_v15, "y"), 3), _S.binary("*", 3.5, _S.invoke(_S.read(_v15, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v15, "t"), 0.06), 0.14), _S.prop(_S.read(_v15, "Math"), "PI"))])), _S.prop(_S.read(_v15, "C"), 7), _S.prop(_S.read(_v15, "C"), 6), 0.4])
	_S.define(_e, "pk", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), 0.1))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "pk"), 0), func(): return _S.binary("<", _S.read(_e, "pk"), 1))):
		_S.invoke(_S.read(_e, "p"), "circle", [0, _S.read(_e, "CY"), _S.binary("+", _S.binary("*", 13, _S.binary("-", 1, _S.read(_e, "pk"))), 1), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "pk"), 0.5)) else _S.prop(_S.read(_e, "C"), 6))])
	_S.define(_e, "fk", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), 0.2))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "fk"), 0), func(): return _S.binary("<", _S.read(_e, "fk"), 1))):
		_S.call_value(_S.read(_e, "flare"), [_S.read(_e, "p"), 0, _S.read(_e, "CY"), _S.binary("*", 26, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "fk")), 1.5])), _S.binary("-", 1, _S.read(_e, "fk")), _S.read(_e, "C")])
	_S.define(_e, "rk", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), 0.03), 0.35))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "rk"), 0), func(): return _S.binary("<", _S.read(_e, "rk"), 1))):
		_S.invoke(_S.read(_e, "p"), "ring", [0, _S.read(_e, "CY"), _S.binary("+", 6, _S.binary("*", 22, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "rk")]))), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 2, _S.binary("-", 1, _S.read(_e, "rk")))]), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "rk"), 0.3)) else _S.prop(_S.read(_e, "C"), 6)), _S.binary("-", 1.2, _S.read(_e, "rk"))])
	for _v20 in _S.array(_S.read(_e, "coins")):
		var _v21 = _S.scope(_e)
		_S.define(_v21, "c", _v20)
		var _v22 = _S.scope(_v21)
		if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v22, "popped")), func(): return _S.binary("===", _S.prop(_S.read(_v22, "c"), "state"), 3))):
			continue
		_S.invoke(_S.prop(_S.read(_v22, "c"), "trail"), "forEach", [_S.function_value(_v22, "_f10")])
		_S.define(_v22, "hover", (_S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v22, "t"), 6), _S.prop(_S.read(_v22, "c"), "bob"))]), 1.5) if _S.truth(_S.binary("===", _S.prop(_S.read(_v22, "c"), "state"), 1)) else 0))
		_S.define(_v22, "w", _S.invoke(_S.read(_v22, "Math"), "abs", [_S.invoke(_S.read(_v22, "Math"), "cos", [_S.prop(_S.read(_v22, "c"), "ph")])]))
		_S.call_value(_S.read(_v22, "coin"), [_S.read(_v22, "p"), _S.read(_v22, "C"), _S.prop(_S.read(_v22, "c"), "x"), _S.binary("+", _S.prop(_S.read(_v22, "c"), "y"), _S.read(_v22, "hover")), 5, _S.invoke(_S.read(_v22, "Math"), "max", [0.15, _S.read(_v22, "w")])])
		_S.invoke(_S.read(_v22, "p"), "glow", [_S.prop(_S.read(_v22, "c"), "x"), _S.binary("+", _S.prop(_S.read(_v22, "c"), "y"), _S.read(_v22, "hover")), 10, _S.prop(_S.read(_v22, "C"), 5), (0.5 if _S.truth(_S.binary("===", _S.prop(_S.read(_v22, "c"), "state"), 2)) else 0.32)])
		_S.define(_v22, "gl", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_v22, "t"), 1.7), _S.prop(_S.read(_v22, "c"), "bob")), 1))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("===", _S.prop(_S.read(_v22, "c"), "state"), 1), func(): return _S.binary("<", _S.read(_v22, "gl"), 0.12)), func(): return _S.binary(">", _S.read(_v22, "w"), 0.5))):
			_S.call_value(_S.read(_v22, "sparkle"), [_S.read(_v22, "p"), _S.binary("-", _S.prop(_S.read(_v22, "c"), "x"), 1), _S.binary("-", _S.binary("+", _S.prop(_S.read(_v22, "c"), "y"), _S.read(_v22, "hover")), 2), _S.binary("*", 3, _S.invoke(_S.read(_v22, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_v22, "gl"), 0.12), _S.prop(_S.read(_v22, "Math"), "PI"))])), _S.prop(_S.read(_v22, "C"), 7), _S.prop(_S.read(_v22, "C"), 6), 0.4])
	_S.define(_e, "open", _S.binary("*", _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), 0.06, 0.26]), 2.2]), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inBack", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "FOLD"), _S.binary("+", _S.read(_e, "FOLD"), 0.2)]), 2]))))
	if _S.truth(_S.binary(">", _S.read(_e, "open"), 0.04)):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "h", _S.binary("*", _S.read(_v24, "HH"), _S.read(_v24, "open")))
		_S.define(_v24, "y0", _S.binary("+", _S.read(_v24, "HY"), _S.binary("/", _S.binary("-", _S.read(_v24, "HH"), _S.read(_v24, "h")), 2)))
		_S.define(_v24, "sh", _S.call_value(_S.read(_v24, "seg"), [_S.read(_v24, "t"), 1.5, 1.76]))
		_S.call_value(_S.read(_v24, "panel"), [_S.read(_v24, "p"), _S.read(_v24, "HX"), _S.read(_v24, "y0"), _S.read(_v24, "HW"), _S.read(_v24, "h"), _S.read(_v24, "INK"), _S.merge([{"r": _S.invoke(_S.read(_v24, "Math"), "min", [4, _S.binary("/", _S.read(_v24, "h"), 2)])}, {"shine": (_S.binary("+", _S.binary("-", _S.read(_v24, "HX"), 6), _S.binary("*", _S.binary("+", _S.read(_v24, "HW"), 16), _S.read(_v24, "sh"))) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v24, "sh"), 0), func(): return _S.binary("<", _S.read(_v24, "sh"), 1))) else null)}])])
		if _S.truth(_S.binary(">", _S.read(_v24, "open"), 0.7)):
			var _v25 = _S.scope(_v24)
			_S.call_value(_S.read(_v25, "coin"), [_S.read(_v25, "p"), _S.read(_v25, "C"), _S.read(_v25, "IX"), _S.read(_v25, "IY"), _S.binary("*", 5.5, _S.binary("+", 1, _S.binary("*", 0.3, _S.read(_v25, "bump")))), 1, _S.binary(">", _S.read(_v25, "flash"), 0.5)])
			_S.invoke(_S.read(_v25, "p"), "glow", [_S.read(_v25, "IX"), _S.read(_v25, "IY"), 14, _S.prop(_S.read(_v25, "C"), 5), _S.binary("+", 0.25, _S.binary("*", 0.4, _S.read(_v25, "bump")))])
			if _S.truth(_S.binary(">", _S.read(_v25, "bump"), 0)):
				_S.invoke(_S.read(_v25, "p"), "ring", [_S.read(_v25, "IX"), _S.read(_v25, "IY"), _S.binary("+", 7, _S.binary("*", 8, _S.binary("-", 1, _S.read(_v25, "bump")))), 1, (_S.read(_v25, "WHITE") if _S.truth(_S.binary(">", _S.read(_v25, "bump"), 0.6)) else _S.prop(_S.read(_v25, "C"), 6)), _S.binary("*", _S.read(_v25, "bump"), 1.3)])
			_S.define(_v25, "s", _S.binary("*", 2, _S.binary("+", 1, _S.binary("*", 0.22, _S.read(_v25, "bump")))))
			_S.define(_v25, "str", _S.binary("+", "x", _S.read(_v25, "count")))
			_S.define(_v25, "word", _S.call_value(_S.read(_v25, "spell"), [_S.read(_v25, "str")]))
			_S.define(_v25, "W", _S.binary("*", _S.prop(_S.read(_v25, "word"), "w"), _S.read(_v25, "s")))
			_S.define(_v25, "H", _S.binary("*", 7, _S.read(_v25, "s")))
			_S.define(_v25, "x0", _S.binary("+", _S.read(_v25, "IX"), 9))
			_S.define(_v25, "ty", _S.binary("-", _S.read(_v25, "IY"), _S.binary("/", _S.read(_v25, "H"), 2)))
			_S.define(_v25, "items", _S.invoke(_S.invoke(_S.prop(_S.read(_v25, "word"), "letters"), "filter", [_S.function_value(_v25, "_f11")]), "map", [_S.function_value(_v25, "_f12")]))
			_S.call_value(_S.read(_v25, "drawWord"), [_S.read(_v25, "p"), _S.read(_v25, "items"), _S.merge([{"fill": [_S.prop(_S.read(_v25, "C"), 4), _S.prop(_S.read(_v25, "C"), 5), _S.prop(_S.read(_v25, "C"), 6), _S.prop(_S.read(_v25, "C"), 7)]}, {"edge": _S.read(_v25, "WHITE")}, {"under": _S.prop(_S.read(_v25, "C"), 3)}, {"outline": _S.prop(_S.read(_v25, "INK"), "outline")}, {"shadow": 0}])])
			if _S.truth(_S.binary(">", _S.read(_v25, "bump"), 0)):
				_S.invoke(_S.read(_v25, "p"), "glow", [_S.binary("+", _S.read(_v25, "x0"), _S.binary("/", _S.read(_v25, "W"), 2)), _S.read(_v25, "IY"), 16, _S.prop(_S.read(_v25, "C"), 5), _S.binary("*", 0.3, _S.read(_v25, "bump"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_c = _S.read(_parent,"c")
	var _n_C = _S.read(_parent,"C")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_i_b2 = _S.arg(_args,1)
	return (_S.invoke(_n_p,"line",[_S.index_value(_S.index_value(_S.named_value(_n_c,"trail"),(_n_i_b2 - 1)),0), _S.index_value(_S.index_value(_S.named_value(_n_c,"trail"),(_n_i_b2 - 1)),1), _n_x_b0, _n_y_b1, (_S.index_value(_n_C,6) if _S.truth((_n_i_b2 < 3)) else _S.index_value(_n_C,4)), (1.2 - (float(_n_i_b2)/7))]) if _S.truth((_n_i_b2 > 0)) else (_n_i_b2 > 0))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_L_b0 = _S.arg(_args,0)
	return _S.named_value(_n_L_b0,"g")
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_x0 = _S.read(_parent,"x0")
	var _n_s = _S.read(_parent,"s")
	var _n_ty = _S.read(_parent,"ty")
	var _n_flash = _S.read(_parent,"flash")
	var _n_L_b0 = _S.arg(_args,0)
	return {"g":_S.named_value(_n_L_b0,"g"),"x":(_n_x0 + (_S.named_value(_n_L_b0,"x") * _n_s)),"y":_n_ty,"sx":_n_s,"sy":_n_s,"flash":(1 if _S.truth((_n_flash > 0.5)) else 0)}
	return null
