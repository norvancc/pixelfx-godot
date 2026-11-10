@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/portal.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "tone", _S.import_value("fx/arcane/_lib.js", "tone"))
	_S.define(_e, "mote", _S.import_value("fx/arcane/_lib.js", "mote"))
	_S.define(_e, "streak", _S.import_value("fx/arcane/_lib.js", "streak"))
	_S.define(_e, "setup", _S.function_value(_e, "_f0"))
	_S.define(_e, "rift", _S.function_value(_e, "_f4"))
	_S.define(_e, "well", _S.function_value(_e, "_f6"))
	_S.define(_e, "orbit", _S.function_value(_e, "_f9"))
	_S.define(_e, "infall", _S.function_value(_e, "_f10"))
	_S.define(_e, "skaters", _S.function_value(_e, "_f17"))
	_S.define(_e, "floor", _S.function_value(_e, "_f20"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f21"))
	_S.define(_e, "draw", _S.function_value(_e, "_f22"))
	_S.define(_e, "D", 2.4)
	_S.define(_e, "meta", _S.merge([{"name": "Portal"}, {"desc": "An upright rift: fibrous spiral arms wind down into the dark, a lit rim wobbles, motes and streaks are pulled in, the floor glows."}, {"tags": ["arcane", "portal", "rift", "teleport", "magic", "ground", "loop"]}, {"size": [152, 116]}, {"origin": [76, 106]}, {"duration": _S.read(_e, "D")}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"width": 17}, {"height": 29}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "wrapPi", _S.function_value(_e, "_f23"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_o_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.ColorFX.fit(_S.named_value(_n_o_b1,"palette"),8)
	var _n_rx_b3 = _S.named_value(_n_o_b1,"width")
	var _n_ry_b4 = _S.named_value(_n_o_b1,"height")
	var _n_ph_b5 = (float(_n_t_b0)/_n_D)
	var _n_S_b6 = _S.named_value(_n_o_b1,"seed")
	var _n_CY_b7 = (-(_n_ry_b4 + 5))
	var _n_rim_b8 = _S.function_value(_S.capture(_parent,{"ph":_n_ph_b5,"S":_n_S_b6,"this":_this}),"_f1")
	var _n_at_b9 = _S.function_value(_S.capture(_parent,{"rx":_n_rx_b3,"CY":_n_CY_b7,"ry":_n_ry_b4,"this":_this}),"_f2")
	var _n_spots_b10 = [(((_n_ph_b5 * _n_TAU) * 2) - 0.6), ((((_n_ph_b5 * _n_TAU) * 2) + PI) - 0.6)]
	var _n_hot_b11 = _S.function_value(_S.capture(_parent,{"spots":_n_spots_b10,"this":_this}),"_f3")
	return {"C":_n_C_b2,"rx":_n_rx_b3,"ry":_n_ry_b4,"ph":_n_ph_b5,"S":_n_S_b6,"CY":_n_CY_b7,"rim":_n_rim_b8,"at":_n_at_b9,"hot":_n_hot_b11,"spots":_n_spots_b10}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ph = _S.read(_parent,"ph")
	var _n_S = _S.read(_parent,"S")
	var _n_th_b0 = _S.arg(_args,0)
	return ((1 + (0.05 * _S.NoiseKernels.tile_noise((((float(_n_th_b0)/_n_TAU) * 10) + (_n_ph * 10)),(_n_ph * 4),10,4,_n_S))) + (0.018 * sin(((_n_th_b0 * 3) - ((_n_ph * _n_TAU) * 2)))))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_rx = _S.read(_parent,"rx")
	var _n_CY = _S.read(_parent,"CY")
	var _n_ry = _S.read(_parent,"ry")
	var _n_th_b0 = _S.arg(_args,0)
	var _n_rho_b1 = _S.arg(_args,1)
	var _n_out_b2 = maxf(0,(_n_rho_b1 - 1))
	var _n_k_b3 = minf(1,_n_rho_b1)
	return [(cos(_n_th_b0) * ((_n_k_b3 * _n_rx) + (_n_out_b2 * 21))), minf((-1),(_n_CY + (sin(_n_th_b0) * ((_n_k_b3 * _n_ry) + (_n_out_b2 * 16)))))]
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_wrapPi = _S.read(_parent,"wrapPi")
	var _n_spots = _S.read(_parent,"spots")
	var _n_th_b0 = _S.arg(_args,0)
	return (maxf(exp((float((-pow(_S.call_value(_n_wrapPi,[(_n_th_b0 - _S.index_value(_n_spots,0))]),2)))/0.12)),(0.85 * exp((float((-pow(_S.call_value(_n_wrapPi,[(_n_th_b0 - _S.index_value(_n_spots,1))]),2)))/0.08)))) + (0.35 * maxf(0,cos((_n_th_b0 + 2.3)))))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _object_0 = _n_s_b1
	var _n_C_b2 = _S.named_value(_object_0,"C")
	var _n_rx_b3 = _S.named_value(_object_0,"rx")
	var _n_ry_b4 = _S.named_value(_object_0,"ry")
	var _n_ph_b5 = _S.named_value(_object_0,"ph")
	var _n_CY_b6 = _S.named_value(_object_0,"CY")
	var _n_rim_b7 = _S.named_value(_object_0,"rim")
	var _n_hot_b8 = _S.named_value(_object_0,"hot")
	_S.invoke(_n_p_b0,"shade",[((-_n_rx_b3) - 4), ((_n_CY_b6 - _n_ry_b4) - 4), (_n_rx_b3 + 4), ((_n_CY_b6 + _n_ry_b4) + 4), _S.function_value(_S.capture(_parent,{"rx":_n_rx_b3,"CY":_n_CY_b6,"ry":_n_ry_b4,"rim":_n_rim_b7,"hot":_n_hot_b8,"C":_n_C_b2,"ph":_n_ph_b5,"this":_this}),"_f5")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_rx = _S.read(_parent,"rx")
	var _n_CY = _S.read(_parent,"CY")
	var _n_ry = _S.read(_parent,"ry")
	var _n_rim = _S.read(_parent,"rim")
	var _n_hot = _S.read(_parent,"hot")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ph = _S.read(_parent,"ph")
	var _n_tone = _S.read(_parent,"tone")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float(_n_x_b0)/_n_rx)
	var _n_v_b4 = (float((_n_y_b1 - _n_CY))/_n_ry)
	var _n_r_b5 = _S.logical("||",_S.Bridge.hypot([_n_u_b3, _n_v_b4]),func():return 0.000001)
	var _n_th_b6 = atan2(_n_v_b4,_n_u_b3)
	var _n_R0_b7 = _S.call_value(_n_rim,[_n_th_b6])
	var _n_g_b8 = (float(_S.Bridge.hypot([(float(_n_u_b3)/_n_rx), (float(_n_v_b4)/_n_ry)]))/_n_r_b5)
	var _n_e_b9 = (float((_n_r_b5 - _n_R0_b7))/_n_g_b8)
	var _n_h_b10 = _S.call_value(_n_hot,[_n_th_b6])
	if _S.truth((_n_e_b9 > 2.5)):
		return null
	if _S.truth((_n_e_b9 > 1.5)):
		if _S.truth((_n_h_b10 > 0.6)):
			_S.set_prop(_n_out_b2,"c",_S.index_value(_n_C,3),"=")
			_S.set_prop(_n_out_b2,"a",0.5,"=")
		return null
	if _S.truth((_n_e_b9 > 0.5)):
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,4) if _S.truth((_n_h_b10 > 0.5)) else _S.index_value(_n_C,2)),"=")
		return null
	if _S.truth((_n_e_b9 > (-0.5))):
		_S.set_prop(_n_out_b2,"c",(_n_WHITE if _S.truth((_n_h_b10 > 0.42)) else _S.index_value(_n_C,6)),"=")
		_S.set_prop(_n_out_b2,"k",(0.25 + (0.4 * _n_h_b10)),"=")
		return null
	var _n_d_b11 = (float(_n_r_b5)/_n_R0_b7)
	var _n_z_b12 = (-log(maxf(0.02,_n_d_b11)))
	var _n_phi_b13 = (((3 * _n_th_b6) + (6.5 * _n_z_b12)) - ((_n_TAU * 3) * _n_ph))
	var _n_c1_b14 = (0.5 + (0.5 * cos(_n_phi_b13)))
	var _n_c2_b15 = (0.5 + (0.5 * cos(((_n_phi_b13 + PI) + (0.6 * _n_z_b12)))))
	var _n_lit_b16 = pow(_n_d_b11,1.5)
	var _n_sink_b17 = _S.MathFX.smooth(0.2,0.62,_n_d_b11)
	var _n_knot_b18 = pow(maxf(0,cos((((4 * _n_z_b12) - (float(_n_phi_b13)/3)) + ((_n_TAU * 5) * _n_ph)))),6)
	var _n_st_b19 = (_S.MathFX.smooth(0.4,0.7,_n_d_b11) + (0.6 * _S.MathFX.smooth(0.8,0.95,_n_d_b11)))
	var _n_crest_b20 = (((pow(_n_c1_b14,16) * (0.6 + (5.6 * _n_lit_b16))) * (1 + (0.5 * _n_knot_b18))) * _n_sink_b17)
	_n_st_b19 += (_n_crest_b20 + ((pow(_n_c1_b14,5) * 1.1) * _n_lit_b16))
	_n_st_b19 += ((pow(_n_c2_b15,18) * (0.3 + (1.8 * _n_lit_b16))) * _n_sink_b17)
	_n_st_b19 += (((pow((0.5 + (0.5 * cos((_n_TAU * ((_n_z_b12 * 1.5) - (_n_ph * 2)))))),20) * 1.3) * _n_sink_b17) * (1 - (0.5 * _n_c1_b14)))
	_n_st_b19 += (((pow((0.5 + (0.5 * cos((((3 * _n_phi_b13) + (2 * _n_z_b12)) + 1.3)))),10) * 1.1) * _n_lit_b16) * _n_sink_b17)
	_n_st_b19 += ((2.2 * pow(_S.MathFX.smooth(0.8,1,_n_d_b11),2)) * (0.75 + (0.45 * _n_h_b10)))
	_S.set_prop(_n_out_b2,"c",_S.call_value(_n_tone,[_n_C, (float(_n_st_b19)/7), _n_x_b0, _n_y_b1, 0, 0.65]),"=")
	if _S.truth((_n_crest_b20 > 2.2)):
		_S.set_prop(_n_out_b2,"k",(0.12 + (0.05 * _n_crest_b20)),"=")
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _object_0 = _n_s_b1
	var _n_C_b2 = _S.named_value(_object_0,"C")
	var _n_rx_b3 = _S.named_value(_object_0,"rx")
	var _n_ry_b4 = _S.named_value(_object_0,"ry")
	var _n_ph_b5 = _S.named_value(_object_0,"ph")
	var _n_S_b6 = _S.named_value(_object_0,"S")
	var _n_CY_b7 = _S.named_value(_object_0,"CY")
	var _n_rim_b8 = _S.named_value(_object_0,"rim")
	var _n_t_b9 = (_n_ph_b5 * _n_D)
	_S.call_value(_n_cycle,[_n_t_b9, _n_D, 18, ((_n_S_b6 * 7) + 5), _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), _S.function_value(_S.capture(_parent,{"rim":_n_rim_b8,"rx":_n_rx_b3,"CY":_n_CY_b7,"ry":_n_ry_b4,"ph":_n_ph_b5,"p":_n_p_b0,"C":_n_C_b2,"this":_this}),"_f8")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[1.1, 1.8])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ease = _S.read(_parent,"ease")
	var _n_rim = _S.read(_parent,"rim")
	var _n_rx = _S.read(_parent,"rx")
	var _n_CY = _S.read(_parent,"CY")
	var _n_ry = _S.read(_parent,"ry")
	var _n_ph = _S.read(_parent,"ph")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_q_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_th_b4 = (_S.invoke(_n_r_b2,"range",[0, _n_TAU]) + (_n_q_b3 * 2.6))
	var _n_rho_b5 = (0.92 * (1 - (_S.invoke(_n_ease,"inQuad",[_n_q_b3]) * 0.9)))
	var _n_R0_b6 = _S.call_value(_n_rim,[_n_th_b4])
	var _n_x_b7 = (((cos(_n_th_b4) * _n_rho_b5) * _n_R0_b6) * _n_rx)
	var _n_y_b8 = (_n_CY + (((sin(_n_th_b4) * _n_rho_b5) * _n_R0_b6) * _n_ry))
	var _n_tw_b9 = sin((((_n_ph * _n_TAU) * _S.invoke(_n_r_b2,"int",[14, 22])) + _S.invoke(_n_r_b2,"range",[0, _n_TAU])))
	var _n_a_b10 = (minf(1,(_n_q_b3 * 6)) * (1 if _S.truth((_n_rho_b5 > 0.25)) else (float(_n_rho_b5)/0.25)))
	if _S.truth((_n_tw_b9 > (-0.3))):
		_S.invoke(_n_p,"dot",[_n_x_b7, _n_y_b8, (_n_WHITE if _S.truth(((_n_tw_b9 > 0.6) if _S.truth((_n_rho_b5 > 0.6)) else (_n_rho_b5 > 0.6))) else (_S.index_value(_n_C,6) if _S.truth((_n_rho_b5 > 0.45)) else _S.index_value(_n_C,5))), _n_a_b10])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ease = _S.read(_parent,"ease")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_mote = _S.read(_parent,"mote")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _object_0 = _n_s_b1
	var _n_C_b2 = _S.named_value(_object_0,"C")
	var _n_rx_b3 = _S.named_value(_object_0,"rx")
	var _n_ry_b4 = _S.named_value(_object_0,"ry")
	var _n_ph_b5 = _S.named_value(_object_0,"ph")
	var _n_S_b6 = _S.named_value(_object_0,"S")
	var _n_CY_b7 = _S.named_value(_object_0,"CY")
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < 7)):
			var _n_k_b9 = fmod(((_n_ph_b5 * 2) + (float(_n_i_b8)/7)),1)
			var _n_th_b10 = ((fmod(((_n_i_b8 * 2.39) + _n_S_b6),_n_TAU) + ((_n_ph_b5 * _n_TAU) * 2)) + (_n_k_b9 * 2.5))
			var _n_rho_b11 = ((1.2 + (0.35 * fmod((_n_i_b8 * 0.618),1))) - (0.3 * _S.invoke(_n_ease,"inQuad",[_n_k_b9])))
			var _n_x_b12 = ((cos(_n_th_b10) * _n_rho_b11) * _n_rx_b3)
			var _n_y_b13 = (_n_CY_b7 + ((sin(_n_th_b10) * _n_rho_b11) * _n_ry_b4))
			var _n_a_b14 = minf(1,(sin((_n_k_b9 * PI)) * 2.2))
			_S.call_value(_n_mote,[_n_p_b0, _n_x_b12, _n_y_b13, (((-sin(_n_th_b10)) * _n_rx_b3) * 10), ((cos(_n_th_b10) * _n_ry_b4) * 10), (_S.index_value(_n_C_b2,6) if _S.truth(fmod(_n_i_b8,3)) else _n_WHITE), 0.6, _n_a_b14, 0.3])
			_n_i_b8 += 1.0
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _object_0 = _n_s_b1
	var _n_C_b2 = _S.named_value(_object_0,"C")
	var _n_ph_b3 = _S.named_value(_object_0,"ph")
	var _n_S_b4 = _S.named_value(_object_0,"S")
	var _n_rim_b5 = _S.named_value(_object_0,"rim")
	var _n_at_b6 = _S.named_value(_object_0,"at")
	var _n_t_b7 = (_n_ph_b3 * _n_D)
	_S.call_value(_n_cycle,[_n_t_b7, _n_D, 60, ((_n_S_b4 * 7) + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f11"), _S.function_value(_S.capture(_parent,{"at":_n_at_b6,"rim":_n_rim_b5,"p":_n_p_b0,"C":_n_C_b2,"this":_this}),"_f12")])
	_S.call_value(_n_cycle,[_n_t_b7, _n_D, 12, ((_n_S_b4 * 7) + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f14"), _S.function_value(_S.capture(_parent,{"at":_n_at_b6,"p":_n_p_b0,"C":_n_C_b2,"this":_this}),"_f15")])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.3, 0.5])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_this = _S.read(_parent,"this")
	var _n_rim = _S.read(_parent,"rim")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_mote = _S.read(_parent,"mote")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_a0_b3 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_d0_b4 = _S.invoke(_n_r_b2,"range",[1.8, 3])
	var _n_spin_b5 = (_S.invoke(_n_r_b2,"range",[0.8, 1.8]) * (1 if _S.truth(_S.invoke(_n_r_b2,"chance",[0.8])) else 0.35))
	var _n_size_b6 = _S.invoke(_n_r_b2,"range",[0.8, 1.5])
	var _n_hue_b7 = _S.invoke(_n_r_b2,"next",[])
	var _n_pos_b8 = _S.function_value(_S.capture(_parent,{"a0":_n_a0_b3,"spin":_n_spin_b5,"d0":_n_d0_b4,"this":_n_this}),"_f13")
	var _n_q_b9 = (float(_n_age_b0)/_n_life_b1)
	var _tuple_0 = _S.call_value(_n_pos_b8,[_n_q_b9])
	var _n_x_b10 = _S.prop(_tuple_0,0)
	var _n_y_b11 = _S.prop(_tuple_0,1)
	var _tuple_1 = _S.call_value(_n_pos_b8,[minf(1,(_n_q_b9 + 0.015))])
	var _n_x2_b12 = _S.prop(_tuple_1,0)
	var _n_y2_b13 = _S.prop(_tuple_1,1)
	var _n_vx_b14 = (float((_n_x2_b12 - _n_x_b10))/(0.015 * _n_life_b1))
	var _n_vy_b15 = (float((_n_y2_b13 - _n_y_b11))/(0.015 * _n_life_b1))
	var _n_rho_b16 = (_n_d0_b4 * (1 - pow(_n_q_b9,1.4)))
	var _n_R0_b17 = _S.call_value(_n_rim,[(_n_a0_b3 + ((_n_spin_b5 * _n_q_b9) * _n_q_b9))])
	var _n_fade_b18 = minf(1,(_n_q_b9 * 5))
	if _S.truth((_n_rho_b16 > (_n_R0_b17 + 0.06))):
		_S.call_value(_n_mote,[_n_p, _n_x_b10, _n_y_b11, _n_vx_b14, _n_vy_b15, (_n_WHITE if _S.truth((_n_hue_b7 < 0.25)) else (_S.index_value(_n_C,6) if _S.truth((_n_hue_b7 < 0.55)) else (_S.index_value(_n_C,5) if _S.truth((_n_hue_b7 < 0.8)) else _S.index_value(_n_C,4)))), (_n_size_b6 if _S.truth((_n_hue_b7 < 0.8)) else (_n_size_b6 * 1.4)), _n_fade_b18, (0.4 if _S.truth((_n_hue_b7 < 0.8)) else 0.15)])
	else:
		if _S.truth((_n_rho_b16 > 0.3)):
			_S.invoke(_n_p,"dot",[_n_x_b10, _n_y_b11, (_S.index_value(_n_C,6) if _S.truth((_n_rho_b16 > 0.65)) else _S.index_value(_n_C,5)), _n_rho_b16])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_a0 = _S.read(_parent,"a0")
	var _n_spin = _S.read(_parent,"spin")
	var _n_d0 = _S.read(_parent,"d0")
	var _n_q_b0 = _S.arg(_args,0)
	return _S.call_value(_n_at,[(_n_a0 + ((_n_spin * _n_q_b0) * _n_q_b0)), (_n_d0 * (1 - pow(_n_q_b0,1.4)))])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.36, 0.5])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_this = _S.read(_parent,"this")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_streak = _S.read(_parent,"streak")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_a0_b3 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_d0_b4 = _S.invoke(_n_r_b2,"range",[2.3, 3])
	var _n_spin_b5 = _S.invoke(_n_r_b2,"range",[0.2, 0.5])
	var _n_qc_b6 = sqrt((1 - (float(1.05)/_n_d0_b4)))
	var _n_q_b7 = (float(_n_age_b0)/_n_life_b1)
	var _n_pos_b8 = _S.function_value(_S.capture(_parent,{"a0":_n_a0_b3,"spin":_n_spin_b5,"d0":_n_d0_b4,"this":_n_this}),"_f16")
	if _S.truth((_n_q_b7 < _n_qc_b6)):
		var _tuple_0 = _S.call_value(_n_pos_b8,[_n_q_b7])
		var _n_x_b9 = _S.prop(_tuple_0,0)
		var _n_y_b10 = _S.prop(_tuple_0,1)
		var _tuple_1 = _S.call_value(_n_pos_b8,[(_n_q_b7 + 0.015)])
		var _n_x2_b11 = _S.prop(_tuple_1,0)
		var _n_y2_b12 = _S.prop(_tuple_1,1)
		_S.call_value(_n_streak,[_n_p, _n_x_b9, _n_y_b10, (float((_n_x2_b11 - _n_x_b9))/(0.015 * _n_life_b1)), (float((_n_y2_b12 - _n_y_b10))/(0.015 * _n_life_b1)), _S.index_value(_n_C,6), minf(1,(_n_q_b7 * 5))])
	else:
		var _n_k_b13 = (1 - (float((_n_q_b7 - _n_qc_b6))/(1 - _n_qc_b6)))
		var _tuple_2 = _S.call_value(_n_pos_b8,[_n_qc_b6])
		var _n_x_b14 = _S.prop(_tuple_2,0)
		var _n_y_b15 = _S.prop(_tuple_2,1)
		if _S.truth((_n_k_b13 > 0.55)):
			_S.invoke(_n_p,"px",[_n_x_b14, _n_y_b15, _n_WHITE])
		_S.invoke(_n_p,"glow",[_n_x_b14, _n_y_b15, 7, _S.index_value(_n_C,6), ((0.6 * _n_k_b13) * _n_k_b13)])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_a0 = _S.read(_parent,"a0")
	var _n_spin = _S.read(_parent,"spin")
	var _n_d0 = _S.read(_parent,"d0")
	var _n_q_b0 = _S.arg(_args,0)
	return _S.call_value(_n_at,[(_n_a0 + ((_n_spin * _n_q_b0) * _n_q_b0)), (_n_d0 * (1 - (_n_q_b0 * _n_q_b0)))])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _object_0 = _n_s_b1
	var _n_C_b2 = _S.named_value(_object_0,"C")
	var _n_ph_b3 = _S.named_value(_object_0,"ph")
	var _n_S_b4 = _S.named_value(_object_0,"S")
	var _n_CY_b5 = _S.named_value(_object_0,"CY")
	var _n_ry_b6 = _S.named_value(_object_0,"ry")
	var _n_t_b7 = (_n_ph_b3 * _n_D)
	var _n_foot_b8 = (_n_CY_b5 + _n_ry_b6)
	_S.call_value(_n_cycle,[_n_t_b7, _n_D, 14, ((_n_S_b4 * 7) + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f18"), _S.function_value(_S.capture(_parent,{"foot":_n_foot_b8,"p":_n_p_b0,"C":_n_C_b2,"this":_this}),"_f19")])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.7, 1.1])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_foot = _S.read(_parent,"foot")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_mote = _S.read(_parent,"mote")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_side_b3 = _S.invoke(_n_r_b2,"sign",[])
	var _n_x0_b4 = (_n_side_b3 * _S.invoke(_n_r_b2,"range",[22, 50]))
	var _n_y0_b5 = ((-1) - _S.invoke(_n_r_b2,"range",[0, 1.5]))
	var _n_q_b6 = (float(_n_age_b0)/_n_life_b1)
	var _n_e_b7 = _S.invoke(_n_ease,"inCubic",[_n_q_b6])
	var _n_x_b8 = (_n_x0_b4 * (1 - _n_e_b7))
	var _n_y_b9 = (_n_y0_b5 + ((_n_foot + 2) * _S.MathFX.smooth(0.55,1,_n_q_b6)))
	var _tuple_0 = [(_n_x0_b4 * (1 - _S.invoke(_n_ease,"inCubic",[maxf(0,(_n_q_b6 - 0.04))]))), (_n_y0_b5 + ((_n_foot + 2) * _S.MathFX.smooth(0.55,1,(_n_q_b6 - 0.04))))]
	var _n_xb_b10 = _S.prop(_tuple_0,0)
	var _n_yb_b11 = _S.prop(_tuple_0,1)
	var _n_big_b12 = _S.invoke(_n_r_b2,"chance",[0.3])
	_S.call_value(_n_mote,[_n_p, _n_x_b8, _n_y_b9, ((_n_x_b8 - _n_xb_b10) * 25), ((_n_y_b9 - _n_yb_b11) * 25), (_S.index_value(_n_C,6) if _S.truth(_n_big_b12) else _S.index_value(_n_C,5)), (0.9 if _S.truth(_n_big_b12) else 0.6), (minf(1,(_n_q_b6 * 4)) * (1 - _S.MathFX.smooth(0.85,1,_n_q_b6))), 0.3])
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _object_0 = _n_s_b1
	var _n_C_b2 = _S.named_value(_object_0,"C")
	var _n_ph_b3 = _S.named_value(_object_0,"ph")
	var _n_pulse_b4 = (0.85 + (0.15 * sin(((_n_ph_b3 * _n_TAU) * 2))))
	if true:
		var _n_x_b5 = (-36)
		while _S.truth((_n_x_b5 <= 36)):
			var _n_u_b6 = (float(absf((_n_x_b5 + 0.5)))/36)
			var _n_a_b7 = ((1 if _S.truth((_n_u_b6 < 0.55)) else (1 - (float((_n_u_b6 - 0.55))/0.45))) * (0.8 + (0.2 * _n_pulse_b4)))
			_S.invoke(_n_p_b0,"dot",[_n_x_b5, 0, (_n_WHITE if _S.truth((_n_u_b6 < 0.2)) else (_S.index_value(_n_C_b2,6) if _S.truth((_n_u_b6 < 0.5)) else _S.index_value(_n_C_b2,5))), _n_a_b7])
			if _S.truth((_n_u_b6 < 0.3)):
				_S.invoke(_n_p_b0,"dot",[_n_x_b5, 1, (_S.index_value(_n_C_b2,5) if _S.truth((_n_u_b6 < 0.15)) else _S.index_value(_n_C_b2,4)), (1 if _S.truth((_n_u_b6 < 0.15)) else 0.5)])
			_n_x_b5 += 1.0
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_floor = _S.read(_parent,"floor")
	var _n_setup = _S.read(_parent,"setup")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	_S.call_value(_n_floor,[_n_p_b0, _S.call_value(_n_setup,[_n_t_b1, _n_o_b2])])
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_setup = _S.read(_parent,"setup")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_rift = _S.read(_parent,"rift")
	var _n_well = _S.read(_parent,"well")
	var _n_orbit = _S.read(_parent,"orbit")
	var _n_infall = _S.read(_parent,"infall")
	var _n_skaters = _S.read(_parent,"skaters")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_s_b3 = _S.call_value(_n_setup,[_n_t_b1, _n_o_b2])
	var _object_0 = _n_s_b3
	var _n_C_b4 = _S.named_value(_object_0,"C")
	var _n_CY_b5 = _S.named_value(_object_0,"CY")
	var _n_rx_b6 = _S.named_value(_object_0,"rx")
	var _n_ry_b7 = _S.named_value(_object_0,"ry")
	var _n_ph_b8 = _S.named_value(_object_0,"ph")
	var _n_rim_b9 = _S.named_value(_object_0,"rim")
	var _n_spots_b10 = _S.named_value(_object_0,"spots")
	var _n_pulse_b11 = (0.85 + (0.15 * sin(((_n_ph_b8 * _n_TAU) * 2))))
	_S.call_value(_n_rift,[_n_p_b0, _n_s_b3])
	_S.call_value(_n_well,[_n_p_b0, _n_s_b3])
	_S.call_value(_n_orbit,[_n_p_b0, _n_s_b3])
	_S.call_value(_n_infall,[_n_p_b0, _n_s_b3])
	_S.call_value(_n_skaters,[_n_p_b0, _n_s_b3])
	_S.invoke(_n_p_b0,"glow",[0, _n_CY_b5, (_n_ry_b7 * 5), _S.index_value(_n_C_b4,4), (0.17 * _n_pulse_b11)])
	_S.invoke(_n_p_b0,"glow",[0, _n_CY_b5, (_n_ry_b7 * 2.6), _S.index_value(_n_C_b4,4), (0.1 * _n_pulse_b11)])
	if true:
		var _n_i_b12 = 0
		while _S.truth((_n_i_b12 < 16)):
			var _n_th_b13 = ((float(_n_i_b12)/16) * _n_TAU)
			var _n_R0_b14 = (_S.call_value(_n_rim_b9,[_n_th_b13]) * 1.08)
			_S.invoke(_n_p_b0,"glow",[((cos(_n_th_b13) * _n_R0_b14) * _n_rx_b6), (_n_CY_b5 + ((sin(_n_th_b13) * _n_R0_b14) * _n_ry_b7)), 15, _S.index_value(_n_C_b4,4), (0.15 * _n_pulse_b11)])
			_n_i_b12 += 1.0
	for _iter_1 in _S.array(_n_spots_b10):
		var _n_th_b15 = _iter_1
		_S.invoke(_n_p_b0,"glow",[((cos(_n_th_b15) * _S.call_value(_n_rim_b9,[_n_th_b15])) * _n_rx_b6), (_n_CY_b5 + ((sin(_n_th_b15) * _S.call_value(_n_rim_b9,[_n_th_b15])) * _n_ry_b7)), 16, _S.index_value(_n_C_b4,6), 0.42])
	if true:
		var _n_i_b16 = (-3)
		while _S.truth((_n_i_b16 <= 3)):
			_S.invoke(_n_p_b0,"glow",[(_n_i_b16 * 7), (-1), 16, _S.index_value(_n_C_b4,5), (0.12 * _n_pulse_b11)])
			_n_i_b16 += 1.0
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_a_b0 = _S.arg(_args,0)
	return (_n_a_b0 - (_n_TAU * floori((float((_n_a_b0 + PI))/_n_TAU))))
	return null
