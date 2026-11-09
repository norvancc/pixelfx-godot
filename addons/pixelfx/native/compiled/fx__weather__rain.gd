@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/rain.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "pass", _S.import_value("fx/weather/_lib.js", "pass"))
	_S.define(_e, "field", _S.import_value("fx/weather/_lib.js", "field"))
	_S.define(_e, "sample", _S.import_value("fx/weather/_lib.js", "sample"))
	_S.define(_e, "trips", _S.import_value("fx/weather/_lib.js", "trips"))
	_S.define(_e, "crown", _S.import_value("fx/weather/_lib.js", "crown"))
	_S.define(_e, "bayer", _S.import_value("fx/weather/_lib.js", "bayer"))
	_S.define(_e, "pools", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "layer", _S.function_value(_e, "_f5"))
	_S.define(_e, "rings", _S.function_value(_e, "_f9"))
	_S.define(_e, "floor", _S.function_value(_e, "_f10"))
	_S.define(_e, "mist", _S.function_value(_e, "_f13"))
	_S.define(_e, "meta", _S.merge([{"name": "Rain"}, {"desc": "Slanted rain at four depths: far drops fade into the dark, near ones glint and splash, drops ring the puddles and a low mist drifts over the wet floor."}, {"tags": ["weather", "rain", "storm", "water", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 8}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0e1322", "#1a2440", "#283a5e", "#3a5482", "#5674a8", "#84a6d6", "#c0dcf8", "#f2f8ff"]}, {"density": 1}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 8)
	_S.define(_e, "SLANT", _S.unary("-", 0.2))
	_S.define(_e, "UX", _S.binary("/", _S.read(_e, "SLANT"), _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "SLANT"), 1])))
	_S.define(_e, "UY", _S.binary("/", 1, _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "SLANT"), 1])))
	_S.define(_e, "LAYERS", [_S.merge([{"n": 200}, {"m": [10, 13]}, {"len": 2}, {"col": [2, 2, 3]}, {"stop": [_S.unary("-", 80), _S.unary("-", 6)]}]), _S.merge([{"n": 150}, {"m": [14, 17]}, {"len": 4}, {"col": [2, 3, 4]}, {"stop": [_S.unary("-", 45), _S.unary("-", 2)]}]), _S.merge([{"n": 96}, {"m": [19, 23]}, {"len": 7}, {"col": [3, 4, 5]}, {"z": [0, 1.4]}, {"size": [0.15, 0.4]}]), _S.merge([{"n": 42}, {"m": [25, 29]}, {"len": 13}, {"col": [3, 5, 7]}, {"z": [2, 6.5]}, {"size": [0.6, 1]}, {"near": true}])])
	_S.define(_e, "poolAt", _S.function_value(_e, "_f16"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "S", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 5}]), _S.function_value(_e, "_f1")])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.unary("-", 150), _S.binary("*", _S.read(_e, "i"), 66)), _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "i"), 61]), 30)))
	_S.define(_e, "w", _S.binary("+", 16, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "i"), 63]), 26)))
	return _S.merge([{"x0": _S.read(_e, "x")}, {"x1": _S.binary("+", _S.read(_e, "x"), _S.read(_e, "w"))}, {"y": _S.binary("+", 3, _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "i"), 62]), 3)]))}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.write(_e, "t", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "t"), 30000)]), 30000), "=", false)
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "P", _S.call_value(_S.read(_e, "pools"), [_S.read(_e, "S")]))
	_S.define(_e, "haze", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 1), 0.6]))
	_S.call_value(_S.read(_e, "pass"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.unary("-", 170), _S.unary("-", 0.5), _S.function_value(_e, "_f3")])
	_S.call_value(_S.read(_e, "floor"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), _S.read(_e, "P")])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "L", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "L"), 3)):
		_S.call_value(_S.read(_v0, "layer"), [_S.read(_v0, "q"), _S.read(_v0, "t"), _S.read(_v0, "S"), _S.read(_v0, "C"), _S.read(_v0, "P"), _S.read(_v0, "L"), _S.prop(_S.read(_v0, "o"), "density")])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "L", 1, "+=", true)
	_S.call_value(_S.read(_e, "mist"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.set_prop(_S.read(_e, "out"), "c", _S.read(_e, "haze"), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.binary("+", 0.3, _S.binary("*", 0.26, _S.call_value(_S.read(_e, "smooth"), [_S.unary("-", 170), 0, _S.read(_e, "y")]))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "b", 1, "=", false)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.write(_e, "t", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "t"), 30000)]), 30000), "=", false)
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "P", _S.call_value(_S.read(_e, "pools"), [_S.read(_e, "S")]))
	_S.call_value(_S.read(_e, "layer"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), _S.read(_e, "P"), 3, _S.prop(_S.read(_e, "o"), "density")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "P", _S.arg(_args, 4))
	_S.define(_e, "L", _S.arg(_args, 5))
	_S.define(_e, "density", _S.arg(_args, 6))
	_S.define(_e, "Ly", _S.prop(_S.read(_e, "LAYERS"), _S.read(_e, "L")))
	_S.define(_e, "sd", _S.binary("+", _S.binary("*", _S.read(_e, "S"), 11), _S.read(_e, "L")))
	var _v1 = _S.invoke(_S.prop(_S.read(_e, "Ly"), "col"), "map", [_S.function_value(_e, "_f6")])
	_S.define(_e, "c0", _S.prop(_v1, 0))
	_S.define(_e, "c1", _S.prop(_v1, 1))
	_S.define(_e, "c2", _S.prop(_v1, 2))
	_S.define(_e, "len", _S.prop(_S.read(_e, "Ly"), "len"))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.prop(_S.read(_e, "Ly"), "n"), _S.read(_e, "density"))]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "field"), [_S.binary("+", _S.read(_e, "S"), 21), 256, 128, [4, 8, 16]]))
	_S.define(_e, "sweep", _S.binary("/", _S.binary("*", 256, _S.read(_e, "t")), _S.read(_e, "D")))
	_S.call_value(_S.read(_e, "trips"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.read(_e, "n"), _S.read(_e, "sd"), _S.prop(_S.prop(_S.read(_e, "Ly"), "m"), 0), _S.prop(_S.prop(_S.read(_e, "Ly"), "m"), 1), _S.function_value(_e, "_f7")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "C"), _S.read(_e, "i"))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "m", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "j", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "k"), _S.read(_e, "m")]))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "L"), 2), func(): return _S.binary(">", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "sd"), _S.read(_e, "i"), _S.read(_e, "j"), 7]), _S.binary("+", 0.35, _S.binary("*", 1.3, _S.binary("-", _S.call_value(_S.read(_e, "sample"), [_S.read(_e, "G"), _S.binary("+", _S.binary("*", _S.binary("+", _S.unary("-", 166), _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "sd"), _S.read(_e, "i"), _S.read(_e, "j"), 2]), 332)), 0.8), _S.read(_e, "sweep")), _S.binary("+", 9, _S.binary("*", _S.read(_e, "L"), 40))]), 0.32)))))):
		return null
	_S.define(_e, "end", (_S.binary("+", _S.prop(_S.prop(_S.read(_e, "Ly"), "z"), 0), _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "sd"), _S.read(_e, "i"), _S.read(_e, "j"), 1]), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "Ly"), "z"), 1), _S.prop(_S.prop(_S.read(_e, "Ly"), "z"), 0)))) if _S.truth(_S.prop(_S.read(_e, "Ly"), "z")) else _S.binary("+", _S.prop(_S.prop(_S.read(_e, "Ly"), "stop"), 0), _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "sd"), _S.read(_e, "i"), _S.read(_e, "j"), 1]), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "Ly"), "stop"), 1), _S.prop(_S.prop(_S.read(_e, "Ly"), "stop"), 0))))))
	_S.define(_e, "y0", _S.binary("-", _S.unary("-", 172), _S.read(_e, "len")))
	_S.define(_e, "y", _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.binary("-", _S.read(_e, "end"), _S.read(_e, "y0")), _S.read(_e, "u"))))
	_S.define(_e, "x", _S.binary("-", _S.binary("+", _S.unary("-", 166), _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "sd"), _S.read(_e, "i"), _S.read(_e, "j"), 2]), 332)), _S.binary("*", _S.binary("-", _S.read(_e, "end"), _S.read(_e, "y")), _S.read(_e, "SLANT"))))
	_S.define(_e, "a", (1 if _S.truth(_S.prop(_S.read(_e, "Ly"), "z")) else _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_e, "u")), 5)])))
	if _S.truth(_S.binary("<=", _S.read(_e, "len"), 2)):
		_S.last([_S.invoke(_S.read(_e, "q"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "c2"), _S.read(_e, "a")]), _S.invoke(_S.read(_e, "q"), "dot", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "UX")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "UY")), _S.read(_e, "c1"), _S.binary("*", _S.read(_e, "a"), 0.8)])])
	else:
		var _v2 = _S.scope(_e)
		_S.invoke(_S.read(_v2, "q"), "line", [_S.binary("-", _S.read(_v2, "x"), _S.binary("*", _S.read(_v2, "UX"), _S.read(_v2, "len"))), _S.binary("-", _S.read(_v2, "y"), _S.binary("*", _S.read(_v2, "UY"), _S.read(_v2, "len"))), _S.binary("-", _S.read(_v2, "x"), _S.binary("*", _S.binary("*", _S.read(_v2, "UX"), _S.read(_v2, "len")), 0.45)), _S.binary("-", _S.read(_v2, "y"), _S.binary("*", _S.binary("*", _S.read(_v2, "UY"), _S.read(_v2, "len")), 0.45)), _S.read(_v2, "c0"), _S.function_value(_v2, "_f8")])
		_S.invoke(_S.read(_v2, "q"), "line", [_S.binary("-", _S.read(_v2, "x"), _S.binary("*", _S.binary("*", _S.read(_v2, "UX"), _S.read(_v2, "len")), 0.45)), _S.binary("-", _S.read(_v2, "y"), _S.binary("*", _S.binary("*", _S.read(_v2, "UY"), _S.read(_v2, "len")), 0.45)), _S.binary("-", _S.read(_v2, "x"), _S.read(_v2, "UX")), _S.binary("-", _S.read(_v2, "y"), _S.read(_v2, "UY")), _S.read(_v2, "c1"), _S.read(_v2, "a")])
		_S.invoke(_S.read(_v2, "q"), "dot", [_S.read(_v2, "x"), _S.read(_v2, "y"), _S.read(_v2, "c2"), _S.read(_v2, "a")])
	if _S.truth(_S.prop(_S.read(_e, "Ly"), "near")):
		_S.invoke(_S.read(_e, "q"), "glow", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 2), 4, _S.prop(_S.read(_e, "C"), 5), 0.12])
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "Ly"), "z"))):
		return null
	_S.define(_e, "dur", _S.binary("/", _S.read(_e, "D"), _S.read(_e, "m")))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "back", 1)
	while _S.truth(_S.binary("<", _S.read(_v3, "back"), 4)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "age", _S.binary("+", _S.binary("*", _S.read(_v4, "u"), _S.read(_v4, "dur")), _S.binary("*", _S.binary("-", _S.read(_v4, "back"), 1), _S.read(_v4, "dur"))))
		if _S.truth(_S.binary(">", _S.read(_v4, "age"), 0.7)):
			break
		_S.define(_v4, "jp", _S.call_value(_S.read(_v4, "wrap"), [_S.binary("-", _S.read(_v4, "k"), _S.read(_v4, "back")), _S.read(_v4, "m")]))
		_S.define(_v4, "z", _S.binary("+", _S.prop(_S.prop(_S.read(_v4, "Ly"), "z"), 0), _S.binary("*", _S.call_value(_S.read(_v4, "rand"), [_S.read(_v4, "sd"), _S.read(_v4, "i"), _S.read(_v4, "jp"), 1]), _S.binary("-", _S.prop(_S.prop(_S.read(_v4, "Ly"), "z"), 1), _S.prop(_S.prop(_S.read(_v4, "Ly"), "z"), 0)))))
		_S.define(_v4, "xp", _S.binary("+", _S.unary("-", 166), _S.binary("*", _S.call_value(_S.read(_v4, "rand"), [_S.read(_v4, "sd"), _S.read(_v4, "i"), _S.read(_v4, "jp"), 2]), 332)))
		if _S.truth(_S.binary(">", _S.call_value(_S.read(_v4, "rand"), [_S.read(_v4, "sd"), _S.read(_v4, "i"), _S.read(_v4, "jp"), 5]), (1 if _S.truth(_S.prop(_S.read(_v4, "Ly"), "near")) else 0.7))):
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "back", 1, "+=", true)
			continue
		_S.define(_v4, "size", _S.binary("+", _S.prop(_S.prop(_S.read(_v4, "Ly"), "size"), 0), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v4, "z"), _S.prop(_S.prop(_S.read(_v4, "Ly"), "z"), 0)), _S.binary("-", _S.prop(_S.prop(_S.read(_v4, "Ly"), "z"), 1), _S.prop(_S.prop(_S.read(_v4, "Ly"), "z"), 0))), _S.binary("-", _S.prop(_S.prop(_S.read(_v4, "Ly"), "size"), 1), _S.prop(_S.prop(_S.read(_v4, "Ly"), "size"), 0)))))
		_S.define(_v4, "pool", _S.logical("&&", _S.prop(_S.read(_v4, "Ly"), "near"), func(): return _S.call_value(_S.read(_v4, "poolAt"), [_S.read(_v4, "P"), _S.read(_v4, "xp"), _S.read(_v4, "z")])))
		if _S.truth(_S.read(_v4, "pool")):
			_S.call_value(_S.read(_v4, "rings"), [_S.read(_v4, "q"), _S.read(_v4, "xp"), _S.read(_v4, "pool"), _S.read(_v4, "age"), _S.read(_v4, "C")])
		else:
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.call_value(_S.read(_v4, "crown"), [_S.read(_v4, "q"), _S.read(_v4, "xp"), _S.read(_v4, "z"), _S.read(_v4, "age"), _S.read(_v4, "size"), _S.merge([{"hot": _S.prop(_S.read(_v4, "C"), 6)}, {"cool": _S.prop(_S.read(_v4, "C"), 4)}, {"white": _S.read(_v4, "WHITE")}]), _S.call_value(_S.read(_v4, "rand"), [_S.read(_v4, "sd"), _S.read(_v4, "i"), _S.read(_v4, "jp"), 4])]), func(): return _S.prop(_S.read(_v4, "Ly"), "near")), func(): return _S.binary("<", _S.read(_v4, "age"), 0.1))):
				_S.invoke(_S.read(_v4, "q"), "glow", [_S.read(_v4, "xp"), _S.binary("-", _S.read(_v4, "z"), 1), 5, _S.prop(_S.read(_v4, "C"), 5), _S.binary("*", 0.3, _S.binary("-", 1, _S.binary("/", _S.read(_v4, "age"), 0.1)))])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "back", 1, "+=", true)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "a"), _S.binary("+", 0.35, _S.binary("*", 0.65, _S.read(_e, "v"))))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "pool", _S.arg(_args, 2))
	_S.define(_e, "age", _S.arg(_args, 3))
	_S.define(_e, "C", _S.arg(_args, 4))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "y", _S.prop(_S.read(_e, "pool"), "y"))
	if _S.truth(_S.binary("<", _S.read(_e, "age"), 0.05)):
		_S.invoke(_S.read(_e, "q"), "px", [_S.read(_e, "X"), _S.read(_e, "y"), _S.prop(_S.read(_e, "C"), 7)])
	var _v5 = _S.scope(_e)
	_S.define(_v5, "r", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "r"), 2)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "a", _S.binary("-", _S.read(_v6, "age"), _S.binary("*", _S.read(_v6, "r"), 0.16)))
		_S.define(_v6, "u", _S.binary("/", _S.read(_v6, "a"), 0.5))
		if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v6, "u"), 0), func(): return _S.binary(">=", _S.read(_v6, "u"), 1))):
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "r", 1, "+=", true)
			continue
		_S.define(_v6, "w", _S.invoke(_S.read(_v6, "Math"), "round", [_S.binary("+", 1, _S.binary("*", 7, _S.invoke(_S.read(_v6, "Math"), "sqrt", [_S.read(_v6, "u")])))]))
		_S.define(_v6, "c", (_S.prop(_S.read(_v6, "C"), 6) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v6, "u"), 0.4), func(): return _S.unary("!", _S.read(_v6, "r")))) else _S.prop(_S.read(_v6, "C"), 5)))
		for _v7 in _S.array([_S.unary("-", 1), 1]):
			var _v8 = _S.scope(_v6)
			_S.define(_v8, "s", _v7)
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "d", 0)
			while _S.truth(_S.binary("<", _S.read(_v9, "d"), (2 if _S.truth(_S.binary("<", _S.read(_v9, "u"), 0.6)) else 1))):
				var _v10 = _S.scope(_v9)
				_S.define(_v10, "px", _S.binary("+", _S.read(_v10, "X"), _S.binary("*", _S.read(_v10, "s"), _S.binary("-", _S.read(_v10, "w"), _S.read(_v10, "d")))))
				if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v10, "px"), _S.prop(_S.read(_v10, "pool"), "x0")), func(): return _S.binary("<", _S.read(_v10, "px"), _S.prop(_S.read(_v10, "pool"), "x1")))):
					_S.invoke(_S.read(_v10, "q"), "px", [_S.read(_v10, "px"), _S.read(_v10, "y"), _S.read(_v10, "c")])
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "d", 1, "+=", true)
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "r", 1, "+=", true)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "P", _S.arg(_args, 4))
	_S.call_value(_S.read(_e, "pass"), [_S.read(_e, "q"), _S.read(_e, "meta"), 0, 9.5, _S.function_value(_e, "_f11")])
	_S.invoke(_S.read(_e, "P"), "forEach", [_S.function_value(_e, "_f12")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	if _S.truth(_S.binary("<", _S.read(_e, "y"), 1)):
		return _S.unary("void", _S.last([_S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "C"), 4), "=", false), _S.set_prop(_S.read(_e, "out"), "l", _S.prop(_S.read(_e, "C"), 5), "=", false), _S.set_prop(_S.read(_e, "out"), "k", 0.08, "=", false)]))
	if _S.truth(_S.binary("<", _S.read(_e, "y"), 2)):
		return _S.unary("void", _S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "C"), 1), "=", false))
	_S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "C"), 0), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", 0.55, "=", false)
	_S.set_prop(_S.read(_e, "out"), "b", 1, "=", false)
	for _v11 in _S.array(_S.read(_e, "P")):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "p", _v11)
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_v12, "x"), _S.prop(_S.read(_v12, "p"), "x0")), func(): return _S.binary("<", _S.read(_v12, "x"), _S.prop(_S.read(_v12, "p"), "x1"))), func(): return _S.binary("===", _S.invoke(_S.read(_v12, "Math"), "floor", [_S.read(_v12, "y")]), _S.prop(_S.read(_v12, "p"), "y")))):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "edge", _S.logical("||", _S.binary("<", _S.read(_v13, "x"), _S.binary("+", _S.prop(_S.read(_v13, "p"), "x0"), 2)), func(): return _S.binary(">=", _S.read(_v13, "x"), _S.binary("-", _S.prop(_S.read(_v13, "p"), "x1"), 2))))
			_S.set_prop(_S.read(_v13, "out"), "c", (_S.prop(_S.read(_v13, "C"), 3) if _S.truth(_S.read(_v13, "edge")) else _S.prop(_S.read(_v13, "C"), 4)), "=", false)
			_S.set_prop(_S.read(_v13, "out"), "a", 1, "=", false)
			_S.set_prop(_S.read(_v13, "out"), "b", 0, "=", false)
			_S.set_prop(_S.read(_v13, "out"), "l", _S.prop(_S.read(_v13, "C"), 5), "=", false)
			_S.set_prop(_S.read(_v13, "out"), "k", 0.06, "=", false)
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "gx", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "p"), "x0"), 3), _S.binary("*", _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "p"), "x1"), _S.prop(_S.read(_e, "p"), "x0")), 6), _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), 2), _S.read(_e, "t")), _S.read(_e, "D")), _S.binary("*", _S.read(_e, "i"), 1.9))])))))]))
	_S.invoke(_S.read(_e, "q"), "px", [_S.read(_e, "gx"), _S.prop(_S.read(_e, "p"), "y"), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "q"), "glow", [_S.read(_e, "gx"), _S.prop(_S.read(_e, "p"), "y"), 4, _S.prop(_S.read(_e, "C"), 5), 0.2])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "M", _S.call_value(_S.read(_e, "field"), [_S.binary("+", _S.read(_e, "S"), 9), 256, 128, [4, 8, 16, 32]]))
	_S.define(_e, "drift", _S.binary("/", _S.binary("*", 256, _S.read(_e, "t")), _S.read(_e, "D")))
	_S.define(_e, "crest", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), 0.5]))
	_S.define(_e, "dens", _S.function_value(_e, "_f14"))
	_S.call_value(_S.read(_e, "pass"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.unary("-", 20), 9, _S.function_value(_e, "_f15")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "prof", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.unary("-", 22), _S.unary("-", 4), _S.read(_e, "y")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [7, 10, _S.read(_e, "y")]))))
	return _S.binary("*", _S.read(_e, "prof"), _S.binary("+", 0.62, _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "sample"), [_S.read(_e, "M"), _S.binary("+", _S.binary("*", _S.read(_e, "x"), 0.45), _S.read(_e, "drift")), _S.binary("+", _S.binary("*", _S.read(_e, "y"), 4), 30)]), 0.5), 2)))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.call_value(_S.read(_e, "dens"), [_S.read(_e, "x"), _S.read(_e, "y")]))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.28)):
		return null
	_S.define(_e, "th", _S.binary("*", _S.call_value(_S.read(_e, "bayer"), [_S.read(_e, "x"), _S.read(_e, "y")]), 0.06))
	_S.set_prop(_S.read(_e, "out"), "b", 1, "=", false)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "d"), _S.binary("+", 0.46, _S.read(_e, "th"))), func(): return _S.binary("<", _S.call_value(_S.read(_e, "dens"), [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 1)]), 0.43))):
		_S.last([_S.set_prop(_S.read(_e, "out"), "c", _S.read(_e, "crest"), "=", false), _S.set_prop(_S.read(_e, "out"), "a", 0.5, "=", false)])
	else:
		_S.last([_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("+", 0.58, _S.read(_e, "th")))) else _S.prop(_S.read(_e, "C"), 3)), "=", false), _S.set_prop(_S.read(_e, "out"), "a", _S.binary("*", _S.call_value(_S.read(_e, "clamp"), [_S.binary("*", _S.binary("-", _S.read(_e, "d"), 0.28), 1.6)]), 0.5), "=", false)])
	_S.set_prop(_S.read(_e, "out"), "l", _S.prop(_S.read(_e, "C"), 4), "=", false)
	_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.binary("-", _S.read(_e, "d"), 0.3), 0.1), "=", false)
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "P", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	return _S.invoke(_S.read(_e, "P"), "find", [_S.function_value(_e, "_f17")])

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	return _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "x"), _S.binary("+", _S.prop(_S.read(_e, "p"), "x0"), 2)), func(): return _S.binary("<=", _S.read(_e, "x"), _S.binary("-", _S.prop(_S.read(_e, "p"), "x1"), 2))), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "p"), "y"))]), 1.5))
