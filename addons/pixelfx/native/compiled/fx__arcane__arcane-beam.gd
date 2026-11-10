@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/arcane-beam.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "flyV", _S.import_value("core/index.js", "flyV"))
	_S.define(_e, "loopNoise", _S.import_value("core/index.js", "loopNoise"))
	_S.define(_e, "fract", _S.import_value("core/index.js", "fract"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "bayer", _S.import_value("fx/arcane/_lib.js", "bayer"))
	_S.define(_e, "mote", _S.import_value("fx/arcane/_lib.js", "mote"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "D", 1.2)
	_S.define(_e, "HX", 15)
	_S.define(_e, "HY", _S.unary("-", 24))
	_S.define(_e, "L", 168)
	_S.define(_e, "W", 6)
	_S.define(_e, "meta", _S.merge([{"name": "Arcane beam"}, {"desc": "A beam fires right from the hand: a white core, strands twisting round it, pulses running down it, a flaring source and an end that sprays sparks."}, {"tags": ["arcane", "beam", "laser", "ray", "magic", "directional", "loop"]}, {"size": [264, 100]}, {"origin": [26, 84]}, {"duration": _S.read(_e, "D")}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 10}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "AIM", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}, {"crouch": 4}, {"lean": 4}, {"fx": 18}, {"fy": _S.unary("-", 24)}, {"bx": 13}, {"by": _S.unary("-", 20)}, {"ffx": 11}, {"fbx": _S.unary("-", 9)}, {"toeB": true}]))
	_S.define(_e, "PULL", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}, {"crouch": 4}, {"lean": _S.unary("-", 3)}, {"fx": 1}, {"fy": _S.unary("-", 20)}, {"bx": 4}, {"by": _S.unary("-", 22)}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 186}])}, {"poses": [[_S.unary("-", 0.62), _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}])], [_S.unary("-", 0.3), _S.read(_e, "PULL")], [_S.unary("-", 0.04), _S.merge([_S.read(_e, "PULL"), {"crouch": 5}, {"lean": _S.unary("-", 4)}])], [0, _S.merge([_S.read(_e, "AIM"), {"crouch": 3}]), "snap"], [0.3, _S.read(_e, "AIM")], [0.6, _S.merge([_S.read(_e, "AIM"), {"crouch": 5}, {"lean": 3}])], [0.9, _S.read(_e, "AIM")], [1.2, _S.merge([_S.read(_e, "AIM"), {"crouch": 3}])]]}, {"hits": [_S.merge([{"t": 0.1}, {"push": 0.5}, {"straw": 3}, {"flash": 0.02}, {"y": _S.unary("-", 24)}]), _S.merge([{"t": 0.7}, {"push": 0.5}, {"straw": 3}, {"flash": 0.02}, {"y": _S.unary("-", 24)}])]}, {"dust": [_S.merge([{"t": 0}, {"x": _S.unary("-", 10)}, {"n": 5}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_HX = _S.read(_parent,"HX")
	var _n_L = _S.read(_parent,"L")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_W = _S.read(_parent,"W")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_HY = _S.read(_parent,"HY")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_ease = _S.read(_parent,"ease")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_n_D)
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_EX_b6 = (_n_HX + _n_L)
	var _n_LV_b7 = [_n_WHITE, _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5), _S.index_value(_n_C_b3,4), _S.index_value(_n_C_b3,3), _S.index_value(_n_C_b3,2)]
	if true:
		var _n_d_b10 = 0
		while _S.truth((_n_d_b10 <= _n_L)):
			var _n_x_b11 = (_n_HX + _n_d_b10)
			var _n_w_b12 = ((_n_W * (1 + (0.12 * sin(((_n_d_b10 * 0.35) - ((_n_ph_b4 * _n_TAU) * 8)))))) * minf(1,(float((_n_d_b10 + 3))/7)))
			var _n_pulse_b13 = (1 if _S.truth((_S.MathFX.fract(((_n_d_b10 * 0.025) - (_n_ph_b4 * 4))) < 0.07)) else 0)
			if true:
				var _n_q0_b14 = ((-_n_w_b12) * 1.3)
				while _S.truth((_n_q0_b14 <= (_n_w_b12 * 1.3))):
					var _n_q_b15 = (float(absf(_n_q0_b14))/_n_w_b12)
					var _n_y_b16 = (_n_HY + _n_q0_b14)
					var _n_lv_b17 = (0 if _S.truth((_n_q_b15 < 0.2)) else (1 if _S.truth((_n_q_b15 < 0.4)) else (2 if _S.truth((_n_q_b15 < 0.62)) else (3 if _S.truth((_n_q_b15 < 0.85)) else (4 if _S.truth((_n_q_b15 < 1)) else 5)))))
					_n_lv_b17 = maxf(0,(_n_lv_b17 - _n_pulse_b13))
					if _S.truth(((((_S.Painter.BAYER[((floori(_n_y_b16)&3)<<2)|(floori(_n_x_b11)&3)]+0.5)/16.0) > (float((1.3 - _n_q_b15))/0.3)) if _S.truth(_S.binary("===",_n_lv_b17,5)) else _S.binary("===",_n_lv_b17,5))):
						_n_q0_b14 += 0.5
						continue
					_S.invoke(_n_p_b0,"px",[_n_x_b11, _n_y_b16, _S.index_value(_n_LV_b7,_n_lv_b17)])
					_n_q0_b14 += 0.5
			if true:
				var _n_s_b18 = 0
				while _S.truth((_n_s_b18 < 3)):
					var _n_a_b19 = (((_n_d_b10 * 0.17) - ((_n_ph_b4 * _n_TAU) * 6)) + (float((_n_s_b18 * _n_TAU))/3))
					var _n_off_b20 = ((sin(_n_a_b19) * _n_w_b12) * 1.05)
					if _S.truth((cos(_n_a_b19) > (-0.15))):
						_S.invoke(_n_p_b0,"dot",[_n_x_b11, (_n_HY + _n_off_b20), (_n_WHITE if _S.truth((cos(_n_a_b19) > 0.55)) else _S.index_value(_n_C_b3,6))])
					_n_s_b18 += 1.0
			if _S.truth(_S.binary("===",_S.binary("&",floori((_n_d_b10 * 2)+0.5),11),0)):
				_S.invoke(_n_p_b0,"glow",[_n_x_b11, _n_HY, ((_n_w_b12 * 2.2) + 4), _S.index_value(_n_C_b3,5), 0.2])
			_n_d_b10 += 0.5
	var _n_fr_b8 = (4.2 + (sin(((_n_ph_b4 * _n_TAU) * 10)) * 0.6))
	if true:
		var _n_i_b21 = 0
		while _S.truth((_n_i_b21 < 4)):
			var _n_a_b22 = (((_n_ph_b4 * _n_TAU) * 2.5) + (float((_n_i_b21 * _n_TAU))/4))
			var _n_l_b23 = (7 + (3 * sin((((_n_ph_b4 * _n_TAU) * 6) + _n_i_b21))))
			_S.invoke(_n_p_b0,"line",[_n_HX, _n_HY, (_n_HX + (cos(_n_a_b22) * _n_l_b23)), (_n_HY + (sin(_n_a_b22) * _n_l_b23)), _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f2")])
			_n_i_b21 += 1.0
	_S.invoke(_n_p_b0,"circle",[_n_HX, _n_HY, (_n_fr_b8 + 1.5), _S.index_value(_n_C_b3,4)])
	_S.invoke(_n_p_b0,"circle",[_n_HX, _n_HY, _n_fr_b8, _S.index_value(_n_C_b3,6)])
	_S.invoke(_n_p_b0,"circle",[_n_HX, _n_HY, (_n_fr_b8 * 0.6), _n_WHITE])
	_S.invoke(_n_p_b0,"glow",[_n_HX, _n_HY, 32, _S.index_value(_n_C_b3,5), 0.8])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 10, ((_n_S_b5 * 3) + 1), 0.18, _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f3")])
	var _n_ir_b9 = (5 + (sin(((_n_ph_b4 * _n_TAU) * 12)) * 0.8))
	if true:
		var _n_i_b24 = 0
		while _S.truth((_n_i_b24 < 7)):
			var _n_a_b25 = (PI + ((_n_i_b24 - 3) * 0.36))
			var _n_l_b26 = (8 + (8 * absf(_S.NoiseKernels.loop_noise(_n_ph_b4,4,((_n_S_b5 * 7) + _n_i_b24)))))
			_S.invoke(_n_p_b0,"line",[_n_EX_b6, _n_HY, (_n_EX_b6 + (cos(_n_a_b25) * _n_l_b26)), (_n_HY + (sin(_n_a_b25) * _n_l_b26)), _S.function_value(_S.capture(_parent,{"i":_n_i_b24,"C":_n_C_b3,"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5")])
			_n_i_b24 += 1.0
	if true:
		var _n_k_b27 = 0
		while _S.truth((_n_k_b27 < 3)):
			var _n_q_b28 = _S.MathFX.fract(((_n_ph_b4 * 3) + (float(_n_k_b27)/3)))
			_S.invoke(_n_p_b0,"ring",[_n_EX_b6, _n_HY, (3 + (15 * _S.invoke(_n_ease,"outCubic",[_n_q_b28]))), maxf(1,(2 * (1 - _n_q_b28))), (_n_WHITE if _S.truth((_n_q_b28 < 0.25)) else _S.index_value(_n_C_b3,5)), (1.1 - _n_q_b28)])
			_n_k_b27 += 1.0
	_S.invoke(_n_p_b0,"circle",[_n_EX_b6, _n_HY, (_n_ir_b9 + 1.5), _S.index_value(_n_C_b3,4)])
	_S.invoke(_n_p_b0,"circle",[_n_EX_b6, _n_HY, _n_ir_b9, _S.index_value(_n_C_b3,6)])
	_S.invoke(_n_p_b0,"circle",[_n_EX_b6, _n_HY, (_n_ir_b9 * 0.55), _n_WHITE])
	_S.invoke(_n_p_b0,"glow",[_n_EX_b6, _n_HY, 40, _S.index_value(_n_C_b3,5), 0.9])
	_S.invoke(_n_p_b0,"glow",[_n_EX_b6, _n_HY, 12, _n_WHITE, 0.6])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 220, ((_n_S_b5 * 3) + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f6"), _S.function_value(_S.capture(_parent,{"EX":_n_EX_b6,"C":_n_C_b3,"p":_n_p_b0,"this":_this}),"_f7")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 6, ((_n_S_b5 * 3) + 3), 0.3, _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"EX":_n_EX_b6,"C":_n_C_b3,"this":_this}),"_f9")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 7, ((_n_S_b5 * 3) + 5), _S.function_value(_S.capture(_parent,{"this":_this}),"_f10"), _S.function_value(_S.capture(_parent,{"EX":_n_EX_b6,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f11")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 16, ((_n_S_b5 * 3) + 4), _S.function_value(_S.capture(_parent,{"this":_this}),"_f13"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f14")])
	_S.invoke(_n_p_b0,"glow",[_n_EX_b6, (-1), 30, _S.index_value(_n_C_b3,5), 0.25])
	_S.invoke(_n_p_b0,"glow",[(_n_HX + (float(_n_L)/2)), (-1), 60, _S.index_value(_n_C_b3,4), 0.12])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 < 0.5)) else _S.index_value(_n_C,6))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return (1 if _S.truth((_n_u_b0 < 0.6)) else (1.6 - _n_u_b0))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_HX = _S.read(_parent,"HX")
	var _n_HY = _S.read(_parent,"HY")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_dd_b4 = ((16 * (1 - (float(_n_age_b0)/_n_life_b1))) + 3)
	var _n_x_b5 = (_n_HX + (cos(_n_a_b3) * _n_dd_b4))
	var _n_y_b6 = (_n_HY + (sin(_n_a_b3) * _n_dd_b4))
	_S.invoke(_n_p,"dot",[_n_x_b5, _n_y_b6, (_n_WHITE if _S.truth(((float(_n_age_b0)/_n_life_b1) > 0.6)) else _S.index_value(_n_C,6))])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_i = _S.read(_parent,"i")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 < 0.4)) else (_S.index_value(_n_C,5) if _S.truth(fmod(_n_i,2)) else _S.index_value(_n_C,6)))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return (1 if _S.truth((_n_u_b0 < 0.6)) else (1.6 - _n_u_b0))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.18, 0.5])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_EX = _S.read(_parent,"EX")
	var _n_HY = _S.read(_parent,"HY")
	var _n_fly = _S.read(_parent,"fly")
	var _n_flyV = _S.read(_parent,"flyV")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_a_b3 = ((PI * 1.5) + _S.invoke(_n_r_b2,"range",[(-1.7), 0.45]))
	var _n_sp_b4 = _S.invoke(_n_r_b2,"range",[70, 260])
	var _n_vx_b5 = (cos(_n_a_b3) * _n_sp_b4)
	var _n_vy_b6 = ((sin(_n_a_b3) * _n_sp_b4) - 30)
	var _tuple_0 = _S.call_value(_n_fly,[_n_EX, _n_HY, _n_vx_b5, _n_vy_b6, _n_age_b0, 480, 2.2])
	var _n_x_b7 = _S.prop(_tuple_0,0)
	var _n_y_b8 = _S.prop(_tuple_0,1)
	var _tuple_1 = _S.call_value(_n_flyV,[_n_vx_b5, _n_vy_b6, _n_age_b0, 480, 2.2])
	var _n_ux_b9 = _S.prop(_tuple_1,0)
	var _n_uy_b10 = _S.prop(_tuple_1,1)
	var _n_k_b11 = (1 - (float(_n_age_b0)/_n_life_b1))
	if _S.truth((_n_y_b8 > (-1))):
		return null
	var _n_head_b12 = (_n_WHITE if _S.truth((_n_k_b11 > 0.6)) else (_S.index_value(_n_C,6) if _S.truth((_n_k_b11 > 0.3)) else _S.index_value(_n_C,5)))
	var _n_sp2_b13 = _S.logical("||",_S.Bridge.hypot([_n_ux_b9, _n_uy_b10]),func():return 1)
	var _n_len_b14 = minf(8,(1 + (_n_sp2_b13 * 0.022)))
	_S.invoke(_n_p,"line",[(_n_x_b7 - ((float(_n_ux_b9)/_n_sp2_b13) * _n_len_b14)), (_n_y_b8 - ((float(_n_uy_b10)/_n_sp2_b13) * _n_len_b14)), _n_x_b7, _n_y_b8, _S.function_value(_S.capture(_parent,{"head":_n_head_b12,"this":_n_this}),"_f8")])
	_S.invoke(_n_p,"glow",[_n_x_b7, _n_y_b8, 3, _n_head_b12, (0.45 * _n_k_b11)])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_head = _S.read(_parent,"head")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_head if _S.truth((_n_u_b0 > 0.5)) else _S.index_value(_n_C,4))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_EX = _S.read(_parent,"EX")
	var _n_HY = _S.read(_parent,"HY")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = sin(((float(_n_age_b0)/_n_life_b1) * PI))
	_S.call_value(_n_sparkle,[_n_p, (_n_EX + _S.invoke(_n_r_b2,"range",[(-12), 4])), (_n_HY + _S.invoke(_n_r_b2,"range",[(-12), 12])), (1 + (2.5 * _n_k_b3)), _S.index_value(_n_C,6), _S.index_value(_n_C,5), (0.4 * _n_k_b3)])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.8, 1.2])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_EX = _S.read(_parent,"EX")
	var _n_HY = _S.read(_parent,"HY")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_this = _S.read(_parent,"this")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_q_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_x_b4 = ((_n_EX + _S.invoke(_n_r_b2,"range",[(-8), 4])) - (_n_q_b3 * 6))
	var _n_y_b5 = ((_n_HY - 4) - (_n_q_b3 * _S.invoke(_n_r_b2,"range",[14, 24])))
	var _n_rad_b6 = (_S.invoke(_n_r_b2,"range",[3, 5]) * (0.7 + (0.8 * _n_q_b3)))
	_S.invoke(_n_p,"disc",[_n_x_b4, _n_y_b5, _n_rad_b6, _S.index_value(_n_C,4), _S.function_value(_S.capture(_parent,{"q":_n_q_b3,"this":_n_this}),"_f12")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_q = _S.read(_parent,"q")
	var _n_dd_b0 = _S.arg(_args,0)
	return ((0.28 * sin((_n_q * PI))) * (1 - (_n_dd_b0 * _n_dd_b0)))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.3, 0.6])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_HX = _S.read(_parent,"HX")
	var _n_L = _S.read(_parent,"L")
	var _n_HY = _S.read(_parent,"HY")
	var _n_W = _S.read(_parent,"W")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_mote = _S.read(_parent,"mote")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_q_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_x_b4 = ((_n_HX + _S.invoke(_n_r_b2,"range",[10, (_n_L - 10)])) + (_n_q_b3 * 20))
	var _n_y_b5 = (_n_HY + (_S.invoke(_n_r_b2,"sign",[]) * ((_n_W + 1) + (_n_q_b3 * _S.invoke(_n_r_b2,"range",[4, 10])))))
	_S.call_value(_n_mote,[_n_p, _n_x_b4, _n_y_b5, 40, ((_n_y_b5 - _n_HY) * 1.5), (_S.index_value(_n_C,6) if _S.truth(_S.invoke(_n_r_b2,"chance",[0.5])) else _S.index_value(_n_C,5)), 0.6, (1 - _n_q_b3), 0.3])
	return null
