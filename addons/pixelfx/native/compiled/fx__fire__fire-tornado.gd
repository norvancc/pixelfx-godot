@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/fire-tornado.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "flameTongue", _S.import_value("fx/fire/_lib.js", "flameTongue"))
	_S.define(_e, "firePuff", _S.import_value("fx/fire/_lib.js", "firePuff"))
	_S.define(_e, "smokePuff", _S.import_value("fx/fire/_lib.js", "smokePuff"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "floorLight", _S.import_value("fx/fire/_lib.js", "floorLight"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "BACK_LAYERS", _S.import_value("fx/fire/_lib.js", "BACK_LAYERS"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Fire tornado"}, {"desc": "A spinning funnel of fire: spiral bands turning round it, licks flung off its sides, a ring of flame whirling at its foot, embers orbiting it in and out of view."}, {"tags": ["fire", "tornado", "vortex", "spell", "aoe", "loop"]}, {"size": [120, 152]}, {"origin": [60, 136]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"height": 80}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "SMOKE1", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "SPIN", 3)
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_hotFirst = _S.read(_parent,"hotFirst")
	var _n_D = _S.read(_parent,"D")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_SMOKE1 = _S.read(_parent,"SMOKE1")
	var _n_looped = _S.read(_parent,"looped")
	var _n_floorLight = _S.read(_parent,"floorLight")
	var _n_pnoise = _S.read(_parent,"pnoise")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9)
	var _n_H_b4 = _S.call_value(_n_hotFirst,[_n_F_b3])
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_HT_b6 = _S.named_value(_n_o_b2,"height")
	var _n_ph_b7 = (float(_n_t_b1)/_n_D)
	var _n_N_b8 = _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f1")
	var _n_GLOW_b9 = _S.ColorFX.mix(_S.ColorFX.mix(_S.index_value(_n_H_b4,3),_S.index_value(_n_H_b4,4),0.5),_n_WHITE,0.25)
	var _n_SMOKE_b10 = _S.ColorFX.mix(_n_SMOKE1,_S.index_value(_n_H_b4,6),0.25)
	var _n_EMB_b11 = [_S.index_value(_n_H_b4,1), _S.index_value(_n_H_b4,2), _S.index_value(_n_H_b4,4), _S.index_value(_n_H_b4,6)]
	var _n_cx_b12 = _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f2")
	var _n_rad_b13 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f3")
	var _n_spin_b14 = _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f4")
	var _n_orbit_b15 = []
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 30, (_n_S_b5 + 500), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"rad":_n_rad_b13,"cx":_n_cx_b12,"t":_n_t_b1,"HT":_n_HT_b6,"orbit":_n_orbit_b15,"this":_this}),"_f6")])
	var _n_embers_b16 = _S.function_value(_S.capture(_parent,{"orbit":_n_orbit_b15,"EMB":_n_EMB_b11,"p":_n_p_b0,"H":_n_H_b4,"this":_this}),"_f7")
	var _n_ring_b17 = _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"S":_n_S_b5,"N":_n_N_b8,"p":_n_p_b0,"H":_n_H_b4,"this":_this}),"_f9")
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 20, (_n_S_b5 + 300), _S.function_value(_S.capture(_parent,{"this":_this}),"_f10"), _S.function_value(_S.capture(_parent,{"rad":_n_rad_b13,"cx":_n_cx_b12,"t":_n_t_b1,"HT":_n_HT_b6,"p":_n_p_b0,"SMOKE":_n_SMOKE_b10,"this":_this}),"_f11")])
	_S.call_value(_n_floorLight,[_n_p_b0, 0, 0.5, 40, 8, _n_GLOW_b9, 0.4])
	_S.call_value(_n_embers_b16,[false])
	_S.call_value(_n_ring_b17,[false])
	var _n_fl_b18 = (0.85 + (0.15 * _S.call_value(_n_N_b8,[7, (_n_S_b5 + 1)])))
	if true:
		var _n_y_b19 = 0
		while _S.truth((_n_y_b19 >= ((-_n_HT_b6) * 1.2))):
			var _n_v_b20 = (float((-_n_y_b19))/_n_HT_b6)
			var _n_vv_b21 = minf(1,_n_v_b20)
			var _n_c_b22 = _S.call_value(_n_cx_b12,[_n_vv_b21])
			var _n_r_b23 = (_S.call_value(_n_rad_b13,[_n_vv_b21]) * (1 + (0.08 * _S.call_value(_n_N_b8,[3, (_n_S_b5 + 2), (_n_y_b19 * 0.1)]))))
			var _n_sp_b24 = _S.call_value(_n_spin_b14,[_n_v_b20])
			var _n_cut_b25 = clampf((float((_n_v_b20 - 0.72))/0.42),0.0,1.0)
			var _n_lickL_b26 = (0.3 * maxf(0,_S.call_value(_n_pnoise,[(((-_n_y_b19) * 0.22) + (_n_ph_b7 * 18)), 18, (_n_S_b5 + 3)])))
			var _n_lickR_b27 = (0.3 * maxf(0,_S.call_value(_n_pnoise,[((((-_n_y_b19) * 0.22) + (_n_ph_b7 * 18)) + 9), 18, (_n_S_b5 + 4)])))
			if true:
				var _n_x_b28 = floori((_n_c_b22 - (_n_r_b23 * 1.35)))
				while _S.truth((_n_x_b28 <= ceili((_n_c_b22 + (_n_r_b23 * 1.35))))):
					var _n_dx_b29 = (float(((_n_x_b28 + 0.5) - _n_c_b22))/_n_r_b23)
					var _n_edge_b30 = (1 + (_n_lickL_b26 if _S.truth((_n_dx_b29 < 0)) else _n_lickR_b27))
					if _S.truth((absf(_n_dx_b29) > _n_edge_b30)):
						_n_x_b28 += 1.0
						continue
					var _n_th_b31 = asin(clampf(_n_dx_b29,(-1),1))
					var _n_depth_b32 = cos(_n_th_b31)
					var _n_tear_b33 = (0.18 * _S.call_value(_n_pnoise,[(((_n_y_b19 * 0.45) + (_n_dx_b29 * 2)) - (_n_ph_b7 * 30)), 30, (_n_S_b5 + 6)]))
					var _n_band_b34 = (0.5 + (0.5 * sin((((_n_th_b31 + _n_sp_b24) + _n_tear_b33) * 3))))
					var _n_streak_b35 = ((_n_band_b34 * _n_band_b34) * _n_band_b34)
					if _S.truth(((_n_band_b34 < ((0.35 + (_n_cut_b25 * 0.6)) + (0.1 * _S.call_value(_n_pnoise,[((_n_x_b28 * 0.7) + (_n_ph_b7 * 20)), 20, (_n_S_b5 + 5)])))) if _S.truth((_n_cut_b25 > 0)) else (_n_cut_b25 > 0))):
						_n_x_b28 += 1.0
						continue
					var _n_heat_b36 = (((((0.22 + (0.36 * _n_depth_b32)) + (0.5 * _n_streak_b35)) - (0.22 * _n_vv_b21)) + (0.1 * (1 - _n_vv_b21))) - (0.25 * _n_cut_b25))
					if _S.truth((absf(_n_dx_b29) > 1)):
						_n_heat_b36 = (0.3 - ((absf(_n_dx_b29) - 1) * 1.5))
					_n_heat_b36 *= _n_fl_b18
					var _n_col_b37 = (_S.index_value(_n_H_b4,0) if _S.truth((_n_heat_b36 > 0.95)) else (_S.index_value(_n_H_b4,1) if _S.truth((_n_heat_b36 > 0.82)) else (_S.index_value(_n_H_b4,2) if _S.truth((_n_heat_b36 > 0.7)) else (_S.index_value(_n_H_b4,3) if _S.truth((_n_heat_b36 > 0.58)) else (_S.index_value(_n_H_b4,4) if _S.truth((_n_heat_b36 > 0.46)) else (_S.index_value(_n_H_b4,5) if _S.truth((_n_heat_b36 > 0.34)) else (_S.index_value(_n_H_b4,6) if _S.truth((_n_heat_b36 > 0.2)) else _S.index_value(_n_H_b4,7))))))))
					_S.invoke(_n_p_b0,"px",[_n_x_b28, _n_y_b19, _n_col_b37])
					_n_x_b28 += 1.0
			if _S.truth(((_n_v_b20 <= 1) if _S.truth(_S.binary("===",fmod(_n_y_b19,10),0)) else _S.binary("===",fmod(_n_y_b19,10),0))):
				_S.invoke(_n_p_b0,"glow",[_n_c_b22, _n_y_b19, ((_n_r_b23 * 2) + 8), _n_GLOW_b9, (0.22 * _n_fl_b18)])
			_n_y_b19 -= 1.0
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 70, (_n_S_b5 + 200), _S.function_value(_S.capture(_parent,{"this":_this}),"_f12"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"cx":_n_cx_b12,"rad":_n_rad_b13,"HT":_n_HT_b6,"p":_n_p_b0,"H":_n_H_b4,"this":_this}),"_f13")])
	_S.call_value(_n_ring_b17,[true])
	_S.call_value(_n_embers_b16,[true])
	_S.invoke(_n_p_b0,"glow",[0, ((-_n_HT_b6) * 0.5), 80, _n_GLOW_b9, (0.28 * _n_fl_b18)])
	_S.invoke(_n_p_b0,"glow",[0, (-6), 18, _S.index_value(_n_H_b4,2), (0.3 * _n_fl_b18)])
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
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.coalesce(_S.arg(_args,1),func():return _n_t)
	return (((3.2 * sin(((_n_v_b0 * 4.2) - (((float(_n_tt_b1)/_n_D) * _n_TAU) * 2)))) * _n_v_b0) + ((2 * sin(((float(_n_tt_b1)/_n_D) * _n_TAU))) * _n_v_b0))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_v_b0 = _S.arg(_args,0)
	return (3.5 + (15 * pow(_n_v_b0,1.35)))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_SPIN = _S.read(_parent,"SPIN")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.coalesce(_S.arg(_args,1),func():return _n_t)
	return ((((float(_n_tt_b1)/_n_D) * _n_TAU) * _n_SPIN) + (_n_v_b0 * 5.5))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_r_b0 = _S.arg(_args,0)
	return {"v0":_S.invoke(_n_r_b0,"range",[0.02, 0.7]),"rise":_S.invoke(_n_r_b0,"range",[0.12, 0.3]),"a":_S.invoke(_n_r_b0,"range",[0, _n_TAU]),"w":_S.invoke(_n_r_b0,"range",[4, 7]),"out":_S.invoke(_n_r_b0,"range",[4, 12]),"life":_S.invoke(_n_r_b0,"range",[1.2, 2.4]),"big":_S.invoke(_n_r_b0,"chance",[0.2])}
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_rad = _S.read(_parent,"rad")
	var _n_cx = _S.read(_parent,"cx")
	var _n_t = _S.read(_parent,"t")
	var _n_HT = _S.read(_parent,"HT")
	var _n_orbit = _S.read(_parent,"orbit")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_v_b2 = (_S.named_value(_n_q_b0,"v0") + (_S.named_value(_n_q_b0,"rise") * _n_age_b1))
	var _n_R_b3 = ((_S.call_value(_n_rad,[minf(1,_n_v_b2)]) + _S.named_value(_n_q_b0,"out")) + (_n_age_b1 * 4))
	var _n_a_b4 = (_S.named_value(_n_q_b0,"a") + (_S.named_value(_n_q_b0,"w") * _n_age_b1))
	var _n_k_b5 = (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life")))
	var _n_x_b6 = (_S.call_value(_n_cx,[minf(1,_n_v_b2), _n_t]) + (cos(_n_a_b4) * _n_R_b3))
	var _n_y_b7 = (((-_n_v_b2) * _n_HT) + ((sin(_n_a_b4) * _n_R_b3) * 0.28))
	var _n_z_b8 = sin(_n_a_b4)
	_S.invoke(_n_orbit,"push",[{"x":_n_x_b6,"y":_n_y_b7,"z":_n_z_b8,"k":_n_k_b5,"vx":(((-sin(_n_a_b4)) * _n_R_b3) * _S.named_value(_n_q_b0,"w")),"vy":(((cos(_n_a_b4) * _n_R_b3) * _S.named_value(_n_q_b0,"w")) * 0.28),"big":_S.named_value(_n_q_b0,"big")}])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_EMB = _S.read(_parent,"EMB")
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_orbit = _S.read(_parent,"orbit")
	var _n_front_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_orbit):
		var _n_e_b1 = _iter_0
		if _S.truth((_S.binary("!==",(_S.named_value(_n_e_b1,"z") >= 0),_n_front_b0) if _S.truth(_S.binary("!==",(_S.named_value(_n_e_b1,"z") >= 0),_n_front_b0)) else (_S.named_value(_n_e_b1,"k") <= 0))):
			continue
		var _n_sp_b2 = _S.logical("||",_S.Bridge.hypot([_S.named_value(_n_e_b1,"vx"), _S.named_value(_n_e_b1,"vy")]),func():return 1)
		var _n_L_b3 = minf(5,(1 + (_n_sp_b2 * 0.025)))
		var _n_c_b4 = (_S.index_value(_n_EMB,0) if _S.truth((_S.named_value(_n_e_b1,"k") > 0.6)) else (_S.index_value(_n_EMB,1) if _S.truth((_S.named_value(_n_e_b1,"k") > 0.3)) else _S.index_value(_n_EMB,2)))
		_S.invoke(_n_p,"line",[(_S.named_value(_n_e_b1,"x") - ((float(_S.named_value(_n_e_b1,"vx"))/_n_sp_b2) * _n_L_b3)), (_S.named_value(_n_e_b1,"y") - ((float(_S.named_value(_n_e_b1,"vy"))/_n_sp_b2) * _n_L_b3)), _S.named_value(_n_e_b1,"x"), _S.named_value(_n_e_b1,"y"), _S.function_value(_S.capture(_parent,{"c":_n_c_b4,"front":_n_front_b0,"this":_n_this}),"_f8")])
		if _S.truth(_n_front_b0):
			_S.invoke(_n_p,"glow",[_S.named_value(_n_e_b1,"x"), _S.named_value(_n_e_b1,"y"), 4, _n_c_b4, (0.4 * _S.named_value(_n_e_b1,"k"))])
		else:
			_S.invoke(_n_p,"glow",[_S.named_value(_n_e_b1,"x"), _S.named_value(_n_e_b1,"y"), 3, _n_c_b4, (0.15 * _S.named_value(_n_e_b1,"k"))])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_c = _S.read(_parent,"c")
	var _n_EMB = _S.read(_parent,"EMB")
	var _n_front = _S.read(_parent,"front")
	var _n_H = _S.read(_parent,"H")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_c if _S.truth((_n_u_b0 > 0.6)) else (_S.index_value(_n_EMB,3) if _S.truth(_n_front) else _S.index_value(_n_H,7)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_S = _S.read(_parent,"S")
	var _n_N = _S.read(_parent,"N")
	var _n_p = _S.read(_parent,"p")
	var _n_H = _S.read(_parent,"H")
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_BACK_LAYERS = _S.read(_parent,"BACK_LAYERS")
	var _n_flameTongue = _S.read(_parent,"flameTongue")
	var _n_front_b0 = _S.arg(_args,0)
	if true:
		var _n_i_b1 = 0
		while _S.truth((_n_i_b1 < 12)):
			var _n_a_b2 = (((float(_n_i_b1)/12) * _n_TAU) + (((float(_n_t)/_n_D) * _n_TAU) * 2))
			var _n_z_b3 = sin(_n_a_b2)
			if _S.truth(_S.binary("!==",(_n_z_b3 >= 0),_n_front_b0)):
				_n_i_b1 += 1.0
				continue
			var _n_n_b4 = (((_n_S * 3) + _n_i_b1) * 19)
			var _n_R_b5 = (12 + (2 * _S.call_value(_n_N,[2, _n_n_b4])))
			var _n_x_b6 = (cos(_n_a_b2) * _n_R_b5)
			var _n_y_b7 = ((_n_z_b3 * _n_R_b5) * 0.25)
			var _n_h_b8 = ((5 + (5 * (0.5 + (0.5 * _S.call_value(_n_N,[5, (_n_n_b4 + 1)]))))) * (1 if _S.truth(_n_front_b0) else 0.8))
			_S.call_value(_n_flameTongue,[_n_p, _n_x_b6, _n_y_b7, _n_h_b8, 1.6, ((-cos((_n_a_b2 + (float(PI)/2)))) * 3), _n_N, _n_n_b4, _n_H, (_n_LAYERS if _S.truth(_n_front_b0) else _n_BACK_LAYERS)])
			_n_i_b1 += 1.0
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_r_b0 = _S.arg(_args,0)
	return {"a":_S.invoke(_n_r_b0,"range",[0, _n_TAU]),"life":_S.invoke(_n_r_b0,"range",[1.2, 2]),"s":_S.invoke(_n_r_b0,"range",[2.5, 4]),"vy":(-_S.invoke(_n_r_b0,"range",[12, 22]))}
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_rad = _S.read(_parent,"rad")
	var _n_cx = _S.read(_parent,"cx")
	var _n_t = _S.read(_parent,"t")
	var _n_HT = _S.read(_parent,"HT")
	var _n_p = _S.read(_parent,"p")
	var _n_SMOKE = _S.read(_parent,"SMOKE")
	var _n_smokePuff = _S.read(_parent,"smokePuff")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_R_b2 = (_S.call_value(_n_rad,[1]) * (0.8 + (_n_age_b1 * 0.5)))
	var _n_a_b3 = (_S.named_value(_n_q_b0,"a") + (_n_age_b1 * 3))
	var _n_x_b4 = (_S.call_value(_n_cx,[1, (_n_t - _n_age_b1)]) + (cos(_n_a_b3) * _n_R_b2))
	var _n_y_b5 = ((((-_n_HT) - 2) + (_S.named_value(_n_q_b0,"vy") * _n_age_b1)) + ((sin(_n_a_b3) * _n_R_b2) * 0.25))
	_S.call_value(_n_smokePuff,[_n_p, _n_x_b4, _n_y_b5, (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life"))), _S.named_value(_n_q_b0,"s"), _n_SMOKE])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return {"v":_S.invoke(_n_r_b0,"range",[0.05, 0.95]),"side":_S.invoke(_n_r_b0,"sign",[]),"sp":_S.invoke(_n_r_b0,"range",[20, 50]),"life":_S.invoke(_n_r_b0,"range",[0.25, 0.5]),"s":_S.invoke(_n_r_b0,"range",[1.4, 2.8]),"f":_S.invoke(_n_r_b0,"next",[])}
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_cx = _S.read(_parent,"cx")
	var _n_rad = _S.read(_parent,"rad")
	var _n_HT = _S.read(_parent,"HT")
	var _n_drift = _S.read(_parent,"drift")
	var _n_p = _S.read(_parent,"p")
	var _n_H = _S.read(_parent,"H")
	var _n_firePuff = _S.read(_parent,"firePuff")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_tb_b2 = (_n_t - _n_age_b1)
	var _n_x0_b3 = (_S.call_value(_n_cx,[_S.named_value(_n_q_b0,"v"), _n_tb_b2]) + (_S.named_value(_n_q_b0,"side") * _S.call_value(_n_rad,[_S.named_value(_n_q_b0,"v")])))
	var _n_y0_b4 = ((-_S.named_value(_n_q_b0,"v")) * _n_HT)
	var _tuple_0 = _S.call_value(_n_drift,[_n_x0_b3, _n_y0_b4, (_S.named_value(_n_q_b0,"side") * _S.named_value(_n_q_b0,"sp")), ((-_S.named_value(_n_q_b0,"sp")) * 0.6), _n_age_b1, 0, (-60), 3, 3])
	var _n_x_b5 = _S.prop(_tuple_0,0)
	var _n_y_b6 = _S.prop(_tuple_0,1)
	_S.call_value(_n_firePuff,[_n_p, _n_x_b5, _n_y_b6, (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life"))), _S.named_value(_n_q_b0,"s"), _S.named_value(_n_q_b0,"f"), _n_H, 0.1, ((-_S.named_value(_n_q_b0,"side")) * 0.6), (-0.8)])
	return null
