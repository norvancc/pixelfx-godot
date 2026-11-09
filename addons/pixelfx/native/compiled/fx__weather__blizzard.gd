@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/blizzard.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "field", _S.import_value("fx/weather/_lib.js", "field"))
	_S.define(_e, "sample", _S.import_value("fx/weather/_lib.js", "sample"))
	_S.define(_e, "trips", _S.import_value("fx/weather/_lib.js", "trips"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "streaks", _S.function_value(_e, "_f2"))
	_S.define(_e, "sheets", _S.function_value(_e, "_f7"))
	_S.define(_e, "ground", _S.function_value(_e, "_f9"))
	_S.define(_e, "meta", _S.merge([{"name": "Blizzard"}, {"desc": "Snow driven almost flat by a gale: streaks at three depths race past, gusts throw translucent sheets of snow across the sky and spindrift streams off the drifts."}, {"tags": ["weather", "blizzard", "snow", "wind", "storm", "winter", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 8}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0d111f", "#182035", "#27324d", "#3e4d6e", "#64779c", "#9cb0d0", "#d8e4f6", "#ffffff"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 8)
	_S.define(_e, "gustAt", _S.function_value(_e, "_f12"))
	_S.define(_e, "bank", _S.function_value(_e, "_f13"))
	_S.define(_e, "LAYERS", [_S.merge([{"n": 240}, {"m": [3, 4]}, {"len": [2, 4]}, {"drop": [10, 40]}, {"col": [3, 4, 5]}]), _S.merge([{"n": 130}, {"m": [4, 5]}, {"len": [5, 8]}, {"drop": [20, 60]}, {"col": [4, 5, 6]}]), _S.merge([{"n": 34}, {"m": [6, 7]}, {"len": [10, 16]}, {"drop": [30, 70]}, {"col": [4, 6, 7]}, {"near": true}])])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_S.define(_e, "GX", _S.construct(_S.read(_e, "Float32Array"), [320]))
	_S.define(_e, "WV", _S.construct(_S.read(_e, "Float32Array"), [320]))
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
	_S.call_value(_S.read(_e, "sheets"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), 0])
	_S.call_value(_S.read(_e, "streaks"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), 0])
	_S.call_value(_S.read(_e, "streaks"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), 1])
	_S.call_value(_S.read(_e, "ground"), [_S.read(_e, "p"), _S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.call_value(_S.read(_e, "sheets"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), 1])
	_S.call_value(_S.read(_e, "streaks"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), 2])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "L", _S.arg(_args, 4))
	_S.define(_e, "Ly", _S.prop(_S.read(_e, "LAYERS"), _S.read(_e, "L")))
	_S.define(_e, "sd", _S.binary("+", _S.binary("*", _S.read(_e, "S"), 17), _S.read(_e, "L")))
	var _v0 = _S.invoke(_S.prop(_S.read(_e, "Ly"), "col"), "map", [_S.function_value(_e, "_f3")])
	_S.define(_e, "c0", _S.prop(_v0, 0))
	_S.define(_e, "c1", _S.prop(_v0, 1))
	_S.define(_e, "c2", _S.prop(_v0, 2))
	_S.call_value(_S.read(_e, "trips"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.prop(_S.read(_e, "Ly"), "n"), _S.read(_e, "sd"), _S.prop(_S.prop(_S.read(_e, "Ly"), "m"), 0), _S.prop(_S.prop(_S.read(_e, "Ly"), "m"), 1), _S.function_value(_e, "_f4")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "C"), _S.read(_e, "i"))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "m", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "j", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "k"), _S.read(_e, "m")]))
	_S.define(_e, "R", _S.function_value(_e, "_f5"))
	_S.define(_e, "drop", _S.binary("+", _S.prop(_S.prop(_S.read(_e, "Ly"), "drop"), 0), _S.binary("*", _S.call_value(_S.read(_e, "R"), [3]), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "Ly"), "drop"), 1), _S.prop(_S.prop(_S.read(_e, "Ly"), "drop"), 0)))))
	_S.define(_e, "x", _S.binary("+", _S.unary("-", 190), _S.binary("*", 380, _S.read(_e, "u"))))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", _S.binary("+", _S.unary("-", 178), _S.binary("*", _S.call_value(_S.read(_e, "R"), [1]), 182)), _S.binary("*", _S.read(_e, "drop"), _S.read(_e, "u"))), _S.binary("*", 3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "TAU")), _S.binary("+", 1, _S.call_value(_S.read(_e, "R"), [5]))), _S.binary("*", _S.call_value(_S.read(_e, "R"), [6]), 6))]))))
	if _S.truth(_S.binary(">", _S.read(_e, "y"), _S.binary("-", _S.call_value(_S.read(_e, "bank"), [_S.read(_e, "x")]), 1))):
		return null
	_S.define(_e, "g", _S.call_value(_S.read(_e, "gustAt"), [_S.read(_e, "x"), _S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_e, "Ly"), "near")), func(): return _S.binary(">", _S.call_value(_S.read(_e, "R"), [7]), _S.binary("+", 0.45, _S.binary("*", 0.75, _S.read(_e, "g")))))):
		return null
	_S.define(_e, "L", _S.binary("*", _S.binary("+", _S.prop(_S.prop(_S.read(_e, "Ly"), "len"), 0), _S.binary("*", _S.call_value(_S.read(_e, "R"), [2]), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "Ly"), "len"), 1), _S.prop(_S.prop(_S.read(_e, "Ly"), "len"), 0)))), _S.binary("+", 0.7, _S.binary("*", 0.6, _S.read(_e, "g")))))
	_S.define(_e, "dx", _S.binary("/", 380, _S.binary("/", _S.read(_e, "D"), _S.read(_e, "m"))))
	_S.define(_e, "dy", _S.binary("/", _S.read(_e, "drop"), _S.binary("/", _S.read(_e, "D"), _S.read(_e, "m"))))
	_S.define(_e, "l", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	_S.define(_e, "ux", _S.binary("/", _S.read(_e, "dx"), _S.read(_e, "l")))
	_S.define(_e, "uy", _S.binary("/", _S.read(_e, "dy"), _S.read(_e, "l")))
	_S.invoke(_S.read(_e, "q"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "L"))), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "L"))), _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "L")), 0.45)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "L")), 0.45)), _S.read(_e, "c0"), _S.function_value(_e, "_f6")])
	_S.invoke(_S.read(_e, "q"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "L")), 0.45)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "L")), 0.45)), _S.binary("-", _S.read(_e, "x"), _S.read(_e, "ux")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "uy")), _S.read(_e, "c1")])
	_S.invoke(_S.read(_e, "q"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "g"), 0.6), func(): return _S.prop(_S.read(_e, "Ly"), "near"))) else _S.read(_e, "c2"))])
	if _S.truth(_S.prop(_S.read(_e, "Ly"), "near")):
		_S.invoke(_S.read(_e, "q"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 5, _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.12, _S.binary("*", 0.12, _S.read(_e, "g")))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "n", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "sd"), _S.read(_e, "i"), _S.read(_e, "j"), _S.read(_e, "n")])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return _S.binary("+", 0.3, _S.binary("*", 0.7, _S.read(_e, "v")))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "near", _S.arg(_args, 4))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "field"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "S"), 3), 7), _S.read(_e, "near")), 256, 128]))
	_S.define(_e, "shift", _S.binary("/", _S.binary("*", _S.binary("*", 256, (3 if _S.truth(_S.read(_e, "near")) else 2)), _S.read(_e, "t")), _S.read(_e, "D")))
	_S.define(_e, "c", (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.read(_e, "near")) else _S.prop(_S.read(_e, "C"), 5)))
	_S.define(_e, "y0", (_S.unary("-", 110) if _S.truth(_S.read(_e, "near")) else _S.unary("-", 170)))
	_S.define(_e, "haze", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), 0.5]))
	_S.define(_e, "sy", (4.5 if _S.truth(_S.read(_e, "near")) else 3.2))
	_S.define(_e, "th", (0.58 if _S.truth(_S.read(_e, "near")) else 0.54))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "i"), 320)):
		_S.last([_S.set_prop(_S.read(_v1, "GX"), _S.read(_v1, "i"), _S.call_value(_S.read(_v1, "gustAt"), [_S.binary("+", _S.binary("-", _S.read(_v1, "i"), 160), 0.5), _S.read(_v1, "t")]), "=", false), _S.set_prop(_S.read(_v1, "WV"), _S.read(_v1, "i"), _S.binary("*", 5, _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.binary("-", _S.read(_v1, "i"), 160), 0.021), _S.binary("/", _S.binary("*", _S.read(_v1, "TAU"), _S.read(_v1, "t")), _S.read(_v1, "D"))), _S.binary("*", _S.read(_v1, "near"), 2))])), "=", false)])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "rows"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.read(_e, "y0"), 4, _S.function_value(_e, "_f8")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	_S.define(_e, "fade", (_S.call_value(_S.read(_e, "smooth"), [_S.unary("-", 110), _S.unary("-", 40), _S.read(_e, "y")]) if _S.truth(_S.read(_e, "near")) else 1))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 320)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "g", _S.prop(_S.read(_v3, "GX"), _S.read(_v3, "i")))
		_S.define(_v3, "n", _S.call_value(_S.read(_v3, "sample"), [_S.read(_v3, "F"), _S.binary("-", _S.binary("*", _S.binary("-", _S.read(_v3, "i"), 160), 0.16), _S.read(_v3, "shift")), _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_v3, "y"), _S.prop(_S.read(_v3, "WV"), _S.read(_v3, "i"))), _S.read(_v3, "sy")), 40)]))
		_S.define(_v3, "d", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_v3, "n"), _S.read(_v3, "th")), 2.2), _S.binary("+", 0.35, _S.read(_v3, "g"))), _S.read(_v3, "fade")))
		if _S.truth(_S.read(_v3, "near")):
			var _v4 = _S.scope(_v3)
			if _S.truth(_S.binary("<=", _S.read(_v4, "d"), 0.02)):
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "i", 1, "+=", true)
				continue
			_S.set_prop(_S.prop(_S.read(_v4, "R"), "c"), _S.read(_v4, "i"), _S.read(_v4, "c"), "=", false)
			_S.set_prop(_S.prop(_S.read(_v4, "R"), "a"), _S.read(_v4, "i"), _S.invoke(_S.read(_v4, "Math"), "min", [0.5, _S.read(_v4, "d")]), "=", false)
		else:
			var _v5 = _S.scope(_v3)
			_S.set_prop(_S.prop(_S.read(_v5, "R"), "c"), _S.read(_v5, "i"), (_S.read(_v5, "c") if _S.truth(_S.binary(">", _S.read(_v5, "d"), 0.08)) else _S.read(_v5, "haze")), "=", false)
			_S.set_prop(_S.prop(_S.read(_v5, "R"), "a"), _S.read(_v5, "i"), _S.binary("+", _S.binary("+", 0.3, _S.binary("*", 0.12, _S.read(_v5, "g"))), _S.invoke(_S.read(_v5, "Math"), "min", [0.42, _S.invoke(_S.read(_v5, "Math"), "max", [0, _S.read(_v5, "d")])])), "=", false)
		_S.set_prop(_S.prop(_S.read(_v3, "R"), "b"), _S.read(_v3, "i"), 1, "=", false)
		if _S.truth(_S.binary(">", _S.read(_v3, "d"), 0.05)):
			_S.last([_S.set_prop(_S.prop(_S.read(_v3, "R"), "l"), _S.read(_v3, "i"), _S.prop(_S.read(_v3, "C"), 5), "=", false), _S.set_prop(_S.prop(_S.read(_v3, "R"), "k"), _S.read(_v3, "i"), _S.binary("*", _S.read(_v3, "d"), 0.08), "=", false)])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "S", _S.arg(_args, 3))
	_S.define(_e, "C", _S.arg(_args, 4))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "field"), [_S.binary("+", _S.binary("*", _S.read(_e, "S"), 5), 1), 256, 128]))
	_S.define(_e, "shift", _S.binary("/", _S.binary("*", _S.binary("*", 256, 4), _S.read(_e, "t")), _S.read(_e, "D")))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 320)):
		_S.last([_S.set_prop(_S.read(_v6, "GX"), _S.read(_v6, "i"), _S.call_value(_S.read(_v6, "gustAt"), [_S.binary("+", _S.binary("-", _S.read(_v6, "i"), 160), 0.5), _S.read(_v6, "t")]), "=", false), _S.set_prop(_S.read(_v6, "WV"), _S.read(_v6, "i"), _S.call_value(_S.read(_v6, "bank"), [_S.binary("+", _S.binary("-", _S.read(_v6, "i"), 160), 0.5)]), "=", false)])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "rows"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.unary("-", 16), 9, _S.function_value(_e, "_f10")])
	_S.call_value(_S.read(_e, "trips"), [_S.read(_e, "t"), _S.read(_e, "D"), 40, _S.binary("*", _S.read(_e, "S"), 23), 8, 10, _S.function_value(_e, "_f11")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	var _v7 = _S.scope(_e)
	_S.define(_v7, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "i"), 320)):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "x", _S.binary("+", _S.binary("-", _S.read(_v8, "i"), 160), 0.5))
		_S.define(_v8, "top", _S.prop(_S.read(_v8, "WV"), _S.read(_v8, "i")))
		_S.define(_v8, "d", _S.binary("-", _S.read(_v8, "y"), _S.read(_v8, "top")))
		if _S.truth(_S.binary(">=", _S.read(_v8, "d"), 0)):
			var _v9 = _S.scope(_v8)
			_S.set_prop(_S.prop(_S.read(_v9, "R"), "c"), _S.read(_v9, "i"), (_S.read(_v9, "WHITE") if _S.truth(_S.binary("<", _S.read(_v9, "d"), 1)) else (_S.prop(_S.read(_v9, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v9, "d"), 2)) else (_S.prop(_S.read(_v9, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v9, "d"), 4)) else _S.prop(_S.read(_v9, "C"), 4)))), "=", false)
			if _S.truth(_S.binary("<", _S.read(_v9, "d"), 1)):
				_S.last([_S.set_prop(_S.prop(_S.read(_v9, "R"), "l"), _S.read(_v9, "i"), _S.prop(_S.read(_v9, "C"), 6), "=", false), _S.set_prop(_S.prop(_S.read(_v9, "R"), "k"), _S.read(_v9, "i"), 0.1, "=", false)])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
			continue
		if _S.truth(_S.binary("<", _S.read(_v8, "y"), _S.unary("-", 14))):
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
			continue
		_S.define(_v8, "n", _S.call_value(_S.read(_v8, "sample"), [_S.read(_v8, "F"), _S.binary("-", _S.binary("*", _S.read(_v8, "x"), 0.5), _S.read(_v8, "shift")), _S.binary("+", _S.binary("*", _S.read(_v8, "y"), 3), 9)]))
		_S.define(_v8, "s", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_v8, "n"), 0.5), 3), _S.call_value(_S.read(_v8, "smooth"), [_S.unary("-", 14), _S.unary("-", 1), _S.read(_v8, "y")])), _S.binary("+", 0.4, _S.prop(_S.read(_v8, "GX"), _S.read(_v8, "i")))))
		if _S.truth(_S.binary(">", _S.read(_v8, "s"), 0.02)):
			_S.last([_S.set_prop(_S.prop(_S.read(_v8, "R"), "c"), _S.read(_v8, "i"), _S.prop(_S.read(_v8, "C"), 6), "=", false), _S.set_prop(_S.prop(_S.read(_v8, "R"), "a"), _S.read(_v8, "i"), _S.invoke(_S.read(_v8, "Math"), "min", [0.55, _S.read(_v8, "s")]), "=", false), _S.set_prop(_S.prop(_S.read(_v8, "R"), "b"), _S.read(_v8, "i"), 1, "=", false)])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "i", 1, "+=", true)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "m", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "j", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "k"), _S.read(_e, "m")]))
	_S.define(_e, "x", _S.binary("+", _S.unary("-", 175), _S.binary("*", 350, _S.read(_e, "u"))))
	_S.define(_e, "y", _S.binary("-", _S.binary("-", _S.call_value(_S.read(_e, "bank"), [_S.read(_e, "x")]), 1), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "i"), _S.read(_e, "j"), 1]), 6), _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "u"), 9), _S.read(_e, "i"))])]))))
	_S.invoke(_S.read(_e, "q"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "i"), _S.read(_e, "j"), 2]), 0.5)) else _S.prop(_S.read(_e, "C"), 6))])
	_S.invoke(_S.read(_e, "q"), "px", [_S.binary("-", _S.read(_e, "x"), 1), _S.read(_e, "y"), _S.prop(_S.read(_e, "C"), 5)])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	return _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "TAU"), _S.binary("-", _S.binary("/", _S.binary("+", _S.read(_e, "x"), 160), 400), _S.binary("/", _S.binary("*", 2, _S.read(_e, "t")), _S.read(_e, "D")))), 0.8)])))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.unary("-", 2), _S.binary("*", 1.2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "x"), 0.05), 2)]))), _S.binary("*", 0.8, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "x"), 0.15), 1)])))
