@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/loot-beam.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "pool", _S.import_value("fx/pickups/_lib.js", "pool"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "sword", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f6"))
	_S.define(_e, "ring", _S.function_value(_e, "_f7"))
	_S.define(_e, "column", _S.function_value(_e, "_f9"))
	_S.define(_e, "motes", _S.function_value(_e, "_f10"))
	_S.define(_e, "meta", _S.merge([{"name": "Loot beam"}, {"desc": "A dropped sword in a tall pillar of rarity light: a white core thinning to the sky, rings pulsing across the floor, motes streaming up, a glint racing up the shaft."}, {"tags": ["pickup", "loot", "beam", "rarity", "drop", "item", "loop"]}, {"size": [96, 176]}, {"origin": [48, 162]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#140a24", "#2c1250", "#4b1d86", "#7330c0", "#a050f0", "#c890ff", "#ecd4ff", "#ffffff"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "H", 150)
	_S.define(_e, "RINGS", [0.08, 0.58])
	_S.define(_e, "STEEL", _S.invoke(["#151726", "#2c3149", "#4f5775", "#8a93b3", "#d6dcef", "#ffffff"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "GOLD", _S.invoke(["#3a2008", "#7a4a10", "#b8801c", "#e8b432", "#ffe27a", "#fff6cc"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "LEATHER", _S.invoke(["#1e0f0e", "#3e2016", "#633620"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#0d0b14"]))
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [40, 24]))
	_S.define(_e, "since", _S.function_value(_e, "_f13"))
	_S.define(_e, "OX", 4)
	_S.define(_e, "axis", _S.function_value(_e, "_f14"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "edgeLit", _S.function_value(_e, "_f1"))
	_S.invoke(_S.read(_e, "L"), "begin", [_S.unary("-", 16), _S.unary("-", 12)])
	_S.set_prop(_S.read(_e, "L"), "set", _S.call_value(_S.function_value(_e, "_f2"), [_S.prop(_S.invoke(_S.read(_e, "Object"), "getPrototypeOf", [_S.read(_e, "L")]), "set")]), "=", false)
	var _v0 = _S.scope(_e)
	_S.define(_v0, "x", _S.unary("-", 11))
	while _S.truth(_S.binary("<=", _S.read(_v0, "x"), 10)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.call_value(_S.read(_v1, "axis"), [_S.read(_v1, "x")]))
		if _S.truth(_S.binary("<=", _S.read(_v1, "x"), _S.unary("-", 9))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "m", _S.binary("+", _S.read(_v2, "x"), 10))
			if _S.truth(_S.binary("===", _S.read(_v2, "m"), 0)):
				_S.last([_S.invoke(_S.read(_v2, "L"), "set", [_S.read(_v2, "x"), _S.binary("-", _S.read(_v2, "a"), 1), _S.prop(_S.read(_v2, "C"), 6)]), _S.invoke(_S.read(_v2, "L"), "set", [_S.read(_v2, "x"), _S.read(_v2, "a"), _S.read(_v2, "WHITE")]), _S.invoke(_S.read(_v2, "L"), "set", [_S.read(_v2, "x"), _S.binary("+", _S.read(_v2, "a"), 1), _S.prop(_S.read(_v2, "C"), 4)])])
			else:
				_S.invoke(_S.read(_v2, "L"), "set", [_S.read(_v2, "x"), _S.read(_v2, "a"), (_S.prop(_S.read(_v2, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v2, "m"), 0)) else _S.prop(_S.read(_v2, "C"), 3))])
		else:
			if _S.truth(_S.binary("<=", _S.read(_v1, "x"), _S.unary("-", 5))):
				var _v3 = _S.scope(_v1)
				_S.invoke(_S.read(_v3, "L"), "set", [_S.read(_v3, "x"), _S.read(_v3, "a"), _S.prop(_S.read(_v3, "LEATHER"), (2 if _S.truth(_S.binary("%", _S.read(_v3, "x"), 2)) else 1))])
				_S.invoke(_S.read(_v3, "L"), "set", [_S.read(_v3, "x"), _S.binary("+", _S.read(_v3, "a"), 1), _S.prop(_S.read(_v3, "LEATHER"), (1 if _S.truth(_S.binary("%", _S.read(_v3, "x"), 2)) else 0))])
			else:
				if _S.truth(_S.binary("<=", _S.read(_v1, "x"), _S.unary("-", 3))):
					var _v4 = _S.scope(_v1)
					var _v5 = _S.scope(_v4)
					_S.define(_v5, "y", _S.binary("-", _S.read(_v5, "a"), 3))
					while _S.truth(_S.binary("<=", _S.read(_v5, "y"), _S.binary("+", _S.read(_v5, "a"), 3))):
						var _v6 = _S.scope(_v5)
						_S.define(_v6, "end", _S.logical("||", _S.binary("===", _S.read(_v6, "y"), _S.binary("-", _S.read(_v6, "a"), 3)), func(): return _S.binary("===", _S.read(_v6, "y"), _S.binary("+", _S.read(_v6, "a"), 3))))
						_S.invoke(_S.read(_v6, "L"), "set", [_S.read(_v6, "x"), _S.read(_v6, "y"), ((_S.prop(_S.read(_v6, "C"), 6) if _S.truth(_S.binary("===", _S.read(_v6, "x"), _S.unary("-", 4))) else _S.prop(_S.read(_v6, "C"), 4)) if _S.truth(_S.binary("===", _S.read(_v6, "y"), _S.read(_v6, "a"))) else ((_S.prop(_S.read(_v6, "GOLD"), 3) if _S.truth(_S.read(_v6, "end")) else _S.call_value(_S.read(_v6, "mix"), [_S.prop(_S.read(_v6, "GOLD"), 4), _S.prop(_S.read(_v6, "C"), 6), 0.3])) if _S.truth(_S.binary("===", _S.read(_v6, "x"), _S.unary("-", 4))) else (_S.prop(_S.read(_v6, "GOLD"), 0) if _S.truth(_S.read(_v6, "end")) else _S.prop(_S.read(_v6, "GOLD"), 1))))])
						_v5 = _S.iteration(_v5)
						_S.write(_v5, "y", 1, "+=", true)
				else:
					var _v7 = _S.scope(_v1)
					_S.define(_v7, "tip", _S.binary("-", _S.read(_v7, "x"), 8))
					if _S.truth(_S.binary("<", _S.read(_v7, "tip"), 1)):
						_S.invoke(_S.read(_v7, "L"), "set", [_S.read(_v7, "x"), _S.binary("-", _S.read(_v7, "a"), 1), _S.call_value(_S.read(_v7, "edgeLit"), [_S.read(_v7, "x")])])
					if _S.truth(_S.binary("<", _S.read(_v7, "tip"), 2)):
						_S.invoke(_S.read(_v7, "L"), "set", [_S.read(_v7, "x"), _S.read(_v7, "a"), (_S.call_value(_S.read(_v7, "edgeLit"), [_S.read(_v7, "x")]) if _S.truth(_S.binary("===", _S.read(_v7, "tip"), 1)) else _S.call_value(_S.read(_v7, "mix"), [_S.prop(_S.read(_v7, "STEEL"), 3), _S.prop(_S.read(_v7, "C"), 4), 0.2]))])
					_S.invoke(_S.read(_v7, "L"), "set", [_S.read(_v7, "x"), _S.binary("+", _S.read(_v7, "a"), 1), (_S.prop(_S.read(_v7, "STEEL"), 2) if _S.truth(_S.binary("===", _S.read(_v7, "tip"), 2)) else _S.prop(_S.read(_v7, "STEEL"), 0))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "x", 1, "+=", true)
	_S.delete_prop(_S.read(_e, "L"), "set")
	_S.invoke(_S.invoke(_S.read(_e, "L"), "outline", [_S.read(_e, "INK")]), "draw", [_S.read(_e, "p")])
	_S.define(_e, "g", _S.binary("/", _S.binary("-", _S.read(_e, "ph"), 0.72), 0.16))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "g"), 0), func(): return _S.binary("<", _S.read(_e, "g"), 1))):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "x", _S.binary("+", _S.unary("-", 1), _S.binary("*", 9, _S.invoke(_S.read(_v8, "ease"), "inOutSine", [_S.read(_v8, "g")]))))
		_S.call_value(_S.read(_v8, "glint"), [_S.read(_v8, "p"), _S.binary("+", _S.read(_v8, "x"), _S.read(_v8, "OX")), _S.binary("-", _S.call_value(_S.read(_v8, "axis"), [_S.invoke(_S.read(_v8, "Math"), "round", [_S.read(_v8, "x")])]), 1), _S.binary("*", 2.6, _S.invoke(_S.read(_v8, "Math"), "sin", [_S.binary("*", _S.read(_v8, "g"), _S.prop(_S.read(_v8, "Math"), "PI"))])), _S.read(_v8, "WHITE"), 0.5])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_OX = _S.read(_parent,"OX")
	var _n_STEEL = _S.read(_parent,"STEEL")
	var _n_x_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,6) if _S.truth((absf(((_n_x_b0 + _n_OX) - 0.5)) < 6)) else _S.ColorFX.mix(_S.index_value(_n_STEEL,4),_S.index_value(_n_C,6),0.45))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_set_b0 = _S.arg(_args,0)
	return _S.function_value(_S.capture(_parent,{"set":_n_set_b0,"this":_n_this}),"_f3")
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_set = _S.read(_parent,"set")
	var _n_L = _S.read(_parent,"L")
	var _n_OX = _S.read(_parent,"OX")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	return _S.invoke(_n_set,"call",[_n_L, (_n_x_b0 + _n_OX), _n_y_b1, _n_c_b2])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_pool = _S.read(_parent,"pool")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ring = _S.read(_parent,"ring")
	var _n_since = _S.read(_parent,"since")
	var _n_RINGS = _S.read(_parent,"RINGS")
	var _n_column = _S.read(_parent,"column")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_T_b4 = _S.named_value(_n_meta,"duration")
	var _n_ph_b5 = (float(_n_t_b1)/_n_T_b4)
	_S.call_value(_n_pool,[_n_p_b0, 0.5, 0, 34, 5, _S.index_value(_n_C_b3,4), 0.14])
	_S.invoke(_n_p_b0,"shade",[(-30), (-0.5), 31, 6, _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f5")])
	if true:
		var _n_x_b6 = (-16)
		while _S.truth((_n_x_b6 <= 16)):
			var _n_q_b7 = (float(absf(_n_x_b6))/16.5)
			var _n_a_b8 = (1.35 - (_n_q_b7 * 1.25))
			_S.invoke(_n_p_b0,"dot",[_n_x_b6, 0, (_n_WHITE if _S.truth((_n_q_b7 < 0.3)) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_q_b7 < 0.6)) else _S.index_value(_n_C_b3,5))), _n_a_b8])
			if _S.truth((_n_q_b7 < 0.75)):
				_S.invoke(_n_p_b0,"dot",[_n_x_b6, 1, (_S.index_value(_n_C_b3,6) if _S.truth((_n_q_b7 < 0.3)) else (_S.index_value(_n_C_b3,5) if _S.truth((_n_q_b7 < 0.55)) else _S.index_value(_n_C_b3,4))), (_n_a_b8 * 0.8)])
			if _S.truth((_n_q_b7 < 0.4)):
				_S.invoke(_n_p_b0,"dot",[_n_x_b6, 2, _S.index_value(_n_C_b3,4), (_n_a_b8 * 0.5)])
			_n_x_b6 += 1.0
	if true:
		var _n_k_b9 = 0
		while _S.truth((_n_k_b9 < _S.prop(_n_RINGS,"length"))):
			_S.call_value(_n_ring,[_n_p_b0, _n_C_b3, (_S.call_value(_n_since,[_n_ph_b5, _n_k_b9]) * _n_T_b4), true])
			_n_k_b9 += 1.0
	_S.call_value(_n_column,[_n_p_b0, _n_C_b3, _n_t_b1, _n_T_b4])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (float((_n_x_b0 - 0.5))/30)
	var _n_dy_b4 = (float(_n_y_b1)/6)
	var _n_d_b5 = ((_n_dx_b3 * _n_dx_b3) + (_n_dy_b4 * _n_dy_b4))
	if _S.truth((_n_d_b5 >= 1)):
		return null
	_S.set_prop(_n_out_b2,"l",_S.index_value(_n_C,5),"=")
	_S.set_prop(_n_out_b2,"k",(0.4 * pow((1 - sqrt(_n_d_b5)),2)),"=")
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_OX = _S.read(_parent,"OX")
	var _n_blobShadow = _S.read(_parent,"blobShadow")
	var _n_sword = _S.read(_parent,"sword")
	var _n_ring = _S.read(_parent,"ring")
	var _n_since = _S.read(_parent,"since")
	var _n_RINGS = _S.read(_parent,"RINGS")
	var _n_motes = _S.read(_parent,"motes")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_T_b4 = _S.named_value(_n_meta,"duration")
	var _n_ph_b5 = (float(_n_t_b1)/_n_T_b4)
	_S.call_value(_n_blobShadow,[_n_p_b0, (_n_OX - 0.5), 12.5, 0.95])
	_S.call_value(_n_sword,[_n_p_b0, _n_C_b3, _n_ph_b5])
	if true:
		var _n_k_b6 = 0
		while _S.truth((_n_k_b6 < _S.prop(_n_RINGS,"length"))):
			_S.call_value(_n_ring,[_n_p_b0, _n_C_b3, (_S.call_value(_n_since,[_n_ph_b5, _n_k_b6]) * _n_T_b4), false])
			_n_k_b6 += 1.0
	_S.call_value(_n_motes,[_n_p_b0, _n_C_b3, _n_t_b1, _n_T_b4, _S.named_value(_n_o_b2,"seed")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_a_b2 = _S.arg(_args,2)
	var _n_back_b3 = _S.arg(_args,3)
	var _n_L1_b4 = 1.1
	var _n_k_b5 = (float(_n_a_b2)/_n_L1_b4)
	if _S.truth((_n_k_b5 >= 1)):
		return null
	var _n_r_b6 = (3 + (24 * _S.invoke(_n_ease,"outCubic",[_n_k_b5])))
	var _n_th_b7 = maxf(1,(3.2 * (1 - _n_k_b5)))
	_S.call_value(_n_band,[_n_p_b0, 0.5, 0, _n_r_b6, 0.2, _n_th_b7, minf(1,(1.25 * (1 - _n_k_b5))), [_S.index_value(_n_C_b1,2), _S.index_value(_n_C_b1,4), _S.index_value(_n_C_b1,5), _S.index_value(_n_C_b1,6)], _S.function_value(_S.capture(_parent,{"back":_n_back_b3,"this":_this}),"_f8"), (_n_k_b5 < 0.12)])
	if _S.truth(not _S.truth(_n_back_b3)):
		for _iter_0 in _S.array([(-1), 1]):
			var _n_s_b8 = _iter_0
			_S.invoke(_n_p_b0,"glow",[(0.5 + (_n_s_b8 * _n_r_b6)), (-1), 8, _S.index_value(_n_C_b1,5), (0.35 * (1 - _n_k_b5))])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_back = _S.read(_parent,"back")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.binary("===",(sin(_n_g_b0) < 0),_n_back)
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_since = _S.read(_parent,"since")
	var _n_RINGS = _S.read(_parent,"RINGS")
	var _n_H = _S.read(_parent,"H")
	var _n_ease = _S.read(_parent,"ease")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_glint = _S.read(_parent,"glint")
	var _n_flare = _S.read(_parent,"flare")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_T_b3 = _S.arg(_args,3)
	var _n_ph_b4 = (float(_n_t_b2)/_n_T_b3)
	var _n_beat_b5 = 0
	if true:
		var _n_k_b9 = 0
		while _S.truth((_n_k_b9 < _S.prop(_n_RINGS,"length"))):
			var _n_s_b10 = (_S.call_value(_n_since,[_n_ph_b4, _n_k_b9]) * _n_T_b3)
			_n_beat_b5 = maxf(maxf(_n_beat_b5,(exp(((-_n_s_b10) * 7)) * (1 if _S.truth((_n_s_b10 < 0.5)) else 0))),exp((-((_n_T_b3 - _n_s_b10) * 30))))
			_n_k_b9 += 1.0
	var _n_gq_b6 = (float((_n_ph_b4 - 0.22))/0.42)
	var _n_gh_b7 = ((4 + ((_n_H - 4) * _S.invoke(_n_ease,"inQuad",[_n_gq_b6]))) if _S.truth(((_n_gq_b6 < 1) if _S.truth((_n_gq_b6 > 0)) else (_n_gq_b6 > 0))) else (-100))
	var _n_shimmer_b8 = floori((_n_ph_b4 * 24))
	if true:
		var _n_y_b11 = (-1)
		while _S.truth((_n_y_b11 >= (-_n_H))):
			var _n_h_b12 = ((-_n_y_b11) - 0.5)
			var _n_u_b13 = (float(_n_h_b12)/_n_H)
			var _n_fade_b14 = (1 - _S.MathFX.smooth(0.25,1,_n_u_b13))
			var _n_w_b15 = (((4.2 * (1 - (0.45 * _n_u_b13))) + (3.2 * exp((float((-_n_h_b12))/7)))) * (1 + (0.2 * _n_beat_b5)))
			var _n_seg_b16 = floori(((float(_n_h_b12)/3) + (_S.MathFX.rand([floori((float(_n_h_b12)/9)),5]) * 2)))
			var _n_flick_b17 = floori((_n_ph_b4 * 12))
			if _S.truth(((_S.MathFX.rand([_n_seg_b16,_n_flick_b17,7]) > (1.75 - (_n_u_b13 * 1.65))) if _S.truth((_n_u_b13 > 0.66)) else (_n_u_b13 > 0.66))):
				_n_y_b11 -= 1.0
				continue
			var _n_thread_b18 = ((_S.MathFX.rand([_n_seg_b16,_n_flick_b17,9]) < ((_n_u_b13 - 0.58) * 3)) if _S.truth((_n_u_b13 > 0.58)) else (_n_u_b13 > 0.58))
			var _n_climb_b19 = (1 if _S.truth((fmod((fmod(((float(_n_h_b12)/30) - (_n_ph_b4 * 3)),1) + 1),1) < 0.1)) else 0)
			var _n_trail_b20 = ((1 - (float((_n_gh_b7 - _n_h_b12))/18)) if _S.truth((((_n_gh_b7 - _n_h_b12) < 18) if _S.truth(((_n_gh_b7 - _n_h_b12) > 0)) else ((_n_gh_b7 - _n_h_b12) > 0))) else 0)
			var _n_X_b21 = (0 if _S.truth(_n_thread_b18) else ceili((_n_w_b15 * 1.6)))
			if true:
				var _n_x_b23 = (-_n_X_b21)
				while _S.truth((_n_x_b23 <= _n_X_b21)):
					var _n_q_b24 = (float(absf(_n_x_b23))/_n_w_b15)
					var _n_cw_b25 = (0.2 + (0.18 * (1 - _S.MathFX.smooth(0,0.5,_n_u_b13))))
					var _n_lvl_b26 = (0 if _S.truth((_n_q_b24 < _n_cw_b25)) else (1 if _S.truth((_n_q_b24 < 0.47)) else (2 if _S.truth((_n_q_b24 < 0.72)) else (3 if _S.truth((_n_q_b24 < 1)) else 4))))
					if true:
						var _n_s_b28 = 0
						while _S.truth((_n_s_b28 < 3)):
							var _n_sx_b29 = ((((_n_s_b28 - 1) * _n_w_b15) * 0.55) + (sin((((_n_h_b12 * 0.09) + ((_n_ph_b4 * _n_TAU) * (_n_s_b28 + 1))) + (_n_s_b28 * 2))) * 0.9))
							if _S.truth((absf((_n_x_b23 - _n_sx_b29)) < 0.5)):
								_n_lvl_b26 = maxf(0,(_n_lvl_b26 - 1))
							_n_s_b28 += 1.0
					if _S.truth(_S.logical("&&",(_S.MathFX.rand([_n_y_b11,_n_shimmer_b8,3]) < 0.05),func():return (_n_lvl_b26 > 0))):
						_n_lvl_b26 -= 1.0
					if _S.truth((_n_q_b24 < 0.72)):
						_n_lvl_b26 = maxf(0,((_n_lvl_b26 - _n_climb_b19) - (1 if _S.truth((_n_trail_b20 > 0.3)) else 0)))
					var _n_a_b27 = (1 if _S.truth((_n_lvl_b26 <= 2)) else (((float((1.55 - _n_q_b24))/0.75) * _n_fade_b14) * 1.2))
					if _S.truth((_n_a_b27 <= 0)):
						_n_x_b23 += 1.0
						continue
					_S.invoke(_n_p_b0,"dot",[_n_x_b23, _n_y_b11, ((_S.index_value(_n_C_b1,6) if _S.truth((_n_u_b13 > 0.85)) else _n_WHITE) if _S.truth(_n_thread_b18) else ((_S.index_value(_n_C_b1,6) if _S.truth((_n_u_b13 > 0.8)) else _n_WHITE) if _S.truth(_S.binary("===",_n_lvl_b26,0)) else _S.index_value(_n_C_b1,(7 - _n_lvl_b26)))), _n_a_b27])
					_n_x_b23 += 1.0
			var _n_near_b22 = _S.MathFX.smooth(8,20,_n_h_b12)
			if _S.truth(_S.binary("===",_S.binary("&",_n_y_b11,3),0)):
				_S.invoke(_n_p_b0,"glow",[0.5, _n_y_b11, ((_n_w_b15 * 2.6) + 6), _S.index_value(_n_C_b1,5), (((0.36 * _n_near_b22) * (0.3 + (0.7 * _n_fade_b14))) * (1 + (0.4 * _n_beat_b5)))])
			if _S.truth(_S.binary("===",_S.binary("&",_n_y_b11,15),0)):
				_S.invoke(_n_p_b0,"glow",[0.5, _n_y_b11, 34, _S.index_value(_n_C_b1,4), ((0.2 * _n_near_b22) * (0.25 + (0.75 * _n_fade_b14)))])
			_n_y_b11 -= 1.0
	if _S.truth((_n_gh_b7 > 0)):
		_S.call_value(_n_glint,[_n_p_b0, 0, (-_n_gh_b7), (3.5 * (1 - (_n_gq_b6 * 0.5))), _S.index_value(_n_C_b1,6), 0.6])
		_S.invoke(_n_p_b0,"glow",[0.5, (-_n_gh_b7), 14, _S.index_value(_n_C_b1,5), 0.45])
	_S.call_value(_n_flare,[_n_p_b0, 0.5, (-5), ((8 + (3 * _n_beat_b5)) + (sin(((_n_ph_b4 * _n_TAU) * 4)) * 0.8)), (0.6 + (0.4 * _n_beat_b5)), _n_C_b1])
	_S.invoke(_n_p_b0,"glow",[0.5, (-16), 16, _S.index_value(_n_C_b1,4), (0.12 + (0.25 * _n_beat_b5))])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_T_b3 = _S.arg(_args,3)
	var _n_seed_b4 = _S.arg(_args,4)
	_S.call_value(_n_cycle,[_n_t_b2, _n_T_b3, 30, _n_seed_b4, _S.function_value(_S.capture(_parent,{"this":_this}),"_f11"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b1,"this":_this}),"_f12")])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[1, 2.2])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_H = _S.read(_parent,"H")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_glint = _S.read(_parent,"glint")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_inner_b3 = _S.invoke(_n_r_b2,"chance",[0.3])
	var _n_side_b4 = _S.invoke(_n_r_b2,"sign",[])
	var _n_x0_b5 = (_S.invoke(_n_r_b2,"range",[(-3), 3]) if _S.truth(_n_inner_b3) else (_n_side_b4 * _S.invoke(_n_r_b2,"range",[4, 15])))
	var _n_vy_b6 = (_S.invoke(_n_r_b2,"range",[22, 52]) * (1.5 if _S.truth(_n_inner_b3) else 1))
	var _n_x_b7 = (_n_x0_b5 + (sin(((_n_age_b0 * _S.invoke(_n_r_b2,"range",[1.5, 3.5])) + _S.invoke(_n_r_b2,"range",[0, _n_TAU]))) * 1.6))
	var _n_y_b8 = ((-_S.invoke(_n_r_b2,"range",[1, 10])) - (_n_vy_b6 * _n_age_b0))
	var _n_k_b9 = minf(minf(1,(float(_n_age_b0)/0.25)),(float((_n_life_b1 - _n_age_b0))/0.5))
	if _S.truth(((_n_k_b9 <= 0) if _S.truth((_n_k_b9 <= 0)) else (_n_y_b8 < (-_n_H)))):
		return null
	if _S.truth(_S.invoke(_n_r_b2,"chance",[0.22])):
		var _n_tw_b10 = (0.5 + (0.5 * sin(((_n_age_b0 * _S.invoke(_n_r_b2,"range",[9, 14])) + _S.invoke(_n_r_b2,"range",[0, _n_TAU])))))
		if _S.truth(((_n_tw_b10 * _n_k_b9) > 0.3)):
			_S.call_value(_n_glint,[_n_p, _n_x_b7, _n_y_b8, (2 if _S.truth((_n_tw_b10 > 0.75)) else 1), _S.index_value(_n_C,6), (0.4 * _n_k_b9)])
		return null
	_S.invoke(_n_p,"dot",[_n_x_b7, _n_y_b8, (_n_WHITE if _S.truth(_n_inner_b3) else _S.index_value(_n_C,6)), (_n_k_b9 * 1.5)])
	_S.invoke(_n_p,"dot",[_n_x_b7, (_n_y_b8 + 1), (_S.index_value(_n_C,6) if _S.truth(_n_inner_b3) else _S.index_value(_n_C,4)), _n_k_b9])
	_S.invoke(_n_p,"dot",[_n_x_b7, (_n_y_b8 + 2), _S.index_value(_n_C,3), (_n_k_b9 * 0.6)])
	_S.invoke(_n_p,"glow",[(_n_x_b7 + 0.5), (_n_y_b8 + 0.5), 3.5, _S.index_value(_n_C,5), (0.35 * _n_k_b9)])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_RINGS = _S.read(_parent,"RINGS")
	var _n_ph_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	return fmod((fmod((_n_ph_b0 - _S.index_value(_n_RINGS,_n_k_b1)),1) + 1),1)
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	return floori((((-4) + (float((_n_x_b0 + 4))/7)) + 0.5))
	return null
