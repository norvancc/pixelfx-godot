@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/pixel-dissolve.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "fbm", _S.import_value("core/index.js", "fbm"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "glint", _S.import_value("fx/transitions/_lib.js", "glint"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "layout", _S.function_value(_e, "_f0"))
	_S.define(_e, "mote", _S.function_value(_e, "_f9"))
	_S.define(_e, "square", _S.function_value(_e, "_f10"))
	_S.define(_e, "draw", _S.function_value(_e, "_f11"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Pixel dissolve"}, {"desc": "Clumps of blocks wink in, each drawn in a white outline that fills black and cools, with glints; then they wink out, outlines collapsing, the last small ones sparkling away."}, {"tags": ["dissolve", "pixel", "blocks", "glint"]}, {"duration": 2.2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "neon")}, {"seed": 1}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "P", 0.17)
	_S.define(_e, "IN0", 0.04)
	_S.define(_e, "IN1", 0.8)
	_S.define(_e, "OUT0", 1.12)
	_S.define(_e, "OUT1", 1.85)
	_S.define(_e, "CELL", 20)
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "seed", _S.arg(_args, 0))
	if _S.truth(_S.invoke(_S.read(_e, "cache"), "has", [_S.read(_e, "seed")])):
		return _S.invoke(_S.read(_e, "cache"), "get", [_S.read(_e, "seed")])
	_S.define(_e, "blocks", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "cy", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "cy"), _S.binary("/", _S.read(_v0, "H"), _S.read(_v0, "CELL")))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "cx", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "cx"), _S.binary("/", _S.read(_v1, "W"), _S.read(_v1, "CELL")))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "h", _S.call_value(_S.read(_v2, "rand"), [_S.read(_v2, "cx"), _S.read(_v2, "cy"), _S.read(_v2, "seed")]))
			_S.define(_v2, "n", (1 if _S.truth(_S.binary("<", _S.read(_v2, "h"), 0.32)) else (2 if _S.truth(_S.binary("<", _S.read(_v2, "h"), 0.74)) else 4)))
			_S.define(_v2, "s", _S.binary("/", _S.read(_v2, "CELL"), _S.read(_v2, "n")))
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v3, "j"), _S.read(_v3, "n"))):
				var _v4 = _S.scope(_v3)
				_S.define(_v4, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v4, "i"), _S.read(_v4, "n"))):
					_S.invoke(_S.read(_v4, "blocks"), "push", [_S.merge([{"x": _S.binary("+", _S.binary("*", _S.read(_v4, "cx"), _S.read(_v4, "CELL")), _S.binary("*", _S.read(_v4, "i"), _S.read(_v4, "s")))}, {"y": _S.binary("+", _S.binary("*", _S.read(_v4, "cy"), _S.read(_v4, "CELL")), _S.binary("*", _S.read(_v4, "j"), _S.read(_v4, "s")))}, {"s": _S.read(_v4, "s")}])])
					_v4 = _S.iteration(_v4)
					_S.write(_v4, "i", 1, "+=", true)
				_v3 = _S.iteration(_v3)
				_S.write(_v3, "j", 1, "+=", true)
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "cx", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "cy", 1, "+=", true)
	_S.define(_e, "rank", _S.function_value(_e, "_f1"))
	_S.define(_e, "at", _S.function_value(_e, "_f5"))
	_S.define(_e, "uin", _S.call_value(_S.read(_e, "rank"), [_S.function_value(_e, "_f6")]))
	_S.define(_e, "uout", _S.call_value(_S.read(_e, "rank"), [_S.function_value(_e, "_f7")]))
	_S.invoke(_S.read(_e, "blocks"), "forEach", [_S.function_value(_e, "_f8")])
	_S.invoke(_S.read(_e, "cache"), "set", [_S.read(_e, "seed"), _S.read(_e, "blocks")])
	return _S.read(_e, "blocks")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "key", _S.arg(_args, 0))
	_S.define(_e, "v", _S.invoke(_S.read(_e, "blocks"), "map", [_S.read(_e, "key")]))
	_S.define(_e, "out", _S.construct(_S.read(_e, "Float32Array"), [_S.prop(_S.read(_e, "v"), "length")]))
	_S.invoke(_S.invoke(_S.invoke(_S.read(_e, "v"), "map", [_S.function_value(_e, "_f2")]), "sort", [_S.function_value(_e, "_f3")]), "forEach", [_S.function_value(_e, "_f4")])
	return _S.read(_e, "out")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.read(_e, "i")

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "v"), _S.read(_e, "a")), _S.prop(_S.read(_e, "v"), _S.read(_e, "b")))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	return _S.set_prop(_S.read(_e, "out"), _S.read(_e, "i"), _S.binary("/", _S.read(_e, "k"), _S.binary("-", _S.prop(_S.read(_e, "v"), "length"), 1)), "=", false)

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	_S.define(_e, "sd", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "fbm"), [_S.binary("/", _S.binary("+", _S.prop(_S.read(_e, "b"), "x"), _S.binary("/", _S.prop(_S.read(_e, "b"), "s"), 2)), 64), _S.binary("/", _S.binary("+", _S.prop(_S.read(_e, "b"), "y"), _S.binary("/", _S.prop(_S.read(_e, "b"), "s"), 2)), 64), _S.read(_e, "sd"), 3])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "b"), _S.read(_e, "seed")]), _S.binary("*", 0.22, _S.call_value(_S.read(_e, "rand"), [_S.prop(_S.read(_e, "b"), "x"), _S.prop(_S.read(_e, "b"), "y"), _S.binary("+", _S.read(_e, "seed"), 1)]))), (0.12 if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "b"), "s"), 20)) else (_S.unary("-", 0.08) if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "b"), "s"), 5)) else 0)))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "b"), _S.binary("+", _S.read(_e, "seed"), 7)]), _S.binary("*", 0.22, _S.call_value(_S.read(_e, "rand"), [_S.prop(_S.read(_e, "b"), "x"), _S.prop(_S.read(_e, "b"), "y"), _S.binary("+", _S.read(_e, "seed"), 2)]))), (_S.unary("-", 0.14) if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "b"), "s"), 20)) else (0.1 if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "b"), "s"), 5)) else 0)))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.set_prop(_S.read(_e, "b"), "tin", _S.binary("+", _S.read(_e, "IN0"), _S.binary("*", _S.prop(_S.read(_e, "uin"), _S.read(_e, "i")), _S.binary("-", _S.read(_e, "IN1"), _S.read(_e, "IN0")))), "=", false)
	_S.set_prop(_S.read(_e, "b"), "tout", _S.binary("+", _S.read(_e, "OUT0"), _S.binary("*", _S.prop(_S.read(_e, "uout"), _S.read(_e, "i")), _S.binary("-", _S.read(_e, "OUT1"), _S.read(_e, "OUT0")))), "=", false)
	_S.set_prop(_S.read(_e, "b"), "glint", _S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.prop(_S.read(_e, "b"), "x"), _S.prop(_S.read(_e, "b"), "y"), _S.binary("+", _S.read(_e, "seed"), 3)]), (0.32 if _S.truth(_S.binary(">=", _S.prop(_S.read(_e, "b"), "s"), 10)) else 0.1)), "=", false)
	_S.set_prop(_S.read(_e, "b"), "gx", _S.binary("+", _S.prop(_S.read(_e, "b"), "x"), (0 if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.prop(_S.read(_e, "b"), "x"), _S.prop(_S.read(_e, "b"), "y"), _S.binary("+", _S.read(_e, "seed"), 4)]), 0.5)) else _S.prop(_S.read(_e, "b"), "s"))), "=", false)
	_S.set_prop(_S.read(_e, "b"), "gy", _S.binary("+", _S.prop(_S.read(_e, "b"), "y"), (0 if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.prop(_S.read(_e, "b"), "x"), _S.prop(_S.read(_e, "b"), "y"), _S.binary("+", _S.read(_e, "seed"), 5)]), 0.5)) else _S.prop(_S.read(_e, "b"), "s"))), "=", false)
	_S.set_prop(_S.read(_e, "b"), "spin", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.prop(_S.read(_e, "b"), "x"), _S.prop(_S.read(_e, "b"), "y"), _S.binary("+", _S.read(_e, "seed"), 6)]), 0.5), 3), "=", false)
	_S.set_prop(_S.read(_e, "b"), "L", (_S.binary("+", 9, _S.binary("*", 6, _S.call_value(_S.read(_e, "rand"), [_S.prop(_S.read(_e, "b"), "x"), _S.prop(_S.read(_e, "b"), "y"), _S.binary("+", _S.read(_e, "seed"), 9)]))) if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_e, "b"), "s"), 20), func(): return _S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.prop(_S.read(_e, "b"), "x"), _S.prop(_S.read(_e, "b"), "y"), _S.binary("+", _S.read(_e, "seed"), 8)]), 0.45))) else _S.binary("+", 2.5, _S.binary("*", _S.prop(_S.read(_e, "b"), "s"), 0.32))), "=", false)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "c", _S.arg(_args, 3))
	_S.define(_e, "cross", _S.arg(_args, 4))
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "c")])
	if _S.truth(_S.read(_e, "cross")):
		for _v5 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
			var _v6 = _S.scope(_e)
			var _v7 = _v5
			_S.define(_v6, "dx", _S.prop(_v7, 0))
			_S.define(_v6, "dy", _S.prop(_v7, 1))
			_S.invoke(_S.read(_v6, "p"), "px", [_S.binary("+", _S.read(_v6, "x"), _S.read(_v6, "dx")), _S.binary("+", _S.read(_v6, "y"), _S.read(_v6, "dy")), _S.read(_v6, "c")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "s", _S.arg(_args, 3))
	_S.define(_e, "fill", _S.arg(_args, 4))
	_S.define(_e, "rim", _S.arg(_args, 5))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.define(_e, "S", _S.invoke(_S.read(_e, "Math"), "max", [1, _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "s")])]))
	if _S.truth(_S.read(_e, "fill")):
		_S.call_value(_S.read(_e, "rect"), [_S.read(_e, "p"), _S.read(_e, "X"), _S.read(_e, "Y"), _S.read(_e, "S"), _S.read(_e, "S"), _S.read(_e, "fill")])
	if _S.truth(_S.logical("&&", _S.read(_e, "rim"), func(): return _S.binary(">", _S.read(_e, "S"), 2))):
		_S.last([_S.call_value(_S.read(_e, "rect"), [_S.read(_e, "p"), _S.read(_e, "X"), _S.read(_e, "Y"), _S.read(_e, "S"), 1, _S.read(_e, "rim")]), _S.call_value(_S.read(_e, "rect"), [_S.read(_e, "p"), _S.read(_e, "X"), _S.binary("-", _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "S")), 1), _S.read(_e, "S"), 1, _S.read(_e, "rim")]), _S.call_value(_S.read(_e, "rect"), [_S.read(_e, "p"), _S.read(_e, "X"), _S.read(_e, "Y"), 1, _S.read(_e, "S"), _S.read(_e, "rim")]), _S.call_value(_S.read(_e, "rect"), [_S.read(_e, "p"), _S.binary("-", _S.binary("+", _S.read(_e, "X"), _S.read(_e, "S")), 1), _S.read(_e, "Y"), 1, _S.read(_e, "S"), _S.read(_e, "rim")])])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p0", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ink", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "color")]))
	_S.define(_e, "p", _S.call_value(_S.read(_e, "clipTo"), [_S.read(_e, "p0")]))
	_S.define(_e, "blocks", _S.call_value(_S.read(_e, "layout"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "glints", [])
	_S.define(_e, "frame", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 15)]))
	var _v8 = _S.scope(_e)
	_S.define(_v8, "n", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "n"), _S.prop(_S.read(_v8, "blocks"), "length"))):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "b", _S.prop(_S.read(_v9, "blocks"), _S.read(_v9, "n")))
		_S.define(_v9, "ki", _S.binary("/", _S.binary("-", _S.read(_v9, "t"), _S.prop(_S.read(_v9, "b"), "tin")), _S.read(_v9, "P")))
		_S.define(_v9, "ko", _S.binary("/", _S.binary("-", _S.read(_v9, "t"), _S.prop(_S.read(_v9, "b"), "tout")), _S.read(_v9, "P")))
		var _v10 = _S.read(_v9, "b")
		_S.define(_v9, "x", _S.prop(_v10, "x"))
		_S.define(_v9, "y", _S.prop(_v10, "y"))
		_S.define(_v9, "s", _S.prop(_v10, "s"))
		_S.define(_v9, "cx", _S.binary("+", _S.read(_v9, "x"), _S.binary("/", _S.read(_v9, "s"), 2)))
		_S.define(_v9, "cy", _S.binary("+", _S.read(_v9, "y"), _S.binary("/", _S.read(_v9, "s"), 2)))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v9, "ki"), 0), func(): return _S.binary(">=", _S.read(_v9, "ko"), 1.6))):
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "n", 1, "+=", true)
			continue
		if _S.truth(_S.binary("<", _S.read(_v9, "ko"), 0)):
			var _v11 = _S.scope(_v9)
			if _S.truth(_S.binary(">=", _S.read(_v11, "ki"), 1)):
				_S.call_value(_S.read(_v11, "square"), [_S.read(_v11, "p0"), _S.read(_v11, "x"), _S.read(_v11, "y"), _S.read(_v11, "s"), _S.read(_v11, "ink")])
			else:
				var _v12 = _S.scope(_v11)
				_S.define(_v12, "g", (_S.binary("+", 0.35, _S.binary("*", 0.65, _S.invoke(_S.read(_v12, "ease"), "outBack", [_S.binary("/", _S.read(_v12, "ki"), 0.35)]))) if _S.truth(_S.binary("<", _S.read(_v12, "ki"), 0.35)) else 1))
				_S.define(_v12, "h", _S.binary("*", _S.read(_v12, "s"), _S.read(_v12, "g")))
				_S.define(_v12, "rim", (_S.read(_v12, "WHITE") if _S.truth(_S.binary("<", _S.read(_v12, "ki"), 0.45)) else (_S.prop(_S.read(_v12, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v12, "ki"), 0.6)) else (_S.prop(_S.read(_v12, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v12, "ki"), 0.75)) else (_S.prop(_S.read(_v12, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v12, "ki"), 0.9)) else _S.prop(_S.read(_v12, "C"), 3))))))
				_S.call_value(_S.read(_v12, "square"), [_S.read(_v12, "p"), _S.binary("-", _S.read(_v12, "cx"), _S.binary("/", _S.read(_v12, "h"), 2)), _S.binary("-", _S.read(_v12, "cy"), _S.binary("/", _S.read(_v12, "h"), 2)), _S.read(_v12, "h"), (_S.read(_v12, "ink") if _S.truth(_S.binary(">", _S.read(_v12, "ki"), 0.2)) else 0), _S.read(_v12, "rim")])
				if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v12, "ki"), 0.3), func(): return _S.binary(">=", _S.read(_v12, "s"), 10))):
					for _v13 in _S.array([[0, 0], [1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
						var _v14 = _S.scope(_v12)
						var _v15 = _v13
						_S.define(_v14, "dx", _S.prop(_v15, 0))
						_S.define(_v14, "dy", _S.prop(_v15, 1))
						_S.invoke(_S.read(_v14, "p"), "px", [_S.binary("+", _S.binary("-", _S.read(_v14, "cx"), 0.5), _S.read(_v14, "dx")), _S.binary("+", _S.binary("-", _S.read(_v14, "cy"), 0.5), _S.read(_v14, "dy")), (_S.prop(_S.read(_v14, "C"), 6) if _S.truth(_S.logical("||", _S.read(_v14, "dx"), func(): return _S.read(_v14, "dy"))) else _S.read(_v14, "WHITE"))])
				_S.invoke(_S.read(_v12, "p"), "glow", [_S.read(_v12, "cx"), _S.read(_v12, "cy"), _S.binary("+", _S.binary("*", _S.read(_v12, "s"), 0.8), 4), _S.prop(_S.read(_v12, "C"), 5), _S.binary("*", 0.45, _S.binary("-", 1, _S.read(_v12, "ki")))])
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v11, "b"), "glint"), func(): return _S.binary(">", _S.read(_v11, "ki"), 0.15)), func(): return _S.binary("<", _S.read(_v11, "ki"), 1.6))):
				_S.invoke(_S.read(_v11, "glints"), "push", [[_S.read(_v11, "b"), _S.binary("/", _S.binary("-", _S.read(_v11, "ki"), 0.15), 1.45), 1]])
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v11, "ki"), 1.4), func(): return _S.binary("<", _S.call_value(_S.read(_v11, "rand"), [_S.read(_v11, "frame"), _S.read(_v11, "n"), 9]), 0.35))):
				_S.call_value(_S.read(_v11, "mote"), [_S.read(_v11, "p"), _S.binary("-", _S.binary("+", _S.read(_v11, "x"), _S.binary("*", _S.call_value(_S.read(_v11, "rand"), [_S.read(_v11, "frame"), _S.read(_v11, "n"), 10]), _S.binary("+", _S.read(_v11, "s"), 6))), 3), _S.binary("-", _S.binary("+", _S.read(_v11, "y"), _S.binary("*", _S.call_value(_S.read(_v11, "rand"), [_S.read(_v11, "frame"), _S.read(_v11, "n"), 11]), _S.binary("+", _S.read(_v11, "s"), 6))), 3), (_S.read(_v11, "WHITE") if _S.truth(_S.binary("<", _S.call_value(_S.read(_v11, "rand"), [_S.read(_v11, "frame"), _S.read(_v11, "n"), 12]), 0.5)) else _S.prop(_S.read(_v11, "C"), 6)), _S.binary("<", _S.call_value(_S.read(_v11, "rand"), [_S.read(_v11, "frame"), _S.read(_v11, "n"), 17]), 0.25)])
		else:
			var _v16 = _S.scope(_v9)
			if _S.truth(_S.binary("<", _S.read(_v16, "ko"), 0.35)):
				var _v17 = _S.scope(_v16)
				_S.define(_v17, "q", _S.binary("/", _S.read(_v17, "ko"), 0.35))
				_S.call_value(_S.read(_v17, "square"), [_S.read(_v17, "p0"), _S.read(_v17, "x"), _S.read(_v17, "y"), _S.read(_v17, "s"), _S.read(_v17, "ink"), (_S.prop(_S.read(_v17, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v17, "q"), 0.4)) else (_S.prop(_S.read(_v17, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v17, "q"), 0.75)) else _S.prop(_S.read(_v17, "C"), 6)))])
				_S.invoke(_S.read(_v17, "p"), "glow", [_S.read(_v17, "cx"), _S.read(_v17, "cy"), _S.binary("+", _S.binary("*", _S.read(_v17, "s"), 0.8), 3), _S.prop(_S.read(_v17, "C"), 4), _S.binary("*", 0.35, _S.read(_v17, "q"))])
			else:
				if _S.truth(_S.binary("<", _S.read(_v16, "ko"), 0.75)):
					var _v18 = _S.scope(_v16)
					_S.define(_v18, "q", _S.binary("/", _S.binary("-", _S.read(_v18, "ko"), 0.35), 0.4))
					_S.define(_v18, "h", _S.binary("*", _S.read(_v18, "s"), _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_v18, "ease"), "inQuad", [_S.read(_v18, "q")]), 0.85))))
					_S.call_value(_S.read(_v18, "square"), [_S.read(_v18, "p"), _S.binary("-", _S.read(_v18, "cx"), _S.binary("/", _S.read(_v18, "h"), 2)), _S.binary("-", _S.read(_v18, "cy"), _S.binary("/", _S.read(_v18, "h"), 2)), _S.read(_v18, "h"), 0, (_S.read(_v18, "WHITE") if _S.truth(_S.binary("<", _S.read(_v18, "q"), 0.5)) else _S.prop(_S.read(_v18, "C"), 6))])
					_S.invoke(_S.read(_v18, "p"), "glow", [_S.read(_v18, "cx"), _S.read(_v18, "cy"), _S.binary("+", _S.binary("*", _S.read(_v18, "s"), 0.8), 4), _S.prop(_S.read(_v18, "C"), 5), _S.binary("*", 0.45, _S.binary("-", 1, _S.binary("*", _S.read(_v18, "q"), 0.5)))])
				else:
					if _S.truth(_S.binary("<", _S.read(_v16, "ko"), 1)):
						var _v19 = _S.scope(_v16)
						_S.define(_v19, "q", _S.binary("/", _S.binary("-", _S.read(_v19, "ko"), 0.75), 0.25))
						for _v20 in _S.array([[0, 0], [1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
							var _v21 = _S.scope(_v19)
							var _v22 = _v20
							_S.define(_v21, "dx", _S.prop(_v22, 0))
							_S.define(_v21, "dy", _S.prop(_v22, 1))
							if _S.truth(_S.logical("||", _S.unary("!", _S.logical("||", _S.read(_v21, "dx"), func(): return _S.read(_v21, "dy"))), func(): return _S.binary("<", _S.read(_v21, "q"), 0.5))):
								_S.invoke(_S.read(_v21, "p"), "px", [_S.binary("+", _S.binary("-", _S.read(_v21, "cx"), 0.5), _S.read(_v21, "dx")), _S.binary("+", _S.binary("-", _S.read(_v21, "cy"), 0.5), _S.read(_v21, "dy")), (_S.prop(_S.read(_v21, "C"), 6) if _S.truth(_S.logical("||", _S.read(_v21, "dx"), func(): return _S.read(_v21, "dy"))) else _S.read(_v21, "WHITE"))])
						_S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "cx"), _S.read(_v19, "cy"), _S.binary("+", _S.binary("*", _S.read(_v19, "s"), 0.5), 3), _S.prop(_S.read(_v19, "C"), 5), _S.binary("*", 0.35, _S.binary("-", 1, _S.read(_v19, "q")))])
			if _S.truth(_S.logical("&&", _S.prop(_S.read(_v16, "b"), "glint"), func(): return _S.binary(">", _S.read(_v16, "ko"), 0.3))):
				_S.invoke(_S.read(_v16, "glints"), "push", [[_S.read(_v16, "b"), _S.binary("/", _S.binary("-", _S.read(_v16, "ko"), 0.3), 1.3), _S.unary("-", 1)]])
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v16, "ko"), 0.3), func(): return _S.binary("<", _S.read(_v16, "ko"), 1.5)), func(): return _S.binary("<", _S.call_value(_S.read(_v16, "rand"), [_S.read(_v16, "frame"), _S.read(_v16, "n"), 13]), 0.3))):
				_S.call_value(_S.read(_v16, "mote"), [_S.read(_v16, "p"), _S.binary("-", _S.binary("+", _S.read(_v16, "x"), _S.binary("*", _S.call_value(_S.read(_v16, "rand"), [_S.read(_v16, "frame"), _S.read(_v16, "n"), 14]), _S.binary("+", _S.read(_v16, "s"), 6))), 3), _S.binary("-", _S.binary("+", _S.read(_v16, "y"), _S.binary("*", _S.call_value(_S.read(_v16, "rand"), [_S.read(_v16, "frame"), _S.read(_v16, "n"), 15]), _S.binary("+", _S.read(_v16, "s"), 6))), 3), (_S.read(_v16, "WHITE") if _S.truth(_S.binary("<", _S.call_value(_S.read(_v16, "rand"), [_S.read(_v16, "frame"), _S.read(_v16, "n"), 16]), 0.5)) else _S.prop(_S.read(_v16, "C"), 6)), _S.binary("<", _S.call_value(_S.read(_v16, "rand"), [_S.read(_v16, "frame"), _S.read(_v16, "n"), 18]), 0.25)])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "n", 1, "+=", true)
	for _v23 in _S.array(_S.read(_e, "glints")):
		var _v24 = _S.scope(_e)
		var _v25 = _v23
		_S.define(_v24, "b", _S.prop(_v25, 0))
		_S.define(_v24, "u", _S.prop(_v25, 1))
		_S.define(_v24, "dir", _S.prop(_v25, 2))
		var _v26 = _S.scope(_v24)
		if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v26, "u"), 0), func(): return _S.binary(">=", _S.read(_v26, "u"), 1))):
			continue
		_S.define(_v26, "L", _S.binary("*", _S.prop(_S.read(_v26, "b"), "L"), _S.invoke(_S.read(_v26, "Math"), "pow", [_S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v26, "Math"), "PI"), _S.read(_v26, "u"))]), 0.7])))
		_S.call_value(_S.read(_v26, "glint"), [_S.read(_v26, "p"), _S.prop(_S.read(_v26, "b"), "gx"), _S.prop(_S.read(_v26, "b"), "gy"), _S.read(_v26, "L"), _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "b"), "spin"), _S.read(_v26, "u")), _S.read(_v26, "dir")), 0.4), _S.prop(_S.read(_v26, "C"), 5), _S.prop(_S.read(_v26, "C"), 4)])
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v26, "b"), "L"), 8)):
			_S.invoke(_S.read(_v26, "p"), "glow", [_S.prop(_S.read(_v26, "b"), "gx"), _S.prop(_S.read(_v26, "b"), "gy"), _S.binary("+", 18, _S.read(_v26, "L")), _S.prop(_S.read(_v26, "C"), 5), _S.binary("*", 0.25, _S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v26, "Math"), "PI"), _S.read(_v26, "u"))]))])
	return null
