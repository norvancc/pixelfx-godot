@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/ice-lance.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "blade", _S.import_value("fx/ice/_lib.js", "blade"))
	_S.define(_e, "spear", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Ice lance"}, {"desc": "A faceted ice spear flying right: a light pulse runs through its core, rings of cold air shear off the tip, frost peels off into a wake and crystals shed behind it."}, {"tags": ["ice", "lance", "spear", "projectile", "directional", "magic", "loop"]}, {"size": [176, 64]}, {"origin": [146, 32]}, {"duration": 0.8}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"length": 40}, {"seed": 13}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_L_b2 = _S.arg(_args,2)
	var _n_pulse_b3 = _S.arg(_args,3)
	var _n_glint_b4 = _S.arg(_args,4)
	var _n_T_b5 = 16
	var _n_H_b6 = 3.5
	var _n_half_b7 = _S.function_value(_S.capture(_parent,{"T":_n_T_b5,"H":_n_H_b6,"L":_n_L_b2,"this":_this}),"_f1")
	_S.invoke(_n_p_b0,"shade",[((-_n_L_b2) - 1), ((-_n_H_b6) - 2), 1, (_n_H_b6 + 2), _S.function_value(_S.capture(_parent,{"L":_n_L_b2,"half":_n_half_b7,"C":_n_C_b1,"pulse":_n_pulse_b3,"glint":_n_glint_b4,"this":_this}),"_f2")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_T = _S.read(_parent,"T")
	var _n_L = _S.read(_parent,"L")
	var _n_x_b0 = _S.arg(_args,0)
	return (((_n_H * (float((-_n_x_b0))/_n_T)) + 0.3) if _S.truth((_n_x_b0 > (-_n_T))) else ((_n_H * (0.7 + (0.3 * (float((_n_x_b0 + _n_L))/3)))) if _S.truth((_n_x_b0 < ((-_n_L) + 3))) else _n_H))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_half = _S.read(_parent,"half")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_pulse = _S.read(_parent,"pulse")
	var _n_glint = _S.read(_parent,"glint")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	if _S.truth(((_n_x_b0 > 0) if _S.truth((_n_x_b0 > 0)) else (_n_x_b0 < (-_n_L)))):
		return null
	var _n_h_b3 = _S.call_value(_n_half,[_n_x_b0])
	if _S.truth((absf(_n_y_b1) > (_n_h_b3 + 0.5))):
		if _S.truth((absf(_n_y_b1) < (_n_h_b3 + 1.5))):
			_S.set_prop(_n_o_b2,"c",_S.index_value(_n_C,1),"=")
		return null
	var _n_v_b4 = (float(_n_y_b1)/maxf(0.5,_n_h_b3))
	if _S.truth((_n_x_b0 > (-1.5))):
		return _S.set_prop(_n_o_b2,"c",_n_WHITE,"=")
	if _S.truth(((absf((_n_x_b0 - _n_pulse)) < 2.5) if _S.truth(((_n_v_b4 < 0.35) if _S.truth((_n_v_b4 > (-0.3))) else (_n_v_b4 > (-0.3)))) else ((_n_v_b4 < 0.35) if _S.truth((_n_v_b4 > (-0.3))) else (_n_v_b4 > (-0.3))))):
		return _S.set_prop(_n_o_b2,"c",_n_WHITE,"=")
	if _S.truth(((absf((_n_x_b0 - _n_glint)) < 1) if _S.truth((_n_v_b4 < (-0.3))) else (_n_v_b4 < (-0.3)))):
		return _S.set_prop(_n_o_b2,"c",_n_WHITE,"=")
	_S.set_prop(_n_o_b2,"c",(_n_WHITE if _S.truth((_n_v_b4 < (-0.72))) else (_S.index_value(_n_C,6) if _S.truth((_n_v_b4 < (-0.36))) else (_S.index_value(_n_C,7) if _S.truth((_n_v_b4 < (-0.18))) else (_S.index_value(_n_C,4) if _S.truth((_n_v_b4 < 0.38)) else (_S.index_value(_n_C,2) if _S.truth((_n_v_b4 < 0.78)) else _S.index_value(_n_C,1)))))),"=")
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_blade = _S.read(_parent,"blade")
	var _n_spear = _S.read(_parent,"spear")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_D_b4 = _S.named_value(_n_meta,"duration")
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_L_b6 = _S.prop(_n_o_b2,"length")
	var _n_ph_b7 = (float(_n_t_b1)/_n_D_b4)
	_S.invoke(_n_p_b0,"each",[((-_n_L_b6) - 100), (-12), ((-_n_L_b6) + 4), 12, _S.function_value(_S.capture(_parent,{"L":_n_L_b6,"ph":_n_ph_b7,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f4")])
	_S.invoke(_n_p_b0,"glowLine",[((-_n_L_b6) - 60), 0, 0, 0, 14, _S.index_value(_n_C_b3,4), 0.22])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D_b4, 14, _n_S_b5, _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"L":_n_L_b6,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f6")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D_b4, 9, (_n_S_b5 + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f8"), _S.function_value(_S.capture(_parent,{"L":_n_L_b6,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f9")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D_b4, 12, (_n_S_b5 + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f10"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f11")])
	if true:
		var _n_i_b10 = 0
		while _S.truth((_n_i_b10 < 3)):
			var _n_q_b11 = fmod(((_n_ph_b7 * 3) + (float(_n_i_b10)/3)),1)
			var _n_x_b12 = ((-4) - (_n_q_b11 * (_n_L_b6 + 20)))
			var _n_ry_b13 = (4.5 + (_n_q_b11 * 8))
			var _n_rx_b14 = (1.2 + (_n_q_b11 * 2.6))
			if _S.truth((_n_q_b11 > 0.8)):
				_n_i_b10 += 1.0
				continue
			if true:
				var _n_k_b15 = 0
				while _S.truth((_n_k_b15 < 40)):
					var _n_an_b16 = ((float(_n_k_b15)/40) * _n_TAU)
					var _n_px_b17 = (_n_x_b12 + (cos(_n_an_b16) * _n_rx_b14))
					var _n_py_b18 = (sin(_n_an_b16) * _n_ry_b13)
					if _S.truth(_S.logical("&&",(absf(_n_py_b18) < 4.6),func():return (_n_px_b17 > ((-_n_L_b6) - 2)))):
						_n_k_b15 += 1.0
						continue
					_S.invoke(_n_p_b0,"px",[_n_px_b17, _n_py_b18, ((_n_WHITE if _S.truth((_n_q_b11 < 0.35)) else _S.index_value(_n_C_b3,6)) if _S.truth((cos(_n_an_b16) > 0)) else (_S.index_value(_n_C_b3,5) if _S.truth((_n_q_b11 < 0.4)) else _S.index_value(_n_C_b3,4)))])
					_n_k_b15 += 1.0
			_S.invoke(_n_p_b0,"glowRing",[_n_x_b12, 0, (_n_ry_b13 * 0.75), 3, _S.index_value(_n_C_b3,5), (0.14 * (1 - _n_q_b11))])
			_n_i_b10 += 1.0
	for _iter_0 in _S.array([[(-1), 10, 4], [1, 9, 4], [(-0.2), 6, 3]]):
		var _tuple_1 = _iter_0
		var _n_dy_b19 = _S.prop(_tuple_1,0)
		var _n_l_b20 = _S.prop(_tuple_1,1)
		var _n_w_b21 = _S.prop(_tuple_1,2)
		_S.call_value(_n_blade,[_n_p_b0, ((-_n_L_b6) + 3), (_n_dy_b19 * 1.5), (((-_n_L_b6) + 3) - _n_l_b20), (_n_dy_b19 * (2 + (_n_l_b20 * 0.5))), _n_w_b21, _n_C_b3])
	var _n_pulse_b8 = ((-_n_L_b6) + (fmod((_n_ph_b7 * 2),1) * (_n_L_b6 + 6)))
	var _n_glint_b9 = (((-fmod(((_n_ph_b7 * 2) + 0.5),1)) * _n_L_b6) * 1.2)
	_S.call_value(_n_spear,[_n_p_b0, _n_C_b3, _n_L_b6, _n_pulse_b8, _n_glint_b9])
	_S.invoke(_n_p_b0,"glowLine",[(-_n_L_b6), 0, 0, 0, 10, _S.index_value(_n_C_b3,4), 0.1])
	_S.invoke(_n_p_b0,"glow",[_n_pulse_b8, 0, 8, _S.index_value(_n_C_b3,6), 0.3])
	_S.invoke(_n_p_b0,"glow",[0, 0, 8, _n_WHITE, 0.4])
	_S.invoke(_n_p_b0,"glow",[((-_n_L_b6) * 0.4), 0, 30, _S.index_value(_n_C_b3,3), 0.16])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_ph = _S.read(_parent,"ph")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_sx_b2 = _S.arg(_args,2)
	var _n_sy_b3 = _S.arg(_args,3)
	var _n_u_b4 = (float((((-_n_L) + 4) - _n_x_b0))/104)
	var _n_w_b5 = (((4.5 * pow((1 - _n_u_b4),0.7)) + 0.5) + ((1.5 * sin(((_n_u_b4 * 9) - ((_n_ph * _n_TAU) * 2)))) * _n_u_b4))
	var _n_v_b6 = (float(absf(_n_y_b1))/_n_w_b5)
	if _S.truth((_n_v_b6 >= 1)):
		return null
	var _n_a_b7 = ((1 - (_n_v_b6 * _n_v_b6)) * pow((1 - _n_u_b4),1.4))
	if _S.truth((_n_a_b7 < 0.04)):
		return null
	_S.invoke(_n_p,"blendPx",[_n_sx_b2, _n_sy_b3, (_S.index_value(_n_C,6) if _S.truth(((_n_u_b4 < 0.4) if _S.truth((_n_v_b6 < 0.25)) else (_n_v_b6 < 0.25))) else (_S.index_value(_n_C,5) if _S.truth((_n_v_b6 < 0.6)) else _S.index_value(_n_C,4))), (_n_a_b7 * 0.7)])
	if _S.truth((_n_a_b7 > 0.3)):
		_S.invoke(_n_p,"add",[_n_sx_b2, _n_sy_b3, _S.index_value(_n_C,5), (0.12 * _n_a_b7)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.35, 0.55])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_fly = _S.read(_parent,"fly")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_this = _S.read(_parent,"this")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_x0_b3 = _S.invoke(_n_r_b2,"range",[((-_n_L) + 2), (-8)])
	var _tuple_0 = _S.call_value(_n_fly,[_n_x0_b3, _S.invoke(_n_r_b2,"range",[(-2.5), 2.5]), (-_S.invoke(_n_r_b2,"range",[150, 230])), (_S.invoke(_n_r_b2,"sign",[]) * _S.invoke(_n_r_b2,"range",[8, 30])), _n_age_b0, 0, 2.2])
	var _n_x_b4 = _S.prop(_tuple_0,0)
	var _n_y_b5 = _S.prop(_tuple_0,1)
	var _n_k_b6 = (float(_n_age_b0)/_n_life_b1)
	var _n_rad_b7 = (1.2 + (5.5 * _n_k_b6))
	var _n_a_b8 = (0.5 * pow((1 - _n_k_b6),1.3))
	_S.invoke(_n_p,"disc",[_n_x_b4, _n_y_b5, _n_rad_b7, (_S.index_value(_n_C,6) if _S.truth((_n_k_b6 < 0.3)) else _S.index_value(_n_C,5)), _S.function_value(_S.capture(_parent,{"a":_n_a_b8,"this":_n_this}),"_f7")])
	_S.invoke(_n_p,"glow",[_n_x_b4, _n_y_b5, (_n_rad_b7 * 1.6), _S.index_value(_n_C,4), (0.1 * (1 - _n_k_b6))])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_a * (1 - (_n_d_b0 * _n_d_b0)))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.4, 0.6])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_fly = _S.read(_parent,"fly")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _tuple_0 = _S.call_value(_n_fly,[_S.invoke(_n_r_b2,"range",[(-_n_L), (-6)]), _S.invoke(_n_r_b2,"range",[(-3), 3]), (-_S.invoke(_n_r_b2,"range",[170, 260])), _S.invoke(_n_r_b2,"range",[(-35), 35]), _n_age_b0, 60, 1.2])
	var _n_x_b3 = _S.prop(_tuple_0,0)
	var _n_y_b4 = _S.prop(_tuple_0,1)
	var _n_k_b5 = (float(_n_age_b0)/_n_life_b1)
	var _n_a_b6 = (_S.invoke(_n_r_b2,"range",[0, _n_TAU]) + ((_n_age_b0 * _S.invoke(_n_r_b2,"range",[10, 18])) * _S.invoke(_n_r_b2,"sign",[])))
	var _n_l_b7 = _S.invoke(_n_r_b2,"range",[1.2, 2.2])
	var _n_ca_b8 = cos(_n_a_b6)
	var _n_sa_b9 = sin(_n_a_b6)
	if _S.truth(((fmod((_n_age_b0 * 30),2) < 1) if _S.truth((_n_k_b5 > 0.85)) else (_n_k_b5 > 0.85))):
		return null
	_S.invoke(_n_p,"line",[(_n_x_b3 - (_n_ca_b8 * _n_l_b7)), (_n_y_b4 - (_n_sa_b9 * _n_l_b7)), (_n_x_b3 + (_n_ca_b8 * _n_l_b7)), (_n_y_b4 + (_n_sa_b9 * _n_l_b7)), _S.index_value(_n_C,5)])
	_S.invoke(_n_p,"px",[(_n_x_b3 + (_n_ca_b8 * _n_l_b7)), (_n_y_b4 + (_n_sa_b9 * _n_l_b7)), _n_WHITE])
	if _S.truth((cos((_n_a_b6 * 2)) > 0.9)):
		for _iter_1 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
			var _tuple_2 = _iter_1
			var _n_dx_b10 = _S.prop(_tuple_2,0)
			var _n_dy_b11 = _S.prop(_tuple_2,1)
			_S.invoke(_n_p,"px",[(_n_x_b3 + _n_dx_b10), (_n_y_b4 + _n_dy_b11), _S.index_value(_n_C,6)])
		_S.invoke(_n_p,"glow",[_n_x_b3, _n_y_b4, 6, _S.index_value(_n_C,5), 0.45])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.16, 0.26])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_y_b3 = (_S.invoke(_n_r_b2,"sign",[]) * _S.invoke(_n_r_b2,"range",[4, 13]))
	var _n_x_b4 = (_S.invoke(_n_r_b2,"range",[(-20), 0]) - (_n_age_b0 * _S.invoke(_n_r_b2,"range",[280, 380])))
	var _n_l_b5 = _S.invoke(_n_r_b2,"range",[6, 16])
	var _n_k_b6 = (float(_n_age_b0)/_n_life_b1)
	_S.invoke(_n_p,"line",[_n_x_b4, _n_y_b3, (_n_x_b4 + _n_l_b5), _n_y_b3, _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f12"), _S.function_value(_S.capture(_parent,{"k":_n_k_b6,"this":_n_this}),"_f13")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 > 0.7)) else _S.index_value(_n_C,4))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_k = _S.read(_parent,"k")
	var _n_u_b0 = _S.arg(_args,0)
	return ((_n_u_b0 * (1 - _n_k)) * 1.4)
	return null
