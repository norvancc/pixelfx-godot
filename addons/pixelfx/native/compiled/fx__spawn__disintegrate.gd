@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/disintegrate.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "noise2", _S.import_value("core/index.js", "noise2"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "bodyOf", _S.import_value("fx/spawn/_lib.js", "bodyOf"))
	_S.define(_e, "rimOf", _S.import_value("fx/spawn/_lib.js", "rimOf"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Disintegrate"}, {"desc": "The character crackles with light, flashes white, then peels away from the head down: each pixel flares white-hot and streams off on the wind as a cooling mote of light."}, {"tags": ["spawn", "death", "disintegrate", "dissolve", "pixels", "energy", "light", "one-shot"]}, {"size": [176, 100]}, {"origin": [48, 86]}, {"duration": 3.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#120a26", "#2a1658", "#3d2f9c", "#3f68d4", "#3fa8ec", "#86e0ff", "#d6f8ff", "#ffffff"]}, {"accent": ["#7a3ae4", "#b682ff", "#ecd2ff"]}, {"wind": 1}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "AGONY", _S.merge([{"turn": 1.15}, {"crouch": 0}, {"hy": _S.unary("-", 1)}, {"fx": _S.unary("-", 14)}, {"fy": _S.unary("-", 36)}, {"bx": 15}, {"by": _S.unary("-", 36)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[_S.unary("-", 0.2), _S.read(_e, "READY")], [0.05, _S.merge([{"turn": 1}, {"crouch": 3}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 16)}, {"bx": 10}, {"by": _S.unary("-", 16)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}])], [0.3, _S.read(_e, "AGONY")], [3.4, _S.read(_e, "AGONY")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "FLASH", 0.42)
	_S.define(_e, "WHITE_T", 0.07)
	_S.define(_e, "P0", _S.binary("+", _S.read(_e, "FLASH"), _S.read(_e, "WHITE_T")))
	_S.define(_e, "PEEL", 1.2)
	_S.define(_e, "CORE_Y", _S.unary("-", 20))
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f10"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "letGo", _S.function_value(_e, "_f1"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "accent"), 3]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "W", _S.prop(_S.read(_e, "o"), "wind"))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "COOL", [[_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)], [_S.prop(_S.read(_e, "A"), 2), _S.prop(_S.read(_e, "A"), 1), _S.prop(_S.read(_e, "A"), 1), _S.prop(_S.read(_e, "A"), 0)], [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 5)]])
	_S.define(_e, "body", _S.call_value(_S.read(_e, "bodyOf"), [_S.prop(_S.read(_e, "o"), "actor"), _S.read(_e, "C")]))
	_S.define(_e, "rim", _S.call_value(_S.read(_e, "rimOf"), [_S.read(_e, "body")]))
	_S.define(_e, "top", _S.prop(_S.read(_e, "body"), "y"))
	_S.define(_e, "H", _S.prop(_S.read(_e, "body"), "h"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	for _v1 in _S.array(_S.prop(_S.read(_e, "body"), "list")):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "b", _v1)
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "u", _S.binary("/", _S.binary("-", _S.prop(_S.read(_v3, "b"), "y"), _S.read(_v3, "top")), _S.read(_v3, "H")))
		_S.set_prop(_S.read(_v3, "b"), "key", _S.binary("-", _S.binary("+", _S.binary("+", _S.read(_v3, "u"), _S.binary("*", 0.14, _S.binary("-", _S.call_value(_S.read(_v3, "rand"), [_S.prop(_S.read(_v3, "b"), "mx"), _S.prop(_S.read(_v3, "b"), "my"), 3]), 0.5))), _S.binary("*", 0.05, _S.call_value(_S.read(_v3, "noise"), [_S.binary("*", _S.prop(_S.read(_v3, "b"), "mx"), 0.45), 7]))), (0.03 if _S.truth(_S.prop(_S.read(_v3, "b"), "edge")) else 0)), "=", false)
		_S.set_prop(_S.read(_v3, "b"), "gone", false, "=", false)
	_S.define(_e, "front", _S.function_value(_e, "_f3"))
	_S.define(_e, "motes", [])
	_S.define(_e, "gust", _S.function_value(_e, "_f4"))
	_S.define(_e, "t", 0)
	_S.define(_e, "flashed", false)
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_W = _S.read(_parent,"W")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_motes = _S.read(_parent,"motes")
	var _n_COOL = _S.read(_parent,"COOL")
	var _n_b_b0 = _S.arg(_args,0)
	_S.set_prop(_n_b_b0,"gone",true,"=")
	var _n_lo_b1 = (_S.invoke(_n_R,"chance",[0.22]) if _S.truth((_S.named_value(_n_b_b0,"y") > (-9))) else (_S.named_value(_n_b_b0,"y") > (-9)))
	var _n_kind_b2 = (2 if _S.truth(_n_lo_b1) else (1 if _S.truth(_S.invoke(_n_R,"chance",[0.42])) else (3 if _S.truth(_S.invoke(_n_R,"chance",[0.07])) else 0)))
	if _S.truth(_S.binary("===",_n_kind_b2,3)):
		_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"STAR"), _S.named_value(_n_b_b0,"x"), _S.named_value(_n_b_b0,"y"), (_S.invoke(_n_R,"range",[(-6), 14]) * _n_W), _S.invoke(_n_R,"range",[(-26), (-8)]), _S.invoke(_n_R,"range",[0.6, 1.1]), (_S.index_value(_n_C,6) if _S.truth(_S.invoke(_n_R,"chance",[0.5])) else _n_WHITE), _S.invoke(_n_R,"range",[1, 2.2])])
		return null
	var _n_life_b3 = (_S.invoke(_n_R,"range",[0.7, 1.2]) if _S.truth(_S.binary("===",_n_kind_b2,2)) else (_S.invoke(_n_R,"range",[0.25, 0.5]) if _S.truth(_S.binary("===",_n_kind_b2,1)) else _S.invoke(_n_R,"range",[0.9, 1.7])))
	var _n_out_b4 = ((_S.named_value(_n_b_b0,"x") + 0.5) * _S.invoke(_n_R,"range",[2, 6]))
	_S.invoke(_n_motes,"push",[{"x":(_S.named_value(_n_b_b0,"x") + 0.5),"y":(_S.named_value(_n_b_b0,"y") + 0.5),"vx":((_n_out_b4 + _S.invoke(_n_R,"range",[(-6), 16])) * (0.4 if _S.truth(_S.binary("===",_n_kind_b2,2)) else 1)),"vy":(_S.invoke(_n_R,"range",[(-30), (-8)]) if _S.truth(_S.binary("===",_n_kind_b2,2)) else _S.invoke(_n_R,"range",[(-46), (-8)])),"life":_n_life_b3,"max":_n_life_b3,"c":_S.named_value(_n_b_b0,"c"),"kind":_n_kind_b2,"lift":_S.invoke(_n_R,"range",[0.4, 1.4]),"cool":_S.index_value(_n_COOL,(1 if _S.truth(_S.invoke(_n_R,"chance",[0.3])) else (2 if _S.truth(_S.invoke(_n_R,"chance",[0.3])) else 0))),"own":_S.invoke(_n_R,"chance",[0.2]),"rest":false,"seed":_S.invoke(_n_R,"range",[0, 100])}])
	return null

static func _f2(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_P0 = _S.read(_parent,"P0")
	var _n_PEEL = _S.read(_parent,"PEEL")
	var _n_t_b0 = _S.arg(_args,0)
	return ((-0.06) + (1.14 * _S.invoke(_n_ease,"inOutSine",[clampf((float((_n_t_b0 - _n_P0))/_n_PEEL),0.0,1.0)])))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	return (0.7 + (0.5 * ((_S.MathFX.noise((_n_t_b0 * 1.6),11) * 0.5) + 0.5)))
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "FLASH"), 0.05)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.55]))):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "a", _S.invoke(_S.read(_v4, "R"), "range", [0, _S.read(_v4, "TAU")]))
		_S.define(_v4, "D", _S.invoke(_S.read(_v4, "R"), "range", [22, 44]))
		_S.define(_v4, "T", _S.invoke(_S.read(_v4, "R"), "range", [0.16, 0.26]))
		_S.define(_v4, "v", _S.binary("/", _S.binary("*", _S.read(_v4, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v4, "Math"), "exp", [_S.binary("*", 3, _S.read(_v4, "T"))]), 1)))
		_S.define(_v4, "x", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "D")))
		_S.define(_v4, "y", _S.invoke(_S.read(_v4, "Math"), "min", [_S.binary("+", _S.read(_v4, "CORE_Y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "D")), 0.9)), _S.unary("-", 3)]))
		_S.define(_v4, "l", _S.logical("||", _S.invoke(_S.read(_v4, "Math"), "hypot", [_S.read(_v4, "x"), _S.binary("-", _S.read(_v4, "y"), _S.read(_v4, "CORE_Y"))]), func(): return 1))
		_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "STREAK"), _S.read(_v4, "x"), _S.read(_v4, "y"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v4, "x")), _S.read(_v4, "l")), _S.read(_v4, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v4, "CORE_Y"), _S.read(_v4, "y")), _S.read(_v4, "l")), _S.read(_v4, "v")), _S.read(_v4, "T"), (_S.prop(_S.read(_v4, "C"), 6) if _S.truth(_S.invoke(_S.read(_v4, "R"), "chance", [0.5])) else _S.prop(_S.read(_v4, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "flashed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FLASH")))):
		var _v5 = _S.scope(_e)
		_S.write(_v5, "flashed", true, "=", false)
		_S.invoke(_S.read(_v5, "lights"), "add", [0, _S.read(_v5, "CORE_Y"), 64, _S.prop(_S.read(_v5, "C"), 4), 0.85, 0.6])
		_S.invoke(_S.read(_v5, "lights"), "add", [0, _S.read(_v5, "CORE_Y"), 30, _S.read(_v5, "WHITE"), 0.8, 0.14])
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 14)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [0, _S.read(_v7, "TAU")]))
			_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "R"), "range", [50, 150]))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "STAR"), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 6), 6]), _S.binary("+", _S.read(_v7, "CORE_Y"), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 10), 10])), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), 0.7), 25), _S.invoke(_S.read(_v7, "R"), "range", [0.35, 0.8]), _S.invoke(_S.read(_v7, "R"), "pick", [[_S.read(_v7, "WHITE"), _S.prop(_S.read(_v7, "C"), 6), _S.prop(_S.read(_v7, "C"), 5)]]), _S.invoke(_S.read(_v7, "R"), "range", [0.6, 1.8])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "P0"))):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "f", _S.call_value(_S.read(_v8, "front"), [_S.read(_v8, "t")]))
		for _v9 in _S.array(_S.prop(_S.read(_v8, "body"), "list")):
			var _v10 = _S.scope(_v8)
			_S.define(_v10, "b", _v9)
			if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v10, "b"), "gone")), func(): return _S.binary("<", _S.prop(_S.read(_v10, "b"), "key"), _S.read(_v10, "f")))):
				_S.call_value(_S.read(_v10, "letGo"), [_S.read(_v10, "b")])
	_S.define(_e, "g", _S.binary("*", _S.call_value(_S.read(_e, "gust"), [_S.read(_e, "t")]), _S.binary("-", 1, _S.binary("*", 0.55, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "P0"), _S.read(_e, "PEEL")), _S.binary("+", _S.binary("+", _S.read(_e, "P0"), _S.read(_e, "PEEL")), 1.2), _S.read(_e, "t")])))))
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", _S.binary("-", _S.prop(_S.read(_v11, "motes"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v11, "i"), 0)):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "m", _S.prop(_S.read(_v12, "motes"), _S.read(_v12, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v12, "m"), "life", _S.read(_v12, "dt"), "-=", false), 0)):
			var _v13 = _S.scope(_v12)
			_S.invoke(_S.read(_v13, "motes"), "splice", [_S.read(_v13, "i"), 1])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v12, "m"), "kind"), 2)):
			var _v14 = _S.scope(_v12)
			if _S.truth(_S.prop(_S.read(_v14, "m"), "rest")):
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "i", 1, "-=", true)
				continue
			_S.set_prop(_S.read(_v14, "m"), "vx", _S.binary("*", _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_v14, "W"), 30), _S.read(_v14, "g")), _S.binary("*", _S.prop(_S.read(_v14, "m"), "vx"), 1.2)), _S.read(_v14, "dt")), "+=", false)
			_S.set_prop(_S.read(_v14, "m"), "vy", _S.binary("-", _S.binary("*", 260, _S.read(_v14, "dt")), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v14, "m"), "vy"), 1.2), _S.read(_v14, "dt"))), "+=", false)
			_S.set_prop(_S.read(_v14, "m"), "x", _S.binary("*", _S.prop(_S.read(_v14, "m"), "vx"), _S.read(_v14, "dt")), "+=", false)
			_S.define(_v14, "ny", _S.binary("+", _S.prop(_S.read(_v14, "m"), "y"), _S.binary("*", _S.prop(_S.read(_v14, "m"), "vy"), _S.read(_v14, "dt"))))
			if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v14, "m"), "vy"), 0), func(): return _S.binary(">=", _S.read(_v14, "ny"), _S.unary("-", 0.5)))):
				var _v15 = _S.scope(_v14)
				if _S.truth(_S.binary(">", _S.prop(_S.read(_v15, "m"), "vy"), 50)):
					_S.last([_S.set_prop(_S.read(_v15, "m"), "vy", _S.unary("-", 0.35), "*=", false), _S.set_prop(_S.read(_v15, "m"), "vx", 0.6, "*=", false), _S.set_prop(_S.read(_v15, "m"), "y", _S.unary("-", 0.6), "=", false)])
				else:
					_S.last([_S.set_prop(_S.read(_v15, "m"), "rest", true, "=", false), _S.set_prop(_S.read(_v15, "m"), "y", _S.unary("-", 0.5), "=", false)])
			else:
				_S.set_prop(_S.read(_v14, "m"), "y", _S.read(_v14, "ny"), "=", false)
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "-=", true)
			continue
		_S.define(_v12, "age", _S.binary("-", _S.prop(_S.read(_v12, "m"), "max"), _S.prop(_S.read(_v12, "m"), "life")))
		_S.define(_v12, "k", _S.invoke(_S.read(_v12, "Math"), "min", [1, _S.binary("/", _S.read(_v12, "age"), 0.15)]))
		_S.define(_v12, "fx", _S.binary("*", _S.binary("*", _S.read(_v12, "W"), _S.binary("+", _S.binary("*", 100, _S.read(_v12, "g")), _S.binary("*", 30, _S.call_value(_S.read(_v12, "noise2"), [_S.binary("*", _S.prop(_S.read(_v12, "m"), "x"), 0.07), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v12, "m"), "y"), 0.07), _S.binary("*", _S.read(_v12, "t"), 0.8)), 3])))), _S.read(_v12, "k")))
		_S.define(_v12, "fy", _S.binary("*", _S.binary("+", _S.binary("*", _S.unary("-", 30), _S.prop(_S.read(_v12, "m"), "lift")), _S.binary("*", 42, _S.call_value(_S.read(_v12, "noise2"), [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v12, "m"), "x"), 0.06), 40), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v12, "m"), "y"), 0.06), _S.binary("*", _S.read(_v12, "t"), 1.1)), 5]))), _S.read(_v12, "k")))
		_S.define(_v12, "drag", (3 if _S.truth(_S.binary("===", _S.prop(_S.read(_v12, "m"), "kind"), 1)) else 1.5))
		_S.set_prop(_S.read(_v12, "m"), "vx", _S.binary("*", _S.binary("-", _S.read(_v12, "fx"), _S.binary("*", _S.prop(_S.read(_v12, "m"), "vx"), _S.read(_v12, "drag"))), _S.read(_v12, "dt")), "+=", false)
		_S.set_prop(_S.read(_v12, "m"), "vy", _S.binary("*", _S.binary("-", _S.read(_v12, "fy"), _S.binary("*", _S.prop(_S.read(_v12, "m"), "vy"), _S.read(_v12, "drag"))), _S.read(_v12, "dt")), "+=", false)
		_S.set_prop(_S.read(_v12, "m"), "x", _S.binary("*", _S.prop(_S.read(_v12, "m"), "vx"), _S.read(_v12, "dt")), "+=", false)
		_S.set_prop(_S.read(_v12, "m"), "y", _S.binary("*", _S.prop(_S.read(_v12, "m"), "vy"), _S.read(_v12, "dt")), "+=", false)
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_band = _S.read(_parent,"band")
	var _n_P0 = _S.read(_parent,"P0")
	var _n_PEEL = _S.read(_parent,"PEEL")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = (float((_n_t - _n_FLASH))/0.5)
	if _S.truth(((_n_k_b1 < 1) if _S.truth((_n_k_b1 > 0)) else (_n_k_b1 > 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (6 + (30 * _S.invoke(_n_ease,"outCubic",[_n_k_b1]))), 0.18, maxf(1,(3.5 * (1 - _n_k_b1))), (1.15 - _n_k_b1), _n_C, _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), (_n_k_b1 < 0.12)])
	var _n_pool_b2 = (_S.MathFX.smooth(0.1,_n_FLASH,_n_t) * (1 - _S.MathFX.smooth((_n_P0 + (_n_PEEL * 0.8)),((_n_P0 + _n_PEEL) + 0.6),_n_t)))
	if _S.truth((_n_pool_b2 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-1), 30, _S.index_value(_n_C,4), (0.22 * _n_pool_b2)])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_front = _S.read(_parent,"front")
	var _n_t = _S.read(_parent,"t")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_rim = _S.read(_parent,"rim")
	var _n_CORE_Y = _S.read(_parent,"CORE_Y")
	var _n_P0 = _S.read(_parent,"P0")
	var _n_body = _S.read(_parent,"body")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_top = _S.read(_parent,"top")
	var _n_H = _S.read(_parent,"H")
	var _n_ease = _S.read(_parent,"ease")
	var _n_band = _S.read(_parent,"band")
	var _n_motes = _S.read(_parent,"motes")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_f_b1 = _S.call_value(_n_front,[_n_t])
	if _S.truth((_n_t < _n_FLASH)):
		var _n_k_b3 = (float(_n_t)/_n_FLASH)
		var _n_fr_b4 = floori((_n_t * 30))
		for _iter_0 in _S.array(_n_rim):
			var _n_c_b5 = _iter_0
			var _n_h_b6 = _S.MathFX.rand([((_S.named_value(_n_c_b5,"mx") * 61) + _S.named_value(_n_c_b5,"my")),_n_fr_b4,7])
			if _S.truth((_n_h_b6 < (0.12 + ((0.62 * _n_k_b3) * _n_k_b3)))):
				_S.invoke(_n_p_b0,"px",[_S.named_value(_n_c_b5,"x"), _S.named_value(_n_c_b5,"y"), (_n_WHITE if _S.truth(((_S.MathFX.rand([_S.named_value(_n_c_b5,"mx"),_S.named_value(_n_c_b5,"my"),_n_fr_b4]) < 0.5) if _S.truth((_n_k_b3 > 0.72)) else (_n_k_b3 > 0.72))) else (_S.index_value(_n_C,6) if _S.truth((_n_h_b6 < 0.2)) else _S.index_value(_n_C,5)))])
		_S.invoke(_n_p_b0,"glow",[0, _n_CORE_Y, 26, _S.index_value(_n_C,4), (0.42 * _n_k_b3)])
		_S.invoke(_n_p_b0,"glow",[0, _n_CORE_Y, 12, _S.index_value(_n_C,6), ((0.25 * _n_k_b3) * _n_k_b3)])
	if _S.truth((_n_t >= (_n_FLASH - 0.1))):
		var _n_shake_b7 = (((1 if _S.truth(fmod(floori((_n_t * 60)),2)) else (-1)) * 0.6) if _S.truth((_n_t < _n_FLASH)) else 0)
		var _n_white_b8 = ((_n_t < _n_P0) if _S.truth((_n_t >= _n_FLASH)) else (_n_t >= _n_FLASH))
		for _iter_1 in _S.array(_S.named_value(_n_body,"list")):
			var _n_b_b9 = _iter_1
			if _S.truth(_S.named_value(_n_b_b9,"gone")):
				continue
			var _n_c_b10 = null
			if _S.truth(_n_white_b8):
				_n_c_b10 = (_S.index_value(_n_C,6) if _S.truth(_S.named_value(_n_b_b9,"edge")) else _n_WHITE)
			else:
				if _S.truth((_n_t < _n_FLASH)):
					_n_c_b10 = (_S.ColorFX.mix(_S.named_value(_n_b_b9,"c"),_S.index_value(_n_C,6),0.7) if _S.truth(_S.named_value(_n_b_b9,"edge")) else _S.ColorFX.mix(_S.named_value(_n_b_b9,"c"),_S.index_value(_n_C,5),0.25))
				else:
					var _n_d_b11 = (_S.named_value(_n_b_b9,"key") - _n_f_b1)
					var _n_above_b12 = _S.logical("||",not _S.truth(_S.invoke(_n_body,"on",[_S.named_value(_n_b_b9,"mx"), (_S.named_value(_n_b_b9,"my") - 1)])),func():return _S.named_value(_S.invoke(_n_body,"cell",[_S.named_value(_n_b_b9,"mx"), (_S.named_value(_n_b_b9,"my") - 1)]),"gone"))
					_n_c_b10 = (_n_WHITE if _S.truth(((_n_d_b11 < 0.06) if _S.truth(_n_above_b12) else _n_above_b12)) else (_S.ColorFX.mix(_S.named_value(_n_b_b9,"c"),_S.index_value(_n_C,6),0.7) if _S.truth((_n_d_b11 < 0.03)) else (_S.ColorFX.mix(_S.named_value(_n_b_b9,"c"),_S.index_value(_n_C,5),0.4) if _S.truth((_n_d_b11 < 0.1)) else (_S.ColorFX.mix(_S.named_value(_n_b_b9,"c"),_S.index_value(_n_C,5),0.5) if _S.truth(_S.named_value(_n_b_b9,"edge")) else _S.ColorFX.mix(_S.named_value(_n_b_b9,"c"),_S.index_value(_n_C,4),0.16)))))
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_b_b9,"x") + _n_shake_b7), _S.named_value(_n_b_b9,"y"), _n_c_b10])
		if _S.truth(_n_white_b8):
			_S.invoke(_n_p_b0,"glow",[0, _n_CORE_Y, 34, _S.index_value(_n_C,5), 0.7])
			_S.call_value(_n_sparkle,[_n_p_b0, 0, (_n_CORE_Y - 3), 9, _S.index_value(_n_C,6), _S.index_value(_n_C,4), 0.5])
	if _S.truth(((_n_f_b1 < 1.05) if _S.truth((_n_t >= _n_P0)) else (_n_t >= _n_P0))):
		var _n_fy_b13 = (_n_top + (clampf(_n_f_b1,0.0,1.0) * _n_H))
		var _n_k_b14 = (1 - _S.MathFX.smooth(0.85,1.05,_n_f_b1))
		_S.invoke(_n_p_b0,"glowLine",[(-10), _n_fy_b13, 10, _n_fy_b13, 8, _S.index_value(_n_C,5), (0.32 * _n_k_b14)])
		_S.invoke(_n_p_b0,"glow",[0, _n_fy_b13, 22, _S.index_value(_n_C,4), (0.2 * _n_k_b14)])
	var _n_k_b2 = (float((_n_t - _n_FLASH))/0.5)
	if _S.truth(((_n_k_b2 < 1) if _S.truth((_n_k_b2 > 0)) else (_n_k_b2 > 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (6 + (30 * _S.invoke(_n_ease,"outCubic",[_n_k_b2]))), 0.18, maxf(1,(3.5 * (1 - _n_k_b2))), (1.15 - _n_k_b2), _n_C, _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), (_n_k_b2 < 0.12)])
	for _iter_2 in _S.array(_n_motes):
		var _n_m_b15 = _iter_2
		var _n_age_b16 = (_S.named_value(_n_m_b15,"max") - _S.named_value(_n_m_b15,"life"))
		var _n_k2_b17 = (float(_S.named_value(_n_m_b15,"life"))/_S.named_value(_n_m_b15,"max"))
		var _n_a_b18 = ((float(_n_k2_b17)/0.35) if _S.truth((_n_k2_b17 < 0.35)) else 1)
		var _n_c_b19 = null
		if _S.truth((_n_age_b16 < 0.034)):
			_n_c_b19 = _S.ColorFX.mix(_S.named_value(_n_m_b15,"c"),_n_WHITE,0.55)
		else:
			if _S.truth((_n_age_b16 < 0.06)):
				_n_c_b19 = _n_WHITE
			else:
				if _S.truth((_n_age_b16 < 0.15)):
					_n_c_b19 = _S.index_value(_S.named_value(_n_m_b15,"cool"),0)
				else:
					var _n_u_b23 = (float((_n_age_b16 - 0.15))/maxf(0.05,(_S.named_value(_n_m_b15,"max") - 0.15)))
					var _n_cc_b24 = _S.index_value(_S.named_value(_n_m_b15,"cool"),(1 + minf(2,floori((_n_u_b23 * 3)))))
					_n_c_b19 = (_S.ColorFX.mix(_S.named_value(_n_m_b15,"c"),_n_cc_b24,0.55) if _S.truth(((_n_u_b23 < 0.5) if _S.truth(_S.named_value(_n_m_b15,"own")) else _S.named_value(_n_m_b15,"own"))) else _n_cc_b24)
					if _S.truth(((sin(((_n_t * 21) + _S.named_value(_n_m_b15,"seed"))) > 0.8) if _S.truth(_S.binary("===",_S.named_value(_n_m_b15,"kind"),0)) else _S.binary("===",_S.named_value(_n_m_b15,"kind"),0))):
						_n_c_b19 = _S.index_value(_S.named_value(_n_m_b15,"cool"),0)
		if _S.truth(_S.binary("===",_S.named_value(_n_m_b15,"kind"),2)):
			_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_m_b15,"x"), _S.named_value(_n_m_b15,"y"), _n_c_b19, _n_a_b18])
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_m_b15,"x"), _S.named_value(_n_m_b15,"y"), 3, _S.index_value(_n_C,5), (0.3 * _n_k2_b17)])
			continue
		var _n_sp_b20 = _S.Bridge.hypot([_S.named_value(_n_m_b15,"vx"), _S.named_value(_n_m_b15,"vy")])
		var _n_ux_b21 = (float(_S.named_value(_n_m_b15,"vx"))/(_n_sp_b20 if _S.truth(_n_sp_b20) else 1))
		var _n_uy_b22 = (float(_S.named_value(_n_m_b15,"vy"))/(_n_sp_b20 if _S.truth(_n_sp_b20) else 1))
		if _S.truth((_S.binary("===",_S.named_value(_n_m_b15,"kind"),0) if _S.truth((_n_sp_b20 > 30)) else (_n_sp_b20 > 30))):
			_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_m_b15,"x") - (_n_ux_b21 * 1.2)), (_S.named_value(_n_m_b15,"y") - (_n_uy_b22 * 1.2)), _S.ColorFX.scale_color(_n_c_b19,0.6), (_n_a_b18 * 0.85)])
		if _S.truth((_S.binary("===",_S.named_value(_n_m_b15,"kind"),0) if _S.truth((_n_sp_b20 > 85)) else (_n_sp_b20 > 85))):
			_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_m_b15,"x") - (_n_ux_b21 * 2.4)), (_S.named_value(_n_m_b15,"y") - (_n_uy_b22 * 2.4)), _S.ColorFX.scale_color(_n_c_b19,0.4), (_n_a_b18 * 0.6)])
		_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_m_b15,"x"), _S.named_value(_n_m_b15,"y"), _n_c_b19, _n_a_b18])
		if _S.truth((_n_k2_b17 > 0.15)):
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_m_b15,"x"), _S.named_value(_n_m_b15,"y"), 2.5, _n_c_b19, ((0.16 if _S.truth(_S.binary("===",_S.named_value(_n_m_b15,"kind"),1)) else 0.11) * _n_k2_b17)])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_t_b0 = _S.arg(_args,0)
	return (1 if _S.truth((_n_t_b0 < (_n_FLASH - 0.1))) else 0)
	return null
