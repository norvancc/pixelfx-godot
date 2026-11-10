@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/scythe-reap.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "swing", _S.import_value("fx/melee/_lib.js", "swing"))
	_S.define(_e, "onSwing", _S.import_value("fx/melee/_lib.js", "onSwing"))
	_S.define(_e, "travel", _S.import_value("fx/melee/_lib.js", "travel"))
	_S.define(_e, "smear", _S.import_value("fx/melee/_lib.js", "smear"))
	_S.define(_e, "glowAlong", _S.import_value("fx/melee/_lib.js", "glowAlong"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Scythe reap"}, {"desc": "A slow, huge dark crescent reaps round the front with a pale ghostly edge; it hangs, then tears away from the tail into curling wisps and cold vapour."}, {"tags": ["melee", "scythe", "reap", "dark", "ghost", "death", "slash", "combat", "one-shot"]}, {"size": [184, 116]}, {"origin": [84, 98]}, {"duration": 2.1}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#07040c", "#140a22", "#24113a", "#3b1d58", "#5a3a82", "#7fd6c0", "#d8fff2", "#ffffff"]}, {"seed": 13}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "REST_", _S.merge([_S.read(_e, "READY"), {"weapon": "scythe"}, {"x": 2}, {"sa": _S.unary("-", 1.5)}, {"fx": 11}, {"fy": _S.unary("-", 22)}, {"bx": 7}, {"by": _S.unary("-", 16)}]))
	_S.define(_e, "OUT_", _S.merge([_S.read(_e, "REST_"), {"two": true}, {"crouch": 4}, {"lean": 4}, {"fx": 17}, {"fy": _S.unary("-", 27)}, {"sa": _S.unary("-", 0.45)}, {"ffx": 11}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "END", _S.merge([_S.read(_e, "REST_"), {"two": true}, {"x": 0}, {"yaw": 3.14}, {"crouch": 6}, {"lean": 4}, {"fx": 15}, {"fy": _S.unary("-", 24)}, {"sa": 0.3}, {"ffx": 11}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 66}])}, {"poses": [[_S.unary("-", 0.56), _S.read(_e, "REST_")], [_S.unary("-", 0.26), _S.read(_e, "OUT_")], [0.08, _S.merge([_S.read(_e, "OUT_"), {"crouch": 5}])], [0.2, _S.merge([_S.read(_e, "OUT_"), {"yaw": 0.8}, {"crouch": 5}, {"lean": 3}, {"fx": 16}, {"fy": _S.unary("-", 23)}, {"sa": 0.1}, {"ghost": 1}])], [0.3, _S.merge([_S.read(_e, "OUT_"), {"x": 1}, {"yaw": 1.9}, {"crouch": 6}, {"lean": 3}, {"fx": 15}, {"fy": _S.unary("-", 23)}, {"sa": 0.2}, {"ghost": 1}])], [0.42, _S.read(_e, "END")], [0.92, _S.merge([_S.read(_e, "END"), {"crouch": 5}])], [1.3, _S.merge([_S.read(_e, "REST_"), {"x": 1}, {"yaw": 1.4}, {"crouch": 4}])], [1.7, _S.read(_e, "REST_")]]}, {"hits": [_S.merge([{"t": 0.14}, {"stop": 0.12}, {"shake": 0.16}, {"amp": 2}, {"push": 2.4}, {"straw": 20}, {"skin": "shadow"}])]}, {"dust": [_S.merge([{"t": 0.3}, {"x": 2}, {"n": 6}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "WIND", 0.08)
	_S.define(_e, "SWEEP", 0.34)
	_S.define(_e, "HANG", 0.14)
	_S.define(_e, "TEAR", 0.55)
	_S.define(_e, "T0", _S.read(_e, "WIND"))
	_S.define(_e, "T1", _S.binary("+", _S.read(_e, "WIND"), _S.read(_e, "SWEEP")))
	_S.define(_e, "T2", _S.binary("+", _S.read(_e, "T1"), _S.read(_e, "HANG")))
	_S.define(_e, "T3", _S.binary("+", _S.read(_e, "T2"), _S.read(_e, "TEAR")))
	_S.define(_e, "head", _S.function_value(_e, "_f11"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.function_value(_e, "_f1")}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "swing"), [_S.merge([{"cx": 8}, {"cy": _S.unary("-", 33)}, {"R": 52}, {"sy": 0.6}, {"k": 0.1}, {"rot": 0.08}, {"a0": _S.unary("-", 0.5)}, {"dir": 1}, {"span": 3.5}])]))
	_S.define(_e, "W", 21)
	_S.define(_e, "wisps", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "lastTear", 0)
	_S.define(_e, "tear", _S.function_value(_e, "_f2"))
	_S.define(_e, "addWisp", _S.function_value(_e, "_f3"))
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"drawBack": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f6")}, {"blade": _S.function_value(_e, "_f7")}, {"threads": _S.function_value(_e, "_f10")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_T2 = _S.read(_parent,"T2")
	var _n_T3 = _S.read(_parent,"T3")
	var _n_t = _S.read(_parent,"t")
	return _S.MathFX.smooth(_n_T2,_n_T3,_n_t)
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_wisps = _S.read(_parent,"wisps")
	var _n_Rg = _S.read(_parent,"Rg")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_far_b2 = _S.arg(_args,2)
	return _S.invoke(_n_wisps,"push",[{"x":_n_x_b0,"y":_n_y_b1,"vx":_S.invoke(_n_Rg,"range",[(-12), 12]),"vy":(-_S.invoke(_n_Rg,"range",[8, 26])),"life":_S.invoke(_n_Rg,"range",[0.5, 0.9]),"max":0,"seed":_S.invoke(_n_Rg,"range",[0, 100]),"pts":[],"far":_n_far_b2}])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "WIND")), func(): return _S.invoke(_S.read(_e, "Rg"), "chance", [0.5]))):
		var _v0 = _S.scope(_e)
		var _v1 = _S.call_value(_S.read(_v0, "onSwing"), [_S.read(_v0, "A"), _S.binary("-", _S.prop(_S.read(_v0, "A"), "R"), 4), 0])
		_S.define(_v0, "x", _S.prop(_v1, 0))
		_S.define(_v0, "y", _S.prop(_v1, 1))
		_S.invoke(_S.read(_v0, "ps"), "spawn", [_S.prop(_S.read(_v0, "P"), "VAPOUR"), _S.binary("+", _S.read(_v0, "x"), _S.invoke(_S.read(_v0, "Rg"), "range", [_S.unary("-", 14), 14])), _S.binary("+", _S.read(_v0, "y"), _S.invoke(_S.read(_v0, "Rg"), "range", [_S.unary("-", 8), 8])), _S.invoke(_S.read(_v0, "Rg"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v0, "Rg"), "range", [_S.unary("-", 6), 6]), _S.invoke(_S.read(_v0, "Rg"), "range", [0.3, 0.5]), _S.prop(_S.read(_v0, "C"), 5), _S.invoke(_S.read(_v0, "Rg"), "range", [1.5, 2.5])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "T0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T1"))), func(): return _S.invoke(_S.read(_e, "Rg"), "chance", [0.5]))):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "tr", _S.call_value(_S.read(_v2, "travel"), [_S.read(_v2, "A"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v2, "A"), "span"), _S.call_value(_S.read(_v2, "head"), [_S.read(_v2, "t")])), _S.invoke(_S.read(_v2, "Rg"), "range", [0.75, 1]))]))
		_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "VAPOUR"), _S.prop(_S.read(_v2, "tr"), "x"), _S.prop(_S.read(_v2, "tr"), "y"), _S.binary("*", _S.prop(_S.read(_v2, "tr"), "dx"), 20), _S.unary("-", _S.invoke(_S.read(_v2, "Rg"), "range", [4, 14])), _S.invoke(_S.read(_v2, "Rg"), "range", [0.5, 0.9]), _S.prop(_S.read(_v2, "C"), 6), _S.invoke(_S.read(_v2, "Rg"), "range", [2, 3.5]), 0, (_S.prop(_S.read(_v2, "PF"), "BACK") if _S.truth(_S.binary("<", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.prop(_S.read(_v2, "tr"), "a")]), 0)) else 0)])
	_S.define(_e, "k", _S.call_value(_S.read(_e, "tear"), []))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "u", _S.read(_v3, "lastTear"))
	while _S.truth(_S.binary("<", _S.read(_v3, "u"), _S.binary("*", _S.read(_v3, "k"), 1.15))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "uu", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "min", [1, _S.read(_v4, "u")]), _S.prop(_S.read(_v4, "A"), "span")))
		_S.define(_v4, "tr", _S.call_value(_S.read(_v4, "travel"), [_S.merge([_S.read(_v4, "A"), {"R": _S.binary("-", _S.prop(_S.read(_v4, "A"), "R"), _S.invoke(_S.read(_v4, "Rg"), "range", [0, 8]))}]), _S.read(_v4, "uu")]))
		_S.define(_v4, "far", _S.binary("<", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.prop(_S.read(_v4, "tr"), "a")]), 0))
		_S.call_value(_S.read(_v4, "addWisp"), [_S.prop(_S.read(_v4, "tr"), "x"), _S.prop(_S.read(_v4, "tr"), "y"), _S.read(_v4, "far")])
		if _S.truth(_S.invoke(_S.read(_v4, "Rg"), "chance", [0.5])):
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "VAPOUR"), _S.prop(_S.read(_v4, "tr"), "x"), _S.prop(_S.read(_v4, "tr"), "y"), _S.invoke(_S.read(_v4, "Rg"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v4, "Rg"), "range", [6, 18])), _S.invoke(_S.read(_v4, "Rg"), "range", [0.55, 0.85]), (_S.prop(_S.read(_v4, "C"), 5) if _S.truth(_S.invoke(_S.read(_v4, "Rg"), "chance", [0.5])) else _S.prop(_S.read(_v4, "C"), 4)), _S.invoke(_S.read(_v4, "Rg"), "range", [2.5, 4.5]), 0, (_S.prop(_S.read(_v4, "PF"), "BACK") if _S.truth(_S.read(_v4, "far")) else 0)])
		if _S.truth(_S.invoke(_S.read(_v4, "Rg"), "chance", [0.2])):
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v4, "tr"), "x"), _S.invoke(_S.read(_v4, "Rg"), "range", [_S.unary("-", 3), 3])), _S.binary("+", _S.prop(_S.read(_v4, "tr"), "y"), _S.invoke(_S.read(_v4, "Rg"), "range", [_S.unary("-", 3), 3])), 0, _S.unary("-", 6), _S.invoke(_S.read(_v4, "Rg"), "range", [0.25, 0.5]), (_S.prop(_S.read(_v4, "C"), 6) if _S.truth(_S.invoke(_S.read(_v4, "Rg"), "chance", [0.5])) else _S.read(_v4, "WHITE")), _S.invoke(_S.read(_v4, "Rg"), "range", [0.6, 1.6]), 0, (_S.prop(_S.read(_v4, "PF"), "BACK") if _S.truth(_S.read(_v4, "far")) else 0)])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "u", 0.022, "+=", false)
	_S.write(_e, "lastTear", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "lastTear"), _S.binary("*", _S.read(_e, "k"), 1.15)]), "=", false)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", _S.binary("-", _S.prop(_S.read(_v5, "wisps"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v5, "i"), 0)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "w", _S.prop(_S.read(_v6, "wisps"), _S.read(_v6, "i")))
		_S.set_prop(_S.read(_v6, "w"), "max", _S.read(_v6, "dt"), "+=", false)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v6, "w"), "max"), _S.prop(_S.read(_v6, "w"), "life"))):
			var _v7 = _S.scope(_v6)
			_S.invoke(_S.read(_v7, "wisps"), "splice", [_S.read(_v7, "i"), 1])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v6, "w"), "vy", _S.binary("*", 30, _S.read(_v6, "dt")), "-=", false)
		_S.set_prop(_S.read(_v6, "w"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v6, "w"), "max"), 9), _S.prop(_S.read(_v6, "w"), "seed"))]), 120), _S.read(_v6, "dt")), "+=", false)
		_S.set_prop(_S.read(_v6, "w"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v6, "w"), "vx"), 2), _S.read(_v6, "dt")), "-=", false)
		_S.set_prop(_S.read(_v6, "w"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v6, "w"), "vy"), 1.2), _S.read(_v6, "dt")), "-=", false)
		_S.set_prop(_S.read(_v6, "w"), "x", _S.binary("*", _S.prop(_S.read(_v6, "w"), "vx"), _S.read(_v6, "dt")), "+=", false)
		_S.set_prop(_S.read(_v6, "w"), "y", _S.binary("*", _S.prop(_S.read(_v6, "w"), "vy"), _S.read(_v6, "dt")), "+=", false)
		_S.invoke(_S.prop(_S.read(_v6, "w"), "pts"), "push", [[_S.prop(_S.read(_v6, "w"), "x"), _S.prop(_S.read(_v6, "w"), "y")]])
		if _S.truth(_S.binary(">", _S.prop(_S.prop(_S.read(_v6, "w"), "pts"), "length"), 14)):
			_S.invoke(_S.prop(_S.read(_v6, "w"), "pts"), "shift", [])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	_S.invoke(_this,"blade",[_n_p_b0, (-1)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	_S.invoke(_this,"threads",[_n_p_b0, true])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_WIND = _S.read(_parent,"WIND")
	var _n_A = _S.read(_parent,"A")
	var _n_onSwing = _S.read(_parent,"onSwing")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_T1 = _S.read(_parent,"T1")
	var _n_ease = _S.read(_parent,"ease")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.invoke(_this,"blade",[_n_p_b0, 1])
	if _S.truth((_n_t < (_n_WIND + 0.05))):
		var _tuple_0 = _S.call_value(_n_onSwing,[_n_A, (_S.named_value(_n_A,"R") - 3), 0])
		var _n_x_b2 = _S.prop(_tuple_0,0)
		var _n_y_b3 = _S.prop(_tuple_0,1)
		_S.call_value(_n_sparkle,[_n_p_b0, _n_x_b2, _n_y_b3, ((6 * minf(1,(float(_n_t)/0.04))) * (1 - _S.MathFX.smooth((_n_WIND - 0.02),(_n_WIND + 0.05),_n_t))), _S.index_value(_n_C,6), _S.index_value(_n_C,5), 0.45])
	var _n_g_b1 = ((_n_t - _n_T1) + 0.06)
	if _S.truth(((_n_g_b1 < 0.3) if _S.truth((_n_g_b1 > 0)) else (_n_g_b1 > 0))):
		var _tuple_1 = _S.call_value(_n_onSwing,[_n_A, (_S.named_value(_n_A,"R") - 3), _S.named_value(_n_A,"span")])
		var _n_x_b4 = _S.prop(_tuple_1,0)
		var _n_y_b5 = _S.prop(_tuple_1,1)
		_S.call_value(_n_sparkle,[_n_p_b0, _n_x_b4, _n_y_b5, ((9 * _S.invoke(_n_ease,"outBack",[minf(1,(float(_n_g_b1)/0.06))])) * (1 - (float(_n_g_b1)/0.3))), _S.index_value(_n_C,6), _S.index_value(_n_C,5), 0.55])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_this,"threads",[_n_p_b0, false])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_A = _S.read(_parent,"A")
	var _n_head = _S.read(_parent,"head")
	var _n_t = _S.read(_parent,"t")
	var _n_tear = _S.read(_parent,"tear")
	var _n_C = _S.read(_parent,"C")
	var _n_W = _S.read(_parent,"W")
	var _n_smear = _S.read(_parent,"smear")
	var _n_glowAlong = _S.read(_parent,"glowAlong")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_half_b1 = _S.arg(_args,1)
	var _n_U_b2 = (_S.named_value(_n_A,"span") * _S.call_value(_n_head,[_n_t]))
	var _n_k_b3 = _S.call_value(_n_tear,[])
	if _S.truth(((_n_U_b2 < 0.02) if _S.truth((_n_U_b2 < 0.02)) else (_n_k_b3 >= 1))):
		return null
	var _n_ramp_b4 = ([_S.index_value(_n_C,0), _S.index_value(_n_C,0), _S.index_value(_n_C,1), _S.index_value(_n_C,2), _S.index_value(_n_C,3), _S.index_value(_n_C,4), _S.index_value(_n_C,5), _S.index_value(_n_C,6)] if _S.truth((_n_half_b1 < 0)) else _n_C)
	_S.call_value(_n_smear,[_n_p_b0, _n_A, 0, _n_U_b2, _n_W, _S.function_value(_S.capture(_parent,{"U":_n_U_b2,"k":_n_k_b3,"ramp":_n_ramp_b4,"this":_this}),"_f8"), _n_half_b1])
	_S.call_value(_n_glowAlong,[_n_p_b0, _n_A, (_S.named_value(_n_A,"R") - 2), maxf(0,(((_n_k_b3 * 1.2) * _S.named_value(_n_A,"span")) - 0.3)), _n_U_b2, 14, _S.index_value(_n_C,5), _S.function_value(_S.capture(_parent,{"U":_n_U_b2,"this":_this}),"_f9"), _n_half_b1, 0.25])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_U = _S.read(_parent,"U")
	var _n_W = _S.read(_parent,"W")
	var _n_A = _S.read(_parent,"A")
	var _n_k = _S.read(_parent,"k")
	var _n_ramp = _S.read(_parent,"ramp")
	var _n_t = _S.read(_parent,"t")
	var _n_T1 = _S.read(_parent,"T1")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_v_b4 = (float(_n_u_b0)/_n_U)
	var _n_w_b5 = (_n_W * pow(sin((PI * pow(_n_v_b4,1.7))),0.55))
	if _S.truth((_n_w_b5 < 0.5)):
		return null
	var _n_q_b6 = (float((_S.named_value(_n_A,"R") - _n_r_b1))/_n_w_b5)
	if _S.truth(((_n_q_b6 < 0) if _S.truth((_n_q_b6 < 0)) else (_n_q_b6 > 1))):
		return null
	var _n_n_b7 = _S.MathFX.rand([floori((_n_u_b0 * 40)),floori(_n_r_b1),7])
	if _S.truth((((float(_n_u_b0)/_S.named_value(_n_A,"span")) < ((_n_k * 1.2) - (_n_n_b7 * 0.2))) if _S.truth((_n_k > 0)) else (_n_k > 0))):
		return null
	var _n_ci_b8 = (7 if _S.truth((_n_q_b6 < 0.08)) else (6 if _S.truth((_n_q_b6 < 0.16)) else (5 if _S.truth((_n_q_b6 < 0.25)) else (4 if _S.truth((_n_q_b6 < 0.4)) else (3 if _S.truth((_n_q_b6 < 0.62)) else 2)))))
	_S.set_prop(_n_out_b2,"c",_S.index_value(_n_ramp,((_n_ci_b8 - 1) if _S.truth(((_n_q_b6 < 0.2) if _S.truth((_n_t > _n_T1)) else (_n_t > _n_T1))) else _n_ci_b8)),"=")
	_S.set_prop(_n_out_b2,"a",minf(1,(float(_n_v_b4)/0.25)),"=")
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_U = _S.read(_parent,"U")
	var _n_u_b0 = _S.arg(_args,0)
	return (0.3 * (float(_n_u_b0)/_n_U))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_wisps = _S.read(_parent,"wisps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	for _iter_0 in _S.array(_n_wisps):
		var _n_w_b2 = _iter_0
		if _S.truth(_S.binary("!==",_S.named_value(_n_w_b2,"far"),_n_back_b1)):
			continue
		var _n_life_b3 = (1 - (float(_S.named_value(_n_w_b2,"max"))/_S.named_value(_n_w_b2,"life")))
		if true:
			var _n_i_b4 = 1
			while _S.truth((_n_i_b4 < _S.prop(_S.named_value(_n_w_b2,"pts"),"length"))):
				var _n_f_b5 = (float(_n_i_b4)/_S.prop(_S.named_value(_n_w_b2,"pts"),"length"))
				_S.invoke(_n_p_b0,"line",[_S.index_value(_S.index_value(_S.named_value(_n_w_b2,"pts"),(_n_i_b4 - 1)),0), _S.index_value(_S.index_value(_S.named_value(_n_w_b2,"pts"),(_n_i_b4 - 1)),1), _S.index_value(_S.index_value(_S.named_value(_n_w_b2,"pts"),_n_i_b4),0), _S.index_value(_S.index_value(_S.named_value(_n_w_b2,"pts"),_n_i_b4),1), (_S.index_value(_n_C,6) if _S.truth((_n_f_b5 > 0.75)) else (_S.index_value(_n_C,5) if _S.truth((_n_f_b5 > 0.4)) else _S.index_value(_n_C,3))), (_n_life_b3 * (0.3 + (0.7 * _n_f_b5)))])
				_n_i_b4 += 1.0
		if _S.truth((_n_life_b3 > 0.5)):
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_w_b2,"x"), _S.named_value(_n_w_b2,"y"), 5, _S.index_value(_n_C,5), (0.25 * _n_life_b3)])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_T0 = _S.read(_parent,"T0")
	var _n_SWEEP = _S.read(_parent,"SWEEP")
	var _n_t_b0 = _S.arg(_args,0)
	return _S.invoke(_n_ease,"inOutSine",[clampf((float((_n_t_b0 - _n_T0))/_n_SWEEP),0.0,1.0)])
	return null
