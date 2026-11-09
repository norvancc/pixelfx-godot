@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/spell-charge.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "loopNoise", _S.import_value("core/index.js", "loopNoise"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "mote", _S.import_value("fx/arcane/_lib.js", "mote"))
	_S.define(_e, "streak", _S.import_value("fx/arcane/_lib.js", "streak"))
	_S.define(_e, "arc", _S.import_value("fx/arcane/_lib.js", "arc"))
	_S.define(_e, "drawArc", _S.import_value("fx/arcane/_lib.js", "drawArc"))
	_S.define(_e, "orb", _S.function_value(_e, "_f0"))
	_S.define(_e, "ringAt", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "D", 1.6)
	_S.define(_e, "HX", 15)
	_S.define(_e, "HY", _S.unary("-", 22))
	_S.define(_e, "RINGS", 4)
	_S.define(_e, "RT", 0.5)
	_S.define(_e, "meta", _S.merge([{"name": "Spell charge"}, {"desc": "Energy gathers in the caster's hand: streaks and motes spiral in, rings collapse into a swelling orb that crackles with arcs, ready to fire."}, {"tags": ["arcane", "charge", "spell", "orb", "cast", "magic", "loop"]}, {"size": [120, 86]}, {"origin": [44, 80]}, {"duration": _S.read(_e, "D")}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HOLD", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}, {"crouch": 4}, {"lean": 2}, {"fx": 18}, {"fy": _S.unary("-", 22)}, {"bx": 11}, {"by": _S.unary("-", 17)}, {"ffx": 10}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "act", _S.merge([{"poses": [[_S.unary("-", 0.46), _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}])], [_S.unary("-", 0.12), _S.merge([_S.read(_e, "HOLD"), {"crouch": 3}])], [0, _S.read(_e, "HOLD")], [0.4, _S.merge([_S.read(_e, "HOLD"), {"crouch": 5}])], [0.8, _S.merge([_S.read(_e, "HOLD"), {"lean": 3}])], [1.2, _S.merge([_S.read(_e, "HOLD"), {"crouch": 5}])], [1.6, _S.read(_e, "HOLD")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "landings", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "RINGS")}]), _S.function_value(_e, "_f13")]))
	_S.define(_e, "sinceLast", _S.function_value(_e, "_f14"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "r", _S.arg(_args, 4))
	_S.define(_e, "t", _S.arg(_args, 5))
	_S.define(_e, "ph", _S.arg(_args, 6))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 8)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v1, "i"), 8), _S.read(_v1, "TAU")), _S.binary("*", _S.binary("*", _S.read(_v1, "ph"), _S.binary("/", _S.read(_v1, "TAU"), 8)), 3)))
		_S.define(_v1, "l", _S.binary("*", _S.binary("+", 1.5, _S.binary("*", 4.5, _S.invoke(_S.read(_v1, "Math"), "abs", [_S.call_value(_S.read(_v1, "loopNoise"), [_S.read(_v1, "ph"), 3, _S.binary("+", _S.binary("*", _S.read(_v1, "i"), 7), 1)])]))), (0.7 if _S.truth(_S.binary("%", _S.read(_v1, "i"), 2)) else 1)))
		_S.define(_v1, "x0", _S.binary("+", _S.read(_v1, "x"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.binary("+", _S.read(_v1, "r"), 1.2))))
		_S.define(_v1, "y0", _S.binary("+", _S.read(_v1, "y"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.binary("+", _S.read(_v1, "r"), 1.2))))
		_S.invoke(_S.read(_v1, "p"), "line", [_S.read(_v1, "x0"), _S.read(_v1, "y0"), _S.binary("+", _S.read(_v1, "x0"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "l"))), _S.binary("+", _S.read(_v1, "y0"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "l"))), _S.function_value(_v1, "_f1"), _S.function_value(_v1, "_f2")])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "r"), 1.3), _S.prop(_S.read(_e, "C"), 4)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "r"), 0.3), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.12)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.12)), _S.binary("*", _S.read(_e, "r"), 0.8), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.5), _S.read(_e, "WHITE")])
	_S.define(_e, "R", _S.call_value(_S.read(_e, "rng"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 15)]), 77]))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 3)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
		_S.define(_v3, "pts", _S.prop(_S.prop(_S.call_value(_S.read(_v3, "arc"), [_S.read(_v3, "R"), _S.binary("+", _S.read(_v3, "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "r")), 0.4)), _S.binary("+", _S.read(_v3, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "r")), 0.4)), _S.binary("+", _S.read(_v3, "x"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.binary("+", _S.read(_v3, "a"), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 0.6), 0.6]))]), _S.binary("+", _S.read(_v3, "r"), 0.6))), _S.binary("+", _S.read(_v3, "y"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.binary("+", _S.read(_v3, "a"), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 0.6), 0.6]))]), _S.binary("+", _S.read(_v3, "r"), 0.6))), _S.merge([{"jag": 0.45}, {"forks": 0}])]), 0), "pts"))
		_S.invoke(_S.read(_v3, "p"), "polyline", [_S.read(_v3, "pts"), _S.function_value(_v3, "_f3")])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.5)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.62)), _S.read(_e, "WHITE")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.4)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.prop(_S.read(_e, "C"), 5)))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.6)) else _S.binary("-", 1.6, _S.read(_e, "u")))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "C"), 6))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "rr", _S.arg(_args, 4))
	_S.define(_e, "sy", _S.arg(_args, 5))
	_S.define(_e, "rot", _S.arg(_args, 6))
	_S.define(_e, "q", _S.arg(_args, 7))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.binary("*", _S.read(_e, "rr"), _S.read(_e, "TAU")), 1.4)]))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "rot")]))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "rot")]))
	_S.define(_e, "col", (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "q"), 0.85)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "q"), 0.55)) else _S.prop(_S.read(_e, "C"), 5))))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "q"), 3)]))
	var _v4 = _S.scope(_e)
	_S.define(_v4, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "j"), _S.read(_v4, "n"))):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "g", _S.binary("*", _S.binary("/", _S.read(_v5, "j"), _S.read(_v5, "n")), _S.read(_v5, "TAU")))
		_S.define(_v5, "lx", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "g")]), _S.read(_v5, "rr")))
		_S.define(_v5, "ly", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "g")]), _S.read(_v5, "rr")), _S.read(_v5, "sy")))
		_S.define(_v5, "px", _S.binary("-", _S.binary("+", _S.read(_v5, "x"), _S.binary("*", _S.read(_v5, "lx"), _S.read(_v5, "c"))), _S.binary("*", _S.read(_v5, "ly"), _S.read(_v5, "s"))))
		_S.define(_v5, "py", _S.binary("+", _S.binary("+", _S.read(_v5, "y"), _S.binary("*", _S.read(_v5, "lx"), _S.read(_v5, "s"))), _S.binary("*", _S.read(_v5, "ly"), _S.read(_v5, "c"))))
		if _S.truth(_S.binary(">", _S.read(_v5, "py"), _S.unary("-", 0.5))):
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "j", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v5, "p"), "dot", [_S.read(_v5, "px"), _S.read(_v5, "py"), _S.read(_v5, "col"), _S.read(_v5, "a")])
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v5, "j"), 10), 0)):
			_S.invoke(_S.read(_v5, "p"), "glow", [_S.read(_v5, "px"), _S.read(_v5, "py"), 5, _S.prop(_S.read(_v5, "C"), 5), _S.binary("*", 0.12, _S.read(_v5, "a"))])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "j", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 30)]))
	_S.define(_e, "since", _S.call_value(_S.read(_e, "sinceLast"), [_S.read(_e, "t")]))
	_S.define(_e, "swell", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.read(_e, "since"), 0.07), 2))]), _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.read(_e, "since"), 0.18), 2))]))))
	_S.define(_e, "r", _S.binary("+", _S.binary("+", 6.1, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 4)]))), _S.binary("*", 1.4, _S.read(_e, "swell"))))
	_S.define(_e, "jit", ((1 if _S.truth(_S.binary("%", _S.read(_e, "f"), 2)) else _S.unary("-", 1)) if _S.truth(_S.binary(">", _S.read(_e, "swell"), 0.4)) else 0))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "HX"), _S.read(_e, "jit")))
	_S.define(_e, "y", _S.read(_e, "HY"))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 110, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 3), 1), _S.function_value(_e, "_f6"), _S.function_value(_e, "_f7")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 56, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 3), 2), _S.function_value(_e, "_f9"), _S.function_value(_e, "_f10")])
	var _v10 = _S.scope(_e)
	_S.define(_v10, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "k"), _S.read(_v10, "RINGS"))):
		for _v11 in _S.array([_S.unary("-", _S.read(_v10, "D")), 0]):
			var _v12 = _S.scope(_v10)
			_S.define(_v12, "off", _v11)
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "q", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v13, "t"), _S.binary("/", _S.binary("*", _S.read(_v13, "k"), _S.read(_v13, "D")), _S.read(_v13, "RINGS"))), _S.read(_v13, "off")), _S.read(_v13, "RT")))
			if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v13, "q"), 0), func(): return _S.binary(">=", _S.read(_v13, "q"), 1))):
				continue
			_S.define(_v13, "rr", _S.binary("+", _S.binary("+", _S.read(_v13, "r"), 1.5), _S.binary("*", 22, _S.binary("-", 1, _S.invoke(_S.read(_v13, "ease"), "inQuad", [_S.read(_v13, "q")])))))
			_S.define(_v13, "shape", _S.prop([[1, 0], [0.38, 0.55], [1, 0], [0.42, _S.unary("-", 0.7)]], _S.read(_v13, "k")))
			_S.call_value(_S.read(_v13, "ringAt"), [_S.read(_v13, "p"), _S.read(_v13, "C"), _S.read(_v13, "x"), _S.read(_v13, "y"), _S.read(_v13, "rr"), _S.prop(_S.read(_v13, "shape"), 0), _S.prop(_S.read(_v13, "shape"), 1), _S.read(_v13, "q")])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "k", 1, "+=", true)
	_S.call_value(_S.read(_e, "orb"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.read(_e, "t"), _S.read(_e, "ph")])
	_S.define(_e, "w", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "f"), 2)]))
	_S.define(_e, "Rw", _S.call_value(_S.read(_e, "rng"), [_S.read(_e, "S"), _S.read(_e, "w"), 3]))
	_S.define(_e, "n", _S.binary("+", (1 if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Rw"), "next", []), 0.6)) else 0), (1 if _S.truth(_S.binary(">", _S.read(_e, "swell"), 0.3)) else 0)))
	_S.define(_e, "fresh", (0.8 if _S.truth(_S.binary("===", _S.binary("%", _S.read(_e, "f"), 2), 0)) else 0.4))
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), _S.read(_v14, "n"))):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "a", _S.invoke(_S.read(_v15, "Rw"), "range", [0, _S.read(_v15, "TAU")]))
		_S.define(_v15, "L", _S.binary("*", _S.invoke(_S.read(_v15, "Rw"), "range", [5, 10]), _S.binary("+", 1, _S.binary("*", _S.read(_v15, "swell"), 0.4))))
		_S.define(_v15, "a1", _S.binary("+", _S.read(_v15, "a"), _S.invoke(_S.read(_v15, "Rw"), "range", [_S.unary("-", 0.5), 0.5])))
		_S.define(_v15, "x0", _S.binary("+", _S.read(_v15, "x"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.binary("+", _S.read(_v15, "r"), 0.5))))
		_S.define(_v15, "y0", _S.binary("+", _S.read(_v15, "y"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.binary("+", _S.read(_v15, "r"), 0.5))))
		_S.define(_v15, "x1", _S.binary("+", _S.read(_v15, "x0"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a1")]), _S.read(_v15, "L"))))
		_S.define(_v15, "y1", _S.invoke(_S.read(_v15, "Math"), "min", [_S.unary("-", 2), _S.binary("+", _S.read(_v15, "y0"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a1")]), _S.read(_v15, "L")))]))
		_S.call_value(_S.read(_v15, "drawArc"), [_S.read(_v15, "p"), _S.call_value(_S.read(_v15, "arc"), [_S.read(_v15, "Rw"), _S.read(_v15, "x0"), _S.read(_v15, "y0"), _S.read(_v15, "x1"), _S.read(_v15, "y1"), _S.merge([{"jag": 0.35}, {"forks": (1 if _S.truth(_S.binary("<", _S.invoke(_S.read(_v15, "Rw"), "next", []), 0.5)) else 0)}])]), _S.merge([{"core": _S.read(_v15, "WHITE")}, {"body": _S.prop(_S.read(_v15, "C"), 5)}, {"halo": _S.prop(_S.read(_v15, "C"), 3)}, {"glow": _S.prop(_S.read(_v15, "C"), 5)}]), _S.read(_v15, "fresh"), 0.3])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 7, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 3), 4), 0.22, _S.function_value(_e, "_f12")])
	if _S.truth(_S.binary("<", _S.read(_e, "since"), 0.07)):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 4, _S.binary("*", 6, _S.binary("-", 1, _S.binary("/", _S.read(_e, "since"), 0.07)))), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), 0.5])
	_S.define(_e, "pulse", _S.binary("+", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 4)]))), _S.binary("*", 0.2, _S.read(_e, "swell"))))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 46, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.26, _S.read(_e, "pulse"))])
	_S.invoke(_S.read(_e, "p"), "glowRing", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "r"), 3), 8, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.3, _S.read(_e, "pulse"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.prop(_S.read(_e, "C"), 6), 0.12])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "HX"), _S.unary("-", 1), 22, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.16, _S.read(_e, "pulse"))])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.2, 0.34])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "a0", _S.invoke(_S.read(_e, "R"), "range", [2.8, 5.75]))
	_S.define(_e, "d0", _S.invoke(_S.read(_e, "R"), "range", [20, 52]))
	_S.define(_e, "spin", _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.3]))
	_S.define(_e, "pos", _S.function_value(_e, "_f8"))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	var _v6 = _S.call_value(_S.read(_e, "pos"), [_S.read(_e, "q")])
	_S.define(_e, "px", _S.prop(_v6, 0))
	_S.define(_e, "py", _S.prop(_v6, 1))
	var _v7 = _S.call_value(_S.read(_e, "pos"), [_S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("+", _S.read(_e, "q"), 0.02)])])
	_S.define(_e, "qx", _S.prop(_v7, 0))
	_S.define(_e, "qy", _S.prop(_v7, 1))
	_S.call_value(_S.read(_e, "streak"), [_S.read(_e, "p"), _S.read(_e, "px"), _S.read(_e, "py"), _S.binary("/", _S.binary("-", _S.read(_e, "qx"), _S.read(_e, "px")), _S.binary("*", 0.02, _S.read(_e, "life"))), _S.binary("/", _S.binary("-", _S.read(_e, "qy"), _S.read(_e, "py")), _S.binary("*", 0.02, _S.read(_e, "life"))), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.55])) else _S.prop(_S.read(_e, "C"), 5)), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "q"), 4)]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.9, 1, _S.read(_e, "q")]))), 7, _S.binary("*", 0.4, _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.6, 0.9, _S.read(_e, "q")])))])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "a", _S.binary("+", _S.read(_e, "a0"), _S.binary("*", _S.binary("*", _S.read(_e, "spin"), _S.read(_e, "q")), _S.read(_e, "q"))))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "d0"), _S.binary("-", 1, _S.binary("*", _S.read(_e, "q"), _S.read(_e, "q")))), _S.read(_e, "r")))
	return [_S.binary("+", _S.read(_e, "HX"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "d"))), _S.binary("+", _S.read(_e, "HY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "d")), 0.92))]

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.4, 0.7])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "a0", _S.invoke(_S.read(_e, "R"), "range", [2.6, 5.2]))
	_S.define(_e, "d0", _S.invoke(_S.read(_e, "R"), "range", [12, 32]))
	_S.define(_e, "spin", _S.invoke(_S.read(_e, "R"), "range", [1, 2.2]))
	_S.define(_e, "size", _S.invoke(_S.read(_e, "R"), "range", [0.6, 1]))
	_S.define(_e, "pos", _S.function_value(_e, "_f11"))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	var _v8 = _S.call_value(_S.read(_e, "pos"), [_S.read(_e, "q")])
	_S.define(_e, "px", _S.prop(_v8, 0))
	_S.define(_e, "py", _S.prop(_v8, 1))
	var _v9 = _S.call_value(_S.read(_e, "pos"), [_S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("+", _S.read(_e, "q"), 0.02)])])
	_S.define(_e, "qx", _S.prop(_v9, 0))
	_S.define(_e, "qy", _S.prop(_v9, 1))
	_S.call_value(_S.read(_e, "mote"), [_S.read(_e, "p"), _S.read(_e, "px"), _S.read(_e, "py"), _S.binary("/", _S.binary("-", _S.read(_e, "qx"), _S.read(_e, "px")), _S.binary("*", 0.02, _S.read(_e, "life"))), _S.binary("/", _S.binary("-", _S.read(_e, "qy"), _S.read(_e, "py")), _S.binary("*", 0.02, _S.read(_e, "life"))), _S.invoke(_S.read(_e, "R"), "pick", [[_S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE")]]), _S.read(_e, "size"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "q"), 3)]), (_S.binary("/", _S.binary("-", 1, _S.read(_e, "q")), 0.1) if _S.truth(_S.binary(">", _S.read(_e, "q"), 0.9)) else 1)), _S.binary("*", 0.3, _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.55, 0.85, _S.read(_e, "q")])))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "a", _S.binary("+", _S.read(_e, "a0"), _S.binary("*", _S.read(_e, "spin"), _S.read(_e, "q"))))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "d0"), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.read(_e, "q")]))), _S.read(_e, "r")))
	return [_S.binary("+", _S.read(_e, "HX"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "d"))), _S.binary("+", _S.read(_e, "HY"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "d")))]

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "R"), "range", [_S.binary("+", _S.read(_e, "r"), 5), _S.binary("+", _S.read(_e, "r"), 15)]))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")), _S.prop(_S.read(_e, "Math"), "PI"))]))
	_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "d"))), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "d")), 0.9)), _S.binary("+", 1, _S.binary("*", 2.5, _S.read(_e, "k"))), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.4, _S.read(_e, "k"))])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	return _S.binary("+", _S.binary("/", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "D")), _S.read(_e, "RINGS")), _S.read(_e, "RT"))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "min", _S.concat([_S.array(_S.invoke(_S.read(_e, "landings"), "map", [_S.function_value(_e, "_f15")]))]))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "l", _S.arg(_args, 0))
	return _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "l")), _S.read(_e, "D")), _S.read(_e, "D")), _S.read(_e, "D"))
