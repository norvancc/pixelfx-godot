@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/flamethrower.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "pnoise", _S.import_value("fx/fire/_lib.js", "pnoise"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "flameTongue", _S.import_value("fx/fire/_lib.js", "flameTongue"))
	_S.define(_e, "firePuff", _S.import_value("fx/fire/_lib.js", "firePuff"))
	_S.define(_e, "smokePuff", _S.import_value("fx/fire/_lib.js", "smokePuff"))
	_S.define(_e, "spark", _S.import_value("fx/fire/_lib.js", "spark"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "solid", _S.import_value("fx/fire/_lib.js", "solid"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Flamethrower"}, {"desc": "A pressurised jet shooting right: a blue pilot at the nozzle, a tight stream with surges racing down it, a sputter, burning drops falling off, a tip that curls up into smoke."}, {"tags": ["fire", "flamethrower", "stream", "weapon", "directional", "loop"]}, {"size": [184, 104]}, {"origin": [30, 60]}, {"duration": 1.6}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"pilot": ["#1b2a8a", "#3a62e0", "#a8d4ff"]}, {"reach": 112}, {"speed": 280}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#2a2430"]))
	_S.define(_e, "COUGH", 0.55)
	_S.define(_e, "flow", _S.function_value(_e, "_f14"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_hotFirst = _S.read(_parent,"hotFirst")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_SOOT = _S.read(_parent,"SOOT")
	var _n_D = _S.read(_parent,"D")
	var _n_looped = _S.read(_parent,"looped")
	var _n_smokePuff = _S.read(_parent,"smokePuff")
	var _n_firePuff = _S.read(_parent,"firePuff")
	var _n_flow = _S.read(_parent,"flow")
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_flameTongue = _S.read(_parent,"flameTongue")
	var _n_pnoise = _S.read(_parent,"pnoise")
	var _n_solid = _S.read(_parent,"solid")
	var _n_COUGH = _S.read(_parent,"COUGH")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9)
	var _n_H_b4 = _S.call_value(_n_hotFirst,[_n_F_b3])
	var _n_PL_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"pilot"),3)
	var _n_S_b6 = _S.named_value(_n_o_b2,"seed")
	var _n_L_b7 = _S.named_value(_n_o_b2,"reach")
	var _n_V_b8 = _S.named_value(_n_o_b2,"speed")
	var _n_N_b9 = _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f1")
	var _n_GLOW_b10 = _S.ColorFX.mix(_S.ColorFX.mix(_S.index_value(_n_H_b4,3),_S.index_value(_n_H_b4,4),0.5),_n_WHITE,0.25)
	var _n_SPARKS_b11 = [_S.index_value(_n_H_b4,1), _S.index_value(_n_H_b4,2), _S.index_value(_n_H_b4,4), _S.index_value(_n_H_b4,5)]
	var _n_SMOKE_b12 = _S.ColorFX.mix(_n_SOOT,_S.index_value(_n_H_b4,7),0.3)
	var _n_cy_b13 = _S.function_value(_S.capture(_parent,{"L":_n_L_b7,"N":_n_N_b9,"S":_n_S_b6,"this":_this}),"_f2")
	var _n_width_b14 = _S.function_value(_S.capture(_parent,{"L":_n_L_b7,"t":_n_t_b1,"V":_n_V_b8,"this":_this}),"_f3")
	var _n_fire_b15 = []
	var _n_smoke_b16 = []
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 80, (_n_S_b6 + 100), _S.function_value(_S.capture(_parent,{"this":_this}),"_f4"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"L":_n_L_b7,"V":_n_V_b8,"cy":_n_cy_b13,"fire":_n_fire_b15,"smoke":_n_smoke_b16,"this":_this}),"_f5")])
	for _iter_0 in _S.array(_n_smoke_b16):
		var _tuple_1 = _iter_0
		var _n_u_b19 = _S.prop(_tuple_1,0)
		var _n_x_b20 = _S.prop(_tuple_1,1)
		var _n_y_b21 = _S.prop(_tuple_1,2)
		var _n_q_b22 = _S.prop(_tuple_1,3)
		_S.call_value(_n_smokePuff,[_n_p_b0, _n_x_b20, _n_y_b21, (1 - _n_u_b19), (_S.named_value(_n_q_b22,"s") * 1.2), _n_SMOKE_b12, true, 0.85])
	_S.invoke(_n_fire_b15,"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f6")])
	for _iter_2 in _S.array(_n_fire_b15):
		var _tuple_3 = _iter_2
		var _n_u_b23 = _S.prop(_tuple_3,0)
		var _n_x_b24 = _S.prop(_tuple_3,1)
		var _n_y_b25 = _S.prop(_tuple_3,2)
		var _n_q_b26 = _S.prop(_tuple_3,3)
		var _n_k_b27 = _S.prop(_tuple_3,4)
		_S.call_value(_n_firePuff,[_n_p_b0, _n_x_b24, _n_y_b25, (1 - _n_u_b23), ((_S.named_value(_n_q_b26,"s") * (0.8 + (1.1 * _n_u_b23))) * _n_k_b27), _S.named_value(_n_q_b26,"f"), _n_H_b4, 0.1])
	if true:
		var _n_i_b28 = 0
		while _S.truth((_n_i_b28 < 13)):
			var _n_n_b29 = (((_n_S_b6 * 3) + _n_i_b28) * 19)
			var _n_ph_b30 = fmod(((_n_i_b28 * 0.618) + (float(_n_t_b1)/_n_D)),1)
			var _n_x_b31 = (10 + (_n_ph_b30 * (_n_L_b7 - 14)))
			var _n_k_b32 = _S.call_value(_n_flow,[(_n_t_b1 - (float(_n_x_b31)/_n_V_b8))])
			if _S.truth((_n_k_b32 < 0.35)):
				_n_i_b28 += 1.0
				continue
			var _n_h_b33 = ((((2 + (11 * (float(_n_x_b31)/_n_L_b7))) * (0.55 + (0.6 * (0.5 + (0.5 * _S.call_value(_n_N_b9,[5, (_n_n_b29 + 1)])))))) * _n_k_b32) * minf(1,((1 - _n_ph_b30) * 6)))
			_S.call_value(_n_flameTongue,[_n_p_b0, _n_x_b31, (_S.call_value(_n_cy_b13,[_n_x_b31]) - (_S.call_value(_n_width_b14,[_n_x_b31]) * 0.6)), _n_h_b33, (1.1 + (1.6 * (float(_n_x_b31)/_n_L_b7))), ((-_n_h_b33) * 0.55), _n_N_b9, _n_n_b29, _n_H_b4, _n_LAYERS])
			_n_i_b28 += 1.0
	var _n_P_b17 = floori((_n_D * 3)+0.5)
	if true:
		var _n_x_b34 = 0
		while _S.truth((_n_x_b34 <= _n_L_b7)):
			var _n_c_b35 = _S.call_value(_n_cy_b13,[_n_x_b34])
			var _n_w_b36 = (_S.call_value(_n_width_b14,[_n_x_b34]) * (1 + (0.15 * _S.call_value(_n_pnoise,[((_n_x_b34 * 0.4) - ((float(_n_t_b1)/_n_D) * 24)), 24, (_n_S_b6 + 4)]))))
			if _S.truth((_n_w_b36 < 0.4)):
				_n_x_b34 += 1.0
				continue
			var _n_surge_b37 = (1 if _S.truth((fmod((fmod(((_n_x_b34 * 0.035) - ((float(_n_t_b1)/_n_D) * _n_P_b17)),1) + 1),1) < 0.12)) else 0)
			if true:
				var _n_y_b38 = floori(((_n_c_b35 - _n_w_b36) - 1))
				while _S.truth((_n_y_b38 <= ceili(((_n_c_b35 + _n_w_b36) + 1)))):
					var _n_q_b39 = (float(absf(((_n_y_b38 + 0.5) - _n_c_b35)))/_n_w_b36)
					if _S.truth((_n_q_b39 > 1.15)):
						_n_y_b38 += 1.0
						continue
					var _n_lvl_b40 = ((0 if _S.truth((_n_q_b39 < 0.3)) else (1 if _S.truth((_n_q_b39 < 0.55)) else (2 if _S.truth((_n_q_b39 < 0.78)) else (3 if _S.truth((_n_q_b39 < 1)) else 4)))) + (1 if _S.truth(((_n_q_b39 < 0.55) if _S.truth((_n_x_b34 > (_n_L_b7 * 0.45))) else (_n_x_b34 > (_n_L_b7 * 0.45)))) else 0))
					_n_lvl_b40 = maxf(0,minf(4,(_n_lvl_b40 - _n_surge_b37)))
					if _S.truth(((_S.call_value(_n_pnoise,[(((_n_x_b34 * 0.5) + (_n_y_b38 * 7.3)) - ((float(_n_t_b1)/_n_D) * 40)), 40, (_n_S_b6 + 6)]) < 0) if _S.truth(_S.binary("===",_n_lvl_b40,4)) else _S.binary("===",_n_lvl_b40,4))):
						_n_y_b38 += 1.0
						continue
					_S.invoke(_n_p_b0,"px",[_n_x_b34, _n_y_b38, _S.index_value([_S.index_value(_n_H_b4,0), _S.index_value(_n_H_b4,2), _S.index_value(_n_H_b4,4), _S.index_value(_n_H_b4,6), _S.index_value(_n_H_b4,7)],_n_lvl_b40)])
					_n_y_b38 += 1.0
			for _iter_4 in _S.array([0, PI]):
				var _n_ph_b41 = _iter_4
				var _n_a_b42 = (((_n_x_b34 * 0.22) - ((((float(_n_t_b1)/_n_D) * PI) * 2) * 9)) + _n_ph_b41)
				var _n_sy_b43 = (_n_c_b35 + ((sin(_n_a_b42) * _n_w_b36) * 0.55))
				if _S.truth(_S.logical("&&",(cos(_n_a_b42) > (-0.1)),func():return (_n_w_b36 > 1.2))):
					_S.invoke(_n_p_b0,"px",[_n_x_b34, _n_sy_b43, (_S.index_value(_n_H_b4,0) if _S.truth((cos(_n_a_b42) > 0.55)) else _S.index_value(_n_H_b4,1))])
			_n_x_b34 += 1.0
	var _n_pk_b18 = _S.call_value(_n_flow,[_n_t_b1])
	if true:
		var _n_x_b44 = 0
		while _S.truth((_n_x_b44 < 6)):
			if true:
				var _n_y_b45 = (-2)
				while _S.truth((_n_y_b45 <= 2)):
					if _S.truth((absf(_n_y_b45) <= (2 - (_n_x_b44 * 0.3)))):
						_S.invoke(_n_p_b0,"px",[_n_x_b44, _n_y_b45, ((_S.index_value(_n_PL_b5,2) if _S.truth((_n_x_b44 < 2)) else _S.index_value(_n_PL_b5,1)) if _S.truth((absf(_n_y_b45) < 1)) else _S.index_value(_n_PL_b5,0))])
					_n_y_b45 += 1.0
			_n_x_b44 += 1.0
	_S.call_value(_n_solid,[_n_p_b0, 1, 0, (1.6 * _n_pk_b18), _n_WHITE])
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 10, (_n_S_b6 + 200), _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"V":_n_V_b8,"cy":_n_cy_b13,"p":_n_p_b0,"H":_n_H_b4,"this":_this}),"_f8")])
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 12, (_n_S_b6 + 300), _S.function_value(_S.capture(_parent,{"this":_this}),"_f10"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"p":_n_p_b0,"SPARKS":_n_SPARKS_b11,"this":_this}),"_f11")])
	_S.call_value(_n_looped,[_n_t_b1, _n_D, 5, (_n_S_b6 + 350), _S.function_value(_S.capture(_parent,{"this":_this}),"_f12"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"p":_n_p_b0,"H":_n_H_b4,"this":_this}),"_f13")])
	var _n_u_b46 = fmod((fmod(_n_t_b1,_n_D) + _n_D),_n_D)
	var _n_a_b47 = (_n_u_b46 - _n_COUGH)
	if _S.truth(((_n_a_b47 < 0.7) if _S.truth((_n_a_b47 > 0)) else (_n_a_b47 > 0))):
		_S.call_value(_n_smokePuff,[_n_p_b0, (8 + (_n_a_b47 * 20)), ((-_n_a_b47) * 18), (1 - (float(_n_a_b47)/0.7)), 3, _n_SMOKE_b12, false, 0.8])
	_S.invoke(_n_p_b0,"glow",[2, 0, (34 * _n_pk_b18), _n_GLOW_b10, (0.8 * _n_pk_b18)])
	_S.invoke(_n_p_b0,"glow",[2, 0, 9, _S.index_value(_n_PL_b5,2), (0.45 * _n_pk_b18)])
	if true:
		var _n_d_b48 = 8
		while _S.truth((_n_d_b48 <= _n_L_b7)):
			_S.invoke(_n_p_b0,"glow",[_n_d_b48, _S.call_value(_n_cy_b13,[_n_d_b48]), (12 + (_n_d_b48 * 0.16)), _n_GLOW_b10, (0.3 * _S.call_value(_n_flow,[(_n_t_b1 - (float(_n_d_b48)/_n_V_b8))]))])
			_n_d_b48 += 8
	_S.invoke(_n_p_b0,"glow",[_n_L_b7, (_S.call_value(_n_cy_b13,[_n_L_b7]) - 10), 52, _n_GLOW_b10, (0.34 * _S.call_value(_n_flow,[(_n_t_b1 - (float(_n_L_b7)/_n_V_b8))]))])
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
	var _n_L = _S.read(_parent,"L")
	var _n_N = _S.read(_parent,"N")
	var _n_S = _S.read(_parent,"S")
	var _n_x_b0 = _S.arg(_args,0)
	return ((5 * pow((float(_n_x_b0)/_n_L),2)) + ((_S.call_value(_n_N,[1.2, (_n_S + 9), (_n_x_b0 * 0.02)]) * 2.2) * pow((float(_n_x_b0)/_n_L),1.5)))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_flow = _S.read(_parent,"flow")
	var _n_t = _S.read(_parent,"t")
	var _n_V = _S.read(_parent,"V")
	var _n_x_b0 = _S.arg(_args,0)
	return ((2.1 + (5 * pow((float(_n_x_b0)/_n_L),0.7))) * _S.call_value(_n_flow,[(_n_t - (float(_n_x_b0)/_n_V))]))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return {"a0":_S.invoke(_n_r_b0,"range",[(-0.3), 0.5]),"R":_S.invoke(_n_r_b0,"range",[9, 15]),"w":_S.invoke(_n_r_b0,"range",[5, 7.5]),"up":_S.invoke(_n_r_b0,"range",[4, 12]),"dx":_S.invoke(_n_r_b0,"range",[(-6), 2]),"fl":_S.invoke(_n_r_b0,"range",[0.38, 0.62]),"sl":_S.invoke(_n_r_b0,"range",[0.6, 1]),"s":_S.invoke(_n_r_b0,"range",[2.4, 4.4]),"f":_S.invoke(_n_r_b0,"next",[]),"life":1.6}
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_flow = _S.read(_parent,"flow")
	var _n_L = _S.read(_parent,"L")
	var _n_V = _S.read(_parent,"V")
	var _n_cy = _S.read(_parent,"cy")
	var _n_fire = _S.read(_parent,"fire")
	var _n_smoke = _S.read(_parent,"smoke")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_tb_b2 = (_n_t - _n_age_b1)
	var _n_k_b3 = _S.call_value(_n_flow,[(_n_tb_b2 - (float(_n_L)/_n_V))])
	if _S.truth((_n_k_b3 < 0.4)):
		return null
	var _n_x0_b4 = (_n_L + _S.named_value(_n_q_b0,"dx"))
	var _n_y0_b5 = _S.call_value(_n_cy,[_n_L])
	var _n_a_b6 = ((minf(_n_age_b1,_S.named_value(_n_q_b0,"fl")) * _S.named_value(_n_q_b0,"w")) + _S.named_value(_n_q_b0,"a0"))
	var _n_x_b7 = (_n_x0_b4 + (_S.named_value(_n_q_b0,"R") * sin(_n_a_b6)))
	var _n_y_b8 = ((_n_y0_b5 - (_S.named_value(_n_q_b0,"R") * (1 - cos(_n_a_b6)))) - (_S.named_value(_n_q_b0,"up") * _n_age_b1))
	if _S.truth((_n_age_b1 < _S.named_value(_n_q_b0,"fl"))):
		return _S.invoke(_n_fire,"push",[[(float(_n_age_b1)/_S.named_value(_n_q_b0,"fl")), _n_x_b7, _n_y_b8, _n_q_b0, _n_k_b3]])
	if _S.truth(((_n_age_b1 - _S.named_value(_n_q_b0,"fl")) < _S.named_value(_n_q_b0,"sl"))):
		_S.invoke(_n_smoke,"push",[[(float((_n_age_b1 - _S.named_value(_n_q_b0,"fl")))/_S.named_value(_n_q_b0,"sl")), (_n_x_b7 - ((_n_age_b1 - _S.named_value(_n_q_b0,"fl")) * 6)), (_n_y_b8 - ((_n_age_b1 - _S.named_value(_n_q_b0,"fl")) * 16)), _n_q_b0]])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_b_b1,0) - _S.index_value(_n_a_b0,0))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return {"d":_S.invoke(_n_r_b0,"range",[20, 95]),"vx":_S.invoke(_n_r_b0,"range",[0.3, 0.6]),"vy":_S.invoke(_n_r_b0,"range",[(-25), 15]),"life":_S.invoke(_n_r_b0,"range",[0.35, 0.6])}
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_flow = _S.read(_parent,"flow")
	var _n_V = _S.read(_parent,"V")
	var _n_this = _S.read(_parent,"this")
	var _n_p = _S.read(_parent,"p")
	var _n_H = _S.read(_parent,"H")
	var _n_firePuff = _S.read(_parent,"firePuff")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_tb_b2 = (_n_t - _n_age_b1)
	if _S.truth((_S.call_value(_n_flow,[(_n_tb_b2 - (float(_S.named_value(_n_q_b0,"d"))/_n_V))]) < 0.5)):
		return null
	var _n_at_b3 = _S.function_value(_S.capture(_parent,{"q":_n_q_b0,"this":_n_this}),"_f9")
	if true:
		var _n_j_b7 = 4
		while _S.truth((_n_j_b7 >= 1)):
			var _n_a_b8 = (_n_age_b1 - (_n_j_b7 * 0.035))
			if _S.truth((_n_a_b8 < 0)):
				_n_j_b7 -= 1.0
				continue
			var _tuple_0 = _S.call_value(_n_at_b3,[_n_a_b8])
			var _n_x_b9 = _S.prop(_tuple_0,0)
			var _n_y_b10 = _S.prop(_tuple_0,1)
			_S.call_value(_n_firePuff,[_n_p, _n_x_b9, _n_y_b10, (1 - minf(0.99,((_n_j_b7 * 0.18) + ((float(_n_age_b1)/_S.named_value(_n_q_b0,"life")) * 0.4)))), (1.8 - (_n_j_b7 * 0.25)), 0.3, _n_H, 0.06])
			_n_j_b7 -= 1.0
	var _tuple_1 = _S.call_value(_n_at_b3,[_n_age_b1])
	var _n_x_b4 = _S.prop(_tuple_1,0)
	var _n_y_b5 = _S.prop(_tuple_1,1)
	var _n_k_b6 = (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life")))
	_S.invoke(_n_p,"px",[_n_x_b4, _n_y_b5, (_S.index_value(_n_H,0) if _S.truth((_n_k_b6 > 0.5)) else _S.index_value(_n_H,2))])
	_S.invoke(_n_p,"px",[(_n_x_b4 + 1), _n_y_b5, _S.index_value(_n_H,3)])
	_S.invoke(_n_p,"glow",[_n_x_b4, _n_y_b5, 6, _S.index_value(_n_H,3), (0.45 * _n_k_b6)])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_q = _S.read(_parent,"q")
	var _n_cy = _S.read(_parent,"cy")
	var _n_V = _S.read(_parent,"V")
	var _n_drift = _S.read(_parent,"drift")
	var _n_a_b0 = _S.arg(_args,0)
	return _S.call_value(_n_drift,[_S.named_value(_n_q,"d"), _S.call_value(_n_cy,[_S.named_value(_n_q,"d")]), (_n_V * _S.named_value(_n_q,"vx")), _S.named_value(_n_q,"vy"), _n_a_b0, 0, 260, 1.2, 0.5])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_COUGH = _S.read(_parent,"COUGH")
	var _n_r_b0 = _S.arg(_args,0)
	return {"born":(_n_COUGH + _S.invoke(_n_r_b0,"range",[0, 0.08])),"a":_S.invoke(_n_r_b0,"range",[(-0.8), 0.8]),"v":_S.invoke(_n_r_b0,"range",[120, 240]),"life":_S.invoke(_n_r_b0,"range",[0.2, 0.45])}
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_drift = _S.read(_parent,"drift")
	var _n_p = _S.read(_parent,"p")
	var _n_SPARKS = _S.read(_parent,"SPARKS")
	var _n_spark = _S.read(_parent,"spark")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_u_b2 = fmod((fmod((_n_t - _n_age_b1),_n_D) + _n_D),_n_D)
	if _S.truth((absf((_n_u_b2 - _S.named_value(_n_q_b0,"born"))) > 0.06)):
		return null
	var _tuple_0 = _S.call_value(_n_drift,[4, 0, (cos(_S.named_value(_n_q_b0,"a")) * _S.named_value(_n_q_b0,"v")), (sin(_S.named_value(_n_q_b0,"a")) * _S.named_value(_n_q_b0,"v")), _n_age_b1, 0, 300, 2.5, 2.5])
	var _n_x_b3 = _S.prop(_tuple_0,0)
	var _n_y_b4 = _S.prop(_tuple_0,1)
	var _n_vx_b5 = _S.prop(_tuple_0,2)
	var _n_vy_b6 = _S.prop(_tuple_0,3)
	_S.call_value(_n_spark,[_n_p, _n_x_b3, _n_y_b4, _n_vx_b5, _n_vy_b6, (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life"))), _n_SPARKS])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_COUGH = _S.read(_parent,"COUGH")
	var _n_r_b0 = _S.arg(_args,0)
	return {"born":(_n_COUGH + _S.invoke(_n_r_b0,"range",[0.01, 0.1])),"v":_S.invoke(_n_r_b0,"range",[90, 170]),"vy":_S.invoke(_n_r_b0,"range",[(-30), 10]),"life":_S.invoke(_n_r_b0,"range",[0.25, 0.4]),"s":_S.invoke(_n_r_b0,"range",[1.6, 2.6])}
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_drift = _S.read(_parent,"drift")
	var _n_p = _S.read(_parent,"p")
	var _n_H = _S.read(_parent,"H")
	var _n_firePuff = _S.read(_parent,"firePuff")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_u_b2 = fmod((fmod((_n_t - _n_age_b1),_n_D) + _n_D),_n_D)
	if _S.truth((absf((_n_u_b2 - _S.named_value(_n_q_b0,"born"))) > 0.05)):
		return null
	var _tuple_0 = _S.call_value(_n_drift,[4, 0, _S.named_value(_n_q_b0,"v"), _S.named_value(_n_q_b0,"vy"), _n_age_b1, 0, 200, 2, 1])
	var _n_x_b3 = _S.prop(_tuple_0,0)
	var _n_y_b4 = _S.prop(_tuple_0,1)
	_S.call_value(_n_firePuff,[_n_p, _n_x_b3, _n_y_b4, (1 - (float(_n_age_b1)/_S.named_value(_n_q_b0,"life"))), _S.named_value(_n_q_b0,"s"), 0.2, _n_H, 0.1, (-0.86), (-0.5)])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_COUGH = _S.read(_parent,"COUGH")
	var _n_te_b0 = _S.arg(_args,0)
	var _n_u_b1 = fmod((fmod(_n_te_b0,_n_D) + _n_D),_n_D)
	return ((1 - (_S.MathFX.smooth(_n_COUGH,(_n_COUGH + 0.04),_n_u_b1) * (1 - _S.MathFX.smooth((_n_COUGH + 0.1),(_n_COUGH + 0.16),_n_u_b1)))) + (0.25 * exp((-pow((float(((_n_u_b1 - _n_COUGH) - 0.2))/0.05),2)))))
	return null
