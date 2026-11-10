@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/plasma-shot.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "beat", _S.import_value("fx/projectiles/_lib.js", "beat"))
	_S.define(_e, "wake", _S.import_value("fx/projectiles/_lib.js", "wake"))
	_S.define(_e, "spark", _S.import_value("fx/projectiles/_lib.js", "spark"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Plasma shot"}, {"desc": "A glowing plasma blob: hot knots churning in its core, a corona crackling over its skin, its tail necking into droplets that tear off, cool and wink out behind."}, {"tags": ["projectile", "plasma", "energy", "sci-fi", "directional", "loop"]}, {"size": [144, 60]}, {"origin": [108, 30]}, {"duration": 0.8}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#061a1c", "#0b3b34", "#0f6a4a", "#18a05a", "#3fd46a", "#8cf57e", "#d6ffc4", "#ffffff"]}, {"size": 6}, {"speed": 200}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_beat = _S.read(_parent,"beat")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_R_b4 = _S.named_value(_n_o_b2,"size")
	var _n_V_b5 = _S.named_value(_n_o_b2,"speed")
	var _n_S_b6 = _S.named_value(_n_o_b2,"seed")
	var _n_D_b7 = _S.named_value(_n_meta,"duration")
	var _n_w_b8 = (float((_n_TAU * _n_t_b1))/_n_D_b7)
	var _n_fr_b9 = floori(((_n_t_b1 * 30) + 0.000001))
	var _n_left_b10 = ((-_S.index_value(_S.named_value(_n_meta,"origin"),0)) + 2)
	var _n_T0_b11 = ((-_n_R_b4) * 3.2)
	var _n_tail_b12 = _S.function_value(_S.capture(_parent,{"w":_n_w_b8,"T0":_n_T0_b11,"this":_this}),"_f1")
	if true:
		var _n_x_b18 = _n_T0_b11
		while _S.truth((_n_x_b18 > (_n_T0_b11 - 44))):
			var _n_u_b19 = (float((_n_T0_b11 - _n_x_b18))/44)
			var _n_y_b20 = _S.call_value(_n_tail_b12,[_n_x_b18])
			_S.invoke(_n_p_b0,"dot",[_n_x_b18, _n_y_b20, (_S.index_value(_n_C_b3,6) if _S.truth((_n_u_b19 < 0.2)) else (_S.index_value(_n_C_b3,5) if _S.truth((_n_u_b19 < 0.45)) else _S.index_value(_n_C_b3,4))), (1 if _S.truth((_n_u_b19 < 0.55)) else (float((1 - _n_u_b19))/0.45))])
			if _S.truth((_n_u_b19 < 0.3)):
				_S.invoke(_n_p_b0,"px",[_n_x_b18, (_n_y_b20 + 1), (_S.index_value(_n_C_b3,5) if _S.truth((_n_u_b19 < 0.15)) else _S.index_value(_n_C_b3,4))])
			_n_x_b18 -= 1
	var _n_balls_b13 = [{"x":0,"y":0,"r":_n_R_b4,"h":1,"core":0.8}]
	if true:
		var _n_i_b21 = 0
		while _S.truth((_n_i_b21 < 3)):
			var _n_a_b22 = ((_n_w_b8 * _S.index_value([2, (-3), 5],_n_i_b21)) + (float((_n_i_b21 * _n_TAU))/3))
			var _n_d_b23 = (_n_R_b4 * (0.5 + (0.1 * sin(((_n_w_b8 * 3) + (_n_i_b21 * 2))))))
			_S.invoke(_n_balls_b13,"push",[{"x":((cos(_n_a_b22) * _n_d_b23) - 0.4),"y":((sin(_n_a_b22) * _n_d_b23) * 0.8),"r":(_n_R_b4 * 0.32),"h":1,"core":1}])
			_n_i_b21 += 1.0
	if true:
		var _n_i_b24 = 1
		while _S.truth((_n_i_b24 <= 6)):
			var _n_x_b25 = ((-_n_R_b4) * (0.5 + (_n_i_b24 * 0.42)))
			var _n_wag_b26 = (sin(((_n_w_b8 * 2) - (_n_i_b24 * 0.9))) * (0.3 + (_n_i_b24 * 0.28)))
			var _n_r_b27 = (_n_R_b4 * (0.62 - (_n_i_b24 * 0.08)))
			_S.invoke(_n_balls_b13,"push",[{"x":_n_x_b25,"y":_n_wag_b26,"r":_n_r_b27,"h":(0.96 - (_n_i_b24 * 0.05)),"core":(float(sqrt(((5.2 - (_n_i_b24 * 0.65)) * 0.3)))/_n_r_b27)}])
			_n_i_b24 += 1.0
	var _n_drops_b14 = []
	_S.call_value(_n_cycle,[_n_t_b1, _n_D_b7, 11, _n_S_b6, _S.function_value(_S.capture(_parent,{"this":_this}),"_f2"), _S.function_value(_S.capture(_parent,{"R":_n_R_b4,"w":_n_w_b8,"drops":_n_drops_b14,"this":_this}),"_f3")])
	var _n_all_b15 = _S.invoke(_n_balls_b13,"concat",[_n_drops_b14])
	_S.invoke(_n_p_b0,"shade",[(((-_n_R_b4) * 2.6) - 60), (((-_n_R_b4) * 2) - 8), (_n_R_b4 * 1.6), ((_n_R_b4 * 2) + 8), _S.function_value(_S.capture(_parent,{"all":_n_all_b15,"C":_n_C_b3,"R":_n_R_b4,"this":_this}),"_f4")])
	if true:
		var _n_j_b28 = 0
		while _S.truth((_n_j_b28 < 3)):
			var _n_g_b29 = _S.MathFX.rng([_n_fr_b9,_n_j_b28,_n_S_b6])
			var _n_a0_b30 = _S.invoke(_n_g_b29,"range",[(-2.3), 2.3])
			var _n_span_b31 = (_S.invoke(_n_g_b29,"range",[0.45, 0.9]) * _S.invoke(_n_g_b29,"sign",[]))
			var _n_n_b32 = 6
			var _n_hgt_b33 = _S.invoke(_n_g_b29,"range",[1.5, 3.5])
			var _n_pts_b34 = []
			if true:
				var _n_i_b35 = 0
				while _S.truth((_n_i_b35 <= _n_n_b32)):
					var _n_a_b36 = (_n_a0_b30 + (float((_n_span_b31 * _n_i_b35))/_n_n_b32))
					var _n_rr_b37 = (((_n_R_b4 + 0.6) + (_n_hgt_b33 * sin((float((PI * _n_i_b35))/_n_n_b32)))) + (_S.invoke(_n_g_b29,"range",[(-0.5), 0.5]) if _S.truth(fmod(_n_i_b35,_n_n_b32)) else 0))
					_S.invoke(_n_pts_b34,"push",[[((cos(_n_a_b36) * _n_rr_b37) - 0.4), ((sin(_n_a_b36) * _n_rr_b37) * 0.92)]])
					_n_i_b35 += 1.0
			_S.invoke(_n_p_b0,"polyline",[_n_pts_b34, (_S.index_value(_n_C_b3,5) if _S.truth(_n_j_b28) else _S.index_value(_n_C_b3,6))])
			_S.invoke(_n_p_b0,"px",[_S.index_value(_S.index_value(_n_pts_b34,3),0), _S.index_value(_S.index_value(_n_pts_b34,3),1), _n_WHITE])
			_S.invoke(_n_p_b0,"glow",[_S.index_value(_S.index_value(_n_pts_b34,3),0), _S.index_value(_S.index_value(_n_pts_b34,3),1), 6, _S.index_value(_n_C_b3,5), 0.4])
			_n_j_b28 += 1.0
	if true:
		var _n_j_b38 = 0
		while _S.truth((_n_j_b38 < 4)):
			var _n_g_b39 = _S.MathFX.rng([_n_fr_b9,(_n_j_b38 + 9),_n_S_b6])
			var _n_a_b40 = _S.invoke(_n_g_b39,"range",[(-2.2), 2.2])
			var _n_l_b41 = _S.invoke(_n_g_b39,"range",[1.5, 4])
			var _n_r0_b42 = (_n_R_b4 + 1)
			var _n_x0_b43 = ((cos(_n_a_b40) * _n_r0_b42) - 0.4)
			var _n_y0_b44 = ((sin(_n_a_b40) * _n_r0_b42) * 0.92)
			_S.invoke(_n_p_b0,"line",[_n_x0_b43, _n_y0_b44, (_n_x0_b43 + (cos(_n_a_b40) * _n_l_b41)), (_n_y0_b44 + (sin(_n_a_b40) * _n_l_b41)), (_S.index_value(_n_C_b3,4) if _S.truth(fmod(_n_j_b38,2)) else _S.index_value(_n_C_b3,5))])
			_n_j_b38 += 1.0
	var _n_SP_b16 = [_n_WHITE, _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5), _S.index_value(_n_C_b3,3)]
	_S.call_value(_n_beat,[_n_t_b1, _n_D_b7, 14, (_n_S_b6 + 5), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"R":_n_R_b4,"V":_n_V_b5,"left":_n_left_b10,"p":_n_p_b0,"SP":_n_SP_b16,"this":_this}),"_f6")])
	var _n_pulse_b17 = (0.85 + (0.15 * sin((_n_w_b8 * 4))))
	_S.invoke(_n_p_b0,"glow",[(-2), 0, 34, _S.index_value(_n_C_b3,3), (0.8 * _n_pulse_b17)])
	_S.invoke(_n_p_b0,"glow",[0, 0, 16, _S.index_value(_n_C_b3,4), (0.35 * _n_pulse_b17)])
	_S.invoke(_n_p_b0,"glow",[1, 0, 7, _S.index_value(_n_C_b3,6), (0.3 * _n_pulse_b17)])
	_S.invoke(_n_p_b0,"glowLine",[(-_n_R_b4), 0, ((-_n_R_b4) * 4.6), 0, 7, _S.index_value(_n_C_b3,3), 0.3])
	for _iter_0 in _S.array(_n_drops_b14):
		var _n_d_b45 = _iter_0
		if _S.truth((_S.named_value(_n_d_b45,"x") < (_n_left_b10 + 4))):
			continue
		if _S.truth(((_S.named_value(_n_d_b45,"x") < ((-_n_R_b4) * 3.5)) if _S.truth((_S.named_value(_n_d_b45,"k") < 0.6)) else (_S.named_value(_n_d_b45,"k") < 0.6))):
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_d_b45,"x"), _S.named_value(_n_d_b45,"y"), (_S.index_value(_n_C_b3,7) if _S.truth((_S.named_value(_n_d_b45,"k") < 0.3)) else _S.index_value(_n_C_b3,6))])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_d_b45,"x"), _S.named_value(_n_d_b45,"y"), (3 + (_S.named_value(_n_d_b45,"r") * 2)), _S.index_value(_n_C_b3,2), (0.6 * (1 - _S.named_value(_n_d_b45,"k")))])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_w = _S.read(_parent,"w")
	var _n_T0 = _S.read(_parent,"T0")
	var _n_x_b0 = _S.arg(_args,0)
	return (sin(((_n_x_b0 * 0.2) + (_n_w * 2))) * (0.3 + ((float((_n_T0 - _n_x_b0))/44) * 1.8)))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.34, 0.5])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_w = _S.read(_parent,"w")
	var _n_drops = _S.read(_parent,"drops")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_pull_b4 = _S.invoke(_n_r_b2,"range",[450, 800])
	var _n_x_b5 = ((((-_n_R) * 2.9) - (((0.5 * _n_pull_b4) * _n_age_b0) * _n_age_b0)) - (_S.invoke(_n_r_b2,"range",[0, 16]) * _n_age_b0))
	var _n_y_b6 = ((sin((((_n_w * 2) - 5.4) + (_n_age_b0 * 12))) * 2) + ((_S.invoke(_n_r_b2,"range",[(-30), 30]) * _n_age_b0) * (0.4 + _n_age_b0)))
	var _n_rad_b7 = ((_n_R * _S.invoke(_n_r_b2,"range",[0.3, 0.48])) * (1 - (_n_k_b3 * 0.6)))
	_S.invoke(_n_drops,"push",[{"x":_n_x_b5,"y":_n_y_b6,"r":_n_rad_b7,"h":(0.97 * (1 - (_n_k_b3 * 0.75))),"core":(float(sqrt(((maxf(0,(1 - (_n_k_b3 * 1.3))) * 7) * 0.3)))/_n_rad_b7),"k":_n_k_b3}])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_all = _S.read(_parent,"all")
	var _n_C = _S.read(_parent,"C")
	var _n_R = _S.read(_parent,"R")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_f_b2 = 0
	var _n_heat_b3 = 0
	var _n_hh_b4 = 0
	for _iter_0 in _S.array(_n_all):
		var _n_b_b7 = _iter_0
		var _n_dx_b8 = (_n_x_b0 - _S.named_value(_n_b_b7,"x"))
		var _n_dy_b9 = (_n_y_b1 - _S.named_value(_n_b_b7,"y"))
		var _n_d2_b10 = ((_n_dx_b8 * _n_dx_b8) + (_n_dy_b9 * _n_dy_b9))
		var _n_q_b11 = (float(_n_d2_b10)/((4 * _S.named_value(_n_b_b7,"r")) * _S.named_value(_n_b_b7,"r")))
		if _S.truth((_n_q_b11 < 1)):
			var _n_c_b12 = (float(((1 - _n_q_b11) * (1 - _n_q_b11)))/0.5625)
			_n_f_b2 += _n_c_b12
			_n_heat_b3 += (_n_c_b12 * _S.named_value(_n_b_b7,"h"))
		if _S.truth(_S.named_value(_n_b_b7,"core")):
			_n_hh_b4 += (float((((_S.named_value(_n_b_b7,"core") * _S.named_value(_n_b_b7,"core")) * _S.named_value(_n_b_b7,"r")) * _S.named_value(_n_b_b7,"r")))/(_n_d2_b10 + 0.3))
	if _S.truth((_n_f_b2 < 1)):
		return null
	var _n_lvl_b5 = (7 if _S.truth((_n_hh_b4 > 10)) else (6 if _S.truth((_n_hh_b4 > 4.6)) else (5 if _S.truth((_n_hh_b4 > 2.2)) else (4 if _S.truth((_n_f_b2 > 1.4)) else 3))))
	var _n_cap_b6 = floori((2 + ((float(_n_heat_b3)/_n_f_b2) * 5.4))+0.5)
	return _S.index_value(_n_C,maxf(2,minf(((_n_lvl_b5 + 1) if _S.truth(((_n_lvl_b5 < 5) if _S.truth((_n_x_b0 > (_n_R * 0.3))) else (_n_x_b0 > (_n_R * 0.3)))) else _n_lvl_b5),_n_cap_b6)))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.12, 0.3])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_V = _S.read(_parent,"V")
	var _n_wake = _S.read(_parent,"wake")
	var _n_left = _S.read(_parent,"left")
	var _n_p = _S.read(_parent,"p")
	var _n_SP = _S.read(_parent,"SP")
	var _n_spark = _S.read(_parent,"spark")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.invoke(_n_r_b2,"range",[(-2.4), 2.4])
	var _n_sp_b4 = _S.invoke(_n_r_b2,"range",[60, 130])
	var _tuple_0 = _S.call_value(_n_wake,[(cos(_n_a_b3) * (_n_R + 1)), (sin(_n_a_b3) * (_n_R + 1)), (cos(_n_a_b3) * _n_sp_b4), (sin(_n_a_b3) * _n_sp_b4), _n_age_b0, (_n_V * 0.7), 4, 0])
	var _n_x_b5 = _S.prop(_tuple_0,0)
	var _n_y_b6 = _S.prop(_tuple_0,1)
	var _n_vx_b7 = _S.prop(_tuple_0,2)
	var _n_vy_b8 = _S.prop(_tuple_0,3)
	if _S.truth(((absf(_n_y_b6) < 26) if _S.truth((_n_x_b5 > (_n_left + 4))) else (_n_x_b5 > (_n_left + 4)))):
		_S.call_value(_n_spark,[_n_p, _n_x_b5, _n_y_b6, _n_vx_b7, _n_vy_b8, (1 - (float(_n_age_b0)/_n_life_b1)), _n_SP, 0.4, 0.015, 6])
	return null
