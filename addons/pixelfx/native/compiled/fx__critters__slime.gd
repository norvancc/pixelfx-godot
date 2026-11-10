@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/slime.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "curve", _S.import_value("fx/critters/_lib.js", "curve"))
	_S.define(_e, "spring", _S.import_value("fx/critters/_lib.js", "spring"))
	_S.define(_e, "toss", _S.import_value("fx/critters/_lib.js", "toss"))
	_S.define(_e, "lnoise", _S.import_value("fx/critters/_lib.js", "lnoise"))
	_S.define(_e, "pose", _S.function_value(_e, "_f0"))
	_S.define(_e, "halfW", _S.function_value(_e, "_f1"))
	_S.define(_e, "body", _S.function_value(_e, "_f2"))
	_S.define(_e, "face", _S.function_value(_e, "_f5"))
	_S.define(_e, "bubbleIn", _S.function_value(_e, "_f6"))
	_S.define(_e, "droplet", _S.function_value(_e, "_f7"))
	_S.define(_e, "puddleR", _S.function_value(_e, "_f8"))
	_S.define(_e, "draw", _S.function_value(_e, "_f9"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f13"))
	_S.define(_e, "meta", _S.merge([{"name": "Slime"}, {"desc": "A glossy slime hops in place: it squashes to wind up, stretches into the jump, rounds out in the air, splats down flinging droplets that creep back, then wobbles and blinks."}, {"tags": ["critter", "slime", "monster", "hop", "goo", "loop"]}, {"size": [112, 88]}, {"origin": [56, 72]}, {"duration": 1.8}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#061412", "#0b2f2b", "#12594a", "#1f8f4f", "#47c752", "#a6f06a", "#f0ffd2"]}, {"hop": 24}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 30), _S.unary("-", 64), 60, 66]))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "T_SQ", 0.5)
	_S.define(_e, "T_UP", 0.84)
	_S.define(_e, "T_LIFT", 0.9)
	_S.define(_e, "T_LAND", 1.44)
	_S.define(_e, "SNAP", 0.965)
	_S.define(_e, "W0", 30)
	_S.define(_e, "H0", 22)
	_S.define(_e, "VC", 0.4)
	_S.define(_e, "G", 640)
	_S.define(_e, "NDROP", 12)
	_S.define(_e, "inside", _S.function_value(_e, "_f16"))
	_S.define(_e, "POP", 0.4)
	_exports["draw"] = _S.read(_e, "draw")
	_S.define(_e, "DRIPS", [[1.02, _S.unary("-", 4)], [1.18, 3]])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_T_LAND = _S.read(_parent,"T_LAND")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_T_LIFT = _S.read(_parent,"T_LIFT")
	var _n_curve = _S.read(_parent,"curve")
	var _n_T_UP = _S.read(_parent,"T_UP")
	var _n_ease = _S.read(_parent,"ease")
	var _n_T_SQ = _S.read(_parent,"T_SQ")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_spring = _S.read(_parent,"spring")
	var _n_W0 = _S.read(_parent,"W0")
	var _n_H0 = _S.read(_parent,"H0")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_hop_b1 = _S.arg(_args,1)
	var _n_age_b2 = _S.call_value(_n_wrap,[(_n_t_b0 - _n_T_LAND), _n_D])
	var _n_s_b3 = null
	var _n_by_b4 = 0
	var _n_lean_b5 = 0
	var _n_round_b6 = 0.1
	var _n_q_b7 = (-1)
	if _S.truth(((_n_t_b0 < _n_T_LAND) if _S.truth((_n_t_b0 >= _n_T_LIFT)) else (_n_t_b0 >= _n_T_LIFT))):
		_n_q_b7 = (float((_n_t_b0 - _n_T_LIFT))/(_n_T_LAND - _n_T_LIFT))
		_n_by_b4 = ((((-_n_hop_b1) * 4) * _n_q_b7) * (1 - _n_q_b7))
		_n_s_b3 = _S.call_value(_n_curve,[_n_q_b7, [[0, 0.36], [0.4, 0.02], [0.55, (-0.05)], [0.85, 0.08], [1, 0.16]]])
		_n_round_b6 = (0.1 + ((0.8 * _S.MathFX.smooth(0,0.16,_n_q_b7)) * (1 - _S.MathFX.smooth(0.86,1,_n_q_b7))))
	else:
		if _S.truth(((_n_t_b0 < _n_T_LIFT) if _S.truth((_n_t_b0 >= _n_T_UP)) else (_n_t_b0 >= _n_T_UP))):
			_n_s_b3 = _S.numeric_lerp((-0.3),0.36,_S.invoke(_n_ease,"outCubic",[_S.MathFX.seg(_n_t_b0,_n_T_UP,_n_T_LIFT)]))
		else:
			if _S.truth(((_n_t_b0 < _n_T_UP) if _S.truth((_n_t_b0 >= _n_T_SQ)) else (_n_t_b0 >= _n_T_SQ))):
				var _n_u_b8 = _S.MathFX.seg(_n_t_b0,_n_T_SQ,_n_T_UP)
				_n_s_b3 = (((-0.3) * _S.invoke(_n_ease,"inOutSine",[_n_u_b8])) + ((0.018 * sin(((_n_t_b0 * _n_TAU) * 16))) * _S.MathFX.smooth(0.55,1,_n_u_b8)))
			else:
				_n_s_b3 = ((-0.46) if _S.truth((_n_age_b2 < 0.06)) else ((-0.46) * _S.call_value(_n_spring,[(_n_age_b2 - 0.06), 2.1, 4.6])))
				_n_lean_b5 = ((0.07 * exp(((-_n_age_b2) * 4))) * sin(((_n_age_b2 * _n_TAU) * 1.9)))
				if _S.truth((_n_t_b0 < _n_T_SQ)):
					_n_s_b3 += (0.02 * sin(((float(_n_t_b0)/_n_T_SQ) * _n_TAU)))
	return {"s":_n_s_b3,"by":_n_by_b4,"lean":_n_lean_b5,"round":_n_round_b6,"q":_n_q_b7,"age":_n_age_b2,"W":(float(_n_W0)/sqrt((1 + _n_s_b3))),"H":(_n_H0 * (1 + _n_s_b3))}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_VC = _S.read(_parent,"VC")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_P_b1 = _S.arg(_args,1)
	if _S.truth(((_n_v_b0 < 0) if _S.truth((_n_v_b0 < 0)) else (_n_v_b0 > 1))):
		return (-1)
	var _object_0 = _n_P_b1
	var _n_W_b2 = _S.named_value(_object_0,"W")
	var _n_H_b3 = _S.named_value(_object_0,"H")
	var _n_round_b4 = _S.named_value(_object_0,"round")
	if _S.truth((_n_v_b0 >= _n_VC)):
		var _n_q_b9 = (float((_n_v_b0 - _n_VC))/(1 - _n_VC))
		return ((float(_n_W_b2)/2) * sqrt((1 - (_n_q_b9 * _n_q_b9))))
	var _n_q_b5 = (float((_n_VC - _n_v_b0))/_n_VC)
	var _n_hb_b6 = (_n_v_b0 * _n_H_b3)
	var _n_rc_b7 = 3
	var _n_hw_b8 = ((float(_n_W_b2)/2) * sqrt(maxf(0,(1 - ((_n_round_b4 * _n_q_b5) * _n_q_b5)))))
	if _S.truth((_n_hb_b6 < _n_rc_b7)):
		_n_hw_b8 -= (_n_rc_b7 - sqrt(((_n_rc_b7 * _n_rc_b7) - pow((_n_rc_b7 - _n_hb_b6),2))))
	return _n_hw_b8
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_inside = _S.read(_parent,"inside")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_P_b2 = _S.arg(_args,2)
	var _n_yb_b3 = (_S.named_value(_n_P_b2,"by") - 1)
	var _n_half_b4 = ((float(_S.named_value(_n_P_b2,"W"))/2) + 3)
	var _n_cx_b5 = ((_S.named_value(_n_P_b2,"lean") * 0.45) * _S.named_value(_n_P_b2,"H"))
	var _n_cy_b6 = (_n_yb_b3 - (_S.named_value(_n_P_b2,"H") * 0.5))
	var _n_lx_b7 = (_n_cx_b5 - (_S.named_value(_n_P_b2,"W") * 0.24))
	var _n_ly_b8 = (_n_cy_b6 - (_S.named_value(_n_P_b2,"H") * 0.36))
	var _n_lit_b9 = _S.function_value(_S.capture(_parent,{"P":_n_P_b2,"lx":_n_lx_b7,"ly":_n_ly_b8,"this":_this}),"_f3")
	_S.invoke(_n_g_b0,"clear",[])
	_S.invoke(_n_g_b0,"shade",[(-_n_half_b4), ((_n_yb_b3 - _S.named_value(_n_P_b2,"H")) - 1), _n_half_b4, _n_yb_b3, _S.function_value(_S.capture(_parent,{"P":_n_P_b2,"lit":_n_lit_b9,"yb":_n_yb_b3,"cy":_n_cy_b6,"cx":_n_cx_b5,"C":_n_C_b1,"this":_this}),"_f4")])
	var _n_hx_b10 = floori((_n_cx_b5 - (_S.named_value(_n_P_b2,"W") * 0.27))+0.5)
	var _n_hy_b11 = floori((_n_cy_b6 - (_S.named_value(_n_P_b2,"H") * 0.14))+0.5)
	if _S.truth(_S.logical("&&",_S.call_value(_n_inside,[_n_P_b2, (_n_hx_b10 - 1), _n_hy_b11]),func():return _S.call_value(_n_inside,[_n_P_b2, (_n_hx_b10 + 1), (_n_hy_b11 + 1)]))):
		_S.invoke(_n_g_b0,"set",[_n_hx_b10, _n_hy_b11, _S.index_value(_n_C_b1,6)])
		_S.invoke(_n_g_b0,"set",[_n_hx_b10, (_n_hy_b11 + 1), _S.index_value(_n_C_b1,5)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_inside = _S.read(_parent,"inside")
	var _n_P = _S.read(_parent,"P")
	var _n_lx = _S.read(_parent,"lx")
	var _n_ly = _S.read(_parent,"ly")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	return _S.call_value(_n_inside,[_n_P, (_n_lx + (float((_n_x_b0 - _n_lx))/_n_k_b2)), (_n_ly + (float((_n_y_b1 - _n_ly))/_n_k_b2))])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_inside = _S.read(_parent,"inside")
	var _n_P = _S.read(_parent,"P")
	var _n_lit = _S.read(_parent,"lit")
	var _n_yb = _S.read(_parent,"yb")
	var _n_cy = _S.read(_parent,"cy")
	var _n_cx = _S.read(_parent,"cx")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	if _S.truth(not _S.truth(_S.call_value(_n_inside,[_n_P, _n_x_b0, _n_y_b1]))):
		return 0
	_S.set_prop(_n_o_b2,"t",1,"=")
	_S.set_prop(_n_o_b2,"a",0.92,"=")
	var _n_i_b3 = (5 if _S.truth(_S.call_value(_n_lit,[_n_x_b0, _n_y_b1, 0.42])) else (4 if _S.truth(_S.call_value(_n_lit,[_n_x_b0, _n_y_b1, 0.7])) else 3))
	var _n_v_b4 = (float((_n_yb - _n_y_b1))/_S.named_value(_n_P,"H"))
	if _S.truth((_S.call_value(_n_inside,[_n_P, _n_x_b0, (_n_y_b1 + 1.4)]) if _S.truth((_n_v_b4 < 0.3)) else (_n_v_b4 < 0.3))):
		_n_i_b3 = (5 if _S.truth(not _S.truth(_S.call_value(_n_inside,[_n_P, _n_x_b0, (_n_y_b1 + 2.4)]))) else (4 if _S.truth((_n_v_b4 < 0.2)) else _n_i_b3))
	if _S.truth(not _S.truth(_S.call_value(_n_inside,[_n_P, (_n_x_b0 + 2), (_n_y_b1 + 2.4)]))):
		_n_i_b3 = 2
		_S.set_prop(_n_o_b2,"a",1,"=")
	var _n_ang_b5 = atan2((_n_y_b1 - _n_cy),((_n_x_b0 - _n_cx) * (float(_S.named_value(_n_P,"H"))/_S.named_value(_n_P,"W"))))
	if _S.truth(_S.logical("&&",_S.logical("&&",_S.logical("&&",not _S.truth(_S.call_value(_n_inside,[_n_P, (_n_x_b0 - 1.6), (_n_y_b1 - 1.6)])),func():return _S.call_value(_n_inside,[_n_P, (_n_x_b0 - 0.7), (_n_y_b1 - 0.7)])),func():return (_n_ang_b5 > (-2.75))),func():return (_n_ang_b5 < (-1.55)))):
		_n_i_b3 = (6 if _S.truth(((_n_ang_b5 < (-1.8)) if _S.truth((_n_ang_b5 > (-2.45))) else (_n_ang_b5 > (-2.45)))) else 5)
		_S.set_prop(_n_o_b2,"a",1,"=")
	if _S.truth(_S.logical("&&",_S.logical("&&",_S.logical("&&",(_S.call_value(_n_inside,[_n_P, (_n_x_b0 + 1), (_n_y_b1 + 1.2)]) if _S.truth(_S.binary("===",_n_i_b3,2)) else _S.binary("===",_n_i_b3,2)),func():return not _S.truth(_S.call_value(_n_inside,[_n_P, (_n_x_b0 + 2), (_n_y_b1 + 2.4)]))),func():return (_n_ang_b5 > 0.3)),func():return (_n_ang_b5 < 1.5))):
		_n_i_b3 = 4
	return _S.index_value(_n_C,_n_i_b3)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_T_SQ = _S.read(_parent,"T_SQ")
	var _n_T_UP = _S.read(_parent,"T_UP")
	var _n_T_LIFT = _S.read(_parent,"T_LIFT")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_P_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_yb_b4 = (_S.named_value(_n_P_b2,"by") - 1)
	var _n_ev_b5 = 0.47
	var _n_ey_b6 = floori((_n_yb_b4 - (_S.named_value(_n_P_b2,"H") * _n_ev_b5))+0.5)
	var _n_ex_b7 = maxf(3,floori((_S.named_value(_n_P_b2,"W") * 0.16)+0.5))
	var _n_xc_b8 = floori(((_S.named_value(_n_P_b2,"lean") * _n_ev_b5) * _S.named_value(_n_P_b2,"H"))+0.5)
	var _n_air_b9 = (_S.named_value(_n_P_b2,"q") >= 0)
	var _n_shut_b10 = (not _S.truth(_n_air_b9) if _S.truth((_S.named_value(_n_P_b2,"age") < 0.16)) else (_S.named_value(_n_P_b2,"age") < 0.16))
	var _n_blink_b11 = ((_n_t_b3 < 0.29) if _S.truth((_n_t_b3 > 0.22)) else (_n_t_b3 > 0.22))
	var _n_wind_b12 = (_S.MathFX.seg(_n_t_b3,_n_T_SQ,_n_T_UP) if _S.truth(((_n_t_b3 < _n_T_LIFT) if _S.truth((_n_t_b3 >= _n_T_SQ)) else (_n_t_b3 >= _n_T_SQ))) else 0)
	var _n_look_b13 = (((-1) if _S.truth((_S.named_value(_n_P_b2,"q") < 0.45)) else (1 if _S.truth((_S.named_value(_n_P_b2,"q") > 0.7)) else 0)) if _S.truth(_n_air_b9) else 0)
	var _n_eh_b14 = clampf(floori((((4 * (1 + (_S.named_value(_n_P_b2,"s") * 0.8))) - (_n_wind_b12 * 2)) + (1 if _S.truth(((_S.named_value(_n_P_b2,"q") < 0.6) if _S.truth(_n_air_b9) else _n_air_b9)) else 0))+0.5),1,5)
	for _iter_0 in _S.array([(-1), 1]):
		var _n_side_b16 = _iter_0
		var _n_x_b17 = ((_n_xc_b8 + (_n_side_b16 * _n_ex_b7)) - (1 if _S.truth((_n_side_b16 > 0)) else 0))
		if _S.truth(_n_shut_b10):
			var _n_a_b19 = (0 if _S.truth((_n_side_b16 < 0)) else 1)
			var _n_b_b20 = (1 - _n_a_b19)
			_S.invoke(_n_g_b0,"set",[(_n_x_b17 + _n_a_b19), (_n_ey_b6 - 1), _S.index_value(_n_C_b1,0)])
			_S.invoke(_n_g_b0,"set",[(_n_x_b17 + _n_b_b20), _n_ey_b6, _S.index_value(_n_C_b1,0)])
			_S.invoke(_n_g_b0,"set",[(_n_x_b17 + _n_a_b19), (_n_ey_b6 + 1), _S.index_value(_n_C_b1,0)])
			continue
		if _S.truth(_n_blink_b11):
			_S.invoke(_n_g_b0,"set",[_n_x_b17, (_n_ey_b6 + 1), _S.index_value(_n_C_b1,0)])
			_S.invoke(_n_g_b0,"set",[(_n_x_b17 + 1), (_n_ey_b6 + 1), _S.index_value(_n_C_b1,0)])
			continue
		var _n_top_b18 = (((_n_ey_b6 + 2) - _n_eh_b14) + _n_look_b13)
		if true:
			var _n_k_b21 = 0
			while _S.truth((_n_k_b21 < _n_eh_b14)):
				_S.invoke(_n_g_b0,"set",[_n_x_b17, (_n_top_b18 + _n_k_b21), _S.index_value(_n_C_b1,0)])
				_S.invoke(_n_g_b0,"set",[(_n_x_b17 + 1), (_n_top_b18 + _n_k_b21), _S.index_value(_n_C_b1,0)])
				_n_k_b21 += 1.0
		_S.invoke(_n_g_b0,"set",[(_n_x_b17 + (1 if _S.truth((_n_look_b13 > 0)) else 0)), (_n_top_b18 + (1 if _S.truth((_n_look_b13 > 0)) else 0)), _S.index_value(_n_C_b1,6)])
		if _S.truth((_n_eh_b14 >= 4)):
			_S.invoke(_n_g_b0,"set",[(_n_x_b17 + 1), ((_n_top_b18 + _n_eh_b14) - 1), _S.index_value(_n_C_b1,2)])
	var _n_my_b15 = floori((_n_yb_b4 - (_S.named_value(_n_P_b2,"H") * 0.31))+0.5)
	if _S.truth(((_S.named_value(_n_P_b2,"q") < 0.75) if _S.truth(_n_air_b9) else _n_air_b9)):
		_S.invoke(_n_g_b0,"set",[_n_xc_b8, _n_my_b15, _S.index_value(_n_C_b1,0)])
		_S.invoke(_n_g_b0,"set",[(_n_xc_b8 - 1), _n_my_b15, _S.index_value(_n_C_b1,0)])
		_S.invoke(_n_g_b0,"set",[_n_xc_b8, (_n_my_b15 + 1), _S.index_value(_n_C_b1,1)])
		_S.invoke(_n_g_b0,"set",[(_n_xc_b8 - 1), (_n_my_b15 + 1), _S.index_value(_n_C_b1,1)])
	else:
		if _S.truth(not _S.truth(_n_shut_b10)):
			_S.invoke(_n_g_b0,"set",[_n_xc_b8, _n_my_b15, _S.index_value(_n_C_b1,1)])
			_S.invoke(_n_g_b0,"set",[(_n_xc_b8 - 1), _n_my_b15, _S.index_value(_n_C_b1,1)])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_POP = _S.read(_parent,"POP")
	var _n_ease = _S.read(_parent,"ease")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_P_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	if _S.truth((_n_t_b3 > _n_POP)):
		return null
	var _n_v_b4 = _S.numeric_lerp(0.18,0.86,_S.invoke(_n_ease,"inQuad",[(float(_n_t_b3)/_n_POP)]))
	var _n_hw_b5 = _S.call_value(_n_halfW,[_n_v_b4, _n_P_b2])
	var _n_x_b6 = (((_S.named_value(_n_P_b2,"lean") * _n_v_b4) * _S.named_value(_n_P_b2,"H")) - (_n_hw_b5 * _S.numeric_lerp(0.35,0.05,(float(_n_t_b3)/_n_POP))))
	var _n_y_b7 = ((_S.named_value(_n_P_b2,"by") - 1) - (_n_v_b4 * _S.named_value(_n_P_b2,"H")))
	_S.invoke(_n_g_b0,"set",[_n_x_b6, _n_y_b7, _S.index_value(_n_C_b1,6)])
	_S.invoke(_n_g_b0,"set",[(_n_x_b6 + 1), _n_y_b7, _S.index_value(_n_C_b1,5)])
	_S.invoke(_n_g_b0,"set",[_n_x_b6, (_n_y_b7 + 1), _S.index_value(_n_C_b1,5)])
	_S.invoke(_n_g_b0,"set",[(_n_x_b6 + 1), (_n_y_b7 + 1), _S.index_value(_n_C_b1,4)])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_G = _S.read(_parent,"G")
	var _n_toss = _S.read(_parent,"toss")
	var _n_W0 = _S.read(_parent,"W0")
	var _n_ease = _S.read(_parent,"ease")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_o_b1 = _S.arg(_args,1)
	var _n_age_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.MathFX.rng([_S.named_value(_n_o_b1,"seed"),_n_i_b0,7])
	var _n_a_b4 = ((float((-PI))/2) + _S.invoke(_n_r_b3,"range",[(-1.2), 1.2]))
	var _n_sp_b5 = _S.invoke(_n_r_b3,"range",[60, 118])
	var _n_size_b6 = (1 if _S.truth(_S.invoke(_n_r_b3,"chance",[0.35])) else (2 if _S.truth(_S.invoke(_n_r_b3,"chance",[0.7])) else 3))
	var _n_fa_b7 = (_n_a_b4 + (float(PI)/2))
	var _n_x0_b8 = (sin(_n_fa_b7) * 21)
	var _n_y0_b9 = ((-1) - (cos(_n_fa_b7) * 12.5))
	var _n_f_b10 = _S.call_value(_n_toss,[_n_x0_b8, _n_y0_b9, ((cos(_n_a_b4) * _n_sp_b5) * 0.75), (sin(_n_a_b4) * _n_sp_b5), _n_age_b2, _n_G, (-1)])
	_S.set_prop(_n_f_b10,"size",_n_size_b6,"=")
	if _S.truth(_S.named_value(_n_f_b10,"landed")):
		var _n_home_b11 = (signf((_S.named_value(_n_f_b10,"lx") if _S.truth(_S.named_value(_n_f_b10,"lx")) else 1)) * ((float(_n_W0)/2) - 2))
		var _n_dur_b12 = minf(0.55,(0.22 + (float(absf((_S.named_value(_n_f_b10,"lx") - _n_home_b11)))/60)))
		var _n_u_b13 = _S.MathFX.seg(((_n_age_b2 - _S.named_value(_n_f_b10,"at")) - 0.14),0,_n_dur_b12)
		_S.set_prop(_n_f_b10,"x",_S.numeric_lerp(_S.named_value(_n_f_b10,"lx"),_n_home_b11,_S.invoke(_n_ease,"inOutSine",[_n_u_b13])),"=")
		_S.set_prop(_n_f_b10,"k",(1 - _n_u_b13),"=")
		_S.set_prop(_n_f_b10,"gone",(_n_u_b13 >= 1),"=")
		_S.set_prop(_n_f_b10,"splat",clampf((1 - (float((_n_age_b2 - _S.named_value(_n_f_b10,"at")))/0.14)),0.0,1.0),"=")
	return _n_f_b10
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_W0 = _S.read(_parent,"W0")
	var _n_T_LAND = _S.read(_parent,"T_LAND")
	var _n_T_SQ = _S.read(_parent,"T_SQ")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_P_b1 = _S.arg(_args,1)
	if _S.truth((_S.named_value(_n_P_b1,"q") >= 0)):
		return (((float((float(_n_W0)/sqrt(1.36)))/2) + 3) * (1 - (0.22 * _S.named_value(_n_P_b1,"q"))))
	return (((float(_S.named_value(_n_P_b1,"W"))/2) + 3) + (((9 * exp(((-_S.named_value(_n_P_b1,"age")) * 5))) * (1 - exp(((-_S.named_value(_n_P_b1,"age")) * 40)))) * (1 if _S.truth(((_n_t_b0 >= _n_T_LAND) if _S.truth((_n_t_b0 >= _n_T_LAND)) else (_n_t_b0 < _n_T_SQ))) else 0)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_pose = _S.read(_parent,"pose")
	var _n_GRID = _S.read(_parent,"GRID")
	var _n_body = _S.read(_parent,"body")
	var _n_face = _S.read(_parent,"face")
	var _n_bubbleIn = _S.read(_parent,"bubbleIn")
	var _n_POP = _S.read(_parent,"POP")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_droplet = _S.read(_parent,"droplet")
	var _n_inside = _S.read(_parent,"inside")
	var _n_NDROP = _S.read(_parent,"NDROP")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_G = _S.read(_parent,"G")
	var _n_toss = _S.read(_parent,"toss")
	var _n_DRIPS = _S.read(_parent,"DRIPS")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_puddleR = _S.read(_parent,"puddleR")
	var _n_T_LAND = _S.read(_parent,"T_LAND")
	var _n_T_SQ = _S.read(_parent,"T_SQ")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_P_b5 = _S.call_value(_n_pose,[_n_t_b3, _S.named_value(_n_o_b2,"hop")])
	var _n_yb_b6 = (_S.named_value(_n_P_b5,"by") - 1)
	var _n_age_b7 = _S.named_value(_n_P_b5,"age")
	var _n_g_b8 = _n_GRID
	_S.call_value(_n_body,[_n_g_b8, _n_C_b4, _n_P_b5])
	_S.call_value(_n_face,[_n_g_b8, _n_C_b4, _n_P_b5, _n_t_b3])
	_S.call_value(_n_bubbleIn,[_n_g_b8, _n_C_b4, _n_P_b5, _n_t_b3])
	_S.invoke(_n_g_b8,"outline",[_S.function_value(_S.capture(_parent,{"yb":_n_yb_b6,"P":_n_P_b5,"C":_n_C_b4,"this":_this}),"_f10")])
	_S.invoke(_n_g_b8,"draw",[_n_p_b0])
	if _S.truth(((_n_t_b3 < (_n_POP + 0.16)) if _S.truth((_n_t_b3 >= _n_POP)) else (_n_t_b3 >= _n_POP))):
		var _n_k_b14 = (float((_n_t_b3 - _n_POP))/0.16)
		var _n_x_b15 = ((_S.named_value(_n_P_b5,"lean") * _S.named_value(_n_P_b5,"H")) - (_S.call_value(_n_halfW,[0.86, _n_P_b5]) * 0.05))
		var _n_y_b16 = ((_n_yb_b6 - _S.named_value(_n_P_b5,"H")) - 0.5)
		if true:
			var _n_a_b17 = 0
			while _S.truth((_n_a_b17 < _n_TAU)):
				_S.invoke(_n_p_b0,"dot",[(_n_x_b15 + (cos(_n_a_b17) * (1 + (_n_k_b14 * 3)))), (_n_y_b16 + ((sin(_n_a_b17) * (1 + (_n_k_b14 * 3))) * 0.7)), _S.index_value(_n_C_b4,6), (1.2 - _n_k_b14)])
				_n_a_b17 += 0.6
		for _iter_0 in _S.array([(-1), 1]):
			var _n_s_b18 = _iter_0
			_S.invoke(_n_p_b0,"dot",[(_n_x_b15 + (_n_s_b18 * (1 + (_n_k_b14 * 4)))), (((_n_y_b16 - 1) - (_n_k_b14 * 6)) + ((_n_k_b14 * _n_k_b14) * 4)), _S.index_value(_n_C_b4,5), (1.3 - _n_k_b14)])
		_S.invoke(_n_p_b0,"glow",[_n_x_b15, _n_y_b16, 6, _S.index_value(_n_C_b4,5), (0.4 * (1 - _n_k_b14))])
	if true:
		var _n_i_b19 = 0
		while _S.truth((_n_i_b19 < _n_NDROP)):
			var _n_f_b20 = _S.call_value(_n_droplet,[_n_i_b19, _n_o_b2, _n_age_b7])
			if _S.truth((_S.named_value(_n_f_b20,"landed") if _S.truth(_S.named_value(_n_f_b20,"landed")) else _S.call_value(_n_inside,[_n_P_b5, _S.named_value(_n_f_b20,"x"), _S.named_value(_n_f_b20,"y")]))):
				_n_i_b19 += 1.0
				continue
			var _n_sv_b21 = _S.logical("||",_S.Bridge.hypot([_S.named_value(_n_f_b20,"vx"), _S.named_value(_n_f_b20,"vy")]),func():return 1)
			var _n_ux_b22 = (float(_S.named_value(_n_f_b20,"vx"))/_n_sv_b21)
			var _n_uy_b23 = (float(_S.named_value(_n_f_b20,"vy"))/_n_sv_b21)
			var _n_L_b24 = minf(2.5,(float(_n_sv_b21)/50))
			_S.invoke(_n_p_b0,"line",[(_S.named_value(_n_f_b20,"x") - (_n_ux_b22 * _n_L_b24)), (_S.named_value(_n_f_b20,"y") - (_n_uy_b23 * _n_L_b24)), _S.named_value(_n_f_b20,"x"), _S.named_value(_n_f_b20,"y"), _S.index_value(_n_C_b4,3)])
			if _S.truth((_S.named_value(_n_f_b20,"size") >= 2)):
				_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_f_b20,"x") - 1), _S.named_value(_n_f_b20,"y"), _S.index_value(_n_C_b4,4)])
				_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_f_b20,"x") - 1), (_S.named_value(_n_f_b20,"y") + 1), _S.index_value(_n_C_b4,3)])
				_S.invoke(_n_p_b0,"px",[_S.named_value(_n_f_b20,"x"), (_S.named_value(_n_f_b20,"y") + 1), _S.index_value(_n_C_b4,2)])
			if _S.truth((_S.named_value(_n_f_b20,"size") >= 3)):
				_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_f_b20,"x") + 1), _S.named_value(_n_f_b20,"y"), _S.index_value(_n_C_b4,3)])
				_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_f_b20,"x") - 1), (_S.named_value(_n_f_b20,"y") - 1), _S.index_value(_n_C_b4,4)])
				_S.invoke(_n_p_b0,"px",[_S.named_value(_n_f_b20,"x"), (_S.named_value(_n_f_b20,"y") - 1), _S.index_value(_n_C_b4,5)])
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_f_b20,"x"), _S.named_value(_n_f_b20,"y"), (_S.index_value(_n_C_b4,6) if _S.truth((_S.named_value(_n_f_b20,"size") >= 2)) else _S.index_value(_n_C_b4,5))])
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_f_b20,"x"), _S.named_value(_n_f_b20,"y"), (5 + _S.named_value(_n_f_b20,"size")), _S.index_value(_n_C_b4,4), 0.32])
			_n_i_b19 += 1.0
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, 7, ((_S.named_value(_n_o_b2,"seed") * 13) + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f11"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b4,"this":_this}),"_f12")])
	for _iter_1 in _S.array(_n_DRIPS):
		var _tuple_2 = _iter_1
		var _n_t0_b25 = _S.prop(_tuple_2,0)
		var _n_dx_b26 = _S.prop(_tuple_2,1)
		var _n_a2_b27 = _S.call_value(_n_wrap,[(_n_t_b3 - _n_t0_b25), _n_D])
		if _S.truth((_n_a2_b27 > 0.6)):
			continue
		var _n_P0_b28 = _S.call_value(_n_pose,[_n_t0_b25, _S.named_value(_n_o_b2,"hop")])
		var _n_f_b29 = _S.call_value(_n_toss,[_n_dx_b26, (_S.named_value(_n_P0_b28,"by") - 0.5), 0, 12, _n_a2_b27, _n_G, (-1)])
		if _S.truth(not _S.truth(_S.named_value(_n_f_b29,"landed"))):
			_S.invoke(_n_p_b0,"px",[_n_dx_b26, _S.named_value(_n_f_b29,"y"), _S.index_value(_n_C_b4,5)])
			_S.invoke(_n_p_b0,"px",[_n_dx_b26, (_S.named_value(_n_f_b29,"y") - 1), _S.index_value(_n_C_b4,4)])
			_S.invoke(_n_p_b0,"glow",[_n_dx_b26, _S.named_value(_n_f_b29,"y"), 4, _S.index_value(_n_C_b4,4), 0.3])
		else:
			if _S.truth(((_n_a2_b27 - _S.named_value(_n_f_b29,"at")) < 0.14)):
				var _n_k_b30 = (float((_n_a2_b27 - _S.named_value(_n_f_b29,"at")))/0.14)
				for _iter_3 in _S.array([(-1), 1]):
					var _n_s2_b31 = _iter_3
					_S.invoke(_n_p_b0,"dot",[(_n_dx_b26 + (_n_s2_b31 * (1 + (_n_k_b30 * 3)))), (((-2) - (_n_k_b30 * 3)) + ((_n_k_b30 * _n_k_b30) * 3)), _S.index_value(_n_C_b4,5), (1.2 - _n_k_b30)])
	if _S.truth(((_S.named_value(_n_P_b5,"q") < 0.64) if _S.truth((_S.named_value(_n_P_b5,"q") > 0.4)) else (_S.named_value(_n_P_b5,"q") > 0.4))):
		var _n_k_b32 = sin((PI * _S.MathFX.seg(_S.named_value(_n_P_b5,"q"),0.4,0.64)))
		_S.call_value(_n_sparkle,[_n_p_b0, (((_S.named_value(_n_P_b5,"lean") * 0.8) * _S.named_value(_n_P_b5,"H")) - (_S.named_value(_n_P_b5,"W") * 0.21)), (_n_yb_b6 - (_S.named_value(_n_P_b5,"H") * 0.8)), (1 + (2.5 * _n_k_b32)), _S.index_value(_n_C_b4,6), _S.index_value(_n_C_b4,5), (0.5 * _n_k_b32)])
	var _n_cx_b9 = ((_S.named_value(_n_P_b5,"lean") * _S.named_value(_n_P_b5,"H")) * 0.4)
	var _n_cy_b10 = (_n_yb_b6 - (_S.named_value(_n_P_b5,"H") * 0.45))
	var _n_near_b11 = clampf((1 + (float(_S.named_value(_n_P_b5,"by"))/(_S.named_value(_n_o_b2,"hop") * 1.1))),0.0,1.0)
	var _n_R_b12 = _S.call_value(_n_puddleR,[_n_t_b3, _n_P_b5])
	var _n_br_b13 = (0.9 + (0.1 * sin((((float(_n_t_b3)/_n_D) * _n_TAU) * 2))))
	_S.invoke(_n_p_b0,"glow",[(_n_cx_b9 * 0.5), (-14), 64, _S.index_value(_n_C_b4,3), (0.3 * _n_br_b13)])
	_S.invoke(_n_p_b0,"glow",[_n_cx_b9, _n_cy_b10, (30 + (_S.named_value(_n_P_b5,"W") * 0.3)), _S.index_value(_n_C_b4,4), 0.2])
	_S.invoke(_n_p_b0,"glow",[_n_cx_b9, (_n_cy_b10 + 3), 14, _S.index_value(_n_C_b4,5), 0.16])
	_S.invoke(_n_p_b0,"glow",[0, (-2), ((_n_R_b12 * 1.3) + 6), _S.index_value(_n_C_b4,4), (0.12 + (0.08 * _n_near_b11))])
	if _S.truth(((_n_t_b3 >= _n_T_LAND) if _S.truth((_n_t_b3 >= _n_T_LAND)) else (_n_t_b3 < _n_T_SQ))):
		_S.invoke(_n_p_b0,"glow",[0, (-3), 40, _S.index_value(_n_C_b4,5), (0.42 * exp(((-_n_age_b7) * 9)))])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_yb = _S.read(_parent,"yb")
	var _n_P = _S.read(_parent,"P")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_nx_b2 = _S.arg(_args,2)
	var _n_ny_b3 = _S.arg(_args,3)
	return (_S.index_value(_n_C,1) if _S.truth(((_n_y_b1 < (_n_yb - (_S.named_value(_n_P,"H") * 0.5))) if _S.truth(((_n_nx_b2 <= 0) if _S.truth((_n_ny_b3 < 0)) else (_n_ny_b3 < 0))) else ((_n_nx_b2 <= 0) if _S.truth((_n_ny_b3 < 0)) else (_n_ny_b3 < 0)))) else _S.index_value(_n_C,0))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.2, 1.8])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_ag_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_k_b4 = (float(_n_ag_b0)/_n_L_b1)
	var _n_x_b5 = (_S.invoke(_n_r_b2,"range",[(-24), 24]) + (sin(((_n_ag_b0 * 2.1) + (_n_i_b3 * 1.7))) * 3))
	var _n_y_b6 = (((-2) - (_S.invoke(_n_r_b2,"range",[9, 17]) * _n_ag_b0)) - ((5 * _n_ag_b0) * _n_ag_b0))
	var _n_a_b7 = (minf(1,(_n_k_b4 * 4)) * minf(1,((1 - _n_k_b4) * 2.5)))
	var _n_tw_b8 = (0.6 + (0.4 * sin(((_n_ag_b0 * 7) + (_n_i_b3 * 2.3)))))
	var _n_big_b9 = _S.invoke(_n_r_b2,"chance",[0.35])
	_S.invoke(_n_p,"dot",[_n_x_b5, _n_y_b6, (_S.index_value(_n_C,6) if _S.truth((_n_tw_b8 > 0.8)) else _S.index_value(_n_C,5)), _n_a_b7])
	if _S.truth(_n_big_b9):
		_S.invoke(_n_p,"dot",[(_n_x_b5 + 1), _n_y_b6, _S.index_value(_n_C,5), _n_a_b7])
		_S.invoke(_n_p,"dot",[_n_x_b5, (_n_y_b6 + 1), _S.index_value(_n_C,4), _n_a_b7])
		_S.invoke(_n_p,"dot",[(_n_x_b5 + 1), (_n_y_b6 + 1), _S.index_value(_n_C,4), (_n_a_b7 * 0.6)])
	_S.invoke(_n_p,"glow",[_n_x_b5, _n_y_b6, (9 if _S.truth(_n_big_b9) else 6), _S.index_value(_n_C,5), (((0.45 if _S.truth(_n_big_b9) else 0.32) * _n_a_b7) * _n_tw_b8)])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_pose = _S.read(_parent,"pose")
	var _n_puddleR = _S.read(_parent,"puddleR")
	var _n_lnoise = _S.read(_parent,"lnoise")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_droplet = _S.read(_parent,"droplet")
	var _n_NDROP = _S.read(_parent,"NDROP")
	var _n_T_LIFT = _S.read(_parent,"T_LIFT")
	var _n_SNAP = _S.read(_parent,"SNAP")
	var _n_G = _S.read(_parent,"G")
	var _n_toss = _S.read(_parent,"toss")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_P_b5 = _S.call_value(_n_pose,[_n_t_b3, _S.named_value(_n_o_b2,"hop")])
	var _n_age_b6 = _S.named_value(_n_P_b5,"age")
	var _n_R_b7 = _S.call_value(_n_puddleR,[_n_t_b3, _n_P_b5])
	var _n_hp_b8 = minf(2.4,(0.9 + (_n_R_b7 * 0.06)))
	if true:
		var _n_x_b9 = floori((-_n_R_b7))
		while _S.truth((_n_x_b9 <= ceili(_n_R_b7))):
			var _n_d_b10 = (float(absf((_n_x_b9 + 0.5)))/_n_R_b7)
			if _S.truth((_n_d_b10 > 1)):
				_n_x_b9 += 1.0
				continue
			var _n_top_b11 = ((-1) - floori((sqrt((1 - (_n_d_b10 * _n_d_b10))) * _n_hp_b8)+0.5))
			if true:
				var _n_y_b12 = _n_top_b11
				while _S.truth((_n_y_b12 <= 0)):
					var _n_c_b13 = (_S.index_value(_n_C_b4,5) if _S.truth(_S.binary("===",_n_y_b12,_n_top_b11)) else (_S.index_value(_n_C_b4,2) if _S.truth(_S.binary("===",_n_y_b12,0)) else _S.index_value(_n_C_b4,4)))
					if _S.truth((_n_d_b10 > 0.88)):
						_n_c_b13 = (_S.index_value(_n_C_b4,4) if _S.truth(_S.binary("===",_n_y_b12,_n_top_b11)) else _S.index_value(_n_C_b4,3))
					if _S.truth(((_n_d_b10 < 0.88) if _S.truth(_S.binary("===",_n_y_b12,_n_top_b11)) else _S.binary("===",_n_y_b12,_n_top_b11))):
						var _n_n_b14 = (_S.call_value(_n_lnoise,[_n_t_b3, _n_D, 7, (_n_x_b9 * 0.18), 3]) + (_S.call_value(_n_lnoise,[_n_t_b3, _n_D, 4, (_n_x_b9 * 0.07), 4]) * 0.6))
						if _S.truth((_n_n_b14 > 0.55)):
							_n_c_b13 = _S.index_value(_n_C_b4,6)
					else:
						if _S.truth(((_S.call_value(_n_lnoise,[_n_t_b3, _n_D, 3, (_n_x_b9 * 0.12), 5]) > 0.3) if _S.truth(((_n_d_b10 < 0.8) if _S.truth(_S.binary("===",_n_y_b12,(_n_top_b11 + 1))) else _S.binary("===",_n_y_b12,(_n_top_b11 + 1)))) else ((_n_d_b10 < 0.8) if _S.truth(_S.binary("===",_n_y_b12,(_n_top_b11 + 1))) else _S.binary("===",_n_y_b12,(_n_top_b11 + 1))))):
							_n_c_b13 = _S.index_value(_n_C_b4,5)
					_S.invoke(_n_p_b0,"px",[_n_x_b9, _n_y_b12, _n_c_b13])
					_n_y_b12 += 1.0
			if _S.truth((_n_d_b10 > 0.96)):
				_S.invoke(_n_p_b0,"px",[_n_x_b9, (_n_top_b11 - 1), _S.index_value(_n_C_b4,1)])
			_n_x_b9 += 1.0
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, 4, ((_S.named_value(_n_o_b2,"seed") * 17) + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f14"), _S.function_value(_S.capture(_parent,{"R":_n_R_b7,"P":_n_P_b5,"hp":_n_hp_b8,"p":_n_p_b0,"C":_n_C_b4,"this":_this}),"_f15")])
	if true:
		var _n_i_b15 = 0
		while _S.truth((_n_i_b15 < _n_NDROP)):
			var _n_f_b16 = _S.call_value(_n_droplet,[_n_i_b15, _n_o_b2, _n_age_b6])
			if _S.truth((not _S.truth(_S.named_value(_n_f_b16,"landed")) if _S.truth(not _S.truth(_S.named_value(_n_f_b16,"landed"))) else _S.named_value(_n_f_b16,"gone"))):
				_n_i_b15 += 1.0
				continue
			var _n_x_b17 = floori(_S.named_value(_n_f_b16,"x")+0.5)
			var _n_w_b18 = (_S.named_value(_n_f_b16,"size") + (1 if _S.truth((_S.named_value(_n_f_b16,"splat") > 0)) else 0))
			if true:
				var _n_j_b20 = 0
				while _S.truth((_n_j_b20 < _n_w_b18)):
					_S.invoke(_n_p_b0,"px",[((_n_x_b17 - _S.binary(">>",_n_w_b18,1)) + _n_j_b20), (-1), (_S.index_value(_n_C_b4,5) if _S.truth(_S.binary("===",_n_j_b20,0)) else _S.index_value(_n_C_b4,4))])
					_n_j_b20 += 1.0
			if _S.truth(((_S.named_value(_n_f_b16,"splat") <= 0) if _S.truth((_S.named_value(_n_f_b16,"size") >= 2)) else (_S.named_value(_n_f_b16,"size") >= 2))):
				_S.invoke(_n_p_b0,"px",[_n_x_b17, (-2), _S.index_value(_n_C_b4,5)])
				_S.invoke(_n_p_b0,"px",[(_n_x_b17 - 1), (-2), _S.index_value(_n_C_b4,4)])
			_S.invoke(_n_p_b0,"px",[_n_x_b17, 0, _S.index_value(_n_C_b4,3)])
			var _n_dir_b19 = signf((_S.named_value(_n_f_b16,"lx") - _S.named_value(_n_f_b16,"x")))
			if true:
				var _n_j_b21 = 1
				while _S.truth((_n_j_b21 < minf(8,absf((_S.named_value(_n_f_b16,"lx") - _S.named_value(_n_f_b16,"x")))))):
					_S.invoke(_n_p_b0,"dot",[(_n_x_b17 + (_n_dir_b19 * _n_j_b21)), 0, _S.index_value(_n_C_b4,2), (0.7 - (_n_j_b21 * 0.08))])
					_n_j_b21 += 1.0
			_S.invoke(_n_p_b0,"glow",[_n_x_b17, (-1), 5, _S.index_value(_n_C_b4,4), ((0.25 * _S.named_value(_n_f_b16,"k")) + 0.1)])
			_n_i_b15 += 1.0
	if _S.truth(((_n_t_b3 < _n_SNAP) if _S.truth((_n_t_b3 >= _n_T_LIFT)) else (_n_t_b3 >= _n_T_LIFT))):
		var _n_bot_b22 = (_S.named_value(_n_P_b5,"by") - 1)
		var _n_u_b23 = (float((_n_t_b3 - _n_T_LIFT))/(_n_SNAP - _n_T_LIFT))
		if true:
			var _n_y_b24 = floori(_n_bot_b22)
			while _S.truth((_n_y_b24 < 0)):
				var _n_m_b25 = sin(((float((_n_y_b24 - _n_bot_b22))/(-_n_bot_b22)) * PI))
				_S.invoke(_n_p_b0,"px",[(-1), _n_y_b24, _S.index_value(_n_C_b4,4)])
				if _S.truth(((_n_m_b25 * _n_u_b23) < 0.45)):
					_S.invoke(_n_p_b0,"px",[0, _n_y_b24, _S.index_value(_n_C_b4,3)])
				_n_y_b24 += 1.0
	else:
		if _S.truth(((_n_t_b3 < (_n_SNAP + 0.3)) if _S.truth((_n_t_b3 >= _n_SNAP)) else (_n_t_b3 >= _n_SNAP))):
			var _n_a2_b26 = (_n_t_b3 - _n_SNAP)
			var _n_ys_b27 = (_S.named_value(_S.call_value(_n_pose,[_n_SNAP, _S.named_value(_n_o_b2,"hop")]),"by") - 1)
			var _n_f_b28 = _S.call_value(_n_toss,[(-1), (_n_ys_b27 * 0.45), 0, 0, _n_a2_b26, (_n_G * 1.3), (-2)])
			if _S.truth(not _S.truth(_S.named_value(_n_f_b28,"landed"))):
				_S.invoke(_n_p_b0,"px",[(-1), _S.named_value(_n_f_b28,"y"), _S.index_value(_n_C_b4,5)])
				_S.invoke(_n_p_b0,"px",[(-1), (_S.named_value(_n_f_b28,"y") - 1), _S.index_value(_n_C_b4,3)])
			var _n_nub_b29 = (3 * (1 - (float(_n_a2_b26)/0.12)))
			if true:
				var _n_j_b30 = 0
				while _S.truth((_n_j_b30 < _n_nub_b29)):
					_S.invoke(_n_p_b0,"px",[(-1), (_S.named_value(_n_P_b5,"by") + _n_j_b30), (_S.index_value(_n_C_b4,3) if _S.truth(_S.binary("===",_n_j_b30,0)) else _S.index_value(_n_C_b4,4))])
					_n_j_b30 += 1.0
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.45, 0.75])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_ease = _S.read(_parent,"ease")
	var _n_P = _S.read(_parent,"P")
	var _n_hp = _S.read(_parent,"hp")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_ag_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_x_b3 = (_S.invoke(_n_r_b2,"range",[(-0.85), 0.85]) * _n_R)
	var _n_k_b4 = (float(_n_ag_b0)/_n_L_b1)
	var _n_rb_b5 = (_S.invoke(_n_r_b2,"range",[1.4, 2.6]) * (0.3 + (0.7 * _S.invoke(_n_ease,"outCubic",[minf(1,(_n_k_b4 * 1.25))]))))
	if _S.truth(_S.logical("&&",(absf(_n_x_b3) < ((float(_S.named_value(_n_P,"W"))/2) + 1)),func():return (_S.named_value(_n_P,"q") < 0))):
		return null
	var _n_sy_b6 = ((-1) - floori((sqrt(maxf(0,(1 - pow((float(_n_x_b3)/_n_R),2)))) * _n_hp)+0.5))
	if _S.truth((_n_k_b4 < 0.85)):
		if true:
			var _n_y_b7 = floori((_n_sy_b6 - _n_rb_b5))
			while _S.truth((_n_y_b7 <= _n_sy_b6)):
				if true:
					var _n_xx_b8 = floori(((_n_x_b3 - _n_rb_b5) - 1))
					while _S.truth((_n_xx_b8 <= ceili(((_n_x_b3 + _n_rb_b5) + 1)))):
						var _n_dx_b9 = ((_n_xx_b8 + 0.5) - _n_x_b3)
						var _n_dy_b10 = ((_n_y_b7 + 0.5) - _n_sy_b6)
						var _n_dd_b11 = _S.Bridge.hypot([_n_dx_b9, _n_dy_b10])
						if _S.truth((_n_dd_b11 > (_n_rb_b5 + 0.5))):
							_n_xx_b8 += 1.0
							continue
						if _S.truth((_n_dd_b11 > (_n_rb_b5 - 0.7))):
							_S.invoke(_n_p,"px",[_n_xx_b8, _n_y_b7, (_S.index_value(_n_C,6) if _S.truth(((_n_dy_b10 < ((-_n_rb_b5) * 0.3)) if _S.truth((_n_dx_b9 < 0)) else (_n_dx_b9 < 0))) else _S.index_value(_n_C,4))])
						else:
							_S.invoke(_n_p,"blend",[_n_xx_b8, _n_y_b7, _S.index_value(_n_C,5), 0.3])
						_n_xx_b8 += 1.0
				_n_y_b7 += 1.0
		_S.invoke(_n_p,"glow",[_n_x_b3, (_n_sy_b6 - (_n_rb_b5 * 0.5)), ((_n_rb_b5 * 2) + 3), _S.index_value(_n_C,5), 0.2])
	else:
		var _n_q_b12 = (float((_n_k_b4 - 0.85))/0.15)
		for _iter_0 in _S.array([[1, 0], [(-1), 0], [0.6, (-0.7)], [(-0.6), (-0.7)], [0, (-1)]]):
			var _tuple_1 = _iter_0
			var _n_dx_b13 = _S.prop(_tuple_1,0)
			var _n_dy_b14 = _S.prop(_tuple_1,1)
			_S.invoke(_n_p,"dot",[(_n_x_b3 + (_n_dx_b13 * (2 + (3 * _n_q_b12)))), (_n_sy_b6 + (_n_dy_b14 * (2 + (3 * _n_q_b12)))), _S.index_value(_n_C,6), (1.2 - _n_q_b12)])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_P_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_v_b3 = (float(((_S.named_value(_n_P_b0,"by") - 1) - _n_y_b2))/_S.named_value(_n_P_b0,"H"))
	var _n_hw_b4 = _S.call_value(_n_halfW,[_n_v_b3, _n_P_b0])
	return ((absf((_n_x_b1 - ((_S.named_value(_n_P_b0,"lean") * _n_v_b3) * _S.named_value(_n_P_b0,"H")))) <= _n_hw_b4) if _S.truth((_n_hw_b4 >= 0)) else (_n_hw_b4 >= 0))
	return null
