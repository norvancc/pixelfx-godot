@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/barrel-explosion.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "fireRamp", _S.import_value("fx/explosions/_lib.js", "fireRamp"))
	_S.define(_e, "heatRamp", _S.import_value("fx/explosions/_lib.js", "heatRamp"))
	_S.define(_e, "drawPs", _S.import_value("fx/explosions/_lib.js", "drawPs"))
	_S.define(_e, "cull", _S.import_value("fx/explosions/_lib.js", "cull"))
	_S.define(_e, "fadeEdges", _S.import_value("fx/explosions/_lib.js", "fadeEdges"))
	_S.define(_e, "scorch", _S.import_value("fx/explosions/_lib.js", "scorch"))
	_S.define(_e, "pool", _S.import_value("fx/explosions/_lib.js", "pool"))
	_S.define(_e, "OUTLINE", _S.import_value("fx/explosions/_lib.js", "OUTLINE"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBarrel", _S.function_value(_e, "_f9"))
	_S.define(_e, "stave", _S.function_value(_e, "_f12"))
	_S.define(_e, "drawLid", _S.function_value(_e, "_f13"))
	_S.define(_e, "meta", _S.merge([{"name": "Barrel explosion"}, {"desc": "An explosive barrel shudders, its lid bulging and spitting flame, then blows: a fireball column, staves and the lid flying, burning fuel splashed over the floor."}, {"tags": ["explosion", "barrel", "fire", "smoke", "debris", "ground", "one-shot"]}, {"size": [300, 240]}, {"origin": [150, 204]}, {"duration": 5.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"barrel": ["#1c0a0e", "#4a1218", "#7c1a1e", "#b02a26", "#d8483a", "#f08a70"]}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "BLOW", 0.8)
	_S.define(_e, "BW", 8)
	_S.define(_e, "BH", 22)
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
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "barrel"), 6]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
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
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "staves", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "OIL", _S.call_value(_S.read(_e, "hex"), ["#221a22"]))
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#1f1a24"]))
	_S.define(_e, "lid", _S.merge([{"x": 0}, {"y": _S.unary("-", _S.read(_e, "BH"))}, {"vx": 0}, {"vy": 0}, {"a": 0}, {"va": 0}, {"on": false}, {"rest": false}]))
	_S.define(_e, "pools", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "blown", false)
	_S.define(_e, "blow", _S.function_value(_e, "_f3"))
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"drawBack": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "blazes"), "add", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 0.25), _S.invoke(_S.read(_e, "R"), "range", [1.2, 2.2]), _S.invoke(_S.read(_e, "R"), "range", [0.6, 1])])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.write(_e, "blown", true, "=", false)
	_S.define(_e, "y", _S.binary("*", _S.unary("-", _S.read(_e, "BH")), 0.5))
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.binary("-", _S.read(_e, "y"), 20), 90, _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 6), 0.45]), 0.85, 0.9])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.read(_e, "y"), 44, _S.read(_e, "WHITE"), 0.7, 0.09])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 5)):
		_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "FIRE"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 3), 3]), _S.binary("+", _S.read(_v2, "y"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 3), 3])), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 20), 20]), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 40), _S.unary("-", 10)]), _S.invoke(_S.read(_v2, "R"), "range", [0.18, 0.28]), 0, _S.invoke(_S.read(_v2, "R"), "range", [9, 12])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 30)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "a", _S.invoke(_S.read(_v4, "R"), "range", [_S.binary("-", _S.unary("-", _S.prop(_S.read(_v4, "Math"), "PI")), 0.15), 0.15]))
		_S.define(_v4, "d", _S.invoke(_S.read(_v4, "R"), "range", [0, 8]))
		_S.define(_v4, "sp", _S.invoke(_S.read(_v4, "R"), "range", [50, 190]))
		_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "FIRE"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "d")), _S.binary("+", _S.read(_v4, "y"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "d"))), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "sp")), 0.8), 40), _S.invoke(_S.read(_v4, "R"), "range", [0.55, 1.05]), 0, _S.invoke(_S.read(_v4, "R"), "range", [5, 10]), 0, (_S.binary("|", _S.prop(_S.read(_v4, "PF"), "SMOKES"), _S.prop(_S.read(_v4, "PF"), "BIG")) if _S.truth(_S.invoke(_S.read(_v4, "R"), "chance", [0.5])) else 0)])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), 12)):
		_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "FIRE"), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 6), 6]), _S.binary("-", _S.read(_v5, "y"), _S.invoke(_S.read(_v5, "R"), "range", [0, 10])), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 14), 14]), _S.unary("-", _S.invoke(_S.read(_v5, "R"), "range", [170, 300])), _S.invoke(_S.read(_v5, "R"), "range", [0.7, 1.15]), 0, _S.invoke(_S.read(_v5, "R"), "range", [6, 10]), _S.invoke(_S.read(_v5, "R"), "range", [0, 0.12]), (_S.binary("|", _S.prop(_S.read(_v5, "PF"), "SMOKES"), _S.prop(_S.read(_v5, "PF"), "BIG")) if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [0.7])) else 0)])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 12)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v7, "Math"), "PI")), 0]))
		_S.define(_v7, "d", _S.invoke(_S.read(_v7, "R"), "range", [4, 16]))
		_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SMOKE"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "d")), _S.binary("+", _S.read(_v7, "y"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "d"))), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), 30), _S.unary("-", _S.invoke(_S.read(_v7, "R"), "range", [30, 90])), _S.invoke(_S.read(_v7, "R"), "range", [1.6, 2.6]), _S.read(_v7, "SOOT"), _S.invoke(_S.read(_v7, "R"), "range", [8, 13]), _S.invoke(_S.read(_v7, "R"), "range", [0.1, 0.4]), _S.prop(_S.read(_v7, "PF"), "BIG")])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), 90)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "a", _S.invoke(_S.read(_v9, "R"), "range", [0, _S.read(_v9, "TAU")]))
		_S.define(_v9, "sp", _S.invoke(_S.read(_v9, "R"), "range", [160, 400]))
		_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "SPARK"), 0, _S.read(_v9, "y"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "sp")), 70), _S.invoke(_S.read(_v9, "R"), "range", [0.2, 0.6])])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), 40)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "a", _S.invoke(_S.read(_v11, "R"), "range", [0, _S.read(_v11, "TAU")]))
		_S.define(_v11, "sp", _S.invoke(_S.read(_v11, "R"), "range", [30, 140]))
		_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), 8), _S.binary("+", _S.read(_v11, "y"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), 8)), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), 70), _S.invoke(_S.read(_v11, "R"), "range", [1.2, 2.6]), _S.prop(_S.read(_v11, "F"), 3)])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), 14)):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v13, "Math"), "PI")), 2), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 1.2), 1.2])))
		_S.define(_v13, "sp", _S.invoke(_S.read(_v13, "R"), "range", [120, 300]))
		_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "BRAND"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 4), 4]), _S.read(_v13, "y"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.invoke(_S.read(_v13, "R"), "range", [0.8, 1.4])])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), 9)):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "side", (1 if _S.truth(_S.binary("%", _S.read(_v15, "i"), 2)) else _S.unary("-", 1)))
		_S.define(_v15, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v15, "Math"), "PI")), 2), _S.binary("*", _S.read(_v15, "side"), _S.invoke(_S.read(_v15, "R"), "range", [0.25, 1.15]))))
		_S.define(_v15, "sp", _S.invoke(_S.read(_v15, "R"), "range", [170, 330]))
		_S.invoke(_S.read(_v15, "staves"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v15, "B"), "CHUNK")}, {"x": _S.binary("*", _S.read(_v15, "side"), _S.invoke(_S.read(_v15, "R"), "range", [2, 6]))}, {"y": _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [4, _S.binary("-", _S.read(_v15, "BH"), 4)]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "sp"))}, {"g": 1}, {"drag": 0.5}, {"bounce": 0.35}, {"life": _S.invoke(_S.read(_v15, "R"), "range", [3, 3.8])}, {"a": _S.invoke(_S.read(_v15, "R"), "range", [0, _S.read(_v15, "TAU")])}, {"va": _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 16), 16])}, {"s": _S.invoke(_S.read(_v15, "R"), "range", [9, 13])}, {"heat": _S.invoke(_S.read(_v15, "R"), "range", [0.4, 0.9])}])])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "Object"), "assign", [_S.read(_e, "lid"), _S.merge([{"on": true}, {"x": 0}, {"y": _S.unary("-", _S.read(_e, "BH"))}, {"vx": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 40), 40])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [430, 480]))}, {"a": 0}, {"va": _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), _S.invoke(_S.read(_e, "R"), "range", [10, 14]))}])])
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), 7)):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "x", _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 34), 34]))
		_S.invoke(_S.read(_v17, "pools"), "push", [_S.merge([{"x": _S.read(_v17, "x")}, {"w": _S.invoke(_S.read(_v17, "R"), "range", [5, 10])}])])
		_S.invoke(_S.read(_v17, "blazes"), "add", [_S.read(_v17, "x"), _S.unary("-", 0.25), _S.invoke(_S.read(_v17, "R"), "range", [2.2, 3]), _S.invoke(_S.read(_v17, "R"), "range", [0.8, 1.3])])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	var _v18 = _S.scope(_e)
	_S.define(_v18, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "i"), 12)):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "s", _S.invoke(_S.read(_v19, "R"), "sign", []))
		_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "SMOKE"), _S.binary("*", _S.read(_v19, "s"), _S.invoke(_S.read(_v19, "R"), "range", [0, 10])), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [1, 4])), _S.binary("*", _S.read(_v19, "s"), _S.invoke(_S.read(_v19, "R"), "range", [80, 220])), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [2, 12])), _S.invoke(_S.read(_v19, "R"), "range", [1.1, 1.8]), _S.call_value(_S.read(_v19, "hex"), ["#7d7280"]), _S.invoke(_S.read(_v19, "R"), "range", [6, 9]), _S.invoke(_S.read(_v19, "R"), "range", [0, 0.05]), _S.prop(_S.read(_v19, "PF"), "BIG")])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "i", 1, "+=", true)
	var _v20 = _S.scope(_e)
	_S.define(_v20, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v20, "i"), 60)):
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "u", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 1), 1]))
		_S.define(_v21, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v21, "Math"), "PI")), 2), _S.binary("*", _S.read(_v21, "u"), 0.7)))
		_S.define(_v21, "sp", _S.binary("*", _S.invoke(_S.read(_v21, "R"), "range", [120, 330]), _S.binary("-", 1, _S.binary("*", 0.4, _S.invoke(_S.read(_v21, "Math"), "abs", [_S.read(_v21, "u")])))))
		_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "GRIT"), _S.binary("*", _S.read(_v21, "u"), 6), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), _S.read(_v21, "sp")), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "a")]), _S.read(_v21, "sp")), _S.invoke(_S.read(_v21, "R"), "range", [1.1, 1.9]), _S.invoke(_S.read(_v21, "R"), "pick", [[_S.call_value(_S.read(_v21, "hex"), ["#5a4f6b"]), _S.call_value(_S.read(_v21, "hex"), ["#3e3650"]), _S.call_value(_S.read(_v21, "hex"), ["#776c88"])]]), (2 if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [0.4])) else 1)])
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "i", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.unary("!", _S.read(_e, "blown"))):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "k", _S.binary("/", _S.read(_v22, "t"), _S.read(_v22, "BLOW")))
		if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [_S.binary("*", _S.binary("+", 6, _S.binary("*", _S.binary("*", 30, _S.read(_v22, "k")), _S.read(_v22, "k"))), _S.read(_v22, "dt"))])):
			var _v23 = _S.scope(_v22)
			_S.define(_v23, "s", _S.invoke(_S.read(_v23, "R"), "sign", []))
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "FIRE"), _S.binary("*", _S.read(_v23, "s"), _S.invoke(_S.read(_v23, "R"), "range", [4, 7])), _S.binary("+", _S.unary("-", _S.read(_v23, "BH")), 1), _S.binary("*", _S.read(_v23, "s"), _S.invoke(_S.read(_v23, "R"), "range", [20, 60])), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [20, 60])), _S.invoke(_S.read(_v23, "R"), "range", [0.15, 0.3]), 0, _S.invoke(_S.read(_v23, "R"), "range", [1.5, 3])])
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "SPARK"), _S.binary("*", _S.read(_v23, "s"), 6), _S.binary("+", _S.unary("-", _S.read(_v23, "BH")), 1), _S.binary("*", _S.read(_v23, "s"), _S.invoke(_S.read(_v23, "R"), "range", [40, 140])), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [20, 120])), _S.invoke(_S.read(_v23, "R"), "range", [0.1, 0.25])])
		if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [_S.binary("*", 10, _S.read(_v22, "dt"))])):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "SMOKE"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", _S.read(_v22, "BH")), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [15, 35])), _S.invoke(_S.read(_v22, "R"), "range", [0.8, 1.3]), 0, _S.invoke(_S.read(_v22, "R"), "range", [2.5, 4])])
		if _S.truth(_S.binary(">=", _S.read(_v22, "t"), _S.read(_v22, "BLOW"))):
			_S.call_value(_S.read(_v22, "blow"), [])
	if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "lid"), "on"), func(): return _S.unary("!", _S.prop(_S.read(_e, "lid"), "rest")))):
		var _v24 = _S.scope(_e)
		_S.set_prop(_S.read(_v24, "lid"), "vy", _S.binary("*", 950, _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "lid"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v24, "lid"), "vx"), 0.4), _S.read(_v24, "dt")), "-=", false)
		_S.set_prop(_S.read(_v24, "lid"), "x", _S.binary("*", _S.prop(_S.read(_v24, "lid"), "vx"), _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "lid"), "y", _S.binary("*", _S.prop(_S.read(_v24, "lid"), "vy"), _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "lid"), "a", _S.binary("*", _S.prop(_S.read(_v24, "lid"), "va"), _S.read(_v24, "dt")), "+=", false)
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v24, "lid"), "y"), _S.unary("-", 1)), func(): return _S.binary(">", _S.prop(_S.read(_v24, "lid"), "vy"), 0))):
			var _v25 = _S.scope(_v24)
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v26, "i"), 6)):
				_S.invoke(_S.read(_v26, "ps"), "spawn", [_S.prop(_S.read(_v26, "P"), "SPARK"), _S.prop(_S.read(_v26, "lid"), "x"), _S.unary("-", 1), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 90), 90]), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [40, 140])), _S.invoke(_S.read(_v26, "R"), "range", [0.1, 0.25])])
				_v26 = _S.iteration(_v26)
				_S.write(_v26, "i", 1, "+=", true)
			var _v27 = _S.scope(_v25)
			_S.define(_v27, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v27, "i"), 5)):
				_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v27, "lid"), "x"), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 4), 4])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v27, "R"), "sign", []), _S.invoke(_S.read(_v27, "R"), "range", [15, 60])), _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [4, 18])), _S.invoke(_S.read(_v27, "R"), "range", [0.35, 0.7]), _S.call_value(_S.read(_v27, "hex"), ["#7d7280"]), _S.invoke(_S.read(_v27, "R"), "range", [1.8, 3])])
				_v27 = _S.iteration(_v27)
				_S.write(_v27, "i", 1, "+=", true)
			_S.set_prop(_S.read(_v25, "lid"), "y", _S.unary("-", 1), "=", false)
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v25, "lid"), "vy"), 160)):
				_S.last([_S.set_prop(_S.read(_v25, "lid"), "vy", _S.unary("-", 0.3), "*=", false), _S.set_prop(_S.read(_v25, "lid"), "vx", 0.5, "*=", false), _S.set_prop(_S.read(_v25, "lid"), "va", 0.5, "*=", false)])
			else:
				_S.last([_S.set_prop(_S.read(_v25, "lid"), "rest", true, "=", false), _S.set_prop(_S.read(_v25, "lid"), "a", _S.binary("/", _S.prop(_S.read(_v25, "Math"), "PI"), 2), "=", false)])
	_S.invoke(_S.read(_e, "staves"), "update", [_S.read(_e, "dt")])
	var _v28 = _S.scope(_e)
	_S.define(_v28, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v28, "staves"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v28, "i"), 0)):
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "b", _S.prop(_S.prop(_S.read(_v29, "staves"), "list"), _S.read(_v29, "i")))
		if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v29, "b"), "x"), _S.binary("+", _S.read(_v29, "X0"), 8)), func(): return _S.binary(">", _S.prop(_S.read(_v29, "b"), "x"), _S.binary("-", _S.read(_v29, "X1"), 8)))):
			_S.invoke(_S.prop(_S.read(_v29, "staves"), "list"), "splice", [_S.read(_v29, "i"), 1])
		else:
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v29, "b"), "heat"), 0)):
				_S.set_prop(_S.read(_v29, "b"), "heat", _S.invoke(_S.read(_v29, "Math"), "max", [0, _S.binary("-", _S.prop(_S.read(_v29, "b"), "heat"), _S.binary("*", _S.read(_v29, "dt"), 0.35))]), "=", false)
		_v28 = _S.iteration(_v28)
		_S.write(_v28, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "blazes"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "Y0"), _S.read(_e, "X1"), _S.read(_e, "Y1")])
	_S.call_value(_S.read(_e, "fadeEdges"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "X1"), 24, _S.read(_e, "Y1")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.read(_e, "blown")):
		var _v30 = _S.scope(_e)
		_S.define(_v30, "u", _S.binary("-", _S.read(_v30, "t"), _S.read(_v30, "BLOW")))
		_S.define(_v30, "out", _S.binary("-", 1, _S.call_value(_S.read(_v30, "smooth"), [_S.binary("-", _S.binary("-", _S.prop(_S.read(_v30, "meta"), "duration"), _S.read(_v30, "BLOW")), 1), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v30, "meta"), "duration"), _S.read(_v30, "BLOW")), 0.2), _S.read(_v30, "u")])))
		_S.call_value(_S.read(_v30, "scorch"), [_S.read(_v30, "p"), _S.read(_v30, "HR"), _S.read(_v30, "u"), 30, 2.2, _S.read(_v30, "out"), 3])
		_S.define(_v30, "left", _S.binary("-", 1, _S.call_value(_S.read(_v30, "smooth"), [1.6, 3.4, _S.read(_v30, "u")])))
		if _S.truth(_S.binary(">", _S.read(_v30, "left"), 0)):
			for _v31 in _S.array(_S.read(_v30, "pools")):
				var _v32 = _S.scope(_v30)
				_S.define(_v32, "q", _v31)
				var _v33 = _S.scope(_v32)
				_S.define(_v33, "x", _S.invoke(_S.read(_v33, "Math"), "floor", [_S.binary("*", _S.unary("-", _S.prop(_S.read(_v33, "q"), "w")), _S.read(_v33, "left"))]))
				while _S.truth(_S.binary("<=", _S.read(_v33, "x"), _S.invoke(_S.read(_v33, "Math"), "ceil", [_S.binary("*", _S.prop(_S.read(_v33, "q"), "w"), _S.read(_v33, "left"))]))):
					var _v34 = _S.scope(_v33)
					_S.define(_v34, "e", _S.binary("/", _S.invoke(_S.read(_v34, "Math"), "abs", [_S.read(_v34, "x")]), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v34, "q"), "w"), _S.read(_v34, "left")), 0.01)))
					_S.invoke(_S.read(_v34, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v34, "q"), "x"), _S.read(_v34, "x")), 1, (_S.prop(_S.read(_v34, "F"), 4) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v34, "rand"), [_S.invoke(_S.read(_v34, "Math"), "floor", [_S.binary("+", _S.prop(_S.read(_v34, "q"), "x"), _S.read(_v34, "x"))]), _S.invoke(_S.read(_v34, "Math"), "floor", [_S.binary("*", _S.read(_v34, "t"), 12)])]), 0.25)) else _S.read(_v34, "OIL")), _S.binary("*", _S.read(_v34, "out"), (1 if _S.truth(_S.binary("<", _S.read(_v34, "e"), 0.8)) else 0.6))])
					if _S.truth(_S.binary("<", _S.read(_v34, "e"), 0.6)):
						_S.invoke(_S.read(_v34, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v34, "q"), "x"), _S.read(_v34, "x")), 2, _S.read(_v34, "OIL"), _S.binary("*", _S.read(_v34, "out"), 0.8)])
					_v33 = _S.iteration(_v33)
					_S.write(_v33, "x", 1, "+=", true)
		_S.define(_v30, "k", _S.binary("/", _S.read(_v30, "u"), 0.45))
		if _S.truth(_S.binary("<", _S.read(_v30, "k"), 1)):
			_S.call_value(_S.read(_v30, "band"), [_S.read(_v30, "p"), 0, 0.5, _S.binary("*", 100, _S.invoke(_S.read(_v30, "ease"), "outCubic", [_S.read(_v30, "k")])), 0.16, _S.invoke(_S.read(_v30, "Math"), "max", [1, _S.binary("*", 4.5, _S.binary("-", 1, _S.read(_v30, "k")))]), _S.binary("-", 1.15, _S.read(_v30, "k")), [_S.call_value(_S.read(_v30, "hex"), ["#4a3f69"]), _S.call_value(_S.read(_v30, "hex"), ["#6e6390"]), _S.prop(_S.read(_v30, "F"), 3), _S.prop(_S.read(_v30, "F"), 6)], _S.function_value(_v30, "_f6")])
	_S.call_value(_S.read(_e, "drawPs"), [_S.read(_e, "p"), _S.read(_e, "ps"), "back", _S.read(_e, "FR")])
	_S.invoke(_S.read(_e, "blazes"), "drawBack", [_S.read(_e, "p")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.unary("!", _S.read(_e, "blown"))):
		var _v35 = _S.scope(_e)
		_S.define(_v35, "k", _S.binary("/", _S.read(_v35, "t"), _S.read(_v35, "BLOW")))
		_S.define(_v35, "jx", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v35, "Math"), "sin", [_S.binary("*", _S.read(_v35, "t"), 70)]), _S.read(_v35, "k")), _S.read(_v35, "k")), 1.4))
		_S.define(_v35, "jy", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v35, "Math"), "abs", [_S.invoke(_S.read(_v35, "Math"), "sin", [_S.binary("*", _S.read(_v35, "t"), 53)])]), _S.read(_v35, "k")), _S.read(_v35, "k")), 0.8))
		_S.call_value(_S.read(_v35, "drawBarrel"), [_S.read(_v35, "p"), _S.read(_v35, "C"), _S.read(_v35, "jx"), _S.unary("-", _S.read(_v35, "jy")), _S.read(_v35, "k")])
		_S.invoke(_S.read(_v35, "p"), "glow", [0, _S.unary("-", _S.read(_v35, "BH")), _S.binary("+", 10, _S.binary("*", 8, _S.read(_v35, "k"))), _S.prop(_S.read(_v35, "F"), 4), _S.binary("+", 0.25, _S.binary("*", _S.binary("*", _S.binary("*", 0.35, _S.read(_v35, "k")), _S.read(_v35, "k")), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.invoke(_S.read(_v35, "Math"), "sin", [_S.binary("*", _S.read(_v35, "t"), 40)])))))])
	else:
		var _v36 = _S.scope(_e)
		_S.define(_v36, "u", _S.binary("-", _S.read(_v36, "t"), _S.read(_v36, "BLOW")))
		_S.define(_v36, "k", _S.binary("/", _S.read(_v36, "u"), 0.45))
		if _S.truth(_S.binary("<", _S.read(_v36, "k"), 1)):
			_S.call_value(_S.read(_v36, "band"), [_S.read(_v36, "p"), 0, 0.5, _S.binary("*", 100, _S.invoke(_S.read(_v36, "ease"), "outCubic", [_S.read(_v36, "k")])), 0.16, _S.invoke(_S.read(_v36, "Math"), "max", [1, _S.binary("*", 4.5, _S.binary("-", 1, _S.read(_v36, "k")))]), _S.binary("-", 1.15, _S.read(_v36, "k")), [_S.call_value(_S.read(_v36, "hex"), ["#4a3f69"]), _S.call_value(_S.read(_v36, "hex"), ["#6e6390"]), _S.prop(_S.read(_v36, "F"), 3), _S.prop(_S.read(_v36, "F"), 6)], _S.function_value(_v36, "_f8")])
	_S.call_value(_S.read(_e, "drawPs"), [_S.read(_e, "p"), _S.read(_e, "ps"), "front", _S.read(_e, "FR")])
	for _v37 in _S.array(_S.prop(_S.read(_e, "staves"), "list")):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "b", _v37)
		_S.call_value(_S.read(_v38, "stave"), [_S.read(_v38, "p"), _S.read(_v38, "b"), _S.read(_v38, "C"), _S.read(_v38, "FR")])
	if _S.truth(_S.prop(_S.read(_e, "lid"), "on")):
		_S.call_value(_S.read(_e, "drawLid"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "lid"), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), _S.read(_e, "t")), 0.4)])])
	if _S.truth(_S.read(_e, "blown")):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "u", _S.binary("-", _S.read(_v39, "t"), _S.read(_v39, "BLOW")))
		if _S.truth(_S.binary("<", _S.read(_v39, "u"), 0.08)):
			var _v40 = _S.scope(_v39)
			_S.define(_v40, "k2", _S.binary("-", 1, _S.binary("/", _S.read(_v40, "u"), 0.08)))
			_S.define(_v40, "r", _S.binary("*", 18, _S.binary("+", 0.85, _S.binary("*", 0.15, _S.read(_v40, "k2")))))
			_S.define(_v40, "y", _S.binary("*", _S.unary("-", _S.read(_v40, "BH")), 0.5))
			_S.invoke(_S.read(_v40, "p"), "circle", [0, _S.read(_v40, "y"), _S.binary("+", _S.read(_v40, "r"), 1.4), _S.prop(_S.read(_v40, "F"), 2)])
			_S.invoke(_S.read(_v40, "p"), "circle", [0, _S.read(_v40, "y"), _S.read(_v40, "r"), (_S.prop(_S.read(_v40, "F"), 6) if _S.truth(_S.binary(">", _S.read(_v40, "k2"), 0.45)) else _S.prop(_S.read(_v40, "F"), 5))])
			_S.invoke(_S.read(_v40, "p"), "circle", [0, _S.read(_v40, "y"), _S.binary("*", _S.read(_v40, "r"), 0.6), (_S.read(_v40, "WHITE") if _S.truth(_S.binary(">", _S.read(_v40, "k2"), 0.45)) else _S.prop(_S.read(_v40, "F"), 6))])
		if _S.truth(_S.binary("<", _S.read(_v39, "u"), 0.22)):
			_S.call_value(_S.read(_v39, "flare"), [_S.read(_v39, "p"), 0, _S.binary("*", _S.unary("-", _S.read(_v39, "BH")), 0.5), _S.binary("*", 54, _S.invoke(_S.read(_v39, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.read(_v39, "u"), 0.22)), 1.4])), _S.binary("-", 1, _S.binary("/", _S.read(_v39, "u"), 0.22)), _S.read(_v39, "F")])
		_S.call_value(_S.read(_v39, "pool"), [_S.read(_v39, "p"), 0, 1, 90, 14, _S.prop(_S.read(_v39, "F"), 3), _S.binary("+", _S.binary("*", 0.5, _S.invoke(_S.read(_v39, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.read(_v39, "u"), 0.7))])), _S.binary("*", 0.22, _S.binary("-", 1, _S.call_value(_S.read(_v39, "smooth"), [1.6, 3.4, _S.read(_v39, "u")]))))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "k", _S.arg(_args, 4))
	_S.define(_e, "bulge", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "k")), 2)]))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "BW")), 1), _S.binary("-", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "BH")), 3), _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "BW")), 1), _S.binary("+", _S.read(_e, "y"), 0.5), _S.function_value(_e, "_f10")])
	_S.invoke(_S.read(_e, "p"), "ellipse", [_S.read(_e, "x"), _S.binary("-", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "BH")), _S.binary("*", _S.read(_e, "bulge"), 0.5)), _S.binary("-", _S.read(_e, "BW"), 0.5), _S.binary("+", 2.2, _S.binary("*", _S.read(_e, "bulge"), 0.4)), _S.function_value(_e, "_f11")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")), _S.read(_e, "BW")))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "py")), _S.read(_e, "BH")))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "dx")]), 1.1), func(): return _S.binary("<", _S.read(_e, "v"), 0)), func(): return _S.binary(">", _S.read(_e, "v"), 1.05))):
		return null
	_S.define(_e, "edge", _S.logical("||", _S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "dx")]), 0.92), func(): return _S.binary(">", _S.read(_e, "v"), 0.97)), func(): return _S.binary("<", _S.read(_e, "v"), 0.04)))
	if _S.truth(_S.read(_e, "edge")):
		return _S.read(_e, "OUTLINE")
	_S.define(_e, "rib", _S.logical("||", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "v"), 0.33)]), 0.035), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "v"), 0.67)]), 0.035)))
	_S.define(_e, "ribLit", _S.logical("||", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "v"), 0.31)]), 0.03), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "v"), 0.65)]), 0.03)))
	_S.define(_e, "band", _S.logical("&&", _S.binary(">", _S.read(_e, "v"), 0.44), func(): return _S.binary("<", _S.read(_e, "v"), 0.56)))
	_S.define(_e, "lit", _S.unary("-", _S.read(_e, "dx")))
	_S.define(_e, "i", (5 if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.55)) else (4 if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.15)) else (3 if _S.truth(_S.binary(">", _S.read(_e, "lit"), _S.unary("-", 0.35))) else (2 if _S.truth(_S.binary(">", _S.read(_e, "lit"), _S.unary("-", 0.75))) else 1)))))
	if _S.truth(_S.read(_e, "band")):
		return (_S.call_value(_S.read(_e, "hex"), ["#e8d8b0"]) if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.3)) else (_S.call_value(_S.read(_e, "hex"), ["#b8a888"]) if _S.truth(_S.binary(">", _S.read(_e, "lit"), _S.unary("-", 0.4))) else _S.call_value(_S.read(_e, "hex"), ["#6e6050"])))
	if _S.truth(_S.read(_e, "rib")):
		_S.write(_e, "i", _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("-", _S.read(_e, "i"), 2)]), "=", false)
	else:
		if _S.truth(_S.read(_e, "ribLit")):
			_S.write(_e, "i", _S.invoke(_S.read(_e, "Math"), "min", [5, _S.binary("+", _S.read(_e, "i"), 1)]), "=", false)
	return _S.prop(_S.read(_e, "C"), _S.read(_e, "i"))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	return ((_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 0)) else _S.prop(_S.read(_e, "C"), 2)) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.7)) else _S.prop(_S.read(_e, "C"), 1))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "FR", _S.arg(_args, 3))
	_S.define(_e, "fade", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_e, "b"), "life"), 0.5)]))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "b"), "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "b"), "a")]))
	_S.define(_e, "L", _S.prop(_S.read(_e, "b"), "s"))
	_S.define(_e, "face", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.prop(_S.read(_e, "b"), "a"), 1.7)]), 0))
	var _v41 = _S.scope(_e)
	_S.define(_v41, "d", _S.binary("/", _S.unary("-", _S.read(_v41, "L")), 2))
	while _S.truth(_S.binary("<=", _S.read(_v41, "d"), _S.binary("/", _S.read(_v41, "L"), 2))):
		var _v42 = _S.scope(_v41)
		_S.define(_v42, "bow", _S.binary("*", _S.binary("-", 1, _S.binary("**", _S.binary("/", _S.binary("*", 2, _S.read(_v42, "d")), _S.read(_v42, "L")), 2)), 1.2))
		_S.define(_v42, "x", _S.binary("-", _S.binary("+", _S.prop(_S.read(_v42, "b"), "x"), _S.binary("*", _S.read(_v42, "ca"), _S.read(_v42, "d"))), _S.binary("*", _S.read(_v42, "sa"), _S.read(_v42, "bow"))))
		_S.define(_v42, "y", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v42, "b"), "y"), _S.binary("*", _S.read(_v42, "sa"), _S.read(_v42, "d"))), _S.binary("*", _S.read(_v42, "ca"), _S.read(_v42, "bow"))))
		_S.define(_v42, "hot", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v42, "b"), "heat"), 0.3), func(): return _S.binary(">", _S.invoke(_S.read(_v42, "Math"), "abs", [_S.read(_v42, "d")]), _S.binary("-", _S.binary("/", _S.read(_v42, "L"), 2), 1))))
		_S.invoke(_S.read(_v42, "p"), "dot", [_S.binary("+", _S.read(_v42, "x"), _S.read(_v42, "sa")), _S.binary("-", _S.read(_v42, "y"), _S.read(_v42, "ca")), _S.read(_v42, "OUTLINE"), _S.read(_v42, "fade")])
		_S.invoke(_S.read(_v42, "p"), "dot", [_S.read(_v42, "x"), _S.read(_v42, "y"), (_S.prop(_S.read(_v42, "FR"), (3 if _S.truth(_S.binary(">", _S.prop(_S.read(_v42, "b"), "heat"), 0.6)) else 5)) if _S.truth(_S.read(_v42, "hot")) else (_S.prop(_S.read(_v42, "C"), 4) if _S.truth(_S.read(_v42, "face")) else _S.prop(_S.read(_v42, "C"), 1))), _S.read(_v42, "fade")])
		_S.invoke(_S.read(_v42, "p"), "dot", [_S.binary("-", _S.read(_v42, "x"), _S.read(_v42, "sa")), _S.binary("+", _S.read(_v42, "y"), _S.read(_v42, "ca")), (_S.prop(_S.read(_v42, "C"), 2) if _S.truth(_S.read(_v42, "face")) else _S.read(_v42, "OUTLINE")), _S.read(_v42, "fade")])
		_v41 = _S.iteration(_v41)
		_S.write(_v41, "d", 0.5, "+=", false)
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "b"), "heat"), 0.3)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "b"), "x"), _S.prop(_S.read(_e, "b"), "y"), 6, _S.prop(_S.read(_e, "FR"), 4), _S.binary("*", _S.binary("*", 0.25, _S.prop(_S.read(_e, "b"), "heat")), _S.read(_e, "fade"))])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "lid", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "w", _S.invoke(_S.read(_e, "Math"), "max", [0.8, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "lid"), "a")])]), 7.5)]))
	_S.define(_e, "h", _S.invoke(_S.read(_e, "Math"), "max", [1.2, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "lid"), "a")])]), 7.5)]))
	_S.define(_e, "rx", (7.5 if _S.truth(_S.prop(_S.read(_e, "lid"), "rest")) else _S.read(_e, "w")))
	_S.define(_e, "ry", (1.6 if _S.truth(_S.prop(_S.read(_e, "lid"), "rest")) else _S.read(_e, "h")))
	_S.invoke(_S.read(_e, "p"), "ellipse", [_S.prop(_S.read(_e, "lid"), "x"), _S.binary("-", _S.prop(_S.read(_e, "lid"), "y"), (0.5 if _S.truth(_S.prop(_S.read(_e, "lid"), "rest")) else 0)), _S.binary("+", _S.read(_e, "rx"), 0.8), _S.binary("+", _S.read(_e, "ry"), 0.8), _S.read(_e, "OUTLINE"), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "ellipse", [_S.prop(_S.read(_e, "lid"), "x"), _S.binary("-", _S.prop(_S.read(_e, "lid"), "y"), (0.5 if _S.truth(_S.prop(_S.read(_e, "lid"), "rest")) else 0)), _S.read(_e, "rx"), _S.read(_e, "ry"), _S.function_value(_e, "_f14"), _S.read(_e, "a")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "an", _S.arg(_args, 1))
	return ((_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "an")]), 0)) else _S.prop(_S.read(_e, "C"), 2)) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.65)) else _S.prop(_S.read(_e, "C"), 3))
