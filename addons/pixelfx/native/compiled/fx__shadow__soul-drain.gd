@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/soul-drain.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "ringFast", _S.import_value("fx/shadow/_lib.js", "ringFast"))
	_S.define(_e, "halo", _S.import_value("fx/shadow/_lib.js", "halo"))
	_S.define(_e, "along", _S.function_value(_e, "_f0"))
	_S.define(_e, "vessel", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Soul drain"}, {"desc": "Pale souls are torn loose on the right and dragged down a funnel of streaks into a black crystal vessel, which flares violet as each one lands."}, {"tags": ["shadow", "soul", "drain", "necromancy", "funnel", "directional", "magic", "loop"]}, {"size": [208, 120]}, {"origin": [40, 110]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"soul": ["#2c3f66", "#7d9fd0", "#cfe6ff", "#ffffff"]}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "VY", _S.unary("-", 50))
	_S.define(_e, "D", 3.2)
	_S.define(_e, "LINES", 11)
	_S.define(_e, "SOULS", 4)
	_S.define(_e, "TRAVEL", 1.45)
	_S.define(_e, "wrap", _S.function_value(_e, "_f10"))
	_S.define(_e, "line", _S.function_value(_e, "_f11"))
	_S.define(_e, "LN", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "LINES")}]), _S.function_value(_e, "_f12")]))
	_S.define(_e, "soul", _S.function_value(_e, "_f13"))
	_S.define(_e, "landings", _S.function_value(_e, "_f14"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_VY = _S.read(_parent,"VY")
	var _n_L_b0 = _S.arg(_args,0)
	var _n_u_b1 = _S.arg(_args,1)
	var _n_v_b2 = (1 - _n_u_b1)
	var _n_a_b3 = ((_n_v_b2 * _n_v_b2) * _n_v_b2)
	var _n_b_b4 = (((3 * _n_v_b2) * _n_v_b2) * _n_u_b1)
	var _n_c_b5 = (((3 * _n_v_b2) * _n_u_b1) * _n_u_b1)
	var _n_d_b6 = ((_n_u_b1 * _n_u_b1) * _n_u_b1)
	return [(((_n_a_b3 * _S.named_value(_n_L_b0,"sx")) + (_n_b_b4 * _S.named_value(_n_L_b0,"c1x"))) + (_n_c_b5 * _S.named_value(_n_L_b0,"c2x"))), (((((_n_a_b3 * _S.named_value(_n_L_b0,"sy")) + (_n_b_b4 * _S.named_value(_n_L_b0,"c1y"))) + (_n_c_b5 * _S.named_value(_n_L_b0,"c2y"))) + (_n_d_b6 * (_n_VY - _S.named_value(_n_L_b0,"sy")))) + (_n_d_b6 * _S.named_value(_n_L_b0,"sy")))]
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_VY = _S.read(_parent,"VY")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_f_b3 = _S.arg(_args,3)
	var _n_y0_b4 = (_n_VY + (sin((float((_n_TAU * _n_t_b2))/_n_D)) * 1.5))
	var _n_W_b5 = 9
	var _n_UP_b6 = 14
	var _n_DN_b7 = 12
	_S.invoke(_n_p_b0,"shade",[((-_n_W_b5) - 1), ((_n_y0_b4 - _n_UP_b6) - 1), (_n_W_b5 + 1), ((_n_y0_b4 + _n_DN_b7) + 1), _S.function_value(_S.capture(_parent,{"y0":_n_y0_b4,"W":_n_W_b5,"UP":_n_UP_b6,"DN":_n_DN_b7,"f":_n_f_b3,"C":_n_C_b1,"this":_this}),"_f2")])
	_S.invoke(_n_p_b0,"glow",[0, _n_y0_b4, (30 + (14 * _n_f_b3)), _S.index_value(_n_C_b1,5), (0.5 + (0.5 * _n_f_b3))])
	_S.invoke(_n_p_b0,"glow",[0, (_n_y0_b4 + 1), 8, _n_WHITE, (0.25 + (0.6 * _n_f_b3))])
	return _n_y0_b4
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_y0 = _S.read(_parent,"y0")
	var _n_W = _S.read(_parent,"W")
	var _n_UP = _S.read(_parent,"UP")
	var _n_DN = _S.read(_parent,"DN")
	var _n_C = _S.read(_parent,"C")
	var _n_f = _S.read(_parent,"f")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_dy_b2 = (_n_y_b1 - _n_y0)
	var _n_half_b3 = ((_n_W * (1 + (float(_n_dy_b2)/_n_UP))) if _S.truth((_n_dy_b2 < 0)) else (_n_W * (1 - (float(_n_dy_b2)/_n_DN))))
	if _S.truth(((_n_half_b3 <= 0) if _S.truth((_n_half_b3 <= 0)) else (absf(_n_x_b0) > (_n_half_b3 + 0.6)))):
		return null
	if _S.truth((absf(_n_x_b0) > (_n_half_b3 - 0.4))):
		return (_S.index_value(_n_C,6) if _S.truth((_n_f > 0.5)) else _S.index_value(_n_C,1))
	var _n_ridge_b4 = (absf((_n_x_b0 + (_n_dy_b2 * 0.12))) < 0.6)
	var _n_heart_b5 = ((absf(_n_x_b0) + absf((_n_dy_b2 - 1))) < (2.6 + (_n_f * 1.5)))
	if _S.truth(_n_heart_b5):
		return (_n_WHITE if _S.truth((_n_f > 0.4)) else _S.index_value(_n_C,6))
	if _S.truth(_n_ridge_b4):
		return (_S.index_value(_n_C,7) if _S.truth((_n_f > 0.3)) else _S.index_value(_n_C,5))
	if _S.truth((_n_x_b0 < 0)):
		return ((_S.index_value(_n_C,5) if _S.truth((_n_f > 0.2)) else _S.index_value(_n_C,4)) if _S.truth((_n_dy_b2 < 0)) else _S.index_value(_n_C,3))
	return (_S.index_value(_n_C,2) if _S.truth((_n_dy_b2 < 0)) else _S.index_value(_n_C,1))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_LN = _S.read(_parent,"LN")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_D = _S.read(_parent,"D")
	var _n_along = _S.read(_parent,"along")
	var _n_LINES = _S.read(_parent,"LINES")
	var _n_VY = _S.read(_parent,"VY")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < _n_LINES)):
			var _n_L_b5 = _S.index_value(_n_LN,_n_i_b4)
			var _n_ph_b6 = (float(_S.call_value(_n_wrap,[(_n_t_b1 + (_n_i_b4 * 0.37))]))/_n_D)
			var _n_px_b7 = null
			var _n_py_b8 = null
			if true:
				var _n_u_b9 = 0
				while _S.truth((_n_u_b9 <= 1.0001)):
					var _tuple_0 = _S.call_value(_n_along,[_n_L_b5, _n_u_b9])
					var _n_x_b10 = _S.prop(_tuple_0,0)
					var _n_y_b11 = _S.prop(_tuple_0,1)
					var _n_dash_b12 = fmod((fmod((((_n_u_b9 * 5) - (_n_ph_b6 * 10)) + (_n_i_b4 * 0.3)),1) + 1),1)
					if _S.truth(_S.binary("!==",_n_px_b7,null)):
						_S.invoke(_n_p_b0,"line",[_n_px_b7, _n_py_b8, _n_x_b10, _n_y_b11, (_S.index_value(_n_C_b3,3) if _S.truth((_n_u_b9 > 0.6)) else _S.index_value(_n_C_b3,2)), (0.4 + (0.6 * _n_u_b9))])
					if _S.truth((_n_dash_b12 < 0.18)):
						_S.invoke(_n_p_b0,"px",[_n_x_b10, _n_y_b11, (_S.index_value(_n_C_b3,7) if _S.truth((_n_u_b9 > 0.7)) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_u_b9 > 0.35)) else _S.index_value(_n_C_b3,5)))])
					_n_px_b7 = _n_x_b10
					_n_py_b8 = _n_y_b11
					_n_u_b9 += 0.01
			_n_i_b4 += 1.0
	_S.invoke(_n_p_b0,"glow",[10, _n_VY, 40, _S.index_value(_n_C_b3,4), 0.22])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_landings = _S.read(_parent,"landings")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_vessel = _S.read(_parent,"vessel")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_soul = _S.read(_parent,"soul")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_TRAVEL = _S.read(_parent,"TRAVEL")
	var _n_LN = _S.read(_parent,"LN")
	var _n_along = _S.read(_parent,"along")
	var _n_ringFast = _S.read(_parent,"ringFast")
	var _n_SOULS = _S.read(_parent,"SOULS")
	var _n_ease = _S.read(_parent,"ease")
	var _n_halo = _S.read(_parent,"halo")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_S_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"soul"),4)
	var _n_f_b5 = _S.call_value(_n_landings,[_n_t_b1])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 10, _S.named_value(_n_o_b2,"seed"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"S":_n_S_b4,"this":_this}),"_f6")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 22, (_S.named_value(_n_o_b2,"seed") + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f8")])
	var _n_y0_b6 = _S.call_value(_n_vessel,[_n_p_b0, _n_C_b3, _n_t_b1, _n_f_b5])
	if true:
		var _n_k_b7 = 0
		while _S.truth((_n_k_b7 < 6)):
			var _n_a_b8 = ((float((_n_TAU * (2 * _n_t_b1)))/_n_D) + (float((_n_k_b7 * _n_TAU))/6))
			var _n_ex_b9 = (cos(_n_a_b8) * 15)
			var _n_ey_b10 = ((sin(_n_a_b8) * 5) - 2)
			var _n_z_b11 = sin(_n_a_b8)
			_S.invoke(_n_p_b0,"px",[_n_ex_b9, (_n_y0_b6 + _n_ey_b10), (_S.index_value(_n_C_b3,7) if _S.truth((_n_z_b11 > 0)) else _S.index_value(_n_C_b3,4))])
			if _S.truth((_n_z_b11 > 0)):
				_S.invoke(_n_p_b0,"glow",[_n_ex_b9, (_n_y0_b6 + _n_ey_b10), 4, _S.index_value(_n_C_b3,6), 0.35])
			_n_k_b7 += 1.0
	if true:
		var _n_j_b12 = 0
		while _S.truth((_n_j_b12 < _n_SOULS)):
			var _n_s_b13 = _S.call_value(_n_soul,[_n_j_b12])
			var _n_age_b14 = _S.call_value(_n_wrap,[(_n_t_b1 - _S.named_value(_n_s_b13,"born"))])
			if _S.truth((_n_age_b14 > _n_TRAVEL)):
				_n_j_b12 += 1.0
				continue
			var _n_L_b15 = _S.index_value(_n_LN,_S.named_value(_n_s_b13,"line"))
			var _n_u_b16 = pow((float(_n_age_b14)/_n_TRAVEL),1.8)
			var _tuple_0 = _S.call_value(_n_along,[_n_L_b15, _n_u_b16])
			var _n_x_b17 = _S.prop(_tuple_0,0)
			var _n_y_b18 = _S.prop(_tuple_0,1)
			if _S.truth((_n_age_b14 < 0.18)):
				var _n_k_b21 = (1 - (float(_n_age_b14)/0.18))
				_S.call_value(_n_ringFast,[_n_p_b0, _S.named_value(_n_L_b15,"sx"), _S.named_value(_n_L_b15,"sy"), (3 + (9 * (1 - _n_k_b21))), 1, (_S.index_value(_n_S_b4,2) if _S.truth((_n_k_b21 > 0.5)) else _S.index_value(_n_S_b4,1))])
				_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_L_b15,"sx"), _S.named_value(_n_L_b15,"sy"), 12, _S.index_value(_n_S_b4,1), (0.5 * _n_k_b21)])
			if true:
				var _n_k_b22 = 14
				while _S.truth((_n_k_b22 >= 1)):
					var _n_uu_b23 = pow((float(maxf(0,(_n_age_b14 - (_n_k_b22 * 0.03))))/_n_TRAVEL),1.8)
					var _tuple_1 = _S.call_value(_n_along,[_n_L_b15, _n_uu_b23])
					var _n_tx_b24 = _S.prop(_tuple_1,0)
					var _n_ty_b25 = _S.prop(_tuple_1,1)
					var _n_w_b26 = ((sin((((_n_t_b1 * 12) + (_n_k_b22 * 0.8)) + _n_j_b12)) * _n_k_b22) * 0.16)
					var _n_r_b27 = maxf(0.5,(2.6 - (_n_k_b22 * 0.17)))
					_S.invoke(_n_p_b0,"disc",[_n_tx_b24, (_n_ty_b25 + _n_w_b26), _n_r_b27, (_S.index_value(_n_S_b4,2) if _S.truth((_n_k_b22 < 4)) else (_S.index_value(_n_S_b4,1) if _S.truth((_n_k_b22 < 9)) else _S.index_value(_n_C_b3,5))), (0.75 * (1 - (float(_n_k_b22)/15)))])
					_n_k_b22 -= 1.0
			var _n_near_b19 = _S.MathFX.smooth(0.82,1,_n_u_b16)
			var _n_hr_b20 = (3.4 - (_n_near_b19 * 1.6))
			_S.invoke(_n_p_b0,"circle",[_n_x_b17, _n_y_b18, (_n_hr_b20 + 0.8), _S.index_value(_n_S_b4,1)])
			_S.invoke(_n_p_b0,"circle",[_n_x_b17, _n_y_b18, _n_hr_b20, _S.index_value(_n_S_b4,2)])
			_S.invoke(_n_p_b0,"px",[(_n_x_b17 - 1), (_n_y_b18 - 2), _S.index_value(_n_S_b4,3)])
			_S.invoke(_n_p_b0,"px",[(_n_x_b17 - 2), (_n_y_b18 - 1), _S.index_value(_n_S_b4,3)])
			if _S.truth((_n_near_b19 < 0.5)):
				_S.invoke(_n_p_b0,"px",[(_n_x_b17 - 1.5), _n_y_b18, _S.index_value(_n_S_b4,0)])
				_S.invoke(_n_p_b0,"px",[(_n_x_b17 + 1.5), _n_y_b18, _S.index_value(_n_S_b4,0)])
				_S.invoke(_n_p_b0,"px",[_n_x_b17, (_n_y_b18 + 1.6), _S.index_value(_n_S_b4,0)])
				_S.invoke(_n_p_b0,"px",[_n_x_b17, (_n_y_b18 + 2.4), _S.index_value(_n_S_b4,0)])
			_S.invoke(_n_p_b0,"glow",[_n_x_b17, _n_y_b18, 10, _S.index_value(_n_S_b4,1), 0.5])
			_n_j_b12 += 1.0
	if true:
		var _n_j_b28 = 0
		while _S.truth((_n_j_b28 < _n_SOULS)):
			var _n_since_b29 = _S.call_value(_n_wrap,[((_n_t_b1 - _S.named_value(_S.call_value(_n_soul,[_n_j_b28]),"born")) - _n_TRAVEL)])
			if _S.truth((_n_since_b29 < 0.3)):
				var _n_k_b30 = (float(_n_since_b29)/0.3)
				_S.call_value(_n_ringFast,[_n_p_b0, 0, _n_y0_b6, (6 + (18 * _S.invoke(_n_ease,"outCubic",[_n_k_b30]))), maxf(1,(2 * (1 - _n_k_b30))), (_S.index_value(_n_C_b3,7) if _S.truth((_n_k_b30 < 0.4)) else (_S.index_value(_n_C_b3,5) if _S.truth((_n_k_b30 < 0.7)) else _S.index_value(_n_C_b3,3)))])
			_n_j_b28 += 1.0
	_S.call_value(_n_halo,[_n_p_b0, 0, _n_y0_b6, 4, 22, _S.index_value(_n_C_b3,6), (0.25 * _n_f_b5)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.8, 1.3])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_S = _S.read(_parent,"S")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_Lf_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_x_b3 = _S.invoke(_n_r_b2,"range",[100, 150])
	var _n_y_b4 = (_S.invoke(_n_r_b2,"range",[(-80), (-20)]) - (_n_age_b0 * 18))
	var _n_u_b5 = (float(_n_age_b0)/_n_Lf_b1)
	_S.invoke(_n_p,"dot",[_n_x_b3, _n_y_b4, _S.index_value(_n_S,2), ((1 - _n_u_b5) * 0.8)])
	_S.invoke(_n_p,"glow",[_n_x_b3, _n_y_b4, 4, _S.index_value(_n_S,1), (0.2 * (1 - _n_u_b5))])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.4, 0.7])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_LN = _S.read(_parent,"LN")
	var _n_LINES = _S.read(_parent,"LINES")
	var _n_along = _S.read(_parent,"along")
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_Lf_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_L_b3 = _S.index_value(_n_LN,floori((_S.invoke(_n_r_b2,"next",[]) * _n_LINES)))
	var _n_u0_b4 = _S.invoke(_n_r_b2,"range",[0.15, 0.5])
	var _n_q_b5 = (_n_u0_b4 + ((1 - _n_u0_b4) * pow((float(_n_age_b0)/_n_Lf_b1),2.2)))
	var _n_q2_b6 = (_n_u0_b4 + ((1 - _n_u0_b4) * pow((float(maxf(0,(_n_age_b0 - 0.06)))/_n_Lf_b1),2.2)))
	var _tuple_0 = _S.call_value(_n_along,[_n_L_b3, _n_q_b5])
	var _n_x_b7 = _S.prop(_tuple_0,0)
	var _n_y_b8 = _S.prop(_tuple_0,1)
	var _tuple_1 = _S.call_value(_n_along,[_n_L_b3, _n_q2_b6])
	var _n_tx_b9 = _S.prop(_tuple_1,0)
	var _n_ty_b10 = _S.prop(_tuple_1,1)
	_S.invoke(_n_p,"line",[_n_tx_b9, _n_ty_b10, _n_x_b7, _n_y_b8, _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f9")])
	_S.invoke(_n_p,"glow",[_n_x_b7, _n_y_b8, 4, _S.index_value(_n_C,6), 0.35])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_v_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_v_b0 > 0.7)) else (_S.index_value(_n_C,6) if _S.truth((_n_v_b0 > 0.35)) else _S.index_value(_n_C,4)))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_x_b0 = _S.arg(_args,0)
	return fmod((fmod(_n_x_b0,_n_D) + _n_D),_n_D)
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_VY = _S.read(_parent,"VY")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_sx_b1 = (96 + (_S.MathFX.rand([_n_i_b0,1]) * 64))
	var _n_sy_b2 = ((-88) + (_S.MathFX.rand([_n_i_b0,2]) * 72))
	var _n_bend_b3 = ((_S.MathFX.rand([_n_i_b0,3]) - 0.5) * 50)
	return {"sx":_n_sx_b1,"sy":_n_sy_b2,"c1x":(_n_sx_b1 * 0.55),"c1y":(_n_sy_b2 + _n_bend_b3),"c2x":(22 + (_S.MathFX.rand([_n_i_b0,4]) * 14)),"c2y":(_n_VY + ((_n_sy_b2 - _n_VY) * 0.25))}
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_line = _S.read(_parent,"line")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _S.call_value(_n_line,[_n_i_b1])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_SOULS = _S.read(_parent,"SOULS")
	var _n_LINES = _S.read(_parent,"LINES")
	var _n_j_b0 = _S.arg(_args,0)
	return {"born":(((_n_j_b0 + 0.15) + (_S.MathFX.rand([_n_j_b0,7]) * 0.5)) * (float(_n_D)/_n_SOULS)),"line":floori((_S.MathFX.rand([_n_j_b0,8]) * _n_LINES))}
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_soul = _S.read(_parent,"soul")
	var _n_TRAVEL = _S.read(_parent,"TRAVEL")
	var _n_SOULS = _S.read(_parent,"SOULS")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_f_b1 = 0
	if true:
		var _n_j_b2 = 0
		while _S.truth((_n_j_b2 < _n_SOULS)):
			var _n_since_b3 = _S.call_value(_n_wrap,[((_n_t_b0 - _S.named_value(_S.call_value(_n_soul,[_n_j_b2]),"born")) - _n_TRAVEL)])
			_n_f_b1 += (exp((float((-_n_since_b3))/0.14)) * (1 if _S.truth((_n_since_b3 < 1)) else 0))
			_n_j_b2 += 1.0
	return minf(1.4,_n_f_b1)
	return null
