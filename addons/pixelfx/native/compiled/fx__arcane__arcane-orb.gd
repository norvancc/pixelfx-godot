@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/arcane-orb.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mote", _S.import_value("fx/arcane/_lib.js", "mote"))
	_S.define(_e, "setup", _S.function_value(_e, "_f0"))
	_S.define(_e, "ring", _S.function_value(_e, "_f1"))
	_S.define(_e, "orb", _S.function_value(_e, "_f3"))
	_S.define(_e, "motes", _S.function_value(_e, "_f6"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f9"))
	_S.define(_e, "draw", _S.function_value(_e, "_f10"))
	_S.define(_e, "D", 2.4)
	_S.define(_e, "RAD", 17)
	_S.define(_e, "Y0", _S.unary("-", 52))
	_S.define(_e, "meta", _S.merge([{"name": "Arcane orb"}, {"desc": "A floating orb of smoky violet glass with a swirl turning round a white-hot heart, two tilted rings of light orbiting behind and in front."}, {"tags": ["arcane", "orb", "sphere", "magic", "floating", "loop"]}, {"size": [136, 112]}, {"origin": [68, 104]}, {"duration": _S.read(_e, "D")}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RINGS", [_S.merge([{"r": 31}, {"sy": 0.24}, {"rot": 0.36}, {"beads": 3}, {"turn": 2}, {"c": 0}]), _S.merge([{"r": 27}, {"sy": 0.3}, {"rot": _S.unary("-", 0.55)}, {"beads": 2}, {"turn": _S.unary("-", 3)}, {"c": 1}])])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_Y0 = _S.read(_parent,"Y0")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_ph_b1 = (float(_n_t_b0)/_n_D)
	return {"ph":_n_ph_b1,"cx":0,"cy":(_n_Y0 + (sin((_n_ph_b1 * _n_TAU)) * 2))}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_s_b2 = _S.arg(_args,2)
	var _n_R_b3 = _S.arg(_args,3)
	var _n_near_b4 = _S.arg(_args,4)
	var _object_0 = _n_s_b2
	var _n_ph_b5 = _S.named_value(_object_0,"ph")
	var _n_cx_b6 = _S.named_value(_object_0,"cx")
	var _n_cy_b7 = _S.named_value(_object_0,"cy")
	var _n_rot_b8 = (_S.named_value(_n_R_b3,"rot") + (0.12 * sin(((_n_ph_b5 * _n_TAU) + _S.named_value(_n_R_b3,"c")))))
	var _n_cr_b9 = cos(_n_rot_b8)
	var _n_sr_b10 = sin(_n_rot_b8)
	var _n_n_b11 = ceili(((_S.named_value(_n_R_b3,"r") * _n_TAU) * 1.5))
	var _n_pos_b12 = _S.function_value(_S.capture(_parent,{"R":_n_R_b3,"cx":_n_cx_b6,"cr":_n_cr_b9,"sr":_n_sr_b10,"cy":_n_cy_b7,"this":_this}),"_f2")
	if true:
		var _n_j_b13 = 0
		while _S.truth((_n_j_b13 < _n_n_b11)):
			var _n_g_b14 = ((float(_n_j_b13)/_n_n_b11) * _n_TAU)
			var _n_z_b15 = sin(_n_g_b14)
			if _S.truth(_S.binary("!==",(_n_z_b15 > 0),_n_near_b4)):
				_n_j_b13 += 1.0
				continue
			var _tuple_1 = _S.call_value(_n_pos_b12,[_n_g_b14])
			var _n_x_b16 = _S.prop(_tuple_1,0)
			var _n_y_b17 = _S.prop(_tuple_1,1)
			_S.invoke(_n_p_b0,"dot",[_n_x_b16, _n_y_b17, (_S.index_value(_n_C_b1,5) if _S.truth(_n_near_b4) else _S.index_value(_n_C_b1,4)), (0.7 if _S.truth(_n_near_b4) else 0.4)])
			_n_j_b13 += 1.0
	if true:
		var _n_b_b18 = 0
		while _S.truth((_n_b_b18 < _S.named_value(_n_R_b3,"beads"))):
			var _n_g_b19 = (((_n_ph_b5 * _n_TAU) * _S.named_value(_n_R_b3,"turn")) + (float((_n_b_b18 * _n_TAU))/_S.named_value(_n_R_b3,"beads")))
			if true:
				var _n_k_b20 = 0
				while _S.truth((_n_k_b20 < 7)):
					var _n_gg_b21 = (_n_g_b19 - ((signf(_S.named_value(_n_R_b3,"turn")) * _n_k_b20) * 0.07))
					var _n_z_b22 = sin(_n_gg_b21)
					if _S.truth(_S.binary("!==",(_n_z_b22 > 0),_n_near_b4)):
						_n_k_b20 += 1.0
						continue
					var _tuple_2 = _S.call_value(_n_pos_b12,[_n_gg_b21])
					var _n_x_b23 = _S.prop(_tuple_2,0)
					var _n_y_b24 = _S.prop(_tuple_2,1)
					_S.invoke(_n_p_b0,"dot",[_n_x_b23, _n_y_b24, (_n_WHITE if _S.truth(_S.binary("===",_n_k_b20,0)) else (_S.index_value(_n_C_b1,6) if _S.truth((_n_k_b20 < 3)) else _S.index_value(_n_C_b1,5))), (1 if _S.truth((_n_k_b20 < 4)) else (1 - (float((_n_k_b20 - 3))/4)))])
					if _S.truth(_S.binary("===",_n_k_b20,0)):
						_S.invoke(_n_p_b0,"glow",[_n_x_b23, _n_y_b24, (7 if _S.truth(_n_near_b4) else 5), _S.index_value(_n_C_b1,6), (0.5 if _S.truth(_n_near_b4) else 0.25)])
					_n_k_b20 += 1.0
			_n_b_b18 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_cx = _S.read(_parent,"cx")
	var _n_cr = _S.read(_parent,"cr")
	var _n_sr = _S.read(_parent,"sr")
	var _n_cy = _S.read(_parent,"cy")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_lx_b1 = (cos(_n_g_b0) * _S.named_value(_n_R,"r"))
	var _n_ly_b2 = ((sin(_n_g_b0) * _S.named_value(_n_R,"r")) * _S.named_value(_n_R,"sy"))
	return [((_n_cx + (_n_lx_b1 * _n_cr)) - (_n_ly_b2 * _n_sr)), ((_n_cy + (_n_lx_b1 * _n_sr)) + (_n_ly_b2 * _n_cr))]
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_RAD = _S.read(_parent,"RAD")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_s_b2 = _S.arg(_args,2)
	var _object_0 = _n_s_b2
	var _n_ph_b3 = _S.named_value(_object_0,"ph")
	var _n_cx_b4 = _S.named_value(_object_0,"cx")
	var _n_cy_b5 = _S.named_value(_object_0,"cy")
	_S.invoke(_n_p_b0,"disc",[_n_cx_b4, _n_cy_b5, _n_RAD, _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5")])
	for _iter_1 in _S.array([[0, 1], [PI, 1], [(float(PI)/2), 0], [(float((3 * PI))/2), 0]]):
		var _tuple_2 = _iter_1
		var _n_s0_b7 = _S.prop(_tuple_2,0)
		var _n_main_b8 = _S.prop(_tuple_2,1)
		if true:
			var _n_u_b9 = 0.08
			while _S.truth((_n_u_b9 <= 0.85)):
				var _n_a_b10 = ((((_n_ph_b3 * _n_TAU) * 2) + _n_s0_b7) + (_n_u_b9 * 3.4))
				var _n_r_b11 = ((_n_u_b9 * _n_RAD) * 0.92)
				var _n_x_b12 = (_n_cx_b4 + (cos(_n_a_b10) * _n_r_b11))
				var _n_y_b13 = (_n_cy_b5 + (sin(_n_a_b10) * _n_r_b11))
				var _n_fade_b14 = (1 if _S.truth((_n_u_b9 < 0.6)) else (1 - (float((_n_u_b9 - 0.6))/0.25)))
				if _S.truth(not _S.truth(_n_main_b8)):
					_S.invoke(_n_p_b0,"dot",[_n_x_b12, _n_y_b13, _S.index_value(_n_C_b1,4), (_n_fade_b14 * 0.8)])
					_n_u_b9 += 0.012
					continue
				var _n_b_b15 = (_n_a_b10 - 0.16)
				var _n_xb_b16 = (_n_cx_b4 + (cos(_n_b_b15) * _n_r_b11))
				var _n_yb_b17 = (_n_cy_b5 + (sin(_n_b_b15) * _n_r_b11))
				_S.invoke(_n_p_b0,"dot",[_n_xb_b16, _n_yb_b17, (_S.index_value(_n_C_b1,6) if _S.truth((_n_u_b9 < 0.4)) else _S.index_value(_n_C_b1,5)), _n_fade_b14])
				_S.invoke(_n_p_b0,"dot",[_n_x_b12, _n_y_b13, (_n_WHITE if _S.truth((_n_u_b9 < 0.3)) else (_S.index_value(_n_C_b1,6) if _S.truth((_n_u_b9 < 0.55)) else _S.index_value(_n_C_b1,5))), _n_fade_b14])
				_n_u_b9 += 0.012
	var _n_pulse_b6 = (0.85 + (0.15 * sin(((_n_ph_b3 * _n_TAU) * 3))))
	_S.invoke(_n_p_b0,"circle",[_n_cx_b4, _n_cy_b5, ((3.6 * _n_pulse_b6) + 1), _S.index_value(_n_C_b1,5)])
	_S.invoke(_n_p_b0,"circle",[_n_cx_b4, _n_cy_b5, (2.8 * _n_pulse_b6), _S.index_value(_n_C_b1,6)])
	_S.invoke(_n_p_b0,"circle",[_n_cx_b4, _n_cy_b5, (1.7 * _n_pulse_b6), _n_WHITE])
	_S.invoke(_n_p_b0,"ring",[_n_cx_b4, _n_cy_b5, (_n_RAD + 0.4), 1, _S.index_value(_n_C_b1,5)])
	_S.invoke(_n_p_b0,"ring",[_n_cx_b4, _n_cy_b5, (_n_RAD + 1.3), 1, _S.index_value(_n_C_b1,2), 0.8])
	if true:
		var _n_a_b18 = 3.5
		while _S.truth((_n_a_b18 < 4.7)):
			_S.invoke(_n_p_b0,"dot",[(_n_cx_b4 + (cos(_n_a_b18) * (_n_RAD - 2.4))), (_n_cy_b5 + (sin(_n_a_b18) * (_n_RAD - 2.4))), (_n_WHITE if _S.truth(((_n_a_b18 < 4.35) if _S.truth((_n_a_b18 > 3.85)) else (_n_a_b18 > 3.85))) else _S.index_value(_n_C_b1,6))])
			_n_a_b18 += 0.03
	_S.invoke(_n_p_b0,"circle",[(_n_cx_b4 - (_n_RAD * 0.42)), (_n_cy_b5 - (_n_RAD * 0.5)), 1.3, _n_WHITE])
	_S.invoke(_n_p_b0,"dot",[(_n_cx_b4 + (_n_RAD * 0.52)), (_n_cy_b5 + (_n_RAD * 0.55)), _S.index_value(_n_C_b1,6)])
	_S.invoke(_n_p_b0,"glow",[_n_cx_b4, _n_cy_b5, 20, _S.index_value(_n_C_b1,6), (0.26 * _n_pulse_b6)])
	_S.invoke(_n_p_b0,"glowRing",[_n_cx_b4, _n_cy_b5, _n_RAD, 6, _S.index_value(_n_C_b1,5), 0.25])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_d_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,2) if _S.truth((_n_d_b0 > 0.82)) else _S.index_value(_n_C,1))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_d_b0 = _S.arg(_args,0)
	return (0.32 + ((0.5 * _n_d_b0) * _n_d_b0))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RAD = _S.read(_parent,"RAD")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_s_b2 = _S.arg(_args,2)
	var _n_S_b3 = _S.arg(_args,3)
	var _n_near_b4 = _S.arg(_args,4)
	var _object_0 = _n_s_b2
	var _n_ph_b5 = _S.named_value(_object_0,"ph")
	var _n_cx_b6 = _S.named_value(_object_0,"cx")
	var _n_cy_b7 = _S.named_value(_object_0,"cy")
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < 8)):
			var _n_a_b9 = (fmod(((_n_i_b8 * 2.4) + _n_S_b3),_n_TAU) + (((_n_ph_b5 * _n_TAU) * (1 if _S.truth(fmod(_n_i_b8,2)) else (-1))) * (1 + fmod(_n_i_b8,3))))
			var _n_rr_b10 = ((_n_RAD + 5) + (fmod((_n_i_b8 * 0.37),1) * 12))
			var _n_tilt_b11 = ((fmod((_n_i_b8 * 0.71),1) - 0.5) * 1.4)
			var _n_x0_b12 = (cos(_n_a_b9) * _n_rr_b10)
			var _n_z_b13 = sin(_n_a_b9)
			if _S.truth(_S.binary("!==",(_n_z_b13 > 0),_n_near_b4)):
				_n_i_b8 += 1.0
				continue
			var _n_x_b14 = (_n_cx_b6 + (_n_x0_b12 * cos(_n_tilt_b11)))
			var _n_y_b15 = ((_n_cy_b7 + (_n_x0_b12 * sin(_n_tilt_b11))) + ((_n_z_b13 * _n_rr_b10) * 0.28))
			var _n_dir_b16 = (1 if _S.truth(fmod(_n_i_b8,2)) else (-1))
			_S.invoke(_n_p_b0,"dot",[_n_x_b14, _n_y_b15, (_n_WHITE if _S.truth(_n_near_b4) else _S.index_value(_n_C_b1,5))])
			_S.invoke(_n_p_b0,"dot",[(_n_x_b14 - _n_dir_b16), _n_y_b15, (_S.index_value(_n_C_b1,6) if _S.truth(_n_near_b4) else _S.index_value(_n_C_b1,4)), (1 if _S.truth(_n_near_b4) else 0.6)])
			if _S.truth(_n_near_b4):
				_S.invoke(_n_p_b0,"dot",[(_n_x_b14 - (2 * _n_dir_b16)), _n_y_b15, _S.index_value(_n_C_b1,4), 0.6])
				_S.invoke(_n_p_b0,"glow",[_n_x_b14, _n_y_b15, 5, _S.index_value(_n_C_b1,6), 0.35])
			_n_i_b8 += 1.0
	if _S.truth(not _S.truth(_n_near_b4)):
		return null
	_S.call_value(_n_cycle,[(_n_ph_b5 * _n_D), _n_D, 10, ((_n_S_b3 * 3) + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), _S.function_value(_S.capture(_parent,{"cx":_n_cx_b6,"cy":_n_cy_b7,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f8")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.6, 1])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RAD = _S.read(_parent,"RAD")
	var _n_cx = _S.read(_parent,"cx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_mote = _S.read(_parent,"mote")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_q_b4 = (float(_n_age_b0)/_n_life_b1)
	var _n_d_b5 = ((_n_RAD + 1) + (_n_q_b4 * _S.invoke(_n_r_b2,"range",[8, 18])))
	var _n_x_b6 = (_n_cx + (cos(_n_a_b3) * _n_d_b5))
	var _n_y_b7 = ((_n_cy + (sin(_n_a_b3) * _n_d_b5)) - (_n_q_b4 * 10))
	_S.call_value(_n_mote,[_n_p, _n_x_b6, _n_y_b7, (cos(_n_a_b3) * 25), ((sin(_n_a_b3) * 25) - 12), (_S.index_value(_n_C,6) if _S.truth(_S.invoke(_n_r_b2,"chance",[0.5])) else _S.index_value(_n_C,5)), 0.6, (1 - _n_q_b4), 0.3])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_setup = _S.read(_parent,"setup")
	var _n_Y0 = _S.read(_parent,"Y0")
	var _n_ring = _S.read(_parent,"ring")
	var _n_RINGS = _S.read(_parent,"RINGS")
	var _n_motes = _S.read(_parent,"motes")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_s_b4 = _S.call_value(_n_setup,[_n_t_b1])
	var _n_lift_b5 = (float((_S.named_value(_n_s_b4,"cy") - _n_Y0))/2)
	_S.invoke(_n_p_b0,"glow",[0, (-1), 36, _S.index_value(_n_C_b3,4), (0.26 - (0.04 * _n_lift_b5))])
	if true:
		var _n_x_b6 = (-20)
		while _S.truth((_n_x_b6 <= 20)):
			var _n_u_b7 = (float(absf((_n_x_b6 + 0.5)))/20)
			_S.invoke(_n_p_b0,"dot",[_n_x_b6, 0, (_S.index_value(_n_C_b3,6) if _S.truth((_n_u_b7 < 0.3)) else _S.index_value(_n_C_b3,5)), ((1.1 - _n_u_b7) * (0.9 - (0.15 * _n_lift_b5)))])
			_n_x_b6 += 1.0
	_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_s_b4,"cx"), _S.named_value(_n_s_b4,"cy"), 60, _S.index_value(_n_C_b3,4), 0.36])
	for _iter_0 in _S.array(_n_RINGS):
		var _n_R_b8 = _iter_0
		_S.call_value(_n_ring,[_n_p_b0, _n_C_b3, _n_s_b4, _n_R_b8, false])
	_S.call_value(_n_motes,[_n_p_b0, _n_C_b3, _n_s_b4, _S.named_value(_n_o_b2,"seed"), false])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_setup = _S.read(_parent,"setup")
	var _n_orb = _S.read(_parent,"orb")
	var _n_ring = _S.read(_parent,"ring")
	var _n_RINGS = _S.read(_parent,"RINGS")
	var _n_motes = _S.read(_parent,"motes")
	var _n_RAD = _S.read(_parent,"RAD")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_s_b4 = _S.call_value(_n_setup,[_n_t_b1])
	_S.call_value(_n_orb,[_n_p_b0, _n_C_b3, _n_s_b4])
	for _iter_0 in _S.array(_n_RINGS):
		var _n_R_b5 = _iter_0
		_S.call_value(_n_ring,[_n_p_b0, _n_C_b3, _n_s_b4, _n_R_b5, true])
	_S.call_value(_n_motes,[_n_p_b0, _n_C_b3, _n_s_b4, _S.named_value(_n_o_b2,"seed"), true])
	_S.call_value(_n_sparkle,[_n_p_b0, (_S.named_value(_n_s_b4,"cx") - (_n_RAD * 0.42)), (_S.named_value(_n_s_b4,"cy") - (_n_RAD * 0.5)), (1.5 + (maxf(0,sin(((_S.named_value(_n_s_b4,"ph") * _n_TAU) * 2))) * 2)), _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5), 0.3])
	return null
