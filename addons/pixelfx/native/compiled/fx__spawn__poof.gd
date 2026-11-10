@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/poof.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Poof"}, {"desc": "A cartoon death poof: a white pop, a ring of soft round smoke balls bursting out between speed lines, little stars spinning off, and the cloud lifting and thinning away."}, {"tags": ["spawn", "death", "despawn", "smoke", "poof", "cartoon", "one-shot"]}, {"size": [112, 92]}, {"origin": [56, 80]}, {"duration": 1.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#2a2440", "#5e5878", "#9a94b4", "#cdc8e0", "#f2f0fa", "#ffffff"]}, {"stars": ["#ffd84a", "#fff3a6", "#ffffff"]}, {"seed": 21}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CY", _S.unary("-", 17))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "stars"), 3]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "S"), 1), _S.prop(_S.read(_e, "S"), 0), _S.prop(_S.read(_e, "C"), 2)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "balls", [])
	_S.define(_e, "lines", [])
	_S.define(_e, "ring", 9)
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.read(_v0, "ring"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v1, "i"), _S.read(_v1, "ring")), _S.read(_v1, "TAU")), _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 0.2), 0.2])))
		_S.define(_v1, "sp", _S.invoke(_S.read(_v1, "R"), "range", [95, 140]))
		_S.define(_v1, "r", _S.invoke(_S.read(_v1, "R"), "range", [5, 7]))
		_S.invoke(_S.read(_v1, "balls"), "push", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), 3)}, {"y": _S.binary("+", _S.read(_v1, "CY"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), 3))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), 0.8), 12)}, {"r0": _S.binary("*", _S.read(_v1, "r"), 0.5)}, {"r1": _S.read(_v1, "r")}, {"life": _S.invoke(_S.read(_v1, "R"), "range", [0.7, 1.05])}, {"delay": _S.invoke(_S.read(_v1, "R"), "range", [0, 0.03])}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 5)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
		_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [20, 60]))
		_S.invoke(_S.read(_v3, "balls"), "push", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), 2)}, {"y": _S.binary("+", _S.read(_v3, "CY"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), 2))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), 16)}, {"r0": 4}, {"r1": _S.invoke(_S.read(_v3, "R"), "range", [6.5, 8.5])}, {"life": _S.invoke(_S.read(_v3, "R"), "range", [0.85, 1.2])}, {"delay": _S.invoke(_S.read(_v3, "R"), "range", [0.02, 0.06])}])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), 7)):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "a", _S.invoke(_S.read(_v5, "R"), "range", [0, _S.read(_v5, "TAU")]))
		_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "R"), "range", [170, 240]))
		_S.define(_v5, "r", _S.invoke(_S.read(_v5, "R"), "range", [2.2, 3.6]))
		_S.invoke(_S.read(_v5, "balls"), "push", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), 4)}, {"y": _S.binary("+", _S.read(_v5, "CY"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), 4))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), 0.75), 10)}, {"r0": _S.binary("*", _S.read(_v5, "r"), 0.6)}, {"r1": _S.read(_v5, "r")}, {"life": _S.invoke(_S.read(_v5, "R"), "range", [0.32, 0.5])}, {"delay": _S.invoke(_S.read(_v5, "R"), "range", [0.01, 0.04])}])])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	for _v6 in _S.array(_S.read(_e, "balls")):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "b", _v6)
		_S.set_prop(_S.read(_v7, "b"), "max", _S.prop(_S.read(_v7, "b"), "life"), "=", false)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), 12)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "a", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v9, "i"), 12), _S.read(_v9, "TAU")), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 0.12), 0.12])), 0.13))
		_S.define(_v9, "sa", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]))
		_S.invoke(_S.read(_v9, "lines"), "push", [_S.merge([{"a": _S.read(_v9, "a")}, {"r1": _S.invoke(_S.read(_v9, "Math"), "min", [_S.invoke(_S.read(_v9, "R"), "range", [24, 34]), (_S.binary("/", _S.binary("-", _S.unary("-", 2), _S.read(_v9, "CY")), _S.read(_v9, "sa")) if _S.truth(_S.binary(">", _S.read(_v9, "sa"), 0.1)) else 99)])}, {"d": _S.invoke(_S.read(_v9, "R"), "range", [0, 0.04])}])])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), 7)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "a", _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v11, "Math"), "PI")), 0.3]))
		_S.define(_v11, "sp", _S.invoke(_S.read(_v11, "R"), "range", [70, 125]))
		_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), 6), _S.binary("+", _S.read(_v11, "CY"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), 6)), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), 30), _S.invoke(_S.read(_v11, "R"), "range", [0.55, 0.95]), _S.invoke(_S.read(_v11, "R"), "pick", [[_S.prop(_S.read(_v11, "S"), 2), _S.prop(_S.read(_v11, "S"), 1), _S.prop(_S.read(_v11, "S"), 1), _S.prop(_S.read(_v11, "S"), 0)]]), _S.invoke(_S.read(_v11, "R"), "range", [1.3, 2.4]), _S.invoke(_S.read(_v11, "R"), "range", [0.02, 0.1])])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), 10)):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")]))
		_S.define(_v13, "sp", _S.invoke(_S.read(_v13, "R"), "range", [40, 110]))
		_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), 5), _S.binary("+", _S.read(_v13, "CY"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), 5)), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), 20), _S.invoke(_S.read(_v13, "R"), "range", [0.3, 0.6]), _S.invoke(_S.read(_v13, "R"), "pick", [[_S.read(_v13, "WHITE"), _S.prop(_S.read(_v13, "S"), 1)]]), 0.6, _S.invoke(_S.read(_v13, "R"), "range", [0, 0.08])])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), 6)):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "s", _S.invoke(_S.read(_v15, "R"), "sign", []))
		_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "DUST"), _S.binary("*", _S.read(_v15, "s"), _S.invoke(_S.read(_v15, "R"), "range", [1, 6])), _S.unary("-", 1), _S.binary("*", _S.read(_v15, "s"), _S.invoke(_S.read(_v15, "R"), "range", [25, 70])), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [2, 10])), _S.invoke(_S.read(_v15, "R"), "range", [0.4, 0.7]), _S.prop(_S.read(_v15, "C"), 2), _S.invoke(_S.read(_v15, "R"), "range", [1.6, 3]), _S.invoke(_S.read(_v15, "R"), "range", [0.02, 0.08])])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.read(_e, "CY"), 46, _S.prop(_S.read(_e, "C"), 4), 0.8, 0.4])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.read(_e, "CY"), 22, _S.read(_e, "WHITE"), 0.8, 0.1])
	_S.define(_e, "t", 0)
	_S.define(_e, "radius", _S.function_value(_e, "_f2"))
	_S.define(_e, "drawBall", _S.function_value(_e, "_f3"))
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"drawBack": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_b_b0 = _S.arg(_args,0)
	var _n_age_b1 = (_S.named_value(_n_b_b0,"max") - _S.named_value(_n_b_b0,"life"))
	var _n_u_b2 = (float(_n_age_b1)/_S.named_value(_n_b_b0,"max"))
	var _n_grow_b3 = (_S.named_value(_n_b_b0,"r0") + ((_S.named_value(_n_b_b0,"r1") - _S.named_value(_n_b_b0,"r0")) * _S.invoke(_n_ease,"outBack",[clampf((float(_n_age_b1)/0.22),0.0,1.0), 2])))
	var _n_breathe_b4 = (1 + (0.06 * sin(((_n_age_b1 * 14) + _S.named_value(_n_b_b0,"r1")))))
	return ((_n_grow_b3 * _n_breathe_b4) * (1 if _S.truth((_n_u_b2 < 0.62)) else (1 - _S.invoke(_n_ease,"inBack",[clampf((float((_n_u_b2 - 0.62))/0.38),0.0,1.0), 1.4]))))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_radius = _S.read(_parent,"radius")
	var _n_CY = _S.read(_parent,"CY")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_layer_b2 = _S.arg(_args,2)
	var _n_age_b3 = (_S.named_value(_n_b_b1,"max") - _S.named_value(_n_b_b1,"life"))
	var _n_r_b4 = _S.call_value(_n_radius,[_n_b_b1])
	var _n_a_b5 = minf(1,(_n_age_b3 * 20))
	var _n_lit_b6 = (_n_age_b3 < 0.12)
	if _S.truth((_n_r_b4 < 0.6)):
		return null
	var _n_hy_b7 = (float(((_S.named_value(_n_b_b1,"y") - _n_CY) + 6))/14)
	var _n_lo_b8 = (_n_hy_b7 > 0.4)
	var _n_hi_b9 = (_n_hy_b7 < (-0.3))
	if _S.truth(_S.binary("===",_n_layer_b2,"shade")):
		_S.invoke(_n_p_b0,"disc",[(_S.named_value(_n_b_b1,"x") + (_n_r_b4 * 0.16)), (_S.named_value(_n_b_b1,"y") + (_n_r_b4 * 0.2)), _n_r_b4, (_S.index_value(_n_C,3) if _S.truth(_n_lit_b6) else (_S.index_value(_n_C,1) if _S.truth(_n_lo_b8) else _S.index_value(_n_C,2))), (0.8 * _n_a_b5)])
	else:
		if _S.truth(_S.binary("===",_n_layer_b2,"body")):
			_S.invoke(_n_p_b0,"disc",[(_S.named_value(_n_b_b1,"x") - (_n_r_b4 * 0.06)), (_S.named_value(_n_b_b1,"y") - (_n_r_b4 * 0.08)), (_n_r_b4 * 0.86), (_S.index_value(_n_C,4) if _S.truth(_n_lit_b6) else (_S.index_value(_n_C,2) if _S.truth(_n_lo_b8) else _S.index_value(_n_C,3))), (0.88 * _n_a_b5)])
		else:
			if _S.truth((not _S.truth(_n_lo_b8) if _S.truth(not _S.truth(_n_lo_b8)) else _n_lit_b6)):
				_S.invoke(_n_p_b0,"disc",[(_S.named_value(_n_b_b1,"x") - (_n_r_b4 * 0.28)), (_S.named_value(_n_b_b1,"y") - (_n_r_b4 * 0.34)), (_n_r_b4 * 0.42), (_n_WHITE if _S.truth((_n_lit_b6 if _S.truth(_n_lit_b6) else _n_hi_b9)) else _S.index_value(_n_C,4)), (0.85 * _n_a_b5)])
				if _S.truth((_n_age_b3 < 0.25)):
					_S.invoke(_n_p_b0,"disc",[(_S.named_value(_n_b_b1,"x") - (_n_r_b4 * 0.3)), (_S.named_value(_n_b_b1,"y") - (_n_r_b4 * 0.38)), (_n_r_b4 * 0.2), _n_WHITE, ((0.9 * _n_a_b5) * (1 - (float(_n_age_b3)/0.25)))])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	var _v17 = _S.scope(_e)
	_S.define(_v17, "i", _S.binary("-", _S.prop(_S.read(_v17, "balls"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v17, "i"), 0)):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "b", _S.prop(_S.read(_v18, "balls"), _S.read(_v18, "i")))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v18, "b"), "delay"), 0)):
			var _v19 = _S.scope(_v18)
			_S.set_prop(_S.read(_v19, "b"), "delay", _S.read(_v19, "dt"), "-=", false)
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v18, "b"), "life", _S.read(_v18, "dt"), "-=", false), 0)):
			var _v20 = _S.scope(_v18)
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v20, "b"), "r1"), 4)):
				_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "STAR"), _S.prop(_S.read(_v20, "b"), "x"), _S.prop(_S.read(_v20, "b"), "y"), 0, _S.unary("-", 8), 0.22, _S.read(_v20, "WHITE"), 0.6])
			_S.invoke(_S.read(_v20, "balls"), "splice", [_S.read(_v20, "i"), 1])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v18, "b"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v18, "b"), "vx"), 7), _S.read(_v18, "dt")), "-=", false)
		_S.set_prop(_S.read(_v18, "b"), "vy", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v18, "b"), "vy"), 7), _S.read(_v18, "dt")), _S.binary("*", 30, _S.read(_v18, "dt"))), "-=", false)
		_S.set_prop(_S.read(_v18, "b"), "x", _S.binary("*", _S.prop(_S.read(_v18, "b"), "vx"), _S.read(_v18, "dt")), "+=", false)
		_S.set_prop(_S.read(_v18, "b"), "y", _S.invoke(_S.read(_v18, "Math"), "min", [_S.binary("+", _S.prop(_S.read(_v18, "b"), "y"), _S.binary("*", _S.prop(_S.read(_v18, "b"), "vy"), _S.read(_v18, "dt"))), _S.binary("*", _S.unary("-", _S.call_value(_S.read(_v18, "radius"), [_S.read(_v18, "b")])), 0.7)]), "=", false)
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_C = _S.read(_parent,"C")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = (1 - _S.MathFX.smooth(0.1,0.9,_n_t))
	if _S.truth((_n_s_b1 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-1), 26, _S.index_value(_n_C,4), (0.25 * _n_s_b1)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_balls = _S.read(_parent,"balls")
	var _n_drawBall = _S.read(_parent,"drawBall")
	var _n_t = _S.read(_parent,"t")
	var _n_CY = _S.read(_parent,"CY")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_flare = _S.read(_parent,"flare")
	var _n_ease = _S.read(_parent,"ease")
	var _n_lines = _S.read(_parent,"lines")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_live_b1 = _S.invoke(_n_balls,"filter",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f7")])
	for _iter_0 in _S.array(["shade", "body", "cap"]):
		var _n_layer_b3 = _iter_0
		for _iter_1 in _S.array(_n_live_b1):
			var _n_b_b4 = _iter_1
			_S.call_value(_n_drawBall,[_n_p_b0, _n_b_b4, _n_layer_b3])
	if _S.truth((_n_t < 0.07)):
		var _n_k_b5 = (float(_n_t)/0.07)
		_S.invoke(_n_p_b0,"circle",[0, _n_CY, (9 + (3 * _n_k_b5)), _S.index_value(_n_C,4)])
		_S.invoke(_n_p_b0,"circle",[0, _n_CY, (7 + (3 * _n_k_b5)), _n_WHITE])
		_S.call_value(_n_flare,[_n_p_b0, 0, _n_CY, (20 * (1 - (_n_k_b5 * 0.5))), (1 - _n_k_b5), _n_C])
	var _n_rk_b2 = (float((_n_t - 0.03))/0.2)
	if _S.truth(((_n_rk_b2 < 1) if _S.truth((_n_rk_b2 > 0)) else (_n_rk_b2 > 0))):
		_S.invoke(_n_p_b0,"ring",[0, _n_CY, (8 + (18 * _S.invoke(_n_ease,"outCubic",[_n_rk_b2]))), maxf(1,(2.5 * (1 - _n_rk_b2))), (_n_WHITE if _S.truth((_n_rk_b2 < 0.3)) else _S.index_value(_n_C,4)), (1.1 - _n_rk_b2)])
	for _iter_2 in _S.array(_n_lines):
		var _n_l_b6 = _iter_2
		var _n_u_b7 = (float((_n_t - _S.named_value(_n_l_b6,"d")))/0.2)
		if _S.truth(((_n_u_b7 <= 0) if _S.truth((_n_u_b7 <= 0)) else (_n_u_b7 >= 1))):
			continue
		var _n_head_b8 = (8 + ((_S.named_value(_n_l_b6,"r1") - 8) * _S.invoke(_n_ease,"outExpo",[clampf((float(_n_u_b7)/0.6),0.0,1.0)])))
		var _n_tail_b9 = (8 + ((_S.named_value(_n_l_b6,"r1") - 8) * _S.invoke(_n_ease,"inCubic",[_n_u_b7])))
		var _n_ca_b10 = cos(_S.named_value(_n_l_b6,"a"))
		var _n_sa_b11 = sin(_S.named_value(_n_l_b6,"a"))
		_S.invoke(_n_p_b0,"line",[(_n_ca_b10 * _n_tail_b9), (_n_CY + (_n_sa_b11 * _n_tail_b9)), (_n_ca_b10 * _n_head_b8), (_n_CY + (_n_sa_b11 * _n_head_b8)), _S.function_value(_S.capture(_parent,{"this":_this}),"_f8")])
		_S.invoke(_n_p_b0,"glowLine",[(_n_ca_b10 * _n_tail_b9), (_n_CY + (_n_sa_b11 * _n_tail_b9)), (_n_ca_b10 * _n_head_b8), (_n_CY + (_n_sa_b11 * _n_head_b8)), 3, _S.index_value(_n_C,4), 0.25])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_b_b0 = _S.arg(_args,0)
	return (_S.named_value(_n_b_b0,"delay") <= 0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_v_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_v_b0 > 0.6)) else _S.index_value(_n_C,4))
	return null
