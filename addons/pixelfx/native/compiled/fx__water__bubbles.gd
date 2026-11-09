@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/bubbles.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "rock", _S.import_value("fx/water/_lib.js", "rock"))
	_S.define(_e, "bubble", _S.function_value(_e, "_f0"))
	_S.define(_e, "each", _S.function_value(_e, "_f2"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Bubbles"}, {"desc": "Bubbles stream up from a vent of pebbles, wobbling and swelling as they rise, flare as they cross shafts of light from the surface, then dome up and pop there."}, {"tags": ["water", "bubbles", "underwater", "vent", "ambient", "loop"]}, {"size": [104, 112]}, {"origin": [52, 104]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "TOP", _S.unary("-", 92))
	_S.define(_e, "HALF", 48)
	_S.define(_e, "surfaceY", _S.function_value(_e, "_f10"))
	_S.define(_e, "shaft", _S.function_value(_e, "_f11"))
	_S.define(_e, "MOUTHS", [_S.unary("-", 5), 1, 6])
	_exports["drawBack"] = _S.read(_e, "drawBack")
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
	_S.define(_e, "q", _S.arg(_args, 5))
	_S.define(_e, "lit", _S.arg(_args, 6))
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 0.9)):
		return _S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.3)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "r"), 0.7)) else _S.prop(_S.read(_e, "C"), 6)))])
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 1.5)):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "X", _S.invoke(_S.read(_v0, "Math"), "floor", [_S.read(_v0, "x")]))
		_S.define(_v0, "Y", _S.invoke(_S.read(_v0, "Math"), "floor", [_S.read(_v0, "y")]))
		_S.invoke(_S.read(_v0, "p"), "px", [_S.read(_v0, "X"), _S.read(_v0, "Y"), _S.read(_v0, "WHITE")])
		_S.invoke(_S.read(_v0, "p"), "px", [_S.binary("+", _S.read(_v0, "X"), 1), _S.read(_v0, "Y"), _S.prop(_S.read(_v0, "C"), 6)])
		_S.invoke(_S.read(_v0, "p"), "px", [_S.read(_v0, "X"), _S.binary("+", _S.read(_v0, "Y"), 1), _S.prop(_S.read(_v0, "C"), 5)])
		_S.invoke(_S.read(_v0, "p"), "px", [_S.binary("+", _S.read(_v0, "X"), 1), _S.binary("+", _S.read(_v0, "Y"), 1), _S.prop(_S.read(_v0, "C"), 4)])
		_S.invoke(_S.read(_v0, "p"), "glow", [_S.binary("+", _S.read(_v0, "x"), 0.5), _S.binary("+", _S.read(_v0, "y"), 0.5), 3, _S.prop(_S.read(_v0, "C"), 5), _S.binary("+", 0.12, _S.binary("*", 0.2, _S.read(_v0, "lit")))])
		return null
	_S.define(_e, "rx", _S.binary("*", _S.read(_e, "r"), _S.binary("+", 1, _S.read(_e, "q"))))
	_S.define(_e, "ry", _S.binary("*", _S.read(_e, "r"), _S.binary("-", 1, _S.read(_e, "q"))))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "rx")), 1), _S.binary("-", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ry")), 1), _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "rx")), 1), _S.binary("+", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "ry")), 1), _S.function_value(_e, "_f1")])
	_S.invoke(_S.read(_e, "p"), "px", [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "rx"), 0.45))]), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "ry"), 0.45))]), _S.read(_e, "WHITE")])
	if _S.truth(_S.binary(">=", _S.read(_e, "r"), 2.5)):
		_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "rx"), 0.45))]), 1), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "ry"), 0.45))]), _S.prop(_S.read(_e, "C"), 6)])
	if _S.truth(_S.binary(">=", _S.read(_e, "r"), 2)):
		_S.invoke(_S.read(_e, "p"), "px", [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "rx"), 0.5))]), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "ry"), 0.5))]), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.binary("*", _S.read(_e, "r"), 2.4), 2), _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.12, _S.binary("*", 0.3, _S.read(_e, "lit")))])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")), _S.read(_e, "rx")))
	_S.define(_e, "dy", _S.binary("/", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")), _S.read(_e, "ry")))
	_S.define(_e, "d", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]), _S.read(_e, "r")))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "r"), 0.5))):
		return null
	_S.define(_e, "l", _S.binary("/", _S.binary("/", _S.binary("-", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "dy")), _S.prop(_S.read(_e, "Math"), "SQRT2")), _S.invoke(_S.read(_e, "Math"), "max", [0.01, _S.binary("/", _S.read(_e, "d"), _S.read(_e, "r"))])))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("-", _S.read(_e, "r"), 0.6))):
		_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.45)) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary("<", _S.read(_e, "l"), _S.unary("-", 0.55))) else _S.prop(_S.read(_e, "C"), 4))), "=", false)
	else:
		_S.invoke(_S.read(_e, "p"), "blend", [_S.read(_e, "px"), _S.read(_e, "py"), _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.16, _S.binary("*", 0.2, _S.read(_e, "lit")))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "S", _S.arg(_args, 1))
	_S.define(_e, "fn", _S.arg(_args, 2))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 46, _S.read(_e, "S"), _S.function_value(_e, "_f3"), _S.function_value(_e, "_f4")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [2.2, 3.4])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "m", _S.prop(_S.read(_e, "MOUTHS"), _S.binary("%", _S.read(_e, "i"), 3)))
	_S.define(_e, "r0", (_S.invoke(_S.read(_e, "r"), "range", [0.5, 1.4]) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.7)) else _S.invoke(_S.read(_e, "r"), "range", [1.6, 2.6])))
	_S.define(_e, "vy", _S.binary("+", _S.binary("+", 30, _S.binary("*", 9, _S.read(_e, "r0"))), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 4), 4])))
	_S.define(_e, "wf", _S.invoke(_S.read(_e, "r"), "range", [3, 6]))
	_S.define(_e, "wa", _S.binary("+", 0.8, _S.binary("*", _S.read(_e, "r0"), 1.2)))
	_S.define(_e, "ph0", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "drift", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 4), 4]))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", 2), _S.binary("*", _S.read(_e, "vy"), _S.read(_e, "age"))))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.unary("-", _S.read(_e, "y")), _S.unary("-", _S.read(_e, "TOP")))]))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.read(_e, "m"), _S.binary("*", _S.read(_e, "drift"), _S.read(_e, "k"))), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), _S.read(_e, "wf")), _S.read(_e, "ph0"))]), _S.read(_e, "wa")), _S.read(_e, "k"))))
	_S.call_value(_S.read(_e, "fn"), [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"r": _S.binary("*", _S.read(_e, "r0"), _S.binary("+", 1, _S.binary("*", 0.45, _S.read(_e, "k"))))}, {"q": _S.binary("*", _S.binary("*", 0.12, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "age"), _S.read(_e, "wf")), 2), _S.read(_e, "ph0"))])), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "r0"), 2)]))}, {"i": _S.read(_e, "i")}, {"age": _S.read(_e, "age")}, {"vy": _S.read(_e, "vy")}])])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "Y", _S.binary("-", _S.read(_v1, "TOP"), 2))
	while _S.truth(_S.binary("<", _S.read(_v1, "Y"), 0)):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "X", _S.unary("-", _S.read(_v2, "HALF")))
		while _S.truth(_S.binary("<", _S.read(_v2, "X"), _S.read(_v2, "HALF"))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "x", _S.binary("+", _S.read(_v3, "X"), 0.5))
			_S.define(_v3, "y", _S.binary("+", _S.read(_v3, "Y"), 0.5))
			_S.define(_v3, "sy", _S.call_value(_S.read(_v3, "surfaceY"), [_S.read(_v3, "x"), _S.read(_v3, "ph")]))
			if _S.truth(_S.binary("<", _S.read(_v3, "y"), _S.read(_v3, "sy"))):
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "X", 1, "+=", true)
				continue
			_S.define(_v3, "e", _S.binary("-", 1, _S.call_value(_S.read(_v3, "smooth"), [_S.binary("-", _S.read(_v3, "HALF"), 14), _S.read(_v3, "HALF"), _S.invoke(_S.read(_v3, "Math"), "abs", [_S.read(_v3, "x")])])))
			_S.define(_v3, "depth", _S.binary("/", _S.binary("-", _S.read(_v3, "y"), _S.read(_v3, "TOP")), _S.unary("-", _S.read(_v3, "TOP"))))
			_S.invoke(_S.read(_v3, "p"), "blend", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.prop(_S.read(_v3, "C"), 1), _S.binary("*", _S.binary("+", 0.22, _S.binary("*", 0.22, _S.read(_v3, "depth"))), _S.read(_v3, "e"))])
			_S.define(_v3, "s", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v3, "shaft"), [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.read(_v3, "ph")]), _S.binary("-", 1, _S.binary("*", _S.read(_v3, "depth"), 0.7))), _S.read(_v3, "e")))
			if _S.truth(_S.binary(">", _S.read(_v3, "s"), 0.05)):
				_S.invoke(_S.read(_v3, "p"), "light", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.prop(_S.read(_v3, "C"), 4), _S.binary("*", 0.2, _S.read(_v3, "s"))])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "X", 1, "+=", true)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "Y", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "X", _S.unary("-", _S.read(_v4, "HALF")))
	while _S.truth(_S.binary("<", _S.read(_v4, "X"), _S.read(_v4, "HALF"))):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "x", _S.binary("+", _S.read(_v5, "X"), 0.5))
		_S.define(_v5, "e", _S.binary("-", 1, _S.call_value(_S.read(_v5, "smooth"), [_S.binary("-", _S.read(_v5, "HALF"), 14), _S.read(_v5, "HALF"), _S.invoke(_S.read(_v5, "Math"), "abs", [_S.read(_v5, "x")])])))
		_S.define(_v5, "s", _S.call_value(_S.read(_v5, "shaft"), [_S.read(_v5, "x"), _S.unary("-", 2), _S.read(_v5, "ph")]))
		_S.define(_v5, "c", _S.invoke(_S.read(_v5, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "abs", [_S.invoke(_S.read(_v5, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v5, "x"), 0.42), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v5, "x"), 0.11), _S.binary("*", _S.binary("*", _S.read(_v5, "ph"), _S.read(_v5, "TAU")), 2))]), 2.2))])]), 2.4))]))
		if _S.truth(_S.binary(">", _S.binary("*", _S.binary("*", _S.read(_v5, "s"), _S.read(_v5, "c")), _S.read(_v5, "e")), 0.05)):
			var _v6 = _S.scope(_v5)
			_S.invoke(_S.read(_v6, "p"), "light", [_S.read(_v6, "x"), _S.unary("-", 1), _S.prop(_S.read(_v6, "C"), 5), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_v6, "s")), _S.read(_v6, "c")), _S.read(_v6, "e"))])
			_S.invoke(_S.read(_v6, "p"), "light", [_S.read(_v6, "x"), _S.unary("-", 2), _S.prop(_S.read(_v6, "C"), 4), _S.binary("*", _S.binary("*", _S.binary("*", 0.25, _S.read(_v6, "s")), _S.read(_v6, "c")), _S.read(_v6, "e"))])
			_S.invoke(_S.read(_v6, "p"), "light", [_S.read(_v6, "x"), 0, _S.prop(_S.read(_v6, "C"), 4), _S.binary("*", _S.binary("*", _S.binary("*", 0.3, _S.read(_v6, "s")), _S.read(_v6, "c")), _S.read(_v6, "e"))])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "X", 1, "+=", true)
	_S.define(_e, "ST", _S.call_value(_S.read(_e, "rock"), []))
	for _v7 in _S.array([[_S.unary("-", 9), _S.unary("-", 1.5), 2.4], [_S.unary("-", 4), _S.unary("-", 1), 1.8], [3.5, _S.unary("-", 1.2), 2.2], [9, _S.unary("-", 1.4), 2.6], [0, _S.unary("-", 0.6), 1.4], [_S.unary("-", 12.5), _S.unary("-", 0.8), 1.6]]):
		var _v8 = _S.scope(_e)
		var _v9 = _v7
		_S.define(_v8, "x", _S.prop(_v9, 0))
		_S.define(_v8, "y", _S.prop(_v9, 1))
		_S.define(_v8, "rr", _S.prop(_v9, 2))
		_S.invoke(_S.read(_v8, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_v8, "x"), _S.read(_v8, "rr")), 1), _S.binary("-", _S.binary("-", _S.read(_v8, "y"), _S.read(_v8, "rr")), 1), _S.binary("+", _S.binary("+", _S.read(_v8, "x"), _S.read(_v8, "rr")), 1), _S.binary("+", _S.binary("+", _S.read(_v8, "y"), _S.read(_v8, "rr")), 1), _S.function_value(_v8, "_f6")])
	for _v10 in _S.array(_S.read(_e, "MOUTHS")):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "m", _v10)
		_S.invoke(_S.read(_v11, "p"), "px", [_S.read(_v11, "m"), _S.unary("-", 1), _S.prop(_S.read(_v11, "ST"), 0)])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("*", _S.read(_e, "dx"), 1.1), _S.read(_e, "dy")]))
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "rr"), 0.7)), func(): return _S.binary(">", _S.read(_e, "py"), 0))):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "ST"), 0) if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "rr"))) else (_S.prop(_S.read(_e, "ST"), 5) if _S.truth(_S.binary("<", _S.binary("+", _S.read(_e, "dx"), _S.read(_e, "dy")), _S.binary("*", _S.unary("-", _S.read(_e, "rr")), 0.6))) else (_S.prop(_S.read(_e, "ST"), 3) if _S.truth(_S.binary("<", _S.binary("+", _S.read(_e, "dx"), _S.read(_e, "dy")), _S.binary("*", _S.read(_e, "rr"), 0.3))) else _S.prop(_S.read(_e, "ST"), 2)))), "=", false)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 26, _S.binary("+", _S.read(_e, "S"), 7), _S.read(_e, "D"), _S.function_value(_e, "_f8")])
	_S.call_value(_S.read(_e, "each"), [_S.read(_e, "t"), _S.read(_e, "S"), _S.function_value(_e, "_f9")])
	var _v18 = _S.scope(_e)
	_S.define(_v18, "X", _S.unary("-", _S.read(_v18, "HALF")))
	while _S.truth(_S.binary("<", _S.read(_v18, "X"), _S.read(_v18, "HALF"))):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "x", _S.binary("+", _S.read(_v19, "X"), 0.5))
		_S.define(_v19, "y", _S.call_value(_S.read(_v19, "surfaceY"), [_S.read(_v19, "x"), _S.read(_v19, "ph")]))
		_S.define(_v19, "e", _S.binary("-", 1, _S.call_value(_S.read(_v19, "smooth"), [_S.binary("-", _S.read(_v19, "HALF"), 12), _S.read(_v19, "HALF"), _S.invoke(_S.read(_v19, "Math"), "abs", [_S.read(_v19, "x")])])))
		_S.define(_v19, "glint", _S.binary(">", _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_v19, "x"), 0.37), _S.binary("*", _S.binary("*", _S.read(_v19, "ph"), _S.read(_v19, "TAU")), 3))]), _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v19, "x"), 0.13), _S.binary("*", _S.read(_v19, "ph"), _S.read(_v19, "TAU")))])), 0.55))
		_S.invoke(_S.read(_v19, "p"), "dot", [_S.read(_v19, "X"), _S.read(_v19, "y"), (_S.read(_v19, "WHITE") if _S.truth(_S.read(_v19, "glint")) else _S.prop(_S.read(_v19, "C"), 5)), _S.binary("*", _S.read(_v19, "e"), 1.3)])
		_S.invoke(_S.read(_v19, "p"), "dot", [_S.read(_v19, "X"), _S.binary("+", _S.read(_v19, "y"), 1), _S.prop(_S.read(_v19, "C"), 3), _S.binary("*", _S.read(_v19, "e"), 1.3)])
		if _S.truth(_S.binary("===", _S.binary("&", _S.read(_v19, "X"), 3), 0)):
			_S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "x"), _S.binary("+", _S.read(_v19, "y"), 1), 7, _S.prop(_S.read(_v19, "C"), 5), _S.binary("*", (0.22 if _S.truth(_S.read(_v19, "glint")) else 0.1), _S.read(_v19, "e"))])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "X", 1, "+=", true)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "x", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [_S.binary("+", _S.unary("-", _S.read(_e, "HALF")), 6), _S.binary("-", _S.read(_e, "HALF"), 6)]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "D")), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))]), 3)))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", _S.read(_e, "TOP"), 6), _S.binary("%", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [0, 86]), _S.binary("*", _S.read(_e, "age"), 4)), 86)))
	_S.define(_e, "s", _S.call_value(_S.read(_e, "shaft"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "ph")]))
	_S.define(_e, "tw", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "D")), _S.read(_e, "TAU")), 3), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))]))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "tw"), _S.unary("-", 0.3)), func(): return _S.binary("<", _S.read(_e, "s"), 0.2))):
		return null
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "s"), 0.4)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "tw"), 0.6)) else _S.prop(_S.read(_e, "C"), 4)))])
	if _S.truth(_S.binary(">", _S.read(_e, "s"), 0.4)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.25, _S.read(_e, "s"))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.call_value(_S.read(_e, "surfaceY"), [_S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "ph")]))
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "b"), "y"), _S.binary("+", _S.read(_e, "sy"), _S.prop(_S.read(_e, "b"), "r")))):
		_S.call_value(_S.read(_e, "bubble"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.prop(_S.read(_e, "b"), "x"), _S.prop(_S.read(_e, "b"), "y"), _S.prop(_S.read(_e, "b"), "r"), _S.prop(_S.read(_e, "b"), "q"), _S.call_value(_S.read(_e, "shaft"), [_S.prop(_S.read(_e, "b"), "x"), _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "ph")])])
	else:
		var _v12 = _S.scope(_e)
		_S.define(_v12, "since", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v12, "sy"), _S.prop(_S.read(_v12, "b"), "r")), _S.prop(_S.read(_v12, "b"), "y")), _S.prop(_S.read(_v12, "b"), "vy")))
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v12, "since"), 0.12), func(): return _S.binary(">=", _S.prop(_S.read(_v12, "b"), "r"), 1.4))):
			var _v13 = _S.scope(_v12)
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "a", _S.prop(_S.read(_v14, "Math"), "PI"))
			while _S.truth(_S.binary("<=", _S.read(_v14, "a"), _S.binary("+", _S.read(_v14, "TAU"), 0.01))):
				_S.invoke(_S.read(_v14, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v14, "b"), "x"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.prop(_S.read(_v14, "b"), "r"))), _S.binary("+", _S.read(_v14, "sy"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.prop(_S.read(_v14, "b"), "r")), 0.9)), _S.prop(_S.read(_v14, "C"), 6)])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "a", _S.binary("/", 0.4, _S.prop(_S.read(_v14, "b"), "r")), "+=", false)
			_S.invoke(_S.read(_v13, "p"), "px", [_S.binary("-", _S.prop(_S.read(_v13, "b"), "x"), _S.binary("*", _S.prop(_S.read(_v13, "b"), "r"), 0.4)), _S.binary("-", _S.read(_v13, "sy"), _S.binary("*", _S.prop(_S.read(_v13, "b"), "r"), 0.6)), _S.read(_v13, "WHITE")])
		else:
			if _S.truth(_S.binary("<", _S.read(_v12, "since"), (0.32 if _S.truth(_S.binary(">=", _S.prop(_S.read(_v12, "b"), "r"), 1.4)) else 0.2))):
				var _v15 = _S.scope(_v12)
				_S.define(_v15, "k", _S.call_value(_S.read(_v15, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v15, "since"), (0.12 if _S.truth(_S.binary(">=", _S.prop(_S.read(_v15, "b"), "r"), 1.4)) else 0)), 0.2)]))
				_S.define(_v15, "w", _S.invoke(_S.read(_v15, "Math"), "max", [1, _S.binary("+", _S.binary("+", _S.prop(_S.read(_v15, "b"), "r"), 1), _S.binary("*", _S.read(_v15, "k"), 4))]))
				var _v16 = _S.scope(_v15)
				_S.define(_v16, "a", 0)
				while _S.truth(_S.binary("<", _S.read(_v16, "a"), _S.prop(_S.read(_v16, "Math"), "PI"))):
					if _S.truth(_S.binary(">", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), 0.15)):
						_S.invoke(_S.read(_v16, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v16, "b"), "x"), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.read(_v16, "w"))), _S.binary("+", _S.read(_v16, "sy"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.read(_v16, "w")), 0.3)), (_S.read(_v16, "WHITE") if _S.truth(_S.binary("<", _S.read(_v16, "k"), 0.4)) else _S.prop(_S.read(_v16, "C"), 5)), _S.binary("-", 1.2, _S.read(_v16, "k"))])
					_v16 = _S.iteration(_v16)
					_S.write(_v16, "a", _S.binary("/", 0.5, _S.read(_v16, "w")), "+=", false)
				if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v15, "b"), "r"), 1.4), func(): return _S.binary("<", _S.read(_v15, "k"), 0.6))):
					var _v17 = _S.scope(_v15)
					_S.invoke(_S.read(_v17, "p"), "px", [_S.binary("-", _S.prop(_S.read(_v17, "b"), "x"), 2), _S.binary("-", _S.binary("-", _S.read(_v17, "sy"), 2), _S.binary("*", _S.read(_v17, "k"), 4)), _S.prop(_S.read(_v17, "C"), 6)])
					_S.invoke(_S.read(_v17, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v17, "b"), "x"), 2), _S.binary("-", _S.binary("-", _S.read(_v17, "sy"), 3), _S.binary("*", _S.read(_v17, "k"), 5)), _S.prop(_S.read(_v17, "C"), 6)])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "ph", _S.arg(_args, 1))
	return _S.binary("+", _S.binary("+", _S.read(_e, "TOP"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "x"), 0.13), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2))]), 1.1)), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_e, "x"), 0.051), _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")))]), 1.3))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "TOP")), 0.32)))
	_S.define(_e, "s", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "u"), 0.16), _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")))]), 0.6), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.read(_e, "u"), 0.07), _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))), 1)]), 0.4)))
	return _S.binary("/", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "s"), 0.35)]), 0.65)
