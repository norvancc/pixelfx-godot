@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/frost-breath.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "flyV", _S.import_value("core/index.js", "flyV"))
	_S.define(_e, "loopNoise", _S.import_value("core/index.js", "loopNoise"))
	_S.define(_e, "tileFbm", _S.import_value("core/index.js", "tileFbm"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "puff", _S.function_value(_e, "_f0"))
	_S.define(_e, "gust", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Frost breath"}, {"desc": "A cone of icy wind blowing right: frost puffs billow out, swell and sink, wind streaks race through, ice crystals tumble and glint off a white-hot mouth."}, {"tags": ["ice", "breath", "frost", "cone", "wind", "directional", "loop"]}, {"size": [184, 104]}, {"origin": [12, 50]}, {"duration": 1.2}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"spread": 0.21}, {"power": 1}, {"seed": 11}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SINK", 9)
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_r_b4 = _S.arg(_args,4)
	var _n_a_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.arg(_args,6)
	var _n_front_b7 = _S.arg(_args,7)
	var _n_body_b8 = (_S.index_value(_n_C_b1,5) if _S.truth(_n_front_b7) else _S.index_value(_n_C_b1,4))
	var _n_cap_b9 = (_S.index_value(_n_C_b1,7) if _S.truth(_n_front_b7) else _S.index_value(_n_C_b1,6))
	var _n_soft_b10 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f1")
	_S.invoke(_n_p_b0,"disc",[_n_x_b2, _n_y_b3, _n_r_b4, _n_body_b8, _S.call_value(_n_soft_b10,[(_n_a_b5 * 0.6)])])
	_S.invoke(_n_p_b0,"disc",[(_n_x_b2 + (_n_r_b4 * 0.06)), (_n_y_b3 + (_n_r_b4 * 0.12)), (_n_r_b4 * 0.68), _S.ColorFX.mix(_n_body_b8,_S.index_value(_n_C_b1,3),0.3), _S.call_value(_n_soft_b10,[(_n_a_b5 * 0.5)])])
	if _S.truth((_n_k_b6 < 0.55)):
		_S.invoke(_n_p_b0,"disc",[(_n_x_b2 - (_n_r_b4 * 0.25)), (_n_y_b3 - (_n_r_b4 * 0.3)), (_n_r_b4 * 0.5), _n_cap_b9, _S.call_value(_n_soft_b10,[((_n_a_b5 * 0.7) * (1 - (float(_n_k_b6)/0.55)))])])
	_S.invoke(_n_p_b0,"glow",[_n_x_b2, _n_y_b3, (_n_r_b4 * 1.7), _S.index_value(_n_C_b1,4), (0.1 * _n_a_b5)])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_q_b0 = _S.arg(_args,0)
	return _S.function_value(_S.capture(_parent,{"q":_n_q_b0,"this":_n_this}),"_f2")
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_q = _S.read(_parent,"q")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_q * (1 - (_n_d_b0 * _n_d_b0)))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_o_b3 = _S.arg(_args,3)
	var _n_ph_b4 = (float(_n_t_b2)/_S.named_value(_n_meta,"duration"))
	var _n_sp_b5 = (tan(_S.named_value(_n_o_b3,"spread")) * 1.08)
	var _n_S_b6 = _S.named_value(_n_o_b3,"seed")
	_S.invoke(_n_p_b0,"each",[2, (-46), 170, 46, _S.function_value(_S.capture(_parent,{"sp":_n_sp_b5,"ph":_n_ph_b4,"S":_n_S_b6,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_sp = _S.read(_parent,"sp")
	var _n_ph = _S.read(_parent,"ph")
	var _n_S = _S.read(_parent,"S")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_sx_b2 = _S.arg(_args,2)
	var _n_sy_b3 = _S.arg(_args,3)
	var _n_u_b4 = (float(_n_x_b0)/170)
	var _n_hw_b5 = (2.5 + (_n_x_b0 * _n_sp))
	var _n_yc_b6 = ((7 * _n_u_b4) * _n_u_b4)
	var _n_v_b7 = (float((_n_y_b1 - _n_yc_b6))/_n_hw_b5)
	if _S.truth((((_n_v_b7 * _n_v_b7) >= 1) if _S.truth(((_n_v_b7 * _n_v_b7) >= 1)) else (_n_u_b4 >= 1))):
		return null
	var _n_n_b8 = _S.NoiseKernels.tile_fbm(((_n_x_b0 * 0.055) - (_n_ph * 10)),(((_n_y_b1 - _n_yc_b6) * 0.15) + 7),10,0,_n_S,2)
	var _n_edge_b9 = (((1 - (_n_v_b7 * _n_v_b7)) * ((float(_n_u_b4)/0.08) if _S.truth((_n_u_b4 < 0.08)) else 1)) * pow((1 - _n_u_b4),0.8))
	var _n_d_b10 = (clampf(((0.5 + (_n_n_b8 * 1.3)) + (((1 - absf(_n_v_b7)) * 0.35) * pow((1 - _n_u_b4),1.5))),0.0,1.0) * _n_edge_b9)
	if _S.truth((_n_d_b10 < 0.08)):
		return null
	_S.invoke(_n_p,"blendPx",[_n_sx_b2, _n_sy_b3, (_S.index_value(_n_C,7) if _S.truth((_n_d_b10 > 0.72)) else (_S.index_value(_n_C,6) if _S.truth((_n_d_b10 > 0.52)) else (_S.index_value(_n_C,5) if _S.truth((_n_d_b10 > 0.32)) else _S.index_value(_n_C,4)))), (minf(0.78,(_n_d_b10 * 0.95)) * clampf((float((_n_d_b10 - 0.08))/0.3),0.0,1.0))])
	if _S.truth((_n_d_b10 > 0.3)):
		_S.invoke(_n_p,"add",[_n_sx_b2, _n_sy_b3, (_S.index_value(_n_C,6) if _S.truth((_n_d_b10 > 0.6)) else _S.index_value(_n_C,5)), (0.2 * _n_d_b10)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_gust = _S.read(_parent,"gust")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_D_b4 = _S.named_value(_n_meta,"duration")
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_sp_b6 = _S.named_value(_n_o_b2,"spread")
	_S.call_value(_n_gust,[_n_p_b0, _n_C_b3, _n_t_b1, _n_o_b2])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D_b4, 12, _n_S_b5, _S.function_value(_S.capture(_parent,{"this":_this}),"_f6"), _S.function_value(_S.capture(_parent,{"sp":_n_sp_b6,"o":_n_o_b2,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f7")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[1, 1.25])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_sp = _S.read(_parent,"sp")
	var _n_o = _S.read(_parent,"o")
	var _n_SINK = _S.read(_parent,"SINK")
	var _n_fly = _S.read(_parent,"fly")
	var _n_puff = _S.read(_parent,"puff")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_th_b3 = _S.invoke(_n_r_b2,"range",[(-_n_sp), _n_sp])
	var _n_v_b4 = (_S.invoke(_n_r_b2,"range",[170, 230]) * _S.named_value(_n_o,"power"))
	var _tuple_0 = _S.call_value(_n_fly,[3, _S.invoke(_n_r_b2,"range",[(-1), 1]), (_n_v_b4 * cos(_n_th_b3)), (_n_v_b4 * sin(_n_th_b3)), _n_age_b0, _n_SINK, 1.4])
	var _n_x_b5 = _S.prop(_tuple_0,0)
	var _n_y_b6 = _S.prop(_tuple_0,1)
	var _n_k_b7 = (float(_n_age_b0)/_n_life_b1)
	var _n_rad_b8 = (2 + (12 * pow(_n_k_b7,0.75)))
	_S.call_value(_n_puff,[_n_p, _n_C, _n_x_b5, minf(_n_y_b6,(40 - _n_rad_b8)), _n_rad_b8, ((0.75 * pow((1 - _n_k_b7),1.2)) * minf(1,(float(_n_age_b0)/0.08))), _n_k_b7, false])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_D_b4 = _S.named_value(_n_meta,"duration")
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_sp_b6 = _S.named_value(_n_o_b2,"spread")
	var _n_ph_b7 = (float(_n_t_b1)/_n_D_b4)
	_S.invoke(_n_p_b0,"glowLine",[4, 0, 120, 6, 24, _S.index_value(_n_C_b3,4), 0.26])
	_S.invoke(_n_p_b0,"glowLine",[2, 0, 50, 1, 9, _S.index_value(_n_C_b3,6), 0.3])
	_S.invoke(_n_p_b0,"glow",[60, 4, 44, _S.index_value(_n_C_b3,3), 0.16])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D_b4, 10, (_n_S_b5 + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), _S.function_value(_S.capture(_parent,{"sp":_n_sp_b6,"o":_n_o_b2,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f10")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D_b4, 18, (_n_S_b5 + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f11"), _S.function_value(_S.capture(_parent,{"sp":_n_sp_b6,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f12")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D_b4, 26, (_n_S_b5 + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f13"), _S.function_value(_S.capture(_parent,{"sp":_n_sp_b6,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f14")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D_b4, 9, (_n_S_b5 + 4), _S.function_value(_S.capture(_parent,{"this":_this}),"_f17"), _S.function_value(_S.capture(_parent,{"sp":_n_sp_b6,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f18")])
	if true:
		var _n_i_b9 = 0
		while _S.truth((_n_i_b9 < 3)):
			var _n_L_b10 = (9 + (6 * _S.NoiseKernels.loop_noise(_n_ph_b7,1.2,(_n_S_b5 + (_n_i_b9 * 7)))))
			var _n_dy_b11 = ((_n_i_b9 - 1) * 1.4)
			_S.invoke(_n_p_b0,"line",[2, (_n_dy_b11 * 0.5), (2 + _n_L_b10), _n_dy_b11, _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f19"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f20")])
			_n_i_b9 += 1.0
	_S.invoke(_n_p_b0,"ellipse",[2.5, 0, 4.6, 3, _S.index_value(_n_C_b3,6)])
	_S.invoke(_n_p_b0,"ellipse",[2, 0, 3, 1.8, _n_WHITE])
	var _n_fl_b8 = (0.85 + (0.15 * sin(((_n_ph_b7 * _n_TAU) * 3))))
	_S.invoke(_n_p_b0,"glow",[2, 0, 24, _S.index_value(_n_C_b3,5), (0.7 * _n_fl_b8)])
	_S.invoke(_n_p_b0,"glow",[2, 0, 9, _n_WHITE, (0.5 * _n_fl_b8)])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.7, 0.95])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_sp = _S.read(_parent,"sp")
	var _n_o = _S.read(_parent,"o")
	var _n_SINK = _S.read(_parent,"SINK")
	var _n_fly = _S.read(_parent,"fly")
	var _n_puff = _S.read(_parent,"puff")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_th_b3 = _S.invoke(_n_r_b2,"range",[((-_n_sp) * 0.8), (_n_sp * 0.8)])
	var _n_v_b4 = (_S.invoke(_n_r_b2,"range",[190, 260]) * _S.named_value(_n_o,"power"))
	var _tuple_0 = _S.call_value(_n_fly,[3, _S.invoke(_n_r_b2,"range",[(-1), 1]), (_n_v_b4 * cos(_n_th_b3)), (_n_v_b4 * sin(_n_th_b3)), _n_age_b0, _n_SINK, 1.6])
	var _n_x_b5 = _S.prop(_tuple_0,0)
	var _n_y_b6 = _S.prop(_tuple_0,1)
	var _n_k_b7 = (float(_n_age_b0)/_n_life_b1)
	var _n_rad_b8 = (1.5 + (8 * pow(_n_k_b7,0.7)))
	_S.call_value(_n_puff,[_n_p, _n_C, _n_x_b5, minf(_n_y_b6,(40 - _n_rad_b8)), _n_rad_b8, ((0.85 * pow((1 - _n_k_b7),1.3)) * minf(1,(float(_n_age_b0)/0.06))), _n_k_b7, true])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.8, 1.1])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_sp = _S.read(_parent,"sp")
	var _n_SINK = _S.read(_parent,"SINK")
	var _n_fly = _S.read(_parent,"fly")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_th_b3 = _S.invoke(_n_r_b2,"range",[((-_n_sp) * 1.1), (_n_sp * 1.1)])
	var _n_v_b4 = _S.invoke(_n_r_b2,"range",[120, 190])
	var _tuple_0 = _S.call_value(_n_fly,[4, 0, (_n_v_b4 * cos(_n_th_b3)), (_n_v_b4 * sin(_n_th_b3)), _n_age_b0, (_n_SINK * 1.4), 1.5])
	var _n_x_b5 = _S.prop(_tuple_0,0)
	var _n_y_b6 = _S.prop(_tuple_0,1)
	var _n_k_b7 = (float(_n_age_b0)/_n_life_b1)
	var _n_sw_b8 = (sin(((_n_age_b0 * 9) + _S.invoke(_n_r_b2,"range",[0, _n_TAU]))) * 1.5)
	if _S.truth(((_n_k_b7 < 0.85) if _S.truth((_n_k_b7 < 0.85)) else (fmod((_n_age_b0 * 30),2) < 1))):
		_S.invoke(_n_p,"px",[_n_x_b5, (_n_y_b6 + _n_sw_b8), (_n_WHITE if _S.truth(_S.invoke(_n_r_b2,"chance",[0.5])) else _S.index_value(_n_C,6))])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.22, 0.36])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_sp = _S.read(_parent,"sp")
	var _n_fly = _S.read(_parent,"fly")
	var _n_flyV = _S.read(_parent,"flyV")
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_th_b3 = _S.invoke(_n_r_b2,"range",[((-_n_sp) * 0.9), (_n_sp * 0.9)])
	var _n_v_b4 = _S.invoke(_n_r_b2,"range",[280, 380])
	var _tuple_0 = _S.call_value(_n_fly,[6, _S.invoke(_n_r_b2,"range",[(-2), 2]), (_n_v_b4 * cos(_n_th_b3)), (_n_v_b4 * sin(_n_th_b3)), _n_age_b0, 0, 0.9])
	var _n_x_b5 = _S.prop(_tuple_0,0)
	var _n_y_b6 = _S.prop(_tuple_0,1)
	var _tuple_1 = _S.call_value(_n_flyV,[(_n_v_b4 * cos(_n_th_b3)), (_n_v_b4 * sin(_n_th_b3)), _n_age_b0, 0, 0.9])
	var _n_vx_b7 = _S.prop(_tuple_1,0)
	var _n_vy_b8 = _S.prop(_tuple_1,1)
	var _n_s_b9 = _S.Bridge.hypot([_n_vx_b7, _n_vy_b8])
	var _n_L_b10 = (4 + (_n_s_b9 * 0.03))
	var _n_ux_b11 = (float(_n_vx_b7)/_n_s_b9)
	var _n_uy_b12 = (float(_n_vy_b8)/_n_s_b9)
	var _n_k_b13 = (float(_n_age_b0)/_n_life_b1)
	_S.invoke(_n_p,"line",[(_n_x_b5 - (_n_ux_b11 * _n_L_b10)), (_n_y_b6 - (_n_uy_b12 * _n_L_b10)), _n_x_b5, _n_y_b6, _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f15"), _S.function_value(_S.capture(_parent,{"k":_n_k_b13,"this":_n_this}),"_f16")])
	_S.invoke(_n_p,"glow",[_n_x_b5, _n_y_b6, 3, _S.index_value(_n_C,5), (0.3 * (1 - _n_k_b13))])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 > 0.8)) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 > 0.4)) else _S.index_value(_n_C,4)))
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_k = _S.read(_parent,"k")
	var _n_u_b0 = _S.arg(_args,0)
	return ((1 if _S.truth((_n_u_b0 > 0.35)) else (float(_n_u_b0)/0.35)) * (1 if _S.truth((_n_k < 0.75)) else (float((1 - _n_k))/0.25)))
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.65, 0.9])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_sp = _S.read(_parent,"sp")
	var _n_SINK = _S.read(_parent,"SINK")
	var _n_fly = _S.read(_parent,"fly")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_th_b3 = _S.invoke(_n_r_b2,"range",[(-_n_sp), _n_sp])
	var _n_v_b4 = _S.invoke(_n_r_b2,"range",[150, 230])
	var _tuple_0 = _S.call_value(_n_fly,[5, 0, (_n_v_b4 * cos(_n_th_b3)), (_n_v_b4 * sin(_n_th_b3)), _n_age_b0, _n_SINK, 1.1])
	var _n_x_b5 = _S.prop(_tuple_0,0)
	var _n_y_b6 = _S.prop(_tuple_0,1)
	var _n_k_b7 = (float(_n_age_b0)/_n_life_b1)
	var _n_a_b8 = (_S.invoke(_n_r_b2,"range",[0, _n_TAU]) + ((_n_age_b0 * _S.invoke(_n_r_b2,"range",[9, 15])) * _S.invoke(_n_r_b2,"sign",[])))
	var _n_L_b9 = _S.invoke(_n_r_b2,"range",[1.5, 2.6])
	var _n_ca_b10 = cos(_n_a_b8)
	var _n_sa_b11 = sin(_n_a_b8)
	if _S.truth(((fmod((_n_age_b0 * 30),2) < 1) if _S.truth((_n_k_b7 > 0.85)) else (_n_k_b7 > 0.85))):
		return null
	_S.invoke(_n_p,"line",[(_n_x_b5 - (_n_ca_b10 * _n_L_b9)), (_n_y_b6 - (_n_sa_b11 * _n_L_b9)), (_n_x_b5 + (_n_ca_b10 * _n_L_b9)), (_n_y_b6 + (_n_sa_b11 * _n_L_b9)), _S.index_value(_n_C,5)])
	_S.invoke(_n_p,"px",[(_n_x_b5 + (_n_ca_b10 * _n_L_b9)), (_n_y_b6 + (_n_sa_b11 * _n_L_b9)), _n_WHITE])
	var _n_gl_b12 = cos((_n_a_b8 * 2))
	if _S.truth((_n_gl_b12 > 0.92)):
		for _iter_1 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
			var _tuple_2 = _iter_1
			var _n_dx_b13 = _S.prop(_tuple_2,0)
			var _n_dy_b14 = _S.prop(_tuple_2,1)
			_S.invoke(_n_p,"px",[(_n_x_b5 + _n_dx_b13), (_n_y_b6 + _n_dy_b14), _S.index_value(_n_C,6)])
		_S.invoke(_n_p,"px",[_n_x_b5, _n_y_b6, _n_WHITE])
		_S.invoke(_n_p,"glow",[_n_x_b5, _n_y_b6, 6, _S.index_value(_n_C,5), 0.5])
	else:
		_S.invoke(_n_p,"glow",[_n_x_b5, _n_y_b6, 3, _S.index_value(_n_C,5), 0.2])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 < 0.5)) else _S.index_value(_n_C,6))
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return (1 if _S.truth((_n_u_b0 < 0.6)) else (1 - (float((_n_u_b0 - 0.6))/0.4)))
	return null
