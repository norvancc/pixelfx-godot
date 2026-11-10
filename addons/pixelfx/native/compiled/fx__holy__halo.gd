@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/halo.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "GOLD", _S.import_value("fx/holy/_lib.js", "GOLD"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Halo"}, {"desc": "A ring of gold light floats over the head with a glint running round it; fine dust sifts down from it and the head catches its light."}, {"tags": ["holy", "halo", "saint", "buff", "glow", "character", "loop"]}, {"size": [56, 80]}, {"origin": [28, 70]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "GOLD")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "PRAY", _S.merge([{"turn": 1.1}, {"fx": _S.unary("-", 1)}, {"fy": _S.unary("-", 26)}, {"bx": 2}, {"by": _S.unary("-", 26)}, {"armsFront": true}, {"hy": 1}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "PRAY")], [0.5, _S.merge([_S.read(_e, "PRAY"), {"crouch": 1}])], [1, _S.merge([_S.read(_e, "PRAY"), {"crouch": 1}, {"hy": 2}])], [1.5, _S.merge([_S.read(_e, "PRAY"), {"crouch": 1}])], [2, _S.read(_e, "PRAY")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "HY", _S.unary("-", 46))
	_S.define(_e, "RX", 9.5)
	_S.define(_e, "RY", 2.6)
	_S.define(_e, "apart", _S.function_value(_e, "_f5"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_HY = _S.read(_parent,"HY")
	var _n_RX = _S.read(_parent,"RX")
	var _n_RY = _S.read(_parent,"RY")
	var _n_apart = _S.read(_parent,"apart")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_T_b4 = _S.named_value(_n_meta,"duration")
	var _n_ph_b5 = ((float(_n_t_b1)/_n_T_b4) * _n_TAU)
	var _n_A_b6 = _S.named_value(_n_o_b2,"actor")
	var _n_y0_b7 = (_n_HY + ((-1) if _S.truth((sin(_n_ph_b5) > 0.55)) else 0))
	var _n_gl_b8 = ((float(PI)/2) + _n_ph_b5)
	if _S.truth(_n_A_b6):
		var _n_m_b11 = _S.named_value(_n_A_b6,"mask")
		if true:
			var _n_i_b12 = 0
			while _S.truth((_n_i_b12 < _S.named_value(_n_m_b11,"w"))):
				if true:
					var _n_j_b13 = 0
					while _S.truth((_n_j_b13 < minf(_S.named_value(_n_m_b11,"h"),9))):
						var _n_c_b14 = _S.index_value(_S.named_value(_n_A_b6,"pixels"),((_n_j_b13 * _S.named_value(_n_m_b11,"w")) + _n_i_b12))
						if _S.truth((not _S.truth(_n_c_b14) if _S.truth(not _S.truth(_n_c_b14)) else (_S.ColorFX.luma(_n_c_b14) < 0.15))):
							_n_j_b13 += 1.0
							continue
						var _n_x_b15 = (_S.named_value(_n_A_b6,"x") + _n_i_b12)
						var _n_y_b16 = (_S.named_value(_n_A_b6,"y") + _n_j_b13)
						_S.invoke(_n_p_b0,"px",[_n_x_b15, _n_y_b16, _S.ColorFX.mix(_n_c_b14,_S.index_value(_n_C_b3,6),0.45)])
						var _n_c2_b17 = _S.index_value(_S.named_value(_n_A_b6,"pixels"),(((_n_j_b13 + 1) * _S.named_value(_n_m_b11,"w")) + _n_i_b12))
						if _S.truth(((_S.ColorFX.luma(_n_c2_b17) >= 0.15) if _S.truth(_n_c2_b17) else _n_c2_b17)):
							_S.invoke(_n_p_b0,"px",[_n_x_b15, (_n_y_b16 + 1), _S.ColorFX.mix(_n_c2_b17,_S.index_value(_n_C_b3,5),0.18)])
						if true:
							var _n_d_b18 = 0
							while _S.truth((_n_d_b18 <= 4)):
								_S.invoke(_n_p_b0,"light",[_n_x_b15, (_n_y_b16 + _n_d_b18), _S.index_value(_n_C_b3,4), (0.3 * (1 - (float(_n_d_b18)/5)))])
								_n_d_b18 += 1.0
						break
						_n_j_b13 += 1.0
				_n_i_b12 += 1.0
	if true:
		var _n_j_b19 = 0
		var _n_n_b20 = 92
		while _S.truth((_n_j_b19 < _n_n_b20)):
			var _n_g_b21 = ((float(_n_j_b19)/_n_n_b20) * _n_TAU)
			var _n_x_b22 = (cos(_n_g_b21) * _n_RX)
			var _n_y_b23 = (_n_y0_b7 + (sin(_n_g_b21) * _n_RY))
			var _n_near_b24 = (sin(_n_g_b21) >= 0)
			var _n_shimmer_b25 = (sin(((_n_g_b21 * 3) - (_n_ph_b5 * 2))) > 0.7)
			var _n_hot_b26 = (_S.call_value(_n_apart,[_n_g_b21, _n_gl_b8]) < 0.3)
			if _S.truth(_n_near_b24):
				_S.invoke(_n_p_b0,"px",[_n_x_b22, _n_y_b23, (_n_WHITE if _S.truth(_n_hot_b26) else (_n_WHITE if _S.truth(_n_shimmer_b25) else _S.index_value(_n_C_b3,6)))])
				_S.invoke(_n_p_b0,"px",[_n_x_b22, (_n_y_b23 + 1), (_S.index_value(_n_C_b3,6) if _S.truth(_n_hot_b26) else _S.index_value(_n_C_b3,4))])
			else:
				_S.invoke(_n_p_b0,"dot",[_n_x_b22, _n_y_b23, (_n_WHITE if _S.truth(_n_hot_b26) else (_S.index_value(_n_C_b3,6) if _S.truth(_n_shimmer_b25) else _S.index_value(_n_C_b3,5))), 0.9])
			_n_j_b19 += 1.0
	_S.invoke(_n_p_b0,"glow",[0, _n_y0_b7, 20, _S.index_value(_n_C_b3,4), 0.4])
	_S.invoke(_n_p_b0,"glow",[0, (_n_y0_b7 + 1), 9, _n_WHITE, 0.16])
	var _n_gx_b9 = (cos(_n_gl_b8) * _n_RX)
	var _n_gy_b10 = (_n_y0_b7 + (sin(_n_gl_b8) * _n_RY))
	if _S.truth((sin(_n_gl_b8) > (-0.2))):
		_S.call_value(_n_sparkle,[_n_p_b0, _n_gx_b9, (_n_gy_b10 + 0.5), (1.5 + (2.5 * maxf(0,sin(_n_gl_b8)))), _n_WHITE, _S.index_value(_n_C_b3,6), 0.45])
	else:
		_S.invoke(_n_p_b0,"glow",[_n_gx_b9, _n_gy_b10, 5, _S.index_value(_n_C_b3,6), 0.3])
	_S.invoke(_n_p_b0,"glowLine",[0, (_n_y0_b7 + 2), 0, (_n_y0_b7 + 9), 9, _S.index_value(_n_C_b3,4), 0.16])
	_S.call_value(_n_cycle,[_n_t_b1, _n_T_b4, 6, (_S.named_value(_n_o_b2,"seed") + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"y0":_n_y0_b7,"C":_n_C_b3,"this":_this}),"_f2")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_T_b4, 16, _S.named_value(_n_o_b2,"seed"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f3"), _S.function_value(_S.capture(_parent,{"y0":_n_y0_b7,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f4")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.3, 0.5])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_RX = _S.read(_parent,"RX")
	var _n_y0 = _S.read(_parent,"y0")
	var _n_RY = _S.read(_parent,"RY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_g_b3 = _S.invoke(_n_R_b2,"range",[0, _n_TAU])
	var _n_d_b4 = _S.invoke(_n_R_b2,"range",[1.1, 1.5])
	var _n_k_b5 = sin(((float(_n_age_b0)/_n_life_b1) * PI))
	_S.call_value(_n_sparkle,[_n_p, ((cos(_n_g_b3) * _n_RX) * _n_d_b4), ((_n_y0 + ((sin(_n_g_b3) * _n_RY) * _n_d_b4)) - _S.invoke(_n_R_b2,"range",[1, 4])), (1 + (2 * _n_k_b5)), _n_WHITE, _S.index_value(_n_C,6), (0.4 * _n_k_b5)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.8, 1.5])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RX = _S.read(_parent,"RX")
	var _n_y0 = _S.read(_parent,"y0")
	var _n_RY = _S.read(_parent,"RY")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_g_b3 = _S.invoke(_n_R_b2,"range",[0, _n_TAU])
	var _n_u_b4 = (float(_n_age_b0)/_n_life_b1)
	var _n_x_b5 = (((cos(_n_g_b3) * _n_RX) * _S.invoke(_n_R_b2,"range",[0.8, 1])) + (sin(((_n_u_b4 * 5) + _n_g_b3)) * 1.2))
	var _n_y_b6 = (((_n_y0 + (sin(_n_g_b3) * _n_RY)) + 1) + (_n_u_b4 * _S.invoke(_n_R_b2,"range",[7, 14])))
	var _n_tw_b7 = (0.6 + (0.4 * sin(((_n_age_b0 * 18) + (_n_g_b3 * 7)))))
	var _n_k_b8 = (sin((_n_u_b4 * PI)) * _n_tw_b7)
	_S.invoke(_n_p,"dot",[_n_x_b5, _n_y_b6, (_n_WHITE if _S.truth((_n_tw_b7 > 0.85)) else _S.index_value(_n_C,6)), minf(1,(_n_k_b8 * 1.5))])
	_S.invoke(_n_p,"light",[_n_x_b5, _n_y_b6, _S.index_value(_n_C,5), (0.5 * _n_k_b8)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return absf((fmod((fmod(((_n_a_b0 - _n_b_b1) + PI),_n_TAU) + _n_TAU),_n_TAU) - PI))
	return null
