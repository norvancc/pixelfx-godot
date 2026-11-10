@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/spore-burst.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Gas", _S.import_value("fx/nature/_lib.js", "Gas"))
	_S.define(_e, "toadstool", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Spore burst"}, {"desc": "A toadstool pushes up, swells and trembles as its gills glow, then squashes and puffs a lumpy cloud of glowing spores that billows up and drifts down twinkling."}, {"tags": ["nature", "mushroom", "spores", "poison", "cloud", "ground", "one-shot"]}, {"size": [212, 132]}, {"origin": [106, 118]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#06141c", "#0c2a34", "#11484e", "#17706a", "#22a08a", "#4cd0a8", "#a8f4d0", "#f0fff6"]}, {"cap": ["#1a0c1e", "#3a1438", "#62204e", "#8e3462", "#bc5276", "#e88a96"]}, {"stem": ["#2a2230", "#5a4e5e", "#9a8e98", "#d8ccd0", "#f6eeee"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "GROW", 0.32)
	_S.define(_e, "PUFF", 0.8)
	_S.define(_e, "SINK", 2.15)
	_S.define(_e, "SPOTS", [[_S.unary("-", 0.45), 0.45, 1.4], [0.1, 0.72, 1.8], [0.55, 0.38, 1.2], [_S.unary("-", 0.12), 0.25, 1], [0.3, 0.12, 0.9], [_S.unary("-", 0.7), 0.16, 0.8]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_K_b1 = _S.arg(_args,1)
	var _n_Sm_b2 = _S.arg(_args,2)
	var _n_Cs_b3 = _S.arg(_args,3)
	var _n_g_b4 = _S.arg(_args,4)
	var _n_sx_b5 = _S.arg(_args,5)
	var _n_sy_b6 = _S.arg(_args,6)
	var _n_glow_b7 = _S.arg(_args,7)
	var _n_sink_b8 = _S.arg(_args,8)
	var _n_H_b9 = (17 * _n_g_b4)
	var _n_cw_b10 = ((17 * _n_sx_b5) * _n_g_b4)
	var _n_ch_b11 = ((13 * _n_sy_b6) * _n_g_b4)
	var _n_base_b12 = _n_sink_b8
	var _n_top_b13 = (_n_base_b12 - _n_H_b9)
	if _S.truth((_n_g_b4 < 0.05)):
		return null
	if true:
		var _n_y_b16 = floori(_n_top_b13)
		while _S.truth((_n_y_b16 <= minf(0,_n_base_b12))):
			if true:
				var _n_x_b17 = (-4)
				while _S.truth((_n_x_b17 <= 4)):
					var _n_w_b18 = (3 + ((float((_n_y_b16 - _n_top_b13))/_n_H_b9) * 1))
					if _S.truth((absf((_n_x_b17 + 0.5)) > _n_w_b18)):
						_n_x_b17 += 1.0
						continue
					var _n_q_b19 = (float(((_n_x_b17 + 0.5) + _n_w_b18))/(2 * _n_w_b18))
					_S.invoke(_n_p_b0,"px",[_n_x_b17, _n_y_b16, (_S.index_value(_n_Sm_b2,1) if _S.truth((absf((_n_x_b17 + 0.5)) > (_n_w_b18 - 0.8))) else (_S.index_value(_n_Sm_b2,4) if _S.truth((_n_q_b19 < 0.4)) else (_S.index_value(_n_Sm_b2,3) if _S.truth((_n_q_b19 < 0.7)) else _S.index_value(_n_Sm_b2,2))))])
					_n_x_b17 += 1.0
			_n_y_b16 += 1.0
	var _n_ring_b14 = (_n_top_b13 + (_n_H_b9 * 0.3))
	if _S.truth((_n_ring_b14 <= 0)):
		if true:
			var _n_x_b20 = (-5)
			while _S.truth((_n_x_b20 <= 5)):
				_S.invoke(_n_p_b0,"px",[_n_x_b20, (_n_ring_b14 + (1 if _S.truth((absf(_n_x_b20) > 3)) else 0)), (_S.index_value(_n_Sm_b2,1) if _S.truth((absf(_n_x_b20) > 4)) else _S.index_value(_n_Sm_b2,3))])
				_n_x_b20 += 1.0
	var _n_gy_b15 = (_n_top_b13 + 1)
	if _S.truth((_n_gy_b15 <= 0)):
		if true:
			var _n_x_b21 = floori((-_n_cw_b10))
			while _S.truth((_n_x_b21 <= ceili(_n_cw_b10))):
				var _n_d_b22 = (float(absf((_n_x_b21 + 0.5)))/_n_cw_b10)
				if _S.truth((_n_d_b22 > 0.95)):
					_n_x_b21 += 1.0
					continue
				_S.invoke(_n_p_b0,"px",[_n_x_b21, _n_gy_b15, (_S.index_value(_n_Cs_b3,0) if _S.truth((_n_d_b22 < 0.3)) else (_S.index_value(_n_Sm_b2,2) if _S.truth(_S.binary("&",_n_x_b21,1)) else _S.index_value(_n_Sm_b2,3)))])
				if _S.truth((_n_glow_b7 > 0.05)):
					_S.invoke(_n_p_b0,"px",[_n_x_b21, _n_gy_b15, (_S.index_value(_n_K_b1,7) if _S.truth((_S.binary("&",_n_x_b21,1) if _S.truth((_n_glow_b7 > 0.6)) else (_n_glow_b7 > 0.6))) else _S.index_value(_n_K_b1,5))])
				_n_x_b21 += 1.0
	if _S.truth((_n_glow_b7 > 0.05)):
		_S.invoke(_n_p_b0,"glow",[0, (_n_gy_b15 + 2), ((_n_cw_b10 * 1.5) + 6), _S.index_value(_n_K_b1,5), (0.5 * _n_glow_b7)])
	_S.invoke(_n_p_b0,"shade",[((-_n_cw_b10) - 1), ((_n_top_b13 - _n_ch_b11) - 1), (_n_cw_b10 + 1), (_n_top_b13 + 1), _S.function_value(_S.capture(_parent,{"cw":_n_cw_b10,"top":_n_top_b13,"ch":_n_ch_b11,"Cs":_n_Cs_b3,"g":_n_g_b4,"Sm":_n_Sm_b2,"this":_this}),"_f1")])
	_S.invoke(_n_p_b0,"px",[((-_n_cw_b10) * 0.45), (_n_top_b13 - (_n_ch_b11 * 0.8)), _S.index_value(_n_Cs_b3,5)])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_cw = _S.read(_parent,"cw")
	var _n_top = _S.read(_parent,"top")
	var _n_ch = _S.read(_parent,"ch")
	var _n_Cs = _S.read(_parent,"Cs")
	var _n_g = _S.read(_parent,"g")
	var _n_SPOTS = _S.read(_parent,"SPOTS")
	var _n_Sm = _S.read(_parent,"Sm")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (float(_n_x_b0)/_n_cw)
	var _n_dy_b4 = (float((_n_top - _n_y_b1))/_n_ch)
	var _n_d_b5 = ((_n_dx_b3 * _n_dx_b3) + (_n_dy_b4 * _n_dy_b4))
	if _S.truth((((_n_dy_b4 < (-0.12)) if _S.truth((_n_dy_b4 < (-0.12))) else (_n_d_b5 > 1.12)) if _S.truth(((_n_dy_b4 < (-0.12)) if _S.truth((_n_dy_b4 < (-0.12))) else (_n_d_b5 > 1.12))) else (_n_y_b1 > 0))):
		return null
	if _S.truth((_n_d_b5 > 1)):
		return _S.set_prop(_n_out_b2,"c",_S.index_value(_n_Cs,0),"=")
	var _n_i_b6 = (5 if _S.truth(((_n_dy_b4 > 0.45) if _S.truth((_n_dx_b3 < (-0.35))) else (_n_dx_b3 < (-0.35)))) else (4 if _S.truth(((_n_dy_b4 > 0.3) if _S.truth((_n_dx_b3 < 0.05)) else (_n_dx_b3 < 0.05))) else (2 if _S.truth((_n_dy_b4 < 0.18)) else (2 if _S.truth((_n_dx_b3 > 0.55)) else 3))))
	for _iter_0 in _S.array(_n_SPOTS):
		var _tuple_1 = _iter_0
		var _n_sx0_b7 = _S.prop(_tuple_1,0)
		var _n_sy0_b8 = _S.prop(_tuple_1,1)
		var _n_r_b9 = _S.prop(_tuple_1,2)
		var _n_ex_b10 = ((_n_dx_b3 - _n_sx0_b7) * _n_cw)
		var _n_ey_b11 = ((_n_dy_b4 - _n_sy0_b8) * _n_ch)
		if _S.truth((((_n_ex_b10 * _n_ex_b10) + ((_n_ey_b11 * _n_ey_b11) * 1.6)) < (((_n_r_b9 * _n_r_b9) * _n_g) * _n_g))):
			_n_i_b6 = (9 if _S.truth(((_n_ey_b11 > 0) if _S.truth((_n_ex_b10 < 0)) else (_n_ex_b10 < 0))) else 8)
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_Sm,4) if _S.truth(_S.binary("===",_n_i_b6,9)) else (_S.index_value(_n_Sm,3) if _S.truth(_S.binary("===",_n_i_b6,8)) else _S.index_value(_n_Cs,_n_i_b6))),"=")
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "K", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "Cs", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "cap"), 6]))
	_S.define(_e, "Sm", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "stem"), 5]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f3"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "K"), 7), _S.prop(_S.read(_e, "K"), 6), _S.prop(_S.read(_e, "K"), 5), _S.prop(_S.read(_e, "K"), 4)]}, {"haze": _S.prop(_S.read(_e, "K"), 5)}])]))
	_S.define(_e, "gas", _S.construct(_S.read(_e, "Gas"), []))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "t", 0)
	_S.define(_e, "puffed", false)
	_S.define(_e, "grown", false)
	_S.define(_e, "g", _S.function_value(_e, "_f4"))
	_S.define(_e, "charge", _S.function_value(_e, "_f5"))
	_S.define(_e, "shape", _S.function_value(_e, "_f6"))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f9")}])

static func _f3(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_GROW = _S.read(_parent,"GROW")
	var _n_SINK = _S.read(_parent,"SINK")
	return (_S.invoke(_n_ease,"outBack",[clampf((float(_n_t)/_n_GROW),0.0,1.0), 1.6]) * (1 - _S.invoke(_n_ease,"inCubic",[clampf((float((_n_t - _n_SINK))/0.45),0.0,1.0)])))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_GROW = _S.read(_parent,"GROW")
	var _n_PUFF = _S.read(_parent,"PUFF")
	var _n_t = _S.read(_parent,"t")
	return _S.MathFX.smooth(_n_GROW,_n_PUFF,_n_t)
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_PUFF = _S.read(_parent,"PUFF")
	var _n_charge = _S.read(_parent,"charge")
	if _S.truth((_n_t < _n_PUFF)):
		var _n_k_b2 = _S.call_value(_n_charge,[])
		var _n_j_b3 = ((sin((_n_t * 70)) * 0.04) * _n_k_b2)
		return [((1 + (0.28 * _n_k_b2)) + _n_j_b3), ((1 + (0.22 * _n_k_b2)) - _n_j_b3)]
	var _n_e_b0 = (_n_t - _n_PUFF)
	var _n_sp_b1 = (exp(((-_n_e_b0) * 7)) * cos((_n_e_b0 * 26)))
	return [(1 + (0.25 * _n_sp_b1)), (1 - (0.35 * _n_sp_b1))]
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "dt"), 120)]))
	if _S.truth(_S.unary("!", _S.read(_e, "grown"))):
		var _v11 = _S.scope(_e)
		_S.write(_v11, "grown", true, "=", false)
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), 10)):
			_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "GRIT"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 1), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 50), 50]), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [40, 120])), _S.invoke(_S.read(_v12, "R"), "range", [0.5, 0.8]), _S.invoke(_S.read(_v12, "R"), "pick", [[_S.prop(_S.read(_v12, "Sm"), 1), _S.prop(_S.read(_v12, "Sm"), 2)]]), 1])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
		var _v13 = _S.scope(_v11)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 4)):
			_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "DUST"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v13, "R"), "sign", []), _S.invoke(_S.read(_v13, "R"), "range", [10, 40])), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [4, 12])), _S.invoke(_S.read(_v13, "R"), "range", [0.4, 0.7]), _S.prop(_S.read(_v13, "Sm"), 1), _S.invoke(_S.read(_v13, "R"), "range", [2, 3])])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "GROW")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "PUFF"), 0.05))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.25, _S.read(_e, "f"))]))):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "a", _S.invoke(_S.read(_v14, "R"), "range", [_S.binary("*", _S.prop(_S.read(_v14, "Math"), "PI"), 1.05), _S.binary("*", _S.prop(_S.read(_v14, "Math"), "PI"), 1.95)]))
		_S.define(_v14, "d", _S.invoke(_S.read(_v14, "R"), "range", [20, 38]))
		_S.define(_v14, "x", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "d")))
		_S.define(_v14, "y", _S.binary("+", _S.unary("-", 18), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "d")), 0.7)))
		_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "STREAK"), _S.read(_v14, "x"), _S.read(_v14, "y"), _S.binary("*", _S.unary("-", _S.read(_v14, "x")), 3), _S.binary("*", _S.binary("-", _S.unary("-", 18), _S.read(_v14, "y")), 3), _S.invoke(_S.read(_v14, "R"), "range", [0.2, 0.3]), _S.prop(_S.read(_v14, "K"), 6)])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "puffed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "PUFF")))):
		var _v15 = _S.scope(_e)
		_S.write(_v15, "puffed", true, "=", false)
		_S.invoke(_S.read(_v15, "lights"), "add", [0, _S.unary("-", 22), 30, _S.read(_v15, "WHITE"), 0.6, 0.1])
		_S.invoke(_S.read(_v15, "lights"), "add", [0, _S.unary("-", 28), 70, _S.prop(_S.read(_v15, "K"), 5), 0.55, 0.9])
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v16, "i"), 30)):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v17, "Math"), "PI")), 2), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 1.1), 1.1])))
			_S.define(_v17, "sp", _S.invoke(_S.read(_v17, "R"), "range", [15, 95]))
			_S.invoke(_S.read(_v17, "gas"), "add", [_S.read(_v17, "t"), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 8), 8]), _S.binary("+", _S.unary("-", 20), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), 1.3), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), 10), _S.invoke(_S.read(_v17, "R"), "range", [3, 5]), _S.invoke(_S.read(_v17, "R"), "range", [8, 14]), _S.binary("+", _S.read(_v17, "t"), _S.invoke(_S.read(_v17, "R"), "range", [1.6, 2.2])), _S.invoke(_S.read(_v17, "R"), "range", [5, 10])])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
		var _v18 = _S.scope(_v15)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), 6)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "sd", _S.invoke(_S.read(_v19, "R"), "sign", []))
			_S.invoke(_S.read(_v19, "gas"), "add", [_S.read(_v19, "t"), _S.binary("*", _S.read(_v19, "sd"), _S.invoke(_S.read(_v19, "R"), "range", [6, 12])), _S.unary("-", 5), _S.binary("*", _S.read(_v19, "sd"), _S.invoke(_S.read(_v19, "R"), "range", [30, 70])), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [2, 14])), _S.invoke(_S.read(_v19, "R"), "range", [2, 3]), _S.invoke(_S.read(_v19, "R"), "range", [4, 6]), _S.binary("+", _S.read(_v19, "t"), _S.invoke(_S.read(_v19, "R"), "range", [0.8, 1.1])), _S.invoke(_S.read(_v19, "R"), "range", [4, 8])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
		var _v20 = _S.scope(_v15)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 40)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v21, "Math"), "PI")), 2), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 1.4), 1.4])))
			_S.define(_v21, "sp", _S.invoke(_S.read(_v21, "R"), "range", [40, 160]))
			_S.define(_v21, "mote", _S.invoke(_S.read(_v21, "R"), "chance", [0.5]))
			_S.define(_v21, "k", (0.35 if _S.truth(_S.read(_v21, "mote")) else 0.7))
			_S.invoke(_S.read(_v21, "ps"), "spawn", [(_S.prop(_S.read(_v21, "P"), "MOTE") if _S.truth(_S.read(_v21, "mote")) else _S.prop(_S.read(_v21, "P"), "FLAKE")), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", 20), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), _S.read(_v21, "sp")), _S.read(_v21, "k")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "a")]), _S.read(_v21, "sp")), _S.read(_v21, "k")), _S.invoke(_S.read(_v21, "R"), "range", [1, 2]), _S.invoke(_S.read(_v21, "R"), "pick", [[_S.prop(_S.read(_v21, "K"), 7), _S.prop(_S.read(_v21, "K"), 6), _S.prop(_S.read(_v21, "K"), 6), _S.prop(_S.read(_v21, "K"), 5)]]), _S.invoke(_S.read(_v21, "R"), "range", [0.6, 1.6])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		var _v22 = _S.scope(_v15)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 6)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "STAR"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [12, 40])), 0, _S.unary("-", 6), _S.invoke(_S.read(_v22, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v22, "K"), 7), _S.invoke(_S.read(_v22, "R"), "range", [1, 2.4]), _S.invoke(_S.read(_v22, "R"), "range", [0.05, 0.4])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
		var _v23 = _S.scope(_v15)
		_S.define(_v23, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "i"), 8)):
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "DUST"), _S.binary("*", _S.invoke(_S.read(_v23, "R"), "sign", []), _S.invoke(_S.read(_v23, "R"), "range", [4, 10])), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v23, "R"), "sign", []), _S.invoke(_S.read(_v23, "R"), "range", [30, 90])), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [2, 10])), _S.invoke(_S.read(_v23, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v23, "K"), 3), _S.invoke(_S.read(_v23, "R"), "range", [2, 3.5])])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "puffed"), func(): return _S.binary("<", _S.read(_e, "t"), 2.6)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.12, _S.read(_e, "f"))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "FLAKE"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 40), 40]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [30, 70])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 8), 8]), _S.invoke(_S.read(_e, "R"), "range", [4, 14]), _S.invoke(_S.read(_e, "Math"), "min", [_S.invoke(_S.read(_e, "R"), "range", [0.9, 1.5]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05), _S.read(_e, "t"))]), (_S.prop(_S.read(_e, "K"), 7) if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])) else _S.prop(_S.read(_e, "K"), 6)), _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.5])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "SINK")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SINK"), 0.4))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.15, _S.read(_e, "f"))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "DUST"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), _S.invoke(_S.read(_e, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [2, 8])), _S.invoke(_S.read(_e, "R"), "range", [0.3, 0.5]), _S.prop(_S.read(_e, "Sm"), 1), _S.invoke(_S.read(_e, "R"), "range", [1.5, 2.5])])
	_S.invoke(_S.read(_e, "gas"), "prune", [_S.read(_e, "t")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_charge = _S.read(_parent,"charge")
	var _n_PUFF = _S.read(_parent,"PUFF")
	var _n_t = _S.read(_parent,"t")
	var _n_K = _S.read(_parent,"K")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = (_S.call_value(_n_charge,[]) * (1 - _S.MathFX.smooth((_n_PUFF + 0.2),(_n_PUFF + 1.2),_n_t)))
	if _S.truth((_n_k_b1 > 0)):
		if true:
			var _n_x_b2 = (-20)
			while _S.truth((_n_x_b2 <= 20)):
				_S.invoke(_n_p_b0,"dot",[_n_x_b2, 0, (_S.index_value(_n_K,5) if _S.truth((absf(_n_x_b2) < 10)) else _S.index_value(_n_K,4)), (_n_k_b1 * (1 - (float(absf(_n_x_b2))/21)))])
				_n_x_b2 += 1.0
	_S.invoke(_n_p_b0,"glow",[0, (-2), 30, _S.index_value(_n_K,4), (0.25 * _n_k_b1)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_shape = _S.read(_parent,"shape")
	var _n_charge = _S.read(_parent,"charge")
	var _n_t = _S.read(_parent,"t")
	var _n_PUFF = _S.read(_parent,"PUFF")
	var _n_toadstool = _S.read(_parent,"toadstool")
	var _n_K = _S.read(_parent,"K")
	var _n_Sm = _S.read(_parent,"Sm")
	var _n_Cs = _S.read(_parent,"Cs")
	var _n_g = _S.read(_parent,"g")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SINK = _S.read(_parent,"SINK")
	var _n_gas = _S.read(_parent,"gas")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _tuple_0 = _S.call_value(_n_shape,[])
	var _n_sx_b1 = _S.prop(_tuple_0,0)
	var _n_sy_b2 = _S.prop(_tuple_0,1)
	var _n_gl_b3 = ((_S.call_value(_n_charge,[]) * (0.75 + (0.25 * sin((_n_t * (20 + (30 * _S.call_value(_n_charge,[])))))))) if _S.truth((_n_t < _n_PUFF)) else maxf(0,(1 - ((_n_t - _n_PUFF) * 1.5))))
	_S.call_value(_n_toadstool,[_n_p_b0, _n_K, _n_Sm, _n_Cs, _S.call_value(_n_g,[]), _n_sx_b1, _n_sy_b2, _n_gl_b3, (_S.invoke(_n_ease,"inCubic",[clampf((float((_n_t - _n_SINK))/0.45),0.0,1.0)]) * 20)])
	_S.invoke(_n_gas,"draw",[_n_p_b0, _n_t, _S.index_value(_n_K,2), _S.index_value(_n_K,4), _S.index_value(_n_K,6), _S.index_value(_n_K,7), 0.62, _S.index_value(_n_K,6)])
	if _S.truth(_S.prop(_S.named_value(_n_gas,"list"),"length")):
		var _n_cx_b5 = 0
		var _n_cy_b6 = 0
		var _n_n_b7 = 0
		for _iter_1 in _S.array(_S.named_value(_n_gas,"list")):
			var _n_q_b8 = _iter_1
			var _n_g2_b9 = _S.invoke(_n_gas,"at",[_n_q_b8, _n_t])
			_n_cx_b5 += (_S.named_value(_n_g2_b9,"x") * _S.named_value(_n_g2_b9,"a"))
			_n_cy_b6 += (_S.named_value(_n_g2_b9,"y") * _S.named_value(_n_g2_b9,"a"))
			_n_n_b7 += _S.named_value(_n_g2_b9,"a")
		if _S.truth((_n_n_b7 > 0.2)):
			_S.invoke(_n_p_b0,"glow",[(float(_n_cx_b5)/_n_n_b7), (float(_n_cy_b6)/_n_n_b7), 46, _S.index_value(_n_K,5), minf(0.32,(0.03 * _n_n_b7))])
	var _n_e_b4 = (_n_t - _n_PUFF)
	if _S.truth(((_n_e_b4 < 0.1) if _S.truth((_n_e_b4 > 0)) else (_n_e_b4 > 0))):
		_S.call_value(_n_sparkle,[_n_p_b0, 0, (-20), (10 * (1 - (float(_n_e_b4)/0.1))), _S.index_value(_n_K,7), _S.index_value(_n_K,6), 0.6])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
