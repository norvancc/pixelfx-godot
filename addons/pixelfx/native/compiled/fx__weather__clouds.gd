@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/clouds.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "box", _S.import_value("fx/weather/_lib.js", "box"))
	_S.define(_e, "bayer", _S.import_value("fx/weather/_lib.js", "bayer"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "moon", _S.function_value(_e, "_f2"))
	_S.define(_e, "cloud", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Clouds"}, {"desc": "Layers of clouds drift past a bright moon at night: silver-lit tops, dark bellies, edges that flare where they cross the moon, forming and thinning as they go."}, {"tags": ["weather", "clouds", "moon", "night", "sky", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 180]}, {"duration": 12}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0c0c18", "#16172a", "#232540", "#363a5a", "#545a80", "#8088ae", "#bcc4e2", "#f2f4ff"]}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 12)
	_S.define(_e, "MX", 92)
	_S.define(_e, "MY", _S.unary("-", 128))
	_S.define(_e, "MR", 12)
	_S.define(_e, "LAYERS", [_S.merge([{"n": 7}, {"w": [40, 70]}, {"h": [6, 11]}, {"y": [_S.unary("-", 150), _S.unary("-", 110)]}, {"v": 3}, {"life": [8, 11]}, {"tone": [2, 3, 4, 5]}, {"alpha": 0.7}]), _S.merge([{"n": 6}, {"w": [60, 100]}, {"h": [9, 15]}, {"y": [_S.unary("-", 120), _S.unary("-", 70)]}, {"v": 6}, {"life": [8, 11]}, {"tone": [1, 2, 4, 6]}, {"alpha": 0.88}]), _S.merge([{"n": 5}, {"w": [90, 140]}, {"h": [12, 20]}, {"y": [_S.unary("-", 80), _S.unary("-", 30)]}, {"v": 10}, {"life": [9, 12]}, {"tone": [1, 2, 3, 6]}, {"alpha": 1}])])
	_exports["draw"] = _S.read(_e, "draw")
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
	_S.call_value(_S.read(_e, "moon"), [_S.read(_e, "q"), _S.read(_e, "C")])
	_S.invoke(_S.read(_e, "LAYERS"), "forEach", [_S.function_value(_e, "_f1")])
	_S.invoke(_S.read(_e, "q"), "glow", [_S.read(_e, "MX"), _S.read(_e, "MY"), 110, _S.prop(_S.read(_e, "C"), 4), 0.14])
	_S.invoke(_S.read(_e, "q"), "glow", [_S.read(_e, "MX"), _S.read(_e, "MY"), 40, _S.prop(_S.read(_e, "C"), 5), 0.25])
	_S.invoke(_S.read(_e, "q"), "glow", [_S.read(_e, "MX"), _S.read(_e, "MY"), 18, _S.prop(_S.read(_e, "C"), 6), 0.3])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.prop(_S.read(_v0, "L"), "n"))):
		_S.call_value(_S.read(_v0, "cloud"), [_S.read(_v0, "q"), _S.read(_v0, "t"), _S.read(_v0, "S"), _S.read(_v0, "C"), _S.read(_v0, "L"), _S.read(_v0, "j"), _S.read(_v0, "i")])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.invoke(_S.read(_e, "q"), "shade", [_S.binary("-", _S.binary("-", _S.read(_e, "MX"), _S.read(_e, "MR")), 1), _S.binary("-", _S.binary("-", _S.read(_e, "MY"), _S.read(_e, "MR")), 1), _S.binary("+", _S.binary("+", _S.read(_e, "MX"), _S.read(_e, "MR")), 1), _S.binary("+", _S.binary("+", _S.read(_e, "MY"), _S.read(_e, "MR")), 1), _S.function_value(_e, "_f3")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "MX")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "MY")))
	_S.define(_e, "d", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]), _S.read(_e, "MR")))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		return null
	_S.define(_e, "sea", _S.logical("||", _S.logical("||", _S.binary("<", _S.binary("+", _S.binary("**", _S.binary("+", _S.read(_e, "dx"), 4), 2), _S.binary("**", _S.binary("+", _S.read(_e, "dy"), 2), 2)), 14), func(): return _S.binary("<", _S.binary("+", _S.binary("**", _S.binary("-", _S.read(_e, "dx"), 3), 2), _S.binary("**", _S.binary("-", _S.read(_e, "dy"), 4), 2)), 9)), func(): return _S.binary("<", _S.binary("+", _S.binary("**", _S.binary("-", _S.read(_e, "dx"), 5), 2), _S.binary("**", _S.binary("+", _S.read(_e, "dy"), 5), 2)), 4)))
	_S.set_prop(_S.read(_e, "out"), "c", ((_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.binary("+", _S.read(_e, "dx"), _S.read(_e, "dy")), 0)) else _S.read(_e, "WHITE")) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.86)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.read(_e, "sea")) else (_S.read(_e, "WHITE") if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "d"), 0.5), func(): return _S.binary("<", _S.binary("+", _S.read(_e, "dx"), _S.read(_e, "dy")), 0))) else _S.prop(_S.read(_e, "C"), 7)))), "=", false)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "L", _S.arg(_args, 4))
	_S.define(_e, "j", _S.arg(_args, 5))
	_S.define(_e, "i", _S.arg(_args, 6))
	_S.define(_e, "R", _S.function_value(_e, "_f5"))
	_S.define(_e, "life", _S.binary("+", _S.prop(_S.prop(_S.read(_e, "L"), "life"), 0), _S.binary("*", _S.call_value(_S.read(_e, "R"), [1]), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "L"), "life"), 1), _S.prop(_S.prop(_S.read(_e, "L"), "life"), 0)))))
	_S.define(_e, "age", _S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.binary("*", _S.call_value(_S.read(_e, "R"), [2]), _S.read(_e, "D"))), _S.read(_e, "D")]))
	if _S.truth(_S.binary(">=", _S.read(_e, "age"), _S.read(_e, "life"))):
		return null
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "grow", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "u"), 4)]), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_e, "u")), 4)])))
	_S.define(_e, "w", _S.binary("*", _S.binary("+", _S.prop(_S.prop(_S.read(_e, "L"), "w"), 0), _S.binary("*", _S.call_value(_S.read(_e, "R"), [3]), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "L"), "w"), 1), _S.prop(_S.prop(_S.read(_e, "L"), "w"), 0)))), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_e, "grow")))))
	_S.define(_e, "x0", _S.binary("+", _S.binary("+", _S.unary("-", 200), _S.binary("*", _S.call_value(_S.read(_e, "R"), [4]), 330)), _S.binary("*", _S.prop(_S.read(_e, "L"), "v"), _S.read(_e, "age"))))
	_S.define(_e, "base", _S.binary("+", _S.prop(_S.prop(_S.read(_e, "L"), "y"), 0), _S.binary("*", _S.call_value(_S.read(_e, "R"), [5]), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "L"), "y"), 1), _S.prop(_S.prop(_S.read(_e, "L"), "y"), 0)))))
	_S.define(_e, "H", _S.binary("*", _S.binary("+", _S.prop(_S.prop(_S.read(_e, "L"), "h"), 0), _S.binary("*", _S.call_value(_S.read(_e, "R"), [6]), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "L"), "h"), 1), _S.prop(_S.prop(_S.read(_e, "L"), "h"), 0)))), _S.read(_e, "grow")))
	if _S.truth(_S.binary("<", _S.read(_e, "H"), 1.5)):
		return null
	_S.define(_e, "n", _S.binary("+", 4, _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_e, "R"), [7]), 4)])))
	_S.define(_e, "puffs", [])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "k"), _S.read(_v1, "n"))):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "f", _S.binary("/", _S.binary("+", _S.read(_v2, "k"), 0.5), _S.read(_v2, "n")))
		_S.define(_v2, "r", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v2, "H"), _S.binary("+", 0.5, _S.binary("*", 0.35, _S.invoke(_S.read(_v2, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v2, "Math"), "PI"), _S.read(_v2, "f"))])))), _S.binary("+", 0.75, _S.binary("*", 0.5, _S.call_value(_S.read(_v2, "R"), [_S.binary("+", 10, _S.read(_v2, "k"))])))), _S.binary("+", 1, _S.binary("*", 0.06, _S.invoke(_S.read(_v2, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("/", _S.binary("*", _S.read(_v2, "TAU"), _S.read(_v2, "t")), _S.read(_v2, "D")), _S.read(_v2, "k")), _S.read(_v2, "i"))])))))
		_S.invoke(_S.read(_v2, "puffs"), "push", [[_S.binary("+", _S.binary("+", _S.read(_v2, "x0"), _S.binary("*", _S.read(_v2, "w"), _S.binary("-", _S.read(_v2, "f"), 0.5))), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v2, "R"), [_S.binary("+", 20, _S.read(_v2, "k"))]), 0.5), 6)), _S.binary("-", _S.binary("-", _S.read(_v2, "base"), _S.binary("*", _S.read(_v2, "r"), 0.3)), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v2, "R"), [_S.binary("+", 30, _S.read(_v2, "k"))]), _S.read(_v2, "H")), 0.15)), _S.read(_v2, "r")]])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "k", 1, "+=", true)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "k"), _S.binary("+", 1, _S.invoke(_S.read(_v3, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v3, "R"), [8]), 3)])))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "f", _S.binary("+", 0.3, _S.binary("*", _S.call_value(_S.read(_v4, "R"), [_S.binary("+", 40, _S.read(_v4, "k"))]), 0.4)))
		_S.define(_v4, "r", _S.binary("*", _S.binary("*", _S.read(_v4, "H"), _S.binary("+", 0.75, _S.binary("*", 0.35, _S.call_value(_S.read(_v4, "R"), [_S.binary("+", 50, _S.read(_v4, "k"))])))), _S.binary("+", 1, _S.binary("*", 0.05, _S.invoke(_S.read(_v4, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("/", _S.binary("*", _S.read(_v4, "TAU"), _S.read(_v4, "t")), _S.read(_v4, "D")), _S.binary("*", _S.read(_v4, "k"), 2)), _S.read(_v4, "i"))])))))
		_S.invoke(_S.read(_v4, "puffs"), "push", [[_S.binary("+", _S.read(_v4, "x0"), _S.binary("*", _S.read(_v4, "w"), _S.binary("-", _S.read(_v4, "f"), 0.5))), _S.binary("-", _S.binary("-", _S.read(_v4, "base"), _S.binary("*", _S.read(_v4, "H"), 0.55)), _S.binary("*", _S.read(_v4, "r"), 0.2)), _S.read(_v4, "r")]])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "k", 1, "+=", true)
	_S.define(_e, "x1", _S.binary("-", _S.binary("-", _S.read(_e, "x0"), _S.binary("/", _S.read(_e, "w"), 2)), _S.read(_e, "H")))
	_S.define(_e, "x2", _S.binary("+", _S.binary("+", _S.read(_e, "x0"), _S.binary("/", _S.read(_e, "w"), 2)), _S.read(_e, "H")))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "box"), [_S.read(_e, "meta")]))
	var _v5 = _S.scope(_e)
	_S.define(_v5, "x", _S.invoke(_S.read(_v5, "Math"), "max", [_S.prop(_S.read(_v5, "B"), "x0"), _S.invoke(_S.read(_v5, "Math"), "floor", [_S.read(_v5, "x1")])]))
	while _S.truth(_S.binary("<=", _S.read(_v5, "x"), _S.invoke(_S.read(_v5, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_v5, "B"), "x1"), 1), _S.invoke(_S.read(_v5, "Math"), "ceil", [_S.read(_v5, "x2")])]))):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "cx", _S.binary("+", _S.read(_v6, "x"), 0.5))
		_S.define(_v6, "top", INF)
		_S.define(_v6, "top2", INF)
		for _v7 in _S.array(_S.read(_v6, "puffs")):
			var _v8 = _S.scope(_v6)
			var _v9 = _v7
			_S.define(_v8, "px", _S.prop(_v9, 0))
			_S.define(_v8, "py", _S.prop(_v9, 1))
			_S.define(_v8, "r", _S.prop(_v9, 2))
			var _v10 = _S.scope(_v8)
			_S.define(_v10, "dx", _S.binary("-", _S.read(_v10, "cx"), _S.read(_v10, "px")))
			if _S.truth(_S.binary(">=", _S.binary("*", _S.read(_v10, "dx"), _S.read(_v10, "dx")), _S.binary("*", _S.read(_v10, "r"), _S.read(_v10, "r")))):
				continue
			_S.define(_v10, "y", _S.binary("-", _S.read(_v10, "py"), _S.invoke(_S.read(_v10, "Math"), "sqrt", [_S.binary("-", _S.binary("*", _S.read(_v10, "r"), _S.read(_v10, "r")), _S.binary("*", _S.read(_v10, "dx"), _S.read(_v10, "dx")))])))
			if _S.truth(_S.binary("<", _S.read(_v10, "y"), _S.read(_v10, "top"))):
				_S.last([_S.write(_v10, "top2", _S.read(_v10, "top"), "=", false), _S.write(_v10, "top", _S.read(_v10, "y"), "=", false)])
			else:
				if _S.truth(_S.binary("<", _S.read(_v10, "y"), _S.read(_v10, "top2"))):
					_S.write(_v10, "top2", _S.read(_v10, "y"), "=", false)
		if _S.truth(_S.binary("===", _S.read(_v6, "top"), INF)):
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "x", 1, "+=", true)
			continue
		_S.define(_v6, "end", _S.binary("/", _S.invoke(_S.read(_v6, "Math"), "min", [_S.binary("-", _S.read(_v6, "cx"), _S.read(_v6, "x1")), _S.binary("-", _S.read(_v6, "x2"), _S.read(_v6, "cx"))]), _S.read(_v6, "H")))
		_S.define(_v6, "bot", _S.binary("-", _S.binary("+", _S.binary("+", _S.read(_v6, "base"), 1.5), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v6, "cx"), 0.21), _S.read(_v6, "i"))]), 0.8)), (_S.binary("*", _S.binary("-", 1, _S.read(_v6, "end")), 4) if _S.truth(_S.binary("<", _S.read(_v6, "end"), 1)) else 0)))
		if _S.truth(_S.binary("<=", _S.read(_v6, "bot"), _S.read(_v6, "top"))):
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "x", 1, "+=", true)
			continue
		_S.define(_v6, "h", _S.binary("-", _S.read(_v6, "bot"), _S.read(_v6, "top")))
		_S.define(_v6, "inner", (_S.invoke(_S.read(_v6, "Math"), "floor", [_S.read(_v6, "top2")]) if _S.truth(_S.logical("&&", _S.binary(">", _S.binary("-", _S.read(_v6, "top2"), _S.read(_v6, "top")), 2.5), func(): return _S.binary("<", _S.read(_v6, "top2"), _S.binary("-", _S.read(_v6, "bot"), 2)))) else _S.unary("-", 999)))
		var _v11 = _S.scope(_v6)
		_S.define(_v11, "y", _S.invoke(_S.read(_v11, "Math"), "floor", [_S.read(_v11, "top")]))
		while _S.truth(_S.binary("<", _S.read(_v11, "y"), _S.read(_v11, "bot"))):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "d", _S.binary("-", _S.binary("+", _S.read(_v12, "y"), 0.5), _S.read(_v12, "top")))
			_S.define(_v12, "v", _S.binary("/", _S.read(_v12, "d"), _S.read(_v12, "h")))
			_S.define(_v12, "th", _S.binary("*", _S.call_value(_S.read(_v12, "bayer"), [_S.read(_v12, "x"), _S.read(_v12, "y")]), 0.12))
			_S.define(_v12, "md", _S.invoke(_S.read(_v12, "Math"), "hypot", [_S.binary("-", _S.read(_v12, "cx"), _S.read(_v12, "MX")), _S.binary("-", _S.read(_v12, "y"), _S.read(_v12, "MY"))]))
			_S.define(_v12, "c", (_S.prop(_S.prop(_S.read(_v12, "L"), "tone"), 3) if _S.truth(_S.binary("<", _S.read(_v12, "d"), 1)) else (_S.prop(_S.prop(_S.read(_v12, "L"), "tone"), 2) if _S.truth(_S.binary("<", _S.read(_v12, "v"), _S.binary("+", 0.25, _S.read(_v12, "th")))) else (_S.prop(_S.prop(_S.read(_v12, "L"), "tone"), 1) if _S.truth(_S.binary("<", _S.read(_v12, "v"), _S.binary("+", 0.62, _S.read(_v12, "th")))) else _S.prop(_S.prop(_S.read(_v12, "L"), "tone"), 0)))))
			if _S.truth(_S.binary("===", _S.read(_v12, "y"), _S.read(_v12, "inner"))):
				_S.write(_v12, "c", _S.invoke(_S.read(_v12, "Math"), "max", [_S.read(_v12, "c"), _S.prop(_S.prop(_S.read(_v12, "L"), "tone"), 2)]), "=", false)
			if _S.truth(_S.logical("&&", _S.binary("<", _S.binary("-", _S.binary("-", _S.read(_v12, "bot"), _S.read(_v12, "y")), 0.5), 1), func(): return _S.binary(">", _S.read(_v12, "v"), 0.5))):
				_S.write(_v12, "c", _S.invoke(_S.read(_v12, "Math"), "max", [0, _S.binary("-", _S.prop(_S.prop(_S.read(_v12, "L"), "tone"), 0), 1)]), "=", false)
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v12, "md"), 46), func(): return _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v12, "d"), 2), func(): return _S.binary("===", _S.read(_v12, "y"), _S.read(_v12, "inner"))), func(): return _S.binary("<", _S.read(_v12, "v"), 0.3)))):
				_S.write(_v12, "c", _S.invoke(_S.read(_v12, "Math"), "min", [7, _S.binary("+", _S.read(_v12, "c"), (2 if _S.truth(_S.binary("<", _S.read(_v12, "md"), 24)) else 1))]), "=", false)
			_S.define(_v12, "a", _S.binary("*", _S.prop(_S.read(_v12, "L"), "alpha"), _S.invoke(_S.read(_v12, "Math"), "min", [1, _S.binary("*", _S.read(_v12, "grow"), 1.5)])))
			if _S.truth(_S.binary(">=", _S.read(_v12, "a"), 1)):
				_S.invoke(_S.read(_v12, "q"), "px", [_S.read(_v12, "x"), _S.read(_v12, "y"), _S.prop(_S.read(_v12, "C"), _S.read(_v12, "c"))])
			else:
				_S.invoke(_S.read(_v12, "q"), "blend", [_S.read(_v12, "x"), _S.read(_v12, "y"), _S.prop(_S.read(_v12, "C"), _S.read(_v12, "c")), _S.read(_v12, "a")])
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v12, "d"), 1), func(): return _S.binary("<", _S.read(_v12, "md"), 46))):
				_S.invoke(_S.read(_v12, "q"), "light", [_S.read(_v12, "x"), _S.read(_v12, "y"), _S.prop(_S.read(_v12, "C"), 6), _S.binary("*", 0.35, _S.binary("-", 1, _S.binary("/", _S.read(_v12, "md"), 46)))])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "y", 1, "+=", true)
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "x", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "j"), _S.read(_e, "i"), _S.read(_e, "k")])
