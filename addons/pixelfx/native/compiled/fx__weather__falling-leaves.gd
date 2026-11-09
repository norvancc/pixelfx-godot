@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/falling-leaves.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "trips", _S.import_value("fx/weather/_lib.js", "trips"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "leaves", _S.function_value(_e, "_f3"))
	_S.define(_e, "leaf", _S.function_value(_e, "_f8"))
	_S.define(_e, "litter", _S.function_value(_e, "_f10"))
	_S.define(_e, "meta", _S.merge([{"name": "Falling leaves"}, {"desc": "Autumn leaves swing down through the air, tilting and flipping to show their pale backs, ride a gust, land flat in the litter and fade."}, {"tags": ["weather", "leaves", "autumn", "fall", "wind", "nature", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 10}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#4a1d0c", "#8a3a14", "#c8621e", "#f0982e", "#ffcf72", "#fff0c4"]}, {"reds": ["#40101a", "#7c1c22", "#b8302a", "#e85a3c", "#ff9a72", "#ffd8c4"]}, {"golds": ["#3e300c", "#7a5c14", "#b8901e", "#e8c23a", "#fff09a", "#fffbe0"]}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 10)
	_S.define(_e, "FLOOR", 1)
	_S.define(_e, "gust", _S.function_value(_e, "_f13"))
	_S.define(_e, "Hc", _S.function_value(_e, "_f14"))
	_S.define(_e, "SHAPES", [_S.function_value(_e, "_f15"), _S.function_value(_e, "_f16"), _S.function_value(_e, "_f17")])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_S.define(_e, "ramps", _S.function_value(_e, "_f18"))
	_S.define(_e, "LITTER", _S.construct(_S.read(_e, "Map"), []))
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
	_S.define(_e, "R3", _S.call_value(_S.read(_e, "ramps"), [_S.read(_e, "o")]))
	_S.define(_e, "C", _S.prop(_S.read(_e, "R3"), 0))
	_S.define(_e, "top", _S.call_value(_S.read(_e, "hex"), ["#0e0a12"]))
	_S.define(_e, "low", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "hex"), ["#140c14"]), _S.prop(_S.read(_e, "C"), 0), 0.3]))
	_S.call_value(_S.read(_e, "rows"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.unary("-", 170), 9, _S.function_value(_e, "_f1")])
	_S.call_value(_S.read(_e, "litter"), [_S.read(_e, "q"), _S.read(_e, "S"), _S.read(_e, "R3")])
	_S.call_value(_S.read(_e, "leaves"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "R3"), false])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	_S.define(_e, "k", _S.binary("/", _S.binary("+", _S.read(_e, "y"), 170), 180))
	_S.define(_e, "c", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "top"), _S.read(_e, "low"), _S.binary("*", _S.read(_e, "k"), _S.read(_e, "k"))]))
	_S.invoke(_S.prop(_S.read(_e, "R"), "c"), "fill", [_S.read(_e, "c")])
	_S.invoke(_S.prop(_S.read(_e, "R"), "a"), "fill", [_S.binary("+", 0.32, _S.binary("*", 0.1, _S.read(_e, "k")))])
	_S.invoke(_S.prop(_S.read(_e, "R"), "b"), "fill", [1])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.call_value(_S.read(_e, "leaves"), [_S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed"), _S.call_value(_S.read(_e, "ramps"), [_S.read(_e, "o")]), true])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "R3", _S.arg(_args, 3))
	_S.define(_e, "front", _S.arg(_args, 4))
	_S.call_value(_S.read(_e, "trips"), [_S.read(_e, "t"), _S.read(_e, "D"), 62, _S.binary("*", _S.read(_e, "S"), 19), 2, 3, _S.function_value(_e, "_f4")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "m", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "j", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "k"), _S.read(_e, "m")]))
	_S.define(_e, "R", _S.function_value(_e, "_f5"))
	_S.define(_e, "near", _S.binary("<", _S.call_value(_S.read(_e, "R"), [1]), 0.35))
	if _S.truth(_S.binary("!==", _S.read(_e, "near"), _S.read(_e, "front"))):
		return null
	_S.define(_e, "dur", _S.binary("/", _S.read(_e, "D"), _S.read(_e, "m")))
	_S.define(_e, "air", 0.72)
	_S.define(_e, "tf", _S.binary("*", _S.read(_e, "dur"), _S.read(_e, "air")))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("*", _S.read(_e, "u"), _S.read(_e, "dur")), _S.read(_e, "tf")]))
	_S.define(_e, "rest", _S.binary("-", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "dur")), _S.read(_e, "tf")))
	_S.define(_e, "w", _S.binary("+", 1.7, _S.binary("*", _S.call_value(_S.read(_e, "R"), [2]), 1.2)))
	_S.define(_e, "ph0", _S.binary("*", _S.call_value(_S.read(_e, "R"), [3]), _S.read(_e, "TAU")))
	_S.define(_e, "amp", _S.binary("+", (14 if _S.truth(_S.read(_e, "near")) else 8), _S.binary("*", _S.call_value(_S.read(_e, "R"), [4]), 10)))
	_S.define(_e, "x0", _S.binary("+", _S.unary("-", 180), _S.binary("*", _S.call_value(_S.read(_e, "R"), [5]), 340)))
	_S.define(_e, "y0", _S.unary("-", 186))
	_S.define(_e, "path", _S.function_value(_e, "_f6"))
	_S.define(_e, "vy", _S.binary("/", _S.binary("-", _S.read(_e, "FLOOR"), _S.read(_e, "y0")), _S.call_value(_S.read(_e, "path"), [_S.read(_e, "tf")])))
	_S.define(_e, "born", _S.binary("-", _S.read(_e, "t"), _S.binary("*", _S.read(_e, "u"), _S.read(_e, "dur"))))
	_S.define(_e, "xAt", _S.function_value(_e, "_f7"))
	_S.define(_e, "size", _S.binary("+", (5.8 if _S.truth(_S.read(_e, "near")) else 4.2), _S.binary("*", _S.call_value(_S.read(_e, "R"), [6]), 1.6)))
	_S.define(_e, "shape", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_e, "R"), [7]), 3)]))
	_S.define(_e, "col", _S.prop(_S.read(_e, "R3"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_e, "R"), [8]), 3)])))
	if _S.truth(_S.binary(">", _S.read(_e, "rest"), 0)):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "fade", _S.binary("-", 1, _S.binary("/", _S.read(_v0, "rest"), _S.binary("-", _S.read(_v0, "dur"), _S.read(_v0, "tf")))))
		_S.call_value(_S.read(_v0, "leaf"), [_S.read(_v0, "q"), _S.call_value(_S.read(_v0, "xAt"), [_S.read(_v0, "tf")]), _S.binary("-", _S.read(_v0, "FLOOR"), 1), _S.read(_v0, "size"), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v0, "R"), [9]), 0.5), 0.5), 0.42, _S.read(_v0, "shape"), _S.read(_v0, "col"), _S.read(_v0, "fade")])
		return null
	_S.define(_e, "x", _S.call_value(_S.read(_e, "xAt"), [_S.read(_e, "a")]))
	_S.define(_e, "y", _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.read(_e, "vy"), _S.call_value(_S.read(_e, "path"), [_S.read(_e, "a")]))))
	_S.define(_e, "tilt", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("*", _S.read(_e, "w"), _S.read(_e, "a")), _S.read(_e, "ph0"))]), 0.75), (0 if _S.truth(_S.read(_e, "near")) else 0.3)))
	_S.define(_e, "flip", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "R"), [10]), _S.read(_e, "TAU")), _S.binary("*", _S.read(_e, "a"), (5 if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "R"), [11]), 0.3)) else 1.2)))]))
	_S.call_value(_S.read(_e, "leaf"), [_S.read(_e, "q"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "size"), _S.read(_e, "tilt"), _S.read(_e, "flip"), _S.read(_e, "shape"), _S.read(_e, "col"), 1])
	if _S.truth(_S.binary(">", _S.read(_e, "flip"), 0.86)):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "k", _S.binary("/", _S.binary("-", _S.read(_v1, "flip"), 0.86), 0.14))
		_S.define(_v1, "hx", _S.binary("-", _S.read(_v1, "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "tilt")]), _S.read(_v1, "size")), 0.3)))
		_S.define(_v1, "hy", _S.binary("-", _S.binary("-", _S.read(_v1, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "tilt")]), _S.read(_v1, "size")), 0.3)), 1))
		_S.invoke(_S.read(_v1, "q"), "px", [_S.read(_v1, "hx"), _S.read(_v1, "hy"), _S.prop(_S.read(_v1, "col"), 5)])
		_S.invoke(_S.read(_v1, "q"), "glow", [_S.read(_v1, "hx"), _S.read(_v1, "hy"), _S.binary("+", 5, _S.binary("*", _S.read(_v1, "size"), 0.5)), _S.prop(_S.read(_v1, "col"), 4), _S.binary("*", 0.22, _S.read(_v1, "k"))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "n", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "rand"), [_S.binary("*", _S.read(_e, "S"), 19), _S.read(_e, "i"), _S.read(_e, "j"), _S.read(_e, "n")])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "aa", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("*", 0.45, _S.read(_e, "aa")), _S.binary("/", _S.binary("*", 0.9, _S.binary("-", _S.call_value(_S.read(_e, "Hc"), [_S.binary("+", _S.binary("*", _S.read(_e, "w"), _S.read(_e, "aa")), _S.read(_e, "ph0"))]), _S.call_value(_S.read(_e, "Hc"), [_S.read(_e, "ph0")]))), _S.read(_e, "w")))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "aa", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", 7, _S.read(_e, "aa"))), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "w"), _S.read(_e, "aa")), _S.read(_e, "ph0"))]), _S.read(_e, "amp"))), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "gust"), [_S.binary("+", _S.read(_e, "born"), _S.read(_e, "aa"))]), _S.call_value(_S.read(_e, "gust"), [_S.read(_e, "born")])), (1 if _S.truth(_S.read(_e, "near")) else 0.7)))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "size", _S.arg(_args, 3))
	_S.define(_e, "ang", _S.arg(_args, 4))
	_S.define(_e, "flip", _S.arg(_args, 5))
	_S.define(_e, "shape", _S.arg(_args, 6))
	_S.define(_e, "col", _S.arg(_args, 7))
	_S.define(_e, "a", _S.arg(_args, 8))
	_S.define(_e, "back", _S.binary("<", _S.read(_e, "flip"), _S.unary("-", 0.25)))
	_S.define(_e, "fs", _S.binary("+", 0.35, _S.binary("*", 0.65, _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "flip")]))))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]))
	_S.define(_e, "L", _S.read(_e, "size"))
	_S.define(_e, "Wd", _S.binary("*", _S.read(_e, "size"), 0.9))
	_S.define(_e, "ext", _S.binary("+", _S.read(_e, "L"), 1.5))
	_S.define(_e, "shapeFn", _S.prop(_S.read(_e, "SHAPES"), _S.read(_e, "shape")))
	_S.define(_e, "face", ([_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "col"), 1), _S.call_value(_S.read(_e, "hex"), ["#9c8a78"]), 0.2]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "col"), 2), _S.call_value(_S.read(_e, "hex"), ["#c8b49c"]), 0.22]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "col"), 3), _S.call_value(_S.read(_e, "hex"), ["#e0d0b8"]), 0.22])] if _S.truth(_S.read(_e, "back")) else [_S.prop(_S.read(_e, "col"), 2), _S.prop(_S.read(_e, "col"), 3), _S.prop(_S.read(_e, "col"), 4)]))
	_S.define(_e, "rim", _S.prop(_S.read(_e, "col"), 0))
	_S.define(_e, "vein", (_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "col"), 2), _S.call_value(_S.read(_e, "hex"), ["#e8dcc8"]), 0.5]) if _S.truth(_S.read(_e, "back")) else _S.prop(_S.read(_e, "col"), 1)))
	_S.invoke(_S.read(_e, "q"), "shade", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "ext")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ext")), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "ext")), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "ext")), _S.function_value(_e, "_f9")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")))
	_S.define(_e, "lu", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "c")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "s"))), _S.read(_e, "L")))
	_S.define(_e, "lv", _S.binary("/", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "s")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "c"))), _S.binary("*", _S.read(_e, "Wd"), _S.read(_e, "fs"))))
	_S.define(_e, "d", _S.call_value(_S.read(_e, "shapeFn"), [_S.read(_e, "lu"), _S.read(_e, "lv")]))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "lu"), _S.unary("-", 1.25)), func(): return _S.binary(">", _S.read(_e, "lu"), 1.1))):
		return null
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "lu"), _S.unary("-", 0.92)), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("*", _S.binary("*", _S.read(_e, "lv"), _S.read(_e, "Wd")), _S.read(_e, "fs"))]), 0.5))):
		return _S.unary("void", _S.last([_S.set_prop(_S.read(_e, "out"), "c", _S.read(_e, "rim"), "=", false), _S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "a"), "=", false)]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1.32)):
		return null
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "a"), "=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		_S.set_prop(_S.read(_e, "out"), "c", _S.read(_e, "rim"), "=", false)
	else:
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("*", _S.binary("*", _S.read(_e, "lv"), _S.read(_e, "Wd")), _S.read(_e, "fs"))]), 0.45), func(): return _S.binary(">", _S.read(_e, "lu"), _S.unary("-", 0.9))), func(): return _S.binary("<", _S.read(_e, "lu"), 0.75))):
			_S.set_prop(_S.read(_e, "out"), "c", _S.read(_e, "vein"), "=", false)
		else:
			_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "face"), 2) if _S.truth(_S.binary("<", _S.read(_e, "lv"), _S.unary("-", 0.15))) else (_S.prop(_S.read(_e, "face"), 1) if _S.truth(_S.binary("<", _S.read(_e, "lv"), 0.35)) else _S.prop(_S.read(_e, "face"), 0))), "=", false)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "S", _S.arg(_args, 1))
	_S.define(_e, "R3", _S.arg(_args, 2))
	_S.define(_e, "key", _S.binary("+", _S.read(_e, "S"), _S.invoke(_S.invoke(_S.read(_e, "R3"), "flat", []), "join", [])))
	_S.define(_e, "px", _S.invoke(_S.read(_e, "LITTER"), "get", [_S.read(_e, "key")]))
	if _S.truth(_S.unary("!", _S.read(_e, "px"))):
		var _v2 = _S.scope(_e)
		_S.write(_v2, "px", [], "=", false)
		_S.define(_v2, "rec", _S.merge([{"shade": _S.function_value(_v2, "_f11")}]))
		var _v6 = _S.scope(_v2)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 64)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "x", _S.binary("+", _S.unary("-", 164), _S.binary("*", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "S"), _S.read(_v7, "i"), 91]), 328)))
			_S.define(_v7, "y", _S.binary("+", _S.binary("-", _S.read(_v7, "FLOOR"), 2), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "S"), _S.read(_v7, "i"), 92]), 4)]), 2)))
			_S.define(_v7, "col", _S.prop(_S.read(_v7, "R3"), _S.invoke(_S.read(_v7, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "S"), _S.read(_v7, "i"), 93]), 3)])))
			_S.call_value(_S.read(_v7, "leaf"), [_S.read(_v7, "rec"), _S.read(_v7, "x"), _S.read(_v7, "y"), _S.binary("+", 3.6, _S.binary("*", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "S"), _S.read(_v7, "i"), 94]), 1.8)), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "S"), _S.read(_v7, "i"), 95]), 0.5), 0.7), _S.binary("+", 0.45, _S.binary("*", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "S"), _S.read(_v7, "i"), 96]), 0.25)), _S.invoke(_S.read(_v7, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "S"), _S.read(_v7, "i"), 97]), 3)]), _S.invoke(_S.read(_v7, "col"), "map", [_S.function_value(_v7, "_f12")]), 1])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
		_S.invoke(_S.read(_v2, "LITTER"), "set", [_S.read(_v2, "key"), _S.read(_v2, "px")])
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), _S.prop(_S.read(_v8, "px"), "length"))):
		_S.invoke(_S.read(_v8, "q"), "dot", [_S.prop(_S.read(_v8, "px"), _S.read(_v8, "i")), _S.prop(_S.read(_v8, "px"), _S.binary("+", _S.read(_v8, "i"), 1)), _S.prop(_S.read(_v8, "px"), _S.binary("+", _S.read(_v8, "i"), 2)), _S.prop(_S.read(_v8, "px"), _S.binary("+", _S.read(_v8, "i"), 3))])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 4, "+=", false)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x0", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	_S.define(_e, "x1", _S.arg(_args, 2))
	_S.define(_e, "y1", _S.arg(_args, 3))
	_S.define(_e, "fn", _S.arg(_args, 4))
	_S.define(_e, "o", _S.merge([{"c": 0}, {"a": 1}]))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "y", _S.invoke(_S.read(_v3, "Math"), "floor", [_S.read(_v3, "y0")]))
	while _S.truth(_S.binary("<=", _S.read(_v3, "y"), _S.invoke(_S.read(_v3, "Math"), "ceil", [_S.read(_v3, "y1")]))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "x", _S.invoke(_S.read(_v4, "Math"), "floor", [_S.read(_v4, "x0")]))
		while _S.truth(_S.binary("<=", _S.read(_v4, "x"), _S.invoke(_S.read(_v4, "Math"), "ceil", [_S.read(_v4, "x1")]))):
			var _v5 = _S.scope(_v4)
			_S.set_prop(_S.read(_v5, "o"), "c", 0, "=", false)
			_S.set_prop(_S.read(_v5, "o"), "a", 1, "=", false)
			_S.define(_v5, "c", _S.logical("||", _S.call_value(_S.read(_v5, "fn"), [_S.binary("+", _S.read(_v5, "x"), 0.5), _S.binary("+", _S.read(_v5, "y"), 0.5), _S.read(_v5, "o")]), func(): return _S.prop(_S.read(_v5, "o"), "c")))
			if _S.truth(_S.read(_v5, "c")):
				_S.invoke(_S.read(_v5, "px"), "push", [_S.binary("+", _S.read(_v5, "x"), 0.5), _S.binary("+", _S.read(_v5, "y"), 0.5), _S.read(_v5, "c"), _S.prop(_S.read(_v5, "o"), "a")])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "x", 1, "+=", true)
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "y", 1, "+=", true)
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.prop(_S.read(_e, "col"), 0), 0.12])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("*", 16, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), _S.read(_e, "D")), 1.2)])), _S.binary("*", 5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), 3), _S.read(_e, "t")), _S.read(_e, "D"))])))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "th", _S.arg(_args, 0))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.binary("+", _S.read(_e, "th"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)), _S.prop(_S.read(_e, "Math"), "PI"))]))
	return _S.binary("+", _S.binary("+", _S.binary("*", 2, _S.read(_e, "k")), 1), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.read(_e, "th"), _S.binary("*", _S.read(_e, "k"), _S.prop(_S.read(_e, "Math"), "PI")))]))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return (9 if _S.truth(_S.binary(">=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "u")]), 1)) else _S.binary("/", _S.binary("*", _S.read(_e, "v"), _S.read(_e, "v")), _S.binary("*", _S.binary("*", 0.36, _S.binary("-", 1, _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u")))), _S.binary("-", 1.15, _S.binary("*", 0.3, _S.read(_e, "u"))))))

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	_S.define(_e, "r", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "u"), _S.binary("*", _S.read(_e, "v"), 1.1)]))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "v"), _S.read(_e, "u")]))
	return _S.binary("/", _S.read(_e, "r"), _S.binary("+", 0.62, _S.binary("*", 0.38, _S.binary("**", _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", 2.5, _S.read(_e, "a"))])]), 1.5))))

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return (9 if _S.truth(_S.binary(">=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "u")]), 1)) else _S.binary("/", _S.binary("*", _S.read(_e, "v"), _S.read(_e, "v")), _S.binary("*", 0.16, _S.binary("-", 1, _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u"))))))

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "o", _S.arg(_args, 0))
	return [_S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]), _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "reds"), 6]), _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "golds"), 6])]
