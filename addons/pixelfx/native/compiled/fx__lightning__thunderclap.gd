@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/thunderclap.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "scorch", _S.import_value("fx/lightning/_lib.js", "scorch"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Thunderclap"}, {"desc": "A thunderclap round the caster: a white flash, forked bolts burst out and stab the floor, a heavy shock ring tears across the ground raising dust and grit, sparks streak away."}, {"tags": ["lightning", "electric", "nova", "aoe", "spell", "shockwave", "one-shot"]}, {"size": [288, 156]}, {"origin": [144, 124]}, {"duration": 1.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"reach": 104}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "WIDE", _S.merge([{"turn": 1.15}, {"crouch": 5}, {"lean": _S.unary("-", 1)}, {"fx": _S.unary("-", 15)}, {"fy": _S.unary("-", 33)}, {"bx": 15}, {"by": _S.unary("-", 33)}, {"ffx": _S.unary("-", 7)}, {"fbx": 8}]))
	_S.define(_e, "CLAP_", _S.merge([{"turn": 1.15}, {"y": _S.unary("-", 2)}, {"crouch": 0}, {"fx": _S.unary("-", 1)}, {"fy": _S.unary("-", 45)}, {"bx": 1}, {"by": _S.unary("-", 45)}, {"ffx": _S.unary("-", 3)}, {"ffy": _S.unary("-", 5)}, {"fbx": 4}, {"fby": _S.unary("-", 5)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"target": _S.merge([{"x": 104}])}, {"poses": [[_S.unary("-", 0.46), _S.read(_e, "READY")], [_S.unary("-", 0.18), _S.read(_e, "WIDE")], [0.08, _S.merge([_S.read(_e, "WIDE"), {"crouch": 6}])], [0.12, _S.read(_e, "CLAP_"), "snap"], [0.55, _S.merge([_S.read(_e, "CLAP_"), {"y": 0}, {"ffy": _S.unary("-", 4)}, {"fby": _S.unary("-", 4)}, {"crouch": 1}])], [1.05, _S.merge([{"turn": 1}, {"crouch": 3}, {"fx": _S.unary("-", 10)}, {"fy": _S.unary("-", 28)}, {"bx": 11}, {"by": _S.unary("-", 28)}, {"ffx": _S.unary("-", 4)}, {"fbx": 5}])], [1.7, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": 0.12}, {"stop": 0.13}, {"shake": 0.3}, {"amp": 3}, {"target": false}]), _S.merge([{"t": 0.42}, {"push": 2}, {"straw": 14}, {"y": _S.unary("-", 8)}, {"skin": "shock"}, {"shiver": 0.5}]), _S.merge([{"t": 1.2}, {"push": 0}, {"straw": 0}, {"flash": 0}, {"skin": null}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "CLAP", 0.12)
	_S.define(_e, "CY", _S.unary("-", 22))
	_S.define(_e, "BK", [1, 0.7, 0.95, 0.5, 0.8, 0.3])
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), ["#6e6382"]))
	_S.define(_e, "STONE", _S.invoke(["#655b7a", "#4a4263", "#342d45"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "ASH", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "REACH", _S.prop(_S.read(_e, "o"), "reach"))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "hot", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "bolts", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 8}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "front", _S.function_value(_e, "_f3"))
	_S.define(_e, "t", 0)
	_S.define(_e, "clapped", false)
	_S.define(_e, "landed", _S.invoke(_S.read(_e, "bolts"), "map", [_S.function_value(_e, "_f4")]))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "down", _S.binary("===", _S.binary("%", _S.read(_e, "i"), 2), 0))
	_S.define(_e, "side", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.binary("%", _S.read(_e, "i"), 4), 2)) else 1))
	_S.define(_e, "a", ((_S.invoke(_S.read(_e, "R"), "range", [0.35, 0.75]) if _S.truth(_S.binary(">", _S.read(_e, "side"), 0)) else _S.binary("-", _S.prop(_S.read(_e, "Math"), "PI"), _S.invoke(_S.read(_e, "R"), "range", [0.35, 0.75]))) if _S.truth(_S.read(_e, "down")) else (_S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [0.15, 1.2])) if _S.truth(_S.binary(">", _S.read(_e, "side"), 0)) else _S.binary("+", _S.prop(_S.read(_e, "Math"), "PI"), _S.invoke(_S.read(_e, "R"), "range", [0.15, 1.2])))))
	_S.define(_e, "L", (_S.binary("/", _S.unary("-", _S.read(_e, "CY")), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")])) if _S.truth(_S.read(_e, "down")) else _S.invoke(_S.read(_e, "R"), "range", [40, 62])))
	_S.define(_e, "x1", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "L")))
	_S.define(_e, "y1", (0 if _S.truth(_S.read(_e, "down")) else _S.binary("+", _S.read(_e, "CY"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "L")))))
	return _S.merge([{"down": _S.read(_e, "down")}, {"x1": _S.read(_e, "x1")}, {"y1": _S.read(_e, "y1")}, {"t0": _S.binary("+", _S.read(_e, "CLAP"), _S.invoke(_S.read(_e, "R"), "range", [0, 0.06]))}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CLAP"))) else _S.binary("+", 8, _S.binary("*", _S.binary("-", _S.read(_e, "REACH"), 8), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CLAP")), 0.5)])]))))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return false

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "CLAP")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 60, _S.read(_e, "dt"))]))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "a", _S.invoke(_S.read(_v0, "R"), "range", [0, _S.read(_v0, "TAU")]))
		_S.define(_v0, "d", _S.invoke(_S.read(_v0, "R"), "range", [16, 30]))
		_S.define(_v0, "T", _S.invoke(_S.read(_v0, "R"), "range", [0.07, 0.1]))
		_S.define(_v0, "v", _S.binary("/", _S.binary("*", _S.read(_v0, "d"), 3), _S.binary("-", _S.invoke(_S.read(_v0, "Math"), "exp", [_S.binary("*", 3, _S.read(_v0, "T"))]), 1)))
		_S.invoke(_S.read(_v0, "ps"), "spawn", [_S.prop(_S.read(_v0, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "cos", [_S.read(_v0, "a")]), _S.read(_v0, "d")), _S.binary("+", _S.read(_v0, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "sin", [_S.read(_v0, "a")]), _S.read(_v0, "d")), 0.8)), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v0, "Math"), "cos", [_S.read(_v0, "a")])), _S.read(_v0, "v")), _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v0, "Math"), "sin", [_S.read(_v0, "a")])), _S.read(_v0, "v")), 0.8), _S.read(_v0, "T"), (_S.prop(_S.read(_v0, "C"), 6) if _S.truth(_S.invoke(_S.read(_v0, "R"), "chance", [0.5])) else _S.prop(_S.read(_v0, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CLAP")), func(): return _S.unary("!", _S.read(_e, "clapped")))):
		var _v1 = _S.scope(_e)
		_S.write(_v1, "clapped", true, "=", false)
		_S.invoke(_S.read(_v1, "lights"), "add", [0, _S.binary("-", _S.read(_v1, "CY"), 10), 100, _S.prop(_S.read(_v1, "C"), 4), 0.65, 0.45])
		_S.invoke(_S.read(_v1, "lights"), "add", [0, _S.read(_v1, "CY"), 26, _S.read(_v1, "WHITE"), 0.5, 0.07])
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v2, "i"), 64)):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
			_S.define(_v3, "sp", _S.binary("*", _S.invoke(_S.read(_v3, "R"), "range", [170, 380]), (0.5 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), 0.4)) else 1)))
			_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), 6), _S.binary("+", _S.read(_v3, "CY"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), 6)), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), 40), _S.invoke(_S.read(_v3, "R"), "range", [0.2, 0.55])])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "+=", true)
		var _v4 = _S.scope(_v1)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), 8)):
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "SMOKE"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 8), 8]), _S.binary("+", _S.read(_v4, "CY"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 6), 6])), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v4, "R"), "range", [10, 30])), _S.invoke(_S.read(_v4, "R"), "range", [0.8, 1.3]), _S.call_value(_S.read(_v4, "mix"), [_S.read(_v4, "ASH"), _S.prop(_S.read(_v4, "C"), 4), 0.3]), _S.invoke(_S.read(_v4, "R"), "range", [4, 7]), _S.invoke(_S.read(_v4, "R"), "range", [0.05, 0.2])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
	for _v5 in _S.array(_S.invoke(_S.read(_e, "bolts"), "entries", [])):
		var _v6 = _S.scope(_e)
		var _v7 = _v5
		_S.define(_v6, "i", _S.prop(_v7, 0))
		_S.define(_v6, "b", _S.prop(_v7, 1))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v6, "b"), "down"), func(): return _S.unary("!", _S.prop(_S.read(_v6, "landed"), _S.read(_v6, "i")))), func(): return _S.binary(">=", _S.read(_v6, "t"), _S.prop(_S.read(_v6, "b"), "t0")))):
			var _v8 = _S.scope(_v6)
			_S.set_prop(_S.read(_v8, "landed"), _S.read(_v8, "i"), true, "=", false)
			_S.invoke(_S.read(_v8, "lights"), "add", [_S.prop(_S.read(_v8, "b"), "x1"), _S.unary("-", 4), 46, _S.prop(_S.read(_v8, "C"), 4), 0.7, 0.25])
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v9, "j"), 12)):
				var _v10 = _S.scope(_v9)
				_S.define(_v10, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v10, "Math"), "PI")), 2), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 1.2), 1.2])))
				_S.define(_v10, "sp", _S.invoke(_S.read(_v10, "R"), "range", [70, 240]))
				_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "SPARK"), _S.prop(_S.read(_v10, "b"), "x1"), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.invoke(_S.read(_v10, "R"), "range", [0.2, 0.5])])
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "j", 1, "+=", true)
			var _v11 = _S.scope(_v8)
			_S.define(_v11, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v11, "j"), 5)):
				_S.invoke(_S.read(_v11, "hot"), "spawn", [_S.prop(_S.read(_v11, "P"), "SPARK"), _S.binary("+", _S.prop(_S.read(_v11, "b"), "x1"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 2), 2])), _S.unary("-", 1), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 80), 80]), _S.unary("-", _S.invoke(_S.read(_v11, "R"), "range", [60, 180])), _S.invoke(_S.read(_v11, "R"), "range", [0.4, 0.8])])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "j", 1, "+=", true)
	_S.define(_e, "fr", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "CLAP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CLAP"), 0.5)))):
		for _v12 in _S.array([_S.unary("-", 1), 1]):
			var _v13 = _S.scope(_e)
			_S.define(_v13, "s", _v12)
			var _v14 = _S.scope(_v13)
			if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [_S.binary("*", 70, _S.read(_v14, "dt"))])):
				_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "SMOKE"), _S.binary("+", _S.binary("*", _S.read(_v14, "s"), _S.read(_v14, "fr")), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 3), 3])), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [1, 4])), _S.binary("*", _S.read(_v14, "s"), _S.invoke(_S.read(_v14, "R"), "range", [10, 40])), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [5, 20])), _S.invoke(_S.read(_v14, "R"), "range", [0.6, 1.1]), _S.read(_v14, "DUST"), _S.binary("*", _S.invoke(_S.read(_v14, "R"), "range", [3, 6]), _S.binary("-", 1, _S.binary("*", 0.4, _S.binary("/", _S.read(_v14, "fr"), _S.read(_v14, "REACH"))))), 0, _S.prop(_S.read(_v14, "PF"), "BIG")])
			if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [_S.binary("*", 50, _S.read(_v14, "dt"))])):
				_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "GRIT"), _S.binary("*", _S.read(_v14, "s"), _S.read(_v14, "fr")), _S.unary("-", 1), _S.binary("*", _S.read(_v14, "s"), _S.invoke(_S.read(_v14, "R"), "range", [10, 60])), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [60, 180])), _S.invoke(_S.read(_v14, "R"), "range", [0.8, 1.3]), _S.invoke(_S.read(_v14, "R"), "pick", [_S.read(_v14, "STONE")]), (2 if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [0.3])) else 1)])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "hot"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v15 in _S.array(_S.read(_e, "bolts")):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "b", _v15)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v16, "b"), "down"), func(): return _S.binary(">=", _S.read(_v16, "t"), _S.prop(_S.read(_v16, "b"), "t0")))):
			_S.call_value(_S.read(_v16, "scorch"), [_S.read(_v16, "p"), _S.prop(_S.read(_v16, "b"), "x1"), 0, 9, _S.invoke(_S.read(_v16, "Math"), "pow", [_S.call_value(_S.read(_v16, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v16, "t"), _S.prop(_S.read(_v16, "b"), "t0")), 1.1))]), 1.3]), _S.binary("-", 1, _S.call_value(_S.read(_v16, "smooth"), [1.4, 1.85, _S.read(_v16, "t")]))])
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CLAP")), 0.5))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0.5, _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]), 0.18, _S.invoke(_S.read(_e, "Math"), "max", [2, _S.binary("*", 16, _S.binary("-", 1, _S.read(_e, "u")))]), _S.binary("-", 1.25, _S.read(_e, "u")), [_S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 6)], _S.function_value(_e, "_f7"), _S.binary("<", _S.read(_e, "u"), 0.15)])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	_S.invoke(_S.read(_e, "hot"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 30), 0.0001)]))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CLAP")), 0.5))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "a", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CLAP")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "a"), 0), func(): return _S.binary("<", _S.read(_e, "a"), 0.07))):
		_S.invoke(_S.read(_e, "p"), "mask", [_S.prop(_S.read(_e, "A"), "mask"), _S.prop(_S.read(_e, "A"), "x"), _S.prop(_S.read(_e, "A"), "y"), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "a"), 0.035)) else _S.prop(_S.read(_e, "C"), 6))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "a"), 0), func(): return _S.binary("<", _S.read(_e, "a"), 0.2))):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "q", _S.binary("/", _S.read(_v17, "a"), 0.2))
		_S.call_value(_S.read(_v17, "flare"), [_S.read(_v17, "p"), 0, _S.read(_v17, "CY"), _S.binary("*", 44, _S.invoke(_S.read(_v17, "Math"), "pow", [_S.binary("-", 1, _S.read(_v17, "q")), 1.4])), _S.binary("-", 1, _S.read(_v17, "q")), _S.read(_v17, "C")])
		if _S.truth(_S.binary("<", _S.read(_v17, "q"), 0.35)):
			_S.invoke(_S.read(_v17, "p"), "circle", [0, _S.read(_v17, "CY"), _S.binary("+", _S.binary("*", 10, _S.binary("-", 1, _S.binary("*", _S.read(_v17, "q"), 2))), 2), _S.read(_v17, "WHITE")])
		_S.invoke(_S.read(_v17, "p"), "glow", [0, _S.read(_v17, "CY"), 44, _S.prop(_S.read(_v17, "C"), 5), _S.binary("*", 0.32, _S.binary("-", 1, _S.read(_v17, "q")))])
	for _v18 in _S.array(_S.invoke(_S.read(_e, "bolts"), "entries", [])):
		var _v19 = _S.scope(_e)
		var _v20 = _v18
		_S.define(_v19, "i", _S.prop(_v20, 0))
		_S.define(_v19, "b", _S.prop(_v20, 1))
		var _v21 = _S.scope(_v19)
		_S.define(_v21, "ba", _S.invoke(_S.read(_v21, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v21, "t"), _S.prop(_S.read(_v21, "b"), "t0")), 30), 0.0001)]))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v21, "t"), _S.prop(_S.read(_v21, "b"), "t0")), func(): return _S.binary(">=", _S.read(_v21, "ba"), _S.prop(_S.read(_v21, "BK"), "length")))):
			continue
		_S.define(_v21, "r", _S.call_value(_S.read(_v21, "rng"), [_S.prop(_S.read(_v21, "o"), "seed"), 3, _S.read(_v21, "i"), _S.binary(">>", _S.read(_v21, "ba"), 1)]))
		_S.call_value(_S.read(_v21, "stroke"), [_S.read(_v21, "p"), _S.call_value(_S.read(_v21, "zigzag"), [_S.read(_v21, "r"), 0, _S.read(_v21, "CY"), _S.prop(_S.read(_v21, "b"), "x1"), _S.prop(_S.read(_v21, "b"), "y1"), 0.25, (0.5 if _S.truth(_S.prop(_S.read(_v21, "b"), "down")) else 0.8)]), _S.prop(_S.read(_v21, "BK"), _S.read(_v21, "ba")), _S.read(_v21, "C"), (1 if _S.truth(_S.binary("===", _S.read(_v21, "ba"), 0)) else 0.8), _S.merge([{"hero": _S.binary("===", _S.read(_v21, "ba"), 0)}])])
		if _S.truth(_S.prop(_S.read(_v21, "b"), "down")):
			var _v22 = _S.scope(_v21)
			_S.invoke(_S.read(_v22, "p"), "circle", [_S.prop(_S.read(_v22, "b"), "x1"), _S.unary("-", 1), _S.binary("+", _S.binary("*", 3, _S.prop(_S.read(_v22, "BK"), _S.read(_v22, "ba"))), 1), _S.prop(_S.read(_v22, "C"), 5)])
			_S.invoke(_S.read(_v22, "p"), "px", [_S.prop(_S.read(_v22, "b"), "x1"), _S.unary("-", 1), _S.read(_v22, "WHITE")])
			_S.invoke(_S.read(_v22, "p"), "glow", [_S.prop(_S.read(_v22, "b"), "x1"), _S.unary("-", 3), 20, _S.prop(_S.read(_v22, "C"), 5), _S.binary("*", 0.5, _S.prop(_S.read(_v22, "BK"), _S.read(_v22, "ba")))])
		else:
			if _S.truth(_S.binary("<", _S.read(_v21, "ba"), 2)):
				_S.call_value(_S.read(_v21, "sparkle"), [_S.read(_v21, "p"), _S.prop(_S.read(_v21, "b"), "x1"), _S.prop(_S.read(_v21, "b"), "y1"), 4, _S.prop(_S.read(_v21, "C"), 6), _S.prop(_S.read(_v21, "C"), 4), 0.4])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), 1))):
		var _v23 = _S.scope(_e)
		_S.call_value(_S.read(_v23, "band"), [_S.read(_v23, "p"), 0, 0.5, _S.call_value(_S.read(_v23, "front"), [_S.read(_v23, "t")]), 0.18, _S.invoke(_S.read(_v23, "Math"), "max", [2, _S.binary("*", 16, _S.binary("-", 1, _S.read(_v23, "u")))]), _S.binary("-", 1.25, _S.read(_v23, "u")), [_S.prop(_S.read(_v23, "C"), 1), _S.prop(_S.read(_v23, "C"), 2), _S.prop(_S.read(_v23, "C"), 4), _S.prop(_S.read(_v23, "C"), 6)], _S.function_value(_v23, "_f9"), _S.binary("<", _S.read(_v23, "u"), 0.15)])
		for _v24 in _S.array([_S.unary("-", 1), 1]):
			var _v25 = _S.scope(_v23)
			_S.define(_v25, "s", _v24)
			_S.invoke(_S.read(_v25, "p"), "glow", [_S.binary("*", _S.read(_v25, "s"), _S.call_value(_S.read(_v25, "front"), [_S.read(_v25, "t")])), _S.unary("-", 3), 28, _S.prop(_S.read(_v25, "C"), 4), _S.binary("*", 0.45, _S.binary("-", 1, _S.read(_v25, "u")))])
		_S.define(_v23, "ua", _S.binary("/", _S.binary("-", _S.read(_v23, "t"), _S.read(_v23, "CLAP")), 0.26))
		_S.define(_v23, "ra", _S.binary("+", 8, _S.binary("*", 60, _S.invoke(_S.read(_v23, "ease"), "outCubic", [_S.read(_v23, "ua")]))))
		if _S.truth(_S.binary("<", _S.read(_v23, "ua"), 1)):
			_S.invoke(_S.read(_v23, "p"), "ring", [0, _S.read(_v23, "CY"), _S.read(_v23, "ra"), _S.invoke(_S.read(_v23, "Math"), "max", [1, _S.binary("*", 2, _S.binary("-", 1, _S.read(_v23, "ua")))]), (_S.prop(_S.read(_v23, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v23, "ua"), 0.25)) else (_S.prop(_S.read(_v23, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v23, "ua"), 0.6)) else _S.prop(_S.read(_v23, "C"), 3))), _S.function_value(_v23, "_f10")])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "a"), 0.2), func(): return _S.binary("<", _S.read(_e, "a"), 0.9))):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "r", _S.call_value(_S.read(_v26, "rng"), [_S.prop(_S.read(_v26, "o"), "seed"), 9, _S.read(_v26, "f")]))
		_S.define(_v26, "k", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v26, "a"), 0.2), 0.7)))
		if _S.truth(_S.binary("<", _S.invoke(_S.read(_v26, "r"), "next", []), 0.8)):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "x0", _S.invoke(_S.read(_v27, "r"), "range", [_S.unary("-", 14), 14]))
			_S.define(_v27, "y0", _S.invoke(_S.read(_v27, "r"), "range", [_S.unary("-", 34), _S.unary("-", 4)]))
			_S.define(_v27, "b", _S.invoke(_S.read(_v27, "r"), "range", [0, _S.read(_v27, "TAU")]))
			_S.define(_v27, "l", _S.invoke(_S.read(_v27, "r"), "range", [6, 13]))
			_S.call_value(_S.read(_v27, "crackle"), [_S.read(_v27, "p"), _S.call_value(_S.read(_v27, "zigzag"), [_S.read(_v27, "r"), _S.read(_v27, "x0"), _S.read(_v27, "y0"), _S.binary("+", _S.read(_v27, "x0"), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "b")]), _S.read(_v27, "l"))), _S.binary("+", _S.read(_v27, "y0"), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "b")]), _S.read(_v27, "l"))), 0.4, 0.3]), _S.binary("+", _S.binary("*", 0.85, _S.read(_v27, "k")), 0.1), _S.read(_v27, "C"), 0.35])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "hot"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "g", _S.arg(_args, 1))
	return (0 if _S.truth(_S.binary(">", _S.binary("+", _S.read(_e, "CY"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), _S.read(_e, "ra"))), _S.unary("-", 1))) else _S.binary("-", 0.85, _S.binary("*", 0.85, _S.read(_e, "ua"))))
