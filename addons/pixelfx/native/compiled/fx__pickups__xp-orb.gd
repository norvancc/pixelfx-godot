@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/xp-orb.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "pool", _S.import_value("fx/pickups/_lib.js", "pool"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "XP orb"}, {"desc": "A small glowing orb races a figure-eight, a comet tail tapering behind it along its path, flecks shed from the tail winking out, its light following it over the floor."}, {"tags": ["pickup", "xp", "orb", "experience", "energy", "loop"]}, {"size": [72, 56]}, {"origin": [36, 48]}, {"duration": 1.8}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0c1806", "#1e3a0a", "#36620e", "#5c9614", "#8cd024", "#c4f060", "#effcc0", "#ffffff"]}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "A", 16)
	_S.define(_e, "B", 9)
	_S.define(_e, "HOVER", 20)
	_S.define(_e, "TAIL", 0.48)
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#0a1406"]))
	_S.define(_e, "at", _S.function_value(_e, "_f5"))
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
	var _v0 = _S.call_value(_S.read(_e, "at"), [_S.read(_e, "t")])
	_S.define(_e, "x", _S.prop(_v0, 0))
	_S.define(_e, "y", _S.prop(_v0, 1))
	_S.call_value(_S.read(_e, "blobShadow"), [_S.read(_e, "p"), _S.read(_e, "x"), 3.5, 0.55])
	_S.call_value(_S.read(_e, "pool"), [_S.read(_e, "p"), _S.read(_e, "x"), 0.5, 14, 3, _S.prop(_S.read(_e, "C"), 5), 0.3])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), 16, _S.prop(_S.read(_e, "o"), "seed"), _S.function_value(_e, "_f1"), _S.function_value(_e, "_f2")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.35, 0.7])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	var _v1 = _S.call_value(_S.read(_e, "at"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age"))])
	_S.define(_e, "fx", _S.prop(_v1, 0))
	_S.define(_e, "fy", _S.prop(_v1, 1))
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life"))))
	_S.define(_e, "tw", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [20, 30])), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))]))
	_S.define(_e, "x2", _S.binary("+", _S.binary("+", _S.read(_e, "fx"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 2), 2])), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 6), 6]))))
	_S.define(_e, "y2", _S.binary("+", _S.binary("+", _S.read(_e, "fy"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 2), 2])), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [4, 10]))))
	if _S.truth(_S.binary(">", _S.binary("*", _S.read(_e, "tw"), _S.read(_e, "k")), _S.unary("-", 0.2))):
		_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x2"), _S.read(_e, "y2"), (_S.read(_e, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "tw"), 0.6), func(): return _S.binary(">", _S.read(_e, "k"), 0.5))) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.5)) else _S.prop(_S.read(_e, "C"), 5)))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.read(_e, "x2"), 0.5), _S.binary("+", _S.read(_e, "y2"), 0.5), 3, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.3, _S.read(_e, "k"))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	var _v2 = _S.call_value(_S.read(_e, "at"), [_S.read(_e, "t")])
	_S.define(_e, "x", _S.prop(_v2, 0))
	_S.define(_e, "y", _S.prop(_v2, 1))
	_S.define(_e, "beat", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")), _S.read(_e, "TAU")), 3)]))))
	_S.define(_e, "n", 60)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", _S.read(_v3, "n"))
	while _S.truth(_S.binary(">=", _S.read(_v3, "i"), 1)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "u", _S.binary("/", _S.read(_v4, "i"), _S.read(_v4, "n")))
		var _v5 = _S.call_value(_S.read(_v4, "at"), [_S.binary("-", _S.read(_v4, "t"), _S.binary("*", _S.read(_v4, "u"), _S.read(_v4, "TAIL")))])
		_S.define(_v4, "tx", _S.prop(_v5, 0))
		_S.define(_v4, "ty", _S.prop(_v5, 1))
		_S.define(_v4, "r", _S.binary("*", 3.1, _S.invoke(_S.read(_v4, "Math"), "pow", [_S.binary("-", 1, _S.read(_v4, "u")), 1.1])))
		_S.define(_v4, "c", (_S.prop(_S.read(_v4, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.25)) else (_S.prop(_S.read(_v4, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.55)) else _S.prop(_S.read(_v4, "C"), 3))))
		if _S.truth(_S.binary(">", _S.read(_v4, "r"), 0.6)):
			_S.invoke(_S.read(_v4, "p"), "circle", [_S.read(_v4, "tx"), _S.read(_v4, "ty"), _S.read(_v4, "r"), _S.read(_v4, "c"), (1 if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.7)) else _S.binary("*", _S.binary("-", 1, _S.read(_v4, "u")), 3.3))])
		else:
			_S.invoke(_S.read(_v4, "p"), "dot", [_S.read(_v4, "tx"), _S.read(_v4, "ty"), _S.read(_v4, "c"), _S.binary("*", _S.binary("-", 1, _S.read(_v4, "u")), 3)])
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v4, "i"), 6), 0)):
			_S.invoke(_S.read(_v4, "p"), "glow", [_S.read(_v4, "tx"), _S.read(_v4, "ty"), _S.binary("+", _S.binary("*", 7, _S.binary("-", 1, _S.read(_v4, "u"))), 2), _S.prop(_S.read(_v4, "C"), 5), _S.binary("*", 0.24, _S.binary("-", 1, _S.read(_v4, "u")))])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "-=", true)
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", _S.invoke(_S.read(_v6, "Math"), "floor", [_S.binary("*", _S.read(_v6, "n"), 0.6)]))
	while _S.truth(_S.binary(">=", _S.read(_v6, "i"), 1)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "u", _S.binary("/", _S.read(_v7, "i"), _S.read(_v7, "n")))
		var _v8 = _S.call_value(_S.read(_v7, "at"), [_S.binary("-", _S.read(_v7, "t"), _S.binary("*", _S.read(_v7, "u"), _S.read(_v7, "TAIL")))])
		_S.define(_v7, "tx", _S.prop(_v8, 0))
		_S.define(_v7, "ty", _S.prop(_v8, 1))
		_S.invoke(_S.read(_v7, "p"), "dot", [_S.read(_v7, "tx"), _S.read(_v7, "ty"), (_S.read(_v7, "WHITE") if _S.truth(_S.binary("<", _S.read(_v7, "u"), 0.2)) else _S.prop(_S.read(_v7, "C"), 6)), _S.binary("*", _S.binary("-", 0.6, _S.read(_v7, "u")), 4)])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "-=", true)
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "X"), _S.read(_e, "Y"), 4.4, _S.read(_e, "INK")])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "X"), _S.read(_e, "Y"), 3.6, _S.function_value(_e, "_f4")])
	_S.last([_S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "X"), 2), _S.binary("-", _S.read(_e, "Y"), 2), _S.read(_e, "WHITE")]), _S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "X"), 1), _S.binary("-", _S.read(_e, "Y"), 2), _S.prop(_S.read(_e, "C"), 7)])])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 16, _S.binary("*", 3, _S.read(_e, "beat"))), _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.36, _S.binary("*", 0.14, _S.read(_e, "beat")))])
	_S.define(_e, "g", _S.binary("%", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")), 3), 1))
	if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.12)):
		_S.call_value(_S.read(_e, "glint"), [_S.read(_e, "p"), _S.binary("-", _S.read(_e, "X"), 2), _S.binary("-", _S.read(_e, "Y"), 2), _S.binary("*", 2.4, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "g"), 0.12), _S.prop(_S.read(_e, "Math"), "PI"))])), _S.read(_e, "WHITE"), 0.4])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	return ((_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.read(_e, "a"), 2.4)]), 0.3)) else _S.prop(_S.read(_e, "C"), 3)) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.72)) else ((_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.read(_e, "a"), 2.4)]), _S.unary("-", 0.2))) else _S.prop(_S.read(_e, "C"), 5)) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.4)) else _S.read(_e, "WHITE")))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "a", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")), _S.read(_e, "TAU")))
	return [_S.binary("*", _S.read(_e, "A"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")])), _S.binary("-", _S.binary("+", _S.unary("-", _S.read(_e, "HOVER")), _S.binary("*", _S.binary("*", _S.read(_e, "B"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")])), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))), _S.binary("*", 1.2, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "a"), 2)])))]
