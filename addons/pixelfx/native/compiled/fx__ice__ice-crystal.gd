@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/ice-crystal.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "norm", _S.function_value(_e, "_f0"))
	_S.define(_e, "crystalFaces", _S.function_value(_e, "_f1"))
	_S.define(_e, "hullOf", _S.function_value(_e, "_f10"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f13"))
	_S.define(_e, "motes", _S.function_value(_e, "_f14"))
	_S.define(_e, "draw", _S.function_value(_e, "_f17"))
	_S.define(_e, "meta", _S.merge([{"name": "Ice crystal"}, {"desc": "A floating ice crystal turning slowly in its own cold light: its facets brighten and darken as they turn, glints flash on them, frost motes circle it."}, {"tags": ["ice", "crystal", "gem", "pickup", "float", "magic", "loop"]}, {"size": [96, 100]}, {"origin": [48, 92]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"height": 34}, {"seed": 21}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "TIP", 0.28)
	_S.define(_e, "LIGHT", _S.call_value(_S.read(_e, "norm"), [[_S.unary("-", 0.55), _S.unary("-", 0.75), _S.unary("-", 0.45)]]))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	var _v0 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v0, 0))
	_S.define(_e, "y", _S.prop(_v0, 1))
	_S.define(_e, "z", _S.prop(_v0, 2))
	_S.define(_e, "l", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "z")]), func(): return 1))
	return [_S.binary("/", _S.read(_e, "x"), _S.read(_e, "l")), _S.binary("/", _S.read(_e, "y"), _S.read(_e, "l")), _S.binary("/", _S.read(_e, "z"), _S.read(_e, "l"))]

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "th", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	_S.define(_e, "ct", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "TIP")]))
	_S.define(_e, "st", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "TIP")]))
	_S.define(_e, "P", _S.function_value(_e, "_f2"))
	_S.define(_e, "ring", _S.function_value(_e, "_f3"))
	_S.define(_e, "top", _S.call_value(_S.read(_e, "ring"), [_S.binary("*", _S.unary("-", _S.read(_e, "R")), 0.45)]))
	_S.define(_e, "bot", _S.call_value(_S.read(_e, "ring"), [_S.binary("*", _S.read(_e, "R"), 0.45)]))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "P"), [0, _S.binary("*", _S.unary("-", _S.read(_e, "R")), 2.2), 0]))
	_S.define(_e, "Z", _S.call_value(_S.read(_e, "P"), [0, _S.binary("*", _S.read(_e, "R"), 1.7), 0]))
	_S.define(_e, "faces", [])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "k"), 6)):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "j", _S.binary("%", _S.binary("+", _S.read(_v2, "k"), 1), 6))
		_S.invoke(_S.read(_v2, "faces"), "push", [[_S.read(_v2, "A"), _S.prop(_S.read(_v2, "top"), _S.read(_v2, "j")), _S.prop(_S.read(_v2, "top"), _S.read(_v2, "k"))], [_S.prop(_S.read(_v2, "top"), _S.read(_v2, "k")), _S.prop(_S.read(_v2, "top"), _S.read(_v2, "j")), _S.prop(_S.read(_v2, "bot"), _S.read(_v2, "j")), _S.prop(_S.read(_v2, "bot"), _S.read(_v2, "k"))], [_S.prop(_S.read(_v2, "bot"), _S.read(_v2, "k")), _S.prop(_S.read(_v2, "bot"), _S.read(_v2, "j")), _S.read(_v2, "Z")]])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "k", 1, "+=", true)
	_S.define(_e, "out", [])
	for _v3 in _S.array(_S.read(_e, "faces")):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "f", _v3)
		var _v5 = _S.scope(_v4)
		var _v6 = _S.read(_v5, "f")
		_S.define(_v5, "a", _S.prop(_v6, 0))
		_S.define(_v5, "b", _S.prop(_v6, 1))
		_S.define(_v5, "c", _S.prop(_v6, 2))
		_S.define(_v5, "u", [_S.binary("-", _S.prop(_S.read(_v5, "b"), 0), _S.prop(_S.read(_v5, "a"), 0)), _S.binary("-", _S.prop(_S.read(_v5, "b"), 1), _S.prop(_S.read(_v5, "a"), 1)), _S.binary("-", _S.prop(_S.read(_v5, "b"), 2), _S.prop(_S.read(_v5, "a"), 2))])
		_S.define(_v5, "v", [_S.binary("-", _S.prop(_S.read(_v5, "c"), 0), _S.prop(_S.read(_v5, "a"), 0)), _S.binary("-", _S.prop(_S.read(_v5, "c"), 1), _S.prop(_S.read(_v5, "a"), 1)), _S.binary("-", _S.prop(_S.read(_v5, "c"), 2), _S.prop(_S.read(_v5, "a"), 2))])
		_S.define(_v5, "n", _S.call_value(_S.read(_v5, "norm"), [[_S.binary("-", _S.binary("*", _S.prop(_S.read(_v5, "u"), 1), _S.prop(_S.read(_v5, "v"), 2)), _S.binary("*", _S.prop(_S.read(_v5, "u"), 2), _S.prop(_S.read(_v5, "v"), 1))), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v5, "u"), 2), _S.prop(_S.read(_v5, "v"), 0)), _S.binary("*", _S.prop(_S.read(_v5, "u"), 0), _S.prop(_S.read(_v5, "v"), 2))), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v5, "u"), 0), _S.prop(_S.read(_v5, "v"), 1)), _S.binary("*", _S.prop(_S.read(_v5, "u"), 1), _S.prop(_S.read(_v5, "v"), 0)))]]))
		_S.define(_v5, "cx", _S.binary("/", _S.invoke(_S.read(_v5, "f"), "reduce", [_S.function_value(_v5, "_f5"), 0]), _S.prop(_S.read(_v5, "f"), "length")))
		_S.define(_v5, "cy", _S.binary("/", _S.invoke(_S.read(_v5, "f"), "reduce", [_S.function_value(_v5, "_f6"), 0]), _S.prop(_S.read(_v5, "f"), "length")))
		_S.define(_v5, "cz", _S.binary("/", _S.invoke(_S.read(_v5, "f"), "reduce", [_S.function_value(_v5, "_f7"), 0]), _S.prop(_S.read(_v5, "f"), "length")))
		if _S.truth(_S.binary("<", _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v5, "n"), 0), _S.read(_v5, "cx")), _S.binary("*", _S.prop(_S.read(_v5, "n"), 1), _S.read(_v5, "cy"))), _S.binary("*", _S.prop(_S.read(_v5, "n"), 2), _S.read(_v5, "cz"))), 0)):
			_S.write(_v5, "n", _S.invoke(_S.read(_v5, "n"), "map", [_S.function_value(_v5, "_f8")]), "=", false)
		if _S.truth(_S.binary(">=", _S.prop(_S.read(_v5, "n"), 2), _S.unary("-", 0.02))):
			continue
		_S.define(_v5, "lit", _S.invoke(_S.read(_v5, "Math"), "max", [0, _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v5, "n"), 0), _S.prop(_S.read(_v5, "LIGHT"), 0)), _S.binary("*", _S.prop(_S.read(_v5, "n"), 1), _S.prop(_S.read(_v5, "LIGHT"), 1))), _S.binary("*", _S.prop(_S.read(_v5, "n"), 2), _S.prop(_S.read(_v5, "LIGHT"), 2)))]))
		_S.define(_v5, "h", _S.call_value(_S.read(_v5, "norm"), [[_S.prop(_S.read(_v5, "LIGHT"), 0), _S.prop(_S.read(_v5, "LIGHT"), 1), _S.binary("-", _S.prop(_S.read(_v5, "LIGHT"), 2), 1)]]))
		_S.define(_v5, "spec", _S.invoke(_S.read(_v5, "Math"), "max", [0, _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v5, "n"), 0), _S.prop(_S.read(_v5, "h"), 0)), _S.binary("*", _S.prop(_S.read(_v5, "n"), 1), _S.prop(_S.read(_v5, "h"), 1))), _S.binary("*", _S.prop(_S.read(_v5, "n"), 2), _S.prop(_S.read(_v5, "h"), 2)))]))
		_S.invoke(_S.read(_v5, "out"), "push", [_S.merge([{"pts": _S.invoke(_S.read(_v5, "f"), "map", [_S.function_value(_v5, "_f9")])}, {"lit": _S.read(_v5, "lit")}, {"spec": _S.read(_v5, "spec")}, {"cx": _S.read(_v5, "cx")}, {"cy": _S.read(_v5, "cy")}])])
	return _S.read(_e, "out")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "z", _S.arg(_args, 2))
	return [_S.read(_e, "x"), _S.binary("-", _S.binary("*", _S.read(_e, "y"), _S.read(_e, "ct")), _S.binary("*", _S.read(_e, "z"), _S.read(_e, "st"))), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.read(_e, "st")), _S.binary("*", _S.read(_e, "z"), _S.read(_e, "ct")))]

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 6}]), _S.function_value(_e, "_f4")])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "P"), [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.read(_e, "th"), _S.binary("/", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "TAU")), 6))]), _S.read(_e, "R")), _S.read(_e, "y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.read(_e, "th"), _S.binary("/", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "TAU")), 6))]), _S.read(_e, "R"))])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("+", _S.read(_e, "s"), _S.prop(_S.read(_e, "q"), 0))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("+", _S.read(_e, "s"), _S.prop(_S.read(_e, "q"), 1))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("+", _S.read(_e, "s"), _S.prop(_S.read(_e, "q"), 2))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.unary("-", _S.read(_e, "q"))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return [_S.prop(_S.read(_e, "q"), 0), _S.prop(_S.read(_e, "q"), 1)]

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "P", _S.invoke(_S.concat([_S.array(_S.read(_e, "pts"))]), "sort", [_S.function_value(_e, "_f11")]))
	_S.define(_e, "cross", _S.function_value(_e, "_f12"))
	_S.define(_e, "lo", [])
	_S.define(_e, "hi", [])
	for _v7 in _S.array(_S.read(_e, "P")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "q", _v7)
		var _v9 = _S.scope(_v8)
		while _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v9, "lo"), "length"), 2), func(): return _S.binary("<=", _S.call_value(_S.read(_v9, "cross"), [_S.prop(_S.read(_v9, "lo"), _S.binary("-", _S.prop(_S.read(_v9, "lo"), "length"), 2)), _S.prop(_S.read(_v9, "lo"), _S.binary("-", _S.prop(_S.read(_v9, "lo"), "length"), 1)), _S.read(_v9, "q")]), 0))):
			_S.invoke(_S.read(_v9, "lo"), "pop", [])
		_S.invoke(_S.read(_v9, "lo"), "push", [_S.read(_v9, "q")])
	for _v10 in _S.array(_S.invoke(_S.read(_e, "P"), "reverse", [])):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "q", _v10)
		var _v12 = _S.scope(_v11)
		while _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v12, "hi"), "length"), 2), func(): return _S.binary("<=", _S.call_value(_S.read(_v12, "cross"), [_S.prop(_S.read(_v12, "hi"), _S.binary("-", _S.prop(_S.read(_v12, "hi"), "length"), 2)), _S.prop(_S.read(_v12, "hi"), _S.binary("-", _S.prop(_S.read(_v12, "hi"), "length"), 1)), _S.read(_v12, "q")]), 0))):
			_S.invoke(_S.read(_v12, "hi"), "pop", [])
		_S.invoke(_S.read(_v12, "hi"), "push", [_S.read(_v12, "q")])
	return _S.invoke(_S.invoke(_S.read(_e, "lo"), "slice", [0, _S.unary("-", 1)]), "concat", [_S.invoke(_S.read(_e, "hi"), "slice", [0, _S.unary("-", 1)])])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.logical("||", _S.binary("-", _S.prop(_S.read(_e, "a"), 0), _S.prop(_S.read(_e, "b"), 0)), func(): return _S.binary("-", _S.prop(_S.read(_e, "a"), 1), _S.prop(_S.read(_e, "b"), 1)))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	_S.define(_e, "b", _S.arg(_args, 2))
	return _S.binary("-", _S.binary("*", _S.binary("-", _S.prop(_S.read(_e, "a"), 0), _S.prop(_S.read(_e, "o"), 0)), _S.binary("-", _S.prop(_S.read(_e, "b"), 1), _S.prop(_S.read(_e, "o"), 1))), _S.binary("*", _S.binary("-", _S.prop(_S.read(_e, "a"), 1), _S.prop(_S.read(_e, "o"), 1)), _S.binary("-", _S.prop(_S.read(_e, "b"), 0), _S.prop(_S.read(_e, "o"), 0))))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	_S.define(_e, "bob", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "ph"))]), 2.5))
	_S.define(_e, "Y", _S.binary("+", _S.unary("-", _S.prop(_S.read(_e, "o"), "height")), _S.read(_e, "bob")))
	_S.define(_e, "s", _S.binary("-", 1, _S.binary("/", _S.read(_e, "bob"), 12)))
	_S.define(_e, "rx", _S.binary("*", 11, _S.read(_e, "s")))
	var _v13 = _S.scope(_e)
	_S.define(_v13, "x", _S.invoke(_S.read(_v13, "Math"), "floor", [_S.unary("-", _S.read(_v13, "rx"))]))
	while _S.truth(_S.binary("<=", _S.read(_v13, "x"), _S.read(_v13, "rx"))):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "f", _S.binary("-", 1, _S.binary("**", _S.binary("/", _S.read(_v14, "x"), _S.read(_v14, "rx")), 2)))
		_S.invoke(_S.read(_v14, "p"), "blend", [_S.binary("+", _S.read(_v14, "x"), 0.5), 0, _S.prop(_S.read(_v14, "C"), 0), _S.binary("*", 0.65, _S.read(_v14, "f"))])
		if _S.truth(_S.binary("<", _S.invoke(_S.read(_v14, "Math"), "abs", [_S.read(_v14, "x")]), _S.binary("*", _S.read(_v14, "rx"), 0.6))):
			_S.invoke(_S.read(_v14, "p"), "blend", [_S.binary("+", _S.read(_v14, "x"), 0.5), 1, _S.prop(_S.read(_v14, "C"), 0), _S.binary("*", 0.4, _S.read(_v14, "f"))])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "x", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 1), 24, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.2, _S.binary("*", 0.05, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "ph")), 2)])))])
	_S.call_value(_S.read(_e, "motes"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "o"), _S.read(_e, "Y"), false])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "o", _S.arg(_args, 3))
	_S.define(_e, "Y", _S.arg(_args, 4))
	_S.define(_e, "front", _S.arg(_args, 5))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 16, _S.prop(_S.read(_e, "o"), "seed"), _S.function_value(_e, "_f15"), _S.function_value(_e, "_f16")])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [1.6, 2.6])

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "th", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [1.6, 2.6]))))
	_S.define(_e, "R", _S.invoke(_S.read(_e, "r"), "range", [14, 22]))
	_S.define(_e, "y", _S.binary("-", _S.binary("+", _S.read(_e, "Y"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 14), 12])), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [3, 7]))))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	if _S.truth(_S.binary("!==", _S.binary(">=", _S.read(_e, "s"), 0), _S.read(_e, "front"))):
		return null
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "R")))
	_S.define(_e, "yy", _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "s"), _S.read(_e, "R")), 0.3)))
	_S.define(_e, "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "age"), 0.2)]), (_S.binary("/", _S.binary("-", 1, _S.read(_e, "k")), 0.25) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.75)) else 1)))
	if _S.truth(_S.read(_e, "front")):
		var _v15 = _S.scope(_e)
		_S.invoke(_S.read(_v15, "p"), "dot", [_S.read(_v15, "x"), _S.read(_v15, "yy"), (_S.read(_v15, "WHITE") if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v15, "i"), 4), 0)) else _S.prop(_S.read(_v15, "C"), 6)), _S.read(_v15, "a")])
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v15, "i"), 4), 0)):
			for _v16 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
				var _v17 = _S.scope(_v15)
				var _v18 = _v16
				_S.define(_v17, "dx", _S.prop(_v18, 0))
				_S.define(_v17, "dy", _S.prop(_v18, 1))
				_S.invoke(_S.read(_v17, "p"), "dot", [_S.binary("+", _S.read(_v17, "x"), _S.read(_v17, "dx")), _S.binary("+", _S.read(_v17, "yy"), _S.read(_v17, "dy")), _S.prop(_S.read(_v17, "C"), 5), _S.read(_v17, "a")])
		_S.invoke(_S.read(_v15, "p"), "glow", [_S.read(_v15, "x"), _S.read(_v15, "yy"), 4, _S.prop(_S.read(_v15, "C"), 5), _S.binary("*", 0.3, _S.read(_v15, "a"))])
	else:
		_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "yy"), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.read(_e, "a"), 0.9)])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	_S.define(_e, "bob", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "ph"))]), 2.5))
	_S.define(_e, "Y", _S.binary("+", _S.unary("-", _S.prop(_S.read(_e, "o"), "height")), _S.read(_e, "bob")))
	_S.define(_e, "R", 8)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "Y"), 34, _S.prop(_S.read(_e, "C"), 3), 0.26])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "Y"), 14, _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.18, _S.binary("*", 0.08, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "ph")), 3)])))])
	_S.define(_e, "faces", _S.call_value(_S.read(_e, "crystalFaces"), [_S.binary("*", _S.binary("/", _S.read(_e, "TAU"), 6), _S.read(_e, "ph")), _S.read(_e, "R")]))
	_S.define(_e, "hull", _S.call_value(_S.read(_e, "hullOf"), [_S.invoke(_S.read(_e, "faces"), "flatMap", [_S.function_value(_e, "_f18")])]))
	_S.define(_e, "mx", 0)
	_S.define(_e, "my", 0)
	for _v19 in _S.array(_S.read(_e, "hull")):
		var _v20 = _S.scope(_e)
		var _v21 = _v19
		_S.define(_v20, "x", _S.prop(_v21, 0))
		_S.define(_v20, "y", _S.prop(_v21, 1))
		_S.last([_S.write(_v20, "mx", _S.read(_v20, "x"), "+=", false), _S.write(_v20, "my", _S.read(_v20, "y"), "+=", false)])
	_S.last([_S.write(_e, "mx", _S.prop(_S.read(_e, "hull"), "length"), "/=", false), _S.write(_e, "my", _S.prop(_S.read(_e, "hull"), "length"), "/=", false)])
	_S.invoke(_S.read(_e, "p"), "poly", [_S.invoke(_S.read(_e, "hull"), "map", [_S.function_value(_e, "_f19")]), _S.prop(_S.read(_e, "C"), 1)])
	for _v23 in _S.array(_S.read(_e, "faces")):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "f", _v23)
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "c", (_S.read(_v25, "WHITE") if _S.truth(_S.binary(">", _S.prop(_S.read(_v25, "f"), "spec"), 0.985)) else _S.prop(_S.read(_v25, "C"), _S.call_value(_S.read(_v25, "clamp"), [_S.invoke(_S.read(_v25, "Math"), "round", [_S.binary("+", 1, _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "pow", [_S.prop(_S.read(_v25, "f"), "lit"), 1.4]), 6.6))]), 1, 7]))))
		_S.invoke(_S.read(_v25, "p"), "poly", [_S.invoke(_S.prop(_S.read(_v25, "f"), "pts"), "map", [_S.function_value(_v25, "_f20")]), _S.read(_v25, "c")])
	for _v27 in _S.array(_S.read(_e, "faces")):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "f", _v27)
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), _S.prop(_S.prop(_S.read(_v29, "f"), "pts"), "length"))):
			var _v30 = _S.scope(_v29)
			var _v31 = _S.prop(_S.prop(_S.read(_v30, "f"), "pts"), _S.read(_v30, "i"))
			_S.define(_v30, "x0", _S.prop(_v31, 0))
			_S.define(_v30, "y0", _S.prop(_v31, 1))
			var _v32 = _S.prop(_S.prop(_S.read(_v30, "f"), "pts"), _S.binary("%", _S.binary("+", _S.read(_v30, "i"), 1), _S.prop(_S.prop(_S.read(_v30, "f"), "pts"), "length")))
			_S.define(_v30, "x1", _S.prop(_v32, 0))
			_S.define(_v30, "y1", _S.prop(_v32, 1))
			_S.invoke(_S.read(_v30, "p"), "line", [_S.read(_v30, "x0"), _S.binary("+", _S.read(_v30, "y0"), _S.read(_v30, "Y")), _S.read(_v30, "x1"), _S.binary("+", _S.read(_v30, "y1"), _S.read(_v30, "Y")), (_S.prop(_S.read(_v30, "C"), 7) if _S.truth(_S.binary(">", _S.prop(_S.read(_v30, "f"), "lit"), 0.6)) else (_S.prop(_S.read(_v30, "C"), 6) if _S.truth(_S.binary(">", _S.prop(_S.read(_v30, "f"), "lit"), 0.3)) else _S.prop(_S.read(_v30, "C"), 4)))])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
	for _v33 in _S.array(_S.read(_e, "faces")):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "f", _v33)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v34, "f"), "spec"), 0.96)):
			_S.call_value(_S.read(_v34, "sparkle"), [_S.read(_v34, "p"), _S.prop(_S.read(_v34, "f"), "cx"), _S.binary("+", _S.prop(_S.read(_v34, "f"), "cy"), _S.read(_v34, "Y")), _S.invoke(_S.read(_v34, "Math"), "round", [_S.binary("+", 2, _S.binary("*", _S.binary("-", _S.prop(_S.read(_v34, "f"), "spec"), 0.96), 150))]), _S.prop(_S.read(_v34, "C"), 6), _S.prop(_S.read(_v34, "C"), 4), 0.5])
	_S.define(_e, "g", _S.binary("%", _S.binary("*", _S.read(_e, "ph"), 2), 1))
	if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.12)):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.binary("-", _S.read(_e, "Y"), _S.binary("*", _S.binary("*", _S.read(_e, "R"), 2.2), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "TIP")]))), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", 5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "g"), 0.12), _S.prop(_S.read(_e, "Math"), "PI"))]))]), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 4), 0.6])
	_S.call_value(_S.read(_e, "motes"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "o"), _S.read(_e, "Y"), true])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "f"), "pts")

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v22 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v22, 0))
	_S.define(_e, "y", _S.prop(_v22, 1))
	_S.define(_e, "d", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "mx")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "my"))]), func(): return 1))
	return [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "mx")), _S.read(_e, "d")), 1.2)), _S.binary("+", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "Y")), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "my")), _S.read(_e, "d")), 1.2))]

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v26 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v26, 0))
	_S.define(_e, "y", _S.prop(_v26, 1))
	return [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "Y"))]
