@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/whirlpool.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "foam", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Whirlpool"}, {"desc": "Seen from above, dark water winds into a vortex: foam arms spiral in, darkening as they're drawn down into a deep eye with a lit far rim, flecks of foam circling in after them."}, {"tags": ["water", "whirlpool", "vortex", "maelstrom", "swirl", "top-down", "loop"]}, {"size": [128, 84]}, {"origin": [64, 42]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "R", 60)
	_S.define(_e, "SY", 0.6)
	_S.define(_e, "K", 2.4)
	_S.define(_e, "EYE", 0.16)
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_K = _S.read(_parent,"K")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_EYE = _S.read(_parent,"EYE")
	var _n_rho_b0 = _S.arg(_args,0)
	var _n_th_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	var _n_s_b3 = log(maxf(_n_rho_b0,0.02))
	var _n_a_b4 = ((_n_th_b1 + (_n_K * _n_s_b3)) + (_n_ph_b2 * _n_TAU))
	var _n_b_b5 = ((_n_th_b1 + ((_n_K * 1.35) * _n_s_b3)) + ((_n_ph_b2 * _n_TAU) * 2))
	var _n_one_b6 = pow((0.5 + (0.5 * cos(((7 * _n_a_b4) + (0.9 * sin(((3 * _n_a_b4) + (_n_s_b3 * 4)))))))),26)
	var _n_two_b7 = (pow((0.5 + (0.5 * cos(((11 * _n_b_b5) + 1.3)))),34) * 0.7)
	var _n_three_b8 = ((pow((0.5 + (0.5 * cos((17 * ((_n_th_b1 + ((_n_K * 0.8) * _n_s_b3)) + ((_n_ph_b2 * _n_TAU) * 3)))))),30) * 0.8) * maxf(0,(1 - ((_n_rho_b0 - _n_EYE) * 2.2))))
	var _n_dash_b9 = (0.55 + (0.45 * sin((((_n_s_b3 * 22) - ((_n_ph_b2 * _n_TAU) * 4)) + (_n_a_b4 * 2)))))
	return (((_n_one_b6 + _n_two_b7) + _n_three_b8) * _n_dash_b9)
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_R = _S.read(_parent,"R")
	var _n_SY = _S.read(_parent,"SY")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_EYE = _S.read(_parent,"EYE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_n_D)
	var _n_ry_b5 = (_n_R * _n_SY)
	_S.invoke(_n_p_b0,"shade",[(-_n_R), (-_n_ry_b5), _n_R, _n_ry_b5, _S.function_value(_S.capture(_parent,{"ry":_n_ry_b5,"C":_n_C_b3,"p":_n_p_b0,"ph":_n_ph_b4,"this":_this}),"_f2")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 30, _S.named_value(_n_o_b2,"seed"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f3"), _S.function_value(_S.capture(_parent,{"ry":_n_ry_b5,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f4")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 8, (_S.named_value(_n_o_b2,"seed") + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"ry":_n_ry_b5,"ph":_n_ph_b4,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f6")])
	_S.invoke(_n_p_b0,"glow",[0, 0, (_n_R * 0.9), _S.index_value(_n_C_b3,4), 0.2])
	_S.invoke(_n_p_b0,"glow",[0, 0, (((_n_R * _n_EYE) * 1.6) + 6), _S.index_value(_n_C_b3,5), 0.28])
	_S.invoke(_n_p_b0,"glow",[0, (((-_n_ry_b5) * _n_EYE) * 0.8), 14, _S.index_value(_n_C_b3,5), 0.32])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_ry = _S.read(_parent,"ry")
	var _n_EYE = _S.read(_parent,"EYE")
	var _n_C = _S.read(_parent,"C")
	var _n_p = _S.read(_parent,"p")
	var _n_ph = _S.read(_parent,"ph")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_foam = _S.read(_parent,"foam")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (float(_n_x_b0)/_n_R)
	var _n_dy_b4 = (float(_n_y_b1)/_n_ry)
	var _n_rho_b5 = _S.Bridge.hypot([_n_dx_b3, _n_dy_b4])
	if _S.truth((_n_rho_b5 > 1)):
		return null
	var _n_th_b6 = atan2(_n_dy_b4,_n_dx_b3)
	if _S.truth((_n_rho_b5 < _n_EYE)):
		var _n_far_b10 = (float((-_n_dy_b4))/_n_rho_b5)
		var _n_wall_b11 = (float(((float(_n_rho_b5)/_n_EYE) - 0.35))/0.65)
		if _S.truth((_n_far_b10 > 0)):
			_S.set_prop(_n_out_b2,"c",((_S.index_value(_n_C,5) if _S.truth((_n_far_b10 > 0.6)) else _S.index_value(_n_C,4)) if _S.truth((_n_wall_b11 > 0.8)) else (_S.index_value(_n_C,3) if _S.truth((_n_wall_b11 > 0.45)) else (_S.index_value(_n_C,2) if _S.truth((_n_wall_b11 > 0.15)) else _S.index_value(_n_C,0)))),"=")
		else:
			_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,2) if _S.truth(((_n_far_b10 > (-0.5)) if _S.truth((_n_wall_b11 > 0.85)) else (_n_wall_b11 > 0.85))) else _S.index_value(_n_C,0)),"=")
		return null
	var _n_k_b7 = (float((_n_rho_b5 - _n_EYE))/(1 - _n_EYE))
	var _n_fade_b8 = (1 - _S.MathFX.smooth(0.62,1,_n_k_b7))
	_S.invoke(_n_p,"blend",[_n_x_b0, _n_y_b1, (_S.index_value(_n_C,0) if _S.truth((_n_k_b7 < 0.25)) else _S.index_value(_n_C,1)), ((0.75 - (0.25 * _n_k_b7)) * (1 - _S.MathFX.smooth(0.8,1,_n_k_b7)))])
	if _S.truth(((_n_k_b7 < 0.8) if _S.truth((_n_k_b7 > 0.3)) else (_n_k_b7 > 0.3))):
		_S.invoke(_n_p,"blend",[_n_x_b0, _n_y_b1, _S.index_value(_n_C,2), (0.18 * sin((float((PI * (_n_k_b7 - 0.3)))/0.5)))])
	if _S.truth((_n_k_b7 < 0.035)):
		var _n_g_b12 = (0.5 + (0.5 * cos(((_n_th_b6 * 9) - ((_n_ph * _n_TAU) * 6)))))
		_S.set_prop(_n_out_b2,"c",(_n_WHITE if _S.truth((_n_g_b12 > 0.7)) else (_S.index_value(_n_C,6) if _S.truth((_n_g_b12 > 0.3)) else _S.index_value(_n_C,4))),"=")
		return null
	var _n_I_b9 = (((_S.call_value(_n_foam,[_n_rho_b5, _n_th_b6, _n_ph]) * _n_fade_b8) * minf(1,((_n_k_b7 - 0.08) * 4))) * (0.45 + (0.55 * sin((PI * minf(1,(_n_k_b7 * 1.25)))))))
	if _S.truth((_n_I_b9 > 0.12)):
		_S.set_prop(_n_out_b2,"c",(_n_WHITE if _S.truth((_n_I_b9 > 0.75)) else (_S.index_value(_n_C,6) if _S.truth((_n_I_b9 > 0.45)) else (_S.index_value(_n_C,5) if _S.truth((_n_I_b9 > 0.25)) else _S.index_value(_n_C,4)))),"=")
		if _S.truth((_n_I_b9 > 0.25)):
			_S.set_prop(_n_out_b2,"l",_S.index_value(_n_C,5),"=")
			_S.set_prop(_n_out_b2,"k",(0.08 + (0.14 * minf(1,_n_I_b9))),"=")
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[1.2, 2.2])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_K = _S.read(_parent,"K")
	var _n_R = _S.read(_parent,"R")
	var _n_ry = _S.read(_parent,"ry")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_rho_b4 = (0.8 - ((0.62 * _n_u_b3) * _n_u_b3))
	var _n_a0_b5 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_th_b6 = (_n_a0_b5 - (_n_K * log(_n_rho_b4)))
	var _n_ang_b7 = (_n_th_b6 - (_n_age_b0 * (1.5 + (float(2.2)/_n_rho_b4))))
	var _n_x_b8 = ((cos(_n_ang_b7) * _n_rho_b4) * _n_R)
	var _n_y_b9 = ((sin(_n_ang_b7) * _n_rho_b4) * _n_ry)
	var _n_ang2_b10 = (_n_ang_b7 + (float(0.12)/_n_rho_b4))
	var _n_x2_b11 = ((cos(_n_ang2_b10) * _n_rho_b4) * _n_R)
	var _n_y2_b12 = ((sin(_n_ang2_b10) * _n_rho_b4) * _n_ry)
	if _S.truth(((_S.invoke(_n_r_b2,"next",[]) < ((_n_u_b3 - 0.85) * 6)) if _S.truth((_n_u_b3 > 0.85)) else (_n_u_b3 > 0.85))):
		return null
	_S.invoke(_n_p,"line",[_n_x2_b11, _n_y2_b12, _n_x_b8, _n_y_b9, (_S.index_value(_n_C,5) if _S.truth((_n_u_b3 < 0.2)) else (_n_WHITE if _S.truth((_n_u_b3 < 0.6)) else _S.index_value(_n_C,6)))])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.25, 0.45])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n_ry = _S.read(_parent,"ry")
	var _n_foam = _S.read(_parent,"foam")
	var _n_ph = _S.read(_parent,"ph")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_rho_b3 = _S.invoke(_n_r_b2,"range",[0.35, 0.8])
	var _n_th_b4 = (_S.invoke(_n_r_b2,"range",[0, _n_TAU]) - (_n_age_b0 * 2.5))
	var _n_k_b5 = sin((float((PI * _n_age_b0))/_n_life_b1))
	var _n_x_b6 = ((cos(_n_th_b4) * _n_rho_b3) * _n_R)
	var _n_y_b7 = ((sin(_n_th_b4) * _n_rho_b3) * _n_ry)
	if _S.truth((_S.call_value(_n_foam,[_n_rho_b3, _n_th_b4, _n_ph]) < 0.35)):
		return null
	_S.invoke(_n_p,"px",[_n_x_b6, _n_y_b7, _n_WHITE])
	if _S.truth((_n_k_b5 > 0.55)):
		for _iter_0 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
			var _tuple_1 = _iter_0
			var _n_dx_b8 = _S.prop(_tuple_1,0)
			var _n_dy_b9 = _S.prop(_tuple_1,1)
			_S.invoke(_n_p,"px",[(_n_x_b6 + _n_dx_b8), (_n_y_b7 + _n_dy_b9), _S.index_value(_n_C,6)])
	_S.invoke(_n_p,"glow",[_n_x_b6, _n_y_b7, 5, _S.index_value(_n_C,5), (0.4 * _n_k_b5)])
	return null
