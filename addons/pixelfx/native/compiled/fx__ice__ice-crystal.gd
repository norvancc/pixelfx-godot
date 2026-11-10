@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/ice-crystal.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "norm", _S.function_value(_e, "_f0"))
	_S.define(_e, "crystalFaces", _S.function_value(_e, "_f1"))
	_S.define(_e, "hullOf", _S.function_value(_e, "_f10"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f13"))
	_S.define(_e, "motes", _S.function_value(_e, "_f14"))
	_S.define(_e, "draw", _S.function_value(_e, "_f17"))
	_S.define(_e, "meta", _S.merge([{"name": "Ice crystal"}, {"desc": "A floating ice crystal turning slowly in its own cold light: its facets brighten and darken as they turn, glints flash on them, frost motes circle it."}, {"tags": ["ice", "crystal", "gem", "pickup", "float", "magic", "loop"]}, {"size": [96, 100]}, {"origin": [48, 92]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"height": 34}, {"seed": 21}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "TIP", 0.28)
	_S.define(_e, "LIGHT", _S.call_value(_S.read(_e, "norm"), [[_S.unary("-", 0.55), _S.unary("-", 0.75), _S.unary("-", 0.45)]]))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_z_b2 = _S.prop(_tuple_0,2)
	var _n_l_b3 = _S.logical("||",_S.Bridge.hypot([_n_x_b0, _n_y_b1, _n_z_b2]),func():return 1)
	return [(float(_n_x_b0)/_n_l_b3), (float(_n_y_b1)/_n_l_b3), (float(_n_z_b2)/_n_l_b3)]
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_TIP = _S.read(_parent,"TIP")
	var _n_norm = _S.read(_parent,"norm")
	var _n_LIGHT = _S.read(_parent,"LIGHT")
	var _n_th_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	var _n_ct_b2 = cos(_n_TIP)
	var _n_st_b3 = sin(_n_TIP)
	var _n_P_b4 = _S.function_value(_S.capture(_parent,{"ct":_n_ct_b2,"st":_n_st_b3,"this":_this}),"_f2")
	var _n_ring_b5 = _S.function_value(_S.capture(_parent,{"P":_n_P_b4,"th":_n_th_b0,"R":_n_R_b1,"this":_this}),"_f3")
	var _n_top_b6 = _S.call_value(_n_ring_b5,[((-_n_R_b1) * 0.45)])
	var _n_bot_b7 = _S.call_value(_n_ring_b5,[(_n_R_b1 * 0.45)])
	var _n_A_b8 = _S.call_value(_n_P_b4,[0, ((-_n_R_b1) * 2.2), 0])
	var _n_Z_b9 = _S.call_value(_n_P_b4,[0, (_n_R_b1 * 1.7), 0])
	var _n_faces_b10 = []
	if true:
		var _n_k_b12 = 0
		while _S.truth((_n_k_b12 < 6)):
			var _n_j_b13 = fmod((_n_k_b12 + 1),6)
			_S.invoke(_n_faces_b10,"push",[[_n_A_b8, _S.index_value(_n_top_b6,_n_j_b13), _S.index_value(_n_top_b6,_n_k_b12)], [_S.index_value(_n_top_b6,_n_k_b12), _S.index_value(_n_top_b6,_n_j_b13), _S.index_value(_n_bot_b7,_n_j_b13), _S.index_value(_n_bot_b7,_n_k_b12)], [_S.index_value(_n_bot_b7,_n_k_b12), _S.index_value(_n_bot_b7,_n_j_b13), _n_Z_b9]])
			_n_k_b12 += 1.0
	var _n_out_b11 = []
	for _iter_0 in _S.array(_n_faces_b10):
		var _n_f_b14 = _iter_0
		var _tuple_1 = _n_f_b14
		var _n_a_b15 = _S.prop(_tuple_1,0)
		var _n_b_b16 = _S.prop(_tuple_1,1)
		var _n_c_b17 = _S.prop(_tuple_1,2)
		var _n_u_b18 = [(_S.index_value(_n_b_b16,0) - _S.index_value(_n_a_b15,0)), (_S.index_value(_n_b_b16,1) - _S.index_value(_n_a_b15,1)), (_S.index_value(_n_b_b16,2) - _S.index_value(_n_a_b15,2))]
		var _n_v_b19 = [(_S.index_value(_n_c_b17,0) - _S.index_value(_n_a_b15,0)), (_S.index_value(_n_c_b17,1) - _S.index_value(_n_a_b15,1)), (_S.index_value(_n_c_b17,2) - _S.index_value(_n_a_b15,2))]
		var _n_n_b20 = _S.call_value(_n_norm,[[((_S.index_value(_n_u_b18,1) * _S.index_value(_n_v_b19,2)) - (_S.index_value(_n_u_b18,2) * _S.index_value(_n_v_b19,1))), ((_S.index_value(_n_u_b18,2) * _S.index_value(_n_v_b19,0)) - (_S.index_value(_n_u_b18,0) * _S.index_value(_n_v_b19,2))), ((_S.index_value(_n_u_b18,0) * _S.index_value(_n_v_b19,1)) - (_S.index_value(_n_u_b18,1) * _S.index_value(_n_v_b19,0)))]])
		var _n_cx_b21 = (float(_S.invoke(_n_f_b14,"reduce",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), 0]))/_S.prop(_n_f_b14,"length"))
		var _n_cy_b22 = (float(_S.invoke(_n_f_b14,"reduce",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f6"), 0]))/_S.prop(_n_f_b14,"length"))
		var _n_cz_b23 = (float(_S.invoke(_n_f_b14,"reduce",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), 0]))/_S.prop(_n_f_b14,"length"))
		if _S.truth(((((_S.index_value(_n_n_b20,0) * _n_cx_b21) + (_S.index_value(_n_n_b20,1) * _n_cy_b22)) + (_S.index_value(_n_n_b20,2) * _n_cz_b23)) < 0)):
			_n_n_b20 = _S.invoke(_n_n_b20,"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f8")])
		if _S.truth((_S.index_value(_n_n_b20,2) >= (-0.02))):
			continue
		var _n_lit_b24 = maxf(0,(((_S.index_value(_n_n_b20,0) * _S.index_value(_n_LIGHT,0)) + (_S.index_value(_n_n_b20,1) * _S.index_value(_n_LIGHT,1))) + (_S.index_value(_n_n_b20,2) * _S.index_value(_n_LIGHT,2))))
		var _n_h_b25 = _S.call_value(_n_norm,[[_S.index_value(_n_LIGHT,0), _S.index_value(_n_LIGHT,1), (_S.index_value(_n_LIGHT,2) - 1)]])
		var _n_spec_b26 = maxf(0,(((_S.index_value(_n_n_b20,0) * _S.index_value(_n_h_b25,0)) + (_S.index_value(_n_n_b20,1) * _S.index_value(_n_h_b25,1))) + (_S.index_value(_n_n_b20,2) * _S.index_value(_n_h_b25,2))))
		_S.invoke(_n_out_b11,"push",[{"pts":_S.invoke(_n_f_b14,"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f9")]),"lit":_n_lit_b24,"spec":_n_spec_b26,"cx":_n_cx_b21,"cy":_n_cy_b22}])
	return _n_out_b11
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_ct = _S.read(_parent,"ct")
	var _n_st = _S.read(_parent,"st")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_z_b2 = _S.arg(_args,2)
	return [_n_x_b0, ((_n_y_b1 * _n_ct) - (_n_z_b2 * _n_st)), ((_n_y_b1 * _n_st) + (_n_z_b2 * _n_ct))]
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_this = _S.read(_parent,"this")
	var _n_y_b0 = _S.arg(_args,0)
	return _S.invoke(_n_Array,"from",[{"length":6}, _S.function_value(_S.capture(_parent,{"y":_n_y_b0,"this":_n_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_P = _S.read(_parent,"P")
	var _n_th = _S.read(_parent,"th")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n_y = _S.read(_parent,"y")
	var _n___b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	return _S.call_value(_n_P,[(cos((_n_th + (float((_n_k_b1 * _n_TAU))/6))) * _n_R), _n_y, (sin((_n_th + (float((_n_k_b1 * _n_TAU))/6))) * _n_R)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_n_s_b0 + _S.index_value(_n_q_b1,0))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_n_s_b0 + _S.index_value(_n_q_b1,1))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_n_s_b0 + _S.index_value(_n_q_b1,2))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	return (-_n_q_b0)
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	return [_S.index_value(_n_q_b0,0), _S.index_value(_n_q_b0,1)]
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_P_b1 = _S.invoke(_S.concat([_S.array(_n_pts_b0)]),"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f11")])
	var _n_cross_b2 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f12")
	var _n_lo_b3 = []
	var _n_hi_b4 = []
	for _iter_0 in _S.array(_n_P_b1):
		var _n_q_b5 = _iter_0
		while _S.truth(((_S.call_value(_n_cross_b2,[_S.index_value(_n_lo_b3,(_S.prop(_n_lo_b3,"length") - 2)), _S.index_value(_n_lo_b3,(_S.prop(_n_lo_b3,"length") - 1)), _n_q_b5]) <= 0) if _S.truth((_S.prop(_n_lo_b3,"length") >= 2)) else (_S.prop(_n_lo_b3,"length") >= 2))):
			_S.invoke(_n_lo_b3,"pop",[])
		_S.invoke(_n_lo_b3,"push",[_n_q_b5])
	for _iter_1 in _S.array(_S.invoke(_n_P_b1,"reverse",[])):
		var _n_q_b6 = _iter_1
		while _S.truth(((_S.call_value(_n_cross_b2,[_S.index_value(_n_hi_b4,(_S.prop(_n_hi_b4,"length") - 2)), _S.index_value(_n_hi_b4,(_S.prop(_n_hi_b4,"length") - 1)), _n_q_b6]) <= 0) if _S.truth((_S.prop(_n_hi_b4,"length") >= 2)) else (_S.prop(_n_hi_b4,"length") >= 2))):
			_S.invoke(_n_hi_b4,"pop",[])
		_S.invoke(_n_hi_b4,"push",[_n_q_b6])
	return _S.invoke(_S.invoke(_n_lo_b3,"slice",[0, (-1)]),"concat",[_S.invoke(_n_hi_b4,"slice",[0, (-1)])])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return ((_S.index_value(_n_a_b0,0) - _S.index_value(_n_b_b1,0)) if _S.truth((_S.index_value(_n_a_b0,0) - _S.index_value(_n_b_b1,0))) else (_S.index_value(_n_a_b0,1) - _S.index_value(_n_b_b1,1)))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_o_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	var _n_b_b2 = _S.arg(_args,2)
	return (((_S.index_value(_n_a_b1,0) - _S.index_value(_n_o_b0,0)) * (_S.index_value(_n_b_b2,1) - _S.index_value(_n_o_b0,1))) - ((_S.index_value(_n_a_b1,1) - _S.index_value(_n_o_b0,1)) * (_S.index_value(_n_b_b2,0) - _S.index_value(_n_o_b0,0))))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_motes = _S.read(_parent,"motes")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_S.named_value(_n_meta,"duration"))
	var _n_bob_b5 = (sin((_n_TAU * _n_ph_b4)) * 2.5)
	var _n_Y_b6 = ((-_S.named_value(_n_o_b2,"height")) + _n_bob_b5)
	var _n_s_b7 = (1 - (float(_n_bob_b5)/12))
	var _n_rx_b8 = (11 * _n_s_b7)
	if true:
		var _n_x_b9 = floori((-_n_rx_b8))
		while _S.truth((_n_x_b9 <= _n_rx_b8)):
			var _n_f_b10 = (1 - pow((float(_n_x_b9)/_n_rx_b8),2))
			_S.invoke(_n_p_b0,"blend",[(_n_x_b9 + 0.5), 0, _S.index_value(_n_C_b3,0), (0.65 * _n_f_b10)])
			if _S.truth((absf(_n_x_b9) < (_n_rx_b8 * 0.6))):
				_S.invoke(_n_p_b0,"blend",[(_n_x_b9 + 0.5), 1, _S.index_value(_n_C_b3,0), (0.4 * _n_f_b10)])
			_n_x_b9 += 1.0
	_S.invoke(_n_p_b0,"glow",[0, (-1), 24, _S.index_value(_n_C_b3,4), (0.2 + (0.05 * sin(((_n_TAU * _n_ph_b4) * 2))))])
	_S.call_value(_n_motes,[_n_p_b0, _n_C_b3, _n_t_b1, _n_o_b2, _n_Y_b6, false])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_o_b3 = _S.arg(_args,3)
	var _n_Y_b4 = _S.arg(_args,4)
	var _n_front_b5 = _S.arg(_args,5)
	var _n_D_b6 = _S.named_value(_n_meta,"duration")
	_S.call_value(_n_cycle,[_n_t_b2, _n_D_b6, 16, _S.named_value(_n_o_b3,"seed"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f15"), _S.function_value(_S.capture(_parent,{"Y":_n_Y_b4,"front":_n_front_b5,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f16")])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[1.6, 2.6])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_Y = _S.read(_parent,"Y")
	var _n_front = _S.read(_parent,"front")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_th_b4 = (_S.invoke(_n_r_b2,"range",[0, _n_TAU]) + (_n_age_b0 * _S.invoke(_n_r_b2,"range",[1.6, 2.6])))
	var _n_R_b5 = _S.invoke(_n_r_b2,"range",[14, 22])
	var _n_y_b6 = ((_n_Y + _S.invoke(_n_r_b2,"range",[(-14), 12])) - (_n_age_b0 * _S.invoke(_n_r_b2,"range",[3, 7])))
	var _n_s_b7 = sin(_n_th_b4)
	var _n_k_b8 = (float(_n_age_b0)/_n_life_b1)
	if _S.truth(_S.binary("!==",(_n_s_b7 >= 0),_n_front)):
		return null
	var _n_x_b9 = (cos(_n_th_b4) * _n_R_b5)
	var _n_yy_b10 = (_n_y_b6 + ((_n_s_b7 * _n_R_b5) * 0.3))
	var _n_a_b11 = (minf(1,(float(_n_age_b0)/0.2)) * ((float((1 - _n_k_b8))/0.25) if _S.truth((_n_k_b8 > 0.75)) else 1))
	if _S.truth(_n_front):
		_S.invoke(_n_p,"dot",[_n_x_b9, _n_yy_b10, (_n_WHITE if _S.truth(_S.binary("===",fmod(_n_i_b3,4),0)) else _S.index_value(_n_C,6)), _n_a_b11])
		if _S.truth(_S.binary("===",fmod(_n_i_b3,4),0)):
			for _iter_0 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
				var _tuple_1 = _iter_0
				var _n_dx_b12 = _S.prop(_tuple_1,0)
				var _n_dy_b13 = _S.prop(_tuple_1,1)
				_S.invoke(_n_p,"dot",[(_n_x_b9 + _n_dx_b12), (_n_yy_b10 + _n_dy_b13), _S.index_value(_n_C,5), _n_a_b11])
		_S.invoke(_n_p,"glow",[_n_x_b9, _n_yy_b10, 4, _S.index_value(_n_C,5), (0.3 * _n_a_b11)])
	else:
		_S.invoke(_n_p,"dot",[_n_x_b9, _n_yy_b10, _S.index_value(_n_C,4), (_n_a_b11 * 0.9)])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	_S.define(_e, "bob", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "ph"))]), 2.5))
	_S.define(_e, "Y", _S.binary("+", _S.unary("-", _S.prop(_S.read(_e, "o"), "height")), _S.read(_e, "bob")))
	_S.define(_e, "R", 8)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "Y"), 34, _S.prop(_S.read(_e, "C"), 3), 0.26])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "Y"), 14, _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.18, _S.binary("*", 0.08, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "ph")), 3)])))])
	_S.define(_e, "faces", _S.call_value(_S.read(_e, "crystalFaces"), [_S.binary("*", _S.binary("/", _S.read(_e, "TAU"), 6), _S.read(_e, "ph")), _S.read(_e, "R")]))
	_S.define(_e, "hull", _S.call_value(_S.read(_e, "hullOf"), [_S.invoke(_S.read(_e, "faces"), "flatMap", [_S.function_value(_e, "_f18")])]))
	_S.define(_e, "mx", 0)
	_S.define(_e, "my", 0)
	for _v19 in _S.array(_S.read(_e, "hull")):
		var _v20 = _S.scope(_e)
		var _v21 = _v19
		_S.define(_v20, "x", _S.prop(_v21, 0))
		_S.define(_v20, "y", _S.prop(_v21, 1))
		_S.last([_S.write(_v20, "mx", _S.read(_v20, "x"), "+=", false), _S.write(_v20, "my", _S.read(_v20, "y"), "+=", false)])
	_S.last([_S.write(_e, "mx", _S.prop(_S.read(_e, "hull"), "length"), "/=", false), _S.write(_e, "my", _S.prop(_S.read(_e, "hull"), "length"), "/=", false)])
	_S.invoke(_S.read(_e, "p"), "poly", [_S.invoke(_S.read(_e, "hull"), "map", [_S.function_value(_e, "_f19")]), _S.prop(_S.read(_e, "C"), 1)])
	for _v23 in _S.array(_S.read(_e, "faces")):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "f", _v23)
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "c", (_S.read(_v25, "WHITE") if _S.truth(_S.binary(">", _S.prop(_S.read(_v25, "f"), "spec"), 0.985)) else _S.prop(_S.read(_v25, "C"), _S.call_value(_S.read(_v25, "clamp"), [_S.invoke(_S.read(_v25, "Math"), "round", [_S.binary("+", 1, _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "pow", [_S.prop(_S.read(_v25, "f"), "lit"), 1.4]), 6.6))]), 1, 7]))))
		_S.invoke(_S.read(_v25, "p"), "poly", [_S.invoke(_S.prop(_S.read(_v25, "f"), "pts"), "map", [_S.function_value(_v25, "_f20")]), _S.read(_v25, "c")])
	for _v27 in _S.array(_S.read(_e, "faces")):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "f", _v27)
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), _S.prop(_S.prop(_S.read(_v29, "f"), "pts"), "length"))):
			var _v30 = _S.scope(_v29)
			var _v31 = _S.prop(_S.prop(_S.read(_v30, "f"), "pts"), _S.read(_v30, "i"))
			_S.define(_v30, "x0", _S.prop(_v31, 0))
			_S.define(_v30, "y0", _S.prop(_v31, 1))
			var _v32 = _S.prop(_S.prop(_S.read(_v30, "f"), "pts"), _S.binary("%", _S.binary("+", _S.read(_v30, "i"), 1), _S.prop(_S.prop(_S.read(_v30, "f"), "pts"), "length")))
			_S.define(_v30, "x1", _S.prop(_v32, 0))
			_S.define(_v30, "y1", _S.prop(_v32, 1))
			_S.invoke(_S.read(_v30, "p"), "line", [_S.read(_v30, "x0"), _S.binary("+", _S.read(_v30, "y0"), _S.read(_v30, "Y")), _S.read(_v30, "x1"), _S.binary("+", _S.read(_v30, "y1"), _S.read(_v30, "Y")), (_S.prop(_S.read(_v30, "C"), 7) if _S.truth(_S.binary(">", _S.prop(_S.read(_v30, "f"), "lit"), 0.6)) else (_S.prop(_S.read(_v30, "C"), 6) if _S.truth(_S.binary(">", _S.prop(_S.read(_v30, "f"), "lit"), 0.3)) else _S.prop(_S.read(_v30, "C"), 4)))])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
	for _v33 in _S.array(_S.read(_e, "faces")):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "f", _v33)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v34, "f"), "spec"), 0.96)):
			_S.call_value(_S.read(_v34, "sparkle"), [_S.read(_v34, "p"), _S.prop(_S.read(_v34, "f"), "cx"), _S.binary("+", _S.prop(_S.read(_v34, "f"), "cy"), _S.read(_v34, "Y")), _S.invoke(_S.read(_v34, "Math"), "round", [_S.binary("+", 2, _S.binary("*", _S.binary("-", _S.prop(_S.read(_v34, "f"), "spec"), 0.96), 150))]), _S.prop(_S.read(_v34, "C"), 6), _S.prop(_S.read(_v34, "C"), 4), 0.5])
	_S.define(_e, "g", _S.binary("%", _S.binary("*", _S.read(_e, "ph"), 2), 1))
	if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.12)):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.binary("-", _S.read(_e, "Y"), _S.binary("*", _S.binary("*", _S.read(_e, "R"), 2.2), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "TIP")]))), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", 5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "g"), 0.12), _S.prop(_S.read(_e, "Math"), "PI"))]))]), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 4), 0.6])
	_S.call_value(_S.read(_e, "motes"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "o"), _S.read(_e, "Y"), true])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_f_b0 = _S.arg(_args,0)
	return _S.named_value(_n_f_b0,"pts")
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_mx = _S.read(_parent,"mx")
	var _n_my = _S.read(_parent,"my")
	var _n_Y = _S.read(_parent,"Y")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_d_b2 = _S.logical("||",_S.Bridge.hypot([(_n_x_b0 - _n_mx), (_n_y_b1 - _n_my)]),func():return 1)
	return [(_n_x_b0 + ((float((_n_x_b0 - _n_mx))/_n_d_b2) * 1.2)), ((_n_y_b1 + _n_Y) + ((float((_n_y_b1 - _n_my))/_n_d_b2) * 1.2))]
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return [_n_x_b0, (_n_y_b1 + _n_Y)]
	return null
