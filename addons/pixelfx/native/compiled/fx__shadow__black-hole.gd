@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/black-hole.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f1":"sky_black_hole"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "halo", _S.import_value("fx/shadow/_lib.js", "halo"))
	_S.define(_e, "unlight", _S.import_value("fx/shadow/_lib.js", "unlight"))
	_S.define(_e, "disk", _S.function_value(_e, "_f0"))
	_S.define(_e, "hole", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Black hole"}, {"desc": "A tilted disk of banded rings turns round a black hole, its far side bent up over the top and under the bottom; debris spirals in, stretches and is swallowed."}, {"tags": ["shadow", "black-hole", "void", "space", "gravity", "dark", "magic", "loop"]}, {"size": [184, 132]}, {"origin": [92, 124]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"rock": ["#120d1c", "#2e2440", "#544468", "#857399"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "Y", _S.unary("-", 70))
	_S.define(_e, "RS", 13.5)
	_S.define(_e, "E", 17.5)
	_S.define(_e, "SI", 0.25)
	_S.define(_e, "SI_ARCH", 0.46)
	_S.define(_e, "TILT", _S.unary("-", 0.14))
	_S.define(_e, "D", 4)
	_S.define(_e, "CT", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "TILT")]))
	_S.define(_e, "ST", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "TILT")]))
	_S.define(_e, "BANDS", [_S.merge([{"r0": 18}, {"r1": 24}, {"n": 5}, {"hot": 1.35}, {"k": 0.3}]), _S.merge([{"r0": 26}, {"r1": 34}, {"n": 3}, {"hot": 0.92}, {"k": 1.9}]), _S.merge([{"r0": 35.5}, {"r1": 46}, {"n": 2}, {"hot": 0.64}, {"k": 3.7}]), _S.merge([{"r0": 47.5}, {"r1": 60}, {"n": 1}, {"hot": 0.42}, {"k": 5.2}])])
	_S.define(_e, "ROUT", 60)
	_S.define(_e, "BAYER", _S.invoke([0, 8, 2, 10, 12, 4, 14, 6, 3, 11, 1, 9, 15, 7, 13, 5], "map", [_S.function_value(_e, "_f15")]))
	_S.define(_e, "ICE", _S.call_value(_S.read(_e, "hex"), ["#e4f7ff"]))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_BANDS = _S.read(_parent,"BANDS")
	var _n_X_b0 = _S.arg(_args,0)
	var _n_Z_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_rho_b3 = sqrt(((_n_X_b0 * _n_X_b0) + (_n_Z_b1 * _n_Z_b1)))
	for _iter_0 in _S.array(_n_BANDS):
		var _n_b_b4 = _iter_0
		if _S.truth(((_n_rho_b3 < _S.named_value(_n_b_b4,"r0")) if _S.truth((_n_rho_b3 < _S.named_value(_n_b_b4,"r0"))) else (_n_rho_b3 > _S.named_value(_n_b_b4,"r1")))):
			continue
		var _n_w_b5 = (float((_n_rho_b3 - _S.named_value(_n_b_b4,"r0")))/(_S.named_value(_n_b_b4,"r1") - _S.named_value(_n_b_b4,"r0")))
		var _n_ph_b6 = (atan2(_n_Z_b1,_n_X_b0) - (float(((_n_TAU * _S.named_value(_n_b_b4,"n")) * _n_t_b2))/_n_D))
		var _n_streak_b7 = ((0.62 + (0.22 * cos((((7 * _n_ph_b6) + (_n_rho_b3 * 0.8)) + _S.named_value(_n_b_b4,"k"))))) + (0.16 * cos((((13 * _n_ph_b6) - (_n_rho_b3 * 1.6)) + (_S.named_value(_n_b_b4,"k") * 2)))))
		var _n_lane_b8 = (0.72 + (0.28 * cos(((_n_rho_b3 * 2.3) + _S.named_value(_n_b_b4,"k")))))
		var _n_edge_b9 = (_S.MathFX.smooth(0,0.18,_n_w_b5) * (1 - _S.MathFX.smooth(0.78,1,_n_w_b5)))
		return {"I":(((_S.named_value(_n_b_b4,"hot") * _n_streak_b7) * _n_lane_b8) * (0.35 + (0.65 * _n_edge_b9))),"dop":(float((-_n_X_b0))/_n_rho_b3)}
	return null
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ROUT = _S.read(_parent,"ROUT")
	var _n_Y = _S.read(_parent,"Y")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_pulse_b3 = _S.arg(_args,3)
	var _n_RAMP_b4 = [_S.index_value(_n_C_b1,1), _S.index_value(_n_C_b1,2), _S.index_value(_n_C_b1,3), _S.index_value(_n_C_b1,4), _S.index_value(_n_C_b1,5), _S.index_value(_n_C_b1,6), _S.index_value(_n_C_b1,7), _n_WHITE]
	var _n_n_b5 = _S.prop(_n_RAMP_b4,"length")
	var _n_W_b6 = (_n_ROUT + 2)
	var _n_H_b7 = 42
	_S.invoke(_n_p_b0,"shade",[(-_n_W_b6), (_n_Y - _n_H_b7), _n_W_b6, (_n_Y + _n_H_b7), _S.function_value(_S.capture(_parent,{"t":_n_t_b2,"C":_n_C_b1,"pulse":_n_pulse_b3,"n":_n_n_b5,"RAMP":_n_RAMP_b4,"this":_this}),"_f2")])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _n_CT = _S.read(_parent,"CT")
	var _n_ST = _S.read(_parent,"ST")
	var _n_disk = _S.read(_parent,"disk")
	var _n_SI = _S.read(_parent,"SI")
	var _n_t = _S.read(_parent,"t")
	var _n_RS = _S.read(_parent,"RS")
	var _n_E = _S.read(_parent,"E")
	var _n_SI_ARCH = _S.read(_parent,"SI_ARCH")
	var _n_C = _S.read(_parent,"C")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_pulse = _S.read(_parent,"pulse")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_n = _S.read(_parent,"n")
	var _n_BAYER = _S.read(_parent,"BAYER")
	var _n_RAMP = _S.read(_parent,"RAMP")
	var _n_ICE = _S.read(_parent,"ICE")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = _n_x_b0
	var _n_dy_b4 = (_n_y_b1 - _n_Y)
	var _n_u_b5 = ((_n_dx_b3 * _n_CT) + (_n_dy_b4 * _n_ST))
	var _n_v_b6 = (((-_n_dx_b3) * _n_ST) + (_n_dy_b4 * _n_CT))
	var _n_r_b7 = sqrt(((_n_u_b5 * _n_u_b5) + (_n_v_b6 * _n_v_b6)))
	var _n_s_b8 = null
	if _S.truth((_n_v_b6 > 0)):
		_n_s_b8 = _S.call_value(_n_disk,[_n_u_b5, (float((-_n_v_b6))/_n_SI), _n_t])
	if _S.truth(((_n_r_b7 > _n_RS) if _S.truth(not _S.truth(_n_s_b8)) else not _S.truth(_n_s_b8))):
		var _n_k_b13 = (1 - (float((_n_E * _n_E))/(_n_r_b7 * _n_r_b7)))
		var _n_bu_b14 = (_n_u_b5 * _n_k_b13)
		var _n_bv_b15 = (_n_v_b6 * _n_k_b13)
		var _n_si_b16 = (_n_SI_ARCH if _S.truth((_n_k_b13 > 0)) else _n_SI)
		if _S.truth(((float((-_n_bv_b15))/_n_si_b16) > 0)):
			_n_s_b8 = _S.call_value(_n_disk,[_n_bu_b14, (float((-_n_bv_b15))/_n_si_b16), _n_t])
	if _S.truth((not _S.truth(_n_s_b8) if _S.truth(not _S.truth(_n_s_b8)) else (_S.named_value(_n_s_b8,"I") < 0.06))):
		if _S.truth((_n_r_b7 < (_n_RS - 0.4))):
			return _S.index_value(_n_C,0)
		if _S.truth((_n_r_b7 < (_n_RS + 0.7))):
			var _n_a_b17 = atan2(_n_v_b6,_n_u_b5)
			var _n_f_b18 = ((0.5 + (0.5 * cos(((3 * _n_a_b17) + (float(((_n_TAU * 2) * _n_t))/_n_D))))) + (_n_pulse * 0.4))
			_S.set_prop(_n_out_b2,"k",0.3,"=")
			return (_n_WHITE if _S.truth((_n_f_b18 > 0.55)) else _S.index_value(_n_C,7))
		return null
	var _n_I_b9 = (((_S.named_value(_n_s_b8,"I") * 1.3) * (1 + (0.55 * _S.named_value(_n_s_b8,"dop")))) * (1 + (0.25 * _n_pulse)))
	var _n_f_b10 = (clampf(_n_I_b9,0.0,1.0) * (_n_n - 1))
	var _n_i_b11 = floori(_n_f_b10)
	if _S.truth(((_n_f_b10 - _n_i_b11) > _S.index_value(_n_BAYER,_S.binary("|",_S.binary("<<",_S.binary("&",floori(_n_y_b1),3),2),_S.binary("&",floori(_n_x_b0),3))))):
		_n_i_b11 = minf((_n_n - 1),(_n_i_b11 + 1))
	if _S.truth(((_n_I_b9 < 0.12) if _S.truth(_S.binary("===",_n_i_b11,0)) else _S.binary("===",_n_i_b11,0))):
		return null
	var _n_c_b12 = _S.index_value(_n_RAMP,_n_i_b11)
	if _S.truth(((_n_i_b11 >= (_n_n - 3)) if _S.truth((_S.named_value(_n_s_b8,"dop") > 0.35)) else (_S.named_value(_n_s_b8,"dop") > 0.35))):
		_n_c_b12 = _S.ColorFX.mix(_n_c_b12,_n_ICE,minf(1,((_S.named_value(_n_s_b8,"dop") - 0.35) * 2)))
	if _S.truth(((_n_i_b11 < (_n_n - 2)) if _S.truth(((_n_i_b11 >= 2) if _S.truth((_S.named_value(_n_s_b8,"dop") < (-0.4))) else (_S.named_value(_n_s_b8,"dop") < (-0.4)))) else ((_n_i_b11 >= 2) if _S.truth((_S.named_value(_n_s_b8,"dop") < (-0.4))) else (_S.named_value(_n_s_b8,"dop") < (-0.4))))):
		_n_c_b12 = _S.ColorFX.mix(_n_c_b12,_S.index_value(_n_C,3),0.35)
	if _S.truth((_S.binary("===",_S.binary("&",(floori(_n_x_b0) + floori(_n_y_b1)),1),0) if _S.truth((_n_i_b11 >= (_n_n - 4))) else (_n_i_b11 >= (_n_n - 4)))):
		_S.set_prop(_n_out_b2,"k",(0.3 * minf(1,(_n_I_b9 - 0.35))),"=")
	return _n_c_b12
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	_S.invoke(_n_p_b0,"glow",[0, (-1), 44, _S.index_value(_n_C_b3,4), 0.12])
	_S.invoke(_n_p_b0,"glow",[0, _n_Y, 80, _S.index_value(_n_C_b3,4), 0.32])
	_S.invoke(_n_p_b0,"glow",[0, _n_Y, 46, _S.ColorFX.mix(_S.index_value(_n_C_b3,6),_S.index_value(_n_C_b3,5),0.5), 0.45])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_hole = _S.read(_parent,"hole")
	var _n_Y = _S.read(_parent,"Y")
	var _n_RS = _S.read(_parent,"RS")
	var _n_halo = _S.read(_parent,"halo")
	var _n_unlight = _S.read(_parent,"unlight")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_K_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"rock"),4)
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_pulse_b6 = pow(maxf(0,cos((float(((_n_TAU * 2) * _n_t_b1))/_n_D))),12)
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 10, (_n_S_b5 + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"K":_n_K_b4,"this":_this}),"_f6")])
	_S.call_value(_n_hole,[_n_p_b0, _n_C_b3, _n_t_b1, _n_pulse_b6])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 40, (_n_S_b5 + 7), _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"p":_n_p_b0,"this":_this}),"_f8")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 22, _n_S_b5, _S.function_value(_S.capture(_parent,{"this":_this}),"_f10"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"K":_n_K_b4,"this":_this}),"_f11")])
	_S.call_value(_n_halo,[_n_p_b0, 0, _n_Y, (_n_RS - 0.4), (_n_RS + 4), _S.index_value(_n_C_b3,6), (0.35 + (0.3 * _n_pulse_b6))])
	_S.call_value(_n_unlight,[_n_p_b0, (-_n_RS), (_n_Y - _n_RS), _n_RS, (_n_Y + _n_RS), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f14")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.6, 2.6])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _n_p = _S.read(_parent,"p")
	var _n_K = _S.read(_parent,"K")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_x0_b3 = _S.invoke(_n_r_b2,"range",[(-60), 60])
	var _n_u_b4 = pow((float(_n_age_b0)/_n_L_b1),1.5)
	var _n_tx_b5 = (signf((_n_x0_b3 if _S.truth(_n_x0_b3) else 1)) * _S.invoke(_n_r_b2,"range",[40, 56]))
	var _n_ty_b6 = (_n_Y + _S.invoke(_n_r_b2,"range",[4, 9]))
	var _n_x_b7 = (_n_x0_b3 + ((_n_tx_b5 - _n_x0_b3) * _n_u_b4))
	var _n_y_b8 = (((-1) + ((_n_ty_b6 + 1) * _n_u_b4)) - (sin((PI * _n_u_b4)) * 10))
	_S.invoke(_n_p,"px",[_n_x_b7, _n_y_b8, (_S.index_value(_n_K,3) if _S.truth((_n_u_b4 > 0.6)) else _S.index_value(_n_K,2))])
	if _S.truth((_n_age_b0 < 0.25)):
		_S.invoke(_n_p,"disc",[_n_x0_b3, (-1.5), (2 + (_n_age_b0 * 8)), _S.index_value(_n_K,2), (0.4 * (1 - (float(_n_age_b0)/0.25)))])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.5, 0.9])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RS = _S.read(_parent,"RS")
	var _n_Y = _S.read(_parent,"Y")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_a0_b3 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_d0_b4 = _S.invoke(_n_r_b2,"range",[48, 76])
	var _n_q_b5 = pow((float(_n_age_b0)/_n_L_b1),1.6)
	var _n_d_b6 = ((_n_RS + 2) + (((_n_d0_b4 - _n_RS) - 2) * (1 - _n_q_b5)))
	var _n_a_b7 = (_n_a0_b3 + (0.9 * _n_q_b5))
	var _n_x_b8 = ((cos(_n_a_b7) * _n_d_b6) * 1.15)
	var _n_y_b9 = (_n_Y + ((sin(_n_a_b7) * _n_d_b6) * 0.75))
	var _n_q2_b10 = pow((float(maxf(0,(_n_age_b0 - 0.09)))/_n_L_b1),1.6)
	var _n_d2_b11 = ((_n_RS + 2) + (((_n_d0_b4 - _n_RS) - 2) * (1 - _n_q2_b10)))
	var _n_a2_b12 = (_n_a0_b3 + (0.9 * _n_q2_b10))
	if _S.truth(_S.logical("||",((((_n_d_b6 < (_n_RS + 3)) if _S.truth((_n_d_b6 < (_n_RS + 3))) else (_n_y_b9 > (-3))) if _S.truth(((_n_d_b6 < (_n_RS + 3)) if _S.truth((_n_d_b6 < (_n_RS + 3))) else (_n_y_b9 > (-3)))) else (_n_y_b9 < (-120))) if _S.truth((((_n_d_b6 < (_n_RS + 3)) if _S.truth((_n_d_b6 < (_n_RS + 3))) else (_n_y_b9 > (-3))) if _S.truth(((_n_d_b6 < (_n_RS + 3)) if _S.truth((_n_d_b6 < (_n_RS + 3))) else (_n_y_b9 > (-3)))) else (_n_y_b9 < (-120)))) else ((_n_Y + ((sin(_n_a2_b12) * _n_d2_b11) * 0.75)) < (-120))),func():return (absf(_n_x_b8) > 90))):
		return null
	var _n_col_b13 = _S.invoke(_n_r_b2,"pick",[[_n_WHITE, _S.index_value(_n_C,7), _S.index_value(_n_C,6), _S.index_value(_n_C,5)]])
	_S.invoke(_n_p,"line",[((cos(_n_a2_b12) * _n_d2_b11) * 1.15), (_n_Y + ((sin(_n_a2_b12) * _n_d2_b11) * 0.75)), _n_x_b8, _n_y_b9, _S.function_value(_S.capture(_parent,{"col":_n_col_b13,"this":_n_this}),"_f9"), minf(1,(_n_age_b0 * 6))])
	_S.invoke(_n_p,"glow",[_n_x_b8, _n_y_b9, 3, _n_col_b13, 0.3])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_col = _S.read(_parent,"col")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_col if _S.truth((_n_u_b0 > 0.6)) else _S.index_value(_n_C,4))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.4, 2.4])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_this = _S.read(_parent,"this")
	var _n_Y = _S.read(_parent,"Y")
	var _n_RS = _S.read(_parent,"RS")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_K = _S.read(_parent,"K")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_ph0_b3 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_rho0_b4 = _S.invoke(_n_r_b2,"range",[58, 80])
	var _n_hgt_b5 = _S.invoke(_n_r_b2,"range",[(-8), 8])
	var _n_size_b6 = _S.invoke(_n_r_b2,"range",[1.6, 2.8])
	var _n_at_b7 = _S.function_value(_S.capture(_parent,{"L":_n_L_b1,"rho0":_n_rho0_b4,"ph0":_n_ph0_b3,"hgt":_n_hgt_b5,"this":_n_this}),"_f12")
	var _n_a_b8 = _S.call_value(_n_at_b7,[_n_age_b0])
	var _n_b_b9 = _S.call_value(_n_at_b7,[(_n_age_b0 - 0.04)])
	var _n_hidden_b10 = ((_S.Bridge.hypot([_S.named_value(_n_a_b8,"x"), (_S.named_value(_n_a_b8,"y") - _n_Y)]) < (_n_RS + 1)) if _S.truth((_S.named_value(_n_a_b8,"Z") > 0)) else (_S.named_value(_n_a_b8,"Z") > 0))
	if _S.truth(_n_hidden_b10):
		return null
	if _S.truth((_S.named_value(_n_a_b8,"rho") < (_n_RS + 3))):
		_S.invoke(_n_p,"px",[_S.named_value(_n_a_b8,"x"), _S.named_value(_n_a_b8,"y"), _n_WHITE])
		_S.invoke(_n_p,"glow",[_S.named_value(_n_a_b8,"x"), _S.named_value(_n_a_b8,"y"), 6, _S.index_value(_n_C,6), 0.6])
		return null
	var _n_heat_b11 = (1 - _S.MathFX.smooth(16,34,_S.named_value(_n_a_b8,"rho")))
	var _n_len_b12 = (1 + (_n_heat_b11 * 7))
	if _S.truth((_n_heat_b11 > 0.05)):
		var _n_dx_b13 = (_S.named_value(_n_a_b8,"x") - _S.named_value(_n_b_b9,"x"))
		var _n_dy_b14 = (_S.named_value(_n_a_b8,"y") - _S.named_value(_n_b_b9,"y"))
		var _n_l_b15 = _S.logical("||",_S.Bridge.hypot([_n_dx_b13, _n_dy_b14]),func():return 1)
		_S.invoke(_n_p,"line",[(_S.named_value(_n_a_b8,"x") - ((float(_n_dx_b13)/_n_l_b15) * _n_len_b12)), (_S.named_value(_n_a_b8,"y") - ((float(_n_dy_b14)/_n_l_b15) * _n_len_b12)), _S.named_value(_n_a_b8,"x"), _S.named_value(_n_a_b8,"y"), _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f13")])
		_S.invoke(_n_p,"glow",[_S.named_value(_n_a_b8,"x"), _S.named_value(_n_a_b8,"y"), 4, _S.index_value(_n_C,6), (0.4 * _n_heat_b11)])
	else:
		var _n_lx_b16 = (float((-_S.named_value(_n_a_b8,"x")))/_S.logical("||",_S.Bridge.hypot([_S.named_value(_n_a_b8,"x"), (_S.named_value(_n_a_b8,"y") - _n_Y)]),func():return 1))
		var _n_ly_b17 = (float((-(_S.named_value(_n_a_b8,"y") - _n_Y)))/_S.logical("||",_S.Bridge.hypot([_S.named_value(_n_a_b8,"x"), (_S.named_value(_n_a_b8,"y") - _n_Y)]),func():return 1))
		var _n_c_b18 = _S.call_value(_n_at_b7,[(_n_age_b0 - 0.09)])
		var _n_d_b19 = _S.call_value(_n_at_b7,[(_n_age_b0 - 0.15)])
		_S.invoke(_n_p,"px",[_S.named_value(_n_b_b9,"x"), _S.named_value(_n_b_b9,"y"), _S.index_value(_n_C,3)])
		_S.invoke(_n_p,"dot",[_S.named_value(_n_c_b18,"x"), _S.named_value(_n_c_b18,"y"), _S.index_value(_n_C,3), 0.7])
		_S.invoke(_n_p,"dot",[_S.named_value(_n_d_b19,"x"), _S.named_value(_n_d_b19,"y"), _S.index_value(_n_C,2), 0.5])
		var _n_s2_b20 = (_n_size_b6 > 2.2)
		_S.invoke(_n_p,"px",[_S.named_value(_n_a_b8,"x"), _S.named_value(_n_a_b8,"y"), _S.index_value(_n_K,2)])
		_S.invoke(_n_p,"px",[(_S.named_value(_n_a_b8,"x") + 1), _S.named_value(_n_a_b8,"y"), _S.index_value(_n_K,1)])
		_S.invoke(_n_p,"px",[_S.named_value(_n_a_b8,"x"), (_S.named_value(_n_a_b8,"y") + 1), _S.index_value(_n_K,1)])
		if _S.truth(_n_s2_b20):
			_S.invoke(_n_p,"px",[(_S.named_value(_n_a_b8,"x") + 1), (_S.named_value(_n_a_b8,"y") + 1), _S.index_value(_n_K,0)])
			_S.invoke(_n_p,"px",[(_S.named_value(_n_a_b8,"x") - 1), _S.named_value(_n_a_b8,"y"), _S.index_value(_n_K,1)])
			_S.invoke(_n_p,"px",[_S.named_value(_n_a_b8,"x"), (_S.named_value(_n_a_b8,"y") - 1), _S.index_value(_n_K,2)])
		_S.invoke(_n_p,"px",[(_S.named_value(_n_a_b8,"x") + floori((_n_lx_b16 * 1.4)+0.5)), (_S.named_value(_n_a_b8,"y") + floori((_n_ly_b17 * 1.4)+0.5)), (_S.index_value(_n_C,6) if _S.truth(_n_s2_b20) else _S.index_value(_n_C,5))])
		_S.invoke(_n_p,"glow",[_S.named_value(_n_a_b8,"x"), _S.named_value(_n_a_b8,"y"), 4, _S.index_value(_n_C,5), 0.15])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_RS = _S.read(_parent,"RS")
	var _n_rho0 = _S.read(_parent,"rho0")
	var _n_ph0 = _S.read(_parent,"ph0")
	var _n_SI = _S.read(_parent,"SI")
	var _n_hgt = _S.read(_parent,"hgt")
	var _n_CT = _S.read(_parent,"CT")
	var _n_ST = _S.read(_parent,"ST")
	var _n_Y = _S.read(_parent,"Y")
	var _n_aa_b0 = _S.arg(_args,0)
	var _n_q_b1 = clampf((float(_n_aa_b0)/_n_L),0.0,1.0)
	var _n_rho_b2 = ((_n_RS + 1) + (((_n_rho0 - _n_RS) - 1) * (1 - pow(_n_q_b1,1.5))))
	var _n_ph_b3 = (_n_ph0 + ((2.4 * pow(_n_q_b1,1.6)) * (1 + (1.5 * _n_q_b1))))
	var _n_X_b4 = (cos(_n_ph_b3) * _n_rho_b2)
	var _n_Z_b5 = (sin(_n_ph_b3) * _n_rho_b2)
	var _n_sx_b6 = _n_X_b4
	var _n_sy_b7 = (((-_n_Z_b5) * _n_SI) + (_n_hgt * (1 - _n_q_b1)))
	return {"x":((_n_sx_b6 * _n_CT) - (_n_sy_b7 * _n_ST)),"y":((_n_Y + (_n_sx_b6 * _n_ST)) + (_n_sy_b7 * _n_CT)),"Z":_n_Z_b5,"rho":_n_rho_b2}
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 > 0.7)) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 > 0.35)) else _S.index_value(_n_C,4)))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _n_ST = _S.read(_parent,"ST")
	var _n_CT = _S.read(_parent,"CT")
	var _n_RS = _S.read(_parent,"RS")
	var _n_disk = _S.read(_parent,"disk")
	var _n_SI = _S.read(_parent,"SI")
	var _n_t = _S.read(_parent,"t")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_dx_b2 = _n_x_b0
	var _n_dy_b3 = (_n_y_b1 - _n_Y)
	var _n_v_b4 = (((-_n_dx_b2) * _n_ST) + (_n_dy_b3 * _n_CT))
	var _n_u_b5 = ((_n_dx_b2 * _n_CT) + (_n_dy_b3 * _n_ST))
	return (not _S.truth((_S.call_value(_n_disk,[_n_u_b5, (float((-_n_v_b4))/_n_SI), _n_t]) if _S.truth((_n_v_b4 > 0)) else (_n_v_b4 > 0))) if _S.truth((((_n_u_b5 * _n_u_b5) + (_n_v_b4 * _n_v_b4)) < pow((_n_RS - 0.6),2))) else (((_n_u_b5 * _n_u_b5) + (_n_v_b4 * _n_v_b4)) < pow((_n_RS - 0.6),2)))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_v_b0 = _S.arg(_args,0)
	return (float((_n_v_b0 + 0.5))/16)
	return null
