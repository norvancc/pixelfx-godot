@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/rocket.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "beat", _S.import_value("fx/projectiles/_lib.js", "beat"))
	_S.define(_e, "wake", _S.import_value("fx/projectiles/_lib.js", "wake"))
	_S.define(_e, "cloud", _S.import_value("fx/projectiles/_lib.js", "cloud"))
	_S.define(_e, "spark", _S.import_value("fx/projectiles/_lib.js", "spark"))
	_S.define(_e, "pixelShape", _S.import_value("fx/projectiles/_lib.js", "pixelShape"))
	_S.define(_e, "jet", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Rocket"}, {"desc": "A steel rocket roars along: a flickering jet with shock diamonds and a white-hot nozzle, a thick billowing smoke trail lit by the flame, sparks shed behind."}, {"tags": ["projectile", "rocket", "missile", "smoke", "fire", "directional", "loop"]}, {"size": [288, 76]}, {"origin": [252, 42]}, {"duration": 1.2}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"metal": ["#0f0d16", "#25243a", "#3e4058", "#61667f", "#8e97b0", "#c4cce0", "#f2f6ff"]}, {"paint": ["#3a0d14", "#7c1a22", "#bd2f2c", "#ec5a45", "#ff9b7e"]}, {"smoke": ["#26222e", "#3d3846", "#5a5463", "#7e7887", "#a7a1ad", "#d0cad2", "#f1ecee"]}, {"speed": 120}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "OUTLINE", _S.call_value(_S.read(_e, "hex"), ["#100d17"]))
	_S.define(_e, "NOZZLE", _S.unary("-", 14))
	_S.define(_e, "J0", 22)
	_S.define(_e, "SHIP", _S.call_value(_S.read(_e, "pixelShape"), [_S.unary("-", 15), _S.unary("-", 9), 30, 19, _S.function_value(_e, "_f15")]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_F_b1 = _S.arg(_args,1)
	var _n_x0_b2 = _S.arg(_args,2)
	var _n_y0_b3 = _S.arg(_args,3)
	var _n_J_b4 = _S.arg(_args,4)
	var _n_wob_b5 = _S.arg(_args,5)
	var _n_fr_b6 = _S.arg(_args,6)
	var _n_dia_b7 = _S.invoke([0, 1, 2, 3],"map",[_S.function_value(_S.capture(_parent,{"fr":_n_fr_b6,"this":_this}),"_f1")])
	_S.invoke(_n_p_b0,"shade",[((_n_x0_b2 - _n_J_b4) - 2), (_n_y0_b3 - 6), _n_x0_b2, (_n_y0_b3 + 6), _S.function_value(_S.capture(_parent,{"x0":_n_x0_b2,"J":_n_J_b4,"y0":_n_y0_b3,"wob":_n_wob_b5,"fr":_n_fr_b6,"F":_n_F_b1,"dia":_n_dia_b7,"this":_this}),"_f2")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_fr = _S.read(_parent,"fr")
	var _n_i_b0 = _S.arg(_args,0)
	return ((3.6 + (_n_i_b0 * 4.3)) + ((_S.MathFX.rand([_n_fr,_n_i_b0,41]) - 0.5) * 0.7))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_x0 = _S.read(_parent,"x0")
	var _n_J = _S.read(_parent,"J")
	var _n_y0 = _S.read(_parent,"y0")
	var _n_wob = _S.read(_parent,"wob")
	var _n_fr = _S.read(_parent,"fr")
	var _n_F = _S.read(_parent,"F")
	var _n_dia = _S.read(_parent,"dia")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_u_b2 = (_n_x0 - _n_x_b0)
	if _S.truth((_n_u_b2 < 0)):
		return null
	var _n_q_b3 = (float(_n_u_b2)/_n_J)
	if _S.truth((_n_q_b3 > 1.05)):
		return null
	var _n_ady_b4 = absf((_n_y_b1 - _n_y0))
	var _n_qq_b5 = minf(_n_q_b3,1)
	var _n_w_b6 = (((2.6 + (2.4 * pow(_n_qq_b5,0.7))) * (1 - (_n_qq_b5 * _n_qq_b5))) * _n_wob)
	var _n_m_b7 = ((_n_w_b6 - _n_ady_b4) + (((_S.MathFX.rand([((floori(_n_x_b0) * 7) + (floori(_n_y_b1) * 131)),_n_fr]) - 0.5) * 0.9) * minf(1,(0.25 + (_n_q_b3 * 2)))))
	if _S.truth((_n_m_b7 < (-0.5))):
		return null
	if _S.truth((_n_m_b7 < 0.5)):
		return _S.index_value(_n_F,(3 if _S.truth((_n_q_b3 < 0.45)) else 2))
	if true:
		var _n_i_b9 = 0
		while _S.truth((_n_i_b9 < _S.prop(_n_dia,"length"))):
			if _S.truth((_S.index_value(_n_dia,_n_i_b9) > (_n_J * 0.72))):
				break
			var _n_d_b10 = ((float(absf((_n_u_b2 - _S.index_value(_n_dia,_n_i_b9))))/(1.9 - (_n_i_b9 * 0.15))) + (float(_n_ady_b4)/(1.7 - (_n_i_b9 * 0.25))))
			if _S.truth((_n_d_b10 < 1)):
				return (_S.index_value(_n_F,8) if _S.truth(((_n_i_b9 < 3) if _S.truth((_n_d_b10 < 0.55)) else (_n_d_b10 < 0.55))) else _S.index_value(_n_F,7))
			_n_i_b9 += 1.0
	if _S.truth(((_n_ady_b4 < 1.6) if _S.truth((_n_u_b2 < 1.6)) else (_n_u_b2 < 1.6))):
		return _S.index_value(_n_F,8)
	var _n_lvl_b8 = ((1 - (float(_n_ady_b4)/maxf(0.6,_n_w_b6))) * (1 - pow(_n_qq_b5,1.5)))
	return ((_S.index_value(_n_F,7) if _S.truth((_n_u_b2 < 3)) else _S.index_value(_n_F,5)) if _S.truth((_n_lvl_b8 > 0.62)) else (_S.index_value(_n_F,5) if _S.truth((_n_lvl_b8 > 0.38)) else (_S.index_value(_n_F,4) if _S.truth((_n_lvl_b8 > 0.16)) else _S.index_value(_n_F,3))))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_J0 = _S.read(_parent,"J0")
	var _n_beat = _S.read(_parent,"beat")
	var _n_cloud = _S.read(_parent,"cloud")
	var _n_NOZZLE = _S.read(_parent,"NOZZLE")
	var _n_jet = _S.read(_parent,"jet")
	var _n_SHIP = _S.read(_parent,"SHIP")
	var _n_OUTLINE = _S.read(_parent,"OUTLINE")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_F_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9)
	var _n_M_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"metal"),7)
	var _n_A_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"paint"),5)
	var _n_SM_b6 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"smoke"),7)
	var _n_S_b7 = _S.named_value(_n_o_b2,"seed")
	var _n_D_b8 = _S.named_value(_n_meta,"duration")
	var _n_V_b9 = _S.named_value(_n_o_b2,"speed")
	var _n_fr_b10 = floori(((_n_t_b1 * 30) + 0.000001))
	var _n_bob_b11 = _S.function_value(_S.capture(_parent,{"D":_n_D_b8,"this":_this}),"_f4")
	var _n_by_b12 = _S.call_value(_n_bob_b11,[_n_t_b1])
	var _n_J_b13 = (_n_J0 * (0.84 + (0.32 * _S.MathFX.rand([_n_fr_b10,_n_S_b7,1]))))
	var _n_wob_b14 = (0.92 + (0.16 * _S.MathFX.rand([_n_fr_b10,_n_S_b7,2])))
	var _n_fl_b15 = (float(_n_J_b13)/_n_J0)
	var _n_left_b16 = ((-_S.index_value(_S.named_value(_n_meta,"origin"),0)) + 2)
	var _n_SP_b17 = [_S.index_value(_n_F_b3,7), _S.index_value(_n_F_b3,6), _S.index_value(_n_F_b3,4), _S.index_value(_n_F_b3,3)]
	var _n_list_b18 = []
	_S.call_value(_n_beat,[_n_t_b1, _n_D_b8, 66, (_n_S_b7 + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"bob":_n_bob_b11,"t":_n_t_b1,"V":_n_V_b9,"left":_n_left_b16,"list":_n_list_b18,"this":_this}),"_f6")])
	_S.call_value(_n_cloud,[_n_p_b0, _n_list_b18, _n_SM_b6, [_S.ColorFX.mix(_S.index_value(_n_F_b3,0),_S.index_value(_n_SM_b6,0),0.5), _S.ColorFX.mix(_S.index_value(_n_F_b3,1),_S.index_value(_n_SM_b6,1),0.45), _S.ColorFX.mix(_S.index_value(_n_F_b3,2),_S.index_value(_n_SM_b6,2),0.35), _S.index_value(_n_F_b3,3), _S.index_value(_n_F_b3,4), _S.index_value(_n_F_b3,6), _S.index_value(_n_F_b3,7)], {"dens":1.3,"lit":1.5}])
	_S.invoke(_n_p_b0,"glow",[((_n_NOZZLE - _n_J0) - 6), _n_by_b12, 26, _S.index_value(_n_F_b3,4), (0.24 * _n_fl_b15)])
	_S.call_value(_n_beat,[_n_t_b1, _n_D_b8, 9, (_n_S_b7 + 4), _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), _S.function_value(_S.capture(_parent,{"bob":_n_bob_b11,"t":_n_t_b1,"V":_n_V_b9,"left":_n_left_b16,"fr":_n_fr_b10,"F":_n_F_b3,"p":_n_p_b0,"this":_this}),"_f8")])
	_S.call_value(_n_beat,[_n_t_b1, _n_D_b8, 30, (_n_S_b7 + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), _S.function_value(_S.capture(_parent,{"bob":_n_bob_b11,"t":_n_t_b1,"V":_n_V_b9,"p":_n_p_b0,"F":_n_F_b3,"this":_this}),"_f10")])
	_S.call_value(_n_beat,[_n_t_b1, _n_D_b8, 30, (_n_S_b7 + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f11"), _S.function_value(_S.capture(_parent,{"bob":_n_bob_b11,"t":_n_t_b1,"V":_n_V_b9,"left":_n_left_b16,"p":_n_p_b0,"SP":_n_SP_b17,"this":_this}),"_f12")])
	_S.call_value(_n_beat,[_n_t_b1, _n_D_b8, 8, (_n_S_b7 + 6), _S.function_value(_S.capture(_parent,{"this":_this}),"_f13"), _S.function_value(_S.capture(_parent,{"bob":_n_bob_b11,"t":_n_t_b1,"V":_n_V_b9,"left":_n_left_b16,"p":_n_p_b0,"SP":_n_SP_b17,"this":_this}),"_f14")])
	_S.call_value(_n_jet,[_n_p_b0, _n_F_b3, _n_NOZZLE, (_n_by_b12 + 0.5), _n_J_b13, _n_wob_b14, (_n_fr_b10 + (_n_S_b7 * 31))])
	_S.invoke(_n_p_b0,"sprite",[_S.named_value(_n_SHIP,"rows"), {"o":_n_OUTLINE,"1":_S.index_value(_n_M_b4,1),"2":_S.index_value(_n_M_b4,2),"3":_S.index_value(_n_M_b4,3),"4":_S.index_value(_n_M_b4,4),"5":_S.index_value(_n_M_b4,5),"6":_S.index_value(_n_M_b4,6),"a":_S.index_value(_n_A_b5,0),"b":_S.index_value(_n_A_b5,1),"c":_S.index_value(_n_A_b5,2),"d":_S.index_value(_n_A_b5,3),"e":_S.index_value(_n_A_b5,4),"w":_n_WHITE,"h":_S.index_value(_n_F_b3,5),"x":_S.index_value(_n_F_b3,8)}, _S.named_value(_n_SHIP,"x0"), (_S.named_value(_n_SHIP,"y0") + _n_by_b12)])
	_S.invoke(_n_p_b0,"glow",[(_n_NOZZLE - 10), _n_by_b12, 60, _S.index_value(_n_F_b3,4), (0.28 * _n_fl_b15)])
	_S.invoke(_n_p_b0,"glowLine",[(_n_NOZZLE - 3), (_n_by_b12 + 0.5), (_n_NOZZLE - (_n_J_b13 * 0.9)), (_n_by_b12 + 0.5), 11, _S.index_value(_n_F_b3,4), 0.2])
	_S.invoke(_n_p_b0,"glow",[(_n_NOZZLE - 1), (_n_by_b12 + 0.5), 8, _S.index_value(_n_F_b3,7), 0.45])
	_S.invoke(_n_p_b0,"glow",[(_n_NOZZLE + 3), (_n_by_b12 + 5), 12, _S.index_value(_n_F_b3,4), (0.22 * _n_fl_b15)])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_tt_b0 = _S.arg(_args,0)
	return floori((sin(((float(_n_tt_b0)/_n_D) * _n_TAU)) * 0.62)+0.5)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.1, 1.45])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_NOZZLE = _S.read(_parent,"NOZZLE")
	var _n_J0 = _S.read(_parent,"J0")
	var _n_bob = _S.read(_parent,"bob")
	var _n_t = _S.read(_parent,"t")
	var _n_V = _S.read(_parent,"V")
	var _n_wake = _S.read(_parent,"wake")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_left = _S.read(_parent,"left")
	var _n_list = _S.read(_parent,"list")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _tuple_0 = _S.call_value(_n_wake,[(_n_NOZZLE - (_n_J0 * _S.invoke(_n_r_b2,"range",[0.62, 0.8]))), (_S.call_value(_n_bob,[(_n_t - _n_age_b0)]) + _S.invoke(_n_r_b2,"range",[(-1), 1])), (-_S.invoke(_n_r_b2,"range",[75, 105])), _S.invoke(_n_r_b2,"range",[(-20), 20]), _n_age_b0, _n_V, 3, 0])
	var _n_x_b3 = _S.prop(_tuple_0,0)
	var _n_y_b4 = _S.prop(_tuple_0,1)
	var _n_k_b5 = (float(_n_age_b0)/_n_life_b1)
	var _n_rise_b6 = (((0.5 * _S.invoke(_n_r_b2,"range",[6, 16])) * _n_age_b0) * _n_age_b0)
	var _n_sway_b7 = ((sin(((_n_age_b0 * 2.3) + _S.invoke(_n_r_b2,"range",[0, _n_TAU]))) * _n_age_b0) * 2)
	var _n_rad_b8 = (_S.invoke(_n_r_b2,"range",[2.2, 3]) + (((_S.invoke(_n_r_b2,"range",[14, 19]) if _S.truth(_S.invoke(_n_r_b2,"chance",[0.25])) else _S.invoke(_n_r_b2,"range",[8, 13])) - 2.6) * (1 - exp(((-2.2) * _n_age_b0)))))
	if _S.truth(((_n_x_b3 - _n_rad_b8) < (_n_left + 1))):
		return null
	var _n_a_b9 = (((minf(1,(_n_age_b0 * 16)) * pow((1 - _n_k_b5),1.25)) * 0.68) * _S.MathFX.smooth(_n_left,(_n_left + 40),(_n_x_b3 - _n_rad_b8)))
	_S.invoke(_n_list,"push",[{"x":_n_x_b3,"y":((_n_y_b4 - _n_rise_b6) + _n_sway_b7),"r":_n_rad_b8,"a":_n_a_b9,"b":clampf(((0.95 - (_n_k_b5 * 0.75)) + _S.invoke(_n_r_b2,"range",[(-0.08), 0.08])),0.0,1.0),"w":exp(((-_n_age_b0) * _S.invoke(_n_r_b2,"range",[3.5, 6])))}])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.6, 1.1])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_NOZZLE = _S.read(_parent,"NOZZLE")
	var _n_J0 = _S.read(_parent,"J0")
	var _n_bob = _S.read(_parent,"bob")
	var _n_t = _S.read(_parent,"t")
	var _n_V = _S.read(_parent,"V")
	var _n_wake = _S.read(_parent,"wake")
	var _n_left = _S.read(_parent,"left")
	var _n_fr = _S.read(_parent,"fr")
	var _n_F = _S.read(_parent,"F")
	var _n_p = _S.read(_parent,"p")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (1 - (float(_n_age_b0)/_n_life_b1))
	var _tuple_0 = _S.call_value(_n_wake,[(_n_NOZZLE - (_n_J0 * 0.6)), _S.call_value(_n_bob,[(_n_t - _n_age_b0)]), (-_S.invoke(_n_r_b2,"range",[40, 120])), _S.invoke(_n_r_b2,"range",[(-40), 30]), _n_age_b0, _n_V, 2.5, (-8)])
	var _n_x_b4 = _S.prop(_tuple_0,0)
	var _n_y_b5 = _S.prop(_tuple_0,1)
	if _S.truth(((_n_x_b4 < (_n_left + 2)) if _S.truth((_n_x_b4 < (_n_left + 2))) else ((_S.MathFX.rand([_n_fr,_S.invoke(_n_r_b2,"int",[0, 999])]) < 0.5) if _S.truth((_n_k_b3 < 0.3)) else (_n_k_b3 < 0.3)))):
		return null
	var _n_c_b6 = (_S.index_value(_n_F,6) if _S.truth((_n_k_b3 > 0.6)) else (_S.index_value(_n_F,4) if _S.truth((_n_k_b3 > 0.3)) else _S.index_value(_n_F,2)))
	_S.invoke(_n_p,"px",[_n_x_b4, _n_y_b5, _n_c_b6])
	_S.invoke(_n_p,"glow",[_n_x_b4, _n_y_b5, 3, _n_c_b6, (0.35 * _n_k_b3)])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.08, 0.16])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_NOZZLE = _S.read(_parent,"NOZZLE")
	var _n_J0 = _S.read(_parent,"J0")
	var _n_bob = _S.read(_parent,"bob")
	var _n_t = _S.read(_parent,"t")
	var _n_V = _S.read(_parent,"V")
	var _n_wake = _S.read(_parent,"wake")
	var _n_p = _S.read(_parent,"p")
	var _n_F = _S.read(_parent,"F")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _tuple_0 = _S.call_value(_n_wake,[(_n_NOZZLE - (_n_J0 * _S.invoke(_n_r_b2,"range",[0.6, 0.9]))), (_S.call_value(_n_bob,[(_n_t - _n_age_b0)]) + _S.invoke(_n_r_b2,"range",[(-1.5), 1.5])), (-_S.invoke(_n_r_b2,"range",[10, 50])), _S.invoke(_n_r_b2,"range",[(-12), 12]), _n_age_b0, _n_V, 4, (-30)])
	var _n_x_b4 = _S.prop(_tuple_0,0)
	var _n_y_b5 = _S.prop(_tuple_0,1)
	var _n_idx_b6 = (7 - floori((pow(_n_k_b3,0.7) * 4)))
	var _n_rad_b7 = (_S.invoke(_n_r_b2,"range",[1.2, 2.2]) * (1 - (_n_k_b3 * 0.6)))
	_S.invoke(_n_p,"circle",[_n_x_b4, _n_y_b5, _n_rad_b7, _S.index_value(_n_F,(_n_idx_b6 - 2))])
	_S.invoke(_n_p,"circle",[(_n_x_b4 + (_n_rad_b7 * 0.25)), (_n_y_b5 - (_n_rad_b7 * 0.1)), (_n_rad_b7 * 0.65), _S.index_value(_n_F,_n_idx_b6)])
	_S.invoke(_n_p,"glow",[_n_x_b4, _n_y_b5, ((_n_rad_b7 * 2.4) + 2), _S.index_value(_n_F,_n_idx_b6), (0.2 * (1 - _n_k_b3))])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.18, 0.45])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_NOZZLE = _S.read(_parent,"NOZZLE")
	var _n_J0 = _S.read(_parent,"J0")
	var _n_bob = _S.read(_parent,"bob")
	var _n_t = _S.read(_parent,"t")
	var _n_V = _S.read(_parent,"V")
	var _n_wake = _S.read(_parent,"wake")
	var _n_left = _S.read(_parent,"left")
	var _n_p = _S.read(_parent,"p")
	var _n_SP = _S.read(_parent,"SP")
	var _n_spark = _S.read(_parent,"spark")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _tuple_0 = _S.call_value(_n_wake,[(_n_NOZZLE - _S.invoke(_n_r_b2,"range",[2, (_n_J0 * 0.7)])), (_S.call_value(_n_bob,[(_n_t - _n_age_b0)]) + _S.invoke(_n_r_b2,"range",[(-1.5), 1.5])), (-_S.invoke(_n_r_b2,"range",[20, 190])), _S.invoke(_n_r_b2,"range",[(-80), 50]), _n_age_b0, _n_V, 2.6, 160])
	var _n_x_b3 = _S.prop(_tuple_0,0)
	var _n_y_b4 = _S.prop(_tuple_0,1)
	var _n_vx_b5 = _S.prop(_tuple_0,2)
	var _n_vy_b6 = _S.prop(_tuple_0,3)
	if _S.truth((_n_x_b3 > (_n_left + 10))):
		_S.call_value(_n_spark,[_n_p, _n_x_b3, _n_y_b4, _n_vx_b5, _n_vy_b6, (1 - (float(_n_age_b0)/_n_life_b1)), _n_SP])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.5, 0.8])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_NOZZLE = _S.read(_parent,"NOZZLE")
	var _n_J0 = _S.read(_parent,"J0")
	var _n_bob = _S.read(_parent,"bob")
	var _n_t = _S.read(_parent,"t")
	var _n_V = _S.read(_parent,"V")
	var _n_wake = _S.read(_parent,"wake")
	var _n_left = _S.read(_parent,"left")
	var _n_p = _S.read(_parent,"p")
	var _n_SP = _S.read(_parent,"SP")
	var _n_spark = _S.read(_parent,"spark")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _tuple_0 = _S.call_value(_n_wake,[(_n_NOZZLE - _S.invoke(_n_r_b2,"range",[4, (_n_J0 * 0.8)])), (_S.call_value(_n_bob,[(_n_t - _n_age_b0)]) + _S.invoke(_n_r_b2,"range",[(-1), 1])), (-_S.invoke(_n_r_b2,"range",[10, 80])), _S.invoke(_n_r_b2,"range",[(-60), 10]), _n_age_b0, _n_V, 1.8, 170])
	var _n_x_b3 = _S.prop(_tuple_0,0)
	var _n_y_b4 = _S.prop(_tuple_0,1)
	var _n_vx_b5 = _S.prop(_tuple_0,2)
	var _n_vy_b6 = _S.prop(_tuple_0,3)
	if _S.truth((_n_x_b3 > (_n_left + 10))):
		_S.call_value(_n_spark,[_n_p, _n_x_b3, _n_y_b4, _n_vx_b5, _n_vy_b6, (1 - (float(_n_age_b0)/_n_life_b1)), _n_SP, 0.5])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_Object = _S.read(_parent,"Object")
	var _n_this = _S.read(_parent,"this")
	var _n_set_b0 = _S.arg(_args,0)
	var _n_body_b1 = {"-3":"4","-2":"6","-1":"5","0":"4","1":"3","2":"2","3":"1"}
	var _n_seam_b2 = {"-3":"3","-2":"4","-1":"4","0":"3","1":"2","2":"1","3":"1"}
	var _n_paint_b3 = {"-3":"d","-2":"e","-1":"e","0":"d","1":"c","2":"b","3":"a"}
	if true:
		var _n_y_b5 = (-3)
		while _S.truth((_n_y_b5 <= 3)):
			if true:
				var _n_x_b6 = (-11)
				while _S.truth((_n_x_b6 <= 5)):
					_S.call_value(_n_set_b0,[_n_x_b6, _n_y_b5, _S.index_value(_n_body_b1,_n_y_b5)])
					_n_x_b6 += 1.0
			_n_y_b5 += 1.0
	if true:
		var _n_y_b7 = (-3)
		while _S.truth((_n_y_b7 <= 3)):
			_S.call_value(_n_set_b0,[(-3), _n_y_b7, _S.index_value(_n_seam_b2,_n_y_b7)])
			_S.call_value(_n_set_b0,[(-9), _n_y_b7, _S.index_value(_n_paint_b3,_n_y_b7)])
			_S.call_value(_n_set_b0,[(-8), _n_y_b7, _S.index_value(_n_paint_b3,_n_y_b7)])
			_n_y_b7 += 1.0
	var _n_nose_b4 = {"6":3,"7":3,"8":2,"9":2,"10":1,"11":1,"12":0,"13":0}
	for _iter_0 in _S.array(_S.invoke(_n_Object,"entries",[_n_nose_b4])):
		var _tuple_1 = _iter_0
		var _n_xs_b8 = _S.prop(_tuple_1,0)
		var _n_h_b9 = _S.prop(_tuple_1,1)
		if true:
			var _n_y_b10 = (-_n_h_b9)
			while _S.truth((_n_y_b10 <= _n_h_b9)):
				_S.call_value(_n_set_b0,[_S.unary("+",_n_xs_b8), _n_y_b10, _S.index_value(_n_paint_b3,_n_y_b10)])
				_n_y_b10 += 1.0
	_S.call_value(_n_set_b0,[7, (-2), "w"])
	_S.call_value(_n_set_b0,[8, (-2), "w"])
	_S.call_value(_n_set_b0,[9, (-1), "e"])
	_S.call_value(_n_set_b0,[13, 0, "e"])
	_S.invoke([[(-13), (-8)], [(-13), (-9)], [(-13), (-10)], [(-13), (-11)]],"forEach",[_S.function_value(_S.capture(_parent,{"set":_n_set_b0,"this":_n_this}),"_f16")])
	if true:
		var _n_y_b11 = (-2)
		while _S.truth((_n_y_b11 <= 2)):
			_S.call_value(_n_set_b0,[(-12), _n_y_b11, ("3" if _S.truth((_n_y_b11 < 0)) else "2")])
			_n_y_b11 += 1.0
	if true:
		var _n_y_b12 = (-3)
		while _S.truth((_n_y_b12 <= 3)):
			_S.call_value(_n_set_b0,[(-13), _n_y_b12, ("2" if _S.truth((_n_y_b12 < (-1))) else "1")])
			_n_y_b12 += 1.0
	_S.call_value(_n_set_b0,[(-14), (-3), "h"])
	_S.call_value(_n_set_b0,[(-14), 3, "h"])
	if true:
		var _n_y_b13 = (-2)
		while _S.truth((_n_y_b13 <= 2)):
			_S.call_value(_n_set_b0,[(-14), _n_y_b13, ("x" if _S.truth((absf(_n_y_b13) < 2)) else "h")])
			_n_y_b13 += 1.0
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_set = _S.read(_parent,"set")
	var _tuple_0 = _S.arg(_args,0)
	var _n_a_b0 = _S.prop(_tuple_0,0)
	var _n_b_b1 = _S.prop(_tuple_0,1)
	var _n_i_b2 = _S.arg(_args,1)
	if true:
		var _n_x_b3 = _n_a_b0
		while _S.truth((_n_x_b3 <= _n_b_b1)):
			_S.call_value(_n_set,[_n_x_b3, ((-4) - _n_i_b2), ("5" if _S.truth(_S.binary("===",_n_x_b3,_n_b_b1)) else ("4" if _S.truth((_n_i_b2 > 1)) else "3"))])
			_S.call_value(_n_set,[_n_x_b3, (4 + _n_i_b2), ("3" if _S.truth(_S.binary("===",_n_x_b3,_n_b_b1)) else ("1" if _S.truth((_n_i_b2 > 1)) else "2"))])
			_n_x_b3 += 1.0
	return null
