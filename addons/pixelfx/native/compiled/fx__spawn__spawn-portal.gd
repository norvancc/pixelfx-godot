@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/spawn-portal.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "radius", _S.function_value(_e, "_f0"))
	_S.define(_e, "hole", _S.function_value(_e, "_f1"))
	_S.define(_e, "lip", _S.function_value(_e, "_f3"))
	_S.define(_e, "create", _S.function_value(_e, "_f4"))
	_S.define(_e, "ring", _S.function_value(_e, "_f17"))
	_S.define(_e, "meta", _S.merge([{"name": "Spawn portal"}, {"desc": "A rift tears open on the floor and swirls, belches violet smoke and sparks, spits a fountain of wisps up out of itself, then twists shut with a pop."}, {"tags": ["spawn", "portal", "summon", "rift", "arcane", "smoke", "ground", "one-shot"]}, {"size": [208, 150]}, {"origin": [104, 122]}, {"duration": 3.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#12081f", "#2a0f4d", "#481b8c", "#7330d0", "#a35cff", "#cf9bff", "#f1dcff", "#ffffff"]}, {"width": 28}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "OPEN", 0.3)
	_S.define(_e, "BELCH", [0.52, 0.76])
	_S.define(_e, "BURST", 1)
	_S.define(_e, "SHUT", 1.9)
	_S.define(_e, "POP", 2.22)
	_S.define(_e, "SY", 0.34)
	_S.define(_e, "VOID", _S.call_value(_S.read(_e, "hex"), ["#06030b"]))
	_S.define(_e, "FUME", _S.call_value(_S.read(_e, "hex"), ["#3a3046"]))
	_S.define(_e, "STONE", _S.invoke(["#1a1424", "#2b2639", "#4a4263", "#6c6488", "#9a91b4"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), ["#5a5070"]))
	_S.define(_e, "spinAt", _S.function_value(_e, "_f19"))
	_S.define(_e, "lipAt", _S.function_value(_e, "_f20"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SHUT = _S.read(_parent,"SHUT")
	var _n_BURST = _S.read(_parent,"BURST")
	var _n_POP = _S.read(_parent,"POP")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_RX_b1 = _S.arg(_args,1)
	if _S.truth((_n_t_b0 < _n_OPEN)):
		return (_n_RX_b1 * _S.invoke(_n_ease,"outBack",[clampf((float(_n_t_b0)/_n_OPEN),0.0,1.0), 2.2]))
	if _S.truth((_n_t_b0 < _n_SHUT)):
		return (_n_RX_b1 * ((1 + (0.035 * sin((_n_t_b0 * 9)))) + (0.1 * exp((float((-pow(((_n_t_b0 - _n_BURST) - 0.05),2)))/0.006)))))
	var _n_k_b2 = clampf((float((_n_t_b0 - _n_SHUT))/(_n_POP - _n_SHUT)),0.0,1.0)
	return (_n_RX_b1 * ((1 + (0.1 * sin((((float(_n_k_b2)/0.35) * PI) * 0.5)))) if _S.truth((_n_k_b2 < 0.35)) else (1.1 * (1 - pow((float((_n_k_b2 - 0.35))/0.65),1.6)))))
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_SY = _S.read(_parent,"SY")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_lipAt = _S.read(_parent,"lipAt")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_rx_b2 = _S.arg(_args,2)
	var _n_spin_b3 = _S.arg(_args,3)
	var _n_heat_b4 = _S.arg(_args,4)
	var _n_wind_b5 = _S.coalesce(_S.arg(_args,5),func():return 2.3)
	if _S.truth((_n_rx_b2 < 1)):
		return null
	var _n_ry_b6 = (_n_rx_b2 * _n_SY)
	_S.invoke(_n_p_b0,"shade",[((-_n_rx_b2) - 2), ((-_n_ry_b6) - 2), (_n_rx_b2 + 2), (_n_ry_b6 + 2), _S.function_value(_S.capture(_parent,{"rx":_n_rx_b2,"ry":_n_ry_b6,"spin":_n_spin_b3,"C":_n_C_b1,"this":_this}),"_f2")])
	var _n_n_b7 = maxf(40,floori((_n_rx_b2 * 5)+0.5))
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < 3)):
			if true:
				var _n_j_b9 = 0
				while _S.truth((_n_j_b9 <= _n_n_b7)):
					var _n_q_b10 = (0.14 + (0.82 * (float(_n_j_b9)/_n_n_b7)))
					var _n_th_b11 = ((_n_spin_b3 + (float((_n_i_b8 * _n_TAU))/3)) - (_n_wind_b5 * log(_n_q_b10)))
					var _n_lip_b12 = _S.call_value(_n_lipAt,[_n_th_b11, _n_spin_b3])
					var _n_x_b13 = (((cos(_n_th_b11) * _n_q_b10) * _n_lip_b12) * _n_rx_b2)
					var _n_y_b14 = (((sin(_n_th_b11) * _n_q_b10) * _n_lip_b12) * _n_ry_b6)
					var _n_c_b15 = ((_n_WHITE if _S.truth((_n_heat_b4 > 1.1)) else _S.index_value(_n_C_b1,6)) if _S.truth((_n_q_b10 > 0.8)) else (_S.index_value(_n_C_b1,5) if _S.truth((_n_q_b10 > 0.55)) else (_S.index_value(_n_C_b1,4) if _S.truth((_n_q_b10 > 0.32)) else _S.index_value(_n_C_b1,3))))
					_S.invoke(_n_p_b0,"dot",[_n_x_b13, _n_y_b14, _n_c_b15, (1 if _S.truth((_n_q_b10 > 0.3)) else (float(_n_q_b10)/0.3))])
					if _S.truth((_S.binary("===",fmod(_n_j_b9,2),0) if _S.truth((_n_q_b10 > 0.4)) else (_n_q_b10 > 0.4))):
						var _n_t2_b16 = (_n_th_b11 - 0.32)
						var _n_x2_b17 = ((((cos(_n_t2_b16) * _n_q_b10) * 0.94) * _n_lip_b12) * _n_rx_b2)
						var _n_y2_b18 = ((((sin(_n_t2_b16) * _n_q_b10) * 0.94) * _n_lip_b12) * _n_ry_b6)
						_S.invoke(_n_p_b0,"dot",[_n_x2_b17, _n_y2_b18, (_S.index_value(_n_C_b1,4) if _S.truth((_n_q_b10 > 0.7)) else _S.index_value(_n_C_b1,3)), 0.85])
					_n_j_b9 += 1.0
			_n_i_b8 += 1.0
	_S.invoke(_n_p_b0,"glow",[0, 0, (_n_rx_b2 * 0.45), _S.index_value(_n_C_b1,3), (0.35 * _n_heat_b4)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_rx = _S.read(_parent,"rx")
	var _n_ry = _S.read(_parent,"ry")
	var _n_lipAt = _S.read(_parent,"lipAt")
	var _n_spin = _S.read(_parent,"spin")
	var _n_C = _S.read(_parent,"C")
	var _n_VOID = _S.read(_parent,"VOID")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float(_n_x_b0)/_n_rx)
	var _n_v_b4 = (float(_n_y_b1)/_n_ry)
	var _n_q_b5 = _S.Bridge.hypot([_n_u_b3, _n_v_b4])
	var _n_th_b6 = atan2(_n_v_b4,_n_u_b3)
	var _n_lip_b7 = _S.call_value(_n_lipAt,[_n_th_b6, _n_spin])
	if _S.truth((_n_q_b5 > _n_lip_b7)):
		return null
	var _n_w_b8 = (float(_n_q_b5)/_n_lip_b7)
	_S.set_prop(_n_out_b2,"c",((_S.index_value(_n_C,2) if _S.truth((_n_w_b8 > 0.86)) else _S.index_value(_n_C,1)) if _S.truth(((_n_w_b8 > 0.72) if _S.truth((_n_v_b4 < 0)) else (_n_v_b4 < 0))) else (_S.index_value(_n_C,0) if _S.truth((_n_w_b8 > 0.55)) else _n_VOID)),"=")
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_SY = _S.read(_parent,"SY")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_lipAt = _S.read(_parent,"lipAt")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_rx_b2 = _S.arg(_args,2)
	var _n_spin_b3 = _S.arg(_args,3)
	var _n_heat_b4 = _S.arg(_args,4)
	var _n_near_b5 = _S.arg(_args,5)
	if _S.truth((_n_rx_b2 < 1)):
		return null
	var _n_ry_b6 = (_n_rx_b2 * _n_SY)
	var _n_n_b7 = ceili((_n_rx_b2 * 7))
	if true:
		var _n_j_b8 = 0
		while _S.truth((_n_j_b8 < _n_n_b7)):
			var _n_th_b9 = ((float(_n_j_b8)/_n_n_b7) * _n_TAU)
			var _n_s_b10 = sin(_n_th_b9)
			if _S.truth(_S.binary("!==",(_n_s_b10 >= 0),_n_near_b5)):
				_n_j_b8 += 1.0
				continue
			var _n_l_b11 = _S.call_value(_n_lipAt,[_n_th_b9, _n_spin_b3])
			var _n_x_b12 = ((cos(_n_th_b9) * _n_rx_b2) * _n_l_b11)
			var _n_y_b13 = ((_n_s_b10 * _n_ry_b6) * _n_l_b11)
			var _n_f_b14 = _S.MathFX.noise(((_n_th_b9 * 9) + (_n_spin_b3 * 3)),13)
			_S.invoke(_n_p_b0,"dot",[(cos(_n_th_b9) * ((_n_rx_b2 * _n_l_b11) + 1.2)), (_n_s_b10 * ((_n_ry_b6 * _n_l_b11) + 1)), _S.index_value(_n_C_b1,1)])
			_S.invoke(_n_p_b0,"dot",[_n_x_b12, _n_y_b13, ((_n_WHITE if _S.truth(((_n_f_b14 > (-0.3)) if _S.truth((_n_f_b14 > (-0.3))) else (_n_heat_b4 > 1.1))) else _S.index_value(_n_C_b1,6)) if _S.truth(_n_near_b5) else (_S.index_value(_n_C_b1,6) if _S.truth((_n_f_b14 > 0.2)) else _S.index_value(_n_C_b1,5)))])
			if _S.truth(_S.binary("===",fmod(_n_j_b8,6),0)):
				_S.invoke(_n_p_b0,"glow",[_n_x_b12, _n_y_b13, 7, _S.index_value(_n_C_b1,5), ((0.3 if _S.truth(_n_near_b5) else 0.2) * minf(1.4,_n_heat_b4))])
			_n_j_b8 += 1.0
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "drawSwirl", _S.function_value(_e, "_f5"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "RX", _S.prop(_S.read(_e, "o"), "width"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f6"))
	_S.define(_e, "SM", [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 4), _S.read(_e, "FUME"), 0.4]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 3), _S.read(_e, "FUME"), 0.3]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 5), _S.read(_e, "FUME"), 0.55])])
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "rocks", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "swirl", [])
	_S.define(_e, "wisps", [])
	_S.define(_e, "rings", [])
	_S.define(_e, "done", _S.merge([]))
	_S.define(_e, "t", 0)
	_S.define(_e, "addSwirl", _S.function_value(_e, "_f7"))
	_S.define(_e, "pull", _S.function_value(_e, "_f8"))
	_S.define(_e, "puff", _S.function_value(_e, "_f9"))
	_S.define(_e, "sparks", _S.function_value(_e, "_f10"))
	_S.define(_e, "once", _S.function_value(_e, "_f11"))
	return _S.merge([{"update": _S.function_value(_e, "_f12")}, {"drawBack": _S.function_value(_e, "_f13")}, {"draw": _S.function_value(_e, "_f15")}])

static func _f5(_parent,_args:Array,_this=null):
	var _n_radius = _S.read(_parent,"radius")
	var _n_t = _S.read(_parent,"t")
	var _n_RX = _S.read(_parent,"RX")
	var _n_SY = _S.read(_parent,"SY")
	var _n_C = _S.read(_parent,"C")
	var _n_swirl = _S.read(_parent,"swirl")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_near_b1 = _S.arg(_args,1)
	var _n_rx_b2 = _S.call_value(_n_radius,[_n_t, _n_RX])
	for _iter_0 in _S.array(_n_swirl):
		var _n_s_b3 = _iter_0
		if true:
			var _n_j_b4 = 0
			while _S.truth((_n_j_b4 < 3)):
				var _n_a_b5 = (_S.named_value(_n_s_b3,"a") - ((_n_j_b4 * 0.08) * (float(1.4)/maxf(0.3,_S.named_value(_n_s_b3,"r")))))
				var _n_x_b6 = ((cos(_n_a_b5) * _S.named_value(_n_s_b3,"r")) * _n_rx_b2)
				var _n_y_b7 = (((sin(_n_a_b5) * _S.named_value(_n_s_b3,"r")) * _n_rx_b2) * _n_SY)
				if _S.truth(_S.binary("!==",(sin(_n_a_b5) >= 0),_n_near_b1)):
					_n_j_b4 += 1.0
					continue
				_S.invoke(_n_p_b0,"dot",[_n_x_b6, (_n_y_b7 - 0.5), (_S.index_value(_n_C,5) if _S.truth(_n_j_b4) else _S.named_value(_n_s_b3,"c")), ((0.9 - (_n_j_b4 * 0.3)) if _S.truth(_n_j_b4) else 1)])
				if _S.truth(not _S.truth(_n_j_b4)):
					_S.invoke(_n_p_b0,"glow",[_n_x_b6, _n_y_b7, 3, _S.index_value(_n_C,5), 0.35])
				_n_j_b4 += 1.0
	return null

static func _f6(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_swirl = _S.read(_parent,"swirl")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_r0_b0 = _S.arg(_args,0)
	return _S.invoke(_n_swirl,"push",[{"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"r":_n_r0_b0,"w":_S.invoke(_n_R,"range",[2.2, 4]),"in":_S.invoke(_n_R,"range",[0.3, 0.7]),"c":_S.invoke(_n_R,"pick",[[_n_WHITE, _S.index_value(_n_C,6), _S.index_value(_n_C,6), _S.index_value(_n_C,5)]])}])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_a_b0 = _S.invoke(_n_R,"range",[(PI * 1.03), (PI * 1.97)])
	var _n_D_b1 = _S.invoke(_n_R,"range",[40, 86])
	var _n_T_b2 = _S.invoke(_n_R,"range",[0.24, 0.42])
	var _n_x_b3 = ((cos(_n_a_b0) * _n_D_b1) * 1.08)
	var _n_y_b4 = ((sin(_n_a_b0) * _n_D_b1) * 0.85)
	var _n_l_b5 = _S.Bridge.hypot([_n_x_b3, _n_y_b4])
	var _n_v_b6 = (float((0.6 * _n_l_b5))/(1 - exp(((-0.6) * _n_T_b2))))
	_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"MOTE"), _n_x_b3, _n_y_b4, ((float((-_n_x_b3))/_n_l_b5) * _n_v_b6), ((float((-_n_y_b4))/_n_l_b5) * _n_v_b6), _n_T_b2, _S.invoke(_n_R,"pick",[[_n_WHITE, _S.index_value(_n_C,6), _S.index_value(_n_C,5), _S.index_value(_n_C,5), _S.index_value(_n_C,4)]]), _S.invoke(_n_R,"range",[1, 1.7])])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RX = _S.read(_parent,"RX")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_SY = _S.read(_parent,"SY")
	var _n_SM = _S.read(_parent,"SM")
	var _n_PF = _S.read(_parent,"PF")
	var _n_n_b0 = _S.arg(_args,0)
	var _n_big_b1 = _S.arg(_args,1)
	var _n_sp_b2 = _S.arg(_args,2)
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < _n_n_b0)):
			var _n_a_b4 = _S.invoke(_n_R,"range",[0, _n_TAU])
			var _n_d_b5 = (_S.invoke(_n_R,"range",[0, 0.55]) * _n_RX)
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SMOKE"), (cos(_n_a_b4) * _n_d_b5), (((sin(_n_a_b4) * _n_d_b5) * _n_SY) - 2), ((_S.invoke(_n_R,"range",[(-1), 1]) * _n_sp_b2) * 0.6), ((-_S.invoke(_n_R,"range",[0.4, 1])) * _n_sp_b2), (_S.invoke(_n_R,"range",[1.2, 2.2]) * (1.15 if _S.truth(_n_big_b1) else 0.8)), _S.invoke(_n_R,"pick",[_n_SM]), (_S.invoke(_n_R,"range",[2.8, 4.6]) * (1.15 if _S.truth(_n_big_b1) else 0.9)), (_S.invoke(_n_R,"range",[0, 0.3]) if _S.truth(_n_big_b1) else _S.invoke(_n_R,"range",[0, 0.1])), (_S.named_value(_n_PF,"BIG") if _S.truth(_n_big_b1) else 0)])
			_n_i_b3 += 1.0
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_RX = _S.read(_parent,"RX")
	var _n_n_b0 = _S.arg(_args,0)
	var _n_up_b1 = _S.arg(_args,1)
	var _n_spread_b2 = _S.arg(_args,2)
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < _n_n_b0)):
			var _n_a_b4 = ((float((-PI))/2) + _S.invoke(_n_R,"range",[(-_n_spread_b2), _n_spread_b2]))
			var _n_sp_b5 = (_S.invoke(_n_R,"range",[0.5, 1]) * _n_up_b1)
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SPARK"), (_S.invoke(_n_R,"range",[(-0.5), 0.5]) * _n_RX), (-1), (cos(_n_a_b4) * _n_sp_b5), (sin(_n_a_b4) * _n_sp_b5), _S.invoke(_n_R,"range",[0.35, 0.8])])
			_n_i_b3 += 1.0
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_done = _S.read(_parent,"done")
	var _n_t = _S.read(_parent,"t")
	var _n_k_b0 = _S.arg(_args,0)
	var _n_at_b1 = _S.arg(_args,1)
	return (_S.set_prop(_n_done,_n_k_b0,true,"=") if _S.truth(((_n_t >= _n_at_b1) if _S.truth(not _S.truth(_S.index_value(_n_done,_n_k_b0))) else not _S.truth(_S.index_value(_n_done,_n_k_b0)))) else ((_n_t >= _n_at_b1) if _S.truth(not _S.truth(_S.index_value(_n_done,_n_k_b0))) else not _S.truth(_S.index_value(_n_done,_n_k_b0))))
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "shutting", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "SHUT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))))
	if _S.truth(_S.logical("&&", _S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OPEN"), 0.15)), func(): return _S.read(_e, "shutting")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.55]))):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "s", _S.invoke(_S.read(_v15, "R"), "sign", []))
		_S.define(_v15, "D", _S.invoke(_S.read(_v15, "R"), "range", [_S.binary("*", _S.read(_v15, "RX"), 1.3), _S.binary("*", _S.read(_v15, "RX"), 2.4)]))
		_S.define(_v15, "T", _S.invoke(_S.read(_v15, "R"), "range", [0.18, 0.3]))
		_S.define(_v15, "v", _S.binary("/", _S.binary("*", _S.read(_v15, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v15, "Math"), "exp", [_S.binary("*", 3, _S.read(_v15, "T"))]), 1)))
		_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "STREAK"), _S.binary("*", _S.read(_v15, "s"), _S.read(_v15, "D")), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [0, 3])), _S.binary("*", _S.unary("-", _S.read(_v15, "s")), _S.read(_v15, "v")), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 2), 2]), _S.read(_v15, "T"), (_S.prop(_S.read(_v15, "C"), 6) if _S.truth(_S.invoke(_S.read(_v15, "R"), "chance", [0.5])) else _S.prop(_S.read(_v15, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.1), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "POP"), 0.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [(0.85 if _S.truth(_S.read(_e, "shutting")) else (0.55 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "BURST"))) else 0.1))]))):
		_S.call_value(_S.read(_e, "pull"), [])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP")), func(): return _S.binary(">", _S.read(_e, "t"), 0.12)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [(0.5 if _S.truth(_S.read(_e, "shutting")) else 0.25)]))):
		_S.call_value(_S.read(_e, "addSwirl"), [_S.invoke(_S.read(_e, "R"), "range", [1.1, 1.5])])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["open", _S.binary("*", _S.read(_e, "OPEN"), 0.7)])):
		var _v16 = _S.scope(_e)
		_S.invoke(_S.read(_v16, "lights"), "add", [0, _S.unary("-", 8), 50, _S.prop(_S.read(_v16, "C"), 4), 0.75, 0.45])
		_S.invoke(_S.read(_v16, "rings"), "push", [_S.merge([{"t0": _S.read(_v16, "t")}, {"life": 0.42}, {"r0": _S.binary("*", _S.read(_v16, "RX"), 0.8)}, {"r1": _S.binary("*", _S.read(_v16, "RX"), 1.9)}, {"th": 2.5}, {"hot": true}])])
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "i"), 8)):
			_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "DUST"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v17, "R"), "sign", []), _S.invoke(_S.read(_v17, "R"), "range", [0.7, 1.1])), _S.read(_v17, "RX")), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v17, "R"), "sign", []), _S.invoke(_S.read(_v17, "R"), "range", [10, 45])), _S.unary("-", _S.invoke(_S.read(_v17, "R"), "range", [4, 14])), _S.invoke(_S.read(_v17, "R"), "range", [0.4, 0.7]), _S.read(_v17, "DUST"), _S.invoke(_S.read(_v17, "R"), "range", [1.5, 3])])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "+=", true)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["b0", _S.prop(_S.read(_e, "BELCH"), 0)])):
		_S.last([_S.call_value(_S.read(_e, "puff"), [6, false, 34]), _S.call_value(_S.read(_e, "sparks"), [8, 210, 0.55]), _S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 6), 44, _S.prop(_S.read(_e, "C"), 4), 0.6, 0.3])])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["b1", _S.prop(_S.read(_e, "BELCH"), 1)])):
		_S.last([_S.call_value(_S.read(_e, "puff"), [8, false, 40]), _S.call_value(_S.read(_e, "sparks"), [12, 240, 0.6]), _S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 6), 48, _S.prop(_S.read(_e, "C"), 4), 0.65, 0.3])])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["burst", _S.read(_e, "BURST")])):
		var _v18 = _S.scope(_e)
		_S.invoke(_S.read(_v18, "lights"), "add", [0, _S.unary("-", 26), 74, _S.prop(_S.read(_v18, "C"), 4), 1, 0.75])
		_S.invoke(_S.read(_v18, "lights"), "add", [0, _S.unary("-", 10), 40, _S.read(_v18, "WHITE"), 0.85, 0.14])
		_S.invoke(_S.read(_v18, "rings"), "push", [_S.merge([{"t0": _S.read(_v18, "t")}, {"life": 0.55}, {"r0": _S.binary("*", _S.read(_v18, "RX"), 1)}, {"r1": _S.binary("*", _S.read(_v18, "RX"), 2.5)}, {"th": 3.5}, {"hot": true}]), _S.merge([{"t0": _S.binary("+", _S.read(_v18, "t"), 0.06)}, {"life": 0.45}, {"r0": _S.binary("*", _S.read(_v18, "RX"), 0.8)}, {"r1": _S.binary("*", _S.read(_v18, "RX"), 1.8)}, {"th": 2}, {"hot": false}])])
		_S.call_value(_S.read(_v18, "puff"), [18, true, 70])
		_S.call_value(_S.read(_v18, "sparks"), [34, 400, 0.8])
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), 5)):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "a", _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v20, "Math"), "PI")), 2), _S.binary("*", _S.binary("-", _S.read(_v20, "i"), 2), 0.27)), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 0.08), 0.08])))
			_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [185, 235]))
			_S.invoke(_S.read(_v20, "wisps"), "push", [_S.merge([{"x": _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 4), 4])}, {"y": _S.unary("-", 2)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp"))}, {"life": _S.invoke(_S.read(_v20, "R"), "range", [0.75, 1])}, {"max": 1}, {"tr": []}, {"acc": 0}, {"ph": _S.invoke(_S.read(_v20, "R"), "range", [0, _S.read(_v20, "TAU")])}])])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 1, "+=", true)
		var _v21 = _S.scope(_v18)
		_S.define(_v21, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v21, "i"), 12)):
			_S.invoke(_S.read(_v21, "rocks"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v21, "B"), "CHUNK")}, {"x": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v21, "R"), "sign", []), _S.invoke(_S.read(_v21, "R"), "range", [0.75, 1.05])), _S.read(_v21, "RX"))}, {"y": _S.unary("-", 1)}, {"vx": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 100), 100])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [150, 280]))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v21, "R"), "range", [1.3, 1.9])}, {"a": _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "TAU")])}, {"va": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.invoke(_S.read(_v21, "R"), "range", [1, 2.4])}, {"ramp": _S.read(_v21, "STONE")}])])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "i", 1, "+=", true)
		var _v22 = _S.scope(_v18)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 14)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_v22, "RX")), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [4, 34])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [10, 60])), _S.invoke(_S.read(_v22, "R"), "range", [0.5, 1.1]), _S.invoke(_S.read(_v22, "R"), "pick", [[_S.read(_v22, "WHITE"), _S.prop(_S.read(_v22, "C"), 6), _S.prop(_S.read(_v22, "C"), 5)]]), _S.invoke(_S.read(_v22, "R"), "range", [0.8, 2])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "OPEN")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SHUT"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.16]))):
		_S.call_value(_S.read(_e, "puff"), [1, false, 22])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "OPEN")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SHUT"), 0.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.06]))):
		_S.call_value(_S.read(_e, "sparks"), [1, 160, 0.4])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["pop", _S.read(_e, "POP")])):
		var _v23 = _S.scope(_e)
		_S.invoke(_S.read(_v23, "lights"), "add", [0, _S.unary("-", 4), 50, _S.prop(_S.read(_v23, "C"), 4), 0.95, 0.5])
		_S.invoke(_S.read(_v23, "lights"), "add", [0, _S.unary("-", 2), 28, _S.read(_v23, "WHITE"), 0.9, 0.12])
		_S.invoke(_S.read(_v23, "rings"), "push", [_S.merge([{"t0": _S.read(_v23, "t")}, {"life": 0.35}, {"r0": 2}, {"r1": _S.binary("*", _S.read(_v23, "RX"), 1.9)}, {"th": 2.5}, {"hot": true}])])
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v24, "i"), 18)):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "a", _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v25, "Math"), "PI")), 0]))
			_S.define(_v25, "sp", _S.invoke(_S.read(_v25, "R"), "range", [90, 270]))
			_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "SPARK"), 0, _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.read(_v25, "a")]), _S.read(_v25, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.read(_v25, "a")]), _S.read(_v25, "sp")), 0.8), _S.invoke(_S.read(_v25, "R"), "range", [0.25, 0.6])])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "i", 1, "+=", true)
		var _v26 = _S.scope(_v23)
		_S.define(_v26, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), 9)):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "a", _S.invoke(_S.read(_v27, "R"), "range", [0, _S.read(_v27, "TAU")]))
			_S.define(_v27, "sp", _S.invoke(_S.read(_v27, "R"), "range", [30, 95]))
			_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "STAR"), 0, _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.read(_v27, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.read(_v27, "sp")), 0.5), 20), _S.invoke(_S.read(_v27, "R"), "range", [0.4, 0.9]), _S.invoke(_S.read(_v27, "R"), "pick", [[_S.read(_v27, "WHITE"), _S.prop(_S.read(_v27, "C"), 6)]]), _S.invoke(_S.read(_v27, "R"), "range", [0.8, 1.8])])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
		var _v28 = _S.scope(_v23)
		_S.define(_v28, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v28, "i"), 6)):
			_S.invoke(_S.read(_v28, "ps"), "spawn", [_S.prop(_S.read(_v28, "P"), "SMOKE"), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v28, "R"), "range", [1, 4])), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 34), 34]), _S.unary("-", _S.invoke(_S.read(_v28, "R"), "range", [10, 30])), _S.invoke(_S.read(_v28, "R"), "range", [0.8, 1.3]), _S.prop(_S.read(_v28, "SM"), 2), _S.invoke(_S.read(_v28, "R"), "range", [2.5, 4.5])])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "i", 1, "+=", true)
		var _v29 = _S.scope(_v23)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 14)):
			_S.invoke(_S.read(_v29, "ps"), "spawn", [_S.prop(_S.read(_v29, "P"), "STAR"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 1), 1]), _S.read(_v29, "RX")), 0.9), _S.unary("-", _S.invoke(_S.read(_v29, "R"), "range", [0.5, 2])), _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v29, "R"), "range", [0, 4])), _S.invoke(_S.read(_v29, "R"), "range", [0.6, 1.4]), _S.invoke(_S.read(_v29, "R"), "pick", [[_S.prop(_S.read(_v29, "C"), 6), _S.prop(_S.read(_v29, "C"), 5), _S.prop(_S.read(_v29, "C"), 5)]]), _S.invoke(_S.read(_v29, "R"), "range", [0.4, 0.9]), _S.invoke(_S.read(_v29, "R"), "range", [0, 0.25])])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
	var _v30 = _S.scope(_e)
	_S.define(_v30, "i", _S.binary("-", _S.prop(_S.read(_v30, "swirl"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v30, "i"), 0)):
		var _v31 = _S.scope(_v30)
		_S.define(_v31, "s", _S.prop(_S.read(_v31, "swirl"), _S.read(_v31, "i")))
		_S.define(_v31, "k", (2.4 if _S.truth(_S.read(_v31, "shutting")) else 1))
		_S.set_prop(_S.read(_v31, "s"), "a", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v31, "s"), "w"), _S.read(_v31, "k")), _S.read(_v31, "dt")), _S.binary("/", 1.4, _S.invoke(_S.read(_v31, "Math"), "max", [0.3, _S.prop(_S.read(_v31, "s"), "r")]))), "+=", false)
		_S.set_prop(_S.read(_v31, "s"), "r", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v31, "s"), "in"), _S.read(_v31, "k")), _S.read(_v31, "dt")), "-=", false)
		if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v31, "s"), "r"), 0.25), func(): return _S.binary(">", _S.read(_v31, "t"), _S.read(_v31, "POP")))):
			_S.invoke(_S.read(_v31, "swirl"), "splice", [_S.read(_v31, "i"), 1])
		_v30 = _S.iteration(_v30)
		_S.write(_v30, "i", 1, "-=", true)
	var _v32 = _S.scope(_e)
	_S.define(_v32, "i", _S.binary("-", _S.prop(_S.read(_v32, "wisps"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v32, "i"), 0)):
		var _v33 = _S.scope(_v32)
		_S.define(_v33, "w", _S.prop(_S.read(_v33, "wisps"), _S.read(_v33, "i")))
		_S.invoke(_S.prop(_S.read(_v33, "w"), "tr"), "unshift", [[_S.prop(_S.read(_v33, "w"), "x"), _S.prop(_S.read(_v33, "w"), "y")]])
		if _S.truth(_S.binary(">", _S.prop(_S.prop(_S.read(_v33, "w"), "tr"), "length"), 12)):
			_S.invoke(_S.prop(_S.read(_v33, "w"), "tr"), "pop", [])
		if _S.truth(_S.logical("||", _S.binary("<=", _S.set_prop(_S.read(_v33, "w"), "life", _S.read(_v33, "dt"), "-=", false), 0), func(): return _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v33, "w"), "vy"), 0), func(): return _S.binary(">", _S.prop(_S.read(_v33, "w"), "y"), _S.unary("-", 2))))):
			var _v34 = _S.scope(_v33)
			var _v35 = _S.scope(_v34)
			_S.define(_v35, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v35, "j"), 8)):
				var _v36 = _S.scope(_v35)
				_S.define(_v36, "a", _S.invoke(_S.read(_v36, "R"), "range", [0, _S.read(_v36, "TAU")]))
				_S.define(_v36, "sp", _S.invoke(_S.read(_v36, "R"), "range", [30, 120]))
				_S.invoke(_S.read(_v36, "ps"), "spawn", [_S.prop(_S.read(_v36, "P"), "SPARK"), _S.prop(_S.read(_v36, "w"), "x"), _S.prop(_S.read(_v36, "w"), "y"), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v36, "Math"), "cos", [_S.read(_v36, "a")]), _S.read(_v36, "sp")), _S.binary("*", _S.prop(_S.read(_v36, "w"), "vx"), 0.2)), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v36, "Math"), "sin", [_S.read(_v36, "a")]), _S.read(_v36, "sp")), _S.binary("*", _S.prop(_S.read(_v36, "w"), "vy"), 0.2)), _S.invoke(_S.read(_v36, "R"), "range", [0.2, 0.5])])
				_v35 = _S.iteration(_v35)
				_S.write(_v35, "j", 1, "+=", true)
			_S.invoke(_S.read(_v34, "ps"), "spawn", [_S.prop(_S.read(_v34, "P"), "STAR"), _S.prop(_S.read(_v34, "w"), "x"), _S.prop(_S.read(_v34, "w"), "y"), 0, _S.unary("-", 6), 0.45, _S.read(_v34, "WHITE"), 2.4])
			_S.invoke(_S.read(_v34, "lights"), "add", [_S.prop(_S.read(_v34, "w"), "x"), _S.prop(_S.read(_v34, "w"), "y"), 24, _S.prop(_S.read(_v34, "C"), 5), 0.65, 0.25])
			_S.invoke(_S.read(_v34, "wisps"), "splice", [_S.read(_v34, "i"), 1])
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v33, "w"), "vy", _S.binary("*", 360, _S.read(_v33, "dt")), "+=", false)
		_S.set_prop(_S.read(_v33, "w"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("-", _S.prop(_S.read(_v33, "w"), "max"), _S.prop(_S.read(_v33, "w"), "life")), 16), _S.prop(_S.read(_v33, "w"), "ph"))]), 160), _S.read(_v33, "dt")), "+=", false)
		_S.set_prop(_S.read(_v33, "w"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v33, "w"), "vx"), 1.1), _S.read(_v33, "dt")), "-=", false)
		_S.set_prop(_S.read(_v33, "w"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v33, "w"), "vy"), 1.1), _S.read(_v33, "dt")), "-=", false)
		_S.set_prop(_S.read(_v33, "w"), "x", _S.binary("*", _S.prop(_S.read(_v33, "w"), "vx"), _S.read(_v33, "dt")), "+=", false)
		_S.set_prop(_S.read(_v33, "w"), "y", _S.binary("*", _S.prop(_S.read(_v33, "w"), "vy"), _S.read(_v33, "dt")), "+=", false)
		var _v37 = _S.scope(_v33)
		_S.set_prop(_S.read(_v37, "w"), "acc", _S.read(_v37, "dt"), "+=", false)
		while _S.truth(_S.binary(">", _S.prop(_S.read(_v37, "w"), "acc"), 0.03)):
			_S.invoke(_S.read(_v37, "ps"), "spawn", [_S.prop(_S.read(_v37, "P"), "SMOKE"), _S.prop(_S.read(_v37, "w"), "x"), _S.prop(_S.read(_v37, "w"), "y"), _S.binary("*", _S.prop(_S.read(_v37, "w"), "vx"), 0.05), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v37, "w"), "vy"), 0.05), 4), _S.invoke(_S.read(_v37, "R"), "range", [0.6, 1]), _S.prop(_S.read(_v37, "SM"), 0), _S.invoke(_S.read(_v37, "R"), "range", [1.5, 2.4])])
			_v37 = _S.iteration(_v37)
			_S.set_prop(_S.read(_v37, "w"), "acc", 0.03, "-=", false)
		if _S.truth(_S.invoke(_S.read(_v33, "R"), "chance", [0.3])):
			_S.invoke(_S.read(_v33, "ps"), "spawn", [_S.prop(_S.read(_v33, "P"), "MOTE"), _S.prop(_S.read(_v33, "w"), "x"), _S.prop(_S.read(_v33, "w"), "y"), _S.binary("+", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v33, "w"), "vx")), 0.2), _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 15), 15])), _S.binary("+", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v33, "w"), "vy")), 0.2), _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 15), 15])), _S.invoke(_S.read(_v33, "R"), "range", [0.2, 0.4]), _S.prop(_S.read(_v33, "C"), 6), 0.6])
		_v32 = _S.iteration(_v32)
		_S.write(_v32, "i", 1, "-=", true)
	var _v38 = _S.scope(_e)
	_S.define(_v38, "i", _S.binary("-", _S.prop(_S.read(_v38, "rings"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v38, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v38, "t"), _S.prop(_S.prop(_S.read(_v38, "rings"), _S.read(_v38, "i")), "t0")), _S.prop(_S.prop(_S.read(_v38, "rings"), _S.read(_v38, "i")), "life"))):
			_S.invoke(_S.read(_v38, "rings"), "splice", [_S.read(_v38, "i"), 1])
		_v38 = _S.iteration(_v38)
		_S.write(_v38, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "rocks"), "update", [_S.read(_e, "dt")])
	for _v39 in _S.array(_S.prop(_S.read(_e, "rocks"), "list")):
		var _v40 = _S.scope(_e)
		_S.define(_v40, "b", _v39)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v40, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v40, "b"), "dusted")))):
			var _v41 = _S.scope(_v40)
			_S.set_prop(_S.read(_v41, "b"), "dusted", true, "=", false)
			var _v42 = _S.scope(_v41)
			_S.define(_v42, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v42, "i"), 2)):
				_S.invoke(_S.read(_v42, "ps"), "spawn", [_S.prop(_S.read(_v42, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v42, "b"), "x"), _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v42, "R"), "sign", []), _S.invoke(_S.read(_v42, "R"), "range", [6, 30])), _S.unary("-", _S.invoke(_S.read(_v42, "R"), "range", [2, 12])), _S.invoke(_S.read(_v42, "R"), "range", [0.3, 0.6]), _S.read(_v42, "DUST"), _S.invoke(_S.read(_v42, "R"), "range", [1.2, 2.4])])
				_v42 = _S.iteration(_v42)
				_S.write(_v42, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_radius = _S.read(_parent,"radius")
	var _n_t = _S.read(_parent,"t")
	var _n_RX = _S.read(_parent,"RX")
	var _n_spinAt = _S.read(_parent,"spinAt")
	var _n_BURST = _S.read(_parent,"BURST")
	var _n_POP = _S.read(_parent,"POP")
	var _n_C = _S.read(_parent,"C")
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_ease = _S.read(_parent,"ease")
	var _n_hole = _S.read(_parent,"hole")
	var _n_SHUT = _S.read(_parent,"SHUT")
	var _n_lip = _S.read(_parent,"lip")
	var _n_ring = _S.read(_parent,"ring")
	var _n_rings = _S.read(_parent,"rings")
	var _n_drawSwirl = _S.read(_parent,"drawSwirl")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_rx_b1 = _S.call_value(_n_radius,[_n_t, _n_RX])
	var _n_spin_b2 = _S.call_value(_n_spinAt,[_n_t])
	var _n_heat_b3 = ((0.85 + (0.15 * sin((_n_t * 7)))) + (0.6 * exp((float((-pow((_n_t - _n_BURST),2)))/0.01))))
	if _S.truth((_n_t < _n_POP)):
		_S.invoke(_n_p_b0,"glow",[0, (-4), ((_n_rx_b1 * 1.8) + 10), _S.index_value(_n_C,4), (0.32 * clampf((float(_n_rx_b1)/_n_RX),0.0,1.0))])
		_S.invoke(_n_p_b0,"glowLine",[0, (-2), 0, (-44), ((_n_rx_b1 * 0.7) + 6), _S.index_value(_n_C,4), (0.16 * clampf((float(_n_rx_b1)/_n_RX),0.0,1.0))])
	if _S.truth((_n_t < (_n_OPEN * 0.6))):
		var _n_k_b4 = (float(_n_t)/(_n_OPEN * 0.6))
		var _n_L_b5 = ((_n_RX * 1.1) * _S.invoke(_n_ease,"outCubic",[_n_k_b4]))
		_S.invoke(_n_p_b0,"line",[(-_n_L_b5), 0, _n_L_b5, 0, _S.function_value(_S.capture(_parent,{"this":_this}),"_f14")])
		_S.invoke(_n_p_b0,"glowLine",[(-_n_L_b5), 0, _n_L_b5, 0, 7, _S.index_value(_n_C,5), 0.6])
	if _S.truth(((_n_t < _n_POP) if _S.truth((_n_t > (_n_OPEN * 0.35))) else (_n_t > (_n_OPEN * 0.35)))):
		_S.call_value(_n_hole,[_n_p_b0, _n_C, _n_rx_b1, _n_spin_b2, (_n_heat_b3 + (0.4 * _S.MathFX.smooth(_n_SHUT,_n_POP,_n_t))), (2.3 + (2.6 * _S.MathFX.smooth(_n_SHUT,(_n_POP - 0.05),_n_t)))])
		_S.call_value(_n_lip,[_n_p_b0, _n_C, _n_rx_b1, _n_spin_b2, _n_heat_b3, false])
	for _iter_0 in _S.array(_n_rings):
		var _n_r_b6 = _iter_0
		_S.call_value(_n_ring,[_n_p_b0, _n_C, _n_r_b6, _n_t, false])
	_S.call_value(_n_drawSwirl,[_n_p_b0, false])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((absf((_n_u_b0 - 0.5)) < 0.3)) else _S.index_value(_n_C,6))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_radius = _S.read(_parent,"radius")
	var _n_t = _S.read(_parent,"t")
	var _n_RX = _S.read(_parent,"RX")
	var _n_spinAt = _S.read(_parent,"spinAt")
	var _n_BURST = _S.read(_parent,"BURST")
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_POP = _S.read(_parent,"POP")
	var _n_lip = _S.read(_parent,"lip")
	var _n_C = _S.read(_parent,"C")
	var _n_ring = _S.read(_parent,"ring")
	var _n_rings = _S.read(_parent,"rings")
	var _n_drawSwirl = _S.read(_parent,"drawSwirl")
	var _n_ease = _S.read(_parent,"ease")
	var _n_flare = _S.read(_parent,"flare")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_rocks = _S.read(_parent,"rocks")
	var _n_wisps = _S.read(_parent,"wisps")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_rx_b1 = _S.call_value(_n_radius,[_n_t, _n_RX])
	var _n_spin_b2 = _S.call_value(_n_spinAt,[_n_t])
	var _n_heat_b3 = ((0.85 + (0.15 * sin((_n_t * 7)))) + (0.6 * exp((float((-pow((_n_t - _n_BURST),2)))/0.01))))
	if _S.truth(((_n_t < _n_POP) if _S.truth((_n_t > (_n_OPEN * 0.35))) else (_n_t > (_n_OPEN * 0.35)))):
		_S.call_value(_n_lip,[_n_p_b0, _n_C, _n_rx_b1, _n_spin_b2, _n_heat_b3, true])
	for _iter_0 in _S.array(_n_rings):
		var _n_r_b6 = _iter_0
		_S.call_value(_n_ring,[_n_p_b0, _n_C, _n_r_b6, _n_t, true])
	_S.call_value(_n_drawSwirl,[_n_p_b0, true])
	var _n_b_b4 = (_n_t - _n_BURST)
	if _S.truth(((_n_b_b4 < 0.45) if _S.truth((_n_b_b4 > 0)) else (_n_b_b4 > 0))):
		var _n_k_b7 = (float(_n_b_b4)/0.45)
		var _n_top_b8 = ((-84) * _S.invoke(_n_ease,"outExpo",[clampf((float(_n_b_b4)/0.14),0.0,1.0)]))
		var _n_bot_b9 = ((-1) - (60 * _S.invoke(_n_ease,"inQuad",[_n_k_b7])))
		var _n_w0_b10 = ((_n_RX * 0.55) * (1 - (_n_k_b7 * 0.8)))
		_S.invoke(_n_p_b0,"shade",[((-_n_w0_b10) - 1), _n_top_b8, (_n_w0_b10 + 1), _n_bot_b9, _S.function_value(_S.capture(_parent,{"bot":_n_bot_b9,"top":_n_top_b8,"w0":_n_w0_b10,"this":_this}),"_f16")])
		_S.invoke(_n_p_b0,"glowLine",[0, _n_bot_b9, 0, _n_top_b8, (_n_w0_b10 + 12), _S.index_value(_n_C,5), (0.55 * (1 - _n_k_b7))])
		if _S.truth((_n_b_b4 < 0.14)):
			_S.call_value(_n_flare,[_n_p_b0, 0, (-4), (36 * (1 - (float(_n_b_b4)/0.14))), (1 - (float(_n_b_b4)/0.14)), _n_C])
	var _n_q_b5 = (_n_t - _n_POP)
	if _S.truth(((_n_q_b5 < 0.25) if _S.truth((_n_q_b5 > (-0.08))) else (_n_q_b5 > (-0.08)))):
		_S.call_value(_n_sparkle,[_n_p_b0, 0, (-1), floori(((4 if _S.truth((_n_q_b5 < 0)) else 12) * (1 - clampf((float(_n_q_b5)/0.25),0.0,1.0)))+0.5), _n_WHITE, _S.index_value(_n_C,5), (0.7 * (1 - clampf((float(_n_q_b5)/0.25),0.0,1.0)))])
	_S.invoke(_n_rocks,"draw",[_n_p_b0])
	for _iter_1 in _S.array(_n_wisps):
		var _n_w_b11 = _iter_1
		var _n_k_b12 = (float(_S.named_value(_n_w_b11,"life"))/_S.named_value(_n_w_b11,"max"))
		if true:
			var _n_i_b13 = 1
			while _S.truth((_n_i_b13 < _S.prop(_S.named_value(_n_w_b11,"tr"),"length"))):
				var _tuple_2 = _S.index_value(_S.named_value(_n_w_b11,"tr"),(_n_i_b13 - 1))
				var _n_x0_b14 = _S.prop(_tuple_2,0)
				var _n_y0_b15 = _S.prop(_tuple_2,1)
				var _tuple_3 = _S.index_value(_S.named_value(_n_w_b11,"tr"),_n_i_b13)
				var _n_x1_b16 = _S.prop(_tuple_3,0)
				var _n_y1_b17 = _S.prop(_tuple_3,1)
				var _n_u_b18 = (float(_n_i_b13)/_S.prop(_S.named_value(_n_w_b11,"tr"),"length"))
				_S.invoke(_n_p_b0,"line",[_n_x0_b14, _n_y0_b15, _n_x1_b16, _n_y1_b17, (_n_WHITE if _S.truth((_n_u_b18 < 0.25)) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b18 < 0.55)) else _S.index_value(_n_C,4))), (1.15 - _n_u_b18)])
				if _S.truth((_n_u_b18 < 0.35)):
					_S.invoke(_n_p_b0,"line",[(_n_x0_b14 + 1), _n_y0_b15, (_n_x1_b16 + 1), _n_y1_b17, _S.index_value(_n_C,5), 1])
				_n_i_b13 += 1.0
		_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_w_b11,"x"), _S.named_value(_n_w_b11,"y"), 2, _S.index_value(_n_C,5)])
		_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_w_b11,"x"), _S.named_value(_n_w_b11,"y"), 1.2, _S.index_value(_n_C,6)])
		_S.invoke(_n_p_b0,"px",[_S.named_value(_n_w_b11,"x"), _S.named_value(_n_w_b11,"y"), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_w_b11,"x"), _S.named_value(_n_w_b11,"y"), 12, _S.index_value(_n_C,5), ((0.5 * _n_k_b12) + 0.2)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_bot = _S.read(_parent,"bot")
	var _n_top = _S.read(_parent,"top")
	var _n_w0 = _S.read(_parent,"w0")
	var _n_t = _S.read(_parent,"t")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float((_n_y_b1 - _n_bot))/(_n_top - _n_bot))
	var _n_half_b4 = ((_n_w0 * pow((1 - _n_u_b3),0.8)) * (0.85 + (0.15 * sin(((_n_y_b1 * 0.7) + (_n_t * 40))))))
	var _n_d_b5 = (float(absf(_n_x_b0))/maxf(0.5,_n_half_b4))
	if _S.truth((_n_d_b5 > 1)):
		return null
	_S.set_prop(_n_out_b2,"c",(_n_WHITE if _S.truth((_n_d_b5 < 0.35)) else (_S.index_value(_n_C,6) if _S.truth((_n_d_b5 < 0.7)) else _S.index_value(_n_C,5))),"=")
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_SY = _S.read(_parent,"SY")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_near_b4 = _S.arg(_args,4)
	var _n_k_b5 = (float((_n_t_b3 - _S.named_value(_n_r_b2,"t0")))/_S.named_value(_n_r_b2,"life"))
	if _S.truth(((_n_k_b5 < 0) if _S.truth((_n_k_b5 < 0)) else (_n_k_b5 >= 1))):
		return null
	_S.call_value(_n_band,[_n_p_b0, 0, 0, (_S.named_value(_n_r_b2,"r0") + ((_S.named_value(_n_r_b2,"r1") - _S.named_value(_n_r_b2,"r0")) * _S.invoke(_n_ease,"outCubic",[_n_k_b5]))), (_n_SY * 0.62), maxf(1,(_S.named_value(_n_r_b2,"th") * (1 - _n_k_b5))), (1.15 - _n_k_b5), _n_C_b1, _S.function_value(_S.capture(_parent,{"near":_n_near_b4,"this":_this}),"_f18"), ((_n_k_b5 < 0.15) if _S.truth(_S.named_value(_n_r_b2,"hot")) else _S.named_value(_n_r_b2,"hot"))])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_near = _S.read(_parent,"near")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.binary("===",(sin(_n_g_b0) >= 0),_n_near)
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_BURST = _S.read(_parent,"BURST")
	var _n_SHUT = _S.read(_parent,"SHUT")
	var _n_POP = _S.read(_parent,"POP")
	var _n_t_b0 = _S.arg(_args,0)
	return (((_n_t_b0 * 2.4) + (1.5 * _S.MathFX.smooth((_n_BURST - 0.1),(_n_BURST + 0.3),_n_t_b0))) + (10 * pow(clampf((float((_n_t_b0 - _n_SHUT))/(_n_POP - _n_SHUT)),0.0,1.0),2.2)))
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_th_b0 = _S.arg(_args,0)
	var _n_spin_b1 = _S.arg(_args,1)
	return ((1 + (0.05 * _S.MathFX.noise(((_n_th_b0 * 3) + (_n_spin_b1 * 0.6)),5))) + (0.035 * _S.MathFX.noise(((_n_th_b0 * 8) - (_n_spin_b1 * 1.3)),9)))
	return null
