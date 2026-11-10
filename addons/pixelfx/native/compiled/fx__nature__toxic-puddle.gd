@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/toxic-puddle.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "surf", _S.function_value(_e, "_f0"))
	_S.define(_e, "pool", _S.function_value(_e, "_f1"))
	_S.define(_e, "bubbles", _S.function_value(_e, "_f2"))
	_S.define(_e, "ribbon", _S.function_value(_e, "_f5"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f6"))
	_S.define(_e, "draw", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Toxic puddle"}, {"desc": "Black tar lit from inside by chartreuse veins and a glowing rim, an oily sheen drifting on it; glossy bubbles dome, stretch and pop, vapour curls up in fraying ribbons."}, {"tags": ["nature", "poison", "toxic", "sludge", "tar", "puddle", "hazard", "ground", "loop"]}, {"size": [176, 100]}, {"origin": [88, 86]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#06070a", "#0c100c", "#141a10", "#1e2814", "#2e3c18", "#5a7a1c", "#a6d42a", "#ecff86"]}, {"sheen": ["#2a1648", "#5a2e8e", "#1e7a86", "#6adccc"]}, {"width": 42}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_W_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_d_b3 = minf(1,(float(absf(_n_x_b0))/_n_W_b1))
	var _n_ph_b4 = (float((_n_TAU * _n_t_b2))/_n_D)
	var _n_lens_b5 = ((sqrt((1 - (_n_d_b3 * _n_d_b3))) * 6.6) + ((1.6 * _S.MathFX.smooth(0.8,0.9,_n_d_b3)) if _S.truth((_n_d_b3 > 0.8)) else 0))
	var _n_swell_b6 = ((pow(maxf(0,sin(((_n_x_b0 * 0.09) - _n_ph_b4))),6) * 1.2) + (pow(maxf(0,sin((((_n_x_b0 * 0.06) + (_n_ph_b4 * 2)) + 1))),8) * 0.9))
	return (-floori((_n_lens_b5 + (_n_swell_b6 * (1 - _n_d_b3)))+0.5))
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_surf = _S.read(_parent,"surf")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_Sh_b2 = _S.arg(_args,2)
	var _n_W_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_seed_b5 = _S.arg(_args,5)
	var _n_ph_b6 = (float(_n_t_b4)/_n_D)
	if true:
		var _n_x_b7 = floori(((-_n_W_b3) - 1))
		while _S.truth((_n_x_b7 <= ceili((_n_W_b3 + 1)))):
			var _n_d_b8 = (float(absf((_n_x_b7 + 0.5)))/_n_W_b3)
			if _S.truth((_n_d_b8 > 1.03)):
				_n_x_b7 += 1.0
				continue
			var _n_top_b9 = _S.call_value(_n_surf,[(_n_x_b7 + 0.5), _n_W_b3, _n_t_b4])
			var _n_oil_b10 = ((0.6 * _S.NoiseKernels.tile_noise((_n_x_b7 * 0.08),(_n_ph_b6 * 4),0,4,_n_seed_b5)) + (0.6 * _S.NoiseKernels.tile_noise(((_n_x_b7 * 0.11) - (_n_ph_b6 * 4)),1,4,0,(_n_seed_b5 + 1))))
			var _n_hue_b11 = _S.NoiseKernels.tile_noise((_n_x_b7 * 0.05),((_n_ph_b6 * 2) + 7),0,2,(_n_seed_b5 + 3))
			if true:
				var _n_y_b12 = _n_top_b9
				while _S.truth((_n_y_b12 <= 2)):
					if _S.truth((((_n_d_b8 > 0.75) if _S.truth(_S.binary("===",_n_y_b12,2)) else _S.binary("===",_n_y_b12,2)) if _S.truth(((_n_d_b8 > 0.75) if _S.truth(_S.binary("===",_n_y_b12,2)) else _S.binary("===",_n_y_b12,2))) else ((_n_d_b8 > 0.9) if _S.truth(_S.binary("===",_n_y_b12,1)) else _S.binary("===",_n_y_b12,1)))):
						_n_y_b12 += 1.0
						continue
					var _n_c_b13 = null
					if _S.truth(((_n_y_b12 <= 0) if _S.truth((_n_d_b8 > 0.93)) else (_n_d_b8 > 0.93))):
						_n_c_b13 = (_S.index_value(_n_C_b1,7) if _S.truth(_S.binary("===",_n_y_b12,_n_top_b9)) else _S.index_value(_n_C_b1,6))
					else:
						if _S.truth(_S.binary("===",_n_y_b12,_n_top_b9)):
							var _n_glint_b14 = _S.logical("||",(absf((fmod((fmod(((_n_x_b7 * 0.07) - (_n_ph_b6 * 3)),1) + 1),1) - 0.5)) < 0.012),func():return (_S.MathFX.rand([_n_x_b7,floori((_n_t_b4 * 10))]) < 0.015))
							_n_c_b13 = (_n_WHITE if _S.truth(_n_glint_b14) else ((_S.index_value(_n_Sh_b2,3) if _S.truth((_n_hue_b11 > 0)) else _S.index_value(_n_Sh_b2,2)) if _S.truth((_n_oil_b10 > 0.55)) else ((_S.index_value(_n_Sh_b2,1) if _S.truth((_n_hue_b11 > 0)) else _S.index_value(_n_C_b1,5)) if _S.truth((_n_oil_b10 > 0.15)) else _S.index_value(_n_C_b1,5))))
							if _S.truth(_n_glint_b14):
								_S.invoke(_n_p_b0,"light",[_n_x_b7, _n_y_b12, _S.index_value(_n_C_b1,7), 0.5])
						else:
							if _S.truth(_S.binary("===",_n_y_b12,(_n_top_b9 + 1))):
								_n_c_b13 = (_S.index_value(_n_Sh_b2,0) if _S.truth((_n_oil_b10 > 0.4)) else _S.index_value(_n_C_b1,3))
							else:
								if _S.truth((_n_y_b12 >= 1)):
									_n_c_b13 = _S.index_value(_n_C_b1,0)
								else:
									var _n_pulse_b15 = (0.5 + (0.5 * sin(((float((_n_TAU * _n_t_b4))/_n_D) + (_n_x_b7 * 0.03)))))
									var _n_v_b16 = absf((_S.NoiseKernels.tile_noise((_n_x_b7 * 0.09),((_n_y_b12 * 0.75) + (_n_ph_b6 * 4)),0,4,(_n_seed_b5 + 7)) + (0.2 * sin(((float(((_n_TAU * _n_t_b4) * 2))/_n_D) + (_n_x_b7 * 0.15))))))
									var _n_w_b17 = (0.6 + (0.6 * _n_pulse_b15))
									_n_c_b13 = (_S.index_value(_n_C_b1,7) if _S.truth((_n_v_b16 < (0.035 * _n_w_b17))) else (_S.index_value(_n_C_b1,6) if _S.truth((_n_v_b16 < (0.08 * _n_w_b17))) else (_S.index_value(_n_C_b1,4) if _S.truth((_n_v_b16 < (0.14 * _n_w_b17))) else _S.index_value(_n_C_b1,1))))
									if _S.truth((_n_v_b16 < (0.08 * _n_w_b17))):
										_S.invoke(_n_p_b0,"light",[_n_x_b7, _n_y_b12, _S.index_value(_n_C_b1,6), (0.25 + (0.3 * _n_pulse_b15))])
					_S.invoke(_n_p_b0,"px",[_n_x_b7, _n_y_b12, _n_c_b13])
					_n_y_b12 += 1.0
			if _S.truth(((_n_d_b8 <= 1.03) if _S.truth((_n_d_b8 > 0.9)) else (_n_d_b8 > 0.9))):
				_S.invoke(_n_p_b0,"px",[_n_x_b7, (_n_top_b9 - 1), _S.index_value(_n_C_b1,1)])
			_n_x_b7 += 1.0
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b18 = _iter_0
		if true:
			var _n_k_b19 = 1
			while _S.truth((_n_k_b19 <= 6)):
				_S.invoke(_n_p_b0,"dot",[(_n_s_b18 * (_n_W_b3 + _n_k_b19)), 0, (_S.index_value(_n_C_b1,6) if _S.truth((_n_k_b19 < 3)) else _S.index_value(_n_C_b1,5)), (1 - (float(_n_k_b19)/7))])
				_n_k_b19 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_Sh_b2 = _S.arg(_args,2)
	var _n_W_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_seed_b5 = _S.arg(_args,5)
	_S.call_value(_n_cycle,[_n_t_b4, _n_D, 8, _n_seed_b5, _S.function_value(_S.capture(_parent,{"this":_this}),"_f3"), _S.function_value(_S.capture(_parent,{"W":_n_W_b3,"t":_n_t_b4,"C":_n_C_b1,"p":_n_p_b0,"Sh":_n_Sh_b2,"seed":_n_seed_b5,"this":_this}),"_f4")])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[2.4, 3.2])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_surf = _S.read(_parent,"surf")
	var _n_t = _S.read(_parent,"t")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_p = _S.read(_parent,"p")
	var _n_Sh = _S.read(_parent,"Sh")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_seed = _S.read(_parent,"seed")
	var _n_fly = _S.read(_parent,"fly")
	var _n_ribbon = _S.read(_parent,"ribbon")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_swell_b3 = _S.invoke(_n_R_b2,"range",[1, 1.6])
	var _n_x_b4 = (_S.invoke(_n_R_b2,"range",[(-0.7), 0.7]) * _n_W)
	var _n_rmax_b5 = _S.invoke(_n_R_b2,"range",[4.5, 8])
	var _n_sy_b6 = (_S.call_value(_n_surf,[_n_x_b4, _n_W, _n_t]) + 0.5)
	if _S.truth((_n_age_b0 < _n_swell_b3)):
		var _n_k_b8 = (float(_n_age_b0)/_n_swell_b3)
		var _n_st_b9 = _S.MathFX.smooth(0.65,1,_n_k_b8)
		var _n_gr_b10 = _S.invoke(_n_ease,"outCubic",[minf(1,(_n_k_b8 * 1.3))])
		var _n_rx_b11 = ((_n_rmax_b5 * _n_gr_b10) * (1 - (0.18 * _n_st_b9)))
		var _n_ry_b12 = ((_n_rmax_b5 * _n_gr_b10) * (1 + (0.5 * _n_st_b9)))
		var _n_X_b13 = floori(_n_x_b4+0.5)
		var _n_Y_b14 = floori(_n_sy_b6+0.5)
		var _n_inner_b15 = (0.35 + (0.65 * _n_k_b8))
		if true:
			var _n_j_b16 = ((-ceili(_n_ry_b12)) - 1)
			while _S.truth((_n_j_b16 <= 0)):
				if true:
					var _n_i_b17 = ((-ceili(_n_rx_b11)) - 1)
					while _S.truth((_n_i_b17 <= (ceili(_n_rx_b11) + 1))):
						var _n_dd_b18 = _S.Bridge.hypot([(float(_n_i_b17)/maxf(0.6,_n_rx_b11)), (float(_n_j_b16)/maxf(0.6,_n_ry_b12))])
						if _S.truth((_n_dd_b18 > 1.1)):
							_n_i_b17 += 1.0
							continue
						var _n_c_b19 = null
						if _S.truth((_n_dd_b18 > 0.9)):
							_n_c_b19 = _S.index_value(_n_C,0)
						else:
							if _S.truth(((_n_j_b16 > ((-_n_ry_b12) * 0.75)) if _S.truth((_n_dd_b18 < (0.55 * _n_inner_b15))) else (_n_dd_b18 < (0.55 * _n_inner_b15)))):
								_n_c_b19 = (_S.index_value(_n_C,6) if _S.truth((_n_dd_b18 < (0.3 * _n_inner_b15))) else _S.index_value(_n_C,5))
							else:
								if _S.truth((_n_dd_b18 < (0.8 * _n_inner_b15))):
									_n_c_b19 = _S.index_value(_n_C,4)
								else:
									_n_c_b19 = (_S.index_value(_n_C,2) if _S.truth((_n_j_b16 < ((-_n_ry_b12) * 0.5))) else _S.index_value(_n_C,3))
						_S.invoke(_n_p,"px",[(_n_X_b13 + _n_i_b17), (_n_Y_b14 + _n_j_b16), _n_c_b19])
						_n_i_b17 += 1.0
				_n_j_b16 += 1.0
		if _S.truth((_n_rx_b11 > 1.8)):
			if true:
				var _n_a_b20 = 3.5
				while _S.truth((_n_a_b20 < 4.7)):
					_S.invoke(_n_p,"px",[(_n_X_b13 + ((cos(_n_a_b20) * _n_rx_b11) * 0.68)), (_n_Y_b14 + ((sin(_n_a_b20) * _n_ry_b12) * 0.68)), (_S.index_value(_n_Sh,3) if _S.truth((_n_a_b20 < 3.9)) else (_S.index_value(_n_C,7) if _S.truth((_n_a_b20 < 4.3)) else _S.index_value(_n_Sh,1)))])
					_n_a_b20 += 0.16
		if _S.truth((_n_rx_b11 > 1.2)):
			_S.invoke(_n_p,"px",[(_n_X_b13 - floori((_n_rx_b11 * 0.35)+0.5)), (_n_Y_b14 - floori((_n_ry_b12 * 0.62)+0.5)), _n_WHITE])
			_S.invoke(_n_p,"px",[((_n_X_b13 - floori((_n_rx_b11 * 0.35)+0.5)) + 1), (_n_Y_b14 - floori((_n_ry_b12 * 0.62)+0.5)), _S.index_value(_n_C,7)])
		_S.invoke(_n_p,"glow",[_n_x_b4, (_n_sy_b6 - (_n_ry_b12 * 0.5)), (7 + (_n_rx_b11 * 1.4)), _S.index_value(_n_C,6), ((0.2 + (0.35 * _n_st_b9)) * _n_gr_b10)])
		return null
	var _n_e_b7 = (_n_age_b0 - _n_swell_b3)
	if _S.truth((_n_e_b7 < 0.3)):
		var _n_k_b21 = (float(_n_e_b7)/0.3)
		var _n_rr_b22 = (2 + (14 * _S.invoke(_n_ease,"outCubic",[_n_k_b21])))
		if true:
			var _n_a_b23 = 0
			while _S.truth((_n_a_b23 < _n_TAU)):
				var _n_rx2_b24 = (_n_x_b4 + (cos(_n_a_b23) * _n_rr_b22))
				var _n_ry2_b25 = (_n_sy_b6 + ((sin(_n_a_b23) * _n_rr_b22) * 0.22))
				if _S.truth((absf(_n_rx2_b24) < (_n_W * 0.95))):
					_S.invoke(_n_p,"dot",[_n_rx2_b24, _n_ry2_b25, (_n_WHITE if _S.truth((_n_k_b21 < 0.4)) else (_S.index_value(_n_C,7) if _S.truth((_n_k_b21 < 0.7)) else _S.index_value(_n_C,6))), ((1 - _n_k_b21) * 1.4)])
				_n_a_b23 += (float(0.5)/_n_rr_b22)
		_S.invoke(_n_p,"glowRing",[_n_x_b4, _n_sy_b6, _n_rr_b22, 3, _S.index_value(_n_C,6), (0.35 * (1 - _n_k_b21))])
		if _S.truth((_n_e_b7 < 0.1)):
			_S.invoke(_n_p,"glow",[_n_x_b4, (_n_sy_b6 - 2), 18, _S.index_value(_n_C,6), (0.7 * (1 - (float(_n_e_b7)/0.1)))])
	if true:
		var _n_j_b26 = 0
		while _S.truth((_n_j_b26 < 7)):
			var _n_vx_b27 = ((_S.MathFX.rand([_n_j_b26,_n_seed,floori((_n_x_b4 * 10)+0.5)]) - 0.5) * 80)
			var _n_vy_b28 = ((-45) - (_S.MathFX.rand([_n_j_b26,(_n_seed + 3),floori((_n_x_b4 * 10)+0.5)]) * 70))
			var _tuple_0 = _S.call_value(_n_fly,[_n_x_b4, (_n_sy_b6 - 2), _n_vx_b27, _n_vy_b28, _n_e_b7, 420])
			var _n_dx_b29 = _S.prop(_tuple_0,0)
			var _n_dy_b30 = _S.prop(_tuple_0,1)
			if _S.truth(((_n_e_b7 < 0.6) if _S.truth((_n_dy_b30 < _n_sy_b6)) else (_n_dy_b30 < _n_sy_b6))):
				_S.invoke(_n_p,"px",[_n_dx_b29, _n_dy_b30, _S.index_value(_n_C,1)])
				_S.invoke(_n_p,"px",[_n_dx_b29, (_n_dy_b30 - 1), (_S.index_value(_n_Sh,3) if _S.truth(_S.binary("&",_n_j_b26,1)) else _S.index_value(_n_C,6))])
			_n_j_b26 += 1.0
	_S.call_value(_n_ribbon,[_n_p, _n_C, _n_x_b4, (_n_sy_b6 - 2), _n_e_b7, (_n_L_b1 - _n_swell_b3), _n_R_b2, 0.9])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_hex = _S.read(_parent,"hex")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_x0_b2 = _S.arg(_args,2)
	var _n_y0_b3 = _S.arg(_args,3)
	var _n_age_b4 = _S.arg(_args,4)
	var _n_life_b5 = _S.arg(_args,5)
	var _n_R_b6 = _S.arg(_args,6)
	var _n_k_b7 = _S.arg(_args,7)
	var _n_u_b8 = (float(_n_age_b4)/_n_life_b5)
	var _n_len_b9 = _S.invoke(_n_R_b6,"range",[16, 26])
	var _n_rise_b10 = _S.invoke(_n_R_b6,"range",[9, 14])
	var _n_amp_b11 = _S.invoke(_n_R_b6,"range",[2, 4.5])
	var _n_w_b12 = _S.invoke(_n_R_b6,"range",[0.18, 0.3])
	var _n_ph_b13 = _S.invoke(_n_R_b6,"range",[0, _n_TAU])
	var _n_head_b14 = (_n_rise_b10 * _n_age_b4)
	var _n_tail_b15 = maxf(0,(_n_head_b14 - _n_len_b9))
	var _n_fray_b16 = _S.MathFX.smooth(0.35,0.85,_n_u_b8)
	var _n_fade_b17 = ((_S.MathFX.smooth(0,0.12,_n_u_b8) * (1 - _S.MathFX.smooth(0.5,1,_n_u_b8))) * _n_k_b7)
	if _S.truth((_n_fade_b17 < 0.02)):
		return null
	var _n_GREY_b18 = _S.call_value(_n_hex,["#b4b8ae"])
	var _n_n_b19 = (3 if _S.truth((_n_fray_b16 > 0.05)) else 1)
	if true:
		var _n_h_b20 = _n_tail_b15
		while _S.truth((_n_h_b20 <= _n_head_b14)):
			var _n_s_b21 = (float((_n_h_b20 - _n_tail_b15))/maxf(1,(_n_head_b14 - _n_tail_b15)))
			var _n_cx_b22 = (_n_x0_b2 + ((_n_amp_b11 * sin((((_n_h_b20 * _n_w_b12) + _n_ph_b13) + (_n_age_b4 * 1.6)))) * (0.3 + _n_s_b21)))
			var _n_y_b23 = (_n_y0_b3 - _n_h_b20)
			var _n_a_b24 = ((_n_fade_b17 * sin((PI * _n_s_b21))) * 0.45)
			var _n_lit_b25 = (maxf(0,(1 - (float(_n_h_b20)/22))) * (1 - (0.6 * _n_fray_b16)))
			var _n_VAP_b26 = _S.ColorFX.mix(_n_GREY_b18,_S.index_value(_n_C_b1,6),(0.75 * _n_lit_b25))
			if true:
				var _n_q_b27 = 0
				while _S.truth((_n_q_b27 < _n_n_b19)):
					var _n_off_b28 = (0 if _S.truth(_S.binary("===",_n_n_b19,1)) else ((((_n_fray_b16 * _n_s_b21) * (_n_q_b27 - 1)) * 3) + ((_n_fray_b16 * 2.5) * sin((((_n_h_b20 * (0.35 + (_n_q_b27 * 0.17))) + (_n_ph_b13 * (_n_q_b27 + 1))) + (_n_age_b4 * 2))))))
					_S.invoke(_n_p_b0,"blend",[(_n_cx_b22 + _n_off_b28), _n_y_b23, _n_VAP_b26, ((_n_a_b24 * (1 if _S.truth(_S.binary("===",_n_n_b19,1)) else (0.65 - (0.25 * _n_fray_b16)))) * (0.8 + (0.4 * _n_lit_b25)))])
					_n_q_b27 += 1.0
			_n_h_b20 += 0.5
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_pool = _S.read(_parent,"pool")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_Sh_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"sheen"),4)
	var _n_W_b5 = _S.named_value(_n_o_b2,"width")
	var _n_pulse_b6 = (0.85 + (0.15 * sin((float(((_n_TAU * _n_t_b1) * 2))/_n_D))))
	_S.invoke(_n_p_b0,"glow",[0, (-3), (_n_W_b5 * 1.25), _S.index_value(_n_C_b3,5), (0.22 * _n_pulse_b6)])
	_S.invoke(_n_p_b0,"glow",[0, (-10), (_n_W_b5 * 1.1), _S.index_value(_n_C_b3,6), (0.1 * _n_pulse_b6)])
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b7 = _iter_0
		_S.invoke(_n_p_b0,"glow",[(_n_s_b7 * _n_W_b5), (-1), 12, _S.index_value(_n_C_b3,6), (0.35 * _n_pulse_b6)])
	_S.call_value(_n_pool,[_n_p_b0, _n_C_b3, _n_Sh_b4, _n_W_b5, _n_t_b1, _S.named_value(_n_o_b2,"seed")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_bubbles = _S.read(_parent,"bubbles")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_Sh_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"sheen"),4)
	var _n_W_b5 = _S.named_value(_n_o_b2,"width")
	_S.call_value(_n_bubbles,[_n_p_b0, _n_C_b3, _n_Sh_b4, _n_W_b5, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 7) + 1)])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 9, ((_S.named_value(_n_o_b2,"seed") * 13) + 4), _S.function_value(_S.capture(_parent,{"this":_this}),"_f8"), _S.function_value(_S.capture(_parent,{"W":_n_W_b5,"p":_n_p_b0,"C":_n_C_b3,"t":_n_t_b1,"this":_this}),"_f9")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[2.4, 3.4])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_ribbon = _S.read(_parent,"ribbon")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_surf = _S.read(_parent,"surf")
	var _n_t = _S.read(_parent,"t")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_x_b3 = (_S.invoke(_n_R_b2,"range",[(-0.85), 0.85]) * _n_W)
	_S.call_value(_n_ribbon,[_n_p, _n_C, _n_x_b3, (_S.call_value(_n_surf,[_n_x_b3, _n_W, _n_t]) - 1), _n_age_b0, _n_L_b1, _n_R_b2, 0.75])
	return null
