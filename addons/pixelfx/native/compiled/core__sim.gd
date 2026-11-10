@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/sim.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f0":"sparkle","_f1":"flare","_f2":"band","_f4":"crystal","_f12":"particles_update","_f13":"particles_draw","_f23":"bits_update","_f24":"bits_draw","_f27":"lights_update","_f28":"lights_draw"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Rng", _S.import_value("core/math.js", "Rng"))
	_S.define(_e, "clamp", _S.import_value("core/math.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/math.js", "TAU"))
	_S.define(_e, "hex", _S.import_value("core/color.js", "hex"))
	_S.define(_e, "scale", _S.import_value("core/color.js", "scale"))
	_S.define(_e, "mix", _S.import_value("core/color.js", "mix"))
	_S.define(_e, "rgb", _S.import_value("core/color.js", "rgb"))
	_S.define(_e, "WHITE", _S.import_value("core/color.js", "WHITE"))
	_S.define(_e, "sparkle", _S.function_value(_e, "_f0"))
	_S.define(_e, "flare", _S.function_value(_e, "_f1"))
	_S.define(_e, "band", _S.function_value(_e, "_f2"))
	_S.define(_e, "crystal", _S.function_value(_e, "_f4"))
	_S.define(_e, "GRAVITY", 950)
	_exports["GRAVITY"] = _S.read(_e, "GRAVITY")
	_S.define(_e, "CROSS", [[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]])
	_S.define(_e, "DIAG", [[1, 1], [1, _S.unary("-", 1)], [_S.unary("-", 1), 1], [_S.unary("-", 1), _S.unary("-", 1)]])
	_S.define(_e, "HOT", _S.invoke(["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "FIRE_RAMP", _S.invoke(["#ffffff", "#fff3a6", "#ffe26b", "#ffc23d", "#ff8a2a", "#f2561d", "#c9281f", "#8a1f17", "#4a1712"], "map", [_S.read(_e, "hex")]))
	_exports["FIRE_RAMP"] = _S.read(_e, "FIRE_RAMP")
	_S.define(_e, "SMOKE_RAMP", _S.invoke(["#7b6f72", "#5d5660", "#433d48", "#2b2630", "#1a171e"], "map", [_S.read(_e, "hex")]))
	_exports["SMOKE_RAMP"] = _S.read(_e, "SMOKE_RAMP")
	_S.define(_e, "rampAt", _S.function_value(_e, "_f7"))
	_S.define(_e, "P", _S.merge([{"SPARK": 0}, {"MOTE": 1}, {"STREAK": 2}, {"FLAKE": 3}, {"VAPOUR": 4}, {"DUST": 5}, {"STAR": 6}, {"EMBER": 7}, {"SMOKE": 8}, {"FIRE": 9}, {"BRAND": 10}, {"GRIT": 11}]))
	_exports["P"] = _S.read(_e, "P")
	_S.define(_e, "PF", _S.merge([{"SMOKES": 1}, {"BIG": 2}, {"BACK": 4}]))
	_exports["PF"] = _S.read(_e, "PF")
	_S.define(_e, "SOFT", _S.construct(_S.read(_e, "Set"), [[_S.prop(_S.read(_e, "P"), "VAPOUR"), _S.prop(_S.read(_e, "P"), "DUST"), _S.prop(_S.read(_e, "P"), "SMOKE")]]))
	_S.define(_e, "Particles", _S.class_value("Particles", _S.function_value(_e, "_f8"), {"spawn": _S.function_value(_e, "_f10"), "update": _S.function_value(_e, "_f12"), "draw": _S.function_value(_e, "_f13")}, {"count": _S.function_value(_e, "_f11")}, {}, null))
	_exports["Particles"] = _S.read(_e, "Particles")
	_S.define(_e, "Blazes", _S.class_value("Blazes", _S.function_value(_e, "_f14"), {"add": _S.function_value(_e, "_f15"), "update": _S.function_value(_e, "_f17"), "drawBack": _S.function_value(_e, "_f18")}, {"count": _S.function_value(_e, "_f16")}, {}, null))
	_exports["Blazes"] = _S.read(_e, "Blazes")
	_S.define(_e, "B", _S.merge([{"SHARD": 0}, {"CHUNK": 1}, {"DRIP": 2}]))
	_exports["B"] = _S.read(_e, "B")
	_S.define(_e, "Bits", _S.class_value("Bits", _S.function_value(_e, "_f19"), {"add": _S.function_value(_e, "_f21"), "update": _S.function_value(_e, "_f23"), "draw": _S.function_value(_e, "_f24")}, {"count": _S.function_value(_e, "_f22")}, {}, null))
	_exports["Bits"] = _S.read(_e, "Bits")
	_S.define(_e, "Lights", _S.class_value("Lights", _S.function_value(_e, "_f25"), {"add": _S.function_value(_e, "_f26"), "update": _S.function_value(_e, "_f27"), "draw": _S.function_value(_e, "_f28")}, {}, {}, null))
	_exports["Lights"] = _S.read(_e, "Lights")
	_exports["sparkle"] = _S.read(_e, "sparkle")
	_exports["flare"] = _S.read(_e, "flare")
	_exports["band"] = _S.read(_e, "band")
	_exports["crystal"] = _S.read(_e, "crystal")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_CROSS = _S.read(_parent,"CROSS")
	var _n_DIAG = _S.read(_parent,"DIAG")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_arm_b3 = _S.arg(_args,3)
	var _n_c_b4 = _S.arg(_args,4)
	var _n_tip_b5 = _S.coalesce(_S.arg(_args,5),func():return _n_c_b4)
	var _n_k_b6 = _S.coalesce(_S.arg(_args,6),func():return 0.6)
	var _n_n_b7 = floori(_n_arm_b3+0.5)
	if _S.truth((_n_n_b7 < 1)):
		return null
	var _n_X_b8 = floori(_n_x_b1)
	var _n_Y_b9 = floori(_n_y_b2)
	if true:
		var _n_d_b10 = 1
		while _S.truth((_n_d_b10 <= _n_n_b7)):
			var _n_cc_b11 = (_n_tip_b5 if _S.truth((_n_d_b10 > (_n_n_b7 * 0.6))) else _n_c_b4)
			for _iter_0 in _S.array(_n_CROSS):
				var _tuple_1 = _iter_0
				var _n_dx_b12 = _S.prop(_tuple_1,0)
				var _n_dy_b13 = _S.prop(_tuple_1,1)
				_S.invoke(_n_p_b0,"px",[(_n_X_b8 + (_n_dx_b12 * _n_d_b10)), (_n_Y_b9 + (_n_dy_b13 * _n_d_b10)), _n_cc_b11])
			_n_d_b10 += 1.0
	if _S.truth((_n_n_b7 >= 3)):
		for _iter_2 in _S.array(_n_DIAG):
			var _tuple_3 = _iter_2
			var _n_dx_b14 = _S.prop(_tuple_3,0)
			var _n_dy_b15 = _S.prop(_tuple_3,1)
			_S.invoke(_n_p_b0,"px",[(_n_X_b8 + _n_dx_b14), (_n_Y_b9 + _n_dy_b15), _n_c_b4])
	if _S.truth((_n_n_b7 >= 6)):
		for _iter_4 in _S.array(_n_DIAG):
			var _tuple_5 = _iter_4
			var _n_dx_b16 = _S.prop(_tuple_5,0)
			var _n_dy_b17 = _S.prop(_tuple_5,1)
			_S.invoke(_n_p_b0,"px",[(_n_X_b8 + (_n_dx_b16 * 2)), (_n_Y_b9 + (_n_dy_b17 * 2)), _n_tip_b5])
	_S.invoke(_n_p_b0,"px",[_n_X_b8, _n_Y_b9, _n_WHITE])
	_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, (4 + (_n_n_b7 * 2)), _n_c_b4, _n_k_b6])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_L_b3 = _S.arg(_args,3)
	var _n_k_b4 = _S.arg(_args,4)
	var _n_ramp_b5 = _S.arg(_args,5)
	if _S.truth((_n_L_b3 < 1)):
		return null
	var _n_R_b6 = _S.invoke(_n_ramp_b5,"map",[_n_hex])
	var _n_n_b7 = _S.prop(_n_R_b6,"length")
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < 8)):
			var _n_an_b9 = (float((_n_i_b8 * PI))/4)
			var _n_len_b10 = (_n_L_b3 if _S.truth(_S.binary("===",fmod(_n_i_b8,4),0)) else ((_n_L_b3 * 0.6) if _S.truth(_S.binary("===",fmod(_n_i_b8,2),0)) else (_n_L_b3 * 0.3)))
			var _n_ca_b11 = cos(_n_an_b9)
			var _n_sa_b12 = sin(_n_an_b9)
			if true:
				var _n_d_b13 = 0
				while _S.truth((_n_d_b13 <= _n_len_b10)):
					var _n_u_b14 = (float(_n_d_b13)/_n_len_b10)
					_S.invoke(_n_p_b0,"dot",[(_n_x_b1 + (_n_ca_b11 * _n_d_b13)), (_n_y_b2 + (_n_sa_b12 * _n_d_b13)), (_n_WHITE if _S.truth((_n_u_b14 < 0.35)) else (_S.index_value(_n_R_b6,(_n_n_b7 - 2)) if _S.truth((_n_u_b14 < 0.7)) else _S.index_value(_n_R_b6,(_n_n_b7 - 3)))), (1 if _S.truth((_n_u_b14 < 0.6)) else (((_n_k_b4 * 1.5) * (1 - _n_u_b14)) + 0.2))])
					_n_d_b13 += 0.5
			_n_i_b8 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_cx_b1 = _S.arg(_args,1)
	var _n_cy_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_sy_b4 = _S.arg(_args,4)
	var _n_th_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.arg(_args,6)
	var _n_ramp_b7 = _S.arg(_args,7)
	var _n_keep_b8 = _S.coalesce(_S.arg(_args,8),func():return _S.function_value(_S.capture(_parent,{"this":_this}),"_f3"))
	var _n_hot_b9 = _S.coalesce(_S.arg(_args,9),func():return false)
	if _S.truth(((_n_r_b3 <= 0) if _S.truth((_n_r_b3 <= 0)) else (_n_k_b6 <= 0))):
		return null
	var _n_R_b10 = _S.invoke(_n_ramp_b7,"map",[_n_hex])
	var _n_n_b11 = _S.prop(_n_R_b10,"length")
	if true:
		var _n_j_b12 = 0
		var _n_m_b13 = ceili(((_n_r_b3 * _n_TAU) * 1.2))
		while _S.truth((_n_j_b12 < _n_m_b13)):
			var _n_ang_b14 = ((float(_n_j_b12)/_n_m_b13) * _n_TAU)
			var _n_ca_b15 = cos(_n_ang_b14)
			var _n_sa_b16 = sin(_n_ang_b14)
			if _S.truth(not _S.truth(_S.call_value(_n_keep_b8,[_n_ang_b14]))):
				_n_j_b12 += 1.0
				continue
			if true:
				var _n_o_b17 = _n_th_b5
				while _S.truth((_n_o_b17 >= 0)):
					var _n_u_b18 = (float(_n_o_b17)/_n_th_b5)
					var _n_c_b19 = ((_n_WHITE if _S.truth(_n_hot_b9) else _S.index_value(_n_R_b10,(_n_n_b11 - 1))) if _S.truth((_n_u_b18 < 0.15)) else (_S.index_value(_n_R_b10,(_n_n_b11 - 2)) if _S.truth((_n_u_b18 < 0.4)) else (_S.index_value(_n_R_b10,(_n_n_b11 - 3)) if _S.truth((_n_u_b18 < 0.7)) else _S.index_value(_n_R_b10,(_n_n_b11 - 4)))))
					_S.invoke(_n_p_b0,"dot",[(_n_cx_b1 + (_n_ca_b15 * (_n_r_b3 - _n_o_b17))), (_n_cy_b2 + ((_n_sa_b16 * (_n_r_b3 - _n_o_b17)) * _n_sy_b4)), _n_c_b19, (_n_k_b6 * (1.2 if _S.truth((_n_u_b18 < 0.4)) else (1.15 - _n_u_b18)))])
					_n_o_b17 -= 0.5
			_n_j_b12 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	return true
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_base_b2 = _S.arg(_args,2)
	var _n_h_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_lean_b5 = _S.arg(_args,5)
	var _n_ramp_b6 = _S.arg(_args,6)
	var _n_opts_b7 = _S.coalesce(_S.arg(_args,7),func():return {})
	if _S.truth((_n_h_b3 < 1.5)):
		return null
	var _n_R_b8 = _S.invoke(_n_ramp_b6,"map",[_n_hex])
	var _n_n_b9 = _S.prop(_n_R_b8,"length")
	var _n_C_b10 = _S.function_value(_S.capture(_parent,{"R":_n_R_b8,"n":_n_n_b9,"this":_this}),"_f5")
	var _n_a_b11 = (_S.named_value(_n_opts_b7,"a") if _S.named_value(_n_opts_b7,"a")!=null else 1)
	var _n_top_b12 = (_n_base_b2 - _n_h_b3)
	var _n_ridge0_b13 = (_n_x_b1 - (_n_w_b4 * 0.14))
	var _n_glint_b14 = (_S.named_value(_n_opts_b7,"glint") if _S.named_value(_n_opts_b7,"glint")!=null else (-1))
	var _n_inside_b15 = _S.function_value(_S.capture(_parent,{"base":_n_base_b2,"h":_n_h_b3,"x":_n_x_b1,"lean":_n_lean_b5,"w":_n_w_b4,"this":_this}),"_f6")
	if true:
		var _n_py_b16 = (floori(_n_top_b12) - 1)
		while _S.truth((_n_py_b16 < ceili(_n_base_b2))):
			if true:
				var _n_px_b17 = floori((((_n_x_b1 - (float(_n_w_b4)/2)) - absf(_n_lean_b5)) - 2))
				while _S.truth((_n_px_b17 <= ceili((((_n_x_b1 + (float(_n_w_b4)/2)) + absf(_n_lean_b5)) + 2)))):
					if _S.truth(not _S.truth(_S.call_value(_n_inside_b15,[_n_px_b17, _n_py_b16]))):
						if _S.truth(_S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_inside_b15,[(_n_px_b17 - 1), _n_py_b16]),func():return _S.call_value(_n_inside_b15,[(_n_px_b17 + 1), _n_py_b16])),func():return _S.call_value(_n_inside_b15,[_n_px_b17, (_n_py_b16 + 1)])),func():return _S.logical("&&",_S.call_value(_n_inside_b15,[_n_px_b17, (_n_py_b16 - 1)]),func():return (_n_py_b16 < (_n_base_b2 - 1))))):
							_S.invoke(_n_p_b0,"dot",[_n_px_b17, _n_py_b16, _S.index_value(_n_R_b8,0), _n_a_b11])
						_n_px_b17 += 1.0
						continue
					if _S.truth(_S.named_value(_n_opts_b7,"white")):
						_S.invoke(_n_p_b0,"dot",[_n_px_b17, _n_py_b16, _n_WHITE, _n_a_b11])
						_n_px_b17 += 1.0
						continue
					var _n_u_b18 = (float((_n_base_b2 - (_n_py_b16 + 0.5)))/_n_h_b3)
					var _n_rx_b19 = (_n_ridge0_b13 + (((_n_x_b1 + _n_lean_b5) - _n_ridge0_b13) * _n_u_b18))
					var _n_c_b20 = (_n_x_b1 + (_n_lean_b5 * _n_u_b18))
					var _n_hw_b21 = (((float(_n_w_b4)/2) * (1 - _n_u_b18)) + 0.35)
					var _n_fx_b22 = (_n_px_b17 + 0.5)
					var _n_col_b23 = (_n_WHITE if _S.truth((_n_u_b18 > 0.9)) else (_S.call_value(_n_C_b10,[1]) if _S.truth((absf((_n_fx_b22 - _n_rx_b19)) < 0.55)) else ((_S.call_value(_n_C_b10,[1]) if _S.truth(((_n_fx_b22 - (_n_c_b20 - _n_hw_b21)) < 1)) else (_S.call_value(_n_C_b10,[2]) if _S.truth(((float((_n_fx_b22 - (_n_c_b20 - _n_hw_b21)))/maxf(1,(_n_rx_b19 - (_n_c_b20 - _n_hw_b21)))) > 0.55)) else _S.call_value(_n_C_b10,[3]))) if _S.truth((_n_fx_b22 < _n_rx_b19)) else (_S.call_value(_n_C_b10,[minf((_n_n_b9 - 2),6)]) if _S.truth((((_n_c_b20 + _n_hw_b21) - _n_fx_b22) < 1.2)) else (_S.call_value(_n_C_b10,[5]) if _S.truth(((float((_n_fx_b22 - _n_rx_b19))/maxf(1,((_n_c_b20 + _n_hw_b21) - _n_rx_b19))) > 0.5)) else _S.call_value(_n_C_b10,[4]))))))
					if _S.truth(((_n_fx_b22 <= (_n_rx_b19 + 0.6)) if _S.truth((_n_glint_b14 >= 0)) else (_n_glint_b14 >= 0))):
						var _n_g_b24 = absf((_n_u_b18 - _n_glint_b14))
						if _S.truth((_n_g_b24 < 0.05)):
							_n_col_b23 = _n_WHITE
						else:
							if _S.truth((_n_g_b24 < 0.1)):
								_n_col_b23 = _S.call_value(_n_C_b10,[1])
					_S.invoke(_n_p_b0,"dot",[_n_px_b17, _n_py_b16, _n_col_b23, _n_a_b11])
					_n_px_b17 += 1.0
			_n_py_b16 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_n = _S.read(_parent,"n")
	var _n_i_b0 = _S.arg(_args,0)
	return _S.index_value(_n_R,maxf(0,((_n_n - 1) - _n_i_b0)))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_base = _S.read(_parent,"base")
	var _n_h = _S.read(_parent,"h")
	var _n_x = _S.read(_parent,"x")
	var _n_lean = _S.read(_parent,"lean")
	var _n_w = _S.read(_parent,"w")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_u_b2 = (float((_n_base - (_n_py_b1 + 0.5)))/_n_h)
	return ((absf(((_n_px_b0 + 0.5) - (_n_x + (_n_lean * _n_u_b2)))) <= (((float(_n_w)/2) * (1 - _n_u_b2)) + 0.35)) if _S.truth(((_n_u_b2 <= 1) if _S.truth((_n_u_b2 >= 0)) else (_n_u_b2 >= 0))) else ((_n_u_b2 <= 1) if _S.truth((_n_u_b2 >= 0)) else (_n_u_b2 >= 0)))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	return _S.index_value(_n_r_b0,minf((_S.prop(_n_r_b0,"length") - 1),maxf(0,floori((_n_t_b1 * _S.prop(_n_r_b0,"length"))))))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_HOT = _S.read(_parent,"HOT")
	var _n_hex = _S.read(_parent,"hex")
	var _n_opts_b0 = _S.coalesce(_S.arg(_args,0),func():return {})
	_S.set_prop(_this,"R",(_S.named_value(_n_opts_b0,"rng") if _S.named_value(_n_opts_b0,"rng")!=null else _S.construct(_n_Rng,[(_S.named_value(_n_opts_b0,"seed") if _S.named_value(_n_opts_b0,"seed")!=null else 1)])),"=")
	_S.set_prop(_this,"list",[],"=")
	_S.set_prop(_this,"t",0,"=")
	_S.set_prop(_this,"ground",(_S.named_value(_n_opts_b0,"ground") if _S.named_value(_n_opts_b0,"ground")!=null else _S.function_value(_S.capture(_parent,{"this":_this}),"_f9")),"=")
	_S.set_prop(_this,"sparks",_S.invoke((_S.named_value(_n_opts_b0,"sparks") if _S.named_value(_n_opts_b0,"sparks")!=null else _n_HOT),"map",[_n_hex]),"=")
	_S.set_prop(_this,"haze",(null if _S.truth(_S.binary("===",_S.named_value(_n_opts_b0,"haze"),null)) else _S.call_value(_n_hex,[_S.named_value(_n_opts_b0,"haze")])),"=")
	_S.set_prop(_this,"onLand",(_S.named_value(_n_opts_b0,"onLand") if _S.named_value(_n_opts_b0,"onLand")!=null else null),"=")
	return null

static func _f9(_parent,_args:Array,_this=null):
	return INF
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_hex = _S.read(_parent,"hex")
	var _n_k_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_vx_b3 = _S.arg(_args,3)
	var _n_vy_b4 = _S.arg(_args,4)
	var _n_life_b5 = _S.arg(_args,5)
	var _n_col_b6 = _S.coalesce(_S.arg(_args,6),func():return _n_WHITE)
	var _n_size_b7 = _S.coalesce(_S.arg(_args,7),func():return 1)
	var _n_delay_b8 = _S.coalesce(_S.arg(_args,8),func():return 0)
	var _n_flag_b9 = _S.coalesce(_S.arg(_args,9),func():return 0)
	_S.invoke(_S.named_value(_this,"list"),"push",[{"k":_n_k_b0,"x":_n_x_b1,"y":_n_y_b2,"vx":_n_vx_b3,"vy":_n_vy_b4,"life":_n_life_b5,"max":_n_life_b5,"col":(_S.call_value(_n_hex,[_n_col_b6]) if _S.truth(_n_col_b6) else 0),"size":_n_size_b7,"seed":(_S.invoke(_S.named_value(_this,"R"),"next",[]) * 100),"delay":_n_delay_b8,"flag":_n_flag_b9}])
	return null

static func _f11(_parent,_args:Array,_this=null):
	return _S.prop(_S.named_value(_this,"list"),"length")
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.set_prop(_S.read(_e, "this"), "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "R", _S.prop(_S.read(_e, "this"), "R"))
	_S.define(_e, "t", _S.prop(_S.read(_e, "this"), "t"))
	var _v25 = _S.scope(_e)
	_S.define(_v25, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v25, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v25, "i"), 0)):
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "p", _S.prop(_S.prop(_S.read(_v26, "this"), "list"), _S.read(_v26, "i")))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v26, "p"), "delay"), 0)):
			var _v27 = _S.scope(_v26)
			_S.set_prop(_S.read(_v27, "p"), "delay", _S.read(_v27, "dt"), "-=", false)
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v26, "p"), "life", _S.read(_v26, "dt"), "-=", false), 0)):
			var _v28 = _S.scope(_v26)
			if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_v28, "p"), "k"), _S.prop(_S.read(_v28, "P"), "FIRE")), func(): return _S.binary("&", _S.prop(_S.read(_v28, "p"), "flag"), _S.prop(_S.read(_v28, "PF"), "SMOKES")))):
				var _v29 = _S.scope(_v28)
				_S.define(_v29, "big", _S.binary("&", _S.prop(_S.read(_v29, "p"), "flag"), _S.prop(_S.read(_v29, "PF"), "BIG")))
				_S.invoke(_S.read(_v29, "this"), "spawn", [_S.prop(_S.read(_v29, "P"), "SMOKE"), _S.prop(_S.read(_v29, "p"), "x"), _S.prop(_S.read(_v29, "p"), "y"), _S.binary("*", _S.prop(_S.read(_v29, "p"), "vx"), 0.6), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v29, "p"), "vy"), 0.6), 6), (_S.invoke(_S.read(_v29, "R"), "range", [1.3, 2.3]) if _S.truth(_S.read(_v29, "big")) else _S.invoke(_S.read(_v29, "R"), "range", [0.8, 1.4])), 0, _S.binary("*", _S.prop(_S.read(_v29, "p"), "size"), (0.85 if _S.truth(_S.read(_v29, "big")) else 0.7)), 0, (_S.prop(_S.read(_v29, "PF"), "BIG") if _S.truth(_S.read(_v29, "big")) else 0)])
			_S.invoke(_S.prop(_S.read(_v28, "this"), "list"), "splice", [_S.read(_v28, "i"), 1])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "-=", true)
			continue
		var _v30 = _S.prop(_S.read(_v26, "p"), "k")
		var _v31 = false
		var _v32 = false
		while true:
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "FIRE")):
				_v31 = true
				_S.set_prop(_S.read(_v26, "p"), "vy", _S.binary("*", 95, _S.read(_v26, "dt")), "-=", false)
				_S.set_prop(_S.read(_v26, "p"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v26, "t"), 17), _S.prop(_S.read(_v26, "p"), "seed"))]), 30), _S.read(_v26, "dt")), "+=", false)
				_S.set_prop(_S.read(_v26, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vx"), 5), _S.read(_v26, "dt")), "-=", false)
				_S.set_prop(_S.read(_v26, "p"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vy"), 3.2), _S.read(_v26, "dt")), "-=", false)
				break
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "GRIT")):
				_v31 = true
				var _v33 = _S.scope(_v26)
				_S.set_prop(_S.read(_v33, "p"), "vy", _S.binary("*", _S.read(_v33, "GRAVITY"), _S.read(_v33, "dt")), "+=", false)
				_S.set_prop(_S.read(_v33, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v33, "p"), "vx"), 0.8), _S.read(_v33, "dt")), "-=", false)
				_S.define(_v33, "g", _S.invoke(_S.read(_v33, "this"), "ground", [_S.prop(_S.read(_v33, "p"), "x")]))
				_S.define(_v33, "ny", _S.binary("+", _S.prop(_S.read(_v33, "p"), "y"), _S.binary("*", _S.prop(_S.read(_v33, "p"), "vy"), _S.read(_v33, "dt"))))
				_S.set_prop(_S.read(_v33, "p"), "x", _S.binary("*", _S.prop(_S.read(_v33, "p"), "vx"), _S.read(_v33, "dt")), "+=", false)
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v33, "p"), "vy"), 0), func(): return _S.binary("<=", _S.prop(_S.read(_v33, "p"), "y"), _S.read(_v33, "g"))), func(): return _S.binary(">=", _S.read(_v33, "ny"), _S.read(_v33, "g")))):
					var _v34 = _S.scope(_v33)
					_S.set_prop(_S.read(_v34, "p"), "y", _S.binary("-", _S.read(_v34, "g"), 0.25), "=", false)
					if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v34, "p"), "vy"), 130), func(): return _S.invoke(_S.read(_v34, "R"), "chance", [0.4]))):
						_S.last([_S.set_prop(_S.read(_v34, "p"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v34, "p"), "vy")), 0.25), "=", false), _S.set_prop(_S.read(_v34, "p"), "vx", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v34, "p"), "vx"), 0.5), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 10), 10])), "=", false)])
					else:
						_S.last([_S.set_prop(_S.read(_v34, "p"), "vx", _S.set_prop(_S.read(_v34, "p"), "vy", 0, "=", false), "=", false), _S.set_prop(_S.read(_v34, "p"), "life", _S.invoke(_S.read(_v34, "Math"), "min", [_S.prop(_S.read(_v34, "p"), "life"), 0.5]), "=", false)])
				else:
					_S.set_prop(_S.read(_v33, "p"), "y", _S.read(_v33, "ny"), "=", false)
				_v32 = true
				break
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "BRAND")):
				_v31 = true
				var _v35 = _S.scope(_v26)
				_S.set_prop(_S.read(_v35, "p"), "vy", _S.binary("*", _S.binary("*", _S.read(_v35, "GRAVITY"), 0.8), _S.read(_v35, "dt")), "+=", false)
				_S.set_prop(_S.read(_v35, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v35, "p"), "vx"), 0.9), _S.read(_v35, "dt")), "-=", false)
				if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [_S.binary("*", 0.9, _S.invoke(_S.read(_v35, "Math"), "min", [1, _S.binary("*", _S.read(_v35, "dt"), 60)]))])):
					_S.invoke(_S.read(_v35, "this"), "spawn", [_S.prop(_S.read(_v35, "P"), "FIRE"), _S.prop(_S.read(_v35, "p"), "x"), _S.prop(_S.read(_v35, "p"), "y"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v35, "p"), "vx"), 0.1), _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 7), 7])), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v35, "p"), "vy"), 0.1), 10), _S.invoke(_S.read(_v35, "R"), "range", [0.16, 0.32]), 0, _S.binary("*", _S.invoke(_S.read(_v35, "R"), "range", [0.9, 1.7]), _S.binary("+", 0.5, _S.binary("*", _S.binary("/", _S.prop(_S.read(_v35, "p"), "life"), _S.prop(_S.read(_v35, "p"), "max")), 0.6))), 0, (_S.prop(_S.read(_v35, "PF"), "SMOKES") if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [0.4])) else 0)])
				_S.define(_v35, "g", _S.invoke(_S.read(_v35, "this"), "ground", [_S.prop(_S.read(_v35, "p"), "x")]))
				_S.define(_v35, "ny", _S.binary("+", _S.prop(_S.read(_v35, "p"), "y"), _S.binary("*", _S.prop(_S.read(_v35, "p"), "vy"), _S.read(_v35, "dt"))))
				_S.set_prop(_S.read(_v35, "p"), "x", _S.binary("*", _S.prop(_S.read(_v35, "p"), "vx"), _S.read(_v35, "dt")), "+=", false)
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v35, "p"), "vy"), 0), func(): return _S.binary("<=", _S.prop(_S.read(_v35, "p"), "y"), _S.read(_v35, "g"))), func(): return _S.binary(">=", _S.read(_v35, "ny"), _S.read(_v35, "g")))):
					var _v36 = _S.scope(_v35)
					_S.optional_call(_S.prop(_S.read(_v36, "this"), "onLand"), [_S.prop(_S.read(_v36, "p"), "x"), _S.read(_v36, "g")])
					_S.invoke(_S.prop(_S.read(_v36, "this"), "list"), "splice", [_S.read(_v36, "i"), 1])
				else:
					_S.set_prop(_S.read(_v35, "p"), "y", _S.read(_v35, "ny"), "=", false)
				_v32 = true
				break
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "SPARK")):
				_v31 = true
				var _v37 = _S.scope(_v26)
				_S.set_prop(_S.read(_v37, "p"), "vy", _S.binary("*", _S.binary("*", _S.read(_v37, "GRAVITY"), 0.45), _S.read(_v37, "dt")), "+=", false)
				_S.set_prop(_S.read(_v37, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v37, "p"), "vx"), 2.2), _S.read(_v37, "dt")), "-=", false)
				_S.set_prop(_S.read(_v37, "p"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v37, "p"), "vy"), 2.2), _S.read(_v37, "dt")), "-=", false)
				_S.define(_v37, "g", _S.invoke(_S.read(_v37, "this"), "ground", [_S.prop(_S.read(_v37, "p"), "x")]))
				_S.define(_v37, "ny", _S.binary("+", _S.prop(_S.read(_v37, "p"), "y"), _S.binary("*", _S.prop(_S.read(_v37, "p"), "vy"), _S.read(_v37, "dt"))))
				_S.set_prop(_S.read(_v37, "p"), "x", _S.binary("*", _S.prop(_S.read(_v37, "p"), "vx"), _S.read(_v37, "dt")), "+=", false)
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v37, "p"), "vy"), 0), func(): return _S.binary("<=", _S.prop(_S.read(_v37, "p"), "y"), _S.read(_v37, "g"))), func(): return _S.binary(">=", _S.read(_v37, "ny"), _S.read(_v37, "g")))):
					_S.last([_S.set_prop(_S.read(_v37, "p"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v37, "p"), "vy")), 0.45), "=", false), _S.set_prop(_S.read(_v37, "p"), "vx", 0.7, "*=", false), _S.set_prop(_S.read(_v37, "p"), "y", _S.binary("-", _S.read(_v37, "g"), 0.25), "=", false)])
				else:
					_S.set_prop(_S.read(_v37, "p"), "y", _S.read(_v37, "ny"), "=", false)
				_v32 = true
				break
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "STREAK")):
				_v31 = true
				_S.last([_S.set_prop(_S.read(_v26, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vx"), 3), _S.read(_v26, "dt")), "+=", false), _S.set_prop(_S.read(_v26, "p"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vy"), 3), _S.read(_v26, "dt")), "+=", false)])
				break
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "FLAKE")):
				_v31 = true
				_S.set_prop(_S.read(_v26, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vx"), 2.2), _S.read(_v26, "dt")), "-=", false)
				_S.set_prop(_S.read(_v26, "p"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vy"), 2.2), _S.read(_v26, "dt")), _S.binary("*", 35, _S.read(_v26, "dt"))), "-=", false)
				_S.set_prop(_S.read(_v26, "p"), "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v26, "this"), "t"), 2.5), _S.prop(_S.read(_v26, "p"), "seed"))]), 7), _S.read(_v26, "dt")), "+=", false)
				break
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "EMBER")):
				_v31 = true
				_S.set_prop(_S.read(_v26, "p"), "vy", _S.binary("*", _S.binary("+", _S.unary("-", 30), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v26, "t"), 3), _S.prop(_S.read(_v26, "p"), "seed"))]), 20)), _S.read(_v26, "dt")), "+=", false)
				_S.set_prop(_S.read(_v26, "p"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.binary("+", _S.binary("*", _S.read(_v26, "t"), 2.3), _S.prop(_S.read(_v26, "p"), "seed"))]), 45), _S.read(_v26, "dt")), "+=", false)
				_S.set_prop(_S.read(_v26, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vx"), 1.6), _S.read(_v26, "dt")), "-=", false)
				_S.set_prop(_S.read(_v26, "p"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vy"), 1.6), _S.read(_v26, "dt")), "-=", false)
				break
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "SMOKE")):
				_v31 = true
				var _v38 = _S.scope(_v26)
				_S.define(_v38, "big", _S.binary("&", _S.prop(_S.read(_v38, "p"), "flag"), _S.prop(_S.read(_v38, "PF"), "BIG")))
				_S.set_prop(_S.read(_v38, "p"), "vy", _S.binary("*", (23 if _S.truth(_S.read(_v38, "big")) else 16), _S.read(_v38, "dt")), "-=", false)
				_S.set_prop(_S.read(_v38, "p"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v38, "t"), 1.3), _S.prop(_S.read(_v38, "p"), "seed"))]), 8), _S.read(_v38, "dt")), "+=", false)
				_S.set_prop(_S.read(_v38, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v38, "p"), "vx"), 1.6), _S.read(_v38, "dt")), "-=", false)
				_S.set_prop(_S.read(_v38, "p"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v38, "p"), "vy"), 1.2), _S.read(_v38, "dt")), "-=", false)
				break
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "MOTE")):
				_v31 = true
				_S.set_prop(_S.read(_v26, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vx"), 0.6), _S.read(_v26, "dt")), "-=", false)
				_S.set_prop(_S.read(_v26, "p"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vy"), 0.6), _S.read(_v26, "dt")), "-=", false)
				break
			if _v31 or true:
				_v31 = true
				var _v39 = _S.scope(_v26)
				_S.define(_v39, "drag", (4 if _S.truth(_S.invoke(_S.read(_v39, "SOFT"), "has", [_S.prop(_S.read(_v39, "p"), "k")])) else 1.6))
				_S.set_prop(_S.read(_v39, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v39, "p"), "vx"), _S.read(_v39, "drag")), _S.read(_v39, "dt")), "-=", false)
				_S.set_prop(_S.read(_v39, "p"), "vy", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v39, "p"), "vy"), _S.read(_v39, "drag")), _S.read(_v39, "dt")), _S.binary("*", 5, _S.read(_v39, "dt"))), "-=", false)
			break
		if _v32:
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v26, "p"), "x", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vx"), _S.read(_v26, "dt")), "+=", false)
		_S.set_prop(_S.read(_v26, "p"), "y", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vy"), _S.read(_v26, "dt")), "+=", false)
		_v25 = _S.iteration(_v25)
		_S.write(_v25, "i", 1, "-=", true)
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "layer", _S.arg(_args, 1))
	for _v40 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v41 = _S.scope(_e)
		_S.define(_v41, "q", _v40)
		var _v42 = _S.scope(_v41)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v42, "q"), "delay"), 0)):
			continue
		if _S.truth(_S.logical("&&", _S.read(_v42, "layer"), func(): return _S.binary("!==", ("back" if _S.truth(_S.logical("||", _S.invoke(_S.read(_v42, "SOFT"), "has", [_S.prop(_S.read(_v42, "q"), "k")]), func(): return _S.binary("&", _S.prop(_S.read(_v42, "q"), "flag"), _S.prop(_S.read(_v42, "PF"), "BACK")))) else "front"), _S.read(_v42, "layer")))):
			continue
		_S.define(_v42, "k", _S.binary("/", _S.prop(_S.read(_v42, "q"), "life"), _S.prop(_S.read(_v42, "q"), "max")))
		_S.define(_v42, "x", _S.prop(_S.read(_v42, "q"), "x"))
		_S.define(_v42, "y", _S.prop(_S.read(_v42, "q"), "y"))
		_S.define(_v42, "sp", _S.logical("||", _S.invoke(_S.read(_v42, "Math"), "hypot", [_S.prop(_S.read(_v42, "q"), "vx"), _S.prop(_S.read(_v42, "q"), "vy")]), func(): return 1))
		_S.define(_v42, "ux", _S.binary("/", _S.prop(_S.read(_v42, "q"), "vx"), _S.read(_v42, "sp")))
		_S.define(_v42, "uy", _S.binary("/", _S.prop(_S.read(_v42, "q"), "vy"), _S.read(_v42, "sp")))
		var _v43 = _S.prop(_S.read(_v42, "q"), "k")
		var _v44 = false
		var _v45 = false
		while true:
			if _v44 or _S.binary("===", _v43, _S.prop(_S.read(_v42, "P"), "SPARK")):
				_v44 = true
				var _v46 = _S.scope(_v42)
				_S.define(_v46, "S", _S.prop(_S.read(_v46, "this"), "sparks"))
				_S.define(_v46, "head", (_S.prop(_S.read(_v46, "S"), 0) if _S.truth(_S.binary(">", _S.read(_v46, "k"), 0.6)) else (_S.prop(_S.read(_v46, "S"), 1) if _S.truth(_S.binary(">", _S.read(_v46, "k"), 0.3)) else _S.prop(_S.read(_v46, "S"), 2))))
				_S.define(_v46, "len", _S.invoke(_S.read(_v46, "Math"), "min", [9, _S.binary("+", 1, _S.binary("*", _S.read(_v46, "sp"), 0.022))]))
				_S.invoke(_S.read(_v46, "p"), "line", [_S.binary("-", _S.read(_v46, "x"), _S.binary("*", _S.read(_v46, "ux"), _S.read(_v46, "len"))), _S.binary("-", _S.read(_v46, "y"), _S.binary("*", _S.read(_v46, "uy"), _S.read(_v46, "len"))), _S.binary("-", _S.read(_v46, "x"), _S.binary("*", _S.binary("*", _S.read(_v46, "ux"), _S.read(_v46, "len")), 0.4)), _S.binary("-", _S.read(_v46, "y"), _S.binary("*", _S.binary("*", _S.read(_v46, "uy"), _S.read(_v46, "len")), 0.4)), (_S.read(_v46, "head") if _S.truth(_S.binary(">", _S.read(_v46, "k"), 0.5)) else _S.prop(_S.read(_v46, "S"), _S.binary("-", _S.prop(_S.read(_v46, "S"), "length"), 1)))])
				_S.invoke(_S.read(_v46, "p"), "line", [_S.binary("-", _S.read(_v46, "x"), _S.binary("*", _S.binary("*", _S.read(_v46, "ux"), _S.read(_v46, "len")), 0.45)), _S.binary("-", _S.read(_v46, "y"), _S.binary("*", _S.binary("*", _S.read(_v46, "uy"), _S.read(_v46, "len")), 0.45)), _S.read(_v46, "x"), _S.read(_v46, "y"), _S.read(_v46, "head")])
				_S.invoke(_S.read(_v46, "p"), "glow", [_S.read(_v46, "x"), _S.read(_v46, "y"), 3, _S.read(_v46, "head"), _S.binary("*", 0.45, _S.read(_v46, "k"))])
				break
			if _v44 or _S.binary("===", _v43, _S.prop(_S.read(_v42, "P"), "MOTE")):
				_v44 = true
				var _v47 = _S.scope(_v42)
				_S.define(_v47, "len", _S.binary("*", _S.invoke(_S.read(_v47, "Math"), "min", [16, _S.binary("+", 0.5, _S.binary("*", _S.read(_v47, "sp"), 0.026))]), _S.prop(_S.read(_v47, "q"), "size")))
				_S.define(_v47, "a", (_S.binary("/", _S.read(_v47, "k"), 0.35) if _S.truth(_S.binary("<", _S.read(_v47, "k"), 0.35)) else 1))
				_S.invoke(_S.read(_v47, "p"), "line", [_S.binary("-", _S.read(_v47, "x"), _S.binary("*", _S.read(_v47, "ux"), _S.read(_v47, "len"))), _S.binary("-", _S.read(_v47, "y"), _S.binary("*", _S.read(_v47, "uy"), _S.read(_v47, "len"))), _S.binary("-", _S.read(_v47, "x"), _S.binary("*", _S.binary("*", _S.read(_v47, "ux"), _S.read(_v47, "len")), 0.35)), _S.binary("-", _S.read(_v47, "y"), _S.binary("*", _S.binary("*", _S.read(_v47, "uy"), _S.read(_v47, "len")), 0.35)), _S.call_value(_S.read(_v47, "scale"), [_S.prop(_S.read(_v47, "q"), "col"), 0.55]), _S.read(_v47, "a")])
				_S.invoke(_S.read(_v47, "p"), "line", [_S.binary("-", _S.read(_v47, "x"), _S.binary("*", _S.binary("*", _S.read(_v47, "ux"), _S.read(_v47, "len")), 0.4)), _S.binary("-", _S.read(_v47, "y"), _S.binary("*", _S.binary("*", _S.read(_v47, "uy"), _S.read(_v47, "len")), 0.4)), _S.read(_v47, "x"), _S.read(_v47, "y"), _S.prop(_S.read(_v47, "q"), "col"), _S.read(_v47, "a")])
				_S.invoke(_S.read(_v47, "p"), "glow", [_S.read(_v47, "x"), _S.read(_v47, "y"), _S.binary("+", 2.5, _S.prop(_S.read(_v47, "q"), "size")), _S.prop(_S.read(_v47, "q"), "col"), _S.binary("*", 0.4, _S.read(_v47, "k"))])
				break
			if _v44 or _S.binary("===", _v43, _S.prop(_S.read(_v42, "P"), "STREAK")):
				_v44 = true
				var _v48 = _S.scope(_v42)
				_S.define(_v48, "L", _S.call_value(_S.read(_v48, "clamp"), [_S.binary("/", _S.read(_v48, "sp"), 30), 1, 7]))
				var _v49 = _S.scope(_v48)
				_S.define(_v49, "d", _S.read(_v49, "L"))
				while _S.truth(_S.binary(">=", _S.read(_v49, "d"), 0)):
					_S.invoke(_S.read(_v49, "p"), "dot", [_S.binary("-", _S.read(_v49, "x"), _S.binary("*", _S.read(_v49, "ux"), _S.read(_v49, "d"))), _S.binary("-", _S.read(_v49, "y"), _S.binary("*", _S.read(_v49, "uy"), _S.read(_v49, "d"))), (_S.read(_v49, "WHITE") if _S.truth(_S.binary("<", _S.read(_v49, "d"), 1)) else (_S.prop(_S.read(_v49, "q"), "col") if _S.truth(_S.binary("<", _S.read(_v49, "d"), _S.binary("*", _S.read(_v49, "L"), 0.5))) else _S.call_value(_S.read(_v49, "scale"), [_S.prop(_S.read(_v49, "q"), "col"), 0.6]))), (1 if _S.truth(_S.binary("<", _S.read(_v49, "d"), _S.binary("*", _S.read(_v49, "L"), 0.5))) else _S.binary("-", 1.2, _S.binary("/", _S.read(_v49, "d"), _S.read(_v49, "L"))))])
					_v49 = _S.iteration(_v49)
					_S.write(_v49, "d", 0.5, "-=", false)
				_S.invoke(_S.read(_v48, "p"), "glow", [_S.read(_v48, "x"), _S.read(_v48, "y"), 4, _S.prop(_S.read(_v48, "q"), "col"), 0.4])
				break
			if _v44 or _S.binary("===", _v43, _S.prop(_S.read(_v42, "P"), "FLAKE")):
				_v44 = true
				var _v50 = _S.scope(_v42)
				_S.define(_v50, "a", _S.invoke(_S.read(_v50, "Math"), "min", [1, _S.binary("*", _S.read(_v50, "k"), 3)]))
				_S.invoke(_S.read(_v50, "p"), "dot", [_S.read(_v50, "x"), _S.read(_v50, "y"), _S.prop(_S.read(_v50, "q"), "col"), _S.read(_v50, "a")])
				if _S.truth(_S.binary(">", _S.prop(_S.read(_v50, "q"), "size"), 1.3)):
					for _v51 in _S.array(_S.read(_v50, "CROSS")):
						var _v52 = _S.scope(_v50)
						var _v53 = _v51
						_S.define(_v52, "dx", _S.prop(_v53, 0))
						_S.define(_v52, "dy", _S.prop(_v53, 1))
						_S.invoke(_S.read(_v52, "p"), "dot", [_S.binary("+", _S.read(_v52, "x"), _S.read(_v52, "dx")), _S.binary("+", _S.read(_v52, "y"), _S.read(_v52, "dy")), _S.call_value(_S.read(_v52, "scale"), [_S.prop(_S.read(_v52, "q"), "col"), 0.8]), _S.binary("*", _S.read(_v52, "a"), 0.8)])
				break
			if _v44 or _S.binary("===", _v43, _S.prop(_S.read(_v42, "P"), "VAPOUR")):
				_v44 = true
				var _v54 = _S.scope(_v42)
				_S.define(_v54, "r", _S.binary("*", _S.prop(_S.read(_v54, "q"), "size"), _S.binary("+", 0.6, _S.binary("*", _S.binary("-", 1, _S.read(_v54, "k")), 0.9))))
				_S.invoke(_S.read(_v54, "p"), "disc", [_S.read(_v54, "x"), _S.read(_v54, "y"), _S.read(_v54, "r"), _S.prop(_S.read(_v54, "q"), "col"), _S.binary("*", _S.invoke(_S.read(_v54, "Math"), "pow", [_S.read(_v54, "k"), 1.3]), 0.45)])
				if _S.truth(_S.prop(_S.read(_v54, "this"), "haze")):
					_S.invoke(_S.read(_v54, "p"), "glow", [_S.read(_v54, "x"), _S.read(_v54, "y"), _S.binary("*", _S.read(_v54, "r"), 1.8), _S.prop(_S.read(_v54, "this"), "haze"), _S.binary("*", 0.16, _S.read(_v54, "k"))])
				break
			if _v44 or _S.binary("===", _v43, _S.prop(_S.read(_v42, "P"), "DUST")):
				_v44 = true
				_S.invoke(_S.read(_v42, "p"), "disc", [_S.read(_v42, "x"), _S.read(_v42, "y"), _S.binary("*", _S.prop(_S.read(_v42, "q"), "size"), _S.binary("+", 0.6, _S.binary("*", _S.binary("-", 1, _S.read(_v42, "k")), 0.9))), _S.prop(_S.read(_v42, "q"), "col"), _S.binary("*", _S.invoke(_S.read(_v42, "Math"), "pow", [_S.read(_v42, "k"), 1.3]), 0.7)])
				break
			if _v44 or _S.binary("===", _v43, _S.prop(_S.read(_v42, "P"), "SMOKE")):
				_v44 = true
				var _v55 = _S.scope(_v42)
				_S.define(_v55, "age", _S.binary("-", 1, _S.read(_v55, "k")))
				_S.define(_v55, "big", _S.binary("&", _S.prop(_S.read(_v55, "q"), "flag"), _S.prop(_S.read(_v55, "PF"), "BIG")))
				_S.define(_v55, "r", _S.binary("*", _S.prop(_S.read(_v55, "q"), "size"), _S.binary("+", _S.binary("+", 0.65, _S.binary("*", _S.invoke(_S.read(_v55, "Math"), "min", [1, _S.binary("*", _S.read(_v55, "age"), 2.5)]), 0.45)), _S.binary("*", _S.read(_v55, "age"), (0.5 if _S.truth(_S.read(_v55, "big")) else 0.4)))))
				_S.define(_v55, "a", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v55, "Math"), "min", [1, _S.binary("*", _S.read(_v55, "age"), 12)]), _S.invoke(_S.read(_v55, "Math"), "min", [1, _S.binary("*", _S.read(_v55, "k"), 2.4)])), (0.7 if _S.truth(_S.read(_v55, "big")) else 0.58)))
				_S.define(_v55, "c", (_S.call_value(_S.read(_v55, "mix"), [_S.prop(_S.read(_v55, "q"), "col"), _S.call_value(_S.read(_v55, "rampAt"), [_S.read(_v55, "SMOKE_RAMP"), _S.read(_v55, "age")]), _S.read(_v55, "age")]) if _S.truth(_S.prop(_S.read(_v55, "q"), "col")) else _S.call_value(_S.read(_v55, "rampAt"), [_S.read(_v55, "SMOKE_RAMP"), _S.binary("*", _S.read(_v55, "age"), 1.05)])))
				_S.invoke(_S.read(_v55, "p"), "disc", [_S.read(_v55, "x"), _S.read(_v55, "y"), _S.read(_v55, "r"), _S.read(_v55, "c"), _S.binary("*", _S.read(_v55, "a"), 0.45)])
				_S.invoke(_S.read(_v55, "p"), "disc", [_S.binary("+", _S.read(_v55, "x"), _S.binary("*", _S.read(_v55, "r"), 0.05)), _S.binary("+", _S.read(_v55, "y"), _S.binary("*", _S.read(_v55, "r"), 0.06)), _S.binary("*", _S.read(_v55, "r"), 0.74), _S.read(_v55, "c"), _S.binary("*", _S.read(_v55, "a"), 0.62)])
				if _S.truth(_S.binary("<", _S.read(_v55, "age"), 0.5)):
					_S.invoke(_S.read(_v55, "p"), "disc", [_S.binary("-", _S.read(_v55, "x"), _S.binary("*", _S.read(_v55, "r"), 0.22)), _S.binary("-", _S.read(_v55, "y"), _S.binary("*", _S.read(_v55, "r"), 0.3)), _S.binary("*", _S.read(_v55, "r"), 0.5), _S.call_value(_S.read(_v55, "mix"), [_S.read(_v55, "c"), _S.read(_v55, "WHITE"), 0.12]), _S.binary("*", _S.binary("*", _S.read(_v55, "a"), 0.4), _S.binary("-", 1, _S.binary("*", _S.read(_v55, "age"), 2)))])
				break
			if _v44 or _S.binary("===", _v43, _S.prop(_S.read(_v42, "P"), "FIRE")):
				_v44 = true
				var _v56 = _S.scope(_v42)
				_S.define(_v56, "age", _S.binary("-", 1, _S.read(_v56, "k")))
				_S.define(_v56, "heat", _S.invoke(_S.read(_v56, "Math"), "min", [0.999, _S.binary("+", _S.invoke(_S.read(_v56, "Math"), "pow", [_S.read(_v56, "age"), 0.62]), _S.binary("*", _S.binary("%", _S.prop(_S.read(_v56, "q"), "seed"), 1), 0.1))]))
				_S.define(_v56, "F", _S.read(_v56, "FIRE_RAMP"))
				_S.define(_v56, "n", _S.prop(_S.read(_v56, "F"), "length"))
				_S.define(_v56, "idx", _S.invoke(_S.read(_v56, "Math"), "min", [_S.binary("-", _S.read(_v56, "n"), 2), _S.invoke(_S.read(_v56, "Math"), "floor", [_S.binary("*", _S.read(_v56, "heat"), _S.binary("-", _S.read(_v56, "n"), 1))])]))
				_S.define(_v56, "r", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v56, "q"), "size"), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.invoke(_S.read(_v56, "Math"), "min", [1, _S.binary("*", _S.read(_v56, "age"), 7)])))), _S.binary("-", 1, _S.binary("*", _S.read(_v56, "age"), 0.55))))
				_S.define(_v56, "c", _S.prop(_S.read(_v56, "F"), _S.read(_v56, "idx")))
				if _S.truth(_S.binary(">=", _S.read(_v56, "idx"), _S.binary("-", _S.read(_v56, "n"), 2))):
					_S.invoke(_S.read(_v56, "p"), "disc", [_S.read(_v56, "x"), _S.read(_v56, "y"), _S.read(_v56, "r"), _S.read(_v56, "c"), _S.binary("*", _S.invoke(_S.read(_v56, "Math"), "min", [1, _S.binary("*", _S.read(_v56, "k"), 3)]), 0.85)])
				else:
					var _v57 = _S.scope(_v56)
					_S.invoke(_S.read(_v57, "p"), "circle", [_S.read(_v57, "x"), _S.read(_v57, "y"), _S.read(_v57, "r"), _S.prop(_S.read(_v57, "F"), _S.invoke(_S.read(_v57, "Math"), "min", [_S.binary("-", _S.read(_v57, "n"), 1), _S.binary("+", _S.read(_v57, "idx"), 2)]))])
					_S.invoke(_S.read(_v57, "p"), "circle", [_S.binary("-", _S.read(_v57, "x"), _S.binary("*", _S.read(_v57, "r"), 0.16)), _S.binary("-", _S.read(_v57, "y"), _S.binary("*", _S.read(_v57, "r"), 0.22)), _S.binary("*", _S.read(_v57, "r"), 0.78), _S.read(_v57, "c")])
					if _S.truth(_S.binary(">", _S.read(_v57, "r"), 1.6)):
						_S.invoke(_S.read(_v57, "p"), "circle", [_S.read(_v57, "x"), _S.binary("-", _S.read(_v57, "y"), _S.binary("*", _S.read(_v57, "r"), 0.9)), _S.binary("*", _S.read(_v57, "r"), 0.42), _S.read(_v57, "c")])
					if _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_v57, "idx"), 3), func(): return _S.binary(">", _S.read(_v57, "r"), 1.8))):
						_S.invoke(_S.read(_v57, "p"), "circle", [_S.binary("-", _S.read(_v57, "x"), _S.binary("*", _S.read(_v57, "r"), 0.28)), _S.binary("-", _S.read(_v57, "y"), _S.binary("*", _S.read(_v57, "r"), 0.34)), _S.binary("*", _S.read(_v57, "r"), 0.36), _S.prop(_S.read(_v57, "F"), _S.invoke(_S.read(_v57, "Math"), "max", [0, _S.binary("-", _S.read(_v57, "idx"), 1)]))])
					if _S.truth(_S.binary("<", _S.read(_v57, "idx"), 6)):
						_S.invoke(_S.read(_v57, "p"), "glow", [_S.read(_v57, "x"), _S.read(_v57, "y"), _S.binary("+", _S.binary("*", _S.read(_v57, "r"), 2.4), 2), _S.read(_v57, "c"), _S.binary("*", 0.18, _S.read(_v57, "k"))])
				break
			if _v44 or _S.binary("===", _v43, _S.prop(_S.read(_v42, "P"), "BRAND")):
				_v44 = true
				_S.invoke(_S.read(_v42, "p"), "circle", [_S.read(_v42, "x"), _S.read(_v42, "y"), 1.6, _S.prop(_S.read(_v42, "HOT"), 3)])
				_S.invoke(_S.read(_v42, "p"), "px", [_S.read(_v42, "x"), _S.read(_v42, "y"), (_S.prop(_S.read(_v42, "HOT"), 0) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v42, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v42, "this"), "t"), 40), _S.prop(_S.read(_v42, "q"), "seed"))]), 0)) else _S.prop(_S.read(_v42, "HOT"), 1))])
				_S.invoke(_S.read(_v42, "p"), "px", [_S.binary("+", _S.read(_v42, "x"), 1), _S.read(_v42, "y"), _S.prop(_S.read(_v42, "HOT"), 1)])
				_S.invoke(_S.read(_v42, "p"), "glow", [_S.read(_v42, "x"), _S.read(_v42, "y"), 7, _S.prop(_S.read(_v42, "HOT"), 2), 0.45])
				break
			if _v44 or _S.binary("===", _v43, _S.prop(_S.read(_v42, "P"), "GRIT")):
				_v44 = true
				if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v42, "k"), 0.25), func(): return _S.binary(">", _S.binary("*", _S.read(_v42, "k"), 4), 0.5))):
					var _v58 = _S.scope(_v42)
					_S.invoke(_S.read(_v58, "p"), "px", [_S.read(_v58, "x"), _S.read(_v58, "y"), _S.prop(_S.read(_v58, "q"), "col")])
					if _S.truth(_S.binary(">=", _S.prop(_S.read(_v58, "q"), "size"), 2)):
						_S.last([_S.invoke(_S.read(_v58, "p"), "px", [_S.binary("+", _S.read(_v58, "x"), 1), _S.read(_v58, "y"), _S.prop(_S.read(_v58, "q"), "col")]), _S.invoke(_S.read(_v58, "p"), "px", [_S.read(_v58, "x"), _S.binary("+", _S.read(_v58, "y"), 1), _S.call_value(_S.read(_v58, "scale"), [_S.prop(_S.read(_v58, "q"), "col"), 0.8])]), _S.invoke(_S.read(_v58, "p"), "px", [_S.binary("+", _S.read(_v58, "x"), 1), _S.binary("+", _S.read(_v58, "y"), 1), _S.call_value(_S.read(_v58, "scale"), [_S.prop(_S.read(_v58, "q"), "col"), 0.7])])])
				break
			if _v44 or _S.binary("===", _v43, _S.prop(_S.read(_v42, "P"), "EMBER")):
				_v44 = true
				var _v59 = _S.scope(_v42)
				_S.define(_v59, "c", (_S.prop(_S.prop(_S.read(_v59, "this"), "sparks"), 0) if _S.truth(_S.binary(">", _S.read(_v59, "k"), 0.6)) else (_S.prop(_S.prop(_S.read(_v59, "this"), "sparks"), 1) if _S.truth(_S.binary(">", _S.read(_v59, "k"), 0.3)) else _S.prop(_S.prop(_S.read(_v59, "this"), "sparks"), 2))))
				if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v59, "k"), 0.25), func(): return _S.binary("<", _S.invoke(_S.read(_v59, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v59, "this"), "t"), 40), _S.prop(_S.read(_v59, "q"), "seed"))]), 0))):
					break
				_S.invoke(_S.read(_v59, "p"), "px", [_S.read(_v59, "x"), _S.read(_v59, "y"), _S.read(_v59, "c")])
				if _S.truth(_S.binary(">", _S.prop(_S.read(_v59, "q"), "size"), 1.5)):
					_S.invoke(_S.read(_v59, "p"), "px", [_S.read(_v59, "x"), _S.binary("+", _S.read(_v59, "y"), 1), _S.prop(_S.prop(_S.read(_v59, "this"), "sparks"), _S.binary("-", _S.prop(_S.prop(_S.read(_v59, "this"), "sparks"), "length"), 1))])
				_S.invoke(_S.read(_v59, "p"), "glow", [_S.read(_v59, "x"), _S.read(_v59, "y"), _S.binary("+", 3, _S.prop(_S.read(_v59, "q"), "size")), _S.read(_v59, "c"), _S.binary("*", 0.35, _S.read(_v59, "k"))])
				break
			if _v44 or true:
				_v44 = true
				var _v60 = _S.scope(_v42)
				_S.define(_v60, "tw", _S.binary("+", 0.6, _S.binary("*", 0.4, _S.invoke(_S.read(_v60, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v60, "this"), "t"), _S.binary("+", 8, _S.binary("%", _S.prop(_S.read(_v60, "q"), "seed"), 5))), _S.prop(_S.read(_v60, "q"), "seed"))]))))
				if _S.truth(_S.binary("<", _S.prop(_S.read(_v60, "q"), "size"), 1)):
					var _v61 = _S.scope(_v60)
					if _S.truth(_S.binary(">", _S.binary("*", _S.read(_v61, "tw"), _S.read(_v61, "k")), 0.25)):
						_S.invoke(_S.read(_v61, "p"), "px", [_S.read(_v61, "x"), _S.read(_v61, "y"), (_S.read(_v61, "WHITE") if _S.truth(_S.binary(">", _S.read(_v61, "tw"), 0.8)) else _S.prop(_S.read(_v61, "q"), "col"))])
					_S.invoke(_S.read(_v61, "p"), "glow", [_S.read(_v61, "x"), _S.read(_v61, "y"), 3, _S.prop(_S.read(_v61, "q"), "col"), _S.binary("*", _S.binary("*", 0.4, _S.read(_v61, "k")), _S.read(_v61, "tw"))])
					break
				_S.call_value(_S.read(_v60, "sparkle"), [_S.read(_v60, "p"), _S.read(_v60, "x"), _S.read(_v60, "y"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v60, "q"), "size"), _S.read(_v60, "tw")), _S.invoke(_S.read(_v60, "Math"), "min", [1, _S.binary("*", _S.read(_v60, "k"), 3)])), _S.prop(_S.read(_v60, "q"), "col"), _S.call_value(_S.read(_v60, "scale"), [_S.prop(_S.read(_v60, "q"), "col"), 0.75]), _S.binary("*", _S.binary("*", 0.5, _S.read(_v60, "k")), _S.read(_v60, "tw"))])
			break
		if _v45:
			continue
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_ps_b0 = _S.arg(_args,0)
	_S.set_prop(_this,"ps",_n_ps_b0,"=")
	_S.set_prop(_this,"list",[],"=")
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_life_b2 = _S.arg(_args,2)
	var _n_power_b3 = _S.arg(_args,3)
	_S.invoke(_S.named_value(_this,"list"),"push",[{"x":_n_x_b0,"y":_n_y_b1,"life":_n_life_b2,"max":_n_life_b2,"acc":_S.invoke(_S.named_value(_S.named_value(_this,"ps"),"R"),"next",[]),"power":_n_power_b3}])
	return null

static func _f16(_parent,_args:Array,_this=null):
	return _S.prop(_S.named_value(_this,"list"),"length")
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.define(_e, "ps", _S.prop(_S.read(_e, "this"), "ps"))
	_S.define(_e, "R", _S.prop(_S.read(_e, "ps"), "R"))
	var _v62 = _S.scope(_e)
	_S.define(_v62, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v62, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v62, "i"), 0)):
		var _v63 = _S.scope(_v62)
		_S.define(_v63, "b", _S.prop(_S.prop(_S.read(_v63, "this"), "list"), _S.read(_v63, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v63, "b"), "life", _S.read(_v63, "dt"), "-=", false), 0)):
			var _v64 = _S.scope(_v63)
			_S.invoke(_S.prop(_S.read(_v64, "this"), "list"), "splice", [_S.read(_v64, "i"), 1])
			_v62 = _S.iteration(_v62)
			_S.write(_v62, "i", 1, "-=", true)
			continue
		_S.define(_v63, "k", _S.binary("/", _S.prop(_S.read(_v63, "b"), "life"), _S.prop(_S.read(_v63, "b"), "max")))
		_S.define(_v63, "intensity", _S.binary("*", _S.prop(_S.read(_v63, "b"), "power"), (1 if _S.truth(_S.binary(">", _S.read(_v63, "k"), 0.7)) else _S.binary("+", 0.35, _S.binary("*", _S.binary("/", _S.read(_v63, "k"), 0.7), 0.65)))))
		var _v65 = _S.scope(_v63)
		_S.set_prop(_S.read(_v65, "b"), "acc", _S.binary("*", _S.read(_v65, "dt"), _S.binary("+", 6, _S.binary("*", 16, _S.read(_v65, "intensity")))), "+=", false)
		while _S.truth(_S.binary(">", _S.prop(_S.read(_v65, "b"), "acc"), 1)):
			var _v66 = _S.scope(_v65)
			_S.define(_v66, "s", _S.binary("*", _S.invoke(_S.read(_v66, "R"), "range", [1.2, 2.8]), _S.read(_v66, "intensity")))
			_S.invoke(_S.read(_v66, "ps"), "spawn", [_S.prop(_S.read(_v66, "P"), "FIRE"), _S.binary("+", _S.prop(_S.read(_v66, "b"), "x"), _S.invoke(_S.read(_v66, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.binary("-", _S.prop(_S.read(_v66, "b"), "y"), _S.binary("*", _S.read(_v66, "s"), 0.6)), _S.invoke(_S.read(_v66, "R"), "range", [_S.unary("-", 6), 6]), _S.invoke(_S.read(_v66, "R"), "range", [_S.unary("-", 30), _S.unary("-", 12)]), _S.invoke(_S.read(_v66, "R"), "range", [0.28, 0.6]), 0, _S.read(_v66, "s"), 0, _S.binary("|", _S.prop(_S.read(_v66, "PF"), "BACK"), (_S.prop(_S.read(_v66, "PF"), "SMOKES") if _S.truth(_S.invoke(_S.read(_v66, "R"), "chance", [0.3])) else 0))])
			if _S.truth(_S.invoke(_S.read(_v66, "R"), "chance", [0.06])):
				_S.invoke(_S.read(_v66, "ps"), "spawn", [_S.prop(_S.read(_v66, "P"), "EMBER"), _S.prop(_S.read(_v66, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v66, "b"), "y"), 1.5), _S.invoke(_S.read(_v66, "R"), "range", [_S.unary("-", 15), 15]), _S.invoke(_S.read(_v66, "R"), "range", [_S.unary("-", 45), _S.unary("-", 15)]), _S.invoke(_S.read(_v66, "R"), "range", [0.6, 1.4]), _S.prop(_S.read(_v66, "HOT"), 2), 1, 0, _S.prop(_S.read(_v66, "PF"), "BACK")])
			_v65 = _S.iteration(_v65)
			_S.set_prop(_S.read(_v65, "b"), "acc", 1, "-=", true)
		_v62 = _S.iteration(_v62)
		_S.write(_v62, "i", 1, "-=", true)
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_HOT = _S.read(_parent,"HOT")
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_S.named_value(_this,"list")):
		var _n_b_b1 = _iter_0
		var _n_k_b2 = (float(_S.named_value(_n_b_b1,"life"))/_S.named_value(_n_b_b1,"max"))
		_S.invoke(_n_p_b0,"px",[_S.named_value(_n_b_b1,"x"), _S.named_value(_n_b_b1,"y"), ((_S.index_value(_n_HOT,1) if _S.truth((sin(((_S.named_value(_n_b_b1,"life") * 31) + _S.named_value(_n_b_b1,"x"))) > 0)) else _S.index_value(_n_HOT,2)) if _S.truth((_n_k_b2 > 0.4)) else _S.index_value(_n_HOT,3))])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_b_b1,"x"), _S.named_value(_n_b_b1,"y"), (6 + ((5 * _n_k_b2) * _S.named_value(_n_b_b1,"power"))), _S.index_value(_n_HOT,2), ((0.3 * _n_k_b2) * _S.named_value(_n_b_b1,"power"))])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_opts_b0 = _S.coalesce(_S.arg(_args,0),func():return {})
	_S.set_prop(_this,"list",[],"=")
	_S.set_prop(_this,"ground",(_S.named_value(_n_opts_b0,"ground") if _S.named_value(_n_opts_b0,"ground")!=null else _S.function_value(_S.capture(_parent,{"this":_this}),"_f20")),"=")
	return null

static func _f20(_parent,_args:Array,_this=null):
	return INF
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "b", _S.arg(_args, 0))
	_S.define(_e, "life", _S.logical("??", _S.prop(_S.read(_e, "b"), "life"), func(): return 1))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"kind": _S.prop(_S.read(_e, "B"), "SHARD")}, {"vx": 0}, {"vy": 0}, {"a": 0}, {"va": 0}, {"s": 1}, {"c": _S.read(_e, "WHITE")}, {"g": 1}, {"drag": 0}, {"bounce": 0}, {"rest": false}, _S.read(_e, "b"), {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}])])
	return null

static func _f22(_parent,_args:Array,_this=null):
	return _S.prop(_S.named_value(_this,"list"),"length")
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_GRAVITY = _S.read(_parent,"GRAVITY")
	var _n_B = _S.read(_parent,"B")
	var _n_dt_b0 = _S.arg(_args,0)
	if true:
		var _n_i_b1 = (_S.prop(_S.named_value(_this,"list"),"length") - 1)
		while _S.truth((_n_i_b1 >= 0)):
			var _n_b_b2 = _S.index_value(_S.named_value(_this,"list"),_n_i_b1)
			if _S.truth((_S.set_prop(_n_b_b2,"life",_n_dt_b0,"-=") <= 0)):
				_S.invoke(_S.named_value(_this,"list"),"splice",[_n_i_b1, 1])
				_n_i_b1 -= 1.0
				continue
			if _S.truth(_S.named_value(_n_b_b2,"rest")):
				_n_i_b1 -= 1.0
				continue
			_S.set_prop(_n_b_b2,"vy",((_n_GRAVITY * _S.named_value(_n_b_b2,"g")) * _n_dt_b0),"+=")
			_S.set_prop(_n_b_b2,"vx",((_S.named_value(_n_b_b2,"vx") * _S.named_value(_n_b_b2,"drag")) * _n_dt_b0),"-=")
			_S.set_prop(_n_b_b2,"vy",((_S.named_value(_n_b_b2,"vy") * _S.named_value(_n_b_b2,"drag")) * _n_dt_b0),"-=")
			_S.set_prop(_n_b_b2,"x",(_S.named_value(_n_b_b2,"vx") * _n_dt_b0),"+=")
			_S.set_prop(_n_b_b2,"y",(_S.named_value(_n_b_b2,"vy") * _n_dt_b0),"+=")
			_S.set_prop(_n_b_b2,"a",(_S.named_value(_n_b_b2,"va") * _n_dt_b0),"+=")
			var _n_floor_b3 = _S.invoke(_this,"ground",[_S.named_value(_n_b_b2,"x")])
			var _n_sp_b4 = _S.named_value(_n_b_b2,"vy")
			if _S.truth((((_S.named_value(_n_b_b2,"g") <= 0) if _S.truth((_S.named_value(_n_b_b2,"g") <= 0)) else (_S.named_value(_n_b_b2,"y") < _n_floor_b3)) if _S.truth(((_S.named_value(_n_b_b2,"g") <= 0) if _S.truth((_S.named_value(_n_b_b2,"g") <= 0)) else (_S.named_value(_n_b_b2,"y") < _n_floor_b3))) else (_n_sp_b4 <= 0))):
				_n_i_b1 -= 1.0
				continue
			_S.set_prop(_n_b_b2,"y",(_n_floor_b3 - 0.01),"=")
			if _S.truth(_S.binary("===",_S.named_value(_n_b_b2,"kind"),_S.named_value(_n_B,"DRIP"))):
				_S.set_prop(_n_b_b2,"life",0,"=")
			else:
				if _S.truth(((_n_sp_b4 > 70) if _S.truth((_S.named_value(_n_b_b2,"bounce") > 0)) else (_S.named_value(_n_b_b2,"bounce") > 0))):
					_S.set_prop(_n_b_b2,"vy",((-_n_sp_b4) * _S.named_value(_n_b_b2,"bounce")),"=")
					_S.set_prop(_n_b_b2,"vx",0.7,"*=")
					_S.set_prop(_n_b_b2,"va",0.6,"*=")
				else:
					_S.set_prop(_n_b_b2,"rest",true,"=")
					_S.set_prop(_n_b_b2,"vx",_S.set_prop(_n_b_b2,"vy",0,"="),"=")
			_n_i_b1 -= 1.0
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_B = _S.read(_parent,"B")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_hex = _S.read(_parent,"hex")
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_S.named_value(_this,"list")):
		var _n_b_b1 = _iter_0
		var _n_a_b2 = minf(1,(float(_S.named_value(_n_b_b1,"life"))/0.4))
		var _n_ca_b3 = cos(_S.named_value(_n_b_b1,"a"))
		var _n_sa_b4 = sin(_S.named_value(_n_b_b1,"a"))
		if _S.truth(_S.binary("===",_S.named_value(_n_b_b1,"kind"),_S.named_value(_n_B,"SHARD"))):
			if true:
				var _n_d_b5 = (float((-_S.named_value(_n_b_b1,"s")))/2)
				while _S.truth((_n_d_b5 <= (float(_S.named_value(_n_b_b1,"s"))/2))):
					_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_b_b1,"x") + (_n_ca_b3 * _n_d_b5)), (_S.named_value(_n_b_b1,"y") + (_n_sa_b4 * _n_d_b5)), (_n_WHITE if _S.truth((_n_d_b5 > ((float(_S.named_value(_n_b_b1,"s"))/2) - 0.6))) else _S.call_value(_n_hex,[_S.named_value(_n_b_b1,"c")])), _n_a_b2])
					_n_d_b5 += 0.5
		else:
			if _S.truth(_S.binary("===",_S.named_value(_n_b_b1,"kind"),_S.named_value(_n_B,"DRIP"))):
				_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_b_b1,"x"), _S.named_value(_n_b_b1,"y"), _S.call_value(_n_hex,[_S.named_value(_n_b_b1,"c")]), _n_a_b2])
				_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_b_b1,"x"), (_S.named_value(_n_b_b1,"y") - 1), _S.call_value(_n_hex,[_S.named_value(_n_b_b1,"c")]), (_n_a_b2 * 0.5)])
			else:
				var _n_R_b6 = _S.invoke((_S.named_value(_n_b_b1,"ramp") if _S.named_value(_n_b_b1,"ramp")!=null else ["#1c2030", "#3a4a66", "#6e86a8", "#a8c0dc", "#e8f2ff"]),"map",[_n_hex])
				var _n_n_b7 = _S.prop(_n_R_b6,"length")
				var _n_x_b8 = floori(_S.named_value(_n_b_b1,"x")+0.5)
				var _n_y_b9 = floori(_S.named_value(_n_b_b1,"y")+0.5)
				var _n_r_b10 = (ceili(_S.named_value(_n_b_b1,"s")) + 1)
				if true:
					var _n_py_b11 = (-_n_r_b10)
					while _S.truth((_n_py_b11 <= _n_r_b10)):
						if true:
							var _n_px_b12 = (-_n_r_b10)
							while _S.truth((_n_px_b12 <= _n_r_b10)):
								var _n_u_b13 = (((_n_px_b12 + 0.5) * _n_ca_b3) + ((_n_py_b11 + 0.5) * _n_sa_b4))
								var _n_v_b14 = (((-(_n_px_b12 + 0.5)) * _n_sa_b4) + ((_n_py_b11 + 0.5) * _n_ca_b3))
								var _n_d_b15 = ((float(absf(_n_u_b13))/_S.named_value(_n_b_b1,"s")) + (float(absf(_n_v_b14))/(_S.named_value(_n_b_b1,"s") * 0.62)))
								if _S.truth((_n_d_b15 > 1.3)):
									_n_px_b12 += 1.0
									continue
								_S.invoke(_n_p_b0,"dot",[(_n_x_b8 + _n_px_b12), (_n_y_b9 + _n_py_b11), (_S.index_value(_n_R_b6,0) if _S.truth((_n_d_b15 > 1)) else ((_S.index_value(_n_R_b6,(_n_n_b7 - 1)) if _S.truth((_n_u_b13 < 0)) else _S.index_value(_n_R_b6,(_n_n_b7 - 2))) if _S.truth((_n_v_b14 < 0)) else (_S.index_value(_n_R_b6,(_n_n_b7 - 3)) if _S.truth((_n_u_b13 < 0)) else _S.index_value(_n_R_b6,maxf(1,(_n_n_b7 - 4)))))), _n_a_b2])
								_n_px_b12 += 1.0
						_n_py_b11 += 1.0
	return null

static func _f25(_parent,_args:Array,_this=null):
	_S.set_prop(_this,"list",[],"=")
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_color_b3 = _S.arg(_args,3)
	var _n_k_b4 = _S.arg(_args,4)
	var _n_life_b5 = _S.arg(_args,5)
	_S.invoke(_S.named_value(_this,"list"),"push",[{"x":_n_x_b0,"y":_n_y_b1,"r":_n_r_b2,"color":_S.call_value(_n_hex,[_n_color_b3]),"k":_n_k_b4,"life":_n_life_b5,"max":_n_life_b5}])
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_dt_b0 = _S.arg(_args,0)
	if true:
		var _n_i_b1 = (_S.prop(_S.named_value(_this,"list"),"length") - 1)
		while _S.truth((_n_i_b1 >= 0)):
			if _S.truth((_S.set_prop(_S.index_value(_S.named_value(_this,"list"),_n_i_b1),"life",_n_dt_b0,"-=") <= 0)):
				_S.invoke(_S.named_value(_this,"list"),"splice",[_n_i_b1, 1])
			_n_i_b1 -= 1.0
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_S.named_value(_this,"list")):
		var _n_l_b1 = _iter_0
		var _n_k_b2 = (float(_S.named_value(_n_l_b1,"life"))/_S.named_value(_n_l_b1,"max"))
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_l_b1,"x"), _S.named_value(_n_l_b1,"y"), (_S.named_value(_n_l_b1,"r") * (0.55 + (0.45 * _n_k_b2))), _S.named_value(_n_l_b1,"color"), ((_S.named_value(_n_l_b1,"k") * _n_k_b2) * _n_k_b2)])
	return null
