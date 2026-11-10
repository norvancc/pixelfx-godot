@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/blessing.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f1":"blessing_back"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "GOLD", _S.import_value("fx/holy/_lib.js", "GOLD"))
	_S.define(_e, "shapeOf", _S.import_value("fx/holy/_lib.js", "shapeOf"))
	_S.define(_e, "landings", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Blessing"}, {"desc": "A soft cone of light rests on the character from above; sparkles drift down through it, twinkling, and wink out where they land on the head and shoulders."}, {"tags": ["holy", "blessing", "buff", "light", "sparkle", "character", "loop"]}, {"size": [80, 128]}, {"origin": [40, 108]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "GOLD")}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "OPEN", _S.merge([{"turn": 1.15}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 31)}, {"bx": 14}, {"by": _S.unary("-", 31)}, {"hy": _S.unary("-", 1)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "OPEN")], [0.75, _S.merge([_S.read(_e, "OPEN"), {"fy": _S.unary("-", 33)}, {"by": _S.unary("-", 33)}])], [1.5, _S.merge([_S.read(_e, "OPEN"), {"crouch": _S.unary("-", 1)}, {"fy": _S.unary("-", 35)}, {"by": _S.unary("-", 35)}])], [2.25, _S.merge([_S.read(_e, "OPEN"), {"fy": _S.unary("-", 33)}, {"by": _S.unary("-", 33)}])], [3, _S.read(_e, "OPEN")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "TOP", _S.unary("-", 108))
	_S.define(_e, "T", 3)
	_S.define(_e, "halfW", _S.function_value(_e, "_f8"))
	_S.define(_e, "RAYS", [[_S.unary("-", 0.62), 0.16, 1, 0.3], [_S.unary("-", 0.2), 0.2, 2, 1.7], [0.22, 0.14, 1, 4.1], [0.6, 0.18, 2, 2.6]])
	_S.define(_e, "ray", _S.function_value(_e, "_f9"))
	_S.define(_e, "LANDS", _S.construct(_S.read(_e, "Map"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_LANDS = _S.read(_parent,"LANDS")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_o_b0 = _S.arg(_args,0)
	var _n_S_b1 = _S.arg(_args,1)
	var _n_key_b2 = ("" + _S.string(_S.named_value(_n_o_b0,"seed")) + ":" + _S.string(_S.named_value(_n_S_b1,"x")) + ":" + _S.string(_S.named_value(_n_S_b1,"y")) + "")
	if _S.truth(_S.invoke(_n_LANDS,"has",[_n_key_b2])):
		return _S.invoke(_n_LANDS,"get",[_n_key_b2])
	var _n_out_b3 = []
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < 20)):
			var _n_R_b5 = _S.MathFX.rng([_S.named_value(_n_o_b0,"seed"),_n_i_b4])
			var _n_q_b6 = _S.invoke(_n_R_b5,"range",[(-0.9), 0.9])
			var _n_v_b7 = _S.invoke(_n_R_b5,"range",[22, 34])
			var _n_sway_b8 = _S.invoke(_n_R_b5,"range",[1, 3])
			var _n_ph_b9 = _S.invoke(_n_R_b5,"range",[0, _n_TAU])
			var _n_size_b10 = _S.invoke(_n_R_b5,"range",[0.8, 2.4])
			var _n_land_b11 = INF
			if true:
				var _n_a_b12 = 0
				while _S.truth((_n_a_b12 < 6)):
					var _n_y_b13 = ((_n_TOP + 6) + (_n_v_b7 * _n_a_b12))
					var _n_x_b14 = ((_n_q_b6 * _S.call_value(_n_halfW,[_n_y_b13])) + (sin(((_n_a_b12 * 2.2) + _n_ph_b9)) * _n_sway_b8))
					if _S.truth(((_n_y_b13 >= (-1)) if _S.truth((_n_y_b13 >= (-1))) else _S.invoke(_n_S_b1,"at",[_n_x_b14, _n_y_b13]))):
						_n_land_b11 = _n_a_b12
						break
					_n_a_b12 += 0.02
			_S.invoke(_n_out_b3,"push",[{"q":_n_q_b6,"v":_n_v_b7,"sway":_n_sway_b8,"ph":_n_ph_b9,"size":_n_size_b10,"land":_n_land_b11}])
			_n_i_b4 += 1.0
	_S.invoke(_n_LANDS,"set",[_n_key_b2, _n_out_b3])
	return _n_out_b3
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_T = _S.read(_parent,"T")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_RAYS = _S.read(_parent,"RAYS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	_S.invoke(_n_p_b0,"each",[(-24), _n_TOP, 24, 0.5, _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f2")])
	for _iter_0 in _S.array([_S.index_value(_n_RAYS,1), _S.index_value(_n_RAYS,2)]):
		var _tuple_1 = _iter_0
		var _n_o2_b4 = _S.prop(_tuple_1,0)
		var _n_k_b5 = _S.prop(_tuple_1,2)
		var _n_ph_b6 = _S.prop(_tuple_1,3)
		if true:
			var _n_y_b7 = _n_TOP
			while _S.truth((_n_y_b7 < (-1))):
				var _n_pulse_b8 = (0.5 + (0.5 * sin((((_n_y_b7 * 0.11) - (((float(_n_t_b1)/_n_T) * _n_TAU) * 3)) + _n_ph_b6))))
				_S.invoke(_n_p_b0,"dot",[(_n_o2_b4 * _S.call_value(_n_halfW,[_n_y_b7])), _n_y_b7, (_n_WHITE if _S.truth((_n_pulse_b8 > 0.85)) else _S.index_value(_n_C_b3,6)), (((0.1 + (0.45 * _n_pulse_b8)) * (0.5 + (0.5 * sin(((((float(_n_t_b1)/_n_T) * _n_TAU) * _n_k_b5) + _n_ph_b6))))) * _S.MathFX.smooth(_n_TOP,(_n_TOP + 20),_n_y_b7))])
				_n_y_b7 += 1.0
	_S.invoke(_n_p_b0,"glow",[0, (-4), 30, _S.index_value(_n_C_b3,4), 0.22])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_ray = _S.read(_parent,"ray")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_t = _S.read(_parent,"t")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_sx_b2 = _S.arg(_args,2)
	var _n_sy_b3 = _S.arg(_args,3)
	var _n_I_b4 = (_S.call_value(_n_ray,[(float(_n_x_b0)/_S.call_value(_n_halfW,[_n_y_b1])), _n_t]) * (0.6 + (0.4 * _S.MathFX.smooth(_n_TOP,0,_n_y_b1))))
	if _S.truth((_n_I_b4 < 0.02)):
		return null
	_S.invoke(_n_p,"blendPx",[_n_sx_b2, _n_sy_b3, _S.index_value(_n_C,6), (_n_I_b4 * 0.13)])
	_S.invoke(_n_p,"add",[_n_sx_b2, _n_sy_b3, _S.index_value(_n_C,4), (_n_I_b4 * 0.22)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_shapeOf = _S.read(_parent,"shapeOf")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_landings = _S.read(_parent,"landings")
	var _n_T = _S.read(_parent,"T")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_A_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_S_b5 = (_S.call_value(_n_shapeOf,[_n_A_b4]) if _S.truth(_n_A_b4) else null)
	if _S.truth(_n_A_b4):
		var _n_m_b6 = _S.named_value(_n_A_b4,"mask")
		if true:
			var _n_i_b7 = 0
			while _S.truth((_n_i_b7 < _S.named_value(_n_m_b6,"w"))):
				if true:
					var _n_j_b8 = 0
					while _S.truth((_n_j_b8 < _S.named_value(_n_m_b6,"h"))):
						var _n_c_b9 = _S.index_value(_S.named_value(_n_A_b4,"pixels"),((_n_j_b8 * _S.named_value(_n_m_b6,"w")) + _n_i_b7))
						if _S.truth((not _S.truth(_n_c_b9) if _S.truth(not _S.truth(_n_c_b9)) else (_S.ColorFX.luma(_n_c_b9) < 0.15))):
							_n_j_b8 += 1.0
							continue
						_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_A_b4,"x") + _n_i_b7), (_S.named_value(_n_A_b4,"y") + _n_j_b8), _S.ColorFX.mix(_n_c_b9,_S.index_value(_n_C_b3,6),0.35)])
						break
						_n_j_b8 += 1.0
				_n_i_b7 += 1.0
		_S.invoke(_n_p_b0,"glow",[0, (-30), 20, _S.index_value(_n_C_b3,5), 0.22])
	if true:
		var _n_y_b10 = 0
		while _S.truth((_n_y_b10 <= 3)):
			if true:
				var _n_x_b11 = (-24)
				while _S.truth((_n_x_b11 <= 24)):
					var _n_u_b12 = _S.Bridge.hypot([(float(_n_x_b11)/24), (float(_n_y_b10)/4)])
					if _S.truth((_n_u_b12 >= 1)):
						_n_x_b11 += 1.0
						continue
					_S.invoke(_n_p_b0,"dot",[_n_x_b11, _n_y_b10, ((_S.index_value(_n_C_b3,5) if _S.truth(_n_y_b10) else _n_WHITE) if _S.truth((_n_u_b12 < 0.3)) else (_S.index_value(_n_C_b3,5) if _S.truth((_n_u_b12 < 0.6)) else (_S.index_value(_n_C_b3,4) if _S.truth((_n_u_b12 < 0.85)) else _S.index_value(_n_C_b3,3)))), (sqrt((1 - _n_u_b12)) if _S.truth(_S.binary("===",_n_y_b10,0)) else ((1 - _n_u_b12) * 0.7))])
					_n_x_b11 += 1.0
			_n_y_b10 += 1.0
	if _S.truth(_n_S_b5):
		var _n_L_b13 = _S.call_value(_n_landings,[_n_o_b2, _n_S_b5])
		_S.call_value(_n_cycle,[_n_t_b1, _n_T, _S.prop(_n_L_b13,"length"), _S.named_value(_n_o_b2,"seed"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"L":_n_L_b13,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f5")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_T, 16, (_S.named_value(_n_o_b2,"seed") + 9), _S.function_value(_S.capture(_parent,{"this":_this}),"_f6"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f7")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return 3
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_s_b4 = _S.index_value(_n_L,_n_i_b3)
	var _n_y_b5 = ((_n_TOP + 6) + (_S.named_value(_n_s_b4,"v") * _n_age_b0))
	var _n_x_b6 = ((_S.named_value(_n_s_b4,"q") * _S.call_value(_n_halfW,[_n_y_b5])) + (sin(((_n_age_b0 * 2.2) + _S.named_value(_n_s_b4,"ph"))) * _S.named_value(_n_s_b4,"sway")))
	var _n_fade_b7 = minf(1,(float(_n_age_b0)/0.3))
	if _S.truth((_n_age_b0 > _S.named_value(_n_s_b4,"land"))):
		var _n_w_b9 = (float((_n_age_b0 - _S.named_value(_n_s_b4,"land")))/0.14)
		if _S.truth((_n_w_b9 < 1)):
			var _n_ly_b10 = ((_n_TOP + 6) + (_S.named_value(_n_s_b4,"v") * _S.named_value(_n_s_b4,"land")))
			var _n_lx_b11 = ((_S.named_value(_n_s_b4,"q") * _S.call_value(_n_halfW,[_n_ly_b10])) + (sin(((_S.named_value(_n_s_b4,"land") * 2.2) + _S.named_value(_n_s_b4,"ph"))) * _S.named_value(_n_s_b4,"sway")))
			_S.call_value(_n_sparkle,[_n_p, _n_lx_b11, _n_ly_b10, ((3 * (1 - _n_w_b9)) + 1), _n_WHITE, _S.index_value(_n_C,6), (0.5 * (1 - _n_w_b9))])
		return null
	var _n_tw_b8 = (0.6 + (0.4 * sin(((_n_age_b0 * (7 + fmod(_n_i_b3,4))) + _S.named_value(_n_s_b4,"ph")))))
	if _S.truth((_S.named_value(_n_s_b4,"size") > 1.2)):
		_S.call_value(_n_sparkle,[_n_p, _n_x_b6, _n_y_b5, ((_S.named_value(_n_s_b4,"size") * _n_tw_b8) * _n_fade_b7), (_n_WHITE if _S.truth((_n_tw_b8 > 0.85)) else _S.index_value(_n_C,6)), _S.index_value(_n_C,5), (0.35 * _n_fade_b7)])
	else:
		_S.invoke(_n_p,"dot",[_n_x_b6, _n_y_b5, (_n_WHITE if _S.truth((_n_tw_b8 > 0.8)) else _S.index_value(_n_C,6)), _n_fade_b7])
		_S.invoke(_n_p,"glow",[_n_x_b6, _n_y_b5, 3, _S.index_value(_n_C,5), (0.35 * _n_fade_b7)])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[1.2, 2.4])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_halfW = _S.read(_parent,"halfW")
	var _n_ray = _S.read(_parent,"ray")
	var _n_t = _S.read(_parent,"t")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_y_b4 = (((_n_TOP + 10) + _S.invoke(_n_R_b2,"range",[0, 90])) + (_n_u_b3 * _S.invoke(_n_R_b2,"range",[6, 14])))
	var _n_q_b5 = _S.invoke(_n_R_b2,"range",[(-1), 1])
	var _n_x_b6 = ((_n_q_b5 * _S.call_value(_n_halfW,[_n_y_b4])) + (sin(((_n_age_b0 * 1.7) + (_n_q_b5 * 5))) * 1.5))
	var _n_k_b7 = (sin((_n_u_b3 * PI)) * _S.call_value(_n_ray,[_n_q_b5, _n_t]))
	if _S.truth((_n_k_b7 > 0.12)):
		_S.invoke(_n_p,"dot",[_n_x_b6, _n_y_b4, (_n_WHITE if _S.truth((_n_k_b7 > 0.45)) else _S.index_value(_n_C,6)), minf(1,(_n_k_b7 * 2.2))])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_y_b0 = _S.arg(_args,0)
	return _S.numeric_lerp(5,20,(float((_n_y_b0 - _n_TOP))/(-_n_TOP)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_T = _S.read(_parent,"T")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RAYS = _S.read(_parent,"RAYS")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_I_b2 = (0.3 * maxf(0,(1 - (_n_q_b0 * _n_q_b0))))
	for _iter_0 in _S.array(_n_RAYS):
		var _tuple_1 = _iter_0
		var _n_o_b3 = _S.prop(_tuple_1,0)
		var _n_w_b4 = _S.prop(_tuple_1,1)
		var _n_k_b5 = _S.prop(_tuple_1,2)
		var _n_ph_b6 = _S.prop(_tuple_1,3)
		_n_I_b2 += ((exp((-pow((float((_n_q_b0 - _n_o_b3))/_n_w_b4),2))) * (0.55 + (0.45 * sin(((((float(_n_t_b1)/_n_T) * _n_TAU) * _n_k_b5) + _n_ph_b6))))) * 0.6)
	return (_n_I_b2 * _S.MathFX.smooth(1.25,0.75,absf(_n_q_b0)))
	return null
