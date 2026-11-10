@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/heart-pickup.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "pillow", _S.import_value("fx/pickups/_lib.js", "pillow"))
	_S.define(_e, "heartSdf", _S.import_value("fx/pickups/_lib.js", "heartSdf"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Heart pickup"}, {"desc": "A plump glossy heart hovering over its shadow beats lub-dub: a big squash and stretch, a smaller echo, light and a thin ring pulsing out, tiny hearts drifting off."}, {"tags": ["pickup", "heart", "health", "life", "loop"]}, {"size": [56, 60]}, {"origin": [28, 52]}, {"duration": 1.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0408", "#4a0a14", "#8a1222", "#d02436", "#ff4a56", "#ff8a8e", "#ffd0cc", "#ffffff"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [40, 40]))
	_S.define(_e, "HOVER", 18)
	_S.define(_e, "W", 7.2)
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#12060c"]))
	_S.define(_e, "MINI", [".a.a.", "abbba", ".aba.", "..a.."])
	_S.define(_e, "LUB", 0.04)
	_S.define(_e, "DUB", 0.24)
	_S.define(_e, "beat", _S.function_value(_e, "_f5"))
	_S.define(_e, "pulse", _S.function_value(_e, "_f6"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_pulse = _S.read(_parent,"pulse")
	var _n_blobShadow = _S.read(_parent,"blobShadow")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_S.named_value(_n_meta,"duration"))
	var _n_y_b5 = ((-_n_HOVER) - (1.2 * sin((_n_ph_b4 * _n_TAU))))
	_S.call_value(_n_blobShadow,[_n_p_b0, 0, (8 + (1.5 * _S.call_value(_n_pulse,[_n_ph_b4]))), 0.8])
	_S.call_value(_n_cycle,[_n_t_b1, _S.named_value(_n_meta,"duration"), 4, _S.named_value(_n_o_b2,"seed"), 0.95, _S.function_value(_S.capture(_parent,{"y":_n_y_b5,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_y = _S.read(_parent,"y")
	var _n_p = _S.read(_parent,"p")
	var _n_MINI = _S.read(_parent,"MINI")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_side_b4 = (1 if _S.truth(fmod(_n_i_b3,2)) else (-1))
	var _n_k_b5 = (float(_n_age_b0)/_n_life_b1)
	var _n_x_b6 = ((_n_side_b4 * (_S.invoke(_n_r_b2,"range",[2, 5]) + (_n_age_b0 * _S.invoke(_n_r_b2,"range",[9, 15])))) + (sin(((_n_age_b0 * 7) + _S.invoke(_n_r_b2,"range",[0, _n_TAU]))) * 1.5))
	var _n_yy_b7 = ((_n_y - 5) - (_n_age_b0 * _S.invoke(_n_r_b2,"range",[14, 19])))
	var _n_a_b8 = (minf(1,(float(_n_age_b0)/0.12)) * (1 - (_n_k_b5 * _n_k_b5)))
	_S.invoke(_n_p,"sprite",[_n_MINI, {"a":(_S.index_value(_n_C,5) if _S.truth((_n_k_b5 < 0.5)) else _S.index_value(_n_C,4)),"b":(_n_WHITE if _S.truth((_n_k_b5 < 0.3)) else _S.index_value(_n_C,6))}, floori((_n_x_b6 - 2.5)+0.5), floori((_n_yy_b7 - 2)+0.5), {"a":(_n_a_b8 * 1.3)}])
	_S.invoke(_n_p,"glow",[_n_x_b6, _n_yy_b7, 5, _S.index_value(_n_C,4), (0.3 * _n_a_b8)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_pulse = _S.read(_parent,"pulse")
	var _n_L = _S.read(_parent,"L")
	var _n_pillow = _S.read(_parent,"pillow")
	var _n_INK = _S.read(_parent,"INK")
	var _n_LUB = _S.read(_parent,"LUB")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_glint = _S.read(_parent,"glint")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ph_b4 = (float(_n_t_b1)/_S.named_value(_n_meta,"duration"))
	var _n_y_b5 = ((-_n_HOVER) - (1.2 * sin((_n_ph_b4 * _n_TAU))))
	var _n_b_b6 = _S.call_value(_n_pulse,[_n_ph_b4])
	var _n_sx_b7 = (1 + (0.16 * _n_b_b6))
	var _n_sy_b8 = (1 - (0.13 * _n_b_b6))
	var _n_cy_b9 = floori(_n_y_b5+0.5)
	_S.invoke(_n_p_b0,"glow",[0, _n_cy_b9, (22 + (6 * maxf(0,_n_b_b6))), _S.index_value(_n_C_b3,4), (0.26 + (0.3 * maxf(0,_n_b_b6)))])
	_S.invoke(_n_L,"begin",[(-20), (_n_cy_b9 - 20)])
	_S.call_value(_n_pillow,[_n_L, (-12), (_n_cy_b9 - 11), 12, (_n_cy_b9 + 11), _S.function_value(_S.capture(_parent,{"cy":_n_cy_b9,"sx":_n_sx_b7,"sy":_n_sy_b8,"this":_this}),"_f3"), _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f4"), {"bevel":3.6}])
	_S.invoke(_S.invoke(_n_L,"outline",[_n_INK]),"draw",[_n_p_b0])
	var _n_u_b10 = fmod((fmod((_n_ph_b4 - _n_LUB),1) + 1),1)
	if _S.truth((_n_u_b10 < 0.28)):
		var _n_k_b12 = (float(_n_u_b10)/0.28)
		var _n_r_b13 = (9 + (8 * (1 - pow((1 - _n_k_b12),3))))
		_S.invoke(_n_p_b0,"ring",[0, _n_cy_b9, _n_r_b13, 1, (_S.index_value(_n_C_b3,6) if _S.truth((_n_k_b12 < 0.2)) else _S.index_value(_n_C_b3,5)), (0.85 * (1 - _n_k_b12))])
		_S.invoke(_n_p_b0,"glowRing",[0, _n_cy_b9, _n_r_b13, 4, _S.index_value(_n_C_b3,4), (0.25 * (1 - _n_k_b12))])
	var _n_g_b11 = fmod((fmod(((_n_ph_b4 - _n_LUB) - 0.08),0.5) + 0.5),0.5)
	if _S.truth((_n_g_b11 < 0.12)):
		_S.call_value(_n_glint,[_n_p_b0, (-3.5), (_n_cy_b9 - 4), (2.6 * sin(((float(_n_g_b11)/0.12) * PI))), _n_WHITE, 0.45])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_cy = _S.read(_parent,"cy")
	var _n_W = _S.read(_parent,"W")
	var _n_sx = _S.read(_parent,"sx")
	var _n_sy = _S.read(_parent,"sy")
	var _n_heartSdf = _S.read(_parent,"heartSdf")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_yy_b1 = _S.arg(_args,1)
	return _S.call_value(_n_heartSdf,[_n_x_b0, _n_yy_b1, 0, _n_cy, (_n_W * _n_sx), (_n_W * _n_sy)])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_lt_b0 = _S.arg(_args,0)
	var _n_e_b1 = _S.arg(_args,1)
	if _S.truth(((_n_e_b1 > 1.2) if _S.truth((_n_lt_b0 > 0.92)) else (_n_lt_b0 > 0.92))):
		return _n_WHITE
	return (_S.index_value(_n_C,6) if _S.truth((_n_lt_b0 > 0.8)) else (_S.index_value(_n_C,5) if _S.truth((_n_lt_b0 > 0.6)) else (_S.index_value(_n_C,4) if _S.truth((_n_lt_b0 > 0.38)) else (_S.index_value(_n_C,3) if _S.truth((_n_lt_b0 > 0.12)) else _S.index_value(_n_C,2)))))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_ph_b0 = _S.arg(_args,0)
	var _n_at_b1 = _S.arg(_args,1)
	var _n_s_b2 = _S.arg(_args,2)
	var _n_u_b3 = (_n_ph_b0 - _n_at_b1)
	if _S.truth(((_n_u_b3 < 0) if _S.truth((_n_u_b3 < 0)) else (_n_u_b3 > 0.3))):
		return 0
	return ((_n_s_b2 * exp(((-_n_u_b3) * 16))) * cos((_n_u_b3 * 34)))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_beat = _S.read(_parent,"beat")
	var _n_LUB = _S.read(_parent,"LUB")
	var _n_DUB = _S.read(_parent,"DUB")
	var _n_ph_b0 = _S.arg(_args,0)
	return ((_S.call_value(_n_beat,[_n_ph_b0, _n_LUB, 1]) + _S.call_value(_n_beat,[_n_ph_b0, _n_DUB, 0.55])) + _S.call_value(_n_beat,[(_n_ph_b0 + 1), _n_LUB, 1]))
	return null
