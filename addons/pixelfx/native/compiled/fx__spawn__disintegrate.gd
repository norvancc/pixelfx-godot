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

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "b", _S.arg(_args, 0))
	_S.set_prop(_S.read(_e, "b"), "gone", true, "=", false)
	_S.define(_e, "lo", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_e, "b"), "y"), _S.unary("-", 9)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.22])))
	_S.define(_e, "kind", (2 if _S.truth(_S.read(_e, "lo")) else (1 if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.42])) else (3 if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.07])) else 0))))
	if _S.truth(_S.binary("===", _S.read(_e, "kind"), 3)):
		var _v0 = _S.scope(_e)
		_S.invoke(_S.read(_v0, "ps"), "spawn", [_S.prop(_S.read(_v0, "P"), "STAR"), _S.prop(_S.read(_v0, "b"), "x"), _S.prop(_S.read(_v0, "b"), "y"), _S.binary("*", _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 6), 14]), _S.read(_v0, "W")), _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 26), _S.unary("-", 8)]), _S.invoke(_S.read(_v0, "R"), "range", [0.6, 1.1]), (_S.prop(_S.read(_v0, "C"), 6) if _S.truth(_S.invoke(_S.read(_v0, "R"), "chance", [0.5])) else _S.read(_v0, "WHITE")), _S.invoke(_S.read(_v0, "R"), "range", [1, 2.2])])
		return null
	_S.define(_e, "life", (_S.invoke(_S.read(_e, "R"), "range", [0.7, 1.2]) if _S.truth(_S.binary("===", _S.read(_e, "kind"), 2)) else (_S.invoke(_S.read(_e, "R"), "range", [0.25, 0.5]) if _S.truth(_S.binary("===", _S.read(_e, "kind"), 1)) else _S.invoke(_S.read(_e, "R"), "range", [0.9, 1.7]))))
	_S.define(_e, "out", _S.binary("*", _S.binary("+", _S.prop(_S.read(_e, "b"), "x"), 0.5), _S.invoke(_S.read(_e, "R"), "range", [2, 6])))
	_S.invoke(_S.read(_e, "motes"), "push", [_S.merge([{"x": _S.binary("+", _S.prop(_S.read(_e, "b"), "x"), 0.5)}, {"y": _S.binary("+", _S.prop(_S.read(_e, "b"), "y"), 0.5)}, {"vx": _S.binary("*", _S.binary("+", _S.read(_e, "out"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 16])), (0.4 if _S.truth(_S.binary("===", _S.read(_e, "kind"), 2)) else 1))}, {"vy": (_S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 30), _S.unary("-", 8)]) if _S.truth(_S.binary("===", _S.read(_e, "kind"), 2)) else _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 46), _S.unary("-", 8)]))}, {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}, {"c": _S.prop(_S.read(_e, "b"), "c")}, {"kind": _S.read(_e, "kind")}, {"lift": _S.invoke(_S.read(_e, "R"), "range", [0.4, 1.4])}, {"cool": _S.prop(_S.read(_e, "COOL"), (1 if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.3])) else (2 if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.3])) else 0)))}, {"own": _S.invoke(_S.read(_e, "R"), "chance", [0.2])}, {"rest": false}, {"seed": _S.invoke(_S.read(_e, "R"), "range", [0, 100])}])])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", _S.unary("-", 0.06), _S.binary("*", 1.14, _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "P0")), _S.read(_e, "PEEL"))])])))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", 0.7, _S.binary("*", 0.5, _S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "noise"), [_S.binary("*", _S.read(_e, "t"), 1.6), 11]), 0.5), 0.5)))

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

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "FLASH")), 0.5))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 6, _S.binary("*", 30, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))), 0.18, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 3.5, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), _S.read(_e, "C"), _S.function_value(_e, "_f7"), _S.binary("<", _S.read(_e, "k"), 0.12)])
	_S.define(_e, "pool", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0.1, _S.read(_e, "FLASH"), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "P0"), _S.binary("*", _S.read(_e, "PEEL"), 0.8)), _S.binary("+", _S.binary("+", _S.read(_e, "P0"), _S.read(_e, "PEEL")), 0.6), _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "pool"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 1), 30, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.22, _S.read(_e, "pool"))])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "f", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "FLASH"))):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "k", _S.binary("/", _S.read(_v16, "t"), _S.read(_v16, "FLASH")))
		_S.define(_v16, "fr", _S.invoke(_S.read(_v16, "Math"), "floor", [_S.binary("*", _S.read(_v16, "t"), 30)]))
		for _v17 in _S.array(_S.read(_v16, "rim")):
			var _v18 = _S.scope(_v16)
			_S.define(_v18, "c", _v17)
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "h", _S.call_value(_S.read(_v19, "rand"), [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v19, "c"), "mx"), 61), _S.prop(_S.read(_v19, "c"), "my")), _S.read(_v19, "fr"), 7]))
			if _S.truth(_S.binary("<", _S.read(_v19, "h"), _S.binary("+", 0.12, _S.binary("*", _S.binary("*", 0.62, _S.read(_v19, "k")), _S.read(_v19, "k"))))):
				_S.invoke(_S.read(_v19, "p"), "px", [_S.prop(_S.read(_v19, "c"), "x"), _S.prop(_S.read(_v19, "c"), "y"), (_S.read(_v19, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v19, "k"), 0.72), func(): return _S.binary("<", _S.call_value(_S.read(_v19, "rand"), [_S.prop(_S.read(_v19, "c"), "mx"), _S.prop(_S.read(_v19, "c"), "my"), _S.read(_v19, "fr")]), 0.5))) else (_S.prop(_S.read(_v19, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v19, "h"), 0.2)) else _S.prop(_S.read(_v19, "C"), 5)))])
		_S.invoke(_S.read(_v16, "p"), "glow", [0, _S.read(_v16, "CORE_Y"), 26, _S.prop(_S.read(_v16, "C"), 4), _S.binary("*", 0.42, _S.read(_v16, "k"))])
		_S.invoke(_S.read(_v16, "p"), "glow", [0, _S.read(_v16, "CORE_Y"), 12, _S.prop(_S.read(_v16, "C"), 6), _S.binary("*", _S.binary("*", 0.25, _S.read(_v16, "k")), _S.read(_v16, "k"))])
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "FLASH"), 0.1))):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "shake", (_S.binary("*", (1 if _S.truth(_S.binary("%", _S.invoke(_S.read(_v20, "Math"), "floor", [_S.binary("*", _S.read(_v20, "t"), 60)]), 2)) else _S.unary("-", 1)), 0.6) if _S.truth(_S.binary("<", _S.read(_v20, "t"), _S.read(_v20, "FLASH"))) else 0))
		_S.define(_v20, "white", _S.logical("&&", _S.binary(">=", _S.read(_v20, "t"), _S.read(_v20, "FLASH")), func(): return _S.binary("<", _S.read(_v20, "t"), _S.read(_v20, "P0"))))
		for _v21 in _S.array(_S.prop(_S.read(_v20, "body"), "list")):
			var _v22 = _S.scope(_v20)
			_S.define(_v22, "b", _v21)
			var _v23 = _S.scope(_v22)
			if _S.truth(_S.prop(_S.read(_v23, "b"), "gone")):
				continue
			_S.define(_v23, "c", null)
			if _S.truth(_S.read(_v23, "white")):
				_S.write(_v23, "c", (_S.prop(_S.read(_v23, "C"), 6) if _S.truth(_S.prop(_S.read(_v23, "b"), "edge")) else _S.read(_v23, "WHITE")), "=", false)
			else:
				if _S.truth(_S.binary("<", _S.read(_v23, "t"), _S.read(_v23, "FLASH"))):
					_S.write(_v23, "c", (_S.call_value(_S.read(_v23, "mix"), [_S.prop(_S.read(_v23, "b"), "c"), _S.prop(_S.read(_v23, "C"), 6), 0.7]) if _S.truth(_S.prop(_S.read(_v23, "b"), "edge")) else _S.call_value(_S.read(_v23, "mix"), [_S.prop(_S.read(_v23, "b"), "c"), _S.prop(_S.read(_v23, "C"), 5), 0.25])), "=", false)
				else:
					var _v24 = _S.scope(_v23)
					_S.define(_v24, "d", _S.binary("-", _S.prop(_S.read(_v24, "b"), "key"), _S.read(_v24, "f")))
					_S.define(_v24, "above", _S.logical("||", _S.unary("!", _S.invoke(_S.read(_v24, "body"), "on", [_S.prop(_S.read(_v24, "b"), "mx"), _S.binary("-", _S.prop(_S.read(_v24, "b"), "my"), 1)])), func(): return _S.prop(_S.invoke(_S.read(_v24, "body"), "cell", [_S.prop(_S.read(_v24, "b"), "mx"), _S.binary("-", _S.prop(_S.read(_v24, "b"), "my"), 1)]), "gone")))
					_S.write(_v24, "c", (_S.read(_v24, "WHITE") if _S.truth(_S.logical("&&", _S.read(_v24, "above"), func(): return _S.binary("<", _S.read(_v24, "d"), 0.06))) else (_S.call_value(_S.read(_v24, "mix"), [_S.prop(_S.read(_v24, "b"), "c"), _S.prop(_S.read(_v24, "C"), 6), 0.7]) if _S.truth(_S.binary("<", _S.read(_v24, "d"), 0.03)) else (_S.call_value(_S.read(_v24, "mix"), [_S.prop(_S.read(_v24, "b"), "c"), _S.prop(_S.read(_v24, "C"), 5), 0.4]) if _S.truth(_S.binary("<", _S.read(_v24, "d"), 0.1)) else (_S.call_value(_S.read(_v24, "mix"), [_S.prop(_S.read(_v24, "b"), "c"), _S.prop(_S.read(_v24, "C"), 5), 0.5]) if _S.truth(_S.prop(_S.read(_v24, "b"), "edge")) else _S.call_value(_S.read(_v24, "mix"), [_S.prop(_S.read(_v24, "b"), "c"), _S.prop(_S.read(_v24, "C"), 4), 0.16]))))), "=", false)
			_S.invoke(_S.read(_v23, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v23, "b"), "x"), _S.read(_v23, "shake")), _S.prop(_S.read(_v23, "b"), "y"), _S.read(_v23, "c")])
		if _S.truth(_S.read(_v20, "white")):
			var _v25 = _S.scope(_v20)
			_S.invoke(_S.read(_v25, "p"), "glow", [0, _S.read(_v25, "CORE_Y"), 34, _S.prop(_S.read(_v25, "C"), 5), 0.7])
			_S.call_value(_S.read(_v25, "sparkle"), [_S.read(_v25, "p"), 0, _S.binary("-", _S.read(_v25, "CORE_Y"), 3), 9, _S.prop(_S.read(_v25, "C"), 6), _S.prop(_S.read(_v25, "C"), 4), 0.5])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "P0")), func(): return _S.binary("<", _S.read(_e, "f"), 1.05))):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "fy", _S.binary("+", _S.read(_v26, "top"), _S.binary("*", _S.call_value(_S.read(_v26, "clamp"), [_S.read(_v26, "f")]), _S.read(_v26, "H"))))
		_S.define(_v26, "k", _S.binary("-", 1, _S.call_value(_S.read(_v26, "smooth"), [0.85, 1.05, _S.read(_v26, "f")])))
		_S.invoke(_S.read(_v26, "p"), "glowLine", [_S.unary("-", 10), _S.read(_v26, "fy"), 10, _S.read(_v26, "fy"), 8, _S.prop(_S.read(_v26, "C"), 5), _S.binary("*", 0.32, _S.read(_v26, "k"))])
		_S.invoke(_S.read(_v26, "p"), "glow", [0, _S.read(_v26, "fy"), 22, _S.prop(_S.read(_v26, "C"), 4), _S.binary("*", 0.2, _S.read(_v26, "k"))])
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "FLASH")), 0.5))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 6, _S.binary("*", 30, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))), 0.18, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 3.5, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), _S.read(_e, "C"), _S.function_value(_e, "_f9"), _S.binary("<", _S.read(_e, "k"), 0.12)])
	for _v27 in _S.array(_S.read(_e, "motes")):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "m", _v27)
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "age", _S.binary("-", _S.prop(_S.read(_v29, "m"), "max"), _S.prop(_S.read(_v29, "m"), "life")))
		_S.define(_v29, "k2", _S.binary("/", _S.prop(_S.read(_v29, "m"), "life"), _S.prop(_S.read(_v29, "m"), "max")))
		_S.define(_v29, "a", (_S.binary("/", _S.read(_v29, "k2"), 0.35) if _S.truth(_S.binary("<", _S.read(_v29, "k2"), 0.35)) else 1))
		_S.define(_v29, "c", null)
		if _S.truth(_S.binary("<", _S.read(_v29, "age"), 0.034)):
			_S.write(_v29, "c", _S.call_value(_S.read(_v29, "mix"), [_S.prop(_S.read(_v29, "m"), "c"), _S.read(_v29, "WHITE"), 0.55]), "=", false)
		else:
			if _S.truth(_S.binary("<", _S.read(_v29, "age"), 0.06)):
				_S.write(_v29, "c", _S.read(_v29, "WHITE"), "=", false)
			else:
				if _S.truth(_S.binary("<", _S.read(_v29, "age"), 0.15)):
					_S.write(_v29, "c", _S.prop(_S.prop(_S.read(_v29, "m"), "cool"), 0), "=", false)
				else:
					var _v30 = _S.scope(_v29)
					_S.define(_v30, "u", _S.binary("/", _S.binary("-", _S.read(_v30, "age"), 0.15), _S.invoke(_S.read(_v30, "Math"), "max", [0.05, _S.binary("-", _S.prop(_S.read(_v30, "m"), "max"), 0.15)])))
					_S.define(_v30, "cc", _S.prop(_S.prop(_S.read(_v30, "m"), "cool"), _S.binary("+", 1, _S.invoke(_S.read(_v30, "Math"), "min", [2, _S.invoke(_S.read(_v30, "Math"), "floor", [_S.binary("*", _S.read(_v30, "u"), 3)])]))))
					_S.write(_v30, "c", (_S.call_value(_S.read(_v30, "mix"), [_S.prop(_S.read(_v30, "m"), "c"), _S.read(_v30, "cc"), 0.55]) if _S.truth(_S.logical("&&", _S.prop(_S.read(_v30, "m"), "own"), func(): return _S.binary("<", _S.read(_v30, "u"), 0.5))) else _S.read(_v30, "cc")), "=", false)
					if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_v30, "m"), "kind"), 0), func(): return _S.binary(">", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v30, "t"), 21), _S.prop(_S.read(_v30, "m"), "seed"))]), 0.8))):
						_S.write(_v30, "c", _S.prop(_S.prop(_S.read(_v30, "m"), "cool"), 0), "=", false)
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v29, "m"), "kind"), 2)):
			var _v31 = _S.scope(_v29)
			_S.invoke(_S.read(_v31, "p"), "dot", [_S.prop(_S.read(_v31, "m"), "x"), _S.prop(_S.read(_v31, "m"), "y"), _S.read(_v31, "c"), _S.read(_v31, "a")])
			_S.invoke(_S.read(_v31, "p"), "glow", [_S.prop(_S.read(_v31, "m"), "x"), _S.prop(_S.read(_v31, "m"), "y"), 3, _S.prop(_S.read(_v31, "C"), 5), _S.binary("*", 0.3, _S.read(_v31, "k2"))])
			continue
		_S.define(_v29, "sp", _S.invoke(_S.read(_v29, "Math"), "hypot", [_S.prop(_S.read(_v29, "m"), "vx"), _S.prop(_S.read(_v29, "m"), "vy")]))
		_S.define(_v29, "ux", _S.binary("/", _S.prop(_S.read(_v29, "m"), "vx"), _S.logical("||", _S.read(_v29, "sp"), func(): return 1)))
		_S.define(_v29, "uy", _S.binary("/", _S.prop(_S.read(_v29, "m"), "vy"), _S.logical("||", _S.read(_v29, "sp"), func(): return 1)))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v29, "sp"), 30), func(): return _S.binary("===", _S.prop(_S.read(_v29, "m"), "kind"), 0))):
			_S.invoke(_S.read(_v29, "p"), "dot", [_S.binary("-", _S.prop(_S.read(_v29, "m"), "x"), _S.binary("*", _S.read(_v29, "ux"), 1.2)), _S.binary("-", _S.prop(_S.read(_v29, "m"), "y"), _S.binary("*", _S.read(_v29, "uy"), 1.2)), _S.call_value(_S.read(_v29, "scale"), [_S.read(_v29, "c"), 0.6]), _S.binary("*", _S.read(_v29, "a"), 0.85)])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v29, "sp"), 85), func(): return _S.binary("===", _S.prop(_S.read(_v29, "m"), "kind"), 0))):
			_S.invoke(_S.read(_v29, "p"), "dot", [_S.binary("-", _S.prop(_S.read(_v29, "m"), "x"), _S.binary("*", _S.read(_v29, "ux"), 2.4)), _S.binary("-", _S.prop(_S.read(_v29, "m"), "y"), _S.binary("*", _S.read(_v29, "uy"), 2.4)), _S.call_value(_S.read(_v29, "scale"), [_S.read(_v29, "c"), 0.4]), _S.binary("*", _S.read(_v29, "a"), 0.6)])
		_S.invoke(_S.read(_v29, "p"), "dot", [_S.prop(_S.read(_v29, "m"), "x"), _S.prop(_S.read(_v29, "m"), "y"), _S.read(_v29, "c"), _S.read(_v29, "a")])
		if _S.truth(_S.binary(">", _S.read(_v29, "k2"), 0.15)):
			_S.invoke(_S.read(_v29, "p"), "glow", [_S.prop(_S.read(_v29, "m"), "x"), _S.prop(_S.read(_v29, "m"), "y"), 2.5, _S.read(_v29, "c"), _S.binary("*", (0.16 if _S.truth(_S.binary("===", _S.prop(_S.read(_v29, "m"), "kind"), 1)) else 0.11), _S.read(_v29, "k2"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "FLASH"), 0.1))) else 0)
