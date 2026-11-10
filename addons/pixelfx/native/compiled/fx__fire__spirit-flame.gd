@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/spirit-flame.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "soft", _S.import_value("fx/fire/_lib.js", "soft"))
	_S.define(_e, "ghostTongue", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Spirit flame"}, {"desc": "A cold blue-teal ghost fire floating in the air: a bright rim round a hollow dark heart, a wave climbing its wispy tail, curls breaking off, cold sparks rising."}, {"tags": ["fire", "spirit", "ghost", "magic", "cold", "ambient", "loop"]}, {"size": [80, 124]}, {"origin": [40, 94]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#040a16", "#08203a", "#0b3a52", "#0f5e6e", "#16908e", "#2cc4b4", "#7ef0dc", "#c8fff2", "#ffffff"]}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "GHOST", [[1, 1, 1], [0.8, 0.92, 3], [0.6, 0.78, 6], [0.3, 0.42, 2], [0.14, 0.22, 0]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_h_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_centre_b5 = _S.arg(_args,5)
	var _n_N_b6 = _S.arg(_args,6)
	var _n_n_b7 = _S.arg(_args,7)
	var _n_H_b8 = _S.arg(_args,8)
	var _n_layers_b9 = _S.arg(_args,9)
	var _n_jit_b10 = _S.coalesce(_S.arg(_args,10),func():return 0.5)
	for _iter_0 in _S.array(_n_layers_b9):
		var _tuple_1 = _iter_0
		var _n_lw_b11 = _S.prop(_tuple_1,0)
		var _n_lh_b12 = _S.prop(_tuple_1,1)
		var _n_ri_b13 = _S.prop(_tuple_1,2)
		var _n_L_b14 = (_n_h_b3 * _n_lh_b12)
		var _n_c_b15 = _S.index_value(_n_H_b8,_n_ri_b13)
		if true:
			var _n_r_b16 = 0
			while _S.truth((_n_r_b16 <= _n_L_b14)):
				var _n_u_b17 = (float(_n_r_b16)/maxf(1,_n_L_b14))
				var _n_v_b18 = (float(_n_r_b16)/_n_h_b3)
				var _n_half_b19 = ((((_n_w_b4 * _n_lw_b11) * pow((1 - _n_u_b17),0.75)) * minf(1,(float((_n_r_b16 + 1.5))/4))) + ((_S.call_value(_n_N_b6,[6, _n_n_b7, (_n_r_b16 * 0.4)]) * _n_jit_b10) * _n_u_b17))
				if _S.truth((_n_half_b19 < 0.3)):
					_n_r_b16 += 1.0
					continue
				var _n_cx_b20 = (_n_x_b1 + _S.call_value(_n_centre_b5,[_n_v_b18, _n_r_b16]))
				var _n_Y_b21 = floori((_n_y_b2 - _n_r_b16)+0.5)
				if true:
					var _n_px_b22 = floori((_n_cx_b20 - _n_half_b19)+0.5)
					var _n_x1_b23 = floori((_n_cx_b20 + _n_half_b19)+0.5)
					while _S.truth((_n_px_b22 <= _n_x1_b23)):
						_S.invoke(_n_p_b0,"px",[_n_px_b22, _n_Y_b21, _n_c_b15])
						_n_px_b22 += 1.0
				_n_r_b16 += 1.0
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_hotFirst = _S.read(_parent,"hotFirst")
	var _n_D = _S.read(_parent,"D")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_looped = _S.read(_parent,"looped")
	var _n_ghostTongue = _S.read(_parent,"ghostTongue")
	var _n_GHOST = _S.read(_parent,"GHOST")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9)
	var _n_H_b4 = _S.call_value(_n_hotFirst,[_n_F_b3])
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_ph_b6 = (float(_n_t_b1)/_n_D)
	var _n_N_b7 = _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f2")
	var _n_COLD_b8 = _S.ColorFX.mix(_S.index_value(_n_H_b4,3),_n_WHITE,0.15)
	var _n_bob_b9 = (sin((_n_ph_b6 * _n_TAU)) * 1.5)
	var _n_lean_b10 = (_S.call_value(_n_N_b7,[0.67, (_n_S_b5 + 2)]) * 3)
	var _n_wave_b11 = _S.function_value(_S.capture(_parent,{"ph":_n_ph_b6,"lean":_n_lean_b10,"this":_this}),"_f3")
	var _n_H0_b12 = (44 * (0.92 + (0.08 * _S.call_value(_n_N_b7,[1.3, (_n_S_b5 + 3)]))))
	var _n_y0_b13 = _n_bob_b9
	var _n_br_b14 = (0.9 + (0.1 * _S.call_value(_n_N_b7,[2, (_n_S_b5 + 4)])))
	_S.invoke(_n_p_b0,"glow",[0, (_n_y0_b13 - 16), 60, _n_COLD_b8, (0.36 * _n_br_b14)])
	_S.invoke(_n_p_b0,"glow",[(_S.call_value(_n_wave_b11,[0.5, 20]) * 0.5), (_n_y0_b13 - 20), 26, _S.index_value(_n_H_b4,2), (0.2 * _n_br_b14)])
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 40, (_n_S_b5 + 300), _S.function_value(_S.capture(_parent,{"H0":_n_H0_b12,"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"wave":_n_wave_b11,"y0":_n_y0_b13,"p":_n_p_b0,"H":_n_H_b4,"this":_this}),"_f5")])
	var _n_wl_b15 = maxf(0,(0.25 + (0.55 * _S.call_value(_n_N_b7,[1.7, (_n_S_b5 + 6)]))))
	var _n_wr_b16 = maxf(0,(0.25 + (0.55 * _S.call_value(_n_N_b7,[1.7, (_n_S_b5 + 7)]))))
	if _S.truth((_n_wl_b15 > 0.12)):
		_S.call_value(_n_ghostTongue,[_n_p_b0, (-4), (_n_y0_b13 - 4), (_n_H0_b12 * _n_wl_b15), 2.4, _S.function_value(_S.capture(_parent,{"wave":_n_wave_b11,"ph":_n_ph_b6,"this":_this}),"_f6"), _n_N_b7, ((_n_S_b5 * 11) + 1), _n_H_b4, _n_GHOST])
	if _S.truth((_n_wr_b16 > 0.12)):
		_S.call_value(_n_ghostTongue,[_n_p_b0, 4.2, (_n_y0_b13 - 4), (_n_H0_b12 * _n_wr_b16), 2.4, _S.function_value(_S.capture(_parent,{"wave":_n_wave_b11,"ph":_n_ph_b6,"this":_this}),"_f7"), _n_N_b7, ((_n_S_b5 * 11) + 2), _n_H_b4, _n_GHOST])
	_S.call_value(_n_ghostTongue,[_n_p_b0, 0, _n_y0_b13, _n_H0_b12, 8.6, _S.function_value(_S.capture(_parent,{"wave":_n_wave_b11,"this":_this}),"_f8"), _n_N_b7, (_n_S_b5 * 11), _n_H_b4, _n_GHOST, 0.6])
	for _iter_0 in _S.array([0, 1]):
		var _n_k_b17 = _iter_0
		if true:
			var _n_r_b18 = 4
			while _S.truth((_n_r_b18 < (_n_H0_b12 * 0.72))):
				var _n_v_b19 = (float(_n_r_b18)/_n_H0_b12)
				var _n_x_b20 = (_S.call_value(_n_wave_b11,[_n_v_b19, _n_r_b18]) + ((sin((((_n_r_b18 * 0.35) - ((_n_ph_b6 * _n_TAU) * 3)) + (_n_k_b17 * PI))) * 2.2) * (1 - _n_v_b19)))
				var _n_on_b21 = (sin((((_n_r_b18 * 0.2) - ((_n_ph_b6 * _n_TAU) * 4)) + (_n_k_b17 * 2))) > 0.2)
				if _S.truth(_n_on_b21):
					_S.invoke(_n_p_b0,"px",[_n_x_b20, (_n_y0_b13 - _n_r_b18), (_S.index_value(_n_H_b4,2) if _S.truth(_n_k_b17) else _S.index_value(_n_H_b4,1))])
				_n_r_b18 += 1.0
	for _iter_1 in _S.array([0.2, 0.45, 0.7]):
		var _n_v_b22 = _iter_1
		_S.invoke(_n_p_b0,"glow",[_S.call_value(_n_wave_b11,[_n_v_b22, (_n_H0_b12 * _n_v_b22)]), (_n_y0_b13 - (_n_H0_b12 * _n_v_b22)), 12, _S.index_value(_n_H_b4,2), (0.16 * _n_br_b14)])
	_S.invoke(_n_p_b0,"glow",[0, (_n_y0_b13 - 4), 9, _S.index_value(_n_H_b4,1), (0.22 + (0.06 * _S.call_value(_n_N_b7,[3, (_n_S_b5 + 5)])))])
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 34, (_n_S_b5 + 400), _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), _S.function_value(_S.capture(_parent,{"y0":_n_y0_b13,"p":_n_p_b0,"H":_n_H_b4,"this":_this}),"_f10")])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_NL = _S.read(_parent,"NL")
	var _n_t = _S.read(_parent,"t")
	var _n_rate_b0 = _S.arg(_args,0)
	var _n_seed_b1 = _S.coalesce(_S.arg(_args,1),func():return 0)
	var _n_off_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	return _S.call_value(_n_NL,[_n_t, _n_rate_b0, _n_seed_b1, _n_off_b2])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_ph = _S.read(_parent,"ph")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_lean = _S.read(_parent,"lean")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	return (((((sin((((_n_r_b1 * 0.24) - ((_n_ph * _n_TAU) * 2)) + _n_k_b2)) * 2.2) + (sin((((_n_r_b1 * 0.11) - (_n_ph * _n_TAU)) + (_n_k_b2 * 0.5))) * 3.2)) * _n_v_b0) * _n_v_b0) + ((_n_lean * _n_v_b0) * _n_v_b0))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_H0 = _S.read(_parent,"H0")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_r_b0 = _S.arg(_args,0)
	return {"x":_S.invoke(_n_r_b0,"range",[(-4), 4]),"y":((-_n_H0) * _S.invoke(_n_r_b0,"range",[0.55, 0.95])),"vx":_S.invoke(_n_r_b0,"range",[(-7), 7]),"vy":(-_S.invoke(_n_r_b0,"range",[10, 22])),"life":_S.invoke(_n_r_b0,"range",[1, 1.9]),"s":_S.invoke(_n_r_b0,"range",[1.4, 2.8]),"a":_S.invoke(_n_r_b0,"range",[0, _n_TAU]),"w":_S.invoke(_n_r_b0,"range",[2, 3.5])}
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_wave = _S.read(_parent,"wave")
	var _n_y0 = _S.read(_parent,"y0")
	var _n_drift = _S.read(_parent,"drift")
	var _n_p = _S.read(_parent,"p")
	var _n_H = _S.read(_parent,"H")
	var _n_soft = _S.read(_parent,"soft")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_tb_b2 = (_n_t - _n_age_b1)
	var _tuple_0 = _S.call_value(_n_drift,[(_S.named_value(_n_q_b0,"x") + (_S.call_value(_n_wave,[0.9, 26, 0]) * 0.5)), (_S.named_value(_n_q_b0,"y") + _n_y0), _S.named_value(_n_q_b0,"vx"), _S.named_value(_n_q_b0,"vy"), _n_age_b1, 0, (-6), 1.2, 0.6])
	var _n_x_b3 = _S.prop(_tuple_0,0)
	var _n_y_b4 = _S.prop(_tuple_0,1)
	var _n_k_b5 = (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life")))
	var _n_cx_b6 = (_n_x_b3 + ((sin(((_n_age_b1 * _S.named_value(_n_q_b0,"w")) + _S.named_value(_n_q_b0,"a"))) * 3) * (_n_age_b1 + 0.2)))
	var _n_a_b7 = (minf(1,(_n_age_b1 * 5)) * _n_k_b5)
	_S.call_value(_n_soft,[_n_p, _n_cx_b6, _n_y_b4, (_S.named_value(_n_q_b0,"s") * (0.8 + (_n_age_b1 * 0.8))), _S.index_value(_n_H,4), (0.35 * _n_a_b7)])
	_S.call_value(_n_soft,[_n_p, (_n_cx_b6 - 0.4), (_n_y_b4 - 0.6), ((_S.named_value(_n_q_b0,"s") * 0.5) * (0.8 + (_n_age_b1 * 0.5))), _S.index_value(_n_H,2), ((0.4 * _n_a_b7) * _n_k_b5)])
	_S.invoke(_n_p,"glow",[_n_cx_b6, _n_y_b4, 6, _S.index_value(_n_H,3), (0.15 * _n_a_b7)])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_wave = _S.read(_parent,"wave")
	var _n_ph = _S.read(_parent,"ph")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	return ((_S.call_value(_n_wave,[_n_v_b0, _n_r_b1, 2.1]) - ((6 * _n_v_b0) * _n_v_b0)) + ((3 * sin(((_n_v_b0 * 5) - ((_n_ph * _n_TAU) * 2)))) * _n_v_b0))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_wave = _S.read(_parent,"wave")
	var _n_ph = _S.read(_parent,"ph")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	return ((_S.call_value(_n_wave,[_n_v_b0, _n_r_b1, (-1.8)]) + ((6 * _n_v_b0) * _n_v_b0)) - ((3 * sin((((_n_v_b0 * 5) - ((_n_ph * _n_TAU) * 2)) + 1))) * _n_v_b0))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_wave = _S.read(_parent,"wave")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	return _S.call_value(_n_wave,[_n_v_b0, _n_r_b1])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_r_b0 = _S.arg(_args,0)
	return {"x":_S.invoke(_n_r_b0,"range",[(-7), 7]),"y":(-_S.invoke(_n_r_b0,"range",[4, 28])),"vx":_S.invoke(_n_r_b0,"range",[(-12), 12]),"vy":(-_S.invoke(_n_r_b0,"range",[14, 34])),"life":_S.invoke(_n_r_b0,"range",[0.9, 1.8]),"a":_S.invoke(_n_r_b0,"range",[0, _n_TAU])}
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_y0 = _S.read(_parent,"y0")
	var _n_drift = _S.read(_parent,"drift")
	var _n_p = _S.read(_parent,"p")
	var _n_H = _S.read(_parent,"H")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_drift,[_S.named_value(_n_q_b0,"x"), (_S.named_value(_n_q_b0,"y") + _n_y0), _S.named_value(_n_q_b0,"vx"), _S.named_value(_n_q_b0,"vy"), _n_age_b1, 0, (-10), 1.2, 1.2])
	var _n_x_b2 = _S.prop(_tuple_0,0)
	var _n_y_b3 = _S.prop(_tuple_0,1)
	var _n_k_b4 = (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life")))
	var _n_tw_b5 = (0.5 + (0.5 * sin(((_n_age_b1 * 14) + _S.named_value(_n_q_b0,"a")))))
	var _n_sx_b6 = (_n_x_b2 + (sin(((_n_age_b1 * 3) + _S.named_value(_n_q_b0,"a"))) * 3))
	if _S.truth(((_n_k_b4 * (0.4 + (0.6 * _n_tw_b5))) < 0.2)):
		return null
	_S.invoke(_n_p,"px",[_n_sx_b6, _n_y_b3, (_S.index_value(_n_H,0) if _S.truth(((_n_k_b4 > 0.5) if _S.truth((_n_tw_b5 > 0.7)) else (_n_tw_b5 > 0.7))) else (_S.index_value(_n_H,1) if _S.truth((_n_k_b4 > 0.5)) else _S.index_value(_n_H,3)))])
	if _S.truth(((_n_k_b4 > 0.6) if _S.truth((_n_tw_b5 > 0.85)) else (_n_tw_b5 > 0.85))):
		_S.invoke(_n_p,"px",[(_n_sx_b6 - 1), _n_y_b3, _S.index_value(_n_H,3)])
		_S.invoke(_n_p,"px",[(_n_sx_b6 + 1), _n_y_b3, _S.index_value(_n_H,3)])
		_S.invoke(_n_p,"px",[_n_sx_b6, (_n_y_b3 - 1), _S.index_value(_n_H,3)])
		_S.invoke(_n_p,"px",[_n_sx_b6, (_n_y_b3 + 1), _S.index_value(_n_H,3)])
	_S.invoke(_n_p,"glow",[_n_sx_b6, _n_y_b3, 4, _S.index_value(_n_H,2), (0.3 * _n_k_b4)])
	return null
