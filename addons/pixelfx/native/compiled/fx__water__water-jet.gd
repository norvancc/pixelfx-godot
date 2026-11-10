@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/water-jet.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "bead", _S.import_value("fx/water/_lib.js", "bead"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Water jet"}, {"desc": "A pressurised stream blasts right: a tight glassy rod with surges running down it that swells, roughens, bends under its weight and breaks into chunks, spray and mist."}, {"tags": ["water", "jet", "stream", "hose", "spray", "directional", "loop"]}, {"size": [188, 80]}, {"origin": [14, 32]}, {"duration": 1}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"length": 118}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "G", 520)
	_S.define(_e, "SPEED", 260)
	_S.define(_e, "drop", _S.function_value(_e, "_f6"))
	_S.define(_e, "thick", _S.function_value(_e, "_f7"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_drop = _S.read(_parent,"drop")
	var _n_SPEED = _S.read(_parent,"SPEED")
	var _n_thick = _S.read(_parent,"thick")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_bead = _S.read(_parent,"bead")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_n_D)
	var _n_L_b5 = _S.prop(_n_o_b2,"length")
	var _n_S_b6 = _S.named_value(_n_o_b2,"seed")
	var _n_T_b7 = (_n_ph_b4 * _n_TAU)
	if true:
		var _n_X_b9 = 0
		while _S.truth((_n_X_b9 <= (_n_L_b5 + 3))):
			var _n_x_b10 = (_n_X_b9 + 0.5)
			var _n_u_b11 = (float(_n_x_b10)/_n_L_b5)
			if _S.truth((_n_u_b11 > 1)):
				break
			var _n_yc_b12 = _S.call_value(_n_drop,[_n_x_b10, _n_L_b5])
			var _n_rough_b13 = _S.MathFX.smooth(0.25,1,_n_u_b11)
			var _n_sd_b14 = (fmod((fmod((_n_x_b10 - ((_n_ph_b4 * _n_SPEED) * 2)),130) + 130),130) - 65)
			var _n_w0_b15 = (_S.call_value(_n_thick,[_n_x_b10, _n_L_b5]) + ((exp((float((-(_n_sd_b14 * _n_sd_b14)))/90)) * 1.4) * (1 - (_n_u_b11 * 0.5))))
			var _n_up_b16 = (_n_w0_b15 + ((_S.NoiseKernels.tile_noise(((_n_x_b10 * 0.18) - (_n_ph_b4 * 30)),9,30,0,(_n_S_b6 + 1)) * 2.2) * _n_rough_b13))
			var _n_dn_b17 = (_n_w0_b15 + ((_S.NoiseKernels.tile_noise(((_n_x_b10 * 0.18) - (_n_ph_b4 * 30)),3,30,0,(_n_S_b6 + 1)) * 2.2) * _n_rough_b13))
			if true:
				var _n_Y_b18 = floori((_n_yc_b12 - _n_up_b16))
				while _S.truth((_n_Y_b18 <= ceili((_n_yc_b12 + _n_dn_b17)))):
					var _n_y_b19 = (_n_Y_b18 + 0.5)
					var _n_q_b20 = (float((_n_y_b19 - _n_yc_b12))/maxf(0.8,(_n_up_b16 if _S.truth((_n_y_b19 < _n_yc_b12)) else _n_dn_b17)))
					var _n_aq_b21 = absf(_n_q_b20)
					if _S.truth((_n_aq_b21 > 1)):
						_n_Y_b18 += 1.0
						continue
					if _S.truth(((_S.NoiseKernels.tile_noise(((_n_x_b10 * 0.12) - (_n_ph_b4 * 25)),((_n_y_b19 - _n_yc_b12) * 0.25),25,0,(_n_S_b6 + 2)) < ((-0.9) + (1.6 * _S.MathFX.smooth(0.55,1,_n_u_b11)))) if _S.truth((_n_u_b11 > 0.55)) else (_n_u_b11 > 0.55))):
						_n_Y_b18 += 1.0
						continue
					var _n_streak_b22 = _S.NoiseKernels.tile_noise(((_n_x_b10 * 0.06) - (_n_ph_b4 * 40)),(floori(((_n_y_b19 - _n_yc_b12) + 20)) * 1.7),40,0,_n_S_b6)
					var _n_lvl_b23 = (0 if _S.truth((_n_aq_b21 < 0.2)) else (1 if _S.truth((_n_aq_b21 < 0.48)) else (2 if _S.truth((_n_aq_b21 < 0.78)) else 3)))
					if _S.truth((_n_streak_b22 > 0.35)):
						_n_lvl_b23 = maxf(0,(_n_lvl_b23 - 1))
					if _S.truth((_n_q_b20 > 0.4)):
						_n_lvl_b23 = minf(3,(_n_lvl_b23 + 1))
					_S.invoke(_n_p_b0,"px",[_n_X_b9, _n_Y_b18, _S.index_value([_n_WHITE, _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5), _S.index_value(_n_C_b3,4)],_n_lvl_b23)])
					if _S.truth(_S.binary("===",_n_lvl_b23,0)):
						_S.invoke(_n_p_b0,"light",[_n_x_b10, _n_y_b19, _S.index_value(_n_C_b3,5), 0.12])
					_n_Y_b18 += 1.0
			_n_X_b9 += 1.0
	var _n_fl_b8 = (0.85 + (0.15 * sin((_n_T_b7 * 6))))
	_S.invoke(_n_p_b0,"circle",[0, 0, (4.4 * _n_fl_b8), _S.index_value(_n_C_b3,5)])
	_S.invoke(_n_p_b0,"circle",[0, 0, (3.4 * _n_fl_b8), _S.index_value(_n_C_b3,6)])
	_S.invoke(_n_p_b0,"circle",[0, 0, (2.2 * _n_fl_b8), _n_WHITE])
	if true:
		var _n_a_b24 = 0
		while _S.truth((_n_a_b24 < _n_TAU)):
			_S.invoke(_n_p_b0,"dot",[((cos((_n_a_b24 + (_n_T_b7 * 2))) * 5.2) * _n_fl_b8), ((sin((_n_a_b24 + (_n_T_b7 * 2))) * 5.2) * _n_fl_b8), _S.index_value(_n_C_b3,5), 0.6])
			_n_a_b24 += 0.35
	_S.invoke(_n_p_b0,"glow",[0, 0, 24, _S.index_value(_n_C_b3,5), (0.6 * _n_fl_b8)])
	_S.invoke(_n_p_b0,"glow",[0, 0, 8, _n_WHITE, (0.4 * _n_fl_b8)])
	if true:
		var _n_k_b25 = 0
		while _S.truth((_n_k_b25 < 6)):
			var _n_x_b26 = ((_n_L_b5 * 0.82) + fmod(((_n_k_b25 * 13) + (_n_ph_b4 * _n_SPEED)),78))
			var _n_y_b27 = ((_S.call_value(_n_drop,[minf(_n_x_b26,_n_L_b5), _n_L_b5]) + ((pow((float((_n_x_b26 - _n_L_b5))/60),2) * 10) if _S.truth((_n_x_b26 > _n_L_b5)) else 0)) + (sin((_n_k_b25 * 2.1)) * 1.5))
			if _S.truth((_n_x_b26 < (_n_L_b5 + 34))):
				_S.call_value(_n_bead,[_n_p_b0, _n_x_b26, _n_y_b27, _n_SPEED, 40, (3 if _S.truth(_S.binary("===",fmod(_n_k_b25,3),0)) else 2), _n_C_b3])
			_n_k_b25 += 1.0
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 70, (_n_S_b6 + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"L":_n_L_b5,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f2")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 12, (_n_S_b6 + 4), _S.function_value(_S.capture(_parent,{"this":_this}),"_f3"), _S.function_value(_S.capture(_parent,{"L":_n_L_b5,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f4")])
	if true:
		var _n_x_b28 = 0
		while _S.truth((_n_x_b28 < _n_L_b5)):
			_S.invoke(_n_p_b0,"glow",[_n_x_b28, _S.call_value(_n_drop,[_n_x_b28, _n_L_b5]), (14 + (_n_x_b28 * 0.1)), _S.index_value(_n_C_b3,4), (0.26 * (1 - ((float(_n_x_b28)/_n_L_b5) * 0.5)))])
			_n_x_b28 += 10
	_S.invoke(_n_p_b0,"glow",[(_n_L_b5 * 0.9), _S.call_value(_n_drop,[(_n_L_b5 * 0.9), _n_L_b5]), 26, _S.index_value(_n_C_b3,5), 0.22])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.2, 0.42])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_drop = _S.read(_parent,"drop")
	var _n_thick = _S.read(_parent,"thick")
	var _n_G = _S.read(_parent,"G")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_bead = _S.read(_parent,"bead")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_f_b3 = sqrt(_S.invoke(_n_r_b2,"next",[]))
	var _n_x0_b4 = (_n_L * (0.3 + (0.7 * _n_f_b3)))
	var _n_y0_b5 = (_S.call_value(_n_drop,[_n_x0_b4, _n_L]) + (_S.invoke(_n_r_b2,"range",[(-1), 1]) * _S.call_value(_n_thick,[_n_x0_b4, _n_L])))
	var _n_vx_b6 = (_S.invoke(_n_r_b2,"range",[150, 270]) * (0.55 + (0.45 * _n_f_b3)))
	var _n_vy_b7 = (((_S.invoke(_n_r_b2,"range",[(-1), 1]) * 110) * _n_f_b3) + _S.invoke(_n_r_b2,"range",[(-10), 20]))
	var _n_x_b8 = (_n_x0_b4 + (_n_vx_b6 * _n_age_b0))
	var _n_y_b9 = ((_n_y0_b5 + (_n_vy_b7 * _n_age_b0)) + (((0.5 * _n_G) * _n_age_b0) * _n_age_b0))
	var _n_k_b10 = (float(_n_age_b0)/_n_life_b1)
	if _S.truth(((((_n_x_b8 > (_n_L + 50)) if _S.truth((_n_x_b8 > (_n_L + 50))) else (_n_y_b9 > 40)) if _S.truth(((_n_x_b8 > (_n_L + 50)) if _S.truth((_n_x_b8 > (_n_L + 50))) else (_n_y_b9 > 40))) else (_n_y_b9 < (-28))) if _S.truth((((_n_x_b8 > (_n_L + 50)) if _S.truth((_n_x_b8 > (_n_L + 50))) else (_n_y_b9 > 40)) if _S.truth(((_n_x_b8 > (_n_L + 50)) if _S.truth((_n_x_b8 > (_n_L + 50))) else (_n_y_b9 > 40))) else (_n_y_b9 < (-28)))) else ((_S.invoke(_n_r_b2,"next",[]) < ((_n_k_b10 - 0.75) * 4)) if _S.truth((_n_k_b10 > 0.75)) else (_n_k_b10 > 0.75)))):
		return null
	if _S.truth((_S.invoke(_n_r_b2,"next",[]) < 0.45)):
		_S.invoke(_n_p,"px",[_n_x_b8, _n_y_b9, (_n_WHITE if _S.truth((_n_k_b10 < 0.5)) else _S.index_value(_n_C,6))])
	else:
		_S.call_value(_n_bead,[_n_p, _n_x_b8, _n_y_b9, _n_vx_b6, (_n_vy_b7 + (_n_G * _n_age_b0)), (2 if _S.truth((_S.invoke(_n_r_b2,"next",[]) < 0.2)) else 1), _n_C])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.7, 1])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_drop = _S.read(_parent,"drop")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_this = _S.read(_parent,"this")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_x_b4 = ((_n_L * _S.invoke(_n_r_b2,"range",[0.7, 1])) + (_n_age_b0 * _S.invoke(_n_r_b2,"range",[20, 45])))
	var _n_y_b5 = ((_S.call_value(_n_drop,[minf(_n_x_b4,_n_L), _n_L]) + _S.invoke(_n_r_b2,"range",[(-5), 5])) + (_n_age_b0 * _S.invoke(_n_r_b2,"range",[4, 14])))
	var _n_rad_b6 = (_S.invoke(_n_r_b2,"range",[3, 5]) + (_n_k_b3 * _S.invoke(_n_r_b2,"range",[5, 9])))
	var _n_a_b7 = ((_S.invoke(_n_r_b2,"range",[0.1, 0.18]) * minf(1,(float(_n_k_b3)/0.15))) * pow((1 - _n_k_b3),1.5))
	_S.invoke(_n_p,"disc",[_n_x_b4, _n_y_b5, _n_rad_b6, _S.index_value(_n_C,6), _S.function_value(_S.capture(_parent,{"a":_n_a_b7,"this":_n_this}),"_f5")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_a * (1 - (_n_d_b0 * _n_d_b0)))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	return (pow((float(_n_x_b0)/_n_L_b1),2) * 9)
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	return (2.6 + (5.4 * pow((float(_n_x_b0)/_n_L_b1),1.1)))
	return null
