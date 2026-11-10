@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/haste.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "travel", _S.import_value("fx/status/_lib.js", "travel"))
	_S.define(_e, "levels", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f2"))
	_S.define(_e, "lines", _S.function_value(_e, "_f6"))
	_S.define(_e, "draw", _S.function_value(_e, "_f9"))
	_S.define(_e, "meta", _S.merge([{"name": "Haste"}, {"desc": "Sped up: striped after-images stream out behind, speed lines whip past, dust kicks off the heels and the leading edge catches the wind. Faces right."}, {"tags": ["status", "haste", "speed", "fast", "buff", "directional", "loop"]}, {"size": [100, 56]}, {"origin": [64, 48]}, {"duration": 1.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#4c25ab", "#773ae4", "#5b6cff", "#5eb0ff", "#a3dcff", "#ccf6ff", "#ffffff"]}, {"dust": "#8a8090"}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RUN", _S.merge([{"turn": 0.25}, {"lean": 4}]))
	_S.define(_e, "R1", _S.merge([_S.read(_e, "RUN"), {"crouch": 3}, {"ffx": 12}, {"ffy": _S.unary("-", 5)}, {"fbx": _S.unary("-", 10)}, {"fby": _S.unary("-", 8)}, {"toeB": true}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 19)}, {"bx": 12}, {"by": _S.unary("-", 27)}]))
	_S.define(_e, "R2", _S.merge([_S.read(_e, "RUN"), {"crouch": 1}, {"ffx": 4}, {"ffy": _S.unary("-", 8)}, {"fbx": _S.unary("-", 1)}, {"fby": _S.unary("-", 5)}, {"fx": 3}, {"fy": _S.unary("-", 18)}, {"bx": 5}, {"by": _S.unary("-", 19)}]))
	_S.define(_e, "R3", _S.merge([_S.read(_e, "RUN"), {"crouch": 3}, {"ffx": _S.unary("-", 10)}, {"ffy": _S.unary("-", 8)}, {"toeF": true}, {"fbx": 12}, {"fby": _S.unary("-", 5)}, {"fx": 14}, {"fy": _S.unary("-", 27)}, {"bx": _S.unary("-", 5)}, {"by": _S.unary("-", 19)}]))
	_S.define(_e, "R4", _S.merge([_S.read(_e, "RUN"), {"crouch": 1}, {"ffx": _S.unary("-", 1)}, {"ffy": _S.unary("-", 5)}, {"fbx": 4}, {"fby": _S.unary("-", 8)}, {"fx": 5}, {"fy": _S.unary("-", 19)}, {"bx": 3}, {"by": _S.unary("-", 18)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"poses": [[0, _S.read(_e, "R1")], [0.1, _S.read(_e, "R2"), "snap"], [0.2, _S.read(_e, "R3"), "snap"], [0.3, _S.read(_e, "R4"), "snap"], [0.4, _S.read(_e, "R1"), "snap"], [0.5, _S.read(_e, "R2"), "snap"], [0.6, _S.read(_e, "R3"), "snap"], [0.7, _S.read(_e, "R4"), "snap"], [0.8, _S.read(_e, "R1"), "snap"], [0.9, _S.read(_e, "R2"), "snap"], [1, _S.read(_e, "R3"), "snap"], [1.1, _S.read(_e, "R4"), "snap"], [1.2, _S.read(_e, "R1"), "snap"]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "LEVELS", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_S.define(_e, "seed", _S.function_value(_e, "_f10"))
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_LEVELS = _S.read(_parent,"LEVELS")
	var _n_shape = _S.read(_parent,"shape")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_l_b1 = _S.invoke(_n_LEVELS,"get",[_S.named_value(_n_a_b0,"mask")])
	if _S.truth(_n_l_b1):
		return _n_l_b1
	var _n_S_b2 = _S.call_value(_n_shape,[_n_a_b0])
	_n_l_b1 = _S.invoke(_S.named_value(_n_S_b2,"body"),"map",[_S.function_value(_S.capture(_parent,{"a":_n_a_b0,"this":_this}),"_f1")])
	_S.invoke(_n_LEVELS,"set",[_S.named_value(_n_a_b0,"mask"), _n_l_b1])
	return _n_l_b1
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_colorAt = _S.read(_parent,"colorAt")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_v_b2 = _S.ColorFX.luma(_S.call_value(_n_colorAt,[_n_a, _n_x_b0, _n_y_b1]))
	return [_n_x_b0, _n_y_b1, (1 if _S.truth((_n_v_b2 < 0.24)) else (2 if _S.truth((_n_v_b2 < 0.66)) else 3))]
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_levels = _S.read(_parent,"levels")
	var _n_shape = _S.read(_parent,"shape")
	var _n_lines = _S.read(_parent,"lines")
	var _n_hex = _S.read(_parent,"hex")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_L_b5 = _S.call_value(_n_levels,[_n_a_b4])
	var _n_S_b6 = _S.call_value(_n_shape,[_n_a_b4])
	var _n_f_b7 = floori((_n_t_b1 * 30))
	if true:
		var _n_g_b9 = 3
		while _S.truth((_n_g_b9 >= 1)):
			var _n_dx_b10 = (((-_n_g_b9) * 14) - floori((_S.MathFX.rand([_S.binary(">>",_n_f_b7,1),_n_g_b9,3]) * 1.6)+0.5))
			var _n_every_b11 = _S.index_value([0, 3, 4, 0],_n_g_b9)
			_S.invoke(_n_p_b0,"outline",[_S.named_value(_n_a_b4,"mask"), (_S.named_value(_n_a_b4,"x") + _n_dx_b10), _S.named_value(_n_a_b4,"y"), _S.function_value(_S.capture(_parent,{"g":_n_g_b9,"C":_n_C_b3,"this":_this}),"_f3")])
			if _S.truth(_n_every_b11):
				for _iter_0 in _S.array(_n_L_b5):
					var _tuple_1 = _iter_0
					var _n_x_b12 = _S.prop(_tuple_1,0)
					var _n_y_b13 = _S.prop(_tuple_1,1)
					var _n_v_b14 = _S.prop(_tuple_1,2)
					if _S.truth(fmod((fmod((_n_y_b13 + _n_f_b7),_n_every_b11) + _n_every_b11),_n_every_b11)):
						continue
					_S.invoke(_n_p_b0,"px",[((_S.named_value(_n_a_b4,"x") + _n_x_b12) + _n_dx_b10), (_S.named_value(_n_a_b4,"y") + _n_y_b13), _S.index_value(_n_C_b3,maxf(0,minf(6,(((5 - _n_g_b9) + _n_v_b14) - 2))))])
			_S.invoke(_n_p_b0,"glow",[((_S.named_value(_n_a_b4,"x") + (float(_S.named_value(_n_a_b4,"w"))/2)) + _n_dx_b10), (_S.named_value(_n_a_b4,"y") + (_S.named_value(_n_a_b4,"h") * 0.45)), 16, _S.index_value(_n_C_b3,3), (0.12 * (1 - (_n_g_b9 * 0.25)))])
			_n_g_b9 -= 1.0
	for _iter_2 in _S.array(_S.named_value(_n_S_b6,"side")):
		var _tuple_3 = _iter_2
		var _n_x_b15 = _S.prop(_tuple_3,0)
		var _n_y_b16 = _S.prop(_tuple_3,1)
		var _n_dir_b17 = _S.prop(_tuple_3,2)
		if _S.truth(((_n_dir_b17 > 0) if _S.truth((_n_dir_b17 > 0)) else fmod((_n_y_b16 + _S.binary(">>",_n_f_b7,1)),3))):
			continue
		var _n_len_b18 = (3 + floori((_S.MathFX.rand([_n_y_b16,_S.binary(">>",_n_f_b7,1),5]) * 6)))
		if true:
			var _n_d_b19 = 1
			while _S.truth((_n_d_b19 <= _n_len_b18)):
				_S.invoke(_n_p_b0,"dot",[((_S.named_value(_n_a_b4,"x") + _n_x_b15) - _n_d_b19), (_S.named_value(_n_a_b4,"y") + _n_y_b16), (_S.index_value(_n_C_b3,5) if _S.truth((_n_d_b19 < 3)) else _S.index_value(_n_C_b3,4)), (1 - (float(_n_d_b19)/(_n_len_b18 + 1)))])
				_n_d_b19 += 1.0
	_S.call_value(_n_lines,[_n_p_b0, _n_C_b3, _n_a_b4, _n_t_b1, _S.named_value(_n_o_b2,"seed"), false])
	var _n_dust_b8 = _S.call_value(_n_hex,[_S.named_value(_n_o_b2,"dust")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 12, (_S.named_value(_n_o_b2,"seed") + 5), _S.function_value(_S.capture(_parent,{"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"dust":_n_dust_b8,"C":_n_C_b3,"this":_this}),"_f5")])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_g = _S.read(_parent,"g")
	var _n_C = _S.read(_parent,"C")
	var _n_mx_b0 = _S.arg(_args,0)
	var _n_my_b1 = _S.arg(_args,1)
	return (0 if _S.truth((fmod((_n_mx_b0 + _n_my_b1),2) if _S.truth(_S.binary("===",_n_g,3)) else _S.binary("===",_n_g,3))) else _S.index_value(_n_C,(5 - _n_g)))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.45, 0.7])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_travel = _S.read(_parent,"travel")
	var _n_p = _S.read(_parent,"p")
	var _n_dust = _S.read(_parent,"dust")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_u_b4 = (float(_n_age_b0)/_n_life_b1)
	var _n_foot_b5 = ((-7) if _S.truth(fmod(_n_i_b3,2)) else 3)
	var _n_x_b6 = (_n_foot_b5 + _S.call_value(_n_travel,[(-_S.invoke(_n_r_b2,"range",[50, 100])), 0, 3.5, _n_age_b0]))
	var _n_y_b7 = ((-1.5) - _S.call_value(_n_travel,[_S.invoke(_n_r_b2,"range",[6, 18]), 0, 3.5, _n_age_b0]))
	var _n_rad_b8 = (_S.invoke(_n_r_b2,"range",[2.6, 4.6]) * (0.6 + (1 * _n_u_b4)))
	var _n_k_b9 = (pow((1 - _n_u_b4),1.2) * minf(1,(_n_u_b4 * 10)))
	_S.invoke(_n_p,"disc",[_n_x_b6, _n_y_b7, _n_rad_b8, _n_dust, (_n_k_b9 * 0.5)])
	_S.invoke(_n_p,"disc",[(_n_x_b6 + (_n_rad_b8 * 0.05)), (_n_y_b7 + (_n_rad_b8 * 0.08)), (_n_rad_b8 * 0.74), _n_dust, (_n_k_b9 * 0.62)])
	_S.invoke(_n_p,"disc",[(_n_x_b6 - (_n_rad_b8 * 0.22)), (_n_y_b7 - (_n_rad_b8 * 0.3)), (_n_rad_b8 * 0.5), _S.index_value(_n_C,5), (_n_k_b9 * 0.25)])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_a_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_seed_b4 = _S.arg(_args,4)
	var _n_front_b5 = _S.arg(_args,5)
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, (5 if _S.truth(_n_front_b5) else 11), (_n_seed_b4 + (9 if _S.truth(_n_front_b5) else 7)), _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), _S.function_value(_S.capture(_parent,{"a":_n_a_b2,"front":_n_front_b5,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f8")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.12, 0.26])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_front = _S.read(_parent,"front")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_y_b4 = (_S.named_value(_n_a,"y") + _S.invoke(_n_r_b2,"range",[2, (_S.named_value(_n_a,"h") - 3)]))
	var _n_len_b5 = (_S.invoke(_n_r_b2,"range",[10, 26]) * (0.7 if _S.truth(_n_front) else 1))
	var _n_x_b6 = (_S.invoke(_n_r_b2,"range",[(-14), 4]) - (_n_age_b0 * _S.invoke(_n_r_b2,"range",[160, 240])))
	if true:
		var _n_d_b7 = 0
		while _S.truth((_n_d_b7 < _n_len_b5)):
			if _S.truth((fmod(_n_d_b7,2) if _S.truth((_n_d_b7 > (_n_len_b5 * 0.45))) else (_n_d_b7 > (_n_len_b5 * 0.45)))):
				_n_d_b7 += 1.0
				continue
			_S.invoke(_n_p,"dot",[(_n_x_b6 + _n_d_b7), _n_y_b4, (_S.index_value(_n_C,6) if _S.truth((_n_d_b7 < 2)) else (_S.index_value(_n_C,5) if _S.truth((_n_d_b7 < (_n_len_b5 * 0.4))) else _S.index_value(_n_C,3))), (((1 - (float(_n_d_b7)/_n_len_b5)) * (1 - _n_u_b3)) * (0.7 if _S.truth(_n_front) else 1.1))])
			_n_d_b7 += 1.0
	_S.invoke(_n_p,"light",[_n_x_b6, _n_y_b4, _S.index_value(_n_C,4), (0.4 * (1 - _n_u_b3))])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_shape = _S.read(_parent,"shape")
	var _n_lines = _S.read(_parent,"lines")
	var _n_seed = _S.read(_parent,"seed")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_S_b5 = _S.call_value(_n_shape,[_n_a_b4])
	for _iter_0 in _S.array(_S.named_value(_n_S_b5,"side")):
		var _tuple_1 = _iter_0
		var _n_x_b6 = _S.prop(_tuple_1,0)
		var _n_y_b7 = _S.prop(_tuple_1,1)
		var _n_dir_b8 = _S.prop(_tuple_1,2)
		if _S.truth(((_S.MathFX.rand([_n_x_b6,_n_y_b7,floori((_n_t_b1 * 15))]) < 0.85) if _S.truth((_n_dir_b8 > 0)) else (_n_dir_b8 > 0))):
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_a_b4,"x") + _n_x_b6), (_S.named_value(_n_a_b4,"y") + _n_y_b7), (_S.index_value(_n_C_b3,6) if _S.truth((_S.MathFX.rand([_n_y_b7,floori((_n_t_b1 * 15)),2]) < 0.3)) else _S.index_value(_n_C_b3,5))])
	_S.call_value(_n_lines,[_n_p_b0, _n_C_b3, _n_a_b4, _n_t_b1, _S.call_value(_n_seed,[_n_o_b2]), true])
	_S.invoke(_n_p_b0,"glow",[(-6), (_S.named_value(_n_a_b4,"y") + (_S.named_value(_n_a_b4,"h") * 0.5)), 22, _S.index_value(_n_C_b3,3), 0.16])
	_S.invoke(_n_p_b0,"glow",[0, (_S.named_value(_n_a_b4,"y") + (_S.named_value(_n_a_b4,"h") * 0.45)), 30, _S.index_value(_n_C_b3,3), 0.16])
	_S.invoke(_n_p_b0,"glow",[(_S.named_value(_n_a_b4,"x") + _S.named_value(_n_a_b4,"w")), (_S.named_value(_n_a_b4,"y") + (_S.named_value(_n_a_b4,"h") * 0.5)), 10, _S.index_value(_n_C_b3,5), (0.12 + (0.06 * sin((((float(_n_t_b1)/_n_D) * _n_TAU) * 3))))])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_o_b0 = _S.arg(_args,0)
	return _S.named_value(_n_o_b0,"seed")
	return null
