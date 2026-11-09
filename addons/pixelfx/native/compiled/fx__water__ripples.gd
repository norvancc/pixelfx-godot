@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/ripples.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "ring", _S.import_value("fx/water/_lib.js", "ring"))
	_S.define(_e, "alive", _S.function_value(_e, "_f0"))
	_S.define(_e, "surface", _S.function_value(_e, "_f1"))
	_S.define(_e, "rings", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Ripples"}, {"desc": "A drop plinks on still dark water and rings spread out across it at a low angle: the swell of each ring catches the light, crests glint, and they fade into the calm."}, {"tags": ["water", "ripples", "rings", "surface", "pond", "ambient", "loop"]}, {"size": [136, 52]}, {"origin": [68, 30]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SY", 0.26)
	_S.define(_e, "EVERY", 0.5)
	_S.define(_e, "LIFE", 2)
	_S.define(_e, "RMAX", 60)
	_S.define(_e, "PATCH", 64)
	_S.define(_e, "radius", _S.function_value(_e, "_f8"))
	_S.define(_e, "power", _S.function_value(_e, "_f9"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "out", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "k", 0)
	while _S.truth(_S.binary("<", _S.binary("*", _S.read(_v0, "k"), _S.read(_v0, "EVERY")), _S.read(_v0, "LIFE"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v1, "t"), _S.binary("*", _S.read(_v1, "k"), _S.read(_v1, "EVERY"))), _S.read(_v1, "D")), _S.read(_v1, "D")), _S.read(_v1, "D")))
		if _S.truth(_S.binary("<", _S.read(_v1, "a"), _S.read(_v1, "LIFE"))):
			_S.invoke(_S.read(_v1, "out"), "push", [[_S.read(_v1, "a"), _S.invoke(_S.read(_v1, "Math"), "round", [_S.binary("/", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v1, "t"), _S.read(_v1, "a")), _S.read(_v1, "D")), _S.read(_v1, "D")), _S.read(_v1, "D")), _S.read(_v1, "EVERY"))])]])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "k", 1, "+=", true)
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "rs", _S.invoke(_S.call_value(_S.read(_e, "alive"), [_S.read(_e, "t")]), "map", [_S.function_value(_e, "_f2")]))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "Y", _S.invoke(_S.read(_v3, "Math"), "floor", [_S.binary("*", _S.unary("-", _S.read(_v3, "PATCH")), _S.read(_v3, "SY"))]))
	while _S.truth(_S.binary("<", _S.read(_v3, "Y"), _S.binary("*", _S.read(_v3, "PATCH"), _S.read(_v3, "SY")))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "X", _S.unary("-", _S.read(_v4, "PATCH")))
		while _S.truth(_S.binary("<", _S.read(_v4, "X"), _S.read(_v4, "PATCH"))):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "x", _S.binary("+", _S.read(_v5, "X"), 0.5))
			_S.define(_v5, "y", _S.binary("+", _S.read(_v5, "Y"), 0.5))
			_S.define(_v5, "z", _S.binary("/", _S.read(_v5, "y"), _S.read(_v5, "SY")))
			_S.define(_v5, "r", _S.invoke(_S.read(_v5, "Math"), "hypot", [_S.read(_v5, "x"), _S.read(_v5, "z")]))
			_S.define(_v5, "e", _S.binary("/", _S.read(_v5, "r"), _S.read(_v5, "PATCH")))
			if _S.truth(_S.binary(">", _S.read(_v5, "e"), 1)):
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "X", 1, "+=", true)
				continue
			_S.define(_v5, "edge", _S.binary("-", 1, _S.call_value(_S.read(_v5, "smooth"), [0.6, 1, _S.read(_v5, "e")])))
			_S.invoke(_S.read(_v5, "p"), "blend", [_S.read(_v5, "x"), _S.read(_v5, "y"), _S.prop(_S.read(_v5, "C"), 1), _S.binary("*", 0.55, _S.read(_v5, "edge"))])
			_S.define(_v5, "slope", 0)
			for _v6 in _S.array(_S.read(_v5, "rs")):
				var _v7 = _S.scope(_v5)
				var _v8 = _v6
				_S.define(_v7, "R", _S.prop(_v8, 0))
				_S.define(_v7, "k", _S.prop(_v8, 1))
				_S.define(_v7, "w", _S.prop(_v8, 2))
				var _v9 = _S.scope(_v7)
				_S.define(_v9, "d", _S.binary("-", _S.read(_v9, "r"), _S.read(_v9, "R")))
				if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v9, "d"), _S.binary("*", 2.2, _S.read(_v9, "w"))), func(): return _S.binary("<", _S.read(_v9, "d"), _S.binary("*", _S.unary("-", 2.2), _S.read(_v9, "w"))))):
					continue
				_S.write(_v9, "slope", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v9, "k"), _S.invoke(_S.read(_v9, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.read(_v9, "d"), _S.read(_v9, "w")), 2))])), _S.unary("-", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.binary("*", _S.read(_v9, "d"), 1.15)]))), 1.15), "+=", false)
			if _S.truth(_S.binary("===", _S.read(_v5, "slope"), 0)):
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "X", 1, "+=", true)
				continue
			_S.define(_v5, "face", _S.binary("*", _S.read(_v5, "slope"), _S.binary("/", _S.unary("-", _S.binary("+", _S.binary("*", _S.read(_v5, "x"), _S.unary("-", 0.55)), _S.binary("*", _S.read(_v5, "z"), _S.unary("-", 0.84)))), _S.invoke(_S.read(_v5, "Math"), "max", [1, _S.read(_v5, "r")]))))
			if _S.truth(_S.binary(">", _S.read(_v5, "face"), 0.18)):
				_S.invoke(_S.read(_v5, "p"), "blend", [_S.read(_v5, "x"), _S.read(_v5, "y"), (_S.prop(_S.read(_v5, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v5, "face"), 0.6)) else _S.prop(_S.read(_v5, "C"), 4)), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "min", [0.9, _S.binary("*", _S.binary("-", _S.read(_v5, "face"), 0.18), 2.2)]), _S.read(_v5, "edge"))])
			else:
				if _S.truth(_S.binary("<", _S.read(_v5, "face"), _S.unary("-", 0.25))):
					_S.invoke(_S.read(_v5, "p"), "blend", [_S.read(_v5, "x"), _S.read(_v5, "y"), _S.prop(_S.read(_v5, "C"), 0), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "min", [0.8, _S.binary("*", _S.binary("-", _S.unary("-", _S.read(_v5, "face")), 0.25), 2)]), _S.read(_v5, "edge"))])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "X", 1, "+=", true)
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "Y", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v2 = _S.arg(_args, 0)
	_S.define(_e, "a", _S.prop(_v2, 0))
	return [_S.call_value(_S.read(_e, "radius"), [_S.read(_e, "a")]), _S.call_value(_S.read(_e, "power"), [_S.read(_e, "a")]), _S.binary("+", 3, _S.binary("*", _S.read(_e, "a"), 2.2))]

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "half", _S.arg(_args, 3))
	for _v10 in _S.array(_S.call_value(_S.read(_e, "alive"), [_S.read(_e, "t")])):
		var _v11 = _S.scope(_e)
		var _v12 = _v10
		_S.define(_v11, "a", _S.prop(_v12, 0))
		_S.define(_v11, "i", _S.prop(_v12, 1))
		var _v13 = _S.scope(_v11)
		_S.define(_v13, "R", _S.call_value(_S.read(_v13, "radius"), [_S.read(_v13, "a")]))
		_S.define(_v13, "k", _S.call_value(_S.read(_v13, "power"), [_S.read(_v13, "a")]))
		_S.call_value(_S.read(_v13, "ring"), [_S.read(_v13, "p"), 0, 0, _S.read(_v13, "R"), _S.read(_v13, "SY"), _S.binary("*", 0.85, _S.read(_v13, "k")), _S.read(_v13, "C"), _S.merge([{"n": 2}, {"gap": _S.binary("+", 3, _S.binary("*", _S.read(_v13, "a"), 1.4))}, {"half": _S.read(_v13, "half")}, {"hot": _S.binary("<", _S.read(_v13, "a"), 0.14)}, {"glint": (_S.read(_v13, "k") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v13, "half"), 0), func(): return _S.binary(">", _S.read(_v13, "a"), 0.1))) else 0)}, {"seed": _S.binary("+", _S.read(_v13, "i"), 1)}, {"wob": _S.binary("+", 0.4, _S.binary("*", _S.read(_v13, "a"), 1.1))}])])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.call_value(_S.read(_e, "surface"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t")])
	_S.call_value(_S.read(_e, "rings"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.unary("-", 1)])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.call_value(_S.read(_e, "rings"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), 1])
	for _v14 in _S.array(_S.call_value(_S.read(_e, "alive"), [_S.read(_e, "t")])):
		var _v15 = _S.scope(_e)
		var _v16 = _v14
		_S.define(_v15, "a", _S.prop(_v16, 0))
		var _v17 = _S.scope(_v15)
		if _S.truth(_S.binary("<", _S.read(_v17, "a"), 0.08)):
			var _v18 = _S.scope(_v17)
			_S.invoke(_S.read(_v18, "p"), "px", [0, 0, _S.read(_v18, "WHITE")])
			_S.invoke(_S.read(_v18, "p"), "px", [_S.unary("-", 1), 0, _S.prop(_S.read(_v18, "C"), 6)])
			_S.invoke(_S.read(_v18, "p"), "px", [1, 0, _S.prop(_S.read(_v18, "C"), 6)])
			_S.invoke(_S.read(_v18, "p"), "glow", [0, 0, 8, _S.prop(_S.read(_v18, "C"), 5), _S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.read(_v18, "a"), 0.08)))])
		_S.define(_v17, "b", _S.binary("-", _S.read(_v17, "a"), 0.04))
		_S.define(_v17, "h", _S.binary("-", _S.binary("*", 90, _S.read(_v17, "b")), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, 700), _S.read(_v17, "b")), _S.read(_v17, "b"))))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v17, "b"), 0), func(): return _S.binary(">", _S.read(_v17, "h"), 0))):
			var _v19 = _S.scope(_v17)
			_S.invoke(_S.read(_v19, "p"), "px", [0, _S.unary("-", _S.read(_v19, "h")), _S.read(_v19, "WHITE")])
			_S.invoke(_S.read(_v19, "p"), "px", [0, _S.binary("+", _S.unary("-", _S.read(_v19, "h")), 1), _S.prop(_S.read(_v19, "C"), 5)])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 10, _S.binary("+", _S.read(_e, "S"), 5), _S.function_value(_e, "_f6"), _S.function_value(_e, "_f7")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, 40, _S.prop(_S.read(_e, "C"), 4), 0.14])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, 14, _S.prop(_S.read(_e, "C"), 5), 0.12])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.25, 0.45])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "all", _S.call_value(_S.read(_e, "alive"), [_S.read(_e, "t")]))
	var _v20 = _S.logical("??", _S.prop(_S.read(_e, "all"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), _S.prop(_S.read(_e, "all"), "length"))])), func(): return [0])
	_S.define(_e, "a", _S.prop(_v20, 0))
	_S.define(_e, "ang", _S.invoke(_S.read(_e, "r"), "range", [0.3, _S.binary("-", _S.prop(_S.read(_e, "Math"), "PI"), 0.3)]))
	_S.define(_e, "R", _S.call_value(_S.read(_e, "radius"), [_S.read(_e, "a")]))
	_S.define(_e, "k", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "age")), _S.read(_e, "life"))]), _S.call_value(_S.read(_e, "power"), [_S.read(_e, "a")])))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "k"), 0.15), func(): return _S.binary("<", _S.read(_e, "R"), 6))):
		return null
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]), _S.read(_e, "R")))
	_S.define(_e, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]), _S.read(_e, "R")), _S.read(_e, "SY")))
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "WHITE")])
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.5)):
		for _v21 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
			var _v22 = _S.scope(_e)
			var _v23 = _v21
			_S.define(_v22, "dx", _S.prop(_v23, 0))
			_S.define(_v22, "dy", _S.prop(_v23, 1))
			_S.invoke(_S.read(_v22, "p"), "px", [_S.binary("+", _S.read(_v22, "x"), _S.read(_v22, "dx")), _S.binary("+", _S.read(_v22, "y"), _S.read(_v22, "dy")), _S.prop(_S.read(_v22, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 5, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.4, _S.read(_e, "k"))])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.binary("+", 2, _S.binary("*", _S.binary("-", _S.read(_e, "RMAX"), 2), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.binary("/", _S.read(_e, "a"), _S.read(_e, "LIFE"))])))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.read(_e, "a"), _S.read(_e, "LIFE"))), 1.5]), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "a"), 0.08)]))
