@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f11":"grid_idx","_f12":"grid_set_value","_f13":"grid_get_value","_f16":"grid_shade","_f17":"grid_ellipse","_f19":"grid_line","_f29":"grid_outline","_f31":"grid_draw","_f32":"grid_clear"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "curve", _S.function_value(_e, "_f0"))
	_S.define(_e, "toss", _S.function_value(_e, "_f1"))
	_S.define(_e, "tongue", _S.function_value(_e, "_f2"))
	_S.define(_e, "firePuff", _S.function_value(_e, "_f3"))
	_S.define(_e, "bubble", _S.function_value(_e, "_f4"))
	_S.define(_e, "shadow", _S.function_value(_e, "_f5"))
	_S.define(_e, "bounce", _S.function_value(_e, "_f6"))
	_S.define(_e, "shift", _S.function_value(_e, "_f7"))
	_exports["shift"] = _S.read(_e, "shift")
	_exports["curve"] = _S.read(_e, "curve")
	_S.define(_e, "lnoise", _S.function_value(_e, "_f8"))
	_exports["lnoise"] = _S.read(_e, "lnoise")
	_S.define(_e, "spring", _S.function_value(_e, "_f9"))
	_exports["spring"] = _S.read(_e, "spring")
	_exports["toss"] = _S.read(_e, "toss")
	_S.define(_e, "Grid", _S.class_value("Grid", _S.function_value(_e, "_f10"), {"idx": _S.function_value(_e, "_f11"), "set": _S.function_value(_e, "_f12"), "get": _S.function_value(_e, "_f13"), "tagAt": _S.function_value(_e, "_f14"), "erase": _S.function_value(_e, "_f15"), "shade": _S.function_value(_e, "_f16"), "ellipse": _S.function_value(_e, "_f17"), "line": _S.function_value(_e, "_f19"), "tube": _S.function_value(_e, "_f20"), "poly": _S.function_value(_e, "_f22"), "sprite": _S.function_value(_e, "_f24"), "depths": _S.function_value(_e, "_f27"), "depth": _S.function_value(_e, "_f28"), "outline": _S.function_value(_e, "_f29"), "recolor": _S.function_value(_e, "_f30"), "draw": _S.function_value(_e, "_f31"), "clear": _S.function_value(_e, "_f32")}, {}, {}, null))
	_exports["Grid"] = _S.read(_e, "Grid")
	_S.define(_e, "Swarm", _S.class_value("Swarm", _S.function_value(_e, "_f33"), {"begin": _S.function_value(_e, "_f34"), "add": _S.function_value(_e, "_f35"), "draw": _S.function_value(_e, "_f36")}, {}, {}, null))
	_exports["Swarm"] = _S.read(_e, "Swarm")
	_S.define(_e, "LAYERS", [[1, 1, 6], [0.76, 0.86, 4], [0.54, 0.68, 2], [0.3, 0.42, 0]])
	_exports["tongue"] = _S.read(_e, "tongue")
	_exports["firePuff"] = _S.read(_e, "firePuff")
	_exports["bubble"] = _S.read(_e, "bubble")
	_exports["shadow"] = _S.read(_e, "shadow")
	_exports["bounce"] = _S.read(_e, "bounce")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_list_b1 = _S.arg(_args,1)
	if _S.truth((_n_x_b0 <= _S.index_value(_S.index_value(_n_list_b1,0),0))):
		return _S.index_value(_S.index_value(_n_list_b1,0),1)
	if true:
		var _n_i_b2 = 1
		while _S.truth((_n_i_b2 < _S.prop(_n_list_b1,"length"))):
			var _tuple_0 = _S.index_value(_n_list_b1,(_n_i_b2 - 1))
			var _n_x0_b3 = _S.prop(_tuple_0,0)
			var _n_v0_b4 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_list_b1,_n_i_b2)
			var _n_x1_b5 = _S.prop(_tuple_1,0)
			var _n_v1_b6 = _S.prop(_tuple_1,1)
			if _S.truth((_n_x_b0 <= _n_x1_b5)):
				var _n_u_b7 = (float((_n_x_b0 - _n_x0_b3))/((_n_x1_b5 - _n_x0_b3) if _S.truth((_n_x1_b5 - _n_x0_b3)) else 1))
				return (_n_v0_b4 + ((((_n_v1_b6 - _n_v0_b4) * _n_u_b7) * _n_u_b7) * (3 - (2 * _n_u_b7))))
			_n_i_b2 += 1.0
	return _S.index_value(_S.index_value(_n_list_b1,(_S.prop(_n_list_b1,"length") - 1)),1)
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_vy_b3 = _S.arg(_args,3)
	var _n_age_b4 = _S.arg(_args,4)
	var _n_g_b5 = _S.arg(_args,5)
	var _n_floor_b6 = _S.coalesce(_S.arg(_args,6),func():return 0)
	var _n_tl_b7 = ((float(((-_n_vy_b3) + sqrt(maxf(0,((_n_vy_b3 * _n_vy_b3) + ((2 * _n_g_b5) * (_n_floor_b6 - _n_y_b1)))))))/_n_g_b5) if _S.truth((_n_g_b5 > 0)) else INF)
	if _S.truth((_n_age_b4 < _n_tl_b7)):
		return {"x":(_n_x_b0 + (_n_vx_b2 * _n_age_b4)),"y":((_n_y_b1 + (_n_vy_b3 * _n_age_b4)) + (((0.5 * _n_g_b5) * _n_age_b4) * _n_age_b4)),"vx":_n_vx_b2,"vy":(_n_vy_b3 + (_n_g_b5 * _n_age_b4)),"landed":false,"at":_n_tl_b7,"lx":(_n_x_b0 + (_n_vx_b2 * _n_tl_b7))}
	return {"x":(_n_x_b0 + (_n_vx_b2 * _n_tl_b7)),"y":_n_floor_b6,"vx":0,"vy":0,"landed":true,"at":_n_tl_b7,"lx":(_n_x_b0 + (_n_vx_b2 * _n_tl_b7))}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_lnoise = _S.read(_parent,"lnoise")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_h_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_sx_b5 = _S.arg(_args,5)
	var _n_t_b6 = _S.arg(_args,6)
	var _n_D_b7 = _S.arg(_args,7)
	var _n_n_b8 = _S.arg(_args,8)
	var _n_heat_b9 = _S.arg(_args,9)
	var _n_only_b10 = _S.coalesce(_S.arg(_args,10),func():return (-1))
	if _S.truth((_n_h_b3 < 1)):
		return null
	var _n_F1_b11 = maxf(1,floori((9 * _n_D_b7)+0.5))
	var _n_F2_b12 = maxf(1,floori((4 * _n_D_b7)+0.5))
	if true:
		var _n_li_b13 = 0
		while _S.truth((_n_li_b13 < _S.prop(_n_LAYERS,"length"))):
			if _S.truth((_S.binary("!==",_n_li_b13,_n_only_b10) if _S.truth((_n_only_b10 >= 0)) else (_n_only_b10 >= 0))):
				_n_li_b13 += 1.0
				continue
			var _tuple_0 = _S.index_value(_n_LAYERS,_n_li_b13)
			var _n_lw_b14 = _S.prop(_tuple_0,0)
			var _n_lh_b15 = _S.prop(_tuple_0,1)
			var _n_ri_b16 = _S.prop(_tuple_0,2)
			var _n_H_b17 = (_n_h_b3 * _n_lh_b15)
			var _n_col_b18 = _S.index_value(_n_heat_b9,_n_ri_b16)
			if true:
				var _n_r_b19 = 0
				while _S.truth((_n_r_b19 <= _n_H_b17)):
					var _n_u_b20 = (float(_n_r_b19)/maxf(1,_n_H_b17))
					var _n_half_b21 = ((((_n_w_b4 * _n_lw_b14) * pow((1 - _n_u_b20),0.85)) * minf(1,(float((_n_r_b19 + 1.5))/3.5))) + (_S.call_value(_n_lnoise,[_n_t_b6, _n_D_b7, _n_F1_b11, (_n_r_b19 * 0.45), _n_n_b8]) * 0.5))
					var _n_cx_b22 = ((_n_x_b1 + (((_n_sx_b5 * _n_u_b20) * _n_u_b20) * _n_lh_b15)) + ((_S.call_value(_n_lnoise,[_n_t_b6, _n_D_b7, _n_F2_b12, (_n_r_b19 * 0.2), (_n_n_b8 + 7)]) * _n_u_b20) * 1.1))
					if _S.truth((_n_half_b21 < 0.3)):
						_n_r_b19 += 1.0
						continue
					if true:
						var _n_px_b23 = floori((_n_cx_b22 - _n_half_b21)+0.5)
						while _S.truth((_n_px_b23 <= floori((_n_cx_b22 + _n_half_b21)+0.5))):
							_S.invoke(_n_p_b0,"px",[_n_px_b23, floori((_n_y_b2 - _n_r_b19)+0.5), _n_col_b18])
							_n_px_b23 += 1.0
					_n_r_b19 += 1.0
			_n_li_b13 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.arg(_args,3)
	var _n_size_b4 = _S.arg(_args,4)
	var _n_seed_b5 = _S.arg(_args,5)
	var _n_heat_b6 = _S.arg(_args,6)
	var _n_age_b7 = (1 - _n_k_b3)
	var _n_n_b8 = _S.prop(_n_heat_b6,"length")
	var _n_hot_b9 = minf(0.999,(pow(_n_age_b7,0.62) + (fmod(_n_seed_b5,1) * 0.1)))
	var _n_idx_b10 = minf((_n_n_b8 - 2),floori((_n_hot_b9 * (_n_n_b8 - 1))))
	var _n_r_b11 = ((_n_size_b4 * (0.55 + (0.45 * minf(1,(_n_age_b7 * 7))))) * (1 - (_n_age_b7 * 0.55)))
	var _n_c_b12 = _S.index_value(_n_heat_b6,_n_idx_b10)
	if _S.truth((_n_idx_b10 >= (_n_n_b8 - 2))):
		return _S.invoke(_n_p_b0,"disc",[_n_x_b1, _n_y_b2, _n_r_b11, _n_c_b12, (minf(1,(_n_k_b3 * 3)) * 0.85)])
	_S.invoke(_n_p_b0,"circle",[_n_x_b1, _n_y_b2, _n_r_b11, _S.index_value(_n_heat_b6,minf((_n_n_b8 - 1),(_n_idx_b10 + 2)))])
	_S.invoke(_n_p_b0,"circle",[(_n_x_b1 - (_n_r_b11 * 0.16)), (_n_y_b2 - (_n_r_b11 * 0.22)), (_n_r_b11 * 0.78), _n_c_b12])
	if _S.truth((_n_r_b11 > 1.6)):
		_S.invoke(_n_p_b0,"circle",[_n_x_b1, (_n_y_b2 - (_n_r_b11 * 0.9)), (_n_r_b11 * 0.42), _n_c_b12])
	if _S.truth(((_n_r_b11 > 1.8) if _S.truth((_n_idx_b10 <= 3)) else (_n_idx_b10 <= 3))):
		_S.invoke(_n_p_b0,"circle",[(_n_x_b1 - (_n_r_b11 * 0.28)), (_n_y_b2 - (_n_r_b11 * 0.34)), (_n_r_b11 * 0.36), _S.index_value(_n_heat_b6,maxf(0,(_n_idx_b10 - 1)))])
	if _S.truth((_n_idx_b10 < 6)):
		_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, ((_n_r_b11 * 2.4) + 2), _n_c_b12, (0.18 * _n_k_b3)])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_cx_b1 = _S.arg(_args,1)
	var _n_cy_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_cols_b4 = _S.arg(_args,4)
	var _n_a_b5 = _S.coalesce(_S.arg(_args,5),func():return 1)
	var _n_wob_b6 = _S.coalesce(_S.arg(_args,6),func():return 0)
	var _tuple_0 = _n_cols_b4
	var _n_HI_b7 = _S.prop(_tuple_0,0)
	var _n_LIT_b8 = _S.prop(_tuple_0,1)
	var _n_RIM_b9 = _S.prop(_tuple_0,2)
	var _n_SHADE_b10 = _S.prop(_tuple_0,3)
	if _S.truth((_n_r_b3 < 0.9)):
		return _S.invoke(_n_p_b0,"dot",[_n_cx_b1, _n_cy_b2, (_n_RIM_b9 if _S.truth((_n_r_b3 < 0.7)) else _n_LIT_b8), _n_a_b5])
	if _S.truth((_n_r_b3 < 1.5)):
		var _n_px_b15 = floori(_n_cx_b1)
		var _n_py_b16 = floori(_n_cy_b2)
		_S.invoke(_n_p_b0,"dot",[_n_px_b15, _n_py_b16, _n_HI_b7, _n_a_b5])
		_S.invoke(_n_p_b0,"dot",[(_n_px_b15 + 1), _n_py_b16, _n_LIT_b8, _n_a_b5])
		_S.invoke(_n_p_b0,"dot",[_n_px_b15, (_n_py_b16 + 1), _n_RIM_b9, _n_a_b5])
		_S.invoke(_n_p_b0,"dot",[(_n_px_b15 + 1), (_n_py_b16 + 1), _n_SHADE_b10, _n_a_b5])
		_S.invoke(_n_p_b0,"glow",[(_n_cx_b1 + 0.5), (_n_cy_b2 + 0.5), 3, _n_LIT_b8, (0.12 * _n_a_b5)])
		return null
	var _n_rx_b11 = (_n_r_b3 * (1 + _n_wob_b6))
	var _n_ry_b12 = (_n_r_b3 * (1 - _n_wob_b6))
	if true:
		var _n_y_b17 = floori(((_n_cy_b2 - _n_ry_b12) - 1))
		while _S.truth((_n_y_b17 <= ceili(((_n_cy_b2 + _n_ry_b12) + 1)))):
			if true:
				var _n_x_b18 = floori(((_n_cx_b1 - _n_rx_b11) - 1))
				while _S.truth((_n_x_b18 <= ceili(((_n_cx_b1 + _n_rx_b11) + 1)))):
					var _n_dx_b19 = (float(((_n_x_b18 + 0.5) - _n_cx_b1))/_n_rx_b11)
					var _n_dy_b20 = (float(((_n_y_b17 + 0.5) - _n_cy_b2))/_n_ry_b12)
					var _n_d_b21 = (sqrt(((_n_dx_b19 * _n_dx_b19) + (_n_dy_b20 * _n_dy_b20))) * _n_r_b3)
					if _S.truth((_n_d_b21 > (_n_r_b3 + 0.5))):
						_n_x_b18 += 1.0
						continue
					var _n_l_b22 = (float((float(((-_n_dx_b19) - _n_dy_b20))/sqrt(2.0)))/maxf(0.01,(float(_n_d_b21)/_n_r_b3)))
					if _S.truth((_n_d_b21 > (_n_r_b3 - 0.6))):
						_S.invoke(_n_p_b0,"dot",[_n_x_b18, _n_y_b17, (_n_LIT_b8 if _S.truth((_n_l_b22 > 0.45)) else (_n_SHADE_b10 if _S.truth((_n_l_b22 < (-0.55))) else _n_RIM_b9)), _n_a_b5])
					_n_x_b18 += 1.0
			_n_y_b17 += 1.0
	var _n_hx_b13 = floori((_n_cx_b1 - (_n_rx_b11 * 0.45))+0.5)
	var _n_hy_b14 = floori((_n_cy_b2 - (_n_ry_b12 * 0.45))+0.5)
	_S.invoke(_n_p_b0,"dot",[_n_hx_b13, _n_hy_b14, _n_HI_b7, _n_a_b5])
	if _S.truth((_n_r_b3 >= 2.5)):
		_S.invoke(_n_p_b0,"dot",[(_n_hx_b13 + 1), _n_hy_b14, _n_LIT_b8, _n_a_b5])
		_S.invoke(_n_p_b0,"dot",[_n_hx_b13, (_n_hy_b14 + 1), _n_LIT_b8, _n_a_b5])
	if _S.truth((_n_r_b3 >= 2)):
		_S.invoke(_n_p_b0,"dot",[floori((_n_cx_b1 + (_n_rx_b11 * 0.5))+0.5), floori((_n_cy_b2 + (_n_ry_b12 * 0.5))+0.5), _n_LIT_b8, _n_a_b5])
	_S.invoke(_n_p_b0,"glow",[_n_cx_b1, _n_cy_b2, ((_n_r_b3 * 2.4) + 2), _n_RIM_b9, (0.14 * _n_a_b5)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_cx_b1 = _S.arg(_args,1)
	var _n_cy_b2 = _S.arg(_args,2)
	var _n_rx_b3 = _S.arg(_args,3)
	var _n_ry_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_a_b6 = _S.arg(_args,6)
	if _S.truth((((_n_rx_b3 <= 0) if _S.truth((_n_rx_b3 <= 0)) else (_n_ry_b4 <= 0)) if _S.truth(((_n_rx_b3 <= 0) if _S.truth((_n_rx_b3 <= 0)) else (_n_ry_b4 <= 0))) else (_n_a_b6 <= 0))):
		return null
	if true:
		var _n_y_b7 = floori((_n_cy_b2 - _n_ry_b4))
		while _S.truth((_n_y_b7 <= ceili((_n_cy_b2 + _n_ry_b4)))):
			if true:
				var _n_x_b8 = floori((_n_cx_b1 - _n_rx_b3))
				while _S.truth((_n_x_b8 <= ceili((_n_cx_b1 + _n_rx_b3)))):
					var _n_d_b9 = (pow((float(((_n_x_b8 + 0.5) - _n_cx_b1))/_n_rx_b3),2) + pow((float(((_n_y_b7 + 0.5) - _n_cy_b2))/_n_ry_b4),2))
					if _S.truth((_n_d_b9 < 1)):
						_S.invoke(_n_p_b0,"blend",[_n_x_b8, _n_y_b7, _n_c_b5, (_n_a_b6 * pow((1 - _n_d_b9),0.7))])
					_n_x_b8 += 1.0
			_n_y_b7 += 1.0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_toss = _S.read(_parent,"toss")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_vy_b3 = _S.arg(_args,3)
	var _n_age_b4 = _S.arg(_args,4)
	var _n_g_b5 = _S.arg(_args,5)
	var _n_floor_b6 = _S.coalesce(_S.arg(_args,6),func():return 0)
	var _n_e_b7 = _S.coalesce(_S.arg(_args,7),func():return 0.45)
	var _n_hops_b8 = 0
	if true:
		while _S.truth((_n_hops_b8 < 6)):
			var _n_f_b9 = _S.call_value(_n_toss,[_n_x_b0, _n_y_b1, _n_vx_b2, _n_vy_b3, _n_age_b4, _n_g_b5, _n_floor_b6])
			if _S.truth(not _S.truth(_S.named_value(_n_f_b9,"landed"))):
				return {"x":_S.named_value(_n_f_b9,"x"),"y":_S.named_value(_n_f_b9,"y"),"vx":_S.named_value(_n_f_b9,"vx"),"vy":_S.named_value(_n_f_b9,"vy"),"hops":_n_hops_b8,"rest":false}
			var _n_vl_b10 = (_n_vy_b3 + (_n_g_b5 * _S.named_value(_n_f_b9,"at")))
			_n_age_b4 -= _S.named_value(_n_f_b9,"at")
			_n_x_b0 = _S.named_value(_n_f_b9,"lx")
			_n_y_b1 = (_n_floor_b6 - 0.01)
			_n_vx_b2 *= 0.7
			_n_vy_b3 = ((-_n_vl_b10) * _n_e_b7)
			if _S.truth((absf(_n_vy_b3) < 25)):
				break
			_n_hops_b8 += 1.0
	return {"x":_n_x_b0,"y":(_n_floor_b6 - 0.25),"vx":0,"vy":0,"hops":_n_hops_b8,"rest":true}
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_D_b1 = _S.arg(_args,1)
	var _n_seed_b2 = _S.coalesce(_S.arg(_args,2),func():return 1)
	return _S.call_value(_n_wrap,[(_n_t_b0 + (((_n_seed_b2 - 1) * 0.618) * _n_D_b1)), _n_D_b1])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	var _n_D_b1 = _S.arg(_args,1)
	var _n_F_b2 = _S.arg(_args,2)
	var _n_off_b3 = _S.coalesce(_S.arg(_args,3),func():return 0)
	var _n_seed_b4 = _S.coalesce(_S.arg(_args,4),func():return 0)
	return _S.NoiseKernels.tile_noise((((float(_n_t_b0)/_n_D_b1) * _n_F_b2) + _n_off_b3),0.5,_n_F_b2,0,_n_seed_b4)
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_hz_b1 = _S.arg(_args,1)
	var _n_damp_b2 = _S.arg(_args,2)
	return (0 if _S.truth((_n_age_b0 < 0)) else (exp(((-_n_age_b0) * _n_damp_b2)) * cos(((_n_age_b0 * _n_hz_b1) * _n_TAU))))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_Uint32Array = _S.read(_parent,"Uint32Array")
	var _n_Float32Array = _S.read(_parent,"Float32Array")
	var _n_Uint8Array = _S.read(_parent,"Uint8Array")
	var _n_x0_b0 = _S.arg(_args,0)
	var _n_y0_b1 = _S.arg(_args,1)
	var _n_w_b2 = _S.arg(_args,2)
	var _n_h_b3 = _S.arg(_args,3)
	_S.set_prop(_this,"x0",floori(_n_x0_b0),"=")
	_S.set_prop(_this,"y0",floori(_n_y0_b1),"=")
	_S.set_prop(_this,"w",_n_w_b2,"=")
	_S.set_prop(_this,"h",_n_h_b3,"=")
	_S.set_prop(_this,"c",_S.construct(_n_Uint32Array,[(_n_w_b2 * _n_h_b3)]),"=")
	_S.set_prop(_this,"a",_S.construct(_n_Float32Array,[(_n_w_b2 * _n_h_b3)]),"=")
	_S.set_prop(_this,"tag",_S.construct(_n_Uint8Array,[(_n_w_b2 * _n_h_b3)]),"=")
	_S.set_prop(_this,"o",{"a":1,"t":0},"=")
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_ix_b2 = (floori(_n_x_b0) - _S.named_value(_this,"x0"))
	var _n_iy_b3 = (floori(_n_y_b1) - _S.named_value(_this,"y0"))
	return ((-1) if _S.truth(((((_n_ix_b2 < 0) if _S.truth((_n_ix_b2 < 0)) else (_n_iy_b3 < 0)) if _S.truth(((_n_ix_b2 < 0) if _S.truth((_n_ix_b2 < 0)) else (_n_iy_b3 < 0))) else (_n_ix_b2 >= _S.named_value(_this,"w"))) if _S.truth((((_n_ix_b2 < 0) if _S.truth((_n_ix_b2 < 0)) else (_n_iy_b3 < 0)) if _S.truth(((_n_ix_b2 < 0) if _S.truth((_n_ix_b2 < 0)) else (_n_iy_b3 < 0))) else (_n_ix_b2 >= _S.named_value(_this,"w")))) else (_n_iy_b3 >= _S.named_value(_this,"h")))) else ((_n_iy_b3 * _S.named_value(_this,"w")) + _n_ix_b2))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.coalesce(_S.arg(_args,3),func():return 1)
	var _n_tag_b4 = _S.coalesce(_S.arg(_args,4),func():return 0)
	var _n_i_b5 = _S.invoke(_this,"idx",[_n_x_b0, _n_y_b1])
	if _S.truth((_n_c_b2 if _S.truth((_n_i_b5 >= 0)) else (_n_i_b5 >= 0))):
		_S.set_prop(_S.named_value(_this,"c"),_n_i_b5,_n_c_b2,"=")
		_S.set_prop(_S.named_value(_this,"a"),_n_i_b5,_n_a_b3,"=")
		_S.set_prop(_S.named_value(_this,"tag"),_n_i_b5,_n_tag_b4,"=")
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_i_b2 = _S.invoke(_this,"idx",[_n_x_b0, _n_y_b1])
	return (0 if _S.truth((_n_i_b2 < 0)) else _S.index_value(_S.named_value(_this,"c"),_n_i_b2))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_i_b2 = _S.invoke(_this,"idx",[_n_x_b0, _n_y_b1])
	return (0 if _S.truth((_n_i_b2 < 0)) else _S.index_value(_S.named_value(_this,"tag"),_n_i_b2))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_i_b2 = _S.invoke(_this,"idx",[_n_x_b0, _n_y_b1])
	if _S.truth((_n_i_b2 >= 0)):
		_S.set_prop(_S.named_value(_this,"c"),_n_i_b2,0,"=")
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_x0_b0 = _S.arg(_args,0)
	var _n_y0_b1 = _S.arg(_args,1)
	var _n_x1_b2 = _S.arg(_args,2)
	var _n_y1_b3 = _S.arg(_args,3)
	var _n_fn_b4 = _S.arg(_args,4)
	var _n_o_b5 = _S.named_value(_this,"o")
	if true:
		var _n_y_b6 = floori(_n_y0_b1)
		while _S.truth((_n_y_b6 <= floori(_n_y1_b3))):
			if true:
				var _n_x_b7 = floori(_n_x0_b0)
				while _S.truth((_n_x_b7 <= floori(_n_x1_b2))):
					_S.set_prop(_n_o_b5,"a",1,"=")
					_S.set_prop(_n_o_b5,"t",0,"=")
					var _n_c_b8 = _S.call_value(_n_fn_b4,[(_n_x_b7 + 0.5), (_n_y_b6 + 0.5), _n_o_b5])
					if _S.truth(_n_c_b8):
						_S.invoke(_this,"set",[_n_x_b7, _n_y_b6, _n_c_b8, _S.named_value(_n_o_b5,"a"), _S.named_value(_n_o_b5,"t")])
					_n_x_b7 += 1.0
			_n_y_b6 += 1.0
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_cx_b0 = _S.arg(_args,0)
	var _n_cy_b1 = _S.arg(_args,1)
	var _n_rx_b2 = _S.arg(_args,2)
	var _n_ry_b3 = _S.arg(_args,3)
	var _n_c_b4 = _S.arg(_args,4)
	var _n_a_b5 = _S.coalesce(_S.arg(_args,5),func():return 1)
	if _S.truth(((_n_rx_b2 <= 0) if _S.truth((_n_rx_b2 <= 0)) else (_n_ry_b3 <= 0))):
		return null
	_S.invoke(_this,"shade",[(_n_cx_b0 - _n_rx_b2), (_n_cy_b1 - _n_ry_b3), (_n_cx_b0 + _n_rx_b2), (_n_cy_b1 + _n_ry_b3), _S.function_value(_S.capture(_parent,{"cx":_n_cx_b0,"rx":_n_rx_b2,"cy":_n_cy_b1,"ry":_n_ry_b3,"a":_n_a_b5,"c":_n_c_b4,"this":_this}),"_f18")])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_rx = _S.read(_parent,"rx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_ry = _S.read(_parent,"ry")
	var _n_a = _S.read(_parent,"a")
	var _n_c = _S.read(_parent,"c")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_nx_b3 = (float((_n_x_b0 - _n_cx))/_n_rx)
	var _n_ny_b4 = (float((_n_y_b1 - _n_cy))/_n_ry)
	if _S.truth((((_n_nx_b3 * _n_nx_b3) + (_n_ny_b4 * _n_ny_b4)) > 1)):
		return 0
	_S.set_prop(_n_o_b2,"a",_n_a,"=")
	return (_S.call_value(_n_c,[_n_nx_b3, _n_ny_b4]) if _S.truth(_S.binary("===",_S.unary("typeof",_n_c),"function")) else _n_c)
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_x0_b0 = _S.arg(_args,0)
	var _n_y0_b1 = _S.arg(_args,1)
	var _n_x1_b2 = _S.arg(_args,2)
	var _n_y1_b3 = _S.arg(_args,3)
	var _n_c_b4 = _S.arg(_args,4)
	var _n_a_b5 = _S.coalesce(_S.arg(_args,5),func():return 1)
	var _n_n_b6 = maxf(1,ceili(maxf(absf((_n_x1_b2 - _n_x0_b0)),absf((_n_y1_b3 - _n_y0_b1)))))
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 <= _n_n_b6)):
			_S.invoke(_this,"set",[(_n_x0_b0 + (float(((_n_x1_b2 - _n_x0_b0) * _n_i_b7))/_n_n_b6)), (_n_y0_b1 + (float(((_n_y1_b3 - _n_y0_b1) * _n_i_b7))/_n_n_b6)), (_S.call_value(_n_c_b4,[(float(_n_i_b7)/_n_n_b6)]) if _S.truth(_S.binary("===",_S.unary("typeof",_n_c_b4),"function")) else _n_c_b4), _n_a_b5])
			_n_i_b7 += 1.0
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.coalesce(_S.arg(_args,3),func():return 1)
	if true:
		var _n_k_b4 = 1
		while _S.truth((_n_k_b4 < _S.prop(_n_pts_b0,"length"))):
			var _tuple_0 = _S.index_value(_n_pts_b0,(_n_k_b4 - 1))
			var _n_ax_b5 = _S.prop(_tuple_0,0)
			var _n_ay_b6 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_pts_b0,_n_k_b4)
			var _n_bx_b7 = _S.prop(_tuple_1,0)
			var _n_by_b8 = _S.prop(_tuple_1,1)
			var _n_L_b9 = maxf(1,_S.Bridge.hypot([(_n_bx_b7 - _n_ax_b5), (_n_by_b8 - _n_ay_b6)]))
			if true:
				var _n_s_b10 = 0
				while _S.truth((_n_s_b10 <= _n_L_b9)):
					var _n_u_b11 = (float(((_n_k_b4 - 1) + (float(_n_s_b10)/_n_L_b9)))/(_S.prop(_n_pts_b0,"length") - 1))
					var _n_rr_b12 = (_S.call_value(_n_r_b1,[_n_u_b11]) if _S.truth(_S.binary("===",_S.unary("typeof",_n_r_b1),"function")) else _n_r_b1)
					var _n_x_b13 = (_n_ax_b5 + (float(((_n_bx_b7 - _n_ax_b5) * _n_s_b10))/_n_L_b9))
					var _n_y_b14 = (_n_ay_b6 + (float(((_n_by_b8 - _n_ay_b6) * _n_s_b10))/_n_L_b9))
					if _S.truth((_n_rr_b12 < 0.75)):
						_S.invoke(_this,"set",[_n_x_b13, _n_y_b14, (_S.call_value(_n_c_b2,[_n_u_b11, 0]) if _S.truth(_S.binary("===",_S.unary("typeof",_n_c_b2),"function")) else _n_c_b2), _n_a_b3])
						_n_s_b10 += 0.5
						continue
					_S.invoke(_this,"shade",[(_n_x_b13 - _n_rr_b12), (_n_y_b14 - _n_rr_b12), (_n_x_b13 + _n_rr_b12), (_n_y_b14 + _n_rr_b12), _S.function_value(_S.capture(_parent,{"x":_n_x_b13,"y":_n_y_b14,"rr":_n_rr_b12,"a":_n_a_b3,"c":_n_c_b2,"u":_n_u_b11,"this":_this}),"_f21")])
					_n_s_b10 += 0.5
			_n_k_b4 += 1.0
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_rr = _S.read(_parent,"rr")
	var _n_a = _S.read(_parent,"a")
	var _n_c = _S.read(_parent,"c")
	var _n_u = _S.read(_parent,"u")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_d_b3 = (float(_S.Bridge.hypot([(_n_px_b0 - _n_x), (_n_py_b1 - _n_y)]))/_n_rr)
	_S.set_prop(_n_o_b2,"a",_n_a,"=")
	return (0 if _S.truth((_n_d_b3 > 1)) else (_S.call_value(_n_c,[_n_u, _n_d_b3]) if _S.truth(_S.binary("===",_S.unary("typeof",_n_c),"function")) else _n_c))
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_c_b1 = _S.arg(_args,1)
	var _n_a_b2 = _S.coalesce(_S.arg(_args,2),func():return 1)
	var _n_x0_b3 = INF
	var _n_y0_b4 = INF
	var _n_x1_b5 = (-INF)
	var _n_y1_b6 = (-INF)
	for _iter_0 in _S.array(_n_pts_b0):
		var _tuple_1 = _iter_0
		var _n_x_b8 = _S.prop(_tuple_1,0)
		var _n_y_b9 = _S.prop(_tuple_1,1)
		_n_x0_b3 = minf(_n_x0_b3,_n_x_b8)
		_n_x1_b5 = maxf(_n_x1_b5,_n_x_b8)
		_n_y0_b4 = minf(_n_y0_b4,_n_y_b9)
		_n_y1_b6 = maxf(_n_y1_b6,_n_y_b9)
	var _n_n_b7 = _S.prop(_n_pts_b0,"length")
	_S.invoke(_this,"shade",[_n_x0_b3, _n_y0_b4, _n_x1_b5, _n_y1_b6, _S.function_value(_S.capture(_parent,{"n":_n_n_b7,"pts":_n_pts_b0,"a":_n_a_b2,"c":_n_c_b1,"this":_this}),"_f23")])
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_n = _S.read(_parent,"n")
	var _n_pts = _S.read(_parent,"pts")
	var _n_a = _S.read(_parent,"a")
	var _n_c = _S.read(_parent,"c")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_inside_b3 = false
	if true:
		var _n_i_b4 = 0
		var _n_j_b5 = (_n_n - 1)
		while _S.truth((_n_i_b4 < _n_n)):
			var _tuple_0 = _S.index_value(_n_pts,_n_i_b4)
			var _n_xi_b6 = _S.prop(_tuple_0,0)
			var _n_yi_b7 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_pts,_n_j_b5)
			var _n_xj_b8 = _S.prop(_tuple_1,0)
			var _n_yj_b9 = _S.prop(_tuple_1,1)
			if _S.truth(((_n_x_b0 < ((float(((_n_xj_b8 - _n_xi_b6) * (_n_y_b1 - _n_yi_b7)))/(_n_yj_b9 - _n_yi_b7)) + _n_xi_b6)) if _S.truth(_S.binary("!==",(_n_yi_b7 > _n_y_b1),(_n_yj_b9 > _n_y_b1))) else _S.binary("!==",(_n_yi_b7 > _n_y_b1),(_n_yj_b9 > _n_y_b1)))):
				_n_inside_b3 = not _S.truth(_n_inside_b3)
			_n_j_b5 = _n_i_b4
			_n_i_b4 += 1.0
	_S.set_prop(_n_o_b2,"a",_n_a,"=")
	return ((_S.call_value(_n_c,[_n_x_b0, _n_y_b1]) if _S.truth(_S.binary("===",_S.unary("typeof",_n_c),"function")) else _n_c) if _S.truth(_n_inside_b3) else 0)
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_rows_b0 = _S.arg(_args,0)
	var _n_pal_b1 = _S.arg(_args,1)
	var _n_X_b2 = _S.arg(_args,2)
	var _n_Y_b3 = _S.arg(_args,3)
	var _object_0 = _S.coalesce(_S.arg(_args,4),func():return {})
	var _n_ax_b4 = _S.coalesce(_S.named_value(_object_0,"ax"),func():return 0)
	var _n_ay_b5 = _S.coalesce(_S.named_value(_object_0,"ay"),func():return 0)
	var _n_sx_b6 = _S.coalesce(_S.named_value(_object_0,"sx"),func():return 1)
	var _n_sy_b7 = _S.coalesce(_S.named_value(_object_0,"sy"),func():return 1)
	var _n_rot_b8 = _S.coalesce(_S.named_value(_object_0,"rot"),func():return 0)
	var _n_flip_b9 = _S.coalesce(_S.named_value(_object_0,"flip"),func():return false)
	var _n_H_b10 = _S.prop(_n_rows_b0,"length")
	var _n_W_b11 = _S.prop(_S.index_value(_n_rows_b0,0),"length")
	var _n_cache_b12 = {}
	var _n_col_b13 = _S.function_value(_S.capture(_parent,{"cache":_n_cache_b12,"pal":_n_pal_b1,"this":_this}),"_f25")
	if _S.truth((_S.binary("===",_n_rot_b8,0) if _S.truth((_S.binary("===",_n_sy_b7,1) if _S.truth(_S.binary("===",_n_sx_b6,1)) else _S.binary("===",_n_sx_b6,1))) else (_S.binary("===",_n_sy_b7,1) if _S.truth(_S.binary("===",_n_sx_b6,1)) else _S.binary("===",_n_sx_b6,1)))):
		if true:
			var _n_r_b17 = 0
			while _S.truth((_n_r_b17 < _n_H_b10)):
				if true:
					var _n_q_b18 = 0
					while _S.truth((_n_q_b18 < _n_W_b11)):
						var _n_ch_b19 = _S.index_value(_S.index_value(_n_rows_b0,_n_r_b17),(((_n_W_b11 - 1) - _n_q_b18) if _S.truth(_n_flip_b9) else _n_q_b18))
						if _S.truth((_S.binary("===",_n_ch_b19,".") if _S.truth(_S.binary("===",_n_ch_b19,".")) else _S.binary("===",_n_ch_b19," "))):
							_n_q_b18 += 1.0
							continue
						var _n_c_b20 = _S.call_value(_n_col_b13,[_n_ch_b19])
						if _S.truth(_n_c_b20):
							_S.invoke(_this,"set",[(floori((_n_X_b2 - (((_n_W_b11 - 1) - _n_ax_b4) if _S.truth(_n_flip_b9) else _n_ax_b4))+0.5) + _n_q_b18), (floori((_n_Y_b3 - _n_ay_b5)+0.5) + _n_r_b17), _n_c_b20])
						_n_q_b18 += 1.0
				_n_r_b17 += 1.0
		return null
	var _n_cs_b14 = cos(_n_rot_b8)
	var _n_sn_b15 = sin(_n_rot_b8)
	var _n_R_b16 = (_S.Bridge.hypot([(maxf(_n_ax_b4,(_n_W_b11 - _n_ax_b4)) * absf(_n_sx_b6)), (maxf(_n_ay_b5,(_n_H_b10 - _n_ay_b5)) * absf(_n_sy_b7))]) + 1)
	_S.invoke(_this,"shade",[(_n_X_b2 - _n_R_b16), (_n_Y_b3 - _n_R_b16), (_n_X_b2 + _n_R_b16), (_n_Y_b3 + _n_R_b16), _S.function_value(_S.capture(_parent,{"X":_n_X_b2,"Y":_n_Y_b3,"cs":_n_cs_b14,"sn":_n_sn_b15,"sx":_n_sx_b6,"sy":_n_sy_b7,"ax":_n_ax_b4,"ay":_n_ay_b5,"W":_n_W_b11,"H":_n_H_b10,"flip":_n_flip_b9,"rows":_n_rows_b0,"col":_n_col_b13,"this":_this}),"_f26")])
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_cache = _S.read(_parent,"cache")
	var _n_pal = _S.read(_parent,"pal")
	var _n_hex = _S.read(_parent,"hex")
	var _n_ch_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_cache,_n_ch_b0) if _S.truth((_n_ch_b0 in _n_cache)) else _S.set_prop(_n_cache,_n_ch_b0,(0 if _S.truth(_S.binary("===",_S.index_value(_n_pal,_n_ch_b0),null)) else _S.call_value(_n_hex,[_S.index_value(_n_pal,_n_ch_b0)])),"="))
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_X = _S.read(_parent,"X")
	var _n_Y = _S.read(_parent,"Y")
	var _n_cs = _S.read(_parent,"cs")
	var _n_sn = _S.read(_parent,"sn")
	var _n_sx = _S.read(_parent,"sx")
	var _n_sy = _S.read(_parent,"sy")
	var _n_ax = _S.read(_parent,"ax")
	var _n_ay = _S.read(_parent,"ay")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_flip = _S.read(_parent,"flip")
	var _n_rows = _S.read(_parent,"rows")
	var _n_col = _S.read(_parent,"col")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (_n_x_b0 - _n_X)
	var _n_dy_b3 = (_n_y_b1 - _n_Y)
	var _n_u_b4 = (float(((_n_dx_b2 * _n_cs) + (_n_dy_b3 * _n_sn)))/_n_sx)
	var _n_v_b5 = (float((((-_n_dx_b2) * _n_sn) + (_n_dy_b3 * _n_cs)))/_n_sy)
	var _n_q_b6 = floori((_n_ax + _n_u_b4))
	var _n_r_b7 = floori((_n_ay + _n_v_b5))
	if _S.truth(((((_n_q_b6 < 0) if _S.truth((_n_q_b6 < 0)) else (_n_r_b7 < 0)) if _S.truth(((_n_q_b6 < 0) if _S.truth((_n_q_b6 < 0)) else (_n_r_b7 < 0))) else (_n_q_b6 >= _n_W)) if _S.truth((((_n_q_b6 < 0) if _S.truth((_n_q_b6 < 0)) else (_n_r_b7 < 0)) if _S.truth(((_n_q_b6 < 0) if _S.truth((_n_q_b6 < 0)) else (_n_r_b7 < 0))) else (_n_q_b6 >= _n_W))) else (_n_r_b7 >= _n_H))):
		return 0
	if _S.truth(_n_flip):
		_n_q_b6 = ((_n_W - 1) - _n_q_b6)
	var _n_ch_b8 = _S.index_value(_S.index_value(_n_rows,_n_r_b7),_n_q_b6)
	return (0 if _S.truth((_S.binary("===",_n_ch_b8,".") if _S.truth(_S.binary("===",_n_ch_b8,".")) else _S.binary("===",_n_ch_b8," "))) else _S.call_value(_n_col,[_n_ch_b8]))
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_Uint8Array = _S.read(_parent,"Uint8Array")
	var _n_max_b0 = _S.coalesce(_S.arg(_args,0),func():return 4)
	var _object_0 = _this
	var _n_w_b1 = _S.named_value(_object_0,"w")
	var _n_h_b2 = _S.named_value(_object_0,"h")
	var _n_c_b3 = _S.named_value(_object_0,"c")
	var _n_d_b4 = _S.construct(_n_Uint8Array,[(_n_w_b1 * _n_h_b2)])
	var _n_q_b5 = []
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < (_n_w_b1 * _n_h_b2))):
			if _S.truth(not _S.truth(_S.index_value(_n_c_b3,_n_i_b6))):
				_n_i_b6 += 1.0
				continue
			var _n_x_b7 = fmod(_n_i_b6,_n_w_b1)
			var _n_y_b8 = _S.binary("|",(float(_n_i_b6)/_n_w_b1),0)
			if _S.truth((((((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1))) if _S.truth((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1)))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 - 1)))) if _S.truth(((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1))) if _S.truth((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1)))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 - 1))))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 + 1)))) if _S.truth((((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1))) if _S.truth((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1)))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 - 1)))) if _S.truth(((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1))) if _S.truth((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1)))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 - 1))))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 + 1))))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 - _n_w_b1)))) if _S.truth(((((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1))) if _S.truth((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1)))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 - 1)))) if _S.truth(((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1))) if _S.truth((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1)))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 - 1))))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 + 1)))) if _S.truth((((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1))) if _S.truth((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1)))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 - 1)))) if _S.truth(((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1))) if _S.truth((((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1))) if _S.truth(((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0)) if _S.truth((_S.binary("===",_n_x_b7,0) if _S.truth(_S.binary("===",_n_x_b7,0)) else _S.binary("===",_n_y_b8,0))) else _S.binary("===",_n_x_b7,(_n_w_b1 - 1)))) else _S.binary("===",_n_y_b8,(_n_h_b2 - 1)))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 - 1))))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 + 1))))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 - _n_w_b1))))) else not _S.truth(_S.index_value(_n_c_b3,(_n_i_b6 + _n_w_b1))))):
				_S.set_prop(_n_d_b4,_n_i_b6,1,"=")
				_S.invoke(_n_q_b5,"push",[_n_i_b6])
			_n_i_b6 += 1.0
	if true:
		var _n_k_b9 = 0
		while _S.truth((_n_k_b9 < _S.prop(_n_q_b5,"length"))):
			var _n_i_b10 = _S.index_value(_n_q_b5,_n_k_b9)
			var _n_v_b11 = _S.index_value(_n_d_b4,_n_i_b10)
			if _S.truth((_n_v_b11 >= _n_max_b0)):
				_n_k_b9 += 1.0
				continue
			for _iter_1 in _S.array([(_n_i_b10 - 1), (_n_i_b10 + 1), (_n_i_b10 - _n_w_b1), (_n_i_b10 + _n_w_b1)]):
				var _n_j_b12 = _iter_1
				if _S.truth((not _S.truth(_S.index_value(_n_d_b4,_n_j_b12)) if _S.truth((_S.index_value(_n_c_b3,_n_j_b12) if _S.truth(((_n_j_b12 < (_n_w_b1 * _n_h_b2)) if _S.truth((_n_j_b12 >= 0)) else (_n_j_b12 >= 0))) else ((_n_j_b12 < (_n_w_b1 * _n_h_b2)) if _S.truth((_n_j_b12 >= 0)) else (_n_j_b12 >= 0)))) else (_S.index_value(_n_c_b3,_n_j_b12) if _S.truth(((_n_j_b12 < (_n_w_b1 * _n_h_b2)) if _S.truth((_n_j_b12 >= 0)) else (_n_j_b12 >= 0))) else ((_n_j_b12 < (_n_w_b1 * _n_h_b2)) if _S.truth((_n_j_b12 >= 0)) else (_n_j_b12 >= 0))))):
					_S.set_prop(_n_d_b4,_n_j_b12,(_n_v_b11 + 1),"=")
					_S.invoke(_n_q_b5,"push",[_n_j_b12])
			_n_k_b9 += 1.0
	if true:
		var _n_i_b13 = 0
		while _S.truth((_n_i_b13 < (_n_w_b1 * _n_h_b2))):
			if _S.truth((not _S.truth(_S.index_value(_n_d_b4,_n_i_b13)) if _S.truth(_S.index_value(_n_c_b3,_n_i_b13)) else _S.index_value(_n_c_b3,_n_i_b13))):
				_S.set_prop(_n_d_b4,_n_i_b13,_n_max_b0,"=")
			_n_i_b13 += 1.0
	_S.set_prop(_this,"d",_n_d_b4,"=")
	return _n_d_b4
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_i_b2 = _S.invoke(_this,"idx",[_n_x_b0, _n_y_b1])
	return (0 if _S.truth(((_n_i_b2 < 0) if _S.truth((_n_i_b2 < 0)) else not _S.truth(_S.named_value(_this,"d")))) else _S.index_value(_S.named_value(_this,"d"),_n_i_b2))
	return null

static func _f29(_parent,_args:Array,_this=null):
	var _n_c_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.coalesce(_S.arg(_args,1),func():return 1)
	var _n_src_b2 = _S.invoke(_S.named_value(_this,"c"),"slice",[])
	var _n_w_b3 = _S.named_value(_this,"w")
	var _n_h_b4 = _S.named_value(_this,"h")
	var _n_fn_b5 = _S.binary("===",_S.unary("typeof",_n_c_b0),"function")
	if true:
		var _n_y_b6 = 0
		while _S.truth((_n_y_b6 < _n_h_b4)):
			if true:
				var _n_x_b7 = 0
				while _S.truth((_n_x_b7 < _n_w_b3)):
					var _n_i_b8 = ((_n_y_b6 * _n_w_b3) + _n_x_b7)
					if _S.truth(_S.index_value(_n_src_b2,_n_i_b8)):
						_n_x_b7 += 1.0
						continue
					var _n_l_b9 = (_S.index_value(_n_src_b2,(_n_i_b8 - 1)) if _S.truth((_n_x_b7 > 0)) else (_n_x_b7 > 0))
					var _n_r_b10 = (_S.index_value(_n_src_b2,(_n_i_b8 + 1)) if _S.truth((_n_x_b7 < (_n_w_b3 - 1))) else (_n_x_b7 < (_n_w_b3 - 1)))
					var _n_u_b11 = (_S.index_value(_n_src_b2,(_n_i_b8 - _n_w_b3)) if _S.truth((_n_y_b6 > 0)) else (_n_y_b6 > 0))
					var _n_d_b12 = (_S.index_value(_n_src_b2,(_n_i_b8 + _n_w_b3)) if _S.truth((_n_y_b6 < (_n_h_b4 - 1))) else (_n_y_b6 < (_n_h_b4 - 1)))
					if _S.truth(not _S.truth((((_n_l_b9 if _S.truth(_n_l_b9) else _n_r_b10) if _S.truth((_n_l_b9 if _S.truth(_n_l_b9) else _n_r_b10)) else _n_u_b11) if _S.truth(((_n_l_b9 if _S.truth(_n_l_b9) else _n_r_b10) if _S.truth((_n_l_b9 if _S.truth(_n_l_b9) else _n_r_b10)) else _n_u_b11)) else _n_d_b12))):
						_n_x_b7 += 1.0
						continue
					var _n_col_b13 = (_S.call_value(_n_c_b0,[(_S.named_value(_this,"x0") + _n_x_b7), (_S.named_value(_this,"y0") + _n_y_b6), ((1 if _S.truth(_n_l_b9) else 0) - (1 if _S.truth(_n_r_b10) else 0)), ((1 if _S.truth(_n_u_b11) else 0) - (1 if _S.truth(_n_d_b12) else 0))]) if _S.truth(_n_fn_b5) else _n_c_b0)
					if _S.truth(_n_col_b13):
						_S.set_prop(_S.named_value(_this,"c"),_n_i_b8,_n_col_b13,"=")
						_S.set_prop(_S.named_value(_this,"a"),_n_i_b8,_n_a_b1,"=")
						_S.set_prop(_S.named_value(_this,"tag"),_n_i_b8,255,"=")
					_n_x_b7 += 1.0
			_n_y_b6 += 1.0
	return null

static func _f30(_parent,_args:Array,_this=null):
	var _n_fn_b0 = _S.arg(_args,0)
	if true:
		var _n_i_b1 = 0
		while _S.truth((_n_i_b1 < (_S.named_value(_this,"w") * _S.named_value(_this,"h")))):
			if _S.truth(not _S.truth(_S.index_value(_S.named_value(_this,"c"),_n_i_b1))):
				_n_i_b1 += 1.0
				continue
			_S.set_prop(_S.named_value(_this,"c"),_n_i_b1,_S.logical("||",_S.call_value(_n_fn_b0,[(_S.named_value(_this,"x0") + fmod(_n_i_b1,_S.named_value(_this,"w"))), (_S.named_value(_this,"y0") + _S.binary("|",(float(_n_i_b1)/_S.named_value(_this,"w")),0)), _S.index_value(_S.named_value(_this,"c"),_n_i_b1), _S.index_value(_S.named_value(_this,"a"),_n_i_b1), _S.index_value(_S.named_value(_this,"tag"),_n_i_b1)]),func():return 0),"=")
			_n_i_b1 += 1.0
	return null

static func _f31(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_fade_b1 = _S.coalesce(_S.arg(_args,1),func():return 1)
	var _n_dx_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	var _n_dy_b3 = _S.coalesce(_S.arg(_args,3),func():return 0)
	var _n_X_b4 = (_S.named_value(_this,"x0") + floori(_n_dx_b2+0.5))
	var _n_Y_b5 = (_S.named_value(_this,"y0") + floori(_n_dy_b3+0.5))
	if true:
		var _n_y_b6 = 0
		while _S.truth((_n_y_b6 < _S.named_value(_this,"h"))):
			if true:
				var _n_x_b7 = 0
				while _S.truth((_n_x_b7 < _S.named_value(_this,"w"))):
					var _n_i_b8 = ((_n_y_b6 * _S.named_value(_this,"w")) + _n_x_b7)
					var _n_c_b9 = _S.index_value(_S.named_value(_this,"c"),_n_i_b8)
					if _S.truth(not _S.truth(_n_c_b9)):
						_n_x_b7 += 1.0
						continue
					var _n_a_b10 = _S.index_value(_S.named_value(_this,"a"),_n_i_b8)
					if _S.truth((_n_a_b10 >= 0.999)):
						_S.invoke(_n_p_b0,"dot",[(_n_X_b4 + _n_x_b7), (_n_Y_b5 + _n_y_b6), _n_c_b9, _n_fade_b1])
					else:
						_S.invoke(_n_p_b0,"blend",[(_n_X_b4 + _n_x_b7), (_n_Y_b5 + _n_y_b6), _n_c_b9, (_n_a_b10 * _n_fade_b1)])
					_n_x_b7 += 1.0
			_n_y_b6 += 1.0
	return null

static func _f32(_parent,_args:Array,_this=null):
	_S.invoke(_S.named_value(_this,"c"),"fill",[0])
	_S.invoke(_S.named_value(_this,"tag"),"fill",[0])
	_S.set_prop(_this,"d",null,"=")
	return _this
	return null

static func _f33(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "opts", _S.coalesce(_S.arg(_args, 0), func(): return _S.merge([])))
	_S.set_prop(_S.read(_e, "this"), "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.construct(_S.read(_e, "Rng"), [1])}, _S.read(_e, "opts")])]), "=", false)
	return null

static func _f34(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	_S.set_prop(_S.named_value(_S.named_value(_this,"ps"),"list"),"length",0,"=")
	_S.set_prop(_S.named_value(_this,"ps"),"t",_n_t_b0,"=")
	return _this
	return null

static func _f35(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_hex = _S.read(_parent,"hex")
	var _n_k_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_vx_b3 = _S.arg(_args,3)
	var _n_vy_b4 = _S.arg(_args,4)
	var _n_age_b5 = _S.arg(_args,5)
	var _n_life_b6 = _S.arg(_args,6)
	var _n_col_b7 = _S.coalesce(_S.arg(_args,7),func():return _n_WHITE)
	var _n_size_b8 = _S.coalesce(_S.arg(_args,8),func():return 1)
	var _n_flag_b9 = _S.coalesce(_S.arg(_args,9),func():return 0)
	var _n_seed_b10 = _S.coalesce(_S.arg(_args,10),func():return 0)
	if _S.truth(((_n_age_b5 < 0) if _S.truth((_n_age_b5 < 0)) else (_n_age_b5 >= _n_life_b6))):
		return null
	_S.invoke(_S.named_value(_S.named_value(_this,"ps"),"list"),"push",[{"k":_n_k_b0,"x":_n_x_b1,"y":_n_y_b2,"vx":_n_vx_b3,"vy":_n_vy_b4,"life":(_n_life_b6 - _n_age_b5),"max":_n_life_b6,"col":(_S.call_value(_n_hex,[_n_col_b7]) if _S.truth(_n_col_b7) else 0),"size":_n_size_b8,"seed":_n_seed_b10,"delay":0,"flag":_n_flag_b9}])
	return null

static func _f36(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_layer_b1 = _S.arg(_args,1)
	_S.invoke(_S.named_value(_this,"ps"),"draw",[_n_p_b0, _n_layer_b1])
	return null
