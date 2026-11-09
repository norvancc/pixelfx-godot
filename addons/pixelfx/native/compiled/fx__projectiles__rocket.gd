@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/rocket.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "beat", _S.import_value("fx/projectiles/_lib.js", "beat"))
	_S.define(_e, "wake", _S.import_value("fx/projectiles/_lib.js", "wake"))
	_S.define(_e, "cloud", _S.import_value("fx/projectiles/_lib.js", "cloud"))
	_S.define(_e, "spark", _S.import_value("fx/projectiles/_lib.js", "spark"))
	_S.define(_e, "pixelShape", _S.import_value("fx/projectiles/_lib.js", "pixelShape"))
	_S.define(_e, "jet", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Rocket"}, {"desc": "A steel rocket roars along: a flickering jet with shock diamonds and a white-hot nozzle, a thick billowing smoke trail lit by the flame, sparks shed behind."}, {"tags": ["projectile", "rocket", "missile", "smoke", "fire", "directional", "loop"]}, {"size": [288, 76]}, {"origin": [252, 42]}, {"duration": 1.2}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"metal": ["#0f0d16", "#25243a", "#3e4058", "#61667f", "#8e97b0", "#c4cce0", "#f2f6ff"]}, {"paint": ["#3a0d14", "#7c1a22", "#bd2f2c", "#ec5a45", "#ff9b7e"]}, {"smoke": ["#26222e", "#3d3846", "#5a5463", "#7e7887", "#a7a1ad", "#d0cad2", "#f1ecee"]}, {"speed": 120}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "OUTLINE", _S.call_value(_S.read(_e, "hex"), ["#100d17"]))
	_S.define(_e, "NOZZLE", _S.unary("-", 14))
	_S.define(_e, "J0", 22)
	_S.define(_e, "SHIP", _S.call_value(_S.read(_e, "pixelShape"), [_S.unary("-", 15), _S.unary("-", 9), 30, 19, _S.function_value(_e, "_f15")]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "F", _S.arg(_args, 1))
	_S.define(_e, "x0", _S.arg(_args, 2))
	_S.define(_e, "y0", _S.arg(_args, 3))
	_S.define(_e, "J", _S.arg(_args, 4))
	_S.define(_e, "wob", _S.arg(_args, 5))
	_S.define(_e, "fr", _S.arg(_args, 6))
	_S.define(_e, "dia", _S.invoke([0, 1, 2, 3], "map", [_S.function_value(_e, "_f1")]))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_e, "x0"), _S.read(_e, "J")), 2), _S.binary("-", _S.read(_e, "y0"), 6), _S.read(_e, "x0"), _S.binary("+", _S.read(_e, "y0"), 6), _S.function_value(_e, "_f2")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", 3.6, _S.binary("*", _S.read(_e, "i"), 4.3)), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "fr"), _S.read(_e, "i"), 41]), 0.5), 0.7))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "x0"), _S.read(_e, "x")))
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0)):
		return null
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "u"), _S.read(_e, "J")))
	if _S.truth(_S.binary(">", _S.read(_e, "q"), 1.05)):
		return null
	_S.define(_e, "ady", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "y"), _S.read(_e, "y0"))]))
	_S.define(_e, "qq", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "q"), 1]))
	_S.define(_e, "w", _S.binary("*", _S.binary("*", _S.binary("+", 2.6, _S.binary("*", 2.4, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "qq"), 0.7]))), _S.binary("-", 1, _S.binary("*", _S.read(_e, "qq"), _S.read(_e, "qq")))), _S.read(_e, "wob")))
	_S.define(_e, "m", _S.binary("+", _S.binary("-", _S.read(_e, "w"), _S.read(_e, "ady")), _S.binary("*", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), 7), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), 131)), _S.read(_e, "fr")]), 0.5), 0.9), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("+", 0.25, _S.binary("*", _S.read(_e, "q"), 2))]))))
	if _S.truth(_S.binary("<", _S.read(_e, "m"), _S.unary("-", 0.5))):
		return null
	if _S.truth(_S.binary("<", _S.read(_e, "m"), 0.5)):
		return _S.prop(_S.read(_e, "F"), (3 if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.45)) else 2))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.prop(_S.read(_v0, "dia"), "length"))):
		var _v1 = _S.scope(_v0)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v1, "dia"), _S.read(_v1, "i")), _S.binary("*", _S.read(_v1, "J"), 0.72))):
			break
		_S.define(_v1, "d", _S.binary("+", _S.binary("/", _S.invoke(_S.read(_v1, "Math"), "abs", [_S.binary("-", _S.read(_v1, "u"), _S.prop(_S.read(_v1, "dia"), _S.read(_v1, "i")))]), _S.binary("-", 1.9, _S.binary("*", _S.read(_v1, "i"), 0.15))), _S.binary("/", _S.read(_v1, "ady"), _S.binary("-", 1.7, _S.binary("*", _S.read(_v1, "i"), 0.25)))))
		if _S.truth(_S.binary("<", _S.read(_v1, "d"), 1)):
			return (_S.prop(_S.read(_v1, "F"), 8) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v1, "d"), 0.55), func(): return _S.binary("<", _S.read(_v1, "i"), 3))) else _S.prop(_S.read(_v1, "F"), 7))
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "u"), 1.6), func(): return _S.binary("<", _S.read(_e, "ady"), 1.6))):
		return _S.prop(_S.read(_e, "F"), 8)
	_S.define(_e, "lvl", _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_e, "ady"), _S.invoke(_S.read(_e, "Math"), "max", [0.6, _S.read(_e, "w")]))), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "qq"), 1.5]))))
	return ((_S.prop(_S.read(_e, "F"), 7) if _S.truth(_S.binary("<", _S.read(_e, "u"), 3)) else _S.prop(_S.read(_e, "F"), 5)) if _S.truth(_S.binary(">", _S.read(_e, "lvl"), 0.62)) else (_S.prop(_S.read(_e, "F"), 5) if _S.truth(_S.binary(">", _S.read(_e, "lvl"), 0.38)) else (_S.prop(_S.read(_e, "F"), 4) if _S.truth(_S.binary(">", _S.read(_e, "lvl"), 0.16)) else _S.prop(_S.read(_e, "F"), 3))))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "M", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "metal"), 7]))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "paint"), 5]))
	_S.define(_e, "SM", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "smoke"), 7]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "V", _S.prop(_S.read(_e, "o"), "speed"))
	_S.define(_e, "fr", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 30), 0.000001)]))
	_S.define(_e, "bob", _S.function_value(_e, "_f4"))
	_S.define(_e, "by", _S.call_value(_S.read(_e, "bob"), [_S.read(_e, "t")]))
	_S.define(_e, "J", _S.binary("*", _S.read(_e, "J0"), _S.binary("+", 0.84, _S.binary("*", 0.32, _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "fr"), _S.read(_e, "S"), 1])))))
	_S.define(_e, "wob", _S.binary("+", 0.92, _S.binary("*", 0.16, _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "fr"), _S.read(_e, "S"), 2]))))
	_S.define(_e, "fl", _S.binary("/", _S.read(_e, "J"), _S.read(_e, "J0")))
	_S.define(_e, "left", _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 2))
	_S.define(_e, "SP", [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 3)])
	_S.define(_e, "list", [])
	_S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t"), _S.read(_e, "D"), 66, _S.binary("+", _S.read(_e, "S"), 1), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	_S.call_value(_S.read(_e, "cloud"), [_S.read(_e, "p"), _S.read(_e, "list"), _S.read(_e, "SM"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 0), _S.prop(_S.read(_e, "SM"), 0), 0.5]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 1), _S.prop(_S.read(_e, "SM"), 1), 0.45]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 2), _S.prop(_S.read(_e, "SM"), 2), 0.35]), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 7)], _S.merge([{"dens": 1.3}, {"lit": 1.5}])])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("-", _S.binary("-", _S.read(_e, "NOZZLE"), _S.read(_e, "J0")), 6), _S.read(_e, "by"), 26, _S.prop(_S.read(_e, "F"), 4), _S.binary("*", 0.24, _S.read(_e, "fl"))])
	_S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t"), _S.read(_e, "D"), 9, _S.binary("+", _S.read(_e, "S"), 4), _S.function_value(_e, "_f7"), _S.function_value(_e, "_f8")])
	_S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t"), _S.read(_e, "D"), 30, _S.binary("+", _S.read(_e, "S"), 3), _S.function_value(_e, "_f9"), _S.function_value(_e, "_f10")])
	_S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t"), _S.read(_e, "D"), 30, _S.binary("+", _S.read(_e, "S"), 2), _S.function_value(_e, "_f11"), _S.function_value(_e, "_f12")])
	_S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t"), _S.read(_e, "D"), 8, _S.binary("+", _S.read(_e, "S"), 6), _S.function_value(_e, "_f13"), _S.function_value(_e, "_f14")])
	_S.call_value(_S.read(_e, "jet"), [_S.read(_e, "p"), _S.read(_e, "F"), _S.read(_e, "NOZZLE"), _S.binary("+", _S.read(_e, "by"), 0.5), _S.read(_e, "J"), _S.read(_e, "wob"), _S.binary("+", _S.read(_e, "fr"), _S.binary("*", _S.read(_e, "S"), 31))])
	_S.invoke(_S.read(_e, "p"), "sprite", [_S.prop(_S.read(_e, "SHIP"), "rows"), _S.merge([{"o": _S.read(_e, "OUTLINE")}, {1: _S.prop(_S.read(_e, "M"), 1)}, {2: _S.prop(_S.read(_e, "M"), 2)}, {3: _S.prop(_S.read(_e, "M"), 3)}, {4: _S.prop(_S.read(_e, "M"), 4)}, {5: _S.prop(_S.read(_e, "M"), 5)}, {6: _S.prop(_S.read(_e, "M"), 6)}, {"a": _S.prop(_S.read(_e, "A"), 0)}, {"b": _S.prop(_S.read(_e, "A"), 1)}, {"c": _S.prop(_S.read(_e, "A"), 2)}, {"d": _S.prop(_S.read(_e, "A"), 3)}, {"e": _S.prop(_S.read(_e, "A"), 4)}, {"w": _S.read(_e, "WHITE")}, {"h": _S.prop(_S.read(_e, "F"), 5)}, {"x": _S.prop(_S.read(_e, "F"), 8)}]), _S.prop(_S.read(_e, "SHIP"), "x0"), _S.binary("+", _S.prop(_S.read(_e, "SHIP"), "y0"), _S.read(_e, "by"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("-", _S.read(_e, "NOZZLE"), 10), _S.read(_e, "by"), 60, _S.prop(_S.read(_e, "F"), 4), _S.binary("*", 0.28, _S.read(_e, "fl"))])
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.binary("-", _S.read(_e, "NOZZLE"), 3), _S.binary("+", _S.read(_e, "by"), 0.5), _S.binary("-", _S.read(_e, "NOZZLE"), _S.binary("*", _S.read(_e, "J"), 0.9)), _S.binary("+", _S.read(_e, "by"), 0.5), 11, _S.prop(_S.read(_e, "F"), 4), 0.2])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("-", _S.read(_e, "NOZZLE"), 1), _S.binary("+", _S.read(_e, "by"), 0.5), 8, _S.prop(_S.read(_e, "F"), 7), 0.45])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.read(_e, "NOZZLE"), 3), _S.binary("+", _S.read(_e, "by"), 5), 12, _S.prop(_S.read(_e, "F"), 4), _S.binary("*", 0.22, _S.read(_e, "fl"))])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "tt"), _S.read(_e, "D")), _S.read(_e, "TAU"))]), 0.62)])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.1, 1.45])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	var _v2 = _S.call_value(_S.read(_e, "wake"), [_S.binary("-", _S.read(_e, "NOZZLE"), _S.binary("*", _S.read(_e, "J0"), _S.invoke(_S.read(_e, "r"), "range", [0.62, 0.8]))), _S.binary("+", _S.call_value(_S.read(_e, "bob"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age"))]), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1), 1])), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [75, 105])), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 20), 20]), _S.read(_e, "age"), _S.read(_e, "V"), 3, 0])
	_S.define(_e, "x", _S.prop(_v2, 0))
	_S.define(_e, "y", _S.prop(_v2, 1))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "rise", _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.invoke(_S.read(_e, "r"), "range", [6, 16])), _S.read(_e, "age")), _S.read(_e, "age")))
	_S.define(_e, "sway", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2.3), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))]), _S.read(_e, "age")), 2))
	_S.define(_e, "rad", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [2.2, 3]), _S.binary("*", _S.binary("-", (_S.invoke(_S.read(_e, "r"), "range", [14, 19]) if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.25])) else _S.invoke(_S.read(_e, "r"), "range", [8, 13])), 2.6), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", 2.2), _S.read(_e, "age"))])))))
	if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "rad")), _S.binary("+", _S.read(_e, "left"), 1))):
		return null
	_S.define(_e, "a", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 16)]), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "k")), 1.25])), 0.68), _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "left"), _S.binary("+", _S.read(_e, "left"), 40), _S.binary("-", _S.read(_e, "x"), _S.read(_e, "rad"))])))
	_S.invoke(_S.read(_e, "list"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.binary("+", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "rise")), _S.read(_e, "sway"))}, {"r": _S.read(_e, "rad")}, {"a": _S.read(_e, "a")}, {"b": _S.call_value(_S.read(_e, "clamp"), [_S.binary("+", _S.binary("-", 0.95, _S.binary("*", _S.read(_e, "k"), 0.75)), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.08), 0.08]))])}, {"w": _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "age")), _S.invoke(_S.read(_e, "r"), "range", [3.5, 6]))])}])])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.6, 1.1])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life"))))
	var _v3 = _S.call_value(_S.read(_e, "wake"), [_S.binary("-", _S.read(_e, "NOZZLE"), _S.binary("*", _S.read(_e, "J0"), 0.6)), _S.call_value(_S.read(_e, "bob"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age"))]), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [40, 120])), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 40), 30]), _S.read(_e, "age"), _S.read(_e, "V"), 2.5, _S.unary("-", 8)])
	_S.define(_e, "x", _S.prop(_v3, 0))
	_S.define(_e, "y", _S.prop(_v3, 1))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "x"), _S.binary("+", _S.read(_e, "left"), 2)), func(): return _S.logical("&&", _S.binary("<", _S.read(_e, "k"), 0.3), func(): return _S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "fr"), _S.invoke(_S.read(_e, "r"), "int", [0, 999])]), 0.5)))):
		return null
	_S.define(_e, "c", (_S.prop(_S.read(_e, "F"), 6) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.6)) else (_S.prop(_S.read(_e, "F"), 4) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.3)) else _S.prop(_S.read(_e, "F"), 2))))
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "c")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.read(_e, "c"), _S.binary("*", 0.35, _S.read(_e, "k"))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.08, 0.16])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	var _v4 = _S.call_value(_S.read(_e, "wake"), [_S.binary("-", _S.read(_e, "NOZZLE"), _S.binary("*", _S.read(_e, "J0"), _S.invoke(_S.read(_e, "r"), "range", [0.6, 0.9]))), _S.binary("+", _S.call_value(_S.read(_e, "bob"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age"))]), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [10, 50])), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 12), 12]), _S.read(_e, "age"), _S.read(_e, "V"), 4, _S.unary("-", 30)])
	_S.define(_e, "x", _S.prop(_v4, 0))
	_S.define(_e, "y", _S.prop(_v4, 1))
	_S.define(_e, "idx", _S.binary("-", 7, _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "k"), 0.7]), 4)])))
	_S.define(_e, "rad", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [1.2, 2.2]), _S.binary("-", 1, _S.binary("*", _S.read(_e, "k"), 0.6))))
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "rad"), _S.prop(_S.read(_e, "F"), _S.binary("-", _S.read(_e, "idx"), 2))])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "rad"), 0.25)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "rad"), 0.1)), _S.binary("*", _S.read(_e, "rad"), 0.65), _S.prop(_S.read(_e, "F"), _S.read(_e, "idx"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.binary("*", _S.read(_e, "rad"), 2.4), 2), _S.prop(_S.read(_e, "F"), _S.read(_e, "idx")), _S.binary("*", 0.2, _S.binary("-", 1, _S.read(_e, "k")))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.18, 0.45])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	var _v5 = _S.call_value(_S.read(_e, "wake"), [_S.binary("-", _S.read(_e, "NOZZLE"), _S.invoke(_S.read(_e, "r"), "range", [2, _S.binary("*", _S.read(_e, "J0"), 0.7)])), _S.binary("+", _S.call_value(_S.read(_e, "bob"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age"))]), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [20, 190])), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 80), 50]), _S.read(_e, "age"), _S.read(_e, "V"), 2.6, 160])
	_S.define(_e, "x", _S.prop(_v5, 0))
	_S.define(_e, "y", _S.prop(_v5, 1))
	_S.define(_e, "vx", _S.prop(_v5, 2))
	_S.define(_e, "vy", _S.prop(_v5, 3))
	if _S.truth(_S.binary(">", _S.read(_e, "x"), _S.binary("+", _S.read(_e, "left"), 10))):
		_S.call_value(_S.read(_e, "spark"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "vx"), _S.read(_e, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life"))), _S.read(_e, "SP")])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.5, 0.8])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	var _v6 = _S.call_value(_S.read(_e, "wake"), [_S.binary("-", _S.read(_e, "NOZZLE"), _S.invoke(_S.read(_e, "r"), "range", [4, _S.binary("*", _S.read(_e, "J0"), 0.8)])), _S.binary("+", _S.call_value(_S.read(_e, "bob"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age"))]), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1), 1])), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [10, 80])), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 60), 10]), _S.read(_e, "age"), _S.read(_e, "V"), 1.8, 170])
	_S.define(_e, "x", _S.prop(_v6, 0))
	_S.define(_e, "y", _S.prop(_v6, 1))
	_S.define(_e, "vx", _S.prop(_v6, 2))
	_S.define(_e, "vy", _S.prop(_v6, 3))
	if _S.truth(_S.binary(">", _S.read(_e, "x"), _S.binary("+", _S.read(_e, "left"), 10))):
		_S.call_value(_S.read(_e, "spark"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "vx"), _S.read(_e, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life"))), _S.read(_e, "SP"), 0.5])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "set", _S.arg(_args, 0))
	_S.define(_e, "body", _S.merge([{"-3": "4"}, {"-2": "6"}, {"-1": "5"}, {0: "4"}, {1: "3"}, {2: "2"}, {3: "1"}]))
	_S.define(_e, "seam", _S.merge([{"-3": "3"}, {"-2": "4"}, {"-1": "4"}, {0: "3"}, {1: "2"}, {2: "1"}, {3: "1"}]))
	_S.define(_e, "paint", _S.merge([{"-3": "d"}, {"-2": "e"}, {"-1": "e"}, {0: "d"}, {1: "c"}, {2: "b"}, {3: "a"}]))
	var _v7 = _S.scope(_e)
	_S.define(_v7, "y", _S.unary("-", 3))
	while _S.truth(_S.binary("<=", _S.read(_v7, "y"), 3)):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "x", _S.unary("-", 11))
		while _S.truth(_S.binary("<=", _S.read(_v8, "x"), 5)):
			_S.call_value(_S.read(_v8, "set"), [_S.read(_v8, "x"), _S.read(_v8, "y"), _S.prop(_S.read(_v8, "body"), _S.read(_v8, "y"))])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "x", 1, "+=", true)
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "y", 1, "+=", true)
	var _v9 = _S.scope(_e)
	_S.define(_v9, "y", _S.unary("-", 3))
	while _S.truth(_S.binary("<=", _S.read(_v9, "y"), 3)):
		_S.last([_S.call_value(_S.read(_v9, "set"), [_S.unary("-", 3), _S.read(_v9, "y"), _S.prop(_S.read(_v9, "seam"), _S.read(_v9, "y"))]), _S.call_value(_S.read(_v9, "set"), [_S.unary("-", 9), _S.read(_v9, "y"), _S.prop(_S.read(_v9, "paint"), _S.read(_v9, "y"))]), _S.call_value(_S.read(_v9, "set"), [_S.unary("-", 8), _S.read(_v9, "y"), _S.prop(_S.read(_v9, "paint"), _S.read(_v9, "y"))])])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "y", 1, "+=", true)
	_S.define(_e, "nose", _S.merge([{6: 3}, {7: 3}, {8: 2}, {9: 2}, {10: 1}, {11: 1}, {12: 0}, {13: 0}]))
	for _v10 in _S.array(_S.invoke(_S.read(_e, "Object"), "entries", [_S.read(_e, "nose")])):
		var _v11 = _S.scope(_e)
		var _v12 = _v10
		_S.define(_v11, "xs", _S.prop(_v12, 0))
		_S.define(_v11, "h", _S.prop(_v12, 1))
		var _v13 = _S.scope(_v11)
		_S.define(_v13, "y", _S.unary("-", _S.read(_v13, "h")))
		while _S.truth(_S.binary("<=", _S.read(_v13, "y"), _S.read(_v13, "h"))):
			_S.call_value(_S.read(_v13, "set"), [_S.unary("+", _S.read(_v13, "xs")), _S.read(_v13, "y"), _S.prop(_S.read(_v13, "paint"), _S.read(_v13, "y"))])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "y", 1, "+=", true)
	_S.last([_S.call_value(_S.read(_e, "set"), [7, _S.unary("-", 2), "w"]), _S.call_value(_S.read(_e, "set"), [8, _S.unary("-", 2), "w"]), _S.call_value(_S.read(_e, "set"), [9, _S.unary("-", 1), "e"]), _S.call_value(_S.read(_e, "set"), [13, 0, "e"])])
	_S.invoke([[_S.unary("-", 13), _S.unary("-", 8)], [_S.unary("-", 13), _S.unary("-", 9)], [_S.unary("-", 13), _S.unary("-", 10)], [_S.unary("-", 13), _S.unary("-", 11)]], "forEach", [_S.function_value(_e, "_f16")])
	var _v16 = _S.scope(_e)
	_S.define(_v16, "y", _S.unary("-", 2))
	while _S.truth(_S.binary("<=", _S.read(_v16, "y"), 2)):
		_S.call_value(_S.read(_v16, "set"), [_S.unary("-", 12), _S.read(_v16, "y"), ("3" if _S.truth(_S.binary("<", _S.read(_v16, "y"), 0)) else "2")])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "y", 1, "+=", true)
	var _v17 = _S.scope(_e)
	_S.define(_v17, "y", _S.unary("-", 3))
	while _S.truth(_S.binary("<=", _S.read(_v17, "y"), 3)):
		_S.call_value(_S.read(_v17, "set"), [_S.unary("-", 13), _S.read(_v17, "y"), ("2" if _S.truth(_S.binary("<", _S.read(_v17, "y"), _S.unary("-", 1))) else "1")])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "y", 1, "+=", true)
	_S.last([_S.call_value(_S.read(_e, "set"), [_S.unary("-", 14), _S.unary("-", 3), "h"]), _S.call_value(_S.read(_e, "set"), [_S.unary("-", 14), 3, "h"])])
	var _v18 = _S.scope(_e)
	_S.define(_v18, "y", _S.unary("-", 2))
	while _S.truth(_S.binary("<=", _S.read(_v18, "y"), 2)):
		_S.call_value(_S.read(_v18, "set"), [_S.unary("-", 14), _S.read(_v18, "y"), ("x" if _S.truth(_S.binary("<", _S.invoke(_S.read(_v18, "Math"), "abs", [_S.read(_v18, "y")]), 2)) else "h")])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "y", 1, "+=", true)
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v14 = _S.arg(_args, 0)
	_S.define(_e, "a", _S.prop(_v14, 0))
	_S.define(_e, "b", _S.prop(_v14, 1))
	_S.define(_e, "i", _S.arg(_args, 1))
	var _v15 = _S.scope(_e)
	_S.define(_v15, "x", _S.read(_v15, "a"))
	while _S.truth(_S.binary("<=", _S.read(_v15, "x"), _S.read(_v15, "b"))):
		_S.last([_S.call_value(_S.read(_v15, "set"), [_S.read(_v15, "x"), _S.binary("-", _S.unary("-", 4), _S.read(_v15, "i")), ("5" if _S.truth(_S.binary("===", _S.read(_v15, "x"), _S.read(_v15, "b"))) else ("4" if _S.truth(_S.binary(">", _S.read(_v15, "i"), 1)) else "3"))]), _S.call_value(_S.read(_v15, "set"), [_S.read(_v15, "x"), _S.binary("+", 4, _S.read(_v15, "i")), ("3" if _S.truth(_S.binary("===", _S.read(_v15, "x"), _S.read(_v15, "b"))) else ("1" if _S.truth(_S.binary(">", _S.read(_v15, "i"), 1)) else "2"))])])
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "x", 1, "+=", true)
	return null
