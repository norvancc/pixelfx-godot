@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/flare.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "rays", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "cloud", _S.import_value("fx/projectiles/_lib.js", "cloud"))
	_S.define(_e, "Smoke", _S.import_value("fx/projectiles/_lib.js", "Smoke"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Signal flare"}, {"desc": "A signal flare streaks up off the ground trailing sparks and smoke, bursts, and hangs as a pulsing red star that drips sparks under its own red-lit smoke, then gutters out."}, {"tags": ["projectile", "flare", "signal", "fire", "smoke", "light", "one-shot"]}, {"size": [152, 232]}, {"origin": [76, 226]}, {"duration": 5}, {"loop": false}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#2a0610", "#5c0d1c", "#9a1428", "#d8243a", "#ff4d5e", "#ff8a94", "#ffd0d4", "#ffffff"]}, {"smoke": ["#1e1a26", "#2e2938", "#433d4d", "#5b5466", "#77707f", "#958e9c", "#b3acb9"]}, {"height": 150}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RISE", 0.85)
	_S.define(_e, "BURN", 3.1)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "SM", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "smoke"), 7]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2)]}])]))
	_S.define(_e, "smoke", _S.construct(_S.read(_e, "Smoke"), [_S.read(_e, "R")]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "WR", [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 1), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "SM"), 2), 0.45]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "SM"), 3), 0.35]), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)])
	_S.define(_e, "rise", _S.function_value(_e, "_f2"))
	_S.define(_e, "star", _S.function_value(_e, "_f3"))
	_S.define(_e, "t", 0)
	_S.define(_e, "burst", false)
	_S.define(_e, "emit", 0)
	_S.define(_e, "drip", 0)
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 3), 26, _S.prop(_S.read(_e, "C"), 4), 0.8, 0.25])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 5)):
		_S.invoke(_S.read(_v0, "smoke"), "add", [_S.merge([{"x": _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 3), 3])}, {"y": _S.unary("-", 2)}, {"vx": _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 25), 25])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v0, "R"), "range", [5, 20]))}, {"r0": 2}, {"r1": _S.invoke(_S.read(_v0, "R"), "range", [4, 6])}, {"life": _S.invoke(_S.read(_v0, "R"), "range", [1, 1.6])}, {"a": 0.5}, {"warm": 0.8}, {"rise": 6}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 3)]), 2), _S.binary("/", _S.read(_e, "t"), _S.read(_e, "RISE"))), _S.binary("*", _S.unary("-", _S.read(_e, "H")), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "RISE"))])]))]

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "RISE")))
	return [_S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "u"), 1.6)]), 3), _S.prop(_S.call_value(_S.read(_e, "rise"), [_S.read(_e, "RISE")]), 0)), _S.binary("+", _S.binary("+", _S.unary("-", _S.read(_e, "H")), _S.binary("*", _S.read(_e, "u"), 9)), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "u"), 2.3)]), 1.5))]

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "RISE"))):
		var _v1 = _S.scope(_e)
		var _v2 = _S.call_value(_S.read(_v1, "rise"), [_S.read(_v1, "t")])
		_S.define(_v1, "x", _S.prop(_v2, 0))
		_S.define(_v1, "y", _S.prop(_v2, 1))
		var _v3 = _S.call_value(_S.read(_v1, "rise"), [_S.invoke(_S.read(_v1, "Math"), "max", [0, _S.binary("-", _S.read(_v1, "t"), _S.read(_v1, "dt"))])])
		_S.define(_v1, "px", _S.prop(_v3, 0))
		_S.define(_v1, "py", _S.prop(_v3, 1))
		var _v4 = _S.scope(_v1)
		_S.write(_v4, "emit", _S.binary("/", _S.invoke(_S.read(_v4, "Math"), "hypot", [_S.binary("-", _S.read(_v4, "x"), _S.read(_v4, "px")), _S.binary("-", _S.read(_v4, "y"), _S.read(_v4, "py"))]), 1.5), "+=", false)
		while _S.truth(_S.binary(">", _S.read(_v4, "emit"), 1)):
			_S.invoke(_S.read(_v4, "smoke"), "add", [_S.merge([{"x": _S.binary("+", _S.read(_v4, "x"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 0.6), 0.6]))}, {"y": _S.binary("+", _S.read(_v4, "y"), 4)}, {"vx": _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 6), 6])}, {"vy": _S.invoke(_S.read(_v4, "R"), "range", [0, 8])}, {"r0": 1.3}, {"r1": _S.invoke(_S.read(_v4, "R"), "range", [3, 4.8])}, {"life": _S.invoke(_S.read(_v4, "R"), "range", [1.4, 2.1])}, {"a": 0.5}, {"b": 0.95}, {"warm": 0.9}, {"rise": 3}, {"drag": 2}, {"grow": 1.4}])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "emit", 1, "-=", true)
		if _S.truth(_S.invoke(_S.read(_v1, "R"), "chance", [0.5])):
			_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "SPARK"), _S.read(_v1, "x"), _S.binary("+", _S.read(_v1, "y"), 3), _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 40), 40]), _S.invoke(_S.read(_v1, "R"), "range", [20, 90]), _S.invoke(_S.read(_v1, "R"), "range", [0.2, 0.45])])
	else:
		if _S.truth(_S.unary("!", _S.read(_e, "burst"))):
			var _v5 = _S.scope(_e)
			_S.write(_v5, "burst", true, "=", false)
			var _v6 = _S.call_value(_S.read(_v5, "star"), [_S.read(_v5, "t")])
			_S.define(_v5, "x", _S.prop(_v6, 0))
			_S.define(_v5, "y", _S.prop(_v6, 1))
			_S.invoke(_S.read(_v5, "lights"), "add", [_S.read(_v5, "x"), _S.read(_v5, "y"), 64, _S.prop(_S.read(_v5, "C"), 4), 0.9, 0.5])
			_S.invoke(_S.read(_v5, "lights"), "add", [_S.read(_v5, "x"), _S.read(_v5, "y"), 24, _S.read(_v5, "WHITE"), 0.8, 0.12])
			var _v7 = _S.scope(_v5)
			_S.define(_v7, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v7, "i"), 30)):
				var _v8 = _S.scope(_v7)
				_S.define(_v8, "a", _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")]))
				_S.define(_v8, "sp", _S.invoke(_S.read(_v8, "R"), "range", [70, 190]))
				_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "SPARK"), _S.read(_v8, "x"), _S.read(_v8, "y"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), 30), _S.invoke(_S.read(_v8, "R"), "range", [0.25, 0.7])])
				_v7 = _S.iteration(_v7)
				_S.write(_v7, "i", 1, "+=", true)
			var _v9 = _S.scope(_v5)
			_S.define(_v9, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v9, "i"), 10)):
				_S.invoke(_S.read(_v9, "smoke"), "add", [_S.merge([{"x": _S.binary("+", _S.read(_v9, "x"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": _S.binary("+", _S.read(_v9, "y"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 3), 3]))}, {"vx": _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 40), 40])}, {"vy": _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 40), 10])}, {"r0": 2.5}, {"r1": _S.invoke(_S.read(_v9, "R"), "range", [6, 9])}, {"life": _S.invoke(_S.read(_v9, "R"), "range", [1.6, 2.4])}, {"a": 0.55}, {"warm": 1}, {"rise": 10}, {"drag": 2.5}])])
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "i", 1, "+=", true)
		else:
			if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "RISE"), _S.read(_e, "BURN")))):
				var _v10 = _S.scope(_e)
				var _v11 = _S.call_value(_S.read(_v10, "star"), [_S.read(_v10, "t")])
				_S.define(_v10, "x", _S.prop(_v11, 0))
				_S.define(_v10, "y", _S.prop(_v11, 1))
				_S.define(_v10, "k", _S.binary("/", _S.binary("-", _S.read(_v10, "t"), _S.read(_v10, "RISE")), _S.read(_v10, "BURN")))
				_S.define(_v10, "power", _S.binary("-", 1, _S.call_value(_S.read(_v10, "smooth"), [0.75, 1, _S.read(_v10, "k")])))
				var _v12 = _S.scope(_v10)
				_S.write(_v12, "drip", _S.binary("*", _S.binary("*", _S.read(_v12, "dt"), 26), _S.read(_v12, "power")), "+=", false)
				while _S.truth(_S.binary(">", _S.read(_v12, "drip"), 1)):
					_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "SPARK"), _S.binary("+", _S.read(_v12, "x"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.binary("+", _S.read(_v12, "y"), 2), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 30), 30]), _S.invoke(_S.read(_v12, "R"), "range", [10, 60]), _S.invoke(_S.read(_v12, "R"), "range", [0.35, 0.8])])
					_v12 = _S.iteration(_v12)
					_S.write(_v12, "drip", 1, "-=", true)
				if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [_S.binary("*", _S.binary("*", _S.read(_v10, "dt"), 18), _S.read(_v10, "power"))])):
					_S.invoke(_S.read(_v10, "smoke"), "add", [_S.merge([{"x": _S.binary("+", _S.read(_v10, "x"), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 1.5), 1.5]))}, {"y": _S.binary("-", _S.read(_v10, "y"), 2)}, {"vx": _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 8), 8])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [15, 30]))}, {"r0": 2}, {"r1": _S.invoke(_S.read(_v10, "R"), "range", [6, 10])}, {"life": _S.binary("*", _S.invoke(_S.read(_v10, "R"), "range", [1.6, 2.4]), _S.binary("-", 1, _S.binary("*", 0.4, _S.read(_v10, "k"))))}, {"a": 0.5}, {"b": 0.85}, {"warm": 1}, {"rise": 14}, {"drag": 1.6}, {"grow": 1.2}])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "smoke"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "list", _S.invoke(_S.read(_e, "smoke"), "puffs", []))
	_S.define(_e, "lit", (_S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.75, 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "RISE")), _S.read(_e, "BURN"))])) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "RISE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "RISE"), _S.read(_e, "BURN"))))) else 0))
	if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0)):
		var _v13 = _S.scope(_e)
		var _v14 = _S.call_value(_S.read(_v13, "star"), [_S.read(_v13, "t")])
		_S.define(_v13, "sx", _S.prop(_v14, 0))
		_S.define(_v13, "sy", _S.prop(_v14, 1))
		for _v15 in _S.array(_S.read(_v13, "list")):
			var _v16 = _S.scope(_v13)
			_S.define(_v16, "q", _v15)
			_S.set_prop(_S.read(_v16, "q"), "w", _S.invoke(_S.read(_v16, "Math"), "max", [_S.prop(_S.read(_v16, "q"), "w"), _S.binary("*", _S.read(_v16, "lit"), _S.invoke(_S.read(_v16, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.invoke(_S.read(_v16, "Math"), "hypot", [_S.binary("-", _S.prop(_S.read(_v16, "q"), "x"), _S.read(_v16, "sx")), _S.binary("-", _S.prop(_S.read(_v16, "q"), "y"), _S.read(_v16, "sy"))])), 26)]))]), "=", false)
	_S.call_value(_S.read(_e, "cloud"), [_S.read(_e, "p"), _S.read(_e, "list"), _S.read(_e, "SM"), _S.read(_e, "WR"), _S.merge([{"dens": 1.4}, {"max": 0.8}, {"lit": 1.3}])])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "RISE"))):
		var _v17 = _S.scope(_e)
		var _v18 = _S.call_value(_S.read(_v17, "rise"), [_S.read(_v17, "t")])
		_S.define(_v17, "x", _S.prop(_v18, 0))
		_S.define(_v17, "y", _S.prop(_v18, 1))
		_S.invoke(_S.read(_v17, "p"), "line", [_S.read(_v17, "x"), _S.binary("+", _S.read(_v17, "y"), 1), _S.read(_v17, "x"), _S.binary("+", _S.read(_v17, "y"), 5), _S.function_value(_v17, "_f6")])
		_S.last([_S.invoke(_S.read(_v17, "p"), "px", [_S.read(_v17, "x"), _S.read(_v17, "y"), _S.read(_v17, "WHITE")]), _S.invoke(_S.read(_v17, "p"), "px", [_S.read(_v17, "x"), _S.binary("-", _S.read(_v17, "y"), 1), _S.prop(_S.read(_v17, "C"), 6)])])
		_S.invoke(_S.read(_v17, "p"), "glow", [_S.read(_v17, "x"), _S.read(_v17, "y"), 14, _S.prop(_S.read(_v17, "C"), 4), 0.6])
		_S.invoke(_S.read(_v17, "p"), "glow", [_S.read(_v17, "x"), _S.read(_v17, "y"), 4, _S.read(_v17, "WHITE"), 0.4])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "RISE"), _S.read(_e, "BURN")))):
			var _v19 = _S.scope(_e)
			var _v20 = _S.call_value(_S.read(_v19, "star"), [_S.read(_v19, "t")])
			_S.define(_v19, "x", _S.prop(_v20, 0))
			_S.define(_v19, "y", _S.prop(_v20, 1))
			_S.define(_v19, "u", _S.binary("-", _S.read(_v19, "t"), _S.read(_v19, "RISE")))
			_S.define(_v19, "k", _S.binary("/", _S.read(_v19, "u"), _S.read(_v19, "BURN")))
			_S.define(_v19, "fr", _S.invoke(_S.read(_v19, "Math"), "floor", [_S.binary("*", _S.read(_v19, "t"), 30)]))
			_S.define(_v19, "fl", _S.binary("+", _S.binary("+", 0.8, _S.binary("*", 0.2, _S.call_value(_S.read(_v19, "rand"), [_S.read(_v19, "fr"), 3]))), _S.binary("*", 0.08, _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("*", _S.read(_v19, "u"), 19)]))))
			_S.define(_v19, "die", _S.binary("-", 1, _S.call_value(_S.read(_v19, "smooth"), [0.78, 1, _S.read(_v19, "k")])))
			if _S.truth(_S.binary("<", _S.read(_v19, "u"), 0.25)):
				var _v21 = _S.scope(_v19)
				_S.define(_v21, "e", _S.binary("/", _S.read(_v21, "u"), 0.25))
				_S.call_value(_S.read(_v21, "rays"), [_S.read(_v21, "p"), _S.read(_v21, "x"), _S.read(_v21, "y"), _S.binary("+", _S.binary("*", 22, _S.binary("-", 1, _S.read(_v21, "e"))), 3), _S.binary("-", 1, _S.read(_v21, "e")), _S.read(_v21, "C")])
				if _S.truth(_S.binary("<", _S.read(_v21, "e"), 0.25)):
					_S.invoke(_S.read(_v21, "p"), "circle", [_S.read(_v21, "x"), _S.read(_v21, "y"), _S.binary("+", _S.binary("*", 5, _S.binary("-", 1, _S.binary("*", _S.read(_v21, "e"), 3))), 1), _S.read(_v21, "WHITE")])
			_S.define(_v19, "r", _S.binary("*", _S.binary("+", 2, _S.binary("*", 0.6, _S.read(_v19, "fl"))), _S.binary("+", 0.4, _S.binary("*", 0.6, _S.read(_v19, "die")))))
			_S.invoke(_S.read(_v19, "p"), "circle", [_S.read(_v19, "x"), _S.read(_v19, "y"), _S.binary("+", _S.read(_v19, "r"), 1.2), _S.prop(_S.read(_v19, "C"), 3)])
			_S.invoke(_S.read(_v19, "p"), "circle", [_S.read(_v19, "x"), _S.read(_v19, "y"), _S.read(_v19, "r"), (_S.prop(_S.read(_v19, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v19, "die"), 0.4)) else _S.prop(_S.read(_v19, "C"), 4))])
			if _S.truth(_S.binary(">", _S.read(_v19, "die"), 0.25)):
				_S.invoke(_S.read(_v19, "p"), "circle", [_S.binary("-", _S.read(_v19, "x"), 0.3), _S.binary("-", _S.read(_v19, "y"), 0.3), _S.binary("*", _S.read(_v19, "r"), 0.55), (_S.read(_v19, "WHITE") if _S.truth(_S.binary(">", _S.read(_v19, "die"), 0.6)) else _S.prop(_S.read(_v19, "C"), 6))])
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v19, "die"), 0.15), func(): return _S.binary(">", _S.call_value(_S.read(_v19, "rand"), [_S.read(_v19, "fr"), 9]), 0.15))):
				_S.call_value(_S.read(_v19, "sparkle"), [_S.read(_v19, "p"), _S.read(_v19, "x"), _S.read(_v19, "y"), _S.invoke(_S.read(_v19, "Math"), "round", [_S.binary("*", _S.binary("+", 5, _S.binary("*", 3, _S.read(_v19, "fl"))), _S.read(_v19, "die"))]), _S.prop(_S.read(_v19, "C"), 6), _S.prop(_S.read(_v19, "C"), 4), _S.binary("*", 0.5, _S.read(_v19, "die"))])
			_S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "x"), _S.read(_v19, "y"), _S.binary("*", 70, _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_v19, "die")))), _S.prop(_S.read(_v19, "C"), 3), _S.binary("*", _S.binary("*", 0.55, _S.read(_v19, "fl")), _S.read(_v19, "die"))])
			_S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "x"), _S.read(_v19, "y"), 22, _S.prop(_S.read(_v19, "C"), 4), _S.binary("*", _S.binary("*", 0.5, _S.read(_v19, "fl")), _S.read(_v19, "die"))])
			_S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "x"), _S.read(_v19, "y"), 6, _S.read(_v19, "WHITE"), _S.binary("*", 0.35, _S.read(_v19, "die"))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.7)) else _S.prop(_S.read(_e, "C"), 3)))
