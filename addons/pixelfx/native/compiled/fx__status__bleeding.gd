@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/bleeding.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "travel", _S.import_value("fx/status/_lib.js", "travel"))
	_S.define(_e, "wounds", _S.function_value(_e, "_f0"))
	_S.define(_e, "drop", _S.function_value(_e, "_f4"))
	_S.define(_e, "splat", _S.function_value(_e, "_f5"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f6"))
	_S.define(_e, "draw", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Bleeding"}, {"desc": "Bleeding out: beads swell at three wounds, run, let go and fall to spatter into a glossy pool that ripples; each heartbeat spurts a little and flashes the body red."}, {"tags": ["status", "bleed", "blood", "dot", "debuff", "wound", "loop"]}, {"size": [60, 56]}, {"origin": [30, 46]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#350711", "#5e0c1b", "#931327", "#c71e33", "#f2384a", "#ff8a7a"]}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CLUTCH", _S.merge([{"turn": 0.7}, {"crouch": 3}, {"lean": 2}, {"fx": 2}, {"fy": _S.unary("-", 21)}, {"bx": 8}, {"by": _S.unary("-", 14)}, {"ffx": 3}, {"fbx": _S.unary("-", 3)}]))
	_S.define(_e, "BEAT_", _S.merge([_S.read(_e, "CLUTCH"), {"crouch": 5}, {"lean": 4}, {"hy": 1}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "BEAT_")], [0.18, _S.read(_e, "CLUTCH")], [1.2, _S.read(_e, "CLUTCH")], [1.2, _S.read(_e, "BEAT_"), "snap"], [1.38, _S.read(_e, "CLUTCH")], [2.4, _S.read(_e, "CLUTCH")], [2.4, _S.read(_e, "BEAT_"), "snap"]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "BEAT", _S.binary("/", _S.read(_e, "D"), 2))
	_S.define(_e, "G", 900)
	_S.define(_e, "WOUNDS", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "w", _S.invoke(_S.read(_e, "WOUNDS"), "get", [_S.prop(_S.read(_e, "a"), "mask")]))
	if _S.truth(_S.read(_e, "w")):
		return _S.read(_e, "w")
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "S"), "h"))
	_S.define(_e, "W", _S.prop(_S.read(_e, "S"), "w"))
	_S.define(_e, "make", _S.function_value(_e, "_f1"))
	_S.define(_e, "edge", _S.function_value(_e, "_f2"))
	_S.define(_e, "front", _S.logical("??", _S.prop(_S.invoke(_S.prop(_S.read(_e, "S"), "body"), "filter", [_S.function_value(_e, "_f3")]), 0), func(): return _S.call_value(_S.read(_e, "edge"), [0.55, 1])))
	_S.write(_e, "w", [_S.call_value(_S.read(_e, "make"), _S.concat([_S.array(_S.call_value(_S.read(_e, "edge"), [0.57, _S.unary("-", 1)])), [3], [0]])), _S.call_value(_S.read(_e, "make"), _S.concat([_S.array(_S.read(_e, "front")), [2], [0.35]])), _S.call_value(_S.read(_e, "make"), _S.concat([_S.array(_S.call_value(_S.read(_e, "edge"), [0.6, 1])), [2], [0.7]]))], "=", false)
	_S.invoke(_S.read(_e, "WOUNDS"), "set", [_S.prop(_S.read(_e, "a"), "mask"), _S.read(_e, "w")])
	return _S.read(_e, "w")

static func _f1(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_a = _S.read(_parent,"a")
	var _n_W = _S.read(_parent,"W")
	var _n_mx_b0 = _S.arg(_args,0)
	var _n_my_b1 = _S.arg(_args,1)
	var _n_drops_b2 = _S.arg(_args,2)
	var _n_phase_b3 = _S.arg(_args,3)
	var _n_run_b4 = 1
	while _S.truth((_S.invoke(_n_S,"on",[_n_mx_b0, ((_n_my_b1 + _n_run_b4) + 1)]) if _S.truth((_n_run_b4 < 3)) else (_n_run_b4 < 3))):
		_n_run_b4 += 1.0
	return {"x":((_S.named_value(_n_a,"x") + _n_mx_b0) + 0.5),"mx":_n_mx_b0,"y0":(_S.named_value(_n_a,"y") + _n_my_b1),"yb":(((_S.named_value(_n_a,"y") + _n_my_b1) + _n_run_b4) + 1),"drops":_n_drops_b2,"phase":_n_phase_b3,"side":((-1) if _S.truth((_n_mx_b0 < (float(_n_W)/2))) else 1)}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_S = _S.read(_parent,"S")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_side_b1 = _S.arg(_args,1)
	var _n_my_b2 = floori((_n_H * _n_q_b0)+0.5)
	var _tuple_0 = _S.index_value(_S.named_value(_n_S,"rows"),_n_my_b2)
	var _n_l_b3 = _S.prop(_tuple_0,0)
	var _n_r_b4 = _S.prop(_tuple_0,1)
	return [((_n_l_b3 + 1) if _S.truth((_n_side_b1 < 0)) else (_n_r_b4 - 1)), _n_my_b2]
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _n_S = _S.read(_parent,"S")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return (_S.invoke(_n_S,"on",[_n_x_b0, (_n_y_b1 + 3)]) if _S.truth(((_n_x_b0 < (_n_W * 0.75)) if _S.truth(((_n_x_b0 > (_n_W * 0.55)) if _S.truth(((_n_y_b1 < (_n_H * 0.62)) if _S.truth((_n_y_b1 > (_n_H * 0.5))) else (_n_y_b1 > (_n_H * 0.5)))) else ((_n_y_b1 < (_n_H * 0.62)) if _S.truth((_n_y_b1 > (_n_H * 0.5))) else (_n_y_b1 > (_n_H * 0.5))))) else ((_n_x_b0 > (_n_W * 0.55)) if _S.truth(((_n_y_b1 < (_n_H * 0.62)) if _S.truth((_n_y_b1 > (_n_H * 0.5))) else (_n_y_b1 > (_n_H * 0.5)))) else ((_n_y_b1 < (_n_H * 0.62)) if _S.truth((_n_y_b1 > (_n_H * 0.5))) else (_n_y_b1 > (_n_H * 0.5)))))) else ((_n_x_b0 < (_n_W * 0.75)) if _S.truth(((_n_x_b0 > (_n_W * 0.55)) if _S.truth(((_n_y_b1 < (_n_H * 0.62)) if _S.truth((_n_y_b1 > (_n_H * 0.5))) else (_n_y_b1 > (_n_H * 0.5)))) else ((_n_y_b1 < (_n_H * 0.62)) if _S.truth((_n_y_b1 > (_n_H * 0.5))) else (_n_y_b1 > (_n_H * 0.5))))) else ((_n_x_b0 > (_n_W * 0.55)) if _S.truth(((_n_y_b1 < (_n_H * 0.62)) if _S.truth((_n_y_b1 > (_n_H * 0.5))) else (_n_y_b1 > (_n_H * 0.5)))) else ((_n_y_b1 < (_n_H * 0.62)) if _S.truth((_n_y_b1 > (_n_H * 0.5))) else (_n_y_b1 > (_n_H * 0.5))))))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_v_b4 = _S.arg(_args,4)
	var _n_s_b5 = _S.arg(_args,5)
	var _n_tail_b6 = minf(5,(_n_v_b4 * 0.012))
	if _S.truth((_n_tail_b6 >= 1)):
		_S.invoke(_n_p_b0,"line",[_n_x_b2, (_n_y_b3 - _n_tail_b6), _n_x_b2, (_n_y_b3 - 1), (_S.index_value(_n_C_b1,3) if _S.truth((_n_s_b5 >= 2)) else _S.index_value(_n_C_b1,2))])
	if _S.truth((_n_s_b5 >= 2)):
		_S.invoke(_n_p_b0,"px",[_n_x_b2, _n_y_b3, _S.index_value(_n_C_b1,5)])
		_S.invoke(_n_p_b0,"px",[(_n_x_b2 + 1), _n_y_b3, _S.index_value(_n_C_b1,4)])
		_S.invoke(_n_p_b0,"px",[_n_x_b2, (_n_y_b3 + 1), _S.index_value(_n_C_b1,3)])
		_S.invoke(_n_p_b0,"px",[(_n_x_b2 + 1), (_n_y_b3 + 1), _S.index_value(_n_C_b1,2)])
	else:
		_S.invoke(_n_p_b0,"px",[_n_x_b2, _n_y_b3, _S.index_value(_n_C_b1,4)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_G = _S.read(_parent,"G")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_ground_b3 = _S.arg(_args,3)
	var _n_age_b4 = _S.arg(_args,4)
	var _n_big_b5 = _S.arg(_args,5)
	var _n_seed_b6 = _S.arg(_args,6)
	var _n_life_b7 = (_n_D * 0.85)
	if _S.truth(((_n_age_b4 < 0) if _S.truth((_n_age_b4 < 0)) else (_n_age_b4 > _n_life_b7))):
		return null
	var _n_spread_b8 = _S.MathFX.smooth(0,0.1,_n_age_b4)
	var _n_hw_b9 = ((2.2 if _S.truth(_n_big_b5) else 1.4) * (0.5 + (0.5 * _n_spread_b8)))
	var _n_fade_b10 = (1 - _S.MathFX.smooth((_n_life_b7 - 0.5),_n_life_b7,_n_age_b4))
	var _n_dry_b11 = (4 if _S.truth((_n_age_b4 < 0.35)) else (3 if _S.truth((_n_age_b4 < 1)) else 2))
	if true:
		var _n_xx_b12 = floori((_n_x_b2 - _n_hw_b9))
		while _S.truth((_n_xx_b12 <= ceili((_n_x_b2 + _n_hw_b9)))):
			_S.invoke(_n_p_b0,"dot",[_n_xx_b12, (_n_ground_b3 - 1), (_S.index_value(_n_C_b1,(_n_dry_b11 - 1)) if _S.truth((absf(((_n_xx_b12 + 0.5) - _n_x_b2)) > (_n_hw_b9 * 0.75))) else _S.index_value(_n_C_b1,_n_dry_b11)), _n_fade_b10])
			_n_xx_b12 += 1.0
	if _S.truth((_n_age_b4 < 0.3)):
		_S.invoke(_n_p_b0,"px",[(_n_x_b2 - 0.5), (_n_ground_b3 - 1), _S.index_value(_n_C_b1,5)])
	if _S.truth((_n_age_b4 < 0.4)):
		if true:
			var _n_j_b13 = 0
			while _S.truth((_n_j_b13 < (3 if _S.truth(_n_big_b5) else 2))):
				var _n_vx_b14 = ((1 if _S.truth(fmod(_n_j_b13,2)) else (-1)) * (18 + (24 * _S.MathFX.rand([_n_seed_b6,_n_j_b13,1]))))
				var _n_vy_b15 = (-(40 + (40 * _S.MathFX.rand([_n_seed_b6,_n_j_b13,2]))))
				var _n_tt_b16 = _n_age_b4
				var _n_dx_b17 = (_n_vx_b14 * _n_tt_b16)
				var _n_dy_b18 = ((_n_vy_b15 * _n_tt_b16) + (((0.5 * _n_G) * _n_tt_b16) * _n_tt_b16))
				if _S.truth((_n_dy_b18 <= 0)):
					_S.invoke(_n_p_b0,"px",[(_n_x_b2 + _n_dx_b17), ((_n_ground_b3 - 1) + _n_dy_b18), (_S.index_value(_n_C_b1,3) if _S.truth(_n_j_b13) else _S.index_value(_n_C_b1,4))])
				_n_j_b13 += 1.0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_wounds = _S.read(_parent,"wounds")
	var _n_BEAT = _S.read(_parent,"BEAT")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),6)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_W_b5 = _S.call_value(_n_wounds,[_n_a_b4])
	var _n_px_b6 = ((float((_S.named_value(_S.index_value(_n_W_b5,0),"x") + _S.named_value(_S.index_value(_n_W_b5,2),"x")))/2) - 1)
	var _n_rx_b7 = 6.5
	var _n_beat_b8 = exp((-(float(fmod((fmod(_n_t_b1,_n_BEAT) + _n_BEAT),_n_BEAT))/0.25)))
	if true:
		var _n_x_b9 = floori(((_n_px_b6 - _n_rx_b7) - 1))
		while _S.truth((_n_x_b9 <= ((_n_px_b6 + _n_rx_b7) + 1))):
			var _n_q_b10 = (float(absf(((_n_x_b9 + 0.5) - _n_px_b6)))/_n_rx_b7)
			if _S.truth((_n_q_b10 > 1.1)):
				_n_x_b9 += 1.0
				continue
			_S.invoke(_n_p_b0,"px",[_n_x_b9, (-1), (_S.index_value(_n_C_b3,2) if _S.truth((_n_q_b10 > 0.85)) else _S.index_value(_n_C_b3,1))])
			if _S.truth((_n_q_b10 < 0.8)):
				_S.invoke(_n_p_b0,"px",[_n_x_b9, 0, (_S.index_value(_n_C_b3,1) if _S.truth((_n_q_b10 < 0.5)) else _S.index_value(_n_C_b3,0))])
			if _S.truth((_n_q_b10 < 0.45)):
				_S.invoke(_n_p_b0,"px",[_n_x_b9, 1, _S.index_value(_n_C_b3,0)])
			_n_x_b9 += 1.0
	_S.invoke(_n_p_b0,"px",[(_n_px_b6 - 2), (-1), _S.index_value(_n_C_b3,4)])
	_S.invoke(_n_p_b0,"px",[(_n_px_b6 - 1), (-1), _S.index_value(_n_C_b3,3)])
	_S.invoke(_n_p_b0,"px",[(_n_px_b6 + 3), (-1), _S.index_value(_n_C_b3,3)])
	_S.invoke(_n_p_b0,"glow",[_n_px_b6, (-1), 8, _S.index_value(_n_C_b3,3), (0.06 + (0.04 * _n_beat_b8))])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_wounds = _S.read(_parent,"wounds")
	var _n_shape = _S.read(_parent,"shape")
	var _n_BEAT = _S.read(_parent,"BEAT")
	var _n_D = _S.read(_parent,"D")
	var _n_G = _S.read(_parent,"G")
	var _n_drop = _S.read(_parent,"drop")
	var _n_splat = _S.read(_parent,"splat")
	var _n_travel = _S.read(_parent,"travel")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),6)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_W_b5 = _S.call_value(_n_wounds,[_n_a_b4])
	var _n_S_b6 = _S.call_value(_n_shape,[_n_a_b4])
	var _n_ph_b7 = fmod((fmod(_n_t_b1,_n_BEAT) + _n_BEAT),_n_BEAT)
	var _n_hurt_b8 = maxf(0,(1 - (float(_n_ph_b7)/0.12)))
	if _S.truth((_n_hurt_b8 > 0)):
		for _iter_0 in _S.array(_S.named_value(_n_S_b6,"body")):
			var _tuple_1 = _iter_0
			var _n_mx_b10 = _S.prop(_tuple_1,0)
			var _n_my_b11 = _S.prop(_tuple_1,1)
			_S.invoke(_n_p_b0,"blend",[(_S.named_value(_n_a_b4,"x") + _n_mx_b10), (_S.named_value(_n_a_b4,"y") + _n_my_b11), _S.index_value(_n_C_b3,4), (0.26 * _n_hurt_b8)])
	for _iter_2 in _S.array(_n_W_b5):
		var _n_w_b12 = _iter_2
		_S.invoke(_n_p_b0,"px",[_S.named_value(_n_w_b12,"x"), (_S.named_value(_n_w_b12,"y0") - 1), _S.index_value(_n_C_b3,1)])
		_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_w_b12,"x") - _S.named_value(_n_w_b12,"side")), (_S.named_value(_n_w_b12,"y0") - 1), _S.index_value(_n_C_b3,0)])
		_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_w_b12,"x") - _S.named_value(_n_w_b12,"side")), _S.named_value(_n_w_b12,"y0"), _S.index_value(_n_C_b3,2)])
		if true:
			var _n_y_b14 = _S.named_value(_n_w_b12,"y0")
			while _S.truth((_n_y_b14 < _S.named_value(_n_w_b12,"yb"))):
				_S.invoke(_n_p_b0,"px",[_S.named_value(_n_w_b12,"x"), _n_y_b14, (_S.index_value(_n_C_b3,4) if _S.truth(_S.binary("===",_n_y_b14,_S.named_value(_n_w_b12,"y0"))) else (_S.index_value(_n_C_b3,3) if _S.truth((_n_y_b14 >= (_S.named_value(_n_w_b12,"yb") - 1))) else _S.index_value(_n_C_b3,2)))])
				_n_y_b14 += 1.0
		var _n_period_b13 = (float(_n_D)/_S.named_value(_n_w_b12,"drops"))
		if true:
			var _n_k_b15 = 0
			while _S.truth((_n_k_b15 < _S.named_value(_n_w_b12,"drops"))):
				var _n_born_b16 = ((_S.named_value(_n_w_b12,"phase") * _n_period_b13) + (_n_k_b15 * _n_period_b13))
				var _n_age_b17 = fmod((fmod((_n_t_b1 - _n_born_b16),_n_D) + _n_D),_n_D)
				var _n_swell_b18 = (_n_period_b13 * 0.62)
				var _n_big_b19 = _S.binary("===",fmod((_n_k_b15 + _S.named_value(_n_w_b12,"mx")),2),0)
				var _n_fallH_b20 = maxf(1,((-1) - _S.named_value(_n_w_b12,"yb")))
				var _n_fall_b21 = sqrt((float((2 * _n_fallH_b20))/_n_G))
				var _n_ground_b22 = 0
				if _S.truth((_n_age_b17 < _n_swell_b18)):
					var _n_u_b23 = (float(_n_age_b17)/_n_swell_b18)
					var _n_len_b24 = (1 if _S.truth((_n_u_b23 < 0.35)) else (2 if _S.truth((_n_u_b23 < 0.75)) else 3))
					if true:
						var _n_j_b25 = 0
						while _S.truth((_n_j_b25 < _n_len_b24)):
							_S.invoke(_n_p_b0,"px",[_S.named_value(_n_w_b12,"x"), (_S.named_value(_n_w_b12,"yb") + _n_j_b25), (_S.index_value(_n_C_b3,2) if _S.truth(_S.binary("===",_n_j_b25,(_n_len_b24 - 1))) else _S.index_value(_n_C_b3,3))])
							_n_j_b25 += 1.0
					if _S.truth(_S.binary("===",_n_len_b24,3)):
						_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_w_b12,"x") - 1), (_S.named_value(_n_w_b12,"yb") + 2), _S.index_value(_n_C_b3,1)])
					_S.invoke(_n_p_b0,"px",[_S.named_value(_n_w_b12,"x"), ((_S.named_value(_n_w_b12,"yb") + _n_len_b24) - 2), (_S.index_value(_n_C_b3,5) if _S.truth((_n_u_b23 > 0.5)) else _S.index_value(_n_C_b3,4))])
				else:
					if _S.truth((_n_age_b17 < (_n_swell_b18 + _n_fall_b21))):
						var _n_f_b26 = (_n_age_b17 - _n_swell_b18)
						var _n_y_b27 = ((_S.named_value(_n_w_b12,"yb") + 2) + (((0.5 * _n_G) * _n_f_b26) * _n_f_b26))
						_S.call_value(_n_drop,[_n_p_b0, _n_C_b3, _S.named_value(_n_w_b12,"x"), _n_y_b27, (_n_G * _n_f_b26), (2 if _S.truth(_n_big_b19) else 1)])
					else:
						_S.call_value(_n_splat,[_n_p_b0, _n_C_b3, _S.named_value(_n_w_b12,"x"), _n_ground_b22, ((_n_age_b17 - _n_swell_b18) - _n_fall_b21), _n_big_b19, ((_S.named_value(_n_w_b12,"mx") * 31) + _n_k_b15)])
				_n_k_b15 += 1.0
	var _n_w_b9 = _S.index_value(_n_W_b5,0)
	if _S.truth((_n_ph_b7 < 0.5)):
		if true:
			var _n_j_b28 = 0
			while _S.truth((_n_j_b28 < 7)):
				var _n_vx_b29 = (_S.named_value(_n_w_b9,"side") * (18 + (42 * _S.MathFX.rand([_n_j_b28,7]))))
				var _n_vy_b30 = (-(15 + (50 * _S.MathFX.rand([_n_j_b28,8]))))
				var _n_tt_b31 = (_n_ph_b7 - (_n_j_b28 * 0.012))
				if _S.truth((_n_tt_b31 <= 0)):
					_n_j_b28 += 1.0
					continue
				var _n_x_b32 = (_S.named_value(_n_w_b9,"x") + _S.call_value(_n_travel,[_n_vx_b29, 0, 1.2, _n_tt_b31]))
				var _n_y_b33 = (_S.named_value(_n_w_b9,"y0") + _S.call_value(_n_travel,[_n_vy_b30, (_n_G * 0.8), 0.6, _n_tt_b31]))
				var _n_x2_b34 = (_S.named_value(_n_w_b9,"x") + _S.call_value(_n_travel,[_n_vx_b29, 0, 1.2, (_n_tt_b31 - 0.02)]))
				var _n_y2_b35 = (_S.named_value(_n_w_b9,"y0") + _S.call_value(_n_travel,[_n_vy_b30, (_n_G * 0.8), 0.6, (_n_tt_b31 - 0.02)]))
				if _S.truth((_n_y_b33 >= (-1))):
					_n_j_b28 += 1.0
					continue
				_S.invoke(_n_p_b0,"line",[_n_x2_b34, _n_y2_b35, _n_x_b32, _n_y_b33, (_S.index_value(_n_C_b3,3) if _S.truth(fmod(_n_j_b28,3)) else _S.index_value(_n_C_b3,2))])
				_S.invoke(_n_p_b0,"px",[_n_x_b32, _n_y_b33, (_S.index_value(_n_C_b3,5) if _S.truth(fmod(_n_j_b28,2)) else _S.index_value(_n_C_b3,4))])
				_n_j_b28 += 1.0
	_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_w_b9,"x"), _S.named_value(_n_w_b9,"y0"), 6, _S.index_value(_n_C_b3,4), (0.25 * _n_hurt_b8)])
	return null
