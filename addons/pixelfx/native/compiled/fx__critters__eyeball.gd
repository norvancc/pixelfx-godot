@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/eyeball.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "shadow", _S.import_value("fx/critters/_lib.js", "shadow"))
	_S.define(_e, "curve", _S.import_value("fx/critters/_lib.js", "curve"))
	_S.define(_e, "look", _S.function_value(_e, "_f0"))
	_S.define(_e, "at", _S.function_value(_e, "_f1"))
	_S.define(_e, "veins", _S.function_value(_e, "_f2"))
	_S.define(_e, "eye", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f10"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f13"))
	_S.define(_e, "meta", _S.merge([{"name": "Eyeball"}, {"desc": "A bloodshot eyeball floats in its fleshy lids: its glowing iris snaps from one look to the next, it blinks, and its nerve sways behind it as it bobs."}, {"tags": ["critter", "eyeball", "eye", "monster", "spooky", "float", "loop"]}, {"size": [96, 108]}, {"origin": [48, 100]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#2a1420", "#6a3040", "#b07078", "#dcbcb4", "#f4e9de", "#ffffff"]}, {"flesh": ["#1e0c16", "#4a1a2c", "#7c2c40", "#b04a58", "#e07a80"]}, {"iris": ["#0c2a14", "#1f6a2a", "#3fae3a", "#9be05a", "#e8ffb0"]}, {"hover": 48}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 18), _S.unary("-", 18), 36, 38]))
	_S.define(_e, "NERVE", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 20), _S.unary("-", 70), 40, 64]))
	_S.define(_e, "R", 13)
	_S.define(_e, "VEIN", _S.call_value(_S.read(_e, "hex"), ["#c42a3a"]))
	_S.define(_e, "LOOKS", [[0, 0, 0], [0.55, 4.2, _S.unary("-", 1.2)], [1.15, _S.unary("-", 4.4), 0.8], [1.95, 1.2, 3.4], [2.5, _S.unary("-", 2), _S.unary("-", 3.4)], [3, 0, 0]])
	_S.define(_e, "lid", _S.function_value(_e, "_f14"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "i", _S.binary("-", _S.prop(_S.read(_e, "LOOKS"), "length"), 1))
	while _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "i"), 0), func(): return _S.binary("<", _S.read(_e, "t"), _S.prop(_S.prop(_S.read(_e, "LOOKS"), _S.read(_e, "i")), 0)))):
		_S.write(_e, "i", 1, "-=", true)
	var _v0 = _S.prop(_S.read(_e, "LOOKS"), _S.read(_e, "i"))
	_S.define(_e, "t0", _S.prop(_v0, 0))
	_S.define(_e, "x1", _S.prop(_v0, 1))
	_S.define(_e, "y1", _S.prop(_v0, 2))
	var _v1 = _S.prop(_S.read(_e, "LOOKS"), _S.binary("%", _S.binary("-", _S.binary("+", _S.read(_e, "i"), _S.prop(_S.read(_e, "LOOKS"), "length")), 1), _S.prop(_S.read(_e, "LOOKS"), "length")))
	_S.define(_e, "x0", _S.prop(_v1, 1))
	_S.define(_e, "y0", _S.prop(_v1, 2))
	_S.define(_e, "u", _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "t0")), 0.08)]), 2.2]))
	return [_S.call_value(_S.read(_e, "lerp"), [_S.read(_e, "x0"), _S.read(_e, "x1"), _S.read(_e, "u")]), _S.call_value(_S.read(_e, "lerp"), [_S.read(_e, "y0"), _S.read(_e, "y1"), _S.read(_e, "u")])]

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "hover", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")))
	return _S.merge([{"x": _S.binary("*", 1.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))}, {"y": _S.binary("-", _S.unary("-", _S.read(_e, "hover")), _S.binary("*", 3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", 2, _S.read(_e, "a")), 0.4)])))}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "seed", _S.arg(_args, 0))
	_S.define(_e, "out", [])
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rng"), [_S.read(_e, "seed"), 77]))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 7)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v3, "i"), 7), _S.read(_v3, "TAU")), _S.invoke(_S.read(_v3, "r"), "range", [_S.unary("-", 0.3), 0.3])))
		_S.define(_v3, "d", _S.binary("-", _S.read(_v3, "R"), 0.5))
		_S.define(_v3, "pts", [[_S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "d")), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "d"))]])
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "k"), 4)):
			var _v5 = _S.scope(_v4)
			_S.write(_v5, "a", _S.invoke(_S.read(_v5, "r"), "range", [_S.unary("-", 0.35), 0.35]), "+=", false)
			_S.write(_v5, "d", _S.invoke(_S.read(_v5, "r"), "range", [1.2, 2.1]), "-=", false)
			_S.invoke(_S.read(_v5, "pts"), "push", [[_S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "d")), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "d"))]])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "k", 1, "+=", true)
		_S.invoke(_S.read(_v3, "out"), "push", [_S.read(_v3, "pts")])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "Fl", _S.arg(_args, 2))
	_S.define(_e, "I", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "seed", _S.arg(_args, 5))
	_S.invoke(_S.read(_e, "g"), "clear", [])
	var _v6 = _S.call_value(_S.read(_e, "look"), [_S.read(_e, "t")])
	_S.define(_e, "lx", _S.prop(_v6, 0))
	_S.define(_e, "ly", _S.prop(_v6, 1))
	_S.define(_e, "L", _S.call_value(_S.read(_e, "lid"), [_S.read(_e, "t")]))
	_S.define(_e, "V", _S.call_value(_S.read(_e, "veins"), [_S.read(_e, "seed")]))
	_S.define(_e, "lit", _S.function_value(_e, "_f4"))
	_S.invoke(_S.read(_e, "g"), "shade", [_S.unary("-", _S.read(_e, "R")), _S.unary("-", _S.read(_e, "R")), _S.read(_e, "R"), _S.read(_e, "R"), _S.function_value(_e, "_f5")])
	for _v7 in _S.array(_S.read(_e, "V")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "pts", _v7)
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "sh", _S.invoke(_S.read(_v9, "pts"), "map", [_S.function_value(_v9, "_f6")]))
		var _v11 = _S.scope(_v9)
		_S.define(_v11, "k", 1)
		while _S.truth(_S.binary("<", _S.read(_v11, "k"), _S.prop(_S.read(_v11, "sh"), "length"))):
			_S.invoke(_S.read(_v11, "g"), "line", [_S.prop(_S.prop(_S.read(_v11, "sh"), _S.binary("-", _S.read(_v11, "k"), 1)), 0), _S.prop(_S.prop(_S.read(_v11, "sh"), _S.binary("-", _S.read(_v11, "k"), 1)), 1), _S.prop(_S.prop(_S.read(_v11, "sh"), _S.read(_v11, "k")), 0), _S.prop(_S.prop(_S.read(_v11, "sh"), _S.read(_v11, "k")), 1), (_S.read(_v11, "VEIN") if _S.truth(_S.binary("<", _S.read(_v11, "k"), 2)) else _S.call_value(_S.read(_v11, "mix"), [_S.read(_v11, "VEIN"), _S.prop(_S.read(_v11, "C"), 3), 0.45]))])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "k", 1, "+=", true)
	_S.define(_e, "off", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "lx"), _S.read(_e, "ly")]))
	_S.define(_e, "fx", _S.binary("-", 1, _S.binary("*", _S.binary("*", 0.32, _S.binary("**", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "lx")]), _S.read(_e, "R")), 1.4)), 3)))
	_S.define(_e, "fy", _S.binary("-", 1, _S.binary("*", _S.binary("*", 0.32, _S.binary("**", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "ly")]), _S.read(_e, "R")), 1.4)), 3)))
	_S.define(_e, "ir", 6.4)
	_S.define(_e, "pr", _S.binary("+", 2, _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 2)]))))
	_S.invoke(_S.read(_e, "g"), "shade", [_S.binary("-", _S.binary("-", _S.read(_e, "lx"), _S.read(_e, "ir")), 1), _S.binary("-", _S.binary("-", _S.read(_e, "ly"), _S.read(_e, "ir")), 1), _S.binary("+", _S.binary("+", _S.read(_e, "lx"), _S.read(_e, "ir")), 1), _S.binary("+", _S.binary("+", _S.read(_e, "ly"), _S.read(_e, "ir")), 1), _S.function_value(_e, "_f7")])
	if _S.truth(_S.binary("<", _S.read(_e, "L"), 0.5)):
		_S.last([_S.invoke(_S.read(_e, "g"), "set", [_S.unary("-", 4), _S.unary("-", 5), _S.prop(_S.read(_e, "C"), 5)]), _S.invoke(_S.read(_e, "g"), "set", [_S.unary("-", 3), _S.unary("-", 5), _S.prop(_S.read(_e, "C"), 5)]), _S.invoke(_S.read(_e, "g"), "set", [_S.unary("-", 4), _S.unary("-", 4), _S.prop(_S.read(_e, "C"), 5)]), _S.invoke(_S.read(_e, "g"), "set", [1, _S.unary("-", 2), _S.prop(_S.read(_e, "C"), 5)])])
	_S.define(_e, "up", _S.call_value(_S.read(_e, "lerp"), [_S.binary("+", _S.unary("-", _S.read(_e, "R")), 3), _S.binary("*", _S.read(_e, "R"), 0.42), _S.read(_e, "L")]))
	_S.define(_e, "dn", _S.call_value(_S.read(_e, "lerp"), [_S.binary("-", _S.read(_e, "R"), 2.2), _S.binary("*", _S.read(_e, "R"), 0.42), _S.read(_e, "L")]))
	_S.define(_e, "flit", _S.function_value(_e, "_f8"))
	_S.invoke(_S.read(_e, "g"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "R")), 1), _S.binary("-", _S.unary("-", _S.read(_e, "R")), 1), _S.binary("+", _S.read(_e, "R"), 1), _S.binary("+", _S.read(_e, "R"), 1), _S.function_value(_e, "_f9")])
	_S.invoke(_S.read(_e, "g"), "outline", [_S.prop(_S.read(_e, "C"), 0)])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "k", _S.arg(_args, 2))
	return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("+", _S.unary("-", 4), _S.binary("/", _S.binary("+", _S.read(_e, "x"), 4), _S.read(_e, "k"))), _S.binary("+", _S.unary("-", 4.5), _S.binary("/", _S.binary("+", _S.read(_e, "y"), 4.5), _S.read(_e, "k")))]), _S.read(_e, "R"))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y")]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "R"))):
		return 0
	if _S.truth(_S.unary("!", _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("+", _S.read(_e, "x"), 2), _S.binary("+", _S.read(_e, "y"), 2.2)]), _S.read(_e, "R")))):
		return _S.prop(_S.read(_e, "C"), 2)
	return (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.call_value(_S.read(_e, "lit"), [_S.read(_e, "x"), _S.read(_e, "y"), 0.5])) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.call_value(_S.read(_e, "lit"), [_S.read(_e, "x"), _S.read(_e, "y"), 0.8])) else _S.prop(_S.read(_e, "C"), 3)))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v10 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v10, 0))
	_S.define(_e, "y", _S.prop(_v10, 1))
	return [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "lx"), 0.35), _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y")]), _S.read(_e, "R"))))), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "ly"), 0.35), _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y")]), _S.read(_e, "R")))))]

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "lx")), _S.binary("*", _S.read(_e, "ir"), _S.read(_e, "fx"))))
	_S.define(_e, "dy", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ly")), _S.binary("*", _S.read(_e, "ir"), _S.read(_e, "fy"))))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "d"), 1), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y")]), _S.binary("-", _S.read(_e, "R"), 0.5)))):
		return 0
	_S.define(_e, "pd", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "lx")), _S.read(_e, "fx")), _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ly")), _S.read(_e, "fy"))]))
	if _S.truth(_S.binary("<", _S.read(_e, "pd"), _S.read(_e, "pr"))):
		return _S.prop(_S.read(_e, "C"), 0)
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.86)):
		return _S.prop(_S.read(_e, "I"), 0)
	_S.define(_e, "ang", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]))
	_S.define(_e, "streak", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "ang"), 9), _S.binary("*", _S.read(_e, "d"), 4))]), 0.5))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.5)):
		return (_S.prop(_S.read(_e, "I"), 4) if _S.truth(_S.read(_e, "streak")) else _S.prop(_S.read(_e, "I"), 3))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.7)):
		return (_S.prop(_S.read(_e, "I"), 3) if _S.truth(_S.read(_e, "streak")) else _S.prop(_S.read(_e, "I"), 2))
	return (_S.prop(_S.read(_e, "I"), 2) if _S.truth(_S.read(_e, "streak")) else _S.prop(_S.read(_e, "I"), 1))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "k", _S.arg(_args, 2))
	return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("+", _S.unary("-", 4), _S.binary("/", _S.binary("+", _S.read(_e, "x"), 4), _S.read(_e, "k"))), _S.binary("+", _S.unary("-", 5), _S.binary("/", _S.binary("+", _S.read(_e, "y"), 5), _S.read(_e, "k")))]), _S.binary("+", _S.read(_e, "R"), 0.6))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y")]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "R"), 0.6))):
		return 0
	_S.define(_e, "ue", _S.binary("+", _S.read(_e, "up"), _S.binary("*", 1.8, _S.binary("**", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "R")), 2))))
	_S.define(_e, "de", _S.binary("-", _S.read(_e, "dn"), _S.binary("*", 1.4, _S.binary("**", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "R")), 2))))
	_S.define(_e, "tone", (_S.prop(_S.read(_e, "Fl"), 1) if _S.truth(_S.unary("!", _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("+", _S.read(_e, "x"), 2), _S.binary("+", _S.read(_e, "y"), 2.2)]), _S.binary("+", _S.read(_e, "R"), 0.6)))) else (_S.prop(_S.read(_e, "Fl"), 4) if _S.truth(_S.call_value(_S.read(_e, "flit"), [_S.read(_e, "x"), _S.read(_e, "y"), 0.55])) else (_S.prop(_S.read(_e, "Fl"), 3) if _S.truth(_S.call_value(_S.read(_e, "flit"), [_S.read(_e, "x"), _S.read(_e, "y"), 0.85])) else _S.prop(_S.read(_e, "Fl"), 2)))))
	if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.read(_e, "ue"))):
		return (_S.prop(_S.read(_e, "Fl"), 0) if _S.truth(_S.binary(">", _S.read(_e, "y"), _S.binary("-", _S.read(_e, "ue"), 1.2))) else _S.read(_e, "tone"))
	if _S.truth(_S.binary(">", _S.read(_e, "y"), _S.read(_e, "de"))):
		return (_S.prop(_S.read(_e, "Fl"), 0) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.binary("+", _S.read(_e, "de"), 1.1))) else (_S.prop(_S.read(_e, "Fl"), 3) if _S.truth(_S.binary("===", _S.read(_e, "tone"), _S.prop(_S.read(_e, "Fl"), 4))) else _S.read(_e, "tone")))
	return 0

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "Fl", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "flesh"), 5]))
	_S.define(_e, "I", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "iris"), 5]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "ng", _S.invoke(_S.read(_e, "NERVE"), "clear", []))
	var _v12 = _S.scope(_e)
	_S.define(_v12, "s", 0)
	while _S.truth(_S.binary("<=", _S.read(_v12, "s"), 20)):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "B", _S.call_value(_S.read(_v13, "at"), [_S.binary("-", _S.read(_v13, "t"), _S.binary("*", _S.read(_v13, "s"), 0.035)), _S.prop(_S.read(_v13, "o"), "hover")]))
		_S.define(_v13, "sw", _S.binary("*", _S.binary("*", 2.6, _S.binary("**", _S.binary("/", _S.read(_v13, "s"), 20), 1.3)), _S.invoke(_S.read(_v13, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v13, "t"), _S.read(_v13, "D")), _S.read(_v13, "TAU")), 2), _S.binary("*", _S.read(_v13, "s"), 0.16))])))
		_S.define(_v13, "r", _S.call_value(_S.read(_v13, "lerp"), [2, 0.6, _S.binary("/", _S.read(_v13, "s"), 20)]))
		_S.define(_v13, "cx", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v13, "B"), "x"), 1), _S.read(_v13, "sw")))
		_S.define(_v13, "cy", _S.binary("+", _S.binary("-", _S.binary("+", _S.prop(_S.read(_v13, "B"), "y"), _S.read(_v13, "R")), 2), _S.read(_v13, "s")))
		_S.invoke(_S.read(_v13, "ng"), "shade", [_S.binary("-", _S.binary("-", _S.read(_v13, "cx"), _S.read(_v13, "r")), 1), _S.binary("-", _S.read(_v13, "cy"), 1), _S.binary("+", _S.binary("+", _S.read(_v13, "cx"), _S.read(_v13, "r")), 1), _S.binary("+", _S.read(_v13, "cy"), 1), _S.function_value(_v13, "_f11")])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "s", 0.5, "+=", false)
	_S.invoke(_S.read(_e, "ng"), "outline", [_S.prop(_S.read(_e, "Fl"), 0)])
	_S.invoke(_S.read(_e, "ng"), "draw", [_S.read(_e, "p")])
	_S.define(_e, "g", _S.read(_e, "GRID"))
	_S.call_value(_S.read(_e, "eye"), [_S.read(_e, "g"), _S.read(_e, "C"), _S.read(_e, "Fl"), _S.read(_e, "I"), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed")])
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p"), 1, _S.prop(_S.read(_e, "S"), "x"), _S.prop(_S.read(_e, "S"), "y")])
	var _v14 = _S.call_value(_S.read(_e, "look"), [_S.read(_e, "t")])
	_S.define(_e, "lx", _S.prop(_v14, 0))
	_S.define(_e, "ly", _S.prop(_v14, 1))
	_S.define(_e, "snap", _S.invoke(_S.read(_e, "Math"), "max", _S.concat([_S.array(_S.invoke(_S.read(_e, "LOOKS"), "map", [_S.function_value(_e, "_f12")]))])))
	_S.define(_e, "open", _S.binary("-", 1, _S.call_value(_S.read(_e, "lid"), [_S.read(_e, "t")])))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_e, "S"), "x"), _S.read(_e, "lx")), _S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.read(_e, "ly")), 15, _S.prop(_S.read(_e, "I"), 3), _S.binary("*", _S.binary("+", 0.5, _S.binary("*", 0.3, _S.read(_e, "snap"))), _S.read(_e, "open"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_e, "S"), "x"), _S.read(_e, "lx")), _S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.read(_e, "ly")), 5, _S.prop(_S.read(_e, "I"), 4), _S.binary("*", 0.4, _S.read(_e, "open"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "S"), "x"), _S.prop(_S.read(_e, "S"), "y"), 50, _S.prop(_S.read(_e, "I"), 1), 0.3])
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), 8)):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "sp", _S.binary("*", (1 if _S.truth(_S.binary("%", _S.read(_v17, "i"), 2)) else _S.unary("-", 1)), (1 if _S.truth(_S.binary("%", _S.read(_v17, "i"), 3)) else 2)))
		_S.define(_v17, "a0", _S.binary("/", _S.binary("*", _S.read(_v17, "i"), _S.read(_v17, "TAU")), 8))
		_S.define(_v17, "rr", _S.binary("+", 19, _S.binary("*", _S.binary("%", _S.read(_v17, "i"), 3), 2)))
		_S.define(_v17, "prev", null)
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "k", 5)
		while _S.truth(_S.binary(">=", _S.read(_v18, "k"), 0)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "a", _S.binary("-", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v19, "t"), _S.read(_v19, "D")), _S.read(_v19, "TAU")), _S.read(_v19, "sp")), _S.read(_v19, "a0")), _S.binary("*", _S.binary("*", _S.read(_v19, "sp"), _S.read(_v19, "k")), 0.035)))
			_S.define(_v19, "z", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]))
			_S.define(_v19, "x", _S.binary("+", _S.prop(_S.read(_v19, "S"), "x"), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "rr"))))
			_S.define(_v19, "y", _S.binary("-", _S.binary("+", _S.prop(_S.read(_v19, "S"), "y"), _S.binary("*", _S.read(_v19, "z"), 5)), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), 3)))
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v19, "z"), 0), func(): return _S.binary("<", _S.invoke(_S.read(_v19, "Math"), "hypot", [_S.binary("-", _S.read(_v19, "x"), _S.prop(_S.read(_v19, "S"), "x")), _S.binary("-", _S.read(_v19, "y"), _S.prop(_S.read(_v19, "S"), "y"))]), _S.binary("+", _S.read(_v19, "R"), 1)))):
				var _v20 = _S.scope(_v19)
				_S.write(_v20, "prev", null, "=", false)
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "k", 1, "-=", true)
				continue
			if _S.truth(_S.logical("&&", _S.read(_v19, "prev"), func(): return _S.binary(">", _S.read(_v19, "k"), 0))):
				_S.invoke(_S.read(_v19, "p"), "line", [_S.prop(_S.read(_v19, "prev"), 0), _S.prop(_S.read(_v19, "prev"), 1), _S.read(_v19, "x"), _S.read(_v19, "y"), _S.prop(_S.read(_v19, "I"), 2), _S.binary("+", 0.4, _S.binary("*", _S.binary("-", 5, _S.read(_v19, "k")), 0.12))])
			if _S.truth(_S.binary("===", _S.read(_v19, "k"), 0)):
				_S.last([_S.invoke(_S.read(_v19, "p"), "px", [_S.read(_v19, "x"), _S.read(_v19, "y"), (_S.prop(_S.read(_v19, "I"), 4) if _S.truth(_S.binary(">", _S.read(_v19, "z"), 0)) else _S.prop(_S.read(_v19, "I"), 3))]), _S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "x"), _S.read(_v19, "y"), 5, _S.prop(_S.read(_v19, "I"), 3), 0.45])])
			_S.write(_v19, "prev", [_S.read(_v19, "x"), _S.read(_v19, "y")], "=", false)
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "k", 1, "-=", true)
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.invoke(_S.read(_e, "Math"), "max", [0.6, _S.read(_e, "r")])))
	if _S.truth(_S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), 1), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy"))]), 0.5))):
		return 0
	return (_S.prop(_S.read(_e, "Fl"), 4) if _S.truth(_S.binary("<", _S.read(_e, "v"), _S.unary("-", 0.35))) else (_S.prop(_S.read(_e, "Fl"), 3) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.4)) else _S.prop(_S.read(_e, "Fl"), 2)))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v15 = _S.arg(_args, 0)
	_S.define(_e, "t0", _S.prop(_v15, 0))
	return _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.call_value(_S.read(_e, "wrap"), [_S.binary("+", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "t0")), _S.binary("/", _S.read(_e, "D"), 2)), _S.read(_e, "D")]), _S.binary("/", _S.read(_e, "D"), 2))]), 0.2))])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "I", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "iris"), 5]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.call_value(_S.read(_e, "shadow"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "S"), "x"), 0, 10, 1.5, _S.call_value(_S.read(_e, "hex"), ["#0d0a12"]), 0.5])
	var _v21 = _S.scope(_e)
	_S.define(_v21, "x", _S.unary("-", 26))
	while _S.truth(_S.binary("<=", _S.read(_v21, "x"), 26)):
		_S.invoke(_S.read(_v21, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_v21, "S"), "x"), _S.read(_v21, "x")), _S.unary("-", 1), 18, _S.prop(_S.read(_v21, "I"), 2), _S.binary("*", 0.15, _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v21, "Math"), "abs", [_S.read(_v21, "x")]), 34)))])
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "x", 6, "+=", false)
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.binary("/", _S.binary("-", _S.read(_e, "t"), 1.74), 0.18))]) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), 1.74), func(): return _S.binary("<", _S.read(_e, "t"), 1.92))) else 0)
