@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/grenade.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
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
	_S.define(_e, "fuse", _S.function_value(_e, "_f9"))
	_S.define(_e, "drawGrenade", _S.function_value(_e, "_f10"))
	_S.define(_e, "meta", _S.merge([{"name": "Grenade"}, {"desc": "A grenade is lobbed in, bounces, rolls to a stop with its fuse fizzing, shudders, then blows: a white flash, shrapnel streaks, sparks, a small fireball and a scorch."}, {"tags": ["explosion", "grenade", "shrapnel", "fire", "smoke", "ground", "one-shot"]}, {"size": [300, 200]}, {"origin": [160, 170]}, {"duration": 4.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"body": ["#141a10", "#2c3a1e", "#4a5c30", "#6e8446", "#9ab06a"]}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "BLOW", 1.62)
	_S.define(_e, "RB", 6.2)
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
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "body"), 5]))
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
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 2)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), ["#7d7280"]))
	_S.define(_e, "METAL", [_S.call_value(_S.read(_e, "hex"), ["#3a3c46"]), _S.call_value(_S.read(_e, "hex"), ["#6a6e7c"]), _S.call_value(_S.read(_e, "hex"), ["#a8acb8"])])
	_S.define(_e, "g", _S.merge([{"x": _S.unary("-", 140)}, {"y": _S.unary("-", 70)}, {"vx": 168}, {"vy": _S.unary("-", 150)}, {"a": 0}, {"va": _S.unary("-", 9)}, {"rest": false}]))
	_S.define(_e, "t", 0)
	_S.define(_e, "blown", false)
	_S.define(_e, "bx", 0)
	_S.define(_e, "blast", _S.function_value(_e, "_f2"))
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"drawBack": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.write(_e, "blown", true, "=", false)
	_S.write(_e, "bx", _S.prop(_S.read(_e, "g"), "x"), "=", false)
	_S.define(_e, "y", _S.unary("-", 5))
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "bx"), _S.binary("-", _S.read(_e, "y"), 10), 70, _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 6), 0.45]), 0.85, 0.5])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "bx"), _S.read(_e, "y"), 30, _S.read(_e, "WHITE"), 0.7, 0.07])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 38)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [_S.binary("+", _S.unary("-", _S.prop(_S.read(_v3, "Math"), "PI")), 0.04), _S.unary("-", 0.04)]))
		_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [380, 640]))
		_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "MOTE"), _S.read(_v3, "bx"), _S.read(_v3, "y"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.invoke(_S.read(_v3, "R"), "range", [0.12, 0.26]), _S.invoke(_S.read(_v3, "R"), "pick", [[_S.prop(_S.read(_v3, "F"), 7), _S.prop(_S.read(_v3, "F"), 6), _S.prop(_S.read(_v3, "F"), 5)]]), _S.invoke(_S.read(_v3, "R"), "range", [0.6, 0.9])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), 60)):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "a", _S.invoke(_S.read(_v5, "R"), "range", [0, _S.read(_v5, "TAU")]))
		_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "R"), "range", [140, 360]))
		_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "SPARK"), _S.read(_v5, "bx"), _S.read(_v5, "y"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), 60), _S.invoke(_S.read(_v5, "R"), "range", [0.2, 0.55])])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 4)):
		_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "FIRE"), _S.binary("+", _S.read(_v6, "bx"), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("+", _S.read(_v6, "y"), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 2), 2])), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 15), 15]), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 30), _S.unary("-", 8)]), _S.invoke(_S.read(_v6, "R"), "range", [0.16, 0.26]), 0, _S.invoke(_S.read(_v6, "R"), "range", [6, 8])])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	var _v7 = _S.scope(_e)
	_S.define(_v7, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "i"), 16)):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "a", _S.invoke(_S.read(_v8, "R"), "range", [_S.binary("-", _S.unary("-", _S.prop(_S.read(_v8, "Math"), "PI")), 0.2), 0.2]))
		_S.define(_v8, "d", _S.invoke(_S.read(_v8, "R"), "range", [0, 6]))
		_S.define(_v8, "sp", _S.invoke(_S.read(_v8, "R"), "range", [40, 150]))
		_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "FIRE"), _S.binary("+", _S.read(_v8, "bx"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "d"))), _S.binary("+", _S.read(_v8, "y"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "d"))), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), 0.8), 30), _S.invoke(_S.read(_v8, "R"), "range", [0.45, 0.9]), 0, _S.invoke(_S.read(_v8, "R"), "range", [3.5, 7]), 0, (_S.prop(_S.read(_v8, "PF"), "SMOKES") if _S.truth(_S.invoke(_S.read(_v8, "R"), "chance", [0.5])) else 0)])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "i", 1, "+=", true)
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), 9)):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "a", _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v10, "Math"), "PI")), 0]))
		_S.define(_v10, "d", _S.invoke(_S.read(_v10, "R"), "range", [2, 10]))
		_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "SMOKE"), _S.binary("+", _S.read(_v10, "bx"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "d"))), _S.binary("+", _S.read(_v10, "y"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "d"))), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), 25), _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [20, 60])), _S.invoke(_S.read(_v10, "R"), "range", [1.4, 2.1]), 0, _S.invoke(_S.read(_v10, "R"), "range", [6, 10]), _S.invoke(_S.read(_v10, "R"), "range", [0.05, 0.3]), _S.prop(_S.read(_v10, "PF"), "BIG")])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), 30)):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "a", _S.invoke(_S.read(_v12, "R"), "range", [0, _S.read(_v12, "TAU")]))
		_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "R"), "range", [30, 120]))
		_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "EMBER"), _S.read(_v12, "bx"), _S.read(_v12, "y"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), 50), _S.invoke(_S.read(_v12, "R"), "range", [0.8, 1.8]), _S.prop(_S.read(_v12, "F"), 3)])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "+=", true)
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), 12)):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "a", _S.invoke(_S.read(_v14, "R"), "range", [_S.binary("+", _S.unary("-", _S.prop(_S.read(_v14, "Math"), "PI")), 0.2), _S.unary("-", 0.2)]))
		_S.define(_v14, "sp", _S.invoke(_S.read(_v14, "R"), "range", [150, 330]))
		_S.invoke(_S.read(_v14, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v14, "B"), "SHARD")}, {"x": _S.read(_v14, "bx")}, {"y": _S.read(_v14, "y")}, {"vx": _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "sp"))}, {"g": 1}, {"drag": 0.5}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v14, "R"), "range", [1.4, 2.1])}, {"a": _S.invoke(_S.read(_v14, "R"), "range", [0, _S.read(_v14, "TAU")])}, {"va": _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 24), 24])}, {"s": _S.invoke(_S.read(_v14, "R"), "range", [2, 3.5])}, {"c": _S.invoke(_S.read(_v14, "R"), "pick", [_S.read(_v14, "METAL")])}])])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	var _v15 = _S.scope(_e)
	_S.define(_v15, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v15, "i"), 70)):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "u", _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 1), 1]))
		_S.define(_v16, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v16, "Math"), "PI")), 2), _S.binary("*", _S.read(_v16, "u"), 0.8)))
		_S.define(_v16, "sp", _S.binary("*", _S.invoke(_S.read(_v16, "R"), "range", [100, 300]), _S.binary("-", 1, _S.binary("*", 0.4, _S.invoke(_S.read(_v16, "Math"), "abs", [_S.read(_v16, "u")])))))
		_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "GRIT"), _S.binary("+", _S.read(_v16, "bx"), _S.binary("*", _S.read(_v16, "u"), 4)), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.read(_v16, "sp")), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.read(_v16, "sp")), _S.invoke(_S.read(_v16, "R"), "range", [1, 1.8]), _S.invoke(_S.read(_v16, "R"), "pick", [[_S.call_value(_S.read(_v16, "hex"), ["#5a4f6b"]), _S.call_value(_S.read(_v16, "hex"), ["#3e3650"]), _S.call_value(_S.read(_v16, "hex"), ["#776c88"])]]), (2 if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.35])) else 1)])
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "i", 1, "+=", true)
	var _v17 = _S.scope(_e)
	_S.define(_v17, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v17, "i"), 10)):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "s", _S.invoke(_S.read(_v18, "R"), "sign", []))
		_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "SMOKE"), _S.binary("+", _S.read(_v18, "bx"), _S.binary("*", _S.read(_v18, "s"), _S.invoke(_S.read(_v18, "R"), "range", [0, 6]))), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [1, 4])), _S.binary("*", _S.read(_v18, "s"), _S.invoke(_S.read(_v18, "R"), "range", [60, 180])), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [2, 10])), _S.invoke(_S.read(_v18, "R"), "range", [1, 1.7]), _S.read(_v18, "DUST"), _S.invoke(_S.read(_v18, "R"), "range", [5, 8]), _S.invoke(_S.read(_v18, "R"), "range", [0, 0.05]), _S.prop(_S.read(_v18, "PF"), "BIG")])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "i", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.unary("!", _S.read(_e, "blown"))):
		var _v19 = _S.scope(_e)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v19, "g"), "rest"))):
			var _v20 = _S.scope(_v19)
			_S.set_prop(_S.read(_v20, "g"), "vy", _S.binary("*", 900, _S.read(_v20, "dt")), "+=", false)
			_S.set_prop(_S.read(_v20, "g"), "x", _S.binary("*", _S.prop(_S.read(_v20, "g"), "vx"), _S.read(_v20, "dt")), "+=", false)
			_S.set_prop(_S.read(_v20, "g"), "y", _S.binary("*", _S.prop(_S.read(_v20, "g"), "vy"), _S.read(_v20, "dt")), "+=", false)
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v20, "g"), "y"), _S.unary("-", _S.read(_v20, "RB"))), func(): return _S.binary(">", _S.prop(_S.read(_v20, "g"), "vy"), 0))):
				var _v21 = _S.scope(_v20)
				_S.set_prop(_S.read(_v21, "g"), "y", _S.unary("-", _S.read(_v21, "RB")), "=", false)
				if _S.truth(_S.binary(">", _S.prop(_S.read(_v21, "g"), "vy"), 90)):
					var _v22 = _S.scope(_v21)
					var _v23 = _S.scope(_v22)
					_S.define(_v23, "i", 0)
					while _S.truth(_S.binary("<", _S.read(_v23, "i"), 4)):
						_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v23, "g"), "x"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 2), 2])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v23, "R"), "sign", []), _S.invoke(_S.read(_v23, "R"), "range", [10, 40])), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [4, 16])), _S.invoke(_S.read(_v23, "R"), "range", [0.3, 0.6]), _S.read(_v23, "DUST"), _S.invoke(_S.read(_v23, "R"), "range", [1.5, 2.6])])
						_v23 = _S.iteration(_v23)
						_S.write(_v23, "i", 1, "+=", true)
					var _v24 = _S.scope(_v22)
					_S.define(_v24, "i", 0)
					while _S.truth(_S.binary("<", _S.read(_v24, "i"), 3)):
						_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "SPARK"), _S.prop(_S.read(_v24, "g"), "x"), _S.unary("-", 1), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 60), 60]), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [40, 120])), _S.invoke(_S.read(_v24, "R"), "range", [0.08, 0.16])])
						_v24 = _S.iteration(_v24)
						_S.write(_v24, "i", 1, "+=", true)
					_S.set_prop(_S.read(_v22, "g"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v22, "g"), "vy")), 0.36), "=", false)
					_S.set_prop(_S.read(_v22, "g"), "vx", 0.8, "*=", false)
				else:
					_S.set_prop(_S.read(_v21, "g"), "vy", 0, "=", false)
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v20, "g"), "y"), _S.binary("-", _S.unary("-", _S.read(_v20, "RB")), 0.01)), func(): return _S.binary("===", _S.prop(_S.read(_v20, "g"), "vy"), 0))):
				var _v25 = _S.scope(_v20)
				_S.set_prop(_S.read(_v25, "g"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v25, "g"), "vx"), 2.4), _S.read(_v25, "dt")), "-=", false)
				_S.set_prop(_S.read(_v25, "g"), "va", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v25, "g"), "vx")), _S.read(_v25, "RB")), "=", false)
				if _S.truth(_S.binary("<", _S.invoke(_S.read(_v25, "Math"), "abs", [_S.prop(_S.read(_v25, "g"), "vx")]), 3)):
					_S.last([_S.set_prop(_S.read(_v25, "g"), "rest", true, "=", false), _S.set_prop(_S.read(_v25, "g"), "vx", 0, "=", false)])
			_S.set_prop(_S.read(_v20, "g"), "a", _S.binary("*", _S.prop(_S.read(_v20, "g"), "va"), _S.read(_v20, "dt")), "+=", false)
		_S.define(_v19, "tip", _S.call_value(_S.read(_v19, "fuse"), [_S.read(_v19, "g")]))
		_S.define(_v19, "hurry", _S.call_value(_S.read(_v19, "smooth"), [_S.binary("-", _S.read(_v19, "BLOW"), 0.5), _S.read(_v19, "BLOW"), _S.read(_v19, "t")]))
		if _S.truth(_S.invoke(_S.read(_v19, "R"), "chance", [_S.binary("*", _S.binary("+", 24, _S.binary("*", 50, _S.read(_v19, "hurry"))), _S.read(_v19, "dt"))])):
			_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "SPARK"), _S.prop(_S.read(_v19, "tip"), 0), _S.prop(_S.read(_v19, "tip"), 1), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 50), 50]), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [30, 110])), _S.invoke(_S.read(_v19, "R"), "range", [0.08, 0.2])])
		if _S.truth(_S.invoke(_S.read(_v19, "R"), "chance", [_S.binary("*", 9, _S.read(_v19, "dt"))])):
			_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "VAPOUR"), _S.prop(_S.read(_v19, "tip"), 0), _S.binary("-", _S.prop(_S.read(_v19, "tip"), 1), 1), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [10, 20])), _S.invoke(_S.read(_v19, "R"), "range", [0.5, 0.9]), _S.call_value(_S.read(_v19, "hex"), ["#8a8494"]), _S.invoke(_S.read(_v19, "R"), "range", [1.2, 2])])
		if _S.truth(_S.binary(">=", _S.read(_v19, "t"), _S.read(_v19, "BLOW"))):
			_S.call_value(_S.read(_v19, "blast"), [])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	var _v26 = _S.scope(_e)
	_S.define(_v26, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v26, "bits"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v26, "i"), 0)):
		if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.prop(_S.prop(_S.prop(_S.read(_v26, "bits"), "list"), _S.read(_v26, "i")), "x"), _S.binary("+", _S.read(_v26, "X0"), 3)), func(): return _S.binary(">", _S.prop(_S.prop(_S.prop(_S.read(_v26, "bits"), "list"), _S.read(_v26, "i")), "x"), _S.binary("-", _S.read(_v26, "X1"), 3))), func(): return _S.binary("<", _S.prop(_S.prop(_S.prop(_S.read(_v26, "bits"), "list"), _S.read(_v26, "i")), "y"), _S.binary("+", _S.read(_v26, "Y0"), 3)))):
			_S.invoke(_S.prop(_S.read(_v26, "bits"), "list"), "splice", [_S.read(_v26, "i"), 1])
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "Y0"), _S.read(_e, "X1"), _S.read(_e, "Y1")])
	_S.call_value(_S.read(_e, "fadeEdges"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "X1"), 24, _S.read(_e, "Y1")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_blown = _S.read(_parent,"blown")
	var _n_t = _S.read(_parent,"t")
	var _n_BLOW = _S.read(_parent,"BLOW")
	var _n_HR = _S.read(_parent,"HR")
	var _n_meta = _S.read(_parent,"meta")
	var _n_scorch = _S.read(_parent,"scorch")
	var _n_bx = _S.read(_parent,"bx")
	var _n_ease = _S.read(_parent,"ease")
	var _n_hex = _S.read(_parent,"hex")
	var _n_F = _S.read(_parent,"F")
	var _n_band = _S.read(_parent,"band")
	var _n_ps = _S.read(_parent,"ps")
	var _n_FR = _S.read(_parent,"FR")
	var _n_drawPs = _S.read(_parent,"drawPs")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth(_n_blown):
		var _n_u_b1 = (_n_t - _n_BLOW)
		_S.call_value(_n_scorch,[_n_p_b0, _n_HR, _n_u_b1, 22, 1.6, (1 - _S.MathFX.smooth(((_S.named_value(_n_meta,"duration") - _n_BLOW) - 0.8),((_S.named_value(_n_meta,"duration") - _n_BLOW) - 0.15),_n_u_b1)), 2])
		var _n_k_b2 = (float(_n_u_b1)/0.4)
		if _S.truth((_n_k_b2 < 1)):
			_S.call_value(_n_band,[_n_p_b0, _n_bx, 0.5, (70 * _S.invoke(_n_ease,"outCubic",[_n_k_b2])), 0.16, maxf(1,(3.5 * (1 - _n_k_b2))), (1.15 - _n_k_b2), [_S.call_value(_n_hex,["#4a3f69"]), _S.call_value(_n_hex,["#6e6390"]), _S.index_value(_n_F,3), _S.index_value(_n_F,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f5")])
	_S.call_value(_n_drawPs,[_n_p_b0, _n_ps, "back", _n_FR])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_g2_b0 = _S.arg(_args,0)
	return (sin(_n_g2_b0) < 0)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.unary("!", _S.read(_e, "blown"))):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "shake", _S.call_value(_S.read(_v28, "smooth"), [_S.binary("-", _S.read(_v28, "BLOW"), 0.45), _S.read(_v28, "BLOW"), _S.read(_v28, "t")]))
		_S.define(_v28, "jx", _S.binary("*", _S.binary("*", _S.read(_v28, "shake"), _S.invoke(_S.read(_v28, "Math"), "sin", [_S.binary("*", _S.read(_v28, "t"), 90)])), 0.8))
		_S.call_value(_S.read(_v28, "drawGrenade"), [_S.read(_v28, "p"), _S.read(_v28, "G"), _S.binary("+", _S.prop(_S.read(_v28, "g"), "x"), _S.read(_v28, "jx")), _S.prop(_S.read(_v28, "g"), "y"), _S.prop(_S.read(_v28, "g"), "a")])
		_S.define(_v28, "tip", _S.call_value(_S.read(_v28, "fuse"), [_S.merge([_S.read(_v28, "g"), {"x": _S.binary("+", _S.prop(_S.read(_v28, "g"), "x"), _S.read(_v28, "jx"))}])]))
		_S.invoke(_S.read(_v28, "p"), "px", [_S.prop(_S.read(_v28, "tip"), 0), _S.prop(_S.read(_v28, "tip"), 1), (_S.prop(_S.read(_v28, "F"), 6) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v28, "Math"), "sin", [_S.binary("*", _S.read(_v28, "t"), 50)]), 0)) else _S.prop(_S.read(_v28, "F"), 5))])
		_S.invoke(_S.read(_v28, "p"), "glow", [_S.prop(_S.read(_v28, "tip"), 0), _S.prop(_S.read(_v28, "tip"), 1), _S.binary("+", 6, _S.binary("*", 3, _S.read(_v28, "shake"))), _S.prop(_S.read(_v28, "F"), 4), _S.binary("+", 0.5, _S.binary("*", 0.3, _S.invoke(_S.read(_v28, "Math"), "sin", [_S.binary("*", _S.read(_v28, "t"), 37)])))])
	else:
		var _v29 = _S.scope(_e)
		_S.define(_v29, "u", _S.binary("-", _S.read(_v29, "t"), _S.read(_v29, "BLOW")))
		_S.define(_v29, "k", _S.binary("/", _S.read(_v29, "u"), 0.4))
		if _S.truth(_S.binary("<", _S.read(_v29, "k"), 1)):
			_S.call_value(_S.read(_v29, "band"), [_S.read(_v29, "p"), _S.read(_v29, "bx"), 0.5, _S.binary("*", 70, _S.invoke(_S.read(_v29, "ease"), "outCubic", [_S.read(_v29, "k")])), 0.16, _S.invoke(_S.read(_v29, "Math"), "max", [1, _S.binary("*", 3.5, _S.binary("-", 1, _S.read(_v29, "k")))]), _S.binary("-", 1.15, _S.read(_v29, "k")), [_S.call_value(_S.read(_v29, "hex"), ["#4a3f69"]), _S.call_value(_S.read(_v29, "hex"), ["#6e6390"]), _S.prop(_S.read(_v29, "F"), 3), _S.prop(_S.read(_v29, "F"), 6)], _S.function_value(_v29, "_f7")])
	_S.invoke(_S.read(_e, "bits"), "draw", [_S.read(_e, "p")])
	_S.call_value(_S.read(_e, "drawPs"), [_S.read(_e, "p"), _S.read(_e, "ps"), "front", _S.read(_e, "FR")])
	if _S.truth(_S.read(_e, "blown")):
		var _v30 = _S.scope(_e)
		_S.define(_v30, "u", _S.binary("-", _S.read(_v30, "t"), _S.read(_v30, "BLOW")))
		if _S.truth(_S.binary("<", _S.read(_v30, "u"), 0.07)):
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "k2", _S.binary("-", 1, _S.binary("/", _S.read(_v31, "u"), 0.07)))
			_S.define(_v31, "r", _S.binary("*", 11, _S.binary("+", 0.8, _S.binary("*", 0.2, _S.read(_v31, "k2")))))
			_S.invoke(_S.read(_v31, "p"), "circle", [_S.read(_v31, "bx"), _S.unary("-", 6), _S.binary("+", _S.read(_v31, "r"), 1.2), _S.prop(_S.read(_v31, "F"), 2)])
			_S.invoke(_S.read(_v31, "p"), "circle", [_S.read(_v31, "bx"), _S.unary("-", 6), _S.read(_v31, "r"), (_S.prop(_S.read(_v31, "F"), 6) if _S.truth(_S.binary(">", _S.read(_v31, "k2"), 0.45)) else _S.prop(_S.read(_v31, "F"), 5))])
			_S.invoke(_S.read(_v31, "p"), "circle", [_S.read(_v31, "bx"), _S.unary("-", 6), _S.binary("*", _S.read(_v31, "r"), 0.6), (_S.read(_v31, "WHITE") if _S.truth(_S.binary(">", _S.read(_v31, "k2"), 0.45)) else _S.prop(_S.read(_v31, "F"), 6))])
		if _S.truth(_S.binary("<", _S.read(_v30, "u"), 0.2)):
			_S.call_value(_S.read(_v30, "flare"), [_S.read(_v30, "p"), _S.read(_v30, "bx"), _S.unary("-", 6), _S.binary("*", 40, _S.invoke(_S.read(_v30, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.read(_v30, "u"), 0.2)), 1.4])), _S.binary("-", 1, _S.binary("/", _S.read(_v30, "u"), 0.2)), _S.read(_v30, "F")])
		if _S.truth(_S.binary("<", _S.read(_v30, "u"), 0.3)):
			var _v32 = _S.scope(_v30)
			_S.define(_v32, "k3", _S.binary("/", _S.read(_v32, "u"), 0.3))
			_S.define(_v32, "e", _S.binary("-", 1, _S.invoke(_S.read(_v32, "Math"), "pow", [_S.binary("-", 1, _S.read(_v32, "k3")), 3])))
			_S.define(_v32, "r", _S.binary("+", 8, _S.binary("*", 40, _S.read(_v32, "e"))))
			_S.invoke(_S.read(_v32, "p"), "ring", [_S.read(_v32, "bx"), _S.unary("-", 6), _S.read(_v32, "r"), _S.invoke(_S.read(_v32, "Math"), "max", [1, _S.binary("+", _S.binary("*", 2.5, _S.binary("-", 1, _S.read(_v32, "k3"))), 0.4)]), _S.prop(_S.read(_v32, "F"), 5), _S.function_value(_v32, "_f8")])
		_S.call_value(_S.read(_v30, "pool"), [_S.read(_v30, "p"), _S.read(_v30, "bx"), 1, 70, 12, _S.prop(_S.read(_v30, "F"), 3), _S.binary("*", 0.55, _S.invoke(_S.read(_v30, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.read(_v30, "u"), 0.6))]))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g2_b0 = _S.arg(_args,0)
	return (sin(_n_g2_b0) >= 0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_r = _S.read(_parent,"r")
	var _n_k3 = _S.read(_parent,"k3")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_an_b1 = _S.arg(_args,1)
	return (0 if _S.truth(((sin(_n_an_b1) * _n_r) > 9)) else minf(1,((1 - _n_k3) * 1.6)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	var _n_ca_b1 = cos(_S.named_value(_n_g_b0,"a"))
	var _n_sa_b2 = sin(_S.named_value(_n_g_b0,"a"))
	return [(_S.named_value(_n_g_b0,"x") + (_n_sa_b2 * 10.4)), (_S.named_value(_n_g_b0,"y") - (_n_ca_b1 * 10.4))]
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_G_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_a_b4 = _S.arg(_args,4)
	var _n_ca_b5 = cos(_n_a_b4)
	var _n_sa_b6 = sin(_n_a_b4)
	var _n_M_b7 = [_S.call_value(_n_hex,["#2a2c36"]), _S.call_value(_n_hex,["#5e6270"]), _S.call_value(_n_hex,["#9a9eac"]), _S.call_value(_n_hex,["#d0d4de"])]
	_S.invoke(_n_p_b0,"shade",[(_n_x_b2 - 13), (_n_y_b3 - 13), (_n_x_b2 + 13), (_n_y_b3 + 13), _S.function_value(_S.capture(_parent,{"x":_n_x_b2,"y":_n_y_b3,"ca":_n_ca_b5,"sa":_n_sa_b6,"M":_n_M_b7,"G":_n_G_b1,"this":_this}),"_f11")])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_M = _S.read(_parent,"M")
	var _n_OUTLINE = _S.read(_parent,"OUTLINE")
	var _n_G = _S.read(_parent,"G")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (_n_px_b0 - _n_x)
	var _n_dy_b3 = (_n_py_b1 - _n_y)
	var _n_u_b4 = ((_n_dx_b2 * _n_ca) + (_n_dy_b3 * _n_sa))
	var _n_v_b5 = (((-_n_dx_b2) * _n_sa) + (_n_dy_b3 * _n_ca))
	if _S.truth(((absf(_n_u_b4) < 2.4) if _S.truth(((_n_v_b5 > (-10.2)) if _S.truth((_n_v_b5 < (-5))) else (_n_v_b5 < (-5)))) else ((_n_v_b5 > (-10.2)) if _S.truth((_n_v_b5 < (-5))) else (_n_v_b5 < (-5))))):
		return (_S.index_value(_n_M,0) if _S.truth(((_n_v_b5 < (-9.4)) if _S.truth((_n_v_b5 < (-9.4))) else (absf(_n_u_b4) > 1.7))) else (_S.index_value(_n_M,3) if _S.truth((_n_u_b4 < (-0.6))) else _S.index_value(_n_M,2)))
	if _S.truth(_S.logical("&&",(_S.Bridge.hypot([(_n_u_b4 + 3.4), (_n_v_b5 + 8)]) < 1.9),func():return (_S.Bridge.hypot([(_n_u_b4 + 3.4), (_n_v_b5 + 8)]) > 0.9))):
		return _S.index_value(_n_M,2)
	if _S.truth(((_n_v_b5 < 2) if _S.truth(((_n_v_b5 > (-8.6)) if _S.truth(((_n_u_b4 < 3.6) if _S.truth((_n_u_b4 > 2.2)) else (_n_u_b4 > 2.2))) else ((_n_u_b4 < 3.6) if _S.truth((_n_u_b4 > 2.2)) else (_n_u_b4 > 2.2)))) else ((_n_v_b5 > (-8.6)) if _S.truth(((_n_u_b4 < 3.6) if _S.truth((_n_u_b4 > 2.2)) else (_n_u_b4 > 2.2))) else ((_n_u_b4 < 3.6) if _S.truth((_n_u_b4 > 2.2)) else (_n_u_b4 > 2.2))))):
		return (_S.index_value(_n_M,0) if _S.truth((_n_u_b4 > 3)) else _S.index_value(_n_M,1))
	var _n_e_b6 = (pow((float(_n_u_b4)/5.1),2) + pow((float((_n_v_b5 - 0.6))/6.4),2))
	if _S.truth((_n_e_b6 > 1.2)):
		return null
	if _S.truth((_n_e_b6 > 1)):
		return _n_OUTLINE
	var _n_lit_b7 = (float((-((_n_dx_b2 * 0.6) + (_n_dy_b3 * 0.8))))/6)
	var _n_gv_b8 = (absf((fmod((_n_v_b5 + 30),3.1) - 1.55)) < 0.45)
	var _n_gu_b9 = (absf((fmod((_n_u_b4 + 30),3.4) - 1.7)) < 0.45)
	var _n_i_b10 = maxf(0,minf(4,floori((((2 + (_n_lit_b7 * 1.7)) - (1 if _S.truth((_n_gv_b8 if _S.truth(_n_gv_b8) else _n_gu_b9)) else 0)) + (1 if _S.truth(((_n_lit_b7 > 0.3) if _S.truth((_n_e_b6 < 0.3)) else (_n_e_b6 < 0.3))) else 0))+0.5)))
	return _S.index_value(_n_G,_n_i_b10)
	return null
