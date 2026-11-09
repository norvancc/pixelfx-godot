@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/shadow-flames.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "noise2", _S.import_value("core/index.js", "noise2"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Shadow flames"}, {"desc": "Inside-out fire on the floor: a black heart wrapped in violet flame with pale skin and tips, shedding embers and dark smoke."}, {"tags": ["shadow", "fire", "flame", "ground", "dark", "magic", "loop"]}, {"size": [104, 112]}, {"origin": [52, 102]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"seed": 12}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 2.4)
	_S.define(_e, "GX", 22)
	_S.define(_e, "GY", 60)
	_S.define(_e, "TONGUES", [[_S.unary("-", 11), 20, 4.2, 1], [11, 22, 4.4, 2], [_S.unary("-", 6), 31, 5.4, 3], [6, 29, 5.2, 4], [0, 40, 6.6, 5]])
	_S.define(_e, "LAYERS", [[1, 1, 0], [0.8, 0.88, 1], [0.54, 0.68, 2], [0.32, 0.48, 3]])
	_S.define(_e, "lnoise", _S.function_value(_e, "_f13"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.invoke(_S.read(_e, "p"), "ellipse", [0, 0.5, 22, 3.2, _S.function_value(_e, "_f1"), _S.function_value(_e, "_f2")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 2), 46, _S.prop(_S.read(_e, "C"), 4), 0.3])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 14, _S.binary("+", _S.read(_e, "S"), 1), _S.function_value(_e, "_f3"), _S.function_value(_e, "_f4")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 0) if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.6)) else _S.prop(_S.read(_e, "C"), 1))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.85)) else _S.binary("*", _S.binary("-", 1, _S.read(_e, "d")), 6))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.2, 1.9])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "L")))
	_S.define(_e, "x", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 6), 6]), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "u"), 4), _S.invoke(_S.read(_e, "r"), "range", [0, 6]))]), 5), _S.read(_e, "u"))))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", 30), _S.binary("*", _S.read(_e, "u"), _S.invoke(_S.read(_e, "r"), "range", [36, 52]))))
	_S.define(_e, "rad", _S.binary("+", 3, _S.binary("*", _S.read(_e, "u"), 6)))
	_S.define(_e, "a", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "u"), 6)]), _S.binary("-", 1, _S.read(_e, "u"))), 0.7))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "rad"), _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), 0.5]), _S.prop(_S.read(_e, "C"), 1), _S.read(_e, "u")]), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "rad"), 0.2)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "rad"), 0.3)), _S.binary("*", _S.read(_e, "rad"), 0.5), _S.prop(_S.read(_e, "C"), 3), _S.binary("*", _S.read(_e, "a"), 0.4)])
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "rad"), 0.45)), _S.binary("*", _S.read(_e, "rad"), 0.55), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", _S.binary("*", _S.read(_e, "a"), 0.45), _S.binary("-", 1, _S.read(_e, "u")))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "TONE", [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 0)])
	_S.define(_e, "grid", _S.invoke(_S.construct(_S.read(_e, "Int8Array"), [_S.binary("*", _S.binary("*", _S.read(_e, "GX"), 2), _S.read(_e, "GY"))]), "fill", [_S.unary("-", 1)]))
	_S.define(_e, "set", _S.function_value(_e, "_f6"))
	_S.define(_e, "order", _S.invoke(_S.invoke(_S.read(_e, "TONGUES"), "map", [_S.function_value(_e, "_f7")]), "sort", [_S.function_value(_e, "_f8")]))
	for _v0 in _S.array(_S.read(_e, "order")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "i", _v0)
		var _v2 = _S.scope(_v1)
		var _v3 = _S.prop(_S.read(_v2, "TONGUES"), _S.read(_v2, "i"))
		_S.define(_v2, "dx", _S.prop(_v3, 0))
		_S.define(_v2, "H0", _S.prop(_v3, 1))
		_S.define(_v2, "w", _S.prop(_v3, 2))
		_S.define(_v2, "n", _S.prop(_v3, 3))
		_S.define(_v2, "h", _S.binary("*", _S.read(_v2, "H0"), _S.binary("+", 0.78, _S.binary("*", 0.22, _S.call_value(_S.read(_v2, "lnoise"), [_S.read(_v2, "t"), _S.binary("*", _S.read(_v2, "n"), 3), _S.read(_v2, "n"), 4])))))
		_S.define(_v2, "sway", _S.binary("*", _S.call_value(_S.read(_v2, "lnoise"), [_S.read(_v2, "t"), _S.binary("*", _S.read(_v2, "n"), 7), _S.binary("+", _S.read(_v2, "n"), 9), 3]), 3))
		for _v4 in _S.array(_S.read(_v2, "LAYERS")):
			var _v5 = _S.scope(_v2)
			var _v6 = _v4
			_S.define(_v5, "lw", _S.prop(_v6, 0))
			_S.define(_v5, "lh", _S.prop(_v6, 1))
			_S.define(_v5, "tone", _S.prop(_v6, 2))
			var _v7 = _S.scope(_v5)
			_S.define(_v7, "Hl", _S.binary("*", _S.read(_v7, "h"), _S.read(_v7, "lh")))
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "r", 0)
			while _S.truth(_S.binary("<=", _S.read(_v8, "r"), _S.read(_v8, "Hl"))):
				var _v9 = _S.scope(_v8)
				_S.define(_v9, "u", _S.binary("/", _S.read(_v9, "r"), _S.invoke(_S.read(_v9, "Math"), "max", [1, _S.read(_v9, "Hl")])))
				_S.define(_v9, "half", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v9, "w"), _S.read(_v9, "lw")), _S.invoke(_S.read(_v9, "Math"), "pow", [_S.binary("-", 1, _S.read(_v9, "u")), 0.85])), _S.invoke(_S.read(_v9, "Math"), "min", [1, _S.binary("/", _S.binary("+", _S.read(_v9, "r"), 1.5), 3.5)])), _S.binary("*", _S.call_value(_S.read(_v9, "lnoise"), [_S.read(_v9, "t"), _S.binary("+", _S.binary("*", _S.read(_v9, "r"), 0.45), _S.read(_v9, "n")), _S.binary("+", _S.read(_v9, "n"), 20), 6]), 1.1)), _S.binary("*", _S.call_value(_S.read(_v9, "lnoise"), [_S.read(_v9, "t"), _S.binary("+", _S.binary("*", _S.read(_v9, "r"), 1.3), _S.binary("*", _S.read(_v9, "n"), 5)), _S.binary("+", _S.read(_v9, "n"), 50), 9]), 0.6)))
				_S.define(_v9, "cx", _S.binary("+", _S.binary("+", _S.read(_v9, "dx"), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v9, "sway"), _S.read(_v9, "u")), _S.read(_v9, "u")), _S.read(_v9, "lh"))), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v9, "lnoise"), [_S.read(_v9, "t"), _S.binary("+", _S.binary("*", _S.read(_v9, "r"), 0.2), _S.binary("*", _S.read(_v9, "n"), 2)), _S.binary("+", _S.read(_v9, "n"), 30), 5]), _S.read(_v9, "u")), 1.4)))
				if _S.truth(_S.binary("<", _S.read(_v9, "half"), 0.3)):
					_v8 = _S.iteration(_v8)
					_S.write(_v8, "r", 1, "+=", true)
					continue
				var _v10 = _S.scope(_v9)
				_S.define(_v10, "x", _S.invoke(_S.read(_v10, "Math"), "round", [_S.binary("-", _S.read(_v10, "cx"), _S.read(_v10, "half"))]))
				while _S.truth(_S.binary("<=", _S.read(_v10, "x"), _S.invoke(_S.read(_v10, "Math"), "round", [_S.binary("+", _S.read(_v10, "cx"), _S.read(_v10, "half"))]))):
					var _v11 = _S.scope(_v10)
					if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("===", _S.read(_v11, "tone"), 0), func(): return _S.binary(">", _S.read(_v11, "u"), 0.45)), func(): return _S.binary(">", _S.call_value(_S.read(_v11, "lnoise"), [_S.read(_v11, "t"), _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v11, "x"), 0.9), _S.binary("*", _S.read(_v11, "r"), 0.7)), _S.read(_v11, "n")), _S.binary("+", _S.read(_v11, "n"), 60), 8]), 0.35))):
						_v10 = _S.iteration(_v10)
						_S.write(_v10, "x", 1, "+=", true)
						continue
					_S.call_value(_S.read(_v11, "set"), [_S.read(_v11, "x"), _S.unary("-", _S.read(_v11, "r")), _S.read(_v11, "tone")])
					_v10 = _S.iteration(_v10)
					_S.write(_v10, "x", 1, "+=", true)
				_v8 = _S.iteration(_v8)
				_S.write(_v8, "r", 1, "+=", true)
	var _v12 = _S.scope(_e)
	_S.define(_v12, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "j"), _S.read(_v12, "GY"))):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), _S.binary("*", _S.read(_v13, "GX"), 2))):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "v", _S.prop(_S.read(_v14, "grid"), _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v14, "j"), _S.read(_v14, "GX")), 2), _S.read(_v14, "i"))))
			if _S.truth(_S.binary("<", _S.read(_v14, "v"), 0)):
				_v13 = _S.iteration(_v13)
				_S.write(_v13, "i", 1, "+=", true)
				continue
			_S.define(_v14, "x", _S.binary("-", _S.read(_v14, "i"), _S.read(_v14, "GX")))
			_S.define(_v14, "y", _S.binary("-", _S.read(_v14, "j"), _S.read(_v14, "GY")))
			_S.define(_v14, "c", _S.prop(_S.read(_v14, "TONE"), _S.read(_v14, "v")))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("===", _S.read(_v14, "v"), 0), func(): return _S.binary("<", _S.read(_v14, "y"), _S.unary("-", 24))), func(): return _S.binary("<", _S.logical("??", _S.prop(_S.read(_v14, "grid"), _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_v14, "j"), 1), _S.read(_v14, "GX")), 2), _S.read(_v14, "i"))), func(): return _S.unary("-", 1)), 0))):
				_S.write(_v14, "c", (_S.read(_v14, "WHITE") if _S.truth(_S.binary("<", _S.read(_v14, "y"), _S.unary("-", 32))) else _S.prop(_S.read(_v14, "C"), 7)), "=", false)
			_S.invoke(_S.read(_v14, "p"), "px", [_S.binary("+", _S.read(_v14, "x"), 0.5), _S.binary("+", _S.read(_v14, "y"), 0.5), _S.read(_v14, "c")])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "j", 1, "+=", true)
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 34, _S.read(_e, "S"), _S.function_value(_e, "_f9"), _S.function_value(_e, "_f10")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 30, _S.binary("+", _S.read(_e, "S"), 2), _S.function_value(_e, "_f11"), _S.function_value(_e, "_f12")])
	_S.define(_e, "fl", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.call_value(_S.read(_e, "lnoise"), [_S.read(_e, "t"), 0, 77, 6]))))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 16), 52, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.5, _S.read(_e, "fl"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 12), 26, _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.34, _S.read(_e, "fl"))])
	var _v16 = _S.scope(_e)
	_S.define(_v16, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "j"), _S.read(_v16, "GY"))):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "i"), _S.binary("*", _S.read(_v17, "GX"), 2))):
			if _S.truth(_S.binary("===", _S.prop(_S.read(_v17, "grid"), _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v17, "j"), _S.read(_v17, "GX")), 2), _S.read(_v17, "i"))), 3)):
				var _v18 = _S.scope(_v17)
				_S.define(_v18, "sx", _S.binary("-", _S.invoke(_S.read(_v18, "p"), "cellX", [_S.binary("+", _S.binary("-", _S.read(_v18, "i"), _S.read(_v18, "GX")), 0.5), _S.binary("+", _S.binary("-", _S.read(_v18, "j"), _S.read(_v18, "GY")), 0.5)]), _S.prop(_S.read(_v18, "p"), "ox")))
				_S.define(_v18, "sy", _S.binary("-", _S.invoke(_S.read(_v18, "p"), "cellY", [_S.binary("+", _S.binary("-", _S.read(_v18, "i"), _S.read(_v18, "GX")), 0.5), _S.binary("+", _S.binary("-", _S.read(_v18, "j"), _S.read(_v18, "GY")), 0.5)]), _S.prop(_S.read(_v18, "p"), "oy")))
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_v18, "sx"), 0), func(): return _S.binary(">=", _S.read(_v18, "sy"), 0)), func(): return _S.binary("<", _S.read(_v18, "sx"), _S.prop(_S.read(_v18, "p"), "w"))), func(): return _S.binary("<", _S.read(_v18, "sy"), _S.prop(_S.read(_v18, "p"), "h")))):
					_S.set_prop(_S.prop(_S.read(_v18, "p"), "L"), _S.binary("+", _S.binary("*", _S.read(_v18, "sy"), _S.prop(_S.read(_v18, "p"), "w")), _S.read(_v18, "sx")), 0, "=", false)
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "+=", true)
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "j", 1, "+=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "v", _S.arg(_args, 2))
	_S.define(_e, "i", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]), _S.read(_e, "GX")))
	_S.define(_e, "j", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]), _S.read(_e, "GY")))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "i"), 0), func(): return _S.binary(">=", _S.read(_e, "j"), 0)), func(): return _S.binary("<", _S.read(_e, "i"), _S.binary("*", _S.read(_e, "GX"), 2))), func(): return _S.binary("<", _S.read(_e, "j"), _S.read(_e, "GY")))):
		_S.set_prop(_S.read(_e, "grid"), _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "j"), _S.read(_e, "GX")), 2), _S.read(_e, "i")), _S.read(_e, "v"), "=", false)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.read(_e, "i")

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.invoke(_S.read(_e, "Math"), "abs", [_S.prop(_S.prop(_S.read(_e, "TONGUES"), _S.read(_e, "b")), 0)]), _S.invoke(_S.read(_e, "Math"), "abs", [_S.prop(_S.prop(_S.read(_e, "TONGUES"), _S.read(_e, "a")), 0)]))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.25, 0.5])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "L")))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "r"), "int", [0, 4]))
	var _v15 = _S.prop(_S.read(_e, "TONGUES"), _S.read(_e, "k"))
	_S.define(_e, "dx", _S.prop(_v15, 0))
	_S.define(_e, "H0", _S.prop(_v15, 1))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.read(_e, "dx"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 4), 4])), _S.binary("*", _S.read(_e, "u"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 5), 5]))))
	_S.define(_e, "y", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_e, "H0")), _S.invoke(_S.read(_e, "r"), "range", [0.45, 0.85])), _S.binary("*", _S.read(_e, "u"), _S.invoke(_S.read(_e, "r"), "range", [10, 20]))))
	_S.define(_e, "rad", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [1, 2.2]), _S.binary("-", 1, _S.read(_e, "u"))), 0.3))
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "rad"), 0.6), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else _S.prop(_S.read(_e, "C"), 4))])
	if _S.truth(_S.binary(">", _S.read(_e, "rad"), 1)):
		_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 0.4), _S.binary("*", _S.read(_e, "rad"), 0.5), (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else _S.prop(_S.read(_e, "C"), 4))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1, 1.8])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "L")))
	_S.define(_e, "x", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 12), 12]), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "u"), 6), _S.invoke(_S.read(_e, "r"), "range", [0, 6]))]), 5), _S.read(_e, "u"))))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", 10), _S.binary("*", _S.read(_e, "u"), _S.invoke(_S.read(_e, "r"), "range", [40, 70]))))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0.7), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 40), _S.read(_e, "x"))]), 0))):
		return null
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "C"), 6)))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.35, _S.binary("-", 1, _S.read(_e, "u")))])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	_S.define(_e, "seed", _S.arg(_args, 2))
	_S.define(_e, "speed", _S.coalesce(_S.arg(_args, 3), func(): return 5))
	return _S.call_value(_S.read(_e, "noise2"), [_S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("/", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), _S.read(_e, "D"))]), _S.read(_e, "speed")), _S.read(_e, "v")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), _S.read(_e, "D"))]), _S.read(_e, "speed")), _S.read(_e, "seed")])
