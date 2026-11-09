@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/ice-shatter.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Panes", _S.import_value("fx/ice/_lib.js", "Panes"))
	_S.define(_e, "endBy", _S.import_value("fx/ice/_lib.js", "endBy"))
	_S.define(_e, "inPoly", _S.import_value("fx/ice/_lib.js", "inPoly"))
	_S.define(_e, "centroid", _S.import_value("fx/ice/_lib.js", "centroid"))
	_S.define(_e, "splitPoly", _S.import_value("fx/ice/_lib.js", "splitPoly"))
	_S.define(_e, "fractures", _S.import_value("fx/ice/_lib.js", "fractures"))
	_S.define(_e, "drawFractures", _S.import_value("fx/ice/_lib.js", "drawFractures"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Ice shatter"}, {"desc": "A block of ice takes a hit from the left: it jolts, cracks race over its faces, it flashes white and bursts into chunks that tumble, bounce and skid off in a roll of ice dust."}, {"tags": ["ice", "shatter", "break", "destroy", "impact", "directional", "one-shot"]}, {"size": [224, 112]}, {"origin": [68, 90]}, {"duration": 2.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIT", 0.26)
	_S.define(_e, "CRACK2", 0.4)
	_S.define(_e, "SHIVER", 0.54)
	_S.define(_e, "FLASH", 0.62)
	_S.define(_e, "BURST", 0.68)
	_S.define(_e, "FRONT", [[_S.unary("-", 16), 0], [_S.unary("-", 16), _S.unary("-", 28)], [12, _S.unary("-", 28)], [12, 0]])
	_S.define(_e, "TOP", [[_S.unary("-", 16), _S.unary("-", 28)], [_S.unary("-", 8), _S.unary("-", 34)], [20, _S.unary("-", 34)], [12, _S.unary("-", 28)]])
	_S.define(_e, "SIDE", [[12, 0], [12, _S.unary("-", 28)], [20, _S.unary("-", 34)], [20, _S.unary("-", 6)]])
	_S.define(_e, "SIL", [[_S.unary("-", 16), 0], [_S.unary("-", 16), _S.unary("-", 28)], [_S.unary("-", 8), _S.unary("-", 34)], [20, _S.unary("-", 34)], [20, _S.unary("-", 6)], [12, 0]])
	_S.define(_e, "HIT_AT", [_S.unary("-", 16), _S.unary("-", 15)])
	_S.define(_e, "PLANE", [[_S.unary("-", 16), _S.unary("-", 21)], [_S.unary("-", 5), _S.unary("-", 28)], [3, _S.unary("-", 13)], [_S.unary("-", 16), _S.unary("-", 9)]])
	_S.define(_e, "SHADE", [[5, _S.unary("-", 28)], [12, _S.unary("-", 28)], [12, _S.unary("-", 10)]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "scuffs", [])
	_S.define(_e, "splinter", _S.function_value(_e, "_f2"))
	_S.define(_e, "panes", _S.construct(_S.read(_e, "Panes"), [_S.merge([{"ground": _S.read(_e, "floor")}, {"onLand": _S.function_value(_e, "_f3")}, {"onSkid": _S.function_value(_e, "_f4")}, {"onCrumble": _S.function_value(_e, "_f5")}])]))
	_S.define(_e, "veins", [])
	_S.define(_e, "bubbles", [])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "k"), 3)):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "x", _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 12), 8]))
		_S.define(_v2, "y", _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 24), _S.unary("-", 6)]))
		_S.define(_v2, "a", _S.invoke(_S.read(_v2, "R"), "range", [0, _S.read(_v2, "TAU")]))
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "i"), 9)):
			var _v4 = _S.scope(_v3)
			_S.write(_v4, "a", _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 0.6), 0.6]), "+=", false)
			_S.write(_v4, "x", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), 1.5), "+=", false)
			_S.write(_v4, "y", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), 1.2), "+=", false)
			if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v4, "x"), _S.unary("-", 14)), func(): return _S.binary(">", _S.read(_v4, "x"), 10)), func(): return _S.binary("<", _S.read(_v4, "y"), _S.unary("-", 26))), func(): return _S.binary(">", _S.read(_v4, "y"), _S.unary("-", 2)))):
				break
			_S.invoke(_S.read(_v4, "veins"), "push", [[_S.invoke(_S.read(_v4, "Math"), "floor", [_S.read(_v4, "x")]), _S.invoke(_S.read(_v4, "Math"), "floor", [_S.read(_v4, "y")])]])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "k", 1, "+=", true)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "k"), 5)):
		_S.invoke(_S.read(_v5, "bubbles"), "push", [[_S.invoke(_S.read(_v5, "R"), "int", [_S.unary("-", 12), 8]), _S.invoke(_S.read(_v5, "R"), "int", [_S.unary("-", 23), _S.unary("-", 4)]), (1 if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [0.4])) else 0)]])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "k", 1, "+=", true)
	_S.define(_e, "inside", _S.function_value(_e, "_f6"))
	_S.define(_e, "cracks", _S.call_value(_S.read(_e, "fractures"), [_S.read(_e, "R"), _S.read(_e, "inside"), _S.binary("+", _S.prop(_S.read(_e, "HIT_AT"), 0), 1), _S.prop(_S.read(_e, "HIT_AT"), 1), 4, _S.merge([{"len": 8}, {"a0": _S.unary("-", 0.9)}, {"spread": 1.9}])]))
	_S.define(_e, "cracks2", _S.call_value(_S.read(_e, "fractures"), [_S.read(_e, "R"), _S.read(_e, "inside"), _S.binary("+", _S.prop(_S.read(_e, "HIT_AT"), 0), 1), _S.prop(_S.read(_e, "HIT_AT"), 1), 6, _S.merge([{"len": 18}, {"a0": _S.unary("-", 1.3)}, {"spread": 2.7}, {"fork": 0.16}])]))
	_S.define(_e, "t", 0)
	_S.define(_e, "struck", false)
	_S.define(_e, "burst", false)
	_S.define(_e, "wave2", false)
	_S.define(_e, "white", false)
	_S.define(_e, "jolt", _S.function_value(_e, "_f7"))
	_S.define(_e, "drawBlock", _S.function_value(_e, "_f8"))
	_S.define(_e, "drawFloor", _S.function_value(_e, "_f15"))
	_S.define(_e, "explode", _S.function_value(_e, "_f16"))
	return _S.merge([{"update": _S.function_value(_e, "_f20")}, {"drawBack": _S.function_value(_e, "_f21")}, {"draw": _S.function_value(_e, "_f22")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "n", _S.arg(_args, 3))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.read(_v0, "n"))):
		_S.invoke(_S.read(_v0, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v0, "B"), "SHARD")}, {"x": _S.binary("+", _S.read(_v0, "x"), _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 2), 2]))}, {"y": _S.binary("-", _S.read(_v0, "y"), 1)}, {"vx": _S.binary("+", _S.binary("*", _S.read(_v0, "vx"), 0.6), _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 35), 45]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v0, "R"), "range", [30, 100]))}, {"g": 0.8}, {"drag": 0.6}, {"bounce": 0.35}, {"life": _S.invoke(_S.read(_v0, "R"), "range", [0.4, 0.8])}, {"a": _S.invoke(_S.read(_v0, "R"), "range", [0, _S.read(_v0, "TAU")])}, {"va": _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 18), 18])}, {"s": _S.invoke(_S.read(_v0, "R"), "range", [1.2, 2.4])}, {"c": _S.prop(_S.read(_v0, "C"), _S.invoke(_S.read(_v0, "R"), "int", [4, 7]))}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "v", _S.arg(_args, 3))
	if _S.truth(_S.binary("<", _S.read(_e, "v"), 100)):
		return null
	_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "VAPOUR"), _S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 1), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), 0.3), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 15), 15])), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [2, 10])), _S.invoke(_S.read(_e, "R"), "range", [0.4, 0.7]), _S.prop(_S.read(_e, "C"), 6), _S.invoke(_S.read(_e, "R"), "range", [1.6, 2.8])])
	_S.call_value(_S.read(_e, "splinter"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.prop(_S.read(_e, "q"), "vx"), 2])
	if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.3])):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 3), 0, _S.unary("-", 5), _S.invoke(_S.read(_e, "R"), "range", [0.2, 0.4]), _S.read(_e, "WHITE"), _S.invoke(_S.read(_e, "R"), "range", [0.8, 1.6])])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])):
		_S.invoke(_S.read(_e, "scuffs"), "push", [_S.merge([{"x": _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.read(_e, "x"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1]))])}, {"t": 0}])])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "splinter"), [_S.prop(_S.read(_e, "q"), "x"), 0, _S.prop(_S.read(_e, "q"), "vx"), 3])
	_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "VAPOUR"), _S.prop(_S.read(_e, "q"), "x"), _S.unary("-", 1), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 10), 14]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [2, 6])), _S.invoke(_S.read(_e, "R"), "range", [0.4, 0.7]), _S.prop(_S.read(_e, "C"), 6), _S.invoke(_S.read(_e, "R"), "range", [1.2, 2])])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "inPoly"), [_S.read(_e, "SIL"), _S.read(_e, "x"), _S.read(_e, "y")])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return (2 if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.05)))) else (1 if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.05)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "HIT"), 0.12)))) else ((1 if _S.truth(_S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 40)]), 2)) else 0) if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SHIVER")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "FLASH")))) else 0)))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BURST"))):
		return null
	_S.define(_e, "jx", _S.call_value(_S.read(_e, "jolt"), []))
	_S.define(_e, "wh", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FLASH")))
	_S.define(_e, "sweep", _S.binary("+", _S.unary("-", 40), _S.binary("*", 70, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), 0.04, 0.3]))))
	_S.define(_e, "sh", _S.function_value(_e, "_f9"))
	_S.invoke(_S.read(_e, "p"), "poly", [_S.call_value(_S.read(_e, "sh"), [[[_S.unary("-", 17), 1], [_S.unary("-", 17), _S.unary("-", 28.5)], [_S.unary("-", 8.3), _S.unary("-", 35.2)], [21, _S.unary("-", 35.2)], [21, _S.unary("-", 5.6)], [12.5, 1]]]), _S.prop(_S.read(_e, "C"), 0)])
	if _S.truth(_S.read(_e, "wh")):
		var _v7 = _S.scope(_e)
		_S.invoke(_S.read(_v7, "p"), "poly", [_S.call_value(_S.read(_v7, "sh"), [_S.read(_v7, "SIL")]), _S.read(_v7, "WHITE")])
		return null
	_S.invoke(_S.read(_e, "p"), "poly", [_S.call_value(_S.read(_e, "sh"), [_S.read(_e, "FRONT")]), _S.function_value(_e, "_f11")])
	_S.invoke(_S.read(_e, "p"), "poly", [_S.call_value(_S.read(_e, "sh"), [_S.read(_e, "TOP")]), _S.function_value(_e, "_f12")])
	_S.invoke(_S.read(_e, "p"), "poly", [_S.call_value(_S.read(_e, "sh"), [_S.read(_e, "SIDE")]), _S.function_value(_e, "_f13")])
	for _v8 in _S.array(_S.read(_e, "veins")):
		var _v9 = _S.scope(_e)
		var _v10 = _v8
		_S.define(_v9, "x", _S.prop(_v10, 0))
		_S.define(_v9, "y", _S.prop(_v10, 1))
		_S.invoke(_S.read(_v9, "p"), "px", [_S.binary("+", _S.read(_v9, "x"), _S.read(_v9, "jx")), _S.read(_v9, "y"), _S.prop(_S.read(_v9, "C"), 5)])
	for _v11 in _S.array(_S.read(_e, "bubbles")):
		var _v12 = _S.scope(_e)
		var _v13 = _v11
		_S.define(_v12, "x", _S.prop(_v13, 0))
		_S.define(_v12, "y", _S.prop(_v13, 1))
		_S.define(_v12, "big", _S.prop(_v13, 2))
		var _v14 = _S.scope(_v12)
		_S.invoke(_S.read(_v14, "p"), "px", [_S.binary("+", _S.read(_v14, "x"), _S.read(_v14, "jx")), _S.read(_v14, "y"), _S.prop(_S.read(_v14, "C"), 6)])
		if _S.truth(_S.read(_v14, "big")):
			_S.last([_S.invoke(_S.read(_v14, "p"), "px", [_S.binary("+", _S.binary("+", _S.read(_v14, "x"), _S.read(_v14, "jx")), 1), _S.read(_v14, "y"), _S.prop(_S.read(_v14, "C"), 5)]), _S.invoke(_S.read(_v14, "p"), "px", [_S.binary("+", _S.read(_v14, "x"), _S.read(_v14, "jx")), _S.binary("+", _S.read(_v14, "y"), 1), _S.prop(_S.read(_v14, "C"), 5)])])
	_S.define(_e, "E", _S.function_value(_e, "_f14"))
	_S.call_value(_S.read(_e, "E"), [[_S.unary("-", 16), _S.unary("-", 28)], [12, _S.unary("-", 28)], _S.read(_e, "WHITE")])
	_S.call_value(_S.read(_e, "E"), [[_S.unary("-", 16), _S.unary("-", 28)], [_S.unary("-", 8), _S.unary("-", 34)], _S.prop(_S.read(_e, "C"), 6)])
	_S.call_value(_S.read(_e, "E"), [[_S.unary("-", 8), _S.unary("-", 34)], [20, _S.unary("-", 34)], _S.prop(_S.read(_e, "C"), 5)])
	_S.call_value(_S.read(_e, "E"), [[12, _S.unary("-", 28)], [20, _S.unary("-", 34)], _S.prop(_S.read(_e, "C"), 7)])
	_S.call_value(_S.read(_e, "E"), [[_S.unary("-", 16), _S.unary("-", 1)], [_S.unary("-", 16), _S.unary("-", 28)], _S.prop(_S.read(_e, "C"), 5)])
	_S.call_value(_S.read(_e, "E"), [[12, _S.unary("-", 1)], [12, _S.unary("-", 28)], _S.prop(_S.read(_e, "C"), 6)])
	_S.call_value(_S.read(_e, "E"), [[20, _S.unary("-", 6)], [20, _S.unary("-", 34)], _S.prop(_S.read(_e, "C"), 3)])
	_S.call_value(_S.read(_e, "E"), [[13, _S.unary("-", 1)], [20, _S.unary("-", 6)], _S.prop(_S.read(_e, "C"), 1)])
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT"))):
		_S.call_value(_S.read(_e, "drawFractures"), [_S.read(_e, "p"), _S.read(_e, "cracks"), _S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), 170), _S.read(_e, "C"), _S.merge([{"ox": _S.read(_e, "jx")}])])
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRACK2"))):
		_S.call_value(_S.read(_e, "drawFractures"), [_S.read(_e, "p"), _S.read(_e, "cracks2"), _S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CRACK2")), 200), _S.read(_e, "C"), _S.merge([{"ox": _S.read(_e, "jx")}])])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "pts", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "pts"), "map", [_S.function_value(_e, "_f10")])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v6 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v6, 0))
	_S.define(_e, "y", _S.prop(_v6, 1))
	return [_S.binary("+", _S.read(_e, "x"), _S.read(_e, "jx")), _S.read(_e, "y")]

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "lx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "jx")))
	_S.define(_e, "d", _S.binary("+", _S.read(_e, "lx"), _S.binary("*", _S.read(_e, "y"), 0.8)))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "d"), _S.read(_e, "sweep"))]), 1.3), func(): return _S.binary("<", _S.read(_e, "y"), _S.unary("-", 6)))):
		return _S.read(_e, "WHITE")
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "y"), _S.unary("-", 9)), func(): return _S.logical("||", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.read(_e, "d"), 21)]), 1.1), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.read(_e, "d"), 16.5)]), 0.6)))):
		return _S.prop(_S.read(_e, "C"), 6)
	if _S.truth(_S.logical("&&", _S.logical("||", _S.logical("&&", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.read(_e, "lx"), 7.5)]), 0.5), func(): return _S.binary("<", _S.read(_e, "y"), _S.unary("-", 6))), func(): return _S.logical("&&", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.read(_e, "y"), 5.5)]), 0.5), func(): return _S.binary(">", _S.read(_e, "lx"), _S.unary("-", 8)))), func(): return _S.binary("===", _S.binary("%", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "lx")]), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")])), 2), 0))):
		return _S.prop(_S.read(_e, "C"), 5)
	if _S.truth(_S.call_value(_S.read(_e, "inPoly"), [_S.read(_e, "PLANE"), _S.read(_e, "lx"), _S.read(_e, "y")])):
		return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 25.5))) else _S.prop(_S.read(_e, "C"), 5))
	if _S.truth(_S.call_value(_S.read(_e, "inPoly"), [_S.read(_e, "SHADE"), _S.read(_e, "lx"), _S.read(_e, "y")])):
		return _S.prop(_S.read(_e, "C"), 3)
	return (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 25.5))) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 8))) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 2.5))) else _S.prop(_S.read(_e, "C"), 2))))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary(">", _S.read(_e, "y"), _S.unary("-", 29.5))) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 32.5))) else (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), 3]), 0.08)) else _S.prop(_S.read(_e, "C"), 6))))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "lx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "jx")))
	return (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary("<", _S.read(_e, "lx"), 13.5)) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "lx"), 16.5)]), 0.6), func(): return _S.binary("<", _S.read(_e, "y"), _S.unary("-", 8)))) else (_S.prop(_S.read(_e, "C"), 1) if _S.truth(_S.binary(">", _S.read(_e, "y"), _S.binary("-", _S.binary("*", _S.binary("-", _S.read(_e, "lx"), 12), _S.unary("-", 0.75)), 3))) else _S.prop(_S.read(_e, "C"), 2))))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	return _S.invoke(_S.read(_e, "p"), "line", [_S.binary("+", _S.prop(_S.read(_e, "a"), 0), _S.read(_e, "jx")), _S.prop(_S.read(_e, "a"), 1), _S.binary("+", _S.prop(_S.read(_e, "b"), 0), _S.read(_e, "jx")), _S.prop(_S.read(_e, "b"), 1), _S.read(_e, "c")])

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "out", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "BURST"), 0.6), _S.binary("+", _S.read(_e, "BURST"), 1.5), _S.read(_e, "t")])))
	if _S.truth(_S.binary(">", _S.read(_e, "out"), 0)):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "x", _S.unary("-", 22))
		while _S.truth(_S.binary("<=", _S.read(_v15, "x"), 26)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "d", _S.binary("/", _S.invoke(_S.read(_v16, "Math"), "abs", [_S.binary("-", _S.read(_v16, "x"), 2)]), 24))
			_S.define(_v16, "h", _S.call_value(_S.read(_v16, "rand"), [_S.read(_v16, "x"), 41]))
			_S.define(_v16, "a", _S.binary("*", _S.read(_v16, "out"), _S.call_value(_S.read(_v16, "clamp"), [_S.binary("/", _S.binary("-", 1.1, _S.read(_v16, "d")), 0.25)])))
			if _S.truth(_S.binary("<=", _S.read(_v16, "a"), 0)):
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "x", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v16, "p"), "dot", [_S.read(_v16, "x"), 0, (_S.read(_v16, "WHITE") if _S.truth(_S.binary("<", _S.read(_v16, "h"), 0.35)) else _S.prop(_S.read(_v16, "C"), 6)), _S.read(_v16, "a")])
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v16, "h"), 0.4), func(): return _S.logical("||", _S.binary("<", _S.read(_v16, "x"), _S.unary("-", 16)), func(): return _S.binary(">", _S.read(_v16, "x"), 20)))):
				_S.invoke(_S.read(_v16, "p"), "dot", [_S.read(_v16, "x"), _S.unary("-", 1), _S.prop(_S.read(_v16, "C"), 5), _S.read(_v16, "a")])
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "j", 1)
			while _S.truth(_S.binary("<=", _S.read(_v17, "j"), _S.binary("+", 1, _S.invoke(_S.read(_v17, "Math"), "round", [_S.binary("*", _S.binary("*", _S.call_value(_S.read(_v17, "rand"), [_S.read(_v17, "x"), 7]), 3), _S.binary("-", 1, _S.read(_v17, "d")))])))):
				_S.invoke(_S.read(_v17, "p"), "dot", [_S.read(_v17, "x"), _S.read(_v17, "j"), (_S.prop(_S.read(_v17, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v17, "j"), 2)) else _S.prop(_S.read(_v17, "C"), 4)), _S.binary("*", _S.read(_v17, "a"), _S.binary("-", 1, _S.binary("/", _S.read(_v17, "j"), 5)))])
				_v17 = _S.iteration(_v17)
				_S.write(_v17, "j", 1, "+=", true)
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "x", 1, "+=", true)
	for _v18 in _S.array(_S.read(_e, "scuffs")):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "s", _v18)
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "a", _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_v20, "s"), "t"), 0.9)))
		if _S.truth(_S.binary(">", _S.read(_v20, "a"), 0)):
			_S.last([_S.invoke(_S.read(_v20, "p"), "dot", [_S.prop(_S.read(_v20, "s"), "x"), 0, (_S.read(_v20, "WHITE") if _S.truth(_S.binary("<", _S.prop(_S.read(_v20, "s"), "t"), 0.15)) else _S.prop(_S.read(_v20, "C"), 6)), _S.read(_v20, "a")]), _S.invoke(_S.read(_v20, "p"), "dot", [_S.prop(_S.read(_v20, "s"), "x"), 1, _S.prop(_S.read(_v20, "C"), 4), _S.binary("*", _S.read(_v20, "a"), 0.6)])])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "chop", _S.function_value(_e, "_f17"))
	for _v21 in _S.array([[_S.read(_e, "FRONT"), 0.6, 46], [_S.read(_e, "TOP"), 1, 40], [_S.read(_e, "SIDE"), 0.3, 46]]):
		var _v22 = _S.scope(_e)
		var _v23 = _v21
		_S.define(_v22, "face", _S.prop(_v23, 0))
		_S.define(_v22, "tone", _S.prop(_v23, 1))
		_S.define(_v22, "max", _S.prop(_v23, 2))
		for _v24 in _S.array(_S.call_value(_S.read(_v22, "chop"), [_S.read(_v22, "face"), _S.read(_v22, "max"), 0])):
			var _v25 = _S.scope(_v22)
			_S.define(_v25, "part", _v24)
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "m", _S.call_value(_S.read(_v26, "centroid"), [_S.read(_v26, "part")]))
			_S.define(_v26, "dx", _S.binary("-", _S.prop(_S.read(_v26, "m"), "x"), _S.prop(_S.read(_v26, "HIT_AT"), 0)))
			_S.define(_v26, "dy", _S.binary("-", _S.prop(_S.read(_v26, "m"), "y"), _S.prop(_S.read(_v26, "HIT_AT"), 1)))
			_S.define(_v26, "d", _S.logical("||", _S.invoke(_S.read(_v26, "Math"), "hypot", [_S.read(_v26, "dx"), _S.read(_v26, "dy")]), func(): return 1))
			_S.define(_v26, "sp", _S.binary("*", _S.invoke(_S.read(_v26, "R"), "range", [50, 150]), _S.binary("+", 0.7, _S.binary("*", 0.3, _S.binary("-", 1, _S.binary("/", _S.read(_v26, "d"), 40))))))
			_S.invoke(_S.read(_v26, "panes"), "add", [_S.merge([{"pts": _S.invoke(_S.read(_v26, "part"), "map", [_S.function_value(_v26, "_f19")])}, {"x": _S.prop(_S.read(_v26, "m"), "x")}, {"y": _S.prop(_S.read(_v26, "m"), "y")}, {"vx": _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v26, "dx"), _S.read(_v26, "d")), _S.read(_v26, "sp")), 0.9), _S.invoke(_S.read(_v26, "R"), "range", [40, 110]))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v26, "dy"), _S.read(_v26, "d")), _S.read(_v26, "sp")), 0.4), _S.invoke(_S.read(_v26, "R"), "range", [60, 200]))}, {"a": 0}, {"va": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 10), 10])}, {"f": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 0.9), 0.9])}, {"vf": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 7), 7])}, {"tone": _S.read(_v26, "tone")}, {"lit": _S.read(_v26, "tone")}, {"g": 0.9}, {"drag": 0.5}, {"bounce": 0.38}, {"solid": true}, {"brittle": 3}, {"crumble": _S.invoke(_S.read(_v26, "R"), "range", [0.25, 0.6])}, {"life": _S.invoke(_S.read(_v26, "R"), "range", [1.5, 1.9])}])])
	var _v28 = _S.scope(_e)
	_S.define(_v28, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v28, "i"), 46)):
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "x", _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 15), 19]))
		_S.define(_v29, "y", _S.unary("-", _S.invoke(_S.read(_v29, "R"), "range", [1, 33])))
		_S.define(_v29, "dx", _S.binary("-", _S.read(_v29, "x"), _S.prop(_S.read(_v29, "HIT_AT"), 0)))
		_S.define(_v29, "dy", _S.binary("-", _S.read(_v29, "y"), _S.prop(_S.read(_v29, "HIT_AT"), 1)))
		_S.define(_v29, "d", _S.logical("||", _S.invoke(_S.read(_v29, "Math"), "hypot", [_S.read(_v29, "dx"), _S.read(_v29, "dy")]), func(): return 1))
		_S.define(_v29, "sp", _S.invoke(_S.read(_v29, "R"), "range", [60, 200]))
		if _S.truth(_S.unary("!", _S.call_value(_S.read(_v29, "inside"), [_S.read(_v29, "x"), _S.read(_v29, "y")]))):
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "i", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v29, "bits"), "add", [_S.merge([{"kind": (_S.prop(_S.read(_v29, "B"), "CHUNK") if _S.truth(_S.invoke(_S.read(_v29, "R"), "chance", [0.15])) else _S.prop(_S.read(_v29, "B"), "SHARD"))}, {"x": _S.read(_v29, "x")}, {"y": _S.read(_v29, "y")}, {"vx": _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v29, "dx"), _S.read(_v29, "d")), _S.read(_v29, "sp")), 0.8), _S.invoke(_S.read(_v29, "R"), "range", [20, 90]))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v29, "dy"), _S.read(_v29, "d")), _S.read(_v29, "sp")), 0.4), _S.invoke(_S.read(_v29, "R"), "range", [60, 240]))}, {"g": 0.85}, {"drag": 0.6}, {"bounce": 0.32}, {"life": _S.invoke(_S.read(_v29, "R"), "range", [0.8, 1.4])}, {"a": _S.invoke(_S.read(_v29, "R"), "range", [0, _S.read(_v29, "TAU")])}, {"va": _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 22), 22])}, {"s": _S.invoke(_S.read(_v29, "R"), "range", [1.2, 3.4])}, {"c": _S.prop(_S.read(_v29, "C"), _S.invoke(_S.read(_v29, "R"), "int", [4, 7]))}, {"ramp": [_S.prop(_S.read(_v29, "C"), 1), _S.prop(_S.read(_v29, "C"), 3), _S.prop(_S.read(_v29, "C"), 4), _S.prop(_S.read(_v29, "C"), 6), _S.prop(_S.read(_v29, "C"), 7)]}])])
		_v28 = _S.iteration(_v28)
		_S.write(_v28, "i", 1, "+=", true)
	var _v30 = _S.scope(_e)
	_S.define(_v30, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v30, "i"), 9)):
		_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "VAPOUR"), _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 6), 18]), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [1, 6])), _S.invoke(_S.read(_v30, "R"), "range", [10, 130]), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [2, 12])), _S.invoke(_S.read(_v30, "R"), "range", [0.6, 1.1]), _S.prop(_S.read(_v30, "C"), 6), _S.invoke(_S.read(_v30, "R"), "range", [2.2, 3.8])])
		_v30 = _S.iteration(_v30)
		_S.write(_v30, "i", 1, "+=", true)
	var _v31 = _S.scope(_e)
	_S.define(_v31, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v31, "i"), 5)):
		_S.invoke(_S.read(_v31, "ps"), "spawn", [_S.prop(_S.read(_v31, "P"), "DUST"), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 6), 16]), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [1, 4])), _S.invoke(_S.read(_v31, "R"), "range", [30, 110]), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [2, 8])), _S.invoke(_S.read(_v31, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v31, "C"), 5), _S.invoke(_S.read(_v31, "R"), "range", [1.6, 2.8])])
		_v31 = _S.iteration(_v31)
		_S.write(_v31, "i", 1, "+=", true)
	var _v32 = _S.scope(_e)
	_S.define(_v32, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v32, "i"), 4)):
		_S.invoke(_S.read(_v32, "ps"), "spawn", [_S.prop(_S.read(_v32, "P"), "VAPOUR"), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 8), 18]), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [8, 28])), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 10), 50]), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [8, 24])), _S.invoke(_S.read(_v32, "R"), "range", [0.6, 1]), _S.prop(_S.read(_v32, "C"), 6), _S.invoke(_S.read(_v32, "R"), "range", [2.6, 4])])
		_v32 = _S.iteration(_v32)
		_S.write(_v32, "i", 1, "+=", true)
	var _v33 = _S.scope(_e)
	_S.define(_v33, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v33, "i"), 16)):
		var _v34 = _S.scope(_v33)
		_S.define(_v34, "a", _S.invoke(_S.read(_v34, "R"), "range", [_S.binary("*", _S.unary("-", _S.prop(_S.read(_v34, "Math"), "PI")), 0.9), _S.unary("-", 0.1)]))
		_S.define(_v34, "sp", _S.invoke(_S.read(_v34, "R"), "range", [40, 140]))
		_S.invoke(_S.read(_v34, "ps"), "spawn", [_S.prop(_S.read(_v34, "P"), "FLAKE"), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 8), 16]), _S.unary("-", _S.invoke(_S.read(_v34, "R"), "range", [6, 28])), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v34, "Math"), "cos", [_S.read(_v34, "a")]), _S.read(_v34, "sp")), 20), _S.binary("*", _S.invoke(_S.read(_v34, "Math"), "sin", [_S.read(_v34, "a")]), _S.read(_v34, "sp")), _S.invoke(_S.read(_v34, "R"), "range", [1, 1.6]), (_S.read(_v34, "WHITE") if _S.truth(_S.invoke(_S.read(_v34, "R"), "chance", [0.6])) else _S.prop(_S.read(_v34, "C"), 6)), _S.invoke(_S.read(_v34, "R"), "range", [0.5, 1.6])])
		_v33 = _S.iteration(_v33)
		_S.write(_v33, "i", 1, "+=", true)
	var _v35 = _S.scope(_e)
	_S.define(_v35, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v35, "i"), 7)):
		_S.invoke(_S.read(_v35, "ps"), "spawn", [_S.prop(_S.read(_v35, "P"), "STAR"), _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 14), 40]), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [4, 40])), _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 8), 16]), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [4, 16])), _S.invoke(_S.read(_v35, "R"), "range", [0.4, 0.8]), (_S.read(_v35, "WHITE") if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [0.5])) else _S.prop(_S.read(_v35, "C"), 6)), _S.invoke(_S.read(_v35, "R"), "range", [1, 2.4])])
		_v35 = _S.iteration(_v35)
		_S.write(_v35, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "lights"), "add", [2, _S.unary("-", 17), 64, _S.read(_e, "WHITE"), 0.85, 0.14])
	_S.invoke(_S.read(_e, "lights"), "add", [16, _S.unary("-", 18), 86, _S.prop(_S.read(_e, "C"), 4), 0.5, 0.55])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "max", _S.arg(_args, 1))
	_S.define(_e, "depth", _S.arg(_args, 2))
	_S.define(_e, "c", _S.call_value(_S.read(_e, "centroid"), [_S.read(_e, "pts")]))
	return ([_S.read(_e, "pts")] if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_e, "c"), "area"), _S.read(_e, "max")), func(): return _S.binary(">", _S.read(_e, "depth"), 4))) else _S.invoke(_S.call_value(_S.read(_e, "splitPoly"), [_S.read(_e, "pts"), _S.binary("+", _S.prop(_S.read(_e, "c"), "x"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1])), _S.binary("+", _S.prop(_S.read(_e, "c"), "y"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1])), _S.invoke(_S.read(_e, "R"), "range", [0, _S.prop(_S.read(_e, "Math"), "PI")])]), "flatMap", [_S.function_value(_e, "_f18")]))

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "chop"), [_S.read(_e, "q"), _S.read(_e, "max"), _S.binary("+", _S.read(_e, "depth"), 1)])

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v27 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v27, 0))
	_S.define(_e, "y", _S.prop(_v27, 1))
	return [_S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "m"), "x")), _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "m"), "y"))]

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "struck")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v36 = _S.scope(_e)
		_S.write(_v36, "struck", true, "=", false)
		_S.invoke(_S.read(_v36, "lights"), "add", [_S.prop(_S.read(_v36, "HIT_AT"), 0), _S.prop(_S.read(_v36, "HIT_AT"), 1), 24, _S.read(_v36, "WHITE"), 0.6, 0.08])
		_S.invoke(_S.read(_v36, "lights"), "add", [_S.binary("+", _S.prop(_S.read(_v36, "HIT_AT"), 0), 6), _S.prop(_S.read(_v36, "HIT_AT"), 1), 40, _S.prop(_S.read(_v36, "C"), 5), 0.4, 0.3])
		var _v37 = _S.scope(_v36)
		_S.define(_v37, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v37, "i"), 12)):
			var _v38 = _S.scope(_v37)
			_S.define(_v38, "a", _S.binary("+", _S.prop(_S.read(_v38, "Math"), "PI"), _S.invoke(_S.read(_v38, "R"), "range", [_S.unary("-", 0.9), 0.9])))
			_S.define(_v38, "sp", _S.invoke(_S.read(_v38, "R"), "range", [50, 120]))
			_S.invoke(_S.read(_v38, "ps"), "spawn", [_S.prop(_S.read(_v38, "P"), "SPARK"), _S.binary("-", _S.prop(_S.read(_v38, "HIT_AT"), 0), 1), _S.prop(_S.read(_v38, "HIT_AT"), 1), _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "cos", [_S.read(_v38, "a")]), _S.read(_v38, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "sin", [_S.read(_v38, "a")]), _S.read(_v38, "sp")), 40), _S.invoke(_S.read(_v38, "R"), "range", [0.15, 0.4])])
			_v37 = _S.iteration(_v37)
			_S.write(_v37, "i", 1, "+=", true)
		var _v39 = _S.scope(_v36)
		_S.define(_v39, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v39, "i"), 6)):
			var _v40 = _S.scope(_v39)
			_S.define(_v40, "a", _S.binary("+", _S.prop(_S.read(_v40, "Math"), "PI"), _S.invoke(_S.read(_v40, "R"), "range", [_S.unary("-", 1), 0.8])))
			_S.define(_v40, "sp", _S.invoke(_S.read(_v40, "R"), "range", [40, 100]))
			_S.invoke(_S.read(_v40, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v40, "B"), "SHARD")}, {"x": _S.binary("-", _S.prop(_S.read(_v40, "HIT_AT"), 0), 1)}, {"y": _S.binary("+", _S.prop(_S.read(_v40, "HIT_AT"), 1), _S.invoke(_S.read(_v40, "R"), "range", [_S.unary("-", 2), 2]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "cos", [_S.read(_v40, "a")]), _S.read(_v40, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "sin", [_S.read(_v40, "a")]), _S.read(_v40, "sp")), 60)}, {"g": 0.85}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v40, "R"), "range", [0.5, 0.9])}, {"a": _S.invoke(_S.read(_v40, "R"), "range", [0, _S.read(_v40, "TAU")])}, {"va": _S.invoke(_S.read(_v40, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v40, "R"), "range", [1.2, 2.4])}, {"c": _S.prop(_S.read(_v40, "C"), _S.invoke(_S.read(_v40, "R"), "int", [5, 7]))}])])
			_v39 = _S.iteration(_v39)
			_S.write(_v39, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "wave2")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRACK2")))):
		var _v41 = _S.scope(_e)
		_S.write(_v41, "wave2", true, "=", false)
		_S.invoke(_S.read(_v41, "lights"), "add", [0, _S.unary("-", 16), 36, _S.prop(_S.read(_v41, "C"), 6), 0.35, 0.15])
		var _v42 = _S.scope(_v41)
		_S.define(_v42, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v42, "i"), 3)):
			_S.invoke(_S.read(_v42, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v42, "B"), "SHARD")}, {"x": _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 14), 18])}, {"y": _S.unary("-", _S.invoke(_S.read(_v42, "R"), "range", [4, 30]))}, {"vx": _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 30), 30])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v42, "R"), "range", [10, 50]))}, {"g": 0.85}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v42, "R"), "range", [0.4, 0.7])}, {"a": _S.invoke(_S.read(_v42, "R"), "range", [0, _S.read(_v42, "TAU")])}, {"va": _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v42, "R"), "range", [1, 2])}, {"c": _S.prop(_S.read(_v42, "C"), _S.invoke(_S.read(_v42, "R"), "int", [5, 7]))}])])
			_v42 = _S.iteration(_v42)
			_S.write(_v42, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "white")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FLASH")))):
		var _v43 = _S.scope(_e)
		_S.write(_v43, "white", true, "=", false)
		_S.invoke(_S.read(_v43, "lights"), "add", [2, _S.unary("-", 17), 44, _S.read(_v43, "WHITE"), 0.7, 0.08])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "burst")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BURST")))):
		var _v44 = _S.scope(_e)
		_S.write(_v44, "burst", true, "=", false)
		_S.call_value(_S.read(_v44, "explode"), [])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.read(_e, "burst"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "BURST"), 1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.08])), func(): return _S.prop(_S.prop(_S.read(_e, "bits"), "list"), "length"))):
		var _v45 = _S.scope(_e)
		_S.define(_v45, "b", _S.invoke(_S.read(_v45, "R"), "pick", [_S.prop(_S.read(_v45, "bits"), "list")]))
		_S.invoke(_S.read(_v45, "ps"), "spawn", [_S.prop(_S.read(_v45, "P"), "STAR"), _S.prop(_S.read(_v45, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v45, "b"), "y"), 1), 0, _S.unary("-", 3), _S.invoke(_S.read(_v45, "R"), "range", [0.2, 0.4]), (_S.read(_v45, "WHITE") if _S.truth(_S.invoke(_S.read(_v45, "R"), "chance", [0.5])) else _S.prop(_S.read(_v45, "C"), 6)), _S.invoke(_S.read(_v45, "R"), "range", [0.6, 1.5])])
	var _v46 = _S.scope(_e)
	_S.define(_v46, "i", _S.binary("-", _S.prop(_S.read(_v46, "scuffs"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v46, "i"), 0)):
		if _S.truth(_S.binary(">", _S.set_prop(_S.prop(_S.read(_v46, "scuffs"), _S.read(_v46, "i")), "t", _S.read(_v46, "dt"), "+=", false), 0.9)):
			_S.invoke(_S.read(_v46, "scuffs"), "splice", [_S.read(_v46, "i"), 1])
		_v46 = _S.iteration(_v46)
		_S.write(_v46, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "panes"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "endBy"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), _S.read(_e, "ps"), _S.read(_e, "bits"), _S.read(_e, "panes")])
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "drawFloor"), [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "drawBlock"), [_S.read(_e, "p")])
	_S.define(_e, "h", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "h"), 0), func(): return _S.binary("<", _S.read(_e, "h"), 0.2))):
		var _v47 = _S.scope(_e)
		_S.call_value(_S.read(_v47, "sparkle"), [_S.read(_v47, "p"), _S.binary("-", _S.prop(_S.read(_v47, "HIT_AT"), 0), 1), _S.prop(_S.read(_v47, "HIT_AT"), 1), _S.binary("*", _S.binary("*", 9, _S.invoke(_S.read(_v47, "ease"), "outBack", [_S.invoke(_S.read(_v47, "Math"), "min", [1, _S.binary("/", _S.read(_v47, "h"), 0.04)])])), _S.binary("-", 1, _S.binary("/", _S.read(_v47, "h"), 0.2))), _S.prop(_S.read(_v47, "C"), 6), _S.prop(_S.read(_v47, "C"), 4), 0.7])
		if _S.truth(_S.binary("<", _S.read(_v47, "h"), 0.08)):
			_S.call_value(_S.read(_v47, "flare"), [_S.read(_v47, "p"), _S.binary("-", _S.prop(_S.read(_v47, "HIT_AT"), 0), 1), _S.prop(_S.read(_v47, "HIT_AT"), 1), _S.binary("*", 14, _S.binary("-", 1, _S.binary("/", _S.read(_v47, "h"), 0.08))), _S.binary("-", 1, _S.binary("/", _S.read(_v47, "h"), 0.08)), _S.read(_v47, "C")])
	_S.define(_e, "k", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "BURST"), _S.binary("+", _S.read(_e, "BURST"), 0.4), _S.read(_e, "t")])))
	_S.define(_e, "crk", _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "HIT"), _S.read(_e, "FLASH"), _S.read(_e, "t")]))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		var _v48 = _S.scope(_e)
		_S.invoke(_S.read(_v48, "p"), "glow", [2, _S.unary("-", 17), 34, _S.prop(_S.read(_v48, "C"), 4), _S.binary("*", _S.binary("+", 0.16, _S.binary("*", 0.22, _S.read(_v48, "crk"))), _S.read(_v48, "k"))])
		_S.invoke(_S.read(_v48, "p"), "glow", [2, _S.unary("-", 2), 30, _S.prop(_S.read(_v48, "C"), 4), _S.binary("*", 0.14, _S.read(_v48, "k"))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FLASH")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "BURST"), 0.12)))):
		_S.call_value(_S.read(_e, "flare"), [_S.read(_e, "p"), 2, _S.unary("-", 17), _S.binary("*", 26, _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "FLASH")), 0.18)]))), _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "FLASH")), 0.18)])), _S.read(_e, "C")])
	_S.invoke(_S.read(_e, "panes"), "draw", [_S.read(_e, "p"), _S.read(_e, "C")])
	_S.invoke(_S.read(_e, "bits"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
