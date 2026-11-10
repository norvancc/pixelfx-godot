@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/xp-orb.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "pool", _S.import_value("fx/pickups/_lib.js", "pool"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "XP orb"}, {"desc": "A small glowing orb races a figure-eight, a comet tail tapering behind it along its path, flecks shed from the tail winking out, its light following it over the floor."}, {"tags": ["pickup", "xp", "orb", "experience", "energy", "loop"]}, {"size": [72, 56]}, {"origin": [36, 48]}, {"duration": 1.8}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0c1806", "#1e3a0a", "#36620e", "#5c9614", "#8cd024", "#c4f060", "#effcc0", "#ffffff"]}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "A", 16)
	_S.define(_e, "B", 9)
	_S.define(_e, "HOVER", 20)
	_S.define(_e, "TAIL", 0.48)
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#0a1406"]))
	_S.define(_e, "at", _S.function_value(_e, "_f5"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_blobShadow = _S.read(_parent,"blobShadow")
	var _n_pool = _S.read(_parent,"pool")
	var _n_meta = _S.read(_parent,"meta")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _tuple_0 = _S.call_value(_n_at,[_n_t_b1])
	var _n_x_b4 = _S.prop(_tuple_0,0)
	var _n_y_b5 = _S.prop(_tuple_0,1)
	_S.call_value(_n_blobShadow,[_n_p_b0, _n_x_b4, 3.5, 0.55])
	_S.call_value(_n_pool,[_n_p_b0, _n_x_b4, 0.5, 14, 3, _S.index_value(_n_C_b3,5), 0.3])
	_S.call_value(_n_cycle,[_n_t_b1, _S.named_value(_n_meta,"duration"), 16, _S.named_value(_n_o_b2,"seed"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f2")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.35, 0.7])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_t = _S.read(_parent,"t")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _tuple_0 = _S.call_value(_n_at,[(_n_t - _n_age_b0)])
	var _n_fx_b3 = _S.prop(_tuple_0,0)
	var _n_fy_b4 = _S.prop(_tuple_0,1)
	var _n_k_b5 = (1 - (float(_n_age_b0)/_n_life_b1))
	var _n_tw_b6 = sin(((_n_age_b0 * _S.invoke(_n_r_b2,"range",[20, 30])) + _S.invoke(_n_r_b2,"range",[0, _n_TAU])))
	var _n_x2_b7 = ((_n_fx_b3 + _S.invoke(_n_r_b2,"range",[(-2), 2])) + (_n_age_b0 * _S.invoke(_n_r_b2,"range",[(-6), 6])))
	var _n_y2_b8 = ((_n_fy_b4 + _S.invoke(_n_r_b2,"range",[(-2), 2])) + (_n_age_b0 * _S.invoke(_n_r_b2,"range",[4, 10])))
	if _S.truth(((_n_tw_b6 * _n_k_b5) > (-0.2))):
		_S.invoke(_n_p,"px",[_n_x2_b7, _n_y2_b8, (_n_WHITE if _S.truth(((_n_k_b5 > 0.5) if _S.truth((_n_tw_b6 > 0.6)) else (_n_tw_b6 > 0.6))) else (_S.index_value(_n_C,6) if _S.truth((_n_k_b5 > 0.5)) else _S.index_value(_n_C,5)))])
	_S.invoke(_n_p,"glow",[(_n_x2_b7 + 0.5), (_n_y2_b8 + 0.5), 3, _S.index_value(_n_C,5), (0.3 * _n_k_b5)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_meta = _S.read(_parent,"meta")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_TAIL = _S.read(_parent,"TAIL")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_INK = _S.read(_parent,"INK")
	var _n_glint = _S.read(_parent,"glint")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _tuple_0 = _S.call_value(_n_at,[_n_t_b1])
	var _n_x_b4 = _S.prop(_tuple_0,0)
	var _n_y_b5 = _S.prop(_tuple_0,1)
	var _n_beat_b6 = (0.5 + (0.5 * sin((((float(_n_t_b1)/_S.named_value(_n_meta,"duration")) * _n_TAU) * 3))))
	var _n_n_b7 = 60
	if true:
		var _n_i_b11 = _n_n_b7
		while _S.truth((_n_i_b11 >= 1)):
			var _n_u_b12 = (float(_n_i_b11)/_n_n_b7)
			var _tuple_1 = _S.call_value(_n_at,[(_n_t_b1 - (_n_u_b12 * _n_TAIL))])
			var _n_tx_b13 = _S.prop(_tuple_1,0)
			var _n_ty_b14 = _S.prop(_tuple_1,1)
			var _n_r_b15 = (3.1 * pow((1 - _n_u_b12),1.1))
			var _n_c_b16 = (_S.index_value(_n_C_b3,5) if _S.truth((_n_u_b12 < 0.25)) else (_S.index_value(_n_C_b3,4) if _S.truth((_n_u_b12 < 0.55)) else _S.index_value(_n_C_b3,3)))
			if _S.truth((_n_r_b15 > 0.6)):
				_S.invoke(_n_p_b0,"circle",[_n_tx_b13, _n_ty_b14, _n_r_b15, _n_c_b16, (1 if _S.truth((_n_u_b12 < 0.7)) else ((1 - _n_u_b12) * 3.3))])
			else:
				_S.invoke(_n_p_b0,"dot",[_n_tx_b13, _n_ty_b14, _n_c_b16, ((1 - _n_u_b12) * 3)])
			if _S.truth(_S.binary("===",fmod(_n_i_b11,6),0)):
				_S.invoke(_n_p_b0,"glow",[_n_tx_b13, _n_ty_b14, ((7 * (1 - _n_u_b12)) + 2), _S.index_value(_n_C_b3,5), (0.24 * (1 - _n_u_b12))])
			_n_i_b11 -= 1.0
	if true:
		var _n_i_b17 = floori((_n_n_b7 * 0.6))
		while _S.truth((_n_i_b17 >= 1)):
			var _n_u_b18 = (float(_n_i_b17)/_n_n_b7)
			var _tuple_2 = _S.call_value(_n_at,[(_n_t_b1 - (_n_u_b18 * _n_TAIL))])
			var _n_tx_b19 = _S.prop(_tuple_2,0)
			var _n_ty_b20 = _S.prop(_tuple_2,1)
			_S.invoke(_n_p_b0,"dot",[_n_tx_b19, _n_ty_b20, (_n_WHITE if _S.truth((_n_u_b18 < 0.2)) else _S.index_value(_n_C_b3,6)), ((0.6 - _n_u_b18) * 4)])
			_n_i_b17 -= 1.0
	var _n_X_b8 = floori(_n_x_b4+0.5)
	var _n_Y_b9 = floori(_n_y_b5+0.5)
	_S.invoke(_n_p_b0,"circle",[_n_X_b8, _n_Y_b9, 4.4, _n_INK])
	_S.invoke(_n_p_b0,"circle",[_n_X_b8, _n_Y_b9, 3.6, _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f4")])
	_S.invoke(_n_p_b0,"px",[(_n_X_b8 - 2), (_n_Y_b9 - 2), _n_WHITE])
	_S.invoke(_n_p_b0,"px",[(_n_X_b8 - 1), (_n_Y_b9 - 2), _S.index_value(_n_C_b3,7)])
	_S.invoke(_n_p_b0,"glow",[_n_x_b4, _n_y_b5, (16 + (3 * _n_beat_b6)), _S.index_value(_n_C_b3,5), (0.36 + (0.14 * _n_beat_b6))])
	var _n_g_b10 = fmod(((float(_n_t_b1)/_S.named_value(_n_meta,"duration")) * 3),1)
	if _S.truth((_n_g_b10 < 0.12)):
		_S.call_value(_n_glint,[_n_p_b0, (_n_X_b8 - 2), (_n_Y_b9 - 2), (2.4 * sin(((float(_n_g_b10)/0.12) * PI))), _n_WHITE, 0.4])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_d_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	return ((_S.index_value(_n_C,5) if _S.truth((cos((_n_a_b1 + 2.4)) > 0.3)) else _S.index_value(_n_C,3)) if _S.truth((_n_d_b0 > 0.72)) else ((_S.index_value(_n_C,6) if _S.truth((cos((_n_a_b1 + 2.4)) > (-0.2))) else _S.index_value(_n_C,5)) if _S.truth((_n_d_b0 > 0.4)) else _n_WHITE))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_A = _S.read(_parent,"A")
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_B = _S.read(_parent,"B")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_a_b1 = ((float(_n_t_b0)/_S.named_value(_n_meta,"duration")) * _n_TAU)
	return [(_n_A * sin(_n_a_b1)), (((-_n_HOVER) + ((_n_B * sin(_n_a_b1)) * cos(_n_a_b1))) - (1.2 * cos((_n_a_b1 * 2))))]
	return null
