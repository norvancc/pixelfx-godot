@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/cursed.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "tileFbm", _S.import_value("core/index.js", "tileFbm"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "eyes", _S.import_value("fx/status/_lib.js", "eyes"))
	_S.define(_e, "icon", _S.import_value("fx/status/_lib.js", "icon"))
	_S.define(_e, "bitmap", _S.import_value("fx/status/_lib.js", "bitmap"))
	_S.define(_e, "trails", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Cursed"}, {"desc": "Hexed: violet smoke rises off the body in winding trails, a dark stain creeps up from the feet with a glowing edge, the eyes burn, a skull glitches in overhead."}, {"tags": ["status", "curse", "hex", "dark", "debuff", "shadow", "loop"]}, {"size": [64, 84]}, {"origin": [32, 76]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#0c0612", "#1f0f2e", "#3a1a55", "#5e2a85", "#8a3fc0", "#b86ef0", "#e0b0ff", "#ffffff"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HUNCH", _S.merge([{"turn": 1}, {"crouch": 4}, {"lean": 3}, {"hy": 1}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 33)}, {"bx": 8}, {"by": _S.unary("-", 33)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "HUNCH")], [0.6, _S.merge([_S.read(_e, "HUNCH"), {"crouch": 5}])], [1.2, _S.merge([_S.read(_e, "HUNCH"), {"lean": 2}])], [1.8, _S.merge([_S.read(_e, "HUNCH"), {"crouch": 5}])], [2.4, _S.read(_e, "HUNCH")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SKULL", _S.call_value(_S.read(_e, "bitmap"), [["...#####...", ".#########.", "###########", "##eee#eee##", "##eEe#eEe##", "##eee#eee##", "#####.#####", ".####.####.", "..#######..", "..#.#.#.#..", "...#####..."]]))
	_S.define(_e, "IN", 0.5)
	_S.define(_e, "HOLD", 0.75)
	_S.define(_e, "OUT", 1.85)
	_S.define(_e, "GONE", 2.1)
	_S.define(_e, "tide", _S.function_value(_e, "_f6"))
	_S.define(_e, "reach", _S.function_value(_e, "_f7"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_a_b2 = _S.arg(_args,2)
	var _n_S_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_seed_b5 = _S.arg(_args,5)
	var _n_front_b6 = _S.arg(_args,6)
	var _n_spots_b7 = [[0.12, (-1)], [0.1, 1], [0.5, (-1)], [0.48, 1]]
	_S.invoke(_n_spots_b7,"forEach",[_S.function_value(_S.capture(_parent,{"front":_n_front_b6,"S":_n_S_b3,"a":_n_a_b2,"t":_n_t_b4,"C":_n_C_b1,"p":_n_p_b0,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_front = _S.read(_parent,"front")
	var _n_S = _S.read(_parent,"S")
	var _n_a = _S.read(_parent,"a")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_C = _S.read(_parent,"C")
	var _n_p = _S.read(_parent,"p")
	var _tuple_0 = _S.arg(_args,0)
	var _n_q_b0 = _S.prop(_tuple_0,0)
	var _n_side_b1 = _S.prop(_tuple_0,1)
	var _n_j_b2 = _S.arg(_args,1)
	if _S.truth(_S.binary("!==",_S.binary("===",fmod(_n_j_b2,2),0),_n_front)):
		return null
	var _n_my_b3 = floori((_S.named_value(_n_S,"h") * _n_q_b0)+0.5)
	var _tuple_1 = (_S.index_value(_S.named_value(_n_S,"rows"),_n_my_b3) if _S.index_value(_S.named_value(_n_S,"rows"),_n_my_b3)!=null else [0, 0])
	var _n_l_b4 = _S.prop(_tuple_1,0)
	var _n_r_b5 = _S.prop(_tuple_1,1)
	var _n_x0_b6 = (_S.named_value(_n_a,"x") + (_n_l_b4 if _S.truth((_n_side_b1 < 0)) else (_n_r_b5 + 1)))
	var _n_y0_b7 = (_S.named_value(_n_a,"y") + _n_my_b3)
	var _n_life_b8 = 1.6
	var _n_n_b9 = 18
	if true:
		var _n_i_b10 = (_n_n_b9 - 1)
		while _S.truth((_n_i_b10 >= 0)):
			var _n_age_b11 = fmod((fmod(((_n_t - ((float(_n_i_b10)/_n_n_b9) * _n_D)) - (_n_j_b2 * 0.37)),_n_D) + _n_D),_n_D)
			var _n_tb_b12 = (_n_t - _n_age_b11)
			var _n_u_b13 = (float(_n_age_b11)/_n_life_b8)
			if _S.truth((_n_u_b13 >= 1)):
				_n_i_b10 -= 1.0
				continue
			var _n_sway_b14 = ((sin(((((float(_n_tb_b12)/_n_D) * _n_TAU) * 2) + (_n_j_b2 * 1.7))) * 4) * minf(1,(_n_u_b13 * 1.6)))
			var _n_x_b15 = (((_n_x0_b6 + ((_n_side_b1 * _n_u_b13) * 7)) + _n_sway_b14) + (((_S.MathFX.rand([_n_i_b10,_n_j_b2,71]) - 0.5) * 2.5) * _n_u_b13))
			var _n_y_b16 = ((_n_y0_b7 - (_n_age_b11 * 19)) - ((5 * _n_u_b13) * _n_u_b13))
			var _n_rad_b17 = ((1.3 + (3.6 * (1 - pow((1 - _n_u_b13),3)))) * (0.7 + (0.6 * _S.MathFX.rand([_n_i_b10,_n_j_b2,72]))))
			var _n_k_b18 = ((_S.MathFX.smooth(0,0.12,_n_u_b13) * (1 - _S.MathFX.smooth(0.45,1,_n_u_b13))) * (0.5 if _S.truth(_n_front) else 0.62))
			var _n_c_b19 = _S.ColorFX.mix((_S.index_value(_n_C,4) if _S.truth((_S.MathFX.rand([_n_i_b10,_n_j_b2,70]) < 0.5)) else _S.ColorFX.mix(_S.index_value(_n_C,4),_S.index_value(_n_C,3),0.4)),_S.index_value(_n_C,1),(_n_u_b13 * 0.85))
			_S.invoke(_n_p,"disc",[_n_x_b15, _n_y_b16, (_n_rad_b17 * 1.08), _n_c_b19, (_n_k_b18 * 0.4)])
			_S.invoke(_n_p,"disc",[(_n_x_b15 + (_n_rad_b17 * 0.05)), (_n_y_b16 + (_n_rad_b17 * 0.08)), (_n_rad_b17 * 0.76), _n_c_b19, (_n_k_b18 * 0.55)])
			_S.invoke(_n_p,"disc",[(_n_x_b15 - (_n_rad_b17 * 0.22)), (_n_y_b16 - (_n_rad_b17 * 0.3)), (_n_rad_b17 * 0.48), _S.ColorFX.mix(_n_c_b19,_S.index_value(_n_C,6),0.25), ((_n_k_b18 * 0.38) * (1 - (_n_u_b13 * 0.6)))])
			if _S.truth(_S.binary("===",fmod(_n_i_b10,3),0)):
				_S.invoke(_n_p,"glow",[_n_x_b15, _n_y_b16, (_n_rad_b17 * 1.6), _S.index_value(_n_C,4), (0.08 * _n_k_b18)])
			_n_i_b10 -= 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_shape = _S.read(_parent,"shape")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_trails = _S.read(_parent,"trails")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_S_b5 = _S.call_value(_n_shape,[_n_a_b4])
	var _tuple_0 = _S.index_value(_S.named_value(_n_S_b5,"rows"),(_S.named_value(_n_S_b5,"h") - 1))
	var _n_fl_b6 = _S.prop(_tuple_0,0)
	var _n_fr_b7 = _S.prop(_tuple_0,1)
	var _n_cx_b8 = (_S.named_value(_n_a_b4,"x") + (float(((_n_fl_b6 + _n_fr_b7) + 1))/2))
	var _n_rx_b9 = (((float((_n_fr_b7 - _n_fl_b6))/2) + 7) + (2 * sin(((float(_n_t_b1)/_n_D) * _n_TAU))))
	if true:
		var _n_x_b10 = floori(((_n_cx_b8 - _n_rx_b9) - 1))
		while _S.truth((_n_x_b10 <= ((_n_cx_b8 + _n_rx_b9) + 1))):
			var _n_q_b11 = (float(absf(((_n_x_b10 + 0.5) - _n_cx_b8)))/_n_rx_b9)
			var _n_n_b12 = _S.MathFX.rand([_n_x_b10,31])
			if _S.truth((_n_q_b11 > (1 + (_n_n_b12 * 0.12)))):
				_n_x_b10 += 1.0
				continue
			_S.invoke(_n_p_b0,"px",[_n_x_b10, 0, (_S.index_value(_n_C_b3,4) if _S.truth((_n_q_b11 > 0.8)) else (_S.index_value(_n_C_b3,3) if _S.truth((_n_n_b12 < 0.2)) else _S.index_value(_n_C_b3,2)))])
			if _S.truth((_n_q_b11 < 0.85)):
				_S.invoke(_n_p_b0,"px",[_n_x_b10, 1, _S.index_value(_n_C_b3,1)])
			if _S.truth(((_n_n_b12 < 0.7) if _S.truth((_n_q_b11 < 0.55)) else (_n_q_b11 < 0.55))):
				_S.invoke(_n_p_b0,"px",[_n_x_b10, 2, _S.index_value(_n_C_b3,1)])
			_n_x_b10 += 1.0
	_S.invoke(_n_p_b0,"shade",[((_n_cx_b8 - _n_rx_b9) - 6), (-4), ((_n_cx_b8 + _n_rx_b9) + 6), 5, _S.function_value(_S.capture(_parent,{"cx":_n_cx_b8,"rx":_n_rx_b9,"C":_n_C_b3,"this":_this}),"_f3")])
	_S.call_value(_n_trails,[_n_p_b0, _n_C_b3, _n_a_b4, _n_S_b5, _n_t_b1, _S.named_value(_n_o_b2,"seed"), false])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_rx = _S.read(_parent,"rx")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = _S.Bridge.hypot([(float((_n_x_b0 - _n_cx))/(_n_rx + 6)), (float(_n_y_b1)/4)])
	if _S.truth((_n_d_b3 < 1)):
		_S.set_prop(_n_out_b2,"l",_S.index_value(_n_C,4),"=")
		_S.set_prop(_n_out_b2,"k",((0.2 * (1 - _n_d_b3)) * (1 - _n_d_b3)),"=")
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_shape = _S.read(_parent,"shape")
	var _n_colorAt = _S.read(_parent,"colorAt")
	var _n_reach = _S.read(_parent,"reach")
	var _n_eyes = _S.read(_parent,"eyes")
	var _n_trails = _S.read(_parent,"trails")
	var _n_IN = _S.read(_parent,"IN")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_HOLD = _S.read(_parent,"HOLD")
	var _n_OUT = _S.read(_parent,"OUT")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_icon = _S.read(_parent,"icon")
	var _n_tide = _S.read(_parent,"tide")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_S_b5 = _S.call_value(_n_shape,[_n_a_b4])
	var _n_H_b6 = _S.named_value(_n_S_b5,"h")
	for _iter_0 in _S.array(_S.named_value(_n_S_b5,"body")):
		var _tuple_1 = _iter_0
		var _n_mx_b7 = _S.prop(_tuple_1,0)
		var _n_my_b8 = _S.prop(_tuple_1,1)
		var _n_c_b9 = _S.call_value(_n_colorAt,[_n_a_b4, _n_mx_b7, _n_my_b8])
		var _n_up_b10 = (1 - (float((_n_my_b8 + 0.5))/_n_H_b6))
		var _n_lv_b11 = _S.call_value(_n_reach,[_n_mx_b7, _n_t_b1, _S.named_value(_n_o_b2,"seed")])
		if _S.truth((_n_up_b10 > (_n_lv_b11 + 0.035))):
			continue
		var _n_x_b12 = (_S.named_value(_n_a_b4,"x") + _n_mx_b7)
		var _n_y_b13 = (_S.named_value(_n_a_b4,"y") + _n_my_b8)
		if _S.truth((_n_up_b10 > (_n_lv_b11 - 0.02))):
			_S.invoke(_n_p_b0,"px",[_n_x_b12, _n_y_b13, _S.index_value(_n_C_b3,6)])
		else:
			if _S.truth((_n_up_b10 > (_n_lv_b11 - 0.06))):
				_S.invoke(_n_p_b0,"px",[_n_x_b12, _n_y_b13, _S.index_value(_n_C_b3,4)])
			else:
				_S.invoke(_n_p_b0,"px",[_n_x_b12, _n_y_b13, _S.ColorFX.mix(_S.index_value(_n_C_b3,1),_S.index_value(_n_C_b3,3),clampf((_S.ColorFX.luma(_n_c_b9) * 1.6),0.0,1.0))])
	if true:
		var _n_mx_b14 = 0
		while _S.truth((_n_mx_b14 < _S.named_value(_n_S_b5,"w"))):
			var _n_lv_b15 = _S.call_value(_n_reach,[_n_mx_b14, _n_t_b1, _S.named_value(_n_o_b2,"seed")])
			var _n_my_b16 = floori(((1 - _n_lv_b15) * _n_H_b6))
			if _S.truth(_S.invoke(_n_S_b5,"on",[_n_mx_b14, _n_my_b16])):
				_S.invoke(_n_p_b0,"glow",[(_S.named_value(_n_a_b4,"x") + _n_mx_b14), (_S.named_value(_n_a_b4,"y") + _n_my_b16), 4, _S.index_value(_n_C_b3,5), 0.14])
			_n_mx_b14 += 1.0
	for _iter_2 in _S.array(_S.call_value(_n_eyes,[_n_a_b4])):
		var _n_e_b17 = _iter_2
		for _iter_3 in _S.array(_S.named_value(_n_e_b17,"px")):
			var _tuple_4 = _iter_3
			var _n_x_b18 = _S.prop(_tuple_4,0)
			var _n_y_b19 = _S.prop(_tuple_4,1)
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_a_b4,"x") + _n_x_b18), (_S.named_value(_n_a_b4,"y") + _n_y_b19), (_S.index_value(_n_C_b3,7) if _S.truth(_S.binary("===",_n_y_b19,_S.named_value(_n_e_b17,"y0"))) else _S.index_value(_n_C_b3,5))])
		_S.invoke(_n_p_b0,"glow",[(_S.named_value(_n_a_b4,"x") + (float(((_S.named_value(_n_e_b17,"x0") + _S.named_value(_n_e_b17,"x1")) + 1))/2)), (_S.named_value(_n_a_b4,"y") + (float(((_S.named_value(_n_e_b17,"y0") + _S.named_value(_n_e_b17,"y1")) + 1))/2)), 5, _S.index_value(_n_C_b3,5), 0.4])
	_S.call_value(_n_trails,[_n_p_b0, _n_C_b3, _n_a_b4, _n_S_b5, _n_t_b1, _S.named_value(_n_o_b2,"seed"), true])
	if _S.truth(((_n_t_b1 < _n_GONE) if _S.truth((_n_t_b1 >= _n_IN)) else (_n_t_b1 >= _n_IN))):
		var _n_glitch_b20 = ((1 - (float((_n_t_b1 - _n_IN))/(_n_HOLD - _n_IN))) if _S.truth((_n_t_b1 < _n_HOLD)) else ((float((_n_t_b1 - _n_OUT))/(_n_GONE - _n_OUT)) if _S.truth((_n_t_b1 > _n_OUT)) else 0))
		var _n_f_b21 = floori((_n_t_b1 * 30))
		var _n_on_b22 = ((_n_glitch_b20 < 0.15) if _S.truth((_n_glitch_b20 < 0.15)) else (_S.MathFX.rand([_n_f_b21,3]) > (_n_glitch_b20 * 0.6)))
		var _n_x_b23 = 0
		var _n_y_b24 = ((_S.named_value(_n_a_b4,"y") - 12) + (sin((((float(_n_t_b1)/_n_D) * _n_TAU) * 2)) * 1.2))
		if _S.truth(_n_on_b22):
			var _n_tear_b25 = _S.function_value(_S.capture(_parent,{"glitch":_n_glitch_b20,"f":_n_f_b21,"this":_this}),"_f5")
			if _S.truth((_n_glitch_b20 > 0)):
				_S.call_value(_n_icon,[_n_p_b0, (_n_x_b23 - 2), _n_y_b24, 7, _n_tear_b25, [0, _S.index_value(_n_C_b3,2), _S.index_value(_n_C_b3,2), _S.index_value(_n_C_b3,3)], (0.7 * _n_glitch_b20)])
				_S.call_value(_n_icon,[_n_p_b0, (_n_x_b23 + 2), _n_y_b24, 7, _n_tear_b25, [0, _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,6)], (0.5 * _n_glitch_b20)])
			_S.call_value(_n_icon,[_n_p_b0, _n_x_b23, _n_y_b24, 8, _n_tear_b25, [_S.index_value(_n_C_b3,0), _S.index_value(_n_C_b3,4), _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,7)], 1, {"e":_S.index_value(_n_C_b3,0),"E":_S.index_value(_n_C_b3,7)}])
			_S.invoke(_n_p_b0,"glow",[(_n_x_b23 - 3), (_n_y_b24 - 1), 5, _S.index_value(_n_C_b3,5), 0.6])
			_S.invoke(_n_p_b0,"glow",[(_n_x_b23 + 3), (_n_y_b24 - 1), 5, _S.index_value(_n_C_b3,5), 0.6])
			_S.invoke(_n_p_b0,"glow",[_n_x_b23, _n_y_b24, 16, _S.index_value(_n_C_b3,4), (0.24 + (0.3 * _n_glitch_b20))])
		if _S.truth((_n_glitch_b20 > 0.1)):
			if true:
				var _n_k_b26 = 0
				while _S.truth((_n_k_b26 < 3)):
					var _n_ly_b27 = ((_n_y_b24 - 5) + floori((_S.MathFX.rand([_n_f_b21,_n_k_b26,11]) * 11)))
					var _n_lx_b28 = floori(((_S.MathFX.rand([_n_f_b21,_n_k_b26,12]) - 0.5) * 10)+0.5)
					var _n_len_b29 = (3 + floori((_S.MathFX.rand([_n_f_b21,_n_k_b26,13]) * 8)))
					_S.invoke(_n_p_b0,"line",[(_n_lx_b28 - (float(_n_len_b29)/2)), _n_ly_b27, (_n_lx_b28 + (float(_n_len_b29)/2)), _n_ly_b27, (_S.index_value(_n_C_b3,6) if _S.truth(fmod(_n_k_b26,2)) else _S.index_value(_n_C_b3,4)), _n_glitch_b20])
					_n_k_b26 += 1.0
	_S.invoke(_n_p_b0,"glow",[0, (_S.named_value(_n_a_b4,"y") + (_n_H_b6 * (1 - _S.call_value(_n_tide,[_n_t_b1])))), 24, _S.index_value(_n_C_b3,4), 0.2])
	_S.invoke(_n_p_b0,"glow",[0, (_S.named_value(_n_a_b4,"y") + (_n_H_b6 * 0.45)), 30, _S.index_value(_n_C_b3,3), 0.12])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_f = _S.read(_parent,"f")
	var _n_glitch = _S.read(_parent,"glitch")
	var _n_SKULL = _S.read(_parent,"SKULL")
	var _n_dx_b0 = _S.arg(_args,0)
	var _n_dy_b1 = _S.arg(_args,1)
	var _n_row_b2 = (_n_dy_b1 + 6)
	var _n_shift_b3 = (floori((((_S.MathFX.rand([_n_f,_n_row_b2,9]) - 0.5) * 6) * _n_glitch)+0.5) if _S.truth(((_S.MathFX.rand([_n_f,_S.binary(">>",_n_row_b2,1),7]) < (_n_glitch * 0.8)) if _S.truth((_n_glitch > 0)) else (_n_glitch > 0))) else 0)
	return _S.call_value(_n_SKULL,[(_n_dx_b0 - _n_shift_b3), _n_dy_b1])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t_b0 = _S.arg(_args,0)
	return (0.3 + (0.12 * sin(((float(_n_t_b0)/_n_D) * _n_TAU))))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_tide = _S.read(_parent,"tide")
	var _n_D = _S.read(_parent,"D")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_seed_b2 = _S.arg(_args,2)
	return (_S.call_value(_n_tide,[_n_t_b1]) + (0.13 * _S.NoiseKernels.tile_fbm((_n_x_b0 * 0.35),((float(_n_t_b1)/_n_D) * 4),0,4,_n_seed_b2,2)))
	return null
