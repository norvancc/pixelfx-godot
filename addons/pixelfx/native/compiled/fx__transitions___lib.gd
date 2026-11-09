@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Painter", _S.import_value("core/index.js", "Painter"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "screenMeta", _S.function_value(_e, "_f0"))
	_S.define(_e, "clipTo", _S.function_value(_e, "_f1"))
	_S.define(_e, "rect", _S.function_value(_e, "_f2"))
	_S.define(_e, "fillConvex", _S.function_value(_e, "_f3"))
	_S.define(_e, "halfPlane", _S.function_value(_e, "_f4"))
	_S.define(_e, "field", _S.function_value(_e, "_f6"))
	_S.define(_e, "pixels", _S.function_value(_e, "_f11"))
	_S.define(_e, "glint", _S.function_value(_e, "_f22"))
	_S.define(_e, "W", 320)
	_S.define(_e, "H", 180)
	_exports["W"] = _S.read(_e, "W")
	_exports["H"] = _S.read(_e, "H")
	_exports["screenMeta"] = _S.read(_e, "screenMeta")
	_S.define(_e, "Clipped", _S.class_value("Clipped", null, {"inside": _S.function_value(_e, "_f23"), "put": _S.function_value(_e, "_f24"), "add": _S.function_value(_e, "_f25"), "blendPx": _S.function_value(_e, "_f26")}, {}, {}, _S.read(_e, "Painter")))
	_S.define(_e, "clips", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["clipTo"] = _S.read(_e, "clipTo")
	_S.define(_e, "unrotated", _S.function_value(_e, "_f27"))
	_S.define(_e, "col0", _S.function_value(_e, "_f28"))
	_exports["rect"] = _S.read(_e, "rect")
	_exports["fillConvex"] = _S.read(_e, "fillConvex")
	_exports["halfPlane"] = _S.read(_e, "halfPlane")
	_exports["field"] = _S.read(_e, "field")
	_exports["pixels"] = _S.read(_e, "pixels")
	_exports["glint"] = _S.read(_e, "glint")
	_S.define(_e, "lifeLeft", _S.function_value(_e, "_f29"))
	_exports["lifeLeft"] = _S.read(_e, "lifeLeft")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	var _v0 = _S.arg(_args, 0)
	_S.define(_e, "name", _S.prop(_v0, "name"))
	_S.define(_e, "desc", _S.prop(_v0, "desc"))
	_S.define(_e, "tags", _S.prop(_v0, "tags"))
	_S.define(_e, "duration", _S.prop(_v0, "duration"))
	_S.define(_e, "options", _S.prop(_v0, "options"))
	return _S.merge([{"name": _S.read(_e, "name")}, {"desc": _S.read(_e, "desc")}, {"tags": _S.concat([["transition"], ["screen"], _S.array(_S.read(_e, "tags")), ["one-shot"]])}, {"size": [_S.read(_e, "W"), _S.read(_e, "H")]}, {"origin": [0, 0]}, {"duration": _S.read(_e, "duration")}, {"loop": false}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"color": "#0b0a10"}, {"seed": 1}, _S.read(_e, "options")])}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.invoke(_S.read(_e, "clips"), "get", [_S.read(_e, "p")]))
	if _S.truth(_S.unary("!", _S.read(_e, "q"))):
		_S.invoke(_S.read(_e, "clips"), "set", [_S.read(_e, "p"), _S.write(_e, "q", _S.construct(_S.read(_e, "Clipped"), [_S.prop(_S.read(_e, "p"), "frame")]), "=", false)])
	_S.invoke(_S.read(_e, "q"), "reset", [])
	_S.set_prop(_S.read(_e, "q"), "tx", _S.prop(_S.read(_e, "p"), "tx"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "ty", _S.prop(_S.read(_e, "p"), "ty"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "fx", _S.prop(_S.read(_e, "p"), "fx"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "cs", _S.prop(_S.read(_e, "p"), "cs"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "sn", _S.prop(_S.read(_e, "p"), "sn"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "fade", _S.prop(_S.read(_e, "p"), "fade"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "lightK", _S.prop(_S.read(_e, "p"), "lightK"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "layer", _S.prop(_S.read(_e, "p"), "layer"), "=", false)
	return _S.read(_e, "q")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "w", _S.arg(_args, 3))
	_S.define(_e, "h", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "unrotated"), [_S.read(_e, "p")]))):
		return _S.invoke(_S.read(_e, "p"), "rect", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "w"), _S.read(_e, "h"), _S.read(_e, "c")])
	_S.define(_e, "X0", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "X1", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.read(_e, "x"), _S.read(_e, "w"))]))
	_S.define(_e, "Y0", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.define(_e, "Y1", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.read(_e, "y"), _S.read(_e, "h"))]))
	_S.define(_e, "fx", _S.prop(_S.read(_e, "p"), "fx"))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "col0"), [_S.read(_e, "p")]))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "yy", _S.read(_v1, "Y0"))
	while _S.truth(_S.binary("<", _S.read(_v1, "yy"), _S.read(_v1, "Y1"))):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "sy", _S.invoke(_S.read(_v2, "Math"), "floor", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v2, "p"), "ty"), _S.read(_v2, "yy")), 0.5)]))
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "xx", _S.read(_v3, "X0"))
		while _S.truth(_S.binary("<", _S.read(_v3, "xx"), _S.read(_v3, "X1"))):
			_S.invoke(_S.read(_v3, "p"), "put", [_S.binary("+", _S.read(_v3, "b"), _S.binary("*", _S.read(_v3, "fx"), _S.read(_v3, "xx"))), _S.read(_v3, "sy"), _S.read(_v3, "c"), 1])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "xx", 1, "+=", true)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "yy", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "pts", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 3), func(): return 1))
	_S.define(_e, "y0", INF)
	_S.define(_e, "y1", _S.unary("-", INF))
	for _v4 in _S.array(_S.read(_e, "pts")):
		var _v5 = _S.scope(_e)
		var _v6 = _v4
		_S.define(_v5, "y", _S.prop(_v6, 1))
		_S.last([_S.write(_v5, "y0", _S.invoke(_S.read(_v5, "Math"), "min", [_S.read(_v5, "y0"), _S.read(_v5, "y")]), "=", false), _S.write(_v5, "y1", _S.invoke(_S.read(_v5, "Math"), "max", [_S.read(_v5, "y1"), _S.read(_v5, "y")]), "=", false)])
	_S.define(_e, "r0", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("-", _S.read(_e, "y0"), 0.5)])]))
	_S.define(_e, "r1", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "H"), 1), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "y1"), 0.5)])]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "pts"), "length"))
	_S.define(_e, "fc", _S.binary("===", _S.unary("typeof", _S.read(_e, "c")), "function"))
	var _v7 = _S.scope(_e)
	_S.define(_v7, "y", _S.read(_v7, "r0"))
	while _S.truth(_S.binary("<=", _S.read(_v7, "y"), _S.read(_v7, "r1"))):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "yc", _S.binary("+", _S.read(_v8, "y"), 0.5))
		_S.define(_v8, "xl", INF)
		_S.define(_v8, "xr", _S.unary("-", INF))
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "i", 0)
		_S.define(_v9, "j", _S.binary("-", _S.read(_v9, "n"), 1))
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), _S.read(_v9, "n"))):
			var _v10 = _S.scope(_v9)
			var _v11 = _S.prop(_S.read(_v10, "pts"), _S.read(_v10, "i"))
			_S.define(_v10, "xi", _S.prop(_v11, 0))
			_S.define(_v10, "yi", _S.prop(_v11, 1))
			var _v12 = _S.prop(_S.read(_v10, "pts"), _S.read(_v10, "j"))
			_S.define(_v10, "xj", _S.prop(_v12, 0))
			_S.define(_v10, "yj", _S.prop(_v12, 1))
			if _S.truth(_S.binary("===", _S.binary(">", _S.read(_v10, "yi"), _S.read(_v10, "yc")), _S.binary(">", _S.read(_v10, "yj"), _S.read(_v10, "yc")))):
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "j", _S.write(_v9, "i", 1, "+=", true), "=", false)
				continue
			_S.define(_v10, "x", _S.binary("+", _S.read(_v10, "xi"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v10, "yc"), _S.read(_v10, "yi")), _S.binary("-", _S.read(_v10, "xj"), _S.read(_v10, "xi"))), _S.binary("-", _S.read(_v10, "yj"), _S.read(_v10, "yi")))))
			if _S.truth(_S.binary("<", _S.read(_v10, "x"), _S.read(_v10, "xl"))):
				_S.write(_v10, "xl", _S.read(_v10, "x"), "=", false)
			if _S.truth(_S.binary(">", _S.read(_v10, "x"), _S.read(_v10, "xr"))):
				_S.write(_v10, "xr", _S.read(_v10, "x"), "=", false)
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "j", _S.write(_v9, "i", 1, "+=", true), "=", false)
		_S.define(_v8, "c0", _S.invoke(_S.read(_v8, "Math"), "max", [0, _S.invoke(_S.read(_v8, "Math"), "ceil", [_S.binary("-", _S.read(_v8, "xl"), 0.5)])]))
		_S.define(_v8, "c1", _S.invoke(_S.read(_v8, "Math"), "min", [_S.binary("-", _S.read(_v8, "W"), 1), _S.invoke(_S.read(_v8, "Math"), "floor", [_S.binary("-", _S.read(_v8, "xr"), 0.5)])]))
		if _S.truth(_S.call_value(_S.read(_v8, "unrotated"), [_S.read(_v8, "p")])):
			var _v13 = _S.scope(_v8)
			_S.define(_v13, "fx", _S.prop(_S.read(_v13, "p"), "fx"))
			_S.define(_v13, "b", _S.call_value(_S.read(_v13, "col0"), [_S.read(_v13, "p")]))
			_S.define(_v13, "sy", _S.invoke(_S.read(_v13, "Math"), "floor", [_S.binary("+", _S.prop(_S.read(_v13, "p"), "ty"), _S.read(_v13, "yc"))]))
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "x", _S.read(_v14, "c0"))
			while _S.truth(_S.binary("<=", _S.read(_v14, "x"), _S.read(_v14, "c1"))):
				var _v15 = _S.scope(_v14)
				_S.define(_v15, "col", (_S.call_value(_S.read(_v15, "c"), [_S.binary("+", _S.read(_v15, "x"), 0.5), _S.read(_v15, "yc")]) if _S.truth(_S.read(_v15, "fc")) else _S.read(_v15, "c")))
				if _S.truth(_S.read(_v15, "col")):
					_S.invoke(_S.read(_v15, "p"), "put", [_S.binary("+", _S.read(_v15, "b"), _S.binary("*", _S.read(_v15, "fx"), _S.read(_v15, "x"))), _S.read(_v15, "sy"), _S.read(_v15, "col"), _S.read(_v15, "a")])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "x", 1, "+=", true)
		else:
			var _v16 = _S.scope(_v8)
			_S.define(_v16, "x", _S.read(_v16, "c0"))
			while _S.truth(_S.binary("<=", _S.read(_v16, "x"), _S.read(_v16, "c1"))):
				var _v17 = _S.scope(_v16)
				_S.define(_v17, "col", (_S.call_value(_S.read(_v17, "c"), [_S.binary("+", _S.read(_v17, "x"), 0.5), _S.read(_v17, "yc")]) if _S.truth(_S.read(_v17, "fc")) else _S.read(_v17, "c")))
				if _S.truth(_S.read(_v17, "col")):
					_S.invoke(_S.read(_v17, "p"), "dot", [_S.read(_v17, "x"), _S.read(_v17, "y"), _S.read(_v17, "col"), _S.read(_v17, "a")])
				_v16 = _S.iteration(_v16)
				_S.write(_v16, "x", 1, "+=", true)
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "y", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "cx", _S.arg(_args, 1))
	_S.define(_e, "cy", _S.arg(_args, 2))
	_S.define(_e, "nx", _S.arg(_args, 3))
	_S.define(_e, "ny", _S.arg(_args, 4))
	_S.define(_e, "out", [])
	_S.define(_e, "side", _S.function_value(_e, "_f5"))
	var _v19 = _S.scope(_e)
	_S.define(_v19, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v19, "i"), _S.prop(_S.read(_v19, "pts"), "length"))):
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "a", _S.prop(_S.read(_v20, "pts"), _S.read(_v20, "i")))
		_S.define(_v20, "b", _S.prop(_S.read(_v20, "pts"), _S.binary("%", _S.binary("+", _S.read(_v20, "i"), 1), _S.prop(_S.read(_v20, "pts"), "length"))))
		_S.define(_v20, "sa", _S.call_value(_S.read(_v20, "side"), [_S.read(_v20, "a")]))
		_S.define(_v20, "sb", _S.call_value(_S.read(_v20, "side"), [_S.read(_v20, "b")]))
		if _S.truth(_S.binary(">=", _S.read(_v20, "sa"), 0)):
			_S.invoke(_S.read(_v20, "out"), "push", [_S.read(_v20, "a")])
		if _S.truth(_S.binary("!==", _S.binary(">=", _S.read(_v20, "sa"), 0), _S.binary(">=", _S.read(_v20, "sb"), 0))):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "k", _S.binary("/", _S.read(_v21, "sa"), _S.binary("-", _S.read(_v21, "sa"), _S.read(_v21, "sb"))))
			_S.invoke(_S.read(_v21, "out"), "push", [[_S.binary("+", _S.prop(_S.read(_v21, "a"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v21, "b"), 0), _S.prop(_S.read(_v21, "a"), 0)), _S.read(_v21, "k"))), _S.binary("+", _S.prop(_S.read(_v21, "a"), 1), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v21, "b"), 1), _S.prop(_S.read(_v21, "a"), 1)), _S.read(_v21, "k")))]])
		_v19 = _S.iteration(_v19)
		_S.write(_v19, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v18 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v18, 0))
	_S.define(_e, "y", _S.prop(_v18, 1))
	return _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.read(_e, "nx")), _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")), _S.read(_e, "ny")))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "fn", _S.arg(_args, 0))
	_S.define(_e, "gmin", _S.coalesce(_S.arg(_args, 1), func(): return 0.45))
	_S.define(_e, "gmax", _S.coalesce(_S.arg(_args, 2), func(): return 3))
	_S.define(_e, "f", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "g", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "ny", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "lo", INF)
	_S.define(_e, "hi", _S.unary("-", INF))
	var _v22 = _S.scope(_e)
	_S.define(_v22, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v22, "y"), _S.read(_v22, "H"))):
		var _v23 = _S.scope(_v22)
		_S.define(_v23, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "x"), _S.read(_v23, "W"))):
			var _v24 = _S.scope(_v23)
			_S.define(_v24, "v", _S.call_value(_S.read(_v24, "fn"), [_S.binary("+", _S.read(_v24, "x"), 0.5), _S.binary("+", _S.read(_v24, "y"), 0.5)]))
			_S.set_prop(_S.read(_v24, "f"), _S.binary("+", _S.binary("*", _S.read(_v24, "y"), _S.read(_v24, "W")), _S.read(_v24, "x")), _S.read(_v24, "v"), "=", false)
			if _S.truth(_S.binary("<", _S.read(_v24, "v"), _S.read(_v24, "lo"))):
				_S.write(_v24, "lo", _S.read(_v24, "v"), "=", false)
			if _S.truth(_S.binary(">", _S.read(_v24, "v"), _S.read(_v24, "hi"))):
				_S.write(_v24, "hi", _S.read(_v24, "v"), "=", false)
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "x", 1, "+=", true)
		_v22 = _S.iteration(_v22)
		_S.write(_v22, "y", 1, "+=", true)
	var _v25 = _S.scope(_e)
	_S.define(_v25, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v25, "y"), _S.read(_v25, "H"))):
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "x"), _S.read(_v26, "W"))):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "xa", _S.invoke(_S.read(_v27, "Math"), "max", [0, _S.binary("-", _S.read(_v27, "x"), 1)]))
			_S.define(_v27, "xb", _S.invoke(_S.read(_v27, "Math"), "min", [_S.binary("-", _S.read(_v27, "W"), 1), _S.binary("+", _S.read(_v27, "x"), 1)]))
			_S.define(_v27, "ya", _S.invoke(_S.read(_v27, "Math"), "max", [0, _S.binary("-", _S.read(_v27, "y"), 1)]))
			_S.define(_v27, "yb", _S.invoke(_S.read(_v27, "Math"), "min", [_S.binary("-", _S.read(_v27, "H"), 1), _S.binary("+", _S.read(_v27, "y"), 1)]))
			_S.define(_v27, "gx", _S.binary("/", _S.binary("-", _S.prop(_S.read(_v27, "f"), _S.binary("+", _S.binary("*", _S.read(_v27, "y"), _S.read(_v27, "W")), _S.read(_v27, "xb"))), _S.prop(_S.read(_v27, "f"), _S.binary("+", _S.binary("*", _S.read(_v27, "y"), _S.read(_v27, "W")), _S.read(_v27, "xa")))), _S.binary("-", _S.read(_v27, "xb"), _S.read(_v27, "xa"))))
			_S.define(_v27, "gy", _S.binary("/", _S.binary("-", _S.prop(_S.read(_v27, "f"), _S.binary("+", _S.binary("*", _S.read(_v27, "yb"), _S.read(_v27, "W")), _S.read(_v27, "x"))), _S.prop(_S.read(_v27, "f"), _S.binary("+", _S.binary("*", _S.read(_v27, "ya"), _S.read(_v27, "W")), _S.read(_v27, "x")))), _S.binary("-", _S.read(_v27, "yb"), _S.read(_v27, "ya"))))
			_S.define(_v27, "L", _S.invoke(_S.read(_v27, "Math"), "hypot", [_S.read(_v27, "gx"), _S.read(_v27, "gy")]))
			_S.set_prop(_S.read(_v27, "g"), _S.binary("+", _S.binary("*", _S.read(_v27, "y"), _S.read(_v27, "W")), _S.read(_v27, "x")), _S.binary("/", 1, _S.call_value(_S.read(_v27, "clamp"), [_S.read(_v27, "L"), _S.read(_v27, "gmin"), _S.read(_v27, "gmax")])), "=", false)
			_S.set_prop(_S.read(_v27, "ny"), _S.binary("+", _S.binary("*", _S.read(_v27, "y"), _S.read(_v27, "W")), _S.read(_v27, "x")), (_S.binary("/", _S.read(_v27, "gy"), _S.read(_v27, "L")) if _S.truth(_S.binary(">", _S.read(_v27, "L"), 0.000001)) else 0), "=", false)
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "x", 1, "+=", true)
		_v25 = _S.iteration(_v25)
		_S.write(_v25, "y", 1, "+=", true)
	_S.define(_e, "order", _S.invoke(_S.invoke(_S.read(_e, "Uint32Array"), "from", [_S.merge([{"length": _S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))}]), _S.function_value(_e, "_f7")]), "sort", [_S.function_value(_e, "_f8")]))
	_S.define(_e, "sorted", _S.invoke(_S.read(_e, "Float32Array"), "from", [_S.read(_e, "order"), _S.function_value(_e, "_f9")]))
	_S.define(_e, "below", _S.function_value(_e, "_f10"))
	return _S.merge([{"f": _S.read(_e, "f")}, {"g": _S.read(_e, "g")}, {"ny": _S.read(_e, "ny")}, {"lo": _S.read(_e, "lo")}, {"hi": _S.read(_e, "hi")}, {"order": _S.read(_e, "order")}, {"below": _S.read(_e, "below")}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.read(_e, "i")

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "f"), _S.read(_e, "a")), _S.prop(_S.read(_e, "f"), _S.read(_e, "b")))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "f"), _S.read(_e, "i"))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "a", 0)
	_S.define(_e, "b", _S.prop(_S.read(_e, "sorted"), "length"))
	while _S.truth(_S.binary("<", _S.read(_e, "a"), _S.read(_e, "b"))):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "m", _S.binary(">>", _S.binary("+", _S.read(_v28, "a"), _S.read(_v28, "b")), 1))
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v28, "sorted"), _S.read(_v28, "m")), _S.read(_v28, "v"))):
			_S.write(_v28, "a", _S.binary("+", _S.read(_v28, "m"), 1), "=", false)
		else:
			_S.write(_v28, "b", _S.read(_v28, "m"), "=", false)
	return _S.read(_e, "a")

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "sx", 0)
	_S.define(_e, "sy", 0)
	_S.define(_e, "i0", 0)
	if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_e, "p"), "sn"), 0), func(): return _S.binary("===", _S.prop(_S.read(_e, "p"), "cs"), 1))):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "tx", _S.prop(_S.read(_v29, "p"), "tx"))
		_S.define(_v29, "ty", _S.prop(_S.read(_v29, "p"), "ty"))
		_S.define(_v29, "fx", _S.prop(_S.read(_v29, "p"), "fx"))
		return _S.merge([{"at": _S.function_value(_v29, "_f12")}, {"put": _S.function_value(_v29, "_f13")}, {"add": _S.function_value(_v29, "_f14")}, {"blend": _S.function_value(_v29, "_f15")}])
	_S.define(_e, "x", _S.function_value(_e, "_f16"))
	_S.define(_e, "y", _S.function_value(_e, "_f17"))
	return _S.merge([{"at": _S.function_value(_e, "_f18")}, {"put": _S.function_value(_e, "_f19")}, {"add": _S.function_value(_e, "_f20")}, {"blend": _S.function_value(_e, "_f21")}])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.write(_e, "sx", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.read(_e, "tx"), _S.binary("*", _S.binary("+", _S.binary("%", _S.read(_e, "i"), _S.read(_e, "W")), 0.5), _S.read(_e, "fx")))]), "=", false)
	_S.write(_e, "sy", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("+", _S.read(_e, "ty"), _S.binary("|", _S.binary("/", _S.read(_e, "i"), _S.read(_e, "W")), 0)), 0.5)]), "=", false)
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 1), func(): return 1))
	return _S.invoke(_S.read(_e, "p"), "put", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "c"), _S.read(_e, "a")])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "p"), "add", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "c"), _S.read(_e, "k")])

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "c"), _S.read(_e, "a")])

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("+", _S.binary("%", _S.read(_e, "i0"), _S.read(_e, "W")), 0.5)

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("+", _S.binary("|", _S.binary("/", _S.read(_e, "i0"), _S.read(_e, "W")), 0), 0.5)

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.write(_e, "i0", _S.read(_e, "i"), "=", false)
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 1), func(): return 1))
	return _S.invoke(_S.read(_e, "p"), "dot", [_S.call_value(_S.read(_e, "x"), []), _S.call_value(_S.read(_e, "y"), []), _S.read(_e, "c"), _S.read(_e, "a")])

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "p"), "light", [_S.call_value(_S.read(_e, "x"), []), _S.call_value(_S.read(_e, "y"), []), _S.read(_e, "c"), _S.read(_e, "k")])

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "p"), "blend", [_S.call_value(_S.read(_e, "x"), []), _S.call_value(_S.read(_e, "y"), []), _S.read(_e, "c"), _S.read(_e, "a")])

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "L", _S.arg(_args, 3))
	_S.define(_e, "ang", _S.arg(_args, 4))
	_S.define(_e, "c1", _S.arg(_args, 5))
	_S.define(_e, "c2", _S.arg(_args, 6))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "L"), 0.8), func(): return _S.binary("<=", _S.read(_e, "a"), 0))):
		return null
	var _v30 = _S.scope(_e)
	_S.define(_v30, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v30, "i"), 8)):
		var _v31 = _S.scope(_v30)
		_S.define(_v31, "diag", _S.binary("===", _S.binary("%", _S.read(_v31, "i"), 2), 1))
		_S.define(_v31, "an", _S.binary("+", _S.read(_v31, "ang"), _S.binary("/", _S.binary("*", _S.read(_v31, "i"), _S.read(_v31, "TAU")), 8)))
		_S.define(_v31, "len", (_S.binary("*", _S.read(_v31, "L"), 0.42) if _S.truth(_S.read(_v31, "diag")) else _S.read(_v31, "L")))
		_S.define(_v31, "ca", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "an")]))
		_S.define(_v31, "sa", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "an")]))
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "d", 0)
		while _S.truth(_S.binary("<=", _S.read(_v32, "d"), _S.read(_v32, "len"))):
			var _v33 = _S.scope(_v32)
			_S.define(_v33, "u", _S.binary("/", _S.read(_v33, "d"), _S.read(_v33, "len")))
			_S.define(_v33, "c", ((_S.read(_v33, "c1") if _S.truth(_S.binary("<", _S.read(_v33, "u"), 0.5)) else _S.read(_v33, "c2")) if _S.truth(_S.read(_v33, "diag")) else (_S.read(_v33, "WHITE") if _S.truth(_S.binary("<", _S.read(_v33, "u"), 0.3)) else (_S.read(_v33, "c1") if _S.truth(_S.binary("<", _S.read(_v33, "u"), 0.65)) else _S.read(_v33, "c2")))))
			_S.invoke(_S.read(_v33, "p"), "dot", [_S.binary("+", _S.read(_v33, "x"), _S.binary("*", _S.read(_v33, "ca"), _S.read(_v33, "d"))), _S.binary("+", _S.read(_v33, "y"), _S.binary("*", _S.read(_v33, "sa"), _S.read(_v33, "d"))), _S.read(_v33, "c"), _S.binary("*", _S.read(_v33, "a"), (1 if _S.truth(_S.binary("<", _S.read(_v33, "u"), 0.7)) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v33, "u"), 0.7), 0.35))))])
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.unary("!", _S.read(_v33, "diag")), func(): return _S.binary("<", _S.read(_v33, "u"), 0.22)), func(): return _S.binary(">", _S.read(_v33, "L"), 4))):
				_S.last([_S.invoke(_S.read(_v33, "p"), "dot", [_S.binary("-", _S.binary("+", _S.read(_v33, "x"), _S.binary("*", _S.read(_v33, "ca"), _S.read(_v33, "d"))), _S.read(_v33, "sa")), _S.binary("+", _S.binary("+", _S.read(_v33, "y"), _S.binary("*", _S.read(_v33, "sa"), _S.read(_v33, "d"))), _S.read(_v33, "ca")), _S.read(_v33, "c1"), _S.read(_v33, "a")]), _S.invoke(_S.read(_v33, "p"), "dot", [_S.binary("+", _S.binary("+", _S.read(_v33, "x"), _S.binary("*", _S.read(_v33, "ca"), _S.read(_v33, "d"))), _S.read(_v33, "sa")), _S.binary("-", _S.binary("+", _S.read(_v33, "y"), _S.binary("*", _S.read(_v33, "sa"), _S.read(_v33, "d"))), _S.read(_v33, "ca")), _S.read(_v33, "c1"), _S.read(_v33, "a")])])
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "d", 0.5, "+=", false)
		_v30 = _S.iteration(_v30)
		_S.write(_v30, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "WHITE"), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 4, _S.binary("*", _S.read(_e, "L"), 1.4)), _S.read(_e, "c1"), _S.binary("*", 0.5, _S.read(_e, "a"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 2, _S.binary("*", _S.read(_e, "L"), 0.5)), _S.read(_e, "WHITE"), _S.binary("*", 0.4, _S.read(_e, "a"))])
	return null

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	_S.define(_e, "lx", _S.invoke(_S.read(_e, "this"), "fromX", [_S.binary("+", _S.read(_e, "sx"), 0.5), _S.binary("+", _S.read(_e, "sy"), 0.5)]))
	_S.define(_e, "ly", _S.invoke(_S.read(_e, "this"), "fromY", [_S.binary("+", _S.read(_e, "sx"), 0.5), _S.binary("+", _S.read(_e, "sy"), 0.5)]))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "lx"), 0), func(): return _S.binary(">=", _S.read(_e, "ly"), 0)), func(): return _S.binary("<", _S.read(_e, "lx"), _S.read(_e, "W"))), func(): return _S.binary("<", _S.read(_e, "ly"), _S.read(_e, "H")))

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	if _S.truth(_S.invoke(_S.read(_e, "this"), "inside", [_S.read(_e, "sx"), _S.read(_e, "sy")])):
		_S.invoke(_S.super_value(_S.read(_e, "this")), "put", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "c"), _S.read(_e, "a")])
	return null

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	if _S.truth(_S.invoke(_S.read(_e, "this"), "inside", [_S.read(_e, "sx"), _S.read(_e, "sy")])):
		_S.invoke(_S.super_value(_S.read(_e, "this")), "add", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "c"), _S.read(_e, "k")])
	return null

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	if _S.truth(_S.invoke(_S.read(_e, "this"), "inside", [_S.read(_e, "sx"), _S.read(_e, "sy")])):
		_S.invoke(_S.super_value(_S.read(_e, "this")), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "c"), _S.read(_e, "a")])
	return null

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	return _S.logical("&&", _S.binary("===", _S.prop(_S.read(_e, "p"), "sn"), 0), func(): return _S.binary("===", _S.prop(_S.read(_e, "p"), "cs"), 1))

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	return (_S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.prop(_S.read(_e, "p"), "tx"), 0.5)]) if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "p"), "fx"), 0)) else _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_e, "p"), "tx"), 0.5)]))

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "life", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "end", _S.arg(_args, 2))
	return _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "life"), _S.binary("-", _S.read(_e, "end"), _S.read(_e, "t"))])
