@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/spin-slash.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "swing", _S.import_value("fx/melee/_lib.js", "swing"))
	_S.define(_e, "onSwing", _S.import_value("fx/melee/_lib.js", "onSwing"))
	_S.define(_e, "travel", _S.import_value("fx/melee/_lib.js", "travel"))
	_S.define(_e, "smear", _S.import_value("fx/melee/_lib.js", "smear"))
	_S.define(_e, "trace", _S.import_value("fx/melee/_lib.js", "trace"))
	_S.define(_e, "glowAlong", _S.import_value("fx/melee/_lib.js", "glowAlong"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Spin slash"}, {"desc": "The blade whirls once round the waist on a tilted plane, behind the body and back in front; the closed ring flares white, dissolves into a dotted trace and throws sparks."}, {"tags": ["melee", "slash", "spin", "sword", "aoe", "combat", "one-shot"]}, {"size": [208, 104]}, {"origin": [104, 84]}, {"duration": 0.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#16224a", "#1f4a86", "#2a7fc0", "#48b8ec", "#9fe2ff", "#e2f7ff", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"radius": 46}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "STANCE", _S.merge([_S.read(_e, "READY"), {"weapon": "sword"}, {"fx": 12}, {"fy": _S.unary("-", 21)}, {"sa": _S.unary("-", 0.85)}]))
	_S.define(_e, "WOUND", _S.merge([_S.read(_e, "STANCE"), {"crouch": 6}, {"lean": _S.unary("-", 2)}, {"yaw": 1.1}, {"fx": 13}, {"fy": _S.unary("-", 20)}, {"sa": 0.3}, {"bx": 6}, {"by": _S.unary("-", 24)}, {"ffx": 8}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "WIDE", _S.merge([_S.read(_e, "STANCE"), {"crouch": 5}, {"lean": 3}, {"fx": 21}, {"fy": _S.unary("-", 21)}, {"sa": 0.05}, {"bx": _S.unary("-", 9)}, {"by": _S.unary("-", 23)}, {"ffx": 11}, {"fbx": _S.unary("-", 11)}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 60}])}, {"poses": [[_S.unary("-", 0.46), _S.read(_e, "STANCE")], [_S.unary("-", 0.2), _S.read(_e, "WOUND")], [_S.unary("-", 0.02), _S.merge([_S.read(_e, "WOUND"), {"crouch": 7}, {"yaw": 1.3}])], [0, _S.merge([_S.read(_e, "WIDE"), {"sa": _S.unary("-", 0.1)}, {"ghost": 1}]), "snap"], [0.05, _S.merge([_S.read(_e, "WIDE"), {"yaw": _S.unary("-", 1.57)}, {"ghost": 1}]), "snap"], [0.09, _S.merge([_S.read(_e, "WIDE"), {"yaw": _S.unary("-", 3.14)}, {"ghost": 1}]), "snap"], [0.13, _S.merge([_S.read(_e, "WIDE"), {"yaw": _S.unary("-", 4.71)}, {"ghost": 1}]), "snap"], [0.17, _S.read(_e, "WIDE"), "snap"], [0.56, _S.merge([_S.read(_e, "WIDE"), {"crouch": 4}, {"lean": 2}])], [0.92, _S.read(_e, "STANCE")]]}, {"hits": [_S.merge([{"t": 0.17}, {"stop": 0.12}, {"shake": 0.16}, {"amp": 2}, {"push": 2.4}, {"straw": 16}])]}, {"dust": [_S.merge([{"t": 0}, {"x": 0}, {"n": 6}]), _S.merge([{"t": 0.17}, {"x": 12}, {"n": 6}, {"dir": 1}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SW", 0.17)
	_S.define(_e, "FLARE", 0.3)
	_S.define(_e, "turn", _S.function_value(_e, "_f11"))
	_S.define(_e, "passedAt", _S.function_value(_e, "_f12"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "C"), "length"))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "R0", _S.prop(_S.read(_e, "o"), "radius"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "swing"), [_S.merge([{"cx": 0}, {"cy": _S.unary("-", 17)}, {"R": _S.read(_e, "R0")}, {"sy": 0.27}, {"rot": _S.unary("-", 0.1)}, {"a0": 0.5}, {"dir": _S.unary("-", 1)}, {"k": 0.15}])]))
	_S.define(_e, "E", _S.merge([_S.read(_e, "A"), {"R": _S.binary("*", _S.read(_e, "R0"), 0.8)}, {"k": 0.1}]))
	_S.define(_e, "W", 16)
	_S.define(_e, "WE", 5)
	_S.define(_e, "DIM", [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5)])
	_S.define(_e, "t", 0)
	_S.define(_e, "closed", false)
	_S.define(_e, "lastU", 0)
	_S.define(_e, "body", _S.function_value(_e, "_f2"))
	_S.define(_e, "ring", _S.function_value(_e, "_f4"))
	return _S.merge([{"update": _S.function_value(_e, "_f8")}, {"drawBack": _S.function_value(_e, "_f9")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "w0", _S.arg(_args, 2))
	_S.define(_e, "lag", _S.arg(_args, 3))
	_S.define(_e, "half", _S.arg(_args, 4))
	_S.define(_e, "rim", _S.arg(_args, 5))
	_S.define(_e, "U", _S.binary("*", _S.read(_e, "TAU"), _S.call_value(_S.read(_e, "turn"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "lag"))])))
	_S.define(_e, "ramp", (_S.read(_e, "DIM") if _S.truth(_S.binary("<", _S.read(_e, "half"), 0)) else _S.read(_e, "C")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "U"), 0.02), func(): return _S.binary(">", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "lag")), _S.binary("+", _S.read(_e, "SW"), 0.02)))):
		return null
	_S.call_value(_S.read(_e, "smear"), [_S.read(_e, "p"), _S.read(_e, "s"), 0, _S.read(_e, "U"), _S.read(_e, "w0"), _S.function_value(_e, "_f3"), _S.read(_e, "half")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "age", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "lag")), _S.call_value(_S.read(_e, "passedAt"), [_S.binary("/", _S.read(_e, "u"), _S.read(_e, "TAU"))])))
	_S.define(_e, "lead", _S.binary("-", _S.read(_e, "U"), _S.read(_e, "u")))
	_S.define(_e, "w", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "w0"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "lead"), 0.85)]), 0.5])), _S.binary("+", 0.3, _S.binary("*", 0.7, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "age")), 0.075)])))), _S.invoke(_S.read(_e, "Math"), "pow", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "u"), 1.3)]), 0.7])))
	if _S.truth(_S.binary("<", _S.read(_e, "w"), 0.45)):
		return null
	_S.define(_e, "q", _S.binary("/", _S.binary("-", _S.prop(_S.read(_e, "s"), "R"), _S.read(_e, "r")), _S.read(_e, "w")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "q"), 0), func(): return _S.binary(">", _S.read(_e, "q"), 1))):
		return null
	_S.define(_e, "ci", (0 if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "rim"), func(): return _S.binary("<", _S.read(_e, "q"), 0.26)), func(): return _S.binary("<", _S.read(_e, "age"), 0.06))) else _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "q"), _S.binary("-", _S.read(_e, "n"), 1)), 0.7), _S.binary("*", _S.read(_e, "age"), 13)), (0.4 if _S.truth(_S.read(_e, "rim")) else 1.4))])))
	_S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "ramp"), _S.binary("-", _S.binary("-", _S.read(_e, "n"), 1), _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "ci"), 0, _S.binary("-", _S.read(_e, "n"), 1)]))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("+", _S.binary("/", _S.read(_e, "u"), 1.1), 0.2)]), "=", false)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "half", _S.arg(_args, 1))
	_S.call_value(_S.read(_e, "body"), [_S.read(_e, "p"), _S.read(_e, "E"), _S.read(_e, "WE"), 0.025, _S.read(_e, "half"), false])
	_S.call_value(_S.read(_e, "body"), [_S.read(_e, "p"), _S.read(_e, "A"), _S.read(_e, "W"), 0, _S.read(_e, "half"), true])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SW"), 0.04))):
		_S.call_value(_S.read(_e, "glowAlong"), [_S.read(_e, "p"), _S.read(_e, "A"), _S.binary("-", _S.prop(_S.read(_e, "A"), "R"), 5), 0, _S.binary("*", _S.read(_e, "TAU"), _S.call_value(_S.read(_e, "turn"), [_S.read(_e, "t")])), 14, _S.prop(_S.read(_e, "C"), 3), _S.function_value(_e, "_f5"), _S.read(_e, "half")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SW"))):
		return null
	_S.define(_e, "f", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SW")), _S.read(_e, "FLARE")))
	_S.define(_e, "ramp", (_S.read(_e, "DIM") if _S.truth(_S.binary("<", _S.read(_e, "half"), 0)) else _S.read(_e, "C")))
	if _S.truth(_S.binary("<", _S.read(_e, "f"), 1)):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "R", _S.binary("+", _S.prop(_S.read(_v0, "A"), "R"), _S.binary("*", 6, _S.invoke(_S.read(_v0, "ease"), "outCubic", [_S.read(_v0, "f")]))))
		_S.define(_v0, "th", (9 if _S.truth(_S.binary("<", _S.read(_v0, "f"), 0.13)) else _S.invoke(_S.read(_v0, "Math"), "max", [1, _S.binary("+", _S.binary("*", 6, _S.invoke(_S.read(_v0, "Math"), "pow", [_S.binary("-", 1, _S.read(_v0, "f")), 1.5])), 0.5)])))
		_S.define(_v0, "S", _S.merge([_S.read(_v0, "A"), {"R": _S.read(_v0, "R")}]))
		_S.define(_v0, "step", (6 if _S.truth(_S.binary("<", _S.read(_v0, "f"), 0.13)) else (5 if _S.truth(_S.binary("<", _S.read(_v0, "f"), 0.3)) else (4 if _S.truth(_S.binary("<", _S.read(_v0, "f"), 0.55)) else 3))))
		_S.call_value(_S.read(_v0, "smear"), [_S.read(_v0, "p"), _S.read(_v0, "S"), 0, _S.read(_v0, "TAU"), _S.read(_v0, "th"), _S.function_value(_v0, "_f6"), _S.read(_v0, "half")])
		_S.call_value(_S.read(_v0, "glowAlong"), [_S.read(_v0, "p"), _S.read(_v0, "S"), _S.binary("-", _S.read(_v0, "R"), 2), 0, _S.read(_v0, "TAU"), 14, _S.prop(_S.read(_v0, "C"), 4), _S.binary("*", _S.binary("*", 0.32, _S.binary("-", 1, _S.read(_v0, "f"))), _S.binary("-", 1, _S.read(_v0, "f"))), _S.read(_v0, "half")])
	_S.define(_e, "k", _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SW")), 0.06), 0.4)])))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		_S.call_value(_S.read(_e, "trace"), [_S.read(_e, "p"), _S.read(_e, "A"), _S.binary("-", _S.prop(_S.read(_e, "A"), "R"), 0.5), 0, _S.read(_e, "TAU"), _S.prop(_S.read(_e, "ramp"), 4), _S.function_value(_e, "_f7"), _S.read(_e, "half")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", (0.2 if _S.truth(_S.binary("<", _S.read(_e, "half"), 0)) else 0.3), _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("-", _S.read(_e, "t"), _S.call_value(_S.read(_e, "passedAt"), [_S.binary("/", _S.read(_e, "u"), _S.read(_e, "TAU"))]))), 0.08)]))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "q", _S.binary("/", _S.binary("-", _S.read(_e, "R"), _S.read(_e, "r")), _S.read(_e, "th")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "q"), 0), func(): return _S.binary(">", _S.read(_e, "q"), 1))):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", ((_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.6)) else _S.prop(_S.read(_e, "ramp"), 5)) if _S.truth(_S.binary("<", _S.read(_e, "f"), 0.13)) else (_S.prop(_S.read(_e, "ramp"), _S.read(_e, "step")) if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.45)) else _S.prop(_S.read(_e, "ramp"), _S.binary("-", _S.read(_e, "step"), 1)))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", (1 if _S.truth(_S.binary("<", _S.read(_e, "f"), 0.4)) else _S.binary("-", 1.3, _S.read(_e, "f"))), "=", false)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", _S.binary("*", _S.read(_e, "k"), 1.5), _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "u"), 30)]), 5]), 0.8))]), 0.95)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "U", _S.binary("*", _S.read(_e, "TAU"), _S.call_value(_S.read(_e, "turn"), [_S.read(_e, "t")])))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SW"))):
		var _v1 = _S.scope(_e)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "u", _S.read(_v2, "lastU"))
		while _S.truth(_S.binary("<", _S.read(_v2, "u"), _S.read(_v2, "U"))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "tr", _S.call_value(_S.read(_v3, "travel"), [_S.read(_v3, "A"), _S.read(_v3, "u")]))
			_S.define(_v3, "ox", _S.binary("-", _S.prop(_S.read(_v3, "tr"), "x"), _S.prop(_S.read(_v3, "A"), "cx")))
			_S.define(_v3, "oy", _S.binary("-", _S.prop(_S.read(_v3, "tr"), "y"), _S.prop(_S.read(_v3, "A"), "cy")))
			_S.define(_v3, "l", _S.logical("||", _S.invoke(_S.read(_v3, "Math"), "hypot", [_S.read(_v3, "ox"), _S.read(_v3, "oy")]), func(): return 1))
			_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "Rg"), "range", [40, 120]))
			_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "MOTE"), _S.prop(_S.read(_v3, "tr"), "x"), _S.prop(_S.read(_v3, "tr"), "y"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v3, "tr"), "dx"), _S.read(_v3, "sp")), _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v3, "ox"), _S.read(_v3, "l")), _S.read(_v3, "sp")), 0.35)), _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v3, "tr"), "dy"), _S.read(_v3, "sp")), 0.6), _S.invoke(_S.read(_v3, "Rg"), "range", [5, 30])), _S.invoke(_S.read(_v3, "Rg"), "range", [0.22, 0.45]), _S.prop(_S.read(_v3, "C"), _S.binary("+", 4, _S.invoke(_S.read(_v3, "Rg"), "int", [0, 1]))), 0.55, 0, (_S.prop(_S.read(_v3, "PF"), "BACK") if _S.truth(_S.binary("<", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.prop(_S.read(_v3, "tr"), "a")]), 0)) else 0)])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "u", 0.3, "+=", false)
		_S.write(_v1, "lastU", _S.read(_v1, "U"), "=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "closed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SW")))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "closed", true, "=", false)
		_S.invoke(_S.read(_v4, "lights"), "add", [_S.prop(_S.read(_v4, "A"), "cx"), _S.binary("+", _S.prop(_S.read(_v4, "A"), "cy"), 4), 90, _S.prop(_S.read(_v4, "C"), 3), 0.4, 0.4])
		_S.define(_v4, "end", _S.call_value(_S.read(_v4, "travel"), [_S.read(_v4, "A"), _S.read(_v4, "TAU")]))
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 9)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "a", _S.binary("+", _S.invoke(_S.read(_v6, "Math"), "atan2", [_S.prop(_S.read(_v6, "end"), "dy"), _S.prop(_S.read(_v6, "end"), "dx")]), _S.invoke(_S.read(_v6, "Rg"), "range", [_S.unary("-", 0.45), 0.35])))
			_S.define(_v6, "sp", _S.invoke(_S.read(_v6, "Rg"), "range", [160, 360]))
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "SPARK"), _S.prop(_S.read(_v6, "end"), "x"), _S.prop(_S.read(_v6, "end"), "y"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.invoke(_S.read(_v6, "Rg"), "range", [20, 70])), _S.invoke(_S.read(_v6, "Rg"), "range", [0.14, 0.36])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
		var _v7 = _S.scope(_v4)
		_S.define(_v7, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "i"), 16)):
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "u", _S.invoke(_S.read(_v8, "Rg"), "range", [0, _S.read(_v8, "TAU")]))
			_S.define(_v8, "tr", _S.call_value(_S.read(_v8, "travel"), [_S.read(_v8, "A"), _S.read(_v8, "u")]))
			_S.define(_v8, "sp", _S.invoke(_S.read(_v8, "Rg"), "range", [110, 260]))
			_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "SPARK"), _S.prop(_S.read(_v8, "tr"), "x"), _S.prop(_S.read(_v8, "tr"), "y"), _S.binary("*", _S.prop(_S.read(_v8, "tr"), "dx"), _S.read(_v8, "sp")), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v8, "tr"), "dy"), _S.read(_v8, "sp")), _S.invoke(_S.read(_v8, "Rg"), "range", [20, 80])), _S.invoke(_S.read(_v8, "Rg"), "range", [0.12, 0.32]), 0, 1, 0, (_S.prop(_S.read(_v8, "PF"), "BACK") if _S.truth(_S.binary("<", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.prop(_S.read(_v8, "tr"), "a")]), 0)) else 0)])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
		var _v9 = _S.scope(_v4)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 6)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "u", _S.invoke(_S.read(_v10, "Rg"), "range", [0, _S.read(_v10, "TAU")]))
			var _v11 = _S.call_value(_S.read(_v10, "onSwing"), [_S.read(_v10, "A"), _S.binary("+", _S.prop(_S.read(_v10, "A"), "R"), _S.invoke(_S.read(_v10, "Rg"), "range", [_S.unary("-", 1), 3])), _S.read(_v10, "u")])
			_S.define(_v10, "x", _S.prop(_v11, 0))
			_S.define(_v10, "y", _S.prop(_v11, 1))
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "STAR"), _S.read(_v10, "x"), _S.read(_v10, "y"), 0, _S.unary("-", _S.invoke(_S.read(_v10, "Rg"), "range", [2, 8])), _S.invoke(_S.read(_v10, "Rg"), "range", [0.25, 0.5]), (_S.prop(_S.read(_v10, "C"), 5) if _S.truth(_S.invoke(_S.read(_v10, "Rg"), "chance", [0.5])) else _S.read(_v10, "WHITE")), _S.invoke(_S.read(_v10, "Rg"), "range", [1.2, 2.6]), _S.invoke(_S.read(_v10, "Rg"), "range", [0.04, 0.16]), (_S.prop(_S.read(_v10, "PF"), "BACK") if _S.truth(_S.binary("<", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.binary("+", _S.prop(_S.read(_v10, "A"), "a0"), _S.binary("*", _S.prop(_S.read(_v10, "A"), "dir"), _S.read(_v10, "u")))]), 0)) else 0)])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), _S.unary("-", 1)])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), 1])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.06)):
		var _v12 = _S.scope(_e)
		var _v13 = _S.call_value(_S.read(_v12, "onSwing"), [_S.read(_v12, "A"), _S.binary("-", _S.prop(_S.read(_v12, "A"), "R"), 3), 0])
		_S.define(_v12, "x", _S.prop(_v13, 0))
		_S.define(_v12, "y", _S.prop(_v13, 1))
		_S.call_value(_S.read(_v12, "sparkle"), [_S.read(_v12, "p"), _S.read(_v12, "x"), _S.read(_v12, "y"), _S.binary("*", 7, _S.binary("-", 1, _S.binary("/", _S.read(_v12, "t"), 0.06))), _S.prop(_S.read(_v12, "C"), 5), _S.prop(_S.read(_v12, "C"), 3), 0.5])
	_S.define(_e, "g", _S.binary("-", _S.read(_e, "t"), _S.binary("*", _S.read(_e, "SW"), 0.85)))
	_S.define(_e, "tip", _S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "A"), _S.binary("-", _S.prop(_S.read(_e, "A"), "R"), 3), _S.read(_e, "TAU")]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "g"), 0), func(): return _S.binary("<", _S.read(_e, "g"), 0.24))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "tip"), 0), _S.prop(_S.read(_e, "tip"), 1), _S.binary("*", _S.binary("*", 10, _S.invoke(_S.read(_e, "ease"), "outBack", [_S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "g"), 0.05)])])), _S.binary("-", 1, _S.binary("/", _S.read(_e, "g"), 0.24))), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3), 0.6])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SW"), 0.05))):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "U", _S.binary("*", _S.read(_v14, "TAU"), _S.call_value(_S.read(_v14, "turn"), [_S.read(_v14, "t")])))
		var _v15 = _S.call_value(_S.read(_v14, "onSwing"), [_S.read(_v14, "A"), _S.binary("-", _S.prop(_S.read(_v14, "A"), "R"), 5), _S.read(_v14, "U")])
		_S.define(_v14, "x", _S.prop(_v15, 0))
		_S.define(_v14, "y", _S.prop(_v15, 1))
		_S.define(_v14, "far", _S.binary("<", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.binary("+", _S.prop(_S.read(_v14, "A"), "a0"), _S.binary("*", _S.prop(_S.read(_v14, "A"), "dir"), _S.read(_v14, "U")))]), 0))
		_S.invoke(_S.read(_v14, "p"), "glow", [_S.read(_v14, "x"), _S.read(_v14, "y"), (26 if _S.truth(_S.read(_v14, "far")) else 38), _S.prop(_S.read(_v14, "C"), 3), _S.binary("*", (0.3 if _S.truth(_S.read(_v14, "far")) else 0.5), _S.binary("-", 1, _S.call_value(_S.read(_v14, "smooth"), [_S.binary("-", _S.read(_v14, "SW"), 0.04), _S.binary("+", _S.read(_v14, "SW"), 0.05), _S.read(_v14, "t")])))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "SW"))])), 1.6]))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "SW"), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "f")])), _S.binary("/", 1, 1.6)])))
