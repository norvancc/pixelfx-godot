@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/cannonball.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "flash", _S.import_value("fx/projectiles/_lib.js", "flash"))
	_S.define(_e, "cloud", _S.import_value("fx/projectiles/_lib.js", "cloud"))
	_S.define(_e, "Smoke", _S.import_value("fx/projectiles/_lib.js", "Smoke"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Cannon shot"}, {"desc": "A cannon fires from a muzzle `height` px above the floor (the origin): a white flash, a tongue of flame, the ball arcing off trailing smoke, a big gunsmoke cloud rolling out."}, {"tags": ["projectile", "cannon", "cannonball", "smoke", "flash", "directional", "one-shot"]}, {"size": [208, 116]}, {"origin": [48, 102]}, {"duration": 3.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"smoke": ["#3a3542", "#55505e", "#736d7c", "#938d9b", "#b3adba", "#d2cdd6", "#ece8ee"]}, {"iron": ["#141218", "#2c2a34", "#4c4a58", "#8a8898"]}, {"height": 12}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "ANG", _S.unary("-", 0.32))
	_S.define(_e, "F1", _S.binary("/", 1, 30))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "SM", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "smoke"), 7]))
	_S.define(_e, "IR", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "iron"), 4]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "MY", _S.unary("-", _S.read(_e, "H")))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 3)]}])]))
	_S.define(_e, "smoke", _S.construct(_S.read(_e, "Smoke"), [_S.read(_e, "R")]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ANG")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ANG")]))
	_S.define(_e, "right", _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 0), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 3))
	_S.define(_e, "top", _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 3))
	_S.define(_e, "ball", _S.merge([{"x": 4}, {"y": _S.read(_e, "MY")}, {"vx": _S.binary("*", _S.read(_e, "ca"), 330)}, {"vy": _S.binary("*", _S.read(_e, "sa"), 330)}, {"out": false}]))
	_S.define(_e, "jit", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 16}]), _S.function_value(_e, "_f2")]))
	_S.invoke(_S.read(_e, "lights"), "add", [12, _S.binary("-", _S.read(_e, "MY"), 2), 44, _S.call_value(_S.read(_e, "hex"), ["#ffb060"]), 1, 0.35])
	_S.invoke(_S.read(_e, "lights"), "add", [6, _S.read(_e, "MY"), 18, _S.read(_e, "WHITE"), 0.9, 0.08])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 22)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.binary("+", _S.read(_v1, "ANG"), _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 0.45), 0.45])))
		_S.define(_v1, "sp", _S.invoke(_S.read(_v1, "R"), "range", [140, 380]))
		_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "SPARK"), 6, _S.read(_v1, "MY"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), _S.invoke(_S.read(_v1, "R"), "range", [0.1, 0.4])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 10)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "a", _S.binary("+", _S.read(_v3, "ANG"), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 0.3), 0.3])))
		_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [70, 170]))
		_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "SPARK"), 6, _S.read(_v3, "MY"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.invoke(_S.read(_v3, "R"), "range", [0.5, 0.9])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), 8)):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "a", _S.binary("+", _S.read(_v5, "ANG"), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 0.5), 0.3])))
		_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "R"), "range", [40, 110]))
		_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "EMBER"), 8, _S.read(_v5, "MY"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.invoke(_S.read(_v5, "R"), "range", [0.7, 1.4]), _S.prop(_S.read(_v5, "F"), 5), 2])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 34)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "a", _S.binary("+", _S.read(_v7, "ANG"), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 0.4), 0.35])))
		_S.define(_v7, "sp", _S.binary("*", _S.invoke(_S.read(_v7, "R"), "range", [40, 260]), (1.1 if _S.truth(_S.binary("<", _S.read(_v7, "i"), 12)) else 0.75)))
		_S.invoke(_S.read(_v7, "smoke"), "add", [_S.merge([{"x": _S.binary("+", 6, _S.invoke(_S.read(_v7, "R"), "range", [0, 6]))}, {"y": _S.binary("+", _S.read(_v7, "MY"), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 2), 2]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp"))}, {"r0": _S.invoke(_S.read(_v7, "R"), "range", [3, 4.5])}, {"r1": _S.invoke(_S.read(_v7, "R"), "range", [9, 16])}, {"life": _S.invoke(_S.read(_v7, "R"), "range", [2.7, 3.5])}, {"a": _S.invoke(_S.read(_v7, "R"), "range", [0.6, 0.75])}, {"b": _S.invoke(_S.read(_v7, "R"), "range", [0.9, 1])}, {"drag": _S.invoke(_S.read(_v7, "R"), "range", [2.2, 3.2])}, {"rise": _S.invoke(_S.read(_v7, "R"), "range", [7, 13])}, {"grow": _S.invoke(_S.read(_v7, "R"), "range", [1.5, 2.4])}, {"curl": _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 1.2), 0.4])}, {"warm": 1}, {"delay": _S.invoke(_S.read(_v7, "R"), "range", [0, 0.05])}])])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "wisp", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.invoke(_S.read(_e, "R"), "next", [])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "ball"), "out"))):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "x0", _S.prop(_S.read(_v8, "ball"), "x"))
		_S.define(_v8, "y0", _S.prop(_S.read(_v8, "ball"), "y"))
		_S.set_prop(_S.read(_v8, "ball"), "vy", _S.binary("*", 260, _S.read(_v8, "dt")), "+=", false)
		_S.set_prop(_S.read(_v8, "ball"), "x", _S.binary("*", _S.prop(_S.read(_v8, "ball"), "vx"), _S.read(_v8, "dt")), "+=", false)
		_S.set_prop(_S.read(_v8, "ball"), "y", _S.binary("*", _S.prop(_S.read(_v8, "ball"), "vy"), _S.read(_v8, "dt")), "+=", false)
		var _v9 = _S.scope(_v8)
		_S.write(_v9, "wisp", _S.binary("/", _S.invoke(_S.read(_v9, "Math"), "hypot", [_S.binary("-", _S.prop(_S.read(_v9, "ball"), "x"), _S.read(_v9, "x0")), _S.binary("-", _S.prop(_S.read(_v9, "ball"), "y"), _S.read(_v9, "y0"))]), 2), "+=", false)
		while _S.truth(_S.binary(">", _S.read(_v9, "wisp"), 1)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "f", _S.invoke(_S.read(_v10, "R"), "next", []))
			_S.define(_v10, "x", _S.binary("+", _S.read(_v10, "x0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v10, "ball"), "x"), _S.read(_v10, "x0")), _S.read(_v10, "f"))))
			_S.define(_v10, "y", _S.binary("+", _S.read(_v10, "y0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v10, "ball"), "y"), _S.read(_v10, "y0")), _S.read(_v10, "f"))))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v10, "x"), _S.binary("-", _S.read(_v10, "right"), 8)), func(): return _S.binary(">", _S.read(_v10, "x"), 24)), func(): return _S.binary("<", _S.read(_v10, "t"), 0.6))):
				_S.invoke(_S.read(_v10, "smoke"), "add", [_S.merge([{"x": _S.binary("-", _S.read(_v10, "x"), 3)}, {"y": _S.read(_v10, "y")}, {"vx": _S.binary("*", _S.unary("-", _S.prop(_S.read(_v10, "ball"), "vx")), 0.04)}, {"vy": _S.binary("*", _S.unary("-", _S.prop(_S.read(_v10, "ball"), "vy")), 0.04)}, {"r0": 1}, {"r1": _S.binary("*", _S.invoke(_S.read(_v10, "R"), "range", [2.5, 3.6]), _S.binary("-", 1, _S.read(_v10, "t")))}, {"life": _S.invoke(_S.read(_v10, "R"), "range", [0.7, 1.1])}, {"a": _S.binary("*", 0.5, _S.binary("-", 1, _S.read(_v10, "t")))}, {"b": 0.95}, {"drag": 2}, {"rise": 5}, {"grow": 2}])])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "wisp", 1, "-=", true)
		if _S.truth(_S.logical("||", _S.binary(">", _S.prop(_S.read(_v8, "ball"), "x"), _S.read(_v8, "right")), func(): return _S.binary("<", _S.prop(_S.read(_v8, "ball"), "y"), _S.read(_v8, "top")))):
			_S.set_prop(_S.read(_v8, "ball"), "out", true, "=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "smoke"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "pop", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("+", _S.read(_e, "t"), 0.008)), 0.06)]))
	_S.define(_e, "list", _S.invoke(_S.read(_e, "smoke"), "puffs", []))
	for _v11 in _S.array(_S.read(_e, "list")):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "q", _v11)
		_S.set_prop(_S.read(_v12, "q"), "w", _S.binary("+", 0.2, _S.binary("*", _S.read(_v12, "pop"), 1.3)), "*=", false)
	_S.call_value(_S.read(_e, "cloud"), [_S.read(_e, "p"), _S.read(_e, "list"), _S.read(_e, "SM"), [_S.prop(_S.read(_e, "SM"), 0), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 1), _S.prop(_S.read(_e, "SM"), 1), 0.5]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 2), _S.prop(_S.read(_e, "SM"), 2), 0.45]), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 7)], _S.merge([{"dens": 1.35}, {"max": 0.86}, {"lit": 1.3}])])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "ball"), "out"))):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "x", _S.prop(_S.read(_v13, "ball"), "x"))
		_S.define(_v13, "y", _S.prop(_S.read(_v13, "ball"), "y"))
		_S.invoke(_S.read(_v13, "p"), "circle", [_S.read(_v13, "x"), _S.read(_v13, "y"), 3.2, _S.prop(_S.read(_v13, "IR"), 0)])
		_S.invoke(_S.read(_v13, "p"), "circle", [_S.read(_v13, "x"), _S.read(_v13, "y"), 2.6, _S.prop(_S.read(_v13, "IR"), 1)])
		_S.invoke(_S.read(_v13, "p"), "circle", [_S.binary("-", _S.read(_v13, "x"), 0.7), _S.binary("-", _S.read(_v13, "y"), 0.7), 1.8, _S.prop(_S.read(_v13, "IR"), 2)])
		_S.last([_S.invoke(_S.read(_v13, "p"), "px", [_S.binary("-", _S.read(_v13, "x"), 1), _S.binary("-", _S.read(_v13, "y"), 1.5), _S.prop(_S.read(_v13, "IR"), 3)]), _S.invoke(_S.read(_v13, "p"), "px", [_S.binary("-", _S.read(_v13, "x"), 2), _S.binary("-", _S.read(_v13, "y"), 1), _S.prop(_S.read(_v13, "IR"), 3)])])
		_S.invoke(_S.read(_v13, "p"), "px", [_S.binary("+", _S.read(_v13, "x"), 1.5), _S.binary("+", _S.read(_v13, "y"), 1), (_S.prop(_S.read(_v13, "F"), 5) if _S.truth(_S.binary("<", _S.read(_v13, "t"), 0.3)) else _S.prop(_S.read(_v13, "IR"), 2))])
		_S.invoke(_S.read(_v13, "p"), "glow", [_S.read(_v13, "x"), _S.read(_v13, "y"), 6, _S.prop(_S.read(_v13, "F"), 4), _S.binary("*", 0.45, _S.call_value(_S.read(_v13, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.read(_v13, "t"), 0.5))]))])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("*", 3, _S.read(_e, "F1")))):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "f", (1 if _S.truth(_S.binary("<", _S.read(_v14, "t"), _S.read(_v14, "F1"))) else (2 if _S.truth(_S.binary("<", _S.read(_v14, "t"), _S.binary("*", 2, _S.read(_v14, "F1")))) else 3)))
		_S.define(_v14, "k", _S.binary("*", (1 if _S.truth(_S.binary("===", _S.read(_v14, "f"), 1)) else (1.15 if _S.truth(_S.binary("===", _S.read(_v14, "f"), 2)) else 0.8)), 1.3))
		_S.define(_v14, "L", [_S.merge([{"off": 0}, {"a": 0}, {"len": _S.binary("*", 12, _S.read(_v14, "k"))}, {"wid": _S.binary("*", 5, _S.read(_v14, "k"))}, {"core": 0.55}]), _S.merge([{"off": 2}, {"a": 0}, {"len": _S.binary("*", _S.binary("+", 24, _S.binary("*", _S.prop(_S.read(_v14, "jit"), 0), 8)), _S.read(_v14, "k"))}, {"wid": _S.binary("*", 2.2, _S.read(_v14, "k"))}, {"core": 0.4}])])
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 6)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "a", _S.binary("*", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.read(_v16, "i"), 3)) else 1), _S.binary("+", _S.binary("+", 0.4, _S.binary("*", _S.binary("%", _S.read(_v16, "i"), 3), 0.45)), _S.binary("*", _S.prop(_S.read(_v16, "jit"), _S.binary("+", _S.read(_v16, "i"), 1)), 0.2))))
			_S.define(_v16, "down", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.binary("+", _S.read(_v16, "ANG"), _S.read(_v16, "a"))]))
			_S.define(_v16, "len", _S.binary("*", _S.binary("*", _S.binary("+", 8, _S.binary("*", _S.prop(_S.read(_v16, "jit"), _S.binary("+", _S.read(_v16, "i"), 7)), 7)), _S.read(_v16, "k")), (0.7 if _S.truth(_S.binary("===", _S.read(_v16, "f"), 3)) else 1)))
			if _S.truth(_S.binary(">", _S.read(_v16, "down"), 0.1)):
				_S.write(_v16, "len", _S.invoke(_S.read(_v16, "Math"), "min", [_S.read(_v16, "len"), _S.binary("/", _S.binary("-", _S.read(_v16, "H"), 3), _S.read(_v16, "down"))]), "=", false)
			_S.invoke(_S.read(_v16, "L"), "push", [_S.merge([{"off": 2}, {"a": _S.read(_v16, "a")}, {"len": _S.read(_v16, "len")}, {"wid": _S.binary("*", 1.6, _S.read(_v16, "k"))}, {"core": 0.25}])])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
		_S.call_value(_S.read(_v14, "flash"), [_S.read(_v14, "p"), 4, _S.read(_v14, "MY"), _S.read(_v14, "ANG"), _S.read(_v14, "L"), ([_S.read(_v14, "WHITE"), _S.prop(_S.read(_v14, "F"), 7), _S.prop(_S.read(_v14, "F"), 6), _S.prop(_S.read(_v14, "F"), 3)] if _S.truth(_S.binary("===", _S.read(_v14, "f"), 1)) else ([_S.prop(_S.read(_v14, "F"), 7), _S.prop(_S.read(_v14, "F"), 6), _S.prop(_S.read(_v14, "F"), 4), _S.prop(_S.read(_v14, "F"), 2)] if _S.truth(_S.binary("===", _S.read(_v14, "f"), 2)) else [_S.prop(_S.read(_v14, "F"), 5), _S.prop(_S.read(_v14, "F"), 4), _S.prop(_S.read(_v14, "F"), 3), _S.prop(_S.read(_v14, "F"), 1)])), _S.read(_v14, "f")])
		if _S.truth(_S.binary("===", _S.read(_v14, "f"), 1)):
			_S.last([_S.invoke(_S.read(_v14, "p"), "circle", [7, _S.binary("-", _S.read(_v14, "MY"), 1), 6.5, _S.read(_v14, "WHITE")]), _S.invoke(_S.read(_v14, "p"), "ring", [7, _S.binary("-", _S.read(_v14, "MY"), 1), 7.5, 1, _S.prop(_S.read(_v14, "F"), 7)])])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "p"), "glow", [14, 0, 22, _S.prop(_S.read(_e, "F"), 4), _S.binary("*", 0.25, _S.read(_e, "pop"))])
	return null
