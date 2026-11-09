@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/rune-circle.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "floorRing", _S.import_value("fx/arcane/_lib.js", "floorRing"))
	_S.define(_e, "glyph", _S.import_value("fx/arcane/_lib.js", "glyph"))
	_S.define(_e, "mote", _S.import_value("fx/arcane/_lib.js", "mote"))
	_S.define(_e, "circle", _S.function_value(_e, "_f0"))
	_S.define(_e, "motes", _S.function_value(_e, "_f12"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f16"))
	_S.define(_e, "draw", _S.function_value(_e, "_f17"))
	_S.define(_e, "D", 4)
	_S.define(_e, "R", 46)
	_S.define(_e, "RR", 39)
	_S.define(_e, "RI", 23)
	_S.define(_e, "RC", 7)
	_S.define(_e, "SY", 0.3)
	_S.define(_e, "NR", 12)
	_S.define(_e, "meta", _S.merge([{"name": "Rune circle"}, {"desc": "A rune circle turns on the floor in perspective: a carousel of runes lit by chasing light, a turning square, ticks, motes rising off it."}, {"tags": ["arcane", "rune", "circle", "magic", "aura", "ground", "loop"]}, {"size": [136, 100]}, {"origin": [68, 80]}, {"duration": _S.read(_e, "D")}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "at", _S.function_value(_e, "_f18"))
	_S.define(_e, "gap", _S.function_value(_e, "_f19"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "far", _S.arg(_args, 3))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "spin", _S.binary("/", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 4))
	_S.define(_e, "keep", (_S.function_value(_e, "_f1") if _S.truth(_S.read(_e, "far")) else _S.function_value(_e, "_f2")))
	_S.define(_e, "chase", _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2))
	_S.define(_e, "lit", _S.function_value(_e, "_f3"))
	_S.define(_e, "tone", _S.function_value(_e, "_f4"))
	_S.call_value(_S.read(_e, "floorRing"), [_S.read(_e, "p"), 0, 0, _S.read(_e, "R"), _S.read(_e, "SY"), _S.function_value(_e, "_f5"), 1, _S.read(_e, "keep")])
	_S.call_value(_S.read(_e, "floorRing"), [_S.read(_e, "p"), 0, 0, _S.read(_e, "RI"), _S.read(_e, "SY"), _S.function_value(_e, "_f6"), 1, _S.read(_e, "keep")])
	_S.call_value(_S.read(_e, "floorRing"), [_S.read(_e, "p"), 0, 0, _S.read(_e, "RC"), _S.read(_e, "SY"), _S.function_value(_e, "_f7"), 1, _S.read(_e, "keep")])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "j"), 16)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "g", _S.binary("+", _S.read(_v1, "spin"), _S.binary("/", _S.binary("*", _S.binary("+", _S.read(_v1, "j"), 0.5), _S.read(_v1, "TAU")), 16)))
		if _S.truth(_S.binary("!==", _S.binary("<", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "g")]), 0), _S.read(_v1, "far"))):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "j", 1, "+=", true)
			continue
		var _v2 = _S.call_value(_S.read(_v1, "at"), [_S.read(_v1, "g"), _S.binary("+", _S.read(_v1, "R"), 3.5)])
		_S.define(_v1, "x", _S.prop(_v2, 0))
		_S.define(_v1, "y", _S.prop(_v2, 1))
		_S.define(_v1, "hot", _S.call_value(_S.read(_v1, "lit"), [_S.read(_v1, "g"), 0.3]))
		_S.invoke(_S.read(_v1, "p"), "px", [_S.read(_v1, "x"), _S.read(_v1, "y"), (_S.read(_v1, "WHITE") if _S.truth(_S.read(_v1, "hot")) else _S.call_value(_S.read(_v1, "tone"), [_S.read(_v1, "g"), (_S.prop(_S.read(_v1, "C"), 5) if _S.truth(_S.binary("%", _S.read(_v1, "j"), 2)) else _S.prop(_S.read(_v1, "C"), 6)), _S.prop(_S.read(_v1, "C"), 4)]))])
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v1, "j"), 2), 0)):
			for _v3 in _S.array([[1, 0], [_S.unary("-", 1), 0]]):
				var _v4 = _S.scope(_v1)
				var _v5 = _v3
				_S.define(_v4, "dx", _S.prop(_v5, 0))
				_S.define(_v4, "dy", _S.prop(_v5, 1))
				_S.invoke(_S.read(_v4, "p"), "px", [_S.binary("+", _S.read(_v4, "x"), _S.read(_v4, "dx")), _S.binary("+", _S.read(_v4, "y"), _S.read(_v4, "dy")), (_S.prop(_S.read(_v4, "C"), 6) if _S.truth(_S.read(_v4, "hot")) else _S.call_value(_S.read(_v4, "tone"), [_S.read(_v4, "g"), _S.prop(_S.read(_v4, "C"), 4), _S.prop(_S.read(_v4, "C"), 3)]))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "j", 1, "+=", true)
	_S.define(_e, "pts", _S.invoke([0, 1, 2, 3], "map", [_S.function_value(_e, "_f8")]))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "k"), 4)):
		var _v7 = _S.scope(_v6)
		var _v8 = _S.prop(_S.read(_v7, "pts"), _S.read(_v7, "k"))
		_S.define(_v7, "ax", _S.prop(_v8, 0))
		_S.define(_v7, "ay", _S.prop(_v8, 1))
		var _v9 = _S.prop(_S.read(_v7, "pts"), _S.binary("%", _S.binary("+", _S.read(_v7, "k"), 1), 4))
		_S.define(_v7, "bx", _S.prop(_v9, 0))
		_S.define(_v7, "by", _S.prop(_v9, 1))
		if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_v7, "ay"), 0), _S.binary("<", _S.read(_v7, "by"), 0))):
			var _v10 = _S.scope(_v7)
			_S.define(_v10, "u", _S.binary("/", _S.read(_v10, "ay"), _S.binary("-", _S.read(_v10, "ay"), _S.read(_v10, "by"))))
			_S.define(_v10, "mx", _S.binary("+", _S.read(_v10, "ax"), _S.binary("*", _S.binary("-", _S.read(_v10, "bx"), _S.read(_v10, "ax")), _S.read(_v10, "u"))))
			if _S.truth(_S.binary("===", _S.binary("<", _S.read(_v10, "ay"), 0), _S.read(_v10, "far"))):
				_S.last([_S.write(_v10, "bx", _S.read(_v10, "mx"), "=", false), _S.write(_v10, "by", 0, "=", false)])
			else:
				_S.last([_S.write(_v10, "ax", _S.read(_v10, "mx"), "=", false), _S.write(_v10, "ay", 0, "=", false)])
		else:
			if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_v7, "ay"), 0), _S.read(_v7, "far"))):
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "k", 1, "+=", true)
				continue
		_S.invoke(_S.read(_v7, "p"), "line", [_S.read(_v7, "ax"), _S.read(_v7, "ay"), _S.read(_v7, "bx"), _S.read(_v7, "by"), (_S.prop(_S.read(_v7, "C"), 4) if _S.truth(_S.read(_v7, "far")) else _S.prop(_S.read(_v7, "C"), 5))])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "k", 1, "+=", true)
	_S.define(_e, "gs", _S.invoke(_S.invoke(_S.concat([_S.array(_S.invoke(_S.call_value(_S.read(_e, "Array"), [_S.read(_e, "NR")]), "keys", []))]), "map", [_S.function_value(_e, "_f9")]), "filter", [_S.function_value(_e, "_f10")]))
	_S.invoke(_S.read(_e, "gs"), "sort", [_S.function_value(_e, "_f11")])
	for _v12 in _S.array(_S.read(_e, "gs")):
		var _v13 = _S.scope(_e)
		var _v14 = _v12
		_S.define(_v13, "k", _S.prop(_v14, 0))
		_S.define(_v13, "g", _S.prop(_v14, 1))
		var _v15 = _S.scope(_v13)
		var _v16 = _S.call_value(_S.read(_v15, "at"), [_S.read(_v15, "g"), _S.read(_v15, "RR")])
		_S.define(_v15, "x", _S.prop(_v16, 0))
		_S.define(_v15, "y", _S.prop(_v16, 1))
		_S.define(_v15, "hot", _S.call_value(_S.read(_v15, "lit"), [_S.read(_v15, "g"), 0.2]))
		_S.define(_v15, "bob", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v15, "ph"), _S.read(_v15, "TAU")), 4), _S.binary("*", 4, _S.read(_v15, "g")))]), 0.5))
		_S.call_value(_S.read(_v15, "glyph"), [_S.read(_v15, "p"), _S.prop([0, 3, 5], _S.binary("%", _S.read(_v15, "k"), 3)), _S.read(_v15, "x"), _S.binary("+", _S.binary("-", _S.read(_v15, "y"), 1), _S.read(_v15, "bob")), (_S.read(_v15, "WHITE") if _S.truth(_S.read(_v15, "hot")) else (_S.prop(_S.read(_v15, "C"), 5) if _S.truth(_S.read(_v15, "far")) else _S.prop(_S.read(_v15, "C"), 6))), 1, (_S.prop(_S.read(_v15, "C"), 5) if _S.truth(_S.read(_v15, "hot")) else (_S.prop(_S.read(_v15, "C"), 2) if _S.truth(_S.read(_v15, "far")) else _S.prop(_S.read(_v15, "C"), 3)))])
		_S.invoke(_S.read(_v15, "p"), "glow", [_S.read(_v15, "x"), _S.binary("-", _S.read(_v15, "y"), 3), (10 if _S.truth(_S.read(_v15, "hot")) else 6), _S.prop(_S.read(_v15, "C"), 5), (0.5 if _S.truth(_S.read(_v15, "hot")) else (0.12 if _S.truth(_S.read(_v15, "far")) else 0.22))])
		_S.invoke(_S.read(_v15, "p"), "glow", [_S.read(_v15, "x"), _S.read(_v15, "y"), 5, _S.prop(_S.read(_v15, "C"), 4), 0.15])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "w", _S.arg(_args, 1))
	return _S.logical("||", _S.binary("<", _S.call_value(_S.read(_e, "gap"), [_S.read(_e, "g"), _S.read(_e, "chase")]), _S.read(_e, "w")), func(): return _S.binary("<", _S.call_value(_S.read(_e, "gap"), [_S.read(_e, "g"), _S.binary("+", _S.read(_e, "chase"), _S.prop(_S.read(_e, "Math"), "PI"))]), _S.read(_e, "w")))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "hi", _S.arg(_args, 1))
	_S.define(_e, "lo", _S.arg(_args, 2))
	return (_S.read(_e, "lo") if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)) else _S.read(_e, "hi"))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.call_value(_S.read(_e, "lit"), [_S.read(_e, "g"), 0.22])) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.call_value(_S.read(_e, "lit"), [_S.read(_e, "g"), 0.5])) else _S.call_value(_S.read(_e, "tone"), [_S.read(_e, "g"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)])))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "tone"), [_S.read(_e, "g"), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "tone"), [_S.read(_e, "g"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "at"), [_S.binary("+", _S.binary("+", _S.unary("-", _S.read(_e, "spin")), _S.binary("/", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "TAU")), 4)), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 4)), _S.read(_e, "RI")])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	return [_S.read(_e, "k"), _S.binary("+", _S.read(_e, "spin"), _S.binary("/", _S.binary("*", _S.binary("+", _S.read(_e, "k"), 0.5), _S.read(_e, "TAU")), _S.read(_e, "NR")))]

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v11 = _S.arg(_args, 0)
	_S.define(_e, "g", _S.prop(_v11, 1))
	return _S.binary("===", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "far"))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "a"), 1)]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "b"), 1)]))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "S", _S.arg(_args, 3))
	_S.define(_e, "far", _S.arg(_args, 4))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 76, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 5), 1), _S.function_value(_e, "_f13"), _S.function_value(_e, "_f14")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 14, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 5), 2), 0.45, _S.function_value(_e, "_f15")])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [1.1, 1.9])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "g0", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "r0", _S.invoke(_S.read(_e, "r"), "pick", [[_S.read(_e, "R"), _S.read(_e, "R"), _S.read(_e, "RR"), _S.read(_e, "RR"), _S.read(_e, "RI")]]))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "g", _S.binary("+", _S.read(_e, "g0"), _S.binary("*", _S.read(_e, "q"), _S.invoke(_S.read(_e, "r"), "range", [0.6, 1.4]))))
	if _S.truth(_S.binary("!==", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "far"))):
		return null
	_S.define(_e, "rr", _S.binary("*", _S.read(_e, "r0"), _S.binary("-", 1, _S.binary("*", 0.35, _S.read(_e, "q")))))
	_S.define(_e, "h", _S.binary("+", 2, _S.binary("*", _S.invoke(_S.read(_e, "ease"), "outQuad", [_S.read(_e, "q")]), _S.invoke(_S.read(_e, "r"), "range", [26, 52]))))
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "g")]), _S.read(_e, "rr")))
	_S.define(_e, "y", _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), _S.read(_e, "rr")), _S.read(_e, "SY")), _S.read(_e, "h")))
	_S.define(_e, "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "q"), 5)]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.65, 1, _S.read(_e, "q")]))))
	_S.define(_e, "big", _S.invoke(_S.read(_e, "r"), "chance", [0.2]))
	_S.call_value(_S.read(_e, "mote"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")])), _S.read(_e, "rr")), 0.8), _S.binary("-", _S.binary("*", _S.unary("-", 36), _S.binary("-", 1, _S.read(_e, "q"))), 10), (_S.read(_e, "WHITE") if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.3])) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.6])) else _S.prop(_S.read(_e, "C"), 5))), (1.1 if _S.truth(_S.read(_e, "big")) else _S.invoke(_S.read(_e, "r"), "range", [0.55, 0.9])), _S.read(_e, "a"), (0.5 if _S.truth(_S.read(_e, "big")) else 0.3)])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "g", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	if _S.truth(_S.binary("!==", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "far"))):
		return null
	_S.define(_e, "rr", _S.invoke(_S.read(_e, "r"), "range", [8, _S.read(_e, "R")]))
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "g")]), _S.read(_e, "rr")))
	_S.define(_e, "y", _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), _S.read(_e, "rr")), _S.read(_e, "SY")), _S.invoke(_S.read(_e, "r"), "range", [6, 34])))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")), _S.prop(_S.read(_e, "Math"), "PI"))]))
	_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 1, _S.binary("*", 2.4, _S.read(_e, "k"))), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.35, _S.read(_e, "k"))])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "pulse", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 4)]))))
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, _S.binary("*", _S.read(_e, "R"), 1.4), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.24, _S.read(_e, "pulse"))])
	for _v17 in _S.array([_S.unary("-", 1), 1]):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "s", _v17)
		_S.invoke(_S.read(_v18, "p"), "glow", [_S.binary("*", _S.binary("*", _S.read(_v18, "s"), _S.read(_v18, "R")), 0.55), 1, _S.binary("*", _S.read(_v18, "R"), 0.7), _S.prop(_S.read(_v18, "C"), 5), _S.binary("*", 0.12, _S.read(_v18, "pulse"))])
	var _v19 = _S.scope(_e)
	_S.define(_v19, "h", 0)
	while _S.truth(_S.binary("<", _S.read(_v19, "h"), 66)):
		_S.invoke(_S.read(_v19, "p"), "glow", [0, _S.unary("-", _S.read(_v19, "h")), 26, _S.prop(_S.read(_v19, "C"), 4), _S.binary("*", _S.binary("*", 0.11, _S.read(_v19, "pulse")), _S.binary("-", 1, _S.binary("/", _S.read(_v19, "h"), 80)))])
		_v19 = _S.iteration(_v19)
		_S.write(_v19, "h", 6, "+=", false)
	_S.call_value(_S.read(_e, "circle"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), true])
	_S.call_value(_S.read(_e, "motes"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed"), true])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "chase", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 2))
	_S.call_value(_S.read(_e, "circle"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), false])
	_S.call_value(_S.read(_e, "motes"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed"), false])
	for _v20 in _S.array([_S.read(_e, "chase"), _S.binary("+", _S.read(_e, "chase"), _S.prop(_S.read(_e, "Math"), "PI"))]):
		var _v21 = _S.scope(_e)
		_S.define(_v21, "g", _v20)
		var _v22 = _S.scope(_v21)
		var _v23 = _S.call_value(_S.read(_v22, "at"), [_S.read(_v22, "g"), _S.read(_v22, "R")])
		_S.define(_v22, "x", _S.prop(_v23, 0))
		_S.define(_v22, "y", _S.prop(_v23, 1))
		_S.call_value(_S.read(_v22, "sparkle"), [_S.read(_v22, "p"), _S.read(_v22, "x"), _S.read(_v22, "y"), _S.binary("+", 2.5, _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.binary("*", _S.read(_v22, "t"), 30)]), 0.8)), _S.prop(_S.read(_v22, "C"), 6), _S.prop(_S.read(_v22, "C"), 5), 0.5])
		_S.invoke(_S.read(_v22, "p"), "glow", [_S.read(_v22, "x"), _S.read(_v22, "y"), 14, _S.prop(_S.read(_v22, "C"), 5), 0.4])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	return [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "g")]), _S.read(_e, "r")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), _S.read(_e, "r")), _S.read(_e, "SY"))]

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "atan2", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.read(_e, "a"), _S.read(_e, "b"))]), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("-", _S.read(_e, "a"), _S.read(_e, "b"))])])])
