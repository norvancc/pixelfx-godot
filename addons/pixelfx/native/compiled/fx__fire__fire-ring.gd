@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/fire-ring.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f0":"fire_ring_create","_f5":"fire_ring_flames","_f7":"fire_ring_scorch","_f8":"fire_ring_ring","_f11":"fire_ring_back","_f12":"fire_ring_draw"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "flameTongue", _S.import_value("fx/fire/_lib.js", "flameTongue"))
	_S.define(_e, "simDraw", _S.import_value("fx/fire/_lib.js", "simDraw"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "BACK_LAYERS", _S.import_value("fx/fire/_lib.js", "BACK_LAYERS"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Fire ring"}, {"desc": "A white flash at the feet, then flames race outward along the floor in a ring, flaring as the front passes and burning down behind it over a smouldering scorch."}, {"tags": ["fire", "ring", "nova", "aoe", "spell", "ground", "one-shot"]}, {"size": [224, 128]}, {"origin": [112, 92]}, {"duration": 3.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"reach": 92}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIGH", _S.merge([{"turn": 1.15}, {"crouch": 0}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 44)}, {"bx": 8}, {"by": _S.unary("-", 44)}, {"ffx": _S.unary("-", 5)}, {"fbx": 6}]))
	_S.define(_e, "SLAM", _S.merge([{"turn": 1.15}, {"crouch": 8}, {"lean": 3}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 8)}, {"bx": 11}, {"by": _S.unary("-", 8)}, {"ffx": _S.unary("-", 8)}, {"fbx": 9}]))
	_S.define(_e, "EASE", _S.merge([{"turn": 1}, {"crouch": 2}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 17)}, {"bx": 9}, {"by": _S.unary("-", 17)}, {"ffx": _S.unary("-", 4)}, {"fbx": 5}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 70}])}, {"poses": [[_S.unary("-", 0.32), _S.read(_e, "READY")], [0.02, _S.read(_e, "HIGH")], [0.27, _S.merge([_S.read(_e, "HIGH"), {"y": _S.unary("-", 1)}])], [0.32, _S.read(_e, "SLAM"), "snap"], [0.85, _S.merge([_S.read(_e, "SLAM"), {"crouch": 7}])], [1.5, _S.read(_e, "EASE")], [2.4, _S.read(_e, "READY")], [3.9, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": 0.32}, {"stop": 0.1}, {"shake": 0.28}, {"amp": 3}, {"target": false}]), _S.merge([{"t": 0.6}, {"push": 1.2}, {"straw": 10}, {"y": _S.unary("-", 8)}, {"skin": "char"}]), _S.merge([{"t": 3.5}, {"push": 0}, {"straw": 0}, {"flash": 0}, {"skin": null}])]}, {"dust": [_S.merge([{"t": 0.32}, {"x": 10}, {"n": 6}, {"dir": 1}]), _S.merge([{"t": 0.32}, {"x": _S.unary("-", 10)}, {"n": 6}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SY", 0.2)
	_S.define(_e, "CHARGE", 0.32)
	_S.define(_e, "SPREAD", 0.75)
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#0d0a12"]))
	_S.define(_e, "SOOT2", _S.call_value(_S.read(_e, "hex"), ["#17121d"]))
	_S.define(_e, "WARM", _S.call_value(_S.read(_e, "rgb"), [255, 176, 96]))
	_S.define(_e, "EMBER_LAYERS", [[1, 1, 7], [0.7, 0.8, 6], [0.4, 0.55, 5]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "hotFirst"), [_S.read(_e, "F")]))
	_S.define(_e, "REACH", _S.prop(_S.read(_e, "o"), "reach"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "S", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 5)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "GLOW", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), 0.5]), _S.read(_e, "WHITE"), 0.25]))
	_S.define(_e, "front", _S.function_value(_e, "_f2"))
	_S.define(_e, "reachedAt", _S.function_value(_e, "_f3"))
	_S.define(_e, "sites", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "r", 10)
	while _S.truth(_S.binary("<=", _S.read(_v0, "r"), _S.read(_v0, "REACH"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "per", _S.binary("*", _S.read(_v1, "TAU"), _S.invoke(_S.read(_v1, "Math"), "sqrt", [_S.binary("/", _S.binary("+", _S.binary("*", _S.read(_v1, "r"), _S.read(_v1, "r")), _S.binary("**", _S.binary("*", _S.read(_v1, "r"), _S.read(_v1, "SY")), 2)), 2)])))
		_S.define(_v1, "n", _S.invoke(_S.read(_v1, "Math"), "max", [5, _S.invoke(_S.read(_v1, "Math"), "round", [_S.binary("/", _S.read(_v1, "per"), 8.5)])]))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v2, "k"), _S.read(_v2, "n"))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "a", _S.binary("*", _S.binary("/", _S.binary("+", _S.read(_v3, "k"), _S.invoke(_S.read(_v3, "R"), "range", [0.15, 0.85])), _S.read(_v3, "n")), _S.read(_v3, "TAU")))
			_S.define(_v3, "rr", _S.binary("+", _S.read(_v3, "r"), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 3), 3])))
			_S.define(_v3, "q", _S.invoke(_S.read(_v3, "Math"), "min", [1, _S.binary("/", _S.read(_v3, "rr"), _S.read(_v3, "REACH"))]))
			_S.invoke(_S.read(_v3, "sites"), "push", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "rr"))}, {"y": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "rr")), _S.read(_v3, "SY"))}, {"back": _S.binary("<", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), 0)}, {"t0": _S.binary("+", _S.call_value(_S.read(_v3, "reachedAt"), [_S.read(_v3, "rr")]), _S.invoke(_S.read(_v3, "R"), "range", [0, 0.04]))}, {"life": _S.binary("*", _S.binary("+", 0.3, _S.binary("*", _S.binary("*", 1, _S.read(_v3, "q")), _S.read(_v3, "q"))), _S.invoke(_S.read(_v3, "R"), "range", [0.85, 1.2]))}, {"h": _S.binary("*", _S.invoke(_S.read(_v3, "R"), "range", [9, 15]), _S.binary("+", 0.6, _S.binary("*", 0.55, _S.read(_v3, "q"))))}, {"w": _S.binary("*", _S.invoke(_S.read(_v3, "R"), "range", [1.8, 2.7]), _S.binary("+", 0.75, _S.binary("*", 0.3, _S.read(_v3, "q"))))}, {"n": _S.invoke(_S.read(_v3, "R"), "int", [0, 100000])}])])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "k", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "r", 9, "+=", false)
	_S.invoke(_S.read(_e, "sites"), "sort", [_S.function_value(_e, "_f4")])
	_S.define(_e, "t", 0)
	_S.define(_e, "burst", false)
	_S.define(_e, "flames", _S.function_value(_e, "_f5"))
	_S.define(_e, "scorch", _S.function_value(_e, "_f7"))
	_S.define(_e, "ring", _S.function_value(_e, "_f8"))
	return _S.merge([{"update": _S.function_value(_e, "_f10")}, {"drawBack": _S.function_value(_e, "_f11")}, {"draw": _S.function_value(_e, "_f12")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_ease = _S.read(_parent,"ease")
	var _n_CHARGE = _S.read(_parent,"CHARGE")
	var _n_SPREAD = _S.read(_parent,"SPREAD")
	var _n_t_b0 = _S.arg(_args,0)
	return (_n_REACH * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t_b0 - _n_CHARGE))/_n_SPREAD),0.0,1.0)]))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_CHARGE = _S.read(_parent,"CHARGE")
	var _n_SPREAD = _S.read(_parent,"SPREAD")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_CHARGE + (_n_SPREAD * (1 - (signf((1 - minf(1,(float(_n_d_b0)/_n_REACH))))*pow(absf((1 - minf(1,(float(_n_d_b0)/_n_REACH)))),1.0/3)))))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.named_value(_n_a_b0,"y") - _S.named_value(_n_b_b1,"y"))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_t = _S.read(_parent,"t")
	var _n_ease = _S.read(_parent,"ease")
	var _n_BACK_LAYERS = _S.read(_parent,"BACK_LAYERS")
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_EMBER_LAYERS = _S.read(_parent,"EMBER_LAYERS")
	var _n_H = _S.read(_parent,"H")
	var _n_flameTongue = _S.read(_parent,"flameTongue")
	var _n_sites = _S.read(_parent,"sites")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	var _n_NZ_b2 = _S.function_value(_S.capture(_parent,{"this":_n_this}),"_f6")
	for _iter_0 in _S.array(_n_sites):
		var _n_s_b3 = _iter_0
		if _S.truth(_S.binary("!==",_S.named_value(_n_s_b3,"back"),_n_back_b1)):
			continue
		var _n_age_b4 = (_n_t - _S.named_value(_n_s_b3,"t0"))
		if _S.truth(((_n_age_b4 < 0) if _S.truth((_n_age_b4 < 0)) else (_n_age_b4 > _S.named_value(_n_s_b3,"life")))):
			continue
		var _n_u_b5 = (float(_n_age_b4)/_S.named_value(_n_s_b3,"life"))
		var _n_rise_b6 = _S.invoke(_n_ease,"outBack",[clampf((float(_n_age_b4)/0.08),0.0,1.0), 2])
		var _n_fade_b7 = (1 - pow(maxf(0,(float((_n_u_b5 - 0.1))/0.9)),1.3))
		var _n_h_b8 = ((((_S.named_value(_n_s_b3,"h") * _n_rise_b6) * _n_fade_b7) * (0.85 + (0.15 * _S.MathFX.noise((_n_t * 3.3),_S.named_value(_n_s_b3,"n"))))) * (1 + (0.5 * maxf(0,(_S.MathFX.noise((_n_t * 2.6),(_S.named_value(_n_s_b3,"n") + 70)) - 0.55)))))
		if _S.truth((_n_h_b8 < 1)):
			continue
		var _n_L_b9 = ((_n_BACK_LAYERS if _S.truth(_n_back_b1) else _n_LAYERS) if _S.truth((_n_u_b5 < 0.3)) else (_n_BACK_LAYERS if _S.truth((_n_u_b5 < 0.65)) else _n_EMBER_LAYERS))
		_S.call_value(_n_flameTongue,[_n_p_b0, _S.named_value(_n_s_b3,"x"), _S.named_value(_n_s_b3,"y"), _n_h_b8, (_S.named_value(_n_s_b3,"w") * (0.6 + (0.4 * _n_fade_b7))), ((_S.call_value(_n_NZ_b2,[2.2, (_S.named_value(_n_s_b3,"n") + 40)]) * 1.5) - (_S.named_value(_n_s_b3,"x") * 0.02)), _n_NZ_b2, _S.named_value(_n_s_b3,"n"), _n_H, _n_L_b9])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_rate_b0 = _S.arg(_args,0)
	var _n_seed_b1 = _S.coalesce(_S.arg(_args,1),func():return 0)
	var _n_off_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	return _S.MathFX.noise(((_n_t * _n_rate_b0) + _n_off_b2),_n_seed_b1)
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_front = _S.read(_parent,"front")
	var _n_t = _S.read(_parent,"t")
	var _n_meta = _S.read(_parent,"meta")
	var _n_SY = _S.read(_parent,"SY")
	var _n_reachedAt = _S.read(_parent,"reachedAt")
	var _n_S = _S.read(_parent,"S")
	var _n_H = _S.read(_parent,"H")
	var _n_SOOT = _S.read(_parent,"SOOT")
	var _n_SOOT2 = _S.read(_parent,"SOOT2")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_fr_b1 = _S.call_value(_n_front,[_n_t])
	var _n_end_b2 = (1 - _S.MathFX.smooth((_S.named_value(_n_meta,"duration") - 1.2),(_S.named_value(_n_meta,"duration") - 0.15),_n_t))
	if _S.truth(((_n_fr_b1 < 1) if _S.truth((_n_fr_b1 < 1)) else (_n_end_b2 <= 0))):
		return null
	if true:
		var _n_y_b3 = floori(((-_n_fr_b1) * _n_SY))
		while _S.truth((_n_y_b3 <= ceili((_n_fr_b1 * _n_SY)))):
			if true:
				var _n_x_b4 = floori((-_n_fr_b1))
				while _S.truth((_n_x_b4 <= ceili(_n_fr_b1))):
					var _n_d_b5 = _S.Bridge.hypot([(_n_x_b4 + 0.5), (float((_n_y_b3 + 0.5))/_n_SY)])
					if _S.truth((_n_d_b5 > _n_fr_b1)):
						_n_x_b4 += 1.0
						continue
					var _n_since_b6 = (_n_t - _S.call_value(_n_reachedAt,[_n_d_b5]))
					var _n_h_b7 = _S.MathFX.rand([_n_x_b4,_n_y_b3,_n_S])
					var _n_hot_b8 = (1 - (float(_n_since_b6)/(1.2 + (_n_h_b7 * 0.9))))
					if _S.truth(((_n_h_b7 < (0.03 + (0.06 * _n_hot_b8))) if _S.truth((_n_hot_b8 > 0)) else (_n_hot_b8 > 0))):
						_S.invoke(_n_p_b0,"px",[_n_x_b4, _n_y_b3, (_S.index_value(_n_H,3) if _S.truth((_n_hot_b8 > 0.7)) else (_S.index_value(_n_H,4) if _S.truth((_n_hot_b8 > 0.45)) else (_S.index_value(_n_H,5) if _S.truth((_n_hot_b8 > 0.2)) else _S.index_value(_n_H,6))))])
						_S.invoke(_n_p_b0,"light",[_n_x_b4, _n_y_b3, _S.index_value(_n_H,4), (0.3 * _n_hot_b8)])
						_n_x_b4 += 1.0
						continue
					_S.invoke(_n_p_b0,"blend",[_n_x_b4, _n_y_b3, (_n_SOOT if _S.truth((_n_h_b7 < 0.5)) else _n_SOOT2), ((minf(1,(_n_since_b6 * 3)) * (0.55 - ((float(_n_d_b5)/_n_REACH) * 0.25))) * _n_end_b2)])
					_n_x_b4 += 1.0
			_n_y_b3 += 1.0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_CHARGE = _S.read(_parent,"CHARGE")
	var _n_SPREAD = _S.read(_parent,"SPREAD")
	var _n_front = _S.read(_parent,"front")
	var _n_SY = _S.read(_parent,"SY")
	var _n_H = _S.read(_parent,"H")
	var _n_this = _S.read(_parent,"this")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	var _n_k_b2 = (float((_n_t - _n_CHARGE))/(_n_SPREAD + 0.1))
	if _S.truth(((_n_k_b2 < 0) if _S.truth((_n_k_b2 < 0)) else (_n_k_b2 >= 1))):
		return null
	_S.call_value(_n_band,[_n_p_b0, 0, 0, (_S.call_value(_n_front,[_n_t]) + 1.5), _n_SY, maxf(1.5,(6 * (1 - _n_k_b2))), (1 if _S.truth((_n_k_b2 < 0.75)) else (float((1 - _n_k_b2))/0.25)), [_S.index_value(_n_H,6), _S.index_value(_n_H,4), _S.index_value(_n_H,2), _S.index_value(_n_H,1)], _S.function_value(_S.capture(_parent,{"back":_n_back_b1,"this":_n_this}),"_f9"), (_n_k_b2 < 0.12)])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_back = _S.read(_parent,"back")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.binary("===",(sin(_n_g_b0) < 0),_n_back)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "CHARGE"), 0.05)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.binary("*", 0.9, _S.read(_e, "dt")), 60)]))):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "a", _S.invoke(_S.read(_v11, "R"), "range", [0, _S.read(_v11, "TAU")]))
		_S.define(_v11, "d", _S.invoke(_S.read(_v11, "R"), "range", [26, 54]))
		_S.define(_v11, "T", _S.invoke(_S.read(_v11, "R"), "range", [0.18, 0.26]))
		_S.define(_v11, "v", _S.binary("/", _S.binary("*", _S.read(_v11, "d"), 3), _S.binary("-", _S.invoke(_S.read(_v11, "Math"), "exp", [_S.binary("*", 3, _S.read(_v11, "T"))]), 1)))
		_S.define(_v11, "x", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "d")))
		_S.define(_v11, "y", _S.invoke(_S.read(_v11, "Math"), "min", [_S.unary("-", 2), _S.binary("+", _S.unary("-", 6), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "d")), 0.45))]))
		_S.define(_v11, "l", _S.logical("||", _S.invoke(_S.read(_v11, "Math"), "hypot", [_S.read(_v11, "x"), _S.binary("+", _S.read(_v11, "y"), 4)]), func(): return 1))
		_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "STREAK"), _S.read(_v11, "x"), _S.read(_v11, "y"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v11, "x")), _S.read(_v11, "l")), _S.read(_v11, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.unary("-", 4), _S.read(_v11, "y")), _S.read(_v11, "l")), _S.read(_v11, "v")), _S.read(_v11, "T"), (_S.prop(_S.read(_v11, "H"), 2) if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.5])) else _S.prop(_S.read(_v11, "H"), 3))])
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "CHARGE")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "dt")), 60), _S.binary("/", _S.read(_e, "t"), _S.read(_e, "CHARGE")))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "FIRE"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 1), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [20, 40])), _S.invoke(_S.read(_e, "R"), "range", [0.12, 0.24]), 0, _S.invoke(_S.read(_e, "R"), "range", [1, 2.2])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "burst")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CHARGE")))):
		var _v12 = _S.scope(_e)
		_S.write(_v12, "burst", true, "=", false)
		_S.invoke(_S.read(_v12, "lights"), "add", [0, _S.unary("-", 18), 64, _S.read(_v12, "WARM"), 0.85, 0.5])
		_S.invoke(_S.read(_v12, "lights"), "add", [0, _S.unary("-", 6), 30, _S.read(_v12, "WHITE"), 0.8, 0.08])
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 40)):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "a", _S.invoke(_S.read(_v14, "R"), "range", [0, _S.read(_v14, "TAU")]))
			_S.define(_v14, "sp", _S.invoke(_S.read(_v14, "R"), "range", [80, 220]))
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), 3), _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "sp")), 0.4), _S.invoke(_S.read(_v14, "R"), "range", [40, 120])), _S.invoke(_S.read(_v14, "R"), "range", [0.2, 0.5])])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "CHARGE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.binary("+", _S.read(_e, "CHARGE"), _S.read(_e, "SPREAD")), 1.2)))):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 3)):
			var _v16 = _S.scope(_v15)
			if _S.truth(_S.unary("!", _S.invoke(_S.read(_v16, "R"), "chance", [_S.binary("*", _S.binary("*", 0.75, _S.read(_v16, "dt")), 60)]))):
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "i", 1, "+=", true)
				continue
			_S.define(_v16, "s", _S.invoke(_S.read(_v16, "R"), "pick", [_S.read(_v16, "sites")]))
			_S.define(_v16, "age", _S.binary("-", _S.read(_v16, "t"), _S.prop(_S.read(_v16, "s"), "t0")))
			if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v16, "age"), 0), func(): return _S.binary(">", _S.read(_v16, "age"), _S.binary("*", _S.prop(_S.read(_v16, "s"), "life"), 0.7)))):
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "i", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "FIRE"), _S.binary("+", _S.prop(_S.read(_v16, "s"), "x"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 1), 1])), _S.binary("-", _S.prop(_S.read(_v16, "s"), "y"), _S.binary("*", _S.prop(_S.read(_v16, "s"), "h"), 0.6)), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [20, 40])), _S.invoke(_S.read(_v16, "R"), "range", [0.2, 0.4]), 0, _S.invoke(_S.read(_v16, "R"), "range", [1.2, 2.4]), 0, (_S.binary("|", _S.prop(_S.read(_v16, "PF"), "SMOKES"), (_S.prop(_S.read(_v16, "PF"), "BACK") if _S.truth(_S.prop(_S.read(_v16, "s"), "back")) else 0)) if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.5])) else (_S.prop(_S.read(_v16, "PF"), "BACK") if _S.truth(_S.prop(_S.read(_v16, "s"), "back")) else 0))])
			if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.12])):
				_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "EMBER"), _S.prop(_S.read(_v16, "s"), "x"), _S.binary("-", _S.prop(_S.read(_v16, "s"), "y"), _S.binary("*", _S.prop(_S.read(_v16, "s"), "h"), 0.5)), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [30, 70])), _S.invoke(_S.read(_v16, "R"), "range", [0.6, 1.3]), _S.prop(_S.read(_v16, "H"), 3), 1, 0, (_S.prop(_S.read(_v16, "PF"), "BACK") if _S.truth(_S.prop(_S.read(_v16, "s"), "back")) else 0)])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_scorch = _S.read(_parent,"scorch")
	var _n_ring = _S.read(_parent,"ring")
	var _n_flames = _S.read(_parent,"flames")
	var _n_ps = _S.read(_parent,"ps")
	var _n_H = _S.read(_parent,"H")
	var _n_simDraw = _S.read(_parent,"simDraw")
	var _n_front = _S.read(_parent,"front")
	var _n_t = _S.read(_parent,"t")
	var _n_CHARGE = _S.read(_parent,"CHARGE")
	var _n_SPREAD = _S.read(_parent,"SPREAD")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_SY = _S.read(_parent,"SY")
	var _n_GLOW = _S.read(_parent,"GLOW")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_scorch,[_n_p_b0])
	_S.call_value(_n_ring,[_n_p_b0, true])
	_S.call_value(_n_flames,[_n_p_b0, true])
	_S.call_value(_n_simDraw,[_n_p_b0, _n_ps, _n_H, "back"])
	var _n_fr_b1 = _S.call_value(_n_front,[_n_t])
	var _n_k_b2 = (0 if _S.truth((_n_t < _n_CHARGE)) else (1 - _S.MathFX.smooth((_n_CHARGE + _n_SPREAD),((_n_CHARGE + _n_SPREAD) + 1.4),_n_t)))
	if _S.truth((_n_k_b2 > 0)):
		if true:
			var _n_i_b3 = 0
			while _S.truth((_n_i_b3 < 16)):
				_S.invoke(_n_p_b0,"glow",[(cos(((float(_n_i_b3)/16) * _n_TAU)) * _n_fr_b1), (((sin(((float(_n_i_b3)/16) * _n_TAU)) * _n_fr_b1) * _n_SY) - 3), 16, _n_GLOW, (0.2 * _n_k_b2)])
				_n_i_b3 += 1.0
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_ring = _S.read(_parent,"ring")
	var _n_flames = _S.read(_parent,"flames")
	var _n_ps = _S.read(_parent,"ps")
	var _n_H = _S.read(_parent,"H")
	var _n_simDraw = _S.read(_parent,"simDraw")
	var _n_t = _S.read(_parent,"t")
	var _n_CHARGE = _S.read(_parent,"CHARGE")
	var _n_GLOW = _S.read(_parent,"GLOW")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_SPREAD = _S.read(_parent,"SPREAD")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_ring,[_n_p_b0, false])
	_S.call_value(_n_flames,[_n_p_b0, false])
	_S.call_value(_n_simDraw,[_n_p_b0, _n_ps, _n_H, "front"])
	if _S.truth((_n_t < _n_CHARGE)):
		_S.invoke(_n_p_b0,"glow",[0, (-3), (8 + (22 * (float(_n_t)/_n_CHARGE))), _n_GLOW, (0.6 * (float(_n_t)/_n_CHARGE))])
	if _S.truth(((_n_t < (_n_CHARGE + 0.1)) if _S.truth((_n_t >= _n_CHARGE)) else (_n_t >= _n_CHARGE))):
		var _n_k_b2 = (1 - (float((_n_t - _n_CHARGE))/0.1))
		_S.invoke(_n_p_b0,"ellipse",[0, (-1), (14 * (0.6 + (0.4 * _n_k_b2))), 4, _S.index_value(_n_H,2)])
		_S.invoke(_n_p_b0,"ellipse",[0, (-1), (9 * (0.6 + (0.4 * _n_k_b2))), 2.6, (_n_WHITE if _S.truth((_n_k_b2 > 0.5)) else _S.index_value(_n_H,1))])
	var _n_k_b1 = (_S.MathFX.smooth((_n_CHARGE - 0.05),_n_CHARGE,_n_t) * (1 - _S.MathFX.smooth((_n_CHARGE + (_n_SPREAD * 0.5)),((_n_CHARGE + _n_SPREAD) + 1.2),_n_t)))
	if _S.truth((_n_k_b1 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-6), 92, _n_GLOW, (0.3 * _n_k_b1)])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
