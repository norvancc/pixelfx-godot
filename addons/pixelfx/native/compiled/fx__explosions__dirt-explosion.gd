@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/dirt-explosion.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "drawDirt", _S.import_value("fx/explosions/_lib.js", "drawDirt"))
	_S.define(_e, "crater", _S.import_value("fx/explosions/_lib.js", "crater"))
	_S.define(_e, "rock", _S.import_value("fx/explosions/_lib.js", "rock"))
	_S.define(_e, "dome", _S.import_value("fx/explosions/_lib.js", "dome"))
	_S.define(_e, "pool", _S.import_value("fx/explosions/_lib.js", "pool"))
	_S.define(_e, "cull", _S.import_value("fx/explosions/_lib.js", "cull"))
	_S.define(_e, "fadeEdges", _S.import_value("fx/explosions/_lib.js", "fadeEdges"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Dirt explosion"}, {"desc": "A buried charge goes off: a flash under the floor, a V of dirt clods and grit thrown high, a brown dust plume that billows and settles, and a crater left behind."}, {"tags": ["explosion", "dirt", "earth", "dust", "debris", "ground", "one-shot"]}, {"size": [260, 240]}, {"origin": [130, 206]}, {"duration": 3.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1c1610", "#33281c", "#4f3f2c", "#6e5a40", "#927a58", "#b89f78", "#dcc8a2"]}, {"fire": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "E", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "fire"), 8]))
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
	_S.define(_e, "clod", _S.merge([{"light": _S.prop(_S.read(_e, "E"), 5)}, {"body": _S.prop(_S.read(_e, "E"), 3)}, {"shade": _S.prop(_S.read(_e, "E"), 2)}]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "E"), 4), _S.call_value(_S.read(_e, "rgb"), [150, 140, 150]), 0.2]))
	_S.define(_e, "SOIL", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "E"), 3), _S.call_value(_S.read(_e, "rgb"), [90, 80, 90]), 0.2]))
	_S.define(_e, "DARK", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "E"), 2), _S.call_value(_S.read(_e, "rgb"), [60, 52, 60]), 0.3]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 2)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "clods", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "t", 0)
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 10), 56, _S.prop(_S.read(_e, "F"), 4), 0.7, 0.22])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 4), 26, _S.read(_e, "WHITE"), 0.6, 0.06])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 14)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v3, "Math"), "PI")), 2), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 0.7), 0.7])))
		_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [160, 320]))
		_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "SPARK"), 0, _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.invoke(_S.read(_v3, "R"), "range", [0.15, 0.35])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), 300)):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "side", _S.invoke(_S.read(_v5, "R"), "sign", []))
		_S.define(_v5, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v5, "Math"), "PI")), 2), _S.binary("*", _S.read(_v5, "side"), _S.invoke(_S.read(_v5, "R"), "range", [0.05, 0.62]))))
		_S.define(_v5, "sp", _S.binary("*", _S.invoke(_S.read(_v5, "R"), "range", [150, 470]), _S.binary("-", 1, _S.binary("*", 0.3, _S.invoke(_S.read(_v5, "Math"), "abs", [_S.binary("+", _S.read(_v5, "a"), _S.binary("/", _S.prop(_S.read(_v5, "Math"), "PI"), 2))])))))
		_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "GRIT"), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.invoke(_S.read(_v5, "R"), "range", [1.2, 2.2]), _S.invoke(_S.read(_v5, "R"), "pick", [[_S.prop(_S.read(_v5, "E"), 1), _S.prop(_S.read(_v5, "E"), 2), _S.prop(_S.read(_v5, "E"), 2), _S.prop(_S.read(_v5, "E"), 3), _S.prop(_S.read(_v5, "E"), 3), _S.prop(_S.read(_v5, "E"), 4), _S.prop(_S.read(_v5, "E"), 5)]]), (2 if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [0.45])) else 1), _S.invoke(_S.read(_v5, "R"), "range", [0, 0.06])])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 30)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "side", _S.invoke(_S.read(_v7, "R"), "sign", []))
		_S.define(_v7, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v7, "Math"), "PI")), 2), _S.binary("*", _S.read(_v7, "side"), _S.invoke(_S.read(_v7, "R"), "range", [0.1, 0.6]))))
		_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "R"), "range", [200, 430]))
		_S.invoke(_S.read(_v7, "clods"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v7, "B"), "CHUNK")}, {"x": _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 5), 5])}, {"y": _S.unary("-", 2)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp"))}, {"g": 1}, {"drag": 0.35}, {"bounce": 0.25}, {"life": _S.invoke(_S.read(_v7, "R"), "range", [2.2, 3])}, {"a": _S.invoke(_S.read(_v7, "R"), "range", [0, _S.read(_v7, "TAU")])}, {"va": _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 12), 12])}, {"s": (_S.invoke(_S.read(_v7, "R"), "range", [2.6, 3.8]) if _S.truth(_S.binary("<", _S.read(_v7, "i"), 12)) else _S.invoke(_S.read(_v7, "R"), "range", [1.4, 2.4]))}])])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), 22)):
		_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "SMOKE"), _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 7), 7]), _S.unary("-", _S.invoke(_S.read(_v8, "R"), "range", [2, 12])), _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v8, "R"), "range", [70, 180])), _S.invoke(_S.read(_v8, "R"), "range", [1.8, 2.6]), (_S.read(_v8, "SOIL") if _S.truth(_S.invoke(_S.read(_v8, "R"), "chance", [0.6])) else _S.read(_v8, "DUST")), _S.invoke(_S.read(_v8, "R"), "range", [9, 14]), _S.invoke(_S.read(_v8, "R"), "range", [0, 0.14]), _S.prop(_S.read(_v8, "PF"), "BIG")])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), 14)):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "side", _S.invoke(_S.read(_v10, "R"), "sign", []))
		_S.define(_v10, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v10, "Math"), "PI")), 2), _S.binary("*", _S.read(_v10, "side"), _S.invoke(_S.read(_v10, "R"), "range", [0.35, 0.6]))))
		_S.define(_v10, "sp", _S.invoke(_S.read(_v10, "R"), "range", [110, 210]))
		_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "SMOKE"), _S.binary("*", _S.read(_v10, "side"), _S.invoke(_S.read(_v10, "R"), "range", [2, 8])), _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [2, 8])), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.invoke(_S.read(_v10, "R"), "range", [1.6, 2.4]), (_S.read(_v10, "SOIL") if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.5])) else _S.read(_v10, "DUST")), _S.invoke(_S.read(_v10, "R"), "range", [8, 12]), _S.invoke(_S.read(_v10, "R"), "range", [0.02, 0.1]), _S.prop(_S.read(_v10, "PF"), "BIG")])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), 16)):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "s", _S.invoke(_S.read(_v12, "R"), "sign", []))
		_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "SMOKE"), _S.binary("*", _S.read(_v12, "s"), _S.invoke(_S.read(_v12, "R"), "range", [4, 16])), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [1, 5])), _S.binary("*", _S.read(_v12, "s"), _S.invoke(_S.read(_v12, "R"), "range", [70, 200])), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [2, 12])), _S.invoke(_S.read(_v12, "R"), "range", [1.4, 2.2]), _S.read(_v12, "DUST"), _S.invoke(_S.read(_v12, "R"), "range", [6, 9]), _S.invoke(_S.read(_v12, "R"), "range", [0.02, 0.1]), _S.prop(_S.read(_v12, "PF"), "BIG")])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "+=", true)
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), 8)):
		_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "SMOKE"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [2, 8])), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 40), 40]), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [40, 110])), _S.invoke(_S.read(_v13, "R"), "range", [1.2, 1.8]), _S.read(_v13, "DARK"), _S.invoke(_S.read(_v13, "R"), "range", [6, 9]), _S.invoke(_S.read(_v13, "R"), "range", [0, 0.05])])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	return _S.merge([{"update": _S.function_value(_e, "_f2")}, {"drawBack": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v14 in _S.array(_S.prop(_S.read(_e, "clods"), "list")):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "b", _v14)
		_S.set_prop(_S.read(_v15, "b"), "pvy", _S.prop(_S.read(_v15, "b"), "vy"), "=", false)
	_S.invoke(_S.read(_e, "clods"), "update", [_S.read(_e, "dt")])
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v16, "clods"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v16, "i"), 0)):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "b", _S.prop(_S.prop(_S.read(_v17, "clods"), "list"), _S.read(_v17, "i")))
		if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v17, "b"), "x"), _S.binary("+", _S.read(_v17, "X0"), 4)), func(): return _S.binary(">", _S.prop(_S.read(_v17, "b"), "x"), _S.binary("-", _S.read(_v17, "X1"), 4)))):
			var _v18 = _S.scope(_v17)
			_S.invoke(_S.prop(_S.read(_v18, "clods"), "list"), "splice", [_S.read(_v18, "i"), 1])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "-=", true)
			continue
		_S.define(_v17, "landed", _S.logical("||", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v17, "b"), "pvy"), 0), func(): return _S.binary("<=", _S.prop(_S.read(_v17, "b"), "vy"), 0)), func(): return _S.logical("&&", _S.prop(_S.read(_v17, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v17, "b"), "thud")))))
		if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v17, "landed")), func(): return _S.binary("<", _S.prop(_S.read(_v17, "b"), "pvy"), 80))):
			var _v19 = _S.scope(_v17)
			if _S.truth(_S.prop(_S.read(_v19, "b"), "rest")):
				_S.set_prop(_S.read(_v19, "b"), "thud", true, "=", false)
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v17, "b"), "thud", _S.prop(_S.read(_v17, "b"), "rest"), "=", false)
		var _v20 = _S.scope(_v17)
		_S.define(_v20, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "j"), _S.binary("+", 2, _S.invoke(_S.read(_v20, "Math"), "round", [_S.prop(_S.read(_v20, "b"), "s")])))):
			_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v20, "b"), "x"), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 2), 2])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v20, "R"), "sign", []), _S.invoke(_S.read(_v20, "R"), "range", [15, 55])), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [4, 22])), _S.invoke(_S.read(_v20, "R"), "range", [0.35, 0.7]), _S.read(_v20, "DUST"), _S.invoke(_S.read(_v20, "R"), "range", [1.6, _S.binary("+", 1.2, _S.prop(_S.read(_v20, "b"), "s"))])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "j", 1, "+=", true)
		var _v21 = _S.scope(_v17)
		_S.define(_v21, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v21, "j"), _S.invoke(_S.read(_v21, "Math"), "round", [_S.binary("*", _S.prop(_S.read(_v21, "b"), "s"), 3)]))):
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "GRIT"), _S.prop(_S.read(_v21, "b"), "x"), _S.unary("-", 1), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 70), 70]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [40, 140])), _S.invoke(_S.read(_v21, "R"), "range", [0.8, 1.4]), _S.invoke(_S.read(_v21, "R"), "pick", [[_S.prop(_S.read(_v21, "E"), 2), _S.prop(_S.read(_v21, "E"), 3), _S.prop(_S.read(_v21, "E"), 4)]]), 1])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "j", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v17, "b"), "s"), 2.2), func(): return _S.binary(">", _S.prop(_S.read(_v17, "b"), "pvy"), 200))):
			_S.set_prop(_S.read(_v17, "b"), "s", 0.6, "*=", false)
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "Y0"), _S.read(_e, "X1"), _S.read(_e, "Y1")])
	_S.call_value(_S.read(_e, "fadeEdges"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "X1"), 24, _S.read(_e, "Y1")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_E = _S.read(_parent,"E")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_meta = _S.read(_parent,"meta")
	var _n_crater = _S.read(_parent,"crater")
	var _n_band = _S.read(_parent,"band")
	var _n_ps = _S.read(_parent,"ps")
	var _n_drawDirt = _S.read(_parent,"drawDirt")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_crater,[_n_p_b0, _n_E, 0, 28, _S.invoke(_n_ease,"outCubic",[minf(1,(float(_n_t)/0.12))]), (1 - _S.MathFX.smooth((_S.named_value(_n_meta,"duration") - 0.7),(_S.named_value(_n_meta,"duration") - 0.1),_n_t))])
	var _n_k_b1 = (float(_n_t)/0.45)
	if _S.truth((_n_k_b1 < 1)):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (90 * _S.invoke(_n_ease,"outCubic",[_n_k_b1])), 0.16, maxf(1,(3 * (1 - _n_k_b1))), (1.1 - _n_k_b1), [_S.index_value(_n_E,2), _S.index_value(_n_E,4), _S.index_value(_n_E,5), _S.index_value(_n_E,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f4")])
	_S.call_value(_n_drawDirt,[_n_p_b0, _n_ps, "back"])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_ease = _S.read(_parent,"ease")
	var _n_E = _S.read(_parent,"E")
	var _n_band = _S.read(_parent,"band")
	var _n_F = _S.read(_parent,"F")
	var _n_dome = _S.read(_parent,"dome")
	var _n_clod = _S.read(_parent,"clod")
	var _n_rock = _S.read(_parent,"rock")
	var _n_clods = _S.read(_parent,"clods")
	var _n_ps = _S.read(_parent,"ps")
	var _n_drawDirt = _S.read(_parent,"drawDirt")
	var _n_pool = _S.read(_parent,"pool")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = (float(_n_t)/0.45)
	if _S.truth((_n_k_b1 < 1)):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (90 * _S.invoke(_n_ease,"outCubic",[_n_k_b1])), 0.16, maxf(1,(3 * (1 - _n_k_b1))), (1.1 - _n_k_b1), [_S.index_value(_n_E,2), _S.index_value(_n_E,4), _S.index_value(_n_E,5), _S.index_value(_n_E,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f6")])
	if _S.truth((_n_t < 0.09)):
		_S.call_value(_n_dome,[_n_p_b0, _n_F, 0, (15 * (1 - (_n_t * 3))), (1 - (float(_n_t)/0.09))])
	for _iter_0 in _S.array(_S.named_value(_n_clods,"list")):
		var _n_b_b2 = _iter_0
		_S.call_value(_n_rock,[_n_p_b0, _n_b_b2, _n_clod, _n_F])
	_S.call_value(_n_drawDirt,[_n_p_b0, _n_ps, "front"])
	_S.call_value(_n_pool,[_n_p_b0, 0, 1, 60, 10, _S.index_value(_n_F,3), (0.5 * maxf(0,(1 - (float(_n_t)/0.3))))])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null
