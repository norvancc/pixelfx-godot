@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/cherry-blossoms.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "trips", _S.import_value("fx/weather/_lib.js", "trips"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "petals", _S.function_value(_e, "_f3"))
	_S.define(_e, "petal", _S.function_value(_e, "_f7"))
	_S.define(_e, "blossoms", _S.function_value(_e, "_f9"))
	_S.define(_e, "scatter", _S.function_value(_e, "_f12"))
	_S.define(_e, "meta", _S.merge([{"name": "Cherry blossoms"}, {"desc": "Pink petals flutter down on a spring breeze, tumbling in little spirals and flashing as they catch the light, with a few whole blossoms spinning among them."}, {"tags": ["weather", "cherry blossom", "sakura", "petals", "spring", "wind", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 10}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#4a1832", "#8e3460", "#d26a94", "#f2a2c0", "#ffd2e2", "#fff4f8"]}, {"seed": 12}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 10)
	_S.define(_e, "FLOOR", 1)
	_S.define(_e, "gust", _S.function_value(_e, "_f14"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_S.define(_e, "SCATTER", _S.construct(_S.read(_e, "Map"), []))
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
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "top", _S.call_value(_S.read(_e, "hex"), ["#0e0a14"]))
	_S.define(_e, "low", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "hex"), ["#1a0e1a"]), _S.prop(_S.read(_e, "C"), 0), 0.4]))
	_S.call_value(_S.read(_e, "rows"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.unary("-", 170), 9, _S.function_value(_e, "_f1")])
	_S.call_value(_S.read(_e, "scatter"), [_S.read(_e, "q"), _S.read(_e, "S"), _S.read(_e, "C")])
	_S.call_value(_S.read(_e, "petals"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), 0])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	_S.define(_e, "k", _S.binary("/", _S.binary("+", _S.read(_e, "y"), 170), 180))
	_S.invoke(_S.prop(_S.read(_e, "R"), "c"), "fill", [_S.call_value(_S.read(_e, "mix"), [_S.read(_e, "top"), _S.read(_e, "low"), _S.binary("*", _S.read(_e, "k"), _S.read(_e, "k"))])])
	_S.invoke(_S.prop(_S.read(_e, "R"), "a"), "fill", [_S.binary("+", 0.3, _S.binary("*", 0.12, _S.read(_e, "k")))])
	_S.invoke(_S.prop(_S.read(_e, "R"), "b"), "fill", [1])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.call_value(_S.read(_e, "petals"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), 1])
	_S.call_value(_S.read(_e, "blossoms"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "near", _S.arg(_args, 4))
	_S.define(_e, "n", (54 if _S.truth(_S.read(_e, "near")) else 90))
	_S.define(_e, "sd", _S.binary("+", _S.binary("*", _S.read(_e, "S"), 7), _S.read(_e, "near")))
	_S.call_value(_S.read(_e, "trips"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.read(_e, "n"), _S.read(_e, "sd"), 1, 2, _S.function_value(_e, "_f4")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "m", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "j", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "k"), _S.read(_e, "m")]))
	_S.define(_e, "R", _S.function_value(_e, "_f5"))
	_S.define(_e, "dur", _S.binary("/", _S.read(_e, "D"), _S.read(_e, "m")))
	_S.define(_e, "tf", _S.binary("*", _S.read(_e, "dur"), 0.84))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("*", _S.read(_e, "u"), _S.read(_e, "dur")), _S.read(_e, "tf")]))
	_S.define(_e, "rest", _S.binary("-", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "dur")), _S.read(_e, "tf")))
	_S.define(_e, "born", _S.binary("-", _S.read(_e, "t"), _S.binary("*", _S.read(_e, "u"), _S.read(_e, "dur"))))
	_S.define(_e, "x0", _S.binary("+", _S.unary("-", 200), _S.binary("*", _S.call_value(_S.read(_e, "R"), [1]), 330)))
	_S.define(_e, "y0", _S.unary("-", 184))
	_S.define(_e, "vy", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_e, "FLOOR"), (2 if _S.truth(_S.read(_e, "near")) else 0)), _S.read(_e, "y0")), _S.read(_e, "tf")))
	_S.define(_e, "vx", _S.binary("+", 9, _S.binary("*", _S.call_value(_S.read(_e, "R"), [2]), 10)))
	_S.define(_e, "rho", _S.binary("+", (3 if _S.truth(_S.read(_e, "near")) else 2), _S.binary("*", _S.call_value(_S.read(_e, "R"), [3]), 3)))
	_S.define(_e, "w", _S.binary("+", 2.2, _S.binary("*", _S.call_value(_S.read(_e, "R"), [4]), 2.8)))
	_S.define(_e, "ph", _S.binary("*", _S.call_value(_S.read(_e, "R"), [5]), _S.read(_e, "TAU")))
	_S.define(_e, "gk", (1 if _S.truth(_S.read(_e, "near")) else 0.6))
	_S.define(_e, "at", _S.function_value(_e, "_f6"))
	_S.define(_e, "len", _S.binary("+", (3.6 if _S.truth(_S.read(_e, "near")) else 2.6), _S.binary("*", _S.call_value(_S.read(_e, "R"), [6]), 1.1)))
	if _S.truth(_S.binary(">", _S.read(_e, "rest"), 0)):
		var _v0 = _S.scope(_e)
		var _v1 = _S.call_value(_S.read(_v0, "at"), [_S.read(_v0, "tf")])
		_S.define(_v0, "x", _S.prop(_v1, 0))
		_S.define(_v0, "y", _S.prop(_v1, 1))
		_S.define(_v0, "fade", _S.binary("-", 1, _S.binary("/", _S.read(_v0, "rest"), _S.binary("-", _S.read(_v0, "dur"), _S.read(_v0, "tf")))))
		return _S.unary("void", _S.logical("&&", _S.binary(">", _S.read(_v0, "fade"), 0.15), func(): return _S.call_value(_S.read(_v0, "petal"), [_S.read(_v0, "q"), _S.read(_v0, "x"), _S.read(_v0, "y"), _S.binary("*", _S.read(_v0, "len"), _S.binary("+", 0.35, _S.binary("*", 0.65, _S.read(_v0, "fade")))), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v0, "R"), [7]), 0.5), 1.2), 0.5, _S.read(_v0, "C"), 1])))
	var _v2 = _S.call_value(_S.read(_e, "at"), [_S.read(_e, "a")])
	_S.define(_e, "x", _S.prop(_v2, 0))
	_S.define(_e, "y", _S.prop(_v2, 1))
	_S.define(_e, "flip", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "R"), [8]), _S.read(_e, "TAU")), _S.binary("*", _S.read(_e, "a"), _S.binary("+", 3, _S.binary("*", _S.call_value(_S.read(_e, "R"), [9]), 5))))]))
	_S.define(_e, "ang", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "R"), [10]), _S.read(_e, "TAU")), _S.binary("*", _S.binary("*", _S.read(_e, "a"), _S.binary("-", _S.call_value(_S.read(_e, "R"), [11]), 0.5)), 3)))
	_S.call_value(_S.read(_e, "petal"), [_S.read(_e, "q"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "len"), _S.read(_e, "ang"), _S.read(_e, "flip"), _S.read(_e, "C"), 1])
	if _S.truth(_S.binary(">", _S.read(_e, "flip"), 0.9)):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "g", _S.binary("/", _S.binary("-", _S.read(_v3, "flip"), 0.9), 0.1))
		_S.invoke(_S.read(_v3, "q"), "px", [_S.read(_v3, "x"), _S.binary("-", _S.read(_v3, "y"), 1), _S.read(_v3, "WHITE")])
		_S.invoke(_S.read(_v3, "q"), "glow", [_S.read(_v3, "x"), _S.read(_v3, "y"), (7 if _S.truth(_S.read(_v3, "near")) else 5), _S.prop(_S.read(_v3, "C"), 4), _S.binary("*", (0.32 if _S.truth(_S.read(_v3, "near")) else 0.22), _S.read(_v3, "g"))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "sd"), _S.read(_e, "i"), _S.read(_e, "j"), _S.read(_e, "c")])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "aa", _S.arg(_args, 0))
	return [_S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.read(_e, "vx"), _S.read(_e, "aa"))), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "gust"), [_S.binary("+", _S.read(_e, "born"), _S.read(_e, "aa"))]), _S.call_value(_S.read(_e, "gust"), [_S.read(_e, "born")])), _S.read(_e, "gk"))), _S.binary("*", _S.read(_e, "rho"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("*", _S.read(_e, "w"), _S.read(_e, "aa")), _S.read(_e, "ph"))]))), _S.binary("+", _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.read(_e, "vy"), _S.read(_e, "aa"))), _S.binary("*", _S.binary("*", _S.read(_e, "rho"), 0.6), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "w"), _S.read(_e, "aa")), _S.read(_e, "ph"))])))]

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "len", _S.arg(_args, 3))
	_S.define(_e, "ang", _S.arg(_args, 4))
	_S.define(_e, "flip", _S.arg(_args, 5))
	_S.define(_e, "C", _S.arg(_args, 6))
	_S.define(_e, "a", _S.arg(_args, 7))
	_S.define(_e, "fs", _S.binary("+", 0.3, _S.binary("*", 0.7, _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "flip")]))))
	_S.define(_e, "back", _S.binary("<", _S.read(_e, "flip"), _S.unary("-", 0.2)))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]))
	_S.define(_e, "e", _S.binary("+", _S.read(_e, "len"), 1))
	_S.define(_e, "face", ([_S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3)] if _S.truth(_S.read(_e, "back")) else [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4)]))
	_S.define(_e, "tip", (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.read(_e, "back")) else _S.prop(_S.read(_e, "C"), 5)))
	_S.invoke(_S.read(_e, "q"), "shade", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "e")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "e")), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "e")), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "e")), _S.function_value(_e, "_f8")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")))
	_S.define(_e, "u", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "c")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "s"))), _S.read(_e, "len")))
	_S.define(_e, "v", _S.binary("/", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "s")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "c"))), _S.binary("*", _S.read(_e, "len"), _S.read(_e, "fs"))))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), _S.unary("-", 1)), func(): return _S.binary(">", _S.read(_e, "u"), 1))):
		return null
	_S.define(_e, "hw", _S.binary("*", _S.binary("*", 0.55, _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u")))])), _S.binary("+", 1, _S.binary("*", 0.35, _S.read(_e, "u")))))
	if _S.truth(_S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), _S.read(_e, "hw")), func(): return _S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0.7), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), 0.12)))):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.read(_e, "tip") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0.45), func(): return _S.binary("<", _S.read(_e, "v"), 0.1))) else (_S.prop(_S.read(_e, "face"), 0) if _S.truth(_S.binary("<", _S.read(_e, "u"), _S.unary("-", 0.45))) else (_S.prop(_S.read(_e, "face"), 2) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0)) else _S.prop(_S.read(_e, "face"), 1)))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "a"), "=", false)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.call_value(_S.read(_e, "trips"), [_S.read(_e, "t"), _S.read(_e, "D"), 7, _S.binary("*", _S.read(_e, "S"), 31), 1, 1, _S.function_value(_e, "_f10")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "m", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "R", _S.function_value(_e, "_f11"))
	_S.define(_e, "y", _S.binary("+", _S.unary("-", 190), _S.binary("*", _S.binary("+", _S.binary("+", _S.read(_e, "FLOOR"), 2), 190), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "u"), 0.9)]))))
	_S.define(_e, "born", _S.binary("-", _S.read(_e, "t"), _S.binary("*", _S.read(_e, "u"), _S.read(_e, "D"))))
	if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.9)):
		return null
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", _S.unary("-", 190), _S.binary("*", _S.call_value(_S.read(_e, "R"), [1]), 330)), _S.binary("*", _S.binary("*", _S.binary("*", 14, _S.read(_e, "u")), _S.read(_e, "D")), 0.1)), _S.binary("-", _S.call_value(_S.read(_e, "gust"), [_S.read(_e, "t")]), _S.call_value(_S.read(_e, "gust"), [_S.read(_e, "born")]))), _S.binary("*", 6, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "TAU")), 2), _S.binary("*", _S.call_value(_S.read(_e, "R"), [2]), 6))]))))
	_S.define(_e, "rot", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "R"), [3]), _S.read(_e, "TAU")), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "D")), _S.binary("-", _S.call_value(_S.read(_e, "R"), [4]), 0.5)), 2)))
	_S.define(_e, "r", _S.binary("+", 3.6, _S.binary("*", _S.call_value(_S.read(_e, "R"), [5]), 1.2)))
	var _v4 = _S.scope(_e)
	_S.define(_v4, "p", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "p"), 5)):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "an", _S.binary("+", _S.read(_v5, "rot"), _S.binary("/", _S.binary("*", _S.read(_v5, "p"), _S.read(_v5, "TAU")), 5)))
		_S.call_value(_S.read(_v5, "petal"), [_S.read(_v5, "q"), _S.binary("+", _S.read(_v5, "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "an")]), _S.read(_v5, "r")), 0.75)), _S.binary("+", _S.read(_v5, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "an")]), _S.read(_v5, "r")), 0.75)), _S.binary("*", _S.read(_v5, "r"), 0.7), _S.read(_v5, "an"), 1, _S.read(_v5, "C"), 1])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "p", 1, "+=", true)
	_S.invoke(_S.read(_e, "q"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.call_value(_S.read(_e, "hex"), ["#ffe08a"])])
	_S.invoke(_S.read(_e, "q"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 8, _S.prop(_S.read(_e, "C"), 4), 0.2])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "rand"), [_S.binary("*", _S.read(_e, "S"), 31), _S.read(_e, "i"), _S.read(_e, "c")])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "S", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "key", _S.binary("+", _S.read(_e, "S"), _S.invoke(_S.read(_e, "C"), "join", [])))
	_S.define(_e, "px", _S.invoke(_S.read(_e, "SCATTER"), "get", [_S.read(_e, "key")]))
	if _S.truth(_S.unary("!", _S.read(_e, "px"))):
		var _v6 = _S.scope(_e)
		_S.write(_v6, "px", [], "=", false)
		_S.define(_v6, "rec", _S.merge([{"shade": _S.function_value(_v6, "_f13")}]))
		var _v10 = _S.scope(_v6)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), 46)):
			_S.call_value(_S.read(_v10, "petal"), [_S.read(_v10, "rec"), _S.binary("+", _S.unary("-", 164), _S.binary("*", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "S"), _S.read(_v10, "i"), 71]), 328)), _S.binary("+", _S.read(_v10, "FLOOR"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "S"), _S.read(_v10, "i"), 72]), 3)]), 2)), _S.binary("+", 2.6, _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "S"), _S.read(_v10, "i"), 73])), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "S"), _S.read(_v10, "i"), 74]), 0.5), 1.2), 0.5, _S.read(_v10, "C"), 1])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
		_S.invoke(_S.read(_v6, "SCATTER"), "set", [_S.read(_v6, "key"), _S.read(_v6, "px")])
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), _S.prop(_S.read(_v11, "px"), "length"))):
		_S.invoke(_S.read(_v11, "q"), "dot", [_S.prop(_S.read(_v11, "px"), _S.read(_v11, "i")), _S.prop(_S.read(_v11, "px"), _S.binary("+", _S.read(_v11, "i"), 1)), _S.prop(_S.read(_v11, "px"), _S.binary("+", _S.read(_v11, "i"), 2)), _S.prop(_S.read(_v11, "px"), _S.binary("+", _S.read(_v11, "i"), 3))])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 4, "+=", false)
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x0", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	_S.define(_e, "x1", _S.arg(_args, 2))
	_S.define(_e, "y1", _S.arg(_args, 3))
	_S.define(_e, "fn", _S.arg(_args, 4))
	_S.define(_e, "o", _S.merge([{"c": 0}, {"a": 1}]))
	var _v7 = _S.scope(_e)
	_S.define(_v7, "y", _S.invoke(_S.read(_v7, "Math"), "floor", [_S.read(_v7, "y0")]))
	while _S.truth(_S.binary("<=", _S.read(_v7, "y"), _S.invoke(_S.read(_v7, "Math"), "ceil", [_S.read(_v7, "y1")]))):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "x", _S.invoke(_S.read(_v8, "Math"), "floor", [_S.read(_v8, "x0")]))
		while _S.truth(_S.binary("<=", _S.read(_v8, "x"), _S.invoke(_S.read(_v8, "Math"), "ceil", [_S.read(_v8, "x1")]))):
			var _v9 = _S.scope(_v8)
			_S.set_prop(_S.read(_v9, "o"), "c", 0, "=", false)
			_S.define(_v9, "c", _S.logical("||", _S.call_value(_S.read(_v9, "fn"), [_S.binary("+", _S.read(_v9, "x"), 0.5), _S.binary("+", _S.read(_v9, "y"), 0.5), _S.read(_v9, "o")]), func(): return _S.prop(_S.read(_v9, "o"), "c")))
			if _S.truth(_S.read(_v9, "c")):
				_S.invoke(_S.read(_v9, "px"), "push", [_S.binary("+", _S.read(_v9, "x"), 0.5), _S.binary("+", _S.read(_v9, "y"), 0.5), _S.read(_v9, "c"), _S.prop(_S.read(_v9, "o"), "a")])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "x", 1, "+=", true)
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "y", 1, "+=", true)
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("*", 22, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), _S.read(_e, "D")), 0.4)])), _S.binary("*", 7, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), 2), _S.read(_e, "t")), _S.read(_e, "D")), 1)])))
