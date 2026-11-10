@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/charmed.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "icon", _S.import_value("fx/status/_lib.js", "icon"))
	_S.define(_e, "bitmap", _S.import_value("fx/status/_lib.js", "bitmap"))
	_S.define(_e, "shaped", _S.import_value("fx/status/_lib.js", "shaped"))
	_S.define(_e, "heartShape", _S.import_value("fx/status/_lib.js", "heartShape"))
	_S.define(_e, "eyes", _S.import_value("fx/status/_lib.js", "eyes"))
	_S.define(_e, "hearts", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Charmed"}, {"desc": "Smitten: a big heart beats over the head, throwing a ring and a flush of light with every beat, little hearts float up, the eyes go pink and the cheeks blush."}, {"tags": ["status", "charm", "love", "hearts", "debuff", "loop"]}, {"size": [60, 76]}, {"origin": [30, 68]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#3a0a1e", "#7a1238", "#c4245a", "#f04e86", "#ff8ab0", "#ffc8da", "#ffffff"]}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SWOON", _S.merge([{"turn": 1.1}, {"fx": _S.unary("-", 2)}, {"fy": _S.unary("-", 28)}, {"bx": 2}, {"by": _S.unary("-", 28)}, {"armsFront": true}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.merge([_S.read(_e, "SWOON"), {"lean": _S.unary("-", 2)}])], [0.6, _S.merge([_S.read(_e, "SWOON"), {"lean": 0}, {"crouch": 1}])], [1.2, _S.merge([_S.read(_e, "SWOON"), {"lean": 2}])], [1.8, _S.merge([_S.read(_e, "SWOON"), {"lean": 0}, {"crouch": 1}])], [2.4, _S.merge([_S.read(_e, "SWOON"), {"lean": _S.unary("-", 2)}])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "BEAT", _S.binary("/", _S.read(_e, "D"), 2))
	_S.define(_e, "HEART5", _S.call_value(_S.read(_e, "bitmap"), [[".#.#.", "#####", "#####", ".###.", "..#.."]]))
	_S.define(_e, "HEART7", _S.call_value(_S.read(_e, "bitmap"), [[".##.##.", "#######", "#######", ".#####.", "..###..", "...#..."]]))
	_S.define(_e, "thump", _S.function_value(_e, "_f7"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_a_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_seed_b4 = _S.arg(_args,4)
	var _n_back_b5 = _S.arg(_args,5)
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, 12, (_n_seed_b4 + 4), _S.function_value(_S.capture(_parent,{"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"back":_n_back_b5,"a":_n_a_b2,"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f2")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.3, 1.9])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_back = _S.read(_parent,"back")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_a = _S.read(_parent,"a")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_HEART7 = _S.read(_parent,"HEART7")
	var _n_HEART5 = _S.read(_parent,"HEART5")
	var _n_icon = _S.read(_parent,"icon")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	if _S.truth(_S.binary("!==",_S.binary("===",fmod(_n_i_b3,3),0),_n_back)):
		return null
	var _n_u_b4 = (float(_n_age_b0)/_n_life_b1)
	var _n_side_b5 = ((-1) if _S.truth((_S.invoke(_n_r_b2,"next",[]) < 0.5)) else 1)
	var _n_ph_b6 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_big_b7 = (_S.invoke(_n_r_b2,"next",[]) < 0.3)
	var _n_x_b8 = ((_n_side_b5 * _S.invoke(_n_r_b2,"range",[4, 15])) + (sin(((_n_age_b0 * 4) + _n_ph_b6)) * 2.2))
	var _n_y_b9 = ((_S.named_value(_n_a,"y") + _S.invoke(_n_r_b2,"range",[8, 30])) - (_n_age_b0 * _S.invoke(_n_r_b2,"range",[14, 22])))
	var _n_k_b10 = minf(1,(_n_u_b4 * 6))
	if _S.truth((_n_u_b4 > 0.88)):
		var _n_q_b12 = (float((_n_u_b4 - 0.88))/0.12)
		_S.call_value(_n_sparkle,[_n_p, _n_x_b8, _n_y_b9, floori((2 * (1 - _n_q_b12))+0.5), _S.index_value(_n_C,5), _S.index_value(_n_C,4), (0.4 * (1 - _n_q_b12))])
		return null
	var _n_R_b11 = ([_S.index_value(_n_C,0), _S.index_value(_n_C,1), _S.index_value(_n_C,2), _S.index_value(_n_C,3)] if _S.truth(_n_back) else [_S.index_value(_n_C,0), _S.index_value(_n_C,2), _S.index_value(_n_C,3), _S.index_value(_n_C,4)])
	_S.call_value(_n_icon,[_n_p, _n_x_b8, _n_y_b9, 4, (_n_HEART7 if _S.truth(_n_big_b7) else _n_HEART5), _n_R_b11, _n_k_b10])
	if _S.truth(not _S.truth(_n_back)):
		_S.invoke(_n_p,"px",[(_n_x_b8 - (2 if _S.truth(_n_big_b7) else 1)), (_n_y_b9 - 1), _S.index_value(_n_C,6)])
	_S.invoke(_n_p,"glow",[_n_x_b8, _n_y_b9, 6, _S.index_value(_n_C,3), ((0.12 if _S.truth(_n_back) else 0.22) * _n_k_b10)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_BEAT = _S.read(_parent,"BEAT")
	var _n_thump = _S.read(_parent,"thump")
	var _n_hearts = _S.read(_parent,"hearts")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_ph_b5 = fmod((fmod(_n_t_b1,_n_BEAT) + _n_BEAT),_n_BEAT)
	var _n_th_b6 = _S.call_value(_n_thump,[_n_ph_b5])
	_S.invoke(_n_p_b0,"glow",[0, (_S.named_value(_n_a_b4,"y") - 8), (26 + (8 * _n_th_b6)), _S.index_value(_n_C_b3,3), (0.16 + (0.22 * _n_th_b6))])
	_S.call_value(_n_hearts,[_n_p_b0, _n_C_b3, _n_a_b4, _n_t_b1, _S.named_value(_n_o_b2,"seed"), true])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_BEAT = _S.read(_parent,"BEAT")
	var _n_thump = _S.read(_parent,"thump")
	var _n_eyes = _S.read(_parent,"eyes")
	var _n_hearts = _S.read(_parent,"hearts")
	var _n_heartShape = _S.read(_parent,"heartShape")
	var _n_shaped = _S.read(_parent,"shaped")
	var _n_icon = _S.read(_parent,"icon")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_ph_b5 = fmod((fmod(_n_t_b1,_n_BEAT) + _n_BEAT),_n_BEAT)
	var _n_th_b6 = _S.call_value(_n_thump,[_n_ph_b5])
	for _iter_0 in _S.array(_S.call_value(_n_eyes,[_n_a_b4])):
		var _n_e_b10 = _iter_0
		for _iter_1 in _S.array(_S.named_value(_n_e_b10,"px")):
			var _tuple_2 = _iter_1
			var _n_x_b14 = _S.prop(_tuple_2,0)
			var _n_y_b15 = _S.prop(_tuple_2,1)
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_a_b4,"x") + _n_x_b14), (_S.named_value(_n_a_b4,"y") + _n_y_b15), (_S.index_value(_n_C_b3,3) if _S.truth(_S.binary("===",_n_y_b15,_S.named_value(_n_e_b10,"y0"))) else _S.index_value(_n_C_b3,2))])
		_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_a_b4,"x") + _S.named_value(_n_e_b10,"x0")), ((_S.named_value(_n_a_b4,"y") + _S.named_value(_n_e_b10,"y0")) + 1), _S.index_value(_n_C_b3,6)])
		var _n_blush_b11 = _S.ColorFX.mix(_S.named_value(_n_e_b10,"skin"),_S.index_value(_n_C_b3,3),0.55)
		var _n_out_b12 = ((-1) if _S.truth((_S.named_value(_n_e_b10,"x0") < (float(_S.named_value(_n_a_b4,"w"))/2))) else 1)
		var _n_bx_b13 = ((_S.named_value(_n_e_b10,"x0") - 1) if _S.truth((_n_out_b12 < 0)) else _S.named_value(_n_e_b10,"x1"))
		_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_a_b4,"x") + _n_bx_b13), ((_S.named_value(_n_a_b4,"y") + _S.named_value(_n_e_b10,"y1")) + 1), _n_blush_b11])
		_S.invoke(_n_p_b0,"px",[((_S.named_value(_n_a_b4,"x") + _n_bx_b13) + 1), ((_S.named_value(_n_a_b4,"y") + _S.named_value(_n_e_b10,"y1")) + 1), _n_blush_b11])
	_S.call_value(_n_hearts,[_n_p_b0, _n_C_b3, _n_a_b4, _n_t_b1, _S.named_value(_n_o_b2,"seed"), false])
	var _n_hx_b7 = 0
	var _n_hy_b8 = (_S.named_value(_n_a_b4,"y") - 10)
	var _n_s_b9 = (5.6 * (1 + (0.24 * _n_th_b6)))
	for _iter_3 in _S.array([[0.04, 1], [0.26, 0.6]]):
		var _tuple_4 = _iter_3
		var _n_t0_b16 = _S.prop(_tuple_4,0)
		var _n_kk_b17 = _S.prop(_tuple_4,1)
		var _n_u_b18 = (float((_n_ph_b5 - _n_t0_b16))/0.5)
		if _S.truth(((_n_u_b18 < 0) if _S.truth((_n_u_b18 < 0)) else (_n_u_b18 > 1))):
			continue
		var _n_S1_b19 = (5.6 * (1.25 + (1.3 * _n_u_b18)))
		var _n_outer_b20 = _S.call_value(_n_shaped,[_n_heartShape, _n_S1_b19])
		var _n_inner_b21 = _S.call_value(_n_shaped,[_n_heartShape, (_n_S1_b19 - 1.3)])
		var _n_E_b22 = (ceili((_n_S1_b19 * 1.2)) + 1)
		if true:
			var _n_dy_b23 = (-_n_E_b22)
			while _S.truth((_n_dy_b23 <= _n_E_b22)):
				if true:
					var _n_dx_b24 = (-_n_E_b22)
					while _S.truth((_n_dx_b24 <= _n_E_b22)):
						if _S.truth(_S.logical("&&",_S.call_value(_n_outer_b20,[_n_dx_b24, _n_dy_b23]),func():return not _S.truth(_S.call_value(_n_inner_b21,[_n_dx_b24, _n_dy_b23])))):
							_S.invoke(_n_p_b0,"dot",[(_n_hx_b7 + _n_dx_b24), (_n_hy_b8 + _n_dy_b23), (_S.index_value(_n_C_b3,5) if _S.truth((_n_u_b18 < 0.3)) else _S.index_value(_n_C_b3,4)), (((1 - _n_u_b18) * _n_kk_b17) * 1.3)])
						_n_dx_b24 += 1.0
				_n_dy_b23 += 1.0
	_S.call_value(_n_icon,[_n_p_b0, _n_hx_b7, _n_hy_b8, 9, _S.call_value(_n_shaped,[_n_heartShape, _n_s_b9]), [_S.index_value(_n_C_b3,0), _S.index_value(_n_C_b3,2), _S.index_value(_n_C_b3,3), _S.index_value(_n_C_b3,4)]])
	_S.invoke(_n_p_b0,"px",[(_n_hx_b7 - floori((_n_s_b9 * 0.55)+0.5)), (_n_hy_b8 - floori((_n_s_b9 * 0.45)+0.5)), _S.index_value(_n_C_b3,6)])
	_S.invoke(_n_p_b0,"px",[((_n_hx_b7 - floori((_n_s_b9 * 0.55)+0.5)) + 1), (_n_hy_b8 - floori((_n_s_b9 * 0.45)+0.5)), _S.index_value(_n_C_b3,5)])
	_S.invoke(_n_p_b0,"px",[(_n_hx_b7 - floori((_n_s_b9 * 0.55)+0.5)), ((_n_hy_b8 - floori((_n_s_b9 * 0.45)+0.5)) + 1), _S.index_value(_n_C_b3,5)])
	_S.invoke(_n_p_b0,"glow",[_n_hx_b7, _n_hy_b8, (12 + (6 * _n_th_b6)), _S.index_value(_n_C_b3,4), (0.3 + (0.4 * _n_th_b6))])
	if _S.truth((_n_th_b6 > 0.5)):
		_S.call_value(_n_sparkle,[_n_p_b0, (_n_hx_b7 + (_n_s_b9 * 0.9)), (_n_hy_b8 - (_n_s_b9 * 0.8)), floori((3 * _n_th_b6)+0.5), _S.index_value(_n_C_b3,5), _S.index_value(_n_C_b3,4), (0.4 * _n_th_b6)])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 8, (_S.named_value(_n_o_b2,"seed") + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"hx":_n_hx_b7,"hy":_n_hy_b8,"C":_n_C_b3,"this":_this}),"_f6")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.3, 0.5])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_hx = _S.read(_parent,"hx")
	var _n_hy = _S.read(_parent,"hy")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_an_b3 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_d_b4 = _S.invoke(_n_r_b2,"range",[8, 15])
	var _n_u_b5 = (float(_n_age_b0)/_n_life_b1)
	_S.call_value(_n_sparkle,[_n_p, (_n_hx + (cos(_n_an_b3) * _n_d_b4)), (_n_hy + ((sin(_n_an_b3) * _n_d_b4) * 0.8)), floori((1.6 * sin((PI * _n_u_b5)))+0.5), _S.index_value(_n_C,5), _S.index_value(_n_C,4), (0.3 * sin((PI * _n_u_b5)))])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_ph_b0 = _S.arg(_args,0)
	return (exp((-pow((float((_n_ph_b0 - 0.04))/0.07),2))) + (0.6 * exp((-pow((float((_n_ph_b0 - 0.26))/0.07),2)))))
	return null
