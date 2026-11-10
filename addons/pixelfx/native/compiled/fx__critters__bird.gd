@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/bird.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "wing", _S.function_value(_e, "_f0"))
	_S.define(_e, "lift", _S.function_value(_e, "_f1"))
	_S.define(_e, "bird", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Bird"}, {"desc": "A songbird flies in place: bursts of wingbeats that lift its body on each downstroke, a glide on spread wings, its tail fanning, a loose feather drifting away."}, {"tags": ["critter", "bird", "flying", "animal", "loop"]}, {"size": [112, 80]}, {"origin": [56, 40]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0a0e1e", "#18244a", "#24407a", "#3466aa", "#5a94d4", "#9cc8f0", "#eaf6ff"]}, {"breast": ["#4a1a0e", "#a8441c", "#e8783a", "#ffb070"]}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 26), _S.unary("-", 26), 52, 46]))
	_S.define(_e, "BEAK", _S.call_value(_S.read(_e, "hex"), ["#f0b030"]))
	_S.define(_e, "BEAKD", _S.call_value(_S.read(_e, "hex"), ["#a86a18"]))
	_S.define(_e, "POSE", _S.merge([{"up": [[0, 0], [_S.unary("-", 1), _S.unary("-", 8)], [_S.unary("-", 5), _S.unary("-", 15)], [_S.unary("-", 8), _S.unary("-", 13.5)], [_S.unary("-", 10.5), _S.unary("-", 10.5)], [_S.unary("-", 11), _S.unary("-", 7)], [_S.unary("-", 9), _S.unary("-", 3)], [_S.unary("-", 6), 1]]}, {"mid": [[0, 0], [_S.unary("-", 3), _S.unary("-", 2.5)], [_S.unary("-", 9), _S.unary("-", 2.5)], [_S.unary("-", 10.5), _S.unary("-", 0.5)], [_S.unary("-", 10), 1.2], [_S.unary("-", 8.5), 2], [_S.unary("-", 7), 2.2], [_S.unary("-", 5), 2]]}, {"down": [[0, 0], [_S.unary("-", 1), 6], [_S.unary("-", 3.5), 12], [_S.unary("-", 6), 11], [_S.unary("-", 7.5), 8.5], [_S.unary("-", 8), 6], [_S.unary("-", 7), 3], [_S.unary("-", 5), 2]]}, {"fold": [[0, 0], [_S.unary("-", 3), _S.unary("-", 4)], [_S.unary("-", 10), _S.unary("-", 5.5)], [_S.unary("-", 11), _S.unary("-", 4)], [_S.unary("-", 10), _S.unary("-", 2.5)], [_S.unary("-", 8.5), _S.unary("-", 1)], [_S.unary("-", 7), 0.5], [_S.unary("-", 5), 1.5]]}, {"glide": [[0, 0], [_S.unary("-", 2), _S.unary("-", 5)], [_S.unary("-", 7), _S.unary("-", 10)], [_S.unary("-", 10), _S.unary("-", 9)], [_S.unary("-", 12), _S.unary("-", 6.5)], [_S.unary("-", 11.5), _S.unary("-", 3.5)], [_S.unary("-", 9), _S.unary("-", 1)], [_S.unary("-", 6), 1]]}]))
	_S.define(_e, "mixPose", _S.function_value(_e, "_f9"))
	_S.define(_e, "FLAPS", 4)
	_S.define(_e, "GLIDE", 1.5)
	_S.define(_e, "SH", [1, _S.unary("-", 2)])
	_S.define(_e, "wingPts", _S.function_value(_e, "_f11"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_GLIDE = _S.read(_parent,"GLIDE")
	var _n_FLAPS = _S.read(_parent,"FLAPS")
	var _n_ease = _S.read(_parent,"ease")
	var _n_mixPose = _S.read(_parent,"mixPose")
	var _n_POSE = _S.read(_parent,"POSE")
	var _n_t_b0 = _S.arg(_args,0)
	_n_t_b0 = _S.call_value(_n_wrap,[_n_t_b0, _n_D])
	if _S.truth((_n_t_b0 < _n_GLIDE)):
		var _n_u_b4 = fmod(((float(_n_t_b0)/_n_GLIDE) * _n_FLAPS),1)
		if _S.truth((_n_u_b4 < 0.4)):
			var _n_k_b6 = _S.invoke(_n_ease,"inOutSine",[(float(_n_u_b4)/0.4)])
			return {"pts":(_S.call_value(_n_mixPose,[_S.named_value(_n_POSE,"up"), _S.named_value(_n_POSE,"mid"), (_n_k_b6 * 2)]) if _S.truth((_n_k_b6 < 0.5)) else _S.call_value(_n_mixPose,[_S.named_value(_n_POSE,"mid"), _S.named_value(_n_POSE,"down"), ((_n_k_b6 * 2) - 1)])),"down":true,"u":_n_u_b4}
		var _n_k_b5 = _S.invoke(_n_ease,"inOutSine",[(float((_n_u_b4 - 0.4))/0.6)])
		return {"pts":(_S.call_value(_n_mixPose,[_S.named_value(_n_POSE,"down"), _S.named_value(_n_POSE,"fold"), (_n_k_b5 * 2)]) if _S.truth((_n_k_b5 < 0.5)) else _S.call_value(_n_mixPose,[_S.named_value(_n_POSE,"fold"), _S.named_value(_n_POSE,"up"), ((_n_k_b5 * 2) - 1)])),"down":false,"u":_n_u_b4}
	var _n_g_b1 = (float((_n_t_b0 - _n_GLIDE))/(_n_D - _n_GLIDE))
	var _n_into_b2 = _S.MathFX.smooth(0,0.15,_n_g_b1)
	var _n_out_b3 = _S.MathFX.smooth(0.85,1,_n_g_b1)
	return {"pts":_S.call_value(_n_mixPose,[_S.call_value(_n_mixPose,[_S.named_value(_n_POSE,"up"), _S.named_value(_n_POSE,"glide"), _n_into_b2]), _S.named_value(_n_POSE,"up"), _n_out_b3]),"down":false,"u":0}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_wing = _S.read(_parent,"wing")
	var _n_GLIDE = _S.read(_parent,"GLIDE")
	var _n_t_b0 = _S.arg(_args,0)
	_n_t_b0 = _S.call_value(_n_wrap,[_n_t_b0, _n_D])
	var _n_y_b1 = 0
	if true:
		var _n_k_b2 = 0
		while _S.truth((_n_k_b2 < 6)):
			if _S.truth(_S.named_value(_S.call_value(_n_wing,[(_n_t_b0 - (_n_k_b2 * 0.02))]),"down")):
				_n_y_b1 -= 0.45
			_n_k_b2 += 1.0
	if _S.truth((_n_t_b0 >= _n_GLIDE)):
		_n_y_b1 += (2.2 * sin((PI * (float((_n_t_b0 - _n_GLIDE))/(_n_D - _n_GLIDE)))))
	return (_n_y_b1 + 1.2)
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_wingPts = _S.read(_parent,"wingPts")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_Br_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	_S.invoke(_n_g_b0,"clear",[])
	_S.invoke(_n_g_b0,"poly",[_S.call_value(_n_wingPts,[_n_w_b4, true]), _S.index_value(_n_C_b1,1)])
	var _n_tf_b5 = (0.25 + (0.35 * sin((((float(_n_t_b3)/_n_D) * _n_TAU) * 2))))
	if true:
		var _n_i_b9 = 0
		while _S.truth((_n_i_b9 < 3)):
			var _n_a_b10 = ((PI + (((_n_i_b9 - 1) * _n_tf_b5) * 0.5)) + 0.1)
			var _n_L_b11 = (9 - absf((_n_i_b9 - 1)))
			_S.invoke(_n_g_b0,"poly",[[[(-7), (-2.4)], [((-7) + (cos(_n_a_b10) * _n_L_b11)), (((-1) + (sin(_n_a_b10) * _n_L_b11)) - 1.2)], [((-7) + (cos(_n_a_b10) * _n_L_b11)), (((-1) + (sin(_n_a_b10) * _n_L_b11)) + 1.2)], [(-7), 0.6]], (_S.index_value(_n_C_b1,3) if _S.truth(_S.binary("===",_n_i_b9,0)) else _S.index_value(_n_C_b1,2))])
			_n_i_b9 += 1.0
	var _n_inBody_b6 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f3")
	_S.invoke(_n_g_b0,"shade",[(-10), (-9), 12, 6, _S.function_value(_S.capture(_parent,{"inBody":_n_inBody_b6,"Br":_n_Br_b2,"C":_n_C_b1,"this":_this}),"_f4")])
	_S.invoke(_n_g_b0,"poly",[[[10.5, (-4.5)], [14.5, (-3)], [10.5, (-2)]], _S.function_value(_S.capture(_parent,{"this":_this}),"_f5")])
	_S.invoke(_n_g_b0,"set",[8, (-4), _S.index_value(_n_C_b1,0)])
	_S.invoke(_n_g_b0,"set",[8, (-5), _S.index_value(_n_C_b1,6)])
	_S.invoke(_n_g_b0,"set",[9, (-4), _S.index_value(_n_C_b1,0)])
	_S.invoke(_n_g_b0,"line",[5, (-7), 9, (-6.5), _S.index_value(_n_C_b1,2)])
	var _n_wp_b7 = _S.call_value(_n_wingPts,[_n_w_b4, false])
	var _n_edge_b8 = _S.function_value(_S.capture(_parent,{"wp":_n_wp_b7,"this":_this}),"_f6")
	_S.invoke(_n_g_b0,"poly",[_n_wp_b7, _S.function_value(_S.capture(_parent,{"edge":_n_edge_b8,"C":_n_C_b1,"this":_this}),"_f7")])
	if true:
		var _n_i_b12 = 3
		while _S.truth((_n_i_b12 < 7)):
			_S.invoke(_n_g_b0,"line",[_S.index_value(_S.index_value(_n_wp_b7,1),0), _S.index_value(_S.index_value(_n_wp_b7,1),1), _S.numeric_lerp(_S.index_value(_S.index_value(_n_wp_b7,1),0),_S.index_value(_S.index_value(_n_wp_b7,_n_i_b12),0),0.92), _S.numeric_lerp(_S.index_value(_S.index_value(_n_wp_b7,1),1),_S.index_value(_S.index_value(_n_wp_b7,_n_i_b12),1),0.92), _S.index_value(_n_C_b1,2)])
			_n_i_b12 += 1.0
	_S.invoke(_n_g_b0,"outline",[_S.index_value(_n_C_b1,0)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (((pow((float((_n_x_b0 + 1))/8.5),2) + pow((float(_n_y_b1)/5.2),2)) <= 1) if _S.truth(((pow((float((_n_x_b0 + 1))/8.5),2) + pow((float(_n_y_b1)/5.2),2)) <= 1)) else ((pow((_n_x_b0 - 6.5),2) + pow((_n_y_b1 + 3),2)) <= pow(4.6,2)))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_inBody = _S.read(_parent,"inBody")
	var _n_Br = _S.read(_parent,"Br")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	if _S.truth(not _S.truth(_S.call_value(_n_inBody,[_n_x_b0, _n_y_b1]))):
		return 0
	var _n_top_b2 = not _S.truth(_S.call_value(_n_inBody,[_n_x_b0, (_n_y_b1 - 2.2)]))
	var _n_under_b3 = not _S.truth(_S.call_value(_n_inBody,[(_n_x_b0 + 0.5), (_n_y_b1 + 1.6)]))
	if _S.truth(((_n_x_b0 > (-2.5)) if _S.truth((_n_y_b1 > (-0.5))) else (_n_y_b1 > (-0.5)))):
		return (_S.index_value(_n_Br,1) if _S.truth(_n_under_b3) else (_S.index_value(_n_Br,3) if _S.truth(((_n_y_b1 < 2) if _S.truth((_n_x_b0 > 3)) else (_n_x_b0 > 3))) else _S.index_value(_n_Br,2)))
	if _S.truth((_n_y_b1 > 1.5)):
		return (_S.index_value(_n_C,4) if _S.truth(_n_under_b3) else _S.index_value(_n_C,5))
	return ((_S.index_value(_n_C,5) if _S.truth((_n_x_b0 > 2)) else _S.index_value(_n_C,4)) if _S.truth(_n_top_b2) else (_S.index_value(_n_C,4) if _S.truth(((_n_x_b0 > 3) if _S.truth((_n_y_b1 < (-3.5))) else (_n_y_b1 < (-3.5)))) else _S.index_value(_n_C,3)))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_BEAK = _S.read(_parent,"BEAK")
	var _n_BEAKD = _S.read(_parent,"BEAKD")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_n_BEAK if _S.truth((_n_y_b1 < (-3))) else _n_BEAKD)
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_wp = _S.read(_parent,"wp")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_m_b2 = INF
	if true:
		var _n_i_b3 = 1
		while _S.truth((_n_i_b3 < 3)):
			var _tuple_0 = _S.index_value(_n_wp,(_n_i_b3 - 1))
			var _n_ax_b4 = _S.prop(_tuple_0,0)
			var _n_ay_b5 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_wp,_n_i_b3)
			var _n_bx_b6 = _S.prop(_tuple_1,0)
			var _n_by_b7 = _S.prop(_tuple_1,1)
			var _n_dx_b8 = (_n_bx_b6 - _n_ax_b4)
			var _n_dy_b9 = (_n_by_b7 - _n_ay_b5)
			var _n_L2_b10 = (((_n_dx_b8 * _n_dx_b8) + (_n_dy_b9 * _n_dy_b9)) if _S.truth(((_n_dx_b8 * _n_dx_b8) + (_n_dy_b9 * _n_dy_b9))) else 1)
			var _n_u_b11 = clampf((float((((_n_x_b0 - _n_ax_b4) * _n_dx_b8) + ((_n_y_b1 - _n_ay_b5) * _n_dy_b9)))/_n_L2_b10),0.0,1.0)
			_n_m_b2 = minf(_n_m_b2,_S.Bridge.hypot([((_n_ax_b4 + (_n_dx_b8 * _n_u_b11)) - _n_x_b0), ((_n_ay_b5 + (_n_dy_b9 * _n_u_b11)) - _n_y_b1)]))
			_n_i_b3 += 1.0
	return _n_m_b2
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_edge = _S.read(_parent,"edge")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_d_b2 = _S.call_value(_n_edge,[_n_x_b0, _n_y_b1])
	return (_S.index_value(_n_C,5) if _S.truth((_n_d_b2 < 1.2)) else (_S.index_value(_n_C,4) if _S.truth((_n_d_b2 < 3)) else _S.index_value(_n_C,3)))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_wing = _S.read(_parent,"wing")
	var _n_lift = _S.read(_parent,"lift")
	var _n_GRID = _S.read(_parent,"GRID")
	var _n_wingPts = _S.read(_parent,"wingPts")
	var _n_bird = _S.read(_parent,"bird")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_Br_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"breast"),4)
	var _n_w_b6 = _S.call_value(_n_wing,[_n_t_b3])
	var _n_y_b7 = _S.call_value(_n_lift,[_n_t_b3])
	var _n_g_b8 = _n_GRID
	if _S.truth(((_S.named_value(_n_w_b6,"u") > 0.1) if _S.truth(_S.named_value(_n_w_b6,"down")) else _S.named_value(_n_w_b6,"down"))):
		var _n_s_b10 = (_n_t_b3 - 0.05)
		var _n_ws_b11 = _S.call_value(_n_wing,[_n_s_b10])
		_S.invoke(_n_g_b8,"clear",[])
		_S.invoke(_n_g_b8,"poly",[_S.call_value(_n_wingPts,[_n_ws_b11, false]), _S.index_value(_n_C_b4,6)])
		_S.invoke(_S.named_value(_n_g_b8,"a"),"fill",[0.42])
		_S.invoke(_n_g_b8,"draw",[_n_p_b0, 1, 0, floori(_S.call_value(_n_lift,[_n_s_b10])+0.5)])
	_S.call_value(_n_bird,[_n_g_b8, _n_C_b4, _n_Br_b5, _n_t_b3, _n_w_b6])
	_S.invoke(_n_g_b8,"draw",[_n_p_b0, 1, 0, floori(_n_y_b7+0.5)])
	var _n_fa_b9 = _S.call_value(_n_wrap,[(_n_t_b3 - 0.45), _n_D])
	if _S.truth((_n_fa_b9 < 1.8)):
		var _n_fx_b12 = (((-6) - (14 * _n_fa_b9)) - (3 * sin((_n_fa_b9 * 5))))
		var _n_fy_b13 = ((4 + (9 * _n_fa_b9)) + ((1.5 * cos((_n_fa_b9 * 5))) * _n_fa_b9))
		var _n_rock_b14 = (sin((_n_fa_b9 * 5)) * 0.8)
		var _n_a_b15 = minf(1,((1.8 - _n_fa_b9) * 2))
		if true:
			var _n_i_b16 = (-2)
			while _S.truth((_n_i_b16 <= 2)):
				_S.invoke(_n_p_b0,"dot",[(_n_fx_b12 + (_n_i_b16 * cos(_n_rock_b14))), (_n_fy_b13 + ((_n_i_b16 * sin(_n_rock_b14)) * 0.8)), (_S.index_value(_n_C_b4,5) if _S.truth((_n_i_b16 < 0)) else _S.index_value(_n_C_b4,4)), _n_a_b15])
				_n_i_b16 += 1.0
		_S.invoke(_n_p_b0,"dot",[(_n_fx_b12 + (2.6 * cos(_n_rock_b14))), (_n_fy_b13 + ((2.6 * sin(_n_rock_b14)) * 0.8)), _S.index_value(_n_C_b4,3), _n_a_b15])
	_S.invoke(_n_p_b0,"glow",[2, (_n_y_b7 - 6), 16, _S.index_value(_n_C_b4,5), 0.12])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_u_b2 = _S.arg(_args,2)
	return _S.invoke(_n_a_b0,"map",[_S.function_value(_S.capture(_parent,{"b":_n_b_b1,"u":_n_u_b2,"this":_n_this}),"_f10")])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_b = _S.read(_parent,"b")
	var _n_u = _S.read(_parent,"u")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_i_b2 = _S.arg(_args,1)
	return [_S.numeric_lerp(_n_x_b0,_S.index_value(_S.index_value(_n_b,_n_i_b2),0),_n_u), _S.numeric_lerp(_n_y_b1,_S.index_value(_S.index_value(_n_b,_n_i_b2),1),_n_u)]
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_w_b0 = _S.arg(_args,0)
	var _n_far_b1 = _S.arg(_args,1)
	return _S.invoke(_S.named_value(_n_w_b0,"pts"),"map",[_S.function_value(_S.capture(_parent,{"far":_n_far_b1,"this":_n_this}),"_f12")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_SH = _S.read(_parent,"SH")
	var _n_far = _S.read(_parent,"far")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return [((_S.index_value(_n_SH,0) + _n_x_b0) - (1 if _S.truth(_n_far) else 0)), ((_S.index_value(_n_SH,1) + (_n_y_b1 * (0.85 if _S.truth(_n_far) else 1))) - (1 if _S.truth(_n_far) else 0))]
	return null
