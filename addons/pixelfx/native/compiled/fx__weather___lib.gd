@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "box", _S.function_value(_e, "_f0"))
	_S.define(_e, "clip", _S.function_value(_e, "_f1"))
	_S.define(_e, "glow", _S.function_value(_e, "_f8"))
	_S.define(_e, "pass", _S.function_value(_e, "_f9"))
	_S.define(_e, "rows", _S.function_value(_e, "_f10"))
	_S.define(_e, "field", _S.function_value(_e, "_f11"))
	_S.define(_e, "sample", _S.function_value(_e, "_f13"))
	_S.define(_e, "trips", _S.function_value(_e, "_f14"))
	_S.define(_e, "tree", _S.function_value(_e, "_f15"))
	_S.define(_e, "splash", _S.function_value(_e, "_f16"))
	_S.define(_e, "crown", _S.function_value(_e, "_f17"))
	_S.define(_e, "BAYER", _S.invoke([0, 8, 2, 10, 12, 4, 14, 6, 3, 11, 1, 9, 15, 7, 13, 5], "map", [_S.function_value(_e, "_f18")]))
	_exports["box"] = _S.read(_e, "box")
	_exports["clip"] = _S.read(_e, "clip")
	_S.define(_e, "OUT", _S.merge([{"c": 0}, {"a": 1}, {"b": 0}, {"l": 0}, {"k": 0}]))
	_exports["pass"] = _S.read(_e, "pass")
	_S.define(_e, "ROW", _S.merge([{"w": 0}, {"c": null}, {"a": null}, {"b": null}, {"l": null}, {"k": null}]))
	_exports["rows"] = _S.read(_e, "rows")
	_S.define(_e, "bayer", _S.function_value(_e, "_f19"))
	_exports["bayer"] = _S.read(_e, "bayer")
	_S.define(_e, "FIELDS", _S.construct(_S.read(_e, "Map"), []))
	_exports["field"] = _S.read(_e, "field")
	_exports["sample"] = _S.read(_e, "sample")
	_exports["trips"] = _S.read(_e, "trips")
	_exports["tree"] = _S.read(_e, "tree")
	_S.define(_e, "wave", _S.function_value(_e, "_f20"))
	_exports["wave"] = _S.read(_e, "wave")
	_exports["splash"] = _S.read(_e, "splash")
	_exports["crown"] = _S.read(_e, "crown")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "meta", _S.arg(_args, 0))
	var _v0 = _S.prop(_S.read(_e, "meta"), "size")
	_S.define(_e, "W", _S.prop(_v0, 0))
	_S.define(_e, "H", _S.prop(_v0, 1))
	var _v1 = _S.prop(_S.read(_e, "meta"), "origin")
	_S.define(_e, "OX", _S.prop(_v1, 0))
	_S.define(_e, "OY", _S.prop(_v1, 1))
	return _S.merge([{"x0": _S.unary("-", _S.read(_e, "OX"))}, {"y0": _S.unary("-", _S.read(_e, "OY"))}, {"x1": _S.binary("-", _S.read(_e, "W"), _S.read(_e, "OX"))}, {"y1": _S.binary("-", _S.read(_e, "H"), _S.read(_e, "OY"))}, {"w": _S.read(_e, "W")}, {"h": _S.read(_e, "H")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "meta", _S.arg(_args, 1))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "box"), [_S.read(_e, "meta")]))
	_S.define(_e, "q", _S.invoke(_S.read(_e, "Object"), "create", [_S.read(_e, "p")]))
	_S.define(_e, "ok", null)
	if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "p"), "sn"), 0)):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "a", _S.invoke(_S.read(_v2, "p"), "toX", [_S.prop(_S.read(_v2, "B"), "x0"), 0]))
		_S.define(_v2, "b", _S.invoke(_S.read(_v2, "p"), "toX", [_S.prop(_S.read(_v2, "B"), "x1"), 0]))
		_S.define(_v2, "sx0", _S.invoke(_S.read(_v2, "Math"), "round", [_S.invoke(_S.read(_v2, "Math"), "min", [_S.read(_v2, "a"), _S.read(_v2, "b")])]))
		_S.define(_v2, "sx1", _S.invoke(_S.read(_v2, "Math"), "round", [_S.invoke(_S.read(_v2, "Math"), "max", [_S.read(_v2, "a"), _S.read(_v2, "b")])]))
		_S.define(_v2, "sy0", _S.invoke(_S.read(_v2, "Math"), "round", [_S.invoke(_S.read(_v2, "p"), "toY", [0, _S.prop(_S.read(_v2, "B"), "y0")])]))
		_S.define(_v2, "sy1", _S.invoke(_S.read(_v2, "Math"), "round", [_S.invoke(_S.read(_v2, "p"), "toY", [0, _S.prop(_S.read(_v2, "B"), "y1")])]))
		_S.write(_v2, "ok", _S.function_value(_v2, "_f2"), "=", false)
	else:
		_S.write(_e, "ok", _S.function_value(_e, "_f3"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "put", _S.function_value(_e, "_f4"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "add", _S.function_value(_e, "_f5"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "blendPx", _S.function_value(_e, "_f6"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "glow", _S.function_value(_e, "_f7"), "=", false)
	return _S.read(_e, "q")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "sx"), _S.read(_e, "sx0")), func(): return _S.binary("<", _S.read(_e, "sx"), _S.read(_e, "sx1"))), func(): return _S.binary(">=", _S.read(_e, "sy"), _S.read(_e, "sy0"))), func(): return _S.binary("<", _S.read(_e, "sy"), _S.read(_e, "sy1")))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	_S.define(_e, "lx", _S.invoke(_S.read(_e, "p"), "fromX", [_S.binary("+", _S.read(_e, "sx"), 0.5), _S.binary("+", _S.read(_e, "sy"), 0.5)]))
	_S.define(_e, "ly", _S.invoke(_S.read(_e, "p"), "fromY", [_S.binary("+", _S.read(_e, "sx"), 0.5), _S.binary("+", _S.read(_e, "sy"), 0.5)]))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "lx"), _S.prop(_S.read(_e, "B"), "x0")), func(): return _S.binary("<", _S.read(_e, "lx"), _S.prop(_S.read(_e, "B"), "x1"))), func(): return _S.binary(">=", _S.read(_e, "ly"), _S.prop(_S.read(_e, "B"), "y0"))), func(): return _S.binary("<", _S.read(_e, "ly"), _S.prop(_S.read(_e, "B"), "y1")))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	return _S.logical("&&", _S.call_value(_S.read(_e, "ok"), [_S.read(_e, "sx"), _S.read(_e, "sy")]), func(): return _S.invoke(_S.read(_e, "p"), "put", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "c"), _S.read(_e, "a")]))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	return _S.logical("&&", _S.call_value(_S.read(_e, "ok"), [_S.read(_e, "sx"), _S.read(_e, "sy")]), func(): return _S.invoke(_S.read(_e, "p"), "add", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "c"), _S.read(_e, "k")]))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	return _S.logical("&&", _S.call_value(_S.read(_e, "ok"), [_S.read(_e, "sx"), _S.read(_e, "sy")]), func(): return _S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "c"), _S.read(_e, "a")]))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "c", _S.arg(_args, 3))
	_S.define(_e, "k", _S.arg(_args, 4))
	return _S.call_value(_S.read(_e, "glow"), [_S.read(_e, "q"), _S.read(_e, "B"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.read(_e, "c"), _S.read(_e, "k")])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "B", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "r", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "k", _S.arg(_args, 6))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "r"), 1), func(): return _S.binary("<=", _S.read(_e, "k"), 0.004))):
		return null
	_S.define(_e, "x0", _S.invoke(_S.read(_e, "Math"), "max", [_S.prop(_S.read(_e, "B"), "x0"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "r"))])]))
	_S.define(_e, "x1", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_e, "B"), "x1"), 1), _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.read(_e, "x"), _S.read(_e, "r"))])]))
	_S.define(_e, "y0", _S.invoke(_S.read(_e, "Math"), "max", [_S.prop(_S.read(_e, "B"), "y0"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "y"), _S.read(_e, "r"))])]))
	_S.define(_e, "y1", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_e, "B"), "y1"), 1), _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.read(_e, "y"), _S.read(_e, "r"))])]))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "py", _S.read(_v3, "y0"))
	while _S.truth(_S.binary("<=", _S.read(_v3, "py"), _S.read(_v3, "y1"))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "dy", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v4, "py"), 0.5), _S.read(_v4, "y")), _S.read(_v4, "r")))
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "px", _S.read(_v5, "x0"))
		while _S.truth(_S.binary("<=", _S.read(_v5, "px"), _S.read(_v5, "x1"))):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "dx", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v6, "px"), 0.5), _S.read(_v6, "x")), _S.read(_v6, "r")))
			_S.define(_v6, "d", _S.binary("+", _S.binary("*", _S.read(_v6, "dx"), _S.read(_v6, "dx")), _S.binary("*", _S.read(_v6, "dy"), _S.read(_v6, "dy"))))
			if _S.truth(_S.binary(">=", _S.read(_v6, "d"), 1)):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "px", 1, "+=", true)
				continue
			_S.define(_v6, "f", _S.binary("-", 1, _S.invoke(_S.read(_v6, "Math"), "sqrt", [_S.read(_v6, "d")])))
			_S.invoke(_S.read(_v6, "q"), "light", [_S.read(_v6, "px"), _S.read(_v6, "py"), _S.read(_v6, "c"), _S.binary("*", _S.binary("*", _S.read(_v6, "f"), _S.read(_v6, "f")), _S.read(_v6, "k"))])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "px", 1, "+=", true)
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "py", 1, "+=", true)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "meta", _S.arg(_args, 1))
	_S.define(_e, "y0", _S.arg(_args, 2))
	_S.define(_e, "y1", _S.arg(_args, 3))
	_S.define(_e, "fn", _S.arg(_args, 4))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "box"), [_S.read(_e, "meta")]))
	_S.define(_e, "o", _S.read(_e, "OUT"))
	_S.write(_e, "y0", _S.invoke(_S.read(_e, "Math"), "max", [_S.prop(_S.read(_e, "B"), "y0"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y0")])]), "=", false)
	_S.write(_e, "y1", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_e, "B"), "y1"), 1), _S.invoke(_S.read(_e, "Math"), "ceil", [_S.read(_e, "y1")])]), "=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "y0"), _S.read(_e, "y1"))):
		return null
	if _S.truth(_S.binary("!==", _S.prop(_S.read(_e, "p"), "sn"), 0)):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "q", _S.call_value(_S.read(_v7, "clip"), [_S.read(_v7, "p"), _S.read(_v7, "meta")]))
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "y", _S.read(_v8, "y0"))
		while _S.truth(_S.binary("<=", _S.read(_v8, "y"), _S.read(_v8, "y1"))):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "x", _S.prop(_S.read(_v9, "B"), "x0"))
			while _S.truth(_S.binary("<", _S.read(_v9, "x"), _S.prop(_S.read(_v9, "B"), "x1"))):
				var _v10 = _S.scope(_v9)
				_S.set_prop(_S.read(_v10, "o"), "c", 0, "=", false)
				_S.set_prop(_S.read(_v10, "o"), "a", 1, "=", false)
				_S.set_prop(_S.read(_v10, "o"), "b", 0, "=", false)
				_S.set_prop(_S.read(_v10, "o"), "l", 0, "=", false)
				_S.set_prop(_S.read(_v10, "o"), "k", 0, "=", false)
				_S.call_value(_S.read(_v10, "fn"), [_S.binary("+", _S.read(_v10, "x"), 0.5), _S.binary("+", _S.read(_v10, "y"), 0.5), _S.read(_v10, "o")])
				if _S.truth(_S.prop(_S.read(_v10, "o"), "c")):
					(_S.invoke(_S.read(_v10, "q"), "blend", [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.prop(_S.read(_v10, "o"), "c"), _S.prop(_S.read(_v10, "o"), "a")]) if _S.truth(_S.prop(_S.read(_v10, "o"), "b")) else _S.invoke(_S.read(_v10, "q"), "dot", [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.prop(_S.read(_v10, "o"), "c"), _S.prop(_S.read(_v10, "o"), "a")]))
				if _S.truth(_S.binary(">", _S.prop(_S.read(_v10, "o"), "k"), 0)):
					_S.invoke(_S.read(_v10, "q"), "light", [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.logical("||", _S.prop(_S.read(_v10, "o"), "l"), func(): return _S.prop(_S.read(_v10, "o"), "c")), _S.prop(_S.read(_v10, "o"), "k")])
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "x", 1, "+=", true)
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "y", 1, "+=", true)
		return null
	_S.define(_e, "C", _S.prop(_S.read(_e, "p"), "C"))
	_S.define(_e, "L", _S.prop(_S.read(_e, "p"), "L"))
	_S.define(_e, "W", _S.prop(_S.read(_e, "p"), "w"))
	_S.define(_e, "fade", _S.prop(_S.read(_e, "p"), "fade"))
	_S.define(_e, "lk", _S.binary("*", _S.prop(_S.read(_e, "p"), "lightK"), _S.read(_e, "fade")))
	_S.define(_e, "fx", _S.prop(_S.read(_e, "p"), "fx"))
	_S.define(_e, "tx", _S.prop(_S.read(_e, "p"), "tx"))
	var _v11 = _S.scope(_e)
	_S.define(_v11, "y", _S.read(_v11, "y0"))
	while _S.truth(_S.binary("<=", _S.read(_v11, "y"), _S.read(_v11, "y1"))):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "sy", _S.invoke(_S.read(_v12, "Math"), "floor", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v12, "p"), "ty"), _S.read(_v12, "y")), 0.5)]))
		_S.define(_v12, "ry", _S.binary("-", _S.read(_v12, "sy"), _S.prop(_S.read(_v12, "p"), "oy")))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v12, "ry"), 0), func(): return _S.binary(">=", _S.read(_v12, "ry"), _S.prop(_S.read(_v12, "p"), "h")))):
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "y", 1, "+=", true)
			continue
		_S.define(_v12, "row", _S.binary("*", _S.read(_v12, "ry"), _S.read(_v12, "W")))
		_S.define(_v12, "by", _S.binary("<<", _S.binary("&", _S.read(_v12, "sy"), 3), 2))
		_S.define(_v12, "sxf", _S.binary("+", _S.read(_v12, "tx"), _S.binary("*", _S.binary("+", _S.prop(_S.read(_v12, "B"), "x0"), 0.5), _S.read(_v12, "fx"))))
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "x", _S.prop(_S.read(_v13, "B"), "x0"))
		while _S.truth(_S.binary("<", _S.read(_v13, "x"), _S.prop(_S.read(_v13, "B"), "x1"))):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "sx", _S.invoke(_S.read(_v14, "Math"), "floor", [_S.read(_v14, "sxf")]))
			_S.define(_v14, "rx", _S.binary("-", _S.read(_v14, "sx"), _S.prop(_S.read(_v14, "p"), "ox")))
			if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v14, "rx"), 0), func(): return _S.binary(">=", _S.read(_v14, "rx"), _S.read(_v14, "W")))):
				_v13 = _S.iteration(_v13)
				_S.last([_S.write(_v13, "x", 1, "+=", true), _S.write(_v13, "sxf", _S.read(_v13, "fx"), "+=", false)])
				continue
			_S.set_prop(_S.read(_v14, "o"), "c", 0, "=", false)
			_S.set_prop(_S.read(_v14, "o"), "a", 1, "=", false)
			_S.set_prop(_S.read(_v14, "o"), "b", 0, "=", false)
			_S.set_prop(_S.read(_v14, "o"), "l", 0, "=", false)
			_S.set_prop(_S.read(_v14, "o"), "k", 0, "=", false)
			_S.call_value(_S.read(_v14, "fn"), [_S.binary("+", _S.read(_v14, "x"), 0.5), _S.binary("+", _S.read(_v14, "y"), 0.5), _S.read(_v14, "o")])
			_S.define(_v14, "i", _S.binary("+", _S.read(_v14, "row"), _S.read(_v14, "rx")))
			if _S.truth(_S.prop(_S.read(_v14, "o"), "c")):
				var _v15 = _S.scope(_v14)
				_S.define(_v15, "a", _S.binary("*", _S.prop(_S.read(_v15, "o"), "a"), _S.read(_v15, "fade")))
				if _S.truth(_S.prop(_S.read(_v15, "o"), "b")):
					var _v16 = _S.scope(_v15)
					if _S.truth(_S.binary(">", _S.read(_v16, "a"), 0.004)):
						var _v17 = _S.scope(_v16)
						_S.define(_v17, "d", _S.prop(_S.read(_v17, "C"), _S.read(_v17, "i")))
						_S.define(_v17, "da", _S.binary("/", _S.binary(">>>", _S.read(_v17, "d"), 24), 255))
						_S.define(_v17, "oa", _S.binary("+", _S.read(_v17, "a"), _S.binary("*", _S.read(_v17, "da"), _S.binary("-", 1, _S.read(_v17, "a")))))
						_S.define(_v17, "k", _S.binary("/", _S.read(_v17, "a"), _S.read(_v17, "oa")))
						_S.define(_v17, "j", _S.binary("-", 1, _S.read(_v17, "k")))
						_S.define(_v17, "c", _S.prop(_S.read(_v17, "o"), "c"))
						_S.define(_v17, "r", _S.binary("&", _S.binary("+", _S.binary("*", _S.binary("&", _S.read(_v17, "c"), 255), _S.read(_v17, "k")), _S.binary("*", _S.binary("&", _S.read(_v17, "d"), 255), _S.read(_v17, "j"))), 255))
						_S.define(_v17, "g", _S.binary("&", _S.binary("+", _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v17, "c"), 8), 255), _S.read(_v17, "k")), _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v17, "d"), 8), 255), _S.read(_v17, "j"))), 255))
						_S.define(_v17, "b", _S.binary("&", _S.binary("+", _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v17, "c"), 16), 255), _S.read(_v17, "k")), _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v17, "d"), 16), 255), _S.read(_v17, "j"))), 255))
						_S.set_prop(_S.read(_v17, "C"), _S.read(_v17, "i"), _S.binary("|", _S.binary("|", _S.binary("|", _S.binary("<<", _S.binary("&", _S.binary("*", _S.read(_v17, "oa"), 255), 255), 24), _S.binary("<<", _S.read(_v17, "b"), 16)), _S.binary("<<", _S.read(_v17, "g"), 8)), _S.read(_v17, "r")), "=", false)
				else:
					if _S.truth(_S.logical("||", _S.binary(">=", _S.read(_v15, "a"), 1), func(): return _S.binary(">", _S.read(_v15, "a"), _S.prop(_S.read(_v15, "BAYER"), _S.binary("|", _S.read(_v15, "by"), _S.binary("&", _S.read(_v15, "sx"), 3)))))):
						_S.set_prop(_S.read(_v15, "C"), _S.read(_v15, "i"), _S.prop(_S.read(_v15, "o"), "c"), "=", false)
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v14, "o"), "k"), 0)):
				var _v18 = _S.scope(_v14)
				_S.define(_v18, "k", _S.binary("*", _S.prop(_S.read(_v18, "o"), "k"), _S.read(_v18, "lk")))
				if _S.truth(_S.binary(">", _S.read(_v18, "k"), 0.004)):
					var _v19 = _S.scope(_v18)
					_S.define(_v19, "c", _S.logical("||", _S.prop(_S.read(_v19, "o"), "l"), func(): return _S.prop(_S.read(_v19, "o"), "c")))
					_S.define(_v19, "d", _S.prop(_S.read(_v19, "L"), _S.read(_v19, "i")))
					_S.define(_v19, "r", _S.binary("|", _S.invoke(_S.read(_v19, "Math"), "min", [255, _S.binary("+", _S.binary("&", _S.read(_v19, "d"), 255), _S.binary("*", _S.binary("&", _S.read(_v19, "c"), 255), _S.read(_v19, "k")))]), 0))
					_S.define(_v19, "g", _S.binary("|", _S.invoke(_S.read(_v19, "Math"), "min", [255, _S.binary("+", _S.binary("&", _S.binary(">>>", _S.read(_v19, "d"), 8), 255), _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v19, "c"), 8), 255), _S.read(_v19, "k")))]), 0))
					_S.define(_v19, "b", _S.binary("|", _S.invoke(_S.read(_v19, "Math"), "min", [255, _S.binary("+", _S.binary("&", _S.binary(">>>", _S.read(_v19, "d"), 16), 255), _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v19, "c"), 16), 255), _S.read(_v19, "k")))]), 0))
					_S.set_prop(_S.read(_v19, "L"), _S.read(_v19, "i"), _S.binary("|", _S.binary("|", _S.binary("|", _S.binary("<<", 255, 24), _S.binary("<<", _S.read(_v19, "b"), 16)), _S.binary("<<", _S.read(_v19, "g"), 8)), _S.read(_v19, "r")), "=", false)
			_v13 = _S.iteration(_v13)
			_S.last([_S.write(_v13, "x", 1, "+=", true), _S.write(_v13, "sxf", _S.read(_v13, "fx"), "+=", false)])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "y", 1, "+=", true)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "meta", _S.arg(_args, 1))
	_S.define(_e, "y0", _S.arg(_args, 2))
	_S.define(_e, "y1", _S.arg(_args, 3))
	_S.define(_e, "fn", _S.arg(_args, 4))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "box"), [_S.read(_e, "meta")]))
	_S.define(_e, "w", _S.prop(_S.read(_e, "B"), "w"))
	_S.define(_e, "R", _S.read(_e, "ROW"))
	if _S.truth(_S.binary("!==", _S.prop(_S.read(_e, "R"), "w"), _S.read(_e, "w"))):
		_S.invoke(_S.read(_e, "Object"), "assign", [_S.read(_e, "R"), _S.merge([{"w": _S.read(_e, "w")}, {"c": _S.construct(_S.read(_e, "Uint32Array"), [_S.read(_e, "w")])}, {"a": _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "w")])}, {"b": _S.construct(_S.read(_e, "Uint8Array"), [_S.read(_e, "w")])}, {"l": _S.construct(_S.read(_e, "Uint32Array"), [_S.read(_e, "w")])}, {"k": _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "w")])}])])
	_S.write(_e, "y0", _S.invoke(_S.read(_e, "Math"), "max", [_S.prop(_S.read(_e, "B"), "y0"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y0")])]), "=", false)
	_S.write(_e, "y1", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_e, "B"), "y1"), 1), _S.invoke(_S.read(_e, "Math"), "ceil", [_S.read(_e, "y1")])]), "=", false)
	_S.define(_e, "rot", _S.binary("!==", _S.prop(_S.read(_e, "p"), "sn"), 0))
	_S.define(_e, "q", (_S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]) if _S.truth(_S.read(_e, "rot")) else null))
	_S.define(_e, "C", _S.prop(_S.read(_e, "p"), "C"))
	_S.define(_e, "L", _S.prop(_S.read(_e, "p"), "L"))
	_S.define(_e, "W", _S.prop(_S.read(_e, "p"), "w"))
	_S.define(_e, "fade", _S.prop(_S.read(_e, "p"), "fade"))
	_S.define(_e, "lk", _S.binary("*", _S.prop(_S.read(_e, "p"), "lightK"), _S.read(_e, "fade")))
	_S.define(_e, "fx", _S.prop(_S.read(_e, "p"), "fx"))
	var _v20 = _S.scope(_e)
	_S.define(_v20, "y", _S.read(_v20, "y0"))
	while _S.truth(_S.binary("<=", _S.read(_v20, "y"), _S.read(_v20, "y1"))):
		var _v21 = _S.scope(_v20)
		_S.invoke(_S.prop(_S.read(_v21, "R"), "c"), "fill", [0])
		_S.invoke(_S.prop(_S.read(_v21, "R"), "k"), "fill", [0])
		_S.invoke(_S.prop(_S.read(_v21, "R"), "a"), "fill", [1])
		_S.invoke(_S.prop(_S.read(_v21, "R"), "b"), "fill", [0])
		_S.call_value(_S.read(_v21, "fn"), [_S.binary("+", _S.read(_v21, "y"), 0.5), _S.read(_v21, "R")])
		if _S.truth(_S.read(_v21, "rot")):
			var _v22 = _S.scope(_v21)
			var _v23 = _S.scope(_v22)
			_S.define(_v23, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v23, "i"), _S.read(_v23, "w"))):
				var _v24 = _S.scope(_v23)
				if _S.truth(_S.prop(_S.prop(_S.read(_v24, "R"), "c"), _S.read(_v24, "i"))):
					(_S.invoke(_S.read(_v24, "q"), "blend", [_S.binary("+", _S.prop(_S.read(_v24, "B"), "x0"), _S.read(_v24, "i")), _S.read(_v24, "y"), _S.prop(_S.prop(_S.read(_v24, "R"), "c"), _S.read(_v24, "i")), _S.prop(_S.prop(_S.read(_v24, "R"), "a"), _S.read(_v24, "i"))]) if _S.truth(_S.prop(_S.prop(_S.read(_v24, "R"), "b"), _S.read(_v24, "i"))) else _S.invoke(_S.read(_v24, "q"), "dot", [_S.binary("+", _S.prop(_S.read(_v24, "B"), "x0"), _S.read(_v24, "i")), _S.read(_v24, "y"), _S.prop(_S.prop(_S.read(_v24, "R"), "c"), _S.read(_v24, "i")), _S.prop(_S.prop(_S.read(_v24, "R"), "a"), _S.read(_v24, "i"))]))
				if _S.truth(_S.binary(">", _S.prop(_S.prop(_S.read(_v24, "R"), "k"), _S.read(_v24, "i")), 0)):
					_S.invoke(_S.read(_v24, "q"), "light", [_S.binary("+", _S.prop(_S.read(_v24, "B"), "x0"), _S.read(_v24, "i")), _S.read(_v24, "y"), _S.logical("||", _S.prop(_S.prop(_S.read(_v24, "R"), "l"), _S.read(_v24, "i")), func(): return _S.prop(_S.prop(_S.read(_v24, "R"), "c"), _S.read(_v24, "i"))), _S.prop(_S.prop(_S.read(_v24, "R"), "k"), _S.read(_v24, "i"))])
				_v23 = _S.iteration(_v23)
				_S.write(_v23, "i", 1, "+=", true)
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "y", 1, "+=", true)
			continue
		_S.define(_v21, "sy", _S.invoke(_S.read(_v21, "Math"), "floor", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v21, "p"), "ty"), _S.read(_v21, "y")), 0.5)]))
		_S.define(_v21, "ry", _S.binary("-", _S.read(_v21, "sy"), _S.prop(_S.read(_v21, "p"), "oy")))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v21, "ry"), 0), func(): return _S.binary(">=", _S.read(_v21, "ry"), _S.prop(_S.read(_v21, "p"), "h")))):
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "y", 1, "+=", true)
			continue
		_S.define(_v21, "row", _S.binary("*", _S.read(_v21, "ry"), _S.read(_v21, "W")))
		_S.define(_v21, "by", _S.binary("<<", _S.binary("&", _S.read(_v21, "sy"), 3), 2))
		_S.define(_v21, "sxf", _S.binary("+", _S.prop(_S.read(_v21, "p"), "tx"), _S.binary("*", _S.binary("+", _S.prop(_S.read(_v21, "B"), "x0"), 0.5), _S.read(_v21, "fx"))))
		var _v25 = _S.scope(_v21)
		_S.define(_v25, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v25, "i"), _S.read(_v25, "w"))):
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "c", _S.prop(_S.prop(_S.read(_v26, "R"), "c"), _S.read(_v26, "i")))
			_S.define(_v26, "kk", _S.prop(_S.prop(_S.read(_v26, "R"), "k"), _S.read(_v26, "i")))
			if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v26, "c")), func(): return _S.unary("!", _S.binary(">", _S.read(_v26, "kk"), 0)))):
				_v25 = _S.iteration(_v25)
				_S.last([_S.write(_v25, "i", 1, "+=", true), _S.write(_v25, "sxf", _S.read(_v25, "fx"), "+=", false)])
				continue
			_S.define(_v26, "sx", _S.invoke(_S.read(_v26, "Math"), "floor", [_S.read(_v26, "sxf")]))
			_S.define(_v26, "rx", _S.binary("-", _S.read(_v26, "sx"), _S.prop(_S.read(_v26, "p"), "ox")))
			if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v26, "rx"), 0), func(): return _S.binary(">=", _S.read(_v26, "rx"), _S.read(_v26, "W")))):
				_v25 = _S.iteration(_v25)
				_S.last([_S.write(_v25, "i", 1, "+=", true), _S.write(_v25, "sxf", _S.read(_v25, "fx"), "+=", false)])
				continue
			_S.define(_v26, "j", _S.binary("+", _S.read(_v26, "row"), _S.read(_v26, "rx")))
			if _S.truth(_S.read(_v26, "c")):
				var _v27 = _S.scope(_v26)
				_S.define(_v27, "a", _S.binary("*", _S.prop(_S.prop(_S.read(_v27, "R"), "a"), _S.read(_v27, "i")), _S.read(_v27, "fade")))
				if _S.truth(_S.prop(_S.prop(_S.read(_v27, "R"), "b"), _S.read(_v27, "i"))):
					var _v28 = _S.scope(_v27)
					if _S.truth(_S.binary(">", _S.read(_v28, "a"), 0.004)):
						var _v29 = _S.scope(_v28)
						_S.define(_v29, "d", _S.prop(_S.read(_v29, "C"), _S.read(_v29, "j")))
						_S.define(_v29, "da", _S.binary("/", _S.binary(">>>", _S.read(_v29, "d"), 24), 255))
						_S.define(_v29, "oa", _S.binary("+", _S.read(_v29, "a"), _S.binary("*", _S.read(_v29, "da"), _S.binary("-", 1, _S.read(_v29, "a")))))
						_S.define(_v29, "k", _S.binary("/", _S.read(_v29, "a"), _S.read(_v29, "oa")))
						_S.define(_v29, "m", _S.binary("-", 1, _S.read(_v29, "k")))
						_S.define(_v29, "r", _S.binary("&", _S.binary("+", _S.binary("*", _S.binary("&", _S.read(_v29, "c"), 255), _S.read(_v29, "k")), _S.binary("*", _S.binary("&", _S.read(_v29, "d"), 255), _S.read(_v29, "m"))), 255))
						_S.define(_v29, "g", _S.binary("&", _S.binary("+", _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v29, "c"), 8), 255), _S.read(_v29, "k")), _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v29, "d"), 8), 255), _S.read(_v29, "m"))), 255))
						_S.define(_v29, "b", _S.binary("&", _S.binary("+", _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v29, "c"), 16), 255), _S.read(_v29, "k")), _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v29, "d"), 16), 255), _S.read(_v29, "m"))), 255))
						_S.set_prop(_S.read(_v29, "C"), _S.read(_v29, "j"), _S.binary("|", _S.binary("|", _S.binary("|", _S.binary("<<", _S.binary("&", _S.binary("*", _S.read(_v29, "oa"), 255), 255), 24), _S.binary("<<", _S.read(_v29, "b"), 16)), _S.binary("<<", _S.read(_v29, "g"), 8)), _S.read(_v29, "r")), "=", false)
				else:
					if _S.truth(_S.logical("||", _S.binary(">=", _S.read(_v27, "a"), 1), func(): return _S.binary(">", _S.read(_v27, "a"), _S.prop(_S.read(_v27, "BAYER"), _S.binary("|", _S.read(_v27, "by"), _S.binary("&", _S.read(_v27, "sx"), 3)))))):
						_S.set_prop(_S.read(_v27, "C"), _S.read(_v27, "j"), _S.read(_v27, "c"), "=", false)
			if _S.truth(_S.binary(">", _S.read(_v26, "kk"), 0)):
				var _v30 = _S.scope(_v26)
				_S.define(_v30, "k", _S.binary("*", _S.read(_v30, "kk"), _S.read(_v30, "lk")))
				if _S.truth(_S.binary(">", _S.read(_v30, "k"), 0.004)):
					var _v31 = _S.scope(_v30)
					_S.define(_v31, "lc", _S.logical("||", _S.prop(_S.prop(_S.read(_v31, "R"), "l"), _S.read(_v31, "i")), func(): return _S.read(_v31, "c")))
					_S.define(_v31, "d", _S.prop(_S.read(_v31, "L"), _S.read(_v31, "j")))
					_S.define(_v31, "r", _S.binary("|", _S.invoke(_S.read(_v31, "Math"), "min", [255, _S.binary("+", _S.binary("&", _S.read(_v31, "d"), 255), _S.binary("*", _S.binary("&", _S.read(_v31, "lc"), 255), _S.read(_v31, "k")))]), 0))
					_S.define(_v31, "g", _S.binary("|", _S.invoke(_S.read(_v31, "Math"), "min", [255, _S.binary("+", _S.binary("&", _S.binary(">>>", _S.read(_v31, "d"), 8), 255), _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v31, "lc"), 8), 255), _S.read(_v31, "k")))]), 0))
					_S.define(_v31, "b", _S.binary("|", _S.invoke(_S.read(_v31, "Math"), "min", [255, _S.binary("+", _S.binary("&", _S.binary(">>>", _S.read(_v31, "d"), 16), 255), _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v31, "lc"), 16), 255), _S.read(_v31, "k")))]), 0))
					_S.set_prop(_S.read(_v31, "L"), _S.read(_v31, "j"), _S.binary("|", _S.binary("|", _S.binary("|", _S.binary("<<", 255, 24), _S.binary("<<", _S.read(_v31, "b"), 16)), _S.binary("<<", _S.read(_v31, "g"), 8)), _S.read(_v31, "r")), "=", false)
			_v25 = _S.iteration(_v25)
			_S.last([_S.write(_v25, "i", 1, "+=", true), _S.write(_v25, "sxf", _S.read(_v25, "fx"), "+=", false)])
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "y", 1, "+=", true)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "seed", _S.arg(_args, 0))
	_S.define(_e, "w", _S.coalesce(_S.arg(_args, 1), func(): return 256))
	_S.define(_e, "h", _S.coalesce(_S.arg(_args, 2), func(): return 128))
	_S.define(_e, "cells", _S.coalesce(_S.arg(_args, 3), func(): return [4, 8, 16, 32]))
	_S.define(_e, "key", ("" + _S.string(_S.read(_e, "seed")) + "|" + _S.string(_S.read(_e, "w")) + "|" + _S.string(_S.read(_e, "h")) + "|" + _S.string(_S.read(_e, "cells")) + ""))
	_S.define(_e, "F", _S.invoke(_S.read(_e, "FIELDS"), "get", [_S.read(_e, "key")]))
	if _S.truth(_S.read(_e, "F")):
		return _S.read(_e, "F")
	_S.define(_e, "d", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "h"))]))
	_S.define(_e, "amp", 0.5)
	_S.define(_e, "total", 0)
	for _v32 in _S.array(_S.read(_e, "cells")):
		var _v33 = _S.scope(_e)
		_S.define(_v33, "n", _v32)
		var _v34 = _S.scope(_v33)
		_S.define(_v34, "cs", _S.binary("/", _S.read(_v34, "w"), _S.read(_v34, "n")))
		_S.define(_v34, "rows", _S.invoke(_S.read(_v34, "Math"), "max", [1, _S.invoke(_S.read(_v34, "Math"), "round", [_S.binary("/", _S.read(_v34, "h"), _S.read(_v34, "cs"))])]))
		_S.define(_v34, "at", _S.function_value(_v34, "_f12"))
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "y", 0)
		while _S.truth(_S.binary("<", _S.read(_v35, "y"), _S.read(_v35, "h"))):
			var _v36 = _S.scope(_v35)
			_S.define(_v36, "x", 0)
			while _S.truth(_S.binary("<", _S.read(_v36, "x"), _S.read(_v36, "w"))):
				var _v37 = _S.scope(_v36)
				_S.define(_v37, "gx", _S.binary("/", _S.read(_v37, "x"), _S.read(_v37, "cs")))
				_S.define(_v37, "gy", _S.binary("*", _S.binary("/", _S.read(_v37, "y"), _S.read(_v37, "h")), _S.read(_v37, "rows")))
				_S.define(_v37, "ix", _S.invoke(_S.read(_v37, "Math"), "floor", [_S.read(_v37, "gx")]))
				_S.define(_v37, "iy", _S.invoke(_S.read(_v37, "Math"), "floor", [_S.read(_v37, "gy")]))
				_S.define(_v37, "u", _S.binary("-", _S.read(_v37, "gx"), _S.read(_v37, "ix")))
				_S.define(_v37, "v", _S.binary("-", _S.read(_v37, "gy"), _S.read(_v37, "iy")))
				_S.define(_v37, "su", _S.binary("*", _S.binary("*", _S.read(_v37, "u"), _S.read(_v37, "u")), _S.binary("-", 3, _S.binary("*", 2, _S.read(_v37, "u")))))
				_S.define(_v37, "sv", _S.binary("*", _S.binary("*", _S.read(_v37, "v"), _S.read(_v37, "v")), _S.binary("-", 3, _S.binary("*", 2, _S.read(_v37, "v")))))
				_S.define(_v37, "top", _S.binary("+", _S.call_value(_S.read(_v37, "at"), [_S.read(_v37, "ix"), _S.read(_v37, "iy")]), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v37, "at"), [_S.binary("+", _S.read(_v37, "ix"), 1), _S.read(_v37, "iy")]), _S.call_value(_S.read(_v37, "at"), [_S.read(_v37, "ix"), _S.read(_v37, "iy")])), _S.read(_v37, "su"))))
				_S.define(_v37, "bot", _S.binary("+", _S.call_value(_S.read(_v37, "at"), [_S.read(_v37, "ix"), _S.binary("+", _S.read(_v37, "iy"), 1)]), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v37, "at"), [_S.binary("+", _S.read(_v37, "ix"), 1), _S.binary("+", _S.read(_v37, "iy"), 1)]), _S.call_value(_S.read(_v37, "at"), [_S.read(_v37, "ix"), _S.binary("+", _S.read(_v37, "iy"), 1)])), _S.read(_v37, "su"))))
				_S.set_prop(_S.read(_v37, "d"), _S.binary("+", _S.binary("*", _S.read(_v37, "y"), _S.read(_v37, "w")), _S.read(_v37, "x")), _S.binary("*", _S.binary("+", _S.read(_v37, "top"), _S.binary("*", _S.binary("-", _S.read(_v37, "bot"), _S.read(_v37, "top")), _S.read(_v37, "sv"))), _S.read(_v37, "amp")), "+=", false)
				_v36 = _S.iteration(_v36)
				_S.write(_v36, "x", 1, "+=", true)
			_v35 = _S.iteration(_v35)
			_S.write(_v35, "y", 1, "+=", true)
		_S.write(_v34, "total", _S.read(_v34, "amp"), "+=", false)
		_S.write(_v34, "amp", 0.5, "*=", false)
	var _v38 = _S.scope(_e)
	_S.define(_v38, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v38, "i"), _S.prop(_S.read(_v38, "d"), "length"))):
		_S.set_prop(_S.read(_v38, "d"), _S.read(_v38, "i"), _S.read(_v38, "total"), "/=", false)
		_v38 = _S.iteration(_v38)
		_S.write(_v38, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "FIELDS"), "set", [_S.read(_e, "key"), _S.write(_e, "F", _S.merge([{"w": _S.read(_e, "w")}, {"h": _S.read(_e, "h")}, {"d": _S.read(_e, "d")}]), "=", false)])
	return _S.read(_e, "F")

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "rand"), [_S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "a"), _S.read(_e, "n")]), _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "b"), _S.read(_e, "rows")]), _S.read(_e, "seed"), _S.read(_e, "n")])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "F", _S.arg(_args, 0))
	_S.define(_e, "u", _S.arg(_args, 1))
	_S.define(_e, "v", _S.arg(_args, 2))
	_S.define(_e, "x", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "u")]))
	_S.define(_e, "y", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "v")]))
	_S.define(_e, "fx", _S.binary("-", _S.read(_e, "u"), _S.read(_e, "x")))
	_S.define(_e, "fy", _S.binary("-", _S.read(_e, "v"), _S.read(_e, "y")))
	_S.define(_e, "m", _S.binary("-", _S.prop(_S.read(_e, "F"), "w"), 1))
	_S.define(_e, "n", _S.binary("-", _S.prop(_S.read(_e, "F"), "h"), 1))
	_S.define(_e, "D", _S.prop(_S.read(_e, "F"), "d"))
	_S.define(_e, "x0", _S.binary("&", _S.read(_e, "x"), _S.read(_e, "m")))
	_S.define(_e, "x1", _S.binary("&", _S.binary("+", _S.read(_e, "x"), 1), _S.read(_e, "m")))
	_S.define(_e, "y0", _S.binary("*", _S.binary("&", _S.read(_e, "y"), _S.read(_e, "n")), _S.prop(_S.read(_e, "F"), "w")))
	_S.define(_e, "y1", _S.binary("*", _S.binary("&", _S.binary("+", _S.read(_e, "y"), 1), _S.read(_e, "n")), _S.prop(_S.read(_e, "F"), "w")))
	_S.define(_e, "a", _S.prop(_S.read(_e, "D"), _S.binary("+", _S.read(_e, "y0"), _S.read(_e, "x0"))))
	_S.define(_e, "b", _S.prop(_S.read(_e, "D"), _S.binary("+", _S.read(_e, "y0"), _S.read(_e, "x1"))))
	_S.define(_e, "c", _S.prop(_S.read(_e, "D"), _S.binary("+", _S.read(_e, "y1"), _S.read(_e, "x0"))))
	_S.define(_e, "e", _S.prop(_S.read(_e, "D"), _S.binary("+", _S.read(_e, "y1"), _S.read(_e, "x1"))))
	return _S.binary("+", _S.binary("+", _S.read(_e, "a"), _S.binary("*", _S.binary("-", _S.read(_e, "b"), _S.read(_e, "a")), _S.read(_e, "fx"))), _S.binary("*", _S.binary("+", _S.binary("-", _S.read(_e, "c"), _S.read(_e, "a")), _S.binary("*", _S.binary("+", _S.binary("-", _S.binary("-", _S.read(_e, "a"), _S.read(_e, "b")), _S.read(_e, "c")), _S.read(_e, "e")), _S.read(_e, "fx"))), _S.read(_e, "fy")))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "D", _S.arg(_args, 1))
	_S.define(_e, "n", _S.arg(_args, 2))
	_S.define(_e, "seed", _S.arg(_args, 3))
	_S.define(_e, "m0", _S.arg(_args, 4))
	_S.define(_e, "m1", _S.arg(_args, 5))
	_S.define(_e, "fn", _S.arg(_args, 6))
	var _v39 = _S.scope(_e)
	_S.define(_v39, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v39, "i"), _S.read(_v39, "n"))):
		var _v40 = _S.scope(_v39)
		_S.define(_v40, "m", _S.binary("+", _S.read(_v40, "m0"), _S.invoke(_S.read(_v40, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v40, "rand"), [_S.read(_v40, "seed"), _S.read(_v40, "i"), 72]), _S.binary("+", _S.binary("-", _S.read(_v40, "m1"), _S.read(_v40, "m0")), 1))])))
		_S.define(_v40, "s", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v40, "t"), _S.read(_v40, "D")), _S.read(_v40, "m")), _S.call_value(_S.read(_v40, "rand"), [_S.read(_v40, "seed"), _S.read(_v40, "i"), 71])))
		_S.define(_v40, "k", _S.invoke(_S.read(_v40, "Math"), "floor", [_S.read(_v40, "s")]))
		_S.call_value(_S.read(_v40, "fn"), [_S.binary("-", _S.read(_v40, "s"), _S.read(_v40, "k")), _S.read(_v40, "k"), _S.read(_v40, "m"), _S.read(_v40, "i")])
		_v39 = _S.iteration(_v39)
		_S.write(_v39, "i", 1, "+=", true)
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "x0", _S.arg(_args, 1))
	_S.define(_e, "y0", _S.arg(_args, 2))
	_S.define(_e, "x1", _S.arg(_args, 3))
	_S.define(_e, "y1", _S.arg(_args, 4))
	_S.define(_e, "jag", _S.coalesce(_S.arg(_args, 5), func(): return 0.3))
	_S.define(_e, "forks", _S.coalesce(_S.arg(_args, 6), func(): return 0.4))
	_S.define(_e, "w", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	_S.define(_e, "depth", _S.coalesce(_S.arg(_args, 8), func(): return 0))
	_S.define(_e, "out", [])
	_S.define(_e, "L", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0"))]))
	_S.define(_e, "pts", [[_S.read(_e, "x0"), _S.read(_e, "y0")], [_S.read(_e, "x1"), _S.read(_e, "y1")]])
	_S.define(_e, "off", _S.binary("*", _S.read(_e, "L"), _S.read(_e, "jag")))
	while _S.truth(_S.binary("<", _S.prop(_S.read(_e, "pts"), "length"), _S.binary("+", 2, _S.binary("/", _S.read(_e, "L"), 3)))):
		var _v41 = _S.scope(_e)
		_S.define(_v41, "nxt", [_S.prop(_S.read(_v41, "pts"), 0)])
		var _v42 = _S.scope(_v41)
		_S.define(_v42, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v42, "i"), _S.binary("-", _S.prop(_S.read(_v42, "pts"), "length"), 1))):
			var _v43 = _S.scope(_v42)
			var _v44 = _S.prop(_S.read(_v43, "pts"), _S.read(_v43, "i"))
			_S.define(_v43, "ax", _S.prop(_v44, 0))
			_S.define(_v43, "ay", _S.prop(_v44, 1))
			var _v45 = _S.prop(_S.read(_v43, "pts"), _S.binary("+", _S.read(_v43, "i"), 1))
			_S.define(_v43, "bx", _S.prop(_v45, 0))
			_S.define(_v43, "by", _S.prop(_v45, 1))
			_S.define(_v43, "l", _S.logical("||", _S.invoke(_S.read(_v43, "Math"), "hypot", [_S.binary("-", _S.read(_v43, "bx"), _S.read(_v43, "ax")), _S.binary("-", _S.read(_v43, "by"), _S.read(_v43, "ay"))]), func(): return 1))
			_S.define(_v43, "o", _S.invoke(_S.read(_v43, "R"), "range", [_S.unary("-", _S.read(_v43, "off")), _S.read(_v43, "off")]))
			_S.invoke(_S.read(_v43, "nxt"), "push", [[_S.binary("+", _S.binary("/", _S.binary("+", _S.read(_v43, "ax"), _S.read(_v43, "bx")), 2), _S.binary("*", _S.binary("/", _S.unary("-", _S.binary("-", _S.read(_v43, "by"), _S.read(_v43, "ay"))), _S.read(_v43, "l")), _S.read(_v43, "o"))), _S.binary("+", _S.binary("/", _S.binary("+", _S.read(_v43, "ay"), _S.read(_v43, "by")), 2), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v43, "bx"), _S.read(_v43, "ax")), _S.read(_v43, "l")), _S.read(_v43, "o")))], [_S.read(_v43, "bx"), _S.read(_v43, "by")]])
			_v42 = _S.iteration(_v42)
			_S.write(_v42, "i", 1, "+=", true)
		_S.write(_v41, "pts", _S.read(_v41, "nxt"), "=", false)
		_S.write(_v41, "off", 0.52, "*=", false)
	_S.invoke(_S.read(_e, "out"), "push", [_S.merge([{"pts": _S.read(_e, "pts")}, {"w": _S.read(_e, "w")}, {"depth": _S.read(_e, "depth")}])])
	if _S.truth(_S.binary("<", _S.read(_e, "depth"), 2)):
		var _v46 = _S.scope(_e)
		_S.define(_v46, "i", 2)
		while _S.truth(_S.binary("<", _S.read(_v46, "i"), _S.binary("-", _S.prop(_S.read(_v46, "pts"), "length"), 3))):
			if _S.truth(_S.invoke(_S.read(_v46, "R"), "chance", [_S.binary("/", _S.binary("/", _S.read(_v46, "forks"), _S.binary("+", 1, _S.read(_v46, "depth"))), _S.invoke(_S.read(_v46, "Math"), "max", [4, _S.binary("/", _S.prop(_S.read(_v46, "pts"), "length"), 6)]))])):
				var _v47 = _S.scope(_v46)
				var _v48 = _S.prop(_S.read(_v47, "pts"), _S.read(_v47, "i"))
				_S.define(_v47, "ax", _S.prop(_v48, 0))
				_S.define(_v47, "ay", _S.prop(_v48, 1))
				var _v49 = _S.prop(_S.read(_v47, "pts"), _S.invoke(_S.read(_v47, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_v47, "pts"), "length"), 1), _S.binary("+", _S.read(_v47, "i"), 3)]))
				_S.define(_v47, "bx", _S.prop(_v49, 0))
				_S.define(_v47, "by", _S.prop(_v49, 1))
				_S.define(_v47, "a", _S.binary("+", _S.invoke(_S.read(_v47, "Math"), "atan2", [_S.binary("-", _S.read(_v47, "by"), _S.read(_v47, "ay")), _S.binary("-", _S.read(_v47, "bx"), _S.read(_v47, "ax"))]), _S.binary("*", _S.invoke(_S.read(_v47, "R"), "sign", []), _S.invoke(_S.read(_v47, "R"), "range", [0.35, 0.95]))))
				_S.define(_v47, "l", _S.binary("*", _S.binary("-", _S.read(_v47, "L"), _S.binary("*", _S.binary("/", _S.read(_v47, "i"), _S.prop(_S.read(_v47, "pts"), "length")), _S.read(_v47, "L"))), _S.invoke(_S.read(_v47, "R"), "range", [0.25, 0.55])))
				_S.invoke(_S.read(_v47, "out"), "push", _S.concat([_S.array(_S.call_value(_S.read(_v47, "tree"), [_S.read(_v47, "R"), _S.read(_v47, "ax"), _S.read(_v47, "ay"), _S.binary("+", _S.read(_v47, "ax"), _S.binary("*", _S.invoke(_S.read(_v47, "Math"), "cos", [_S.read(_v47, "a")]), _S.read(_v47, "l"))), _S.binary("+", _S.read(_v47, "ay"), _S.binary("*", _S.invoke(_S.read(_v47, "Math"), "sin", [_S.read(_v47, "a")]), _S.read(_v47, "l"))), _S.binary("*", _S.read(_v47, "jag"), 1.1), _S.read(_v47, "forks"), _S.binary("*", _S.read(_v47, "w"), 0.55), _S.binary("+", _S.read(_v47, "depth"), 1)]))]))
			_v46 = _S.iteration(_v46)
			_S.write(_v46, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "z", _S.arg(_args, 2))
	_S.define(_e, "age", _S.arg(_args, 3))
	_S.define(_e, "size", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "h", _S.arg(_args, 6))
	_S.define(_e, "L", _S.binary("+", 0.3, _S.binary("*", 0.12, _S.read(_e, "size"))))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "L")))
	if _S.truth(_S.binary(">=", _S.read(_e, "u"), 1)):
		return null
	if _S.truth(_S.binary("<", _S.read(_e, "age"), 0.07)):
		var _v50 = _S.scope(_e)
		_S.invoke(_S.read(_v50, "q"), "px", [_S.read(_v50, "x"), _S.binary("-", _S.read(_v50, "z"), 1), _S.prop(_S.read(_v50, "c"), "hot")])
		if _S.truth(_S.binary(">", _S.read(_v50, "size"), 0.3)):
			_S.last([_S.invoke(_S.read(_v50, "q"), "px", [_S.binary("-", _S.read(_v50, "x"), 1), _S.binary("-", _S.binary("-", _S.read(_v50, "z"), 1), (1 if _S.truth(_S.binary(">", _S.read(_v50, "age"), 0.035)) else 0)), _S.prop(_S.read(_v50, "c"), "hot")]), _S.invoke(_S.read(_v50, "q"), "px", [_S.binary("+", _S.read(_v50, "x"), 1), _S.binary("-", _S.binary("-", _S.read(_v50, "z"), 1), (1 if _S.truth(_S.binary(">", _S.read(_v50, "age"), 0.035)) else 0)), _S.prop(_S.read(_v50, "c"), "hot")])])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v50, "size"), 0.65), func(): return _S.binary(">", _S.read(_v50, "age"), 0.03))):
			_S.last([_S.invoke(_S.read(_v50, "q"), "px", [_S.binary("-", _S.read(_v50, "x"), 2), _S.binary("-", _S.read(_v50, "z"), 2), _S.prop(_S.read(_v50, "c"), "cool")]), _S.invoke(_S.read(_v50, "q"), "px", [_S.binary("+", _S.read(_v50, "x"), 2), _S.binary("-", _S.read(_v50, "z"), 2), _S.prop(_S.read(_v50, "c"), "cool")])])
	_S.define(_e, "rx", _S.binary("+", 1, _S.binary("*", _S.binary("+", 1.2, _S.binary("*", 3.6, _S.read(_e, "size"))), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "u")]))))
	_S.define(_e, "ry", _S.invoke(_S.read(_e, "Math"), "max", [0.5, _S.binary("*", _S.read(_e, "rx"), 0.26)]))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.read(_e, "rx"), 6.5)]))
	var _v51 = _S.scope(_e)
	_S.define(_v51, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v51, "j"), _S.read(_v51, "n"))):
		var _v52 = _S.scope(_v51)
		_S.define(_v52, "a", _S.binary("*", _S.binary("/", _S.read(_v52, "j"), _S.read(_v52, "n")), _S.read(_v52, "TAU")))
		_S.define(_v52, "s", _S.invoke(_S.read(_v52, "Math"), "sin", [_S.read(_v52, "a")]))
		if _S.truth(_S.binary("<", _S.read(_v52, "s"), _S.unary("-", 0.25))):
			_v51 = _S.iteration(_v51)
			_S.write(_v51, "j", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v52, "q"), "dot", [_S.binary("+", _S.read(_v52, "x"), _S.binary("*", _S.invoke(_S.read(_v52, "Math"), "cos", [_S.read(_v52, "a")]), _S.read(_v52, "rx"))), _S.binary("+", _S.read(_v52, "z"), _S.binary("*", _S.read(_v52, "s"), _S.read(_v52, "ry"))), (_S.prop(_S.read(_v52, "c"), "hot") if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v52, "u"), 0.3), func(): return _S.binary(">", _S.read(_v52, "s"), 0))) else _S.prop(_S.read(_v52, "c"), "cool")), ((1 if _S.truth(_S.binary(">", _S.read(_v52, "s"), 0.2)) else 0.7) if _S.truth(_S.binary("<", _S.read(_v52, "u"), 0.45)) else _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_v52, "u")), 1.6), (1 if _S.truth(_S.binary(">", _S.read(_v52, "s"), 0.2)) else 0.6)))])
		_v51 = _S.iteration(_v51)
		_S.write(_v51, "j", 1, "+=", true)
	_S.define(_e, "nd", (3 if _S.truth(_S.binary(">", _S.read(_e, "size"), 0.55)) else 2))
	_S.define(_e, "H", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "h"), 1000000)]))
	var _v53 = _S.scope(_e)
	_S.define(_v53, "d", 0)
	while _S.truth(_S.binary("<", _S.read(_v53, "d"), _S.read(_v53, "nd"))):
		var _v54 = _S.scope(_v53)
		_S.define(_v54, "vx", _S.binary("*", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v54, "rand"), [_S.read(_v54, "H"), _S.read(_v54, "d"), 1]), 0.5), 2), _S.binary("+", 25, _S.binary("*", 35, _S.read(_v54, "size")))))
		_S.define(_v54, "vy", _S.unary("-", _S.binary("+", 55, _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v54, "rand"), [_S.read(_v54, "H"), _S.read(_v54, "d"), 2]), 70), _S.binary("+", 0.5, _S.read(_v54, "size"))))))
		_S.define(_v54, "y", _S.binary("+", _S.binary("+", _S.binary("-", _S.read(_v54, "z"), 1), _S.binary("*", _S.read(_v54, "vy"), _S.read(_v54, "age"))), _S.binary("*", _S.binary("*", 475, _S.read(_v54, "age")), _S.read(_v54, "age"))))
		if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v54, "y"), _S.binary("-", _S.read(_v54, "z"), 0.5)), func(): return _S.binary(">", _S.read(_v54, "age"), 0.34))):
			_v53 = _S.iteration(_v53)
			_S.write(_v53, "d", 1, "+=", true)
			continue
		_S.define(_v54, "xx", _S.binary("+", _S.read(_v54, "x"), _S.binary("*", _S.read(_v54, "vx"), _S.read(_v54, "age"))))
		_S.invoke(_S.read(_v54, "q"), "px", [_S.read(_v54, "xx"), _S.read(_v54, "y"), (_S.prop(_S.read(_v54, "c"), "hot") if _S.truth(_S.binary("<", _S.read(_v54, "age"), 0.12)) else _S.prop(_S.read(_v54, "c"), "cool"))])
		if _S.truth(_S.binary("<", _S.binary("+", _S.read(_v54, "vy"), _S.binary("*", 950, _S.read(_v54, "age"))), _S.unary("-", 40))):
			_S.invoke(_S.read(_v54, "q"), "dot", [_S.binary("-", _S.read(_v54, "xx"), _S.binary("*", _S.read(_v54, "vx"), 0.012)), _S.binary("+", _S.read(_v54, "y"), 1), _S.prop(_S.read(_v54, "c"), "cool"), 0.7])
		_v53 = _S.iteration(_v53)
		_S.write(_v53, "d", 1, "+=", true)
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "z", _S.arg(_args, 2))
	_S.define(_e, "age", _S.arg(_args, 3))
	_S.define(_e, "size", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "h", _S.arg(_args, 6))
	_S.define(_e, "L", _S.binary("+", 0.22, _S.binary("*", 0.14, _S.read(_e, "size"))))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "L")))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Z", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "z")]))
	if _S.truth(_S.binary(">=", _S.read(_e, "u"), 1)):
		return false
	if _S.truth(_S.binary("<", _S.read(_e, "age"), 0.1)):
		var _v55 = _S.scope(_e)
		_S.define(_v55, "up", (1 if _S.truth(_S.binary("<", _S.read(_v55, "age"), 0.033)) else (2 if _S.truth(_S.binary("<", _S.read(_v55, "age"), 0.067)) else _S.binary("+", 2, (1 if _S.truth(_S.binary(">", _S.read(_v55, "size"), 0.5)) else 0)))))
		_S.invoke(_S.read(_v55, "q"), "px", [_S.read(_v55, "X"), _S.binary("-", _S.read(_v55, "Z"), 1), (_S.prop(_S.read(_v55, "c"), "white") if _S.truth(_S.binary("<", _S.read(_v55, "age"), 0.05)) else _S.prop(_S.read(_v55, "c"), "hot"))])
		var _v56 = _S.scope(_v55)
		_S.define(_v56, "d", 1)
		while _S.truth(_S.binary("<=", _S.read(_v56, "d"), _S.invoke(_S.read(_v56, "Math"), "min", [_S.read(_v56, "up"), (3 if _S.truth(_S.binary(">", _S.read(_v56, "size"), 0.5)) else 1)]))):
			_S.last([_S.invoke(_S.read(_v56, "q"), "px", [_S.binary("-", _S.read(_v56, "X"), _S.read(_v56, "d")), _S.binary("-", _S.binary("-", _S.read(_v56, "Z"), 1), (_S.binary("-", _S.read(_v56, "d"), 1) if _S.truth(_S.binary(">", _S.read(_v56, "d"), 1)) else 0)), (_S.prop(_S.read(_v56, "c"), "hot") if _S.truth(_S.binary("===", _S.read(_v56, "d"), 1)) else _S.prop(_S.read(_v56, "c"), "cool"))]), _S.invoke(_S.read(_v56, "q"), "px", [_S.binary("+", _S.read(_v56, "X"), _S.read(_v56, "d")), _S.binary("-", _S.binary("-", _S.read(_v56, "Z"), 1), (_S.binary("-", _S.read(_v56, "d"), 1) if _S.truth(_S.binary(">", _S.read(_v56, "d"), 1)) else 0)), (_S.prop(_S.read(_v56, "c"), "hot") if _S.truth(_S.binary("===", _S.read(_v56, "d"), 1)) else _S.prop(_S.read(_v56, "c"), "cool"))])])
			_v56 = _S.iteration(_v56)
			_S.write(_v56, "d", 1, "+=", true)
	if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.15)):
		var _v57 = _S.scope(_e)
		_S.define(_v57, "w", _S.invoke(_S.read(_v57, "Math"), "round", [_S.binary("+", 1, _S.binary("*", _S.binary("+", 1.5, _S.binary("*", 3.5, _S.read(_v57, "size"))), _S.invoke(_S.read(_v57, "Math"), "sqrt", [_S.read(_v57, "u")])))]))
		_S.define(_v57, "gap", (_S.invoke(_S.read(_v57, "Math"), "max", [0, _S.binary("-", _S.read(_v57, "w"), 2)]) if _S.truth(_S.binary(">", _S.read(_v57, "u"), 0.55)) else _S.unary("-", 1)))
		var _v58 = _S.scope(_v57)
		_S.define(_v58, "d", _S.unary("-", _S.read(_v58, "w")))
		while _S.truth(_S.binary("<=", _S.read(_v58, "d"), _S.read(_v58, "w"))):
			if _S.truth(_S.binary(">", _S.invoke(_S.read(_v58, "Math"), "abs", [_S.read(_v58, "d")]), _S.read(_v58, "gap"))):
				_S.invoke(_S.read(_v58, "q"), "px", [_S.binary("+", _S.read(_v58, "X"), _S.read(_v58, "d")), _S.read(_v58, "Z"), (_S.prop(_S.read(_v58, "c"), "hot") if _S.truth(_S.logical("&&", _S.binary(">=", _S.invoke(_S.read(_v58, "Math"), "abs", [_S.read(_v58, "d")]), _S.binary("-", _S.read(_v58, "w"), 1)), func(): return _S.binary("<", _S.read(_v58, "u"), 0.6))) else _S.prop(_S.read(_v58, "c"), "cool"))])
			_v58 = _S.iteration(_v58)
			_S.write(_v58, "d", 1, "+=", true)
	_S.define(_e, "nd", (2 if _S.truth(_S.binary(">", _S.read(_e, "size"), 0.5)) else 1))
	_S.define(_e, "H", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "h"), 1000000)]))
	var _v59 = _S.scope(_e)
	_S.define(_v59, "d", 0)
	while _S.truth(_S.binary("<", _S.read(_v59, "d"), _S.read(_v59, "nd"))):
		var _v60 = _S.scope(_v59)
		_S.define(_v60, "vx", _S.binary("*", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v60, "rand"), [_S.read(_v60, "H"), _S.read(_v60, "d"), 1]), 0.5), 2), _S.binary("+", 20, _S.binary("*", 30, _S.read(_v60, "size")))))
		_S.define(_v60, "vy", _S.unary("-", _S.binary("+", 50, _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v60, "rand"), [_S.read(_v60, "H"), _S.read(_v60, "d"), 2]), 60), _S.binary("+", 0.4, _S.read(_v60, "size"))))))
		_S.define(_v60, "y", _S.binary("+", _S.binary("+", _S.binary("-", _S.read(_v60, "Z"), 1), _S.binary("*", _S.read(_v60, "vy"), _S.read(_v60, "age"))), _S.binary("*", _S.binary("*", 475, _S.read(_v60, "age")), _S.read(_v60, "age"))))
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v60, "y"), _S.binary("-", _S.read(_v60, "Z"), 0.5)), func(): return _S.binary("<", _S.read(_v60, "age"), 0.3))):
			_S.invoke(_S.read(_v60, "q"), "px", [_S.binary("+", _S.read(_v60, "x"), _S.binary("*", _S.read(_v60, "vx"), _S.read(_v60, "age"))), _S.read(_v60, "y"), (_S.prop(_S.read(_v60, "c"), "white") if _S.truth(_S.binary("<", _S.read(_v60, "age"), 0.1)) else _S.prop(_S.read(_v60, "c"), "hot"))])
		_v59 = _S.iteration(_v59)
		_S.write(_v59, "d", 1, "+=", true)
	return true

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return _S.binary("/", _S.binary("+", _S.read(_e, "v"), 0.5), 16)

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.prop(_S.read(_e, "BAYER"), _S.binary("|", _S.binary("<<", _S.binary("&", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), 3), 2), _S.binary("&", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), 3)))

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "D", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "ph", _S.coalesce(_S.arg(_args, 3), func(): return 0))
	return _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "c")), _S.read(_e, "t")), _S.read(_e, "D")), _S.read(_e, "ph"))])
