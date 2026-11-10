@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/muzzle-smg.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "flyV", _S.import_value("core/index.js", "flyV"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "flashShape", _S.import_value("fx/projectiles/_lib.js", "flashShape"))
	_S.define(_e, "flash", _S.import_value("fx/projectiles/_lib.js", "flash"))
	_S.define(_e, "spark", _S.import_value("fx/projectiles/_lib.js", "spark"))
	_S.define(_e, "cloud", _S.import_value("fx/projectiles/_lib.js", "cloud"))
	_S.define(_e, "casing", _S.import_value("fx/projectiles/_lib.js", "casing"))
	_S.define(_e, "drawCasing", _S.import_value("fx/projectiles/_lib.js", "drawCasing"))
	_S.define(_e, "shots", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "SMG burst"}, {"desc": "Sustained fire at twelve rounds a second: each shot a different spiky flash with a white core, sparks, smoke wisps piling up and drifting, brass casings bouncing on the floor."}, {"tags": ["projectile", "muzzle", "gun", "automatic", "flash", "smoke", "casing", "directional", "loop"]}, {"size": [112, 72]}, {"origin": [56, 66]}, {"duration": 1}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"brass": ["#4a2e10", "#8c5c1c", "#d9a441", "#ffe39a"]}, {"smoke": ["#26222e", "#3b3644", "#544e5e", "#6f6979", "#8c8596", "#aca5b5", "#cbc4d2"]}, {"height": 26}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SHOTS", 12)
	_S.define(_e, "F1", _S.binary("/", 1, 30))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_SHOTS = _S.read(_parent,"SHOTS")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_D_b1 = _S.arg(_args,1)
	var _n_life_b2 = _S.arg(_args,2)
	var _n_fn_b3 = _S.arg(_args,3)
	if true:
		var _n_s_b4 = 0
		while _S.truth((_n_s_b4 < _n_SHOTS)):
			if true:
				var _n_age_b5 = _S.call_value(_n_wrap,[((_n_t_b0 - (float((_n_s_b4 * _n_D_b1))/_n_SHOTS)) + 1e-7), _n_D_b1])
				while _S.truth((_n_age_b5 < _n_life_b2)):
					_S.call_value(_n_fn_b3,[_n_s_b4, _n_age_b5])
					_n_age_b5 += _n_D_b1
			_n_s_b4 += 1.0
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "brass"), 4]))
	_S.define(_e, "SM", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "smoke"), 7]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "MX", 0)
	_S.define(_e, "MY", _S.unary("-", _S.read(_e, "H")))
	_S.define(_e, "SP", [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 3)])
	_S.define(_e, "top", _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 1))
	_S.define(_e, "pop", 0)
	_S.call_value(_S.read(_e, "shots"), [_S.read(_e, "t"), _S.read(_e, "D"), 0.2, _S.function_value(_e, "_f2")])
	_S.define(_e, "puffs", [])
	_S.call_value(_S.read(_e, "shots"), [_S.read(_e, "t"), _S.read(_e, "D"), 2.2, _S.function_value(_e, "_f3")])
	_S.call_value(_S.read(_e, "cloud"), [_S.read(_e, "p"), _S.read(_e, "puffs"), _S.read(_e, "SM"), [_S.prop(_S.read(_e, "SM"), 0), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 1), _S.prop(_S.read(_e, "SM"), 1), 0.5]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 2), _S.prop(_S.read(_e, "SM"), 2), 0.4]), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 7)], _S.merge([{"dens": 1.4}, {"max": 0.7}, {"lit": 1.3}])])
	_S.call_value(_S.read(_e, "shots"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.read(_e, "D"), _S.function_value(_e, "_f4")])
	_S.call_value(_S.read(_e, "shots"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.binary("*", 2, _S.read(_e, "F1")), _S.function_value(_e, "_f5")])
	_S.call_value(_S.read(_e, "shots"), [_S.read(_e, "t"), _S.read(_e, "D"), 0.3, _S.function_value(_e, "_f6")])
	_S.call_value(_S.read(_e, "shots"), [_S.read(_e, "t"), _S.read(_e, "D"), 0.15, _S.function_value(_e, "_f7")])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	return _S.write(_e, "pop", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "pop"), _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("+", _S.read(_e, "age"), 0.008)), 0.035)])]), "=", false)

static func _f3(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_MX = _S.read(_parent,"MX")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_MY = _S.read(_parent,"MY")
	var _n_top = _S.read(_parent,"top")
	var _n_puffs = _S.read(_parent,"puffs")
	var _n_pop = _S.read(_parent,"pop")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	if true:
		var _n_j_b2 = 0
		while _S.truth((_n_j_b2 < 3)):
			var _n_r_b3 = _S.MathFX.rng([_n_S,_n_s_b0,_n_j_b2,3])
			var _n_life_b4 = _S.invoke(_n_r_b3,"range",[1.5, 2.2])
			var _n_dl_b5 = (_n_j_b2 * 0.03)
			if _S.truth(((_n_age_b1 < _n_dl_b5) if _S.truth((_n_age_b1 < _n_dl_b5)) else ((_n_age_b1 - _n_dl_b5) >= _n_life_b4))):
				_n_j_b2 += 1.0
				continue
			var _n_a_b6 = (_n_age_b1 - _n_dl_b5)
			var _n_k_b7 = (float(_n_a_b6)/_n_life_b4)
			var _n_port_b8 = _S.binary("===",_n_j_b2,2)
			var _n_vx_b9 = (_S.invoke(_n_r_b3,"range",[(-12), 6]) if _S.truth(_n_port_b8) else (_S.invoke(_n_r_b3,"range",[45, 100]) * (1 - (_n_j_b2 * 0.4))))
			var _n_vy_b10 = ((-_S.invoke(_n_r_b3,"range",[14, 26])) if _S.truth(_n_port_b8) else (-_S.invoke(_n_r_b3,"range",[4, 16])))
			var _n_x_b11 = (((((-7) if _S.truth(_n_port_b8) else (_n_MX + 3)) + (float((_n_vx_b9 * (1 - exp(((-3.2) * _n_a_b6)))))/3.2)) - ((_S.invoke(_n_r_b3,"range",[3, 7]) * _n_a_b6) * _n_a_b6)) + ((sin(((_n_a_b6 * 2.1) + _S.invoke(_n_r_b3,"range",[0, _n_TAU]))) * _n_a_b6) * 2.5))
			var _n_y_b12 = ((((_n_MY - 2) if _S.truth(_n_port_b8) else _n_MY) + (float((_n_vy_b10 * (1 - exp(((-2.4) * _n_a_b6)))))/2.4)) - (((0.5 * _S.invoke(_n_r_b3,"range",[9, 16])) * _n_a_b6) * _n_a_b6))
			var _n_rad_b13 = ((1 if _S.truth(_n_port_b8) else 1.2) + (_S.invoke(_n_r_b3,"range",[2, 4.5]) * (1 - exp(((-1.4) * _n_a_b6)))))
			if _S.truth(((_n_y_b12 - _n_rad_b13) < (_n_top + 1))):
				_n_j_b2 += 1.0
				continue
			var _n_edge_b14 = minf(1,(float(((_n_y_b12 - _n_rad_b13) - _n_top))/12))
			_S.invoke(_n_puffs,"push",[{"x":_n_x_b11,"y":_n_y_b12,"r":_n_rad_b13,"a":(((minf(1,(_n_a_b6 * 10)) * pow((1 - _n_k_b7),1.6)) * (0.24 if _S.truth(_n_port_b8) else 0.34)) * _n_edge_b14),"b":clampf((0.92 - (_n_k_b7 * 0.6)),0.0,1.0),"w":(_n_pop * exp((float((-_S.Bridge.hypot([(_n_x_b11 - _n_MX), (_n_y_b12 - _n_MY)])))/9)))}])
			_n_j_b2 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_MY = _S.read(_parent,"MY")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_casing = _S.read(_parent,"casing")
	var _n_p = _S.read(_parent,"p")
	var _n_B = _S.read(_parent,"B")
	var _n_D = _S.read(_parent,"D")
	var _n_drawCasing = _S.read(_parent,"drawCasing")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.MathFX.rng([_n_S,_n_s_b0,7])
	var _n_k_b3 = _S.call_value(_n_casing,[(-7), (_n_MY - 1), (-_S.invoke(_n_r_b2,"range",[18, 48])), (-_S.invoke(_n_r_b2,"range",[85, 135])), (_S.invoke(_n_r_b2,"sign",[]) * _S.invoke(_n_r_b2,"range",[20, 32])), _n_age_b1, 850, (-0.5), 0.42, _S.invoke(_n_r_b2,"range",[0, _n_TAU])])
	_S.call_value(_n_drawCasing,[_n_p, _n_k_b3, _n_B, clampf((float((_n_D - _n_age_b1))/0.25),0.0,1.0)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_F1 = _S.read(_parent,"F1")
	var _n_flashShape = _S.read(_parent,"flashShape")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_F = _S.read(_parent,"F")
	var _n_p = _S.read(_parent,"p")
	var _n_MX = _S.read(_parent,"MX")
	var _n_MY = _S.read(_parent,"MY")
	var _n_flash = _S.read(_parent,"flash")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.MathFX.rng([_n_S,_n_s_b0])
	var _n_f_b3 = (1 if _S.truth((_n_age_b1 < _n_F1)) else 2)
	var _n_tilt_b4 = _S.invoke(_n_r_b2,"range",[(-0.06), 0.06])
	var _n_L_b5 = _S.call_value(_n_flashShape,[_n_r_b2, _n_f_b3, {"size":_S.invoke(_n_r_b2,"range",[0.95, 1.2]),"spike":[12, 21],"diag":[6, 11],"cross":[4, 7.5],"back":[2.5, 5]}])
	var _n_C_b6 = ([_n_WHITE, _S.index_value(_n_F,7), _S.index_value(_n_F,6), _S.index_value(_n_F,3)] if _S.truth(_S.binary("===",_n_f_b3,1)) else [_S.index_value(_n_F,7), _S.index_value(_n_F,6), _S.index_value(_n_F,4), _S.index_value(_n_F,2)])
	_S.call_value(_n_flash,[_n_p, _n_MX, _n_MY, _n_tilt_b4, _n_L_b5, _n_C_b6, ((_n_s_b0 * 7) + _n_f_b3)])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_MX = _S.read(_parent,"MX")
	var _n_MY = _S.read(_parent,"MY")
	var _n_fly = _S.read(_parent,"fly")
	var _n_flyV = _S.read(_parent,"flyV")
	var _n_p = _S.read(_parent,"p")
	var _n_F = _S.read(_parent,"F")
	var _n_SP = _S.read(_parent,"SP")
	var _n_spark = _S.read(_parent,"spark")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	if true:
		var _n_j_b2 = 0
		while _S.truth((_n_j_b2 < 5)):
			var _n_r_b3 = _S.MathFX.rng([_n_S,_n_s_b0,_n_j_b2,11])
			var _n_life_b4 = (_S.invoke(_n_r_b3,"range",[0.05, 0.16]) * (1.8 if _S.truth((_n_j_b2 > 2)) else 1))
			if _S.truth((_n_age_b1 >= _n_life_b4)):
				_n_j_b2 += 1.0
				continue
			var _n_a_b5 = _S.invoke(_n_r_b3,"range",[(-0.3), 0.3])
			var _n_sp_b6 = (_S.invoke(_n_r_b3,"range",[170, 380]) * (0.5 if _S.truth((_n_j_b2 > 2)) else 1))
			var _tuple_0 = _S.call_value(_n_fly,[(_n_MX + 2), _n_MY, (cos(_n_a_b5) * _n_sp_b6), (sin(_n_a_b5) * _n_sp_b6), _n_age_b1, 420, 2.2])
			var _n_x_b7 = _S.prop(_tuple_0,0)
			var _n_y_b8 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.call_value(_n_flyV,[(cos(_n_a_b5) * _n_sp_b6), (sin(_n_a_b5) * _n_sp_b6), _n_age_b1, 420, 2.2])
			var _n_vx_b9 = _S.prop(_tuple_1,0)
			var _n_vy_b10 = _S.prop(_tuple_1,1)
			if _S.truth((_n_j_b2 > 2)):
				_S.invoke(_n_p,"px",[_n_x_b7, _n_y_b8, (_S.index_value(_n_F,6) if _S.truth(((float(_n_age_b1)/_n_life_b4) < 0.5)) else _S.index_value(_n_F,4))])
			else:
				_S.call_value(_n_spark,[_n_p, _n_x_b7, _n_y_b8, _n_vx_b9, _n_vy_b10, (1 - (float(_n_age_b1)/_n_life_b4)), _n_SP, 0.45, 0.011])
			_n_j_b2 += 1.0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_MX = _S.read(_parent,"MX")
	var _n_MY = _S.read(_parent,"MY")
	var _n_F = _S.read(_parent,"F")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_k_b2 = exp((float((-(_n_age_b1 + 0.008)))/0.03))
	_S.invoke(_n_p,"glow",[(_n_MX + 4), _n_MY, 26, _S.index_value(_n_F,4), (0.8 * _n_k_b2)])
	_S.invoke(_n_p,"glow",[(_n_MX + 2), _n_MY, 7, _n_WHITE, (0.45 * _n_k_b2)])
	_S.invoke(_n_p,"glow",[(_n_MX + 2), 0, 12, _S.index_value(_n_F,4), (0.16 * _n_k_b2)])
	return null
