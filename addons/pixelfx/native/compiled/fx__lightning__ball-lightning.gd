@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/ball-lightning.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "flight", _S.import_value("fx/lightning/_lib.js", "flight"))
	_S.define(_e, "spark", _S.import_value("fx/lightning/_lib.js", "spark"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Ball lightning"}, {"desc": "A crackling ball of plasma drifts on a wandering loop, spitting arcs off its skin and leaving a wake of fading motes, and zaps the floor when it dips low."}, {"tags": ["lightning", "electric", "plasma", "orb", "wisp", "ambient", "loop"]}, {"size": [136, 104]}, {"origin": [68, 92]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FPS", 30)
	_S.define(_e, "N", 120)
	_S.define(_e, "P", 4)
	_S.define(_e, "ZAP", 62)
	_S.define(_e, "at", _S.function_value(_e, "_f3"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_FPS = _S.read(_parent,"FPS")
	var _n_N = _S.read(_parent,"N")
	var _n_at = _S.read(_parent,"at")
	var _n_P = _S.read(_parent,"P")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_zigzag = _S.read(_parent,"zigzag")
	var _n_crackle = _S.read(_parent,"crackle")
	var _n_ZAP = _S.read(_parent,"ZAP")
	var _n_stroke = _S.read(_parent,"stroke")
	var _n_flight = _S.read(_parent,"flight")
	var _n_spark = _S.read(_parent,"spark")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_S_b4 = _S.invoke(_S.named_value(_n_o_b2,"sparks"),"map",[_n_hex])
	var _n_f_b5 = fmod(floori(((_n_t_b1 * _n_FPS) + 0.000001)),_n_N)
	var _n_r_b6 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),1,_n_f_b5])
	var _tuple_0 = _S.call_value(_n_at,[_n_t_b1])
	var _n_x_b7 = _S.prop(_tuple_0,0)
	var _n_y_b8 = _S.prop(_tuple_0,1)
	_S.invoke(_n_p_b0,"glow",[_n_x_b7, (-2), 30, _S.index_value(_n_C_b3,3), (0.12 + (0.3 * clampf((float((_n_y_b8 + 60))/40),0.0,1.0)))])
	if true:
		var _n_i_b14 = 14
		while _S.truth((_n_i_b14 >= 1)):
			var _tuple_1 = _S.call_value(_n_at,[(_n_t_b1 - (_n_i_b14 * 0.034))])
			var _n_wx_b15 = _S.prop(_tuple_1,0)
			var _n_wy_b16 = _S.prop(_tuple_1,1)
			var _n_u_b17 = (float(_n_i_b14)/14)
			var _n_rr_b18 = ((3 * (1 - _n_u_b17)) + 0.3)
			if _S.truth((fmod((_n_i_b14 + _n_f_b5),2) if _S.truth((_n_u_b17 > 0.6)) else (_n_u_b17 > 0.6))):
				_n_i_b14 -= 1.0
				continue
			_S.invoke(_n_p_b0,"circle",[_n_wx_b15, _n_wy_b16, (_n_rr_b18 + 0.8), (_S.index_value(_n_C_b3,3) if _S.truth((_n_u_b17 < 0.35)) else _S.index_value(_n_C_b3,2))])
			_S.invoke(_n_p_b0,"circle",[_n_wx_b15, _n_wy_b16, _n_rr_b18, (_S.index_value(_n_C_b3,6) if _S.truth((_n_u_b17 < 0.35)) else (_S.index_value(_n_C_b3,5) if _S.truth((_n_u_b17 < 0.7)) else _S.index_value(_n_C_b3,4)))])
			_S.invoke(_n_p_b0,"glow",[_n_wx_b15, _n_wy_b16, ((7 * (1 - _n_u_b17)) + 3), _S.index_value(_n_C_b3,4), (0.25 * (1 - _n_u_b17))])
			_n_i_b14 -= 1.0
	_S.call_value(_n_cycle,[_n_t_b1, _n_P, 40, (_S.named_value(_n_o_b2,"seed") + 5), _S.function_value(_S.capture(_parent,{"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"f":_n_f_b5,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f2")])
	var _n_R0_b9 = ((5.2 + (0.6 * sin((_n_t_b1 * 9)))) + (0.4 * _S.invoke(_n_r_b6,"range",[(-1), 1])))
	_S.invoke(_n_p_b0,"circle",[_n_x_b7, _n_y_b8, (_n_R0_b9 + 1.3), _S.index_value(_n_C_b3,2)])
	_S.invoke(_n_p_b0,"circle",[_n_x_b7, _n_y_b8, _n_R0_b9, _S.index_value(_n_C_b3,4)])
	_S.invoke(_n_p_b0,"circle",[(_n_x_b7 - 0.4), (_n_y_b8 - 0.4), (_n_R0_b9 * 0.72), _S.index_value(_n_C_b3,5)])
	if true:
		var _n_i_b19 = 0
		while _S.truth((_n_i_b19 < 3)):
			var _n_a_b20 = ((_n_t_b1 * (5 + (_n_i_b19 * 2.3))) + (_n_i_b19 * 2.1))
			var _n_d_b21 = (_n_R0_b9 * 0.6)
			_S.invoke(_n_p_b0,"circle",[(_n_x_b7 + (cos(_n_a_b20) * _n_d_b21)), (_n_y_b8 + ((sin(_n_a_b20) * _n_d_b21) * 0.8)), 1.2, (_S.index_value(_n_C_b3,6) if _S.truth(_n_i_b19) else _n_WHITE)])
			_n_i_b19 += 1.0
	_S.invoke(_n_p_b0,"circle",[(_n_x_b7 - 0.6), (_n_y_b8 - 0.6), (_n_R0_b9 * 0.32), _n_WHITE])
	if true:
		var _n_i_b22 = 0
		while _S.truth((_n_i_b22 < 8)):
			if _S.truth((_S.invoke(_n_r_b6,"next",[]) < 0.35)):
				_n_i_b22 += 1.0
				continue
			var _n_a_b23 = ((((float(_n_i_b22)/8) * _n_TAU) + (_n_t_b1 * 2)) + _S.invoke(_n_r_b6,"range",[(-0.2), 0.2]))
			var _n_l_b24 = _S.invoke(_n_r_b6,"range",[1.5, 4])
			_S.invoke(_n_p_b0,"line",[(_n_x_b7 + (cos(_n_a_b23) * (_n_R0_b9 + 1))), (_n_y_b8 + (sin(_n_a_b23) * (_n_R0_b9 + 1))), (_n_x_b7 + (cos(_n_a_b23) * ((_n_R0_b9 + 1) + _n_l_b24))), (_n_y_b8 + (sin(_n_a_b23) * ((_n_R0_b9 + 1) + _n_l_b24))), (_S.index_value(_n_C_b3,5) if _S.truth(fmod(_n_i_b22,2)) else _S.index_value(_n_C_b3,4))])
			_n_i_b22 += 1.0
	_S.invoke(_n_p_b0,"glow",[_n_x_b7, _n_y_b8, 30, _S.index_value(_n_C_b3,4), 0.3])
	_S.invoke(_n_p_b0,"glow",[_n_x_b7, _n_y_b8, 9, _S.index_value(_n_C_b3,6), 0.1])
	if true:
		var _n_i_b25 = 0
		while _S.truth((_n_i_b25 < (2 + (1 if _S.truth((_S.invoke(_n_r_b6,"next",[]) < 0.4)) else 0)))):
			var _n_a_b26 = _S.invoke(_n_r_b6,"range",[0, _n_TAU])
			var _n_l_b27 = _S.invoke(_n_r_b6,"range",[5, 11])
			var _n_x0_b28 = (_n_x_b7 + (cos(_n_a_b26) * (_n_R0_b9 + 1)))
			var _n_y0_b29 = (_n_y_b8 + (sin(_n_a_b26) * (_n_R0_b9 + 1)))
			var _n_b_b30 = (_n_a_b26 + _S.invoke(_n_r_b6,"range",[(-0.7), 0.7]))
			_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_n_r_b6, _n_x0_b28, _n_y0_b29, (_n_x0_b28 + (cos(_n_b_b30) * _n_l_b27)), (_n_y0_b29 + (sin(_n_b_b30) * _n_l_b27)), 0.4, 0.3]), _S.invoke(_n_r_b6,"range",[0.4, 0.7]), _n_C_b3, 0.25])
			_n_i_b25 += 1.0
	var _n_za_b10 = (_n_f_b5 - _n_ZAP)
	var _tuple_2 = _S.call_value(_n_at,[(float(_n_ZAP)/_n_FPS)])
	var _n_zx_b11 = _S.prop(_tuple_2,0)
	var _n_gx_b12 = (_n_zx_b11 + _S.invoke(_S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),3]),"range",[(-10), 10]))
	if _S.truth(((_n_za_b10 < 4) if _S.truth((_n_za_b10 >= 0)) else (_n_za_b10 >= 0))):
		var _n_k_b31 = _S.index_value([1, 0.6, 0.9, 0.4],_n_za_b10)
		_S.call_value(_n_stroke,[_n_p_b0, _S.call_value(_n_zigzag,[_S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),4,_n_f_b5]), _n_x_b7, (_n_y_b8 + _n_R0_b9), _n_gx_b12, 0, 0.28, 0.4]), _n_k_b31, _n_C_b3, 0.7, {"hero":_S.binary("===",_n_za_b10,0)}])
		_S.invoke(_n_p_b0,"circle",[_n_gx_b12, (-1), ((2.5 * _n_k_b31) + 1), _S.index_value(_n_C_b3,5)])
		_S.invoke(_n_p_b0,"px",[_n_gx_b12, (-1), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[_n_gx_b12, (-4), 34, _S.index_value(_n_C_b3,4), (0.6 * _n_k_b31)])
	var _n_sa_b13 = fmod((fmod((_n_t_b1 - (float(_n_ZAP)/_n_FPS)),_n_P) + _n_P),_n_P)
	if true:
		var _n_j_b32 = 0
		while _S.truth((_n_j_b32 < 14)):
			var _n_q_b33 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),7,_n_j_b32])
			var _n_life_b34 = _S.invoke(_n_q_b33,"range",[0.25, 0.55])
			if _S.truth((_n_sa_b13 >= _n_life_b34)):
				_n_j_b32 += 1.0
				continue
			var _n_a_b35 = ((float((-PI))/2) + _S.invoke(_n_q_b33,"range",[(-1.3), 1.3]))
			var _n_sp_b36 = _S.invoke(_n_q_b33,"range",[50, 170])
			var _tuple_3 = _S.call_value(_n_flight,[_n_gx_b12, (-1), (cos(_n_a_b35) * _n_sp_b36), (sin(_n_a_b35) * _n_sp_b36), _n_sa_b13, {"floor":0}])
			var _n_sx_b37 = _S.prop(_tuple_3,0)
			var _n_sy_b38 = _S.prop(_tuple_3,1)
			var _n_vx_b39 = _S.prop(_tuple_3,2)
			var _n_vy_b40 = _S.prop(_tuple_3,3)
			_S.call_value(_n_spark,[_n_p_b0, _n_sx_b37, _n_sy_b38, _n_vx_b39, _n_vy_b40, (1 - (float(_n_sa_b13)/_n_life_b34)), _n_S_b4])
			_n_j_b32 += 1.0
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.5, 1])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_at = _S.read(_parent,"at")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_f = _S.read(_parent,"f")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_q_b2 = _S.arg(_args,2)
	var _n_born_b3 = (_n_t - _n_age_b0)
	var _tuple_0 = _S.call_value(_n_at,[_n_born_b3])
	var _n_bx_b4 = _S.prop(_tuple_0,0)
	var _n_by_b5 = _S.prop(_tuple_0,1)
	var _n_k_b6 = (1 - (float(_n_age_b0)/_n_life_b1))
	var _n_a_b7 = _S.invoke(_n_q_b2,"range",[0, _n_TAU])
	var _n_sp_b8 = _S.invoke(_n_q_b2,"range",[4, 14])
	var _n_mx_b9 = ((_n_bx_b4 + ((cos(_n_a_b7) * _n_sp_b8) * _n_age_b0)) + _S.invoke(_n_q_b2,"range",[(-3), 3]))
	var _n_my_b10 = (((_n_by_b5 + ((sin(_n_a_b7) * _n_sp_b8) * _n_age_b0)) + (6 * _n_age_b0)) + _S.invoke(_n_q_b2,"range",[(-3), 3]))
	if _S.truth(((_n_k_b6 > 0.25) if _S.truth((_n_k_b6 > 0.25)) else fmod(_n_f,2))):
		_S.invoke(_n_p,"px",[_n_mx_b9, _n_my_b10, (_S.index_value(_n_C,6) if _S.truth((_n_k_b6 > 0.6)) else (_S.index_value(_n_C,4) if _S.truth((_n_k_b6 > 0.3)) else _S.index_value(_n_C,3)))])
	_S.invoke(_n_p,"glow",[_n_mx_b9, _n_my_b10, 3, _S.index_value(_n_C,4), (0.3 * _n_k_b6)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_P = _S.read(_parent,"P")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_a_b1 = ((float(_n_t_b0)/_n_P) * _n_TAU)
	return [((38 * sin(_n_a_b1)) + (9 * sin(((2 * _n_a_b1) + 1)))), (((-42) + (13 * sin(((2 * _n_a_b1) + 0.4)))) + (6 * sin(((3 * _n_a_b1) + 0.5))))]
	return null
