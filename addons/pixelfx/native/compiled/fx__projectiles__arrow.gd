@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/arrow.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "beat", _S.import_value("fx/projectiles/_lib.js", "beat"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Arrow"}, {"desc": "An arrow in flight: a steel broadhead catching the light, a wooden shaft, fletching fluttering in the wind, streaks of air peeling off its head and swirling off its feathers."}, {"tags": ["projectile", "arrow", "bow", "medieval", "directional", "loop"]}, {"size": [112, 32]}, {"origin": [92, 16]}, {"duration": 0.6}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#7a1f2c", "#b8323c", "#e8e2d6", "#ffffff"]}, {"wood": ["#3a2414", "#6e4422", "#a8723c", "#d8a868"]}, {"steel": ["#2e3648", "#5a6680", "#9aa6ba", "#dfe7f2"]}, {"wind": "#b8c8e8"}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HEAD", ["..LL....", "..sLLL..", "bbsSSSSW", "..dDDD..", "..DD...."])
	_S.define(_e, "FLETCH", [["AAa.........", ".aAAa.......", "..aaAAa.....", "nkkkkkkkkkkk", "..cCCc......", ".cCCc.......", "CCc........."], [".AAa........", "..aAAa......", "..aaAAAa....", "nkkkkkkkkkkk", "..cCCCc.....", "..cCCc......", ".CCc........"], ["AAAa........", "aAAa........", ".aaAAa......", "nkkkkkkkkkkk", "..ccCc......", "cCCc........", "CCc........."]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_meta = _S.read(_parent,"meta")
	var _n_beat = _S.read(_parent,"beat")
	var _n_FLETCH = _S.read(_parent,"FLETCH")
	var _n_HEAD = _S.read(_parent,"HEAD")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_PL_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),4)
	var _n_W_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"wood"),4)
	var _n_ST_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"steel"),4)
	var _n_wind_b6 = _S.call_value(_n_hex,[_S.named_value(_n_o_b2,"wind")])
	var _n_S_b7 = _S.named_value(_n_o_b2,"seed")
	var _n_D_b8 = _S.named_value(_n_meta,"duration")
	var _n_fr_b9 = floori(((_n_t_b1 * 30) + 0.000001))
	var _n_ph_b10 = (float(_n_t_b1)/_n_D_b8)
	var _n_left_b11 = ((-_S.index_value(_S.named_value(_n_meta,"origin"),0)) + 2)
	var _n_LEN_b12 = 36
	_S.call_value(_n_beat,[_n_t_b1, _n_D_b8, 9, _n_S_b7, _S.function_value(_S.capture(_parent,{"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"LEN":_n_LEN_b12,"left":_n_left_b11,"wind":_n_wind_b6,"p":_n_p_b0,"this":_this}),"_f2")])
	_S.call_value(_n_beat,[_n_t_b1, _n_D_b8, 6, (_n_S_b7 + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), _S.function_value(_S.capture(_parent,{"LEN":_n_LEN_b12,"left":_n_left_b11,"p":_n_p_b0,"wind":_n_wind_b6,"this":_this}),"_f6")])
	_S.invoke(_n_p_b0,"line",[((-_n_LEN_b12) + 11), 0, (-7), 0, _S.index_value(_n_W_b4,2)])
	if true:
		var _n_x_b15 = ((-_n_LEN_b12) + 14)
		while _S.truth((_n_x_b15 < (-8))):
			_S.invoke(_n_p_b0,"px",[_n_x_b15, 0, _S.index_value(_n_W_b4,3)])
			_n_x_b15 += 6
	var _n_pose_b13 = _S.index_value(_n_FLETCH,floori((_S.MathFX.rand([_n_fr_b9,_n_S_b7]) * 3)))
	_S.invoke(_n_p_b0,"sprite",[_n_pose_b13, {"a":_S.index_value(_n_PL_b3,2),"A":_S.index_value(_n_PL_b3,3),"c":_S.index_value(_n_PL_b3,0),"C":_S.index_value(_n_PL_b3,1),"k":_S.index_value(_n_W_b4,1),"n":_S.index_value(_n_W_b4,0)}, (-_n_LEN_b12), (-3)])
	_S.invoke(_n_p_b0,"sprite",[_n_HEAD, {"L":_S.index_value(_n_ST_b5,3),"s":_S.index_value(_n_ST_b5,2),"S":_S.index_value(_n_ST_b5,2),"d":_S.index_value(_n_ST_b5,0),"D":_S.index_value(_n_ST_b5,1),"b":_S.index_value(_n_W_b4,0),"W":_n_WHITE}, (-7), (-2)])
	var _n_g_b14 = fmod((_n_ph_b10 * 2),1)
	if _S.truth((_n_g_b14 < 0.25)):
		_S.call_value(_n_sparkle,[_n_p_b0, ((-5) + (_n_g_b14 * 16)), (-1), (1 + floori((2 * sin(((float(_n_g_b14)/0.25) * PI)))+0.5)), _n_WHITE, _S.index_value(_n_ST_b5,3), 0.25])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.14, 0.26])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_LEN = _S.read(_parent,"LEN")
	var _n_left = _S.read(_parent,"left")
	var _n_wind = _S.read(_parent,"wind")
	var _n_hex = _S.read(_parent,"hex")
	var _n_p = _S.read(_parent,"p")
	var _n_this = _S.read(_parent,"this")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_top_b4 = ((-1) if _S.truth(_S.invoke(_n_r_b2,"chance",[0.5])) else 1)
	var _n_from_b5 = ((-3) if _S.truth(_S.invoke(_n_r_b2,"chance",[0.6])) else ((-_n_LEN) + 6))
	var _n_x0_b6 = (_n_from_b5 - (_n_age_b0 * _S.invoke(_n_r_b2,"range",[160, 240])))
	var _n_len_b7 = (_S.invoke(_n_r_b2,"range",[8, 16]) * (0.5 + _n_k_b3))
	var _n_y_b8 = (0.5 + (_n_top_b4 * (_S.invoke(_n_r_b2,"range",[3, 5]) + (_n_k_b3 * _S.invoke(_n_r_b2,"range",[1, 2.5])))))
	if _S.truth(((_n_x0_b6 - _n_len_b7) < _n_left)):
		return null
	var _n_c_b9 = (_n_wind if _S.truth((_n_k_b3 < 0.4)) else _S.ColorFX.mix(_n_wind,_S.call_value(_n_hex,["#2a2540"]),((_n_k_b3 - 0.4) * 1.2)))
	_S.invoke(_n_p,"line",[_n_x0_b6, _n_y_b8, (_n_x0_b6 - _n_len_b7), _n_y_b8, _S.function_value(_S.capture(_parent,{"k":_n_k_b3,"c":_n_c_b9,"this":_n_this}),"_f3"), _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f4")])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_wind = _S.read(_parent,"wind")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_k = _S.read(_parent,"k")
	var _n_c = _S.read(_parent,"c")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.ColorFX.mix(_n_wind,_n_WHITE,0.5) if _S.truth(((_n_k < 0.4) if _S.truth((_n_u_b0 < 0.25)) else (_n_u_b0 < 0.25))) else _n_c)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return (1 if _S.truth((_n_u_b0 < 0.65)) else (float((1 - _n_u_b0))/0.35))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.15, 0.25])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_LEN = _S.read(_parent,"LEN")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_left = _S.read(_parent,"left")
	var _n_p = _S.read(_parent,"p")
	var _n_wind = _S.read(_parent,"wind")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_cx_b4 = (((-_n_LEN) - 2) - (_n_age_b0 * _S.invoke(_n_r_b2,"range",[100, 150])))
	var _n_cy_b5 = (0.5 + (_S.invoke(_n_r_b2,"sign",[]) * _S.invoke(_n_r_b2,"range",[2, 4])))
	var _n_a_b6 = ((_n_age_b0 * 30) + _S.invoke(_n_r_b2,"range",[0, _n_TAU]))
	var _n_rr_b7 = (1.2 + (_n_k_b3 * 1.5))
	if _S.truth((_n_cx_b4 < (_n_left + 4))):
		return null
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < 4)):
			_S.invoke(_n_p,"dot",[(_n_cx_b4 + (cos((_n_a_b6 + (_n_i_b8 * 0.5))) * _n_rr_b7)), (_n_cy_b5 + (sin((_n_a_b6 + (_n_i_b8 * 0.5))) * _n_rr_b7)), _n_wind, ((1 - _n_k_b3) * (1 - (_n_i_b8 * 0.2)))])
			_n_i_b8 += 1.0
	return null
