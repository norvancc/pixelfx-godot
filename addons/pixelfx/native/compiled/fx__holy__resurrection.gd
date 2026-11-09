@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/resurrection.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "GOLD", _S.import_value("fx/holy/_lib.js", "GOLD"))
	_S.define(_e, "ASH", _S.import_value("fx/holy/_lib.js", "ASH"))
	_S.define(_e, "shapeOf", _S.import_value("fx/holy/_lib.js", "shapeOf"))
	_S.define(_e, "recolor", _S.import_value("fx/holy/_lib.js", "recolor"))
	_S.define(_e, "toneOf", _S.import_value("fx/holy/_lib.js", "toneOf"))
	_S.define(_e, "feather", _S.import_value("fx/holy/_lib.js", "feather"))
	_S.define(_e, "Feathers", _S.import_value("fx/holy/_lib.js", "Feathers"))
	_S.define(_e, "oval", _S.import_value("fx/holy/_lib.js", "oval"))
	_S.define(_e, "FAR", _S.import_value("fx/holy/_lib.js", "FAR"))
	_S.define(_e, "NEAR", _S.import_value("fx/holy/_lib.js", "NEAR"))
	_S.define(_e, "along", _S.function_value(_e, "_f0"))
	_S.define(_e, "beat", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Resurrection"}, {"desc": "Light pours down on the fallen and life climbs back up the body; wings of light unfold, a halo forms, one great wingbeat, then the wings scatter into feathers."}, {"tags": ["holy", "revive", "resurrect", "wings", "halo", "light", "character", "one-shot"]}, {"size": [192, 160]}, {"origin": [96, 140]}, {"duration": 4.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "GOLD")}, {"ash": _S.read(_e, "ASH")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "DOWN", _S.merge([{"turn": 0.9}, {"crouch": 8}, {"lean": 6}, {"hy": 2}, {"fx": _S.unary("-", 4)}, {"fy": _S.unary("-", 10)}, {"bx": 9}, {"by": _S.unary("-", 10)}, {"ffx": 8}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "RISEN", _S.merge([{"turn": 1.15}, {"crouch": _S.unary("-", 1)}, {"fx": _S.unary("-", 15)}, {"fy": _S.unary("-", 33)}, {"bx": 16}, {"by": _S.unary("-", 33)}, {"hy": _S.unary("-", 1)}, {"ffx": _S.unary("-", 3)}, {"ffy": _S.unary("-", 5)}, {"fbx": 4}, {"fby": _S.unary("-", 5)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0.6}, {"poses": [[0, _S.read(_e, "DOWN")], [0.5, _S.read(_e, "DOWN")], [0.85, _S.merge([_S.read(_e, "DOWN"), {"crouch": 6}, {"lean": 4}, {"hy": 1}])], [1.15, _S.merge([{"turn": 1}, {"crouch": 2}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 17)}, {"bx": 9}, {"by": _S.unary("-", 17)}])], [1.5, _S.merge([_S.read(_e, "RISEN"), {"y": _S.unary("-", 2)}])], [1.95, _S.merge([_S.read(_e, "RISEN"), {"y": _S.unary("-", 3)}])], [2.1, _S.merge([_S.read(_e, "RISEN"), {"y": _S.unary("-", 2)}, {"crouch": 1}, {"fy": _S.unary("-", 37)}, {"by": _S.unary("-", 37)}])], [2.3, _S.merge([_S.read(_e, "RISEN"), {"y": _S.unary("-", 9)}, {"fx": _S.unary("-", 15)}, {"fy": _S.unary("-", 38)}, {"bx": 16}, {"by": _S.unary("-", 38)}])], [2.95, _S.merge([_S.read(_e, "RISEN"), {"y": _S.unary("-", 6)}])], [3.8, _S.merge([{"turn": 1}, {"y": 0}, {"crouch": 2}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 17)}, {"bx": 9}, {"by": _S.unary("-", 17)}])], [4.3, _S.read(_e, "READY")], [4.8, _S.read(_e, "READY")]]}, {"dust": [_S.merge([{"t": 3.8}, {"x": 0}, {"n": 5}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "TOP", _S.unary("-", 140))
	_S.define(_e, "POUR", 0.34)
	_S.define(_e, "CL0", 0.5)
	_S.define(_e, "CL1", 1.15)
	_S.define(_e, "W0", 1.1)
	_S.define(_e, "H0", 1.24)
	_S.define(_e, "H1", 1.5)
	_S.define(_e, "B0", 1.95)
	_S.define(_e, "B1", 2.25)
	_S.define(_e, "B2", 2.37)
	_S.define(_e, "B3", 2.8)
	_S.define(_e, "SC", 2.95)
	_S.define(_e, "GONE", 3.85)
	_S.define(_e, "HX", 0)
	_S.define(_e, "HY", _S.unary("-", 47))
	_S.define(_e, "HRX", 9.5)
	_S.define(_e, "HRY", 2.6)
	_S.define(_e, "SHOULDER", [4, _S.unary("-", 20)])
	_S.define(_e, "ARM_OPEN", [[0, 0], [7, _S.unary("-", 9)], [15, _S.unary("-", 19)], [20, _S.unary("-", 27)]])
	_S.define(_e, "ARM_FOLD", [[0, 0], [2, _S.unary("-", 2)], [3, _S.unary("-", 3)], [4, _S.unary("-", 3)]])
	_S.define(_e, "QUILLS", [[0.14, 1.35, 11, 2.6, 1], [0.26, 1.12, 14, 2.8, 1], [0.38, 0.88, 17, 3, 1], [0.5, 0.62, 19, 3.1, 1], [0.62, 0.35, 21, 3.2, 1], [0.72, 0.08, 23, 3.3, 1], [0.8, _S.unary("-", 0.2), 26, 3.4, 0], [0.85, _S.unary("-", 0.45), 29, 3.5, 0], [0.9, _S.unary("-", 0.72), 31, 3.6, 0], [0.95, _S.unary("-", 1), 30, 3.6, 0], [1, _S.unary("-", 1.3), 26, 3.4, 0], [0.22, 1.2, 7, 2.2, 2], [0.34, 0.98, 8, 2.3, 2], [0.46, 0.75, 9, 2.4, 2], [0.58, 0.5, 10, 2.5, 2], [0.7, 0.22, 10, 2.5, 2], [0.81, _S.unary("-", 0.1), 11, 2.6, 2], [0.92, _S.unary("-", 0.5), 11, 2.6, 2]])
	_S.define(_e, "FLEX", [1, 0.5, 0.3])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "L", 0)
	_S.define(_e, "seglen", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 1)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.prop(_S.read(_v0, "pts"), "length"))):
		_S.write(_v0, "L", _S.set_prop(_S.read(_v0, "seglen"), _S.binary("-", _S.read(_v0, "i"), 1), _S.invoke(_S.read(_v0, "Math"), "hypot", [_S.binary("-", _S.prop(_S.prop(_S.read(_v0, "pts"), _S.read(_v0, "i")), 0), _S.prop(_S.prop(_S.read(_v0, "pts"), _S.binary("-", _S.read(_v0, "i"), 1)), 0)), _S.binary("-", _S.prop(_S.prop(_S.read(_v0, "pts"), _S.read(_v0, "i")), 1), _S.prop(_S.prop(_S.read(_v0, "pts"), _S.binary("-", _S.read(_v0, "i"), 1)), 1))]), "=", false), "+=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.define(_e, "d", _S.binary("*", _S.read(_e, "s"), _S.read(_e, "L")))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "i"), _S.prop(_S.read(_v1, "seglen"), "length"))):
		var _v2 = _S.scope(_v1)
		if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v2, "d"), _S.prop(_S.read(_v2, "seglen"), _S.read(_v2, "i"))), func(): return _S.binary("===", _S.read(_v2, "i"), _S.binary("-", _S.prop(_S.read(_v2, "seglen"), "length"), 1)))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "f", (_S.call_value(_S.read(_v3, "clamp"), [_S.binary("/", _S.read(_v3, "d"), _S.prop(_S.read(_v3, "seglen"), _S.read(_v3, "i")))]) if _S.truth(_S.prop(_S.read(_v3, "seglen"), _S.read(_v3, "i"))) else 0))
			return [_S.call_value(_S.read(_v3, "lerp"), [_S.prop(_S.prop(_S.read(_v3, "pts"), _S.read(_v3, "i")), 0), _S.prop(_S.prop(_S.read(_v3, "pts"), _S.binary("+", _S.read(_v3, "i"), 1)), 0), _S.read(_v3, "f")]), _S.call_value(_S.read(_v3, "lerp"), [_S.prop(_S.prop(_S.read(_v3, "pts"), _S.read(_v3, "i")), 1), _S.prop(_S.prop(_S.read(_v3, "pts"), _S.binary("+", _S.read(_v3, "i"), 1)), 1), _S.read(_v3, "f")])]
		_S.write(_v2, "d", _S.prop(_S.read(_v2, "seglen"), _S.read(_v2, "i")), "-=", false)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "i", 1, "+=", true)
	return _S.prop(_S.read(_e, "pts"), _S.binary("-", _S.prop(_S.read(_e, "pts"), "length"), 1))

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "B0"))):
		return 0
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "B1"))):
		return _S.binary("*", _S.unary("-", 0.34), _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "B0"), _S.read(_e, "B1")])]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "B2"))):
		return _S.call_value(_S.read(_e, "lerp"), [_S.unary("-", 0.34), 0.66, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "B1"), _S.read(_e, "B2")])])])
	return _S.binary("*", 0.66, _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "B2"), _S.read(_e, "B3")]), 1.3])))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "wing", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawWing", _S.function_value(_e, "_f7"))
	_S.define(_e, "shaft", _S.function_value(_e, "_f11"))
	_S.define(_e, "pool", _S.function_value(_e, "_f13"))
	_S.define(_e, "halo", _S.function_value(_e, "_f14"))
	_S.define(_e, "body", _S.function_value(_e, "_f15"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "AS", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "ash"), 6]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shapeOf"), [_S.read(_e, "A")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "WING", [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE")])
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f18")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}, {"haze": _S.prop(_S.read(_e, "C"), 4)}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "loose", _S.construct(_S.read(_e, "Feathers"), [_S.read(_e, "R"), 0]))
	_S.define(_e, "rows", _S.construct(_S.read(_e, "Map"), []))
	for _v52 in _S.array(_S.prop(_S.read(_e, "S"), "edge")):
		var _v53 = _S.scope(_e)
		var _v54 = _v52
		_S.define(_v53, "x", _S.prop(_v54, 0))
		_S.define(_v53, "y", _S.prop(_v54, 1))
		_S.invoke(_S.logical("??", _S.invoke(_S.read(_v53, "rows"), "get", [_S.read(_v53, "y")]), func(): return _S.invoke(_S.invoke(_S.read(_v53, "rows"), "set", [_S.read(_v53, "y"), []]), "get", [_S.read(_v53, "y")])), "push", [_S.read(_v53, "x")])
	_S.define(_e, "rays", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 6}]), _S.function_value(_e, "_f19")]))
	_S.define(_e, "cores", _S.invoke(_S.invoke(_S.concat([_S.array(_S.read(_e, "rays"))]), "sort", [_S.function_value(_e, "_f20")]), "slice", [0, 2]))
	_S.define(_e, "motes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 34}]), _S.function_value(_e, "_f21")]))
	_S.define(_e, "reach", _S.invoke(_S.read(_e, "QUILLS"), "map", [_S.function_value(_e, "_f22")]))
	_S.define(_e, "far", _S.invoke(_S.read(_e, "Math"), "max", _S.concat([_S.array(_S.read(_e, "reach"))])))
	_S.define(_e, "quills", _S.invoke(_S.read(_e, "QUILLS"), "map", [_S.function_value(_e, "_f23")]))
	_S.define(_e, "profile", _S.construct(_S.read(_e, "Float32Array"), [121]))
	_S.define(_e, "t", 0)
	_S.define(_e, "poured", false)
	_S.define(_e, "flashed", false)
	_S.define(_e, "formed", false)
	_S.define(_e, "beaten", false)
	_S.define(_e, "climbY", _S.function_value(_e, "_f25"))
	_S.define(_e, "shaftK", _S.function_value(_e, "_f26"))
	_S.define(_e, "shaftW", _S.function_value(_e, "_f27"))
	_S.define(_e, "halfW", _S.function_value(_e, "_f28"))
	return _S.merge([{"update": _S.function_value(_e, "_f29")}, {"drawBack": _S.function_value(_e, "_f33")}, {"draw": _S.function_value(_e, "_f34")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "tt", _S.arg(_args, 0))
	_S.define(_e, "side", _S.arg(_args, 1))
	_S.define(_e, "oa", _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), _S.read(_e, "W0"), _S.binary("+", _S.read(_e, "W0"), 0.4)]), 1.6]))
	_S.define(_e, "rot", _S.call_value(_S.read(_e, "beat"), [_S.read(_e, "tt")]))
	_S.define(_e, "om", _S.binary("/", _S.binary("-", _S.call_value(_S.read(_e, "beat"), [_S.read(_e, "tt")]), _S.call_value(_S.read(_e, "beat"), [_S.binary("-", _S.read(_e, "tt"), 0.03)])), 0.03))
	_S.define(_e, "arm", _S.invoke(_S.read(_e, "ARM_FOLD"), "map", [_S.function_value(_e, "_f4")]))
	_S.define(_e, "cr", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "rot")]))
	_S.define(_e, "sr", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "rot")]))
	_S.define(_e, "place", _S.function_value(_e, "_f5"))
	_S.define(_e, "a0", _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "W0"), _S.binary("+", _S.read(_e, "W0"), 0.1), _S.read(_e, "tt")]))
	_S.define(_e, "out", [])
	_S.invoke(_S.read(_e, "quills"), "forEach", [_S.function_value(_e, "_f6")])
	return _S.merge([{"out": _S.read(_e, "out")}, {"arm": _S.invoke(_S.read(_e, "arm"), "map", [_S.read(_e, "place")])}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return [_S.call_value(_S.read(_e, "lerp"), [_S.prop(_S.read(_e, "f"), 0), _S.prop(_S.prop(_S.read(_e, "ARM_OPEN"), _S.read(_e, "i")), 0), _S.read(_e, "oa")]), _S.call_value(_S.read(_e, "lerp"), [_S.prop(_S.read(_e, "f"), 1), _S.prop(_S.prop(_S.read(_e, "ARM_OPEN"), _S.read(_e, "i")), 1), _S.read(_e, "oa")])]

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v4 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v4, 0))
	_S.define(_e, "y", _S.prop(_v4, 1))
	return [_S.binary("*", _S.read(_e, "side"), _S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "SHOULDER"), 0), _S.binary("*", _S.read(_e, "x"), _S.read(_e, "cr"))), _S.binary("*", _S.read(_e, "y"), _S.read(_e, "sr")))), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "SHOULDER"), 1), _S.binary("*", _S.read(_e, "x"), _S.read(_e, "sr"))), _S.binary("*", _S.read(_e, "y"), _S.read(_e, "cr")))]

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	if _S.truth(_S.binary(">=", _S.read(_e, "tt"), _S.binary("+", _S.prop(_S.prop(_S.read(_e, "q"), "off"), (0 if _S.truth(_S.binary(">", _S.read(_e, "side"), 0)) else 1)), 0.05))):
		return null
	_S.define(_e, "of", _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), _S.binary("+", _S.read(_e, "W0"), _S.prop(_S.read(_e, "q"), "open")), _S.binary("+", _S.binary("+", _S.read(_e, "W0"), _S.prop(_S.read(_e, "q"), "open")), 0.42)]), 2]))
	var _v5 = _S.call_value(_S.read(_e, "place"), [_S.call_value(_S.read(_e, "along"), [_S.read(_e, "arm"), _S.prop(_S.read(_e, "q"), "s")])])
	_S.define(_e, "bx", _S.prop(_v5, 0))
	_S.define(_e, "by", _S.prop(_v5, 1))
	_S.define(_e, "ang", _S.binary("-", _S.binary("+", _S.call_value(_S.read(_e, "lerp"), [_S.prop(_S.read(_e, "q"), "fold"), _S.prop(_S.read(_e, "q"), "ang"), _S.read(_e, "of")]), _S.read(_e, "rot")), _S.call_value(_S.read(_e, "clamp"), [_S.binary("*", _S.binary("*", _S.read(_e, "om"), 0.045), _S.prop(_S.read(_e, "FLEX"), _S.prop(_S.read(_e, "q"), "kind"))), _S.unary("-", 0.5), 0.5])))
	_S.invoke(_S.read(_e, "out"), "push", [_S.merge([{"i": _S.read(_e, "i")}, {"q": _S.read(_e, "q")}, {"x": _S.read(_e, "bx")}, {"y": _S.read(_e, "by")}, {"ang": (_S.read(_e, "ang") if _S.truth(_S.binary(">", _S.read(_e, "side"), 0)) else _S.binary("-", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "ang")))}, {"len": _S.binary("*", _S.prop(_S.read(_e, "q"), "len"), _S.call_value(_S.read(_e, "lerp"), [0.3, 1, _S.read(_e, "of")]))}, {"wid": _S.prop(_S.read(_e, "q"), "wid")}, {"a": _S.read(_e, "a0")}, {"hot": (1 if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "tt"), _S.binary("+", _S.binary("+", _S.read(_e, "W0"), _S.prop(_S.read(_e, "q"), "open")), 0.07)), func(): return _S.binary(">=", _S.read(_e, "tt"), _S.prop(_S.prop(_S.read(_e, "q"), "off"), (0 if _S.truth(_S.binary(">", _S.read(_e, "side"), 0)) else 1))))) else 0)}])])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "side", _S.arg(_args, 1))
	var _v6 = _S.call_value(_S.read(_e, "wing"), [_S.read(_e, "t"), _S.read(_e, "side")])
	_S.define(_e, "out", _S.prop(_v6, "out"))
	_S.define(_e, "arm", _S.prop(_v6, "arm"))
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "out"), "length"))):
		return null
	_S.define(_e, "order", _S.invoke(_S.concat([_S.array(_S.read(_e, "out"))]), "sort", [_S.function_value(_e, "_f8")]))
	for _v7 in _S.array(_S.read(_e, "order")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "f", _v7)
		if _S.truth(_S.binary("!==", _S.prop(_S.prop(_S.read(_v8, "f"), "q"), "kind"), 2)):
			_S.call_value(_S.read(_v8, "feather"), [_S.read(_v8, "p"), _S.prop(_S.read(_v8, "f"), "x"), _S.prop(_S.read(_v8, "f"), "y"), _S.prop(_S.read(_v8, "f"), "ang"), _S.prop(_S.read(_v8, "f"), "len"), _S.prop(_S.read(_v8, "f"), "wid"), _S.read(_v8, "WING"), _S.prop(_S.read(_v8, "f"), "a"), _S.read(_v8, "side"), _S.prop(_S.read(_v8, "f"), "hot")])
	for _v9 in _S.array(_S.read(_e, "order")):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "f", _v9)
		if _S.truth(_S.binary("===", _S.prop(_S.prop(_S.read(_v10, "f"), "q"), "kind"), 2)):
			_S.call_value(_S.read(_v10, "feather"), [_S.read(_v10, "p"), _S.prop(_S.read(_v10, "f"), "x"), _S.prop(_S.read(_v10, "f"), "y"), _S.prop(_S.read(_v10, "f"), "ang"), _S.prop(_S.read(_v10, "f"), "len"), _S.prop(_S.read(_v10, "f"), "wid"), _S.read(_v10, "WING"), _S.prop(_S.read(_v10, "f"), "a"), _S.read(_v10, "side"), _S.prop(_S.read(_v10, "f"), "hot")])
	_S.define(_e, "k", _S.binary("/", _S.prop(_S.read(_e, "out"), "length"), _S.prop(_S.read(_e, "quills"), "length")))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.5)):
		var _v11 = _S.scope(_e)
		_S.invoke(_S.read(_v11, "p"), "polyline", [_S.invoke(_S.read(_v11, "arm"), "map", [_S.function_value(_v11, "_f9")]), _S.prop(_S.read(_v11, "C"), 5), _S.prop(_S.prop(_S.read(_v11, "out"), 0), "a")])
		_S.invoke(_S.read(_v11, "p"), "polyline", [_S.read(_v11, "arm"), _S.read(_v11, "WHITE"), _S.prop(_S.prop(_S.read(_v11, "out"), 0), "a")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("*", _S.read(_e, "side"), 28), _S.unary("-", 36), 38, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.binary("*", 0.26, _S.prop(_S.prop(_S.read(_e, "out"), 0), "a")), _S.read(_e, "k"))])
	_S.define(_e, "g", _S.binary("%", _S.binary("*", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "W0")), 0.45), 1.3), 1))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0.9), func(): return _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "W0"), 0.45))), func(): return _S.binary("<", _S.read(_e, "g"), 0.8))):
		var _v13 = _S.scope(_e)
		var _v14 = _S.call_value(_S.read(_v13, "along"), [_S.read(_v13, "arm"), _S.binary("/", _S.read(_v13, "g"), 0.8)])
		_S.define(_v13, "gx", _S.prop(_v14, 0))
		_S.define(_v13, "gy", _S.prop(_v14, 1))
		_S.call_value(_S.read(_v13, "sparkle"), [_S.read(_v13, "p"), _S.read(_v13, "gx"), _S.read(_v13, "gy"), _S.binary("+", 2, _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_v13, "g"), 0.8), _S.prop(_S.read(_v13, "Math"), "PI"))]), 2)), _S.read(_v13, "WHITE"), _S.prop(_S.read(_v13, "C"), 6), 0.4])
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.prop(_S.prop(_S.read(_e, "arm"), 0), 0), _S.prop(_S.prop(_S.read(_e, "arm"), 0), 1), _S.prop(_S.prop(_S.read(_e, "arm"), 3), 0), _S.prop(_S.prop(_S.read(_e, "arm"), 3), 1), 7, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", _S.binary("*", 0.25, _S.prop(_S.prop(_S.read(_e, "out"), 0), "a")), _S.read(_e, "k"))])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "B1"), 0.03)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "B2"), 0.14)))):
		for _v15 in _S.array([6, 8, 10]):
			var _v16 = _S.scope(_e)
			_S.define(_v16, "i", _v15)
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "pts", [])
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v18, "j"), 10)):
				var _v19 = _S.scope(_v18)
				_S.define(_v19, "tt", _S.invoke(_S.read(_v19, "Math"), "max", [_S.binary("+", _S.read(_v19, "B1"), 0.01), _S.binary("-", _S.read(_v19, "t"), _S.binary("*", _S.read(_v19, "j"), 0.012))]))
				_S.define(_v19, "w", _S.invoke(_S.prop(_S.call_value(_S.read(_v19, "wing"), [_S.read(_v19, "tt"), _S.read(_v19, "side")]), "out"), "find", [_S.function_value(_v19, "_f10")]))
				if _S.truth(_S.read(_v19, "w")):
					_S.invoke(_S.read(_v19, "pts"), "push", [[_S.binary("+", _S.prop(_S.read(_v19, "w"), "x"), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.prop(_S.read(_v19, "w"), "ang")]), _S.binary("-", _S.prop(_S.read(_v19, "w"), "len"), 1))), _S.binary("+", _S.prop(_S.read(_v19, "w"), "y"), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.prop(_S.read(_v19, "w"), "ang")]), _S.binary("-", _S.prop(_S.read(_v19, "w"), "len"), 1)))]])
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "j", 1, "+=", true)
			_S.define(_v17, "fade", _S.binary("-", 1, _S.call_value(_S.read(_v17, "smooth"), [_S.read(_v17, "B2"), _S.binary("+", _S.read(_v17, "B2"), 0.14), _S.read(_v17, "t")])))
			var _v20 = _S.scope(_v17)
			_S.define(_v20, "j", 1)
			while _S.truth(_S.binary("<", _S.read(_v20, "j"), _S.prop(_S.read(_v20, "pts"), "length"))):
				_S.invoke(_S.read(_v20, "p"), "line", [_S.prop(_S.prop(_S.read(_v20, "pts"), _S.binary("-", _S.read(_v20, "j"), 1)), 0), _S.prop(_S.prop(_S.read(_v20, "pts"), _S.binary("-", _S.read(_v20, "j"), 1)), 1), _S.prop(_S.prop(_S.read(_v20, "pts"), _S.read(_v20, "j")), 0), _S.prop(_S.prop(_S.read(_v20, "pts"), _S.read(_v20, "j")), 1), (_S.read(_v20, "WHITE") if _S.truth(_S.binary("<", _S.read(_v20, "j"), 3)) else (_S.prop(_S.read(_v20, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v20, "j"), 6)) else _S.prop(_S.read(_v20, "C"), 4))), _S.binary("*", _S.read(_v20, "fade"), _S.binary("-", 1.1, _S.binary("/", _S.read(_v20, "j"), 10)))])
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "j", 1, "+=", true)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.prop(_S.read(_e, "b"), "q"), "ang"), _S.prop(_S.prop(_S.read(_e, "a"), "q"), "ang"))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v12 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v12, 0))
	_S.define(_e, "y", _S.prop(_v12, 1))
	return [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1)]

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	return _S.binary("===", _S.prop(_S.read(_e, "f"), "i"), _S.read(_e, "i"))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "shaftK"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0)):
		return null
	var _v21 = _S.scope(_e)
	_S.define(_v21, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v21, "i"), _S.prop(_S.read(_v21, "profile"), "length"))):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "q", _S.binary("/", _S.binary("-", _S.read(_v22, "i"), 60), 40))
		_S.define(_v22, "I", 0)
		for _v23 in _S.array(_S.read(_v22, "rays")):
			var _v24 = _S.scope(_v22)
			_S.define(_v24, "r", _v23)
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "d", _S.binary("/", _S.binary("-", _S.read(_v25, "q"), _S.prop(_S.read(_v25, "r"), "o")), _S.prop(_S.read(_v25, "r"), "w")))
			_S.write(_v25, "I", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v25, "r"), "b"), _S.invoke(_S.read(_v25, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_v25, "d")), _S.read(_v25, "d"))])), _S.binary("+", 0.72, _S.binary("*", 0.28, _S.invoke(_S.read(_v25, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v25, "t"), _S.prop(_S.read(_v25, "r"), "f")), _S.prop(_S.read(_v25, "r"), "ph"))])))), "+=", false)
		_S.set_prop(_S.read(_v22, "profile"), _S.read(_v22, "i"), _S.binary("*", _S.binary("+", _S.binary("*", _S.read(_v22, "I"), 0.6), _S.binary("*", 0.35, _S.invoke(_S.read(_v22, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.read(_v22, "q"), _S.read(_v22, "q")))]))), _S.call_value(_S.read(_v22, "smooth"), [1.25, 0.7, _S.invoke(_S.read(_v22, "Math"), "abs", [_S.read(_v22, "q")])])), "=", false)
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "i", 1, "+=", true)
	_S.define(_e, "front", _S.call_value(_S.read(_e, "lerp"), [_S.read(_e, "TOP"), 1, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), 0, _S.read(_e, "POUR")])])]))
	_S.define(_e, "w0", _S.binary("*", _S.call_value(_S.read(_e, "halfW"), [0, _S.read(_e, "t")]), 1.3))
	_S.invoke(_S.read(_e, "p"), "each", [_S.binary("-", _S.unary("-", _S.read(_e, "w0")), 1), _S.read(_e, "TOP"), _S.binary("+", _S.read(_e, "w0"), 1), _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "front"), 0.5]), _S.function_value(_e, "_f12")])
	for _v26 in _S.array(_S.read(_e, "cores")):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "r", _v26)
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "sh", _S.binary("+", 0.75, _S.binary("*", 0.25, _S.invoke(_S.read(_v28, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v28, "t"), _S.prop(_S.read(_v28, "r"), "f")), _S.prop(_S.read(_v28, "r"), "ph"))]))))
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "y", _S.read(_v29, "TOP"))
		while _S.truth(_S.binary("<", _S.read(_v29, "y"), _S.invoke(_S.read(_v29, "Math"), "min", [_S.read(_v29, "front"), 0]))):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "pulse", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v30, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.read(_v30, "y"), 0.13), _S.binary("*", _S.read(_v30, "t"), 11)), _S.prop(_S.read(_v30, "r"), "ph"))]))))
			_S.invoke(_S.read(_v30, "p"), "dot", [_S.binary("*", _S.prop(_S.read(_v30, "r"), "o"), _S.call_value(_S.read(_v30, "halfW"), [_S.read(_v30, "y"), _S.read(_v30, "t")])), _S.read(_v30, "y"), (_S.read(_v30, "WHITE") if _S.truth(_S.binary(">", _S.read(_v30, "pulse"), 0.8)) else _S.prop(_S.read(_v30, "C"), 6)), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v30, "k"), _S.read(_v30, "sh")), _S.binary("+", 0.15, _S.binary("*", 0.55, _S.read(_v30, "pulse")))), _S.call_value(_S.read(_v30, "smooth"), [_S.read(_v30, "front"), _S.binary("-", _S.read(_v30, "front"), 10), _S.read(_v30, "y")]))])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "y", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POUR"), 0.05)), func(): return _S.binary(">", _S.read(_e, "front"), _S.binary("+", _S.read(_e, "TOP"), 14)))):
		var _v31 = _S.scope(_e)
		_S.define(_v31, "fy", _S.invoke(_S.read(_v31, "Math"), "min", [_S.read(_v31, "front"), 0]))
		_S.invoke(_S.read(_v31, "p"), "glow", [0, _S.read(_v31, "fy"), 14, _S.prop(_S.read(_v31, "C"), 5), _S.binary("*", 0.7, _S.read(_v31, "k"))])
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "dy", _S.unary("-", 6))
		while _S.truth(_S.binary("<=", _S.read(_v32, "dy"), 0)):
			_S.invoke(_S.read(_v32, "p"), "dot", [0, _S.binary("+", _S.read(_v32, "fy"), _S.read(_v32, "dy")), (_S.read(_v32, "WHITE") if _S.truth(_S.binary(">", _S.read(_v32, "dy"), _S.unary("-", 3))) else _S.prop(_S.read(_v32, "C"), 6)), _S.binary("+", 1, _S.binary("/", _S.read(_v32, "dy"), 7))])
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "dy", 1, "+=", true)
	for _v33 in _S.array(_S.read(_e, "motes")):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "m", _v33)
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "y", _S.binary("+", _S.read(_v35, "TOP"), _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v35, "m"), "y"), _S.unary("-", _S.read(_v35, "TOP"))), _S.binary("*", _S.read(_v35, "t"), _S.prop(_S.read(_v35, "m"), "v"))), _S.unary("-", _S.read(_v35, "TOP"))), _S.unary("-", _S.read(_v35, "TOP"))), _S.unary("-", _S.read(_v35, "TOP")))))
		if _S.truth(_S.binary(">", _S.read(_v35, "y"), _S.read(_v35, "front"))):
			continue
		_S.define(_v35, "w", _S.call_value(_S.read(_v35, "halfW"), [_S.read(_v35, "y"), _S.read(_v35, "t")]))
		_S.define(_v35, "x", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v35, "m"), "q"), _S.read(_v35, "w")), _S.binary("*", _S.invoke(_S.read(_v35, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v35, "t"), _S.prop(_S.read(_v35, "m"), "f")), _S.prop(_S.read(_v35, "m"), "ph"))]), _S.prop(_S.read(_v35, "m"), "amp"))))
		_S.define(_v35, "I", _S.binary("*", _S.prop(_S.read(_v35, "profile"), _S.binary("+", _S.invoke(_S.read(_v35, "Math"), "round", [_S.binary("*", _S.binary("/", _S.read(_v35, "x"), _S.read(_v35, "w")), 40)]), 60)), _S.read(_v35, "k")))
		if _S.truth(_S.binary("<", _S.read(_v35, "I"), 0.25)):
			continue
		_S.invoke(_S.read(_v35, "p"), "dot", [_S.read(_v35, "x"), _S.read(_v35, "y"), (_S.read(_v35, "WHITE") if _S.truth(_S.binary(">", _S.read(_v35, "I"), 0.75)) else (_S.prop(_S.read(_v35, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v35, "I"), 0.5)) else _S.prop(_S.read(_v35, "C"), 5))), _S.invoke(_S.read(_v35, "Math"), "min", [1, _S.binary("*", _S.read(_v35, "I"), 1.4)])])
		_S.invoke(_S.read(_v35, "p"), "light", [_S.read(_v35, "x"), _S.read(_v35, "y"), _S.prop(_S.read(_v35, "C"), 5), _S.binary("*", _S.read(_v35, "I"), 0.5)])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.arg(_args, 2))
	_S.define(_e, "sy", _S.arg(_args, 3))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "halfW"), [_S.read(_e, "y"), _S.read(_e, "t")]))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "w")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "q"), _S.unary("-", 1.5)), func(): return _S.binary(">", _S.read(_e, "q"), 1.5))):
		return null
	_S.define(_e, "I", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "profile"), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "q"), 40)]), 60)), _S.read(_e, "k")), _S.binary("+", 0.75, _S.binary("*", 0.25, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "TOP"), 0, _S.read(_e, "y")])))), _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "front"), _S.binary("-", _S.read(_e, "front"), 10), _S.read(_e, "y")])))
	if _S.truth(_S.binary("<=", _S.read(_e, "I"), 0.01)):
		return null
	_S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.prop(_S.read(_e, "C"), 6), _S.binary("*", _S.read(_e, "I"), 0.24)])
	_S.invoke(_S.read(_e, "p"), "add", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.read(_e, "I"), 0.3)])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "back", _S.arg(_args, 1))
	_S.define(_e, "k", _S.binary("*", _S.call_value(_S.read(_e, "shaftK"), [_S.read(_e, "t")]), _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "POUR"), 0.05), _S.binary("+", _S.read(_e, "POUR"), 0.1), _S.read(_e, "t")])))
	_S.define(_e, "w", _S.binary("*", _S.call_value(_S.read(_e, "halfW"), [0, _S.read(_e, "t")]), 1.25))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0)):
		return null
	if _S.truth(_S.read(_e, "back")):
		var _v36 = _S.scope(_e)
		_S.invoke(_S.read(_v36, "p"), "glow", [0, _S.unary("-", 2), _S.binary("*", _S.read(_v36, "w"), 1.6), _S.prop(_S.read(_v36, "C"), 4), _S.binary("*", 0.3, _S.read(_v36, "k"))])
		return null
	var _v37 = _S.scope(_e)
	_S.define(_v37, "y", 0)
	while _S.truth(_S.binary("<=", _S.read(_v37, "y"), 3)):
		var _v38 = _S.scope(_v37)
		_S.define(_v38, "x", _S.invoke(_S.read(_v38, "Math"), "floor", [_S.unary("-", _S.read(_v38, "w"))]))
		while _S.truth(_S.binary("<=", _S.read(_v38, "x"), _S.read(_v38, "w"))):
			var _v39 = _S.scope(_v38)
			_S.define(_v39, "u", _S.invoke(_S.read(_v39, "Math"), "hypot", [_S.binary("/", _S.read(_v39, "x"), _S.read(_v39, "w")), _S.binary("/", _S.read(_v39, "y"), 4)]))
			if _S.truth(_S.binary(">=", _S.read(_v39, "u"), 1)):
				_v38 = _S.iteration(_v38)
				_S.write(_v38, "x", 1, "+=", true)
				continue
			_S.define(_v39, "a", _S.binary("*", _S.read(_v39, "k"), (_S.binary("*", _S.invoke(_S.read(_v39, "Math"), "sqrt", [_S.binary("-", 1, _S.read(_v39, "u"))]), 1.2) if _S.truth(_S.binary("===", _S.read(_v39, "y"), 0)) else _S.binary("*", _S.binary("-", 1, _S.read(_v39, "u")), 0.9))))
			_S.invoke(_S.read(_v39, "p"), "dot", [_S.read(_v39, "x"), _S.read(_v39, "y"), ((_S.prop(_S.read(_v39, "C"), 5) if _S.truth(_S.read(_v39, "y")) else _S.read(_v39, "WHITE")) if _S.truth(_S.binary("<", _S.read(_v39, "u"), 0.3)) else (_S.prop(_S.read(_v39, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v39, "u"), 0.6)) else (_S.prop(_S.read(_v39, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v39, "u"), 0.85)) else _S.prop(_S.read(_v39, "C"), 3)))), _S.read(_v39, "a")])
			_v38 = _S.iteration(_v38)
			_S.write(_v38, "x", 1, "+=", true)
		_v37 = _S.iteration(_v37)
		_S.write(_v37, "y", 1, "+=", true)
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "form", _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "H0"), _S.read(_e, "H1")])]))
	_S.define(_e, "k", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [3.35, 3.9, _S.read(_e, "t")])))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "form"), 0), func(): return _S.binary("<=", _S.read(_e, "k"), 0))):
		return null
	_S.define(_e, "white", _S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "H1")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "H1"), 0.06))))
	_S.define(_e, "gl", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "H1")), 4.2), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)))
	_S.define(_e, "n", 96)
	var _v40 = _S.scope(_e)
	_S.define(_v40, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v40, "j"), _S.read(_v40, "n"))):
		var _v41 = _S.scope(_v40)
		_S.define(_v41, "g", _S.binary("*", _S.binary("/", _S.read(_v41, "j"), _S.read(_v41, "n")), _S.read(_v41, "TAU")))
		_S.define(_v41, "fromFront", _S.invoke(_S.read(_v41, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("+", _S.binary("-", _S.read(_v41, "g"), _S.binary("/", _S.prop(_S.read(_v41, "Math"), "PI"), 2)), _S.prop(_S.read(_v41, "Math"), "PI")), _S.read(_v41, "TAU")), _S.read(_v41, "TAU")), _S.read(_v41, "TAU")), _S.prop(_S.read(_v41, "Math"), "PI"))]))
		if _S.truth(_S.binary(">", _S.read(_v41, "fromFront"), _S.binary("+", _S.binary("*", _S.read(_v41, "form"), _S.prop(_S.read(_v41, "Math"), "PI")), 0.02))):
			_v40 = _S.iteration(_v40)
			_S.write(_v40, "j", 1, "+=", true)
			continue
		_S.define(_v41, "x", _S.binary("+", _S.read(_v41, "HX"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v41, "Math"), "cos", [_S.read(_v41, "g")]), _S.read(_v41, "HRX")), _S.binary("+", 0.9, _S.binary("*", 0.1, _S.read(_v41, "form"))))))
		_S.define(_v41, "y", _S.binary("+", _S.read(_v41, "HY"), _S.binary("*", _S.invoke(_S.read(_v41, "Math"), "sin", [_S.read(_v41, "g")]), _S.read(_v41, "HRY"))))
		_S.define(_v41, "near", _S.binary(">=", _S.invoke(_S.read(_v41, "Math"), "sin", [_S.read(_v41, "g")]), 0))
		_S.define(_v41, "dg", _S.invoke(_S.read(_v41, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("+", _S.binary("-", _S.read(_v41, "g"), _S.read(_v41, "gl")), _S.prop(_S.read(_v41, "Math"), "PI")), _S.read(_v41, "TAU")), _S.read(_v41, "TAU")), _S.read(_v41, "TAU")), _S.prop(_S.read(_v41, "Math"), "PI"))]))
		_S.define(_v41, "hot", _S.logical("||", _S.logical("||", _S.read(_v41, "white"), func(): return _S.binary("<", _S.read(_v41, "dg"), 0.22)), func(): return _S.binary(">", _S.read(_v41, "fromFront"), _S.binary("-", _S.binary("*", _S.read(_v41, "form"), _S.prop(_S.read(_v41, "Math"), "PI")), 0.3))))
		if _S.truth(_S.read(_v41, "near")):
			var _v42 = _S.scope(_v41)
			_S.invoke(_S.read(_v42, "p"), "dot", [_S.read(_v42, "x"), _S.read(_v42, "y"), (_S.read(_v42, "WHITE") if _S.truth(_S.read(_v42, "hot")) else _S.prop(_S.read(_v42, "C"), 6)), _S.read(_v42, "k")])
			_S.invoke(_S.read(_v42, "p"), "dot", [_S.read(_v42, "x"), _S.binary("+", _S.read(_v42, "y"), 1), (_S.prop(_S.read(_v42, "C"), 6) if _S.truth(_S.read(_v42, "hot")) else _S.prop(_S.read(_v42, "C"), 4)), _S.read(_v42, "k")])
		else:
			_S.invoke(_S.read(_v41, "p"), "dot", [_S.read(_v41, "x"), _S.read(_v41, "y"), (_S.prop(_S.read(_v41, "C"), 6) if _S.truth(_S.read(_v41, "hot")) else _S.prop(_S.read(_v41, "C"), 5)), _S.binary("*", _S.read(_v41, "k"), 0.9)])
		_v40 = _S.iteration(_v40)
		_S.write(_v40, "j", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "HX"), _S.read(_e, "HY"), 20, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.binary("*", 0.4, _S.read(_e, "k")), _S.read(_e, "form"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "HX"), _S.binary("+", _S.read(_e, "HY"), 1), 9, _S.read(_e, "WHITE"), _S.binary("*", _S.binary("*", 0.2, _S.read(_e, "k")), _S.read(_e, "form"))])
	_S.define(_e, "gx", _S.binary("+", _S.read(_e, "HX"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "gl")]), _S.read(_e, "HRX"))))
	_S.define(_e, "gy", _S.binary("+", _S.read(_e, "HY"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "gl")]), _S.read(_e, "HRY"))))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "H1")), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "gl")]), 0.2))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "gx"), _S.binary("+", _S.read(_e, "gy"), 0.5), _S.binary("+", 2, _S.binary("*", 2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "gl")]))), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.35, _S.read(_e, "k"))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "H1")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "H1"), 0.3)))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "HX"), _S.binary("+", _S.binary("+", _S.read(_e, "HY"), _S.read(_e, "HRY")), 0.5), _S.binary("*", 7, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "H1")), 0.3))), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), 0.6])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CL1"), 0.6))):
		return null
	_S.define(_e, "Ly", _S.call_value(_S.read(_e, "climbY"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CL1"))):
		var _v43 = _S.scope(_e)
		_S.call_value(_S.read(_v43, "recolor"), [_S.read(_v43, "p"), _S.read(_v43, "A"), _S.function_value(_v43, "_f16")])
		for _v44 in _S.array(_S.prop(_S.read(_v43, "S"), "out")):
			var _v45 = _S.scope(_v43)
			var _v46 = _v44
			_S.define(_v45, "x", _S.prop(_v46, 0))
			_S.define(_v45, "y", _S.prop(_v46, 1))
			var _v47 = _S.scope(_v45)
			_S.define(_v47, "d", _S.binary("-", _S.read(_v47, "y"), _S.read(_v47, "Ly")))
			if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v47, "d"), _S.unary("-", 0.5)), func(): return _S.binary(">", _S.read(_v47, "d"), 12))):
				continue
			_S.invoke(_S.read(_v47, "p"), "dot", [_S.read(_v47, "x"), _S.read(_v47, "y"), (_S.read(_v47, "WHITE") if _S.truth(_S.binary("<", _S.read(_v47, "d"), 1)) else (_S.prop(_S.read(_v47, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v47, "d"), 5)) else _S.prop(_S.read(_v47, "C"), 4))), (1 if _S.truth(_S.binary("<", _S.read(_v47, "d"), 1)) else _S.binary("-", 1.1, _S.binary("/", _S.read(_v47, "d"), 12)))])
		if _S.truth(_S.binary(">", _S.read(_v43, "t"), _S.read(_v43, "CL0"))):
			var _v48 = _S.scope(_v43)
			_S.invoke(_S.read(_v48, "p"), "glow", [0, _S.read(_v48, "Ly"), 26, _S.prop(_S.read(_v48, "C"), 4), 0.5])
			_S.invoke(_S.read(_v48, "p"), "glow", [0, _S.read(_v48, "Ly"), 8, _S.read(_v48, "WHITE"), 0.3])
			_S.invoke(_S.read(_v48, "p"), "glow", [0, _S.unary("-", 18), 36, _S.prop(_S.read(_v48, "C"), 5), _S.binary("*", 0.16, _S.call_value(_S.read(_v48, "seg"), [_S.read(_v48, "t"), _S.read(_v48, "CL0"), _S.read(_v48, "CL1")]))])
		return null
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CL1")))
	_S.call_value(_S.read(_e, "recolor"), [_S.read(_e, "p"), _S.read(_e, "A"), _S.function_value(_e, "_f17")])
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.25)):
		for _v49 in _S.array(_S.prop(_S.read(_e, "S"), "out")):
			var _v50 = _S.scope(_e)
			var _v51 = _v49
			_S.define(_v50, "x", _S.prop(_v51, 0))
			_S.define(_v50, "y", _S.prop(_v51, 1))
			_S.invoke(_S.read(_v50, "p"), "dot", [_S.read(_v50, "x"), _S.read(_v50, "y"), (_S.read(_v50, "WHITE") if _S.truth(_S.binary("<", _S.read(_v50, "u"), 0.08)) else _S.prop(_S.read(_v50, "C"), 5)), _S.binary("-", 1, _S.binary("/", _S.read(_v50, "u"), 0.25))])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "d", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "Ly")))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), _S.unary("-", 0.5))):
		return _S.call_value(_S.read(_e, "toneOf"), [_S.read(_e, "AS"), _S.read(_e, "c")])
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.5)):
		return _S.read(_e, "WHITE")
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 1.5)):
		return _S.prop(_S.read(_e, "C"), 6)
	_S.define(_e, "k", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("-", _S.read(_e, "d"), 1.5)), 4)]), 0.7))
	return (_S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.prop(_S.read(_e, "C"), 5), _S.read(_e, "k")]) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.08)) else 0)

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.06)) else (_S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.55, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.read(_e, "u"), 0.45)), 2]))]) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.45)) else 0))

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"o": _S.binary("+", _S.binary("+", _S.unary("-", 0.75), _S.binary("*", _S.read(_e, "i"), 0.3)), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.08), 0.08]))}, {"w": _S.invoke(_S.read(_e, "R"), "range", [0.1, 0.2])}, {"b": _S.invoke(_S.read(_e, "R"), "range", [0.55, 1])}, {"f": _S.invoke(_S.read(_e, "R"), "range", [1.5, 3.5])}, {"ph": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}])

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "b"), "b"), _S.prop(_S.read(_e, "a"), "b"))

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.merge([{"q": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1])}, {"y": _S.invoke(_S.read(_e, "R"), "range", [0, 1])}, {"v": _S.invoke(_S.read(_e, "R"), "range", [4, 11])}, {"amp": _S.invoke(_S.read(_e, "R"), "range", [0.6, 2.4])}, {"ph": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}, {"f": _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.4])}])

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v55 = _S.arg(_args, 0)
	_S.define(_e, "s", _S.prop(_v55, 0))
	_S.define(_e, "ang", _S.prop(_v55, 1))
	_S.define(_e, "len", _S.prop(_v55, 2))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "along"), [_S.read(_e, "ARM_OPEN"), _S.read(_e, "s")]))
	return _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("+", _S.prop(_S.read(_e, "b"), 0), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]), _S.read(_e, "len"))), _S.binary("+", _S.prop(_S.read(_e, "b"), 1), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]), _S.read(_e, "len")))])

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v56 = _S.arg(_args, 0)
	_S.define(_e, "s", _S.prop(_v56, 0))
	_S.define(_e, "ang", _S.prop(_v56, 1))
	_S.define(_e, "len", _S.prop(_v56, 2))
	_S.define(_e, "wid", _S.prop(_v56, 3))
	_S.define(_e, "kind", _S.prop(_v56, 4))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "off", _S.function_value(_e, "_f24"))
	return _S.merge([{"s": _S.read(_e, "s")}, {"ang": _S.read(_e, "ang")}, {"len": _S.read(_e, "len")}, {"wid": _S.read(_e, "wid")}, {"kind": _S.read(_e, "kind")}, {"fold": _S.binary("+", 1.45, _S.binary("*", _S.binary("%", _S.read(_e, "i"), 6), 0.04))}, {"open": (_S.binary("+", 0.06, _S.binary("*", _S.binary("-", _S.read(_e, "s"), 0.8), 0.45)) if _S.truth(_S.binary("===", _S.read(_e, "kind"), 0)) else (_S.binary("*", _S.read(_e, "s"), 0.06) if _S.truth(_S.binary("===", _S.read(_e, "kind"), 1)) else _S.binary("+", 0.03, _S.binary("*", _S.read(_e, "s"), 0.05))))}, {"off": [_S.call_value(_S.read(_e, "off"), []), _S.call_value(_S.read(_e, "off"), [])]}, {"gone": [false, false]}])

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("+", _S.binary("+", _S.read(_e, "SC"), _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_e, "reach"), _S.read(_e, "i")), _S.read(_e, "far"))), 0.2)), _S.invoke(_S.read(_e, "R"), "range", [0, 0.04]))

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "lerp"), [1, _S.binary("-", _S.prop(_S.read(_e, "S"), "top"), 2), _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), _S.read(_e, "CL0"), _S.read(_e, "CL1")])])])

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, 0.12, _S.read(_e, "tt")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [3, 3.75, _S.read(_e, "tt")])))

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("*", _S.call_value(_S.read(_e, "lerp"), [0.4, 1, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), 0, 0.6])])]), _S.call_value(_S.read(_e, "lerp"), [1, 0.12, _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "tt"), 2.9, 3.6])])]))

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	return _S.binary("*", _S.call_value(_S.read(_e, "lerp"), [8, 25, _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "TOP")), _S.unary("-", _S.read(_e, "TOP")))]), _S.call_value(_S.read(_e, "shaftW"), [_S.read(_e, "tt")]))

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.05), func(): return _S.binary("<", _S.read(_e, "t"), 2.9)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.16]))):
		var _v57 = _S.scope(_e)
		_S.define(_v57, "q", _S.invoke(_S.read(_v57, "R"), "range", [_S.unary("-", 0.9), 0.9]))
		_S.define(_v57, "y", _S.binary("+", _S.read(_v57, "TOP"), _S.invoke(_S.read(_v57, "R"), "range", [8, 24])))
		_S.define(_v57, "v0", _S.invoke(_S.read(_v57, "R"), "range", [50, 90]))
		_S.define(_v57, "life", _S.binary("/", _S.invoke(_S.read(_v57, "Math"), "log", [_S.binary("+", 1, _S.binary("/", _S.binary("*", 3, _S.binary("-", _S.unary("-", _S.read(_v57, "y")), 2)), _S.read(_v57, "v0")))]), 3))
		_S.invoke(_S.read(_v57, "ps"), "spawn", [_S.prop(_S.read(_v57, "P"), "STREAK"), _S.binary("*", _S.read(_v57, "q"), _S.call_value(_S.read(_v57, "halfW"), [_S.read(_v57, "y"), _S.read(_v57, "t")])), _S.read(_v57, "y"), _S.binary("*", _S.read(_v57, "q"), 2), _S.read(_v57, "v0"), _S.read(_v57, "life"), (_S.prop(_S.read(_v57, "C"), 6) if _S.truth(_S.invoke(_S.read(_v57, "R"), "chance", [0.5])) else _S.prop(_S.read(_v57, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.3), func(): return _S.binary("<", _S.read(_e, "t"), 2.8)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.05]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1]), _S.call_value(_S.read(_e, "halfW"), [_S.unary("-", 30), _S.read(_e, "t")])), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [4, 90])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 3), 3]), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 4), 6]), _S.invoke(_S.read(_e, "R"), "range", [0.4, 0.8]), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])) else _S.read(_e, "WHITE")), _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.8])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "poured")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POUR")))):
		var _v58 = _S.scope(_e)
		_S.write(_v58, "poured", true, "=", false)
		_S.invoke(_S.read(_v58, "lights"), "add", [0, _S.unary("-", 12), 42, _S.prop(_S.read(_v58, "C"), 5), 0.9, 0.4])
		_S.invoke(_S.read(_v58, "lights"), "add", [0, _S.unary("-", 6), 16, _S.read(_v58, "WHITE"), 0.6, 0.1])
		var _v59 = _S.scope(_v58)
		_S.define(_v59, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v59, "i"), 14)):
			_S.invoke(_S.read(_v59, "ps"), "spawn", [_S.prop(_S.read(_v59, "P"), "STAR"), _S.invoke(_S.read(_v59, "R"), "range", [_S.unary("-", 18), 18]), _S.unary("-", _S.invoke(_S.read(_v59, "R"), "range", [0, 6])), _S.invoke(_S.read(_v59, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v59, "R"), "range", [10, 50])), _S.invoke(_S.read(_v59, "R"), "range", [0.5, 1.1]), (_S.read(_v59, "WHITE") if _S.truth(_S.invoke(_S.read(_v59, "R"), "chance", [0.5])) else _S.prop(_S.read(_v59, "C"), 6)), _S.invoke(_S.read(_v59, "R"), "range", [0.6, 2.2])])
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "i", 1, "+=", true)
		var _v60 = _S.scope(_v58)
		_S.define(_v60, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v60, "i"), 10)):
			var _v61 = _S.scope(_v60)
			_S.define(_v61, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v61, "Math"), "PI")), 2), _S.invoke(_S.read(_v61, "R"), "range", [_S.unary("-", 1.2), 1.2])))
			_S.define(_v61, "sp", _S.invoke(_S.read(_v61, "R"), "range", [60, 150]))
			_S.invoke(_S.read(_v61, "ps"), "spawn", [_S.prop(_S.read(_v61, "P"), "SPARK"), _S.invoke(_S.read(_v61, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v61, "Math"), "cos", [_S.read(_v61, "a")]), _S.read(_v61, "sp")), _S.binary("*", _S.invoke(_S.read(_v61, "Math"), "sin", [_S.read(_v61, "a")]), _S.read(_v61, "sp")), _S.invoke(_S.read(_v61, "R"), "range", [0.25, 0.5])])
			_v60 = _S.iteration(_v60)
			_S.write(_v60, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "CL0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "CL1")))):
		var _v62 = _S.scope(_e)
		_S.define(_v62, "Ly", _S.invoke(_S.read(_v62, "Math"), "round", [_S.call_value(_S.read(_v62, "climbY"), [_S.read(_v62, "t")])]))
		for _v63 in _S.array([_S.read(_v62, "Ly"), _S.binary("+", _S.read(_v62, "Ly"), 1)]):
			var _v64 = _S.scope(_v62)
			_S.define(_v64, "y", _v63)
			var _v65 = _S.scope(_v64)
			_S.define(_v65, "xs", _S.invoke(_S.read(_v65, "rows"), "get", [_S.read(_v65, "y")]))
			if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v65, "xs")), func(): return _S.unary("!", _S.invoke(_S.read(_v65, "R"), "chance", [0.35])))):
				continue
			_S.define(_v65, "x", _S.invoke(_S.read(_v65, "R"), "pick", [_S.read(_v65, "xs")]))
			_S.define(_v65, "s", _S.invoke(_S.read(_v65, "Math"), "sign", [_S.binary("+", _S.read(_v65, "x"), 0.5)]))
			_S.invoke(_S.read(_v65, "ps"), "spawn", [(_S.prop(_S.read(_v65, "P"), "MOTE") if _S.truth(_S.invoke(_S.read(_v65, "R"), "chance", [0.6])) else _S.prop(_S.read(_v65, "P"), "STAR")), _S.binary("+", _S.read(_v65, "x"), _S.read(_v65, "s")), _S.read(_v65, "y"), _S.binary("*", _S.read(_v65, "s"), _S.invoke(_S.read(_v65, "R"), "range", [8, 30])), _S.unary("-", _S.invoke(_S.read(_v65, "R"), "range", [15, 45])), _S.invoke(_S.read(_v65, "R"), "range", [0.35, 0.7]), (_S.prop(_S.read(_v65, "C"), 6) if _S.truth(_S.invoke(_S.read(_v65, "R"), "chance", [0.5])) else _S.prop(_S.read(_v65, "C"), 5)), _S.invoke(_S.read(_v65, "R"), "range", [0.5, 1.1])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "flashed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CL1")))):
		var _v66 = _S.scope(_e)
		_S.write(_v66, "flashed", true, "=", false)
		_S.invoke(_S.read(_v66, "lights"), "add", [0, _S.unary("-", 24), 64, _S.prop(_S.read(_v66, "C"), 5), 0.7, 0.5])
		_S.invoke(_S.read(_v66, "lights"), "add", [0, _S.unary("-", 30), 28, _S.read(_v66, "WHITE"), 0.7, 0.1])
		var _v67 = _S.scope(_v66)
		_S.define(_v67, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v67, "i"), 18)):
			var _v68 = _S.scope(_v67)
			_S.define(_v68, "a", _S.invoke(_S.read(_v68, "R"), "range", [0, _S.read(_v68, "TAU")]))
			_S.define(_v68, "sp", _S.invoke(_S.read(_v68, "R"), "range", [30, 110]))
			_S.invoke(_S.read(_v68, "ps"), "spawn", [_S.prop(_S.read(_v68, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v68, "Math"), "cos", [_S.read(_v68, "a")]), 6), _S.binary("+", _S.unary("-", 24), _S.binary("*", _S.invoke(_S.read(_v68, "Math"), "sin", [_S.read(_v68, "a")]), 12)), _S.binary("*", _S.invoke(_S.read(_v68, "Math"), "cos", [_S.read(_v68, "a")]), _S.read(_v68, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v68, "Math"), "sin", [_S.read(_v68, "a")]), _S.read(_v68, "sp")), 0.7), 20), _S.invoke(_S.read(_v68, "R"), "range", [0.4, 0.9]), (_S.read(_v68, "WHITE") if _S.truth(_S.invoke(_S.read(_v68, "R"), "chance", [0.5])) else _S.prop(_S.read(_v68, "C"), 6)), _S.invoke(_S.read(_v68, "R"), "range", [0.6, 2])])
			_v67 = _S.iteration(_v67)
			_S.write(_v67, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "H0"), 0.2)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "H0"), 0.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.6]))):
		var _v69 = _S.scope(_e)
		_S.define(_v69, "g", _S.invoke(_S.read(_v69, "R"), "range", [0, _S.read(_v69, "TAU")]))
		_S.define(_v69, "D", _S.invoke(_S.read(_v69, "R"), "range", [14, 24]))
		_S.define(_v69, "x", _S.binary("+", _S.read(_v69, "HX"), _S.binary("*", _S.invoke(_S.read(_v69, "Math"), "cos", [_S.read(_v69, "g")]), _S.read(_v69, "D"))))
		_S.define(_v69, "y", _S.binary("+", _S.read(_v69, "HY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v69, "Math"), "sin", [_S.read(_v69, "g")]), _S.read(_v69, "D")), 0.5)))
		_S.define(_v69, "tx", _S.binary("+", _S.read(_v69, "HX"), _S.binary("*", _S.invoke(_S.read(_v69, "Math"), "cos", [_S.binary("+", _S.read(_v69, "g"), 0.6)]), _S.read(_v69, "HRX"))))
		_S.define(_v69, "ty", _S.binary("+", _S.read(_v69, "HY"), _S.binary("*", _S.invoke(_S.read(_v69, "Math"), "sin", [_S.binary("+", _S.read(_v69, "g"), 0.6)]), _S.read(_v69, "HRY"))))
		_S.define(_v69, "T", _S.invoke(_S.read(_v69, "R"), "range", [0.16, 0.24]))
		_S.define(_v69, "l", _S.logical("||", _S.invoke(_S.read(_v69, "Math"), "hypot", [_S.binary("-", _S.read(_v69, "tx"), _S.read(_v69, "x")), _S.binary("-", _S.read(_v69, "ty"), _S.read(_v69, "y"))]), func(): return 1))
		_S.define(_v69, "v", _S.binary("/", _S.binary("*", _S.read(_v69, "l"), 3), _S.binary("-", _S.invoke(_S.read(_v69, "Math"), "exp", [_S.binary("*", 3, _S.read(_v69, "T"))]), 1)))
		_S.invoke(_S.read(_v69, "ps"), "spawn", [_S.prop(_S.read(_v69, "P"), "STREAK"), _S.read(_v69, "x"), _S.read(_v69, "y"), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v69, "tx"), _S.read(_v69, "x")), _S.read(_v69, "l")), _S.read(_v69, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v69, "ty"), _S.read(_v69, "y")), _S.read(_v69, "l")), _S.read(_v69, "v")), _S.read(_v69, "T"), (_S.prop(_S.read(_v69, "C"), 6) if _S.truth(_S.invoke(_S.read(_v69, "R"), "chance", [0.5])) else _S.prop(_S.read(_v69, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "formed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "H1")))):
		var _v70 = _S.scope(_e)
		_S.write(_v70, "formed", true, "=", false)
		_S.invoke(_S.read(_v70, "lights"), "add", [_S.read(_v70, "HX"), _S.read(_v70, "HY"), 30, _S.prop(_S.read(_v70, "C"), 6), 0.8, 0.3])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "W0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "W0"), 0.35))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		for _v71 in _S.array([_S.unary("-", 1), 1]):
			var _v72 = _S.scope(_e)
			_S.define(_v72, "side", _v71)
			var _v73 = _S.scope(_v72)
			_S.define(_v73, "f", _S.invoke(_S.read(_v73, "R"), "pick", [_S.prop(_S.call_value(_S.read(_v73, "wing"), [_S.read(_v73, "t"), _S.read(_v73, "side")]), "out")]))
			if _S.truth(_S.read(_v73, "f")):
				_S.invoke(_S.read(_v73, "ps"), "spawn", [_S.prop(_S.read(_v73, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v73, "f"), "x"), _S.binary("*", _S.invoke(_S.read(_v73, "Math"), "cos", [_S.prop(_S.read(_v73, "f"), "ang")]), _S.prop(_S.read(_v73, "f"), "len"))), _S.binary("+", _S.prop(_S.read(_v73, "f"), "y"), _S.binary("*", _S.invoke(_S.read(_v73, "Math"), "sin", [_S.prop(_S.read(_v73, "f"), "ang")]), _S.prop(_S.read(_v73, "f"), "len"))), _S.binary("*", _S.read(_v73, "side"), _S.invoke(_S.read(_v73, "R"), "range", [5, 25])), _S.unary("-", _S.invoke(_S.read(_v73, "R"), "range", [5, 25])), _S.invoke(_S.read(_v73, "R"), "range", [0.3, 0.6]), (_S.read(_v73, "WHITE") if _S.truth(_S.invoke(_S.read(_v73, "R"), "chance", [0.5])) else _S.prop(_S.read(_v73, "C"), 6)), _S.invoke(_S.read(_v73, "R"), "range", [0.6, 1.6])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "W0"), 0.45)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SC")))):
		for _v74 in _S.array([_S.unary("-", 1), 1]):
			var _v75 = _S.scope(_e)
			_S.define(_v75, "side", _v74)
			var _v76 = _S.scope(_v75)
			if _S.truth(_S.invoke(_S.read(_v76, "R"), "chance", [0.045])):
				var _v77 = _S.scope(_v76)
				_S.define(_v77, "f", _S.invoke(_S.read(_v77, "R"), "pick", [_S.invoke(_S.prop(_S.call_value(_S.read(_v77, "wing"), [_S.read(_v77, "t"), _S.read(_v77, "side")]), "out"), "filter", [_S.function_value(_v77, "_f30")])]))
				if _S.truth(_S.read(_v77, "f")):
					_S.invoke(_S.read(_v77, "ps"), "spawn", [_S.prop(_S.read(_v77, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v77, "f"), "x"), _S.binary("*", _S.invoke(_S.read(_v77, "Math"), "cos", [_S.prop(_S.read(_v77, "f"), "ang")]), _S.binary("-", _S.prop(_S.read(_v77, "f"), "len"), 2))), _S.binary("+", _S.prop(_S.read(_v77, "f"), "y"), _S.binary("*", _S.invoke(_S.read(_v77, "Math"), "sin", [_S.prop(_S.read(_v77, "f"), "ang")]), _S.binary("-", _S.prop(_S.read(_v77, "f"), "len"), 2))), 0, _S.unary("-", _S.invoke(_S.read(_v77, "R"), "range", [2, 8])), _S.invoke(_S.read(_v77, "R"), "range", [0.3, 0.6]), (_S.read(_v77, "WHITE") if _S.truth(_S.invoke(_S.read(_v77, "R"), "chance", [0.5])) else _S.prop(_S.read(_v77, "C"), 6)), _S.invoke(_S.read(_v77, "R"), "range", [1, 2.4])])
			if _S.truth(_S.invoke(_S.read(_v76, "R"), "chance", [0.03])):
				var _v78 = _S.scope(_v76)
				_S.define(_v78, "f", _S.invoke(_S.read(_v78, "R"), "pick", [_S.prop(_S.call_value(_S.read(_v78, "wing"), [_S.read(_v78, "t"), _S.read(_v78, "side")]), "out")]))
				if _S.truth(_S.read(_v78, "f")):
					_S.invoke(_S.read(_v78, "ps"), "spawn", [_S.prop(_S.read(_v78, "P"), "EMBER"), _S.binary("+", _S.prop(_S.read(_v78, "f"), "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v78, "Math"), "cos", [_S.prop(_S.read(_v78, "f"), "ang")]), _S.prop(_S.read(_v78, "f"), "len")), 0.7)), _S.binary("+", _S.prop(_S.read(_v78, "f"), "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v78, "Math"), "sin", [_S.prop(_S.read(_v78, "f"), "ang")]), _S.prop(_S.read(_v78, "f"), "len")), 0.7)), _S.invoke(_S.read(_v78, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v78, "R"), "range", [8, 25])), _S.invoke(_S.read(_v78, "R"), "range", [0.6, 1.1]), _S.prop(_S.read(_v78, "C"), 5)])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "beaten")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "B2"), 0.03)))):
		var _v79 = _S.scope(_e)
		_S.write(_v79, "beaten", true, "=", false)
		for _v80 in _S.array([_S.unary("-", 1), 1]):
			var _v81 = _S.scope(_v79)
			_S.define(_v81, "side", _v80)
			var _v82 = _S.scope(_v81)
			_S.invoke(_S.read(_v82, "lights"), "add", [_S.binary("*", _S.read(_v82, "side"), 30), _S.unary("-", 34), 46, _S.prop(_S.read(_v82, "C"), 5), 0.6, 0.4])
			var _v83 = _S.scope(_v82)
			_S.define(_v83, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v83, "i"), 7)):
				_S.invoke(_S.read(_v83, "ps"), "spawn", [_S.prop(_S.read(_v83, "P"), "MOTE"), _S.binary("*", _S.read(_v83, "side"), _S.invoke(_S.read(_v83, "R"), "range", [8, 22])), _S.unary("-", _S.invoke(_S.read(_v83, "R"), "range", [1, 4])), _S.binary("*", _S.read(_v83, "side"), _S.invoke(_S.read(_v83, "R"), "range", [90, 160])), _S.unary("-", _S.invoke(_S.read(_v83, "R"), "range", [0, 8])), _S.invoke(_S.read(_v83, "R"), "range", [0.25, 0.45]), (_S.prop(_S.read(_v83, "C"), 6) if _S.truth(_S.invoke(_S.read(_v83, "R"), "chance", [0.5])) else _S.prop(_S.read(_v83, "C"), 5)), _S.invoke(_S.read(_v83, "R"), "range", [0.6, 1])])
				_v83 = _S.iteration(_v83)
				_S.write(_v83, "i", 1, "+=", true)
			for _v84 in _S.array(_S.prop(_S.call_value(_S.read(_v82, "wing"), [_S.read(_v82, "t"), _S.read(_v82, "side")]), "out")):
				var _v85 = _S.scope(_v82)
				_S.define(_v85, "f", _v84)
				if _S.truth(_S.binary("===", _S.prop(_S.prop(_S.read(_v85, "f"), "q"), "kind"), 0)):
					var _v86 = _S.scope(_v85)
					_S.define(_v86, "tx", _S.binary("+", _S.prop(_S.read(_v86, "f"), "x"), _S.binary("*", _S.invoke(_S.read(_v86, "Math"), "cos", [_S.prop(_S.read(_v86, "f"), "ang")]), _S.prop(_S.read(_v86, "f"), "len"))))
					_S.define(_v86, "ty", _S.binary("+", _S.prop(_S.read(_v86, "f"), "y"), _S.binary("*", _S.invoke(_S.read(_v86, "Math"), "sin", [_S.prop(_S.read(_v86, "f"), "ang")]), _S.prop(_S.read(_v86, "f"), "len"))))
					_S.invoke(_S.read(_v86, "ps"), "spawn", [_S.prop(_S.read(_v86, "P"), "SPARK"), _S.read(_v86, "tx"), _S.read(_v86, "ty"), _S.binary("*", _S.read(_v86, "side"), _S.invoke(_S.read(_v86, "R"), "range", [30, 90])), _S.invoke(_S.read(_v86, "R"), "range", [60, 160]), _S.invoke(_S.read(_v86, "R"), "range", [0.3, 0.6])])
			var _v87 = _S.scope(_v82)
			_S.define(_v87, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v87, "i"), 3)):
				var _v88 = _S.scope(_v87)
				_S.define(_v88, "f", _S.invoke(_S.read(_v88, "R"), "pick", [_S.invoke(_S.prop(_S.call_value(_S.read(_v88, "wing"), [_S.read(_v88, "t"), _S.read(_v88, "side")]), "out"), "filter", [_S.function_value(_v88, "_f31")])]))
				if _S.truth(_S.read(_v88, "f")):
					_S.invoke(_S.read(_v88, "loose"), "add", [_S.merge([{"x": _S.binary("+", _S.prop(_S.read(_v88, "f"), "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v88, "Math"), "cos", [_S.prop(_S.read(_v88, "f"), "ang")]), _S.prop(_S.read(_v88, "f"), "len")), 0.6))}, {"y": _S.binary("+", _S.prop(_S.read(_v88, "f"), "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v88, "Math"), "sin", [_S.prop(_S.read(_v88, "f"), "ang")]), _S.prop(_S.read(_v88, "f"), "len")), 0.6))}, {"vx": _S.binary("*", _S.read(_v88, "side"), _S.invoke(_S.read(_v88, "R"), "range", [20, 70]))}, {"vy": _S.invoke(_S.read(_v88, "R"), "range", [10, 50])}, {"a": _S.prop(_S.read(_v88, "f"), "ang")}, {"len": _S.invoke(_S.read(_v88, "R"), "range", [9, 12])}, {"wid": _S.invoke(_S.read(_v88, "R"), "range", [2.2, 2.8])}, {"life": _S.invoke(_S.read(_v88, "R"), "range", [1.2, 1.6])}, {"side": _S.read(_v88, "side")}])])
				_v87 = _S.iteration(_v87)
				_S.write(_v87, "i", 1, "+=", true)
	for _v89 in _S.array([_S.unary("-", 1), 1]):
		var _v90 = _S.scope(_e)
		_S.define(_v90, "side", _v89)
		var _v91 = _S.scope(_v90)
		_S.define(_v91, "si", (0 if _S.truth(_S.binary(">", _S.read(_v91, "side"), 0)) else 1))
		for _v92 in _S.array(_S.read(_v91, "quills")):
			var _v93 = _S.scope(_v91)
			_S.define(_v93, "q", _v92)
			var _v94 = _S.scope(_v93)
			if _S.truth(_S.logical("||", _S.prop(_S.prop(_S.read(_v94, "q"), "gone"), _S.read(_v94, "si")), func(): return _S.binary("<", _S.read(_v94, "t"), _S.prop(_S.prop(_S.read(_v94, "q"), "off"), _S.read(_v94, "si"))))):
				continue
			_S.set_prop(_S.prop(_S.read(_v94, "q"), "gone"), _S.read(_v94, "si"), true, "=", false)
			_S.define(_v94, "f", _S.invoke(_S.prop(_S.call_value(_S.read(_v94, "wing"), [_S.binary("-", _S.prop(_S.prop(_S.read(_v94, "q"), "off"), _S.read(_v94, "si")), 0.001), _S.read(_v94, "side")]), "out"), "find", [_S.function_value(_v94, "_f32")]))
			if _S.truth(_S.unary("!", _S.read(_v94, "f"))):
				continue
			_S.define(_v94, "ca", _S.invoke(_S.read(_v94, "Math"), "cos", [_S.prop(_S.read(_v94, "f"), "ang")]))
			_S.define(_v94, "sa", _S.invoke(_S.read(_v94, "Math"), "sin", [_S.prop(_S.read(_v94, "f"), "ang")]))
			_S.define(_v94, "n", (0 if _S.truth(_S.binary("===", _S.prop(_S.read(_v94, "q"), "kind"), 2)) else 1))
			var _v95 = _S.scope(_v94)
			_S.define(_v95, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v95, "j"), _S.read(_v95, "n"))):
				var _v96 = _S.scope(_v95)
				_S.define(_v96, "u", 0.55)
				_S.define(_v96, "x", _S.binary("+", _S.prop(_S.read(_v96, "f"), "x"), _S.binary("*", _S.binary("*", _S.read(_v96, "ca"), _S.prop(_S.read(_v96, "f"), "len")), _S.read(_v96, "u"))))
				_S.define(_v96, "y", _S.binary("+", _S.prop(_S.read(_v96, "f"), "y"), _S.binary("*", _S.binary("*", _S.read(_v96, "sa"), _S.prop(_S.read(_v96, "f"), "len")), _S.read(_v96, "u"))))
				_S.define(_v96, "ox", _S.binary("-", _S.read(_v96, "x"), _S.binary("*", _S.read(_v96, "side"), 4)))
				_S.define(_v96, "oy", _S.binary("+", _S.read(_v96, "y"), 20))
				_S.define(_v96, "l", _S.logical("||", _S.invoke(_S.read(_v96, "Math"), "hypot", [_S.read(_v96, "ox"), _S.read(_v96, "oy")]), func(): return 1))
				_S.define(_v96, "sp", _S.invoke(_S.read(_v96, "R"), "range", [60, 150]))
				_S.invoke(_S.read(_v96, "loose"), "add", [_S.merge([{"x": _S.read(_v96, "x")}, {"y": _S.read(_v96, "y")}, {"vx": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v96, "ox"), _S.read(_v96, "l")), _S.read(_v96, "sp")), _S.invoke(_S.read(_v96, "R"), "range", [_S.unary("-", 15), 15]))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v96, "oy"), _S.read(_v96, "l")), _S.read(_v96, "sp")), 0.5), _S.invoke(_S.read(_v96, "R"), "range", [20, 50]))}, {"a": _S.binary("+", _S.prop(_S.read(_v96, "f"), "ang"), _S.invoke(_S.read(_v96, "R"), "range", [_S.unary("-", 0.4), 0.4]))}, {"len": _S.invoke(_S.read(_v96, "R"), "range", [9, 12])}, {"wid": _S.invoke(_S.read(_v96, "R"), "range", [2.2, 2.8])}, {"life": _S.invoke(_S.read(_v96, "R"), "range", [1, 1.45])}, {"side": _S.read(_v96, "side")}, {"back": _S.invoke(_S.read(_v96, "R"), "chance", [0.35])}])])
				_v95 = _S.iteration(_v95)
				_S.write(_v95, "j", 1, "+=", true)
			var _v97 = _S.scope(_v94)
			_S.define(_v97, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v97, "j"), 2)):
				_S.invoke(_S.read(_v97, "ps"), "spawn", [_S.prop(_S.read(_v97, "P"), "EMBER"), _S.binary("+", _S.prop(_S.read(_v97, "f"), "x"), _S.binary("*", _S.binary("*", _S.read(_v97, "ca"), _S.prop(_S.read(_v97, "f"), "len")), _S.invoke(_S.read(_v97, "R"), "range", [0.3, 1]))), _S.binary("+", _S.prop(_S.read(_v97, "f"), "y"), _S.binary("*", _S.binary("*", _S.read(_v97, "sa"), _S.prop(_S.read(_v97, "f"), "len")), _S.invoke(_S.read(_v97, "R"), "range", [0.3, 1]))), _S.invoke(_S.read(_v97, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v97, "R"), "range", [10, 40])), _S.invoke(_S.read(_v97, "R"), "range", [0.6, 1.1]), _S.prop(_S.read(_v97, "C"), 5)])
				_v97 = _S.iteration(_v97)
				_S.write(_v97, "j", 1, "+=", true)
			if _S.truth(_S.invoke(_S.read(_v94, "R"), "chance", [0.6])):
				_S.invoke(_S.read(_v94, "ps"), "spawn", [_S.prop(_S.read(_v94, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v94, "f"), "x"), _S.binary("*", _S.read(_v94, "ca"), _S.prop(_S.read(_v94, "f"), "len"))), _S.binary("+", _S.prop(_S.read(_v94, "f"), "y"), _S.binary("*", _S.read(_v94, "sa"), _S.prop(_S.read(_v94, "f"), "len"))), 0, _S.unary("-", _S.invoke(_S.read(_v94, "R"), "range", [5, 15])), _S.invoke(_S.read(_v94, "R"), "range", [0.3, 0.6]), _S.read(_v94, "WHITE"), _S.invoke(_S.read(_v94, "R"), "range", [1, 2])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 3.35), func(): return _S.binary("<", _S.read(_e, "t"), 3.75)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.4]))):
		var _v98 = _S.scope(_e)
		_S.define(_v98, "g", _S.invoke(_S.read(_v98, "R"), "range", [0, _S.read(_v98, "TAU")]))
		_S.invoke(_S.read(_v98, "ps"), "spawn", [_S.prop(_S.read(_v98, "P"), "EMBER"), _S.binary("+", _S.read(_v98, "HX"), _S.binary("*", _S.invoke(_S.read(_v98, "Math"), "cos", [_S.read(_v98, "g")]), _S.read(_v98, "HRX"))), _S.binary("+", _S.read(_v98, "HY"), _S.binary("*", _S.invoke(_S.read(_v98, "Math"), "sin", [_S.read(_v98, "g")]), _S.read(_v98, "HRY"))), _S.invoke(_S.read(_v98, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v98, "R"), "range", [10, 25])), _S.invoke(_S.read(_v98, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v98, "C"), 5)])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "loose"), "update", [_S.read(_e, "dt")])
	return null

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "w", _S.arg(_args, 0))
	return _S.binary("===", _S.prop(_S.prop(_S.read(_e, "w"), "q"), "kind"), 0)

static func _f31(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "w", _S.arg(_args, 0))
	return _S.binary("===", _S.prop(_S.prop(_S.read(_e, "w"), "q"), "kind"), 1)

static func _f32(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "w", _S.arg(_args, 0))
	return _S.binary("===", _S.prop(_S.read(_e, "w"), "q"), _S.read(_e, "q"))

static func _f33(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "shaft"), [_S.read(_e, "p")])
	_S.call_value(_S.read(_e, "pool"), [_S.read(_e, "p"), true])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "POUR")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POUR"), 0.4)))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 4, _S.binary("*", 32, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "POUR"), _S.binary("+", _S.read(_e, "POUR"), 0.4)])]))), 0.18, _S.binary("+", _S.binary("*", 2.5, _S.binary("-", 1, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "POUR"), _S.binary("+", _S.read(_e, "POUR"), 0.4)]))), 0.5), _S.binary("-", 1.1, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "POUR"), _S.binary("+", _S.read(_e, "POUR"), 0.4)])), _S.invoke(_S.read(_e, "C"), "slice", [3]), _S.read(_e, "FAR"), _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POUR"), 0.06))])
	for _v99 in _S.array([_S.unary("-", 1), 1]):
		var _v100 = _S.scope(_e)
		_S.define(_v100, "side", _v99)
		_S.call_value(_S.read(_v100, "drawWing"), [_S.read(_v100, "p"), _S.read(_v100, "side")])
	_S.invoke(_S.read(_e, "loose"), "draw", [_S.read(_e, "p"), _S.read(_e, "WING"), "back"])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f34(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "pool"), [_S.read(_e, "p"), false])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "POUR")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POUR"), 0.4)))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 4, _S.binary("*", 32, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "POUR"), _S.binary("+", _S.read(_e, "POUR"), 0.4)])]))), 0.18, _S.binary("+", _S.binary("*", 2.5, _S.binary("-", 1, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "POUR"), _S.binary("+", _S.read(_e, "POUR"), 0.4)]))), 0.5), _S.binary("-", 1.1, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "POUR"), _S.binary("+", _S.read(_e, "POUR"), 0.4)])), _S.invoke(_S.read(_e, "C"), "slice", [3]), _S.read(_e, "NEAR"), _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POUR"), 0.06))])
	_S.call_value(_S.read(_e, "body"), [_S.read(_e, "p")])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "B2"), 0.03)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "B2"), 0.45)))):
		var _v101 = _S.scope(_e)
		_S.define(_v101, "u", _S.call_value(_S.read(_v101, "seg"), [_S.read(_v101, "t"), _S.binary("-", _S.read(_v101, "B2"), 0.03), _S.binary("+", _S.read(_v101, "B2"), 0.45)]))
		_S.define(_v101, "fx", _S.binary("+", 10, _S.binary("*", 70, _S.invoke(_S.read(_v101, "ease"), "outCubic", [_S.read(_v101, "u")]))))
		for _v102 in _S.array([_S.unary("-", 1), 1]):
			var _v103 = _S.scope(_v101)
			_S.define(_v103, "s", _v102)
			var _v104 = _S.scope(_v103)
			_S.define(_v104, "d", 0)
			while _S.truth(_S.binary("<", _S.read(_v104, "d"), 12)):
				_S.invoke(_S.read(_v104, "p"), "dot", [_S.binary("*", _S.read(_v104, "s"), _S.binary("-", _S.read(_v104, "fx"), _S.read(_v104, "d"))), 0, (_S.read(_v104, "WHITE") if _S.truth(_S.binary("<", _S.read(_v104, "d"), 2)) else (_S.prop(_S.read(_v104, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v104, "d"), 5)) else _S.prop(_S.read(_v104, "C"), 4))), _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_v104, "u")), _S.binary("-", 1, _S.binary("/", _S.read(_v104, "d"), 12))), 1.3)])
				_v104 = _S.iteration(_v104)
				_S.write(_v104, "d", 1, "+=", true)
	_S.define(_e, "wk", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "W0"), _S.binary("+", _S.read(_e, "W0"), 0.2), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "SC"), _S.binary("+", _S.read(_e, "SC"), 0.3), _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "wk"), 0)):
		var _v105 = _S.scope(_e)
		for _v106 in _S.array(_S.prop(_S.read(_v105, "S"), "out")):
			var _v107 = _S.scope(_v105)
			var _v108 = _v106
			_S.define(_v107, "x", _S.prop(_v108, 0))
			_S.define(_v107, "y", _S.prop(_v108, 1))
			if _S.truth(_S.binary("<", _S.read(_v107, "y"), _S.unary("-", 8))):
				_S.invoke(_S.read(_v107, "p"), "light", [_S.read(_v107, "x"), _S.read(_v107, "y"), _S.prop(_S.read(_v107, "C"), 5), _S.binary("*", 0.55, _S.read(_v107, "wk"))])
		_S.invoke(_S.read(_v105, "p"), "glow", [0, _S.unary("-", 34), 76, _S.prop(_S.read(_v105, "C"), 4), _S.binary("*", 0.14, _S.read(_v105, "wk"))])
	_S.call_value(_S.read(_e, "halo"), [_S.read(_e, "p")])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CL1")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CL1"), 0.22)))):
		_S.call_value(_S.read(_e, "flare"), [_S.read(_e, "p"), 0, _S.binary("-", _S.prop(_S.read(_e, "S"), "top"), 1), _S.binary("*", 22, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CL1")), 0.22))), _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CL1")), 0.22)), _S.invoke(_S.read(_e, "C"), "slice", [3])])
	_S.invoke(_S.read(_e, "loose"), "draw", [_S.read(_e, "p"), _S.read(_e, "WING"), "front"])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
