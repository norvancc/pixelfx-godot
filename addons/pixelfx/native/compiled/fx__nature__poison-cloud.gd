@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/poison-cloud.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "tongues", _S.function_value(_e, "_f0"))
	_S.define(_e, "height", _S.function_value(_e, "_f1"))
	_S.define(_e, "sheet", _S.function_value(_e, "_f2"))
	_S.define(_e, "plumes", _S.function_value(_e, "_f3"))
	_S.define(_e, "specks", _S.function_value(_e, "_f6"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f9"))
	_S.define(_e, "draw", _S.function_value(_e, "_f11"))
	_S.define(_e, "meta", _S.merge([{"name": "Poison cloud"}, {"desc": "A miasma hugging the floor: ragged sheets of gas lit yellow-green from within, fading to violet, creep out in tongues that curl over at their tips; plumes twist up as ribbons."}, {"tags": ["nature", "poison", "gas", "cloud", "miasma", "toxic", "area", "ground", "loop"]}, {"size": [256, 100]}, {"origin": [128, 86]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0e0816", "#24123a", "#3e2056", "#5a3a62", "#6a6a3a", "#96aa30", "#cce040", "#f4ffa0"]}, {"spread": 1}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SHEETS", [_S.merge([{"h": 36}, {"e": 0.84}, {"a": 0.46}, {"dim": 2}, {"flow": 4}, {"n": 2}, {"back": true}]), _S.merge([{"h": 26}, {"e": 0.96}, {"a": 0.5}, {"dim": 1}, {"flow": 8}, {"n": 2}, {"back": true}]), _S.merge([{"h": 16}, {"e": 1.04}, {"a": 0.56}, {"dim": 0}, {"flow": 8}, {"n": 3}, {"back": false}])])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_sh_b0 = _S.arg(_args,0)
	var _n_si_b1 = _S.arg(_args,1)
	var _n_E_b2 = _S.arg(_args,2)
	var _n_ph_b3 = _S.arg(_args,3)
	var _n_out_b4 = []
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b5 = _iter_0
		if true:
			var _n_i_b6 = 0
			while _S.truth((_n_i_b6 < _S.named_value(_n_sh_b0,"n"))):
				var _n_q_b7 = fmod((((_n_ph_b3 + (float(_n_i_b6)/_S.named_value(_n_sh_b0,"n"))) + (_n_si_b1 * 0.17)) + ((float(0.5)/_S.named_value(_n_sh_b0,"n")) if _S.truth((_n_s_b5 > 0)) else 0)),1)
				_S.invoke(_n_out_b4,"push",[{"s":_n_s_b5,"q":_n_q_b7,"x":((_n_s_b5 * _n_E_b2) * (0.3 + (0.82 * _n_q_b7))),"h":(_S.named_value(_n_sh_b0,"h") * (0.75 - (0.45 * _n_q_b7)))}])
				_n_i_b6 += 1.0
	return _n_out_b4
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_sh_b0 = _S.arg(_args,0)
	var _n_si_b1 = _S.arg(_args,1)
	var _n_E_b2 = _S.arg(_args,2)
	var _n_x_b3 = _S.arg(_args,3)
	var _n_ph_b4 = _S.arg(_args,4)
	var _n_T_b5 = _S.arg(_args,5)
	var _n_seed_b6 = _S.arg(_args,6)
	var _n_ax_b7 = absf(_n_x_b3)
	var _n_env_b8 = (1 - _S.MathFX.smooth(0.5,1,(float(_n_ax_b7)/(_n_E_b2 * _S.named_value(_n_sh_b0,"e")))))
	var _n_r_b9 = _S.NoiseKernels.tile_noise(((_n_ax_b7 * 0.07) - (_n_ph_b4 * _S.named_value(_n_sh_b0,"flow"))),(_n_si_b1 * 3.7),_S.named_value(_n_sh_b0,"flow"),0,(_n_seed_b6 + _n_si_b1))
	var _n_h_b10 = ((_S.named_value(_n_sh_b0,"h") * _n_env_b8) * (0.55 + (0.45 * _n_r_b9)))
	for _iter_0 in _S.array(_n_T_b5):
		var _n_g_b11 = _iter_0
		var _n_behind_b12 = (_S.named_value(_n_g_b11,"s") * (_S.named_value(_n_g_b11,"x") - _n_x_b3))
		if _S.truth(((_n_behind_b12 < (-1.5)) if _S.truth((_n_behind_b12 < (-1.5))) else (_n_behind_b12 > 30))):
			continue
		_n_h_b10 = maxf(_n_h_b10,(((_S.named_value(_n_g_b11,"h") * sqrt(maxf(0,(1 - (float(_n_behind_b12)/30))))) * _S.MathFX.smooth((-1.5),1.5,_n_behind_b12)) * (1 - _S.MathFX.smooth(0.75,1,_S.named_value(_n_g_b11,"q")))))
	return _n_h_b10
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_tongues = _S.read(_parent,"tongues")
	var _n_height = _S.read(_parent,"height")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_sh_b2 = _S.arg(_args,2)
	var _n_si_b3 = _S.arg(_args,3)
	var _n_E_b4 = _S.arg(_args,4)
	var _n_t_b5 = _S.arg(_args,5)
	var _n_seed_b6 = _S.arg(_args,6)
	var _n_ph_b7 = (float(_n_t_b5)/_n_D)
	var _n_T_b8 = _S.call_value(_n_tongues,[_n_sh_b2, _n_si_b3, _n_E_b4, _n_ph_b7])
	var _n_d_b9 = _S.named_value(_n_sh_b2,"dim")
	var _n_X_b10 = ceili((_n_E_b4 * 1.25))
	if true:
		var _n_x_b11 = (-_n_X_b10)
		while _S.truth((_n_x_b11 <= _n_X_b10)):
			var _n_H_b12 = _S.call_value(_n_height,[_n_sh_b2, _n_si_b3, _n_E_b4, (_n_x_b11 + 0.5), _n_ph_b7, _n_T_b8, _n_seed_b6])
			if _S.truth((_n_H_b12 < 0.6)):
				_n_x_b11 += 1.0
				continue
			var _n_top_b13 = (-floori(_n_H_b12+0.5))
			if true:
				var _n_y_b14 = _n_top_b13
				while _S.truth((_n_y_b14 <= 1)):
					var _n_v_b15 = clampf((float((-_n_y_b14))/_n_H_b12),0.0,1.0)
					var _n_streak_b16 = (0.7 + (0.3 * _S.NoiseKernels.tile_noise(((_n_x_b11 * 0.05) - ((_n_ph_b7 * _S.named_value(_n_sh_b2,"flow")) * signf((_n_x_b11 if _S.truth(_n_x_b11) else 1)))),(_n_y_b14 * 0.55),_S.named_value(_n_sh_b2,"flow"),0,((_n_seed_b6 + 9) + _n_si_b3))))
					var _n_lv_b17 = (_n_v_b15 - ((_n_streak_b16 - 0.7) * 0.6))
					var _n_c_b18 = (_S.index_value(_n_C_b1,maxf(1,(4 - _n_d_b9))) if _S.truth(_S.binary("===",_n_y_b14,_n_top_b13)) else (_S.index_value(_n_C_b1,(6 - _n_d_b9)) if _S.truth((_n_lv_b17 < 0.16)) else (_S.index_value(_n_C_b1,(5 - _n_d_b9)) if _S.truth((_n_lv_b17 < 0.42)) else (_S.index_value(_n_C_b1,(4 - _n_d_b9)) if _S.truth((_n_lv_b17 < 0.68)) else _S.index_value(_n_C_b1,maxf(1,(3 - _n_d_b9)))))))
					_S.invoke(_n_p_b0,"blend",[_n_x_b11, _n_y_b14, _n_c_b18, (_S.named_value(_n_sh_b2,"a") * (0.65 if _S.truth(_S.binary("===",_n_y_b14,_n_top_b13)) else ((0.6 + (0.4 * (1 - _n_v_b15))) * _n_streak_b16)))])
					_n_y_b14 += 1.0
			_n_x_b11 += 1.0
	for _iter_0 in _S.array(_n_T_b8):
		var _n_g_b19 = _iter_0
		var _n_k_b20 = sin((PI * _S.named_value(_n_g_b19,"q")))
		if _S.truth(((_n_k_b20 < 0.15) if _S.truth((_n_k_b20 < 0.15)) else (_S.named_value(_n_g_b19,"h") < 4))):
			continue
		var _n_r_b21 = (1.8 + (_S.named_value(_n_g_b19,"h") * 0.22))
		var _n_cx_b22 = (_S.named_value(_n_g_b19,"x") - ((_S.named_value(_n_g_b19,"s") * _n_r_b21) * 0.6))
		var _n_cy_b23 = ((-_S.named_value(_n_g_b19,"h")) * 0.72)
		var _n_spin_b24 = ((((-_S.named_value(_n_g_b19,"s")) * _S.named_value(_n_g_b19,"q")) * _n_TAU) * 2.2)
		if true:
			var _n_a_b25 = 0
			while _S.truth((_n_a_b25 < 4.6)):
				var _n_rr_b26 = (_n_r_b21 * (1 - (_n_a_b25 * 0.12)))
				var _n_px_b27 = (_n_cx_b22 + ((_S.named_value(_n_g_b19,"s") * cos((_n_spin_b24 + _n_a_b25))) * _n_rr_b26))
				var _n_py_b28 = (_n_cy_b23 + (sin((_n_spin_b24 + _n_a_b25)) * _n_rr_b26))
				var _n_w_b29 = (1.6 * (1 - (float(_n_a_b25)/6)))
				if true:
					var _n_o_b30 = (-_n_w_b29)
					while _S.truth((_n_o_b30 <= _n_w_b29)):
						var _n_qx_b31 = (_n_px_b27 + ((_S.named_value(_n_g_b19,"s") * cos((_n_spin_b24 + _n_a_b25))) * _n_o_b30))
						var _n_qy_b32 = (_n_py_b28 + (sin((_n_spin_b24 + _n_a_b25)) * _n_o_b30))
						_S.invoke(_n_p_b0,"blend",[_n_qx_b31, _n_qy_b32, (_S.index_value(_n_C_b1,(5 - _n_d_b9)) if _S.truth((_n_o_b30 > (_n_w_b29 * 0.4))) else _S.index_value(_n_C_b1,(4 - _n_d_b9))), (((_S.named_value(_n_sh_b2,"a") * 0.75) * _n_k_b20) * (1 - (float(_n_a_b25)/5.5)))])
						_n_o_b30 += 0.8
				_n_a_b25 += 0.1
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_E_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_seed_b4 = _S.arg(_args,4)
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, 5, _n_seed_b4, _S.function_value(_S.capture(_parent,{"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"E":_n_E_b2,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f5")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[2.4, 3.2])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_E = _S.read(_parent,"E")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float(_n_age_b0)/_n_L_b1)
	var _n_x0_b4 = (_S.invoke(_n_R_b2,"range",[(-0.55), 0.55]) * _n_E)
	var _n_rise_b5 = _S.invoke(_n_R_b2,"range",[13, 19])
	var _n_len_b6 = _S.invoke(_n_R_b2,"range",[34, 48])
	var _n_ph_b7 = _S.invoke(_n_R_b2,"range",[0, _n_TAU])
	var _n_amp_b8 = _S.invoke(_n_R_b2,"range",[3, 5])
	var _n_head_b9 = (14 + (_n_rise_b5 * _n_age_b0))
	var _n_tail_b10 = maxf(10,(_n_head_b9 - _n_len_b6))
	var _n_fade_b11 = (_S.MathFX.smooth(0,0.15,_n_u_b3) * (1 - _S.MathFX.smooth(0.5,1,_n_u_b3)))
	if true:
		var _n_h_b12 = _n_tail_b10
		while _S.truth((_n_h_b12 <= _n_head_b9)):
			var _n_s_b13 = (float((_n_h_b12 - _n_tail_b10))/maxf(1,(_n_head_b9 - _n_tail_b10)))
			var _n_tw_b14 = cos((((_n_h_b12 * 0.22) + (_n_age_b0 * 2.4)) + _n_ph_b7))
			var _n_w_b15 = (0.6 + ((2.2 * absf(_n_tw_b14)) * (1 - (_n_s_b13 * 0.5))))
			var _n_x_b16 = (_n_x0_b4 + ((_n_amp_b8 * sin((((_n_h_b12 * 0.12) + _n_age_b0) + _n_ph_b7))) * (0.4 + _n_s_b13)))
			var _n_a_b17 = ((_n_fade_b11 * sin((PI * minf(1,(_n_s_b13 * 1.2))))) * 0.32)
			if true:
				var _n_o_b18 = (-_n_w_b15)
				while _S.truth((_n_o_b18 <= _n_w_b15)):
					_S.invoke(_n_p,"blend",[(_n_x_b16 + _n_o_b18), (-_n_h_b12), ((_S.index_value(_n_C,6) if _S.truth((absf(_n_o_b18) < (_n_w_b15 * 0.5))) else _S.index_value(_n_C,5)) if _S.truth((_n_tw_b14 > 0)) else (_S.index_value(_n_C,3) if _S.truth((absf(_n_o_b18) < (_n_w_b15 * 0.5))) else _S.index_value(_n_C,2))), _n_a_b17])
					_n_o_b18 += 1
			_n_h_b12 += 0.7
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_E_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_seed_b4 = _S.arg(_args,4)
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, 30, _n_seed_b4, _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), _S.function_value(_S.capture(_parent,{"E":_n_E_b2,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f8")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[1.5, 2.6])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_E = _S.read(_parent,"E")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float(_n_age_b0)/_n_L_b1)
	var _n_s_b4 = _S.invoke(_n_R_b2,"sign",[])
	var _n_x_b5 = (_n_s_b4 * ((_S.invoke(_n_R_b2,"range",[0.05, 0.7]) * _n_E) + (_n_age_b0 * _S.invoke(_n_R_b2,"range",[6, 14]))))
	var _n_y_b6 = ((-_S.invoke(_n_R_b2,"range",[2, 20])) - (sin(((_n_age_b0 * _S.invoke(_n_R_b2,"range",[1.5, 3])) + (_S.invoke(_n_R_b2,"next",[]) * _n_TAU))) * 2))
	var _n_a_b7 = ((minf(1,(_n_u_b3 * 5)) * minf(1,((1 - _n_u_b3) * 3))) * (0.6 + (0.4 * sin(((_n_age_b0 * _S.invoke(_n_R_b2,"range",[6, 10])) + (_S.invoke(_n_R_b2,"next",[]) * _n_TAU))))))
	if _S.truth((_n_a_b7 < 0.1)):
		return null
	_S.invoke(_n_p,"dot",[_n_x_b5, _n_y_b6, (_S.index_value(_n_C,7) if _S.truth((_n_a_b7 > 0.7)) else _S.index_value(_n_C,6)), (_n_a_b7 * 1.3)])
	_S.invoke(_n_p,"glow",[_n_x_b5, _n_y_b6, 4, _S.index_value(_n_C,6), (0.3 * _n_a_b7)])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_SHEETS = _S.read(_parent,"SHEETS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_E_b4 = (96 * _S.named_value(_n_o_b2,"spread"))
	var _n_pulse_b5 = (0.85 + (0.15 * sin((float(((_n_TAU * _n_t_b1) * 2))/_n_D))))
	if true:
		var _n_x_b6 = (-_n_E_b4)
		while _S.truth((_n_x_b6 <= _n_E_b4)):
			_S.invoke(_n_p_b0,"glow",[_n_x_b6, (-3), 30, _S.index_value(_n_C_b3,5), ((0.14 * _n_pulse_b5) * (1 - (float(absf(_n_x_b6))/(_n_E_b4 * 1.3))))])
			_n_x_b6 += 22
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < 6)):
			var _n_R_b8 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),_n_i_b7,7])
			var _n_x_b9 = (((sin(((float((_n_TAU * _n_t_b1))/_n_D) + _S.invoke(_n_R_b8,"range",[0, _n_TAU]))) * _n_E_b4) * _S.invoke(_n_R_b8,"range",[0.2, 0.7])) + (_S.invoke(_n_R_b8,"range",[(-0.3), 0.3]) * _n_E_b4))
			var _n_k_b10 = (0.6 + (0.4 * sin(((float(((_n_TAU * _n_t_b1) * 3))/_n_D) + _n_i_b7))))
			_S.invoke(_n_p_b0,"glow",[_n_x_b9, (-_S.invoke(_n_R_b8,"range",[4, 10])), _S.invoke(_n_R_b8,"range",[14, 22]), _S.index_value(_n_C_b3,6), (0.2 * _n_k_b10)])
			_n_i_b7 += 1.0
	_S.invoke(_n_SHEETS,"forEach",[_S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"E":_n_E_b4,"t":_n_t_b1,"o":_n_o_b2,"this":_this}),"_f10")])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_sheet = _S.read(_parent,"sheet")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_E = _S.read(_parent,"E")
	var _n_t = _S.read(_parent,"t")
	var _n_o = _S.read(_parent,"o")
	var _n_sh_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return (_S.call_value(_n_sheet,[_n_p, _n_C, _n_sh_b0, _n_i_b1, _n_E, _n_t, _S.named_value(_n_o,"seed")]) if _S.truth(_S.named_value(_n_sh_b0,"back")) else _S.named_value(_n_sh_b0,"back"))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_plumes = _S.read(_parent,"plumes")
	var _n_SHEETS = _S.read(_parent,"SHEETS")
	var _n_specks = _S.read(_parent,"specks")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_E_b4 = (96 * _S.named_value(_n_o_b2,"spread"))
	_S.call_value(_n_plumes,[_n_p_b0, _n_C_b3, _n_E_b4, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 7) + 2)])
	_S.invoke(_n_SHEETS,"forEach",[_S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"E":_n_E_b4,"t":_n_t_b1,"o":_n_o_b2,"this":_this}),"_f12")])
	_S.call_value(_n_specks,[_n_p_b0, _n_C_b3, _n_E_b4, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 11) + 5)])
	_S.invoke(_n_p_b0,"glow",[0, (-6), (_n_E_b4 * 0.9), _S.index_value(_n_C_b3,5), 0.1])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_sheet = _S.read(_parent,"sheet")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_E = _S.read(_parent,"E")
	var _n_t = _S.read(_parent,"t")
	var _n_o = _S.read(_parent,"o")
	var _n_sh_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return (_S.call_value(_n_sheet,[_n_p, _n_C, _n_sh_b0, _n_i_b1, _n_E, _n_t, _S.named_value(_n_o,"seed")]) if _S.truth(not _S.truth(_S.named_value(_n_sh_b0,"back"))) else not _S.truth(_S.named_value(_n_sh_b0,"back")))
	return null
