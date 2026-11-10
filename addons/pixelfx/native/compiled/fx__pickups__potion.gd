@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/potion.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "pool", _S.import_value("fx/pickups/_lib.js", "pool"))
	_S.define(_e, "flask", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Potion"}, {"desc": "A round glass flask of glowing brew rocks in the air: the brew sloshes behind the rock, bubbles rise and pop, light glows through the glass, wisps curl off the cork."}, {"tags": ["pickup", "potion", "flask", "brew", "magic", "loop"]}, {"size": [56, 72]}, {"origin": [28, 64]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0516", "#3d0a33", "#701560", "#b0228f", "#f53cd1", "#ff86e6", "#ffd2f6", "#ffffff"]}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RB", 7)
	_S.define(_e, "HOVER", 17)
	_S.define(_e, "NECK", 2)
	_S.define(_e, "LIP", _S.unary("-", 12))
	_S.define(_e, "CORK_TOP", _S.unary("-", 16))
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#120d1a"]))
	_S.define(_e, "GLASS", _S.call_value(_S.read(_e, "hex"), ["#2a2236"]))
	_S.define(_e, "CORK", _S.invoke(["#2a160c", "#4e2c16", "#7a4a26", "#a8703a", "#d09a5a"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [40, 44]))
	_S.define(_e, "pose", _S.function_value(_e, "_f9"))
	_S.define(_e, "surface", _S.function_value(_e, "_f10"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_INK = _S.read(_parent,"INK")
	var _n_RB = _S.read(_parent,"RB")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_meta = _S.read(_parent,"meta")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_ph_b3 = _S.arg(_args,3)
	var _n_cy_b4 = _S.arg(_args,4)
	var _n_tilt_b5 = _S.arg(_args,5)
	var _n_seed_b6 = _S.arg(_args,6)
	var _n_ct_b7 = cos(_n_tilt_b5)
	var _n_st_b8 = sin(_n_tilt_b5)
	_S.invoke(_n_L,"begin",[(-20), (floori(_n_cy_b4) - 22)])
	_S.invoke(_n_L,"fill",[(-20), (floori(_n_cy_b4) - 22), 19, (floori(_n_cy_b4) + 12), _S.function_value(_S.capture(_parent,{"cy":_n_cy_b4,"ct":_n_ct_b7,"st":_n_st_b8,"C":_n_C_b1,"ph":_n_ph_b3,"this":_this}),"_f1")])
	_S.invoke(_S.invoke(_n_L,"outline",[_n_INK]),"draw",[_n_p_b0])
	if true:
		var _n_a_b9 = 3.45
		while _S.truth((_n_a_b9 < 4.35)):
			var _n_lx_b10 = (cos((_n_a_b9 + _n_tilt_b5)) * (_n_RB - 2.2))
			var _n_ly_b11 = (sin((_n_a_b9 + _n_tilt_b5)) * (_n_RB - 2.2))
			_S.invoke(_n_p_b0,"px",[_n_lx_b10, (_n_cy_b4 + _n_ly_b11), (_n_WHITE if _S.truth(((_n_a_b9 < 4.1) if _S.truth((_n_a_b9 > 3.7)) else (_n_a_b9 > 3.7))) else _S.ColorFX.mix(_n_WHITE,_S.index_value(_n_C_b1,6),0.5))])
			_n_a_b9 += 0.04
	_S.invoke(_n_p_b0,"px",[floori(((2 * cos(_n_tilt_b5)) + (3 * sin(_n_tilt_b5)))+0.5), floori((_n_cy_b4 - 3)+0.5), _n_WHITE])
	_S.call_value(_n_cycle,[_n_t_b2, _S.named_value(_n_meta,"duration"), 10, _n_seed_b6, _S.function_value(_S.capture(_parent,{"this":_this}),"_f2"), _S.function_value(_S.capture(_parent,{"cy":_n_cy_b4,"t":_n_t_b2,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f3")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_cy = _S.read(_parent,"cy")
	var _n_ct = _S.read(_parent,"ct")
	var _n_st = _S.read(_parent,"st")
	var _n_LIP = _S.read(_parent,"LIP")
	var _n_CORK_TOP = _S.read(_parent,"CORK_TOP")
	var _n_NECK = _S.read(_parent,"NECK")
	var _n_CORK = _S.read(_parent,"CORK")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_GLASS = _S.read(_parent,"GLASS")
	var _n_RB = _S.read(_parent,"RB")
	var _n_surface = _S.read(_parent,"surface")
	var _n_ph = _S.read(_parent,"ph")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_wx_b2 = _n_px_b0
	var _n_wy_b3 = (_n_py_b1 - _n_cy)
	var _n_fx_b4 = ((_n_wx_b2 * _n_ct) + (_n_wy_b3 * _n_st))
	var _n_fy_b5 = (((-_n_wx_b2) * _n_st) + (_n_wy_b3 * _n_ct))
	var _n_d_b6 = _S.Bridge.hypot([_n_fx_b4, _n_fy_b5])
	if _S.truth(((absf(_n_fx_b4) <= (_n_NECK + 0.2)) if _S.truth(((_n_fy_b5 >= _n_CORK_TOP) if _S.truth((_n_fy_b5 < (_n_LIP - 0.5))) else (_n_fy_b5 < (_n_LIP - 0.5)))) else ((_n_fy_b5 >= _n_CORK_TOP) if _S.truth((_n_fy_b5 < (_n_LIP - 0.5))) else (_n_fy_b5 < (_n_LIP - 0.5))))):
		return _S.index_value(_n_CORK,(4 if _S.truth((_n_fy_b5 < (_n_CORK_TOP + 1))) else (3 if _S.truth((_n_fx_b4 < (-0.6))) else (1 if _S.truth((_n_fx_b4 > 1)) else 2))))
	if _S.truth(((absf(_n_fx_b4) <= (_n_NECK + 1.4)) if _S.truth(((_n_fy_b5 < (_n_LIP + 1)) if _S.truth((_n_fy_b5 >= (_n_LIP - 0.5))) else (_n_fy_b5 >= (_n_LIP - 0.5)))) else ((_n_fy_b5 < (_n_LIP + 1)) if _S.truth((_n_fy_b5 >= (_n_LIP - 0.5))) else (_n_fy_b5 >= (_n_LIP - 0.5))))):
		return (_S.ColorFX.mix(_n_WHITE,_S.index_value(_n_C,6),0.4) if _S.truth((_n_fx_b4 < 0)) else _S.ColorFX.mix(_n_GLASS,_S.index_value(_n_C,5),0.45))
	var _n_inNeck_b7 = ((absf(_n_fx_b4) <= (_n_NECK + 0.6)) if _S.truth(((_n_fy_b5 < ((-_n_RB) + 2)) if _S.truth((_n_fy_b5 >= (_n_LIP + 1))) else (_n_fy_b5 >= (_n_LIP + 1)))) else ((_n_fy_b5 < ((-_n_RB) + 2)) if _S.truth((_n_fy_b5 >= (_n_LIP + 1))) else (_n_fy_b5 >= (_n_LIP + 1))))
	if _S.truth((not _S.truth(_n_inNeck_b7) if _S.truth((_n_d_b6 > _n_RB)) else (_n_d_b6 > _n_RB))):
		return 0
	var _n_wall_b8 = ((absf(_n_fx_b4) > (_n_NECK - 0.5)) if _S.truth(_n_inNeck_b7) else (_n_d_b6 > (_n_RB - 1)))
	var _n_s_b9 = _S.call_value(_n_surface,[_n_wx_b2, _n_ph])
	var _n_depth_b10 = (_n_wy_b3 - _n_s_b9)
	if _S.truth(((_n_depth_b10 > 0) if _S.truth((not _S.truth(_n_inNeck_b7) if _S.truth(not _S.truth(_n_wall_b8)) else not _S.truth(_n_wall_b8))) else (not _S.truth(_n_inNeck_b7) if _S.truth(not _S.truth(_n_wall_b8)) else not _S.truth(_n_wall_b8)))):
		var _n_core_b11 = (1 - (float(_S.Bridge.hypot([(_n_wx_b2 * 0.85), (_n_wy_b3 - 1.8)]))/_n_RB))
		if _S.truth((_n_depth_b10 < 0.9)):
			return (_n_WHITE if _S.truth(((_n_wx_b2 > (-4.5)) if _S.truth((_n_wx_b2 < (-1.5))) else (_n_wx_b2 < (-1.5)))) else _S.index_value(_n_C,6))
		var _n_k_b12 = (5 if _S.truth((_n_core_b11 > 0.62)) else (4 if _S.truth((_n_core_b11 > 0.38)) else (3 if _S.truth((_n_core_b11 > 0.18)) else 2)))
		if _S.truth(((_n_k_b12 < 5) if _S.truth((_n_depth_b10 < 1.9)) else (_n_depth_b10 < 1.9))):
			_n_k_b12 += 1.0
		if _S.truth(((_n_wy_b3 > 2) if _S.truth((_n_wx_b2 > 1.5)) else (_n_wx_b2 > 1.5))):
			_n_k_b12 -= 1.0
		return _S.index_value(_n_C,maxf(2,minf(6,_n_k_b12)))
	if _S.truth(_n_wall_b8):
		var _n_lit_b13 = (float((((-_n_fx_b4) * 0.75) - (_n_fy_b5 * 0.66)))/maxf(1,_n_d_b6))
		if _S.truth(_n_inNeck_b7):
			return (_S.ColorFX.mix(_n_GLASS,_S.index_value(_n_C,6),0.55) if _S.truth((_n_fx_b4 < 0)) else _S.ColorFX.mix(_n_GLASS,_S.index_value(_n_C,5),0.3))
		if _S.truth((_n_lit_b13 > 0.82)):
			return _S.ColorFX.mix(_n_WHITE,_S.index_value(_n_C,6),0.3)
		if _S.truth((_n_lit_b13 > 0.3)):
			return _S.ColorFX.mix(_n_GLASS,_S.index_value(_n_C,6),0.5)
		return (_S.index_value(_n_C,3) if _S.truth((_n_depth_b10 > 0)) else _S.ColorFX.mix(_n_GLASS,_S.index_value(_n_C,5),0.28))
	return _n_GLASS
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.7, 1.3])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_cy = _S.read(_parent,"cy")
	var _n_t = _S.read(_parent,"t")
	var _n_meta = _S.read(_parent,"meta")
	var _n_surface = _S.read(_parent,"surface")
	var _n_RB = _S.read(_parent,"RB")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_x0_b3 = _S.invoke(_n_r_b2,"range",[(-4), 4])
	var _n_r0_b4 = _S.invoke(_n_r_b2,"range",[0.6, 1.7])
	var _n_vy_b5 = _S.invoke(_n_r_b2,"range",[7, 13])
	var _n_x_b6 = (_n_x0_b3 + (sin(((_n_age_b0 * _S.invoke(_n_r_b2,"range",[5, 9])) + _S.invoke(_n_r_b2,"range",[0, _n_TAU]))) * 0.7))
	var _n_y_b7 = ((_n_cy + 5.5) - (_n_vy_b5 * _n_age_b0))
	var _n_ph2_b8 = (float((_n_t + _n_age_b0))/_S.named_value(_n_meta,"duration"))
	var _n_top_b9 = (_n_cy + _S.call_value(_n_surface,[_n_x_b6, _n_ph2_b8]))
	if _S.truth((_n_y_b7 > (_n_top_b9 + 0.8))):
		var _n_rr_b10 = (_n_r0_b4 * (0.7 + (0.5 * (float(_n_age_b0)/_n_life_b1))))
		if _S.truth((_S.Bridge.hypot([_n_x_b6, (_n_y_b7 - _n_cy)]) > (_n_RB - 1.5))):
			return null
		if _S.truth((_n_rr_b10 < 0.95)):
			_S.invoke(_n_p,"px",[_n_x_b6, _n_y_b7, _S.index_value(_n_C,6)])
		else:
			_S.invoke(_n_p,"px",[_n_x_b6, _n_y_b7, _S.index_value(_n_C,3)])
			_S.invoke(_n_p,"px",[(_n_x_b6 + 1), _n_y_b7, _S.index_value(_n_C,6)])
			_S.invoke(_n_p,"px",[_n_x_b6, (_n_y_b7 - 1), _n_WHITE])
			_S.invoke(_n_p,"px",[(_n_x_b6 + 1), (_n_y_b7 - 1), _S.index_value(_n_C,6)])
			if _S.truth((_n_rr_b10 > 1.4)):
				_S.invoke(_n_p,"px",[(_n_x_b6 - 1), _n_y_b7, _S.index_value(_n_C,5)])
				_S.invoke(_n_p,"px",[_n_x_b6, (_n_y_b7 + 1), _S.index_value(_n_C,4)])
		_S.invoke(_n_p,"glow",[(_n_x_b6 + 0.5), _n_y_b7, 3, _S.index_value(_n_C,6), 0.15])
	else:
		var _n_k_b11 = clampf((float(((_n_top_b9 + 0.8) - _n_y_b7))/3),0.0,1.0)
		if _S.truth((_n_k_b11 >= 1)):
			return null
		if true:
			var _n_a_b12 = PI
			while _S.truth((_n_a_b12 < _n_TAU)):
				_S.invoke(_n_p,"dot",[(_n_x_b6 + (cos(_n_a_b12) * (1 + (_n_k_b11 * 2)))), ((_n_top_b9 - 0.5) + ((sin(_n_a_b12) * (1 + (_n_k_b11 * 2))) * 0.5)), (_n_WHITE if _S.truth((_n_k_b11 < 0.5)) else _S.index_value(_n_C,6)), (1.2 - _n_k_b11)])
				_n_a_b12 += 0.6
		_S.invoke(_n_p,"dot",[(_n_x_b6 - 1), ((_n_top_b9 - 1.5) - (_n_k_b11 * 3)), _S.index_value(_n_C,6), (1 - _n_k_b11)])
		_S.invoke(_n_p,"dot",[(_n_x_b6 + 1.5), ((_n_top_b9 - 2) - (_n_k_b11 * 4)), _n_WHITE, (1 - _n_k_b11)])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_pose = _S.read(_parent,"pose")
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_blobShadow = _S.read(_parent,"blobShadow")
	var _n_pool = _S.read(_parent,"pool")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_S.named_value(_n_meta,"duration"))
	var _object_0 = _S.call_value(_n_pose,[_n_ph_b4])
	var _n_y_b5 = _S.named_value(_object_0,"y")
	_S.call_value(_n_blobShadow,[_n_p_b0, 0, 7.5, (0.8 - ((((-_n_y_b5) - _n_HOVER) + 1.4) * 0.06))])
	_S.call_value(_n_pool,[_n_p_b0, 0, 0.5, 18, 3, _S.index_value(_n_C_b3,5), 0.3])
	_S.call_value(_n_cycle,[_n_t_b1, _S.named_value(_n_meta,"duration"), 7, (_S.named_value(_n_o_b2,"seed") + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"y":_n_y_b5,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f6")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[1.2, 1.8])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_this = _S.read(_parent,"this")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_side_b3 = _S.invoke(_n_r_b2,"sign",[])
	var _n_f_b4 = _S.invoke(_n_r_b2,"range",[3, 4.5])
	var _n_ph0_b5 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_vy_b6 = _S.invoke(_n_r_b2,"range",[11, 16])
	var _n_x0_b7 = _S.invoke(_n_r_b2,"range",[(-1), 1])
	var _n_at_b8 = _S.function_value(_S.capture(_parent,{"x0":_n_x0_b7,"f":_n_f_b4,"ph0":_n_ph0_b5,"side":_n_side_b3,"vy":_n_vy_b6,"this":_n_this}),"_f7")
	if true:
		var _n_i_b9 = 0
		while _S.truth((_n_i_b9 < 9)):
			var _n_a_b10 = (_n_age_b0 - (_n_i_b9 * 0.04))
			if _S.truth((_n_a_b10 < 0)):
				break
			var _tuple_0 = _S.call_value(_n_at_b8,[_n_a_b10])
			var _n_x_b11 = _S.prop(_tuple_0,0)
			var _n_yy_b12 = _S.prop(_tuple_0,1)
			var _n_k_b13 = (((1 - (float(_n_a_b10)/_n_life_b1)) * minf(1,(float(_n_a_b10)/0.15))) * (1 - (float(_n_i_b9)/9)))
			_S.invoke(_n_p,"dot",[_n_x_b11, _n_yy_b12, (_n_WHITE if _S.truth(_S.binary("===",_n_i_b9,0)) else (_S.index_value(_n_C,6) if _S.truth((_n_i_b9 < 3)) else _S.index_value(_n_C,5))), (_n_k_b13 * 1.4)])
			if _S.truth(_S.binary("===",_n_i_b9,0)):
				_S.invoke(_n_p,"glow",[_n_x_b11, _n_yy_b12, 4, _S.index_value(_n_C,5), (0.3 * _n_k_b13)])
			_n_i_b9 += 1.0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_x0 = _S.read(_parent,"x0")
	var _n_f = _S.read(_parent,"f")
	var _n_ph0 = _S.read(_parent,"ph0")
	var _n_side = _S.read(_parent,"side")
	var _n_y = _S.read(_parent,"y")
	var _n_CORK_TOP = _S.read(_parent,"CORK_TOP")
	var _n_vy = _S.read(_parent,"vy")
	var _n_a_b0 = _S.arg(_args,0)
	return [(_n_x0 + ((sin(((_n_a_b0 * _n_f) + _n_ph0)) * (0.8 + (_n_a_b0 * 3.2))) * _n_side)), (((_n_y + _n_CORK_TOP) - 1) - (_n_a_b0 * _n_vy))]
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_pose = _S.read(_parent,"pose")
	var _n_flask = _S.read(_parent,"flask")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_glint = _S.read(_parent,"glint")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_S.named_value(_n_meta,"duration"))
	var _object_0 = _S.call_value(_n_pose,[_n_ph_b4])
	var _n_y_b5 = _S.named_value(_object_0,"y")
	var _n_tilt_b6 = _S.named_value(_object_0,"tilt")
	_S.invoke(_n_p_b0,"glow",[0, (_n_y_b5 + 1.5), 26, _S.index_value(_n_C_b3,4), 0.22])
	_S.call_value(_n_flask,[_n_p_b0, _n_C_b3, _n_t_b1, _n_ph_b4, _n_y_b5, _n_tilt_b6, _S.named_value(_n_o_b2,"seed")])
	_S.invoke(_n_p_b0,"glow",[0, (_n_y_b5 + 2), 10, _S.index_value(_n_C_b3,5), (0.38 + (0.08 * sin(((_n_ph_b4 * _n_TAU) * 2))))])
	var _n_g_b7 = (float(fmod((_n_ph_b4 + 0.2),0.5))/0.5)
	if _S.truth((_n_g_b7 < 0.16)):
		_S.call_value(_n_glint,[_n_p_b0, (-4), (_n_y_b5 - 4), (2.6 * sin(((float(_n_g_b7)/0.16) * PI))), _n_WHITE, 0.4])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ph_b0 = _S.arg(_args,0)
	return {"y":((-_n_HOVER) - (1.4 * sin((_n_ph_b0 * _n_TAU)))),"tilt":(0.13 * sin(((_n_ph_b0 * _n_TAU) + 0.4)))}
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_ph_b1 = _S.arg(_args,1)
	return (((-0.5) + ((0.17 * sin(((_n_ph_b1 * _n_TAU) - 0.9))) * _n_x_b0)) + (0.45 * sin(((_n_x_b0 * 0.85) + ((_n_ph_b1 * _n_TAU) * 3)))))
	return null
