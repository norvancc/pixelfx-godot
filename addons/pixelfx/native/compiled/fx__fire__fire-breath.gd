@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/fire-breath.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "flameBlade", _S.import_value("fx/fire/_lib.js", "flameBlade"))
	_S.define(_e, "flameTongue", _S.import_value("fx/fire/_lib.js", "flameTongue"))
	_S.define(_e, "firePuff", _S.import_value("fx/fire/_lib.js", "firePuff"))
	_S.define(_e, "smokePuff", _S.import_value("fx/fire/_lib.js", "smokePuff"))
	_S.define(_e, "spark", _S.import_value("fx/fire/_lib.js", "spark"))
	_S.define(_e, "ember", _S.import_value("fx/fire/_lib.js", "ember"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "BACK_LAYERS", _S.import_value("fx/fire/_lib.js", "BACK_LAYERS"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Fire breath"}, {"desc": "A roaring cone of fire streaming right from the mouth: white-hot at the lips, billowing out and cooling to red and smoke at its edges, sparks thrown out ahead."}, {"tags": ["fire", "breath", "dragon", "stream", "cone", "directional", "loop"]}, {"size": [160, 116]}, {"origin": [12, 72]}, {"duration": 1.5}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"spread": 0.24}, {"speed": 320}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "SMOKE1", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "COOL_LAYERS", [[1, 1, 7], [0.72, 0.82, 6], [0.44, 0.58, 5]])
	_S.define(_e, "JET", [[42, 4.2, 0], [32, 3.8, _S.unary("-", 0.08)], [30, 3.8, 0.08], [20, 4.6, 0]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_hotFirst = _S.read(_parent,"hotFirst")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_SMOKE1 = _S.read(_parent,"SMOKE1")
	var _n_D = _S.read(_parent,"D")
	var _n_looped = _S.read(_parent,"looped")
	var _n_smokePuff = _S.read(_parent,"smokePuff")
	var _n_firePuff = _S.read(_parent,"firePuff")
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_BACK_LAYERS = _S.read(_parent,"BACK_LAYERS")
	var _n_COOL_LAYERS = _S.read(_parent,"COOL_LAYERS")
	var _n_flameTongue = _S.read(_parent,"flameTongue")
	var _n_flameBlade = _S.read(_parent,"flameBlade")
	var _n_JET = _S.read(_parent,"JET")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9)
	var _n_H_b4 = _S.call_value(_n_hotFirst,[_n_F_b3])
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_A_b6 = _S.named_value(_n_o_b2,"spread")
	var _n_V_b7 = _S.named_value(_n_o_b2,"speed")
	var _n_N_b8 = _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f1")
	var _n_GLOW_b9 = _S.ColorFX.mix(_S.ColorFX.mix(_S.index_value(_n_H_b4,3),_S.index_value(_n_H_b4,4),0.5),_n_WHITE,0.25)
	var _n_SMOKE_b10 = _S.ColorFX.mix(_n_SMOKE1,_S.index_value(_n_H_b4,6),0.3)
	var _n_SPARKS_b11 = [_S.index_value(_n_H_b4,1), _S.index_value(_n_H_b4,2), _S.index_value(_n_H_b4,4), _S.index_value(_n_H_b4,5)]
	var _n_EMB_b12 = [_S.index_value(_n_H_b4,1), _S.index_value(_n_H_b4,2), _S.index_value(_n_H_b4,4), _S.index_value(_n_H_b4,6)]
	var _n_roar_b13 = _S.function_value(_S.capture(_parent,{"S":_n_S_b5,"this":_this}),"_f2")
	var _n_sway_b14 = _S.function_value(_S.capture(_parent,{"S":_n_S_b5,"this":_this}),"_f3")
	var _n_fire_b15 = []
	var _n_smoke_b16 = []
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 260, (_n_S_b5 + 100), _S.function_value(_S.capture(_parent,{"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"A":_n_A_b6,"sway":_n_sway_b14,"V":_n_V_b7,"roar":_n_roar_b13,"fire":_n_fire_b15,"smoke":_n_smoke_b16,"this":_this}),"_f5")])
	for _iter_0 in _S.array(_n_smoke_b16):
		var _tuple_1 = _iter_0
		var _n_sa_b18 = _S.prop(_tuple_1,0)
		var _n_x_b19 = _S.prop(_tuple_1,1)
		var _n_y_b20 = _S.prop(_tuple_1,2)
		var _n_q_b21 = _S.prop(_tuple_1,3)
		_S.call_value(_n_smokePuff,[_n_p_b0, _n_x_b19, _n_y_b20, (1 - (float(_n_sa_b18)/_S.named_value(_n_q_b21,"sl"))), (_S.named_value(_n_q_b21,"s") * 1.1), _n_SMOKE_b10, true, 0.7])
	_S.invoke(_n_fire_b15,"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f6")])
	for _iter_2 in _S.array(_n_fire_b15):
		var _tuple_3 = _iter_2
		var _n_age_b22 = _S.prop(_tuple_3,0)
		var _n_x_b23 = _S.prop(_tuple_3,1)
		var _n_y_b24 = _S.prop(_tuple_3,2)
		var _n_q_b25 = _S.prop(_tuple_3,3)
		var _n_u_b26 = (float(_n_age_b22)/_S.named_value(_n_q_b25,"fl"))
		var _n_edge_b27 = absf(_S.named_value(_n_q_b25,"e"))
		var _n_size_b28 = (_S.named_value(_n_q_b25,"s") * (0.75 + (1.6 * _n_u_b26)))
		var _n_heat_b29 = minf(0.999,((pow(_n_u_b26,1.5) * (0.85 + (0.2 * _n_edge_b27))) + ((0.3 * _n_edge_b27) * _n_edge_b27)))
		var _n_tear_b30 = clampf((float((_n_u_b26 - 0.32))/0.2),0.0,1.0)
		_S.call_value(_n_firePuff,[_n_p_b0, _n_x_b23, _n_y_b24, (1 - _n_heat_b29), (_n_size_b28 * (1 - (0.55 * _n_tear_b30))), _S.named_value(_n_q_b25,"f"), _n_H_b4, 0.1, (-0.5), (-0.86)])
		if _S.truth((_n_tear_b30 > 0)):
			var _n_n_b31 = floori((_S.named_value(_n_q_b25,"f") * 100000))
			var _n_h_b32 = (((_n_size_b28 * (1.5 + (0.5 * _S.call_value(_n_N_b8,[4, _n_n_b31])))) * (1.2 - (_n_heat_b29 * 0.6))) * _n_tear_b30)
			_S.call_value(_n_flameTongue,[_n_p_b0, _n_x_b23, (_n_y_b24 + (_n_size_b28 * 0.3)), _n_h_b32, ((_n_size_b28 * 0.5) * (1.1 - (_n_heat_b29 * 0.5))), (((-_n_h_b32) * 0.4) + (_S.call_value(_n_N_b8,[2.5, (_n_n_b31 + 1)]) * 2)), _n_N_b8, _n_n_b31, _n_H_b4, (_n_LAYERS if _S.truth((_n_heat_b29 < 0.45)) else (_n_BACK_LAYERS if _S.truth((_n_heat_b29 < 0.72)) else _n_COOL_LAYERS))])
	if true:
		var _n_i_b33 = 0
		while _S.truth((_n_i_b33 < 6)):
			var _n_n_b34 = (((_n_S_b5 * 3) + _n_i_b33) * 19)
			var _n_side_b35 = (1 if _S.truth(fmod(_n_i_b33,2)) else (-1))
			var _n_d_b36 = ((18 + (_S.binary(">>",_n_i_b33,1) * 16)) + (_S.call_value(_n_N_b8,[2, _n_n_b34]) * 4))
			var _n_L_b37 = ((9 + (5 * (0.5 + (0.5 * _S.call_value(_n_N_b8,[5, (_n_n_b34 + 1)]))))) * (1 - (float(_n_d_b36)/120)))
			var _n_ex_b38 = _n_d_b36
			var _n_ey_b39 = ((((_n_side_b35 * _n_d_b36) * _n_A_b6) * 0.85) - (_n_d_b36 * 0.06))
			_S.call_value(_n_flameBlade,[_n_p_b0, _n_ex_b38, _n_ey_b39, 0.75, ((_n_side_b35 * 0.45) - 0.48), _n_L_b37, (1.6 + (_n_L_b37 * 0.08)), ((-_n_side_b35) * 3), _n_N_b8, _n_n_b34, _n_H_b4, _n_LAYERS])
			_n_i_b33 += 1.0
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 70, (_n_S_b5 + 250), _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), _S.function_value(_S.capture(_parent,{"A":_n_A_b6,"p":_n_p_b0,"H":_n_H_b4,"this":_this}),"_f8")])
	_S.invoke(_n_JET,"forEach",[_S.function_value(_S.capture(_parent,{"S":_n_S_b5,"roar":_n_roar_b13,"t":_n_t_b1,"N":_n_N_b8,"sway":_n_sway_b14,"p":_n_p_b0,"H":_n_H_b4,"this":_this}),"_f10")])
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 40, (_n_S_b5 + 300), _S.function_value(_S.capture(_parent,{"this":_this}),"_f11"), _S.function_value(_S.capture(_parent,{"A":_n_A_b6,"p":_n_p_b0,"SPARKS":_n_SPARKS_b11,"this":_this}),"_f12")])
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 18, (_n_S_b5 + 400), _S.function_value(_S.capture(_parent,{"this":_this}),"_f13"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"EMB":_n_EMB_b12,"this":_this}),"_f14")])
	var _n_k_b17 = _S.call_value(_n_roar_b13,[_n_t_b1])
	_S.invoke(_n_p_b0,"glow",[3, 0, (34 * _n_k_b17), _n_GLOW_b9, (0.75 * _n_k_b17)])
	_S.invoke(_n_p_b0,"glow",[3, 0, 10, _S.index_value(_n_H_b4,0), 0.55])
	if true:
		var _n_d_b40 = 10
		while _S.truth((_n_d_b40 < 126)):
			_S.invoke(_n_p_b0,"glow",[_n_d_b40, ((-_n_d_b40) * 0.1), (10 + (_n_d_b40 * 0.2)), _n_GLOW_b9, ((0.32 * _n_k_b17) * (1 - (float(_n_d_b40)/150)))])
			_n_d_b40 += 8
	_S.invoke(_n_p_b0,"glow",[64, (-12), 96, _n_GLOW_b9, (0.16 * _n_k_b17)])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_NL = _S.read(_parent,"NL")
	var _n_t = _S.read(_parent,"t")
	var _n_rate_b0 = _S.arg(_args,0)
	var _n_seed_b1 = _S.coalesce(_S.arg(_args,1),func():return 0)
	var _n_off_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	return _S.call_value(_n_NL,[_n_t, _n_rate_b0, _n_seed_b1, _n_off_b2])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_NL = _S.read(_parent,"NL")
	var _n_S = _S.read(_parent,"S")
	var _n_tt_b0 = _S.arg(_args,0)
	return (0.85 + (0.15 * _S.call_value(_n_NL,[_n_tt_b0, 3, (_n_S + 1)])))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_NL = _S.read(_parent,"NL")
	var _n_S = _S.read(_parent,"S")
	var _n_tt_b0 = _S.arg(_args,0)
	return (_S.call_value(_n_NL,[_n_tt_b0, 1.3, (_n_S + 2)]) * 0.05)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	var _n_e_b1 = _S.invoke(_n_r_b0,"range",[(-1), 1])
	var _n_fl_b2 = (_S.invoke(_n_r_b0,"range",[0.42, 0.8]) * (1 - (0.3 * absf(_n_e_b1))))
	var _n_sm_b3 = _S.invoke(_n_r_b0,"chance",[(0.2 + (0.4 * absf(_n_e_b1)))])
	return {"e":_n_e_b1,"sp":_S.invoke(_n_r_b0,"range",[0.75, 1.1]),"fl":_n_fl_b2,"sm":_n_sm_b3,"sl":_S.invoke(_n_r_b0,"range",[0.5, 0.85]),"s":_S.invoke(_n_r_b0,"range",[3, 5.2]),"f":_S.invoke(_n_r_b0,"next",[]),"ox":_S.invoke(_n_r_b0,"range",[4, 10]),"life":(_n_fl_b2 + (0.85 if _S.truth(_n_sm_b3) else 0))}
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_A = _S.read(_parent,"A")
	var _n_sway = _S.read(_parent,"sway")
	var _n_V = _S.read(_parent,"V")
	var _n_roar = _S.read(_parent,"roar")
	var _n_drift = _S.read(_parent,"drift")
	var _n_fire = _S.read(_parent,"fire")
	var _n_smoke = _S.read(_parent,"smoke")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_tb_b2 = (_n_t - _n_age_b1)
	var _n_a_b3 = (((_S.named_value(_n_q_b0,"e") * _n_A) + _S.call_value(_n_sway,[_n_tb_b2])) - 0.04)
	var _n_v_b4 = ((_n_V * _S.named_value(_n_q_b0,"sp")) * _S.call_value(_n_roar,[_n_tb_b2]))
	var _n_ta_b5 = minf(_n_age_b1,_S.named_value(_n_q_b0,"fl"))
	var _tuple_0 = _S.call_value(_n_drift,[_S.named_value(_n_q_b0,"ox"), (_S.named_value(_n_q_b0,"e") * 1.5), (cos(_n_a_b3) * _n_v_b4), (sin(_n_a_b3) * _n_v_b4), _n_ta_b5, 0, (-100), 2, 2.4])
	var _n_x_b6 = _S.prop(_tuple_0,0)
	var _n_y_b7 = _S.prop(_tuple_0,1)
	var _n_vx_b8 = _S.prop(_tuple_0,2)
	var _n_vy_b9 = _S.prop(_tuple_0,3)
	if _S.truth((_n_age_b1 < _S.named_value(_n_q_b0,"fl"))):
		return _S.invoke(_n_fire,"push",[[_n_age_b1, _n_x_b6, _n_y_b7, _n_q_b0]])
	if _S.truth((not _S.truth(_S.named_value(_n_q_b0,"sm")) if _S.truth(not _S.truth(_S.named_value(_n_q_b0,"sm"))) else ((_n_age_b1 - _S.named_value(_n_q_b0,"fl")) > _S.named_value(_n_q_b0,"sl")))):
		return null
	var _n_sa_b10 = (_n_age_b1 - _S.named_value(_n_q_b0,"fl"))
	var _tuple_1 = _S.call_value(_n_drift,[_n_x_b6, _n_y_b7, (_n_vx_b8 * 0.5), ((_n_vy_b9 * 0.6) - 8), _n_sa_b10, 0, (-26), 1.8, 1.2])
	var _n_sx_b11 = _S.prop(_tuple_1,0)
	var _n_sy_b12 = _S.prop(_tuple_1,1)
	_S.invoke(_n_smoke,"push",[[_n_sa_b10, _n_sx_b11, _n_sy_b12, _n_q_b0]])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_b_b1,0) - _S.index_value(_n_a_b0,0))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return {"e":_S.invoke(_n_r_b0,"range",[(-0.6), 0.6]),"v":_S.invoke(_n_r_b0,"range",[330, 470]),"life":_S.invoke(_n_r_b0,"range",[0.12, 0.26]),"l":_S.invoke(_n_r_b0,"range",[4, 9])}
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_A = _S.read(_parent,"A")
	var _n_drift = _S.read(_parent,"drift")
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_a_b2 = ((_S.named_value(_n_q_b0,"e") * _n_A) - 0.03)
	var _tuple_0 = _S.call_value(_n_drift,[6, (_S.named_value(_n_q_b0,"e") * 2), (cos(_n_a_b2) * _S.named_value(_n_q_b0,"v")), (sin(_n_a_b2) * _S.named_value(_n_q_b0,"v")), _n_age_b1, 0, (-60), 2, 2])
	var _n_x_b3 = _S.prop(_tuple_0,0)
	var _n_y_b4 = _S.prop(_tuple_0,1)
	var _n_vx_b5 = _S.prop(_tuple_0,2)
	var _n_vy_b6 = _S.prop(_tuple_0,3)
	var _n_sp_b7 = _S.Bridge.hypot([_n_vx_b5, _n_vy_b6])
	var _n_k_b8 = (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life")))
	var _n_L_b9 = (_S.named_value(_n_q_b0,"l") * (float(_n_sp_b7)/400))
	_S.invoke(_n_p,"line",[(_n_x_b3 - ((float(_n_vx_b5)/_n_sp_b7) * _n_L_b9)), (_n_y_b4 - ((float(_n_vy_b6)/_n_sp_b7) * _n_L_b9)), _n_x_b3, _n_y_b4, _S.function_value(_S.capture(_parent,{"k":_n_k_b8,"this":_n_this}),"_f9")])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_k = _S.read(_parent,"k")
	var _n_u_b0 = _S.arg(_args,0)
	return ((_S.index_value(_n_H,0) if _S.truth((_n_k > 0.5)) else _S.index_value(_n_H,1)) if _S.truth((_n_u_b0 > 0.6)) else (_S.index_value(_n_H,2) if _S.truth((_n_k > 0.5)) else _S.index_value(_n_H,3)))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_roar = _S.read(_parent,"roar")
	var _n_t = _S.read(_parent,"t")
	var _n_N = _S.read(_parent,"N")
	var _n_sway = _S.read(_parent,"sway")
	var _n_p = _S.read(_parent,"p")
	var _n_H = _S.read(_parent,"H")
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_flameBlade = _S.read(_parent,"flameBlade")
	var _tuple_0 = _S.arg(_args,0)
	var _n_len_b0 = _S.prop(_tuple_0,0)
	var _n_w_b1 = _S.prop(_tuple_0,1)
	var _n_a_b2 = _S.prop(_tuple_0,2)
	var _n_i_b3 = _S.arg(_args,1)
	var _n_n_b4 = (((_n_S * 5) + _n_i_b3) * 17)
	var _n_L_b5 = ((_n_len_b0 * _S.call_value(_n_roar,[_n_t])) * (0.85 + (0.2 * _S.call_value(_n_N,[5, _n_n_b4]))))
	var _n_aa_b6 = (_n_a_b2 + _S.call_value(_n_sway,[_n_t]))
	_S.call_value(_n_flameBlade,[_n_p, 0, 0, cos(_n_aa_b6), sin(_n_aa_b6), _n_L_b5, _n_w_b1, (_S.call_value(_n_N,[3, (_n_n_b4 + 3)]) * 3), _n_N, _n_n_b4, _n_H, _n_LAYERS, 0.5, 1.5])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return {"d":_S.invoke(_n_r_b0,"range",[4, 60]),"e":_S.invoke(_n_r_b0,"range",[(-1), 1]),"v":_S.invoke(_n_r_b0,"range",[140, 280]),"life":_S.invoke(_n_r_b0,"range",[0.25, 0.55])}
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_A = _S.read(_parent,"A")
	var _n_drift = _S.read(_parent,"drift")
	var _n_p = _S.read(_parent,"p")
	var _n_SPARKS = _S.read(_parent,"SPARKS")
	var _n_spark = _S.read(_parent,"spark")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_a_b2 = (((_S.named_value(_n_q_b0,"e") * _n_A) * 1.8) - 0.12)
	var _tuple_0 = _S.call_value(_n_drift,[_S.named_value(_n_q_b0,"d"), ((_S.named_value(_n_q_b0,"e") * _S.named_value(_n_q_b0,"d")) * _n_A), (cos(_n_a_b2) * _S.named_value(_n_q_b0,"v")), ((sin(_n_a_b2) * _S.named_value(_n_q_b0,"v")) - 30), _n_age_b1, 0, 190, 2, 2])
	var _n_x_b3 = _S.prop(_tuple_0,0)
	var _n_y_b4 = _S.prop(_tuple_0,1)
	var _n_vx_b5 = _S.prop(_tuple_0,2)
	var _n_vy_b6 = _S.prop(_tuple_0,3)
	_S.call_value(_n_spark,[_n_p, _n_x_b3, _n_y_b4, _n_vx_b5, _n_vy_b6, (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life"))), _n_SPARKS])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return {"x":_S.invoke(_n_r_b0,"range",[50, 100]),"y":_S.invoke(_n_r_b0,"range",[(-14), 6]),"vx":_S.invoke(_n_r_b0,"range",[10, 40]),"vy":(-_S.invoke(_n_r_b0,"range",[20, 50])),"life":_S.invoke(_n_r_b0,"range",[0.8, 1.4]),"s":(2 if _S.truth(_S.invoke(_n_r_b0,"chance",[0.2])) else 1),"ph":_S.invoke(_n_r_b0,"range",[0, 6.3])}
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_drift = _S.read(_parent,"drift")
	var _n_p = _S.read(_parent,"p")
	var _n_EMB = _S.read(_parent,"EMB")
	var _n_ember = _S.read(_parent,"ember")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_drift,[_S.named_value(_n_q_b0,"x"), _S.named_value(_n_q_b0,"y"), _S.named_value(_n_q_b0,"vx"), _S.named_value(_n_q_b0,"vy"), _n_age_b1, 0, (-30), 1.6, 1.6])
	var _n_x_b2 = _S.prop(_tuple_0,0)
	var _n_y_b3 = _S.prop(_tuple_0,1)
	_S.call_value(_n_ember,[_n_p, (_n_x_b2 + (5 * (sin(((_n_age_b1 * 2.3) + _S.named_value(_n_q_b0,"ph"))) - sin(_S.named_value(_n_q_b0,"ph"))))), _n_y_b3, (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life"))), _S.named_value(_n_q_b0,"s"), _n_EMB, ((_n_age_b1 * 40) + _S.named_value(_n_q_b0,"ph"))])
	return null
