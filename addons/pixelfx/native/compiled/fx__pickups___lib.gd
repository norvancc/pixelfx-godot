@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f17":"pickup_draw_gem","_f24":"pickup_layer_begin","_f25":"pickup_layer_idx","_f26":"pickup_layer_get","_f27":"pickup_layer_set","_f28":"pickup_layer_fill","_f29":"pickup_layer_outline","_f30":"pickup_layer_map","_f31":"pickup_layer_draw"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "createFrame", _S.import_value("core/index.js", "createFrame"))
	_S.define(_e, "Painter", _S.import_value("core/index.js", "Painter"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "ramp", _S.import_value("core/index.js", "ramp"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "fit", _S.function_value(_e, "_f0"))
	_S.define(_e, "shadow", _S.function_value(_e, "_f2"))
	_S.define(_e, "twinkle", _S.function_value(_e, "_f3"))
	_S.define(_e, "pillow", _S.function_value(_e, "_f4"))
	_S.define(_e, "heartSdf", _S.function_value(_e, "_f6"))
	_S.define(_e, "blobShadow", _S.function_value(_e, "_f7"))
	_S.define(_e, "glint", _S.function_value(_e, "_f8"))
	_S.define(_e, "pool", _S.function_value(_e, "_f9"))
	_S.define(_e, "coin", _S.function_value(_e, "_f11"))
	_S.define(_e, "gemlet", _S.function_value(_e, "_f13"))
	_S.define(_e, "brilliant", _S.function_value(_e, "_f15"))
	_S.define(_e, "prism", _S.function_value(_e, "_f16"))
	_S.define(_e, "drawGem", _S.function_value(_e, "_f17"))
	_S.define(_e, "coin3d", _S.function_value(_e, "_f21"))
	_exports["fit"] = _S.read(_e, "fit")
	_S.define(_e, "Layer", _S.class_value("Layer", _S.function_value(_e, "_f23"), {"begin": _S.function_value(_e, "_f24"), "idx": _S.function_value(_e, "_f25"), "get": _S.function_value(_e, "_f26"), "set": _S.function_value(_e, "_f27"), "fill": _S.function_value(_e, "_f28"), "outline": _S.function_value(_e, "_f29"), "map": _S.function_value(_e, "_f30"), "draw": _S.function_value(_e, "_f31")}, {}, {}, null))
	_exports["Layer"] = _S.read(_e, "Layer")
	_S.define(_e, "SHADOW", _S.call_value(_S.read(_e, "hex"), ["#100e17"]))
	_exports["shadow"] = _S.read(_e, "shadow")
	_exports["twinkle"] = _S.read(_e, "twinkle")
	_S.define(_e, "bob", _S.function_value(_e, "_f32"))
	_exports["bob"] = _S.read(_e, "bob")
	_exports["pillow"] = _S.read(_e, "pillow")
	_exports["heartSdf"] = _S.read(_e, "heartSdf")
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#0b0814"]))
	_exports["blobShadow"] = _S.read(_e, "blobShadow")
	_exports["glint"] = _S.read(_e, "glint")
	_exports["pool"] = _S.read(_e, "pool")
	_exports["coin"] = _S.read(_e, "coin")
	_exports["gemlet"] = _S.read(_e, "gemlet")
	_exports["brilliant"] = _S.read(_e, "brilliant")
	_exports["prism"] = _S.read(_e, "prism")
	_exports["drawGem"] = _S.read(_e, "drawGem")
	_exports["coin3d"] = _S.read(_e, "coin3d")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_ramp = _S.read(_parent,"ramp")
	var _n_Array = _S.read(_parent,"Array")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_palette_b0 = _S.arg(_args,0)
	var _n_n_b1 = _S.coalesce(_S.arg(_args,1),func():return 8)
	var _n_r_b2 = _S.call_value(_n_ramp,[_n_palette_b0])
	if _S.truth(not _S.truth(_S.prop(_n_r_b2,"length"))):
		return _S.invoke(_S.call_value(_n_Array,[_n_n_b1]),"fill",[_n_WHITE])
	if _S.truth((_S.prop(_n_r_b2,"length") >= (_n_n_b1 - 1))):
		while _S.truth((_S.prop(_n_r_b2,"length") < _n_n_b1)):
			_S.invoke(_n_r_b2,"push",[_S.index_value(_n_r_b2,(_S.prop(_n_r_b2,"length") - 1))])
		return _n_r_b2
	return _S.invoke(_n_Array,"from",[{"length":_n_n_b1}, _S.function_value(_S.capture(_parent,{"r":_n_r_b2,"n":_n_n_b1,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_r = _S.read(_parent,"r")
	var _n_n = _S.read(_parent,"n")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _S.index_value(_n_r,floori((float((_n_i_b1 * (_S.prop(_n_r,"length") - 1)))/(_n_n - 1))+0.5))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_SHADOW = _S.read(_parent,"SHADOW")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_rx_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.coalesce(_S.arg(_args,3),func():return 1)
	if _S.truth((_n_rx_b2 < 1)):
		return null
	if true:
		var _n_row_b4 = 0
		while _S.truth((_n_row_b4 < 2)):
			var _n_w_b5 = (_n_rx_b2 - (_n_row_b4 * 2))
			if true:
				var _n_i_b6 = floori((_n_x_b1 - _n_w_b5))
				while _S.truth((_n_i_b6 < ceili((_n_x_b1 + _n_w_b5)))):
					var _n_e_b7 = (float(absf(((_n_i_b6 + 0.5) - _n_x_b1)))/_n_w_b5)
					if _S.truth((_n_e_b7 <= 1)):
						_S.invoke(_n_p_b0,"dot",[_n_i_b6, _n_row_b4, _n_SHADOW, (_n_k_b3 if _S.truth(_n_row_b4) else (_n_k_b3 * (1 if _S.truth((_n_e_b7 < 0.8)) else 0.5)))])
					_n_i_b6 += 1.0
			_n_row_b4 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_s_b3 = _S.arg(_args,3)
	var _n_c_b4 = _S.arg(_args,4)
	var _n_mid_b5 = _S.coalesce(_S.arg(_args,5),func():return _n_c_b4)
	var _n_core_b6 = _S.coalesce(_S.arg(_args,6),func():return _n_WHITE)
	_n_s_b3 = floori(_n_s_b3+0.5)
	if _S.truth((_n_s_b3 <= 0)):
		return null
	if true:
		var _n_d_b7 = 1
		while _S.truth((_n_d_b7 <= (_n_s_b3 - 1))):
			var _n_k_b8 = (_n_mid_b5 if _S.truth((_n_d_b7 < (float(_n_s_b3)/2))) else _n_c_b4)
			_S.invoke(_n_p_b0,"px",[(_n_x_b1 + _n_d_b7), _n_y_b2, _n_k_b8])
			_S.invoke(_n_p_b0,"px",[(_n_x_b1 - _n_d_b7), _n_y_b2, _n_k_b8])
			_S.invoke(_n_p_b0,"px",[_n_x_b1, (_n_y_b2 + _n_d_b7), _n_k_b8])
			_S.invoke(_n_p_b0,"px",[_n_x_b1, (_n_y_b2 - _n_d_b7), _n_k_b8])
			_n_d_b7 += 1.0
	if _S.truth((_n_s_b3 >= 4)):
		_S.invoke(_n_p_b0,"px",[(_n_x_b1 + 1), (_n_y_b2 + 1), _n_c_b4])
		_S.invoke(_n_p_b0,"px",[(_n_x_b1 - 1), (_n_y_b2 - 1), _n_c_b4])
		_S.invoke(_n_p_b0,"px",[(_n_x_b1 + 1), (_n_y_b2 - 1), _n_c_b4])
		_S.invoke(_n_p_b0,"px",[(_n_x_b1 - 1), (_n_y_b2 + 1), _n_c_b4])
	_S.invoke(_n_p_b0,"px",[_n_x_b1, _n_y_b2, _n_core_b6])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_L_b0 = _S.arg(_args,0)
	var _n_x0_b1 = _S.arg(_args,1)
	var _n_y0_b2 = _S.arg(_args,2)
	var _n_x1_b3 = _S.arg(_args,3)
	var _n_y1_b4 = _S.arg(_args,4)
	var _n_sdf_b5 = _S.arg(_args,5)
	var _n_color_b6 = _S.arg(_args,6)
	var _object_0 = _S.coalesce(_S.arg(_args,7),func():return {})
	var _n_bevel_b7 = _S.coalesce(_S.named_value(_object_0,"bevel"),func():return 3)
	var _n_light_b8 = _S.coalesce(_S.named_value(_object_0,"light"),func():return [(-0.5), (-0.6), 0.62])
	var _n_clip_b9 = _S.coalesce(_S.named_value(_object_0,"clip"),func():return null)
	_S.invoke(_n_L_b0,"fill",[_n_x0_b1, _n_y0_b2, _n_x1_b3, _n_y1_b4, _S.function_value(_S.capture(_parent,{"sdf":_n_sdf_b5,"clip":_n_clip_b9,"bevel":_n_bevel_b7,"color":_n_color_b6,"light":_n_light_b8,"this":_this}),"_f5")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_sdf = _S.read(_parent,"sdf")
	var _n_clip = _S.read(_parent,"clip")
	var _n_bevel = _S.read(_parent,"bevel")
	var _n_color = _S.read(_parent,"color")
	var _n_light = _S.read(_parent,"light")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_d_b2 = _S.call_value(_n_sdf,[_n_x_b0, _n_y_b1])
	if _S.truth(((_n_d_b2 > 0) if _S.truth((_n_d_b2 > 0)) else (_S.call_value(_n_clip,[_n_x_b0, _n_y_b1]) if _S.truth(_n_clip) else _n_clip))):
		return 0
	var _n_e_b3 = (-_n_d_b2)
	var _n_gx_b4 = (_S.call_value(_n_sdf,[(_n_x_b0 + 0.5), _n_y_b1]) - _S.call_value(_n_sdf,[(_n_x_b0 - 0.5), _n_y_b1]))
	var _n_gy_b5 = (_S.call_value(_n_sdf,[_n_x_b0, (_n_y_b1 + 0.5)]) - _S.call_value(_n_sdf,[_n_x_b0, (_n_y_b1 - 0.5)]))
	var _n_gl_b6 = _S.logical("||",_S.Bridge.hypot([_n_gx_b4, _n_gy_b5]),func():return 1)
	_n_gx_b4 /= _n_gl_b6
	_n_gy_b5 /= _n_gl_b6
	var _n_k_b7 = (maxf(0,(1 - (float(_n_e_b3)/_n_bevel))) * 1.25)
	var _n_sn_b8 = sin(_n_k_b7)
	var _n_cs_b9 = cos(_n_k_b7)
	return _S.call_value(_n_color,[((((_n_gx_b4 * _n_sn_b8) * _S.index_value(_n_light,0)) + ((_n_gy_b5 * _n_sn_b8) * _S.index_value(_n_light,1))) + (_n_cs_b9 * _S.index_value(_n_light,2))), _n_e_b3, _n_x_b0, _n_y_b1])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_cx_b2 = _S.arg(_args,2)
	var _n_cy_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_h_b5 = _S.coalesce(_S.arg(_args,5),func():return _n_w_b4)
	var _n_S_b6 = (float(_n_w_b4)/1.14)
	var _n_X_b7 = (float((_n_x_b0 - _n_cx_b2))/_n_S_b6)
	var _n_Y_b8 = ((float((-(_n_y_b1 - _n_cy_b3)))/(float(_n_h_b5)/1.14)) + 0.12)
	var _n_q_b9 = (((_n_X_b7 * _n_X_b7) + (_n_Y_b8 * _n_Y_b8)) - 1)
	var _n_f_b10 = (((_n_q_b9 * _n_q_b9) * _n_q_b9) - ((((_n_X_b7 * _n_X_b7) * _n_Y_b8) * _n_Y_b8) * _n_Y_b8))
	var _n_gx_b11 = ((((6 * _n_X_b7) * _n_q_b9) * _n_q_b9) - ((((2 * _n_X_b7) * _n_Y_b8) * _n_Y_b8) * _n_Y_b8))
	var _n_gy_b12 = ((((6 * _n_Y_b8) * _n_q_b9) * _n_q_b9) - ((((3 * _n_X_b7) * _n_X_b7) * _n_Y_b8) * _n_Y_b8))
	return ((float(_n_f_b10)/maxf(_S.Bridge.hypot([_n_gx_b11, _n_gy_b12]),0.6)) * _n_S_b6)
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_INK = _S.read(_parent,"INK")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_rx_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.coalesce(_S.arg(_args,3),func():return 1)
	var _n_y_b4 = _S.coalesce(_S.arg(_args,4),func():return 0)
	if _S.truth(((_n_rx_b2 < 0.8) if _S.truth((_n_rx_b2 < 0.8)) else (_n_k_b3 <= 0))):
		return null
	if true:
		var _n_i_b5 = floori((_n_x_b1 - _n_rx_b2))
		while _S.truth((_n_i_b5 <= ceili((_n_x_b1 + _n_rx_b2)))):
			var _n_u_b6 = (float(absf(((_n_i_b5 + 0.5) - _n_x_b1)))/_n_rx_b2)
			if _S.truth((_n_u_b6 > 1)):
				_n_i_b5 += 1.0
				continue
			var _n_a_b7 = (_n_k_b3 * (1 - (_n_u_b6 * _n_u_b6)))
			_S.invoke(_n_p_b0,"dot",[_n_i_b5, _n_y_b4, _n_INK, (_n_a_b7 * 1.1)])
			if _S.truth((_n_u_b6 < 0.6)):
				_S.invoke(_n_p_b0,"dot",[_n_i_b5, (_n_y_b4 + 1), _n_INK, (_n_a_b7 * 0.6)])
			_n_i_b5 += 1.0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_arm_b3 = _S.arg(_args,3)
	var _n_c_b4 = _S.arg(_args,4)
	var _n_k_b5 = _S.coalesce(_S.arg(_args,5),func():return 0.4)
	var _n_tip_b6 = _S.coalesce(_S.arg(_args,6),func():return _S.ColorFX.scale_color(_n_c_b4,0.8))
	var _n_n_b7 = floori(_n_arm_b3+0.5)
	var _n_X_b8 = floori(_n_x_b1)
	var _n_Y_b9 = floori(_n_y_b2)
	if _S.truth((_n_n_b7 < 0)):
		return null
	if true:
		var _n_d_b10 = 1
		while _S.truth((_n_d_b10 <= _n_n_b7)):
			var _n_cc_b11 = (_n_tip_b6 if _S.truth(((_n_n_b7 > 1) if _S.truth(_S.binary("===",_n_d_b10,_n_n_b7)) else _S.binary("===",_n_d_b10,_n_n_b7))) else _n_c_b4)
			_S.invoke(_n_p_b0,"px",[(_n_X_b8 + _n_d_b10), _n_Y_b9, _n_cc_b11])
			_S.invoke(_n_p_b0,"px",[(_n_X_b8 - _n_d_b10), _n_Y_b9, _n_cc_b11])
			_S.invoke(_n_p_b0,"px",[_n_X_b8, (_n_Y_b9 + _n_d_b10), _n_cc_b11])
			_S.invoke(_n_p_b0,"px",[_n_X_b8, (_n_Y_b9 - _n_d_b10), _n_cc_b11])
			_n_d_b10 += 1.0
	_S.invoke(_n_p_b0,"px",[_n_X_b8, _n_Y_b9, (_n_WHITE if _S.truth((_n_n_b7 > 0)) else _n_c_b4)])
	_S.invoke(_n_p_b0,"glow",[(_n_X_b8 + 0.5), (_n_Y_b9 + 0.5), (3 + (_n_n_b7 * 2.5)), _n_c_b4, _n_k_b5])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_rx_b3 = _S.arg(_args,3)
	var _n_ry_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.arg(_args,6)
	if _S.truth(((_n_k_b6 <= 0.004) if _S.truth((_n_k_b6 <= 0.004)) else (_n_rx_b3 < 1))):
		return null
	_S.invoke(_n_p_b0,"shade",[(_n_x_b1 - _n_rx_b3), (_n_y_b2 - _n_ry_b4), (_n_x_b1 + _n_rx_b3), (_n_y_b2 + _n_ry_b4), _S.function_value(_S.capture(_parent,{"x":_n_x_b1,"rx":_n_rx_b3,"y":_n_y_b2,"ry":_n_ry_b4,"c":_n_c_b5,"k":_n_k_b6,"this":_this}),"_f10")])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_rx = _S.read(_parent,"rx")
	var _n_y = _S.read(_parent,"y")
	var _n_ry = _S.read(_parent,"ry")
	var _n_c = _S.read(_parent,"c")
	var _n_k = _S.read(_parent,"k")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (float((_n_px_b0 - _n_x))/_n_rx)
	var _n_dy_b4 = (float((_n_py_b1 - _n_y))/_n_ry)
	var _n_d_b5 = ((_n_dx_b3 * _n_dx_b3) + (_n_dy_b4 * _n_dy_b4))
	if _S.truth((_n_d_b5 >= 1)):
		return null
	var _n_f_b6 = (1 - sqrt(_n_d_b5))
	_S.set_prop(_n_out_b2,"l",_n_c,"=")
	_S.set_prop(_n_out_b2,"k",((_n_f_b6 * _n_f_b6) * _n_k),"=")
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_L_b0 = _S.arg(_args,0)
	var _n_p_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_r_b4 = _S.arg(_args,4)
	var _n_ax_b5 = _S.arg(_args,5)
	var _n_spin_b6 = _S.arg(_args,6)
	var _n_C_b7 = _S.arg(_args,7)
	var _n_white_b8 = _S.coalesce(_S.arg(_args,8),func():return false)
	var _n_a_b9 = _S.coalesce(_S.arg(_args,9),func():return 1)
	var _n_snap_b10 = _S.coalesce(_S.arg(_args,10),func():return true)
	var _n_X_b11 = (floori(_n_x_b2+0.5) if _S.truth(_n_snap_b10) else _n_x_b2)
	var _n_Y_b12 = (floori(_n_y_b3+0.5) if _S.truth(_n_snap_b10) else _n_y_b3)
	var _n_cs_b13 = cos(_n_spin_b6)
	var _n_sn_b14 = sin(_n_spin_b6)
	var _n_b_b15 = maxf(0.5,(_n_r_b4 * absf(_n_cs_b13)))
	var _n_th_b16 = ((1.2 * _n_sn_b14) * signf((_n_cs_b13 if _S.truth(_n_cs_b13) else 1)))
	var _n_ca_b17 = cos(_n_ax_b5)
	var _n_sa_b18 = sin(_n_ax_b5)
	var _n_face_b19 = absf(_n_cs_b13)
	var _n_R_b20 = (ceili(_n_r_b4) + 2)
	_S.invoke(_n_L_b0,"begin",[(floori(_n_X_b11) - _n_R_b20), (floori(_n_Y_b12) - _n_R_b20)])
	_S.invoke(_n_L_b0,"fill",[(floori(_n_X_b11) - _n_R_b20), (floori(_n_Y_b12) - _n_R_b20), (floori(_n_X_b11) + _n_R_b20), (floori(_n_Y_b12) + _n_R_b20), _S.function_value(_S.capture(_parent,{"X":_n_X_b11,"Y":_n_Y_b12,"ca":_n_ca_b17,"sa":_n_sa_b18,"r":_n_r_b4,"b":_n_b_b15,"th":_n_th_b16,"white":_n_white_b8,"face":_n_face_b19,"C":_n_C_b7,"this":_this}),"_f12")])
	_S.invoke(_S.invoke(_n_L_b0,"outline",[_S.index_value(_n_C_b7,1)]),"draw",[_n_p_b1, 0, 0, _n_a_b9])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_X = _S.read(_parent,"X")
	var _n_Y = _S.read(_parent,"Y")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_r = _S.read(_parent,"r")
	var _n_b = _S.read(_parent,"b")
	var _n_th = _S.read(_parent,"th")
	var _n_white = _S.read(_parent,"white")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_face = _S.read(_parent,"face")
	var _n_C = _S.read(_parent,"C")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (_n_px_b0 - _n_X)
	var _n_dy_b3 = (_n_py_b1 - _n_Y)
	var _n_u_b4 = ((_n_dx_b2 * _n_ca) + (_n_dy_b3 * _n_sa))
	var _n_w_b5 = (((-_n_dx_b2) * _n_sa) + (_n_dy_b3 * _n_ca))
	var _n_ef_b6 = _S.Bridge.hypot([(float(_n_u_b4)/_n_r), (float(_n_w_b5)/_n_b)])
	var _n_er_b7 = _S.Bridge.hypot([(float(_n_u_b4)/_n_r), (float((_n_w_b5 - _n_th))/_n_b)])
	if _S.truth((((_n_ef_b6 <= 1) if _S.truth((_n_ef_b6 <= 1)) else (_n_er_b7 <= 1)) if _S.truth(_n_white) else _n_white)):
		return _n_WHITE
	if _S.truth((_n_ef_b6 <= 1)):
		var _n_lit_b8 = (float((-((_n_dx_b2 * 0.62) + (_n_dy_b3 * 0.78))))/maxf(1,_S.Bridge.hypot([_n_dx_b2, _n_dy_b3])))
		var _n_dim_b9 = (1 if _S.truth((_n_face < 0.45)) else 0)
		if _S.truth((_n_b < 1.1)):
			return (_S.index_value(_n_C,6) if _S.truth((_n_lit_b8 > 0)) else _S.index_value(_n_C,4))
		if _S.truth((_n_ef_b6 > 0.72)):
			return _S.index_value(_n_C,((6 if _S.truth((_n_lit_b8 > 0.3)) else (5 if _S.truth((_n_lit_b8 > (-0.35))) else 3)) - _n_dim_b9))
		if _S.truth(((_n_ef_b6 > 0.42) if _S.truth((_n_b > 2.2)) else (_n_b > 2.2))):
			return _S.index_value(_n_C,((4 if _S.truth((_n_lit_b8 > 0.2)) else 5) - _n_dim_b9))
		if _S.truth(((_n_lit_b8 > 0.5) if _S.truth((_n_face > 0.6)) else (_n_face > 0.6))):
			return _S.index_value(_n_C,7)
		return _S.index_value(_n_C,(5 - _n_dim_b9))
	if _S.truth((_n_er_b7 <= 1)):
		return (_S.index_value(_n_C,2) if _S.truth((absf((_n_w_b5 - _n_th)) < absf(_n_w_b5))) else _S.index_value(_n_C,3))
	return 0
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_L_b0 = _S.arg(_args,0)
	var _n_p_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_r_b4 = _S.arg(_args,4)
	var _n_ang_b5 = _S.arg(_args,5)
	var _n_G_b6 = _S.arg(_args,6)
	var _n_white_b7 = _S.coalesce(_S.arg(_args,7),func():return false)
	var _n_a_b8 = _S.coalesce(_S.arg(_args,8),func():return 1)
	var _n_X_b9 = floori(_n_x_b2+0.5)
	var _n_Y_b10 = floori(_n_y_b3+0.5)
	var _n_ca_b11 = cos(_n_ang_b5)
	var _n_sa_b12 = sin(_n_ang_b5)
	var _n_n_b13 = _S.prop(_n_G_b6,"length")
	var _n_R_b14 = (ceili((_n_r_b4 * 1.4)) + 2)
	var _n_ct_b15 = (_n_r_b4 * 0.75)
	var _n_tw_b16 = (_n_r_b4 * 0.5)
	var _n_pv_b17 = (_n_r_b4 * 1.3)
	_S.invoke(_n_L_b0,"begin",[(_n_X_b9 - _n_R_b14), (_n_Y_b10 - _n_R_b14)])
	_S.invoke(_n_L_b0,"fill",[(_n_X_b9 - _n_R_b14), (_n_Y_b10 - _n_R_b14), ((_n_X_b9 + _n_R_b14) - 1), ((_n_Y_b10 + _n_R_b14) - 1), _S.function_value(_S.capture(_parent,{"X":_n_X_b9,"Y":_n_Y_b10,"ca":_n_ca_b11,"sa":_n_sa_b12,"ct":_n_ct_b15,"r":_n_r_b4,"tw":_n_tw_b16,"pv":_n_pv_b17,"white":_n_white_b7,"G":_n_G_b6,"n":_n_n_b13,"this":_this}),"_f14")])
	_S.invoke(_S.invoke(_n_L_b0,"outline",[_S.index_value(_n_G_b6,0)]),"draw",[_n_p_b1, 0, 0, _n_a_b8])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_X = _S.read(_parent,"X")
	var _n_Y = _S.read(_parent,"Y")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_ct = _S.read(_parent,"ct")
	var _n_r = _S.read(_parent,"r")
	var _n_tw = _S.read(_parent,"tw")
	var _n_pv = _S.read(_parent,"pv")
	var _n_white = _S.read(_parent,"white")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_G = _S.read(_parent,"G")
	var _n_n = _S.read(_parent,"n")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (_n_px_b0 - _n_X)
	var _n_dy_b3 = (_n_py_b1 - _n_Y)
	var _n_u_b4 = ((_n_dx_b2 * _n_ca) + (_n_dy_b3 * _n_sa))
	var _n_w_b5 = (((-_n_dx_b2) * _n_sa) + (_n_dy_b3 * _n_ca))
	var _n_facet_b6 = null
	if _S.truth((_n_w_b5 < 0)):
		if _S.truth(((_n_w_b5 < (-_n_ct)) if _S.truth((_n_w_b5 < (-_n_ct))) else (absf(_n_u_b4) > (_n_r - ((float((-_n_w_b5))/_n_ct) * (_n_r - _n_tw)))))):
			return 0
		_n_facet_b6 = (0 if _S.truth(((absf(_n_u_b4) < (_n_tw * 0.95)) if _S.truth((_n_w_b5 < ((-_n_ct) * 0.45))) else (_n_w_b5 < ((-_n_ct) * 0.45)))) else (1 if _S.truth((_n_u_b4 < 0)) else 2))
	else:
		if _S.truth(((_n_w_b5 > _n_pv) if _S.truth((_n_w_b5 > _n_pv)) else (absf(_n_u_b4) > (_n_r * (1 - (float(_n_w_b5)/_n_pv)))))):
			return 0
		_n_facet_b6 = (4 if _S.truth((absf(_n_u_b4) < 0.5)) else (3 if _S.truth((_n_u_b4 < 0)) else 5))
	if _S.truth(_n_white):
		return _n_WHITE
	var _n_N_b7 = _S.index_value([[0, (-1)], [(-0.7), (-0.7)], [0.7, (-0.7)], [(-0.6), 0.8], [0, 1], [0.6, 0.8]],_n_facet_b6)
	var _n_nx_b8 = ((_S.index_value(_n_N_b7,0) * _n_ca) - (_S.index_value(_n_N_b7,1) * _n_sa))
	var _n_ny_b9 = ((_S.index_value(_n_N_b7,0) * _n_sa) + (_S.index_value(_n_N_b7,1) * _n_ca))
	var _n_l_b10 = (-((_n_nx_b8 * 0.62) + (_n_ny_b9 * 0.78)))
	if _S.truth(((_n_u_b4 < 0) if _S.truth(((_n_l_b10 > 0.3) if _S.truth(_S.binary("===",_n_facet_b6,0)) else _S.binary("===",_n_facet_b6,0))) else ((_n_l_b10 > 0.3) if _S.truth(_S.binary("===",_n_facet_b6,0)) else _S.binary("===",_n_facet_b6,0)))):
		return _n_WHITE
	return (_S.index_value(_n_G,(_n_n - 1)) if _S.truth((_n_l_b10 > 0.6)) else (_S.index_value(_n_G,(_n_n - 2)) if _S.truth((_n_l_b10 > 0.2)) else (_S.index_value(_n_G,(_n_n - 3)) if _S.truth((_n_l_b10 > (-0.2))) else (_S.index_value(_n_G,(_n_n - 4)) if _S.truth((_n_l_b10 > (-0.6))) else _S.index_value(_n_G,(_n_n - 5))))))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _object_0 = _S.coalesce(_S.arg(_args,0),func():return {})
	var _n_r_b0 = _S.coalesce(_S.named_value(_object_0,"r"),func():return 7.5)
	var _n_crown_b1 = _S.coalesce(_S.named_value(_object_0,"crown"),func():return 3.6)
	var _n_table_b2 = _S.coalesce(_S.named_value(_object_0,"table"),func():return 0.52)
	var _n_pavilion_b3 = _S.coalesce(_S.named_value(_object_0,"pavilion"),func():return 8)
	var _n_girdle_b4 = _S.coalesce(_S.named_value(_object_0,"girdle"),func():return 0.8)
	var _n_n_b5 = _S.coalesce(_S.named_value(_object_0,"n"),func():return 8)
	var _n_planes_b6 = [{"n":[0, 1, 0],"d":(_n_crown_b1 + (float(_n_girdle_b4)/2)),"kind":0}]
	var _n_cs_b7 = atan2(_n_crown_b1,(_n_r_b0 * (1 - _n_table_b2)))
	var _n_ps_b8 = atan2(_n_pavilion_b3,_n_r_b0)
	if true:
		var _n_i_b9 = 0
		while _S.truth((_n_i_b9 < (_n_n_b5 * 2))):
			var _n_a_b10 = (float((_n_i_b9 * PI))/_n_n_b5)
			var _n_half_b11 = fmod(_n_i_b9,2)
			var _n_c_b12 = (minf(1.45,(_n_cs_b7 + 0.22)) if _S.truth(_n_half_b11) else _n_cs_b7)
			var _n_pv_b13 = ((_n_ps_b8 - 0.1) if _S.truth(_n_half_b11) else _n_ps_b8)
			_S.invoke(_n_planes_b6,"push",[{"n":[(sin(_n_c_b12) * cos(_n_a_b10)), cos(_n_c_b12), (sin(_n_c_b12) * sin(_n_a_b10))],"d":(((_n_r_b0 * sin(_n_c_b12)) * (1.012 if _S.truth(_n_half_b11) else 1)) + ((float(_n_girdle_b4)/2) * cos(_n_c_b12))),"kind":(2 if _S.truth(_n_half_b11) else 1)}])
			_S.invoke(_n_planes_b6,"push",[{"n":[cos(_n_a_b10), 0, sin(_n_a_b10)],"d":(_n_r_b0 * (1 if _S.truth(_n_half_b11) else 1)),"kind":3}])
			_S.invoke(_n_planes_b6,"push",[{"n":[(sin(_n_pv_b13) * cos(_n_a_b10)), (-cos(_n_pv_b13)), (sin(_n_pv_b13) * sin(_n_a_b10))],"d":(((_n_r_b0 * sin(_n_pv_b13)) * (1.03 if _S.truth(_n_half_b11) else 1)) + ((float(_n_girdle_b4)/2) * cos(_n_pv_b13))),"kind":(5 if _S.truth(_n_half_b11) else 4)}])
			_n_i_b9 += 1.0
	return {"planes":_n_planes_b6,"r":_n_r_b0,"top":(_n_crown_b1 + (float(_n_girdle_b4)/2)),"bottom":(_n_pavilion_b3 + (float(_n_girdle_b4)/2))}
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _object_0 = _S.coalesce(_S.arg(_args,0),func():return {})
	var _n_r_b0 = _S.coalesce(_S.named_value(_object_0,"r"),func():return 4.6)
	var _n_half_b1 = _S.coalesce(_S.named_value(_object_0,"half"),func():return 5.5)
	var _n_top_b2 = _S.coalesce(_S.named_value(_object_0,"top"),func():return 7.5)
	var _n_bottom_b3 = _S.coalesce(_S.named_value(_object_0,"bottom"),func():return 6)
	var _n_n_b4 = _S.coalesce(_S.named_value(_object_0,"n"),func():return 6)
	var _n_planes_b5 = []
	var _n_ct_b6 = atan2(_n_top_b2,_n_r_b0)
	var _n_cb_b7 = atan2(_n_bottom_b3,_n_r_b0)
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < _n_n_b4)):
			var _n_a_b9 = (float((_n_i_b8 * _n_TAU))/_n_n_b4)
			_S.invoke(_n_planes_b5,"push",[{"n":[cos(_n_a_b9), 0, sin(_n_a_b9)],"d":_n_r_b0,"kind":6}])
			_S.invoke(_n_planes_b5,"push",[{"n":[(sin(_n_ct_b6) * cos(_n_a_b9)), cos(_n_ct_b6), (sin(_n_ct_b6) * sin(_n_a_b9))],"d":((sin(_n_ct_b6) * _n_r_b0) + (cos(_n_ct_b6) * _n_half_b1)),"kind":7}])
			_S.invoke(_n_planes_b5,"push",[{"n":[(sin(_n_cb_b7) * cos(_n_a_b9)), (-cos(_n_cb_b7)), (sin(_n_cb_b7) * sin(_n_a_b9))],"d":((sin(_n_cb_b7) * _n_r_b0) + (cos(_n_cb_b7) * _n_half_b1)),"kind":8}])
			_n_i_b8 += 1.0
	return {"planes":_n_planes_b5,"r":(float(_n_r_b0)/cos((float(PI)/_n_n_b4))),"top":(_n_half_b1 + _n_top_b2),"bottom":(_n_half_b1 + _n_bottom_b3)}
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "L", _S.arg(_args, 0))
	_S.define(_e, "p", _S.arg(_args, 1))
	_S.define(_e, "g", _S.arg(_args, 2))
	_S.define(_e, "x", _S.arg(_args, 3))
	_S.define(_e, "y", _S.arg(_args, 4))
	_S.define(_e, "spin", _S.arg(_args, 5))
	_S.define(_e, "C", _S.arg(_args, 6))
	var _v21 = _S.coalesce(_S.arg(_args, 7), func(): return _S.merge([]))
	_S.define(_e, "tilt", _S.coalesce(_S.prop(_v21, "tilt"), func(): return 0.32))
	_S.define(_e, "white", _S.coalesce(_S.prop(_v21, "white"), func(): return false))
	_S.define(_e, "a", _S.coalesce(_S.prop(_v21, "a"), func(): return 1))
	_S.define(_e, "edges", _S.coalesce(_S.prop(_v21, "edges"), func(): return true))
	_S.define(_e, "gain", _S.coalesce(_S.prop(_v21, "gain"), func(): return 1))
	_S.define(_e, "cs", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "spin")]))
	_S.define(_e, "sn", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "spin")]))
	_S.define(_e, "ct", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "tilt")]))
	_S.define(_e, "st", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "tilt")]))
	_S.define(_e, "P", _S.invoke(_S.prop(_S.read(_e, "g"), "planes"), "map", [_S.function_value(_e, "_f18")]))
	_S.define(_e, "Lx", _S.unary("-", 0.55))
	_S.define(_e, "Ly", 0.72)
	_S.define(_e, "Lz", 0.42)
	_S.define(_e, "D", [0, _S.unary("-", _S.read(_e, "st")), _S.unary("-", _S.read(_e, "ct"))])
	_S.define(_e, "V", [0, _S.read(_e, "st"), _S.read(_e, "ct")])
	_S.define(_e, "Hl", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("+", _S.read(_e, "Lx"), _S.prop(_S.read(_e, "V"), 0)), _S.binary("+", _S.read(_e, "Ly"), _S.prop(_S.read(_e, "V"), 1)), _S.binary("+", _S.read(_e, "Lz"), _S.prop(_S.read(_e, "V"), 2))]))
	_S.define(_e, "H", [_S.binary("/", _S.binary("+", _S.read(_e, "Lx"), _S.prop(_S.read(_e, "V"), 0)), _S.read(_e, "Hl")), _S.binary("/", _S.binary("+", _S.read(_e, "Ly"), _S.prop(_S.read(_e, "V"), 1)), _S.read(_e, "Hl")), _S.binary("/", _S.binary("+", _S.read(_e, "Lz"), _S.prop(_S.read(_e, "V"), 2)), _S.read(_e, "Hl"))])
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.define(_e, "R", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.prop(_S.read(_e, "g"), "r")]), 2))
	_S.define(_e, "top", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_e, "g"), "top"), 2)]))
	_S.define(_e, "bot", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_e, "g"), "bottom"), 2)]))
	_S.define(_e, "best", _S.unary("-", 1))
	_S.define(_e, "bx", _S.read(_e, "X"))
	_S.define(_e, "by", _S.read(_e, "Y"))
	_S.define(_e, "ids", _S.construct(_S.read(_e, "Map"), []))
	_S.invoke(_S.read(_e, "L"), "begin", [_S.binary("-", _S.read(_e, "X"), _S.read(_e, "R")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "top"))])
	_S.invoke(_S.read(_e, "L"), "fill", [_S.binary("-", _S.read(_e, "X"), _S.read(_e, "R")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "top")), _S.binary("+", _S.read(_e, "X"), _S.read(_e, "R")), _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "bot")), _S.function_value(_e, "_f19")])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "white")), func(): return _S.read(_e, "edges"))):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "out", [])
		for _v28 in _S.array(_S.read(_v27, "ids")):
			var _v29 = _S.scope(_v27)
			var _v30 = _v28
			_S.define(_v29, "key", _S.prop(_v30, 0))
			_S.define(_v29, "id", _S.prop(_v30, 1))
			var _v31 = _S.scope(_v29)
			_S.define(_v31, "kx", _S.invoke(_S.read(_v31, "Math"), "floor", [_S.binary("/", _S.read(_v31, "key"), 1000)]))
			_S.define(_v31, "ky", _S.binary("-", _S.read(_v31, "key"), _S.binary("*", _S.read(_v31, "kx"), 1000)))
			_S.define(_v31, "x", _S.binary("-", _S.read(_v31, "kx"), 500))
			_S.define(_v31, "y", _S.binary("-", _S.read(_v31, "ky"), 500))
			_S.define(_v31, "r", _S.invoke(_S.read(_v31, "ids"), "get", [_S.binary("+", _S.read(_v31, "key"), 1000)]))
			_S.define(_v31, "d", _S.invoke(_S.read(_v31, "ids"), "get", [_S.binary("+", _S.read(_v31, "key"), 1)]))
			if _S.truth(_S.logical("||", _S.logical("&&", _S.binary("!==", _S.read(_v31, "r"), null), func(): return _S.binary("!==", _S.read(_v31, "r"), _S.read(_v31, "id"))), func(): return _S.logical("&&", _S.binary("!==", _S.read(_v31, "d"), null), func(): return _S.binary("!==", _S.read(_v31, "d"), _S.read(_v31, "id"))))):
				var _v32 = _S.scope(_v31)
				_S.define(_v32, "c", _S.binary(">>>", _S.invoke(_S.read(_v32, "L"), "get", [_S.read(_v32, "x"), _S.read(_v32, "y")]), 0))
				_S.define(_v32, "i", _S.invoke(_S.read(_v32, "C"), "findIndex", [_S.function_value(_v32, "_f20")]))
				_S.define(_v32, "pav", _S.invoke([4, 5, 8], "includes", [_S.prop(_S.prop(_S.read(_v32, "P"), _S.read(_v32, "id")), "kind")]))
				if _S.truth(_S.binary(">", _S.read(_v32, "i"), 0)):
					_S.invoke(_S.read(_v32, "out"), "push", [[_S.read(_v32, "x"), _S.read(_v32, "y"), (_S.prop(_S.read(_v32, "C"), _S.invoke(_S.read(_v32, "Math"), "max", [1, _S.binary("-", _S.read(_v32, "i"), 1)])) if _S.truth(_S.read(_v32, "pav")) else _S.prop(_S.read(_v32, "C"), _S.invoke(_S.read(_v32, "Math"), "min", [7, _S.binary("+", _S.read(_v32, "i"), 1)])))]])
		for _v33 in _S.array(_S.read(_v27, "out")):
			var _v34 = _S.scope(_v27)
			var _v35 = _v33
			_S.define(_v34, "x", _S.prop(_v35, 0))
			_S.define(_v34, "y", _S.prop(_v35, 1))
			_S.define(_v34, "c", _S.prop(_v35, 2))
			_S.invoke(_S.read(_v34, "L"), "set", [_S.read(_v34, "x"), _S.read(_v34, "y"), _S.read(_v34, "c")])
	_S.invoke(_S.invoke(_S.read(_e, "L"), "outline", [_S.prop(_S.read(_e, "C"), 0)]), "draw", [_S.read(_e, "p"), 0, 0, _S.read(_e, "a")])
	return _S.merge([{"x": _S.read(_e, "bx")}, {"y": _S.read(_e, "by")}, {"k": _S.read(_e, "best")}])

static func _f18(_parent,_args:Array,_this=null):
	var _n_cs = _S.read(_parent,"cs")
	var _n_sn = _S.read(_parent,"sn")
	var _n_q_b0 = _S.arg(_args,0)
	return {"n":[((_S.index_value(_S.named_value(_n_q_b0,"n"),0) * _n_cs) - (_S.index_value(_S.named_value(_n_q_b0,"n"),2) * _n_sn)), _S.index_value(_S.named_value(_n_q_b0,"n"),1), ((_S.index_value(_S.named_value(_n_q_b0,"n"),0) * _n_sn) + (_S.index_value(_S.named_value(_n_q_b0,"n"),2) * _n_cs))],"d":_S.named_value(_n_q_b0,"d"),"kind":_S.named_value(_n_q_b0,"kind")}
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "X")))
	_S.define(_e, "sy", _S.unary("-", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "Y"))))
	_S.define(_e, "o", [_S.read(_e, "sx"), _S.binary("*", _S.read(_e, "sy"), _S.read(_e, "ct")), _S.binary("*", _S.unary("-", _S.read(_e, "sy")), _S.read(_e, "st"))])
	_S.define(_e, "t0", _S.unary("-", 1000000000))
	_S.define(_e, "t1", 1000000000)
	_S.define(_e, "hit", null)
	for _v22 in _S.array(_S.read(_e, "P")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "q", _v22)
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "nd", _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.prop(_S.read(_v24, "q"), "n"), 0), _S.prop(_S.read(_v24, "D"), 0)), _S.binary("*", _S.prop(_S.prop(_S.read(_v24, "q"), "n"), 1), _S.prop(_S.read(_v24, "D"), 1))), _S.binary("*", _S.prop(_S.prop(_S.read(_v24, "q"), "n"), 2), _S.prop(_S.read(_v24, "D"), 2))))
		_S.define(_v24, "no", _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.prop(_S.read(_v24, "q"), "n"), 0), _S.prop(_S.read(_v24, "o"), 0)), _S.binary("*", _S.prop(_S.prop(_S.read(_v24, "q"), "n"), 1), _S.prop(_S.read(_v24, "o"), 1))), _S.binary("*", _S.prop(_S.prop(_S.read(_v24, "q"), "n"), 2), _S.prop(_S.read(_v24, "o"), 2))))
		if _S.truth(_S.binary("<", _S.invoke(_S.read(_v24, "Math"), "abs", [_S.read(_v24, "nd")]), 0.000001)):
			var _v25 = _S.scope(_v24)
			if _S.truth(_S.binary(">", _S.read(_v25, "no"), _S.prop(_S.read(_v25, "q"), "d"))):
				return 0
			continue
		_S.define(_v24, "tt", _S.binary("/", _S.binary("-", _S.prop(_S.read(_v24, "q"), "d"), _S.read(_v24, "no")), _S.read(_v24, "nd")))
		if _S.truth(_S.binary("<", _S.read(_v24, "nd"), 0)):
			var _v26 = _S.scope(_v24)
			if _S.truth(_S.binary(">", _S.read(_v26, "tt"), _S.read(_v26, "t0"))):
				_S.last([_S.write(_v26, "t0", _S.read(_v26, "tt"), "=", false), _S.write(_v26, "hit", _S.read(_v26, "q"), "=", false)])
		else:
			if _S.truth(_S.binary("<", _S.read(_v24, "tt"), _S.read(_v24, "t1"))):
				_S.write(_v24, "t1", _S.read(_v24, "tt"), "=", false)
	if _S.truth(_S.logical("||", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">", _S.read(_e, "t0"), _S.read(_e, "t1")))):
		return 0
	if _S.truth(_S.read(_e, "white")):
		return _S.read(_e, "WHITE")
	_S.invoke(_S.read(_e, "ids"), "set", [_S.binary("+", _S.binary("+", _S.binary("*", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "px")]), 500), 1000), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "py")])), 500), _S.invoke(_S.read(_e, "P"), "indexOf", [_S.read(_e, "hit")])])
	_S.define(_e, "n", _S.prop(_S.read(_e, "hit"), "n"))
	_S.define(_e, "pav", _S.logical("||", _S.logical("||", _S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 4), func(): return _S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 5)), func(): return _S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 8)))
	_S.define(_e, "m", ([_S.prop(_S.read(_e, "n"), 0), _S.binary("*", _S.unary("-", _S.prop(_S.read(_e, "n"), 1)), 0.6), _S.prop(_S.read(_e, "n"), 2)] if _S.truth(_S.read(_e, "pav")) else _S.read(_e, "n")))
	_S.define(_e, "ml", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.prop(_S.read(_e, "m"), 0), _S.prop(_S.read(_e, "m"), 1), _S.prop(_S.read(_e, "m"), 2)]))
	_S.define(_e, "lam", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("/", _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "m"), 0), _S.read(_e, "Lx")), _S.binary("*", _S.prop(_S.read(_e, "m"), 1), _S.read(_e, "Ly"))), _S.binary("*", _S.prop(_S.read(_e, "m"), 2), _S.read(_e, "Lz"))), _S.read(_e, "ml"))]))
	_S.define(_e, "spec", _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("/", _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "m"), 0), _S.prop(_S.read(_e, "H"), 0)), _S.binary("*", _S.prop(_S.read(_e, "m"), 1), _S.prop(_S.read(_e, "H"), 1))), _S.binary("*", _S.prop(_S.read(_e, "m"), 2), _S.prop(_S.read(_e, "H"), 2))), _S.read(_e, "ml"))]), 18]))
	_S.define(_e, "b", (_S.binary("+", 0.02, _S.binary("*", 0.72, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "lam"), 2.4]))) if _S.truth(_S.read(_e, "pav")) else (_S.binary("+", 0.12, _S.binary("*", 0.4, _S.read(_e, "lam"))) if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 3)) else _S.binary("+", 0.04, _S.binary("*", 0.66, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "lam"), 1.8]))))))
	if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 6)):
		_S.write(_e, "b", _S.binary("+", 0.16, _S.binary("*", 0.66, _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("/", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "n"), 0), _S.read(_e, "Lx")), _S.binary("*", _S.prop(_S.read(_e, "n"), 2), _S.read(_e, "Lz"))), _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "Lx"), _S.read(_e, "Lz")]))]), 1.3]))), "=", false)
	else:
		if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 7)):
			_S.write(_e, "b", _S.binary("+", 0.22, _S.binary("*", 0.62, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "lam"), 1.2]))), "=", false)
		else:
			if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 9)):
				_S.write(_e, "b", _S.binary("+", 0.62, _S.binary("*", 0.25, _S.read(_e, "lam"))), "=", false)
			else:
				if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 10)):
					_S.write(_e, "b", _S.binary("+", _S.binary("+", 0.3, _S.binary("*", 0.5, _S.read(_e, "lam"))), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "px"), _S.read(_e, "X"))]), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "py"), _S.read(_e, "Y"))]), 43]), 0.5), 0.08)), "=", false)
	if _S.truth(_S.binary("!==", _S.prop(_S.read(_e, "hit"), "kind"), 9)):
		_S.write(_e, "b", _S.read(_e, "gain"), "*=", false)
	if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "hit"), "kind"), 0)):
		_S.write(_e, "b", 0.04, "-=", false)
	_S.define(_e, "s", _S.binary("+", _S.read(_e, "b"), _S.binary("*", _S.read(_e, "spec"), 0.6)))
	if _S.truth(_S.binary(">", _S.read(_e, "s"), _S.read(_e, "best"))):
		_S.last([_S.write(_e, "best", _S.read(_e, "s"), "=", false), _S.write(_e, "bx", _S.read(_e, "px"), "=", false), _S.write(_e, "by", _S.read(_e, "py"), "=", false)])
	if _S.truth(_S.binary(">", _S.read(_e, "spec"), 0.8)):
		return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.read(_e, "pav")) else _S.read(_e, "WHITE"))
	return _S.prop(_S.read(_e, "C"), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.invoke(_S.read(_e, "Math"), "min", [6, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", 1, _S.binary("*", _S.read(_e, "s"), 5.6))])])]))

static func _f20(_parent,_args:Array,_this=null):
	var _n_c = _S.read(_parent,"c")
	var _n_k_b0 = _S.arg(_args,0)
	return _S.binary("===",_S.binary(">>>",_n_k_b0,0),_n_c)
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "L", _S.arg(_args, 0))
	_S.define(_e, "p", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "r", _S.arg(_args, 4))
	_S.define(_e, "th", _S.arg(_args, 5))
	_S.define(_e, "theta", _S.arg(_args, 6))
	_S.define(_e, "C", _S.arg(_args, 7))
	var _v36 = _S.coalesce(_S.arg(_args, 8), func(): return _S.merge([]))
	_S.define(_e, "a", _S.coalesce(_S.prop(_v36, "a"), func(): return 1))
	_S.define(_e, "white", _S.coalesce(_S.prop(_v36, "white"), func(): return false))
	_S.define(_e, "ct", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "theta")]))
	_S.define(_e, "st", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "theta")]))
	_S.define(_e, "sg", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.read(_e, "ct"), 0)) else 1))
	_S.define(_e, "act", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "ct")]))
	_S.define(_e, "ast", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "st")]))
	_S.define(_e, "xc", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "th"), 2), _S.read(_e, "st")), _S.read(_e, "sg")))
	_S.define(_e, "nfx", _S.binary("*", _S.read(_e, "st"), _S.read(_e, "sg")))
	_S.define(_e, "Lx", _S.unary("-", 0.55))
	_S.define(_e, "Ly", 0.45)
	_S.define(_e, "Lz", 0.7)
	_S.define(_e, "Ln", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "Lx"), _S.read(_e, "Ly"), _S.read(_e, "Lz")]))
	_S.define(_e, "lam", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_e, "nfx"), _S.read(_e, "Lx")), _S.binary("*", _S.read(_e, "act"), _S.read(_e, "Lz"))), _S.read(_e, "Ln")))
	_S.define(_e, "Hx", _S.binary("/", _S.read(_e, "Lx"), _S.read(_e, "Ln")))
	_S.define(_e, "Hz", _S.binary("+", _S.binary("/", _S.read(_e, "Lz"), _S.read(_e, "Ln")), 1))
	_S.define(_e, "Hn", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "Hx"), _S.read(_e, "Hz")]))
	_S.define(_e, "base", _S.invoke(_S.read(_e, "Math"), "max", [2, _S.invoke(_S.read(_e, "Math"), "min", [5, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", 2, _S.binary("*", _S.read(_e, "lam"), 3.2))])])]))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.define(_e, "B", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.read(_e, "r"), _S.read(_e, "th"))]), 2))
	_S.define(_e, "flash", 0)
	_S.invoke(_S.read(_e, "L"), "begin", [_S.binary("-", _S.read(_e, "X"), _S.read(_e, "B")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "B"))])
	_S.invoke(_S.read(_e, "L"), "fill", [_S.binary("-", _S.read(_e, "X"), _S.read(_e, "B")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "B")), _S.binary("+", _S.read(_e, "X"), _S.read(_e, "B")), _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "B")), _S.function_value(_e, "_f22")])
	_S.invoke(_S.invoke(_S.read(_e, "L"), "outline", [_S.prop(_S.read(_e, "C"), 1)]), "draw", [_S.read(_e, "p"), 0, 0, _S.read(_e, "a")])
	return _S.read(_e, "flash")

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "X")))
	_S.define(_e, "sy", _S.unary("-", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "Y"))))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "sy")]), _S.read(_e, "r"))):
		return 0
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("**", _S.binary("/", _S.read(_e, "sy"), _S.read(_e, "r")), 2))]))
	_S.define(_e, "hw", _S.binary("*", _S.binary("*", _S.read(_e, "r"), _S.read(_e, "s")), _S.read(_e, "act")))
	_S.define(_e, "xr", _S.binary("*", _S.binary("*", _S.binary("*", _S.unary("-", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.read(_e, "st"), 0)) else 1)), _S.read(_e, "s")), _S.read(_e, "r")), _S.read(_e, "ct")))
	_S.define(_e, "rw", _S.binary("*", _S.binary("/", _S.read(_e, "th"), 2), _S.read(_e, "ast")))
	if _S.truth(_S.logical("&&", _S.read(_e, "white"), func(): return _S.logical("||", _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "sx"), _S.read(_e, "xc"))]), _S.read(_e, "hw")), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "sx"), _S.read(_e, "xr"))]), _S.binary("+", _S.read(_e, "rw"), 0.05))))):
		return _S.read(_e, "WHITE")
	if _S.truth(_S.logical("&&", _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "sx"), _S.read(_e, "xc"))]), _S.read(_e, "hw")), func(): return _S.binary(">", _S.read(_e, "act"), 0.08))):
		var _v37 = _S.scope(_e)
		_S.define(_v37, "fx", _S.binary("/", _S.binary("-", _S.read(_v37, "sx"), _S.read(_v37, "xc")), _S.read(_v37, "act")))
		_S.define(_v37, "fy", _S.read(_v37, "sy"))
		_S.define(_v37, "d", _S.binary("/", _S.invoke(_S.read(_v37, "Math"), "hypot", [_S.read(_v37, "fx"), _S.read(_v37, "fy")]), _S.read(_v37, "r")))
		_S.define(_v37, "tx", _S.binary("+", _S.read(_v37, "nfx"), _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v37, "fx"), _S.read(_v37, "r")), 0.3), _S.read(_v37, "act"))))
		_S.define(_v37, "sp", _S.invoke(_S.read(_v37, "Math"), "pow", [_S.invoke(_S.read(_v37, "Math"), "max", [0, _S.binary("/", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_v37, "tx"), _S.read(_v37, "Hx")), _S.binary("*", _S.read(_v37, "act"), _S.read(_v37, "Hz"))), _S.read(_v37, "Hn")), _S.invoke(_S.read(_v37, "Math"), "hypot", [_S.read(_v37, "tx"), _S.read(_v37, "act")]))]), 130]))
		_S.write(_v37, "flash", _S.invoke(_S.read(_v37, "Math"), "max", [_S.read(_v37, "flash"), _S.read(_v37, "sp")]), "=", false)
		_S.define(_v37, "lit", _S.binary("/", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v37, "fx")), 0.6), _S.binary("*", _S.read(_v37, "fy"), 0.8)), _S.invoke(_S.read(_v37, "Math"), "max", [0.5, _S.invoke(_S.read(_v37, "Math"), "hypot", [_S.read(_v37, "fx"), _S.read(_v37, "fy")])])))
		_S.define(_v37, "k", null)
		if _S.truth(_S.binary(">", _S.read(_v37, "d"), 0.76)):
			_S.write(_v37, "k", _S.binary("+", _S.read(_v37, "base"), (2 if _S.truth(_S.binary(">", _S.read(_v37, "lit"), 0.75)) else (1 if _S.truth(_S.binary(">", _S.read(_v37, "lit"), 0.3)) else (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.read(_v37, "lit"), _S.unary("-", 0.35))) else 0)))), "=", false)
		else:
			var _v38 = _S.scope(_v37)
			_S.define(_v38, "q", _S.binary("/", _S.binary("+", _S.invoke(_S.read(_v38, "Math"), "abs", [_S.read(_v38, "fx")]), _S.invoke(_S.read(_v38, "Math"), "abs", [_S.read(_v38, "fy")])), _S.binary("*", _S.read(_v38, "r"), 0.52)))
			_S.write(_v38, "k", (_S.binary("-", _S.read(_v38, "base"), 1) if _S.truth(_S.binary(">=", _S.read(_v38, "q"), 1)) else (_S.binary("+", _S.read(_v38, "base"), 1) if _S.truth(_S.binary("<", _S.read(_v38, "q"), 0.45)) else (_S.binary("+", _S.read(_v38, "base"), 1) if _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_v38, "fx"), 0), func(): return _S.binary(">=", _S.read(_v38, "fy"), 0))) else (_S.binary("-", _S.read(_v38, "base"), 2) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v38, "fx"), 0), func(): return _S.binary("<", _S.read(_v38, "fy"), 0))) else _S.read(_v38, "base"))))), "=", false)
		if _S.truth(_S.binary(">", _S.read(_v37, "sp"), 0.5)):
			return (_S.read(_v37, "WHITE") if _S.truth(_S.binary(">", _S.read(_v37, "sp"), 0.8)) else _S.prop(_S.read(_v37, "C"), _S.invoke(_S.read(_v37, "Math"), "min", [7, _S.binary("+", _S.read(_v37, "k"), 2)])))
		return _S.prop(_S.read(_v37, "C"), _S.invoke(_S.read(_v37, "Math"), "max", [2, _S.invoke(_S.read(_v37, "Math"), "min", [6, _S.read(_v37, "k")])]))
	if _S.truth(_S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "sx"), _S.read(_e, "xr"))]), _S.binary("+", _S.read(_e, "rw"), 0.05))):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "cphi", (_S.unary("-", _S.read(_v39, "s")) if _S.truth(_S.binary("<", _S.read(_v39, "xr"), 0)) else _S.read(_v39, "s")))
		_S.define(_v39, "n", [_S.binary("*", _S.read(_v39, "cphi"), _S.read(_v39, "ct")), _S.binary("/", _S.read(_v39, "sy"), _S.read(_v39, "r")), _S.binary("*", _S.unary("-", _S.read(_v39, "cphi")), _S.read(_v39, "st"))])
		_S.define(_v39, "l", _S.binary("/", _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v39, "n"), 0), _S.read(_v39, "Lx")), _S.binary("*", _S.prop(_S.read(_v39, "n"), 1), _S.read(_v39, "Ly"))), _S.binary("*", _S.prop(_S.read(_v39, "n"), 2), _S.read(_v39, "Lz"))), _S.read(_v39, "Ln")))
		_S.define(_v39, "groove", _S.binary("%", _S.invoke(_S.read(_v39, "Math"), "floor", [_S.binary("*", _S.binary("+", _S.invoke(_S.read(_v39, "Math"), "asin", [_S.binary("/", _S.read(_v39, "sy"), _S.read(_v39, "r"))]), _S.prop(_S.read(_v39, "Math"), "PI")), 9)]), 2))
		_S.define(_v39, "edge", _S.logical("&&", _S.binary(">", _S.invoke(_S.read(_v39, "Math"), "abs", [_S.binary("-", _S.read(_v39, "sx"), _S.read(_v39, "xr"))]), _S.binary("-", _S.read(_v39, "rw"), 0.6)), func(): return _S.binary("===", _S.invoke(_S.read(_v39, "Math"), "sign", [_S.binary("-", _S.read(_v39, "sx"), _S.read(_v39, "xr"))]), _S.invoke(_S.read(_v39, "Math"), "sign", [_S.binary("-", _S.read(_v39, "xc"), _S.read(_v39, "xr"))]))))
		return _S.prop(_S.read(_v39, "C"), _S.invoke(_S.read(_v39, "Math"), "max", [1, _S.invoke(_S.read(_v39, "Math"), "min", [6, _S.binary("+", _S.binary("-", _S.invoke(_S.read(_v39, "Math"), "round", [_S.binary("+", 2.6, _S.binary("*", _S.read(_v39, "l"), 2.6))]), _S.read(_v39, "groove")), (1 if _S.truth(_S.read(_v39, "edge")) else 0))])]))
	return 0

static func _f23(_parent,_args:Array,_this=null):
	var _n_createFrame = _S.read(_parent,"createFrame")
	var _n_Painter = _S.read(_parent,"Painter")
	var _n_Uint32Array = _S.read(_parent,"Uint32Array")
	var _n_w_b0 = _S.coalesce(_S.arg(_args,0),func():return 64)
	var _n_h_b1 = _S.coalesce(_S.arg(_args,1),func():return 64)
	_S.set_prop(_this,"f",_S.call_value(_n_createFrame,[_n_w_b0, _n_h_b1]),"=")
	_S.set_prop(_this,"q",_S.construct(_n_Painter,[_S.named_value(_this,"f")]),"=")
	_S.set_prop(_this,"tmp",_S.construct(_n_Uint32Array,[(_n_w_b0 * _n_h_b1)]),"=")
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_x0_b0 = _S.arg(_args,0)
	var _n_y0_b1 = _S.arg(_args,1)
	var _n_f_b2 = _S.named_value(_this,"f")
	_S.set_prop(_n_f_b2,"ox",floori(_n_x0_b0),"=")
	_S.set_prop(_n_f_b2,"oy",floori(_n_y0_b1),"=")
	_S.invoke(_S.named_value(_n_f_b2,"color"),"fill",[0])
	_S.invoke(_S.named_value(_n_f_b2,"light"),"fill",[0])
	return _S.invoke(_S.invoke(_S.named_value(_this,"q"),"reset",[]),"place",[0, 0])
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_f_b2 = _S.named_value(_this,"f")
	var _n_i_b3 = (floori(_n_x_b0) - _S.named_value(_n_f_b2,"ox"))
	var _n_j_b4 = (floori(_n_y_b1) - _S.named_value(_n_f_b2,"oy"))
	return ((-1) if _S.truth(((((_n_i_b3 < 0) if _S.truth((_n_i_b3 < 0)) else (_n_j_b4 < 0)) if _S.truth(((_n_i_b3 < 0) if _S.truth((_n_i_b3 < 0)) else (_n_j_b4 < 0))) else (_n_i_b3 >= _S.named_value(_n_f_b2,"w"))) if _S.truth((((_n_i_b3 < 0) if _S.truth((_n_i_b3 < 0)) else (_n_j_b4 < 0)) if _S.truth(((_n_i_b3 < 0) if _S.truth((_n_i_b3 < 0)) else (_n_j_b4 < 0))) else (_n_i_b3 >= _S.named_value(_n_f_b2,"w")))) else (_n_j_b4 >= _S.named_value(_n_f_b2,"h")))) else ((_n_j_b4 * _S.named_value(_n_f_b2,"w")) + _n_i_b3))
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_i_b2 = _S.invoke(_this,"idx",[_n_x_b0, _n_y_b1])
	return (0 if _S.truth((_n_i_b2 < 0)) else _S.index_value(_S.named_value(_S.named_value(_this,"f"),"color"),_n_i_b2))
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.invoke(_this,"idx",[_n_x_b0, _n_y_b1])
	if _S.truth((_n_i_b3 >= 0)):
		_S.set_prop(_S.named_value(_S.named_value(_this,"f"),"color"),_n_i_b3,_n_c_b2,"=")
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_x0_b0 = _S.arg(_args,0)
	var _n_y0_b1 = _S.arg(_args,1)
	var _n_x1_b2 = _S.arg(_args,2)
	var _n_y1_b3 = _S.arg(_args,3)
	var _n_fn_b4 = _S.arg(_args,4)
	if true:
		var _n_y_b5 = floori(_n_y0_b1)
		while _S.truth((_n_y_b5 <= _n_y1_b3)):
			if true:
				var _n_x_b6 = floori(_n_x0_b0)
				while _S.truth((_n_x_b6 <= _n_x1_b2)):
					var _n_c_b7 = _S.call_value(_n_fn_b4,[(_n_x_b6 + 0.5), (_n_y_b5 + 0.5)])
					if _S.truth(_n_c_b7):
						_S.invoke(_this,"set",[_n_x_b6, _n_y_b5, _n_c_b7])
					_n_x_b6 += 1.0
			_n_y_b5 += 1.0
	return null

static func _f29(_parent,_args:Array,_this=null):
	var _n_c_b0 = _S.arg(_args,0)
	var _n_corners_b1 = _S.coalesce(_S.arg(_args,1),func():return false)
	var _n_f_b2 = _S.named_value(_this,"f")
	var _n_C_b3 = _S.named_value(_n_f_b2,"color")
	var _n_T_b4 = _S.named_value(_this,"tmp")
	var _n_w_b5 = _S.named_value(_n_f_b2,"w")
	var _n_h_b6 = _S.named_value(_n_f_b2,"h")
	_S.invoke(_n_T_b4,"fill",[0])
	if true:
		var _n_j_b7 = 0
		while _S.truth((_n_j_b7 < _n_h_b6)):
			if true:
				var _n_i_b8 = 0
				while _S.truth((_n_i_b8 < _n_w_b5)):
					var _n_k_b9 = ((_n_j_b7 * _n_w_b5) + _n_i_b8)
					if _S.truth(_S.index_value(_n_C_b3,_n_k_b9)):
						_n_i_b8 += 1.0
						continue
					var _n_n_b10 = ((((_S.index_value(_n_C_b3,(_n_k_b9 - 1)) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0)) if _S.truth((_S.index_value(_n_C_b3,(_n_k_b9 - 1)) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) else (_S.index_value(_n_C_b3,(_n_k_b9 + 1)) if _S.truth((_n_i_b8 < (_n_w_b5 - 1))) else (_n_i_b8 < (_n_w_b5 - 1)))) if _S.truth(((_S.index_value(_n_C_b3,(_n_k_b9 - 1)) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0)) if _S.truth((_S.index_value(_n_C_b3,(_n_k_b9 - 1)) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) else (_S.index_value(_n_C_b3,(_n_k_b9 + 1)) if _S.truth((_n_i_b8 < (_n_w_b5 - 1))) else (_n_i_b8 < (_n_w_b5 - 1))))) else (_S.index_value(_n_C_b3,(_n_k_b9 - _n_w_b5)) if _S.truth((_n_j_b7 > 0)) else (_n_j_b7 > 0))) if _S.truth((((_S.index_value(_n_C_b3,(_n_k_b9 - 1)) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0)) if _S.truth((_S.index_value(_n_C_b3,(_n_k_b9 - 1)) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) else (_S.index_value(_n_C_b3,(_n_k_b9 + 1)) if _S.truth((_n_i_b8 < (_n_w_b5 - 1))) else (_n_i_b8 < (_n_w_b5 - 1)))) if _S.truth(((_S.index_value(_n_C_b3,(_n_k_b9 - 1)) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0)) if _S.truth((_S.index_value(_n_C_b3,(_n_k_b9 - 1)) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) else (_S.index_value(_n_C_b3,(_n_k_b9 + 1)) if _S.truth((_n_i_b8 < (_n_w_b5 - 1))) else (_n_i_b8 < (_n_w_b5 - 1))))) else (_S.index_value(_n_C_b3,(_n_k_b9 - _n_w_b5)) if _S.truth((_n_j_b7 > 0)) else (_n_j_b7 > 0)))) else (_S.index_value(_n_C_b3,(_n_k_b9 + _n_w_b5)) if _S.truth((_n_j_b7 < (_n_h_b6 - 1))) else (_n_j_b7 < (_n_h_b6 - 1))))
					if _S.truth((_n_corners_b1 if _S.truth(not _S.truth(_n_n_b10)) else not _S.truth(_n_n_b10))):
						_n_n_b10 = ((((_S.index_value(_n_C_b3,((_n_k_b9 - _n_w_b5) - 1)) if _S.truth(((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) else ((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) if _S.truth((_S.index_value(_n_C_b3,((_n_k_b9 - _n_w_b5) - 1)) if _S.truth(((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) else ((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0)))) else (_S.index_value(_n_C_b3,((_n_k_b9 - _n_w_b5) + 1)) if _S.truth(((_n_j_b7 > 0) if _S.truth((_n_i_b8 < (_n_w_b5 - 1))) else (_n_i_b8 < (_n_w_b5 - 1)))) else ((_n_j_b7 > 0) if _S.truth((_n_i_b8 < (_n_w_b5 - 1))) else (_n_i_b8 < (_n_w_b5 - 1))))) if _S.truth(((_S.index_value(_n_C_b3,((_n_k_b9 - _n_w_b5) - 1)) if _S.truth(((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) else ((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) if _S.truth((_S.index_value(_n_C_b3,((_n_k_b9 - _n_w_b5) - 1)) if _S.truth(((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) else ((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0)))) else (_S.index_value(_n_C_b3,((_n_k_b9 - _n_w_b5) + 1)) if _S.truth(((_n_j_b7 > 0) if _S.truth((_n_i_b8 < (_n_w_b5 - 1))) else (_n_i_b8 < (_n_w_b5 - 1)))) else ((_n_j_b7 > 0) if _S.truth((_n_i_b8 < (_n_w_b5 - 1))) else (_n_i_b8 < (_n_w_b5 - 1)))))) else (_S.index_value(_n_C_b3,((_n_k_b9 + _n_w_b5) - 1)) if _S.truth(((_n_j_b7 < (_n_h_b6 - 1)) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) else ((_n_j_b7 < (_n_h_b6 - 1)) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0)))) if _S.truth((((_S.index_value(_n_C_b3,((_n_k_b9 - _n_w_b5) - 1)) if _S.truth(((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) else ((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) if _S.truth((_S.index_value(_n_C_b3,((_n_k_b9 - _n_w_b5) - 1)) if _S.truth(((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) else ((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0)))) else (_S.index_value(_n_C_b3,((_n_k_b9 - _n_w_b5) + 1)) if _S.truth(((_n_j_b7 > 0) if _S.truth((_n_i_b8 < (_n_w_b5 - 1))) else (_n_i_b8 < (_n_w_b5 - 1)))) else ((_n_j_b7 > 0) if _S.truth((_n_i_b8 < (_n_w_b5 - 1))) else (_n_i_b8 < (_n_w_b5 - 1))))) if _S.truth(((_S.index_value(_n_C_b3,((_n_k_b9 - _n_w_b5) - 1)) if _S.truth(((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) else ((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) if _S.truth((_S.index_value(_n_C_b3,((_n_k_b9 - _n_w_b5) - 1)) if _S.truth(((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) else ((_n_j_b7 > 0) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0)))) else (_S.index_value(_n_C_b3,((_n_k_b9 - _n_w_b5) + 1)) if _S.truth(((_n_j_b7 > 0) if _S.truth((_n_i_b8 < (_n_w_b5 - 1))) else (_n_i_b8 < (_n_w_b5 - 1)))) else ((_n_j_b7 > 0) if _S.truth((_n_i_b8 < (_n_w_b5 - 1))) else (_n_i_b8 < (_n_w_b5 - 1)))))) else (_S.index_value(_n_C_b3,((_n_k_b9 + _n_w_b5) - 1)) if _S.truth(((_n_j_b7 < (_n_h_b6 - 1)) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))) else ((_n_j_b7 < (_n_h_b6 - 1)) if _S.truth((_n_i_b8 > 0)) else (_n_i_b8 > 0))))) else (_S.index_value(_n_C_b3,((_n_k_b9 + _n_w_b5) + 1)) if _S.truth(((_n_j_b7 < (_n_h_b6 - 1)) if _S.truth((_n_i_b8 < (_n_w_b5 - 1))) else (_n_i_b8 < (_n_w_b5 - 1)))) else ((_n_j_b7 < (_n_h_b6 - 1)) if _S.truth((_n_i_b8 < (_n_w_b5 - 1))) else (_n_i_b8 < (_n_w_b5 - 1)))))
					if _S.truth(_n_n_b10):
						_S.set_prop(_n_T_b4,_n_k_b9,(_S.call_value(_n_c_b0,[(_n_i_b8 + _S.named_value(_n_f_b2,"ox")), (_n_j_b7 + _S.named_value(_n_f_b2,"oy")), _n_n_b10]) if _S.truth(_S.binary("===",_S.unary("typeof",_n_c_b0),"function")) else _n_c_b0),"=")
					_n_i_b8 += 1.0
			_n_j_b7 += 1.0
	if true:
		var _n_k_b11 = 0
		while _S.truth((_n_k_b11 < (_n_w_b5 * _n_h_b6))):
			if _S.truth(_S.index_value(_n_T_b4,_n_k_b11)):
				_S.set_prop(_n_C_b3,_n_k_b11,_S.index_value(_n_T_b4,_n_k_b11),"=")
			_n_k_b11 += 1.0
	return _this
	return null

static func _f30(_parent,_args:Array,_this=null):
	var _n_fn_b0 = _S.arg(_args,0)
	var _n_f_b1 = _S.named_value(_this,"f")
	var _n_C_b2 = _S.named_value(_n_f_b1,"color")
	if true:
		var _n_k_b3 = 0
		while _S.truth((_n_k_b3 < _S.prop(_n_C_b2,"length"))):
			if _S.truth(_S.index_value(_n_C_b2,_n_k_b3)):
				_S.set_prop(_n_C_b2,_n_k_b3,_S.logical("||",_S.call_value(_n_fn_b0,[(fmod(_n_k_b3,_S.named_value(_n_f_b1,"w")) + _S.named_value(_n_f_b1,"ox")), (floori((float(_n_k_b3)/_S.named_value(_n_f_b1,"w"))) + _S.named_value(_n_f_b1,"oy")), _S.index_value(_n_C_b2,_n_k_b3)]),func():return _S.index_value(_n_C_b2,_n_k_b3)),"=")
			_n_k_b3 += 1.0
	return _this
	return null

static func _f31(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_dx_b1 = _S.coalesce(_S.arg(_args,1),func():return 0)
	var _n_dy_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	var _n_a_b3 = _S.coalesce(_S.arg(_args,3),func():return 1)
	var _n_clip_b4 = _S.coalesce(_S.arg(_args,4),func():return null)
	var _n_f_b5 = _S.named_value(_this,"f")
	var _n_C_b6 = _S.named_value(_n_f_b5,"color")
	if true:
		var _n_k_b7 = 0
		while _S.truth((_n_k_b7 < _S.prop(_n_C_b6,"length"))):
			if _S.truth(not _S.truth(_S.index_value(_n_C_b6,_n_k_b7))):
				_n_k_b7 += 1.0
				continue
			var _n_x_b8 = ((fmod(_n_k_b7,_S.named_value(_n_f_b5,"w")) + _S.named_value(_n_f_b5,"ox")) + _n_dx_b1)
			if _S.truth((((_n_x_b8 < _S.index_value(_n_clip_b4,0)) if _S.truth((_n_x_b8 < _S.index_value(_n_clip_b4,0))) else (_n_x_b8 >= _S.index_value(_n_clip_b4,1))) if _S.truth(_n_clip_b4) else _n_clip_b4)):
				_n_k_b7 += 1.0
				continue
			_S.invoke(_n_p_b0,"dot",[_n_x_b8, ((floori((float(_n_k_b7)/_S.named_value(_n_f_b5,"w"))) + _S.named_value(_n_f_b5,"oy")) + _n_dy_b2), _S.index_value(_n_C_b6,_n_k_b7), _n_a_b3])
			_n_k_b7 += 1.0
	return _this
	return null

static func _f32(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ph_b0 = _S.arg(_args,0)
	var _n_amp_b1 = _S.arg(_args,1)
	var _n_n_b2 = _S.coalesce(_S.arg(_args,2),func():return 1)
	var _n_off_b3 = _S.coalesce(_S.arg(_args,3),func():return 0)
	return ((-_n_amp_b1) * sin((((_n_ph_b0 * _n_n_b2) + _n_off_b3) * _n_TAU)))
	return null
