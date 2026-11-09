@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/fireball.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "pnoise", _S.import_value("fx/fire/_lib.js", "pnoise"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "flameBlade", _S.import_value("fx/fire/_lib.js", "flameBlade"))
	_S.define(_e, "firePuff", _S.import_value("fx/fire/_lib.js", "firePuff"))
	_S.define(_e, "smokePuff", _S.import_value("fx/fire/_lib.js", "smokePuff"))
	_S.define(_e, "spark", _S.import_value("fx/fire/_lib.js", "spark"))
	_S.define(_e, "ember", _S.import_value("fx/fire/_lib.js", "ember"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "head", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Fireball"}, {"desc": "A fireball flying right: a churning white-hot head with a corona of flame, a long torn tail of flame puffs cooling into smoke, embers shed behind."}, {"tags": ["fire", "fireball", "projectile", "magic", "directional", "loop"]}, {"size": [136, 56]}, {"origin": [112, 28]}, {"duration": 1.2}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"radius": 5}, {"speed": 120}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "SMOKE1", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "BODY", [[30, 4.2, 0], [23, 4.4, _S.unary("-", 1.6)], [22, 4.4, 1.6], [15, 4.6, 0]])
	_S.define(_e, "CORONA", [[_S.unary("-", 1.3), 6, 1.1], [_S.unary("-", 1.8), 8, 1.2], [_S.unary("-", 2.3), 7, 1.1], [1.3, 6, 1.1], [1.8, 8, 1.2], [2.3, 7, 1.1]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "H", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "R0", _S.arg(_args, 3))
	_S.define(_e, "S", _S.arg(_args, 4))
	_S.define(_e, "hx", _S.arg(_args, 5))
	_S.define(_e, "hy", _S.arg(_args, 6))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "hx"), _S.binary("*", _S.read(_e, "R0"), 2.4)), _S.binary("-", _S.read(_e, "hy"), _S.binary("*", _S.read(_e, "R0"), 1.7)), _S.binary("+", _S.read(_e, "hx"), _S.binary("*", _S.read(_e, "R0"), 1.5)), _S.binary("+", _S.read(_e, "hy"), _S.binary("*", _S.read(_e, "R0"), 1.7)), _S.function_value(_e, "_f1")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.write(_e, "x", _S.read(_e, "hx"), "-=", false)
	_S.write(_e, "y", _S.read(_e, "hy"), "-=", false)
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y")]))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "y"), _S.read(_e, "x")]))
	_S.define(_e, "back", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.unary("-", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]))]))
	_S.define(_e, "a", _S.binary("/", _S.read(_e, "th"), _S.read(_e, "TAU")))
	_S.define(_e, "bump", _S.binary("+", _S.binary("*", 0.55, _S.call_value(_S.read(_e, "pnoise"), [_S.binary("+", _S.binary("*", _S.read(_e, "a"), 9), _S.binary("*", _S.read(_e, "ph"), 9)), 9, _S.read(_e, "S")])), _S.binary("*", 0.35, _S.call_value(_S.read(_e, "pnoise"), [_S.binary("-", _S.binary("*", _S.read(_e, "a"), 5), _S.binary("*", _S.read(_e, "ph"), 10)), 5, _S.binary("+", _S.read(_e, "S"), 1)]))))
	_S.define(_e, "rim", _S.binary("+", _S.binary("*", _S.read(_e, "R0"), _S.binary("+", 1, _S.binary("*", _S.binary("*", 0.55, _S.read(_e, "back")), _S.read(_e, "back")))), _S.read(_e, "bump")))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "rim"))):
		return null
	_S.define(_e, "swirl", _S.call_value(_S.read(_e, "pnoise"), [_S.binary("+", _S.binary("-", _S.binary("*", _S.read(_e, "a"), 5), _S.binary("*", _S.read(_e, "ph"), 10)), _S.binary("*", _S.read(_e, "d"), 0.45)), 5, _S.binary("+", _S.read(_e, "S"), 2)]))
	_S.define(_e, "h", _S.binary("+", _S.binary("+", _S.binary("-", 1, _S.binary("/", _S.read(_e, "d"), _S.read(_e, "rim"))), _S.binary("*", 0.26, _S.read(_e, "swirl"))), _S.binary("*", 0.1, _S.binary("-", 1, _S.read(_e, "back")))))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.binary("-", _S.read(_e, "rim"), _S.read(_e, "d")), 1), func(): return _S.binary("<", _S.read(_e, "back"), 0.3))):
		return (_S.prop(_S.read(_e, "H"), 3) if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.3)) else _S.prop(_S.read(_e, "H"), 5))
	return (_S.prop(_S.read(_e, "H"), 0) if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.74)) else (_S.prop(_S.read(_e, "H"), 1) if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.58)) else (_S.prop(_S.read(_e, "H"), 2) if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.42)) else (_S.prop(_S.read(_e, "H"), 4) if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.27)) else (_S.prop(_S.read(_e, "H"), 5) if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.13)) else _S.prop(_S.read(_e, "H"), 6))))))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "hotFirst"), [_S.read(_e, "F")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "R0", _S.prop(_S.read(_e, "o"), "radius"))
	_S.define(_e, "V", _S.prop(_S.read(_e, "o"), "speed"))
	_S.define(_e, "N", _S.function_value(_e, "_f3"))
	_S.define(_e, "GLOW", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), 0.5]), _S.read(_e, "WHITE"), 0.25]))
	_S.define(_e, "SMOKE", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "SMOKE1"), _S.prop(_S.read(_e, "H"), 6), 0.3]))
	_S.define(_e, "SPARKS", [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 5)])
	_S.define(_e, "EMB", [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 6)])
	_S.define(_e, "hx", _S.binary("*", _S.call_value(_S.read(_e, "N"), [3, _S.binary("+", _S.read(_e, "S"), 50)]), 0.5))
	_S.define(_e, "hy", _S.binary("*", _S.call_value(_S.read(_e, "N"), [2.5, _S.binary("+", _S.read(_e, "S"), 51)]), 0.7))
	_S.define(_e, "fire", [])
	_S.define(_e, "smoke", [])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 130, _S.binary("+", _S.read(_e, "S"), 100), _S.function_value(_e, "_f4"), _S.function_value(_e, "_f5")])
	for _v2 in _S.array(_S.read(_e, "smoke")):
		var _v3 = _S.scope(_e)
		var _v4 = _v2
		_S.define(_v3, "sa", _S.prop(_v4, 0))
		_S.define(_v3, "x", _S.prop(_v4, 1))
		_S.define(_v3, "y", _S.prop(_v4, 2))
		_S.define(_v3, "q", _S.prop(_v4, 3))
		_S.call_value(_S.read(_v3, "smokePuff"), [_S.read(_v3, "p"), _S.read(_v3, "x"), _S.read(_v3, "y"), _S.binary("-", 1, _S.binary("/", _S.read(_v3, "sa"), _S.prop(_S.read(_v3, "q"), "sl"))), _S.binary("*", _S.prop(_S.read(_v3, "q"), "s"), 0.9), _S.read(_v3, "SMOKE")])
	_S.invoke(_S.read(_e, "fire"), "sort", [_S.function_value(_e, "_f6")])
	for _v5 in _S.array(_S.read(_e, "fire")):
		var _v6 = _S.scope(_e)
		var _v7 = _v5
		_S.define(_v6, "age", _S.prop(_v7, 0))
		_S.define(_v6, "x", _S.prop(_v7, 1))
		_S.define(_v6, "y", _S.prop(_v7, 2))
		_S.define(_v6, "q", _S.prop(_v7, 3))
		var _v8 = _S.scope(_v6)
		_S.define(_v8, "u", _S.binary("/", _S.read(_v8, "age"), _S.prop(_S.read(_v8, "q"), "fl")))
		_S.call_value(_S.read(_v8, "firePuff"), [_S.read(_v8, "p"), _S.read(_v8, "x"), _S.read(_v8, "y"), _S.binary("-", 1, _S.read(_v8, "u")), _S.binary("*", _S.prop(_S.read(_v8, "q"), "s"), _S.binary("+", 1, _S.binary("*", 1.3, _S.read(_v8, "u")))), _S.prop(_S.read(_v8, "q"), "f"), _S.read(_v8, "H"), 0.07, _S.unary("-", 0.86), _S.unary("-", 0.5)])
	_S.invoke(_S.read(_e, "BODY"), "forEach", [_S.function_value(_e, "_f7")])
	_S.invoke(_S.read(_e, "CORONA"), "forEach", [_S.function_value(_e, "_f8")])
	_S.call_value(_S.read(_e, "head"), [_S.read(_e, "p"), _S.read(_e, "H"), _S.read(_e, "t"), _S.read(_e, "R0"), _S.read(_e, "S"), _S.read(_e, "hx"), _S.read(_e, "hy")])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 26, _S.binary("+", _S.read(_e, "S"), 200), _S.function_value(_e, "_f9"), _S.function_value(_e, "_f10")])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 30, _S.binary("+", _S.read(_e, "S"), 300), _S.function_value(_e, "_f11"), _S.function_value(_e, "_f12")])
	_S.define(_e, "fl", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.call_value(_S.read(_e, "N"), [9, _S.binary("+", _S.read(_e, "S"), 7)]))))
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.binary("-", _S.read(_e, "hx"), 6), _S.read(_e, "hy"), _S.unary("-", 50), _S.unary("-", 2), 12, _S.read(_e, "GLOW"), _S.binary("*", 0.2, _S.read(_e, "fl"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("-", _S.read(_e, "hx"), 2), _S.read(_e, "hy"), 42, _S.read(_e, "GLOW"), _S.binary("*", 0.42, _S.read(_e, "fl"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "hx"), _S.read(_e, "hy"), 13, _S.prop(_S.read(_e, "H"), 1), _S.binary("*", 0.3, _S.read(_e, "fl"))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rate", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	_S.define(_e, "off", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), _S.read(_e, "rate"), _S.read(_e, "seed"), _S.read(_e, "off")])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "fl", _S.invoke(_S.read(_e, "r"), "range", [0.22, 0.55]))
	_S.define(_e, "sm", _S.invoke(_S.read(_e, "r"), "chance", [0.55]))
	_S.define(_e, "x", _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [2, 24])))
	return _S.merge([{"x": _S.read(_e, "x")}, {"y": _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1), 1]), _S.binary("-", _S.read(_e, "R0"), _S.binary("*", 0.1, _S.unary("-", _S.read(_e, "x")))))}, {"v": _S.binary("*", _S.read(_e, "V"), _S.invoke(_S.read(_e, "r"), "range", [0.3, 0.6]))}, {"vy": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 16), 16])}, {"fl": _S.read(_e, "fl")}, {"sm": _S.read(_e, "sm")}, {"sl": _S.invoke(_S.read(_e, "r"), "range", [0.25, 0.45])}, {"s": _S.invoke(_S.read(_e, "r"), "range", [1.3, 2.9])}, {"f": _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), 0.5), _S.binary("*", 0.5, _S.binary("/", _S.unary("-", _S.read(_e, "x")), 24)))}, {"life": _S.binary("+", _S.read(_e, "fl"), (0.45 if _S.truth(_S.read(_e, "sm")) else 0))}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "ta", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl")]))
	var _v0 = _S.call_value(_S.read(_e, "drift"), [0, _S.prop(_S.read(_e, "q"), "y"), _S.prop(_S.read(_e, "q"), "v"), _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "ta"), 0, _S.unary("-", 70), 4.5, 3])
	_S.define(_e, "wx", _S.prop(_v0, 0))
	_S.define(_e, "y", _S.prop(_v0, 1))
	_S.define(_e, "wvx", _S.prop(_v0, 2))
	_S.define(_e, "vy", _S.prop(_v0, 3))
	_S.define(_e, "x", _S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "q"), "x"), _S.read(_e, "wx")), _S.binary("*", _S.read(_e, "V"), _S.read(_e, "ta"))))
	if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl"))):
		return _S.invoke(_S.read(_e, "fire"), "push", [[_S.read(_e, "age"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "q")]])
	if _S.truth(_S.logical("||", _S.unary("!", _S.prop(_S.read(_e, "q"), "sm")), func(): return _S.binary(">", _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl")), _S.prop(_S.read(_e, "q"), "sl")))):
		return null
	_S.define(_e, "sa", _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl")))
	var _v1 = _S.call_value(_S.read(_e, "drift"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("-", _S.read(_e, "wvx"), _S.read(_e, "V")), _S.binary("-", _S.binary("*", _S.read(_e, "vy"), 0.6), 6), _S.read(_e, "sa"), _S.binary("*", _S.read(_e, "V"), 2), _S.unary("-", 30), 2, 1.2])
	_S.define(_e, "sx", _S.prop(_v1, 0))
	_S.define(_e, "sy", _S.prop(_v1, 1))
	_S.invoke(_S.read(_e, "smoke"), "push", [[_S.read(_e, "sa"), _S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "q")]])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "b"), 0), _S.prop(_S.read(_e, "a"), 0))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v9 = _S.arg(_args, 0)
	_S.define(_e, "len", _S.prop(_v9, 0))
	_S.define(_e, "w", _S.prop(_v9, 1))
	_S.define(_e, "dy", _S.prop(_v9, 2))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "n", _S.binary("*", _S.binary("+", _S.binary("*", _S.read(_e, "S"), 5), _S.read(_e, "i")), 17))
	_S.define(_e, "L", _S.binary("*", _S.binary("*", _S.read(_e, "len"), _S.binary("+", 0.82, _S.binary("*", 0.25, _S.call_value(_S.read(_e, "N"), [4, _S.read(_e, "n")])))), _S.binary("+", 1, _S.binary("*", 0.3, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.call_value(_S.read(_e, "N"), [2.4, _S.binary("+", _S.read(_e, "n"), 3)])])))))
	_S.call_value(_S.read(_e, "flameBlade"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "hx"), 1), _S.binary("+", _S.read(_e, "hy"), _S.binary("*", _S.read(_e, "dy"), 0.5)), _S.unary("-", 1), _S.binary("*", _S.read(_e, "dy"), 0.02), _S.read(_e, "L"), _S.binary("/", _S.binary("*", _S.read(_e, "w"), _S.read(_e, "R0")), 5), _S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "N"), [3, _S.binary("+", _S.read(_e, "n"), 5)]), 3), _S.read(_e, "dy")), _S.read(_e, "N"), _S.read(_e, "n"), _S.read(_e, "H"), _S.read(_e, "LAYERS"), 0.5, _S.binary("+", 1.1, _S.binary("*", _S.read(_e, "L"), 0.05))])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v10 = _S.arg(_args, 0)
	_S.define(_e, "a", _S.prop(_v10, 0))
	_S.define(_e, "len", _S.prop(_v10, 1))
	_S.define(_e, "w", _S.prop(_v10, 2))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "n", _S.binary("*", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "S"), 5), _S.read(_e, "i")), 20), 17))
	_S.define(_e, "L", _S.binary("*", _S.read(_e, "len"), _S.binary("+", 0.7, _S.binary("*", 0.4, _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_e, "N"), [6, _S.read(_e, "n")])))))))
	_S.define(_e, "ox", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "R0")), 0.85))
	_S.define(_e, "oy", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "R0")), 0.85))
	_S.define(_e, "dx", _S.binary("-", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), 0.55), 1))
	_S.define(_e, "dy", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 0.55))
	_S.define(_e, "l", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	_S.call_value(_S.read(_e, "flameBlade"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "hx"), _S.read(_e, "ox")), _S.binary("+", _S.read(_e, "hy"), _S.read(_e, "oy")), _S.binary("/", _S.read(_e, "dx"), _S.read(_e, "l")), _S.binary("/", _S.read(_e, "dy"), _S.read(_e, "l")), _S.read(_e, "L"), _S.read(_e, "w"), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "sign", [_S.read(_e, "a")])), 1.5), _S.read(_e, "N"), _S.read(_e, "n"), _S.read(_e, "H"), _S.read(_e, "LAYERS")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"a": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 2.4), 2.4])}, {"v": _S.invoke(_S.read(_e, "r"), "range", [30, 70])}, {"life": _S.invoke(_S.read(_e, "r"), "range", [0.08, 0.18])}])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "q"), "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "q"), "a")]))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "R0"), 0.9), _S.binary("*", _S.prop(_S.read(_e, "q"), "v"), _S.read(_e, "age"))))
	_S.define(_e, "x", _S.binary("-", _S.binary("+", _S.read(_e, "hx"), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "d"))), _S.binary("*", _S.binary("*", _S.read(_e, "V"), 0.4), _S.read(_e, "age"))))
	_S.define(_e, "y", _S.binary("+", _S.read(_e, "hy"), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "d"))))
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))))
	_S.define(_e, "L", _S.binary("+", 1, _S.binary("*", 2, _S.read(_e, "k"))))
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("+", _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "L"))), _S.binary("*", _S.read(_e, "V"), 0.02)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "L"))), _S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "H"), 1) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.5)) else _S.prop(_S.read(_e, "H"), 3))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.prop(_S.read(_e, "H"), 2), _S.binary("*", 0.4, _S.read(_e, "k"))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"x": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [2, 16]))}, {"y": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 3), 3])}, {"v": _S.binary("*", _S.read(_e, "V"), _S.invoke(_S.read(_e, "r"), "range", [0.3, 0.8]))}, {"vy": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 20), 20])}, {"life": _S.invoke(_S.read(_e, "r"), "range", [0.25, 0.55])}, {"big": _S.invoke(_S.read(_e, "r"), "chance", [0.25])}, {"ph": _S.invoke(_S.read(_e, "r"), "range", [0, 6.3])}])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v11 = _S.call_value(_S.read(_e, "drift"), [0, _S.prop(_S.read(_e, "q"), "y"), _S.prop(_S.read(_e, "q"), "v"), _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"), 0, 50, 3, 2])
	_S.define(_e, "wx", _S.prop(_v11, 0))
	_S.define(_e, "y", _S.prop(_v11, 1))
	_S.define(_e, "wvx", _S.prop(_v11, 2))
	_S.define(_e, "vy", _S.prop(_v11, 3))
	_S.define(_e, "x", _S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "q"), "x"), _S.read(_e, "wx")), _S.binary("*", _S.read(_e, "V"), _S.read(_e, "age"))))
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))))
	if _S.truth(_S.prop(_S.read(_e, "q"), "big")):
		_S.call_value(_S.read(_e, "ember"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "k"), 2, _S.read(_e, "EMB"), _S.binary("+", _S.binary("*", _S.read(_e, "age"), 40), _S.prop(_S.read(_e, "q"), "ph"))])
	else:
		_S.call_value(_S.read(_e, "spark"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("-", _S.read(_e, "wvx"), _S.read(_e, "V")), _S.read(_e, "vy"), _S.read(_e, "k"), _S.read(_e, "SPARKS")])
	return null
