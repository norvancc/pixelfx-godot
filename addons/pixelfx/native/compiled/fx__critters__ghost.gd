@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/ghost.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "shadow", _S.import_value("fx/critters/_lib.js", "shadow"))
	_S.define(_e, "at", _S.function_value(_e, "_f0"))
	_S.define(_e, "halfW", _S.function_value(_e, "_f1"))
	_S.define(_e, "sheet", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f10"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f14"))
	_S.define(_e, "meta", _S.merge([{"name": "Ghost"}, {"desc": "A sheet ghost bobs over the floor: its scalloped hem ripples and trails its drift, little arms flutter, it glances about and blinks, motes trickle off its hem."}, {"tags": ["critter", "ghost", "spirit", "undead", "spooky", "float", "loop"]}, {"size": [96, 100]}, {"origin": [48, 90]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#10142a", "#232c52", "#3e4f86", "#6b84bb", "#a3b8e2", "#d8e4ff", "#ffffff"]}, {"hover": 14}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 20), _S.unary("-", 40), 40, 46]))
	_S.define(_e, "R", 10.5)
	_exports["draw"] = _S.read(_e, "draw")
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_hover_b1 = _S.arg(_args,1)
	var _n_a_b2 = ((float(_n_t_b0)/_n_D) * _n_TAU)
	return {"x":(4 * sin(_n_a_b2)),"y":((-_n_hover_b1) - (3 * sin(((2 * _n_a_b2) + 0.8))))}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_h_b0 = _S.arg(_args,0)
	var _n_top_b1 = ((2 * _n_R) + 9)
	if _S.truth(((_n_h_b0 > _n_top_b1) if _S.truth((_n_h_b0 > _n_top_b1)) else (_n_h_b0 < (-1)))):
		return (-1)
	if _S.truth((_n_h_b0 > (_n_top_b1 - _n_R))):
		return sqrt(maxf(0,((_n_R * _n_R) - pow((_n_h_b0 - (_n_top_b1 - _n_R)),2))))
	return _S.numeric_lerp((_n_R + 2.2),_n_R,pow((float(_n_h_b0)/(_n_top_b1 - _n_R)),0.7))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_o_b3 = _S.arg(_args,3)
	var _n_lagX_b4 = _S.arg(_args,4)
	_S.invoke(_n_g_b0,"clear",[])
	var _n_top_b5 = ((2 * _n_R) + 9)
	var _n_ph_b6 = (((float(_n_t_b2)/_n_D) * _n_TAU) * 2)
	var _n_NL_b7 = 4
	var _n_HW_b8 = (_n_R + 2.2)
	var _n_LW_b9 = (float((2 * _n_HW_b8))/_n_NL_b7)
	var _n_off_b10 = _S.function_value(_S.capture(_parent,{"lagX":_n_lagX_b4,"top":_n_top_b5,"this":_this}),"_f3")
	var _n_lobe_b11 = _S.function_value(_S.capture(_parent,{"HW":_n_HW_b8,"LW":_n_LW_b9,"NL":_n_NL_b7,"ph":_n_ph_b6,"this":_this}),"_f4")
	var _n_inside_b12 = _S.function_value(_S.capture(_parent,{"off":_n_off_b10,"lobe":_n_lobe_b11,"this":_this}),"_f5")
	var _n_arm_b13 = _S.function_value(_S.capture(_parent,{"off":_n_off_b10,"ph":_n_ph_b6,"this":_this}),"_f6")
	var _n_any_b14 = _S.function_value(_S.capture(_parent,{"inside":_n_inside_b12,"arm":_n_arm_b13,"this":_this}),"_f7")
	var _n_lx_b15 = (-9)
	var _n_ly_b16 = ((-_n_top_b5) - 1)
	var _n_lit_b17 = _S.function_value(_S.capture(_parent,{"any":_n_any_b14,"lx":_n_lx_b15,"ly":_n_ly_b16,"this":_this}),"_f8")
	_S.invoke(_n_g_b0,"shade",[(-19), ((-_n_top_b5) - 2), 19, 5, _S.function_value(_S.capture(_parent,{"any":_n_any_b14,"off":_n_off_b10,"lit":_n_lit_b17,"top":_n_top_b5,"lobe":_n_lobe_b11,"NL":_n_NL_b7,"HW":_n_HW_b8,"LW":_n_LW_b9,"ph":_n_ph_b6,"C":_n_C_b1,"this":_this}),"_f9")])
	return {"inside":_n_inside_b12,"off":_n_off_b10,"top":_n_top_b5}
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_lagX = _S.read(_parent,"lagX")
	var _n_top = _S.read(_parent,"top")
	var _n_h_b0 = _S.arg(_args,0)
	return (_n_lagX * pow((1 - clampf((float(_n_h_b0)/_n_top),0.0,1.0)),1.4))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_HW = _S.read(_parent,"HW")
	var _n_LW = _S.read(_parent,"LW")
	var _n_NL = _S.read(_parent,"NL")
	var _n_ph = _S.read(_parent,"ph")
	var _n_X_b0 = _S.arg(_args,0)
	var _n_j_b1 = clampf(floori((float((_n_X_b0 + _n_HW))/_n_LW)),0,(_n_NL - 1))
	var _n_c_b2 = ((-_n_HW) + ((_n_j_b1 + 0.5) * _n_LW))
	var _n_u_b3 = (float((_n_X_b0 - _n_c_b2))/(float(_n_LW)/2))
	return {"j":_n_j_b1,"u":_n_u_b3,"d":((2.2 + (1.1 * sin((_n_ph - (_n_j_b1 * 1.5))))) * sqrt(maxf(0,(1 - (_n_u_b3 * _n_u_b3)))))}
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_off = _S.read(_parent,"off")
	var _n_lobe = _S.read(_parent,"lobe")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_h_b2 = (-_n_y_b1)
	var _n_X_b3 = (_n_x_b0 - _S.call_value(_n_off,[_n_h_b2]))
	if _S.truth((((-_n_h_b2) > _S.named_value(_S.call_value(_n_lobe,[_n_X_b3]),"d")) if _S.truth((_n_h_b2 < 0)) else (_n_h_b2 < 0))):
		return false
	var _n_hw_b4 = _S.call_value(_n_halfW,[maxf(0,_n_h_b2)])
	return ((absf(_n_X_b3) <= _n_hw_b4) if _S.truth((_n_hw_b4 >= 0)) else (_n_hw_b4 >= 0))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_off = _S.read(_parent,"off")
	var _n_ph = _S.read(_parent,"ph")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b2 = _iter_0
		var _n_ax_b3 = ((_n_s_b2 * (_n_R + 1.2)) + _S.call_value(_n_off,[13]))
		var _n_ay_b4 = ((-13) + (1.6 * sin((_n_ph + (_n_s_b2 * 1.3)))))
		if _S.truth(((pow((float((_n_x_b0 - _n_ax_b3))/3),2) + pow((float((_n_y_b1 - _n_ay_b4))/2.2),2)) <= 1)):
			return true
	return false
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_inside = _S.read(_parent,"inside")
	var _n_arm = _S.read(_parent,"arm")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.logical("||",_S.call_value(_n_inside,[_n_x_b0, _n_y_b1]),func():return _S.call_value(_n_arm,[_n_x_b0, _n_y_b1]))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_any = _S.read(_parent,"any")
	var _n_lx = _S.read(_parent,"lx")
	var _n_ly = _S.read(_parent,"ly")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	return _S.call_value(_n_any,[(_n_lx + (float((_n_x_b0 - _n_lx))/_n_k_b2)), (_n_ly + (float((_n_y_b1 - _n_ly))/_n_k_b2))])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_any = _S.read(_parent,"any")
	var _n_off = _S.read(_parent,"off")
	var _n_lit = _S.read(_parent,"lit")
	var _n_top = _S.read(_parent,"top")
	var _n_R = _S.read(_parent,"R")
	var _n_lobe = _S.read(_parent,"lobe")
	var _n_HW = _S.read(_parent,"HW")
	var _n_LW = _S.read(_parent,"LW")
	var _n_ph = _S.read(_parent,"ph")
	var _n_NL = _S.read(_parent,"NL")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o2_b2 = _S.arg(_args,2)
	if _S.truth(not _S.truth(_S.call_value(_n_any,[_n_x_b0, _n_y_b1]))):
		return 0
	var _n_h_b3 = (-_n_y_b1)
	var _n_X_b4 = (_n_x_b0 - _S.call_value(_n_off,[_n_h_b3]))
	var _n_i_b5 = (5 if _S.truth(_S.call_value(_n_lit,[_n_x_b0, _n_y_b1, 0.62])) else 4)
	if _S.truth(not _S.truth(_S.call_value(_n_any,[(_n_x_b0 + 2.4), (_n_y_b1 + 1.8)]))):
		_n_i_b5 = 3
	if _S.truth(_S.logical("&&",not _S.truth(_S.call_value(_n_any,[(_n_x_b0 + 1.2), (_n_y_b1 + 1)])),func():return (_n_X_b4 > 2))):
		_n_i_b5 = 2
	if _S.truth(_S.logical("&&",(not _S.truth(_S.call_value(_n_any,[(_n_x_b0 - 1.5), (_n_y_b1 - 1.5)])) if _S.truth(((_n_X_b4 < 1) if _S.truth((_n_h_b3 > ((_n_top - _n_R) - 2))) else (_n_h_b3 > ((_n_top - _n_R) - 2)))) else ((_n_X_b4 < 1) if _S.truth((_n_h_b3 > ((_n_top - _n_R) - 2))) else (_n_h_b3 > ((_n_top - _n_R) - 2)))),func():return _S.call_value(_n_any,[(_n_x_b0 - 0.6), (_n_y_b1 - 0.6)]))):
		_n_i_b5 = 6
	if _S.truth((_n_h_b3 < 1)):
		var _n_L_b6 = _S.call_value(_n_lobe,[_n_X_b4])
		if _S.truth(((_S.named_value(_n_L_b6,"u") > 0.1) if _S.truth((_S.named_value(_n_L_b6,"u") > 0.1)) else ((-_n_h_b3) > (_S.named_value(_n_L_b6,"d") - 1.2)))):
			_n_i_b5 = minf(_n_i_b5,3)
	if _S.truth(((_n_h_b3 >= (-0.5)) if _S.truth((_n_h_b3 < 7)) else (_n_h_b3 < 7))):
		if true:
			var _n_j_b7 = 1
			while _S.truth((_n_j_b7 < _n_NL)):
				var _n_cx_b8 = (((-_n_HW) + (_n_j_b7 * _n_LW)) + (0.6 * sin((_n_ph - _n_j_b7))))
				var _n_w_b9 = ((7 - _n_h_b3) * 0.09)
				if _S.truth((absf((_n_X_b4 - _n_cx_b8)) <= (_n_w_b9 + 0.3))):
					_n_i_b5 = minf(_n_i_b5,3)
				else:
					if _S.truth((_S.binary("===",_n_i_b5,4) if _S.truth((((_n_cx_b8 - _n_X_b4) < (_n_w_b9 + 1.3)) if _S.truth(((_n_cx_b8 - _n_X_b4) > (_n_w_b9 + 0.3))) else ((_n_cx_b8 - _n_X_b4) > (_n_w_b9 + 0.3)))) else (((_n_cx_b8 - _n_X_b4) < (_n_w_b9 + 1.3)) if _S.truth(((_n_cx_b8 - _n_X_b4) > (_n_w_b9 + 0.3))) else ((_n_cx_b8 - _n_X_b4) > (_n_w_b9 + 0.3))))):
						_n_i_b5 = 5
				_n_j_b7 += 1.0
	_S.set_prop(_n_o2_b2,"a",(0.86 if _S.truth((_n_h_b3 < 2)) else 0.95),"=")
	return _S.index_value(_n_C,_n_i_b5)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_at = _S.read(_parent,"at")
	var _n_GRID = _S.read(_parent,"GRID")
	var _n_sheet = _S.read(_parent,"sheet")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_S_b5 = _S.call_value(_n_at,[_n_t_b3, _S.named_value(_n_o_b2,"hover")])
	var _n_lagX_b6 = (_S.named_value(_S.call_value(_n_at,[(_n_t_b3 - 0.3), _S.named_value(_n_o_b2,"hover")]),"x") - _S.named_value(_n_S_b5,"x"))
	var _n_g_b7 = _n_GRID
	var _n_sh_b8 = _S.call_value(_n_sheet,[_n_g_b7, _n_C_b4, _n_t_b3, _n_o_b2, _n_lagX_b6])
	var _n_top_b9 = _S.named_value(_n_sh_b8,"top")
	var _n_look_b10 = (0 if _S.truth((_S.call_value(_n_wrap,[_n_t_b3, _n_D]) < 0.7)) else (1 if _S.truth((_S.call_value(_n_wrap,[_n_t_b3, _n_D]) < 1.3)) else ((-1) if _S.truth((_S.call_value(_n_wrap,[_n_t_b3, _n_D]) < 1.9)) else 0)))
	var _n_blink_b11 = _S.logical("&&",(_S.call_value(_n_wrap,[_n_t_b3, _n_D]) > 1.95),func():return (_S.call_value(_n_wrap,[_n_t_b3, _n_D]) < 2.03))
	var _n_ey_b12 = (((-_n_top_b9) + _n_R) - 1)
	var _n_mo_b13 = (0.5 + (0.5 * sin((((float(_n_t_b3)/_n_D) * _n_TAU) * 2))))
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b15 = _iter_0
		var _n_ex_b16 = (((_n_s_b15 * 4) - (1 if _S.truth((_n_s_b15 > 0)) else 0)) + _n_look_b10)
		if _S.truth(_n_blink_b11):
			_S.invoke(_n_g_b7,"set",[_n_ex_b16, (_n_ey_b12 + 2), _S.index_value(_n_C_b4,1)])
			_S.invoke(_n_g_b7,"set",[(_n_ex_b16 + 1), (_n_ey_b12 + 2), _S.index_value(_n_C_b4,1)])
		else:
			if true:
				var _n_k_b17 = 0
				while _S.truth((_n_k_b17 < 4)):
					_S.invoke(_n_g_b7,"set",[_n_ex_b16, (_n_ey_b12 + _n_k_b17), _S.index_value(_n_C_b4,0)])
					_S.invoke(_n_g_b7,"set",[(_n_ex_b16 + 1), (_n_ey_b12 + _n_k_b17), _S.index_value(_n_C_b4,0)])
					_n_k_b17 += 1.0
			_S.invoke(_n_g_b7,"set",[(_n_ex_b16 + (0 if _S.truth((_n_look_b10 < 0)) else 1)), _n_ey_b12, _S.index_value(_n_C_b4,2)])
	var _n_my_b14 = (_n_ey_b12 + 6)
	_S.invoke(_n_g_b7,"set",[(_n_look_b10 - 1), _n_my_b14, _S.index_value(_n_C_b4,1)])
	_S.invoke(_n_g_b7,"set",[_n_look_b10, _n_my_b14, _S.index_value(_n_C_b4,1)])
	if _S.truth((_n_mo_b13 > 0.4)):
		_S.invoke(_n_g_b7,"set",[(_n_look_b10 - 1), (_n_my_b14 + 1), _S.index_value(_n_C_b4,0)])
		_S.invoke(_n_g_b7,"set",[_n_look_b10, (_n_my_b14 + 1), _S.index_value(_n_C_b4,0)])
	_S.invoke(_n_g_b7,"outline",[_S.function_value(_S.capture(_parent,{"C":_n_C_b4,"this":_this}),"_f11"), 0.95])
	_S.invoke(_n_g_b7,"draw",[_n_p_b0, 1, _S.named_value(_n_S_b5,"x"), _S.named_value(_n_S_b5,"y")])
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, 12, ((_S.named_value(_n_o_b2,"seed") * 3) + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f12"), _S.function_value(_S.capture(_parent,{"t":_n_t_b3,"o":_n_o_b2,"p":_n_p_b0,"C":_n_C_b4,"this":_this}),"_f13")])
	_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_S_b5,"x"), (_S.named_value(_n_S_b5,"y") - (_n_top_b9 * 0.55)), 54, _S.index_value(_n_C_b4,3), 0.3])
	_S.invoke(_n_p_b0,"glow",[(_S.named_value(_n_S_b5,"x") - 3), (_S.named_value(_n_S_b5,"y") - (_n_top_b9 * 0.72)), 14, _S.index_value(_n_C_b4,5), 0.12])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_nx_b2 = _S.arg(_args,2)
	var _n_ny_b3 = _S.arg(_args,3)
	return (_S.index_value(_n_C,2) if _S.truth((_n_ny_b3 > 0)) else _S.index_value(_n_C,1))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1, 1.7])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_o = _S.read(_parent,"o")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_S0_b4 = _S.call_value(_n_at,[_S.call_value(_n_wrap,[(_n_t - _n_age_b0), _n_D]), _S.named_value(_n_o,"hover")])
	var _n_k_b5 = (float(_n_age_b0)/_n_L_b1)
	var _n_x0_b6 = (_S.named_value(_n_S0_b4,"x") + _S.invoke(_n_r_b2,"range",[(-10), 10]))
	var _n_y0_b7 = (_S.named_value(_n_S0_b4,"y") + 1.5)
	var _n_x_b8 = (_n_x0_b6 + (sin(((_n_age_b0 * 2.2) + _n_i_b3)) * 2.4))
	var _n_y_b9 = ((_n_y0_b7 + (_S.invoke(_n_r_b2,"range",[5, 11]) * _n_age_b0)) - ((3 * _n_age_b0) * _n_age_b0))
	var _n_a_b10 = (minf(1,(_n_k_b5 * 6)) * minf(1,((1 - _n_k_b5) * 2.2)))
	var _n_tw_b11 = (0.6 + (0.4 * sin(((_n_age_b0 * 8) + (_n_i_b3 * 1.7)))))
	_S.invoke(_n_p,"dot",[_n_x_b8, _n_y_b9, (_S.index_value(_n_C,6) if _S.truth((_n_tw_b11 > 0.8)) else _S.index_value(_n_C,5)), _n_a_b10])
	if _S.truth(_S.invoke(_n_r_b2,"chance",[0.3])):
		_S.invoke(_n_p,"dot",[_n_x_b8, (_n_y_b9 - 1), _S.index_value(_n_C,4), (_n_a_b10 * 0.7)])
	_S.invoke(_n_p,"glow",[_n_x_b8, _n_y_b9, 7, _S.index_value(_n_C,4), ((0.42 * _n_a_b10) * _n_tw_b11)])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_at = _S.read(_parent,"at")
	var _n_shadow = _S.read(_parent,"shadow")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_S_b5 = _S.call_value(_n_at,[_n_t_b3, _S.named_value(_n_o_b2,"hover")])
	var _n_hgt_b6 = clampf((float(((-_S.named_value(_n_S_b5,"y")) - 8))/16),0.0,1.0)
	_S.call_value(_n_shadow,[_n_p_b0, _S.named_value(_n_S_b5,"x"), 0, (11 - (3 * _n_hgt_b6)), 1.6, _S.index_value(_n_C_b4,0), (0.55 - (0.2 * _n_hgt_b6))])
	if true:
		var _n_x_b7 = (-24)
		while _S.truth((_n_x_b7 <= 24)):
			_S.invoke(_n_p_b0,"glow",[(_S.named_value(_n_S_b5,"x") + _n_x_b7), (-1), 16, _S.index_value(_n_C_b4,4), ((0.14 * (1 - (float(absf(_n_x_b7))/34))) * (1 - (0.4 * _n_hgt_b6)))])
			_n_x_b7 += 6
	return null
