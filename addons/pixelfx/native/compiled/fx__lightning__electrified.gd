@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/electrified.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "flight", _S.import_value("fx/lightning/_lib.js", "flight"))
	_S.define(_e, "spark", _S.import_value("fx/lightning/_lib.js", "spark"))
	_S.define(_e, "edgeOf", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Electrified"}, {"desc": "Current runs through a character: arcs crawl over and leap across the body, sparks spit off, the body flares to an electric silhouette on each jolt, and the feet ground out."}, {"tags": ["lightning", "electric", "status", "shock", "stun", "actor", "loop"]}, {"size": [108, 92]}, {"origin": [54, 76]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "TENSE", _S.merge([{"turn": 0.9}, {"crouch": 3}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 17)}, {"bx": 9}, {"by": _S.unary("-", 17)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "JOLT_A", _S.merge([{"turn": 1.1}, {"crouch": 0}, {"y": _S.unary("-", 1)}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 36)}, {"bx": 13}, {"by": _S.unary("-", 17)}, {"ffx": _S.unary("-", 4)}, {"fbx": 5}]))
	_S.define(_e, "JOLT_B", _S.merge([{"turn": 0.7}, {"crouch": 1}, {"y": _S.unary("-", 1)}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 16)}, {"bx": 13}, {"by": _S.unary("-", 36)}, {"ffx": _S.unary("-", 4)}, {"fbx": 5}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "TENSE")], [0.1, _S.read(_e, "JOLT_A"), "snap"], [0.17, _S.read(_e, "JOLT_B"), "snap"], [0.3, _S.read(_e, "TENSE"), "snap"], [0.733, _S.read(_e, "TENSE")], [0.733, _S.read(_e, "JOLT_B"), "snap"], [0.8, _S.read(_e, "JOLT_A"), "snap"], [0.93, _S.read(_e, "TENSE"), "snap"], [1.367, _S.read(_e, "TENSE")], [1.367, _S.read(_e, "JOLT_A"), "snap"], [1.45, _S.read(_e, "JOLT_B"), "snap"], [1.58, _S.read(_e, "TENSE"), "snap"], [2, _S.read(_e, "TENSE")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "FPS", 30)
	_S.define(_e, "N", 60)
	_S.define(_e, "P", 2)
	_S.define(_e, "JOLTS", [[3, 1], [22, 0.7], [41, 0.9]])
	_S.define(_e, "edges", _S.construct(_S.read(_e, "WeakMap"), []))
	_S.define(_e, "jolt", _S.function_value(_e, "_f6"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_edges = _S.read(_parent,"edges")
	var _n_A_b0 = _S.arg(_args,0)
	var _n_e_b1 = _S.invoke(_n_edges,"get",[_S.named_value(_n_A_b0,"mask")])
	if _S.truth(_n_e_b1):
		return _n_e_b1
	var _n_m_b2 = _S.named_value(_n_A_b0,"mask")
	var _n_on_b3 = _S.function_value(_S.capture(_parent,{"m":_n_m_b2,"this":_this}),"_f1")
	_n_e_b1 = []
	if true:
		var _n_y_b4 = 0
		while _S.truth((_n_y_b4 < _S.named_value(_n_m_b2,"h"))):
			if true:
				var _n_x_b5 = 0
				while _S.truth((_n_x_b5 < _S.named_value(_n_m_b2,"w"))):
					if _S.truth(_S.logical("&&",_S.call_value(_n_on_b3,[_n_x_b5, _n_y_b4]),func():return _S.logical("||",_S.logical("||",_S.logical("||",not _S.truth(_S.call_value(_n_on_b3,[(_n_x_b5 - 1), _n_y_b4])),func():return not _S.truth(_S.call_value(_n_on_b3,[(_n_x_b5 + 1), _n_y_b4]))),func():return not _S.truth(_S.call_value(_n_on_b3,[_n_x_b5, (_n_y_b4 - 1)]))),func():return not _S.truth(_S.call_value(_n_on_b3,[_n_x_b5, (_n_y_b4 + 1)]))))):
						_S.invoke(_n_e_b1,"push",[[((_S.named_value(_n_A_b0,"x") + _n_x_b5) + 0.5), ((_S.named_value(_n_A_b0,"y") + _n_y_b4) + 0.5)]])
					_n_x_b5 += 1.0
			_n_y_b4 += 1.0
	_S.invoke(_n_edges,"set",[_S.named_value(_n_A_b0,"mask"), _n_e_b1])
	return _n_e_b1
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_m = _S.read(_parent,"m")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_S.index_value(_S.named_value(_n_m,"data"),((_n_y_b1 * _S.named_value(_n_m,"w")) + _n_x_b0)) if _S.truth(((_n_y_b1 < _S.named_value(_n_m,"h")) if _S.truth(((_n_x_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))))) else ((_n_y_b1 < _S.named_value(_n_m,"h")) if _S.truth(((_n_x_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_FPS = _S.read(_parent,"FPS")
	var _n_N = _S.read(_parent,"N")
	var _n_jolt = _S.read(_parent,"jolt")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_A_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_f_b5 = fmod(floori(((_n_t_b1 * _n_FPS) + 0.000001)),_n_N)
	var _n_j_b6 = _S.call_value(_n_jolt,[_n_f_b5])
	var _n_r_b7 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),4,_n_f_b5])
	_S.invoke(_n_p_b0,"outline",[_S.named_value(_n_A_b4,"mask"), _S.named_value(_n_A_b4,"x"), _S.named_value(_n_A_b4,"y"), (_S.index_value(_n_C_b3,4) if _S.truth(_n_j_b6) else (_S.index_value(_n_C_b3,2) if _S.truth((_S.invoke(_n_r_b7,"next",[]) < 0.5)) else _S.index_value(_n_C_b3,1)))])
	_S.invoke(_n_p_b0,"glow",[0, (-18), 30, _S.index_value(_n_C_b3,3), ((0.55 * _S.named_value(_n_j_b6,"k")) if _S.truth(_n_j_b6) else (0.16 + (0.1 * _S.invoke(_n_r_b7,"next",[]))))])
	_S.invoke(_n_p_b0,"glow",[0, (-2), 22, _S.index_value(_n_C_b3,4), 0.18])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_edgeOf = _S.read(_parent,"edgeOf")
	var _n_FPS = _S.read(_parent,"FPS")
	var _n_N = _S.read(_parent,"N")
	var _n_jolt = _S.read(_parent,"jolt")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_zigzag = _S.read(_parent,"zigzag")
	var _n_crackle = _S.read(_parent,"crackle")
	var _n_P = _S.read(_parent,"P")
	var _n_flight = _S.read(_parent,"flight")
	var _n_spark = _S.read(_parent,"spark")
	var _n_JOLTS = _S.read(_parent,"JOLTS")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_S_b4 = _S.invoke(_S.named_value(_n_o_b2,"sparks"),"map",[_n_hex])
	var _n_A_b5 = _S.named_value(_n_o_b2,"actor")
	var _n_E_b6 = _S.call_value(_n_edgeOf,[_n_A_b5])
	var _n_f_b7 = fmod(floori(((_n_t_b1 * _n_FPS) + 0.000001)),_n_N)
	var _n_j_b8 = _S.call_value(_n_jolt,[_n_f_b7])
	if _S.truth(_n_j_b8):
		var _n_lift_b11 = (_S.index_value([1.1, 0.6, (-0.2)],_S.named_value(_n_j_b8,"a")) * _S.named_value(_n_j_b8,"k"))
		var _n_ramp_b12 = [_S.index_value(_n_C_b3,1), _S.index_value(_n_C_b3,2), _S.index_value(_n_C_b3,3), _S.index_value(_n_C_b3,4), _S.index_value(_n_C_b3,5), _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,7)]
		if true:
			var _n_y_b13 = 0
			while _S.truth((_n_y_b13 < _S.named_value(_n_A_b5,"h"))):
				if true:
					var _n_x_b14 = 0
					while _S.truth((_n_x_b14 < _S.named_value(_n_A_b5,"w"))):
						var _n_c_b15 = _S.index_value(_S.named_value(_n_A_b5,"pixels"),((_n_y_b13 * _S.named_value(_n_A_b5,"w")) + _n_x_b14))
						if _S.truth(_n_c_b15):
							_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_A_b5,"x") + _n_x_b14), (_S.named_value(_n_A_b5,"y") + _n_y_b13), _S.index_value(_n_ramp_b12,clampf(floori(((0.4 + (_S.ColorFX.luma(_n_c_b15) * 6)) + _n_lift_b11)+0.5),0,6))])
						_n_x_b14 += 1.0
				_n_y_b13 += 1.0
		_S.invoke(_n_p_b0,"glow",[0, (-19), 26, _S.index_value(_n_C_b3,5), ((0.5 * _S.named_value(_n_j_b8,"k")) * (1 - (float(_S.named_value(_n_j_b8,"a"))/3)))])
	var _n_r_b9 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),7,_S.binary(">>",_n_f_b7,1)])
	var _n_n_b10 = (2 + (2 if _S.truth(_n_j_b8) else _S.invoke(_n_r_b9,"int",[0, 1])))
	if true:
		var _n_i_b16 = 0
		while _S.truth((_n_i_b16 < _n_n_b10)):
			var _n_a_b17 = _S.invoke(_n_r_b9,"pick",[_n_E_b6])
			var _n_ang_b18 = _S.invoke(_n_r_b9,"range",[0, _n_TAU])
			var _n_d_b19 = _S.invoke(_n_r_b9,"range",[6, 14])
			var _n_b_b20 = [(_S.index_value(_n_a_b17,0) + (cos(_n_ang_b18) * _n_d_b19)), (_S.index_value(_n_a_b17,1) + (sin(_n_ang_b18) * _n_d_b19))]
			if true:
				var _n_k_b22 = 0
				while _S.truth((_n_k_b22 < 10)):
					var _n_c_b23 = _S.invoke(_n_r_b9,"pick",[_n_E_b6])
					if _S.truth(_S.logical("&&",(_S.Bridge.hypot([(_S.index_value(_n_c_b23,0) - _S.index_value(_n_b_b20,0)), (_S.index_value(_n_c_b23,1) - _S.index_value(_n_b_b20,1))]) < 5),func():return (_S.Bridge.hypot([(_S.index_value(_n_c_b23,0) - _S.index_value(_n_a_b17,0)), (_S.index_value(_n_c_b23,1) - _S.index_value(_n_a_b17,1))]) > 4))):
						_n_b_b20 = _n_c_b23
					_n_k_b22 += 1.0
			var _n_k_b21 = ((0.75 if _S.truth(_S.binary("&",_n_f_b7,1)) else 0.95) * _S.invoke(_n_r_b9,"range",[0.6, 1]))
			_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),8,_n_f_b7,_n_i_b16]), _S.index_value(_n_a_b17,0), _S.index_value(_n_a_b17,1), _S.index_value(_n_b_b20,0), _S.index_value(_n_b_b20,1), 0.42, 0.35]), _n_k_b21, _n_C_b3, 0.4])
			for _iter_0 in _S.array(_n_E_b6):
				var _tuple_1 = _iter_0
				var _n_x_b24 = _S.prop(_tuple_1,0)
				var _n_y_b25 = _S.prop(_tuple_1,1)
				if _S.truth(_S.logical("||",(_S.Bridge.hypot([(_n_x_b24 - _S.index_value(_n_a_b17,0)), (_n_y_b25 - _S.index_value(_n_a_b17,1))]) < 3.5),func():return (_S.Bridge.hypot([(_n_x_b24 - _S.index_value(_n_b_b20,0)), (_n_y_b25 - _S.index_value(_n_b_b20,1))]) < 3))):
					_S.invoke(_n_p_b0,"px",[(_n_x_b24 - 0.5), (_n_y_b25 - 0.5), _S.index_value(_n_C_b3,5)])
			_n_i_b16 += 1.0
	if _S.truth((_S.invoke(_n_r_b9,"next",[]) < (0.9 if _S.truth(_n_j_b8) else 0.35))):
		var _n_s_b26 = _S.invoke(_n_r_b9,"sign",[])
		var _n_x0_b27 = (_n_s_b26 * _S.invoke(_n_r_b9,"range",[3, 8]))
		_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),9,_n_f_b7]), _n_x0_b27, (-1.5), (_n_x0_b27 + (_n_s_b26 * _S.invoke(_n_r_b9,"range",[5, 12]))), (-0.5), 0.45, 0.3]), 0.7, _n_C_b3, 0.35])
		_S.invoke(_n_p_b0,"glow",[_n_x0_b27, (-1), 10, _S.index_value(_n_C_b3,5), 0.35])
	for _iter_2 in _S.array(_n_JOLTS):
		var _tuple_3 = _iter_2
		var _n_f0_b28 = _S.prop(_tuple_3,0)
		var _n_k_b29 = _S.prop(_tuple_3,1)
		var _n_age_b30 = fmod((fmod((_n_t_b1 - (float(_n_f0_b28)/_n_FPS)),_n_P) + _n_P),_n_P)
		if true:
			var _n_i_b31 = 0
			while _S.truth((_n_i_b31 < 9)):
				var _n_q_b32 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),21,_n_f0_b28,_n_i_b31])
				var _n_life_b33 = _S.invoke(_n_q_b32,"range",[0.18, 0.4])
				if _S.truth((_n_age_b30 >= _n_life_b33)):
					_n_i_b31 += 1.0
					continue
				var _tuple_4 = _S.index_value(_n_E_b6,floori((_S.invoke(_n_q_b32,"next",[]) * _S.prop(_n_E_b6,"length"))))
				var _n_x0_b34 = _S.prop(_tuple_4,0)
				var _n_y0_b35 = _S.prop(_tuple_4,1)
				var _n_ang_b36 = (atan2((_n_y0_b35 + 19),_n_x0_b34) + _S.invoke(_n_q_b32,"range",[(-0.7), 0.7]))
				var _n_sp_b37 = (_S.invoke(_n_q_b32,"range",[60, 150]) * _n_k_b29)
				var _tuple_5 = _S.call_value(_n_flight,[_n_x0_b34, _n_y0_b35, (cos(_n_ang_b36) * _n_sp_b37), ((sin(_n_ang_b36) * _n_sp_b37) - 30), _n_age_b30, {"floor":0}])
				var _n_x_b38 = _S.prop(_tuple_5,0)
				var _n_y_b39 = _S.prop(_tuple_5,1)
				var _n_vx_b40 = _S.prop(_tuple_5,2)
				var _n_vy_b41 = _S.prop(_tuple_5,3)
				_S.call_value(_n_spark,[_n_p_b0, _n_x_b38, _n_y_b39, _n_vx_b40, _n_vy_b41, (1 - (float(_n_age_b30)/_n_life_b33)), _n_S_b4])
				_n_i_b31 += 1.0
	_S.call_value(_n_cycle,[_n_t_b1, _n_P, 8, (_S.named_value(_n_o_b2,"seed") + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"E":_n_E_b6,"p":_n_p_b0,"S":_n_S_b4,"this":_this}),"_f5")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.15, 0.3])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_E = _S.read(_parent,"E")
	var _n_flight = _S.read(_parent,"flight")
	var _n_p = _S.read(_parent,"p")
	var _n_S = _S.read(_parent,"S")
	var _n_spark = _S.read(_parent,"spark")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_q_b2 = _S.arg(_args,2)
	var _tuple_0 = _S.index_value(_n_E,floori((_S.invoke(_n_q_b2,"next",[]) * _S.prop(_n_E,"length"))))
	var _n_x0_b3 = _S.prop(_tuple_0,0)
	var _n_y0_b4 = _S.prop(_tuple_0,1)
	var _n_ang_b5 = (atan2((_n_y0_b4 + 19),_n_x0_b3) + _S.invoke(_n_q_b2,"range",[(-0.6), 0.6]))
	var _n_sp_b6 = _S.invoke(_n_q_b2,"range",[50, 110])
	var _tuple_1 = _S.call_value(_n_flight,[_n_x0_b3, _n_y0_b4, (cos(_n_ang_b5) * _n_sp_b6), ((sin(_n_ang_b5) * _n_sp_b6) - 20), _n_age_b0, {"floor":0}])
	var _n_x_b7 = _S.prop(_tuple_1,0)
	var _n_y_b8 = _S.prop(_tuple_1,1)
	var _n_vx_b9 = _S.prop(_tuple_1,2)
	var _n_vy_b10 = _S.prop(_tuple_1,3)
	_S.call_value(_n_spark,[_n_p, _n_x_b7, _n_y_b8, _n_vx_b9, _n_vy_b10, (1 - (float(_n_age_b0)/_n_life_b1)), _n_S])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_JOLTS = _S.read(_parent,"JOLTS")
	var _n_f_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_JOLTS):
		var _tuple_1 = _iter_0
		var _n_f0_b1 = _S.prop(_tuple_1,0)
		var _n_k_b2 = _S.prop(_tuple_1,1)
		if _S.truth(((_n_f_b0 < (_n_f0_b1 + 3)) if _S.truth((_n_f_b0 >= _n_f0_b1)) else (_n_f_b0 >= _n_f0_b1))):
			return {"a":(_n_f_b0 - _n_f0_b1),"k":_n_k_b2}
	return null
	return null
