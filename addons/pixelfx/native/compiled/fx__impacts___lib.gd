@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "stone", _S.function_value(_e, "_f0"))
	_S.define(_e, "spikes", _S.function_value(_e, "_f1"))
	_S.define(_e, "star", _S.function_value(_e, "_f3"))
	_S.define(_e, "brokenRing", _S.function_value(_e, "_f4"))
	_S.define(_e, "walk", _S.function_value(_e, "_f5"))
	_S.define(_e, "makeCracks", _S.function_value(_e, "_f6"))
	_S.define(_e, "drawCracks", _S.function_value(_e, "_f7"))
	_S.define(_e, "frontCrescent", _S.function_value(_e, "_f11"))
	_S.define(_e, "dustRing", _S.function_value(_e, "_f13"))
	_S.define(_e, "rock", _S.function_value(_e, "_f14"))
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#0d0a12"]))
	_exports["SOOT"] = _S.read(_e, "SOOT")
	_S.define(_e, "OUTLINE", _S.call_value(_S.read(_e, "hex"), ["#1a1422"]))
	_exports["OUTLINE"] = _S.read(_e, "OUTLINE")
	_S.define(_e, "LIGHT", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.unary("-", 1), _S.unary("-", 1)]))
	_exports["stone"] = _S.read(_e, "stone")
	_exports["spikes"] = _S.read(_e, "spikes")
	_exports["star"] = _S.read(_e, "star")
	_exports["brokenRing"] = _S.read(_e, "brokenRing")
	_exports["makeCracks"] = _S.read(_e, "makeCracks")
	_exports["drawCracks"] = _S.read(_e, "drawCracks")
	_exports["frontCrescent"] = _S.read(_e, "frontCrescent")
	_exports["dustRing"] = _S.read(_e, "dustRing")
	_S.define(_e, "rockShape", _S.function_value(_e, "_f16"))
	_exports["rockShape"] = _S.read(_e, "rockShape")
	_exports["rock"] = _S.read(_e, "rock")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_c_b0 = _S.arg(_args,0)
	_n_c_b0 = _S.call_value(_n_hex,[_n_c_b0])
	return {"light":_S.ColorFX.mix(_S.ColorFX.scale_color(_n_c_b0,1.35),_n_WHITE,0.08),"body":_n_c_b0,"shade":_S.ColorFX.scale_color(_n_c_b0,0.64),"dust":_S.ColorFX.mix(_S.ColorFX.scale_color(_n_c_b0,1.2),_S.ColorFX.rgb(150,140,150),0.3),"lip":_S.ColorFX.mix(_S.ColorFX.scale_color(_n_c_b0,1.55),_n_WHITE,0.12)}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_R_b0 = _S.arg(_args,0)
	var _n_n_b1 = _S.arg(_args,1)
	var _n_aim_b2 = _S.arg(_args,2)
	var _object_0 = _S.coalesce(_S.arg(_args,3),func():return {})
	var _n_len_b3 = _S.coalesce(_S.named_value(_object_0,"len"),func():return [7, 10])
	var _n_w_b4 = _S.coalesce(_S.named_value(_object_0,"w"),func():return [1.5, 2.1])
	var _n_fwd_b5 = _S.coalesce(_S.named_value(_object_0,"fwd"),func():return 1.8)
	var _n_back_b6 = _S.coalesce(_S.named_value(_object_0,"back"),func():return 0.6)
	var _n_jag_b7 = _S.coalesce(_S.named_value(_object_0,"jag"),func():return 1)
	var _n_jit_b8 = _S.coalesce(_S.named_value(_object_0,"jit"),func():return 0.18)
	return _S.invoke(_n_Array,"from",[{"length":_n_n_b1}, _S.function_value(_S.capture(_parent,{"aim":_n_aim_b2,"n":_n_n_b1,"R":_n_R_b0,"jit":_n_jit_b8,"len":_n_len_b3,"fwd":_n_fwd_b5,"back":_n_back_b6,"jag":_n_jag_b7,"w":_n_w_b4,"this":_this}),"_f2")])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_aim = _S.read(_parent,"aim")
	var _n_n = _S.read(_parent,"n")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n_jit = _S.read(_parent,"jit")
	var _n_len = _S.read(_parent,"len")
	var _n_fwd = _S.read(_parent,"fwd")
	var _n_back = _S.read(_parent,"back")
	var _n_jag = _S.read(_parent,"jag")
	var _n_w = _S.read(_parent,"w")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_a_b2 = ((_n_aim + ((float(_n_i_b1)/_n_n) * _n_TAU)) + _S.invoke(_n_R,"range",[(-_n_jit), _n_jit]))
	var _n_cb_b3 = cos((_n_a_b2 - _n_aim))
	var _n_L_b4 = ((_S.invoke(_n_R,"range",[_S.index_value(_n_len,0), _S.index_value(_n_len,1)]) * ((1 + (_n_fwd * pow(maxf(0,_n_cb_b3),3))) + (_n_back * pow(maxf(0,(-_n_cb_b3)),3)))) * (_n_jag if _S.truth(fmod(_n_i_b1,2)) else 1))
	return {"a":_n_a_b2,"len":_n_L_b4,"w":(_S.invoke(_n_R,"range",[_S.index_value(_n_w,0), _S.index_value(_n_w,1)]) * (sqrt(_n_jag) if _S.truth(fmod(_n_i_b1,2)) else 1))}
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_list_b3 = _S.arg(_args,3)
	var _n_sc_b4 = _S.arg(_args,4)
	var _n_th_b5 = _S.arg(_args,5)
	var _tuple_0 = _S.arg(_args,6)
	var _n_rim_b6 = _S.prop(_tuple_0,0)
	var _n_body_b7 = _S.prop(_tuple_0,1)
	var _n_inner_b8 = _S.prop(_tuple_0,2)
	var _n_core_b9 = _S.prop(_tuple_0,3)
	var _n_a_b10 = _S.coalesce(_S.arg(_args,7),func():return 1)
	var _n_heart_b11 = _S.coalesce(_S.arg(_args,8),func():return 2.4)
	if true:
		var _n_pass_b13 = 0
		while _S.truth((_n_pass_b13 < 3)):
			for _iter_1 in _S.array(_n_list_b3):
				var _n_s_b14 = _iter_1
				var _n_c_b15 = cos(_S.named_value(_n_s_b14,"a"))
				var _n_sn_b16 = sin(_S.named_value(_n_s_b14,"a"))
				var _n_L_b17 = (_S.named_value(_n_s_b14,"len") * _n_sc_b4)
				if true:
					var _n_d_b18 = 0
					while _S.truth((_n_d_b18 <= _n_L_b17)):
						if _S.truth(((_n_d_b18 > (_n_L_b17 * 0.55)) if _S.truth(_S.binary("===",_n_pass_b13,2)) else _S.binary("===",_n_pass_b13,2))):
							break
						var _n_hw0_b19 = (((_S.named_value(_n_s_b14,"w") * _n_th_b5) * (1 - (float(_n_d_b18)/_n_L_b17))) * minf(1,(0.5 + (float(_n_d_b18)/3))))
						var _n_hw_b20 = ((_n_hw0_b19 + 0.8) if _S.truth(_S.binary("===",_n_pass_b13,0)) else (_n_hw0_b19 if _S.truth(_S.binary("===",_n_pass_b13,1)) else (_n_hw0_b19 * 0.45)))
						var _n_col_b21 = (_n_rim_b6 if _S.truth(_S.binary("===",_n_pass_b13,0)) else ((_n_inner_b8 if _S.truth((_n_d_b18 < (_n_L_b17 * 0.35))) else _n_body_b7) if _S.truth(_S.binary("===",_n_pass_b13,1)) else _n_core_b9))
						if true:
							var _n_o_b22 = (-_n_hw_b20)
							while _S.truth((_n_o_b22 <= _n_hw_b20)):
								_S.invoke(_n_p_b0,"dot",[((_n_x_b1 + (_n_c_b15 * _n_d_b18)) - (_n_sn_b16 * _n_o_b22)), ((_n_y_b2 + (_n_sn_b16 * _n_d_b18)) + (_n_c_b15 * _n_o_b22)), _n_col_b21, _n_a_b10])
								_n_o_b22 += 0.5
						_n_d_b18 += 0.5
			_n_pass_b13 += 1.0
	var _n_r_b12 = ((_n_heart_b11 * _n_sc_b4) * sqrt(_n_th_b5))
	_S.invoke(_n_p_b0,"circle",[_n_x_b1, _n_y_b2, (_n_r_b12 + 0.8), _n_inner_b8, _n_a_b10])
	_S.invoke(_n_p_b0,"circle",[_n_x_b1, _n_y_b2, _n_r_b12, _n_core_b9, _n_a_b10])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_th_b4 = _S.arg(_args,4)
	var _n_segs_b5 = _S.arg(_args,5)
	var _n_brk_b6 = _S.arg(_args,6)
	var _n_c_b7 = _S.arg(_args,7)
	var _n_c2_b8 = _S.coalesce(_S.arg(_args,8),func():return _n_c_b7)
	var _n_k_b9 = _S.coalesce(_S.arg(_args,9),func():return 1)
	var _n_sy_b10 = _S.coalesce(_S.arg(_args,10),func():return 1)
	var _n_maxY_b11 = _S.coalesce(_S.arg(_args,11),func():return INF)
	if _S.truth(((_n_r_b3 <= 0) if _S.truth((_n_r_b3 <= 0)) else (_n_k_b9 <= 0))):
		return null
	var _n_full_b12 = (float(_n_TAU)/_S.prop(_n_segs_b5,"length"))
	for _iter_0 in _S.array(_n_segs_b5):
		var _n_s_b13 = _iter_0
		var _n_span_b14 = ((_n_full_b12 * (1 - (_S.named_value(_n_s_b13,"gap") * _n_brk_b6))) + 0.02)
		var _n_rr_b15 = (_n_r_b3 * (1 + (_S.named_value(_n_s_b13,"dr") * _n_brk_b6)))
		var _n_m_b16 = maxf(4,ceili(((_n_rr_b15 * _n_span_b14) * 1.8)))
		if true:
			var _n_j_b17 = 0
			while _S.truth((_n_j_b17 <= _n_m_b16)):
				var _n_u_b18 = (float(_n_j_b17)/_n_m_b16)
				var _n_ang_b19 = (_S.named_value(_n_s_b13,"a") + ((_n_u_b18 - 0.5) * _n_span_b14))
				var _n_w_b20 = maxf(0.5,((_n_th_b4 * (_S.named_value(_n_s_b13,"w") if _S.named_value(_n_s_b13,"w")!=null else 1)) * (1 - (_n_brk_b6 * pow(absf(((2 * _n_u_b18) - 1)),1.6)))))
				var _n_ca_b21 = cos(_n_ang_b19)
				var _n_sa_b22 = sin(_n_ang_b19)
				if true:
					var _n_o_b23 = (float((-_n_w_b20))/2)
					while _S.truth((_n_o_b23 <= ((float(_n_w_b20)/2) + 0.01))):
						if _S.truth(((_n_y_b2 + ((_n_sa_b22 * (_n_rr_b15 + _n_o_b23)) * _n_sy_b10)) < _n_maxY_b11)):
							_S.invoke(_n_p_b0,"dot",[(_n_x_b1 + (_n_ca_b21 * (_n_rr_b15 + _n_o_b23))), (_n_y_b2 + ((_n_sa_b22 * (_n_rr_b15 + _n_o_b23)) * _n_sy_b10)), (_n_c_b7 if _S.truth((_n_o_b23 > (-0.26))) else _n_c2_b8), _n_k_b9])
						_n_o_b23 += 0.5
				_n_j_b17 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_R_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_L_b4 = _S.arg(_args,4)
	var _object_0 = _S.coalesce(_S.arg(_args,5),func():return {})
	var _n_jit_b5 = _S.coalesce(_S.named_value(_object_0,"jit"),func():return 0.55)
	var _n_steer_b6 = _S.coalesce(_S.named_value(_object_0,"steer"),func():return 0.45)
	var _n_step_b7 = _S.coalesce(_S.named_value(_object_0,"step"),func():return [2, 4])
	var _n_maxY_b8 = _S.coalesce(_S.named_value(_object_0,"maxY"),func():return INF)
	var _n_d0_b9 = _S.coalesce(_S.named_value(_object_0,"d0"),func():return 0)
	var _n_pts_b10 = [[_n_x_b1, _n_y_b2, _n_d0_b9]]
	var _n_d_b11 = 0
	var _n_cur_b12 = _n_a_b3
	while _S.truth((_n_d_b11 < (_n_L_b4 - 0.01))):
		var _n_s_b13 = minf((_n_L_b4 - _n_d_b11),_S.invoke(_n_R_b0,"range",[_S.index_value(_n_step_b7,0), _S.index_value(_n_step_b7,1)]))
		_n_cur_b12 += (_S.invoke(_n_R_b0,"range",[(-_n_jit_b5), _n_jit_b5]) + ((_n_a_b3 - _n_cur_b12) * _n_steer_b6))
		_n_x_b1 += (cos(_n_cur_b12) * _n_s_b13)
		_n_y_b2 = clampf((_n_y_b2 + (sin(_n_cur_b12) * _n_s_b13)),0.5,_n_maxY_b8)
		_n_d_b11 += _n_s_b13
		_S.invoke(_n_pts_b10,"push",[[_n_x_b1, _n_y_b2, (_n_d0_b9 + _n_d_b11)]])
	return _n_pts_b10
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_walk = _S.read(_parent,"walk")
	var _n_R_b0 = _S.arg(_args,0)
	var _n_n_b1 = _S.arg(_args,1)
	var _object_0 = _S.coalesce(_S.arg(_args,2),func():return {})
	var _n_len_b2 = _S.coalesce(_S.named_value(_object_0,"len"),func():return [14, 40])
	var _n_dive_b3 = _S.coalesce(_S.named_value(_object_0,"dive"),func():return 0.85)
	var _n_maxY_b4 = _S.coalesce(_S.named_value(_object_0,"maxY"),func():return 22)
	var _n_forks_b5 = _S.coalesce(_S.named_value(_object_0,"forks"),func():return 0.5)
	var _n_x0_b6 = _S.coalesce(_S.named_value(_object_0,"x0"),func():return [1, 5])
	var _n_out_b7 = []
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < _n_n_b1)):
			var _n_side_b9 = (1 if _S.truth(fmod(_n_i_b8,2)) else (-1))
			var _n_dip_b10 = (0.06 + (pow(_S.invoke(_n_R_b0,"next",[]),1.7) * _n_dive_b3))
			var _n_L_b11 = (_S.invoke(_n_R_b0,"range",[_S.index_value(_n_len_b2,0), _S.index_value(_n_len_b2,1)]) * (1 - (float((0.5 * _n_dip_b10))/(_n_dive_b3 + 0.06))))
			var _n_a_b12 = (_n_dip_b10 if _S.truth((_n_side_b9 > 0)) else (PI - _n_dip_b10))
			var _n_pts_b13 = _S.call_value(_n_walk,[_n_R_b0, (_n_side_b9 * _S.invoke(_n_R_b0,"range",[_S.index_value(_n_x0_b6,0), _S.index_value(_n_x0_b6,1)])), _S.invoke(_n_R_b0,"range",[0.5, 1.5]), _n_a_b12, _n_L_b11, {"maxY":_n_maxY_b4}])
			var _n_c_b14 = {"pts":_n_pts_b13,"len":_n_L_b11,"t0":_S.invoke(_n_R_b0,"range",[0, 0.035]),"kids":[]}
			if true:
				var _n_j_b15 = 2
				while _S.truth((_n_j_b15 < (_S.prop(_n_pts_b13,"length") - 1))):
					if _S.truth(_S.invoke(_n_R_b0,"chance",[(_n_forks_b5 * 0.4)])):
						var _tuple_1 = _S.index_value(_n_pts_b13,_n_j_b15)
						var _n_fx_b16 = _S.prop(_tuple_1,0)
						var _n_fy_b17 = _S.prop(_tuple_1,1)
						var _n_fd_b18 = _S.prop(_tuple_1,2)
						_S.invoke(_S.named_value(_n_c_b14,"kids"),"push",[_S.call_value(_n_walk,[_n_R_b0, _n_fx_b16, _n_fy_b17, (_n_a_b12 + (_S.invoke(_n_R_b0,"sign",[]) * _S.invoke(_n_R_b0,"range",[0.45, 1]))), (_S.invoke(_n_R_b0,"range",[3, 9]) * (1 - (float((0.5 * _n_j_b15))/_S.prop(_n_pts_b13,"length")))), {"maxY":_n_maxY_b4,"d0":_n_fd_b18,"jit":0.7,"step":[1.5, 3]}])])
					_n_j_b15 += 1.0
			_S.invoke(_n_out_b7,"push",[_n_c_b14])
			_n_i_b8 += 1.0
	return _n_out_b7
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_cracks_b1 = _S.arg(_args,1)
	var _n_g_b2 = _S.arg(_args,2)
	var _n_heat_b3 = _S.arg(_args,3)
	var _n_hot_b4 = _S.arg(_args,4)
	var _n_dark_b5 = _S.arg(_args,5)
	var _n_lip_b6 = _S.arg(_args,6)
	var _n_k_b7 = _S.coalesce(_S.arg(_args,7),func():return 1)
	if _S.truth((_n_k_b7 <= 0)):
		return null
	var _n_col_b8 = _S.function_value(_S.capture(_parent,{"heat":_n_heat_b3,"hot":_n_hot_b4,"dark":_n_dark_b5,"this":_this}),"_f8")
	for _iter_0 in _S.array(_n_cracks_b1):
		var _n_c_b9 = _iter_0
		var _n_G_b10 = _S.call_value(_n_g_b2,[_n_c_b9])
		if _S.truth((_n_G_b10 <= 0)):
			continue
		for _iter_1 in _S.array(_S.concat([[_S.named_value(_n_c_b9,"pts")],_S.array(_S.named_value(_n_c_b9,"kids"))])):
			var _n_path_b11 = _iter_1
			if true:
				var _n_i_b12 = 1
				while _S.truth((_n_i_b12 < _S.prop(_n_path_b11,"length"))):
					var _tuple_2 = _S.index_value(_n_path_b11,(_n_i_b12 - 1))
					var _n_x0_b13 = _S.prop(_tuple_2,0)
					var _n_y0_b14 = _S.prop(_tuple_2,1)
					var _n_d0_b15 = _S.prop(_tuple_2,2)
					var _tuple_3 = _S.index_value(_n_path_b11,_n_i_b12)
					var _n_x1_b16 = _S.prop(_tuple_3,0)
					var _n_y1_b17 = _S.prop(_tuple_3,1)
					var _n_d1_b18 = _S.prop(_tuple_3,2)
					if _S.truth((_n_d0_b15 >= _n_G_b10)):
						break
					var _n_f_b19 = ((float((_n_G_b10 - _n_d0_b15))/(_n_d1_b18 - _n_d0_b15)) if _S.truth((_n_d1_b18 > _n_G_b10)) else 1)
					var _n_ex_b20 = (_n_x0_b13 + ((_n_x1_b16 - _n_x0_b13) * _n_f_b19))
					var _n_ey_b21 = (_n_y0_b14 + ((_n_y1_b17 - _n_y0_b14) * _n_f_b19))
					_S.invoke(_n_p_b0,"line",[_n_x0_b13, (_n_y0_b14 + 1), _n_ex_b20, (_n_ey_b21 + 1), _n_lip_b6, _S.function_value(_S.capture(_parent,{"x0":_n_x0_b13,"ex":_n_ex_b20,"y0":_n_y0_b14,"ey":_n_ey_b21,"k":_n_k_b7,"this":_this}),"_f9")])
					_S.invoke(_n_p_b0,"line",[_n_x0_b13, _n_y0_b14, _n_ex_b20, _n_ey_b21, _S.function_value(_S.capture(_parent,{"col":_n_col_b8,"d0":_n_d0_b15,"d1":_n_d1_b18,"f":_n_f_b19,"this":_this}),"_f10"), _n_k_b7])
					var _n_h_b22 = _S.call_value(_n_heat_b3,[_n_d0_b15])
					if _S.truth((_n_h_b22 > 0.12)):
						_S.invoke(_n_p_b0,"glow",[(float((_n_x0_b13 + _n_ex_b20))/2), (float((_n_y0_b14 + _n_ey_b21))/2), (4 + (_n_h_b22 * 4)), _S.index_value(_n_hot_b4,2), ((0.22 * _n_h_b22) * _n_k_b7)])
					_n_i_b12 += 1.0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_heat = _S.read(_parent,"heat")
	var _n_hot = _S.read(_parent,"hot")
	var _n_dark = _S.read(_parent,"dark")
	var _n_d_b0 = _S.arg(_args,0)
	var _n_h_b1 = _S.call_value(_n_heat,[_n_d_b0])
	return (_S.index_value(_n_hot,0) if _S.truth((_n_h_b1 > 0.75)) else (_S.index_value(_n_hot,1) if _S.truth((_n_h_b1 > 0.5)) else (_S.index_value(_n_hot,2) if _S.truth((_n_h_b1 > 0.3)) else (_S.index_value(_n_hot,3) if _S.truth((_n_h_b1 > 0.12)) else _n_dark))))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_k = _S.read(_parent,"k")
	var _n_x0 = _S.read(_parent,"x0")
	var _n_ex = _S.read(_parent,"ex")
	var _n_y0 = _S.read(_parent,"y0")
	var _n_ey = _S.read(_parent,"ey")
	var _n_u_b0 = _S.arg(_args,0)
	return ((_n_k * 0.8) if _S.truth((_S.MathFX.rand([floori((_n_x0 + ((_n_ex - _n_x0) * _n_u_b0))+0.5),floori((_n_y0 + ((_n_ey - _n_y0) * _n_u_b0))+0.5),5]) < 0.3)) else 0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_col = _S.read(_parent,"col")
	var _n_d0 = _S.read(_parent,"d0")
	var _n_d1 = _S.read(_parent,"d1")
	var _n_f = _S.read(_parent,"f")
	var _n_u_b0 = _S.arg(_args,0)
	return _S.call_value(_n_col,[(_n_d0 + (((_n_d1 - _n_d0) * _n_f) * _n_u_b0))])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_dir_b2 = _S.arg(_args,2)
	var _n_h_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_cols_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	if _S.truth((((_n_h_b3 < 1) if _S.truth((_n_h_b3 < 1)) else (_n_w_b4 < 0.3)) if _S.truth(((_n_h_b3 < 1) if _S.truth((_n_h_b3 < 1)) else (_n_w_b4 < 0.3))) else (_n_k_b6 <= 0))):
		return null
	var _n_ry_b7 = (_n_h_b3 * 0.8)
	var _n_cy_b8 = ((-_n_h_b3) * 0.2)
	var _n_rx_b9 = maxf(2,(_n_h_b3 * 0.55))
	var _n_x0_b10 = ((((_n_x_b1 - _n_rx_b9) - _n_w_b4) - 1) if _S.truth((_n_dir_b2 > 0)) else (_n_x_b1 - 1))
	var _n_x1_b11 = ((_n_x_b1 + 1) if _S.truth((_n_dir_b2 > 0)) else (((_n_x_b1 + _n_rx_b9) + _n_w_b4) + 1))
	_S.invoke(_n_p_b0,"shade",[_n_x0_b10, ((-_n_h_b3) - 1), _n_x1_b11, 0, _S.function_value(_S.capture(_parent,{"cy":_n_cy_b8,"ry":_n_ry_b7,"rx":_n_rx_b9,"w":_n_w_b4,"x":_n_x_b1,"dir":_n_dir_b2,"cols":_n_cols_b5,"k":_n_k_b6,"this":_this}),"_f12")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_cy = _S.read(_parent,"cy")
	var _n_ry = _S.read(_parent,"ry")
	var _n_rx = _S.read(_parent,"rx")
	var _n_w = _S.read(_parent,"w")
	var _n_x = _S.read(_parent,"x")
	var _n_dir = _S.read(_parent,"dir")
	var _n_cols = _S.read(_parent,"cols")
	var _n_k = _S.read(_parent,"k")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	if _S.truth((_n_py_b1 > 0)):
		return null
	var _n_ey_b3 = (float((_n_py_b1 - _n_cy))/_n_ry)
	if _S.truth(((_n_ey_b3 <= (-1)) if _S.truth((_n_ey_b3 <= (-1))) else (_n_ey_b3 >= 1))):
		return null
	var _n_e2_b4 = (1 - (_n_ey_b3 * _n_ey_b3))
	var _n_edge_b5 = ((_n_rx * sqrt(_n_e2_b4)) - _n_rx)
	var _n_wt_b6 = (_n_w * pow(_n_e2_b4,0.45))
	var _n_q_b7 = (float((_n_edge_b5 - ((_n_px_b0 - _n_x) * _n_dir)))/maxf(0.5,_n_wt_b6))
	if _S.truth(((_n_q_b7 < 0) if _S.truth((_n_q_b7 < 0)) else (_n_q_b7 > 1))):
		return null
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_cols,0) if _S.truth((_n_q_b7 < 0.28)) else (_S.index_value(_n_cols,1) if _S.truth((_n_q_b7 < 0.62)) else _S.index_value(_n_cols,2))),"=")
	_S.set_prop(_n_out_b2,"a",((_n_k * (0.7 if _S.truth((_n_ey_b3 < (-0.8))) else 1)) * ((1.25 - (_n_q_b7 * 0.8)) if _S.truth((_n_q_b7 > 0.7)) else 1)),"=")
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_cx_b1 = _S.arg(_args,1)
	var _n_cy_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_k_b5 = _S.arg(_args,5)
	var _n_c_b6 = _S.arg(_args,6)
	var _object_0 = _S.coalesce(_S.arg(_args,7),func():return {})
	var _n_sy_b7 = _S.coalesce(_S.named_value(_object_0,"sy"),func():return 1)
	var _n_ph_b8 = _S.coalesce(_S.named_value(_object_0,"ph"),func():return 0)
	var _n_brk_b9 = _S.coalesce(_S.named_value(_object_0,"brk"),func():return 0)
	var _n_lit_b10 = _S.coalesce(_S.named_value(_object_0,"lit"),func():return 0.35)
	var _n_maxY_b11 = _S.coalesce(_S.named_value(_object_0,"maxY"),func():return INF)
	var _n_half_b12 = _S.coalesce(_S.named_value(_object_0,"half"),func():return 0)
	if _S.truth(((_n_k_b5 <= 0.01) if _S.truth((_n_k_b5 <= 0.01)) else (_n_r_b3 <= 0))):
		return null
	var _n_W_b13 = (_n_w_b4 * 1.6)
	var _n_lite_b14 = _S.ColorFX.mix(_n_c_b6,_n_WHITE,_n_lit_b10)
	if true:
		var _n_y_b15 = (floori((_n_cy_b2 - ((_n_r_b3 + _n_W_b13) * _n_sy_b7))) - 1)
		while _S.truth((_n_y_b15 <= minf((_n_maxY_b11 - 1),(ceili((_n_cy_b2 + ((_n_r_b3 + _n_W_b13) * _n_sy_b7))) + 1)))):
			if true:
				var _n_x_b16 = (floori(((_n_cx_b1 - _n_r_b3) - _n_W_b13)) - 1)
				while _S.truth((_n_x_b16 <= (ceili(((_n_cx_b1 + _n_r_b3) + _n_W_b13)) + 1))):
					var _n_dx_b17 = ((_n_x_b16 + 0.5) - _n_cx_b1)
					var _n_dy_b18 = (float(((_n_y_b15 + 0.5) - _n_cy_b2))/_n_sy_b7)
					var _n_d_b19 = _S.Bridge.hypot([_n_dx_b17, _n_dy_b18])
					var _n_g_b20 = atan2(_n_dy_b18,_n_dx_b17)
					if _S.truth((((_n_dy_b18 >= 0) if _S.truth((_n_half_b12 < 0)) else (_n_half_b12 < 0)) if _S.truth(((_n_dy_b18 >= 0) if _S.truth((_n_half_b12 < 0)) else (_n_half_b12 < 0))) else ((_n_dy_b18 < 0) if _S.truth((_n_half_b12 > 0)) else (_n_half_b12 > 0)))):
						_n_x_b16 += 1.0
						continue
					var _n_lumpy_b21 = (((0.6 + (0.3 * sin(((5 * _n_g_b20) + _n_ph_b8)))) + (0.18 * sin(((11 * _n_g_b20) + (_n_ph_b8 * 2.1))))) + (0.12 * sin(((17 * _n_g_b20) + (_n_ph_b8 * 0.7)))))
					var _n_wt_b22 = (_n_w_b4 * _n_lumpy_b21)
					var _n_off_b23 = absf(((_n_d_b19 - _n_r_b3) - ((_n_w_b4 * 0.25) * sin(((7 * _n_g_b20) + _n_ph_b8)))))
					if _S.truth((_n_off_b23 >= _n_wt_b22)):
						_n_x_b16 += 1.0
						continue
					var _n_tear_b24 = (clampf((float(((0.55 + (0.45 * sin(((6 * _n_g_b20) + (_n_ph_b8 * 1.7))))) - _n_brk_b9))/0.25),0.0,1.0) if _S.truth((_n_brk_b9 > 0)) else 1)
					var _n_a_b25 = ((_n_k_b5 * (1 - pow((float(_n_off_b23)/_n_wt_b22),2))) * _n_tear_b24)
					if _S.truth((_n_a_b25 > 0.01)):
						_S.invoke(_n_p_b0,"blend",[_n_x_b16, _n_y_b15, (_n_lite_b14 if _S.truth(((_n_d_b19 > (_n_r_b3 - (_n_wt_b22 * 0.3))) if _S.truth((_n_dy_b18 < 0)) else (_n_dy_b18 < 0))) else _n_c_b6), _n_a_b25])
					_n_x_b16 += 1.0
			_n_y_b15 += 1.0
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_st_b2 = _S.arg(_args,2)
	var _n_r_b3 = (0.75 + (_S.named_value(_n_b_b1,"s") * 0.8))
	var _n_n_b4 = _S.prop(_S.named_value(_n_b_b1,"pts"),"length")
	var _n_fade_b5 = minf(1,(float(_S.named_value(_n_b_b1,"life"))/0.5))
	var _n_ca_b6 = cos(_S.named_value(_n_b_b1,"a"))
	var _n_sa_b7 = sin(_S.named_value(_n_b_b1,"a"))
	_S.invoke(_n_p_b0,"shade",[((_S.named_value(_n_b_b1,"x") - _n_r_b3) - 2), ((_S.named_value(_n_b_b1,"y") - _n_r_b3) - 2), ((_S.named_value(_n_b_b1,"x") + _n_r_b3) + 2), ((_S.named_value(_n_b_b1,"y") + _n_r_b3) + 2), _S.function_value(_S.capture(_parent,{"b":_n_b_b1,"ca":_n_ca_b6,"sa":_n_sa_b7,"n":_n_n_b4,"r":_n_r_b3,"fade":_n_fade_b5,"st":_n_st_b2,"this":_this}),"_f15")])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_b = _S.read(_parent,"b")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_n = _S.read(_parent,"n")
	var _n_r = _S.read(_parent,"r")
	var _n_fade = _S.read(_parent,"fade")
	var _n_OUTLINE = _S.read(_parent,"OUTLINE")
	var _n_LIGHT = _S.read(_parent,"LIGHT")
	var _n_st = _S.read(_parent,"st")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_x_b0 - _S.named_value(_n_b,"x"))
	var _n_dy_b4 = (_n_y_b1 - _S.named_value(_n_b,"y"))
	var _n_u_b5 = ((_n_dx_b3 * _n_ca) + (_n_dy_b4 * _n_sa))
	var _n_v_b6 = (((-_n_dx_b3) * _n_sa) + (_n_dy_b4 * _n_ca))
	var _n_d_b7 = _S.Bridge.hypot([_n_u_b5, _n_v_b6])
	var _n_ang_b8 = atan2(_n_v_b6,_n_u_b5)
	if _S.truth((_n_ang_b8 < 0)):
		_n_ang_b8 += _n_TAU
	var _n_f_b9 = ((float(_n_ang_b8)/_n_TAU) * _n_n)
	var _n_i_b10 = fmod(floori(_n_f_b9),_n_n)
	var _n_w_b11 = (_n_f_b9 - floori(_n_f_b9))
	var _n_edge_b12 = (_n_r * ((_S.index_value(_S.named_value(_n_b,"pts"),_n_i_b10) * (1 - _n_w_b11)) + (_S.index_value(_S.named_value(_n_b,"pts"),fmod((_n_i_b10 + 1),_n_n)) * _n_w_b11)))
	if _S.truth((_n_d_b7 > (_n_edge_b12 + 0.85))):
		return null
	_S.set_prop(_n_out_b2,"a",_n_fade,"=")
	if _S.truth((_n_d_b7 > _n_edge_b12)):
		return _n_OUTLINE
	var _n_lit_b13 = cos(((((float((_n_i_b10 + 0.5))/_n_n) * _n_TAU) + _S.named_value(_n_b,"a")) - _n_LIGHT))
	if _S.truth((_n_d_b7 < (_n_edge_b12 * 0.42))):
		return (_S.named_value(_n_st,"light") if _S.truth((_n_lit_b13 > 0.55)) else _S.named_value(_n_st,"body"))
	return (_S.named_value(_n_st,"light") if _S.truth((_n_lit_b13 > 0.35)) else (_S.named_value(_n_st,"shade") if _S.truth((_n_lit_b13 < (-0.4))) else _S.named_value(_n_st,"body")))
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_this = _S.read(_parent,"this")
	var _n_R_b0 = _S.arg(_args,0)
	var _n_n_b1 = _S.coalesce(_S.arg(_args,1),func():return 6)
	return _S.invoke(_n_Array,"from",[{"length":_n_n_b1}, _S.function_value(_S.capture(_parent,{"R":_n_R_b0,"this":_n_this}),"_f17")])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	return _S.invoke(_n_R,"range",[0.7, 1.12])
	return null
