@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/snow.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "pass", _S.import_value("fx/weather/_lib.js", "pass"))
	_S.define(_e, "trips", _S.import_value("fx/weather/_lib.js", "trips"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "layer", _S.function_value(_e, "_f3"))
	_S.define(_e, "crystal", _S.function_value(_e, "_f7"))
	_S.define(_e, "drift", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Snow"}, {"desc": "Snow at three depths in a gusty breeze: far specks, drifting flakes, big near crystals that spin and glow; they settle on a sparkling drift and melt away."}, {"tags": ["weather", "snow", "winter", "cold", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 12}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0c1020", "#161d36", "#24304f", "#3a4a72", "#5f74a3", "#93abd6", "#cfe0fa", "#ffffff"]}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 12)
	_S.define(_e, "bank", _S.function_value(_e, "_f10"))
	_S.define(_e, "gust", _S.function_value(_e, "_f11"))
	_S.define(_e, "LAYERS", [_S.merge([{"n": 230}, {"m": [1, 2]}, {"air": 1}, {"sway": [1, 3]}, {"wind": 3}, {"gust": 0.4}]), _S.merge([{"n": 140}, {"m": [2, 3]}, {"air": 0.8}, {"sway": [3, 7]}, {"wind": 6}, {"gust": 0.7}]), _S.merge([{"n": 24}, {"m": [2, 3]}, {"air": 0.74}, {"sway": [8, 15]}, {"wind": 9}, {"gust": 1}])])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_S.define(_e, "AXIS", [[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]])
	_S.define(_e, "DIAG", [[1, 1], [_S.unary("-", 1), _S.unary("-", 1)], [1, _S.unary("-", 1)], [_S.unary("-", 1), 1]])
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "haze", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 2), 0.4]))
	_S.call_value(_S.read(_e, "pass"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.unary("-", 170), 9, _S.function_value(_e, "_f1")])
	_S.call_value(_S.read(_e, "layer"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), 0])
	_S.call_value(_S.read(_e, "drift"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C")])
	_S.call_value(_S.read(_e, "layer"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), 1])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.set_prop(_S.read(_e, "out"), "c", _S.read(_e, "haze"), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.binary("+", 0.26, _S.binary("*", 0.22, _S.call_value(_S.read(_e, "smooth"), [_S.unary("-", 170), 0, _S.read(_e, "y")]))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "b", 1, "=", false)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.call_value(_S.read(_e, "layer"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), 2])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "L", _S.arg(_args, 4))
	_S.define(_e, "Ly", _S.prop(_S.read(_e, "LAYERS"), _S.read(_e, "L")))
	_S.define(_e, "sd", _S.binary("+", _S.binary("*", _S.read(_e, "S"), 13), _S.read(_e, "L")))
	_S.call_value(_S.read(_e, "trips"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.prop(_S.read(_e, "Ly"), "n"), _S.read(_e, "sd"), _S.prop(_S.prop(_S.read(_e, "Ly"), "m"), 0), _S.prop(_S.prop(_S.read(_e, "Ly"), "m"), 1), _S.function_value(_e, "_f4")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "m", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "j", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "k"), _S.read(_e, "m")]))
	_S.define(_e, "dur", _S.binary("/", _S.read(_e, "D"), _S.read(_e, "m")))
	_S.define(_e, "R", _S.function_value(_e, "_f5"))
	_S.define(_e, "tf", _S.binary("*", _S.read(_e, "dur"), _S.prop(_S.read(_e, "Ly"), "air")))
	_S.define(_e, "age", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("*", _S.read(_e, "u"), _S.read(_e, "dur")), _S.read(_e, "tf")]))
	_S.define(_e, "sw", _S.binary("+", _S.prop(_S.prop(_S.read(_e, "Ly"), "sway"), 0), _S.binary("*", _S.call_value(_S.read(_e, "R"), [3]), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "Ly"), "sway"), 1), _S.prop(_S.prop(_S.read(_e, "Ly"), "sway"), 0)))))
	_S.define(_e, "f", _S.binary("+", 0.25, _S.binary("*", _S.call_value(_S.read(_e, "R"), [4]), 0.35)))
	_S.define(_e, "ph", _S.binary("*", _S.call_value(_S.read(_e, "R"), [5]), _S.read(_e, "TAU")))
	_S.define(_e, "xAt", _S.function_value(_e, "_f6"))
	_S.define(_e, "x", _S.call_value(_S.read(_e, "xAt"), [_S.read(_e, "age")]))
	_S.define(_e, "xl", _S.call_value(_S.read(_e, "xAt"), [_S.read(_e, "tf")]))
	_S.define(_e, "y0", _S.unary("-", 176))
	_S.define(_e, "y1", (_S.binary("-", _S.call_value(_S.read(_e, "bank"), [_S.read(_e, "xl")]), 0.5) if _S.truth(_S.read(_e, "L")) else _S.binary("+", _S.unary("-", 110), _S.binary("*", _S.call_value(_S.read(_e, "R"), [1]), 106))))
	_S.define(_e, "y", _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0")), _S.binary("/", _S.read(_e, "age"), _S.read(_e, "tf")))))
	_S.define(_e, "rest", _S.binary("-", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "dur")), _S.read(_e, "tf")))
	if _S.truth(_S.binary("===", _S.read(_e, "L"), 0)):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "a", _S.invoke(_S.read(_v0, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_v0, "u")), 6)]))
		_S.invoke(_S.read(_v0, "q"), "dot", [_S.read(_v0, "x"), _S.read(_v0, "y"), (_S.prop(_S.read(_v0, "C"), 4) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v0, "R"), [6]), 0.5)) else _S.prop(_S.read(_v0, "C"), 5)), _S.read(_v0, "a")])
		return null
	_S.define(_e, "fade", (_S.binary("-", 1, _S.binary("/", _S.read(_e, "rest"), _S.binary("-", _S.read(_e, "dur"), _S.read(_e, "tf")))) if _S.truth(_S.binary(">", _S.read(_e, "rest"), 0)) else 1))
	if _S.truth(_S.binary("===", _S.read(_e, "L"), 1)):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "big", _S.binary("<", _S.call_value(_S.read(_v1, "R"), [6]), 0.3))
		if _S.truth(_S.binary(">", _S.read(_v1, "rest"), 0)):
			return _S.unary("void", _S.invoke(_S.read(_v1, "q"), "dot", [_S.read(_v1, "xl"), _S.read(_v1, "y1"), _S.prop(_S.read(_v1, "C"), 7), _S.binary("*", _S.read(_v1, "fade"), 0.9)]))
		_S.invoke(_S.read(_v1, "q"), "px", [_S.read(_v1, "x"), _S.read(_v1, "y"), (_S.read(_v1, "WHITE") if _S.truth(_S.read(_v1, "big")) else _S.prop(_S.read(_v1, "C"), 7))])
		if _S.truth(_S.read(_v1, "big")):
			for _v2 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
				var _v3 = _S.scope(_v1)
				var _v4 = _v2
				_S.define(_v3, "dx", _S.prop(_v4, 0))
				_S.define(_v3, "dy", _S.prop(_v4, 1))
				_S.invoke(_S.read(_v3, "q"), "px", [_S.binary("+", _S.read(_v3, "x"), _S.read(_v3, "dx")), _S.binary("+", _S.read(_v3, "y"), _S.read(_v3, "dy")), _S.prop(_S.read(_v3, "C"), 5)])
		else:
			_S.last([_S.invoke(_S.read(_v1, "q"), "px", [_S.binary("+", _S.read(_v1, "x"), 1), _S.read(_v1, "y"), _S.prop(_S.read(_v1, "C"), 6)]), _S.invoke(_S.read(_v1, "q"), "px", [_S.read(_v1, "x"), _S.binary("+", _S.read(_v1, "y"), 1), _S.prop(_S.read(_v1, "C"), 6)]), _S.invoke(_S.read(_v1, "q"), "px", [_S.binary("+", _S.read(_v1, "x"), 1), _S.binary("+", _S.read(_v1, "y"), 1), _S.prop(_S.read(_v1, "C"), 5)])])
		return null
	_S.define(_e, "r", (3 if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "R"), [6]), 0.4)) else (4 if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "R"), [6]), 0.8)) else 5)))
	_S.define(_e, "spin", _S.binary("+", 1.5, _S.binary("*", _S.call_value(_S.read(_e, "R"), [7]), 2.5)))
	if _S.truth(_S.binary(">", _S.read(_e, "rest"), 0)):
		var _v5 = _S.scope(_e)
		_S.invoke(_S.read(_v5, "q"), "dot", [_S.binary("-", _S.read(_v5, "xl"), 1), _S.read(_v5, "y1"), _S.prop(_S.read(_v5, "C"), 6), _S.read(_v5, "fade")])
		_S.invoke(_S.read(_v5, "q"), "dot", [_S.read(_v5, "xl"), _S.read(_v5, "y1"), _S.read(_v5, "WHITE"), _S.read(_v5, "fade")])
		_S.invoke(_S.read(_v5, "q"), "dot", [_S.binary("+", _S.read(_v5, "xl"), 1), _S.read(_v5, "y1"), _S.prop(_S.read(_v5, "C"), 6), _S.read(_v5, "fade")])
		_S.invoke(_S.read(_v5, "q"), "glow", [_S.read(_v5, "xl"), _S.read(_v5, "y1"), 5, _S.prop(_S.read(_v5, "C"), 5), _S.binary("*", 0.25, _S.read(_v5, "fade"))])
		return null
	_S.call_value(_S.read(_e, "crystal"), [_S.read(_e, "q"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), _S.read(_e, "spin")), _S.binary("*", _S.call_value(_S.read(_e, "R"), [8]), 2))]), 2), _S.read(_e, "C")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "n", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "sd"), _S.read(_e, "i"), _S.read(_e, "j"), _S.read(_e, "n")])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", _S.unary("-", 175), _S.binary("*", _S.call_value(_S.read(_e, "R"), [2]), 350)), _S.binary("*", _S.prop(_S.read(_e, "Ly"), "wind"), _S.read(_e, "a"))), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "gust"), [_S.binary("+", _S.binary("-", _S.read(_e, "t"), _S.binary("*", _S.read(_e, "u"), _S.read(_e, "dur"))), _S.read(_e, "a"))]), _S.call_value(_S.read(_e, "gust"), [_S.binary("-", _S.read(_e, "t"), _S.binary("*", _S.read(_e, "u"), _S.read(_e, "dur")))])), _S.prop(_S.read(_e, "Ly"), "gust"))), _S.binary("*", _S.read(_e, "sw"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "f")), _S.read(_e, "a")), _S.read(_e, "ph"))])))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "turn", _S.arg(_args, 4))
	_S.define(_e, "C", _S.arg(_args, 5))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.define(_e, "long", (_S.read(_e, "DIAG") if _S.truth(_S.read(_e, "turn")) else _S.read(_e, "AXIS")))
	_S.define(_e, "short", (_S.read(_e, "AXIS") if _S.truth(_S.read(_e, "turn")) else _S.read(_e, "DIAG")))
	_S.define(_e, "R", (_S.binary("-", _S.read(_e, "r"), 1) if _S.truth(_S.read(_e, "turn")) else _S.read(_e, "r")))
	for _v6 in _S.array(_S.read(_e, "long")):
		var _v7 = _S.scope(_e)
		var _v8 = _v6
		_S.define(_v7, "dx", _S.prop(_v8, 0))
		_S.define(_v7, "dy", _S.prop(_v8, 1))
		var _v9 = _S.scope(_v7)
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "d", 1)
		while _S.truth(_S.binary("<=", _S.read(_v10, "d"), _S.read(_v10, "R"))):
			_S.invoke(_S.read(_v10, "q"), "px", [_S.binary("+", _S.read(_v10, "X"), _S.binary("*", _S.read(_v10, "dx"), _S.read(_v10, "d"))), _S.binary("+", _S.read(_v10, "Y"), _S.binary("*", _S.read(_v10, "dy"), _S.read(_v10, "d"))), (_S.read(_v10, "WHITE") if _S.truth(_S.binary("===", _S.read(_v10, "d"), _S.read(_v10, "R"))) else _S.prop(_S.read(_v10, "C"), 6))])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "d", 1, "+=", true)
		_S.define(_v9, "nubs", (([_S.binary("-", _S.read(_v9, "R"), 1)] if _S.truth(_S.binary(">=", _S.read(_v9, "R"), 3)) else []) if _S.truth(_S.read(_v9, "turn")) else ([_S.binary("-", _S.read(_v9, "R"), 1), _S.binary("-", _S.read(_v9, "R"), 2)] if _S.truth(_S.binary(">=", _S.read(_v9, "R"), 5)) else ([_S.binary("-", _S.read(_v9, "R"), 1)] if _S.truth(_S.binary(">=", _S.read(_v9, "R"), 4)) else []))))
		for _v11 in _S.array(_S.read(_v9, "nubs")):
			var _v12 = _S.scope(_v9)
			_S.define(_v12, "n", _v11)
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "ox", (_S.read(_v13, "dx") if _S.truth(_S.read(_v13, "turn")) else _S.read(_v13, "dy")))
			_S.define(_v13, "oy", (_S.unary("-", _S.read(_v13, "dy")) if _S.truth(_S.read(_v13, "turn")) else _S.unary("-", _S.read(_v13, "dx"))))
			_S.invoke(_S.read(_v13, "q"), "px", [_S.binary("+", _S.binary("+", _S.read(_v13, "X"), _S.binary("*", _S.read(_v13, "dx"), _S.read(_v13, "n"))), (0 if _S.truth(_S.read(_v13, "turn")) else _S.read(_v13, "ox"))), _S.binary("+", _S.binary("+", _S.read(_v13, "Y"), _S.binary("*", _S.read(_v13, "dy"), _S.read(_v13, "n"))), (_S.read(_v13, "oy") if _S.truth(_S.read(_v13, "turn")) else _S.read(_v13, "oy"))), _S.prop(_S.read(_v13, "C"), 4)])
			_S.invoke(_S.read(_v13, "q"), "px", [_S.binary("+", _S.binary("+", _S.binary("+", _S.read(_v13, "X"), _S.binary("*", _S.read(_v13, "dx"), _S.read(_v13, "n"))), (_S.unary("-", _S.read(_v13, "dx")) if _S.truth(_S.read(_v13, "turn")) else _S.unary("-", _S.read(_v13, "ox")))), (_S.read(_v13, "dx") if _S.truth(_S.read(_v13, "turn")) else 0)), _S.binary("+", _S.binary("+", _S.read(_v13, "Y"), _S.binary("*", _S.read(_v13, "dy"), _S.read(_v13, "n"))), (_S.binary("*", _S.read(_v13, "dy"), 0) if _S.truth(_S.read(_v13, "turn")) else _S.unary("-", _S.read(_v13, "oy")))), _S.prop(_S.read(_v13, "C"), 4)])
	for _v14 in _S.array(_S.read(_e, "short")):
		var _v15 = _S.scope(_e)
		var _v16 = _v14
		_S.define(_v15, "dx", _S.prop(_v16, 0))
		_S.define(_v15, "dy", _S.prop(_v16, 1))
		var _v17 = _S.scope(_v15)
		_S.define(_v17, "d", 1)
		while _S.truth(_S.binary("<=", _S.read(_v17, "d"), (1 if _S.truth(_S.read(_v17, "turn")) else _S.invoke(_S.read(_v17, "Math"), "max", [1, _S.invoke(_S.read(_v17, "Math"), "floor", [_S.binary("/", _S.read(_v17, "R"), 2)])])))):
			_S.invoke(_S.read(_v17, "q"), "px", [_S.binary("+", _S.read(_v17, "X"), _S.binary("*", _S.read(_v17, "dx"), _S.read(_v17, "d"))), _S.binary("+", _S.read(_v17, "Y"), _S.binary("*", _S.read(_v17, "dy"), _S.read(_v17, "d"))), (_S.prop(_S.read(_v17, "C"), 6) if _S.truth(_S.binary("===", _S.read(_v17, "d"), 1)) else _S.prop(_S.read(_v17, "C"), 5))])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "d", 1, "+=", true)
	_S.invoke(_S.read(_e, "q"), "px", [_S.read(_e, "X"), _S.read(_e, "Y"), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "q"), "glow", [_S.binary("+", _S.read(_e, "X"), 0.5), _S.binary("+", _S.read(_e, "Y"), 0.5), _S.binary("+", _S.binary("*", _S.read(_e, "r"), 2.5), 5), _S.prop(_S.read(_e, "C"), 5), 0.13])
	_S.invoke(_S.read(_e, "q"), "light", [_S.read(_e, "X"), _S.read(_e, "Y"), _S.prop(_S.read(_e, "C"), 6), 0.4])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.call_value(_S.read(_e, "pass"), [_S.read(_e, "q"), _S.read(_e, "meta"), _S.unary("-", 7), 9, _S.function_value(_e, "_f9")])
	var _v18 = _S.scope(_e)
	_S.define(_v18, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "i"), 18)):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "x", _S.binary("+", _S.unary("-", 156), _S.binary("*", _S.call_value(_S.read(_v19, "rand"), [_S.read(_v19, "S"), _S.read(_v19, "i"), 81]), 312)))
		_S.define(_v19, "c", _S.binary("+", 1, _S.invoke(_S.read(_v19, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v19, "rand"), [_S.read(_v19, "S"), _S.read(_v19, "i"), 82]), 3)])))
		_S.define(_v19, "tw", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v19, "TAU"), _S.read(_v19, "c")), _S.read(_v19, "t")), _S.read(_v19, "D")), _S.binary("*", _S.call_value(_S.read(_v19, "rand"), [_S.read(_v19, "S"), _S.read(_v19, "i"), 83]), _S.read(_v19, "TAU")))]))
		if _S.truth(_S.binary("<", _S.read(_v19, "tw"), 0.55)):
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
			continue
		_S.define(_v19, "y", _S.binary("+", _S.invoke(_S.read(_v19, "Math"), "ceil", [_S.call_value(_S.read(_v19, "bank"), [_S.read(_v19, "x")])]), _S.invoke(_S.read(_v19, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v19, "rand"), [_S.read(_v19, "S"), _S.read(_v19, "i"), 84]), 3)])))
		_S.define(_v19, "k", _S.binary("/", _S.binary("-", _S.read(_v19, "tw"), 0.55), 0.45))
		_S.invoke(_S.read(_v19, "q"), "px", [_S.read(_v19, "x"), _S.read(_v19, "y"), _S.read(_v19, "WHITE")])
		if _S.truth(_S.binary(">", _S.read(_v19, "k"), 0.5)):
			for _v20 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, _S.unary("-", 1)]]):
				var _v21 = _S.scope(_v19)
				var _v22 = _v20
				_S.define(_v21, "dx", _S.prop(_v22, 0))
				_S.define(_v21, "dy", _S.prop(_v22, 1))
				_S.invoke(_S.read(_v21, "q"), "px", [_S.binary("+", _S.read(_v21, "x"), _S.read(_v21, "dx")), _S.binary("+", _S.read(_v21, "y"), _S.read(_v21, "dy")), _S.prop(_S.read(_v21, "C"), 6)])
		_S.invoke(_S.read(_v19, "q"), "glow", [_S.binary("+", _S.read(_v19, "x"), 0.5), _S.binary("+", _S.read(_v19, "y"), 0.5), 6, _S.prop(_S.read(_v19, "C"), 6), _S.binary("*", 0.35, _S.read(_v19, "k"))])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "i", 1, "+=", true)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "top", _S.call_value(_S.read(_e, "bank"), [_S.read(_e, "x")]))
	_S.define(_e, "d", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "top")))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 0)):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "d"), 1)) else (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary("<", _S.read(_e, "d"), 2)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "d"), 3.5)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "d"), 6)) else _S.prop(_S.read(_e, "C"), 4))))), "=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 1)):
		_S.last([_S.set_prop(_S.read(_e, "out"), "l", _S.prop(_S.read(_e, "C"), 6), "=", false), _S.set_prop(_S.read(_e, "out"), "k", 0.12, "=", false)])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.binary("+", _S.unary("-", 3), _S.binary("*", 1.6, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "x"), 0.045), 1.3)]))), _S.binary("*", 1.1, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "x"), 0.12), 0.4)]))), _S.binary("*", 0.6, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "x"), 0.31), 2)])))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("*", 10, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), _S.read(_e, "D")), 0.6)])), _S.binary("*", 4, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), 2), _S.read(_e, "t")), _S.read(_e, "D")), 2.1)])))
