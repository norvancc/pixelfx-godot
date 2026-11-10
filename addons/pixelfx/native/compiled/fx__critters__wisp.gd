@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/wisp.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Swarm", _S.import_value("fx/critters/_lib.js", "Swarm"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "lnoise", _S.import_value("fx/critters/_lib.js", "lnoise"))
	_S.define(_e, "tongue", _S.import_value("fx/critters/_lib.js", "tongue"))
	_S.define(_e, "firePuff", _S.import_value("fx/critters/_lib.js", "firePuff"))
	_S.define(_e, "shadow", _S.import_value("fx/critters/_lib.js", "shadow"))
	_S.define(_e, "at", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Wisp"}, {"desc": "A will-o'-the-wisp loops a figure-eight over the floor: a little soul-flame with a face, its flame tail licking up and streaming behind, shedding puffs and sparks."}, {"tags": ["critter", "wisp", "spirit", "flame", "magic", "flying", "loop"]}, {"size": [128, 104]}, {"origin": [64, 96]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0a1f2e", "#0f3d52", "#14707e", "#1fa8a8", "#4fe0c8", "#a8fff0", "#ffffff"]}, {"hover": 36}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SWARM", _S.construct(_S.read(_e, "Swarm"), []))
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
	return {"x":(34 * sin(_n_a_b2)),"y":((-_n_hover_b1) - (10 * sin((2 * _n_a_b2)))),"vx":((float((34 * _n_TAU))/_n_D) * cos(_n_a_b2)),"vy":((float(((-20) * _n_TAU))/_n_D) * cos((2 * _n_a_b2)))}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_at = _S.read(_parent,"at")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_lnoise = _S.read(_parent,"lnoise")
	var _n_tongue = _S.read(_parent,"tongue")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_SWARM = _S.read(_parent,"SWARM")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_S_b5 = _S.call_value(_n_at,[_n_t_b3, _S.named_value(_n_o_b2,"hover")])
	var _n_heat_b6 = [_S.index_value(_n_C_b4,6), _S.index_value(_n_C_b4,6), _S.index_value(_n_C_b4,5), _S.index_value(_n_C_b4,5), _S.index_value(_n_C_b4,4), _S.index_value(_n_C_b4,4), _S.index_value(_n_C_b4,3), _S.index_value(_n_C_b4,3), _S.index_value(_n_C_b4,3)]
	var _n_lean_b7 = clampf((float((-_S.named_value(_n_S_b5,"vx")))/80),(-0.9),0.9)
	var _n_stretch_b8 = clampf((float(_S.named_value(_n_S_b5,"vy"))/120),(-0.3),0.4)
	var _n_X_b9 = _S.named_value(_n_S_b5,"x")
	var _n_Y_b10 = _S.named_value(_n_S_b5,"y")
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, 30, ((_S.named_value(_n_o_b2,"seed") * 7) + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f2"), _S.function_value(_S.capture(_parent,{"t":_n_t_b3,"o":_n_o_b2,"p":_n_p_b0,"heat":_n_heat_b6,"this":_this}),"_f3")])
	var _n_tails_b11 = [[(-3.5), 13, 2.5, 3], [3.5, 14, 2.5, 7], [0, 20, 3.2, 11]]
	if true:
		var _n_li_b17 = 0
		while _S.truth((_n_li_b17 < 4)):
			for _iter_0 in _S.array(_n_tails_b11):
				var _tuple_1 = _iter_0
				var _n_dx_b18 = _S.prop(_tuple_1,0)
				var _n_h_b19 = _S.prop(_tuple_1,1)
				var _n_w_b20 = _S.prop(_tuple_1,2)
				var _n_n_b21 = _S.prop(_tuple_1,3)
				var _n_hh_b22 = ((_n_h_b19 + ((0.25 * _n_h_b19) * _S.call_value(_n_lnoise,[_n_t_b3, _n_D, 9, _n_n_b21, 5]))) * (1 + _n_stretch_b8))
				_S.call_value(_n_tongue,[_n_p_b0, (_n_X_b9 + _n_dx_b18), (_n_Y_b10 - 2), _n_hh_b22, _n_w_b20, ((_S.call_value(_n_lnoise,[_n_t_b3, _n_D, 6, _n_n_b21, 40]) * 1.5) + ((_n_lean_b7 * _n_hh_b22) * 0.9)), _n_t_b3, _n_D, _n_n_b21, _n_heat_b6, _n_li_b17])
			_n_li_b17 += 1.0
	var _n_R_b12 = 7.5
	_S.invoke(_n_p_b0,"shade",[((_n_X_b9 - _n_R_b12) - 2), ((_n_Y_b10 - _n_R_b12) - 2), ((_n_X_b9 + _n_R_b12) + 2), ((_n_Y_b10 + _n_R_b12) + 2), _S.function_value(_S.capture(_parent,{"X":_n_X_b9,"Y":_n_Y_b10,"R":_n_R_b12,"t":_n_t_b3,"C":_n_C_b4,"this":_this}),"_f4")])
	var _n_look_b13 = floori(clampf((float(_S.named_value(_n_S_b5,"vx"))/60),(-1),1)+0.5)
	var _n_blink_b14 = _S.logical("&&",(_S.call_value(_n_wrap,[_n_t_b3, _n_D]) > 2.2),func():return (_S.call_value(_n_wrap,[_n_t_b3, _n_D]) < 2.28))
	for _iter_2 in _S.array([(-1), 1]):
		var _n_s_b23 = _iter_2
		var _n_ex_b24 = (((floori(_n_X_b9+0.5) + (_n_s_b23 * 2)) - (0 if _S.truth((_n_s_b23 > 0)) else 1)) + _n_look_b13)
		var _n_ey_b25 = (floori(_n_Y_b10+0.5) - 1)
		if _S.truth(_n_blink_b14):
			_S.invoke(_n_p_b0,"px",[_n_ex_b24, (_n_ey_b25 + 1), _S.index_value(_n_C_b4,1)])
			_S.invoke(_n_p_b0,"px",[(_n_ex_b24 + 1), (_n_ey_b25 + 1), _S.index_value(_n_C_b4,1)])
		else:
			if true:
				var _n_k_b26 = 0
				while _S.truth((_n_k_b26 < 3)):
					_S.invoke(_n_p_b0,"px",[_n_ex_b24, (_n_ey_b25 + _n_k_b26), _S.index_value(_n_C_b4,1)])
					_S.invoke(_n_p_b0,"px",[(_n_ex_b24 + 1), (_n_ey_b25 + _n_k_b26), _S.index_value(_n_C_b4,1)])
					_n_k_b26 += 1.0
			_S.invoke(_n_p_b0,"px",[(_n_ex_b24 + (1 if _S.truth((_n_look_b13 > 0)) else 0)), _n_ey_b25, _S.index_value(_n_C_b4,6)])
	_S.invoke(_n_p_b0,"px",[(floori(_n_X_b9+0.5) + _n_look_b13), (floori(_n_Y_b10+0.5) + 3), _S.index_value(_n_C_b4,2)])
	_S.invoke(_n_p_b0,"px",[((floori(_n_X_b9+0.5) - 1) + _n_look_b13), (floori(_n_Y_b10+0.5) + 3), _S.index_value(_n_C_b4,2)])
	var _n_sw_b15 = _S.invoke(_n_SWARM,"begin",[_n_t_b3])
	_S.set_prop(_S.named_value(_n_sw_b15,"ps"),"sparks",[_S.index_value(_n_C_b4,6), _S.index_value(_n_C_b4,5), _S.index_value(_n_C_b4,4), _S.index_value(_n_C_b4,3)],"=")
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, 26, ((_S.named_value(_n_o_b2,"seed") * 7) + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"t":_n_t_b3,"o":_n_o_b2,"sw":_n_sw_b15,"C":_n_C_b4,"this":_this}),"_f6")])
	_S.invoke(_n_sw_b15,"draw",[_n_p_b0])
	var _n_fl_b16 = (0.85 + (0.15 * _S.call_value(_n_lnoise,[_n_t_b3, _n_D, 22, 0, 9])))
	_S.invoke(_n_p_b0,"glow",[(_n_X_b9 + (_n_lean_b7 * 3)), (_n_Y_b10 - 6), (46 * _n_fl_b16), _S.index_value(_n_C_b4,4), 0.38])
	_S.invoke(_n_p_b0,"glow",[_n_X_b9, (_n_Y_b10 - 1), 13, _S.index_value(_n_C_b4,5), (0.35 * _n_fl_b16)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.3, 0.6])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_o = _S.read(_parent,"o")
	var _n_fly = _S.read(_parent,"fly")
	var _n_p = _S.read(_parent,"p")
	var _n_heat = _S.read(_parent,"heat")
	var _n_firePuff = _S.read(_parent,"firePuff")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_S0_b3 = _S.call_value(_n_at,[_S.call_value(_n_wrap,[(_n_t - _n_age_b0), _n_D]), _S.named_value(_n_o,"hover")])
	var _tuple_0 = _S.call_value(_n_fly,[(_S.named_value(_n_S0_b3,"x") + _S.invoke(_n_r_b2,"range",[(-3), 3])), (_S.named_value(_n_S0_b3,"y") - _S.invoke(_n_r_b2,"range",[0, 4])), _S.invoke(_n_r_b2,"range",[(-8), 8]), (-_S.invoke(_n_r_b2,"range",[6, 16])), _n_age_b0, (-40), 2.5])
	var _n_x_b4 = _S.prop(_tuple_0,0)
	var _n_y_b5 = _S.prop(_tuple_0,1)
	_S.call_value(_n_firePuff,[_n_p, _n_x_b4, _n_y_b5, (1 - (float(_n_age_b0)/_n_L_b1)), _S.invoke(_n_r_b2,"range",[1.2, 2.6]), (_S.invoke(_n_r_b2,"next",[]) * 100), _n_heat])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_X = _S.read(_parent,"X")
	var _n_Y = _S.read(_parent,"Y")
	var _n_R = _S.read(_parent,"R")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_lnoise = _S.read(_parent,"lnoise")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_x_b0 - _n_X)
	var _n_dy_b4 = (_n_y_b1 - _n_Y)
	var _n_ang_b5 = atan2(_n_dy_b4,_n_dx_b3)
	var _n_rr_b6 = ((_n_R + (0.7 * _S.call_value(_n_lnoise,[_n_t, _n_D, 16, ((_n_ang_b5 * 1.6) + 10), 3]))) + ((-0.6) if _S.truth((_n_dy_b4 > 0)) else 0))
	var _n_d_b7 = (float(_S.Bridge.hypot([_n_dx_b3, _n_dy_b4]))/_n_rr_b6)
	if _S.truth((_n_d_b7 > 1)):
		return 0
	return (_S.index_value(_n_C,6) if _S.truth((_n_d_b7 < 0.42)) else (_S.index_value(_n_C,5) if _S.truth((_n_d_b7 < 0.68)) else (_S.index_value(_n_C,4) if _S.truth((_n_d_b7 < 0.88)) else _S.index_value(_n_C,3))))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.8, 1.6])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_o = _S.read(_parent,"o")
	var _n_fly = _S.read(_parent,"fly")
	var _n_sw = _S.read(_parent,"sw")
	var _n_P = _S.read(_parent,"P")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_S0_b3 = _S.call_value(_n_at,[_S.call_value(_n_wrap,[(_n_t - _n_age_b0), _n_D]), _S.named_value(_n_o,"hover")])
	var _n_s_b4 = (_S.invoke(_n_r_b2,"next",[]) * 100)
	var _tuple_0 = _S.call_value(_n_fly,[(_S.named_value(_n_S0_b3,"x") + _S.invoke(_n_r_b2,"range",[(-5), 5])), (_S.named_value(_n_S0_b3,"y") - _S.invoke(_n_r_b2,"range",[4, 12])), _S.invoke(_n_r_b2,"range",[(-20), 20]), (-_S.invoke(_n_r_b2,"range",[20, 45])), _n_age_b0, (-15), 1.6])
	var _n_x_b5 = _S.prop(_tuple_0,0)
	var _n_y_b6 = _S.prop(_tuple_0,1)
	_S.invoke(_n_sw,"add",[_S.named_value(_n_P,"EMBER"), (_n_x_b5 + ((sin(((_n_age_b0 * 2.3) + _n_s_b4)) * 3) * minf(1,_n_age_b0))), _n_y_b6, 0, 0, _n_age_b0, _n_L_b1, _S.index_value(_n_C,4), (2 if _S.truth(_S.invoke(_n_r_b2,"chance",[0.3])) else 1), 0, _n_s_b4])
	return null

static func _f7(_parent,_args:Array,_this=null):
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
	var _n_near_b6 = clampf((1 - (float(((-_S.named_value(_n_S_b5,"y")) - 24))/30)),0.0,1.0)
	_S.call_value(_n_shadow,[_n_p_b0, _S.named_value(_n_S_b5,"x"), 0, 7, 1.2, _S.index_value(_n_C_b4,0), 0.4])
	if true:
		var _n_x_b7 = (-24)
		while _S.truth((_n_x_b7 <= 24)):
			_S.invoke(_n_p_b0,"glow",[(_S.named_value(_n_S_b5,"x") + _n_x_b7), (-1), 16, _S.index_value(_n_C_b4,4), ((0.08 + (0.1 * _n_near_b6)) * (1 - (float(absf(_n_x_b7))/32)))])
			_n_x_b7 += 6
	return null
