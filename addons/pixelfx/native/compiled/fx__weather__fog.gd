@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/fog.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "field", _S.import_value("fx/weather/_lib.js", "field"))
	_S.define(_e, "sample", _S.import_value("fx/weather/_lib.js", "sample"))
	_S.define(_e, "bayer", _S.import_value("fx/weather/_lib.js", "bayer"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "bank", _S.function_value(_e, "_f2"))
	_S.define(_e, "streaks", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Fog"}, {"desc": "Slow banks of moonlit fog at three depths drift past each other, crests catching the light, while thin streaks of mist slide by in front."}, {"tags": ["weather", "fog", "mist", "haze", "night", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 12}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#14121e", "#24213a", "#363250", "#4f4a6c", "#6d688b", "#918cab", "#bdb8d4", "#ece8f6"]}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 12)
	_S.define(_e, "W", 320)
	_S.define(_e, "T", [0.3, 0.5, 0.7])
	_S.define(_e, "BW", 0.06)
	_S.define(_e, "BANKS", [_S.merge([{"top": _S.unary("-", 84)}, {"base": _S.unary("-", 40)}, {"bot": _S.unary("-", 20)}, {"sx": 1.6}, {"sy": 2.2}, {"lap": 1}, {"alpha": 0.24}, {"tone": [2, 3, 4]}, {"crest": 5}, {"warp": 16}, {"crestFrom": 3}]), _S.merge([{"top": _S.unary("-", 62)}, {"base": _S.unary("-", 24)}, {"bot": _S.unary("-", 2)}, {"sx": 1.0667}, {"sy": 2.5}, {"lap": 1}, {"alpha": 0.3}, {"tone": [2, 3, 4]}, {"crest": 5}, {"warp": 22}, {"crestFrom": 2}]), _S.merge([{"top": _S.unary("-", 42)}, {"base": _S.unary("-", 8)}, {"bot": 10}, {"sx": 0.8}, {"sy": 2.8}, {"lap": 1}, {"alpha": 0.36}, {"tone": [2, 3, 5]}, {"crest": 6}, {"warp": 28}, {"crestFrom": 1}])])
	_S.define(_e, "BR", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "W")]))
	_S.define(_e, "P1", _S.invoke(_S.read(_e, "BANKS"), "map", [_S.function_value(_e, "_f7")]))
	_S.define(_e, "P2", _S.invoke(_S.read(_e, "BANKS"), "map", [_S.function_value(_e, "_f8")]))
	_S.define(_e, "WARP", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "W")]))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.call_value(_S.read(_e, "bank"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), 0])
	_S.call_value(_S.read(_e, "bank"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), 1])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.call_value(_S.read(_e, "bank"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), 2])
	_S.call_value(_S.read(_e, "streaks"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), 1])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "n", _S.arg(_args, 4))
	_S.define(_e, "B", _S.prop(_S.read(_e, "BANKS"), _S.read(_e, "n")))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "field"), [_S.binary("+", _S.binary("*", _S.read(_e, "S"), 7), _S.read(_e, "n")), 256, 128]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "field"), [_S.binary("+", _S.binary("*", _S.read(_e, "S"), 7), 11), 256, 128, [4, 8, 16]]))
	_S.define(_e, "drift", _S.binary("/", _S.binary("*", _S.binary("*", 256, _S.prop(_S.read(_e, "B"), "lap")), _S.read(_e, "t")), _S.read(_e, "D")))
	_S.define(_e, "boil", _S.binary("/", _S.binary("*", 128, _S.read(_e, "t")), _S.read(_e, "D")))
	_S.define(_e, "prev1", _S.prop(_S.read(_e, "P1"), _S.read(_e, "n")))
	_S.define(_e, "prev2", _S.prop(_S.read(_e, "P2"), _S.read(_e, "n")))
	_S.define(_e, "tones", _S.invoke(_S.prop(_S.read(_e, "B"), "tone"), "map", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "crest", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), _S.prop(_S.read(_e, "B"), "crest")), _S.read(_e, "WHITE"), _S.binary("+", 0.12, _S.binary("*", 0.08, _S.read(_e, "n")))]))
	_S.invoke(_S.read(_e, "prev1"), "fill", [0])
	_S.invoke(_S.read(_e, "prev2"), "fill", [0])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.read(_v0, "W"))):
		_S.set_prop(_S.read(_v0, "BR"), _S.read(_v0, "i"), _S.binary("*", 2, _S.invoke(_S.read(_v0, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("/", _S.binary("*", _S.read(_v0, "TAU"), _S.read(_v0, "t")), _S.read(_v0, "D")), _S.binary("*", _S.binary("-", _S.read(_v0, "i"), 160), 0.006)), _S.binary("*", _S.read(_v0, "n"), 1.7))])), "=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "rows"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.binary("-", _S.prop(_S.read(_e, "B"), "top"), 2), _S.prop(_S.read(_e, "B"), "bot"), _S.function_value(_e, "_f4")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "C"), _S.read(_e, "i"))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	_S.define(_e, "prof", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.prop(_S.read(_e, "B"), "top"), _S.prop(_S.read(_e, "B"), "base"), _S.read(_e, "y")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.prop(_S.read(_e, "B"), "bot"), (14 if _S.truth(_S.binary("<", _S.prop(_S.read(_e, "B"), "bot"), 10)) else 4)), _S.binary("+", _S.prop(_S.read(_e, "B"), "bot"), 1), _S.read(_e, "y")]))))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "i"), _S.read(_v1, "W"))):
		_S.set_prop(_S.read(_v1, "WARP"), _S.read(_v1, "i"), _S.set_prop(_S.read(_v1, "WARP"), _S.binary("+", _S.read(_v1, "i"), 1), _S.binary("-", _S.call_value(_S.read(_v1, "sample"), [_S.read(_v1, "G"), _S.binary("+", _S.binary("*", _S.read(_v1, "i"), 0.35), _S.binary("*", _S.read(_v1, "n"), 70)), _S.binary("+", _S.binary("*", _S.read(_v1, "y"), 0.5), _S.read(_v1, "boil"))]), 0.5), "=", false), "=", false)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "i", 2, "+=", false)
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), _S.read(_v2, "W"))):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "x", _S.binary("+", _S.binary("-", _S.read(_v3, "i"), 160), 0.5))
		_S.define(_v3, "w", _S.prop(_S.read(_v3, "WARP"), _S.read(_v3, "i")))
		_S.define(_v3, "nn", _S.binary("-", _S.call_value(_S.read(_v3, "clamp"), [_S.binary("+", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v3, "sample"), [_S.read(_v3, "F"), _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v3, "x"), _S.prop(_S.read(_v3, "B"), "sx")), _S.read(_v3, "drift")), _S.binary("*", _S.read(_v3, "w"), _S.prop(_S.read(_v3, "B"), "warp"))), _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_v3, "y"), _S.prop(_S.read(_v3, "BR"), _S.read(_v3, "i"))), _S.prop(_S.read(_v3, "B"), "sy")), _S.binary("*", _S.read(_v3, "w"), 8))]), 0.5), 2.6), 0.5)]), 0.5))
		_S.define(_v3, "f", (0 if _S.truth(_S.binary("<=", _S.read(_v3, "prof"), 0.01)) else _S.binary("*", _S.binary("+", _S.binary("*", _S.read(_v3, "prof"), 0.72), _S.binary("*", _S.read(_v3, "nn"), 0.95)), _S.binary("+", 0.6, _S.binary("*", 0.5, _S.read(_v3, "prof"))))))
		_S.define(_v3, "above", _S.prop(_S.read(_v3, "prev2"), _S.read(_v3, "i")))
		_S.set_prop(_S.read(_v3, "prev2"), _S.read(_v3, "i"), _S.prop(_S.read(_v3, "prev1"), _S.read(_v3, "i")), "=", false)
		_S.set_prop(_S.read(_v3, "prev1"), _S.read(_v3, "i"), _S.read(_v3, "f"), "=", false)
		if _S.truth(_S.binary("<=", _S.read(_v3, "f"), _S.prop(_S.read(_v3, "T"), 0))):
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "+=", true)
			continue
		_S.define(_v3, "th", _S.binary("*", _S.call_value(_S.read(_v3, "bayer"), [_S.read(_v3, "i"), _S.read(_v3, "y")]), _S.read(_v3, "BW")))
		_S.define(_v3, "band", (2 if _S.truth(_S.binary(">", _S.read(_v3, "f"), _S.binary("+", _S.prop(_S.read(_v3, "T"), 2), _S.read(_v3, "th")))) else (1 if _S.truth(_S.binary(">", _S.read(_v3, "f"), _S.binary("+", _S.prop(_S.read(_v3, "T"), 1), _S.read(_v3, "th")))) else 0)))
		_S.define(_v3, "solid", (2 if _S.truth(_S.binary(">", _S.read(_v3, "f"), _S.prop(_S.read(_v3, "T"), 2))) else (1 if _S.truth(_S.binary(">", _S.read(_v3, "f"), _S.prop(_S.read(_v3, "T"), 1))) else 0)))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v3, "solid"), _S.prop(_S.read(_v3, "B"), "crestFrom")), func(): return _S.binary("<", _S.read(_v3, "above"), _S.prop(_S.read(_v3, "T"), _S.read(_v3, "solid"))))):
			var _v4 = _S.scope(_v3)
			_S.set_prop(_S.prop(_S.read(_v4, "R"), "c"), _S.read(_v4, "i"), _S.read(_v4, "crest"), "=", false)
			_S.set_prop(_S.prop(_S.read(_v4, "R"), "a"), _S.read(_v4, "i"), _S.binary("*", _S.prop(_S.read(_v4, "B"), "alpha"), 0.95), "=", false)
			_S.set_prop(_S.prop(_S.read(_v4, "R"), "l"), _S.read(_v4, "i"), _S.prop(_S.read(_v4, "C"), 6), "=", false)
			_S.set_prop(_S.prop(_S.read(_v4, "R"), "k"), _S.read(_v4, "i"), 0.07, "=", false)
		else:
			var _v5 = _S.scope(_v3)
			_S.set_prop(_S.prop(_S.read(_v5, "R"), "c"), _S.read(_v5, "i"), _S.prop(_S.read(_v5, "tones"), _S.read(_v5, "band")), "=", false)
			_S.set_prop(_S.prop(_S.read(_v5, "R"), "a"), _S.read(_v5, "i"), _S.binary("*", _S.prop(_S.read(_v5, "B"), "alpha"), _S.binary("+", 0.55, _S.binary("*", 0.25, _S.read(_v5, "band")))), "=", false)
			if _S.truth(_S.binary("===", _S.read(_v5, "band"), 2)):
				_S.last([_S.set_prop(_S.prop(_S.read(_v5, "R"), "l"), _S.read(_v5, "i"), _S.prop(_S.read(_v5, "C"), 5), "=", false), _S.set_prop(_S.prop(_S.read(_v5, "R"), "k"), _S.read(_v5, "i"), _S.binary("+", 0.03, _S.binary("*", 0.02, _S.read(_v5, "n"))), "=", false)])
		_S.set_prop(_S.prop(_S.read(_v3, "R"), "b"), _S.read(_v3, "i"), 1, "=", false)
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "front", _S.arg(_args, 4))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "field"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "S"), 7), 20), _S.read(_e, "front")), 256, 128]))
	_S.define(_e, "drift", _S.binary("/", _S.binary("*", 256, _S.read(_e, "t")), _S.read(_e, "D")))
	_S.define(_e, "sx", (0.4 if _S.truth(_S.read(_e, "front")) else 0.5))
	_S.define(_e, "y0", (_S.unary("-", 40) if _S.truth(_S.read(_e, "front")) else _S.unary("-", 96)))
	_S.define(_e, "y1", (6 if _S.truth(_S.read(_e, "front")) else _S.unary("-", 30)))
	_S.call_value(_S.read(_e, "rows"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.read(_e, "y0"), _S.read(_e, "y1"), _S.function_value(_e, "_f6")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	_S.define(_e, "env", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "y0"), _S.binary("+", _S.read(_e, "y0"), 10), _S.read(_e, "y")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "y1"), 10), _S.read(_e, "y1"), _S.read(_e, "y")]))))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), _S.read(_v6, "W"))):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "x", _S.binary("+", _S.binary("-", _S.read(_v7, "i"), 160), 0.5))
		_S.define(_v7, "s", _S.binary("*", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v7, "sample"), [_S.read(_v7, "F"), _S.binary("+", _S.binary("*", _S.read(_v7, "x"), _S.read(_v7, "sx")), _S.read(_v7, "drift")), _S.binary("+", _S.binary("*", _S.read(_v7, "y"), 6.5), 30)]), 0.64), 3), _S.read(_v7, "env")))
		if _S.truth(_S.binary("<=", _S.read(_v7, "s"), 0.05)):
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
			continue
		_S.set_prop(_S.prop(_S.read(_v7, "R"), "c"), _S.read(_v7, "i"), (_S.prop(_S.read(_v7, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v7, "s"), 0.35)) else _S.prop(_S.read(_v7, "C"), 4)), "=", false)
		_S.set_prop(_S.prop(_S.read(_v7, "R"), "a"), _S.read(_v7, "i"), _S.invoke(_S.read(_v7, "Math"), "min", [0.4, _S.read(_v7, "s")]), "=", false)
		_S.set_prop(_S.prop(_S.read(_v7, "R"), "b"), _S.read(_v7, "i"), 1, "=", false)
		_S.set_prop(_S.prop(_S.read(_v7, "R"), "l"), _S.read(_v7, "i"), _S.prop(_S.read(_v7, "C"), 5), "=", false)
		_S.set_prop(_S.prop(_S.read(_v7, "R"), "k"), _S.read(_v7, "i"), _S.binary("*", _S.read(_v7, "s"), 0.05), "=", false)
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "W")])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "W")])
