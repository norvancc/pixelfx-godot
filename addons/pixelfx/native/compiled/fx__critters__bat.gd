@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/bat.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "at", _S.function_value(_e, "_f0"))
	_S.define(_e, "wingPts", _S.function_value(_e, "_f1"))
	_S.define(_e, "bat", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f9"))
	_S.define(_e, "meta", _S.merge([{"name": "Bat"}, {"desc": "A bat flaps in four snappy wing frames along a figure-eight, its body lifting on each downbeat, moonlight on its wing bones, red eyes glowing and glinting."}, {"tags": ["critter", "bat", "night", "flying", "spooky", "loop"]}, {"size": [112, 80]}, {"origin": [56, 40]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0c0912", "#1f1629", "#382645", "#5b3f66", "#866089", "#b88fb0", "#e8cfe0"]}, {"eyes": ["#8a1020", "#ff3b30", "#ffb04a", "#fff0c0"]}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "FLAPS", 6)
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 24), _S.unary("-", 22), 48, 40]))
	_S.define(_e, "FRAMES", [_S.merge([{"arm": _S.unary("-", 58)}, {"al": 8}, {"f": [_S.unary("-", 112), _S.unary("-", 76), _S.unary("-", 38)]}, {"fl": [9, 11, 9]}, {"lift": 1}]), _S.merge([{"arm": _S.unary("-", 18)}, {"al": 9}, {"f": [_S.unary("-", 40), _S.unary("-", 12), 16]}, {"fl": [10, 11, 9]}, {"lift": 0}]), _S.merge([{"arm": 28}, {"al": 8}, {"f": [50, 72, 94]}, {"fl": [9, 10, 8]}, {"lift": _S.unary("-", 2)}]), _S.merge([{"arm": _S.unary("-", 42)}, {"al": 6}, {"f": [_S.unary("-", 66), _S.unary("-", 38), _S.unary("-", 10)]}, {"fl": [7, 8, 6]}, {"lift": _S.unary("-", 1)}])])
	_S.define(_e, "rad", _S.function_value(_e, "_f12"))
	_S.define(_e, "frameAt", _S.function_value(_e, "_f13"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "a", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")))
	return _S.merge([{"x": _S.binary("*", 22, _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))}, {"y": _S.binary("*", 7, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", 2, _S.read(_e, "a"))]))}, {"vx": _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")])}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "F", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "sh", [_S.binary("*", _S.read(_e, "s"), 2.5), _S.unary("-", 2)])
	_S.define(_e, "ar", _S.call_value(_S.read(_e, "rad"), [_S.prop(_S.read(_e, "F"), "arm")]))
	_S.define(_e, "wr", [_S.binary("+", _S.prop(_S.read(_e, "sh"), 0), _S.binary("*", _S.binary("*", _S.read(_e, "s"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ar")])), _S.prop(_S.read(_e, "F"), "al"))), _S.binary("+", _S.prop(_S.read(_e, "sh"), 1), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ar")]), _S.prop(_S.read(_e, "F"), "al")))])
	_S.define(_e, "tips", _S.invoke(_S.prop(_S.read(_e, "F"), "f"), "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "pull", _S.function_value(_e, "_f3"))
	_S.define(_e, "hip", [_S.binary("*", _S.read(_e, "s"), 2), 3.5])
	return _S.merge([{"sh": _S.read(_e, "sh")}, {"wr": _S.read(_e, "wr")}, {"tips": _S.read(_e, "tips")}, {"hip": _S.read(_e, "hip")}, {"poly": [_S.read(_e, "sh"), _S.read(_e, "wr"), _S.prop(_S.read(_e, "tips"), 0), _S.call_value(_S.read(_e, "pull"), [_S.prop(_S.read(_e, "tips"), 0), _S.prop(_S.read(_e, "tips"), 1), 0.22]), _S.prop(_S.read(_e, "tips"), 1), _S.call_value(_S.read(_e, "pull"), [_S.prop(_S.read(_e, "tips"), 1), _S.prop(_S.read(_e, "tips"), 2), 0.22]), _S.prop(_S.read(_e, "tips"), 2), _S.call_value(_S.read(_e, "pull"), [_S.prop(_S.read(_e, "tips"), 2), _S.read(_e, "hip"), 0.38]), _S.read(_e, "hip")]}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return [_S.binary("+", _S.prop(_S.read(_e, "wr"), 0), _S.binary("*", _S.binary("*", _S.read(_e, "s"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.call_value(_S.read(_e, "rad"), [_S.read(_e, "d")])])), _S.prop(_S.prop(_S.read(_e, "F"), "fl"), _S.read(_e, "i")))), _S.binary("+", _S.prop(_S.read(_e, "wr"), 1), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.call_value(_S.read(_e, "rad"), [_S.read(_e, "d")])]), _S.prop(_S.prop(_S.read(_e, "F"), "fl"), _S.read(_e, "i"))))]

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "k", _S.arg(_args, 2))
	return [_S.call_value(_S.read(_e, "lerp"), [_S.binary("/", _S.binary("+", _S.prop(_S.read(_e, "a"), 0), _S.prop(_S.read(_e, "b"), 0)), 2), _S.prop(_S.read(_e, "wr"), 0), _S.read(_e, "k")]), _S.call_value(_S.read(_e, "lerp"), [_S.binary("/", _S.binary("+", _S.prop(_S.read(_e, "a"), 1), _S.prop(_S.read(_e, "b"), 1)), 2), _S.prop(_S.read(_e, "wr"), 1), _S.read(_e, "k")])]

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "E", _S.arg(_args, 2))
	_S.define(_e, "F", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.invoke(_S.read(_e, "g"), "clear", [])
	for _v0 in _S.array([_S.unary("-", 1), 1]):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "w", _S.call_value(_S.read(_v2, "wingPts"), [_S.read(_v2, "F"), _S.read(_v2, "s")]))
		_S.define(_v2, "lead", _S.function_value(_v2, "_f5"))
		_S.invoke(_S.read(_v2, "g"), "poly", [_S.prop(_S.read(_v2, "w"), "poly"), _S.function_value(_v2, "_f6")])
		_S.invoke(_S.read(_v2, "g"), "line", [_S.prop(_S.prop(_S.read(_v2, "w"), "sh"), 0), _S.prop(_S.prop(_S.read(_v2, "w"), "sh"), 1), _S.prop(_S.prop(_S.read(_v2, "w"), "wr"), 0), _S.prop(_S.prop(_S.read(_v2, "w"), "wr"), 1), _S.prop(_S.read(_v2, "C"), 4)])
		for _v5 in _S.array(_S.prop(_S.read(_v2, "w"), "tips")):
			var _v6 = _S.scope(_v2)
			_S.define(_v6, "tip", _v5)
			_S.invoke(_S.read(_v6, "g"), "line", [_S.prop(_S.prop(_S.read(_v6, "w"), "wr"), 0), _S.prop(_S.prop(_S.read(_v6, "w"), "wr"), 1), _S.prop(_S.read(_v6, "tip"), 0), _S.prop(_S.read(_v6, "tip"), 1), _S.function_value(_v6, "_f7")])
		_S.invoke(_S.read(_v2, "g"), "set", [_S.prop(_S.prop(_S.read(_v2, "w"), "wr"), 0), _S.binary("-", _S.prop(_S.prop(_S.read(_v2, "w"), "wr"), 1), 1), _S.prop(_S.read(_v2, "C"), 5)])
	_S.invoke(_S.read(_e, "g"), "ellipse", [0, 0.5, 3.8, 4.8, _S.function_value(_e, "_f8")])
	for _v7 in _S.array([_S.unary("-", 1), 1]):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "s", _v7)
		var _v9 = _S.scope(_v8)
		_S.invoke(_S.read(_v9, "g"), "poly", [[[_S.binary("*", _S.read(_v9, "s"), 0.6), _S.unary("-", 3.5)], [_S.binary("*", _S.read(_v9, "s"), 3.6), _S.unary("-", 9.5)], [_S.binary("*", _S.read(_v9, "s"), 3.8), _S.unary("-", 3)]], (_S.prop(_S.read(_v9, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v9, "s"), 0)) else _S.prop(_S.read(_v9, "C"), 3))])
		_S.invoke(_S.read(_v9, "g"), "line", [_S.binary("*", _S.read(_v9, "s"), 2.6), _S.unary("-", 4), _S.binary("*", _S.read(_v9, "s"), 3.2), _S.unary("-", 7.5), _S.prop(_S.read(_v9, "C"), 5)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.unary("-", 2), _S.unary("-", 1), _S.prop(_S.read(_e, "E"), 1)])
	_S.invoke(_S.read(_e, "g"), "set", [1, _S.unary("-", 1), _S.prop(_S.read(_e, "E"), 1)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.unary("-", 1), 0, _S.prop(_S.read(_e, "C"), 1)])
	_S.invoke(_S.read(_e, "g"), "set", [0, 0, _S.prop(_S.read(_e, "C"), 1)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.unary("-", 1), 1, _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "g"), "set", [0, 1, _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.unary("-", 2), 5, _S.prop(_S.read(_e, "C"), 3)])
	_S.invoke(_S.read(_e, "g"), "set", [1, 5, _S.prop(_S.read(_e, "C"), 3)])
	_S.invoke(_S.read(_e, "g"), "outline", [_S.prop(_S.read(_e, "C"), 0)])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	var _v3 = _S.prop(_S.read(_e, "w"), "wr")
	_S.define(_e, "ax", _S.prop(_v3, 0))
	_S.define(_e, "ay", _S.prop(_v3, 1))
	var _v4 = _S.prop(_S.prop(_S.read(_e, "w"), "tips"), 0)
	_S.define(_e, "bx", _S.prop(_v4, 0))
	_S.define(_e, "by", _S.prop(_v4, 1))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "bx"), _S.read(_e, "ax")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "by"), _S.read(_e, "ay")))
	_S.define(_e, "L", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]), func(): return 1))
	return _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("/", _S.binary("-", _S.binary("*", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "ax")), _S.read(_e, "dy")), _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ay")), _S.read(_e, "dx"))), _S.read(_e, "L"))])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "near", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x"), _S.prop(_S.prop(_S.read(_e, "w"), "sh"), 0)), _S.binary("-", _S.read(_e, "y"), _S.prop(_S.prop(_S.read(_e, "w"), "sh"), 1))]))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.call_value(_S.read(_e, "lead"), [_S.read(_e, "x"), _S.read(_e, "y")]), 1.2), func(): return _S.binary("<", _S.prop(_S.read(_e, "F"), "arm"), 20))):
		return _S.prop(_S.read(_e, "C"), 3)
	return (_S.prop(_S.read(_e, "C"), 1) if _S.truth(_S.binary("<", _S.read(_e, "near"), 4.5)) else _S.prop(_S.read(_e, "C"), 2))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "C"), 3))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "nx", _S.arg(_args, 0))
	_S.define(_e, "ny", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.binary("+", _S.binary("*", _S.read(_e, "nx"), _S.unary("-", 0.6)), _S.binary("*", _S.read(_e, "ny"), _S.unary("-", 0.8))), 0.45)) else (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary(">", _S.binary("+", _S.binary("*", _S.read(_e, "nx"), 0.6), _S.binary("*", _S.read(_e, "ny"), 0.8)), 0.55)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "ny"), 0.1), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "nx")]), 0.5))) else _S.prop(_S.read(_e, "C"), 3))))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "E", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "eyes"), 4]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "t")]))
	_S.define(_e, "fi", _S.call_value(_S.read(_e, "frameAt"), [_S.read(_e, "t")]))
	_S.define(_e, "F", _S.prop(_S.read(_e, "FRAMES"), _S.read(_e, "fi")))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "S"), "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.prop(_S.read(_e, "F"), "lift"))]))
	var _v10 = _S.scope(_e)
	_S.define(_v10, "k", 2)
	while _S.truth(_S.binary("<=", _S.read(_v10, "k"), 16)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "A", _S.call_value(_S.read(_v11, "at"), [_S.binary("-", _S.read(_v11, "t"), _S.binary("*", _S.binary("-", _S.read(_v11, "k"), 1), 0.022))]))
		_S.define(_v11, "B2", _S.call_value(_S.read(_v11, "at"), [_S.binary("-", _S.read(_v11, "t"), _S.binary("*", _S.read(_v11, "k"), 0.022))]))
		_S.define(_v11, "u", _S.binary("-", 1, _S.binary("/", _S.read(_v11, "k"), 17)))
		for _v12 in _S.array([_S.unary("-", 1.5), 1.5]):
			var _v13 = _S.scope(_v11)
			_S.define(_v13, "ex", _v12)
			_S.invoke(_S.read(_v13, "p"), "glowLine", [_S.binary("+", _S.prop(_S.read(_v13, "A"), "x"), _S.read(_v13, "ex")), _S.binary("-", _S.prop(_S.read(_v13, "A"), "y"), 0.5), _S.binary("+", _S.prop(_S.read(_v13, "B2"), "x"), _S.read(_v13, "ex")), _S.binary("-", _S.prop(_S.read(_v13, "B2"), "y"), 0.5), 2.6, _S.prop(_S.read(_v13, "E"), 1), _S.binary("*", 0.16, _S.read(_v13, "u"))])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "k", 1, "+=", true)
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 9, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 11), 1), _S.read(_e, "D"), _S.function_value(_e, "_f10")])
	_S.define(_e, "g", _S.read(_e, "GRID"))
	if _S.truth(_S.binary("===", _S.read(_e, "fi"), 2)):
		var _v14 = _S.scope(_e)
		_S.call_value(_S.read(_v14, "bat"), [_S.read(_v14, "g"), _S.read(_v14, "C"), _S.read(_v14, "E"), _S.prop(_S.read(_v14, "FRAMES"), 1), _S.read(_v14, "t")])
		_S.invoke(_S.read(_v14, "g"), "recolor", [_S.function_value(_v14, "_f11")])
		_S.invoke(_S.prop(_S.read(_v14, "g"), "a"), "fill", [0.35])
		_S.invoke(_S.read(_v14, "g"), "draw", [_S.read(_v14, "p"), 1, _S.read(_v14, "X"), _S.binary("+", _S.binary("-", _S.read(_v14, "Y"), _S.prop(_S.prop(_S.read(_v14, "FRAMES"), 1), "lift")), _S.prop(_S.read(_v14, "F"), "lift"))])
	_S.call_value(_S.read(_e, "bat"), [_S.read(_e, "g"), _S.read(_e, "C"), _S.read(_e, "E"), _S.read(_e, "F"), _S.read(_e, "t")])
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p"), 1, _S.read(_e, "X"), _S.read(_e, "Y")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("-", _S.read(_e, "X"), 3), _S.binary("-", _S.read(_e, "Y"), 6), 10, _S.prop(_S.read(_e, "C"), 5), 0.12])
	for _v15 in _S.array([_S.unary("-", 1.5), 1.5]):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "ex", _v15)
		_S.last([_S.invoke(_S.read(_v16, "p"), "glow", [_S.binary("+", _S.read(_v16, "X"), _S.read(_v16, "ex")), _S.binary("-", _S.read(_v16, "Y"), 0.5), 7, _S.prop(_S.read(_v16, "E"), 1), 0.6]), _S.invoke(_S.read(_v16, "p"), "glow", [_S.binary("+", _S.read(_v16, "X"), _S.read(_v16, "ex")), _S.binary("-", _S.read(_v16, "Y"), 0.5), 2.5, _S.prop(_S.read(_v16, "E"), 2), 0.5])])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "X"), _S.read(_e, "Y"), 22, _S.prop(_S.read(_e, "E"), 0), 0.25])
	for _v17 in _S.array([0.3, 1.5]):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "g0", _v17)
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "k", _S.binary("/", _S.call_value(_S.read(_v19, "wrap"), [_S.binary("-", _S.read(_v19, "t"), _S.read(_v19, "g0")), _S.read(_v19, "D")]), 0.24))
		if _S.truth(_S.binary("<", _S.read(_v19, "k"), 1)):
			_S.call_value(_S.read(_v19, "sparkle"), [_S.read(_v19, "p"), _S.binary("-", _S.read(_v19, "X"), 2), _S.binary("-", _S.read(_v19, "Y"), 1), _S.binary("+", 1, _S.binary("*", 2.5, _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v19, "Math"), "PI"), _S.read(_v19, "k"))]))), _S.prop(_S.read(_v19, "E"), 3), _S.prop(_S.read(_v19, "E"), 2), _S.binary("*", 0.4, _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v19, "Math"), "PI"), _S.read(_v19, "k"))]))])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "x", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 50), 50]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 1.1), _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), 6))]), 3)))
	_S.define(_e, "y", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 34), 34]), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 2), 3]))))
	_S.define(_e, "tw", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2.6), _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), 6))]))
	_S.define(_e, "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 2), _S.binary("*", _S.binary("-", _S.read(_e, "L"), _S.read(_e, "age")), 2)]), _S.binary("+", 0.4, _S.binary("*", 0.5, _S.read(_e, "tw")))))
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "tw"), 0.7)) else _S.prop(_S.read(_e, "C"), 5)), _S.read(_e, "a")])
	if _S.truth(_S.binary(">", _S.read(_e, "tw"), 0.5)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.2, _S.read(_e, "a"))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	return _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.prop(_S.read(_e, "C"), 4), 0.35])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("/", _S.binary("*", _S.read(_e, "d"), _S.prop(_S.read(_e, "Math"), "PI")), 180)

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_e, "wrap"), [_S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "FLAPS")), 1]), 4)]), 4)
