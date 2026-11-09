@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/spear-sweep.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "swing", _S.import_value("fx/melee/_lib.js", "swing"))
	_S.define(_e, "onSwing", _S.import_value("fx/melee/_lib.js", "onSwing"))
	_S.define(_e, "travel", _S.import_value("fx/melee/_lib.js", "travel"))
	_S.define(_e, "slash", _S.import_value("fx/melee/_lib.js", "slash"))
	_S.define(_e, "slashEnd", _S.import_value("fx/melee/_lib.js", "slashEnd"))
	_S.define(_e, "stone", _S.import_value("fx/melee/_lib.js", "stone"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Spear sweep"}, {"desc": "A wide low sweep at shin height: a long flat crescent swings from behind the legs round the front, and the wind of it kicks a wake of dust and grit along the floor."}, {"tags": ["melee", "sweep", "spear", "polearm", "low", "aoe", "ground", "dust", "combat", "one-shot"]}, {"size": [216, 84]}, {"origin": [104, 70]}, {"duration": 1.5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#0f2a2a", "#18504a", "#22806e", "#3fb894", "#8fe6c0", "#dcfff0", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"stone": "#4a3f69"}, {"seed": 10}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "REST_", _S.merge([_S.read(_e, "READY"), {"weapon": "spear"}, {"sa": _S.unary("-", 1.42)}, {"fx": 11}, {"fy": _S.unary("-", 21)}, {"bx": 7}, {"by": _S.unary("-", 16)}]))
	_S.define(_e, "COCK", _S.merge([_S.read(_e, "REST_"), {"two": true}, {"yaw": 2.5}, {"crouch": 6}, {"lean": 2}, {"fx": 15}, {"fy": _S.unary("-", 17)}, {"sa": 0.05}, {"ffx": 9}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "OUT_", _S.merge([_S.read(_e, "REST_"), {"two": true}, {"x": 2}, {"crouch": 6}, {"lean": 6}, {"fx": 20}, {"fy": _S.unary("-", 15)}, {"sa": 0.04}, {"ffx": 12}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 62}])}, {"poses": [[_S.unary("-", 0.56), _S.read(_e, "REST_")], [_S.unary("-", 0.34), _S.merge([_S.read(_e, "REST_"), {"two": true}, {"crouch": 4}, {"fx": 14}, {"fy": _S.unary("-", 22)}, {"sa": _S.unary("-", 0.7)}])], [_S.unary("-", 0.14), _S.read(_e, "COCK")], [_S.unary("-", 0.02), _S.merge([_S.read(_e, "COCK"), {"crouch": 7}, {"yaw": 2.7}])], [0.045, _S.merge([_S.read(_e, "OUT_"), {"x": 1}, {"yaw": 1.3}, {"ghost": 1}]), "snap"], [0.09, _S.merge([_S.read(_e, "OUT_"), {"ghost": 1}]), "snap"], [0.14, _S.read(_e, "OUT_"), "snap"], [0.62, _S.merge([_S.read(_e, "OUT_"), {"crouch": 5}, {"lean": 5}])], [1.12, _S.merge([_S.read(_e, "REST_"), {"two": true}, {"crouch": 4}, {"sa": _S.unary("-", 0.7)}, {"fx": 14}, {"fy": _S.unary("-", 22)}])], [1.5, _S.read(_e, "REST_")]]}, {"hits": [_S.merge([{"t": 0.1}, {"stop": 0.12}, {"shake": 0.18}, {"amp": 2}, {"push": 2.6}, {"straw": 18}, {"y": _S.unary("-", 12)}])]}, {"dust": [_S.merge([{"t": 0.09}, {"x": 14}, {"n": 6}, {"dir": 1}]), _S.merge([{"t": 0.09}, {"x": _S.unary("-", 10)}, {"n": 5}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "swing"), [_S.merge([{"cx": 2}, {"cy": _S.unary("-", 12)}, {"R": 50}, {"sy": 0.2}, {"k": 0.19}, {"rot": _S.unary("-", 0.04)}, {"a0": _S.binary("+", _S.prop(_S.read(_e, "Math"), "PI"), 0.55)}, {"dir": _S.unary("-", 1)}, {"span": _S.binary("+", _S.prop(_S.read(_e, "Math"), "PI"), 0.35)}, {"W": 19}, {"t0": 0}, {"sweep": 0.13}, {"hold": 0.05}, {"trail": 0.3}, {"ramp": _S.read(_e, "C")}])]))
	_S.define(_e, "end", _S.call_value(_S.read(_e, "slashEnd"), [_S.read(_e, "A")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "lastU", 0)
	_S.define(_e, "done", false)
	return _S.merge([{"update": _S.function_value(_e, "_f2")}, {"drawBack": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "U", _S.binary("*", _S.prop(_S.read(_e, "A"), "span"), _S.invoke(_S.read(_e, "ease"), "outExpo", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "A"), "sweep"))])])))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "u", _S.read(_v0, "lastU"))
	while _S.truth(_S.binary("<", _S.read(_v0, "u"), _S.read(_v0, "U"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "tr", _S.call_value(_S.read(_v1, "travel"), [_S.read(_v1, "A"), _S.read(_v1, "u")]))
		_S.define(_v1, "near", _S.binary(">=", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.prop(_S.read(_v1, "tr"), "a")]), 0))
		_S.define(_v1, "fy", (_S.unary("-", 1) if _S.truth(_S.read(_v1, "near")) else _S.unary("-", 3)))
		_S.define(_v1, "sp", _S.invoke(_S.read(_v1, "Rg"), "range", [30, 90]))
		_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "SMOKE"), _S.prop(_S.read(_v1, "tr"), "x"), _S.binary("-", _S.read(_v1, "fy"), _S.invoke(_S.read(_v1, "Rg"), "range", [0, 2])), _S.binary("*", _S.prop(_S.read(_v1, "tr"), "dx"), _S.read(_v1, "sp")), _S.unary("-", _S.invoke(_S.read(_v1, "Rg"), "range", [4, 16])), _S.invoke(_S.read(_v1, "Rg"), "range", [0.7, 1.15]), _S.prop(_S.read(_v1, "st"), "dust"), _S.invoke(_S.read(_v1, "Rg"), "range", [3, 5.5]), _S.invoke(_S.read(_v1, "Rg"), "range", [0, 0.05])])
		if _S.truth(_S.invoke(_S.read(_v1, "Rg"), "chance", [0.6])):
			_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "GRIT"), _S.prop(_S.read(_v1, "tr"), "x"), _S.read(_v1, "fy"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v1, "tr"), "dx"), _S.invoke(_S.read(_v1, "Rg"), "range", [40, 120])), _S.invoke(_S.read(_v1, "Rg"), "range", [_S.unary("-", 20), 20])), _S.unary("-", _S.invoke(_S.read(_v1, "Rg"), "range", [40, 130])), _S.invoke(_S.read(_v1, "Rg"), "range", [0.6, 1]), _S.invoke(_S.read(_v1, "Rg"), "pick", [[_S.prop(_S.read(_v1, "st"), "light"), _S.prop(_S.read(_v1, "st"), "body"), _S.prop(_S.read(_v1, "st"), "shade")]]), (2 if _S.truth(_S.invoke(_S.read(_v1, "Rg"), "chance", [0.3])) else 1)])
		if _S.truth(_S.invoke(_S.read(_v1, "Rg"), "chance", [0.35])):
			_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "MOTE"), _S.prop(_S.read(_v1, "tr"), "x"), _S.prop(_S.read(_v1, "tr"), "y"), _S.binary("*", _S.prop(_S.read(_v1, "tr"), "dx"), _S.invoke(_S.read(_v1, "Rg"), "range", [40, 100])), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v1, "tr"), "dy"), 40), _S.invoke(_S.read(_v1, "Rg"), "range", [5, 20])), _S.invoke(_S.read(_v1, "Rg"), "range", [0.2, 0.4]), (_S.prop(_S.read(_v1, "C"), 4) if _S.truth(_S.invoke(_S.read(_v1, "Rg"), "chance", [0.5])) else _S.prop(_S.read(_v1, "C"), 5)), 0.6, 0, (0 if _S.truth(_S.read(_v1, "near")) else _S.prop(_S.read(_v1, "PF"), "BACK"))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "u", 0.09, "+=", false)
	_S.write(_e, "lastU", _S.read(_e, "U"), "=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "done")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.read(_e, "A"), "sweep")))):
		var _v2 = _S.scope(_e)
		_S.write(_v2, "done", true, "=", false)
		_S.invoke(_S.read(_v2, "lights"), "add", [_S.prop(_S.read(_v2, "end"), "x"), _S.binary("-", _S.prop(_S.read(_v2, "end"), "y"), 4), 50, _S.prop(_S.read(_v2, "C"), 3), 0.5, 0.35])
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "i"), 8)):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "a", _S.binary("+", _S.invoke(_S.read(_v4, "Math"), "atan2", [_S.prop(_S.read(_v4, "end"), "dy"), _S.prop(_S.read(_v4, "end"), "dx")]), _S.invoke(_S.read(_v4, "Rg"), "range", [_S.unary("-", 0.5), 0.3])))
			_S.define(_v4, "sp", _S.invoke(_S.read(_v4, "Rg"), "range", [120, 260]))
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "SPARK"), _S.prop(_S.read(_v4, "end"), "x"), _S.prop(_S.read(_v4, "end"), "y"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "sp")), 40), _S.invoke(_S.read(_v4, "Rg"), "range", [0.12, 0.3])])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
		var _v5 = _S.scope(_v2)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 6)):
			_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "SMOKE"), _S.binary("+", _S.prop(_S.read(_v5, "end"), "x"), _S.invoke(_S.read(_v5, "Rg"), "range", [_S.unary("-", 6), 4])), _S.unary("-", _S.invoke(_S.read(_v5, "Rg"), "range", [1, 4])), _S.invoke(_S.read(_v5, "Rg"), "range", [30, 90]), _S.unary("-", _S.invoke(_S.read(_v5, "Rg"), "range", [4, 14])), _S.invoke(_S.read(_v5, "Rg"), "range", [0.9, 1.25]), _S.prop(_S.read(_v5, "st"), "dust"), _S.invoke(_S.read(_v5, "Rg"), "range", [4.5, 7]), _S.invoke(_S.read(_v5, "Rg"), "range", [0, 0.08]), _S.prop(_S.read(_v5, "PF"), "BIG")])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "slash"), [_S.read(_e, "p"), _S.read(_e, "A"), _S.read(_e, "t"), _S.unary("-", 1)])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "slash"), [_S.read(_e, "p"), _S.read(_e, "A"), _S.read(_e, "t"), 1])
	_S.define(_e, "g", _S.binary("-", _S.read(_e, "t"), _S.binary("*", _S.prop(_S.read(_e, "A"), "sweep"), 0.6)))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "g"), 0), func(): return _S.binary("<", _S.read(_e, "g"), 0.24))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "end"), "x"), _S.prop(_S.read(_e, "end"), "y"), _S.binary("*", _S.binary("*", 9, _S.invoke(_S.read(_e, "ease"), "outBack", [_S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "g"), 0.05)])])), _S.binary("-", 1, _S.binary("/", _S.read(_e, "g"), 0.24))), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3), 0.55])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.prop(_S.read(_e, "A"), "sweep"), 0.12))):
		var _v6 = _S.scope(_e)
		var _v7 = _S.call_value(_S.read(_v6, "onSwing"), [_S.read(_v6, "A"), _S.binary("-", _S.prop(_S.read(_v6, "A"), "R"), 5), _S.binary("*", _S.prop(_S.read(_v6, "A"), "span"), _S.invoke(_S.read(_v6, "ease"), "outExpo", [_S.call_value(_S.read(_v6, "clamp"), [_S.binary("/", _S.read(_v6, "t"), _S.prop(_S.read(_v6, "A"), "sweep"))])]))])
		_S.define(_v6, "x", _S.prop(_v7, 0))
		_S.define(_v6, "y", _S.prop(_v7, 1))
		_S.invoke(_S.read(_v6, "p"), "glow", [_S.read(_v6, "x"), _S.read(_v6, "y"), 36, _S.prop(_S.read(_v6, "C"), 3), _S.binary("*", 0.45, _S.binary("-", 1, _S.binary("/", _S.read(_v6, "t"), _S.binary("+", _S.prop(_S.read(_v6, "A"), "sweep"), 0.12))))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
