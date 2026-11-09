@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "SMOKE_RAMP", _S.import_value("core/index.js", "SMOKE_RAMP"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "pnoise", _S.function_value(_e, "_f0"))
	_S.define(_e, "noiseFor", _S.function_value(_e, "_f1"))
	_S.define(_e, "looped", _S.function_value(_e, "_f4"))
	_S.define(_e, "flameTongue", _S.function_value(_e, "_f5"))
	_S.define(_e, "flameBlade", _S.function_value(_e, "_f6"))
	_S.define(_e, "solid", _S.function_value(_e, "_f7"))
	_S.define(_e, "soft", _S.function_value(_e, "_f8"))
	_S.define(_e, "firePuff", _S.function_value(_e, "_f9"))
	_S.define(_e, "lick", _S.function_value(_e, "_f10"))
	_S.define(_e, "smokePuff", _S.function_value(_e, "_f11"))
	_S.define(_e, "ember", _S.function_value(_e, "_f12"))
	_S.define(_e, "spark", _S.function_value(_e, "_f13"))
	_S.define(_e, "along", _S.function_value(_e, "_f14"))
	_S.define(_e, "drift", _S.function_value(_e, "_f15"))
	_S.define(_e, "sparkAt", _S.function_value(_e, "_f16"))
	_S.define(_e, "floorLight", _S.function_value(_e, "_f17"))
	_S.define(_e, "simDraw", _S.function_value(_e, "_f19"))
	_S.define(_e, "burn", _S.function_value(_e, "_f21"))
	_exports["pnoise"] = _S.read(_e, "pnoise")
	_exports["noiseFor"] = _S.read(_e, "noiseFor")
	_exports["looped"] = _S.read(_e, "looped")
	_S.define(_e, "flicker", _S.function_value(_e, "_f39"))
	_exports["flicker"] = _S.read(_e, "flicker")
	_S.define(_e, "hotFirst", _S.function_value(_e, "_f40"))
	_exports["hotFirst"] = _S.read(_e, "hotFirst")
	_S.define(_e, "LAYERS", [[1, 1, 6], [0.76, 0.86, 4], [0.54, 0.68, 2], [0.3, 0.42, 0]])
	_exports["LAYERS"] = _S.read(_e, "LAYERS")
	_S.define(_e, "BIG_LAYERS", [[1, 1, 6], [0.8, 0.9, 5], [0.62, 0.78, 4], [0.44, 0.6, 3], [0.26, 0.4, 1], [0.12, 0.22, 0]])
	_exports["BIG_LAYERS"] = _S.read(_e, "BIG_LAYERS")
	_S.define(_e, "BACK_LAYERS", [[1, 1, 7], [0.76, 0.86, 5], [0.54, 0.68, 3], [0.3, 0.42, 2]])
	_exports["BACK_LAYERS"] = _S.read(_e, "BACK_LAYERS")
	_exports["flameTongue"] = _S.read(_e, "flameTongue")
	_exports["flameBlade"] = _S.read(_e, "flameBlade")
	_exports["solid"] = _S.read(_e, "solid")
	_exports["soft"] = _S.read(_e, "soft")
	_exports["firePuff"] = _S.read(_e, "firePuff")
	_exports["lick"] = _S.read(_e, "lick")
	_S.define(_e, "rampAt", _S.function_value(_e, "_f41"))
	_exports["smokePuff"] = _S.read(_e, "smokePuff")
	_exports["ember"] = _S.read(_e, "ember")
	_exports["spark"] = _S.read(_e, "spark")
	_exports["drift"] = _S.read(_e, "drift")
	_exports["sparkAt"] = _S.read(_e, "sparkAt")
	_exports["floorLight"] = _S.read(_e, "floorLight")
	_exports["simDraw"] = _S.read(_e, "simDraw")
	_S.define(_e, "SMOKE1", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_exports["burn"] = _S.read(_e, "burn")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "period", _S.arg(_args, 1))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]))
	_S.define(_e, "f", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "i")))
	_S.define(_e, "u", _S.binary("*", _S.binary("*", _S.read(_e, "f"), _S.read(_e, "f")), _S.binary("-", 3, _S.binary("*", 2, _S.read(_e, "f")))))
	_S.define(_e, "a", _S.call_value(_S.read(_e, "rand"), [_S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "i"), _S.read(_e, "period")]), _S.read(_e, "seed")]))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "rand"), [_S.call_value(_S.read(_e, "wrap"), [_S.binary("+", _S.read(_e, "i"), 1), _S.read(_e, "period")]), _S.read(_e, "seed")]))
	return _S.binary("-", _S.binary("*", _S.binary("+", _S.read(_e, "a"), _S.binary("*", _S.binary("-", _S.read(_e, "b"), _S.read(_e, "a")), _S.read(_e, "u"))), 2), 1)

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "D", _S.arg(_args, 0))
	if _S.truth(_S.unary("!", _S.read(_e, "D"))):
		return _S.function_value(_e, "_f2")
	return _S.function_value(_e, "_f3")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	_S.define(_e, "rate", _S.arg(_args, 1))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "off", _S.coalesce(_S.arg(_args, 3), func(): return 0))
	return _S.call_value(_S.read(_e, "noise"), [_S.binary("+", _S.binary("*", _S.read(_e, "tt"), _S.read(_e, "rate")), _S.read(_e, "off")), _S.read(_e, "seed")])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	_S.define(_e, "rate", _S.arg(_args, 1))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "off", _S.coalesce(_S.arg(_args, 3), func(): return 0))
	_S.define(_e, "P", _S.invoke(_S.read(_e, "Math"), "max", [1, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "rate"), _S.read(_e, "D"))])]))
	return _S.call_value(_S.read(_e, "pnoise"), [_S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "tt"), _S.read(_e, "D")), _S.read(_e, "P")), _S.read(_e, "off")), _S.read(_e, "P"), _S.read(_e, "seed")])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "D", _S.arg(_args, 1))
	_S.define(_e, "count", _S.arg(_args, 2))
	_S.define(_e, "seed", _S.arg(_args, 3))
	_S.define(_e, "make", _S.arg(_args, 4))
	_S.define(_e, "draw", _S.arg(_args, 5))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.read(_v0, "count"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "r", _S.call_value(_S.read(_v1, "rng"), [_S.read(_v1, "seed"), _S.read(_v1, "i")]))
		_S.define(_v1, "born", _S.binary("*", _S.invoke(_S.read(_v1, "r"), "next", []), _S.read(_v1, "D")))
		_S.define(_v1, "q", _S.call_value(_S.read(_v1, "make"), [_S.read(_v1, "r"), _S.read(_v1, "i")]))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "age", _S.call_value(_S.read(_v2, "wrap"), [_S.binary("-", _S.read(_v2, "t"), _S.read(_v2, "born")), _S.read(_v2, "D")]))
		while _S.truth(_S.binary("<", _S.read(_v2, "age"), _S.prop(_S.read(_v2, "q"), "life"))):
			_S.call_value(_S.read(_v2, "draw"), [_S.read(_v2, "q"), _S.read(_v2, "age"), _S.read(_v2, "i")])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "age", _S.read(_v2, "D"), "+=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "h", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "sx", _S.arg(_args, 5))
	_S.define(_e, "N", _S.arg(_args, 6))
	_S.define(_e, "n", _S.arg(_args, 7))
	_S.define(_e, "H", _S.arg(_args, 8))
	_S.define(_e, "layers", _S.coalesce(_S.arg(_args, 9), func(): return _S.read(_e, "LAYERS")))
	_S.define(_e, "jit", _S.coalesce(_S.arg(_args, 10), func(): return 0.5))
	_S.define(_e, "wob", _S.coalesce(_S.arg(_args, 11), func(): return 1.1))
	if _S.truth(_S.binary("<", _S.read(_e, "h"), 1)):
		return null
	for _v3 in _S.array(_S.read(_e, "layers")):
		var _v4 = _S.scope(_e)
		var _v5 = _v3
		_S.define(_v4, "lw", _S.prop(_v5, 0))
		_S.define(_v4, "lh", _S.prop(_v5, 1))
		_S.define(_v4, "ri", _S.prop(_v5, 2))
		var _v6 = _S.scope(_v4)
		_S.define(_v6, "L", _S.binary("*", _S.read(_v6, "h"), _S.read(_v6, "lh")))
		_S.define(_v6, "c", _S.prop(_S.read(_v6, "H"), _S.read(_v6, "ri")))
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "r", 0)
		while _S.truth(_S.binary("<=", _S.read(_v7, "r"), _S.read(_v7, "L"))):
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "u", _S.binary("/", _S.read(_v8, "r"), _S.invoke(_S.read(_v8, "Math"), "max", [1, _S.read(_v8, "L")])))
			_S.define(_v8, "half", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v8, "w"), _S.read(_v8, "lw")), _S.invoke(_S.read(_v8, "Math"), "pow", [_S.binary("-", 1, _S.read(_v8, "u")), 0.85])), _S.invoke(_S.read(_v8, "Math"), "min", [1, _S.binary("/", _S.binary("+", _S.read(_v8, "r"), 1.5), 3.5)])), _S.binary("*", _S.call_value(_S.read(_v8, "N"), [9, _S.read(_v8, "n"), _S.binary("*", _S.read(_v8, "r"), 0.45)]), _S.read(_v8, "jit"))))
			if _S.truth(_S.binary("<", _S.read(_v8, "half"), 0.3)):
				_v7 = _S.iteration(_v7)
				_S.write(_v7, "r", 1, "+=", true)
				continue
			_S.define(_v8, "cx", _S.binary("+", _S.binary("+", _S.read(_v8, "x"), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v8, "sx"), _S.read(_v8, "u")), _S.read(_v8, "u")), _S.read(_v8, "lh"))), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v8, "N"), [4, _S.binary("+", _S.read(_v8, "n"), 7), _S.binary("*", _S.read(_v8, "r"), 0.2)]), _S.read(_v8, "u")), _S.read(_v8, "wob"))))
			_S.define(_v8, "Y", _S.invoke(_S.read(_v8, "Math"), "round", [_S.binary("-", _S.read(_v8, "y"), _S.read(_v8, "r"))]))
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "px", _S.invoke(_S.read(_v9, "Math"), "round", [_S.binary("-", _S.read(_v9, "cx"), _S.read(_v9, "half"))]))
			_S.define(_v9, "x1", _S.invoke(_S.read(_v9, "Math"), "round", [_S.binary("+", _S.read(_v9, "cx"), _S.read(_v9, "half"))]))
			while _S.truth(_S.binary("<=", _S.read(_v9, "px"), _S.read(_v9, "x1"))):
				_S.invoke(_S.read(_v9, "p"), "px", [_S.read(_v9, "px"), _S.read(_v9, "Y"), _S.read(_v9, "c")])
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "px", 1, "+=", true)
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "r", 1, "+=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "ux", _S.arg(_args, 3))
	_S.define(_e, "uy", _S.arg(_args, 4))
	_S.define(_e, "len", _S.arg(_args, 5))
	_S.define(_e, "w", _S.arg(_args, 6))
	_S.define(_e, "bend", _S.arg(_args, 7))
	_S.define(_e, "N", _S.arg(_args, 8))
	_S.define(_e, "n", _S.arg(_args, 9))
	_S.define(_e, "H", _S.arg(_args, 10))
	_S.define(_e, "layers", _S.coalesce(_S.arg(_args, 11), func(): return _S.read(_e, "LAYERS")))
	_S.define(_e, "jit", _S.coalesce(_S.arg(_args, 12), func(): return 0.5))
	_S.define(_e, "wob", _S.coalesce(_S.arg(_args, 13), func(): return 1.1))
	if _S.truth(_S.binary("<", _S.read(_e, "len"), 1)):
		return null
	_S.define(_e, "nx", _S.unary("-", _S.read(_e, "uy")))
	_S.define(_e, "ny", _S.read(_e, "ux"))
	for _v10 in _S.array(_S.read(_e, "layers")):
		var _v11 = _S.scope(_e)
		var _v12 = _v10
		_S.define(_v11, "lw", _S.prop(_v12, 0))
		_S.define(_v11, "lh", _S.prop(_v12, 1))
		_S.define(_v11, "ri", _S.prop(_v12, 2))
		var _v13 = _S.scope(_v11)
		_S.define(_v13, "L", _S.binary("*", _S.read(_v13, "len"), _S.read(_v13, "lh")))
		_S.define(_v13, "c", _S.prop(_S.read(_v13, "H"), _S.read(_v13, "ri")))
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "r", 0)
		while _S.truth(_S.binary("<=", _S.read(_v14, "r"), _S.read(_v14, "L"))):
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "u", _S.binary("/", _S.read(_v15, "r"), _S.invoke(_S.read(_v15, "Math"), "max", [1, _S.read(_v15, "L")])))
			_S.define(_v15, "half", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v15, "w"), _S.read(_v15, "lw")), _S.invoke(_S.read(_v15, "Math"), "pow", [_S.binary("-", 1, _S.read(_v15, "u")), 0.85])), _S.invoke(_S.read(_v15, "Math"), "min", [1, _S.binary("/", _S.binary("+", _S.read(_v15, "r"), 1.5), 3.5)])), _S.binary("*", _S.call_value(_S.read(_v15, "N"), [9, _S.read(_v15, "n"), _S.binary("*", _S.read(_v15, "r"), 0.45)]), _S.read(_v15, "jit"))))
			if _S.truth(_S.binary("<", _S.read(_v15, "half"), 0.3)):
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "r", 0.5, "+=", false)
				continue
			_S.define(_v15, "off", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v15, "bend"), _S.read(_v15, "u")), _S.read(_v15, "u")), _S.read(_v15, "lh")), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v15, "N"), [4, _S.binary("+", _S.read(_v15, "n"), 7), _S.binary("*", _S.read(_v15, "r"), 0.2)]), _S.read(_v15, "u")), _S.read(_v15, "wob"))))
			_S.define(_v15, "cx", _S.binary("+", _S.binary("+", _S.read(_v15, "x"), _S.binary("*", _S.read(_v15, "ux"), _S.read(_v15, "r"))), _S.binary("*", _S.read(_v15, "nx"), _S.read(_v15, "off"))))
			_S.define(_v15, "cy", _S.binary("+", _S.binary("+", _S.read(_v15, "y"), _S.binary("*", _S.read(_v15, "uy"), _S.read(_v15, "r"))), _S.binary("*", _S.read(_v15, "ny"), _S.read(_v15, "off"))))
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "q", _S.unary("-", _S.read(_v16, "half")))
			while _S.truth(_S.binary("<=", _S.read(_v16, "q"), _S.read(_v16, "half"))):
				_S.invoke(_S.read(_v16, "p"), "px", [_S.binary("+", _S.read(_v16, "cx"), _S.binary("*", _S.read(_v16, "nx"), _S.read(_v16, "q"))), _S.binary("+", _S.read(_v16, "cy"), _S.binary("*", _S.read(_v16, "ny"), _S.read(_v16, "q"))), _S.read(_v16, "c")])
				_v16 = _S.iteration(_v16)
				_S.write(_v16, "q", 0.5, "+=", false)
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "r", 0.5, "+=", false)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "c", _S.arg(_args, 4))
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 0.6)):
		return _S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "c")])
	_S.define(_e, "cx", _S.invoke(_S.read(_e, "p"), "toX", [_S.read(_e, "x"), _S.read(_e, "y")]))
	_S.define(_e, "cy", _S.invoke(_S.read(_e, "p"), "toY", [_S.read(_e, "x"), _S.read(_e, "y")]))
	_S.define(_e, "r2", _S.binary("*", _S.read(_e, "r"), _S.read(_e, "r")))
	var _v17 = _S.scope(_e)
	_S.define(_v17, "sy", _S.invoke(_S.read(_v17, "Math"), "floor", [_S.binary("-", _S.read(_v17, "cy"), _S.read(_v17, "r"))]))
	while _S.truth(_S.binary("<=", _S.read(_v17, "sy"), _S.invoke(_S.read(_v17, "Math"), "ceil", [_S.binary("+", _S.read(_v17, "cy"), _S.read(_v17, "r"))]))):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "dy", _S.binary("-", _S.binary("+", _S.read(_v18, "sy"), 0.5), _S.read(_v18, "cy")))
		_S.define(_v18, "s2", _S.binary("-", _S.read(_v18, "r2"), _S.binary("*", _S.read(_v18, "dy"), _S.read(_v18, "dy"))))
		if _S.truth(_S.binary("<", _S.read(_v18, "s2"), 0)):
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "sy", 1, "+=", true)
			continue
		_S.define(_v18, "s", _S.invoke(_S.read(_v18, "Math"), "sqrt", [_S.read(_v18, "s2")]))
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "sx", _S.invoke(_S.read(_v19, "Math"), "ceil", [_S.binary("-", _S.binary("-", _S.read(_v19, "cx"), _S.read(_v19, "s")), 0.5)]))
		while _S.truth(_S.binary("<=", _S.read(_v19, "sx"), _S.invoke(_S.read(_v19, "Math"), "floor", [_S.binary("-", _S.binary("+", _S.read(_v19, "cx"), _S.read(_v19, "s")), 0.5)]))):
			_S.invoke(_S.read(_v19, "p"), "put", [_S.read(_v19, "sx"), _S.read(_v19, "sy"), _S.read(_v19, "c"), 1])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "sx", 1, "+=", true)
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "sy", 1, "+=", true)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "c", _S.arg(_args, 4))
	_S.define(_e, "a", _S.arg(_args, 5))
	if _S.truth(_S.binary("<=", _S.read(_e, "a"), 0.004)):
		return null
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 0.5)):
		return _S.invoke(_S.read(_e, "p"), "blend", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "c"), _S.read(_e, "a")])
	_S.define(_e, "cx", _S.invoke(_S.read(_e, "p"), "toX", [_S.read(_e, "x"), _S.read(_e, "y")]))
	_S.define(_e, "cy", _S.invoke(_S.read(_e, "p"), "toY", [_S.read(_e, "x"), _S.read(_e, "y")]))
	_S.define(_e, "r2", _S.binary("*", _S.read(_e, "r"), _S.read(_e, "r")))
	var _v20 = _S.scope(_e)
	_S.define(_v20, "sy", _S.invoke(_S.read(_v20, "Math"), "floor", [_S.binary("-", _S.read(_v20, "cy"), _S.read(_v20, "r"))]))
	while _S.truth(_S.binary("<=", _S.read(_v20, "sy"), _S.invoke(_S.read(_v20, "Math"), "ceil", [_S.binary("+", _S.read(_v20, "cy"), _S.read(_v20, "r"))]))):
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "dy", _S.binary("-", _S.binary("+", _S.read(_v21, "sy"), 0.5), _S.read(_v21, "cy")))
		_S.define(_v21, "s2", _S.binary("-", _S.read(_v21, "r2"), _S.binary("*", _S.read(_v21, "dy"), _S.read(_v21, "dy"))))
		if _S.truth(_S.binary("<", _S.read(_v21, "s2"), 0)):
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "sy", 1, "+=", true)
			continue
		_S.define(_v21, "s", _S.invoke(_S.read(_v21, "Math"), "sqrt", [_S.read(_v21, "s2")]))
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "sx", _S.invoke(_S.read(_v22, "Math"), "ceil", [_S.binary("-", _S.binary("-", _S.read(_v22, "cx"), _S.read(_v22, "s")), 0.5)]))
		while _S.truth(_S.binary("<=", _S.read(_v22, "sx"), _S.invoke(_S.read(_v22, "Math"), "floor", [_S.binary("-", _S.binary("+", _S.read(_v22, "cx"), _S.read(_v22, "s")), 0.5)]))):
			_S.invoke(_S.read(_v22, "p"), "blendPx", [_S.read(_v22, "sx"), _S.read(_v22, "sy"), _S.read(_v22, "c"), _S.read(_v22, "a")])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "sx", 1, "+=", true)
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "sy", 1, "+=", true)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	_S.define(_e, "size", _S.arg(_args, 4))
	_S.define(_e, "frac", _S.arg(_args, 5))
	_S.define(_e, "H", _S.arg(_args, 6))
	_S.define(_e, "glowK", _S.coalesce(_S.arg(_args, 7), func(): return 0.18))
	_S.define(_e, "tx", _S.coalesce(_S.arg(_args, 8), func(): return 0))
	_S.define(_e, "ty", _S.coalesce(_S.arg(_args, 9), func(): return _S.unary("-", 1)))
	_S.define(_e, "age", _S.binary("-", 1, _S.read(_e, "k")))
	_S.define(_e, "n", _S.prop(_S.read(_e, "H"), "length"))
	_S.define(_e, "heat", _S.invoke(_S.read(_e, "Math"), "min", [0.999, _S.binary("+", _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "age"), 0.62]), _S.binary("*", _S.read(_e, "frac"), 0.1))]))
	_S.define(_e, "idx", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "n"), 2), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "heat"), _S.binary("-", _S.read(_e, "n"), 1))])]))
	_S.define(_e, "r", _S.binary("*", _S.binary("*", _S.read(_e, "size"), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 7)])))), _S.binary("-", 1, _S.binary("*", _S.read(_e, "age"), 0.55))))
	_S.define(_e, "c", _S.prop(_S.read(_e, "H"), _S.read(_e, "idx")))
	if _S.truth(_S.binary(">=", _S.read(_e, "idx"), _S.binary("-", _S.read(_e, "n"), 2))):
		return _S.call_value(_S.read(_e, "soft"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.read(_e, "c"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 3)]), 0.85)])
	_S.call_value(_S.read(_e, "solid"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.prop(_S.read(_e, "H"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "n"), 1), _S.binary("+", _S.read(_e, "idx"), 2)]))])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "r"), 1.6), func(): return _S.binary(">", _S.read(_e, "ty"), _S.unary("-", 0.99)))):
		_S.call_value(_S.read(_e, "solid"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "tx"), _S.read(_e, "r")), 1.5)), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "ty"), _S.read(_e, "r")), 1.5)), _S.binary("*", _S.read(_e, "r"), 0.3), _S.prop(_S.read(_e, "H"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "n"), 1), _S.binary("+", _S.read(_e, "idx"), 1)]))])
	_S.call_value(_S.read(_e, "solid"), [_S.read(_e, "p"), _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.16)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.22)), _S.binary("*", _S.read(_e, "r"), 0.78), _S.read(_e, "c")])
	if _S.truth(_S.binary(">", _S.read(_e, "r"), 1.6)):
		_S.call_value(_S.read(_e, "solid"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "tx"), _S.read(_e, "r")), 0.9)), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "ty"), _S.read(_e, "r")), 0.9)), _S.binary("*", _S.read(_e, "r"), 0.42), _S.read(_e, "c")])
	if _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_e, "idx"), 3), func(): return _S.binary(">", _S.read(_e, "r"), 1.8))):
		_S.call_value(_S.read(_e, "solid"), [_S.read(_e, "p"), _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.28)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.34)), _S.binary("*", _S.read(_e, "r"), 0.36), _S.prop(_S.read(_e, "H"), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "idx"), 1)]))])
	if _S.truth(_S.binary("<", _S.read(_e, "idx"), 6)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.binary("*", _S.read(_e, "r"), 2.4), 2), _S.read(_e, "c"), _S.binary("*", _S.read(_e, "glowK"), _S.read(_e, "k"))])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	_S.define(_e, "s", _S.arg(_args, 4))
	_S.define(_e, "H", _S.arg(_args, 5))
	_S.define(_e, "r", _S.binary("*", _S.read(_e, "s"), _S.binary("+", 0.4, _S.binary("*", 0.6, _S.read(_e, "k")))))
	_S.call_value(_S.read(_e, "solid"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "r"), 0.6), (_S.prop(_S.read(_e, "H"), 5) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.5)) else _S.prop(_S.read(_e, "H"), 6))])
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.35)):
		_S.call_value(_S.read(_e, "solid"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 0.3), _S.binary("*", _S.read(_e, "r"), 0.6), (_S.prop(_S.read(_e, "H"), 2) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.7)) else _S.prop(_S.read(_e, "H"), 4))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	_S.define(_e, "size", _S.arg(_args, 4))
	_S.define(_e, "col", _S.coalesce(_S.arg(_args, 5), func(): return 0))
	_S.define(_e, "big", _S.coalesce(_S.arg(_args, 6), func(): return false))
	_S.define(_e, "aMul", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	_S.define(_e, "age", _S.binary("-", 1, _S.read(_e, "k")))
	_S.define(_e, "r", _S.binary("*", _S.read(_e, "size"), _S.binary("+", _S.binary("+", 0.65, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 2.5)]), 0.45)), _S.binary("*", _S.read(_e, "age"), (0.5 if _S.truth(_S.read(_e, "big")) else 0.4)))))
	_S.define(_e, "a", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 12)]), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 2.4)])), (0.7 if _S.truth(_S.read(_e, "big")) else 0.58)), _S.read(_e, "aMul")))
	_S.define(_e, "c", (_S.call_value(_S.read(_e, "mix"), [_S.read(_e, "col"), _S.call_value(_S.read(_e, "rampAt"), [_S.read(_e, "SMOKE_RAMP"), _S.read(_e, "age")]), _S.read(_e, "age")]) if _S.truth(_S.read(_e, "col")) else _S.call_value(_S.read(_e, "rampAt"), [_S.read(_e, "SMOKE_RAMP"), _S.binary("*", _S.read(_e, "age"), 1.05)])))
	_S.call_value(_S.read(_e, "soft"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.read(_e, "c"), _S.binary("*", _S.read(_e, "a"), 0.45)])
	_S.call_value(_S.read(_e, "soft"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.05)), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.06)), _S.binary("*", _S.read(_e, "r"), 0.74), _S.read(_e, "c"), _S.binary("*", _S.read(_e, "a"), 0.62)])
	if _S.truth(_S.binary("<", _S.read(_e, "age"), 0.5)):
		_S.call_value(_S.read(_e, "soft"), [_S.read(_e, "p"), _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.22)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.3)), _S.binary("*", _S.read(_e, "r"), 0.5), _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.read(_e, "WHITE"), 0.12]), _S.binary("*", _S.binary("*", _S.read(_e, "a"), 0.4), _S.binary("-", 1, _S.binary("*", _S.read(_e, "age"), 2)))])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	_S.define(_e, "size", _S.arg(_args, 4))
	_S.define(_e, "cols", _S.arg(_args, 5))
	_S.define(_e, "ph", _S.arg(_args, 6))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "k"), 0.25), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ph")]), 0))):
		return null
	_S.define(_e, "c", (_S.prop(_S.read(_e, "cols"), 0) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.6)) else (_S.prop(_S.read(_e, "cols"), 1) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.3)) else _S.prop(_S.read(_e, "cols"), 2))))
	if _S.truth(_S.binary(">=", _S.read(_e, "size"), 2)):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "rim", (_S.prop(_S.read(_v23, "cols"), 2) if _S.truth(_S.binary(">", _S.read(_v23, "k"), 0.45)) else _S.prop(_S.read(_v23, "cols"), 3)))
		_S.last([_S.invoke(_S.read(_v23, "p"), "px", [_S.binary("-", _S.read(_v23, "x"), 1), _S.read(_v23, "y"), _S.read(_v23, "rim")]), _S.invoke(_S.read(_v23, "p"), "px", [_S.binary("+", _S.read(_v23, "x"), 1), _S.read(_v23, "y"), _S.read(_v23, "rim")]), _S.invoke(_S.read(_v23, "p"), "px", [_S.read(_v23, "x"), _S.binary("-", _S.read(_v23, "y"), 1), _S.read(_v23, "rim")]), _S.invoke(_S.read(_v23, "p"), "px", [_S.read(_v23, "x"), _S.binary("+", _S.read(_v23, "y"), 1), _S.read(_v23, "rim")])])
		_S.invoke(_S.read(_v23, "p"), "px", [_S.read(_v23, "x"), _S.read(_v23, "y"), _S.read(_v23, "c")])
		_S.invoke(_S.read(_v23, "p"), "glow", [_S.read(_v23, "x"), _S.read(_v23, "y"), 8, _S.read(_v23, "c"), _S.binary("*", 0.4, _S.read(_v23, "k"))])
		return null
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "c")])
	if _S.truth(_S.binary(">", _S.read(_e, "size"), 1.4)):
		_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1), _S.prop(_S.read(_e, "cols"), 3)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 3, _S.read(_e, "size")), _S.read(_e, "c"), _S.binary("*", 0.35, _S.read(_e, "k"))])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "vx", _S.arg(_args, 3))
	_S.define(_e, "vy", _S.arg(_args, 4))
	_S.define(_e, "k", _S.arg(_args, 5))
	_S.define(_e, "cols", _S.arg(_args, 6))
	_S.define(_e, "sp", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "vx"), _S.read(_e, "vy")]), func(): return 1))
	_S.define(_e, "ux", _S.binary("/", _S.read(_e, "vx"), _S.read(_e, "sp")))
	_S.define(_e, "uy", _S.binary("/", _S.read(_e, "vy"), _S.read(_e, "sp")))
	_S.define(_e, "len", _S.invoke(_S.read(_e, "Math"), "min", [9, _S.binary("+", 1, _S.binary("*", _S.read(_e, "sp"), 0.022))]))
	_S.define(_e, "head", (_S.prop(_S.read(_e, "cols"), 0) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.6)) else (_S.prop(_S.read(_e, "cols"), 1) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.3)) else _S.prop(_S.read(_e, "cols"), 2))))
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "len"))), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "len"))), _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "len")), 0.4)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "len")), 0.4)), (_S.read(_e, "head") if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.5)) else _S.prop(_S.read(_e, "cols"), _S.binary("-", _S.prop(_S.read(_e, "cols"), "length"), 1)))])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "len")), 0.45)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "len")), 0.45)), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "head")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.read(_e, "head"), _S.binary("*", 0.45, _S.read(_e, "k"))])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	_S.define(_e, "a", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0)):
		return [_S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "v"), _S.read(_e, "t"))), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "a")), _S.read(_e, "t")), _S.read(_e, "t"))), _S.binary("+", _S.read(_e, "v"), _S.binary("*", _S.read(_e, "a"), _S.read(_e, "t")))]
	_S.define(_e, "e", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "k")), _S.read(_e, "t"))]))
	_S.define(_e, "vt", _S.binary("/", _S.read(_e, "a"), _S.read(_e, "k")))
	return [_S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "vt"), _S.read(_e, "t"))), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_e, "v"), _S.read(_e, "vt")), _S.binary("-", 1, _S.read(_e, "e"))), _S.read(_e, "k"))), _S.binary("+", _S.read(_e, "vt"), _S.binary("*", _S.binary("-", _S.read(_e, "v"), _S.read(_e, "vt")), _S.read(_e, "e")))]

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "vy", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "ax", _S.arg(_args, 5))
	_S.define(_e, "ay", _S.arg(_args, 6))
	_S.define(_e, "kx", _S.arg(_args, 7))
	_S.define(_e, "ky", _S.arg(_args, 8))
	_S.define(_e, "X", _S.call_value(_S.read(_e, "along"), [_S.read(_e, "x"), _S.read(_e, "vx"), _S.read(_e, "ax"), _S.read(_e, "kx"), _S.read(_e, "t")]))
	_S.define(_e, "Y", _S.call_value(_S.read(_e, "along"), [_S.read(_e, "y"), _S.read(_e, "vy"), _S.read(_e, "ay"), _S.read(_e, "ky"), _S.read(_e, "t")]))
	return [_S.prop(_S.read(_e, "X"), 0), _S.prop(_S.read(_e, "Y"), 0), _S.prop(_S.read(_e, "X"), 1), _S.prop(_S.read(_e, "Y"), 1)]

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "vy", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "floor", _S.coalesce(_S.arg(_args, 5), func(): return 0))
	_S.define(_e, "g", _S.coalesce(_S.arg(_args, 6), func(): return 427))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 7), func(): return 2.2))
	_S.define(_e, "s", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "vx"), _S.read(_e, "vy")])
	_S.define(_e, "left", _S.read(_e, "t"))
	var _v24 = _S.scope(_e)
	_S.define(_v24, "b", 0)
	while _S.truth(_S.binary("<", _S.read(_v24, "b"), 3)):
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "e", _S.call_value(_S.read(_v25, "drift"), [_S.prop(_S.read(_v25, "s"), 0), _S.prop(_S.read(_v25, "s"), 1), _S.prop(_S.read(_v25, "s"), 2), _S.prop(_S.read(_v25, "s"), 3), _S.read(_v25, "left"), 0, _S.read(_v25, "g"), _S.read(_v25, "k"), _S.read(_v25, "k")]))
		if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v25, "e"), 1), _S.read(_v25, "floor")), func(): return _S.binary(">=", _S.prop(_S.read(_v25, "s"), 1), _S.read(_v25, "floor")))):
			return _S.read(_v25, "e")
		_S.define(_v25, "lo", 0)
		_S.define(_v25, "hi", _S.read(_v25, "left"))
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), 16)):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "m", _S.binary("/", _S.binary("+", _S.read(_v27, "lo"), _S.read(_v27, "hi")), 2))
			if _S.truth(_S.binary("<", _S.prop(_S.call_value(_S.read(_v27, "drift"), [_S.prop(_S.read(_v27, "s"), 0), _S.prop(_S.read(_v27, "s"), 1), _S.prop(_S.read(_v27, "s"), 2), _S.prop(_S.read(_v27, "s"), 3), _S.read(_v27, "m"), 0, _S.read(_v27, "g"), _S.read(_v27, "k"), _S.read(_v27, "k")]), 1), _S.read(_v27, "floor"))):
				_S.write(_v27, "lo", _S.read(_v27, "m"), "=", false)
			else:
				_S.write(_v27, "hi", _S.read(_v27, "m"), "=", false)
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
		_S.define(_v25, "c", _S.call_value(_S.read(_v25, "drift"), [_S.prop(_S.read(_v25, "s"), 0), _S.prop(_S.read(_v25, "s"), 1), _S.prop(_S.read(_v25, "s"), 2), _S.prop(_S.read(_v25, "s"), 3), _S.read(_v25, "hi"), 0, _S.read(_v25, "g"), _S.read(_v25, "k"), _S.read(_v25, "k")]))
		_S.write(_v25, "s", [_S.prop(_S.read(_v25, "c"), 0), _S.binary("-", _S.read(_v25, "floor"), 0.25), _S.binary("*", _S.prop(_S.read(_v25, "c"), 2), 0.7), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v25, "Math"), "abs", [_S.prop(_S.read(_v25, "c"), 3)])), 0.45)], "=", false)
		_S.write(_v25, "left", _S.read(_v25, "hi"), "-=", false)
		_v24 = _S.iteration(_v24)
		_S.write(_v24, "b", 1, "+=", true)
	_S.define(_e, "e", _S.call_value(_S.read(_e, "drift"), [_S.prop(_S.read(_e, "s"), 0), _S.prop(_S.read(_e, "s"), 1), _S.prop(_S.read(_e, "s"), 2), _S.prop(_S.read(_e, "s"), 3), _S.read(_e, "left"), 0, _S.read(_e, "g"), _S.read(_e, "k"), _S.read(_e, "k")]))
	return (_S.read(_e, "e") if _S.truth(_S.binary("<", _S.prop(_S.read(_e, "e"), 1), _S.read(_e, "floor"))) else [_S.prop(_S.read(_e, "e"), 0), _S.binary("-", _S.read(_e, "floor"), 0.25), _S.prop(_S.read(_e, "e"), 2), 0])

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "rx", _S.arg(_args, 3))
	_S.define(_e, "ry", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "k", _S.arg(_args, 6))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<=", _S.read(_e, "k"), 0.004), func(): return _S.binary("<", _S.read(_e, "rx"), 1)), func(): return _S.binary("<", _S.read(_e, "ry"), 0.5))):
		return null
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "rx")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ry")), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "rx")), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "ry")), _S.function_value(_e, "_f18")])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")), _S.read(_e, "rx")))
	_S.define(_e, "dy", _S.binary("/", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")), _S.read(_e, "ry")))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy"))))
	if _S.truth(_S.binary(">=", _S.read(_e, "d"), 1)):
		return null
	_S.define(_e, "f", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "d")])))
	_S.set_prop(_S.read(_e, "out"), "l", _S.read(_e, "c"), "=", false)
	_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.binary("*", _S.read(_e, "f"), _S.read(_e, "f")), _S.read(_e, "k")), "=", false)
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "ps", _S.arg(_args, 1))
	_S.define(_e, "H", _S.arg(_args, 2))
	_S.define(_e, "layer", _S.arg(_args, 3))
	_S.define(_e, "all", _S.prop(_S.read(_e, "ps"), "list"))
	_S.define(_e, "rest", [])
	_S.define(_e, "fire", [])
	for _v28 in _S.array(_S.read(_e, "all")):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "q", _v28)
		_S.invoke((_S.read(_v29, "fire") if _S.truth(_S.binary("===", _S.prop(_S.read(_v29, "q"), "k"), _S.prop(_S.read(_v29, "P"), "FIRE"))) else _S.read(_v29, "rest")), "push", [_S.read(_v29, "q")])
	_S.define(_e, "puffs", _S.function_value(_e, "_f20"))
	_S.set_prop(_S.read(_e, "ps"), "list", _S.read(_e, "rest"), "=", false)
	if _S.truth(_S.binary("!==", _S.read(_e, "layer"), "front")):
		_S.last([_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"]), _S.call_value(_S.read(_e, "puffs"), [true])])
	if _S.truth(_S.binary("!==", _S.read(_e, "layer"), "back")):
		_S.last([_S.call_value(_S.read(_e, "puffs"), [false]), _S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])])
	_S.set_prop(_S.read(_e, "ps"), "list", _S.read(_e, "all"), "=", false)
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "back", _S.arg(_args, 0))
	for _v30 in _S.array(_S.read(_e, "fire")):
		var _v31 = _S.scope(_e)
		_S.define(_v31, "q", _v30)
		if _S.truth(_S.logical("&&", _S.binary("<=", _S.prop(_S.read(_v31, "q"), "delay"), 0), func(): return _S.binary("===", _S.unary("!", _S.unary("!", _S.binary("&", _S.prop(_S.read(_v31, "q"), "flag"), _S.prop(_S.read(_v31, "PF"), "BACK")))), _S.read(_v31, "back")))):
			_S.call_value(_S.read(_v31, "firePuff"), [_S.read(_v31, "p"), _S.prop(_S.read(_v31, "q"), "x"), _S.prop(_S.read(_v31, "q"), "y"), _S.binary("/", _S.prop(_S.read(_v31, "q"), "life"), _S.prop(_S.read(_v31, "q"), "max")), _S.prop(_S.read(_v31, "q"), "size"), _S.binary("%", _S.prop(_S.read(_v31, "q"), "seed"), 1), _S.read(_v31, "H")])
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "T", _S.arg(_args, 2))
	_S.define(_e, "o", _S.arg(_args, 3))
	var _v32 = _S.read(_e, "o")
	_S.define(_e, "H", _S.prop(_v32, "H"))
	_S.define(_e, "D", _S.prop(_v32, "D"))
	_S.define(_e, "NL", _S.prop(_v32, "NL"))
	_S.define(_e, "S", _S.prop(_v32, "S"))
	_S.define(_e, "HC", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "X", _S.logical("??", _S.prop(_S.read(_e, "o"), "x"), func(): return 0))
	_S.define(_e, "Y", _S.logical("??", _S.prop(_S.read(_e, "o"), "y"), func(): return 0))
	_S.define(_e, "W", _S.logical("??", _S.prop(_S.read(_e, "o"), "spread"), func(): return 6))
	_S.define(_e, "G", _S.logical("??", _S.prop(_S.read(_e, "o"), "glow"), func(): return 1))
	_S.define(_e, "N", _S.function_value(_e, "_f22"))
	_S.define(_e, "fla", _S.function_value(_e, "_f23"))
	_S.define(_e, "fl", _S.call_value(_S.read(_e, "fla"), [_S.read(_e, "t")]))
	_S.define(_e, "SMOKE", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "SMOKE1"), _S.prop(_S.read(_e, "H"), 6), 0.25]))
	_S.define(_e, "EMB", [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 6)])
	_S.define(_e, "GLOW", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), 0.5]), _S.read(_e, "WHITE"), 0.25]))
	_S.define(_e, "R", _S.call_value(_S.read(_e, "rng"), [_S.read(_e, "S"), 77]))
	_S.define(_e, "count", _S.function_value(_e, "_f24"))
	_S.define(_e, "TT", _S.invoke(_S.read(_e, "T"), "map", [_S.function_value(_e, "_f25")]))
	_S.define(_e, "lean", _S.function_value(_e, "_f26"))
	_S.define(_e, "height", _S.function_value(_e, "_f27"))
	_S.define(_e, "sweep", _S.function_value(_e, "_f28"))
	_S.define(_e, "tip", _S.function_value(_e, "_f29"))
	_S.define(_e, "tongueAt", _S.function_value(_e, "_f30"))
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.call_value(_S.read(_e, "count"), [_S.logical("??", _S.prop(_S.read(_e, "o"), "smoke"), func(): return 12)]), _S.binary("+", _S.read(_e, "S"), 300), _S.function_value(_e, "_f31"), _S.function_value(_e, "_f32")])
	_S.define(_e, "puffs", [])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.binary("*", _S.prop(_S.read(_e, "TT"), "length"), _S.call_value(_S.read(_e, "count"), [_S.logical("??", _S.prop(_S.read(_e, "o"), "puffs"), func(): return 8)])), _S.binary("+", _S.read(_e, "S"), 200), _S.function_value(_e, "_f33"), _S.function_value(_e, "_f34")])
	var _v40 = _S.scope(_e)
	_S.define(_v40, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v40, "i"), _S.prop(_S.read(_v40, "TT"), "length"))):
		if _S.truth(_S.prop(_S.prop(_S.read(_v40, "TT"), _S.read(_v40, "i")), "back")):
			_S.call_value(_S.read(_v40, "tongueAt"), [_S.read(_v40, "i")])
		_v40 = _S.iteration(_v40)
		_S.write(_v40, "i", 1, "+=", true)
	var _v41 = _S.scope(_e)
	_S.define(_v41, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v41, "i"), _S.prop(_S.read(_v41, "TT"), "length"))):
		if _S.truth(_S.unary("!", _S.prop(_S.prop(_S.read(_v41, "TT"), _S.read(_v41, "i")), "back"))):
			_S.call_value(_S.read(_v41, "tongueAt"), [_S.read(_v41, "i")])
		_v41 = _S.iteration(_v41)
		_S.write(_v41, "i", 1, "+=", true)
	_S.optional_call(_S.prop(_S.read(_e, "o"), "mid"), [_S.read(_e, "fl")])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.binary("*", _S.prop(_S.read(_e, "TT"), "length"), _S.call_value(_S.read(_e, "count"), [_S.logical("??", _S.prop(_S.read(_e, "o"), "licks"), func(): return 4)])), _S.binary("+", _S.read(_e, "S"), 220), _S.function_value(_e, "_f35"), _S.function_value(_e, "_f36")])
	for _v43 in _S.array(_S.read(_e, "puffs")):
		var _v44 = _S.scope(_e)
		var _v45 = _v43
		_S.define(_v44, "x", _S.prop(_v45, 0))
		_S.define(_v44, "y", _S.prop(_v45, 1))
		_S.define(_v44, "k", _S.prop(_v45, 2))
		_S.define(_v44, "s", _S.prop(_v45, 3))
		_S.define(_v44, "f", _S.prop(_v45, 4))
		_S.call_value(_S.read(_v44, "firePuff"), [_S.read(_v44, "p"), _S.read(_v44, "x"), _S.read(_v44, "y"), _S.read(_v44, "k"), _S.read(_v44, "s"), _S.read(_v44, "f"), _S.read(_v44, "H")])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), _S.call_value(_S.read(_e, "count"), [_S.logical("??", _S.prop(_S.read(_e, "o"), "embers"), func(): return 8)]), _S.binary("+", _S.read(_e, "S"), 500), _S.function_value(_e, "_f37"), _S.function_value(_e, "_f38")])
	if _S.truth(_S.binary(">", _S.read(_e, "G"), 0)):
		var _v47 = _S.scope(_e)
		_S.define(_v47, "R1", _S.logical("??", _S.prop(_S.read(_v47, "o"), "glowR"), func(): return 46))
		_S.define(_v47, "lx", _S.binary("+", _S.read(_v47, "X"), _S.binary("*", _S.call_value(_S.read(_v47, "lean"), [_S.read(_v47, "t")]), 12)))
		_S.invoke(_S.read(_v47, "p"), "glow", [_S.read(_v47, "lx"), _S.binary("-", _S.read(_v47, "Y"), _S.binary("*", _S.read(_v47, "HC"), 0.35)), _S.binary("*", _S.read(_v47, "R1"), 1.5), _S.read(_v47, "GLOW"), _S.binary("*", _S.binary("*", 0.22, _S.read(_v47, "fl")), _S.read(_v47, "G"))])
		_S.invoke(_S.read(_v47, "p"), "glow", [_S.read(_v47, "lx"), _S.binary("-", _S.read(_v47, "Y"), _S.binary("*", _S.read(_v47, "HC"), 0.75)), _S.read(_v47, "R1"), _S.read(_v47, "GLOW"), _S.binary("*", _S.binary("*", 0.34, _S.read(_v47, "fl")), _S.read(_v47, "G"))])
		_S.invoke(_S.read(_v47, "p"), "glow", [_S.read(_v47, "X"), _S.binary("-", _S.read(_v47, "Y"), _S.binary("*", _S.read(_v47, "HC"), 0.2)), _S.binary("*", _S.read(_v47, "R1"), 0.32), _S.prop(_S.read(_v47, "H"), 2), _S.binary("*", _S.binary("*", 0.2, _S.read(_v47, "fl")), _S.read(_v47, "G"))])
		_S.invoke(_S.read(_v47, "p"), "glow", [_S.read(_v47, "X"), _S.binary("-", _S.read(_v47, "Y"), 2), 8, _S.prop(_S.read(_v47, "H"), 0), _S.binary("*", _S.binary("*", 0.14, _S.read(_v47, "fl")), _S.read(_v47, "G"))])
	return _S.merge([{"tip": _S.read(_e, "tip")}, {"fl": _S.read(_e, "fl")}])

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rate", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	_S.define(_e, "off", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), _S.read(_e, "rate"), _S.read(_e, "seed"), _S.read(_e, "off")])

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", 0.74, _S.binary("*", 0.16, _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "tt"), 7.3, _S.binary("+", _S.read(_e, "S"), 1)]))), _S.binary("*", 0.1, _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "tt"), 19, _S.binary("+", _S.read(_e, "S"), 2)])))

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rate", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "rate"), _S.read(_e, "D"))])

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v33 = _S.arg(_args, 0)
	_S.define(_e, "dx", _S.prop(_v33, 0))
	_S.define(_e, "dy", _S.prop(_v33, 1))
	_S.define(_e, "h", _S.prop(_v33, 2))
	_S.define(_e, "w", _S.prop(_v33, 3))
	_S.define(_e, "back", _S.prop(_v33, 4))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"dx": _S.binary("+", _S.read(_e, "dx"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.3), 0.3]))}, {"y": _S.read(_e, "dy")}, {"h": _S.binary("+", 2, _S.binary("*", _S.binary("*", _S.read(_e, "HC"), _S.read(_e, "h")), _S.invoke(_S.read(_e, "R"), "range", [0.92, 1.08])))}, {"w": _S.binary("*", _S.read(_e, "w"), _S.invoke(_S.read(_e, "R"), "range", [0.92, 1.08]))}, {"back": _S.read(_e, "back")}, {"env": _S.read(_e, "h")}, {"n": _S.binary("*", _S.binary("+", _S.binary("*", _S.read(_e, "S"), 7), _S.read(_e, "i")), 13)}])

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("*", _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "tt"), 0.67, _S.binary("+", _S.read(_e, "S"), 90)]), _S.logical("??", _S.prop(_S.read(_e, "o"), "lean"), func(): return 0.1))

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	var _v34 = _S.prop(_S.read(_e, "TT"), _S.read(_e, "i"))
	_S.define(_e, "h", _S.prop(_v34, "h"))
	_S.define(_e, "n", _S.prop(_v34, "n"))
	_S.define(_e, "leap", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "tt"), 2.6, _S.binary("+", _S.read(_e, "n"), 70)]), 0.55)]), 1.4))
	return _S.binary("*", _S.binary("+", _S.binary("+", _S.read(_e, "h"), _S.binary("*", _S.binary("*", 0.25, _S.read(_e, "h")), _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "tt"), 3.3, _S.read(_e, "n")]))), _S.binary("*", _S.read(_e, "h"), _S.read(_e, "leap"))), _S.binary("+", 0.9, _S.binary("*", 0.1, _S.call_value(_S.read(_e, "fla"), [_S.read(_e, "tt")]))))

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	_S.define(_e, "h", _S.arg(_args, 2))
	return _S.binary("-", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "tt"), 2.2, _S.binary("+", _S.prop(_S.prop(_S.read(_e, "TT"), _S.read(_e, "i")), "n"), 40)]), _S.binary("+", 1, _S.binary("*", _S.read(_e, "h"), 0.08))), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "lean"), [_S.read(_e, "tt")]), _S.read(_e, "h")), 0.9)), _S.call_value(_S.read(_e, "clamp"), [_S.binary("*", _S.prop(_S.prop(_S.read(_e, "TT"), _S.read(_e, "i")), "dx"), 0.3), _S.unary("-", 2.5), 2.5]))

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "height"), [_S.read(_e, "i"), _S.read(_e, "tt")]))
	return [_S.binary("+", _S.binary("+", _S.read(_e, "X"), _S.prop(_S.prop(_S.read(_e, "TT"), _S.read(_e, "i")), "dx")), _S.binary("*", _S.call_value(_S.read(_e, "sweep"), [_S.read(_e, "i"), _S.read(_e, "tt"), _S.read(_e, "h")]), 0.85)), _S.binary("+", _S.binary("-", _S.binary("+", _S.read(_e, "Y"), _S.prop(_S.prop(_S.read(_e, "TT"), _S.read(_e, "i")), "y")), _S.binary("*", _S.read(_e, "h"), 0.88)), 3), _S.read(_e, "h")]

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	var _v35 = _S.prop(_S.read(_e, "TT"), _S.read(_e, "i"))
	_S.define(_e, "dx", _S.prop(_v35, "dx"))
	_S.define(_e, "y", _S.prop(_v35, "y"))
	_S.define(_e, "w", _S.prop(_v35, "w"))
	_S.define(_e, "n", _S.prop(_v35, "n"))
	_S.define(_e, "back", _S.prop(_v35, "back"))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "height"), [_S.read(_e, "i"), _S.read(_e, "t")]))
	_S.call_value(_S.read(_e, "flameTongue"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "X"), _S.read(_e, "dx")), _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "y")), _S.read(_e, "h"), _S.read(_e, "w"), _S.call_value(_S.read(_e, "sweep"), [_S.read(_e, "i"), _S.read(_e, "t"), _S.read(_e, "h")]), _S.read(_e, "N"), _S.read(_e, "n"), _S.read(_e, "H"), (_S.read(_e, "BACK_LAYERS") if _S.truth(_S.read(_e, "back")) else (_S.read(_e, "BIG_LAYERS") if _S.truth(_S.binary(">", _S.read(_e, "w"), 2.2)) else _S.read(_e, "LAYERS"))), 0.5, _S.binary("+", 1.1, _S.binary("*", _S.read(_e, "h"), 0.04))])
	return null

static func _f31(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", _S.read(_e, "W")), _S.read(_e, "W")]), 0.7)}, {"y": _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_e, "HC")), 0.8), _S.invoke(_S.read(_e, "r"), "range", [0, 6]))}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 2), 2])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [10, 17]))}, {"life": _S.invoke(_S.read(_e, "r"), "range", _S.concat([_S.array(_S.logical("??", _S.prop(_S.read(_e, "o"), "smokeLife"), func(): return [1.6, 2.6]))]))}, {"s": _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0.7, 1.1]), _S.logical("??", _S.prop(_S.read(_e, "o"), "smokeSize"), func(): return 3))}])

static func _f32(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v36 = _S.call_value(_S.read(_e, "drift"), [_S.prop(_S.read(_e, "q"), "x"), _S.prop(_S.read(_e, "q"), "y"), _S.prop(_S.read(_e, "q"), "vx"), _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"), _S.logical("??", _S.prop(_S.read(_e, "o"), "wind"), func(): return 3), _S.unary("-", 20), 1.6, 1])
	_S.define(_e, "x", _S.prop(_v36, 0))
	_S.define(_e, "y", _S.prop(_v36, 1))
	_S.call_value(_S.read(_e, "smokePuff"), [_S.read(_e, "p"), _S.binary("+", _S.binary("+", _S.read(_e, "X"), _S.read(_e, "x")), _S.binary("*", _S.call_value(_S.read(_e, "NL"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), 0.8, _S.binary("+", _S.read(_e, "S"), 60)]), _S.binary("+", 1.5, _S.binary("*", 2.5, _S.read(_e, "age"))))), _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "y")), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))), _S.prop(_S.read(_e, "q"), "s"), _S.read(_e, "SMOKE")])
	return null

static func _f33(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	_S.define(_e, "i", _S.binary("%", _S.read(_e, "j"), _S.prop(_S.read(_e, "TT"), "length")))
	_S.define(_e, "fire", _S.invoke(_S.read(_e, "r"), "range", [0.14, 0.3]))
	_S.define(_e, "smokes", _S.invoke(_S.read(_e, "r"), "chance", [0.45]))
	return _S.merge([{"i": _S.read(_e, "i")}, {"fire": _S.read(_e, "fire")}, {"smokes": _S.read(_e, "smokes")}, {"sl": _S.invoke(_S.read(_e, "r"), "range", [0.8, 1.4])}, {"ox": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1), 1])}, {"oy": _S.invoke(_S.read(_e, "r"), "range", [0, 4])}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 4), 4])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [15, 30]))}, {"s": _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0.8, 1.6]), _S.binary("+", 0.8, _S.binary("*", 0.6, _S.prop(_S.prop(_S.read(_e, "TT"), _S.read(_e, "i")), "env"))))}, {"f": _S.invoke(_S.read(_e, "r"), "next", [])}, {"life": _S.binary("+", _S.read(_e, "fire"), (1.4 if _S.truth(_S.read(_e, "smokes")) else 0))}])

static func _f34(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v37 = _S.call_value(_S.read(_e, "tip"), [_S.prop(_S.read(_e, "q"), "i"), _S.binary("-", _S.read(_e, "t"), _S.read(_e, "age"))])
	_S.define(_e, "tx", _S.prop(_v37, 0))
	_S.define(_e, "ty", _S.prop(_v37, 1))
	var _v38 = _S.call_value(_S.read(_e, "drift"), [_S.binary("+", _S.read(_e, "tx"), _S.prop(_S.read(_e, "q"), "ox")), _S.binary("+", _S.read(_e, "ty"), _S.prop(_S.read(_e, "q"), "oy")), _S.prop(_S.read(_e, "q"), "vx"), _S.prop(_S.read(_e, "q"), "vy"), _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fire")]), 0, _S.unary("-", 95), 5, 3.2])
	_S.define(_e, "x", _S.prop(_v38, 0))
	_S.define(_e, "y", _S.prop(_v38, 1))
	_S.define(_e, "vx", _S.prop(_v38, 2))
	_S.define(_e, "vy", _S.prop(_v38, 3))
	if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fire"))):
		return _S.invoke(_S.read(_e, "puffs"), "push", [[_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fire"))), _S.prop(_S.read(_e, "q"), "s"), _S.prop(_S.read(_e, "q"), "f")]])
	if _S.truth(_S.binary(">", _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fire")), _S.prop(_S.read(_e, "q"), "sl"))):
		return null
	var _v39 = _S.call_value(_S.read(_e, "drift"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.read(_e, "vx"), 0.6), _S.binary("-", _S.binary("*", _S.read(_e, "vy"), 0.6), 6), _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fire")), _S.logical("??", _S.prop(_S.read(_e, "o"), "wind"), func(): return 3), _S.unary("-", 16), 1.6, 1.2])
	_S.define(_e, "sx", _S.prop(_v39, 0))
	_S.define(_e, "sy", _S.prop(_v39, 1))
	_S.call_value(_S.read(_e, "smokePuff"), [_S.read(_e, "p"), _S.read(_e, "sx"), _S.read(_e, "sy"), _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fire")), _S.prop(_S.read(_e, "q"), "sl"))), _S.binary("*", _S.prop(_S.read(_e, "q"), "s"), 0.7), 0])
	return null

static func _f35(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.merge([{"i": _S.binary("%", _S.read(_e, "j"), _S.prop(_S.read(_e, "TT"), "length"))}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 3), 3])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [12, 22]))}, {"s": _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0.9, 1.6]), _S.binary("+", 0.8, _S.binary("*", 0.5, _S.prop(_S.prop(_S.read(_e, "TT"), _S.binary("%", _S.read(_e, "j"), _S.prop(_S.read(_e, "TT"), "length"))), "env"))))}, {"life": 0.26}])

static func _f36(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v42 = _S.call_value(_S.read(_e, "tip"), [_S.prop(_S.read(_e, "q"), "i"), _S.binary("-", _S.read(_e, "t"), _S.read(_e, "age"))])
	_S.define(_e, "tx", _S.prop(_v42, 0))
	_S.define(_e, "ty", _S.prop(_v42, 1))
	_S.call_value(_S.read(_e, "lick"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "tx"), _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), _S.read(_e, "age"))), _S.binary("+", _S.binary("-", _S.read(_e, "ty"), 2), _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"))), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))), _S.prop(_S.read(_e, "q"), "s"), _S.read(_e, "H")])
	return null

static func _f37(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"x": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", _S.read(_e, "W")), _S.read(_e, "W")])}, {"y": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [_S.binary("*", _S.read(_e, "HC"), 0.3), _S.binary("*", _S.read(_e, "HC"), 0.8)]))}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 15), 15])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [25, 60]))}, {"life": _S.invoke(_S.read(_e, "r"), "range", [1.1, 2.4])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.15])) else _S.invoke(_S.read(_e, "r"), "range", [1, 1.6]))}, {"a": _S.invoke(_S.read(_e, "r"), "range", [0, 6.3])}, {"b": _S.invoke(_S.read(_e, "r"), "range", [0, 6.3])}])

static func _f38(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v46 = _S.call_value(_S.read(_e, "drift"), [_S.prop(_S.read(_e, "q"), "x"), _S.prop(_S.read(_e, "q"), "y"), _S.prop(_S.read(_e, "q"), "vx"), _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"), 0, _S.unary("-", 30), 1.6, 1.6])
	_S.define(_e, "x", _S.prop(_v46, 0))
	_S.define(_e, "y", _S.prop(_v46, 1))
	_S.call_value(_S.read(_e, "ember"), [_S.read(_e, "p"), _S.binary("+", _S.binary("+", _S.read(_e, "X"), _S.read(_e, "x")), _S.binary("*", 7, _S.binary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2.3), _S.prop(_S.read(_e, "q"), "a"))]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "q"), "a")])))), _S.binary("+", _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "y")), _S.binary("*", 2, _S.binary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 3), _S.prop(_S.read(_e, "q"), "b"))]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "q"), "b")])))), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))), _S.prop(_S.read(_e, "q"), "s"), _S.read(_e, "EMB"), _S.binary("+", _S.binary("*", _S.read(_e, "age"), 40), _S.prop(_S.read(_e, "q"), "a"))])
	return null

static func _f39(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "N", _S.arg(_args, 0))
	_S.define(_e, "s", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	return _S.binary("+", _S.binary("+", 0.74, _S.binary("*", 0.16, _S.call_value(_S.read(_e, "N"), [7.3, _S.binary("+", 1, _S.read(_e, "s"))]))), _S.binary("*", 0.1, _S.call_value(_S.read(_e, "N"), [19, _S.binary("+", 2, _S.read(_e, "s"))])))

static func _f40(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "F", _S.arg(_args, 0))
	return _S.invoke(_S.concat([_S.array(_S.read(_e, "F"))]), "reverse", [])

static func _f41(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	return _S.prop(_S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_e, "r"), "length"), 1), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), _S.prop(_S.read(_e, "r"), "length"))])])]))
