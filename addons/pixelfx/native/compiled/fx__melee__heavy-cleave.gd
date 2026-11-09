@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/heavy-cleave.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "swing", _S.import_value("fx/melee/_lib.js", "swing"))
	_S.define(_e, "onSwing", _S.import_value("fx/melee/_lib.js", "onSwing"))
	_S.define(_e, "smear", _S.import_value("fx/melee/_lib.js", "smear"))
	_S.define(_e, "trace", _S.import_value("fx/melee/_lib.js", "trace"))
	_S.define(_e, "glowAlong", _S.import_value("fx/melee/_lib.js", "glowAlong"))
	_S.define(_e, "stone", _S.import_value("fx/melee/_lib.js", "stone"))
	_S.define(_e, "rock", _S.import_value("fx/melee/_lib.js", "rock"))
	_S.define(_e, "cracks", _S.import_value("fx/melee/_lib.js", "cracks"))
	_S.define(_e, "star", _S.import_value("fx/melee/_lib.js", "star"))
	_S.define(_e, "sliver", _S.import_value("fx/melee/_lib.js", "sliver"))
	_S.define(_e, "along", _S.import_value("fx/melee/_lib.js", "along"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Heavy cleave"}, {"desc": "A glint over the head, then a thick ember arc accelerates over the top into the floor: a white slam, glowing cracks, dust rolling both ways, grit and rising embers."}, {"tags": ["melee", "slash", "cleave", "axe", "heavy", "ground", "fire", "combat", "directional", "one-shot"]}, {"size": [208, 116]}, {"origin": [68, 96]}, {"duration": 1.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#2a0c10", "#5c1414", "#a3241a", "#e0481c", "#ff8a2a", "#ffc23d", "#fff0a0", "#ffffff"]}, {"stone": "#4a3f69"}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "REST_", _S.merge([_S.read(_e, "READY"), {"weapon": "greatsword"}, {"two": true}, {"sa": _S.unary("-", 1)}, {"fx": 11}, {"fy": _S.unary("-", 21)}]))
	_S.define(_e, "OVER", _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 4)}, {"crouch": 2}, {"lean": _S.unary("-", 2)}, {"fx": 1}, {"fy": _S.unary("-", 42)}, {"sa": _S.unary("-", 2.45)}, {"ffx": 8}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "FLOOR", _S.merge([_S.read(_e, "REST_"), {"x": 0}, {"crouch": 7}, {"lean": 6}, {"fx": 17}, {"fy": _S.unary("-", 21)}, {"sa": 0.72}, {"ffx": 11}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 66}])}, {"poses": [[_S.unary("-", 0.42), _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 4)}])], [_S.unary("-", 0.3), _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 3)}, {"crouch": 4}, {"fx": 13}, {"fy": _S.unary("-", 29)}, {"sa": _S.unary("-", 1.3)}])], [_S.unary("-", 0.12), _S.merge([_S.read(_e, "OVER"), {"crouch": 4}])], [0.2, _S.merge([_S.read(_e, "OVER"), {"crouch": 3}])], [0.27, _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 1)}, {"y": _S.unary("-", 2)}, {"crouch": 0}, {"lean": 2}, {"fx": 11}, {"fy": _S.unary("-", 42)}, {"sa": _S.unary("-", 1.45)}, {"ffx": 10}, {"ghost": 1}]), "snap"], [0.31, _S.merge([_S.read(_e, "REST_"), {"x": 0}, {"y": _S.unary("-", 1)}, {"crouch": 3}, {"lean": 4}, {"fx": 18}, {"fy": _S.unary("-", 33)}, {"sa": _S.unary("-", 0.45)}, {"ffx": 12}, {"ghost": 1}]), "snap"], [0.335, _S.read(_e, "FLOOR"), "snap"], [0.85, _S.merge([_S.read(_e, "FLOOR"), {"crouch": 6}, {"lean": 5}])], [1.3, _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 2)}, {"crouch": 4}, {"lean": 2}, {"fx": 15}, {"fy": _S.unary("-", 23)}, {"sa": 0.1}])], [1.7, _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 4)}])]]}, {"hits": [_S.merge([{"t": 0.335}, {"stop": 0.2}, {"shake": 0.34}, {"amp": 3}, {"push": 3.2}, {"straw": 28}, {"y": _S.unary("-", 8)}])]}, {"dust": [_S.merge([{"t": 0.335}, {"x": 18}, {"n": 8}, {"dir": 1}]), _S.merge([{"t": 0.335}, {"x": _S.unary("-", 12)}, {"n": 5}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "RAISE", 0.2)
	_S.define(_e, "SWING", 0.135)
	_S.define(_e, "HIT", _S.binary("+", _S.read(_e, "RAISE"), _S.read(_e, "SWING")))
	_S.define(_e, "HOLD", 0.05)
	_S.define(_e, "TRAIL", 0.22)
	_S.define(_e, "head", _S.function_value(_e, "_f14"))
	_S.define(_e, "passedAt", _S.function_value(_e, "_f15"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "C"), "length"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "swing"), [_S.merge([{"cx": 3}, {"cy": _S.unary("-", 22)}, {"R": 37}, {"sy": 0.88}, {"rot": 0.32}, {"a0": _S.unary("-", 2.45)}, {"dir": 1}])]))
	_S.define(_e, "U1", 0)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.prop(_S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "A"), _S.prop(_S.read(_e, "A"), "R"), _S.read(_e, "U1")]), 1), _S.unary("-", 0.5)), func(): return _S.binary("<", _S.read(_e, "U1"), 4))):
		_S.write(_e, "U1", 0.005, "+=", false)
	_S.define(_e, "E", _S.merge([_S.read(_e, "A"), {"R": _S.binary("*", _S.prop(_S.read(_e, "A"), "R"), 0.76)}]))
	_S.define(_e, "W", 16)
	_S.define(_e, "WE", 5)
	var _v0 = _S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "A"), _S.binary("-", _S.prop(_S.read(_e, "A"), "R"), 2), _S.read(_e, "U1")])
	_S.define(_e, "X", _S.prop(_v0, 0))
	_S.define(_e, "GLINT", _S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "A"), _S.binary("-", _S.prop(_S.read(_e, "A"), "R"), 3), 0]))
	_S.define(_e, "lines", _S.call_value(_S.read(_e, "cracks"), [_S.read(_e, "R"), _S.read(_e, "X"), 4, 40, 7, 0.4]))
	_S.define(_e, "spikes", _S.invoke([_S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), _S.unary("-", 2.7), _S.unary("-", 2.15), _S.unary("-", 1.62), _S.unary("-", 1.05), _S.unary("-", 0.45), 0], "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "shards", _S.invoke([_S.unary("-", 2.5), _S.unary("-", 1.9), _S.unary("-", 1.2), _S.unary("-", 0.6)], "map", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "arc", _S.function_value(_e, "_f4"))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("+", _S.read(_e, "a"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.08), 0.08]))}, {"len": _S.binary("+", (20 if _S.truth(_S.logical("||", _S.binary("===", _S.read(_e, "i"), 0), func(): return _S.binary("===", _S.read(_e, "i"), 6))) else (15 if _S.truth(_S.binary("===", _S.read(_e, "i"), 3)) else 9)), _S.invoke(_S.read(_e, "R"), "range", [0, 4]))}, {"w": _S.binary("+", 1.6, _S.invoke(_S.read(_e, "R"), "range", [0, 0.6]))}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.merge([{"a": _S.binary("+", _S.read(_e, "a"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.15), 0.15]))}, {"r": _S.binary("+", 8, _S.invoke(_S.read(_e, "R"), "range", [0, 3]))}, {"v": _S.invoke(_S.read(_e, "R"), "range", [80, 130])}, {"arc": _S.invoke(_S.read(_e, "R"), "range", [0.35, 0.6])}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "w0", _S.arg(_args, 2))
	_S.define(_e, "lag", _S.arg(_args, 3))
	_S.define(_e, "rim", _S.arg(_args, 4))
	_S.define(_e, "tt", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "lag")))
	_S.define(_e, "U", _S.binary("*", _S.read(_e, "U1"), _S.call_value(_S.read(_e, "head"), [_S.read(_e, "tt")])))
	_S.define(_e, "T", _S.binary("*", _S.read(_e, "U1"), _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "HIT"), _S.read(_e, "HOLD")), _S.binary("+", _S.binary("+", _S.read(_e, "HIT"), _S.read(_e, "HOLD")), _S.read(_e, "TRAIL")), _S.read(_e, "tt")])))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "U"), 0.02), func(): return _S.binary(">=", _S.read(_e, "T"), _S.binary("-", _S.read(_e, "U"), 0.02)))):
		return null
	_S.define(_e, "gone", _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "HIT"), _S.read(_e, "HOLD")), _S.binary("+", _S.binary("+", _S.read(_e, "HIT"), _S.read(_e, "HOLD")), _S.read(_e, "TRAIL")), _S.read(_e, "tt")]))
	_S.define(_e, "shrink", _S.binary("-", 1, _S.binary("*", 0.75, _S.read(_e, "gone"))))
	_S.call_value(_S.read(_e, "smear"), [_S.read(_e, "p"), _S.read(_e, "s"), _S.read(_e, "T"), _S.read(_e, "U"), _S.read(_e, "w0"), _S.function_value(_e, "_f5")])
	if _S.truth(_S.read(_e, "rim")):
		_S.call_value(_S.read(_e, "glowAlong"), [_S.read(_e, "p"), _S.read(_e, "s"), _S.binary("-", _S.prop(_S.read(_e, "s"), "R"), _S.binary("*", _S.read(_e, "w0"), 0.4)), _S.read(_e, "T"), _S.read(_e, "U"), _S.binary("+", 7, _S.binary("*", _S.read(_e, "w0"), 0.5)), _S.prop(_S.read(_e, "C"), 4), _S.function_value(_e, "_f6")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "age", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "tt"), _S.call_value(_S.read(_e, "passedAt"), [_S.binary("/", _S.read(_e, "u"), _S.read(_e, "U1"))]))]))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "u"), _S.read(_e, "T")), _S.binary("-", _S.read(_e, "U"), _S.read(_e, "T"))))
	_S.define(_e, "w", _S.binary("*", _S.binary("*", _S.read(_e, "w0"), _S.read(_e, "shrink")), _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "v"), 2.2]))]), 0.6])))
	if _S.truth(_S.binary("<", _S.read(_e, "w"), 0.4)):
		return null
	_S.define(_e, "q", _S.binary("/", _S.binary("-", _S.prop(_S.read(_e, "s"), "R"), _S.read(_e, "r")), _S.read(_e, "w")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "q"), 0), func(): return _S.binary(">", _S.read(_e, "q"), 1))):
		return null
	_S.define(_e, "ci", (0 if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "rim"), func(): return _S.binary("<", _S.read(_e, "q"), 0.22)), func(): return _S.binary("<", _S.read(_e, "age"), 0.12))) else _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.binary("-", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "q"), _S.binary("-", _S.read(_e, "n"), 1)), 0.62), _S.binary("*", _S.read(_e, "age"), 7)), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "HIT"))]), 10)), _S.binary("*", _S.read(_e, "v"), 0.8)), (0.7 if _S.truth(_S.read(_e, "rim")) else 1.7))])))
	_S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "C"), _S.binary("-", _S.binary("-", _S.read(_e, "n"), 1), _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "ci"), 0, _S.binary("-", _S.read(_e, "n"), 1)]))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "v"), 0.35)]), _S.binary("-", 1.2, _S.read(_e, "gone"))), "=", false)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", 0.26, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "tt"), _S.call_value(_S.read(_e, "passedAt"), [_S.binary("/", _S.read(_e, "u"), _S.read(_e, "U1"))]))])), 0.2)])), _S.binary("/", _S.binary("-", _S.read(_e, "u"), _S.read(_e, "T")), _S.binary("-", _S.read(_e, "U"), _S.read(_e, "T"))))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "RAISE"), 0.04)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.35]))):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "a", _S.invoke(_S.read(_v1, "R"), "range", [0, _S.read(_v1, "TAU")]))
		_S.define(_v1, "D", _S.invoke(_S.read(_v1, "R"), "range", [14, 26]))
		_S.define(_v1, "T", _S.invoke(_S.read(_v1, "R"), "range", [0.14, 0.2]))
		_S.define(_v1, "v", _S.binary("/", _S.binary("*", _S.read(_v1, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v1, "Math"), "exp", [_S.binary("*", 3, _S.read(_v1, "T"))]), 1)))
		_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "STREAK"), _S.binary("+", _S.prop(_S.read(_v1, "GLINT"), 0), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "D"))), _S.binary("+", _S.prop(_S.read(_v1, "GLINT"), 1), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "D"))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")])), _S.read(_v1, "v")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")])), _S.read(_v1, "v")), _S.read(_v1, "T"), (_S.prop(_S.read(_v1, "C"), 5) if _S.truth(_S.invoke(_S.read(_v1, "R"), "chance", [0.5])) else _S.prop(_S.read(_v1, "C"), 4))])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "RAISE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.7]))):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "u", _S.binary("*", _S.binary("*", _S.read(_v2, "U1"), _S.call_value(_S.read(_v2, "head"), [_S.read(_v2, "t")])), _S.invoke(_S.read(_v2, "R"), "range", [0.6, 1])))
		var _v3 = _S.call_value(_S.read(_v2, "onSwing"), [_S.read(_v2, "A"), _S.binary("-", _S.prop(_S.read(_v2, "A"), "R"), _S.invoke(_S.read(_v2, "R"), "range", [0, 6])), _S.read(_v2, "u")])
		_S.define(_v2, "x", _S.prop(_v3, 0))
		_S.define(_v2, "y", _S.prop(_v3, 1))
		_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "EMBER"), _S.read(_v2, "x"), _S.read(_v2, "y"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 20), 20]), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 40), _S.unary("-", 10)]), _S.invoke(_S.read(_v2, "R"), "range", [0.5, 1.1]), _S.prop(_S.read(_v2, "C"), 4), _S.invoke(_S.read(_v2, "R"), "range", [1, 2])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "hit", true, "=", false)
		_S.invoke(_S.read(_v4, "lights"), "add", [_S.read(_v4, "X"), _S.unary("-", 6), 26, _S.read(_v4, "WHITE"), 0.9, 0.1])
		_S.invoke(_S.read(_v4, "lights"), "add", [_S.read(_v4, "X"), _S.unary("-", 12), 64, _S.prop(_S.read(_v4, "C"), 4), 0.5, 0.8])
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 26)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v6, "Math"), "PI")), 2), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 1.2), 1.35])))
			_S.define(_v6, "sp", _S.invoke(_S.read(_v6, "R"), "range", [140, 360]))
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "SPARK"), _S.read(_v6, "X"), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), 40), _S.invoke(_S.read(_v6, "R"), "range", [0.15, 0.5])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
		var _v7 = _S.scope(_v4)
		_S.define(_v7, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "i"), 20)):
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "s", (_S.unary("-", 1) if _S.truth(_S.binary("%", _S.read(_v8, "i"), 2)) else 1))
			_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "SMOKE"), _S.binary("+", _S.read(_v8, "X"), _S.binary("*", _S.read(_v8, "s"), _S.invoke(_S.read(_v8, "R"), "range", [0, 8]))), _S.unary("-", _S.invoke(_S.read(_v8, "R"), "range", [2, 6])), _S.binary("*", _S.read(_v8, "s"), _S.invoke(_S.read(_v8, "R"), "range", [45, 135])), _S.unary("-", _S.invoke(_S.read(_v8, "R"), "range", [2, 12])), _S.invoke(_S.read(_v8, "R"), "range", [1, 1.45]), _S.prop(_S.read(_v8, "st"), "dust"), _S.invoke(_S.read(_v8, "R"), "range", [5, 8.5]), _S.invoke(_S.read(_v8, "R"), "range", [0, 0.07]), _S.prop(_S.read(_v8, "PF"), "BIG")])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
		var _v9 = _S.scope(_v4)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 4)):
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "SMOKE"), _S.binary("+", _S.read(_v9, "X"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 4), 4])), _S.unary("-", _S.invoke(_S.read(_v9, "R"), "range", [3, 8])), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v9, "R"), "range", [40, 90])), _S.invoke(_S.read(_v9, "R"), "range", [1, 1.45]), _S.prop(_S.read(_v9, "st"), "dust"), _S.invoke(_S.read(_v9, "R"), "range", [4, 6.5]), _S.invoke(_S.read(_v9, "R"), "range", [0.02, 0.1]), _S.prop(_S.read(_v9, "PF"), "BIG")])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
		var _v10 = _S.scope(_v4)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), 8)):
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "DUST"), _S.binary("+", _S.read(_v10, "X"), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 4), 4])), _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [1, 4])), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 60), 60]), _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [8, 30])), _S.invoke(_S.read(_v10, "R"), "range", [0.35, 0.7]), _S.prop(_S.read(_v10, "st"), "dust"), _S.invoke(_S.read(_v10, "R"), "range", [2, 3.5])])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
		var _v11 = _S.scope(_v4)
		_S.define(_v11, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v11, "i"), 44)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v12, "Math"), "PI")), 2), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 0.7), 1])))
			_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "R"), "range", [60, 230]))
			_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "GRIT"), _S.binary("+", _S.read(_v12, "X"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 3), 3])), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.invoke(_S.read(_v12, "R"), "range", [1, 1.5]), _S.invoke(_S.read(_v12, "R"), "pick", [[_S.prop(_S.read(_v12, "st"), "light"), _S.prop(_S.read(_v12, "st"), "body"), _S.prop(_S.read(_v12, "st"), "body"), _S.prop(_S.read(_v12, "st"), "shade")]]), (2 if _S.truth(_S.invoke(_S.read(_v12, "R"), "chance", [0.35])) else 1)])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "+=", true)
		var _v13 = _S.scope(_v4)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 6)):
			_S.invoke(_S.read(_v13, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v13, "B"), "CHUNK")}, {"x": _S.binary("+", _S.read(_v13, "X"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": _S.unary("-", 2)}, {"vx": _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 50), 110])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [120, 260]))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v13, "R"), "range", [1.15, 1.5])}, {"a": _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")])}, {"va": _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.invoke(_S.read(_v13, "R"), "int", [1, 2])}])])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
		var _v14 = _S.scope(_v4)
		_S.define(_v14, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v14, "i"), 16)):
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "EMBER"), _S.binary("+", _S.read(_v14, "X"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 8), 8])), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [1, 6])), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 50), 60]), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [30, 110])), _S.invoke(_S.read(_v14, "R"), "range", [0.7, 1.5]), _S.prop(_S.read(_v14, "C"), 4), _S.invoke(_S.read(_v14, "R"), "range", [1, 2])])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "hit"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.6))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.12]))):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "c", _S.invoke(_S.read(_v15, "R"), "pick", [_S.read(_v15, "lines")]))
		_S.define(_v15, "pt", _S.invoke(_S.read(_v15, "R"), "pick", [_S.prop(_S.read(_v15, "c"), "pts")]))
		_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "EMBER"), _S.prop(_S.read(_v15, "pt"), 0), _S.binary("-", _S.prop(_S.read(_v15, "pt"), 1), 1), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [20, 50])), _S.invoke(_S.read(_v15, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v15, "C"), 4), 1])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v16 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "b", _v16)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v17, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v17, "b"), "dusted")))):
			var _v18 = _S.scope(_v17)
			_S.set_prop(_S.read(_v18, "b"), "dusted", true, "=", false)
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v19, "i"), 2)):
				_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v19, "b"), "x"), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v19, "R"), "sign", []), _S.invoke(_S.read(_v19, "R"), "range", [8, 30])), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [2, 12])), _S.invoke(_S.read(_v19, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v19, "st"), "dust"), _S.invoke(_S.read(_v19, "R"), "range", [1.3, 2.4])])
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")))
	if _S.truth(_S.binary(">=", _S.read(_e, "q"), 0)):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "fade", _S.binary("-", 1, _S.call_value(_S.read(_v20, "smooth"), [1, 1.5, _S.read(_v20, "q")])))
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "y", 0)
		while _S.truth(_S.binary("<=", _S.read(_v21, "y"), 2)):
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "x", _S.unary("-", 9))
			while _S.truth(_S.binary("<=", _S.read(_v22, "x"), 9)):
				var _v23 = _S.scope(_v22)
				_S.define(_v23, "d", _S.invoke(_S.read(_v23, "Math"), "hypot", [_S.binary("/", _S.binary("+", _S.read(_v23, "x"), 0.5), 9), _S.binary("/", _S.binary("+", _S.read(_v23, "y"), 0.5), 3.5)]))
				if _S.truth(_S.binary(">", _S.read(_v23, "d"), 1)):
					_v22 = _S.iteration(_v22)
					_S.write(_v22, "x", 1, "+=", true)
					continue
				_S.define(_v23, "T", _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "pow", [_S.call_value(_S.read(_v23, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.read(_v23, "q"), 0.8))]), 1.4]), _S.binary("-", 1.2, _S.read(_v23, "d"))), _S.binary("*", _S.call_value(_S.read(_v23, "rand"), [_S.read(_v23, "x"), _S.read(_v23, "y"), 3]), 0.3)))
				if _S.truth(_S.binary(">", _S.read(_v23, "T"), 0.08)):
					_S.invoke(_S.read(_v23, "p"), "dot", [_S.binary("+", _S.read(_v23, "X"), _S.read(_v23, "x")), _S.read(_v23, "y"), _S.prop(_S.read(_v23, "C"), _S.call_value(_S.read(_v23, "clamp"), [_S.invoke(_S.read(_v23, "Math"), "round", [_S.binary("*", _S.read(_v23, "T"), 9)]), 1, 7])), _S.read(_v23, "fade")])
				else:
					_S.invoke(_S.read(_v23, "p"), "dot", [_S.binary("+", _S.read(_v23, "X"), _S.read(_v23, "x")), _S.read(_v23, "y"), (_S.prop(_S.read(_v23, "st"), "dark") if _S.truth(_S.binary("<", _S.read(_v23, "d"), 0.5)) else _S.prop(_S.read(_v23, "st"), "shade")), _S.binary("*", (1 if _S.truth(_S.binary("<", _S.read(_v23, "d"), _S.binary("-", 0.9, _S.binary("*", _S.call_value(_S.read(_v23, "rand"), [_S.read(_v23, "x"), _S.read(_v23, "y"), 9]), 0.3)))) else _S.binary("-", 1, _S.read(_v23, "d"))), _S.read(_v23, "fade"))])
				_v22 = _S.iteration(_v22)
				_S.write(_v22, "x", 1, "+=", true)
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "y", 1, "+=", true)
		_S.define(_v20, "k", _S.binary("/", _S.read(_v20, "q"), 0.45))
		if _S.truth(_S.binary("<", _S.read(_v20, "k"), 1)):
			_S.call_value(_S.read(_v20, "band"), [_S.read(_v20, "p"), _S.read(_v20, "X"), 0.5, _S.binary("+", 6, _S.binary("*", 46, _S.invoke(_S.read(_v20, "ease"), "outCubic", [_S.read(_v20, "k")]))), 0.16, _S.invoke(_S.read(_v20, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_v20, "k")))]), _S.binary("-", 1.15, _S.read(_v20, "k")), [_S.prop(_S.read(_v20, "st"), "body"), _S.prop(_S.read(_v20, "st"), "light"), _S.prop(_S.read(_v20, "C"), 4), _S.prop(_S.read(_v20, "C"), 6)], _S.function_value(_v20, "_f9")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "RAISE"), 0.03))):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "g", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v24, "ease"), "outBack", [_S.call_value(_S.read(_v24, "clamp"), [_S.binary("/", _S.read(_v24, "t"), 0.1)])]), _S.binary("+", 1, _S.binary("*", 0.15, _S.invoke(_S.read(_v24, "Math"), "sin", [_S.binary("*", _S.read(_v24, "t"), 60)])))), (_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v24, "t"), _S.read(_v24, "RAISE")), 0.03)) if _S.truth(_S.binary(">", _S.read(_v24, "t"), _S.read(_v24, "RAISE"))) else 1)))
		_S.call_value(_S.read(_v24, "sparkle"), [_S.read(_v24, "p"), _S.prop(_S.read(_v24, "GLINT"), 0), _S.prop(_S.read(_v24, "GLINT"), 1), _S.binary("+", 1, _S.binary("*", 7, _S.read(_v24, "g"))), _S.prop(_S.read(_v24, "C"), 6), _S.prop(_S.read(_v24, "C"), 4), 0.5])
		_S.invoke(_S.read(_v24, "p"), "glow", [_S.prop(_S.read(_v24, "GLINT"), 0), _S.prop(_S.read(_v24, "GLINT"), 1), 22, _S.prop(_S.read(_v24, "C"), 4), _S.binary("*", 0.3, _S.read(_v24, "g"))])
	if _S.truth(_S.binary(">=", _S.read(_e, "q"), 0)):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "heat", _S.invoke(_S.read(_v25, "Math"), "pow", [_S.call_value(_S.read(_v25, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.read(_v25, "q"), 1.2))]), 1.2]))
		_S.define(_v25, "fade", _S.binary("-", 1, _S.call_value(_S.read(_v25, "smooth"), [1.15, 1.5, _S.read(_v25, "q")])))
		for _v26 in _S.array(_S.read(_v25, "lines")):
			var _v27 = _S.scope(_v25)
			_S.define(_v27, "c", _v26)
			var _v28 = _S.scope(_v27)
			_S.define(_v28, "reach", _S.binary("*", _S.binary("*", 40, _S.invoke(_S.read(_v28, "ease"), "outCubic", [_S.call_value(_S.read(_v28, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v28, "q"), _S.binary("*", _S.prop(_S.read(_v28, "c"), "at"), 0.1)), 0.13)])])), (0.3 if _S.truth(_S.prop(_S.read(_v28, "c"), "fork")) else 1)))
			if _S.truth(_S.binary("<=", _S.read(_v28, "reach"), 0)):
				continue
			_S.call_value(_S.read(_v28, "along"), [_S.prop(_S.read(_v28, "c"), "pts"), _S.read(_v28, "reach"), _S.function_value(_v28, "_f11")])
		if _S.truth(_S.binary(">", _S.read(_v25, "heat"), 0)):
			_S.invoke(_S.read(_v25, "p"), "glow", [_S.read(_v25, "X"), _S.unary("-", 2), 34, _S.prop(_S.read(_v25, "C"), 4), _S.binary("*", _S.binary("*", 0.32, _S.read(_v25, "heat")), _S.read(_v25, "fade"))])
		_S.define(_v25, "k", _S.binary("/", _S.read(_v25, "q"), 0.45))
		if _S.truth(_S.binary("<", _S.read(_v25, "k"), 1)):
			_S.call_value(_S.read(_v25, "band"), [_S.read(_v25, "p"), _S.read(_v25, "X"), 0.5, _S.binary("+", 6, _S.binary("*", 46, _S.invoke(_S.read(_v25, "ease"), "outCubic", [_S.read(_v25, "k")]))), 0.16, _S.invoke(_S.read(_v25, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_v25, "k")))]), _S.binary("-", 1.15, _S.read(_v25, "k")), [_S.prop(_S.read(_v25, "st"), "body"), _S.prop(_S.read(_v25, "st"), "light"), _S.prop(_S.read(_v25, "C"), 4), _S.prop(_S.read(_v25, "C"), 6)], _S.function_value(_v25, "_f12")])
	_S.call_value(_S.read(_e, "arc"), [_S.read(_e, "p"), _S.read(_e, "E"), _S.read(_e, "WE"), 0.02, false])
	_S.call_value(_S.read(_e, "arc"), [_S.read(_e, "p"), _S.read(_e, "A"), _S.read(_e, "W"), 0, true])
	_S.define(_e, "tail", _S.binary("*", _S.read(_e, "U1"), _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "HIT"), _S.read(_e, "HOLD")), _S.binary("+", _S.binary("+", _S.read(_e, "HIT"), _S.read(_e, "HOLD")), _S.read(_e, "TRAIL")), _S.read(_e, "t")])))
	_S.define(_e, "th", _S.binary("*", 0.8, _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), _S.read(_e, "HOLD")), _S.binary("+", _S.read(_e, "TRAIL"), 0.25))]))))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "tail"), 0.02), func(): return _S.binary(">", _S.read(_e, "th"), 0))):
		_S.call_value(_S.read(_e, "trace"), [_S.read(_e, "p"), _S.read(_e, "A"), _S.binary("-", _S.prop(_S.read(_e, "A"), "R"), 0.5), 0, _S.read(_e, "tail"), _S.prop(_S.read(_e, "C"), 3), _S.function_value(_e, "_f13")])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "RAISE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.05)))):
		var _v29 = _S.scope(_e)
		var _v30 = _S.call_value(_S.read(_v29, "onSwing"), [_S.read(_v29, "A"), _S.binary("-", _S.prop(_S.read(_v29, "A"), "R"), 5), _S.binary("*", _S.read(_v29, "U1"), _S.call_value(_S.read(_v29, "head"), [_S.read(_v29, "t")]))])
		_S.define(_v29, "x", _S.prop(_v30, 0))
		_S.define(_v29, "y", _S.prop(_v30, 1))
		_S.invoke(_S.read(_v29, "p"), "glow", [_S.read(_v29, "x"), _S.read(_v29, "y"), 40, _S.prop(_S.read(_v29, "C"), 4), 0.5])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0), func(): return _S.binary("<", _S.read(_e, "q"), 0.035))):
		_S.call_value(_S.read(_e, "star"), [_S.read(_e, "p"), _S.read(_e, "X"), _S.unary("-", 1), _S.read(_e, "spikes"), 1, 1, _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 5)])
	else:
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0.035), func(): return _S.binary("<", _S.read(_e, "q"), 0.07))):
			_S.call_value(_S.read(_e, "star"), [_S.read(_e, "p"), _S.read(_e, "X"), _S.unary("-", 1), _S.read(_e, "spikes"), 1.25, 0.55, _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 4)])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0.05), func(): return _S.binary("<", _S.read(_e, "q"), 0.16))):
		var _v31 = _S.scope(_e)
		_S.define(_v31, "k", _S.binary("/", _S.binary("-", _S.read(_v31, "q"), 0.05), 0.11))
		for _v32 in _S.array(_S.read(_v31, "shards")):
			var _v33 = _S.scope(_v31)
			_S.define(_v33, "s", _v32)
			_S.call_value(_S.read(_v33, "sliver"), [_S.read(_v33, "p"), _S.read(_v33, "X"), _S.unary("-", 1), _S.prop(_S.read(_v33, "s"), "a"), _S.binary("+", _S.prop(_S.read(_v33, "s"), "r"), _S.binary("*", _S.prop(_S.read(_v33, "s"), "v"), _S.binary("-", _S.read(_v33, "q"), 0.05))), _S.binary("*", _S.prop(_S.read(_v33, "s"), "arc"), _S.binary("-", 1, _S.binary("*", 0.4, _S.read(_v33, "k")))), (_S.prop(_S.read(_v33, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v33, "k"), 0.4)) else (_S.prop(_S.read(_v33, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v33, "k"), 0.7)) else _S.prop(_S.read(_v33, "C"), 4))), _S.binary("-", 1, _S.read(_v33, "k"))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0), func(): return _S.binary("<", _S.read(_e, "q"), 0.2))):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "pop", _S.invoke(_S.read(_v34, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_v34, "q")), 0.05)]))
		_S.invoke(_S.read(_v34, "p"), "glow", [_S.read(_v34, "X"), _S.unary("-", 6), 30, _S.prop(_S.read(_v34, "C"), 5), _S.binary("*", 0.8, _S.read(_v34, "pop"))])
		_S.invoke(_S.read(_v34, "p"), "glow", [_S.read(_v34, "X"), _S.unary("-", 2), 10, _S.read(_v34, "WHITE"), _S.binary("*", 0.7, _S.read(_v34, "pop"))])
	for _v35 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v36 = _S.scope(_e)
		_S.define(_v36, "b", _v35)
		_S.call_value(_S.read(_v36, "rock"), [_S.read(_v36, "p"), _S.read(_v36, "b"), _S.read(_v36, "st")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x0", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	_S.define(_e, "x1", _S.arg(_args, 2))
	_S.define(_e, "y1", _S.arg(_args, 3))
	_S.define(_e, "d", _S.arg(_args, 4))
	_S.define(_e, "h", _S.binary("-", _S.binary("*", _S.read(_e, "heat"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "d"), 46))), (0.12 if _S.truth(_S.prop(_S.read(_e, "c"), "fork")) else 0)))
	_S.define(_e, "col", (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.72)) else (_S.prop(_S.read(_e, "C"), _S.call_value(_S.read(_e, "clamp"), [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "h"), 8)]), 1, 6])) if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.08)) else _S.prop(_S.read(_e, "st"), "dark"))))
	if _S.truth(_S.binary(">", _S.read(_e, "y1"), 0.5)):
		_S.invoke(_S.read(_e, "p"), "line", [_S.binary("+", _S.read(_e, "x0"), 1), _S.read(_e, "y0"), _S.binary("+", _S.read(_e, "x1"), 1), _S.read(_e, "y1"), _S.prop(_S.read(_e, "st"), "dark"), _S.read(_e, "fade")])
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.read(_e, "x1"), _S.read(_e, "y1"), _S.read(_e, "col"), _S.read(_e, "fade")])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "h"), 0.25), func(): return _S.binary("<", _S.binary("%", _S.binary("|", _S.read(_e, "d"), 0), 6), 2))):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x1"), _S.read(_e, "y1"), 6, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.binary("*", 0.2, _S.read(_e, "h")), _S.read(_e, "fade"))])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "th"), _S.binary("+", 0.4, _S.binary("/", _S.binary("*", 0.6, _S.read(_e, "u")), _S.read(_e, "U1"))))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "RAISE")), _S.read(_e, "SWING"))])])

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	return _S.binary("+", _S.read(_e, "RAISE"), _S.binary("*", _S.read(_e, "SWING"), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "f")])])))
