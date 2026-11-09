@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/god-rays.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "lightAt", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "shafts", _S.function_value(_e, "_f6"))
	_S.define(_e, "motes", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "God rays"}, {"desc": "Shafts of light slant down from high on the left, breathing and swaying, pooling on the floor, as drifting dust motes light up whenever they cross a beam."}, {"tags": ["weather", "god rays", "light", "sunbeam", "dust", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 10}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#1a1208", "#3a2810", "#7a5a24", "#c89a44", "#f2d27a", "#fff2c4", "#ffffff"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 10)
	_S.define(_e, "W", 320)
	_S.define(_e, "SX", _S.unary("-", 230))
	_S.define(_e, "SY", _S.unary("-", 300))
	_S.define(_e, "AX", _S.invoke(_S.read(_e, "Math"), "cos", [0.94]))
	_S.define(_e, "AY", _S.invoke(_S.read(_e, "Math"), "sin", [0.94]))
	_S.define(_e, "NX", _S.unary("-", _S.read(_e, "AY")))
	_S.define(_e, "NY", _S.read(_e, "AX"))
	_S.define(_e, "SHAFTS", [_S.merge([{"c": _S.unary("-", 0.27)}, {"h": 0.03}, {"k": 0.65}, {"b": 1}, {"sw": 0.006}]), _S.merge([{"c": _S.unary("-", 0.17)}, {"h": 0.022}, {"k": 0.55}, {"b": 2}, {"sw": 0.005}]), _S.merge([{"c": _S.unary("-", 0.07)}, {"h": 0.05}, {"k": 1}, {"b": 1}, {"sw": 0.008}]), _S.merge([{"c": 0.03}, {"h": 0.018}, {"k": 0.6}, {"b": 3}, {"sw": 0.004}]), _S.merge([{"c": 0.12}, {"h": 0.042}, {"k": 0.85}, {"b": 2}, {"sw": 0.007}]), _S.merge([{"c": 0.23}, {"h": 0.026}, {"k": 0.6}, {"b": 1}, {"sw": 0.005}])])
	_S.define(_e, "STR", _S.construct(_S.read(_e, "Float32Array"), [512]))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "sh", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "SX")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "SY")))
	_S.define(_e, "r", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "AX")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "AY"))))
	_S.define(_e, "ang", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "NX")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "NY"))), _S.read(_e, "r")))
	_S.define(_e, "e", 0)
	for _v0 in _S.array(_S.read(_e, "sh")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "q", _S.binary("/", _S.invoke(_S.read(_v2, "Math"), "abs", [_S.binary("-", _S.read(_v2, "ang"), _S.prop(_S.read(_v2, "s"), "c"))]), _S.prop(_S.read(_v2, "s"), "h")))
		if _S.truth(_S.binary("<", _S.read(_v2, "q"), 1)):
			_S.write(_v2, "e", _S.binary("*", _S.prop(_S.read(_v2, "s"), "k"), _S.binary("**", _S.binary("-", 1, _S.binary("*", _S.read(_v2, "q"), _S.read(_v2, "q"))), 1.5)), "+=", false)
	if _S.truth(_S.binary("<=", _S.read(_e, "e"), 0)):
		return 0
	_S.define(_e, "strand", _S.prop(_S.read(_e, "STR"), _S.call_value(_S.read(_e, "clamp"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.binary("+", _S.read(_e, "ang"), 0.36), 700)]), 0, 511])))
	_S.define(_e, "fall", _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1.25, _S.binary("/", _S.binary("-", _S.read(_e, "r"), 230), 420))]))
	return _S.binary("*", _S.binary("*", _S.read(_e, "e"), _S.read(_e, "fall")), _S.binary("+", 0.7, _S.binary("*", 0.45, _S.read(_e, "strand"))))

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "sh", _S.call_value(_S.read(_e, "shafts"), [_S.read(_e, "t"), _S.read(_e, "S")]))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "C"), "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "sh"), "length"))
	_S.define(_e, "SC", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "n")]))
	_S.define(_e, "SI", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "n")]))
	_S.define(_e, "SK", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "n")]))
	_S.invoke(_S.read(_e, "sh"), "forEach", [_S.function_value(_e, "_f3")])
	_S.call_value(_S.read(_e, "rows"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.unary("-", 170), 9, _S.function_value(_e, "_f4")])
	_S.invoke(_S.read(_e, "q"), "glow", [_S.unary("-", 168), _S.unary("-", 178), 130, _S.prop(_S.read(_e, "C"), 3), 0.3])
	_S.invoke(_S.read(_e, "q"), "glow", [_S.unary("-", 168), _S.unary("-", 178), 50, _S.prop(_S.read(_e, "C"), 5), 0.35])
	_S.call_value(_S.read(_e, "motes"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), _S.read(_e, "sh"), false])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 0), _S.read(_e, "c"), 0.75])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.last([_S.set_prop(_S.read(_e, "SC"), _S.read(_e, "j"), _S.prop(_S.read(_e, "s"), "c"), "=", false), _S.set_prop(_S.read(_e, "SI"), _S.read(_e, "j"), _S.binary("/", 1, _S.prop(_S.read(_e, "s"), "h")), "=", false), _S.set_prop(_S.read(_e, "SK"), _S.read(_e, "j"), _S.prop(_S.read(_e, "s"), "k"), "=", false)])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	_S.define(_e, "floor", _S.binary(">", _S.read(_e, "y"), 0))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "SY")))
	_S.define(_e, "air", (0.8 if _S.truth(_S.read(_e, "floor")) else 0.66))
	_S.define(_e, "boost", (1.6 if _S.truth(_S.read(_e, "floor")) else 1))
	_S.define(_e, "r", _S.binary("+", _S.binary("*", _S.binary("-", _S.binary("+", _S.unary("-", 160), 0.5), _S.read(_e, "SX")), _S.read(_e, "AX")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "AY"))))
	_S.define(_e, "nn", _S.binary("+", _S.binary("*", _S.binary("-", _S.binary("+", _S.unary("-", 160), 0.5), _S.read(_e, "SX")), _S.read(_e, "NX")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "NY"))))
	_S.invoke(_S.prop(_S.read(_e, "R"), "a"), "fill", [_S.read(_e, "air")])
	_S.invoke(_S.prop(_S.read(_e, "R"), "b"), "fill", [1])
	_S.invoke(_S.prop(_S.read(_e, "R"), "c"), "fill", [_S.prop(_S.read(_e, "C"), 0)])
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), _S.read(_v3, "W"))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "ang", _S.binary("/", _S.read(_v4, "nn"), _S.read(_v4, "r")))
		_S.define(_v4, "e", 0)
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "j"), _S.read(_v5, "n"))):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "q2", _S.binary("*", _S.binary("-", _S.read(_v6, "ang"), _S.prop(_S.read(_v6, "SC"), _S.read(_v6, "j"))), _S.prop(_S.read(_v6, "SI"), _S.read(_v6, "j"))))
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v6, "q2"), _S.unary("-", 1)), func(): return _S.binary("<", _S.read(_v6, "q2"), 1))):
				var _v7 = _S.scope(_v6)
				_S.define(_v7, "w", _S.binary("-", 1, _S.binary("*", _S.read(_v7, "q2"), _S.read(_v7, "q2"))))
				_S.write(_v7, "e", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v7, "SK"), _S.read(_v7, "j")), _S.read(_v7, "w")), _S.invoke(_S.read(_v7, "Math"), "sqrt", [_S.read(_v7, "w")])), "+=", false)
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "j", 1, "+=", true)
		if _S.truth(_S.binary("<=", _S.read(_v4, "e"), 0)):
			_v3 = _S.iteration(_v3)
			_S.last([_S.write(_v3, "i", 1, "+=", true), _S.write(_v3, "r", _S.read(_v3, "AX"), "+=", false), _S.write(_v3, "nn", _S.read(_v3, "NX"), "+=", false)])
			continue
		_S.define(_v4, "fall", _S.binary("-", 1.35, _S.binary("/", _S.binary("-", _S.read(_v4, "r"), 200), 330)))
		_S.define(_v4, "si", _S.binary("|", _S.binary("*", _S.binary("+", _S.read(_v4, "ang"), 0.36), 700), 0))
		_S.write(_v4, "e", _S.binary("*", _S.binary("*", (1 if _S.truth(_S.binary(">", _S.read(_v4, "fall"), 1)) else (0 if _S.truth(_S.binary("<", _S.read(_v4, "fall"), 0)) else _S.read(_v4, "fall"))), _S.binary("+", 0.7, _S.binary("*", 0.45, _S.prop(_S.read(_v4, "STR"), (0 if _S.truth(_S.binary("<", _S.read(_v4, "si"), 0)) else (511 if _S.truth(_S.binary(">", _S.read(_v4, "si"), 511)) else _S.read(_v4, "si"))))))), _S.read(_v4, "boost")), "*=", false)
		if _S.truth(_S.binary("<", _S.read(_v4, "e"), 0.06)):
			_v3 = _S.iteration(_v3)
			_S.last([_S.write(_v3, "i", 1, "+=", true), _S.write(_v3, "r", _S.read(_v3, "AX"), "+=", false), _S.write(_v3, "nn", _S.read(_v3, "NX"), "+=", false)])
			continue
		_S.define(_v4, "lv", (6 if _S.truth(_S.binary(">", _S.read(_v4, "e"), 1.05)) else (5 if _S.truth(_S.binary(">", _S.read(_v4, "e"), 0.78)) else (4 if _S.truth(_S.binary(">", _S.read(_v4, "e"), 0.52)) else (3 if _S.truth(_S.binary(">", _S.read(_v4, "e"), 0.3)) else 2)))))
		_S.set_prop(_S.prop(_S.read(_v4, "R"), "c"), _S.read(_v4, "i"), (_S.prop(_S.read(_v4, "C"), _S.read(_v4, "lv")) if _S.truth(_S.read(_v4, "floor")) else _S.prop(_S.read(_v4, "L"), _S.read(_v4, "lv"))), "=", false)
		_S.set_prop(_S.prop(_S.read(_v4, "R"), "a"), _S.read(_v4, "i"), (0.85 if _S.truth(_S.read(_v4, "floor")) else _S.invoke(_S.read(_v4, "Math"), "min", [0.78, _S.binary("+", 0.12, _S.binary("*", _S.read(_v4, "e"), 0.5))])), "=", false)
		_S.set_prop(_S.prop(_S.read(_v4, "R"), "l"), _S.read(_v4, "i"), _S.prop(_S.read(_v4, "C"), 4), "=", false)
		_S.set_prop(_S.prop(_S.read(_v4, "R"), "k"), _S.read(_v4, "i"), _S.binary("*", _S.read(_v4, "e"), (0.32 if _S.truth(_S.read(_v4, "floor")) else 0.26)), "=", false)
		_v3 = _S.iteration(_v3)
		_S.last([_S.write(_v3, "i", 1, "+=", true), _S.write(_v3, "r", _S.read(_v3, "AX"), "+=", false), _S.write(_v3, "nn", _S.read(_v3, "NX"), "+=", false)])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.call_value(_S.read(_e, "motes"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), _S.call_value(_S.read(_e, "shafts"), [_S.read(_e, "t"), _S.read(_e, "S")]), true])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "S", _S.arg(_args, 1))
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), 512)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "a", _S.binary("/", _S.read(_v9, "i"), 512))
		_S.set_prop(_S.read(_v9, "STR"), _S.read(_v9, "i"), _S.binary("+", 0.5, _S.binary("*", _S.binary("*", 0.5, _S.invoke(_S.read(_v9, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v9, "a"), 190), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.read(_v9, "TAU"), _S.read(_v9, "t")), _S.read(_v9, "D"))]), 2)), _S.read(_v9, "S"))])), _S.invoke(_S.read(_v9, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.read(_v9, "a"), 77), _S.binary("/", _S.binary("*", _S.read(_v9, "TAU"), _S.read(_v9, "t")), _S.read(_v9, "D"))), _S.binary("*", _S.read(_v9, "S"), 2))]))), "=", false)
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	return _S.invoke(_S.read(_e, "SHAFTS"), "map", [_S.function_value(_e, "_f7")])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"c": _S.binary("+", _S.prop(_S.read(_e, "s"), "c"), _S.binary("*", _S.prop(_S.read(_e, "s"), "sw"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), _S.read(_e, "D")), _S.binary("*", _S.read(_e, "i"), 1.3))])))}, {"h": _S.binary("*", _S.prop(_S.read(_e, "s"), "h"), _S.binary("+", 1, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.prop(_S.read(_e, "s"), "b")), _S.read(_e, "t")), _S.read(_e, "D")), _S.read(_e, "i"))]))))}, {"k": _S.binary("*", _S.prop(_S.read(_e, "s"), "k"), _S.binary("+", 0.72, _S.binary("*", 0.28, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.prop(_S.read(_e, "s"), "b")), _S.read(_e, "t")), _S.read(_e, "D")), _S.binary("*", _S.read(_e, "i"), 2.1))]))))}])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "sh", _S.arg(_args, 4))
	_S.define(_e, "front", _S.arg(_args, 5))
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", (0 if _S.truth(_S.read(_v10, "front")) else 50))
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), (50 if _S.truth(_S.read(_v10, "front")) else 160))):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "R", _S.function_value(_v11, "_f9"))
		_S.define(_v11, "n1", _S.binary("+", 1, _S.invoke(_S.read(_v11, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v11, "R"), [1]), 2)])))
		_S.define(_v11, "n2", _S.binary("+", 1, _S.invoke(_S.read(_v11, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v11, "R"), [2]), 2)])))
		_S.define(_v11, "x", _S.binary("+", _S.binary("+", _S.unary("-", 170), _S.binary("*", _S.call_value(_S.read(_v11, "R"), [3]), 340)), _S.binary("*", _S.binary("+", 8, _S.binary("*", _S.call_value(_S.read(_v11, "R"), [4]), 14)), _S.invoke(_S.read(_v11, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v11, "TAU"), _S.read(_v11, "n1")), _S.read(_v11, "t")), _S.read(_v11, "D")), _S.binary("*", _S.call_value(_S.read(_v11, "R"), [5]), _S.read(_v11, "TAU")))]))))
		_S.define(_v11, "y", _S.binary("+", _S.binary("+", _S.binary("+", _S.unary("-", 170), _S.binary("*", _S.call_value(_S.read(_v11, "R"), [6]), 172)), _S.binary("*", _S.binary("+", 6, _S.binary("*", _S.call_value(_S.read(_v11, "R"), [7]), 10)), _S.invoke(_S.read(_v11, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v11, "TAU"), _S.read(_v11, "n2")), _S.read(_v11, "t")), _S.read(_v11, "D")), _S.binary("*", _S.call_value(_S.read(_v11, "R"), [8]), _S.read(_v11, "TAU")))]))), _S.binary("*", 4, _S.invoke(_S.read(_v11, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v11, "TAU"), 3), _S.read(_v11, "t")), _S.read(_v11, "D")), _S.read(_v11, "i"))]))))
		_S.define(_v11, "e", _S.call_value(_S.read(_v11, "lightAt"), [_S.read(_v11, "x"), _S.read(_v11, "y"), _S.read(_v11, "sh")]))
		if _S.truth(_S.binary("<", _S.read(_v11, "e"), 0.12)):
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
			continue
		_S.define(_v11, "big", _S.logical("&&", _S.read(_v11, "front"), func(): return _S.binary("<", _S.call_value(_S.read(_v11, "R"), [9]), 0.5)))
		_S.define(_v11, "k", _S.invoke(_S.read(_v11, "Math"), "min", [1, _S.read(_v11, "e")]))
		_S.invoke(_S.read(_v11, "q"), "px", [_S.read(_v11, "x"), _S.read(_v11, "y"), (_S.read(_v11, "WHITE") if _S.truth(_S.binary(">", _S.read(_v11, "k"), 0.6)) else (_S.prop(_S.read(_v11, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v11, "k"), 0.3)) else _S.prop(_S.read(_v11, "C"), 4)))])
		if _S.truth(_S.logical("&&", _S.read(_v11, "big"), func(): return _S.binary(">", _S.read(_v11, "k"), 0.5))):
			_S.last([_S.invoke(_S.read(_v11, "q"), "px", [_S.binary("+", _S.read(_v11, "x"), 1), _S.read(_v11, "y"), _S.prop(_S.read(_v11, "C"), 4)]), _S.invoke(_S.read(_v11, "q"), "px", [_S.read(_v11, "x"), _S.binary("+", _S.read(_v11, "y"), 1), _S.prop(_S.read(_v11, "C"), 4)])])
		_S.invoke(_S.read(_v11, "q"), "glow", [_S.read(_v11, "x"), _S.read(_v11, "y"), (6 if _S.truth(_S.read(_v11, "big")) else 4), _S.prop(_S.read(_v11, "C"), 4), _S.binary("*", 0.4, _S.read(_v11, "k"))])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "i"), _S.read(_e, "k")])
