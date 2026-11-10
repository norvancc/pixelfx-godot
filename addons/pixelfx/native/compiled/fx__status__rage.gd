@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/rage.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "eyes", _S.import_value("fx/status/_lib.js", "eyes"))
	_S.define(_e, "icon", _S.import_value("fx/status/_lib.js", "icon"))
	_S.define(_e, "bitmap", _S.import_value("fx/status/_lib.js", "bitmap"))
	_S.define(_e, "travel", _S.import_value("fx/status/_lib.js", "travel"))
	_S.define(_e, "ember", _S.import_value("fx/status/_lib.js", "ember"))
	_S.define(_e, "cracks", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Rage"}, {"desc": "Seething: the body judders on every heartbeat, an anger mark throbs at the temple, eyes burn, steam jets off the head, stress lines flash out and the floor cracks hot underfoot."}, {"tags": ["status", "rage", "berserk", "anger", "buff", "loop"]}, {"size": [80, 80]}, {"origin": [40, 70]}, {"duration": 1.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#1a0208", "#4a0612", "#8a0c1c", "#c81828", "#ff3040", "#ff7a7a", "#ffc8c8", "#ffffff"]}, {"heat": ["#5a0a0a", "#c8281a", "#ff7a2a", "#ffd27a"]}, {"steam": "#f2e8ee"}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SEETHE", _S.merge([{"turn": 1}, {"crouch": 4}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 19)}, {"bx": 13}, {"by": _S.unary("-", 19)}, {"ffx": _S.unary("-", 8)}, {"fbx": 9}]))
	_S.define(_e, "THUD", _S.merge([_S.read(_e, "SEETHE"), {"crouch": 6}, {"fy": _S.unary("-", 23)}, {"by": _S.unary("-", 23)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "SEETHE")], [0.05, _S.read(_e, "THUD"), "snap"], [0.17, _S.read(_e, "SEETHE"), "snap"], [0.29, _S.merge([_S.read(_e, "THUD"), {"crouch": 5}]), "snap"], [0.4, _S.read(_e, "SEETHE"), "snap"], [1.2, _S.read(_e, "SEETHE")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "LUB", 0.05)
	_S.define(_e, "DUB", 0.29)
	_S.define(_e, "G", 760)
	_S.define(_e, "pulse", _S.function_value(_e, "_f7"))
	_S.define(_e, "beat", _S.function_value(_e, "_f8"))
	_S.define(_e, "since", _S.function_value(_e, "_f9"))
	_S.define(_e, "shaking", _S.function_value(_e, "_f10"))
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f11"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_S.define(_e, "MARK", [_S.call_value(_S.read(_e, "bitmap"), [["..#.#..", "..#.#..", "##...##", ".......", "##...##", "..#.#..", "..#.#.."]]), _S.call_value(_S.read(_e, "bitmap"), [["...#.#...", "...#.#...", "..##.##..", "###...###", ".........", "###...###", "..##.##..", "...#.#...", "...#.#..."]])])
	_S.define(_e, "CRACKS", _S.construct(_S.read(_e, "Map"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_CRACKS = _S.read(_parent,"CRACKS")
	var _n_shape = _S.read(_parent,"shape")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_seed_b1 = _S.arg(_args,1)
	if _S.truth(_S.invoke(_n_CRACKS,"has",[_n_seed_b1])):
		return _S.invoke(_n_CRACKS,"get",[_n_seed_b1])
	var _n_S_b2 = _S.call_value(_n_shape,[_n_a_b0])
	var _tuple_0 = _S.index_value(_S.named_value(_n_S_b2,"rows"),(_S.named_value(_n_S_b2,"h") - 1))
	var _n_fl_b3 = _S.prop(_tuple_0,0)
	var _n_fr_b4 = _S.prop(_tuple_0,1)
	var _n_R_b5 = _S.construct(_n_Rng,[((_n_seed_b1 * 31) + 7)])
	var _n_out_b6 = []
	for _iter_1 in _S.array([[((_S.named_value(_n_a_b0,"x") + _n_fl_b3) + 2), (-1)], [((_S.named_value(_n_a_b0,"x") + _n_fr_b4) - 1), 1], [(_S.named_value(_n_a_b0,"x") + (float((_n_fl_b3 + _n_fr_b4))/2)), (-1)], [((_S.named_value(_n_a_b0,"x") + (float((_n_fl_b3 + _n_fr_b4))/2)) + 1), 1]]):
		var _tuple_2 = _iter_1
		var _n_x0_b7 = _S.prop(_tuple_2,0)
		var _n_dir_b8 = _S.prop(_tuple_2,1)
		var _n_x_b9 = _n_x0_b7
		var _n_y_b10 = 0.5
		var _n_pts_b11 = [[_n_x_b9, _n_y_b10]]
		var _n_n_b12 = _S.invoke(_n_R_b5,"int",[5, 9])
		if true:
			var _n_i_b13 = 0
			while _S.truth((_n_i_b13 < _n_n_b12)):
				_n_x_b9 += (_n_dir_b8 * _S.invoke(_n_R_b5,"range",[1.2, 2.4]))
				_n_y_b10 = clampf((_n_y_b10 + _S.invoke(_n_R_b5,"range",[(-0.9), 0.9])),0,2.5)
				_S.invoke(_n_pts_b11,"push",[[_n_x_b9, _n_y_b10]])
				if _S.truth((_S.invoke(_n_R_b5,"chance",[0.3]) if _S.truth((_n_i_b13 > 1)) else (_n_i_b13 > 1))):
					_S.invoke(_n_out_b6,"push",[[[_n_x_b9, _n_y_b10], [(_n_x_b9 + (_n_dir_b8 * _S.invoke(_n_R_b5,"range",[1, 2]))), clampf((_n_y_b10 + (_S.invoke(_n_R_b5,"sign",[]) * _S.invoke(_n_R_b5,"range",[0.6, 1.4]))),0,3)]]])
				_n_i_b13 += 1.0
		_S.invoke(_n_out_b6,"push",[_n_pts_b11])
	_S.invoke(_n_CRACKS,"set",[_n_seed_b1, _n_out_b6])
	return _n_out_b6
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_beat = _S.read(_parent,"beat")
	var _n_since = _S.read(_parent,"since")
	var _n_LUB = _S.read(_parent,"LUB")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_cracks = _S.read(_parent,"cracks")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_Hh_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"heat"),4)
	var _n_a_b5 = _S.named_value(_n_o_b2,"actor")
	var _n_b_b6 = _S.call_value(_n_beat,[_n_t_b1])
	var _n_stamp_b7 = exp((float((-_S.call_value(_n_since,[_n_t_b1, _n_LUB])))/0.18))
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 9, (_S.named_value(_n_o_b2,"seed") + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f2"), _S.function_value(_S.capture(_parent,{"a":_n_a_b5,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f3")])
	_S.invoke(_n_p_b0,"shade",[(-30), (-4), 30, 8, _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"b":_n_b_b6,"this":_this}),"_f4")])
	var _n_heat_b8 = (0.25 + (0.75 * _n_stamp_b7))
	for _iter_0 in _S.array(_S.call_value(_n_cracks,[_n_a_b5, _S.named_value(_n_o_b2,"seed")])):
		var _n_pts_b9 = _iter_0
		if true:
			var _n_i_b10 = 1
			while _S.truth((_n_i_b10 < _S.prop(_n_pts_b9,"length"))):
				var _tuple_1 = _S.index_value(_n_pts_b9,(_n_i_b10 - 1))
				var _n_x0_b11 = _S.prop(_tuple_1,0)
				var _n_y0_b12 = _S.prop(_tuple_1,1)
				var _tuple_2 = _S.index_value(_n_pts_b9,_n_i_b10)
				var _n_x1_b13 = _S.prop(_tuple_2,0)
				var _n_y1_b14 = _S.prop(_tuple_2,1)
				var _n_far_b15 = (float(_n_i_b10)/_S.prop(_n_pts_b9,"length"))
				_S.invoke(_n_p_b0,"line",[_n_x0_b11, _n_y0_b12, _n_x1_b13, _n_y1_b14, (_S.index_value(_n_Hh_b4,3) if _S.truth(((_n_heat_b8 * (1 - (_n_far_b15 * 0.6))) > 0.6)) else (_S.index_value(_n_Hh_b4,2) if _S.truth(((_n_heat_b8 * (1 - (_n_far_b15 * 0.5))) > 0.35)) else _S.index_value(_n_Hh_b4,1)))])
				if _S.truth(fmod(_n_i_b10,2)):
					_S.invoke(_n_p_b0,"glow",[_n_x1_b13, _n_y1_b14, 4, _S.index_value(_n_Hh_b4,2), ((0.25 * _n_heat_b8) * (1 - (_n_far_b15 * 0.5)))])
				_n_i_b10 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.7, 1.1])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_x0_b4 = _S.invoke(_n_r_b2,"range",[(-16), 16])
	var _n_y_b5 = ((_S.named_value(_n_a,"y") + _S.invoke(_n_r_b2,"range",[10, 40])) - (_n_age_b0 * _S.invoke(_n_r_b2,"range",[14, 22])))
	var _n_len_b6 = _S.invoke(_n_r_b2,"range",[6, 11])
	var _n_ph_b7 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_k_b8 = (sin((PI * _n_u_b3)) * 0.55)
	if true:
		var _n_d_b9 = 0
		while _S.truth((_n_d_b9 < _n_len_b6)):
			_S.invoke(_n_p,"dot",[((_n_x0_b4 - (float(_n_len_b6)/2)) + _n_d_b9), (_n_y_b5 + floori((sin((((_n_d_b9 * 0.9) + _n_ph_b7) + (_n_age_b0 * 12))) * 0.8)+0.5)), (_S.index_value(_n_C,2) if _S.truth(fmod(_n_d_b9,3)) else _S.index_value(_n_C,1)), (_n_k_b8 * (1 - (absf(((float(_n_d_b9)/_n_len_b6) - 0.5)) * 1.4)))])
			_n_d_b9 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_b = _S.read(_parent,"b")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = _S.Bridge.hypot([(float(_n_x_b0)/28), (float((_n_y_b1 - 0.5))/4.5)])
	if _S.truth((_n_d_b3 < 1)):
		_S.set_prop(_n_out_b2,"l",_S.index_value(_n_C,3),"=")
		_S.set_prop(_n_out_b2,"k",(((0.2 + (0.3 * _n_b)) * (1 - _n_d_b3)) * (1 - _n_d_b3)),"=")
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_shape = _S.read(_parent,"shape")
	var _n_beat = _S.read(_parent,"beat")
	var _n_hex = _S.read(_parent,"hex")
	var _n_shaking = _S.read(_parent,"shaking")
	var _n_since = _S.read(_parent,"since")
	var _n_LUB = _S.read(_parent,"LUB")
	var _n_colorAt = _S.read(_parent,"colorAt")
	var _n_eyes = _S.read(_parent,"eyes")
	var _n_pulse = _S.read(_parent,"pulse")
	var _n_DUB = _S.read(_parent,"DUB")
	var _n_MARK = _S.read(_parent,"MARK")
	var _n_icon = _S.read(_parent,"icon")
	var _n_travel = _S.read(_parent,"travel")
	var _n_ember = _S.read(_parent,"ember")
	var _n_G = _S.read(_parent,"G")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_Hh_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"heat"),4)
	var _n_a_b5 = _S.named_value(_n_o_b2,"actor")
	var _n_S_b6 = _S.call_value(_n_shape,[_n_a_b5])
	var _n_b_b7 = _S.call_value(_n_beat,[_n_t_b1])
	var _n_steam_b8 = _S.call_value(_n_hex,[_S.named_value(_n_o_b2,"steam")])
	var _n_shake_b9 = _S.call_value(_n_shaking,[_n_t_b1])
	var _n_dx_b10 = ((1 if _S.truth(fmod(floori((_n_t_b1 * 60)),2)) else (-1)) if _S.truth(_n_shake_b9) else 0)
	var _n_dy_b11 = ((-1) if _S.truth(((_S.call_value(_n_since,[_n_t_b1, (_n_LUB - 0.02)]) < 0.06) if _S.truth(_n_shake_b9) else _n_shake_b9)) else 0)
	for _iter_0 in _S.array(_S.named_value(_n_S_b6,"body")):
		var _tuple_1 = _iter_0
		var _n_mx_b16 = _S.prop(_tuple_1,0)
		var _n_my_b17 = _S.prop(_tuple_1,1)
		var _n_c_b18 = _S.call_value(_n_colorAt,[_n_a_b5, _n_mx_b16, _n_my_b17])
		var _n_l_b19 = _S.ColorFX.luma(_n_c_b18)
		var _n_skin_b20 = ((_S.binary("&",_n_c_b18,255) > (_S.binary("&",_S.binary(">>>",_n_c_b18,16),255) + 30)) if _S.truth((_n_l_b19 > 0.55)) else (_n_l_b19 > 0.55))
		if _S.truth(_n_skin_b20):
			_S.invoke(_n_p_b0,"px",[((_S.named_value(_n_a_b5,"x") + _n_mx_b16) + _n_dx_b10), ((_S.named_value(_n_a_b5,"y") + _n_my_b17) + _n_dy_b11), _S.ColorFX.mix(_n_c_b18,_S.index_value(_n_C_b3,4),(0.22 + (0.3 * _n_b_b7)))])
		else:
			if _S.truth(_n_shake_b9):
				_S.invoke(_n_p_b0,"px",[((_S.named_value(_n_a_b5,"x") + _n_mx_b16) + _n_dx_b10), ((_S.named_value(_n_a_b5,"y") + _n_my_b17) + _n_dy_b11), _n_c_b18])
	for _iter_2 in _S.array(_S.call_value(_n_eyes,[_n_a_b5])):
		var _n_e_b21 = _iter_2
		var _n_ex_b22 = (_S.named_value(_n_a_b5,"x") + _n_dx_b10)
		var _n_ey_b23 = (_S.named_value(_n_a_b5,"y") + _n_dy_b11)
		var _n_inner_b24 = (1 if _S.truth(((float((_S.named_value(_n_e_b21,"x0") + _S.named_value(_n_e_b21,"x1")))/2) < (float(_S.named_value(_n_a_b5,"w"))/2))) else (-1))
		for _iter_3 in _S.array(_S.named_value(_n_e_b21,"px")):
			var _tuple_4 = _iter_3
			var _n_x_b27 = _S.prop(_tuple_4,0)
			var _n_y_b28 = _S.prop(_tuple_4,1)
			_S.invoke(_n_p_b0,"px",[(_n_ex_b22 + _n_x_b27), (_n_ey_b23 + _n_y_b28), (_S.index_value(_n_C_b3,7) if _S.truth(_S.binary("===",_n_y_b28,_S.named_value(_n_e_b21,"y0"))) else (_S.index_value(_n_C_b3,6) if _S.truth(_S.binary("===",_n_y_b28,(_S.named_value(_n_e_b21,"y0") + 1))) else _S.index_value(_n_C_b3,4)))])
		var _n_xi_b25 = (_S.named_value(_n_e_b21,"x1") if _S.truth((_n_inner_b24 > 0)) else _S.named_value(_n_e_b21,"x0"))
		var _n_xo_b26 = (_S.named_value(_n_e_b21,"x0") if _S.truth((_n_inner_b24 > 0)) else _S.named_value(_n_e_b21,"x1"))
		_S.invoke(_n_p_b0,"px",[((_n_ex_b22 + _n_xo_b26) - _n_inner_b24), ((_n_ey_b23 + _S.named_value(_n_e_b21,"y0")) - 2), 4280227622])
		_S.invoke(_n_p_b0,"px",[(_n_ex_b22 + _n_xo_b26), ((_n_ey_b23 + _S.named_value(_n_e_b21,"y0")) - 2), 4280227622])
		_S.invoke(_n_p_b0,"px",[(_n_ex_b22 + _n_xi_b25), ((_n_ey_b23 + _S.named_value(_n_e_b21,"y0")) - 1), 4280227622])
		_S.invoke(_n_p_b0,"glow",[(_n_ex_b22 + (float(((_S.named_value(_n_e_b21,"x0") + _S.named_value(_n_e_b21,"x1")) + 1))/2)), ((_n_ey_b23 + _S.named_value(_n_e_b21,"y0")) + 1), 5, _S.index_value(_n_C_b3,5), (0.35 + (0.35 * _n_b_b7))])
	var _n_big_b12 = _S.logical("||",(_S.call_value(_n_pulse,[_n_t_b1, (_n_LUB + 0.02), 0.05]) > 0.35),func():return (_S.call_value(_n_pulse,[_n_t_b1, (_n_DUB + 0.02), 0.04]) > 0.6))
	var _n_mx_b13 = ((_S.named_value(_n_a_b5,"x") + (_S.named_value(_n_a_b5,"w") * 0.86)) + _n_dx_b10)
	var _n_my_b14 = ((_S.named_value(_n_a_b5,"y") + 3) + _n_dy_b11)
	_S.call_value(_n_icon,[_n_p_b0, _n_mx_b13, _n_my_b14, 5, _S.index_value(_n_MARK,(1 if _S.truth(_n_big_b12) else 0)), [_S.index_value(_n_C_b3,0), _S.index_value(_n_C_b3,3), _S.index_value(_n_C_b3,4), _S.index_value(_n_C_b3,5)]])
	_S.invoke(_n_p_b0,"px",[(_n_mx_b13 - (3 if _S.truth(_n_big_b12) else 2)), (_n_my_b14 - (3 if _S.truth(_n_big_b12) else 2)), _S.index_value(_n_C_b3,6)])
	_S.invoke(_n_p_b0,"glow",[_n_mx_b13, _n_my_b14, 8, _S.index_value(_n_C_b3,4), (0.25 + (0.4 * _n_b_b7))])
	for _iter_5 in _S.array([[(_n_LUB + 0.04), 7, 1], [(_n_DUB + 0.04), 4, 0.75]]):
		var _tuple_6 = _iter_5
		var _n_at_b29 = _S.prop(_tuple_6,0)
		var _n_n_b30 = _S.prop(_tuple_6,1)
		var _n_power_b31 = _S.prop(_tuple_6,2)
		for _iter_7 in _S.array([(-1), 1]):
			var _n_side_b32 = _iter_7
			if true:
				var _n_i_b33 = 0
				while _S.truth((_n_i_b33 < _n_n_b30)):
					var _n_age_b34 = _S.call_value(_n_since,[_n_t_b1, (_n_at_b29 + (_n_i_b33 * 0.016))])
					var _n_life_b35 = (0.22 + (0.12 * _S.MathFX.rand([_n_i_b33,_n_side_b32,3])))
					if _S.truth((_n_age_b34 >= _n_life_b35)):
						_n_i_b33 += 1.0
						continue
					var _n_u_b36 = (float(_n_age_b34)/_n_life_b35)
					var _n_ang_b37 = ((float((-PI))/2) + (_n_side_b32 * (0.5 + (0.2 * _S.MathFX.rand([_n_i_b33,_n_side_b32,5])))))
					var _n_sp_b38 = ((90 + (40 * _S.MathFX.rand([_n_i_b33,_n_side_b32,7]))) * _n_power_b31)
					var _n_x_b39 = (((_n_side_b32 * _S.named_value(_n_a_b5,"w")) * 0.36) + (cos(_n_ang_b37) * _S.call_value(_n_travel,[_n_sp_b38, 0, 7, _n_age_b34])))
					var _n_y_b40 = (((_S.named_value(_n_a_b5,"y") + 3) + (sin(_n_ang_b37) * _S.call_value(_n_travel,[_n_sp_b38, 0, 7, _n_age_b34]))) - (8 * _n_age_b34))
					var _n_rad_b41 = ((1 + (3.2 * sqrt(_n_u_b36))) * (0.8 + (0.4 * _S.MathFX.rand([_n_i_b33,_n_side_b32,9]))))
					var _n_k_b42 = (minf(1,(_n_u_b36 * 12)) * pow((1 - _n_u_b36),2))
					_S.invoke(_n_p_b0,"disc",[_n_x_b39, _n_y_b40, _n_rad_b41, _n_steam_b8, (0.7 * _n_k_b42)])
					_S.invoke(_n_p_b0,"disc",[(_n_x_b39 - (_n_rad_b41 * 0.2)), (_n_y_b40 - (_n_rad_b41 * 0.25)), (_n_rad_b41 * 0.6), 4294967295, (0.6 * _n_k_b42)])
					if _S.truth((_n_u_b36 < 0.3)):
						_S.invoke(_n_p_b0,"dot",[_n_x_b39, _n_y_b40, 4294967295, (1 - (float(_n_u_b36)/0.3))])
					_n_i_b33 += 1.0
	for _iter_8 in _S.array([[_n_LUB, 8, 7], [_n_DUB, 6, 5]]):
		var _tuple_9 = _iter_8
		var _n_at_b43 = _S.prop(_tuple_9,0)
		var _n_n_b44 = _S.prop(_tuple_9,1)
		var _n_len_b45 = _S.prop(_tuple_9,2)
		var _n_age_b46 = _S.call_value(_n_since,[_n_t_b1, _n_at_b43])
		if _S.truth((_n_age_b46 > 0.2)):
			continue
		var _n_k_b47 = (float(_n_age_b46)/0.2)
		if true:
			var _n_i_b48 = 0
			while _S.truth((_n_i_b48 < _n_n_b44)):
				var _n_ang_b49 = ((float((-PI))/2) + (((float((_n_i_b48 + 0.5))/_n_n_b44) - 0.5) * 4.4))
				var _n_r0_b50 = (15 + (6 * _n_k_b47))
				var _n_ca_b51 = cos(_n_ang_b49)
				var _n_sa_b52 = sin(_n_ang_b49)
				var _n_cx_b53 = 0
				var _n_cy_b54 = (_S.named_value(_n_a_b5,"y") + 12)
				var _n_pts_b55 = []
				if true:
					var _n_j_b56 = 0
					while _S.truth((_n_j_b56 <= 3)):
						var _n_r_b57 = (_n_r0_b50 + ((float(_n_j_b56)/3) * _n_len_b45))
						var _n_off_b58 = (1.3 if _S.truth(fmod(_n_j_b56,2)) else (-0.4))
						_S.invoke(_n_pts_b55,"push",[[((_n_cx_b53 + (_n_ca_b51 * _n_r_b57)) - (_n_sa_b52 * _n_off_b58)), ((_n_cy_b54 + (_n_sa_b52 * _n_r_b57)) + (_n_ca_b51 * _n_off_b58))]])
						_n_j_b56 += 1.0
				_S.invoke(_n_p_b0,"polyline",[_n_pts_b55, _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f6"), (1.2 - _n_k_b47)])
				_S.invoke(_n_p_b0,"glowLine",[_S.index_value(_S.index_value(_n_pts_b55,0),0), _S.index_value(_S.index_value(_n_pts_b55,0),1), _S.index_value(_S.index_value(_n_pts_b55,3),0), _S.index_value(_S.index_value(_n_pts_b55,3),1), 3, _S.index_value(_n_C_b3,4), (0.3 * (1 - _n_k_b47))])
				_n_i_b48 += 1.0
	var _n_st_b15 = _S.call_value(_n_since,[_n_t_b1, _n_LUB])
	if true:
		var _n_i_b59 = 0
		while _S.truth((_n_i_b59 < 10)):
			var _n_life_b60 = (0.5 + (0.5 * _S.MathFX.rand([_n_i_b59,11])))
			var _n_age_b61 = (_n_st_b15 - (0.02 * _S.MathFX.rand([_n_i_b59,12])))
			if _S.truth(((_n_age_b61 < 0) if _S.truth((_n_age_b61 < 0)) else (_n_age_b61 > _n_life_b60))):
				_n_i_b59 += 1.0
				continue
			var _n_x_b62 = (((_S.MathFX.rand([_n_i_b59,13]) - 0.5) * 30) + ((sin(((_n_age_b61 * 9) + _n_i_b59)) * 1.5) * _n_age_b61))
			var _n_y_b63 = ((-1) + _S.call_value(_n_travel,[(-(40 + (50 * _S.MathFX.rand([_n_i_b59,14])))), (-20), 1.6, _n_age_b61]))
			_S.call_value(_n_ember,[_n_p_b0, _n_x_b62, _n_y_b63, (float(_n_age_b61)/_n_life_b60), [_S.index_value(_n_Hh_b4,3), _S.index_value(_n_Hh_b4,2), _S.index_value(_n_Hh_b4,1)], (_n_age_b61 + _n_i_b59)])
			_n_i_b59 += 1.0
	if true:
		var _n_i_b64 = 0
		while _S.truth((_n_i_b64 < 12)):
			var _n_vx_b65 = ((_S.MathFX.rand([_n_i_b64,21]) - 0.5) * 90)
			var _n_vy_b66 = (-(40 + (70 * _S.MathFX.rand([_n_i_b64,22]))))
			var _n_tt_b67 = _n_st_b15
			var _n_x_b68 = (((_S.MathFX.rand([_n_i_b64,23]) - 0.5) * 18) + (_n_vx_b65 * _n_tt_b67))
			var _n_y_b69 = (((-1) + (_n_vy_b66 * _n_tt_b67)) + (((0.5 * _n_G) * _n_tt_b67) * _n_tt_b67))
			if _S.truth(((_n_tt_b67 > 0.6) if _S.truth((_n_tt_b67 > 0.6)) else (_n_y_b69 > 0))):
				_n_i_b64 += 1.0
				continue
			_S.invoke(_n_p_b0,"px",[_n_x_b68, _n_y_b69, (_S.index_value(_n_C_b3,2) if _S.truth(fmod(_n_i_b64,3)) else 4285161074)])
			_n_i_b64 += 1.0
	_S.invoke(_n_p_b0,"glow",[0, (_S.named_value(_n_a_b5,"y") + 10), 26, _S.index_value(_n_C_b3,4), (0.12 + (0.4 * _n_b_b7))])
	_S.invoke(_n_p_b0,"glow",[0, (_S.named_value(_n_a_b5,"y") + 22), 34, _S.index_value(_n_C_b3,3), (0.08 + (0.18 * _n_b_b7))])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,7) if _S.truth((_n_u_b0 > 0.66)) else (_S.index_value(_n_C,5) if _S.truth((_n_u_b0 > 0.33)) else _S.index_value(_n_C,4)))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_at_b1 = _S.arg(_args,1)
	var _n_w_b2 = _S.coalesce(_S.arg(_args,2),func():return 0.06)
	return exp((-pow((float((fmod(((fmod((_n_t_b0 - _n_at_b1),_n_D) + _n_D) + (float(_n_D)/2)),_n_D) - (float(_n_D)/2)))/_n_w_b2),2)))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_pulse = _S.read(_parent,"pulse")
	var _n_LUB = _S.read(_parent,"LUB")
	var _n_DUB = _S.read(_parent,"DUB")
	var _n_t_b0 = _S.arg(_args,0)
	return (_S.call_value(_n_pulse,[_n_t_b0, _n_LUB]) + (0.65 * _S.call_value(_n_pulse,[_n_t_b0, _n_DUB])))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_at_b1 = _S.arg(_args,1)
	return fmod((fmod((_n_t_b0 - _n_at_b1),_n_D) + _n_D),_n_D)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_since = _S.read(_parent,"since")
	var _n_LUB = _S.read(_parent,"LUB")
	var _n_DUB = _S.read(_parent,"DUB")
	var _n_t_b0 = _S.arg(_args,0)
	return _S.logical("||",(_S.call_value(_n_since,[_n_t_b0, (_n_LUB - 0.02)]) < 0.13),func():return (_S.call_value(_n_since,[_n_t_b0, (_n_DUB - 0.02)]) < 0.09))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_shaking = _S.read(_parent,"shaking")
	var _n_t_b0 = _S.arg(_args,0)
	return (0 if _S.truth(_S.call_value(_n_shaking,[_n_t_b0])) else 1)
	return null
