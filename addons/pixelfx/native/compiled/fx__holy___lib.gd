@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "shapeOf", _S.function_value(_e, "_f0"))
	_S.define(_e, "recolor", _S.function_value(_e, "_f3"))
	_S.define(_e, "oval", _S.function_value(_e, "_f4"))
	_S.define(_e, "feather", _S.function_value(_e, "_f5"))
	_S.define(_e, "plus", _S.function_value(_e, "_f7"))
	_S.define(_e, "GOLD", ["#3b1d2a", "#7a3a2c", "#c4652e", "#f0a040", "#ffd25e", "#fff0a0", "#fffbe0", "#ffffff"])
	_exports["GOLD"] = _S.read(_e, "GOLD")
	_S.define(_e, "GREEN", ["#0e2a24", "#14472f", "#1d6e3a", "#2f9a45", "#5cc654", "#a0e46c", "#dcffb4", "#ffffff"])
	_exports["GREEN"] = _S.read(_e, "GREEN")
	_S.define(_e, "ASH", ["#16131c", "#26222f", "#3a3546", "#524c5e", "#6e6878", "#8c8796"])
	_exports["ASH"] = _S.read(_e, "ASH")
	_S.define(_e, "SHAPES", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["shapeOf"] = _S.read(_e, "shapeOf")
	_exports["recolor"] = _S.read(_e, "recolor")
	_S.define(_e, "toneOf", _S.function_value(_e, "_f9"))
	_exports["toneOf"] = _S.read(_e, "toneOf")
	_exports["oval"] = _S.read(_e, "oval")
	_S.define(_e, "FAR", _S.function_value(_e, "_f10"))
	_exports["FAR"] = _S.read(_e, "FAR")
	_S.define(_e, "NEAR", _S.function_value(_e, "_f11"))
	_exports["NEAR"] = _S.read(_e, "NEAR")
	_exports["feather"] = _S.read(_e, "feather")
	_S.define(_e, "Feathers", _S.class_value("Feathers", _S.function_value(_e, "_f12"), {"add": _S.function_value(_e, "_f13"), "update": _S.function_value(_e, "_f15"), "draw": _S.function_value(_e, "_f16")}, {"count": _S.function_value(_e, "_f14")}, {}, null))
	_exports["Feathers"] = _S.read(_e, "Feathers")
	_exports["plus"] = _S.read(_e, "plus")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "A", _S.arg(_args, 0))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "SHAPES"), "get", [_S.prop(_S.read(_e, "A"), "mask")]))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "s"), func(): return _S.binary("===", _S.prop(_S.read(_e, "s"), "x"), _S.prop(_S.read(_e, "A"), "x"))), func(): return _S.binary("===", _S.prop(_S.read(_e, "s"), "y"), _S.prop(_S.read(_e, "A"), "y")))):
		return _S.read(_e, "s")
	_S.define(_e, "m", _S.prop(_S.read(_e, "A"), "mask"))
	_S.define(_e, "inside", _S.function_value(_e, "_f1"))
	_S.define(_e, "edge", [])
	_S.define(_e, "out", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "j", _S.unary("-", 1))
	while _S.truth(_S.binary("<=", _S.read(_v0, "j"), _S.prop(_S.read(_v0, "m"), "h"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", _S.unary("-", 1))
		while _S.truth(_S.binary("<=", _S.read(_v1, "i"), _S.prop(_S.read(_v1, "m"), "w"))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "nb", _S.binary("+", _S.binary("+", _S.binary("+", _S.call_value(_S.read(_v2, "inside"), [_S.binary("-", _S.read(_v2, "i"), 1), _S.read(_v2, "j")]), _S.call_value(_S.read(_v2, "inside"), [_S.binary("+", _S.read(_v2, "i"), 1), _S.read(_v2, "j")])), _S.call_value(_S.read(_v2, "inside"), [_S.read(_v2, "i"), _S.binary("-", _S.read(_v2, "j"), 1)])), _S.call_value(_S.read(_v2, "inside"), [_S.read(_v2, "i"), _S.binary("+", _S.read(_v2, "j"), 1)])))
			if _S.truth(_S.call_value(_S.read(_v2, "inside"), [_S.read(_v2, "i"), _S.read(_v2, "j")])):
				var _v3 = _S.scope(_v2)
				if _S.truth(_S.binary("<", _S.read(_v3, "nb"), 4)):
					_S.invoke(_S.read(_v3, "edge"), "push", [[_S.binary("+", _S.prop(_S.read(_v3, "A"), "x"), _S.read(_v3, "i")), _S.binary("+", _S.prop(_S.read(_v3, "A"), "y"), _S.read(_v3, "j"))]])
			else:
				if _S.truth(_S.read(_v2, "nb")):
					_S.invoke(_S.read(_v2, "out"), "push", [[_S.binary("+", _S.prop(_S.read(_v2, "A"), "x"), _S.read(_v2, "i")), _S.binary("+", _S.prop(_S.read(_v2, "A"), "y"), _S.read(_v2, "j"))]])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "j", 1, "+=", true)
	_S.write(_e, "s", _S.merge([{"x": _S.prop(_S.read(_e, "A"), "x")}, {"y": _S.prop(_S.read(_e, "A"), "y")}, {"edge": _S.read(_e, "edge")}, {"out": _S.read(_e, "out")}, {"top": _S.prop(_S.read(_e, "A"), "y")}, {"bottom": _S.binary("+", _S.prop(_S.read(_e, "A"), "y"), _S.prop(_S.read(_e, "m"), "h"))}, {"at": _S.function_value(_e, "_f2")}]), "=", false)
	_S.invoke(_S.read(_e, "SHAPES"), "set", [_S.prop(_S.read(_e, "A"), "mask"), _S.read(_e, "s")])
	return _S.read(_e, "s")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "i"), 0), func(): return _S.binary(">=", _S.read(_e, "j"), 0)), func(): return _S.binary("<", _S.read(_e, "i"), _S.prop(_S.read(_e, "m"), "w"))), func(): return _S.binary("<", _S.read(_e, "j"), _S.prop(_S.read(_e, "m"), "h"))), func(): return _S.binary(">", _S.prop(_S.prop(_S.read(_e, "m"), "data"), _S.binary("+", _S.binary("*", _S.read(_e, "j"), _S.prop(_S.read(_e, "m"), "w")), _S.read(_e, "i"))), 0))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "inside"), [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), _S.prop(_S.read(_e, "A"), "x")), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), _S.prop(_S.read(_e, "A"), "y"))])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "A", _S.arg(_args, 1))
	_S.define(_e, "fn", _S.arg(_args, 2))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 3), func(): return 1))
	_S.define(_e, "m", _S.prop(_S.read(_e, "A"), "mask"))
	_S.define(_e, "P", _S.prop(_S.read(_e, "A"), "pixels"))
	_S.define(_e, "fa", _S.binary("===", _S.unary("typeof", _S.read(_e, "a")), "function"))
	if _S.truth(_S.unary("!", _S.read(_e, "P"))):
		return null
	var _v4 = _S.scope(_e)
	_S.define(_v4, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "j"), _S.prop(_S.read(_v4, "m"), "h"))):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), _S.prop(_S.read(_v5, "m"), "w"))):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "c", _S.prop(_S.read(_v6, "P"), _S.binary("+", _S.binary("*", _S.read(_v6, "j"), _S.prop(_S.read(_v6, "m"), "w")), _S.read(_v6, "i"))))
			if _S.truth(_S.unary("!", _S.read(_v6, "c"))):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "i", 1, "+=", true)
				continue
			_S.define(_v6, "x", _S.binary("+", _S.prop(_S.read(_v6, "A"), "x"), _S.read(_v6, "i")))
			_S.define(_v6, "y", _S.binary("+", _S.prop(_S.read(_v6, "A"), "y"), _S.read(_v6, "j")))
			_S.define(_v6, "n", _S.call_value(_S.read(_v6, "fn"), [_S.read(_v6, "c"), _S.read(_v6, "x"), _S.read(_v6, "y")]))
			if _S.truth(_S.read(_v6, "n")):
				_S.invoke(_S.read(_v6, "p"), "dot", [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.read(_v6, "n"), (_S.call_value(_S.read(_v6, "a"), [_S.read(_v6, "x"), _S.read(_v6, "y")]) if _S.truth(_S.read(_v6, "fa")) else _S.read(_v6, "a"))])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "j", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "cx", _S.arg(_args, 1))
	_S.define(_e, "cy", _S.arg(_args, 2))
	_S.define(_e, "rx", _S.arg(_args, 3))
	_S.define(_e, "ry", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	_S.define(_e, "keep", _S.coalesce(_S.arg(_args, 7), func(): return null))
	if _S.truth(_S.binary("<", _S.read(_e, "rx"), 0.5)):
		return null
	_S.define(_e, "n", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "rx"), _S.read(_e, "ry")]), _S.read(_e, "TAU")), 1.5)]), 6))
	_S.define(_e, "fc", _S.binary("===", _S.unary("typeof", _S.read(_e, "c")), "function"))
	_S.define(_e, "fa", _S.binary("===", _S.unary("typeof", _S.read(_e, "a")), "function"))
	var _v7 = _S.scope(_e)
	_S.define(_v7, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "j"), _S.read(_v7, "n"))):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "g", _S.binary("*", _S.binary("/", _S.read(_v8, "j"), _S.read(_v8, "n")), _S.read(_v8, "TAU")))
		if _S.truth(_S.logical("&&", _S.read(_v8, "keep"), func(): return _S.unary("!", _S.call_value(_S.read(_v8, "keep"), [_S.read(_v8, "g")])))):
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "j", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v8, "p"), "dot", [_S.binary("+", _S.read(_v8, "cx"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "g")]), _S.read(_v8, "rx"))), _S.binary("+", _S.read(_v8, "cy"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "g")]), _S.read(_v8, "ry"))), (_S.call_value(_S.read(_v8, "c"), [_S.read(_v8, "g")]) if _S.truth(_S.read(_v8, "fc")) else _S.read(_v8, "c")), (_S.call_value(_S.read(_v8, "a"), [_S.read(_v8, "g")]) if _S.truth(_S.read(_v8, "fa")) else _S.read(_v8, "a"))])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "j", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "ang", _S.arg(_args, 3))
	_S.define(_e, "len", _S.arg(_args, 4))
	_S.define(_e, "wid", _S.arg(_args, 5))
	_S.define(_e, "R", _S.arg(_args, 6))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	_S.define(_e, "side", _S.coalesce(_S.arg(_args, 8), func(): return 1))
	_S.define(_e, "hot", _S.coalesce(_S.arg(_args, 9), func(): return 0))
	_S.define(_e, "quill", _S.coalesce(_S.arg(_args, 10), func(): return 0.02))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "len"), 1.5), func(): return _S.binary("<=", _S.read(_e, "a"), 0.02))):
		return null
	_S.define(_e, "n", _S.prop(_S.read(_e, "R"), "length"))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]))
	_S.define(_e, "x1", _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "len"))))
	_S.define(_e, "y1", _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "len"))))
	_S.define(_e, "pad", _S.binary("+", _S.read(_e, "wid"), 1.2))
	_S.define(_e, "h", _S.binary(">", _S.read(_e, "hot"), 0.5))
	_S.define(_e, "edge", (_S.prop(_S.read(_e, "R"), _S.binary("-", _S.read(_e, "n"), 3)) if _S.truth(_S.read(_e, "h")) else _S.prop(_S.read(_e, "R"), _S.binary("-", _S.read(_e, "n"), 5))))
	_S.define(_e, "lead", (_S.read(_e, "WHITE") if _S.truth(_S.read(_e, "h")) else _S.prop(_S.read(_e, "R"), _S.binary("-", _S.read(_e, "n"), 2))))
	_S.define(_e, "B", ([_S.read(_e, "WHITE"), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "R"), _S.binary("-", _S.read(_e, "n"), 2))] if _S.truth(_S.read(_e, "h")) else [_S.prop(_S.read(_e, "R"), _S.binary("-", _S.read(_e, "n"), 2)), _S.prop(_S.read(_e, "R"), _S.binary("-", _S.read(_e, "n"), 3)), _S.prop(_S.read(_e, "R"), _S.binary("-", _S.read(_e, "n"), 4))]))
	_S.invoke(_S.read(_e, "p"), "each", [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "x"), _S.read(_e, "x1")]), _S.read(_e, "pad")), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "y"), _S.read(_e, "y1")]), _S.read(_e, "pad")), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "x"), _S.read(_e, "x1")]), _S.read(_e, "pad")), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "y"), _S.read(_e, "y1")]), _S.read(_e, "pad")), _S.function_value(_e, "_f6")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.arg(_args, 2))
	_S.define(_e, "sy", _S.arg(_args, 3))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")))
	_S.define(_e, "u", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sa"))), _S.read(_e, "len")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary(">", _S.read(_e, "u"), 1.05))):
		return null
	_S.define(_e, "v", _S.binary("*", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ca"))), _S.read(_e, "side")))
	_S.define(_e, "av", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]))
	_S.define(_e, "w", _S.binary("*", _S.binary("*", _S.read(_e, "wid"), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "u"), _S.read(_e, "quill")), 0.22)])])), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("/", _S.binary("-", _S.read(_e, "u"), 0.55), 0.47)]), 2]))])])))
	_S.define(_e, "lim", (_S.binary("*", _S.read(_e, "w"), 0.42) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0)) else _S.read(_e, "w")))
	_S.define(_e, "fade", (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.72)) else _S.binary("-", 1, _S.binary("*", _S.binary("-", _S.read(_e, "u"), 0.72), 1.6))))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "av"), 0.5), func(): return _S.binary("<", _S.read(_e, "u"), 0.9))):
		return _S.invoke(_S.read(_e, "p"), "put", [_S.read(_e, "sx"), _S.read(_e, "sy"), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else _S.prop(_S.read(_e, "B"), 0)), _S.read(_e, "a")])
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "av"), _S.binary("+", _S.read(_e, "lim"), 0.05)), func(): return _S.binary("<", _S.read(_e, "w"), 0.5))):
		return null
	if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "lim"), _S.read(_e, "av")), 1)):
		return (_S.invoke(_S.read(_e, "p"), "put", [_S.read(_e, "sx"), _S.read(_e, "sy"), (_S.prop(_S.read(_e, "B"), 2) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.85)) else _S.read(_e, "edge")), _S.binary("*", _S.read(_e, "a"), _S.read(_e, "fade"))]) if _S.truth(_S.binary(">", _S.read(_e, "v"), 0)) else _S.invoke(_S.read(_e, "p"), "put", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "lead"), _S.read(_e, "a")]))
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.72)):
		return _S.invoke(_S.read(_e, "p"), "put", [_S.read(_e, "sx"), _S.read(_e, "sy"), (_S.prop(_S.read(_e, "B"), 0) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.38)) else _S.prop(_S.read(_e, "B"), 1)), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.prop(_S.read(_e, "B"), 2), _S.binary("*", _S.read(_e, "a"), _S.read(_e, "fade"))])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "L", _S.arg(_args, 3))
	_S.define(_e, "th", _S.arg(_args, 4))
	_S.define(_e, "R", _S.arg(_args, 5))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	_S.define(_e, "glint", _S.coalesce(_S.arg(_args, 7), func(): return false))
	_S.define(_e, "n", _S.prop(_S.read(_e, "R"), "length"))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.define(_e, "w", (1 if _S.truth(_S.binary(">", _S.read(_e, "th"), 1)) else 0))
	_S.define(_e, "ins", _S.function_value(_e, "_f8"))
	var _v9 = _S.scope(_e)
	_S.define(_v9, "j", _S.binary("-", _S.unary("-", _S.read(_v9, "L")), 1))
	while _S.truth(_S.binary("<=", _S.read(_v9, "j"), _S.binary("+", _S.read(_v9, "L"), 1))):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "i", _S.binary("-", _S.unary("-", _S.read(_v10, "L")), 1))
		while _S.truth(_S.binary("<=", _S.read(_v10, "i"), _S.binary("+", _S.read(_v10, "L"), 1))):
			var _v11 = _S.scope(_v10)
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v11, "ins"), [_S.read(_v11, "i"), _S.read(_v11, "j")]))):
				var _v12 = _S.scope(_v11)
				if _S.truth(_S.logical("&&", _S.read(_v12, "w"), func(): return _S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v12, "ins"), [_S.binary("-", _S.read(_v12, "i"), 1), _S.read(_v12, "j")]), func(): return _S.call_value(_S.read(_v12, "ins"), [_S.binary("+", _S.read(_v12, "i"), 1), _S.read(_v12, "j")])), func(): return _S.call_value(_S.read(_v12, "ins"), [_S.read(_v12, "i"), _S.binary("-", _S.read(_v12, "j"), 1)])), func(): return _S.call_value(_S.read(_v12, "ins"), [_S.read(_v12, "i"), _S.binary("+", _S.read(_v12, "j"), 1)])))):
					_S.invoke(_S.read(_v12, "p"), "dot", [_S.binary("+", _S.read(_v12, "X"), _S.read(_v12, "i")), _S.binary("+", _S.read(_v12, "Y"), _S.read(_v12, "j")), _S.prop(_S.read(_v12, "R"), _S.invoke(_S.read(_v12, "Math"), "max", [0, _S.binary("-", _S.read(_v12, "n"), 6)])), _S.binary("*", _S.read(_v12, "a"), 0.9)])
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "i", 1, "+=", true)
				continue
			_S.define(_v11, "c", null)
			if _S.truth(_S.unary("!", _S.read(_v11, "w"))):
				_S.write(_v11, "c", (_S.read(_v11, "WHITE") if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v11, "i"), 0), func(): return _S.binary("===", _S.read(_v11, "j"), 0))) else (_S.prop(_S.read(_v11, "R"), _S.binary("-", _S.read(_v11, "n"), 3)) if _S.truth(_S.binary(">=", _S.binary("+", _S.invoke(_S.read(_v11, "Math"), "abs", [_S.read(_v11, "i")]), _S.invoke(_S.read(_v11, "Math"), "abs", [_S.read(_v11, "j")])), _S.read(_v11, "L"))) else _S.prop(_S.read(_v11, "R"), _S.binary("-", _S.read(_v11, "n"), 2)))), "=", false)
			else:
				if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v11, "i"), 0), func(): return _S.binary("===", _S.read(_v11, "j"), 0))):
					_S.write(_v11, "c", _S.read(_v11, "WHITE"), "=", false)
				else:
					if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v11, "i"), 0), func(): return _S.binary("===", _S.read(_v11, "j"), 0))):
						_S.write(_v11, "c", (_S.prop(_S.read(_v11, "R"), _S.binary("-", _S.read(_v11, "n"), 2)) if _S.truth(_S.binary("<", _S.binary("+", _S.invoke(_S.read(_v11, "Math"), "abs", [_S.read(_v11, "i")]), _S.invoke(_S.read(_v11, "Math"), "abs", [_S.read(_v11, "j")])), _S.read(_v11, "L"))) else _S.prop(_S.read(_v11, "R"), _S.binary("-", _S.read(_v11, "n"), 3))), "=", false)
					else:
						_S.write(_v11, "c", (_S.prop(_S.read(_v11, "R"), _S.binary("-", _S.read(_v11, "n"), 3)) if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v11, "i"), 0), func(): return _S.binary("<", _S.read(_v11, "j"), 0))) else _S.prop(_S.read(_v11, "R"), _S.binary("-", _S.read(_v11, "n"), 5))), "=", false)
			if _S.truth(_S.logical("&&", _S.read(_v11, "glint"), func(): return _S.logical("||", _S.logical("&&", _S.binary("===", _S.read(_v11, "i"), 0), func(): return _S.binary("===", _S.read(_v11, "j"), _S.unary("-", _S.read(_v11, "L")))), func(): return _S.logical("&&", _S.binary("===", _S.read(_v11, "i"), _S.unary("-", _S.read(_v11, "L"))), func(): return _S.binary("===", _S.read(_v11, "j"), 0))))):
				_S.write(_v11, "c", _S.read(_v11, "WHITE"), "=", false)
			_S.invoke(_S.read(_v11, "p"), "dot", [_S.binary("+", _S.read(_v11, "X"), _S.read(_v11, "i")), _S.binary("+", _S.read(_v11, "Y"), _S.read(_v11, "j")), _S.read(_v11, "c"), _S.read(_v11, "a")])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "j", 1, "+=", true)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.logical("||", _S.logical("&&", _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "i")]), _S.read(_e, "w")), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "j")]), _S.read(_e, "L"))), func(): return _S.logical("&&", _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "j")]), _S.read(_e, "w")), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "i")]), _S.read(_e, "L"))))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "c", _S.arg(_args, 1))
	_S.define(_e, "lift", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.prop(_S.read(_e, "R"), _S.call_value(_S.read(_e, "clamp"), [_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "luma"), [_S.read(_e, "c")]), 1.1), _S.read(_e, "lift")), _S.prop(_S.read(_e, "R"), "length"))]), 0, _S.binary("-", _S.prop(_S.read(_e, "R"), "length"), 1)]))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "rng", _S.arg(_args, 0))
	_S.define(_e, "floor", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	_S.set_prop(_S.read(_e, "this"), "R", _S.read(_e, "rng"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "floor", _S.read(_e, "floor"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "f", _S.arg(_args, 0))
	_S.define(_e, "R", _S.prop(_S.read(_e, "this"), "R"))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"vx": 0}, {"vy": 0}, {"a": 0}, {"len": 7}, {"wid": 2}, {"delay": 0}, {"back": false}, {"side": _S.invoke(_S.read(_e, "R"), "sign", [])}, {"ph": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}, {"w": _S.invoke(_S.read(_e, "R"), "range", [3.2, 4.6])}, {"amp": _S.invoke(_S.read(_e, "R"), "range", [6, 11])}, {"sink": _S.invoke(_S.read(_e, "R"), "range", [14, 24])}, {"va": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 9), 9])}, {"tilt": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.35), 0.35])}, _S.read(_e, "f"), {"max": _S.prop(_S.read(_e, "f"), "life")}, {"age": 0}, {"landed": false}])])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.prop(_S.prop(_S.read(_e, "this"), "list"), "length")

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v13, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v13, "i"), 0)):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "f", _S.prop(_S.prop(_S.read(_v14, "this"), "list"), _S.read(_v14, "i")))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v14, "f"), "delay"), 0)):
			var _v15 = _S.scope(_v14)
			_S.set_prop(_S.read(_v15, "f"), "delay", _S.read(_v15, "dt"), "-=", false)
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v14, "f"), "life", _S.read(_v14, "dt"), "-=", false), 0)):
			var _v16 = _S.scope(_v14)
			_S.invoke(_S.prop(_S.read(_v16, "this"), "list"), "splice", [_S.read(_v16, "i"), 1])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v14, "f"), "age", _S.read(_v14, "dt"), "+=", false)
		if _S.truth(_S.prop(_S.read(_v14, "f"), "landed")):
			var _v17 = _S.scope(_v14)
			_S.set_prop(_S.read(_v17, "f"), "a", _S.binary("*", _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "round", [_S.binary("/", _S.prop(_S.read(_v17, "f"), "a"), _S.prop(_S.read(_v17, "Math"), "PI"))]), _S.prop(_S.read(_v17, "Math"), "PI")), _S.prop(_S.read(_v17, "f"), "a")), _S.invoke(_S.read(_v17, "Math"), "min", [1, _S.binary("*", _S.read(_v17, "dt"), 10)])), "+=", false)
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v14, "f"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v14, "f"), "vx"), 3.4), _S.read(_v14, "dt")), "-=", false)
		_S.set_prop(_S.read(_v14, "f"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v14, "f"), "vy"), 3.4), _S.read(_v14, "dt")), "-=", false)
		_S.define(_v14, "s", _S.call_value(_S.read(_v14, "smooth"), [0.1, 0.6, _S.prop(_S.read(_v14, "f"), "age")]))
		_S.define(_v14, "ph", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v14, "f"), "age"), _S.prop(_S.read(_v14, "f"), "w")), _S.prop(_S.read(_v14, "f"), "ph")))
		_S.define(_v14, "c", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "ph")]))
		_S.set_prop(_S.read(_v14, "f"), "x", _S.binary("*", _S.binary("+", _S.prop(_S.read(_v14, "f"), "vx"), _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "ph")]), _S.prop(_S.read(_v14, "f"), "amp")), _S.read(_v14, "s")), 0.9)), _S.read(_v14, "dt")), "+=", false)
		_S.set_prop(_S.read(_v14, "f"), "y", _S.binary("*", _S.binary("+", _S.prop(_S.read(_v14, "f"), "vy"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v14, "f"), "sink"), _S.read(_v14, "s")), _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_v14, "c"), _S.read(_v14, "c")), 1.5), 0.2))), _S.read(_v14, "dt")), "+=", false)
		_S.define(_v14, "rest", _S.binary("+", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "round", [_S.binary("/", _S.prop(_S.read(_v14, "f"), "a"), _S.prop(_S.read(_v14, "Math"), "PI"))]), _S.prop(_S.read(_v14, "Math"), "PI")), _S.prop(_S.read(_v14, "f"), "tilt")), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "ph")]), 0.6)))
		_S.set_prop(_S.read(_v14, "f"), "a", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v14, "f"), "va"), _S.read(_v14, "dt")), _S.binary("-", 1, _S.read(_v14, "s"))), _S.binary("*", _S.binary("-", _S.read(_v14, "rest"), _S.prop(_S.read(_v14, "f"), "a")), _S.invoke(_S.read(_v14, "Math"), "min", [1, _S.binary("*", _S.binary("*", _S.read(_v14, "dt"), 5), _S.read(_v14, "s"))]))), "+=", false)
		if _S.truth(_S.binary(">=", _S.prop(_S.read(_v14, "f"), "y"), _S.binary("-", _S.prop(_S.read(_v14, "this"), "floor"), 0.5))):
			var _v18 = _S.scope(_v14)
			_S.set_prop(_S.read(_v18, "f"), "y", _S.binary("-", _S.prop(_S.read(_v18, "this"), "floor"), 0.5), "=", false)
			_S.set_prop(_S.read(_v18, "f"), "landed", true, "=", false)
			_S.set_prop(_S.read(_v18, "f"), "life", _S.invoke(_S.read(_v18, "Math"), "min", [_S.prop(_S.read(_v18, "f"), "life"), 0.6]), "=", false)
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "-=", true)
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	_S.define(_e, "layer", _S.arg(_args, 2))
	for _v19 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "f", _v19)
		var _v21 = _S.scope(_v20)
		if _S.truth(_S.logical("||", _S.binary(">", _S.prop(_S.read(_v21, "f"), "delay"), 0), func(): return _S.logical("&&", _S.read(_v21, "layer"), func(): return _S.binary("!==", ("back" if _S.truth(_S.prop(_S.read(_v21, "f"), "back")) else "front"), _S.read(_v21, "layer"))))):
			continue
		_S.define(_v21, "k", _S.binary("/", _S.prop(_S.read(_v21, "f"), "life"), _S.prop(_S.read(_v21, "f"), "max")))
		_S.define(_v21, "a", _S.invoke(_S.read(_v21, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v21, "f"), "life"), 0.45), _S.binary("/", _S.prop(_S.read(_v21, "f"), "age"), 0.06)]))
		_S.define(_v21, "ca", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.prop(_S.read(_v21, "f"), "a")]))
		_S.define(_v21, "sa", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.prop(_S.read(_v21, "f"), "a")]))
		_S.call_value(_S.read(_v21, "feather"), [_S.read(_v21, "p"), _S.binary("-", _S.prop(_S.read(_v21, "f"), "x"), _S.binary("/", _S.binary("*", _S.read(_v21, "ca"), _S.prop(_S.read(_v21, "f"), "len")), 2)), _S.binary("-", _S.prop(_S.read(_v21, "f"), "y"), _S.binary("/", _S.binary("*", _S.read(_v21, "sa"), _S.prop(_S.read(_v21, "f"), "len")), 2)), _S.prop(_S.read(_v21, "f"), "a"), _S.prop(_S.read(_v21, "f"), "len"), _S.prop(_S.read(_v21, "f"), "wid"), _S.read(_v21, "R"), _S.read(_v21, "a"), _S.prop(_S.read(_v21, "f"), "side"), (1 if _S.truth(_S.binary("<", _S.prop(_S.read(_v21, "f"), "age"), 0.06)) else 0), 0.2])
		_S.invoke(_S.read(_v21, "p"), "glow", [_S.prop(_S.read(_v21, "f"), "x"), _S.prop(_S.read(_v21, "f"), "y"), _S.binary("+", 4, _S.binary("*", _S.prop(_S.read(_v21, "f"), "len"), 0.5)), _S.prop(_S.read(_v21, "R"), _S.binary("-", _S.prop(_S.read(_v21, "R"), "length"), 3)), _S.binary("*", _S.binary("*", 0.22, _S.read(_v21, "a")), _S.binary("+", 0.4, _S.binary("*", 0.6, _S.read(_v21, "k"))))])
	return null
