@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/shatter-wipe.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "fillConvex", _S.import_value("fx/transitions/_lib.js", "fillConvex"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "paneY", _S.function_value(_e, "_f0"))
	_S.define(_e, "pattern", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f21"))
	_S.define(_e, "drawShard", _S.function_value(_e, "_f28"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Shatter wipe"}, {"desc": "A dark glass pane drops over the screen and bounces; cracks race out from an impact with a flash, then it bursts into tumbling glass shards with lit edges that fall away."}, {"tags": ["shatter", "glass", "break", "shards", "wipe"]}, {"duration": 2.8}, {"options": _S.merge([{"palette": ["#0c1430", "#162c5c", "#1f4f94", "#2f7fcc", "#58b4ec", "#9bdcff", "#d8f4ff", "#ffffff"]}, {"seed": 2}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "LAND", 0.55)
	_S.define(_e, "GP", _S.binary("/", _S.binary("*", 2, _S.read(_e, "H")), _S.binary("*", _S.read(_e, "LAND"), _S.read(_e, "LAND"))))
	_S.define(_e, "REST", 0.3)
	_S.define(_e, "CRACK", 1.32)
	_S.define(_e, "BREAK", 1.62)
	_S.define(_e, "WAVE", 520)
	_S.define(_e, "LX", _S.unary("-", 0.6))
	_S.define(_e, "LY", _S.unary("-", 0.8))
	_S.define(_e, "L3", [_S.unary("-", 0.42), _S.unary("-", 0.56), 0.71])
	_S.define(_e, "BOUNCES", _S.call_value(_S.function_value(_e, "_f30"), []))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "LAND"))):
		return _S.binary("+", _S.unary("-", _S.read(_e, "H")), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "GP")), _S.read(_e, "t")), _S.read(_e, "t")))
	for _v0 in _S.array(_S.read(_e, "BOUNCES")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "b", _v0)
		if _S.truth(_S.binary("<", _S.read(_v1, "t"), _S.binary("+", _S.prop(_S.read(_v1, "b"), "t0"), _S.prop(_S.read(_v1, "b"), "T")))):
			return _S.unary("-", _S.binary("-", _S.binary("*", _S.prop(_S.read(_v1, "b"), "v"), _S.binary("-", _S.read(_v1, "t"), _S.prop(_S.read(_v1, "b"), "t0"))), _S.binary("*", _S.binary("*", 0.5, _S.read(_v1, "GP")), _S.binary("**", _S.binary("-", _S.read(_v1, "t"), _S.prop(_S.read(_v1, "b"), "t0")), 2))))
	return 0

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "Ix", _S.binary("*", _S.read(_e, "W"), _S.invoke(_S.read(_e, "R"), "range", [0.4, 0.6])))
	_S.define(_e, "Iy", _S.binary("*", _S.read(_e, "H"), _S.invoke(_S.read(_e, "R"), "range", [0.36, 0.54])))
	_S.define(_e, "NR", 13)
	_S.define(_e, "RING", [0, 9, 21, 37, 58, 86, 122, 168, 232])
	_S.define(_e, "ang", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "NR")}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "speed", _S.invoke(_S.read(_e, "ang"), "map", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "V", _S.invoke(_S.read(_e, "ang"), "map", [_S.function_value(_e, "_f4")]))
	_S.define(_e, "jag", _S.function_value(_e, "_f6"))
	_S.define(_e, "rad", _S.invoke(_S.read(_e, "V"), "map", [_S.function_value(_e, "_f7")]))
	_S.define(_e, "ring", _S.invoke(_S.read(_e, "V"), "map", [_S.function_value(_e, "_f9")]))
	_S.define(_e, "keep", _S.invoke(_S.read(_e, "V"), "map", [_S.function_value(_e, "_f11")]))
	_S.define(_e, "cracks", [])
	_S.define(_e, "reach", _S.function_value(_e, "_f13"))
	_S.define(_e, "trace", _S.function_value(_e, "_f14"))
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), _S.read(_v10, "NR"))):
		for _v11 in _S.array(_S.prop(_S.read(_v10, "rad"), _S.read(_v10, "i"))):
			var _v12 = _S.scope(_v10)
			_S.define(_v12, "e", _v11)
			_S.call_value(_S.read(_v12, "trace"), [_S.read(_v12, "e"), _S.function_value(_v12, "_f15")])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), _S.read(_v13, "NR"))):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "j", 1)
		while _S.truth(_S.binary("<", _S.read(_v14, "j"), _S.binary("-", _S.prop(_S.read(_v14, "RING"), "length"), 1))):
			var _v15 = _S.scope(_v14)
			if _S.truth(_S.unary("!", _S.prop(_S.prop(_S.read(_v15, "keep"), _S.read(_v15, "i")), _S.read(_v15, "j")))):
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "j", 1, "+=", true)
				continue
			_S.define(_v15, "i2", _S.binary("%", _S.binary("+", _S.read(_v15, "i"), 1), _S.read(_v15, "NR")))
			_S.define(_v15, "e", _S.prop(_S.prop(_S.read(_v15, "ring"), _S.read(_v15, "i")), _S.read(_v15, "j")))
			_S.define(_v15, "start", _S.binary("+", _S.invoke(_S.read(_v15, "Math"), "max", [_S.call_value(_S.read(_v15, "reach"), _S.concat([[_S.read(_v15, "i")], _S.array(_S.prop(_S.prop(_S.read(_v15, "V"), _S.read(_v15, "i")), _S.read(_v15, "j")))])), _S.call_value(_S.read(_v15, "reach"), _S.concat([[_S.read(_v15, "i2")], _S.array(_S.prop(_S.prop(_S.read(_v15, "V"), _S.read(_v15, "i2")), _S.read(_v15, "j")))]))]), _S.invoke(_S.read(_v15, "R"), "range", [0.02, 0.07])))
			var _v16 = _S.prop(_S.read(_v15, "e"), 0)
			_S.define(_v15, "ax", _S.prop(_v16, 0))
			_S.define(_v15, "ay", _S.prop(_v16, 1))
			_S.call_value(_S.read(_v15, "trace"), [_S.read(_v15, "e"), _S.function_value(_v15, "_f16")])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "j", 1, "+=", true)
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "cracks"), "sort", [_S.function_value(_e, "_f17")])
	_S.define(_e, "cells", [])
	var _v17 = _S.scope(_e)
	_S.define(_v17, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v17, "i"), _S.read(_v17, "NR"))):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "j", 0)
		_S.define(_v18, "jb", null)
		while _S.truth(_S.binary("<", _S.read(_v18, "j"), _S.binary("-", _S.prop(_S.read(_v18, "RING"), "length"), 1))):
			var _v19 = _S.scope(_v18)
			var _v20 = _S.scope(_v19)
			_S.write(_v20, "jb", _S.read(_v20, "j"), "=", false)
			while _S.truth(_S.unary("!", _S.prop(_S.prop(_S.read(_v20, "keep"), _S.read(_v20, "i")), _S.binary("+", _S.read(_v20, "jb"), 1)))):
				pass
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "jb", 1, "+=", true)
			_S.define(_v19, "i2", _S.binary("%", _S.binary("+", _S.read(_v19, "i"), 1), _S.read(_v19, "NR")))
			_S.define(_v19, "side", _S.function_value(_v19, "_f18"))
			_S.define(_v19, "pts", _S.concat([_S.array(_S.call_value(_S.read(_v19, "side"), [_S.read(_v19, "i")])), _S.array(_S.invoke(_S.prop(_S.prop(_S.read(_v19, "ring"), _S.read(_v19, "i")), _S.binary("+", _S.read(_v19, "jb"), 1)), "slice", [1])), _S.array(_S.invoke(_S.invoke(_S.call_value(_S.read(_v19, "side"), [_S.read(_v19, "i2")]), "reverse", []), "slice", [1]))]))
			if _S.truth(_S.read(_v19, "j")):
				_S.invoke(_S.read(_v19, "pts"), "push", _S.concat([_S.array(_S.invoke(_S.invoke(_S.invoke(_S.prop(_S.prop(_S.read(_v19, "ring"), _S.read(_v19, "i")), _S.read(_v19, "j")), "slice", []), "reverse", []), "slice", [1, _S.unary("-", 1)]))]))
			else:
				_S.invoke(_S.read(_v19, "pts"), "pop", [])
			_S.define(_v19, "x0", INF)
			_S.define(_v19, "y0", INF)
			_S.define(_v19, "x1", _S.unary("-", INF))
			_S.define(_v19, "y1", _S.unary("-", INF))
			_S.define(_v19, "cx", 0)
			_S.define(_v19, "cy", 0)
			for _v21 in _S.array(_S.read(_v19, "pts")):
				var _v22 = _S.scope(_v19)
				var _v23 = _v21
				_S.define(_v22, "x", _S.prop(_v23, 0))
				_S.define(_v22, "y", _S.prop(_v23, 1))
				_S.last([_S.write(_v22, "x0", _S.invoke(_S.read(_v22, "Math"), "min", [_S.read(_v22, "x0"), _S.read(_v22, "x")]), "=", false), _S.write(_v22, "x1", _S.invoke(_S.read(_v22, "Math"), "max", [_S.read(_v22, "x1"), _S.read(_v22, "x")]), "=", false), _S.write(_v22, "y0", _S.invoke(_S.read(_v22, "Math"), "min", [_S.read(_v22, "y0"), _S.read(_v22, "y")]), "=", false), _S.write(_v22, "y1", _S.invoke(_S.read(_v22, "Math"), "max", [_S.read(_v22, "y1"), _S.read(_v22, "y")]), "=", false), _S.write(_v22, "cx", _S.read(_v22, "x"), "+=", false), _S.write(_v22, "cy", _S.read(_v22, "y"), "+=", false)])
			if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v19, "x1"), 0), func(): return _S.binary("<", _S.read(_v19, "y1"), 0)), func(): return _S.binary(">=", _S.read(_v19, "x0"), _S.read(_v19, "W"))), func(): return _S.binary(">=", _S.read(_v19, "y0"), _S.read(_v19, "H")))):
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "j", _S.binary("+", _S.read(_v18, "jb"), 1), "=", false)
				continue
			_S.write(_v19, "cx", _S.binary("/", _S.binary("+", _S.call_value(_S.read(_v19, "clamp"), [_S.read(_v19, "x0"), 0, _S.read(_v19, "W")]), _S.call_value(_S.read(_v19, "clamp"), [_S.read(_v19, "x1"), 0, _S.read(_v19, "W")])), 2), "=", false)
			_S.write(_v19, "cy", _S.binary("/", _S.binary("+", _S.call_value(_S.read(_v19, "clamp"), [_S.read(_v19, "y0"), 0, _S.read(_v19, "H")]), _S.call_value(_S.read(_v19, "clamp"), [_S.read(_v19, "y1"), 0, _S.read(_v19, "H")])), 2), "=", false)
			_S.define(_v19, "d", _S.invoke(_S.read(_v19, "Math"), "hypot", [_S.binary("-", _S.read(_v19, "cx"), _S.read(_v19, "Ix")), _S.binary("-", _S.read(_v19, "cy"), _S.read(_v19, "Iy"))]))
			_S.invoke(_S.read(_v19, "cells"), "push", [_S.merge([{"pts": _S.read(_v19, "pts")}, {"lp": _S.invoke(_S.read(_v19, "pts"), "map", [_S.function_value(_v19, "_f20")])}, {"cx": _S.read(_v19, "cx")}, {"cy": _S.read(_v19, "cy")}, {"d": _S.read(_v19, "d")}, {"r": _S.binary("/", _S.invoke(_S.read(_v19, "Math"), "hypot", [_S.binary("-", _S.read(_v19, "x1"), _S.read(_v19, "x0")), _S.binary("-", _S.read(_v19, "y1"), _S.read(_v19, "y0"))]), 2)}, {"tb": _S.binary("+", _S.binary("+", _S.read(_v19, "BREAK"), _S.binary("/", _S.read(_v19, "d"), _S.read(_v19, "WAVE"))), _S.invoke(_S.read(_v19, "R"), "range", [0, 0.04]))}])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "j", _S.binary("+", _S.read(_v18, "jb"), 1), "=", false)
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "i", 1, "+=", true)
	return _S.merge([{"Ix": _S.read(_e, "Ix")}, {"Iy": _S.read(_e, "Iy")}, {"cracks": _S.read(_e, "cracks")}, {"cells": _S.read(_e, "cells")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.binary("*", _S.binary("/", _S.binary("+", _S.read(_e, "i"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.3), 0.3])), _S.read(_e, "NR")), _S.read(_e, "TAU"))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.invoke(_S.read(_e, "R"), "range", [800, 1300])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "RING"), "map", [_S.function_value(_e, "_f5")])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	if _S.truth(_S.unary("!", _S.read(_e, "j"))):
		return [_S.read(_e, "Ix"), _S.read(_e, "Iy")]
	_S.define(_e, "rr", _S.binary("*", _S.read(_e, "r"), _S.invoke(_S.read(_e, "R"), "range", [0.84, 1.16])))
	_S.define(_e, "aa", _S.binary("+", _S.read(_e, "a"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.07), 0.07])))
	return [_S.binary("+", _S.read(_e, "Ix"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "aa")]), _S.read(_e, "rr"))), _S.binary("+", _S.read(_e, "Iy"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "aa")]), _S.read(_e, "rr")))]

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "A", _S.arg(_args, 0))
	_S.define(_e, "Bp", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("-", _S.prop(_S.read(_e, "Bp"), 0), _S.prop(_S.read(_e, "A"), 0)))
	_S.define(_e, "dy", _S.binary("-", _S.prop(_S.read(_e, "Bp"), 1), _S.prop(_S.read(_e, "A"), 1)))
	_S.define(_e, "L", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]), func(): return 1))
	_S.define(_e, "n", (2 if _S.truth(_S.binary(">", _S.read(_e, "L"), 18)) else 1))
	_S.define(_e, "out", [_S.read(_e, "A")])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "k", 1)
	while _S.truth(_S.binary("<=", _S.read(_v2, "k"), _S.read(_v2, "n"))):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "f", _S.binary("+", _S.binary("/", _S.read(_v3, "k"), _S.binary("+", _S.read(_v3, "n"), 1)), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 0.08), 0.08])))
		_S.define(_v3, "off", _S.binary("*", _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 1), 1]), _S.invoke(_S.read(_v3, "Math"), "min", [3, _S.binary("*", _S.read(_v3, "L"), 0.07)])))
		_S.invoke(_S.read(_v3, "out"), "push", [[_S.binary("-", _S.binary("+", _S.prop(_S.read(_v3, "A"), 0), _S.binary("*", _S.read(_v3, "dx"), _S.read(_v3, "f"))), _S.binary("*", _S.binary("/", _S.read(_v3, "dy"), _S.read(_v3, "L")), _S.read(_v3, "off"))), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v3, "A"), 1), _S.binary("*", _S.read(_v3, "dy"), _S.read(_v3, "f"))), _S.binary("*", _S.binary("/", _S.read(_v3, "dx"), _S.read(_v3, "L")), _S.read(_v3, "off")))]])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "k", 1, "+=", true)
	_S.invoke(_S.read(_e, "out"), "push", [_S.read(_e, "Bp")])
	return _S.read(_e, "out")

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return _S.invoke(_S.invoke(_S.read(_e, "v"), "slice", [0, _S.unary("-", 1)]), "map", [_S.function_value(_e, "_f8")])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "A", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "jag"), [_S.read(_e, "A"), _S.prop(_S.read(_e, "v"), _S.binary("+", _S.read(_e, "j"), 1))])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "v"), "map", [_S.function_value(_e, "_f10")])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "A", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return (_S.call_value(_S.read(_e, "jag"), [_S.read(_e, "A"), _S.prop(_S.prop(_S.read(_e, "V"), _S.binary("%", _S.binary("+", _S.read(_e, "i"), 1), _S.read(_e, "NR"))), _S.read(_e, "j"))]) if _S.truth(_S.read(_e, "j")) else null)

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.invoke(_S.read(_e, "RING"), "map", [_S.function_value(_e, "_f12")])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.logical("||", _S.logical("||", _S.binary("<=", _S.read(_e, "j"), 2), func(): return _S.binary("===", _S.read(_e, "j"), _S.binary("-", _S.prop(_S.read(_e, "RING"), "length"), 1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("-", 0.78, _S.binary("*", 0.07, _S.read(_e, "j")))]))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	return _S.binary("+", _S.read(_e, "CRACK"), _S.binary("/", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "Ix")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "Iy"))]), _S.prop(_S.read(_e, "speed"), _S.read(_e, "i"))))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "when", _S.arg(_args, 1))
	var _v4 = _S.scope(_e)
	_S.define(_v4, "k", 1)
	while _S.truth(_S.binary("<", _S.read(_v4, "k"), _S.prop(_S.read(_v4, "pts"), "length"))):
		var _v5 = _S.scope(_v4)
		var _v6 = _S.prop(_S.read(_v5, "pts"), _S.binary("-", _S.read(_v5, "k"), 1))
		_S.define(_v5, "ax", _S.prop(_v6, 0))
		_S.define(_v5, "ay", _S.prop(_v6, 1))
		var _v7 = _S.prop(_S.read(_v5, "pts"), _S.read(_v5, "k"))
		_S.define(_v5, "bx", _S.prop(_v7, 0))
		_S.define(_v5, "by", _S.prop(_v7, 1))
		_S.define(_v5, "n", _S.invoke(_S.read(_v5, "Math"), "ceil", [_S.binary("*", _S.invoke(_S.read(_v5, "Math"), "hypot", [_S.binary("-", _S.read(_v5, "bx"), _S.read(_v5, "ax")), _S.binary("-", _S.read(_v5, "by"), _S.read(_v5, "ay"))]), 2)]))
		var _v8 = _S.scope(_v5)
		_S.define(_v8, "s", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "s"), _S.read(_v8, "n"))):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "x", _S.binary("+", _S.read(_v9, "ax"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v9, "bx"), _S.read(_v9, "ax")), _S.read(_v9, "s")), _S.read(_v9, "n"))))
			_S.define(_v9, "y", _S.binary("+", _S.read(_v9, "ay"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v9, "by"), _S.read(_v9, "ay")), _S.read(_v9, "s")), _S.read(_v9, "n"))))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_v9, "x"), 0), func(): return _S.binary(">=", _S.read(_v9, "y"), 0)), func(): return _S.binary("<", _S.read(_v9, "x"), _S.read(_v9, "W"))), func(): return _S.binary("<", _S.read(_v9, "y"), _S.read(_v9, "H")))):
				_S.invoke(_S.read(_v9, "cracks"), "push", [_S.merge([{"x": _S.invoke(_S.read(_v9, "Math"), "floor", [_S.read(_v9, "x")])}, {"y": _S.invoke(_S.read(_v9, "Math"), "floor", [_S.read(_v9, "y")])}, {"t0": _S.call_value(_S.read(_v9, "when"), [_S.read(_v9, "x"), _S.read(_v9, "y")])}])])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "s", 1, "+=", true)
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "k", 1, "+=", true)
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "reach"), [_S.read(_e, "i"), _S.read(_e, "x"), _S.read(_e, "y")])

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.binary("+", _S.read(_e, "start"), _S.binary("/", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "ax")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ay"))]), 420))

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "a"), "t0"), _S.prop(_S.read(_e, "b"), "t0"))

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.invoke(_S.prop(_S.read(_e, "rad"), _S.read(_e, "r")), "slice", [_S.read(_e, "j"), _S.binary("+", _S.read(_e, "jb"), 1)]), "flatMap", [_S.function_value(_e, "_f19")])

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "e", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	return (_S.invoke(_S.read(_e, "e"), "slice", [1]) if _S.truth(_S.read(_e, "k")) else _S.read(_e, "e"))

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v24 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v24, 0))
	_S.define(_e, "y", _S.prop(_v24, 1))
	return [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy"))]

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ink", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "color")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "pat", _S.call_value(_S.read(_e, "pattern"), [_S.read(_e, "R")]))
	var _v25 = _S.read(_e, "pat")
	_S.define(_e, "Ix", _S.prop(_v25, "Ix"))
	_S.define(_e, "Iy", _S.prop(_v25, "Iy"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), []))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "t", 0)
	_S.define(_e, "bounce", _S.unary("-", 1))
	_S.define(_e, "struck", false)
	_S.define(_e, "burst", false)
	_S.define(_e, "end", _S.binary("-", _S.read(_e, "D"), 0.05))
	_S.define(_e, "splinters", _S.function_value(_e, "_f22"))
	_S.define(_e, "glint", _S.function_value(_e, "_f23"))
	return _S.merge([{"update": _S.function_value(_e, "_f24")}, {"draw": _S.function_value(_e, "_f25")}])

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "n", _S.arg(_args, 2))
	_S.define(_e, "vx", _S.arg(_args, 3))
	_S.define(_e, "vy", _S.arg(_args, 4))
	_S.define(_e, "spread", _S.arg(_args, 5))
	_S.define(_e, "sp0", _S.arg(_args, 6))
	_S.define(_e, "sp1", _S.arg(_args, 7))
	var _v26 = _S.scope(_e)
	_S.define(_v26, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v26, "i"), _S.read(_v26, "n"))):
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "a", _S.binary("+", _S.invoke(_S.read(_v27, "Math"), "atan2", [_S.read(_v27, "vy"), _S.read(_v27, "vx")]), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", _S.read(_v27, "spread")), _S.read(_v27, "spread")])))
		_S.define(_v27, "sp", _S.invoke(_S.read(_v27, "R"), "range", [_S.read(_v27, "sp0"), _S.read(_v27, "sp1")]))
		_S.define(_v27, "life", _S.invoke(_S.read(_v27, "Math"), "min", [_S.invoke(_S.read(_v27, "R"), "range", [0.6, 1.2]), _S.binary("-", _S.read(_v27, "end"), _S.read(_v27, "t"))]))
		if _S.truth(_S.binary(">", _S.read(_v27, "life"), 0.2)):
			_S.invoke(_S.read(_v27, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v27, "B"), "SHARD")}, {"x": _S.read(_v27, "x")}, {"y": _S.read(_v27, "y")}, {"vx": _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.read(_v27, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.read(_v27, "sp"))}, {"g": 0.8}, {"drag": 0.6}, {"life": _S.read(_v27, "life")}, {"a": _S.invoke(_S.read(_v27, "R"), "range", [0, _S.read(_v27, "TAU")])}, {"va": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v27, "R"), "range", [1.5, 3.5])}, {"c": _S.invoke(_S.read(_v27, "R"), "pick", [[_S.prop(_S.read(_v27, "C"), 7), _S.prop(_S.read(_v27, "C"), 6), _S.prop(_S.read(_v27, "C"), 5)]])}])])
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "i", 1, "+=", true)
	return null

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "s", _S.coalesce(_S.arg(_args, 2), func(): return _S.invoke(_S.read(_e, "R"), "range", [1, 2.4])))
	return _S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.read(_e, "x"), _S.read(_e, "y"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 8), 8]), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 10), 4]), _S.invoke(_S.read(_e, "Math"), "min", [_S.invoke(_S.read(_e, "R"), "range", [0.3, 0.6]), _S.binary("-", _S.read(_e, "end"), _S.read(_e, "t"))]), (_S.read(_e, "WHITE") if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])) else _S.prop(_S.read(_e, "C"), 6)), _S.read(_e, "s")])

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.binary("+", _S.read(_e, "bounce"), 1), _S.prop(_S.read(_e, "BOUNCES"), "length")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.prop(_S.read(_e, "BOUNCES"), _S.binary("+", _S.read(_e, "bounce"), 1)), "t0")))):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "k", _S.binary("/", _S.prop(_S.prop(_S.read(_v28, "BOUNCES"), _S.write(_v28, "bounce", 1, "+=", false)), "v"), _S.prop(_S.prop(_S.read(_v28, "BOUNCES"), 0), "v")))
		if _S.truth(_S.binary("<", _S.read(_v28, "k"), 0.05)):
			continue
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 5)):
			_S.invoke(_S.read(_v29, "lights"), "add", [_S.binary("/", _S.binary("*", _S.read(_v29, "W"), _S.binary("+", _S.read(_v29, "i"), 0.5)), 5), _S.binary("-", _S.read(_v29, "H"), 2), 70, _S.prop(_S.read(_v29, "C"), 5), _S.binary("*", 0.5, _S.read(_v29, "k")), 0.35])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
		var _v30 = _S.scope(_v28)
		_S.define(_v30, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v30, "i"), _S.invoke(_S.read(_v30, "Math"), "round", [_S.binary("*", 26, _S.read(_v30, "k"))]))):
			_S.call_value(_S.read(_v30, "splinters"), [_S.invoke(_S.read(_v30, "R"), "range", [4, _S.binary("-", _S.read(_v30, "W"), 4)]), _S.binary("-", _S.read(_v30, "H"), 1), 1, _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 0.4), 0.4]), _S.unary("-", 1), 0.5, _S.binary("*", 120, _S.read(_v30, "k")), _S.binary("*", 330, _S.read(_v30, "k"))])
			_v30 = _S.iteration(_v30)
			_S.write(_v30, "i", 1, "+=", true)
		var _v31 = _S.scope(_v28)
		_S.define(_v31, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v31, "i"), _S.invoke(_S.read(_v31, "Math"), "round", [_S.binary("*", 9, _S.read(_v31, "k"))]))):
			_S.call_value(_S.read(_v31, "glint"), [_S.invoke(_S.read(_v31, "R"), "range", [8, _S.binary("-", _S.read(_v31, "W"), 8)]), _S.binary("-", _S.read(_v31, "H"), _S.invoke(_S.read(_v31, "R"), "range", [2, 10]))])
			_v31 = _S.iteration(_v31)
			_S.write(_v31, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "struck")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRACK")))):
		var _v32 = _S.scope(_e)
		_S.write(_v32, "struck", true, "=", false)
		_S.invoke(_S.read(_v32, "lights"), "add", [_S.read(_v32, "Ix"), _S.read(_v32, "Iy"), 90, _S.prop(_S.read(_v32, "C"), 5), 0.8, 0.35])
		_S.invoke(_S.read(_v32, "lights"), "add", [_S.read(_v32, "Ix"), _S.read(_v32, "Iy"), 34, _S.read(_v32, "WHITE"), 0.9, 0.1])
		_S.call_value(_S.read(_v32, "splinters"), [_S.read(_v32, "Ix"), _S.read(_v32, "Iy"), 16, 0, _S.unary("-", 1), _S.prop(_S.read(_v32, "Math"), "PI"), 60, 240])
		var _v33 = _S.scope(_v32)
		_S.define(_v33, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v33, "i"), 5)):
			_S.invoke(_S.read(_v33, "ps"), "spawn", [_S.prop(_S.read(_v33, "P"), "VAPOUR"), _S.read(_v33, "Ix"), _S.read(_v33, "Iy"), _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 40), 40]), _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 40), 30]), _S.invoke(_S.read(_v33, "R"), "range", [0.35, 0.6]), _S.prop(_S.read(_v33, "C"), 6), _S.invoke(_S.read(_v33, "R"), "range", [2, 3.5])])
			_v33 = _S.iteration(_v33)
			_S.write(_v33, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "CRACK")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.12]))):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "c", _S.prop(_S.prop(_S.read(_v34, "pat"), "cracks"), _S.invoke(_S.read(_v34, "R"), "int", [0, _S.binary("-", _S.prop(_S.prop(_S.read(_v34, "pat"), "cracks"), "length"), 1)])))
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v34, "c"), "t0"), _S.read(_v34, "t"))):
			_S.call_value(_S.read(_v34, "glint"), [_S.prop(_S.read(_v34, "c"), "x"), _S.prop(_S.read(_v34, "c"), "y"), _S.invoke(_S.read(_v34, "R"), "range", [0.6, 1.6])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "burst")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BREAK")))):
		var _v35 = _S.scope(_e)
		_S.write(_v35, "burst", true, "=", false)
		_S.invoke(_S.read(_v35, "lights"), "add", [_S.read(_v35, "Ix"), _S.read(_v35, "Iy"), 170, _S.prop(_S.read(_v35, "C"), 4), 0.55, 0.5])
		_S.invoke(_S.read(_v35, "lights"), "add", [_S.read(_v35, "Ix"), _S.read(_v35, "Iy"), 60, _S.read(_v35, "WHITE"), 0.8, 0.14])
		_S.call_value(_S.read(_v35, "splinters"), [_S.read(_v35, "Ix"), _S.read(_v35, "Iy"), 46, 0, _S.unary("-", 1), _S.prop(_S.read(_v35, "Math"), "PI"), 90, 340])
		var _v36 = _S.scope(_v35)
		_S.define(_v36, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v36, "i"), 14)):
			var _v37 = _S.scope(_v36)
			_S.define(_v37, "a", _S.invoke(_S.read(_v37, "R"), "range", [0, _S.read(_v37, "TAU")]))
			_S.define(_v37, "sp", _S.invoke(_S.read(_v37, "R"), "range", [30, 110]))
			_S.invoke(_S.read(_v37, "ps"), "spawn", [_S.prop(_S.read(_v37, "P"), "VAPOUR"), _S.binary("+", _S.read(_v37, "Ix"), _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "cos", [_S.read(_v37, "a")]), 4)), _S.binary("+", _S.read(_v37, "Iy"), _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "sin", [_S.read(_v37, "a")]), 4)), _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "cos", [_S.read(_v37, "a")]), _S.read(_v37, "sp")), _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "sin", [_S.read(_v37, "a")]), _S.read(_v37, "sp")), _S.invoke(_S.read(_v37, "R"), "range", [0.45, 0.8]), (_S.prop(_S.read(_v37, "C"), 6) if _S.truth(_S.invoke(_S.read(_v37, "R"), "chance", [0.6])) else _S.prop(_S.read(_v37, "C"), 5)), _S.invoke(_S.read(_v37, "R"), "range", [3, 6])])
			_v36 = _S.iteration(_v36)
			_S.write(_v36, "i", 1, "+=", true)
	for _v38 in _S.array(_S.prop(_S.read(_e, "pat"), "cells")):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "s", _v38)
		var _v40 = _S.scope(_v39)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v40, "s"), "broke")), func(): return _S.binary(">=", _S.read(_v40, "t"), _S.prop(_S.read(_v40, "s"), "tb")))):
			var _v41 = _S.scope(_v40)
			_S.set_prop(_S.read(_v41, "s"), "broke", true, "=", false)
			_S.define(_v41, "dx", _S.binary("-", _S.prop(_S.read(_v41, "s"), "cx"), _S.read(_v41, "Ix")))
			_S.define(_v41, "dy", _S.binary("-", _S.prop(_S.read(_v41, "s"), "cy"), _S.read(_v41, "Iy")))
			_S.define(_v41, "d", _S.logical("||", _S.invoke(_S.read(_v41, "Math"), "hypot", [_S.read(_v41, "dx"), _S.read(_v41, "dy")]), func(): return 1))
			_S.define(_v41, "sp", _S.binary("*", _S.invoke(_S.read(_v41, "R"), "range", [40, 130]), _S.binary("-", 1.15, _S.invoke(_S.read(_v41, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v41, "s"), "d"), 260)]))))
			_S.set_prop(_S.read(_v41, "s"), "vx", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v41, "dx"), _S.read(_v41, "d")), _S.read(_v41, "sp")), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 15), 15])), "=", false)
			_S.set_prop(_S.read(_v41, "s"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v41, "dy"), _S.read(_v41, "d")), _S.read(_v41, "sp")), 0.6), _S.invoke(_S.read(_v41, "R"), "range", [20, 90])), "=", false)
			_S.set_prop(_S.read(_v41, "s"), "a", 0, "=", false)
			_S.set_prop(_S.read(_v41, "s"), "va", _S.binary("*", _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 2.5), 2.5]), _S.binary("+", 1, _S.binary("/", 20, _S.binary("+", _S.prop(_S.read(_v41, "s"), "r"), 10)))), "=", false)
			_S.set_prop(_S.read(_v41, "s"), "phi", 0, "=", false)
			_S.set_prop(_S.read(_v41, "s"), "vphi", _S.binary("*", _S.invoke(_S.read(_v41, "R"), "sign", []), _S.invoke(_S.read(_v41, "R"), "range", [3, 9])), "=", false)
			_S.set_prop(_S.read(_v41, "s"), "psi", _S.invoke(_S.read(_v41, "R"), "range", [0, _S.read(_v41, "TAU")]), "=", false)
			_S.set_prop(_S.read(_v41, "s"), "z", 0, "=", false)
			_S.set_prop(_S.read(_v41, "s"), "vz", _S.invoke(_S.read(_v41, "R"), "range", [0.25, 0.7]), "=", false)
			_S.set_prop(_S.read(_v41, "s"), "g", _S.invoke(_S.read(_v41, "R"), "range", [0.85, 1.1]), "=", false)
			_S.set_prop(_S.read(_v41, "s"), "edgeOn", false, "=", false)
			_S.call_value(_S.read(_v41, "splinters"), [_S.prop(_S.read(_v41, "s"), "cx"), _S.prop(_S.read(_v41, "s"), "cy"), (4 if _S.truth(_S.binary(">", _S.prop(_S.read(_v41, "s"), "r"), 24)) else 2), _S.prop(_S.read(_v41, "s"), "vx"), _S.prop(_S.read(_v41, "s"), "vy"), 1.2, 60, 220])
			if _S.truth(_S.invoke(_S.read(_v41, "R"), "chance", [0.15])):
				_S.call_value(_S.read(_v41, "glint"), [_S.binary("+", _S.prop(_S.read(_v41, "s"), "cx"), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 4), 4])), _S.binary("+", _S.prop(_S.read(_v41, "s"), "cy"), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 4), 4]))])
		if _S.truth(_S.logical("||", _S.unary("!", _S.prop(_S.read(_v40, "s"), "broke")), func(): return _S.prop(_S.read(_v40, "s"), "gone"))):
			continue
		_S.set_prop(_S.read(_v40, "s"), "vy", _S.binary("*", _S.binary("*", 950, _S.prop(_S.read(_v40, "s"), "g")), _S.read(_v40, "dt")), "+=", false)
		_S.set_prop(_S.read(_v40, "s"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v40, "s"), "vx"), 0.3), _S.read(_v40, "dt")), "-=", false)
		_S.set_prop(_S.read(_v40, "s"), "cx", _S.binary("*", _S.prop(_S.read(_v40, "s"), "vx"), _S.read(_v40, "dt")), "+=", false)
		_S.set_prop(_S.read(_v40, "s"), "cy", _S.binary("*", _S.prop(_S.read(_v40, "s"), "vy"), _S.read(_v40, "dt")), "+=", false)
		_S.set_prop(_S.read(_v40, "s"), "a", _S.binary("*", _S.prop(_S.read(_v40, "s"), "va"), _S.read(_v40, "dt")), "+=", false)
		_S.set_prop(_S.read(_v40, "s"), "phi", _S.binary("*", _S.prop(_S.read(_v40, "s"), "vphi"), _S.read(_v40, "dt")), "+=", false)
		_S.set_prop(_S.read(_v40, "s"), "z", _S.binary("*", _S.prop(_S.read(_v40, "s"), "vz"), _S.read(_v40, "dt")), "+=", false)
		_S.define(_v40, "on", _S.binary("<", _S.invoke(_S.read(_v40, "Math"), "abs", [_S.invoke(_S.read(_v40, "Math"), "cos", [_S.prop(_S.read(_v40, "s"), "phi")])]), 0.2))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_v40, "on"), func(): return _S.unary("!", _S.prop(_S.read(_v40, "s"), "edgeOn"))), func(): return _S.binary("<", _S.read(_v40, "t"), _S.binary("-", _S.read(_v40, "end"), 0.3)))):
			_S.call_value(_S.read(_v40, "glint"), [_S.prop(_S.read(_v40, "s"), "cx"), _S.prop(_S.read(_v40, "s"), "cy"), _S.invoke(_S.read(_v40, "R"), "range", [1.4, 2.6])])
		_S.set_prop(_S.read(_v40, "s"), "edgeOn", _S.read(_v40, "on"), "=", false)
		if _S.truth(_S.binary(">", _S.binary("-", _S.prop(_S.read(_v40, "s"), "cy"), _S.binary("/", _S.prop(_S.read(_v40, "s"), "r"), _S.binary("+", 1, _S.prop(_S.read(_v40, "s"), "z")))), _S.binary("+", _S.read(_v40, "H"), 2))):
			_S.set_prop(_S.read(_v40, "s"), "gone", true, "=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p0", _S.arg(_args, 0))
	_S.define(_e, "p", _S.call_value(_S.read(_e, "clipTo"), [_S.read(_e, "p0")]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))):
		var _v42 = _S.scope(_e)
		_S.define(_v42, "yb", _S.binary("+", _S.call_value(_S.read(_v42, "paneY"), [_S.read(_v42, "t")]), _S.read(_v42, "H")))
		_S.define(_v42, "r1", _S.invoke(_S.read(_v42, "Math"), "min", [_S.read(_v42, "H"), _S.invoke(_S.read(_v42, "Math"), "floor", [_S.read(_v42, "yb")])]))
		if _S.truth(_S.binary(">", _S.read(_v42, "r1"), 0)):
			var _v43 = _S.scope(_v42)
			_S.call_value(_S.read(_v43, "rect"), [_S.read(_v43, "p0"), 0, 0, _S.read(_v43, "W"), _S.read(_v43, "r1"), _S.read(_v43, "ink")])
			_S.define(_v43, "shine", _S.binary("-", 1, _S.call_value(_S.read(_v43, "smooth"), [0.98, 1.22, _S.read(_v43, "t")])))
			_S.define(_v43, "y0", _S.binary("-", _S.read(_v43, "yb"), _S.read(_v43, "H")))
			if _S.truth(_S.binary(">", _S.read(_v43, "shine"), 0)):
				var _v44 = _S.scope(_v43)
				for _v45 in _S.array([[0, 16, 0.05], [22, 3, 0.1], [30, 1, 0.12]]):
					var _v46 = _S.scope(_v44)
					var _v47 = _v45
					_S.define(_v46, "off", _S.prop(_v47, 0))
					_S.define(_v46, "w", _S.prop(_v47, 1))
					_S.define(_v46, "a", _S.prop(_v47, 2))
					var _v48 = _S.scope(_v46)
					_S.define(_v48, "y", 0)
					while _S.truth(_S.binary("<", _S.read(_v48, "y"), _S.read(_v48, "r1"))):
						var _v49 = _S.scope(_v48)
						_S.define(_v49, "xc", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v49, "W"), 0.18), _S.read(_v49, "off")), _S.binary("*", _S.binary("-", _S.read(_v49, "H"), _S.binary("-", _S.read(_v49, "y"), _S.read(_v49, "y0"))), 0.7)))
						var _v50 = _S.scope(_v49)
						_S.define(_v50, "x", _S.invoke(_S.read(_v50, "Math"), "max", [0, _S.invoke(_S.read(_v50, "Math"), "floor", [_S.binary("-", _S.read(_v50, "xc"), _S.binary("/", _S.read(_v50, "w"), 2))])]))
						while _S.truth(_S.binary("<", _S.read(_v50, "x"), _S.invoke(_S.read(_v50, "Math"), "min", [_S.read(_v50, "W"), _S.invoke(_S.read(_v50, "Math"), "ceil", [_S.binary("+", _S.read(_v50, "xc"), _S.binary("/", _S.read(_v50, "w"), 2))])]))):
							_S.invoke(_S.read(_v50, "p0"), "blend", [_S.binary("+", _S.read(_v50, "x"), 0.5), _S.binary("+", _S.read(_v50, "y"), 0.5), _S.prop(_S.read(_v50, "C"), 6), _S.binary("*", _S.read(_v50, "a"), _S.read(_v50, "shine"))])
							_v50 = _S.iteration(_v50)
							_S.write(_v50, "x", 1, "+=", true)
						_v48 = _S.iteration(_v48)
						_S.write(_v48, "y", 1, "+=", true)
				_S.define(_v44, "st", (0 if _S.truth(_S.binary(">", _S.read(_v44, "shine"), 0.66)) else (1 if _S.truth(_S.binary(">", _S.read(_v44, "shine"), 0.33)) else 2)))
				for _v51 in _S.array([[1, _S.prop(_S.read(_v44, "C"), _S.binary("-", 6, _S.binary("*", _S.read(_v44, "st"), 2)))], [2, _S.prop(_S.read(_v44, "C"), _S.binary("-", 4, _S.read(_v44, "st")))], [3, _S.prop(_S.read(_v44, "C"), _S.invoke(_S.read(_v44, "Math"), "max", [1, _S.binary("-", 2, _S.read(_v44, "st"))]))]]):
					var _v52 = _S.scope(_v44)
					var _v53 = _v51
					_S.define(_v52, "dy", _S.prop(_v53, 0))
					_S.define(_v52, "c", _S.prop(_v53, 1))
					if _S.truth(_S.logical("&&", _S.binary(">=", _S.binary("-", _S.read(_v52, "r1"), _S.read(_v52, "dy")), 0), func(): return _S.binary("<", _S.binary("-", _S.read(_v52, "r1"), _S.read(_v52, "dy")), _S.read(_v52, "H")))):
						_S.call_value(_S.read(_v52, "rect"), [_S.read(_v52, "p0"), 0, _S.binary("-", _S.read(_v52, "r1"), _S.read(_v52, "dy")), _S.read(_v52, "W"), 1, _S.read(_v52, "c")])
				_S.define(_v44, "gx", _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_v44, "W"), _S.call_value(_S.read(_v44, "clamp"), [_S.binary("/", _S.read(_v44, "t"), _S.binary("+", _S.read(_v44, "LAND"), 0.25))])), 1.2), 20))
				var _v54 = _S.scope(_v44)
				_S.define(_v54, "x", 0)
				while _S.truth(_S.binary("<", _S.read(_v54, "x"), _S.read(_v54, "W"))):
					var _v55 = _S.scope(_v54)
					_S.define(_v55, "k", _S.invoke(_S.read(_v55, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v55, "Math"), "abs", [_S.binary("-", _S.read(_v55, "x"), _S.read(_v55, "gx"))]), 28))]))
					if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v55, "k"), 0), func(): return _S.binary("<", _S.binary("-", _S.read(_v55, "r1"), 1), _S.read(_v55, "H")))):
						_S.last([_S.invoke(_S.read(_v55, "p0"), "px", [_S.read(_v55, "x"), _S.binary("-", _S.read(_v55, "r1"), 1), (_S.read(_v55, "WHITE") if _S.truth(_S.binary(">", _S.read(_v55, "k"), 0.5)) else _S.prop(_S.read(_v55, "C"), 6))]), _S.invoke(_S.read(_v55, "p0"), "light", [_S.read(_v55, "x"), _S.binary("-", _S.read(_v55, "r1"), 1), _S.prop(_S.read(_v55, "C"), 6), _S.binary("*", 0.5, _S.read(_v55, "k"))])])
					var _v56 = _S.scope(_v55)
					_S.define(_v56, "d", 0)
					while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v56, "d"), 14), func(): return _S.binary("<", _S.binary("+", _S.read(_v56, "r1"), _S.read(_v56, "d")), _S.read(_v56, "H")))):
						_S.invoke(_S.read(_v56, "p0"), "light", [_S.read(_v56, "x"), _S.binary("+", _S.read(_v56, "r1"), _S.read(_v56, "d")), _S.prop(_S.read(_v56, "C"), 5), _S.binary("*", _S.binary("*", _S.binary("*", 0.3, _S.read(_v56, "shine")), _S.binary("**", _S.binary("-", 1, _S.binary("/", _S.read(_v56, "d"), 14)), 2)), _S.binary("+", 0.6, _S.binary("*", 0.8, _S.read(_v56, "k"))))])
						_v56 = _S.iteration(_v56)
						_S.write(_v56, "d", 1, "+=", true)
					_v54 = _S.iteration(_v54)
					_S.write(_v54, "x", 1, "+=", true)
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v44, "t"), _S.binary("+", _S.read(_v44, "LAND"), 0.25)), func(): return _S.binary(">", _S.read(_v44, "gx"), 0)), func(): return _S.binary("<", _S.read(_v44, "gx"), _S.read(_v44, "W"))), func(): return _S.binary("<", _S.binary("-", _S.read(_v44, "r1"), 1), _S.read(_v44, "H")))):
					_S.call_value(_S.read(_v44, "sparkle"), [_S.read(_v44, "p"), _S.read(_v44, "gx"), _S.binary("-", _S.read(_v44, "r1"), 1), 6, _S.prop(_S.read(_v44, "C"), 6), _S.prop(_S.read(_v44, "C"), 4), 0.5])
		if _S.truth(_S.binary(">=", _S.read(_v42, "t"), _S.read(_v42, "CRACK"))):
			var _v57 = _S.scope(_v42)
			for _v58 in _S.array(_S.prop(_S.read(_v57, "pat"), "cracks")):
				var _v59 = _S.scope(_v57)
				_S.define(_v59, "c", _v58)
				var _v60 = _S.scope(_v59)
				if _S.truth(_S.binary(">", _S.prop(_S.read(_v60, "c"), "t0"), _S.read(_v60, "t"))):
					break
				_S.define(_v60, "age", _S.binary("-", _S.read(_v60, "t"), _S.prop(_S.read(_v60, "c"), "t0")))
				if _S.truth(_S.logical("&&", _S.binary("<", _S.binary("+", _S.prop(_S.read(_v60, "c"), "x"), 1), _S.read(_v60, "W")), func(): return _S.binary("<", _S.binary("+", _S.prop(_S.read(_v60, "c"), "y"), 1), _S.read(_v60, "H")))):
					_S.invoke(_S.read(_v60, "p0"), "px", [_S.binary("+", _S.prop(_S.read(_v60, "c"), "x"), 1), _S.binary("+", _S.prop(_S.read(_v60, "c"), "y"), 1), _S.prop(_S.read(_v60, "C"), 1)])
				_S.invoke(_S.read(_v60, "p0"), "px", [_S.prop(_S.read(_v60, "c"), "x"), _S.prop(_S.read(_v60, "c"), "y"), (_S.read(_v60, "WHITE") if _S.truth(_S.binary("<", _S.read(_v60, "age"), 0.04)) else (_S.prop(_S.read(_v60, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v60, "age"), 0.18)) else _S.prop(_S.read(_v60, "C"), 5)))])
				if _S.truth(_S.binary("<", _S.read(_v60, "age"), 0.3)):
					_S.invoke(_S.read(_v60, "p0"), "light", [_S.prop(_S.read(_v60, "c"), "x"), _S.prop(_S.read(_v60, "c"), "y"), _S.prop(_S.read(_v60, "C"), 5), _S.binary("*", 0.55, _S.binary("-", 1, _S.binary("/", _S.read(_v60, "age"), 0.3)))])
			_S.define(_v57, "u", _S.binary("/", _S.binary("-", _S.read(_v57, "t"), _S.read(_v57, "CRACK")), 0.22))
			if _S.truth(_S.binary("<", _S.read(_v57, "u"), 1)):
				var _v61 = _S.scope(_v57)
				_S.call_value(_S.read(_v61, "flare"), [_S.read(_v61, "p"), _S.read(_v61, "Ix"), _S.read(_v61, "Iy"), _S.binary("*", 30, _S.invoke(_S.read(_v61, "Math"), "pow", [_S.binary("-", 1, _S.read(_v61, "u")), 1.5])), _S.binary("-", 1, _S.read(_v61, "u")), _S.read(_v61, "C")])
				_S.invoke(_S.read(_v61, "p"), "glow", [_S.read(_v61, "Ix"), _S.read(_v61, "Iy"), 50, _S.read(_v61, "WHITE"), _S.binary("*", 0.7, _S.binary("-", 1, _S.read(_v61, "u")))])
			_S.define(_v57, "w", _S.binary("/", _S.binary("-", _S.read(_v57, "t"), _S.binary("-", _S.read(_v57, "BREAK"), 0.07)), 0.07))
			if _S.truth(_S.binary(">", _S.read(_v57, "w"), 0)):
				for _v62 in _S.array(_S.prop(_S.read(_v57, "pat"), "cracks")):
					var _v63 = _S.scope(_v57)
					_S.define(_v63, "c", _v62)
					_S.last([_S.invoke(_S.read(_v63, "p0"), "px", [_S.prop(_S.read(_v63, "c"), "x"), _S.prop(_S.read(_v63, "c"), "y"), _S.read(_v63, "WHITE")]), _S.invoke(_S.read(_v63, "p0"), "light", [_S.prop(_S.read(_v63, "c"), "x"), _S.prop(_S.read(_v63, "c"), "y"), _S.prop(_S.read(_v63, "C"), 6), _S.binary("*", 0.4, _S.read(_v63, "w"))])])
	else:
		var _v64 = _S.scope(_e)
		_S.define(_v64, "fall", _S.invoke(_S.invoke(_S.prop(_S.read(_v64, "pat"), "cells"), "filter", [_S.function_value(_v64, "_f26")]), "sort", [_S.function_value(_v64, "_f27")]))
		for _v65 in _S.array(_S.prop(_S.read(_v64, "pat"), "cells")):
			var _v66 = _S.scope(_v64)
			_S.define(_v66, "s", _v65)
			if _S.truth(_S.unary("!", _S.prop(_S.read(_v66, "s"), "broke"))):
				_S.call_value(_S.read(_v66, "drawShard"), [_S.read(_v66, "p"), _S.read(_v66, "p0"), _S.read(_v66, "s"), _S.read(_v66, "C"), _S.read(_v66, "ink"), true])
		for _v67 in _S.array(_S.read(_v64, "fall")):
			var _v68 = _S.scope(_v64)
			_S.define(_v68, "s", _v67)
			_S.call_value(_S.read(_v68, "drawShard"), [_S.read(_v68, "p"), _S.read(_v68, "p0"), _S.read(_v68, "s"), _S.read(_v68, "C"), _S.read(_v68, "ink"), false])
	_S.invoke(_S.read(_e, "bits"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.logical("&&", _S.prop(_S.read(_e, "s"), "broke"), func(): return _S.unary("!", _S.prop(_S.read(_e, "s"), "gone")))

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "b"), "z"), _S.prop(_S.read(_e, "a"), "z"))

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "p0", _S.arg(_args, 1))
	_S.define(_e, "s", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "ink", _S.arg(_args, 4))
	_S.define(_e, "still", _S.arg(_args, 5))
	_S.define(_e, "pts", null)
	_S.define(_e, "face", _S.read(_e, "ink"))
	_S.define(_e, "sliver", false)
	_S.define(_e, "gl", 0)
	if _S.truth(_S.read(_e, "still")):
		_S.write(_e, "pts", _S.prop(_S.read(_e, "s"), "pts"), "=", false)
	else:
		var _v69 = _S.scope(_e)
		_S.define(_v69, "cp", _S.invoke(_S.read(_v69, "Math"), "cos", [_S.prop(_S.read(_v69, "s"), "phi")]))
		_S.define(_v69, "sp", _S.invoke(_S.read(_v69, "Math"), "sin", [_S.prop(_S.read(_v69, "s"), "phi")]))
		_S.define(_v69, "ci", _S.invoke(_S.read(_v69, "Math"), "cos", [_S.prop(_S.read(_v69, "s"), "psi")]))
		_S.define(_v69, "si", _S.invoke(_S.read(_v69, "Math"), "sin", [_S.prop(_S.read(_v69, "s"), "psi")]))
		_S.define(_v69, "ca", _S.invoke(_S.read(_v69, "Math"), "cos", [_S.prop(_S.read(_v69, "s"), "a")]))
		_S.define(_v69, "sa", _S.invoke(_S.read(_v69, "Math"), "sin", [_S.prop(_S.read(_v69, "s"), "a")]))
		_S.define(_v69, "k", _S.binary("/", 1, _S.binary("+", 1, _S.prop(_S.read(_v69, "s"), "z"))))
		_S.write(_v69, "pts", _S.invoke(_S.prop(_S.read(_v69, "s"), "lp"), "map", [_S.function_value(_v69, "_f29")]), "=", false)
		_S.define(_v69, "nx0", _S.binary("*", _S.read(_v69, "si"), _S.read(_v69, "sp")))
		_S.define(_v69, "ny0", _S.binary("*", _S.unary("-", _S.read(_v69, "ci")), _S.read(_v69, "sp")))
		_S.define(_v69, "nz", _S.read(_v69, "cp"))
		_S.define(_v69, "nx", _S.binary("-", _S.binary("*", _S.read(_v69, "nx0"), _S.read(_v69, "ca")), _S.binary("*", _S.read(_v69, "ny0"), _S.read(_v69, "sa"))))
		_S.define(_v69, "ny", _S.binary("+", _S.binary("*", _S.read(_v69, "nx0"), _S.read(_v69, "sa")), _S.binary("*", _S.read(_v69, "ny0"), _S.read(_v69, "ca"))))
		_S.define(_v69, "d", _S.invoke(_S.read(_v69, "Math"), "abs", [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v69, "nx"), _S.prop(_S.read(_v69, "L3"), 0)), _S.binary("*", _S.read(_v69, "ny"), _S.prop(_S.read(_v69, "L3"), 1))), _S.binary("*", _S.read(_v69, "nz"), _S.prop(_S.read(_v69, "L3"), 2)))]))
		_S.write(_v69, "gl", _S.invoke(_S.read(_v69, "Math"), "pow", [_S.read(_v69, "d"), 6]), "=", false)
		_S.define(_v69, "graze", _S.binary("**", _S.call_value(_S.read(_v69, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v69, "Math"), "abs", [_S.read(_v69, "cp")]), 0.3))]), 2))
		_S.write(_v69, "face", _S.call_value(_S.read(_v69, "mix"), [_S.call_value(_S.read(_v69, "mix"), [_S.read(_v69, "ink"), _S.prop(_S.read(_v69, "C"), 2), _S.binary("+", 0.12, _S.binary("*", 0.4, _S.read(_v69, "gl")))]), _S.prop(_S.read(_v69, "C"), 3), _S.binary("*", 0.55, _S.read(_v69, "graze"))]), "=", false)
		_S.write(_v69, "sliver", _S.binary("<", _S.invoke(_S.read(_v69, "Math"), "abs", [_S.read(_v69, "cp")]), 0.2), "=", false)
		if _S.truth(_S.binary("<", _S.binary("*", _S.invoke(_S.read(_v69, "Math"), "abs", [_S.read(_v69, "cp")]), _S.prop(_S.read(_v69, "s"), "r")), 1.5)):
			_S.write(_v69, "face", _S.prop(_S.read(_v69, "C"), 5), "=", false)
	_S.call_value(_S.read(_e, "fillConvex"), [_S.read(_e, "p0"), _S.read(_e, "pts"), _S.read(_e, "face")])
	_S.define(_e, "a2", 0)
	var _v71 = _S.scope(_e)
	_S.define(_v71, "i", 0)
	_S.define(_v71, "j", _S.binary("-", _S.prop(_S.read(_v71, "pts"), "length"), 1))
	while _S.truth(_S.binary("<", _S.read(_v71, "i"), _S.prop(_S.read(_v71, "pts"), "length"))):
		_S.write(_v71, "a2", _S.binary("-", _S.binary("*", _S.prop(_S.prop(_S.read(_v71, "pts"), _S.read(_v71, "j")), 0), _S.prop(_S.prop(_S.read(_v71, "pts"), _S.read(_v71, "i")), 1)), _S.binary("*", _S.prop(_S.prop(_S.read(_v71, "pts"), _S.read(_v71, "i")), 0), _S.prop(_S.prop(_S.read(_v71, "pts"), _S.read(_v71, "j")), 1))), "+=", false)
		_v71 = _S.iteration(_v71)
		_S.write(_v71, "j", _S.write(_v71, "i", 1, "+=", true), "=", false)
	_S.define(_e, "sg", (1 if _S.truth(_S.binary(">", _S.read(_e, "a2"), 0)) else _S.unary("-", 1)))
	var _v72 = _S.scope(_e)
	_S.define(_v72, "i", 0)
	_S.define(_v72, "j", _S.binary("-", _S.prop(_S.read(_v72, "pts"), "length"), 1))
	while _S.truth(_S.binary("<", _S.read(_v72, "i"), _S.prop(_S.read(_v72, "pts"), "length"))):
		var _v73 = _S.scope(_v72)
		var _v74 = _S.prop(_S.read(_v73, "pts"), _S.read(_v73, "j"))
		_S.define(_v73, "ax", _S.prop(_v74, 0))
		_S.define(_v73, "ay", _S.prop(_v74, 1))
		var _v75 = _S.prop(_S.read(_v73, "pts"), _S.read(_v73, "i"))
		_S.define(_v73, "bx", _S.prop(_v75, 0))
		_S.define(_v73, "by", _S.prop(_v75, 1))
		_S.define(_v73, "dx", _S.binary("-", _S.read(_v73, "bx"), _S.read(_v73, "ax")))
		_S.define(_v73, "dy", _S.binary("-", _S.read(_v73, "by"), _S.read(_v73, "ay")))
		_S.define(_v73, "L", _S.invoke(_S.read(_v73, "Math"), "hypot", [_S.read(_v73, "dx"), _S.read(_v73, "dy")]))
		if _S.truth(_S.binary("<", _S.read(_v73, "L"), 0.5)):
			_v72 = _S.iteration(_v72)
			_S.write(_v72, "j", _S.write(_v72, "i", 1, "+=", true), "=", false)
			continue
		_S.define(_v73, "mx", _S.binary("*", _S.binary("/", _S.read(_v73, "dy"), _S.read(_v73, "L")), _S.read(_v73, "sg")))
		_S.define(_v73, "my", _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v73, "dx")), _S.read(_v73, "L")), _S.read(_v73, "sg")))
		_S.define(_v73, "el", _S.binary("+", _S.binary("*", _S.read(_v73, "mx"), _S.read(_v73, "LX")), _S.binary("*", _S.read(_v73, "my"), _S.read(_v73, "LY"))))
		if _S.truth(_S.read(_v73, "still")):
			var _v76 = _S.scope(_v73)
			_S.invoke(_S.read(_v76, "p"), "line", [_S.read(_v76, "ax"), _S.read(_v76, "ay"), _S.read(_v76, "bx"), _S.read(_v76, "by"), (_S.prop(_S.read(_v76, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v76, "el"), 0)) else _S.prop(_S.read(_v76, "C"), 4))])
			_v72 = _S.iteration(_v72)
			_S.write(_v72, "j", _S.write(_v72, "i", 1, "+=", true), "=", false)
			continue
		if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v73, "el"), 0.2), func(): return _S.read(_v73, "sliver"))):
			var _v77 = _S.scope(_v73)
			_S.invoke(_S.read(_v77, "p"), "line", [_S.binary("-", _S.read(_v77, "ax"), _S.read(_v77, "mx")), _S.binary("-", _S.read(_v77, "ay"), _S.read(_v77, "my")), _S.binary("-", _S.read(_v77, "bx"), _S.read(_v77, "mx")), _S.binary("-", _S.read(_v77, "by"), _S.read(_v77, "my")), _S.prop(_S.read(_v77, "C"), 4)])
			_S.invoke(_S.read(_v77, "p"), "line", [_S.read(_v77, "ax"), _S.read(_v77, "ay"), _S.read(_v77, "bx"), _S.read(_v77, "by"), (_S.read(_v77, "WHITE") if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v77, "gl"), 0.5), func(): return _S.read(_v77, "sliver"))) else _S.prop(_S.read(_v77, "C"), 6))])
			_S.invoke(_S.read(_v77, "p"), "glow", [_S.binary("/", _S.binary("+", _S.read(_v77, "ax"), _S.read(_v77, "bx")), 2), _S.binary("/", _S.binary("+", _S.read(_v77, "ay"), _S.read(_v77, "by")), 2), _S.invoke(_S.read(_v77, "Math"), "min", [12, _S.binary("+", 4, _S.binary("*", _S.read(_v77, "L"), 0.3))]), _S.prop(_S.read(_v77, "C"), 5), _S.binary("+", 0.12, _S.binary("*", 0.3, _S.read(_v77, "gl")))])
		else:
			_S.invoke(_S.read(_v73, "p"), "line", [_S.read(_v73, "ax"), _S.read(_v73, "ay"), _S.read(_v73, "bx"), _S.read(_v73, "by"), (_S.prop(_S.read(_v73, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v73, "el"), _S.unary("-", 0.3))) else _S.prop(_S.read(_v73, "C"), 2))])
		_v72 = _S.iteration(_v72)
		_S.write(_v72, "j", _S.write(_v72, "i", 1, "+=", true), "=", false)
	return null

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v70 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v70, 0))
	_S.define(_e, "y", _S.prop(_v70, 1))
	_S.define(_e, "u", _S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.read(_e, "ci")), _S.binary("*", _S.read(_e, "y"), _S.read(_e, "si"))))
	_S.define(_e, "v", _S.binary("*", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "x")), _S.read(_e, "si")), _S.binary("*", _S.read(_e, "y"), _S.read(_e, "ci"))), _S.read(_e, "cp")))
	_S.define(_e, "qx", _S.binary("-", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "ci")), _S.binary("*", _S.read(_e, "v"), _S.read(_e, "si"))))
	_S.define(_e, "qy", _S.binary("+", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "si")), _S.binary("*", _S.read(_e, "v"), _S.read(_e, "ci"))))
	return [_S.binary("+", _S.prop(_S.read(_e, "s"), "cx"), _S.binary("*", _S.binary("-", _S.binary("*", _S.read(_e, "qx"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "qy"), _S.read(_e, "sa"))), _S.read(_e, "k"))), _S.binary("+", _S.prop(_S.read(_e, "s"), "cy"), _S.binary("*", _S.binary("+", _S.binary("*", _S.read(_e, "qx"), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "qy"), _S.read(_e, "ca"))), _S.read(_e, "k")))]

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "out", [])
	_S.define(_e, "t0", _S.read(_e, "LAND"))
	_S.define(_e, "v", _S.binary("*", _S.binary("*", _S.read(_e, "GP"), _S.read(_e, "LAND")), _S.read(_e, "REST")))
	var _v78 = _S.scope(_e)
	_S.define(_v78, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v78, "k"), 3)):
		_S.last([_S.invoke(_S.read(_v78, "out"), "push", [_S.merge([{"t0": _S.read(_v78, "t0")}, {"v": _S.read(_v78, "v")}, {"T": _S.binary("/", _S.binary("*", 2, _S.read(_v78, "v")), _S.read(_v78, "GP"))}])]), _S.write(_v78, "t0", _S.binary("/", _S.binary("*", 2, _S.read(_v78, "v")), _S.read(_v78, "GP")), "+=", false), _S.write(_v78, "v", _S.read(_v78, "REST"), "*=", false)])
		_v78 = _S.iteration(_v78)
		_S.write(_v78, "k", 1, "+=", true)
	return _S.read(_e, "out")
