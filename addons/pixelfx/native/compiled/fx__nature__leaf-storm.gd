@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/leaf-storm.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "drawLeaf", _S.import_value("fx/nature/_lib.js", "drawLeaf"))
	_S.define(_e, "leaves", _S.function_value(_e, "_f0"))
	_S.define(_e, "wind", _S.function_value(_e, "_f3"))
	_S.define(_e, "swirl", _S.function_value(_e, "_f4"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f7"))
	_S.define(_e, "draw", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Leaf storm"}, {"desc": "Leaves tumble up a rising spiral round the character, passing behind and in front, turning and flipping, wrapped in bright bands of wind; litter swirls at their feet."}, {"tags": ["nature", "wind", "leaves", "buff", "aura", "actor", "loop"]}, {"size": [112, 104]}, {"origin": [56, 92]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#1a2420", "#2e4038", "#4a6656", "#7a9a84", "#b4d0b8", "#eef8e8"]}, {"leaves": ["#123818", "#2f7a2a", "#6cb83a", "#c8f070", "#4a2a08", "#a8701c", "#e8b42e", "#fff09a", "#3a1010", "#9a2e1c", "#e0642a", "#ffb070"]}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "UP", _S.merge([{"turn": 1.1}, {"crouch": 0}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 37)}, {"bx": 13}, {"by": _S.unary("-", 37)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"poses": [[0, _S.read(_e, "UP")], [0.6, _S.merge([_S.read(_e, "UP"), {"lean": 2}, {"fy": _S.unary("-", 40)}, {"by": _S.unary("-", 33)}])], [1.2, _S.merge([_S.read(_e, "UP"), {"crouch": _S.unary("-", 1)}])], [1.8, _S.merge([_S.read(_e, "UP"), {"lean": _S.unary("-", 2)}, {"fy": _S.unary("-", 33)}, {"by": _S.unary("-", 40)}])], [2.4, _S.read(_e, "UP")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SY", 0.3)
	_S.define(_e, "TOP", 64)
	_S.define(_e, "ringR", _S.function_value(_e, "_f9"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_seed_b3 = _S.arg(_args,3)
	var _n_back_b4 = _S.arg(_args,4)
	_S.call_value(_n_cycle,[_n_t_b2, _S.named_value(_n_meta,"duration"), 28, _n_seed_b3, _S.function_value(_S.capture(_parent,{"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"back":_n_back_b4,"L":_n_L_b1,"p":_n_p_b0,"this":_this}),"_f2")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[1.5, 2.3])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_back = _S.read(_parent,"back")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_ringR = _S.read(_parent,"ringR")
	var _n_SY = _S.read(_parent,"SY")
	var _n_L = _S.read(_parent,"L")
	var _n_p = _S.read(_parent,"p")
	var _n_drawLeaf = _S.read(_parent,"drawLeaf")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_turns_b4 = _S.invoke(_n_R_b2,"range",[1.4, 2.2])
	var _n_th_b5 = (_S.invoke(_n_R_b2,"range",[0, _n_TAU]) + ((_n_turns_b4 * _n_TAU) * _n_k_b3))
	var _n_sn_b6 = sin(_n_th_b5)
	if _S.truth(_S.binary("===",(_n_sn_b6 > 0),_n_back)):
		return null
	var _n_y_b7 = ((-_S.numeric_lerp(1,_n_TOP,pow(_n_k_b3,0.9))) - _S.invoke(_n_R_b2,"range",[0, 6]))
	var _n_fling_b8 = _S.MathFX.smooth(0.75,1,_n_k_b3)
	var _n_rr_b9 = ((_S.call_value(_n_ringR,[_n_y_b7]) * _S.invoke(_n_R_b2,"range",[0.85, 1.15])) + (_n_fling_b8 * 22))
	var _n_x_b10 = (cos(_n_th_b5) * _n_rr_b9)
	var _n_yy_b11 = (_n_y_b7 + ((_n_sn_b6 * _n_rr_b9) * _n_SY))
	var _n_a_b12 = (minf(1,(_n_k_b3 * 7)) * (1 - _S.MathFX.smooth(0.85,1,_n_k_b3)))
	var _n_spin_b13 = ((_S.invoke(_n_R_b2,"range",[(-9), 9]) * _n_age_b0) + _n_th_b5)
	var _n_fl_b14 = (_n_age_b0 * _S.invoke(_n_R_b2,"range",[5, 11]))
	var _n_o_b15 = (_S.invoke(_n_R_b2,"int",[0, 2]) * 4)
	var _n_pal_b16 = ([_S.index_value(_n_L,_n_o_b15), _S.index_value(_n_L,_n_o_b15), _S.index_value(_n_L,(_n_o_b15 + 1)), _S.index_value(_n_L,(_n_o_b15 + 2))] if _S.truth(_n_back) else [_S.index_value(_n_L,_n_o_b15), _S.index_value(_n_L,(_n_o_b15 + 1)), _S.index_value(_n_L,(_n_o_b15 + 2)), _S.index_value(_n_L,(_n_o_b15 + 3))])
	_S.call_value(_n_drawLeaf,[_n_p, _n_x_b10, _n_yy_b11, _S.invoke(_n_R_b2,"range",[6.5, 9]), _S.invoke(_n_R_b2,"range",[2.4, 3.3]), _n_spin_b13, _n_fl_b14, _n_pal_b16, _n_a_b12])
	if _S.truth(((absf(cos(_n_fl_b14)) > 0.97) if _S.truth(not _S.truth(_n_back)) else not _S.truth(_n_back))):
		_S.invoke(_n_p,"px",[_n_x_b10, _n_yy_b11, _n_WHITE])
		_S.invoke(_n_p,"glow",[_n_x_b10, _n_yy_b11, 5, _S.index_value(_n_L,(_n_o_b15 + 3)), (0.35 * _n_a_b12)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_ringR = _S.read(_parent,"ringR")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_meta = _S.read(_parent,"meta")
	var _n_SY = _S.read(_parent,"SY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_seed_b3 = _S.arg(_args,3)
	var _n_back_b4 = _S.arg(_args,4)
	if true:
		var _n_j_b5 = 0
		while _S.truth((_n_j_b5 < 16)):
			var _n_R_b6 = _S.MathFX.rng([_n_seed_b3,_n_j_b5])
			var _n_y0_b7 = (-_S.invoke(_n_R_b6,"range",[4, (_n_TOP - 4)]))
			var _n_r_b8 = (_S.call_value(_n_ringR,[_n_y0_b7]) * _S.invoke(_n_R_b6,"range",[1, 1.25]))
			var _n_K_b9 = _S.invoke(_n_R_b6,"int",[2, 3])
			var _n_span_b10 = _S.invoke(_n_R_b6,"range",[1.1, 2.4])
			var _n_head_b11 = (_S.invoke(_n_R_b6,"range",[0, _n_TAU]) + (float(((_n_TAU * _n_K_b9) * _n_t_b2))/_S.named_value(_n_meta,"duration")))
			var _n_rise_b12 = _S.invoke(_n_R_b6,"range",[(-0.18), 0.18])
			if true:
				var _n_s_b13 = 0
				while _S.truth((_n_s_b13 <= _n_span_b10)):
					var _n_th_b14 = (_n_head_b11 - _n_s_b13)
					var _n_sn_b15 = sin(_n_th_b14)
					if _S.truth(_S.binary("===",(_n_sn_b15 > 0),_n_back_b4)):
						_n_s_b13 += (float(0.45)/_n_r_b8)
						continue
					var _n_k_b16 = (float(_n_s_b13)/_n_span_b10)
					var _n_x_b17 = (cos(_n_th_b14) * _n_r_b8)
					var _n_y_b18 = ((_n_y0_b7 + ((_n_sn_b15 * _n_r_b8) * _n_SY)) + (((_n_th_b14 - _n_head_b11) * _n_rise_b12) * 4))
					var _n_c_b19 = ((_S.index_value(_n_C_b1,3) if _S.truth((_n_k_b16 < 0.3)) else _S.index_value(_n_C_b1,2)) if _S.truth(_n_back_b4) else (_n_WHITE if _S.truth(((_S.invoke(_n_R_b6,"next",[]) < 2) if _S.truth((_n_k_b16 < 0.06)) else (_n_k_b16 < 0.06))) else (_S.index_value(_n_C_b1,5) if _S.truth((_n_k_b16 < 0.15)) else (_S.index_value(_n_C_b1,4) if _S.truth((_n_k_b16 < 0.4)) else _S.index_value(_n_C_b1,3)))))
					if _S.truth((_n_k_b16 < 0.45)):
						_S.invoke(_n_p_b0,"dot",[_n_x_b17, _n_y_b18, _n_c_b19])
					else:
						_S.invoke(_n_p_b0,"blend",[_n_x_b17, _n_y_b18, _n_c_b19, (1.6 * (1 - _n_k_b16))])
					_n_s_b13 += (float(0.45)/_n_r_b8)
			if _S.truth(((sin(_n_head_b11) > 0) if _S.truth(not _S.truth(_n_back_b4)) else not _S.truth(_n_back_b4))):
				_S.invoke(_n_p_b0,"glow",[(cos(_n_head_b11) * _n_r_b8), (_n_y0_b7 + ((sin(_n_head_b11) * _n_r_b8) * _n_SY)), 5, _S.index_value(_n_C_b1,4), 0.25])
			_n_j_b5 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_L_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_seed_b4 = _S.arg(_args,4)
	var _n_back_b5 = _S.arg(_args,5)
	_S.call_value(_n_cycle,[_n_t_b3, _S.named_value(_n_meta,"duration"), 14, _n_seed_b4, _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"back":_n_back_b5,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f6")])
	if true:
		var _n_j_b6 = 0
		while _S.truth((_n_j_b6 < 6)):
			var _n_R_b7 = _S.MathFX.rng([(_n_seed_b4 + 9),_n_j_b6])
			var _n_rr_b8 = _S.invoke(_n_R_b7,"range",[12, 24])
			var _n_th0_b9 = (_S.invoke(_n_R_b7,"range",[0, _n_TAU]) + (float(((_n_TAU * 3) * _n_t_b3))/_S.named_value(_n_meta,"duration")))
			var _n_span_b10 = _S.invoke(_n_R_b7,"range",[0.5, 1])
			if true:
				var _n_s_b11 = 0
				while _S.truth((_n_s_b11 < _n_span_b10)):
					var _n_th_b12 = (_n_th0_b9 - _n_s_b11)
					if _S.truth(_S.binary("===",(sin(_n_th_b12) > 0),_n_back_b5)):
						_n_s_b11 += (float(0.6)/_n_rr_b8)
						continue
					_S.invoke(_n_p_b0,"dot",[(cos(_n_th_b12) * _n_rr_b8), (0.5 + ((_n_rr_b8 * 0.2) * sin(_n_th_b12))), (_S.index_value(_n_C_b1,3) if _S.truth((_n_s_b11 < (_n_span_b10 * 0.4))) else _S.index_value(_n_C_b1,2)), (1 - (float(_n_s_b11)/_n_span_b10))])
					_n_s_b11 += (float(0.6)/_n_rr_b8)
			_n_j_b6 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.6, 1.1])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_back = _S.read(_parent,"back")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_th_b4 = (_S.invoke(_n_R_b2,"range",[0, _n_TAU]) + (_S.invoke(_n_R_b2,"range",[6, 9]) * _n_age_b0))
	var _n_sn_b5 = sin(_n_th_b4)
	if _S.truth(_S.binary("===",(_n_sn_b5 > 0),_n_back)):
		return null
	var _n_rr_b6 = (_S.invoke(_n_R_b2,"range",[10, 22]) + (_n_k_b3 * 8))
	var _n_x_b7 = (cos(_n_th_b4) * _n_rr_b6)
	var _n_y_b8 = (((-1) - (_n_k_b3 * _S.invoke(_n_R_b2,"range",[2, 8]))) + ((_n_sn_b5 * _n_rr_b6) * 0.25))
	var _n_s_b9 = (_S.invoke(_n_R_b2,"range",[2, 3.5]) * (0.6 + _n_k_b3))
	_S.invoke(_n_p,"disc",[_n_x_b7, _n_y_b8, _n_s_b9, (_S.index_value(_n_C,2) if _S.truth(_n_back) else _S.index_value(_n_C,3)), (((1 - _n_k_b3) * minf(1,(_n_k_b3 * 6))) * 0.3)])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_swirl = _S.read(_parent,"swirl")
	var _n_wind = _S.read(_parent,"wind")
	var _n_leaves = _S.read(_parent,"leaves")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),6)
	var _n_L_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"leaves"),12)
	_S.invoke(_n_p_b0,"glow",[0, (-30), 46, _S.index_value(_n_C_b3,4), 0.12])
	_S.invoke(_n_p_b0,"glow",[0, (-2), 26, _S.index_value(_n_L_b4,2), 0.12])
	_S.call_value(_n_swirl,[_n_p_b0, _n_C_b3, _n_L_b4, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 3) + 1), true])
	_S.call_value(_n_wind,[_n_p_b0, _n_C_b3, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 5) + 2), true])
	_S.call_value(_n_leaves,[_n_p_b0, _n_L_b4, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 7) + 3), true])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_swirl = _S.read(_parent,"swirl")
	var _n_wind = _S.read(_parent,"wind")
	var _n_leaves = _S.read(_parent,"leaves")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),6)
	var _n_L_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"leaves"),12)
	_S.call_value(_n_swirl,[_n_p_b0, _n_C_b3, _n_L_b4, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 3) + 1), false])
	_S.call_value(_n_wind,[_n_p_b0, _n_C_b3, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 5) + 2), false])
	_S.call_value(_n_leaves,[_n_p_b0, _n_L_b4, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 7) + 3), false])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_y_b0 = _S.arg(_args,0)
	return (15 + (9 * clampf((float((-_n_y_b0))/_n_TOP),0.0,1.0)))
	return null
