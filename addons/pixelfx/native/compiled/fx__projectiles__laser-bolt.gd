@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/laser-bolt.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "beat", _S.import_value("fx/projectiles/_lib.js", "beat"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Laser bolt"}, {"desc": "A red laser bolt: a white-hot core in a rounded head, red bands tapering back, pulses racing down it, a tail that shimmers apart into wavering dashes."}, {"tags": ["projectile", "laser", "energy", "sci-fi", "directional", "loop"]}, {"size": [128, 32]}, {"origin": [108, 16]}, {"duration": 0.5}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#2a0610", "#5c0d1c", "#9a1428", "#d8243a", "#ff4d5e", "#ff8a94", "#ffd0d4", "#ffffff"]}, {"length": 40}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_beat = _S.read(_parent,"beat")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_L_b4 = _S.prop(_n_o_b2,"length")
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_D_b6 = _S.named_value(_n_meta,"duration")
	var _n_ph_b7 = (float(_n_t_b1)/_n_D_b6)
	var _n_fr_b8 = floori(((_n_t_b1 * 30) + 0.000001))
	var _n_left_b9 = ((-_S.index_value(_S.named_value(_n_meta,"origin"),0)) + 2)
	_S.call_value(_n_beat,[_n_t_b1, _n_D_b6, 14, _n_S_b5, _S.function_value(_S.capture(_parent,{"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"L":_n_L_b4,"ph":_n_ph_b7,"left":_n_left_b9,"fr":_n_fr_b8,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f2")])
	_S.invoke(_n_p_b0,"shade",[((-_n_L_b4) - 1), (-5), 4, 6, _S.function_value(_S.capture(_parent,{"L":_n_L_b4,"ph":_n_ph_b7,"fr":_n_fr_b8,"C":_n_C_b3,"this":_this}),"_f3")])
	for _iter_0 in _S.array([0, PI]):
		var _n_s_b11 = _iter_0
		if true:
			var _n_d_b12 = 2
			while _S.truth((_n_d_b12 < (_n_L_b4 * 0.7))):
				var _n_a_b13 = (((_n_d_b12 * 0.45) - ((_n_ph_b7 * _n_TAU) * 3)) + _n_s_b11)
				var _n_y_b14 = (0.5 + (sin(_n_a_b13) * ((2.2 * (1 - (float(_n_d_b12)/_n_L_b4))) + 0.6)))
				if _S.truth((cos(_n_a_b13) > 0.3)):
					_S.invoke(_n_p_b0,"dot",[(-_n_d_b12), _n_y_b14, (_n_WHITE if _S.truth((cos(_n_a_b13) > 0.8)) else _S.index_value(_n_C_b3,6))])
				_n_d_b12 += 1
	var _n_g_b10 = (0.75 + (0.25 * sin(((_n_ph_b7 * _n_TAU) * 2))))
	_S.call_value(_n_sparkle,[_n_p_b0, 1, 0.5, (3 + floori((_n_g_b10 * 2)+0.5)), _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,4), 0.5])
	_S.invoke(_n_p_b0,"glowLine",[1, 0.5, (-_n_L_b4), 0.5, 9, _S.index_value(_n_C_b3,3), 0.4])
	_S.invoke(_n_p_b0,"glow",[(-2), 0.5, 20, _S.index_value(_n_C_b3,3), (0.5 * _n_g_b10)])
	_S.invoke(_n_p_b0,"glow",[1, 0.5, 6, _n_WHITE, 0.25])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.18, 0.3])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_ph = _S.read(_parent,"ph")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_left = _S.read(_parent,"left")
	var _n_fr = _S.read(_parent,"fr")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_x0_b4 = (((-_n_L) * 0.8) - (_n_age_b0 * _S.invoke(_n_r_b2,"range",[150, 230])))
	var _n_len_b5 = (_S.invoke(_n_r_b2,"range",[3, 7]) * (1 - (_n_k_b3 * 0.5)))
	var _n_y_b6 = ((0.5 + (sin(((_n_x0_b4 * 0.25) + ((_n_ph * _n_TAU) * 2))) * (0.5 + (_n_k_b3 * 1.5)))) + (_S.invoke(_n_r_b2,"range",[(-0.6), 0.6]) * _n_k_b3))
	if _S.truth((((_n_x0_b4 - _n_len_b5) < _n_left) if _S.truth(((_n_x0_b4 - _n_len_b5) < _n_left)) else (_S.MathFX.rand([_n_fr,_S.invoke(_n_r_b2,"int",[0, 999])]) < (_n_k_b3 * 0.5)))):
		return null
	_S.invoke(_n_p,"line",[_n_x0_b4, _n_y_b6, (_n_x0_b4 - _n_len_b5), _n_y_b6, (_S.index_value(_n_C,5) if _S.truth((_n_k_b3 < 0.3)) else (_S.index_value(_n_C,4) if _S.truth((_n_k_b3 < 0.6)) else _S.index_value(_n_C,3)))])
	if _S.truth((_n_k_b3 < 0.4)):
		_S.invoke(_n_p,"glow",[(_n_x0_b4 - (float(_n_len_b5)/2)), _n_y_b6, 4, _S.index_value(_n_C,4), (0.3 * (1 - _n_k_b3))])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_ph = _S.read(_parent,"ph")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_fr = _S.read(_parent,"fr")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_d_b2 = ((-_n_x_b0) + 3)
	var _n_u_b3 = (float(_n_d_b2)/(_n_L + 3))
	if _S.truth(((_n_u_b3 < 0) if _S.truth((_n_u_b3 < 0)) else (_n_u_b3 > 1))):
		return null
	var _n_head_b4 = (sqrt(maxf(0,(1 - pow((float((3 - _n_d_b2))/3),2)))) if _S.truth((_n_d_b2 < 3)) else 1)
	var _n_w_b5 = ((((3.4 * pow((1 - _n_u_b3),0.9)) + 0.5) * _n_head_b4) * (1 + (0.08 * sin(((_n_d_b2 * 0.9) - ((_n_ph * _n_TAU) * 4))))))
	var _n_v_b6 = (float(absf((_n_y_b1 - 0.5)))/_n_w_b5)
	if _S.truth((_n_v_b6 > 1.2)):
		return null
	if _S.truth((((_n_u_b3 > 0.5) if _S.truth((_n_u_b3 > 0.5)) else (_S.MathFX.rand([floori(_n_x_b0),_n_fr]) > 0.6)) if _S.truth((_n_v_b6 > 1)) else (_n_v_b6 > 1))):
		return null
	var _n_pulse_b7 = (1 if _S.truth((fmod((fmod(((_n_d_b2 * 0.05) - (_n_ph * 3)),1) + 1),1) < 0.12)) else 0)
	var _n_lvl_b8 = ((7 if _S.truth((_n_u_b3 < 0.6)) else 6) if _S.truth((_n_v_b6 < 0.22)) else ((6 - (1 if _S.truth((_n_u_b3 > 0.5)) else 0)) if _S.truth((_n_v_b6 < 0.45)) else (4 if _S.truth((_n_v_b6 < 0.72)) else (3 if _S.truth((_n_v_b6 <= 1)) else 2))))
	return _S.index_value(_n_C,minf(7,(_n_lvl_b8 + (_n_pulse_b7 if _S.truth((_n_v_b6 < 0.72)) else 0))))
	return null
