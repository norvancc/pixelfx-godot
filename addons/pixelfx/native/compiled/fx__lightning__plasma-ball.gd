@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/plasma-ball.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "loopNoise", _S.import_value("core/index.js", "loopNoise"))
	_S.define(_e, "tendril", _S.function_value(_e, "_f0"))
	_S.define(_e, "pedestal", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Plasma ball"}, {"desc": "A glass globe on a dark pedestal: wandering plasma tendrils reach from the core to the glass and fan out in bright feet where they touch it, lighting the stand and floor."}, {"tags": ["lightning", "electric", "plasma", "lamp", "prop", "loop"]}, {"size": [112, 104]}, {"origin": [56, 96]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0828", "#3b0f5e", "#6a1d9c", "#a03ad6", "#d46cf2", "#f2a8ff", "#ffe2ff", "#ffffff"]}, {"tendrils": 9}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FPS", 30)
	_S.define(_e, "N", 90)
	_S.define(_e, "GX", 0)
	_S.define(_e, "GY", _S.unary("-", 55))
	_S.define(_e, "RG", 24)
	_S.define(_e, "BASE", _S.invoke(["#0d0b12", "#17131f", "#231d2d", "#342b43", "#4b3f60", "#6b5c87"], "map", [_S.read(_e, "hex")]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "n", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "seed", _S.arg(_args, 3))
	_S.define(_e, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.binary("+", _S.read(_e, "i"), 0.5), _S.read(_e, "n")), _S.read(_e, "TAU")), _S.binary("*", 0.9, _S.call_value(_S.read(_e, "loopNoise"), [_S.read(_e, "ph"), 0.9, _S.binary("+", _S.read(_e, "seed"), _S.binary("*", _S.read(_e, "i"), 7))]))))
	_S.define(_e, "z", _S.call_value(_S.read(_e, "loopNoise"), [_S.read(_e, "ph"), 0.7, _S.binary("+", _S.binary("+", _S.read(_e, "seed"), _S.binary("*", _S.read(_e, "i"), 7)), 3)]))
	_S.define(_e, "rho", _S.binary("*", _S.read(_e, "RG"), _S.binary("+", 0.72, _S.binary("*", 0.28, _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("*", _S.read(_e, "z"), _S.read(_e, "z")), 1.6)]))])))))
	return _S.merge([{"a": _S.read(_e, "a")}, {"front": _S.binary(">", _S.read(_e, "z"), _S.unary("-", 0.15))}, {"ex": _S.binary("+", _S.read(_e, "GX"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "rho")))}, {"ey": _S.binary("+", _S.read(_e, "GY"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "rho")))}, {"rim": _S.binary(">", _S.read(_e, "rho"), _S.binary("*", _S.read(_e, "RG"), 0.93))}, {"w1": _S.call_value(_S.read(_e, "loopNoise"), [_S.read(_e, "ph"), 1.1, _S.binary("+", _S.binary("+", _S.read(_e, "seed"), _S.binary("*", _S.read(_e, "i"), 7)), 5)])}, {"w2": _S.call_value(_S.read(_e, "loopNoise"), [_S.read(_e, "ph"), 1.3, _S.binary("+", _S.binary("+", _S.read(_e, "seed"), _S.binary("*", _S.read(_e, "i"), 7)), 6)])}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "glow", _S.arg(_args, 2))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 18), _S.unary("-", 32), 18, 0, _S.function_value(_e, "_f2")])
	_S.invoke(_S.read(_e, "p"), "px", [9, _S.unary("-", 9), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "glow", [9, _S.unary("-", 9), 3, _S.prop(_S.read(_e, "C"), 5), 0.5])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "hw", (7 if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 27))) else (_S.binary("+", 9, _S.binary("*", _S.binary("/", _S.binary("+", _S.read(_e, "y"), 27), 25), 6)) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 2))) else 16)))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.read(_e, "hw"))):
		return null
	_S.define(_e, "u", _S.binary("/", _S.binary("+", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "hw")), 1), 2))
	if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 27))):
		return _S.set_prop(_S.read(_e, "o"), "c", ((_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "BASE"), 5)) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 30))) else (_S.prop(_S.read(_e, "BASE"), 5) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else (_S.prop(_S.read(_e, "BASE"), 3) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.75)) else _S.prop(_S.read(_e, "BASE"), 1)))), "=", false)
	if _S.truth(_S.binary(">=", _S.read(_e, "y"), _S.unary("-", 2))):
		return _S.set_prop(_S.read(_e, "o"), "c", ((_S.prop(_S.read(_e, "BASE"), 4) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.55)) else _S.prop(_S.read(_e, "BASE"), 2)) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 1))) else _S.prop(_S.read(_e, "BASE"), 1)), "=", false)
	_S.define(_e, "i", (2 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.1)) else (3 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.2)) else (5 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else (4 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.42)) else (3 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.6)) else (2 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.8)) else (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.92)) else 0))))))))
	_S.set_prop(_S.read(_e, "o"), "c", (_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "BASE"), _S.read(_e, "i")), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.3, _S.read(_e, "glow"))]) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "y"), _S.unary("-", 24)), func(): return _S.binary("<", _S.read(_e, "u"), 0.5))) else (_S.prop(_S.read(_e, "BASE"), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "i"), 1)])) if _S.truth(_S.binary(">", _S.read(_e, "y"), _S.unary("-", 5))) else _S.prop(_S.read(_e, "BASE"), _S.read(_e, "i")))), "=", false)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "f", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), _S.read(_e, "FPS")), 0.000001)]), _S.read(_e, "N")))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "f"), _S.read(_e, "N")))
	_S.define(_e, "n", _S.prop(_S.read(_e, "o"), "tendrils"))
	_S.define(_e, "R", _S.call_value(_S.read(_e, "rng"), [_S.prop(_S.read(_e, "o"), "seed"), 3, _S.read(_e, "f")]))
	_S.define(_e, "pulse", _S.binary("+", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 6)]))), _S.binary("*", 0.1, _S.binary("-", _S.invoke(_S.read(_e, "R"), "next", []), 0.5))))
	_S.define(_e, "ts", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "n")}]), _S.function_value(_e, "_f4")]))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 6), 52, _S.prop(_S.read(_e, "C"), 3), _S.binary("*", 0.22, _S.read(_e, "pulse"))])
	_S.call_value(_S.read(_e, "pedestal"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "pulse")])
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "GX"), _S.read(_e, "RG")), _S.binary("-", _S.read(_e, "GY"), _S.read(_e, "RG")), _S.binary("+", _S.read(_e, "GX"), _S.read(_e, "RG")), _S.binary("+", _S.read(_e, "GY"), _S.read(_e, "RG")), _S.function_value(_e, "_f5")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "GX"), _S.read(_e, "GY"), _S.binary("+", _S.read(_e, "RG"), 14), _S.prop(_S.read(_e, "C"), 3), _S.binary("*", 0.32, _S.read(_e, "pulse"))])
	_S.invoke(_S.read(_e, "p"), "glowRing", [_S.read(_e, "GX"), _S.read(_e, "GY"), _S.binary("-", _S.read(_e, "RG"), 1), 5, _S.prop(_S.read(_e, "C"), 3), _S.binary("*", 0.22, _S.read(_e, "pulse"))])
	_S.define(_e, "drawTendril", _S.function_value(_e, "_f6"))
	_S.invoke(_S.read(_e, "ts"), "forEach", [_S.function_value(_e, "_f7")])
	_S.define(_e, "cr", _S.binary("+", 3.6, _S.binary("*", 0.5, _S.read(_e, "pulse"))))
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "GX"), _S.read(_e, "GY"), _S.binary("+", _S.read(_e, "cr"), 1.3), _S.prop(_S.read(_e, "C"), 3)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "GX"), _S.read(_e, "GY"), _S.read(_e, "cr"), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.binary("-", _S.read(_e, "GX"), 0.6), _S.binary("-", _S.read(_e, "GY"), 0.6), _S.binary("*", _S.read(_e, "cr"), 0.55), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.binary("-", _S.read(_e, "GX"), 0.8), _S.binary("-", _S.read(_e, "GY"), 0.8), _S.binary("*", _S.read(_e, "cr"), 0.25), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "GX"), _S.read(_e, "GY"), 16, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.65, _S.read(_e, "pulse"))])
	_S.invoke(_S.read(_e, "ts"), "forEach", [_S.function_value(_e, "_f8")])
	_S.invoke(_S.read(_e, "p"), "ring", [_S.read(_e, "GX"), _S.read(_e, "GY"), _S.binary("+", _S.read(_e, "RG"), 1.6), 1, _S.prop(_S.read(_e, "C"), 1)])
	_S.invoke(_S.read(_e, "p"), "ring", [_S.read(_e, "GX"), _S.read(_e, "GY"), _S.binary("+", _S.read(_e, "RG"), 0.6), 1.1, _S.function_value(_e, "_f9")])
	_S.invoke(_S.read(_e, "p"), "arc", [_S.read(_e, "GX"), _S.read(_e, "GY"), _S.binary("-", _S.read(_e, "RG"), 1.6), 1.3, 3.55, 4.55, _S.function_value(_e, "_f10")])
	var _v13 = _S.scope(_e)
	_S.define(_v13, "a", 0.35)
	while _S.truth(_S.binary("<", _S.read(_v13, "a"), 1.15)):
		_S.invoke(_S.read(_v13, "p"), "dot", [_S.binary("+", _S.read(_v13, "GX"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.binary("-", _S.read(_v13, "RG"), 2.6))), _S.binary("+", _S.read(_v13, "GY"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.binary("-", _S.read(_v13, "RG"), 2.6))), _S.prop(_S.read(_v13, "C"), 4), 0.85])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "a", 0.045, "+=", false)
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "GX"), _S.binary("*", _S.read(_e, "RG"), 0.42)), _S.binary("-", _S.read(_e, "GY"), _S.binary("*", _S.read(_e, "RG"), 0.62)), _S.read(_e, "WHITE")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "tendril"), [_S.read(_e, "i"), _S.read(_e, "n"), _S.read(_e, "ph"), _S.prop(_S.read(_e, "o"), "seed")])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "GX")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "GY"))]))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), _S.binary("-", _S.read(_e, "RG"), 0.5))):
		_S.invoke(_S.read(_e, "p"), "blend", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 1) if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("-", _S.read(_e, "RG"), 4))) else _S.prop(_S.read(_e, "C"), 0)), _S.binary("+", 0.22, _S.binary("*", 0.4, _S.binary("**", _S.binary("/", _S.read(_e, "d"), _S.read(_e, "RG")), 4)))])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "bright", _S.arg(_args, 2))
	_S.define(_e, "sx", _S.binary("+", _S.read(_e, "GX"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "q"), "a")]), 4.5)))
	_S.define(_e, "sy", _S.binary("+", _S.read(_e, "GY"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "q"), "a")]), 4.5)))
	_S.define(_e, "dx", _S.binary("-", _S.prop(_S.read(_e, "q"), "ex"), _S.read(_e, "sx")))
	_S.define(_e, "dy", _S.binary("-", _S.prop(_S.read(_e, "q"), "ey"), _S.read(_e, "sy")))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	_S.define(_e, "nx", _S.binary("/", _S.unary("-", _S.read(_e, "dy")), _S.read(_e, "L")))
	_S.define(_e, "ny", _S.binary("/", _S.read(_e, "dx"), _S.read(_e, "L")))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rng"), [_S.prop(_S.read(_e, "o"), "seed"), 17, _S.read(_e, "i"), _S.read(_e, "f")]))
	_S.define(_e, "pts", [])
	_S.define(_e, "m", _S.invoke(_S.read(_e, "Math"), "max", [4, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("/", _S.read(_e, "L"), 2.2)])]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "j", 0)
	while _S.truth(_S.binary("<=", _S.read(_v0, "j"), _S.read(_v0, "m"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "u", _S.binary("/", _S.read(_v1, "j"), _S.read(_v1, "m")))
		_S.define(_v1, "w", _S.binary("+", _S.binary("*", _S.binary("*", 3.2, _S.prop(_S.read(_v1, "q"), "w1")), _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v1, "Math"), "PI"), _S.read(_v1, "u"))])), _S.binary("*", _S.binary("*", 1.6, _S.prop(_S.read(_v1, "q"), "w2")), _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v1, "TAU"), _S.read(_v1, "u")), _S.read(_v1, "i"))]))))
		_S.define(_v1, "jit", (_S.invoke(_S.read(_v1, "r"), "range", [_S.unary("-", 0.7), 0.7]) if _S.truth(_S.logical("&&", _S.read(_v1, "j"), func(): return _S.binary("<", _S.read(_v1, "j"), _S.read(_v1, "m")))) else 0))
		_S.invoke(_S.read(_v1, "pts"), "push", [[_S.binary("+", _S.binary("+", _S.read(_v1, "sx"), _S.binary("*", _S.read(_v1, "dx"), _S.read(_v1, "u"))), _S.binary("*", _S.read(_v1, "nx"), _S.binary("+", _S.read(_v1, "w"), _S.read(_v1, "jit")))), _S.binary("+", _S.binary("+", _S.read(_v1, "sy"), _S.binary("*", _S.read(_v1, "dy"), _S.read(_v1, "u"))), _S.binary("*", _S.read(_v1, "ny"), _S.binary("+", _S.read(_v1, "w"), _S.read(_v1, "jit"))))]])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "j", 1, "+=", true)
	_S.define(_e, "paths", [_S.merge([{"pts": _S.read(_e, "pts")}, {"w": 1}])])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "k"), 3)):
		var _v3 = _S.scope(_v2)
		var _v4 = _S.prop(_S.read(_v3, "pts"), _S.binary("-", _S.read(_v3, "m"), 2))
		_S.define(_v3, "bx", _S.prop(_v4, 0))
		_S.define(_v3, "by", _S.prop(_v4, 1))
		_S.define(_v3, "a", _S.binary("+", _S.prop(_S.read(_v3, "q"), "a"), _S.binary("*", _S.binary("-", _S.read(_v3, "k"), 1), _S.invoke(_S.read(_v3, "r"), "range", [0.25, 0.45]))))
		_S.define(_v3, "l", _S.invoke(_S.read(_v3, "r"), "range", [2.5, 5]))
		_S.invoke(_S.read(_v3, "paths"), "push", [_S.merge([{"pts": [[_S.read(_v3, "bx"), _S.read(_v3, "by")], [_S.binary("+", _S.binary("+", _S.read(_v3, "bx"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "l")), 0.5)), _S.invoke(_S.read(_v3, "r"), "range", [_S.unary("-", 0.6), 0.6])), _S.binary("+", _S.binary("+", _S.read(_v3, "by"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "l")), 0.5)), _S.invoke(_S.read(_v3, "r"), "range", [_S.unary("-", 0.6), 0.6]))], [_S.binary("+", _S.read(_v3, "bx"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "l"))), _S.binary("+", _S.read(_v3, "by"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "l")))]]}, {"w": 0.5}])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "k", 1, "+=", true)
	_S.define(_e, "hot", _S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.2))
	for _v5 in _S.array(_S.read(_e, "paths")):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "q2", _v5)
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "j"), _S.binary("-", _S.prop(_S.prop(_S.read(_v7, "q2"), "pts"), "length"), 1))):
			var _v8 = _S.scope(_v7)
			var _v9 = _S.prop(_S.prop(_S.read(_v8, "q2"), "pts"), _S.read(_v8, "j"))
			_S.define(_v8, "ax", _S.prop(_v9, 0))
			_S.define(_v8, "ay", _S.prop(_v9, 1))
			var _v10 = _S.prop(_S.prop(_S.read(_v8, "q2"), "pts"), _S.binary("+", _S.read(_v8, "j"), 1))
			_S.define(_v8, "bx", _S.prop(_v10, 0))
			_S.define(_v8, "by", _S.prop(_v10, 1))
			_S.define(_v8, "u", _S.binary("/", _S.read(_v8, "j"), _S.binary("-", _S.prop(_S.prop(_S.read(_v8, "q2"), "pts"), "length"), 1)))
			if _S.truth(_S.logical("&&", _S.read(_v8, "bright"), func(): return _S.binary(">=", _S.prop(_S.read(_v8, "q2"), "w"), 1))):
				_S.invoke(_S.read(_v8, "p"), "line", [_S.binary("+", _S.read(_v8, "ax"), 1), _S.binary("+", _S.read(_v8, "ay"), 1), _S.binary("+", _S.read(_v8, "bx"), 1), _S.binary("+", _S.read(_v8, "by"), 1), _S.prop(_S.read(_v8, "C"), 3)])
			_S.define(_v8, "c", ((_S.prop(_S.read(_v8, "C"), 3) if _S.truth(_S.binary(">=", _S.prop(_S.read(_v8, "q2"), "w"), 1)) else _S.prop(_S.read(_v8, "C"), 2)) if _S.truth(_S.unary("!", _S.read(_v8, "bright"))) else (_S.prop(_S.read(_v8, "C"), 6) if _S.truth(_S.binary("<", _S.prop(_S.read(_v8, "q2"), "w"), 1)) else (_S.prop(_S.read(_v8, "C"), 6) if _S.truth(_S.logical("||", _S.read(_v8, "hot"), func(): return _S.binary(">", _S.read(_v8, "u"), 0.75))) else (_S.prop(_S.read(_v8, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v8, "u"), 0.2)) else _S.prop(_S.read(_v8, "C"), 5))))))
			_S.invoke(_S.read(_v8, "p"), "line", [_S.read(_v8, "ax"), _S.read(_v8, "ay"), _S.read(_v8, "bx"), _S.read(_v8, "by"), _S.read(_v8, "c")])
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v8, "q2"), "w"), 1), func(): return _S.binary("===", _S.binary("%", _S.read(_v8, "j"), 3), 0))):
				_S.invoke(_S.read(_v8, "p"), "glow", [_S.read(_v8, "ax"), _S.read(_v8, "ay"), (6 if _S.truth(_S.read(_v8, "bright")) else 4), _S.prop(_S.read(_v8, "C"), 4), ((0.4 if _S.truth(_S.read(_v8, "hot")) else 0.24) if _S.truth(_S.read(_v8, "bright")) else 0.12)])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "j", 1, "+=", true)
	if _S.truth(_S.read(_e, "bright")):
		var _v11 = _S.scope(_e)
		_S.invoke(_S.read(_v11, "p"), "circle", [_S.prop(_S.read(_v11, "q"), "ex"), _S.prop(_S.read(_v11, "q"), "ey"), 1.6, _S.prop(_S.read(_v11, "C"), 6)])
		_S.invoke(_S.read(_v11, "p"), "px", [_S.prop(_S.read(_v11, "q"), "ex"), _S.prop(_S.read(_v11, "q"), "ey"), _S.read(_v11, "WHITE")])
		_S.invoke(_S.read(_v11, "p"), "glow", [_S.prop(_S.read(_v11, "q"), "ex"), _S.prop(_S.read(_v11, "q"), "ey"), 9, _S.prop(_S.read(_v11, "C"), 5), 0.55])
		if _S.truth(_S.prop(_S.read(_v11, "q"), "rim")):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "s", _S.unary("-", 1))
			while _S.truth(_S.binary("<=", _S.read(_v12, "s"), 1)):
				_S.invoke(_S.read(_v12, "p"), "px", [_S.binary("+", _S.read(_v12, "GX"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.binary("+", _S.prop(_S.read(_v12, "q"), "a"), _S.binary("*", _S.read(_v12, "s"), 0.09))]), _S.binary("-", _S.read(_v12, "RG"), 0.5))), _S.binary("+", _S.read(_v12, "GY"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.binary("+", _S.prop(_S.read(_v12, "q"), "a"), _S.binary("*", _S.read(_v12, "s"), 0.09))]), _S.binary("-", _S.read(_v12, "RG"), 0.5))), _S.prop(_S.read(_v12, "C"), 6)])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "s", 2, "+=", false)
	else:
		_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "q"), "ex"), _S.prop(_S.read(_e, "q"), "ey"), 6, _S.prop(_S.read(_e, "C"), 4), 0.25])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.logical("&&", _S.unary("!", _S.prop(_S.read(_e, "q"), "front")), func(): return _S.call_value(_S.read(_e, "drawTendril"), [_S.read(_e, "q"), _S.read(_e, "i"), false]))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.logical("&&", _S.prop(_S.read(_e, "q"), "front"), func(): return _S.call_value(_S.read(_e, "drawTendril"), [_S.read(_e, "q"), _S.read(_e, "i"), true]))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "a"), 2.2), func(): return _S.binary("<", _S.read(_e, "a"), 3.3))) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "a"), 0.3), func(): return _S.binary("<", _S.read(_e, "a"), 1.3))) else _S.prop(_S.read(_e, "C"), 3)))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0.25), func(): return _S.binary("<", _S.read(_e, "u"), 0.7))) else _S.prop(_S.read(_e, "C"), 6))
