@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/parry.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "star", _S.import_value("fx/impacts/_lib.js", "star"))
	_S.define(_e, "brokenRing", _S.import_value("fx/impacts/_lib.js", "brokenRing"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Parry"}, {"desc": "Two blades clash: their edges flash in an X, a white four-point star rings out, a ring breaks into arcs and a fan of gold sparks sprays up and rains down."}, {"tags": ["impact", "parry", "block", "clash", "sword", "metal", "sparks", "one-shot"]}, {"size": [200, 112]}, {"origin": [100, 96]}, {"duration": 1}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#2a1a08", "#6a4410", "#b07a1a", "#e8b030", "#ffe066", "#fff6c4", "#ffffff"]}, {"height": 30}, {"seed": 11}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "X", 0)
	_S.define(_e, "Y", _S.unary("-", _S.prop(_S.read(_e, "o"), "height")))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "sp", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 8)):
		_S.invoke(_S.read(_v0, "sp"), "push", [_S.merge([{"a": _S.binary("+", _S.binary("/", _S.binary("*", _S.read(_v0, "i"), _S.prop(_S.read(_v0, "Math"), "PI")), 4), _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 0.04), 0.04]))}, {"len": (_S.invoke(_S.read(_v0, "R"), "range", [6, 8]) if _S.truth(_S.binary("%", _S.read(_v0, "i"), 2)) else (_S.invoke(_S.read(_v0, "R"), "range", [19, 22]) if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v0, "i"), 4), 0)) else _S.invoke(_S.read(_v0, "R"), "range", [14, 17])))}, {"w": (1.2 if _S.truth(_S.binary("%", _S.read(_v0, "i"), 2)) else 2.2)}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.define(_e, "segs", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 6}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "edges", [_S.binary("+", _S.unary("-", 0.62), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.08), 0.08])), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "Math"), "PI"), 0.62), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.08), 0.08]))])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.read(_e, "Y"), 60, _S.prop(_S.read(_e, "C"), 4), 0.65, 0.4])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.read(_e, "Y"), 22, _S.read(_e, "WHITE"), 0.8, 0.08])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "i"), 24)):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "s", (1 if _S.truth(_S.binary("%", _S.read(_v2, "i"), 2)) else _S.unary("-", 1)))
		_S.define(_v2, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v2, "Math"), "PI")), 2), _S.binary("*", _S.read(_v2, "s"), _S.invoke(_S.read(_v2, "R"), "range", [0.3, 1.3]))))
		_S.define(_v2, "v", _S.invoke(_S.read(_v2, "R"), "range", [130, 290]))
		_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "SPARK"), _S.binary("+", _S.read(_v2, "X"), _S.binary("*", _S.read(_v2, "s"), _S.invoke(_S.read(_v2, "R"), "range", [1, 3]))), _S.read(_v2, "Y"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), _S.read(_v2, "v")), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), _S.read(_v2, "v")), _S.invoke(_S.read(_v2, "R"), "range", [0.45, 0.85]), _S.read(_v2, "WHITE"), 1, (_S.invoke(_S.read(_v2, "R"), "range", [0.02, 0.07]) if _S.truth(_S.binary(">", _S.read(_v2, "i"), 17)) else 0)])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "i", 1, "+=", true)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 8)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "a", _S.invoke(_S.read(_v4, "R"), "range", [0, _S.read(_v4, "TAU")]))
		_S.define(_v4, "v", _S.invoke(_S.read(_v4, "R"), "range", [40, 110]))
		_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "MOTE"), _S.read(_v4, "X"), _S.read(_v4, "Y"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "v")), 20), _S.invoke(_S.read(_v4, "R"), "range", [0.3, 0.55]), _S.invoke(_S.read(_v4, "R"), "pick", [[_S.prop(_S.read(_v4, "C"), 5), _S.prop(_S.read(_v4, "C"), 6)]]), 0.6, _S.invoke(_S.read(_v4, "R"), "range", [0, 0.04])])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), 3)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "a", _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")]))
		_S.define(_v6, "d", _S.invoke(_S.read(_v6, "R"), "range", [12, 26]))
		_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "STAR"), _S.binary("+", _S.read(_v6, "X"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "d"))), _S.binary("+", _S.read(_v6, "Y"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "d"))), 0, _S.unary("-", 3), _S.invoke(_S.read(_v6, "R"), "range", [0.22, 0.34]), _S.read(_v6, "WHITE"), _S.invoke(_S.read(_v6, "R"), "range", [1.6, 2.6]), _S.invoke(_S.read(_v6, "R"), "range", [0.1, 0.3])])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 6), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.1), 0.1]))}, {"gap": _S.invoke(_S.read(_e, "R"), "range", [0.55, 0.8])}, {"dr": _S.invoke(_S.read(_e, "R"), "range", [0.1, 0.35])}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.03), 0.36))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), 1))):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "r", _S.binary("+", 8, _S.binary("*", 24, _S.invoke(_S.read(_v7, "ease"), "outCubic", [_S.read(_v7, "u")]))))
		_S.define(_v7, "brk", _S.call_value(_S.read(_v7, "smooth"), [0.15, 0.6, _S.read(_v7, "u")]))
		_S.define(_v7, "i", (6 if _S.truth(_S.binary("<", _S.read(_v7, "u"), 0.15)) else (5 if _S.truth(_S.binary("<", _S.read(_v7, "u"), 0.35)) else (4 if _S.truth(_S.binary("<", _S.read(_v7, "u"), 0.6)) else 3))))
		_S.call_value(_S.read(_v7, "brokenRing"), [_S.read(_v7, "p"), _S.read(_v7, "X"), _S.read(_v7, "Y"), _S.read(_v7, "r"), _S.invoke(_S.read(_v7, "Math"), "max", [1, _S.binary("*", 2.6, _S.invoke(_S.read(_v7, "Math"), "pow", [_S.binary("-", 1, _S.read(_v7, "u")), 1.2]))]), _S.read(_v7, "segs"), _S.read(_v7, "brk"), _S.prop(_S.read(_v7, "C"), _S.read(_v7, "i")), _S.prop(_S.read(_v7, "C"), _S.invoke(_S.read(_v7, "Math"), "max", [2, _S.binary("-", _S.read(_v7, "i"), 2)])), (1 if _S.truth(_S.binary("<", _S.read(_v7, "u"), 0.6)) else _S.binary("/", _S.binary("-", 1, _S.read(_v7, "u")), 0.4)), 1, 0])
		if _S.truth(_S.binary("<", _S.read(_v7, "u"), 0.5)):
			_S.invoke(_S.read(_v7, "p"), "glowRing", [_S.read(_v7, "X"), _S.read(_v7, "Y"), _S.read(_v7, "r"), 5, _S.prop(_S.read(_v7, "C"), 4), _S.binary("*", 0.3, _S.binary("-", 1, _S.binary("/", _S.read(_v7, "u"), 0.5)))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.058)):
		for _v8 in _S.array(_S.read(_e, "edges")):
			var _v9 = _S.scope(_e)
			_S.define(_v9, "a", _v8)
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "ca", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]))
			_S.define(_v10, "sa", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]))
			_S.define(_v10, "L", (26 if _S.truth(_S.binary("<", _S.read(_v10, "t"), 0.025)) else 32))
			_S.define(_v10, "k", (1 if _S.truth(_S.binary("<", _S.read(_v10, "t"), 0.025)) else 0.6))
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "d", _S.unary("-", _S.read(_v11, "L")))
			while _S.truth(_S.binary("<=", _S.read(_v11, "d"), _S.read(_v11, "L"))):
				var _v12 = _S.scope(_v11)
				_S.define(_v12, "q", _S.binary("/", _S.invoke(_S.read(_v12, "Math"), "abs", [_S.read(_v12, "d")]), _S.read(_v12, "L")))
				_S.invoke(_S.read(_v12, "p"), "dot", [_S.binary("+", _S.read(_v12, "X"), _S.binary("*", _S.read(_v12, "ca"), _S.read(_v12, "d"))), _S.binary("+", _S.read(_v12, "Y"), _S.binary("*", _S.read(_v12, "sa"), _S.read(_v12, "d"))), (_S.read(_v12, "WHITE") if _S.truth(_S.binary("<", _S.read(_v12, "q"), 0.4)) else (_S.prop(_S.read(_v12, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v12, "q"), 0.75)) else _S.prop(_S.read(_v12, "C"), 4))), (1 if _S.truth(_S.binary("<", _S.read(_v12, "q"), 0.6)) else _S.binary("*", _S.read(_v12, "k"), _S.binary("-", 1.3, _S.read(_v12, "q"))))])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "d", 0.5, "+=", false)
			_S.invoke(_S.read(_v10, "p"), "glowLine", [_S.binary("-", _S.read(_v10, "X"), _S.binary("*", _S.read(_v10, "ca"), _S.read(_v10, "L"))), _S.binary("-", _S.read(_v10, "Y"), _S.binary("*", _S.read(_v10, "sa"), _S.read(_v10, "L"))), _S.binary("+", _S.read(_v10, "X"), _S.binary("*", _S.read(_v10, "ca"), _S.read(_v10, "L"))), _S.binary("+", _S.read(_v10, "Y"), _S.binary("*", _S.read(_v10, "sa"), _S.read(_v10, "L"))), 4, _S.prop(_S.read(_v10, "C"), 5), _S.binary("*", 0.35, _S.read(_v10, "k"))])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.025)):
		_S.call_value(_S.read(_e, "star"), [_S.read(_e, "p"), _S.read(_e, "X"), _S.read(_e, "Y"), _S.read(_e, "sp"), 1, 1, [_S.prop(_S.read(_e, "C"), 4), _S.read(_e, "WHITE"), _S.read(_e, "WHITE"), _S.read(_e, "WHITE")], 1, 2.6])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.058)):
			_S.call_value(_S.read(_e, "star"), [_S.read(_e, "p"), _S.read(_e, "X"), _S.read(_e, "Y"), _S.read(_e, "sp"), 1.25, 0.65, [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE")], 1, 2.6])
		else:
			if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.092)):
				_S.call_value(_S.read(_e, "star"), [_S.read(_e, "p"), _S.read(_e, "X"), _S.read(_e, "Y"), _S.read(_e, "sp"), 1.4, 0.3, [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)], 1, 2])
	_S.define(_e, "pop", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "t")), 0.05)]))
	if _S.truth(_S.binary(">", _S.read(_e, "pop"), 0.02)):
		var _v13 = _S.scope(_e)
		_S.invoke(_S.read(_v13, "p"), "glow", [_S.read(_v13, "X"), _S.read(_v13, "Y"), 30, _S.prop(_S.read(_v13, "C"), 4), _S.binary("*", 0.5, _S.read(_v13, "pop"))])
		_S.invoke(_S.read(_v13, "p"), "glow", [_S.read(_v13, "X"), _S.read(_v13, "Y"), 10, _S.read(_v13, "WHITE"), _S.binary("*", 0.4, _S.read(_v13, "pop"))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
