@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/big-explosion.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "Blazes", _S.import_value("core/index.js", "Blazes"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "stone", _S.import_value("fx/explosions/_lib.js", "stone"))
	_S.define(_e, "fireRamp", _S.import_value("fx/explosions/_lib.js", "fireRamp"))
	_S.define(_e, "heatRamp", _S.import_value("fx/explosions/_lib.js", "heatRamp"))
	_S.define(_e, "drawPs", _S.import_value("fx/explosions/_lib.js", "drawPs"))
	_S.define(_e, "draft", _S.import_value("fx/explosions/_lib.js", "draft"))
	_S.define(_e, "cull", _S.import_value("fx/explosions/_lib.js", "cull"))
	_S.define(_e, "scorch", _S.import_value("fx/explosions/_lib.js", "scorch"))
	_S.define(_e, "rock", _S.import_value("fx/explosions/_lib.js", "rock"))
	_S.define(_e, "dome", _S.import_value("fx/explosions/_lib.js", "dome"))
	_S.define(_e, "glowDome", _S.import_value("fx/explosions/_lib.js", "glowDome"))
	_S.define(_e, "pool", _S.import_value("fx/explosions/_lib.js", "pool"))
	_S.define(_e, "trail", _S.import_value("fx/explosions/_lib.js", "trail"))
	_S.define(_e, "Plume", _S.import_value("fx/explosions/_lib.js", "Plume"))
	_S.define(_e, "Column", _S.import_value("fx/explosions/_lib.js", "Column"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Big explosion"}, {"desc": "A huge ground blast in three beats: a white dome, a rolling fireball that climbs into a mushrooming smoke column, heavy rocks, and fires left burning."}, {"tags": ["explosion", "fire", "smoke", "debris", "mushroom", "big", "ground", "one-shot"]}, {"size": [360, 300]}, {"origin": [180, 262]}, {"duration": 7.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"stone": "#4a3f69"}, {"seed": 11}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RAD", 30)
	_S.define(_e, "POWER", 1.45)
	_S.define(_e, "EARTH", 1.6)
	_S.define(_e, "SM", _S.invoke(["#83777f", "#6e6470", "#575060", "#3f3947", "#29242f"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "BLASTS", [_S.merge([{"t": 0}, {"x": 0}, {"y": _S.unary("-", 9)}, {"rad": _S.read(_e, "RAD")}, {"power": _S.read(_e, "POWER")}, {"main": true}]), _S.merge([{"t": 0.13}, {"x": _S.unary("-", 17)}, {"y": _S.unary("-", 30)}, {"rad": 17}, {"power": 0.9}]), _S.merge([{"t": 0.25}, {"x": 15}, {"y": _S.unary("-", 46)}, {"rad": 15}, {"power": 0.8}])])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "FR", _S.call_value(_S.read(_e, "fireRamp"), [_S.read(_e, "F")]))
	_S.define(_e, "HR", _S.call_value(_S.read(_e, "heatRamp"), [_S.read(_e, "FR")]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "WARM", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 6), 0.45]))
	var _v0 = _S.prop(_S.read(_e, "meta"), "size")
	_S.define(_e, "W", _S.prop(_v0, 0))
	_S.define(_e, "H", _S.prop(_v0, 1))
	var _v1 = _S.prop(_S.read(_e, "meta"), "origin")
	_S.define(_e, "OX", _S.prop(_v1, 0))
	_S.define(_e, "OY", _S.prop(_v1, 1))
	_S.define(_e, "X0", _S.binary("+", _S.unary("-", _S.read(_e, "OX")), 3))
	_S.define(_e, "X1", _S.binary("-", _S.binary("-", _S.read(_e, "W"), _S.read(_e, "OX")), 3))
	_S.define(_e, "Y0", _S.binary("+", _S.unary("-", _S.read(_e, "OY")), 3))
	_S.define(_e, "Y1", _S.binary("-", _S.binary("-", _S.read(_e, "H"), _S.read(_e, "OY")), 3))
	_S.define(_e, "blazes", null)
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 2)]}, {"onLand": _S.function_value(_e, "_f2")}])]))
	_S.write(_e, "blazes", _S.construct(_S.read(_e, "Blazes"), [_S.read(_e, "ps")]), "=", false)
	_S.define(_e, "rocks", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "flashes", [])
	_S.define(_e, "rings", [])
	_S.define(_e, "plume", _S.construct(_S.read(_e, "Plume"), [_S.read(_e, "R"), _S.merge([{"x": 0}, {"y": _S.unary("-", 34)}, {"rise": 118}, {"tau": 1.25}, {"drift": 4}, {"tube": [9, 21]}, {"ring": [2, 19]}, {"grow": 1}, {"n": 42}, {"size": [6, 11]}, {"swell": 0.9}, {"spin": 2.6}, {"spinTau": 1.7}, {"heat": 1.2}, {"cool": 0.42}, {"under": 0.5}, {"tilt": 0.22}, {"squash": 0.72}, {"fade": [4.4, 6.4]}, {"spread": 22}])]))
	_S.define(_e, "column", _S.construct(_S.read(_e, "Column"), [_S.read(_e, "R"), _S.merge([{"w": 5}, {"foot": 18}, {"speed": 85}, {"size": [7, 11]}, {"n": 28}, {"sway": 2.5}])]))
	_S.define(_e, "top", _S.function_value(_e, "_f3"))
	_S.define(_e, "t", 0)
	_S.define(_e, "next", 0)
	_S.define(_e, "blast", _S.function_value(_e, "_f4"))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "blazes"), "add", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 0.25), _S.invoke(_S.read(_e, "R"), "range", [3, 4.4]), _S.invoke(_S.read(_e, "R"), "range", [0.7, 1.25])])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "S", _S.invoke(_S.read(_e, "plume"), "shape", []))
	return _S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.binary("*", _S.prop(_S.read(_e, "S"), "tube"), 0.45))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v2 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v2, "x"))
	_S.define(_e, "y", _S.prop(_v2, "y"))
	_S.define(_e, "rad", _S.prop(_v2, "rad"))
	_S.define(_e, "power", _S.prop(_v2, "power"))
	_S.define(_e, "main", _S.prop(_v2, "main"))
	if _S.truth(_S.unary("!", _S.read(_e, "main"))):
		_S.invoke(_S.read(_e, "flashes"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"r": _S.binary("*", _S.read(_e, "rad"), 1.05)}, {"life": 0.06}, {"max": 0.06}])])
	if _S.truth(_S.unary("!", _S.read(_e, "main"))):
		_S.invoke(_S.read(_e, "rings"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"r0": _S.binary("*", _S.read(_e, "rad"), 0.45)}, {"r1": _S.binary("*", _S.read(_e, "rad"), 2.7)}, {"life": 0.36}, {"max": 0.36}, {"thick": 3}, {"c": _S.prop(_S.read(_e, "F"), 5)}]), _S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"r0": _S.binary("*", _S.read(_e, "rad"), 0.3)}, {"r1": _S.binary("*", _S.read(_e, "rad"), 1.6)}, {"life": 0.24}, {"max": 0.24}, {"thick": 1.8}, {"c": _S.prop(_S.read(_e, "F"), 3)}])])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "x"), (_S.binary("-", _S.read(_e, "y"), 24) if _S.truth(_S.read(_e, "main")) else _S.read(_e, "y")), (72 if _S.truth(_S.read(_e, "main")) else _S.binary("*", _S.read(_e, "rad"), 3.4)), _S.read(_e, "WARM"), _S.binary("*", 0.6, _S.read(_e, "power")), 0.8])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "x"), (_S.binary("-", _S.read(_e, "y"), 12) if _S.truth(_S.read(_e, "main")) else _S.read(_e, "y")), (44 if _S.truth(_S.read(_e, "main")) else _S.binary("*", _S.read(_e, "rad"), 1.6)), _S.read(_e, "WHITE"), 0.6, 0.1])
	_S.define(_e, "down", (0.25 if _S.truth(_S.read(_e, "main")) else _S.prop(_S.read(_e, "Math"), "PI")))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 5)):
		_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "FIRE"), _S.binary("+", _S.read(_v3, "x"), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 2.5), 2.5])), _S.binary("+", _S.read(_v3, "y"), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 2.5), 2.5])), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 20), 20]), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 40), _S.unary("-", 10)]), _S.invoke(_S.read(_v3, "R"), "range", [0.18, 0.3]), 0, _S.invoke(_S.read(_v3, "R"), "range", [_S.binary("*", _S.read(_v3, "rad"), 0.4), _S.binary("*", _S.read(_v3, "rad"), 0.55)])])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), _S.invoke(_S.read(_v4, "Math"), "round", [_S.binary("*", 26, _S.read(_v4, "power"))]))):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "a", (_S.invoke(_S.read(_v5, "R"), "range", [_S.binary("-", _S.unary("-", _S.prop(_S.read(_v5, "Math"), "PI")), _S.read(_v5, "down")), _S.read(_v5, "down")]) if _S.truth(_S.read(_v5, "main")) else _S.invoke(_S.read(_v5, "R"), "range", [0, _S.read(_v5, "TAU")])))
		_S.define(_v5, "d", _S.invoke(_S.read(_v5, "R"), "range", [0, _S.binary("*", _S.read(_v5, "rad"), 0.55)]))
		_S.define(_v5, "sp", _S.binary("*", _S.invoke(_S.read(_v5, "R"), "range", [40, 200]), _S.read(_v5, "power")))
		_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "FIRE"), _S.binary("+", _S.read(_v5, "x"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "d"))), _S.binary("+", _S.read(_v5, "y"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "d"))), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), 0.8), 40), _S.invoke(_S.read(_v5, "R"), "range", [0.55, 1.15]), 0, _S.invoke(_S.read(_v5, "R"), "range", [_S.binary("*", _S.read(_v5, "rad"), 0.22), _S.binary("*", _S.read(_v5, "rad"), 0.46)]), 0, (_S.binary("|", _S.prop(_S.read(_v5, "PF"), "SMOKES"), _S.prop(_S.read(_v5, "PF"), "BIG")) if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [0.45])) else 0)])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 5)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v7, "Math"), "PI")), 0]))
		_S.define(_v7, "d", _S.invoke(_S.read(_v7, "R"), "range", [_S.binary("*", _S.read(_v7, "rad"), 0.1), _S.binary("*", _S.read(_v7, "rad"), 0.5)]))
		_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SMOKE"), _S.binary("+", _S.read(_v7, "x"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "d"))), _S.binary("+", _S.read(_v7, "y"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "d"))), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), 30), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), 20), 30), _S.invoke(_S.read(_v7, "R"), "range", [0.9, 1.5]), _S.call_value(_S.read(_v7, "hex"), ["#221d26"]), _S.invoke(_S.read(_v7, "R"), "range", [_S.binary("*", _S.read(_v7, "rad"), 0.15), _S.binary("*", _S.read(_v7, "rad"), 0.26)]), _S.invoke(_S.read(_v7, "R"), "range", [0.06, 0.2]), _S.prop(_S.read(_v7, "PF"), "BIG")])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), _S.invoke(_S.read(_v8, "Math"), "round", [_S.binary("*", 8, _S.read(_v8, "power"))]))):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "a", _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v9, "Math"), "PI")), 0]))
		_S.define(_v9, "d", _S.invoke(_S.read(_v9, "R"), "range", [0, _S.binary("*", _S.read(_v9, "rad"), 0.7)]))
		_S.define(_v9, "sp", _S.invoke(_S.read(_v9, "R"), "range", [15, 90]))
		_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "SMOKE"), _S.binary("+", _S.read(_v9, "x"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "d"))), _S.binary("+", _S.read(_v9, "y"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "d"))), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "sp")), 0.6), 35), _S.invoke(_S.read(_v9, "R"), "range", [1.8, 2.8]), 0, _S.invoke(_S.read(_v9, "R"), "range", [_S.binary("*", _S.read(_v9, "rad"), 0.26), _S.binary("*", _S.read(_v9, "rad"), 0.4)]), _S.invoke(_S.read(_v9, "R"), "range", [0.12, 0.45]), _S.prop(_S.read(_v9, "PF"), "BIG")])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), _S.invoke(_S.read(_v10, "Math"), "round", [_S.binary("*", 80, _S.read(_v10, "power"))]))):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "a", _S.invoke(_S.read(_v11, "R"), "range", [0, _S.read(_v11, "TAU")]))
		_S.define(_v11, "sp", _S.invoke(_S.read(_v11, "R"), "range", [170, (470 if _S.truth(_S.read(_v11, "main")) else 380)]))
		_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "SPARK"), _S.read(_v11, "x"), _S.read(_v11, "y"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), 70), _S.invoke(_S.read(_v11, "R"), "range", [0.2, 0.65])])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), _S.invoke(_S.read(_v12, "Math"), "round", [_S.binary("*", 30, _S.read(_v12, "power"))]))):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")]))
		_S.define(_v13, "sp", _S.invoke(_S.read(_v13, "R"), "range", [30, 150]))
		_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "EMBER"), _S.binary("+", _S.read(_v13, "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "rad")), 0.4)), _S.binary("+", _S.read(_v13, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "rad")), 0.4)), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), 75), _S.invoke(_S.read(_v13, "R"), "range", [1.4, 3]), _S.prop(_S.read(_v13, "F"), 3)])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	if _S.truth(_S.unary("!", _S.read(_e, "main"))):
		return null
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), 14)):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v15, "Math"), "PI")), 2), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 1.3), 1.3])))
		_S.define(_v15, "sp", _S.invoke(_S.read(_v15, "R"), "range", [160, 340]))
		_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "BRAND"), _S.read(_v15, "x"), _S.read(_v15, "y"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "sp")), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "sp")), _S.invoke(_S.read(_v15, "R"), "range", [0.8, 1.5])])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), 18)):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "s", _S.invoke(_S.read(_v17, "R"), "sign", []))
		_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "SMOKE"), _S.binary("*", _S.read(_v17, "s"), _S.invoke(_S.read(_v17, "R"), "range", [0, _S.binary("*", _S.read(_v17, "RAD"), 0.6)])), _S.unary("-", _S.invoke(_S.read(_v17, "R"), "range", [1, 6])), _S.binary("*", _S.binary("*", _S.read(_v17, "s"), _S.invoke(_S.read(_v17, "R"), "range", [3, 9])), _S.read(_v17, "RAD")), _S.unary("-", _S.invoke(_S.read(_v17, "R"), "range", [2, 15])), _S.invoke(_S.read(_v17, "R"), "range", [1.3, 2.2]), _S.prop(_S.read(_v17, "st"), "dust"), _S.invoke(_S.read(_v17, "R"), "range", [8, 12]), _S.invoke(_S.read(_v17, "R"), "range", [0, 0.06]), _S.prop(_S.read(_v17, "PF"), "BIG")])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	var _v18 = _S.scope(_e)
	_S.define(_v18, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "i"), _S.invoke(_S.read(_v18, "Math"), "round", [_S.binary("*", _S.read(_v18, "EARTH"), 12)]))):
		_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "SMOKE"), _S.binary("*", _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 0.3), 0.3]), _S.read(_v18, "RAD")), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [2, _S.binary("*", _S.read(_v18, "RAD"), 0.6)])), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 15), 15]), _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [60, 190])), _S.read(_v18, "EARTH")), 0.6), _S.invoke(_S.read(_v18, "R"), "range", [1.6, 2.6]), _S.prop(_S.read(_v18, "st"), "dust"), _S.invoke(_S.read(_v18, "R"), "range", [8, 12]), _S.invoke(_S.read(_v18, "R"), "range", [0, 0.15]), _S.prop(_S.read(_v18, "PF"), "BIG")])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "i", 1, "+=", true)
	var _v19 = _S.scope(_e)
	_S.define(_v19, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v19, "i"), _S.invoke(_S.read(_v19, "Math"), "round", [_S.binary("*", _S.binary("*", _S.read(_v19, "EARTH"), _S.read(_v19, "RAD")), 4)]))):
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "u", _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 1), 1]))
		_S.define(_v20, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v20, "Math"), "PI")), 2), _S.binary("*", _S.read(_v20, "u"), 0.55)))
		_S.define(_v20, "sp", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v20, "R"), "range", [5, 15]), _S.read(_v20, "RAD")), _S.binary("-", 1, _S.binary("*", 0.45, _S.invoke(_S.read(_v20, "Math"), "abs", [_S.read(_v20, "u")])))))
		_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "GRIT"), _S.binary("*", _S.binary("*", _S.read(_v20, "u"), 0.25), _S.read(_v20, "RAD")), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.invoke(_S.read(_v20, "R"), "range", [1.4, 2.4]), _S.invoke(_S.read(_v20, "R"), "pick", [[_S.prop(_S.read(_v20, "st"), "light"), _S.prop(_S.read(_v20, "st"), "body"), _S.prop(_S.read(_v20, "st"), "body"), _S.prop(_S.read(_v20, "st"), "shade")]]), (2 if _S.truth(_S.invoke(_S.read(_v20, "R"), "chance", [0.45])) else 1)])
		_v19 = _S.iteration(_v19)
		_S.write(_v19, "i", 1, "+=", true)
	var _v21 = _S.scope(_e)
	_S.define(_v21, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v21, "i"), 26)):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "big", _S.binary("<", _S.read(_v22, "i"), 10))
		_S.define(_v22, "hot", _S.invoke(_S.read(_v22, "R"), "chance", [0.45]))
		_S.define(_v22, "sx", _S.invoke(_S.read(_v22, "R"), "sign", []))
		_S.invoke(_S.read(_v22, "rocks"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v22, "B"), "CHUNK")}, {"x": _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 0.4), 0.4]), _S.read(_v22, "RAD"))}, {"y": _S.unary("-", 4)}, {"vx": _S.binary("*", _S.read(_v22, "sx"), _S.invoke(_S.read(_v22, "R"), "range", [30, (120 if _S.truth(_S.read(_v22, "big")) else 150)]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [(280 if _S.truth(_S.read(_v22, "big")) else 320), (480 if _S.truth(_S.read(_v22, "big")) else 560)]))}, {"g": 1}, {"drag": 0.3}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v22, "R"), "range", [3.6, 5])}, {"a": _S.invoke(_S.read(_v22, "R"), "range", [0, _S.read(_v22, "TAU")])}, {"va": _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 14), 14])}, {"s": (_S.invoke(_S.read(_v22, "R"), "range", [2.6, 3.8]) if _S.truth(_S.read(_v22, "big")) else _S.invoke(_S.read(_v22, "R"), "range", [1.2, 2.4]))}, {"heat": (_S.invoke(_S.read(_v22, "R"), "range", [0.6, 1]) if _S.truth(_S.read(_v22, "hot")) else 0)}])])
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "i", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "next"), _S.prop(_S.read(_e, "BLASTS"), "length")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.prop(_S.read(_e, "BLASTS"), _S.read(_e, "next")), "t")))):
		_S.call_value(_S.read(_e, "blast"), [_S.prop(_S.read(_e, "BLASTS"), _S.write(_e, "next", 1, "+=", true))])
	if _S.truth(_S.binary(">", _S.read(_e, "t"), 0.08)):
		_S.invoke(_S.read(_e, "plume"), "update", [_S.read(_e, "dt")])
	_S.define(_e, "S", _S.invoke(_S.read(_e, "plume"), "shape", []))
	_S.define(_e, "k", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [2.2, 3.1, _S.read(_e, "t")])))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.2), func(): return _S.binary("<", _S.read(_e, "t"), 3.1))):
		var _v23 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v23, "R"), "chance", [_S.binary("*", _S.binary("*", 8, _S.read(_v23, "k")), _S.read(_v23, "dt"))])):
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "SMOKE"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [1, 6])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [40, 80])), _S.invoke(_S.read(_v23, "R"), "range", [1.5, 2.3]), _S.prop(_S.read(_v23, "st"), "dust"), _S.invoke(_S.read(_v23, "R"), "range", [5, 8]), 0, _S.prop(_S.read(_v23, "PF"), "BIG")])
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v23, "t"), 1.5), func(): return _S.invoke(_S.read(_v23, "R"), "chance", [_S.binary("*", 16, _S.read(_v23, "dt"))]))):
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "FIRE"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [4, 14])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [90, 150])), _S.invoke(_S.read(_v23, "R"), "range", [0.5, 0.8]), 0, _S.invoke(_S.read(_v23, "R"), "range", [4, 7.5]), 0, (_S.binary("|", _S.prop(_S.read(_v23, "PF"), "SMOKES"), _S.prop(_S.read(_v23, "PF"), "BIG")) if _S.truth(_S.invoke(_S.read(_v23, "R"), "chance", [0.5])) else 0)])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v23, "t"), 0.45), func(): return _S.invoke(_S.read(_v23, "R"), "chance", [_S.binary("*", _S.binary("*", 12, _S.read(_v23, "k")), _S.read(_v23, "dt"))]))):
			var _v24 = _S.scope(_v23)
			_S.define(_v24, "s", _S.invoke(_S.read(_v24, "R"), "sign", []))
			_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "SMOKE"), _S.binary("*", _S.read(_v24, "s"), _S.invoke(_S.read(_v24, "R"), "range", [40, 120])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [1, 4])), _S.binary("*", _S.unary("-", _S.read(_v24, "s")), _S.invoke(_S.read(_v24, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [0, 5])), _S.invoke(_S.read(_v24, "R"), "range", [1.3, 1.9]), _S.prop(_S.read(_v24, "st"), "dust"), _S.invoke(_S.read(_v24, "R"), "range", [3.5, 5.5]), 0, _S.prop(_S.read(_v24, "PF"), "BIG")])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.3), func(): return _S.binary("<", _S.read(_e, "t"), 3)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.binary("*", 10, _S.invoke(_S.read(_e, "plume"), "hot", [])), _S.read(_e, "dt"))]))):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "a", _S.invoke(_S.read(_v25, "R"), "range", [0, _S.read(_v25, "TAU")]))
		_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "EMBER"), _S.binary("+", _S.prop(_S.read(_v25, "S"), "x"), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.read(_v25, "a")]), _S.binary("+", _S.prop(_S.read(_v25, "S"), "ring"), _S.prop(_S.read(_v25, "S"), "tube")))), _S.binary("+", _S.prop(_S.read(_v25, "S"), "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.read(_v25, "a")]), _S.prop(_S.read(_v25, "S"), "tube")), 0.5)), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.read(_v25, "a")]), _S.invoke(_S.read(_v25, "R"), "range", [40, 90])), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [10, 60])), _S.invoke(_S.read(_v25, "R"), "range", [1.2, 2.4]), _S.prop(_S.read(_v25, "F"), 3)])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 1.4), func(): return _S.binary("<", _S.read(_e, "t"), 4.6)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 7, _S.read(_e, "dt"))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "FLAKE"), _S.binary("+", _S.prop(_S.read(_e, "S"), "x"), _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1]), _S.binary("+", _S.prop(_S.read(_e, "S"), "ring"), _S.prop(_S.read(_e, "S"), "tube")))), _S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.binary("*", _S.prop(_S.read(_e, "S"), "tube"), 0.6)), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]), _S.invoke(_S.read(_e, "R"), "range", [0, 10]), _S.invoke(_S.read(_e, "R"), "range", [2, 3]), _S.invoke(_S.read(_e, "R"), "pick", [[_S.prop(_S.read(_e, "SM"), 1), _S.prop(_S.read(_e, "SM"), 2), _S.prop(_S.read(_e, "F"), 2)]]), _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.2])])
	_S.invoke(_S.read(_e, "column"), "update", [_S.read(_e, "dt"), _S.call_value(_S.read(_e, "top"), []), (1 if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.22), func(): return _S.binary("<", _S.read(_e, "t"), 2.5))) else 0)])
	_S.call_value(_S.read(_e, "draft"), [_S.read(_e, "ps"), _S.read(_e, "dt"), _S.merge([{"x": 0}, {"top": _S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.binary("*", _S.prop(_S.read(_e, "S"), "tube"), 0.4))}, {"w": _S.binary("+", 9, _S.binary("*", 7, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "t")])))}, {"up": 170}, {"pull": 130}, {"low": 12}, {"reach": 130}, {"k": _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [2.5, 3.8, _S.read(_e, "t")]))}])])
	for _v26 in _S.array([_S.read(_e, "flashes"), _S.read(_e, "rings")]):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "a", _v26)
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "i", _S.binary("-", _S.prop(_S.read(_v28, "a"), "length"), 1))
		while _S.truth(_S.binary(">=", _S.read(_v28, "i"), 0)):
			if _S.truth(_S.binary("<=", _S.set_prop(_S.prop(_S.read(_v28, "a"), _S.read(_v28, "i")), "life", _S.read(_v28, "dt"), "-=", false), 0)):
				_S.invoke(_S.read(_v28, "a"), "splice", [_S.read(_v28, "i"), 1])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "i", 1, "-=", true)
	for _v29 in _S.array(_S.prop(_S.read(_e, "rocks"), "list")):
		var _v30 = _S.scope(_e)
		_S.define(_v30, "b", _v29)
		_S.set_prop(_S.read(_v30, "b"), "pvy", _S.prop(_S.read(_v30, "b"), "vy"), "=", false)
	_S.invoke(_S.read(_e, "rocks"), "update", [_S.read(_e, "dt")])
	var _v31 = _S.scope(_e)
	_S.define(_v31, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v31, "rocks"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v31, "i"), 0)):
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "b", _S.prop(_S.prop(_S.read(_v32, "rocks"), "list"), _S.read(_v32, "i")))
		if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v32, "b"), "x"), _S.binary("+", _S.read(_v32, "X0"), 4)), func(): return _S.binary(">", _S.prop(_S.read(_v32, "b"), "x"), _S.binary("-", _S.read(_v32, "X1"), 4)))):
			var _v33 = _S.scope(_v32)
			_S.invoke(_S.prop(_S.read(_v33, "rocks"), "list"), "splice", [_S.read(_v33, "i"), 1])
			_v31 = _S.iteration(_v31)
			_S.write(_v31, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v32, "b"), "heat"), 0)):
			var _v34 = _S.scope(_v32)
			_S.set_prop(_S.read(_v34, "b"), "heat", _S.invoke(_S.read(_v34, "Math"), "max", [0, _S.binary("-", _S.prop(_S.read(_v34, "b"), "heat"), _S.binary("*", _S.read(_v34, "dt"), 0.3))]), "=", false)
			if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v34, "b"), "rest")), func(): return _S.binary(">", _S.prop(_S.read(_v34, "b"), "heat"), 0.25))):
				var _v35 = _S.scope(_v34)
				_S.invoke(_S.set_prop(_S.read(_v35, "b"), "pts", [], "??=", false), "push", [_S.merge([{"x": _S.prop(_S.read(_v35, "b"), "x")}, {"y": _S.prop(_S.read(_v35, "b"), "y")}, {"t": _S.read(_v35, "t")}])])
				if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [_S.binary("*", 14, _S.read(_v35, "dt"))])):
					_S.invoke(_S.read(_v35, "ps"), "spawn", [_S.prop(_S.read(_v35, "P"), "FIRE"), _S.prop(_S.read(_v35, "b"), "x"), _S.prop(_S.read(_v35, "b"), "y"), _S.binary("*", _S.prop(_S.read(_v35, "b"), "vx"), 0.1), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v35, "b"), "vy"), 0.1), 8), _S.invoke(_S.read(_v35, "R"), "range", [0.16, 0.3]), 0, _S.invoke(_S.read(_v35, "R"), "range", [1.2, 2.2])])
			else:
				if _S.truth(_S.logical("&&", _S.prop(_S.read(_v34, "b"), "rest"), func(): return _S.invoke(_S.read(_v34, "R"), "chance", [_S.binary("*", _S.binary("*", 3, _S.prop(_S.read(_v34, "b"), "heat")), _S.read(_v34, "dt"))]))):
					_S.invoke(_S.read(_v34, "ps"), "spawn", [_S.prop(_S.read(_v34, "P"), "SMOKE"), _S.prop(_S.read(_v34, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v34, "b"), "y"), 1), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", _S.invoke(_S.read(_v34, "R"), "range", [5, 12])), _S.invoke(_S.read(_v34, "R"), "range", [0.8, 1.4]), 0, _S.invoke(_S.read(_v34, "R"), "range", [1.6, 2.6])])
		_S.define(_v32, "landed", _S.logical("||", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v32, "b"), "pvy"), 0), func(): return _S.binary("<=", _S.prop(_S.read(_v32, "b"), "vy"), 0)), func(): return _S.logical("&&", _S.prop(_S.read(_v32, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v32, "b"), "dusted")))))
		if _S.truth(_S.logical("&&", _S.read(_v32, "landed"), func(): return _S.binary(">", _S.prop(_S.read(_v32, "b"), "pvy"), 60))):
			var _v36 = _S.scope(_v32)
			var _v37 = _S.scope(_v36)
			_S.define(_v37, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v37, "j"), _S.binary("+", 2, _S.invoke(_S.read(_v37, "Math"), "round", [_S.prop(_S.read(_v37, "b"), "s")])))):
				_S.invoke(_S.read(_v37, "ps"), "spawn", [_S.prop(_S.read(_v37, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v37, "b"), "x"), _S.invoke(_S.read(_v37, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v37, "R"), "sign", []), _S.invoke(_S.read(_v37, "R"), "range", [10, 50])), _S.unary("-", _S.invoke(_S.read(_v37, "R"), "range", [2, 20])), _S.invoke(_S.read(_v37, "R"), "range", [0.3, 0.7]), _S.prop(_S.read(_v37, "st"), "dust"), _S.invoke(_S.read(_v37, "R"), "range", [1.3, _S.binary("+", 1, _S.prop(_S.read(_v37, "b"), "s"))])])
				_v37 = _S.iteration(_v37)
				_S.write(_v37, "j", 1, "+=", true)
			if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v36, "b"), "heat"), 0.5), func(): return _S.unary("!", _S.prop(_S.read(_v36, "b"), "dusted")))):
				_S.invoke(_S.read(_v36, "blazes"), "add", [_S.prop(_S.read(_v36, "b"), "x"), _S.unary("-", 0.25), _S.invoke(_S.read(_v36, "R"), "range", [1.2, 2.2]), 0.45])
		if _S.truth(_S.prop(_S.read(_v32, "b"), "rest")):
			_S.set_prop(_S.read(_v32, "b"), "dusted", true, "=", false)
		if _S.truth(_S.prop(_S.read(_v32, "b"), "pts")):
			while _S.truth(_S.logical("&&", _S.prop(_S.prop(_S.read(_v32, "b"), "pts"), "length"), func(): return _S.binary(">", _S.binary("-", _S.read(_v32, "t"), _S.prop(_S.prop(_S.prop(_S.read(_v32, "b"), "pts"), 0), "t")), 0.45))):
				_S.invoke(_S.prop(_S.read(_v32, "b"), "pts"), "shift", [])
		_v31 = _S.iteration(_v31)
		_S.write(_v31, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "blazes"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "Y0"), _S.read(_e, "X1"), _S.read(_e, "Y1")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "scorch"), [_S.read(_e, "p"), _S.read(_e, "HR"), _S.read(_e, "t"), 52, 3.4, _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 1.6), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.3), _S.read(_e, "t")])), 3])
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "t"), 0.6))
	if _S.truth(_S.binary("<", _S.read(_e, "k"), 1)):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0.5, _S.binary("*", 132, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")])), 0.16, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 6, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "st"), "body"), _S.prop(_S.read(_e, "st"), "light"), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 6)], _S.function_value(_e, "_f7")])
	_S.call_value(_S.read(_e, "drawPs"), [_S.read(_e, "p"), _S.read(_e, "ps"), "back", _S.read(_e, "FR")])
	_S.invoke(_S.read(_e, "column"), "draw", [_S.read(_e, "p"), _S.call_value(_S.read(_e, "top"), []), _S.read(_e, "FR"), _S.read(_e, "SM"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 1.4)), _S.invoke(_S.read(_e, "plume"), "hot", [])])
	_S.invoke(_S.read(_e, "plume"), "draw", [_S.read(_e, "p"), _S.read(_e, "FR"), _S.read(_e, "SM")])
	_S.invoke(_S.read(_e, "blazes"), "drawBack", [_S.read(_e, "p")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "t"), 0.6))
	if _S.truth(_S.binary("<", _S.read(_e, "k"), 1)):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0.5, _S.binary("*", 132, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")])), 0.16, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 6, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "st"), "body"), _S.prop(_S.read(_e, "st"), "light"), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 6)], _S.function_value(_e, "_f9")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.04)):
		var _v38 = _S.scope(_e)
		_S.call_value(_S.read(_v38, "dome"), [_S.read(_v38, "p"), _S.read(_v38, "F"), 0, 44, 1])
		_S.invoke(_S.read(_v38, "p"), "glow", [0, _S.unary("-", 30), 68, _S.read(_v38, "WHITE"), 0.6])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.11)):
			_S.call_value(_S.read(_e, "dome"), [_S.read(_e, "p"), _S.read(_e, "F"), 0, _S.binary("-", 38, _S.binary("*", _S.binary("-", _S.read(_e, "t"), 0.04), 120)), _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.04), 0.07))])
	for _v39 in _S.array(_S.prop(_S.read(_e, "rocks"), "list")):
		var _v40 = _S.scope(_e)
		_S.define(_v40, "b", _v39)
		var _v41 = _S.scope(_v40)
		if _S.truth(_S.prop(_S.read(_v41, "b"), "pts")):
			_S.call_value(_S.read(_v41, "trail"), [_S.read(_v41, "p"), _S.prop(_S.read(_v41, "b"), "pts"), _S.read(_v41, "t"), _S.read(_v41, "FR"), _S.read(_v41, "SM"), 0.45, _S.binary("+", 0.6, _S.binary("*", _S.prop(_S.read(_v41, "b"), "s"), 0.3)), _S.prop(_S.read(_v41, "b"), "heat")])
		_S.call_value(_S.read(_v41, "rock"), [_S.read(_v41, "p"), _S.read(_v41, "b"), _S.read(_v41, "st"), _S.read(_v41, "FR")])
	_S.call_value(_S.read(_e, "drawPs"), [_S.read(_e, "p"), _S.read(_e, "ps"), "front", _S.read(_e, "FR")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.24)):
		_S.call_value(_S.read(_e, "flare"), [_S.read(_e, "p"), 0, _S.unary("-", 14), _S.binary("*", 70, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.24)), 1.4])), _S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.24)), _S.read(_e, "F")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.5)):
		var _v42 = _S.scope(_e)
		_S.define(_v42, "u", _S.binary("/", _S.read(_v42, "t"), 0.5))
		_S.define(_v42, "r", _S.binary("+", 34, _S.binary("*", 80, _S.invoke(_S.read(_v42, "ease"), "outCubic", [_S.read(_v42, "u")]))))
		_S.invoke(_S.read(_v42, "p"), "ring", [0, 0, _S.read(_v42, "r"), _S.invoke(_S.read(_v42, "Math"), "max", [1, _S.binary("+", _S.binary("*", 3, _S.binary("-", 1, _S.read(_v42, "u"))), 0.5)]), (_S.prop(_S.read(_v42, "F"), 6) if _S.truth(_S.binary("<", _S.read(_v42, "u"), 0.3)) else (_S.prop(_S.read(_v42, "F"), 5) if _S.truth(_S.binary("<", _S.read(_v42, "u"), 0.6)) else _S.prop(_S.read(_v42, "F"), 3))), _S.function_value(_v42, "_f10")])
		_S.call_value(_S.read(_v42, "glowDome"), [_S.read(_v42, "p"), 0, 0, _S.read(_v42, "r"), 6, _S.prop(_S.read(_v42, "F"), 4), _S.binary("*", 0.35, _S.binary("-", 1, _S.read(_v42, "u")))])
	for _v43 in _S.array(_S.read(_e, "flashes")):
		var _v44 = _S.scope(_e)
		_S.define(_v44, "f", _v43)
		var _v45 = _S.scope(_v44)
		_S.define(_v45, "k2", _S.binary("/", _S.prop(_S.read(_v45, "f"), "life"), _S.prop(_S.read(_v45, "f"), "max")))
		_S.define(_v45, "r", _S.binary("*", _S.prop(_S.read(_v45, "f"), "r"), _S.binary("+", 0.8, _S.binary("*", 0.2, _S.read(_v45, "k2")))))
		_S.invoke(_S.read(_v45, "p"), "circle", [_S.prop(_S.read(_v45, "f"), "x"), _S.prop(_S.read(_v45, "f"), "y"), _S.binary("+", _S.read(_v45, "r"), 1.2), _S.prop(_S.read(_v45, "F"), 2)])
		_S.invoke(_S.read(_v45, "p"), "circle", [_S.prop(_S.read(_v45, "f"), "x"), _S.prop(_S.read(_v45, "f"), "y"), _S.read(_v45, "r"), (_S.prop(_S.read(_v45, "F"), 6) if _S.truth(_S.binary(">", _S.read(_v45, "k2"), 0.45)) else _S.prop(_S.read(_v45, "F"), 5))])
		_S.invoke(_S.read(_v45, "p"), "circle", [_S.prop(_S.read(_v45, "f"), "x"), _S.prop(_S.read(_v45, "f"), "y"), _S.binary("*", _S.read(_v45, "r"), 0.6), (_S.read(_v45, "WHITE") if _S.truth(_S.binary(">", _S.read(_v45, "k2"), 0.45)) else _S.prop(_S.read(_v45, "F"), 6))])
	for _v46 in _S.array(_S.read(_e, "rings")):
		var _v47 = _S.scope(_e)
		_S.define(_v47, "r", _v46)
		var _v48 = _S.scope(_v47)
		_S.define(_v48, "k2", _S.binary("/", _S.prop(_S.read(_v48, "r"), "life"), _S.prop(_S.read(_v48, "r"), "max")))
		_S.define(_v48, "e", _S.binary("-", 1, _S.invoke(_S.read(_v48, "Math"), "pow", [_S.read(_v48, "k2"), 3])))
		_S.invoke(_S.read(_v48, "p"), "ring", [_S.prop(_S.read(_v48, "r"), "x"), _S.prop(_S.read(_v48, "r"), "y"), _S.binary("+", _S.prop(_S.read(_v48, "r"), "r0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v48, "r"), "r1"), _S.prop(_S.read(_v48, "r"), "r0")), _S.read(_v48, "e"))), _S.invoke(_S.read(_v48, "Math"), "max", [1, _S.binary("+", _S.binary("*", _S.prop(_S.read(_v48, "r"), "thick"), _S.read(_v48, "k2")), 0.4)]), _S.prop(_S.read(_v48, "r"), "c"), _S.invoke(_S.read(_v48, "Math"), "min", [1, _S.binary("*", _S.read(_v48, "k2"), 1.6)])])
	_S.define(_e, "hot", _S.invoke(_S.read(_e, "plume"), "hot", []))
	_S.define(_e, "flash", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.9))]))
	_S.call_value(_S.read(_e, "pool"), [_S.read(_e, "p"), 0, 1, 150, 22, _S.prop(_S.read(_e, "F"), 3), _S.binary("+", _S.binary("*", 0.24, _S.read(_e, "hot")), _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "flash")), _S.read(_e, "flash")))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	return (0 if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 0)) else _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_e, "u")), 1.6)]))
