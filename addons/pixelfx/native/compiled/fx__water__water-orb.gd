@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/water-orb.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "bead", _S.import_value("fx/water/_lib.js", "bead"))
	_S.define(_e, "ring", _S.import_value("fx/water/_lib.js", "ring"))
	_S.define(_e, "motes", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Water orb"}, {"desc": "A sphere of water floats and wobbles: a current circles inside it, the floor shows upside down through it, it shines, light gathers on the floor under it, and drips fall and plink."}, {"tags": ["water", "orb", "sphere", "magic", "float", "ambient", "loop"]}, {"size": [100, 108]}, {"origin": [50, 100]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"radius": 19}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SY", 0.3)
	_S.define(_e, "G", 700)
	_S.define(_e, "DRIP", 1.5)
	_S.define(_e, "LET", 0.5)
	_S.define(_e, "center", _S.function_value(_e, "_f9"))
	_S.define(_e, "skin", _S.function_value(_e, "_f10"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "ph", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 7}]), _S.function_value(_e, "_f1")])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 7), _S.read(_e, "TAU")), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), (1 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.unary("-", 1)))))
	_S.define(_e, "r", _S.binary("+", _S.binary("+", _S.read(_e, "R"), 5), _S.binary("*", _S.binary("%", _S.read(_e, "i"), 3), 3)))
	_S.define(_e, "tilt", _S.binary("*", _S.binary("-", _S.read(_e, "i"), 3), 0.22))
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "r")))
	_S.define(_e, "z", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	return _S.merge([{"x": _S.binary("*", _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "tilt")]))}, {"y": _S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "tilt")])), _S.binary("*", _S.binary("*", _S.read(_e, "z"), _S.read(_e, "r")), 0.28))}, {"z": _S.read(_e, "z")}, {"i": _S.read(_e, "i")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "R", _S.prop(_S.read(_e, "o"), "radius"))
	var _v0 = _S.call_value(_S.read(_e, "center"), [_S.read(_e, "ph")])
	_S.define(_e, "cx", _S.prop(_v0, 0))
	_S.define(_e, "cy", _S.prop(_v0, 1))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "cx"), 0, 22, _S.prop(_S.read(_e, "C"), 5), 0.32])
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "cx"), 9), _S.unary("-", 2), _S.binary("+", _S.read(_e, "cx"), 9), 2, _S.function_value(_e, "_f3")])
	for _v1 in _S.array(_S.call_value(_S.read(_e, "motes"), [_S.read(_e, "ph"), _S.read(_e, "R")])):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "m", _v1)
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v2, "m"), "z"), 0)):
			_S.invoke(_S.read(_v2, "p"), "px", [_S.binary("+", _S.read(_v2, "cx"), _S.prop(_S.read(_v2, "m"), "x")), _S.binary("+", _S.read(_v2, "cy"), _S.prop(_S.read(_v2, "m"), "y")), _S.prop(_S.read(_v2, "C"), 4)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "R"), 3.2), _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.3, _S.binary("*", 0.05, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2)])))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.binary("+", _S.binary("/", _S.binary("**", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), 2), 64), _S.binary("/", _S.binary("**", _S.binary("*", _S.read(_e, "y"), 2.5), 2), 9)))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.25)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.6)) else _S.prop(_S.read(_e, "C"), 5))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.binary("-", 1.2, _S.read(_e, "d")), "=", false)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "R", _S.prop(_S.read(_e, "o"), "radius"))
	var _v3 = _S.call_value(_S.read(_e, "center"), [_S.read(_e, "ph")])
	_S.define(_e, "cx", _S.prop(_v3, 0))
	_S.define(_e, "cy", _S.prop(_v3, 1))
	_S.define(_e, "T", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_e, "cx"), _S.read(_e, "R")), 4), _S.binary("-", _S.binary("-", _S.read(_e, "cy"), _S.read(_e, "R")), 4), _S.binary("+", _S.binary("+", _S.read(_e, "cx"), _S.read(_e, "R")), 4), _S.binary("+", _S.binary("+", _S.read(_e, "cy"), _S.read(_e, "R")), 6), _S.function_value(_e, "_f5")])
	var _v5 = _S.scope(_e)
	_S.define(_v5, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "k"), 3)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "rr", _S.binary("*", _S.read(_v6, "R"), _S.binary("+", 0.38, _S.binary("*", 0.2, _S.read(_v6, "k")))))
		_S.define(_v6, "tilt", _S.binary("+", _S.unary("-", 0.5), _S.binary("*", _S.read(_v6, "k"), 0.35)))
		_S.define(_v6, "spin", _S.binary("+", _S.binary("*", _S.read(_v6, "T"), (_S.unary("-", 2) if _S.truth(_S.binary("%", _S.read(_v6, "k"), 2)) else 3)), _S.binary("*", _S.read(_v6, "k"), 2)))
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "s", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "s"), 1)):
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "a", _S.binary("+", _S.read(_v8, "spin"), _S.binary("*", _S.read(_v8, "s"), _S.read(_v8, "TAU"))))
			_S.define(_v8, "x", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "rr")))
			_S.define(_v8, "z", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]))
			_S.define(_v8, "y", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v8, "x"), _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "tilt")])), 0.6), _S.binary("*", _S.binary("*", _S.read(_v8, "z"), _S.read(_v8, "rr")), 0.62)))
			_S.define(_v8, "dash", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_v8, "s"), 3), _S.binary("*", _S.read(_v8, "k"), 0.3)), 1))
			if _S.truth(_S.binary(">", _S.read(_v8, "dash"), 0.62)):
				_v7 = _S.iteration(_v7)
				_S.write(_v7, "s", 0.012, "+=", false)
				continue
			_S.invoke(_S.read(_v8, "p"), "px", [_S.binary("+", _S.read(_v8, "cx"), _S.binary("*", _S.read(_v8, "x"), _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "tilt")]))), _S.binary("+", _S.read(_v8, "cy"), _S.read(_v8, "y")), ((_S.read(_v8, "WHITE") if _S.truth(_S.binary("<", _S.read(_v8, "dash"), 0.1)) else (_S.prop(_S.read(_v8, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v8, "dash"), 0.4)) else _S.prop(_S.read(_v8, "C"), 5))) if _S.truth(_S.binary(">", _S.read(_v8, "z"), 0)) else _S.prop(_S.read(_v8, "C"), 3))])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "s", 0.012, "+=", false)
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "k", 1, "+=", true)
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 8, _S.prop(_S.read(_e, "o"), "seed"), _S.function_value(_e, "_f6"), _S.function_value(_e, "_f7")])
	_S.invoke(_S.read(_e, "p"), "arc", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "R"), 0.74), 1.8, _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), 1.12), _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), 1.4), _S.function_value(_e, "_f8")])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "R"), 0.45)), _S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "R"), 0.62)), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "R"), 0.48)), _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "R"), 0.5)), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "R"), 0.48)), 1), _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "R"), 0.5)), _S.prop(_S.read(_e, "C"), 5)])
	for _v9 in _S.array(_S.call_value(_S.read(_e, "motes"), [_S.read(_e, "ph"), _S.read(_e, "R")])):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "m", _v9)
		if _S.truth(_S.binary(">=", _S.prop(_S.read(_v10, "m"), "z"), 0)):
			var _v11 = _S.scope(_v10)
			_S.invoke(_S.read(_v11, "p"), "px", [_S.binary("+", _S.read(_v11, "cx"), _S.prop(_S.read(_v11, "m"), "x")), _S.binary("+", _S.read(_v11, "cy"), _S.prop(_S.read(_v11, "m"), "y")), _S.read(_v11, "WHITE")])
			_S.invoke(_S.read(_v11, "p"), "px", [_S.binary("-", _S.binary("+", _S.read(_v11, "cx"), _S.prop(_S.read(_v11, "m"), "x")), (_S.unary("-", 1) if _S.truth(_S.binary("%", _S.prop(_S.read(_v11, "m"), "i"), 2)) else 1)), _S.binary("+", _S.read(_v11, "cy"), _S.prop(_S.read(_v11, "m"), "y")), _S.prop(_S.read(_v11, "C"), 5)])
			_S.invoke(_S.read(_v11, "p"), "glow", [_S.binary("+", _S.read(_v11, "cx"), _S.prop(_S.read(_v11, "m"), "x")), _S.binary("+", _S.read(_v11, "cy"), _S.prop(_S.read(_v11, "m"), "y")), 4, _S.prop(_S.read(_v11, "C"), 5), 0.35])
	_S.define(_e, "dt", _S.binary("/", _S.binary("%", _S.read(_e, "t"), _S.read(_e, "DRIP")), _S.read(_e, "DRIP")))
	_S.define(_e, "fall", _S.binary("-", _S.binary("%", _S.read(_e, "t"), _S.read(_e, "DRIP")), _S.binary("*", _S.read(_e, "DRIP"), _S.read(_e, "LET"))))
	_S.define(_e, "y0", _S.binary("+", _S.binary("+", _S.read(_e, "cy"), _S.read(_e, "R")), 3))
	_S.define(_e, "land", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("/", _S.binary("*", 2, _S.unary("-", _S.read(_e, "y0"))), _S.read(_e, "G"))]))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "fall"), 0), func(): return _S.binary(">", _S.read(_e, "dt"), 0.2))):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "s", _S.call_value(_S.read(_v12, "smooth"), [0.2, _S.read(_v12, "LET"), _S.read(_v12, "dt")]))
		_S.invoke(_S.read(_v12, "p"), "circle", [_S.read(_v12, "cx"), _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_v12, "cy"), _S.read(_v12, "R")), 1), _S.binary("*", _S.read(_v12, "s"), 1.5)), _S.binary("+", 0.8, _S.binary("*", _S.read(_v12, "s"), 1.2)), _S.prop(_S.read(_v12, "C"), 5)])
		_S.invoke(_S.read(_v12, "p"), "px", [_S.binary("-", _S.read(_v12, "cx"), 0.5), _S.binary("+", _S.binary("+", _S.read(_v12, "cy"), _S.read(_v12, "R")), _S.binary("*", _S.read(_v12, "s"), 1.5)), _S.prop(_S.read(_v12, "C"), 6)])
	else:
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "fall"), 0), func(): return _S.binary("<", _S.read(_e, "fall"), _S.read(_e, "land")))):
			_S.call_value(_S.read(_e, "bead"), [_S.read(_e, "p"), _S.read(_e, "cx"), _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "G")), _S.read(_e, "fall")), _S.read(_e, "fall"))), 0, _S.binary("*", _S.read(_e, "G"), _S.read(_e, "fall")), 2, _S.read(_e, "C")])
		else:
			if _S.truth(_S.binary(">=", _S.read(_e, "fall"), _S.read(_e, "land"))):
				var _v13 = _S.scope(_e)
				_S.define(_v13, "since", _S.binary("-", _S.read(_v13, "fall"), _S.read(_v13, "land")))
				if _S.truth(_S.binary("<", _S.read(_v13, "since"), 0.08)):
					_S.invoke(_S.read(_v13, "p"), "px", [_S.read(_v13, "cx"), 0, _S.read(_v13, "WHITE")])
				_S.call_value(_S.read(_v13, "ring"), [_S.read(_v13, "p"), _S.read(_v13, "cx"), 0, _S.binary("+", 1.5, _S.binary("*", _S.read(_v13, "since"), 18)), _S.read(_v13, "SY"), _S.binary("*", 1.1, _S.binary("-", 1, _S.binary("/", _S.read(_v13, "since"), 0.4))), _S.read(_v13, "C"), _S.merge([{"n": 1}, {"half": 1}, {"seed": 3}, {"hot": _S.binary("<", _S.read(_v13, "since"), 0.05)}])])
	_S.define(_e, "fx", _S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "R"), 0.36)))
	_S.define(_e, "fy", _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "R"), 0.4)))
	_S.define(_e, "pulse", _S.binary("+", 0.8, _S.binary("*", 0.2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "T"), 4)]))))
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "fx"), _S.read(_e, "fy"), 1.6, _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "fx"), _S.read(_e, "fy"), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "fx"), _S.read(_e, "fy"), 9, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.45, _S.read(_e, "pulse"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "R"), 1.4), _S.prop(_S.read(_e, "C"), 5), 0.22])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("-", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "R"), 0.4)), _S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "R"), 0.5)), 6, _S.read(_e, "WHITE"), 0.25])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "skin"), [_S.read(_e, "a"), _S.read(_e, "R"), _S.read(_e, "ph")]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "r"))):
		return null
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "d"), _S.read(_e, "r")))
	_S.define(_e, "lit", _S.binary("/", _S.binary("/", _S.binary("-", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "dy")), _S.prop(_S.read(_e, "Math"), "SQRT2")), _S.invoke(_S.read(_e, "Math"), "max", [0.5, _S.read(_e, "d")])))
	if _S.truth(_S.binary(">", _S.read(_e, "q"), 0.9)):
		var _v4 = _S.scope(_e)
		_S.set_prop(_S.read(_v4, "out"), "c", (_S.read(_v4, "WHITE") if _S.truth(_S.binary(">", _S.read(_v4, "lit"), 0.35)) else (_S.prop(_S.read(_v4, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v4, "lit"), _S.unary("-", 0.2))) else _S.prop(_S.read(_v4, "C"), 3))), "=", false)
		return null
	_S.define(_e, "gather", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("/", _S.binary("/", _S.binary("+", _S.read(_e, "dx"), _S.read(_e, "dy")), _S.prop(_S.read(_e, "Math"), "SQRT2")), _S.read(_e, "r"))]), _S.read(_e, "q")))
	_S.invoke(_S.read(_e, "p"), "blend", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "gather"), 0.45)) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary(">", _S.read(_e, "gather"), 0.25)) else (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary(">", _S.read(_e, "q"), 0.7)) else _S.prop(_S.read(_e, "C"), 1)))), (0.7 if _S.truth(_S.binary(">", _S.read(_e, "gather"), 0.25)) else _S.binary("+", 0.35, _S.binary("*", 0.3, _S.read(_e, "q"))))])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [1, 1.8])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "x", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.5), 0.5]), _S.read(_e, "R")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 4), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))]), 1.5)))
	_S.define(_e, "y", _S.binary("-", _S.binary("*", _S.read(_e, "R"), 0.6), _S.binary("*", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "R")), 1.2)))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y")]), _S.binary("*", _S.read(_e, "R"), 0.8))):
		return null
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.read(_e, "cx"), _S.read(_e, "x")), _S.binary("+", _S.read(_e, "cy"), _S.read(_e, "y")), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.8)) else _S.read(_e, "WHITE"))])
	if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.35)):
		_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.binary("+", _S.read(_e, "cx"), _S.read(_e, "x")), 1), _S.binary("+", _S.read(_e, "cy"), _S.read(_e, "y")), _S.prop(_S.read(_e, "C"), 5)])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return (_S.read(_e, "WHITE") if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0.25), func(): return _S.binary("<", _S.read(_e, "u"), 0.75)), func(): return _S.binary(">", _S.read(_e, "v"), 0.4))) else _S.prop(_S.read(_e, "C"), 6))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ph", _S.arg(_args, 0))
	return [0, _S.binary("+", _S.unary("-", 52), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))]), 2))]

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "sag", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("**", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")])]), 6), 2.2), _S.call_value(_S.read(_e, "smooth"), [0.1, _S.read(_e, "LET"), _S.binary("/", _S.binary("%", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "D")), _S.read(_e, "DRIP")), _S.read(_e, "DRIP"))])), (1 if _S.truth(_S.binary("<", _S.binary("/", _S.binary("%", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "D")), _S.read(_e, "DRIP")), _S.read(_e, "DRIP")), _S.read(_e, "LET"))) else 0)))
	return _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "R"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "a"), 3), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2))]), 0.6)), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_e, "a"), 5), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 3))]), 0.35)), _S.read(_e, "sag"))
