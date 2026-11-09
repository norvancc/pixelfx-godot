@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/earth-spike.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "stoneShape", _S.import_value("fx/nature/_lib.js", "stoneShape"))
	_S.define(_e, "drawRock", _S.import_value("fx/nature/_lib.js", "drawRock"))
	_S.define(_e, "drawSpike", _S.import_value("fx/nature/_lib.js", "drawSpike"))
	_S.define(_e, "spikeLook", _S.import_value("fx/nature/_lib.js", "spikeLook"))
	_S.define(_e, "spikeCrack", _S.import_value("fx/nature/_lib.js", "spikeCrack"))
	_S.define(_e, "floorCrack", _S.import_value("fx/nature/_lib.js", "floorCrack"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Earth spike"}, {"desc": "The floor cracks with light and heaves, a faceted stone spike rams up with two side shards in a burst of chips, grit and dust; rubble rains, then it splits and crumbles."}, {"tags": ["nature", "earth", "stone", "spike", "ground", "attack", "one-shot"]}, {"size": [272, 150]}, {"origin": [136, 132]}, {"duration": 3.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#120c0c", "#251917", "#3b2a24", "#553d31", "#715440", "#8f6e52", "#b8966e", "#e6d0a8"]}, {"glow": ["#4a1a0c", "#a8401a", "#ff8a2a", "#ffd27a", "#fff4d0"]}, {"height": 62}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "UP", 0.34)
	_S.define(_e, "RISE", 0.09)
	_S.define(_e, "CRACK", 1.18)
	_S.define(_e, "SPLIT", 1.5)
	_S.define(_e, "PART", 0.1)
	_S.define(_e, "FALL", 0.42)
	_S.define(_e, "SINK", 0.55)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "glow"), 5]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "S"), 6), _S.call_value(_S.read(_e, "hex"), ["#8c8494"]), 0.45]))
	_S.define(_e, "DUST2", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "S"), 5), _S.call_value(_S.read(_e, "hex"), ["#6c6474"]), 0.4]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "G"), 4), _S.prop(_S.read(_e, "G"), 3), _S.prop(_S.read(_e, "G"), 2), _S.prop(_S.read(_e, "G"), 1)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "spikes", [_S.merge([{"x": _S.binary("*", _S.unary("-", _S.read(_e, "H")), 0.17)}, {"H": _S.binary("*", _S.read(_e, "H"), 0.52)}, {"w": _S.binary("*", _S.read(_e, "H"), 0.22)}, {"lean": _S.binary("*", _S.unary("-", _S.read(_e, "H")), _S.invoke(_S.read(_e, "R"), "range", [0.13, 0.18]))}, {"at": _S.binary("+", _S.read(_e, "UP"), 0.045)}, {"split": _S.binary("-", _S.read(_e, "SPLIT"), 0.1)}, {"back": true}]), _S.merge([{"x": _S.binary("*", _S.read(_e, "H"), 0.18)}, {"H": _S.binary("*", _S.read(_e, "H"), 0.4)}, {"w": _S.binary("*", _S.read(_e, "H"), 0.2)}, {"lean": _S.binary("*", _S.read(_e, "H"), _S.invoke(_S.read(_e, "R"), "range", [0.11, 0.15]))}, {"at": _S.binary("+", _S.read(_e, "UP"), 0.085)}, {"split": _S.binary("+", _S.read(_e, "SPLIT"), 0.08)}, {"back": false}]), _S.merge([{"x": 0}, {"H": _S.read(_e, "H")}, {"w": _S.binary("*", _S.read(_e, "H"), 0.36)}, {"lean": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 2), 2])}, {"at": _S.read(_e, "UP")}, {"split": _S.read(_e, "SPLIT")}, {"back": false}, {"main": true}])])
	for _v0 in _S.array(_S.read(_e, "spikes")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		var _v2 = _S.scope(_v1)
		_S.set_prop(_S.read(_v2, "s"), "look", _S.call_value(_S.read(_v2, "spikeLook"), [_S.read(_v2, "R")]), "=", false)
		_S.set_prop(_S.read(_v2, "s"), "cracks", [_S.call_value(_S.read(_v2, "spikeCrack"), [_S.read(_v2, "R"), _S.invoke(_S.read(_v2, "R"), "range", [0.04, 0.16]), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 0.6), _S.unary("-", 0.1)]), 1]), _S.call_value(_S.read(_v2, "spikeCrack"), [_S.read(_v2, "R"), _S.invoke(_S.read(_v2, "R"), "range", [0.22, 0.4]), _S.invoke(_S.read(_v2, "R"), "range", [0.1, 0.6]), _S.unary("-", 1)]), _S.call_value(_S.read(_v2, "spikeCrack"), [_S.read(_v2, "R"), _S.invoke(_S.read(_v2, "R"), "range", [0.42, 0.58]), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 0.4), 0.4]), _S.invoke(_S.read(_v2, "R"), "sign", [])])], "=", false)
		_S.set_prop(_S.read(_v2, "s"), "up", _S.set_prop(_S.read(_v2, "s"), "split0", false, "=", false), "=", false)
		_S.set_prop(_S.read(_v2, "s"), "cut", _S.invoke(_S.read(_v2, "R"), "range", [0.24, 0.32]), "=", false)
		_S.set_prop(_S.read(_v2, "s"), "top", 1, "=", false)
	_S.define(_e, "cracks", [_S.call_value(_S.read(_e, "floorCrack"), [_S.read(_e, "R"), _S.unary("-", 1), _S.invoke(_S.read(_e, "R"), "range", [34, 44])]), _S.call_value(_S.read(_e, "floorCrack"), [_S.read(_e, "R"), 1, _S.invoke(_S.read(_e, "R"), "range", [34, 44])]), _S.call_value(_S.read(_e, "floorCrack"), [_S.read(_e, "R"), _S.unary("-", 1), _S.invoke(_S.read(_e, "R"), "range", [14, 20])]), _S.call_value(_S.read(_e, "floorCrack"), [_S.read(_e, "R"), 1, _S.invoke(_S.read(_e, "R"), "range", [14, 20])])])
	_S.define(_e, "slabs", _S.invoke([_S.unary("-", 1), 1], "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "rock", _S.function_value(_e, "_f3"))
	_S.define(_e, "t", 0)
	_S.define(_e, "grown", _S.function_value(_e, "_f4"))
	_S.define(_e, "open", _S.function_value(_e, "_f5"))
	_S.define(_e, "heat", _S.function_value(_e, "_f6"))
	_S.define(_e, "gap", _S.function_value(_e, "_f7"))
	_S.define(_e, "tip", _S.function_value(_e, "_f8"))
	_S.define(_e, "topAt", _S.function_value(_e, "_f9"))
	_S.define(_e, "erupt", _S.function_value(_e, "_f10"))
	_S.define(_e, "crumble", _S.function_value(_e, "_f11"))
	_S.define(_e, "drawShard", _S.function_value(_e, "_f12"))
	return _S.merge([{"update": _S.function_value(_e, "_f13")}, {"drawBack": _S.function_value(_e, "_f14")}, {"draw": _S.function_value(_e, "_f15")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "sd", _S.arg(_args, 0))
	return _S.merge([{"sd": _S.read(_e, "sd")}, {"x": _S.binary("*", _S.read(_e, "sd"), _S.invoke(_S.read(_e, "R"), "range", [13, 16]))}, {"pts": [[_S.unary("-", 1.2), _S.unary("-", 0.32)], [1.1, _S.unary("-", 0.42)], [1.2, 0.36], [_S.unary("-", 1.1), 0.4]]}, {"s": _S.invoke(_S.read(_e, "R"), "range", [5.5, 7])}, {"a": _S.binary("*", _S.read(_e, "sd"), _S.invoke(_S.read(_e, "R"), "range", [0.45, 0.65]))}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "bits"), "add", [_S.merge([_S.read(_e, "b"), {"pts": _S.call_value(_S.read(_e, "stoneShape"), [_S.read(_e, "R")])}])])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.prop(_S.read(_e, "s"), "at"))) else _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "s"), "at")), _S.read(_e, "RISE"))]), 2.2]))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.02), 0.24)])])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return (_S.call_value(_S.read(_e, "smooth"), [0, _S.read(_e, "UP"), _S.read(_e, "t")]) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "UP"))) else _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "UP"), _S.binary("+", _S.read(_e, "UP"), 0.9), _S.read(_e, "t")])))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.prop(_S.read(_e, "s"), "split"), _S.binary("+", _S.prop(_S.read(_e, "s"), "split"), _S.read(_e, "PART")), _S.read(_e, "t")]), (3 if _S.truth(_S.prop(_S.read(_e, "s"), "main")) else 2))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.prop(_S.read(_e, "s"), "split"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "s"), "split"), _S.read(_e, "PART")), _S.read(_e, "FALL")), _S.read(_e, "t")]), 0.12), _S.prop(_S.read(_e, "s"), "H"))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "lerp"), [1, _S.prop(_S.read(_e, "s"), "cut"), _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "s"), "split")), 0.04), _S.read(_e, "FALL"))])])])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("/", _S.prop(_S.read(_e, "s"), "H"), _S.read(_e, "H")))
	_S.invoke(_S.read(_e, "lights"), "add", [_S.prop(_S.read(_e, "s"), "x"), _S.binary("*", _S.unary("-", _S.prop(_S.read(_e, "s"), "H")), 0.4), _S.binary("+", _S.binary("*", 30, _S.read(_e, "k")), 14), _S.read(_e, "WHITE"), _S.binary("+", _S.binary("*", 0.5, _S.read(_e, "k")), 0.1), 0.1])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.prop(_S.read(_e, "s"), "x"), _S.unary("-", 10), _S.binary("+", _S.binary("*", 60, _S.read(_e, "k")), 20), _S.prop(_S.read(_e, "G"), 2), _S.binary("*", 0.34, _S.read(_e, "k")), 0.5])
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), _S.binary("+", _S.invoke(_S.read(_v3, "Math"), "round", [_S.binary("*", 16, _S.read(_v3, "k"))]), 3))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v4, "Math"), "PI")), 2), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 1.1), 1.1])))
		_S.define(_v4, "sp", _S.binary("*", _S.invoke(_S.read(_v4, "R"), "range", [140, 360]), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_v4, "k")))))
		_S.call_value(_S.read(_v4, "rock"), [_S.merge([{"kind": _S.prop(_S.read(_v4, "B"), "CHUNK")}, {"x": _S.binary("+", _S.prop(_S.read(_v4, "s"), "x"), _S.invoke(_S.read(_v4, "R"), "range", [_S.binary("/", _S.unary("-", _S.prop(_S.read(_v4, "s"), "w")), 3), _S.binary("/", _S.prop(_S.read(_v4, "s"), "w"), 3)]))}, {"y": _S.unary("-", _S.invoke(_S.read(_v4, "R"), "range", [1, 6]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "sp"))}, {"g": 1}, {"drag": 0.35}, {"bounce": 0.32}, {"life": _S.invoke(_S.read(_v4, "R"), "range", [1.4, 2.4])}, {"a": _S.invoke(_S.read(_v4, "R"), "range", [0, _S.read(_v4, "TAU")])}, {"va": _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.binary("*", _S.invoke(_S.read(_v4, "R"), "range", [1.6, 3.8]), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_v4, "k"))))}])])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), _S.binary("+", _S.invoke(_S.read(_v5, "Math"), "round", [_S.binary("*", 55, _S.read(_v5, "k"))]), 10))):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "u", _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 1), 1]))
		_S.define(_v6, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v6, "Math"), "PI")), 2), _S.binary("*", _S.read(_v6, "u"), 0.9)))
		_S.define(_v6, "sp", _S.binary("*", _S.invoke(_S.read(_v6, "R"), "range", [90, 330]), _S.binary("-", 1, _S.binary("*", 0.35, _S.invoke(_S.read(_v6, "Math"), "abs", [_S.read(_v6, "u")])))))
		_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "GRIT"), _S.binary("+", _S.prop(_S.read(_v6, "s"), "x"), _S.binary("*", _S.binary("*", _S.read(_v6, "u"), _S.prop(_S.read(_v6, "s"), "w")), 0.4)), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.invoke(_S.read(_v6, "R"), "range", [1, 2]), _S.invoke(_S.read(_v6, "R"), "pick", [[_S.prop(_S.read(_v6, "S"), 6), _S.prop(_S.read(_v6, "S"), 5), _S.prop(_S.read(_v6, "S"), 4), _S.prop(_S.read(_v6, "S"), 4), _S.prop(_S.read(_v6, "S"), 3)]]), (2 if _S.truth(_S.invoke(_S.read(_v6, "R"), "chance", [0.4])) else 1)])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	var _v7 = _S.scope(_e)
	_S.define(_v7, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "i"), _S.binary("+", _S.invoke(_S.read(_v7, "Math"), "round", [_S.binary("*", 9, _S.read(_v7, "k"))]), 2))):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v8, "Math"), "PI")), 2), _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 1.2), 1.2])))
		_S.define(_v8, "sp", _S.invoke(_S.read(_v8, "R"), "range", [160, 380]))
		_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "SPARK"), _S.prop(_S.read(_v8, "s"), "x"), _S.unary("-", _S.invoke(_S.read(_v8, "R"), "range", [2, 10])), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), _S.invoke(_S.read(_v8, "R"), "range", [0.15, 0.4])])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "i", 1, "+=", true)
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), _S.binary("+", _S.invoke(_S.read(_v9, "Math"), "round", [_S.binary("*", 10, _S.read(_v9, "k"))]), 3))):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "sd", _S.invoke(_S.read(_v10, "R"), "sign", []))
		_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "SMOKE"), _S.binary("+", _S.prop(_S.read(_v10, "s"), "x"), _S.binary("*", _S.read(_v10, "sd"), _S.invoke(_S.read(_v10, "R"), "range", [2, 10]))), _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [1, 4])), _S.binary("*", _S.binary("*", _S.read(_v10, "sd"), _S.invoke(_S.read(_v10, "R"), "range", [50, 170])), _S.binary("+", 0.5, _S.binary("*", 0.5, _S.read(_v10, "k")))), _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [3, 16])), _S.invoke(_S.read(_v10, "R"), "range", [0.9, 1.6]), (_S.read(_v10, "DUST") if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.5])) else _S.read(_v10, "DUST2")), _S.binary("*", _S.invoke(_S.read(_v10, "R"), "range", [3, 5.5]), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_v10, "k")))), _S.invoke(_S.read(_v10, "R"), "range", [0, 0.05]), _S.prop(_S.read(_v10, "PF"), "BIG")])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), _S.binary("+", _S.invoke(_S.read(_v11, "Math"), "round", [_S.binary("*", 14, _S.read(_v11, "k"))]), 4))):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "sd", _S.invoke(_S.read(_v12, "R"), "sign", []))
		_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v12, "s"), "x"), _S.binary("*", _S.read(_v12, "sd"), _S.invoke(_S.read(_v12, "R"), "range", [0, 8]))), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [0, 3])), _S.binary("*", _S.read(_v12, "sd"), _S.invoke(_S.read(_v12, "R"), "range", [40, 160])), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [2, 20])), _S.invoke(_S.read(_v12, "R"), "range", [0.5, 1]), (_S.read(_v12, "DUST") if _S.truth(_S.invoke(_S.read(_v12, "R"), "chance", [0.5])) else _S.read(_v12, "DUST2")), _S.invoke(_S.read(_v12, "R"), "range", [1.5, 3.2])])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "+=", true)
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), _S.binary("+", _S.invoke(_S.read(_v13, "Math"), "round", [_S.binary("*", 3, _S.read(_v13, "k"))]), 1))):
		_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "SMOKE"), _S.binary("+", _S.prop(_S.read(_v13, "s"), "x"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 6), 6])), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [2, 12])), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [15, 45])), _S.invoke(_S.read(_v13, "R"), "range", [1, 1.6]), _S.read(_v13, "DUST"), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v13, "R"), "range", [4, 6]), _S.read(_v13, "k")), 2), _S.invoke(_S.read(_v13, "R"), "range", [0.02, 0.12]), _S.prop(_S.read(_v13, "PF"), "BIG")])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	if _S.truth(_S.prop(_S.read(_e, "s"), "main")):
		var _v14 = _S.scope(_e)
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 3)):
			_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v15, "s"), "x"), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 5), 5])), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [10, _S.binary("*", _S.prop(_S.read(_v15, "s"), "H"), 0.9)])), 0, _S.unary("-", 3), _S.invoke(_S.read(_v15, "R"), "range", [0.25, 0.5]), _S.prop(_S.read(_v15, "S"), 7), _S.invoke(_S.read(_v15, "R"), "range", [1, 2.2]), _S.invoke(_S.read(_v15, "R"), "range", [0.1, 0.4])])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
		var _v16 = _S.scope(_v14)
		_S.define(_v16, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v16, "i"), 14)):
			_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "GRIT"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 60), 60]), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [110, 125])), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 15), 15]), _S.invoke(_S.read(_v16, "R"), "range", [10, 60]), _S.invoke(_S.read(_v16, "R"), "range", [1.2, 1.8]), _S.invoke(_S.read(_v16, "R"), "pick", [[_S.prop(_S.read(_v16, "S"), 5), _S.prop(_S.read(_v16, "S"), 4), _S.prop(_S.read(_v16, "S"), 3)]]), (2 if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.35])) else 1), _S.invoke(_S.read(_v16, "R"), "range", [0.25, 0.9])])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "u0", _S.arg(_args, 1))
	_S.define(_e, "u1", _S.arg(_args, 2))
	_S.define(_e, "g", _S.call_value(_S.read(_e, "gap"), [_S.read(_e, "s")]))
	_S.define(_e, "lean", _S.prop(_S.read(_e, "s"), "lean"))
	_S.define(_e, "tp", _S.call_value(_S.read(_e, "tip"), [_S.read(_e, "s")]))
	for _v17 in _S.array([_S.unary("-", 1), 1]):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "half", _v17)
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "u", _S.binary("/", _S.binary("+", _S.read(_v19, "u0"), _S.read(_v19, "u1")), 2))
		_S.define(_v19, "hw", _S.binary("*", _S.binary("/", _S.prop(_S.read(_v19, "s"), "w"), 2), _S.invoke(_S.read(_v19, "Math"), "pow", [_S.binary("-", 1, _S.read(_v19, "u")), 0.85])))
		_S.define(_v19, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v19, "s"), "x"), _S.binary("*", _S.read(_v19, "lean"), _S.read(_v19, "u"))), _S.binary("*", _S.read(_v19, "half"), _S.binary("+", _S.binary("+", _S.binary("/", _S.read(_v19, "g"), 2), _S.binary("*", _S.read(_v19, "hw"), 0.45)), _S.binary("*", _S.read(_v19, "tp"), _S.read(_v19, "u"))))))
		_S.define(_v19, "y", _S.binary("*", _S.unary("-", _S.read(_v19, "u")), _S.prop(_S.read(_v19, "s"), "H")))
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v19, "hw"), 0.8), func(): return _S.binary(">", _S.read(_v19, "half"), 0))):
			continue
		_S.call_value(_S.read(_v19, "rock"), [_S.merge([{"kind": _S.prop(_S.read(_v19, "B"), "CHUNK")}, {"x": _S.read(_v19, "x")}, {"y": _S.read(_v19, "y")}, {"vx": _S.binary("+", _S.binary("*", _S.read(_v19, "half"), _S.invoke(_S.read(_v19, "R"), "range", [8, 40])), _S.binary("*", _S.read(_v19, "lean"), 0.6))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [0, 50]))}, {"g": 1}, {"drag": 0.3}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v19, "Math"), "min", [_S.invoke(_S.read(_v19, "R"), "range", [1.1, 1.6]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v19, "meta"), "duration"), 0.15), _S.read(_v19, "t"))])}, {"a": _S.invoke(_S.read(_v19, "R"), "range", [0, _S.read(_v19, "TAU")])}, {"va": _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 8), 8])}, {"s": _S.call_value(_S.read(_v19, "clamp"), [_S.binary("*", _S.read(_v19, "hw"), 0.62), 1.6, 4.8])}])])
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 3)):
			_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "GRIT"), _S.binary("+", _S.read(_v20, "x"), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("+", _S.read(_v20, "y"), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("*", _S.read(_v20, "half"), _S.invoke(_S.read(_v20, "R"), "range", [5, 45])), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [10, 70])), _S.invoke(_S.read(_v20, "R"), "range", [0.9, 1.6]), _S.invoke(_S.read(_v20, "R"), "pick", [[_S.prop(_S.read(_v20, "S"), 6), _S.prop(_S.read(_v20, "S"), 5), _S.prop(_S.read(_v20, "S"), 4), _S.prop(_S.read(_v20, "S"), 3)]]), (2 if _S.truth(_S.invoke(_S.read(_v20, "R"), "chance", [0.35])) else 1)])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
	if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "DUST"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "s"), "x"), _S.binary("*", _S.read(_e, "lean"), _S.read(_e, "u1"))), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 4), 4])), _S.binary("*", _S.unary("-", _S.read(_e, "u1")), _S.prop(_S.read(_e, "s"), "H")), _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), _S.invoke(_S.read(_e, "R"), "range", [15, 45])), _S.invoke(_S.read(_e, "R"), "range", [20, 60]), _S.invoke(_S.read(_e, "R"), "range", [0.35, 0.6]), _S.read(_e, "DUST"), _S.invoke(_S.read(_e, "R"), "range", [2, 3.5])])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "g", _S.call_value(_S.read(_e, "grown"), [_S.read(_e, "s")]))
	if _S.truth(_S.binary("<=", _S.read(_e, "g"), 0)):
		return null
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.prop(_S.read(_e, "s"), "split"))):
		var _v21 = _S.scope(_e)
		_S.define(_v21, "white", _S.logical("||", _S.binary("<", _S.binary("-", _S.read(_v21, "t"), _S.prop(_S.read(_v21, "s"), "at")), 0.04), func(): return _S.binary(">", _S.read(_v21, "t"), _S.binary("-", _S.prop(_S.read(_v21, "s"), "split"), 0.045))))
		_S.define(_v21, "crack", _S.call_value(_S.read(_v21, "smooth"), [_S.binary("+", _S.read(_v21, "CRACK"), (0 if _S.truth(_S.prop(_S.read(_v21, "s"), "main")) else 0.05)), _S.binary("-", _S.prop(_S.read(_v21, "s"), "split"), 0.03), _S.read(_v21, "t")]))
		_S.define(_v21, "sw", _S.binary("-", _S.binary("*", _S.binary("-", _S.read(_v21, "t"), _S.prop(_S.read(_v21, "s"), "at")), 0.9), 0.15))
		_S.define(_v21, "glint", (_S.binary("/", _S.binary("%", _S.read(_v21, "sw"), 1.2), 0.55) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v21, "sw"), 0), func(): return _S.binary("<", _S.binary("%", _S.read(_v21, "sw"), 1.2), 0.55))) else _S.unary("-", 1)))
		_S.call_value(_S.read(_v21, "drawSpike"), [_S.read(_v21, "p"), _S.prop(_S.read(_v21, "s"), "x"), 0, _S.binary("*", _S.prop(_S.read(_v21, "s"), "H"), _S.read(_v21, "g")), _S.prop(_S.read(_v21, "s"), "w"), _S.binary("*", _S.prop(_S.read(_v21, "s"), "lean"), _S.invoke(_S.read(_v21, "Math"), "min", [1, _S.read(_v21, "g")])), _S.prop(_S.read(_v21, "s"), "look"), _S.read(_v21, "S"), _S.merge([{"white": _S.read(_v21, "white")}, {"glint": _S.read(_v21, "glint")}, {"cracks": _S.prop(_S.read(_v21, "s"), "cracks")}, {"crack": _S.read(_v21, "crack")}, {"heat": _S.call_value(_S.read(_v21, "smooth"), [_S.read(_v21, "CRACK"), _S.prop(_S.read(_v21, "s"), "split"), _S.read(_v21, "t")])}, {"glowRamp": _S.read(_v21, "G")}])])
		return null
	_S.define(_e, "top", _S.call_value(_S.read(_e, "topAt"), [_S.read(_e, "s")]))
	_S.define(_e, "gp", _S.call_value(_S.read(_e, "gap"), [_S.read(_e, "s")]))
	_S.define(_e, "tp", _S.call_value(_S.read(_e, "tip"), [_S.read(_e, "s")]))
	_S.define(_e, "sink", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.prop(_S.read(_e, "s"), "split"), _S.read(_e, "FALL")), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "s"), "split"), _S.read(_e, "FALL")), _S.read(_e, "SINK")), _S.read(_e, "t")]), _S.prop(_S.read(_e, "s"), "H")), _S.binary("+", _S.prop(_S.read(_e, "s"), "cut"), 0.06)))
	if _S.truth(_S.binary(">=", _S.read(_e, "sink"), _S.binary("*", _S.prop(_S.read(_e, "s"), "H"), _S.binary("+", _S.prop(_S.read(_e, "s"), "cut"), 0.05)))):
		return null
	for _v22 in _S.array([_S.unary("-", 1), 1]):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "half", _v22)
		_S.call_value(_S.read(_v23, "drawSpike"), [_S.read(_v23, "p"), _S.binary("+", _S.prop(_S.read(_v23, "s"), "x"), _S.binary("/", _S.binary("*", _S.read(_v23, "half"), _S.read(_v23, "gp")), 2)), _S.read(_v23, "sink"), _S.prop(_S.read(_v23, "s"), "H"), _S.prop(_S.read(_v23, "s"), "w"), _S.binary("+", _S.prop(_S.read(_v23, "s"), "lean"), _S.binary("*", _S.read(_v23, "half"), _S.read(_v23, "tp"))), _S.prop(_S.read(_v23, "s"), "look"), _S.read(_v23, "S"), _S.merge([{"half": _S.read(_v23, "half")}, {"clip": _S.read(_v23, "top")}, {"floor": 0}, {"cracks": _S.prop(_S.read(_v23, "s"), "cracks")}, {"crack": 1}, {"heat": _S.binary("-", 1, _S.call_value(_S.read(_v23, "smooth"), [_S.prop(_S.read(_v23, "s"), "split"), _S.binary("+", _S.prop(_S.read(_v23, "s"), "split"), 0.45), _S.read(_v23, "t")]))}, {"glowRamp": _S.read(_v23, "G")}])])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "dt"), 120)]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "UP"))):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "L", _S.call_value(_S.read(_v24, "open"), []))
		for _v25 in _S.array(_S.read(_v24, "cracks")):
			var _v26 = _S.scope(_v24)
			_S.define(_v26, "c", _v25)
			if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [_S.binary("*", 0.35, _S.read(_v26, "f"))])):
				var _v27 = _S.scope(_v26)
				_S.define(_v27, "q", _S.prop(_S.read(_v27, "c"), _S.invoke(_S.read(_v27, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_v27, "c"), "length"), 1), _S.invoke(_S.read(_v27, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_v27, "R"), "range", [0, _S.read(_v27, "L")]), _S.prop(_S.read(_v27, "c"), "length"))])])))
				_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "GRIT"), _S.prop(_S.read(_v27, "q"), 0), _S.unary("-", 1), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [30, 110])), _S.invoke(_S.read(_v27, "R"), "range", [0.5, 1]), _S.invoke(_S.read(_v27, "R"), "pick", [[_S.prop(_S.read(_v27, "S"), 5), _S.prop(_S.read(_v27, "S"), 4)]]), 1])
				if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.25])):
					_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "DUST"), _S.prop(_S.read(_v27, "q"), 0), _S.unary("-", 1), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [4, 14])), _S.invoke(_S.read(_v27, "R"), "range", [0.3, 0.6]), _S.read(_v27, "DUST2"), _S.invoke(_S.read(_v27, "R"), "range", [1.5, 3])])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v24, "t"), 0.12), func(): return _S.invoke(_S.read(_v24, "R"), "chance", [_S.binary("*", 0.2, _S.read(_v24, "f"))]))):
			_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "DUST"), _S.binary("*", _S.invoke(_S.read(_v24, "R"), "sign", []), _S.invoke(_S.read(_v24, "R"), "range", [10, 16])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [1, 4])), _S.binary("*", _S.invoke(_S.read(_v24, "R"), "sign", []), _S.invoke(_S.read(_v24, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [4, 12])), _S.invoke(_S.read(_v24, "R"), "range", [0.4, 0.7]), _S.read(_v24, "DUST2"), _S.invoke(_S.read(_v24, "R"), "range", [2, 3.5])])
	for _v28 in _S.array(_S.read(_e, "spikes")):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "s", _v28)
		var _v30 = _S.scope(_v29)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v30, "s"), "up")), func(): return _S.binary(">=", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "s"), "at")))):
			_S.last([_S.set_prop(_S.read(_v30, "s"), "up", true, "=", false), _S.call_value(_S.read(_v30, "erupt"), [_S.read(_v30, "s")])])
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v30, "s"), "split0")), func(): return _S.binary(">=", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "s"), "split")))):
			var _v31 = _S.scope(_v30)
			_S.set_prop(_S.read(_v31, "s"), "split0", true, "=", false)
			_S.invoke(_S.read(_v31, "lights"), "add", [_S.prop(_S.read(_v31, "s"), "x"), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v31, "s"), "H")), 0.5), 30, _S.read(_v31, "WHITE"), 0.3, 0.08])
			_S.invoke(_S.read(_v31, "ps"), "spawn", [_S.prop(_S.read(_v31, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v31, "s"), "x"), _S.binary("*", _S.prop(_S.read(_v31, "s"), "lean"), 0.5)), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v31, "s"), "H")), 0.55), 0, _S.unary("-", 2), 0.3, _S.prop(_S.read(_v31, "S"), 7), 2.5])
		if _S.truth(_S.binary(">=", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "s"), "split"))):
			var _v32 = _S.scope(_v30)
			_S.define(_v32, "top", _S.call_value(_S.read(_v32, "topAt"), [_S.read(_v32, "s")]))
			while _S.truth(_S.logical("||", _S.binary(">", _S.binary("-", _S.prop(_S.read(_v32, "s"), "top"), _S.read(_v32, "top")), 0.045), func(): return _S.logical("&&", _S.binary("<=", _S.read(_v32, "top"), _S.binary("+", _S.prop(_S.read(_v32, "s"), "cut"), 0.000001)), func(): return _S.binary(">", _S.prop(_S.read(_v32, "s"), "top"), _S.binary("+", _S.prop(_S.read(_v32, "s"), "cut"), 0.000001))))):
				var _v33 = _S.scope(_v32)
				_S.define(_v33, "u1", _S.prop(_S.read(_v33, "s"), "top"))
				_S.define(_v33, "u0", _S.invoke(_S.read(_v33, "Math"), "max", [_S.read(_v33, "top"), _S.binary("-", _S.prop(_S.read(_v33, "s"), "top"), 0.11)]))
				_S.call_value(_S.read(_v33, "crumble"), [_S.read(_v33, "s"), _S.read(_v33, "u0"), _S.read(_v33, "u1")])
				_S.set_prop(_S.read(_v33, "s"), "top", _S.read(_v33, "u0"), "=", false)
				if _S.truth(_S.binary("<=", _S.read(_v33, "u0"), _S.binary("+", _S.prop(_S.read(_v33, "s"), "cut"), 0.000001))):
					break
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "s"), "split")), func(): return _S.binary(">", _S.read(_v30, "t"), _S.read(_v30, "CRACK"))), func(): return _S.invoke(_S.read(_v30, "R"), "chance", [_S.binary("*", 0.12, _S.read(_v30, "f"))]))):
			var _v34 = _S.scope(_v30)
			_S.define(_v34, "u", _S.invoke(_S.read(_v34, "R"), "range", [0.1, 0.7]))
			_S.invoke(_S.read(_v34, "ps"), "spawn", [_S.prop(_S.read(_v34, "P"), "GRIT"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v34, "s"), "x"), _S.binary("*", _S.prop(_S.read(_v34, "s"), "lean"), _S.read(_v34, "u"))), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("*", _S.unary("-", _S.read(_v34, "u")), _S.prop(_S.read(_v34, "s"), "H")), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v34, "R"), "range", [0, 20])), _S.invoke(_S.read(_v34, "R"), "range", [0.6, 1.1]), _S.invoke(_S.read(_v34, "R"), "pick", [[_S.prop(_S.read(_v34, "S"), 5), _S.prop(_S.read(_v34, "S"), 4)]]), 1])
			if _S.truth(_S.invoke(_S.read(_v34, "R"), "chance", [0.3])):
				_S.invoke(_S.read(_v34, "ps"), "spawn", [_S.prop(_S.read(_v34, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v34, "s"), "x"), _S.binary("*", _S.prop(_S.read(_v34, "s"), "lean"), _S.read(_v34, "u"))), _S.binary("*", _S.unary("-", _S.read(_v34, "u")), _S.prop(_S.read(_v34, "s"), "H")), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v34, "R"), "range", [2, 8])), _S.invoke(_S.read(_v34, "R"), "range", [0.4, 0.7]), _S.read(_v34, "DUST"), _S.invoke(_S.read(_v34, "R"), "range", [1.5, 2.5])])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v30, "s"), "up"), func(): return _S.binary("<", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "s"), "split"))), func(): return _S.binary(">", _S.read(_v30, "t"), _S.binary("+", _S.prop(_S.read(_v30, "s"), "at"), 0.2))), func(): return _S.invoke(_S.read(_v30, "R"), "chance", [_S.binary("*", 0.05, _S.read(_v30, "f"))]))):
			var _v35 = _S.scope(_v30)
			_S.define(_v35, "u", _S.invoke(_S.read(_v35, "R"), "range", [0.2, 0.8]))
			_S.define(_v35, "sd", _S.invoke(_S.read(_v35, "R"), "sign", []))
			_S.invoke(_S.read(_v35, "ps"), "spawn", [_S.prop(_S.read(_v35, "P"), "GRIT"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v35, "s"), "x"), _S.binary("*", _S.prop(_S.read(_v35, "s"), "lean"), _S.read(_v35, "u"))), _S.binary("*", _S.binary("*", _S.read(_v35, "sd"), _S.binary("/", _S.prop(_S.read(_v35, "s"), "w"), 2)), _S.binary("-", 1, _S.read(_v35, "u")))), _S.binary("*", _S.unary("-", _S.read(_v35, "u")), _S.prop(_S.read(_v35, "s"), "H")), _S.binary("*", _S.read(_v35, "sd"), _S.invoke(_S.read(_v35, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [0, 15])), _S.invoke(_S.read(_v35, "R"), "range", [0.7, 1.2]), _S.invoke(_S.read(_v35, "R"), "pick", [[_S.prop(_S.read(_v35, "S"), 6), _S.prop(_S.read(_v35, "S"), 5)]]), 1])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v30, "s"), "main"), func(): return _S.prop(_S.read(_v30, "s"), "up")), func(): return _S.binary("<", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "s"), "split"))), func(): return _S.binary(">", _S.read(_v30, "t"), _S.binary("+", _S.prop(_S.read(_v30, "s"), "at"), 0.25))), func(): return _S.invoke(_S.read(_v30, "R"), "chance", [_S.binary("*", 0.03, _S.read(_v30, "f"))]))):
			_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v30, "s"), "x"), _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 4), 2])), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [8, _S.binary("*", _S.prop(_S.read(_v30, "s"), "H"), 0.85)])), 0, _S.unary("-", 2), _S.invoke(_S.read(_v30, "R"), "range", [0.25, 0.45]), (_S.prop(_S.read(_v30, "S"), 7) if _S.truth(_S.invoke(_S.read(_v30, "R"), "chance", [0.5])) else _S.prop(_S.read(_v30, "G"), 3)), _S.invoke(_S.read(_v30, "R"), "range", [0.8, 2])])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v30, "t"), _S.binary("+", _S.prop(_S.read(_v30, "s"), "split"), _S.read(_v30, "FALL"))), func(): return _S.binary("<", _S.read(_v30, "t"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v30, "s"), "split"), _S.read(_v30, "FALL")), _S.binary("*", _S.read(_v30, "SINK"), 0.8)))), func(): return _S.invoke(_S.read(_v30, "R"), "chance", [_S.binary("*", 0.15, _S.read(_v30, "f"))]))):
			_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v30, "s"), "x"), _S.invoke(_S.read(_v30, "R"), "range", [_S.binary("/", _S.unary("-", _S.prop(_S.read(_v30, "s"), "w")), 2), _S.binary("/", _S.prop(_S.read(_v30, "s"), "w"), 2)])), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [0, 2])), _S.binary("*", _S.invoke(_S.read(_v30, "R"), "sign", []), _S.invoke(_S.read(_v30, "R"), "range", [20, 60])), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [0, 5])), _S.invoke(_S.read(_v30, "R"), "range", [0.4, 0.7]), _S.read(_v30, "DUST2"), _S.invoke(_S.read(_v30, "R"), "range", [1.5, 3])])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v36 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v37 = _S.scope(_e)
		_S.define(_v37, "b", _v36)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v37, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v37, "b"), "dusted")))):
			var _v38 = _S.scope(_v37)
			_S.set_prop(_S.read(_v38, "b"), "dusted", true, "=", false)
			var _v39 = _S.scope(_v38)
			_S.define(_v39, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v39, "i"), 2)):
				_S.invoke(_S.read(_v39, "ps"), "spawn", [_S.prop(_S.read(_v39, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v39, "b"), "x"), _S.invoke(_S.read(_v39, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v39, "R"), "sign", []), _S.invoke(_S.read(_v39, "R"), "range", [8, 35])), _S.unary("-", _S.invoke(_S.read(_v39, "R"), "range", [2, 14])), _S.invoke(_S.read(_v39, "R"), "range", [0.3, 0.6]), _S.read(_v39, "DUST2"), _S.invoke(_S.read(_v39, "R"), "range", [1.3, 2.6])])
				_v39 = _S.iteration(_v39)
				_S.write(_v39, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "L", _S.call_value(_S.read(_e, "open"), []))
	_S.define(_e, "hk", _S.call_value(_S.read(_e, "heat"), []))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 1.1), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.3), _S.read(_e, "t")])))
	for _v40 in _S.array(_S.read(_e, "cracks")):
		var _v41 = _S.scope(_e)
		_S.define(_v41, "c", _v40)
		var _v42 = _S.scope(_v41)
		_S.define(_v42, "m", _S.invoke(_S.read(_v42, "Math"), "max", [2, _S.invoke(_S.read(_v42, "Math"), "ceil", [_S.binary("*", _S.prop(_S.read(_v42, "c"), "length"), _S.read(_v42, "L"))])]))
		var _v43 = _S.scope(_v42)
		_S.define(_v43, "k", 1)
		while _S.truth(_S.binary("<", _S.read(_v43, "k"), _S.read(_v43, "m"))):
			var _v44 = _S.scope(_v43)
			var _v45 = _S.prop(_S.read(_v44, "c"), _S.binary("-", _S.read(_v44, "k"), 1))
			_S.define(_v44, "x0", _S.prop(_v45, 0))
			_S.define(_v44, "y0", _S.prop(_v45, 1))
			var _v46 = _S.prop(_S.read(_v44, "c"), _S.read(_v44, "k"))
			_S.define(_v44, "x1", _S.prop(_v46, 0))
			_S.define(_v44, "y1", _S.prop(_v46, 1))
			_S.invoke(_S.read(_v44, "p"), "line", [_S.read(_v44, "x0"), _S.binary("+", _S.read(_v44, "y0"), 1), _S.read(_v44, "x1"), _S.binary("+", _S.read(_v44, "y1"), 1), _S.prop(_S.read(_v44, "S"), 0), _S.read(_v44, "fade")])
			_S.invoke(_S.read(_v44, "p"), "line", [_S.read(_v44, "x0"), _S.read(_v44, "y0"), _S.read(_v44, "x1"), _S.read(_v44, "y1"), (_S.prop(_S.read(_v44, "G"), 4) if _S.truth(_S.binary(">", _S.read(_v44, "hk"), 0.65)) else (_S.prop(_S.read(_v44, "G"), 3) if _S.truth(_S.binary(">", _S.read(_v44, "hk"), 0.35)) else (_S.prop(_S.read(_v44, "G"), 2) if _S.truth(_S.binary(">", _S.read(_v44, "hk"), 0.12)) else (_S.prop(_S.read(_v44, "G"), 1) if _S.truth(_S.binary(">", _S.read(_v44, "hk"), 0.03)) else _S.prop(_S.read(_v44, "S"), 1))))), _S.read(_v44, "fade")])
			if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v44, "k"), 2), 0)):
				_S.invoke(_S.read(_v44, "p"), "glow", [_S.read(_v44, "x1"), _S.read(_v44, "y1"), 6, _S.prop(_S.read(_v44, "G"), 2), _S.binary("*", 0.3, _S.read(_v44, "hk"))])
			_v43 = _S.iteration(_v43)
			_S.write(_v43, "k", 1, "+=", true)
	if _S.truth(_S.binary(">", _S.read(_e, "hk"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 3), 26, _S.prop(_S.read(_e, "G"), 2), _S.binary("*", 0.35, _S.read(_e, "hk"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	for _v47 in _S.array(_S.read(_e, "spikes")):
		var _v48 = _S.scope(_e)
		_S.define(_v48, "s", _v47)
		if _S.truth(_S.prop(_S.read(_v48, "s"), "back")):
			_S.call_value(_S.read(_v48, "drawShard"), [_S.read(_v48, "p"), _S.read(_v48, "s")])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "UP"), 0.02))):
		var _v49 = _S.scope(_e)
		_S.define(_v49, "k", _S.call_value(_S.read(_v49, "smooth"), [0.06, _S.read(_v49, "UP"), _S.read(_v49, "t")]))
		_S.define(_v49, "hm", _S.binary("*", 8, _S.read(_v49, "k")))
		_S.define(_v49, "jx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v49, "Math"), "sin", [_S.binary("*", _S.read(_v49, "t"), 95)]), 0.8), _S.read(_v49, "k")))
		if _S.truth(_S.binary(">", _S.read(_v49, "hm"), 0.6)):
			_S.invoke(_S.read(_v49, "p"), "shade", [_S.unary("-", 16), _S.binary("-", _S.unary("-", _S.read(_v49, "hm")), 1), 16, 1, _S.function_value(_v49, "_f16")])
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "UP"))):
		var _v50 = _S.scope(_e)
		_S.define(_v50, "sink", _S.binary("*", _S.call_value(_S.read(_v50, "smooth"), [_S.binary("+", _S.read(_v50, "SPLIT"), _S.read(_v50, "FALL")), _S.binary("+", _S.binary("+", _S.read(_v50, "SPLIT"), _S.read(_v50, "FALL")), _S.read(_v50, "SINK")), _S.read(_v50, "t")]), 7))
		_S.define(_v50, "a", _S.binary("-", 1, _S.call_value(_S.read(_v50, "smooth"), [_S.binary("+", _S.read(_v50, "SPLIT"), _S.read(_v50, "FALL")), _S.binary("+", _S.binary("+", _S.read(_v50, "SPLIT"), _S.read(_v50, "FALL")), _S.read(_v50, "SINK")), _S.read(_v50, "t")])))
		for _v51 in _S.array(_S.read(_v50, "slabs")):
			var _v52 = _S.scope(_v50)
			_S.define(_v52, "sl", _v51)
			var _v53 = _S.scope(_v52)
			_S.define(_v53, "g", _S.invoke(_S.read(_v53, "ease"), "outBack", [_S.call_value(_S.read(_v53, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v53, "t"), _S.read(_v53, "UP")), 0.1)]), 2]))
			if _S.truth(_S.binary(">", _S.read(_v53, "a"), 0)):
				_S.call_value(_S.read(_v53, "drawRock"), [_S.read(_v53, "p"), _S.prop(_S.read(_v53, "sl"), "x"), _S.binary("+", _S.unary("-", 1.5), _S.read(_v53, "sink")), _S.binary("*", _S.prop(_S.read(_v53, "sl"), "s"), _S.invoke(_S.read(_v53, "Math"), "min", [1, _S.read(_v53, "g")])), _S.binary("*", _S.prop(_S.read(_v53, "sl"), "a"), _S.read(_v53, "g")), _S.prop(_S.read(_v53, "sl"), "pts"), _S.read(_v53, "S"), _S.read(_v53, "a"), _S.binary("<", _S.binary("-", _S.read(_v53, "t"), _S.read(_v53, "UP")), 0.04)])
	for _v54 in _S.array(_S.read(_e, "spikes")):
		var _v55 = _S.scope(_e)
		_S.define(_v55, "s", _v54)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v55, "s"), "back"))):
			_S.call_value(_S.read(_v55, "drawShard"), [_S.read(_v55, "p"), _S.read(_v55, "s")])
	_S.define(_e, "m0", _S.prop(_S.read(_e, "spikes"), 2))
	_S.define(_e, "leak", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "CRACK"), _S.read(_e, "SPLIT"), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "SPLIT"), _S.binary("+", _S.read(_e, "SPLIT"), 0.5), _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "leak"), 0)):
		_S.invoke(_S.read(_e, "p"), "glowLine", [_S.prop(_S.read(_e, "m0"), "x"), _S.unary("-", 4), _S.binary("+", _S.prop(_S.read(_e, "m0"), "x"), _S.binary("*", _S.prop(_S.read(_e, "m0"), "lean"), 0.6)), _S.binary("*", _S.unary("-", _S.prop(_S.read(_e, "m0"), "H")), 0.6), 20, _S.prop(_S.read(_e, "G"), 2), _S.binary("*", 0.22, _S.read(_e, "leak"))])
	for _v56 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v57 = _S.scope(_e)
		_S.define(_v57, "b", _v56)
		_S.call_value(_S.read(_v57, "drawRock"), [_S.read(_v57, "p"), _S.prop(_S.read(_v57, "b"), "x"), _S.prop(_S.read(_v57, "b"), "y"), _S.prop(_S.read(_v57, "b"), "s"), _S.prop(_S.read(_v57, "b"), "a"), _S.prop(_S.read(_v57, "b"), "pts"), _S.read(_v57, "S"), _S.invoke(_S.read(_v57, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v57, "b"), "life"), 0.4)])])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.define(_e, "m", _S.prop(_S.read(_e, "spikes"), 2))
	_S.define(_e, "e", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "m"), "at")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "e"), 0), func(): return _S.binary("<", _S.read(_e, "e"), 0.2))):
		var _v58 = _S.scope(_e)
		_S.define(_v58, "g", _S.invoke(_S.read(_v58, "ease"), "outBack", [_S.call_value(_S.read(_v58, "clamp"), [_S.binary("/", _S.read(_v58, "e"), _S.read(_v58, "RISE"))]), 2.2]))
		_S.call_value(_S.read(_v58, "sparkle"), [_S.read(_v58, "p"), _S.binary("+", _S.prop(_S.read(_v58, "m"), "x"), _S.prop(_S.read(_v58, "m"), "lean")), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v58, "m"), "H")), _S.read(_v58, "g")), _S.binary("*", 10, _S.binary("-", 1, _S.binary("/", _S.read(_v58, "e"), 0.2))), _S.prop(_S.read(_v58, "S"), 7), _S.prop(_S.read(_v58, "G"), 3), 0.5])
		_S.invoke(_S.read(_v58, "p"), "glowLine", [_S.prop(_S.read(_v58, "m"), "x"), 0, _S.binary("+", _S.prop(_S.read(_v58, "m"), "x"), _S.prop(_S.read(_v58, "m"), "lean")), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v58, "m"), "H")), _S.read(_v58, "g")), 10, _S.prop(_S.read(_v58, "G"), 3), _S.binary("*", 0.3, _S.binary("-", 1, _S.binary("/", _S.read(_v58, "e"), 0.2)))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "jx")), 15))
	_S.define(_e, "dy", _S.binary("/", _S.read(_e, "y"), _S.read(_e, "hm")))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy"))))
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "y"), 0.5), func(): return _S.binary(">", _S.read(_e, "d"), 1.18))):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "S"), 0) if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)) else (_S.prop(_S.read(_e, "S"), 6) if _S.truth(_S.binary("<", _S.read(_e, "dy"), _S.unary("-", 0.72))) else (_S.prop(_S.read(_e, "S"), 5) if _S.truth(_S.binary("<", _S.read(_e, "dx"), _S.unary("-", 0.3))) else (_S.prop(_S.read(_e, "S"), 3) if _S.truth(_S.binary(">", _S.read(_e, "dx"), 0.35)) else _S.prop(_S.read(_e, "S"), 4))))), "=", false)
	return null
