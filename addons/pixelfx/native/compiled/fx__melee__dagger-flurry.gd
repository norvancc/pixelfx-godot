@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/dagger-flurry.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "swing", _S.import_value("fx/melee/_lib.js", "swing"))
	_S.define(_e, "slash", _S.import_value("fx/melee/_lib.js", "slash"))
	_S.define(_e, "slashEnd", _S.import_value("fx/melee/_lib.js", "slashEnd"))
	_S.define(_e, "shavings", _S.import_value("fx/melee/_lib.js", "shavings"))
	_S.define(_e, "sliver", _S.import_value("fx/melee/_lib.js", "sliver"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Dagger flurry"}, {"desc": "A flurry of small quick crescents at every angle in front of the fighter, each with a flick of sparks, finished by one big cut that glints and bursts."}, {"tags": ["melee", "slash", "dagger", "combo", "flurry", "fast", "combat", "directional", "one-shot"]}, {"size": [148, 104]}, {"origin": [36, 86]}, {"duration": 0.95}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#1b1630", "#3a2f63", "#6150a3", "#9480d8", "#c7b8f5", "#efe9ff", "#ffffff"]}, {"sparks": ["#ffffff", "#efe9ff", "#c7b8f5", "#9480d8"]}, {"seed": 12}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "BASE", _S.merge([_S.read(_e, "READY"), {"weapon": "dagger"}, {"offWeapon": "dagger"}, {"sa": _S.unary("-", 0.5)}, {"sb": _S.unary("-", 0.9)}, {"crouch": 4}, {"lean": 3}, {"ffx": 11}, {"fbx": _S.unary("-", 9)}, {"fx": 12}, {"fy": _S.unary("-", 24)}, {"bx": 9}, {"by": _S.unary("-", 24)}]))
	_S.define(_e, "near", _S.function_value(_e, "_f9"))
	_S.define(_e, "far", _S.function_value(_e, "_f10"))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 60}])}, {"poses": [[_S.unary("-", 0.4), _S.merge([_S.read(_e, "BASE"), {"x": _S.unary("-", 4)}])], [_S.unary("-", 0.14), _S.merge([_S.read(_e, "BASE"), {"x": _S.unary("-", 6)}, {"lean": _S.unary("-", 2)}, {"crouch": 5}, {"fx": 2}, {"fy": _S.unary("-", 22)}, {"sa": _S.unary("-", 1.2)}, {"bx": 2}, {"by": _S.unary("-", 26)}, {"sb": _S.unary("-", 1.5)}])], [_S.unary("-", 0.03), _S.merge([_S.read(_e, "BASE"), {"x": _S.unary("-", 6)}, {"lean": _S.unary("-", 3)}, {"crouch": 6}, {"fx": 1}, {"fy": _S.unary("-", 21)}, {"sa": _S.unary("-", 1.2)}, {"bx": 1}, {"by": _S.unary("-", 25)}, {"sb": _S.unary("-", 1.5)}])], [0, _S.call_value(_S.read(_e, "near"), [20, _S.unary("-", 31), _S.unary("-", 0.5), _S.merge([{"x": 2}, {"ghost": 1}])]), "snap"], [0.055, _S.call_value(_S.read(_e, "far"), [21, _S.unary("-", 23), 0.5, _S.merge([{"x": 3}])]), "snap"], [0.11, _S.call_value(_S.read(_e, "near"), [18, _S.unary("-", 36), _S.unary("-", 1), _S.merge([{"x": 4}])]), "snap"], [0.165, _S.call_value(_S.read(_e, "far"), [22, _S.unary("-", 31), _S.unary("-", 0.6), _S.merge([{"x": 5}])]), "snap"], [0.22, _S.call_value(_S.read(_e, "near"), [20, _S.unary("-", 22), 0.2, _S.merge([{"x": 5}])]), "snap"], [0.275, _S.call_value(_S.read(_e, "far"), [21, _S.unary("-", 27), 0.05, _S.merge([{"x": 6}])]), "snap"], [0.33, _S.merge([_S.read(_e, "BASE"), {"x": 4}, {"lean": _S.unary("-", 3)}, {"crouch": 5}, {"fx": _S.unary("-", 1)}, {"fy": _S.unary("-", 33)}, {"sa": _S.unary("-", 2.5)}, {"bx": 2}, {"by": _S.unary("-", 23)}, {"sb": _S.unary("-", 1.2)}]), "snap"], [0.37, _S.merge([_S.read(_e, "BASE"), {"x": 7}, {"lean": 2}, {"crouch": 4}, {"fx": 16}, {"fy": _S.unary("-", 34)}, {"sa": _S.unary("-", 1)}, {"bx": _S.unary("-", 7)}, {"by": _S.unary("-", 24)}, {"sb": _S.unary("-", 2.4)}, {"ghost": 1}]), "snap"], [0.43, _S.merge([_S.read(_e, "BASE"), {"x": 9}, {"lean": 6}, {"crouch": 6}, {"fx": 22}, {"fy": _S.unary("-", 23)}, {"sa": 0.15}, {"bx": _S.unary("-", 9)}, {"by": _S.unary("-", 24)}, {"sb": _S.unary("-", 2.6)}, {"ffx": 13}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]), "snap"], [0.68, _S.merge([_S.read(_e, "BASE"), {"x": 9}, {"lean": 5}, {"crouch": 5}, {"fx": 21}, {"fy": _S.unary("-", 22)}, {"sa": 0.2}, {"bx": _S.unary("-", 8)}, {"by": _S.unary("-", 24)}, {"sb": _S.unary("-", 2.6)}])], [1.05, _S.merge([_S.read(_e, "BASE"), {"x": _S.unary("-", 4)}])]]}, {"hits": [_S.merge([{"t": 0.05}, {"stop": 0.015}, {"push": 0.5}, {"straw": 3}, {"flash": 0.02}]), _S.merge([{"t": 0.105}, {"stop": 0.015}, {"push": _S.unary("-", 0.3)}, {"straw": 3}, {"flash": 0.02}]), _S.merge([{"t": 0.16}, {"stop": 0.015}, {"push": 0.5}, {"straw": 3}, {"flash": 0.02}]), _S.merge([{"t": 0.215}, {"stop": 0.015}, {"push": _S.unary("-", 0.3)}, {"straw": 3}, {"flash": 0.02}]), _S.merge([{"t": 0.27}, {"stop": 0.015}, {"push": 0.5}, {"straw": 3}, {"flash": 0.02}]), _S.merge([{"t": 0.325}, {"stop": 0.015}, {"push": _S.unary("-", 0.3)}, {"straw": 3}, {"flash": 0.02}]), _S.merge([{"t": 0.42}, {"stop": 0.12}, {"shake": 0.18}, {"amp": 2}, {"push": 2.6}, {"straw": 16}])]}, {"dust": [_S.merge([{"t": 0.43}, {"x": 20}, {"n": 7}, {"dir": 1}]), _S.merge([{"t": 0}, {"x": _S.unary("-", 6)}, {"n": 3}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "EVERY", 0.055)
	_S.define(_e, "CUTS", [[21, _S.unary("-", 27), _S.unary("-", 0.5), 1], [33, _S.unary("-", 16), 0.9, _S.unary("-", 1)], [26, _S.unary("-", 38), 2.4, 1], [37, _S.unary("-", 30), _S.unary("-", 1.8), _S.unary("-", 1)], [19, _S.unary("-", 17), 0.2, 1], [30, _S.unary("-", 24), 1.4, _S.unary("-", 1)]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "small", _S.invoke(_S.read(_e, "CUTS"), "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "big", _S.call_value(_S.read(_e, "swing"), [_S.merge([{"cx": 24}, {"cy": _S.unary("-", 26)}, {"R": 30}, {"sy": 0.36}, {"k": 0.24}, {"rot": 0.12}, {"a0": 3}, {"dir": _S.unary("-", 1)}, {"span": 2.85}, {"W": 11}, {"t0": _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "small"), "length"), _S.read(_e, "EVERY")), 0.04)}, {"sweep": 0.055}, {"hold": 0.06}, {"trail": 0.24}, {"ramp": _S.read(_e, "C")}])]))
	_S.define(_e, "all", _S.concat([_S.array(_S.read(_e, "small")), [_S.read(_e, "big")]]))
	_S.define(_e, "ends", _S.invoke(_S.read(_e, "all"), "map", [_S.read(_e, "slashEnd")]))
	_S.define(_e, "done", _S.invoke(_S.read(_e, "all"), "map", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "slivers", _S.invoke([_S.unary("-", 2.6), _S.unary("-", 1.5), _S.unary("-", 0.4), 0.7], "map", [_S.function_value(_e, "_f4")]))
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_Rg = _S.read(_parent,"Rg")
	var _n_EVERY = _S.read(_parent,"EVERY")
	var _n_C = _S.read(_parent,"C")
	var _n_swing = _S.read(_parent,"swing")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_rot_b2 = _S.prop(_tuple_0,2)
	var _n_dir_b3 = _S.prop(_tuple_0,3)
	var _n_i_b4 = _S.arg(_args,1)
	return _S.call_value(_n_swing,[{"cx":_n_x_b0,"cy":_n_y_b1,"R":_S.invoke(_n_Rg,"range",[12, 15]),"sy":_S.invoke(_n_Rg,"range",[0.55, 0.75]),"rot":_n_rot_b2,"a0":_S.invoke(_n_Rg,"range",[(-2.8), (-2.2)]),"dir":_n_dir_b3,"span":_S.invoke(_n_Rg,"range",[2.3, 2.8]),"W":_S.invoke(_n_Rg,"range",[5.2, 6.4]),"t0":(_n_i_b4 * _n_EVERY),"sweep":0.035,"hold":0.03,"trail":0.13,"ramp":_n_C}])
	return null

static func _f3(_parent,_args:Array,_this=null):
	return false
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_Rg = _S.read(_parent,"Rg")
	var _n_a_b0 = _S.arg(_args,0)
	return {"a":(_n_a_b0 + _S.invoke(_n_Rg,"range",[(-0.2), 0.2])),"r":_S.invoke(_n_Rg,"range",[4, 7]),"v":_S.invoke(_n_Rg,"range",[70, 110]),"arc":_S.invoke(_n_Rg,"range",[0.4, 0.7])}
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "all"), "forEach", [_S.function_value(_e, "_f6")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_done = _S.read(_parent,"done")
	var _n_t = _S.read(_parent,"t")
	var _n_ends = _S.read(_parent,"ends")
	var _n_big = _S.read(_parent,"big")
	var _n_lights = _S.read(_parent,"lights")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_Rg = _S.read(_parent,"Rg")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_shavings = _S.read(_parent,"shavings")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	if _S.truth((_S.index_value(_n_done,_n_i_b1) if _S.truth(_S.index_value(_n_done,_n_i_b1)) else (_n_t < (_S.named_value(_n_s_b0,"t0") + _S.named_value(_n_s_b0,"sweep"))))):
		return null
	_S.set_prop(_n_done,_n_i_b1,true,"=")
	var _n_e_b2 = _S.index_value(_n_ends,_n_i_b1)
	var _n_last_b3 = _S.binary("===",_n_s_b0,_n_big)
	_S.invoke(_n_lights,"add",[_S.named_value(_n_e_b2,"x"), _S.named_value(_n_e_b2,"y"), (56 if _S.truth(_n_last_b3) else 26), _S.index_value(_n_C,3), (0.6 if _S.truth(_n_last_b3) else 0.4), (0.4 if _S.truth(_n_last_b3) else 0.14)])
	if _S.truth(_n_last_b3):
		_S.invoke(_n_lights,"add",[_S.named_value(_n_e_b2,"x"), _S.named_value(_n_e_b2,"y"), 16, _n_WHITE, 0.7, 0.08])
	if true:
		var _n_k_b4 = 0
		while _S.truth((_n_k_b4 < (12 if _S.truth(_n_last_b3) else 3))):
			var _n_a_b5 = (atan2(_S.named_value(_n_e_b2,"dy"),_S.named_value(_n_e_b2,"dx")) + _S.invoke(_n_Rg,"range",[(-0.5), 0.5]))
			var _n_sp_b6 = _S.invoke(_n_Rg,"range",[100, (340 if _S.truth(_n_last_b3) else 220)])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SPARK"), _S.named_value(_n_e_b2,"x"), _S.named_value(_n_e_b2,"y"), (cos(_n_a_b5) * _n_sp_b6), (sin(_n_a_b5) * _n_sp_b6), _S.invoke(_n_Rg,"range",[0.1, (0.35 if _S.truth(_n_last_b3) else 0.22)])])
			_n_k_b4 += 1.0
	_S.call_value(_n_shavings,[_n_ps, _n_Rg, _n_s_b0, (14 if _S.truth(_n_last_b3) else 4), [_S.index_value(_n_C,4), _S.index_value(_n_C,5)]])
	if _S.truth(_n_last_b3):
		if true:
			var _n_k_b7 = 0
			while _S.truth((_n_k_b7 < 5)):
				_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"STAR"), (_S.named_value(_n_s_b0,"cx") + _S.invoke(_n_Rg,"range",[(-22), 22])), (_S.named_value(_n_s_b0,"cy") + _S.invoke(_n_Rg,"range",[(-14), 14])), 0, (-4), _S.invoke(_n_Rg,"range",[0.2, 0.45]), (_S.index_value(_n_C,5) if _S.truth(_S.invoke(_n_Rg,"chance",[0.5])) else _n_WHITE), _S.invoke(_n_Rg,"range",[1, 2.2]), _S.invoke(_n_Rg,"range",[0.05, 0.25])])
				_n_k_b7 += 1.0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_slash = _S.read(_parent,"slash")
	var _n_all = _S.read(_parent,"all")
	var _n_big = _S.read(_parent,"big")
	var _n_ends = _S.read(_parent,"ends")
	var _n_C = _S.read(_parent,"C")
	var _n_sliver = _S.read(_parent,"sliver")
	var _n_slivers = _S.read(_parent,"slivers")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_all):
		var _n_s_b2 = _iter_0
		_S.call_value(_n_slash,[_n_p_b0, _n_s_b2, _n_t])
	_S.invoke(_n_all,"forEach",[_S.function_value(_S.capture(_parent,{"p":_n_p_b0,"this":_this}),"_f8")])
	var _n_q_b1 = ((_n_t - _S.named_value(_n_big,"t0")) - _S.named_value(_n_big,"sweep"))
	if _S.truth(((_n_q_b1 < 0.14) if _S.truth((_n_q_b1 > 0.02)) else (_n_q_b1 > 0.02))):
		var _n_k_b3 = (float((_n_q_b1 - 0.02))/0.12)
		var _n_e_b4 = _S.index_value(_n_ends,(_S.prop(_n_ends,"length") - 1))
		for _iter_1 in _S.array(_n_slivers):
			var _n_s_b5 = _iter_1
			_S.call_value(_n_sliver,[_n_p_b0, _S.named_value(_n_e_b4,"x"), _S.named_value(_n_e_b4,"y"), (_S.named_value(_n_s_b5,"a") + atan2(_S.named_value(_n_e_b4,"dy"),_S.named_value(_n_e_b4,"dx"))), (_S.named_value(_n_s_b5,"r") + (_S.named_value(_n_s_b5,"v") * (_n_q_b1 - 0.02))), (_S.named_value(_n_s_b5,"arc") * (1 - (0.4 * _n_k_b3))), (_S.index_value(_n_C,6) if _S.truth((_n_k_b3 < 0.4)) else (_S.index_value(_n_C,5) if _S.truth((_n_k_b3 < 0.7)) else _S.index_value(_n_C,4))), (1 - _n_k_b3)])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "e", _S.prop(_S.read(_e, "ends"), _S.read(_e, "i")))
	_S.define(_e, "g", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "s"), "t0")), _S.binary("*", _S.prop(_S.read(_e, "s"), "sweep"), 0.6)))
	_S.define(_e, "last", _S.binary("===", _S.read(_e, "s"), _S.read(_e, "big")))
	_S.define(_e, "life", (0.24 if _S.truth(_S.read(_e, "last")) else 0.12))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "g"), 0), func(): return _S.binary("<", _S.read(_e, "g"), _S.read(_e, "life")))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "e"), "x"), _S.prop(_S.read(_e, "e"), "y"), _S.binary("*", _S.binary("*", (10 if _S.truth(_S.read(_e, "last")) else 4), _S.invoke(_S.read(_e, "ease"), "outBack", [_S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "g"), 0.04)])])), _S.binary("-", 1, _S.binary("/", _S.read(_e, "g"), _S.read(_e, "life")))), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3), (0.6 if _S.truth(_S.read(_e, "last")) else 0.35)])
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "s"), "t0")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), _S.binary("+", _S.prop(_S.read(_e, "s"), "sweep"), 0.1)))):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "h", _S.call_value(_S.read(_v6, "slashEnd"), [_S.merge([_S.read(_v6, "s"), {"span": _S.binary("*", _S.prop(_S.read(_v6, "s"), "span"), _S.invoke(_S.read(_v6, "ease"), "outExpo", [_S.call_value(_S.read(_v6, "clamp"), [_S.binary("/", _S.read(_v6, "u"), _S.prop(_S.read(_v6, "s"), "sweep"))])]))}])]))
		_S.invoke(_S.read(_v6, "p"), "glow", [_S.prop(_S.read(_v6, "h"), "x"), _S.prop(_S.read(_v6, "h"), "y"), (40 if _S.truth(_S.read(_v6, "last")) else 22), _S.prop(_S.read(_v6, "C"), 3), _S.binary("*", (0.5 if _S.truth(_S.read(_v6, "last")) else 0.35), _S.binary("-", 1, _S.binary("/", _S.read(_v6, "u"), _S.binary("+", _S.prop(_S.read(_v6, "s"), "sweep"), 0.1))))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "fx", _S.arg(_args, 0))
	_S.define(_e, "fy", _S.arg(_args, 1))
	_S.define(_e, "sa", _S.arg(_args, 2))
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 3), func(): return _S.merge([])))
	return _S.merge([_S.read(_e, "BASE"), {"fx": _S.read(_e, "fx")}, {"fy": _S.read(_e, "fy")}, {"sa": _S.read(_e, "sa")}, {"bx": 4}, {"by": _S.unary("-", 24)}, {"sb": _S.unary("-", 1)}, _S.read(_e, "o")])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "bx", _S.arg(_args, 0))
	_S.define(_e, "by", _S.arg(_args, 1))
	_S.define(_e, "sb", _S.arg(_args, 2))
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 3), func(): return _S.merge([])))
	return _S.merge([_S.read(_e, "BASE"), {"bx": _S.read(_e, "bx")}, {"by": _S.read(_e, "by")}, {"sb": _S.read(_e, "sb")}, {"fx": 1}, {"fy": _S.unary("-", 23)}, {"sa": _S.unary("-", 1)}, _S.read(_e, "o")])
