@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/teleporter-pad.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Ghosts", _S.import_value("fx/scifi/_lib.js", "Ghosts"))
	_S.define(_e, "since", _S.import_value("fx/scifi/_lib.js", "since"))
	_S.define(_e, "ghosts", _S.function_value(_e, "_f0"))
	_S.define(_e, "pad", _S.function_value(_e, "_f1"))
	_S.define(_e, "lift", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Teleporter pad"}, {"desc": "A steel pad glows on the floor, its rings rippling outward; a soft column of light rises off it and rings of light lift away, sparkles drifting up through them."}, {"tags": ["scifi", "teleporter", "pad", "portal", "beam", "spawn", "ground", "loop"]}, {"size": [96, 104]}, {"origin": [48, 92]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#120a26", "#26145a", "#3c2296", "#5a3ad2", "#7f66f0", "#b4a2ff", "#e6deff", "#ffffff"]}, {"metal": ["#0e0d14", "#1e1c27", "#312e3e", "#4b4759", "#6f6a82", "#9d98b0"]}, {"seed": 26}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "RX", 31)
	_S.define(_e, "RY", 7)
	_S.define(_e, "PY", _S.unary("-", 3))
	_S.define(_e, "IN", 0.78)
	_S.define(_e, "HIGH", _S.unary("-", 84))
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_cache = _S.read(_parent,"cache")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_Ghosts = _S.read(_parent,"Ghosts")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RX = _S.read(_parent,"RX")
	var _n_IN = _S.read(_parent,"IN")
	var _n_P = _S.read(_parent,"P")
	var _n_PY = _S.read(_parent,"PY")
	var _n_RY = _S.read(_parent,"RY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_o_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_key_b2 = ("" + _S.string(_S.named_value(_n_o_b0,"seed")) + ":" + _S.string(_S.invoke(_S.named_value(_n_o_b0,"palette"),"join",[])) + "")
	if _S.truth(_S.invoke(_n_cache,"has",[_n_key_b2])):
		return _S.invoke(_n_cache,"get",[_n_key_b2])
	var _n_rn_b3 = _S.construct(_n_Rng,[_S.named_value(_n_o_b0,"seed")])
	var _n_g_b4 = _S.construct(_n_Ghosts,[_n_D, {"box":[(-46), (-90), 46, 10]}])
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < 40)):
			var _n_a_b6 = _S.invoke(_n_rn_b3,"range",[0, _n_TAU])
			var _n_r_b7 = (((sqrt(_S.invoke(_n_rn_b3,"next",[])) * _n_RX) * _n_IN) * 0.9)
			var _n_star_b8 = _S.binary("===",fmod(_n_i_b5,3),0)
			_S.invoke(_n_g_b4,"add",[_S.invoke(_n_rn_b3,"range",[0, _n_D]), (_S.named_value(_n_P,"STAR") if _S.truth(_n_star_b8) else _S.named_value(_n_P,"MOTE")), (cos(_n_a_b6) * _n_r_b7), (_n_PY + ((sin(_n_a_b6) * _n_r_b7) * (float(_n_RY)/_n_RX))), _S.invoke(_n_rn_b3,"range",[(-4), 4]), (-_S.invoke(_n_rn_b3,"range",[30, 75])), _S.invoke(_n_rn_b3,"range",[0.7, 1.3]), _S.invoke(_n_rn_b3,"pick",[[_n_WHITE, _S.index_value(_n_C_b1,6), _S.index_value(_n_C_b1,5)]]), (_S.invoke(_n_rn_b3,"range",[1.8, 3.4]) if _S.truth(_n_star_b8) else _S.invoke(_n_rn_b3,"range",[0.6, 1.2]))])
			_n_i_b5 += 1.0
	_S.invoke(_n_cache,"set",[_n_key_b2, _n_g_b4])
	return _n_g_b4
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_RX = _S.read(_parent,"RX")
	var _n_PY = _S.read(_parent,"PY")
	var _n_RY = _S.read(_parent,"RY")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	var _n_H_b3 = _S.arg(_args,3)
	var _n_ph_b4 = (float(_n_t_b1)/_n_D)
	_S.invoke(_n_p_b0,"shade",[((-_n_RX) - 1), ((_n_PY - _n_RY) - 1), (_n_RX + 1), 2, _S.function_value(_S.capture(_parent,{"H":_n_H_b3,"C":_n_C_b2,"ph":_n_ph_b4,"this":_this}),"_f2")])
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < 10)):
			var _n_a_b6 = (((float(_n_i_b5)/10) * _n_TAU) + 0.15)
			var _n_x_b7 = ((cos(_n_a_b6) * _n_RX) * 0.885)
			var _n_y_b8 = (_n_PY + ((sin(_n_a_b6) * _n_RY) * 0.885))
			var _n_k_b9 = (0.5 + (0.5 * cos((_n_TAU * ((2 * _n_ph_b4) - (float(_n_i_b5)/10))))))
			_S.invoke(_n_p_b0,"px",[_n_x_b7, _n_y_b8, (_n_WHITE if _S.truth((_n_k_b9 > 0.7)) else (_S.index_value(_n_C_b2,5) if _S.truth((_n_k_b9 > 0.4)) else _S.index_value(_n_C_b2,2)))])
			if _S.truth((_n_k_b9 > 0.5)):
				_S.invoke(_n_p_b0,"glow",[_n_x_b7, _n_y_b8, 4, _S.index_value(_n_C_b2,4), (0.35 * _n_k_b9)])
			_n_i_b5 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_RX = _S.read(_parent,"RX")
	var _n_PY = _S.read(_parent,"PY")
	var _n_RY = _S.read(_parent,"RY")
	var _n_H = _S.read(_parent,"H")
	var _n_IN = _S.read(_parent,"IN")
	var _n_C = _S.read(_parent,"C")
	var _n_ph = _S.read(_parent,"ph")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float(_n_x_b0)/_n_RX)
	var _n_v_b4 = (float((_n_y_b1 - _n_PY))/_n_RY)
	var _n_d_b5 = sqrt(((_n_u_b3 * _n_u_b3) + (_n_v_b4 * _n_v_b4)))
	if _S.truth((_n_d_b5 > 1)):
		if _S.truth(_S.logical("&&",_S.logical("&&",_S.logical("&&",(absf(_n_x_b0) <= _n_RX),func():return (_n_y_b1 > _n_PY)),func():return (_n_y_b1 <= 1)),func():return (sqrt(((_n_u_b3 * _n_u_b3) + pow((float(((_n_y_b1 - 3) - _n_PY))/_n_RY),2))) <= 1))):
			_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_H,0) if _S.truth((_S.binary("===",_n_y_b1,1) if _S.truth(_S.binary("===",_n_y_b1,1)) else (absf(_n_x_b0) > (_n_RX - 1)))) else (_S.index_value(_n_H,3) if _S.truth((_n_x_b0 < ((-_n_RX) * 0.4))) else (_S.index_value(_n_H,1) if _S.truth((_n_x_b0 > (_n_RX * 0.4))) else _S.index_value(_n_H,2)))),"=")
		return null
	if _S.truth((_n_d_b5 > 0.97)):
		return _S.set_prop(_n_out_b2,"c",_S.index_value(_n_H,0),"=")
	if _S.truth((_n_d_b5 > _n_IN)):
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_H,1) if _S.truth((absf((_n_d_b5 - (_n_IN + 0.1))) < 0.03)) else (_S.index_value(_n_C,3) if _S.truth((_n_d_b5 < (_n_IN + 0.03))) else (_S.index_value(_n_H,5) if _S.truth((_n_v_b4 < (-0.3))) else (_S.index_value(_n_H,4) if _S.truth((_n_v_b4 < 0.2)) else _S.index_value(_n_H,3))))),"=")
		return null
	var _n_r_b6 = (float(_n_d_b5)/_n_IN)
	var _n_ring_b7 = (fmod((fmod(((_n_r_b6 * 3) - (_n_ph * 3)),1) + 1),1) < 0.16)
	var _n_heat_b8 = pow((1 - _n_r_b6),1.5)
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,3) if _S.truth((_n_r_b6 > 0.94)) else ((_n_WHITE if _S.truth((_n_heat_b8 > 0.3)) else _S.index_value(_n_C,6)) if _S.truth(_n_ring_b7) else (_S.index_value(_n_C,6) if _S.truth((_n_heat_b8 > 0.55)) else (_S.index_value(_n_C,5) if _S.truth((_n_heat_b8 > 0.25)) else (_S.index_value(_n_C,3) if _S.truth((_n_r_b6 > 0.8)) else _S.index_value(_n_C,4)))))),"=")
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_since = _S.read(_parent,"since")
	var _n_PY = _S.read(_parent,"PY")
	var _n_HIGH = _S.read(_parent,"HIGH")
	var _n_RX = _S.read(_parent,"RX")
	var _n_IN = _S.read(_parent,"IN")
	var _n_RY = _S.read(_parent,"RY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	var _n_near_b3 = _S.arg(_args,3)
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < 4)):
			var _n_k_b5 = (float(_S.call_value(_n_since,[_n_t_b1, ((float(_n_i_b4)/4) * _n_D), _n_D]))/1.25)
			if _S.truth((_n_k_b5 >= 1)):
				_n_i_b4 += 1.0
				continue
			var _n_y_b6 = _S.numeric_lerp(_n_PY,(_n_HIGH + 12),pow(_n_k_b5,0.85))
			var _n_rx_b7 = ((_n_RX * _n_IN) * (1 + (0.08 * _n_k_b5)))
			var _n_ry_b8 = (_n_rx_b7 * (float(_n_RY)/_n_RX))
			var _n_c_b9 = (_n_WHITE if _S.truth((_n_k_b5 < 0.12)) else (_S.index_value(_n_C_b2,6) if _S.truth((_n_k_b5 < 0.4)) else (_S.index_value(_n_C_b2,5) if _S.truth((_n_k_b5 < 0.65)) else (_S.index_value(_n_C_b2,4) if _S.truth((_n_k_b5 < 0.85)) else _S.index_value(_n_C_b2,3)))))
			var _n_glint_b10 = (fmod(((_n_i_b4 * 0.37) + (_n_k_b5 * 1.5)),1) * _n_TAU)
			if true:
				var _n_j_b11 = 0
				var _n_n_b12 = ceili((_n_rx_b7 * 7))
				while _S.truth((_n_j_b11 < _n_n_b12)):
					var _n_g_b13 = ((float(_n_j_b11)/_n_n_b12) * _n_TAU)
					var _n_sg_b14 = sin(_n_g_b13)
					if _S.truth(_S.binary("!==",(_n_sg_b14 >= 0),_n_near_b3)):
						_n_j_b11 += 1.0
						continue
					var _n_x_b15 = (cos(_n_g_b13) * _n_rx_b7)
					var _n_yy_b16 = (_n_y_b6 + (_n_sg_b14 * _n_ry_b8))
					var _n_hot_b17 = (absf((fmod(((_n_g_b13 - _n_glint_b10) + (PI * 3)),_n_TAU) - PI)) < 0.25)
					if _S.truth((_S.binary("&",_n_j_b11,1) if _S.truth((_n_k_b5 > 0.85)) else (_n_k_b5 > 0.85))):
						_n_j_b11 += 1.0
						continue
					_S.invoke(_n_p_b0,"px",[_n_x_b15, _n_yy_b16, (_n_WHITE if _S.truth(((_n_k_b5 < 0.8) if _S.truth(_n_hot_b17) else _n_hot_b17)) else (_n_c_b9 if _S.truth(_n_near_b3) else (_S.index_value(_n_C_b2,5) if _S.truth((_n_k_b5 < 0.4)) else _S.index_value(_n_C_b2,3))))])
					if _S.truth((_n_k_b5 < 0.3)):
						_S.invoke(_n_p_b0,"px",[_n_x_b15, (_n_yy_b16 + 1), (_S.index_value(_n_C_b2,5) if _S.truth(_n_near_b3) else _S.index_value(_n_C_b2,3))])
					_n_j_b11 += 1.0
			if _S.truth(_n_near_b3):
				_S.invoke(_n_p_b0,"glow",[0, (_n_y_b6 + (_n_ry_b8 * 0.5)), (_n_rx_b7 + 8), _S.index_value(_n_C_b2,4), (0.22 * (1 - _n_k_b5))])
			_n_i_b4 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_pad = _S.read(_parent,"pad")
	var _n_RX = _S.read(_parent,"RX")
	var _n_IN = _S.read(_parent,"IN")
	var _n_HIGH = _S.read(_parent,"HIGH")
	var _n_PY = _S.read(_parent,"PY")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_lift = _S.read(_parent,"lift")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_H_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"metal"),6)
	var _n_ph_b5 = (float(_n_t_b1)/_n_D)
	_S.call_value(_n_pad,[_n_p_b0, _n_t_b1, _n_C_b3, _n_H_b4])
	var _n_W_b6 = (_n_RX * _n_IN)
	if true:
		var _n_y_b7 = _n_HIGH
		while _S.truth((_n_y_b7 < _n_PY)):
			var _n_v_b8 = (float((_n_y_b7 - _n_PY))/(_n_HIGH - _n_PY))
			var _n_fade_b9 = pow((1 - _n_v_b8),1.6)
			if true:
				var _n_x_b10 = floori((-_n_W_b6))
				while _S.truth((_n_x_b10 <= ceili(_n_W_b6))):
					var _n_q_b11 = (float(absf((_n_x_b10 + 0.5)))/_n_W_b6)
					if _S.truth((_n_q_b11 > 1)):
						_n_x_b10 += 1.0
						continue
					_S.invoke(_n_p_b0,"blend",[(_n_x_b10 + 0.5), (_n_y_b7 + 0.5), (_S.index_value(_n_C_b3,6) if _S.truth((_n_q_b11 > 0.9)) else _S.index_value(_n_C_b3,5)), (_n_fade_b9 * ((0.07 + (0.26 * pow(_n_q_b11,4))) + (0.12 * pow((1 - _n_v_b8),4))))])
					_n_x_b10 += 1.0
			_n_y_b7 += 1.0
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 30, (_S.named_value(_n_o_b2,"seed") + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"W":_n_W_b6,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f6")])
	_S.call_value(_n_lift,[_n_p_b0, _n_t_b1, _n_C_b3, false])
	if true:
		var _n_y_b12 = (_n_PY - 6)
		while _S.truth((_n_y_b12 > (_n_HIGH + 20))):
			_S.invoke(_n_p_b0,"glow",[0, _n_y_b12, (_n_W_b6 + 8), _S.index_value(_n_C_b3,4), (0.16 * (1 - (float((_n_y_b12 - _n_PY))/(_n_HIGH - _n_PY))))])
			_n_y_b12 -= 12
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.6, 1.1])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_PY = _S.read(_parent,"PY")
	var _n_HIGH = _S.read(_parent,"HIGH")
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_x_b4 = (_S.invoke(_n_r_b2,"range",[(-0.9), 0.9]) * _n_W)
	var _n_y_b5 = _S.numeric_lerp((_n_PY - 2),(_n_HIGH + 10),_n_k_b3)
	var _n_L_b6 = (3 + (7 * _n_k_b3))
	_S.invoke(_n_p,"line",[_n_x_b4, _n_y_b5, _n_x_b4, (_n_y_b5 + _n_L_b6), _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f7"), ((1 - _n_k_b3) * 1.2)])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 < 0.3)) else _S.index_value(_n_C,4))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_lift = _S.read(_parent,"lift")
	var _n_ghosts = _S.read(_parent,"ghosts")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_PY = _S.read(_parent,"PY")
	var _n_RX = _S.read(_parent,"RX")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_n_D)
	_S.call_value(_n_lift,[_n_p_b0, _n_t_b1, _n_C_b3, true])
	_S.invoke(_S.invoke(_S.call_value(_n_ghosts,[_n_o_b2, _n_C_b3]),"at",[_n_t_b1]),"draw",[_n_p_b0])
	var _n_k_b5 = (0.85 + (0.15 * sin(((_n_TAU * 2) * _n_ph_b4))))
	for _iter_0 in _S.array([((-_n_RX) * 0.6), 0, (_n_RX * 0.6)]):
		var _n_x_b6 = _iter_0
		_S.invoke(_n_p_b0,"glow",[_n_x_b6, _n_PY, 20, _S.index_value(_n_C_b3,4), (0.25 * _n_k_b5)])
	_S.invoke(_n_p_b0,"glow",[0, _n_PY, 10, _n_WHITE, (0.3 * _n_k_b5)])
	return null
