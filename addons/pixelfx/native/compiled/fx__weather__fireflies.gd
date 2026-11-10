@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/fireflies.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "loopNoise", _S.import_value("core/index.js", "loopNoise"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "fly", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f7"))
	_S.define(_e, "firefly", _S.function_value(_e, "_f9"))
	_S.define(_e, "grass", _S.function_value(_e, "_f10"))
	_S.define(_e, "meta", _S.merge([{"name": "Fireflies"}, {"desc": "Fireflies wander over a meadow at night, each glowing up and fading on its own rhythm, trailing light and lighting the grass tips beneath them."}, {"tags": ["weather", "fireflies", "night", "glow", "meadow", "nature", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 12}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#2a3a10", "#5a7a1a", "#9ad02a", "#d6ff5a", "#f4ffb8", "#ffffff"]}, {"grass": ["#070f0b", "#0c1a12", "#13281a", "#1d3a24", "#2b5232", "#3f6e40"]}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 12)
	_S.define(_e, "cyc", _S.function_value(_e, "_f14"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_S_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_R_b3 = _S.function_value(_S.capture(_parent,{"S":_n_S_b0,"i":_n_i_b1,"this":_this}),"_f1")
	var _n_depth_b4 = (0 if _S.truth((_n_i_b1 < 14)) else (1 if _S.truth((_n_i_b1 < 26)) else 2))
	var _n_k_b5 = _S.index_value([0.5, 0.8, 1],_n_depth_b4)
	var _n_cx_b6 = ((-150) + (_S.call_value(_n_R_b3,[1]) * 300))
	var _n_cy_b7 = ((-16) - (_S.call_value(_n_R_b3,[2]) * (70 if _S.truth(_S.binary("===",_n_depth_b4,2)) else 130)))
	var _n_ax_b8 = ((14 + (_S.call_value(_n_R_b3,[3]) * 26)) * _n_k_b5)
	var _n_ay_b9 = ((8 + (_S.call_value(_n_R_b3,[4]) * 14)) * _n_k_b5)
	var _n_n1_b10 = (1 + floori((_S.call_value(_n_R_b3,[5]) * 2)))
	var _n_n2_b11 = (1 + floori((_S.call_value(_n_R_b3,[6]) * 3)))
	var _n_pos_b12 = _S.function_value(_S.capture(_parent,{"cx":_n_cx_b6,"ax":_n_ax_b8,"n1":_n_n1_b10,"R":_n_R_b3,"k":_n_k_b5,"i":_n_i_b1,"cy":_n_cy_b7,"ay":_n_ay_b9,"n2":_n_n2_b11,"this":_this}),"_f2")
	var _n_per_b13 = (float(_n_D)/(3 + floori((_S.call_value(_n_R_b3,[9]) * 4))))
	var _n_u_b14 = fmod((fmod(((float(_n_t_b2)/_n_per_b13) + _S.call_value(_n_R_b3,[10])),1) + 1),1)
	var _n_two_b15 = (_S.call_value(_n_R_b3,[11]) < 0.35)
	var _n_pulse_b16 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f3")
	var _n_glow_b17 = maxf(_S.call_value(_n_pulse_b16,[_n_u_b14]),((_S.call_value(_n_pulse_b16,[(_n_u_b14 - 0.22)]) * 0.8) if _S.truth(_n_two_b15) else 0))
	return {"pos":_n_pos_b12,"depth":_n_depth_b4,"glow":_n_glow_b17,"R":_n_R_b3}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_i = _S.read(_parent,"i")
	var _n_n_b0 = _S.arg(_args,0)
	return _S.MathFX.rand([_n_S,_n_i,_n_n_b0])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_ax = _S.read(_parent,"ax")
	var _n_cyc = _S.read(_parent,"cyc")
	var _n_n1 = _S.read(_parent,"n1")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_k = _S.read(_parent,"k")
	var _n_D = _S.read(_parent,"D")
	var _n_i = _S.read(_parent,"i")
	var _n_cy = _S.read(_parent,"cy")
	var _n_ay = _S.read(_parent,"ay")
	var _n_n2 = _S.read(_parent,"n2")
	var _n_tt_b0 = _S.arg(_args,0)
	return [((_n_cx + (_n_ax * sin(_S.call_value(_n_cyc,[_n_tt_b0, _n_n1, (_S.call_value(_n_R,[7]) * _n_TAU)])))) + ((10 * _n_k) * _S.NoiseKernels.loop_noise((float(_n_tt_b0)/_n_D),1.5,(_n_i * 3)))), ((_n_cy + (_n_ay * sin(_S.call_value(_n_cyc,[_n_tt_b0, _n_n2, (_S.call_value(_n_R,[8]) * _n_TAU)])))) + ((6 * _n_k) * _S.NoiseKernels.loop_noise((float(_n_tt_b0)/_n_D),1.5,((_n_i * 3) + 1))))]
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_v_b0 = _S.arg(_args,0)
	return ((float(_n_v_b0)/0.06) if _S.truth((_n_v_b0 < 0.06)) else (1 if _S.truth((_n_v_b0 < 0.14)) else ((1 - (float((_n_v_b0 - 0.14))/0.26)) if _S.truth((_n_v_b0 < 0.4)) else 0)))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_rows = _S.read(_parent,"rows")
	var _n_Array = _S.read(_parent,"Array")
	var _n_grass = _S.read(_parent,"grass")
	var _n_firefly = _S.read(_parent,"firefly")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),6)
	var _n_G_b6 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"grass"),6)
	_S.call_value(_n_rows,[_n_p_b0, _n_meta, (-170), 9, _S.function_value(_S.capture(_parent,{"G":_n_G_b6,"this":_this}),"_f5")])
	var _n_flies_b7 = _S.invoke(_n_Array,"from",[{"length":32}, _S.function_value(_S.capture(_parent,{"S":_n_S_b4,"t":_n_t_b1,"this":_this}),"_f6")])
	_S.call_value(_n_grass,[_n_q_b3, _n_t_b1, _n_S_b4, _n_G_b6, _n_C_b5, _n_flies_b7, false])
	for _iter_0 in _S.array(_n_flies_b7):
		var _n_f_b8 = _iter_0
		if _S.truth((_S.named_value(_n_f_b8,"depth") < 2)):
			_S.call_value(_n_firefly,[_n_q_b3, _n_t_b1, _n_f_b8, _n_C_b5])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_G = _S.read(_parent,"G")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	var _n_k_b2 = (float((_n_y_b0 + 170))/180)
	_S.invoke(_S.named_value(_n_R_b1,"c"),"fill",[_S.ColorFX.mix(_S.index_value(_n_G,0),_S.index_value(_n_G,1),_n_k_b2)])
	_S.invoke(_S.named_value(_n_R_b1,"a"),"fill",[(0.48 + (0.14 * _n_k_b2))])
	_S.invoke(_S.named_value(_n_R_b1,"b"),"fill",[1])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_fly = _S.read(_parent,"fly")
	var _n_S = _S.read(_parent,"S")
	var _n_t = _S.read(_parent,"t")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _S.call_value(_n_fly,[_n_S, _n_i_b1, _n_t])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_Array = _S.read(_parent,"Array")
	var _n_grass = _S.read(_parent,"grass")
	var _n_firefly = _S.read(_parent,"firefly")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),6)
	var _n_G_b6 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"grass"),6)
	var _n_flies_b7 = _S.invoke(_n_Array,"from",[{"length":32}, _S.function_value(_S.capture(_parent,{"S":_n_S_b4,"t":_n_t_b1,"this":_this}),"_f8")])
	_S.call_value(_n_grass,[_n_q_b3, _n_t_b1, _n_S_b4, _n_G_b6, _n_C_b5, _n_flies_b7, true])
	for _iter_0 in _S.array(_n_flies_b7):
		var _n_f_b8 = _iter_0
		if _S.truth(_S.binary("===",_S.named_value(_n_f_b8,"depth"),2)):
			_S.call_value(_n_firefly,[_n_q_b3, _n_t_b1, _n_f_b8, _n_C_b5])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_fly = _S.read(_parent,"fly")
	var _n_S = _S.read(_parent,"S")
	var _n_t = _S.read(_parent,"t")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _S.call_value(_n_fly,[_n_S, _n_i_b1, _n_t])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_f_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _tuple_0 = _S.invoke(_n_f_b2,"pos",[_n_t_b1])
	var _n_x_b4 = _S.prop(_tuple_0,0)
	var _n_y_b5 = _S.prop(_tuple_0,1)
	var _n_g_b6 = _S.named_value(_n_f_b2,"glow")
	var _n_X_b7 = floori(_n_x_b4+0.5)
	var _n_Y_b8 = floori(_n_y_b5+0.5)
	if _S.truth(_S.binary("===",_S.named_value(_n_f_b2,"depth"),0)):
		if _S.truth((_n_g_b6 < 0.08)):
			return null
		_S.invoke(_n_q_b0,"dot",[_n_X_b7, _n_Y_b8, (_S.index_value(_n_C_b3,4) if _S.truth((_n_g_b6 > 0.6)) else _S.index_value(_n_C_b3,3)), minf(1,(_n_g_b6 * 1.6))])
		_S.invoke(_n_q_b0,"glow",[_n_x_b4, _n_y_b5, 6, _S.index_value(_n_C_b3,2), (0.45 * _n_g_b6)])
		return null
	if _S.truth((_n_g_b6 > 0.3)):
		if true:
			var _n_j_b12 = 1
			while _S.truth((_n_j_b12 <= 4)):
				var _tuple_1 = _S.invoke(_n_f_b2,"pos",[(_n_t_b1 - (_n_j_b12 * 0.05))])
				var _n_tx_b13 = _S.prop(_tuple_1,0)
				var _n_ty_b14 = _S.prop(_tuple_1,1)
				_S.invoke(_n_q_b0,"dot",[_n_tx_b13, _n_ty_b14, _S.index_value(_n_C_b3,2), (((_n_g_b6 - 0.3) * (1 - (float(_n_j_b12)/5))) * 1.3)])
				_n_j_b12 += 1.0
	if _S.truth(_S.binary("===",_S.named_value(_n_f_b2,"depth"),1)):
		_S.invoke(_n_q_b0,"px",[_n_X_b7, _n_Y_b8, (_S.index_value(_n_C_b3,5) if _S.truth((_n_g_b6 > 0.5)) else (_S.index_value(_n_C_b3,3) if _S.truth((_n_g_b6 > 0.15)) else _S.index_value(_n_C_b3,1)))])
		if _S.truth((_n_g_b6 > 0.4)):
			_S.invoke(_n_q_b0,"px",[_n_X_b7, (_n_Y_b8 + 1), _S.index_value(_n_C_b3,2)])
		_S.invoke(_n_q_b0,"glow",[_n_x_b4, _n_y_b5, 9, _S.index_value(_n_C_b3,2), (0.5 * _n_g_b6)])
		_S.invoke(_n_q_b0,"glow",[_n_x_b4, _n_y_b5, 3, _S.index_value(_n_C_b3,4), (0.5 * _n_g_b6)])
		return null
	var _tuple_2 = _S.invoke(_n_f_b2,"pos",[(_n_t_b1 + 0.05)])
	var _n_nx_b9 = _S.prop(_tuple_2,0)
	var _n_dir_b10 = (1 if _S.truth((_n_nx_b9 >= _n_x_b4)) else (-1))
	var _n_beat_b11 = fmod(floori((_n_t_b1 * 30)),2)
	_S.invoke(_n_q_b0,"px",[(_n_X_b7 + _n_dir_b10), _n_Y_b8, _S.index_value(_n_C_b3,0)])
	_S.invoke(_n_q_b0,"px",[(_n_X_b7 + (_n_dir_b10 * 2)), _n_Y_b8, _S.index_value(_n_C_b3,0)])
	_S.invoke(_n_q_b0,"dot",[_n_X_b7, ((_n_Y_b8 - 1) - _n_beat_b11), _S.ColorFX.mix(_S.index_value(_n_C_b3,1),_n_WHITE,0.4), 0.7])
	_S.invoke(_n_q_b0,"dot",[(_n_X_b7 + _n_dir_b10), ((_n_Y_b8 - 1) - _n_beat_b11), _S.ColorFX.mix(_S.index_value(_n_C_b3,1),_n_WHITE,0.4), 0.7])
	_S.invoke(_n_q_b0,"px",[_n_X_b7, _n_Y_b8, (_S.index_value(_n_C_b3,5) if _S.truth((_n_g_b6 > 0.3)) else _S.index_value(_n_C_b3,1))])
	_S.invoke(_n_q_b0,"px",[(_n_X_b7 - _n_dir_b10), _n_Y_b8, (_S.index_value(_n_C_b3,4) if _S.truth((_n_g_b6 > 0.5)) else (_S.index_value(_n_C_b3,3) if _S.truth((_n_g_b6 > 0.15)) else _S.index_value(_n_C_b3,1)))])
	if _S.truth((_n_g_b6 > 0.6)):
		_S.invoke(_n_q_b0,"px",[(_n_X_b7 - _n_dir_b10), (_n_Y_b8 + 1), _S.index_value(_n_C_b3,3)])
	if _S.truth((_n_g_b6 > 0.7)):
		for _iter_3 in _S.array([[0, (-2)], [0, 2], [(-2), 0], [2, 0]]):
			var _tuple_4 = _iter_3
			var _n_dx_b15 = _S.prop(_tuple_4,0)
			var _n_dy_b16 = _S.prop(_tuple_4,1)
			_S.invoke(_n_q_b0,"dot",[((_n_X_b7 - _n_dir_b10) + _n_dx_b15), (_n_Y_b8 + _n_dy_b16), _S.index_value(_n_C_b3,3), ((_n_g_b6 - 0.7) * 3)])
	_S.invoke(_n_q_b0,"glow",[_n_x_b4, _n_y_b5, 28, _S.index_value(_n_C_b3,2), (0.45 * _n_g_b6)])
	_S.invoke(_n_q_b0,"glow",[_n_x_b4, _n_y_b5, 10, _S.index_value(_n_C_b3,4), (0.5 * _n_g_b6)])
	_S.invoke(_n_q_b0,"glow",[_n_x_b4, _n_y_b5, 4, _S.index_value(_n_C_b3,5), (0.5 * _n_g_b6)])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_cyc = _S.read(_parent,"cyc")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_G_b3 = _S.arg(_args,3)
	var _n_C_b4 = _S.arg(_args,4)
	var _n_flies_b5 = _S.arg(_args,5)
	var _n_front_b6 = _S.arg(_args,6)
	var _n_lit_b7 = _S.invoke(_S.invoke(_n_flies_b5,"filter",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f11")]),"map",[_S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f12")])
	var _n_n_b8 = (150 if _S.truth(_n_front_b6) else 230)
	if true:
		var _n_i_b9 = 0
		while _S.truth((_n_i_b9 < _n_n_b8)):
			var _n_R_b10 = _S.function_value(_S.capture(_parent,{"S":_n_S_b2,"front":_n_front_b6,"i":_n_i_b9,"this":_this}),"_f13")
			var _n_x_b11 = ((-162) + ((_n_i_b9 + _S.call_value(_n_R_b10,[1])) * (float(324)/_n_n_b8)))
			var _n_h_b12 = (((4 if _S.truth(_n_front_b6) else 5) + (_S.call_value(_n_R_b10,[2]) * (8 if _S.truth(_n_front_b6) else 11))) + (6 if _S.truth((_S.call_value(_n_R_b10,[3]) < 0.1)) else 0))
			var _n_base_b13 = ((9 if _S.truth(_n_front_b6) else 2) - (_S.call_value(_n_R_b10,[4]) * 3))
			var _n_sway_b14 = (((1.2 + _S.call_value(_n_R_b10,[5])) * sin((_S.call_value(_n_cyc,[_n_t_b1, 2, ((-_n_x_b11) * 0.03)]) + _S.call_value(_n_R_b10,[6])))) + (0.6 * sin(_S.call_value(_n_cyc,[_n_t_b1, 5, (_n_x_b11 * 0.07)]))))
			var _n_tone_b15 = ((1 + floori((_S.call_value(_n_R_b10,[7]) * 3))) if _S.truth(_n_front_b6) else (1 + floori((_S.call_value(_n_R_b10,[7]) * 2))))
			var _n_tipLight_b16 = 0
			for _iter_0 in _S.array(_n_lit_b7):
				var _tuple_1 = _iter_0
				var _n_fx_b17 = _S.prop(_tuple_1,0)
				var _n_fy_b18 = _S.prop(_tuple_1,1)
				var _n_g_b19 = _S.prop(_tuple_1,2)
				var _n_d_b20 = _S.Bridge.hypot([(_n_fx_b17 - (_n_x_b11 + _n_sway_b14)), (_n_fy_b18 - (_n_base_b13 - _n_h_b12))])
				if _S.truth((_n_d_b20 < 28)):
					_n_tipLight_b16 = maxf(_n_tipLight_b16,(_n_g_b19 * (1 - (float(_n_d_b20)/28))))
			if true:
				var _n_r_b21 = 0
				while _S.truth((_n_r_b21 < _n_h_b12)):
					var _n_u_b22 = (float(_n_r_b21)/_n_h_b12)
					var _n_c_b23 = ((_S.index_value(_n_C_b4,3) if _S.truth(((_n_u_b22 > 0.9) if _S.truth((_n_tipLight_b16 > 0.55)) else (_n_tipLight_b16 > 0.55))) else _S.index_value(_n_C_b4,2)) if _S.truth(((_n_tipLight_b16 > 0.2) if _S.truth((_n_u_b22 > 0.8)) else (_n_u_b22 > 0.8))) else (_S.index_value(_n_G_b3,minf(5,(_n_tone_b15 + 1))) if _S.truth((_n_u_b22 > 0.7)) else _S.index_value(_n_G_b3,_n_tone_b15)))
					_S.invoke(_n_q_b0,"px",[(_n_x_b11 + ((_n_sway_b14 * _n_u_b22) * _n_u_b22)), (_n_base_b13 - _n_r_b21), _n_c_b23])
					_n_r_b21 += 1.0
			if _S.truth((_S.call_value(_n_R_b10,[8]) < 0.07)):
				var _n_sx_b24 = (_n_x_b11 + _n_sway_b14)
				var _n_sy_b25 = (_n_base_b13 - _n_h_b12)
				_S.invoke(_n_q_b0,"px",[_n_sx_b24, (_n_sy_b25 - 1), (_S.index_value(_n_C_b4,3) if _S.truth((_n_tipLight_b16 > 0.2)) else _S.index_value(_n_G_b3,5))])
				_S.invoke(_n_q_b0,"px",[(_n_sx_b24 - 1), _n_sy_b25, _S.index_value(_n_G_b3,4)])
				_S.invoke(_n_q_b0,"px",[(_n_sx_b24 + 1), _n_sy_b25, _S.index_value(_n_G_b3,4)])
			_n_i_b9 += 1.0
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_f_b0 = _S.arg(_args,0)
	return ((_S.named_value(_n_f_b0,"depth") > 0) if _S.truth((_S.named_value(_n_f_b0,"glow") > 0.25)) else (_S.named_value(_n_f_b0,"glow") > 0.25))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_f_b0 = _S.arg(_args,0)
	return _S.concat([_S.array(_S.invoke(_n_f_b0,"pos",[_n_t])),[_S.named_value(_n_f_b0,"glow")]])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_front = _S.read(_parent,"front")
	var _n_i = _S.read(_parent,"i")
	var _n_k_b0 = _S.arg(_args,0)
	return _S.MathFX.rand([((_n_S * 3) + (1 if _S.truth(_n_front) else 0)),_n_i,_n_k_b0])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_n_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	return ((float(((_n_TAU * _n_n_b1) * _n_t_b0))/_n_D) + _n_ph_b2)
	return null
