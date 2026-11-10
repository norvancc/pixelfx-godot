@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/spell-charge.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "loopNoise", _S.import_value("core/index.js", "loopNoise"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "mote", _S.import_value("fx/arcane/_lib.js", "mote"))
	_S.define(_e, "streak", _S.import_value("fx/arcane/_lib.js", "streak"))
	_S.define(_e, "arc", _S.import_value("fx/arcane/_lib.js", "arc"))
	_S.define(_e, "drawArc", _S.import_value("fx/arcane/_lib.js", "drawArc"))
	_S.define(_e, "orb", _S.function_value(_e, "_f0"))
	_S.define(_e, "ringAt", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "D", 1.6)
	_S.define(_e, "HX", 15)
	_S.define(_e, "HY", _S.unary("-", 22))
	_S.define(_e, "RINGS", 4)
	_S.define(_e, "RT", 0.5)
	_S.define(_e, "meta", _S.merge([{"name": "Spell charge"}, {"desc": "Energy gathers in the caster's hand: streaks and motes spiral in, rings collapse into a swelling orb that crackles with arcs, ready to fire."}, {"tags": ["arcane", "charge", "spell", "orb", "cast", "magic", "loop"]}, {"size": [120, 86]}, {"origin": [44, 80]}, {"duration": _S.read(_e, "D")}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HOLD", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}, {"crouch": 4}, {"lean": 2}, {"fx": 18}, {"fy": _S.unary("-", 22)}, {"bx": 11}, {"by": _S.unary("-", 17)}, {"ffx": 10}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "act", _S.merge([{"poses": [[_S.unary("-", 0.46), _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}])], [_S.unary("-", 0.12), _S.merge([_S.read(_e, "HOLD"), {"crouch": 3}])], [0, _S.read(_e, "HOLD")], [0.4, _S.merge([_S.read(_e, "HOLD"), {"crouch": 5}])], [0.8, _S.merge([_S.read(_e, "HOLD"), {"lean": 3}])], [1.2, _S.merge([_S.read(_e, "HOLD"), {"crouch": 5}])], [1.6, _S.read(_e, "HOLD")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "landings", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "RINGS")}]), _S.function_value(_e, "_f13")]))
	_S.define(_e, "sinceLast", _S.function_value(_e, "_f14"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_arc = _S.read(_parent,"arc")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_r_b4 = _S.arg(_args,4)
	var _n_t_b5 = _S.arg(_args,5)
	var _n_ph_b6 = _S.arg(_args,6)
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < 8)):
			var _n_a_b9 = (((float(_n_i_b8)/8) * _n_TAU) + ((_n_ph_b6 * (float(_n_TAU)/8)) * 3))
			var _n_l_b10 = ((1.5 + (4.5 * absf(_S.NoiseKernels.loop_noise(_n_ph_b6,3,((_n_i_b8 * 7) + 1))))) * (0.7 if _S.truth(fmod(_n_i_b8,2)) else 1))
			var _n_x0_b11 = (_n_x_b2 + (cos(_n_a_b9) * (_n_r_b4 + 1.2)))
			var _n_y0_b12 = (_n_y_b3 + (sin(_n_a_b9) * (_n_r_b4 + 1.2)))
			_S.invoke(_n_p_b0,"line",[_n_x0_b11, _n_y0_b12, (_n_x0_b11 + (cos(_n_a_b9) * _n_l_b10)), (_n_y0_b12 + (sin(_n_a_b9) * _n_l_b10)), _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"i":_n_i_b8,"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f2")])
			_n_i_b8 += 1.0
	_S.invoke(_n_p_b0,"circle",[_n_x_b2, _n_y_b3, (_n_r_b4 + 1.3), _S.index_value(_n_C_b1,4)])
	_S.invoke(_n_p_b0,"circle",[_n_x_b2, _n_y_b3, (_n_r_b4 + 0.3), _S.index_value(_n_C_b1,5)])
	_S.invoke(_n_p_b0,"circle",[(_n_x_b2 - (_n_r_b4 * 0.12)), (_n_y_b3 - (_n_r_b4 * 0.12)), (_n_r_b4 * 0.8), _S.index_value(_n_C_b1,6)])
	_S.invoke(_n_p_b0,"circle",[_n_x_b2, _n_y_b3, (_n_r_b4 * 0.5), _n_WHITE])
	var _n_R_b7 = _S.MathFX.rng([floori((_n_t_b5 * 15)),77])
	if true:
		var _n_i_b13 = 0
		while _S.truth((_n_i_b13 < 3)):
			var _n_a_b14 = _S.invoke(_n_R_b7,"range",[0, _n_TAU])
			var _n_pts_b15 = _S.named_value(_S.index_value(_S.call_value(_n_arc,[_n_R_b7, (_n_x_b2 + ((cos(_n_a_b14) * _n_r_b4) * 0.4)), (_n_y_b3 + ((sin(_n_a_b14) * _n_r_b4) * 0.4)), (_n_x_b2 + (cos((_n_a_b14 + _S.invoke(_n_R_b7,"range",[(-0.6), 0.6]))) * (_n_r_b4 + 0.6))), (_n_y_b3 + (sin((_n_a_b14 + _S.invoke(_n_R_b7,"range",[(-0.6), 0.6]))) * (_n_r_b4 + 0.6))), {"jag":0.45,"forks":0}]),0),"pts")
			_S.invoke(_n_p_b0,"polyline",[_n_pts_b15, _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"this":_this}),"_f3")])
			_n_i_b13 += 1.0
	_S.invoke(_n_p_b0,"px",[(_n_x_b2 - (_n_r_b4 * 0.5)), (_n_y_b3 - (_n_r_b4 * 0.62)), _n_WHITE])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_i = _S.read(_parent,"i")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 < 0.4)) else (_S.index_value(_n_C,4) if _S.truth(fmod(_n_i,2)) else _S.index_value(_n_C,5)))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return (1 if _S.truth((_n_u_b0 < 0.6)) else (1.6 - _n_u_b0))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 < 0.6)) else _S.index_value(_n_C,6))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_rr_b4 = _S.arg(_args,4)
	var _n_sy_b5 = _S.arg(_args,5)
	var _n_rot_b6 = _S.arg(_args,6)
	var _n_q_b7 = _S.arg(_args,7)
	var _n_n_b8 = ceili(((_n_rr_b4 * _n_TAU) * 1.4))
	var _n_c_b9 = cos(_n_rot_b6)
	var _n_s_b10 = sin(_n_rot_b6)
	var _n_col_b11 = (_n_WHITE if _S.truth((_n_q_b7 > 0.85)) else (_S.index_value(_n_C_b1,6) if _S.truth((_n_q_b7 > 0.55)) else _S.index_value(_n_C_b1,5)))
	var _n_a_b12 = minf(1,(_n_q_b7 * 3))
	if true:
		var _n_j_b13 = 0
		while _S.truth((_n_j_b13 < _n_n_b8)):
			var _n_g_b14 = ((float(_n_j_b13)/_n_n_b8) * _n_TAU)
			var _n_lx_b15 = (cos(_n_g_b14) * _n_rr_b4)
			var _n_ly_b16 = ((sin(_n_g_b14) * _n_rr_b4) * _n_sy_b5)
			var _n_px_b17 = ((_n_x_b2 + (_n_lx_b15 * _n_c_b9)) - (_n_ly_b16 * _n_s_b10))
			var _n_py_b18 = ((_n_y_b3 + (_n_lx_b15 * _n_s_b10)) + (_n_ly_b16 * _n_c_b9))
			if _S.truth((_n_py_b18 > (-0.5))):
				_n_j_b13 += 1.0
				continue
			_S.invoke(_n_p_b0,"dot",[_n_px_b17, _n_py_b18, _n_col_b11, _n_a_b12])
			if _S.truth(_S.binary("===",fmod(_n_j_b13,10),0)):
				_S.invoke(_n_p_b0,"glow",[_n_px_b17, _n_py_b18, 5, _S.index_value(_n_C_b1,5), (0.12 * _n_a_b12)])
			_n_j_b13 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_sinceLast = _S.read(_parent,"sinceLast")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_HX = _S.read(_parent,"HX")
	var _n_HY = _S.read(_parent,"HY")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_RINGS = _S.read(_parent,"RINGS")
	var _n_RT = _S.read(_parent,"RT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_ringAt = _S.read(_parent,"ringAt")
	var _n_orb = _S.read(_parent,"orb")
	var _n_arc = _S.read(_parent,"arc")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_drawArc = _S.read(_parent,"drawArc")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_n_D)
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_f_b6 = floori((_n_t_b1 * 30))
	var _n_since_b7 = _S.call_value(_n_sinceLast,[_n_t_b1])
	var _n_swell_b8 = (exp((-pow((float(_n_since_b7)/0.07),2))) + (0.5 * exp((-pow((float(_n_since_b7)/0.18),2)))))
	var _n_r_b9 = ((6.1 + (0.5 * sin(((_n_ph_b4 * _n_TAU) * 4)))) + (1.4 * _n_swell_b8))
	var _n_jit_b10 = ((1 if _S.truth(fmod(_n_f_b6,2)) else (-1)) if _S.truth((_n_swell_b8 > 0.4)) else 0)
	var _n_x_b11 = (_n_HX + _n_jit_b10)
	var _n_y_b12 = _n_HY
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 110, ((_n_S_b5 * 3) + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f6"), _S.function_value(_S.capture(_parent,{"r":_n_r_b9,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f7")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 56, ((_n_S_b5 * 3) + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), _S.function_value(_S.capture(_parent,{"r":_n_r_b9,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f10")])
	if true:
		var _n_k_b18 = 0
		while _S.truth((_n_k_b18 < _n_RINGS)):
			for _iter_0 in _S.array([(-_n_D), 0]):
				var _n_off_b19 = _iter_0
				var _n_q_b20 = (float(((_n_t_b1 - (float((_n_k_b18 * _n_D))/_n_RINGS)) - _n_off_b19))/_n_RT)
				if _S.truth(((_n_q_b20 < 0) if _S.truth((_n_q_b20 < 0)) else (_n_q_b20 >= 1))):
					continue
				var _n_rr_b21 = ((_n_r_b9 + 1.5) + (22 * (1 - _S.invoke(_n_ease,"inQuad",[_n_q_b20]))))
				var _n_shape_b22 = _S.index_value([[1, 0], [0.38, 0.55], [1, 0], [0.42, (-0.7)]],_n_k_b18)
				_S.call_value(_n_ringAt,[_n_p_b0, _n_C_b3, _n_x_b11, _n_y_b12, _n_rr_b21, _S.index_value(_n_shape_b22,0), _S.index_value(_n_shape_b22,1), _n_q_b20])
			_n_k_b18 += 1.0
	_S.call_value(_n_orb,[_n_p_b0, _n_C_b3, _n_x_b11, _n_y_b12, _n_r_b9, _n_t_b1, _n_ph_b4])
	var _n_w_b13 = floori((float(_n_f_b6)/2))
	var _n_Rw_b14 = _S.MathFX.rng([_n_S_b5,_n_w_b13,3])
	var _n_n_b15 = ((1 if _S.truth((_S.invoke(_n_Rw_b14,"next",[]) < 0.6)) else 0) + (1 if _S.truth((_n_swell_b8 > 0.3)) else 0))
	var _n_fresh_b16 = (0.8 if _S.truth(_S.binary("===",fmod(_n_f_b6,2),0)) else 0.4)
	if true:
		var _n_i_b23 = 0
		while _S.truth((_n_i_b23 < _n_n_b15)):
			var _n_a_b24 = _S.invoke(_n_Rw_b14,"range",[0, _n_TAU])
			var _n_L_b25 = (_S.invoke(_n_Rw_b14,"range",[5, 10]) * (1 + (_n_swell_b8 * 0.4)))
			var _n_a1_b26 = (_n_a_b24 + _S.invoke(_n_Rw_b14,"range",[(-0.5), 0.5]))
			var _n_x0_b27 = (_n_x_b11 + (cos(_n_a_b24) * (_n_r_b9 + 0.5)))
			var _n_y0_b28 = (_n_y_b12 + (sin(_n_a_b24) * (_n_r_b9 + 0.5)))
			var _n_x1_b29 = (_n_x0_b27 + (cos(_n_a1_b26) * _n_L_b25))
			var _n_y1_b30 = minf((-2),(_n_y0_b28 + (sin(_n_a1_b26) * _n_L_b25)))
			_S.call_value(_n_drawArc,[_n_p_b0, _S.call_value(_n_arc,[_n_Rw_b14, _n_x0_b27, _n_y0_b28, _n_x1_b29, _n_y1_b30, {"jag":0.35,"forks":(1 if _S.truth((_S.invoke(_n_Rw_b14,"next",[]) < 0.5)) else 0)}]), {"core":_n_WHITE,"body":_S.index_value(_n_C_b3,5),"halo":_S.index_value(_n_C_b3,3),"glow":_S.index_value(_n_C_b3,5)}, _n_fresh_b16, 0.3])
			_n_i_b23 += 1.0
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 7, ((_n_S_b5 * 3) + 4), 0.22, _S.function_value(_S.capture(_parent,{"r":_n_r_b9,"p":_n_p_b0,"x":_n_x_b11,"y":_n_y_b12,"C":_n_C_b3,"this":_this}),"_f12")])
	if _S.truth((_n_since_b7 < 0.07)):
		_S.call_value(_n_sparkle,[_n_p_b0, _n_x_b11, _n_y_b12, (4 + (6 * (1 - (float(_n_since_b7)/0.07)))), _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5), 0.5])
	var _n_pulse_b17 = ((0.85 + (0.15 * sin(((_n_ph_b4 * _n_TAU) * 4)))) + (0.2 * _n_swell_b8))
	_S.invoke(_n_p_b0,"glow",[_n_x_b11, _n_y_b12, 46, _S.index_value(_n_C_b3,4), (0.26 * _n_pulse_b17)])
	_S.invoke(_n_p_b0,"glowRing",[_n_x_b11, _n_y_b12, (_n_r_b9 + 3), 8, _S.index_value(_n_C_b3,5), (0.3 * _n_pulse_b17)])
	_S.invoke(_n_p_b0,"glow",[_n_x_b11, _n_y_b12, _n_r_b9, _S.index_value(_n_C_b3,6), 0.12])
	_S.invoke(_n_p_b0,"glow",[_n_HX, (-1), 22, _S.index_value(_n_C_b3,5), (0.16 * _n_pulse_b17)])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.2, 0.34])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_streak = _S.read(_parent,"streak")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_a0_b3 = _S.invoke(_n_R_b2,"range",[2.8, 5.75])
	var _n_d0_b4 = _S.invoke(_n_R_b2,"range",[20, 52])
	var _n_spin_b5 = _S.invoke(_n_R_b2,"range",[0.6, 1.3])
	var _n_pos_b6 = _S.function_value(_S.capture(_parent,{"a0":_n_a0_b3,"spin":_n_spin_b5,"d0":_n_d0_b4,"this":_n_this}),"_f8")
	var _n_q_b7 = (float(_n_age_b0)/_n_life_b1)
	var _tuple_0 = _S.call_value(_n_pos_b6,[_n_q_b7])
	var _n_px_b8 = _S.prop(_tuple_0,0)
	var _n_py_b9 = _S.prop(_tuple_0,1)
	var _tuple_1 = _S.call_value(_n_pos_b6,[minf(1,(_n_q_b7 + 0.02))])
	var _n_qx_b10 = _S.prop(_tuple_1,0)
	var _n_qy_b11 = _S.prop(_tuple_1,1)
	_S.call_value(_n_streak,[_n_p, _n_px_b8, _n_py_b9, (float((_n_qx_b10 - _n_px_b8))/(0.02 * _n_life_b1)), (float((_n_qy_b11 - _n_py_b9))/(0.02 * _n_life_b1)), (_S.index_value(_n_C,6) if _S.truth(_S.invoke(_n_R_b2,"chance",[0.55])) else _S.index_value(_n_C,5)), (minf(1,(_n_q_b7 * 4)) * (1 - _S.MathFX.smooth(0.9,1,_n_q_b7))), 7, (0.4 * (1 - _S.MathFX.smooth(0.6,0.9,_n_q_b7)))])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_a0 = _S.read(_parent,"a0")
	var _n_spin = _S.read(_parent,"spin")
	var _n_d0 = _S.read(_parent,"d0")
	var _n_r = _S.read(_parent,"r")
	var _n_HX = _S.read(_parent,"HX")
	var _n_HY = _S.read(_parent,"HY")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_a_b1 = (_n_a0 + ((_n_spin * _n_q_b0) * _n_q_b0))
	var _n_d_b2 = ((_n_d0 * (1 - (_n_q_b0 * _n_q_b0))) + _n_r)
	return [(_n_HX + (cos(_n_a_b1) * _n_d_b2)), (_n_HY + ((sin(_n_a_b1) * _n_d_b2) * 0.92))]
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.4, 0.7])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_mote = _S.read(_parent,"mote")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_a0_b3 = _S.invoke(_n_R_b2,"range",[2.6, 5.2])
	var _n_d0_b4 = _S.invoke(_n_R_b2,"range",[12, 32])
	var _n_spin_b5 = _S.invoke(_n_R_b2,"range",[1, 2.2])
	var _n_size_b6 = _S.invoke(_n_R_b2,"range",[0.6, 1])
	var _n_pos_b7 = _S.function_value(_S.capture(_parent,{"a0":_n_a0_b3,"spin":_n_spin_b5,"d0":_n_d0_b4,"this":_n_this}),"_f11")
	var _n_q_b8 = (float(_n_age_b0)/_n_life_b1)
	var _tuple_0 = _S.call_value(_n_pos_b7,[_n_q_b8])
	var _n_px_b9 = _S.prop(_tuple_0,0)
	var _n_py_b10 = _S.prop(_tuple_0,1)
	var _tuple_1 = _S.call_value(_n_pos_b7,[minf(1,(_n_q_b8 + 0.02))])
	var _n_qx_b11 = _S.prop(_tuple_1,0)
	var _n_qy_b12 = _S.prop(_tuple_1,1)
	_S.call_value(_n_mote,[_n_p, _n_px_b9, _n_py_b10, (float((_n_qx_b11 - _n_px_b9))/(0.02 * _n_life_b1)), (float((_n_qy_b12 - _n_py_b10))/(0.02 * _n_life_b1)), _S.invoke(_n_R_b2,"pick",[[_S.index_value(_n_C,5), _S.index_value(_n_C,6), _S.index_value(_n_C,6), _n_WHITE]]), _n_size_b6, (minf(1,(_n_q_b8 * 3)) * ((float((1 - _n_q_b8))/0.1) if _S.truth((_n_q_b8 > 0.9)) else 1)), (0.3 * (1 - _S.MathFX.smooth(0.55,0.85,_n_q_b8)))])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_a0 = _S.read(_parent,"a0")
	var _n_spin = _S.read(_parent,"spin")
	var _n_d0 = _S.read(_parent,"d0")
	var _n_ease = _S.read(_parent,"ease")
	var _n_r = _S.read(_parent,"r")
	var _n_HX = _S.read(_parent,"HX")
	var _n_HY = _S.read(_parent,"HY")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_a_b1 = (_n_a0 + (_n_spin * _n_q_b0))
	var _n_d_b2 = ((_n_d0 * (1 - _S.invoke(_n_ease,"inQuad",[_n_q_b0]))) + _n_r)
	return [(_n_HX + (cos(_n_a_b1) * _n_d_b2)), (_n_HY + (sin(_n_a_b1) * _n_d_b2))]
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_r = _S.read(_parent,"r")
	var _n_p = _S.read(_parent,"p")
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.invoke(_n_R_b2,"range",[0, _n_TAU])
	var _n_d_b4 = _S.invoke(_n_R_b2,"range",[(_n_r + 5), (_n_r + 15)])
	var _n_k_b5 = sin(((float(_n_age_b0)/_n_life_b1) * PI))
	_S.call_value(_n_sparkle,[_n_p, (_n_x + (cos(_n_a_b3) * _n_d_b4)), (_n_y + ((sin(_n_a_b3) * _n_d_b4) * 0.9)), (1 + (2.5 * _n_k_b5)), _S.index_value(_n_C,6), _S.index_value(_n_C,4), (0.4 * _n_k_b5)])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_RINGS = _S.read(_parent,"RINGS")
	var _n_RT = _S.read(_parent,"RT")
	var _n___b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	return ((float((_n_k_b1 * _n_D))/_n_RINGS) + _n_RT)
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "min", _S.concat([_S.array(_S.invoke(_S.read(_e, "landings"), "map", [_S.function_value(_e, "_f15")]))]))

static func _f15(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_l_b0 = _S.arg(_args,0)
	return fmod((fmod((_n_t - _n_l_b0),_n_D) + _n_D),_n_D)
	return null
