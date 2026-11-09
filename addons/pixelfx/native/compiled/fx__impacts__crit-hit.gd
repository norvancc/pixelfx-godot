@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/crit-hit.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "spikes", _S.import_value("fx/impacts/_lib.js", "spikes"))
	_S.define(_e, "star", _S.import_value("fx/impacts/_lib.js", "star"))
	_S.define(_e, "brokenRing", _S.import_value("fx/impacts/_lib.js", "brokenRing"))
	_S.define(_e, "flare", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Critical hit"}, {"desc": "A critical hit: a jagged starburst slams in white and overshoots, a ring breaks into flying arcs, sparks streak off, shards tumble to the floor under a big flare."}, {"tags": ["impact", "hit", "crit", "critical", "combat", "directional", "one-shot"]}, {"size": [216, 136]}, {"origin": [84, 106]}, {"duration": 0.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#2a0510", "#5c0a1c", "#a3142a", "#e0302c", "#ff7a2a", "#ffc23d", "#fff09a", "#ffffff"]}, {"height": 26}, {"aim": 0.12}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "KEYS", [[0, 1, 1, 1, [6, 7, 7, 7]], [0.025, 1.3, 1, 1, [2, 5, 6, 7]], [0.058, 1.05, 0.72, 1, [2, 4, 5, 6]], [0.092, 1.22, 0.3, 1, [1, 2, 3, 4]], [0.125]])
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
	for _v0 in _S.array([[1, 0, _S.read(_e, "L")], [0, 1, _S.binary("*", _S.read(_e, "L"), 0.45)], [0.7, 0.7, _S.binary("*", _S.read(_e, "L"), 0.16)], [0.7, _S.unary("-", 0.7), _S.binary("*", _S.read(_e, "L"), 0.16)]]):
		var _v1 = _S.scope(_e)
		var _v2 = _v0
		_S.define(_v1, "dx", _S.prop(_v2, 0))
		_S.define(_v1, "dy", _S.prop(_v2, 1))
		_S.define(_v1, "len", _S.prop(_v2, 2))
		for _v3 in _S.array([_S.unary("-", 1), 1]):
			var _v4 = _S.scope(_v1)
			_S.define(_v4, "s", _v3)
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "d", 1)
			while _S.truth(_S.binary("<=", _S.read(_v5, "d"), _S.read(_v5, "len"))):
				var _v6 = _S.scope(_v5)
				_S.define(_v6, "u", _S.binary("/", _S.read(_v6, "d"), _S.read(_v6, "len")))
				_S.define(_v6, "a", (1 if _S.truth(_S.binary("<", _S.read(_v6, "u"), 0.7)) else _S.binary("*", _S.read(_v6, "k"), _S.binary("-", 1.6, _S.read(_v6, "u")))))
				_S.invoke(_S.read(_v6, "p"), "dot", [_S.binary("+", _S.read(_v6, "x"), _S.binary("*", _S.binary("*", _S.read(_v6, "s"), _S.read(_v6, "dx")), _S.read(_v6, "d"))), _S.binary("+", _S.read(_v6, "y"), _S.binary("*", _S.binary("*", _S.read(_v6, "s"), _S.read(_v6, "dy")), _S.read(_v6, "d"))), (_S.read(_v6, "WHITE") if _S.truth(_S.binary("<", _S.read(_v6, "u"), 0.35)) else (_S.prop(_S.read(_v6, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v6, "u"), 0.7)) else _S.prop(_S.read(_v6, "C"), 5))), _S.read(_v6, "a")])
				if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v6, "dy"), 0), func(): return _S.binary("<", _S.read(_v6, "u"), 0.42))):
					for _v7 in _S.array([_S.unary("-", 1), 1]):
						var _v8 = _S.scope(_v6)
						_S.define(_v8, "e", _v7)
						_S.invoke(_S.read(_v8, "p"), "dot", [_S.binary("+", _S.read(_v8, "x"), _S.binary("*", _S.read(_v8, "s"), _S.read(_v8, "d"))), _S.binary("+", _S.read(_v8, "y"), _S.read(_v8, "e")), (_S.prop(_S.read(_v8, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v8, "u"), 0.2)) else _S.prop(_S.read(_v8, "C"), 5)), (1 if _S.truth(_S.binary("<", _S.read(_v8, "u"), 0.3)) else _S.read(_v8, "k"))])
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "d", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "L")), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "L")), _S.read(_e, "y"), 6, _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.5, _S.read(_e, "k"))])
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "L"), 0.45)), _S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "L"), 0.45)), 4, _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.3, _S.read(_e, "k"))])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "X", 0)
	_S.define(_e, "Y", _S.unary("-", _S.prop(_S.read(_e, "o"), "height")))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "aim"))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "sp", _S.call_value(_S.read(_e, "spikes"), [_S.read(_e, "R"), 14, _S.read(_e, "A"), _S.merge([{"len": [11, 15]}, {"w": [1.8, 2.5]}, {"fwd": 1.4}, {"back": 0.6}, {"jag": 0.5}])]))
	_S.invoke(_S.invoke(_S.invoke(_S.concat([_S.array(_S.read(_e, "sp"))]), "sort", [_S.function_value(_e, "_f3")]), "slice", [0, 2]), "forEach", [_S.function_value(_e, "_f4")])
	_S.define(_e, "segs", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 7}]), _S.function_value(_e, "_f5")]))
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.read(_e, "Y"), 84, _S.prop(_S.read(_e, "C"), 5), 0.6, 0.5])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.read(_e, "Y"), 30, _S.read(_e, "WHITE"), 0.7, 0.1])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.unary("-", 4), 44, _S.prop(_S.read(_e, "C"), 4), 0.3, 0.45])
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), 36)):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "back", _S.invoke(_S.read(_v10, "R"), "chance", [0.22]))
		_S.define(_v10, "a", _S.binary("+", (_S.binary("+", _S.read(_v10, "A"), _S.prop(_S.read(_v10, "Math"), "PI")) if _S.truth(_S.read(_v10, "back")) else _S.read(_v10, "A")), _S.binary("*", _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 1), 1]), (0.6 if _S.truth(_S.read(_v10, "back")) else 0.8))))
		_S.define(_v10, "v", _S.binary("*", _S.invoke(_S.read(_v10, "R"), "range", [170, 430]), (0.6 if _S.truth(_S.read(_v10, "back")) else 1)))
		_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "SPARK"), _S.read(_v10, "X"), _S.read(_v10, "Y"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "v")), 50), _S.invoke(_S.read(_v10, "R"), "range", [0.15, 0.5]), _S.read(_v10, "WHITE"), 1, (_S.invoke(_S.read(_v10, "R"), "range", [0, 0.04]) if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.3])) else 0)])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), 10)):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "a", _S.binary("-", _S.binary("+", _S.read(_v12, "A"), _S.binary("*", _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 1), 1]), 1.1)), 0.35))
		_S.define(_v12, "v", _S.invoke(_S.read(_v12, "R"), "range", [110, 280]))
		_S.invoke(_S.read(_v12, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v12, "B"), "SHARD")}, {"x": _S.read(_v12, "X")}, {"y": _S.read(_v12, "Y")}, {"vx": _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "v"))}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "v")), 40)}, {"g": 0.8}, {"drag": 0.7}, {"bounce": 0.35}, {"life": _S.invoke(_S.read(_v12, "R"), "range", [0.55, 0.85])}, {"a": _S.invoke(_S.read(_v12, "R"), "range", [0, _S.read(_v12, "TAU")])}, {"va": _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 25), 25])}, {"s": _S.invoke(_S.read(_v12, "R"), "range", [2, 4.5])}, {"c": _S.invoke(_S.read(_v12, "R"), "pick", [[_S.prop(_S.read(_v12, "C"), 7), _S.prop(_S.read(_v12, "C"), 6), _S.prop(_S.read(_v12, "C"), 6), _S.prop(_S.read(_v12, "C"), 5)]])}])])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "+=", true)
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), 12)):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "a", _S.binary("+", _S.binary("-", _S.read(_v14, "A"), _S.binary("/", _S.prop(_S.read(_v14, "Math"), "PI"), 2)), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 1.4), 1.4])))
		_S.define(_v14, "v", _S.invoke(_S.read(_v14, "R"), "range", [35, 110]))
		_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "MOTE"), _S.binary("+", _S.read(_v14, "X"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), 4)), _S.binary("+", _S.read(_v14, "Y"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), 4)), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "v")), 15), _S.invoke(_S.read(_v14, "R"), "range", [0.35, 0.7]), _S.invoke(_S.read(_v14, "R"), "pick", [[_S.prop(_S.read(_v14, "C"), 6), _S.prop(_S.read(_v14, "C"), 5), _S.prop(_S.read(_v14, "C"), 5)]]), 0.6, _S.invoke(_S.read(_v14, "R"), "range", [0, 0.05])])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	var _v15 = _S.scope(_e)
	_S.define(_v15, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v15, "i"), 5)):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "a", _S.invoke(_S.read(_v16, "R"), "range", [0, _S.read(_v16, "TAU")]))
		_S.define(_v16, "d", _S.invoke(_S.read(_v16, "R"), "range", [14, 34]))
		_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "STAR"), _S.binary("+", _S.read(_v16, "X"), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.read(_v16, "d"))), _S.binary("+", _S.read(_v16, "Y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.read(_v16, "d")), 0.8)), 0, _S.unary("-", 4), _S.invoke(_S.read(_v16, "R"), "range", [0.22, 0.38]), (_S.prop(_S.read(_v16, "C"), 6) if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.5])) else _S.read(_v16, "WHITE")), _S.invoke(_S.read(_v16, "R"), "range", [1.6, 3]), _S.invoke(_S.read(_v16, "R"), "range", [0.08, 0.32])])
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "b"), "len"), _S.prop(_S.read(_e, "a"), "len"))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.set_prop(_S.read(_e, "s"), "len", 1.3, "*=", false)

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("+", _S.read(_e, "A"), _S.binary("*", _S.binary("/", _S.read(_e, "i"), 7), _S.read(_e, "TAU"))))
	return _S.merge([{"a": _S.read(_e, "a")}, {"gap": _S.invoke(_S.read(_e, "R"), "range", [0.55, 0.85])}, {"dr": _S.binary("+", _S.invoke(_S.read(_e, "R"), "range", [0.08, 0.4]), _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("-", _S.read(_e, "a"), _S.read(_e, "A"))])])))}, {"w": _S.binary("+", 0.7, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("-", _S.read(_e, "a"), _S.read(_e, "A"))])])))}])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "u", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.03), 0.37)]))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), 0.03), func(): return _S.binary("<", _S.read(_e, "u"), 1))):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "r", _S.binary("+", 10, _S.binary("*", 30, _S.invoke(_S.read(_v17, "ease"), "outCubic", [_S.read(_v17, "u")]))))
		_S.define(_v17, "brk", _S.call_value(_S.read(_v17, "smooth"), [0.12, 0.6, _S.read(_v17, "u")]))
		_S.define(_v17, "th", _S.invoke(_S.read(_v17, "Math"), "max", [1, _S.binary("*", 3.6, _S.invoke(_S.read(_v17, "Math"), "pow", [_S.binary("-", 1, _S.read(_v17, "u")), 1.2]))]))
		_S.define(_v17, "i", (7 if _S.truth(_S.binary("<", _S.read(_v17, "u"), 0.12)) else (6 if _S.truth(_S.binary("<", _S.read(_v17, "u"), 0.3)) else (5 if _S.truth(_S.binary("<", _S.read(_v17, "u"), 0.5)) else (4 if _S.truth(_S.binary("<", _S.read(_v17, "u"), 0.75)) else 3)))))
		_S.call_value(_S.read(_v17, "brokenRing"), [_S.read(_v17, "p"), _S.read(_v17, "X"), _S.read(_v17, "Y"), _S.read(_v17, "r"), _S.read(_v17, "th"), _S.read(_v17, "segs"), _S.read(_v17, "brk"), _S.prop(_S.read(_v17, "C"), _S.read(_v17, "i")), _S.prop(_S.read(_v17, "C"), _S.invoke(_S.read(_v17, "Math"), "max", [2, _S.binary("-", _S.read(_v17, "i"), 2)])), (1 if _S.truth(_S.binary("<", _S.read(_v17, "u"), 0.6)) else _S.binary("/", _S.binary("-", 1, _S.read(_v17, "u")), 0.4)), 1, 0])
		if _S.truth(_S.binary("<", _S.read(_v17, "u"), 0.6)):
			_S.invoke(_S.read(_v17, "p"), "glowRing", [_S.read(_v17, "X"), _S.read(_v17, "Y"), _S.read(_v17, "r"), 6, _S.prop(_S.read(_v17, "C"), 5), _S.binary("*", 0.35, _S.invoke(_S.read(_v17, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.read(_v17, "u"), 0.6)), 2]))])
	_S.invoke(_S.read(_e, "bits"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.define(_e, "f", _S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.04), 0.28))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "f"), 0), func(): return _S.binary("<", _S.read(_e, "f"), 1))):
		var _v18 = _S.scope(_e)
		_S.call_value(_S.read(_v18, "flare"), [_S.read(_v18, "p"), _S.read(_v18, "X"), _S.read(_v18, "Y"), _S.binary("*", 64, _S.invoke(_S.read(_v18, "Math"), "pow", [_S.binary("-", 1, _S.read(_v18, "f")), 1.3])), _S.binary("-", 1, _S.read(_v18, "f")), _S.read(_v18, "C")])
		_S.invoke(_S.read(_v18, "p"), "glow", [_S.read(_v18, "X"), _S.read(_v18, "Y"), 56, _S.prop(_S.read(_v18, "C"), 5), _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_v18, "f")))])
	var _v19 = _S.scope(_e)
	_S.define(_v19, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v19, "i"), _S.binary("-", _S.prop(_S.read(_v19, "KEYS"), "length"), 1))):
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v19, "t"), _S.prop(_S.prop(_S.read(_v19, "KEYS"), _S.read(_v19, "i")), 0)), func(): return _S.binary("<", _S.read(_v19, "t"), _S.prop(_S.prop(_S.read(_v19, "KEYS"), _S.binary("+", _S.read(_v19, "i"), 1)), 0)))):
			var _v20 = _S.scope(_v19)
			var _v21 = _S.prop(_S.read(_v20, "KEYS"), _S.read(_v20, "i"))
			_S.define(_v20, "sc", _S.prop(_v21, 1))
			_S.define(_v20, "th", _S.prop(_v21, 2))
			_S.define(_v20, "a", _S.prop(_v21, 3))
			_S.define(_v20, "cols", _S.prop(_v21, 4))
			_S.call_value(_S.read(_v20, "star"), [_S.read(_v20, "p"), _S.read(_v20, "X"), _S.read(_v20, "Y"), _S.read(_v20, "sp"), _S.read(_v20, "sc"), _S.read(_v20, "th"), _S.invoke(_S.read(_v20, "cols"), "map", [_S.function_value(_v20, "_f8")]), _S.read(_v20, "a"), 2.6])
		_v19 = _S.iteration(_v19)
		_S.write(_v19, "i", 1, "+=", true)
	_S.define(_e, "pop", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "t")), 0.05)]))
	if _S.truth(_S.binary(">", _S.read(_e, "pop"), 0.02)):
		var _v22 = _S.scope(_e)
		_S.invoke(_S.read(_v22, "p"), "glow", [_S.read(_v22, "X"), _S.read(_v22, "Y"), 44, _S.prop(_S.read(_v22, "C"), 5), _S.binary("*", 0.4, _S.read(_v22, "pop"))])
		_S.invoke(_S.read(_v22, "p"), "glow", [_S.read(_v22, "X"), _S.read(_v22, "Y"), 12, _S.read(_v22, "WHITE"), _S.binary("*", 0.6, _S.read(_v22, "pop"))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "j", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "C"), _S.read(_e, "j"))
