@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/stunned.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "icon", _S.import_value("fx/status/_lib.js", "icon"))
	_S.define(_e, "bitmap", _S.import_value("fx/status/_lib.js", "bitmap"))
	_S.define(_e, "shaped", _S.import_value("fx/status/_lib.js", "shaped"))
	_S.define(_e, "starShape", _S.import_value("fx/status/_lib.js", "starShape"))
	_S.define(_e, "ring", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw1", _S.function_value(_e, "_f2"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Stunned"}, {"desc": "Seeing stars: three spinning stars and two little birds circle the head on a tilted ring, ducking behind it and sweeping round in front, trailing glitter."}, {"tags": ["status", "stun", "dizzy", "daze", "stars", "birds", "debuff", "loop"]}, {"size": [60, 64]}, {"origin": [30, 56]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#3a1e0c", "#8a4a12", "#d88a1c", "#f5c030", "#ffe36e", "#fff6c8", "#ffffff"]}, {"birds": ["#1a1422", "#6a7fae", "#b8c8e8", "#f4f8ff"]}, {"beak": "#ffae35"}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "DAZE", _S.merge([{"turn": 1}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 15)}, {"bx": 8}, {"by": _S.unary("-", 15)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.merge([_S.read(_e, "DAZE"), {"x": _S.unary("-", 1)}, {"lean": _S.unary("-", 3)}, {"hx": _S.unary("-", 1)}])], [0.5, _S.merge([_S.read(_e, "DAZE"), {"x": 0}, {"lean": 0}, {"crouch": 2}, {"hy": 1}, {"ffx": _S.unary("-", 2)}])], [1, _S.merge([_S.read(_e, "DAZE"), {"x": 1}, {"lean": 3}, {"hx": 1}])], [1.5, _S.merge([_S.read(_e, "DAZE"), {"x": 0}, {"lean": 0}, {"crouch": 2}, {"hy": 1}, {"fbx": 3}])], [2, _S.merge([_S.read(_e, "DAZE"), {"x": _S.unary("-", 1)}, {"lean": _S.unary("-", 3)}, {"hx": _S.unary("-", 1)}])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "TURNS", 2)
	_S.define(_e, "N", 5)
	_S.define(_e, "STAR7", ["...#...", "..###..", "#######", ".#####.", "..###..", ".##.##.", ".#...#."])
	_S.define(_e, "BIRD", _S.invoke([true, false], "map", [_S.function_value(_e, "_f9")]))
	_S.define(_e, "STAR", _S.invoke(_S.read(_e, "shaped"), "bind", [null, _S.call_value(_S.read(_e, "starShape"), [0.44])]))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_N = _S.read(_parent,"N")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	var _n_cy_b2 = (_S.named_value(_n_a_b1,"y") + 2)
	var _n_rx_b3 = (_S.named_value(_n_a_b1,"w") * 0.62)
	var _n_ry_b4 = 4.5
	return _S.invoke(_n_Array,"from",[{"length":_n_N}, _S.function_value(_S.capture(_parent,{"t":_n_t_b0,"rx":_n_rx_b3,"cy":_n_cy_b2,"ry":_n_ry_b4,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_TURNS = _S.read(_parent,"TURNS")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_N = _S.read(_parent,"N")
	var _n_rx = _S.read(_parent,"rx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_ry = _S.read(_parent,"ry")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_th_b2 = (_n_TAU * ((float((_n_TURNS * _n_t))/_n_D) + (float(_n_i_b1)/_n_N)))
	var _n_s_b3 = sin(_n_th_b2)
	return {"i":_n_i_b1,"th":_n_th_b2,"x":(cos(_n_th_b2) * _n_rx),"y":(_n_cy + (_n_s_b3 * _n_ry)),"near":(_n_s_b3 >= 0),"depth":(0.5 + (0.5 * _n_s_b3)),"bird":_S.binary("===",fmod(_n_i_b1,2),1),"rx":_n_rx,"ry":_n_ry,"cy":_n_cy}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TURNS = _S.read(_parent,"TURNS")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_BIRD = _S.read(_parent,"BIRD")
	var _n_hex = _S.read(_parent,"hex")
	var _n_icon = _S.read(_parent,"icon")
	var _n_STAR = _S.read(_parent,"STAR")
	var _n_STAR7 = _S.read(_parent,"STAR7")
	var _n_bitmap = _S.read(_parent,"bitmap")
	var _n_flare = _S.read(_parent,"flare")
	var _n_ring = _S.read(_parent,"ring")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_layer_b3 = _S.arg(_args,3)
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_Bd_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"birds"),4)
	var _n_a_b6 = _S.named_value(_n_o_b2,"actor")
	var _n_far_b7 = _S.binary("===",_n_layer_b3,"back")
	var _n_dim_b8 = _S.function_value(_S.capture(_parent,{"far":_n_far_b7,"Bd":_n_Bd_b5,"this":_this}),"_f3")
	for _iter_0 in _S.array(_S.call_value(_n_ring,[_n_t_b1, _n_a_b6])):
		var _n_it_b9 = _iter_0
		if _S.truth(_S.binary("===",_S.named_value(_n_it_b9,"near"),_n_far_b7)):
			continue
		if _S.truth(not _S.truth(_S.named_value(_n_it_b9,"bird"))):
			if true:
				var _n_k_b10 = 1
				while _S.truth((_n_k_b10 <= 12)):
					var _n_th_b11 = (_S.named_value(_n_it_b9,"th") - (_n_k_b10 * 0.085))
					var _n_x_b12 = (cos(_n_th_b11) * _S.named_value(_n_it_b9,"rx"))
					var _n_y_b13 = ((_S.named_value(_n_it_b9,"cy") - 1) + (sin(_n_th_b11) * _S.named_value(_n_it_b9,"ry")))
					if _S.truth(_S.logical("||",_S.binary("===",(sin(_n_th_b11) >= 0),_n_far_b7),func():return (_S.MathFX.rand([_S.named_value(_n_it_b9,"i"),_n_k_b10,floori(((((float(_n_t_b1)/_n_D) * _n_TURNS) + (_n_k_b10 * 0.37)) * 9))]) < 0.25))):
						_n_k_b10 += 1.0
						continue
					_S.invoke(_n_p_b0,"dot",[_n_x_b12, _n_y_b13, _S.call_value(_n_dim_b8,[(_S.index_value(_n_C_b4,6) if _S.truth((_n_k_b10 < 4)) else (_S.index_value(_n_C_b4,5) if _S.truth((_n_k_b10 < 8)) else _S.index_value(_n_C_b4,4)))]), (1.1 - (float(_n_k_b10)/13))])
					if _S.truth((_n_k_b10 < 6)):
						_S.invoke(_n_p_b0,"light",[_n_x_b12, _n_y_b13, _S.index_value(_n_C_b4,4), (0.3 * (1 - (float(_n_k_b10)/6)))])
					_n_k_b10 += 1.0
		if _S.truth(_S.named_value(_n_it_b9,"bird")):
			var _n_up_b14 = _S.binary("===",fmod(floori(((_n_t_b1 * 8) + (_S.named_value(_n_it_b9,"i") * 0.5))),2),0)
			var _n_bob_b15 = (sin(((((float(_n_t_b1)/_n_D) * _n_TAU) * 4) + _S.named_value(_n_it_b9,"i"))) * 0.7)
			var _n_flip_b16 = _S.named_value(_n_it_b9,"near")
			var _n_f_b17 = _S.index_value(_n_BIRD,(0 if _S.truth(_n_up_b14) else 1))
			var _n_ins_b18 = (_S.function_value(_S.capture(_parent,{"f":_n_f_b17,"this":_this}),"_f4") if _S.truth(_n_flip_b16) else _n_f_b17)
			_S.call_value(_n_icon,[_n_p_b0, _S.named_value(_n_it_b9,"x"), ((_S.named_value(_n_it_b9,"y") - 3) + _n_bob_b15), 7, _n_ins_b18, [_S.index_value(_n_Bd_b5,0), _S.call_value(_n_dim_b8,[_S.index_value(_n_Bd_b5,1)]), _S.call_value(_n_dim_b8,[_S.index_value(_n_Bd_b5,2)]), _S.call_value(_n_dim_b8,[_S.index_value(_n_Bd_b5,3)])], 1, {"e":_S.index_value(_n_Bd_b5,0),"b":_S.call_value(_n_dim_b8,[_S.call_value(_n_hex,[_S.named_value(_n_o_b2,"beak")])]),"w":_S.call_value(_n_dim_b8,[_S.index_value(_n_Bd_b5,1)])}])
		else:
			var _n_spin_b19 = ((((float(_n_t_b1)/_n_D) * _n_TAU) * 3) + _S.named_value(_n_it_b9,"i"))
			var _n_R_b20 = [_S.index_value(_n_C_b4,0), _S.call_value(_n_dim_b8,[_S.index_value(_n_C_b4,3)]), _S.call_value(_n_dim_b8,[_S.index_value(_n_C_b4,4)]), _S.call_value(_n_dim_b8,[_S.index_value(_n_C_b4,5)])]
			if _S.truth((_S.named_value(_n_it_b9,"depth") > 0.55)):
				_S.call_value(_n_icon,[_n_p_b0, _S.named_value(_n_it_b9,"x"), (_S.named_value(_n_it_b9,"y") - 1), 7, _S.call_value(_n_STAR,[(4 + (0.8 * _S.named_value(_n_it_b9,"depth"))), _n_spin_b19]), _n_R_b20])
			else:
				_S.call_value(_n_icon,[_n_p_b0, _S.named_value(_n_it_b9,"x"), (_S.named_value(_n_it_b9,"y") - 1), 5, _S.call_value(_n_bitmap,[_n_STAR7]), _n_R_b20])
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_it_b9,"x"), (_S.named_value(_n_it_b9,"y") - 1), (_S.index_value(_n_C_b4,5) if _S.truth(_n_far_b7) else _S.index_value(_n_C_b4,6))])
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_it_b9,"x"), (_S.named_value(_n_it_b9,"y") - 1), 11, _S.index_value(_n_C_b4,4), (0.24 + (0.3 * _S.named_value(_n_it_b9,"depth")))])
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_it_b9,"x"), (_S.named_value(_n_it_b9,"y") - 1), 4, _S.index_value(_n_C_b4,6), (0.3 * _S.named_value(_n_it_b9,"depth"))])
			var _n_fr_b21 = exp((-pow((float(atan2(sin((_S.named_value(_n_it_b9,"th") - (float(PI)/2))),cos((_S.named_value(_n_it_b9,"th") - (float(PI)/2)))))/0.32),2)))
			if _S.truth(((_n_fr_b21 > 0.08) if _S.truth(not _S.truth(_n_far_b7)) else not _S.truth(_n_far_b7))):
				_S.call_value(_n_flare,[_n_p_b0, _S.named_value(_n_it_b9,"x"), (_S.named_value(_n_it_b9,"y") - 1), (9 * _n_fr_b21), _n_fr_b21, [_S.index_value(_n_C_b4,3), _S.index_value(_n_C_b4,4), _S.index_value(_n_C_b4,5), _S.index_value(_n_C_b4,6)]])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_Bd = _S.read(_parent,"Bd")
	var _n_far = _S.read(_parent,"far")
	var _n_c_b0 = _S.arg(_args,0)
	return (_S.ColorFX.mix(_n_c_b0,_S.index_value(_n_Bd,0),0.3) if _S.truth(_n_far) else _n_c_b0)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_f = _S.read(_parent,"f")
	var _n_dx_b0 = _S.arg(_args,0)
	var _n_dy_b1 = _S.arg(_args,1)
	return _S.call_value(_n_f,[(-_n_dx_b0), _n_dy_b1])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_draw1 = _S.read(_parent,"draw1")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	_S.call_value(_n_draw1,[_n_p_b0, _n_t_b1, _n_o_b2, "back"])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_draw1 = _S.read(_parent,"draw1")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	_S.call_value(_n_draw1,[_n_p_b0, _n_t_b1, _n_o_b2, "front"])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 14, (_S.named_value(_n_o_b2,"seed") + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), _S.function_value(_S.capture(_parent,{"a":_n_a_b4,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f8")])
	_S.invoke(_n_p_b0,"glow",[0, (_S.named_value(_n_a_b4,"y") + 1), 26, _S.index_value(_n_C_b3,4), 0.13])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.25, 0.5])
	return null

static func _f8(_parent,_args:Array,_this=null):
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
	var _n_x_b5 = ((cos(_n_th_b3) * _S.named_value(_n_a,"w")) * _S.invoke(_n_r_b2,"range",[0.45, 0.95]))
	var _n_y_b6 = (((_S.named_value(_n_a,"y") + 1) + (sin(_n_th_b3) * 7)) - _S.invoke(_n_r_b2,"range",[0, 9]))
	var _n_arm_b7 = floori((_S.invoke(_n_r_b2,"range",[1, 2.6]) * sin((PI * _n_u_b4)))+0.5)
	if _S.truth((_n_arm_b7 < 1)):
		_S.invoke(_n_p,"dot",[_n_x_b5, _n_y_b6, _S.index_value(_n_C,6), (sin((PI * _n_u_b4)) * 1.4)])
	_S.call_value(_n_sparkle,[_n_p, _n_x_b5, _n_y_b6, _n_arm_b7, _S.index_value(_n_C,5), _S.index_value(_n_C,4), (0.35 * sin((PI * _n_u_b4)))])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_up_b0 = _S.arg(_args,0)
	return _S.function_value(_S.capture(_parent,{"up":_n_up_b0,"this":_n_this}),"_f10")
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_up = _S.read(_parent,"up")
	var _n_this = _S.read(_parent,"this")
	var _n_dx_b0 = _S.arg(_args,0)
	var _n_dy_b1 = _S.arg(_args,1)
	var _n_x_b2 = (_n_dx_b0 + 0.5)
	var _n_y_b3 = (_n_dy_b1 + 0.5)
	if _S.truth((_S.binary("===",_n_dy_b1,(-2)) if _S.truth(_S.binary("===",_n_dx_b0,3)) else _S.binary("===",_n_dx_b0,3))):
		return "e"
	if _S.truth((_S.binary("===",_n_dy_b1,(-1)) if _S.truth((_S.binary("===",_n_dx_b0,5) if _S.truth(_S.binary("===",_n_dx_b0,5)) else _S.binary("===",_n_dx_b0,4))) else (_S.binary("===",_n_dx_b0,5) if _S.truth(_S.binary("===",_n_dx_b0,5)) else _S.binary("===",_n_dx_b0,4)))):
		return ("b" if _S.truth(_S.binary("===",_n_dx_b0,5)) else "#")
	var _n_wing_b4 = ([[(-1), (-1)], [(-1), (-2)], [(-2), (-2)], [(-2), (-3)], [(-3), (-3)], [(-3), (-4)]] if _S.truth(_n_up) else [[(-1), 1], [(-1), 2], [(-2), 2], [(-2), 3], [0, 1]])
	if _S.truth(_S.invoke(_n_wing_b4,"some",[_S.function_value(_S.capture(_parent,{"dx":_n_dx_b0,"dy":_n_dy_b1,"this":_n_this}),"_f11")])):
		return "w"
	if _S.truth((((pow((float(_n_x_b2)/3.3),2) + pow((float((_n_y_b3 - 0.6))/1.9),2)) <= 1) if _S.truth(((pow((float(_n_x_b2)/3.3),2) + pow((float((_n_y_b3 - 0.6))/1.9),2)) <= 1)) else ((pow((_n_x_b2 - 2.8),2) + pow((_n_y_b3 + 1.2),2)) <= pow(1.7,2)))):
		return "#"
	if _S.truth((((_S.binary("===",_n_dy_b1,(-1)) if _S.truth(_S.binary("===",_n_dy_b1,(-1))) else _S.binary("===",_n_dy_b1,0)) if _S.truth(_S.binary("===",_n_dx_b0,(-4))) else _S.binary("===",_n_dx_b0,(-4))) if _S.truth(((_S.binary("===",_n_dy_b1,(-1)) if _S.truth(_S.binary("===",_n_dy_b1,(-1))) else _S.binary("===",_n_dy_b1,0)) if _S.truth(_S.binary("===",_n_dx_b0,(-4))) else _S.binary("===",_n_dx_b0,(-4)))) else (_S.binary("===",_n_dy_b1,(-1)) if _S.truth(_S.binary("===",_n_dx_b0,(-5))) else _S.binary("===",_n_dx_b0,(-5))))):
		return "#"
	return ""
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_dx = _S.read(_parent,"dx")
	var _n_dy = _S.read(_parent,"dy")
	var _tuple_0 = _S.arg(_args,0)
	var _n_a_b0 = _S.prop(_tuple_0,0)
	var _n_b_b1 = _S.prop(_tuple_0,1)
	return (_S.binary("===",_n_b_b1,_n_dy) if _S.truth(_S.binary("===",_n_a_b0,_n_dx)) else _S.binary("===",_n_a_b0,_n_dx))
	return null
