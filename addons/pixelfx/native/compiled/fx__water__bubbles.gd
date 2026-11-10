@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/bubbles.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "rock", _S.import_value("fx/water/_lib.js", "rock"))
	_S.define(_e, "bubble", _S.function_value(_e, "_f0"))
	_S.define(_e, "each", _S.function_value(_e, "_f2"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Bubbles"}, {"desc": "Bubbles stream up from a vent of pebbles, wobbling and swelling as they rise, flare as they cross shafts of light from the surface, then dome up and pop there."}, {"tags": ["water", "bubbles", "underwater", "vent", "ambient", "loop"]}, {"size": [104, 112]}, {"origin": [52, 104]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "TOP", _S.unary("-", 92))
	_S.define(_e, "HALF", 48)
	_S.define(_e, "surfaceY", _S.function_value(_e, "_f10"))
	_S.define(_e, "shaft", _S.function_value(_e, "_f11"))
	_S.define(_e, "MOUTHS", [_S.unary("-", 5), 1, 6])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_r_b4 = _S.arg(_args,4)
	var _n_q_b5 = _S.arg(_args,5)
	var _n_lit_b6 = _S.arg(_args,6)
	if _S.truth((_n_r_b4 < 0.9)):
		return _S.invoke(_n_p_b0,"px",[_n_x_b2, _n_y_b3, (_n_WHITE if _S.truth((_n_lit_b6 > 0.3)) else (_S.index_value(_n_C_b1,5) if _S.truth((_n_r_b4 < 0.7)) else _S.index_value(_n_C_b1,6)))])
	if _S.truth((_n_r_b4 < 1.5)):
		var _n_X_b9 = floori(_n_x_b2)
		var _n_Y_b10 = floori(_n_y_b3)
		_S.invoke(_n_p_b0,"px",[_n_X_b9, _n_Y_b10, _n_WHITE])
		_S.invoke(_n_p_b0,"px",[(_n_X_b9 + 1), _n_Y_b10, _S.index_value(_n_C_b1,6)])
		_S.invoke(_n_p_b0,"px",[_n_X_b9, (_n_Y_b10 + 1), _S.index_value(_n_C_b1,5)])
		_S.invoke(_n_p_b0,"px",[(_n_X_b9 + 1), (_n_Y_b10 + 1), _S.index_value(_n_C_b1,4)])
		_S.invoke(_n_p_b0,"glow",[(_n_x_b2 + 0.5), (_n_y_b3 + 0.5), 3, _S.index_value(_n_C_b1,5), (0.12 + (0.2 * _n_lit_b6))])
		return null
	var _n_rx_b7 = (_n_r_b4 * (1 + _n_q_b5))
	var _n_ry_b8 = (_n_r_b4 * (1 - _n_q_b5))
	_S.invoke(_n_p_b0,"shade",[((_n_x_b2 - _n_rx_b7) - 1), ((_n_y_b3 - _n_ry_b8) - 1), ((_n_x_b2 + _n_rx_b7) + 1), ((_n_y_b3 + _n_ry_b8) + 1), _S.function_value(_S.capture(_parent,{"x":_n_x_b2,"rx":_n_rx_b7,"y":_n_y_b3,"ry":_n_ry_b8,"r":_n_r_b4,"C":_n_C_b1,"p":_n_p_b0,"lit":_n_lit_b6,"this":_this}),"_f1")])
	_S.invoke(_n_p_b0,"px",[floori((_n_x_b2 - (_n_rx_b7 * 0.45))+0.5), floori((_n_y_b3 - (_n_ry_b8 * 0.45))+0.5), _n_WHITE])
	if _S.truth((_n_r_b4 >= 2.5)):
		_S.invoke(_n_p_b0,"px",[(floori((_n_x_b2 - (_n_rx_b7 * 0.45))+0.5) + 1), floori((_n_y_b3 - (_n_ry_b8 * 0.45))+0.5), _S.index_value(_n_C_b1,6)])
	if _S.truth((_n_r_b4 >= 2)):
		_S.invoke(_n_p_b0,"px",[floori((_n_x_b2 + (_n_rx_b7 * 0.5))+0.5), floori((_n_y_b3 + (_n_ry_b8 * 0.5))+0.5), _S.index_value(_n_C_b1,6)])
	_S.invoke(_n_p_b0,"glow",[_n_x_b2, _n_y_b3, ((_n_r_b4 * 2.4) + 2), _S.index_value(_n_C_b1,5), (0.12 + (0.3 * _n_lit_b6))])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_rx = _S.read(_parent,"rx")
	var _n_y = _S.read(_parent,"y")
	var _n_ry = _S.read(_parent,"ry")
	var _n_r = _S.read(_parent,"r")
	var _n_C = _S.read(_parent,"C")
	var _n_p = _S.read(_parent,"p")
	var _n_lit = _S.read(_parent,"lit")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (float((_n_px_b0 - _n_x))/_n_rx)
	var _n_dy_b4 = (float((_n_py_b1 - _n_y))/_n_ry)
	var _n_d_b5 = (_S.Bridge.hypot([_n_dx_b3, _n_dy_b4]) * _n_r)
	if _S.truth((_n_d_b5 > (_n_r + 0.5))):
		return null
	var _n_l_b6 = (float((float(((-_n_dx_b3) - _n_dy_b4))/sqrt(2.0)))/maxf(0.01,(float(_n_d_b5)/_n_r)))
	if _S.truth((_n_d_b5 > (_n_r - 0.6))):
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,6) if _S.truth((_n_l_b6 > 0.45)) else (_S.index_value(_n_C,3) if _S.truth((_n_l_b6 < (-0.55))) else _S.index_value(_n_C,4))),"=")
	else:
		_S.invoke(_n_p,"blend",[_n_px_b0, _n_py_b1, _S.index_value(_n_C,5), (0.16 + (0.2 * _n_lit))])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_S_b1 = _S.arg(_args,1)
	var _n_fn_b2 = _S.arg(_args,2)
	_S.call_value(_n_cycle,[_n_t_b0, _n_D, 46, _n_S_b1, _S.function_value(_S.capture(_parent,{"this":_this}),"_f3"), _S.function_value(_S.capture(_parent,{"fn":_n_fn_b2,"this":_this}),"_f4")])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[2.2, 3.4])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_MOUTHS = _S.read(_parent,"MOUTHS")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_fn = _S.read(_parent,"fn")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_m_b4 = _S.index_value(_n_MOUTHS,fmod(_n_i_b3,3))
	var _n_r0_b5 = (_S.invoke(_n_r_b2,"range",[0.5, 1.4]) if _S.truth((_S.invoke(_n_r_b2,"next",[]) < 0.7)) else _S.invoke(_n_r_b2,"range",[1.6, 2.6]))
	var _n_vy_b6 = ((30 + (9 * _n_r0_b5)) + _S.invoke(_n_r_b2,"range",[(-4), 4]))
	var _n_wf_b7 = _S.invoke(_n_r_b2,"range",[3, 6])
	var _n_wa_b8 = (0.8 + (_n_r0_b5 * 1.2))
	var _n_ph0_b9 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_drift_b10 = _S.invoke(_n_r_b2,"range",[(-4), 4])
	var _n_y_b11 = ((-2) - (_n_vy_b6 * _n_age_b0))
	var _n_k_b12 = clampf((float((-_n_y_b11))/(-_n_TOP)),0.0,1.0)
	var _n_x_b13 = ((_n_m_b4 + (_n_drift_b10 * _n_k_b12)) + ((sin(((_n_age_b0 * _n_wf_b7) + _n_ph0_b9)) * _n_wa_b8) * _n_k_b12))
	_S.call_value(_n_fn,[{"x":_n_x_b13,"y":_n_y_b11,"r":(_n_r0_b5 * (1 + (0.45 * _n_k_b12))),"q":((0.12 * sin((((_n_age_b0 * _n_wf_b7) * 2) + _n_ph0_b9))) * minf(1,(float(_n_r0_b5)/2))),"i":_n_i_b3,"age":_n_age_b0,"vy":_n_vy_b6}])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_HALF = _S.read(_parent,"HALF")
	var _n_surfaceY = _S.read(_parent,"surfaceY")
	var _n_shaft = _S.read(_parent,"shaft")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_rock = _S.read(_parent,"rock")
	var _n_MOUTHS = _S.read(_parent,"MOUTHS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_n_D)
	if true:
		var _n_Y_b6 = (_n_TOP - 2)
		while _S.truth((_n_Y_b6 < 0)):
			if true:
				var _n_X_b7 = (-_n_HALF)
				while _S.truth((_n_X_b7 < _n_HALF)):
					var _n_x_b8 = (_n_X_b7 + 0.5)
					var _n_y_b9 = (_n_Y_b6 + 0.5)
					var _n_sy_b10 = _S.call_value(_n_surfaceY,[_n_x_b8, _n_ph_b4])
					if _S.truth((_n_y_b9 < _n_sy_b10)):
						_n_X_b7 += 1.0
						continue
					var _n_e_b11 = (1 - _S.MathFX.smooth((_n_HALF - 14),_n_HALF,absf(_n_x_b8)))
					var _n_depth_b12 = (float((_n_y_b9 - _n_TOP))/(-_n_TOP))
					_S.invoke(_n_p_b0,"blend",[_n_x_b8, _n_y_b9, _S.index_value(_n_C_b3,1), ((0.22 + (0.22 * _n_depth_b12)) * _n_e_b11)])
					var _n_s_b13 = ((_S.call_value(_n_shaft,[_n_x_b8, _n_y_b9, _n_ph_b4]) * (1 - (_n_depth_b12 * 0.7))) * _n_e_b11)
					if _S.truth((_n_s_b13 > 0.05)):
						_S.invoke(_n_p_b0,"light",[_n_x_b8, _n_y_b9, _S.index_value(_n_C_b3,4), (0.2 * _n_s_b13)])
					_n_X_b7 += 1.0
			_n_Y_b6 += 1.0
	if true:
		var _n_X_b14 = (-_n_HALF)
		while _S.truth((_n_X_b14 < _n_HALF)):
			var _n_x_b15 = (_n_X_b14 + 0.5)
			var _n_e_b16 = (1 - _S.MathFX.smooth((_n_HALF - 14),_n_HALF,absf(_n_x_b15)))
			var _n_s_b17 = _S.call_value(_n_shaft,[_n_x_b15, (-2), _n_ph_b4])
			var _n_c_b18 = maxf(0,(1 - (absf(sin(((_n_x_b15 * 0.42) + (sin(((_n_x_b15 * 0.11) + ((_n_ph_b4 * _n_TAU) * 2))) * 2.2)))) * 2.4)))
			if _S.truth((((_n_s_b17 * _n_c_b18) * _n_e_b16) > 0.05)):
				_S.invoke(_n_p_b0,"light",[_n_x_b15, (-1), _S.index_value(_n_C_b3,5), (((0.5 * _n_s_b17) * _n_c_b18) * _n_e_b16)])
				_S.invoke(_n_p_b0,"light",[_n_x_b15, (-2), _S.index_value(_n_C_b3,4), (((0.25 * _n_s_b17) * _n_c_b18) * _n_e_b16)])
				_S.invoke(_n_p_b0,"light",[_n_x_b15, 0, _S.index_value(_n_C_b3,4), (((0.3 * _n_s_b17) * _n_c_b18) * _n_e_b16)])
			_n_X_b14 += 1.0
	var _n_ST_b5 = _S.call_value(_n_rock,[])
	for _iter_0 in _S.array([[(-9), (-1.5), 2.4], [(-4), (-1), 1.8], [3.5, (-1.2), 2.2], [9, (-1.4), 2.6], [0, (-0.6), 1.4], [(-12.5), (-0.8), 1.6]]):
		var _tuple_1 = _iter_0
		var _n_x_b19 = _S.prop(_tuple_1,0)
		var _n_y_b20 = _S.prop(_tuple_1,1)
		var _n_rr_b21 = _S.prop(_tuple_1,2)
		_S.invoke(_n_p_b0,"shade",[((_n_x_b19 - _n_rr_b21) - 1), ((_n_y_b20 - _n_rr_b21) - 1), ((_n_x_b19 + _n_rr_b21) + 1), ((_n_y_b20 + _n_rr_b21) + 1), _S.function_value(_S.capture(_parent,{"x":_n_x_b19,"y":_n_y_b20,"rr":_n_rr_b21,"ST":_n_ST_b5,"this":_this}),"_f6")])
	for _iter_2 in _S.array(_n_MOUTHS):
		var _n_m_b22 = _iter_2
		_S.invoke(_n_p_b0,"px",[_n_m_b22, (-1), _S.index_value(_n_ST_b5,0)])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_rr = _S.read(_parent,"rr")
	var _n_ST = _S.read(_parent,"ST")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_px_b0 - _n_x)
	var _n_dy_b4 = (_n_py_b1 - _n_y)
	var _n_d_b5 = _S.Bridge.hypot([(_n_dx_b3 * 1.1), _n_dy_b4])
	if _S.truth(((_n_d_b5 > (_n_rr + 0.7)) if _S.truth((_n_d_b5 > (_n_rr + 0.7))) else (_n_py_b1 > 0))):
		return null
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_ST,0) if _S.truth((_n_d_b5 > _n_rr)) else (_S.index_value(_n_ST,5) if _S.truth(((_n_dx_b3 + _n_dy_b4) < ((-_n_rr) * 0.6))) else (_S.index_value(_n_ST,3) if _S.truth(((_n_dx_b3 + _n_dy_b4) < (_n_rr * 0.3))) else _S.index_value(_n_ST,2)))),"=")
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_each = _S.read(_parent,"each")
	var _n_HALF = _S.read(_parent,"HALF")
	var _n_surfaceY = _S.read(_parent,"surfaceY")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_n_D)
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 26, (_n_S_b5 + 7), _n_D, _S.function_value(_S.capture(_parent,{"ph":_n_ph_b4,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f8")])
	_S.call_value(_n_each,[_n_t_b1, _n_S_b5, _S.function_value(_S.capture(_parent,{"ph":_n_ph_b4,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f9")])
	if true:
		var _n_X_b6 = (-_n_HALF)
		while _S.truth((_n_X_b6 < _n_HALF)):
			var _n_x_b7 = (_n_X_b6 + 0.5)
			var _n_y_b8 = _S.call_value(_n_surfaceY,[_n_x_b7, _n_ph_b4])
			var _n_e_b9 = (1 - _S.MathFX.smooth((_n_HALF - 12),_n_HALF,absf(_n_x_b7)))
			var _n_glint_b10 = ((sin(((_n_x_b7 * 0.37) - ((_n_ph_b4 * _n_TAU) * 3))) * sin(((_n_x_b7 * 0.13) + (_n_ph_b4 * _n_TAU)))) > 0.55)
			_S.invoke(_n_p_b0,"dot",[_n_X_b6, _n_y_b8, (_n_WHITE if _S.truth(_n_glint_b10) else _S.index_value(_n_C_b3,5)), (_n_e_b9 * 1.3)])
			_S.invoke(_n_p_b0,"dot",[_n_X_b6, (_n_y_b8 + 1), _S.index_value(_n_C_b3,3), (_n_e_b9 * 1.3)])
			if _S.truth(_S.binary("===",_S.binary("&",_n_X_b6,3),0)):
				_S.invoke(_n_p_b0,"glow",[_n_x_b7, (_n_y_b8 + 1), 7, _S.index_value(_n_C_b3,5), ((0.22 if _S.truth(_n_glint_b10) else 0.1) * _n_e_b9)])
			_n_X_b6 += 1.0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_HALF = _S.read(_parent,"HALF")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_shaft = _S.read(_parent,"shaft")
	var _n_ph = _S.read(_parent,"ph")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_x_b3 = (_S.invoke(_n_r_b2,"range",[((-_n_HALF) + 6), (_n_HALF - 6)]) + (sin((((float(_n_age_b0)/_n_D) * _n_TAU) + _S.invoke(_n_r_b2,"range",[0, _n_TAU]))) * 3))
	var _n_y_b4 = ((_n_TOP + 6) + fmod((_S.invoke(_n_r_b2,"range",[0, 86]) + (_n_age_b0 * 4)),86))
	var _n_s_b5 = _S.call_value(_n_shaft,[_n_x_b3, _n_y_b4, _n_ph])
	var _n_tw_b6 = sin(((((float(_n_age_b0)/_n_D) * _n_TAU) * 3) + _S.invoke(_n_r_b2,"range",[0, _n_TAU])))
	if _S.truth(((_n_s_b5 < 0.2) if _S.truth((_n_tw_b6 < (-0.3))) else (_n_tw_b6 < (-0.3)))):
		return null
	_S.invoke(_n_p,"px",[_n_x_b3, _n_y_b4, (_n_WHITE if _S.truth((_n_s_b5 > 0.4)) else (_S.index_value(_n_C,5) if _S.truth((_n_tw_b6 > 0.6)) else _S.index_value(_n_C,4)))])
	if _S.truth((_n_s_b5 > 0.4)):
		_S.invoke(_n_p,"glow",[_n_x_b3, _n_y_b4, 3, _S.index_value(_n_C,5), (0.25 * _n_s_b5)])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_surfaceY = _S.read(_parent,"surfaceY")
	var _n_ph = _S.read(_parent,"ph")
	var _n_bubble = _S.read(_parent,"bubble")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_shaft = _S.read(_parent,"shaft")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_b_b0 = _S.arg(_args,0)
	var _n_sy_b1 = _S.call_value(_n_surfaceY,[_S.named_value(_n_b_b0,"x"), _n_ph])
	if _S.truth((_S.named_value(_n_b_b0,"y") > (_n_sy_b1 + _S.named_value(_n_b_b0,"r")))):
		_S.call_value(_n_bubble,[_n_p, _n_C, _S.named_value(_n_b_b0,"x"), _S.named_value(_n_b_b0,"y"), _S.named_value(_n_b_b0,"r"), _S.named_value(_n_b_b0,"q"), _S.call_value(_n_shaft,[_S.named_value(_n_b_b0,"x"), _S.named_value(_n_b_b0,"y"), _n_ph])])
	else:
		var _n_since_b2 = (float(((_n_sy_b1 + _S.named_value(_n_b_b0,"r")) - _S.named_value(_n_b_b0,"y")))/_S.named_value(_n_b_b0,"vy"))
		if _S.truth(((_S.named_value(_n_b_b0,"r") >= 1.4) if _S.truth((_n_since_b2 < 0.12)) else (_n_since_b2 < 0.12))):
			if true:
				var _n_a_b3 = PI
				while _S.truth((_n_a_b3 <= (_n_TAU + 0.01))):
					_S.invoke(_n_p,"px",[(_S.named_value(_n_b_b0,"x") + (cos(_n_a_b3) * _S.named_value(_n_b_b0,"r"))), (_n_sy_b1 + ((sin(_n_a_b3) * _S.named_value(_n_b_b0,"r")) * 0.9)), _S.index_value(_n_C,6)])
					_n_a_b3 += (float(0.4)/_S.named_value(_n_b_b0,"r"))
			_S.invoke(_n_p,"px",[(_S.named_value(_n_b_b0,"x") - (_S.named_value(_n_b_b0,"r") * 0.4)), (_n_sy_b1 - (_S.named_value(_n_b_b0,"r") * 0.6)), _n_WHITE])
		else:
			if _S.truth((_n_since_b2 < (0.32 if _S.truth((_S.named_value(_n_b_b0,"r") >= 1.4)) else 0.2))):
				var _n_k_b4 = clampf((float((_n_since_b2 - (0.12 if _S.truth((_S.named_value(_n_b_b0,"r") >= 1.4)) else 0)))/0.2),0.0,1.0)
				var _n_w_b5 = maxf(1,((_S.named_value(_n_b_b0,"r") + 1) + (_n_k_b4 * 4)))
				if true:
					var _n_a_b6 = 0
					while _S.truth((_n_a_b6 < PI)):
						if _S.truth((sin(_n_a_b6) > 0.15)):
							_S.invoke(_n_p,"dot",[(_S.named_value(_n_b_b0,"x") + (cos(_n_a_b6) * _n_w_b5)), (_n_sy_b1 + ((sin(_n_a_b6) * _n_w_b5) * 0.3)), (_n_WHITE if _S.truth((_n_k_b4 < 0.4)) else _S.index_value(_n_C,5)), (1.2 - _n_k_b4)])
						_n_a_b6 += (float(0.5)/_n_w_b5)
				if _S.truth(((_n_k_b4 < 0.6) if _S.truth((_S.named_value(_n_b_b0,"r") >= 1.4)) else (_S.named_value(_n_b_b0,"r") >= 1.4))):
					_S.invoke(_n_p,"px",[(_S.named_value(_n_b_b0,"x") - 2), ((_n_sy_b1 - 2) - (_n_k_b4 * 4)), _S.index_value(_n_C,6)])
					_S.invoke(_n_p,"px",[(_S.named_value(_n_b_b0,"x") + 2), ((_n_sy_b1 - 3) - (_n_k_b4 * 5)), _S.index_value(_n_C,6)])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_ph_b1 = _S.arg(_args,1)
	return ((_n_TOP + (sin(((_n_x_b0 * 0.13) + ((_n_ph_b1 * _n_TAU) * 2))) * 1.1)) + (sin(((_n_x_b0 * 0.051) - (_n_ph_b1 * _n_TAU))) * 1.3))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	var _n_u_b3 = (_n_x_b0 + ((_n_y_b1 - _n_TOP) * 0.32))
	var _n_s_b4 = ((sin(((_n_u_b3 * 0.16) + (_n_ph_b2 * _n_TAU))) * 0.6) + (sin((((_n_u_b3 * 0.07) - (_n_ph_b2 * _n_TAU)) + 1)) * 0.4))
	return (float(maxf(0,(_n_s_b4 - 0.35)))/0.65)
	return null
