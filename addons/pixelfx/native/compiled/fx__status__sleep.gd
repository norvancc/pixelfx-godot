@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/sleep.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "icon", _S.import_value("fx/status/_lib.js", "icon"))
	_S.define(_e, "bitmap", _S.import_value("fx/status/_lib.js", "bitmap"))
	_S.define(_e, "eyes", _S.import_value("fx/status/_lib.js", "eyes"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "zAt", _S.function_value(_e, "_f0"))
	_S.define(_e, "shut", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Sleep"}, {"desc": "Fast asleep: eyes shut, soft outlined Zs float up off the head one after another, swaying and growing as they rise, dream motes drift, a slow breathing glow."}, {"tags": ["status", "sleep", "zzz", "rest", "debuff", "loop"]}, {"size": [60, 82]}, {"origin": [26, 74]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#1a1636", "#3c3a7a", "#6f78c8", "#a9b8f0", "#dfe6ff", "#ffffff"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "NOD", _S.merge([{"turn": 0.9}, {"crouch": 1}, {"lean": 1}, {"hy": 2}, {"fx": _S.unary("-", 6)}, {"fy": _S.unary("-", 14)}, {"bx": 7}, {"by": _S.unary("-", 14)}, {"ffx": _S.unary("-", 2)}, {"fbx": 3}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "NOD")], [1.2, _S.merge([_S.read(_e, "NOD"), {"crouch": 2}, {"lean": 2}, {"hy": 3}])], [2.4, _S.read(_e, "NOD")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NZ", 3)
	_S.define(_e, "ZS", _S.invoke([["#####", "...#.", "..#..", ".#...", "#####"], ["#######", ".....#.", "....#..", "...#...", "..#....", ".#.....", "#######"], [".#######.", "#########", "......##.", ".....##..", "....##...", "...##....", "..##.....", "#########", ".#######."], [".#########.", "###########", ".......###.", "......###..", ".....###...", "....###....", "...###.....", "..###......", ".###.......", "###########", ".#########."]], "map", [_S.function_value(_e, "_f7")]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_u_b2 = _S.arg(_args,2)
	var _n_side_b3 = (1 if _S.truth(fmod(_n_i_b1,2)) else 0.6)
	var _n_x0_b4 = (_S.named_value(_n_a_b0,"x") + (_S.named_value(_n_a_b0,"w") * 0.78))
	var _n_y0_b5 = (_S.named_value(_n_a_b0,"y") + 7)
	var _n_x_b6 = ((_n_x0_b4 + ((13 * _n_side_b3) * _n_u_b2)) + (2.5 * sin((((_n_TAU * 1.1) * _n_u_b2) + (_n_i_b1 * 2.1)))))
	var _n_y_b7 = (_n_y0_b5 - (32 * (1 - pow((1 - _n_u_b2),1.35))))
	var _n_size_b8 = (0 if _S.truth((_n_u_b2 < 0.18)) else (1 if _S.truth((_n_u_b2 < 0.42)) else (2 if _S.truth((_n_u_b2 < 0.68)) else 3)))
	var _n_k_b9 = minf(1,(float(_n_u_b2)/0.06))
	return {"x":_n_x_b6,"y":_n_y_b7,"size":_n_size_b8,"k":_n_k_b9}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_colorAt = _S.read(_parent,"colorAt")
	var _n_eyes = _S.read(_parent,"eyes")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	for _iter_0 in _S.array(_S.call_value(_n_eyes,[_n_a_b1])):
		var _n_e_b2 = _iter_0
		for _iter_1 in _S.array(_S.named_value(_n_e_b2,"px")):
			var _tuple_2 = _iter_1
			var _n_x_b5 = _S.prop(_tuple_2,0)
			var _n_y_b6 = _S.prop(_tuple_2,1)
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_a_b1,"x") + _n_x_b5), (_S.named_value(_n_a_b1,"y") + _n_y_b6), _S.named_value(_n_e_b2,"skin")])
		var _n_lid_b3 = _S.logical("||",_S.call_value(_n_colorAt,[_n_a_b1, (_S.named_value(_n_e_b2,"x0") - 1), (_S.named_value(_n_e_b2,"y0") - 4)]),func():return _S.call_value(_n_colorAt,[_n_a_b1, _S.index_value(_S.index_value(_S.named_value(_n_e_b2,"px"),0),0), _S.index_value(_S.index_value(_S.named_value(_n_e_b2,"px"),0),1)]))
		var _n_y_b4 = ((_S.named_value(_n_a_b1,"y") + _S.named_value(_n_e_b2,"y1")) - 1)
		if true:
			var _n_x_b7 = _S.named_value(_n_e_b2,"x0")
			while _S.truth((_n_x_b7 <= _S.named_value(_n_e_b2,"x1"))):
				_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_a_b1,"x") + _n_x_b7), _n_y_b4, 4280227622])
				_n_x_b7 += 1.0
		_S.invoke(_n_p_b0,"px",[((_S.named_value(_n_a_b1,"x") + _S.named_value(_n_e_b2,"x0")) - 1), (_n_y_b4 - 1), 4280227622])
		_S.invoke(_n_p_b0,"px",[((_S.named_value(_n_a_b1,"x") + _S.named_value(_n_e_b2,"x1")) + 1), (_n_y_b4 - 1), 4280227622])
		_n_lid_b3
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_shut = _S.read(_parent,"shut")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_NZ = _S.read(_parent,"NZ")
	var _n_zAt = _S.read(_parent,"zAt")
	var _n_ZS = _S.read(_parent,"ZS")
	var _n_icon = _S.read(_parent,"icon")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),6)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_breath_b5 = (0.5 + (0.5 * sin((((float(_n_t_b1)/_n_D) * _n_TAU) * 2))))
	_S.call_value(_n_shut,[_n_p_b0, _n_a_b4])
	_S.invoke(_n_p_b0,"glow",[0, (_S.named_value(_n_a_b4,"y") + 10), 24, _S.index_value(_n_C_b3,3), (0.1 + (0.1 * _n_breath_b5))])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 5, (_S.named_value(_n_o_b2,"seed") + 6), _n_D, _S.function_value(_S.capture(_parent,{"a":_n_a_b4,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f3")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 14, (_S.named_value(_n_o_b2,"seed") + 4), _S.function_value(_S.capture(_parent,{"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"a":_n_a_b4,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f5")])
	var _n_zs_b6 = []
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < _n_NZ)):
			_S.invoke(_n_zs_b6,"push",[{"i":_n_i_b7,"u":(float(fmod((fmod((_n_t_b1 - (float((_n_i_b7 * _n_D))/_n_NZ)),_n_D) + _n_D),_n_D))/_n_D)}])
			_n_i_b7 += 1.0
	_S.invoke(_n_zs_b6,"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f6")])
	for _iter_0 in _S.array(_n_zs_b6):
		var _object_1 = _iter_0
		var _n_i_b8 = _S.named_value(_object_1,"i")
		var _n_u_b9 = _S.named_value(_object_1,"u")
		var _n_z_b10 = _S.call_value(_n_zAt,[_n_a_b4, _n_i_b8, _n_u_b9])
		if _S.truth((_n_u_b9 > 0.9)):
			var _n_k_b13 = (float((_n_u_b9 - 0.9))/0.1)
			if true:
				var _n_j_b14 = 0
				while _S.truth((_n_j_b14 < 7)):
					var _n_an_b15 = (((float(_n_j_b14)/7) * _n_TAU) + _n_i_b8)
					var _n_d_b16 = (3 + (6 * sqrt(_n_k_b13)))
					_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_z_b10,"x") + (cos(_n_an_b15) * _n_d_b16)), (_S.named_value(_n_z_b10,"y") + ((sin(_n_an_b15) * _n_d_b16) * 0.8)), (_S.index_value(_n_C_b3,4) if _S.truth(fmod(_n_j_b14,2)) else _S.index_value(_n_C_b3,5)), (1.2 - _n_k_b13)])
					_n_j_b14 += 1.0
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_z_b10,"x"), _S.named_value(_n_z_b10,"y"), 10, _S.index_value(_n_C_b3,3), (0.25 * (1 - _n_k_b13))])
			continue
		if true:
			var _n_j_b17 = 1
			while _S.truth((_n_j_b17 <= 6)):
				var _n_q_b18 = _S.call_value(_n_zAt,[_n_a_b4, _n_i_b8, maxf(0,(_n_u_b9 - (_n_j_b17 * 0.025)))])
				if _S.truth((_S.binary("===",fmod(_n_j_b17,2),0) if _S.truth(_S.binary("===",fmod(_n_j_b17,2),0)) else ((_n_u_b9 - (_n_j_b17 * 0.025)) < 0.05))):
					_n_j_b17 += 1.0
					continue
				_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_q_b18,"x") - 1), ((_S.named_value(_n_q_b18,"y") + 4) + _S.named_value(_n_q_b18,"size")), _S.index_value(_n_C_b3,3), ((1 - (float(_n_j_b17)/7)) * 0.9)])
				_n_j_b17 += 1.0
		var _n_old_b11 = (1 if _S.truth((_n_u_b9 > 0.78)) else 0)
		var _n_R_b12 = ([_S.index_value(_n_C_b3,0), _S.index_value(_n_C_b3,1), _S.index_value(_n_C_b3,2), _S.index_value(_n_C_b3,3)] if _S.truth(_n_old_b11) else [_S.index_value(_n_C_b3,1), _S.index_value(_n_C_b3,2), _S.index_value(_n_C_b3,3), _S.index_value(_n_C_b3,4)])
		_S.call_value(_n_icon,[_n_p_b0, _S.named_value(_n_z_b10,"x"), _S.named_value(_n_z_b10,"y"), 7, _S.index_value(_n_ZS,_S.named_value(_n_z_b10,"size")), _n_R_b12, _S.named_value(_n_z_b10,"k")])
		if _S.truth(not _S.truth(_n_old_b11)):
			_S.invoke(_n_p_b0,"px",[((_S.named_value(_n_z_b10,"x") - 2) - _S.named_value(_n_z_b10,"size")), ((_S.named_value(_n_z_b10,"y") - 2) - (_S.named_value(_n_z_b10,"size") * 0.8)), _S.index_value(_n_C_b3,5)])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_z_b10,"x"), _S.named_value(_n_z_b10,"y"), (7 + (_S.named_value(_n_z_b10,"size") * 3)), _S.index_value(_n_C_b3,3), ((0.12 if _S.truth(_n_old_b11) else 0.26) * _S.named_value(_n_z_b10,"k"))])
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
	var _n_x_b4 = ((_S.named_value(_n_a,"x") + (_S.named_value(_n_a,"w") * _S.invoke(_n_r_b2,"range",[0.3, 1.1]))) + (sin(((_n_u_b3 * _n_TAU) + (_S.invoke(_n_r_b2,"next",[]) * _n_TAU))) * 3))
	var _n_y_b5 = ((_S.named_value(_n_a,"y") + _S.invoke(_n_r_b2,"range",[(-6), 8])) - (_n_u_b3 * 10))
	var _n_rad_b6 = (_S.invoke(_n_r_b2,"range",[3, 5]) * (0.8 + (0.4 * _n_u_b3)))
	var _n_k_b7 = sin((PI * _n_u_b3))
	_S.invoke(_n_p,"glow",[_n_x_b4, _n_y_b5, (_n_rad_b6 * 2.4), _S.index_value(_n_C,3), (0.1 * _n_k_b7)])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.2, 2])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_x_b4 = ((_S.named_value(_n_a,"x") + (_S.named_value(_n_a,"w") * _S.invoke(_n_r_b2,"range",[0.4, 1.1]))) + (sin(((_n_age_b0 * 2) + (_S.invoke(_n_r_b2,"next",[]) * _n_TAU))) * 2))
	var _n_y_b5 = ((_S.named_value(_n_a,"y") + _S.invoke(_n_r_b2,"range",[0, 10])) - (_n_age_b0 * _S.invoke(_n_r_b2,"range",[10, 18])))
	var _n_tw_b6 = (sin((PI * _n_u_b3)) * (0.6 + (0.4 * sin(((_n_age_b0 * 9) + (_S.invoke(_n_r_b2,"next",[]) * _n_TAU))))))
	if _S.truth((_n_tw_b6 < 0.15)):
		return null
	_S.call_value(_n_sparkle,[_n_p, _n_x_b4, _n_y_b5, (1 if _S.truth(((_S.invoke(_n_r_b2,"next",[]) < 0.4) if _S.truth((_n_tw_b6 > 0.7)) else (_n_tw_b6 > 0.7))) else 0), _S.index_value(_n_C,4), _S.index_value(_n_C,3), (0.3 * _n_tw_b6)])
	_S.invoke(_n_p,"dot",[_n_x_b4, _n_y_b5, (_S.index_value(_n_C,5) if _S.truth((_n_tw_b6 > 0.6)) else _S.index_value(_n_C,4)), (_n_tw_b6 * 1.3)])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_p1_b0 = _S.arg(_args,0)
	var _n_p2_b1 = _S.arg(_args,1)
	return (_S.named_value(_n_p2_b1,"u") - _S.named_value(_n_p1_b0,"u"))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_bitmap = _S.read(_parent,"bitmap")
	var _n_rows_b0 = _S.arg(_args,0)
	return _S.call_value(_n_bitmap,[_n_rows_b0])
	return null
