@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/frog.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "Swarm", _S.import_value("fx/critters/_lib.js", "Swarm"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "shadow", _S.import_value("fx/critters/_lib.js", "shadow"))
	_S.define(_e, "toss", _S.import_value("fx/critters/_lib.js", "toss"))
	_S.define(_e, "spring", _S.import_value("fx/critters/_lib.js", "spring"))
	_S.define(_e, "pose", _S.function_value(_e, "_f0"))
	_S.define(_e, "fly", _S.function_value(_e, "_f1"))
	_S.define(_e, "frog", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f12"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f13"))
	_S.define(_e, "meta", _S.merge([{"name": "Frog"}, {"desc": "A frog puffs its throat, blinks, crouches and leaps to snap a buzzing fly out of the air, then lands with a squash and a puff of dust, gulps and settles."}, {"tags": ["critter", "frog", "animal", "hop", "ground", "loop"]}, {"size": [112, 88]}, {"origin": [56, 80]}, {"duration": 2.6}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0a160c", "#173a18", "#256024", "#3a8a2e", "#62b440", "#a8e070", "#e8ffc0"]}, {"belly": ["#5e5a24", "#bdb45a", "#efe9a8"]}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 22), _S.unary("-", 40), 44, 44]))
	_S.define(_e, "SWARM", _S.construct(_S.read(_e, "Swarm"), []))
	_S.define(_e, "T_CROUCH", 0.95)
	_S.define(_e, "T_UP", 1.2)
	_S.define(_e, "T_LAND", 1.62)
	_S.define(_e, "T_SNAP", 1.4)
	_S.define(_e, "T_BACK", 1.95)
	_S.define(_e, "G", 1000)
	_S.define(_e, "HOP", _S.binary("/", _S.binary("*", _S.read(_e, "G"), _S.binary("**", _S.binary("-", _S.read(_e, "T_LAND"), _S.read(_e, "T_UP")), 2)), 8))
	_S.define(_e, "EYE", _S.invoke(["#3a2a08", "#c89420", "#ffd860"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "TONGUE", _S.call_value(_S.read(_e, "hex"), ["#e8607a"]))
	_S.define(_e, "FLY", _S.call_value(_S.read(_e, "hex"), ["#141018"]))
	_S.define(_e, "WINGS", _S.call_value(_S.read(_e, "hex"), ["#c8d0e0"]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), ["#8a7f92"]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_T_LAND = _S.read(_parent,"T_LAND")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_T_CROUCH = _S.read(_parent,"T_CROUCH")
	var _n_T_UP = _S.read(_parent,"T_UP")
	var _n_ease = _S.read(_parent,"ease")
	var _n_HOP = _S.read(_parent,"HOP")
	var _n_spring = _S.read(_parent,"spring")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_by_b1 = 0
	var _n_rot_b2 = 0
	var _n_sq_b3 = 0
	var _n_leg_b4 = 0
	var _n_throat_b5 = 0
	var _n_shut_b6 = 0
	var _n_age_b7 = _S.call_value(_n_wrap,[(_n_t_b0 - _n_T_LAND), _n_D])
	for _iter_0 in _S.array([[0.05, 0.45], [0.5, 0.85], [1.75, 1.95]]):
		var _tuple_1 = _iter_0
		var _n_a_b8 = _S.prop(_tuple_1,0)
		var _n_b_b9 = _S.prop(_tuple_1,1)
		if _S.truth(((_n_t_b0 < _n_b_b9) if _S.truth((_n_t_b0 > _n_a_b8)) else (_n_t_b0 > _n_a_b8))):
			_n_throat_b5 = (pow(sin((PI * (float((_n_t_b0 - _n_a_b8))/(_n_b_b9 - _n_a_b8)))),0.7) * (0.6 if _S.truth((_n_a_b8 > 1)) else 1))
	if _S.truth(((_n_t_b0 < 0.95) if _S.truth((_n_t_b0 > 0.88)) else (_n_t_b0 > 0.88))):
		_n_shut_b6 = 1
	if _S.truth(((_n_t_b0 < _n_T_UP) if _S.truth((_n_t_b0 >= _n_T_CROUCH)) else (_n_t_b0 >= _n_T_CROUCH))):
		var _n_u_b10 = _S.invoke(_n_ease,"inOutSine",[_S.MathFX.seg(_n_t_b0,_n_T_CROUCH,_n_T_UP)])
		_n_sq_b3 = ((-0.18) * _n_u_b10)
		_n_rot_b2 = ((-0.12) * _n_u_b10)
	else:
		if _S.truth(((_n_t_b0 < _n_T_LAND) if _S.truth((_n_t_b0 >= _n_T_UP)) else (_n_t_b0 >= _n_T_UP))):
			var _n_q_b11 = (float((_n_t_b0 - _n_T_UP))/(_n_T_LAND - _n_T_UP))
			_n_by_b1 = ((((-_n_HOP) * 4) * _n_q_b11) * (1 - _n_q_b11))
			_n_rot_b2 = _S.numeric_lerp(0.42,(-0.25),_n_q_b11)
			_n_sq_b3 = _S.numeric_lerp(0.18,0.02,minf(1,(_n_q_b11 * 2)))
			_n_leg_b4 = (1 if _S.truth((_n_q_b11 < 0.75)) else (1 - (float((_n_q_b11 - 0.75))/0.25)))
		else:
			_n_sq_b3 = ((-0.24) * _S.call_value(_n_spring,[_n_age_b7, 2.4, 6.5]))
			_n_rot_b2 = ((-0.08) * exp(((-_n_age_b7) * 6)))
	return {"by":_n_by_b1,"rot":_n_rot_b2,"sq":_n_sq_b3,"leg":_n_leg_b4,"throat":_n_throat_b5,"shut":_n_shut_b6,"air":((_n_t_b0 < _n_T_LAND) if _S.truth((_n_t_b0 >= _n_T_UP)) else (_n_t_b0 >= _n_T_UP))}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_T_SNAP = _S.read(_parent,"T_SNAP")
	var _n_T_BACK = _S.read(_parent,"T_BACK")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t_b0 = _S.arg(_args,0)
	if _S.truth(((_n_t_b0 < _n_T_BACK) if _S.truth((_n_t_b0 > _n_T_SNAP)) else (_n_t_b0 > _n_T_SNAP))):
		return null
	var _n_a_b1 = (((float(_n_t_b0)/_n_D) * _n_TAU) * 3)
	var _n_home_b2 = [(16 + (6 * sin(_n_a_b1))), ((-40) + (3 * sin((2 * _n_a_b1))))]
	var _n_inn_b3 = _S.call_value(_n_wrap,[(_n_t_b0 - _n_T_BACK), _n_D])
	if _S.truth((_n_inn_b3 < 0.45)):
		var _n_u_b4 = _S.invoke(_n_ease,"outCubic",[(float(_n_inn_b3)/0.45)])
		return [_S.numeric_lerp((-52),_S.index_value(_n_home_b2,0),_n_u_b4), (_S.numeric_lerp((-46),_S.index_value(_n_home_b2,1),_n_u_b4) + (sin((_n_inn_b3 * 30)) * 1.5))]
	return _n_home_b2
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_Bl_b2 = _S.arg(_args,2)
	var _n_Pz_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	_S.invoke(_n_g_b0,"clear",[])
	var _n_cs_b5 = cos(_S.named_value(_n_Pz_b3,"rot"))
	var _n_sn_b6 = sin(_S.named_value(_n_Pz_b3,"rot"))
	var _n_sx_b7 = (1 + (_S.named_value(_n_Pz_b3,"sq") * (-0.6)))
	var _n_sy_b8 = (1 + _S.named_value(_n_Pz_b3,"sq"))
	var _n_local_b9 = _S.function_value(_S.capture(_parent,{"cs":_n_cs_b5,"sn":_n_sn_b6,"sx":_n_sx_b7,"sy":_n_sy_b8,"this":_this}),"_f3")
	var _n_inBody_b10 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f4")
	var _n_inEye_b11 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f5")
	var _n_lit_b12 = _S.function_value(_S.capture(_parent,{"inBody":_n_inBody_b10,"this":_this}),"_f6")
	_S.invoke(_n_g_b0,"shade",[(-15), (-22), 15, 1, _S.function_value(_S.capture(_parent,{"local":_n_local_b9,"inBody":_n_inBody_b10,"inEye":_n_inEye_b11,"Pz":_n_Pz_b3,"C":_n_C_b1,"Bl":_n_Bl_b2,"lit":_n_lit_b12,"this":_this}),"_f7")])
	var _n_legs_b13 = []
	if _S.truth((_S.named_value(_n_Pz_b3,"leg") < 0.5)):
		_S.invoke(_n_g_b0,"ellipse",[(-7.5), ((-4.5) + ((1 - _n_sy_b8) * 3)), 5, 3.6, _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"this":_this}),"_f8")])
		_S.invoke(_n_legs_b13,"push",[[[(-4), (-1.5)], [(-9), (-1)], [(-3), (-0.5)], [4, (-0.5)]]])
	else:
		var _n_ex_b15 = ((-8) - (10 * _S.named_value(_n_Pz_b3,"leg")))
		var _n_ey_b16 = (4 + (6 * _S.named_value(_n_Pz_b3,"leg")))
		_S.invoke(_n_legs_b13,"push",[[[(-6), (-5)], [(-10), 0], [_n_ex_b15, _n_ey_b16], [(_n_ex_b15 - 5), (_n_ey_b16 + 2)]]])
	for _iter_0 in _S.array(_n_legs_b13):
		var _n_L_b17 = _iter_0
		_S.invoke(_n_g_b0,"tube",[_n_L_b17, _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"this":_this}),"_f10")])
		var _tuple_1 = _S.index_value(_n_L_b17,(_S.prop(_n_L_b17,"length") - 1))
		var _n_fx_b18 = _S.prop(_tuple_1,0)
		var _n_fy_b19 = _S.prop(_tuple_1,1)
		var _tuple_2 = _S.index_value(_n_L_b17,(_S.prop(_n_L_b17,"length") - 2))
		var _n_px_b20 = _S.prop(_tuple_2,0)
		var _n_py_b21 = _S.prop(_tuple_2,1)
		var _n_dx_b22 = (_n_fx_b18 - _n_px_b20)
		var _n_dy_b23 = (_n_fy_b19 - _n_py_b21)
		var _n_l_b24 = _S.logical("||",_S.Bridge.hypot([_n_dx_b22, _n_dy_b23]),func():return 1)
		for _iter_3 in _S.array([(-1), 0, 1]):
			var _n_k_b25 = _iter_3
			_S.invoke(_n_g_b0,"line",[_n_fx_b18, _n_fy_b19, ((_n_fx_b18 + ((float(_n_dx_b22)/_n_l_b24) * 2)) - (((float(_n_dy_b23)/_n_l_b24) * _n_k_b25) * 1.6)), ((_n_fy_b19 + ((float(_n_dy_b23)/_n_l_b24) * 2)) + (((float(_n_dx_b22)/_n_l_b24) * _n_k_b25) * 1.6)), _S.index_value(_n_C_b1,3)])
	if _S.truth(not _S.truth(_S.named_value(_n_Pz_b3,"shut"))):
		var _tuple_4 = [4.6, (-14.4)]
		var _n_gx_b26 = _S.prop(_tuple_4,0)
		var _n_gy_b27 = _S.prop(_tuple_4,1)
		var _n_X_b28 = ((_n_gx_b26 * _n_cs_b5) - (((_n_gy_b27 + 7) * _n_sn_b6) * 1))
		var _n_Y_b29 = (((_n_gx_b26 * _n_sn_b6) + ((_n_gy_b27 + 7) * _n_cs_b5)) - 7)
		_S.invoke(_n_g_b0,"set",[_n_X_b28, _n_Y_b29, _S.index_value(_n_C_b1,6)])
	if true:
		var _n_u_b30 = 3
		while _S.truth((_n_u_b30 <= 11)):
			var _n_v_b31 = ((-7.8) + ((_n_u_b30 - 3) * 0.05))
			var _n_X_b32 = (((_n_u_b30 * _n_sx_b7) * _n_cs_b5) - (((_n_v_b31 + 7) * _n_sy_b8) * _n_sn_b6))
			var _n_Y_b33 = ((((_n_u_b30 * _n_sx_b7) * _n_sn_b6) + (((_n_v_b31 + 7) * _n_sy_b8) * _n_cs_b5)) - 7)
			_S.invoke(_n_g_b0,"set",[_n_X_b32, _n_Y_b33, _S.index_value(_n_C_b1,1)])
			_n_u_b30 += 1.0
	var _n_fl_b14 = ([[7, (-4)], [9, (-1)]] if _S.truth(_S.named_value(_n_Pz_b3,"air")) else [[7, (-4)], [8, (-0.5)]])
	_S.invoke(_n_g_b0,"line",[_S.index_value(_S.index_value(_n_fl_b14,0),0), _S.index_value(_S.index_value(_n_fl_b14,0),1), _S.index_value(_S.index_value(_n_fl_b14,1),0), _S.index_value(_S.index_value(_n_fl_b14,1),1), _S.index_value(_n_C_b1,3)])
	_S.invoke(_n_g_b0,"set",[(_S.index_value(_S.index_value(_n_fl_b14,1),0) + 1), _S.index_value(_S.index_value(_n_fl_b14,1),1), _S.index_value(_n_C_b1,3)])
	_S.invoke(_n_g_b0,"set",[(_S.index_value(_S.index_value(_n_fl_b14,1),0) - 1), _S.index_value(_S.index_value(_n_fl_b14,1),1), _S.index_value(_n_C_b1,3)])
	if _S.truth((_S.named_value(_n_Pz_b3,"throat") > 0.05)):
		var _n_r_b34 = (0.8 + (2.8 * _S.named_value(_n_Pz_b3,"throat")))
		var _n_cx_b35 = 7
		var _n_cy_b36 = ((-5.2) + (_n_r_b34 * 0.25))
		_S.invoke(_n_g_b0,"ellipse",[_n_cx_b35, _n_cy_b36, (_n_r_b34 * 1.1), _n_r_b34, _S.function_value(_S.capture(_parent,{"Bl":_n_Bl_b2,"C":_n_C_b1,"this":_this}),"_f11"), 0.9])
		_S.invoke(_n_g_b0,"set",[(_n_cx_b35 - (_n_r_b34 * 0.4)), (_n_cy_b36 - (_n_r_b34 * 0.45)), _S.index_value(_n_C_b1,6)])
	_S.invoke(_n_g_b0,"outline",[_S.index_value(_n_C_b1,0)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_cs = _S.read(_parent,"cs")
	var _n_sn = _S.read(_parent,"sn")
	var _n_sx = _S.read(_parent,"sx")
	var _n_sy = _S.read(_parent,"sy")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_dx_b2 = _n_x_b0
	var _n_dy_b3 = (_n_y_b1 + 7)
	return [(float(((_n_dx_b2 * _n_cs) + (_n_dy_b3 * _n_sn)))/_n_sx), ((float((((-_n_dx_b2) * _n_sn) + (_n_dy_b3 * _n_cs)))/_n_sy) - 7)]
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (((pow((float((_n_x_b0 + 1))/10.5),2) + pow((float((_n_y_b1 + 7))/6),2)) <= 1) if _S.truth(((pow((float((_n_x_b0 + 1))/10.5),2) + pow((float((_n_y_b1 + 7))/6),2)) <= 1)) else ((pow((float((_n_x_b0 - 6))/6.2),2) + pow((float((_n_y_b1 + 8.6))/4.8),2)) <= 1))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return ((pow((_n_x_b0 - 5.5),2) + pow((_n_y_b1 + 13.2),2)) <= pow(3.2,2))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_inBody = _S.read(_parent,"inBody")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	return _S.call_value(_n_inBody,[((-4) + (float((_n_x_b0 + 4))/_n_k_b2)), ((-13) + (float((_n_y_b1 + 13))/_n_k_b2))])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_local = _S.read(_parent,"local")
	var _n_inBody = _S.read(_parent,"inBody")
	var _n_inEye = _S.read(_parent,"inEye")
	var _n_Pz = _S.read(_parent,"Pz")
	var _n_C = _S.read(_parent,"C")
	var _n_EYE = _S.read(_parent,"EYE")
	var _n_Bl = _S.read(_parent,"Bl")
	var _n_lit = _S.read(_parent,"lit")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_local,[_n_x_b0, _n_y_b1])
	var _n_u_b2 = _S.prop(_tuple_0,0)
	var _n_v_b3 = _S.prop(_tuple_0,1)
	if _S.truth(_S.logical("&&",not _S.truth(_S.call_value(_n_inBody,[_n_u_b2, _n_v_b3])),func():return not _S.truth(_S.call_value(_n_inEye,[_n_u_b2, _n_v_b3])))):
		return 0
	if _S.truth(_S.call_value(_n_inEye,[_n_u_b2, _n_v_b3])):
		var _n_d_b4 = _S.Bridge.hypot([(_n_u_b2 - 5.5), (_n_v_b3 - (13.2 * (-1)))])
		if _S.truth(_S.named_value(_n_Pz,"shut")):
			return (_S.index_value(_n_C,4) if _S.truth((_n_v_b3 < (-13.2))) else _S.index_value(_n_C,3))
		if _S.truth(_S.logical("&&",(absf((_n_v_b3 + 13)) < 0.7),func():return (absf((_n_u_b2 - 6)) < 1.8))):
			return _S.index_value(_n_C,0)
		if _S.truth(((_n_v_b3 < (-14)) if _S.truth((_n_u_b2 < 4.7)) else (_n_u_b2 < 4.7))):
			return _S.index_value(_n_EYE,2)
		return (_S.index_value(_n_EYE,1) if _S.truth((_n_d_b4 < 2.4)) else _S.index_value(_n_EYE,0))
	if _S.truth(((_n_u_b2 > (-6)) if _S.truth((_n_v_b3 > (-5))) else (_n_v_b3 > (-5)))):
		return (_S.index_value(_n_Bl,1) if _S.truth((_n_v_b3 > (-3))) else _S.index_value(_n_Bl,2))
	for _iter_1 in _S.array([[(-5), (-10), 1.6], [0, (-11.5), 1.3], [(-8), (-7), 1.2], [3, (-12.5), 0.9]]):
		var _tuple_2 = _iter_1
		var _n_px_b5 = _S.prop(_tuple_2,0)
		var _n_py_b6 = _S.prop(_tuple_2,1)
		var _n_r_b7 = _S.prop(_tuple_2,2)
		if _S.truth((_S.Bridge.hypot([(_n_u_b2 - _n_px_b5), (_n_v_b3 - _n_py_b6)]) < _n_r_b7)):
			return _S.index_value(_n_C,2)
	if _S.truth(not _S.truth(_S.call_value(_n_inBody,[(_n_u_b2 + 2), (_n_v_b3 + 2.4)]))):
		return _S.index_value(_n_C,2)
	return (_S.index_value(_n_C,5) if _S.truth(_S.call_value(_n_lit,[_n_u_b2, _n_v_b3, 0.5])) else (_S.index_value(_n_C,4) if _S.truth(_S.call_value(_n_lit,[_n_u_b2, _n_v_b3, 0.8])) else _S.index_value(_n_C,3)))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_nx_b0 = _S.arg(_args,0)
	var _n_ny_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_C,4) if _S.truth((((_n_nx_b0 * (-0.6)) + (_n_ny_b1 * (-0.8))) > 0.35)) else (_S.index_value(_n_C,2) if _S.truth((_n_ny_b1 > 0.4)) else _S.index_value(_n_C,3)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return _S.numeric_lerp(2,0.7,_n_u_b0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_C,2) if _S.truth((_n_v_b1 > 0.55)) else (_S.index_value(_n_C,3) if _S.truth((_n_u_b0 > 0.66)) else _S.index_value(_n_C,4)))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_Bl = _S.read(_parent,"Bl")
	var _n_C = _S.read(_parent,"C")
	var _n_nx_b0 = _S.arg(_args,0)
	var _n_ny_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_Bl,2) if _S.truth((((_n_nx_b0 * (-0.6)) + (_n_ny_b1 * (-0.8))) > 0.55)) else (_S.index_value(_n_Bl,1) if _S.truth((_n_ny_b1 > 0.5)) else _S.ColorFX.mix(_S.index_value(_n_Bl,2),_S.index_value(_n_C,5),0.4)))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_pose = _S.read(_parent,"pose")
	var _n_GRID = _S.read(_parent,"GRID")
	var _n_frog = _S.read(_parent,"frog")
	var _n_T_SNAP = _S.read(_parent,"T_SNAP")
	var _n_fly = _S.read(_parent,"fly")
	var _n_TONGUE = _S.read(_parent,"TONGUE")
	var _n_FLY = _S.read(_parent,"FLY")
	var _n_WINGS = _S.read(_parent,"WINGS")
	var _n_SWARM = _S.read(_parent,"SWARM")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_P = _S.read(_parent,"P")
	var _n_DUST = _S.read(_parent,"DUST")
	var _n_toss = _S.read(_parent,"toss")
	var _n_hex = _S.read(_parent,"hex")
	var _n_T_UP = _S.read(_parent,"T_UP")
	var _n_T_LAND = _S.read(_parent,"T_LAND")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_Bl_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"belly"),3)
	var _n_Pz_b6 = _S.call_value(_n_pose,[_n_t_b3])
	var _n_g_b7 = _n_GRID
	_S.call_value(_n_frog,[_n_g_b7, _n_C_b4, _n_Bl_b5, _n_Pz_b6, _n_t_b3])
	_S.invoke(_n_g_b7,"draw",[_n_p_b0, 1, 0, floori(_S.named_value(_n_Pz_b6,"by")+0.5)])
	var _n_ts_b8 = (float(((_n_t_b3 - _n_T_SNAP) + 0.06))/0.14)
	if _S.truth(((_n_ts_b8 < 1) if _S.truth((_n_ts_b8 > 0)) else (_n_ts_b8 > 0))):
		var _n_f_b11 = _S.call_value(_n_fly,[(_n_T_SNAP - 0.001)])
		var _n_e_b12 = sin((PI * _n_ts_b8))
		var _n_mx_b13 = 11
		var _n_my_b14 = (_S.named_value(_n_Pz_b6,"by") - 8)
		var _n_x1_b15 = _S.numeric_lerp(_n_mx_b13,_S.index_value(_n_f_b11,0),_n_e_b12)
		var _n_y1_b16 = _S.numeric_lerp(_n_my_b14,_S.index_value(_n_f_b11,1),_n_e_b12)
		_S.invoke(_n_p_b0,"line",[_n_mx_b13, _n_my_b14, _n_x1_b15, _n_y1_b16, _n_TONGUE])
		_S.invoke(_n_p_b0,"line",[_n_mx_b13, (_n_my_b14 + 1), _n_x1_b15, (_n_y1_b16 + 1), _S.ColorFX.mix(_n_TONGUE,_S.index_value(_n_C_b4,0),0.4)])
		_S.invoke(_n_p_b0,"circle",[_n_x1_b15, _n_y1_b16, 1.4, _n_TONGUE])
	var _n_f_b9 = _S.call_value(_n_fly,[_n_t_b3])
	if _S.truth(_n_f_b9):
		var _n_flap_b17 = (sin((_n_t_b3 * 90)) > 0)
		_S.invoke(_n_p_b0,"px",[_S.index_value(_n_f_b9,0), _S.index_value(_n_f_b9,1), _n_FLY])
		_S.invoke(_n_p_b0,"px",[(_S.index_value(_n_f_b9,0) + 1), _S.index_value(_n_f_b9,1), _n_FLY])
		_S.invoke(_n_p_b0,"dot",[_S.index_value(_n_f_b9,0), (_S.index_value(_n_f_b9,1) - (1 if _S.truth(_n_flap_b17) else 0)), _n_WINGS, 0.8])
		_S.invoke(_n_p_b0,"dot",[(_S.index_value(_n_f_b9,0) + 1), (_S.index_value(_n_f_b9,1) - (0 if _S.truth(_n_flap_b17) else 1)), _n_WINGS, 0.8])
		_S.invoke(_n_p_b0,"glow",[_S.index_value(_n_f_b9,0), _S.index_value(_n_f_b9,1), 3, _n_WINGS, 0.15])
	var _n_sw_b10 = _S.invoke(_n_SWARM,"begin",[_n_t_b3])
	for _iter_0 in _S.array([[_n_T_UP, 7, 0.6], [_n_T_LAND, 18, 1]]):
		var _tuple_1 = _iter_0
		var _n_t0_b18 = _S.prop(_tuple_1,0)
		var _n_n_b19 = _S.prop(_tuple_1,1)
		var _n_pow_b20 = _S.prop(_tuple_1,2)
		var _n_age_b21 = _S.call_value(_n_wrap,[(_n_t_b3 - _n_t0_b18), _n_D])
		if true:
			var _n_i_b22 = 0
			while _S.truth((_n_i_b22 < _n_n_b19)):
				var _n_r_b23 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),_n_i_b22,(_n_t0_b18 * 100)])
				var _n_L_b24 = (_S.invoke(_n_r_b23,"range",[0.6, 1.1]) * _n_pow_b20)
				if _S.truth((_n_age_b21 > _n_L_b24)):
					_n_i_b22 += 1.0
					continue
				var _n_s_b25 = _S.invoke(_n_r_b23,"sign",[])
				var _n_v_b26 = (_S.invoke(_n_r_b23,"range",[24, 70]) * _n_pow_b20)
				var _n_x_b27 = (_n_s_b25 * (7 + ((float(_n_v_b26)/3.5) * (1 - exp(((-_n_age_b21) * 3.5))))))
				var _n_y_b28 = ((-1.5) - (_S.invoke(_n_r_b23,"range",[1, 5]) * _n_age_b21))
				_S.invoke(_n_sw_b10,"add",[_S.named_value(_n_P,"SMOKE"), _n_x_b27, _n_y_b28, 0, 0, _n_age_b21, _n_L_b24, _n_DUST, (_S.invoke(_n_r_b23,"range",[2.2, 4.2]) * (0.65 + (0.35 * _n_pow_b20))), 2])
				_n_i_b22 += 1.0
		if _S.truth(_S.binary("===",_n_pow_b20,1)):
			if true:
				var _n_i_b29 = 0
				while _S.truth((_n_i_b29 < 8)):
					var _n_r_b30 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),_n_i_b29,909])
					var _n_b_b31 = _S.call_value(_n_toss,[_S.invoke(_n_r_b30,"range",[(-8), 8]), (-1), _S.invoke(_n_r_b30,"range",[(-40), 40]), (-_S.invoke(_n_r_b30,"range",[30, 70])), _n_age_b21, 700, (-0.5)])
					if _S.truth((_n_age_b21 < 0.7)):
						_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_b_b31,"x"), _S.named_value(_n_b_b31,"y"), (_S.call_value(_n_hex,["#6a6074"]) if _S.truth(fmod(_n_i_b29,2)) else _S.call_value(_n_hex,["#9a90a4"])), ((1.4 - (_n_age_b21 * 2)) if _S.truth(_S.named_value(_n_b_b31,"landed")) else 1)])
					_n_i_b29 += 1.0
	_S.invoke(_n_sw_b10,"draw",[_n_p_b0])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_pose = _S.read(_parent,"pose")
	var _n_HOP = _S.read(_parent,"HOP")
	var _n_shadow = _S.read(_parent,"shadow")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_Pz_b5 = _S.call_value(_n_pose,[_n_t_b3])
	var _n_hgt_b6 = clampf((float((-_S.named_value(_n_Pz_b5,"by")))/_n_HOP),0.0,1.0)
	_S.call_value(_n_shadow,[_n_p_b0, 0, (-0.2), (13 * (1 - (0.35 * _n_hgt_b6))), 1.6, _S.index_value(_n_C_b4,0), (0.6 - (0.3 * _n_hgt_b6))])
	return null
