@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/confused.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "icon", _S.import_value("fx/status/_lib.js", "icon"))
	_S.define(_e, "bitmap", _S.import_value("fx/status/_lib.js", "bitmap"))
	_S.define(_e, "eyes", _S.import_value("fx/status/_lib.js", "eyes"))
	_S.define(_e, "spiral", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Confused"}, {"desc": "Head in a spin: a glowing spiral whirls over the head, question marks pop up round it and bob, the eyes dart left and right."}, {"tags": ["status", "confused", "confusion", "dizzy", "debuff", "loop"]}, {"size": [60, 78]}, {"origin": [30, 70]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#1e0f2e", "#4b2070", "#8a3ab0", "#c66ae0", "#f0a8ff", "#ffffff"]}, {"marks": ["#2a1608", "#b0701a", "#ffd84a", "#fff4b8"]}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SHRUG", _S.merge([{"turn": 1}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 26)}, {"bx": 14}, {"by": _S.unary("-", 26)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.merge([_S.read(_e, "SHRUG"), {"x": 0}, {"lean": _S.unary("-", 2)}])], [0.6, _S.merge([_S.read(_e, "SHRUG"), {"x": 1}, {"lean": 1}, {"crouch": 1}, {"fy": _S.unary("-", 23)}, {"by": _S.unary("-", 29)}, {"fbx": 5}, {"fby": _S.unary("-", 6)}])], [1.2, _S.merge([_S.read(_e, "SHRUG"), {"x": 2}, {"lean": 2}])], [1.8, _S.merge([_S.read(_e, "SHRUG"), {"x": 1}, {"lean": _S.unary("-", 1)}, {"crouch": 1}, {"fy": _S.unary("-", 29)}, {"by": _S.unary("-", 23)}, {"ffx": _S.unary("-", 4)}, {"ffy": _S.unary("-", 6)}])], [2.4, _S.merge([_S.read(_e, "SHRUG"), {"x": 0}, {"lean": _S.unary("-", 2)}])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "QS", _S.invoke([[".###.", "#...#", "....#", "...#.", "..#..", ".....", "..#.."], [".####.", "##..##", "....##", "...##.", "..##..", "..##..", "......", "..##..", "..##.."], [".#####.", "##...##", "##...##", ".....##", "....##.", "...##..", "...##..", ".......", "...##..", "...##.."]], "map", [_S.function_value(_e, "_f6")]))
	_S.define(_e, "MARKS", [_S.merge([{"x": _S.unary("-", 12)}, {"y": _S.unary("-", 5)}, {"t0": 0}, {"big": 2}]), _S.merge([{"x": 12}, {"y": _S.unary("-", 8)}, {"t0": 0.8}, {"big": 1}]), _S.merge([{"x": 1}, {"y": _S.unary("-", 17)}, {"t0": 1.6}, {"big": 2}])])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_cx_b2 = _S.arg(_args,2)
	var _n_cy_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_rot_b5 = (((float(_n_t_b4)/_n_D) * _n_TAU) * 2)
	var _n_turns_b6 = 1.8
	var _n_n_b7 = 72
	var _n_breathe_b8 = (1 + (0.08 * sin((((float(_n_t_b4)/_n_D) * _n_TAU) * 4))))
	var _n_at_b9 = _S.function_value(_S.capture(_parent,{"turns":_n_turns_b6,"rot":_n_rot_b5,"breathe":_n_breathe_b8,"cx":_n_cx_b2,"cy":_n_cy_b3,"this":_this}),"_f1")
	if true:
		var _n_i_b12 = 1
		while _S.truth((_n_i_b12 <= _n_n_b7)):
			var _n_u_b13 = (float(_n_i_b12)/_n_n_b7)
			var _tuple_0 = _S.call_value(_n_at_b9,[(float((_n_i_b12 - 1))/_n_n_b7)])
			var _n_x0_b14 = _S.prop(_tuple_0,0)
			var _n_y0_b15 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.call_value(_n_at_b9,[_n_u_b13])
			var _n_x1_b16 = _S.prop(_tuple_1,0)
			var _n_y1_b17 = _S.prop(_tuple_1,1)
			if _S.truth((_n_u_b13 > 0.45)):
				_S.invoke(_n_p_b0,"line",[(_n_x0_b14 + 0.5), (_n_y0_b15 + 0.7), (_n_x1_b16 + 0.5), (_n_y1_b17 + 0.7), _S.index_value(_n_C_b1,1)])
			_n_i_b12 += 1.0
	if true:
		var _n_i_b18 = 1
		while _S.truth((_n_i_b18 <= _n_n_b7)):
			var _n_u_b19 = (float(_n_i_b18)/_n_n_b7)
			var _tuple_2 = _S.call_value(_n_at_b9,[(float((_n_i_b18 - 1))/_n_n_b7)])
			var _n_x0_b20 = _S.prop(_tuple_2,0)
			var _n_y0_b21 = _S.prop(_tuple_2,1)
			var _tuple_3 = _S.call_value(_n_at_b9,[_n_u_b19])
			var _n_x1_b22 = _S.prop(_tuple_3,0)
			var _n_y1_b23 = _S.prop(_tuple_3,1)
			_S.invoke(_n_p_b0,"line",[_n_x0_b20, _n_y0_b21, _n_x1_b22, _n_y1_b23, (_S.index_value(_n_C_b1,5) if _S.truth((_n_u_b19 > 0.88)) else (_S.index_value(_n_C_b1,4) if _S.truth((_n_u_b19 > 0.62)) else (_S.index_value(_n_C_b1,3) if _S.truth((_n_u_b19 > 0.3)) else _S.index_value(_n_C_b1,2))))])
			if _S.truth(_S.binary("===",fmod(_n_i_b18,6),0)):
				_S.invoke(_n_p_b0,"light",[_n_x1_b22, _n_y1_b23, _S.index_value(_n_C_b1,3), (0.4 * _n_u_b19)])
			_n_i_b18 += 1.0
	var _tuple_4 = _S.call_value(_n_at_b9,[1])
	var _n_hx_b10 = _S.prop(_tuple_4,0)
	var _n_hy_b11 = _S.prop(_tuple_4,1)
	_S.call_value(_n_sparkle,[_n_p_b0, _n_hx_b10, _n_hy_b11, 2, _S.index_value(_n_C_b1,4), _S.index_value(_n_C_b1,3), 0.5])
	_S.invoke(_n_p_b0,"glow",[_n_cx_b2, _n_cy_b3, 13, _S.index_value(_n_C_b1,3), 0.28])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_turns = _S.read(_parent,"turns")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_rot = _S.read(_parent,"rot")
	var _n_breathe = _S.read(_parent,"breathe")
	var _n_cx = _S.read(_parent,"cx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_th_b1 = (((_n_u_b0 * _n_turns) * _n_TAU) - _n_rot)
	var _n_r_b2 = ((0.8 + (6.6 * _n_u_b0)) * _n_breathe)
	return [(_n_cx + (cos(_n_th_b1) * _n_r_b2)), (_n_cy + ((sin(_n_th_b1) * _n_r_b2) * 0.9))]
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),6)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	_S.invoke(_n_p_b0,"glow",[0, (_S.named_value(_n_a_b4,"y") - 7), 16, _S.index_value(_n_C_b3,3), 0.22])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_eyes = _S.read(_parent,"eyes")
	var _n_spiral = _S.read(_parent,"spiral")
	var _n_ease = _S.read(_parent,"ease")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_QS = _S.read(_parent,"QS")
	var _n_icon = _S.read(_parent,"icon")
	var _n_MARKS = _S.read(_parent,"MARKS")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),6)
	var _n_M_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"marks"),4)
	var _n_a_b5 = _S.named_value(_n_o_b2,"actor")
	var _n_look_b6 = (1 if _S.truth(fmod(floori(((float(_n_t_b1)/_n_D) * 6)),2)) else (-1))
	for _iter_0 in _S.array(_S.call_value(_n_eyes,[_n_a_b5])):
		var _n_e_b7 = _iter_0
		for _iter_1 in _S.array(_S.named_value(_n_e_b7,"px")):
			var _tuple_2 = _iter_1
			var _n_x_b8 = _S.prop(_tuple_2,0)
			var _n_y_b9 = _S.prop(_tuple_2,1)
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_a_b5,"x") + _n_x_b8), (_S.named_value(_n_a_b5,"y") + _n_y_b9), 4279702047])
		_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_a_b5,"x") + (_S.named_value(_n_e_b7,"x0") if _S.truth((_n_look_b6 < 0)) else _S.named_value(_n_e_b7,"x1"))), (_S.named_value(_n_a_b5,"y") + _S.named_value(_n_e_b7,"y0")), 4294967295])
	_S.call_value(_n_spiral,[_n_p_b0, _n_C_b3, 0, (_S.named_value(_n_a_b5,"y") - 7), _n_t_b1])
	for _iter_3 in _S.array(_n_MARKS):
		var _n_m_b10 = _iter_3
		var _n_age_b11 = fmod((fmod((_n_t_b1 - _S.named_value(_n_m_b10,"t0")),_n_D) + _n_D),_n_D)
		var _n_life_b12 = 1.9
		if _S.truth((_n_age_b11 > _n_life_b12)):
			continue
		var _n_u_b13 = (float(_n_age_b11)/_n_life_b12)
		var _n_pop_b14 = _S.invoke(_n_ease,"outBack",[clampf((float(_n_age_b11)/0.16),0.0,1.0), 3])
		var _n_out_b15 = clampf((float((_n_u_b13 - 0.82))/0.18),0.0,1.0)
		var _n_size_b16 = maxf(0,floori((((_S.named_value(_n_m_b10,"big") * _n_pop_b14) * (1 - _n_out_b15)) + (1 if _S.truth((_n_pop_b14 > 1.1)) else 0))+0.5))
		var _n_bob_b17 = (sin(((_n_age_b11 * 5) + (_S.named_value(_n_m_b10,"t0") * 3))) * 1.6)
		var _n_tilt_b18 = (sin(((_n_age_b11 * 3.3) + _S.named_value(_n_m_b10,"t0"))) * 0.8)
		if _S.truth(((_n_pop_b14 < 0.3) if _S.truth((_n_pop_b14 < 0.3)) else ((_n_out_b15 > 0.6) if _S.truth((_S.binary("===",_n_size_b16,0) if _S.truth((_n_out_b15 > 0)) else (_n_out_b15 > 0))) else (_S.binary("===",_n_size_b16,0) if _S.truth((_n_out_b15 > 0)) else (_n_out_b15 > 0))))):
			continue
		var _n_x_b19 = (_S.named_value(_n_m_b10,"x") + _n_tilt_b18)
		var _n_y_b20 = (((_S.named_value(_n_a_b5,"y") + _S.named_value(_n_m_b10,"y")) + _n_bob_b17) - (_n_age_b11 * 2))
		if _S.truth((_n_age_b11 < 0.2)):
			var _n_k_b21 = (float(_n_age_b11)/0.2)
			if true:
				var _n_j_b22 = 0
				while _S.truth((_n_j_b22 < 8)):
					var _n_an_b23 = (((float(_n_j_b22)/8) * _n_TAU) + 0.2)
					var _n_d0_b24 = (4 + (7 * _n_k_b21))
					var _n_d1_b25 = (_n_d0_b24 + (3 * (1 - _n_k_b21)))
					_S.invoke(_n_p_b0,"line",[(_n_x_b19 + (cos(_n_an_b23) * _n_d0_b24)), (_n_y_b20 + (sin(_n_an_b23) * _n_d0_b24)), (_n_x_b19 + (cos(_n_an_b23) * _n_d1_b25)), (_n_y_b20 + (sin(_n_an_b23) * _n_d1_b25)), (_S.index_value(_n_M_b4,2) if _S.truth(fmod(_n_j_b22,2)) else _S.index_value(_n_M_b4,3)), (1 - _n_k_b21)])
					_n_j_b22 += 1.0
			_S.invoke(_n_p_b0,"glow",[_n_x_b19, _n_y_b20, 16, _S.index_value(_n_M_b4,2), (0.45 * (1 - _n_k_b21))])
		_S.call_value(_n_icon,[_n_p_b0, _n_x_b19, _n_y_b20, 7, _S.index_value(_n_QS,minf(2,_n_size_b16)), [_S.index_value(_n_M_b4,0), _S.index_value(_n_M_b4,1), _S.index_value(_n_M_b4,2), _S.index_value(_n_M_b4,3)]])
		_S.invoke(_n_p_b0,"glow",[_n_x_b19, _n_y_b20, (10 + (_n_size_b16 * 2)), _S.index_value(_n_M_b4,2), (0.28 * (1 - _n_out_b15))])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 10, (_S.named_value(_n_o_b2,"seed") + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"a":_n_a_b5,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f5")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.35, 0.6])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_a = _S.read(_parent,"a")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_th_b3 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_u_b4 = (float(_n_age_b0)/_n_life_b1)
	var _n_d_b5 = (6 + (_n_age_b0 * _S.invoke(_n_r_b2,"range",[12, 22])))
	var _n_x_b6 = (cos(_n_th_b3) * _n_d_b5)
	var _n_y_b7 = ((_S.named_value(_n_a,"y") - 7) + ((sin(_n_th_b3) * _n_d_b5) * 0.8))
	if _S.truth(_S.logical("&&",(sin((PI * _n_u_b4)) > 0.6),func():return (_S.invoke(_n_r_b2,"next",[]) < 0.5))):
		_S.call_value(_n_sparkle,[_n_p, _n_x_b6, _n_y_b7, 1, _S.index_value(_n_C,4), _S.index_value(_n_C,3), 0.3])
	else:
		_S.invoke(_n_p,"dot",[_n_x_b6, _n_y_b7, (_S.index_value(_n_C,5) if _S.truth((_n_u_b4 < 0.5)) else _S.index_value(_n_C,4)), (1.2 - _n_u_b4)])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_bitmap = _S.read(_parent,"bitmap")
	var _n_rows_b0 = _S.arg(_args,0)
	return _S.call_value(_n_bitmap,[_n_rows_b0])
	return null
