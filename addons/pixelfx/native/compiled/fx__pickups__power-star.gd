@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/power-star.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f0":"sky_power_star","_f2":"sky_power_star_back"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "star", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Power star"}, {"desc": "A fat bevelled star rocks side to side and swells on each beat, rays of light turning slowly behind it, sparks spinning off its points."}, {"tags": ["pickup", "star", "power-up", "invincible", "bonus", "loop"]}, {"size": [88, 84]}, {"origin": [44, 76]}, {"duration": 1.6}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#2a1604", "#5e3208", "#a05c0c", "#e09414", "#ffc626", "#ffe866", "#fff8c4", "#ffffff"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [44, 44]))
	_S.define(_e, "HOVER", 25)
	_S.define(_e, "RO", 11.5)
	_S.define(_e, "RI", 5.2)
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#1a0e04"]))
	_S.define(_e, "BEATS", [0.25, 0.75])
	_S.define(_e, "RAYS", 10)
	_S.define(_e, "LA", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.unary("-", 0.8), _S.unary("-", 0.6)]))
	_S.define(_e, "swell", _S.function_value(_e, "_f7"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_INK = _S.read(_parent,"INK")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_cx_b2 = _S.arg(_args,2)
	var _n_cy_b3 = _S.arg(_args,3)
	var _n_rot_b4 = _S.arg(_args,4)
	var _n_sc_b5 = _S.arg(_args,5)
	_S.invoke(_n_L,"begin",[(floori(_n_cx_b2) - 21), (floori(_n_cy_b3) - 21)])
	_S.invoke(_n_L,"fill",[(floori(_n_cx_b2) - 21), (floori(_n_cy_b3) - 21), (floori(_n_cx_b2) + 20), (floori(_n_cy_b3) + 20), _S.function_value(_S.capture(_parent,{"cx":_n_cx_b2,"sc":_n_sc_b5,"cy":_n_cy_b3,"rot":_n_rot_b4,"C":_n_C_b1,"this":_this}),"_f1")])
	_S.invoke(_S.invoke(_n_L,"outline",[_n_INK]),"draw",[_n_p_b0])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_sc = _S.read(_parent,"sc")
	var _n_cy = _S.read(_parent,"cy")
	var _n_RO = _S.read(_parent,"RO")
	var _n_rot = _S.read(_parent,"rot")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RI = _S.read(_parent,"RI")
	var _n_LA = _S.read(_parent,"LA")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (float((_n_px_b0 - _n_cx))/_n_sc)
	var _n_dy_b3 = (float((_n_py_b1 - _n_cy))/_n_sc)
	var _n_r_b4 = _S.Bridge.hypot([_n_dx_b2, _n_dy_b3])
	if _S.truth((_n_r_b4 > (_n_RO + 0.5))):
		return 0
	var _n_a_b5 = ((atan2(_n_dy_b3,_n_dx_b2) - _n_rot) + (float(PI)/2))
	_n_a_b5 = fmod((fmod(_n_a_b5,_n_TAU) + _n_TAU),_n_TAU)
	var _n_k_b6 = floori((float(_n_a_b5)/(float(PI)/5)))
	var _n_half_b7 = fmod(_n_k_b6,2)
	var _n_tip_b8 = ((floori((float(_n_k_b6)/2)) + _n_half_b7) * (float((2 * PI))/5))
	var _n_tA_b9 = ((_n_tip_b8 - (float(PI)/2)) + _n_rot)
	var _n_iA_b10 = (_n_tA_b9 + (((-1) if _S.truth(_n_half_b7) else 1) * (float(PI)/5)))
	var _n_tx_b11 = (cos(_n_tA_b9) * _n_RO)
	var _n_ty_b12 = (sin(_n_tA_b9) * _n_RO)
	var _n_ix_b13 = (cos(_n_iA_b10) * _n_RI)
	var _n_iy_b14 = (sin(_n_iA_b10) * _n_RI)
	var _n_ex_b15 = (_n_ix_b13 - _n_tx_b11)
	var _n_ey_b16 = (_n_iy_b14 - _n_ty_b12)
	var _n_side_b17 = (((_n_dx_b2 - _n_tx_b11) * _n_ey_b16) - ((_n_dy_b3 - _n_ty_b12) * _n_ex_b15))
	var _n_cside_b18 = (((-_n_tx_b11) * _n_ey_b16) + (_n_ty_b12 * _n_ex_b15))
	if _S.truth(((_n_side_b17 * _n_cside_b18) < 0)):
		return 0
	var _n_n_b19 = (_n_tA_b9 + (((-1) if _S.truth(_n_half_b7) else 1) * (float(PI)/2)))
	var _n_l_b20 = cos((_n_n_b19 - _n_LA))
	var _n_ridge_b21 = ((absf(sin((atan2(_n_dy_b3,_n_dx_b2) - _n_tA_b9))) * _n_r_b4) < 0.6)
	if _S.truth((_n_r_b4 < 1.2)):
		return _n_WHITE
	var _n_toLight_b22 = cos((_n_tA_b9 - _n_LA))
	if _S.truth(_n_ridge_b21):
		return (_n_WHITE if _S.truth((_n_toLight_b22 > 0.3)) else (_S.index_value(_n_C,6) if _S.truth((_n_toLight_b22 > (-0.4))) else _S.index_value(_n_C,5)))
	return _S.index_value(_n_C,(6 if _S.truth((_n_l_b20 > 0.6)) else (5 if _S.truth((_n_l_b20 > 0.15)) else (4 if _S.truth((_n_l_b20 > (-0.35))) else (3 if _S.truth((_n_l_b20 > (-0.75))) else 2)))))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_swell = _S.read(_parent,"swell")
	var _n_blobShadow = _S.read(_parent,"blobShadow")
	var _n_RAYS = _S.read(_parent,"RAYS")
	var _n_RO = _S.read(_parent,"RO")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_S.named_value(_n_meta,"duration"))
	var _n_y_b5 = ((-_n_HOVER) - (1.5 * sin(((_n_ph_b4 * _n_TAU) * 2))))
	var _n_sw_b6 = _S.call_value(_n_swell,[_n_ph_b4])
	_S.call_value(_n_blobShadow,[_n_p_b0, 0, (9 + (2 * _n_sw_b6)), 0.7])
	var _n_spin_b7 = (_n_ph_b4 * ((float(_n_TAU)/_n_RAYS) * 2))
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < _n_RAYS)):
			var _n_a_b9 = (_n_spin_b7 + (float((_n_i_b8 * _n_TAU))/_n_RAYS))
			var _n_len_b10 = ((22 if _S.truth(fmod(_n_i_b8,2)) else 34) * (1 + (0.18 * _n_sw_b6)))
			var _n_ca_b11 = cos(_n_a_b9)
			var _n_sa_b12 = sin(_n_a_b9)
			var _n_w_b13 = (0.06 if _S.truth(fmod(_n_i_b8,2)) else 0.09)
			_S.invoke(_n_p_b0,"shade",[((-_n_len_b10) - 2), ((_n_y_b5 - _n_len_b10) - 2), (_n_len_b10 + 2), ((_n_y_b5 + _n_len_b10) + 2), _S.function_value(_S.capture(_parent,{"y":_n_y_b5,"ca":_n_ca_b11,"sa":_n_sa_b12,"len":_n_len_b10,"w":_n_w_b13,"C":_n_C_b3,"sw":_n_sw_b6,"this":_this}),"_f3")])
			if _S.truth(_S.binary("===",fmod(_n_i_b8,2),0)):
				var _n_d0_b14 = (_n_RO + 3)
				var _n_d1_b15 = minf((_n_len_b10 * 0.88),((float(((-2) - _n_y_b5))/_n_sa_b12) if _S.truth((_n_sa_b12 > 0.05)) else INF))
				if _S.truth((_n_d1_b15 > _n_d0_b14)):
					_S.invoke(_n_p_b0,"line",[(_n_ca_b11 * _n_d0_b14), (_n_y_b5 + (_n_sa_b12 * _n_d0_b14)), (_n_ca_b11 * _n_d1_b15), (_n_y_b5 + (_n_sa_b12 * _n_d1_b15)), _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"sw":_n_sw_b6,"this":_this}),"_f5")])
			_n_i_b8 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_y = _S.read(_parent,"y")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_len = _S.read(_parent,"len")
	var _n_w = _S.read(_parent,"w")
	var _n_C = _S.read(_parent,"C")
	var _n_sw = _S.read(_parent,"sw")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_yy_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_rx_b3 = _n_x_b0
	var _n_ry_b4 = (_n_yy_b1 - _n_y)
	var _n_d_b5 = ((_n_rx_b3 * _n_ca) + (_n_ry_b4 * _n_sa))
	if _S.truth(((_n_d_b5 < 8) if _S.truth((_n_d_b5 < 8)) else (_n_d_b5 > _n_len))):
		return null
	var _n_q_b6 = absf(((_n_rx_b3 * _n_sa) - (_n_ry_b4 * _n_ca)))
	var _n_hw_b7 = (0.5 + (_n_d_b5 * _n_w))
	if _S.truth((_n_q_b6 > (_n_hw_b7 + 1.5))):
		return null
	_S.set_prop(_n_out_b2,"l",(_S.index_value(_n_C,6) if _S.truth((_n_q_b6 < (_n_hw_b7 * 0.5))) else _S.index_value(_n_C,5)),"=")
	_S.set_prop(_n_out_b2,"k",((((0.32 + (0.22 * _n_sw)) * (1 if _S.truth((_n_q_b6 < _n_hw_b7)) else (1 - (float((_n_q_b6 - _n_hw_b7))/1.5)))) * pow((1 - (float(_n_d_b5)/_n_len)),1.2)) * minf(1,(float((_n_d_b5 - 8))/4))),"=")
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 < 0.35)) else _S.index_value(_n_C,5))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_sw = _S.read(_parent,"sw")
	var _n_u_b0 = _S.arg(_args,0)
	return ((1 if _S.truth((_n_u_b0 < 0.5)) else (1.6 - (_n_u_b0 * 1.4))) * (0.75 + (0.35 * _n_sw)))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_swell = _S.read(_parent,"swell")
	var _n_RO = _S.read(_parent,"RO")
	var _n_star = _S.read(_parent,"star")
	var _n_fly = _S.read(_parent,"fly")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_glint = _S.read(_parent,"glint")
	var _n_BEATS = _S.read(_parent,"BEATS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_S.named_value(_n_meta,"duration"))
	var _n_y_b5 = ((-_n_HOVER) - (1.5 * sin(((_n_ph_b4 * _n_TAU) * 2))))
	var _n_sw_b6 = _S.call_value(_n_swell,[_n_ph_b4])
	var _n_rot_b7 = (0.22 * sin((_n_ph_b4 * _n_TAU)))
	var _n_sc_b8 = (1 + (0.13 * _n_sw_b6))
	_S.invoke(_n_p_b0,"glowRing",[0, _n_y_b5, ((_n_RO * _n_sc_b8) + 3), 13, _S.index_value(_n_C_b3,4), (0.32 + (0.25 * _n_sw_b6))])
	_S.invoke(_n_p_b0,"glow",[0, _n_y_b5, 6, _S.index_value(_n_C_b3,6), (0.12 + (0.2 * _n_sw_b6))])
	_S.call_value(_n_star,[_n_p_b0, _n_C_b3, 0, _n_y_b5, _n_rot_b7, _n_sc_b8])
	for _iter_0 in _S.array(_n_BEATS):
		var _n_b_b11 = _iter_0
		var _n_age_b12 = (fmod((fmod((_n_ph_b4 - _n_b_b11),1) + 1),1) * _S.named_value(_n_meta,"duration"))
		if _S.truth((_n_age_b12 > 0.45)):
			continue
		if true:
			var _n_i_b13 = 0
			while _S.truth((_n_i_b13 < 5)):
				var _n_a_b14 = ((_n_rot_b7 + (float((_n_i_b13 * _n_TAU))/5)) - (float(PI)/2))
				var _n_sp_b15 = (70 + (_S.MathFX.rand([_n_i_b13,(_n_b_b11 * 10),3]) * 30))
				var _n_tan_b16 = 35
				var _n_vx_b17 = ((cos(_n_a_b14) * _n_sp_b15) - (sin(_n_a_b14) * _n_tan_b16))
				var _n_vy_b18 = ((sin(_n_a_b14) * _n_sp_b15) + (cos(_n_a_b14) * _n_tan_b16))
				var _tuple_1 = _S.call_value(_n_fly,[((cos(_n_a_b14) * _n_RO) * _n_sc_b8), (_n_y_b5 + ((sin(_n_a_b14) * _n_RO) * _n_sc_b8)), _n_vx_b17, _n_vy_b18, _n_age_b12, 60, 4])
				var _n_x_b19 = _S.prop(_tuple_1,0)
				var _n_yy_b20 = _S.prop(_tuple_1,1)
				var _n_k_b21 = (1 - (float(_n_age_b12)/0.45))
				_S.call_value(_n_glint,[_n_p_b0, _n_x_b19, _n_yy_b20, floori((2 * _n_k_b21)+0.5), (_n_WHITE if _S.truth((_n_k_b21 > 0.5)) else _S.index_value(_n_C_b3,6)), (0.45 * _n_k_b21)])
				_n_i_b13 += 1.0
	var _n_f_b9 = floori((_n_ph_b4 * 24))
	if true:
		var _n_i_b22 = 0
		while _S.truth((_n_i_b22 < 18)):
			if _S.truth((_S.MathFX.rand([(_n_f_b9 + (_n_i_b22 * 3)),_n_i_b22,_S.named_value(_n_o_b2,"seed")]) > 0.32)):
				_n_i_b22 += 1.0
				continue
			var _n_a_b23 = (_S.MathFX.rand([_n_i_b22,1,_S.named_value(_n_o_b2,"seed")]) * _n_TAU)
			var _n_d_b24 = (13 + (_S.MathFX.rand([_n_i_b22,2,_S.named_value(_n_o_b2,"seed")]) * 20))
			var _n_sy_b25 = (_n_y_b5 + ((sin(_n_a_b23) * _n_d_b24) * 0.85))
			if _S.truth((_n_sy_b25 < (-2))):
				_S.invoke(_n_p_b0,"px",[(cos(_n_a_b23) * _n_d_b24), _n_sy_b25, (_n_WHITE if _S.truth((_S.MathFX.rand([_n_f_b9,_n_i_b22,5]) < 0.5)) else _S.index_value(_n_C_b3,6))])
			_n_i_b22 += 1.0
	if true:
		var _n_i_b26 = 0
		while _S.truth((_n_i_b26 < 4)):
			var _n_life_b27 = 0.3
			var _n_age_b28 = fmod((fmod((_n_t_b1 - ((float((_n_i_b26 + 0.3))/4) * _S.named_value(_n_meta,"duration"))),_S.named_value(_n_meta,"duration")) + _S.named_value(_n_meta,"duration")),_S.named_value(_n_meta,"duration"))
			if _S.truth((_n_age_b28 > _n_life_b27)):
				_n_i_b26 += 1.0
				continue
			var _n_a_b29 = (_S.MathFX.rand([_n_i_b26,7,_S.named_value(_n_o_b2,"seed")]) * _n_TAU)
			var _n_d_b30 = (15 + (_S.MathFX.rand([_n_i_b26,8,_S.named_value(_n_o_b2,"seed")]) * 12))
			var _n_k_b31 = sin(((float(_n_age_b28)/_n_life_b27) * PI))
			_S.call_value(_n_glint,[_n_p_b0, (cos(_n_a_b29) * _n_d_b30), (_n_y_b5 + ((sin(_n_a_b29) * _n_d_b30) * 0.85)), floori((2.5 * _n_k_b31)+0.5), (_S.index_value(_n_C_b3,6) if _S.truth(fmod(_n_i_b26,2)) else _n_WHITE), (0.4 * _n_k_b31)])
			_n_i_b26 += 1.0
	var _n_g_b10 = (float(fmod((_n_ph_b4 + 0.1),0.5))/0.5)
	if _S.truth((_n_g_b10 < 0.14)):
		_S.call_value(_n_glint,[_n_p_b0, ((-2) + (_n_rot_b7 * 4)), (_n_y_b5 - 6), (3 * sin(((float(_n_g_b10)/0.14) * PI))), _n_WHITE, 0.5])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_BEATS = _S.read(_parent,"BEATS")
	var _n_ph_b0 = _S.arg(_args,0)
	var _n_s_b1 = 0
	for _iter_0 in _S.array(_n_BEATS):
		var _n_b_b2 = _iter_0
		var _n_u_b3 = fmod((fmod((_n_ph_b0 - _n_b_b2),1) + 1),1)
		_n_s_b1 += (exp(((-_n_u_b3) * 14)) * (1 if _S.truth(((1 - (_n_u_b3 * 2.5)) > 0)) else 0))
	return _n_s_b1
	return null
