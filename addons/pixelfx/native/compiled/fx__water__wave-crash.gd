@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/wave-crash.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "noise2", _S.import_value("core/index.js", "noise2"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "Drops", _S.import_value("fx/water/_lib.js", "Drops"))
	_S.define(_e, "Ripples", _S.import_value("fx/water/_lib.js", "Ripples"))
	_S.define(_e, "Mist", _S.import_value("fx/water/_lib.js", "Mist"))
	_S.define(_e, "billow", _S.import_value("fx/water/_lib.js", "billow"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Wave crash"}, {"desc": "A swell rolls in and steepens, its lip throws forward and curls over a dark barrel, then crashes into a burst of white foam and spray that surges on and fades to lace."}, {"tags": ["water", "wave", "crash", "surf", "foam", "spray", "one-shot"]}, {"size": [224, 104]}, {"origin": [112, 86]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SY", 0.22)
	_S.define(_e, "G", 820)
	_S.define(_e, "CRASH", 1.2)
	_S.define(_e, "LIP0", 0.62)
	_S.define(_e, "EDGE", 110)
	_S.define(_e, "crestX", _S.function_value(_e, "_f12"))
	_S.define(_e, "crestH", _S.function_value(_e, "_f13"))
	_S.define(_e, "faceW", _S.function_value(_e, "_f14"))
	_S.define(_e, "lipK", _S.function_value(_e, "_f15"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "body", _S.function_value(_e, "_f1"))
	_S.define(_e, "curl", _S.function_value(_e, "_f2"))
	_S.define(_e, "sea", _S.function_value(_e, "_f3"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}])]))
	_S.define(_e, "mist", _S.construct(_S.read(_e, "Mist"), []))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "rings", _S.construct(_S.read(_e, "Ripples"), [_S.merge([{"sy": _S.read(_e, "SY")}])]))
	_S.define(_e, "puffs", [])
	_S.define(_e, "plinks", [])
	_S.define(_e, "drops", _S.construct(_S.read(_e, "Drops"), [_S.merge([{"sy": _S.read(_e, "SY")}, {"g": _S.read(_e, "G")}, {"onLand": _S.function_value(_e, "_f4")}])]))
	_S.define(_e, "t", 0)
	_S.define(_e, "crashed", false)
	_S.define(_e, "height", _S.function_value(_e, "_f5"))
	_S.define(_e, "lip", _S.function_value(_e, "_f6"))
	_S.define(_e, "puff", _S.function_value(_e, "_f7"))
	return _S.merge([{"update": _S.function_value(_e, "_f8")}, {"drawBack": _S.function_value(_e, "_f9")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_crestX = _S.read(_parent,"crestX")
	var _n_t = _S.read(_parent,"t")
	var _n_crestH = _S.read(_parent,"crestH")
	var _n_EDGE = _S.read(_parent,"EDGE")
	var _n_height = _S.read(_parent,"height")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_S = _S.read(_parent,"S")
	var _n_C = _S.read(_parent,"C")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_fade_b1 = _S.arg(_args,1)
	var _n_xc_b2 = _S.call_value(_n_crestX,[_n_t])
	var _n_A_b3 = _S.call_value(_n_crestH,[_n_t])
	if true:
		var _n_X_b4 = (-_n_EDGE)
		while _S.truth((_n_X_b4 < _n_EDGE)):
			var _n_x_b5 = (_n_X_b4 + 0.5)
			var _n_h_b6 = _S.call_value(_n_height,[_n_x_b5, _n_t])
			var _n_edge_b7 = (1 - _S.MathFX.smooth((_n_EDGE - 24),_n_EDGE,absf(_n_x_b5)))
			if _S.truth(((_n_h_b6 < 0.6) if _S.truth((_n_h_b6 < 0.6)) else (_n_edge_b7 <= 0))):
				_n_X_b4 += 1.0
				continue
			var _n_face_b8 = (_n_x_b5 > _n_xc_b2)
			var _n_near_b9 = exp((-pow((float((_n_x_b5 - _n_xc_b2))/9),2)))
			var _n_a_b10 = ((_n_fade_b1 * _n_edge_b7) * 1.4)
			if true:
				var _n_Y_b11 = floori((-_n_h_b6))
				while _S.truth((_n_Y_b11 < 0)):
					var _n_y_b12 = (_n_Y_b11 + 0.5)
					var _n_u_b13 = (float((_n_y_b12 + _n_h_b6))/_n_h_b6)
					var _n_depth_b14 = (_n_y_b12 + _n_h_b6)
					var _n_c_b15 = null
					if _S.truth((_n_depth_b14 < 1)):
						_n_c_b15 = (_n_WHITE if _S.truth(((_S.MathFX.noise(((_n_x_b5 * 0.6) + (_n_t * 9)),_n_S) > (-0.35)) if _S.truth(((_n_A_b3 > 14) if _S.truth((_n_near_b9 > 0.5)) else (_n_near_b9 > 0.5))) else ((_n_A_b3 > 14) if _S.truth((_n_near_b9 > 0.5)) else (_n_near_b9 > 0.5)))) else (_S.index_value(_n_C,5) if _S.truth(_n_face_b8) else _S.index_value(_n_C,6)))
					else:
						if _S.truth(((_n_A_b3 > 14) if _S.truth(((_n_near_b9 > 0.35) if _S.truth((_n_depth_b14 < 2.4)) else (_n_depth_b14 < 2.4))) else ((_n_near_b9 > 0.35) if _S.truth((_n_depth_b14 < 2.4)) else (_n_depth_b14 < 2.4)))):
							_n_c_b15 = (_n_WHITE if _S.truth((_S.NoiseKernels.noise2((_n_x_b5 * 0.5),((_n_y_b12 * 0.5) + (_n_t * 6)),(_n_S + 1)) > (-0.1))) else _S.index_value(_n_C,6))
						else:
							var _n_win_b16 = ((_n_near_b9 * (1 - _n_u_b13)) * 1.6)
							var _n_up_b17 = _S.NoiseKernels.noise2((((_n_x_b5 * 0.9) - (_n_y_b12 * 0.35)) * 0.8),((_n_y_b12 * 0.12) + (_n_t * 5)),(_n_S + 2))
							var _n_wind_b18 = _S.NoiseKernels.noise2(((_n_x_b5 * 0.18) - (_n_t * 2)),(_n_y_b12 * 0.9),(_n_S + 3))
							var _n_fi_b19 = (6 if _S.truth(((_n_u_b13 < 0.85) if _S.truth((_n_up_b17 > 0.55)) else (_n_up_b17 > 0.55))) else (5 if _S.truth((_n_win_b16 > 0.8)) else (4 if _S.truth(((_n_win_b16 > 0.45) if _S.truth((_n_win_b16 > 0.45)) else (_n_up_b17 > 0.3))) else (3 if _S.truth(((_n_win_b16 > 0.2) if _S.truth((_n_win_b16 > 0.2)) else (_n_up_b17 > 0.05))) else (2 if _S.truth((_n_u_b13 < 0.6)) else 1)))))
							var _n_bi_b20 = (4 if _S.truth((_n_u_b13 < 0.14)) else (4 if _S.truth((_n_wind_b18 > 0.55)) else (3 if _S.truth(((_n_wind_b18 > 0.25) if _S.truth((_n_wind_b18 > 0.25)) else (_n_u_b13 < 0.32))) else (2 if _S.truth((_n_u_b13 < 0.7)) else 1))))
							_n_c_b15 = _S.index_value(_n_C,floori((_n_bi_b20 + ((_n_fi_b19 - _n_bi_b20) * _S.MathFX.smooth((_n_xc_b2 - 5),(_n_xc_b2 + 5),_n_x_b5)))+0.5))
					_S.invoke(_n_p_b0,"dot",[_n_X_b4, _n_Y_b11, _n_c_b15, _n_a_b10])
					_n_Y_b11 += 1.0
			_n_X_b4 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_lipK = _S.read(_parent,"lipK")
	var _n_t = _S.read(_parent,"t")
	var _n_CRASH = _S.read(_parent,"CRASH")
	var _n_Map = _S.read(_parent,"Map")
	var _n_lip = _S.read(_parent,"lip")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.call_value(_n_lipK,[_n_t])
	if _S.truth(((_n_k_b1 <= 0) if _S.truth((_n_k_b1 <= 0)) else (_n_t >= _n_CRASH))):
		return null
	var _n_cells_b2 = _S.construct(_n_Map,[])
	if true:
		var _n_s_b8 = 0
		while _S.truth((_n_s_b8 <= 1)):
			var _tuple_0 = _S.call_value(_n_lip,[_n_s_b8, _n_t])
			var _n_x_b9 = _S.prop(_tuple_0,0)
			var _n_y_b10 = _S.prop(_tuple_0,1)
			var _n_w_b11 = _S.prop(_tuple_0,2)
			var _tuple_1 = _S.call_value(_n_lip,[minf(1,(_n_s_b8 + 0.012)), _n_t])
			var _n_x2_b12 = _S.prop(_tuple_1,0)
			var _n_y2_b13 = _S.prop(_tuple_1,1)
			var _n_tx_b14 = (_n_x2_b12 - _n_x_b9)
			var _n_ty_b15 = (_n_y2_b13 - _n_y_b10)
			var _n_l_b16 = _S.logical("||",_S.Bridge.hypot([_n_tx_b14, _n_ty_b15]),func():return 1)
			var _n_nx_b17 = (float(_n_ty_b15)/_n_l_b16)
			var _n_ny_b18 = (float((-_n_tx_b14))/_n_l_b16)
			if true:
				var _n_q_b19 = 0
				while _S.truth((_n_q_b19 <= 1)):
					var _n_px_b20 = (_n_x_b9 + ((_n_nx_b17 * (_n_q_b19 - 0.5)) * _n_w_b11))
					var _n_py_b21 = (_n_y_b10 + ((_n_ny_b18 * (_n_q_b19 - 0.5)) * _n_w_b11))
					var _n_key_b22 = ((floori(_n_py_b21) * 1024) + floori(_n_px_b20))
					var _n_c_b23 = (_n_WHITE if _S.truth((_n_q_b19 < 0.18)) else ((_n_WHITE if _S.truth((_n_s_b8 > 0.8)) else _S.index_value(_n_C,6)) if _S.truth((_n_q_b19 < 0.36)) else (_S.index_value(_n_C,5) if _S.truth((_n_q_b19 < 0.56)) else (_S.index_value(_n_C,4) if _S.truth((_n_q_b19 < 0.76)) else _S.index_value(_n_C,3)))))
					var _n_cur_b24 = _S.invoke(_n_cells_b2,"get",[_n_key_b22])
					if _S.truth((not _S.truth(_n_cur_b24) if _S.truth(not _S.truth(_n_cur_b24)) else (_n_q_b19 < _S.named_value(_n_cur_b24,"q")))):
						_S.invoke(_n_cells_b2,"set",[_n_key_b22, {"x":_n_px_b20,"y":_n_py_b21,"c":_n_c_b23,"q":_n_q_b19}])
					_n_q_b19 += (float(0.5)/maxf(1,_n_w_b11))
			_n_s_b8 += 0.012
	for _iter_2 in _S.array(_S.invoke(_n_cells_b2,"values",[])):
		var _n_c_b25 = _iter_2
		_S.invoke(_n_p_b0,"px",[_S.named_value(_n_c_b25,"x"), _S.named_value(_n_c_b25,"y"), _S.named_value(_n_c_b25,"c")])
	if true:
		var _n_s_b26 = 0
		while _S.truth((_n_s_b26 <= 1)):
			var _tuple_3 = _S.call_value(_n_lip,[_n_s_b26, _n_t])
			var _n_x_b27 = _S.prop(_tuple_3,0)
			var _n_y_b28 = _S.prop(_tuple_3,1)
			var _n_w_b29 = _S.prop(_tuple_3,2)
			_S.invoke(_n_p_b0,"glow",[_n_x_b27, _n_y_b28, (6 + _n_w_b29), _S.index_value(_n_C,5), (0.24 * _n_k_b1)])
			_n_s_b26 += 0.125
	var _tuple_4 = _S.call_value(_n_lip,[1, _n_t])
	var _n_tx_b3 = _S.prop(_tuple_4,0)
	var _n_ty_b4 = _S.prop(_tuple_4,1)
	var _n_g_b5 = sin((PI * clampf((float((_n_k_b1 - 0.55))/0.45),0.0,1.0)))
	if _S.truth((_n_g_b5 > 0.05)):
		_S.call_value(_n_sparkle,[_n_p_b0, _n_tx_b3, _n_ty_b4, (6 * _n_g_b5), _S.index_value(_n_C,6), _S.index_value(_n_C,5), (0.5 * _n_g_b5)])
	var _tuple_5 = _S.call_value(_n_lip,[0.6, _n_t])
	var _n_bx_b6 = _S.prop(_tuple_5,0)
	var _n_by_b7 = _S.prop(_tuple_5,1)
	_S.invoke(_n_p_b0,"glow",[(_n_bx_b6 - 3), (_n_by_b7 + 8), 16, _S.index_value(_n_C,4), (0.25 * _n_k_b1)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_EDGE = _S.read(_parent,"EDGE")
	var _n_t = _S.read(_parent,"t")
	var _n_S = _S.read(_parent,"S")
	var _n_C = _S.read(_parent,"C")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_fade_b1 = _S.arg(_args,1)
	if true:
		var _n_X_b2 = (-_n_EDGE)
		while _S.truth((_n_X_b2 < _n_EDGE)):
			var _n_x_b3 = (_n_X_b2 + 0.5)
			var _n_edge_b4 = (1 - _S.MathFX.smooth((_n_EDGE - 30),_n_EDGE,absf(_n_x_b3)))
			var _n_a_b5 = (_n_fade_b1 * _n_edge_b4)
			if _S.truth((_n_a_b5 <= 0.02)):
				_n_X_b2 += 1.0
				continue
			var _n_g_b6 = _S.MathFX.noise(((_n_x_b3 * 0.3) - (_n_t * 3)),(_n_S + 4))
			_S.invoke(_n_p_b0,"dot",[_n_X_b2, 0, (_S.index_value(_n_C,6) if _S.truth((_n_g_b6 > 0.55)) else _S.index_value(_n_C,4)), (_n_a_b5 * 1.2)])
			_S.invoke(_n_p_b0,"blend",[_n_x_b3, 1.5, _S.index_value(_n_C,2), (0.6 * _n_a_b5)])
			_S.invoke(_n_p_b0,"blend",[_n_x_b3, 2.5, _S.index_value(_n_C,1), (0.45 * _n_a_b5)])
			_n_X_b2 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_rings = _S.read(_parent,"rings")
	var _n_plinks = _S.read(_parent,"plinks")
	var _n_SY = _S.read(_parent,"SY")
	var _n_d_b0 = _S.arg(_args,0)
	_S.invoke(_n_rings,"add",[_S.named_value(_n_d_b0,"x"), _S.named_value(_n_d_b0,"z"), 0.6, (2 + (_S.named_value(_n_d_b0,"s") * 1.8)), (0.3 + (_S.named_value(_n_d_b0,"s") * 0.1)), {"n":1,"k":0.9,"hot":0.05}])
	_S.invoke(_n_plinks,"push",[{"x":_S.named_value(_n_d_b0,"x"),"y":(_S.named_value(_n_d_b0,"z") * _n_SY),"age":0}])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_crestX = _S.read(_parent,"crestX")
	var _n_crestH = _S.read(_parent,"crestH")
	var _n_faceW = _S.read(_parent,"faceW")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.arg(_args,1)
	var _n_xc_b2 = _S.call_value(_n_crestX,[_n_tt_b1])
	var _n_A_b3 = _S.call_value(_n_crestH,[_n_tt_b1])
	var _n_dx_b4 = (_n_x_b0 - _n_xc_b2)
	return (_n_A_b3 * exp((-pow((float(_n_dx_b4)/(30 if _S.truth((_n_dx_b4 < 0)) else _S.call_value(_n_faceW,[_n_tt_b1]))),2))))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_lipK = _S.read(_parent,"lipK")
	var _n_crestX = _S.read(_parent,"crestX")
	var _n_crestH = _S.read(_parent,"crestH")
	var _n_ease = _S.read(_parent,"ease")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.call_value(_n_lipK,[_n_tt_b1])
	var _n_xc_b3 = _S.call_value(_n_crestX,[_n_tt_b1])
	var _n_A_b4 = _S.call_value(_n_crestH,[_n_tt_b1])
	return [((_n_xc_b3 + 1) + ((_n_s_b0 * 30) * pow(_n_k_b2,0.8))), (((-_n_A_b4) - (((4 * _n_s_b0) * (1 - _n_s_b0)) * (1 + (4 * _n_k_b2)))) + ((((_n_s_b0 * _n_s_b0) * _n_A_b4) * _S.invoke(_n_ease,"inQuad",[_n_k_b2])) * 0.98)), ((11 - (8.5 * _n_s_b0)) * (0.5 + (0.5 * _n_k_b2)))]
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_puffs = _S.read(_parent,"puffs")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_vy_b3 = _S.arg(_args,3)
	var _n_r0_b4 = _S.arg(_args,4)
	var _n_r1_b5 = _S.arg(_args,5)
	var _n_life_b6 = _S.arg(_args,6)
	var _n_delay_b7 = _S.coalesce(_S.arg(_args,7),func():return 0)
	return _S.invoke(_n_puffs,"push",[{"x":_n_x_b0,"y":_n_y_b1,"vx":_n_vx_b2,"vy":_n_vy_b3,"r0":_n_r0_b4,"r1":_n_r1_b5,"life":_n_life_b6,"max":_n_life_b6,"delay":_n_delay_b7}])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "k", _S.call_value(_S.read(_e, "lipK"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "CRASH")), func(): return _S.binary(">", _S.call_value(_S.read(_e, "crestH"), [_S.read(_e, "t")]), 14)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "xc", _S.call_value(_S.read(_v20, "crestX"), [_S.read(_v20, "t")]))
		_S.define(_v20, "A", _S.call_value(_S.read(_v20, "crestH"), [_S.read(_v20, "t")]))
		_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "FLAKE"), _S.binary("+", _S.read(_v20, "xc"), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 4), 3])), _S.binary("-", _S.unary("-", _S.read(_v20, "A")), _S.invoke(_S.read(_v20, "R"), "range", [0, 2])), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [20, 60])), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [10, 40])), _S.invoke(_S.read(_v20, "R"), "range", [0.5, 0.9]), (_S.read(_v20, "WHITE") if _S.truth(_S.invoke(_S.read(_v20, "R"), "chance", [0.5])) else _S.prop(_S.read(_v20, "C"), 6)), _S.invoke(_S.read(_v20, "R"), "range", [0.6, 1.3])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0.3), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "CRASH"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.35]))):
		var _v21 = _S.scope(_e)
		var _v22 = _S.call_value(_S.read(_v21, "lip"), [1, _S.read(_v21, "t")])
		_S.define(_v21, "x", _S.prop(_v22, 0))
		_S.define(_v21, "y", _S.prop(_v22, 1))
		_S.invoke(_S.read(_v21, "drops"), "add", [_S.merge([{"x": _S.read(_v21, "x")}, {"z": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 3), 3])}, {"h": _S.unary("-", _S.read(_v21, "y"))}, {"vx": _S.invoke(_S.read(_v21, "R"), "range", [30, 90])}, {"vz": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 10), 10])}, {"vh": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 20), 40])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [0.3])) else 1)}])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "crashed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRASH")))):
		var _v23 = _S.scope(_e)
		_S.write(_v23, "crashed", true, "=", false)
		var _v24 = _S.call_value(_S.read(_v23, "lip"), [1, _S.binary("-", _S.read(_v23, "CRASH"), 0.001)])
		_S.define(_v23, "X0", _S.prop(_v24, 0))
		_S.invoke(_S.read(_v23, "lights"), "add", [_S.read(_v23, "X0"), _S.unary("-", 20), 56, _S.prop(_S.read(_v23, "C"), 5), 0.8, 0.55])
		_S.invoke(_S.read(_v23, "lights"), "add", [_S.read(_v23, "X0"), _S.unary("-", 4), 22, _S.read(_v23, "WHITE"), 0.6, 0.1])
		var _v25 = _S.scope(_v23)
		_S.define(_v25, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v25, "i"), 46)):
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "a", _S.binary("*", _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 0.9), 0.6]), _S.prop(_S.read(_v26, "Math"), "PI")))
			_S.define(_v26, "v", _S.invoke(_S.read(_v26, "R"), "range", [30, 120]))
			_S.invoke(_S.read(_v26, "drops"), "add", [_S.merge([{"x": _S.binary("+", _S.read(_v26, "X0"), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 6), 6]))}, {"z": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 4), 4])}, {"h": _S.invoke(_S.read(_v26, "R"), "range", [2, 8])}, {"vx": _S.binary("+", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "a")]), _S.read(_v26, "v")), 0.85), 18)}, {"vz": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "a")]), _S.read(_v26, "v")), 0.5)}, {"vh": _S.invoke(_S.read(_v26, "R"), "range", [120, 320])}, {"s": (3 if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.15])) else (2 if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.35])) else 1))}, {"delay": _S.invoke(_S.read(_v26, "R"), "range", [0, 0.1])}])])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "+=", true)
		var _v27 = _S.scope(_v23)
		_S.define(_v27, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v27, "i"), 14)):
			_S.invoke(_S.read(_v27, "drops"), "add", [_S.merge([{"x": _S.binary("+", _S.read(_v27, "X0"), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 3), 3]))}, {"z": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 2), 2])}, {"h": _S.invoke(_S.read(_v27, "R"), "range", [2, 6])}, {"vx": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 15), 25])}, {"vz": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 8), 8])}, {"vh": _S.invoke(_S.read(_v27, "R"), "range", [220, 300])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.3])) else 1)}, {"delay": _S.invoke(_S.read(_v27, "R"), "range", [0.04, 0.16])}])])
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "i", 1, "+=", true)
		var _v28 = _S.scope(_v23)
		_S.define(_v28, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v28, "i"), 34)):
			_S.call_value(_S.read(_v28, "puff"), [_S.binary("+", _S.read(_v28, "X0"), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 12), 10])), _S.unary("-", _S.invoke(_S.read(_v28, "R"), "range", [2, 12])), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 40), 130]), _S.unary("-", _S.invoke(_S.read(_v28, "R"), "range", [30, 150])), _S.invoke(_S.read(_v28, "R"), "range", [1, 2]), _S.invoke(_S.read(_v28, "R"), "range", [1.8, 4.2]), _S.invoke(_S.read(_v28, "R"), "range", [0.4, 0.95]), _S.invoke(_S.read(_v28, "R"), "range", [0, 0.14])])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "i", 1, "+=", true)
		var _v29 = _S.scope(_v23)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 34)):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "a", _S.invoke(_S.read(_v30, "R"), "range", [_S.binary("*", _S.unary("-", _S.prop(_S.read(_v30, "Math"), "PI")), 0.95), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v30, "Math"), "PI")), 0.05)]))
			_S.define(_v30, "v", _S.invoke(_S.read(_v30, "R"), "range", [40, 160]))
			_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "FLAKE"), _S.binary("+", _S.read(_v30, "X0"), _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 8), 8])), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [4, 14])), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "a")]), _S.read(_v30, "v")), 25), _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "a")]), _S.read(_v30, "v")), _S.invoke(_S.read(_v30, "R"), "range", [0.6, 1.3]), (_S.read(_v30, "WHITE") if _S.truth(_S.invoke(_S.read(_v30, "R"), "chance", [0.5])) else _S.prop(_S.read(_v30, "C"), 6)), _S.invoke(_S.read(_v30, "R"), "range", [0.6, 1.4]), _S.invoke(_S.read(_v30, "R"), "range", [0, 0.1])])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
		var _v31 = _S.scope(_v23)
		_S.define(_v31, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v31, "i"), 12)):
			_S.invoke(_S.read(_v31, "mist"), "add", [_S.binary("+", _S.read(_v31, "X0"), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 10), 14])), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [3, 16])), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 20), 70]), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [6, 24])), 3, _S.invoke(_S.read(_v31, "R"), "range", [9, 15]), _S.invoke(_S.read(_v31, "R"), "range", [1.1, 1.7]), (_S.prop(_S.read(_v31, "C"), 6) if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [0.5])) else _S.read(_v31, "WHITE")), 0.26, _S.invoke(_S.read(_v31, "R"), "range", [0, 0.2])])
			_v31 = _S.iteration(_v31)
			_S.write(_v31, "i", 1, "+=", true)
		var _v32 = _S.scope(_v23)
		_S.define(_v32, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v32, "i"), 10)):
			_S.invoke(_S.read(_v32, "ps"), "spawn", [_S.prop(_S.read(_v32, "P"), "STAR"), _S.binary("+", _S.read(_v32, "X0"), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 20), 24])), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [6, 40])), 0, _S.unary("-", 5), _S.invoke(_S.read(_v32, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v32, "C"), 6), _S.invoke(_S.read(_v32, "R"), "range", [1, 2.4]), _S.invoke(_S.read(_v32, "R"), "range", [0.05, 0.4])])
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "i", 1, "+=", true)
		_S.invoke(_S.read(_v23, "rings"), "add", [_S.read(_v23, "X0"), 0, 6, 40, 1.2, _S.merge([{"n": 2}, {"gap": 3}, {"k": 1.1}, {"hot": 0.12}])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "crashed"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CRASH"), 1.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.45, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CRASH")), 1.1)))]))):
		var _v33 = _S.scope(_e)
		_S.define(_v33, "x", _S.binary("+", _S.call_value(_S.read(_v33, "crestX"), [_S.read(_v33, "t")]), _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 6), 14])))
		_S.call_value(_S.read(_v33, "puff"), [_S.read(_v33, "x"), _S.unary("-", _S.invoke(_S.read(_v33, "R"), "range", [1, 4])), _S.invoke(_S.read(_v33, "R"), "range", [10, 40]), _S.unary("-", _S.invoke(_S.read(_v33, "R"), "range", [10, 40])), _S.invoke(_S.read(_v33, "R"), "range", [0.9, 1.8]), _S.invoke(_S.read(_v33, "R"), "range", [1.8, 3.6]), _S.invoke(_S.read(_v33, "R"), "range", [0.4, 0.8])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "crashed"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CRASH"), 0.8))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.12]))):
		_S.invoke(_S.read(_e, "mist"), "add", [_S.binary("+", _S.call_value(_S.read(_e, "crestX"), [_S.read(_e, "t")]), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 8), 8])), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [2, 6])), _S.invoke(_S.read(_e, "R"), "range", [10, 40]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [3, 10])), 3, _S.invoke(_S.read(_e, "R"), "range", [7, 11]), _S.invoke(_S.read(_e, "R"), "range", [0.8, 1.1]), _S.prop(_S.read(_e, "C"), 6), 0.2])
	var _v34 = _S.scope(_e)
	_S.define(_v34, "i", _S.binary("-", _S.prop(_S.read(_v34, "puffs"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v34, "i"), 0)):
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "f", _S.prop(_S.read(_v35, "puffs"), _S.read(_v35, "i")))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v35, "f"), "delay"), 0)):
			var _v36 = _S.scope(_v35)
			_S.set_prop(_S.read(_v36, "f"), "delay", _S.read(_v36, "dt"), "-=", false)
			_v34 = _S.iteration(_v34)
			_S.write(_v34, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v35, "f"), "life", _S.read(_v35, "dt"), "-=", false), 0)):
			var _v37 = _S.scope(_v35)
			_S.invoke(_S.read(_v37, "puffs"), "splice", [_S.read(_v37, "i"), 1])
			_v34 = _S.iteration(_v34)
			_S.write(_v34, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v35, "f"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v35, "f"), "vx"), 2.5), _S.read(_v35, "dt")), "-=", false)
		_S.set_prop(_S.read(_v35, "f"), "vy", _S.binary("*", _S.binary("-", 160, _S.binary("*", _S.prop(_S.read(_v35, "f"), "vy"), 2.5)), _S.read(_v35, "dt")), "+=", false)
		_S.set_prop(_S.read(_v35, "f"), "x", _S.binary("*", _S.prop(_S.read(_v35, "f"), "vx"), _S.read(_v35, "dt")), "+=", false)
		_S.set_prop(_S.read(_v35, "f"), "y", _S.invoke(_S.read(_v35, "Math"), "min", [_S.binary("+", _S.prop(_S.read(_v35, "f"), "y"), _S.binary("*", _S.prop(_S.read(_v35, "f"), "vy"), _S.read(_v35, "dt"))), _S.unary("-", 1)]), "=", false)
		_v34 = _S.iteration(_v34)
		_S.write(_v34, "i", 1, "-=", true)
	var _v38 = _S.scope(_e)
	_S.define(_v38, "i", _S.binary("-", _S.prop(_S.read(_v38, "plinks"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v38, "i"), 0)):
		if _S.truth(_S.binary(">", _S.set_prop(_S.prop(_S.read(_v38, "plinks"), _S.read(_v38, "i")), "age", _S.read(_v38, "dt"), "+=", false), 0.12)):
			_S.invoke(_S.read(_v38, "plinks"), "splice", [_S.read(_v38, "i"), 1])
		_v38 = _S.iteration(_v38)
		_S.write(_v38, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "drops"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "rings"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "mist"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_meta = _S.read(_parent,"meta")
	var _n_sea = _S.read(_parent,"sea")
	var _n_rings = _S.read(_parent,"rings")
	var _n_C = _S.read(_parent,"C")
	var _n_drops = _S.read(_parent,"drops")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_fade_b1 = (_S.MathFX.smooth(0,0.25,_n_t) * (1 - _S.MathFX.smooth((_S.named_value(_n_meta,"duration") - 0.7),(_S.named_value(_n_meta,"duration") - 0.1),_n_t)))
	_S.call_value(_n_sea,[_n_p_b0, _n_fade_b1])
	_S.invoke(_n_rings,"draw",[_n_p_b0, _n_C, (-1)])
	_S.invoke(_n_drops,"draw",[_n_p_b0, _n_C, "back"])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_meta = _S.read(_parent,"meta")
	var _n_body = _S.read(_parent,"body")
	var _n_curl = _S.read(_parent,"curl")
	var _n_rings = _S.read(_parent,"rings")
	var _n_C = _S.read(_parent,"C")
	var _n_crashed = _S.read(_parent,"crashed")
	var _n_CRASH = _S.read(_parent,"CRASH")
	var _n_crestX = _S.read(_parent,"crestX")
	var _n_S = _S.read(_parent,"S")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ease = _S.read(_parent,"ease")
	var _n_billow = _S.read(_parent,"billow")
	var _n_puffs = _S.read(_parent,"puffs")
	var _n_plinks = _S.read(_parent,"plinks")
	var _n_drops = _S.read(_parent,"drops")
	var _n_lip = _S.read(_parent,"lip")
	var _n_ps = _S.read(_parent,"ps")
	var _n_mist = _S.read(_parent,"mist")
	var _n_lights = _S.read(_parent,"lights")
	var _n_crestH = _S.read(_parent,"crestH")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_fade_b1 = (_S.MathFX.smooth(0,0.25,_n_t) * (1 - _S.MathFX.smooth((_S.named_value(_n_meta,"duration") - 0.7),(_S.named_value(_n_meta,"duration") - 0.1),_n_t)))
	_S.call_value(_n_body,[_n_p_b0, _n_fade_b1])
	_S.call_value(_n_curl,[_n_p_b0])
	_S.invoke(_n_rings,"draw",[_n_p_b0, _n_C, 1])
	if _S.truth(_n_crashed):
		var _n_k_b3 = (1 - _S.MathFX.smooth((_n_CRASH + 0.4),(_S.named_value(_n_meta,"duration") - 0.15),_n_t))
		var _n_x0_b4 = (-20)
		var _n_x1_b5 = (_S.call_value(_n_crestX,[_n_t]) + 10)
		if true:
			var _n_X_b6 = floori(_n_x0_b4)
			while _S.truth((_n_X_b6 < _n_x1_b5)):
				var _n_x_b7 = (_n_X_b6 + 0.5)
				var _n_n_b8 = (1 - (absf(_S.NoiseKernels.noise2((_n_x_b7 * 0.35),(_n_t * 0.8),(_n_S + 7))) * 4))
				if _S.truth((_n_n_b8 > (1.15 - (_n_k_b3 * 1.1)))):
					_S.invoke(_n_p_b0,"px",[_n_X_b6, 0, (_n_WHITE if _S.truth((_n_n_b8 > (1.4 - _n_k_b3))) else _S.index_value(_n_C,6))])
				if _S.truth((_n_n_b8 > (1.4 - (_n_k_b3 * 0.9)))):
					_S.invoke(_n_p_b0,"px",[_n_X_b6, 1, _S.index_value(_n_C,5)])
				_n_X_b6 += 1.0
	for _iter_0 in _S.array(_n_puffs):
		var _n_f_b9 = _iter_0
		if _S.truth((_S.named_value(_n_f_b9,"delay") > 0)):
			continue
		var _n_g_b10 = (1 - (float(_S.named_value(_n_f_b9,"life"))/_S.named_value(_n_f_b9,"max")))
		var _n_r_b11 = ((_S.named_value(_n_f_b9,"r0") + ((_S.named_value(_n_f_b9,"r1") - _S.named_value(_n_f_b9,"r0")) * _S.invoke(_n_ease,"outCubic",[_n_g_b10]))) * (1 - _S.MathFX.smooth(0.7,1,_n_g_b10)))
		if _S.truth((_n_r_b11 > 0.6)):
			_S.call_value(_n_billow,[_n_p_b0, _S.named_value(_n_f_b9,"x"), _S.named_value(_n_f_b9,"y"), _n_r_b11, _n_C])
	for _iter_1 in _S.array(_n_plinks):
		var _n_q_b12 = _iter_1
		if _S.truth((_S.named_value(_n_q_b12,"age") < 0.06)):
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b12,"x"), _S.named_value(_n_q_b12,"y"), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_q_b12,"x"), _S.named_value(_n_q_b12,"y"), 4, _S.index_value(_n_C,5), (0.25 * (1 - (float(_S.named_value(_n_q_b12,"age"))/0.12)))])
	_S.invoke(_n_drops,"draw",[_n_p_b0, _n_C, "front"])
	var _n_f_b2 = (float((_n_t - _n_CRASH))/0.08)
	if _S.truth(((_n_f_b2 < 1) if _S.truth((_n_f_b2 >= 0)) else (_n_f_b2 >= 0))):
		var _tuple_2 = _S.call_value(_n_lip,[1, (_n_CRASH - 0.001)])
		var _n_X0_b13 = _S.prop(_tuple_2,0)
		_S.invoke(_n_p_b0,"circle",[_n_X0_b13, (-3), (8 * (1 - (_n_f_b2 * 0.4))), _n_WHITE])
		_S.invoke(_n_p_b0,"ellipse",[_n_X0_b13, 0, 14, 2.6, _S.function_value(_S.capture(_parent,{"this":_this}),"_f11")])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_mist,"draw",[_n_p_b0, _S.index_value(_n_C,5)])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	if _S.truth((_n_t < _n_CRASH)):
		_S.invoke(_n_p_b0,"glow",[(_S.call_value(_n_crestX,[_n_t]) + 4), ((-_S.call_value(_n_crestH,[_n_t])) + 2), 26, _S.index_value(_n_C,4), (0.22 * _S.MathFX.smooth(0.2,_n_CRASH,_n_t))])
		_S.invoke(_n_p_b0,"glowLine",[(_S.call_value(_n_crestX,[_n_t]) - 26), ((-_S.call_value(_n_crestH,[_n_t])) * 0.45), _S.call_value(_n_crestX,[_n_t]), (-_S.call_value(_n_crestH,[_n_t])), 10, _S.index_value(_n_C,5), (0.14 * _S.MathFX.smooth(0.2,_n_CRASH,_n_t))])
	else:
		_S.invoke(_n_p_b0,"glow",[_S.call_value(_n_crestX,[_n_t]), (-10), 34, _S.index_value(_n_C,4), (0.26 * (1 - _S.MathFX.smooth(_n_CRASH,(_S.named_value(_n_meta,"duration") - 0.3),_n_t)))])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_d_b0 < 0.6)) else _S.index_value(_n_C,6))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_CRASH = _S.read(_parent,"CRASH")
	var _n_t_b0 = _S.arg(_args,0)
	return (((-80) + (72 * _S.invoke(_n_ease,"inOutSine",[(float(_n_t_b0)/_n_CRASH)]))) if _S.truth((_n_t_b0 < _n_CRASH)) else ((-8) + (30 * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t_b0 - _n_CRASH))/1.4),0.0,1.0)]))))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_CRASH = _S.read(_parent,"CRASH")
	var _n_t_b0 = _S.arg(_args,0)
	return ((5 + (33 * _S.invoke(_n_ease,"inOutSine",[clampf((float(_n_t_b0)/(_n_CRASH * 0.92)),0.0,1.0)]))) if _S.truth((_n_t_b0 < _n_CRASH)) else ((38 * (1 - _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t_b0 - _n_CRASH))/0.45),0.0,1.0)]))) + (5 * (1 - _S.MathFX.smooth(_n_CRASH,(_n_CRASH + 1.6),_n_t_b0)))))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_CRASH = _S.read(_parent,"CRASH")
	var _n_t_b0 = _S.arg(_args,0)
	return ((24 - (16 * _S.MathFX.smooth(0.3,_n_CRASH,_n_t_b0))) if _S.truth((_n_t_b0 < _n_CRASH)) else (8 + (14 * _S.MathFX.smooth(_n_CRASH,(_n_CRASH + 0.6),_n_t_b0))))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_LIP0 = _S.read(_parent,"LIP0")
	var _n_CRASH = _S.read(_parent,"CRASH")
	var _n_t_b0 = _S.arg(_args,0)
	return clampf((float((_n_t_b0 - _n_LIP0))/(_n_CRASH - _n_LIP0)),0.0,1.0)
	return null
