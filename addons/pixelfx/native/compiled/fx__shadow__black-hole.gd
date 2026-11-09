@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/black-hole.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "halo", _S.import_value("fx/shadow/_lib.js", "halo"))
	_S.define(_e, "unlight", _S.import_value("fx/shadow/_lib.js", "unlight"))
	_S.define(_e, "disk", _S.function_value(_e, "_f0"))
	_S.define(_e, "hole", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Black hole"}, {"desc": "A tilted disk of banded rings turns round a black hole, its far side bent up over the top and under the bottom; debris spirals in, stretches and is swallowed."}, {"tags": ["shadow", "black-hole", "void", "space", "gravity", "dark", "magic", "loop"]}, {"size": [184, 132]}, {"origin": [92, 124]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"rock": ["#120d1c", "#2e2440", "#544468", "#857399"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "Y", _S.unary("-", 70))
	_S.define(_e, "RS", 13.5)
	_S.define(_e, "E", 17.5)
	_S.define(_e, "SI", 0.25)
	_S.define(_e, "SI_ARCH", 0.46)
	_S.define(_e, "TILT", _S.unary("-", 0.14))
	_S.define(_e, "D", 4)
	_S.define(_e, "CT", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "TILT")]))
	_S.define(_e, "ST", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "TILT")]))
	_S.define(_e, "BANDS", [_S.merge([{"r0": 18}, {"r1": 24}, {"n": 5}, {"hot": 1.35}, {"k": 0.3}]), _S.merge([{"r0": 26}, {"r1": 34}, {"n": 3}, {"hot": 0.92}, {"k": 1.9}]), _S.merge([{"r0": 35.5}, {"r1": 46}, {"n": 2}, {"hot": 0.64}, {"k": 3.7}]), _S.merge([{"r0": 47.5}, {"r1": 60}, {"n": 1}, {"hot": 0.42}, {"k": 5.2}])])
	_S.define(_e, "ROUT", 60)
	_S.define(_e, "BAYER", _S.invoke([0, 8, 2, 10, 12, 4, 14, 6, 3, 11, 1, 9, 15, 7, 13, 5], "map", [_S.function_value(_e, "_f15")]))
	_S.define(_e, "ICE", _S.call_value(_S.read(_e, "hex"), ["#e4f7ff"]))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "X", _S.arg(_args, 0))
	_S.define(_e, "Z", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "rho", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_e, "X"), _S.read(_e, "X")), _S.binary("*", _S.read(_e, "Z"), _S.read(_e, "Z")))]))
	for _v0 in _S.array(_S.read(_e, "BANDS")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "b", _v0)
		var _v2 = _S.scope(_v1)
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v2, "rho"), _S.prop(_S.read(_v2, "b"), "r0")), func(): return _S.binary(">", _S.read(_v2, "rho"), _S.prop(_S.read(_v2, "b"), "r1")))):
			continue
		_S.define(_v2, "w", _S.binary("/", _S.binary("-", _S.read(_v2, "rho"), _S.prop(_S.read(_v2, "b"), "r0")), _S.binary("-", _S.prop(_S.read(_v2, "b"), "r1"), _S.prop(_S.read(_v2, "b"), "r0"))))
		_S.define(_v2, "ph", _S.binary("-", _S.invoke(_S.read(_v2, "Math"), "atan2", [_S.read(_v2, "Z"), _S.read(_v2, "X")]), _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v2, "TAU"), _S.prop(_S.read(_v2, "b"), "n")), _S.read(_v2, "t")), _S.read(_v2, "D"))))
		_S.define(_v2, "streak", _S.binary("+", _S.binary("+", 0.62, _S.binary("*", 0.22, _S.invoke(_S.read(_v2, "Math"), "cos", [_S.binary("+", _S.binary("+", _S.binary("*", 7, _S.read(_v2, "ph")), _S.binary("*", _S.read(_v2, "rho"), 0.8)), _S.prop(_S.read(_v2, "b"), "k"))]))), _S.binary("*", 0.16, _S.invoke(_S.read(_v2, "Math"), "cos", [_S.binary("+", _S.binary("-", _S.binary("*", 13, _S.read(_v2, "ph")), _S.binary("*", _S.read(_v2, "rho"), 1.6)), _S.binary("*", _S.prop(_S.read(_v2, "b"), "k"), 2))]))))
		_S.define(_v2, "lane", _S.binary("+", 0.72, _S.binary("*", 0.28, _S.invoke(_S.read(_v2, "Math"), "cos", [_S.binary("+", _S.binary("*", _S.read(_v2, "rho"), 2.3), _S.prop(_S.read(_v2, "b"), "k"))]))))
		_S.define(_v2, "edge", _S.binary("*", _S.call_value(_S.read(_v2, "smooth"), [0, 0.18, _S.read(_v2, "w")]), _S.binary("-", 1, _S.call_value(_S.read(_v2, "smooth"), [0.78, 1, _S.read(_v2, "w")]))))
		return _S.merge([{"I": _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v2, "b"), "hot"), _S.read(_v2, "streak")), _S.read(_v2, "lane")), _S.binary("+", 0.35, _S.binary("*", 0.65, _S.read(_v2, "edge"))))}, {"dop": _S.binary("/", _S.unary("-", _S.read(_v2, "X")), _S.read(_v2, "rho"))}])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "pulse", _S.arg(_args, 3))
	_S.define(_e, "RAMP", [_S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 7), _S.read(_e, "WHITE")])
	_S.define(_e, "n", _S.prop(_S.read(_e, "RAMP"), "length"))
	_S.define(_e, "W", _S.binary("+", _S.read(_e, "ROUT"), 2))
	_S.define(_e, "H", 42)
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", _S.read(_e, "W")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "H")), _S.read(_e, "W"), _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "H")), _S.function_value(_e, "_f2")])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.read(_e, "x"))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "Y")))
	_S.define(_e, "u", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "CT")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ST"))))
	_S.define(_e, "v", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "ST")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "CT"))))
	_S.define(_e, "r", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u")), _S.binary("*", _S.read(_e, "v"), _S.read(_e, "v")))]))
	_S.define(_e, "s", null)
	if _S.truth(_S.binary(">", _S.read(_e, "v"), 0)):
		_S.write(_e, "s", _S.call_value(_S.read(_e, "disk"), [_S.read(_e, "u"), _S.binary("/", _S.unary("-", _S.read(_e, "v")), _S.read(_e, "SI")), _S.read(_e, "t")]), "=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "s")), func(): return _S.binary(">", _S.read(_e, "r"), _S.read(_e, "RS")))):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "k", _S.binary("-", 1, _S.binary("/", _S.binary("*", _S.read(_v3, "E"), _S.read(_v3, "E")), _S.binary("*", _S.read(_v3, "r"), _S.read(_v3, "r")))))
		_S.define(_v3, "bu", _S.binary("*", _S.read(_v3, "u"), _S.read(_v3, "k")))
		_S.define(_v3, "bv", _S.binary("*", _S.read(_v3, "v"), _S.read(_v3, "k")))
		_S.define(_v3, "si", (_S.read(_v3, "SI_ARCH") if _S.truth(_S.binary(">", _S.read(_v3, "k"), 0)) else _S.read(_v3, "SI")))
		if _S.truth(_S.binary(">", _S.binary("/", _S.unary("-", _S.read(_v3, "bv")), _S.read(_v3, "si")), 0)):
			_S.write(_v3, "s", _S.call_value(_S.read(_v3, "disk"), [_S.read(_v3, "bu"), _S.binary("/", _S.unary("-", _S.read(_v3, "bv")), _S.read(_v3, "si")), _S.read(_v3, "t")]), "=", false)
	if _S.truth(_S.logical("||", _S.unary("!", _S.read(_e, "s")), func(): return _S.binary("<", _S.prop(_S.read(_e, "s"), "I"), 0.06))):
		var _v4 = _S.scope(_e)
		if _S.truth(_S.binary("<", _S.read(_v4, "r"), _S.binary("-", _S.read(_v4, "RS"), 0.4))):
			return _S.prop(_S.read(_v4, "C"), 0)
		if _S.truth(_S.binary("<", _S.read(_v4, "r"), _S.binary("+", _S.read(_v4, "RS"), 0.7))):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "a", _S.invoke(_S.read(_v5, "Math"), "atan2", [_S.read(_v5, "v"), _S.read(_v5, "u")]))
			_S.define(_v5, "f", _S.binary("+", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v5, "Math"), "cos", [_S.binary("+", _S.binary("*", 3, _S.read(_v5, "a")), _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v5, "TAU"), 2), _S.read(_v5, "t")), _S.read(_v5, "D")))]))), _S.binary("*", _S.read(_v5, "pulse"), 0.4)))
			_S.set_prop(_S.read(_v5, "out"), "k", 0.3, "=", false)
			return (_S.read(_v5, "WHITE") if _S.truth(_S.binary(">", _S.read(_v5, "f"), 0.55)) else _S.prop(_S.read(_v5, "C"), 7))
		return null
	_S.define(_e, "I", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "s"), "I"), 1.3), _S.binary("+", 1, _S.binary("*", 0.55, _S.prop(_S.read(_e, "s"), "dop")))), _S.binary("+", 1, _S.binary("*", 0.25, _S.read(_e, "pulse")))))
	_S.define(_e, "f", _S.binary("*", _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "I")]), _S.binary("-", _S.read(_e, "n"), 1)))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "f")]))
	if _S.truth(_S.binary(">", _S.binary("-", _S.read(_e, "f"), _S.read(_e, "i")), _S.prop(_S.read(_e, "BAYER"), _S.binary("|", _S.binary("<<", _S.binary("&", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), 3), 2), _S.binary("&", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), 3))))):
		_S.write(_e, "i", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "n"), 1), _S.binary("+", _S.read(_e, "i"), 1)]), "=", false)
	if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_e, "i"), 0), func(): return _S.binary("<", _S.read(_e, "I"), 0.12))):
		return null
	_S.define(_e, "c", _S.prop(_S.read(_e, "RAMP"), _S.read(_e, "i")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_e, "s"), "dop"), 0.35), func(): return _S.binary(">=", _S.read(_e, "i"), _S.binary("-", _S.read(_e, "n"), 3)))):
		_S.write(_e, "c", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.read(_e, "ICE"), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("-", _S.prop(_S.read(_e, "s"), "dop"), 0.35), 2)])]), "=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.prop(_S.read(_e, "s"), "dop"), _S.unary("-", 0.4)), func(): return _S.binary(">=", _S.read(_e, "i"), 2)), func(): return _S.binary("<", _S.read(_e, "i"), _S.binary("-", _S.read(_e, "n"), 2)))):
		_S.write(_e, "c", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.prop(_S.read(_e, "C"), 3), 0.35]), "=", false)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "i"), _S.binary("-", _S.read(_e, "n"), 4)), func(): return _S.binary("===", _S.binary("&", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")])), 1), 0))):
		_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", 0.3, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("-", _S.read(_e, "I"), 0.35)])), "=", false)
	return _S.read(_e, "c")

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 1), 44, _S.prop(_S.read(_e, "C"), 4), 0.12])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "Y"), 80, _S.prop(_S.read(_e, "C"), 4), 0.32])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "Y"), 46, _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), 0.5]), 0.45])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "K", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "rock"), 4]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "pulse", _S.binary("**", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), 2), _S.read(_e, "t")), _S.read(_e, "D"))])]), 12))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 10, _S.binary("+", _S.read(_e, "S"), 3), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	_S.call_value(_S.read(_e, "hole"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "pulse")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 40, _S.binary("+", _S.read(_e, "S"), 7), _S.function_value(_e, "_f7"), _S.function_value(_e, "_f8")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 22, _S.read(_e, "S"), _S.function_value(_e, "_f10"), _S.function_value(_e, "_f11")])
	_S.call_value(_S.read(_e, "halo"), [_S.read(_e, "p"), 0, _S.read(_e, "Y"), _S.binary("-", _S.read(_e, "RS"), 0.4), _S.binary("+", _S.read(_e, "RS"), 4), _S.prop(_S.read(_e, "C"), 6), _S.binary("+", 0.35, _S.binary("*", 0.3, _S.read(_e, "pulse")))])
	_S.call_value(_S.read(_e, "unlight"), [_S.read(_e, "p"), _S.unary("-", _S.read(_e, "RS")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "RS")), _S.read(_e, "RS"), _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "RS")), _S.function_value(_e, "_f14")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.6, 2.6])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "x0", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 60), 60]))
	_S.define(_e, "u", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("/", _S.read(_e, "age"), _S.read(_e, "L")), 1.5]))
	_S.define(_e, "tx", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sign", [_S.logical("||", _S.read(_e, "x0"), func(): return 1)]), _S.invoke(_S.read(_e, "r"), "range", [40, 56])))
	_S.define(_e, "ty", _S.binary("+", _S.read(_e, "Y"), _S.invoke(_S.read(_e, "r"), "range", [4, 9])))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.binary("-", _S.read(_e, "tx"), _S.read(_e, "x0")), _S.read(_e, "u"))))
	_S.define(_e, "y", _S.binary("-", _S.binary("+", _S.unary("-", 1), _S.binary("*", _S.binary("+", _S.read(_e, "ty"), 1), _S.read(_e, "u"))), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "u"))]), 10)))
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "K"), 3) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "K"), 2))])
	if _S.truth(_S.binary("<", _S.read(_e, "age"), 0.25)):
		_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x0"), _S.unary("-", 1.5), _S.binary("+", 2, _S.binary("*", _S.read(_e, "age"), 8)), _S.prop(_S.read(_e, "K"), 2), _S.binary("*", 0.4, _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), 0.25)))])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.5, 0.9])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "a0", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "d0", _S.invoke(_S.read(_e, "r"), "range", [48, 76]))
	_S.define(_e, "q", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("/", _S.read(_e, "age"), _S.read(_e, "L")), 1.6]))
	_S.define(_e, "d", _S.binary("+", _S.binary("+", _S.read(_e, "RS"), 2), _S.binary("*", _S.binary("-", _S.binary("-", _S.read(_e, "d0"), _S.read(_e, "RS")), 2), _S.binary("-", 1, _S.read(_e, "q")))))
	_S.define(_e, "a", _S.binary("+", _S.read(_e, "a0"), _S.binary("*", 0.9, _S.read(_e, "q"))))
	_S.define(_e, "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "d")), 1.15))
	_S.define(_e, "y", _S.binary("+", _S.read(_e, "Y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "d")), 0.75)))
	_S.define(_e, "q2", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("/", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "age"), 0.09)]), _S.read(_e, "L")), 1.6]))
	_S.define(_e, "d2", _S.binary("+", _S.binary("+", _S.read(_e, "RS"), 2), _S.binary("*", _S.binary("-", _S.binary("-", _S.read(_e, "d0"), _S.read(_e, "RS")), 2), _S.binary("-", 1, _S.read(_e, "q2")))))
	_S.define(_e, "a2", _S.binary("+", _S.read(_e, "a0"), _S.binary("*", 0.9, _S.read(_e, "q2"))))
	if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "RS"), 3)), func(): return _S.binary(">", _S.read(_e, "y"), _S.unary("-", 3))), func(): return _S.binary("<", _S.read(_e, "y"), _S.unary("-", 120))), func(): return _S.binary("<", _S.binary("+", _S.read(_e, "Y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a2")]), _S.read(_e, "d2")), 0.75)), _S.unary("-", 120))), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 90))):
		return null
	_S.define(_e, "col", _S.invoke(_S.read(_e, "r"), "pick", [[_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)]]))
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a2")]), _S.read(_e, "d2")), 1.15), _S.binary("+", _S.read(_e, "Y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a2")]), _S.read(_e, "d2")), 0.75)), _S.read(_e, "x"), _S.read(_e, "y"), _S.function_value(_e, "_f9"), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 6)])])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.read(_e, "col"), 0.3])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "col") if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "C"), 4))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.4, 2.4])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "ph0", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "rho0", _S.invoke(_S.read(_e, "r"), "range", [58, 80]))
	_S.define(_e, "hgt", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 8), 8]))
	_S.define(_e, "size", _S.invoke(_S.read(_e, "r"), "range", [1.6, 2.8]))
	_S.define(_e, "at", _S.function_value(_e, "_f12"))
	_S.define(_e, "a", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "age")]))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "at"), [_S.binary("-", _S.read(_e, "age"), 0.04)]))
	_S.define(_e, "hidden", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_e, "a"), "Z"), 0), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.prop(_S.read(_e, "a"), "x"), _S.binary("-", _S.prop(_S.read(_e, "a"), "y"), _S.read(_e, "Y"))]), _S.binary("+", _S.read(_e, "RS"), 1))))
	if _S.truth(_S.read(_e, "hidden")):
		return null
	if _S.truth(_S.binary("<", _S.prop(_S.read(_e, "a"), "rho"), _S.binary("+", _S.read(_e, "RS"), 3))):
		var _v6 = _S.scope(_e)
		_S.invoke(_S.read(_v6, "p"), "px", [_S.prop(_S.read(_v6, "a"), "x"), _S.prop(_S.read(_v6, "a"), "y"), _S.read(_v6, "WHITE")])
		_S.invoke(_S.read(_v6, "p"), "glow", [_S.prop(_S.read(_v6, "a"), "x"), _S.prop(_S.read(_v6, "a"), "y"), 6, _S.prop(_S.read(_v6, "C"), 6), 0.6])
		return null
	_S.define(_e, "heat", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [16, 34, _S.prop(_S.read(_e, "a"), "rho")])))
	_S.define(_e, "len", _S.binary("+", 1, _S.binary("*", _S.read(_e, "heat"), 7)))
	if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.05)):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "dx", _S.binary("-", _S.prop(_S.read(_v7, "a"), "x"), _S.prop(_S.read(_v7, "b"), "x")))
		_S.define(_v7, "dy", _S.binary("-", _S.prop(_S.read(_v7, "a"), "y"), _S.prop(_S.read(_v7, "b"), "y")))
		_S.define(_v7, "l", _S.logical("||", _S.invoke(_S.read(_v7, "Math"), "hypot", [_S.read(_v7, "dx"), _S.read(_v7, "dy")]), func(): return 1))
		_S.invoke(_S.read(_v7, "p"), "line", [_S.binary("-", _S.prop(_S.read(_v7, "a"), "x"), _S.binary("*", _S.binary("/", _S.read(_v7, "dx"), _S.read(_v7, "l")), _S.read(_v7, "len"))), _S.binary("-", _S.prop(_S.read(_v7, "a"), "y"), _S.binary("*", _S.binary("/", _S.read(_v7, "dy"), _S.read(_v7, "l")), _S.read(_v7, "len"))), _S.prop(_S.read(_v7, "a"), "x"), _S.prop(_S.read(_v7, "a"), "y"), _S.function_value(_v7, "_f13")])
		_S.invoke(_S.read(_v7, "p"), "glow", [_S.prop(_S.read(_v7, "a"), "x"), _S.prop(_S.read(_v7, "a"), "y"), 4, _S.prop(_S.read(_v7, "C"), 6), _S.binary("*", 0.4, _S.read(_v7, "heat"))])
	else:
		var _v8 = _S.scope(_e)
		_S.define(_v8, "lx", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v8, "a"), "x")), _S.logical("||", _S.invoke(_S.read(_v8, "Math"), "hypot", [_S.prop(_S.read(_v8, "a"), "x"), _S.binary("-", _S.prop(_S.read(_v8, "a"), "y"), _S.read(_v8, "Y"))]), func(): return 1)))
		_S.define(_v8, "ly", _S.binary("/", _S.unary("-", _S.binary("-", _S.prop(_S.read(_v8, "a"), "y"), _S.read(_v8, "Y"))), _S.logical("||", _S.invoke(_S.read(_v8, "Math"), "hypot", [_S.prop(_S.read(_v8, "a"), "x"), _S.binary("-", _S.prop(_S.read(_v8, "a"), "y"), _S.read(_v8, "Y"))]), func(): return 1)))
		_S.define(_v8, "c", _S.call_value(_S.read(_v8, "at"), [_S.binary("-", _S.read(_v8, "age"), 0.09)]))
		_S.define(_v8, "d", _S.call_value(_S.read(_v8, "at"), [_S.binary("-", _S.read(_v8, "age"), 0.15)]))
		_S.invoke(_S.read(_v8, "p"), "px", [_S.prop(_S.read(_v8, "b"), "x"), _S.prop(_S.read(_v8, "b"), "y"), _S.prop(_S.read(_v8, "C"), 3)])
		_S.invoke(_S.read(_v8, "p"), "dot", [_S.prop(_S.read(_v8, "c"), "x"), _S.prop(_S.read(_v8, "c"), "y"), _S.prop(_S.read(_v8, "C"), 3), 0.7])
		_S.invoke(_S.read(_v8, "p"), "dot", [_S.prop(_S.read(_v8, "d"), "x"), _S.prop(_S.read(_v8, "d"), "y"), _S.prop(_S.read(_v8, "C"), 2), 0.5])
		_S.define(_v8, "s2", _S.binary(">", _S.read(_v8, "size"), 2.2))
		_S.invoke(_S.read(_v8, "p"), "px", [_S.prop(_S.read(_v8, "a"), "x"), _S.prop(_S.read(_v8, "a"), "y"), _S.prop(_S.read(_v8, "K"), 2)])
		_S.invoke(_S.read(_v8, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v8, "a"), "x"), 1), _S.prop(_S.read(_v8, "a"), "y"), _S.prop(_S.read(_v8, "K"), 1)])
		_S.invoke(_S.read(_v8, "p"), "px", [_S.prop(_S.read(_v8, "a"), "x"), _S.binary("+", _S.prop(_S.read(_v8, "a"), "y"), 1), _S.prop(_S.read(_v8, "K"), 1)])
		if _S.truth(_S.read(_v8, "s2")):
			_S.last([_S.invoke(_S.read(_v8, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v8, "a"), "x"), 1), _S.binary("+", _S.prop(_S.read(_v8, "a"), "y"), 1), _S.prop(_S.read(_v8, "K"), 0)]), _S.invoke(_S.read(_v8, "p"), "px", [_S.binary("-", _S.prop(_S.read(_v8, "a"), "x"), 1), _S.prop(_S.read(_v8, "a"), "y"), _S.prop(_S.read(_v8, "K"), 1)]), _S.invoke(_S.read(_v8, "p"), "px", [_S.prop(_S.read(_v8, "a"), "x"), _S.binary("-", _S.prop(_S.read(_v8, "a"), "y"), 1), _S.prop(_S.read(_v8, "K"), 2)])])
		_S.invoke(_S.read(_v8, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v8, "a"), "x"), _S.invoke(_S.read(_v8, "Math"), "round", [_S.binary("*", _S.read(_v8, "lx"), 1.4)])), _S.binary("+", _S.prop(_S.read(_v8, "a"), "y"), _S.invoke(_S.read(_v8, "Math"), "round", [_S.binary("*", _S.read(_v8, "ly"), 1.4)])), (_S.prop(_S.read(_v8, "C"), 6) if _S.truth(_S.read(_v8, "s2")) else _S.prop(_S.read(_v8, "C"), 5))])
		_S.invoke(_S.read(_v8, "p"), "glow", [_S.prop(_S.read(_v8, "a"), "x"), _S.prop(_S.read(_v8, "a"), "y"), 4, _S.prop(_S.read(_v8, "C"), 5), 0.15])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "aa", _S.arg(_args, 0))
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "aa"), _S.read(_e, "L"))]))
	_S.define(_e, "rho", _S.binary("+", _S.binary("+", _S.read(_e, "RS"), 1), _S.binary("*", _S.binary("-", _S.binary("-", _S.read(_e, "rho0"), _S.read(_e, "RS")), 1), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "q"), 1.5])))))
	_S.define(_e, "ph", _S.binary("+", _S.read(_e, "ph0"), _S.binary("*", _S.binary("*", 2.4, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "q"), 1.6])), _S.binary("+", 1, _S.binary("*", 1.5, _S.read(_e, "q"))))))
	_S.define(_e, "X", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ph")]), _S.read(_e, "rho")))
	_S.define(_e, "Z", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ph")]), _S.read(_e, "rho")))
	_S.define(_e, "sx", _S.read(_e, "X"))
	_S.define(_e, "sy", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "Z")), _S.read(_e, "SI")), _S.binary("*", _S.read(_e, "hgt"), _S.binary("-", 1, _S.read(_e, "q")))))
	return _S.merge([{"x": _S.binary("-", _S.binary("*", _S.read(_e, "sx"), _S.read(_e, "CT")), _S.binary("*", _S.read(_e, "sy"), _S.read(_e, "ST")))}, {"y": _S.binary("+", _S.binary("+", _S.read(_e, "Y"), _S.binary("*", _S.read(_e, "sx"), _S.read(_e, "ST"))), _S.binary("*", _S.read(_e, "sy"), _S.read(_e, "CT")))}, {"Z": _S.read(_e, "Z")}, {"rho": _S.read(_e, "rho")}])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.7)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.35)) else _S.prop(_S.read(_e, "C"), 4)))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.read(_e, "x"))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "Y")))
	_S.define(_e, "v", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "ST")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "CT"))))
	_S.define(_e, "u", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "CT")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ST"))))
	return _S.logical("&&", _S.binary("<", _S.binary("+", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u")), _S.binary("*", _S.read(_e, "v"), _S.read(_e, "v"))), _S.binary("**", _S.binary("-", _S.read(_e, "RS"), 0.6), 2)), func(): return _S.unary("!", _S.logical("&&", _S.binary(">", _S.read(_e, "v"), 0), func(): return _S.call_value(_S.read(_e, "disk"), [_S.read(_e, "u"), _S.binary("/", _S.unary("-", _S.read(_e, "v")), _S.read(_e, "SI")), _S.read(_e, "t")]))))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return _S.binary("/", _S.binary("+", _S.read(_e, "v"), 0.5), 16)
