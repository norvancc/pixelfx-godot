@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/aurora.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "box", _S.import_value("fx/weather/_lib.js", "box"))
	_S.define(_e, "field", _S.import_value("fx/weather/_lib.js", "field"))
	_S.define(_e, "sample", _S.import_value("fx/weather/_lib.js", "sample"))
	_S.define(_e, "bayer", _S.import_value("fx/weather/_lib.js", "bayer"))
	_S.define(_e, "blur", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "curtain", _S.function_value(_e, "_f5"))
	_S.define(_e, "stars", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Aurora"}, {"desc": "Rippling curtains of green-to-violet light over a starfield: folding hems burn bright, rays shimmer up into violet, and the whole sky slowly breathes."}, {"tags": ["weather", "aurora", "northern lights", "sky", "night", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 180]}, {"duration": 12}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#081a1e", "#0d3a36", "#13664e", "#1fa06a", "#3fd88e", "#9af7bf", "#e6fff0"]}, {"upper": ["#120b2a", "#26164f", "#41208a", "#6a34c0", "#9c62e8", "#d2b4ff", "#f6eeff"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 12)
	_S.define(_e, "W", 320)
	_S.define(_e, "H", 180)
	_S.define(_e, "BAY", _S.invoke([0, 8, 2, 10, 12, 4, 14, 6, 3, 11, 1, 9, 15, 7, 13, 5], "map", [_S.function_value(_e, "_f7")]))
	_S.define(_e, "I", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "HV", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "BL", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "TMP", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "PROF", _S.invoke(_S.read(_e, "Float32Array"), "from", [_S.merge([{"length": 201}]), _S.function_value(_e, "_f8")]))
	_S.define(_e, "cyc", _S.function_value(_e, "_f9"))
	_S.define(_e, "CURTAINS", [_S.merge([{"y": _S.unary("-", 132)}, {"slope": _S.unary("-", 0.08)}, {"amp": 8}, {"lam": 210}, {"fold": 14}, {"flam": 150}, {"height": 40}, {"k": 0.6}, {"s0": _S.unary("-", 210)}, {"s1": 210}, {"rip": 1.6}, {"c": [1, 1, 2]}, {"hue": 0.35}]), _S.merge([{"y": _S.unary("-", 88)}, {"slope": 0.22}, {"amp": 13}, {"lam": 250}, {"fold": 19}, {"flam": 165}, {"height": 82}, {"k": 1.5}, {"s0": _S.unary("-", 195)}, {"s1": 180}, {"rip": 2.4}, {"c": [1, 2, 3]}, {"hue": 0}]), _S.merge([{"y": _S.unary("-", 38)}, {"slope": _S.unary("-", 0.05)}, {"amp": 5}, {"lam": 150}, {"fold": 10}, {"flam": 110}, {"height": 20}, {"k": 0.45}, {"s0": _S.unary("-", 210)}, {"s1": 210}, {"rip": 1.4}, {"c": [2, 1, 3]}, {"hue": 0}])])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "src", _S.arg(_args, 0))
	_S.define(_e, "dst", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "n", _S.binary("+", _S.binary("*", 2, _S.read(_e, "r")), 1))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "y"), _S.read(_v0, "H"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "acc", 0)
		_S.define(_v1, "o", _S.binary("*", _S.read(_v1, "y"), _S.read(_v1, "W")))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "x", _S.unary("-", _S.read(_v2, "r")))
		while _S.truth(_S.binary("<", _S.read(_v2, "x"), _S.binary("+", _S.read(_v2, "W"), _S.read(_v2, "r")))):
			var _v3 = _S.scope(_v2)
			if _S.truth(_S.binary("<", _S.binary("+", _S.read(_v3, "x"), _S.read(_v3, "r")), _S.read(_v3, "W"))):
				_S.write(_v3, "acc", _S.prop(_S.read(_v3, "src"), _S.binary("+", _S.read(_v3, "o"), _S.invoke(_S.read(_v3, "Math"), "min", [_S.binary("-", _S.read(_v3, "W"), 1), _S.binary("+", _S.read(_v3, "x"), _S.read(_v3, "r"))]))), "+=", false)
			if _S.truth(_S.binary(">=", _S.binary("-", _S.binary("-", _S.read(_v3, "x"), _S.read(_v3, "r")), 1), 0)):
				_S.write(_v3, "acc", _S.prop(_S.read(_v3, "src"), _S.binary("-", _S.binary("-", _S.binary("+", _S.read(_v3, "o"), _S.read(_v3, "x")), _S.read(_v3, "r")), 1)), "-=", false)
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v3, "x"), 0), func(): return _S.binary("<", _S.read(_v3, "x"), _S.read(_v3, "W")))):
				_S.set_prop(_S.read(_v3, "TMP"), _S.binary("+", _S.read(_v3, "o"), _S.read(_v3, "x")), _S.binary("/", _S.read(_v3, "acc"), _S.read(_v3, "n")), "=", false)
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "x", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "x", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "x"), _S.read(_v4, "W"))):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "acc", 0)
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "y", _S.unary("-", _S.read(_v6, "r")))
		while _S.truth(_S.binary("<", _S.read(_v6, "y"), _S.binary("+", _S.read(_v6, "H"), _S.read(_v6, "r")))):
			var _v7 = _S.scope(_v6)
			if _S.truth(_S.binary("<", _S.binary("+", _S.read(_v7, "y"), _S.read(_v7, "r")), _S.read(_v7, "H"))):
				_S.write(_v7, "acc", _S.prop(_S.read(_v7, "TMP"), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "min", [_S.binary("-", _S.read(_v7, "H"), 1), _S.binary("+", _S.read(_v7, "y"), _S.read(_v7, "r"))]), _S.read(_v7, "W")), _S.read(_v7, "x"))), "+=", false)
			if _S.truth(_S.binary(">=", _S.binary("-", _S.binary("-", _S.read(_v7, "y"), _S.read(_v7, "r")), 1), 0)):
				_S.write(_v7, "acc", _S.prop(_S.read(_v7, "TMP"), _S.binary("+", _S.binary("*", _S.binary("-", _S.binary("-", _S.read(_v7, "y"), _S.read(_v7, "r")), 1), _S.read(_v7, "W")), _S.read(_v7, "x"))), "-=", false)
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v7, "y"), 0), func(): return _S.binary("<", _S.read(_v7, "y"), _S.read(_v7, "H")))):
				_S.set_prop(_S.read(_v7, "dst"), _S.binary("+", _S.binary("*", _S.read(_v7, "y"), _S.read(_v7, "W")), _S.read(_v7, "x")), _S.binary("/", _S.read(_v7, "acc"), _S.read(_v7, "n")), "=", false)
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "y", 1, "+=", true)
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "x", 1, "+=", true)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "box"), [_S.read(_e, "meta")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "U", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "upper"), 7]))
	_S.call_value(_S.read(_e, "stars"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "G"), _S.read(_e, "U")])
	_S.invoke(_S.read(_e, "I"), "fill", [0])
	_S.invoke(_S.read(_e, "HV"), "fill", [0])
	_S.define(_e, "F", _S.call_value(_S.read(_e, "field"), [_S.binary("+", _S.binary("*", _S.read(_e, "S"), 5), 1), 256, 128, [8, 16, 32]]))
	_S.define(_e, "breath", _S.binary("+", 0.75, _S.binary("*", 0.25, _S.invoke(_S.read(_e, "Math"), "sin", [_S.call_value(_S.read(_e, "cyc"), [_S.read(_e, "t"), 1, _S.unary("-", 1.2)])]))))
	_S.define(_e, "rays", [])
	_S.invoke(_S.read(_e, "CURTAINS"), "forEach", [_S.function_value(_e, "_f2")])
	_S.call_value(_S.read(_e, "blur"), [_S.read(_e, "I"), _S.read(_e, "BL"), 5])
	_S.define(_e, "GM", _S.invoke(_S.read(_e, "G"), "map", [_S.function_value(_e, "_f3")]))
	_S.call_value(_S.read(_e, "rows"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.prop(_S.read(_e, "B"), "y0"), _S.unary("-", 12), _S.function_value(_e, "_f4")])
	for _v12 in _S.array(_S.read(_e, "rays")):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "r", _v12)
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "n", _S.invoke(_S.read(_v14, "Math"), "round", [_S.prop(_S.read(_v14, "r"), "h")]))
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "j", 1)
		while _S.truth(_S.binary("<", _S.read(_v15, "j"), _S.read(_v15, "n"))):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "u", _S.binary("/", _S.read(_v16, "j"), _S.read(_v16, "n")))
			_S.invoke(_S.read(_v16, "q"), "blend", [_S.prop(_S.read(_v16, "r"), "x"), _S.binary("-", _S.prop(_S.read(_v16, "r"), "hem"), _S.read(_v16, "j")), (_S.prop(_S.read(_v16, "G"), 5) if _S.truth(_S.binary("<", _S.read(_v16, "u"), 0.35)) else (_S.call_value(_S.read(_v16, "mix"), [_S.prop(_S.read(_v16, "G"), 5), _S.prop(_S.read(_v16, "U"), 5), 0.5]) if _S.truth(_S.binary("<", _S.read(_v16, "u"), 0.6)) else _S.prop(_S.read(_v16, "U"), 5))), _S.binary("*", _S.prop(_S.read(_v16, "r"), "k"), _S.binary("**", _S.binary("-", 1, _S.read(_v16, "u")), 1.3))])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "j", 1, "+=", true)
		_S.invoke(_S.read(_v14, "q"), "px", [_S.prop(_S.read(_v14, "r"), "x"), _S.prop(_S.read(_v14, "r"), "hem"), _S.prop(_S.read(_v14, "G"), 6)])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "n", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "curtain"), [_S.read(_e, "q"), _S.read(_e, "c"), _S.read(_e, "n"), _S.read(_e, "t"), _S.read(_e, "F"), _S.read(_e, "breath"), _S.read(_e, "rays"), _S.read(_e, "G")])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "g"), _S.prop(_S.read(_e, "U"), _S.read(_e, "i")), 0.5])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	_S.define(_e, "base", _S.binary("*", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), _S.prop(_S.read(_e, "B"), "y0")), _S.read(_e, "W")))
	_S.define(_e, "by", _S.binary("<<", _S.binary("&", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), 3), 2))
	var _v8 = _S.scope(_e)
	_S.define(_v8, "xi", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "xi"), _S.read(_v8, "W"))):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "i", _S.binary("+", _S.read(_v9, "base"), _S.read(_v9, "xi")))
		_S.define(_v9, "raw", _S.prop(_S.read(_v9, "I"), _S.read(_v9, "i")))
		_S.define(_v9, "bl", _S.prop(_S.read(_v9, "BL"), _S.read(_v9, "i")))
		_S.define(_v9, "k", (_S.invoke(_S.read(_v9, "Math"), "min", [0.4, _S.binary("*", _S.read(_v9, "bl"), 0.6)]) if _S.truth(_S.binary(">", _S.read(_v9, "bl"), 0.015)) else 0))
		if _S.truth(_S.binary(">=", _S.read(_v9, "raw"), 0.03)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "e", _S.binary("/", _S.binary("*", _S.read(_v10, "raw"), 1.5), _S.binary("+", 1, _S.binary("*", _S.read(_v10, "raw"), 1.5))))
			_S.define(_v10, "v", _S.binary("/", _S.prop(_S.read(_v10, "HV"), _S.read(_v10, "i")), _S.read(_v10, "raw")))
			_S.define(_v10, "th", (_S.binary("*", _S.prop(_S.read(_v10, "BAY"), _S.binary("|", _S.read(_v10, "by"), _S.binary("&", _S.read(_v10, "xi"), 3))), 0.06) if _S.truth(_S.binary(">", _S.read(_v10, "e"), 0.45)) else 0))
			_S.define(_v10, "lv", (6 if _S.truth(_S.binary(">", _S.read(_v10, "e"), _S.binary("+", 0.86, _S.read(_v10, "th")))) else (5 if _S.truth(_S.binary(">", _S.read(_v10, "e"), _S.binary("+", 0.72, _S.read(_v10, "th")))) else (4 if _S.truth(_S.binary(">", _S.read(_v10, "e"), _S.binary("+", 0.56, _S.read(_v10, "th")))) else (3 if _S.truth(_S.binary(">", _S.read(_v10, "e"), _S.binary("+", 0.4, _S.read(_v10, "th")))) else (2 if _S.truth(_S.binary(">", _S.read(_v10, "e"), 0.24)) else 1))))))
			if _S.truth(_S.binary(">", _S.read(_v10, "v"), 0.35)):
				_S.write(_v10, "lv", _S.invoke(_S.read(_v10, "Math"), "min", [_S.read(_v10, "lv"), 5]), "=", false)
			_S.define(_v10, "c", (_S.prop(_S.read(_v10, "G"), _S.read(_v10, "lv")) if _S.truth(_S.binary("<", _S.read(_v10, "v"), 0.3)) else (_S.prop(_S.read(_v10, "GM"), _S.read(_v10, "lv")) if _S.truth(_S.binary("<", _S.read(_v10, "v"), 0.5)) else _S.prop(_S.read(_v10, "U"), _S.read(_v10, "lv")))))
			if _S.truth(_S.binary(">=", _S.read(_v10, "lv"), 3)):
				var _v11 = _S.scope(_v10)
				_S.set_prop(_S.prop(_S.read(_v11, "R"), "c"), _S.read(_v11, "xi"), _S.read(_v11, "c"), "=", false)
				_S.set_prop(_S.prop(_S.read(_v11, "R"), "a"), _S.read(_v11, "xi"), _S.call_value(_S.read(_v11, "clamp"), [_S.binary("*", _S.binary("-", _S.read(_v11, "e"), 0.3), 2.2)]), "=", false)
				_S.set_prop(_S.prop(_S.read(_v11, "R"), "b"), _S.read(_v11, "xi"), (1 if _S.truth(_S.binary("<", _S.read(_v11, "lv"), 5)) else 0), "=", false)
			_S.set_prop(_S.prop(_S.read(_v10, "R"), "l"), _S.read(_v10, "xi"), ((_S.prop(_S.read(_v10, "G"), 4) if _S.truth(_S.binary("<", _S.read(_v10, "v"), 0.4)) else _S.prop(_S.read(_v10, "U"), 4)) if _S.truth(_S.binary(">=", _S.read(_v10, "lv"), 3)) else (_S.prop(_S.read(_v10, "G"), 4) if _S.truth(_S.binary("===", _S.read(_v10, "c"), _S.prop(_S.read(_v10, "G"), _S.read(_v10, "lv")))) else (_S.prop(_S.read(_v10, "U"), 4) if _S.truth(_S.binary("===", _S.read(_v10, "c"), _S.prop(_S.read(_v10, "U"), _S.read(_v10, "lv")))) else _S.prop(_S.read(_v10, "GM"), 4)))), "=", false)
			_S.write(_v10, "k", _S.binary("*", _S.read(_v10, "e"), (0.28 if _S.truth(_S.binary(">=", _S.read(_v10, "lv"), 3)) else 0.72)), "+=", false)
		else:
			_S.set_prop(_S.prop(_S.read(_v9, "R"), "l"), _S.read(_v9, "xi"), _S.prop(_S.read(_v9, "G"), 4), "=", false)
		_S.set_prop(_S.prop(_S.read(_v9, "R"), "k"), _S.read(_v9, "xi"), _S.read(_v9, "k"), "=", false)
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "xi", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "c", _S.arg(_args, 1))
	_S.define(_e, "n", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "F", _S.arg(_args, 4))
	_S.define(_e, "breath", _S.arg(_args, 5))
	_S.define(_e, "rays", _S.arg(_args, 6))
	_S.define(_e, "G", _S.arg(_args, 7))
	_S.define(_e, "X0", _S.unary("-", 160))
	_S.define(_e, "Y0", _S.unary("-", 180))
	_S.define(_e, "fast", _S.binary("/", _S.binary("*", _S.binary("*", 256, 2), _S.read(_e, "t")), _S.read(_e, "D")))
	_S.define(_e, "slow", _S.binary("/", _S.binary("*", 256, _S.read(_e, "t")), _S.read(_e, "D")))
	_S.define(_e, "p1", 0)
	_S.define(_e, "p2", 0)
	_S.define(_e, "lastX", _S.unary("-", 999))
	var _v17 = _S.scope(_e)
	_S.define(_v17, "s", _S.prop(_S.read(_v17, "c"), "s0"))
	while _S.truth(_S.binary("<", _S.read(_v17, "s"), _S.prop(_S.read(_v17, "c"), "s1"))):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "x", _S.binary("+", _S.binary("+", _S.read(_v18, "s"), _S.binary("*", _S.prop(_S.read(_v18, "c"), "fold"), _S.invoke(_S.read(_v18, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.read(_v18, "TAU"), _S.read(_v18, "s")), _S.prop(_S.read(_v18, "c"), "flam")), _S.call_value(_S.read(_v18, "cyc"), [_S.read(_v18, "t"), _S.prop(_S.prop(_S.read(_v18, "c"), "c"), 0), _S.binary("*", _S.read(_v18, "n"), 2)]))]))), _S.binary("*", 5, _S.invoke(_S.read(_v18, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.read(_v18, "TAU"), _S.read(_v18, "s")), 64), _S.call_value(_S.read(_v18, "cyc"), [_S.read(_v18, "t"), _S.prop(_S.prop(_S.read(_v18, "c"), "c"), 2), _S.read(_v18, "n")]))]))))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v18, "x"), _S.binary("-", _S.read(_v18, "X0"), 2)), func(): return _S.binary(">=", _S.read(_v18, "x"), _S.binary("+", _S.binary("+", _S.read(_v18, "X0"), _S.read(_v18, "W")), 1)))):
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "s", 0.5, "+=", false)
			continue
		_S.define(_v18, "hem", _S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v18, "c"), "y"), _S.binary("*", _S.prop(_S.read(_v18, "c"), "slope"), _S.read(_v18, "s"))), _S.binary("*", _S.prop(_S.read(_v18, "c"), "amp"), _S.invoke(_S.read(_v18, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.read(_v18, "TAU"), _S.read(_v18, "s")), _S.prop(_S.read(_v18, "c"), "lam")), _S.call_value(_S.read(_v18, "cyc"), [_S.read(_v18, "t"), _S.prop(_S.prop(_S.read(_v18, "c"), "c"), 1), _S.binary("*", _S.read(_v18, "n"), 1.7)]))]))), _S.binary("*", _S.prop(_S.read(_v18, "c"), "rip"), _S.invoke(_S.read(_v18, "Math"), "sin", [_S.binary("-", _S.binary("/", _S.binary("*", _S.read(_v18, "TAU"), _S.read(_v18, "s")), 23), _S.call_value(_S.read(_v18, "cyc"), [_S.read(_v18, "t"), 7, _S.read(_v18, "n")]))]))))
		_S.define(_v18, "env", _S.binary("*", _S.call_value(_S.read(_v18, "smooth"), [_S.prop(_S.read(_v18, "c"), "s0"), _S.binary("+", _S.prop(_S.read(_v18, "c"), "s0"), 60), _S.read(_v18, "s")]), _S.binary("-", 1, _S.call_value(_S.read(_v18, "smooth"), [_S.binary("-", _S.prop(_S.read(_v18, "c"), "s1"), 70), _S.prop(_S.read(_v18, "c"), "s1"), _S.read(_v18, "s")]))))
		_S.define(_v18, "r1", _S.call_value(_S.read(_v18, "clamp"), [_S.binary("*", _S.binary("-", _S.call_value(_S.read(_v18, "sample"), [_S.read(_v18, "F"), _S.binary("+", _S.binary("-", _S.binary("*", _S.read(_v18, "s"), 5), _S.read(_v18, "fast")), _S.binary("*", _S.read(_v18, "n"), 40)), _S.binary("+", 10, _S.binary("*", _S.read(_v18, "n"), 30))]), 0.38), 3.2)]))
		_S.define(_v18, "r2", _S.call_value(_S.read(_v18, "clamp"), [_S.binary("*", _S.binary("-", _S.call_value(_S.read(_v18, "sample"), [_S.read(_v18, "F"), _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v18, "s"), 4.3), _S.binary("*", _S.read(_v18, "fast"), 0.7)), _S.binary("*", _S.read(_v18, "n"), 90)), _S.binary("+", 50, _S.binary("*", _S.read(_v18, "n"), 13))]), 0.35), 3)]))
		_S.define(_v18, "patch", _S.call_value(_S.read(_v18, "sample"), [_S.read(_v18, "F"), _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v18, "s"), 0.7), _S.read(_v18, "slow")), _S.binary("*", _S.read(_v18, "n"), 17)), _S.binary("+", 80, _S.binary("*", _S.read(_v18, "n"), 9))]))
		_S.define(_v18, "k", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v18, "c"), "k"), _S.read(_v18, "env")), _S.read(_v18, "breath")), _S.binary("+", 0.2, _S.binary("*", 0.8, _S.read(_v18, "r1")))), _S.binary("+", 0.3, _S.binary("*", 1.4, _S.invoke(_S.read(_v18, "Math"), "max", [0, _S.binary("-", _S.read(_v18, "patch"), 0.3)])))))
		if _S.truth(_S.binary("<", _S.read(_v18, "k"), 0.01)):
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "s", 0.5, "+=", false)
			continue
		_S.define(_v18, "h", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v18, "c"), "height"), _S.binary("+", 0.45, _S.binary("*", 0.75, _S.read(_v18, "r2")))), _S.binary("+", 0.75, _S.binary("*", 0.5, _S.read(_v18, "patch")))))
		_S.define(_v18, "xi", _S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("-", _S.read(_v18, "x"), _S.read(_v18, "X0"))]))
		_S.define(_v18, "fr", _S.binary("-", _S.binary("-", _S.read(_v18, "x"), _S.read(_v18, "X0")), _S.read(_v18, "xi")))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v18, "p1"), 0.75), func(): return _S.binary(">=", _S.read(_v18, "p1"), _S.read(_v18, "p2"))), func(): return _S.binary(">=", _S.read(_v18, "p1"), _S.read(_v18, "r1"))), func(): return _S.binary(">", _S.invoke(_S.read(_v18, "Math"), "abs", [_S.binary("-", _S.read(_v18, "x"), _S.read(_v18, "lastX"))]), 2)), func(): return _S.binary(">", _S.read(_v18, "k"), 0.25))):
			_S.last([_S.invoke(_S.read(_v18, "rays"), "push", [_S.merge([{"x": _S.read(_v18, "x")}, {"hem": _S.binary("-", _S.read(_v18, "hem"), 1)}, {"h": _S.binary("*", _S.read(_v18, "h"), 0.9)}, {"k": _S.invoke(_S.read(_v18, "Math"), "min", [0.85, _S.binary("*", _S.read(_v18, "k"), 0.9)])}])]), _S.write(_v18, "lastX", _S.read(_v18, "x"), "=", false)])
		_S.write(_v18, "p2", _S.read(_v18, "p1"), "=", false)
		_S.write(_v18, "p1", _S.read(_v18, "r1"), "=", false)
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v18, "xi"), _S.unary("-", 1)), func(): return _S.binary(">=", _S.read(_v18, "xi"), _S.read(_v18, "W")))):
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "s", 0.5, "+=", false)
			continue
		_S.define(_v18, "top", _S.invoke(_S.read(_v18, "Math"), "max", [0, _S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_v18, "hem"), _S.read(_v18, "h")), _S.read(_v18, "Y0"))])]))
		_S.define(_v18, "bot", _S.invoke(_S.read(_v18, "Math"), "min", [_S.binary("-", _S.read(_v18, "H"), 1), _S.binary("+", _S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("-", _S.read(_v18, "hem"), _S.read(_v18, "Y0"))]), 3)]))
		_S.define(_v18, "inv", _S.binary("/", 1, _S.read(_v18, "h")))
		_S.define(_v18, "k0", _S.binary("*", _S.binary("*", _S.read(_v18, "k"), 0.5), _S.binary("-", 1, _S.read(_v18, "fr"))))
		_S.define(_v18, "k1", _S.binary("*", _S.binary("*", _S.read(_v18, "k"), 0.5), _S.read(_v18, "fr")))
		_S.define(_v18, "v", _S.binary("*", _S.binary("-", _S.binary("-", _S.binary("-", _S.read(_v18, "hem"), _S.read(_v18, "Y0")), 0.5), _S.read(_v18, "top")), _S.read(_v18, "inv")))
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "yi", _S.read(_v19, "top"))
		while _S.truth(_S.binary("<=", _S.read(_v19, "yi"), _S.read(_v19, "bot"))):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "pr", (_S.prop(_S.read(_v20, "PROF"), _S.invoke(_S.read(_v20, "Math"), "min", [200, _S.binary("|", _S.binary("*", _S.read(_v20, "v"), 200), 0)])) if _S.truth(_S.binary(">=", _S.read(_v20, "v"), 0)) else _S.invoke(_S.read(_v20, "Math"), "max", [0, _S.binary("+", 0.45, _S.binary("*", _S.binary("*", _S.read(_v20, "v"), _S.read(_v20, "h")), 0.16))])))
			_S.define(_v20, "o", _S.binary("+", _S.binary("*", _S.read(_v20, "yi"), _S.read(_v20, "W")), _S.read(_v20, "xi")))
			_S.define(_v20, "hv", (0 if _S.truth(_S.binary("<", _S.binary("+", _S.read(_v20, "v"), _S.prop(_S.read(_v20, "c"), "hue")), 0)) else (1 if _S.truth(_S.binary(">", _S.binary("+", _S.read(_v20, "v"), _S.prop(_S.read(_v20, "c"), "hue")), 1)) else _S.binary("+", _S.read(_v20, "v"), _S.prop(_S.read(_v20, "c"), "hue")))))
			if _S.truth(_S.binary("<=", _S.read(_v20, "pr"), 0)):
				_v19 = _S.iteration(_v19)
				_S.last([_S.write(_v19, "yi", 1, "+=", true), _S.write(_v19, "v", _S.read(_v19, "inv"), "-=", false)])
				continue
			if _S.truth(_S.binary(">=", _S.read(_v20, "xi"), 0)):
				_S.last([_S.set_prop(_S.read(_v20, "I"), _S.read(_v20, "o"), _S.binary("*", _S.read(_v20, "k0"), _S.read(_v20, "pr")), "+=", false), _S.set_prop(_S.read(_v20, "HV"), _S.read(_v20, "o"), _S.binary("*", _S.binary("*", _S.read(_v20, "k0"), _S.read(_v20, "pr")), _S.read(_v20, "hv")), "+=", false)])
			if _S.truth(_S.binary("<", _S.binary("+", _S.read(_v20, "xi"), 1), _S.read(_v20, "W"))):
				_S.last([_S.set_prop(_S.read(_v20, "I"), _S.binary("+", _S.read(_v20, "o"), 1), _S.binary("*", _S.read(_v20, "k1"), _S.read(_v20, "pr")), "+=", false), _S.set_prop(_S.read(_v20, "HV"), _S.binary("+", _S.read(_v20, "o"), 1), _S.binary("*", _S.binary("*", _S.read(_v20, "k1"), _S.read(_v20, "pr")), _S.read(_v20, "hv")), "+=", false)])
			_v19 = _S.iteration(_v19)
			_S.last([_S.write(_v19, "yi", 1, "+=", true), _S.write(_v19, "v", _S.read(_v19, "inv"), "-=", false)])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "s", 0.5, "+=", false)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "G", _S.arg(_args, 3))
	_S.define(_e, "U", _S.arg(_args, 4))
	var _v21 = _S.scope(_e)
	_S.define(_v21, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v21, "i"), 150)):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "x", _S.binary("+", _S.unary("-", 160), _S.binary("*", _S.call_value(_S.read(_v22, "rand"), [_S.read(_v22, "S"), _S.read(_v22, "i"), 1]), 320)))
		_S.define(_v22, "y", _S.binary("+", _S.unary("-", 180), _S.binary("*", _S.call_value(_S.read(_v22, "rand"), [_S.read(_v22, "S"), _S.read(_v22, "i"), 2]), 175)))
		_S.define(_v22, "r", _S.call_value(_S.read(_v22, "rand"), [_S.read(_v22, "S"), _S.read(_v22, "i"), 3]))
		_S.define(_v22, "c", _S.binary("+", 1, _S.invoke(_S.read(_v22, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v22, "rand"), [_S.read(_v22, "S"), _S.read(_v22, "i"), 4]), 4)])))
		_S.define(_v22, "tw", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v22, "Math"), "sin", [_S.call_value(_S.read(_v22, "cyc"), [_S.read(_v22, "t"), _S.read(_v22, "c"), _S.binary("*", _S.call_value(_S.read(_v22, "rand"), [_S.read(_v22, "S"), _S.read(_v22, "i"), 5]), _S.read(_v22, "TAU"))])]))))
		_S.define(_v22, "col", (_S.call_value(_S.read(_v22, "mix"), [_S.prop(_S.read(_v22, "U"), 3), _S.read(_v22, "WHITE"), 0.2]) if _S.truth(_S.binary("<", _S.read(_v22, "r"), 0.6)) else (_S.call_value(_S.read(_v22, "mix"), [_S.prop(_S.read(_v22, "U"), 5), _S.read(_v22, "WHITE"), 0.5]) if _S.truth(_S.binary("<", _S.read(_v22, "r"), 0.9)) else _S.read(_v22, "WHITE"))))
		if _S.truth(_S.binary("<", _S.read(_v22, "r"), 0.6)):
			_S.invoke(_S.read(_v22, "q"), "dot", [_S.read(_v22, "x"), _S.read(_v22, "y"), _S.read(_v22, "col"), _S.binary("+", 0.35, _S.binary("*", 0.5, _S.read(_v22, "tw")))])
		else:
			if _S.truth(_S.binary("<", _S.read(_v22, "r"), 0.95)):
				var _v23 = _S.scope(_v22)
				_S.invoke(_S.read(_v23, "q"), "px", [_S.read(_v23, "x"), _S.read(_v23, "y"), _S.read(_v23, "col")])
				_S.invoke(_S.read(_v23, "q"), "glow", [_S.binary("+", _S.read(_v23, "x"), 0.5), _S.binary("+", _S.read(_v23, "y"), 0.5), 3, _S.prop(_S.read(_v23, "U"), 5), _S.binary("*", 0.25, _S.read(_v23, "tw"))])
			else:
				_S.call_value(_S.read(_v22, "sparkle"), [_S.read(_v22, "q"), _S.read(_v22, "x"), _S.read(_v22, "y"), _S.binary("+", 1, _S.invoke(_S.read(_v22, "Math"), "round", [_S.binary("*", _S.read(_v22, "tw"), 2)])), _S.call_value(_S.read(_v22, "mix"), [_S.prop(_S.read(_v22, "U"), 5), _S.read(_v22, "WHITE"), 0.6]), _S.prop(_S.read(_v22, "U"), 4), _S.binary("*", 0.35, _S.read(_v22, "tw"))])
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "i", 1, "+=", true)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return _S.binary("/", _S.binary("+", _S.read(_e, "v"), 0.5), 16)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "v", _S.binary("/", _S.read(_e, "i"), 200))
	return (2.6 if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.035)) else (_S.binary("-", 1.15, _S.read(_e, "v")) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.22)) else _S.binary("*", _S.binary("**", _S.binary("-", 1, _S.read(_e, "v")), 1.5), 0.9)))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "c", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "c")), _S.read(_e, "t")), _S.read(_e, "D")), _S.read(_e, "ph"))
