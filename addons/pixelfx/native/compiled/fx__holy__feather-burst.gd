@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/feather-burst.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "Feathers", _S.import_value("fx/holy/_lib.js", "Feathers"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Feather burst"}, {"desc": "A white puff pops and throws feathers that brake hard, then rock from side to side as they sink and fade, with down drifting after them."}, {"tags": ["holy", "feather", "burst", "poof", "angel", "bird", "one-shot"]}, {"size": [160, 160]}, {"origin": [80, 60]}, {"duration": 3}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#4a4560", "#7a7494", "#aaa5c2", "#d6d3e6", "#f4f3fa", "#ffffff"]}, {"glow": "#fff0c0"}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "puff", _S.function_value(_e, "_f1"))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "glow")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f3")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 2)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "loose", _S.construct(_S.read(_e, "Feathers"), [_S.read(_e, "R"), 1000000]))
	_S.define(_e, "lobes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 11}]), _S.function_value(_e, "_f4")]))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 20)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v4, "i"), 20), _S.read(_v4, "TAU")), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 0.15), 0.15])))
		_S.define(_v4, "sp", _S.invoke(_S.read(_v4, "R"), "range", [110, 230]))
		_S.define(_v4, "up", (0.7 if _S.truth(_S.binary("<", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), 0)) else 0.9))
		_S.invoke(_S.read(_v4, "loose"), "add", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), 3)}, {"y": _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), 3)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "sp")), _S.read(_v4, "up")), 20)}, {"a": _S.binary("+", _S.read(_v4, "a"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 0.5), 0.5]))}, {"len": _S.invoke(_S.read(_v4, "R"), "range", [10, 14])}, {"wid": _S.invoke(_S.read(_v4, "R"), "range", [2.6, 3.4])}, {"life": _S.invoke(_S.read(_v4, "R"), "range", [1.9, 2.6])}, {"delay": _S.invoke(_S.read(_v4, "R"), "range", [0, 0.03])}, {"sink": _S.invoke(_S.read(_v4, "R"), "range", [26, 38])}, {"amp": _S.invoke(_S.read(_v4, "R"), "range", [8, 13])}])])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), 10)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "a", _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")]))
		_S.define(_v6, "sp", _S.invoke(_S.read(_v6, "R"), "range", [50, 130]))
		_S.invoke(_S.read(_v6, "loose"), "add", [_S.merge([{"x": 0}, {"y": 0}, {"vx": _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), 20)}, {"a": _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")])}, {"len": _S.invoke(_S.read(_v6, "R"), "range", [6, 8])}, {"wid": _S.invoke(_S.read(_v6, "R"), "range", [1.8, 2.2])}, {"life": _S.invoke(_S.read(_v6, "R"), "range", [1.6, 2.4])}, {"back": true}, {"sink": _S.invoke(_S.read(_v6, "R"), "range", [18, 28])}])])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	var _v7 = _S.scope(_e)
	_S.define(_v7, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "i"), 26)):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "a", _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")]))
		_S.define(_v8, "sp", _S.invoke(_S.read(_v8, "R"), "range", [30, 140]))
		_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "FLAKE"), _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 3), 3]), _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 3), 3]), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), 15), _S.invoke(_S.read(_v8, "R"), "range", [1.4, 2.6]), (_S.read(_v8, "WHITE") if _S.truth(_S.invoke(_S.read(_v8, "R"), "chance", [0.6])) else _S.prop(_S.read(_v8, "F"), 4)), _S.invoke(_S.read(_v8, "R"), "range", [0.6, 1.6])])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "i", 1, "+=", true)
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), 10)):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "a", _S.invoke(_S.read(_v10, "R"), "range", [0, _S.read(_v10, "TAU")]))
		_S.define(_v10, "sp", _S.invoke(_S.read(_v10, "R"), "range", [60, 160]))
		_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "STAR"), 0, 0, _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.invoke(_S.read(_v10, "R"), "range", [0.3, 0.6]), (_S.read(_v10, "WHITE") if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.5])) else _S.read(_v10, "G")), _S.invoke(_S.read(_v10, "R"), "range", [0.8, 2.2])])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "lights"), "add", [0, 0, 50, _S.read(_e, "G"), 0.75, 0.45])
	_S.invoke(_S.read(_e, "lights"), "add", [0, 0, 20, _S.read(_e, "WHITE"), 0.7, 0.1])
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_ease = _S.read(_parent,"ease")
	var _n_F = _S.read(_parent,"F")
	var _n_lobes = _S.read(_parent,"lobes")
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_lobes):
		var _n_l_b1 = _iter_0
		var _n_u_b2 = (float(_n_t)/_S.named_value(_n_l_b1,"life"))
		if _S.truth((_n_u_b2 >= 1)):
			continue
		var _n_e_b3 = _S.invoke(_n_ease,"outCubic",[_n_u_b2])
		var _n_x_b4 = (_S.named_value(_n_l_b1,"x") * (0.4 + (_n_e_b3 * 1.3)))
		var _n_y_b5 = ((_S.named_value(_n_l_b1,"y") * (0.4 + (_n_e_b3 * 1.3))) - (_n_u_b2 * 5))
		var _n_r_b6 = ((_S.named_value(_n_l_b1,"r0") + ((_S.named_value(_n_l_b1,"r1") - _S.named_value(_n_l_b1,"r0")) * _S.invoke(_n_ease,"outCubic",[minf(1,(_n_u_b2 * 3))]))) * (1 - _S.invoke(_n_ease,"inQuad",[_n_u_b2])))
		if _S.truth((_n_r_b6 < 0.6)):
			continue
		_S.invoke(_n_p_b0,"circle",[_n_x_b4, _n_y_b5, (_n_r_b6 + 0.8), _S.index_value(_n_F,2)])
		_S.invoke(_n_p_b0,"circle",[_n_x_b4, _n_y_b5, _n_r_b6, _S.function_value(_S.capture(_parent,{"this":_this}),"_f2")])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_F = _S.read(_parent,"F")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_d_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_F,3) if _S.truth(((sin((_n_a_b1 + 0.8)) > 0.3) if _S.truth((_n_d_b0 > 0.55)) else (_n_d_b0 > 0.55))) else (_n_WHITE if _S.truth(((sin((_n_a_b1 + 0.8)) < (-0.2)) if _S.truth((_n_d_b0 < 0.45)) else (_n_d_b0 < 0.45))) else _S.index_value(_n_F,4)))
	return null

static func _f3(_parent,_args:Array,_this=null):
	return INF
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_a_b2 = (((float(_n_i_b1)/11) * _n_TAU) + _S.invoke(_n_R,"range",[(-0.25), 0.25]))
	var _n_d_b3 = _S.invoke(_n_R,"range",[5, 14])
	return {"x":(cos(_n_a_b2) * _n_d_b3),"y":((sin(_n_a_b2) * _n_d_b3) * 0.8),"r0":_S.invoke(_n_R,"range",[2.5, 4]),"r1":_S.invoke(_n_R,"range",[6, 9.5]),"life":_S.invoke(_n_R,"range",[0.45, 0.8])}
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.3), func(): return _S.binary("<", _S.read(_e, "t"), 2.2)), func(): return _S.prop(_S.read(_e, "loose"), "count")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.14]))):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "q", _S.invoke(_S.read(_v11, "R"), "pick", [_S.prop(_S.read(_v11, "loose"), "list")]))
		if _S.truth(_S.binary("<=", _S.prop(_S.read(_v11, "q"), "delay"), 0)):
			_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v11, "q"), "x"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("+", _S.prop(_S.read(_v11, "q"), "y"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 1), 1])), 0, 0, _S.invoke(_S.read(_v11, "R"), "range", [0.2, 0.4]), (_S.read(_v11, "WHITE") if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.5])) else _S.read(_v11, "G")), _S.invoke(_S.read(_v11, "R"), "range", [1, 2.2])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "loose"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_loose = _S.read(_parent,"loose")
	var _n_F = _S.read(_parent,"F")
	var _n_ps = _S.read(_parent,"ps")
	var _n_puff = _S.read(_parent,"puff")
	var _n_p_b0 = _S.arg(_args,0)
	_S.invoke(_n_loose,"draw",[_n_p_b0, _n_F, "back"])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	_S.call_value(_n_puff,[_n_p_b0])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ease = _S.read(_parent,"ease")
	var _n_G = _S.read(_parent,"G")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_loose = _S.read(_parent,"loose")
	var _n_F = _S.read(_parent,"F")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < 0.07)):
		_S.invoke(_n_p_b0,"circle",[0, 0, (9 * (1 - (float(_n_t)/0.14))), _n_WHITE])
	if _S.truth((_n_t < 0.25)):
		var _n_u_b1 = (float(_n_t)/0.25)
		_S.invoke(_n_p_b0,"ring",[0, 0, (6 + (24 * _S.invoke(_n_ease,"outCubic",[_n_u_b1]))), maxf(1,(2.5 * (1 - _n_u_b1))), _S.function_value(_S.capture(_parent,{"this":_this}),"_f8"), (1.1 - _n_u_b1)])
	if _S.truth((_n_t < 0.2)):
		_S.call_value(_n_sparkle,[_n_p_b0, 0, 0, (10 * (1 - (float(_n_t)/0.2))), _n_WHITE, _n_G, 0.6])
	_S.invoke(_n_p_b0,"glow",[0, 4, 46, _n_G, (0.28 * (1 - _S.MathFX.smooth(0,1.3,_n_t)))])
	_S.invoke(_n_loose,"draw",[_n_p_b0, _n_F, "front"])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_F = _S.read(_parent,"F")
	var _n_G = _S.read(_parent,"G")
	var _n_v_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_v_b0 > 0.5)) else _S.ColorFX.mix(_S.index_value(_n_F,4),_n_G,0.4))
	return null
