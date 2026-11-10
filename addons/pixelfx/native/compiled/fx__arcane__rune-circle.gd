@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/rune-circle.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "floorRing", _S.import_value("fx/arcane/_lib.js", "floorRing"))
	_S.define(_e, "glyph", _S.import_value("fx/arcane/_lib.js", "glyph"))
	_S.define(_e, "mote", _S.import_value("fx/arcane/_lib.js", "mote"))
	_S.define(_e, "circle", _S.function_value(_e, "_f0"))
	_S.define(_e, "motes", _S.function_value(_e, "_f12"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f16"))
	_S.define(_e, "draw", _S.function_value(_e, "_f17"))
	_S.define(_e, "D", 4)
	_S.define(_e, "R", 46)
	_S.define(_e, "RR", 39)
	_S.define(_e, "RI", 23)
	_S.define(_e, "RC", 7)
	_S.define(_e, "SY", 0.3)
	_S.define(_e, "NR", 12)
	_S.define(_e, "meta", _S.merge([{"name": "Rune circle"}, {"desc": "A rune circle turns on the floor in perspective: a carousel of runes lit by chasing light, a turning square, ticks, motes rising off it."}, {"tags": ["arcane", "rune", "circle", "magic", "aura", "ground", "loop"]}, {"size": [136, 100]}, {"origin": [68, 80]}, {"duration": _S.read(_e, "D")}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "at", _S.function_value(_e, "_f18"))
	_S.define(_e, "gap", _S.function_value(_e, "_f19"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n_SY = _S.read(_parent,"SY")
	var _n_floorRing = _S.read(_parent,"floorRing")
	var _n_RI = _S.read(_parent,"RI")
	var _n_RC = _S.read(_parent,"RC")
	var _n_at = _S.read(_parent,"at")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_Array = _S.read(_parent,"Array")
	var _n_NR = _S.read(_parent,"NR")
	var _n_RR = _S.read(_parent,"RR")
	var _n_glyph = _S.read(_parent,"glyph")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_far_b3 = _S.arg(_args,3)
	var _n_ph_b4 = (float(_n_t_b2)/_n_D)
	var _n_spin_b5 = (float((_n_ph_b4 * _n_TAU))/4)
	var _n_keep_b6 = (_S.function_value(_S.capture(_parent,{"this":_this}),"_f1") if _S.truth(_n_far_b3) else _S.function_value(_S.capture(_parent,{"this":_this}),"_f2"))
	var _n_chase_b7 = ((_n_ph_b4 * _n_TAU) * 2)
	var _n_lit_b8 = _S.function_value(_S.capture(_parent,{"chase":_n_chase_b7,"this":_this}),"_f3")
	var _n_tone_b9 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f4")
	_S.call_value(_n_floorRing,[_n_p_b0, 0, 0, _n_R, _n_SY, _S.function_value(_S.capture(_parent,{"lit":_n_lit_b8,"C":_n_C_b1,"tone":_n_tone_b9,"this":_this}),"_f5"), 1, _n_keep_b6])
	_S.call_value(_n_floorRing,[_n_p_b0, 0, 0, _n_RI, _n_SY, _S.function_value(_S.capture(_parent,{"tone":_n_tone_b9,"C":_n_C_b1,"this":_this}),"_f6"), 1, _n_keep_b6])
	_S.call_value(_n_floorRing,[_n_p_b0, 0, 0, _n_RC, _n_SY, _S.function_value(_S.capture(_parent,{"tone":_n_tone_b9,"C":_n_C_b1,"this":_this}),"_f7"), 1, _n_keep_b6])
	if true:
		var _n_j_b12 = 0
		while _S.truth((_n_j_b12 < 16)):
			var _n_g_b13 = (_n_spin_b5 + (float(((_n_j_b12 + 0.5) * _n_TAU))/16))
			if _S.truth(_S.binary("!==",(sin(_n_g_b13) < 0),_n_far_b3)):
				_n_j_b12 += 1.0
				continue
			var _tuple_0 = _S.call_value(_n_at,[_n_g_b13, (_n_R + 3.5)])
			var _n_x_b14 = _S.prop(_tuple_0,0)
			var _n_y_b15 = _S.prop(_tuple_0,1)
			var _n_hot_b16 = _S.call_value(_n_lit_b8,[_n_g_b13, 0.3])
			_S.invoke(_n_p_b0,"px",[_n_x_b14, _n_y_b15, (_n_WHITE if _S.truth(_n_hot_b16) else _S.call_value(_n_tone_b9,[_n_g_b13, (_S.index_value(_n_C_b1,5) if _S.truth(fmod(_n_j_b12,2)) else _S.index_value(_n_C_b1,6)), _S.index_value(_n_C_b1,4)]))])
			if _S.truth(_S.binary("===",fmod(_n_j_b12,2),0)):
				for _iter_1 in _S.array([[1, 0], [(-1), 0]]):
					var _tuple_2 = _iter_1
					var _n_dx_b17 = _S.prop(_tuple_2,0)
					var _n_dy_b18 = _S.prop(_tuple_2,1)
					_S.invoke(_n_p_b0,"px",[(_n_x_b14 + _n_dx_b17), (_n_y_b15 + _n_dy_b18), (_S.index_value(_n_C_b1,6) if _S.truth(_n_hot_b16) else _S.call_value(_n_tone_b9,[_n_g_b13, _S.index_value(_n_C_b1,4), _S.index_value(_n_C_b1,3)]))])
			_n_j_b12 += 1.0
	var _n_pts_b10 = _S.invoke([0, 1, 2, 3],"map",[_S.function_value(_S.capture(_parent,{"spin":_n_spin_b5,"this":_this}),"_f8")])
	if true:
		var _n_k_b19 = 0
		while _S.truth((_n_k_b19 < 4)):
			var _tuple_3 = _S.index_value(_n_pts_b10,_n_k_b19)
			var _n_ax_b20 = _S.prop(_tuple_3,0)
			var _n_ay_b21 = _S.prop(_tuple_3,1)
			var _tuple_4 = _S.index_value(_n_pts_b10,fmod((_n_k_b19 + 1),4))
			var _n_bx_b22 = _S.prop(_tuple_4,0)
			var _n_by_b23 = _S.prop(_tuple_4,1)
			if _S.truth(_S.binary("!==",(_n_ay_b21 < 0),(_n_by_b23 < 0))):
				var _n_u_b24 = (float(_n_ay_b21)/(_n_ay_b21 - _n_by_b23))
				var _n_mx_b25 = (_n_ax_b20 + ((_n_bx_b22 - _n_ax_b20) * _n_u_b24))
				if _S.truth(_S.binary("===",(_n_ay_b21 < 0),_n_far_b3)):
					_n_bx_b22 = _n_mx_b25
					_n_by_b23 = 0
				else:
					_n_ax_b20 = _n_mx_b25
					_n_ay_b21 = 0
			else:
				if _S.truth(_S.binary("!==",(_n_ay_b21 < 0),_n_far_b3)):
					_n_k_b19 += 1.0
					continue
			_S.invoke(_n_p_b0,"line",[_n_ax_b20, _n_ay_b21, _n_bx_b22, _n_by_b23, (_S.index_value(_n_C_b1,4) if _S.truth(_n_far_b3) else _S.index_value(_n_C_b1,5))])
			_n_k_b19 += 1.0
	var _n_gs_b11 = _S.invoke(_S.invoke(_S.concat([_S.array(_S.invoke(_S.call_value(_n_Array,[_n_NR]),"keys",[]))]),"map",[_S.function_value(_S.capture(_parent,{"spin":_n_spin_b5,"this":_this}),"_f9")]),"filter",[_S.function_value(_S.capture(_parent,{"far":_n_far_b3,"this":_this}),"_f10")])
	_S.invoke(_n_gs_b11,"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f11")])
	for _iter_5 in _S.array(_n_gs_b11):
		var _tuple_6 = _iter_5
		var _n_k_b26 = _S.prop(_tuple_6,0)
		var _n_g_b27 = _S.prop(_tuple_6,1)
		var _tuple_7 = _S.call_value(_n_at,[_n_g_b27, _n_RR])
		var _n_x_b28 = _S.prop(_tuple_7,0)
		var _n_y_b29 = _S.prop(_tuple_7,1)
		var _n_hot_b30 = _S.call_value(_n_lit_b8,[_n_g_b27, 0.2])
		var _n_bob_b31 = (sin((((_n_ph_b4 * _n_TAU) * 4) + (4 * _n_g_b27))) * 0.5)
		_S.call_value(_n_glyph,[_n_p_b0, _S.index_value([0, 3, 5],fmod(_n_k_b26,3)), _n_x_b28, ((_n_y_b29 - 1) + _n_bob_b31), (_n_WHITE if _S.truth(_n_hot_b30) else (_S.index_value(_n_C_b1,5) if _S.truth(_n_far_b3) else _S.index_value(_n_C_b1,6))), 1, (_S.index_value(_n_C_b1,5) if _S.truth(_n_hot_b30) else (_S.index_value(_n_C_b1,2) if _S.truth(_n_far_b3) else _S.index_value(_n_C_b1,3)))])
		_S.invoke(_n_p_b0,"glow",[_n_x_b28, (_n_y_b29 - 3), (10 if _S.truth(_n_hot_b30) else 6), _S.index_value(_n_C_b1,5), (0.5 if _S.truth(_n_hot_b30) else (0.12 if _S.truth(_n_far_b3) else 0.22))])
		_S.invoke(_n_p_b0,"glow",[_n_x_b28, _n_y_b29, 5, _S.index_value(_n_C_b1,4), 0.15])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_gap = _S.read(_parent,"gap")
	var _n_chase = _S.read(_parent,"chase")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_w_b1 = _S.arg(_args,1)
	return _S.logical("||",(_S.call_value(_n_gap,[_n_g_b0, _n_chase]) < _n_w_b1),func():return (_S.call_value(_n_gap,[_n_g_b0, (_n_chase + PI)]) < _n_w_b1))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	var _n_hi_b1 = _S.arg(_args,1)
	var _n_lo_b2 = _S.arg(_args,2)
	return (_n_lo_b2 if _S.truth((sin(_n_g_b0) < 0)) else _n_hi_b1)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_lit = _S.read(_parent,"lit")
	var _n_C = _S.read(_parent,"C")
	var _n_tone = _S.read(_parent,"tone")
	var _n_g_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth(_S.call_value(_n_lit,[_n_g_b0, 0.22])) else (_S.index_value(_n_C,6) if _S.truth(_S.call_value(_n_lit,[_n_g_b0, 0.5])) else _S.call_value(_n_tone,[_n_g_b0, _S.index_value(_n_C,6), _S.index_value(_n_C,5)])))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_tone = _S.read(_parent,"tone")
	var _n_C = _S.read(_parent,"C")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.call_value(_n_tone,[_n_g_b0, _S.index_value(_n_C,5), _S.index_value(_n_C,4)])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_tone = _S.read(_parent,"tone")
	var _n_C = _S.read(_parent,"C")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.call_value(_n_tone,[_n_g_b0, _S.index_value(_n_C,6), _S.index_value(_n_C,5)])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_spin = _S.read(_parent,"spin")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RI = _S.read(_parent,"RI")
	var _n_k_b0 = _S.arg(_args,0)
	return _S.call_value(_n_at,[(((-_n_spin) + (float((_n_k_b0 * _n_TAU))/4)) + (float(PI)/4)), _n_RI])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_spin = _S.read(_parent,"spin")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_NR = _S.read(_parent,"NR")
	var _n_k_b0 = _S.arg(_args,0)
	return [_n_k_b0, (_n_spin + (float(((_n_k_b0 + 0.5) * _n_TAU))/_n_NR))]
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_far = _S.read(_parent,"far")
	var _tuple_0 = _S.arg(_args,0)
	var _n_g_b0 = _S.prop(_tuple_0,1)
	return _S.binary("===",(sin(_n_g_b0) < 0),_n_far)
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (sin(_S.index_value(_n_a_b0,1)) - sin(_S.index_value(_n_b_b1,1)))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_S_b3 = _S.arg(_args,3)
	var _n_far_b4 = _S.arg(_args,4)
	_S.call_value(_n_cycle,[_n_t_b2, _n_D, 76, ((_n_S_b3 * 5) + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f13"), _S.function_value(_S.capture(_parent,{"far":_n_far_b4,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f14")])
	_S.call_value(_n_cycle,[_n_t_b2, _n_D, 14, ((_n_S_b3 * 5) + 2), 0.45, _S.function_value(_S.capture(_parent,{"far":_n_far_b4,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f15")])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[1.1, 1.9])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n_RR = _S.read(_parent,"RR")
	var _n_RI = _S.read(_parent,"RI")
	var _n_far = _S.read(_parent,"far")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SY = _S.read(_parent,"SY")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_mote = _S.read(_parent,"mote")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_g0_b3 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_r0_b4 = _S.invoke(_n_r_b2,"pick",[[_n_R, _n_R, _n_RR, _n_RR, _n_RI]])
	var _n_q_b5 = (float(_n_age_b0)/_n_life_b1)
	var _n_g_b6 = (_n_g0_b3 + (_n_q_b5 * _S.invoke(_n_r_b2,"range",[0.6, 1.4])))
	if _S.truth(_S.binary("!==",(sin(_n_g_b6) < 0),_n_far)):
		return null
	var _n_rr_b7 = (_n_r0_b4 * (1 - (0.35 * _n_q_b5)))
	var _n_h_b8 = (2 + (_S.invoke(_n_ease,"outQuad",[_n_q_b5]) * _S.invoke(_n_r_b2,"range",[26, 52])))
	var _n_x_b9 = (cos(_n_g_b6) * _n_rr_b7)
	var _n_y_b10 = (((sin(_n_g_b6) * _n_rr_b7) * _n_SY) - _n_h_b8)
	var _n_a_b11 = (minf(1,(_n_q_b5 * 5)) * (1 - _S.MathFX.smooth(0.65,1,_n_q_b5)))
	var _n_big_b12 = _S.invoke(_n_r_b2,"chance",[0.2])
	_S.call_value(_n_mote,[_n_p, _n_x_b9, _n_y_b10, (((-sin(_n_g_b6)) * _n_rr_b7) * 0.8), (((-36) * (1 - _n_q_b5)) - 10), (_n_WHITE if _S.truth(_S.invoke(_n_r_b2,"chance",[0.3])) else (_S.index_value(_n_C,6) if _S.truth(_S.invoke(_n_r_b2,"chance",[0.6])) else _S.index_value(_n_C,5))), (1.1 if _S.truth(_n_big_b12) else _S.invoke(_n_r_b2,"range",[0.55, 0.9])), _n_a_b11, (0.5 if _S.truth(_n_big_b12) else 0.3)])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_far = _S.read(_parent,"far")
	var _n_R = _S.read(_parent,"R")
	var _n_SY = _S.read(_parent,"SY")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_g_b3 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	if _S.truth(_S.binary("!==",(sin(_n_g_b3) < 0),_n_far)):
		return null
	var _n_rr_b4 = _S.invoke(_n_r_b2,"range",[8, _n_R])
	var _n_x_b5 = (cos(_n_g_b3) * _n_rr_b4)
	var _n_y_b6 = (((sin(_n_g_b3) * _n_rr_b4) * _n_SY) - _S.invoke(_n_r_b2,"range",[6, 34]))
	var _n_k_b7 = sin(((float(_n_age_b0)/_n_life_b1) * PI))
	_S.call_value(_n_sparkle,[_n_p, _n_x_b5, _n_y_b6, (1 + (2.4 * _n_k_b7)), _S.index_value(_n_C,6), _S.index_value(_n_C,5), (0.35 * _n_k_b7)])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n_circle = _S.read(_parent,"circle")
	var _n_motes = _S.read(_parent,"motes")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_pulse_b4 = (0.85 + (0.15 * sin((((float(_n_t_b1)/_n_D) * _n_TAU) * 4))))
	_S.invoke(_n_p_b0,"glow",[0, 0, (_n_R * 1.4), _S.index_value(_n_C_b3,4), (0.24 * _n_pulse_b4)])
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b5 = _iter_0
		_S.invoke(_n_p_b0,"glow",[((_n_s_b5 * _n_R) * 0.55), 1, (_n_R * 0.7), _S.index_value(_n_C_b3,5), (0.12 * _n_pulse_b4)])
	if true:
		var _n_h_b6 = 0
		while _S.truth((_n_h_b6 < 66)):
			_S.invoke(_n_p_b0,"glow",[0, (-_n_h_b6), 26, _S.index_value(_n_C_b3,4), ((0.11 * _n_pulse_b4) * (1 - (float(_n_h_b6)/80)))])
			_n_h_b6 += 6
	_S.call_value(_n_circle,[_n_p_b0, _n_C_b3, _n_t_b1, true])
	_S.call_value(_n_motes,[_n_p_b0, _n_C_b3, _n_t_b1, _S.named_value(_n_o_b2,"seed"), true])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_circle = _S.read(_parent,"circle")
	var _n_motes = _S.read(_parent,"motes")
	var _n_at = _S.read(_parent,"at")
	var _n_R = _S.read(_parent,"R")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_chase_b4 = (((float(_n_t_b1)/_n_D) * _n_TAU) * 2)
	_S.call_value(_n_circle,[_n_p_b0, _n_C_b3, _n_t_b1, false])
	_S.call_value(_n_motes,[_n_p_b0, _n_C_b3, _n_t_b1, _S.named_value(_n_o_b2,"seed"), false])
	for _iter_0 in _S.array([_n_chase_b4, (_n_chase_b4 + PI)]):
		var _n_g_b5 = _iter_0
		var _tuple_1 = _S.call_value(_n_at,[_n_g_b5, _n_R])
		var _n_x_b6 = _S.prop(_tuple_1,0)
		var _n_y_b7 = _S.prop(_tuple_1,1)
		_S.call_value(_n_sparkle,[_n_p_b0, _n_x_b6, _n_y_b7, (2.5 + (sin((_n_t_b1 * 30)) * 0.8)), _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5), 0.5])
		_S.invoke(_n_p_b0,"glow",[_n_x_b6, _n_y_b7, 14, _S.index_value(_n_C_b3,5), 0.4])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_SY = _S.read(_parent,"SY")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	return [(cos(_n_g_b0) * _n_r_b1), ((sin(_n_g_b0) * _n_r_b1) * _n_SY)]
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return absf(atan2(sin((_n_a_b0 - _n_b_b1)),cos((_n_a_b0 - _n_b_b1))))
	return null
