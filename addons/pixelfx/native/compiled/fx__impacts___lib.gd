@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "stone", _S.function_value(_e, "_f0"))
	_S.define(_e, "spikes", _S.function_value(_e, "_f1"))
	_S.define(_e, "star", _S.function_value(_e, "_f3"))
	_S.define(_e, "brokenRing", _S.function_value(_e, "_f4"))
	_S.define(_e, "walk", _S.function_value(_e, "_f5"))
	_S.define(_e, "makeCracks", _S.function_value(_e, "_f6"))
	_S.define(_e, "drawCracks", _S.function_value(_e, "_f7"))
	_S.define(_e, "frontCrescent", _S.function_value(_e, "_f11"))
	_S.define(_e, "dustRing", _S.function_value(_e, "_f13"))
	_S.define(_e, "rock", _S.function_value(_e, "_f14"))
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#0d0a12"]))
	_exports["SOOT"] = _S.read(_e, "SOOT")
	_S.define(_e, "OUTLINE", _S.call_value(_S.read(_e, "hex"), ["#1a1422"]))
	_exports["OUTLINE"] = _S.read(_e, "OUTLINE")
	_S.define(_e, "LIGHT", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.unary("-", 1), _S.unary("-", 1)]))
	_exports["stone"] = _S.read(_e, "stone")
	_exports["spikes"] = _S.read(_e, "spikes")
	_exports["star"] = _S.read(_e, "star")
	_exports["brokenRing"] = _S.read(_e, "brokenRing")
	_exports["makeCracks"] = _S.read(_e, "makeCracks")
	_exports["drawCracks"] = _S.read(_e, "drawCracks")
	_exports["frontCrescent"] = _S.read(_e, "frontCrescent")
	_exports["dustRing"] = _S.read(_e, "dustRing")
	_S.define(_e, "rockShape", _S.function_value(_e, "_f16"))
	_exports["rockShape"] = _S.read(_e, "rockShape")
	_exports["rock"] = _S.read(_e, "rock")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.write(_e, "c", _S.call_value(_S.read(_e, "hex"), [_S.read(_e, "c")]), "=", false)
	return _S.merge([{"light": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 1.35]), _S.read(_e, "WHITE"), 0.08])}, {"body": _S.read(_e, "c")}, {"shade": _S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 0.64])}, {"dust": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 1.2]), _S.call_value(_S.read(_e, "rgb"), [150, 140, 150]), 0.3])}, {"lip": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 1.55]), _S.read(_e, "WHITE"), 0.12])}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "n", _S.arg(_args, 1))
	_S.define(_e, "aim", _S.arg(_args, 2))
	var _v0 = _S.coalesce(_S.arg(_args, 3), func(): return _S.merge([]))
	_S.define(_e, "len", _S.coalesce(_S.prop(_v0, "len"), func(): return [7, 10]))
	_S.define(_e, "w", _S.coalesce(_S.prop(_v0, "w"), func(): return [1.5, 2.1]))
	_S.define(_e, "fwd", _S.coalesce(_S.prop(_v0, "fwd"), func(): return 1.8))
	_S.define(_e, "back", _S.coalesce(_S.prop(_v0, "back"), func(): return 0.6))
	_S.define(_e, "jag", _S.coalesce(_S.prop(_v0, "jag"), func(): return 1))
	_S.define(_e, "jit", _S.coalesce(_S.prop(_v0, "jit"), func(): return 0.18))
	return _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "n")}]), _S.function_value(_e, "_f2")])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("+", _S.binary("+", _S.read(_e, "aim"), _S.binary("*", _S.binary("/", _S.read(_e, "i"), _S.read(_e, "n")), _S.read(_e, "TAU"))), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", _S.read(_e, "jit")), _S.read(_e, "jit")])))
	_S.define(_e, "cb", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("-", _S.read(_e, "a"), _S.read(_e, "aim"))]))
	_S.define(_e, "L", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.prop(_S.read(_e, "len"), 0), _S.prop(_S.read(_e, "len"), 1)]), _S.binary("+", _S.binary("+", 1, _S.binary("*", _S.read(_e, "fwd"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "cb")]), 3]))), _S.binary("*", _S.read(_e, "back"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.unary("-", _S.read(_e, "cb"))]), 3])))), (_S.read(_e, "jag") if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else 1)))
	return _S.merge([{"a": _S.read(_e, "a")}, {"len": _S.read(_e, "L")}, {"w": _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.prop(_S.read(_e, "w"), 0), _S.prop(_S.read(_e, "w"), 1)]), (_S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "jag")]) if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else 1))}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "list", _S.arg(_args, 3))
	_S.define(_e, "sc", _S.arg(_args, 4))
	_S.define(_e, "th", _S.arg(_args, 5))
	var _v1 = _S.arg(_args, 6)
	_S.define(_e, "rim", _S.prop(_v1, 0))
	_S.define(_e, "body", _S.prop(_v1, 1))
	_S.define(_e, "inner", _S.prop(_v1, 2))
	_S.define(_e, "core", _S.prop(_v1, 3))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	_S.define(_e, "heart", _S.coalesce(_S.arg(_args, 8), func(): return 2.4))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "pass", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "pass"), 3)):
		for _v3 in _S.array(_S.read(_v2, "list")):
			var _v4 = _S.scope(_v2)
			_S.define(_v4, "s", _v3)
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "c", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.prop(_S.read(_v5, "s"), "a")]))
			_S.define(_v5, "sn", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.prop(_S.read(_v5, "s"), "a")]))
			_S.define(_v5, "L", _S.binary("*", _S.prop(_S.read(_v5, "s"), "len"), _S.read(_v5, "sc")))
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "d", 0)
			while _S.truth(_S.binary("<=", _S.read(_v6, "d"), _S.read(_v6, "L"))):
				var _v7 = _S.scope(_v6)
				if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v7, "pass"), 2), func(): return _S.binary(">", _S.read(_v7, "d"), _S.binary("*", _S.read(_v7, "L"), 0.55)))):
					break
				_S.define(_v7, "hw0", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v7, "s"), "w"), _S.read(_v7, "th")), _S.binary("-", 1, _S.binary("/", _S.read(_v7, "d"), _S.read(_v7, "L")))), _S.invoke(_S.read(_v7, "Math"), "min", [1, _S.binary("+", 0.5, _S.binary("/", _S.read(_v7, "d"), 3))])))
				_S.define(_v7, "hw", (_S.binary("+", _S.read(_v7, "hw0"), 0.8) if _S.truth(_S.binary("===", _S.read(_v7, "pass"), 0)) else (_S.read(_v7, "hw0") if _S.truth(_S.binary("===", _S.read(_v7, "pass"), 1)) else _S.binary("*", _S.read(_v7, "hw0"), 0.45))))
				_S.define(_v7, "col", (_S.read(_v7, "rim") if _S.truth(_S.binary("===", _S.read(_v7, "pass"), 0)) else ((_S.read(_v7, "inner") if _S.truth(_S.binary("<", _S.read(_v7, "d"), _S.binary("*", _S.read(_v7, "L"), 0.35))) else _S.read(_v7, "body")) if _S.truth(_S.binary("===", _S.read(_v7, "pass"), 1)) else _S.read(_v7, "core"))))
				var _v8 = _S.scope(_v7)
				_S.define(_v8, "o", _S.unary("-", _S.read(_v8, "hw")))
				while _S.truth(_S.binary("<=", _S.read(_v8, "o"), _S.read(_v8, "hw"))):
					_S.invoke(_S.read(_v8, "p"), "dot", [_S.binary("-", _S.binary("+", _S.read(_v8, "x"), _S.binary("*", _S.read(_v8, "c"), _S.read(_v8, "d"))), _S.binary("*", _S.read(_v8, "sn"), _S.read(_v8, "o"))), _S.binary("+", _S.binary("+", _S.read(_v8, "y"), _S.binary("*", _S.read(_v8, "sn"), _S.read(_v8, "d"))), _S.binary("*", _S.read(_v8, "c"), _S.read(_v8, "o"))), _S.read(_v8, "col"), _S.read(_v8, "a")])
					_v8 = _S.iteration(_v8)
					_S.write(_v8, "o", 0.5, "+=", false)
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "d", 0.5, "+=", false)
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "pass", 1, "+=", true)
	_S.define(_e, "r", _S.binary("*", _S.binary("*", _S.read(_e, "heart"), _S.read(_e, "sc")), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "th")])))
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "r"), 0.8), _S.read(_e, "inner"), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.read(_e, "core"), _S.read(_e, "a")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "th", _S.arg(_args, 4))
	_S.define(_e, "segs", _S.arg(_args, 5))
	_S.define(_e, "brk", _S.arg(_args, 6))
	_S.define(_e, "c", _S.arg(_args, 7))
	_S.define(_e, "c2", _S.coalesce(_S.arg(_args, 8), func(): return _S.read(_e, "c")))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 9), func(): return 1))
	_S.define(_e, "sy", _S.coalesce(_S.arg(_args, 10), func(): return 1))
	_S.define(_e, "maxY", _S.coalesce(_S.arg(_args, 11), func(): return INF))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "r"), 0), func(): return _S.binary("<=", _S.read(_e, "k"), 0))):
		return null
	_S.define(_e, "full", _S.binary("/", _S.read(_e, "TAU"), _S.prop(_S.read(_e, "segs"), "length")))
	for _v9 in _S.array(_S.read(_e, "segs")):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "s", _v9)
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "span", _S.binary("+", _S.binary("*", _S.read(_v11, "full"), _S.binary("-", 1, _S.binary("*", _S.prop(_S.read(_v11, "s"), "gap"), _S.read(_v11, "brk")))), 0.02))
		_S.define(_v11, "rr", _S.binary("*", _S.read(_v11, "r"), _S.binary("+", 1, _S.binary("*", _S.prop(_S.read(_v11, "s"), "dr"), _S.read(_v11, "brk")))))
		_S.define(_v11, "m", _S.invoke(_S.read(_v11, "Math"), "max", [4, _S.invoke(_S.read(_v11, "Math"), "ceil", [_S.binary("*", _S.binary("*", _S.read(_v11, "rr"), _S.read(_v11, "span")), 1.8)])]))
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "j", 0)
		while _S.truth(_S.binary("<=", _S.read(_v12, "j"), _S.read(_v12, "m"))):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "u", _S.binary("/", _S.read(_v13, "j"), _S.read(_v13, "m")))
			_S.define(_v13, "ang", _S.binary("+", _S.prop(_S.read(_v13, "s"), "a"), _S.binary("*", _S.binary("-", _S.read(_v13, "u"), 0.5), _S.read(_v13, "span"))))
			_S.define(_v13, "w", _S.invoke(_S.read(_v13, "Math"), "max", [0.5, _S.binary("*", _S.binary("*", _S.read(_v13, "th"), _S.logical("??", _S.prop(_S.read(_v13, "s"), "w"), func(): return 1)), _S.binary("-", 1, _S.binary("*", _S.read(_v13, "brk"), _S.invoke(_S.read(_v13, "Math"), "pow", [_S.invoke(_S.read(_v13, "Math"), "abs", [_S.binary("-", _S.binary("*", 2, _S.read(_v13, "u")), 1)]), 1.6]))))]))
			_S.define(_v13, "ca", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "ang")]))
			_S.define(_v13, "sa", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "ang")]))
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "o", _S.binary("/", _S.unary("-", _S.read(_v14, "w")), 2))
			while _S.truth(_S.binary("<=", _S.read(_v14, "o"), _S.binary("+", _S.binary("/", _S.read(_v14, "w"), 2), 0.01))):
				if _S.truth(_S.binary("<", _S.binary("+", _S.read(_v14, "y"), _S.binary("*", _S.binary("*", _S.read(_v14, "sa"), _S.binary("+", _S.read(_v14, "rr"), _S.read(_v14, "o"))), _S.read(_v14, "sy"))), _S.read(_v14, "maxY"))):
					_S.invoke(_S.read(_v14, "p"), "dot", [_S.binary("+", _S.read(_v14, "x"), _S.binary("*", _S.read(_v14, "ca"), _S.binary("+", _S.read(_v14, "rr"), _S.read(_v14, "o")))), _S.binary("+", _S.read(_v14, "y"), _S.binary("*", _S.binary("*", _S.read(_v14, "sa"), _S.binary("+", _S.read(_v14, "rr"), _S.read(_v14, "o"))), _S.read(_v14, "sy"))), (_S.read(_v14, "c") if _S.truth(_S.binary(">", _S.read(_v14, "o"), _S.unary("-", 0.26))) else _S.read(_v14, "c2")), _S.read(_v14, "k")])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "o", 0.5, "+=", false)
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "j", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "L", _S.arg(_args, 4))
	var _v15 = _S.coalesce(_S.arg(_args, 5), func(): return _S.merge([]))
	_S.define(_e, "jit", _S.coalesce(_S.prop(_v15, "jit"), func(): return 0.55))
	_S.define(_e, "steer", _S.coalesce(_S.prop(_v15, "steer"), func(): return 0.45))
	_S.define(_e, "step", _S.coalesce(_S.prop(_v15, "step"), func(): return [2, 4]))
	_S.define(_e, "maxY", _S.coalesce(_S.prop(_v15, "maxY"), func(): return INF))
	_S.define(_e, "d0", _S.coalesce(_S.prop(_v15, "d0"), func(): return 0))
	_S.define(_e, "pts", [[_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "d0")]])
	_S.define(_e, "d", 0)
	_S.define(_e, "cur", _S.read(_e, "a"))
	while _S.truth(_S.binary("<", _S.read(_e, "d"), _S.binary("-", _S.read(_e, "L"), 0.01))):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "s", _S.invoke(_S.read(_v16, "Math"), "min", [_S.binary("-", _S.read(_v16, "L"), _S.read(_v16, "d")), _S.invoke(_S.read(_v16, "R"), "range", [_S.prop(_S.read(_v16, "step"), 0), _S.prop(_S.read(_v16, "step"), 1)])]))
		_S.write(_v16, "cur", _S.binary("+", _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", _S.read(_v16, "jit")), _S.read(_v16, "jit")]), _S.binary("*", _S.binary("-", _S.read(_v16, "a"), _S.read(_v16, "cur")), _S.read(_v16, "steer"))), "+=", false)
		_S.write(_v16, "x", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "cur")]), _S.read(_v16, "s")), "+=", false)
		_S.write(_v16, "y", _S.call_value(_S.read(_v16, "clamp"), [_S.binary("+", _S.read(_v16, "y"), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "cur")]), _S.read(_v16, "s"))), 0.5, _S.read(_v16, "maxY")]), "=", false)
		_S.write(_v16, "d", _S.read(_v16, "s"), "+=", false)
		_S.invoke(_S.read(_v16, "pts"), "push", [[_S.read(_v16, "x"), _S.read(_v16, "y"), _S.binary("+", _S.read(_v16, "d0"), _S.read(_v16, "d"))]])
	return _S.read(_e, "pts")

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "n", _S.arg(_args, 1))
	var _v17 = _S.coalesce(_S.arg(_args, 2), func(): return _S.merge([]))
	_S.define(_e, "len", _S.coalesce(_S.prop(_v17, "len"), func(): return [14, 40]))
	_S.define(_e, "dive", _S.coalesce(_S.prop(_v17, "dive"), func(): return 0.85))
	_S.define(_e, "maxY", _S.coalesce(_S.prop(_v17, "maxY"), func(): return 22))
	_S.define(_e, "forks", _S.coalesce(_S.prop(_v17, "forks"), func(): return 0.5))
	_S.define(_e, "x0", _S.coalesce(_S.prop(_v17, "x0"), func(): return [1, 5]))
	_S.define(_e, "out", [])
	var _v18 = _S.scope(_e)
	_S.define(_v18, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "i"), _S.read(_v18, "n"))):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "side", (1 if _S.truth(_S.binary("%", _S.read(_v19, "i"), 2)) else _S.unary("-", 1)))
		_S.define(_v19, "dip", _S.binary("+", 0.06, _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "pow", [_S.invoke(_S.read(_v19, "R"), "next", []), 1.7]), _S.read(_v19, "dive"))))
		_S.define(_v19, "L", _S.binary("*", _S.invoke(_S.read(_v19, "R"), "range", [_S.prop(_S.read(_v19, "len"), 0), _S.prop(_S.read(_v19, "len"), 1)]), _S.binary("-", 1, _S.binary("/", _S.binary("*", 0.5, _S.read(_v19, "dip")), _S.binary("+", _S.read(_v19, "dive"), 0.06)))))
		_S.define(_v19, "a", (_S.read(_v19, "dip") if _S.truth(_S.binary(">", _S.read(_v19, "side"), 0)) else _S.binary("-", _S.prop(_S.read(_v19, "Math"), "PI"), _S.read(_v19, "dip"))))
		_S.define(_v19, "pts", _S.call_value(_S.read(_v19, "walk"), [_S.read(_v19, "R"), _S.binary("*", _S.read(_v19, "side"), _S.invoke(_S.read(_v19, "R"), "range", [_S.prop(_S.read(_v19, "x0"), 0), _S.prop(_S.read(_v19, "x0"), 1)])), _S.invoke(_S.read(_v19, "R"), "range", [0.5, 1.5]), _S.read(_v19, "a"), _S.read(_v19, "L"), _S.merge([{"maxY": _S.read(_v19, "maxY")}])]))
		_S.define(_v19, "c", _S.merge([{"pts": _S.read(_v19, "pts")}, {"len": _S.read(_v19, "L")}, {"t0": _S.invoke(_S.read(_v19, "R"), "range", [0, 0.035])}, {"kids": []}]))
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "j", 2)
		while _S.truth(_S.binary("<", _S.read(_v20, "j"), _S.binary("-", _S.prop(_S.read(_v20, "pts"), "length"), 1))):
			if _S.truth(_S.invoke(_S.read(_v20, "R"), "chance", [_S.binary("*", _S.read(_v20, "forks"), 0.4)])):
				var _v21 = _S.scope(_v20)
				var _v22 = _S.prop(_S.read(_v21, "pts"), _S.read(_v21, "j"))
				_S.define(_v21, "fx", _S.prop(_v22, 0))
				_S.define(_v21, "fy", _S.prop(_v22, 1))
				_S.define(_v21, "fd", _S.prop(_v22, 2))
				_S.invoke(_S.prop(_S.read(_v21, "c"), "kids"), "push", [_S.call_value(_S.read(_v21, "walk"), [_S.read(_v21, "R"), _S.read(_v21, "fx"), _S.read(_v21, "fy"), _S.binary("+", _S.read(_v21, "a"), _S.binary("*", _S.invoke(_S.read(_v21, "R"), "sign", []), _S.invoke(_S.read(_v21, "R"), "range", [0.45, 1]))), _S.binary("*", _S.invoke(_S.read(_v21, "R"), "range", [3, 9]), _S.binary("-", 1, _S.binary("/", _S.binary("*", 0.5, _S.read(_v21, "j")), _S.prop(_S.read(_v21, "pts"), "length")))), _S.merge([{"maxY": _S.read(_v21, "maxY")}, {"d0": _S.read(_v21, "fd")}, {"jit": 0.7}, {"step": [1.5, 3]}])])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "j", 1, "+=", true)
		_S.invoke(_S.read(_v19, "out"), "push", [_S.read(_v19, "c")])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "cracks", _S.arg(_args, 1))
	_S.define(_e, "g", _S.arg(_args, 2))
	_S.define(_e, "heat", _S.arg(_args, 3))
	_S.define(_e, "hot", _S.arg(_args, 4))
	_S.define(_e, "dark", _S.arg(_args, 5))
	_S.define(_e, "lip", _S.arg(_args, 6))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0)):
		return null
	_S.define(_e, "col", _S.function_value(_e, "_f8"))
	for _v23 in _S.array(_S.read(_e, "cracks")):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "c", _v23)
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "G", _S.call_value(_S.read(_v25, "g"), [_S.read(_v25, "c")]))
		if _S.truth(_S.binary("<=", _S.read(_v25, "G"), 0)):
			continue
		for _v26 in _S.array(_S.concat([[_S.prop(_S.read(_v25, "c"), "pts")], _S.array(_S.prop(_S.read(_v25, "c"), "kids"))])):
			var _v27 = _S.scope(_v25)
			_S.define(_v27, "path", _v26)
			var _v28 = _S.scope(_v27)
			var _v29 = _S.scope(_v28)
			_S.define(_v29, "i", 1)
			while _S.truth(_S.binary("<", _S.read(_v29, "i"), _S.prop(_S.read(_v29, "path"), "length"))):
				var _v30 = _S.scope(_v29)
				var _v31 = _S.prop(_S.read(_v30, "path"), _S.binary("-", _S.read(_v30, "i"), 1))
				_S.define(_v30, "x0", _S.prop(_v31, 0))
				_S.define(_v30, "y0", _S.prop(_v31, 1))
				_S.define(_v30, "d0", _S.prop(_v31, 2))
				var _v32 = _S.prop(_S.read(_v30, "path"), _S.read(_v30, "i"))
				_S.define(_v30, "x1", _S.prop(_v32, 0))
				_S.define(_v30, "y1", _S.prop(_v32, 1))
				_S.define(_v30, "d1", _S.prop(_v32, 2))
				if _S.truth(_S.binary(">=", _S.read(_v30, "d0"), _S.read(_v30, "G"))):
					break
				_S.define(_v30, "f", (_S.binary("/", _S.binary("-", _S.read(_v30, "G"), _S.read(_v30, "d0")), _S.binary("-", _S.read(_v30, "d1"), _S.read(_v30, "d0"))) if _S.truth(_S.binary(">", _S.read(_v30, "d1"), _S.read(_v30, "G"))) else 1))
				_S.define(_v30, "ex", _S.binary("+", _S.read(_v30, "x0"), _S.binary("*", _S.binary("-", _S.read(_v30, "x1"), _S.read(_v30, "x0")), _S.read(_v30, "f"))))
				_S.define(_v30, "ey", _S.binary("+", _S.read(_v30, "y0"), _S.binary("*", _S.binary("-", _S.read(_v30, "y1"), _S.read(_v30, "y0")), _S.read(_v30, "f"))))
				_S.invoke(_S.read(_v30, "p"), "line", [_S.read(_v30, "x0"), _S.binary("+", _S.read(_v30, "y0"), 1), _S.read(_v30, "ex"), _S.binary("+", _S.read(_v30, "ey"), 1), _S.read(_v30, "lip"), _S.function_value(_v30, "_f9")])
				_S.invoke(_S.read(_v30, "p"), "line", [_S.read(_v30, "x0"), _S.read(_v30, "y0"), _S.read(_v30, "ex"), _S.read(_v30, "ey"), _S.function_value(_v30, "_f10"), _S.read(_v30, "k")])
				_S.define(_v30, "h", _S.call_value(_S.read(_v30, "heat"), [_S.read(_v30, "d0")]))
				if _S.truth(_S.binary(">", _S.read(_v30, "h"), 0.12)):
					_S.invoke(_S.read(_v30, "p"), "glow", [_S.binary("/", _S.binary("+", _S.read(_v30, "x0"), _S.read(_v30, "ex")), 2), _S.binary("/", _S.binary("+", _S.read(_v30, "y0"), _S.read(_v30, "ey")), 2), _S.binary("+", 4, _S.binary("*", _S.read(_v30, "h"), 4)), _S.prop(_S.read(_v30, "hot"), 2), _S.binary("*", _S.binary("*", 0.22, _S.read(_v30, "h")), _S.read(_v30, "k"))])
				_v29 = _S.iteration(_v29)
				_S.write(_v29, "i", 1, "+=", true)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "heat"), [_S.read(_e, "d")]))
	return (_S.prop(_S.read(_e, "hot"), 0) if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.75)) else (_S.prop(_S.read(_e, "hot"), 1) if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.5)) else (_S.prop(_S.read(_e, "hot"), 2) if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.3)) else (_S.prop(_S.read(_e, "hot"), 3) if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.12)) else _S.read(_e, "dark")))))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.binary("*", _S.read(_e, "k"), 0.8) if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.binary("-", _S.read(_e, "ex"), _S.read(_e, "x0")), _S.read(_e, "u")))]), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.binary("-", _S.read(_e, "ey"), _S.read(_e, "y0")), _S.read(_e, "u")))]), 5]), 0.3)) else 0)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "col"), [_S.binary("+", _S.read(_e, "d0"), _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_e, "d1"), _S.read(_e, "d0")), _S.read(_e, "f")), _S.read(_e, "u")))])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "dir", _S.arg(_args, 2))
	_S.define(_e, "h", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "cols", _S.arg(_args, 5))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "h"), 1), func(): return _S.binary("<", _S.read(_e, "w"), 0.3)), func(): return _S.binary("<=", _S.read(_e, "k"), 0))):
		return null
	_S.define(_e, "ry", _S.binary("*", _S.read(_e, "h"), 0.8))
	_S.define(_e, "cy", _S.binary("*", _S.unary("-", _S.read(_e, "h")), 0.2))
	_S.define(_e, "rx", _S.invoke(_S.read(_e, "Math"), "max", [2, _S.binary("*", _S.read(_e, "h"), 0.55)]))
	_S.define(_e, "x0", (_S.binary("-", _S.binary("-", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "rx")), _S.read(_e, "w")), 1) if _S.truth(_S.binary(">", _S.read(_e, "dir"), 0)) else _S.binary("-", _S.read(_e, "x"), 1)))
	_S.define(_e, "x1", (_S.binary("+", _S.read(_e, "x"), 1) if _S.truth(_S.binary(">", _S.read(_e, "dir"), 0)) else _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "rx")), _S.read(_e, "w")), 1)))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.read(_e, "x0"), _S.binary("-", _S.unary("-", _S.read(_e, "h")), 1), _S.read(_e, "x1"), 0, _S.function_value(_e, "_f12")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	if _S.truth(_S.binary(">", _S.read(_e, "py"), 0)):
		return null
	_S.define(_e, "ey", _S.binary("/", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "cy")), _S.read(_e, "ry")))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "ey"), _S.unary("-", 1)), func(): return _S.binary(">=", _S.read(_e, "ey"), 1))):
		return null
	_S.define(_e, "e2", _S.binary("-", 1, _S.binary("*", _S.read(_e, "ey"), _S.read(_e, "ey"))))
	_S.define(_e, "edge", _S.binary("-", _S.binary("*", _S.read(_e, "rx"), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "e2")])), _S.read(_e, "rx")))
	_S.define(_e, "wt", _S.binary("*", _S.read(_e, "w"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "e2"), 0.45])))
	_S.define(_e, "q", _S.binary("/", _S.binary("-", _S.read(_e, "edge"), _S.binary("*", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")), _S.read(_e, "dir"))), _S.invoke(_S.read(_e, "Math"), "max", [0.5, _S.read(_e, "wt")])))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "q"), 0), func(): return _S.binary(">", _S.read(_e, "q"), 1))):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "cols"), 0) if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.28)) else (_S.prop(_S.read(_e, "cols"), 1) if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.62)) else _S.prop(_S.read(_e, "cols"), 2))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.binary("*", _S.binary("*", _S.read(_e, "k"), (0.7 if _S.truth(_S.binary("<", _S.read(_e, "ey"), _S.unary("-", 0.8))) else 1)), (_S.binary("-", 1.25, _S.binary("*", _S.read(_e, "q"), 0.8)) if _S.truth(_S.binary(">", _S.read(_e, "q"), 0.7)) else 1)), "=", false)
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "cx", _S.arg(_args, 1))
	_S.define(_e, "cy", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "k", _S.arg(_args, 5))
	_S.define(_e, "c", _S.arg(_args, 6))
	var _v33 = _S.coalesce(_S.arg(_args, 7), func(): return _S.merge([]))
	_S.define(_e, "sy", _S.coalesce(_S.prop(_v33, "sy"), func(): return 1))
	_S.define(_e, "ph", _S.coalesce(_S.prop(_v33, "ph"), func(): return 0))
	_S.define(_e, "brk", _S.coalesce(_S.prop(_v33, "brk"), func(): return 0))
	_S.define(_e, "lit", _S.coalesce(_S.prop(_v33, "lit"), func(): return 0.35))
	_S.define(_e, "maxY", _S.coalesce(_S.prop(_v33, "maxY"), func(): return INF))
	_S.define(_e, "half", _S.coalesce(_S.prop(_v33, "half"), func(): return 0))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "k"), 0.01), func(): return _S.binary("<=", _S.read(_e, "r"), 0))):
		return null
	_S.define(_e, "W", _S.binary("*", _S.read(_e, "w"), 1.6))
	_S.define(_e, "lite", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.read(_e, "WHITE"), _S.read(_e, "lit")]))
	var _v34 = _S.scope(_e)
	_S.define(_v34, "y", _S.binary("-", _S.invoke(_S.read(_v34, "Math"), "floor", [_S.binary("-", _S.read(_v34, "cy"), _S.binary("*", _S.binary("+", _S.read(_v34, "r"), _S.read(_v34, "W")), _S.read(_v34, "sy")))]), 1))
	while _S.truth(_S.binary("<=", _S.read(_v34, "y"), _S.invoke(_S.read(_v34, "Math"), "min", [_S.binary("-", _S.read(_v34, "maxY"), 1), _S.binary("+", _S.invoke(_S.read(_v34, "Math"), "ceil", [_S.binary("+", _S.read(_v34, "cy"), _S.binary("*", _S.binary("+", _S.read(_v34, "r"), _S.read(_v34, "W")), _S.read(_v34, "sy")))]), 1)]))):
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "x", _S.binary("-", _S.invoke(_S.read(_v35, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_v35, "cx"), _S.read(_v35, "r")), _S.read(_v35, "W"))]), 1))
		while _S.truth(_S.binary("<=", _S.read(_v35, "x"), _S.binary("+", _S.invoke(_S.read(_v35, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.read(_v35, "cx"), _S.read(_v35, "r")), _S.read(_v35, "W"))]), 1))):
			var _v36 = _S.scope(_v35)
			_S.define(_v36, "dx", _S.binary("-", _S.binary("+", _S.read(_v36, "x"), 0.5), _S.read(_v36, "cx")))
			_S.define(_v36, "dy", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v36, "y"), 0.5), _S.read(_v36, "cy")), _S.read(_v36, "sy")))
			_S.define(_v36, "d", _S.invoke(_S.read(_v36, "Math"), "hypot", [_S.read(_v36, "dx"), _S.read(_v36, "dy")]))
			_S.define(_v36, "g", _S.invoke(_S.read(_v36, "Math"), "atan2", [_S.read(_v36, "dy"), _S.read(_v36, "dx")]))
			if _S.truth(_S.logical("||", _S.logical("&&", _S.binary("<", _S.read(_v36, "half"), 0), func(): return _S.binary(">=", _S.read(_v36, "dy"), 0)), func(): return _S.logical("&&", _S.binary(">", _S.read(_v36, "half"), 0), func(): return _S.binary("<", _S.read(_v36, "dy"), 0)))):
				_v35 = _S.iteration(_v35)
				_S.write(_v35, "x", 1, "+=", true)
				continue
			_S.define(_v36, "lumpy", _S.binary("+", _S.binary("+", _S.binary("+", 0.6, _S.binary("*", 0.3, _S.invoke(_S.read(_v36, "Math"), "sin", [_S.binary("+", _S.binary("*", 5, _S.read(_v36, "g")), _S.read(_v36, "ph"))]))), _S.binary("*", 0.18, _S.invoke(_S.read(_v36, "Math"), "sin", [_S.binary("+", _S.binary("*", 11, _S.read(_v36, "g")), _S.binary("*", _S.read(_v36, "ph"), 2.1))]))), _S.binary("*", 0.12, _S.invoke(_S.read(_v36, "Math"), "sin", [_S.binary("+", _S.binary("*", 17, _S.read(_v36, "g")), _S.binary("*", _S.read(_v36, "ph"), 0.7))]))))
			_S.define(_v36, "wt", _S.binary("*", _S.read(_v36, "w"), _S.read(_v36, "lumpy")))
			_S.define(_v36, "off", _S.invoke(_S.read(_v36, "Math"), "abs", [_S.binary("-", _S.binary("-", _S.read(_v36, "d"), _S.read(_v36, "r")), _S.binary("*", _S.binary("*", _S.read(_v36, "w"), 0.25), _S.invoke(_S.read(_v36, "Math"), "sin", [_S.binary("+", _S.binary("*", 7, _S.read(_v36, "g")), _S.read(_v36, "ph"))])))]))
			if _S.truth(_S.binary(">=", _S.read(_v36, "off"), _S.read(_v36, "wt"))):
				_v35 = _S.iteration(_v35)
				_S.write(_v35, "x", 1, "+=", true)
				continue
			_S.define(_v36, "tear", (_S.call_value(_S.read(_v36, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("+", 0.55, _S.binary("*", 0.45, _S.invoke(_S.read(_v36, "Math"), "sin", [_S.binary("+", _S.binary("*", 6, _S.read(_v36, "g")), _S.binary("*", _S.read(_v36, "ph"), 1.7))]))), _S.read(_v36, "brk")), 0.25)]) if _S.truth(_S.binary(">", _S.read(_v36, "brk"), 0)) else 1))
			_S.define(_v36, "a", _S.binary("*", _S.binary("*", _S.read(_v36, "k"), _S.binary("-", 1, _S.invoke(_S.read(_v36, "Math"), "pow", [_S.binary("/", _S.read(_v36, "off"), _S.read(_v36, "wt")), 2]))), _S.read(_v36, "tear")))
			if _S.truth(_S.binary(">", _S.read(_v36, "a"), 0.01)):
				_S.invoke(_S.read(_v36, "p"), "blend", [_S.read(_v36, "x"), _S.read(_v36, "y"), (_S.read(_v36, "lite") if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v36, "dy"), 0), func(): return _S.binary(">", _S.read(_v36, "d"), _S.binary("-", _S.read(_v36, "r"), _S.binary("*", _S.read(_v36, "wt"), 0.3))))) else _S.read(_v36, "c")), _S.read(_v36, "a")])
			_v35 = _S.iteration(_v35)
			_S.write(_v35, "x", 1, "+=", true)
		_v34 = _S.iteration(_v34)
		_S.write(_v34, "y", 1, "+=", true)
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "st", _S.arg(_args, 2))
	_S.define(_e, "r", _S.binary("+", 0.75, _S.binary("*", _S.prop(_S.read(_e, "b"), "s"), 0.8)))
	_S.define(_e, "n", _S.prop(_S.prop(_S.read(_e, "b"), "pts"), "length"))
	_S.define(_e, "fade", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_e, "b"), "life"), 0.5)]))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "b"), "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "b"), "a")]))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "r")), 2), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "r")), 2), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "r")), 2), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "r")), 2), _S.function_value(_e, "_f15")])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "b"), "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "b"), "y")))
	_S.define(_e, "u", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sa"))))
	_S.define(_e, "v", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ca"))))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "u"), _S.read(_e, "v")]))
	_S.define(_e, "ang", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "v"), _S.read(_e, "u")]))
	if _S.truth(_S.binary("<", _S.read(_e, "ang"), 0)):
		_S.write(_e, "ang", _S.read(_e, "TAU"), "+=", false)
	_S.define(_e, "f", _S.binary("*", _S.binary("/", _S.read(_e, "ang"), _S.read(_e, "TAU")), _S.read(_e, "n")))
	_S.define(_e, "i", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "f")]), _S.read(_e, "n")))
	_S.define(_e, "w", _S.binary("-", _S.read(_e, "f"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "f")])))
	_S.define(_e, "edge", _S.binary("*", _S.read(_e, "r"), _S.binary("+", _S.binary("*", _S.prop(_S.prop(_S.read(_e, "b"), "pts"), _S.read(_e, "i")), _S.binary("-", 1, _S.read(_e, "w"))), _S.binary("*", _S.prop(_S.prop(_S.read(_e, "b"), "pts"), _S.binary("%", _S.binary("+", _S.read(_e, "i"), 1), _S.read(_e, "n"))), _S.read(_e, "w")))))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "edge"), 0.85))):
		return null
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "fade"), "=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "edge"))):
		return _S.read(_e, "OUTLINE")
	_S.define(_e, "lit", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("-", _S.binary("+", _S.binary("*", _S.binary("/", _S.binary("+", _S.read(_e, "i"), 0.5), _S.read(_e, "n")), _S.read(_e, "TAU")), _S.prop(_S.read(_e, "b"), "a")), _S.read(_e, "LIGHT"))]))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), _S.binary("*", _S.read(_e, "edge"), 0.42))):
		return (_S.prop(_S.read(_e, "st"), "light") if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.55)) else _S.prop(_S.read(_e, "st"), "body"))
	return (_S.prop(_S.read(_e, "st"), "light") if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.35)) else (_S.prop(_S.read(_e, "st"), "shade") if _S.truth(_S.binary("<", _S.read(_e, "lit"), _S.unary("-", 0.4))) else _S.prop(_S.read(_e, "st"), "body")))

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "n", _S.coalesce(_S.arg(_args, 1), func(): return 6))
	return _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "n")}]), _S.function_value(_e, "_f17")])

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.invoke(_S.read(_e, "R"), "range", [0.7, 1.12])
