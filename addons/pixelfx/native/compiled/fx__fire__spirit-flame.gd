@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/spirit-flame.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "soft", _S.import_value("fx/fire/_lib.js", "soft"))
	_S.define(_e, "ghostTongue", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Spirit flame"}, {"desc": "A cold blue-teal ghost fire floating in the air: a bright rim round a hollow dark heart, a wave climbing its wispy tail, curls breaking off, cold sparks rising."}, {"tags": ["fire", "spirit", "ghost", "magic", "cold", "ambient", "loop"]}, {"size": [80, 124]}, {"origin": [40, 94]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#040a16", "#08203a", "#0b3a52", "#0f5e6e", "#16908e", "#2cc4b4", "#7ef0dc", "#c8fff2", "#ffffff"]}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "GHOST", [[1, 1, 1], [0.8, 0.92, 3], [0.6, 0.78, 6], [0.3, 0.42, 2], [0.14, 0.22, 0]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "h", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "centre", _S.arg(_args, 5))
	_S.define(_e, "N", _S.arg(_args, 6))
	_S.define(_e, "n", _S.arg(_args, 7))
	_S.define(_e, "H", _S.arg(_args, 8))
	_S.define(_e, "layers", _S.arg(_args, 9))
	_S.define(_e, "jit", _S.coalesce(_S.arg(_args, 10), func(): return 0.5))
	for _v0 in _S.array(_S.read(_e, "layers")):
		var _v1 = _S.scope(_e)
		var _v2 = _v0
		_S.define(_v1, "lw", _S.prop(_v2, 0))
		_S.define(_v1, "lh", _S.prop(_v2, 1))
		_S.define(_v1, "ri", _S.prop(_v2, 2))
		var _v3 = _S.scope(_v1)
		_S.define(_v3, "L", _S.binary("*", _S.read(_v3, "h"), _S.read(_v3, "lh")))
		_S.define(_v3, "c", _S.prop(_S.read(_v3, "H"), _S.read(_v3, "ri")))
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "r", 0)
		while _S.truth(_S.binary("<=", _S.read(_v4, "r"), _S.read(_v4, "L"))):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "u", _S.binary("/", _S.read(_v5, "r"), _S.invoke(_S.read(_v5, "Math"), "max", [1, _S.read(_v5, "L")])))
			_S.define(_v5, "v", _S.binary("/", _S.read(_v5, "r"), _S.read(_v5, "h")))
			_S.define(_v5, "half", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v5, "w"), _S.read(_v5, "lw")), _S.invoke(_S.read(_v5, "Math"), "pow", [_S.binary("-", 1, _S.read(_v5, "u")), 0.75])), _S.invoke(_S.read(_v5, "Math"), "min", [1, _S.binary("/", _S.binary("+", _S.read(_v5, "r"), 1.5), 4)])), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v5, "N"), [6, _S.read(_v5, "n"), _S.binary("*", _S.read(_v5, "r"), 0.4)]), _S.read(_v5, "jit")), _S.read(_v5, "u"))))
			if _S.truth(_S.binary("<", _S.read(_v5, "half"), 0.3)):
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "r", 1, "+=", true)
				continue
			_S.define(_v5, "cx", _S.binary("+", _S.read(_v5, "x"), _S.call_value(_S.read(_v5, "centre"), [_S.read(_v5, "v"), _S.read(_v5, "r")])))
			_S.define(_v5, "Y", _S.invoke(_S.read(_v5, "Math"), "round", [_S.binary("-", _S.read(_v5, "y"), _S.read(_v5, "r"))]))
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "px", _S.invoke(_S.read(_v6, "Math"), "round", [_S.binary("-", _S.read(_v6, "cx"), _S.read(_v6, "half"))]))
			_S.define(_v6, "x1", _S.invoke(_S.read(_v6, "Math"), "round", [_S.binary("+", _S.read(_v6, "cx"), _S.read(_v6, "half"))]))
			while _S.truth(_S.binary("<=", _S.read(_v6, "px"), _S.read(_v6, "x1"))):
				_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "px"), _S.read(_v6, "Y"), _S.read(_v6, "c")])
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "px", 1, "+=", true)
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "r", 1, "+=", true)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "hotFirst"), [_S.read(_e, "F")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "N", _S.function_value(_e, "_f2"))
	_S.define(_e, "COLD", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.read(_e, "WHITE"), 0.15]))
	_S.define(_e, "bob", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))]), 1.5))
	_S.define(_e, "lean", _S.binary("*", _S.call_value(_S.read(_e, "N"), [0.67, _S.binary("+", _S.read(_e, "S"), 2)]), 3))
	_S.define(_e, "wave", _S.function_value(_e, "_f3"))
	_S.define(_e, "H0", _S.binary("*", 44, _S.binary("+", 0.92, _S.binary("*", 0.08, _S.call_value(_S.read(_e, "N"), [1.3, _S.binary("+", _S.read(_e, "S"), 3)])))))
	_S.define(_e, "y0", _S.read(_e, "bob"))
	_S.define(_e, "br", _S.binary("+", 0.9, _S.binary("*", 0.1, _S.call_value(_S.read(_e, "N"), [2, _S.binary("+", _S.read(_e, "S"), 4)]))))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.read(_e, "y0"), 16), 60, _S.read(_e, "COLD"), _S.binary("*", 0.36, _S.read(_e, "br"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("*", _S.call_value(_S.read(_e, "wave"), [0.5, 20]), 0.5), _S.binary("-", _S.read(_e, "y0"), 20), 26, _S.prop(_S.read(_e, "H"), 2), _S.binary("*", 0.2, _S.read(_e, "br"))])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 40, _S.binary("+", _S.read(_e, "S"), 300), _S.function_value(_e, "_f4"), _S.function_value(_e, "_f5")])
	_S.define(_e, "wl", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("+", 0.25, _S.binary("*", 0.55, _S.call_value(_S.read(_e, "N"), [1.7, _S.binary("+", _S.read(_e, "S"), 6)])))]))
	_S.define(_e, "wr", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("+", 0.25, _S.binary("*", 0.55, _S.call_value(_S.read(_e, "N"), [1.7, _S.binary("+", _S.read(_e, "S"), 7)])))]))
	if _S.truth(_S.binary(">", _S.read(_e, "wl"), 0.12)):
		_S.call_value(_S.read(_e, "ghostTongue"), [_S.read(_e, "p"), _S.unary("-", 4), _S.binary("-", _S.read(_e, "y0"), 4), _S.binary("*", _S.read(_e, "H0"), _S.read(_e, "wl")), 2.4, _S.function_value(_e, "_f6"), _S.read(_e, "N"), _S.binary("+", _S.binary("*", _S.read(_e, "S"), 11), 1), _S.read(_e, "H"), _S.read(_e, "GHOST")])
	if _S.truth(_S.binary(">", _S.read(_e, "wr"), 0.12)):
		_S.call_value(_S.read(_e, "ghostTongue"), [_S.read(_e, "p"), 4.2, _S.binary("-", _S.read(_e, "y0"), 4), _S.binary("*", _S.read(_e, "H0"), _S.read(_e, "wr")), 2.4, _S.function_value(_e, "_f7"), _S.read(_e, "N"), _S.binary("+", _S.binary("*", _S.read(_e, "S"), 11), 2), _S.read(_e, "H"), _S.read(_e, "GHOST")])
	_S.call_value(_S.read(_e, "ghostTongue"), [_S.read(_e, "p"), 0, _S.read(_e, "y0"), _S.read(_e, "H0"), 8.6, _S.function_value(_e, "_f8"), _S.read(_e, "N"), _S.binary("*", _S.read(_e, "S"), 11), _S.read(_e, "H"), _S.read(_e, "GHOST"), 0.6])
	for _v8 in _S.array([0, 1]):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "k", _v8)
		var _v10 = _S.scope(_v9)
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "r", 4)
		while _S.truth(_S.binary("<", _S.read(_v11, "r"), _S.binary("*", _S.read(_v11, "H0"), 0.72))):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "v", _S.binary("/", _S.read(_v12, "r"), _S.read(_v12, "H0")))
			_S.define(_v12, "x", _S.binary("+", _S.call_value(_S.read(_v12, "wave"), [_S.read(_v12, "v"), _S.read(_v12, "r")]), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.read(_v12, "r"), 0.35), _S.binary("*", _S.binary("*", _S.read(_v12, "ph"), _S.read(_v12, "TAU")), 3)), _S.binary("*", _S.read(_v12, "k"), _S.prop(_S.read(_v12, "Math"), "PI")))]), 2.2), _S.binary("-", 1, _S.read(_v12, "v")))))
			_S.define(_v12, "on", _S.binary(">", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.read(_v12, "r"), 0.2), _S.binary("*", _S.binary("*", _S.read(_v12, "ph"), _S.read(_v12, "TAU")), 4)), _S.binary("*", _S.read(_v12, "k"), 2))]), 0.2))
			if _S.truth(_S.read(_v12, "on")):
				_S.invoke(_S.read(_v12, "p"), "px", [_S.read(_v12, "x"), _S.binary("-", _S.read(_v12, "y0"), _S.read(_v12, "r")), (_S.prop(_S.read(_v12, "H"), 2) if _S.truth(_S.read(_v12, "k")) else _S.prop(_S.read(_v12, "H"), 1))])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "r", 1, "+=", true)
	for _v13 in _S.array([0.2, 0.45, 0.7]):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "v", _v13)
		_S.invoke(_S.read(_v14, "p"), "glow", [_S.call_value(_S.read(_v14, "wave"), [_S.read(_v14, "v"), _S.binary("*", _S.read(_v14, "H0"), _S.read(_v14, "v"))]), _S.binary("-", _S.read(_v14, "y0"), _S.binary("*", _S.read(_v14, "H0"), _S.read(_v14, "v"))), 12, _S.prop(_S.read(_v14, "H"), 2), _S.binary("*", 0.16, _S.read(_v14, "br"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.read(_e, "y0"), 4), 9, _S.prop(_S.read(_e, "H"), 1), _S.binary("+", 0.22, _S.binary("*", 0.06, _S.call_value(_S.read(_e, "N"), [3, _S.binary("+", _S.read(_e, "S"), 5)])))])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 34, _S.binary("+", _S.read(_e, "S"), 400), _S.function_value(_e, "_f9"), _S.function_value(_e, "_f10")])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rate", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	_S.define(_e, "off", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), _S.read(_e, "rate"), _S.read(_e, "seed"), _S.read(_e, "off")])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.read(_e, "r"), 0.24), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2)), _S.read(_e, "k"))]), 2.2), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.read(_e, "r"), 0.11), _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))), _S.binary("*", _S.read(_e, "k"), 0.5))]), 3.2)), _S.read(_e, "v")), _S.read(_e, "v")), _S.binary("*", _S.binary("*", _S.read(_e, "lean"), _S.read(_e, "v")), _S.read(_e, "v")))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"x": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 4), 4])}, {"y": _S.binary("*", _S.unary("-", _S.read(_e, "H0")), _S.invoke(_S.read(_e, "r"), "range", [0.55, 0.95]))}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 7), 7])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [10, 22]))}, {"life": _S.invoke(_S.read(_e, "r"), "range", [1, 1.9])}, {"s": _S.invoke(_S.read(_e, "r"), "range", [1.4, 2.8])}, {"a": _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")])}, {"w": _S.invoke(_S.read(_e, "r"), "range", [2, 3.5])}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "tb", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")))
	var _v7 = _S.call_value(_S.read(_e, "drift"), [_S.binary("+", _S.prop(_S.read(_e, "q"), "x"), _S.binary("*", _S.call_value(_S.read(_e, "wave"), [0.9, 26, 0]), 0.5)), _S.binary("+", _S.prop(_S.read(_e, "q"), "y"), _S.read(_e, "y0")), _S.prop(_S.read(_e, "q"), "vx"), _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"), 0, _S.unary("-", 6), 1.2, 0.6])
	_S.define(_e, "x", _S.prop(_v7, 0))
	_S.define(_e, "y", _S.prop(_v7, 1))
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))))
	_S.define(_e, "cx", _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "w")), _S.prop(_S.read(_e, "q"), "a"))]), 3), _S.binary("+", _S.read(_e, "age"), 0.2))))
	_S.define(_e, "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 5)]), _S.read(_e, "k")))
	_S.call_value(_S.read(_e, "soft"), [_S.read(_e, "p"), _S.read(_e, "cx"), _S.read(_e, "y"), _S.binary("*", _S.prop(_S.read(_e, "q"), "s"), _S.binary("+", 0.8, _S.binary("*", _S.read(_e, "age"), 0.8))), _S.prop(_S.read(_e, "H"), 4), _S.binary("*", 0.35, _S.read(_e, "a"))])
	_S.call_value(_S.read(_e, "soft"), [_S.read(_e, "p"), _S.binary("-", _S.read(_e, "cx"), 0.4), _S.binary("-", _S.read(_e, "y"), 0.6), _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "s"), 0.5), _S.binary("+", 0.8, _S.binary("*", _S.read(_e, "age"), 0.5))), _S.prop(_S.read(_e, "H"), 2), _S.binary("*", _S.binary("*", 0.4, _S.read(_e, "a")), _S.read(_e, "k"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "cx"), _S.read(_e, "y"), 6, _S.prop(_S.read(_e, "H"), 3), _S.binary("*", 0.15, _S.read(_e, "a"))])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	return _S.binary("+", _S.binary("-", _S.call_value(_S.read(_e, "wave"), [_S.read(_e, "v"), _S.read(_e, "r"), 2.1]), _S.binary("*", _S.binary("*", 6, _S.read(_e, "v")), _S.read(_e, "v"))), _S.binary("*", _S.binary("*", 3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_e, "v"), 5), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2))])), _S.read(_e, "v")))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	return _S.binary("-", _S.binary("+", _S.call_value(_S.read(_e, "wave"), [_S.read(_e, "v"), _S.read(_e, "r"), _S.unary("-", 1.8)]), _S.binary("*", _S.binary("*", 6, _S.read(_e, "v")), _S.read(_e, "v"))), _S.binary("*", _S.binary("*", 3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.read(_e, "v"), 5), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2)), 1)])), _S.read(_e, "v")))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "wave"), [_S.read(_e, "v"), _S.read(_e, "r")])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"x": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 7), 7])}, {"y": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [4, 28]))}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 12), 12])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [14, 34]))}, {"life": _S.invoke(_S.read(_e, "r"), "range", [0.9, 1.8])}, {"a": _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")])}])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v15 = _S.call_value(_S.read(_e, "drift"), [_S.prop(_S.read(_e, "q"), "x"), _S.binary("+", _S.prop(_S.read(_e, "q"), "y"), _S.read(_e, "y0")), _S.prop(_S.read(_e, "q"), "vx"), _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"), 0, _S.unary("-", 10), 1.2, 1.2])
	_S.define(_e, "x", _S.prop(_v15, 0))
	_S.define(_e, "y", _S.prop(_v15, 1))
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))))
	_S.define(_e, "tw", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 14), _S.prop(_S.read(_e, "q"), "a"))]))))
	_S.define(_e, "sx", _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 3), _S.prop(_S.read(_e, "q"), "a"))]), 3)))
	if _S.truth(_S.binary("<", _S.binary("*", _S.read(_e, "k"), _S.binary("+", 0.4, _S.binary("*", 0.6, _S.read(_e, "tw")))), 0.2)):
		return null
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "sx"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "H"), 0) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "tw"), 0.7), func(): return _S.binary(">", _S.read(_e, "k"), 0.5))) else (_S.prop(_S.read(_e, "H"), 1) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.5)) else _S.prop(_S.read(_e, "H"), 3)))])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "tw"), 0.85), func(): return _S.binary(">", _S.read(_e, "k"), 0.6))):
		_S.last([_S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "sx"), 1), _S.read(_e, "y"), _S.prop(_S.read(_e, "H"), 3)]), _S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.read(_e, "sx"), 1), _S.read(_e, "y"), _S.prop(_S.read(_e, "H"), 3)]), _S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "sx"), _S.binary("-", _S.read(_e, "y"), 1), _S.prop(_S.read(_e, "H"), 3)]), _S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "sx"), _S.binary("+", _S.read(_e, "y"), 1), _S.prop(_S.read(_e, "H"), 3)])])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "sx"), _S.read(_e, "y"), 4, _S.prop(_S.read(_e, "H"), 2), _S.binary("*", 0.3, _S.read(_e, "k"))])
	return null
