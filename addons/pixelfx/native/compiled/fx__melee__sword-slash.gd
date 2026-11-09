@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/sword-slash.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "onArc", _S.function_value(_e, "_f0"))
	_S.define(_e, "crescent", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawSlash", _S.function_value(_e, "_f3"))
	_S.define(_e, "tipOf", _S.function_value(_e, "_f4"))
	_S.define(_e, "create", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Sword slash"}, {"desc": "A tilted crescent whips round in two frames, cools from white to deep blue as it trails off, glints at the tip and throws sparks."}, {"tags": ["melee", "slash", "sword", "combat", "directional", "one-shot"]}, {"size": [136, 104]}, {"origin": [44, 92]}, {"duration": 0.75}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#b8c9e8", "#e8f1ff", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"radius": 42}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "GUARD", _S.merge([_S.read(_e, "READY"), {"weapon": "sword"}, {"fx": 12}, {"fy": _S.unary("-", 21)}, {"sa": _S.unary("-", 0.85)}]))
	_S.define(_e, "WIND", _S.merge([_S.read(_e, "GUARD"), {"x": _S.unary("-", 8)}, {"crouch": 4}, {"lean": _S.unary("-", 4)}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 35)}, {"sa": _S.unary("-", 2.65)}, {"bx": 9}, {"by": _S.unary("-", 25)}, {"armsFront": true}, {"ffx": 9}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "CUT", _S.merge([_S.read(_e, "GUARD"), {"x": 0}, {"crouch": 2}, {"lean": 3}, {"fx": 16}, {"fy": _S.unary("-", 37)}, {"sa": _S.unary("-", 1.45)}, {"bx": _S.unary("-", 7)}, {"by": _S.unary("-", 24)}, {"ffx": 11}, {"fbx": _S.unary("-", 10)}, {"ghost": 1}]))
	_S.define(_e, "DOWN", _S.merge([_S.read(_e, "GUARD"), {"x": 2}, {"crouch": 5}, {"lean": 5}, {"fx": 20}, {"fy": _S.unary("-", 21)}, {"sa": 0.62}, {"bx": _S.unary("-", 9)}, {"by": _S.unary("-", 24)}, {"ffx": 13}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 58}])}, {"poses": [[_S.unary("-", 0.55), _S.merge([_S.read(_e, "GUARD"), {"x": _S.unary("-", 8)}])], [_S.unary("-", 0.3), _S.read(_e, "WIND")], [_S.unary("-", 0.08), _S.merge([_S.read(_e, "WIND"), {"crouch": 5}, {"lean": _S.unary("-", 5)}])], [0, _S.read(_e, "CUT"), "snap"], [0.06, _S.read(_e, "DOWN"), "snap"], [0.3, _S.merge([_S.read(_e, "DOWN"), {"x": 3}, {"crouch": 6}])], [0.58, _S.merge([_S.read(_e, "GUARD"), {"x": 1}, {"crouch": 3}, {"fx": 15}, {"fy": _S.unary("-", 21)}, {"sa": 0.1}, {"bx": _S.unary("-", 5)}, {"by": _S.unary("-", 21)}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}])], [0.86, _S.merge([_S.read(_e, "GUARD"), {"x": _S.unary("-", 8)}])]]}, {"hits": [_S.merge([{"t": 0.06}, {"stop": 0.14}, {"shake": 0.18}, {"amp": 2}, {"push": 2.8}, {"straw": 18}])]}, {"dust": [_S.merge([{"t": 0.06}, {"x": 16}, {"n": 7}, {"dir": 1}]), _S.merge([{"t": 0.06}, {"x": _S.unary("-", 11)}, {"n": 4}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	_S.define(_e, "a", _S.arg(_args, 2))
	_S.define(_e, "lx", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "r")))
	_S.define(_e, "ly", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "r")), _S.prop(_S.read(_e, "s"), "sy")))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "s"), "rot")]))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "s"), "rot")]))
	return [_S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "s"), "cx"), _S.binary("*", _S.read(_e, "lx"), _S.read(_e, "c"))), _S.binary("*", _S.read(_e, "ly"), _S.read(_e, "n"))), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "s"), "cy"), _S.binary("*", _S.read(_e, "lx"), _S.read(_e, "n"))), _S.binary("*", _S.read(_e, "ly"), _S.read(_e, "c")))]

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "ta", _S.arg(_args, 2))
	_S.define(_e, "L", _S.arg(_args, 3))
	_S.define(_e, "W", _S.arg(_args, 4))
	_S.define(_e, "age", _S.arg(_args, 5))
	if _S.truth(_S.logical("||", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "L")]), 0.02), func(): return _S.binary("<", _S.read(_e, "W"), 0.3))):
		return null
	_S.define(_e, "R", _S.prop(_S.read(_e, "s"), "ramp"))
	_S.define(_e, "n", _S.prop(_S.read(_e, "R"), "length"))
	_S.define(_e, "dir", _S.invoke(_S.read(_e, "Math"), "sign", [_S.read(_e, "L")]))
	_S.define(_e, "span", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "L")]))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "s"), "rot")]))
	_S.define(_e, "sn", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "s"), "rot")]))
	_S.define(_e, "B", _S.binary("+", _S.prop(_S.read(_e, "s"), "R"), 2))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.prop(_S.read(_e, "s"), "cx"), _S.read(_e, "B")), _S.binary("-", _S.prop(_S.read(_e, "s"), "cy"), _S.read(_e, "B")), _S.binary("+", _S.prop(_S.read(_e, "s"), "cx"), _S.read(_e, "B")), _S.binary("+", _S.prop(_S.read(_e, "s"), "cy"), _S.read(_e, "B")), _S.function_value(_e, "_f2")])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "u", 0)
	while _S.truth(_S.binary("<=", _S.read(_v0, "u"), _S.read(_v0, "span"))):
		var _v1 = _S.scope(_v0)
		var _v2 = _S.call_value(_S.read(_v1, "onArc"), [_S.read(_v1, "s"), _S.binary("-", _S.prop(_S.read(_v1, "s"), "R"), _S.binary("*", _S.read(_v1, "W"), 0.4)), _S.binary("+", _S.read(_v1, "ta"), _S.binary("*", _S.read(_v1, "dir"), _S.read(_v1, "u")))])
		_S.define(_v1, "x", _S.prop(_v2, 0))
		_S.define(_v1, "y", _S.prop(_v2, 1))
		_S.invoke(_S.read(_v1, "p"), "glow", [_S.read(_v1, "x"), _S.read(_v1, "y"), _S.binary("+", 5, _S.read(_v1, "W")), _S.prop(_S.read(_v1, "R"), _S.binary("-", _S.read(_v1, "n"), 3)), _S.binary("*", _S.binary("*", 0.22, _S.binary("-", 1, _S.read(_v1, "age"))), _S.binary("/", _S.read(_v1, "u"), _S.read(_v1, "span")))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "u", 0.3, "+=", false)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "s"), "cx")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "s"), "cy")))
	_S.define(_e, "lx", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "c")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sn"))))
	_S.define(_e, "ly", _S.binary("/", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sn")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "c"))), _S.prop(_S.read(_e, "s"), "sy")))
	_S.define(_e, "r", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "lx"), _S.read(_e, "ly")]))
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "r"), _S.binary("+", _S.prop(_S.read(_e, "s"), "R"), 0.5)), func(): return _S.binary("<", _S.read(_e, "r"), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "s"), "R"), _S.read(_e, "W")), 1)))):
		return null
	_S.define(_e, "u", _S.binary("%", _S.binary("*", _S.read(_e, "dir"), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "ly"), _S.read(_e, "lx")]), _S.read(_e, "ta"))), _S.read(_e, "TAU")))
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0)):
		_S.write(_e, "u", _S.read(_e, "TAU"), "+=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "u"), _S.read(_e, "span"))):
		return null
	_S.define(_e, "v", _S.binary("/", _S.read(_e, "u"), _S.read(_e, "span")))
	_S.define(_e, "w", _S.binary("*", _S.read(_e, "W"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "v"), 2.2]))]), 0.6])))
	if _S.truth(_S.binary("<", _S.read(_e, "w"), 0.35)):
		return null
	_S.define(_e, "q", _S.binary("/", _S.binary("-", _S.prop(_S.read(_e, "s"), "R"), _S.read(_e, "r")), _S.read(_e, "w")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "q"), 0), func(): return _S.binary(">", _S.read(_e, "q"), 1))):
		return null
	_S.define(_e, "ci", (0 if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "q"), 0.22), func(): return _S.binary("<", _S.read(_e, "age"), 0.5))) else _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.binary("-", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "q"), _S.binary("-", _S.read(_e, "n"), 1)), 0.75), _S.binary("*", _S.read(_e, "age"), 2.4)), _S.binary("*", _S.read(_e, "v"), 0.8)), 0.4)])))
	_S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "R"), _S.binary("-", _S.binary("-", _S.read(_e, "n"), 1), _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "ci"), 0, _S.binary("-", _S.read(_e, "n"), 1)]))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "v"), 0.4)]), "=", false)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "s"), "t0")))
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0)):
		return null
	_S.define(_e, "span", _S.binary("-", _S.prop(_S.read(_e, "s"), "a1"), _S.prop(_S.read(_e, "s"), "a0")))
	_S.define(_e, "head", _S.invoke(_S.read(_e, "ease"), "outExpo", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "u"), _S.prop(_S.read(_e, "s"), "sweep"))])]))
	_S.define(_e, "tail", _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.prop(_S.read(_e, "s"), "sweep"), _S.prop(_S.read(_e, "s"), "hold")), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "s"), "sweep"), _S.prop(_S.read(_e, "s"), "hold")), _S.prop(_S.read(_e, "s"), "trail")), _S.read(_e, "u")]))
	_S.define(_e, "age", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "u"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "s"), "sweep"), _S.prop(_S.read(_e, "s"), "hold")), _S.prop(_S.read(_e, "s"), "trail")))]))
	if _S.truth(_S.binary("<", _S.read(_e, "tail"), 1)):
		_S.call_value(_S.read(_e, "crescent"), [_S.read(_e, "p"), _S.read(_e, "s"), _S.binary("+", _S.prop(_S.read(_e, "s"), "a0"), _S.binary("*", _S.read(_e, "span"), _S.read(_e, "tail"))), _S.binary("*", _S.read(_e, "span"), _S.binary("-", _S.read(_e, "head"), _S.read(_e, "tail"))), _S.binary("*", _S.prop(_S.read(_e, "s"), "W"), _S.binary("-", 1, _S.binary("*", _S.read(_e, "tail"), 0.55))), _S.read(_e, "age")])
	_S.define(_e, "th", _S.binary("*", 0.7, _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "u"), _S.prop(_S.read(_e, "s"), "sweep")), _S.prop(_S.read(_e, "s"), "hold")), _S.binary("+", _S.prop(_S.read(_e, "s"), "trail"), 0.2))]))))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "tail"), 0.02), func(): return _S.binary(">", _S.read(_e, "th"), 0))):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "k", 0)
		while _S.truth(_S.binary("<=", _S.read(_v3, "k"), _S.read(_v3, "tail"))):
			var _v4 = _S.scope(_v3)
			var _v5 = _S.call_value(_S.read(_v4, "onArc"), [_S.read(_v4, "s"), _S.binary("-", _S.prop(_S.read(_v4, "s"), "R"), 0.5), _S.binary("+", _S.prop(_S.read(_v4, "s"), "a0"), _S.binary("*", _S.read(_v4, "span"), _S.read(_v4, "k")))])
			_S.define(_v4, "x", _S.prop(_v5, 0))
			_S.define(_v4, "y", _S.prop(_v5, 1))
			_S.invoke(_S.read(_v4, "p"), "dot", [_S.read(_v4, "x"), _S.read(_v4, "y"), _S.prop(_S.prop(_S.read(_v4, "s"), "ramp"), 1), _S.binary("*", _S.read(_v4, "th"), _S.binary("+", 0.4, _S.binary("*", 0.6, _S.read(_v4, "k"))))])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "k", _S.binary("/", 0.6, _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.read(_v3, "span")]), _S.prop(_S.read(_v3, "s"), "R"))), "+=", false)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "s", _S.arg(_args, 0))
	var _v6 = _S.call_value(_S.read(_e, "onArc"), [_S.read(_e, "s"), _S.binary("-", _S.prop(_S.read(_e, "s"), "R"), _S.binary("*", _S.prop(_S.read(_e, "s"), "W"), 0.3)), _S.prop(_S.read(_e, "s"), "a1")])
	_S.define(_e, "x", _S.prop(_v6, 0))
	_S.define(_e, "y", _S.prop(_v6, 1))
	var _v7 = _S.call_value(_S.read(_e, "onArc"), [_S.read(_e, "s"), _S.binary("-", _S.prop(_S.read(_e, "s"), "R"), _S.binary("*", _S.prop(_S.read(_e, "s"), "W"), 0.3)), _S.binary("+", _S.prop(_S.read(_e, "s"), "a1"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sign", [_S.binary("-", _S.prop(_S.read(_e, "s"), "a1"), _S.prop(_S.read(_e, "s"), "a0"))]), 0.05))])
	_S.define(_e, "x2", _S.prop(_v7, 0))
	_S.define(_e, "y2", _S.prop(_v7, 1))
	_S.define(_e, "l", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x2"), _S.read(_e, "x")), _S.binary("-", _S.read(_e, "y2"), _S.read(_e, "y"))]), func(): return 1))
	return _S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"dx": _S.binary("/", _S.binary("-", _S.read(_e, "x2"), _S.read(_e, "x")), _S.read(_e, "l"))}, {"dy": _S.binary("/", _S.binary("-", _S.read(_e, "y2"), _S.read(_e, "y")), _S.read(_e, "l"))}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.function_value(_e, "_f6")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "R0", _S.prop(_S.read(_e, "o"), "radius"))
	_S.define(_e, "a0", _S.unary("-", 2.55))
	_S.define(_e, "a1", 0.95)
	_S.define(_e, "A", _S.merge([{"cx": 6}, {"cy": _S.unary("-", 26)}, {"R": _S.read(_e, "R0")}, {"sy": 0.6}, {"rot": _S.unary("-", 0.38)}, {"a0": _S.read(_e, "a0")}, {"a1": _S.read(_e, "a1")}, {"W": 12}, {"t0": 0}, {"sweep": 0.06}, {"hold": 0.06}, {"trail": 0.24}, {"ramp": _S.read(_e, "C")}]))
	_S.define(_e, "E", _S.merge([_S.read(_e, "A"), {"R": _S.binary("*", _S.read(_e, "R0"), _S.binary("/", 33, 42))}, {"W": _S.binary("*", _S.read(_e, "R0"), _S.binary("/", 4.5, 42))}, {"a0": _S.binary("+", _S.read(_e, "a0"), _S.binary("*", _S.binary("-", _S.read(_e, "a1"), _S.read(_e, "a0")), 0.1))}, {"a1": _S.binary("-", _S.read(_e, "a1"), _S.binary("*", _S.binary("-", _S.read(_e, "a1"), _S.read(_e, "a0")), _S.binary("/", 0.15, 3.5)))}, {"t0": 0.017}, {"hold": 0.03}, {"trail": 0.2}, {"ramp": _S.invoke(_S.read(_e, "C"), "slice", [0, 6])}]))
	_S.define(_e, "tip", _S.call_value(_S.read(_e, "tipOf"), [_S.read(_e, "A")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "landed", false)
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "landed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.read(_e, "A"), "sweep")))):
		var _v8 = _S.scope(_e)
		_S.write(_v8, "landed", true, "=", false)
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 10)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "a", _S.binary("+", _S.invoke(_S.read(_v10, "Math"), "atan2", [_S.prop(_S.read(_v10, "tip"), "dy"), _S.prop(_S.read(_v10, "tip"), "dx")]), _S.invoke(_S.read(_v10, "Rg"), "range", [_S.unary("-", 0.5), 0.5])))
			_S.define(_v10, "sp", _S.invoke(_S.read(_v10, "Rg"), "range", [150, 400]))
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "SPARK"), _S.prop(_S.read(_v10, "tip"), "x"), _S.prop(_S.read(_v10, "tip"), "y"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.invoke(_S.read(_v10, "Rg"), "range", [0.12, 0.35])])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
		var _v11 = _S.scope(_v8)
		_S.define(_v11, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v11, "i"), 16)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "a", _S.binary("+", _S.read(_v12, "a0"), _S.binary("*", _S.binary("-", _S.read(_v12, "a1"), _S.read(_v12, "a0")), _S.invoke(_S.read(_v12, "Rg"), "range", [0.3, 1]))))
			var _v13 = _S.call_value(_S.read(_v12, "onArc"), [_S.read(_v12, "A"), _S.prop(_S.read(_v12, "A"), "R"), _S.read(_v12, "a")])
			_S.define(_v12, "x", _S.prop(_v13, 0))
			_S.define(_v12, "y", _S.prop(_v13, 1))
			_S.define(_v12, "ox", _S.binary("-", _S.read(_v12, "x"), _S.prop(_S.read(_v12, "A"), "cx")))
			_S.define(_v12, "oy", _S.binary("-", _S.read(_v12, "y"), _S.prop(_S.read(_v12, "A"), "cy")))
			_S.define(_v12, "l", _S.logical("||", _S.invoke(_S.read(_v12, "Math"), "hypot", [_S.read(_v12, "ox"), _S.read(_v12, "oy")]), func(): return 1))
			_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "Rg"), "range", [30, 100]))
			_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "MOTE"), _S.read(_v12, "x"), _S.read(_v12, "y"), _S.binary("*", _S.binary("/", _S.read(_v12, "ox"), _S.read(_v12, "l")), _S.read(_v12, "sp")), _S.binary("-", _S.binary("*", _S.binary("/", _S.read(_v12, "oy"), _S.read(_v12, "l")), _S.read(_v12, "sp")), 10), _S.invoke(_S.read(_v12, "Rg"), "range", [0.25, 0.55]), _S.prop(_S.read(_v12, "C"), _S.binary("+", 4, _S.invoke(_S.read(_v12, "Rg"), "int", [0, 1]))), 0.6])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "drawSlash"), [_S.read(_e, "p"), _S.read(_e, "E"), _S.read(_e, "t")])
	_S.call_value(_S.read(_e, "drawSlash"), [_S.read(_e, "p"), _S.read(_e, "A"), _S.read(_e, "t")])
	_S.define(_e, "g", _S.binary("-", _S.read(_e, "t"), _S.binary("*", _S.prop(_S.read(_e, "A"), "sweep"), 0.6)))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "g"), 0), func(): return _S.binary("<", _S.read(_e, "g"), 0.22))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "tip"), "x"), _S.prop(_S.read(_e, "tip"), "y"), _S.binary("*", _S.binary("*", 9, _S.invoke(_S.read(_e, "ease"), "outBack", [_S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "g"), 0.05)])])), _S.binary("-", 1, _S.binary("/", _S.read(_e, "g"), 0.22))), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3), 0.6])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.3)):
		var _v14 = _S.scope(_e)
		var _v15 = _S.call_value(_S.read(_v14, "onArc"), [_S.read(_v14, "A"), _S.binary("-", _S.prop(_S.read(_v14, "A"), "R"), 4), _S.binary("+", _S.prop(_S.read(_v14, "A"), "a0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v14, "A"), "a1"), _S.prop(_S.read(_v14, "A"), "a0")), _S.invoke(_S.read(_v14, "ease"), "outExpo", [_S.call_value(_S.read(_v14, "clamp"), [_S.binary("/", _S.read(_v14, "t"), _S.prop(_S.read(_v14, "A"), "sweep"))])])))])
		_S.define(_v14, "x", _S.prop(_v15, 0))
		_S.define(_v14, "y", _S.prop(_v15, 1))
		_S.invoke(_S.read(_v14, "p"), "glow", [_S.read(_v14, "x"), _S.read(_v14, "y"), 40, _S.prop(_S.read(_v14, "C"), 3), _S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.read(_v14, "t"), 0.3)))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	return null
