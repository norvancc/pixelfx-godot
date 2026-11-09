@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/root-snare.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "drawRock", _S.import_value("fx/nature/_lib.js", "drawRock"))
	_S.define(_e, "stoneShape", _S.import_value("fx/nature/_lib.js", "stoneShape"))
	_S.define(_e, "drawLeaf", _S.import_value("fx/nature/_lib.js", "drawLeaf"))
	_S.define(_e, "floorCrack", _S.import_value("fx/nature/_lib.js", "floorCrack"))
	_S.define(_e, "path", _S.function_value(_e, "_f0"))
	_S.define(_e, "root", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Root snare"}, {"desc": "The floor cracks and roots burst up round the character, spiralling round its legs; they cinch tight with a snap, hold, then crack and crumble into bark and dust."}, {"tags": ["nature", "roots", "plant", "snare", "root", "status", "actor", "one-shot"]}, {"size": [128, 96]}, {"origin": [64, 78]}, {"duration": 2.7}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#140c08", "#2a1a10", "#46301e", "#64462a", "#86623a", "#a8824e", "#ccaa70", "#ecd6a0"]}, {"glow": ["#123818", "#2f7a2a", "#6cb83a", "#c8f070"]}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "GRAB", _S.merge([{"turn": 0.9}, {"crouch": 3}, {"fx": _S.unary("-", 12)}, {"fy": _S.unary("-", 34)}, {"bx": 12}, {"by": _S.unary("-", 28)}, {"ffx": _S.unary("-", 2)}, {"fbx": 3}]))
	_S.define(_e, "act", _S.merge([{"poses": [[_S.unary("-", 0.24), _S.merge([_S.read(_e, "READY"), {"ffx": _S.unary("-", 2)}, {"fbx": 3}])], [0.3, _S.merge([{"turn": 0.9}, {"lean": _S.unary("-", 1)}, {"crouch": 2}, {"fx": _S.unary("-", 10)}, {"fy": _S.unary("-", 24)}, {"bx": 11}, {"by": _S.unary("-", 24)}, {"ffx": _S.unary("-", 2)}, {"fbx": 3}])], [0.62, _S.read(_e, "GRAB"), "snap"], [0.86, _S.merge([_S.read(_e, "GRAB"), {"lean": _S.unary("-", 3)}, {"fy": _S.unary("-", 37)}, {"by": _S.unary("-", 27)}])], [1.1, _S.merge([_S.read(_e, "GRAB"), {"lean": 3}, {"fy": _S.unary("-", 27)}, {"by": _S.unary("-", 37)}])], [1.34, _S.merge([_S.read(_e, "GRAB"), {"lean": _S.unary("-", 3)}, {"fy": _S.unary("-", 37)}, {"by": _S.unary("-", 27)}])], [1.58, _S.merge([_S.read(_e, "GRAB"), {"lean": 3}, {"fy": _S.unary("-", 27)}, {"by": _S.unary("-", 37)}])], [1.75, _S.merge([_S.read(_e, "GRAB"), {"crouch": 6}])], [1.8, _S.merge([{"turn": 1.1}, {"crouch": _S.unary("-", 1)}, {"y": _S.unary("-", 3)}, {"fx": _S.unary("-", 14)}, {"fy": _S.unary("-", 36)}, {"bx": 15}, {"by": _S.unary("-", 36)}, {"ffx": _S.unary("-", 3)}, {"ffy": _S.unary("-", 6)}, {"fbx": 4}, {"fby": _S.unary("-", 6)}]), "snap"], [2.05, _S.merge([_S.read(_e, "READY"), {"y": 0}, {"crouch": 5}])], [2.7, _S.merge([_S.read(_e, "READY"), {"ffx": _S.unary("-", 2)}, {"fbx": 3}])]]}, {"hits": [_S.merge([{"t": 0.62}, {"stop": 0.05}, {"shake": 0.1}, {"amp": 1}]), _S.merge([{"t": 1.75}, {"stop": 0.04}, {"shake": 0.14}, {"amp": 2}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SY", 0.34)
	_S.define(_e, "CINCH", 0.62)
	_S.define(_e, "BREAK", 1.75)
	_S.define(_e, "NP", 48)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "cinch", _S.arg(_args, 1))
	_S.define(_e, "pts", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<=", _S.read(_v0, "i"), _S.read(_v0, "NP"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "s", _S.binary("/", _S.read(_v1, "i"), _S.read(_v1, "NP")))
		_S.define(_v1, "th", _S.binary("+", _S.prop(_S.read(_v1, "r"), "th0"), _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v1, "r"), "dir"), _S.read(_v1, "TAU")), _S.prop(_S.read(_v1, "r"), "turns")), _S.read(_v1, "s"))))
		_S.define(_v1, "rad", _S.call_value(_S.read(_v1, "lerp"), [_S.prop(_S.read(_v1, "r"), "r0"), _S.binary("-", _S.prop(_S.read(_v1, "r"), "leg"), _S.binary("*", _S.read(_v1, "cinch"), 1.6)), _S.invoke(_S.read(_v1, "ease"), "outCubic", [_S.invoke(_S.read(_v1, "Math"), "min", [1, _S.binary("*", _S.read(_v1, "s"), 3.5)])])]))
		_S.invoke(_S.read(_v1, "pts"), "push", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "th")]), _S.read(_v1, "rad"))}, {"y": _S.binary("+", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v1, "r"), "h")), _S.invoke(_S.read(_v1, "Math"), "pow", [_S.read(_v1, "s"), 1.05])), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "th")]), _S.read(_v1, "rad")), _S.read(_v1, "SY")))}, {"z": _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "th")])}, {"s": _S.read(_v1, "s")}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return _S.read(_e, "pts")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "pts", _S.arg(_args, 1))
	_S.define(_e, "g", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "back", _S.arg(_args, 4))
	_S.define(_e, "a", _S.arg(_args, 5))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "NP"), _S.read(_e, "g"))]))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), _S.read(_v2, "n"))):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "A", _S.prop(_S.read(_v3, "pts"), _S.read(_v3, "i")))
		_S.define(_v3, "Bp", _S.prop(_S.read(_v3, "pts"), _S.binary("+", _S.read(_v3, "i"), 1)))
		_S.define(_v3, "front", _S.binary(">=", _S.binary("/", _S.binary("+", _S.prop(_S.read(_v3, "A"), "z"), _S.prop(_S.read(_v3, "Bp"), "z")), 2), 0))
		if _S.truth(_S.binary("===", _S.read(_v3, "front"), _S.read(_v3, "back"))):
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "+=", true)
			continue
		_S.define(_v3, "dx", _S.binary("-", _S.prop(_S.read(_v3, "Bp"), "x"), _S.prop(_S.read(_v3, "A"), "x")))
		_S.define(_v3, "dy", _S.binary("-", _S.prop(_S.read(_v3, "Bp"), "y"), _S.prop(_S.read(_v3, "A"), "y")))
		_S.define(_v3, "L", _S.logical("||", _S.invoke(_S.read(_v3, "Math"), "hypot", [_S.read(_v3, "dx"), _S.read(_v3, "dy")]), func(): return 1))
		_S.define(_v3, "nx", _S.binary("/", _S.unary("-", _S.read(_v3, "dy")), _S.read(_v3, "L")))
		_S.define(_v3, "ny", _S.binary("/", _S.read(_v3, "dx"), _S.read(_v3, "L")))
		_S.define(_v3, "up", (1 if _S.truth(_S.binary(">", _S.binary("+", _S.binary("*", _S.read(_v3, "nx"), _S.unary("-", 0.6)), _S.binary("*", _S.read(_v3, "ny"), _S.unary("-", 0.8))), 0)) else _S.unary("-", 1)))
		_S.define(_v3, "w", _S.binary("+", _S.binary("/", _S.binary("+", 1.4, _S.binary("*", 3.6, _S.invoke(_S.read(_v3, "Math"), "pow", [_S.binary("-", 1, _S.prop(_S.read(_v3, "A"), "s")), 0.8]))), 2), 0.35))
		_S.define(_v3, "dim", (1 if _S.truth(_S.read(_v3, "back")) else 0))
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "y", _S.invoke(_S.read(_v4, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.invoke(_S.read(_v4, "Math"), "min", [_S.prop(_S.read(_v4, "A"), "y"), _S.prop(_S.read(_v4, "Bp"), "y")]), _S.read(_v4, "w")), 1)]))
		while _S.truth(_S.binary("<=", _S.read(_v4, "y"), _S.invoke(_S.read(_v4, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.invoke(_S.read(_v4, "Math"), "max", [_S.prop(_S.read(_v4, "A"), "y"), _S.prop(_S.read(_v4, "Bp"), "y")]), _S.read(_v4, "w")), 1)]))):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "x", _S.invoke(_S.read(_v5, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.invoke(_S.read(_v5, "Math"), "min", [_S.prop(_S.read(_v5, "A"), "x"), _S.prop(_S.read(_v5, "Bp"), "x")]), _S.read(_v5, "w")), 1)]))
			while _S.truth(_S.binary("<=", _S.read(_v5, "x"), _S.invoke(_S.read(_v5, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.invoke(_S.read(_v5, "Math"), "max", [_S.prop(_S.read(_v5, "A"), "x"), _S.prop(_S.read(_v5, "Bp"), "x")]), _S.read(_v5, "w")), 1)]))):
				var _v6 = _S.scope(_v5)
				if _S.truth(_S.binary(">", _S.read(_v6, "y"), 0)):
					_v5 = _S.iteration(_v5)
					_S.write(_v5, "x", 1, "+=", true)
					continue
				_S.define(_v6, "px", _S.binary("-", _S.binary("+", _S.read(_v6, "x"), 0.5), _S.prop(_S.read(_v6, "A"), "x")))
				_S.define(_v6, "py", _S.binary("-", _S.binary("+", _S.read(_v6, "y"), 0.5), _S.prop(_S.read(_v6, "A"), "y")))
				_S.define(_v6, "u", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_v6, "px"), _S.read(_v6, "dx")), _S.binary("*", _S.read(_v6, "py"), _S.read(_v6, "dy"))), _S.binary("*", _S.read(_v6, "L"), _S.read(_v6, "L"))))
				if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v6, "u"), _S.unary("-", 0.2)), func(): return _S.binary(">", _S.read(_v6, "u"), 1.2))):
					_v5 = _S.iteration(_v5)
					_S.write(_v5, "x", 1, "+=", true)
					continue
				_S.define(_v6, "d", _S.binary("+", _S.binary("*", _S.read(_v6, "px"), _S.read(_v6, "nx")), _S.binary("*", _S.read(_v6, "py"), _S.read(_v6, "ny"))))
				if _S.truth(_S.binary(">", _S.invoke(_S.read(_v6, "Math"), "abs", [_S.read(_v6, "d")]), _S.read(_v6, "w"))):
					_v5 = _S.iteration(_v5)
					_S.write(_v5, "x", 1, "+=", true)
					continue
				_S.define(_v6, "side", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sign", [_S.read(_v6, "d")]), _S.read(_v6, "up")))
				_S.define(_v6, "q", _S.binary("/", _S.invoke(_S.read(_v6, "Math"), "abs", [_S.read(_v6, "d")]), _S.read(_v6, "w")))
				_S.define(_v6, "i2", ((7 if _S.truth(_S.binary(">", _S.read(_v6, "side"), 0)) else 1) if _S.truth(_S.binary(">", _S.read(_v6, "q"), 0.72)) else ((6 if _S.truth(_S.binary(">", _S.read(_v6, "q"), 0.3)) else 5) if _S.truth(_S.binary(">", _S.read(_v6, "side"), 0)) else (2 if _S.truth(_S.binary(">", _S.read(_v6, "q"), 0.35)) else 3))))
				if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v6, "q"), 0.25), func(): return _S.binary("<", _S.call_value(_S.read(_v6, "rand"), [_S.invoke(_S.read(_v6, "Math"), "round", [_S.binary("*", _S.prop(_S.read(_v6, "A"), "s"), 40)]), 3]), 0.4))):
					_S.write(_v6, "i2", 4, "=", false)
				_S.invoke(_S.read(_v6, "p"), "dot", [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.prop(_S.read(_v6, "C"), _S.invoke(_S.read(_v6, "Math"), "max", [1, _S.binary("-", _S.read(_v6, "i2"), _S.read(_v6, "dim"))])), _S.read(_v6, "a")])
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "x", 1, "+=", true)
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "y", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.binary("===", _S.binary("%", _S.read(_v3, "i"), 7), 3), func(): return _S.binary(">", _S.read(_v3, "w"), 1.2))):
			_S.invoke(_S.read(_v3, "p"), "dot", [_S.binary("-", _S.prop(_S.read(_v3, "A"), "x"), _S.binary("*", _S.binary("*", _S.read(_v3, "nx"), _S.read(_v3, "up")), _S.binary("+", _S.read(_v3, "w"), 1))), _S.binary("-", _S.prop(_S.read(_v3, "A"), "y"), _S.binary("*", _S.binary("*", _S.read(_v3, "ny"), _S.read(_v3, "up")), _S.binary("+", _S.read(_v3, "w"), 1))), _S.prop(_S.read(_v3, "C"), _S.binary("-", 2, _S.read(_v3, "dim"))), _S.read(_v3, "a")])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "glow"), 4]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f3"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "G"), 3), _S.prop(_S.read(_e, "G"), 2), _S.prop(_S.read(_e, "G"), 1), _S.prop(_S.read(_e, "G"), 0)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "chips", [])
	_S.define(_e, "roots", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 5}]), _S.function_value(_e, "_f4")]))
	_S.define(_e, "cracks", [_S.call_value(_S.read(_e, "floorCrack"), [_S.read(_e, "R"), _S.unary("-", 1), _S.invoke(_S.read(_e, "R"), "range", [18, 26])]), _S.call_value(_S.read(_e, "floorCrack"), [_S.read(_e, "R"), 1, _S.invoke(_S.read(_e, "R"), "range", [18, 26])])])
	_S.define(_e, "t", 0)
	_S.define(_e, "cinched", false)
	_S.define(_e, "broken", false)
	_S.define(_e, "grow", _S.function_value(_e, "_f5"))
	_S.define(_e, "squeeze", _S.function_value(_e, "_f6"))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f9")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"th0": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 5), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.3), 0.3]))}, {"dir": (1 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.unary("-", 1))}, {"turns": _S.invoke(_S.read(_e, "R"), "range", [1.1, 1.6])}, {"r0": _S.invoke(_S.read(_e, "R"), "range", [14, 19])}, {"leg": _S.invoke(_S.read(_e, "R"), "range", [8, 10])}, {"h": _S.invoke(_S.read(_e, "R"), "range", [13, 21])}, {"at": _S.binary("+", _S.binary("+", 0.16, _S.binary("*", _S.read(_e, "i"), 0.07)), _S.invoke(_S.read(_e, "R"), "range", [0, 0.04]))}, {"buds": [_S.invoke(_S.read(_e, "R"), "range", [0.35, 0.55]), _S.invoke(_S.read(_e, "R"), "range", [0.6, 0.85])]}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "r"), "at")), 0.32)])])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "CINCH"), 0.03), _S.binary("+", _S.read(_e, "CINCH"), 0.05), _S.read(_e, "t")]), _S.binary("-", 1, _S.binary("*", 0.4, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "CINCH"), 0.05), _S.binary("+", _S.read(_e, "CINCH"), 0.25), _S.read(_e, "t")]))))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "dt"), 120)]))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), 0.4), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.3, _S.read(_e, "f"))]))):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "sd", _S.invoke(_S.read(_v7, "R"), "sign", []))
		_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "GRIT"), _S.binary("*", _S.read(_v7, "sd"), _S.invoke(_S.read(_v7, "R"), "range", [4, 22])), _S.unary("-", 1), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v7, "R"), "range", [30, 90])), _S.invoke(_S.read(_v7, "R"), "range", [0.5, 0.9]), _S.invoke(_S.read(_v7, "R"), "pick", [[_S.prop(_S.read(_v7, "C"), 5), _S.prop(_S.read(_v7, "C"), 4)]]), 1])
	for _v8 in _S.array(_S.read(_e, "roots")):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "r", _v8)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v9, "r"), "burst")), func(): return _S.binary(">=", _S.read(_v9, "t"), _S.prop(_S.read(_v9, "r"), "at")))):
			var _v10 = _S.scope(_v9)
			_S.set_prop(_S.read(_v10, "r"), "burst", true, "=", false)
			_S.define(_v10, "x", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.prop(_S.read(_v10, "r"), "th0")]), _S.prop(_S.read(_v10, "r"), "r0")))
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v11, "i"), 4)):
				_S.invoke(_S.read(_v11, "chips"), "push", [_S.merge([{"x": _S.read(_v11, "x")}, {"y": _S.unary("-", 1)}, {"vx": _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 60), 60])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v11, "R"), "range", [60, 160]))}, {"a": _S.invoke(_S.read(_v11, "R"), "range", [0, _S.read(_v11, "TAU")])}, {"va": _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 15), 15])}, {"s": _S.invoke(_S.read(_v11, "R"), "range", [1.2, 2])}, {"pts": _S.call_value(_S.read(_v11, "stoneShape"), [_S.read(_v11, "R")])}, {"life": _S.invoke(_S.read(_v11, "R"), "range", [0.6, 0.9])}])])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "i", 1, "+=", true)
			var _v12 = _S.scope(_v10)
			_S.define(_v12, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v12, "i"), 3)):
				_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "DUST"), _S.read(_v12, "x"), _S.unary("-", 1), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [4, 18])), _S.invoke(_S.read(_v12, "R"), "range", [0.4, 0.8]), _S.prop(_S.read(_v12, "C"), 5), _S.invoke(_S.read(_v12, "R"), "range", [2, 3.5])])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "i", 1, "+=", true)
			_S.invoke(_S.read(_v10, "lights"), "add", [_S.read(_v10, "x"), _S.unary("-", 4), 20, _S.prop(_S.read(_v10, "G"), 2), 0.35, 0.3])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "cinched")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CINCH")))):
		var _v13 = _S.scope(_e)
		_S.write(_v13, "cinched", true, "=", false)
		_S.invoke(_S.read(_v13, "lights"), "add", [0, _S.unary("-", 10), 40, _S.prop(_S.read(_v13, "G"), 3), 0.5, 0.3])
		_S.invoke(_S.read(_v13, "lights"), "add", [0, _S.unary("-", 10), 16, _S.read(_v13, "WHITE"), 0.4, 0.06])
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v14, "i"), 8)):
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "DUST"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [0, 4])), _S.binary("*", _S.invoke(_S.read(_v14, "R"), "sign", []), _S.invoke(_S.read(_v14, "R"), "range", [20, 60])), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [4, 14])), _S.invoke(_S.read(_v14, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v14, "C"), 5), _S.invoke(_S.read(_v14, "R"), "range", [2, 3.5])])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "i", 1, "+=", true)
		var _v15 = _S.scope(_v13)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 6)):
			_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "STAR"), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 9), 9]), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [4, 20])), 0, _S.unary("-", 4), _S.invoke(_S.read(_v15, "R"), "range", [0.25, 0.5]), _S.prop(_S.read(_v15, "G"), 3), _S.invoke(_S.read(_v15, "R"), "range", [0.8, 1.8]), _S.invoke(_S.read(_v15, "R"), "range", [0, 0.1])])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "CINCH")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.06, _S.read(_e, "f"))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "MOTE"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 9), 9]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [3, 18])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [14, 30])), _S.invoke(_S.read(_e, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_e, "G"), 3), 0.6])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "broken")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BREAK")))):
		var _v16 = _S.scope(_e)
		_S.write(_v16, "broken", true, "=", false)
		_S.invoke(_S.read(_v16, "lights"), "add", [0, _S.unary("-", 10), 36, _S.prop(_S.read(_v16, "G"), 2), 0.4, 0.25])
		for _v17 in _S.array(_S.read(_v16, "roots")):
			var _v18 = _S.scope(_v16)
			_S.define(_v18, "r", _v17)
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "pts", _S.call_value(_S.read(_v19, "path"), [_S.read(_v19, "r"), 1]))
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "i", 2)
			while _S.truth(_S.binary("<", _S.read(_v20, "i"), _S.read(_v20, "NP"))):
				var _v21 = _S.scope(_v20)
				_S.define(_v21, "q", _S.prop(_S.read(_v21, "pts"), _S.read(_v21, "i")))
				_S.define(_v21, "w", _S.binary("+", 1.4, _S.binary("*", 3.6, _S.invoke(_S.read(_v21, "Math"), "pow", [_S.binary("-", 1, _S.prop(_S.read(_v21, "q"), "s")), 0.8]))))
				_S.invoke(_S.read(_v21, "chips"), "push", [_S.merge([{"x": _S.prop(_S.read(_v21, "q"), "x")}, {"y": _S.invoke(_S.read(_v21, "Math"), "min", [_S.prop(_S.read(_v21, "q"), "y"), _S.unary("-", 1)])}, {"vx": _S.binary("+", _S.binary("*", _S.logical("||", _S.invoke(_S.read(_v21, "Math"), "sign", [_S.prop(_S.read(_v21, "q"), "x")]), func(): return 1), _S.invoke(_S.read(_v21, "R"), "range", [25, 85])), _S.binary("*", _S.prop(_S.read(_v21, "q"), "x"), 3))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [50, 150]))}, {"a": _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "TAU")])}, {"va": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 10), 10])}, {"s": _S.call_value(_S.read(_v21, "clamp"), [_S.binary("*", _S.read(_v21, "w"), 0.75), 1.5, 3])}, {"pts": _S.call_value(_S.read(_v21, "stoneShape"), [_S.read(_v21, "R")])}, {"life": _S.invoke(_S.read(_v21, "Math"), "min", [_S.invoke(_S.read(_v21, "R"), "range", [0.7, 0.95]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v21, "meta"), "duration"), 0.05), _S.read(_v21, "t"))])}])])
				if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v21, "i"), 10), 2)):
					_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "GRIT"), _S.prop(_S.read(_v21, "q"), "x"), _S.invoke(_S.read(_v21, "Math"), "min", [_S.prop(_S.read(_v21, "q"), "y"), _S.unary("-", 1)]), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 40), 40]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [20, 80])), _S.invoke(_S.read(_v21, "Math"), "min", [_S.invoke(_S.read(_v21, "R"), "range", [0.6, 0.9]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v21, "meta"), "duration"), 0.05), _S.read(_v21, "t"))]), _S.invoke(_S.read(_v21, "R"), "pick", [[_S.prop(_S.read(_v21, "C"), 4), _S.prop(_S.read(_v21, "C"), 3), _S.prop(_S.read(_v21, "C"), 2)]]), (2 if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [0.3])) else 1)])
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "i", 4, "+=", false)
		var _v22 = _S.scope(_v16)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 10)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "SMOKE"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [2, 16])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [5, 20])), _S.invoke(_S.read(_v22, "Math"), "min", [_S.invoke(_S.read(_v22, "R"), "range", [0.6, 0.9]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v22, "meta"), "duration"), 0.05), _S.read(_v22, "t"))]), _S.prop(_S.read(_v22, "C"), 5), _S.invoke(_S.read(_v22, "R"), "range", [3, 5]), 0, 0])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
	var _v23 = _S.scope(_e)
	_S.define(_v23, "i", _S.binary("-", _S.prop(_S.read(_v23, "chips"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v23, "i"), 0)):
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "c", _S.prop(_S.read(_v24, "chips"), _S.read(_v24, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v24, "c"), "life", _S.read(_v24, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v24, "chips"), "splice", [_S.read(_v24, "i"), 1])
		_S.set_prop(_S.read(_v24, "c"), "vy", _S.binary("*", 950, _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "c"), "x", _S.binary("*", _S.prop(_S.read(_v24, "c"), "vx"), _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "c"), "y", _S.binary("*", _S.prop(_S.read(_v24, "c"), "vy"), _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "c"), "a", _S.binary("*", _S.prop(_S.read(_v24, "c"), "va"), _S.read(_v24, "dt")), "+=", false)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v24, "c"), "y"), 0), func(): return _S.binary(">", _S.prop(_S.read(_v24, "c"), "vy"), 0))):
			(_S.last([_S.set_prop(_S.read(_v24, "c"), "y", 0, "=", false), _S.set_prop(_S.read(_v24, "c"), "vy", _S.unary("-", 0.3), "*=", false), _S.set_prop(_S.read(_v24, "c"), "vx", 0.5, "*=", false)]) if _S.truth(_S.binary(">", _S.prop(_S.read(_v24, "c"), "vy"), 110)) else _S.last([_S.set_prop(_S.read(_v24, "c"), "y", 0, "=", false), _S.set_prop(_S.read(_v24, "c"), "vy", _S.set_prop(_S.read(_v24, "c"), "vx", _S.set_prop(_S.read(_v24, "c"), "va", 0, "=", false), "=", false), "=", false)]))
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "open", _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), 0.25)])]))
	_S.define(_e, "hot", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, 0.3, _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.5, 1.4, _S.read(_e, "t")]))))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.6), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.15), _S.read(_e, "t")])))
	for _v25 in _S.array(_S.read(_e, "cracks")):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "c", _v25)
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "m", _S.invoke(_S.read(_v27, "Math"), "max", [2, _S.invoke(_S.read(_v27, "Math"), "ceil", [_S.binary("*", _S.prop(_S.read(_v27, "c"), "length"), _S.read(_v27, "open"))])]))
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "k", 1)
		while _S.truth(_S.binary("<", _S.read(_v28, "k"), _S.read(_v28, "m"))):
			var _v29 = _S.scope(_v28)
			var _v30 = _S.prop(_S.read(_v29, "c"), _S.binary("-", _S.read(_v29, "k"), 1))
			_S.define(_v29, "x0", _S.prop(_v30, 0))
			_S.define(_v29, "y0", _S.prop(_v30, 1))
			var _v31 = _S.prop(_S.read(_v29, "c"), _S.read(_v29, "k"))
			_S.define(_v29, "x1", _S.prop(_v31, 0))
			_S.define(_v29, "y1", _S.prop(_v31, 1))
			_S.invoke(_S.read(_v29, "p"), "line", [_S.read(_v29, "x0"), _S.binary("+", _S.read(_v29, "y0"), 1), _S.read(_v29, "x1"), _S.binary("+", _S.read(_v29, "y1"), 1), _S.prop(_S.read(_v29, "C"), 0), _S.read(_v29, "fade")])
			_S.invoke(_S.read(_v29, "p"), "line", [_S.read(_v29, "x0"), _S.read(_v29, "y0"), _S.read(_v29, "x1"), _S.read(_v29, "y1"), (_S.prop(_S.read(_v29, "G"), 3) if _S.truth(_S.binary(">", _S.read(_v29, "hot"), 0.5)) else (_S.prop(_S.read(_v29, "G"), 2) if _S.truth(_S.binary(">", _S.read(_v29, "hot"), 0.2)) else _S.prop(_S.read(_v29, "C"), 1))), _S.read(_v29, "fade")])
			if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v29, "k"), 2), 0)):
				_S.invoke(_S.read(_v29, "p"), "glow", [_S.read(_v29, "x1"), _S.read(_v29, "y1"), 6, _S.prop(_S.read(_v29, "G"), 2), _S.binary("*", 0.3, _S.read(_v29, "hot"))])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "k", 1, "+=", true)
	_S.define(_e, "hold", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0.3, _S.read(_e, "CINCH"), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "BREAK"), _S.binary("+", _S.read(_e, "BREAK"), 0.3), _S.read(_e, "t")]))), _S.binary("+", 0.8, _S.binary("*", 0.2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 8)])))))
	if _S.truth(_S.binary(">", _S.read(_e, "hold"), 0)):
		_S.last([_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 12), 30, _S.prop(_S.read(_e, "G"), 2), _S.binary("*", 0.3, _S.read(_e, "hold"))]), _S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 1), 22, _S.prop(_S.read(_e, "G"), 3), _S.binary("*", 0.16, _S.read(_e, "hold"))])])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))):
		for _v32 in _S.array(_S.read(_e, "roots")):
			var _v33 = _S.scope(_e)
			_S.define(_v33, "r", _v32)
			if _S.truth(_S.binary(">", _S.read(_v33, "t"), _S.prop(_S.read(_v33, "r"), "at"))):
				_S.call_value(_S.read(_v33, "root"), [_S.read(_v33, "p"), _S.call_value(_S.read(_v33, "path"), [_S.read(_v33, "r"), _S.call_value(_S.read(_v33, "squeeze"), [])]), _S.call_value(_S.read(_v33, "grow"), [_S.read(_v33, "r")]), _S.read(_v33, "C"), true, 1])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))):
		var _v34 = _S.scope(_e)
		for _v35 in _S.array(_S.read(_v34, "roots")):
			var _v36 = _S.scope(_v34)
			_S.define(_v36, "r", _v35)
			var _v37 = _S.scope(_v36)
			if _S.truth(_S.binary("<=", _S.read(_v37, "t"), _S.prop(_S.read(_v37, "r"), "at"))):
				continue
			_S.define(_v37, "pts", _S.call_value(_S.read(_v37, "path"), [_S.read(_v37, "r"), _S.call_value(_S.read(_v37, "squeeze"), [])]))
			_S.define(_v37, "g", _S.call_value(_S.read(_v37, "grow"), [_S.read(_v37, "r")]))
			_S.call_value(_S.read(_v37, "root"), [_S.read(_v37, "p"), _S.read(_v37, "pts"), _S.read(_v37, "g"), _S.read(_v37, "C"), false, 1])
			for _v38 in _S.array(_S.prop(_S.read(_v37, "r"), "buds")):
				var _v39 = _S.scope(_v37)
				_S.define(_v39, "b", _v38)
				var _v40 = _S.scope(_v39)
				_S.define(_v40, "q", _S.prop(_S.read(_v40, "pts"), _S.invoke(_S.read(_v40, "Math"), "floor", [_S.binary("*", _S.read(_v40, "b"), _S.read(_v40, "NP"))])))
				_S.define(_v40, "lk", _S.call_value(_S.read(_v40, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.binary("-", _S.read(_v40, "t"), _S.read(_v40, "CINCH")), 0.1), _S.binary("*", _S.read(_v40, "b"), 0.2)), 0.25)]))
				if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.read(_v40, "b"), _S.read(_v40, "g")), func(): return _S.binary("<=", _S.read(_v40, "lk"), 0)), func(): return _S.binary("<", _S.prop(_S.read(_v40, "q"), "z"), 0))):
					continue
				_S.call_value(_S.read(_v40, "drawLeaf"), [_S.read(_v40, "p"), _S.binary("+", _S.prop(_S.read(_v40, "q"), "x"), 2), _S.binary("-", _S.prop(_S.read(_v40, "q"), "y"), 2), _S.binary("*", 5, _S.read(_v40, "lk")), 1.6, _S.binary("+", _S.unary("-", 0.6), _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v40, "t"), 5), _S.binary("*", _S.read(_v40, "b"), 9))]), 0.2)), 0.3, [_S.prop(_S.read(_v40, "G"), 0), _S.prop(_S.read(_v40, "G"), 1), _S.prop(_S.read(_v40, "G"), 2), _S.prop(_S.read(_v40, "G"), 3)]])
		_S.define(_v34, "e", _S.binary("-", _S.read(_v34, "t"), _S.read(_v34, "CINCH")))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v34, "e"), 0), func(): return _S.binary("<", _S.read(_v34, "e"), 0.12))):
			for _v41 in _S.array([[_S.unary("-", 8), _S.unary("-", 6)], [8, _S.unary("-", 10)], [_S.unary("-", 7), _S.unary("-", 15)]]):
				var _v42 = _S.scope(_v34)
				var _v43 = _v41
				_S.define(_v42, "x", _S.prop(_v43, 0))
				_S.define(_v42, "y", _S.prop(_v43, 1))
				_S.call_value(_S.read(_v42, "sparkle"), [_S.read(_v42, "p"), _S.read(_v42, "x"), _S.read(_v42, "y"), _S.binary("*", 5, _S.binary("-", 1, _S.binary("/", _S.read(_v42, "e"), 0.12))), _S.prop(_S.read(_v42, "C"), 7), _S.prop(_S.read(_v42, "G"), 3), 0.4])
		_S.define(_v34, "w", _S.binary("-", _S.read(_v34, "BREAK"), _S.read(_v34, "t")))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v34, "w"), 0), func(): return _S.binary("<", _S.read(_v34, "w"), 0.05))):
			for _v44 in _S.array(_S.read(_v34, "roots")):
				var _v45 = _S.scope(_v34)
				_S.define(_v45, "r", _v44)
				for _v46 in _S.array(_S.call_value(_S.read(_v45, "path"), [_S.read(_v45, "r"), 1])):
					var _v47 = _S.scope(_v45)
					_S.define(_v47, "q", _v46)
					if _S.truth(_S.binary(">=", _S.prop(_S.read(_v47, "q"), "z"), 0)):
						_S.invoke(_S.read(_v47, "p"), "px", [_S.prop(_S.read(_v47, "q"), "x"), _S.prop(_S.read(_v47, "q"), "y"), _S.read(_v47, "WHITE")])
	_S.define(_e, "BARK", [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5)])
	for _v48 in _S.array(_S.read(_e, "chips")):
		var _v49 = _S.scope(_e)
		_S.define(_v49, "c", _v48)
		_S.call_value(_S.read(_v49, "drawRock"), [_S.read(_v49, "p"), _S.prop(_S.read(_v49, "c"), "x"), _S.prop(_S.read(_v49, "c"), "y"), _S.prop(_S.read(_v49, "c"), "s"), _S.prop(_S.read(_v49, "c"), "a"), _S.prop(_S.read(_v49, "c"), "pts"), _S.read(_v49, "BARK"), _S.invoke(_S.read(_v49, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v49, "c"), "life"), 0.25)])])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
