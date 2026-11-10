@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/blizzard-vortex.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "streaks", _S.function_value(_e, "_f0"))
	_S.define(_e, "body", _S.function_value(_e, "_f3"))
	_S.define(_e, "orbiters", _S.function_value(_e, "_f5"))
	_S.define(_e, "foot", _S.function_value(_e, "_f11"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f16"))
	_S.define(_e, "draw", _S.function_value(_e, "_f17"))
	_S.define(_e, "meta", _S.merge([{"name": "Blizzard vortex"}, {"desc": "A swirling snow tornado: wind bands spin up a leaning funnel, flakes and ice crystals orbit in front and behind, snow boils at its foot and cold light fills its throat."}, {"tags": ["ice", "snow", "blizzard", "tornado", "vortex", "wind", "loop"]}, {"size": [128, 116]}, {"origin": [64, 102]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"height": 80}, {"seed": 17}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "TILT", 0.24)
	_S.define(_e, "radius", _S.function_value(_e, "_f21"))
	_S.define(_e, "axis", _S.function_value(_e, "_f22"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_o_b3 = _S.arg(_args,3)
	var _n_front_b4 = _S.arg(_args,4)
	var _n_D_b5 = _S.named_value(_n_meta,"duration")
	var _n_H_b6 = _S.named_value(_n_o_b3,"height")
	var _n_ph_b7 = (float(_n_t_b2)/_n_D_b5)
	_S.call_value(_n_cycle,[_n_t_b2, _n_D_b5, 58, (_S.named_value(_n_o_b3,"seed") + 9), _S.function_value(_S.capture(_parent,{"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"H":_n_H_b6,"front":_n_front_b4,"ph":_n_ph_b7,"C":_n_C_b1,"p":_n_p_b0,"this":_this}),"_f2")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.5, 0.9])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_front = _S.read(_parent,"front")
	var _n_radius = _S.read(_parent,"radius")
	var _n_axis = _S.read(_parent,"axis")
	var _n_ph = _S.read(_parent,"ph")
	var _n_TILT = _S.read(_parent,"TILT")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_p = _S.read(_parent,"p")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_h0_b3 = _S.invoke(_n_r_b2,"range",[2, _n_H])
	var _n_w_b4 = (_S.invoke(_n_r_b2,"range",[8, 12]) * (1.45 - (float(_n_h0_b3)/_n_H)))
	var _n_th_b5 = (_S.invoke(_n_r_b2,"range",[0, _n_TAU]) + (_n_age_b0 * _n_w_b4))
	var _n_k_b6 = (float(_n_age_b0)/_n_life_b1)
	var _n_fade_b7 = (minf(1,(float(_n_age_b0)/0.08)) * ((float((1 - _n_k_b6))/0.3) if _S.truth((_n_k_b6 > 0.7)) else 1))
	var _n_L_b8 = _S.invoke(_n_r_b2,"range",[0.7, 1.5])
	var _n_m_b9 = ceili((float(_n_L_b8)/0.07))
	if true:
		var _n_j_b10 = 0
		while _S.truth((_n_j_b10 <= _n_m_b9)):
			var _n_a_b11 = (_n_th_b5 - (_n_j_b10 * 0.07))
			var _n_s_b12 = sin(_n_a_b11)
			if _S.truth(_S.binary("!==",(_n_s_b12 >= 0),_n_front)):
				_n_j_b10 += 1.0
				continue
			var _n_h_b13 = minf((_n_H + 4),((_n_h0_b3 + (_n_age_b0 * 16)) - (_n_j_b10 * 0.25)))
			var _n_R_b14 = (_S.call_value(_n_radius,[minf(_n_h_b13,_n_H), _n_H]) * (1 + minf(0.3,(maxf(0,(_n_h_b13 - (_n_H * 0.84))) * 0.03))))
			var _n_u_b15 = (float(_n_j_b10)/_n_m_b9)
			var _n_x_b16 = (_S.call_value(_n_axis,[minf(_n_h_b13,_n_H), _n_H, _n_ph]) + (cos(_n_a_b11) * _n_R_b14))
			var _n_y_b17 = ((-_n_h_b13) + ((_n_s_b12 * _n_R_b14) * _n_TILT))
			var _n_c_b18 = ((_n_WHITE if _S.truth((_n_u_b15 < 0.15)) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b15 < 0.5)) else _S.index_value(_n_C,5))) if _S.truth(_n_front) else (_S.index_value(_n_C,5) if _S.truth((_n_u_b15 < 0.3)) else (_S.index_value(_n_C,4) if _S.truth((_n_u_b15 < 0.6)) else _S.index_value(_n_C,3))))
			_S.invoke(_n_p,"dot",[_n_x_b16, _n_y_b17, _n_c_b18, ((_n_fade_b7 * (1 if _S.truth((_n_u_b15 < 0.6)) else (1.5 - (_n_u_b15 * 1.2)))) * (1 if _S.truth(_n_front) else 0.85))])
			_n_j_b10 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	var _n_H_b3 = _S.arg(_args,3)
	_S.invoke(_n_p_b0,"each",[(-44), ((-_n_H_b3) - 6), 44, 2, _S.function_value(_S.capture(_parent,{"H":_n_H_b3,"ph":_n_ph_b2,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_radius = _S.read(_parent,"radius")
	var _n_axis = _S.read(_parent,"axis")
	var _n_ph = _S.read(_parent,"ph")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_sx_b2 = _S.arg(_args,2)
	var _n_sy_b3 = _S.arg(_args,3)
	var _n_h_b4 = (-_n_y_b1)
	if _S.truth(((_n_h_b4 < 0) if _S.truth((_n_h_b4 < 0)) else (_n_h_b4 > (_n_H + 4)))):
		return null
	var _n_R_b5 = _S.call_value(_n_radius,[_n_h_b4, _n_H])
	var _n_dx_b6 = (_n_x_b0 - _S.call_value(_n_axis,[_n_h_b4, _n_H, _n_ph]))
	var _n_u_b7 = (float(_n_dx_b6)/_n_R_b5)
	if _S.truth(((_n_u_b7 * _n_u_b7) >= 1)):
		return null
	var _n_k_b8 = (float(_n_h_b4)/_n_H)
	var _n_rim_b9 = pow(absf(_n_u_b7),3)
	var _n_swirl_b10 = ((sin((((asin(_n_u_b7) * 3) - ((_n_TAU * _n_ph) * 2)) + (_n_h_b4 * 0.2))) * 0.5) + 0.5)
	var _n_a_b11 = (((((0.07 + (0.24 * _n_rim_b9)) + (0.12 * _n_swirl_b10)) * clampf((float((1 - absf(_n_u_b7)))/0.18),0.0,1.0)) * (maxf(0,(float((1 - _n_k_b8))/0.3)) if _S.truth((_n_k_b8 > 0.7)) else 1)) * ((float(_n_h_b4)/4) if _S.truth((_n_h_b4 < 4)) else 1))
	if _S.truth((_n_a_b11 < 0.03)):
		return null
	_S.invoke(_n_p,"blendPx",[_n_sx_b2, _n_sy_b3, (_S.index_value(_n_C,6) if _S.truth((_n_rim_b9 > 0.5)) else (_S.index_value(_n_C,5) if _S.truth((_n_swirl_b10 > 0.6)) else _S.index_value(_n_C,4))), _n_a_b11])
	if _S.truth(((_n_rim_b9 > 0.3) if _S.truth((_n_rim_b9 > 0.3)) else (_n_swirl_b10 > 0.75))):
		_S.invoke(_n_p,"add",[_n_sx_b2, _n_sy_b3, _S.index_value(_n_C,5), ((0.16 * maxf(_n_rim_b9,(_n_swirl_b10 - 0.5))) * (1 - (_n_k_b8 * 0.5)))])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_o_b3 = _S.arg(_args,3)
	var _n_front_b4 = _S.arg(_args,4)
	var _n_D_b5 = _S.named_value(_n_meta,"duration")
	var _n_H_b6 = _S.named_value(_n_o_b3,"height")
	var _n_ph_b7 = (float(_n_t_b2)/_n_D_b5)
	_S.call_value(_n_cycle,[_n_t_b2, _n_D_b5, 76, _S.named_value(_n_o_b3,"seed"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f6"), _S.function_value(_S.capture(_parent,{"H":_n_H_b6,"front":_n_front_b4,"ph":_n_ph_b7,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f7")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.9, 1.6])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_radius = _S.read(_parent,"radius")
	var _n_front = _S.read(_parent,"front")
	var _n_axis = _S.read(_parent,"axis")
	var _n_ph = _S.read(_parent,"ph")
	var _n_TILT = _S.read(_parent,"TILT")
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_h0_b4 = _S.invoke(_n_r_b2,"range",[0, (_n_H * 0.6)])
	var _n_h_b5 = (_n_h0_b4 + (_n_age_b0 * _S.invoke(_n_r_b2,"range",[14, 30])))
	var _n_k_b6 = (float(_n_age_b0)/_n_life_b1)
	if _S.truth((_n_h_b5 > (_n_H + 8))):
		return null
	var _n_w_b7 = (_S.invoke(_n_r_b2,"range",[7, 11]) * (1.5 - (float(_n_h_b5)/_n_H)))
	var _n_th_b8 = (_S.invoke(_n_r_b2,"range",[0, _n_TAU]) + (_n_age_b0 * _n_w_b7))
	var _n_out_b9 = ((1 + _S.invoke(_n_r_b2,"range",[0.05, 0.3])) + minf(0.35,(maxf(0,(_n_h_b5 - (_n_H * 0.82))) * 0.04)))
	var _n_R_b10 = (_S.call_value(_n_radius,[minf(_n_h_b5,_n_H), _n_H]) * _n_out_b9)
	var _n_s_b11 = sin(_n_th_b8)
	if _S.truth(_S.binary("!==",(_n_s_b11 >= 0),_n_front)):
		return null
	var _n_x_b12 = (_S.call_value(_n_axis,[minf(_n_h_b5,_n_H), _n_H, _n_ph]) + (cos(_n_th_b8) * _n_R_b10))
	var _n_y_b13 = ((-_n_h_b5) + ((_n_s_b11 * _n_R_b10) * _n_TILT))
	var _n_big_b14 = _S.binary("===",fmod(_n_i_b3,5),0)
	var _n_fade_b15 = (minf(1,(float(_n_age_b0)/0.1)) * ((float((1 - _n_k_b6))/0.2) if _S.truth((_n_k_b6 > 0.8)) else 1))
	if _S.truth((_n_fade_b15 <= 0)):
		return null
	var _n_th2_b16 = (_n_th_b8 - 0.25)
	var _n_x2_b17 = (_S.call_value(_n_axis,[minf(_n_h_b5,_n_H), _n_H, _n_ph]) + (cos(_n_th2_b16) * _n_R_b10))
	var _n_y2_b18 = (((-_n_h_b5) + 2) + ((sin(_n_th2_b16) * _n_R_b10) * _n_TILT))
	if _S.truth(_n_front):
		_S.invoke(_n_p,"line",[_n_x2_b17, _n_y2_b18, _n_x_b12, _n_y_b13, _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f8"), _S.function_value(_S.capture(_parent,{"fade":_n_fade_b15,"this":_n_this}),"_f9")])
		_S.invoke(_n_p,"dot",[_n_x_b12, _n_y_b13, (_n_WHITE if _S.truth(_n_big_b14) else (_n_WHITE if _S.truth(_S.invoke(_n_r_b2,"chance",[0.5])) else _S.index_value(_n_C,6))), _n_fade_b15])
		if _S.truth(_n_big_b14):
			for _iter_0 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
				var _tuple_1 = _iter_0
				var _n_dx_b19 = _S.prop(_tuple_1,0)
				var _n_dy_b20 = _S.prop(_tuple_1,1)
				_S.invoke(_n_p,"dot",[(_n_x_b12 + _n_dx_b19), (_n_y_b13 + _n_dy_b20), _S.index_value(_n_C,6), _n_fade_b15])
			_S.invoke(_n_p,"glow",[_n_x_b12, _n_y_b13, 5, _S.index_value(_n_C,5), (0.35 * _n_fade_b15)])
	else:
		_S.invoke(_n_p,"line",[_n_x2_b17, _n_y2_b18, _n_x_b12, _n_y_b13, _S.index_value(_n_C,3), _S.function_value(_S.capture(_parent,{"fade":_n_fade_b15,"this":_n_this}),"_f10")])
		_S.invoke(_n_p,"dot",[_n_x_b12, _n_y_b13, (_S.index_value(_n_C,5) if _S.truth(_n_big_b14) else _S.index_value(_n_C,4)), _n_fade_b15])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 > 0.6)) else _S.index_value(_n_C,4))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_fade = _S.read(_parent,"fade")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_u_b0 * _n_fade)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_fade = _S.read(_parent,"fade")
	var _n_u_b0 = _S.arg(_args,0)
	return ((_n_u_b0 * _n_fade) * 0.8)
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_o_b3 = _S.arg(_args,3)
	var _n_front_b4 = _S.arg(_args,4)
	var _n_D_b5 = _S.named_value(_n_meta,"duration")
	var _n_ph_b6 = (float(_n_t_b2)/_n_D_b5)
	_S.call_value(_n_cycle,[_n_t_b2, _n_D_b5, 12, (_S.named_value(_n_o_b3,"seed") + 5), _S.function_value(_S.capture(_parent,{"this":_this}),"_f12"), _S.function_value(_S.capture(_parent,{"front":_n_front_b4,"ph":_n_ph_b6,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f13")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.8, 1.2])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_front = _S.read(_parent,"front")
	var _n_axis = _S.read(_parent,"axis")
	var _n_ph = _S.read(_parent,"ph")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_this = _S.read(_parent,"this")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_th_b3 = (_S.invoke(_n_r_b2,"range",[0, _n_TAU]) + (_n_age_b0 * _S.invoke(_n_r_b2,"range",[4, 6])))
	var _n_R_b4 = (9 + (_n_age_b0 * _S.invoke(_n_r_b2,"range",[8, 16])))
	var _n_s_b5 = sin(_n_th_b3)
	var _n_k_b6 = (float(_n_age_b0)/_n_life_b1)
	if _S.truth(_S.binary("!==",(_n_s_b5 >= 0),_n_front)):
		return null
	var _n_x_b7 = (_S.call_value(_n_axis,[0, 1, _n_ph]) + (cos(_n_th_b3) * _n_R_b4))
	var _n_y_b8 = (((-2) - (_n_age_b0 * _S.invoke(_n_r_b2,"range",[4, 10]))) + ((_n_s_b5 * _n_R_b4) * 0.2))
	var _n_rad_b9 = (2 + (4 * _n_k_b6))
	var _n_a_b10 = ((0.5 * pow((1 - _n_k_b6),1.2)) * minf(1,(float(_n_age_b0)/0.1)))
	_S.invoke(_n_p,"disc",[_n_x_b7, _n_y_b8, _n_rad_b9, (_S.index_value(_n_C,6) if _S.truth(_n_front) else _S.index_value(_n_C,5)), _S.function_value(_S.capture(_parent,{"a":_n_a_b10,"this":_n_this}),"_f14")])
	_S.invoke(_n_p,"disc",[(_n_x_b7 - (_n_rad_b9 * 0.25)), (_n_y_b8 - (_n_rad_b9 * 0.3)), (_n_rad_b9 * 0.5), _n_WHITE, _S.function_value(_S.capture(_parent,{"a":_n_a_b10,"k":_n_k_b6,"this":_n_this}),"_f15")])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_a * (1 - (_n_d_b0 * _n_d_b0)))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_k = _S.read(_parent,"k")
	var _n_d_b0 = _S.arg(_args,0)
	return (((_n_a * 0.5) * (1 - (_n_d_b0 * _n_d_b0))) * (1 - _n_k))
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_foot = _S.read(_parent,"foot")
	var _n_streaks = _S.read(_parent,"streaks")
	var _n_orbiters = _S.read(_parent,"orbiters")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_H_b4 = _S.named_value(_n_o_b2,"height")
	var _n_ph_b5 = (float(_n_t_b1)/_S.named_value(_n_meta,"duration"))
	if true:
		var _n_x_b6 = (-30)
		while _S.truth((_n_x_b6 <= 30)):
			var _n_d_b7 = (float(absf(_n_x_b6))/30)
			var _n_hgt_b8 = floori(((1 - (_n_d_b7 * _n_d_b7)) * (1.5 + (_S.MathFX.rand([_n_x_b6,3]) * 1.5)))+0.5)
			if true:
				var _n_j_b9 = 0
				while _S.truth((_n_j_b9 < _n_hgt_b8)):
					_S.invoke(_n_p_b0,"px",[_n_x_b6, (-_n_j_b9), (_n_WHITE if _S.truth(_S.binary("===",_n_j_b9,(_n_hgt_b8 - 1))) else _S.index_value(_n_C_b3,5))])
					_n_j_b9 += 1.0
			_S.invoke(_n_p_b0,"dot",[_n_x_b6, 0, _S.index_value(_n_C_b3,6), (1 - (_n_d_b7 * 0.5))])
			_S.invoke(_n_p_b0,"dot",[_n_x_b6, 1, _S.index_value(_n_C_b3,4), (0.8 - (_n_d_b7 * 0.6))])
			_n_x_b6 += 1.0
	_S.invoke(_n_p_b0,"glow",[0, (-2), 40, _S.index_value(_n_C_b3,4), 0.22])
	_S.call_value(_n_foot,[_n_p_b0, _n_C_b3, _n_t_b1, _n_o_b2, false])
	_S.call_value(_n_streaks,[_n_p_b0, _n_C_b3, _n_t_b1, _n_o_b2, false])
	_S.call_value(_n_orbiters,[_n_p_b0, _n_C_b3, _n_t_b1, _n_o_b2, false])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_body = _S.read(_parent,"body")
	var _n_axis = _S.read(_parent,"axis")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_streaks = _S.read(_parent,"streaks")
	var _n_orbiters = _S.read(_parent,"orbiters")
	var _n_foot = _S.read(_parent,"foot")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_H_b4 = _S.named_value(_n_o_b2,"height")
	var _n_ph_b5 = (float(_n_t_b1)/_S.named_value(_n_meta,"duration"))
	_S.call_value(_n_body,[_n_p_b0, _n_C_b3, _n_ph_b5, _n_H_b4])
	_S.invoke(_n_p_b0,"glow",[_S.call_value(_n_axis,[(_n_H_b4 * 0.45), _n_H_b4, _n_ph_b5]), ((-_n_H_b4) * 0.45), 40, _S.index_value(_n_C_b3,4), 0.3])
	_S.invoke(_n_p_b0,"glow",[_S.call_value(_n_axis,[(_n_H_b4 * 0.15), _n_H_b4, _n_ph_b5]), ((-_n_H_b4) * 0.15), 18, _S.index_value(_n_C_b3,5), (0.4 + (0.1 * sin(((_n_TAU * _n_ph_b5) * 4))))])
	_S.invoke(_n_p_b0,"glow",[_S.call_value(_n_axis,[(_n_H_b4 * 0.05), _n_H_b4, _n_ph_b5]), (-3), 10, _n_WHITE, 0.3])
	_S.call_value(_n_streaks,[_n_p_b0, _n_C_b3, _n_t_b1, _n_o_b2, true])
	_S.call_value(_n_orbiters,[_n_p_b0, _n_C_b3, _n_t_b1, _n_o_b2, true])
	_S.call_value(_n_foot,[_n_p_b0, _n_C_b3, _n_t_b1, _n_o_b2, true])
	_S.call_value(_n_cycle,[_n_t_b1, _S.named_value(_n_meta,"duration"), 10, (_S.named_value(_n_o_b2,"seed") + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f18"), _S.function_value(_S.capture(_parent,{"H":_n_H_b4,"ph":_n_ph_b5,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f19")])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.9, 1.3])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_radius = _S.read(_parent,"radius")
	var _n_H = _S.read(_parent,"H")
	var _n_axis = _S.read(_parent,"axis")
	var _n_ph = _S.read(_parent,"ph")
	var _n_TILT = _S.read(_parent,"TILT")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_this = _S.read(_parent,"this")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_th_b3 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_R_b4 = (_S.call_value(_n_radius,[_n_H, _n_H]) * (0.6 + (_n_age_b0 * 0.9)))
	var _n_k_b5 = (float(_n_age_b0)/_n_life_b1)
	var _n_rad_b6 = (3 + (6 * _n_k_b5))
	var _n_Rc_b7 = minf(_n_R_b4,36)
	var _n_x_b8 = (_S.call_value(_n_axis,[_n_H, _n_H, _n_ph]) + (cos(_n_th_b3) * _n_Rc_b7))
	var _n_y_b9 = ((((-_n_H) - 2) - (_n_age_b0 * 4)) + ((sin(_n_th_b3) * _n_Rc_b7) * _n_TILT))
	var _n_a_b10 = ((0.24 * (1 - _n_k_b5)) * minf(1,(float(_n_age_b0)/0.15)))
	_S.invoke(_n_p,"disc",[_n_x_b8, _n_y_b9, (_n_rad_b6 * 0.8), _S.index_value(_n_C,6), _S.function_value(_S.capture(_parent,{"a":_n_a_b10,"this":_n_this}),"_f20")])
	_S.invoke(_n_p,"glow",[_n_x_b8, _n_y_b9, (_n_rad_b6 * 1.5), _S.index_value(_n_C,4), (0.08 * (1 - _n_k_b5))])
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_a * (1 - (_n_d_b0 * _n_d_b0)))
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_h_b0 = _S.arg(_args,0)
	var _n_H_b1 = _S.arg(_args,1)
	return (4 + (28 * pow(clampf((float(_n_h_b0)/_n_H_b1),0.0,1.0),1.35)))
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_h_b0 = _S.arg(_args,0)
	var _n_H_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	return ((((5 * sin(((_n_TAU * _n_ph_b2) + (_n_h_b0 * 0.05)))) + (1.5 * sin((((_n_TAU * _n_ph_b2) * 2) - (_n_h_b0 * 0.11))))) * (float(_n_h_b0)/_n_H_b1)) - (2 * (float(_n_h_b0)/_n_H_b1)))
	return null
