@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/arrow.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "beat", _S.import_value("fx/projectiles/_lib.js", "beat"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Arrow"}, {"desc": "An arrow in flight: a steel broadhead catching the light, a wooden shaft, fletching fluttering in the wind, streaks of air peeling off its head and swirling off its feathers."}, {"tags": ["projectile", "arrow", "bow", "medieval", "directional", "loop"]}, {"size": [112, 32]}, {"origin": [92, 16]}, {"duration": 0.6}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#7a1f2c", "#b8323c", "#e8e2d6", "#ffffff"]}, {"wood": ["#3a2414", "#6e4422", "#a8723c", "#d8a868"]}, {"steel": ["#2e3648", "#5a6680", "#9aa6ba", "#dfe7f2"]}, {"wind": "#b8c8e8"}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HEAD", ["..LL....", "..sLLL..", "bbsSSSSW", "..dDDD..", "..DD...."])
	_S.define(_e, "FLETCH", [["AAa.........", ".aAAa.......", "..aaAAa.....", "nkkkkkkkkkkk", "..cCCc......", ".cCCc.......", "CCc........."], [".AAa........", "..aAAa......", "..aaAAAa....", "nkkkkkkkkkkk", "..cCCCc.....", "..cCCc......", ".CCc........"], ["AAAa........", "aAAa........", ".aaAAa......", "nkkkkkkkkkkk", "..ccCc......", "cCCc........", "CCc........."]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "PL", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 4]))
	_S.define(_e, "W", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "wood"), 4]))
	_S.define(_e, "ST", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "steel"), 4]))
	_S.define(_e, "wind", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "wind")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "fr", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 30), 0.000001)]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "left", _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 2))
	_S.define(_e, "LEN", 36)
	_S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t"), _S.read(_e, "D"), 9, _S.read(_e, "S"), _S.function_value(_e, "_f1"), _S.function_value(_e, "_f2")])
	_S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t"), _S.read(_e, "D"), 6, _S.binary("+", _S.read(_e, "S"), 3), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("+", _S.unary("-", _S.read(_e, "LEN")), 11), 0, _S.unary("-", 7), 0, _S.prop(_S.read(_e, "W"), 2)])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "x", _S.binary("+", _S.unary("-", _S.read(_v1, "LEN")), 14))
	while _S.truth(_S.binary("<", _S.read(_v1, "x"), _S.unary("-", 8))):
		_S.invoke(_S.read(_v1, "p"), "px", [_S.read(_v1, "x"), 0, _S.prop(_S.read(_v1, "W"), 3)])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "x", 6, "+=", false)
	_S.define(_e, "pose", _S.prop(_S.read(_e, "FLETCH"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "fr"), _S.read(_e, "S")]), 3)])))
	_S.invoke(_S.read(_e, "p"), "sprite", [_S.read(_e, "pose"), _S.merge([{"a": _S.prop(_S.read(_e, "PL"), 2)}, {"A": _S.prop(_S.read(_e, "PL"), 3)}, {"c": _S.prop(_S.read(_e, "PL"), 0)}, {"C": _S.prop(_S.read(_e, "PL"), 1)}, {"k": _S.prop(_S.read(_e, "W"), 1)}, {"n": _S.prop(_S.read(_e, "W"), 0)}]), _S.unary("-", _S.read(_e, "LEN")), _S.unary("-", 3)])
	_S.invoke(_S.read(_e, "p"), "sprite", [_S.read(_e, "HEAD"), _S.merge([{"L": _S.prop(_S.read(_e, "ST"), 3)}, {"s": _S.prop(_S.read(_e, "ST"), 2)}, {"S": _S.prop(_S.read(_e, "ST"), 2)}, {"d": _S.prop(_S.read(_e, "ST"), 0)}, {"D": _S.prop(_S.read(_e, "ST"), 1)}, {"b": _S.prop(_S.read(_e, "W"), 0)}, {"W": _S.read(_e, "WHITE")}]), _S.unary("-", 7), _S.unary("-", 2)])
	_S.define(_e, "g", _S.binary("%", _S.binary("*", _S.read(_e, "ph"), 2), 1))
	if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.25)):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.binary("+", _S.unary("-", 5), _S.binary("*", _S.read(_e, "g"), 16)), _S.unary("-", 1), _S.binary("+", 1, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", 2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "g"), 0.25), _S.prop(_S.read(_e, "Math"), "PI"))]))])), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "ST"), 3), 0.25])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.14, 0.26])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "top", (_S.unary("-", 1) if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.5])) else 1))
	_S.define(_e, "from", (_S.unary("-", 3) if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.6])) else _S.binary("+", _S.unary("-", _S.read(_e, "LEN")), 6)))
	_S.define(_e, "x0", _S.binary("-", _S.read(_e, "from"), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [160, 240]))))
	_S.define(_e, "len", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [8, 16]), _S.binary("+", 0.5, _S.read(_e, "k"))))
	_S.define(_e, "y", _S.binary("+", 0.5, _S.binary("*", _S.read(_e, "top"), _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [3, 5]), _S.binary("*", _S.read(_e, "k"), _S.invoke(_S.read(_e, "r"), "range", [1, 2.5]))))))
	if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "x0"), _S.read(_e, "len")), _S.read(_e, "left"))):
		return null
	_S.define(_e, "c", (_S.read(_e, "wind") if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.4)) else _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "wind"), _S.call_value(_S.read(_e, "hex"), ["#2a2540"]), _S.binary("*", _S.binary("-", _S.read(_e, "k"), 0.4), 1.2)])))
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x0"), _S.read(_e, "y"), _S.binary("-", _S.read(_e, "x0"), _S.read(_e, "len")), _S.read(_e, "y"), _S.function_value(_e, "_f3"), _S.function_value(_e, "_f4")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.call_value(_S.read(_e, "mix"), [_S.read(_e, "wind"), _S.read(_e, "WHITE"), 0.5]) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "u"), 0.25), func(): return _S.binary("<", _S.read(_e, "k"), 0.4))) else _S.read(_e, "c"))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.65)) else _S.binary("/", _S.binary("-", 1, _S.read(_e, "u")), 0.35))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.15, 0.25])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "cx", _S.binary("-", _S.binary("-", _S.unary("-", _S.read(_e, "LEN")), 2), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [100, 150]))))
	_S.define(_e, "cy", _S.binary("+", 0.5, _S.binary("*", _S.invoke(_S.read(_e, "r"), "sign", []), _S.invoke(_S.read(_e, "r"), "range", [2, 4]))))
	_S.define(_e, "a", _S.binary("+", _S.binary("*", _S.read(_e, "age"), 30), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")])))
	_S.define(_e, "rr", _S.binary("+", 1.2, _S.binary("*", _S.read(_e, "k"), 1.5)))
	if _S.truth(_S.binary("<", _S.read(_e, "cx"), _S.binary("+", _S.read(_e, "left"), 4))):
		return null
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 4)):
		_S.invoke(_S.read(_v0, "p"), "dot", [_S.binary("+", _S.read(_v0, "cx"), _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "cos", [_S.binary("+", _S.read(_v0, "a"), _S.binary("*", _S.read(_v0, "i"), 0.5))]), _S.read(_v0, "rr"))), _S.binary("+", _S.read(_v0, "cy"), _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "sin", [_S.binary("+", _S.read(_v0, "a"), _S.binary("*", _S.read(_v0, "i"), 0.5))]), _S.read(_v0, "rr"))), _S.read(_v0, "wind"), _S.binary("*", _S.binary("-", 1, _S.read(_v0, "k")), _S.binary("-", 1, _S.binary("*", _S.read(_v0, "i"), 0.2)))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return null
