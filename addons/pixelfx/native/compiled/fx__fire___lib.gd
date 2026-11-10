@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f5":"flame_tongue","_f19":"fire_sim_draw"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "SMOKE_RAMP", _S.import_value("core/index.js", "SMOKE_RAMP"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "pnoise", _S.function_value(_e, "_f0"))
	_S.define(_e, "noiseFor", _S.function_value(_e, "_f1"))
	_S.define(_e, "looped", _S.function_value(_e, "_f4"))
	_S.define(_e, "flameTongue", _S.function_value(_e, "_f5"))
	_S.define(_e, "flameBlade", _S.function_value(_e, "_f6"))
	_S.define(_e, "solid", _S.function_value(_e, "_f7"))
	_S.define(_e, "soft", _S.function_value(_e, "_f8"))
	_S.define(_e, "firePuff", _S.function_value(_e, "_f9"))
	_S.define(_e, "lick", _S.function_value(_e, "_f10"))
	_S.define(_e, "smokePuff", _S.function_value(_e, "_f11"))
	_S.define(_e, "ember", _S.function_value(_e, "_f12"))
	_S.define(_e, "spark", _S.function_value(_e, "_f13"))
	_S.define(_e, "along", _S.function_value(_e, "_f14"))
	_S.define(_e, "drift", _S.function_value(_e, "_f15"))
	_S.define(_e, "sparkAt", _S.function_value(_e, "_f16"))
	_S.define(_e, "floorLight", _S.function_value(_e, "_f17"))
	_S.define(_e, "simDraw", _S.function_value(_e, "_f19"))
	_S.define(_e, "burn", _S.function_value(_e, "_f21"))
	_exports["pnoise"] = _S.read(_e, "pnoise")
	_exports["noiseFor"] = _S.read(_e, "noiseFor")
	_exports["looped"] = _S.read(_e, "looped")
	_S.define(_e, "flicker", _S.function_value(_e, "_f39"))
	_exports["flicker"] = _S.read(_e, "flicker")
	_S.define(_e, "hotFirst", _S.function_value(_e, "_f40"))
	_exports["hotFirst"] = _S.read(_e, "hotFirst")
	_S.define(_e, "LAYERS", [[1, 1, 6], [0.76, 0.86, 4], [0.54, 0.68, 2], [0.3, 0.42, 0]])
	_exports["LAYERS"] = _S.read(_e, "LAYERS")
	_S.define(_e, "BIG_LAYERS", [[1, 1, 6], [0.8, 0.9, 5], [0.62, 0.78, 4], [0.44, 0.6, 3], [0.26, 0.4, 1], [0.12, 0.22, 0]])
	_exports["BIG_LAYERS"] = _S.read(_e, "BIG_LAYERS")
	_S.define(_e, "BACK_LAYERS", [[1, 1, 7], [0.76, 0.86, 5], [0.54, 0.68, 3], [0.3, 0.42, 2]])
	_exports["BACK_LAYERS"] = _S.read(_e, "BACK_LAYERS")
	_exports["flameTongue"] = _S.read(_e, "flameTongue")
	_exports["flameBlade"] = _S.read(_e, "flameBlade")
	_exports["solid"] = _S.read(_e, "solid")
	_exports["soft"] = _S.read(_e, "soft")
	_exports["firePuff"] = _S.read(_e, "firePuff")
	_exports["lick"] = _S.read(_e, "lick")
	_S.define(_e, "rampAt", _S.function_value(_e, "_f41"))
	_exports["smokePuff"] = _S.read(_e, "smokePuff")
	_exports["ember"] = _S.read(_e, "ember")
	_exports["spark"] = _S.read(_e, "spark")
	_exports["drift"] = _S.read(_e, "drift")
	_exports["sparkAt"] = _S.read(_e, "sparkAt")
	_exports["floorLight"] = _S.read(_e, "floorLight")
	_exports["simDraw"] = _S.read(_e, "simDraw")
	_S.define(_e, "SMOKE1", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_exports["burn"] = _S.read(_e, "burn")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_period_b1 = _S.arg(_args,1)
	var _n_seed_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	var _n_i_b3 = floori(_n_x_b0)
	var _n_f_b4 = (_n_x_b0 - _n_i_b3)
	var _n_u_b5 = ((_n_f_b4 * _n_f_b4) * (3 - (2 * _n_f_b4)))
	var _n_a_b6 = _S.MathFX.rand([_S.call_value(_n_wrap,[_n_i_b3, _n_period_b1]),_n_seed_b2])
	var _n_b_b7 = _S.MathFX.rand([_S.call_value(_n_wrap,[(_n_i_b3 + 1), _n_period_b1]),_n_seed_b2])
	return (((_n_a_b6 + ((_n_b_b7 - _n_a_b6) * _n_u_b5)) * 2) - 1)
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_D_b0 = _S.arg(_args,0)
	if _S.truth(not _S.truth(_n_D_b0)):
		return _S.function_value(_S.capture(_parent,{"this":_this}),"_f2")
	return _S.function_value(_S.capture(_parent,{"D":_n_D_b0,"this":_this}),"_f3")
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_tt_b0 = _S.arg(_args,0)
	var _n_rate_b1 = _S.arg(_args,1)
	var _n_seed_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	var _n_off_b3 = _S.coalesce(_S.arg(_args,3),func():return 0)
	return _S.MathFX.noise(((_n_tt_b0 * _n_rate_b1) + _n_off_b3),_n_seed_b2)
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_pnoise = _S.read(_parent,"pnoise")
	var _n_tt_b0 = _S.arg(_args,0)
	var _n_rate_b1 = _S.arg(_args,1)
	var _n_seed_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	var _n_off_b3 = _S.coalesce(_S.arg(_args,3),func():return 0)
	var _n_P_b4 = maxf(1,floori((_n_rate_b1 * _n_D)+0.5))
	return _S.call_value(_n_pnoise,[(((float(_n_tt_b0)/_n_D) * _n_P_b4) + _n_off_b3), _n_P_b4, _n_seed_b2])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_D_b1 = _S.arg(_args,1)
	var _n_count_b2 = _S.arg(_args,2)
	var _n_seed_b3 = _S.arg(_args,3)
	var _n_make_b4 = _S.arg(_args,4)
	var _n_draw_b5 = _S.arg(_args,5)
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < _n_count_b2)):
			var _n_r_b7 = _S.MathFX.rng([_n_seed_b3,_n_i_b6])
			var _n_born_b8 = (_S.invoke(_n_r_b7,"next",[]) * _n_D_b1)
			var _n_q_b9 = _S.call_value(_n_make_b4,[_n_r_b7, _n_i_b6])
			if true:
				var _n_age_b10 = _S.call_value(_n_wrap,[(_n_t_b0 - _n_born_b8), _n_D_b1])
				while _S.truth((_n_age_b10 < _S.named_value(_n_q_b9,"life"))):
					_S.call_value(_n_draw_b5,[_n_q_b9, _n_age_b10, _n_i_b6])
					_n_age_b10 += _n_D_b1
			_n_i_b6 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_h_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_sx_b5 = _S.arg(_args,5)
	var _n_N_b6 = _S.arg(_args,6)
	var _n_n_b7 = _S.arg(_args,7)
	var _n_H_b8 = _S.arg(_args,8)
	var _n_layers_b9 = _S.coalesce(_S.arg(_args,9),func():return _n_LAYERS)
	var _n_jit_b10 = _S.coalesce(_S.arg(_args,10),func():return 0.5)
	var _n_wob_b11 = _S.coalesce(_S.arg(_args,11),func():return 1.1)
	if _S.truth((_n_h_b3 < 1)):
		return null
	for _iter_0 in _S.array(_n_layers_b9):
		var _tuple_1 = _iter_0
		var _n_lw_b12 = _S.prop(_tuple_1,0)
		var _n_lh_b13 = _S.prop(_tuple_1,1)
		var _n_ri_b14 = _S.prop(_tuple_1,2)
		var _n_L_b15 = (_n_h_b3 * _n_lh_b13)
		var _n_c_b16 = _S.index_value(_n_H_b8,_n_ri_b14)
		if true:
			var _n_r_b17 = 0
			while _S.truth((_n_r_b17 <= _n_L_b15)):
				var _n_u_b18 = (float(_n_r_b17)/maxf(1,_n_L_b15))
				var _n_half_b19 = ((((_n_w_b4 * _n_lw_b12) * pow((1 - _n_u_b18),0.85)) * minf(1,(float((_n_r_b17 + 1.5))/3.5))) + (_S.call_value(_n_N_b6,[9, _n_n_b7, (_n_r_b17 * 0.45)]) * _n_jit_b10))
				if _S.truth((_n_half_b19 < 0.3)):
					_n_r_b17 += 1.0
					continue
				var _n_cx_b20 = ((_n_x_b1 + (((_n_sx_b5 * _n_u_b18) * _n_u_b18) * _n_lh_b13)) + ((_S.call_value(_n_N_b6,[4, (_n_n_b7 + 7), (_n_r_b17 * 0.2)]) * _n_u_b18) * _n_wob_b11))
				var _n_Y_b21 = floori((_n_y_b2 - _n_r_b17)+0.5)
				if true:
					var _n_px_b22 = floori((_n_cx_b20 - _n_half_b19)+0.5)
					var _n_x1_b23 = floori((_n_cx_b20 + _n_half_b19)+0.5)
					while _S.truth((_n_px_b22 <= _n_x1_b23)):
						_S.invoke(_n_p_b0,"px",[_n_px_b22, _n_Y_b21, _n_c_b16])
						_n_px_b22 += 1.0
				_n_r_b17 += 1.0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_ux_b3 = _S.arg(_args,3)
	var _n_uy_b4 = _S.arg(_args,4)
	var _n_len_b5 = _S.arg(_args,5)
	var _n_w_b6 = _S.arg(_args,6)
	var _n_bend_b7 = _S.arg(_args,7)
	var _n_N_b8 = _S.arg(_args,8)
	var _n_n_b9 = _S.arg(_args,9)
	var _n_H_b10 = _S.arg(_args,10)
	var _n_layers_b11 = _S.coalesce(_S.arg(_args,11),func():return _n_LAYERS)
	var _n_jit_b12 = _S.coalesce(_S.arg(_args,12),func():return 0.5)
	var _n_wob_b13 = _S.coalesce(_S.arg(_args,13),func():return 1.1)
	if _S.truth((_n_len_b5 < 1)):
		return null
	var _n_nx_b14 = (-_n_uy_b4)
	var _n_ny_b15 = _n_ux_b3
	for _iter_0 in _S.array(_n_layers_b11):
		var _tuple_1 = _iter_0
		var _n_lw_b16 = _S.prop(_tuple_1,0)
		var _n_lh_b17 = _S.prop(_tuple_1,1)
		var _n_ri_b18 = _S.prop(_tuple_1,2)
		var _n_L_b19 = (_n_len_b5 * _n_lh_b17)
		var _n_c_b20 = _S.index_value(_n_H_b10,_n_ri_b18)
		if true:
			var _n_r_b21 = 0
			while _S.truth((_n_r_b21 <= _n_L_b19)):
				var _n_u_b22 = (float(_n_r_b21)/maxf(1,_n_L_b19))
				var _n_half_b23 = ((((_n_w_b6 * _n_lw_b16) * pow((1 - _n_u_b22),0.85)) * minf(1,(float((_n_r_b21 + 1.5))/3.5))) + (_S.call_value(_n_N_b8,[9, _n_n_b9, (_n_r_b21 * 0.45)]) * _n_jit_b12))
				if _S.truth((_n_half_b23 < 0.3)):
					_n_r_b21 += 0.5
					continue
				var _n_off_b24 = ((((_n_bend_b7 * _n_u_b22) * _n_u_b22) * _n_lh_b17) + ((_S.call_value(_n_N_b8,[4, (_n_n_b9 + 7), (_n_r_b21 * 0.2)]) * _n_u_b22) * _n_wob_b13))
				var _n_cx_b25 = ((_n_x_b1 + (_n_ux_b3 * _n_r_b21)) + (_n_nx_b14 * _n_off_b24))
				var _n_cy_b26 = ((_n_y_b2 + (_n_uy_b4 * _n_r_b21)) + (_n_ny_b15 * _n_off_b24))
				if true:
					var _n_q_b27 = (-_n_half_b23)
					while _S.truth((_n_q_b27 <= _n_half_b23)):
						_S.invoke(_n_p_b0,"px",[(_n_cx_b25 + (_n_nx_b14 * _n_q_b27)), (_n_cy_b26 + (_n_ny_b15 * _n_q_b27)), _n_c_b20])
						_n_q_b27 += 0.5
				_n_r_b21 += 0.5
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_c_b4 = _S.arg(_args,4)
	if _S.truth((_n_r_b3 < 0.6)):
		return _S.invoke(_n_p_b0,"px",[_n_x_b1, _n_y_b2, _n_c_b4])
	var _n_cx_b5 = _S.invoke(_n_p_b0,"toX",[_n_x_b1, _n_y_b2])
	var _n_cy_b6 = _S.invoke(_n_p_b0,"toY",[_n_x_b1, _n_y_b2])
	var _n_r2_b7 = (_n_r_b3 * _n_r_b3)
	if true:
		var _n_sy_b8 = floori((_n_cy_b6 - _n_r_b3))
		while _S.truth((_n_sy_b8 <= ceili((_n_cy_b6 + _n_r_b3)))):
			var _n_dy_b9 = ((_n_sy_b8 + 0.5) - _n_cy_b6)
			var _n_s2_b10 = (_n_r2_b7 - (_n_dy_b9 * _n_dy_b9))
			if _S.truth((_n_s2_b10 < 0)):
				_n_sy_b8 += 1.0
				continue
			var _n_s_b11 = sqrt(_n_s2_b10)
			if true:
				var _n_sx_b12 = ceili(((_n_cx_b5 - _n_s_b11) - 0.5))
				while _S.truth((_n_sx_b12 <= floori(((_n_cx_b5 + _n_s_b11) - 0.5)))):
					_S.invoke(_n_p_b0,"put",[_n_sx_b12, _n_sy_b8, _n_c_b4, 1])
					_n_sx_b12 += 1.0
			_n_sy_b8 += 1.0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_c_b4 = _S.arg(_args,4)
	var _n_a_b5 = _S.arg(_args,5)
	if _S.truth((_n_a_b5 <= 0.004)):
		return null
	if _S.truth((_n_r_b3 < 0.5)):
		return _S.invoke(_n_p_b0,"blend",[_n_x_b1, _n_y_b2, _n_c_b4, _n_a_b5])
	var _n_cx_b6 = _S.invoke(_n_p_b0,"toX",[_n_x_b1, _n_y_b2])
	var _n_cy_b7 = _S.invoke(_n_p_b0,"toY",[_n_x_b1, _n_y_b2])
	var _n_r2_b8 = (_n_r_b3 * _n_r_b3)
	if true:
		var _n_sy_b9 = floori((_n_cy_b7 - _n_r_b3))
		while _S.truth((_n_sy_b9 <= ceili((_n_cy_b7 + _n_r_b3)))):
			var _n_dy_b10 = ((_n_sy_b9 + 0.5) - _n_cy_b7)
			var _n_s2_b11 = (_n_r2_b8 - (_n_dy_b10 * _n_dy_b10))
			if _S.truth((_n_s2_b11 < 0)):
				_n_sy_b9 += 1.0
				continue
			var _n_s_b12 = sqrt(_n_s2_b11)
			if true:
				var _n_sx_b13 = ceili(((_n_cx_b6 - _n_s_b12) - 0.5))
				while _S.truth((_n_sx_b13 <= floori(((_n_cx_b6 + _n_s_b12) - 0.5)))):
					_S.invoke(_n_p_b0,"blendPx",[_n_sx_b13, _n_sy_b9, _n_c_b4, _n_a_b5])
					_n_sx_b13 += 1.0
			_n_sy_b9 += 1.0
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_soft = _S.read(_parent,"soft")
	var _n_solid = _S.read(_parent,"solid")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.arg(_args,3)
	var _n_size_b4 = _S.arg(_args,4)
	var _n_frac_b5 = _S.arg(_args,5)
	var _n_H_b6 = _S.arg(_args,6)
	var _n_glowK_b7 = _S.coalesce(_S.arg(_args,7),func():return 0.18)
	var _n_tx_b8 = _S.coalesce(_S.arg(_args,8),func():return 0)
	var _n_ty_b9 = _S.coalesce(_S.arg(_args,9),func():return (-1))
	var _n_age_b10 = (1 - _n_k_b3)
	var _n_n_b11 = _S.prop(_n_H_b6,"length")
	var _n_heat_b12 = minf(0.999,(pow(_n_age_b10,0.62) + (_n_frac_b5 * 0.1)))
	var _n_idx_b13 = minf((_n_n_b11 - 2),floori((_n_heat_b12 * (_n_n_b11 - 1))))
	var _n_r_b14 = ((_n_size_b4 * (0.55 + (0.45 * minf(1,(_n_age_b10 * 7))))) * (1 - (_n_age_b10 * 0.55)))
	var _n_c_b15 = _S.index_value(_n_H_b6,_n_idx_b13)
	if _S.truth((_n_idx_b13 >= (_n_n_b11 - 2))):
		return _S.call_value(_n_soft,[_n_p_b0, _n_x_b1, _n_y_b2, _n_r_b14, _n_c_b15, (minf(1,(_n_k_b3 * 3)) * 0.85)])
	_S.call_value(_n_solid,[_n_p_b0, _n_x_b1, _n_y_b2, _n_r_b14, _S.index_value(_n_H_b6,minf((_n_n_b11 - 1),(_n_idx_b13 + 2)))])
	if _S.truth(((_n_ty_b9 > (-0.99)) if _S.truth((_n_r_b14 > 1.6)) else (_n_r_b14 > 1.6))):
		_S.call_value(_n_solid,[_n_p_b0, (_n_x_b1 + ((_n_tx_b8 * _n_r_b14) * 1.5)), (_n_y_b2 + ((_n_ty_b9 * _n_r_b14) * 1.5)), (_n_r_b14 * 0.3), _S.index_value(_n_H_b6,minf((_n_n_b11 - 1),(_n_idx_b13 + 1)))])
	_S.call_value(_n_solid,[_n_p_b0, (_n_x_b1 - (_n_r_b14 * 0.16)), (_n_y_b2 - (_n_r_b14 * 0.22)), (_n_r_b14 * 0.78), _n_c_b15])
	if _S.truth((_n_r_b14 > 1.6)):
		_S.call_value(_n_solid,[_n_p_b0, (_n_x_b1 + ((_n_tx_b8 * _n_r_b14) * 0.9)), (_n_y_b2 + ((_n_ty_b9 * _n_r_b14) * 0.9)), (_n_r_b14 * 0.42), _n_c_b15])
	if _S.truth(((_n_r_b14 > 1.8) if _S.truth((_n_idx_b13 <= 3)) else (_n_idx_b13 <= 3))):
		_S.call_value(_n_solid,[_n_p_b0, (_n_x_b1 - (_n_r_b14 * 0.28)), (_n_y_b2 - (_n_r_b14 * 0.34)), (_n_r_b14 * 0.36), _S.index_value(_n_H_b6,maxf(0,(_n_idx_b13 - 1)))])
	if _S.truth((_n_idx_b13 < 6)):
		_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, ((_n_r_b14 * 2.4) + 2), _n_c_b15, (_n_glowK_b7 * _n_k_b3)])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_solid = _S.read(_parent,"solid")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.arg(_args,3)
	var _n_s_b4 = _S.arg(_args,4)
	var _n_H_b5 = _S.arg(_args,5)
	var _n_r_b6 = (_n_s_b4 * (0.4 + (0.6 * _n_k_b3)))
	_S.call_value(_n_solid,[_n_p_b0, _n_x_b1, _n_y_b2, (_n_r_b6 + 0.6), (_S.index_value(_n_H_b5,5) if _S.truth((_n_k_b3 > 0.5)) else _S.index_value(_n_H_b5,6))])
	if _S.truth((_n_k_b3 > 0.35)):
		_S.call_value(_n_solid,[_n_p_b0, _n_x_b1, (_n_y_b2 - 0.3), (_n_r_b6 * 0.6), (_S.index_value(_n_H_b5,2) if _S.truth((_n_k_b3 > 0.7)) else _S.index_value(_n_H_b5,4))])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_rampAt = _S.read(_parent,"rampAt")
	var _n_SMOKE_RAMP = _S.read(_parent,"SMOKE_RAMP")
	var _n_soft = _S.read(_parent,"soft")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.arg(_args,3)
	var _n_size_b4 = _S.arg(_args,4)
	var _n_col_b5 = _S.coalesce(_S.arg(_args,5),func():return 0)
	var _n_big_b6 = _S.coalesce(_S.arg(_args,6),func():return false)
	var _n_aMul_b7 = _S.coalesce(_S.arg(_args,7),func():return 1)
	var _n_age_b8 = (1 - _n_k_b3)
	var _n_r_b9 = (_n_size_b4 * ((0.65 + (minf(1,(_n_age_b8 * 2.5)) * 0.45)) + (_n_age_b8 * (0.5 if _S.truth(_n_big_b6) else 0.4))))
	var _n_a_b10 = (((minf(1,(_n_age_b8 * 12)) * minf(1,(_n_k_b3 * 2.4))) * (0.7 if _S.truth(_n_big_b6) else 0.58)) * _n_aMul_b7)
	var _n_c_b11 = (_S.ColorFX.mix(_n_col_b5,_S.call_value(_n_rampAt,[_n_SMOKE_RAMP, _n_age_b8]),_n_age_b8) if _S.truth(_n_col_b5) else _S.call_value(_n_rampAt,[_n_SMOKE_RAMP, (_n_age_b8 * 1.05)]))
	_S.call_value(_n_soft,[_n_p_b0, _n_x_b1, _n_y_b2, _n_r_b9, _n_c_b11, (_n_a_b10 * 0.45)])
	_S.call_value(_n_soft,[_n_p_b0, (_n_x_b1 + (_n_r_b9 * 0.05)), (_n_y_b2 + (_n_r_b9 * 0.06)), (_n_r_b9 * 0.74), _n_c_b11, (_n_a_b10 * 0.62)])
	if _S.truth((_n_age_b8 < 0.5)):
		_S.call_value(_n_soft,[_n_p_b0, (_n_x_b1 - (_n_r_b9 * 0.22)), (_n_y_b2 - (_n_r_b9 * 0.3)), (_n_r_b9 * 0.5), _S.ColorFX.mix(_n_c_b11,_n_WHITE,0.12), ((_n_a_b10 * 0.4) * (1 - (_n_age_b8 * 2)))])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.arg(_args,3)
	var _n_size_b4 = _S.arg(_args,4)
	var _n_cols_b5 = _S.arg(_args,5)
	var _n_ph_b6 = _S.arg(_args,6)
	if _S.truth(((sin(_n_ph_b6) < 0) if _S.truth((_n_k_b3 < 0.25)) else (_n_k_b3 < 0.25))):
		return null
	var _n_c_b7 = (_S.index_value(_n_cols_b5,0) if _S.truth((_n_k_b3 > 0.6)) else (_S.index_value(_n_cols_b5,1) if _S.truth((_n_k_b3 > 0.3)) else _S.index_value(_n_cols_b5,2)))
	if _S.truth((_n_size_b4 >= 2)):
		var _n_rim_b8 = (_S.index_value(_n_cols_b5,2) if _S.truth((_n_k_b3 > 0.45)) else _S.index_value(_n_cols_b5,3))
		_S.invoke(_n_p_b0,"px",[(_n_x_b1 - 1), _n_y_b2, _n_rim_b8])
		_S.invoke(_n_p_b0,"px",[(_n_x_b1 + 1), _n_y_b2, _n_rim_b8])
		_S.invoke(_n_p_b0,"px",[_n_x_b1, (_n_y_b2 - 1), _n_rim_b8])
		_S.invoke(_n_p_b0,"px",[_n_x_b1, (_n_y_b2 + 1), _n_rim_b8])
		_S.invoke(_n_p_b0,"px",[_n_x_b1, _n_y_b2, _n_c_b7])
		_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, 8, _n_c_b7, (0.4 * _n_k_b3)])
		return null
	_S.invoke(_n_p_b0,"px",[_n_x_b1, _n_y_b2, _n_c_b7])
	if _S.truth((_n_size_b4 > 1.4)):
		_S.invoke(_n_p_b0,"px",[_n_x_b1, (_n_y_b2 + 1), _S.index_value(_n_cols_b5,3)])
	_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, (3 + _n_size_b4), _n_c_b7, (0.35 * _n_k_b3)])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_vx_b3 = _S.arg(_args,3)
	var _n_vy_b4 = _S.arg(_args,4)
	var _n_k_b5 = _S.arg(_args,5)
	var _n_cols_b6 = _S.arg(_args,6)
	var _n_sp_b7 = _S.logical("||",_S.Bridge.hypot([_n_vx_b3, _n_vy_b4]),func():return 1)
	var _n_ux_b8 = (float(_n_vx_b3)/_n_sp_b7)
	var _n_uy_b9 = (float(_n_vy_b4)/_n_sp_b7)
	var _n_len_b10 = minf(9,(1 + (_n_sp_b7 * 0.022)))
	var _n_head_b11 = (_S.index_value(_n_cols_b6,0) if _S.truth((_n_k_b5 > 0.6)) else (_S.index_value(_n_cols_b6,1) if _S.truth((_n_k_b5 > 0.3)) else _S.index_value(_n_cols_b6,2)))
	_S.invoke(_n_p_b0,"line",[(_n_x_b1 - (_n_ux_b8 * _n_len_b10)), (_n_y_b2 - (_n_uy_b9 * _n_len_b10)), (_n_x_b1 - ((_n_ux_b8 * _n_len_b10) * 0.4)), (_n_y_b2 - ((_n_uy_b9 * _n_len_b10) * 0.4)), (_n_head_b11 if _S.truth((_n_k_b5 > 0.5)) else _S.index_value(_n_cols_b6,(_S.prop(_n_cols_b6,"length") - 1)))])
	_S.invoke(_n_p_b0,"line",[(_n_x_b1 - ((_n_ux_b8 * _n_len_b10) * 0.45)), (_n_y_b2 - ((_n_uy_b9 * _n_len_b10) * 0.45)), _n_x_b1, _n_y_b2, _n_head_b11])
	_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, 3, _n_head_b11, (0.45 * _n_k_b5)])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	var _n_a_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	if _S.truth((_n_k_b3 <= 0)):
		return [((_n_x_b0 + (_n_v_b1 * _n_t_b4)) + (((0.5 * _n_a_b2) * _n_t_b4) * _n_t_b4)), (_n_v_b1 + (_n_a_b2 * _n_t_b4))]
	var _n_e_b5 = exp(((-_n_k_b3) * _n_t_b4))
	var _n_vt_b6 = (float(_n_a_b2)/_n_k_b3)
	return [((_n_x_b0 + (_n_vt_b6 * _n_t_b4)) + (float(((_n_v_b1 - _n_vt_b6) * (1 - _n_e_b5)))/_n_k_b3)), (_n_vt_b6 + ((_n_v_b1 - _n_vt_b6) * _n_e_b5))]
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_along = _S.read(_parent,"along")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_vy_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_ax_b5 = _S.arg(_args,5)
	var _n_ay_b6 = _S.arg(_args,6)
	var _n_kx_b7 = _S.arg(_args,7)
	var _n_ky_b8 = _S.arg(_args,8)
	var _n_X_b9 = _S.call_value(_n_along,[_n_x_b0, _n_vx_b2, _n_ax_b5, _n_kx_b7, _n_t_b4])
	var _n_Y_b10 = _S.call_value(_n_along,[_n_y_b1, _n_vy_b3, _n_ay_b6, _n_ky_b8, _n_t_b4])
	return [_S.index_value(_n_X_b9,0), _S.index_value(_n_Y_b10,0), _S.index_value(_n_X_b9,1), _S.index_value(_n_Y_b10,1)]
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_drift = _S.read(_parent,"drift")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_vy_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_floor_b5 = _S.coalesce(_S.arg(_args,5),func():return 0)
	var _n_g_b6 = _S.coalesce(_S.arg(_args,6),func():return 427)
	var _n_k_b7 = _S.coalesce(_S.arg(_args,7),func():return 2.2)
	var _n_s_b8 = [_n_x_b0, _n_y_b1, _n_vx_b2, _n_vy_b3]
	var _n_left_b9 = _n_t_b4
	if true:
		var _n_b_b11 = 0
		while _S.truth((_n_b_b11 < 3)):
			var _n_e_b12 = _S.call_value(_n_drift,[_S.index_value(_n_s_b8,0), _S.index_value(_n_s_b8,1), _S.index_value(_n_s_b8,2), _S.index_value(_n_s_b8,3), _n_left_b9, 0, _n_g_b6, _n_k_b7, _n_k_b7])
			if _S.truth(((_S.index_value(_n_e_b12,1) < _n_floor_b5) if _S.truth((_S.index_value(_n_e_b12,1) < _n_floor_b5)) else (_S.index_value(_n_s_b8,1) >= _n_floor_b5))):
				return _n_e_b12
			var _n_lo_b13 = 0
			var _n_hi_b14 = _n_left_b9
			if true:
				var _n_i_b16 = 0
				while _S.truth((_n_i_b16 < 16)):
					var _n_m_b17 = (float((_n_lo_b13 + _n_hi_b14))/2)
					if _S.truth((_S.index_value(_S.call_value(_n_drift,[_S.index_value(_n_s_b8,0), _S.index_value(_n_s_b8,1), _S.index_value(_n_s_b8,2), _S.index_value(_n_s_b8,3), _n_m_b17, 0, _n_g_b6, _n_k_b7, _n_k_b7]),1) < _n_floor_b5)):
						_n_lo_b13 = _n_m_b17
					else:
						_n_hi_b14 = _n_m_b17
					_n_i_b16 += 1.0
			var _n_c_b15 = _S.call_value(_n_drift,[_S.index_value(_n_s_b8,0), _S.index_value(_n_s_b8,1), _S.index_value(_n_s_b8,2), _S.index_value(_n_s_b8,3), _n_hi_b14, 0, _n_g_b6, _n_k_b7, _n_k_b7])
			_n_s_b8 = [_S.index_value(_n_c_b15,0), (_n_floor_b5 - 0.25), (_S.index_value(_n_c_b15,2) * 0.7), ((-absf(_S.index_value(_n_c_b15,3))) * 0.45)]
			_n_left_b9 -= _n_hi_b14
			_n_b_b11 += 1.0
	var _n_e_b10 = _S.call_value(_n_drift,[_S.index_value(_n_s_b8,0), _S.index_value(_n_s_b8,1), _S.index_value(_n_s_b8,2), _S.index_value(_n_s_b8,3), _n_left_b9, 0, _n_g_b6, _n_k_b7, _n_k_b7])
	return (_n_e_b10 if _S.truth((_S.index_value(_n_e_b10,1) < _n_floor_b5)) else [_S.index_value(_n_e_b10,0), (_n_floor_b5 - 0.25), _S.index_value(_n_e_b10,2), 0])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_rx_b3 = _S.arg(_args,3)
	var _n_ry_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.arg(_args,6)
	if _S.truth((((_n_k_b6 <= 0.004) if _S.truth((_n_k_b6 <= 0.004)) else (_n_rx_b3 < 1)) if _S.truth(((_n_k_b6 <= 0.004) if _S.truth((_n_k_b6 <= 0.004)) else (_n_rx_b3 < 1))) else (_n_ry_b4 < 0.5))):
		return null
	_S.invoke(_n_p_b0,"shade",[(_n_x_b1 - _n_rx_b3), (_n_y_b2 - _n_ry_b4), (_n_x_b1 + _n_rx_b3), (_n_y_b2 + _n_ry_b4), _S.function_value(_S.capture(_parent,{"x":_n_x_b1,"rx":_n_rx_b3,"y":_n_y_b2,"ry":_n_ry_b4,"c":_n_c_b5,"k":_n_k_b6,"this":_this}),"_f18")])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_rx = _S.read(_parent,"rx")
	var _n_y = _S.read(_parent,"y")
	var _n_ry = _S.read(_parent,"ry")
	var _n_c = _S.read(_parent,"c")
	var _n_k = _S.read(_parent,"k")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (float((_n_px_b0 - _n_x))/_n_rx)
	var _n_dy_b4 = (float((_n_py_b1 - _n_y))/_n_ry)
	var _n_d_b5 = ((_n_dx_b3 * _n_dx_b3) + (_n_dy_b4 * _n_dy_b4))
	if _S.truth((_n_d_b5 >= 1)):
		return null
	var _n_f_b6 = (1 - sqrt(_n_d_b5))
	_S.set_prop(_n_out_b2,"l",_n_c,"=")
	_S.set_prop(_n_out_b2,"k",((_n_f_b6 * _n_f_b6) * _n_k),"=")
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_P = _S.read(_parent,"P")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_ps_b1 = _S.arg(_args,1)
	var _n_H_b2 = _S.arg(_args,2)
	var _n_layer_b3 = _S.arg(_args,3)
	var _n_all_b4 = _S.named_value(_n_ps_b1,"list")
	var _n_rest_b5 = []
	var _n_fire_b6 = []
	for _iter_0 in _S.array(_n_all_b4):
		var _n_q_b8 = _iter_0
		_S.invoke((_n_fire_b6 if _S.truth(_S.binary("===",_S.named_value(_n_q_b8,"k"),_S.named_value(_n_P,"FIRE"))) else _n_rest_b5),"push",[_n_q_b8])
	var _n_puffs_b7 = _S.function_value(_S.capture(_parent,{"fire":_n_fire_b6,"p":_n_p_b0,"H":_n_H_b2,"this":_this}),"_f20")
	_S.set_prop(_n_ps_b1,"list",_n_rest_b5,"=")
	if _S.truth(_S.binary("!==",_n_layer_b3,"front")):
		_S.invoke(_n_ps_b1,"draw",[_n_p_b0, "back"])
		_S.call_value(_n_puffs_b7,[true])
	if _S.truth(_S.binary("!==",_n_layer_b3,"back")):
		_S.call_value(_n_puffs_b7,[false])
		_S.invoke(_n_ps_b1,"draw",[_n_p_b0, "front"])
	_S.set_prop(_n_ps_b1,"list",_n_all_b4,"=")
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_PF = _S.read(_parent,"PF")
	var _n_firePuff = _S.read(_parent,"firePuff")
	var _n_p = _S.read(_parent,"p")
	var _n_H = _S.read(_parent,"H")
	var _n_fire = _S.read(_parent,"fire")
	var _n_back_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_fire):
		var _n_q_b1 = _iter_0
		if _S.truth((_S.binary("===",not _S.truth(not _S.truth(_S.binary("&",_S.named_value(_n_q_b1,"flag"),_S.named_value(_n_PF,"BACK")))),_n_back_b0) if _S.truth((_S.named_value(_n_q_b1,"delay") <= 0)) else (_S.named_value(_n_q_b1,"delay") <= 0))):
			_S.call_value(_n_firePuff,[_n_p, _S.named_value(_n_q_b1,"x"), _S.named_value(_n_q_b1,"y"), (float(_S.named_value(_n_q_b1,"life"))/_S.named_value(_n_q_b1,"max")), _S.named_value(_n_q_b1,"size"), fmod(_S.named_value(_n_q_b1,"seed"),1), _n_H])
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "T", _S.arg(_args, 2))
	_S.define(_e, "o", _S.arg(_args, 3))
	var _v32 = _S.read(_e, "o")
	_S.define(_e, "H", _S.prop(_v32, "H"))
	_S.define(_e, "D", _S.prop(_v32, "D"))
	_S.define(_e, "NL", _S.prop(_v32, "NL"))
	_S.define(_e, "S", _S.prop(_v32, "S"))
	_S.define(_e, "HC", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "X", _S.logical("??", _S.prop(_S.read(_e, "o"), "x"), func(): return 0))
	_S.define(_e, "Y", _S.logical("??", _S.prop(_S.read(_e, "o"), "y"), func(): return 0))
	_S.define(_e, "W", _S.logical("??", _S.prop(_S.read(_e, "o"), "spread"), func(): return 6))
	_S.define(_e, "G", _S.logical("??", _S.prop(_S.read(_e, "o"), "glow"), func(): return 1))
	_S.define(_e, "N", _S.function_value(_e, "_f22"))
	_S.define(_e, "fla", _S.function_value(_e, "_f23"))
	_S.define(_e, "fl", _S.call_value(_S.read(_e, "fla"), [_S.read(_e, "t")]))
	_S.define(_e, "SMOKE", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "SMOKE1"), _S.prop(_S.read(_e, "H"), 6), 0.25]))
	_S.define(_e, "EMB", [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 6)])
	_S.define(_e, "GLOW", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), 0.5]), _S.read(_e, "WHITE"), 0.25]))
	_S.define(_e, "R", _S.call_value(_S.read(_e, "rng"), [_S.read(_e, "S"), 77]))
	_S.define(_e, "count", _S.function_value(_e, "_f24"))
	_S.define(_e, "TT", _S.invoke(_S.read(_e, "T"), "map", [_S.function_value(_e, "_f25")]))
	_S.define(_e, "lean", _S.function_value(_e, "_f26"))
	_S.define(_e, "height", _S.function_value(_e, "_f27"))
	_S.define(_e, "sweep", _S.function_value(_e, "_f28"))
	_S.define(_e, "tip", _S.function_value(_e, "_f29"))
	_S.define(_e, "tongueAt", _S.function_value(_e, "_f30"))
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.call_value(_S.read(_e, "count"), [_S.logical("??", _S.prop(_S.read(_e, "o"), "smoke"), func(): return 12)]), _S.binary("+", _S.read(_e, "S"), 300), _S.function_value(_e, "_f31"), _S.function_value(_e, "_f32")])
	_S.define(_e, "puffs", [])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.binary("*", _S.prop(_S.read(_e, "TT"), "length"), _S.call_value(_S.read(_e, "count"), [_S.logical("??", _S.prop(_S.read(_e, "o"), "puffs"), func(): return 8)])), _S.binary("+", _S.read(_e, "S"), 200), _S.function_value(_e, "_f33"), _S.function_value(_e, "_f34")])
	var _v40 = _S.scope(_e)
	_S.define(_v40, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v40, "i"), _S.prop(_S.read(_v40, "TT"), "length"))):
		if _S.truth(_S.prop(_S.prop(_S.read(_v40, "TT"), _S.read(_v40, "i")), "back")):
			_S.call_value(_S.read(_v40, "tongueAt"), [_S.read(_v40, "i")])
		_v40 = _S.iteration(_v40)
		_S.write(_v40, "i", 1, "+=", true)
	var _v41 = _S.scope(_e)
	_S.define(_v41, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v41, "i"), _S.prop(_S.read(_v41, "TT"), "length"))):
		if _S.truth(_S.unary("!", _S.prop(_S.prop(_S.read(_v41, "TT"), _S.read(_v41, "i")), "back"))):
			_S.call_value(_S.read(_v41, "tongueAt"), [_S.read(_v41, "i")])
		_v41 = _S.iteration(_v41)
		_S.write(_v41, "i", 1, "+=", true)
	_S.optional_call(_S.prop(_S.read(_e, "o"), "mid"), [_S.read(_e, "fl")])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.binary("*", _S.prop(_S.read(_e, "TT"), "length"), _S.call_value(_S.read(_e, "count"), [_S.logical("??", _S.prop(_S.read(_e, "o"), "licks"), func(): return 4)])), _S.binary("+", _S.read(_e, "S"), 220), _S.function_value(_e, "_f35"), _S.function_value(_e, "_f36")])
	for _v43 in _S.array(_S.read(_e, "puffs")):
		var _v44 = _S.scope(_e)
		var _v45 = _v43
		_S.define(_v44, "x", _S.prop(_v45, 0))
		_S.define(_v44, "y", _S.prop(_v45, 1))
		_S.define(_v44, "k", _S.prop(_v45, 2))
		_S.define(_v44, "s", _S.prop(_v45, 3))
		_S.define(_v44, "f", _S.prop(_v45, 4))
		_S.call_value(_S.read(_v44, "firePuff"), [_S.read(_v44, "p"), _S.read(_v44, "x"), _S.read(_v44, "y"), _S.read(_v44, "k"), _S.read(_v44, "s"), _S.read(_v44, "f"), _S.read(_v44, "H")])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.call_value(_S.read(_e, "count"), [_S.logical("??", _S.prop(_S.read(_e, "o"), "embers"), func(): return 8)]), _S.binary("+", _S.read(_e, "S"), 500), _S.function_value(_e, "_f37"), _S.function_value(_e, "_f38")])
	if _S.truth(_S.binary(">", _S.read(_e, "G"), 0)):
		var _v47 = _S.scope(_e)
		_S.define(_v47, "R1", _S.logical("??", _S.prop(_S.read(_v47, "o"), "glowR"), func(): return 46))
		_S.define(_v47, "lx", _S.binary("+", _S.read(_v47, "X"), _S.binary("*", _S.call_value(_S.read(_v47, "lean"), [_S.read(_v47, "t")]), 12)))
		_S.invoke(_S.read(_v47, "p"), "glow", [_S.read(_v47, "lx"), _S.binary("-", _S.read(_v47, "Y"), _S.binary("*", _S.read(_v47, "HC"), 0.35)), _S.binary("*", _S.read(_v47, "R1"), 1.5), _S.read(_v47, "GLOW"), _S.binary("*", _S.binary("*", 0.22, _S.read(_v47, "fl")), _S.read(_v47, "G"))])
		_S.invoke(_S.read(_v47, "p"), "glow", [_S.read(_v47, "lx"), _S.binary("-", _S.read(_v47, "Y"), _S.binary("*", _S.read(_v47, "HC"), 0.75)), _S.read(_v47, "R1"), _S.read(_v47, "GLOW"), _S.binary("*", _S.binary("*", 0.34, _S.read(_v47, "fl")), _S.read(_v47, "G"))])
		_S.invoke(_S.read(_v47, "p"), "glow", [_S.read(_v47, "X"), _S.binary("-", _S.read(_v47, "Y"), _S.binary("*", _S.read(_v47, "HC"), 0.2)), _S.binary("*", _S.read(_v47, "R1"), 0.32), _S.prop(_S.read(_v47, "H"), 2), _S.binary("*", _S.binary("*", 0.2, _S.read(_v47, "fl")), _S.read(_v47, "G"))])
		_S.invoke(_S.read(_v47, "p"), "glow", [_S.read(_v47, "X"), _S.binary("-", _S.read(_v47, "Y"), 2), 8, _S.prop(_S.read(_v47, "H"), 0), _S.binary("*", _S.binary("*", 0.14, _S.read(_v47, "fl")), _S.read(_v47, "G"))])
	return _S.merge([{"tip": _S.read(_e, "tip")}, {"fl": _S.read(_e, "fl")}])

static func _f22(_parent,_args:Array,_this=null):
	var _n_NL = _S.read(_parent,"NL")
	var _n_t = _S.read(_parent,"t")
	var _n_rate_b0 = _S.arg(_args,0)
	var _n_seed_b1 = _S.coalesce(_S.arg(_args,1),func():return 0)
	var _n_off_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	return _S.call_value(_n_NL,[_n_t, _n_rate_b0, _n_seed_b1, _n_off_b2])
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_NL = _S.read(_parent,"NL")
	var _n_S = _S.read(_parent,"S")
	var _n_tt_b0 = _S.arg(_args,0)
	return ((0.74 + (0.16 * _S.call_value(_n_NL,[_n_tt_b0, 7.3, (_n_S + 1)]))) + (0.1 * _S.call_value(_n_NL,[_n_tt_b0, 19, (_n_S + 2)])))
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_rate_b0 = _S.arg(_args,0)
	return floori((_n_rate_b0 * _n_D)+0.5)
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_HC = _S.read(_parent,"HC")
	var _n_S = _S.read(_parent,"S")
	var _tuple_0 = _S.arg(_args,0)
	var _n_dx_b0 = _S.prop(_tuple_0,0)
	var _n_dy_b1 = _S.prop(_tuple_0,1)
	var _n_h_b2 = _S.prop(_tuple_0,2)
	var _n_w_b3 = _S.prop(_tuple_0,3)
	var _n_back_b4 = _S.prop(_tuple_0,4)
	var _n_i_b5 = _S.arg(_args,1)
	return {"dx":(_n_dx_b0 + _S.invoke(_n_R,"range",[(-0.3), 0.3])),"y":_n_dy_b1,"h":(2 + ((_n_HC * _n_h_b2) * _S.invoke(_n_R,"range",[0.92, 1.08]))),"w":(_n_w_b3 * _S.invoke(_n_R,"range",[0.92, 1.08])),"back":_n_back_b4,"env":_n_h_b2,"n":(((_n_S * 7) + _n_i_b5) * 13)}
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_NL = _S.read(_parent,"NL")
	var _n_S = _S.read(_parent,"S")
	var _n_o = _S.read(_parent,"o")
	var _n_tt_b0 = _S.arg(_args,0)
	return (_S.call_value(_n_NL,[_n_tt_b0, 0.67, (_n_S + 90)]) * (_S.named_value(_n_o,"lean") if _S.named_value(_n_o,"lean")!=null else 0.1))
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_TT = _S.read(_parent,"TT")
	var _n_NL = _S.read(_parent,"NL")
	var _n_fla = _S.read(_parent,"fla")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.arg(_args,1)
	var _object_0 = _S.index_value(_n_TT,_n_i_b0)
	var _n_h_b2 = _S.named_value(_object_0,"h")
	var _n_n_b3 = _S.named_value(_object_0,"n")
	var _n_leap_b4 = (maxf(0,(_S.call_value(_n_NL,[_n_tt_b1, 2.6, (_n_n_b3 + 70)]) - 0.55)) * 1.4)
	return (((_n_h_b2 + ((0.25 * _n_h_b2) * _S.call_value(_n_NL,[_n_tt_b1, 3.3, _n_n_b3]))) + (_n_h_b2 * _n_leap_b4)) * (0.9 + (0.1 * _S.call_value(_n_fla,[_n_tt_b1]))))
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_NL = _S.read(_parent,"NL")
	var _n_TT = _S.read(_parent,"TT")
	var _n_lean = _S.read(_parent,"lean")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.arg(_args,1)
	var _n_h_b2 = _S.arg(_args,2)
	return (((_S.call_value(_n_NL,[_n_tt_b1, 2.2, (_S.named_value(_S.index_value(_n_TT,_n_i_b0),"n") + 40)]) * (1 + (_n_h_b2 * 0.08))) + ((_S.call_value(_n_lean,[_n_tt_b1]) * _n_h_b2) * 0.9)) - clampf((_S.named_value(_S.index_value(_n_TT,_n_i_b0),"dx") * 0.3),(-2.5),2.5))
	return null

static func _f29(_parent,_args:Array,_this=null):
	var _n_height = _S.read(_parent,"height")
	var _n_X = _S.read(_parent,"X")
	var _n_TT = _S.read(_parent,"TT")
	var _n_sweep = _S.read(_parent,"sweep")
	var _n_Y = _S.read(_parent,"Y")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.arg(_args,1)
	var _n_h_b2 = _S.call_value(_n_height,[_n_i_b0, _n_tt_b1])
	return [((_n_X + _S.named_value(_S.index_value(_n_TT,_n_i_b0),"dx")) + (_S.call_value(_n_sweep,[_n_i_b0, _n_tt_b1, _n_h_b2]) * 0.85)), (((_n_Y + _S.named_value(_S.index_value(_n_TT,_n_i_b0),"y")) - (_n_h_b2 * 0.88)) + 3), _n_h_b2]
	return null

static func _f30(_parent,_args:Array,_this=null):
	var _n_TT = _S.read(_parent,"TT")
	var _n_height = _S.read(_parent,"height")
	var _n_t = _S.read(_parent,"t")
	var _n_flameTongue = _S.read(_parent,"flameTongue")
	var _n_p = _S.read(_parent,"p")
	var _n_X = _S.read(_parent,"X")
	var _n_Y = _S.read(_parent,"Y")
	var _n_sweep = _S.read(_parent,"sweep")
	var _n_N = _S.read(_parent,"N")
	var _n_H = _S.read(_parent,"H")
	var _n_BACK_LAYERS = _S.read(_parent,"BACK_LAYERS")
	var _n_BIG_LAYERS = _S.read(_parent,"BIG_LAYERS")
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_i_b0 = _S.arg(_args,0)
	var _object_0 = _S.index_value(_n_TT,_n_i_b0)
	var _n_dx_b1 = _S.named_value(_object_0,"dx")
	var _n_y_b2 = _S.named_value(_object_0,"y")
	var _n_w_b3 = _S.named_value(_object_0,"w")
	var _n_n_b4 = _S.named_value(_object_0,"n")
	var _n_back_b5 = _S.named_value(_object_0,"back")
	var _n_h_b6 = _S.call_value(_n_height,[_n_i_b0, _n_t])
	_S.call_value(_n_flameTongue,[_n_p, (_n_X + _n_dx_b1), (_n_Y + _n_y_b2), _n_h_b6, _n_w_b3, _S.call_value(_n_sweep,[_n_i_b0, _n_t, _n_h_b6]), _n_N, _n_n_b4, _n_H, (_n_BACK_LAYERS if _S.truth(_n_back_b5) else (_n_BIG_LAYERS if _S.truth((_n_w_b3 > 2.2)) else _n_LAYERS)), 0.5, (1.1 + (_n_h_b6 * 0.04))])
	return null

static func _f31(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", _S.read(_e, "W")), _S.read(_e, "W")]), 0.7)}, {"y": _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_e, "HC")), 0.8), _S.invoke(_S.read(_e, "r"), "range", [0, 6]))}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 2), 2])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [10, 17]))}, {"life": _S.invoke(_S.read(_e, "r"), "range", _S.concat([_S.array(_S.logical("??", _S.prop(_S.read(_e, "o"), "smokeLife"), func(): return [1.6, 2.6]))]))}, {"s": _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0.7, 1.1]), _S.logical("??", _S.prop(_S.read(_e, "o"), "smokeSize"), func(): return 3))}])

static func _f32(_parent,_args:Array,_this=null):
	var _n_drift = _S.read(_parent,"drift")
	var _n_o = _S.read(_parent,"o")
	var _n_smokePuff = _S.read(_parent,"smokePuff")
	var _n_p = _S.read(_parent,"p")
	var _n_X = _S.read(_parent,"X")
	var _n_NL = _S.read(_parent,"NL")
	var _n_t = _S.read(_parent,"t")
	var _n_S = _S.read(_parent,"S")
	var _n_Y = _S.read(_parent,"Y")
	var _n_SMOKE = _S.read(_parent,"SMOKE")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_drift,[_S.named_value(_n_q_b0,"x"), _S.named_value(_n_q_b0,"y"), _S.named_value(_n_q_b0,"vx"), _S.named_value(_n_q_b0,"vy"), _n_age_b1, (_S.named_value(_n_o,"wind") if _S.named_value(_n_o,"wind")!=null else 3), (-20), 1.6, 1])
	var _n_x_b2 = _S.prop(_tuple_0,0)
	var _n_y_b3 = _S.prop(_tuple_0,1)
	_S.call_value(_n_smokePuff,[_n_p, ((_n_X + _n_x_b2) + (_S.call_value(_n_NL,[(_n_t - _n_age_b1), 0.8, (_n_S + 60)]) * (1.5 + (2.5 * _n_age_b1)))), (_n_Y + _n_y_b3), (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life"))), _S.named_value(_n_q_b0,"s"), _n_SMOKE])
	return null

static func _f33(_parent,_args:Array,_this=null):
	var _n_TT = _S.read(_parent,"TT")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	var _n_i_b2 = fmod(_n_j_b1,_S.prop(_n_TT,"length"))
	var _n_fire_b3 = _S.invoke(_n_r_b0,"range",[0.14, 0.3])
	var _n_smokes_b4 = _S.invoke(_n_r_b0,"chance",[0.45])
	return {"i":_n_i_b2,"fire":_n_fire_b3,"smokes":_n_smokes_b4,"sl":_S.invoke(_n_r_b0,"range",[0.8, 1.4]),"ox":_S.invoke(_n_r_b0,"range",[(-1), 1]),"oy":_S.invoke(_n_r_b0,"range",[0, 4]),"vx":_S.invoke(_n_r_b0,"range",[(-4), 4]),"vy":(-_S.invoke(_n_r_b0,"range",[15, 30])),"s":(_S.invoke(_n_r_b0,"range",[0.8, 1.6]) * (0.8 + (0.6 * _S.named_value(_S.index_value(_n_TT,_n_i_b2),"env")))),"f":_S.invoke(_n_r_b0,"next",[]),"life":(_n_fire_b3 + (1.4 if _S.truth(_n_smokes_b4) else 0))}
	return null

static func _f34(_parent,_args:Array,_this=null):
	var _n_tip = _S.read(_parent,"tip")
	var _n_t = _S.read(_parent,"t")
	var _n_drift = _S.read(_parent,"drift")
	var _n_puffs = _S.read(_parent,"puffs")
	var _n_o = _S.read(_parent,"o")
	var _n_smokePuff = _S.read(_parent,"smokePuff")
	var _n_p = _S.read(_parent,"p")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_tip,[_S.named_value(_n_q_b0,"i"), (_n_t - _n_age_b1)])
	var _n_tx_b2 = _S.prop(_tuple_0,0)
	var _n_ty_b3 = _S.prop(_tuple_0,1)
	var _tuple_1 = _S.call_value(_n_drift,[(_n_tx_b2 + _S.named_value(_n_q_b0,"ox")), (_n_ty_b3 + _S.named_value(_n_q_b0,"oy")), _S.named_value(_n_q_b0,"vx"), _S.named_value(_n_q_b0,"vy"), minf(_n_age_b1,_S.named_value(_n_q_b0,"fire")), 0, (-95), 5, 3.2])
	var _n_x_b4 = _S.prop(_tuple_1,0)
	var _n_y_b5 = _S.prop(_tuple_1,1)
	var _n_vx_b6 = _S.prop(_tuple_1,2)
	var _n_vy_b7 = _S.prop(_tuple_1,3)
	if _S.truth((_n_age_b1 < _S.named_value(_n_q_b0,"fire"))):
		return _S.invoke(_n_puffs,"push",[[_n_x_b4, _n_y_b5, (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"fire"))), _S.named_value(_n_q_b0,"s"), _S.named_value(_n_q_b0,"f")]])
	if _S.truth(((_n_age_b1 - _S.named_value(_n_q_b0,"fire")) > _S.named_value(_n_q_b0,"sl"))):
		return null
	var _tuple_2 = _S.call_value(_n_drift,[_n_x_b4, _n_y_b5, (_n_vx_b6 * 0.6), ((_n_vy_b7 * 0.6) - 6), (_n_age_b1 - _S.named_value(_n_q_b0,"fire")), (_S.named_value(_n_o,"wind") if _S.named_value(_n_o,"wind")!=null else 3), (-16), 1.6, 1.2])
	var _n_sx_b8 = _S.prop(_tuple_2,0)
	var _n_sy_b9 = _S.prop(_tuple_2,1)
	_S.call_value(_n_smokePuff,[_n_p, _n_sx_b8, _n_sy_b9, (1 - (float((_n_age_b1 - _S.named_value(_n_q_b0,"fire")))/_S.named_value(_n_q_b0,"sl"))), (_S.named_value(_n_q_b0,"s") * 0.7), 0])
	return null

static func _f35(_parent,_args:Array,_this=null):
	var _n_TT = _S.read(_parent,"TT")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return {"i":fmod(_n_j_b1,_S.prop(_n_TT,"length")),"vx":_S.invoke(_n_r_b0,"range",[(-3), 3]),"vy":(-_S.invoke(_n_r_b0,"range",[12, 22])),"s":(_S.invoke(_n_r_b0,"range",[0.9, 1.6]) * (0.8 + (0.5 * _S.named_value(_S.index_value(_n_TT,fmod(_n_j_b1,_S.prop(_n_TT,"length"))),"env")))),"life":0.26}
	return null

static func _f36(_parent,_args:Array,_this=null):
	var _n_tip = _S.read(_parent,"tip")
	var _n_t = _S.read(_parent,"t")
	var _n_lick = _S.read(_parent,"lick")
	var _n_p = _S.read(_parent,"p")
	var _n_H = _S.read(_parent,"H")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_tip,[_S.named_value(_n_q_b0,"i"), (_n_t - _n_age_b1)])
	var _n_tx_b2 = _S.prop(_tuple_0,0)
	var _n_ty_b3 = _S.prop(_tuple_0,1)
	_S.call_value(_n_lick,[_n_p, (_n_tx_b2 + (_S.named_value(_n_q_b0,"vx") * _n_age_b1)), ((_n_ty_b3 - 2) + (_S.named_value(_n_q_b0,"vy") * _n_age_b1)), (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life"))), _S.named_value(_n_q_b0,"s"), _n_H])
	return null

static func _f37(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_HC = _S.read(_parent,"HC")
	var _n_r_b0 = _S.arg(_args,0)
	return {"x":_S.invoke(_n_r_b0,"range",[(-_n_W), _n_W]),"y":(-_S.invoke(_n_r_b0,"range",[(_n_HC * 0.3), (_n_HC * 0.8)])),"vx":_S.invoke(_n_r_b0,"range",[(-15), 15]),"vy":(-_S.invoke(_n_r_b0,"range",[25, 60])),"life":_S.invoke(_n_r_b0,"range",[1.1, 2.4]),"s":(2 if _S.truth(_S.invoke(_n_r_b0,"chance",[0.15])) else _S.invoke(_n_r_b0,"range",[1, 1.6])),"a":_S.invoke(_n_r_b0,"range",[0, 6.3]),"b":_S.invoke(_n_r_b0,"range",[0, 6.3])}
	return null

static func _f38(_parent,_args:Array,_this=null):
	var _n_drift = _S.read(_parent,"drift")
	var _n_ember = _S.read(_parent,"ember")
	var _n_p = _S.read(_parent,"p")
	var _n_X = _S.read(_parent,"X")
	var _n_Y = _S.read(_parent,"Y")
	var _n_EMB = _S.read(_parent,"EMB")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_drift,[_S.named_value(_n_q_b0,"x"), _S.named_value(_n_q_b0,"y"), _S.named_value(_n_q_b0,"vx"), _S.named_value(_n_q_b0,"vy"), _n_age_b1, 0, (-30), 1.6, 1.6])
	var _n_x_b2 = _S.prop(_tuple_0,0)
	var _n_y_b3 = _S.prop(_tuple_0,1)
	_S.call_value(_n_ember,[_n_p, ((_n_X + _n_x_b2) + (7 * (sin(((_n_age_b1 * 2.3) + _S.named_value(_n_q_b0,"a"))) - sin(_S.named_value(_n_q_b0,"a"))))), ((_n_Y + _n_y_b3) + (2 * (sin(((_n_age_b1 * 3) + _S.named_value(_n_q_b0,"b"))) - sin(_S.named_value(_n_q_b0,"b"))))), (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life"))), _S.named_value(_n_q_b0,"s"), _n_EMB, ((_n_age_b1 * 40) + _S.named_value(_n_q_b0,"a"))])
	return null

static func _f39(_parent,_args:Array,_this=null):
	var _n_N_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.coalesce(_S.arg(_args,1),func():return 0)
	return ((0.74 + (0.16 * _S.call_value(_n_N_b0,[7.3, (1 + _n_s_b1)]))) + (0.1 * _S.call_value(_n_N_b0,[19, (2 + _n_s_b1)])))
	return null

static func _f40(_parent,_args:Array,_this=null):
	var _n_F_b0 = _S.arg(_args,0)
	return _S.invoke(_S.concat([_S.array(_n_F_b0)]),"reverse",[])
	return null

static func _f41(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	return _S.index_value(_n_r_b0,minf((_S.prop(_n_r_b0,"length") - 1),maxf(0,floori((_n_t_b1 * _S.prop(_n_r_b0,"length"))))))
	return null
