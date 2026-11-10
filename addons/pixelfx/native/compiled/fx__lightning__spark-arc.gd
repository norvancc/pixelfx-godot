@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/spark-arc.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "bowed", _S.import_value("fx/lightning/_lib.js", "bowed"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "flight", _S.import_value("fx/lightning/_lib.js", "flight"))
	_S.define(_e, "spark", _S.import_value("fx/lightning/_lib.js", "spark"))
	_S.define(_e, "puff", _S.import_value("fx/lightning/_lib.js", "puff"))
	_S.define(_e, "heat", _S.import_value("fx/lightning/_lib.js", "heat"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Spark arc"}, {"desc": "A climbing arc between two rods: it strikes white at their narrow foot, climbs on rising heat as it stretches and bows, sputters and snaps at the top, then strikes again."}, {"tags": ["lightning", "electric", "arc", "jacobs-ladder", "machine", "prop", "loop"]}, {"size": [124, 120]}, {"origin": [62, 108]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FPS", 30)
	_S.define(_e, "N", 60)
	_S.define(_e, "P", 2)
	_S.define(_e, "SNAP", 1.42)
	_S.define(_e, "H", 58)
	_S.define(_e, "STEEL", _S.invoke(["#151823", "#262c3b", "#3d4558", "#5f6a82", "#8f9bb2", "#d2daea"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "CERAMIC", _S.invoke(["#4b4458", "#857d96", "#c9c1d6", "#efe9f6"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "ASH", _S.call_value(_S.read(_e, "hex"), ["#6a6478"]))
	_S.define(_e, "rodAt", _S.function_value(_e, "_f5"))
	_S.define(_e, "height", _S.function_value(_e, "_f6"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_FPS = _S.read(_parent,"FPS")
	var _n_N = _S.read(_parent,"N")
	var _n_SNAP = _S.read(_parent,"SNAP")
	var _n_height = _S.read(_parent,"height")
	var _n_STEEL = _S.read(_parent,"STEEL")
	var _n_CERAMIC = _S.read(_parent,"CERAMIC")
	var _n_rodAt = _S.read(_parent,"rodAt")
	var _n_H = _S.read(_parent,"H")
	var _n_P = _S.read(_parent,"P")
	var _n_heat = _S.read(_parent,"heat")
	var _n_bowed = _S.read(_parent,"bowed")
	var _n_stroke = _S.read(_parent,"stroke")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_zigzag = _S.read(_parent,"zigzag")
	var _n_crackle = _S.read(_parent,"crackle")
	var _n_ASH = _S.read(_parent,"ASH")
	var _n_puff = _S.read(_parent,"puff")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_S_b4 = _S.invoke(_S.named_value(_n_o_b2,"sparks"),"map",[_n_hex])
	var _n_f_b5 = fmod(floori(((_n_t_b1 * _n_FPS) + 0.000001)),_n_N)
	var _n_r_b6 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),1,_n_f_b5])
	var _n_climbing_b7 = (_n_t_b1 < _n_SNAP)
	var _n_h_b8 = _S.call_value(_n_height,[_n_t_b1])
	var _n_u_b9 = clampf((float(_n_t_b1)/_n_SNAP),0.0,1.0)
	var _n_a_b10 = (_n_t_b1 - _n_SNAP)
	_S.invoke(_n_p_b0,"glow",[0, (-14), 50, _S.index_value(_n_C_b3,3), ((0.2 + (0.15 * (1 - _n_u_b9))) if _S.truth(_n_climbing_b7) else 0.06)])
	_S.invoke(_n_p_b0,"rect",[(-18), (-3), 36, 3, _S.index_value(_n_STEEL,1)])
	_S.invoke(_n_p_b0,"line",[(-18), (-3), 17, (-3), _S.index_value(_n_STEEL,3)])
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b12 = _iter_0
		if true:
			var _n_y_b13 = (-9)
			while _S.truth((_n_y_b13 < (-3))):
				var _n_rib_b14 = _S.binary("===",_S.binary("&",_n_y_b13,1),0)
				if true:
					var _n_x_b15 = 2
					while _S.truth((_n_x_b15 <= 6)):
						_S.invoke(_n_p_b0,"px",[((_n_s_b12 * _n_x_b15) - (1 if _S.truth((_n_s_b12 < 0)) else 0)), _n_y_b13, (_S.index_value(_n_CERAMIC,(3 if _S.truth((_n_x_b15 < 4)) else (2 if _S.truth((_n_x_b15 < 6)) else 1))) if _S.truth(_n_rib_b14) else _S.index_value(_n_CERAMIC,(1 if _S.truth((_n_x_b15 < 5)) else 0)))])
						_n_x_b15 += 1.0
				_n_y_b13 += 1.0
	for _iter_1 in _S.array([(-1), 1]):
		var _n_s_b16 = _iter_1
		if true:
			var _n_hh_b19 = 0
			while _S.truth((_n_hh_b19 <= 60)):
				var _tuple_2 = _S.call_value(_n_rodAt,[_n_s_b16, _n_hh_b19])
				var _n_x_b20 = _S.prop(_tuple_2,0)
				var _n_y_b21 = _S.prop(_tuple_2,1)
				var _n_tp_b22 = (_n_SNAP * pow(clampf((float((_n_hh_b19 - 1.5))/_n_H),0.0,1.0),(float(1)/1.35)))
				var _n_age_b23 = ((_n_t_b1 - _n_tp_b22) if _S.truth((_n_t_b1 >= _n_tp_b22)) else ((_n_t_b1 - _n_tp_b22) + _n_P))
				var _n_hot_b24 = (0 if _S.truth((_n_hh_b19 > (_n_H + 2))) else exp((float((-_n_age_b23))/0.26)))
				var _n_c_b25 = _S.call_value(_n_heat,[((_n_hot_b24 * 1.05) - 0.12)])
				_S.invoke(_n_p_b0,"px",[_n_x_b20, _n_y_b21, (_n_c_b25 if _S.truth(_n_c_b25) else (_S.index_value(_n_STEEL,4) if _S.truth((_n_s_b16 < 0)) else _S.index_value(_n_STEEL,3)))])
				_S.invoke(_n_p_b0,"px",[(_n_x_b20 + _n_s_b16), _n_y_b21, (_S.logical("||",_S.call_value(_n_heat,[(_n_hot_b24 * 0.6)]),func():return _S.index_value(_n_STEEL,2)) if _S.truth(((_n_hot_b24 > 0.35) if _S.truth(_n_c_b25) else _n_c_b25)) else (_S.index_value(_n_STEEL,2) if _S.truth((_n_s_b16 < 0)) else _S.index_value(_n_STEEL,1)))])
				if _S.truth((_S.binary("===",_S.binary("&",floori((_n_hh_b19 * 2)+0.5),3),0) if _S.truth((_n_hot_b24 > 0.3)) else (_n_hot_b24 > 0.3))):
					_S.invoke(_n_p_b0,"glow",[_n_x_b20, _n_y_b21, 5, (_n_c_b25 if _S.truth(_n_c_b25) else _S.index_value(_n_C_b3,4)), (0.25 * _n_hot_b24)])
				_n_hh_b19 += 0.5
		var _tuple_3 = _S.call_value(_n_rodAt,[_n_s_b16, 60])
		var _n_tx_b17 = _S.prop(_tuple_3,0)
		var _n_ty_b18 = _S.prop(_tuple_3,1)
		_S.invoke(_n_p_b0,"circle",[(_n_tx_b17 + (_n_s_b16 * 0.5)), _n_ty_b18, 1.6, _S.index_value(_n_STEEL,4)])
		_S.invoke(_n_p_b0,"px",[((_n_tx_b17 + (_n_s_b16 * 0.5)) - 0.5), (_n_ty_b18 - 1), _S.index_value(_n_STEEL,5)])
	if _S.truth(_n_climbing_b7):
		var _tuple_4 = _S.call_value(_n_rodAt,[(-1), _n_h_b8])
		var _n_xl_b26 = _S.prop(_tuple_4,0)
		var _n_yl_b27 = _S.prop(_tuple_4,1)
		var _tuple_5 = _S.call_value(_n_rodAt,[1, _n_h_b8])
		var _n_xr_b28 = _S.prop(_tuple_5,0)
		var _n_yr_b29 = _S.prop(_tuple_5,1)
		var _n_k0_b30 = (1 if _S.truth((_n_t_b1 < (float(1)/_n_FPS))) else (1 - (0.22 * _n_u_b9)))
		var _n_sput_b31 = (0.4 if _S.truth(((_S.invoke(_n_r_b6,"next",[]) < 0.25) if _S.truth((_n_u_b9 > 0.88)) else (_n_u_b9 > 0.88))) else 1)
		var _n_k_b32 = ((_n_k0_b30 * _n_sput_b31) * (0.82 + (0.18 * _S.invoke(_n_r_b6,"next",[]))))
		var _n_bow_b33 = ((-(1.5 + ((13 * _n_u_b9) * _n_u_b9))) * (0.8 + (0.4 * _S.invoke(_n_r_b6,"next",[]))))
		_S.call_value(_n_stroke,[_n_p_b0, _S.call_value(_n_bowed,[_n_r_b6, _n_xl_b26, _n_yl_b27, _n_xr_b28, _n_yr_b29, _n_bow_b33, (0.18 + (0.12 * _n_u_b9)), (0.12 + (0.25 * _n_u_b9))]), _n_k_b32, _n_C_b3, (0.95 if _S.truth((_n_t_b1 < (float(1)/_n_FPS))) else 0.8), {"hero":(_n_t_b1 < (float(1)/_n_FPS)),"light":0.7}])
		_S.invoke(_n_p_b0,"glowLine",[_n_xl_b26, (_n_yl_b27 + (_n_bow_b33 * 0.5)), _n_xr_b28, (_n_yr_b29 + (_n_bow_b33 * 0.5)), 12, _S.index_value(_n_C_b3,4), (0.22 * _n_k_b32)])
		for _iter_6 in _S.array([[_n_xl_b26, _n_yl_b27], [_n_xr_b28, _n_yr_b29]]):
			var _tuple_7 = _iter_6
			var _n_x_b34 = _S.prop(_tuple_7,0)
			var _n_y_b35 = _S.prop(_tuple_7,1)
			_S.invoke(_n_p_b0,"circle",[_n_x_b34, _n_y_b35, (1.8 + (0.6 * _n_k_b32)), _S.index_value(_n_C_b3,5)])
			_S.invoke(_n_p_b0,"px",[_n_x_b34, _n_y_b35, _n_WHITE])
			_S.invoke(_n_p_b0,"glow",[_n_x_b34, _n_y_b35, 12, _S.index_value(_n_C_b3,5), (0.55 * _n_k_b32)])
		if _S.truth((_n_t_b1 < 0.1)):
			_S.invoke(_n_p_b0,"glow",[0, (-11), 26, _S.index_value(_n_C_b3,6), (0.45 * (1 - (float(_n_t_b1)/0.1)))])
	else:
		if _S.truth((_n_a_b10 < (float(2)/_n_FPS))):
			var _tuple_8 = _S.call_value(_n_rodAt,[(-1), (_n_H + 1.5)])
			var _n_xl_b36 = _S.prop(_tuple_8,0)
			var _n_yl_b37 = _S.prop(_tuple_8,1)
			var _tuple_9 = _S.call_value(_n_rodAt,[1, (_n_H + 1.5)])
			var _n_xr_b38 = _S.prop(_tuple_9,0)
			var _n_yr_b39 = _S.prop(_tuple_9,1)
			for _iter_10 in _S.array([[_n_xl_b36, _n_yl_b37, 1], [_n_xr_b38, _n_yr_b39, (-1)]]):
				var _tuple_11 = _iter_10
				var _n_x0_b40 = _S.prop(_tuple_11,0)
				var _n_y0_b41 = _S.prop(_tuple_11,1)
				var _n_s_b42 = _S.prop(_tuple_11,2)
				_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_n_r_b6, _n_x0_b40, _n_y0_b41, (_n_x0_b40 + (_n_s_b42 * _S.invoke(_n_r_b6,"range",[5, 9]))), (_n_y0_b41 - _S.invoke(_n_r_b6,"range",[2, 6])), 0.4, 0.3]), 0.7, _n_C_b3, 0.4])
			_S.invoke(_n_p_b0,"glow",[0, (_n_yl_b37 - 8), 30, _S.index_value(_n_C_b3,4), 0.5])
		else:
			if _S.truth((_n_t_b1 > (_n_P - 0.16))):
				if _S.truth((_S.invoke(_n_r_b6,"next",[]) < 0.7)):
					_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_n_r_b6, (-4.5), ((-10.5) - _S.invoke(_n_r_b6,"range",[0, 2])), 4.5, ((-10.5) - _S.invoke(_n_r_b6,"range",[0, 2])), 0.5, 0]), (0.4 + (0.3 * _S.invoke(_n_r_b6,"next",[]))), _n_C_b3, 0.35])
	if true:
		var _n_j_b43 = 0
		while _S.truth((_n_j_b43 < 3)):
			var _n_born_b44 = ((float((_n_j_b43 + 1))/3.2) * _n_SNAP)
			var _n_age_b45 = fmod((fmod((_n_t_b1 - _n_born_b44),_n_P) + _n_P),_n_P)
			var _n_life_b46 = 1
			if _S.truth((_n_age_b45 >= _n_life_b46)):
				_n_j_b43 += 1.0
				continue
			var _n_y0_b47 = (((-9) - _S.call_value(_n_height,[_n_born_b44])) - 6)
			_S.call_value(_n_puff,[_n_p_b0, ((3 if _S.truth(fmod(_n_j_b43,2)) else (-3)) + (sin(((_n_age_b45 * 3) + _n_j_b43)) * 2)), (_n_y0_b47 - (_n_age_b45 * 20)), (1.8 + (_n_j_b43 * 0.3)), (float(_n_age_b45)/_n_life_b46), _S.ColorFX.mix(_n_ASH,_S.index_value(_n_C_b3,5),0.3)])
			_n_j_b43 += 1.0
	var _n_burst_b11 = _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"o":_n_o_b2,"p":_n_p_b0,"S":_n_S_b4,"this":_this}),"_f1")
	_S.call_value(_n_burst_b11,[0, 12, 11, _S.function_value(_S.capture(_parent,{"this":_this}),"_f2")])
	_S.call_value(_n_burst_b11,[_n_SNAP, 14, 12, _S.function_value(_S.capture(_parent,{"this":_this}),"_f3")])
	for _iter_12 in _S.array([[0, 0.45], [1, 0.8], [2, 1.15]]):
		var _tuple_13 = _iter_12
		var _n_k_b48 = _S.prop(_tuple_13,0)
		var _n_tt_b49 = _S.prop(_tuple_13,1)
		_S.call_value(_n_burst_b11,[_n_tt_b49, 2, (20 + _n_k_b48), _S.function_value(_S.capture(_parent,{"tt":_n_tt_b49,"this":_this}),"_f4")])
	if _S.truth((_n_climbing_b7 if _S.truth(_n_climbing_b7) else (_n_a_b10 < 0.25))):
		_S.invoke(_n_p_b0,"glow",[0, (((-9) - _n_h_b8) - 3), 26, _S.index_value(_n_C_b3,4), (0.25 if _S.truth(_n_climbing_b7) else (0.4 * (1 - (float(_n_a_b10)/0.25))))])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_P = _S.read(_parent,"P")
	var _n_o = _S.read(_parent,"o")
	var _n_flight = _S.read(_parent,"flight")
	var _n_p = _S.read(_parent,"p")
	var _n_S = _S.read(_parent,"S")
	var _n_spark = _S.read(_parent,"spark")
	var _n_t0_b0 = _S.arg(_args,0)
	var _n_n_b1 = _S.arg(_args,1)
	var _n_salt_b2 = _S.arg(_args,2)
	var _n_from_b3 = _S.arg(_args,3)
	var _n_age_b4 = fmod((fmod((_n_t - _n_t0_b0),_n_P) + _n_P),_n_P)
	if true:
		var _n_j_b5 = 0
		while _S.truth((_n_j_b5 < _n_n_b1)):
			var _n_q_b6 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),_n_salt_b2,_n_j_b5])
			var _n_life_b7 = _S.invoke(_n_q_b6,"range",[0.25, 0.6])
			if _S.truth((_n_age_b4 >= _n_life_b7)):
				_n_j_b5 += 1.0
				continue
			var _tuple_0 = _S.call_value(_n_from_b3,[_n_q_b6, _n_j_b5])
			var _n_x0_b8 = _S.prop(_tuple_0,0)
			var _n_y0_b9 = _S.prop(_tuple_0,1)
			var _n_a0_b10 = _S.prop(_tuple_0,2)
			var _n_spread_b11 = _S.prop(_tuple_0,3)
			var _n_sp0_b12 = _S.prop(_tuple_0,4)
			var _n_sp1_b13 = _S.prop(_tuple_0,5)
			var _n_ang_b14 = (_n_a0_b10 + _S.invoke(_n_q_b6,"range",[(-_n_spread_b11), _n_spread_b11]))
			var _n_sp_b15 = _S.invoke(_n_q_b6,"range",[_n_sp0_b12, _n_sp1_b13])
			var _tuple_1 = _S.call_value(_n_flight,[_n_x0_b8, _n_y0_b9, (cos(_n_ang_b14) * _n_sp_b15), (sin(_n_ang_b14) * _n_sp_b15), _n_age_b4, {"floor":0}])
			var _n_x_b16 = _S.prop(_tuple_1,0)
			var _n_y_b17 = _S.prop(_tuple_1,1)
			var _n_vx_b18 = _S.prop(_tuple_1,2)
			var _n_vy_b19 = _S.prop(_tuple_1,3)
			_S.call_value(_n_spark,[_n_p, _n_x_b16, _n_y_b17, _n_vx_b18, _n_vy_b19, (1 - (float(_n_age_b4)/_n_life_b7)), _n_S])
			_n_j_b5 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_rodAt = _S.read(_parent,"rodAt")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return _S.concat([_S.array(_S.call_value(_n_rodAt,[(1 if _S.truth(fmod(_n_j_b1,2)) else (-1)), 1.5])),[((float((-PI))/2) + (0.6 if _S.truth(fmod(_n_j_b1,2)) else (-0.6)))],[1],[60],[170]])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_rodAt = _S.read(_parent,"rodAt")
	var _n_H = _S.read(_parent,"H")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return [(_S.index_value(_S.call_value(_n_rodAt,[1, _n_H]),0) * _S.invoke(_n_q_b0,"range",[(-0.8), 0.8])), (((-9) - _n_H) - 6), (float((-PI))/2), 1.3, 50, 160]
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_rodAt = _S.read(_parent,"rodAt")
	var _n_height = _S.read(_parent,"height")
	var _n_tt = _S.read(_parent,"tt")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return _S.concat([_S.array(_S.call_value(_n_rodAt,[(1 if _S.truth(fmod(_n_j_b1,2)) else (-1)), _S.call_value(_n_height,[_n_tt])])),[(float(PI)/2)],[0.5],[5],[30]])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	var _n_h_b1 = _S.arg(_args,1)
	return [(_n_s_b0 * (4.5 + ((float(_n_h_b1)/60) * 19.5))), ((-9) - _n_h_b1)]
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_SNAP = _S.read(_parent,"SNAP")
	var _n_t_b0 = _S.arg(_args,0)
	return (1.5 + (_n_H * pow(clampf((float(_n_t_b0)/_n_SNAP),0.0,1.0),1.35)))
	return null
