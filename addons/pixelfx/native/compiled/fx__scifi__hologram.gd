@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/hologram.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "since", _S.import_value("fx/scifi/_lib.js", "since"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Hologram"}, {"desc": "A floor projector throws a cone of light holding a turning wireframe model: scanlines roll through it, a data ring circles it, and it flickers, tears and jitters."}, {"tags": ["scifi", "hologram", "projector", "wireframe", "display", "glitch", "ground", "loop"]}, {"size": [112, 104]}, {"origin": [56, 92]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#050c1e", "#0a1f48", "#123b80", "#1d64b8", "#2e98e8", "#6cd0ff", "#c8f0ff", "#ffffff"]}, {"metal": ["#0e0d14", "#1e1c27", "#312e3e", "#4b4759", "#6f6a82", "#9d98b0"]}, {"split": "#ff4fd8"}, {"seed": 21}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "OY", _S.unary("-", 50))
	_S.define(_e, "RAD", 16)
	_S.define(_e, "LENS", _S.unary("-", 6))
	_S.define(_e, "VERTS", _S.concat([[[0, 1.45, 0]], [[0, _S.unary("-", 1.45), 0]], _S.array(_S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 6}]), _S.function_value(_e, "_f14")]))]))
	_S.define(_e, "FACES", [])
	var _v32 = _S.scope(_e)
	_S.define(_v32, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v32, "i"), 6)):
		_S.invoke(_S.read(_v32, "FACES"), "push", [[0, _S.binary("+", 2, _S.read(_v32, "i")), _S.binary("+", 2, _S.binary("%", _S.binary("+", _S.read(_v32, "i"), 1), 6))], [1, _S.binary("+", 2, _S.binary("%", _S.binary("+", _S.read(_v32, "i"), 1), 6)), _S.binary("+", 2, _S.read(_v32, "i"))]])
		_v32 = _S.iteration(_v32)
		_S.write(_v32, "i", 1, "+=", true)
	_S.define(_e, "EDGES", [])
	var _v33 = _S.scope(_e)
	_S.define(_v33, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v33, "i"), 6)):
		_S.invoke(_S.read(_v33, "EDGES"), "push", [[0, _S.binary("+", 2, _S.read(_v33, "i"))], [1, _S.binary("+", 2, _S.read(_v33, "i"))], [_S.binary("+", 2, _S.read(_v33, "i")), _S.binary("+", 2, _S.binary("%", _S.binary("+", _S.read(_v33, "i"), 1), 6))]])
		_v33 = _S.iteration(_v33)
		_S.write(_v33, "i", 1, "+=", true)
	_S.define(_e, "GLITCHES", [[0.92, 0.12, 1], [2.55, 0.2, 1.4], [3.42, 0.06, 0.7]])
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
	_S.define(_e, "H", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "metal"), 6]))
	_S.define(_e, "SPLIT", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "split")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "frame", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 30)]))
	_S.define(_e, "gl", _S.invoke(_S.read(_e, "GLITCHES"), "reduce", [_S.function_value(_e, "_f1"), 0]))
	_S.define(_e, "flick", (1 if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "gl"), 0), func(): return _S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "frame")]), 0.5))) else 0))
	_S.define(_e, "cx", (_S.binary("*", (_S.unary("-", 2) if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "frame"), 2]), 0.5)) else 2), _S.read(_e, "gl")) if _S.truth(_S.read(_e, "gl")) else 0))
	_S.define(_e, "cy", _S.binary("+", _S.read(_e, "OY"), _S.binary("*", 1.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "ph")), 2)]))))
	_S.define(_e, "tears", [])
	if _S.truth(_S.read(_e, "gl")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), 2)):
			_S.invoke(_S.read(_v1, "tears"), "push", [[_S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("+", _S.binary("-", _S.read(_v1, "cy"), _S.read(_v1, "RAD")), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "S"), _S.read(_v1, "frame"), _S.read(_v1, "i")]), _S.read(_v1, "RAD")), 2))]), _S.binary("+", 2, _S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "S"), _S.read(_v1, "frame"), _S.read(_v1, "i"), 1]), 4)])), _S.invoke(_S.read(_v1, "Math"), "round", [_S.binary("*", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "S"), _S.read(_v1, "frame"), _S.read(_v1, "i"), 2]), 0.5), 10), _S.read(_v1, "gl"))])]])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
	_S.define(_e, "tearAt", _S.function_value(_e, "_f2"))
	_S.define(_e, "put", _S.function_value(_e, "_f3"))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 16), _S.unary("-", 8), 16, 2, _S.function_value(_e, "_f4")])
	_S.invoke(_S.read(_e, "p"), "ellipse", [0, _S.binary("+", _S.read(_e, "LENS"), 0.5), 5.5, 1.6, _S.function_value(_e, "_f5")])
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 4)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "k", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v7, "Math"), "cos", [_S.binary("*", _S.read(_v7, "TAU"), _S.binary("-", _S.binary("*", 2, _S.read(_v7, "ph")), _S.binary("/", _S.read(_v7, "i"), 4)))]))))
		_S.invoke(_S.read(_v7, "p"), "px", [_S.binary("+", _S.unary("-", 9), _S.binary("*", _S.read(_v7, "i"), 6)), _S.unary("-", 2), (_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v7, "k"), 0.7)) else _S.prop(_S.read(_v7, "C"), 3))])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	_S.define(_e, "top", _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "RAD"), 1.3)))
	var _v8 = _S.scope(_e)
	_S.define(_v8, "y", _S.invoke(_S.read(_v8, "Math"), "ceil", [_S.read(_v8, "top")]))
	while _S.truth(_S.binary("<", _S.read(_v8, "y"), _S.read(_v8, "LENS"))):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "v", _S.binary("/", _S.binary("-", _S.read(_v9, "y"), _S.read(_v9, "LENS")), _S.binary("-", _S.read(_v9, "top"), _S.read(_v9, "LENS"))))
		_S.define(_v9, "w", _S.call_value(_S.read(_v9, "lerp"), [4, _S.binary("+", _S.read(_v9, "RAD"), 4), _S.read(_v9, "v")]))
		_S.define(_v9, "lineOn", _S.binary("<", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("+", _S.read(_v9, "y"), _S.binary("*", _S.read(_v9, "t"), 24)), 5), 5), 5), 1))
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "x", _S.invoke(_S.read(_v10, "Math"), "floor", [_S.unary("-", _S.read(_v10, "w"))]))
		while _S.truth(_S.binary("<=", _S.read(_v10, "x"), _S.invoke(_S.read(_v10, "Math"), "ceil", [_S.read(_v10, "w")]))):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "q", _S.binary("/", _S.invoke(_S.read(_v11, "Math"), "abs", [_S.binary("+", _S.read(_v11, "x"), 0.5)]), _S.read(_v11, "w")))
			if _S.truth(_S.binary(">", _S.read(_v11, "q"), 1)):
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "x", 1, "+=", true)
				continue
			if _S.truth(_S.binary(">", _S.read(_v11, "q"), _S.binary("-", 1, _S.binary("/", 1, _S.read(_v11, "w"))))):
				_S.call_value(_S.read(_v11, "put"), [_S.read(_v11, "x"), _S.read(_v11, "y"), (_S.prop(_S.read(_v11, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v11, "v"), 0.5)) else _S.prop(_S.read(_v11, "C"), 4))])
			else:
				_S.invoke(_S.read(_v11, "p"), "blend", [_S.binary("+", _S.read(_v11, "x"), 0.5), _S.binary("+", _S.read(_v11, "y"), 0.5), (_S.prop(_S.read(_v11, "C"), 5) if _S.truth(_S.read(_v11, "lineOn")) else _S.prop(_S.read(_v11, "C"), 4)), _S.binary("+", _S.binary("*", _S.binary("+", 0.05, _S.binary("*", 0.12, _S.binary("-", 1, _S.read(_v11, "v")))), _S.binary("-", 1, _S.binary("*", _S.binary("*", 0.6, _S.read(_v11, "q")), _S.read(_v11, "q")))), (0.06 if _S.truth(_S.read(_v11, "lineOn")) else 0))])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "x", 1, "+=", true)
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "y", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "LENS"), 12, _S.prop(_S.read(_e, "C"), 5), 0.6])
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), 56)):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "a", _S.binary("-", _S.binary("*", _S.binary("/", _S.read(_v13, "i"), 56), _S.read(_v13, "TAU")), _S.binary("*", _S.read(_v13, "ph"), _S.read(_v13, "TAU"))))
		_S.define(_v13, "x", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.binary("+", _S.read(_v13, "RAD"), 4)))
		_S.define(_v13, "y", _S.binary("+", _S.read(_v13, "top"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), 3)))
		if _S.truth(_S.binary("<", _S.binary("%", _S.read(_v13, "i"), 7), 5)):
			_S.call_value(_S.read(_v13, "put"), [_S.read(_v13, "x"), _S.read(_v13, "y"), (_S.prop(_S.read(_v13, "C"), 6) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), 0)) else _S.prop(_S.read(_v13, "C"), 4)), (1 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), 0)) else 0.7)])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.binary("-", _S.unary("-", _S.read(_e, "RAD")), 4), _S.read(_e, "top"), _S.binary("+", _S.read(_e, "RAD"), 4), _S.read(_e, "top"), 4, _S.prop(_S.read(_e, "C"), 4), 0.2])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 18, _S.binary("+", _S.read(_e, "S"), 1), _S.function_value(_e, "_f6"), _S.function_value(_e, "_f7")])
	_S.define(_e, "spin", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "ph")))
	_S.define(_e, "tilt", 0.32)
	_S.define(_e, "P3", _S.invoke(_S.read(_e, "VERTS"), "map", [_S.function_value(_e, "_f8")]))
	_S.define(_e, "scanY", _S.call_value(_S.read(_e, "lerp"), [_S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "RAD"), 1.5)), _S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "RAD"), 1.5)), _S.binary("/", _S.binary("%", _S.binary("*", _S.read(_e, "ph"), 2), 1), 0.8)]))
	for _v15 in _S.array(_S.read(_e, "FACES")):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "f", _v15)
		var _v17 = _S.scope(_v16)
		var _v18 = _S.invoke(_S.read(_v17, "f"), "map", [_S.function_value(_v17, "_f9")])
		_S.define(_v17, "a", _S.prop(_v18, 0))
		_S.define(_v17, "b", _S.prop(_v18, 1))
		_S.define(_v17, "c", _S.prop(_v18, 2))
		_S.define(_v17, "nz", _S.binary("-", _S.binary("*", _S.binary("-", _S.prop(_S.read(_v17, "b"), 0), _S.prop(_S.read(_v17, "a"), 0)), _S.binary("-", _S.prop(_S.read(_v17, "c"), 1), _S.prop(_S.read(_v17, "a"), 1))), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v17, "b"), 1), _S.prop(_S.read(_v17, "a"), 1)), _S.binary("-", _S.prop(_S.read(_v17, "c"), 0), _S.prop(_S.read(_v17, "a"), 0)))))
		if _S.truth(_S.binary(">=", _S.read(_v17, "nz"), 0)):
			continue
		_S.define(_v17, "shade", _S.call_value(_S.read(_v17, "clamp"), [_S.binary("+", 0.3, _S.binary("*", 0.7, _S.binary("+", _S.binary("/", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v17, "a"), 2), _S.prop(_S.read(_v17, "b"), 2)), _S.prop(_S.read(_v17, "c"), 2)), 3), 0.5)))]))
		_S.invoke(_S.read(_v17, "p"), "poly", [[_S.read(_v17, "a"), _S.read(_v17, "b"), _S.read(_v17, "c")], _S.function_value(_v17, "_f10"), _S.function_value(_v17, "_f11")])
	_S.define(_e, "edges", _S.invoke(_S.invoke(_S.read(_e, "EDGES"), "map", [_S.function_value(_e, "_f12")]), "sort", [_S.function_value(_e, "_f13")]))
	for _v20 in _S.array(_S.read(_e, "edges")):
		var _v21 = _S.scope(_e)
		var _v22 = _v20
		_S.define(_v21, "a", _S.prop(_v22, 0))
		_S.define(_v21, "b", _S.prop(_v22, 1))
		_S.define(_v21, "z", _S.prop(_v22, 2))
		var _v23 = _S.scope(_v21)
		_S.define(_v23, "L", _S.invoke(_S.read(_v23, "Math"), "hypot", [_S.binary("-", _S.prop(_S.read(_v23, "b"), 0), _S.prop(_S.read(_v23, "a"), 0)), _S.binary("-", _S.prop(_S.read(_v23, "b"), 1), _S.prop(_S.read(_v23, "a"), 1))]))
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "d", 0)
		while _S.truth(_S.binary("<=", _S.read(_v24, "d"), _S.read(_v24, "L"))):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "x", _S.call_value(_S.read(_v25, "lerp"), [_S.prop(_S.read(_v25, "a"), 0), _S.prop(_S.read(_v25, "b"), 0), _S.binary("/", _S.read(_v25, "d"), _S.read(_v25, "L"))]))
			_S.define(_v25, "y", _S.call_value(_S.read(_v25, "lerp"), [_S.prop(_S.read(_v25, "a"), 1), _S.prop(_S.read(_v25, "b"), 1), _S.binary("/", _S.read(_v25, "d"), _S.read(_v25, "L"))]))
			_S.define(_v25, "hot", _S.binary("<", _S.invoke(_S.read(_v25, "Math"), "abs", [_S.binary("-", _S.read(_v25, "y"), _S.read(_v25, "scanY"))]), 1.5))
			if _S.truth(_S.binary("<", _S.read(_v25, "z"), _S.unary("-", 0.15))):
				_S.call_value(_S.read(_v25, "put"), [_S.read(_v25, "x"), _S.read(_v25, "y"), (_S.prop(_S.read(_v25, "C"), 5) if _S.truth(_S.read(_v25, "hot")) else _S.prop(_S.read(_v25, "C"), 3)), 0.7])
			else:
				_S.call_value(_S.read(_v25, "put"), [_S.read(_v25, "x"), _S.read(_v25, "y"), (_S.read(_v25, "WHITE") if _S.truth(_S.read(_v25, "hot")) else (_S.prop(_S.read(_v25, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v25, "z"), 0.4)) else _S.prop(_S.read(_v25, "C"), 5)))])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "d", 0.5, "+=", false)
	for _v26 in _S.array(_S.read(_e, "P3")):
		var _v27 = _S.scope(_e)
		var _v28 = _v26
		_S.define(_v27, "x", _S.prop(_v28, 0))
		_S.define(_v27, "y", _S.prop(_v28, 1))
		_S.define(_v27, "z", _S.prop(_v28, 2))
		var _v29 = _S.scope(_v27)
		if _S.truth(_S.binary("<", _S.read(_v29, "z"), _S.unary("-", 0.15))):
			continue
		_S.call_value(_S.read(_v29, "put"), [_S.read(_v29, "x"), _S.read(_v29, "y"), _S.read(_v29, "WHITE")])
		_S.invoke(_S.read(_v29, "p"), "glow", [_S.read(_v29, "x"), _S.read(_v29, "y"), 4, _S.prop(_S.read(_v29, "C"), 5), 0.3])
	var _v30 = _S.scope(_e)
	_S.define(_v30, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v30, "i"), 64)):
		var _v31 = _S.scope(_v30)
		_S.define(_v31, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v31, "i"), 64), _S.read(_v31, "TAU")), _S.binary("*", _S.binary("*", _S.read(_v31, "ph"), _S.read(_v31, "TAU")), 2)))
		_S.define(_v31, "x", _S.binary("+", _S.read(_v31, "cx"), _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "a")]), _S.binary("+", _S.read(_v31, "RAD"), 9))))
		_S.define(_v31, "y", _S.binary("+", _S.binary("+", _S.read(_v31, "cy"), 3), _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "a")]), 4)))
		if _S.truth(_S.binary("===", _S.binary("%", _S.invoke(_S.read(_v31, "Math"), "floor", [_S.binary("/", _S.read(_v31, "i"), 3)]), 3), 2)):
			_v30 = _S.iteration(_v30)
			_S.write(_v30, "i", 1, "+=", true)
			continue
		_S.call_value(_S.read(_v31, "put"), [_S.read(_v31, "x"), _S.read(_v31, "y"), ((_S.read(_v31, "WHITE") if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v31, "i"), 9), 0)) else _S.prop(_S.read(_v31, "C"), 5)) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "a")]), 0)) else _S.prop(_S.read(_v31, "C"), 3)), (1 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "a")]), 0)) else 0.6)])
		_v30 = _S.iteration(_v30)
		_S.write(_v30, "i", 1, "+=", true)
	_S.define(_e, "lk", (0.5 if _S.truth(_S.read(_e, "flick")) else 1))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "RAD"), 2.2), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.36, _S.read(_e, "lk"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "cx"), _S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "RAD"), 0.6)), _S.read(_e, "RAD"), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.15, _S.read(_e, "lk"))])
	if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "scanY"), _S.read(_e, "cy"))]), _S.binary("*", _S.read(_e, "RAD"), 1.4))):
		_S.invoke(_S.read(_e, "p"), "glowLine", [_S.binary("-", _S.read(_e, "cx"), _S.read(_e, "RAD")), _S.read(_e, "scanY"), _S.binary("+", _S.read(_e, "cx"), _S.read(_e, "RAD")), _S.read(_e, "scanY"), 5, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.3, _S.read(_e, "lk"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 2), 22, _S.prop(_S.read(_e, "C"), 4), 0.2])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "m", _S.arg(_args, 0))
	var _v0 = _S.arg(_args, 1)
	_S.define(_e, "g0", _S.prop(_v0, 0))
	_S.define(_e, "len", _S.prop(_v0, 1))
	_S.define(_e, "k", _S.prop(_v0, 2))
	return (_S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "m"), _S.read(_e, "k")]) if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "g0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "g0"), _S.read(_e, "len"))))) else _S.read(_e, "m"))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	for _v2 in _S.array(_S.read(_e, "tears")):
		var _v3 = _S.scope(_e)
		var _v4 = _v2
		_S.define(_v3, "y0", _S.prop(_v4, 0))
		_S.define(_v3, "h", _S.prop(_v4, 1))
		_S.define(_v3, "dx", _S.prop(_v4, 2))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v3, "y"), _S.read(_v3, "y0")), func(): return _S.binary("<", _S.read(_v3, "y"), _S.binary("+", _S.read(_v3, "y0"), _S.read(_v3, "h"))))):
			return _S.read(_v3, "dx")
	return 0

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 3), func(): return 1))
	_S.define(_e, "yy", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]))
	if _S.truth(_S.logical("&&", _S.read(_e, "flick"), func(): return _S.binary("&", _S.read(_e, "yy"), 1))):
		return null
	_S.define(_e, "dx", _S.call_value(_S.read(_e, "tearAt"), [_S.read(_e, "yy")]))
	if _S.truth(_S.read(_e, "dx")):
		var _v5 = _S.scope(_e)
		_S.invoke(_S.read(_v5, "p"), "dot", [_S.binary("+", _S.read(_v5, "x"), _S.read(_v5, "dx")), _S.read(_v5, "y"), _S.read(_v5, "SPLIT"), _S.binary("*", _S.read(_v5, "a"), 0.8)])
		_S.invoke(_S.read(_v5, "p"), "dot", [_S.binary("+", _S.binary("+", _S.read(_v5, "x"), _S.read(_v5, "dx")), _S.invoke(_S.read(_v5, "Math"), "sign", [_S.read(_v5, "dx")])), _S.read(_v5, "y"), _S.read(_v5, "c"), _S.read(_v5, "a")])
		return null
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "c"), _S.read(_e, "a")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "top", _S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_e, "x"), 15), 2), _S.binary("**", _S.binary("/", _S.binary("+", _S.read(_e, "y"), 5), 3), 2)), 1))
	_S.define(_e, "side", _S.logical("&&", _S.logical("&&", _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 15), func(): return _S.binary(">", _S.read(_e, "y"), _S.unary("-", 5))), func(): return _S.binary("<=", _S.read(_e, "y"), 0)))
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "top")), func(): return _S.unary("!", _S.read(_e, "side")))):
		return null
	if _S.truth(_S.read(_e, "top")):
		_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "H"), 0) if _S.truth(_S.binary(">", _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_e, "x"), 15), 2), _S.binary("**", _S.binary("/", _S.binary("+", _S.read(_e, "y"), 5), 3), 2)), 0.8)) else (_S.prop(_S.read(_e, "H"), 5) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 6))) else _S.prop(_S.read(_e, "H"), 3))), "=", false)
	else:
		_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "H"), 0) if _S.truth(_S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 14), func(): return _S.binary("===", _S.read(_e, "y"), 0))) else (_S.prop(_S.read(_e, "H"), 4) if _S.truth(_S.binary("===", _S.read(_e, "y"), _S.unary("-", 4))) else (_S.prop(_S.read(_e, "H"), 3) if _S.truth(_S.binary("<", _S.read(_e, "x"), _S.unary("-", 6))) else (_S.prop(_S.read(_e, "H"), 1) if _S.truth(_S.binary(">", _S.read(_e, "x"), 6)) else _S.prop(_S.read(_e, "H"), 2))))), "=", false)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.4)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.8)) else _S.prop(_S.read(_e, "C"), 4)))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.8, 1.4])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "y", _S.call_value(_S.read(_e, "lerp"), [_S.binary("-", _S.read(_e, "LENS"), 2), _S.read(_e, "top"), _S.read(_e, "k")]))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "lerp"), [4, _S.binary("+", _S.read(_e, "RAD"), 2), _S.read(_e, "k")]))
	_S.call_value(_S.read(_e, "put"), [_S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_e, "w")), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.3])) else _S.prop(_S.read(_e, "C"), 5)), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_e, "k")), 2)])])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v14 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v14, 0))
	_S.define(_e, "y", _S.prop(_v14, 1))
	_S.define(_e, "z", _S.prop(_v14, 2))
	_S.define(_e, "x1", _S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "spin")])), _S.binary("*", _S.read(_e, "z"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "spin")]))))
	_S.define(_e, "z1", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "x")), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "spin")])), _S.binary("*", _S.read(_e, "z"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "spin")]))))
	_S.define(_e, "y2", _S.binary("-", _S.binary("*", _S.read(_e, "y"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "tilt")])), _S.binary("*", _S.read(_e, "z1"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "tilt")]))))
	_S.define(_e, "z2", _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "tilt")])), _S.binary("*", _S.read(_e, "z1"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "tilt")]))))
	return [_S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "x1"), _S.read(_e, "RAD"))), _S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "y2"), _S.read(_e, "RAD"))), _S.read(_e, "z2")]

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "P3"), _S.read(_e, "i"))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "y"), _S.read(_e, "scanY"))]), 2)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "shade"), 0.6)) else _S.prop(_S.read(_e, "C"), 3)))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "yy", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]))
	return (1 if _S.truth(_S.logical("||", _S.logical("&&", _S.binary("===", _S.binary("%", _S.read(_e, "yy"), 3), 0), func(): return _S.unary("!", _S.logical("&&", _S.read(_e, "flick"), func(): return _S.binary("&", _S.read(_e, "yy"), 1)))), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "y"), _S.read(_e, "scanY"))]), 1.5))) else 0)

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v19 = _S.arg(_args, 0)
	_S.define(_e, "i", _S.prop(_v19, 0))
	_S.define(_e, "j", _S.prop(_v19, 1))
	return [_S.prop(_S.read(_e, "P3"), _S.read(_e, "i")), _S.prop(_S.read(_e, "P3"), _S.read(_e, "j")), _S.binary("/", _S.binary("+", _S.prop(_S.prop(_S.read(_e, "P3"), _S.read(_e, "i")), 2), _S.prop(_S.prop(_S.read(_e, "P3"), _S.read(_e, "j")), 2)), 2)]

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "a"), 2), _S.prop(_S.read(_e, "b"), 2))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.binary("/", _S.read(_e, "i"), 6), _S.read(_e, "TAU"))]), 0.9), 0.12, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "i"), 6), _S.read(_e, "TAU"))]), 0.9)]
