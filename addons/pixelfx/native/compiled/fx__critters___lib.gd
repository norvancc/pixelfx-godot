@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "curve", _S.function_value(_e, "_f0"))
	_S.define(_e, "toss", _S.function_value(_e, "_f1"))
	_S.define(_e, "tongue", _S.function_value(_e, "_f2"))
	_S.define(_e, "firePuff", _S.function_value(_e, "_f3"))
	_S.define(_e, "bubble", _S.function_value(_e, "_f4"))
	_S.define(_e, "shadow", _S.function_value(_e, "_f5"))
	_S.define(_e, "bounce", _S.function_value(_e, "_f6"))
	_S.define(_e, "shift", _S.function_value(_e, "_f7"))
	_exports["shift"] = _S.read(_e, "shift")
	_exports["curve"] = _S.read(_e, "curve")
	_S.define(_e, "lnoise", _S.function_value(_e, "_f8"))
	_exports["lnoise"] = _S.read(_e, "lnoise")
	_S.define(_e, "spring", _S.function_value(_e, "_f9"))
	_exports["spring"] = _S.read(_e, "spring")
	_exports["toss"] = _S.read(_e, "toss")
	_S.define(_e, "Grid", _S.class_value("Grid", _S.function_value(_e, "_f10"), {"idx": _S.function_value(_e, "_f11"), "set": _S.function_value(_e, "_f12"), "get": _S.function_value(_e, "_f13"), "tagAt": _S.function_value(_e, "_f14"), "erase": _S.function_value(_e, "_f15"), "shade": _S.function_value(_e, "_f16"), "ellipse": _S.function_value(_e, "_f17"), "line": _S.function_value(_e, "_f19"), "tube": _S.function_value(_e, "_f20"), "poly": _S.function_value(_e, "_f22"), "sprite": _S.function_value(_e, "_f24"), "depths": _S.function_value(_e, "_f27"), "depth": _S.function_value(_e, "_f28"), "outline": _S.function_value(_e, "_f29"), "recolor": _S.function_value(_e, "_f30"), "draw": _S.function_value(_e, "_f31"), "clear": _S.function_value(_e, "_f32")}, {}, {}, null))
	_exports["Grid"] = _S.read(_e, "Grid")
	_S.define(_e, "Swarm", _S.class_value("Swarm", _S.function_value(_e, "_f33"), {"begin": _S.function_value(_e, "_f34"), "add": _S.function_value(_e, "_f35"), "draw": _S.function_value(_e, "_f36")}, {}, {}, null))
	_exports["Swarm"] = _S.read(_e, "Swarm")
	_S.define(_e, "LAYERS", [[1, 1, 6], [0.76, 0.86, 4], [0.54, 0.68, 2], [0.3, 0.42, 0]])
	_exports["tongue"] = _S.read(_e, "tongue")
	_exports["firePuff"] = _S.read(_e, "firePuff")
	_exports["bubble"] = _S.read(_e, "bubble")
	_exports["shadow"] = _S.read(_e, "shadow")
	_exports["bounce"] = _S.read(_e, "bounce")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "list", _S.arg(_args, 1))
	if _S.truth(_S.binary("<=", _S.read(_e, "x"), _S.prop(_S.prop(_S.read(_e, "list"), 0), 0))):
		return _S.prop(_S.prop(_S.read(_e, "list"), 0), 1)
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 1)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.prop(_S.read(_v0, "list"), "length"))):
		var _v1 = _S.scope(_v0)
		var _v2 = _S.prop(_S.read(_v1, "list"), _S.binary("-", _S.read(_v1, "i"), 1))
		_S.define(_v1, "x0", _S.prop(_v2, 0))
		_S.define(_v1, "v0", _S.prop(_v2, 1))
		var _v3 = _S.prop(_S.read(_v1, "list"), _S.read(_v1, "i"))
		_S.define(_v1, "x1", _S.prop(_v3, 0))
		_S.define(_v1, "v1", _S.prop(_v3, 1))
		if _S.truth(_S.binary("<=", _S.read(_v1, "x"), _S.read(_v1, "x1"))):
			var _v4 = _S.scope(_v1)
			_S.define(_v4, "u", _S.binary("/", _S.binary("-", _S.read(_v4, "x"), _S.read(_v4, "x0")), _S.logical("||", _S.binary("-", _S.read(_v4, "x1"), _S.read(_v4, "x0")), func(): return 1)))
			return _S.binary("+", _S.read(_v4, "v0"), _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_v4, "v1"), _S.read(_v4, "v0")), _S.read(_v4, "u")), _S.read(_v4, "u")), _S.binary("-", 3, _S.binary("*", 2, _S.read(_v4, "u")))))
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return _S.prop(_S.prop(_S.read(_e, "list"), _S.binary("-", _S.prop(_S.read(_e, "list"), "length"), 1)), 1)

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "vy", _S.arg(_args, 3))
	_S.define(_e, "age", _S.arg(_args, 4))
	_S.define(_e, "g", _S.arg(_args, 5))
	_S.define(_e, "floor", _S.coalesce(_S.arg(_args, 6), func(): return 0))
	_S.define(_e, "tl", (_S.binary("/", _S.binary("+", _S.unary("-", _S.read(_e, "vy")), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("+", _S.binary("*", _S.read(_e, "vy"), _S.read(_e, "vy")), _S.binary("*", _S.binary("*", 2, _S.read(_e, "g")), _S.binary("-", _S.read(_e, "floor"), _S.read(_e, "y"))))])])), _S.read(_e, "g")) if _S.truth(_S.binary(">", _S.read(_e, "g"), 0)) else INF))
	if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.read(_e, "tl"))):
		return _S.merge([{"x": _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "vx"), _S.read(_e, "age")))}, {"y": _S.binary("+", _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "vy"), _S.read(_e, "age"))), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "g")), _S.read(_e, "age")), _S.read(_e, "age")))}, {"vx": _S.read(_e, "vx")}, {"vy": _S.binary("+", _S.read(_e, "vy"), _S.binary("*", _S.read(_e, "g"), _S.read(_e, "age")))}, {"landed": false}, {"at": _S.read(_e, "tl")}, {"lx": _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "vx"), _S.read(_e, "tl")))}])
	return _S.merge([{"x": _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "vx"), _S.read(_e, "tl")))}, {"y": _S.read(_e, "floor")}, {"vx": 0}, {"vy": 0}, {"landed": true}, {"at": _S.read(_e, "tl")}, {"lx": _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "vx"), _S.read(_e, "tl")))}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "h", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "sx", _S.arg(_args, 5))
	_S.define(_e, "t", _S.arg(_args, 6))
	_S.define(_e, "D", _S.arg(_args, 7))
	_S.define(_e, "n", _S.arg(_args, 8))
	_S.define(_e, "heat", _S.arg(_args, 9))
	_S.define(_e, "only", _S.coalesce(_S.arg(_args, 10), func(): return _S.unary("-", 1)))
	if _S.truth(_S.binary("<", _S.read(_e, "h"), 1)):
		return null
	_S.define(_e, "F1", _S.invoke(_S.read(_e, "Math"), "max", [1, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", 9, _S.read(_e, "D"))])]))
	_S.define(_e, "F2", _S.invoke(_S.read(_e, "Math"), "max", [1, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", 4, _S.read(_e, "D"))])]))
	var _v5 = _S.scope(_e)
	_S.define(_v5, "li", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "li"), _S.prop(_S.read(_v5, "LAYERS"), "length"))):
		var _v6 = _S.scope(_v5)
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v6, "only"), 0), func(): return _S.binary("!==", _S.read(_v6, "li"), _S.read(_v6, "only")))):
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "li", 1, "+=", true)
			continue
		var _v7 = _S.prop(_S.read(_v6, "LAYERS"), _S.read(_v6, "li"))
		_S.define(_v6, "lw", _S.prop(_v7, 0))
		_S.define(_v6, "lh", _S.prop(_v7, 1))
		_S.define(_v6, "ri", _S.prop(_v7, 2))
		_S.define(_v6, "H", _S.binary("*", _S.read(_v6, "h"), _S.read(_v6, "lh")))
		_S.define(_v6, "col", _S.prop(_S.read(_v6, "heat"), _S.read(_v6, "ri")))
		var _v8 = _S.scope(_v6)
		_S.define(_v8, "r", 0)
		while _S.truth(_S.binary("<=", _S.read(_v8, "r"), _S.read(_v8, "H"))):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "u", _S.binary("/", _S.read(_v9, "r"), _S.invoke(_S.read(_v9, "Math"), "max", [1, _S.read(_v9, "H")])))
			_S.define(_v9, "half", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v9, "w"), _S.read(_v9, "lw")), _S.invoke(_S.read(_v9, "Math"), "pow", [_S.binary("-", 1, _S.read(_v9, "u")), 0.85])), _S.invoke(_S.read(_v9, "Math"), "min", [1, _S.binary("/", _S.binary("+", _S.read(_v9, "r"), 1.5), 3.5)])), _S.binary("*", _S.call_value(_S.read(_v9, "lnoise"), [_S.read(_v9, "t"), _S.read(_v9, "D"), _S.read(_v9, "F1"), _S.binary("*", _S.read(_v9, "r"), 0.45), _S.read(_v9, "n")]), 0.5)))
			_S.define(_v9, "cx", _S.binary("+", _S.binary("+", _S.read(_v9, "x"), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v9, "sx"), _S.read(_v9, "u")), _S.read(_v9, "u")), _S.read(_v9, "lh"))), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v9, "lnoise"), [_S.read(_v9, "t"), _S.read(_v9, "D"), _S.read(_v9, "F2"), _S.binary("*", _S.read(_v9, "r"), 0.2), _S.binary("+", _S.read(_v9, "n"), 7)]), _S.read(_v9, "u")), 1.1)))
			if _S.truth(_S.binary("<", _S.read(_v9, "half"), 0.3)):
				_v8 = _S.iteration(_v8)
				_S.write(_v8, "r", 1, "+=", true)
				continue
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "px", _S.invoke(_S.read(_v10, "Math"), "round", [_S.binary("-", _S.read(_v10, "cx"), _S.read(_v10, "half"))]))
			while _S.truth(_S.binary("<=", _S.read(_v10, "px"), _S.invoke(_S.read(_v10, "Math"), "round", [_S.binary("+", _S.read(_v10, "cx"), _S.read(_v10, "half"))]))):
				_S.invoke(_S.read(_v10, "p"), "px", [_S.read(_v10, "px"), _S.invoke(_S.read(_v10, "Math"), "round", [_S.binary("-", _S.read(_v10, "y"), _S.read(_v10, "r"))]), _S.read(_v10, "col")])
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "px", 1, "+=", true)
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "r", 1, "+=", true)
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "li", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	_S.define(_e, "size", _S.arg(_args, 4))
	_S.define(_e, "seed", _S.arg(_args, 5))
	_S.define(_e, "heat", _S.arg(_args, 6))
	_S.define(_e, "age", _S.binary("-", 1, _S.read(_e, "k")))
	_S.define(_e, "n", _S.prop(_S.read(_e, "heat"), "length"))
	_S.define(_e, "hot", _S.invoke(_S.read(_e, "Math"), "min", [0.999, _S.binary("+", _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "age"), 0.62]), _S.binary("*", _S.binary("%", _S.read(_e, "seed"), 1), 0.1))]))
	_S.define(_e, "idx", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "n"), 2), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "hot"), _S.binary("-", _S.read(_e, "n"), 1))])]))
	_S.define(_e, "r", _S.binary("*", _S.binary("*", _S.read(_e, "size"), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 7)])))), _S.binary("-", 1, _S.binary("*", _S.read(_e, "age"), 0.55))))
	_S.define(_e, "c", _S.prop(_S.read(_e, "heat"), _S.read(_e, "idx")))
	if _S.truth(_S.binary(">=", _S.read(_e, "idx"), _S.binary("-", _S.read(_e, "n"), 2))):
		return _S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.read(_e, "c"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 3)]), 0.85)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.prop(_S.read(_e, "heat"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "n"), 1), _S.binary("+", _S.read(_e, "idx"), 2)]))])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.16)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.22)), _S.binary("*", _S.read(_e, "r"), 0.78), _S.read(_e, "c")])
	if _S.truth(_S.binary(">", _S.read(_e, "r"), 1.6)):
		_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.9)), _S.binary("*", _S.read(_e, "r"), 0.42), _S.read(_e, "c")])
	if _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_e, "idx"), 3), func(): return _S.binary(">", _S.read(_e, "r"), 1.8))):
		_S.invoke(_S.read(_e, "p"), "circle", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.28)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.34)), _S.binary("*", _S.read(_e, "r"), 0.36), _S.prop(_S.read(_e, "heat"), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "idx"), 1)]))])
	if _S.truth(_S.binary("<", _S.read(_e, "idx"), 6)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.binary("*", _S.read(_e, "r"), 2.4), 2), _S.read(_e, "c"), _S.binary("*", 0.18, _S.read(_e, "k"))])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "cx", _S.arg(_args, 1))
	_S.define(_e, "cy", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "cols", _S.arg(_args, 4))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 5), func(): return 1))
	_S.define(_e, "wob", _S.coalesce(_S.arg(_args, 6), func(): return 0))
	var _v11 = _S.read(_e, "cols")
	_S.define(_e, "HI", _S.prop(_v11, 0))
	_S.define(_e, "LIT", _S.prop(_v11, 1))
	_S.define(_e, "RIM", _S.prop(_v11, 2))
	_S.define(_e, "SHADE", _S.prop(_v11, 3))
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 0.9)):
		return _S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "cx"), _S.read(_e, "cy"), (_S.read(_e, "RIM") if _S.truth(_S.binary("<", _S.read(_e, "r"), 0.7)) else _S.read(_e, "LIT")), _S.read(_e, "a")])
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 1.5)):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "px", _S.invoke(_S.read(_v12, "Math"), "floor", [_S.read(_v12, "cx")]))
		_S.define(_v12, "py", _S.invoke(_S.read(_v12, "Math"), "floor", [_S.read(_v12, "cy")]))
		_S.invoke(_S.read(_v12, "p"), "dot", [_S.read(_v12, "px"), _S.read(_v12, "py"), _S.read(_v12, "HI"), _S.read(_v12, "a")])
		_S.invoke(_S.read(_v12, "p"), "dot", [_S.binary("+", _S.read(_v12, "px"), 1), _S.read(_v12, "py"), _S.read(_v12, "LIT"), _S.read(_v12, "a")])
		_S.invoke(_S.read(_v12, "p"), "dot", [_S.read(_v12, "px"), _S.binary("+", _S.read(_v12, "py"), 1), _S.read(_v12, "RIM"), _S.read(_v12, "a")])
		_S.invoke(_S.read(_v12, "p"), "dot", [_S.binary("+", _S.read(_v12, "px"), 1), _S.binary("+", _S.read(_v12, "py"), 1), _S.read(_v12, "SHADE"), _S.read(_v12, "a")])
		_S.invoke(_S.read(_v12, "p"), "glow", [_S.binary("+", _S.read(_v12, "cx"), 0.5), _S.binary("+", _S.read(_v12, "cy"), 0.5), 3, _S.read(_v12, "LIT"), _S.binary("*", 0.12, _S.read(_v12, "a"))])
		return null
	_S.define(_e, "rx", _S.binary("*", _S.read(_e, "r"), _S.binary("+", 1, _S.read(_e, "wob"))))
	_S.define(_e, "ry", _S.binary("*", _S.read(_e, "r"), _S.binary("-", 1, _S.read(_e, "wob"))))
	var _v13 = _S.scope(_e)
	_S.define(_v13, "y", _S.invoke(_S.read(_v13, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_v13, "cy"), _S.read(_v13, "ry")), 1)]))
	while _S.truth(_S.binary("<=", _S.read(_v13, "y"), _S.invoke(_S.read(_v13, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.read(_v13, "cy"), _S.read(_v13, "ry")), 1)]))):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "x", _S.invoke(_S.read(_v14, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_v14, "cx"), _S.read(_v14, "rx")), 1)]))
		while _S.truth(_S.binary("<=", _S.read(_v14, "x"), _S.invoke(_S.read(_v14, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.read(_v14, "cx"), _S.read(_v14, "rx")), 1)]))):
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "dx", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v15, "x"), 0.5), _S.read(_v15, "cx")), _S.read(_v15, "rx")))
			_S.define(_v15, "dy", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v15, "y"), 0.5), _S.read(_v15, "cy")), _S.read(_v15, "ry")))
			_S.define(_v15, "d", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_v15, "dx"), _S.read(_v15, "dx")), _S.binary("*", _S.read(_v15, "dy"), _S.read(_v15, "dy")))]), _S.read(_v15, "r")))
			if _S.truth(_S.binary(">", _S.read(_v15, "d"), _S.binary("+", _S.read(_v15, "r"), 0.5))):
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "x", 1, "+=", true)
				continue
			_S.define(_v15, "l", _S.binary("/", _S.binary("/", _S.binary("-", _S.unary("-", _S.read(_v15, "dx")), _S.read(_v15, "dy")), _S.prop(_S.read(_v15, "Math"), "SQRT2")), _S.invoke(_S.read(_v15, "Math"), "max", [0.01, _S.binary("/", _S.read(_v15, "d"), _S.read(_v15, "r"))])))
			if _S.truth(_S.binary(">", _S.read(_v15, "d"), _S.binary("-", _S.read(_v15, "r"), 0.6))):
				_S.invoke(_S.read(_v15, "p"), "dot", [_S.read(_v15, "x"), _S.read(_v15, "y"), (_S.read(_v15, "LIT") if _S.truth(_S.binary(">", _S.read(_v15, "l"), 0.45)) else (_S.read(_v15, "SHADE") if _S.truth(_S.binary("<", _S.read(_v15, "l"), _S.unary("-", 0.55))) else _S.read(_v15, "RIM"))), _S.read(_v15, "a")])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "x", 1, "+=", true)
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "y", 1, "+=", true)
	_S.define(_e, "hx", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "rx"), 0.45))]))
	_S.define(_e, "hy", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "ry"), 0.45))]))
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "hx"), _S.read(_e, "hy"), _S.read(_e, "HI"), _S.read(_e, "a")])
	if _S.truth(_S.binary(">=", _S.read(_e, "r"), 2.5)):
		_S.last([_S.invoke(_S.read(_e, "p"), "dot", [_S.binary("+", _S.read(_e, "hx"), 1), _S.read(_e, "hy"), _S.read(_e, "LIT"), _S.read(_e, "a")]), _S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "hx"), _S.binary("+", _S.read(_e, "hy"), 1), _S.read(_e, "LIT"), _S.read(_e, "a")])])
	if _S.truth(_S.binary(">=", _S.read(_e, "r"), 2)):
		_S.invoke(_S.read(_e, "p"), "dot", [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "rx"), 0.5))]), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "ry"), 0.5))]), _S.read(_e, "LIT"), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("+", _S.binary("*", _S.read(_e, "r"), 2.4), 2), _S.read(_e, "RIM"), _S.binary("*", 0.14, _S.read(_e, "a"))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "cx", _S.arg(_args, 1))
	_S.define(_e, "cy", _S.arg(_args, 2))
	_S.define(_e, "rx", _S.arg(_args, 3))
	_S.define(_e, "ry", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "a", _S.arg(_args, 6))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<=", _S.read(_e, "rx"), 0), func(): return _S.binary("<=", _S.read(_e, "ry"), 0)), func(): return _S.binary("<=", _S.read(_e, "a"), 0))):
		return null
	var _v16 = _S.scope(_e)
	_S.define(_v16, "y", _S.invoke(_S.read(_v16, "Math"), "floor", [_S.binary("-", _S.read(_v16, "cy"), _S.read(_v16, "ry"))]))
	while _S.truth(_S.binary("<=", _S.read(_v16, "y"), _S.invoke(_S.read(_v16, "Math"), "ceil", [_S.binary("+", _S.read(_v16, "cy"), _S.read(_v16, "ry"))]))):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "x", _S.invoke(_S.read(_v17, "Math"), "floor", [_S.binary("-", _S.read(_v17, "cx"), _S.read(_v17, "rx"))]))
		while _S.truth(_S.binary("<=", _S.read(_v17, "x"), _S.invoke(_S.read(_v17, "Math"), "ceil", [_S.binary("+", _S.read(_v17, "cx"), _S.read(_v17, "rx"))]))):
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "d", _S.binary("+", _S.binary("**", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v18, "x"), 0.5), _S.read(_v18, "cx")), _S.read(_v18, "rx")), 2), _S.binary("**", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v18, "y"), 0.5), _S.read(_v18, "cy")), _S.read(_v18, "ry")), 2)))
			if _S.truth(_S.binary("<", _S.read(_v18, "d"), 1)):
				_S.invoke(_S.read(_v18, "p"), "blend", [_S.read(_v18, "x"), _S.read(_v18, "y"), _S.read(_v18, "c"), _S.binary("*", _S.read(_v18, "a"), _S.binary("**", _S.binary("-", 1, _S.read(_v18, "d")), 0.7))])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "x", 1, "+=", true)
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "y", 1, "+=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "vy", _S.arg(_args, 3))
	_S.define(_e, "age", _S.arg(_args, 4))
	_S.define(_e, "g", _S.arg(_args, 5))
	_S.define(_e, "floor", _S.coalesce(_S.arg(_args, 6), func(): return 0))
	_S.define(_e, "e", _S.coalesce(_S.arg(_args, 7), func(): return 0.45))
	_S.define(_e, "hops", 0)
	var _v19 = _S.scope(_e)
	while _S.truth(_S.binary("<", _S.read(_v19, "hops"), 6)):
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "f", _S.call_value(_S.read(_v20, "toss"), [_S.read(_v20, "x"), _S.read(_v20, "y"), _S.read(_v20, "vx"), _S.read(_v20, "vy"), _S.read(_v20, "age"), _S.read(_v20, "g"), _S.read(_v20, "floor")]))
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v20, "f"), "landed"))):
			return _S.merge([{"x": _S.prop(_S.read(_v20, "f"), "x")}, {"y": _S.prop(_S.read(_v20, "f"), "y")}, {"vx": _S.prop(_S.read(_v20, "f"), "vx")}, {"vy": _S.prop(_S.read(_v20, "f"), "vy")}, {"hops": _S.read(_v20, "hops")}, {"rest": false}])
		_S.define(_v20, "vl", _S.binary("+", _S.read(_v20, "vy"), _S.binary("*", _S.read(_v20, "g"), _S.prop(_S.read(_v20, "f"), "at"))))
		_S.write(_v20, "age", _S.prop(_S.read(_v20, "f"), "at"), "-=", false)
		_S.write(_v20, "x", _S.prop(_S.read(_v20, "f"), "lx"), "=", false)
		_S.write(_v20, "y", _S.binary("-", _S.read(_v20, "floor"), 0.01), "=", false)
		_S.write(_v20, "vx", 0.7, "*=", false)
		_S.write(_v20, "vy", _S.binary("*", _S.unary("-", _S.read(_v20, "vl")), _S.read(_v20, "e")), "=", false)
		if _S.truth(_S.binary("<", _S.invoke(_S.read(_v20, "Math"), "abs", [_S.read(_v20, "vy")]), 25)):
			break
		_v19 = _S.iteration(_v19)
		_S.write(_v19, "hops", 1, "+=", true)
	return _S.merge([{"x": _S.read(_e, "x")}, {"y": _S.binary("-", _S.read(_e, "floor"), 0.25)}, {"vx": 0}, {"vy": 0}, {"hops": _S.read(_e, "hops")}, {"rest": true}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "D", _S.arg(_args, 1))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 2), func(): return 1))
	return _S.call_value(_S.read(_e, "wrap"), [_S.binary("+", _S.read(_e, "t"), _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_e, "seed"), 1), 0.618), _S.read(_e, "D"))), _S.read(_e, "D")])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "D", _S.arg(_args, 1))
	_S.define(_e, "F", _S.arg(_args, 2))
	_S.define(_e, "off", _S.coalesce(_S.arg(_args, 3), func(): return 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 4), func(): return 0))
	return _S.call_value(_S.read(_e, "tileNoise"), [_S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "F")), _S.read(_e, "off")), 0.5, _S.read(_e, "F"), 0, _S.read(_e, "seed")])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "hz", _S.arg(_args, 1))
	_S.define(_e, "damp", _S.arg(_args, 2))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "age"), 0)) else _S.binary("*", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "age")), _S.read(_e, "damp"))]), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.binary("*", _S.read(_e, "age"), _S.read(_e, "hz")), _S.read(_e, "TAU"))])))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x0", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	_S.define(_e, "w", _S.arg(_args, 2))
	_S.define(_e, "h", _S.arg(_args, 3))
	_S.set_prop(_S.read(_e, "this"), "x0", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x0")]), "=", false)
	_S.set_prop(_S.read(_e, "this"), "y0", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y0")]), "=", false)
	_S.set_prop(_S.read(_e, "this"), "w", _S.read(_e, "w"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "h", _S.read(_e, "h"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "c", _S.construct(_S.read(_e, "Uint32Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "h"))]), "=", false)
	_S.set_prop(_S.read(_e, "this"), "a", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "h"))]), "=", false)
	_S.set_prop(_S.read(_e, "this"), "tag", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "h"))]), "=", false)
	_S.set_prop(_S.read(_e, "this"), "o", _S.merge([{"a": 1}, {"t": 0}]), "=", false)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "ix", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), _S.prop(_S.read(_e, "this"), "x0")))
	_S.define(_e, "iy", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), _S.prop(_S.read(_e, "this"), "y0")))
	return (_S.unary("-", 1) if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "ix"), 0), func(): return _S.binary("<", _S.read(_e, "iy"), 0)), func(): return _S.binary(">=", _S.read(_e, "ix"), _S.prop(_S.read(_e, "this"), "w"))), func(): return _S.binary(">=", _S.read(_e, "iy"), _S.prop(_S.read(_e, "this"), "h")))) else _S.binary("+", _S.binary("*", _S.read(_e, "iy"), _S.prop(_S.read(_e, "this"), "w")), _S.read(_e, "ix")))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 3), func(): return 1))
	_S.define(_e, "tag", _S.coalesce(_S.arg(_args, 4), func(): return 0))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "this"), "idx", [_S.read(_e, "x"), _S.read(_e, "y")]))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "i"), 0), func(): return _S.read(_e, "c"))):
		_S.last([_S.set_prop(_S.prop(_S.read(_e, "this"), "c"), _S.read(_e, "i"), _S.read(_e, "c"), "=", false), _S.set_prop(_S.prop(_S.read(_e, "this"), "a"), _S.read(_e, "i"), _S.read(_e, "a"), "=", false), _S.set_prop(_S.prop(_S.read(_e, "this"), "tag"), _S.read(_e, "i"), _S.read(_e, "tag"), "=", false)])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "this"), "idx", [_S.read(_e, "x"), _S.read(_e, "y")]))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "i"), 0)) else _S.prop(_S.prop(_S.read(_e, "this"), "c"), _S.read(_e, "i")))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "this"), "idx", [_S.read(_e, "x"), _S.read(_e, "y")]))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "i"), 0)) else _S.prop(_S.prop(_S.read(_e, "this"), "tag"), _S.read(_e, "i")))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "this"), "idx", [_S.read(_e, "x"), _S.read(_e, "y")]))
	if _S.truth(_S.binary(">=", _S.read(_e, "i"), 0)):
		_S.set_prop(_S.prop(_S.read(_e, "this"), "c"), _S.read(_e, "i"), 0, "=", false)
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x0", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	_S.define(_e, "x1", _S.arg(_args, 2))
	_S.define(_e, "y1", _S.arg(_args, 3))
	_S.define(_e, "fn", _S.arg(_args, 4))
	_S.define(_e, "o", _S.prop(_S.read(_e, "this"), "o"))
	var _v21 = _S.scope(_e)
	_S.define(_v21, "y", _S.invoke(_S.read(_v21, "Math"), "floor", [_S.read(_v21, "y0")]))
	while _S.truth(_S.binary("<=", _S.read(_v21, "y"), _S.invoke(_S.read(_v21, "Math"), "floor", [_S.read(_v21, "y1")]))):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "x", _S.invoke(_S.read(_v22, "Math"), "floor", [_S.read(_v22, "x0")]))
		while _S.truth(_S.binary("<=", _S.read(_v22, "x"), _S.invoke(_S.read(_v22, "Math"), "floor", [_S.read(_v22, "x1")]))):
			var _v23 = _S.scope(_v22)
			_S.set_prop(_S.read(_v23, "o"), "a", 1, "=", false)
			_S.set_prop(_S.read(_v23, "o"), "t", 0, "=", false)
			_S.define(_v23, "c", _S.call_value(_S.read(_v23, "fn"), [_S.binary("+", _S.read(_v23, "x"), 0.5), _S.binary("+", _S.read(_v23, "y"), 0.5), _S.read(_v23, "o")]))
			if _S.truth(_S.read(_v23, "c")):
				_S.invoke(_S.read(_v23, "this"), "set", [_S.read(_v23, "x"), _S.read(_v23, "y"), _S.read(_v23, "c"), _S.prop(_S.read(_v23, "o"), "a"), _S.prop(_S.read(_v23, "o"), "t")])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "x", 1, "+=", true)
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "y", 1, "+=", true)
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "cx", _S.arg(_args, 0))
	_S.define(_e, "cy", _S.arg(_args, 1))
	_S.define(_e, "rx", _S.arg(_args, 2))
	_S.define(_e, "ry", _S.arg(_args, 3))
	_S.define(_e, "c", _S.arg(_args, 4))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 5), func(): return 1))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "rx"), 0), func(): return _S.binary("<=", _S.read(_e, "ry"), 0))):
		return null
	_S.invoke(_S.read(_e, "this"), "shade", [_S.binary("-", _S.read(_e, "cx"), _S.read(_e, "rx")), _S.binary("-", _S.read(_e, "cy"), _S.read(_e, "ry")), _S.binary("+", _S.read(_e, "cx"), _S.read(_e, "rx")), _S.binary("+", _S.read(_e, "cy"), _S.read(_e, "ry")), _S.function_value(_e, "_f18")])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "nx", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.read(_e, "rx")))
	_S.define(_e, "ny", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")), _S.read(_e, "ry")))
	if _S.truth(_S.binary(">", _S.binary("+", _S.binary("*", _S.read(_e, "nx"), _S.read(_e, "nx")), _S.binary("*", _S.read(_e, "ny"), _S.read(_e, "ny"))), 1)):
		return 0
	_S.set_prop(_S.read(_e, "o"), "a", _S.read(_e, "a"), "=", false)
	return (_S.call_value(_S.read(_e, "c"), [_S.read(_e, "nx"), _S.read(_e, "ny")]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_e, "c")), "function")) else _S.read(_e, "c"))

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x0", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	_S.define(_e, "x1", _S.arg(_args, 2))
	_S.define(_e, "y1", _S.arg(_args, 3))
	_S.define(_e, "c", _S.arg(_args, 4))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 5), func(): return 1))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "max", [1, _S.invoke(_S.read(_e, "Math"), "ceil", [_S.invoke(_S.read(_e, "Math"), "max", [_S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0"))]), _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0"))])])])]))
	var _v24 = _S.scope(_e)
	_S.define(_v24, "i", 0)
	while _S.truth(_S.binary("<=", _S.read(_v24, "i"), _S.read(_v24, "n"))):
		_S.invoke(_S.read(_v24, "this"), "set", [_S.binary("+", _S.read(_v24, "x0"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v24, "x1"), _S.read(_v24, "x0")), _S.read(_v24, "i")), _S.read(_v24, "n"))), _S.binary("+", _S.read(_v24, "y0"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v24, "y1"), _S.read(_v24, "y0")), _S.read(_v24, "i")), _S.read(_v24, "n"))), (_S.call_value(_S.read(_v24, "c"), [_S.binary("/", _S.read(_v24, "i"), _S.read(_v24, "n"))]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_v24, "c")), "function")) else _S.read(_v24, "c")), _S.read(_v24, "a")])
		_v24 = _S.iteration(_v24)
		_S.write(_v24, "i", 1, "+=", true)
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 3), func(): return 1))
	var _v25 = _S.scope(_e)
	_S.define(_v25, "k", 1)
	while _S.truth(_S.binary("<", _S.read(_v25, "k"), _S.prop(_S.read(_v25, "pts"), "length"))):
		var _v26 = _S.scope(_v25)
		var _v27 = _S.prop(_S.read(_v26, "pts"), _S.binary("-", _S.read(_v26, "k"), 1))
		_S.define(_v26, "ax", _S.prop(_v27, 0))
		_S.define(_v26, "ay", _S.prop(_v27, 1))
		var _v28 = _S.prop(_S.read(_v26, "pts"), _S.read(_v26, "k"))
		_S.define(_v26, "bx", _S.prop(_v28, 0))
		_S.define(_v26, "by", _S.prop(_v28, 1))
		_S.define(_v26, "L", _S.invoke(_S.read(_v26, "Math"), "max", [1, _S.invoke(_S.read(_v26, "Math"), "hypot", [_S.binary("-", _S.read(_v26, "bx"), _S.read(_v26, "ax")), _S.binary("-", _S.read(_v26, "by"), _S.read(_v26, "ay"))])]))
		var _v29 = _S.scope(_v26)
		_S.define(_v29, "s", 0)
		while _S.truth(_S.binary("<=", _S.read(_v29, "s"), _S.read(_v29, "L"))):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "u", _S.binary("/", _S.binary("+", _S.binary("-", _S.read(_v30, "k"), 1), _S.binary("/", _S.read(_v30, "s"), _S.read(_v30, "L"))), _S.binary("-", _S.prop(_S.read(_v30, "pts"), "length"), 1)))
			_S.define(_v30, "rr", (_S.call_value(_S.read(_v30, "r"), [_S.read(_v30, "u")]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_v30, "r")), "function")) else _S.read(_v30, "r")))
			_S.define(_v30, "x", _S.binary("+", _S.read(_v30, "ax"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v30, "bx"), _S.read(_v30, "ax")), _S.read(_v30, "s")), _S.read(_v30, "L"))))
			_S.define(_v30, "y", _S.binary("+", _S.read(_v30, "ay"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v30, "by"), _S.read(_v30, "ay")), _S.read(_v30, "s")), _S.read(_v30, "L"))))
			if _S.truth(_S.binary("<", _S.read(_v30, "rr"), 0.75)):
				var _v31 = _S.scope(_v30)
				_S.invoke(_S.read(_v31, "this"), "set", [_S.read(_v31, "x"), _S.read(_v31, "y"), (_S.call_value(_S.read(_v31, "c"), [_S.read(_v31, "u"), 0]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_v31, "c")), "function")) else _S.read(_v31, "c")), _S.read(_v31, "a")])
				_v29 = _S.iteration(_v29)
				_S.write(_v29, "s", 0.5, "+=", false)
				continue
			_S.invoke(_S.read(_v30, "this"), "shade", [_S.binary("-", _S.read(_v30, "x"), _S.read(_v30, "rr")), _S.binary("-", _S.read(_v30, "y"), _S.read(_v30, "rr")), _S.binary("+", _S.read(_v30, "x"), _S.read(_v30, "rr")), _S.binary("+", _S.read(_v30, "y"), _S.read(_v30, "rr")), _S.function_value(_v30, "_f21")])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "s", 0.5, "+=", false)
		_v25 = _S.iteration(_v25)
		_S.write(_v25, "k", 1, "+=", true)
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "d", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")), _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y"))]), _S.read(_e, "rr")))
	_S.set_prop(_S.read(_e, "o"), "a", _S.read(_e, "a"), "=", false)
	return (0 if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)) else (_S.call_value(_S.read(_e, "c"), [_S.read(_e, "u"), _S.read(_e, "d")]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_e, "c")), "function")) else _S.read(_e, "c")))

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "c", _S.arg(_args, 1))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 2), func(): return 1))
	_S.define(_e, "x0", INF)
	_S.define(_e, "y0", INF)
	_S.define(_e, "x1", _S.unary("-", INF))
	_S.define(_e, "y1", _S.unary("-", INF))
	for _v32 in _S.array(_S.read(_e, "pts")):
		var _v33 = _S.scope(_e)
		var _v34 = _v32
		_S.define(_v33, "x", _S.prop(_v34, 0))
		_S.define(_v33, "y", _S.prop(_v34, 1))
		_S.last([_S.write(_v33, "x0", _S.invoke(_S.read(_v33, "Math"), "min", [_S.read(_v33, "x0"), _S.read(_v33, "x")]), "=", false), _S.write(_v33, "x1", _S.invoke(_S.read(_v33, "Math"), "max", [_S.read(_v33, "x1"), _S.read(_v33, "x")]), "=", false), _S.write(_v33, "y0", _S.invoke(_S.read(_v33, "Math"), "min", [_S.read(_v33, "y0"), _S.read(_v33, "y")]), "=", false), _S.write(_v33, "y1", _S.invoke(_S.read(_v33, "Math"), "max", [_S.read(_v33, "y1"), _S.read(_v33, "y")]), "=", false)])
	_S.define(_e, "n", _S.prop(_S.read(_e, "pts"), "length"))
	_S.invoke(_S.read(_e, "this"), "shade", [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.read(_e, "x1"), _S.read(_e, "y1"), _S.function_value(_e, "_f23")])
	return null

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "inside", false)
	var _v35 = _S.scope(_e)
	_S.define(_v35, "i", 0)
	_S.define(_v35, "j", _S.binary("-", _S.read(_v35, "n"), 1))
	while _S.truth(_S.binary("<", _S.read(_v35, "i"), _S.read(_v35, "n"))):
		var _v36 = _S.scope(_v35)
		var _v37 = _S.prop(_S.read(_v36, "pts"), _S.read(_v36, "i"))
		_S.define(_v36, "xi", _S.prop(_v37, 0))
		_S.define(_v36, "yi", _S.prop(_v37, 1))
		var _v38 = _S.prop(_S.read(_v36, "pts"), _S.read(_v36, "j"))
		_S.define(_v36, "xj", _S.prop(_v38, 0))
		_S.define(_v36, "yj", _S.prop(_v38, 1))
		if _S.truth(_S.logical("&&", _S.binary("!==", _S.binary(">", _S.read(_v36, "yi"), _S.read(_v36, "y")), _S.binary(">", _S.read(_v36, "yj"), _S.read(_v36, "y"))), func(): return _S.binary("<", _S.read(_v36, "x"), _S.binary("+", _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v36, "xj"), _S.read(_v36, "xi")), _S.binary("-", _S.read(_v36, "y"), _S.read(_v36, "yi"))), _S.binary("-", _S.read(_v36, "yj"), _S.read(_v36, "yi"))), _S.read(_v36, "xi"))))):
			_S.write(_v36, "inside", _S.unary("!", _S.read(_v36, "inside")), "=", false)
		_v35 = _S.iteration(_v35)
		_S.write(_v35, "j", _S.write(_v35, "i", 1, "+=", true), "=", false)
	_S.set_prop(_S.read(_e, "o"), "a", _S.read(_e, "a"), "=", false)
	return ((_S.call_value(_S.read(_e, "c"), [_S.read(_e, "x"), _S.read(_e, "y")]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_e, "c")), "function")) else _S.read(_e, "c")) if _S.truth(_S.read(_e, "inside")) else 0)

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "rows", _S.arg(_args, 0))
	_S.define(_e, "pal", _S.arg(_args, 1))
	_S.define(_e, "X", _S.arg(_args, 2))
	_S.define(_e, "Y", _S.arg(_args, 3))
	var _v39 = _S.coalesce(_S.arg(_args, 4), func(): return _S.merge([]))
	_S.define(_e, "ax", _S.coalesce(_S.prop(_v39, "ax"), func(): return 0))
	_S.define(_e, "ay", _S.coalesce(_S.prop(_v39, "ay"), func(): return 0))
	_S.define(_e, "sx", _S.coalesce(_S.prop(_v39, "sx"), func(): return 1))
	_S.define(_e, "sy", _S.coalesce(_S.prop(_v39, "sy"), func(): return 1))
	_S.define(_e, "rot", _S.coalesce(_S.prop(_v39, "rot"), func(): return 0))
	_S.define(_e, "flip", _S.coalesce(_S.prop(_v39, "flip"), func(): return false))
	_S.define(_e, "H", _S.prop(_S.read(_e, "rows"), "length"))
	_S.define(_e, "W", _S.prop(_S.prop(_S.read(_e, "rows"), 0), "length"))
	_S.define(_e, "cache", _S.merge([]))
	_S.define(_e, "col", _S.function_value(_e, "_f25"))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("===", _S.read(_e, "sx"), 1), func(): return _S.binary("===", _S.read(_e, "sy"), 1)), func(): return _S.binary("===", _S.read(_e, "rot"), 0))):
		var _v40 = _S.scope(_e)
		var _v41 = _S.scope(_v40)
		_S.define(_v41, "r", 0)
		while _S.truth(_S.binary("<", _S.read(_v41, "r"), _S.read(_v41, "H"))):
			var _v42 = _S.scope(_v41)
			_S.define(_v42, "q", 0)
			while _S.truth(_S.binary("<", _S.read(_v42, "q"), _S.read(_v42, "W"))):
				var _v43 = _S.scope(_v42)
				_S.define(_v43, "ch", _S.prop(_S.prop(_S.read(_v43, "rows"), _S.read(_v43, "r")), (_S.binary("-", _S.binary("-", _S.read(_v43, "W"), 1), _S.read(_v43, "q")) if _S.truth(_S.read(_v43, "flip")) else _S.read(_v43, "q"))))
				if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v43, "ch"), "."), func(): return _S.binary("===", _S.read(_v43, "ch"), " "))):
					_v42 = _S.iteration(_v42)
					_S.write(_v42, "q", 1, "+=", true)
					continue
				_S.define(_v43, "c", _S.call_value(_S.read(_v43, "col"), [_S.read(_v43, "ch")]))
				if _S.truth(_S.read(_v43, "c")):
					_S.invoke(_S.read(_v43, "this"), "set", [_S.binary("+", _S.invoke(_S.read(_v43, "Math"), "round", [_S.binary("-", _S.read(_v43, "X"), (_S.binary("-", _S.binary("-", _S.read(_v43, "W"), 1), _S.read(_v43, "ax")) if _S.truth(_S.read(_v43, "flip")) else _S.read(_v43, "ax")))]), _S.read(_v43, "q")), _S.binary("+", _S.invoke(_S.read(_v43, "Math"), "round", [_S.binary("-", _S.read(_v43, "Y"), _S.read(_v43, "ay"))]), _S.read(_v43, "r")), _S.read(_v43, "c")])
				_v42 = _S.iteration(_v42)
				_S.write(_v42, "q", 1, "+=", true)
			_v41 = _S.iteration(_v41)
			_S.write(_v41, "r", 1, "+=", true)
		return null
	_S.define(_e, "cs", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "rot")]))
	_S.define(_e, "sn", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "rot")]))
	_S.define(_e, "R", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "ax"), _S.binary("-", _S.read(_e, "W"), _S.read(_e, "ax"))]), _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "sx")])), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "ay"), _S.binary("-", _S.read(_e, "H"), _S.read(_e, "ay"))]), _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "sy")]))]), 1))
	_S.invoke(_S.read(_e, "this"), "shade", [_S.binary("-", _S.read(_e, "X"), _S.read(_e, "R")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "R")), _S.binary("+", _S.read(_e, "X"), _S.read(_e, "R")), _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "R")), _S.function_value(_e, "_f26")])
	return null

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ch", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "cache"), _S.read(_e, "ch")) if _S.truth(_S.binary("in", _S.read(_e, "ch"), _S.read(_e, "cache"))) else _S.set_prop(_S.read(_e, "cache"), _S.read(_e, "ch"), (0 if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "pal"), _S.read(_e, "ch")), null)) else _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "pal"), _S.read(_e, "ch"))])), "=", false))

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "X")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "Y")))
	_S.define(_e, "u", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "cs")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sn"))), _S.read(_e, "sx")))
	_S.define(_e, "v", _S.binary("/", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sn")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "cs"))), _S.read(_e, "sy")))
	_S.define(_e, "q", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.read(_e, "ax"), _S.read(_e, "u"))]))
	_S.define(_e, "r", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.read(_e, "ay"), _S.read(_e, "v"))]))
	if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "q"), 0), func(): return _S.binary("<", _S.read(_e, "r"), 0)), func(): return _S.binary(">=", _S.read(_e, "q"), _S.read(_e, "W"))), func(): return _S.binary(">=", _S.read(_e, "r"), _S.read(_e, "H")))):
		return 0
	if _S.truth(_S.read(_e, "flip")):
		_S.write(_e, "q", _S.binary("-", _S.binary("-", _S.read(_e, "W"), 1), _S.read(_e, "q")), "=", false)
	_S.define(_e, "ch", _S.prop(_S.prop(_S.read(_e, "rows"), _S.read(_e, "r")), _S.read(_e, "q")))
	return (0 if _S.truth(_S.logical("||", _S.binary("===", _S.read(_e, "ch"), "."), func(): return _S.binary("===", _S.read(_e, "ch"), " "))) else _S.call_value(_S.read(_e, "col"), [_S.read(_e, "ch")]))

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "max", _S.coalesce(_S.arg(_args, 0), func(): return 4))
	var _v44 = _S.read(_e, "this")
	_S.define(_e, "w", _S.prop(_v44, "w"))
	_S.define(_e, "h", _S.prop(_v44, "h"))
	_S.define(_e, "c", _S.prop(_v44, "c"))
	_S.define(_e, "d", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "h"))]))
	_S.define(_e, "q", [])
	var _v45 = _S.scope(_e)
	_S.define(_v45, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v45, "i"), _S.binary("*", _S.read(_v45, "w"), _S.read(_v45, "h")))):
		var _v46 = _S.scope(_v45)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v46, "c"), _S.read(_v46, "i")))):
			_v45 = _S.iteration(_v45)
			_S.write(_v45, "i", 1, "+=", true)
			continue
		_S.define(_v46, "x", _S.binary("%", _S.read(_v46, "i"), _S.read(_v46, "w")))
		_S.define(_v46, "y", _S.binary("|", _S.binary("/", _S.read(_v46, "i"), _S.read(_v46, "w")), 0))
		if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.logical("||", _S.logical("||", _S.logical("||", _S.logical("||", _S.binary("===", _S.read(_v46, "x"), 0), func(): return _S.binary("===", _S.read(_v46, "y"), 0)), func(): return _S.binary("===", _S.read(_v46, "x"), _S.binary("-", _S.read(_v46, "w"), 1))), func(): return _S.binary("===", _S.read(_v46, "y"), _S.binary("-", _S.read(_v46, "h"), 1))), func(): return _S.unary("!", _S.prop(_S.read(_v46, "c"), _S.binary("-", _S.read(_v46, "i"), 1)))), func(): return _S.unary("!", _S.prop(_S.read(_v46, "c"), _S.binary("+", _S.read(_v46, "i"), 1)))), func(): return _S.unary("!", _S.prop(_S.read(_v46, "c"), _S.binary("-", _S.read(_v46, "i"), _S.read(_v46, "w"))))), func(): return _S.unary("!", _S.prop(_S.read(_v46, "c"), _S.binary("+", _S.read(_v46, "i"), _S.read(_v46, "w")))))):
			_S.last([_S.set_prop(_S.read(_v46, "d"), _S.read(_v46, "i"), 1, "=", false), _S.invoke(_S.read(_v46, "q"), "push", [_S.read(_v46, "i")])])
		_v45 = _S.iteration(_v45)
		_S.write(_v45, "i", 1, "+=", true)
	var _v47 = _S.scope(_e)
	_S.define(_v47, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v47, "k"), _S.prop(_S.read(_v47, "q"), "length"))):
		var _v48 = _S.scope(_v47)
		_S.define(_v48, "i", _S.prop(_S.read(_v48, "q"), _S.read(_v48, "k")))
		_S.define(_v48, "v", _S.prop(_S.read(_v48, "d"), _S.read(_v48, "i")))
		if _S.truth(_S.binary(">=", _S.read(_v48, "v"), _S.read(_v48, "max"))):
			_v47 = _S.iteration(_v47)
			_S.write(_v47, "k", 1, "+=", true)
			continue
		for _v49 in _S.array([_S.binary("-", _S.read(_v48, "i"), 1), _S.binary("+", _S.read(_v48, "i"), 1), _S.binary("-", _S.read(_v48, "i"), _S.read(_v48, "w")), _S.binary("+", _S.read(_v48, "i"), _S.read(_v48, "w"))]):
			var _v50 = _S.scope(_v48)
			_S.define(_v50, "j", _v49)
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_v50, "j"), 0), func(): return _S.binary("<", _S.read(_v50, "j"), _S.binary("*", _S.read(_v50, "w"), _S.read(_v50, "h")))), func(): return _S.prop(_S.read(_v50, "c"), _S.read(_v50, "j"))), func(): return _S.unary("!", _S.prop(_S.read(_v50, "d"), _S.read(_v50, "j"))))):
				_S.last([_S.set_prop(_S.read(_v50, "d"), _S.read(_v50, "j"), _S.binary("+", _S.read(_v50, "v"), 1), "=", false), _S.invoke(_S.read(_v50, "q"), "push", [_S.read(_v50, "j")])])
		_v47 = _S.iteration(_v47)
		_S.write(_v47, "k", 1, "+=", true)
	var _v51 = _S.scope(_e)
	_S.define(_v51, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v51, "i"), _S.binary("*", _S.read(_v51, "w"), _S.read(_v51, "h")))):
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v51, "c"), _S.read(_v51, "i")), func(): return _S.unary("!", _S.prop(_S.read(_v51, "d"), _S.read(_v51, "i"))))):
			_S.set_prop(_S.read(_v51, "d"), _S.read(_v51, "i"), _S.read(_v51, "max"), "=", false)
		_v51 = _S.iteration(_v51)
		_S.write(_v51, "i", 1, "+=", true)
	_S.set_prop(_S.read(_e, "this"), "d", _S.read(_e, "d"), "=", false)
	return _S.read(_e, "d")

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "this"), "idx", [_S.read(_e, "x"), _S.read(_e, "y")]))
	return (0 if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "i"), 0), func(): return _S.unary("!", _S.prop(_S.read(_e, "this"), "d")))) else _S.prop(_S.prop(_S.read(_e, "this"), "d"), _S.read(_e, "i")))

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 1), func(): return 1))
	_S.define(_e, "src", _S.invoke(_S.prop(_S.read(_e, "this"), "c"), "slice", []))
	_S.define(_e, "w", _S.prop(_S.read(_e, "this"), "w"))
	_S.define(_e, "h", _S.prop(_S.read(_e, "this"), "h"))
	_S.define(_e, "fn", _S.binary("===", _S.unary("typeof", _S.read(_e, "c")), "function"))
	var _v52 = _S.scope(_e)
	_S.define(_v52, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v52, "y"), _S.read(_v52, "h"))):
		var _v53 = _S.scope(_v52)
		_S.define(_v53, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v53, "x"), _S.read(_v53, "w"))):
			var _v54 = _S.scope(_v53)
			_S.define(_v54, "i", _S.binary("+", _S.binary("*", _S.read(_v54, "y"), _S.read(_v54, "w")), _S.read(_v54, "x")))
			if _S.truth(_S.prop(_S.read(_v54, "src"), _S.read(_v54, "i"))):
				_v53 = _S.iteration(_v53)
				_S.write(_v53, "x", 1, "+=", true)
				continue
			_S.define(_v54, "l", _S.logical("&&", _S.binary(">", _S.read(_v54, "x"), 0), func(): return _S.prop(_S.read(_v54, "src"), _S.binary("-", _S.read(_v54, "i"), 1))))
			_S.define(_v54, "r", _S.logical("&&", _S.binary("<", _S.read(_v54, "x"), _S.binary("-", _S.read(_v54, "w"), 1)), func(): return _S.prop(_S.read(_v54, "src"), _S.binary("+", _S.read(_v54, "i"), 1))))
			_S.define(_v54, "u", _S.logical("&&", _S.binary(">", _S.read(_v54, "y"), 0), func(): return _S.prop(_S.read(_v54, "src"), _S.binary("-", _S.read(_v54, "i"), _S.read(_v54, "w")))))
			_S.define(_v54, "d", _S.logical("&&", _S.binary("<", _S.read(_v54, "y"), _S.binary("-", _S.read(_v54, "h"), 1)), func(): return _S.prop(_S.read(_v54, "src"), _S.binary("+", _S.read(_v54, "i"), _S.read(_v54, "w")))))
			if _S.truth(_S.unary("!", _S.logical("||", _S.logical("||", _S.logical("||", _S.read(_v54, "l"), func(): return _S.read(_v54, "r")), func(): return _S.read(_v54, "u")), func(): return _S.read(_v54, "d")))):
				_v53 = _S.iteration(_v53)
				_S.write(_v53, "x", 1, "+=", true)
				continue
			_S.define(_v54, "col", (_S.call_value(_S.read(_v54, "c"), [_S.binary("+", _S.prop(_S.read(_v54, "this"), "x0"), _S.read(_v54, "x")), _S.binary("+", _S.prop(_S.read(_v54, "this"), "y0"), _S.read(_v54, "y")), _S.binary("-", (1 if _S.truth(_S.read(_v54, "l")) else 0), (1 if _S.truth(_S.read(_v54, "r")) else 0)), _S.binary("-", (1 if _S.truth(_S.read(_v54, "u")) else 0), (1 if _S.truth(_S.read(_v54, "d")) else 0))]) if _S.truth(_S.read(_v54, "fn")) else _S.read(_v54, "c")))
			if _S.truth(_S.read(_v54, "col")):
				_S.last([_S.set_prop(_S.prop(_S.read(_v54, "this"), "c"), _S.read(_v54, "i"), _S.read(_v54, "col"), "=", false), _S.set_prop(_S.prop(_S.read(_v54, "this"), "a"), _S.read(_v54, "i"), _S.read(_v54, "a"), "=", false), _S.set_prop(_S.prop(_S.read(_v54, "this"), "tag"), _S.read(_v54, "i"), 255, "=", false)])
			_v53 = _S.iteration(_v53)
			_S.write(_v53, "x", 1, "+=", true)
		_v52 = _S.iteration(_v52)
		_S.write(_v52, "y", 1, "+=", true)
	return null

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "fn", _S.arg(_args, 0))
	var _v55 = _S.scope(_e)
	_S.define(_v55, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v55, "i"), _S.binary("*", _S.prop(_S.read(_v55, "this"), "w"), _S.prop(_S.read(_v55, "this"), "h")))):
		var _v56 = _S.scope(_v55)
		if _S.truth(_S.unary("!", _S.prop(_S.prop(_S.read(_v56, "this"), "c"), _S.read(_v56, "i")))):
			_v55 = _S.iteration(_v55)
			_S.write(_v55, "i", 1, "+=", true)
			continue
		_S.set_prop(_S.prop(_S.read(_v56, "this"), "c"), _S.read(_v56, "i"), _S.logical("||", _S.call_value(_S.read(_v56, "fn"), [_S.binary("+", _S.prop(_S.read(_v56, "this"), "x0"), _S.binary("%", _S.read(_v56, "i"), _S.prop(_S.read(_v56, "this"), "w"))), _S.binary("+", _S.prop(_S.read(_v56, "this"), "y0"), _S.binary("|", _S.binary("/", _S.read(_v56, "i"), _S.prop(_S.read(_v56, "this"), "w")), 0)), _S.prop(_S.prop(_S.read(_v56, "this"), "c"), _S.read(_v56, "i")), _S.prop(_S.prop(_S.read(_v56, "this"), "a"), _S.read(_v56, "i")), _S.prop(_S.prop(_S.read(_v56, "this"), "tag"), _S.read(_v56, "i"))]), func(): return 0), "=", false)
		_v55 = _S.iteration(_v55)
		_S.write(_v55, "i", 1, "+=", true)
	return null

static func _f31(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "fade", _S.coalesce(_S.arg(_args, 1), func(): return 1))
	_S.define(_e, "dx", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "dy", _S.coalesce(_S.arg(_args, 3), func(): return 0))
	_S.define(_e, "X", _S.binary("+", _S.prop(_S.read(_e, "this"), "x0"), _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "dx")])))
	_S.define(_e, "Y", _S.binary("+", _S.prop(_S.read(_e, "this"), "y0"), _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "dy")])))
	var _v57 = _S.scope(_e)
	_S.define(_v57, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v57, "y"), _S.prop(_S.read(_v57, "this"), "h"))):
		var _v58 = _S.scope(_v57)
		_S.define(_v58, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v58, "x"), _S.prop(_S.read(_v58, "this"), "w"))):
			var _v59 = _S.scope(_v58)
			_S.define(_v59, "i", _S.binary("+", _S.binary("*", _S.read(_v59, "y"), _S.prop(_S.read(_v59, "this"), "w")), _S.read(_v59, "x")))
			_S.define(_v59, "c", _S.prop(_S.prop(_S.read(_v59, "this"), "c"), _S.read(_v59, "i")))
			if _S.truth(_S.unary("!", _S.read(_v59, "c"))):
				_v58 = _S.iteration(_v58)
				_S.write(_v58, "x", 1, "+=", true)
				continue
			_S.define(_v59, "a", _S.prop(_S.prop(_S.read(_v59, "this"), "a"), _S.read(_v59, "i")))
			if _S.truth(_S.binary(">=", _S.read(_v59, "a"), 0.999)):
				_S.invoke(_S.read(_v59, "p"), "dot", [_S.binary("+", _S.read(_v59, "X"), _S.read(_v59, "x")), _S.binary("+", _S.read(_v59, "Y"), _S.read(_v59, "y")), _S.read(_v59, "c"), _S.read(_v59, "fade")])
			else:
				_S.invoke(_S.read(_v59, "p"), "blend", [_S.binary("+", _S.read(_v59, "X"), _S.read(_v59, "x")), _S.binary("+", _S.read(_v59, "Y"), _S.read(_v59, "y")), _S.read(_v59, "c"), _S.binary("*", _S.read(_v59, "a"), _S.read(_v59, "fade"))])
			_v58 = _S.iteration(_v58)
			_S.write(_v58, "x", 1, "+=", true)
		_v57 = _S.iteration(_v57)
		_S.write(_v57, "y", 1, "+=", true)
	return null

static func _f32(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.invoke(_S.prop(_S.read(_e, "this"), "c"), "fill", [0])
	_S.invoke(_S.prop(_S.read(_e, "this"), "tag"), "fill", [0])
	_S.set_prop(_S.read(_e, "this"), "d", null, "=", false)
	return _S.read(_e, "this")

static func _f33(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "opts", _S.coalesce(_S.arg(_args, 0), func(): return _S.merge([])))
	_S.set_prop(_S.read(_e, "this"), "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.construct(_S.read(_e, "Rng"), [1])}, _S.read(_e, "opts")])]), "=", false)
	return null

static func _f34(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.set_prop(_S.prop(_S.prop(_S.read(_e, "this"), "ps"), "list"), "length", 0, "=", false)
	_S.set_prop(_S.prop(_S.read(_e, "this"), "ps"), "t", _S.read(_e, "t"), "=", false)
	return _S.read(_e, "this")

static func _f35(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "k", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "vx", _S.arg(_args, 3))
	_S.define(_e, "vy", _S.arg(_args, 4))
	_S.define(_e, "age", _S.arg(_args, 5))
	_S.define(_e, "life", _S.arg(_args, 6))
	_S.define(_e, "col", _S.coalesce(_S.arg(_args, 7), func(): return _S.read(_e, "WHITE")))
	_S.define(_e, "size", _S.coalesce(_S.arg(_args, 8), func(): return 1))
	_S.define(_e, "flag", _S.coalesce(_S.arg(_args, 9), func(): return 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 10), func(): return 0))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "age"), 0), func(): return _S.binary(">=", _S.read(_e, "age"), _S.read(_e, "life")))):
		return null
	_S.invoke(_S.prop(_S.prop(_S.read(_e, "this"), "ps"), "list"), "push", [_S.merge([{"k": _S.read(_e, "k")}, {"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"vx": _S.read(_e, "vx")}, {"vy": _S.read(_e, "vy")}, {"life": _S.binary("-", _S.read(_e, "life"), _S.read(_e, "age"))}, {"max": _S.read(_e, "life")}, {"col": (_S.call_value(_S.read(_e, "hex"), [_S.read(_e, "col")]) if _S.truth(_S.read(_e, "col")) else 0)}, {"size": _S.read(_e, "size")}, {"seed": _S.read(_e, "seed")}, {"delay": 0}, {"flag": _S.read(_e, "flag")}])])
	return null

static func _f36(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "layer", _S.arg(_args, 1))
	_S.invoke(_S.prop(_S.read(_e, "this"), "ps"), "draw", [_S.read(_e, "p"), _S.read(_e, "layer")])
	return null
