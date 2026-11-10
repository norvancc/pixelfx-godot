@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/water-orb.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "bead", _S.import_value("fx/water/_lib.js", "bead"))
	_S.define(_e, "ring", _S.import_value("fx/water/_lib.js", "ring"))
	_S.define(_e, "motes", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Water orb"}, {"desc": "A sphere of water floats and wobbles: a current circles inside it, the floor shows upside down through it, it shines, light gathers on the floor under it, and drips fall and plink."}, {"tags": ["water", "orb", "sphere", "magic", "float", "ambient", "loop"]}, {"size": [100, 108]}, {"origin": [50, 100]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"radius": 19}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SY", 0.3)
	_S.define(_e, "G", 700)
	_S.define(_e, "DRIP", 1.5)
	_S.define(_e, "LET", 0.5)
	_S.define(_e, "center", _S.function_value(_e, "_f9"))
	_S.define(_e, "skin", _S.function_value(_e, "_f10"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_ph_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	return _S.invoke(_n_Array,"from",[{"length":7}, _S.function_value(_S.capture(_parent,{"ph":_n_ph_b0,"R":_n_R_b1,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ph = _S.read(_parent,"ph")
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_a_b2 = (((float(_n_i_b1)/7) * _n_TAU) + ((_n_ph * _n_TAU) * (1 if _S.truth(fmod(_n_i_b1,2)) else (-1))))
	var _n_r_b3 = ((_n_R + 5) + (fmod(_n_i_b1,3) * 3))
	var _n_tilt_b4 = ((_n_i_b1 - 3) * 0.22)
	var _n_x_b5 = (cos(_n_a_b2) * _n_r_b3)
	var _n_z_b6 = sin(_n_a_b2)
	return {"x":(_n_x_b5 * cos(_n_tilt_b4)),"y":((_n_x_b5 * sin(_n_tilt_b4)) + ((_n_z_b6 * _n_r_b3) * 0.28)),"z":_n_z_b6,"i":_n_i_b1}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_center = _S.read(_parent,"center")
	var _n_motes = _S.read(_parent,"motes")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_n_D)
	var _n_R_b5 = _S.named_value(_n_o_b2,"radius")
	var _tuple_0 = _S.call_value(_n_center,[_n_ph_b4])
	var _n_cx_b6 = _S.prop(_tuple_0,0)
	var _n_cy_b7 = _S.prop(_tuple_0,1)
	_S.invoke(_n_p_b0,"glow",[_n_cx_b6, 0, 22, _S.index_value(_n_C_b3,5), 0.32])
	_S.invoke(_n_p_b0,"shade",[(_n_cx_b6 - 9), (-2), (_n_cx_b6 + 9), 2, _S.function_value(_S.capture(_parent,{"cx":_n_cx_b6,"C":_n_C_b3,"this":_this}),"_f3")])
	for _iter_1 in _S.array(_S.call_value(_n_motes,[_n_ph_b4, _n_R_b5])):
		var _n_m_b8 = _iter_1
		if _S.truth((_S.named_value(_n_m_b8,"z") < 0)):
			_S.invoke(_n_p_b0,"px",[(_n_cx_b6 + _S.named_value(_n_m_b8,"x")), (_n_cy_b7 + _S.named_value(_n_m_b8,"y")), _S.index_value(_n_C_b3,4)])
	_S.invoke(_n_p_b0,"glow",[_n_cx_b6, _n_cy_b7, (_n_R_b5 * 3.2), _S.index_value(_n_C_b3,4), (0.3 + (0.05 * sin(((_n_ph_b4 * _n_TAU) * 2))))])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = ((float(pow((_n_x_b0 - _n_cx),2))/64) + (float(pow((_n_y_b1 * 2.5),2))/9))
	if _S.truth((_n_d_b3 > 1)):
		return null
	_S.set_prop(_n_out_b2,"c",(_n_WHITE if _S.truth((_n_d_b3 < 0.25)) else (_S.index_value(_n_C,6) if _S.truth((_n_d_b3 < 0.6)) else _S.index_value(_n_C,5))),"=")
	_S.set_prop(_n_out_b2,"a",(1.2 - _n_d_b3),"=")
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_center = _S.read(_parent,"center")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_motes = _S.read(_parent,"motes")
	var _n_DRIP = _S.read(_parent,"DRIP")
	var _n_LET = _S.read(_parent,"LET")
	var _n_G = _S.read(_parent,"G")
	var _n_bead = _S.read(_parent,"bead")
	var _n_SY = _S.read(_parent,"SY")
	var _n_ring = _S.read(_parent,"ring")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_n_D)
	var _n_R_b5 = _S.named_value(_n_o_b2,"radius")
	var _tuple_0 = _S.call_value(_n_center,[_n_ph_b4])
	var _n_cx_b6 = _S.prop(_tuple_0,0)
	var _n_cy_b7 = _S.prop(_tuple_0,1)
	var _n_T_b8 = (_n_ph_b4 * _n_TAU)
	_S.invoke(_n_p_b0,"shade",[((_n_cx_b6 - _n_R_b5) - 4), ((_n_cy_b7 - _n_R_b5) - 4), ((_n_cx_b6 + _n_R_b5) + 4), ((_n_cy_b7 + _n_R_b5) + 6), _S.function_value(_S.capture(_parent,{"cx":_n_cx_b6,"cy":_n_cy_b7,"R":_n_R_b5,"ph":_n_ph_b4,"C":_n_C_b3,"p":_n_p_b0,"this":_this}),"_f5")])
	if true:
		var _n_k_b16 = 0
		while _S.truth((_n_k_b16 < 3)):
			var _n_rr_b17 = (_n_R_b5 * (0.38 + (0.2 * _n_k_b16)))
			var _n_tilt_b18 = ((-0.5) + (_n_k_b16 * 0.35))
			var _n_spin_b19 = ((_n_T_b8 * ((-2) if _S.truth(fmod(_n_k_b16,2)) else 3)) + (_n_k_b16 * 2))
			if true:
				var _n_s_b20 = 0
				while _S.truth((_n_s_b20 < 1)):
					var _n_a_b21 = (_n_spin_b19 + (_n_s_b20 * _n_TAU))
					var _n_x_b22 = (cos(_n_a_b21) * _n_rr_b17)
					var _n_z_b23 = sin(_n_a_b21)
					var _n_y_b24 = (((_n_x_b22 * sin(_n_tilt_b18)) * 0.6) + ((_n_z_b23 * _n_rr_b17) * 0.62))
					var _n_dash_b25 = fmod(((_n_s_b20 * 3) + (_n_k_b16 * 0.3)),1)
					if _S.truth((_n_dash_b25 > 0.62)):
						_n_s_b20 += 0.012
						continue
					_S.invoke(_n_p_b0,"px",[(_n_cx_b6 + (_n_x_b22 * cos(_n_tilt_b18))), (_n_cy_b7 + _n_y_b24), ((_n_WHITE if _S.truth((_n_dash_b25 < 0.1)) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_dash_b25 < 0.4)) else _S.index_value(_n_C_b3,5))) if _S.truth((_n_z_b23 > 0)) else _S.index_value(_n_C_b3,3))])
					_n_s_b20 += 0.012
			_n_k_b16 += 1.0
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 8, _S.named_value(_n_o_b2,"seed"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f6"), _S.function_value(_S.capture(_parent,{"R":_n_R_b5,"p":_n_p_b0,"cx":_n_cx_b6,"cy":_n_cy_b7,"C":_n_C_b3,"this":_this}),"_f7")])
	_S.invoke(_n_p_b0,"arc",[_n_cx_b6, _n_cy_b7, (_n_R_b5 * 0.74), 1.8, (PI * 1.12), (PI * 1.4), _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f8")])
	_S.invoke(_n_p_b0,"px",[(_n_cx_b6 - (_n_R_b5 * 0.45)), (_n_cy_b7 - (_n_R_b5 * 0.62)), _n_WHITE])
	_S.invoke(_n_p_b0,"px",[(_n_cx_b6 + (_n_R_b5 * 0.48)), (_n_cy_b7 + (_n_R_b5 * 0.5)), _S.index_value(_n_C_b3,6)])
	_S.invoke(_n_p_b0,"px",[((_n_cx_b6 + (_n_R_b5 * 0.48)) + 1), (_n_cy_b7 + (_n_R_b5 * 0.5)), _S.index_value(_n_C_b3,5)])
	for _iter_1 in _S.array(_S.call_value(_n_motes,[_n_ph_b4, _n_R_b5])):
		var _n_m_b26 = _iter_1
		if _S.truth((_S.named_value(_n_m_b26,"z") >= 0)):
			_S.invoke(_n_p_b0,"px",[(_n_cx_b6 + _S.named_value(_n_m_b26,"x")), (_n_cy_b7 + _S.named_value(_n_m_b26,"y")), _n_WHITE])
			_S.invoke(_n_p_b0,"px",[((_n_cx_b6 + _S.named_value(_n_m_b26,"x")) - ((-1) if _S.truth(fmod(_S.named_value(_n_m_b26,"i"),2)) else 1)), (_n_cy_b7 + _S.named_value(_n_m_b26,"y")), _S.index_value(_n_C_b3,5)])
			_S.invoke(_n_p_b0,"glow",[(_n_cx_b6 + _S.named_value(_n_m_b26,"x")), (_n_cy_b7 + _S.named_value(_n_m_b26,"y")), 4, _S.index_value(_n_C_b3,5), 0.35])
	var _n_dt_b9 = (float(fmod(_n_t_b1,_n_DRIP))/_n_DRIP)
	var _n_fall_b10 = (fmod(_n_t_b1,_n_DRIP) - (_n_DRIP * _n_LET))
	var _n_y0_b11 = ((_n_cy_b7 + _n_R_b5) + 3)
	var _n_land_b12 = sqrt((float((2 * (-_n_y0_b11)))/_n_G))
	if _S.truth(((_n_dt_b9 > 0.2) if _S.truth((_n_fall_b10 < 0)) else (_n_fall_b10 < 0))):
		var _n_s_b27 = _S.MathFX.smooth(0.2,_n_LET,_n_dt_b9)
		_S.invoke(_n_p_b0,"circle",[_n_cx_b6, (((_n_cy_b7 + _n_R_b5) + 1) + (_n_s_b27 * 1.5)), (0.8 + (_n_s_b27 * 1.2)), _S.index_value(_n_C_b3,5)])
		_S.invoke(_n_p_b0,"px",[(_n_cx_b6 - 0.5), ((_n_cy_b7 + _n_R_b5) + (_n_s_b27 * 1.5)), _S.index_value(_n_C_b3,6)])
	else:
		if _S.truth(((_n_fall_b10 < _n_land_b12) if _S.truth((_n_fall_b10 >= 0)) else (_n_fall_b10 >= 0))):
			_S.call_value(_n_bead,[_n_p_b0, _n_cx_b6, (_n_y0_b11 + (((0.5 * _n_G) * _n_fall_b10) * _n_fall_b10)), 0, (_n_G * _n_fall_b10), 2, _n_C_b3])
		else:
			if _S.truth((_n_fall_b10 >= _n_land_b12)):
				var _n_since_b28 = (_n_fall_b10 - _n_land_b12)
				if _S.truth((_n_since_b28 < 0.08)):
					_S.invoke(_n_p_b0,"px",[_n_cx_b6, 0, _n_WHITE])
				_S.call_value(_n_ring,[_n_p_b0, _n_cx_b6, 0, (1.5 + (_n_since_b28 * 18)), _n_SY, (1.1 * (1 - (float(_n_since_b28)/0.4))), _n_C_b3, {"n":1,"half":1,"seed":3,"hot":(_n_since_b28 < 0.05)}])
	var _n_fx_b13 = (_n_cx_b6 + (_n_R_b5 * 0.36))
	var _n_fy_b14 = (_n_cy_b7 + (_n_R_b5 * 0.4))
	var _n_pulse_b15 = (0.8 + (0.2 * sin((_n_T_b8 * 4))))
	_S.invoke(_n_p_b0,"circle",[_n_fx_b13, _n_fy_b14, 1.6, _S.index_value(_n_C_b3,6)])
	_S.invoke(_n_p_b0,"px",[_n_fx_b13, _n_fy_b14, _n_WHITE])
	_S.invoke(_n_p_b0,"glow",[_n_fx_b13, _n_fy_b14, 9, _S.index_value(_n_C_b3,5), (0.45 * _n_pulse_b15)])
	_S.invoke(_n_p_b0,"glow",[_n_cx_b6, _n_cy_b7, (_n_R_b5 * 1.4), _S.index_value(_n_C_b3,5), 0.22])
	_S.invoke(_n_p_b0,"glow",[(_n_cx_b6 - (_n_R_b5 * 0.4)), (_n_cy_b7 - (_n_R_b5 * 0.5)), 6, _n_WHITE, 0.25])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_skin = _S.read(_parent,"skin")
	var _n_R = _S.read(_parent,"R")
	var _n_ph = _S.read(_parent,"ph")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_p = _S.read(_parent,"p")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_x_b0 - _n_cx)
	var _n_dy_b4 = (_n_y_b1 - _n_cy)
	var _n_d_b5 = _S.Bridge.hypot([_n_dx_b3, _n_dy_b4])
	var _n_a_b6 = atan2(_n_dy_b4,_n_dx_b3)
	var _n_r_b7 = _S.call_value(_n_skin,[_n_a_b6, _n_R, _n_ph])
	if _S.truth((_n_d_b5 > _n_r_b7)):
		return null
	var _n_q_b8 = (float(_n_d_b5)/_n_r_b7)
	var _n_lit_b9 = (float((float(((-_n_dx_b3) - _n_dy_b4))/sqrt(2.0)))/maxf(0.5,_n_d_b5))
	if _S.truth((_n_q_b8 > 0.9)):
		_S.set_prop(_n_out_b2,"c",(_n_WHITE if _S.truth((_n_lit_b9 > 0.35)) else (_S.index_value(_n_C,5) if _S.truth((_n_lit_b9 > (-0.2))) else _S.index_value(_n_C,3))),"=")
		return null
	var _n_gather_b10 = (maxf(0,(float((float((_n_dx_b3 + _n_dy_b4))/sqrt(2.0)))/_n_r_b7)) * _n_q_b8)
	_S.invoke(_n_p,"blend",[_n_x_b0, _n_y_b1, (_S.index_value(_n_C,4) if _S.truth((_n_gather_b10 > 0.45)) else (_S.index_value(_n_C,3) if _S.truth((_n_gather_b10 > 0.25)) else (_S.index_value(_n_C,2) if _S.truth((_n_q_b8 > 0.7)) else _S.index_value(_n_C,1)))), (0.7 if _S.truth((_n_gather_b10 > 0.25)) else (0.35 + (0.3 * _n_q_b8)))])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[1, 1.8])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_cx = _S.read(_parent,"cx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_x_b4 = ((_S.invoke(_n_r_b2,"range",[(-0.5), 0.5]) * _n_R) + (sin(((_n_age_b0 * 4) + _S.invoke(_n_r_b2,"range",[0, _n_TAU]))) * 1.5))
	var _n_y_b5 = ((_n_R * 0.6) - ((_n_k_b3 * _n_R) * 1.2))
	if _S.truth((_S.Bridge.hypot([_n_x_b4, _n_y_b5]) > (_n_R * 0.8))):
		return null
	_S.invoke(_n_p,"px",[(_n_cx + _n_x_b4), (_n_cy + _n_y_b5), (_S.index_value(_n_C,6) if _S.truth((_n_k_b3 < 0.8)) else _n_WHITE)])
	if _S.truth((_S.invoke(_n_r_b2,"next",[]) < 0.35)):
		_S.invoke(_n_p,"px",[((_n_cx + _n_x_b4) + 1), (_n_cy + _n_y_b5), _S.index_value(_n_C,5)])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return (_n_WHITE if _S.truth(((_n_v_b1 > 0.4) if _S.truth(((_n_u_b0 < 0.75) if _S.truth((_n_u_b0 > 0.25)) else (_n_u_b0 > 0.25))) else ((_n_u_b0 < 0.75) if _S.truth((_n_u_b0 > 0.25)) else (_n_u_b0 > 0.25)))) else _S.index_value(_n_C,6))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ph_b0 = _S.arg(_args,0)
	return [0, ((-52) + (sin((_n_ph_b0 * _n_TAU)) * 2))]
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_LET = _S.read(_parent,"LET")
	var _n_D = _S.read(_parent,"D")
	var _n_DRIP = _S.read(_parent,"DRIP")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	var _n_sag_b3 = (((pow(maxf(0,sin(_n_a_b0)),6) * 2.2) * _S.MathFX.smooth(0.1,_n_LET,(float(fmod((_n_ph_b2 * _n_D),_n_DRIP))/_n_DRIP))) * (1 if _S.truth(((float(fmod((_n_ph_b2 * _n_D),_n_DRIP))/_n_DRIP) < _n_LET)) else 0))
	return (((_n_R_b1 + (sin(((_n_a_b0 * 3) + ((_n_ph_b2 * _n_TAU) * 2))) * 0.6)) + (sin(((_n_a_b0 * 5) - ((_n_ph_b2 * _n_TAU) * 3))) * 0.35)) + _n_sag_b3)
	return null
