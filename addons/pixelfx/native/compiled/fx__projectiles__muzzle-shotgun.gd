@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/muzzle-shotgun.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "flash", _S.import_value("fx/projectiles/_lib.js", "flash"))
	_S.define(_e, "cloud", _S.import_value("fx/projectiles/_lib.js", "cloud"))
	_S.define(_e, "Smoke", _S.import_value("fx/projectiles/_lib.js", "Smoke"))
	_S.define(_e, "casing", _S.import_value("fx/projectiles/_lib.js", "casing"))
	_S.define(_e, "fan", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Shotgun blast"}, {"desc": "A shotgun blast from a muzzle `height` px above the floor (the origin): a wide ragged fan of flame, pellet streaks, a heavy rolling smoke cloud, a red shell kicked out on the pump."}, {"tags": ["projectile", "muzzle", "gun", "shotgun", "flash", "smoke", "casing", "directional", "one-shot"]}, {"size": [160, 88]}, {"origin": [44, 82]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"smoke": ["#221e2a", "#36313f", "#4e4858", "#6a6474", "#888192", "#a8a1b1", "#c8c1cf"]}, {"shell": ["#4a0f14", "#9a1e22", "#d8423a", "#8c5c1c", "#e9b54a"]}, {"height": 26}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "F1", _S.binary("/", 1, 30))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "f", _S.arg(_args, 1))
	_S.define(_e, "k", (1 if _S.truth(_S.binary("===", _S.read(_e, "f"), 1)) else (0.82 if _S.truth(_S.binary("===", _S.read(_e, "f"), 2)) else 0.55)))
	_S.define(_e, "w", (1 if _S.truth(_S.binary("===", _S.read(_e, "f"), 1)) else 1.25))
	_S.define(_e, "L", [_S.merge([{"off": 0.5}, {"a": 0}, {"len": _S.binary("*", 11, _S.read(_e, "k"))}, {"wid": _S.binary("*", 3.6, _S.read(_e, "w"))}, {"core": 0.5}])])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 9)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "u", _S.binary("-", _S.binary("/", _S.read(_v1, "i"), 8), 0.5))
		_S.define(_v1, "a", _S.binary("+", _S.binary("*", _S.read(_v1, "u"), 1.15), _S.binary("*", _S.prop(_S.read(_v1, "R"), _S.binary("*", _S.read(_v1, "i"), 3)), 0.12)))
		_S.define(_v1, "len", _S.binary("*", _S.binary("+", _S.binary("+", 17, _S.binary("*", 11, _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "abs", [_S.read(_v1, "u")]), 1.4)))), _S.binary("*", _S.prop(_S.read(_v1, "R"), _S.binary("+", _S.binary("*", _S.read(_v1, "i"), 3), 1)), 7)), _S.read(_v1, "k")))
		_S.invoke(_S.read(_v1, "L"), "push", [_S.merge([{"off": 2}, {"a": _S.read(_v1, "a")}, {"len": _S.read(_v1, "len")}, {"wid": _S.binary("*", _S.binary("+", 1.7, _S.prop(_S.read(_v1, "R"), _S.binary("+", _S.binary("*", _S.read(_v1, "i"), 3), 2))), _S.read(_v1, "w"))}, {"core": (0.32 if _S.truth(_S.binary("===", _S.read(_v1, "f"), 1)) else 0)}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	if _S.truth(_S.binary("===", _S.read(_e, "f"), 1)):
		for _v2 in _S.array([_S.unary("-", 1), 1]):
			var _v3 = _S.scope(_e)
			_S.define(_v3, "s", _v2)
			_S.invoke(_S.read(_v3, "L"), "push", [_S.merge([{"off": 1}, {"a": _S.binary("*", _S.read(_v3, "s"), _S.binary("+", 1.6, _S.binary("*", _S.prop(_S.read(_v3, "R"), _S.binary("+", 27, _S.binary(">", _S.read(_v3, "s"), 0))), 0.4)))}, {"len": _S.binary("+", 5, _S.binary("*", _S.prop(_S.read(_v3, "R"), 29), 3))}, {"wid": 1.2}, {"core": 0}])])
	return _S.read(_e, "L")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "SM", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "smoke"), 7]))
	_S.define(_e, "SH", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "shell"), 5]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "MY", _S.unary("-", _S.read(_e, "H")))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f2")}, {"sparks": [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 3)]}])]))
	_S.define(_e, "smoke", _S.construct(_S.read(_e, "Smoke"), [_S.read(_e, "R")]))
	_S.define(_e, "right", _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 0), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 2))
	_S.define(_e, "jit", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 32}]), _S.function_value(_e, "_f3")]))
	_S.define(_e, "pellets", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 10}]), _S.function_value(_e, "_f4")]))
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), 16)):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "a", _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 0.55), 0.55]))
		_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "R"), "range", [180, 460]))
		_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "SPARK"), 4, _S.read(_v5, "MY"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), 20), _S.invoke(_S.read(_v5, "R"), "range", [0.08, 0.3])])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 7)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 0.5), 0.3]))
		_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "R"), "range", [70, 200]))
		_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "EMBER"), 4, _S.read(_v7, "MY"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.invoke(_S.read(_v7, "R"), "range", [0.4, 0.9]), _S.prop(_S.read(_v7, "F"), 5)])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), 26)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "a", _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 0.45), 0.35]))
		_S.define(_v9, "sp", _S.binary("*", _S.invoke(_S.read(_v9, "R"), "range", [60, 230]), (1.15 if _S.truth(_S.binary("<", _S.read(_v9, "i"), 8)) else 0.8)))
		_S.invoke(_S.read(_v9, "smoke"), "add", [_S.merge([{"x": _S.binary("+", 4, _S.invoke(_S.read(_v9, "R"), "range", [0, 4]))}, {"y": _S.binary("+", _S.read(_v9, "MY"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 1.5), 1.5]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "sp"))}, {"r0": _S.invoke(_S.read(_v9, "R"), "range", [2.5, 3.5])}, {"r1": _S.invoke(_S.read(_v9, "R"), "range", [7, 12.5])}, {"life": _S.invoke(_S.read(_v9, "R"), "range", [2.1, 2.9])}, {"a": _S.invoke(_S.read(_v9, "R"), "range", [0.55, 0.72])}, {"b": _S.invoke(_S.read(_v9, "R"), "range", [0.9, 1])}, {"drag": _S.invoke(_S.read(_v9, "R"), "range", [2.6, 3.6])}, {"rise": _S.invoke(_S.read(_v9, "R"), "range", [9, 15])}, {"grow": _S.invoke(_S.read(_v9, "R"), "range", [1.8, 2.8])}, {"warm": 1}, {"delay": _S.invoke(_S.read(_v9, "R"), "range", [0, 0.04])}])])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), 6)):
		_S.invoke(_S.read(_v10, "smoke"), "add", [_S.merge([{"x": 2}, {"y": _S.read(_v10, "MY")}, {"vx": _S.invoke(_S.read(_v10, "R"), "range", [15, 50])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [10, 25]))}, {"r0": 1.5}, {"r1": _S.invoke(_S.read(_v10, "R"), "range", [4, 6])}, {"life": _S.invoke(_S.read(_v10, "R"), "range", [1.8, 2.4])}, {"a": 0.5}, {"b": 1}, {"drag": 2}, {"rise": 10}, {"curl": _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [1.5, 3]))}, {"warm": 0.6}, {"delay": _S.binary("+", 0.08, _S.binary("*", _S.read(_v10, "i"), 0.05))}])])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	_S.define(_e, "shell", _S.merge([{"t0": 0.42}, {"vx": _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [30, 55]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [110, 150]))}, {"va": _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), _S.invoke(_S.read(_e, "R"), "range", [16, 24]))}, {"a0": _S.invoke(_S.read(_e, "R"), "range", [0, 6.28])}]))
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.invoke(_S.read(_e, "R"), "next", [])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.merge([{"a": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.13), 0.13])}, {"v": _S.invoke(_S.read(_e, "R"), "range", [900, 1150])}, {"d0": _S.invoke(_S.read(_e, "R"), "range", [0, 4])}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "smoke"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "pop", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("+", _S.read(_e, "t"), 0.008)), 0.05)]))
	_S.define(_e, "list", _S.invoke(_S.read(_e, "smoke"), "puffs", []))
	for _v11 in _S.array(_S.read(_e, "list")):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "q", _v11)
		_S.set_prop(_S.read(_v12, "q"), "w", _S.binary("+", 0.25, _S.binary("*", _S.read(_v12, "pop"), 1.2)), "*=", false)
	_S.call_value(_S.read(_e, "cloud"), [_S.read(_e, "p"), _S.read(_e, "list"), _S.read(_e, "SM"), [_S.prop(_S.read(_e, "SM"), 0), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 1), _S.prop(_S.read(_e, "SM"), 1), 0.5]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 2), _S.prop(_S.read(_e, "SM"), 2), 0.4]), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 7)], _S.merge([{"dens": 1.4}, {"max": 0.86}, {"lit": 1.4}])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.prop(_S.read(_e, "shell"), "t0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05)))):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "k", _S.call_value(_S.read(_v13, "casing"), [_S.unary("-", 9), _S.read(_v13, "MY"), _S.prop(_S.read(_v13, "shell"), "vx"), _S.prop(_S.read(_v13, "shell"), "vy"), _S.prop(_S.read(_v13, "shell"), "va"), _S.binary("-", _S.read(_v13, "t"), _S.prop(_S.read(_v13, "shell"), "t0")), 850, _S.unary("-", 1), 0.35, _S.prop(_S.read(_v13, "shell"), "a0")]))
		_S.define(_v13, "ca", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.prop(_S.read(_v13, "k"), "a")]))
		_S.define(_v13, "sa", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.prop(_S.read(_v13, "k"), "a")]))
		_S.define(_v13, "fade", _S.call_value(_S.read(_v13, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.prop(_S.read(_v13, "meta"), "duration"), 0.05), _S.read(_v13, "t")), 0.3)]))
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "d", _S.unary("-", 1.5))
		while _S.truth(_S.binary("<=", _S.read(_v14, "d"), 1.5)):
			_S.invoke(_S.read(_v14, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v14, "k"), "x"), _S.binary("*", _S.read(_v14, "ca"), _S.read(_v14, "d"))), _S.binary("-", _S.binary("+", _S.prop(_S.read(_v14, "k"), "y"), _S.binary("*", _S.read(_v14, "sa"), _S.read(_v14, "d"))), 0.5), ((_S.prop(_S.read(_v14, "SH"), 4) if _S.truth(_S.binary(">", _S.read(_v14, "d"), 1.2)) else _S.prop(_S.read(_v14, "SH"), 3)) if _S.truth(_S.binary(">", _S.read(_v14, "d"), 0.8)) else (_S.prop(_S.read(_v14, "SH"), 2) if _S.truth(_S.binary(">", _S.read(_v14, "d"), _S.unary("-", 0.6))) else _S.prop(_S.read(_v14, "SH"), 1))), _S.read(_v14, "fade")])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "d", 0.5, "+=", false)
		var _v15 = _S.scope(_v13)
		_S.define(_v15, "d", _S.unary("-", 1))
		while _S.truth(_S.binary("<=", _S.read(_v15, "d"), 1)):
			_S.invoke(_S.read(_v15, "p"), "dot", [_S.binary("-", _S.binary("+", _S.prop(_S.read(_v15, "k"), "x"), _S.binary("*", _S.read(_v15, "ca"), _S.read(_v15, "d"))), _S.read(_v15, "sa")), _S.binary("-", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v15, "k"), "y"), _S.binary("*", _S.read(_v15, "sa"), _S.read(_v15, "d"))), _S.read(_v15, "ca")), 0.5), (_S.prop(_S.read(_v15, "SH"), 3) if _S.truth(_S.binary(">", _S.read(_v15, "d"), 0.6)) else _S.prop(_S.read(_v15, "SH"), 0)), _S.read(_v15, "fade")])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "d", 0.5, "+=", false)
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v13, "k"), "hit"), 0), func(): return _S.binary("<", _S.prop(_S.read(_v13, "k"), "hit"), 0.07))):
			_S.invoke(_S.read(_v13, "p"), "glow", [_S.prop(_S.read(_v13, "k"), "x"), _S.prop(_S.read(_v13, "k"), "y"), 5, _S.prop(_S.read(_v13, "SH"), 4), _S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_v13, "k"), "hit"), 0.07)))])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("*", 3, _S.read(_e, "F1")))):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "f", (1 if _S.truth(_S.binary("<", _S.read(_v16, "t"), _S.read(_v16, "F1"))) else (2 if _S.truth(_S.binary("<", _S.read(_v16, "t"), _S.binary("*", 2, _S.read(_v16, "F1")))) else 3)))
		_S.call_value(_S.read(_v16, "flash"), [_S.read(_v16, "p"), 0, _S.read(_v16, "MY"), 0, _S.call_value(_S.read(_v16, "fan"), [_S.read(_v16, "jit"), _S.read(_v16, "f")]), ([_S.read(_v16, "WHITE"), _S.prop(_S.read(_v16, "F"), 7), _S.prop(_S.read(_v16, "F"), 6), _S.prop(_S.read(_v16, "F"), 3)] if _S.truth(_S.binary("===", _S.read(_v16, "f"), 1)) else ([_S.prop(_S.read(_v16, "F"), 7), _S.prop(_S.read(_v16, "F"), 6), _S.prop(_S.read(_v16, "F"), 4), _S.prop(_S.read(_v16, "F"), 2)] if _S.truth(_S.binary("===", _S.read(_v16, "f"), 2)) else [_S.prop(_S.read(_v16, "F"), 5), _S.prop(_S.read(_v16, "F"), 4), _S.prop(_S.read(_v16, "F"), 3), _S.prop(_S.read(_v16, "F"), 1)])), _S.binary("+", _S.read(_v16, "f"), 9)])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.2)):
		for _v17 in _S.array(_S.read(_e, "pellets")):
			var _v18 = _S.scope(_e)
			_S.define(_v18, "q", _v17)
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "head", _S.binary("+", _S.binary("+", 6, _S.prop(_S.read(_v19, "q"), "d0")), _S.binary("*", _S.prop(_S.read(_v19, "q"), "v"), _S.read(_v19, "t"))))
			_S.define(_v19, "tail", _S.invoke(_S.read(_v19, "Math"), "max", [4, _S.binary("-", _S.read(_v19, "head"), 26)]))
			_S.define(_v19, "ca", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.prop(_S.read(_v19, "q"), "a")]))
			_S.define(_v19, "sa", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.prop(_S.read(_v19, "q"), "a")]))
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "d", _S.read(_v20, "tail"))
			while _S.truth(_S.binary("<=", _S.read(_v20, "d"), _S.read(_v20, "head"))):
				var _v21 = _S.scope(_v20)
				_S.define(_v21, "x", _S.binary("*", _S.read(_v21, "ca"), _S.read(_v21, "d")))
				if _S.truth(_S.binary(">", _S.read(_v21, "x"), _S.read(_v21, "right"))):
					break
				_S.define(_v21, "u", _S.binary("/", _S.binary("-", _S.read(_v21, "d"), _S.read(_v21, "tail")), _S.invoke(_S.read(_v21, "Math"), "max", [1, _S.binary("-", _S.read(_v21, "head"), _S.read(_v21, "tail"))])))
				_S.invoke(_S.read(_v21, "p"), "dot", [_S.read(_v21, "x"), _S.binary("+", _S.read(_v21, "MY"), _S.binary("*", _S.read(_v21, "sa"), _S.read(_v21, "d"))), (_S.read(_v21, "WHITE") if _S.truth(_S.binary(">", _S.read(_v21, "u"), 0.85)) else (_S.prop(_S.read(_v21, "F"), 6) if _S.truth(_S.binary(">", _S.read(_v21, "u"), 0.5)) else _S.prop(_S.read(_v21, "F"), 4))), (1 if _S.truth(_S.binary(">", _S.read(_v21, "u"), 0.3)) else _S.binary("/", _S.read(_v21, "u"), 0.3))])
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "d", 0.5, "+=", false)
			if _S.truth(_S.binary("<", _S.binary("*", _S.read(_v19, "ca"), _S.read(_v19, "head")), _S.read(_v19, "right"))):
				_S.invoke(_S.read(_v19, "p"), "glow", [_S.binary("*", _S.read(_v19, "ca"), _S.read(_v19, "head")), _S.binary("+", _S.read(_v19, "MY"), _S.binary("*", _S.read(_v19, "sa"), _S.read(_v19, "head"))), 4, _S.prop(_S.read(_v19, "F"), 6), 0.5])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "p"), "glow", [8, _S.read(_e, "MY"), 46, _S.prop(_S.read(_e, "F"), 4), _S.binary("*", 0.95, _S.read(_e, "pop"))])
	_S.invoke(_S.read(_e, "p"), "glow", [4, _S.read(_e, "MY"), 12, _S.read(_e, "WHITE"), _S.binary("*", 0.6, _S.read(_e, "pop"))])
	_S.invoke(_S.read(_e, "p"), "glow", [10, 0, 30, _S.prop(_S.read(_e, "F"), 4), _S.binary("*", 0.28, _S.read(_e, "pop"))])
	return null
