@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/sunburst.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "GOLD", _S.import_value("fx/holy/_lib.js", "GOLD"))
	_S.define(_e, "ray", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Sunburst"}, {"desc": "A white-hot core in a gold corona; long and short rays turn slowly round it, breathing, with glints running out along them that wink at the tips."}, {"tags": ["holy", "sun", "radiant", "rays", "light", "glow", "loop"]}, {"size": [128, 128]}, {"origin": [64, 64]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": _S.read(_e, "GOLD")}, {"rays": 8}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CORE", 4.5)
	_S.define(_e, "RING", 7.5)
	_S.define(_e, "R0", 9)
	_S.define(_e, "frac", _S.function_value(_e, "_f8"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_R0 = _S.read(_parent,"R0")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_a_b2 = _S.arg(_args,2)
	var _n_L_b3 = _S.arg(_args,3)
	var _n_w0_b4 = _S.arg(_args,4)
	var _n_k_b5 = _S.arg(_args,5)
	var _n_ca_b6 = cos(_n_a_b2)
	var _n_sa_b7 = sin(_n_a_b2)
	var _n_x1_b8 = (_n_ca_b6 * (_n_R0 + _n_L_b3))
	var _n_y1_b9 = (_n_sa_b7 * (_n_R0 + _n_L_b3))
	var _n_pad_b10 = (_n_w0_b4 + 1)
	_S.invoke(_n_p_b0,"shade",[(minf(0,_n_x1_b8) - _n_pad_b10), (minf(0,_n_y1_b9) - _n_pad_b10), (maxf(0,_n_x1_b8) + _n_pad_b10), (maxf(0,_n_y1_b9) + _n_pad_b10), _S.function_value(_S.capture(_parent,{"ca":_n_ca_b6,"sa":_n_sa_b7,"L":_n_L_b3,"w0":_n_w0_b4,"C":_n_C_b1,"k":_n_k_b5,"this":_this}),"_f1")])
	_S.invoke(_n_p_b0,"glowLine",[(_n_ca_b6 * _n_R0), (_n_sa_b7 * _n_R0), (_n_ca_b6 * (_n_R0 + (_n_L_b3 * 0.8))), (_n_sa_b7 * (_n_R0 + (_n_L_b3 * 0.8))), 5, _S.index_value(_n_C_b1,5), (0.16 * _n_k_b5)])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_R0 = _S.read(_parent,"R0")
	var _n_L = _S.read(_parent,"L")
	var _n_w0 = _S.read(_parent,"w0")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_k = _S.read(_parent,"k")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_along_b3 = (((_n_x_b0 * _n_ca) + (_n_y_b1 * _n_sa)) - _n_R0)
	var _n_u_b4 = (float(_n_along_b3)/_n_L)
	if _S.truth(((_n_u_b4 < 0) if _S.truth((_n_u_b4 < 0)) else (_n_u_b4 > 1))):
		return null
	var _n_across_b5 = absf((((-_n_x_b0) * _n_sa) + (_n_y_b1 * _n_ca)))
	var _n_w_b6 = (((float(_n_w0)/2) * (1 - (_n_u_b4 * 0.85))) + 0.25)
	if _S.truth((_n_across_b5 > _n_w_b6)):
		return null
	var _n_spine_b7 = (_n_across_b5 < 0.5)
	var _n_rim_b8 = ((_n_w_b6 > 0.9) if _S.truth((_n_across_b5 > (_n_w_b6 - 0.6))) else (_n_across_b5 > (_n_w_b6 - 0.6)))
	_S.set_prop(_n_out_b2,"c",((_n_WHITE if _S.truth((_n_u_b4 < 0.4)) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b4 < 0.75)) else _S.index_value(_n_C,5))) if _S.truth(_n_spine_b7) else (_S.index_value(_n_C,3) if _S.truth(((_n_u_b4 > 0.15) if _S.truth(_n_rim_b8) else _n_rim_b8)) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b4 < 0.3)) else (_S.index_value(_n_C,5) if _S.truth((_n_u_b4 < 0.62)) else _S.index_value(_n_C,4))))),"=")
	_S.set_prop(_n_out_b2,"a",(_n_k if _S.truth((_n_u_b4 < 0.72)) else ((_n_k * (1 - (float((_n_u_b4 - 0.72))/0.28))) * 1.2)),"=")
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R0 = _S.read(_parent,"R0")
	var _n_ray = _S.read(_parent,"ray")
	var _n_frac = _S.read(_parent,"frac")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_RING = _S.read(_parent,"RING")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_N_b4 = (_S.named_value(_n_o_b2,"rays") * 2)
	var _n_T_b5 = _S.named_value(_n_meta,"duration")
	var _n_rot_b6 = ((float(_n_t_b1)/_n_T_b5) * (float((2 * _n_TAU))/_n_N_b4))
	_S.invoke(_n_p_b0,"glow",[0, 0, 62, _S.index_value(_n_C_b3,4), (0.3 + (0.06 * sin((((float(_n_t_b1)/_n_T_b5) * _n_TAU) * 2))))])
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < _n_N_b4)):
			var _n_a_b8 = (_n_rot_b6 + (float(((_n_i_b7 + 0.5) * _n_TAU))/_n_N_b4))
			var _n_L_b9 = (14 + (6 * sin(((_n_a_b8 * 3) + ((float(_n_t_b1)/_n_T_b5) * _n_TAU)))))
			_S.invoke(_n_p_b0,"line",[(cos(_n_a_b8) * (_n_R0 + 1)), (sin(_n_a_b8) * (_n_R0 + 1)), (cos(_n_a_b8) * (_n_R0 + _n_L_b9)), (sin(_n_a_b8) * (_n_R0 + _n_L_b9)), _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f3"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f4")])
			_n_i_b7 += 1.0
	if true:
		var _n_i_b10 = 0
		while _S.truth((_n_i_b10 < _n_N_b4)):
			var _n_a_b11 = (_n_rot_b6 + (float((_n_i_b10 * _n_TAU))/_n_N_b4))
			var _n_long_b12 = _S.binary("===",fmod(_n_i_b10,2),0)
			var _n_breathe_b13 = (0.86 + (0.14 * sin(((_n_a_b11 * 3) - (((float(_n_t_b1)/_n_T_b5) * _n_TAU) * 2)))))
			var _n_L_b14 = ((36 if _S.truth(_n_long_b12) else 21) * _n_breathe_b13)
			_S.call_value(_n_ray,[_n_p_b0, _n_C_b3, _n_a_b11, _n_L_b14, (4 if _S.truth(_n_long_b12) else 2.6), 1])
			if _S.truth(_n_long_b12):
				var _n_g_b15 = _S.call_value(_n_frac,[(((float(_n_t_b1)/_n_T_b5) * 2) + (float((_n_a_b11 * 3))/_n_TAU))])
				var _n_r_b16 = (_n_R0 + (_n_g_b15 * _n_L_b14))
				if _S.truth((_n_g_b15 < 0.9)):
					_S.invoke(_n_p_b0,"px",[(cos(_n_a_b11) * _n_r_b16), (sin(_n_a_b11) * _n_r_b16), _n_WHITE])
					_S.invoke(_n_p_b0,"glow",[(cos(_n_a_b11) * _n_r_b16), (sin(_n_a_b11) * _n_r_b16), 5, _S.index_value(_n_C_b3,6), (0.45 * (1 - _n_g_b15))])
				else:
					_S.call_value(_n_sparkle,[_n_p_b0, (cos(_n_a_b11) * (_n_R0 + _n_L_b14)), (sin(_n_a_b11) * (_n_R0 + _n_L_b14)), (1 + (3 * sin(((float((_n_g_b15 - 0.9))/0.1) * PI)))), _n_WHITE, _S.index_value(_n_C_b3,6), 0.5])
			_n_i_b10 += 1.0
	_S.invoke(_n_p_b0,"shade",[((-_n_RING) - 2), ((-_n_RING) - 2), (_n_RING + 2), (_n_RING + 2), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"T":_n_T_b5,"C":_n_C_b3,"this":_this}),"_f5")])
	_S.invoke(_n_p_b0,"glow",[0, 0, 16, _n_WHITE, 0.28])
	_S.call_value(_n_cycle,[_n_t_b1, _n_T_b5, 10, _S.named_value(_n_o_b2,"seed"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f6"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f7")])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 < 0.3)) else _S.index_value(_n_C,5))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return (0.7 - (_n_u_b0 * 0.8))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_RING = _S.read(_parent,"RING")
	var _n_t = _S.read(_parent,"t")
	var _n_T = _S.read(_parent,"T")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_CORE = _S.read(_parent,"CORE")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = _S.Bridge.hypot([_n_x_b0, _n_y_b1])
	if _S.truth((_n_d_b3 > _n_RING)):
		return null
	var _n_flick_b4 = (0.5 + (0.5 * sin(((atan2(_n_y_b1,_n_x_b0) * 5) + (((float(_n_t)/_n_T) * _n_TAU) * 3)))))
	_S.set_prop(_n_out_b2,"c",(_n_WHITE if _S.truth((_n_d_b3 < _n_CORE)) else ((_n_WHITE if _S.truth((_n_flick_b4 > 0.6)) else _S.index_value(_n_C,6)) if _S.truth((_n_d_b3 < (_n_CORE + 1.5))) else (_S.index_value(_n_C,5) if _S.truth((_n_flick_b4 > 0.5)) else _S.index_value(_n_C,4)))),"=")
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.35, 0.7])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.invoke(_n_R_b2,"range",[0, _n_TAU])
	var _n_d_b4 = _S.invoke(_n_R_b2,"range",[16, 44])
	var _n_k_b5 = sin(((float(_n_age_b0)/_n_life_b1) * PI))
	_S.call_value(_n_sparkle,[_n_p, (cos(_n_a_b3) * _n_d_b4), (sin(_n_a_b3) * _n_d_b4), (1 + ((2.4 * _n_k_b5) * _S.invoke(_n_R_b2,"range",[0.5, 1]))), _n_WHITE, _S.index_value(_n_C,5), (0.4 * _n_k_b5)])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	return (_n_x_b0 - floori(_n_x_b0))
	return null
