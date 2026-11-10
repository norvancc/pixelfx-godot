@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/divine-shield.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f1":"shield_lattice","_f3":"shield_film","_f7":"shield_draw"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "GOLD", _S.import_value("fx/holy/_lib.js", "GOLD"))
	_S.define(_e, "oval", _S.import_value("fx/holy/_lib.js", "oval"))
	_S.define(_e, "shapeOf", _S.import_value("fx/holy/_lib.js", "shapeOf"))
	_S.define(_e, "onSphere", _S.function_value(_e, "_f0"))
	_S.define(_e, "lattice", _S.function_value(_e, "_f1"))
	_S.define(_e, "film", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Divine shield"}, {"desc": "A bubble of gold light round the character: a bright rim and a thin gold film, meridians turning like a slow globe, a sheen sweeping across and sparkles winking on it."}, {"tags": ["holy", "shield", "bubble", "barrier", "buff", "character", "loop"]}, {"size": [88, 84]}, {"origin": [44, 68]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "GOLD")}, {"radius": 29}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "BRACE", _S.merge([{"turn": 0.7}, {"crouch": 3}, {"lean": 1}, {"fx": 5}, {"fy": _S.unary("-", 33)}, {"bx": 10}, {"by": _S.unary("-", 20)}, {"ffx": 4}, {"fbx": _S.unary("-", 2)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "BRACE")], [0.6, _S.merge([_S.read(_e, "BRACE"), {"crouch": 4}])], [1.2, _S.merge([_S.read(_e, "BRACE"), {"fy": _S.unary("-", 35)}, {"crouch": 3}])], [1.8, _S.merge([_S.read(_e, "BRACE"), {"crouch": 4}])], [2.4, _S.read(_e, "BRACE")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "CY", _S.unary("-", 22))
	_S.define(_e, "TILT", 0.34)
	_S.define(_e, "N", 4)
	_S.define(_e, "FLOOR_SY", 0.26)
	_S.define(_e, "sheen", _S.function_value(_e, "_f14"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_CY = _S.read(_parent,"CY")
	var _n_TILT = _S.read(_parent,"TILT")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_lat_b1 = _S.arg(_args,1)
	var _n_lon_b2 = _S.arg(_args,2)
	var _n_X_b3 = ((_n_r_b0 * cos(_n_lat_b1)) * sin(_n_lon_b2))
	var _n_Y_b4 = (_n_r_b0 * sin(_n_lat_b1))
	var _n_Z_b5 = ((_n_r_b0 * cos(_n_lat_b1)) * cos(_n_lon_b2))
	return [_n_X_b3, (_n_CY - ((_n_Y_b4 * cos(_n_TILT)) - (_n_Z_b5 * sin(_n_TILT)))), ((_n_Y_b4 * sin(_n_TILT)) + (_n_Z_b5 * cos(_n_TILT)))]
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "back", _S.arg(_args, 3))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "r", _S.prop(_S.read(_e, "o"), "radius"))
	_S.define(_e, "T", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "phi", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "N"))))
	_S.define(_e, "sw", _S.call_value(_S.read(_e, "sheen"), [_S.read(_e, "t"), _S.read(_e, "T")]))
	_S.define(_e, "seen", _S.construct(_S.read(_e, "Map"), []))
	_S.define(_e, "dot", _S.function_value(_e, "_f2"))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "k"), _S.binary("*", 2, _S.read(_v0, "N")))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "lon", _S.binary("+", _S.read(_v1, "phi"), _S.binary("/", _S.binary("*", _S.read(_v1, "k"), _S.prop(_S.read(_v1, "Math"), "PI")), _S.read(_v1, "N"))))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "lat", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v2, "Math"), "PI")), 2))
		while _S.truth(_S.binary("<=", _S.read(_v2, "lat"), _S.binary("/", _S.prop(_S.read(_v2, "Math"), "PI"), 2))):
			_S.call_value(_S.read(_v2, "dot"), _S.concat([_S.array(_S.call_value(_S.read(_v2, "onSphere"), [_S.read(_v2, "r"), _S.read(_v2, "lat"), _S.read(_v2, "lon")]))]))
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "lat", _S.binary("/", 0.7, _S.read(_v2, "r")), "+=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "k", 1, "+=", true)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "lon", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "lon"), _S.read(_v3, "TAU"))):
		_S.call_value(_S.read(_v3, "dot"), _S.concat([_S.array(_S.call_value(_S.read(_v3, "onSphere"), [_S.read(_v3, "r"), 0, _S.read(_v3, "lon")]))]))
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "lon", _S.binary("/", 0.7, _S.read(_v3, "r")), "+=", false)
	for _v4 in _S.array(_S.invoke(_S.read(_e, "seen"), "values", [])):
		var _v5 = _S.scope(_e)
		var _v6 = _v4
		_S.define(_v5, "x", _S.prop(_v6, 0))
		_S.define(_v5, "y", _S.prop(_v6, 1))
		_S.define(_v5, "f", _S.prop(_v6, 2))
		_S.define(_v5, "hot", _S.prop(_v6, 3))
		var _v7 = _S.scope(_v5)
		if _S.truth(_S.read(_v7, "back")):
			_S.invoke(_S.read(_v7, "p"), "blend", [_S.read(_v7, "x"), _S.read(_v7, "y"), _S.prop(_S.read(_v7, "C"), 4), 0.32])
		else:
			if _S.truth(_S.read(_v7, "hot")):
				_S.invoke(_S.read(_v7, "p"), "px", [_S.read(_v7, "x"), _S.read(_v7, "y"), _S.read(_v7, "WHITE")])
			else:
				if _S.truth(_S.binary("<", _S.read(_v7, "f"), 0.4)):
					_S.invoke(_S.read(_v7, "p"), "px", [_S.read(_v7, "x"), _S.read(_v7, "y"), _S.prop(_S.read(_v7, "C"), 6)])
				else:
					_S.invoke(_S.read(_v7, "p"), "blend", [_S.read(_v7, "x"), _S.read(_v7, "y"), (_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v7, "f"), 0.7)) else _S.prop(_S.read(_v7, "C"), 5)), (0.8 if _S.truth(_S.binary("<", _S.read(_v7, "f"), 0.7)) else 0.55)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_back = _S.read(_parent,"back")
	var _n_r = _S.read(_parent,"r")
	var _n_CY = _S.read(_parent,"CY")
	var _n_sw = _S.read(_parent,"sw")
	var _n_seen = _S.read(_parent,"seen")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_z_b2 = _S.arg(_args,2)
	if _S.truth(_S.binary("!==",(_n_z_b2 < 0),_n_back)):
		return null
	var _n_key_b3 = ((floori(_n_x_b0) * 1000) + floori(_n_y_b1))
	var _n_f_b4 = (float(absf(_n_z_b2))/_n_r)
	var _n_q_b5 = (float((_n_x_b0 - (_n_y_b1 - _n_CY)))/(_n_r * 1.414))
	var _n_hot_b6 = (1 if _S.truth((absf((_n_q_b5 - _n_sw)) < 0.12)) else 0)
	var _n_v_b7 = _S.invoke(_n_seen,"get",[_n_key_b3])
	if _S.truth((not _S.truth(_n_v_b7) if _S.truth(not _S.truth(_n_v_b7)) else (_n_f_b4 < _S.index_value(_n_v_b7,2)))):
		_S.invoke(_n_seen,"set",[_n_key_b3, [_n_x_b0, _n_y_b1, _n_f_b4, (_n_hot_b6 if _S.truth(_n_hot_b6) else (_S.index_value(_n_v_b7,3) if _S.truth(_n_v_b7) else 0))]])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_sheen = _S.read(_parent,"sheen")
	var _n_meta = _S.read(_parent,"meta")
	var _n_CY = _S.read(_parent,"CY")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_back_b3 = _S.arg(_args,3)
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_r_b5 = _S.named_value(_n_o_b2,"radius")
	var _n_sw_b6 = _S.call_value(_n_sheen,[_n_t_b1, _S.named_value(_n_meta,"duration")])
	_S.invoke(_n_p_b0,"each",[((-_n_r_b5) - 1), ((_n_CY - _n_r_b5) - 1), (_n_r_b5 + 1), ((_n_CY + _n_r_b5) + 1), _S.function_value(_S.capture(_parent,{"r":_n_r_b5,"sw":_n_sw_b6,"back":_n_back_b3,"p":_n_p_b0,"C":_n_C_b4,"this":_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_CY = _S.read(_parent,"CY")
	var _n_r = _S.read(_parent,"r")
	var _n_sw = _S.read(_parent,"sw")
	var _n_back = _S.read(_parent,"back")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_sx_b2 = _S.arg(_args,2)
	var _n_sy_b3 = _S.arg(_args,3)
	var _n_d_b4 = (float(_S.Bridge.hypot([_n_x_b0, (_n_y_b1 - _n_CY)]))/_n_r)
	if _S.truth((_n_d_b4 >= 1)):
		return null
	var _n_q_b5 = (float((_n_x_b0 - (_n_y_b1 - _n_CY)))/(_n_r * 1.414))
	var _n_hot_b6 = maxf(0,(1 - (float(absf((_n_q_b5 - _n_sw)))/0.22)))
	var _n_a_b7 = (((0.07 if _S.truth(_n_back) else 0.03) + (0.26 * pow(_n_d_b4,6))) + ((0.2 * _n_hot_b6) * (0.3 if _S.truth(_n_back) else 1)))
	_S.invoke(_n_p,"blendPx",[_n_sx_b2, _n_sy_b3, (_S.index_value(_n_C,6) if _S.truth((not _S.truth(_n_back) if _S.truth((_n_hot_b6 > 0.5)) else (_n_hot_b6 > 0.5))) else _S.index_value(_n_C,5)), _n_a_b7])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_CY = _S.read(_parent,"CY")
	var _n_film = _S.read(_parent,"film")
	var _n_lattice = _S.read(_parent,"lattice")
	var _n_FLOOR_SY = _S.read(_parent,"FLOOR_SY")
	var _n_oval = _S.read(_parent,"oval")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_r_b4 = _S.named_value(_n_o_b2,"radius")
	var _n_rf_b5 = sqrt(((_n_r_b4 * _n_r_b4) - (_n_CY * _n_CY)))
	_S.call_value(_n_film,[_n_p_b0, _n_t_b1, _n_o_b2, true])
	_S.call_value(_n_lattice,[_n_p_b0, _n_t_b1, _n_o_b2, true])
	_S.call_value(_n_oval,[_n_p_b0, 0, 0, _n_rf_b5, (_n_rf_b5 * _n_FLOOR_SY), _S.index_value(_n_C_b3,5), 0.8, _S.function_value(_S.capture(_parent,{"this":_this}),"_f6")])
	_S.invoke(_n_p_b0,"glow",[0, _n_CY, (_n_r_b4 * 1.1), _S.index_value(_n_C_b3,4), 0.14])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_CY = _S.read(_parent,"CY")
	var _n_shapeOf = _S.read(_parent,"shapeOf")
	var _n_film = _S.read(_parent,"film")
	var _n_lattice = _S.read(_parent,"lattice")
	var _n_sheen = _S.read(_parent,"sheen")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_N = _S.read(_parent,"N")
	var _n_onSphere = _S.read(_parent,"onSphere")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_FLOOR_SY = _S.read(_parent,"FLOOR_SY")
	var _n_oval = _S.read(_parent,"oval")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_r_b4 = _S.named_value(_n_o_b2,"radius")
	var _n_T_b5 = _S.named_value(_n_meta,"duration")
	var _n_rf_b6 = sqrt(((_n_r_b4 * _n_r_b4) - (_n_CY * _n_CY)))
	var _n_A_b7 = _S.named_value(_n_o_b2,"actor")
	if _S.truth(_n_A_b7):
		for _iter_0 in _S.array(_S.named_value(_S.call_value(_n_shapeOf,[_n_A_b7]),"out")):
			var _tuple_1 = _iter_0
			var _n_x_b12 = _S.prop(_tuple_1,0)
			var _n_y_b13 = _S.prop(_tuple_1,1)
			_S.invoke(_n_p_b0,"light",[_n_x_b12, _n_y_b13, _S.index_value(_n_C_b3,5), 0.3])
	_S.call_value(_n_film,[_n_p_b0, _n_t_b1, _n_o_b2, false])
	_S.call_value(_n_lattice,[_n_p_b0, _n_t_b1, _n_o_b2, false])
	var _n_sw_b8 = _S.call_value(_n_sheen,[_n_t_b1, _n_T_b5])
	if true:
		var _n_j_b14 = 0
		var _n_n_b15 = ceili(((_n_r_b4 * _n_TAU) * 1.4))
		while _S.truth((_n_j_b14 < _n_n_b15)):
			var _n_g_b16 = ((float(_n_j_b14)/_n_n_b15) * _n_TAU)
			var _n_x_b17 = (cos(_n_g_b16) * _n_r_b4)
			var _n_y_b18 = (_n_CY + (sin(_n_g_b16) * _n_r_b4))
			var _n_q_b19 = (float((_n_x_b17 - (_n_y_b18 - _n_CY)))/(_n_r_b4 * 1.414))
			var _n_lit_b20 = cos((_n_g_b16 + 2.36))
			var _n_hot_b21 = (absf((_n_q_b19 - _n_sw_b8)) < 0.15)
			_S.invoke(_n_p_b0,"dot",[_n_x_b17, _n_y_b18, (_n_WHITE if _S.truth((_n_hot_b21 if _S.truth(_n_hot_b21) else (_n_lit_b20 > 0.75))) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_lit_b20 > (-0.2))) else _S.index_value(_n_C_b3,5))), 1])
			_S.invoke(_n_p_b0,"dot",[(cos(_n_g_b16) * (_n_r_b4 - 1)), (_n_CY + (sin(_n_g_b16) * (_n_r_b4 - 1))), _S.index_value(_n_C_b3,4), (0.35 + (0.3 * _n_lit_b20))])
			_n_j_b14 += 1.0
	_S.invoke(_n_p_b0,"glowRing",[0, _n_CY, _n_r_b4, 6, _S.index_value(_n_C_b3,4), 0.32])
	var _n_phi_b9 = ((float(_n_t_b1)/_n_T_b5) * (float(PI)/_n_N))
	if true:
		var _n_k_b22 = 0
		while _S.truth((_n_k_b22 < (2 * _n_N))):
			var _tuple_2 = _S.call_value(_n_onSphere,[_n_r_b4, 0, (_n_phi_b9 + (float((_n_k_b22 * PI))/_n_N))])
			var _n_x_b23 = _S.prop(_tuple_2,0)
			var _n_y_b24 = _S.prop(_tuple_2,1)
			var _n_z_b25 = _S.prop(_tuple_2,2)
			if _S.truth((_n_z_b25 < (_n_r_b4 * 0.15))):
				_n_k_b22 += 1.0
				continue
			_S.invoke(_n_p_b0,"px",[_n_x_b23, _n_y_b24, _n_WHITE])
			if _S.truth((_n_z_b25 > (_n_r_b4 * 0.45))):
				for _iter_3 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
					var _tuple_4 = _iter_3
					var _n_dx_b26 = _S.prop(_tuple_4,0)
					var _n_dy_b27 = _S.prop(_tuple_4,1)
					_S.invoke(_n_p_b0,"blend",[(_n_x_b23 + _n_dx_b26), (_n_y_b24 + _n_dy_b27), _S.index_value(_n_C_b3,6), 0.7])
			_S.invoke(_n_p_b0,"glow",[_n_x_b23, _n_y_b24, 4, _S.index_value(_n_C_b3,5), 0.3])
			_n_k_b22 += 1.0
	var _tuple_5 = _S.call_value(_n_onSphere,[_n_r_b4, (float(PI)/2), 0])
	var _n_px0_b10 = _S.prop(_tuple_5,0)
	var _n_py0_b11 = _S.prop(_tuple_5,1)
	_S.call_value(_n_sparkle,[_n_p_b0, _n_px0_b10, _n_py0_b11, (2 + floori((1.5 + (1.5 * sin((((float(_n_t_b1)/_n_T_b5) * _n_TAU) * 2))))+0.5)), _n_WHITE, _S.index_value(_n_C_b3,6), 0.45])
	for _iter_6 in _S.array([0, PI]):
		var _n_off_b28 = _iter_6
		var _n_g_b29 = ((((float(_n_t_b1)/_n_T_b5) * _n_TAU) + _n_off_b28) + 0.8)
		_S.call_value(_n_sparkle,[_n_p_b0, (cos(_n_g_b29) * _n_r_b4), (_n_CY + (sin(_n_g_b29) * _n_r_b4)), 2, _n_WHITE, _S.index_value(_n_C_b3,6), 0.4])
	if true:
		var _n_g_b30 = 3.55
		while _S.truth((_n_g_b30 < 4.2)):
			_S.invoke(_n_p_b0,"px",[((cos(_n_g_b30) * _n_r_b4) * 0.74), (_n_CY + ((sin(_n_g_b30) * _n_r_b4) * 0.74)), (_n_WHITE if _S.truth(((_n_g_b30 < 4.05) if _S.truth((_n_g_b30 > 3.7)) else (_n_g_b30 > 3.7))) else _S.index_value(_n_C_b3,6))])
			_n_g_b30 += 0.04
	_S.invoke(_n_p_b0,"px",[((cos(3.4) * _n_r_b4) * 0.62), (_n_CY + ((sin(3.4) * _n_r_b4) * 0.62)), _n_WHITE])
	if true:
		var _n_g_b31 = 0.45
		while _S.truth((_n_g_b31 < 0.8)):
			_S.invoke(_n_p_b0,"dot",[((cos(_n_g_b31) * _n_r_b4) * 0.8), (_n_CY + ((sin(_n_g_b31) * _n_r_b4) * 0.8)), _S.index_value(_n_C_b3,5), 0.6])
			_n_g_b31 += 0.05
	_S.call_value(_n_oval,[_n_p_b0, 0, 0, _n_rf_b6, (_n_rf_b6 * _n_FLOOR_SY), _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f8"), 1, _S.function_value(_S.capture(_parent,{"this":_this}),"_f9")])
	if true:
		var _n_i_b32 = (-2)
		while _S.truth((_n_i_b32 <= 2)):
			_S.invoke(_n_p_b0,"glow",[((_n_i_b32 * _n_rf_b6) * 0.5), 0, 12, _S.index_value(_n_C_b3,4), 0.18])
			_n_i_b32 += 1.0
	_S.call_value(_n_cycle,[_n_t_b1, _n_T_b5, 9, _S.named_value(_n_o_b2,"seed"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f10"), _S.function_value(_S.capture(_parent,{"r":_n_r_b4,"phi":_n_phi_b9,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f11")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_T_b5, 12, (_S.named_value(_n_o_b2,"seed") + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f12"), _S.function_value(_S.capture(_parent,{"r":_n_r_b4,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f13")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_g_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((sin(_n_g_b0) > 0.6)) else _S.index_value(_n_C,6))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.35, 0.6])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_onSphere = _S.read(_parent,"onSphere")
	var _n_r = _S.read(_parent,"r")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_phi = _S.read(_parent,"phi")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _tuple_0 = _S.call_value(_n_onSphere,[_n_r, _S.invoke(_n_R_b2,"range",[(-1.2), 1.3]), (_S.invoke(_n_R_b2,"range",[0, _n_TAU]) + _n_phi)])
	var _n_x_b3 = _S.prop(_tuple_0,0)
	var _n_y_b4 = _S.prop(_tuple_0,1)
	var _n_z_b5 = _S.prop(_tuple_0,2)
	var _n_k_b6 = sin(((float(_n_age_b0)/_n_life_b1) * PI))
	if _S.truth((_n_z_b5 < 0)):
		return null
	_S.call_value(_n_sparkle,[_n_p, _n_x_b3, _n_y_b4, (1 + ((2.5 * _n_k_b6) * _S.invoke(_n_R_b2,"range",[0.6, 1]))), _n_WHITE, _S.index_value(_n_C,6), (0.45 * _n_k_b6)])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[1.2, 2.2])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_r = _S.read(_parent,"r")
	var _n_CY = _S.read(_parent,"CY")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_x0_b3 = (_S.invoke(_n_R_b2,"range",[(-0.7), 0.7]) * _n_r)
	var _n_u_b4 = (float(_n_age_b0)/_n_life_b1)
	var _n_x_b5 = (_n_x0_b3 + (sin(((_n_u_b4 * 6) + _S.invoke(_n_R_b2,"range",[0, 6]))) * 2))
	var _n_y_b6 = ((_n_CY + (_n_r * 0.75)) - ((_n_u_b4 * _n_r) * 1.4))
	if _S.truth((_S.Bridge.hypot([_n_x_b5, (_n_y_b6 - _n_CY)]) > (_n_r - 2))):
		return null
	_S.invoke(_n_p,"dot",[_n_x_b5, _n_y_b6, (_S.index_value(_n_C,6) if _S.truth((_n_u_b4 < 0.5)) else _S.index_value(_n_C,5)), sin((_n_u_b4 * PI))])
	_S.invoke(_n_p,"light",[_n_x_b5, _n_y_b6, _S.index_value(_n_C,5), (0.4 * sin((_n_u_b4 * PI)))])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	var _n_T_b1 = _S.arg(_args,1)
	return ((-1.7) + (3.4 * clampf((float(fmod((float(_n_t_b0)/_n_T_b1),1))/0.55),0.0,1.0)))
	return null
