@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/potion.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "pool", _S.import_value("fx/pickups/_lib.js", "pool"))
	_S.define(_e, "flask", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Potion"}, {"desc": "A round glass flask of glowing brew rocks in the air: the brew sloshes behind the rock, bubbles rise and pop, light glows through the glass, wisps curl off the cork."}, {"tags": ["pickup", "potion", "flask", "brew", "magic", "loop"]}, {"size": [56, 72]}, {"origin": [28, 64]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0516", "#3d0a33", "#701560", "#b0228f", "#f53cd1", "#ff86e6", "#ffd2f6", "#ffffff"]}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RB", 7)
	_S.define(_e, "HOVER", 17)
	_S.define(_e, "NECK", 2)
	_S.define(_e, "LIP", _S.unary("-", 12))
	_S.define(_e, "CORK_TOP", _S.unary("-", 16))
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#120d1a"]))
	_S.define(_e, "GLASS", _S.call_value(_S.read(_e, "hex"), ["#2a2236"]))
	_S.define(_e, "CORK", _S.invoke(["#2a160c", "#4e2c16", "#7a4a26", "#a8703a", "#d09a5a"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [40, 44]))
	_S.define(_e, "pose", _S.function_value(_e, "_f9"))
	_S.define(_e, "surface", _S.function_value(_e, "_f10"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "ph", _S.arg(_args, 3))
	_S.define(_e, "cy", _S.arg(_args, 4))
	_S.define(_e, "tilt", _S.arg(_args, 5))
	_S.define(_e, "seed", _S.arg(_args, 6))
	_S.define(_e, "ct", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "tilt")]))
	_S.define(_e, "st", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "tilt")]))
	_S.invoke(_S.read(_e, "L"), "begin", [_S.unary("-", 20), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cy")]), 22)])
	_S.invoke(_S.read(_e, "L"), "fill", [_S.unary("-", 20), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cy")]), 22), 19, _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cy")]), 12), _S.function_value(_e, "_f1")])
	_S.invoke(_S.invoke(_S.read(_e, "L"), "outline", [_S.read(_e, "INK")]), "draw", [_S.read(_e, "p")])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "a", 3.45)
	while _S.truth(_S.binary("<", _S.read(_v2, "a"), 4.35)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "lx", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.binary("+", _S.read(_v3, "a"), _S.read(_v3, "tilt"))]), _S.binary("-", _S.read(_v3, "RB"), 2.2)))
		_S.define(_v3, "ly", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.binary("+", _S.read(_v3, "a"), _S.read(_v3, "tilt"))]), _S.binary("-", _S.read(_v3, "RB"), 2.2)))
		_S.invoke(_S.read(_v3, "p"), "px", [_S.read(_v3, "lx"), _S.binary("+", _S.read(_v3, "cy"), _S.read(_v3, "ly")), (_S.read(_v3, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v3, "a"), 3.7), func(): return _S.binary("<", _S.read(_v3, "a"), 4.1))) else _S.call_value(_S.read(_v3, "mix"), [_S.read(_v3, "WHITE"), _S.prop(_S.read(_v3, "C"), 6), 0.5]))])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "a", 0.04, "+=", false)
	_S.invoke(_S.read(_e, "p"), "px", [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.binary("*", 2, _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "tilt")])), _S.binary("*", 3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "tilt")])))]), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.read(_e, "cy"), 3)]), _S.read(_e, "WHITE")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), 10, _S.read(_e, "seed"), _S.function_value(_e, "_f2"), _S.function_value(_e, "_f3")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "wx", _S.read(_e, "px"))
	_S.define(_e, "wy", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "cy")))
	_S.define(_e, "fx", _S.binary("+", _S.binary("*", _S.read(_e, "wx"), _S.read(_e, "ct")), _S.binary("*", _S.read(_e, "wy"), _S.read(_e, "st"))))
	_S.define(_e, "fy", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "wx")), _S.read(_e, "st")), _S.binary("*", _S.read(_e, "wy"), _S.read(_e, "ct"))))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "fx"), _S.read(_e, "fy")]))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_e, "fy"), _S.binary("-", _S.read(_e, "LIP"), 0.5)), func(): return _S.binary(">=", _S.read(_e, "fy"), _S.read(_e, "CORK_TOP"))), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "fx")]), _S.binary("+", _S.read(_e, "NECK"), 0.2)))):
		return _S.prop(_S.read(_e, "CORK"), (4 if _S.truth(_S.binary("<", _S.read(_e, "fy"), _S.binary("+", _S.read(_e, "CORK_TOP"), 1))) else (3 if _S.truth(_S.binary("<", _S.read(_e, "fx"), _S.unary("-", 0.6))) else (1 if _S.truth(_S.binary(">", _S.read(_e, "fx"), 1)) else 2))))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "fy"), _S.binary("-", _S.read(_e, "LIP"), 0.5)), func(): return _S.binary("<", _S.read(_e, "fy"), _S.binary("+", _S.read(_e, "LIP"), 1))), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "fx")]), _S.binary("+", _S.read(_e, "NECK"), 1.4)))):
		return (_S.call_value(_S.read(_e, "mix"), [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), 0.4]) if _S.truth(_S.binary("<", _S.read(_e, "fx"), 0)) else _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "GLASS"), _S.prop(_S.read(_e, "C"), 5), 0.45]))
	_S.define(_e, "inNeck", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "fy"), _S.binary("+", _S.read(_e, "LIP"), 1)), func(): return _S.binary("<", _S.read(_e, "fy"), _S.binary("+", _S.unary("-", _S.read(_e, "RB")), 2))), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "fx")]), _S.binary("+", _S.read(_e, "NECK"), 0.6))))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "d"), _S.read(_e, "RB")), func(): return _S.unary("!", _S.read(_e, "inNeck")))):
		return 0
	_S.define(_e, "wall", (_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "fx")]), _S.binary("-", _S.read(_e, "NECK"), 0.5)) if _S.truth(_S.read(_e, "inNeck")) else _S.binary(">", _S.read(_e, "d"), _S.binary("-", _S.read(_e, "RB"), 1))))
	_S.define(_e, "s", _S.call_value(_S.read(_e, "surface"), [_S.read(_e, "wx"), _S.read(_e, "ph")]))
	_S.define(_e, "depth", _S.binary("-", _S.read(_e, "wy"), _S.read(_e, "s")))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.unary("!", _S.read(_e, "wall")), func(): return _S.unary("!", _S.read(_e, "inNeck"))), func(): return _S.binary(">", _S.read(_e, "depth"), 0))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "core", _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v0, "Math"), "hypot", [_S.binary("*", _S.read(_v0, "wx"), 0.85), _S.binary("-", _S.read(_v0, "wy"), 1.8)]), _S.read(_v0, "RB"))))
		if _S.truth(_S.binary("<", _S.read(_v0, "depth"), 0.9)):
			return (_S.read(_v0, "WHITE") if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v0, "wx"), _S.unary("-", 1.5)), func(): return _S.binary(">", _S.read(_v0, "wx"), _S.unary("-", 4.5)))) else _S.prop(_S.read(_v0, "C"), 6))
		_S.define(_v0, "k", (5 if _S.truth(_S.binary(">", _S.read(_v0, "core"), 0.62)) else (4 if _S.truth(_S.binary(">", _S.read(_v0, "core"), 0.38)) else (3 if _S.truth(_S.binary(">", _S.read(_v0, "core"), 0.18)) else 2))))
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v0, "depth"), 1.9), func(): return _S.binary("<", _S.read(_v0, "k"), 5))):
			_S.write(_v0, "k", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v0, "wx"), 1.5), func(): return _S.binary(">", _S.read(_v0, "wy"), 2))):
			_S.write(_v0, "k", 1, "-=", true)
		return _S.prop(_S.read(_v0, "C"), _S.invoke(_S.read(_v0, "Math"), "max", [2, _S.invoke(_S.read(_v0, "Math"), "min", [6, _S.read(_v0, "k")])]))
	if _S.truth(_S.read(_e, "wall")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "lit", _S.binary("/", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_v1, "fx")), 0.75), _S.binary("*", _S.read(_v1, "fy"), 0.66)), _S.invoke(_S.read(_v1, "Math"), "max", [1, _S.read(_v1, "d")])))
		if _S.truth(_S.read(_v1, "inNeck")):
			return (_S.call_value(_S.read(_v1, "mix"), [_S.read(_v1, "GLASS"), _S.prop(_S.read(_v1, "C"), 6), 0.55]) if _S.truth(_S.binary("<", _S.read(_v1, "fx"), 0)) else _S.call_value(_S.read(_v1, "mix"), [_S.read(_v1, "GLASS"), _S.prop(_S.read(_v1, "C"), 5), 0.3]))
		if _S.truth(_S.binary(">", _S.read(_v1, "lit"), 0.82)):
			return _S.call_value(_S.read(_v1, "mix"), [_S.read(_v1, "WHITE"), _S.prop(_S.read(_v1, "C"), 6), 0.3])
		if _S.truth(_S.binary(">", _S.read(_v1, "lit"), 0.3)):
			return _S.call_value(_S.read(_v1, "mix"), [_S.read(_v1, "GLASS"), _S.prop(_S.read(_v1, "C"), 6), 0.5])
		return (_S.prop(_S.read(_v1, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v1, "depth"), 0)) else _S.call_value(_S.read(_v1, "mix"), [_S.read(_v1, "GLASS"), _S.prop(_S.read(_v1, "C"), 5), 0.28]))
	return _S.read(_e, "GLASS")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.7, 1.3])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "x0", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 4), 4]))
	_S.define(_e, "r0", _S.invoke(_S.read(_e, "r"), "range", [0.6, 1.7]))
	_S.define(_e, "vy", _S.invoke(_S.read(_e, "r"), "range", [7, 13]))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [5, 9])), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))]), 0.7)))
	_S.define(_e, "y", _S.binary("-", _S.binary("+", _S.read(_e, "cy"), 5.5), _S.binary("*", _S.read(_e, "vy"), _S.read(_e, "age"))))
	_S.define(_e, "ph2", _S.binary("/", _S.binary("+", _S.read(_e, "t"), _S.read(_e, "age")), _S.prop(_S.read(_e, "meta"), "duration")))
	_S.define(_e, "top", _S.binary("+", _S.read(_e, "cy"), _S.call_value(_S.read(_e, "surface"), [_S.read(_e, "x"), _S.read(_e, "ph2")])))
	if _S.truth(_S.binary(">", _S.read(_e, "y"), _S.binary("+", _S.read(_e, "top"), 0.8))):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "rr", _S.binary("*", _S.read(_v4, "r0"), _S.binary("+", 0.7, _S.binary("*", 0.5, _S.binary("/", _S.read(_v4, "age"), _S.read(_v4, "life"))))))
		if _S.truth(_S.binary(">", _S.invoke(_S.read(_v4, "Math"), "hypot", [_S.read(_v4, "x"), _S.binary("-", _S.read(_v4, "y"), _S.read(_v4, "cy"))]), _S.binary("-", _S.read(_v4, "RB"), 1.5))):
			return null
		if _S.truth(_S.binary("<", _S.read(_v4, "rr"), 0.95)):
			_S.invoke(_S.read(_v4, "p"), "px", [_S.read(_v4, "x"), _S.read(_v4, "y"), _S.prop(_S.read(_v4, "C"), 6)])
		else:
			var _v5 = _S.scope(_v4)
			_S.last([_S.invoke(_S.read(_v5, "p"), "px", [_S.read(_v5, "x"), _S.read(_v5, "y"), _S.prop(_S.read(_v5, "C"), 3)]), _S.invoke(_S.read(_v5, "p"), "px", [_S.binary("+", _S.read(_v5, "x"), 1), _S.read(_v5, "y"), _S.prop(_S.read(_v5, "C"), 6)]), _S.invoke(_S.read(_v5, "p"), "px", [_S.read(_v5, "x"), _S.binary("-", _S.read(_v5, "y"), 1), _S.read(_v5, "WHITE")]), _S.invoke(_S.read(_v5, "p"), "px", [_S.binary("+", _S.read(_v5, "x"), 1), _S.binary("-", _S.read(_v5, "y"), 1), _S.prop(_S.read(_v5, "C"), 6)])])
			if _S.truth(_S.binary(">", _S.read(_v5, "rr"), 1.4)):
				_S.last([_S.invoke(_S.read(_v5, "p"), "px", [_S.binary("-", _S.read(_v5, "x"), 1), _S.read(_v5, "y"), _S.prop(_S.read(_v5, "C"), 5)]), _S.invoke(_S.read(_v5, "p"), "px", [_S.read(_v5, "x"), _S.binary("+", _S.read(_v5, "y"), 1), _S.prop(_S.read(_v5, "C"), 4)])])
		_S.invoke(_S.read(_v4, "p"), "glow", [_S.binary("+", _S.read(_v4, "x"), 0.5), _S.read(_v4, "y"), 3, _S.prop(_S.read(_v4, "C"), 6), 0.15])
	else:
		var _v6 = _S.scope(_e)
		_S.define(_v6, "k", _S.call_value(_S.read(_v6, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v6, "top"), 0.8), _S.read(_v6, "y")), 3)]))
		if _S.truth(_S.binary(">=", _S.read(_v6, "k"), 1)):
			return null
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "a", _S.prop(_S.read(_v7, "Math"), "PI"))
		while _S.truth(_S.binary("<", _S.read(_v7, "a"), _S.read(_v7, "TAU"))):
			_S.invoke(_S.read(_v7, "p"), "dot", [_S.binary("+", _S.read(_v7, "x"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.binary("+", 1, _S.binary("*", _S.read(_v7, "k"), 2)))), _S.binary("+", _S.binary("-", _S.read(_v7, "top"), 0.5), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.binary("+", 1, _S.binary("*", _S.read(_v7, "k"), 2))), 0.5)), (_S.read(_v7, "WHITE") if _S.truth(_S.binary("<", _S.read(_v7, "k"), 0.5)) else _S.prop(_S.read(_v7, "C"), 6)), _S.binary("-", 1.2, _S.read(_v7, "k"))])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "a", 0.6, "+=", false)
		_S.last([_S.invoke(_S.read(_v6, "p"), "dot", [_S.binary("-", _S.read(_v6, "x"), 1), _S.binary("-", _S.binary("-", _S.read(_v6, "top"), 1.5), _S.binary("*", _S.read(_v6, "k"), 3)), _S.prop(_S.read(_v6, "C"), 6), _S.binary("-", 1, _S.read(_v6, "k"))]), _S.invoke(_S.read(_v6, "p"), "dot", [_S.binary("+", _S.read(_v6, "x"), 1.5), _S.binary("-", _S.binary("-", _S.read(_v6, "top"), 2), _S.binary("*", _S.read(_v6, "k"), 4)), _S.read(_v6, "WHITE"), _S.binary("-", 1, _S.read(_v6, "k"))])])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	var _v8 = _S.call_value(_S.read(_e, "pose"), [_S.read(_e, "ph")])
	_S.define(_e, "y", _S.prop(_v8, "y"))
	_S.call_value(_S.read(_e, "blobShadow"), [_S.read(_e, "p"), 0, 7.5, _S.binary("-", 0.8, _S.binary("*", _S.binary("+", _S.binary("-", _S.unary("-", _S.read(_e, "y")), _S.read(_e, "HOVER")), 1.4), 0.06))])
	_S.call_value(_S.read(_e, "pool"), [_S.read(_e, "p"), 0, 0.5, 18, 3, _S.prop(_S.read(_e, "C"), 5), 0.3])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), 7, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 1), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [1.2, 1.8])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "side", _S.invoke(_S.read(_e, "r"), "sign", []))
	_S.define(_e, "f", _S.invoke(_S.read(_e, "r"), "range", [3, 4.5]))
	_S.define(_e, "ph0", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "vy", _S.invoke(_S.read(_e, "r"), "range", [11, 16]))
	_S.define(_e, "x0", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1), 1]))
	_S.define(_e, "at", _S.function_value(_e, "_f7"))
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), 9)):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "a", _S.binary("-", _S.read(_v10, "age"), _S.binary("*", _S.read(_v10, "i"), 0.04)))
		if _S.truth(_S.binary("<", _S.read(_v10, "a"), 0)):
			break
		var _v11 = _S.call_value(_S.read(_v10, "at"), [_S.read(_v10, "a")])
		_S.define(_v10, "x", _S.prop(_v11, 0))
		_S.define(_v10, "yy", _S.prop(_v11, 1))
		_S.define(_v10, "k", _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_v10, "a"), _S.read(_v10, "life"))), _S.invoke(_S.read(_v10, "Math"), "min", [1, _S.binary("/", _S.read(_v10, "a"), 0.15)])), _S.binary("-", 1, _S.binary("/", _S.read(_v10, "i"), 9))))
		_S.invoke(_S.read(_v10, "p"), "dot", [_S.read(_v10, "x"), _S.read(_v10, "yy"), (_S.read(_v10, "WHITE") if _S.truth(_S.binary("===", _S.read(_v10, "i"), 0)) else (_S.prop(_S.read(_v10, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v10, "i"), 3)) else _S.prop(_S.read(_v10, "C"), 5))), _S.binary("*", _S.read(_v10, "k"), 1.4)])
		if _S.truth(_S.binary("===", _S.read(_v10, "i"), 0)):
			_S.invoke(_S.read(_v10, "p"), "glow", [_S.read(_v10, "x"), _S.read(_v10, "yy"), 4, _S.prop(_S.read(_v10, "C"), 5), _S.binary("*", 0.3, _S.read(_v10, "k"))])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return [_S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "a"), _S.read(_e, "f")), _S.read(_e, "ph0"))]), _S.binary("+", 0.8, _S.binary("*", _S.read(_e, "a"), 3.2))), _S.read(_e, "side"))), _S.binary("-", _S.binary("-", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "CORK_TOP")), 1), _S.binary("*", _S.read(_e, "a"), _S.read(_e, "vy")))]

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	var _v12 = _S.call_value(_S.read(_e, "pose"), [_S.read(_e, "ph")])
	_S.define(_e, "y", _S.prop(_v12, "y"))
	_S.define(_e, "tilt", _S.prop(_v12, "tilt"))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.read(_e, "y"), 1.5), 26, _S.prop(_S.read(_e, "C"), 4), 0.22])
	_S.call_value(_S.read(_e, "flask"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "ph"), _S.read(_e, "y"), _S.read(_e, "tilt"), _S.prop(_S.read(_e, "o"), "seed")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.read(_e, "y"), 2), 10, _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.38, _S.binary("*", 0.08, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2)])))])
	_S.define(_e, "g", _S.binary("/", _S.binary("%", _S.binary("+", _S.read(_e, "ph"), 0.2), 0.5), 0.5))
	if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.16)):
		_S.call_value(_S.read(_e, "glint"), [_S.read(_e, "p"), _S.unary("-", 4), _S.binary("-", _S.read(_e, "y"), 4), _S.binary("*", 2.6, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "g"), 0.16), _S.prop(_S.read(_e, "Math"), "PI"))])), _S.read(_e, "WHITE"), 0.4])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ph", _S.arg(_args, 0))
	return _S.merge([{"y": _S.binary("-", _S.unary("-", _S.read(_e, "HOVER")), _S.binary("*", 1.4, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))])))}, {"tilt": _S.binary("*", 0.13, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 0.4)]))}])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "ph", _S.arg(_args, 1))
	return _S.binary("+", _S.binary("+", _S.unary("-", 0.5), _S.binary("*", _S.binary("*", 0.17, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 0.9)])), _S.read(_e, "x"))), _S.binary("*", 0.45, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "x"), 0.85), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 3))])))
