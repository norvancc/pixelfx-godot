@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/rain-splash.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "bead", _S.import_value("fx/water/_lib.js", "bead"))
	_S.define(_e, "ring", _S.import_value("fx/water/_lib.js", "ring"))
	_S.define(_e, "drops", _S.function_value(_e, "_f0"))
	_S.define(_e, "field", _S.function_value(_e, "_f2"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f3"))
	_S.define(_e, "crown", _S.function_value(_e, "_f8"))
	_S.define(_e, "draw", _S.function_value(_e, "_f11"))
	_S.define(_e, "meta", _S.merge([{"name": "Rain splash"}, {"desc": "A low close-up on one puddle in the rain: big drops land in crowns that throw beads and a rebound jet, rings spread and interfere, a lamp's reflection wobbles on the water."}, {"tags": ["water", "rain", "splash", "puddle", "close-up", "ambient", "loop"]}, {"size": [176, 80]}, {"origin": [88, 50]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SY", 0.3)
	_S.define(_e, "RX", 92)
	_S.define(_e, "G", 640)
	_S.define(_e, "N", 8)
	_S.define(_e, "LAMP", 34)
	_S.define(_e, "ageOf", _S.function_value(_e, "_f15"))
	_S.define(_e, "ringR", _S.function_value(_e, "_f16"))
	_S.define(_e, "ringK", _S.function_value(_e, "_f17"))
	_S.define(_e, "crownH", _S.function_value(_e, "_f18"))
	_S.define(_e, "crownR", _S.function_value(_e, "_f19"))
	_S.define(_e, "jetH", _S.function_value(_e, "_f20"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_N = _S.read(_parent,"N")
	var _n_S_b0 = _S.arg(_args,0)
	return _S.invoke(_n_Array,"from",[{"length":_n_N}, _S.function_value(_S.capture(_parent,{"S":_n_S_b0,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_N = _S.read(_parent,"N")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"x":((_S.MathFX.rand([_n_i_b1,_n_S]) - 0.5) * 120),"z":((_S.MathFX.rand([_n_i_b1,(_n_S + 1)]) - 0.5) * 50),"t0":((float((_n_i_b1 + (0.25 * _S.MathFX.rand([_n_i_b1,(_n_S + 2)]))))/_n_N) * _n_D),"H":(10 + (4 * _S.MathFX.rand([_n_i_b1,(_n_S + 3)]))),"J":(7 + (4 * _S.MathFX.rand([_n_i_b1,(_n_S + 4)]))),"spin":(_S.MathFX.rand([_n_i_b1,(_n_S + 5)]) * _n_TAU),"i":_n_i_b1}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_z_b1 = _S.arg(_args,1)
	var _n_list_b2 = _S.arg(_args,2)
	var _n_h_b3 = 0
	for _iter_0 in _S.array(_n_list_b2):
		var _n_q_b4 = _iter_0
		var _n_dx_b5 = (_n_x_b0 - _S.named_value(_n_q_b4,"x"))
		if _S.truth(((_n_dx_b5 > (_S.named_value(_n_q_b4,"R") + 10)) if _S.truth((_n_dx_b5 > (_S.named_value(_n_q_b4,"R") + 10))) else (_n_dx_b5 < ((-_S.named_value(_n_q_b4,"R")) - 10)))):
			continue
		var _n_d_b6 = (_S.Bridge.hypot([_n_dx_b5, (_n_z_b1 - _S.named_value(_n_q_b4,"z"))]) - _S.named_value(_n_q_b4,"R"))
		var _n_w_b7 = (3.6 + (_S.named_value(_n_q_b4,"a") * 3))
		if _S.truth(((_n_d_b6 > (2 * _n_w_b7)) if _S.truth((_n_d_b6 > (2 * _n_w_b7))) else (_n_d_b6 < ((-3) * _n_w_b7)))):
			continue
		_n_h_b3 += ((_S.named_value(_n_q_b4,"k") * cos((_n_d_b6 * 1.1))) * exp((-pow((float(_n_d_b6)/_n_w_b7),2))))
	return _n_h_b3
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_RX = _S.read(_parent,"RX")
	var _n_SY = _S.read(_parent,"SY")
	var _n_D = _S.read(_parent,"D")
	var _n_drops = _S.read(_parent,"drops")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_field = _S.read(_parent,"field")
	var _n_LAMP = _S.read(_parent,"LAMP")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_crown = _S.read(_parent,"crown")
	var _n_ageOf = _S.read(_parent,"ageOf")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_ry_b5 = (_n_RX * _n_SY)
	var _n_ph_b6 = (float(_n_t_b1)/_n_D)
	var _n_list_b7 = _S.invoke(_S.invoke(_S.invoke(_S.call_value(_n_drops,[_n_S_b4]),"map",[_S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f4")]),"filter",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f5")]),"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f6")])
	if true:
		var _n_Y_b8 = floori((-_n_ry_b5))
		while _S.truth((_n_Y_b8 < _n_ry_b5)):
			var _n_y_b9 = (_n_Y_b8 + 0.5)
			var _n_z_b10 = (float(_n_y_b9)/_n_SY)
			var _n_act_b11 = _S.invoke(_n_list_b7,"filter",[_S.function_value(_S.capture(_parent,{"z":_n_z_b10,"this":_this}),"_f7")])
			var _n_far_b12 = (float((_n_y_b9 + _n_ry_b5))/(2 * _n_ry_b5))
			var _n_dashW_b13 = ((1.5 + (_n_far_b12 * 4)) * (0.35 + (0.65 * (0.5 + (0.5 * sin((((_n_Y_b8 * 1.73) + ((_n_ph_b6 * _n_TAU) * 3)) + (sin((_n_Y_b8 * 0.61)) * 3))))))))
			var _n_hPrev_b14 = 0
			if true:
				var _n_X_b15 = (-88)
				while _S.truth((_n_X_b15 < 88)):
					var _n_x_b16 = (_n_X_b15 + 0.5)
					var _n_d_b17 = (pow((float(_n_x_b16)/_n_RX),2) + pow((float(_n_y_b9)/_n_ry_b5),2))
					if _S.truth((_n_d_b17 > 1)):
						_n_X_b15 += 1.0
						continue
					var _n_edge_b18 = minf(1,((1 - _n_d_b17) * 6))
					_S.invoke(_n_p_b0,"blend",[_n_x_b16, _n_y_b9, _S.index_value(_n_C_b3,0), ((0.62 + (0.2 * _n_far_b12)) * _n_edge_b18)])
					if _S.truth((_n_far_b12 < 0.45)):
						_S.invoke(_n_p_b0,"blend",[_n_x_b16, _n_y_b9, _S.index_value(_n_C_b3,2), ((0.3 * (1 - (float(_n_far_b12)/0.45))) * _n_edge_b18)])
					var _n_h_b19 = (_S.call_value(_n_field,[_n_x_b16, _n_z_b10, _n_act_b11]) if _S.truth(_S.prop(_n_act_b11,"length")) else 0)
					var _n_hx_b20 = (_n_h_b19 - _n_hPrev_b14)
					_n_hPrev_b14 = _n_h_b19
					if _S.truth((_n_h_b19 > 0.24)):
						_S.invoke(_n_p_b0,"blend",[_n_x_b16, _n_y_b9, (_S.index_value(_n_C_b3,5) if _S.truth((_n_h_b19 > 0.75)) else _S.index_value(_n_C_b3,4)), (minf(0.95,((_n_h_b19 - 0.24) * 2.2)) * _n_edge_b18)])
					else:
						if _S.truth((_n_h_b19 < (-0.4))):
							_S.invoke(_n_p_b0,"blend",[_n_x_b16, _n_y_b9, _S.index_value(_n_C_b3,0), (minf(0.85,(((-_n_h_b19) - 0.4) * 1.8)) * _n_edge_b18)])
					if _S.truth(((_n_x_b16 < (_n_LAMP - 14)) if _S.truth((_n_x_b16 < (_n_LAMP - 14))) else (_n_x_b16 > (_n_LAMP + 14)))):
						_n_X_b15 += 1.0
						continue
					var _n_lx_b21 = absf((((_n_x_b16 - _n_LAMP) - (_n_hx_b20 * 9)) - (sin(((_n_y_b9 * 0.8) + ((_n_ph_b6 * _n_TAU) * 2))) * 1.4)))
					if _S.truth((_n_lx_b21 < _n_dashW_b13)):
						var _n_k_b22 = ((1 - (float(_n_lx_b21)/_n_dashW_b13)) * _n_edge_b18)
						_S.invoke(_n_p_b0,"px",[_n_X_b15, _n_Y_b8, (_n_WHITE if _S.truth((_n_k_b22 > 0.72)) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_k_b22 > 0.35)) else _S.index_value(_n_C_b3,5)))])
						_S.invoke(_n_p_b0,"light",[_n_x_b16, _n_y_b9, _S.index_value(_n_C_b3,5), (0.2 * _n_k_b22)])
					_n_X_b15 += 1.0
			_n_Y_b8 += 1.0
	if true:
		var _n_X_b23 = (-82)
		while _S.truth((_n_X_b23 < 82)):
			var _n_x_b24 = (_n_X_b23 + 0.5)
			var _n_y_b25 = ((-sqrt(maxf(0,(1 - pow((float(_n_x_b24)/_n_RX),2))))) * _n_ry_b5)
			_S.invoke(_n_p_b0,"px",[_n_X_b23, (_n_y_b25 + 0.5), (_S.index_value(_n_C_b3,6) if _S.truth((absf((_n_x_b24 - _n_LAMP)) < 10)) else _S.index_value(_n_C_b3,3))])
			_n_X_b23 += 1.0
	for _iter_0 in _S.array(_S.call_value(_n_drops,[_n_S_b4])):
		var _n_q_b26 = _iter_0
		_S.call_value(_n_crown,[_n_p_b0, _n_C_b3, _n_q_b26, _S.call_value(_n_ageOf,[_n_t_b1, _S.named_value(_n_q_b26,"t0")]), true])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "q"), {"a": _S.call_value(_S.read(_e, "ageOf"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "q"), "t0")])}])

static func _f5(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	return (_S.named_value(_n_q_b0,"a") < 1.8)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "q"), {"R": _S.call_value(_S.read(_e, "ringR"), [_S.prop(_S.read(_e, "q"), "a")])}, {"k": _S.call_value(_S.read(_e, "ringK"), [_S.prop(_S.read(_e, "q"), "a")])}])

static func _f7(_parent,_args:Array,_this=null):
	var _n_z = _S.read(_parent,"z")
	var _n_q_b0 = _S.arg(_args,0)
	return (absf((_n_z - _S.named_value(_n_q_b0,"z"))) <= (_S.named_value(_n_q_b0,"R") + 12))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_crownH = _S.read(_parent,"crownH")
	var _n_crownR = _S.read(_parent,"crownR")
	var _n_SY = _S.read(_parent,"SY")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_q_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_back_b4 = _S.arg(_args,4)
	var _n_h_b5 = _S.call_value(_n_crownH,[_n_a_b3, _S.named_value(_n_q_b2,"H")])
	if _S.truth((_n_h_b5 < 1)):
		return null
	var _n_r0_b6 = _S.call_value(_n_crownR,[_n_a_b3])
	var _n_cy_b7 = (_S.named_value(_n_q_b2,"z") * _n_SY)
	if true:
		var _n_f_b8 = 0
		while _S.truth((_n_f_b8 < 10)):
			var _n_ang_b9 = (_S.named_value(_n_q_b2,"spin") + ((float(_n_f_b8)/10) * _n_TAU))
			var _n_s_b10 = sin(_n_ang_b9)
			if _S.truth(_S.binary("!==",(_n_s_b10 < 0),_n_back_b4)):
				_n_f_b8 += 1.0
				continue
			var _n_tip_b11 = (_n_h_b5 * (0.75 + (0.25 * _S.MathFX.rand([_S.named_value(_n_q_b2,"i"),_n_f_b8,7]))))
			var _n_lean_b12 = (0.35 * _n_tip_b11)
			var _n_x0_b13 = (_S.named_value(_n_q_b2,"x") + (cos(_n_ang_b9) * _n_r0_b6))
			var _n_y0_b14 = (_n_cy_b7 + ((_n_s_b10 * _n_r0_b6) * _n_SY))
			var _n_x1_b15 = (_S.named_value(_n_q_b2,"x") + (cos(_n_ang_b9) * (_n_r0_b6 + _n_lean_b12)))
			var _n_y1_b16 = ((_n_cy_b7 + ((_n_s_b10 * (_n_r0_b6 + _n_lean_b12)) * _n_SY)) - _n_tip_b11)
			_S.invoke(_n_p_b0,"line",[_n_x0_b13, _n_y0_b14, _n_x1_b15, _n_y1_b16, (_S.function_value(_S.capture(_parent,{"C":_n_C_b1,"this":_this}),"_f9") if _S.truth(_n_back_b4) else _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"this":_this}),"_f10"))])
			if _S.truth(((_n_a_b3 < 0.17) if _S.truth((_n_a_b3 > 0.08)) else (_n_a_b3 > 0.08))):
				_S.invoke(_n_p_b0,"px",[_n_x1_b15, (_n_y1_b16 - 1), (_S.index_value(_n_C_b1,5) if _S.truth(_n_back_b4) else _n_WHITE)])
			_n_f_b8 += 1.0
	if _S.truth(not _S.truth(_n_back_b4)):
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_q_b2,"x"), (_n_cy_b7 - (_n_h_b5 * 0.6)), (6 + (_n_h_b5 * 0.6)), _S.index_value(_n_C_b1,5), (0.3 * (float(_n_h_b5)/_S.named_value(_n_q_b2,"H")))])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,5) if _S.truth((_n_u_b0 > 0.7)) else _S.index_value(_n_C,3))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 > 0.75)) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 > 0.35)) else _S.index_value(_n_C,5)))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_ageOf = _S.read(_parent,"ageOf")
	var _n_SY = _S.read(_parent,"SY")
	var _n_D = _S.read(_parent,"D")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_crown = _S.read(_parent,"crown")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_crownH = _S.read(_parent,"crownH")
	var _n_crownR = _S.read(_parent,"crownR")
	var _n_G = _S.read(_parent,"G")
	var _n_bead = _S.read(_parent,"bead")
	var _n_ring = _S.read(_parent,"ring")
	var _n_jetH = _S.read(_parent,"jetH")
	var _n_drops = _S.read(_parent,"drops")
	var _n_ringR = _S.read(_parent,"ringR")
	var _n_ringK = _S.read(_parent,"ringK")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_LAMP = _S.read(_parent,"LAMP")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	for _iter_0 in _S.array(_S.call_value(_n_drops,[_n_S_b4])):
		var _n_q_b5 = _iter_0
		var _n_a_b6 = _S.call_value(_n_ageOf,[_n_t_b1, _S.named_value(_n_q_b5,"t0")])
		var _n_cy_b7 = (_S.named_value(_n_q_b5,"z") * _n_SY)
		var _n_pre_b8 = (_n_D - _n_a_b6)
		if _S.truth(((((_n_cy_b7 - (_n_pre_b8 * 520)) - 10) > (-48)) if _S.truth((_n_pre_b8 < 0.14)) else (_n_pre_b8 < 0.14))):
			var _n_y_b12 = (_n_cy_b7 - (_n_pre_b8 * 520))
			_S.invoke(_n_p_b0,"line",[_S.named_value(_n_q_b5,"x"), (_n_y_b12 - 10), _S.named_value(_n_q_b5,"x"), (_n_y_b12 - 4), _S.index_value(_n_C_b3,4)])
			_S.invoke(_n_p_b0,"line",[_S.named_value(_n_q_b5,"x"), (_n_y_b12 - 4), _S.named_value(_n_q_b5,"x"), _n_y_b12, _S.index_value(_n_C_b3,6)])
		if _S.truth((_n_a_b6 < 0.05)):
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b5,"x"), _n_cy_b7, _n_WHITE])
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_q_b5,"x"), (_n_cy_b7 - 2), 12, _S.index_value(_n_C_b3,5), (0.5 * (1 - (float(_n_a_b6)/0.05)))])
		_S.call_value(_n_crown,[_n_p_b0, _n_C_b3, _n_q_b5, _n_a_b6, false])
		if _S.truth(((_n_a_b6 < 0.8) if _S.truth((_n_a_b6 > 0.16)) else (_n_a_b6 > 0.16))):
			if true:
				var _n_f_b13 = 0
				while _S.truth((_n_f_b13 < 10)):
					var _n_ang_b14 = (_S.named_value(_n_q_b5,"spin") + ((float(_n_f_b13)/10) * _n_TAU))
					var _n_tip_b15 = (_S.call_value(_n_crownH,[0.16, _S.named_value(_n_q_b5,"H")]) * (0.75 + (0.25 * _S.MathFX.rand([_S.named_value(_n_q_b5,"i"),_n_f_b13,7]))))
					var _n_r0_b16 = (_S.call_value(_n_crownR,[0.16]) + (_n_tip_b15 * 0.35))
					var _n_v_b17 = (22 + (18 * _S.MathFX.rand([_S.named_value(_n_q_b5,"i"),_n_f_b13,8])))
					var _n_vh_b18 = (40 + (30 * _S.MathFX.rand([_S.named_value(_n_q_b5,"i"),_n_f_b13,9])))
					var _n_tt_b19 = (_n_a_b6 - 0.16)
					var _n_hh_b20 = ((_n_tip_b15 + (_n_vh_b18 * _n_tt_b19)) - (((0.5 * _n_G) * _n_tt_b19) * _n_tt_b19))
					var _n_bx_b21 = (_S.named_value(_n_q_b5,"x") + (cos(_n_ang_b14) * (_n_r0_b16 + (_n_v_b17 * _n_tt_b19))))
					var _n_bz_b22 = (_S.named_value(_n_q_b5,"z") + (sin(_n_ang_b14) * (_n_r0_b16 + (_n_v_b17 * _n_tt_b19))))
					var _n_by_b23 = (_n_bz_b22 * _n_SY)
					if _S.truth((_n_hh_b20 > 0)):
						_S.call_value(_n_bead,[_n_p_b0, _n_bx_b21, (_n_by_b23 - _n_hh_b20), (cos(_n_ang_b14) * _n_v_b17), ((-(_n_vh_b18 - (_n_G * _n_tt_b19))) + ((sin(_n_ang_b14) * _n_v_b17) * _n_SY)), (2 if _S.truth((_S.MathFX.rand([_S.named_value(_n_q_b5,"i"),_n_f_b13,10]) < 0.4)) else 1), _n_C_b3])
					else:
						var _n_land_b24 = (float((_n_vh_b18 + sqrt(((_n_vh_b18 * _n_vh_b18) + ((2 * _n_G) * _n_tip_b15)))))/_n_G)
						var _n_since_b25 = (_n_tt_b19 - _n_land_b24)
						if _S.truth((_n_since_b25 < 0.05)):
							_S.invoke(_n_p_b0,"px",[_n_bx_b21, _n_by_b23, _n_WHITE])
						if _S.truth((_n_since_b25 < 0.35)):
							_S.call_value(_n_ring,[_n_p_b0, _n_bx_b21, _n_by_b23, (1 + (_n_since_b25 * 12)), _n_SY, (1 - (float(_n_since_b25)/0.35)), _n_C_b3, {"n":1,"half":1,"seed":((_S.named_value(_n_q_b5,"i") * 10) + _n_f_b13)}])
					_n_f_b13 += 2
		var _n_jh_b9 = _S.call_value(_n_jetH,[_n_a_b6, _S.named_value(_n_q_b5,"J")])
		if _S.truth((_n_jh_b9 > 0.8)):
			_S.invoke(_n_p_b0,"line",[_S.named_value(_n_q_b5,"x"), (_n_cy_b7 - 1), _S.named_value(_n_q_b5,"x"), (_n_cy_b7 - _n_jh_b9), _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f12")])
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_q_b5,"x") + 1), (_n_cy_b7 - 1), _S.index_value(_n_C_b3,5)])
			if _S.truth((_n_a_b6 < 0.41)):
				_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_q_b5,"x"), ((_n_cy_b7 - _n_jh_b9) - 0.5), 1.2, _S.index_value(_n_C_b3,6)])
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_q_b5,"x"), (_n_cy_b7 - (_n_jh_b9 * 0.6)), 6, _S.index_value(_n_C_b3,5), 0.3])
		var _n_ba_b10 = (_n_a_b6 - 0.41)
		var _n_bh_b11 = (((_S.named_value(_n_q_b5,"J") + 1) + (24 * _n_ba_b10)) - (((0.5 * _n_G) * _n_ba_b10) * _n_ba_b10))
		if _S.truth(((_n_bh_b11 > 0) if _S.truth((_n_ba_b10 > 0)) else (_n_ba_b10 > 0))):
			_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_q_b5,"x"), (_n_cy_b7 - _n_bh_b11), 1.1, _S.index_value(_n_C_b3,6)])
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b5,"x"), ((_n_cy_b7 - _n_bh_b11) - 1), _n_WHITE])
	for _iter_1 in _S.array(_S.call_value(_n_drops,[_n_S_b4])):
		var _n_q_b26 = _iter_1
		var _n_a_b27 = _S.call_value(_n_ageOf,[_n_t_b1, _S.named_value(_n_q_b26,"t0")])
		if _S.truth((_n_a_b27 < 1.8)):
			_S.call_value(_n_ring,[_n_p_b0, _S.named_value(_n_q_b26,"x"), (_S.named_value(_n_q_b26,"z") * _n_SY), _S.call_value(_n_ringR,[_n_a_b27]), _n_SY, (0.75 * _S.call_value(_n_ringK,[_n_a_b27])), _n_C_b3, {"n":1,"half":1,"hot":(_n_a_b27 < 0.1),"seed":_S.named_value(_n_q_b26,"i"),"wob":(0.5 + _n_a_b27)}])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 16, (_n_S_b4 + 20), 0.5, _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f13")])
	_S.invoke(_n_p_b0,"glow",[_n_LAMP, (-6), 30, _S.index_value(_n_C_b3,4), 0.16])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 > 0.6)) else _S.index_value(_n_C,6))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_SY = _S.read(_parent,"SY")
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_RX = _S.read(_parent,"RX")
	var _n_C = _S.read(_parent,"C")
	var _n_ring = _S.read(_parent,"ring")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_x_b3 = _S.invoke(_n_r_b2,"range",[(-80), 80])
	var _n_z_b4 = _S.invoke(_n_r_b2,"range",[(-26), 26])
	var _n_y_b5 = (_n_z_b4 * _n_SY)
	var _n_s_b6 = (_n_age_b0 - 0.1)
	if _S.truth((_n_s_b6 < 0)):
		var _n_yy_b7 = (_n_y_b5 - ((0.1 - _n_age_b0) * 600))
		if _S.truth(((_n_yy_b7 - 6) < (-48))):
			return null
		_S.invoke(_n_p,"line",[_n_x_b3, (_n_yy_b7 - 6), _n_x_b3, _n_yy_b7, _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f14")])
	else:
		if _S.truth((((pow((float(_n_x_b3)/_n_RX),2) + pow((float(_n_y_b5)/(_n_RX * _n_SY)),2)) < 0.9) if _S.truth((_n_s_b6 < 0.4)) else (_n_s_b6 < 0.4))):
			if _S.truth((_n_s_b6 < 0.04)):
				_S.invoke(_n_p,"px",[_n_x_b3, _n_y_b5, _S.index_value(_n_C,6)])
			_S.call_value(_n_ring,[_n_p, _n_x_b3, _n_y_b5, (1 + (_n_s_b6 * 9)), _n_SY, (0.8 * (1 - (float(_n_s_b6)/0.4))), _n_C, {"n":1,"half":1,"seed":40}])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,5) if _S.truth((_n_u_b0 > 0.6)) else _S.index_value(_n_C,3))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_t0_b1 = _S.arg(_args,1)
	return fmod((fmod((_n_t_b0 - _n_t0_b1),_n_D) + _n_D),_n_D)
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	return (3 + (34 * pow((float(_n_a_b0)/1.8),0.7)))
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	return (((1.3 * pow((1 - (float(_n_a_b0)/1.8)),1.3)) * minf(1,(float(_n_a_b0)/0.06))) if _S.truth((_n_a_b0 < 1.8)) else 0)
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_H_b1 = _S.arg(_args,1)
	return ((_n_H_b1 * pow(sin((PI * clampf((float(_n_a_b0)/0.3),0.0,1.0))),0.8)) * (1 if _S.truth((_n_a_b0 < 0.3)) else 0))
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	return (1.5 + (4.5 * sqrt(clampf((float(_n_a_b0)/0.3),0.0,1.0))))
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_J_b1 = _S.arg(_args,1)
	return ((_n_J_b1 * sin((float((PI * (_n_a_b0 - 0.26)))/0.3))) if _S.truth(((_n_a_b0 < 0.56) if _S.truth((_n_a_b0 > 0.26)) else (_n_a_b0 > 0.26))) else 0)
	return null
