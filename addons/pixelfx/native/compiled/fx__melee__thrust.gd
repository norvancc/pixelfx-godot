@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/thrust.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "longStar", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Thrust"}, {"desc": "A piercing stab: a bundle of streaks shoots out from the hand to a point, a long four-point star flares at the tip with a pierce ring, sparks and speed lines."}, {"tags": ["melee", "thrust", "stab", "spear", "rapier", "pierce", "combat", "directional", "one-shot"]}, {"size": [196, 76]}, {"origin": [34, 62]}, {"duration": 0.75}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#2a1608", "#6b3c10", "#b8701a", "#f0b42e", "#ffe27a", "#fff6cf", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"reach": 66}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "STANCE", _S.merge([_S.read(_e, "READY"), {"weapon": "sword"}, {"x": _S.unary("-", 14)}, {"fx": 12}, {"fy": _S.unary("-", 21)}, {"sa": _S.unary("-", 0.3)}]))
	_S.define(_e, "BACK", _S.merge([_S.read(_e, "STANCE"), {"crouch": 5}, {"lean": _S.unary("-", 3)}, {"fx": _S.unary("-", 3)}, {"fy": _S.unary("-", 19)}, {"sa": _S.unary("-", 0.05)}, {"bx": 8}, {"by": _S.unary("-", 30)}, {"armsFront": true}, {"ffx": 10}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "LUNGE", _S.merge([_S.read(_e, "STANCE"), {"crouch": 6}, {"lean": 6}, {"fx": 23}, {"fy": _S.unary("-", 20)}, {"sa": 0}, {"bx": _S.unary("-", 8)}, {"by": _S.unary("-", 24)}, {"ffx": 15}, {"fbx": _S.unary("-", 11)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 80}])}, {"poses": [[_S.unary("-", 0.46), _S.read(_e, "STANCE")], [_S.unary("-", 0.24), _S.read(_e, "BACK")], [_S.unary("-", 0.05), _S.merge([_S.read(_e, "BACK"), {"crouch": 6}, {"fx": _S.unary("-", 5)}])], [0, _S.merge([_S.read(_e, "LUNGE"), {"ghost": 1}]), "snap"], [0.07, _S.read(_e, "LUNGE"), "snap"], [0.3, _S.merge([_S.read(_e, "LUNGE"), {"crouch": 5}, {"lean": 5}])], [0.7, _S.read(_e, "STANCE")]]}, {"hits": [_S.merge([{"t": 0.07}, {"stop": 0.12}, {"shake": 0.14}, {"amp": 2}, {"push": 2.8}, {"straw": 16}, {"y": _S.unary("-", 26)}])]}, {"dust": [_S.merge([{"t": 0}, {"x": _S.unary("-", 24)}, {"n": 6}, {"dir": _S.unary("-", 1)}]), _S.merge([{"t": 0.07}, {"x": 1}, {"n": 6}, {"dir": 1}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "OUT", 0.07)
	_S.define(_e, "HOLD", 0.06)
	_S.define(_e, "PULL", 0.2)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "L", _S.arg(_args, 3))
	_S.define(_e, "k", _S.arg(_args, 4))
	_S.define(_e, "C", _S.arg(_args, 5))
	if _S.truth(_S.binary("<", _S.read(_e, "L"), 1)):
		return null
	_S.define(_e, "arms", [[1, 0, _S.read(_e, "L")], [_S.unary("-", 1), 0, _S.binary("*", _S.read(_e, "L"), 0.7)], [0, _S.unary("-", 1), _S.binary("*", _S.read(_e, "L"), 0.42)], [0, 1, _S.binary("*", _S.read(_e, "L"), 0.42)]])
	for _v0 in _S.array(_S.read(_e, "arms")):
		var _v1 = _S.scope(_e)
		var _v2 = _v0
		_S.define(_v1, "dx", _S.prop(_v2, 0))
		_S.define(_v1, "dy", _S.prop(_v2, 1))
		_S.define(_v1, "len", _S.prop(_v2, 2))
		var _v3 = _S.scope(_v1)
		_S.define(_v3, "d", 1)
		while _S.truth(_S.binary("<=", _S.read(_v3, "d"), _S.read(_v3, "len"))):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "u", _S.binary("/", _S.read(_v4, "d"), _S.read(_v4, "len")))
			_S.define(_v4, "c", (_S.read(_v4, "WHITE") if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.3)) else (_S.prop(_S.read(_v4, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.65)) else _S.prop(_S.read(_v4, "C"), 4))))
			_S.invoke(_S.read(_v4, "p"), "dot", [_S.binary("+", _S.read(_v4, "x"), _S.binary("*", _S.read(_v4, "dx"), _S.read(_v4, "d"))), _S.binary("+", _S.read(_v4, "y"), _S.binary("*", _S.read(_v4, "dy"), _S.read(_v4, "d"))), _S.read(_v4, "c"), (1 if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.7)) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v4, "u"), 0.7), 0.35)))])
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v4, "u"), 0.25), func(): return _S.binary(">", _S.read(_v4, "len"), 6))):
				_S.last([_S.invoke(_S.read(_v4, "p"), "dot", [_S.binary("-", _S.binary("+", _S.read(_v4, "x"), _S.binary("*", _S.read(_v4, "dx"), _S.read(_v4, "d"))), _S.read(_v4, "dy")), _S.binary("+", _S.binary("+", _S.read(_v4, "y"), _S.binary("*", _S.read(_v4, "dy"), _S.read(_v4, "d"))), _S.read(_v4, "dx")), _S.prop(_S.read(_v4, "C"), 5)]), _S.invoke(_S.read(_v4, "p"), "dot", [_S.binary("+", _S.binary("+", _S.read(_v4, "x"), _S.binary("*", _S.read(_v4, "dx"), _S.read(_v4, "d"))), _S.read(_v4, "dy")), _S.binary("-", _S.binary("+", _S.read(_v4, "y"), _S.binary("*", _S.read(_v4, "dy"), _S.read(_v4, "d"))), _S.read(_v4, "dx")), _S.prop(_S.read(_v4, "C"), 5)])])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "d", 0.5, "+=", false)
	for _v5 in _S.array([[1, 1], [1, _S.unary("-", 1)], [_S.unary("-", 1), 1], [_S.unary("-", 1), _S.unary("-", 1)]]):
		var _v6 = _S.scope(_e)
		var _v7 = _v5
		_S.define(_v6, "dx", _S.prop(_v7, 0))
		_S.define(_v6, "dy", _S.prop(_v7, 1))
		var _v8 = _S.scope(_v6)
		_S.define(_v8, "d", 1)
		while _S.truth(_S.binary("<=", _S.read(_v8, "d"), _S.invoke(_S.read(_v8, "Math"), "min", [3, _S.binary("*", _S.read(_v8, "L"), 0.14)]))):
			_S.invoke(_S.read(_v8, "p"), "px", [_S.binary("+", _S.read(_v8, "x"), _S.binary("*", _S.read(_v8, "dx"), _S.read(_v8, "d"))), _S.binary("+", _S.read(_v8, "y"), _S.binary("*", _S.read(_v8, "dy"), _S.read(_v8, "d"))), (_S.prop(_S.read(_v8, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v8, "d"), 2)) else _S.prop(_S.read(_v8, "C"), 4))])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "d", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 6, _S.binary("*", _S.read(_e, "L"), 1.3)), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.35, _S.read(_e, "k"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 3, _S.binary("*", _S.read(_e, "L"), 0.4)), _S.read(_e, "WHITE"), _S.binary("*", 0.3, _S.read(_e, "k"))])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.function_value(_e, "_f2")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "HX", 9)
	_S.define(_e, "HY", _S.unary("-", 20))
	_S.define(_e, "TX", _S.binary("+", _S.read(_e, "HX"), _S.prop(_S.read(_e, "o"), "reach")))
	_S.define(_e, "TY", _S.read(_e, "HY"))
	_S.define(_e, "streaks", _S.invoke([_S.unary("-", 7), _S.unary("-", 4), _S.unary("-", 2), 0, 2, 4, 7], "map", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "lines", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "struck", false)
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "off", _S.arg(_args, 0))
	return _S.merge([{"off": _S.read(_e, "off")}, {"x0": _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "HX"), 1), _S.invoke(_S.read(_e, "Rg"), "range", [0, 5])), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "off")]), 0.6))}, {"t0": _S.binary("+", _S.invoke(_S.read(_e, "Rg"), "range", [0, 0.02]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "off")]), 0.003))}, {"w": (2 if _S.truth(_S.binary("===", _S.read(_e, "off"), 0)) else 1)}, {"hot": _S.binary("===", _S.read(_e, "off"), 0)}, {"len": _S.invoke(_S.read(_e, "Rg"), "range", [0.75, 1])}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT"), 0.08)), func(): return _S.invoke(_S.read(_e, "Rg"), "chance", [0.5]))):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "s", _S.invoke(_S.read(_v9, "Rg"), "sign", []))
		_S.invoke(_S.read(_v9, "lines"), "push", [_S.merge([{"x": _S.binary("+", _S.read(_v9, "HX"), _S.invoke(_S.read(_v9, "Rg"), "range", [0, _S.binary("*", _S.prop(_S.read(_v9, "o"), "reach"), 0.6)]))}, {"y": _S.binary("+", _S.read(_v9, "HY"), _S.binary("*", _S.read(_v9, "s"), _S.invoke(_S.read(_v9, "Rg"), "range", [7, 17])))}, {"l": _S.invoke(_S.read(_v9, "Rg"), "range", [18, 42])}, {"v": _S.invoke(_S.read(_v9, "Rg"), "range", [200, 340])}, {"t": _S.read(_v9, "t")}])])
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", _S.binary("-", _S.prop(_S.read(_v10, "lines"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v10, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v10, "t"), _S.prop(_S.prop(_S.read(_v10, "lines"), _S.read(_v10, "i")), "t")), 0.24)):
			_S.invoke(_S.read(_v10, "lines"), "splice", [_S.read(_v10, "i"), 1])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "-=", true)
	for _v11 in _S.array(_S.read(_e, "lines")):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "l", _v11)
		_S.set_prop(_S.read(_v12, "l"), "x", _S.binary("*", _S.prop(_S.read(_v12, "l"), "v"), _S.read(_v12, "dt")), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "struck")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "OUT")))):
		var _v13 = _S.scope(_e)
		_S.write(_v13, "struck", true, "=", false)
		_S.invoke(_S.read(_v13, "lights"), "add", [_S.read(_v13, "TX"), _S.read(_v13, "TY"), 44, _S.prop(_S.read(_v13, "C"), 4), 0.45, 0.3])
		_S.invoke(_S.read(_v13, "lights"), "add", [_S.read(_v13, "TX"), _S.read(_v13, "TY"), 14, _S.read(_v13, "WHITE"), 0.6, 0.06])
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v14, "i"), 12)):
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "a", _S.invoke(_S.read(_v15, "Rg"), "range", [_S.unary("-", 0.55), 0.45]))
			_S.define(_v15, "sp", _S.invoke(_S.read(_v15, "Rg"), "range", [150, 330]))
			_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "SPARK"), _S.read(_v15, "TX"), _S.read(_v15, "TY"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "sp")), 30), _S.invoke(_S.read(_v15, "Rg"), "range", [0.12, 0.35])])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "i", 1, "+=", true)
		var _v16 = _S.scope(_v13)
		_S.define(_v16, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v16, "i"), 10)):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "a", _S.binary("+", _S.invoke(_S.read(_v17, "Rg"), "range", [_S.unary("-", 0.9), 0.9]), (_S.prop(_S.read(_v17, "Math"), "PI") if _S.truth(_S.invoke(_S.read(_v17, "Rg"), "chance", [0.3])) else 0)))
			_S.define(_v17, "sp", _S.invoke(_S.read(_v17, "Rg"), "range", [40, 120]))
			_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "MOTE"), _S.binary("+", _S.read(_v17, "TX"), _S.invoke(_S.read(_v17, "Rg"), "range", [_S.unary("-", 6), 2])), _S.binary("+", _S.read(_v17, "TY"), _S.invoke(_S.read(_v17, "Rg"), "range", [_S.unary("-", 2), 2])), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.invoke(_S.read(_v17, "Rg"), "range", [0.25, 0.5]), (_S.prop(_S.read(_v17, "C"), 5) if _S.truth(_S.invoke(_S.read(_v17, "Rg"), "chance", [0.5])) else _S.prop(_S.read(_v17, "C"), 4)), 0.6])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
		var _v18 = _S.scope(_v13)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), 4)):
			_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "STAR"), _S.binary("+", _S.read(_v18, "TX"), _S.invoke(_S.read(_v18, "Rg"), "range", [_S.unary("-", 10), 8])), _S.binary("+", _S.read(_v18, "TY"), _S.invoke(_S.read(_v18, "Rg"), "range", [_S.unary("-", 9), 9])), 0, _S.unary("-", 3), _S.invoke(_S.read(_v18, "Rg"), "range", [0.2, 0.4]), (_S.prop(_S.read(_v18, "C"), 5) if _S.truth(_S.invoke(_S.read(_v18, "Rg"), "chance", [0.5])) else _S.read(_v18, "WHITE")), _S.invoke(_S.read(_v18, "Rg"), "range", [1, 2]), _S.invoke(_S.read(_v18, "Rg"), "range", [0.06, 0.2])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.05)):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "HX"), 2), _S.read(_e, "HY"), _S.binary("+", _S.binary("*", 5, _S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.05))), 1), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3), 0.4])
	for _v19 in _S.array(_S.read(_e, "lines")):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "l", _v19)
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "k", _S.binary("/", _S.binary("-", _S.read(_v21, "t"), _S.prop(_S.read(_v21, "l"), "t")), 0.24))
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "d", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "d"), _S.binary("*", _S.prop(_S.read(_v22, "l"), "l"), _S.binary("-", 1, _S.binary("*", _S.read(_v22, "k"), 0.6))))):
			_S.invoke(_S.read(_v22, "p"), "dot", [_S.binary("-", _S.prop(_S.read(_v22, "l"), "x"), _S.read(_v22, "d")), _S.prop(_S.read(_v22, "l"), "y"), (_S.read(_v22, "WHITE") if _S.truth(_S.binary("<", _S.read(_v22, "d"), 3)) else (_S.prop(_S.read(_v22, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v22, "d"), _S.binary("*", _S.prop(_S.read(_v22, "l"), "l"), 0.4))) else _S.prop(_S.read(_v22, "C"), 3))), _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_v22, "d"), _S.prop(_S.read(_v22, "l"), "l"))), _S.binary("-", 1, _S.read(_v22, "k")))])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "d", 1, "+=", true)
	_S.define(_e, "pull", _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "OUT"), _S.read(_e, "HOLD")), _S.binary("+", _S.binary("+", _S.read(_e, "OUT"), _S.read(_e, "HOLD")), _S.read(_e, "PULL")), _S.read(_e, "t")]))
	for _v23 in _S.array(_S.read(_e, "streaks")):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "s", _v23)
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "u", _S.call_value(_S.read(_v25, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v25, "t"), _S.prop(_S.read(_v25, "s"), "t0")), _S.read(_v25, "OUT"))]))
		_S.define(_v25, "head", _S.invoke(_S.read(_v25, "ease"), "outExpo", [_S.read(_v25, "u")]))
		if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v25, "u"), 0), func(): return _S.binary(">=", _S.read(_v25, "pull"), 1))):
			continue
		_S.define(_v25, "y0", _S.binary("+", _S.read(_v25, "HY"), _S.prop(_S.read(_v25, "s"), "off")))
		_S.define(_v25, "end", _S.binary("+", _S.prop(_S.read(_v25, "s"), "x0"), _S.binary("*", _S.binary("-", _S.read(_v25, "TX"), _S.prop(_S.read(_v25, "s"), "x0")), _S.prop(_S.read(_v25, "s"), "len"))))
		_S.define(_v25, "x1", _S.binary("+", _S.prop(_S.read(_v25, "s"), "x0"), _S.binary("*", _S.binary("-", _S.read(_v25, "end"), _S.prop(_S.read(_v25, "s"), "x0")), _S.read(_v25, "head"))))
		_S.define(_v25, "xa", _S.binary("+", _S.prop(_S.read(_v25, "s"), "x0"), _S.binary("*", _S.binary("-", _S.read(_v25, "end"), _S.prop(_S.read(_v25, "s"), "x0")), _S.invoke(_S.read(_v25, "Math"), "max", [_S.read(_v25, "pull"), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v25, "head"), 0.35), _S.binary("-", 1, _S.prop(_S.read(_v25, "s"), "len"))), 3)]))))
		_S.define(_v25, "yAt", _S.function_value(_v25, "_f6"))
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "x", _S.read(_v26, "xa"))
		while _S.truth(_S.binary("<=", _S.read(_v26, "x"), _S.read(_v26, "x1"))):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "v", _S.binary("/", _S.binary("-", _S.read(_v27, "x"), _S.read(_v27, "xa")), _S.invoke(_S.read(_v27, "Math"), "max", [1, _S.binary("-", _S.read(_v27, "x1"), _S.read(_v27, "xa"))])))
			_S.define(_v27, "c", (_S.read(_v27, "WHITE") if _S.truth(_S.binary(">", _S.read(_v27, "v"), 0.88)) else ((_S.prop(_S.read(_v27, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v27, "v"), 0.35)) else _S.prop(_S.read(_v27, "C"), 5)) if _S.truth(_S.prop(_S.read(_v27, "s"), "hot")) else (_S.prop(_S.read(_v27, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v27, "v"), 0.55)) else (_S.prop(_S.read(_v27, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v27, "v"), 0.25)) else _S.prop(_S.read(_v27, "C"), 3))))))
			_S.invoke(_S.read(_v27, "p"), "dot", [_S.read(_v27, "x"), _S.call_value(_S.read(_v27, "yAt"), [_S.read(_v27, "x")]), _S.read(_v27, "c"), (_S.binary("/", _S.read(_v27, "v"), 0.12) if _S.truth(_S.binary("<", _S.read(_v27, "v"), 0.12)) else 1)])
			if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v27, "s"), "w"), 1), func(): return _S.binary(">", _S.read(_v27, "v"), 0.1))):
				_S.invoke(_S.read(_v27, "p"), "dot", [_S.read(_v27, "x"), _S.binary("+", _S.call_value(_S.read(_v27, "yAt"), [_S.read(_v27, "x")]), 1), (_S.prop(_S.read(_v27, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v27, "v"), 0.6)) else _S.prop(_S.read(_v27, "C"), 3)), (_S.binary("/", _S.read(_v27, "v"), 0.2) if _S.truth(_S.binary("<", _S.read(_v27, "v"), 0.2)) else 1)])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "x", 0.5, "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.binary("+", _S.read(_e, "OUT"), _S.read(_e, "HOLD")), _S.read(_e, "PULL")))):
		_S.invoke(_S.read(_e, "p"), "glowLine", [_S.binary("+", _S.read(_e, "HX"), _S.binary("*", _S.binary("-", _S.read(_e, "TX"), _S.read(_e, "HX")), _S.read(_e, "pull"))), _S.read(_e, "HY"), _S.binary("+", _S.read(_e, "HX"), _S.binary("*", _S.binary("-", _S.read(_e, "TX"), _S.read(_e, "HX")), _S.invoke(_S.read(_e, "ease"), "outExpo", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "OUT"))])]))), _S.read(_e, "TY"), 6, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.22, _S.binary("-", 1, _S.read(_e, "pull")))])
	_S.define(_e, "q", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "OUT")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0), func(): return _S.binary("<", _S.read(_e, "q"), 0.4))):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "g", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v28, "ease"), "outBack", [_S.call_value(_S.read(_v28, "clamp"), [_S.binary("/", _S.read(_v28, "q"), 0.04)]), 2.4]), _S.binary("-", 1, _S.call_value(_S.read(_v28, "smooth"), [0.08, 0.4, _S.read(_v28, "q")]))), _S.binary("+", 1, _S.binary("*", 0.12, _S.invoke(_S.read(_v28, "Math"), "sin", [_S.binary("*", _S.read(_v28, "q"), 70)])))))
		_S.call_value(_S.read(_v28, "longStar"), [_S.read(_v28, "p"), _S.read(_v28, "TX"), _S.read(_v28, "TY"), _S.binary("*", 24, _S.read(_v28, "g")), _S.binary("-", 1, _S.binary("/", _S.read(_v28, "q"), 0.4)), _S.read(_v28, "C")])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0), func(): return _S.binary("<", _S.read(_e, "q"), 0.2))):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "k", _S.binary("/", _S.read(_v29, "q"), 0.2))
		_S.define(_v29, "rx", _S.binary("+", 2, _S.binary("*", 7, _S.invoke(_S.read(_v29, "ease"), "outCubic", [_S.read(_v29, "k")]))))
		_S.define(_v29, "ry", _S.binary("+", 4, _S.binary("*", 12, _S.invoke(_S.read(_v29, "ease"), "outCubic", [_S.read(_v29, "k")]))))
		var _v30 = _S.scope(_v29)
		_S.define(_v30, "a", 0)
		while _S.truth(_S.binary("<", _S.read(_v30, "a"), _S.read(_v30, "TAU"))):
			_S.invoke(_S.read(_v30, "p"), "dot", [_S.binary("+", _S.binary("+", _S.binary("+", _S.read(_v30, "TX"), 4), _S.binary("*", 10, _S.read(_v30, "k"))), _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "a")]), _S.read(_v30, "rx"))), _S.binary("+", _S.read(_v30, "TY"), _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "a")]), _S.read(_v30, "ry"))), (_S.read(_v30, "WHITE") if _S.truth(_S.binary("<", _S.read(_v30, "k"), 0.3)) else _S.prop(_S.read(_v30, "C"), 5)), _S.binary("-", 1.15, _S.read(_v30, "k"))])
			_v30 = _S.iteration(_v30)
			_S.write(_v30, "a", 0.05, "+=", false)
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_e, "TY"), _S.read(_e, "y0")), _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "s"), "x0")), _S.binary("-", _S.read(_e, "TX"), _S.prop(_S.read(_e, "s"), "x0")))])), 0.85))
