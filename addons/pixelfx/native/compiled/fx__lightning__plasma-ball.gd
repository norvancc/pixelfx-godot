@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/plasma-ball.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "loopNoise", _S.import_value("core/index.js", "loopNoise"))
	_S.define(_e, "tendril", _S.function_value(_e, "_f0"))
	_S.define(_e, "pedestal", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Plasma ball"}, {"desc": "A glass globe on a dark pedestal: wandering plasma tendrils reach from the core to the glass and fan out in bright feet where they touch it, lighting the stand and floor."}, {"tags": ["lightning", "electric", "plasma", "lamp", "prop", "loop"]}, {"size": [112, 104]}, {"origin": [56, 96]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0828", "#3b0f5e", "#6a1d9c", "#a03ad6", "#d46cf2", "#f2a8ff", "#ffe2ff", "#ffffff"]}, {"tendrils": 9}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FPS", 30)
	_S.define(_e, "N", 90)
	_S.define(_e, "GX", 0)
	_S.define(_e, "GY", _S.unary("-", 55))
	_S.define(_e, "RG", 24)
	_S.define(_e, "BASE", _S.invoke(["#0d0b12", "#17131f", "#231d2d", "#342b43", "#4b3f60", "#6b5c87"], "map", [_S.read(_e, "hex")]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RG = _S.read(_parent,"RG")
	var _n_GX = _S.read(_parent,"GX")
	var _n_GY = _S.read(_parent,"GY")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_n_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	var _n_seed_b3 = _S.arg(_args,3)
	var _n_a_b4 = (((float((_n_i_b0 + 0.5))/_n_n_b1) * _n_TAU) + (0.9 * _S.NoiseKernels.loop_noise(_n_ph_b2,0.9,(_n_seed_b3 + (_n_i_b0 * 7)))))
	var _n_z_b5 = _S.NoiseKernels.loop_noise(_n_ph_b2,0.7,((_n_seed_b3 + (_n_i_b0 * 7)) + 3))
	var _n_rho_b6 = (_n_RG * (0.72 + (0.28 * sqrt((1 - minf(1,((_n_z_b5 * _n_z_b5) * 1.6)))))))
	return {"a":_n_a_b4,"front":(_n_z_b5 > (-0.15)),"ex":(_n_GX + (cos(_n_a_b4) * _n_rho_b6)),"ey":(_n_GY + (sin(_n_a_b4) * _n_rho_b6)),"rim":(_n_rho_b6 > (_n_RG * 0.93)),"w1":_S.NoiseKernels.loop_noise(_n_ph_b2,1.1,((_n_seed_b3 + (_n_i_b0 * 7)) + 5)),"w2":_S.NoiseKernels.loop_noise(_n_ph_b2,1.3,((_n_seed_b3 + (_n_i_b0 * 7)) + 6))}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_glow_b2 = _S.arg(_args,2)
	_S.invoke(_n_p_b0,"shade",[(-18), (-32), 18, 0, _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"glow":_n_glow_b2,"this":_this}),"_f2")])
	_S.invoke(_n_p_b0,"px",[9, (-9), _S.index_value(_n_C_b1,5)])
	_S.invoke(_n_p_b0,"glow",[9, (-9), 3, _S.index_value(_n_C_b1,5), 0.5])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_BASE = _S.read(_parent,"BASE")
	var _n_glow = _S.read(_parent,"glow")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_hw_b3 = (7 if _S.truth((_n_y_b1 < (-27))) else ((9 + ((float((_n_y_b1 + 27))/25) * 6)) if _S.truth((_n_y_b1 < (-2))) else 16))
	if _S.truth((absf(_n_x_b0) > _n_hw_b3)):
		return null
	var _n_u_b4 = (float(((float(_n_x_b0)/_n_hw_b3) + 1))/2)
	if _S.truth((_n_y_b1 < (-27))):
		return _S.set_prop(_n_o_b2,"c",((_S.index_value(_n_C,4) if _S.truth((_n_u_b4 < 0.6)) else _S.index_value(_n_BASE,5)) if _S.truth((_n_y_b1 < (-30))) else (_S.index_value(_n_BASE,5) if _S.truth((_n_u_b4 < 0.3)) else (_S.index_value(_n_BASE,3) if _S.truth((_n_u_b4 < 0.75)) else _S.index_value(_n_BASE,1)))),"=")
	if _S.truth((_n_y_b1 >= (-2))):
		return _S.set_prop(_n_o_b2,"c",((_S.index_value(_n_BASE,4) if _S.truth((_n_u_b4 < 0.55)) else _S.index_value(_n_BASE,2)) if _S.truth((_n_y_b1 < (-1))) else _S.index_value(_n_BASE,1)),"=")
	var _n_i_b5 = (2 if _S.truth((_n_u_b4 < 0.1)) else (3 if _S.truth((_n_u_b4 < 0.2)) else (5 if _S.truth((_n_u_b4 < 0.3)) else (4 if _S.truth((_n_u_b4 < 0.42)) else (3 if _S.truth((_n_u_b4 < 0.6)) else (2 if _S.truth((_n_u_b4 < 0.8)) else (1 if _S.truth((_n_u_b4 < 0.92)) else 0)))))))
	_S.set_prop(_n_o_b2,"c",(_S.ColorFX.mix(_S.index_value(_n_BASE,_n_i_b5),_S.index_value(_n_C,4),(0.3 * _n_glow)) if _S.truth(((_n_u_b4 < 0.5) if _S.truth((_n_y_b1 < (-24))) else (_n_y_b1 < (-24)))) else (_S.index_value(_n_BASE,maxf(0,(_n_i_b5 - 1))) if _S.truth((_n_y_b1 > (-5))) else _S.index_value(_n_BASE,_n_i_b5))),"=")
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_FPS = _S.read(_parent,"FPS")
	var _n_N = _S.read(_parent,"N")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_Array = _S.read(_parent,"Array")
	var _n_pedestal = _S.read(_parent,"pedestal")
	var _n_GX = _S.read(_parent,"GX")
	var _n_RG = _S.read(_parent,"RG")
	var _n_GY = _S.read(_parent,"GY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_f_b4 = fmod(floori(((_n_t_b1 * _n_FPS) + 0.000001)),_n_N)
	var _n_ph_b5 = (float(_n_f_b4)/_n_N)
	var _n_n_b6 = _S.named_value(_n_o_b2,"tendrils")
	var _n_R_b7 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),3,_n_f_b4])
	var _n_pulse_b8 = ((0.85 + (0.15 * sin(((_n_ph_b5 * _n_TAU) * 6)))) + (0.1 * (_S.invoke(_n_R_b7,"next",[]) - 0.5)))
	var _n_ts_b9 = _S.invoke(_n_Array,"from",[{"length":_n_n_b6}, _S.function_value(_S.capture(_parent,{"n":_n_n_b6,"ph":_n_ph_b5,"o":_n_o_b2,"this":_this}),"_f4")])
	_S.invoke(_n_p_b0,"glow",[0, (-6), 52, _S.index_value(_n_C_b3,3), (0.22 * _n_pulse_b8)])
	_S.call_value(_n_pedestal,[_n_p_b0, _n_C_b3, _n_pulse_b8])
	_S.invoke(_n_p_b0,"shade",[(_n_GX - _n_RG), (_n_GY - _n_RG), (_n_GX + _n_RG), (_n_GY + _n_RG), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f5")])
	_S.invoke(_n_p_b0,"glow",[_n_GX, _n_GY, (_n_RG + 14), _S.index_value(_n_C_b3,3), (0.32 * _n_pulse_b8)])
	_S.invoke(_n_p_b0,"glowRing",[_n_GX, _n_GY, (_n_RG - 1), 5, _S.index_value(_n_C_b3,3), (0.22 * _n_pulse_b8)])
	var _n_drawTendril_b10 = _S.function_value(_S.capture(_parent,{"o":_n_o_b2,"f":_n_f_b4,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f6")
	_S.invoke(_n_ts_b9,"forEach",[_S.function_value(_S.capture(_parent,{"drawTendril":_n_drawTendril_b10,"this":_this}),"_f7")])
	var _n_cr_b11 = (3.6 + (0.5 * _n_pulse_b8))
	_S.invoke(_n_p_b0,"circle",[_n_GX, _n_GY, (_n_cr_b11 + 1.3), _S.index_value(_n_C_b3,3)])
	_S.invoke(_n_p_b0,"circle",[_n_GX, _n_GY, _n_cr_b11, _S.index_value(_n_C_b3,5)])
	_S.invoke(_n_p_b0,"circle",[(_n_GX - 0.6), (_n_GY - 0.6), (_n_cr_b11 * 0.55), _S.index_value(_n_C_b3,6)])
	_S.invoke(_n_p_b0,"circle",[(_n_GX - 0.8), (_n_GY - 0.8), (_n_cr_b11 * 0.25), _n_WHITE])
	_S.invoke(_n_p_b0,"glow",[_n_GX, _n_GY, 16, _S.index_value(_n_C_b3,5), (0.65 * _n_pulse_b8)])
	_S.invoke(_n_ts_b9,"forEach",[_S.function_value(_S.capture(_parent,{"drawTendril":_n_drawTendril_b10,"this":_this}),"_f8")])
	_S.invoke(_n_p_b0,"ring",[_n_GX, _n_GY, (_n_RG + 1.6), 1, _S.index_value(_n_C_b3,1)])
	_S.invoke(_n_p_b0,"ring",[_n_GX, _n_GY, (_n_RG + 0.6), 1.1, _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f9")])
	_S.invoke(_n_p_b0,"arc",[_n_GX, _n_GY, (_n_RG - 1.6), 1.3, 3.55, 4.55, _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f10")])
	if true:
		var _n_a_b12 = 0.35
		while _S.truth((_n_a_b12 < 1.15)):
			_S.invoke(_n_p_b0,"dot",[(_n_GX + (cos(_n_a_b12) * (_n_RG - 2.6))), (_n_GY + (sin(_n_a_b12) * (_n_RG - 2.6))), _S.index_value(_n_C_b3,4), 0.85])
			_n_a_b12 += 0.045
	_S.invoke(_n_p_b0,"px",[(_n_GX - (_n_RG * 0.42)), (_n_GY - (_n_RG * 0.62)), _n_WHITE])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_tendril = _S.read(_parent,"tendril")
	var _n_n = _S.read(_parent,"n")
	var _n_ph = _S.read(_parent,"ph")
	var _n_o = _S.read(_parent,"o")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _S.call_value(_n_tendril,[_n_i_b1, _n_n, _n_ph, _S.named_value(_n_o,"seed")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_GX = _S.read(_parent,"GX")
	var _n_GY = _S.read(_parent,"GY")
	var _n_RG = _S.read(_parent,"RG")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_d_b2 = _S.Bridge.hypot([(_n_x_b0 - _n_GX), (_n_y_b1 - _n_GY)])
	if _S.truth((_n_d_b2 < (_n_RG - 0.5))):
		_S.invoke(_n_p,"blend",[_n_x_b0, _n_y_b1, (_S.index_value(_n_C,1) if _S.truth((_n_d_b2 > (_n_RG - 4))) else _S.index_value(_n_C,0)), (0.22 + (0.4 * pow((float(_n_d_b2)/_n_RG),4)))])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_GX = _S.read(_parent,"GX")
	var _n_GY = _S.read(_parent,"GY")
	var _n_o = _S.read(_parent,"o")
	var _n_f = _S.read(_parent,"f")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_RG = _S.read(_parent,"RG")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_bright_b2 = _S.arg(_args,2)
	var _n_sx_b3 = (_n_GX + (cos(_S.named_value(_n_q_b0,"a")) * 4.5))
	var _n_sy_b4 = (_n_GY + (sin(_S.named_value(_n_q_b0,"a")) * 4.5))
	var _n_dx_b5 = (_S.named_value(_n_q_b0,"ex") - _n_sx_b3)
	var _n_dy_b6 = (_S.named_value(_n_q_b0,"ey") - _n_sy_b4)
	var _n_L_b7 = _S.Bridge.hypot([_n_dx_b5, _n_dy_b6])
	var _n_nx_b8 = (float((-_n_dy_b6))/_n_L_b7)
	var _n_ny_b9 = (float(_n_dx_b5)/_n_L_b7)
	var _n_r_b10 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),17,_n_i_b1,_n_f])
	var _n_pts_b11 = []
	var _n_m_b12 = maxf(4,floori((float(_n_L_b7)/2.2)+0.5))
	if true:
		var _n_j_b15 = 0
		while _S.truth((_n_j_b15 <= _n_m_b12)):
			var _n_u_b16 = (float(_n_j_b15)/_n_m_b12)
			var _n_w_b17 = (((3.2 * _S.named_value(_n_q_b0,"w1")) * sin((PI * _n_u_b16))) + ((1.6 * _S.named_value(_n_q_b0,"w2")) * sin(((_n_TAU * _n_u_b16) + _n_i_b1))))
			var _n_jit_b18 = (_S.invoke(_n_r_b10,"range",[(-0.7), 0.7]) if _S.truth(((_n_j_b15 < _n_m_b12) if _S.truth(_n_j_b15) else _n_j_b15)) else 0)
			_S.invoke(_n_pts_b11,"push",[[((_n_sx_b3 + (_n_dx_b5 * _n_u_b16)) + (_n_nx_b8 * (_n_w_b17 + _n_jit_b18))), ((_n_sy_b4 + (_n_dy_b6 * _n_u_b16)) + (_n_ny_b9 * (_n_w_b17 + _n_jit_b18)))]])
			_n_j_b15 += 1.0
	var _n_paths_b13 = [{"pts":_n_pts_b11,"w":1}]
	if true:
		var _n_k_b19 = 0
		while _S.truth((_n_k_b19 < 3)):
			var _tuple_0 = _S.index_value(_n_pts_b11,(_n_m_b12 - 2))
			var _n_bx_b20 = _S.prop(_tuple_0,0)
			var _n_by_b21 = _S.prop(_tuple_0,1)
			var _n_a_b22 = (_S.named_value(_n_q_b0,"a") + ((_n_k_b19 - 1) * _S.invoke(_n_r_b10,"range",[0.25, 0.45])))
			var _n_l_b23 = _S.invoke(_n_r_b10,"range",[2.5, 5])
			_S.invoke(_n_paths_b13,"push",[{"pts":[[_n_bx_b20, _n_by_b21], [((_n_bx_b20 + ((cos(_n_a_b22) * _n_l_b23) * 0.5)) + _S.invoke(_n_r_b10,"range",[(-0.6), 0.6])), ((_n_by_b21 + ((sin(_n_a_b22) * _n_l_b23) * 0.5)) + _S.invoke(_n_r_b10,"range",[(-0.6), 0.6]))], [(_n_bx_b20 + (cos(_n_a_b22) * _n_l_b23)), (_n_by_b21 + (sin(_n_a_b22) * _n_l_b23))]],"w":0.5}])
			_n_k_b19 += 1.0
	var _n_hot_b14 = (_S.invoke(_n_r_b10,"next",[]) < 0.2)
	for _iter_1 in _S.array(_n_paths_b13):
		var _n_q2_b24 = _iter_1
		if true:
			var _n_j_b25 = 0
			while _S.truth((_n_j_b25 < (_S.prop(_S.named_value(_n_q2_b24,"pts"),"length") - 1))):
				var _tuple_2 = _S.index_value(_S.named_value(_n_q2_b24,"pts"),_n_j_b25)
				var _n_ax_b26 = _S.prop(_tuple_2,0)
				var _n_ay_b27 = _S.prop(_tuple_2,1)
				var _tuple_3 = _S.index_value(_S.named_value(_n_q2_b24,"pts"),(_n_j_b25 + 1))
				var _n_bx_b28 = _S.prop(_tuple_3,0)
				var _n_by_b29 = _S.prop(_tuple_3,1)
				var _n_u_b30 = (float(_n_j_b25)/(_S.prop(_S.named_value(_n_q2_b24,"pts"),"length") - 1))
				if _S.truth(((_S.named_value(_n_q2_b24,"w") >= 1) if _S.truth(_n_bright_b2) else _n_bright_b2)):
					_S.invoke(_n_p,"line",[(_n_ax_b26 + 1), (_n_ay_b27 + 1), (_n_bx_b28 + 1), (_n_by_b29 + 1), _S.index_value(_n_C,3)])
				var _n_c_b31 = ((_S.index_value(_n_C,3) if _S.truth((_S.named_value(_n_q2_b24,"w") >= 1)) else _S.index_value(_n_C,2)) if _S.truth(not _S.truth(_n_bright_b2)) else (_S.index_value(_n_C,6) if _S.truth((_S.named_value(_n_q2_b24,"w") < 1)) else (_S.index_value(_n_C,6) if _S.truth((_n_hot_b14 if _S.truth(_n_hot_b14) else (_n_u_b30 > 0.75))) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b30 < 0.2)) else _S.index_value(_n_C,5)))))
				_S.invoke(_n_p,"line",[_n_ax_b26, _n_ay_b27, _n_bx_b28, _n_by_b29, _n_c_b31])
				if _S.truth((_S.binary("===",fmod(_n_j_b25,3),0) if _S.truth((_S.named_value(_n_q2_b24,"w") >= 1)) else (_S.named_value(_n_q2_b24,"w") >= 1))):
					_S.invoke(_n_p,"glow",[_n_ax_b26, _n_ay_b27, (6 if _S.truth(_n_bright_b2) else 4), _S.index_value(_n_C,4), ((0.4 if _S.truth(_n_hot_b14) else 0.24) if _S.truth(_n_bright_b2) else 0.12)])
				_n_j_b25 += 1.0
	if _S.truth(_n_bright_b2):
		_S.invoke(_n_p,"circle",[_S.named_value(_n_q_b0,"ex"), _S.named_value(_n_q_b0,"ey"), 1.6, _S.index_value(_n_C,6)])
		_S.invoke(_n_p,"px",[_S.named_value(_n_q_b0,"ex"), _S.named_value(_n_q_b0,"ey"), _n_WHITE])
		_S.invoke(_n_p,"glow",[_S.named_value(_n_q_b0,"ex"), _S.named_value(_n_q_b0,"ey"), 9, _S.index_value(_n_C,5), 0.55])
		if _S.truth(_S.named_value(_n_q_b0,"rim")):
			if true:
				var _n_s_b32 = (-1)
				while _S.truth((_n_s_b32 <= 1)):
					_S.invoke(_n_p,"px",[(_n_GX + (cos((_S.named_value(_n_q_b0,"a") + (_n_s_b32 * 0.09))) * (_n_RG - 0.5))), (_n_GY + (sin((_S.named_value(_n_q_b0,"a") + (_n_s_b32 * 0.09))) * (_n_RG - 0.5))), _S.index_value(_n_C,6)])
					_n_s_b32 += 2
	else:
		_S.invoke(_n_p,"glow",[_S.named_value(_n_q_b0,"ex"), _S.named_value(_n_q_b0,"ey"), 6, _S.index_value(_n_C,4), 0.25])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_drawTendril = _S.read(_parent,"drawTendril")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return (_S.call_value(_n_drawTendril,[_n_q_b0, _n_i_b1, false]) if _S.truth(not _S.truth(_S.named_value(_n_q_b0,"front"))) else not _S.truth(_S.named_value(_n_q_b0,"front")))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_drawTendril = _S.read(_parent,"drawTendril")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return (_S.call_value(_n_drawTendril,[_n_q_b0, _n_i_b1, true]) if _S.truth(_S.named_value(_n_q_b0,"front")) else _S.named_value(_n_q_b0,"front"))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_C,5) if _S.truth(((_n_a_b1 < 3.3) if _S.truth((_n_a_b1 > 2.2)) else (_n_a_b1 > 2.2))) else (_S.index_value(_n_C,4) if _S.truth(((_n_a_b1 < 1.3) if _S.truth((_n_a_b1 > 0.3)) else (_n_a_b1 > 0.3))) else _S.index_value(_n_C,3)))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth(((_n_u_b0 < 0.7) if _S.truth((_n_u_b0 > 0.25)) else (_n_u_b0 > 0.25))) else _S.index_value(_n_C,6))
	return null
