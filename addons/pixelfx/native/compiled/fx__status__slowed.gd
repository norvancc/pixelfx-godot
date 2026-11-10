@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/slowed.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "hand", _S.function_value(_e, "_f0"))
	_S.define(_e, "dial", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Slowed"}, {"desc": "Dragged through time: a glassy clock dial behind the head ticks round in heavy steps, flashing with each, while drops sink in slow motion and spread slow rings."}, {"tags": ["status", "slow", "time", "clock", "debuff", "loop"]}, {"size": [64, 76]}, {"origin": [32, 68]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#081a24", "#0e3446", "#165a6e", "#2a8a9a", "#52bcc4", "#9ee6e0", "#e2fff8", "#ffffff"]}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "S1", _S.merge([{"turn": 0.3}, {"lean": 3}, {"crouch": 3}, {"ffx": 11}, {"ffy": _S.unary("-", 5)}, {"fbx": _S.unary("-", 9)}, {"fby": _S.unary("-", 5)}, {"toeB": true}, {"fx": _S.unary("-", 5)}, {"fy": _S.unary("-", 19)}, {"bx": 11}, {"by": _S.unary("-", 26)}]))
	_S.define(_e, "S2", _S.merge([{"turn": 0.3}, {"lean": 3}, {"crouch": 3}, {"ffx": _S.unary("-", 9)}, {"ffy": _S.unary("-", 5)}, {"toeF": true}, {"fbx": 11}, {"fby": _S.unary("-", 5)}, {"fx": 13}, {"fy": _S.unary("-", 26)}, {"bx": _S.unary("-", 4)}, {"by": _S.unary("-", 19)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "S1")], [1.2, _S.read(_e, "S2")], [2.4, _S.read(_e, "S1")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "TICKS", 4)
	_S.define(_e, "STEP", _S.binary("/", _S.read(_e, "D"), _S.read(_e, "TICKS")))
	_S.define(_e, "R", 18)
	_S.define(_e, "afterglow", _S.function_value(_e, "_f9"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_STEP = _S.read(_parent,"STEP")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_TICKS = _S.read(_parent,"TICKS")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_k_b1 = floori((float(_n_t_b0)/_n_STEP))
	var _n_ph_b2 = (float((_n_t_b0 - (_n_k_b1 * _n_STEP)))/_n_STEP)
	var _n_base_b3 = ((float((-PI))/2) + (float((_n_k_b1 * _n_TAU))/_n_TICKS))
	var _n_q_b4 = (float(_n_TAU)/_n_TICKS)
	if _S.truth((_n_ph_b2 < 0.62)):
		return {"ang":_n_base_b3,"flash":0,"ph":_n_ph_b2}
	if _S.truth((_n_ph_b2 < 0.72)):
		return {"ang":(_n_base_b3 - (0.1 * sin((((float((_n_ph_b2 - 0.62))/0.1) * PI) * 0.5)))),"flash":0,"ph":_n_ph_b2}
	var _n_s_b5 = (float((_n_ph_b2 - 0.72))/0.28)
	var _n_snap_b6 = _S.invoke(_n_ease,"outBack",[clampf((float(_n_s_b5)/0.35),0.0,1.0), 2.2])
	var _n_wob_b7 = ((exp(((-_n_s_b5) * 6)) * sin((_n_s_b5 * 22))) * 0.05)
	return {"ang":(((_n_base_b3 - (0.1 * (1 - clampf((float(_n_s_b5)/0.2),0.0,1.0)))) + (_n_q_b4 * _n_snap_b6)) + _n_wob_b7),"flash":exp(((-_n_s_b5) * 5)),"ph":_n_ph_b2}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_hand = _S.read(_parent,"hand")
	var _n_afterglow = _S.read(_parent,"afterglow")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_cx_b2 = _S.arg(_args,2)
	var _n_cy_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_h_b5 = _S.call_value(_n_hand,[_n_t_b4])
	var _n_fl_b6 = maxf(_S.named_value(_n_h_b5,"flash"),_S.call_value(_n_afterglow,[_n_t_b4]))
	_S.invoke(_n_p_b0,"disc",[_n_cx_b2, _n_cy_b3, (_n_R - 1), _S.index_value(_n_C_b1,2), 0.2])
	_S.invoke(_n_p_b0,"disc",[(_n_cx_b2 - (_n_R * 0.25)), (_n_cy_b3 - (_n_R * 0.3)), (_n_R * 0.5), _S.index_value(_n_C_b1,4), 0.08])
	_S.invoke(_n_p_b0,"ring",[_n_cx_b2, _n_cy_b3, (_n_R + 1), 1, _S.index_value(_n_C_b1,0)])
	_S.invoke(_n_p_b0,"ring",[_n_cx_b2, _n_cy_b3, _n_R, 2, _S.function_value(_S.capture(_parent,{"fl":_n_fl_b6,"C":_n_C_b1,"this":_this}),"_f2")])
	_S.invoke(_n_p_b0,"ring",[_n_cx_b2, _n_cy_b3, (_n_R - 3.5), 1, _S.index_value(_n_C_b1,3), 0.6])
	if true:
		var _n_i_b11 = 0
		while _S.truth((_n_i_b11 < 60)):
			if _S.truth(_S.binary("===",fmod(_n_i_b11,5),0)):
				_n_i_b11 += 1.0
				continue
			var _n_a_b12 = ((float(_n_i_b11)/60) * _n_TAU)
			_S.invoke(_n_p_b0,"dot",[(_n_cx_b2 + (cos(_n_a_b12) * (_n_R - 2.6))), (_n_cy_b3 + (sin(_n_a_b12) * (_n_R - 2.6))), _S.index_value(_n_C_b1,4), 0.8])
			_n_i_b11 += 1.0
	if true:
		var _n_i_b13 = 0
		while _S.truth((_n_i_b13 < 12)):
			var _n_a_b14 = ((float(_n_i_b13)/12) * _n_TAU)
			var _n_big_b15 = _S.binary("===",fmod(_n_i_b13,3),0)
			var _n_r0_b16 = (_n_R - 2.5)
			var _n_r1_b17 = (_n_R - (6 if _S.truth(_n_big_b15) else 4.5))
			var _n_c_b18 = cos(_n_a_b14)
			var _n_s_b19 = sin(_n_a_b14)
			_S.invoke(_n_p_b0,"line",[(_n_cx_b2 + (_n_c_b18 * _n_r0_b16)), (_n_cy_b3 + (_n_s_b19 * _n_r0_b16)), (_n_cx_b2 + (_n_c_b18 * _n_r1_b17)), (_n_cy_b3 + (_n_s_b19 * _n_r1_b17)), (_S.index_value(_n_C_b1,6) if _S.truth(_n_big_b15) else _S.index_value(_n_C_b1,5))])
			_n_i_b13 += 1.0
	var _n_shud_b7 = ((_S.named_value(_n_h_b5,"flash") * sin((_n_t_b4 * 60))) * 0.06)
	var _n_ha_b8 = (((float((-PI))/2) + 2.2) + _n_shud_b7)
	_S.invoke(_n_p_b0,"beam",[_n_cx_b2, _n_cy_b3, (_n_cx_b2 + ((cos(_n_ha_b8) * _n_R) * 0.5)), (_n_cy_b3 + ((sin(_n_ha_b8) * _n_R) * 0.5)), 2.2, _S.index_value(_n_C_b1,5)])
	var _n_tx_b9 = (_n_cx_b2 + (cos(_S.named_value(_n_h_b5,"ang")) * (_n_R - 4)))
	var _n_ty_b10 = (_n_cy_b3 + (sin(_S.named_value(_n_h_b5,"ang")) * (_n_R - 4)))
	_S.invoke(_n_p_b0,"beam",[_n_cx_b2, _n_cy_b3, _n_tx_b9, _n_ty_b10, 2.4, _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"this":_this}),"_f3")])
	_S.invoke(_n_p_b0,"circle",[_n_cx_b2, _n_cy_b3, 2, _S.index_value(_n_C_b1,6)])
	_S.invoke(_n_p_b0,"px",[_n_cx_b2, _n_cy_b3, _S.index_value(_n_C_b1,1)])
	_S.invoke(_n_p_b0,"glow",[_n_cx_b2, _n_cy_b3, (_n_R + 8), _S.index_value(_n_C_b1,4), (0.14 + (0.2 * _n_fl_b6))])
	_S.invoke(_n_p_b0,"glowRing",[_n_cx_b2, _n_cy_b3, _n_R, 3, _S.index_value(_n_C_b1,5), (0.12 + (0.35 * _n_fl_b6))])
	_S.invoke(_n_p_b0,"glow",[_n_tx_b9, _n_ty_b10, 5, _S.index_value(_n_C_b1,6), (0.3 + (0.3 * _S.named_value(_n_h_b5,"flash")))])
	if _S.truth((_S.named_value(_n_h_b5,"flash") > 0.02)):
		var _n_s_b20 = (1 - _S.named_value(_n_h_b5,"flash"))
		_S.invoke(_n_p_b0,"ring",[_n_cx_b2, _n_cy_b3, ((_n_R + 2) + (10 * _n_s_b20)), 1, _S.index_value(_n_C_b1,5), _S.named_value(_n_h_b5,"flash")])
		_S.invoke(_n_p_b0,"glowRing",[_n_cx_b2, _n_cy_b3, ((_n_R + 2) + (10 * _n_s_b20)), 3, _S.index_value(_n_C_b1,4), (0.3 * _S.named_value(_n_h_b5,"flash"))])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_fl = _S.read(_parent,"fl")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_ang_b1 = _S.arg(_args,1)
	return ((_S.index_value(_n_C,7) if _S.truth((_n_fl > 0.4)) else _S.index_value(_n_C,6)) if _S.truth((sin((_n_ang_b1 + 0.8)) < (-0.3))) else (_S.index_value(_n_C,5) if _S.truth((_n_v_b0 > 0.5)) else _S.index_value(_n_C,4)))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,7) if _S.truth((_n_u_b0 > 0.8)) else _S.index_value(_n_C,6))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_dial = _S.read(_parent,"dial")
	var _n_afterglow = _S.read(_parent,"afterglow")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	_S.call_value(_n_dial,[_n_p_b0, _n_C_b3, 0, (_S.named_value(_n_a_b4,"y") + 3), _n_t_b1])
	var _n_lag_b5 = _S.call_value(_n_afterglow,[_n_t_b1])
	if _S.truth((_n_lag_b5 > 0.05)):
		_S.invoke(_n_p_b0,"outline",[_S.named_value(_n_a_b4,"mask"), ((_S.named_value(_n_a_b4,"x") - 1) - floori((2 * _n_lag_b5)+0.5)), _S.named_value(_n_a_b4,"y"), _S.index_value(_n_C_b3,5), (0.55 * _n_lag_b5)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_shape = _S.read(_parent,"shape")
	var _n_hand = _S.read(_parent,"hand")
	var _n_afterglow = _S.read(_parent,"afterglow")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_S_b5 = _S.call_value(_n_shape,[_n_a_b4])
	var _n_fl_b6 = maxf(_S.named_value(_S.call_value(_n_hand,[_n_t_b1]),"flash"),_S.call_value(_n_afterglow,[_n_t_b1]))
	for _iter_0 in _S.array(_S.named_value(_n_S_b5,"body")):
		var _tuple_1 = _iter_0
		var _n_mx_b7 = _S.prop(_tuple_1,0)
		var _n_my_b8 = _S.prop(_tuple_1,1)
		_S.invoke(_n_p_b0,"blend",[(_S.named_value(_n_a_b4,"x") + _n_mx_b7), (_S.named_value(_n_a_b4,"y") + _n_my_b8), _S.index_value(_n_C_b3,5), (0.08 + (0.12 * _n_fl_b6))])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 6, (_S.named_value(_n_o_b2,"seed") + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f6"), _S.function_value(_S.capture(_parent,{"a":_n_a_b4,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f7")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.6, 2.2])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_this = _S.read(_parent,"this")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_side_b3 = ((-1) if _S.truth((_S.invoke(_n_r_b2,"next",[]) < 0.5)) else 1)
	var _n_x_b4 = (_n_side_b3 * _S.invoke(_n_r_b2,"range",[10, 17]))
	var _n_y0_b5 = (_S.named_value(_n_a,"y") + _S.invoke(_n_r_b2,"range",[6, 22]))
	var _n_v0_b6 = _S.invoke(_n_r_b2,"range",[18, 30])
	var _n_k_b7 = 1.1
	var _n_yAt_b8 = _S.function_value(_S.capture(_parent,{"y0":_n_y0_b5,"v0":_n_v0_b6,"k":_n_k_b7,"this":_n_this}),"_f8")
	var _n_y_b9 = _S.call_value(_n_yAt_b8,[_n_age_b0])
	var _n_u_b10 = (float(_n_age_b0)/_n_life_b1)
	if _S.truth((_n_y_b9 < (-1))):
		for _iter_0 in _S.array([[0.22, 0.35], [0.11, 0.6]]):
			var _tuple_1 = _iter_0
			var _n_lag_b11 = _S.prop(_tuple_1,0)
			var _n_al_b12 = _S.prop(_tuple_1,1)
			if _S.truth((_n_age_b0 > _n_lag_b11)):
				_S.invoke(_n_p,"dot",[_n_x_b4, _S.call_value(_n_yAt_b8,[(_n_age_b0 - _n_lag_b11)]), _S.index_value(_n_C,4), _n_al_b12])
		_S.invoke(_n_p,"px",[_n_x_b4, (_n_y_b9 - 1), _S.index_value(_n_C,5)])
		_S.invoke(_n_p,"px",[_n_x_b4, _n_y_b9, _S.index_value(_n_C,6)])
		_S.invoke(_n_p,"px",[_n_x_b4, (_n_y_b9 + 1), _S.index_value(_n_C,5)])
		_S.invoke(_n_p,"px",[(_n_x_b4 - 1), (_n_y_b9 + 1), _S.index_value(_n_C,4)])
		_S.invoke(_n_p,"px",[(_n_x_b4 - 1), _n_y_b9, _S.index_value(_n_C,7)])
		_S.invoke(_n_p,"glow",[_n_x_b4, _n_y_b9, 4, _S.index_value(_n_C,5), (0.3 * (1 - _n_u_b10))])
	else:
		var _n_g_b13 = _n_age_b0
		while _S.truth(((_S.call_value(_n_yAt_b8,[_n_g_b13]) >= (-1)) if _S.truth((_n_g_b13 > 0)) else (_n_g_b13 > 0))):
			_n_g_b13 -= 0.02
		var _n_s_b14 = clampf((float((_n_age_b0 - _n_g_b13))/0.9),0.0,1.0)
		if _S.truth((_n_s_b14 < 1)):
			var _n_rx_b15 = (1 + (7 * sqrt(_n_s_b14)))
			var _n_c_b16 = (_S.index_value(_n_C,6) if _S.truth((_n_s_b14 < 0.3)) else _S.index_value(_n_C,5))
			for _iter_2 in _S.array([(-1), 1]):
				var _n_sd_b17 = _iter_2
				_S.invoke(_n_p,"line",[(_n_x_b4 + (_n_sd_b17 * _n_rx_b15)), (-0.5), (_n_x_b4 + (_n_sd_b17 * (_n_rx_b15 - 1.5))), (-0.5), _n_c_b16, ((1 - _n_s_b14) * 1.2)])
			if true:
				var _n_dx_b18 = ((-_n_rx_b15) + 2)
				while _S.truth((_n_dx_b18 <= (_n_rx_b15 - 2))):
					_S.invoke(_n_p,"dot",[(_n_x_b4 + _n_dx_b18), (-1.5), _S.index_value(_n_C,4), (((1 - _n_s_b14) * 0.5) * (1 - (float(absf(_n_dx_b18))/_n_rx_b15)))])
					_n_dx_b18 += 1
			_S.invoke(_n_p,"glow",[_n_x_b4, (-1), (4 + _n_rx_b15), _S.index_value(_n_C,4), (0.12 * (1 - _n_s_b14))])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_y0 = _S.read(_parent,"y0")
	var _n_v0 = _S.read(_parent,"v0")
	var _n_k = _S.read(_parent,"k")
	var _n_g_b0 = _S.arg(_args,0)
	return ((_n_y0 + (float((_n_v0 * (1 - exp(((-_n_k) * _n_g_b0)))))/_n_k)) + (4 * _n_g_b0))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_STEP = _S.read(_parent,"STEP")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_s_b1 = fmod((fmod((_n_t_b0 - (_n_STEP * 0.72)),_n_STEP) + _n_STEP),_n_STEP)
	return exp(((-_n_s_b1) * 4))
	return null
