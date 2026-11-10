@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/vine-whip.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "Drops", _S.import_value("fx/nature/_lib.js", "Drops"))
	_S.define(_e, "drawLeaf", _S.import_value("fx/nature/_lib.js", "drawLeaf"))
	_S.define(_e, "drawRock", _S.import_value("fx/nature/_lib.js", "drawRock"))
	_S.define(_e, "stoneShape", _S.import_value("fx/nature/_lib.js", "stoneShape"))
	_S.define(_e, "pose", _S.function_value(_e, "_f0"))
	_S.define(_e, "haze", _S.function_value(_e, "_f1"))
	_S.define(_e, "vine", _S.function_value(_e, "_f2"))
	_S.define(_e, "thorns", _S.function_value(_e, "_f3"))
	_S.define(_e, "create", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Vine whip"}, {"desc": "A thorny vine bursts from the floor, rears back coiled, then lashes out right in a whip crack that sprays sap and tears off leaves, before sliding back into the ground."}, {"tags": ["nature", "vine", "plant", "whip", "melee", "directional", "one-shot"]}, {"size": [216, 128]}, {"origin": [60, 114]}, {"duration": 1.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0c1a10", "#173a1a", "#24582a", "#357a34", "#52a03e", "#86c84e", "#c4ec7a", "#f4ffd0"]}, {"thorn": ["#2a1410", "#5e2a1a", "#a04c2e", "#e89a6a"]}, {"soil": ["#120c0c", "#251917", "#3b2a24", "#553d31", "#715440", "#8f6e52", "#b8966e", "#e6d0a8"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "N", 24)
	_S.define(_e, "LS", 3.3)
	_S.define(_e, "LASH", 0.36)
	_S.define(_e, "LAG", 0.0052)
	_S.define(_e, "TAU_S", 0.055)
	_S.define(_e, "OMEGA", _S.binary("/", _S.read(_e, "TAU"), 0.21))
	_S.define(_e, "CRACK", _S.binary("+", _S.binary("+", _S.read(_e, "LASH"), _S.binary("*", _S.read(_e, "LAG"), _S.read(_e, "N"))), _S.binary("/", _S.binary("-", _S.prop(_S.read(_e, "Math"), "PI"), _S.invoke(_S.read(_e, "Math"), "atan", [_S.binary("*", _S.read(_e, "OMEGA"), _S.read(_e, "TAU_S"))])), _S.read(_e, "OMEGA"))))
	_S.define(_e, "spring", _S.function_value(_e, "_f11"))
	_S.define(_e, "width", _S.function_value(_e, "_f12"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_LASH = _S.read(_parent,"LASH")
	var _n_N = _S.read(_parent,"N")
	var _n_LS = _S.read(_parent,"LS")
	var _n_spring = _S.read(_parent,"spring")
	var _n_LAG = _S.read(_parent,"LAG")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_grow_b1 = (_S.invoke(_n_ease,"outCubic",[clampf((float(_n_t_b0)/0.14),0.0,1.0)]) * (1 - _S.invoke(_n_ease,"inCubic",[clampf((float((_n_t_b0 - 1))/0.3),0.0,1.0)])))
	var _n_rear_b2 = _S.MathFX.smooth(0.1,_n_LASH,_n_t_b0)
	var _n_relax_b3 = _S.MathFX.smooth(0.82,1,_n_t_b0)
	var _n_pts_b4 = [[0, ((1 - _n_grow_b1) * ((_n_N * _n_LS) + 6))]]
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < _n_N)):
			var _n_s_b6 = (float(_n_i_b5)/_n_N)
			var _n_stand_b7 = ((float((-PI))/2) + ((0.25 * sin(((_n_s_b6 * 3) + (_n_t_b0 * 7)))) * _n_s_b6))
			var _n_back_b8 = (((float((-PI))/2) - 0.3) - (1.65 * pow(_n_s_b6,1.3)))
			var _n_out_b9 = ((-1) + (0.9 * pow(_n_s_b6,0.6)))
			var _n_a_b10 = _S.numeric_lerp(_n_stand_b7,_n_back_b8,_n_rear_b2)
			_n_a_b10 = _S.numeric_lerp(_n_a_b10,_n_out_b9,_S.call_value(_n_spring,[((_n_t_b0 - _n_LASH) - (_n_LAG * _n_i_b5))]))
			_n_a_b10 = _S.numeric_lerp(_n_a_b10,_n_stand_b7,_n_relax_b3)
			var _tuple_0 = _S.index_value(_n_pts_b4,_n_i_b5)
			var _n_x_b11 = _S.prop(_tuple_0,0)
			var _n_y_b12 = _S.prop(_tuple_0,1)
			_S.invoke(_n_pts_b4,"push",[[(_n_x_b11 + (cos(_n_a_b10) * _n_LS)), (_n_y_b12 + (sin(_n_a_b10) * _n_LS))]])
			_n_i_b5 += 1.0
	return _n_pts_b4
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_pts_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_x0_b4 = INF
	var _n_y0_b5 = INF
	var _n_x1_b6 = (-INF)
	var _n_y1_b7 = (-INF)
	for _iter_0 in _S.array(_n_pts_b1):
		var _tuple_1 = _iter_0
		var _n_x_b8 = _S.prop(_tuple_1,0)
		var _n_y_b9 = _S.prop(_tuple_1,1)
		_n_x0_b4 = minf(_n_x0_b4,_n_x_b8)
		_n_x1_b6 = maxf(_n_x1_b6,_n_x_b8)
		_n_y0_b5 = minf(_n_y0_b5,_n_y_b9)
		_n_y1_b7 = maxf(_n_y1_b7,_n_y_b9)
	if true:
		var _n_y_b10 = floori(_n_y0_b5)
		while _S.truth((_n_y_b10 <= ceili(_n_y1_b7))):
			if true:
				var _n_x_b11 = floori(_n_x0_b4)
				while _S.truth((_n_x_b11 <= ceili(_n_x1_b6))):
					var _n_inside_b12 = false
					if true:
						var _n_i_b13 = 0
						var _n_j_b14 = (_S.prop(_n_pts_b1,"length") - 1)
						while _S.truth((_n_i_b13 < _S.prop(_n_pts_b1,"length"))):
							var _tuple_2 = _S.index_value(_n_pts_b1,_n_i_b13)
							var _n_xi_b15 = _S.prop(_tuple_2,0)
							var _n_yi_b16 = _S.prop(_tuple_2,1)
							var _tuple_3 = _S.index_value(_n_pts_b1,_n_j_b14)
							var _n_xj_b17 = _S.prop(_tuple_3,0)
							var _n_yj_b18 = _S.prop(_tuple_3,1)
							if _S.truth((((_n_x_b11 + 0.5) < ((float(((_n_xj_b17 - _n_xi_b15) * ((_n_y_b10 + 0.5) - _n_yi_b16)))/(_n_yj_b18 - _n_yi_b16)) + _n_xi_b15)) if _S.truth(_S.binary("!==",(_n_yi_b16 > (_n_y_b10 + 0.5)),(_n_yj_b18 > (_n_y_b10 + 0.5)))) else _S.binary("!==",(_n_yi_b16 > (_n_y_b10 + 0.5)),(_n_yj_b18 > (_n_y_b10 + 0.5))))):
								_n_inside_b12 = not _S.truth(_n_inside_b12)
							_n_j_b14 = _n_i_b13
							_n_i_b13 += 1.0
					if _S.truth(_n_inside_b12):
						_S.invoke(_n_p_b0,"blend",[_n_x_b11, _n_y_b10, _n_c_b2, _n_a_b3])
					_n_x_b11 += 1.0
			_n_y_b10 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_width = _S.read(_parent,"width")
	var _n_N = _S.read(_parent,"N")
	var _n_LS = _S.read(_parent,"LS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_pts_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < _n_N)):
			var _tuple_0 = _S.index_value(_n_pts_b1,_n_i_b3)
			var _n_ax_b4 = _S.prop(_tuple_0,0)
			var _n_ay_b5 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_pts_b1,(_n_i_b3 + 1))
			var _n_bx_b6 = _S.prop(_tuple_1,0)
			var _n_by_b7 = _S.prop(_tuple_1,1)
			var _n_dx_b8 = (_n_bx_b6 - _n_ax_b4)
			var _n_dy_b9 = (_n_by_b7 - _n_ay_b5)
			var _n_L_b10 = _S.logical("||",_S.Bridge.hypot([_n_dx_b8, _n_dy_b9]),func():return 1)
			var _n_nx_b11 = (float((-_n_dy_b9))/_n_L_b10)
			var _n_ny_b12 = (float(_n_dx_b8)/_n_L_b10)
			var _n_w0_b13 = (float(_S.call_value(_n_width,[(float(_n_i_b3)/_n_N)]))/2)
			var _n_w1_b14 = (float(_S.call_value(_n_width,[(float((_n_i_b3 + 1))/_n_N)]))/2)
			var _n_up_b15 = (1 if _S.truth((((_n_nx_b11 * (-0.6)) + (_n_ny_b12 * (-0.8))) > 0)) else (-1))
			var _n_X0_b16 = floori((minf(_n_ax_b4,_n_bx_b6) - 4))
			var _n_X1_b17 = ceili((maxf(_n_ax_b4,_n_bx_b6) + 4))
			var _n_Y0_b18 = floori((minf(_n_ay_b5,_n_by_b7) - 4))
			var _n_Y1_b19 = ceili((maxf(_n_ay_b5,_n_by_b7) + 4))
			if true:
				var _n_y_b20 = _n_Y0_b18
				while _S.truth((_n_y_b20 <= _n_Y1_b19)):
					if true:
						var _n_x_b21 = _n_X0_b16
						while _S.truth((_n_x_b21 <= _n_X1_b17)):
							if _S.truth((_n_y_b20 > 0)):
								_n_x_b21 += 1.0
								continue
							var _n_px_b22 = ((_n_x_b21 + 0.5) - _n_ax_b4)
							var _n_py_b23 = ((_n_y_b20 + 0.5) - _n_ay_b5)
							var _n_u_b24 = (float(((_n_px_b22 * _n_dx_b8) + (_n_py_b23 * _n_dy_b9)))/(_n_L_b10 * _n_L_b10))
							if _S.truth(((_n_u_b24 < (-0.15)) if _S.truth((_n_u_b24 < (-0.15))) else (_n_u_b24 > 1.15))):
								_n_x_b21 += 1.0
								continue
							var _n_d_b25 = ((_n_px_b22 * _n_nx_b11) + (_n_py_b23 * _n_ny_b12))
							var _n_w_b26 = (_S.numeric_lerp(_n_w0_b13,_n_w1_b14,clampf(_n_u_b24,0.0,1.0)) + 0.35)
							if _S.truth((absf(_n_d_b25) > _n_w_b26)):
								_n_x_b21 += 1.0
								continue
							var _n_side_b27 = (signf(_n_d_b25) * _n_up_b15)
							var _n_q_b28 = (float(absf(_n_d_b25))/_n_w_b26)
							var _n_arc_b29 = ((_n_i_b3 + _n_u_b24) * _n_LS)
							var _n_c_b30 = ((_S.index_value(_n_C_b2,5) if _S.truth((_n_side_b27 > 0)) else _S.index_value(_n_C_b2,1)) if _S.truth((_n_q_b28 > 0.8)) else ((_S.index_value(_n_C_b2,4) if _S.truth((_n_q_b28 > 0.35)) else _S.index_value(_n_C_b2,3)) if _S.truth((_n_side_b27 > 0)) else (_S.index_value(_n_C_b2,2) if _S.truth((_n_q_b28 > 0.4)) else _S.index_value(_n_C_b2,3))))
							if _S.truth(_S.logical("&&",((absf((fmod((_n_arc_b29 + (_n_d_b25 * 0.8)),5) - 2.5)) < 0.45) if _S.truth((_n_w_b26 > 1.6)) else (_n_w_b26 > 1.6)),func():return (_n_q_b28 < 0.8))):
								_n_c_b30 = _S.index_value(_n_C_b2,2)
							_S.invoke(_n_p_b0,"px",[_n_x_b21, _n_y_b20, _n_c_b30])
							_n_x_b21 += 1.0
					_n_y_b20 += 1.0
			_n_i_b3 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_width = _S.read(_parent,"width")
	var _n_N = _S.read(_parent,"N")
	var _n_drawLeaf = _S.read(_parent,"drawLeaf")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_pts_b1 = _S.arg(_args,1)
	var _n_T_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_R_b5 = _S.arg(_args,5)
	if true:
		var _n_i_b6 = 2
		while _S.truth((_n_i_b6 < (_n_N - 1))):
			var _tuple_0 = _S.index_value(_n_pts_b1,_n_i_b6)
			var _n_ax_b7 = _S.prop(_tuple_0,0)
			var _n_ay_b8 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_pts_b1,(_n_i_b6 + 1))
			var _n_bx_b9 = _S.prop(_tuple_1,0)
			var _n_by_b10 = _S.prop(_tuple_1,1)
			var _n_dx_b11 = (_n_bx_b9 - _n_ax_b7)
			var _n_dy_b12 = (_n_by_b10 - _n_ay_b8)
			var _n_L_b13 = _S.logical("||",_S.Bridge.hypot([_n_dx_b11, _n_dy_b12]),func():return 1)
			var _n_side_b14 = (1 if _S.truth(fmod((float(_n_i_b6)/2),2)) else (-1))
			var _n_nx_b15 = ((float((-_n_dy_b12))/_n_L_b13) * _n_side_b14)
			var _n_ny_b16 = ((float(_n_dx_b11)/_n_L_b13) * _n_side_b14)
			var _n_w_b17 = (float(_S.call_value(_n_width,[(float(_n_i_b6)/_n_N)]))/2)
			var _n_len_b18 = (1.8 + (2.4 * (1 - (float(_n_i_b6)/_n_N))))
			var _n_tx0_b19 = (float(_n_dx_b11)/_n_L_b13)
			var _n_ty0_b20 = (float(_n_dy_b12)/_n_L_b13)
			var _n_x0_b21 = (_n_ax_b7 + (_n_nx_b15 * (_n_w_b17 - 0.5)))
			var _n_y0_b22 = (_n_ay_b8 + (_n_ny_b16 * (_n_w_b17 - 0.5)))
			var _n_tx_b23 = ((_n_x0_b21 + (_n_nx_b15 * _n_len_b18)) - ((_n_tx0_b19 * _n_len_b18) * 0.7))
			var _n_ty_b24 = ((_n_y0_b22 + (_n_ny_b16 * _n_len_b18)) - ((_n_ty0_b20 * _n_len_b18) * 0.7))
			if _S.truth((_n_y0_b22 > 0)):
				_n_i_b6 += 2
				continue
			_S.invoke(_n_p_b0,"tri",[(_n_x0_b21 - (_n_tx0_b19 * 1.6)), (_n_y0_b22 - (_n_ty0_b20 * 1.6)), (_n_x0_b21 + (_n_tx0_b19 * 1.4)), (_n_y0_b22 + (_n_ty0_b20 * 1.4)), _n_tx_b23, _n_ty_b24, _S.index_value(_n_T_b2,1)])
			_S.invoke(_n_p_b0,"line",[(_n_x0_b21 + (_n_tx0_b19 * 0.8)), (_n_y0_b22 + (_n_ty0_b20 * 0.8)), _n_tx_b23, _n_ty_b24, _S.index_value(_n_T_b2,2)])
			_S.invoke(_n_p_b0,"px",[_n_tx_b23, _n_ty_b24, _S.index_value(_n_T_b2,3)])
			_n_i_b6 += 2
	for _iter_2 in _S.array([7, 13, 18]):
		var _n_k_b25 = _iter_2
		var _tuple_3 = _S.index_value(_n_pts_b1,_n_k_b25)
		var _n_ax_b26 = _S.prop(_tuple_3,0)
		var _n_ay_b27 = _S.prop(_tuple_3,1)
		var _tuple_4 = _S.index_value(_n_pts_b1,(_n_k_b25 + 1))
		var _n_bx_b28 = _S.prop(_tuple_4,0)
		var _n_by_b29 = _S.prop(_tuple_4,1)
		var _n_a_b30 = atan2((_n_by_b29 - _n_ay_b27),(_n_bx_b28 - _n_ax_b26))
		var _n_side_b31 = (1 if _S.truth(fmod(_n_k_b25,2)) else (-1))
		if _S.truth((_n_ay_b27 > (-2))):
			continue
		var _n_la_b32 = ((_n_a_b30 + (_n_side_b31 * 1.1)) + (sin(((_n_t_b4 * 9) + _n_k_b25)) * 0.2))
		var _n_lx_b33 = (_n_ax_b26 + (cos(_n_la_b32) * 4))
		var _n_ly_b34 = (_n_ay_b27 + (sin(_n_la_b32) * 4))
		_S.call_value(_n_drawLeaf,[_n_p_b0, _n_lx_b33, _n_ly_b34, 7, 2.2, _n_la_b32, (0.3 + (sin(((_n_t_b4 * 5) + _n_k_b25)) * 0.4)), [_S.index_value(_n_C_b3,1), _S.index_value(_n_C_b3,3), _S.index_value(_n_C_b3,5), _S.index_value(_n_C_b3,6)]])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "T", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "thorn"), 4]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "soil"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f5"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "drops", _S.construct(_S.read(_e, "Drops"), [_S.read(_e, "floor")]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "chips", [])
	_S.define(_e, "torn", [])
	_S.define(_e, "spots", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "burst", false)
	_S.define(_e, "cracked", false)
	_S.define(_e, "sunk", false)
	_S.define(_e, "dirt", _S.function_value(_e, "_f6"))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f9")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f5(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_chips = _S.read(_parent,"chips")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_stoneShape = _S.read(_parent,"stoneShape")
	var _n_meta = _S.read(_parent,"meta")
	var _n_t = _S.read(_parent,"t")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_S = _S.read(_parent,"S")
	var _n_n_b0 = _S.arg(_args,0)
	var _n_sp_b1 = _S.arg(_args,1)
	if true:
		var _n_i_b2 = 0
		while _S.truth((_n_i_b2 < _n_n_b0)):
			var _n_a_b3 = ((float((-PI))/2) + _S.invoke(_n_R,"range",[(-1.2), 1.2]))
			var _n_v_b4 = (_S.invoke(_n_R,"range",[60, 200]) * _n_sp_b1)
			_S.invoke(_n_chips,"push",[{"x":_S.invoke(_n_R,"range",[(-3), 3]),"y":(-1),"vx":(cos(_n_a_b3) * _n_v_b4),"vy":(sin(_n_a_b3) * _n_v_b4),"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"va":_S.invoke(_n_R,"range",[(-15), 15]),"s":_S.invoke(_n_R,"range",[1.4, 2.6]),"pts":_S.call_value(_n_stoneShape,[_n_R]),"life":minf(_S.invoke(_n_R,"range",[0.6, 0.9]),((_S.named_value(_n_meta,"duration") - 0.05) - _n_t))}])
			_n_i_b2 += 1.0
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < (_n_n_b0 * 3))):
			var _n_a_b6 = ((float((-PI))/2) + _S.invoke(_n_R,"range",[(-1), 1]))
			var _n_v_b7 = (_S.invoke(_n_R,"range",[50, 200]) * _n_sp_b1)
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"GRIT"), _S.invoke(_n_R,"range",[(-3), 3]), (-1), (cos(_n_a_b6) * _n_v_b7), (sin(_n_a_b6) * _n_v_b7), minf(_S.invoke(_n_R,"range",[0.5, 0.9]),((_S.named_value(_n_meta,"duration") - 0.05) - _n_t)), _S.invoke(_n_R,"pick",[[_S.index_value(_n_S,5), _S.index_value(_n_S,4), _S.index_value(_n_S,3)]]), (2 if _S.truth(_S.invoke(_n_R,"chance",[0.3])) else 1)])
			_n_i_b5 += 1.0
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < _n_n_b0)):
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"DUST"), _S.invoke(_n_R,"range",[(-4), 4]), (-_S.invoke(_n_R,"range",[0, 3])), (_S.invoke(_n_R,"sign",[]) * _S.invoke(_n_R,"range",[15, 60])), (-_S.invoke(_n_R,"range",[4, 20])), minf(_S.invoke(_n_R,"range",[0.4, 0.8]),((_S.named_value(_n_meta,"duration") - 0.05) - _n_t)), _S.index_value(_n_S,5), _S.invoke(_n_R,"range",[2, 4])])
			_n_i_b8 += 1.0
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.unary("!", _S.read(_e, "burst"))):
		_S.last([_S.write(_e, "burst", true, "=", false), _S.call_value(_S.read(_e, "dirt"), [6, 1])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "cracked")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRACK")))):
		var _v34 = _S.scope(_e)
		_S.write(_v34, "cracked", true, "=", false)
		_S.define(_v34, "a", _S.call_value(_S.read(_v34, "pose"), [_S.read(_v34, "t")]))
		_S.define(_v34, "b", _S.call_value(_S.read(_v34, "pose"), [_S.binary("-", _S.read(_v34, "t"), 0.01)]))
		var _v35 = _S.prop(_S.read(_v34, "a"), _S.read(_v34, "N"))
		_S.define(_v34, "x", _S.prop(_v35, 0))
		_S.define(_v34, "y", _S.prop(_v35, 1))
		_S.define(_v34, "vx", _S.binary("/", _S.binary("-", _S.read(_v34, "x"), _S.prop(_S.prop(_S.read(_v34, "b"), _S.read(_v34, "N")), 0)), 0.01))
		_S.define(_v34, "vy", _S.binary("/", _S.binary("-", _S.read(_v34, "y"), _S.prop(_S.prop(_S.read(_v34, "b"), _S.read(_v34, "N")), 1)), 0.01))
		_S.define(_v34, "sp", _S.logical("||", _S.invoke(_S.read(_v34, "Math"), "hypot", [_S.read(_v34, "vx"), _S.read(_v34, "vy")]), func(): return 1))
		_S.invoke(_S.read(_v34, "lights"), "add", [_S.read(_v34, "x"), _S.read(_v34, "y"), 22, _S.read(_v34, "WHITE"), 0.5, 0.08])
		_S.invoke(_S.read(_v34, "lights"), "add", [_S.read(_v34, "x"), _S.read(_v34, "y"), 50, _S.prop(_S.read(_v34, "C"), 5), 0.35, 0.4])
		var _v36 = _S.scope(_v34)
		_S.define(_v36, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v36, "i"), 18)):
			var _v37 = _S.scope(_v36)
			_S.define(_v37, "ang", _S.binary("+", _S.invoke(_S.read(_v37, "Math"), "atan2", [_S.read(_v37, "vy"), _S.read(_v37, "vx")]), _S.invoke(_S.read(_v37, "R"), "range", [_S.unary("-", 0.7), 0.7])))
			_S.define(_v37, "v", _S.invoke(_S.read(_v37, "R"), "range", [80, 260]))
			_S.invoke(_S.read(_v37, "drops"), "add", [_S.read(_v37, "x"), _S.read(_v37, "y"), _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "cos", [_S.read(_v37, "ang")]), _S.read(_v37, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "sin", [_S.read(_v37, "ang")]), _S.read(_v37, "v")), _S.invoke(_S.read(_v37, "R"), "range", [0, 60])), (2 if _S.truth(_S.invoke(_S.read(_v37, "R"), "chance", [0.3])) else 1)])
			_v36 = _S.iteration(_v36)
			_S.write(_v36, "i", 1, "+=", true)
		var _v38 = _S.scope(_v34)
		_S.define(_v38, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v38, "i"), 4)):
			_S.invoke(_S.read(_v38, "torn"), "push", [_S.merge([{"x": _S.read(_v38, "x")}, {"y": _S.read(_v38, "y")}, {"vx": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v38, "vx"), _S.read(_v38, "sp")), _S.invoke(_S.read(_v38, "R"), "range", [40, 120])), _S.invoke(_S.read(_v38, "R"), "range", [_S.unary("-", 30), 30]))}, {"vy": _S.invoke(_S.read(_v38, "R"), "range", [_S.unary("-", 90), _S.unary("-", 20)])}, {"a": _S.invoke(_S.read(_v38, "R"), "range", [0, _S.read(_v38, "TAU")])}, {"va": _S.invoke(_S.read(_v38, "R"), "range", [_S.unary("-", 12), 12])}, {"fl": _S.invoke(_S.read(_v38, "R"), "range", [0, _S.read(_v38, "TAU")])}, {"vf": _S.invoke(_S.read(_v38, "R"), "range", [8, 16])}, {"life": _S.invoke(_S.read(_v38, "R"), "range", [0.65, 0.8])}, {"max": 0}])])
			_v38 = _S.iteration(_v38)
			_S.write(_v38, "i", 1, "+=", true)
		for _v39 in _S.array(_S.read(_v34, "torn")):
			var _v40 = _S.scope(_v34)
			_S.define(_v40, "l", _v39)
			_S.set_prop(_S.read(_v40, "l"), "max", _S.prop(_S.read(_v40, "l"), "life"), "=", false)
		var _v41 = _S.scope(_v34)
		_S.define(_v41, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v41, "i"), 8)):
			_S.invoke(_S.read(_v41, "ps"), "spawn", [_S.prop(_S.read(_v41, "P"), "STAR"), _S.binary("+", _S.read(_v41, "x"), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 6), 6])), _S.binary("+", _S.read(_v41, "y"), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 6), 6])), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 20), 20]), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 20), 20]), _S.invoke(_S.read(_v41, "R"), "range", [0.15, 0.35]), _S.prop(_S.read(_v41, "C"), 7), _S.invoke(_S.read(_v41, "R"), "range", [0.6, 1.6])])
			_v41 = _S.iteration(_v41)
			_S.write(_v41, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "sunk")), func(): return _S.binary(">=", _S.read(_e, "t"), 1.08))):
		_S.last([_S.write(_e, "sunk", true, "=", false), _S.call_value(_S.read(_e, "dirt"), [3, 0.5])])
	_S.invoke(_S.read(_e, "drops"), "update", [_S.read(_e, "dt"), _S.function_value(_e, "_f8")])
	var _v42 = _S.scope(_e)
	_S.define(_v42, "i", _S.binary("-", _S.prop(_S.read(_v42, "chips"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v42, "i"), 0)):
		var _v43 = _S.scope(_v42)
		_S.define(_v43, "c", _S.prop(_S.read(_v43, "chips"), _S.read(_v43, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v43, "c"), "life", _S.read(_v43, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v43, "chips"), "splice", [_S.read(_v43, "i"), 1])
		_S.set_prop(_S.read(_v43, "c"), "vy", _S.binary("*", 950, _S.read(_v43, "dt")), "+=", false)
		_S.set_prop(_S.read(_v43, "c"), "x", _S.binary("*", _S.prop(_S.read(_v43, "c"), "vx"), _S.read(_v43, "dt")), "+=", false)
		_S.set_prop(_S.read(_v43, "c"), "y", _S.binary("*", _S.prop(_S.read(_v43, "c"), "vy"), _S.read(_v43, "dt")), "+=", false)
		_S.set_prop(_S.read(_v43, "c"), "a", _S.binary("*", _S.prop(_S.read(_v43, "c"), "va"), _S.read(_v43, "dt")), "+=", false)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v43, "c"), "y"), 0)):
			_S.last([_S.set_prop(_S.read(_v43, "c"), "y", 0, "=", false), _S.set_prop(_S.read(_v43, "c"), "vy", _S.unary("-", 0.3), "*=", false), _S.set_prop(_S.read(_v43, "c"), "vx", 0.6, "*=", false)])
		_v42 = _S.iteration(_v42)
		_S.write(_v42, "i", 1, "-=", true)
	var _v44 = _S.scope(_e)
	_S.define(_v44, "i", _S.binary("-", _S.prop(_S.read(_v44, "torn"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v44, "i"), 0)):
		var _v45 = _S.scope(_v44)
		_S.define(_v45, "l", _S.prop(_S.read(_v45, "torn"), _S.read(_v45, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v45, "l"), "life", _S.read(_v45, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v45, "torn"), "splice", [_S.read(_v45, "i"), 1])
		_S.set_prop(_S.read(_v45, "l"), "vy", _S.binary("*", 160, _S.read(_v45, "dt")), "+=", false)
		_S.set_prop(_S.read(_v45, "l"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v45, "l"), "vx"), 2.5), _S.read(_v45, "dt")), "-=", false)
		_S.set_prop(_S.read(_v45, "l"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v45, "l"), "vy"), 2), _S.read(_v45, "dt")), "-=", false)
		_S.set_prop(_S.read(_v45, "l"), "x", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v45, "l"), "vx"), _S.read(_v45, "dt")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v45, "Math"), "sin", [_S.prop(_S.read(_v45, "l"), "fl")]), 20), _S.read(_v45, "dt"))), "+=", false)
		_S.set_prop(_S.read(_v45, "l"), "y", _S.binary("*", _S.prop(_S.read(_v45, "l"), "vy"), _S.read(_v45, "dt")), "+=", false)
		_S.set_prop(_S.read(_v45, "l"), "a", _S.binary("*", _S.prop(_S.read(_v45, "l"), "va"), _S.read(_v45, "dt")), "+=", false)
		_S.set_prop(_S.read(_v45, "l"), "fl", _S.binary("*", _S.prop(_S.read(_v45, "l"), "vf"), _S.read(_v45, "dt")), "+=", false)
		_v44 = _S.iteration(_v44)
		_S.write(_v44, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_spots = _S.read(_parent,"spots")
	var _n_t = _S.read(_parent,"t")
	var _n_R = _S.read(_parent,"R")
	var _n_d_b0 = _S.arg(_args,0)
	return _S.invoke(_n_spots,"push",[{"x":_S.named_value(_n_d_b0,"x"),"t0":_n_t,"w":((_S.named_value(_n_d_b0,"s") * 0.7) + _S.invoke(_n_R,"range",[0.2, 1]))}])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_S = _S.read(_parent,"S")
	var _n_C = _S.read(_parent,"C")
	var _n_spots = _S.read(_parent,"spots")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = (1 - _S.MathFX.smooth(1.15,1.35,_n_t))
	if true:
		var _n_x_b2 = (-5)
		while _S.truth((_n_x_b2 <= 5)):
			_S.invoke(_n_p_b0,"dot",[_n_x_b2, 0, (_S.index_value(_n_S,0) if _S.truth((absf(_n_x_b2) < 3)) else _S.index_value(_n_S,1)), (_n_k_b1 * (1 - (float(absf(_n_x_b2))/7)))])
			_n_x_b2 += 1.0
	for _iter_0 in _S.array(_n_spots):
		var _n_s_b3 = _iter_0
		var _n_a_b4 = ((1 - _S.MathFX.smooth(0.25,0.6,(_n_t - _S.named_value(_n_s_b3,"t0")))) * (1 - _S.MathFX.smooth(1.2,1.35,_n_t)))
		if true:
			var _n_x_b5 = floori((_S.named_value(_n_s_b3,"x") - _S.named_value(_n_s_b3,"w")))
			while _S.truth((_n_x_b5 <= ceili((_S.named_value(_n_s_b3,"x") + _S.named_value(_n_s_b3,"w"))))):
				_S.invoke(_n_p_b0,"dot",[_n_x_b5, 0, (_S.index_value(_n_C,6) if _S.truth(((_n_t - _S.named_value(_n_s_b3,"t0")) < 0.1)) else _S.index_value(_n_C,4)), _n_a_b4])
				_n_x_b5 += 1.0
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_pose = _S.read(_parent,"pose")
	var _n_t = _S.read(_parent,"t")
	var _n_LASH = _S.read(_parent,"LASH")
	var _n_CRACK = _S.read(_parent,"CRACK")
	var _n_haze = _S.read(_parent,"haze")
	var _n_N = _S.read(_parent,"N")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_vine = _S.read(_parent,"vine")
	var _n_thorns = _S.read(_parent,"thorns")
	var _n_T = _S.read(_parent,"T")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_S = _S.read(_parent,"S")
	var _n_drawRock = _S.read(_parent,"drawRock")
	var _n_chips = _S.read(_parent,"chips")
	var _n_drawLeaf = _S.read(_parent,"drawLeaf")
	var _n_torn = _S.read(_parent,"torn")
	var _n_drops = _S.read(_parent,"drops")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_pts_b1 = _S.call_value(_n_pose,[_n_t])
	if _S.truth(((_n_t < (_n_CRACK + 0.1)) if _S.truth((_n_t > (_n_LASH + 0.04))) else (_n_t > (_n_LASH + 0.04)))):
		var _n_age_b4 = clampf((float(((_n_t - _n_CRACK) + 0.02))/0.12),0.0,1.0)
		var _n_hist_b5 = []
		if true:
			var _n_k_b6 = 0
			while _S.truth((_n_k_b6 < 12)):
				_S.invoke(_n_hist_b5,"push",[_S.call_value(_n_pose,[(_n_t - (_n_k_b6 * 0.0045))])])
				_n_k_b6 += 1.0
		if true:
			var _n_k_b7 = 0
			while _S.truth((_n_k_b7 < 6)):
				_S.call_value(_n_haze,[_n_p_b0, [_S.index_value(_S.index_value(_n_hist_b5,_n_k_b7),_n_N), _S.index_value(_S.index_value(_n_hist_b5,(_n_k_b7 + 1)),_n_N), _S.index_value(_S.index_value(_n_hist_b5,(_n_k_b7 + 1)),(_n_N - 12)), _S.index_value(_S.index_value(_n_hist_b5,_n_k_b7),(_n_N - 12))], (_S.index_value(_n_C,6) if _S.truth((_n_k_b7 < 2)) else _S.index_value(_n_C,5)), ((0.4 * (1 - (float(_n_k_b7)/6))) * (1 - _n_age_b4))])
				_n_k_b7 += 1.0
		if true:
			var _n_i_b8 = (_n_N - 12)
			while _S.truth((_n_i_b8 <= _n_N)):
				var _n_q_b9 = (float((_n_N - _n_i_b8))/12)
				var _n_col_b10 = (_n_WHITE if _S.truth((_n_q_b9 < 0.1)) else (_S.index_value(_n_C,7) if _S.truth((_n_q_b9 < 0.3)) else (_S.index_value(_n_C,6) if _S.truth((_n_q_b9 < 0.55)) else (_S.index_value(_n_C,5) if _S.truth((_n_q_b9 < 0.8)) else _S.index_value(_n_C,4)))))
				var _n_len_b11 = floori((11 * (1 - (_n_q_b9 * 0.6)))+0.5)
				if true:
					var _n_k_b12 = 0
					while _S.truth((_n_k_b12 < _n_len_b11)):
						_S.invoke(_n_p_b0,"line",[_S.index_value(_S.index_value(_S.index_value(_n_hist_b5,_n_k_b12),_n_i_b8),0), _S.index_value(_S.index_value(_S.index_value(_n_hist_b5,_n_k_b12),_n_i_b8),1), _S.index_value(_S.index_value(_S.index_value(_n_hist_b5,(_n_k_b12 + 1)),_n_i_b8),0), _S.index_value(_S.index_value(_S.index_value(_n_hist_b5,(_n_k_b12 + 1)),_n_i_b8),1), (_n_WHITE if _S.truth(((_n_q_b9 < 0.1) if _S.truth((_n_k_b12 < 2)) else (_n_k_b12 < 2))) else _n_col_b10), ((1 - _n_age_b4) * (1 if _S.truth((_n_k_b12 < (_n_len_b11 * 0.5))) else (2 * (1 - (float(_n_k_b12)/_n_len_b11)))))])
						_n_k_b12 += 1.0
				_n_i_b8 += 2
		_S.invoke(_n_p_b0,"glowLine",[_S.index_value(_S.index_value(_S.index_value(_n_hist_b5,0),_n_N),0), _S.index_value(_S.index_value(_S.index_value(_n_hist_b5,0),_n_N),1), _S.index_value(_S.index_value(_S.index_value(_n_hist_b5,6),_n_N),0), _S.index_value(_S.index_value(_S.index_value(_n_hist_b5,6),_n_N),1), 14, _S.index_value(_n_C,5), (0.35 * (1 - _n_age_b4))])
	_S.call_value(_n_vine,[_n_p_b0, _n_pts_b1, _n_C])
	_S.call_value(_n_thorns,[_n_p_b0, _n_pts_b1, _n_T, _n_C, _n_t, null])
	var _n_lk_b2 = (_S.MathFX.smooth(_n_LASH,_n_CRACK,_n_t) * (1 - _S.MathFX.smooth(_n_CRACK,(_n_CRACK + 0.35),_n_t)))
	if _S.truth((_n_lk_b2 > 0)):
		if true:
			var _n_i_b13 = 6
			while _S.truth((_n_i_b13 <= _n_N)):
				_S.invoke(_n_p_b0,"glow",[_S.index_value(_S.index_value(_n_pts_b1,_n_i_b13),0), _S.index_value(_S.index_value(_n_pts_b1,_n_i_b13),1), 12, _S.index_value(_n_C,5), (0.18 * _n_lk_b2)])
				_n_i_b13 += 6
	var _n_e_b3 = (_n_t - _n_CRACK)
	if _S.truth(((_n_e_b3 < 0.12) if _S.truth((_n_e_b3 >= 0)) else (_n_e_b3 >= 0))):
		var _tuple_0 = _S.index_value(_n_pts_b1,_n_N)
		var _n_x_b14 = _S.prop(_tuple_0,0)
		var _n_y_b15 = _S.prop(_tuple_0,1)
		var _n_k_b16 = (1 - (float(_n_e_b3)/0.12))
		if true:
			var _n_j_b17 = 0
			while _S.truth((_n_j_b17 < 7)):
				var _n_a_b18 = (((float(_n_j_b17)/7) * _n_TAU) + 0.3)
				var _n_r0_b19 = (4 + (10 * (1 - _n_k_b16)))
				var _n_r1_b20 = (_n_r0_b19 + (5 * _n_k_b16))
				_S.invoke(_n_p_b0,"line",[(_n_x_b14 + (cos(_n_a_b18) * _n_r0_b19)), (_n_y_b15 + (sin(_n_a_b18) * _n_r0_b19)), (_n_x_b14 + (cos(_n_a_b18) * _n_r1_b20)), (_n_y_b15 + (sin(_n_a_b18) * _n_r1_b20)), (_n_WHITE if _S.truth((_n_k_b16 > 0.5)) else _S.index_value(_n_C,6))])
				_n_j_b17 += 1.0
		_S.invoke(_n_p_b0,"ring",[_n_x_b14, _n_y_b15, (3 + (8 * (1 - _n_k_b16))), 1, _S.index_value(_n_C,7), _n_k_b16])
		_S.call_value(_n_sparkle,[_n_p_b0, _n_x_b14, _n_y_b15, (7 * _n_k_b16), _S.index_value(_n_C,7), _S.index_value(_n_C,5), 0.4])
	for _iter_1 in _S.array(_n_chips):
		var _n_c_b21 = _iter_1
		_S.call_value(_n_drawRock,[_n_p_b0, _S.named_value(_n_c_b21,"x"), _S.named_value(_n_c_b21,"y"), _S.named_value(_n_c_b21,"s"), _S.named_value(_n_c_b21,"a"), _S.named_value(_n_c_b21,"pts"), _n_S, minf(1,(float(_S.named_value(_n_c_b21,"life"))/0.25))])
	for _iter_2 in _S.array(_n_torn):
		var _n_l_b22 = _iter_2
		_S.call_value(_n_drawLeaf,[_n_p_b0, _S.named_value(_n_l_b22,"x"), _S.named_value(_n_l_b22,"y"), 6, 2, _S.named_value(_n_l_b22,"a"), _S.named_value(_n_l_b22,"fl"), [_S.index_value(_n_C,1), _S.index_value(_n_C,3), _S.index_value(_n_C,5), _S.index_value(_n_C,6)], minf(1,(float(_S.named_value(_n_l_b22,"life"))/0.3))])
	_S.invoke(_n_drops,"draw",[_n_p_b0, _n_C])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_TAU_S = _S.read(_parent,"TAU_S")
	var _n_OMEGA = _S.read(_parent,"OMEGA")
	var _n_u_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_n_u_b0 <= 0)) else (1 - (exp((float((-_n_u_b0))/_n_TAU_S)) * (cos((_n_OMEGA * _n_u_b0)) + (float(sin((_n_OMEGA * _n_u_b0)))/(_n_OMEGA * _n_TAU_S))))))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	return (1.2 + (4.8 * pow((1 - _n_s_b0),0.7)))
	return null
