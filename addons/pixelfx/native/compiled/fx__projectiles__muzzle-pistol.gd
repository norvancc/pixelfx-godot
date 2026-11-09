@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/muzzle-pistol.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "flashShape", _S.import_value("fx/projectiles/_lib.js", "flashShape"))
	_S.define(_e, "flash", _S.import_value("fx/projectiles/_lib.js", "flash"))
	_S.define(_e, "cloud", _S.import_value("fx/projectiles/_lib.js", "cloud"))
	_S.define(_e, "Smoke", _S.import_value("fx/projectiles/_lib.js", "Smoke"))
	_S.define(_e, "casing", _S.import_value("fx/projectiles/_lib.js", "casing"))
	_S.define(_e, "drawCasing", _S.import_value("fx/projectiles/_lib.js", "drawCasing"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Pistol shot"}, {"desc": "One pistol shot from a muzzle `height` px above the floor (the origin): a spiky white-cored flash, sparks, a curl of smoke hooking up and back, a casing that bounces and settles."}, {"tags": ["projectile", "muzzle", "gun", "pistol", "flash", "smoke", "casing", "directional", "one-shot"]}, {"size": [96, 72]}, {"origin": [44, 66]}, {"duration": 1.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"brass": ["#4a2e10", "#8c5c1c", "#d9a441", "#ffe39a"]}, {"smoke": ["#26222e", "#3b3644", "#544e5e", "#6f6979", "#8c8596", "#aca5b5", "#cbc4d2"]}, {"height": 26}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "F1", _S.binary("/", 1, 30))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "brass"), 4]))
	_S.define(_e, "SM", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "smoke"), 7]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "MY", _S.unary("-", _S.read(_e, "H")))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 3)]}])]))
	_S.define(_e, "smoke", _S.construct(_S.read(_e, "Smoke"), [_S.read(_e, "R")]))
	_S.define(_e, "shapeSeed", _S.invoke(_S.read(_e, "R"), "int", [0, 1000000]))
	_S.define(_e, "tilt", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.05), 0.05]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 6)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 0.3), 0.3]))
		_S.define(_v1, "sp", _S.invoke(_S.read(_v1, "R"), "range", [180, 400]))
		_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "SPARK"), 3, _S.read(_v1, "MY"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), _S.invoke(_S.read(_v1, "R"), "range", [0.06, 0.16])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 5)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 0.35), 0.25]))
		_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [60, 160]))
		_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "EMBER"), 3, _S.read(_v3, "MY"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.invoke(_S.read(_v3, "R"), "range", [0.25, 0.5]), _S.prop(_S.read(_v3, "F"), 5)])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), 3)):
		_S.invoke(_S.read(_v4, "smoke"), "add", [_S.merge([{"x": 3}, {"y": _S.read(_v4, "MY")}, {"vx": _S.invoke(_S.read(_v4, "R"), "range", [70, 120])}, {"vy": _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 12), 6])}, {"r0": 1.6}, {"r1": _S.invoke(_S.read(_v4, "R"), "range", [4.5, 6])}, {"life": _S.invoke(_S.read(_v4, "R"), "range", [0.8, 1.05])}, {"a": 0.55}, {"drag": 3.5}, {"rise": 10}, {"warm": 0.9}, {"delay": _S.binary("*", _S.read(_v4, "i"), 0.012)}])])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), 14)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "k", _S.binary("/", _S.read(_v6, "i"), 13))
		_S.invoke(_S.read(_v6, "smoke"), "add", [_S.merge([{"x": 2}, {"y": _S.read(_v6, "MY")}, {"vx": _S.binary("+", _S.binary("-", 115, _S.binary("*", 75, _S.read(_v6, "k"))), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 12), 12]))}, {"vy": _S.binary("+", _S.binary("-", _S.unary("-", 6), _S.binary("*", 10, _S.read(_v6, "k"))), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 5), 5]))}, {"r0": 1.4}, {"r1": _S.binary("*", _S.binary("+", 3.6, _S.binary("*", _S.read(_v6, "k"), 2.6)), _S.invoke(_S.read(_v6, "R"), "range", [0.75, 1.25]))}, {"life": _S.binary("+", 1.15, _S.binary("*", _S.read(_v6, "k"), 0.3))}, {"a": 0.62}, {"b": _S.invoke(_S.read(_v6, "R"), "range", [0.85, 1])}, {"drag": 2.2}, {"rise": 6}, {"curl": _S.binary("+", _S.binary("+", _S.unary("-", 4.4), _S.binary("*", _S.read(_v6, "k"), 1.8)), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 0.5), 0.5]))}, {"grow": 1.6}, {"warm": 0.7}, {"delay": _S.binary("+", 0.02, _S.binary("*", _S.read(_v6, "i"), 0.022))}])])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "smoke"), "add", [_S.merge([{"x": _S.unary("-", 7)}, {"y": _S.binary("-", _S.read(_e, "MY"), 2)}, {"vx": _S.unary("-", 6)}, {"vy": _S.unary("-", 18)}, {"r0": 1.2}, {"r1": 4}, {"life": 1.05}, {"a": 0.4}, {"rise": 8}, {"delay": 0.03}])])
	_S.define(_e, "shell", _S.merge([{"vx": _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [25, 45]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [95, 130]))}, {"va": _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), _S.invoke(_S.read(_e, "R"), "range", [22, 32]))}, {"a0": _S.invoke(_S.read(_e, "R"), "range", [0, 6.28])}]))
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f2")}, {"draw": _S.function_value(_e, "_f3")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "smoke"), "update", [_S.read(_e, "dt")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "pop", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("+", _S.read(_e, "t"), 0.008)), 0.035)]))
	_S.define(_e, "list", _S.invoke(_S.read(_e, "smoke"), "puffs", []))
	for _v7 in _S.array(_S.read(_e, "list")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "q", _v7)
		_S.set_prop(_S.read(_v8, "q"), "w", _S.binary("+", 0.4, _S.read(_v8, "pop")), "*=", false)
	_S.call_value(_S.read(_e, "cloud"), [_S.read(_e, "p"), _S.read(_e, "list"), _S.read(_e, "SM"), [_S.prop(_S.read(_e, "SM"), 0), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 1), _S.prop(_S.read(_e, "SM"), 1), 0.5]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 2), _S.prop(_S.read(_e, "SM"), 2), 0.4]), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 7)], _S.merge([{"dens": 1.5}, {"max": 0.8}, {"lit": 1.4}])])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"))):
		_S.call_value(_S.read(_e, "drawCasing"), [_S.read(_e, "p"), _S.call_value(_S.read(_e, "casing"), [_S.unary("-", 7), _S.binary("-", _S.read(_e, "MY"), 1), _S.prop(_S.read(_e, "shell"), "vx"), _S.prop(_S.read(_e, "shell"), "vy"), _S.prop(_S.read(_e, "shell"), "va"), _S.read(_e, "t"), 850, _S.unary("-", 0.5), 0.42, _S.prop(_S.read(_e, "shell"), "a0")]), _S.read(_e, "B"), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05), _S.read(_e, "t")), 0.3)])])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("*", 2, _S.read(_e, "F1")))):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "f", (1 if _S.truth(_S.binary("<", _S.read(_v9, "t"), _S.read(_v9, "F1"))) else 2))
		_S.define(_v9, "L", _S.call_value(_S.read(_v9, "flashShape"), [_S.call_value(_S.read(_v9, "rng"), [_S.read(_v9, "shapeSeed")]), _S.read(_v9, "f"), _S.merge([{"size": 1.15}, {"spike": [15, 22]}, {"diag": [7, 12]}, {"cross": [4.5, 8]}, {"back": [3, 5.5]}])]))
		_S.call_value(_S.read(_v9, "flash"), [_S.read(_v9, "p"), 0, _S.read(_v9, "MY"), _S.read(_v9, "tilt"), _S.read(_v9, "L"), ([_S.read(_v9, "WHITE"), _S.prop(_S.read(_v9, "F"), 7), _S.prop(_S.read(_v9, "F"), 6), _S.prop(_S.read(_v9, "F"), 3)] if _S.truth(_S.binary("===", _S.read(_v9, "f"), 1)) else [_S.prop(_S.read(_v9, "F"), 7), _S.prop(_S.read(_v9, "F"), 6), _S.prop(_S.read(_v9, "F"), 4), _S.prop(_S.read(_v9, "F"), 2)]), _S.binary("+", _S.read(_v9, "f"), _S.prop(_S.read(_v9, "o"), "seed"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "p"), "glow", [4, _S.read(_e, "MY"), 30, _S.prop(_S.read(_e, "F"), 4), _S.binary("*", 0.85, _S.read(_e, "pop"))])
	_S.invoke(_S.read(_e, "p"), "glow", [2, _S.read(_e, "MY"), 8, _S.read(_e, "WHITE"), _S.binary("*", 0.5, _S.read(_e, "pop"))])
	_S.invoke(_S.read(_e, "p"), "glow", [4, 0, 16, _S.prop(_S.read(_e, "F"), 4), _S.binary("*", 0.2, _S.read(_e, "pop"))])
	return null
