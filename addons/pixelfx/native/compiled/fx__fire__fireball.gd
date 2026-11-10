@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/fireball.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "pnoise", _S.import_value("fx/fire/_lib.js", "pnoise"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "flameBlade", _S.import_value("fx/fire/_lib.js", "flameBlade"))
	_S.define(_e, "firePuff", _S.import_value("fx/fire/_lib.js", "firePuff"))
	_S.define(_e, "smokePuff", _S.import_value("fx/fire/_lib.js", "smokePuff"))
	_S.define(_e, "spark", _S.import_value("fx/fire/_lib.js", "spark"))
	_S.define(_e, "ember", _S.import_value("fx/fire/_lib.js", "ember"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "head", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Fireball"}, {"desc": "A fireball flying right: a churning white-hot head with a corona of flame, a long torn tail of flame puffs cooling into smoke, embers shed behind."}, {"tags": ["fire", "fireball", "projectile", "magic", "directional", "loop"]}, {"size": [136, 56]}, {"origin": [112, 28]}, {"duration": 1.2}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"radius": 5}, {"speed": 120}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "SMOKE1", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "BODY", [[30, 4.2, 0], [23, 4.4, _S.unary("-", 1.6)], [22, 4.4, 1.6], [15, 4.6, 0]])
	_S.define(_e, "CORONA", [[_S.unary("-", 1.3), 6, 1.1], [_S.unary("-", 1.8), 8, 1.2], [_S.unary("-", 2.3), 7, 1.1], [1.3, 6, 1.1], [1.8, 8, 1.2], [2.3, 7, 1.1]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_H_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_R0_b3 = _S.arg(_args,3)
	var _n_S_b4 = _S.arg(_args,4)
	var _n_hx_b5 = _S.arg(_args,5)
	var _n_hy_b6 = _S.arg(_args,6)
	var _n_ph_b7 = (float(_n_t_b2)/_n_D)
	_S.invoke(_n_p_b0,"shade",[(_n_hx_b5 - (_n_R0_b3 * 2.4)), (_n_hy_b6 - (_n_R0_b3 * 1.7)), (_n_hx_b5 + (_n_R0_b3 * 1.5)), (_n_hy_b6 + (_n_R0_b3 * 1.7)), _S.function_value(_S.capture(_parent,{"hx":_n_hx_b5,"hy":_n_hy_b6,"ph":_n_ph_b7,"S":_n_S_b4,"R0":_n_R0_b3,"H":_n_H_b1,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_hx = _S.read(_parent,"hx")
	var _n_hy = _S.read(_parent,"hy")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ph = _S.read(_parent,"ph")
	var _n_S = _S.read(_parent,"S")
	var _n_pnoise = _S.read(_parent,"pnoise")
	var _n_R0 = _S.read(_parent,"R0")
	var _n_H = _S.read(_parent,"H")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	_n_x_b0 -= _n_hx
	_n_y_b1 -= _n_hy
	var _n_d_b3 = _S.Bridge.hypot([_n_x_b0, _n_y_b1])
	var _n_th_b4 = atan2(_n_y_b1,_n_x_b0)
	var _n_back_b5 = maxf(0,(-cos(_n_th_b4)))
	var _n_a_b6 = (float(_n_th_b4)/_n_TAU)
	var _n_bump_b7 = ((0.55 * _S.call_value(_n_pnoise,[((_n_a_b6 * 9) + (_n_ph * 9)), 9, _n_S])) + (0.35 * _S.call_value(_n_pnoise,[((_n_a_b6 * 5) - (_n_ph * 10)), 5, (_n_S + 1)])))
	var _n_rim_b8 = ((_n_R0 * (1 + ((0.55 * _n_back_b5) * _n_back_b5))) + _n_bump_b7)
	if _S.truth((_n_d_b3 > _n_rim_b8)):
		return null
	var _n_swirl_b9 = _S.call_value(_n_pnoise,[(((_n_a_b6 * 5) - (_n_ph * 10)) + (_n_d_b3 * 0.45)), 5, (_n_S + 2)])
	var _n_h_b10 = (((1 - (float(_n_d_b3)/_n_rim_b8)) + (0.26 * _n_swirl_b9)) + (0.1 * (1 - _n_back_b5)))
	if _S.truth(((_n_back_b5 < 0.3) if _S.truth(((_n_rim_b8 - _n_d_b3) < 1)) else ((_n_rim_b8 - _n_d_b3) < 1))):
		return (_S.index_value(_n_H,3) if _S.truth((_n_h_b10 > 0.3)) else _S.index_value(_n_H,5))
	return (_S.index_value(_n_H,0) if _S.truth((_n_h_b10 > 0.74)) else (_S.index_value(_n_H,1) if _S.truth((_n_h_b10 > 0.58)) else (_S.index_value(_n_H,2) if _S.truth((_n_h_b10 > 0.42)) else (_S.index_value(_n_H,4) if _S.truth((_n_h_b10 > 0.27)) else (_S.index_value(_n_H,5) if _S.truth((_n_h_b10 > 0.13)) else _S.index_value(_n_H,6))))))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_hotFirst = _S.read(_parent,"hotFirst")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_SMOKE1 = _S.read(_parent,"SMOKE1")
	var _n_D = _S.read(_parent,"D")
	var _n_looped = _S.read(_parent,"looped")
	var _n_smokePuff = _S.read(_parent,"smokePuff")
	var _n_firePuff = _S.read(_parent,"firePuff")
	var _n_BODY = _S.read(_parent,"BODY")
	var _n_CORONA = _S.read(_parent,"CORONA")
	var _n_head = _S.read(_parent,"head")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9)
	var _n_H_b4 = _S.call_value(_n_hotFirst,[_n_F_b3])
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_R0_b6 = _S.named_value(_n_o_b2,"radius")
	var _n_V_b7 = _S.named_value(_n_o_b2,"speed")
	var _n_N_b8 = _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f3")
	var _n_GLOW_b9 = _S.ColorFX.mix(_S.ColorFX.mix(_S.index_value(_n_H_b4,3),_S.index_value(_n_H_b4,4),0.5),_n_WHITE,0.25)
	var _n_SMOKE_b10 = _S.ColorFX.mix(_n_SMOKE1,_S.index_value(_n_H_b4,6),0.3)
	var _n_SPARKS_b11 = [_S.index_value(_n_H_b4,1), _S.index_value(_n_H_b4,2), _S.index_value(_n_H_b4,4), _S.index_value(_n_H_b4,5)]
	var _n_EMB_b12 = [_S.index_value(_n_H_b4,1), _S.index_value(_n_H_b4,2), _S.index_value(_n_H_b4,4), _S.index_value(_n_H_b4,6)]
	var _n_hx_b13 = (_S.call_value(_n_N_b8,[3, (_n_S_b5 + 50)]) * 0.5)
	var _n_hy_b14 = (_S.call_value(_n_N_b8,[2.5, (_n_S_b5 + 51)]) * 0.7)
	var _n_fire_b15 = []
	var _n_smoke_b16 = []
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 130, (_n_S_b5 + 100), _S.function_value(_S.capture(_parent,{"R0":_n_R0_b6,"V":_n_V_b7,"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"V":_n_V_b7,"fire":_n_fire_b15,"smoke":_n_smoke_b16,"this":_this}),"_f5")])
	for _iter_0 in _S.array(_n_smoke_b16):
		var _tuple_1 = _iter_0
		var _n_sa_b18 = _S.prop(_tuple_1,0)
		var _n_x_b19 = _S.prop(_tuple_1,1)
		var _n_y_b20 = _S.prop(_tuple_1,2)
		var _n_q_b21 = _S.prop(_tuple_1,3)
		_S.call_value(_n_smokePuff,[_n_p_b0, _n_x_b19, _n_y_b20, (1 - (float(_n_sa_b18)/_S.named_value(_n_q_b21,"sl"))), (_S.named_value(_n_q_b21,"s") * 0.9), _n_SMOKE_b10])
	_S.invoke(_n_fire_b15,"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f6")])
	for _iter_2 in _S.array(_n_fire_b15):
		var _tuple_3 = _iter_2
		var _n_age_b22 = _S.prop(_tuple_3,0)
		var _n_x_b23 = _S.prop(_tuple_3,1)
		var _n_y_b24 = _S.prop(_tuple_3,2)
		var _n_q_b25 = _S.prop(_tuple_3,3)
		var _n_u_b26 = (float(_n_age_b22)/_S.named_value(_n_q_b25,"fl"))
		_S.call_value(_n_firePuff,[_n_p_b0, _n_x_b23, _n_y_b24, (1 - _n_u_b26), (_S.named_value(_n_q_b25,"s") * (1 + (1.3 * _n_u_b26))), _S.named_value(_n_q_b25,"f"), _n_H_b4, 0.07, (-0.86), (-0.5)])
	_S.invoke(_n_BODY,"forEach",[_S.function_value(_S.capture(_parent,{"S":_n_S_b5,"N":_n_N_b8,"p":_n_p_b0,"hx":_n_hx_b13,"hy":_n_hy_b14,"R0":_n_R0_b6,"H":_n_H_b4,"this":_this}),"_f7")])
	_S.invoke(_n_CORONA,"forEach",[_S.function_value(_S.capture(_parent,{"S":_n_S_b5,"N":_n_N_b8,"R0":_n_R0_b6,"p":_n_p_b0,"hx":_n_hx_b13,"hy":_n_hy_b14,"H":_n_H_b4,"this":_this}),"_f8")])
	_S.call_value(_n_head,[_n_p_b0, _n_H_b4, _n_t_b1, _n_R0_b6, _n_S_b5, _n_hx_b13, _n_hy_b14])
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 26, (_n_S_b5 + 200), _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), _S.function_value(_S.capture(_parent,{"R0":_n_R0_b6,"hx":_n_hx_b13,"V":_n_V_b7,"hy":_n_hy_b14,"p":_n_p_b0,"H":_n_H_b4,"this":_this}),"_f10")])
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 30, (_n_S_b5 + 300), _S.function_value(_S.capture(_parent,{"V":_n_V_b7,"this":_this}),"_f11"), _S.function_value(_S.capture(_parent,{"V":_n_V_b7,"p":_n_p_b0,"EMB":_n_EMB_b12,"SPARKS":_n_SPARKS_b11,"this":_this}),"_f12")])
	var _n_fl_b17 = (0.85 + (0.15 * _S.call_value(_n_N_b8,[9, (_n_S_b5 + 7)])))
	_S.invoke(_n_p_b0,"glowLine",[(_n_hx_b13 - 6), _n_hy_b14, (-50), (-2), 12, _n_GLOW_b9, (0.2 * _n_fl_b17)])
	_S.invoke(_n_p_b0,"glow",[(_n_hx_b13 - 2), _n_hy_b14, 42, _n_GLOW_b9, (0.42 * _n_fl_b17)])
	_S.invoke(_n_p_b0,"glow",[_n_hx_b13, _n_hy_b14, 13, _S.index_value(_n_H_b4,1), (0.3 * _n_fl_b17)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_NL = _S.read(_parent,"NL")
	var _n_t = _S.read(_parent,"t")
	var _n_rate_b0 = _S.arg(_args,0)
	var _n_seed_b1 = _S.coalesce(_S.arg(_args,1),func():return 0)
	var _n_off_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	return _S.call_value(_n_NL,[_n_t, _n_rate_b0, _n_seed_b1, _n_off_b2])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_R0 = _S.read(_parent,"R0")
	var _n_V = _S.read(_parent,"V")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_fl_b1 = _S.invoke(_n_r_b0,"range",[0.22, 0.55])
	var _n_sm_b2 = _S.invoke(_n_r_b0,"chance",[0.55])
	var _n_x_b3 = (-_S.invoke(_n_r_b0,"range",[2, 24]))
	return {"x":_n_x_b3,"y":(_S.invoke(_n_r_b0,"range",[(-1), 1]) * (_n_R0 - (0.1 * (-_n_x_b3)))),"v":(_n_V * _S.invoke(_n_r_b0,"range",[0.3, 0.6])),"vy":_S.invoke(_n_r_b0,"range",[(-16), 16]),"fl":_n_fl_b1,"sm":_n_sm_b2,"sl":_S.invoke(_n_r_b0,"range",[0.25, 0.45]),"s":_S.invoke(_n_r_b0,"range",[1.3, 2.9]),"f":((_S.invoke(_n_r_b0,"next",[]) * 0.5) + (0.5 * (float((-_n_x_b3))/24))),"life":(_n_fl_b1 + (0.45 if _S.truth(_n_sm_b2) else 0))}
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_drift = _S.read(_parent,"drift")
	var _n_V = _S.read(_parent,"V")
	var _n_fire = _S.read(_parent,"fire")
	var _n_smoke = _S.read(_parent,"smoke")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_ta_b2 = minf(_n_age_b1,_S.named_value(_n_q_b0,"fl"))
	var _tuple_0 = _S.call_value(_n_drift,[0, _S.named_value(_n_q_b0,"y"), _S.named_value(_n_q_b0,"v"), _S.named_value(_n_q_b0,"vy"), _n_ta_b2, 0, (-70), 4.5, 3])
	var _n_wx_b3 = _S.prop(_tuple_0,0)
	var _n_y_b4 = _S.prop(_tuple_0,1)
	var _n_wvx_b5 = _S.prop(_tuple_0,2)
	var _n_vy_b6 = _S.prop(_tuple_0,3)
	var _n_x_b7 = ((_S.named_value(_n_q_b0,"x") + _n_wx_b3) - (_n_V * _n_ta_b2))
	if _S.truth((_n_age_b1 < _S.named_value(_n_q_b0,"fl"))):
		return _S.invoke(_n_fire,"push",[[_n_age_b1, _n_x_b7, _n_y_b4, _n_q_b0]])
	if _S.truth((not _S.truth(_S.named_value(_n_q_b0,"sm")) if _S.truth(not _S.truth(_S.named_value(_n_q_b0,"sm"))) else ((_n_age_b1 - _S.named_value(_n_q_b0,"fl")) > _S.named_value(_n_q_b0,"sl")))):
		return null
	var _n_sa_b8 = (_n_age_b1 - _S.named_value(_n_q_b0,"fl"))
	var _tuple_1 = _S.call_value(_n_drift,[_n_x_b7, _n_y_b4, (_n_wvx_b5 - _n_V), ((_n_vy_b6 * 0.6) - 6), _n_sa_b8, (_n_V * 2), (-30), 2, 1.2])
	var _n_sx_b9 = _S.prop(_tuple_1,0)
	var _n_sy_b10 = _S.prop(_tuple_1,1)
	_S.invoke(_n_smoke,"push",[[_n_sa_b8, _n_sx_b9, _n_sy_b10, _n_q_b0]])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_b_b1,0) - _S.index_value(_n_a_b0,0))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_N = _S.read(_parent,"N")
	var _n_p = _S.read(_parent,"p")
	var _n_hx = _S.read(_parent,"hx")
	var _n_hy = _S.read(_parent,"hy")
	var _n_R0 = _S.read(_parent,"R0")
	var _n_H = _S.read(_parent,"H")
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_flameBlade = _S.read(_parent,"flameBlade")
	var _tuple_0 = _S.arg(_args,0)
	var _n_len_b0 = _S.prop(_tuple_0,0)
	var _n_w_b1 = _S.prop(_tuple_0,1)
	var _n_dy_b2 = _S.prop(_tuple_0,2)
	var _n_i_b3 = _S.arg(_args,1)
	var _n_n_b4 = (((_n_S * 5) + _n_i_b3) * 17)
	var _n_L_b5 = ((_n_len_b0 * (0.82 + (0.25 * _S.call_value(_n_N,[4, _n_n_b4])))) * (1 + (0.3 * maxf(0,_S.call_value(_n_N,[2.4, (_n_n_b4 + 3)])))))
	_S.call_value(_n_flameBlade,[_n_p, (_n_hx + 1), (_n_hy + (_n_dy_b2 * 0.5)), (-1), (_n_dy_b2 * 0.02), _n_L_b5, (float((_n_w_b1 * _n_R0))/5), ((_S.call_value(_n_N,[3, (_n_n_b4 + 5)]) * 3) + _n_dy_b2), _n_N, _n_n_b4, _n_H, _n_LAYERS, 0.5, (1.1 + (_n_L_b5 * 0.05))])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_N = _S.read(_parent,"N")
	var _n_R0 = _S.read(_parent,"R0")
	var _n_p = _S.read(_parent,"p")
	var _n_hx = _S.read(_parent,"hx")
	var _n_hy = _S.read(_parent,"hy")
	var _n_H = _S.read(_parent,"H")
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_flameBlade = _S.read(_parent,"flameBlade")
	var _tuple_0 = _S.arg(_args,0)
	var _n_a_b0 = _S.prop(_tuple_0,0)
	var _n_len_b1 = _S.prop(_tuple_0,1)
	var _n_w_b2 = _S.prop(_tuple_0,2)
	var _n_i_b3 = _S.arg(_args,1)
	var _n_n_b4 = ((((_n_S * 5) + _n_i_b3) + 20) * 17)
	var _n_L_b5 = (_n_len_b1 * (0.7 + (0.4 * (0.5 + (0.5 * _S.call_value(_n_N,[6, _n_n_b4]))))))
	var _n_ox_b6 = ((cos(_n_a_b0) * _n_R0) * 0.85)
	var _n_oy_b7 = ((sin(_n_a_b0) * _n_R0) * 0.85)
	var _n_dx_b8 = ((cos(_n_a_b0) * 0.55) - 1)
	var _n_dy_b9 = (sin(_n_a_b0) * 0.55)
	var _n_l_b10 = _S.Bridge.hypot([_n_dx_b8, _n_dy_b9])
	_S.call_value(_n_flameBlade,[_n_p, (_n_hx + _n_ox_b6), (_n_hy + _n_oy_b7), (float(_n_dx_b8)/_n_l_b10), (float(_n_dy_b9)/_n_l_b10), _n_L_b5, _n_w_b2, ((-signf(_n_a_b0)) * 1.5), _n_N, _n_n_b4, _n_H, _n_LAYERS])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return {"a":_S.invoke(_n_r_b0,"range",[(-2.4), 2.4]),"v":_S.invoke(_n_r_b0,"range",[30, 70]),"life":_S.invoke(_n_r_b0,"range",[0.08, 0.18])}
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_R0 = _S.read(_parent,"R0")
	var _n_hx = _S.read(_parent,"hx")
	var _n_V = _S.read(_parent,"V")
	var _n_hy = _S.read(_parent,"hy")
	var _n_p = _S.read(_parent,"p")
	var _n_H = _S.read(_parent,"H")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_ca_b2 = cos(_S.named_value(_n_q_b0,"a"))
	var _n_sa_b3 = sin(_S.named_value(_n_q_b0,"a"))
	var _n_d_b4 = ((_n_R0 * 0.9) + (_S.named_value(_n_q_b0,"v") * _n_age_b1))
	var _n_x_b5 = ((_n_hx + (_n_ca_b2 * _n_d_b4)) - ((_n_V * 0.4) * _n_age_b1))
	var _n_y_b6 = (_n_hy + (_n_sa_b3 * _n_d_b4))
	var _n_k_b7 = (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life")))
	var _n_L_b8 = (1 + (2 * _n_k_b7))
	_S.invoke(_n_p,"line",[((_n_x_b5 - (_n_ca_b2 * _n_L_b8)) + (_n_V * 0.02)), (_n_y_b6 - (_n_sa_b3 * _n_L_b8)), _n_x_b5, _n_y_b6, (_S.index_value(_n_H,1) if _S.truth((_n_k_b7 > 0.5)) else _S.index_value(_n_H,3))])
	_S.invoke(_n_p,"glow",[_n_x_b5, _n_y_b6, 3, _S.index_value(_n_H,2), (0.4 * _n_k_b7)])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_V = _S.read(_parent,"V")
	var _n_r_b0 = _S.arg(_args,0)
	return {"x":(-_S.invoke(_n_r_b0,"range",[2, 16])),"y":_S.invoke(_n_r_b0,"range",[(-3), 3]),"v":(_n_V * _S.invoke(_n_r_b0,"range",[0.3, 0.8])),"vy":_S.invoke(_n_r_b0,"range",[(-20), 20]),"life":_S.invoke(_n_r_b0,"range",[0.25, 0.55]),"big":_S.invoke(_n_r_b0,"chance",[0.25]),"ph":_S.invoke(_n_r_b0,"range",[0, 6.3])}
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_drift = _S.read(_parent,"drift")
	var _n_V = _S.read(_parent,"V")
	var _n_p = _S.read(_parent,"p")
	var _n_EMB = _S.read(_parent,"EMB")
	var _n_ember = _S.read(_parent,"ember")
	var _n_SPARKS = _S.read(_parent,"SPARKS")
	var _n_spark = _S.read(_parent,"spark")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_drift,[0, _S.named_value(_n_q_b0,"y"), _S.named_value(_n_q_b0,"v"), _S.named_value(_n_q_b0,"vy"), _n_age_b1, 0, 50, 3, 2])
	var _n_wx_b2 = _S.prop(_tuple_0,0)
	var _n_y_b3 = _S.prop(_tuple_0,1)
	var _n_wvx_b4 = _S.prop(_tuple_0,2)
	var _n_vy_b5 = _S.prop(_tuple_0,3)
	var _n_x_b6 = ((_S.named_value(_n_q_b0,"x") + _n_wx_b2) - (_n_V * _n_age_b1))
	var _n_k_b7 = (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life")))
	if _S.truth(_S.named_value(_n_q_b0,"big")):
		_S.call_value(_n_ember,[_n_p, _n_x_b6, _n_y_b3, _n_k_b7, 2, _n_EMB, ((_n_age_b1 * 40) + _S.named_value(_n_q_b0,"ph"))])
	else:
		_S.call_value(_n_spark,[_n_p, _n_x_b6, _n_y_b3, (_n_wvx_b4 - _n_V), _n_vy_b5, _n_k_b7, _n_SPARKS])
	return null
