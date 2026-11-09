@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/ghost.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "shadow", _S.import_value("fx/critters/_lib.js", "shadow"))
	_S.define(_e, "at", _S.function_value(_e, "_f0"))
	_S.define(_e, "halfW", _S.function_value(_e, "_f1"))
	_S.define(_e, "sheet", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f10"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f14"))
	_S.define(_e, "meta", _S.merge([{"name": "Ghost"}, {"desc": "A sheet ghost bobs over the floor: its scalloped hem ripples and trails its drift, little arms flutter, it glances about and blinks, motes trickle off its hem."}, {"tags": ["critter", "ghost", "spirit", "undead", "spooky", "float", "loop"]}, {"size": [96, 100]}, {"origin": [48, 90]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#10142a", "#232c52", "#3e4f86", "#6b84bb", "#a3b8e2", "#d8e4ff", "#ffffff"]}, {"hover": 14}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 20), _S.unary("-", 40), 40, 46]))
	_S.define(_e, "R", 10.5)
	_exports["draw"] = _S.read(_e, "draw")
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "hover", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")))
	return _S.merge([{"x": _S.binary("*", 4, _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))}, {"y": _S.binary("-", _S.unary("-", _S.read(_e, "hover")), _S.binary("*", 3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", 2, _S.read(_e, "a")), 0.8)])))}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "h", _S.arg(_args, 0))
	_S.define(_e, "top", _S.binary("+", _S.binary("*", 2, _S.read(_e, "R")), 9))
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "h"), _S.read(_e, "top")), func(): return _S.binary("<", _S.read(_e, "h"), _S.unary("-", 1)))):
		return _S.unary("-", 1)
	if _S.truth(_S.binary(">", _S.read(_e, "h"), _S.binary("-", _S.read(_e, "top"), _S.read(_e, "R")))):
		return _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.binary("*", _S.read(_e, "R"), _S.read(_e, "R")), _S.binary("**", _S.binary("-", _S.read(_e, "h"), _S.binary("-", _S.read(_e, "top"), _S.read(_e, "R"))), 2))])])
	return _S.call_value(_S.read(_e, "lerp"), [_S.binary("+", _S.read(_e, "R"), 2.2), _S.read(_e, "R"), _S.binary("**", _S.binary("/", _S.read(_e, "h"), _S.binary("-", _S.read(_e, "top"), _S.read(_e, "R"))), 0.7)])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "o", _S.arg(_args, 3))
	_S.define(_e, "lagX", _S.arg(_args, 4))
	_S.invoke(_S.read(_e, "g"), "clear", [])
	_S.define(_e, "top", _S.binary("+", _S.binary("*", 2, _S.read(_e, "R")), 9))
	_S.define(_e, "ph", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 2))
	_S.define(_e, "NL", 4)
	_S.define(_e, "HW", _S.binary("+", _S.read(_e, "R"), 2.2))
	_S.define(_e, "LW", _S.binary("/", _S.binary("*", 2, _S.read(_e, "HW")), _S.read(_e, "NL")))
	_S.define(_e, "off", _S.function_value(_e, "_f3"))
	_S.define(_e, "lobe", _S.function_value(_e, "_f4"))
	_S.define(_e, "inside", _S.function_value(_e, "_f5"))
	_S.define(_e, "arm", _S.function_value(_e, "_f6"))
	_S.define(_e, "any", _S.function_value(_e, "_f7"))
	_S.define(_e, "lx", _S.unary("-", 9))
	_S.define(_e, "ly", _S.binary("-", _S.unary("-", _S.read(_e, "top")), 1))
	_S.define(_e, "lit", _S.function_value(_e, "_f8"))
	_S.invoke(_S.read(_e, "g"), "shade", [_S.unary("-", 19), _S.binary("-", _S.unary("-", _S.read(_e, "top")), 2), 19, 5, _S.function_value(_e, "_f9")])
	return _S.merge([{"inside": _S.read(_e, "inside")}, {"off": _S.read(_e, "off")}, {"top": _S.read(_e, "top")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "h", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "lagX"), _S.binary("**", _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "h"), _S.read(_e, "top"))])), 1.4))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "X", _S.arg(_args, 0))
	_S.define(_e, "j", _S.call_value(_S.read(_e, "clamp"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.binary("+", _S.read(_e, "X"), _S.read(_e, "HW")), _S.read(_e, "LW"))]), 0, _S.binary("-", _S.read(_e, "NL"), 1)]))
	_S.define(_e, "c", _S.binary("+", _S.unary("-", _S.read(_e, "HW")), _S.binary("*", _S.binary("+", _S.read(_e, "j"), 0.5), _S.read(_e, "LW"))))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "X"), _S.read(_e, "c")), _S.binary("/", _S.read(_e, "LW"), 2)))
	return _S.merge([{"j": _S.read(_e, "j")}, {"u": _S.read(_e, "u")}, {"d": _S.binary("*", _S.binary("+", 2.2, _S.binary("*", 1.1, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.read(_e, "ph"), _S.binary("*", _S.read(_e, "j"), 1.5))]))), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u")))])]))}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "h", _S.unary("-", _S.read(_e, "y")))
	_S.define(_e, "X", _S.binary("-", _S.read(_e, "x"), _S.call_value(_S.read(_e, "off"), [_S.read(_e, "h")])))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "h"), 0), func(): return _S.binary(">", _S.unary("-", _S.read(_e, "h")), _S.prop(_S.call_value(_S.read(_e, "lobe"), [_S.read(_e, "X")]), "d")))):
		return false
	_S.define(_e, "hw", _S.call_value(_S.read(_e, "halfW"), [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "h")])]))
	return _S.logical("&&", _S.binary(">=", _S.read(_e, "hw"), 0), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "X")]), _S.read(_e, "hw")))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	for _v0 in _S.array([_S.unary("-", 1), 1]):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "ax", _S.binary("+", _S.binary("*", _S.read(_v2, "s"), _S.binary("+", _S.read(_v2, "R"), 1.2)), _S.call_value(_S.read(_v2, "off"), [13])))
		_S.define(_v2, "ay", _S.binary("+", _S.unary("-", 13), _S.binary("*", 1.6, _S.invoke(_S.read(_v2, "Math"), "sin", [_S.binary("+", _S.read(_v2, "ph"), _S.binary("*", _S.read(_v2, "s"), 1.3))]))))
		if _S.truth(_S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_v2, "x"), _S.read(_v2, "ax")), 3), 2), _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_v2, "y"), _S.read(_v2, "ay")), 2.2), 2)), 1)):
			return true
	return false

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("||", _S.call_value(_S.read(_e, "inside"), [_S.read(_e, "x"), _S.read(_e, "y")]), func(): return _S.call_value(_S.read(_e, "arm"), [_S.read(_e, "x"), _S.read(_e, "y")]))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "k", _S.arg(_args, 2))
	return _S.call_value(_S.read(_e, "any"), [_S.binary("+", _S.read(_e, "lx"), _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "lx")), _S.read(_e, "k"))), _S.binary("+", _S.read(_e, "ly"), _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ly")), _S.read(_e, "k")))])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o2", _S.arg(_args, 2))
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "any"), [_S.read(_e, "x"), _S.read(_e, "y")]))):
		return 0
	_S.define(_e, "h", _S.unary("-", _S.read(_e, "y")))
	_S.define(_e, "X", _S.binary("-", _S.read(_e, "x"), _S.call_value(_S.read(_e, "off"), [_S.read(_e, "h")])))
	_S.define(_e, "i", (5 if _S.truth(_S.call_value(_S.read(_e, "lit"), [_S.read(_e, "x"), _S.read(_e, "y"), 0.62])) else 4))
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "any"), [_S.binary("+", _S.read(_e, "x"), 2.4), _S.binary("+", _S.read(_e, "y"), 1.8)]))):
		_S.write(_e, "i", 3, "=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.call_value(_S.read(_e, "any"), [_S.binary("+", _S.read(_e, "x"), 1.2), _S.binary("+", _S.read(_e, "y"), 1)])), func(): return _S.binary(">", _S.read(_e, "X"), 2))):
		_S.write(_e, "i", 2, "=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "h"), _S.binary("-", _S.binary("-", _S.read(_e, "top"), _S.read(_e, "R")), 2)), func(): return _S.binary("<", _S.read(_e, "X"), 1)), func(): return _S.unary("!", _S.call_value(_S.read(_e, "any"), [_S.binary("-", _S.read(_e, "x"), 1.5), _S.binary("-", _S.read(_e, "y"), 1.5)]))), func(): return _S.call_value(_S.read(_e, "any"), [_S.binary("-", _S.read(_e, "x"), 0.6), _S.binary("-", _S.read(_e, "y"), 0.6)]))):
		_S.write(_e, "i", 6, "=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "h"), 1)):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "L", _S.call_value(_S.read(_v3, "lobe"), [_S.read(_v3, "X")]))
		if _S.truth(_S.logical("||", _S.binary(">", _S.prop(_S.read(_v3, "L"), "u"), 0.1), func(): return _S.binary(">", _S.unary("-", _S.read(_v3, "h")), _S.binary("-", _S.prop(_S.read(_v3, "L"), "d"), 1.2)))):
			_S.write(_v3, "i", _S.invoke(_S.read(_v3, "Math"), "min", [_S.read(_v3, "i"), 3]), "=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "h"), 7), func(): return _S.binary(">=", _S.read(_e, "h"), _S.unary("-", 0.5)))):
		var _v4 = _S.scope(_e)
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "j", 1)
		while _S.truth(_S.binary("<", _S.read(_v5, "j"), _S.read(_v5, "NL"))):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "cx", _S.binary("+", _S.binary("+", _S.unary("-", _S.read(_v6, "HW")), _S.binary("*", _S.read(_v6, "j"), _S.read(_v6, "LW"))), _S.binary("*", 0.6, _S.invoke(_S.read(_v6, "Math"), "sin", [_S.binary("-", _S.read(_v6, "ph"), _S.read(_v6, "j"))]))))
			_S.define(_v6, "w", _S.binary("*", _S.binary("-", 7, _S.read(_v6, "h")), 0.09))
			if _S.truth(_S.binary("<=", _S.invoke(_S.read(_v6, "Math"), "abs", [_S.binary("-", _S.read(_v6, "X"), _S.read(_v6, "cx"))]), _S.binary("+", _S.read(_v6, "w"), 0.3))):
				_S.write(_v6, "i", _S.invoke(_S.read(_v6, "Math"), "min", [_S.read(_v6, "i"), 3]), "=", false)
			else:
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.binary("-", _S.read(_v6, "cx"), _S.read(_v6, "X")), _S.binary("+", _S.read(_v6, "w"), 0.3)), func(): return _S.binary("<", _S.binary("-", _S.read(_v6, "cx"), _S.read(_v6, "X")), _S.binary("+", _S.read(_v6, "w"), 1.3))), func(): return _S.binary("===", _S.read(_v6, "i"), 4))):
					_S.write(_v6, "i", 5, "=", false)
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "j", 1, "+=", true)
	_S.set_prop(_S.read(_e, "o2"), "a", (0.86 if _S.truth(_S.binary("<", _S.read(_e, "h"), 2)) else 0.95), "=", false)
	return _S.prop(_S.read(_e, "C"), _S.read(_e, "i"))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "lagX", _S.binary("-", _S.prop(_S.call_value(_S.read(_e, "at"), [_S.binary("-", _S.read(_e, "t"), 0.3), _S.prop(_S.read(_e, "o"), "hover")]), "x"), _S.prop(_S.read(_e, "S"), "x")))
	_S.define(_e, "g", _S.read(_e, "GRID"))
	_S.define(_e, "sh", _S.call_value(_S.read(_e, "sheet"), [_S.read(_e, "g"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "o"), _S.read(_e, "lagX")]))
	_S.define(_e, "top", _S.prop(_S.read(_e, "sh"), "top"))
	_S.define(_e, "look", (0 if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "t"), _S.read(_e, "D")]), 0.7)) else (1 if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "t"), _S.read(_e, "D")]), 1.3)) else (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "t"), _S.read(_e, "D")]), 1.9)) else 0))))
	_S.define(_e, "blink", _S.logical("&&", _S.binary(">", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "t"), _S.read(_e, "D")]), 1.95), func(): return _S.binary("<", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "t"), _S.read(_e, "D")]), 2.03)))
	_S.define(_e, "ey", _S.binary("-", _S.binary("+", _S.unary("-", _S.read(_e, "top")), _S.read(_e, "R")), 1))
	_S.define(_e, "mo", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 2)]))))
	for _v7 in _S.array([_S.unary("-", 1), 1]):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "s", _v7)
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "ex", _S.binary("+", _S.binary("-", _S.binary("*", _S.read(_v9, "s"), 4), (1 if _S.truth(_S.binary(">", _S.read(_v9, "s"), 0)) else 0)), _S.read(_v9, "look")))
		if _S.truth(_S.read(_v9, "blink")):
			_S.last([_S.invoke(_S.read(_v9, "g"), "set", [_S.read(_v9, "ex"), _S.binary("+", _S.read(_v9, "ey"), 2), _S.prop(_S.read(_v9, "C"), 1)]), _S.invoke(_S.read(_v9, "g"), "set", [_S.binary("+", _S.read(_v9, "ex"), 1), _S.binary("+", _S.read(_v9, "ey"), 2), _S.prop(_S.read(_v9, "C"), 1)])])
		else:
			var _v10 = _S.scope(_v9)
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "k", 0)
			while _S.truth(_S.binary("<", _S.read(_v11, "k"), 4)):
				_S.last([_S.invoke(_S.read(_v11, "g"), "set", [_S.read(_v11, "ex"), _S.binary("+", _S.read(_v11, "ey"), _S.read(_v11, "k")), _S.prop(_S.read(_v11, "C"), 0)]), _S.invoke(_S.read(_v11, "g"), "set", [_S.binary("+", _S.read(_v11, "ex"), 1), _S.binary("+", _S.read(_v11, "ey"), _S.read(_v11, "k")), _S.prop(_S.read(_v11, "C"), 0)])])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "k", 1, "+=", true)
			_S.invoke(_S.read(_v10, "g"), "set", [_S.binary("+", _S.read(_v10, "ex"), (0 if _S.truth(_S.binary("<", _S.read(_v10, "look"), 0)) else 1)), _S.read(_v10, "ey"), _S.prop(_S.read(_v10, "C"), 2)])
	_S.define(_e, "my", _S.binary("+", _S.read(_e, "ey"), 6))
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("-", _S.read(_e, "look"), 1), _S.read(_e, "my"), _S.prop(_S.read(_e, "C"), 1)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.read(_e, "look"), _S.read(_e, "my"), _S.prop(_S.read(_e, "C"), 1)])
	if _S.truth(_S.binary(">", _S.read(_e, "mo"), 0.4)):
		_S.last([_S.invoke(_S.read(_e, "g"), "set", [_S.binary("-", _S.read(_e, "look"), 1), _S.binary("+", _S.read(_e, "my"), 1), _S.prop(_S.read(_e, "C"), 0)]), _S.invoke(_S.read(_e, "g"), "set", [_S.read(_e, "look"), _S.binary("+", _S.read(_e, "my"), 1), _S.prop(_S.read(_e, "C"), 0)])])
	_S.invoke(_S.read(_e, "g"), "outline", [_S.function_value(_e, "_f11"), 0.95])
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p"), 1, _S.prop(_S.read(_e, "S"), "x"), _S.prop(_S.read(_e, "S"), "y")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 12, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 3), 1), _S.function_value(_e, "_f12"), _S.function_value(_e, "_f13")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "S"), "x"), _S.binary("-", _S.prop(_S.read(_e, "S"), "y"), _S.binary("*", _S.read(_e, "top"), 0.55)), 54, _S.prop(_S.read(_e, "C"), 3), 0.3])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("-", _S.prop(_S.read(_e, "S"), "x"), 3), _S.binary("-", _S.prop(_S.read(_e, "S"), "y"), _S.binary("*", _S.read(_e, "top"), 0.72)), 14, _S.prop(_S.read(_e, "C"), 5), 0.12])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "nx", _S.arg(_args, 2))
	_S.define(_e, "ny", _S.arg(_args, 3))
	return (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary(">", _S.read(_e, "ny"), 0)) else _S.prop(_S.read(_e, "C"), 1))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1, 1.7])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "S0", _S.call_value(_S.read(_e, "at"), [_S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), _S.read(_e, "D")]), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "L")))
	_S.define(_e, "x0", _S.binary("+", _S.prop(_S.read(_e, "S0"), "x"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 10), 10])))
	_S.define(_e, "y0", _S.binary("+", _S.prop(_S.read(_e, "S0"), "y"), 1.5))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2.2), _S.read(_e, "i"))]), 2.4)))
	_S.define(_e, "y", _S.binary("-", _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [5, 11]), _S.read(_e, "age"))), _S.binary("*", _S.binary("*", 3, _S.read(_e, "age")), _S.read(_e, "age"))))
	_S.define(_e, "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 6)]), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_e, "k")), 2.2)])))
	_S.define(_e, "tw", _S.binary("+", 0.6, _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 8), _S.binary("*", _S.read(_e, "i"), 1.7))]))))
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "tw"), 0.8)) else _S.prop(_S.read(_e, "C"), 5)), _S.read(_e, "a")])
	if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.3])):
		_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 1), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.read(_e, "a"), 0.7)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 7, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.binary("*", 0.42, _S.read(_e, "a")), _S.read(_e, "tw"))])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "hgt", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.unary("-", _S.prop(_S.read(_e, "S"), "y")), 8), 16)]))
	_S.call_value(_S.read(_e, "shadow"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "S"), "x"), 0, _S.binary("-", 11, _S.binary("*", 3, _S.read(_e, "hgt"))), 1.6, _S.prop(_S.read(_e, "C"), 0), _S.binary("-", 0.55, _S.binary("*", 0.2, _S.read(_e, "hgt")))])
	var _v12 = _S.scope(_e)
	_S.define(_v12, "x", _S.unary("-", 24))
	while _S.truth(_S.binary("<=", _S.read(_v12, "x"), 24)):
		_S.invoke(_S.read(_v12, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_v12, "S"), "x"), _S.read(_v12, "x")), _S.unary("-", 1), 16, _S.prop(_S.read(_v12, "C"), 4), _S.binary("*", _S.binary("*", 0.14, _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v12, "Math"), "abs", [_S.read(_v12, "x")]), 34))), _S.binary("-", 1, _S.binary("*", 0.4, _S.read(_v12, "hgt"))))])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "x", 6, "+=", false)
	return null
