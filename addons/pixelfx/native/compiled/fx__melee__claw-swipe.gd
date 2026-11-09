@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/claw-swipe.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "through", _S.import_value("fx/melee/_lib.js", "through"))
	_S.define(_e, "onSwing", _S.import_value("fx/melee/_lib.js", "onSwing"))
	_S.define(_e, "travel", _S.import_value("fx/melee/_lib.js", "travel"))
	_S.define(_e, "smear", _S.import_value("fx/melee/_lib.js", "smear"))
	_S.define(_e, "trace", _S.import_value("fx/melee/_lib.js", "trace"))
	_S.define(_e, "glowAlong", _S.import_value("fx/melee/_lib.js", "glowAlong"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Claw swipe"}, {"desc": "Three claw marks rake down one after another, white-hot, cooling through orange to red, then close up from both ends and leave a dotted scar, with hot flecks and drips."}, {"tags": ["melee", "claw", "swipe", "beast", "scratch", "combat", "directional", "one-shot"]}, {"size": [128, 96]}, {"origin": [36, 84]}, {"duration": 0.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#2a0808", "#5c0f12", "#a51d1d", "#e2401f", "#ff8a2a", "#ffd166", "#fff3c4", "#ffffff"]}, {"sparks": ["#fff3c4", "#ffd166", "#ff8a2a", "#c42a1a"]}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "READY_", _S.merge([_S.read(_e, "READY"), {"weapon": "claw"}, {"offWeapon": "claw"}, {"sa": _S.unary("-", 0.4)}, {"sb": _S.unary("-", 0.9)}, {"crouch": 5}, {"lean": 3}, {"fx": 14}, {"fy": _S.unary("-", 21)}, {"bx": 8}, {"by": _S.unary("-", 25)}, {"ffx": 9}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "HIGH", _S.merge([_S.read(_e, "READY_"), {"x": _S.unary("-", 6)}, {"crouch": 4}, {"lean": _S.unary("-", 3)}, {"fx": 3}, {"fy": _S.unary("-", 41)}, {"sa": _S.unary("-", 1.4)}, {"bx": 7}, {"by": _S.unary("-", 18)}, {"sb": _S.unary("-", 0.3)}, {"ffx": 10}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 58}])}, {"poses": [[_S.unary("-", 0.46), _S.merge([_S.read(_e, "READY_"), {"x": _S.unary("-", 6)}])], [_S.unary("-", 0.2), _S.read(_e, "HIGH")], [_S.unary("-", 0.05), _S.merge([_S.read(_e, "HIGH"), {"crouch": 5}])], [0, _S.merge([_S.read(_e, "READY_"), {"x": 0}, {"crouch": 3}, {"lean": 4}, {"fx": 19}, {"fy": _S.unary("-", 36)}, {"sa": _S.unary("-", 0.9)}, {"bx": _S.unary("-", 7)}, {"by": _S.unary("-", 24)}, {"ghost": 1}]), "snap"], [0.05, _S.merge([_S.read(_e, "READY_"), {"x": 2}, {"crouch": 5}, {"lean": 6}, {"fx": 23}, {"fy": _S.unary("-", 24)}, {"sa": 0.5}, {"bx": _S.unary("-", 7)}, {"by": _S.unary("-", 24)}, {"ffx": 13}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]), "snap"], [0.1, _S.merge([_S.read(_e, "READY_"), {"x": 3}, {"crouch": 7}, {"lean": 7}, {"fx": 22}, {"fy": _S.unary("-", 12)}, {"sa": 1.2}, {"bx": _S.unary("-", 7)}, {"by": _S.unary("-", 24)}, {"ffx": 13}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]), "snap"], [0.42, _S.merge([_S.read(_e, "READY_"), {"x": 3}, {"crouch": 6}, {"lean": 5}, {"fx": 21}, {"fy": _S.unary("-", 13)}, {"sa": 1.1}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 22)}, {"ffx": 13}, {"fbx": _S.unary("-", 10)}])], [0.9, _S.merge([_S.read(_e, "READY_"), {"x": _S.unary("-", 6)}])]]}, {"hits": [_S.merge([{"t": 0.04}, {"stop": 0.03}, {"push": 0.9}, {"straw": 5}, {"y": _S.unary("-", 30)}, {"flash": 0.03}]), _S.merge([{"t": 0.08}, {"stop": 0.03}, {"push": 0.9}, {"straw": 5}, {"y": _S.unary("-", 26)}, {"flash": 0.03}]), _S.merge([{"t": 0.12}, {"stop": 0.08}, {"shake": 0.14}, {"amp": 2}, {"push": 1.4}, {"straw": 9}, {"y": _S.unary("-", 18)}])]}, {"dust": [_S.merge([{"t": 0.1}, {"x": 12}, {"n": 6}, {"dir": 1}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "RAKE", 0.05)
	_S.define(_e, "STAGGER", 0.04)
	_S.define(_e, "CLOSE0", 0.16)
	_S.define(_e, "CLOSE", 0.3)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "C"), "length"))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.read(_e, "floor")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "drips", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "marks", _S.invoke([0, 1, 2], "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "heatAt", _S.function_value(_e, "_f3"))
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "s", _S.call_value(_S.read(_e, "through"), [_S.binary("+", 31, _S.binary("*", _S.read(_e, "i"), 8)), _S.binary("+", _S.unary("-", 23), _S.binary("*", _S.read(_e, "i"), 2)), 1.84, 1, 40, _S.binary("-", 0.84, _S.binary("*", _S.read(_e, "i"), 0.05)), 0.5]))
	return _S.merge([{"s": _S.read(_e, "s")}, {"t0": _S.binary("*", _S.read(_e, "i"), _S.read(_e, "STAGGER"))}, {"W": _S.binary("-", 4.2, _S.binary("*", _S.read(_e, "i"), 0.4))}, {"open": false}, {"end": _S.call_value(_S.read(_e, "travel"), [_S.read(_e, "s"), _S.prop(_S.read(_e, "s"), "span")])}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "m", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "m"), "t0")), 0.42))])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v0 in _S.array(_S.read(_e, "marks")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "m", _v0)
		var _v2 = _S.scope(_v1)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v2, "m"), "open")), func(): return _S.binary(">=", _S.read(_v2, "t"), _S.binary("+", _S.prop(_S.read(_v2, "m"), "t0"), _S.binary("*", _S.read(_v2, "RAKE"), 0.7))))):
			var _v3 = _S.scope(_v2)
			_S.set_prop(_S.read(_v3, "m"), "open", true, "=", false)
			_S.invoke(_S.read(_v3, "lights"), "add", [_S.prop(_S.prop(_S.read(_v3, "m"), "end"), "x"), _S.binary("-", _S.prop(_S.prop(_S.read(_v3, "m"), "end"), "y"), 6), 34, _S.prop(_S.read(_v3, "C"), 4), 0.45, 0.3])
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v4, "i"), 7)):
				var _v5 = _S.scope(_v4)
				_S.define(_v5, "a", _S.binary("+", _S.invoke(_S.read(_v5, "Math"), "atan2", [_S.prop(_S.prop(_S.read(_v5, "m"), "end"), "dy"), _S.prop(_S.prop(_S.read(_v5, "m"), "end"), "dx")]), _S.invoke(_S.read(_v5, "Rg"), "range", [_S.unary("-", 0.5), 0.5])))
				_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "Rg"), "range", [110, 260]))
				_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "SPARK"), _S.prop(_S.prop(_S.read(_v5, "m"), "end"), "x"), _S.prop(_S.prop(_S.read(_v5, "m"), "end"), "y"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.invoke(_S.read(_v5, "Rg"), "range", [0.12, 0.32])])
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "i", 1, "+=", true)
			var _v6 = _S.scope(_v3)
			_S.define(_v6, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v6, "i"), 5)):
				var _v7 = _S.scope(_v6)
				var _v8 = _S.call_value(_S.read(_v7, "onSwing"), [_S.prop(_S.read(_v7, "m"), "s"), _S.prop(_S.prop(_S.read(_v7, "m"), "s"), "R"), _S.binary("*", _S.prop(_S.prop(_S.read(_v7, "m"), "s"), "span"), _S.invoke(_S.read(_v7, "Rg"), "range", [0.15, 0.9]))])
				_S.define(_v7, "x", _S.prop(_v8, 0))
				_S.define(_v7, "y", _S.prop(_v8, 1))
				_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "MOTE"), _S.read(_v7, "x"), _S.read(_v7, "y"), _S.invoke(_S.read(_v7, "Rg"), "range", [_S.unary("-", 60), _S.unary("-", 10)]), _S.invoke(_S.read(_v7, "Rg"), "range", [_S.unary("-", 30), 30]), _S.invoke(_S.read(_v7, "Rg"), "range", [0.2, 0.4]), (_S.prop(_S.read(_v7, "C"), 5) if _S.truth(_S.invoke(_S.read(_v7, "Rg"), "chance", [0.5])) else _S.prop(_S.read(_v7, "C"), 4)), 0.5])
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "i", 1, "+=", true)
			var _v9 = _S.scope(_v3)
			_S.define(_v9, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v9, "i"), 2)):
				var _v10 = _S.scope(_v9)
				var _v11 = _S.call_value(_S.read(_v10, "onSwing"), [_S.prop(_S.read(_v10, "m"), "s"), _S.binary("-", _S.prop(_S.prop(_S.read(_v10, "m"), "s"), "R"), 1), _S.binary("*", _S.prop(_S.prop(_S.read(_v10, "m"), "s"), "span"), _S.invoke(_S.read(_v10, "Rg"), "range", [0.35, 0.75]))])
				_S.define(_v10, "x", _S.prop(_v11, 0))
				_S.define(_v10, "y", _S.prop(_v11, 1))
				_S.invoke(_S.read(_v10, "drips"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v10, "B"), "DRIP")}, {"x": _S.read(_v10, "x")}, {"y": _S.read(_v10, "y")}, {"vx": _S.invoke(_S.read(_v10, "Rg"), "range", [_S.unary("-", 8), 8])}, {"vy": _S.invoke(_S.read(_v10, "Rg"), "range", [10, 40])}, {"g": 0.55}, {"life": 1.2}, {"c": _S.prop(_S.read(_v10, "C"), 3)}])])
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "drips"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v12 in _S.array(_S.read(_e, "marks")):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "m", _v12)
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "u", _S.binary("-", _S.read(_v14, "t"), _S.prop(_S.read(_v14, "m"), "t0")))
		if _S.truth(_S.binary("<", _S.read(_v14, "u"), 0)):
			continue
		_S.define(_v14, "S", _S.prop(_S.prop(_S.read(_v14, "m"), "s"), "span"))
		_S.define(_v14, "head", _S.binary("*", _S.read(_v14, "S"), _S.invoke(_S.read(_v14, "ease"), "outExpo", [_S.call_value(_S.read(_v14, "clamp"), [_S.binary("/", _S.read(_v14, "u"), _S.read(_v14, "RAKE"))])])))
		_S.define(_v14, "c", _S.call_value(_S.read(_v14, "smooth"), [_S.read(_v14, "CLOSE0"), _S.binary("+", _S.read(_v14, "CLOSE0"), _S.read(_v14, "CLOSE")), _S.read(_v14, "u")]))
		_S.define(_v14, "lo", _S.binary("*", _S.binary("/", _S.read(_v14, "S"), 2), _S.read(_v14, "c")))
		_S.define(_v14, "hi", _S.invoke(_S.read(_v14, "Math"), "min", [_S.read(_v14, "head"), _S.binary("-", _S.read(_v14, "S"), _S.binary("*", _S.binary("/", _S.read(_v14, "S"), 2), _S.read(_v14, "c")))]))
		_S.define(_v14, "heat", _S.call_value(_S.read(_v14, "heatAt"), [_S.read(_v14, "m")]))
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v14, "hi"), _S.read(_v14, "lo")), 0.02)):
			var _v15 = _S.scope(_v14)
			_S.call_value(_S.read(_v15, "smear"), [_S.read(_v15, "p"), _S.prop(_S.read(_v15, "m"), "s"), _S.read(_v15, "lo"), _S.read(_v15, "hi"), _S.prop(_S.read(_v15, "m"), "W"), _S.function_value(_v15, "_f6"), 0, 2])
			_S.call_value(_S.read(_v15, "glowAlong"), [_S.read(_v15, "p"), _S.prop(_S.read(_v15, "m"), "s"), _S.binary("-", _S.prop(_S.prop(_S.read(_v15, "m"), "s"), "R"), _S.binary("/", _S.prop(_S.read(_v15, "m"), "W"), 2)), _S.read(_v15, "lo"), _S.read(_v15, "hi"), 11, _S.prop(_S.read(_v15, "C"), 4), _S.binary("*", _S.binary("*", 0.42, _S.read(_v15, "heat")), _S.read(_v15, "heat")), 0, 0.2])
		_S.define(_v14, "k", _S.binary("*", 0.8, _S.binary("-", 1, _S.call_value(_S.read(_v14, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v14, "u"), _S.read(_v14, "CLOSE0")), _S.binary("*", _S.read(_v14, "CLOSE"), 0.5)), 0.4)]))))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v14, "c"), 0.05), func(): return _S.binary(">", _S.read(_v14, "k"), 0))):
			var _v16 = _S.scope(_v14)
			_S.call_value(_S.read(_v16, "trace"), [_S.read(_v16, "p"), _S.prop(_S.read(_v16, "m"), "s"), _S.binary("-", _S.prop(_S.prop(_S.read(_v16, "m"), "s"), "R"), _S.binary("/", _S.prop(_S.read(_v16, "m"), "W"), 2)), _S.binary("*", 0.04, _S.read(_v16, "S")), _S.read(_v16, "lo"), _S.prop(_S.read(_v16, "C"), 2), _S.read(_v16, "k")])
			_S.call_value(_S.read(_v16, "trace"), [_S.read(_v16, "p"), _S.prop(_S.read(_v16, "m"), "s"), _S.binary("-", _S.prop(_S.prop(_S.read(_v16, "m"), "s"), "R"), _S.binary("/", _S.prop(_S.read(_v16, "m"), "W"), 2)), _S.binary("-", _S.read(_v16, "S"), _S.read(_v16, "lo")), _S.binary("*", 0.96, _S.read(_v16, "S")), _S.prop(_S.read(_v16, "C"), 2), _S.read(_v16, "k")])
		_S.define(_v14, "g", _S.binary("-", _S.read(_v14, "u"), _S.binary("*", _S.read(_v14, "RAKE"), 0.4)))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v14, "g"), 0), func(): return _S.binary("<", _S.read(_v14, "g"), 0.16))):
			_S.call_value(_S.read(_v14, "sparkle"), [_S.read(_v14, "p"), _S.prop(_S.prop(_S.read(_v14, "m"), "end"), "x"), _S.prop(_S.prop(_S.read(_v14, "m"), "end"), "y"), _S.binary("*", _S.binary("*", 5, _S.invoke(_S.read(_v14, "ease"), "outBack", [_S.invoke(_S.read(_v14, "Math"), "min", [1, _S.binary("/", _S.read(_v14, "g"), 0.04)])])), _S.binary("-", 1, _S.binary("/", _S.read(_v14, "g"), 0.16))), _S.prop(_S.read(_v14, "C"), 6), _S.prop(_S.read(_v14, "C"), 4), 0.4])
	_S.invoke(_S.read(_e, "drips"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "uu", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "v", _S.binary("/", _S.read(_e, "uu"), _S.read(_e, "S")))
	_S.define(_e, "w", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "m"), "W"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "v"))]), 1.15])), _S.binary("-", 1, _S.binary("*", 0.55, _S.read(_e, "c")))))
	_S.define(_e, "off", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "r"), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "m"), "s"), "R"), _S.binary("/", _S.prop(_S.read(_e, "m"), "W"), 2)))]), _S.binary("+", _S.binary("/", _S.read(_e, "w"), 2), 0.01)))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "w"), 0.5), func(): return _S.binary(">", _S.read(_e, "off"), 1))):
		return null
	_S.define(_e, "ci", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.binary("+", _S.binary("*", _S.binary("-", 1, _S.read(_e, "heat")), 5.2), _S.binary("*", _S.read(_e, "off"), 1.6)), _S.binary("*", (_S.binary("/", _S.binary("-", _S.read(_e, "S"), _S.read(_e, "uu")), _S.read(_e, "S")) if _S.truth(_S.binary("<", _S.read(_e, "head"), _S.read(_e, "S"))) else 0), 0.5))]))
	_S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "C"), _S.binary("-", _S.binary("-", _S.read(_e, "n"), 1), _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "ci"), 0, _S.binary("-", _S.read(_e, "n"), 2)]))), "=", false)
	return null
