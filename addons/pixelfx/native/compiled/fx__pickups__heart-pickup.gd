@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/heart-pickup.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "pillow", _S.import_value("fx/pickups/_lib.js", "pillow"))
	_S.define(_e, "heartSdf", _S.import_value("fx/pickups/_lib.js", "heartSdf"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Heart pickup"}, {"desc": "A plump glossy heart hovering over its shadow beats lub-dub: a big squash and stretch, a smaller echo, light and a thin ring pulsing out, tiny hearts drifting off."}, {"tags": ["pickup", "heart", "health", "life", "loop"]}, {"size": [56, 60]}, {"origin": [28, 52]}, {"duration": 1.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0408", "#4a0a14", "#8a1222", "#d02436", "#ff4a56", "#ff8a8e", "#ffd0cc", "#ffffff"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [40, 40]))
	_S.define(_e, "HOVER", 18)
	_S.define(_e, "W", 7.2)
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#12060c"]))
	_S.define(_e, "MINI", [".a.a.", "abbba", ".aba.", "..a.."])
	_S.define(_e, "LUB", 0.04)
	_S.define(_e, "DUB", 0.24)
	_S.define(_e, "beat", _S.function_value(_e, "_f5"))
	_S.define(_e, "pulse", _S.function_value(_e, "_f6"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", _S.read(_e, "HOVER")), _S.binary("*", 1.2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))]))))
	_S.call_value(_S.read(_e, "blobShadow"), [_S.read(_e, "p"), 0, _S.binary("+", 8, _S.binary("*", 1.5, _S.call_value(_S.read(_e, "pulse"), [_S.read(_e, "ph")]))), 0.8])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), 4, _S.prop(_S.read(_e, "o"), "seed"), 0.95, _S.function_value(_e, "_f1")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "side", (1 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.unary("-", 1)))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "x", _S.binary("+", _S.binary("*", _S.read(_e, "side"), _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [2, 5]), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [9, 15])))), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 7), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))]), 1.5)))
	_S.define(_e, "yy", _S.binary("-", _S.binary("-", _S.read(_e, "y"), 5), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [14, 19]))))
	_S.define(_e, "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "age"), 0.12)]), _S.binary("-", 1, _S.binary("*", _S.read(_e, "k"), _S.read(_e, "k")))))
	_S.invoke(_S.read(_e, "p"), "sprite", [_S.read(_e, "MINI"), _S.merge([{"a": (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.5)) else _S.prop(_S.read(_e, "C"), 4))}, {"b": (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.3)) else _S.prop(_S.read(_e, "C"), 6))}]), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.read(_e, "x"), 2.5)]), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.read(_e, "yy"), 2)]), _S.merge([{"a": _S.binary("*", _S.read(_e, "a"), 1.3)}])])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "yy"), 5, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.3, _S.read(_e, "a"))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", _S.read(_e, "HOVER")), _S.binary("*", 1.2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))]))))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "pulse"), [_S.read(_e, "ph")]))
	_S.define(_e, "sx", _S.binary("+", 1, _S.binary("*", 0.16, _S.read(_e, "b"))))
	_S.define(_e, "sy", _S.binary("-", 1, _S.binary("*", 0.13, _S.read(_e, "b"))))
	_S.define(_e, "cy", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "cy"), _S.binary("+", 22, _S.binary("*", 6, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "b")]))), _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.26, _S.binary("*", 0.3, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "b")])))])
	_S.invoke(_S.read(_e, "L"), "begin", [_S.unary("-", 20), _S.binary("-", _S.read(_e, "cy"), 20)])
	_S.call_value(_S.read(_e, "pillow"), [_S.read(_e, "L"), _S.unary("-", 12), _S.binary("-", _S.read(_e, "cy"), 11), 12, _S.binary("+", _S.read(_e, "cy"), 11), _S.function_value(_e, "_f3"), _S.function_value(_e, "_f4"), _S.merge([{"bevel": 3.6}])])
	_S.invoke(_S.invoke(_S.read(_e, "L"), "outline", [_S.read(_e, "INK")]), "draw", [_S.read(_e, "p")])
	_S.define(_e, "u", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "ph"), _S.read(_e, "LUB")), 1), 1), 1))
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.28)):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "k", _S.binary("/", _S.read(_v0, "u"), 0.28))
		_S.define(_v0, "r", _S.binary("+", 9, _S.binary("*", 8, _S.binary("-", 1, _S.binary("**", _S.binary("-", 1, _S.read(_v0, "k")), 3)))))
		_S.invoke(_S.read(_v0, "p"), "ring", [0, _S.read(_v0, "cy"), _S.read(_v0, "r"), 1, (_S.prop(_S.read(_v0, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v0, "k"), 0.2)) else _S.prop(_S.read(_v0, "C"), 5)), _S.binary("*", 0.85, _S.binary("-", 1, _S.read(_v0, "k")))])
		_S.invoke(_S.read(_v0, "p"), "glowRing", [0, _S.read(_v0, "cy"), _S.read(_v0, "r"), 4, _S.prop(_S.read(_v0, "C"), 4), _S.binary("*", 0.25, _S.binary("-", 1, _S.read(_v0, "k")))])
	_S.define(_e, "g", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("-", _S.read(_e, "ph"), _S.read(_e, "LUB")), 0.08), 0.5), 0.5), 0.5))
	if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.12)):
		_S.call_value(_S.read(_e, "glint"), [_S.read(_e, "p"), _S.unary("-", 3.5), _S.binary("-", _S.read(_e, "cy"), 4), _S.binary("*", 2.6, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "g"), 0.12), _S.prop(_S.read(_e, "Math"), "PI"))])), _S.read(_e, "WHITE"), 0.45])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "yy", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "heartSdf"), [_S.read(_e, "x"), _S.read(_e, "yy"), 0, _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "W"), _S.read(_e, "sx")), _S.binary("*", _S.read(_e, "W"), _S.read(_e, "sy"))])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "lt", _S.arg(_args, 0))
	_S.define(_e, "e", _S.arg(_args, 1))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "lt"), 0.92), func(): return _S.binary(">", _S.read(_e, "e"), 1.2))):
		return _S.read(_e, "WHITE")
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "lt"), 0.8)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "lt"), 0.6)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "lt"), 0.38)) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary(">", _S.read(_e, "lt"), 0.12)) else _S.prop(_S.read(_e, "C"), 2)))))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ph", _S.arg(_args, 0))
	_S.define(_e, "at", _S.arg(_args, 1))
	_S.define(_e, "s", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "ph"), _S.read(_e, "at")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary(">", _S.read(_e, "u"), 0.3))):
		return 0
	return _S.binary("*", _S.binary("*", _S.read(_e, "s"), _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "u")), 16)])), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "u"), 34)]))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ph", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.call_value(_S.read(_e, "beat"), [_S.read(_e, "ph"), _S.read(_e, "LUB"), 1]), _S.call_value(_S.read(_e, "beat"), [_S.read(_e, "ph"), _S.read(_e, "DUB"), 0.55])), _S.call_value(_S.read(_e, "beat"), [_S.binary("+", _S.read(_e, "ph"), 1), _S.read(_e, "LUB"), 1]))
