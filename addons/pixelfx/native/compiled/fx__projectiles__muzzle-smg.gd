@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/muzzle-smg.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "flyV", _S.import_value("core/index.js", "flyV"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "flashShape", _S.import_value("fx/projectiles/_lib.js", "flashShape"))
	_S.define(_e, "flash", _S.import_value("fx/projectiles/_lib.js", "flash"))
	_S.define(_e, "spark", _S.import_value("fx/projectiles/_lib.js", "spark"))
	_S.define(_e, "cloud", _S.import_value("fx/projectiles/_lib.js", "cloud"))
	_S.define(_e, "casing", _S.import_value("fx/projectiles/_lib.js", "casing"))
	_S.define(_e, "drawCasing", _S.import_value("fx/projectiles/_lib.js", "drawCasing"))
	_S.define(_e, "shots", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "SMG burst"}, {"desc": "Sustained fire at twelve rounds a second: each shot a different spiky flash with a white core, sparks, smoke wisps piling up and drifting, brass casings bouncing on the floor."}, {"tags": ["projectile", "muzzle", "gun", "automatic", "flash", "smoke", "casing", "directional", "loop"]}, {"size": [112, 72]}, {"origin": [56, 66]}, {"duration": 1}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"brass": ["#4a2e10", "#8c5c1c", "#d9a441", "#ffe39a"]}, {"smoke": ["#26222e", "#3b3644", "#544e5e", "#6f6979", "#8c8596", "#aca5b5", "#cbc4d2"]}, {"height": 26}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SHOTS", 12)
	_S.define(_e, "F1", _S.binary("/", 1, 30))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "D", _S.arg(_args, 1))
	_S.define(_e, "life", _S.arg(_args, 2))
	_S.define(_e, "fn", _S.arg(_args, 3))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "s", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "s"), _S.read(_v0, "SHOTS"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "age", _S.call_value(_S.read(_v1, "wrap"), [_S.binary("+", _S.binary("-", _S.read(_v1, "t"), _S.binary("/", _S.binary("*", _S.read(_v1, "s"), _S.read(_v1, "D")), _S.read(_v1, "SHOTS"))), 1e-7), _S.read(_v1, "D")]))
		while _S.truth(_S.binary("<", _S.read(_v1, "age"), _S.read(_v1, "life"))):
			_S.call_value(_S.read(_v1, "fn"), [_S.read(_v1, "s"), _S.read(_v1, "age")])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "age", _S.read(_v1, "D"), "+=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "s", 1, "+=", true)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "brass"), 4]))
	_S.define(_e, "SM", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "smoke"), 7]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "MX", 0)
	_S.define(_e, "MY", _S.unary("-", _S.read(_e, "H")))
	_S.define(_e, "SP", [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 3)])
	_S.define(_e, "top", _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 1))
	_S.define(_e, "pop", 0)
	_S.call_value(_S.read(_e, "shots"), [_S.read(_e, "t"), _S.read(_e, "D"), 0.2, _S.function_value(_e, "_f2")])
	_S.define(_e, "puffs", [])
	_S.call_value(_S.read(_e, "shots"), [_S.read(_e, "t"), _S.read(_e, "D"), 2.2, _S.function_value(_e, "_f3")])
	_S.call_value(_S.read(_e, "cloud"), [_S.read(_e, "p"), _S.read(_e, "puffs"), _S.read(_e, "SM"), [_S.prop(_S.read(_e, "SM"), 0), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 1), _S.prop(_S.read(_e, "SM"), 1), 0.5]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 2), _S.prop(_S.read(_e, "SM"), 2), 0.4]), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 7)], _S.merge([{"dens": 1.4}, {"max": 0.7}, {"lit": 1.3}])])
	_S.call_value(_S.read(_e, "shots"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.read(_e, "D"), _S.function_value(_e, "_f4")])
	_S.call_value(_S.read(_e, "shots"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.binary("*", 2, _S.read(_e, "F1")), _S.function_value(_e, "_f5")])
	_S.call_value(_S.read(_e, "shots"), [_S.read(_e, "t"), _S.read(_e, "D"), 0.3, _S.function_value(_e, "_f6")])
	_S.call_value(_S.read(_e, "shots"), [_S.read(_e, "t"), _S.read(_e, "D"), 0.15, _S.function_value(_e, "_f7")])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	return _S.write(_e, "pop", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "pop"), _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("+", _S.read(_e, "age"), 0.008)), 0.035)])]), "=", false)

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "j"), 3)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "r", _S.call_value(_S.read(_v3, "rng"), [_S.read(_v3, "S"), _S.read(_v3, "s"), _S.read(_v3, "j"), 3]))
		_S.define(_v3, "life", _S.invoke(_S.read(_v3, "r"), "range", [1.5, 2.2]))
		_S.define(_v3, "dl", _S.binary("*", _S.read(_v3, "j"), 0.03))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v3, "age"), _S.read(_v3, "dl")), func(): return _S.binary(">=", _S.binary("-", _S.read(_v3, "age"), _S.read(_v3, "dl")), _S.read(_v3, "life")))):
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "j", 1, "+=", true)
			continue
		_S.define(_v3, "a", _S.binary("-", _S.read(_v3, "age"), _S.read(_v3, "dl")))
		_S.define(_v3, "k", _S.binary("/", _S.read(_v3, "a"), _S.read(_v3, "life")))
		_S.define(_v3, "port", _S.binary("===", _S.read(_v3, "j"), 2))
		_S.define(_v3, "vx", (_S.invoke(_S.read(_v3, "r"), "range", [_S.unary("-", 12), 6]) if _S.truth(_S.read(_v3, "port")) else _S.binary("*", _S.invoke(_S.read(_v3, "r"), "range", [45, 100]), _S.binary("-", 1, _S.binary("*", _S.read(_v3, "j"), 0.4)))))
		_S.define(_v3, "vy", (_S.unary("-", _S.invoke(_S.read(_v3, "r"), "range", [14, 26])) if _S.truth(_S.read(_v3, "port")) else _S.unary("-", _S.invoke(_S.read(_v3, "r"), "range", [4, 16]))))
		_S.define(_v3, "x", _S.binary("+", _S.binary("-", _S.binary("+", (_S.unary("-", 7) if _S.truth(_S.read(_v3, "port")) else _S.binary("+", _S.read(_v3, "MX"), 3)), _S.binary("/", _S.binary("*", _S.read(_v3, "vx"), _S.binary("-", 1, _S.invoke(_S.read(_v3, "Math"), "exp", [_S.binary("*", _S.unary("-", 3.2), _S.read(_v3, "a"))]))), 3.2)), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "r"), "range", [3, 7]), _S.read(_v3, "a")), _S.read(_v3, "a"))), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v3, "a"), 2.1), _S.invoke(_S.read(_v3, "r"), "range", [0, _S.read(_v3, "TAU")]))]), _S.read(_v3, "a")), 2.5)))
		_S.define(_v3, "y", _S.binary("-", _S.binary("+", (_S.binary("-", _S.read(_v3, "MY"), 2) if _S.truth(_S.read(_v3, "port")) else _S.read(_v3, "MY")), _S.binary("/", _S.binary("*", _S.read(_v3, "vy"), _S.binary("-", 1, _S.invoke(_S.read(_v3, "Math"), "exp", [_S.binary("*", _S.unary("-", 2.4), _S.read(_v3, "a"))]))), 2.4)), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.invoke(_S.read(_v3, "r"), "range", [9, 16])), _S.read(_v3, "a")), _S.read(_v3, "a"))))
		_S.define(_v3, "rad", _S.binary("+", (1 if _S.truth(_S.read(_v3, "port")) else 1.2), _S.binary("*", _S.invoke(_S.read(_v3, "r"), "range", [2, 4.5]), _S.binary("-", 1, _S.invoke(_S.read(_v3, "Math"), "exp", [_S.binary("*", _S.unary("-", 1.4), _S.read(_v3, "a"))])))))
		if _S.truth(_S.binary("<", _S.binary("-", _S.read(_v3, "y"), _S.read(_v3, "rad")), _S.binary("+", _S.read(_v3, "top"), 1))):
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "j", 1, "+=", true)
			continue
		_S.define(_v3, "edge", _S.invoke(_S.read(_v3, "Math"), "min", [1, _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v3, "y"), _S.read(_v3, "rad")), _S.read(_v3, "top")), 12)]))
		_S.invoke(_S.read(_v3, "puffs"), "push", [_S.merge([{"x": _S.read(_v3, "x")}, {"y": _S.read(_v3, "y")}, {"r": _S.read(_v3, "rad")}, {"a": _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "min", [1, _S.binary("*", _S.read(_v3, "a"), 10)]), _S.invoke(_S.read(_v3, "Math"), "pow", [_S.binary("-", 1, _S.read(_v3, "k")), 1.6])), (0.24 if _S.truth(_S.read(_v3, "port")) else 0.34)), _S.read(_v3, "edge"))}, {"b": _S.call_value(_S.read(_v3, "clamp"), [_S.binary("-", 0.92, _S.binary("*", _S.read(_v3, "k"), 0.6))])}, {"w": _S.binary("*", _S.read(_v3, "pop"), _S.invoke(_S.read(_v3, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.invoke(_S.read(_v3, "Math"), "hypot", [_S.binary("-", _S.read(_v3, "x"), _S.read(_v3, "MX")), _S.binary("-", _S.read(_v3, "y"), _S.read(_v3, "MY"))])), 9)]))}])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "j", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rng"), [_S.read(_e, "S"), _S.read(_e, "s"), 7]))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "casing"), [_S.unary("-", 7), _S.binary("-", _S.read(_e, "MY"), 1), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [18, 48])), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [85, 135])), _S.binary("*", _S.invoke(_S.read(_e, "r"), "sign", []), _S.invoke(_S.read(_e, "r"), "range", [20, 32])), _S.read(_e, "age"), 850, _S.unary("-", 0.5), 0.42, _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")])]))
	_S.call_value(_S.read(_e, "drawCasing"), [_S.read(_e, "p"), _S.read(_e, "k"), _S.read(_e, "B"), _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "D"), _S.read(_e, "age")), 0.25)])])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rng"), [_S.read(_e, "S"), _S.read(_e, "s")]))
	_S.define(_e, "f", (1 if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.read(_e, "F1"))) else 2))
	_S.define(_e, "tilt", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.06), 0.06]))
	_S.define(_e, "L", _S.call_value(_S.read(_e, "flashShape"), [_S.read(_e, "r"), _S.read(_e, "f"), _S.merge([{"size": _S.invoke(_S.read(_e, "r"), "range", [0.95, 1.2])}, {"spike": [12, 21]}, {"diag": [6, 11]}, {"cross": [4, 7.5]}, {"back": [2.5, 5]}])]))
	_S.define(_e, "C", ([_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 3)] if _S.truth(_S.binary("===", _S.read(_e, "f"), 1)) else [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 2)]))
	_S.call_value(_S.read(_e, "flash"), [_S.read(_e, "p"), _S.read(_e, "MX"), _S.read(_e, "MY"), _S.read(_e, "tilt"), _S.read(_e, "L"), _S.read(_e, "C"), _S.binary("+", _S.binary("*", _S.read(_e, "s"), 7), _S.read(_e, "f"))])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v4 = _S.scope(_e)
	_S.define(_v4, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "j"), 5)):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "r", _S.call_value(_S.read(_v5, "rng"), [_S.read(_v5, "S"), _S.read(_v5, "s"), _S.read(_v5, "j"), 11]))
		_S.define(_v5, "life", _S.binary("*", _S.invoke(_S.read(_v5, "r"), "range", [0.05, 0.16]), (1.8 if _S.truth(_S.binary(">", _S.read(_v5, "j"), 2)) else 1)))
		if _S.truth(_S.binary(">=", _S.read(_v5, "age"), _S.read(_v5, "life"))):
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "j", 1, "+=", true)
			continue
		_S.define(_v5, "a", _S.invoke(_S.read(_v5, "r"), "range", [_S.unary("-", 0.3), 0.3]))
		_S.define(_v5, "sp", _S.binary("*", _S.invoke(_S.read(_v5, "r"), "range", [170, 380]), (0.5 if _S.truth(_S.binary(">", _S.read(_v5, "j"), 2)) else 1)))
		var _v6 = _S.call_value(_S.read(_v5, "fly"), [_S.binary("+", _S.read(_v5, "MX"), 2), _S.read(_v5, "MY"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.read(_v5, "age"), 420, 2.2])
		_S.define(_v5, "x", _S.prop(_v6, 0))
		_S.define(_v5, "y", _S.prop(_v6, 1))
		var _v7 = _S.call_value(_S.read(_v5, "flyV"), [_S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.read(_v5, "age"), 420, 2.2])
		_S.define(_v5, "vx", _S.prop(_v7, 0))
		_S.define(_v5, "vy", _S.prop(_v7, 1))
		if _S.truth(_S.binary(">", _S.read(_v5, "j"), 2)):
			_S.invoke(_S.read(_v5, "p"), "px", [_S.read(_v5, "x"), _S.read(_v5, "y"), (_S.prop(_S.read(_v5, "F"), 6) if _S.truth(_S.binary("<", _S.binary("/", _S.read(_v5, "age"), _S.read(_v5, "life")), 0.5)) else _S.prop(_S.read(_v5, "F"), 4))])
		else:
			_S.call_value(_S.read(_v5, "spark"), [_S.read(_v5, "p"), _S.read(_v5, "x"), _S.read(_v5, "y"), _S.read(_v5, "vx"), _S.read(_v5, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_v5, "age"), _S.read(_v5, "life"))), _S.read(_v5, "SP"), 0.45, 0.011])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "j", 1, "+=", true)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("+", _S.read(_e, "age"), 0.008)), 0.03)]))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.read(_e, "MX"), 4), _S.read(_e, "MY"), 26, _S.prop(_S.read(_e, "F"), 4), _S.binary("*", 0.8, _S.read(_e, "k"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.read(_e, "MX"), 2), _S.read(_e, "MY"), 7, _S.read(_e, "WHITE"), _S.binary("*", 0.45, _S.read(_e, "k"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.read(_e, "MX"), 2), 0, 12, _S.prop(_S.read(_e, "F"), 4), _S.binary("*", 0.16, _S.read(_e, "k"))])
	return null
