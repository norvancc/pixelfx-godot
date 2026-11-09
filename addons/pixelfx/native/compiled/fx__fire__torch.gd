@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/torch.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "burn", _S.import_value("fx/fire/_lib.js", "burn"))
	_S.define(_e, "plate", _S.function_value(_e, "_f0"))
	_S.define(_e, "handle", _S.function_value(_e, "_f2"))
	_S.define(_e, "ring", _S.function_value(_e, "_f4"))
	_S.define(_e, "wrap", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Torch"}, {"desc": "A wall torch on an iron bracket: a licking flame leaping off a pitch-soaked wrap, licks and puffs torn off its tips, smoke, embers, a flickering light on the wall."}, {"tags": ["fire", "torch", "prop", "light", "wall", "dungeon", "loop"]}, {"size": [72, 120]}, {"origin": [36, 94]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"wood": ["#0e080a", "#24130f", "#3b2216", "#5a3520", "#8a5a34", "#b9884f"]}, {"iron": ["#0d0b12", "#1e1b26", "#363242", "#5b5566", "#8a8396"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "BASE", _S.unary("-", 16))
	_S.define(_e, "TONGUES", [[_S.unary("-", 1.9), _S.unary("-", 1), 0.74, 2, 1], [2.1, _S.unary("-", 1), 0.7, 2, 1], [_S.unary("-", 3.4), 0.5, 0.42, 1.6, 0], [3.6, 0.5, 0.46, 1.6, 0], [0, 0, 1, 2.9, 0]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "I", _S.arg(_args, 1))
	_S.define(_e, "H", _S.arg(_args, 2))
	_S.define(_e, "fl", _S.arg(_args, 3))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 5.5), _S.unary("-", 5.5), 5.5, 11.5, _S.function_value(_e, "_f1")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "x"), _S.unary("-", 5)), func(): return _S.binary(">", _S.read(_e, "x"), 5)), func(): return _S.binary("<", _S.read(_e, "y"), _S.unary("-", 5))), func(): return _S.binary(">", _S.read(_e, "y"), 11))):
		return _S.prop(_S.read(_e, "I"), 0)
	_S.define(_e, "rv", _S.logical("&&", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 0.6), func(): return _S.logical("||", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.read(_e, "y"), 3.5)]), 0.6), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "y"), 9.5)]), 0.6))))
	if _S.truth(_S.read(_e, "rv")):
		return _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "I"), 4), _S.prop(_S.read(_e, "H"), 3), _S.binary("*", 0.35, _S.read(_e, "fl"))])
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "y"), _S.unary("-", 4)), func(): return _S.binary("<", _S.read(_e, "x"), _S.unary("-", 4)))):
		return _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "I"), 3), _S.prop(_S.read(_e, "H"), 4), _S.binary("*", 0.3, _S.read(_e, "fl"))])
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "y"), 10), func(): return _S.binary(">", _S.read(_e, "x"), 4))):
		return _S.prop(_S.read(_e, "I"), 1)
	return (_S.prop(_S.read(_e, "I"), 2) if _S.truth(_S.binary("<", _S.read(_e, "y"), 2)) else _S.prop(_S.read(_e, "I"), 1))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "W", _S.arg(_args, 1))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 3), _S.unary("-", 12), 3, 15, _S.function_value(_e, "_f3")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "half", _S.binary("+", 1.3, _S.binary("*", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", 14, _S.read(_e, "y")), 26)]), 0.9)))
	if _S.truth(_S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("+", _S.read(_e, "half"), 0.5)), func(): return _S.binary(">", _S.read(_e, "y"), 14.5))):
		return null
	if _S.truth(_S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("-", _S.read(_e, "half"), 0.5)), func(): return _S.binary(">", _S.read(_e, "y"), 13.5))):
		return _S.prop(_S.read(_e, "W"), 0)
	_S.define(_e, "g", _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "y"), 3)]), _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]), 9]))
	return ((_S.prop(_S.read(_e, "W"), 2) if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.3)) else _S.prop(_S.read(_e, "W"), 4)) if _S.truth(_S.binary("<", _S.read(_e, "x"), _S.unary("-", 0.3))) else (_S.prop(_S.read(_e, "W"), 1) if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.4)) else _S.prop(_S.read(_e, "W"), 2)))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "I", _S.arg(_args, 1))
	_S.define(_e, "H", _S.arg(_args, 2))
	_S.define(_e, "fl", _S.arg(_args, 3))
	_S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 3), _S.unary("-", 2), 7, 4, _S.prop(_S.read(_e, "I"), 0)])
	_S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 2), _S.unary("-", 1), 5, 1, _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "I"), 4), _S.prop(_S.read(_e, "H"), 3), _S.binary("*", 0.3, _S.read(_e, "fl"))])])
	_S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 2), 0, 5, 1, _S.prop(_S.read(_e, "I"), 2)])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "W", _S.arg(_args, 1))
	_S.define(_e, "I", _S.arg(_args, 2))
	_S.define(_e, "H", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 6), _S.binary("-", _S.read(_e, "BASE"), 2), 6, _S.unary("-", 9), _S.function_value(_e, "_f6")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.binary("-", _S.read(_e, "BASE"), 1.5)), 7.5))
	_S.define(_e, "half", _S.binary("-", 4.6, _S.binary("*", _S.read(_e, "v"), 1.9)))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("+", _S.read(_e, "half"), 0.5)), func(): return _S.binary("<", _S.read(_e, "y"), _S.binary("-", _S.read(_e, "BASE"), 1.5))), func(): return _S.binary(">", _S.read(_e, "y"), _S.unary("-", 9.5)))):
		return null
	if _S.truth(_S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("-", _S.read(_e, "half"), 0.5)), func(): return _S.binary(">", _S.read(_e, "y"), _S.unary("-", 10.5)))):
		return _S.prop(_S.read(_e, "W"), 0)
	_S.define(_e, "cord", _S.binary("===", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "x"), 0.6)), 40)]), 3), 0))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), 31]))
	if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.45)):
		var _v0 = _S.scope(_e)
		if _S.truth(_S.binary("<", _S.read(_v0, "h"), 0.42)):
			var _v1 = _S.scope(_v0)
			_S.define(_v1, "g", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v1, "t"), _S.read(_v1, "D")), _S.prop(_S.read(_v1, "Math"), "PI")), 4), _S.binary("*", _S.read(_v1, "h"), 40))]))))
			_S.set_prop(_S.read(_v1, "out"), "k", _S.binary("*", 0.3, _S.read(_v1, "g")), "=", false)
			return (_S.prop(_S.read(_v1, "H"), 2) if _S.truth(_S.binary(">", _S.read(_v1, "g"), 0.66)) else (_S.prop(_S.read(_v1, "H"), 4) if _S.truth(_S.binary(">", _S.read(_v1, "g"), 0.33)) else _S.prop(_S.read(_v1, "H"), 5)))
		return (_S.prop(_S.read(_v0, "W"), 0) if _S.truth(_S.binary("<", _S.read(_v0, "h"), 0.75)) else _S.prop(_S.read(_v0, "W"), 1))
	if _S.truth(_S.read(_e, "cord")):
		return _S.prop(_S.read(_e, "I"), 2)
	return (_S.prop(_S.read(_e, "W"), 3) if _S.truth(_S.binary("<", _S.read(_e, "x"), _S.unary("-", 1))) else (_S.prop(_S.read(_e, "W"), 2) if _S.truth(_S.binary("<", _S.read(_e, "x"), 1.5)) else _S.prop(_S.read(_e, "W"), 1)))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "hotFirst"), [_S.read(_e, "F")]))
	_S.define(_e, "W", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "wood"), 6]))
	_S.define(_e, "I", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "iron"), 5]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "fl0", _S.binary("+", _S.binary("+", 0.74, _S.binary("*", 0.16, _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), 7.3, _S.binary("+", _S.read(_e, "S"), 1)]))), _S.binary("*", 0.1, _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), 19, _S.binary("+", _S.read(_e, "S"), 2)]))))
	_S.call_value(_S.read(_e, "plate"), [_S.read(_e, "p"), _S.read(_e, "I"), _S.read(_e, "H"), _S.read(_e, "fl0")])
	_S.call_value(_S.read(_e, "handle"), [_S.read(_e, "p"), _S.read(_e, "W")])
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), _S.read(_e, "I"), _S.read(_e, "H"), _S.read(_e, "fl0")])
	_S.call_value(_S.read(_e, "burn"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "TONGUES"), _S.merge([{"H": _S.read(_e, "H")}, {"D": _S.read(_e, "D")}, {"NL": _S.read(_e, "NL")}, {"S": _S.read(_e, "S")}, {"x": 0}, {"y": _S.read(_e, "BASE")}, {"height": 20}, {"lean": 0.12}, {"spread": 4}, {"puffs": 10}, {"licks": 5}, {"smoke": 7}, {"smokeSize": 2.3}, {"smokeLife": [1.3, 2.1]}, {"embers": 7}, {"glowR": 48}, {"glow": 1.25}, {"wind": 2}, {"mid": _S.function_value(_e, "_f8")}])])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "p"), _S.read(_e, "W"), _S.read(_e, "I"), _S.read(_e, "H"), _S.read(_e, "t")])
