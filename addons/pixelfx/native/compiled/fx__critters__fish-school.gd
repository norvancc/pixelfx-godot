@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/fish-school.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "bubble", _S.import_value("fx/critters/_lib.js", "bubble"))
	_S.define(_e, "fish", _S.function_value(_e, "_f0"))
	_S.define(_e, "place", _S.function_value(_e, "_f8"))
	_S.define(_e, "caustics", _S.function_value(_e, "_f9"))
	_S.define(_e, "draw", _S.function_value(_e, "_f10"))
	_S.define(_e, "meta", _S.merge([{"name": "Fish school"}, {"desc": "A school of fish holds station in two depth rows: bodies wag into swinging tails, one darts ahead now and then, bubbles rise and caustic light ripples over them."}, {"tags": ["critter", "fish", "school", "sea", "underwater", "swim", "loop"]}, {"size": [136, 80]}, {"origin": [68, 40]}, {"duration": 4.8}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#0a1a2a", "#123552", "#1d5a7e", "#2f8aa8", "#62bccc", "#bfe8e6", "#f4fff8"]}, {"stripe": ["#5a1e14", "#d8582a", "#ffa04a"]}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 28), _S.unary("-", 12), 34, 24]))
	_S.define(_e, "SCHOOL", [[_S.unary("-", 34), _S.unary("-", 16), 0.72, true, 0.1], [2, _S.unary("-", 20), 0.68, true, 0.55], [30, _S.unary("-", 10), 0.7, true, 0.3], [_S.unary("-", 22), 4, 1, false, 0.8], [12, _S.unary("-", 4), 1, false, 0.2], [_S.unary("-", 40), _S.unary("-", 2), 0.95, false, 0.45], [26, 14, 0.96, false, 0.65]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_Sp_b2 = _S.arg(_args,2)
	var _n_s_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_ph_b5 = _S.arg(_args,5)
	var _n_dart_b6 = _S.arg(_args,6)
	_S.invoke(_n_g_b0,"clear",[])
	var _n_L_b7 = (15 * _n_s_b3)
	var _n_H_b8 = (8 * _n_s_b3)
	var _n_beats_b9 = (12 + (6 if _S.truth((_n_dart_b6 > 0)) else 0))
	var _n_w_b10 = ((((float(_n_t_b4)/_n_D) * _n_TAU) * _n_beats_b9) + (_n_ph_b5 * _n_TAU))
	var _n_amp_b11 = ((1.3 + (1.2 * _n_dart_b6)) * _n_s_b3)
	var _n_bend_b12 = _S.function_value(_S.capture(_parent,{"amp":_n_amp_b11,"w":_n_w_b10,"this":_this}),"_f1")
	var _n_prof_b13 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f2")
	var _n_hh_b14 = _S.function_value(_S.capture(_parent,{"H":_n_H_b8,"prof":_n_prof_b13,"this":_this}),"_f3")
	_S.invoke(_n_g_b0,"shade",[(-_n_L_b7), (-_n_H_b8), 0, _n_H_b8, _S.function_value(_S.capture(_parent,{"L":_n_L_b7,"bend":_n_bend_b12,"hh":_n_hh_b14,"Sp":_n_Sp_b2,"C":_n_C_b1,"this":_this}),"_f4")])
	var _n_tb_b15 = _S.call_value(_n_bend_b12,[1])
	var _n_ta_b16 = (atan((((_n_amp_b11 * 1.8) * 0.9) * cos((_n_w_b10 - 4)))) * 0.8)
	var _n_TL_b17 = (6 * _n_s_b3)
	var _n_hb_b18 = _S.call_value(_n_hh_b14,[1])
	var _n_rot_b19 = _S.function_value(_S.capture(_parent,{"L":_n_L_b7,"ta":_n_ta_b16,"tb":_n_tb_b15,"this":_this}),"_f5")
	_S.invoke(_n_g_b0,"poly",[[_S.call_value(_n_rot_b19,[(-0.5), (-_n_hb_b18)]), _S.call_value(_n_rot_b19,[_n_TL_b17, ((-_n_hb_b18) - (3.4 * _n_s_b3))]), _S.call_value(_n_rot_b19,[(_n_TL_b17 * 0.62), 0]), _S.call_value(_n_rot_b19,[_n_TL_b17, (_n_hb_b18 + (3.4 * _n_s_b3))]), _S.call_value(_n_rot_b19,[(-0.5), _n_hb_b18])], _S.function_value(_S.capture(_parent,{"tb":_n_tb_b15,"C":_n_C_b1,"this":_this}),"_f6"), 0.88])
	var _n_d0_b20 = 0.34
	var _n_d1_b21 = 0.66
	_S.invoke(_n_g_b0,"poly",[[[((-_n_d0_b20) * _n_L_b7), ((_S.call_value(_n_bend_b12,[_n_d0_b20]) - _S.call_value(_n_hh_b14,[_n_d0_b20])) + 0.5)], [((-(_n_d0_b20 + 0.08)) * _n_L_b7), ((_S.call_value(_n_bend_b12,[_n_d0_b20]) - _S.call_value(_n_hh_b14,[_n_d0_b20])) - (3.6 * _n_s_b3))], [((-_n_d1_b21) * _n_L_b7), ((_S.call_value(_n_bend_b12,[_n_d1_b21]) - _S.call_value(_n_hh_b14,[_n_d1_b21])) + 0.5)]], _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"this":_this}),"_f7"), 0.85])
	var _n_pf_b22 = (sin((_n_w_b10 * 0.5)) * 1.2)
	_S.invoke(_n_g_b0,"set",[((-0.34) * _n_L_b7), ((_S.call_value(_n_bend_b12,[0.34]) + (1.5 * _n_s_b3)) + (_n_pf_b22 * 0.3)), _S.index_value(_n_C_b1,4), 0.85])
	_S.invoke(_n_g_b0,"set",[(((-0.34) * _n_L_b7) - 1), ((_S.call_value(_n_bend_b12,[0.34]) + (2 * _n_s_b3)) + (_n_pf_b22 * 0.6)), _S.index_value(_n_C_b1,4), 0.85])
	if true:
		var _n_y_b25 = (-2)
		while _S.truth((_n_y_b25 <= 1)):
			_S.invoke(_n_g_b0,"set",[((-0.26) * _n_L_b7), (_S.call_value(_n_bend_b12,[0.26]) + (_n_y_b25 * _n_s_b3)), _S.index_value(_n_C_b1,2)])
			_n_y_b25 += 1.0
	var _n_ex_b23 = (((-0.13) * _n_L_b7) - 1)
	var _n_ey_b24 = (_S.call_value(_n_bend_b12,[0.13]) - (0.25 * _n_H_b8))
	_S.invoke(_n_g_b0,"set",[_n_ex_b23, _n_ey_b24, _S.index_value(_n_C_b1,0)])
	_S.invoke(_n_g_b0,"set",[(_n_ex_b23 + 1), _n_ey_b24, _S.index_value(_n_C_b1,0)])
	_S.invoke(_n_g_b0,"set",[_n_ex_b23, (_n_ey_b24 + 1), _S.index_value(_n_C_b1,1)])
	_S.invoke(_n_g_b0,"set",[(_n_ex_b23 + 1), (_n_ey_b24 + 1), _S.index_value(_n_C_b1,0)])
	_S.invoke(_n_g_b0,"set",[(_n_ex_b23 + 1), _n_ey_b24, _S.index_value(_n_C_b1,6)])
	_S.invoke(_n_g_b0,"outline",[_S.index_value(_n_C_b1,0)])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_amp = _S.read(_parent,"amp")
	var _n_w = _S.read(_parent,"w")
	var _n_u_b0 = _S.arg(_args,0)
	return ((_n_amp * pow(_n_u_b0,1.8)) * sin((_n_w - (4 * _n_u_b0))))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return (sqrt((float(_n_u_b0)/0.3)) if _S.truth((_n_u_b0 < 0.3)) else (1 - (pow((float((_n_u_b0 - 0.3))/0.7),1.5) * 0.72)))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_prof = _S.read(_parent,"prof")
	var _n_u_b0 = _S.arg(_args,0)
	return ((float(_n_H)/2) * _S.call_value(_n_prof,[_n_u_b0]))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_bend = _S.read(_parent,"bend")
	var _n_hh = _S.read(_parent,"hh")
	var _n_Sp = _S.read(_parent,"Sp")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float((-_n_x_b0))/_n_L)
	var _n_dy_b4 = (_n_y_b1 - _S.call_value(_n_bend,[_n_u_b3]))
	var _n_h_b5 = _S.call_value(_n_hh,[_n_u_b3])
	if _S.truth((((_n_u_b3 < 0) if _S.truth((_n_u_b3 < 0)) else (_n_u_b3 > 1)) if _S.truth(((_n_u_b3 < 0) if _S.truth((_n_u_b3 < 0)) else (_n_u_b3 > 1))) else (absf(_n_dy_b4) > _n_h_b5))):
		return 0
	var _n_v_b6 = (float(_n_dy_b4)/_n_h_b5)
	if _S.truth(((_n_u_b3 < 0.92) if _S.truth(((_n_u_b3 > 0.22) if _S.truth(((_n_v_b6 < 0.12) if _S.truth((_n_v_b6 > (-0.12))) else (_n_v_b6 > (-0.12)))) else ((_n_v_b6 < 0.12) if _S.truth((_n_v_b6 > (-0.12))) else (_n_v_b6 > (-0.12))))) else ((_n_u_b3 > 0.22) if _S.truth(((_n_v_b6 < 0.12) if _S.truth((_n_v_b6 > (-0.12))) else (_n_v_b6 > (-0.12)))) else ((_n_v_b6 < 0.12) if _S.truth((_n_v_b6 > (-0.12))) else (_n_v_b6 > (-0.12)))))):
		return (_S.index_value(_n_Sp,1) if _S.truth((_n_u_b3 < 0.3)) else _S.index_value(_n_Sp,(2 if _S.truth((_n_v_b6 < 0)) else 1)))
	if _S.truth((_n_v_b6 < (-0.6))):
		return (_S.index_value(_n_C,3) if _S.truth(((_n_v_b6 < (-0.8)) if _S.truth((_n_u_b3 < 0.5)) else (_n_u_b3 < 0.5))) else _S.index_value(_n_C,2))
	if _S.truth((_n_v_b6 < (-0.12))):
		return _S.index_value(_n_C,3)
	if _S.truth((_n_v_b6 < 0.5)):
		return _S.index_value(_n_C,4)
	return (_S.index_value(_n_C,4) if _S.truth((_n_v_b6 > 0.86)) else _S.index_value(_n_C,5))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_ta = _S.read(_parent,"ta")
	var _n_tb = _S.read(_parent,"tb")
	var _n_dx_b0 = _S.arg(_args,0)
	var _n_dy_b1 = _S.arg(_args,1)
	return [(-((_n_L + (_n_dx_b0 * cos(_n_ta))) - (_n_dy_b1 * sin(_n_ta)))), ((_n_tb + (_n_dx_b0 * sin(_n_ta))) + (_n_dy_b1 * cos(_n_ta)))]
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_tb = _S.read(_parent,"tb")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_C,4) if _S.truth((_n_y_b1 < (_n_tb - 1))) else _S.index_value(_n_C,3))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,3) if _S.truth(fmod(floori(_n_x_b0+0.5),2)) else _S.index_value(_n_C,4))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_ease = _S.read(_parent,"ease")
	var _n_f_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _tuple_0 = _n_f_b0
	var _n_bx_b3 = _S.prop(_tuple_0,0)
	var _n_by_b4 = _S.prop(_tuple_0,1)
	var _n_ph_b5 = _S.prop(_tuple_0,4)
	var _n_a_b6 = ((float(_n_t_b2)/_n_D) * _n_TAU)
	var _n_dt_b7 = _S.call_value(_n_wrap,[(_n_t_b2 - fmod(((_n_i_b1 * 0.71) * _n_D),_n_D)), _n_D])
	var _n_dart_b8 = ((_S.invoke(_n_ease,"outCubic",[(float(_n_dt_b7)/0.25)]) if _S.truth((_n_dt_b7 < 0.25)) else ((1 - _S.invoke(_n_ease,"inOutSine",[(float((_n_dt_b7 - 0.25))/1.35)])) if _S.truth((_n_dt_b7 < 1.6)) else 0)) if _S.truth(_S.binary("===",_n_i_b1,4)) else 0)
	return {"x":((_n_bx_b3 + (3 * sin((_n_a_b6 + (_n_ph_b5 * _n_TAU))))) + (8 * _n_dart_b8)),"y":(_n_by_b4 + (1.8 * sin(((2 * _n_a_b6) + (_n_ph_b5 * 5))))),"dart":((1 - (float(_n_dt_b7)/0.6)) if _S.truth(((_n_dt_b7 < 0.6) if _S.truth(_S.binary("===",_n_i_b1,4)) else _S.binary("===",_n_i_b1,4))) else 0)}
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_a_b3 = ((float(_n_t_b2)/_n_D) * _n_TAU)
	if true:
		var _n_y_b4 = (-38)
		while _S.truth((_n_y_b4 < 38)):
			if true:
				var _n_x_b5 = (-66)
				while _S.truth((_n_x_b5 < 66)):
					var _n_fall_b6 = (clampf((1 - (pow((float(_n_x_b5)/64),2) + pow((float(_n_y_b4)/40),2))),0.0,1.0) * (0.6 + (0.4 * clampf(((float((-_n_y_b4))/40) + 0.6),0.0,1.0))))
					if _S.truth((_n_fall_b6 <= 0)):
						_n_x_b5 += 1.0
						continue
					var _n_u_b7 = ((_n_x_b5 * 0.16) + (1.9 * sin(((_n_y_b4 * 0.12) + _n_a_b3))))
					var _n_v_b8 = ((_n_y_b4 * 0.19) + (1.9 * sin(((_n_x_b5 * 0.1) - _n_a_b3))))
					var _n_n1_b9 = (sin(_n_u_b7) + sin(_n_v_b8))
					var _n_sh_b10 = (0.75 + (0.25 * sin((((_n_x_b5 * 0.05) - (_n_y_b4 * 0.04)) + (2 * _n_a_b3)))))
					var _n_f_b11 = ((maxf(0,(1 - (absf(_n_n1_b9) * 5))) * _n_fall_b6) * _n_sh_b10)
					if _S.truth((_n_f_b11 > 0.55)):
						_S.invoke(_n_p_b0,"light",[_n_x_b5, _n_y_b4, _S.index_value(_n_C_b1,4), 0.3])
					else:
						if _S.truth((_n_f_b11 > 0.25)):
							_S.invoke(_n_p_b0,"light",[_n_x_b5, _n_y_b4, _S.index_value(_n_C_b1,3), 0.14])
					_n_x_b5 += 1.0
			_n_y_b4 += 1.0
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_GRID = _S.read(_parent,"GRID")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_SCHOOL = _S.read(_parent,"SCHOOL")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_caustics = _S.read(_parent,"caustics")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_Sp_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"stripe"),3)
	var _n_g_b6 = _n_GRID
	for _iter_0 in _S.array([[(-30), 10, 0], [14, 7, 2.1], [44, 12, 4]]):
		var _tuple_1 = _iter_0
		var _n_x0_b7 = _S.prop(_tuple_1,0)
		var _n_w_b8 = _S.prop(_tuple_1,1)
		var _n_ph_b9 = _S.prop(_tuple_1,2)
		var _n_sw_b10 = (sin((((float(_n_t_b3)/_n_D) * _n_TAU) + _n_ph_b9)) * 4)
		_S.invoke(_n_p_b0,"glowLine",[((_n_x0_b7 + _n_sw_b10) - 12), (-40), ((_n_x0_b7 + _n_sw_b10) + 8), 40, _n_w_b8, _S.index_value(_n_C_b4,4), 0.05])
	for _iter_2 in _S.array([true, false]):
		var _n_back_b11 = _iter_2
		_S.invoke(_n_SCHOOL,"forEach",[_S.function_value(_S.capture(_parent,{"back":_n_back_b11,"t":_n_t_b3,"g":_n_g_b6,"C":_n_C_b4,"Sp":_n_Sp_b5,"p":_n_p_b0,"this":_this}),"_f11")])
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, 9, ((_S.named_value(_n_o_b2,"seed") * 13) + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f13"), _S.function_value(_S.capture(_parent,{"t":_n_t_b3,"p":_n_p_b0,"C":_n_C_b4,"this":_this}),"_f14")])
	_S.call_value(_n_caustics,[_n_p_b0, _n_C_b4, _n_t_b3])
	_S.invoke(_n_p_b0,"glow",[0, (-8), 74, _S.index_value(_n_C_b4,2), 0.2])
	_S.invoke(_n_p_b0,"glow",[(-6), (-18), 40, _S.index_value(_n_C_b4,3), 0.1])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_back = _S.read(_parent,"back")
	var _n_place = _S.read(_parent,"place")
	var _n_t = _S.read(_parent,"t")
	var _n_fish = _S.read(_parent,"fish")
	var _n_g = _S.read(_parent,"g")
	var _n_C = _S.read(_parent,"C")
	var _n_Sp = _S.read(_parent,"Sp")
	var _n_this = _S.read(_parent,"this")
	var _n_p = _S.read(_parent,"p")
	var _n_f_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	if _S.truth(_S.binary("!==",_S.index_value(_n_f_b0,3),_n_back)):
		return null
	var _n_P_b2 = _S.call_value(_n_place,[_n_f_b0, _n_i_b1, _n_t])
	_S.call_value(_n_fish,[_n_g, _n_C, _n_Sp, _S.index_value(_n_f_b0,2), _n_t, _S.index_value(_n_f_b0,4), _S.named_value(_n_P_b2,"dart")])
	if _S.truth(_n_back):
		_S.invoke(_n_g,"recolor",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f12")])
	_S.invoke(_n_g,"draw",[_n_p, 1, _S.named_value(_n_P_b2,"x"), _S.named_value(_n_P_b2,"y")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	return _S.ColorFX.mix(_n_c_b2,_S.index_value(_n_C,1),0.42)
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.6, 2.6])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_SCHOOL = _S.read(_parent,"SCHOOL")
	var _n_place = _S.read(_parent,"place")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_bubble = _S.read(_parent,"bubble")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_f_b4 = _S.index_value(_n_SCHOOL,fmod(_n_i_b3,_S.prop(_n_SCHOOL,"length")))
	var _n_P_b5 = _S.call_value(_n_place,[_n_f_b4, fmod(_n_i_b3,_S.prop(_n_SCHOOL,"length")), _S.call_value(_n_wrap,[(_n_t - _n_age_b0), _n_D])])
	var _n_rad_b6 = (_S.invoke(_n_r_b2,"range",[0.6, 1.6]) * _S.index_value(_n_f_b4,2))
	var _n_ph_b7 = (_S.invoke(_n_r_b2,"next",[]) * _n_TAU)
	var _n_x_b8 = ((_S.named_value(_n_P_b5,"x") + 1) + (sin(((_n_age_b0 * (4 + (float(2)/_n_rad_b6))) + _n_ph_b7)) * (0.5 + (_n_rad_b6 * 0.7))))
	var _n_y_b9 = ((_S.named_value(_n_P_b5,"y") - 1) - ((16 + (12 * _n_rad_b6)) * _n_age_b0))
	if _S.truth((_n_y_b9 < (-38))):
		return null
	_S.call_value(_n_bubble,[_n_p, _n_x_b8, _n_y_b9, _n_rad_b6, [_S.index_value(_n_C,6), _S.index_value(_n_C,5), _S.index_value(_n_C,4), _S.index_value(_n_C,3)], minf(minf(minf(1,(_n_age_b0 * 4)),((_n_L_b1 - _n_age_b0) * 3)),(float((_n_y_b9 + 38))/4))])
	return null
