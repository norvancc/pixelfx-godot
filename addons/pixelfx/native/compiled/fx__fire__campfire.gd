@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/campfire.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "flameTongue", _S.import_value("fx/fire/_lib.js", "flameTongue"))
	_S.define(_e, "firePuff", _S.import_value("fx/fire/_lib.js", "firePuff"))
	_S.define(_e, "lick", _S.import_value("fx/fire/_lib.js", "lick"))
	_S.define(_e, "smokePuff", _S.import_value("fx/fire/_lib.js", "smokePuff"))
	_S.define(_e, "ember", _S.import_value("fx/fire/_lib.js", "ember"))
	_S.define(_e, "spark", _S.import_value("fx/fire/_lib.js", "spark"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "sparkAt", _S.import_value("fx/fire/_lib.js", "sparkAt"))
	_S.define(_e, "floorLight", _S.import_value("fx/fire/_lib.js", "floorLight"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "BACK_LAYERS", _S.import_value("fx/fire/_lib.js", "BACK_LAYERS"))
	_S.define(_e, "log", _S.function_value(_e, "_f0"))
	_S.define(_e, "coals", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Campfire"}, {"desc": "Crossed logs on a bed of coals and a lively fire: tongues that lick and leap, popping sparks, embers drifting up, smoke curling off, a warm pool of light."}, {"tags": ["fire", "campfire", "prop", "light", "smoke", "ambient", "loop"]}, {"size": [128, 128]}, {"origin": [64, 112]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"wood": ["#0e080a", "#24130f", "#3b2216", "#5a3520", "#8a5a34", "#b9884f"]}, {"height": 22}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "SMOKE1", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "ASH", [_S.call_value(_S.read(_e, "hex"), ["#2a2530"]), _S.call_value(_S.read(_e, "hex"), ["#4a4350"]), _S.call_value(_S.read(_e, "hex"), ["#6b6270"])])
	_S.define(_e, "LOGS", [[_S.unary("-", 19), 2, 15, _S.unary("-", 12), 3.4], [19, 2, _S.unary("-", 15), _S.unary("-", 12), 3.4]])
	_S.define(_e, "CROSS", 0.56)
	_S.define(_e, "BIG_LAYERS", [[1, 1, 6], [0.8, 0.9, 5], [0.62, 0.78, 4], [0.44, 0.6, 3], [0.26, 0.4, 1], [0.12, 0.22, 0]])
	_S.define(_e, "TONGUES", [[_S.unary("-", 7.5), _S.unary("-", 7), 0.42, 1.8, 1], [7.5, _S.unary("-", 7), 0.46, 1.8, 1], [_S.unary("-", 3), _S.unary("-", 9), 0.78, 2, 1], [3.2, _S.unary("-", 9), 0.82, 2, 1], [_S.unary("-", 12), _S.unary("-", 3), 0.14, 1.3, 0], [12.5, _S.unary("-", 3), 0.16, 1.3, 0], [_S.unary("-", 9.5), _S.unary("-", 4.5), 0.3, 1.9, 0], [9.5, _S.unary("-", 4.5), 0.34, 1.9, 0], [_S.unary("-", 5), _S.unary("-", 6), 0.6, 2.6, 0], [5.2, _S.unary("-", 6), 0.66, 2.6, 0], [0, _S.unary("-", 7), 1, 3.4, 0]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "W", _S.arg(_args, 2))
	_S.define(_e, "H", _S.arg(_args, 3))
	_S.define(_e, "u0", _S.arg(_args, 4))
	_S.define(_e, "u1", _S.arg(_args, 5))
	_S.define(_e, "t", _S.arg(_args, 6))
	_S.define(_e, "S", _S.arg(_args, 7))
	var _v0 = _S.read(_e, "L")
	_S.define(_e, "x0", _S.prop(_v0, 0))
	_S.define(_e, "y0", _S.prop(_v0, 1))
	_S.define(_e, "x1", _S.prop(_v0, 2))
	_S.define(_e, "y1", _S.prop(_v0, 3))
	_S.define(_e, "r", _S.prop(_v0, 4))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0")))
	_S.define(_e, "len", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	_S.define(_e, "ax", _S.binary("/", _S.read(_e, "dx"), _S.read(_e, "len")))
	_S.define(_e, "ay", _S.binary("/", _S.read(_e, "dy"), _S.read(_e, "len")))
	_S.define(_e, "nx", _S.unary("-", _S.read(_e, "ay")))
	_S.define(_e, "ny", _S.read(_e, "ax"))
	if _S.truth(_S.binary("<", _S.read(_e, "ny"), 0)):
		_S.last([_S.write(_e, "nx", _S.unary("-", _S.read(_e, "nx")), "=", false), _S.write(_e, "ny", _S.unary("-", _S.read(_e, "ny")), "=", false)])
	_S.define(_e, "rim", _S.binary("-", 1, _S.binary("/", 1.05, _S.read(_e, "r"))))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "x0"), _S.read(_e, "x1")]), _S.read(_e, "r")), 1), _S.binary("-", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "y0"), _S.read(_e, "y1")]), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "x0"), _S.read(_e, "x1")]), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "y0"), _S.read(_e, "y1")]), _S.read(_e, "r")), 1), _S.function_value(_e, "_f1")])
	if _S.truth(_S.binary("<=", _S.read(_e, "u0"), 0)):
		_S.invoke(_S.read(_e, "p"), "ellipse", [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.binary("*", _S.read(_e, "r"), 0.62), _S.binary("+", _S.read(_e, "r"), 0.2), _S.function_value(_e, "_f2")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "along", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "x0")), _S.read(_e, "ax")), _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "y0")), _S.read(_e, "ay"))))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "along"), _S.read(_e, "len")))
	_S.define(_e, "s", _S.binary("/", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "x0")), _S.read(_e, "nx")), _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "y0")), _S.read(_e, "ny"))), _S.read(_e, "r")))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "u"), _S.read(_e, "u0")), func(): return _S.binary(">", _S.read(_e, "u"), _S.read(_e, "u1"))), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "s")]), 1))):
		return null
	_S.define(_e, "burn", _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1.2, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 8))]))
	_S.define(_e, "lane", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.binary("*", _S.read(_e, "s"), _S.read(_e, "r")), 0.85)]))
	_S.define(_e, "run", _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "along"), 3)]), _S.read(_e, "lane"), _S.read(_e, "S")]))
	if _S.truth(_S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "s")]), _S.read(_e, "rim")), func(): return _S.binary(">", _S.read(_e, "along"), _S.binary("-", _S.read(_e, "len"), 1)))):
		return (_S.prop(_S.read(_e, "H"), 7) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "s"), 0), func(): return _S.binary(">", _S.read(_e, "burn"), 0.4))) else _S.prop(_S.read(_e, "W"), 0))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "burn"), 0.35), func(): return _S.binary("<", _S.read(_e, "lane"), 2))):
		var _v1 = _S.scope(_e)
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v1, "run"), 0.55), func(): return _S.binary(">", _S.read(_v1, "lane"), _S.unary("-", 2)))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "g", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v2, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v2, "t"), _S.read(_v2, "D")), _S.prop(_S.read(_v2, "Math"), "PI")), 6), _S.binary("*", _S.call_value(_S.read(_v2, "rand"), [_S.invoke(_S.read(_v2, "Math"), "floor", [_S.binary("/", _S.read(_v2, "along"), 2)]), _S.read(_v2, "lane"), _S.binary("+", _S.read(_v2, "S"), 1)]), 6.3))]))))
			_S.set_prop(_S.read(_v2, "out"), "k", _S.binary("*", _S.binary("*", 0.3, _S.read(_v2, "burn")), _S.read(_v2, "g")), "=", false)
			return (_S.prop(_S.read(_v2, "H"), 3) if _S.truth(_S.binary(">", _S.read(_v2, "g"), 0.72)) else (_S.prop(_S.read(_v2, "H"), 4) if _S.truth(_S.binary(">", _S.read(_v2, "g"), 0.4)) else _S.prop(_S.read(_v2, "H"), 5)))
		return (_S.prop(_S.read(_v1, "W"), 1) if _S.truth(_S.binary("<", _S.read(_v1, "lane"), _S.unary("-", 1))) else _S.prop(_S.read(_v1, "W"), 0))
	if _S.truth(_S.binary("<=", _S.read(_e, "lane"), _S.unary("-", 2))):
		return (_S.prop(_S.read(_e, "W"), 2) if _S.truth(_S.binary("<", _S.read(_e, "run"), 0.25)) else _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "W"), 3), _S.prop(_S.read(_e, "H"), 4), _S.binary("*", 0.45, _S.read(_e, "burn"))]))
	if _S.truth(_S.binary("===", _S.read(_e, "lane"), _S.unary("-", 1))):
		return (_S.prop(_S.read(_e, "W"), 1) if _S.truth(_S.binary("<", _S.read(_e, "run"), 0.45)) else _S.prop(_S.read(_e, "W"), 2))
	if _S.truth(_S.binary("===", _S.read(_e, "lane"), 0)):
		return (_S.prop(_S.read(_e, "W"), 1) if _S.truth(_S.binary("<", _S.read(_e, "run"), 0.2)) else _S.prop(_S.read(_e, "W"), 2))
	return (_S.prop(_S.read(_e, "W"), 0) if _S.truth(_S.binary("<", _S.read(_e, "run"), 0.4)) else _S.prop(_S.read(_e, "W"), 1))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "W"), 0) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.78)) else (_S.prop(_S.read(_e, "W"), 5) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.56)) else (_S.prop(_S.read(_e, "W"), 4) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.32)) else _S.prop(_S.read(_e, "W"), 3))))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "W", _S.arg(_args, 1))
	_S.define(_e, "H", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "S", _S.arg(_args, 4))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 15), _S.unary("-", 3), 15, 2, _S.function_value(_e, "_f4")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("/", _S.read(_e, "x"), 14))
	_S.define(_e, "dy", _S.binary("/", _S.binary("+", _S.read(_e, "y"), 0.3), 2.2))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy"))))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		return null
	_S.define(_e, "h", _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "x"), 2)]), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), _S.binary("+", _S.read(_e, "S"), 20)]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "d"), 0.55), func(): return _S.binary("<", _S.read(_e, "h"), 0.55))):
		return _S.prop(_S.read(_e, "ASH"), (2 if _S.truth(_S.binary("<", _S.read(_e, "h"), 0.15)) else (1 if _S.truth(_S.binary("<", _S.read(_e, "h"), 0.32)) else 0)))
	if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.5)):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "g", _S.binary("*", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v3, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v3, "t"), _S.read(_v3, "D")), _S.prop(_S.read(_v3, "Math"), "PI")), 4), _S.binary("*", _S.read(_v3, "h"), 40))]))), _S.binary("-", 1.1, _S.read(_v3, "d"))))
		_S.set_prop(_S.read(_v3, "out"), "k", _S.binary("*", 0.35, _S.read(_v3, "g")), "=", false)
		return (_S.prop(_S.read(_v3, "H"), 2) if _S.truth(_S.binary(">", _S.read(_v3, "g"), 0.7)) else (_S.prop(_S.read(_v3, "H"), 3) if _S.truth(_S.binary(">", _S.read(_v3, "g"), 0.5)) else (_S.prop(_S.read(_v3, "H"), 4) if _S.truth(_S.binary(">", _S.read(_v3, "g"), 0.3)) else _S.prop(_S.read(_v3, "H"), 5))))
	return (_S.prop(_S.read(_e, "W"), 1) if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.3)) else _S.prop(_S.read(_e, "W"), 0))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "hotFirst"), [_S.read(_e, "F")]))
	_S.define(_e, "W", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "wood"), 6]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.read(_e, "S")]))
	_S.define(_e, "HC", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "N", _S.function_value(_e, "_f6"))
	_S.define(_e, "fla", _S.function_value(_e, "_f7"))
	_S.define(_e, "fl", _S.call_value(_S.read(_e, "fla"), [_S.read(_e, "t")]))
	_S.define(_e, "GLOW", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), 0.5]), _S.read(_e, "WHITE"), 0.25]))
	_S.define(_e, "SMOKE", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "SMOKE1"), _S.prop(_S.read(_e, "H"), 6), 0.25]))
	_S.define(_e, "SPARKS", [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 5)])
	_S.define(_e, "EMB", [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 6)])
	_S.define(_e, "T", _S.invoke(_S.read(_e, "TONGUES"), "map", [_S.function_value(_e, "_f8")]))
	_S.define(_e, "lean", _S.function_value(_e, "_f9"))
	_S.define(_e, "height", _S.function_value(_e, "_f10"))
	_S.define(_e, "sweep", _S.function_value(_e, "_f11"))
	_S.define(_e, "tip", _S.function_value(_e, "_f12"))
	_S.define(_e, "tongueAt", _S.function_value(_e, "_f13"))
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 48, _S.binary("+", _S.read(_e, "S"), 300), _S.function_value(_e, "_f14"), _S.function_value(_e, "_f15")])
	_S.define(_e, "puffs", [])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.binary("*", _S.prop(_S.read(_e, "T"), "length"), 24), _S.binary("+", _S.read(_e, "S"), 200), _S.function_value(_e, "_f16"), _S.function_value(_e, "_f17")])
	_S.call_value(_S.read(_e, "coals"), [_S.read(_e, "p"), _S.read(_e, "W"), _S.read(_e, "H"), _S.read(_e, "t"), _S.read(_e, "S")])
	for _v11 in _S.array(_S.read(_e, "LOGS")):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "L", _v11)
		_S.call_value(_S.read(_v12, "log"), [_S.read(_v12, "p"), _S.read(_v12, "L"), _S.read(_v12, "W"), _S.read(_v12, "H"), _S.read(_v12, "CROSS"), 1, _S.read(_v12, "t"), _S.binary("+", _S.read(_v12, "S"), 11)])
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), _S.prop(_S.read(_v13, "T"), "length"))):
		if _S.truth(_S.prop(_S.prop(_S.read(_v13, "T"), _S.read(_v13, "i")), "back")):
			_S.call_value(_S.read(_v13, "tongueAt"), [_S.read(_v13, "i")])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 90, _S.binary("+", _S.read(_e, "S"), 210), _S.function_value(_e, "_f18"), _S.function_value(_e, "_f19")])
	var _v15 = _S.scope(_e)
	_S.define(_v15, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v15, "i"), _S.prop(_S.read(_v15, "T"), "length"))):
		if _S.truth(_S.unary("!", _S.prop(_S.prop(_S.read(_v15, "T"), _S.read(_v15, "i")), "back"))):
			_S.call_value(_S.read(_v15, "tongueAt"), [_S.read(_v15, "i")])
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.binary("*", _S.prop(_S.read(_e, "T"), "length"), 12), _S.binary("+", _S.read(_e, "S"), 220), _S.function_value(_e, "_f20"), _S.function_value(_e, "_f21")])
	for _v17 in _S.array(_S.read(_e, "puffs")):
		var _v18 = _S.scope(_e)
		var _v19 = _v17
		_S.define(_v18, "x", _S.prop(_v19, 0))
		_S.define(_v18, "y", _S.prop(_v19, 1))
		_S.define(_v18, "k", _S.prop(_v19, 2))
		_S.define(_v18, "s", _S.prop(_v19, 3))
		_S.define(_v18, "f", _S.prop(_v19, 4))
		_S.call_value(_S.read(_v18, "firePuff"), [_S.read(_v18, "p"), _S.read(_v18, "x"), _S.read(_v18, "y"), _S.read(_v18, "k"), _S.read(_v18, "s"), _S.read(_v18, "f"), _S.read(_v18, "H")])
	for _v20 in _S.array(_S.read(_e, "LOGS")):
		var _v21 = _S.scope(_e)
		_S.define(_v21, "L", _v20)
		_S.call_value(_S.read(_v21, "log"), [_S.read(_v21, "p"), _S.read(_v21, "L"), _S.read(_v21, "W"), _S.read(_v21, "H"), 0, _S.read(_v21, "CROSS"), _S.read(_v21, "t"), _S.binary("+", _S.read(_v21, "S"), 11)])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 4, _S.binary("+", _S.read(_e, "S"), 400), _S.function_value(_e, "_f22"), _S.function_value(_e, "_f23")])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 36, _S.binary("+", _S.read(_e, "S"), 500), _S.function_value(_e, "_f24"), _S.function_value(_e, "_f25")])
	_S.define(_e, "br", _S.binary("+", 0.92, _S.binary("*", 0.08, _S.call_value(_S.read(_e, "N"), [0.67, _S.binary("+", _S.read(_e, "S"), 3)]))))
	_S.define(_e, "lx", _S.binary("*", _S.call_value(_S.read(_e, "lean"), [_S.read(_e, "t")]), 12))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "lx"), _S.unary("-", 8), _S.binary("*", _S.binary("*", 74, _S.read(_e, "br")), _S.binary("+", 0.9, _S.binary("*", 0.1, _S.read(_e, "fl")))), _S.read(_e, "GLOW"), _S.binary("*", 0.3, _S.read(_e, "fl"))])
	for _v27 in _S.array([[_S.unary("-", 6), _S.unary("-", 17), 0.85], [0, _S.unary("-", 21), 1], [6, _S.unary("-", 17), 0.85]]):
		var _v28 = _S.scope(_e)
		var _v29 = _v27
		_S.define(_v28, "x", _S.prop(_v29, 0))
		_S.define(_v28, "y", _S.prop(_v29, 1))
		_S.define(_v28, "k", _S.prop(_v29, 2))
		var _v30 = _S.scope(_v28)
		_S.invoke(_S.read(_v30, "p"), "glow", [_S.binary("+", _S.read(_v30, "x"), _S.read(_v30, "lx")), _S.read(_v30, "y"), _S.binary("*", 46, _S.read(_v30, "br")), _S.read(_v30, "GLOW"), _S.binary("*", _S.binary("*", 0.3, _S.read(_v30, "k")), _S.read(_v30, "fl"))])
		_S.invoke(_S.read(_v30, "p"), "glow", [_S.binary("*", _S.read(_v30, "x"), 0.6), _S.binary("+", _S.read(_v30, "y"), 13), 15, _S.prop(_S.read(_v30, "H"), 2), _S.binary("*", _S.binary("*", 0.16, _S.read(_v30, "k")), _S.read(_v30, "fl"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 3), 9, _S.prop(_S.read(_e, "H"), 0), _S.binary("*", 0.16, _S.read(_e, "fl"))])
	_S.call_value(_S.read(_e, "floorLight"), [_S.read(_e, "p"), 0, 0.5, 48, 8, _S.read(_e, "GLOW"), _S.binary("*", 0.3, _S.read(_e, "fl"))])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rate", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	_S.define(_e, "off", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), _S.read(_e, "rate"), _S.read(_e, "seed"), _S.read(_e, "off")])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", 0.74, _S.binary("*", 0.16, _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "tt"), 7.3, _S.binary("+", _S.read(_e, "S"), 1)]))), _S.binary("*", 0.1, _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "tt"), 19, _S.binary("+", _S.read(_e, "S"), 2)])))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v4 = _S.arg(_args, 0)
	_S.define(_e, "dx", _S.prop(_v4, 0))
	_S.define(_e, "y", _S.prop(_v4, 1))
	_S.define(_e, "h", _S.prop(_v4, 2))
	_S.define(_e, "w", _S.prop(_v4, 3))
	_S.define(_e, "back", _S.prop(_v4, 4))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"dx": _S.binary("+", _S.read(_e, "dx"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.4), 0.4]))}, {"y": _S.read(_e, "y")}, {"h": _S.binary("+", 3, _S.binary("*", _S.binary("*", _S.read(_e, "HC"), _S.read(_e, "h")), _S.invoke(_S.read(_e, "R"), "range", [0.92, 1.08])))}, {"w": _S.binary("*", _S.read(_e, "w"), _S.invoke(_S.read(_e, "R"), "range", [0.9, 1.1]))}, {"back": _S.read(_e, "back")}, {"env": _S.read(_e, "h")}, {"n": _S.binary("*", _S.binary("+", _S.binary("*", _S.read(_e, "S"), 7), _S.read(_e, "i")), 13)}])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("*", _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "tt"), 0.67, _S.binary("+", _S.read(_e, "S"), 90)]), 0.12)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	var _v5 = _S.prop(_S.read(_e, "T"), _S.read(_e, "i"))
	_S.define(_e, "h", _S.prop(_v5, "h"))
	_S.define(_e, "n", _S.prop(_v5, "n"))
	_S.define(_e, "leap", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "tt"), 2.6, _S.binary("+", _S.read(_e, "n"), 70)]), 0.55)]), 1.4))
	return _S.binary("*", _S.binary("+", _S.binary("+", _S.read(_e, "h"), _S.binary("*", _S.binary("*", 0.25, _S.read(_e, "h")), _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "tt"), 3.3, _S.read(_e, "n")]))), _S.binary("*", _S.read(_e, "h"), _S.read(_e, "leap"))), _S.binary("+", 0.9, _S.binary("*", 0.1, _S.call_value(_S.read(_e, "fla"), [_S.read(_e, "tt")]))))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	_S.define(_e, "h", _S.arg(_args, 2))
	return _S.binary("-", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "tt"), 2.2, _S.binary("+", _S.prop(_S.prop(_S.read(_e, "T"), _S.read(_e, "i")), "n"), 40)]), _S.binary("+", 1, _S.binary("*", _S.read(_e, "h"), 0.08))), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "lean"), [_S.read(_e, "tt")]), _S.read(_e, "h")), 0.9)), _S.call_value(_S.read(_e, "clamp"), [_S.binary("*", _S.prop(_S.prop(_S.read(_e, "T"), _S.read(_e, "i")), "dx"), 0.3), _S.unary("-", 2.5), 2.5]))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "height"), [_S.read(_e, "i"), _S.read(_e, "tt")]))
	return [_S.binary("+", _S.prop(_S.prop(_S.read(_e, "T"), _S.read(_e, "i")), "dx"), _S.binary("*", _S.call_value(_S.read(_e, "sweep"), [_S.read(_e, "i"), _S.read(_e, "tt"), _S.read(_e, "h")]), 0.85)), _S.binary("+", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "T"), _S.read(_e, "i")), "y"), _S.binary("*", _S.read(_e, "h"), 0.88)), 3), _S.read(_e, "h")]

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	var _v6 = _S.prop(_S.read(_e, "T"), _S.read(_e, "i"))
	_S.define(_e, "dx", _S.prop(_v6, "dx"))
	_S.define(_e, "y", _S.prop(_v6, "y"))
	_S.define(_e, "w", _S.prop(_v6, "w"))
	_S.define(_e, "n", _S.prop(_v6, "n"))
	_S.define(_e, "back", _S.prop(_v6, "back"))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "height"), [_S.read(_e, "i"), _S.read(_e, "t")]))
	_S.call_value(_S.read(_e, "flameTongue"), [_S.read(_e, "p"), _S.read(_e, "dx"), _S.read(_e, "y"), _S.read(_e, "h"), _S.read(_e, "w"), _S.call_value(_S.read(_e, "sweep"), [_S.read(_e, "i"), _S.read(_e, "t"), _S.read(_e, "h")]), _S.read(_e, "N"), _S.read(_e, "n"), _S.read(_e, "H"), (_S.read(_e, "BACK_LAYERS") if _S.truth(_S.read(_e, "back")) else (_S.read(_e, "BIG_LAYERS") if _S.truth(_S.binary(">", _S.read(_e, "w"), 2.2)) else _S.read(_e, "LAYERS"))), 0.5, _S.binary("+", 1.1, _S.binary("*", _S.read(_e, "h"), 0.04))])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"x": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 5), 5])}, {"y": _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_e, "HC")), 0.8), _S.invoke(_S.read(_e, "r"), "range", [0, 8]))}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 2), 2])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [10, 17]))}, {"life": _S.invoke(_S.read(_e, "r"), "range", [2, 2.9])}, {"s": _S.invoke(_S.read(_e, "r"), "range", [2.4, 3.8])}])

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v7 = _S.call_value(_S.read(_e, "drift"), [_S.prop(_S.read(_e, "q"), "x"), _S.prop(_S.read(_e, "q"), "y"), _S.prop(_S.read(_e, "q"), "vx"), _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"), 4, _S.unary("-", 20), 1.6, 1])
	_S.define(_e, "x", _S.prop(_v7, 0))
	_S.define(_e, "y", _S.prop(_v7, 1))
	_S.call_value(_S.read(_e, "smokePuff"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.call_value(_S.read(_e, "NL"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), 0.8, _S.binary("+", _S.read(_e, "S"), 60)]), _S.binary("+", 2, _S.binary("*", 3, _S.read(_e, "age"))))), _S.read(_e, "y"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))), _S.prop(_S.read(_e, "q"), "s"), _S.read(_e, "SMOKE")])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	_S.define(_e, "i", _S.binary("%", _S.read(_e, "j"), _S.prop(_S.read(_e, "T"), "length")))
	_S.define(_e, "fire", _S.invoke(_S.read(_e, "r"), "range", [0.14, 0.3]))
	_S.define(_e, "smokes", _S.invoke(_S.read(_e, "r"), "chance", [0.45]))
	return _S.merge([{"i": _S.read(_e, "i")}, {"fire": _S.read(_e, "fire")}, {"smokes": _S.read(_e, "smokes")}, {"sl": _S.invoke(_S.read(_e, "r"), "range", [0.8, 1.4])}, {"ox": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1), 1])}, {"oy": _S.invoke(_S.read(_e, "r"), "range", [0, 4])}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 4), 4])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [15, 30]))}, {"s": _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0.8, 1.6]), _S.binary("+", 0.8, _S.binary("*", 0.6, _S.prop(_S.prop(_S.read(_e, "T"), _S.read(_e, "i")), "env"))))}, {"f": _S.invoke(_S.read(_e, "r"), "next", [])}, {"life": _S.binary("+", _S.read(_e, "fire"), (1.4 if _S.truth(_S.read(_e, "smokes")) else 0))}])

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v8 = _S.call_value(_S.read(_e, "tip"), [_S.prop(_S.read(_e, "q"), "i"), _S.binary("-", _S.read(_e, "t"), _S.read(_e, "age"))])
	_S.define(_e, "tx", _S.prop(_v8, 0))
	_S.define(_e, "ty", _S.prop(_v8, 1))
	var _v9 = _S.call_value(_S.read(_e, "drift"), [_S.binary("+", _S.read(_e, "tx"), _S.prop(_S.read(_e, "q"), "ox")), _S.binary("+", _S.read(_e, "ty"), _S.prop(_S.read(_e, "q"), "oy")), _S.prop(_S.read(_e, "q"), "vx"), _S.prop(_S.read(_e, "q"), "vy"), _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fire")]), 0, _S.unary("-", 95), 5, 3.2])
	_S.define(_e, "x", _S.prop(_v9, 0))
	_S.define(_e, "y", _S.prop(_v9, 1))
	_S.define(_e, "vx", _S.prop(_v9, 2))
	_S.define(_e, "vy", _S.prop(_v9, 3))
	if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fire"))):
		return _S.invoke(_S.read(_e, "puffs"), "push", [[_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fire"))), _S.prop(_S.read(_e, "q"), "s"), _S.prop(_S.read(_e, "q"), "f")]])
	if _S.truth(_S.binary(">", _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fire")), _S.prop(_S.read(_e, "q"), "sl"))):
		return null
	var _v10 = _S.call_value(_S.read(_e, "drift"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.read(_e, "vx"), 0.6), _S.binary("-", _S.binary("*", _S.read(_e, "vy"), 0.6), 6), _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fire")), 2, _S.unary("-", 16), 1.6, 1.2])
	_S.define(_e, "sx", _S.prop(_v10, 0))
	_S.define(_e, "sy", _S.prop(_v10, 1))
	_S.call_value(_S.read(_e, "smokePuff"), [_S.read(_e, "p"), _S.read(_e, "sx"), _S.read(_e, "sy"), _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fire")), _S.prop(_S.read(_e, "q"), "sl"))), _S.binary("*", _S.prop(_S.read(_e, "q"), "s"), 0.7), 0])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"x": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 10), 10])}, {"y": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [3, 8]))}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 5), 5])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [20, 40]))}, {"life": _S.invoke(_S.read(_e, "r"), "range", [0.16, 0.3])}, {"s": _S.invoke(_S.read(_e, "r"), "range", [1, 1.8])}, {"f": _S.invoke(_S.read(_e, "r"), "next", [])}])

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v14 = _S.call_value(_S.read(_e, "drift"), [_S.prop(_S.read(_e, "q"), "x"), _S.prop(_S.read(_e, "q"), "y"), _S.prop(_S.read(_e, "q"), "vx"), _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"), 0, _S.unary("-", 95), 5, 3.2])
	_S.define(_e, "x", _S.prop(_v14, 0))
	_S.define(_e, "y", _S.prop(_v14, 1))
	_S.call_value(_S.read(_e, "firePuff"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))), _S.prop(_S.read(_e, "q"), "s"), _S.prop(_S.read(_e, "q"), "f"), _S.read(_e, "H")])
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.merge([{"i": _S.binary("%", _S.read(_e, "j"), _S.prop(_S.read(_e, "T"), "length"))}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 3), 3])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [12, 22]))}, {"s": _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0.9, 1.6]), _S.binary("+", 0.8, _S.binary("*", 0.5, _S.prop(_S.prop(_S.read(_e, "T"), _S.binary("%", _S.read(_e, "j"), _S.prop(_S.read(_e, "T"), "length"))), "env"))))}, {"life": 0.26}])

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v16 = _S.call_value(_S.read(_e, "tip"), [_S.prop(_S.read(_e, "q"), "i"), _S.binary("-", _S.read(_e, "t"), _S.read(_e, "age"))])
	_S.define(_e, "tx", _S.prop(_v16, 0))
	_S.define(_e, "ty", _S.prop(_v16, 1))
	_S.call_value(_S.read(_e, "lick"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "tx"), _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), _S.read(_e, "age"))), _S.binary("+", _S.binary("-", _S.read(_e, "ty"), 2), _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"))), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))), _S.prop(_S.read(_e, "q"), "s"), _S.read(_e, "H")])
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"x": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 9), 9])}, {"y": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [4, 9]))}, {"n": _S.invoke(_S.read(_e, "r"), "int", [3, 5])}, {"seed": _S.invoke(_S.read(_e, "r"), "int", [0, 1000000])}, {"life": 0.7}])

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	if _S.truth(_S.binary("<", _S.read(_e, "age"), 0.08)):
		var _v22 = _S.scope(_e)
		_S.invoke(_S.read(_v22, "p"), "px", [_S.prop(_S.read(_v22, "q"), "x"), _S.prop(_S.read(_v22, "q"), "y"), _S.read(_v22, "WHITE")])
		_S.invoke(_S.read(_v22, "p"), "glow", [_S.prop(_S.read(_v22, "q"), "x"), _S.prop(_S.read(_v22, "q"), "y"), 12, _S.prop(_S.read(_v22, "H"), 1), _S.binary("*", 0.7, _S.binary("-", 1, _S.binary("/", _S.read(_v22, "age"), 0.08)))])
	_S.define(_e, "r", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "q"), "seed")]))
	var _v23 = _S.scope(_e)
	_S.define(_v23, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v23, "j"), _S.prop(_S.read(_v23, "q"), "n"))):
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v24, "Math"), "PI")), 2), _S.invoke(_S.read(_v24, "r"), "range", [_S.unary("-", 0.8), 0.8])))
		_S.define(_v24, "sp", _S.invoke(_S.read(_v24, "r"), "range", [110, 220]))
		_S.define(_v24, "life", _S.invoke(_S.read(_v24, "r"), "range", [0.25, 0.6]))
		if _S.truth(_S.binary(">=", _S.read(_v24, "age"), _S.read(_v24, "life"))):
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "j", 1, "+=", true)
			continue
		var _v25 = _S.call_value(_S.read(_v24, "sparkAt"), [_S.prop(_S.read(_v24, "q"), "x"), _S.prop(_S.read(_v24, "q"), "y"), _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "cos", [_S.read(_v24, "a")]), _S.read(_v24, "sp")), _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.read(_v24, "a")]), _S.read(_v24, "sp")), _S.read(_v24, "age"), 0])
		_S.define(_v24, "x", _S.prop(_v25, 0))
		_S.define(_v24, "y", _S.prop(_v25, 1))
		_S.define(_v24, "vx", _S.prop(_v25, 2))
		_S.define(_v24, "vy", _S.prop(_v25, 3))
		_S.call_value(_S.read(_v24, "spark"), [_S.read(_v24, "p"), _S.read(_v24, "x"), _S.read(_v24, "y"), _S.read(_v24, "vx"), _S.read(_v24, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_v24, "age"), _S.read(_v24, "life"))), _S.read(_v24, "SPARKS")])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "j", 1, "+=", true)
	return null

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"x": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 7), 7])}, {"y": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [8, 18]))}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 15), 15])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [25, 60]))}, {"life": _S.invoke(_S.read(_e, "r"), "range", [1.1, 2.5])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.15])) else _S.invoke(_S.read(_e, "r"), "range", [1, 1.6]))}, {"a": _S.invoke(_S.read(_e, "r"), "range", [0, 6.3])}, {"b": _S.invoke(_S.read(_e, "r"), "range", [0, 6.3])}])

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v26 = _S.call_value(_S.read(_e, "drift"), [_S.prop(_S.read(_e, "q"), "x"), _S.prop(_S.read(_e, "q"), "y"), _S.prop(_S.read(_e, "q"), "vx"), _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"), 0, _S.unary("-", 30), 1.6, 1.6])
	_S.define(_e, "x", _S.prop(_v26, 0))
	_S.define(_e, "y", _S.prop(_v26, 1))
	_S.call_value(_S.read(_e, "ember"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "x"), _S.binary("*", 7, _S.binary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2.3), _S.prop(_S.read(_e, "q"), "a"))]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "q"), "a")])))), _S.binary("+", _S.read(_e, "y"), _S.binary("*", 2, _S.binary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 3), _S.prop(_S.read(_e, "q"), "b"))]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "q"), "b")])))), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))), _S.prop(_S.read(_e, "q"), "s"), _S.read(_e, "EMB"), _S.binary("+", _S.binary("*", _S.read(_e, "age"), 40), _S.prop(_S.read(_e, "q"), "a"))])
	return null
