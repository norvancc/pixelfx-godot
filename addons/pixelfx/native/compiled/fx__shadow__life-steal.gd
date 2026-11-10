@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/life-steal.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "ringFast", _S.import_value("fx/shadow/_lib.js", "ringFast"))
	_S.define(_e, "Drops", _S.import_value("fx/shadow/_lib.js", "Drops"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Life steal"}, {"desc": "A target on the right is struck and bleeds red orbs; they hang a moment, then whip home as comet streaks and flood the caster crimson."}, {"tags": ["shadow", "life-steal", "drain", "blood", "heal", "directional", "magic", "one-shot"]}, {"size": [184, 100]}, {"origin": [36, 92]}, {"duration": 2.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#14040a", "#3a0a14", "#6a101c", "#a01824", "#d42a30", "#ff5a50", "#ff9a8a", "#ffe6de"]}, {"dark": "#2a1040"}, {"seed": 11}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "GRASP", _S.merge([_S.read(_e, "READY"), {"crouch": 3}, {"lean": 3}, {"fx": 17}, {"fy": _S.unary("-", 28)}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 21)}, {"ffx": 10}, {"fbx": _S.unary("-", 9)}]))
	_S.define(_e, "FED", _S.merge([{"turn": 1.15}, {"crouch": 0}, {"lean": _S.unary("-", 3)}, {"hy": _S.unary("-", 1)}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 37)}, {"bx": 14}, {"by": _S.unary("-", 37)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"target": _S.merge([{"x": 104}])}, {"poses": [[_S.unary("-", 0.46), _S.read(_e, "READY")], [_S.unary("-", 0.2), _S.merge([_S.read(_e, "READY"), {"crouch": 4}, {"lean": _S.unary("-", 2)}, {"fx": 3}, {"fy": _S.unary("-", 27)}, {"bx": 8}, {"by": _S.unary("-", 20)}])], [0, _S.read(_e, "GRASP"), "snap"], [0.4, _S.read(_e, "GRASP")], [0.7, _S.merge([_S.read(_e, "GRASP"), {"fx": 13}, {"fy": _S.unary("-", 26)}, {"lean": 1}])], [0.8, _S.merge([_S.read(_e, "FED"), {"crouch": 2}]), "snap"], [1.22, _S.read(_e, "FED")], [1.7, _S.merge([{"turn": 1}, {"crouch": 2}, {"fx": _S.unary("-", 11)}, {"fy": _S.unary("-", 26)}, {"bx": 12}, {"by": _S.unary("-", 26)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}])], [2.2, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": 0.01}, {"stop": 0.07}, {"shake": 0.12}, {"amp": 1}, {"push": 1.6}, {"straw": 12}, {"skin": "red"}, {"y": _S.unary("-", 24)}]), _S.merge([{"t": 1.6}, {"push": 0}, {"straw": 0}, {"flash": 0}, {"skin": null}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "TX", 104)
	_S.define(_e, "TY", _S.unary("-", 24))
	_S.define(_e, "HX", 1)
	_S.define(_e, "HY", _S.unary("-", 20))
	_S.define(_e, "N", 7)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)]}])]))
	_S.define(_e, "drops", _S.construct(_S.read(_e, "Drops"), [_S.merge([{"onLand": _S.function_value(_e, "_f2")}])]))
	_S.define(_e, "stains", [])
	_S.define(_e, "lights", [])
	_S.define(_e, "orbs", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.read(_v0, "N"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v1, "Math"), "PI")), 2), _S.binary("*", _S.binary("-", _S.read(_v1, "i"), _S.binary("/", _S.binary("-", _S.read(_v1, "N"), 1), 2)), 0.4)), _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 0.12), 0.12])))
		_S.define(_v1, "sp", _S.invoke(_S.read(_v1, "R"), "range", [100, 170]))
		_S.invoke(_S.read(_v1, "orbs"), "push", [_S.merge([{"x": _S.read(_v1, "TX")}, {"y": _S.read(_v1, "TY")}, {"vx": _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), 10)}, {"vy": _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "sp"))}, {"home": _S.binary("+", _S.binary("+", 0.36, _S.binary("*", _S.read(_v1, "i"), 0.05)), _S.invoke(_S.read(_v1, "R"), "range", [0, 0.04]))}, {"trail": []}, {"done": false}, {"at": 0}, {"size": _S.invoke(_S.read(_v1, "R"), "range", [1.6, 2.4])}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "flush", 0)
	_S.define(_e, "light", _S.function_value(_e, "_f3"))
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"drawBack": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_stains = _S.read(_parent,"stains")
	var _n_t = _S.read(_parent,"t")
	var _n_x_b0 = _S.arg(_args,0)
	return _S.invoke(_n_stains,"push",[{"x":_n_x_b0,"t0":_n_t}])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_lights = _S.read(_parent,"lights")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_c_b3 = _S.arg(_args,3)
	var _n_k_b4 = _S.arg(_args,4)
	var _n_life_b5 = _S.arg(_args,5)
	return _S.invoke(_n_lights,"push",[{"x":_n_x_b0,"y":_n_y_b1,"r":_n_r_b2,"c":_n_c_b3,"k":_n_k_b4,"life":_n_life_b5,"max":_n_life_b5}])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.unary("!", _S.read(_e, "hit"))):
		var _v2 = _S.scope(_e)
		_S.write(_v2, "hit", true, "=", false)
		_S.call_value(_S.read(_v2, "light"), [_S.read(_v2, "TX"), _S.read(_v2, "TY"), 54, _S.prop(_S.read(_v2, "C"), 5), 1, 0.35])
		_S.call_value(_S.read(_v2, "light"), [_S.read(_v2, "TX"), _S.read(_v2, "TY"), 18, _S.read(_v2, "WHITE"), 1, 0.08])
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "i"), 14)):
			_S.invoke(_S.read(_v3, "drops"), "add", [_S.binary("+", _S.read(_v3, "TX"), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("+", _S.read(_v3, "TY"), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 3), 3])), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 40), 90]), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 140), _S.unary("-", 20)]), (2 if _S.truth(_S.invoke(_S.read(_v3, "R"), "chance", [0.4])) else 1)])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
		var _v4 = _S.scope(_v2)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), 12)):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "a", _S.invoke(_S.read(_v5, "R"), "range", [0, _S.read(_v5, "TAU")]))
			_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "R"), "range", [80, 170]))
			_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "SPARK"), _S.read(_v5, "TX"), _S.read(_v5, "TY"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.invoke(_S.read(_v5, "R"), "range", [0.15, 0.35])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
	for _v6 in _S.array(_S.read(_e, "orbs")):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "b", _v6)
		var _v8 = _S.scope(_v7)
		if _S.truth(_S.prop(_S.read(_v8, "b"), "done")):
			continue
		if _S.truth(_S.binary("<", _S.read(_v8, "t"), _S.prop(_S.read(_v8, "b"), "home"))):
			var _v9 = _S.scope(_v8)
			_S.set_prop(_S.read(_v9, "b"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v9, "b"), "vx"), 5), _S.read(_v9, "dt")), "-=", false)
			_S.set_prop(_S.read(_v9, "b"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v9, "b"), "vy"), 5), _S.read(_v9, "dt")), "-=", false)
		else:
			var _v10 = _S.scope(_v8)
			_S.define(_v10, "dx", _S.binary("-", _S.read(_v10, "HX"), _S.prop(_S.read(_v10, "b"), "x")))
			_S.define(_v10, "dy", _S.binary("-", _S.read(_v10, "HY"), _S.prop(_S.read(_v10, "b"), "y")))
			_S.define(_v10, "d", _S.logical("||", _S.invoke(_S.read(_v10, "Math"), "hypot", [_S.read(_v10, "dx"), _S.read(_v10, "dy")]), func(): return 1))
			_S.define(_v10, "pull", _S.binary("*", 2600, _S.invoke(_S.read(_v10, "Math"), "min", [1, _S.binary("*", _S.binary("-", _S.read(_v10, "t"), _S.prop(_S.read(_v10, "b"), "home")), 3)])))
			_S.set_prop(_S.read(_v10, "b"), "vx", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v10, "dx"), _S.read(_v10, "d")), _S.read(_v10, "pull")), _S.read(_v10, "dt")), "+=", false)
			_S.set_prop(_S.read(_v10, "b"), "vy", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v10, "dy"), _S.read(_v10, "d")), _S.read(_v10, "pull")), _S.read(_v10, "dt")), "+=", false)
			_S.set_prop(_S.read(_v10, "b"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v10, "b"), "vx"), 2.2), _S.read(_v10, "dt")), "-=", false)
			_S.set_prop(_S.read(_v10, "b"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v10, "b"), "vy"), 2.2), _S.read(_v10, "dt")), "-=", false)
			if _S.truth(_S.binary("<", _S.read(_v10, "d"), 6)):
				var _v11 = _S.scope(_v10)
				_S.set_prop(_S.read(_v11, "b"), "done", true, "=", false)
				_S.set_prop(_S.read(_v11, "b"), "at", _S.read(_v11, "t"), "=", false)
				_S.write(_v11, "flush", _S.invoke(_S.read(_v11, "Math"), "min", [1.5, _S.binary("+", _S.read(_v11, "flush"), 0.45)]), "=", false)
				_S.call_value(_S.read(_v11, "light"), [_S.read(_v11, "HX"), _S.read(_v11, "HY"), 30, _S.prop(_S.read(_v11, "C"), 5), 0.8, 0.25])
				var _v12 = _S.scope(_v11)
				_S.define(_v12, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v12, "i"), 6)):
					var _v13 = _S.scope(_v12)
					_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")]))
					_S.define(_v13, "sp", _S.invoke(_S.read(_v13, "R"), "range", [40, 100]))
					_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "SPARK"), _S.read(_v13, "HX"), _S.read(_v13, "HY"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), 20), _S.invoke(_S.read(_v13, "R"), "range", [0.12, 0.3])])
					_v12 = _S.iteration(_v12)
					_S.write(_v12, "i", 1, "+=", true)
				var _v14 = _S.scope(_v11)
				_S.define(_v14, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v14, "i"), 3)):
					_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "EMBER"), _S.binary("+", _S.read(_v14, "HX"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 8), 8])), _S.binary("+", _S.read(_v14, "HY"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 6), 14])), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [15, 35])), _S.invoke(_S.read(_v14, "R"), "range", [0.6, 1.1]), _S.prop(_S.read(_v14, "C"), 6)])
					_v14 = _S.iteration(_v14)
					_S.write(_v14, "i", 1, "+=", true)
		_S.set_prop(_S.read(_v8, "b"), "x", _S.binary("*", _S.prop(_S.read(_v8, "b"), "vx"), _S.read(_v8, "dt")), "+=", false)
		_S.set_prop(_S.read(_v8, "b"), "y", _S.binary("*", _S.prop(_S.read(_v8, "b"), "vy"), _S.read(_v8, "dt")), "+=", false)
		_S.invoke(_S.prop(_S.read(_v8, "b"), "trail"), "unshift", [[_S.prop(_S.read(_v8, "b"), "x"), _S.prop(_S.read(_v8, "b"), "y")]])
		if _S.truth(_S.binary(">", _S.prop(_S.prop(_S.read(_v8, "b"), "trail"), "length"), 26)):
			_S.invoke(_S.prop(_S.read(_v8, "b"), "trail"), "pop", [])
	_S.write(_e, "flush", _S.binary("*", _S.binary("*", _S.read(_e, "flush"), 2.6), _S.read(_e, "dt")), "-=", false)
	var _v15 = _S.scope(_e)
	_S.define(_v15, "i", _S.binary("-", _S.prop(_S.read(_v15, "lights"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v15, "i"), 0)):
		if _S.truth(_S.binary("<=", _S.set_prop(_S.prop(_S.read(_v15, "lights"), _S.read(_v15, "i")), "life", _S.read(_v15, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v15, "lights"), "splice", [_S.read(_v15, "i"), 1])
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "i", 1, "-=", true)
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", _S.binary("-", _S.prop(_S.read(_v16, "stains"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v16, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v16, "t"), _S.prop(_S.prop(_S.read(_v16, "stains"), _S.read(_v16, "i")), "t0")), 0.8)):
			_S.invoke(_S.read(_v16, "stains"), "splice", [_S.read(_v16, "i"), 1])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "drops"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_TX = _S.read(_parent,"TX")
	var _n_TY = _S.read(_parent,"TY")
	var _n_C = _S.read(_parent,"C")
	var _n_stains = _S.read(_parent,"stains")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = (1 - _S.MathFX.smooth(0.1,0.9,_n_t))
	if _S.truth((_n_k_b1 > 0)):
		_S.invoke(_n_p_b0,"disc",[_n_TX, _n_TY, (6 + (_n_t * 10)), _S.index_value(_n_C,2), (0.5 * _n_k_b1)])
		_S.invoke(_n_p_b0,"glow",[_n_TX, _n_TY, 30, _S.index_value(_n_C,4), (0.35 * _n_k_b1)])
	for _iter_0 in _S.array(_n_stains):
		var _n_s_b2 = _iter_0
		_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_s_b2,"x"), (-0.5), _S.index_value(_n_C,3), (1 - (float((_n_t - _S.named_value(_n_s_b2,"t0")))/0.8))])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_flush = _S.read(_parent,"flush")
	var _n_t = _S.read(_parent,"t")
	var _n_A = _S.read(_parent,"A")
	var _n_C = _S.read(_parent,"C")
	var _n_HX = _S.read(_parent,"HX")
	var _n_HY = _S.read(_parent,"HY")
	var _n_TX = _S.read(_parent,"TX")
	var _n_TY = _S.read(_parent,"TY")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ease = _S.read(_parent,"ease")
	var _n_ringFast = _S.read(_parent,"ringFast")
	var _n_drops = _S.read(_parent,"drops")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_orbs = _S.read(_parent,"orbs")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_fk_b1 = (minf(1,_n_flush) * (1 - _S.MathFX.smooth(1.5,2.05,_n_t)))
	if _S.truth(((_n_fk_b1 > 0.03) if _S.truth(_n_A) else _n_A)):
		if true:
			var _n_my_b3 = 0
			while _S.truth((_n_my_b3 < _S.named_value(_n_A,"h"))):
				if true:
					var _n_mx_b4 = 0
					while _S.truth((_n_mx_b4 < _S.named_value(_n_A,"w"))):
						var _n_c0_b5 = _S.index_value(_S.named_value(_n_A,"pixels"),((_n_my_b3 * _S.named_value(_n_A,"w")) + _n_mx_b4))
						if _S.truth(not _S.truth(_n_c0_b5)):
							_n_mx_b4 += 1.0
							continue
						var _n_l_b6 = _S.ColorFX.luma(_n_c0_b5)
						_S.invoke(_n_p_b0,"blend",[(_S.named_value(_n_A,"x") + _n_mx_b4), (_S.named_value(_n_A,"y") + _n_my_b3), (_S.index_value(_n_C,6) if _S.truth((_n_l_b6 > 0.6)) else (_S.index_value(_n_C,5) if _S.truth((_n_l_b6 > 0.4)) else (_S.index_value(_n_C,4) if _S.truth((_n_l_b6 > 0.2)) else _S.index_value(_n_C,3)))), (0.45 * _n_fk_b1)])
						_n_mx_b4 += 1.0
				_n_my_b3 += 1.0
		if _S.truth((_n_fk_b1 > 0.12)):
			_S.invoke(_n_p_b0,"outline",[_S.named_value(_n_A,"mask"), _S.named_value(_n_A,"x"), _S.named_value(_n_A,"y"), (_S.index_value(_n_C,6) if _S.truth((_n_fk_b1 > 0.6)) else (_S.index_value(_n_C,5) if _S.truth((_n_fk_b1 > 0.3)) else _S.index_value(_n_C,3)))])
		_S.invoke(_n_p_b0,"glow",[_n_HX, _n_HY, 28, _S.index_value(_n_C,5), (0.45 * _n_fk_b1)])
	if _S.truth((_n_t < 0.12)):
		_S.call_value(_n_sparkle,[_n_p_b0, _n_TX, _n_TY, (10 * (1 - (float(_n_t)/0.12))), _S.index_value(_n_C,7), _S.index_value(_n_C,5), 0.6])
	var _n_ru_b2 = (float(_n_t)/0.28)
	if _S.truth((_n_ru_b2 < 1)):
		_S.call_value(_n_ringFast,[_n_p_b0, _n_TX, _n_TY, (4 + (16 * _S.invoke(_n_ease,"outCubic",[_n_ru_b2]))), maxf(1,(2 * (1 - _n_ru_b2))), (_S.index_value(_n_C,7) if _S.truth((_n_ru_b2 < 0.4)) else _S.index_value(_n_C,5))])
	_S.invoke(_n_drops,"draw",[_n_p_b0, _S.index_value(_n_C,3), _S.index_value(_n_C,6)])
	for _iter_0 in _S.array(_n_orbs):
		var _n_b_b7 = _iter_0
		if _S.truth((((_n_t - _S.named_value(_n_b_b7,"at")) > 0.2) if _S.truth(_S.named_value(_n_b_b7,"done")) else _S.named_value(_n_b_b7,"done"))):
			continue
		var _n_n_b8 = (floori((_S.prop(_S.named_value(_n_b_b7,"trail"),"length") * (1 - (float((_n_t - _S.named_value(_n_b_b7,"at")))/0.2)))) if _S.truth(_S.named_value(_n_b_b7,"done")) else _S.prop(_S.named_value(_n_b_b7,"trail"),"length"))
		if true:
			var _n_i_b10 = (_n_n_b8 - 1)
			while _S.truth((_n_i_b10 >= 1)):
				var _n_u_b11 = (float(_n_i_b10)/25)
				var _tuple_1 = _S.index_value(_S.named_value(_n_b_b7,"trail"),(_n_i_b10 - 1))
				var _n_x0_b12 = _S.prop(_tuple_1,0)
				var _n_y0_b13 = _S.prop(_tuple_1,1)
				var _tuple_2 = _S.index_value(_S.named_value(_n_b_b7,"trail"),_n_i_b10)
				var _n_x1_b14 = _S.prop(_tuple_2,0)
				var _n_y1_b15 = _S.prop(_tuple_2,1)
				_S.invoke(_n_p_b0,"line",[_n_x1_b14, _n_y1_b15, _n_x0_b12, _n_y0_b13, (_S.index_value(_n_C,7) if _S.truth((_n_u_b11 < 0.15)) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b11 < 0.35)) else (_S.index_value(_n_C,5) if _S.truth((_n_u_b11 < 0.6)) else (_S.index_value(_n_C,4) if _S.truth((_n_u_b11 < 0.8)) else _S.index_value(_n_C,2)))))])
				if _S.truth((_n_i_b10 < 7)):
					_S.invoke(_n_p_b0,"disc",[_n_x1_b14, _n_y1_b15, ((_S.named_value(_n_b_b7,"size") + 0.4) * (1 - (float(_n_i_b10)/7))), (_S.index_value(_n_C,6) if _S.truth((_n_u_b11 < 0.12)) else _S.index_value(_n_C,5)), 0.8])
				if _S.truth(_S.binary("===",fmod(_n_i_b10,6),3)):
					_S.invoke(_n_p_b0,"glow",[_n_x1_b14, _n_y1_b15, 6, _S.index_value(_n_C,5), (0.2 * (1 - _n_u_b11))])
				_n_i_b10 -= 1.0
		if _S.truth(_S.named_value(_n_b_b7,"done")):
			continue
		var _n_pulse_b9 = ((0.8 + (0.2 * sin(((_n_t * 30) + (_S.named_value(_n_b_b7,"size") * 9))))) if _S.truth((_n_t < _S.named_value(_n_b_b7,"home"))) else 1)
		_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_b_b7,"x"), _S.named_value(_n_b_b7,"y"), (_S.named_value(_n_b_b7,"size") + 0.9), _S.index_value(_n_C,4)])
		_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_b_b7,"x"), _S.named_value(_n_b_b7,"y"), (_S.named_value(_n_b_b7,"size") * _n_pulse_b9), _S.index_value(_n_C,6)])
		_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_b_b7,"x") - 0.5), (_S.named_value(_n_b_b7,"y") - 0.5), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_b_b7,"x"), _S.named_value(_n_b_b7,"y"), 9, _S.index_value(_n_C,5), 0.5])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	for _iter_3 in _S.array(_n_lights):
		var _n_l_b16 = _iter_3
		var _n_q_b17 = (float(_S.named_value(_n_l_b16,"life"))/_S.named_value(_n_l_b16,"max"))
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_l_b16,"x"), _S.named_value(_n_l_b16,"y"), (_S.named_value(_n_l_b16,"r") * (0.6 + (0.4 * _n_q_b17))), _S.named_value(_n_l_b16,"c"), ((_S.named_value(_n_l_b16,"k") * _n_q_b17) * _n_q_b17)])
	return null
