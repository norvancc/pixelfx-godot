@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/petrified.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "tileFbm", _S.import_value("core/index.js", "tileFbm"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Petrified"}, {"desc": "Turned to stone: grey creeps up from the feet behind a crackling edge that spits grit, the statue holds, cracks run through it, and it bursts into tumbling chunks and dust."}, {"tags": ["status", "stone", "petrify", "petrified", "debuff", "death", "one-shot"]}, {"size": [120, 74]}, {"origin": [60, 64]}, {"duration": 3.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#16141c", "#2a2733", "#433f4d", "#5f5a6a", "#7d7889", "#a29dab", "#cdc8d2", "#f0edf3"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "REACH_", _S.merge([{"lean": 3}, {"crouch": 2}, {"fx": 14}, {"fy": _S.unary("-", 29)}, {"bx": _S.unary("-", 4)}, {"by": _S.unary("-", 22)}, {"ffx": 8}, {"fbx": _S.unary("-", 7)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[_S.unary("-", 0.16), _S.read(_e, "READY")], [0.08, _S.merge([{"turn": 0.9}, {"lean": _S.unary("-", 1)}, {"crouch": 2}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 24)}, {"bx": 9}, {"by": _S.unary("-", 24)}]), "snap"], [0.5, _S.read(_e, "REACH_")], [0.95, _S.read(_e, "REACH_")], [3.8, _S.read(_e, "REACH_")]]}, {"hits": [_S.merge([{"t": 2.2}, {"stop": 0.08}, {"shake": 0.24}, {"amp": 2}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "CREEP", 0.95)
	_S.define(_e, "CRACK", 1.75)
	_S.define(_e, "SHATTER", 2.2)
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f8"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_S.define(_e, "level", _S.function_value(_e, "_f9"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "S"), "h"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "front", _S.function_value(_e, "_f2"))
	_S.define(_e, "stone", _S.invoke(_S.prop(_S.read(_e, "S"), "body"), "map", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "cracks", [])
	_S.define(_e, "ox", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.prop(_S.read(_e, "S"), "w"), 0.55)]))
	_S.define(_e, "oy", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "H"), 0.42)]))
	_S.define(_e, "walk", _S.function_value(_e, "_f4"))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 7)):
		_S.call_value(_S.read(_v3, "walk"), [_S.read(_v3, "ox"), _S.read(_v3, "oy"), _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v3, "i"), 7), _S.read(_v3, "TAU")), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 0.3), 0.3])), 14])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "broke", false)
	_S.define(_e, "settled", false)
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "mx", _S.arg(_args, 0))
	return _S.binary("+", _S.call_value(_S.read(_e, "level"), [_S.read(_e, "t")]), _S.binary("*", 0.06, _S.call_value(_S.read(_e, "tileFbm"), [_S.binary("*", _S.read(_e, "mx"), 0.4), 0.5, 0, 0, _S.prop(_S.read(_e, "o"), "seed"), 2])))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v0 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v0, 0))
	_S.define(_e, "y", _S.prop(_v0, 1))
	_S.define(_e, "tone", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.call_value(_S.read(_e, "luma"), [_S.call_value(_S.read(_e, "colorAt"), [_S.read(_e, "a"), _S.read(_e, "x"), _S.read(_e, "y")])]), 0.06), 0.78)]))
	_S.define(_e, "mottle", _S.call_value(_S.read(_e, "tileFbm"), [_S.binary("*", _S.read(_e, "x"), 0.32), _S.binary("*", _S.read(_e, "y"), 0.32), 0, 0, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 5), 2]))
	_S.define(_e, "i", _S.binary("+", 1, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.binary("*", _S.read(_e, "tone"), 4.6), _S.binary("*", _S.read(_e, "mottle"), 1.1))])))
	if _S.truth(_S.logical("||", _S.unary("!", _S.invoke(_S.read(_e, "S"), "on", [_S.binary("-", _S.read(_e, "x"), 1), _S.read(_e, "y")])), func(): return _S.unary("!", _S.invoke(_S.read(_e, "S"), "on", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 1)])))):
		_S.write(_e, "i", 1, "+=", false)
	else:
		if _S.truth(_S.logical("||", _S.unary("!", _S.invoke(_S.read(_e, "S"), "on", [_S.binary("+", _S.read(_e, "x"), 1), _S.read(_e, "y")])), func(): return _S.unary("!", _S.invoke(_S.read(_e, "S"), "on", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1)])))):
			_S.write(_e, "i", 1, "-=", false)
	return _S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"up": _S.binary("-", 1, _S.binary("/", _S.binary("+", _S.read(_e, "y"), 0.5), _S.read(_e, "H")))}, {"c": _S.prop(_S.read(_e, "C"), _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "i"), 1, 6]))}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "ang", _S.arg(_args, 2))
	_S.define(_e, "len", _S.arg(_args, 3))
	_S.define(_e, "pts", [[_S.read(_e, "x"), _S.read(_e, "y")]])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "s", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "s"), _S.read(_v1, "len"))):
		var _v2 = _S.scope(_v1)
		_S.write(_v2, "ang", _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 0.55), 0.55]), "+=", false)
		_S.write(_v2, "x", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "ang")]), _S.invoke(_S.read(_v2, "R"), "range", [1.4, 2.4])), "+=", false)
		_S.write(_v2, "y", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "ang")]), _S.invoke(_S.read(_v2, "R"), "range", [1.4, 2.4])), "+=", false)
		if _S.truth(_S.unary("!", _S.invoke(_S.read(_v2, "S"), "on", [_S.invoke(_S.read(_v2, "Math"), "floor", [_S.read(_v2, "x")]), _S.invoke(_S.read(_v2, "Math"), "floor", [_S.read(_v2, "y")])]))):
			break
		_S.invoke(_S.read(_v2, "pts"), "push", [[_S.read(_v2, "x"), _S.read(_v2, "y")]])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v2, "pts"), "length"), 3), func(): return _S.binary("<", _S.prop(_S.read(_v2, "cracks"), "length"), 16)), func(): return _S.invoke(_S.read(_v2, "R"), "chance", [0.14]))):
			_S.call_value(_S.read(_v2, "walk"), [_S.read(_v2, "x"), _S.read(_v2, "y"), _S.binary("+", _S.read(_v2, "ang"), _S.binary("*", _S.invoke(_S.read(_v2, "R"), "sign", []), _S.invoke(_S.read(_v2, "R"), "range", [0.6, 1.2]))), _S.binary("/", _S.read(_v2, "len"), 2)])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "s", 1, "+=", true)
	_S.invoke(_S.read(_e, "cracks"), "push", [_S.read(_e, "pts")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CREEP"))):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "rate", _S.binary("*", 60, _S.read(_v4, "dt")))
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "n", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "n"), _S.read(_v5, "rate"))):
			var _v6 = _S.scope(_v5)
			if _S.truth(_S.unary("!", _S.invoke(_S.read(_v6, "R"), "chance", [0.5]))):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "n", 1, "+=", true)
				continue
			var _v7 = _S.prop(_S.prop(_S.read(_v6, "S"), "body"), _S.invoke(_S.read(_v6, "R"), "int", [0, _S.binary("-", _S.prop(_S.prop(_S.read(_v6, "S"), "body"), "length"), 1)]))
			_S.define(_v6, "mx", _S.prop(_v7, 0))
			_S.define(_v6, "my", _S.prop(_v7, 1))
			if _S.truth(_S.binary(">", _S.invoke(_S.read(_v6, "Math"), "abs", [_S.binary("-", _S.binary("-", 1, _S.binary("/", _S.binary("+", _S.read(_v6, "my"), 0.5), _S.read(_v6, "H"))), _S.call_value(_S.read(_v6, "front"), [_S.read(_v6, "mx")]))]), 0.04)):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "n", 1, "+=", true)
				continue
			_S.define(_v6, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v6, "a"), "x"), _S.read(_v6, "mx")), 0.5))
			_S.define(_v6, "y", _S.binary("+", _S.prop(_S.read(_v6, "a"), "y"), _S.read(_v6, "my")))
			_S.define(_v6, "side", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.read(_v6, "mx"), _S.binary("/", _S.prop(_S.read(_v6, "S"), "w"), 2))) else 1))
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "GRIT"), _S.read(_v6, "x"), _S.read(_v6, "y"), _S.binary("*", _S.read(_v6, "side"), _S.invoke(_S.read(_v6, "R"), "range", [15, 60])), _S.unary("-", _S.invoke(_S.read(_v6, "R"), "range", [30, 90])), _S.invoke(_S.read(_v6, "R"), "range", [0.6, 1.1]), _S.invoke(_S.read(_v6, "R"), "pick", [[_S.prop(_S.read(_v6, "C"), 4), _S.prop(_S.read(_v6, "C"), 5), _S.prop(_S.read(_v6, "C"), 6)]]), (2 if _S.truth(_S.invoke(_S.read(_v6, "R"), "chance", [0.3])) else 1)])
			if _S.truth(_S.invoke(_S.read(_v6, "R"), "chance", [0.3])):
				_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "DUST"), _S.binary("+", _S.read(_v6, "x"), _S.binary("*", _S.read(_v6, "side"), 2)), _S.read(_v6, "y"), _S.binary("*", _S.read(_v6, "side"), _S.invoke(_S.read(_v6, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_v6, "R"), "range", [4, 14])), _S.invoke(_S.read(_v6, "R"), "range", [0.4, 0.7]), _S.prop(_S.read(_v6, "C"), 4), _S.invoke(_S.read(_v6, "R"), "range", [1.5, 2.6])])
			if _S.truth(_S.invoke(_S.read(_v6, "R"), "chance", [0.25])):
				_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "MOTE"), _S.read(_v6, "x"), _S.read(_v6, "y"), _S.binary("*", _S.read(_v6, "side"), _S.invoke(_S.read(_v6, "R"), "range", [40, 90])), _S.unary("-", _S.invoke(_S.read(_v6, "R"), "range", [20, 70])), _S.invoke(_S.read(_v6, "R"), "range", [0.15, 0.3]), _S.prop(_S.read(_v6, "C"), 7), 0.5])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "n", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "settled")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CREEP")))):
		var _v8 = _S.scope(_e)
		_S.write(_v8, "settled", true, "=", false)
		_S.invoke(_S.read(_v8, "lights"), "add", [0, _S.binary("+", _S.prop(_S.read(_v8, "a"), "y"), _S.binary("*", _S.read(_v8, "H"), 0.5)), 34, _S.prop(_S.read(_v8, "C"), 6), 0.35, 0.3])
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 8)):
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "DUST"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v9, "R"), "range", [0, 2])), _S.binary("*", _S.invoke(_S.read(_v9, "R"), "sign", []), _S.invoke(_S.read(_v9, "R"), "range", [20, 50])), _S.unary("-", _S.invoke(_S.read(_v9, "R"), "range", [2, 10])), _S.invoke(_S.read(_v9, "R"), "range", [0.6, 1]), _S.prop(_S.read(_v9, "C"), 3), _S.invoke(_S.read(_v9, "R"), "range", [2, 3.5])])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CREEP"), 0.2)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SHATTER"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 1.6, _S.read(_e, "dt"))]))):
		var _v10 = _S.scope(_e)
		var _v11 = _S.prop(_S.prop(_S.read(_v10, "S"), "body"), _S.invoke(_S.read(_v10, "R"), "int", [0, _S.binary("-", _S.prop(_S.prop(_S.read(_v10, "S"), "body"), "length"), 1)]))
		_S.define(_v10, "mx", _S.prop(_v11, 0))
		_S.define(_v10, "my", _S.prop(_v11, 1))
		if _S.truth(_S.unary("!", _S.invoke(_S.read(_v10, "S"), "on", [_S.read(_v10, "mx"), _S.binary("+", _S.read(_v10, "my"), 1)]))):
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "GRIT"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v10, "a"), "x"), _S.read(_v10, "mx")), 0.5), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v10, "a"), "y"), _S.read(_v10, "my")), 1), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 8), 8]), 0, _S.invoke(_S.read(_v10, "R"), "range", [0.8, 1.2]), _S.prop(_S.read(_v10, "C"), 3), 1])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRACK")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SHATTER"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 12, _S.read(_e, "dt"))]))):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "pts", _S.invoke(_S.read(_v12, "R"), "pick", [_S.read(_v12, "cracks")]))
		var _v13 = _S.prop(_S.read(_v12, "pts"), _S.invoke(_S.read(_v12, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_v12, "R"), "next", []), _S.prop(_S.read(_v12, "pts"), "length"))]))
		_S.define(_v12, "x", _S.prop(_v13, 0))
		_S.define(_v12, "y", _S.prop(_v13, 1))
		_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "GRIT"), _S.binary("+", _S.prop(_S.read(_v12, "a"), "x"), _S.read(_v12, "x")), _S.binary("+", _S.prop(_S.read(_v12, "a"), "y"), _S.read(_v12, "y")), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 40), 40]), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [30, 80])), _S.invoke(_S.read(_v12, "R"), "range", [0.5, 0.9]), _S.invoke(_S.read(_v12, "R"), "pick", [[_S.prop(_S.read(_v12, "C"), 5), _S.prop(_S.read(_v12, "C"), 6)]]), 1])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "broke")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SHATTER")))):
		var _v14 = _S.scope(_e)
		_S.write(_v14, "broke", true, "=", false)
		_S.invoke(_S.read(_v14, "lights"), "add", [0, _S.binary("+", _S.prop(_S.read(_v14, "a"), "y"), _S.binary("*", _S.read(_v14, "H"), 0.45)), 46, _S.prop(_S.read(_v14, "C"), 6), 0.7, 0.5])
		_S.invoke(_S.read(_v14, "lights"), "add", [0, _S.binary("+", _S.prop(_S.read(_v14, "a"), "y"), _S.binary("*", _S.read(_v14, "H"), 0.45)), 30, _S.read(_v14, "WHITE"), 0.7, 0.12])
		_S.define(_v14, "cx", _S.binary("+", _S.prop(_S.read(_v14, "a"), "x"), _S.read(_v14, "ox")))
		_S.define(_v14, "cy", _S.binary("+", _S.prop(_S.read(_v14, "a"), "y"), _S.read(_v14, "oy")))
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 18)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "q", _S.prop(_S.read(_v16, "stone"), _S.invoke(_S.read(_v16, "R"), "int", [0, _S.binary("-", _S.prop(_S.read(_v16, "stone"), "length"), 1)])))
			_S.define(_v16, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v16, "a"), "x"), _S.prop(_S.read(_v16, "q"), "x")), 0.5))
			_S.define(_v16, "y", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v16, "a"), "y"), _S.prop(_S.read(_v16, "q"), "y")), 0.5))
			_S.define(_v16, "dx", _S.binary("-", _S.read(_v16, "x"), _S.read(_v16, "cx")))
			_S.define(_v16, "dy", _S.binary("-", _S.read(_v16, "y"), _S.read(_v16, "cy")))
			_S.define(_v16, "d", _S.logical("||", _S.invoke(_S.read(_v16, "Math"), "hypot", [_S.read(_v16, "dx"), _S.read(_v16, "dy")]), func(): return 1))
			_S.define(_v16, "sp", _S.invoke(_S.read(_v16, "R"), "range", [35, 110]))
			_S.invoke(_S.read(_v16, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v16, "B"), "CHUNK")}, {"x": _S.read(_v16, "x")}, {"y": _S.read(_v16, "y")}, {"vx": _S.binary("*", _S.binary("/", _S.read(_v16, "dx"), _S.read(_v16, "d")), _S.read(_v16, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v16, "dy"), _S.read(_v16, "d")), _S.read(_v16, "sp")), 0.6), _S.invoke(_S.read(_v16, "R"), "range", [60, 160]))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v16, "R"), "range", [1.1, 1.5])}, {"a": _S.invoke(_S.read(_v16, "R"), "range", [0, _S.read(_v16, "TAU")])}, {"va": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.invoke(_S.read(_v16, "R"), "range", [1.3, 2.8])}, {"ramp": [_S.prop(_S.read(_v16, "C"), 0), _S.prop(_S.read(_v16, "C"), 2), _S.prop(_S.read(_v16, "C"), 3), _S.prop(_S.read(_v16, "C"), 5), _S.prop(_S.read(_v16, "C"), 6)]}])])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
		for _v17 in _S.array(_S.read(_v14, "stone")):
			var _v18 = _S.scope(_v14)
			_S.define(_v18, "q", _v17)
			var _v19 = _S.scope(_v18)
			if _S.truth(_S.binary(">", _S.call_value(_S.read(_v19, "rand"), [_S.prop(_S.read(_v19, "q"), "x"), _S.prop(_S.read(_v19, "q"), "y"), 9]), 0.22)):
				continue
			_S.define(_v19, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v19, "a"), "x"), _S.prop(_S.read(_v19, "q"), "x")), 0.5))
			_S.define(_v19, "y", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v19, "a"), "y"), _S.prop(_S.read(_v19, "q"), "y")), 0.5))
			_S.define(_v19, "dx", _S.binary("-", _S.read(_v19, "x"), _S.read(_v19, "cx")))
			_S.define(_v19, "dy", _S.binary("-", _S.read(_v19, "y"), _S.read(_v19, "cy")))
			_S.define(_v19, "d", _S.logical("||", _S.invoke(_S.read(_v19, "Math"), "hypot", [_S.read(_v19, "dx"), _S.read(_v19, "dy")]), func(): return 1))
			_S.define(_v19, "sp", _S.invoke(_S.read(_v19, "R"), "range", [40, 130]))
			_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "GRIT"), _S.read(_v19, "x"), _S.read(_v19, "y"), _S.binary("*", _S.binary("/", _S.read(_v19, "dx"), _S.read(_v19, "d")), _S.read(_v19, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v19, "dy"), _S.read(_v19, "d")), _S.read(_v19, "sp")), 0.6), _S.invoke(_S.read(_v19, "R"), "range", [40, 140])), _S.invoke(_S.read(_v19, "R"), "range", [0.9, 1.4]), _S.prop(_S.read(_v19, "q"), "c"), (2 if _S.truth(_S.invoke(_S.read(_v19, "R"), "chance", [0.35])) else 1)])
		var _v20 = _S.scope(_v14)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 16)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "an", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v21, "Math"), "PI")), 2), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 1.4), 1.4])))
			_S.define(_v21, "sp", _S.invoke(_S.read(_v21, "R"), "range", [50, 120]))
			_S.invoke(_S.read(_v21, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v21, "B"), "SHARD")}, {"x": _S.binary("+", _S.read(_v21, "cx"), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 5), 5]))}, {"y": _S.binary("+", _S.read(_v21, "cy"), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 8), 8]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "an")]), _S.read(_v21, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "an")]), _S.read(_v21, "sp"))}, {"g": 0.8}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v21, "R"), "range", [0.9, 1.4])}, {"a": _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "TAU")])}, {"va": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 18), 18])}, {"s": _S.invoke(_S.read(_v21, "R"), "range", [1.5, 3])}, {"c": _S.invoke(_S.read(_v21, "R"), "pick", [[_S.prop(_S.read(_v21, "C"), 5), _S.prop(_S.read(_v21, "C"), 6), _S.prop(_S.read(_v21, "C"), 7)]])}])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		var _v22 = _S.scope(_v14)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 6)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "STAR"), _S.binary("+", _S.read(_v22, "cx"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 12), 12])), _S.binary("+", _S.read(_v22, "cy"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 10), 14])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [5, 20])), _S.invoke(_S.read(_v22, "R"), "range", [0.4, 0.9]), _S.prop(_S.read(_v22, "C"), 6), _S.invoke(_S.read(_v22, "R"), "range", [1, 2.2]), _S.invoke(_S.read(_v22, "R"), "range", [0.05, 0.4])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
		var _v23 = _S.scope(_v14)
		_S.define(_v23, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "i"), 12)):
			var _v24 = _S.scope(_v23)
			_S.define(_v24, "side", _S.invoke(_S.read(_v24, "R"), "sign", []))
			_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "SMOKE"), _S.binary("*", _S.read(_v24, "side"), _S.invoke(_S.read(_v24, "R"), "range", [0, 8])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [1, 6])), _S.binary("*", _S.read(_v24, "side"), _S.invoke(_S.read(_v24, "R"), "range", [20, 60])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [4, 16])), _S.invoke(_S.read(_v24, "R"), "range", [0.9, 1.4]), _S.prop(_S.read(_v24, "C"), 4), _S.invoke(_S.read(_v24, "R"), "range", [2.4, 4]), _S.invoke(_S.read(_v24, "R"), "range", [0, 0.08]), 0])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "i", 1, "+=", true)
		var _v25 = _S.scope(_v14)
		_S.define(_v25, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v25, "i"), 6)):
			_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "SMOKE"), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 6), 6]), _S.binary("+", _S.prop(_S.read(_v25, "a"), "y"), _S.binary("*", _S.read(_v25, "H"), _S.invoke(_S.read(_v25, "R"), "range", [0.3, 0.8]))), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [10, 30])), _S.invoke(_S.read(_v25, "R"), "range", [1, 1.5]), _S.prop(_S.read(_v25, "C"), 3), _S.invoke(_S.read(_v25, "R"), "range", [3, 4.5]), _S.invoke(_S.read(_v25, "R"), "range", [0, 0.1]), 0])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v26 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "b", _v26)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v27, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v27, "b"), "dusted")))):
			var _v28 = _S.scope(_v27)
			_S.set_prop(_S.read(_v28, "b"), "dusted", true, "=", false)
			_S.invoke(_S.read(_v28, "ps"), "spawn", [_S.prop(_S.read(_v28, "P"), "DUST"), _S.prop(_S.read(_v28, "b"), "x"), _S.unary("-", 0.5), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v28, "R"), "range", [2, 10])), _S.invoke(_S.read(_v28, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v28, "C"), 3), _S.invoke(_S.read(_v28, "R"), "range", [1.2, 2.2])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SHATTER"))):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "sh", (_S.invoke(_S.read(_v29, "Math"), "round", [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "sin", [_S.binary("*", _S.read(_v29, "t"), 90)]), _S.invoke(_S.read(_v29, "Math"), "min", [1, _S.binary("/", _S.binary("-", _S.read(_v29, "t"), _S.read(_v29, "CRACK")), _S.binary("-", _S.read(_v29, "SHATTER"), _S.read(_v29, "CRACK")))])), 1.2)]) if _S.truth(_S.binary(">=", _S.read(_v29, "t"), _S.read(_v29, "CRACK"))) else 0))
		_S.define(_v29, "white", _S.binary(">", _S.read(_v29, "t"), _S.binary("-", _S.read(_v29, "SHATTER"), 0.035)))
		for _v30 in _S.array(_S.read(_v29, "stone")):
			var _v31 = _S.scope(_v29)
			_S.define(_v31, "q", _v30)
			var _v32 = _S.scope(_v31)
			_S.define(_v32, "f", _S.call_value(_S.read(_v32, "front"), [_S.prop(_S.read(_v32, "q"), "x")]))
			_S.define(_v32, "d", _S.binary("-", _S.read(_v32, "f"), _S.prop(_S.read(_v32, "q"), "up")))
			if _S.truth(_S.binary("<", _S.read(_v32, "d"), 0)):
				continue
			_S.define(_v32, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v32, "a"), "x"), _S.prop(_S.read(_v32, "q"), "x")), _S.read(_v32, "sh")))
			_S.define(_v32, "y", _S.binary("+", _S.prop(_S.read(_v32, "a"), "y"), _S.prop(_S.read(_v32, "q"), "y")))
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v32, "d"), 0.035), func(): return _S.binary("<", _S.read(_v32, "t"), _S.read(_v32, "CREEP")))):
				_S.invoke(_S.read(_v32, "p"), "px", [_S.read(_v32, "x"), _S.read(_v32, "y"), (_S.prop(_S.read(_v32, "C"), 7) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v32, "rand"), [_S.prop(_S.read(_v32, "q"), "x"), _S.prop(_S.read(_v32, "q"), "y"), _S.invoke(_S.read(_v32, "Math"), "floor", [_S.binary("*", _S.read(_v32, "t"), 24)])]), 0.5)) else _S.prop(_S.read(_v32, "C"), 6))])
			else:
				if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v32, "d"), 0.07), func(): return _S.binary("<", _S.read(_v32, "t"), _S.read(_v32, "CREEP")))):
					_S.invoke(_S.read(_v32, "p"), "px", [_S.read(_v32, "x"), _S.read(_v32, "y"), _S.prop(_S.read(_v32, "C"), 5)])
				else:
					_S.invoke(_S.read(_v32, "p"), "px", [_S.read(_v32, "x"), _S.read(_v32, "y"), (_S.read(_v32, "WHITE") if _S.truth(_S.read(_v32, "white")) else _S.prop(_S.read(_v32, "q"), "c"))])
		if _S.truth(_S.binary("<", _S.read(_v29, "t"), _S.read(_v29, "CREEP"))):
			var _v33 = _S.scope(_v29)
			_S.define(_v33, "mx", 0)
			while _S.truth(_S.binary("<", _S.read(_v33, "mx"), _S.prop(_S.read(_v33, "S"), "w"))):
				var _v34 = _S.scope(_v33)
				_S.define(_v34, "my", _S.invoke(_S.read(_v34, "Math"), "floor", [_S.binary("*", _S.binary("-", 1, _S.call_value(_S.read(_v34, "front"), [_S.read(_v34, "mx")])), _S.read(_v34, "H"))]))
				if _S.truth(_S.invoke(_S.read(_v34, "S"), "on", [_S.read(_v34, "mx"), _S.read(_v34, "my")])):
					_S.invoke(_S.read(_v34, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_v34, "a"), "x"), _S.read(_v34, "mx")), _S.binary("+", _S.prop(_S.read(_v34, "a"), "y"), _S.read(_v34, "my")), 5, _S.prop(_S.read(_v34, "C"), 6), 0.18])
				_v33 = _S.iteration(_v33)
				_S.write(_v33, "mx", 2, "+=", false)
		if _S.truth(_S.binary(">=", _S.read(_v29, "t"), _S.read(_v29, "CRACK"))):
			var _v35 = _S.scope(_v29)
			_S.define(_v35, "k", _S.call_value(_S.read(_v35, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v35, "t"), _S.read(_v35, "CRACK")), 0.3)]))
			for _v36 in _S.array(_S.read(_v35, "cracks")):
				var _v37 = _S.scope(_v35)
				_S.define(_v37, "pts", _v36)
				var _v38 = _S.scope(_v37)
				_S.define(_v38, "i", 0)
				_S.define(_v38, "n", _S.invoke(_S.read(_v38, "Math"), "floor", [_S.binary("*", _S.prop(_S.read(_v38, "pts"), "length"), _S.read(_v38, "k"))]))
				while _S.truth(_S.binary("<", _S.read(_v38, "i"), _S.read(_v38, "n"))):
					var _v39 = _S.scope(_v38)
					var _v40 = _S.prop(_S.read(_v39, "pts"), _S.read(_v39, "i"))
					_S.define(_v39, "x", _S.prop(_v40, 0))
					_S.define(_v39, "y", _S.prop(_v40, 1))
					_S.define(_v39, "px", _S.binary("+", _S.invoke(_S.read(_v39, "Math"), "floor", [_S.binary("+", _S.prop(_S.read(_v39, "a"), "x"), _S.read(_v39, "x"))]), _S.read(_v39, "sh")))
					_S.define(_v39, "py", _S.invoke(_S.read(_v39, "Math"), "floor", [_S.binary("+", _S.prop(_S.read(_v39, "a"), "y"), _S.read(_v39, "y"))]))
					_S.define(_v39, "fresh", _S.binary(">", _S.read(_v39, "i"), _S.binary("-", _S.read(_v39, "n"), 3)))
					_S.invoke(_S.read(_v39, "p"), "px", [_S.read(_v39, "px"), _S.read(_v39, "py"), (_S.read(_v39, "WHITE") if _S.truth(_S.read(_v39, "fresh")) else _S.prop(_S.read(_v39, "C"), 0))])
					if _S.truth(_S.unary("!", _S.read(_v39, "fresh"))):
						_S.invoke(_S.read(_v39, "p"), "px", [_S.read(_v39, "px"), _S.binary("-", _S.read(_v39, "py"), 1), _S.prop(_S.read(_v39, "C"), 6)])
					_v38 = _S.iteration(_v38)
					_S.write(_v38, "i", 1, "+=", true)
			_S.invoke(_S.read(_v35, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_v35, "a"), "x"), _S.read(_v35, "ox")), _S.binary("+", _S.prop(_S.read(_v35, "a"), "y"), _S.read(_v35, "oy")), 12, _S.prop(_S.read(_v35, "C"), 6), _S.binary("*", 0.25, _S.read(_v35, "k"))])
	_S.invoke(_S.read(_e, "bits"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CREEP"))) else 0)

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (1.2 if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CREEP"))) else _S.binary("+", _S.binary("*", 1.2, _S.call_value(_S.read(_e, "smooth"), [0, _S.read(_e, "CREEP"), _S.read(_e, "t")])), _S.binary("*", 0.025, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "CREEP")), _S.read(_e, "TAU")), 3)]))))
