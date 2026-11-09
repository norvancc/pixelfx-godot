@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "SMOKE_RAMP", _S.import_value("core/index.js", "SMOKE_RAMP"))
	_S.define(_e, "shape", _S.function_value(_e, "_f0"))
	_S.define(_e, "wnoise", _S.function_value(_e, "_f2"))
	_S.define(_e, "tnoise", _S.function_value(_e, "_f3"))
	_S.define(_e, "tongue", _S.function_value(_e, "_f4"))
	_S.define(_e, "flame", _S.function_value(_e, "_f5"))
	_S.define(_e, "smoke", _S.function_value(_e, "_f6"))
	_S.define(_e, "ember", _S.function_value(_e, "_f7"))
	_S.define(_e, "haze", _S.function_value(_e, "_f8"))
	_S.define(_e, "bitmap", _S.function_value(_e, "_f9"))
	_S.define(_e, "icon", _S.function_value(_e, "_f11"))
	_S.define(_e, "starShape", _S.function_value(_e, "_f13"))
	_S.define(_e, "eyes", _S.function_value(_e, "_f15"))
	_S.define(_e, "SHAPES", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["shape"] = _S.read(_e, "shape")
	_S.define(_e, "colorAt", _S.function_value(_e, "_f24"))
	_exports["colorAt"] = _S.read(_e, "colorAt")
	_exports["wnoise"] = _S.read(_e, "wnoise")
	_exports["tnoise"] = _S.read(_e, "tnoise")
	_S.define(_e, "travel", _S.function_value(_e, "_f25"))
	_exports["travel"] = _S.read(_e, "travel")
	_S.define(_e, "LAYERS", [[1, 1, 6], [0.76, 0.86, 4], [0.54, 0.68, 2], [0.3, 0.42, 0]])
	_exports["LAYERS"] = _S.read(_e, "LAYERS")
	_exports["tongue"] = _S.read(_e, "tongue")
	_exports["flame"] = _S.read(_e, "flame")
	_S.define(_e, "rampAt", _S.function_value(_e, "_f26"))
	_exports["smoke"] = _S.read(_e, "smoke")
	_exports["ember"] = _S.read(_e, "ember")
	_exports["haze"] = _S.read(_e, "haze")
	_exports["bitmap"] = _S.read(_e, "bitmap")
	_exports["icon"] = _S.read(_e, "icon")
	_S.define(_e, "shaped", _S.function_value(_e, "_f27"))
	_exports["shaped"] = _S.read(_e, "shaped")
	_exports["starShape"] = _S.read(_e, "starShape")
	_S.define(_e, "heartShape", _S.function_value(_e, "_f29"))
	_exports["heartShape"] = _S.read(_e, "heartShape")
	_S.define(_e, "EYES", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["eyes"] = _S.read(_e, "eyes")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "m", _S.prop(_S.read(_e, "a"), "mask"))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "SHAPES"), "get", [_S.read(_e, "m")]))
	if _S.truth(_S.read(_e, "s")):
		return _S.read(_e, "s")
	var _v0 = _S.read(_e, "m")
	_S.define(_e, "w", _S.prop(_v0, "w"))
	_S.define(_e, "h", _S.prop(_v0, "h"))
	_S.define(_e, "data", _S.prop(_v0, "data"))
	_S.define(_e, "on", _S.function_value(_e, "_f1"))
	_S.define(_e, "body", [])
	_S.define(_e, "up", [])
	_S.define(_e, "side", [])
	_S.define(_e, "outline", [])
	_S.define(_e, "top", [])
	_S.define(_e, "rows", [])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "x", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "x"), _S.read(_v1, "w"))):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "y", 0)
		while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v2, "y"), _S.read(_v2, "h")), func(): return _S.unary("!", _S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "x"), _S.read(_v2, "y")])))):
			_S.write(_v2, "y", 1, "+=", true)
		_S.invoke(_S.read(_v2, "top"), "push", [(_S.read(_v2, "y") if _S.truth(_S.binary("<", _S.read(_v2, "y"), _S.read(_v2, "h"))) else _S.unary("-", 1))])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "x", 1, "+=", true)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "y"), _S.read(_v3, "h"))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "l", _S.unary("-", 1))
		_S.define(_v4, "r", _S.unary("-", 1))
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "x"), _S.read(_v5, "w"))):
			var _v6 = _S.scope(_v5)
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v6, "on"), [_S.read(_v6, "x"), _S.read(_v6, "y")]))):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "x", 1, "+=", true)
				continue
			if _S.truth(_S.binary("<", _S.read(_v6, "l"), 0)):
				_S.write(_v6, "l", _S.read(_v6, "x"), "=", false)
			_S.write(_v6, "r", _S.read(_v6, "x"), "=", false)
			_S.invoke(_S.read(_v6, "body"), "push", [[_S.read(_v6, "x"), _S.read(_v6, "y")]])
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v6, "on"), [_S.read(_v6, "x"), _S.binary("-", _S.read(_v6, "y"), 1)]))):
				_S.invoke(_S.read(_v6, "up"), "push", [[_S.read(_v6, "x"), _S.read(_v6, "y")]])
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v6, "on"), [_S.binary("-", _S.read(_v6, "x"), 1), _S.read(_v6, "y")]))):
				_S.invoke(_S.read(_v6, "side"), "push", [[_S.read(_v6, "x"), _S.read(_v6, "y"), _S.unary("-", 1)]])
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v6, "on"), [_S.binary("+", _S.read(_v6, "x"), 1), _S.read(_v6, "y")]))):
				_S.invoke(_S.read(_v6, "side"), "push", [[_S.read(_v6, "x"), _S.read(_v6, "y"), 1]])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "x", 1, "+=", true)
		_S.invoke(_S.read(_v4, "rows"), "push", [[_S.read(_v4, "l"), _S.read(_v4, "r")]])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "y", 1, "+=", true)
	var _v7 = _S.scope(_e)
	_S.define(_v7, "y", _S.unary("-", 1))
	while _S.truth(_S.binary("<=", _S.read(_v7, "y"), _S.read(_v7, "h"))):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "x", _S.unary("-", 1))
		while _S.truth(_S.binary("<=", _S.read(_v8, "x"), _S.read(_v8, "w"))):
			var _v9 = _S.scope(_v8)
			if _S.truth(_S.call_value(_S.read(_v9, "on"), [_S.read(_v9, "x"), _S.read(_v9, "y")])):
				_v8 = _S.iteration(_v8)
				_S.write(_v8, "x", 1, "+=", true)
				continue
			_S.define(_v9, "nx", 0)
			_S.define(_v9, "ny", 0)
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "dy", _S.unary("-", 1))
			while _S.truth(_S.binary("<=", _S.read(_v10, "dy"), 1)):
				var _v11 = _S.scope(_v10)
				_S.define(_v11, "dx", _S.unary("-", 1))
				while _S.truth(_S.binary("<=", _S.read(_v11, "dx"), 1)):
					if _S.truth(_S.call_value(_S.read(_v11, "on"), [_S.binary("+", _S.read(_v11, "x"), _S.read(_v11, "dx")), _S.binary("+", _S.read(_v11, "y"), _S.read(_v11, "dy"))])):
						_S.last([_S.write(_v11, "nx", _S.read(_v11, "dx"), "-=", false), _S.write(_v11, "ny", _S.read(_v11, "dy"), "-=", false)])
					_v11 = _S.iteration(_v11)
					_S.write(_v11, "dx", 1, "+=", true)
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "dy", 1, "+=", true)
			if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v9, "on"), [_S.binary("-", _S.read(_v9, "x"), 1), _S.read(_v9, "y")]), func(): return _S.call_value(_S.read(_v9, "on"), [_S.binary("+", _S.read(_v9, "x"), 1), _S.read(_v9, "y")])), func(): return _S.call_value(_S.read(_v9, "on"), [_S.read(_v9, "x"), _S.binary("-", _S.read(_v9, "y"), 1)])), func(): return _S.call_value(_S.read(_v9, "on"), [_S.read(_v9, "x"), _S.binary("+", _S.read(_v9, "y"), 1)]))):
				var _v12 = _S.scope(_v9)
				_S.define(_v12, "l", _S.logical("||", _S.invoke(_S.read(_v12, "Math"), "hypot", [_S.read(_v12, "nx"), _S.read(_v12, "ny")]), func(): return 1))
				_S.invoke(_S.read(_v12, "outline"), "push", [[_S.read(_v12, "x"), _S.read(_v12, "y"), _S.binary("/", _S.read(_v12, "nx"), _S.read(_v12, "l")), _S.binary("/", _S.read(_v12, "ny"), _S.read(_v12, "l"))]])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "x", 1, "+=", true)
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "y", 1, "+=", true)
	_S.write(_e, "s", _S.merge([{"w": _S.read(_e, "w")}, {"h": _S.read(_e, "h")}, {"on": _S.read(_e, "on")}, {"body": _S.read(_e, "body")}, {"up": _S.read(_e, "up")}, {"side": _S.read(_e, "side")}, {"outline": _S.read(_e, "outline")}, {"top": _S.read(_e, "top")}, {"rows": _S.read(_e, "rows")}]), "=", false)
	_S.invoke(_S.read(_e, "SHAPES"), "set", [_S.read(_e, "m"), _S.read(_e, "s")])
	return _S.read(_e, "s")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "x"), 0), func(): return _S.binary(">=", _S.read(_e, "y"), 0)), func(): return _S.binary("<", _S.read(_e, "x"), _S.read(_e, "w"))), func(): return _S.binary("<", _S.read(_e, "y"), _S.read(_e, "h"))), func(): return _S.binary(">", _S.prop(_S.read(_e, "data"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.read(_e, "w")), _S.read(_e, "x"))), 0))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "P", _S.arg(_args, 1))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]))
	_S.define(_e, "f", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "i")))
	_S.define(_e, "u", _S.binary("*", _S.binary("*", _S.read(_e, "f"), _S.read(_e, "f")), _S.binary("-", 3, _S.binary("*", 2, _S.read(_e, "f")))))
	_S.define(_e, "a", _S.call_value(_S.read(_e, "rand"), [_S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "i"), _S.read(_e, "P")]), _S.read(_e, "seed")]))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "rand"), [_S.call_value(_S.read(_e, "wrap"), [_S.binary("+", _S.read(_e, "i"), 1), _S.read(_e, "P")]), _S.read(_e, "seed")]))
	return _S.binary("-", _S.binary("*", _S.binary("+", _S.read(_e, "a"), _S.binary("*", _S.binary("-", _S.read(_e, "b"), _S.read(_e, "a")), _S.read(_e, "u"))), 2), 1)

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "D", _S.arg(_args, 1))
	_S.define(_e, "f", _S.arg(_args, 2))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 3), func(): return 0))
	_S.define(_e, "off", _S.coalesce(_S.arg(_args, 4), func(): return 0))
	_S.define(_e, "P", _S.invoke(_S.read(_e, "Math"), "max", [2, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "f"), _S.read(_e, "D"))])]))
	return _S.call_value(_S.read(_e, "wnoise"), [_S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "P")), _S.read(_e, "off")), _S.read(_e, "P"), _S.read(_e, "seed")])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "h", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "sx", _S.arg(_args, 5))
	_S.define(_e, "F", _S.arg(_args, 6))
	_S.define(_e, "t", _S.arg(_args, 7))
	_S.define(_e, "D", _S.arg(_args, 8))
	_S.define(_e, "n", _S.arg(_args, 9))
	_S.define(_e, "layers", _S.coalesce(_S.arg(_args, 10), func(): return _S.read(_e, "LAYERS")))
	if _S.truth(_S.binary("<", _S.read(_e, "h"), 1)):
		return null
	for _v13 in _S.array(_S.read(_e, "layers")):
		var _v14 = _S.scope(_e)
		var _v15 = _v13
		_S.define(_v14, "lw", _S.prop(_v15, 0))
		_S.define(_v14, "lh", _S.prop(_v15, 1))
		_S.define(_v14, "ri", _S.prop(_v15, 2))
		var _v16 = _S.scope(_v14)
		if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v16, "ri"), 0), func(): return _S.binary("<", _S.read(_v16, "h"), 4))):
			continue
		_S.define(_v16, "H", _S.binary("*", _S.read(_v16, "h"), _S.read(_v16, "lh")))
		_S.define(_v16, "col", _S.prop(_S.read(_v16, "F"), _S.read(_v16, "ri")))
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "r", 0)
		while _S.truth(_S.binary("<=", _S.read(_v17, "r"), _S.read(_v17, "H"))):
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "u", _S.binary("/", _S.read(_v18, "r"), _S.invoke(_S.read(_v18, "Math"), "max", [1, _S.read(_v18, "H")])))
			_S.define(_v18, "half", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v18, "w"), _S.read(_v18, "lw")), _S.invoke(_S.read(_v18, "Math"), "pow", [_S.binary("-", 1, _S.read(_v18, "u")), 0.85])), _S.invoke(_S.read(_v18, "Math"), "min", [1, _S.binary("/", _S.binary("+", _S.read(_v18, "r"), 1.5), 3.5)])), _S.binary("*", _S.call_value(_S.read(_v18, "tnoise"), [_S.read(_v18, "t"), _S.read(_v18, "D"), 9, _S.read(_v18, "n"), _S.binary("*", _S.read(_v18, "r"), 0.45)]), 0.5)))
			if _S.truth(_S.binary("<", _S.read(_v18, "half"), 0.3)):
				_v17 = _S.iteration(_v17)
				_S.write(_v17, "r", 1, "+=", true)
				continue
			_S.define(_v18, "cx", _S.binary("+", _S.binary("+", _S.read(_v18, "x"), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v18, "sx"), _S.read(_v18, "u")), _S.read(_v18, "u")), _S.read(_v18, "lh"))), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v18, "tnoise"), [_S.read(_v18, "t"), _S.read(_v18, "D"), 4, _S.binary("+", _S.read(_v18, "n"), 7), _S.binary("*", _S.read(_v18, "r"), 0.2)]), _S.read(_v18, "u")), 1.1)))
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "px", _S.invoke(_S.read(_v19, "Math"), "round", [_S.binary("-", _S.read(_v19, "cx"), _S.read(_v19, "half"))]))
			while _S.truth(_S.binary("<=", _S.read(_v19, "px"), _S.invoke(_S.read(_v19, "Math"), "round", [_S.binary("+", _S.read(_v19, "cx"), _S.read(_v19, "half"))]))):
				_S.invoke(_S.read(_v19, "p"), "px", [_S.read(_v19, "px"), _S.invoke(_S.read(_v19, "Math"), "round", [_S.binary("-", _S.read(_v19, "y"), _S.read(_v19, "r"))]), _S.read(_v19, "col")])
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "px", 1, "+=", true)
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "r", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "size", _S.arg(_args, 3))
	_S.define(_e, "u", _S.arg(_args, 4))
	_S.define(_e, "F", _S.arg(_args, 5))
	_S.define(_e, "heatSeed", _S.coalesce(_S.arg(_args, 6), func(): return 0))
	_S.define(_e, "n", _S.prop(_S.read(_e, "F"), "length"))
	_S.define(_e, "k", _S.binary("-", 1, _S.read(_e, "u")))
	_S.define(_e, "heat", _S.invoke(_S.read(_e, "Math"), "min", [0.999, _S.binary("+", _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "u"), 0.62]), _S.binary("*", _S.read(_e, "heatSeed"), 0.1))]))
	_S.define(_e, "idx", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "n"), 2), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "heat"), _S.binary("-", _S.read(_e, "n"), 1))])]))
	_S.define(_e, "r", _S.binary("*", _S.binary("*", _S.read(_e, "size"), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "u"), 7)])))), _S.binary("-", 1, _S.binary("*", _S.read(_e, "u"), 0.55))))
	_S.define(_e, "c", _S.prop(_S.read(_e, "F"), _S.read(_e, "idx")))
	if _S.truth(_S.binary(">=", _S.read(_e, "idx"), _S.binary("-", _S.read(_e, "n"), 2))):
		return _S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.read(_e, "c"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 3)]), 0.85)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.prop(_S.read(_e, "F"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "n"), 1), _S.binary("+", _S.read(_e, "idx"), 2)]))])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.16)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.22)), _S.binary("*", _S.read(_e, "r"), 0.78), _S.read(_e, "c")])
	if _S.truth(_S.binary(">", _S.read(_e, "r"), 1.6)):
		_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.9)), _S.binary("*", _S.read(_e, "r"), 0.42), _S.read(_e, "c")])
	if _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_e, "idx"), 3), func(): return _S.binary(">", _S.read(_e, "r"), 1.8))):
		_S.invoke(_S.read(_e, "p"), "circle", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.28)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.34)), _S.binary("*", _S.read(_e, "r"), 0.36), _S.prop(_S.read(_e, "F"), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "idx"), 1)]))])
	if _S.truth(_S.binary("<", _S.read(_e, "idx"), 6)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.binary("*", _S.read(_e, "r"), 2.4), 2), _S.read(_e, "c"), _S.binary("*", 0.18, _S.read(_e, "k"))])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "size", _S.arg(_args, 3))
	_S.define(_e, "u", _S.arg(_args, 4))
	_S.define(_e, "col", _S.arg(_args, 5))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	_S.define(_e, "warm", _S.coalesce(_S.arg(_args, 7), func(): return 0))
	_S.define(_e, "r", _S.binary("*", _S.read(_e, "size"), _S.binary("+", _S.binary("+", 0.65, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "u"), 2.5)]), 0.45)), _S.binary("*", _S.read(_e, "u"), 0.4))))
	_S.define(_e, "a", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "u"), 12)]), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_e, "u")), 2.4)])), 0.58), _S.read(_e, "k")))
	if _S.truth(_S.binary("<=", _S.read(_e, "a"), 0.01)):
		return null
	_S.define(_e, "c", (_S.call_value(_S.read(_e, "mix"), [_S.read(_e, "col"), _S.call_value(_S.read(_e, "rampAt"), [_S.read(_e, "SMOKE_RAMP"), _S.read(_e, "u")]), _S.read(_e, "u")]) if _S.truth(_S.read(_e, "col")) else _S.call_value(_S.read(_e, "rampAt"), [_S.read(_e, "SMOKE_RAMP"), _S.binary("*", _S.read(_e, "u"), 1.05)])))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.read(_e, "c"), _S.binary("*", _S.read(_e, "a"), 0.45)])
	_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.05)), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.06)), _S.binary("*", _S.read(_e, "r"), 0.74), _S.read(_e, "c"), _S.binary("*", _S.read(_e, "a"), 0.62)])
	if _S.truth(_S.logical("&&", _S.read(_e, "warm"), func(): return _S.binary("<", _S.read(_e, "u"), 0.6))):
		_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.1)), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.3)), _S.binary("*", _S.read(_e, "r"), 0.56), _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.read(_e, "warm"), 0.5]), _S.binary("*", _S.binary("*", _S.read(_e, "a"), 0.7), _S.binary("-", 1, _S.binary("/", _S.read(_e, "u"), 0.6)))])
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)):
		_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.22)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.3)), _S.binary("*", _S.read(_e, "r"), 0.5), _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.read(_e, "WHITE"), 0.12]), _S.binary("*", _S.binary("*", _S.read(_e, "a"), 0.4), _S.binary("-", 1, _S.binary("*", _S.read(_e, "u"), 2)))])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "u", _S.arg(_args, 3))
	_S.define(_e, "E", _S.arg(_args, 4))
	_S.define(_e, "ph", _S.arg(_args, 5))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	_S.define(_e, "left", _S.binary("-", 1, _S.read(_e, "u")))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "left"), 0.22), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "ph"), 40)]), 0))):
		return null
	_S.define(_e, "c", ((_S.prop(_S.read(_e, "E"), 0) if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "ph"), 22)]), _S.unary("-", 0.2))) else _S.prop(_S.read(_e, "E"), 1)) if _S.truth(_S.binary(">", _S.read(_e, "left"), 0.5)) else (_S.prop(_S.read(_e, "E"), 1) if _S.truth(_S.binary(">", _S.read(_e, "left"), 0.22)) else _S.prop(_S.read(_e, "E"), 2))))
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "c")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.read(_e, "c"), _S.binary("*", _S.binary("*", 0.32, _S.read(_e, "left")), _S.read(_e, "k"))])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "rx", _S.arg(_args, 3))
	_S.define(_e, "ry", _S.arg(_args, 4))
	_S.define(_e, "col", _S.arg(_args, 5))
	_S.define(_e, "a", _S.arg(_args, 6))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<=", _S.read(_e, "a"), 0.01), func(): return _S.binary("<", _S.read(_e, "rx"), 0.5)), func(): return _S.binary("<", _S.read(_e, "ry"), 0.5))):
		return null
	var _v20 = _S.scope(_e)
	_S.define(_v20, "py", _S.invoke(_S.read(_v20, "Math"), "floor", [_S.binary("-", _S.read(_v20, "y"), _S.read(_v20, "ry"))]))
	while _S.truth(_S.binary("<=", _S.read(_v20, "py"), _S.invoke(_S.read(_v20, "Math"), "ceil", [_S.binary("+", _S.read(_v20, "y"), _S.read(_v20, "ry"))]))):
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "px", _S.invoke(_S.read(_v21, "Math"), "floor", [_S.binary("-", _S.read(_v21, "x"), _S.read(_v21, "rx"))]))
		while _S.truth(_S.binary("<=", _S.read(_v21, "px"), _S.invoke(_S.read(_v21, "Math"), "ceil", [_S.binary("+", _S.read(_v21, "x"), _S.read(_v21, "rx"))]))):
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "dx", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v22, "px"), 0.5), _S.read(_v22, "x")), _S.read(_v22, "rx")))
			_S.define(_v22, "dy", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v22, "py"), 0.5), _S.read(_v22, "y")), _S.read(_v22, "ry")))
			_S.define(_v22, "d", _S.binary("+", _S.binary("*", _S.read(_v22, "dx"), _S.read(_v22, "dx")), _S.binary("*", _S.read(_v22, "dy"), _S.read(_v22, "dy"))))
			if _S.truth(_S.binary("<", _S.read(_v22, "d"), 1)):
				_S.invoke(_S.read(_v22, "p"), "blend", [_S.read(_v22, "px"), _S.read(_v22, "py"), _S.read(_v22, "col"), _S.binary("*", _S.read(_v22, "a"), _S.binary("-", 1, _S.read(_v22, "d")))])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "px", 1, "+=", true)
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "py", 1, "+=", true)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "rows", _S.arg(_args, 0))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 1), func(): return 1))
	_S.define(_e, "flip", _S.coalesce(_S.arg(_args, 2), func(): return false))
	_S.define(_e, "h", _S.prop(_S.read(_e, "rows"), "length"))
	_S.define(_e, "w", _S.prop(_S.prop(_S.read(_e, "rows"), 0), "length"))
	_S.define(_e, "ox", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.binary("*", _S.read(_e, "w"), _S.read(_e, "k")), 2)]))
	_S.define(_e, "oy", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.binary("*", _S.read(_e, "h"), _S.read(_e, "k")), 2)]))
	return _S.function_value(_e, "_f10")

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "dx", _S.arg(_args, 0))
	_S.define(_e, "dy", _S.arg(_args, 1))
	_S.define(_e, "bx", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.binary("+", _S.read(_e, "dx"), _S.read(_e, "ox")), _S.read(_e, "k"))]))
	_S.define(_e, "by", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.binary("+", _S.read(_e, "dy"), _S.read(_e, "oy")), _S.read(_e, "k"))]))
	if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "bx"), 0), func(): return _S.binary("<", _S.read(_e, "by"), 0)), func(): return _S.binary(">=", _S.read(_e, "bx"), _S.read(_e, "w"))), func(): return _S.binary(">=", _S.read(_e, "by"), _S.read(_e, "h")))):
		return ""
	if _S.truth(_S.read(_e, "flip")):
		_S.write(_e, "bx", _S.binary("-", _S.binary("-", _S.read(_e, "w"), 1), _S.read(_e, "bx")), "=", false)
	_S.define(_e, "c", _S.prop(_S.prop(_S.read(_e, "rows"), _S.read(_e, "by")), _S.read(_e, "bx")))
	return ("" if _S.truth(_S.binary("===", _S.read(_e, "c"), ".")) else _S.read(_e, "c"))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "ext", _S.arg(_args, 3))
	_S.define(_e, "inside", _S.arg(_args, 4))
	_S.define(_e, "R", _S.arg(_args, 5))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	_S.define(_e, "paint", _S.coalesce(_S.arg(_args, 7), func(): return null))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.define(_e, "at", _S.function_value(_e, "_f12"))
	var _v23 = _S.scope(_e)
	_S.define(_v23, "dy", _S.binary("-", _S.unary("-", _S.read(_v23, "ext")), 1))
	while _S.truth(_S.binary("<=", _S.read(_v23, "dy"), _S.binary("+", _S.read(_v23, "ext"), 1))):
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "dx", _S.binary("-", _S.unary("-", _S.read(_v24, "ext")), 1))
		while _S.truth(_S.binary("<=", _S.read(_v24, "dx"), _S.binary("+", _S.read(_v24, "ext"), 1))):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "ch", _S.call_value(_S.read(_v25, "inside"), [_S.read(_v25, "dx"), _S.read(_v25, "dy")]))
			_S.define(_v25, "c", null)
			if _S.truth(_S.read(_v25, "ch")):
				var _v26 = _S.scope(_v25)
				if _S.truth(_S.logical("&&", _S.read(_v26, "paint"), func(): return _S.binary("!==", _S.prop(_S.read(_v26, "paint"), _S.read(_v26, "ch")), null))):
					_S.write(_v26, "c", _S.prop(_S.read(_v26, "paint"), _S.read(_v26, "ch")), "=", false)
				else:
					var _v27 = _S.scope(_v26)
					_S.define(_v27, "top", _S.unary("!", _S.call_value(_S.read(_v27, "at"), [_S.read(_v27, "dx"), _S.binary("-", _S.read(_v27, "dy"), 1)])))
					_S.define(_v27, "left", _S.unary("!", _S.call_value(_S.read(_v27, "at"), [_S.binary("-", _S.read(_v27, "dx"), 1), _S.read(_v27, "dy")])))
					_S.define(_v27, "bottom", _S.unary("!", _S.call_value(_S.read(_v27, "at"), [_S.read(_v27, "dx"), _S.binary("+", _S.read(_v27, "dy"), 1)])))
					_S.define(_v27, "right", _S.unary("!", _S.call_value(_S.read(_v27, "at"), [_S.binary("+", _S.read(_v27, "dx"), 1), _S.read(_v27, "dy")])))
					_S.write(_v27, "c", (_S.prop(_S.read(_v27, "R"), 3) if _S.truth(_S.logical("||", _S.read(_v27, "top"), func(): return _S.read(_v27, "left"))) else (_S.prop(_S.read(_v27, "R"), 1) if _S.truth(_S.logical("||", _S.read(_v27, "bottom"), func(): return _S.read(_v27, "right"))) else _S.prop(_S.read(_v27, "R"), 2))), "=", false)
			else:
				if _S.truth(_S.logical("&&", _S.prop(_S.read(_v25, "R"), 0), func(): return _S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v25, "at"), [_S.binary("-", _S.read(_v25, "dx"), 1), _S.read(_v25, "dy")]), func(): return _S.call_value(_S.read(_v25, "at"), [_S.binary("+", _S.read(_v25, "dx"), 1), _S.read(_v25, "dy")])), func(): return _S.call_value(_S.read(_v25, "at"), [_S.read(_v25, "dx"), _S.binary("-", _S.read(_v25, "dy"), 1)])), func(): return _S.call_value(_S.read(_v25, "at"), [_S.read(_v25, "dx"), _S.binary("+", _S.read(_v25, "dy"), 1)])))):
					_S.write(_v25, "c", _S.prop(_S.read(_v25, "R"), 0), "=", false)
				else:
					_v24 = _S.iteration(_v24)
					_S.write(_v24, "dx", 1, "+=", true)
					continue
			_S.invoke(_S.read(_v25, "p"), "dot", [_S.binary("+", _S.read(_v25, "X"), _S.read(_v25, "dx")), _S.binary("+", _S.read(_v25, "Y"), _S.read(_v25, "dy")), _S.read(_v25, "c"), _S.read(_v25, "a")])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "dx", 1, "+=", true)
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "dy", 1, "+=", true)
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "dx", _S.arg(_args, 0))
	_S.define(_e, "dy", _S.arg(_args, 1))
	return _S.unary("!", _S.unary("!", _S.call_value(_S.read(_e, "inside"), [_S.read(_e, "dx"), _S.read(_e, "dy")])))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "r0", _S.coalesce(_S.arg(_args, 0), func(): return 0.45))
	return _S.function_value(_e, "_f14")

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "v"), _S.read(_e, "u")]), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "u"), _S.read(_e, "v")]))
	_S.define(_e, "seg", _S.binary("/", _S.binary("*", 2, _S.prop(_S.read(_e, "Math"), "PI")), 5))
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "a"), _S.read(_e, "seg")), _S.read(_e, "seg")), _S.read(_e, "seg")), _S.binary("/", _S.read(_e, "seg"), 2))]), _S.binary("/", _S.read(_e, "seg"), 2))))
	return _S.binary("<=", _S.read(_e, "d"), _S.binary("-", 1, _S.binary("*", _S.binary("-", 1, _S.read(_e, "r0")), _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "k"), 0.8]))))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "list", _S.invoke(_S.read(_e, "EYES"), "get", [_S.prop(_S.read(_e, "a"), "mask")]))
	if _S.truth(_S.read(_e, "list")):
		return _S.read(_e, "list")
	if _S.truth(_S.prop(_S.read(_e, "a"), "eyes")):
		var _v28 = _S.scope(_e)
		_S.write(_v28, "list", _S.invoke(_S.prop(_S.read(_v28, "a"), "eyes"), "map", [_S.function_value(_v28, "_f16")]), "=", false)
		_S.invoke(_S.read(_v28, "EYES"), "set", [_S.prop(_S.read(_v28, "a"), "mask"), _S.read(_v28, "list")])
		return _S.read(_v28, "list")
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "W", _S.prop(_S.read(_e, "S"), "w"))
	_S.define(_e, "col", _S.function_value(_e, "_f17"))
	_S.define(_e, "dark", _S.function_value(_e, "_f18"))
	_S.define(_e, "seen", _S.construct(_S.read(_e, "Set"), []))
	_S.write(_e, "list", [], "=", false)
	for _v30 in _S.array(_S.prop(_S.read(_e, "S"), "body")):
		var _v31 = _S.scope(_e)
		var _v32 = _v30
		_S.define(_v31, "x0", _S.prop(_v32, 0))
		_S.define(_v31, "y0", _S.prop(_v32, 1))
		var _v33 = _S.scope(_v31)
		if _S.truth(_S.logical("||", _S.invoke(_S.read(_v33, "seen"), "has", [_S.binary("+", _S.binary("*", _S.read(_v33, "y0"), _S.read(_v33, "W")), _S.read(_v33, "x0"))]), func(): return _S.unary("!", _S.call_value(_S.read(_v33, "dark"), [_S.read(_v33, "x0"), _S.read(_v33, "y0")])))):
			continue
		_S.define(_v33, "px", [])
		_S.define(_v33, "q", [[_S.read(_v33, "x0"), _S.read(_v33, "y0")]])
		_S.invoke(_S.read(_v33, "seen"), "add", [_S.binary("+", _S.binary("*", _S.read(_v33, "y0"), _S.read(_v33, "W")), _S.read(_v33, "x0"))])
		while _S.truth(_S.prop(_S.read(_v33, "q"), "length")):
			var _v34 = _S.scope(_v33)
			var _v35 = _S.invoke(_S.read(_v34, "q"), "pop", [])
			_S.define(_v34, "x", _S.prop(_v35, 0))
			_S.define(_v34, "y", _S.prop(_v35, 1))
			_S.invoke(_S.read(_v34, "px"), "push", [[_S.read(_v34, "x"), _S.read(_v34, "y")]])
			for _v36 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
				var _v37 = _S.scope(_v34)
				var _v38 = _v36
				_S.define(_v37, "dx", _S.prop(_v38, 0))
				_S.define(_v37, "dy", _S.prop(_v38, 1))
				var _v39 = _S.scope(_v37)
				_S.define(_v39, "nx", _S.binary("+", _S.read(_v39, "x"), _S.read(_v39, "dx")))
				_S.define(_v39, "ny", _S.binary("+", _S.read(_v39, "y"), _S.read(_v39, "dy")))
				_S.define(_v39, "k", _S.binary("+", _S.binary("*", _S.read(_v39, "ny"), _S.read(_v39, "W")), _S.read(_v39, "nx")))
				if _S.truth(_S.logical("||", _S.invoke(_S.read(_v39, "seen"), "has", [_S.read(_v39, "k")]), func(): return _S.unary("!", _S.logical("||", _S.call_value(_S.read(_v39, "dark"), [_S.read(_v39, "nx"), _S.read(_v39, "ny")]), func(): return _S.logical("&&", _S.invoke(_S.read(_v39, "S"), "on", [_S.read(_v39, "nx"), _S.read(_v39, "ny")]), func(): return _S.binary(">", _S.call_value(_S.read(_v39, "luma"), [_S.call_value(_S.read(_v39, "col"), [_S.read(_v39, "nx"), _S.read(_v39, "ny")])]), 0.95)))))):
					continue
				_S.invoke(_S.read(_v39, "seen"), "add", [_S.read(_v39, "k")])
				_S.invoke(_S.read(_v39, "q"), "push", [[_S.read(_v39, "nx"), _S.read(_v39, "ny")]])
		if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v33, "px"), "length"), 2), func(): return _S.binary(">", _S.prop(_S.read(_v33, "px"), "length"), 14))):
			continue
		_S.define(_v33, "xs", _S.invoke(_S.read(_v33, "px"), "map", [_S.function_value(_v33, "_f19")]))
		_S.define(_v33, "ys", _S.invoke(_S.read(_v33, "px"), "map", [_S.function_value(_v33, "_f20")]))
		_S.define(_v33, "counts", _S.construct(_S.read(_v33, "Map"), []))
		_S.define(_v33, "e", _S.merge([{"x0": _S.invoke(_S.read(_v33, "Math"), "min", _S.concat([_S.array(_S.read(_v33, "xs"))]))}, {"x1": _S.invoke(_S.read(_v33, "Math"), "max", _S.concat([_S.array(_S.read(_v33, "xs"))]))}, {"y0": _S.invoke(_S.read(_v33, "Math"), "min", _S.concat([_S.array(_S.read(_v33, "ys"))]))}, {"y1": _S.invoke(_S.read(_v33, "Math"), "max", _S.concat([_S.array(_S.read(_v33, "ys"))]))}, {"px": _S.read(_v33, "px")}]))
		for _v40 in _S.array(_S.read(_v33, "px")):
			var _v41 = _S.scope(_v33)
			var _v42 = _v40
			_S.define(_v41, "x", _S.prop(_v42, 0))
			_S.define(_v41, "y", _S.prop(_v42, 1))
			for _v43 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)], [2, 0], [_S.unary("-", 2), 0]]):
				var _v44 = _S.scope(_v41)
				var _v45 = _v43
				_S.define(_v44, "dx", _S.prop(_v45, 0))
				_S.define(_v44, "dy", _S.prop(_v45, 1))
				var _v46 = _S.scope(_v44)
				_S.define(_v46, "c", _S.call_value(_S.read(_v46, "col"), [_S.binary("+", _S.read(_v46, "x"), _S.read(_v46, "dx")), _S.binary("+", _S.read(_v46, "y"), _S.read(_v46, "dy"))]))
				_S.define(_v46, "l", _S.call_value(_S.read(_v46, "luma"), [_S.read(_v46, "c")]))
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.read(_v46, "c"), func(): return _S.binary(">", _S.read(_v46, "l"), 0.5)), func(): return _S.binary("<", _S.read(_v46, "l"), 0.95)), func(): return _S.unary("!", _S.invoke(_S.read(_v46, "px"), "some", [_S.function_value(_v46, "_f21")])))):
					_S.invoke(_S.read(_v46, "counts"), "set", [_S.read(_v46, "c"), _S.binary("+", _S.logical("??", _S.invoke(_S.read(_v46, "counts"), "get", [_S.read(_v46, "c")]), func(): return 0), 1)])
		_S.set_prop(_S.read(_v33, "e"), "skin", _S.prop(_S.prop(_S.invoke(_S.concat([_S.array(_S.read(_v33, "counts"))]), "sort", [_S.function_value(_v33, "_f22")]), 0), 0), "=", false)
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v33, "e"), "skin"), func(): return _S.binary("<=", _S.binary("-", _S.prop(_S.read(_v33, "e"), "x1"), _S.prop(_S.read(_v33, "e"), "x0")), 4)), func(): return _S.binary("<=", _S.binary("-", _S.prop(_S.read(_v33, "e"), "y1"), _S.prop(_S.read(_v33, "e"), "y0")), 5))):
			_S.invoke(_S.read(_v33, "list"), "push", [_S.read(_v33, "e")])
	_S.invoke(_S.read(_e, "list"), "sort", [_S.function_value(_e, "_f23")])
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "list"), "length"), 2)):
		_S.write(_e, "list", [], "=", false)
	_S.invoke(_S.read(_e, "EYES"), "set", [_S.prop(_S.read(_e, "a"), "mask"), _S.read(_e, "list")])
	return _S.read(_e, "list")

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v29 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v29, 0))
	_S.define(_e, "y", _S.prop(_v29, 1))
	return _S.merge([{"x0": _S.read(_e, "x")}, {"x1": _S.read(_e, "x")}, {"y0": _S.read(_e, "y")}, {"y1": _S.binary("+", _S.read(_e, "y"), 1)}, {"px": [[_S.read(_e, "x"), _S.read(_e, "y")], [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1)]]}, {"skin": _S.call_value(_S.read(_e, "colorAt"), [_S.read(_e, "a"), _S.read(_e, "x"), _S.read(_e, "y")])}])

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return (_S.call_value(_S.read(_e, "colorAt"), [_S.read(_e, "a"), _S.read(_e, "x"), _S.read(_e, "y")]) if _S.truth(_S.invoke(_S.read(_e, "S"), "on", [_S.read(_e, "x"), _S.read(_e, "y")])) else 0)

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.invoke(_S.read(_e, "S"), "on", [_S.read(_e, "x"), _S.read(_e, "y")]), func(): return _S.binary("<", _S.read(_e, "y"), _S.binary("*", _S.prop(_S.read(_e, "S"), "h"), 0.4))), func(): return _S.binary("<", _S.call_value(_S.read(_e, "luma"), [_S.call_value(_S.read(_e, "col"), [_S.read(_e, "x"), _S.read(_e, "y")])]), 0.15)), func(): return _S.invoke(_S.read(_e, "S"), "on", [_S.binary("-", _S.read(_e, "x"), 1), _S.read(_e, "y")])), func(): return _S.invoke(_S.read(_e, "S"), "on", [_S.binary("+", _S.read(_e, "x"), 1), _S.read(_e, "y")])), func(): return _S.invoke(_S.read(_e, "S"), "on", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 1)])), func(): return _S.invoke(_S.read(_e, "S"), "on", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1)]))

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "p"), 0)

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "p"), 1)

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	return _S.logical("&&", _S.binary("===", _S.prop(_S.read(_e, "p"), 0), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "dx"))), func(): return _S.binary("===", _S.prop(_S.read(_e, "p"), 1), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "dy"))))

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "q"), 1), _S.prop(_S.read(_e, "p"), 1))

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "p"), "x0"), _S.prop(_S.read(_e, "q"), "x0"))

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	return (_S.prop(_S.prop(_S.read(_e, "a"), "pixels"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.prop(_S.prop(_S.read(_e, "a"), "mask"), "w")), _S.read(_e, "x"))) if _S.truth(_S.prop(_S.read(_e, "a"), "pixels")) else (4285229931 if _S.truth(_S.prop(_S.prop(_S.prop(_S.read(_e, "a"), "mask"), "data"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.prop(_S.prop(_S.read(_e, "a"), "mask"), "w")), _S.read(_e, "x")))) else 0))

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "g", _S.arg(_args, 1))
	_S.define(_e, "d", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	return (_S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "g"), _S.read(_e, "d")), _S.read(_e, "a")), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_e, "v"), _S.binary("/", _S.read(_e, "g"), _S.read(_e, "d"))), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "d")), _S.read(_e, "a"))]))), _S.read(_e, "d"))) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0)) else _S.binary("+", _S.binary("*", _S.read(_e, "v"), _S.read(_e, "a")), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "g")), _S.read(_e, "a")), _S.read(_e, "a"))))

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	return _S.prop(_S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_e, "r"), "length"), 1), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), _S.prop(_S.read(_e, "r"), "length"))])])]))

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "ang", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]))
	return _S.function_value(_e, "_f28")

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "dx", _S.arg(_args, 0))
	_S.define(_e, "dy", _S.arg(_args, 1))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "dx"), 0.5))
	_S.define(_e, "y", _S.binary("+", _S.read(_e, "dy"), 0.5))
	return ("#" if _S.truth(_S.call_value(_S.read(_e, "f"), [_S.binary("/", _S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.read(_e, "c")), _S.binary("*", _S.read(_e, "y"), _S.read(_e, "n"))), _S.read(_e, "s")), _S.binary("/", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "x")), _S.read(_e, "n")), _S.binary("*", _S.read(_e, "y"), _S.read(_e, "c"))), _S.read(_e, "s"))])) else "")

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return _S.logical("||", _S.logical("||", _S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("+", _S.read(_e, "u"), 0.5), 2), _S.binary("**", _S.binary("+", _S.read(_e, "v"), 0.32), 2)), _S.binary("**", 0.55, 2)), func(): return _S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("-", _S.read(_e, "u"), 0.5), 2), _S.binary("**", _S.binary("+", _S.read(_e, "v"), 0.32), 2)), _S.binary("**", 0.55, 2))), func(): return _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "v"), _S.unary("-", 0.32)), func(): return _S.binary("<=", _S.read(_e, "v"), 1)), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "u")]), _S.binary("*", 1.04, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.binary("+", _S.read(_e, "v"), 0.32), 1.32)), 0.75])))))
