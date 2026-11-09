@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/brazier.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "burn", _S.import_value("fx/fire/_lib.js", "burn"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "spark", _S.import_value("fx/fire/_lib.js", "spark"))
	_S.define(_e, "ember", _S.import_value("fx/fire/_lib.js", "ember"))
	_S.define(_e, "floorLight", _S.import_value("fx/fire/_lib.js", "floorLight"))
	_S.define(_e, "stand", _S.function_value(_e, "_f0"))
	_S.define(_e, "bowl", _S.function_value(_e, "_f4"))
	_S.define(_e, "coals", _S.function_value(_e, "_f6"))
	_S.define(_e, "draw", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Brazier"}, {"desc": "An iron bowl on a tripod heaped with glowing coals and a big roaring fire, sparks and embers streaming up off it, light on the iron and the floor."}, {"tags": ["fire", "brazier", "prop", "light", "sparks", "ambient", "loop"]}, {"size": [112, 148]}, {"origin": [56, 136]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"iron": ["#0b0910", "#1c1924", "#302c3a", "#4c4658", "#78708a"]}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "RIM", _S.unary("-", 25))
	_S.define(_e, "RX", 15)
	_S.define(_e, "RY", 3)
	_S.define(_e, "TONGUES", [[_S.unary("-", 7), _S.unary("-", 1.5), 0.5, 2, 1], [7.2, _S.unary("-", 1.5), 0.55, 2, 1], [_S.unary("-", 3), _S.unary("-", 2.5), 0.84, 2.2, 1], [3.3, _S.unary("-", 2.5), 0.86, 2.2, 1], [_S.unary("-", 11.5), 0.5, 0.2, 1.5, 0], [11.5, 0.5, 0.22, 1.5, 0], [_S.unary("-", 8.3), 0, 0.34, 2, 0], [8.5, 0, 0.38, 2, 0], [_S.unary("-", 4.7), _S.unary("-", 0.5), 0.6, 2.8, 0], [4.9, _S.unary("-", 0.5), 0.64, 2.8, 0], [0, _S.unary("-", 1), 1, 3.6, 0]])
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
	_S.define(_e, "leg", _S.function_value(_e, "_f1"))
	_S.invoke(_S.read(_e, "p"), "ellipse", [0, _S.unary("-", 9), 9, 1.8, _S.function_value(_e, "_f2")])
	_S.call_value(_S.read(_e, "leg"), [_S.unary("-", 6), _S.unary("-", 17), _S.unary("-", 12), _S.unary("-", 1)])
	_S.call_value(_S.read(_e, "leg"), [4, _S.unary("-", 17), 10, _S.unary("-", 1)])
	_S.last([_S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 14), _S.unary("-", 1), 5, 1, _S.prop(_S.read(_e, "I"), 2)]), _S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 15), 0, 6, 1, _S.prop(_S.read(_e, "I"), 0)]), _S.invoke(_S.read(_e, "p"), "px", [_S.unary("-", 15), _S.unary("-", 1), _S.prop(_S.read(_e, "I"), 3)])])
	_S.last([_S.invoke(_S.read(_e, "p"), "rect", [9, _S.unary("-", 1), 5, 1, _S.prop(_S.read(_e, "I"), 2)]), _S.invoke(_S.read(_e, "p"), "rect", [9, 0, 6, 1, _S.prop(_S.read(_e, "I"), 0)]), _S.invoke(_S.read(_e, "p"), "px", [13, _S.unary("-", 1), _S.prop(_S.read(_e, "I"), 3)])])
	_S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 1), _S.unary("-", 16), 3, 15, _S.prop(_S.read(_e, "I"), 0)])
	_S.invoke(_S.read(_e, "p"), "rect", [0, _S.unary("-", 16), 1, 15, _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "I"), 3), _S.prop(_S.read(_e, "H"), 4), _S.binary("*", 0.15, _S.read(_e, "fl"))])])
	_S.last([_S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 2), _S.unary("-", 1), 5, 1, _S.prop(_S.read(_e, "I"), 2)]), _S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 2), 0, 5, 1, _S.prop(_S.read(_e, "I"), 0)])])
	_S.invoke(_S.read(_e, "p"), "ellipse", [0, _S.unary("-", 9), 9, 1.8, _S.function_value(_e, "_f3")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x0", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	_S.define(_e, "x1", _S.arg(_args, 2))
	_S.define(_e, "y1", _S.arg(_args, 3))
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.read(_e, "x1"), _S.read(_e, "y1"), _S.prop(_S.read(_e, "I"), 0)])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("+", _S.read(_e, "x0"), 1), _S.read(_e, "y0"), _S.binary("+", _S.read(_e, "x1"), 1), _S.read(_e, "y1"), _S.prop(_S.read(_e, "I"), 2)])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("+", _S.read(_e, "x0"), 2), _S.read(_e, "y0"), _S.binary("+", _S.read(_e, "x1"), 2), _S.read(_e, "y1"), _S.prop(_S.read(_e, "I"), 0)])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "I"), 2) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.6)) else 0)

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	return ((_S.prop(_S.read(_e, "I"), 0) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.85)) else _S.prop(_S.read(_e, "I"), 3)) if _S.truth(_S.logical("&&", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 0), func(): return _S.binary(">", _S.read(_e, "d"), 0.55))) else 0)

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "I", _S.arg(_args, 1))
	_S.define(_e, "H", _S.arg(_args, 2))
	_S.define(_e, "fl", _S.arg(_args, 3))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "RX")), 1), _S.binary("-", _S.read(_e, "RIM"), 1), _S.binary("+", _S.read(_e, "RX"), 1), _S.binary("+", _S.read(_e, "RIM"), 9), _S.function_value(_e, "_f5")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "RIM")), 9))
	_S.define(_e, "hw", _S.binary("-", _S.binary("*", _S.read(_e, "RX"), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.binary("*", _S.read(_e, "v"), _S.read(_e, "v")), 0.9))])])), (_S.binary("*", _S.binary("-", _S.read(_e, "v"), 0.5), 6) if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.5)) else 0)))
	if _S.truth(_S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("+", _S.read(_e, "hw"), 0.5)), func(): return _S.binary("<", _S.read(_e, "y"), _S.read(_e, "RIM")))):
		return null
	if _S.truth(_S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("-", _S.read(_e, "hw"), 0.5)), func(): return _S.binary(">", _S.read(_e, "v"), 0.92))):
		return _S.prop(_S.read(_e, "I"), 0)
	if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.binary("+", _S.read(_e, "RIM"), 1))):
		return _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "I"), 3), _S.prop(_S.read(_e, "H"), 4), _S.binary("*", 0.5, _S.read(_e, "fl"))])
	if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.binary("+", _S.read(_e, "RIM"), 2))):
		return _S.prop(_S.read(_e, "I"), 2)
	if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.binary("+", _S.read(_e, "RIM"), 3))):
		return (_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "I"), 4), _S.prop(_S.read(_e, "H"), 4), _S.binary("*", 0.25, _S.read(_e, "fl"))]) if _S.truth(_S.binary("===", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]), 4), 0)) else _S.prop(_S.read(_e, "I"), 0))
	return (_S.prop(_S.read(_e, "I"), 2) if _S.truth(_S.binary("<", _S.read(_e, "x"), _S.binary("*", _S.unary("-", _S.read(_e, "RX")), 0.45))) else (_S.prop(_S.read(_e, "I"), 1) if _S.truth(_S.binary("<", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "RX"), 0.25))) else _S.prop(_S.read(_e, "I"), 0)))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "I", _S.arg(_args, 1))
	_S.define(_e, "H", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "S", _S.arg(_args, 4))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", _S.read(_e, "RX")), _S.binary("-", _S.read(_e, "RIM"), 6), _S.read(_e, "RX"), _S.binary("+", _S.read(_e, "RIM"), 1), _S.function_value(_e, "_f7")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "top", _S.binary("-", _S.binary("-", _S.read(_e, "RIM"), 1), _S.binary("*", 4, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("**", _S.binary("/", _S.read(_e, "x"), _S.binary("-", _S.read(_e, "RX"), 1)), 2))]))))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "y"), _S.read(_e, "top")), func(): return _S.binary(">", _S.read(_e, "y"), _S.binary("+", _S.read(_e, "RIM"), 0.5))), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("-", _S.read(_e, "RX"), 0.5)))):
		return null
	_S.define(_e, "lump", _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), 1.5)), 3)]), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "y"), 2)]), _S.binary("+", _S.read(_e, "S"), 20)]))
	_S.define(_e, "edge", _S.binary("<", _S.read(_e, "y"), _S.binary("+", _S.read(_e, "top"), 1)))
	if _S.truth(_S.logical("||", _S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), _S.binary("+", _S.read(_e, "S"), 21)]), 0.16), func(): return _S.logical("&&", _S.read(_e, "edge"), func(): return _S.binary("<", _S.read(_e, "lump"), 0.3)))):
		return _S.prop(_S.read(_e, "I"), 0)
	_S.define(_e, "g", _S.binary("*", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.prop(_S.read(_e, "Math"), "PI")), 4), _S.binary("*", _S.read(_e, "lump"), 40))]))), (0.7 if _S.truth(_S.read(_e, "edge")) else 1)))
	_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", 0.3, _S.read(_e, "g")), "=", false)
	return (_S.prop(_S.read(_e, "H"), 2) if _S.truth(_S.binary(">", _S.read(_e, "g"), 0.72)) else (_S.prop(_S.read(_e, "H"), 3) if _S.truth(_S.binary(">", _S.read(_e, "g"), 0.5)) else (_S.prop(_S.read(_e, "H"), 4) if _S.truth(_S.binary(">", _S.read(_e, "g"), 0.3)) else (_S.prop(_S.read(_e, "H"), 5) if _S.truth(_S.binary(">", _S.read(_e, "g"), 0.15)) else _S.prop(_S.read(_e, "H"), 6)))))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "hotFirst"), [_S.read(_e, "F")]))
	_S.define(_e, "I", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "iron"), 5]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "fl", _S.binary("+", _S.binary("+", 0.74, _S.binary("*", 0.16, _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), 7.3, _S.binary("+", _S.read(_e, "S"), 1)]))), _S.binary("*", 0.1, _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), 19, _S.binary("+", _S.read(_e, "S"), 2)]))))
	_S.define(_e, "GLOW", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), 0.5]), _S.read(_e, "WHITE"), 0.25]))
	_S.define(_e, "SPARKS", [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 5)])
	_S.define(_e, "EMB", [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 6)])
	_S.call_value(_S.read(_e, "floorLight"), [_S.read(_e, "p"), 0, 0.5, 40, 7, _S.read(_e, "GLOW"), _S.binary("*", 0.32, _S.read(_e, "fl"))])
	_S.call_value(_S.read(_e, "stand"), [_S.read(_e, "p"), _S.read(_e, "I"), _S.read(_e, "H"), _S.read(_e, "fl")])
	_S.invoke(_S.read(_e, "p"), "ellipse", [0, _S.read(_e, "RIM"), _S.read(_e, "RX"), _S.read(_e, "RY"), _S.function_value(_e, "_f9")])
	_S.call_value(_S.read(_e, "burn"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "TONGUES"), _S.merge([{"H": _S.read(_e, "H")}, {"D": _S.read(_e, "D")}, {"NL": _S.read(_e, "NL")}, {"S": _S.read(_e, "S")}, {"x": 0}, {"y": _S.read(_e, "RIM")}, {"height": 32}, {"lean": 0.1}, {"spread": 7}, {"puffs": 8}, {"licks": 4}, {"smoke": 14}, {"smokeSize": 3}, {"smokeLife": [1.6, 2.4]}, {"embers": 10}, {"glowR": 58}, {"glow": 1.4}, {"wind": 3}, {"mid": _S.function_value(_e, "_f10")}])])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 60, _S.binary("+", _S.read(_e, "S"), 600), _S.function_value(_e, "_f11"), _S.function_value(_e, "_f12")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	return ((_S.prop(_S.read(_e, "I"), 0) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.88)) else _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "I"), 3), _S.prop(_S.read(_e, "H"), 4), _S.binary("*", 0.3, _S.read(_e, "fl"))])) if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 0), func(): return _S.binary(">", _S.read(_e, "d"), 0.7))) else 0)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.call_value(_S.read(_e, "coals"), [_S.read(_e, "p"), _S.read(_e, "I"), _S.read(_e, "H"), _S.read(_e, "t"), _S.read(_e, "S")])
	_S.call_value(_S.read(_e, "bowl"), [_S.read(_e, "p"), _S.read(_e, "I"), _S.read(_e, "H"), _S.read(_e, "fl")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "side", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1), 1]))
	return _S.merge([{"x": _S.binary("*", _S.read(_e, "side"), 8)}, {"y": _S.binary("-", _S.read(_e, "RIM"), _S.invoke(_S.read(_e, "r"), "range", [4, 18]))}, {"vx": _S.binary("*", _S.read(_e, "side"), _S.invoke(_S.read(_e, "r"), "range", [10, 40]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [70, 150]))}, {"life": _S.invoke(_S.read(_e, "r"), "range", [0.7, 1.7])}, {"a": _S.invoke(_S.read(_e, "r"), "range", [0, 6.3])}, {"w": _S.invoke(_S.read(_e, "r"), "range", [1.8, 3.2])}, {"m": _S.invoke(_S.read(_e, "r"), "range", [3, 8])}, {"big": _S.invoke(_S.read(_e, "r"), "chance", [0.12])}])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v0 = _S.call_value(_S.read(_e, "drift"), [_S.prop(_S.read(_e, "q"), "x"), _S.prop(_S.read(_e, "q"), "y"), _S.prop(_S.read(_e, "q"), "vx"), _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"), 0, _S.unary("-", 22), 1.9, 1.9])
	_S.define(_e, "x", _S.prop(_v0, 0))
	_S.define(_e, "y", _S.prop(_v0, 1))
	_S.define(_e, "vx", _S.prop(_v0, 2))
	_S.define(_e, "vy", _S.prop(_v0, 3))
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))))
	_S.define(_e, "wob", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "m"), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "w")), _S.prop(_S.read(_e, "q"), "a"))]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "q"), "a")]))), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 1.5)])))
	_S.define(_e, "wv", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "m"), _S.prop(_S.read(_e, "q"), "w")), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "w")), _S.prop(_S.read(_e, "q"), "a"))])), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 1.5)])))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("+", _S.read(_e, "vx"), _S.read(_e, "wv")), _S.read(_e, "vy")]), 40)):
		_S.call_value(_S.read(_e, "spark"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "wob")), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "vx"), _S.read(_e, "wv")), _S.read(_e, "vy"), _S.read(_e, "k"), _S.read(_e, "SPARKS")])
	else:
		_S.call_value(_S.read(_e, "ember"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "wob")), _S.read(_e, "y"), _S.read(_e, "k"), (2 if _S.truth(_S.prop(_S.read(_e, "q"), "big")) else 1), _S.read(_e, "EMB"), _S.binary("+", _S.binary("*", _S.read(_e, "age"), 40), _S.prop(_S.read(_e, "q"), "a"))])
	return null
