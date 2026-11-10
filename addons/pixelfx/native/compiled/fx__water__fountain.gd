@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/fountain.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "bead", _S.import_value("fx/water/_lib.js", "bead"))
	_S.define(_e, "ring", _S.import_value("fx/water/_lib.js", "ring"))
	_S.define(_e, "rock", _S.import_value("fx/water/_lib.js", "rock"))
	_S.define(_e, "basin", _S.function_value(_e, "_f0"))
	_S.define(_e, "pool", _S.function_value(_e, "_f2"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f3"))
	_S.define(_e, "arc", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Fountain"}, {"desc": "A stone basin; a jet rises from its spout and blooms into glassy arcs that break into beads, fall back and plink into the water with rings."}, {"tags": ["water", "fountain", "jet", "basin", "prop", "ambient", "loop"]}, {"size": [120, 104]}, {"origin": [60, 96]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SY", 0.34)
	_S.define(_e, "G", 600)
	_S.define(_e, "RIM", 10)
	_S.define(_e, "RX", 36)
	_S.define(_e, "IN", 29.5)
	_S.define(_e, "JET", 54)
	_S.define(_e, "ARCS", 12)
	_S.define(_e, "BY", _S.binary("*", _S.unary("-", _S.read(_e, "RX")), _S.read(_e, "SY")))
	_S.define(_e, "LEVEL", _S.binary("-", _S.read(_e, "RIM"), 1.2))
	_S.define(_e, "arcs", _S.function_value(_e, "_f13"))
	_S.define(_e, "along", _S.function_value(_e, "_f15"))
	_S.define(_e, "inEll", _S.function_value(_e, "_f16"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_BY = _S.read(_parent,"BY")
	var _n_RIM = _S.read(_parent,"RIM")
	var _n_RX = _S.read(_parent,"RX")
	var _n_SY = _S.read(_parent,"SY")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_ST_b1 = _S.arg(_args,1)
	var _n_half_b2 = _S.arg(_args,2)
	var _n_cy_b3 = (_n_BY - _n_RIM)
	var _n_ry_b4 = (_n_RX * _n_SY)
	_S.invoke(_n_p_b0,"shade",[((-_n_RX) - 1), ((_n_cy_b3 - _n_ry_b4) - 1), (_n_RX + 1), 1, _S.function_value(_S.capture(_parent,{"cy":_n_cy_b3,"half":_n_half_b2,"ry":_n_ry_b4,"ST":_n_ST_b1,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_inEll = _S.read(_parent,"inEll")
	var _n_RX = _S.read(_parent,"RX")
	var _n_cy = _S.read(_parent,"cy")
	var _n_IN = _S.read(_parent,"IN")
	var _n_half = _S.read(_parent,"half")
	var _n_ry = _S.read(_parent,"ry")
	var _n_ST = _S.read(_parent,"ST")
	var _n_RIM = _S.read(_parent,"RIM")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	if _S.truth(_S.call_value(_n_inEll,[_n_x_b0, _n_y_b1, _n_RX, _n_cy])):
		if _S.truth(_S.call_value(_n_inEll,[_n_x_b0, _n_y_b1, _n_IN, _n_cy])):
			return null
		var _n_near_b11 = (_n_y_b1 > _n_cy)
		if _S.truth(_S.binary("!==",_n_near_b11,(_n_half > 0))):
			return null
		var _n_outer_b12 = _S.logical("||",_S.logical("||",_S.logical("||",not _S.truth(_S.call_value(_n_inEll,[_n_x_b0, (_n_y_b1 - 1), _n_RX, _n_cy])),func():return not _S.truth(_S.call_value(_n_inEll,[_n_x_b0, (_n_y_b1 + 1), _n_RX, _n_cy]))),func():return not _S.truth(_S.call_value(_n_inEll,[(_n_x_b0 - 1), _n_y_b1, _n_RX, _n_cy]))),func():return not _S.truth(_S.call_value(_n_inEll,[(_n_x_b0 + 1), _n_y_b1, _n_RX, _n_cy])))
		var _n_inner_b13 = _S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_inEll,[_n_x_b0, (_n_y_b1 - 1), _n_IN, _n_cy]),func():return _S.call_value(_n_inEll,[_n_x_b0, (_n_y_b1 + 1), _n_IN, _n_cy])),func():return _S.call_value(_n_inEll,[(_n_x_b0 - 1), _n_y_b1, _n_IN, _n_cy])),func():return _S.call_value(_n_inEll,[(_n_x_b0 + 1), _n_y_b1, _n_IN, _n_cy]))
		var _n_a_b14 = atan2((float((_n_y_b1 - _n_cy))/_n_ry),(float(_n_x_b0)/_n_RX))
		var _n_lit_b15 = (((-cos(_n_a_b14)) * 0.65) - (sin(_n_a_b14) * 0.45))
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_ST,0) if _S.truth(_n_outer_b12) else ((_S.index_value(_n_ST,2) if _S.truth((_n_y_b1 < _n_cy)) else _S.index_value(_n_ST,1)) if _S.truth(_n_inner_b13) else (_S.index_value(_n_ST,5) if _S.truth((_n_lit_b15 > 0.4)) else (_S.index_value(_n_ST,4) if _S.truth((_n_lit_b15 > (-0.05))) else (_S.index_value(_n_ST,3) if _S.truth((_n_lit_b15 > (-0.45))) else _S.index_value(_n_ST,2)))))),"=")
		return null
	if _S.truth(((_n_half < 0) if _S.truth((_n_half < 0)) else (absf(_n_x_b0) >= _n_RX))):
		return null
	var _n_dx_b3 = (float(_n_x_b0)/_n_RX)
	var _n_top_b4 = (_n_cy + (sqrt((1 - (_n_dx_b3 * _n_dx_b3))) * _n_ry))
	var _n_base_b5 = (_n_top_b4 + _n_RIM)
	if _S.truth(((_n_y_b1 < _n_top_b4) if _S.truth((_n_y_b1 < _n_top_b4)) else (_n_y_b1 > _n_base_b5))):
		return null
	var _n_u_b6 = ((asin(clampf(_n_dx_b3,0.0,1.0)) * _n_RX) * 0.62)
	var _n_block_b7 = fmod((fmod((float((_n_u_b6 + 40))/9),1) + 1),1)
	var _n_row_b8 = (_n_y_b1 - _n_top_b4)
	var _n_course_b9 = (1 if _S.truth((_n_row_b8 > (_n_RIM * 0.5))) else 0)
	var _n_joint_b10 = (fmod((fmod((float(((_n_u_b6 + 40) + (_n_course_b9 * 4.5)))/9),1) + 1),1) < 0.1)
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_ST,0) if _S.truth(_S.logical("||",((_n_y_b1 > (_n_base_b5 - 1)) if _S.truth((_n_y_b1 > (_n_base_b5 - 1))) else (absf(_n_x_b0) > (_n_RX - 1))),func():return (_n_row_b8 < 1))) else (_S.index_value(_n_ST,1) if _S.truth((_n_joint_b10 if _S.truth(_n_joint_b10) else (absf((_n_row_b8 - (_n_RIM * 0.5))) < 0.5))) else (_S.index_value(_n_ST,4) if _S.truth((_n_dx_b3 < (-0.4))) else (_S.index_value(_n_ST,3) if _S.truth((_n_dx_b3 < 0.3)) else _S.index_value(_n_ST,2))))),"=")
	if _S.truth((not _S.truth(_n_joint_b10) if _S.truth(((_n_row_b8 < 2) if _S.truth((_n_row_b8 >= 1)) else (_n_row_b8 >= 1))) else ((_n_row_b8 < 2) if _S.truth((_n_row_b8 >= 1)) else (_n_row_b8 >= 1)))):
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_ST,2) if _S.truth((_n_dx_b3 < 0)) else _S.index_value(_n_ST,1)),"=")
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_IN = _S.read(_parent,"IN")
	var _n_SY = _S.read(_parent,"SY")
	var _n_BY = _S.read(_parent,"BY")
	var _n_LEVEL = _S.read(_parent,"LEVEL")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.arg(_args,2)
	var _n_rx_b3 = _n_IN
	var _n_ry_b4 = (_n_rx_b3 * _n_SY)
	var _n_cy_b5 = (_n_BY - _n_LEVEL)
	var _n_T_b6 = (_n_ph_b2 * _n_TAU)
	if true:
		var _n_Y_b7 = floori((_n_cy_b5 - _n_ry_b4))
		while _S.truth((_n_Y_b7 < (_n_cy_b5 + _n_ry_b4))):
			if true:
				var _n_X_b8 = (-ceili(_n_rx_b3))
				while _S.truth((_n_X_b8 < _n_rx_b3)):
					var _n_x_b9 = (_n_X_b8 + 0.5)
					var _n_y_b10 = (_n_Y_b7 + 0.5)
					var _n_dx_b11 = (float(_n_x_b9)/_n_rx_b3)
					var _n_dy_b12 = (float((_n_y_b10 - _n_cy_b5))/_n_ry_b4)
					var _n_d_b13 = ((_n_dx_b11 * _n_dx_b11) + (_n_dy_b12 * _n_dy_b12))
					if _S.truth((_n_d_b13 > 1)):
						_n_X_b8 += 1.0
						continue
					_S.invoke(_n_p_b0,"blend",[_n_x_b9, _n_y_b10, (_S.index_value(_n_C_b1,3) if _S.truth((_n_dy_b12 < (-0.55))) else _S.index_value(_n_C_b1,1)), (0.8 if _S.truth((_n_dy_b12 < (-0.55))) else 0.85)])
					var _n_u_b14 = ((_n_x_b9 * 0.25) + (1.6 * sin(((_n_y_b10 * 0.6) + _n_T_b6))))
					var _n_w_b15 = ((_n_y_b10 * 0.7) + (1.6 * sin(((_n_x_b9 * 0.14) - (_n_T_b6 * 2)))))
					var _n_f_b16 = (maxf(0,(1 - (absf((sin(_n_u_b14) + sin(_n_w_b15))) * 2.6))) * (1 - _n_d_b13))
					if _S.truth((_n_f_b16 > 0.35)):
						_S.invoke(_n_p_b0,"light",[_n_x_b9, _n_y_b10, _S.index_value(_n_C_b1,5), (0.3 * _n_f_b16)])
					_n_X_b8 += 1.0
			_n_Y_b7 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_rock = _S.read(_parent,"rock")
	var _n_arcs = _S.read(_parent,"arcs")
	var _n_basin = _S.read(_parent,"basin")
	var _n_pool = _S.read(_parent,"pool")
	var _n_arc = _S.read(_parent,"arc")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_n_D)
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_ST_b6 = _S.call_value(_n_rock,[])
	var _n_Q_b7 = _S.call_value(_n_arcs,[_n_S_b5])
	_S.call_value(_n_basin,[_n_p_b0, _n_ST_b6, (-1)])
	_S.call_value(_n_pool,[_n_p_b0, _n_C_b3, _n_ph_b4])
	for _iter_0 in _S.array(_n_Q_b7):
		var _n_q_b8 = _iter_0
		if _S.truth((_S.named_value(_n_q_b8,"sa") < 0)):
			_S.call_value(_n_arc,[_n_p_b0, _n_C_b3, _n_q_b8, _n_ph_b4, true])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_along = _S.read(_parent,"along")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_G = _S.read(_parent,"G")
	var _n_SY = _S.read(_parent,"SY")
	var _n_bead = _S.read(_parent,"bead")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_q_b2 = _S.arg(_args,2)
	var _n_ph_b3 = _S.arg(_args,3)
	var _n_back_b4 = _S.arg(_args,4)
	var _n_prev_b5 = null
	if true:
		var _n_tau_b9 = 0
		while _S.truth((_n_tau_b9 <= _S.named_value(_n_q_b2,"tl"))):
			var _tuple_0 = _S.call_value(_n_along,[_n_q_b2, _n_tau_b9])
			var _n_x_b10 = _S.prop(_tuple_0,0)
			var _n_y_b11 = _S.prop(_tuple_0,1)
			var _n_u_b12 = (float(_n_tau_b9)/_S.named_value(_n_q_b2,"tl"))
			if _S.truth(((_n_u_b12 < 0.66) if _S.truth(_n_prev_b5) else _n_prev_b5)):
				_S.invoke(_n_p_b0,"line",[_S.index_value(_n_prev_b5,0), _S.index_value(_n_prev_b5,1), _n_x_b10, _n_y_b11, ((_S.index_value(_n_C_b1,5) if _S.truth((_n_u_b12 < 0.25)) else _S.index_value(_n_C_b1,4)) if _S.truth(_n_back_b4) else (_n_WHITE if _S.truth((_n_u_b12 < 0.2)) else (_S.index_value(_n_C_b1,6) if _S.truth((_n_u_b12 < 0.45)) else _S.index_value(_n_C_b1,5))))])
			_n_prev_b5 = [_n_x_b10, _n_y_b11]
			_n_tau_b9 += 0.012
	if true:
		var _n_k_b13 = 0
		while _S.truth((_n_k_b13 < 6)):
			var _n_u_b14 = ((fmod(((_n_ph_b3 * 2) + (float(_n_k_b13)/6)),1) * 0.42) + 0.58)
			var _n_tau_b15 = (_n_u_b14 * _S.named_value(_n_q_b2,"tl"))
			var _tuple_1 = _S.call_value(_n_along,[_n_q_b2, _n_tau_b15])
			var _n_x_b16 = _S.prop(_tuple_1,0)
			var _n_y_b17 = _S.prop(_tuple_1,1)
			var _n_vy_b18 = (((_S.named_value(_n_q_b2,"vh") - (_n_G * _n_tau_b15)) * (-1)) + ((_S.named_value(_n_q_b2,"sa") * _S.named_value(_n_q_b2,"vr")) * _n_SY))
			_S.call_value(_n_bead,[_n_p_b0, _n_x_b16, _n_y_b17, (_S.named_value(_n_q_b2,"ca") * _S.named_value(_n_q_b2,"vr")), _n_vy_b18, (1 if _S.truth(_n_back_b4) else (2 if _S.truth(_S.binary("===",fmod(_n_k_b13,3),0)) else 1)), ([_S.index_value(_n_C_b1,0), _S.index_value(_n_C_b1,1), _S.index_value(_n_C_b1,2), _S.index_value(_n_C_b1,2), _S.index_value(_n_C_b1,3), _S.index_value(_n_C_b1,4), _S.index_value(_n_C_b1,5), _S.index_value(_n_C_b1,5)] if _S.truth(_n_back_b4) else _n_C_b1)])
			_n_k_b13 += 1.0
	var _n_g_b6 = (fmod(((_n_ph_b3 * 4) + _S.named_value(_n_q_b2,"a")),1) * 0.6)
	var _tuple_2 = _S.call_value(_n_along,[_n_q_b2, (_n_g_b6 * _S.named_value(_n_q_b2,"tl"))])
	var _n_gx_b7 = _S.prop(_tuple_2,0)
	var _n_gy_b8 = _S.prop(_tuple_2,1)
	_S.invoke(_n_p_b0,"px",[_n_gx_b7, _n_gy_b8, _n_WHITE])
	if _S.truth(not _S.truth(_n_back_b4)):
		_S.invoke(_n_p_b0,"glow",[_n_gx_b7, _n_gy_b8, 3, _S.index_value(_n_C_b1,5), 0.3])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_rock = _S.read(_parent,"rock")
	var _n_arcs = _S.read(_parent,"arcs")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_BY = _S.read(_parent,"BY")
	var _n_LEVEL = _S.read(_parent,"LEVEL")
	var _n_JET = _S.read(_parent,"JET")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_arc = _S.read(_parent,"arc")
	var _n_basin = _S.read(_parent,"basin")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_n_D)
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_ST_b6 = _S.call_value(_n_rock,[])
	var _n_Q_b7 = _S.call_value(_n_arcs,[_n_S_b5])
	var _n_T_b8 = (_n_ph_b4 * _n_TAU)
	_S.invoke(_n_p_b0,"shade",[(-3.5), (_n_BY - 16), 3.5, ((_n_BY - _n_LEVEL) + 0.5), _S.function_value(_S.capture(_parent,{"ST":_n_ST_b6,"this":_this}),"_f6")])
	_S.invoke(_n_p_b0,"shade",[(-3), ((_n_BY - _n_JET) - 1), 3, (_n_BY - 16), _S.function_value(_S.capture(_parent,{"T":_n_T_b8,"ph":_n_ph_b4,"S":_n_S_b5,"C":_n_C_b3,"this":_this}),"_f7")])
	_S.invoke(_n_p_b0,"circle",[0, ((_n_BY - _n_JET) - 1), 2.4, _S.index_value(_n_C_b3,6)])
	_S.invoke(_n_p_b0,"circle",[(-0.4), ((_n_BY - _n_JET) - 1.5), 1.4, _n_WHITE])
	_S.invoke(_n_p_b0,"glow",[0, (_n_BY - _n_JET), 22, _S.index_value(_n_C_b3,5), (0.46 + (0.06 * sin((_n_T_b8 * 4))))])
	_S.invoke(_n_p_b0,"glow",[0, ((_n_BY - _n_JET) - 1), 8, _n_WHITE, 0.3])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 10, (_n_S_b5 + 30), _S.function_value(_S.capture(_parent,{"this":_this}),"_f8"), _S.function_value(_S.capture(_parent,{"Q":_n_Q_b7,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f9")])
	if true:
		var _n_i_b9 = 0
		while _S.truth((_n_i_b9 < 4)):
			_S.invoke(_n_p_b0,"px",[(sin(((_n_T_b8 * 3) + (_n_i_b9 * 1.7))) * 2.5), ((_n_BY - 16) - fmod(_n_i_b9,2)), (_S.index_value(_n_C_b3,6) if _S.truth(fmod(_n_i_b9,2)) else _n_WHITE)])
			_n_i_b9 += 1.0
	for _iter_0 in _S.array(_n_Q_b7):
		var _n_q_b10 = _iter_0
		if _S.truth((_S.named_value(_n_q_b10,"sa") >= 0)):
			_S.call_value(_n_arc,[_n_p_b0, _n_C_b3, _n_q_b10, _n_ph_b4, false])
	_S.invoke(_n_Q_b7,"forEach",[_S.function_value(_S.capture(_parent,{"ph":_n_ph_b4,"S":_n_S_b5,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f10")])
	_S.call_value(_n_basin,[_n_p_b0, _n_ST_b6, 1])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 16, (_n_S_b5 + 20), _S.function_value(_S.capture(_parent,{"this":_this}),"_f11"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f12")])
	_S.invoke(_n_p_b0,"glowLine",[0, (_n_BY - 16), 0, (_n_BY - _n_JET), 10, _S.index_value(_n_C_b3,5), 0.18])
	_S.invoke(_n_p_b0,"glow",[0, ((_n_BY - _n_LEVEL) - 2), 46, _S.index_value(_n_C_b3,4), (0.26 + (0.03 * sin((_n_T_b8 * 2))))])
	_S.invoke(_n_p_b0,"glow",[0, ((_n_BY - _n_LEVEL) - 20), 30, _S.index_value(_n_C_b3,5), 0.12])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_BY = _S.read(_parent,"BY")
	var _n_ST = _S.read(_parent,"ST")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_w_b3 = (3.4 if _S.truth((_n_y_b1 < (_n_BY - 14))) else 2.2)
	if _S.truth((absf(_n_x_b0) > _n_w_b3)):
		return null
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_ST,0) if _S.truth(_S.logical("||",(absf(_n_x_b0) > (_n_w_b3 - 0.8)),func():return (_n_y_b1 < (_n_BY - 15.5)))) else (_S.index_value(_n_ST,4) if _S.truth((_n_x_b0 < (-0.6))) else (_S.index_value(_n_ST,3) if _S.truth((_n_x_b0 < 0.8)) else _S.index_value(_n_ST,2)))),"=")
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_BY = _S.read(_parent,"BY")
	var _n_JET = _S.read(_parent,"JET")
	var _n_T = _S.read(_parent,"T")
	var _n_ph = _S.read(_parent,"ph")
	var _n_S = _S.read(_parent,"S")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_v_b3 = (float(((_n_BY - 16) - _n_y_b1))/(_n_JET - 16))
	var _n_sway_b4 = ((sin(((_n_T * 2) + (_n_v_b3 * 5))) * 0.5) * _n_v_b3)
	var _n_w_b5 = ((1.3 + (0.5 * _n_v_b3)) + (0.3 * sin(((_n_T * 3) + (_n_y_b1 * 0.4)))))
	var _n_q_b6 = (float((_n_x_b0 - _n_sway_b4))/_n_w_b5)
	if _S.truth((absf(_n_q_b6) > 1)):
		return null
	var _n_n_b7 = _S.NoiseKernels.tile_noise((_n_x_b0 * 0.9),((_n_y_b1 * 0.15) + (_n_ph * 16)),0,16,_n_S)
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,6) if _S.truth((_n_q_b6 < (-0.4))) else ((_n_WHITE if _S.truth((_n_n_b7 > (-0.3))) else _S.index_value(_n_C,6)) if _S.truth((_n_q_b6 < 0.35)) else _S.index_value(_n_C,5))),"=")
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.2, 0.35])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_Q = _S.read(_parent,"Q")
	var _n_ARCS = _S.read(_parent,"ARCS")
	var _n_along = _S.read(_parent,"along")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.index_value(_n_Q,floori((_S.invoke(_n_r_b2,"next",[]) * _n_ARCS)))
	var _tuple_0 = _S.call_value(_n_along,[_n_q_b3, (_S.invoke(_n_r_b2,"range",[0.1, 0.7]) * _S.named_value(_n_q_b3,"tl"))])
	var _n_x_b4 = _S.prop(_tuple_0,0)
	var _n_y_b5 = _S.prop(_tuple_0,1)
	var _n_k_b6 = sin((float((PI * _n_age_b0))/_n_life_b1))
	if _S.truth((_S.named_value(_n_q_b3,"sa") < (-0.3))):
		return null
	_S.invoke(_n_p,"px",[_n_x_b4, _n_y_b5, _n_WHITE])
	if _S.truth((_n_k_b6 > 0.6)):
		for _iter_1 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
			var _tuple_2 = _iter_1
			var _n_dx_b7 = _S.prop(_tuple_2,0)
			var _n_dy_b8 = _S.prop(_tuple_2,1)
			_S.invoke(_n_p,"px",[(_n_x_b4 + _n_dx_b7), (_n_y_b5 + _n_dy_b8), _S.index_value(_n_C,6)])
	_S.invoke(_n_p,"glow",[_n_x_b4, _n_y_b5, 5, _S.index_value(_n_C,5), (0.4 * _n_k_b6)])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_ph = _S.read(_parent,"ph")
	var _n_S = _S.read(_parent,"S")
	var _n_along = _S.read(_parent,"along")
	var _n_p = _S.read(_parent,"p")
	var _n_SY = _S.read(_parent,"SY")
	var _n_C = _S.read(_parent,"C")
	var _n_ring = _S.read(_parent,"ring")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_f_b2 = fmod(((_n_ph * 2) + _S.MathFX.rand([_n_i_b1,(_n_S + 9)])),1)
	var _tuple_0 = _S.call_value(_n_along,[_n_q_b0, _S.named_value(_n_q_b0,"tl")])
	var _n_x_b3 = _S.prop(_tuple_0,0)
	var _n_y_b4 = _S.prop(_tuple_0,1)
	_S.call_value(_n_ring,[_n_p, _n_x_b3, _n_y_b4, (2 + (_n_f_b2 * 8)), _n_SY, (0.8 * pow((1 - _n_f_b2),1.3)), _n_C, {"n":1,"half":1,"seed":_n_i_b1}])
	var _n_g_b5 = fmod(((_n_ph * 6) + _S.MathFX.rand([_n_i_b1,(_n_S + 10)])),1)
	if _S.truth((_n_g_b5 < 0.15)):
		_S.invoke(_n_p,"px",[_n_x_b3, (_n_y_b4 - 1), _n_WHITE])
	if _S.truth(((_S.named_value(_n_q_b0,"sa") > (-0.2)) if _S.truth((_n_g_b5 < 0.3)) else (_n_g_b5 < 0.3))):
		_S.invoke(_n_p,"line",[_n_x_b3, (_n_y_b4 - 1), (_n_x_b3 + ((_S.MathFX.rand([_n_i_b1,(_n_S + 11)]) - 0.5) * 2)), ((_n_y_b4 - 1) - (3 * (1 - (float(_n_g_b5)/0.3)))), _S.index_value(_n_C,6)])
	_S.invoke(_n_p,"glow",[_n_x_b3, _n_y_b4, 6, _S.index_value(_n_C,5), (0.18 * (1 - _n_g_b5))])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.8, 1.4])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_BY = _S.read(_parent,"BY")
	var _n_JET = _S.read(_parent,"JET")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_a_b4 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	var _n_rr_b5 = (_S.invoke(_n_r_b2,"range",[4, 20]) + (_n_k_b3 * 6))
	var _n_x_b6 = (cos(_n_a_b4) * _n_rr_b5)
	var _n_y_b7 = (((_n_BY - _n_JET) + _S.invoke(_n_r_b2,"range",[(-4), 16])) + (_n_k_b3 * 10))
	if _S.truth(((_S.invoke(_n_r_b2,"next",[]) < ((_n_k_b3 - 0.75) * 4)) if _S.truth((_n_k_b3 > 0.75)) else (_n_k_b3 > 0.75))):
		return null
	_S.invoke(_n_p,"px",[_n_x_b6, _n_y_b7, (_n_WHITE if _S.truth((_S.invoke(_n_r_b2,"next",[]) < 0.4)) else _S.index_value(_n_C,6))])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_ARCS = _S.read(_parent,"ARCS")
	var _n_this = _S.read(_parent,"this")
	var _n_S_b0 = _S.arg(_args,0)
	return _S.invoke(_n_Array,"from",[{"length":_n_ARCS}, _S.function_value(_S.capture(_parent,{"S":_n_S_b0,"this":_n_this}),"_f14")])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_ARCS = _S.read(_parent,"ARCS")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_S = _S.read(_parent,"S")
	var _n_G = _S.read(_parent,"G")
	var _n_JET = _S.read(_parent,"JET")
	var _n_LEVEL = _S.read(_parent,"LEVEL")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_a_b2 = (((float((_n_i_b1 + 0.5))/_n_ARCS) * _n_TAU) + (_S.MathFX.rand([_n_i_b1,_n_S]) * 0.25))
	var _n_vr_b3 = (38 + (14 * _S.MathFX.rand([_n_i_b1,(_n_S + 1)])))
	var _n_vh_b4 = (30 + (26 * _S.MathFX.rand([_n_i_b1,(_n_S + 2)])))
	var _n_tl_b5 = (float((_n_vh_b4 + sqrt(((_n_vh_b4 * _n_vh_b4) + ((2 * _n_G) * (_n_JET - _n_LEVEL))))))/_n_G)
	return {"a":_n_a_b2,"vr":_n_vr_b3,"vh":_n_vh_b4,"tl":_n_tl_b5,"ca":cos(_n_a_b2),"sa":sin(_n_a_b2)}
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_JET = _S.read(_parent,"JET")
	var _n_G = _S.read(_parent,"G")
	var _n_BY = _S.read(_parent,"BY")
	var _n_SY = _S.read(_parent,"SY")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_tau_b1 = _S.arg(_args,1)
	var _n_r_b2 = (_S.named_value(_n_q_b0,"vr") * _n_tau_b1)
	var _n_h_b3 = ((_n_JET + (_S.named_value(_n_q_b0,"vh") * _n_tau_b1)) - (((0.5 * _n_G) * _n_tau_b1) * _n_tau_b1))
	return [(_S.named_value(_n_q_b0,"ca") * _n_r_b2), ((_n_BY + ((_S.named_value(_n_q_b0,"sa") * _n_r_b2) * _n_SY)) - _n_h_b3), _n_h_b3]
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_SY = _S.read(_parent,"SY")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_rx_b2 = _S.arg(_args,2)
	var _n_cy_b3 = _S.arg(_args,3)
	return ((pow((float(_n_x_b0)/_n_rx_b2),2) + pow((float((_n_y_b1 - _n_cy_b3))/(_n_rx_b2 * _n_SY)),2)) <= 1)
	return null
