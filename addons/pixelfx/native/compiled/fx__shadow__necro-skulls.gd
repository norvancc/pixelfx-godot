@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/necro-skulls.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "halo", _S.import_value("fx/shadow/_lib.js", "halo"))
	_S.define(_e, "skullAt", _S.function_value(_e, "_f0"))
	_S.define(_e, "tail", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawSkull", _S.function_value(_e, "_f2"))
	_S.define(_e, "flame", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f9"))
	_S.define(_e, "meta", _S.merge([{"name": "Necro skulls"}, {"desc": "Spectral skulls circle a cold green flame on a tilted orbit, passing behind and before it, eyes lit, trailing curls of ghost smoke."}, {"tags": ["shadow", "necromancy", "skull", "orbit", "ghost", "spectral", "magic", "loop"]}, {"size": [136, 116]}, {"origin": [68, 108]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#040e10", "#0a2228", "#0f3d44", "#16615f", "#23907f", "#45c4a0", "#9af0c8", "#e8fff4"]}, {"bone": ["#0c1a1c", "#2c4a4a", "#5c847c", "#a6cdb8", "#e4fff0"]}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CY", _S.unary("-", 52))
	_S.define(_e, "FB", _S.unary("-", 32))
	_S.define(_e, "FH", 34)
	_S.define(_e, "RX", 42)
	_S.define(_e, "RY", 11)
	_S.define(_e, "TILT", _S.unary("-", 0.12))
	_S.define(_e, "D", 3)
	_S.define(_e, "N", 5)
	_S.define(_e, "SKULL", ["...kkkkk...", ".kkhhhllkk.", "khhhhlllmmk", "khhllllllmk", "kleeeleeemk", "kleeeleeedk", "kmleelleedk", ".kmllnllmk.", ".kmmlnlmdk.", "..kmmmmmk..", "..ktgtgtk..", "...kkkkk..."])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_N = _S.read(_parent,"N")
	var _n_RX = _S.read(_parent,"RX")
	var _n_RY = _S.read(_parent,"RY")
	var _n_TILT = _S.read(_parent,"TILT")
	var _n_CY = _S.read(_parent,"CY")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_a_b2 = ((float((_n_TAU * _n_t_b1))/_n_D) + (float((_n_i_b0 * _n_TAU))/_n_N))
	var _n_ex_b3 = (cos(_n_a_b2) * _n_RX)
	var _n_ey_b4 = (sin(_n_a_b2) * _n_RY)
	var _n_bob_b5 = (sin(((float(((_n_TAU * 2) * _n_t_b1))/_n_D) + (_n_i_b0 * 1.7))) * 2)
	return {"x":((_n_ex_b3 * cos(_n_TILT)) - (_n_ey_b4 * sin(_n_TILT))),"y":(((_n_CY + (_n_ex_b3 * sin(_n_TILT))) + (_n_ey_b4 * cos(_n_TILT))) + _n_bob_b5),"z":sin(_n_a_b2),"a":_n_a_b2}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_skullAt = _S.read(_parent,"skullAt")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_i_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	if true:
		var _n_k_b4 = 8
		while _S.truth((_n_k_b4 >= 1)):
			var _n_tt_b5 = (_n_t_b3 - (_n_k_b4 * 0.05))
			var _n_s_b6 = _S.call_value(_n_skullAt,[_n_i_b2, _n_tt_b5])
			var _n_age_b7 = (float(_n_k_b4)/8)
			var _n_r_b8 = (2 + (_n_age_b7 * 3.6))
			var _n_a_b9 = (((1 - _n_age_b7) * 0.5) * (0.6 + (float((0.4 * (_S.named_value(_n_s_b6,"z") + 1)))/2)))
			_S.invoke(_n_p_b0,"disc",[_S.named_value(_n_s_b6,"x"), ((_S.named_value(_n_s_b6,"y") - (_n_age_b7 * 7)) + 2), _n_r_b8, (_S.index_value(_n_C_b1,5) if _S.truth((_n_age_b7 < 0.4)) else (_S.index_value(_n_C_b1,4) if _S.truth((_n_age_b7 < 0.7)) else _S.index_value(_n_C_b1,3))), _n_a_b9])
			_n_k_b4 -= 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_SKULL = _S.read(_parent,"SKULL")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_K_b2 = _S.arg(_args,2)
	var _n_s_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_i_b5 = _S.arg(_args,5)
	var _n_front_b6 = (_S.named_value(_n_s_b3,"z") >= 0)
	var _n_depth_b7 = (0.55 + (float((0.45 * (_S.named_value(_n_s_b3,"z") + 1)))/2))
	var _n_PAL_b8 = ({"k":_S.index_value(_n_K_b2,0),"d":_S.index_value(_n_K_b2,1),"m":_S.index_value(_n_K_b2,2),"l":_S.index_value(_n_K_b2,3),"h":_S.index_value(_n_K_b2,4),"e":_S.index_value(_n_C_b1,0),"n":_S.index_value(_n_C_b1,0),"t":_S.index_value(_n_K_b2,3),"g":_S.index_value(_n_K_b2,0)} if _S.truth(_n_front_b6) else {"k":_S.index_value(_n_K_b2,0),"d":_S.index_value(_n_K_b2,0),"m":_S.index_value(_n_K_b2,1),"l":_S.index_value(_n_K_b2,2),"h":_S.index_value(_n_K_b2,3),"e":_S.index_value(_n_C_b1,0),"n":_S.index_value(_n_C_b1,0),"t":_S.index_value(_n_K_b2,2),"g":_S.index_value(_n_K_b2,0)})
	var _n_x0_b9 = (floori(_S.named_value(_n_s_b3,"x")+0.5) - 5)
	var _n_y0_b10 = (floori(_S.named_value(_n_s_b3,"y")+0.5) - 6)
	_S.invoke(_n_p_b0,"sprite",[_n_SKULL, _n_PAL_b8, _n_x0_b9, _n_y0_b10])
	var _n_k_b11 = (((0.5 + (0.5 * sin(((float(((_n_TAU * 3) * _n_t_b4))/_n_D) + (_n_i_b5 * 2.1))))) * 0.5) + 0.5)
	for _iter_0 in _S.array([3, 7]):
		var _n_ex_b12 = _iter_0
		_S.invoke(_n_p_b0,"px",[((_n_x0_b9 + _n_ex_b12) + 0.5), (_n_y0_b10 + 5.5), ((_n_WHITE if _S.truth((_n_k_b11 > 0.75)) else _S.index_value(_n_C_b1,7)) if _S.truth(_n_front_b6) else _S.index_value(_n_C_b1,6))])
		if _S.truth(_n_front_b6):
			_S.invoke(_n_p_b0,"px",[((_n_x0_b9 + _n_ex_b12) + 0.5), (_n_y0_b10 + 4.5), _S.index_value(_n_C_b1,5)])
		_S.invoke(_n_p_b0,"glow",[((_n_x0_b9 + _n_ex_b12) + 1), (_n_y0_b10 + 6), 6, _S.index_value(_n_C_b1,5), ((0.45 * _n_depth_b7) * _n_k_b11)])
	_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_s_b3,"x"), _S.named_value(_n_s_b3,"y"), 11, _S.index_value(_n_C_b1,4), (0.18 * _n_depth_b7)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_FB = _S.read(_parent,"FB")
	var _n_FH = _S.read(_parent,"FH")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_W_b3 = 10
	var _n_scroll_b4 = (float(_n_t_b2)/_n_D)
	_S.invoke(_n_p_b0,"shade",[((-_n_W_b3) - 4), ((_n_FB - _n_FH) - 4), (_n_W_b3 + 4), (_n_FB + 2), _S.function_value(_S.capture(_parent,{"scroll":_n_scroll_b4,"W":_n_W_b3,"C":_n_C_b1,"this":_this}),"_f4")])
	_S.invoke(_n_p_b0,"glow",[0, (_n_FB - (_n_FH * 0.35)), 40, _S.index_value(_n_C_b1,5), 0.45])
	_S.invoke(_n_p_b0,"glow",[0, (_n_FB - 5), 12, _S.index_value(_n_C_b1,7), 0.25])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_FB = _S.read(_parent,"FB")
	var _n_FH = _S.read(_parent,"FH")
	var _n_scroll = _S.read(_parent,"scroll")
	var _n_W = _S.read(_parent,"W")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float((_n_FB - _n_y_b1))/_n_FH)
	if _S.truth(((_n_u_b3 < (-0.04)) if _S.truth((_n_u_b3 < (-0.04))) else (_n_u_b3 >= 1))):
		return null
	var _n_n1_b4 = _S.NoiseKernels.tile_noise((_n_x_b0 * 0.3),((_n_y_b1 * 0.2) + (_n_scroll * 8)),0,8,3)
	var _n_n2_b5 = _S.NoiseKernels.tile_noise((_n_x_b0 * 0.6),((_n_y_b1 * 0.45) + (_n_scroll * 16)),0,16,5)
	var _n_prof_b6 = ((0.35 + (0.65 * sqrt((float(maxf(0,_n_u_b3))/0.22)))) if _S.truth((_n_u_b3 < 0.22)) else pow((1 - (float((_n_u_b3 - 0.22))/0.78)),0.85))
	var _n_w_b7 = (((_n_W * _n_prof_b6) * (1 + (0.3 * _n_n1_b4))) + ((_n_n2_b5 * 2.2) * _n_u_b3))
	var _n_sway_b8 = (((_n_n1_b4 * 3) * _n_u_b3) * _n_u_b3)
	var _n_d_b9 = (float(absf((_n_x_b0 - _n_sway_b8)))/maxf(0.6,_n_w_b7))
	if _S.truth((_n_d_b9 > 1)):
		return null
	var _n_heat_b10 = ((pow((1 - _n_d_b9),0.7) * pow(maxf(0,(1 - _n_u_b3)),0.55)) + (_n_n2_b5 * 0.12))
	if _S.truth(_S.binary("===",_S.binary("&",(floori(_n_x_b0) + floori(_n_y_b1)),1),0)):
		_S.set_prop(_n_out_b2,"k",(0.16 * _n_heat_b10),"=")
	return (_n_WHITE if _S.truth((_n_heat_b10 > 0.82)) else (_S.index_value(_n_C,7) if _S.truth((_n_heat_b10 > 0.66)) else (_S.index_value(_n_C,6) if _S.truth((_n_heat_b10 > 0.46)) else (_S.index_value(_n_C,5) if _S.truth((_n_heat_b10 > 0.27)) else (_S.index_value(_n_C,4) if _S.truth((_n_heat_b10 > 0.12)) else _S.index_value(_n_C,3))))))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_N = _S.read(_parent,"N")
	var _n_tail = _S.read(_parent,"tail")
	var _n_drawSkull = _S.read(_parent,"drawSkull")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_K_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"bone"),5)
	_S.invoke(_n_p_b0,"glow",[0, (-1), 40, _S.index_value(_n_C_b3,4), 0.2])
	var _n_order_b5 = _S.invoke(_S.invoke(_S.invoke(_n_Array,"from",[{"length":_n_N}, _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f6")]),"filter",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f7")]),"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f8")])
	for _iter_0 in _S.array(_n_order_b5):
		var _tuple_1 = _iter_0
		var _n_i_b6 = _S.prop(_tuple_1,0)
		_S.call_value(_n_tail,[_n_p_b0, _n_C_b3, _n_i_b6, _n_t_b1])
	for _iter_2 in _S.array(_n_order_b5):
		var _tuple_3 = _iter_2
		var _n_i_b7 = _S.prop(_tuple_3,0)
		var _n_s_b8 = _S.prop(_tuple_3,1)
		_S.call_value(_n_drawSkull,[_n_p_b0, _n_C_b3, _n_K_b4, _n_s_b8, _n_t_b1, _n_i_b7])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_skullAt = _S.read(_parent,"skullAt")
	var _n_t = _S.read(_parent,"t")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return [_n_i_b1, _S.call_value(_n_skullAt,[_n_i_b1, _n_t])]
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _tuple_0 = _S.arg(_args,0)
	var _n_s_b0 = _S.prop(_tuple_0,1)
	return (_S.named_value(_n_s_b0,"z") < 0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.named_value(_S.index_value(_n_a_b0,1),"z") - _S.named_value(_S.index_value(_n_b_b1,1),"z"))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_flame = _S.read(_parent,"flame")
	var _n_Array = _S.read(_parent,"Array")
	var _n_N = _S.read(_parent,"N")
	var _n_tail = _S.read(_parent,"tail")
	var _n_drawSkull = _S.read(_parent,"drawSkull")
	var _n_CY = _S.read(_parent,"CY")
	var _n_halo = _S.read(_parent,"halo")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_K_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"bone"),5)
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 18, _n_S_b5, _S.function_value(_S.capture(_parent,{"this":_this}),"_f10"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f11")])
	_S.call_value(_n_flame,[_n_p_b0, _n_C_b3, _n_t_b1])
	var _n_order_b6 = _S.invoke(_S.invoke(_S.invoke(_n_Array,"from",[{"length":_n_N}, _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f12")]),"filter",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f13")]),"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f14")])
	for _iter_0 in _S.array(_n_order_b6):
		var _tuple_1 = _iter_0
		var _n_i_b7 = _S.prop(_tuple_1,0)
		_S.call_value(_n_tail,[_n_p_b0, _n_C_b3, _n_i_b7, _n_t_b1])
	for _iter_2 in _S.array(_n_order_b6):
		var _tuple_3 = _iter_2
		var _n_i_b8 = _S.prop(_tuple_3,0)
		var _n_s_b9 = _S.prop(_tuple_3,1)
		_S.call_value(_n_drawSkull,[_n_p_b0, _n_C_b3, _n_K_b4, _n_s_b9, _n_t_b1, _n_i_b8])
	_S.call_value(_n_halo,[_n_p_b0, 0, _n_CY, 0, 46, _S.index_value(_n_C_b3,4), 0.12])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.8, 1.4])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_FB = _S.read(_parent,"FB")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_x0_b3 = _S.invoke(_n_r_b2,"range",[(-6), 6])
	var _n_u_b4 = (float(_n_age_b0)/_n_L_b1)
	var _n_x_b5 = (_n_x0_b3 + ((sin(((_n_u_b4 * 5) + _S.invoke(_n_r_b2,"range",[0, 6]))) * 3) * _n_u_b4))
	var _n_y_b6 = ((_n_FB - 6) - (_n_u_b4 * _S.invoke(_n_r_b2,"range",[36, 56])))
	_S.invoke(_n_p,"dot",[_n_x_b5, _n_y_b6, (_S.index_value(_n_C,7) if _S.truth((_n_u_b4 < 0.5)) else _S.index_value(_n_C,6)), (1 if _S.truth((_n_u_b4 < 0.7)) else ((1 - _n_u_b4) * 3.3))])
	_S.invoke(_n_p,"glow",[_n_x_b5, _n_y_b6, 3, _S.index_value(_n_C,6), (0.3 * (1 - _n_u_b4))])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_skullAt = _S.read(_parent,"skullAt")
	var _n_t = _S.read(_parent,"t")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return [_n_i_b1, _S.call_value(_n_skullAt,[_n_i_b1, _n_t])]
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _tuple_0 = _S.arg(_args,0)
	var _n_s_b0 = _S.prop(_tuple_0,1)
	return (_S.named_value(_n_s_b0,"z") >= 0)
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.named_value(_S.index_value(_n_a_b0,1),"z") - _S.named_value(_S.index_value(_n_b_b1,1),"z"))
	return null
