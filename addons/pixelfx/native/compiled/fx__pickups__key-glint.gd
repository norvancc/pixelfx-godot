@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/key-glint.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "flyV", _S.import_value("core/index.js", "flyV"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "part", _S.function_value(_e, "_f0"))
	_S.define(_e, "key", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Key glint"}, {"desc": "An ornate silver key hovering and rocking; a glint runs from its bow down the shaft to the teeth and bursts off the tip as falling sparks."}, {"tags": ["pickup", "key", "unlock", "item", "loop"]}, {"size": [72, 60]}, {"origin": [36, 54]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0e1018", "#222838", "#3c4660", "#5e6d8e", "#8c9cbc", "#bccae2", "#e6eeff", "#ffffff"]}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [48, 40]))
	_S.define(_e, "HOVER", 19)
	_S.define(_e, "MID", 8)
	_S.define(_e, "TIP", 17.5)
	_S.define(_e, "G0", 0.18)
	_S.define(_e, "G1", 0.5)
	_S.define(_e, "pose", _S.function_value(_e, "_f6"))
	_S.define(_e, "toWorld", _S.function_value(_e, "_f7"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_TIP = _S.read(_parent,"TIP")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	var _n_rb_b2 = _S.Bridge.hypot([_n_u_b0, _n_v_b1])
	if _S.truth(((_n_rb_b2 >= 2.1) if _S.truth((_n_rb_b2 <= 4.6)) else (_n_rb_b2 <= 4.6))):
		return 1
	if _S.truth(((absf(_n_v_b1) <= 1.9) if _S.truth(((_n_u_b0 <= 6) if _S.truth((_n_u_b0 >= 4.3)) else (_n_u_b0 >= 4.3))) else ((_n_u_b0 <= 6) if _S.truth((_n_u_b0 >= 4.3)) else (_n_u_b0 >= 4.3)))):
		return 2
	if _S.truth(((absf(_n_v_b1) <= 1) if _S.truth(((_n_u_b0 <= _n_TIP) if _S.truth((_n_u_b0 >= 6)) else (_n_u_b0 >= 6))) else ((_n_u_b0 <= _n_TIP) if _S.truth((_n_u_b0 >= 6)) else (_n_u_b0 >= 6)))):
		return 3
	if _S.truth((not _S.truth(((_n_v_b1 > 2.7) if _S.truth(((_n_u_b0 < 15.4) if _S.truth((_n_u_b0 > 14.3)) else (_n_u_b0 > 14.3))) else ((_n_u_b0 < 15.4) if _S.truth((_n_u_b0 > 14.3)) else (_n_u_b0 > 14.3)))) if _S.truth(((_n_v_b1 <= 4.6) if _S.truth(((_n_v_b1 > 1) if _S.truth(((_n_u_b0 <= (_n_TIP - 0.3)) if _S.truth((_n_u_b0 >= 12.6)) else (_n_u_b0 >= 12.6))) else ((_n_u_b0 <= (_n_TIP - 0.3)) if _S.truth((_n_u_b0 >= 12.6)) else (_n_u_b0 >= 12.6)))) else ((_n_v_b1 > 1) if _S.truth(((_n_u_b0 <= (_n_TIP - 0.3)) if _S.truth((_n_u_b0 >= 12.6)) else (_n_u_b0 >= 12.6))) else ((_n_u_b0 <= (_n_TIP - 0.3)) if _S.truth((_n_u_b0 >= 12.6)) else (_n_u_b0 >= 12.6))))) else ((_n_v_b1 <= 4.6) if _S.truth(((_n_v_b1 > 1) if _S.truth(((_n_u_b0 <= (_n_TIP - 0.3)) if _S.truth((_n_u_b0 >= 12.6)) else (_n_u_b0 >= 12.6))) else ((_n_u_b0 <= (_n_TIP - 0.3)) if _S.truth((_n_u_b0 >= 12.6)) else (_n_u_b0 >= 12.6)))) else ((_n_v_b1 > 1) if _S.truth(((_n_u_b0 <= (_n_TIP - 0.3)) if _S.truth((_n_u_b0 >= 12.6)) else (_n_u_b0 >= 12.6))) else ((_n_u_b0 <= (_n_TIP - 0.3)) if _S.truth((_n_u_b0 >= 12.6)) else (_n_u_b0 >= 12.6)))))):
		return 4
	return 0
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_cx_b2 = _S.arg(_args,2)
	var _n_cy_b3 = _S.arg(_args,3)
	var _n_a_b4 = _S.arg(_args,4)
	var _n_gu_b5 = _S.arg(_args,5)
	var _n_ca_b6 = cos(_n_a_b4)
	var _n_sa_b7 = sin(_n_a_b4)
	_S.invoke(_n_L,"begin",[(floori(_n_cx_b2) - 24), (floori(_n_cy_b3) - 20)])
	_S.invoke(_n_L,"fill",[(floori(_n_cx_b2) - 24), (floori(_n_cy_b3) - 20), (floori(_n_cx_b2) + 23), (floori(_n_cy_b3) + 19), _S.function_value(_S.capture(_parent,{"cx":_n_cx_b2,"cy":_n_cy_b3,"ca":_n_ca_b6,"sa":_n_sa_b7,"gu":_n_gu_b5,"C":_n_C_b1,"this":_this}),"_f2")])
	_S.invoke(_S.invoke(_n_L,"outline",[_S.index_value(_n_C_b1,0)]),"draw",[_n_p_b0])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_MID = _S.read(_parent,"MID")
	var _n_part = _S.read(_parent,"part")
	var _n_gu = _S.read(_parent,"gu")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (_n_px_b0 - _n_cx)
	var _n_dy_b3 = (_n_py_b1 - _n_cy)
	var _n_u_b4 = (((_n_dx_b2 * _n_ca) + (_n_dy_b3 * _n_sa)) + _n_MID)
	var _n_v_b5 = (((-_n_dx_b2) * _n_sa) + (_n_dy_b3 * _n_ca))
	var _n_k_b6 = _S.call_value(_n_part,[_n_u_b4, _n_v_b5])
	if _S.truth(not _S.truth(_n_k_b6)):
		return 0
	var _n_ny_b7 = null
	if _S.truth(_S.binary("===",_n_k_b6,1)):
		var _n_rb_b10 = _S.Bridge.hypot([_n_u_b4, _n_v_b5])
		var _n_out_b11 = (1 if _S.truth((_n_rb_b10 > 3.4)) else (-1))
		var _n_wx_b12 = ((float(_n_u_b4)/_n_rb_b10) * _n_out_b11)
		var _n_wy_b13 = ((float(_n_v_b5)/_n_rb_b10) * _n_out_b11)
		_n_ny_b7 = (-((((_n_wx_b12 * _n_ca) - (_n_wy_b13 * _n_sa)) * (-0.6)) + (((_n_wx_b12 * _n_sa) + (_n_wy_b13 * _n_ca)) * (-0.8))))
	else:
		_n_ny_b7 = (0.8 if _S.truth((_n_v_b5 < (-0.35))) else ((-0.6) if _S.truth((_S.binary("!==",_n_k_b6,4) if _S.truth((_n_v_b5 > 0.35)) else (_n_v_b5 > 0.35))) else (((-0.5) if _S.truth((_n_v_b5 > 3.6)) else 0.1) if _S.truth(_S.binary("===",_n_k_b6,4)) else 0.2)))
	var _n_c_b8 = (6 if _S.truth((_n_ny_b7 > 0.55)) else (4 if _S.truth((_n_ny_b7 > 0.15)) else (3 if _S.truth((_n_ny_b7 > (-0.3))) else 2)))
	if _S.truth(_S.binary("===",_n_k_b6,2)):
		_n_c_b8 = minf(7,(_n_c_b8 + 1))
	var _n_g_b9 = absf(((_n_u_b4 + (_n_v_b5 * 0.45)) - _n_gu))
	if _S.truth((_n_g_b9 < 0.8)):
		return _n_WHITE
	if _S.truth((_n_g_b9 < 2)):
		_n_c_b8 = minf(7,(_n_c_b8 + 2))
	return _S.index_value(_n_C,_n_c_b8)
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_pose = _S.read(_parent,"pose")
	var _n_meta = _S.read(_parent,"meta")
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_blobShadow = _S.read(_parent,"blobShadow")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _object_0 = _S.call_value(_n_pose,[(float(_n_t_b1)/_S.named_value(_n_meta,"duration"))])
	var _n_y_b3 = _S.named_value(_object_0,"y")
	_S.call_value(_n_blobShadow,[_n_p_b0, 0, 10, (0.8 - ((((-_n_y_b3) - _n_HOVER) + 1.6) * 0.06))])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_pose = _S.read(_parent,"pose")
	var _n_G0 = _S.read(_parent,"G0")
	var _n_G1 = _S.read(_parent,"G1")
	var _n_TIP = _S.read(_parent,"TIP")
	var _n_ease = _S.read(_parent,"ease")
	var _n_toWorld = _S.read(_parent,"toWorld")
	var _n_key = _S.read(_parent,"key")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_glint = _S.read(_parent,"glint")
	var _n_fly = _S.read(_parent,"fly")
	var _n_flyV = _S.read(_parent,"flyV")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_T_b4 = _S.named_value(_n_meta,"duration")
	var _n_ph_b5 = (float(_n_t_b1)/_n_T_b4)
	var _object_0 = _S.call_value(_n_pose,[_n_ph_b5])
	var _n_y_b6 = _S.named_value(_object_0,"y")
	var _n_a_b7 = _S.named_value(_object_0,"a")
	var _n_q_b8 = (float((_n_ph_b5 - _n_G0))/(_n_G1 - _n_G0))
	var _n_gu_b9 = (((-5) + ((_n_TIP + 7) * _S.invoke(_n_ease,"inOutSine",[_n_q_b8]))) if _S.truth(((_n_q_b8 < 1) if _S.truth((_n_q_b8 > 0)) else (_n_q_b8 > 0))) else (-100))
	var _tuple_1 = _S.call_value(_n_toWorld,[0, 0, 0, _n_y_b6, _n_a_b7])
	var _n_bx_b10 = _S.prop(_tuple_1,0)
	var _n_by_b11 = _S.prop(_tuple_1,1)
	var _tuple_2 = _S.call_value(_n_toWorld,[_n_TIP, 0, 0, _n_y_b6, _n_a_b7])
	var _n_ex_b12 = _S.prop(_tuple_2,0)
	var _n_ey_b13 = _S.prop(_tuple_2,1)
	_S.invoke(_n_p_b0,"glow",[0, _n_y_b6, 24, _S.index_value(_n_C_b3,4), 0.3])
	_S.invoke(_n_p_b0,"glowLine",[_n_bx_b10, _n_by_b11, _n_ex_b12, _n_ey_b13, 7, _S.index_value(_n_C_b3,5), 0.16])
	_S.call_value(_n_key,[_n_p_b0, _n_C_b3, 0, _n_y_b6, _n_a_b7, _n_gu_b9])
	if true:
		var _n_i_b17 = 0
		while _S.truth((_n_i_b17 < 4)):
			var _n_life_b18 = 0.4
			var _n_age_b19 = fmod((fmod((_n_t_b1 - ((float((_n_i_b17 + 0.6))/4) * _n_T_b4)),_n_T_b4) + _n_T_b4),_n_T_b4)
			if _S.truth((_n_age_b19 > _n_life_b18)):
				_n_i_b17 += 1.0
				continue
			var _n_an_b20 = (_S.MathFX.rand([_n_i_b17,_S.named_value(_n_o_b2,"seed"),8]) * _n_TAU)
			var _n_d_b21 = (9 + (_S.MathFX.rand([_n_i_b17,_S.named_value(_n_o_b2,"seed"),9]) * 6))
			var _n_k_b22 = sin(((float(_n_age_b19)/_n_life_b18) * PI))
			_S.call_value(_n_glint,[_n_p_b0, (cos(_n_an_b20) * _n_d_b21), ((_n_y_b6 + ((sin(_n_an_b20) * _n_d_b21) * 0.8)) - (_n_age_b19 * 6)), floori((1.8 * _n_k_b22)+0.5), (_S.index_value(_n_C_b3,6) if _S.truth(fmod(_n_i_b17,2)) else _n_WHITE), (0.35 * _n_k_b22)])
			_n_i_b17 += 1.0
	if _S.truth((_n_gu_b9 > (-6))):
		var _tuple_3 = _S.call_value(_n_toWorld,[clampf(_n_gu_b9,0,_n_TIP), 0, 0, _n_y_b6, _n_a_b7])
		var _n_gx_b23 = _S.prop(_tuple_3,0)
		var _n_gy_b24 = _S.prop(_tuple_3,1)
		_S.invoke(_n_p_b0,"glow",[_n_gx_b23, _n_gy_b24, 10, _S.index_value(_n_C_b3,6), (0.45 * sin((_n_q_b8 * PI)))])
	var _tuple_4 = _S.call_value(_n_toWorld,[_n_TIP, 0, 0, _n_y_b6, _n_a_b7])
	var _n_tx_b14 = _S.prop(_tuple_4,0)
	var _n_ty_b15 = _S.prop(_tuple_4,1)
	var _n_at_b16 = (((_n_ph_b5 - _n_G1) + 0.02) * _n_T_b4)
	if _S.truth(((_n_at_b16 < 0.3) if _S.truth((_n_at_b16 > 0)) else (_n_at_b16 > 0))):
		_S.call_value(_n_glint,[_n_p_b0, _n_tx_b14, _n_ty_b15, (4.5 * (1 - (float(_n_at_b16)/0.3))), _S.index_value(_n_C_b3,6), (0.6 * (1 - (float(_n_at_b16)/0.3)))])
	if true:
		var _n_i_b25 = 0
		while _S.truth((_n_i_b25 < 9)):
			var _n_life_b26 = (0.32 + (_S.MathFX.rand([_n_i_b25,_S.named_value(_n_o_b2,"seed"),4]) * 0.3))
			var _n_age_b27 = (_n_at_b16 - (_S.MathFX.rand([_n_i_b25,_S.named_value(_n_o_b2,"seed"),5]) * 0.05))
			if _S.truth(((_n_age_b27 < 0) if _S.truth((_n_age_b27 < 0)) else (_n_age_b27 > _n_life_b26))):
				_n_i_b25 += 1.0
				continue
			var _n_sp_b28 = (25 + (_S.MathFX.rand([_n_i_b25,_S.named_value(_n_o_b2,"seed"),1]) * 45))
			var _n_an_b29 = (_n_a_b7 + ((_S.MathFX.rand([_n_i_b25,_S.named_value(_n_o_b2,"seed"),2]) - 0.5) * 2.2))
			var _tuple_5 = _S.call_value(_n_fly,[_n_tx_b14, _n_ty_b15, (cos(_n_an_b29) * _n_sp_b28), ((sin(_n_an_b29) * _n_sp_b28) - 25), _n_age_b27, 380, 2.5])
			var _n_x_b30 = _S.prop(_tuple_5,0)
			var _n_yy_b31 = _S.prop(_tuple_5,1)
			var _tuple_6 = _S.call_value(_n_flyV,[(cos(_n_an_b29) * _n_sp_b28), ((sin(_n_an_b29) * _n_sp_b28) - 25), _n_age_b27, 380, 2.5])
			var _n_vx_b32 = _S.prop(_tuple_6,0)
			var _n_vy_b33 = _S.prop(_tuple_6,1)
			if _S.truth((_n_yy_b31 > (-0.5))):
				_n_i_b25 += 1.0
				continue
			var _n_s_b34 = _S.logical("||",_S.Bridge.hypot([_n_vx_b32, _n_vy_b33]),func():return 1)
			var _n_L2_b35 = minf(4,(1 + (_n_s_b34 * 0.03)))
			var _n_k_b36 = (1 - (float(_n_age_b27)/_n_life_b26))
			_S.invoke(_n_p_b0,"line",[(_n_x_b30 - ((float(_n_vx_b32)/_n_s_b34) * _n_L2_b35)), (_n_yy_b31 - ((float(_n_vy_b33)/_n_s_b34) * _n_L2_b35)), _n_x_b30, _n_yy_b31, _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f5"), (_n_k_b36 * 1.6)])
			_S.invoke(_n_p_b0,"glow",[_n_x_b30, _n_yy_b31, 3, _S.index_value(_n_C_b3,5), (0.4 * _n_k_b36)])
			_n_i_b25 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 > 0.6)) else _S.index_value(_n_C,5))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ph_b0 = _S.arg(_args,0)
	return {"y":((-_n_HOVER) - (1.6 * sin((_n_ph_b0 * _n_TAU)))),"a":(0.42 + (0.11 * sin(((_n_ph_b0 * _n_TAU) + 0.9))))}
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_MID = _S.read(_parent,"MID")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	var _n_cx_b2 = _S.arg(_args,2)
	var _n_cy_b3 = _S.arg(_args,3)
	var _n_a_b4 = _S.arg(_args,4)
	return [((_n_cx_b2 + ((_n_u_b0 - _n_MID) * cos(_n_a_b4))) - (_n_v_b1 * sin(_n_a_b4))), ((_n_cy_b3 + ((_n_u_b0 - _n_MID) * sin(_n_a_b4))) + (_n_v_b1 * cos(_n_a_b4)))]
	return null
