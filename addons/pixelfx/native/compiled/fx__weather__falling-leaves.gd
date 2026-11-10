@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/falling-leaves.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f8":"sky_falling_leaf"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "trips", _S.import_value("fx/weather/_lib.js", "trips"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "leaves", _S.function_value(_e, "_f3"))
	_S.define(_e, "leaf", _S.function_value(_e, "_f8"))
	_S.define(_e, "litter", _S.function_value(_e, "_f10"))
	_S.define(_e, "meta", _S.merge([{"name": "Falling leaves"}, {"desc": "Autumn leaves swing down through the air, tilting and flipping to show their pale backs, ride a gust, land flat in the litter and fade."}, {"tags": ["weather", "leaves", "autumn", "fall", "wind", "nature", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 10}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#4a1d0c", "#8a3a14", "#c8621e", "#f0982e", "#ffcf72", "#fff0c4"]}, {"reds": ["#40101a", "#7c1c22", "#b8302a", "#e85a3c", "#ff9a72", "#ffd8c4"]}, {"golds": ["#3e300c", "#7a5c14", "#b8901e", "#e8c23a", "#fff09a", "#fffbe0"]}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 10)
	_S.define(_e, "FLOOR", 1)
	_S.define(_e, "gust", _S.function_value(_e, "_f13"))
	_S.define(_e, "Hc", _S.function_value(_e, "_f14"))
	_S.define(_e, "SHAPES", [_S.function_value(_e, "_f15"), _S.function_value(_e, "_f16"), _S.function_value(_e, "_f17")])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_S.define(_e, "ramps", _S.function_value(_e, "_f18"))
	_S.define(_e, "LITTER", _S.construct(_S.read(_e, "Map"), []))
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_ramps = _S.read(_parent,"ramps")
	var _n_hex = _S.read(_parent,"hex")
	var _n_rows = _S.read(_parent,"rows")
	var _n_litter = _S.read(_parent,"litter")
	var _n_leaves = _S.read(_parent,"leaves")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_R3_b5 = _S.call_value(_n_ramps,[_n_o_b2])
	var _n_C_b6 = _S.index_value(_n_R3_b5,0)
	var _n_top_b7 = _S.call_value(_n_hex,["#0e0a12"])
	var _n_low_b8 = _S.ColorFX.mix(_S.call_value(_n_hex,["#140c14"]),_S.index_value(_n_C_b6,0),0.3)
	_S.call_value(_n_rows,[_n_p_b0, _n_meta, (-170), 9, _S.function_value(_S.capture(_parent,{"top":_n_top_b7,"low":_n_low_b8,"this":_this}),"_f1")])
	_S.call_value(_n_litter,[_n_q_b3, _n_S_b4, _n_R3_b5])
	_S.call_value(_n_leaves,[_n_q_b3, _n_t_b1, _n_S_b4, _n_R3_b5, false])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_top = _S.read(_parent,"top")
	var _n_low = _S.read(_parent,"low")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	var _n_k_b2 = (float((_n_y_b0 + 170))/180)
	var _n_c_b3 = _S.ColorFX.mix(_n_top,_n_low,(_n_k_b2 * _n_k_b2))
	_S.invoke(_S.named_value(_n_R_b1,"c"),"fill",[_n_c_b3])
	_S.invoke(_S.named_value(_n_R_b1,"a"),"fill",[(0.32 + (0.1 * _n_k_b2))])
	_S.invoke(_S.named_value(_n_R_b1,"b"),"fill",[1])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_leaves = _S.read(_parent,"leaves")
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_ramps = _S.read(_parent,"ramps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	_S.call_value(_n_leaves,[_S.call_value(_n_clip,[_n_p_b0, _n_meta]), _n_t_b1, _S.named_value(_n_o_b2,"seed"), _S.call_value(_n_ramps,[_n_o_b2]), true])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_trips = _S.read(_parent,"trips")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_R3_b3 = _S.arg(_args,3)
	var _n_front_b4 = _S.arg(_args,4)
	_S.call_value(_n_trips,[_n_t_b1, _n_D, 62, (_n_S_b2 * 19), 2, 3, _S.function_value(_S.capture(_parent,{"S":_n_S_b2,"front":_n_front_b4,"t":_n_t_b1,"R3":_n_R3_b3,"q":_n_q_b0,"this":_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_this = _S.read(_parent,"this")
	var _n_front = _S.read(_parent,"front")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_FLOOR = _S.read(_parent,"FLOOR")
	var _n_t = _S.read(_parent,"t")
	var _n_R3 = _S.read(_parent,"R3")
	var _n_leaf = _S.read(_parent,"leaf")
	var _n_q = _S.read(_parent,"q")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_m_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_j_b4 = _S.call_value(_n_wrap,[_n_k_b1, _n_m_b2])
	var _n_R_b5 = _S.function_value(_S.capture(_parent,{"i":_n_i_b3,"j":_n_j_b4,"this":_n_this}),"_f5")
	var _n_near_b6 = (_S.call_value(_n_R_b5,[1]) < 0.35)
	if _S.truth(_S.binary("!==",_n_near_b6,_n_front)):
		return null
	var _n_dur_b7 = (float(_n_D)/_n_m_b2)
	var _n_air_b8 = 0.72
	var _n_tf_b9 = (_n_dur_b7 * _n_air_b8)
	var _n_a_b10 = minf((_n_u_b0 * _n_dur_b7),_n_tf_b9)
	var _n_rest_b11 = ((_n_u_b0 * _n_dur_b7) - _n_tf_b9)
	var _n_w_b12 = (1.7 + (_S.call_value(_n_R_b5,[2]) * 1.2))
	var _n_ph0_b13 = (_S.call_value(_n_R_b5,[3]) * _n_TAU)
	var _n_amp_b14 = ((14 if _S.truth(_n_near_b6) else 8) + (_S.call_value(_n_R_b5,[4]) * 10))
	var _n_x0_b15 = ((-180) + (_S.call_value(_n_R_b5,[5]) * 340))
	var _n_y0_b16 = (-186)
	var _n_path_b17 = _S.function_value(_S.capture(_parent,{"w":_n_w_b12,"ph0":_n_ph0_b13,"this":_n_this}),"_f6")
	var _n_vy_b18 = (float((_n_FLOOR - _n_y0_b16))/_S.call_value(_n_path_b17,[_n_tf_b9]))
	var _n_born_b19 = (_n_t - (_n_u_b0 * _n_dur_b7))
	var _n_xAt_b20 = _S.function_value(_S.capture(_parent,{"x0":_n_x0_b15,"w":_n_w_b12,"ph0":_n_ph0_b13,"amp":_n_amp_b14,"born":_n_born_b19,"near":_n_near_b6,"this":_n_this}),"_f7")
	var _n_size_b21 = ((5.8 if _S.truth(_n_near_b6) else 4.2) + (_S.call_value(_n_R_b5,[6]) * 1.6))
	var _n_shape_b22 = floori((_S.call_value(_n_R_b5,[7]) * 3))
	var _n_col_b23 = _S.index_value(_n_R3,floori((_S.call_value(_n_R_b5,[8]) * 3)))
	if _S.truth((_n_rest_b11 > 0)):
		var _n_fade_b28 = (1 - (float(_n_rest_b11)/(_n_dur_b7 - _n_tf_b9)))
		_S.call_value(_n_leaf,[_n_q, _S.call_value(_n_xAt_b20,[_n_tf_b9]), (_n_FLOOR - 1), _n_size_b21, ((_S.call_value(_n_R_b5,[9]) - 0.5) * 0.5), 0.42, _n_shape_b22, _n_col_b23, _n_fade_b28])
		return null
	var _n_x_b24 = _S.call_value(_n_xAt_b20,[_n_a_b10])
	var _n_y_b25 = (_n_y0_b16 + (_n_vy_b18 * _S.call_value(_n_path_b17,[_n_a_b10])))
	var _n_tilt_b26 = ((cos(((_n_w_b12 * _n_a_b10) + _n_ph0_b13)) * 0.75) + (0 if _S.truth(_n_near_b6) else 0.3))
	var _n_flip_b27 = cos(((_S.call_value(_n_R_b5,[10]) * _n_TAU) + (_n_a_b10 * (5 if _S.truth((_S.call_value(_n_R_b5,[11]) < 0.3)) else 1.2))))
	_S.call_value(_n_leaf,[_n_q, _n_x_b24, _n_y_b25, _n_size_b21, _n_tilt_b26, _n_flip_b27, _n_shape_b22, _n_col_b23, 1])
	if _S.truth((_n_flip_b27 > 0.86)):
		var _n_k_b29 = (float((_n_flip_b27 - 0.86))/0.14)
		var _n_hx_b30 = (_n_x_b24 - ((cos(_n_tilt_b26) * _n_size_b21) * 0.3))
		var _n_hy_b31 = ((_n_y_b25 - ((sin(_n_tilt_b26) * _n_size_b21) * 0.3)) - 1)
		_S.invoke(_n_q,"px",[_n_hx_b30, _n_hy_b31, _S.index_value(_n_col_b23,5)])
		_S.invoke(_n_q,"glow",[_n_hx_b30, _n_hy_b31, (5 + (_n_size_b21 * 0.5)), _S.index_value(_n_col_b23,4), (0.22 * _n_k_b29)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_i = _S.read(_parent,"i")
	var _n_j = _S.read(_parent,"j")
	var _n_n_b0 = _S.arg(_args,0)
	return _S.MathFX.rand([(_n_S * 19),_n_i,_n_j,_n_n_b0])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_Hc = _S.read(_parent,"Hc")
	var _n_w = _S.read(_parent,"w")
	var _n_ph0 = _S.read(_parent,"ph0")
	var _n_aa_b0 = _S.arg(_args,0)
	return ((0.45 * _n_aa_b0) + (float((0.9 * (_S.call_value(_n_Hc,[((_n_w * _n_aa_b0) + _n_ph0)]) - _S.call_value(_n_Hc,[_n_ph0]))))/_n_w))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_x0 = _S.read(_parent,"x0")
	var _n_w = _S.read(_parent,"w")
	var _n_ph0 = _S.read(_parent,"ph0")
	var _n_amp = _S.read(_parent,"amp")
	var _n_gust = _S.read(_parent,"gust")
	var _n_born = _S.read(_parent,"born")
	var _n_near = _S.read(_parent,"near")
	var _n_aa_b0 = _S.arg(_args,0)
	return (((_n_x0 + (7 * _n_aa_b0)) + (sin(((_n_w * _n_aa_b0) + _n_ph0)) * _n_amp)) + ((_S.call_value(_n_gust,[(_n_born + _n_aa_b0)]) - _S.call_value(_n_gust,[_n_born])) * (1 if _S.truth(_n_near) else 0.7)))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_SHAPES = _S.read(_parent,"SHAPES")
	var _n_hex = _S.read(_parent,"hex")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_size_b3 = _S.arg(_args,3)
	var _n_ang_b4 = _S.arg(_args,4)
	var _n_flip_b5 = _S.arg(_args,5)
	var _n_shape_b6 = _S.arg(_args,6)
	var _n_col_b7 = _S.arg(_args,7)
	var _n_a_b8 = _S.arg(_args,8)
	var _n_back_b9 = (_n_flip_b5 < (-0.25))
	var _n_fs_b10 = (0.35 + (0.65 * absf(_n_flip_b5)))
	var _n_c_b11 = cos(_n_ang_b4)
	var _n_s_b12 = sin(_n_ang_b4)
	var _n_L_b13 = _n_size_b3
	var _n_Wd_b14 = (_n_size_b3 * 0.9)
	var _n_ext_b15 = (_n_L_b13 + 1.5)
	var _n_shapeFn_b16 = _S.index_value(_n_SHAPES,_n_shape_b6)
	var _n_face_b17 = ([_S.ColorFX.mix(_S.index_value(_n_col_b7,1),_S.call_value(_n_hex,["#9c8a78"]),0.2), _S.ColorFX.mix(_S.index_value(_n_col_b7,2),_S.call_value(_n_hex,["#c8b49c"]),0.22), _S.ColorFX.mix(_S.index_value(_n_col_b7,3),_S.call_value(_n_hex,["#e0d0b8"]),0.22)] if _S.truth(_n_back_b9) else [_S.index_value(_n_col_b7,2), _S.index_value(_n_col_b7,3), _S.index_value(_n_col_b7,4)])
	var _n_rim_b18 = _S.index_value(_n_col_b7,0)
	var _n_vein_b19 = (_S.ColorFX.mix(_S.index_value(_n_col_b7,2),_S.call_value(_n_hex,["#e8dcc8"]),0.5) if _S.truth(_n_back_b9) else _S.index_value(_n_col_b7,1))
	_S.invoke(_n_q_b0,"shade",[(_n_x_b1 - _n_ext_b15), (_n_y_b2 - _n_ext_b15), (_n_x_b1 + _n_ext_b15), (_n_y_b2 + _n_ext_b15), _S.function_value(_S.capture(_parent,{"x":_n_x_b1,"y":_n_y_b2,"c":_n_c_b11,"s":_n_s_b12,"L":_n_L_b13,"Wd":_n_Wd_b14,"fs":_n_fs_b10,"shapeFn":_n_shapeFn_b16,"rim":_n_rim_b18,"a":_n_a_b8,"vein":_n_vein_b19,"face":_n_face_b17,"this":_this}),"_f9")])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_c = _S.read(_parent,"c")
	var _n_s = _S.read(_parent,"s")
	var _n_L = _S.read(_parent,"L")
	var _n_Wd = _S.read(_parent,"Wd")
	var _n_fs = _S.read(_parent,"fs")
	var _n_shapeFn = _S.read(_parent,"shapeFn")
	var _n_rim = _S.read(_parent,"rim")
	var _n_a = _S.read(_parent,"a")
	var _n_vein = _S.read(_parent,"vein")
	var _n_face = _S.read(_parent,"face")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_px_b0 - _n_x)
	var _n_dy_b4 = (_n_py_b1 - _n_y)
	var _n_lu_b5 = (float(((_n_dx_b3 * _n_c) + (_n_dy_b4 * _n_s)))/_n_L)
	var _n_lv_b6 = (float((((-_n_dx_b3) * _n_s) + (_n_dy_b4 * _n_c)))/(_n_Wd * _n_fs))
	var _n_d_b7 = _S.call_value(_n_shapeFn,[_n_lu_b5, _n_lv_b6])
	if _S.truth(((_n_lu_b5 < (-1.25)) if _S.truth((_n_lu_b5 < (-1.25))) else (_n_lu_b5 > 1.1))):
		return null
	if _S.truth(((absf(((_n_lv_b6 * _n_Wd) * _n_fs)) < 0.5) if _S.truth((_n_lu_b5 < (-0.92))) else (_n_lu_b5 < (-0.92)))):
		_S.set_prop(_n_out_b2,"c",_n_rim,"=")
		_S.set_prop(_n_out_b2,"a",_n_a,"=")
		return null
	if _S.truth((_n_d_b7 > 1.32)):
		return null
	_S.set_prop(_n_out_b2,"a",_n_a,"=")
	if _S.truth((_n_d_b7 > 1)):
		_S.set_prop(_n_out_b2,"c",_n_rim,"=")
	else:
		if _S.truth(_S.logical("&&",_S.logical("&&",(absf(((_n_lv_b6 * _n_Wd) * _n_fs)) < 0.45),func():return (_n_lu_b5 > (-0.9))),func():return (_n_lu_b5 < 0.75))):
			_S.set_prop(_n_out_b2,"c",_n_vein,"=")
		else:
			_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_face,2) if _S.truth((_n_lv_b6 < (-0.15))) else (_S.index_value(_n_face,1) if _S.truth((_n_lv_b6 < 0.35)) else _S.index_value(_n_face,0))),"=")
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "S", _S.arg(_args, 1))
	_S.define(_e, "R3", _S.arg(_args, 2))
	_S.define(_e, "key", _S.binary("+", _S.read(_e, "S"), _S.invoke(_S.invoke(_S.read(_e, "R3"), "flat", []), "join", [])))
	_S.define(_e, "px", _S.invoke(_S.read(_e, "LITTER"), "get", [_S.read(_e, "key")]))
	if _S.truth(_S.unary("!", _S.read(_e, "px"))):
		var _v2 = _S.scope(_e)
		_S.write(_v2, "px", [], "=", false)
		_S.define(_v2, "rec", _S.merge([{"shade": _S.function_value(_v2, "_f11")}]))
		var _v6 = _S.scope(_v2)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 64)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "x", _S.binary("+", _S.unary("-", 164), _S.binary("*", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "S"), _S.read(_v7, "i"), 91]), 328)))
			_S.define(_v7, "y", _S.binary("+", _S.binary("-", _S.read(_v7, "FLOOR"), 2), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "S"), _S.read(_v7, "i"), 92]), 4)]), 2)))
			_S.define(_v7, "col", _S.prop(_S.read(_v7, "R3"), _S.invoke(_S.read(_v7, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "S"), _S.read(_v7, "i"), 93]), 3)])))
			_S.call_value(_S.read(_v7, "leaf"), [_S.read(_v7, "rec"), _S.read(_v7, "x"), _S.read(_v7, "y"), _S.binary("+", 3.6, _S.binary("*", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "S"), _S.read(_v7, "i"), 94]), 1.8)), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "S"), _S.read(_v7, "i"), 95]), 0.5), 0.7), _S.binary("+", 0.45, _S.binary("*", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "S"), _S.read(_v7, "i"), 96]), 0.25)), _S.invoke(_S.read(_v7, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "S"), _S.read(_v7, "i"), 97]), 3)]), _S.invoke(_S.read(_v7, "col"), "map", [_S.function_value(_v7, "_f12")]), 1])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
		_S.invoke(_S.read(_v2, "LITTER"), "set", [_S.read(_v2, "key"), _S.read(_v2, "px")])
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), _S.prop(_S.read(_v8, "px"), "length"))):
		_S.invoke(_S.read(_v8, "q"), "dot", [_S.prop(_S.read(_v8, "px"), _S.read(_v8, "i")), _S.prop(_S.read(_v8, "px"), _S.binary("+", _S.read(_v8, "i"), 1)), _S.prop(_S.read(_v8, "px"), _S.binary("+", _S.read(_v8, "i"), 2)), _S.prop(_S.read(_v8, "px"), _S.binary("+", _S.read(_v8, "i"), 3))])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 4, "+=", false)
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_px = _S.read(_parent,"px")
	var _n_x0_b0 = _S.arg(_args,0)
	var _n_y0_b1 = _S.arg(_args,1)
	var _n_x1_b2 = _S.arg(_args,2)
	var _n_y1_b3 = _S.arg(_args,3)
	var _n_fn_b4 = _S.arg(_args,4)
	var _n_o_b5 = {"c":0,"a":1}
	if true:
		var _n_y_b6 = floori(_n_y0_b1)
		while _S.truth((_n_y_b6 <= ceili(_n_y1_b3))):
			if true:
				var _n_x_b7 = floori(_n_x0_b0)
				while _S.truth((_n_x_b7 <= ceili(_n_x1_b2))):
					_S.set_prop(_n_o_b5,"c",0,"=")
					_S.set_prop(_n_o_b5,"a",1,"=")
					var _n_c_b8 = _S.logical("||",_S.call_value(_n_fn_b4,[(_n_x_b7 + 0.5), (_n_y_b6 + 0.5), _n_o_b5]),func():return _S.named_value(_n_o_b5,"c"))
					if _S.truth(_n_c_b8):
						_S.invoke(_n_px,"push",[(_n_x_b7 + 0.5), (_n_y_b6 + 0.5), _n_c_b8, _S.named_value(_n_o_b5,"a")])
					_n_x_b7 += 1.0
			_n_y_b6 += 1.0
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_col = _S.read(_parent,"col")
	var _n_c_b0 = _S.arg(_args,0)
	return _S.ColorFX.mix(_n_c_b0,_S.index_value(_n_col,0),0.12)
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_t_b0 = _S.arg(_args,0)
	return ((16 * sin(((float((_n_TAU * _n_t_b0))/_n_D) - 1.2))) + (5 * sin((float(((_n_TAU * 3) * _n_t_b0))/_n_D))))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_th_b0 = _S.arg(_args,0)
	var _n_k_b1 = floori((float((_n_th_b0 + (float(PI)/2)))/PI))
	return (((2 * _n_k_b1) + 1) + sin((_n_th_b0 - (_n_k_b1 * PI))))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return (9 if _S.truth((absf(_n_u_b0) >= 1)) else (float((_n_v_b1 * _n_v_b1))/((0.36 * (1 - (_n_u_b0 * _n_u_b0))) * (1.15 - (0.3 * _n_u_b0)))))
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.Bridge.hypot([_n_u_b0, (_n_v_b1 * 1.1)])
	var _n_a_b3 = atan2(_n_v_b1,_n_u_b0)
	return (float(_n_r_b2)/(0.62 + (0.38 * pow(absf(cos((2.5 * _n_a_b3))),1.5))))
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return (9 if _S.truth((absf(_n_u_b0) >= 1)) else (float((_n_v_b1 * _n_v_b1))/(0.16 * (1 - (_n_u_b0 * _n_u_b0)))))
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_o_b0 = _S.arg(_args,0)
	return [_S.ColorFX.fit(_S.named_value(_n_o_b0,"palette"),6), _S.ColorFX.fit(_S.named_value(_n_o_b0,"reds"),6), _S.ColorFX.fit(_S.named_value(_n_o_b0,"golds"),6)]
	return null
