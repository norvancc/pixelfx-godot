@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/frost-nova.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "crystal", _S.import_value("core/index.js", "crystal"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "frost", _S.function_value(_e, "_f0"))
	_S.define(_e, "snowflake", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Frost nova"}, {"desc": "Frost spirals into a spinning snowflake, then a wave blooms three rings of ice crystals round the caster; snow drifts, frost creeps, and the ice melts back into the floor."}, {"tags": ["ice", "nova", "aoe", "frost", "magic", "one-shot"]}, {"size": [288, 192]}, {"origin": [144, 150]}, {"duration": 3.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"reach": 104}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIGH", _S.merge([{"turn": 1.15}, {"crouch": 0}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 44)}, {"bx": 8}, {"by": _S.unary("-", 44)}, {"ffx": _S.unary("-", 5)}, {"fbx": 6}]))
	_S.define(_e, "SLAM", _S.merge([{"turn": 1.15}, {"crouch": 8}, {"lean": 3}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 8)}, {"bx": 11}, {"by": _S.unary("-", 8)}, {"ffx": _S.unary("-", 8)}, {"fbx": 9}]))
	_S.define(_e, "EASE", _S.merge([{"turn": 1}, {"crouch": 2}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 17)}, {"bx": 9}, {"by": _S.unary("-", 17)}, {"ffx": _S.unary("-", 4)}, {"fbx": 5}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 76}])}, {"poses": [[_S.unary("-", 0.34), _S.read(_e, "READY")], [_S.unary("-", 0.04), _S.merge([_S.read(_e, "HIGH"), {"crouch": 2}, {"fy": _S.unary("-", 36)}, {"by": _S.unary("-", 36)}])], [0.36, _S.read(_e, "HIGH")], [0.42, _S.read(_e, "SLAM"), "snap"], [0.9, _S.merge([_S.read(_e, "SLAM"), {"crouch": 7}])], [1.9, _S.merge([_S.read(_e, "SLAM"), {"crouch": 6}])], [2.6, _S.read(_e, "EASE")], [3.4, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": 0.42}, {"stop": 0.1}, {"shake": 0.26}, {"amp": 2}, {"target": false}]), _S.merge([{"t": 0.66}, {"push": 0.9}, {"straw": 6}, {"y": _S.unary("-", 10)}, {"skin": "ice"}, {"shiver": 1.7}]), _S.merge([{"t": 2.9}, {"push": 0.2}, {"straw": 0}, {"flash": 0}, {"skin": null}])]}, {"dust": [_S.merge([{"t": 0.42}, {"x": 10}, {"n": 5}, {"dir": 1}, {"c": "#d8f2ff"}]), _S.merge([{"t": 0.42}, {"x": _S.unary("-", 10)}, {"n": 5}, {"dir": _S.unary("-", 1)}, {"c": "#d8f2ff"}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "CHARGE", 0.42)
	_S.define(_e, "SPREAD", 0.62)
	_S.define(_e, "HOLD", 1.95)
	_S.define(_e, "MELT", 0.7)
	_S.define(_e, "CORE_Y", _S.unary("-", 24))
	_S.define(_e, "RINGS", [_S.merge([{"q": [0.15, 0.24]}, {"h": [24, 32]}, {"w": [10, 13]}, {"n": 2}, {"kids": 2}]), _S.merge([{"q": [0.36, 0.52]}, {"h": [13, 19]}, {"w": [7, 9]}, {"n": 3}, {"kids": 1}]), _S.merge([{"q": [0.62, 0.9]}, {"h": [5, 10]}, {"w": [4, 6]}, {"n": 4}, {"kids": 0}])])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "x0", _S.arg(_args, 2))
	_S.define(_e, "x1", _S.arg(_args, 3))
	_S.define(_e, "reach", _S.arg(_args, 4))
	_S.define(_e, "a", _S.arg(_args, 5))
	_S.define(_e, "edge", _S.arg(_args, 6))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "x", _S.invoke(_S.read(_v0, "Math"), "floor", [_S.read(_v0, "x0")]))
	while _S.truth(_S.binary("<=", _S.read(_v0, "x"), _S.invoke(_S.read(_v0, "Math"), "ceil", [_S.read(_v0, "x1")]))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "d", _S.invoke(_S.read(_v1, "Math"), "abs", [_S.binary("+", _S.read(_v1, "x"), 0.5)]))
		_S.define(_v1, "q", _S.binary("/", _S.read(_v1, "d"), _S.read(_v1, "reach")))
		_S.define(_v1, "k", _S.call_value(_S.read(_v1, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("*", _S.read(_v1, "a"), 1.15), _S.read(_v1, "q")), 0.15)]))
		if _S.truth(_S.binary("<=", _S.read(_v1, "k"), 0)):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "x", 1, "+=", true)
			continue
		_S.define(_v1, "h", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "x"), 17]))
		_S.define(_v1, "fresh", _S.logical("&&", _S.binary(">", _S.read(_v1, "edge"), 0), func(): return _S.binary(">", _S.read(_v1, "d"), _S.binary("-", _S.read(_v1, "edge"), 3))))
		_S.define(_v1, "tuft", (_S.invoke(_S.read(_v1, "Math"), "round", [_S.binary("*", _S.binary("+", 1, _S.binary("*", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "x"), 5]), 3)), _S.binary("-", 1, _S.binary("*", _S.read(_v1, "q"), 0.6)))]) if _S.truth(_S.binary("<", _S.read(_v1, "h"), 0.45)) else 0))
		_S.define(_v1, "D", _S.binary("*", _S.binary("+", 4, _S.binary("*", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "x"), 11]), 4)), _S.binary("-", 1, _S.binary("*", _S.read(_v1, "q"), 0.5))))
		_S.invoke(_S.read(_v1, "p"), "dot", [_S.read(_v1, "x"), 0, (_S.read(_v1, "WHITE") if _S.truth(_S.logical("||", _S.read(_v1, "fresh"), func(): return _S.binary("<", _S.read(_v1, "h"), 0.25))) else _S.prop(_S.read(_v1, "C"), 6)), _S.read(_v1, "k")])
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "j", 1)
		while _S.truth(_S.binary("<=", _S.read(_v2, "j"), _S.read(_v2, "tuft"))):
			_S.invoke(_S.read(_v2, "p"), "dot", [_S.read(_v2, "x"), _S.unary("-", _S.read(_v2, "j")), (_S.read(_v2, "WHITE") if _S.truth(_S.binary("===", _S.read(_v2, "j"), _S.read(_v2, "tuft"))) else _S.prop(_S.read(_v2, "C"), 5)), _S.read(_v2, "k")])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "j", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v1, "tuft"), 1), func(): return _S.binary("<", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "x"), 9]), 0.5))):
			_S.invoke(_S.read(_v1, "p"), "dot", [_S.binary("+", _S.read(_v1, "x"), (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "x"), 3]), 0.5)) else 1)), _S.binary("+", _S.unary("-", _S.read(_v1, "tuft")), 1), _S.prop(_S.read(_v1, "C"), 6), _S.read(_v1, "k")])
		var _v3 = _S.scope(_v1)
		_S.define(_v3, "j", 1)
		while _S.truth(_S.binary("<=", _S.read(_v3, "j"), _S.read(_v3, "D"))):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "v", _S.binary("/", _S.read(_v4, "j"), _S.read(_v4, "D")))
			_S.invoke(_S.read(_v4, "p"), "dot", [_S.read(_v4, "x"), _S.read(_v4, "j"), (_S.read(_v4, "WHITE") if _S.truth(_S.binary("<", _S.call_value(_S.read(_v4, "rand"), [_S.binary("+", _S.binary("*", _S.read(_v4, "x"), 31), _S.read(_v4, "j")), 7]), 0.06)) else (_S.prop(_S.read(_v4, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v4, "v"), 0.25)) else (_S.prop(_S.read(_v4, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v4, "v"), 0.55)) else _S.prop(_S.read(_v4, "C"), 4)))), _S.binary("*", _S.binary("*", _S.read(_v4, "k"), _S.binary("-", 1.1, _S.read(_v4, "v"))), (1.3 if _S.truth(_S.read(_v4, "fresh")) else 1))])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "j", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "x", 1, "+=", true)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "L", _S.arg(_args, 4))
	_S.define(_e, "spin", _S.arg(_args, 5))
	_S.define(_e, "k", _S.arg(_args, 6))
	if _S.truth(_S.binary("<", _S.read(_e, "L"), 0.8)):
		return null
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), 6)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "a", _S.binary("+", _S.read(_v6, "spin"), _S.binary("/", _S.binary("*", _S.read(_v6, "i"), _S.read(_v6, "TAU")), 6)))
		_S.define(_v6, "ca", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]))
		_S.define(_v6, "sa", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]))
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "d", 0)
		while _S.truth(_S.binary("<=", _S.read(_v7, "d"), _S.read(_v7, "L"))):
			_S.invoke(_S.read(_v7, "p"), "dot", [_S.binary("+", _S.read(_v7, "x"), _S.binary("*", _S.read(_v7, "ca"), _S.read(_v7, "d"))), _S.binary("+", _S.read(_v7, "y"), _S.binary("*", _S.read(_v7, "sa"), _S.read(_v7, "d"))), (_S.read(_v7, "WHITE") if _S.truth(_S.binary("<", _S.read(_v7, "d"), _S.binary("*", _S.read(_v7, "L"), 0.4))) else _S.prop(_S.read(_v7, "C"), 6)), _S.binary("+", _S.read(_v7, "k"), 0.2)])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "d", 0.5, "+=", false)
		if _S.truth(_S.binary(">", _S.read(_v6, "L"), 3)):
			for _v8 in _S.array([_S.unary("-", 1), 1]):
				var _v9 = _S.scope(_v6)
				_S.define(_v9, "s", _v8)
				var _v10 = _S.scope(_v9)
				_S.define(_v10, "bx", _S.binary("+", _S.read(_v10, "x"), _S.binary("*", _S.binary("*", _S.read(_v10, "ca"), _S.read(_v10, "L")), 0.6)))
				_S.define(_v10, "by", _S.binary("+", _S.read(_v10, "y"), _S.binary("*", _S.binary("*", _S.read(_v10, "sa"), _S.read(_v10, "L")), 0.6)))
				_S.define(_v10, "ba", _S.binary("+", _S.read(_v10, "a"), _S.binary("*", _S.read(_v10, "s"), 0.9)))
				var _v11 = _S.scope(_v10)
				_S.define(_v11, "d", 0)
				while _S.truth(_S.binary("<=", _S.read(_v11, "d"), _S.binary("*", _S.read(_v11, "L"), 0.35))):
					_S.invoke(_S.read(_v11, "p"), "dot", [_S.binary("+", _S.read(_v11, "bx"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "ba")]), _S.read(_v11, "d"))), _S.binary("+", _S.read(_v11, "by"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "ba")]), _S.read(_v11, "d"))), _S.prop(_S.read(_v11, "C"), 5), _S.read(_v11, "k")])
					_v11 = _S.iteration(_v11)
					_S.write(_v11, "d", 0.5, "+=", false)
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 10, _S.binary("*", _S.read(_e, "L"), 3)), _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.35, _S.binary("*", 0.5, _S.read(_e, "k")))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "DIM", [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)])
	_S.define(_e, "REACH", _S.prop(_S.read(_e, "o"), "reach"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f3"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "front", _S.function_value(_e, "_f4"))
	_S.define(_e, "reachedAt", _S.function_value(_e, "_f5"))
	_S.define(_e, "sites", [])
	for _v12 in _S.array([_S.unary("-", 1), 1]):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "side", _v12)
		_S.invoke(_S.read(_v13, "RINGS"), "forEach", [_S.function_value(_v13, "_f6")])
	_S.define(_e, "t", 0)
	_S.define(_e, "released", false)
	_S.define(_e, "sink", _S.function_value(_e, "_f7"))
	_S.define(_e, "drawCrystals", _S.function_value(_e, "_f8"))
	_S.define(_e, "ring", _S.function_value(_e, "_f9"))
	return _S.merge([{"update": _S.function_value(_e, "_f11")}, {"drawBack": _S.function_value(_e, "_f12")}, {"draw": _S.function_value(_e, "_f13")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CHARGE"))) else _S.binary("*", _S.read(_e, "REACH"), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CHARGE")), _S.read(_e, "SPREAD"))])), 3]))))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("+", _S.read(_e, "CHARGE"), _S.binary("*", _S.read(_e, "SPREAD"), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "cbrt", [_S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "d"), _S.read(_e, "REACH"))]))]))))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ring", _S.arg(_args, 0))
	_S.define(_e, "ri", _S.arg(_args, 1))
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), _S.prop(_S.read(_v14, "ring"), "n"))):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "q", _S.binary("+", _S.prop(_S.prop(_S.read(_v15, "ring"), "q"), 0), _S.binary("/", _S.binary("*", _S.binary("-", _S.prop(_S.prop(_S.read(_v15, "ring"), "q"), 1), _S.prop(_S.prop(_S.read(_v15, "ring"), "q"), 0)), _S.binary("+", _S.read(_v15, "i"), _S.invoke(_S.read(_v15, "R"), "range", [0.2, 0.8]))), _S.prop(_S.read(_v15, "ring"), "n"))))
		_S.define(_v15, "h", _S.invoke(_S.read(_v15, "R"), "range", _S.concat([_S.array(_S.prop(_S.read(_v15, "ring"), "h"))])))
		_S.define(_v15, "w", _S.invoke(_S.read(_v15, "R"), "range", _S.concat([_S.array(_S.prop(_S.read(_v15, "ring"), "w"))])))
		_S.define(_v15, "parts", [_S.merge([{"dx": 0}, {"h": _S.read(_v15, "h")}, {"w": _S.read(_v15, "w")}, {"lean": _S.binary("*", _S.binary("*", _S.read(_v15, "side"), _S.read(_v15, "h")), _S.invoke(_S.read(_v15, "R"), "range", [0.1, 0.28]))}])])
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v16, "k"), _S.prop(_S.read(_v16, "ring"), "kids"))):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "s", (_S.unary("-", _S.read(_v17, "side")) if _S.truth(_S.binary("%", _S.read(_v17, "k"), 2)) else _S.read(_v17, "side")))
			_S.define(_v17, "kh", _S.binary("*", _S.read(_v17, "h"), _S.invoke(_S.read(_v17, "R"), "range", [0.4, 0.62])))
			_S.invoke(_S.read(_v17, "parts"), "unshift", [_S.merge([{"dx": _S.binary("*", _S.binary("*", _S.read(_v17, "s"), _S.invoke(_S.read(_v17, "R"), "range", [0.3, 0.5])), _S.read(_v17, "w"))}, {"h": _S.read(_v17, "kh")}, {"w": _S.binary("*", _S.read(_v17, "w"), 0.62)}, {"lean": _S.binary("*", _S.binary("*", _S.read(_v17, "s"), _S.read(_v17, "kh")), _S.invoke(_S.read(_v17, "R"), "range", [0.35, 0.6]))}])])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "k", 1, "+=", true)
		_S.invoke(_S.read(_v15, "sites"), "push", [_S.merge([{"x": _S.binary("*", _S.binary("*", _S.read(_v15, "side"), _S.read(_v15, "q")), _S.read(_v15, "REACH"))}, {"d": _S.binary("*", _S.read(_v15, "q"), _S.read(_v15, "REACH"))}, {"h": _S.read(_v15, "h")}, {"back": _S.binary("===", _S.binary("%", _S.binary("+", _S.binary("+", _S.read(_v15, "i"), _S.read(_v15, "ri")), (1 if _S.truth(_S.binary(">", _S.read(_v15, "side"), 0)) else 0)), 2), 1)}, {"t0": _S.binary("+", _S.call_value(_S.read(_v15, "reachedAt"), [_S.binary("*", _S.read(_v15, "q"), _S.read(_v15, "REACH"))]), _S.invoke(_S.read(_v15, "R"), "range", [0, 0.03]))}, {"up": false}, {"parts": _S.read(_v15, "parts")}, {"phase": _S.invoke(_S.read(_v15, "R"), "next", [])}])])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "HOLD"), _S.binary("+", _S.read(_e, "HOLD"), _S.read(_e, "MELT")), _S.read(_e, "tt")])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "back", _S.arg(_args, 1))
	_S.define(_e, "m", _S.call_value(_S.read(_e, "sink"), [_S.read(_e, "t")]))
	for _v18 in _S.array(_S.read(_e, "sites")):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "s", _v18)
		var _v20 = _S.scope(_v19)
		if _S.truth(_S.logical("||", _S.logical("||", _S.unary("!", _S.prop(_S.read(_v20, "s"), "up")), func(): return _S.binary("!==", _S.prop(_S.read(_v20, "s"), "back"), _S.read(_v20, "back"))), func(): return _S.binary(">=", _S.read(_v20, "m"), 1))):
			continue
		_S.define(_v20, "g", _S.invoke(_S.read(_v20, "ease"), "outBack", [_S.call_value(_S.read(_v20, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v20, "t"), _S.prop(_S.read(_v20, "s"), "t0")), 0.1)]), 2.6]))
		_S.define(_v20, "white", _S.binary("<", _S.read(_v20, "t"), _S.binary("+", _S.prop(_S.read(_v20, "s"), "t0"), 0.03)))
		_S.define(_v20, "sw", _S.binary("/", _S.binary("%", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v20, "t"), _S.prop(_S.read(_v20, "s"), "t0")), 0.7), _S.binary("*", _S.prop(_S.read(_v20, "s"), "phase"), 3)), 1.6), 0.5))
		for _v21 in _S.array(_S.prop(_S.read(_v20, "s"), "parts")):
			var _v22 = _S.scope(_v20)
			_S.define(_v22, "q", _v21)
			_S.call_value(_S.read(_v22, "crystal"), [_S.read(_v22, "p"), _S.binary("+", _S.prop(_S.read(_v22, "s"), "x"), _S.prop(_S.read(_v22, "q"), "dx")), (_S.unary("-", 1) if _S.truth(_S.read(_v22, "back")) else 0), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v22, "q"), "h"), _S.read(_v22, "g")), _S.binary("-", 1, _S.read(_v22, "m"))), _S.binary("*", _S.prop(_S.read(_v22, "q"), "w"), _S.binary("-", 1, _S.binary("*", _S.read(_v22, "m"), 0.3))), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v22, "q"), "lean"), _S.read(_v22, "g")), _S.binary("-", 1, _S.read(_v22, "m"))), (_S.read(_v22, "DIM") if _S.truth(_S.read(_v22, "back")) else _S.read(_v22, "C")), _S.merge([{"white": _S.read(_v22, "white")}, {"glint": (_S.read(_v22, "sw") if _S.truth(_S.binary("<=", _S.read(_v22, "sw"), 1)) else _S.unary("-", 1))}])])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "back", _S.arg(_args, 1))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CHARGE"))):
		return null
	_S.define(_e, "u", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CHARGE")), _S.binary("+", _S.read(_e, "SPREAD"), 0.15))]))
	if _S.truth(_S.binary(">=", _S.read(_e, "u"), 1)):
		return null
	_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]), 2), 0.16, _S.invoke(_S.read(_e, "Math"), "max", [2, _S.binary("*", 10, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "u")), 0.7]))]), (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.75)) else _S.binary("/", _S.binary("-", 1, _S.read(_e, "u")), 0.25)), _S.read(_e, "C"), _S.function_value(_e, "_f10"), _S.binary("<", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CHARGE")), 0.1)])
	if _S.truth(_S.unary("!", _S.read(_e, "back"))):
		for _v23 in _S.array([_S.unary("-", 1), 1]):
			var _v24 = _S.scope(_e)
			_S.define(_v24, "s", _v23)
			_S.invoke(_S.read(_v24, "p"), "glow", [_S.binary("*", _S.read(_v24, "s"), _S.binary("+", _S.call_value(_S.read(_v24, "front"), [_S.read(_v24, "t")]), 2)), _S.unary("-", 2), 22, _S.prop(_S.read(_v24, "C"), 5), _S.binary("*", 0.55, _S.binary("-", 1, _S.read(_v24, "u")))])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("===", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "back"))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "CHARGE"), 0.06))):
		var _v25 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v25, "R"), "chance", [0.9])):
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "a", _S.invoke(_S.read(_v26, "R"), "range", [0, _S.read(_v26, "TAU")]))
			_S.define(_v26, "D", _S.invoke(_S.read(_v26, "R"), "range", [26, 58]))
			_S.define(_v26, "T", _S.invoke(_S.read(_v26, "R"), "range", [0.2, 0.3]))
			_S.define(_v26, "v", _S.binary("/", _S.binary("*", _S.read(_v26, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v26, "Math"), "exp", [_S.binary("*", 3, _S.read(_v26, "T"))]), 1)))
			_S.define(_v26, "x", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "a")]), _S.read(_v26, "D")))
			_S.define(_v26, "y", _S.invoke(_S.read(_v26, "Math"), "min", [_S.binary("+", _S.read(_v26, "CORE_Y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "a")]), _S.read(_v26, "D")), 0.8)), _S.unary("-", 2)]))
			_S.define(_v26, "l", _S.logical("||", _S.invoke(_S.read(_v26, "Math"), "hypot", [_S.read(_v26, "x"), _S.binary("-", _S.read(_v26, "y"), _S.read(_v26, "CORE_Y"))]), func(): return 1))
			_S.invoke(_S.read(_v26, "ps"), "spawn", [_S.prop(_S.read(_v26, "P"), "STREAK"), _S.read(_v26, "x"), _S.read(_v26, "y"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v26, "x")), _S.read(_v26, "l")), _S.read(_v26, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v26, "CORE_Y"), _S.read(_v26, "y")), _S.read(_v26, "l")), _S.read(_v26, "v")), _S.read(_v26, "T"), (_S.prop(_S.read(_v26, "C"), 6) if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.5])) else _S.prop(_S.read(_v26, "C"), 5))])
		if _S.truth(_S.invoke(_S.read(_v25, "R"), "chance", [0.14])):
			var _v27 = _S.scope(_v25)
			_S.define(_v27, "s", _S.invoke(_S.read(_v27, "R"), "sign", []))
			_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "VAPOUR"), _S.binary("*", _S.read(_v27, "s"), _S.invoke(_S.read(_v27, "R"), "range", [28, 60])), _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [0, 2])), _S.binary("*", _S.unary("-", _S.read(_v27, "s")), _S.invoke(_S.read(_v27, "R"), "range", [35, 70])), _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [0, 3])), _S.invoke(_S.read(_v27, "R"), "range", [0.35, 0.5]), _S.prop(_S.read(_v27, "C"), 6), _S.invoke(_S.read(_v27, "R"), "range", [2, 3])])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CHARGE")), func(): return _S.unary("!", _S.read(_e, "released")))):
		var _v28 = _S.scope(_e)
		_S.write(_v28, "released", true, "=", false)
		_S.invoke(_S.read(_v28, "lights"), "add", [0, _S.read(_v28, "CORE_Y"), 84, _S.prop(_S.read(_v28, "C"), 4), 0.8, 0.55])
		_S.invoke(_S.read(_v28, "lights"), "add", [0, _S.read(_v28, "CORE_Y"), 45, _S.read(_v28, "WHITE"), 0.7, 0.12])
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 22)):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "a", _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v30, "Math"), "PI")), 0.25]))
			_S.define(_v30, "sp", _S.invoke(_S.read(_v30, "R"), "range", [110, 280]))
			_S.invoke(_S.read(_v30, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v30, "B"), "SHARD")}, {"x": _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 3), 3])}, {"y": _S.read(_v30, "CORE_Y")}, {"vx": _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "a")]), _S.read(_v30, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "a")]), _S.read(_v30, "sp"))}, {"g": 0.7}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v30, "R"), "range", [0.9, 1.5])}, {"a": _S.invoke(_S.read(_v30, "R"), "range", [0, _S.read(_v30, "TAU")])}, {"va": _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v30, "R"), "range", [1.5, 3.5])}, {"c": _S.invoke(_S.read(_v30, "R"), "pick", [[_S.prop(_S.read(_v30, "C"), 7), _S.prop(_S.read(_v30, "C"), 6), _S.prop(_S.read(_v30, "C"), 5)]])}])])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
		var _v31 = _S.scope(_v28)
		_S.define(_v31, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v31, "i"), 14)):
			var _v32 = _S.scope(_v31)
			_S.define(_v32, "a", _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v32, "Math"), "PI")), 0]))
			_S.define(_v32, "sp", _S.invoke(_S.read(_v32, "R"), "range", [40, 160]))
			_S.invoke(_S.read(_v32, "ps"), "spawn", [_S.prop(_S.read(_v32, "P"), "FLAKE"), 0, _S.read(_v32, "CORE_Y"), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "cos", [_S.read(_v32, "a")]), _S.read(_v32, "sp")), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "sin", [_S.read(_v32, "a")]), _S.read(_v32, "sp")), _S.invoke(_S.read(_v32, "R"), "range", [1.2, 1.8]), (_S.read(_v32, "WHITE") if _S.truth(_S.invoke(_S.read(_v32, "R"), "chance", [0.6])) else _S.prop(_S.read(_v32, "C"), 6)), _S.invoke(_S.read(_v32, "R"), "range", [0.5, 1.6])])
			_v31 = _S.iteration(_v31)
			_S.write(_v31, "i", 1, "+=", true)
	_S.define(_e, "fr", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "CHARGE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CHARGE"), _S.read(_e, "SPREAD"))))):
		for _v33 in _S.array([_S.unary("-", 1), 1]):
			var _v34 = _S.scope(_e)
			_S.define(_v34, "s", _v33)
			var _v35 = _S.scope(_v34)
			_S.invoke(_S.read(_v35, "ps"), "spawn", [_S.prop(_S.read(_v35, "P"), "VAPOUR"), _S.binary("+", _S.binary("*", _S.read(_v35, "s"), _S.read(_v35, "fr")), _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 2), 2])), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [0, 5])), _S.binary("*", _S.read(_v35, "s"), _S.invoke(_S.read(_v35, "R"), "range", [15, 75])), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [2, 15])), _S.invoke(_S.read(_v35, "R"), "range", [0.6, 1]), (_S.prop(_S.read(_v35, "C"), 6) if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [0.7])) else _S.prop(_S.read(_v35, "C"), 5)), _S.binary("*", _S.invoke(_S.read(_v35, "R"), "range", [3, 5.5]), _S.binary("-", 1, _S.binary("*", 0.4, _S.binary("/", _S.read(_v35, "fr"), _S.read(_v35, "REACH")))))])
			if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [0.45])):
				_S.invoke(_S.read(_v35, "ps"), "spawn", [_S.prop(_S.read(_v35, "P"), "FLAKE"), _S.binary("*", _S.read(_v35, "s"), _S.read(_v35, "fr")), _S.unary("-", 2), _S.binary("*", _S.read(_v35, "s"), _S.invoke(_S.read(_v35, "R"), "range", [10, 45])), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [30, 85])), _S.invoke(_S.read(_v35, "R"), "range", [1.1, 1.9]), (_S.read(_v35, "WHITE") if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [0.5])) else _S.prop(_S.read(_v35, "C"), 6)), _S.invoke(_S.read(_v35, "R"), "range", [0.5, 1.2])])
	for _v36 in _S.array(_S.read(_e, "sites")):
		var _v37 = _S.scope(_e)
		_S.define(_v37, "s", _v36)
		var _v38 = _S.scope(_v37)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v38, "s"), "up")), func(): return _S.binary(">=", _S.read(_v38, "t"), _S.prop(_S.read(_v38, "s"), "t0")))):
			var _v39 = _S.scope(_v38)
			_S.set_prop(_S.read(_v39, "s"), "up", true, "=", false)
			var _v40 = _S.scope(_v39)
			_S.define(_v40, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v40, "i"), _S.binary("+", 2, _S.invoke(_S.read(_v40, "Math"), "round", [_S.binary("/", _S.prop(_S.read(_v40, "s"), "h"), 8)])))):
				var _v41 = _S.scope(_v40)
				_S.define(_v41, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v41, "Math"), "PI")), 2), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 1.3), 1.3])))
				_S.define(_v41, "sp", _S.binary("*", _S.invoke(_S.read(_v41, "R"), "range", [60, 200]), _S.binary("+", 0.5, _S.binary("/", _S.prop(_S.read(_v41, "s"), "h"), 40))))
				_S.invoke(_S.read(_v41, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v41, "B"), "SHARD")}, {"x": _S.binary("+", _S.prop(_S.read(_v41, "s"), "x"), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": 0}, {"vx": _S.binary("*", _S.invoke(_S.read(_v41, "Math"), "cos", [_S.read(_v41, "a")]), _S.read(_v41, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v41, "Math"), "sin", [_S.read(_v41, "a")]), _S.read(_v41, "sp"))}, {"g": 0.8}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v41, "R"), "range", [0.9, 1.6])}, {"a": _S.invoke(_S.read(_v41, "R"), "range", [0, _S.read(_v41, "TAU")])}, {"va": _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 18), 18])}, {"s": _S.invoke(_S.read(_v41, "R"), "range", [1.5, 3])}, {"c": _S.invoke(_S.read(_v41, "R"), "pick", [[_S.prop(_S.read(_v41, "C"), 7), _S.prop(_S.read(_v41, "C"), 6), _S.prop(_S.read(_v41, "C"), 5)]])}])])
				_v40 = _S.iteration(_v40)
				_S.write(_v40, "i", 1, "+=", true)
			_S.invoke(_S.read(_v39, "ps"), "spawn", [_S.prop(_S.read(_v39, "P"), "VAPOUR"), _S.prop(_S.read(_v39, "s"), "x"), _S.unary("-", 1), _S.invoke(_S.read(_v39, "R"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_v39, "R"), "range", [2, 8])), _S.invoke(_S.read(_v39, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v39, "C"), 6), _S.invoke(_S.read(_v39, "R"), "range", [2.5, 4])])
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v39, "s"), "h"), 10)):
				_S.invoke(_S.read(_v39, "ps"), "spawn", [_S.prop(_S.read(_v39, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v39, "s"), "x"), _S.invoke(_S.read(_v39, "R"), "range", [_S.unary("-", 3), 3])), _S.unary("-", _S.invoke(_S.read(_v39, "R"), "range", [4, _S.binary("*", _S.prop(_S.read(_v39, "s"), "h"), 0.8)])), 0, _S.unary("-", 3), _S.invoke(_S.read(_v39, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v39, "C"), 6), _S.invoke(_S.read(_v39, "R"), "range", [1, 2.4])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CHARGE"), 0.2)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HOLD"), 0.2)))):
		var _v42 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v42, "R"), "chance", [0.5])):
			var _v43 = _S.scope(_v42)
			_S.define(_v43, "s", _S.invoke(_S.read(_v43, "R"), "pick", [_S.read(_v43, "sites")]))
			if _S.truth(_S.prop(_S.read(_v43, "s"), "up")):
				_S.invoke(_S.read(_v43, "ps"), "spawn", [_S.prop(_S.read(_v43, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v43, "s"), "x"), _S.invoke(_S.read(_v43, "R"), "range", [_S.unary("-", 3), 3])), _S.unary("-", _S.invoke(_S.read(_v43, "R"), "range", [2, _S.binary("*", _S.prop(_S.read(_v43, "s"), "h"), 0.9)])), 0, _S.unary("-", 3), _S.invoke(_S.read(_v43, "R"), "range", [0.3, 0.6]), (_S.prop(_S.read(_v43, "C"), 6) if _S.truth(_S.invoke(_S.read(_v43, "R"), "chance", [0.6])) else _S.read(_v43, "WHITE")), _S.invoke(_S.read(_v43, "R"), "range", [0.6, 2.2])])
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v42, "t"), _S.binary("-", _S.read(_v42, "HOLD"), 0.3)), func(): return _S.invoke(_S.read(_v42, "R"), "chance", [0.16]))):
			_S.invoke(_S.read(_v42, "ps"), "spawn", [_S.prop(_S.read(_v42, "P"), "FLAKE"), _S.binary("*", _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 1), 1]), _S.read(_v42, "fr")), _S.unary("-", _S.invoke(_S.read(_v42, "R"), "range", [40, 90])), _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 5), 5]), _S.invoke(_S.read(_v42, "R"), "range", [3, 10]), _S.invoke(_S.read(_v42, "R"), "range", [1.1, 1.5]), (_S.read(_v42, "WHITE") if _S.truth(_S.invoke(_S.read(_v42, "R"), "chance", [0.5])) else _S.prop(_S.read(_v42, "C"), 6)), _S.invoke(_S.read(_v42, "R"), "range", [0.5, 1.4])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "HOLD")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HOLD"), _S.read(_e, "MELT"))))):
		var _v44 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v44, "R"), "chance", [0.5])):
			var _v45 = _S.scope(_v44)
			_S.define(_v45, "s", _S.invoke(_S.read(_v45, "R"), "pick", [_S.read(_v45, "sites")]))
			_S.invoke(_S.read(_v45, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v45, "B"), "DRIP")}, {"x": _S.binary("+", _S.prop(_S.read(_v45, "s"), "x"), _S.invoke(_S.read(_v45, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": _S.unary("-", _S.invoke(_S.read(_v45, "R"), "range", [3, _S.binary("*", _S.binary("*", _S.prop(_S.read(_v45, "s"), "h"), 0.6), _S.binary("-", 1, _S.call_value(_S.read(_v45, "sink"), [_S.read(_v45, "t")])))]))}, {"vy": 10}, {"g": 0.6}, {"life": 1}, {"c": _S.prop(_S.read(_v45, "C"), 5)}])])
		if _S.truth(_S.invoke(_S.read(_v44, "R"), "chance", [0.25])):
			_S.invoke(_S.read(_v44, "ps"), "spawn", [_S.prop(_S.read(_v44, "P"), "VAPOUR"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v44, "R"), "range", [_S.unary("-", 1), 1]), _S.read(_v44, "REACH")), 0.8), _S.unary("-", _S.invoke(_S.read(_v44, "R"), "range", [0, 3])), _S.invoke(_S.read(_v44, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v44, "R"), "range", [6, 16])), _S.invoke(_S.read(_v44, "R"), "range", [0.6, 1]), _S.prop(_S.read(_v44, "C"), 5), _S.invoke(_S.read(_v44, "R"), "range", [3, 5])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "out", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "HOLD"), 0.2), _S.binary("+", _S.binary("+", _S.read(_e, "HOLD"), _S.read(_e, "MELT")), 0.6), _S.read(_e, "t")])))
	_S.define(_e, "fr", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "out"), 0), func(): return _S.binary(">", _S.read(_e, "t"), _S.read(_e, "CHARGE")))):
		_S.call_value(_S.read(_e, "frost"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.unary("-", _S.invoke(_S.read(_e, "Math"), "max", [12, _S.binary("+", _S.read(_e, "fr"), 1)])), _S.invoke(_S.read(_e, "Math"), "max", [12, _S.binary("+", _S.read(_e, "fr"), 1)]), _S.read(_e, "REACH"), _S.read(_e, "out"), _S.read(_e, "fr")])
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), true])
	_S.call_value(_S.read(_e, "drawCrystals"), [_S.read(_e, "p"), true])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), false])
	_S.call_value(_S.read(_e, "drawCrystals"), [_S.read(_e, "p"), false])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CHARGE"))):
		var _v46 = _S.scope(_e)
		_S.define(_v46, "k", _S.binary("/", _S.read(_v46, "t"), _S.read(_v46, "CHARGE")))
		_S.define(_v46, "beat", _S.binary("+", _S.binary("+", 1, _S.binary("*", 0.25, _S.invoke(_S.read(_v46, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("**", _S.binary("-", _S.read(_v46, "t"), _S.binary("*", _S.read(_v46, "CHARGE"), 0.55)), 2)), 0.002)]))), _S.binary("*", 0.3, _S.invoke(_S.read(_v46, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("**", _S.binary("-", _S.read(_v46, "t"), _S.binary("*", _S.read(_v46, "CHARGE"), 0.85)), 2)), 0.002)]))))
		_S.call_value(_S.read(_v46, "snowflake"), [_S.read(_v46, "p"), _S.read(_v46, "C"), 0, _S.read(_v46, "CORE_Y"), _S.binary("*", _S.binary("+", 2, _S.binary("*", _S.binary("*", 5.5, _S.read(_v46, "k")), _S.read(_v46, "k"))), _S.read(_v46, "beat")), _S.binary("*", _S.read(_v46, "t"), 4), _S.read(_v46, "k")])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CHARGE"), 0.22))):
			var _v47 = _S.scope(_e)
			_S.define(_v47, "a", _S.binary("/", _S.binary("-", _S.read(_v47, "t"), _S.read(_v47, "CHARGE")), 0.22))
			_S.call_value(_S.read(_v47, "flare"), [_S.read(_v47, "p"), 0, _S.read(_v47, "CORE_Y"), _S.binary("*", 36, _S.invoke(_S.read(_v47, "Math"), "pow", [_S.binary("-", 1, _S.read(_v47, "a")), 1.5])), _S.binary("-", 1, _S.read(_v47, "a")), _S.read(_v47, "C")])
			_S.invoke(_S.read(_v47, "p"), "glow", [0, _S.read(_v47, "CORE_Y"), 46, _S.read(_v47, "WHITE"), _S.binary("*", 0.6, _S.binary("-", 1, _S.read(_v47, "a")))])
	if _S.truth(_S.binary(">", _S.read(_e, "t"), _S.read(_e, "CHARGE"))):
		var _v48 = _S.scope(_e)
		_S.define(_v48, "k", _S.binary("*", _S.binary("-", 1, _S.call_value(_S.read(_v48, "smooth"), [_S.read(_v48, "HOLD"), _S.binary("+", _S.binary("+", _S.read(_v48, "HOLD"), _S.read(_v48, "MELT")), 0.3), _S.read(_v48, "t")])), _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_v48, "Math"), "sin", [_S.binary("*", _S.read(_v48, "t"), 2.4)])))))
		_S.define(_v48, "fr", _S.call_value(_S.read(_v48, "front"), [_S.read(_v48, "t")]))
		var _v49 = _S.scope(_v48)
		_S.define(_v49, "i", _S.unary("-", 3))
		while _S.truth(_S.binary("<=", _S.read(_v49, "i"), 3)):
			_S.invoke(_S.read(_v49, "p"), "glow", [_S.binary("*", _S.binary("/", _S.read(_v49, "i"), 3.5), _S.read(_v49, "fr")), _S.unary("-", 4), 26, _S.prop(_S.read(_v49, "C"), 4), _S.binary("*", 0.16, _S.read(_v49, "k"))])
			_v49 = _S.iteration(_v49)
			_S.write(_v49, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "bits"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
