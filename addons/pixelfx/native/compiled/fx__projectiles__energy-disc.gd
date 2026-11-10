@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/energy-disc.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "beat", _S.import_value("fx/projectiles/_lib.js", "beat"))
	_S.define(_e, "wake", _S.import_value("fx/projectiles/_lib.js", "wake"))
	_S.define(_e, "spark", _S.import_value("fx/projectiles/_lib.js", "spark"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Energy disc"}, {"desc": "A sawblade of crackling energy spinning flat out as it flies: hooked teeth bright on their leading edges, a white hub, spiral arms churning, sparks flung off the teeth."}, {"tags": ["projectile", "disc", "saw", "energy", "sci-fi", "directional", "loop"]}, {"size": [120, 52]}, {"origin": [92, 26]}, {"duration": 0.5}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0a0f2e", "#172a78", "#2550d0", "#3f8cff", "#7cc8ff", "#c8f0ff", "#ffffff"]}, {"size": 9}, {"teeth": 8}, {"speed": 220}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_beat = _S.read(_parent,"beat")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_R_b4 = _S.named_value(_n_o_b2,"size")
	var _n_N_b5 = _S.named_value(_n_o_b2,"teeth")
	var _n_V_b6 = _S.named_value(_n_o_b2,"speed")
	var _n_S_b7 = _S.named_value(_n_o_b2,"seed")
	var _n_D_b8 = _S.named_value(_n_meta,"duration")
	var _n_left_b9 = ((-_S.index_value(_S.named_value(_n_meta,"origin"),0)) + 2)
	var _n_rot_b10 = (float(((_n_TAU * 3) * _n_t_b1))/_n_D_b8)
	var _n_seg_b11 = (float(_n_TAU)/_n_N_b5)
	var _n_frac_b12 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f1")
	_S.call_value(_n_beat,[_n_t_b1, _n_D_b8, 8, (_n_S_b7 + 4), _S.function_value(_S.capture(_parent,{"this":_this}),"_f2"), _S.function_value(_S.capture(_parent,{"R":_n_R_b4,"left":_n_left_b9,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f3")])
	_S.invoke(_n_p_b0,"glowLine",[(-2), 0, (-26), 0, 8, _S.index_value(_n_C_b3,3), 0.35])
	var _n_SP_b13 = [_n_WHITE, _S.index_value(_n_C_b3,5), _S.index_value(_n_C_b3,4), _S.index_value(_n_C_b3,3)]
	_S.call_value(_n_beat,[_n_t_b1, _n_D_b8, 20, _n_S_b7, _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"rot":_n_rot_b10,"R":_n_R_b4,"V":_n_V_b6,"left":_n_left_b9,"p":_n_p_b0,"SP":_n_SP_b13,"this":_this}),"_f6")])
	_S.invoke(_n_p_b0,"shade",[((-_n_R_b4) - 5), ((-_n_R_b4) - 5), (_n_R_b4 + 5), (_n_R_b4 + 5), _S.function_value(_S.capture(_parent,{"R":_n_R_b4,"C":_n_C_b3,"rot":_n_rot_b10,"frac":_n_frac_b12,"seg":_n_seg_b11,"this":_this}),"_f7")])
	var _n_fr_b14 = floori(((_n_t_b1 * 30) + 0.000001))
	if true:
		var _n_j_b15 = 0
		while _S.truth((_n_j_b15 < 3)):
			var _n_g_b16 = _S.MathFX.rng([_n_fr_b14,_n_j_b15,_n_S_b7])
			var _n_a0_b17 = _S.invoke(_n_g_b16,"range",[0, _n_TAU])
			var _n_pts_b18 = []
			if true:
				var _n_i_b19 = 0
				while _S.truth((_n_i_b19 <= 4)):
					var _n_rr_b20 = (2.5 + (float(((_n_R_b4 - 3) * _n_i_b19))/4))
					var _n_a_b21 = ((_n_a0_b17 + (_n_i_b19 * 0.25)) + (_S.invoke(_n_g_b16,"range",[(-0.35), 0.35]) if _S.truth(_n_i_b19) else 0))
					_S.invoke(_n_pts_b18,"push",[[(cos(_n_a_b21) * _n_rr_b20), (sin(_n_a_b21) * _n_rr_b20)]])
					_n_i_b19 += 1.0
			_S.invoke(_n_p_b0,"polyline",[_n_pts_b18, (_S.index_value(_n_C_b3,6) if _S.truth(_n_j_b15) else _n_WHITE)])
			_n_j_b15 += 1.0
	_S.invoke(_n_p_b0,"ring",[0, 0, (_n_R_b4 + 0.5), 1, _S.index_value(_n_C_b3,6)])
	_S.invoke(_n_p_b0,"glow",[0, 0, 30, _S.index_value(_n_C_b3,3), 0.4])
	_S.invoke(_n_p_b0,"glow",[0, 0, 6, _S.index_value(_n_C_b3,5), 0.35])
	_S.invoke(_n_p_b0,"glow",[(cos(_n_rot_b10) * _n_R_b4), (sin(_n_rot_b10) * _n_R_b4), 5, _S.index_value(_n_C_b3,6), 0.4])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	return (_n_x_b0 - floori(_n_x_b0))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.12, 0.22])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_left = _S.read(_parent,"left")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_this = _S.read(_parent,"this")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_side_b4 = ((-1) if _S.truth(_S.invoke(_n_r_b2,"chance",[0.5])) else 1)
	var _n_x0_b5 = ((-2) - (_n_age_b0 * _S.invoke(_n_r_b2,"range",[180, 260])))
	var _n_len_b6 = (_S.invoke(_n_r_b2,"range",[8, 16]) * (0.5 + _n_k_b3))
	var _n_y_b7 = (_n_side_b4 * (_n_R + _S.invoke(_n_r_b2,"range",[0.5, 3])))
	if _S.truth(((_n_x0_b5 - _n_len_b6) < _n_left)):
		return null
	_S.invoke(_n_p,"line",[_n_x0_b5, _n_y_b7, (_n_x0_b5 - _n_len_b6), _n_y_b7, (_S.index_value(_n_C,5) if _S.truth((_n_k_b3 < 0.35)) else (_S.index_value(_n_C,4) if _S.truth((_n_k_b3 < 0.7)) else _S.index_value(_n_C,3))), _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return (1 if _S.truth((_n_u_b0 < 0.65)) else (float((1 - _n_u_b0))/0.35))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.12, 0.3])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_rot = _S.read(_parent,"rot")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n_V = _S.read(_parent,"V")
	var _n_wake = _S.read(_parent,"wake")
	var _n_left = _S.read(_parent,"left")
	var _n_p = _S.read(_parent,"p")
	var _n_SP = _S.read(_parent,"SP")
	var _n_spark = _S.read(_parent,"spark")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_a_b3 = ((_n_rot - (_S.invoke(_n_r_b2,"range",[0, _n_TAU]) * 0)) + _S.invoke(_n_r_b2,"range",[0, _n_TAU]))
	var _n_tip_b4 = (_n_R + 3.5)
	var _n_x0_b5 = (cos(_n_a_b3) * _n_tip_b4)
	var _n_y0_b6 = (sin(_n_a_b3) * _n_tip_b4)
	var _n_v_b7 = _S.invoke(_n_r_b2,"range",[120, 230])
	var _tuple_0 = _S.call_value(_n_wake,[_n_x0_b5, _n_y0_b6, ((-sin(_n_a_b3)) * _n_v_b7), (cos(_n_a_b3) * _n_v_b7), _n_age_b0, (_n_V * 0.6), 2.4, 60])
	var _n_x_b8 = _S.prop(_tuple_0,0)
	var _n_y_b9 = _S.prop(_tuple_0,1)
	var _n_vx_b10 = _S.prop(_tuple_0,2)
	var _n_vy_b11 = _S.prop(_tuple_0,3)
	if _S.truth(((absf(_n_y_b9) < 23) if _S.truth((_n_x_b8 > (_n_left + 8))) else (_n_x_b8 > (_n_left + 8)))):
		_S.call_value(_n_spark,[_n_p, _n_x_b8, _n_y_b9, _n_vx_b10, _n_vy_b11, (1 - (float(_n_age_b0)/_n_life_b1)), _n_SP, 0.45, 0.014, 7])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_rot = _S.read(_parent,"rot")
	var _n_frac = _S.read(_parent,"frac")
	var _n_seg = _S.read(_parent,"seg")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.Bridge.hypot([_n_x_b0, _n_y_b1])
	var _n_th_b3 = atan2(_n_y_b1,_n_x_b0)
	if _S.truth((_n_r_b2 > (_n_R + 4.6))):
		return null
	if _S.truth((_n_r_b2 <= _n_R)):
		if _S.truth((_n_r_b2 < 1.8)):
			return _n_WHITE
		if _S.truth((_n_r_b2 < 2.9)):
			return _S.index_value(_n_C,1)
		if _S.truth((_n_r_b2 > (_n_R - 1.1))):
			return _S.index_value(_n_C,5)
		var _n_arm_b6 = sin(((3 * (_n_th_b3 - (_n_rot * 0.5))) - (_n_r_b2 * 0.85)))
		return (_S.index_value(_n_C,5) if _S.truth((_n_arm_b6 > 0.65)) else (_S.index_value(_n_C,4) if _S.truth((_n_arm_b6 > 0.2)) else (_S.index_value(_n_C,3) if _S.truth((_n_arm_b6 > (-0.3))) else _S.index_value(_n_C,2))))
	var _n_ph_b4 = _S.call_value(_n_frac,[(float((_n_th_b3 - _n_rot))/_n_seg)])
	var _n_h_b5 = (4.2 * pow(_n_ph_b4,1.4))
	if _S.truth(((_n_r_b2 - _n_R) < _n_h_b5)):
		return (_n_WHITE if _S.truth((_n_ph_b4 > 0.86)) else (_S.index_value(_n_C,6) if _S.truth((_n_ph_b4 > 0.6)) else (_S.index_value(_n_C,5) if _S.truth((_n_ph_b4 > 0.35)) else _S.index_value(_n_C,4))))
	if _S.truth(((_n_r_b2 - _n_R) < 1.6)):
		return _S.index_value(_n_C,2)
	return null
