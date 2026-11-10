@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/crystal-shard.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "drawGem", _S.import_value("fx/pickups/_lib.js", "drawGem"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "pool", _S.import_value("fx/pickups/_lib.js", "pool"))
	_S.define(_e, "cracks", _S.function_value(_e, "_f0"))
	_S.define(_e, "splinter", _S.function_value(_e, "_f1"))
	_S.define(_e, "splinters", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Crystal shard"}, {"desc": "A broken amber shard hovers and sways: chipped uneven faces, its top sheared off, light pulsing up through glowing cracks and flaring out of the break; splinters orbit it."}, {"tags": ["pickup", "crystal", "shard", "relic", "broken", "loop"]}, {"size": [64, 76]}, {"origin": [32, 68]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0a04", "#3e1606", "#702a08", "#a8480c", "#e07818", "#ffa838", "#ffd890", "#ffffff"]}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HALF", 6)
	_S.define(_e, "TILT", 0.18)
	_S.define(_e, "LEAN", 0.2)
	_S.define(_e, "roll", _S.function_value(_e, "_f6"))
	_S.define(_e, "unit", _S.function_value(_e, "_f7"))
	_S.define(_e, "SOLID", _S.call_value(_S.function_value(_e, "_f8"), []))
	_S.define(_e, "CRACKS", [[[0.5, _S.unary("-", 9), 0.3], [_S.unary("-", 0.8), _S.unary("-", 5), 0.5], [0.6, _S.unary("-", 1), 0.2], [_S.unary("-", 0.4), 3, 0.6], [1.4, 6.5, 0.4], [2.2, 8.5, 0.6]], [[0.6, _S.unary("-", 1), 0.2], [2.4, 1.5, 1], [3.4, 4.2, 1.2]], [[_S.unary("-", 0.4), 3, 0.6], [_S.unary("-", 2), 6.5, 0.4], [_S.unary("-", 2.6), 10.5, 0.2], [_S.unary("-", 2.4), 14.5, 0.1]], [[_S.unary("-", 0.8), _S.unary("-", 5), 0.5], [_S.unary("-", 2.8), _S.unary("-", 3), 0.8]]])
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [32, 52]))
	_S.define(_e, "SL", _S.construct(_S.read(_e, "Layer"), [16, 16]))
	_S.define(_e, "HOVER", 27)
	_S.define(_e, "RX", 15)
	_S.define(_e, "RY", 3.8)
	_S.define(_e, "pose", _S.function_value(_e, "_f9"))
	_S.define(_e, "climb", _S.function_value(_e, "_f10"))
	_S.define(_e, "project", _S.function_value(_e, "_f11"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_climb = _S.read(_parent,"climb")
	var _n_project = _S.read(_parent,"project")
	var _n_L = _S.read(_parent,"L")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_CRACKS = _S.read(_parent,"CRACKS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_spin_b2 = _S.arg(_args,2)
	var _n_cy_b3 = _S.arg(_args,3)
	var _n_ph_b4 = _S.arg(_args,4)
	var _n_s0_b5 = _S.call_value(_n_climb,[_n_ph_b4])
	var _n_rim_b6 = _S.binary(">>>",_S.index_value(_n_C_b1,0),0)
	for _iter_0 in _S.array(_n_CRACKS):
		var _n_crack_b7 = _iter_0
		if true:
			var _n_i_b8 = 1
			while _S.truth((_n_i_b8 < _S.prop(_n_crack_b7,"length"))):
				var _tuple_1 = _S.call_value(_n_project,[_S.index_value(_n_crack_b7,(_n_i_b8 - 1)), _n_spin_b2, _n_cy_b3])
				var _n_x0_b9 = _S.prop(_tuple_1,0)
				var _n_y0_b10 = _S.prop(_tuple_1,1)
				var _tuple_2 = _S.call_value(_n_project,[_S.index_value(_n_crack_b7,_n_i_b8), _n_spin_b2, _n_cy_b3])
				var _n_x1_b11 = _S.prop(_tuple_2,0)
				var _n_y1_b12 = _S.prop(_tuple_2,1)
				var _n_n_b13 = ceili((_S.Bridge.hypot([(_n_x1_b11 - _n_x0_b9), (_n_y1_b12 - _n_y0_b10)]) * 2))
				if true:
					var _n_j_b14 = 0
					while _S.truth((_n_j_b14 <= _n_n_b13)):
						var _n_u_b15 = (float(_n_j_b14)/_n_n_b13)
						var _n_x_b16 = (_n_x0_b9 + ((_n_x1_b11 - _n_x0_b9) * _n_u_b15))
						var _n_y_b17 = (_n_y0_b10 + ((_n_y1_b12 - _n_y0_b10) * _n_u_b15))
						var _n_h_b18 = (_S.index_value(_S.index_value(_n_crack_b7,(_n_i_b8 - 1)),1) + ((_S.index_value(_S.index_value(_n_crack_b7,_n_i_b8),1) - _S.index_value(_S.index_value(_n_crack_b7,(_n_i_b8 - 1)),1)) * _n_u_b15))
						var _n_c_b19 = _S.binary(">>>",_S.invoke(_n_L,"get",[_n_x_b16, _n_y_b17]),0)
						if _S.truth((not _S.truth(_n_c_b19) if _S.truth(not _S.truth(_n_c_b19)) else _S.binary("===",_n_c_b19,_n_rim_b6))):
							_n_j_b14 += 1.0
							continue
						var _n_b_b20 = (0.3 + exp((-pow((float(((float((_n_h_b18 + 9))/22) - _n_s0_b5))/0.14),2))))
						_S.invoke(_n_p_b0,"px",[_n_x_b16, _n_y_b17, (_n_WHITE if _S.truth((_n_b_b20 > 0.9)) else (_S.index_value(_n_C_b1,6) if _S.truth((_n_b_b20 > 0.55)) else _S.index_value(_n_C_b1,5)))])
						if _S.truth(((_n_b_b20 > 0.5) if _S.truth(_S.binary("===",fmod(_n_j_b14,4),0)) else _S.binary("===",fmod(_n_j_b14,4),0))):
							_S.invoke(_n_p_b0,"glow",[(_n_x_b16 + 0.5), (_n_y_b17 + 0.5), (2 + (3 * _n_b_b20)), _S.index_value(_n_C_b1,5), (0.16 * _n_b_b20)])
						_n_j_b14 += 1.0
				_n_i_b8 += 1.0
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_SL = _S.read(_parent,"SL")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_len_b4 = _S.arg(_args,4)
	var _n_a_b5 = _S.arg(_args,5)
	var _n_far_b6 = _S.arg(_args,6)
	var _n_ca_b7 = cos(_n_a_b5)
	var _n_sa_b8 = sin(_n_a_b5)
	var _n_X_b9 = floori(_n_x_b2+0.5)
	var _n_Y_b10 = floori(_n_y_b3+0.5)
	_S.invoke(_n_SL,"begin",[(_n_X_b9 - 7), (_n_Y_b10 - 7)])
	_S.invoke(_n_SL,"fill",[(_n_X_b9 - 7), (_n_Y_b10 - 7), (_n_X_b9 + 6), (_n_Y_b10 + 6), _S.function_value(_S.capture(_parent,{"X":_n_X_b9,"Y":_n_Y_b10,"ca":_n_ca_b7,"sa":_n_sa_b8,"len":_n_len_b4,"far":_n_far_b6,"C":_n_C_b1,"this":_this}),"_f2")])
	_S.invoke(_S.invoke(_n_SL,"outline",[_S.index_value(_n_C_b1,(1 if _S.truth(_n_far_b6) else 0))]),"draw",[_n_p_b0])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_X = _S.read(_parent,"X")
	var _n_Y = _S.read(_parent,"Y")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_len = _S.read(_parent,"len")
	var _n_C = _S.read(_parent,"C")
	var _n_far = _S.read(_parent,"far")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (_n_px_b0 - _n_X)
	var _n_dy_b3 = (_n_py_b1 - _n_Y)
	var _n_u_b4 = ((_n_dx_b2 * _n_ca) + (_n_dy_b3 * _n_sa))
	var _n_v_b5 = (((-_n_dx_b2) * _n_sa) + (_n_dy_b3 * _n_ca))
	if _S.truth((((float(absf(_n_u_b4))/_n_len) + (float(absf(_n_v_b5))/(1.7 if _S.truth((_n_u_b4 > 0)) else 1.1))) > 1)):
		return 0
	var _n_lit_b6 = ((-((_n_ca * 0.6) + (_n_sa * 0.8))) * signf((_n_v_b5 if _S.truth(_n_v_b5) else 1)))
	return ((_S.index_value(_n_C,4) if _S.truth((_n_v_b5 < 0)) else _S.index_value(_n_C,3)) if _S.truth(_n_far) else (_n_WHITE if _S.truth(_S.logical("&&",(absf(_n_v_b5) < 0.5),func():return (_n_u_b4 < 0))) else (_S.index_value(_n_C,6) if _S.truth(_S.binary("===",(_n_v_b5 < 0),(_n_lit_b6 > 0))) else _S.index_value(_n_C,4))))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RX = _S.read(_parent,"RX")
	var _n_RY = _S.read(_parent,"RY")
	var _n_splinter = _S.read(_parent,"splinter")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_glint = _S.read(_parent,"glint")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	var _n_cy_b3 = _S.arg(_args,3)
	var _n_back_b4 = _S.arg(_args,4)
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < 3)):
			var _n_a_b6 = ((_n_ph_b2 * _n_TAU) + (float((_n_i_b5 * _n_TAU))/3))
			var _n_s_b7 = sin(_n_a_b6)
			if _S.truth(_S.binary("!==",(_n_s_b7 < 0),_n_back_b4)):
				_n_i_b5 += 1.0
				continue
			var _n_x_b8 = (cos(_n_a_b6) * _n_RX)
			var _n_y_b9 = (((_n_cy_b3 + 1) + (_n_s_b7 * _n_RY)) - (cos(_n_a_b6) * 1.5))
			var _n_near_b10 = (float((_n_s_b7 + 1))/2)
			_S.call_value(_n_splinter,[_n_p_b0, _n_C_b1, _n_x_b8, _n_y_b9, (3 + (1.6 * _n_near_b10)), ((_n_a_b6 * 2) + (_n_i_b5 * 1.7)), _n_back_b4])
			_S.invoke(_n_p_b0,"glow",[_n_x_b8, _n_y_b9, (6 + (3 * _n_near_b10)), _S.index_value(_n_C_b1,5), ((0.18 if _S.truth(_n_back_b4) else 0.32) * (0.6 + (0.4 * _n_near_b10)))])
			if _S.truth(((_n_s_b7 > 0.92) if _S.truth(not _S.truth(_n_back_b4)) else not _S.truth(_n_back_b4))):
				_S.call_value(_n_glint,[_n_p_b0, (_n_x_b8 - 1), (_n_y_b9 - 1), (float((2.5 * (_n_s_b7 - 0.92)))/0.08), _n_WHITE, 0.4])
			_n_i_b5 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_pose = _S.read(_parent,"pose")
	var _n_blobShadow = _S.read(_parent,"blobShadow")
	var _n_pool = _S.read(_parent,"pool")
	var _n_splinters = _S.read(_parent,"splinters")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_S.named_value(_n_meta,"duration"))
	var _object_0 = _S.call_value(_n_pose,[_n_ph_b4])
	var _n_y_b5 = _S.named_value(_object_0,"y")
	_S.call_value(_n_blobShadow,[_n_p_b0, 0, 6, 0.75])
	_S.call_value(_n_pool,[_n_p_b0, 0, 0.5, 20, 3.5, _S.index_value(_n_C_b3,4), 0.3])
	_S.invoke(_n_p_b0,"glowRing",[0, _n_y_b5, 7, 20, _S.index_value(_n_C_b3,4), 0.22])
	_S.call_value(_n_splinters,[_n_p_b0, _n_C_b3, _n_ph_b4, _n_y_b5, true])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_pose = _S.read(_parent,"pose")
	var _n_climb = _S.read(_parent,"climb")
	var _n_L = _S.read(_parent,"L")
	var _n_SOLID = _S.read(_parent,"SOLID")
	var _n_TILT = _S.read(_parent,"TILT")
	var _n_drawGem = _S.read(_parent,"drawGem")
	var _n_cracks = _S.read(_parent,"cracks")
	var _n_splinters = _S.read(_parent,"splinters")
	var _n_project = _S.read(_parent,"project")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_glint = _S.read(_parent,"glint")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_S.named_value(_n_meta,"duration"))
	var _object_0 = _S.call_value(_n_pose,[_n_ph_b4])
	var _n_y_b5 = _S.named_value(_object_0,"y")
	var _n_spin_b6 = _S.named_value(_object_0,"spin")
	var _n_s0_b7 = _S.call_value(_n_climb,[_n_ph_b4])
	_S.call_value(_n_drawGem,[_n_L, _n_p_b0, _n_SOLID, 0, _n_y_b5, _n_spin_b6, _n_C_b3, {"tilt":_n_TILT,"gain":0.6}])
	_S.call_value(_n_cracks,[_n_p_b0, _n_C_b3, _n_spin_b6, _n_y_b5, _n_ph_b4])
	var _n_inside_b8 = exp((-pow((float((_n_s0_b7 - 0.45))/0.45),2)))
	_S.invoke(_n_p_b0,"glow",[0, _n_y_b5, 10, _S.index_value(_n_C_b3,5), (0.2 * _n_inside_b8)])
	_S.call_value(_n_splinters,[_n_p_b0, _n_C_b3, _n_ph_b4, _n_y_b5, false])
	var _tuple_1 = _S.call_value(_n_project,[[1.8, 8.4, 0.9], _n_spin_b6, _n_y_b5])
	var _n_fx_b9 = _S.prop(_tuple_1,0)
	var _n_fy_b10 = _S.prop(_tuple_1,1)
	var _n_out_b11 = clampf((1 - (float(absf((_n_s0_b7 - 1.05)))/0.18)),0.0,1.0)
	if _S.truth((_n_out_b11 > 0)):
		_S.call_value(_n_glint,[_n_p_b0, _n_fx_b9, _n_fy_b10, (3.5 * _n_out_b11), _n_WHITE, (0.55 * _n_out_b11)])
		_S.invoke(_n_p_b0,"glow",[_n_fx_b9, _n_fy_b10, 12, _S.index_value(_n_C_b3,5), (0.4 * _n_out_b11)])
	var _n_P2_b12 = (float(_S.named_value(_n_meta,"duration"))/2)
	var _n_burst_b13 = ((float((1.05 + 0.3))/1.7) * _n_P2_b12)
	if true:
		var _n_i_b14 = 0
		while _S.truth((_n_i_b14 < 7)):
			var _n_born_b15 = (_n_burst_b13 + (_S.MathFX.rand([_n_i_b14,_S.named_value(_n_o_b2,"seed"),1]) * 0.12))
			var _n_at_b16 = fmod((fmod((_n_t_b1 - _n_born_b15),_n_P2_b12) + _n_P2_b12),_n_P2_b12)
			var _n_life_b17 = (0.6 + (_S.MathFX.rand([_n_i_b14,_S.named_value(_n_o_b2,"seed"),2]) * 0.45))
			if _S.truth((_n_at_b16 > _n_life_b17)):
				_n_i_b14 += 1.0
				continue
			var _n_k_b18 = (1 - (float(_n_at_b16)/_n_life_b17))
			var _n_x_b19 = ((_n_fx_b9 + ((_S.MathFX.rand([_n_i_b14,_S.named_value(_n_o_b2,"seed"),3]) - 0.5) * 4)) + ((sin(((_n_at_b16 * 5) + _n_i_b14)) * 2) * (float(_n_at_b16)/_n_life_b17)))
			var _n_yy_b20 = (_n_fy_b10 - (_n_at_b16 * (14 + (_S.MathFX.rand([_n_i_b14,_S.named_value(_n_o_b2,"seed"),4]) * 14))))
			_S.invoke(_n_p_b0,"px",[_n_x_b19, _n_yy_b20, (_n_WHITE if _S.truth((_n_k_b18 > 0.6)) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_k_b18 > 0.3)) else _S.index_value(_n_C_b3,5)))])
			_S.invoke(_n_p_b0,"glow",[(_n_x_b19 + 0.5), (_n_yy_b20 + 0.5), 3, _S.index_value(_n_C_b3,5), (0.35 * _n_k_b18)])
			_n_i_b14 += 1.0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_LEAN = _S.read(_parent,"LEAN")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_z_b2 = _S.prop(_tuple_0,2)
	return [((_n_x_b0 * cos(_n_LEAN)) - (_n_y_b1 * sin(_n_LEAN))), ((_n_x_b0 * sin(_n_LEAN)) + (_n_y_b1 * cos(_n_LEAN))), _n_z_b2]
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_z_b2 = _S.arg(_args,2)
	var _n_l_b3 = _S.Bridge.hypot([_n_x_b0, _n_y_b1, _n_z_b2])
	return [(float(_n_x_b0)/_n_l_b3), (float(_n_y_b1)/_n_l_b3), (float(_n_z_b2)/_n_l_b3)]
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_HALF = _S.read(_parent,"HALF")
	var _n_unit = _S.read(_parent,"unit")
	var _n_roll = _S.read(_parent,"roll")
	var _n_planes_b0 = []
	var _n_deg_b1 = (float(PI)/180)
	var _n_jit_b2 = [0, 8, (-6), 4, (-9), 5]
	var _n_rr_b3 = [1, 0.86, 1.08, 0.94, 0.82, 1.04]
	var _n_low_b4 = [6.5, 5.5, 7, 6, 5, 6.8]
	if true:
		var _n_k_b6 = 0
		while _S.truth((_n_k_b6 < 6)):
			var _n_a_b7 = (((_n_k_b6 * 60) + _S.index_value(_n_jit_b2,_n_k_b6)) * _n_deg_b1)
			var _n_r_b8 = (4.8 * _S.index_value(_n_rr_b3,_n_k_b6))
			var _n_ct_b9 = atan2(13,_n_r_b8)
			var _n_cb_b10 = atan2(_S.index_value(_n_low_b4,_n_k_b6),_n_r_b8)
			_S.invoke(_n_planes_b0,"push",[{"n":[cos(_n_a_b7), 0, sin(_n_a_b7)],"d":_n_r_b8,"kind":6}])
			_S.invoke(_n_planes_b0,"push",[{"n":[(sin(_n_ct_b9) * cos(_n_a_b7)), cos(_n_ct_b9), (sin(_n_ct_b9) * sin(_n_a_b7))],"d":((sin(_n_ct_b9) * _n_r_b8) + (cos(_n_ct_b9) * _n_HALF)),"kind":7}])
			_S.invoke(_n_planes_b0,"push",[{"n":[(sin(_n_cb_b10) * cos(_n_a_b7)), (-cos(_n_cb_b10)), (sin(_n_cb_b10) * sin(_n_a_b7))],"d":((sin(_n_cb_b10) * _n_r_b8) + (cos(_n_cb_b10) * _n_HALF)),"kind":8}])
			_n_k_b6 += 1.0
	var _n_shear_b5 = _S.call_value(_n_unit,[0.7, 0.62, 0.34])
	_S.invoke(_n_planes_b0,"push",[{"n":_n_shear_b5,"d":((_S.index_value(_n_shear_b5,1) * 7.2) + (_S.index_value(_n_shear_b5,0) * (-0.6))),"kind":9}])
	for _iter_0 in _S.array([[_S.call_value(_n_unit,[(-0.7), (-0.25), 0.65]), 4], [_S.call_value(_n_unit,[0.75, 0.15, 0.6]), 3.9], [_S.call_value(_n_unit,[(-0.55), 0.5, 0.3]), 6.8]]):
		var _tuple_1 = _iter_0
		var _n_n_b11 = _S.prop(_tuple_1,0)
		var _n_d_b12 = _S.prop(_tuple_1,1)
		_S.invoke(_n_planes_b0,"push",[{"n":_n_n_b11,"d":_n_d_b12,"kind":10}])
	for _iter_2 in _S.array(_n_planes_b0):
		var _n_q_b13 = _iter_2
		_S.set_prop(_n_q_b13,"n",_S.call_value(_n_roll,[_S.named_value(_n_q_b13,"n")]),"=")
	return {"planes":_n_planes_b0,"r":8,"top":(_n_HALF + 13),"bottom":(_n_HALF + 8)}
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ph_b0 = _S.arg(_args,0)
	return {"y":((-_n_HOVER) - (1.8 * sin((_n_ph_b0 * _n_TAU)))),"spin":(0.3 + (0.62 * sin((_n_ph_b0 * _n_TAU))))}
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_ph_b0 = _S.arg(_args,0)
	return ((fmod((_n_ph_b0 * 2),1) * 1.7) - 0.3)
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_roll = _S.read(_parent,"roll")
	var _n_TILT = _S.read(_parent,"TILT")
	var _n_pt_b0 = _S.arg(_args,0)
	var _n_spin_b1 = _S.arg(_args,1)
	var _n_cy_b2 = _S.arg(_args,2)
	var _tuple_0 = _S.call_value(_n_roll,[_n_pt_b0])
	var _n_x_b3 = _S.prop(_tuple_0,0)
	var _n_y_b4 = _S.prop(_tuple_0,1)
	var _n_z_b5 = _S.prop(_tuple_0,2)
	var _n_xr_b6 = ((_n_x_b3 * cos(_n_spin_b1)) - (_n_z_b5 * sin(_n_spin_b1)))
	var _n_zr_b7 = ((_n_x_b3 * sin(_n_spin_b1)) + (_n_z_b5 * cos(_n_spin_b1)))
	return [_n_xr_b6, (_n_cy_b2 - ((_n_y_b4 * cos(_n_TILT)) - (_n_zr_b7 * sin(_n_TILT))))]
	return null
