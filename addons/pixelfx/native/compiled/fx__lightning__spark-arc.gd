@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/spark-arc.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "bowed", _S.import_value("fx/lightning/_lib.js", "bowed"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "flight", _S.import_value("fx/lightning/_lib.js", "flight"))
	_S.define(_e, "spark", _S.import_value("fx/lightning/_lib.js", "spark"))
	_S.define(_e, "puff", _S.import_value("fx/lightning/_lib.js", "puff"))
	_S.define(_e, "heat", _S.import_value("fx/lightning/_lib.js", "heat"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Spark arc"}, {"desc": "A climbing arc between two rods: it strikes white at their narrow foot, climbs on rising heat as it stretches and bows, sputters and snaps at the top, then strikes again."}, {"tags": ["lightning", "electric", "arc", "jacobs-ladder", "machine", "prop", "loop"]}, {"size": [124, 120]}, {"origin": [62, 108]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FPS", 30)
	_S.define(_e, "N", 60)
	_S.define(_e, "P", 2)
	_S.define(_e, "SNAP", 1.42)
	_S.define(_e, "H", 58)
	_S.define(_e, "STEEL", _S.invoke(["#151823", "#262c3b", "#3d4558", "#5f6a82", "#8f9bb2", "#d2daea"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "CERAMIC", _S.invoke(["#4b4458", "#857d96", "#c9c1d6", "#efe9f6"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "ASH", _S.call_value(_S.read(_e, "hex"), ["#6a6478"]))
	_S.define(_e, "rodAt", _S.function_value(_e, "_f5"))
	_S.define(_e, "height", _S.function_value(_e, "_f6"))
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
	_S.define(_e, "S", _S.invoke(_S.prop(_S.read(_e, "o"), "sparks"), "map", [_S.read(_e, "hex")]))
	_S.define(_e, "f", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), _S.read(_e, "FPS")), 0.000001)]), _S.read(_e, "N")))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rng"), [_S.prop(_S.read(_e, "o"), "seed"), 1, _S.read(_e, "f")]))
	_S.define(_e, "climbing", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SNAP")))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "height"), [_S.read(_e, "t")]))
	_S.define(_e, "u", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "SNAP"))]))
	_S.define(_e, "a", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SNAP")))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 14), 50, _S.prop(_S.read(_e, "C"), 3), (_S.binary("+", 0.2, _S.binary("*", 0.15, _S.binary("-", 1, _S.read(_e, "u")))) if _S.truth(_S.read(_e, "climbing")) else 0.06)])
	_S.invoke(_S.read(_e, "p"), "rect", [_S.unary("-", 18), _S.unary("-", 3), 36, 3, _S.prop(_S.read(_e, "STEEL"), 1)])
	_S.invoke(_S.read(_e, "p"), "line", [_S.unary("-", 18), _S.unary("-", 3), 17, _S.unary("-", 3), _S.prop(_S.read(_e, "STEEL"), 3)])
	for _v0 in _S.array([_S.unary("-", 1), 1]):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "y", _S.unary("-", 9))
		while _S.truth(_S.binary("<", _S.read(_v2, "y"), _S.unary("-", 3))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "rib", _S.binary("===", _S.binary("&", _S.read(_v3, "y"), 1), 0))
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "x", 2)
			while _S.truth(_S.binary("<=", _S.read(_v4, "x"), 6)):
				_S.invoke(_S.read(_v4, "p"), "px", [_S.binary("-", _S.binary("*", _S.read(_v4, "s"), _S.read(_v4, "x")), (1 if _S.truth(_S.binary("<", _S.read(_v4, "s"), 0)) else 0)), _S.read(_v4, "y"), (_S.prop(_S.read(_v4, "CERAMIC"), (3 if _S.truth(_S.binary("<", _S.read(_v4, "x"), 4)) else (2 if _S.truth(_S.binary("<", _S.read(_v4, "x"), 6)) else 1))) if _S.truth(_S.read(_v4, "rib")) else _S.prop(_S.read(_v4, "CERAMIC"), (1 if _S.truth(_S.binary("<", _S.read(_v4, "x"), 5)) else 0)))])
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "x", 1, "+=", true)
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "y", 1, "+=", true)
	for _v5 in _S.array([_S.unary("-", 1), 1]):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "s", _v5)
		var _v7 = _S.scope(_v6)
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "hh", 0)
		while _S.truth(_S.binary("<=", _S.read(_v8, "hh"), 60)):
			var _v9 = _S.scope(_v8)
			var _v10 = _S.call_value(_S.read(_v9, "rodAt"), [_S.read(_v9, "s"), _S.read(_v9, "hh")])
			_S.define(_v9, "x", _S.prop(_v10, 0))
			_S.define(_v9, "y", _S.prop(_v10, 1))
			_S.define(_v9, "tp", _S.binary("*", _S.read(_v9, "SNAP"), _S.invoke(_S.read(_v9, "Math"), "pow", [_S.call_value(_S.read(_v9, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v9, "hh"), 1.5), _S.read(_v9, "H"))]), _S.binary("/", 1, 1.35)])))
			_S.define(_v9, "age", (_S.binary("-", _S.read(_v9, "t"), _S.read(_v9, "tp")) if _S.truth(_S.binary(">=", _S.read(_v9, "t"), _S.read(_v9, "tp"))) else _S.binary("+", _S.binary("-", _S.read(_v9, "t"), _S.read(_v9, "tp")), _S.read(_v9, "P"))))
			_S.define(_v9, "hot", (0 if _S.truth(_S.binary(">", _S.read(_v9, "hh"), _S.binary("+", _S.read(_v9, "H"), 2))) else _S.invoke(_S.read(_v9, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_v9, "age")), 0.26)])))
			_S.define(_v9, "c", _S.call_value(_S.read(_v9, "heat"), [_S.binary("-", _S.binary("*", _S.read(_v9, "hot"), 1.05), 0.12)]))
			_S.invoke(_S.read(_v9, "p"), "px", [_S.read(_v9, "x"), _S.read(_v9, "y"), _S.logical("||", _S.read(_v9, "c"), func(): return (_S.prop(_S.read(_v9, "STEEL"), 4) if _S.truth(_S.binary("<", _S.read(_v9, "s"), 0)) else _S.prop(_S.read(_v9, "STEEL"), 3)))])
			_S.invoke(_S.read(_v9, "p"), "px", [_S.binary("+", _S.read(_v9, "x"), _S.read(_v9, "s")), _S.read(_v9, "y"), (_S.logical("||", _S.call_value(_S.read(_v9, "heat"), [_S.binary("*", _S.read(_v9, "hot"), 0.6)]), func(): return _S.prop(_S.read(_v9, "STEEL"), 2)) if _S.truth(_S.logical("&&", _S.read(_v9, "c"), func(): return _S.binary(">", _S.read(_v9, "hot"), 0.35))) else (_S.prop(_S.read(_v9, "STEEL"), 2) if _S.truth(_S.binary("<", _S.read(_v9, "s"), 0)) else _S.prop(_S.read(_v9, "STEEL"), 1)))])
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v9, "hot"), 0.3), func(): return _S.binary("===", _S.binary("&", _S.invoke(_S.read(_v9, "Math"), "round", [_S.binary("*", _S.read(_v9, "hh"), 2)]), 3), 0))):
				_S.invoke(_S.read(_v9, "p"), "glow", [_S.read(_v9, "x"), _S.read(_v9, "y"), 5, _S.logical("||", _S.read(_v9, "c"), func(): return _S.prop(_S.read(_v9, "C"), 4)), _S.binary("*", 0.25, _S.read(_v9, "hot"))])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "hh", 0.5, "+=", false)
		var _v11 = _S.call_value(_S.read(_v7, "rodAt"), [_S.read(_v7, "s"), 60])
		_S.define(_v7, "tx", _S.prop(_v11, 0))
		_S.define(_v7, "ty", _S.prop(_v11, 1))
		_S.invoke(_S.read(_v7, "p"), "circle", [_S.binary("+", _S.read(_v7, "tx"), _S.binary("*", _S.read(_v7, "s"), 0.5)), _S.read(_v7, "ty"), 1.6, _S.prop(_S.read(_v7, "STEEL"), 4)])
		_S.invoke(_S.read(_v7, "p"), "px", [_S.binary("-", _S.binary("+", _S.read(_v7, "tx"), _S.binary("*", _S.read(_v7, "s"), 0.5)), 0.5), _S.binary("-", _S.read(_v7, "ty"), 1), _S.prop(_S.read(_v7, "STEEL"), 5)])
	if _S.truth(_S.read(_e, "climbing")):
		var _v12 = _S.scope(_e)
		var _v13 = _S.call_value(_S.read(_v12, "rodAt"), [_S.unary("-", 1), _S.read(_v12, "h")])
		_S.define(_v12, "xl", _S.prop(_v13, 0))
		_S.define(_v12, "yl", _S.prop(_v13, 1))
		var _v14 = _S.call_value(_S.read(_v12, "rodAt"), [1, _S.read(_v12, "h")])
		_S.define(_v12, "xr", _S.prop(_v14, 0))
		_S.define(_v12, "yr", _S.prop(_v14, 1))
		_S.define(_v12, "k0", (1 if _S.truth(_S.binary("<", _S.read(_v12, "t"), _S.binary("/", 1, _S.read(_v12, "FPS")))) else _S.binary("-", 1, _S.binary("*", 0.22, _S.read(_v12, "u")))))
		_S.define(_v12, "sput", (0.4 if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v12, "u"), 0.88), func(): return _S.binary("<", _S.invoke(_S.read(_v12, "r"), "next", []), 0.25))) else 1))
		_S.define(_v12, "k", _S.binary("*", _S.binary("*", _S.read(_v12, "k0"), _S.read(_v12, "sput")), _S.binary("+", 0.82, _S.binary("*", 0.18, _S.invoke(_S.read(_v12, "r"), "next", [])))))
		_S.define(_v12, "bow", _S.binary("*", _S.unary("-", _S.binary("+", 1.5, _S.binary("*", _S.binary("*", 13, _S.read(_v12, "u")), _S.read(_v12, "u")))), _S.binary("+", 0.8, _S.binary("*", 0.4, _S.invoke(_S.read(_v12, "r"), "next", [])))))
		_S.call_value(_S.read(_v12, "stroke"), [_S.read(_v12, "p"), _S.call_value(_S.read(_v12, "bowed"), [_S.read(_v12, "r"), _S.read(_v12, "xl"), _S.read(_v12, "yl"), _S.read(_v12, "xr"), _S.read(_v12, "yr"), _S.read(_v12, "bow"), _S.binary("+", 0.18, _S.binary("*", 0.12, _S.read(_v12, "u"))), _S.binary("+", 0.12, _S.binary("*", 0.25, _S.read(_v12, "u")))]), _S.read(_v12, "k"), _S.read(_v12, "C"), (0.95 if _S.truth(_S.binary("<", _S.read(_v12, "t"), _S.binary("/", 1, _S.read(_v12, "FPS")))) else 0.8), _S.merge([{"hero": _S.binary("<", _S.read(_v12, "t"), _S.binary("/", 1, _S.read(_v12, "FPS")))}, {"light": 0.7}])])
		_S.invoke(_S.read(_v12, "p"), "glowLine", [_S.read(_v12, "xl"), _S.binary("+", _S.read(_v12, "yl"), _S.binary("*", _S.read(_v12, "bow"), 0.5)), _S.read(_v12, "xr"), _S.binary("+", _S.read(_v12, "yr"), _S.binary("*", _S.read(_v12, "bow"), 0.5)), 12, _S.prop(_S.read(_v12, "C"), 4), _S.binary("*", 0.22, _S.read(_v12, "k"))])
		for _v15 in _S.array([[_S.read(_v12, "xl"), _S.read(_v12, "yl")], [_S.read(_v12, "xr"), _S.read(_v12, "yr")]]):
			var _v16 = _S.scope(_v12)
			var _v17 = _v15
			_S.define(_v16, "x", _S.prop(_v17, 0))
			_S.define(_v16, "y", _S.prop(_v17, 1))
			var _v18 = _S.scope(_v16)
			_S.invoke(_S.read(_v18, "p"), "circle", [_S.read(_v18, "x"), _S.read(_v18, "y"), _S.binary("+", 1.8, _S.binary("*", 0.6, _S.read(_v18, "k"))), _S.prop(_S.read(_v18, "C"), 5)])
			_S.invoke(_S.read(_v18, "p"), "px", [_S.read(_v18, "x"), _S.read(_v18, "y"), _S.read(_v18, "WHITE")])
			_S.invoke(_S.read(_v18, "p"), "glow", [_S.read(_v18, "x"), _S.read(_v18, "y"), 12, _S.prop(_S.read(_v18, "C"), 5), _S.binary("*", 0.55, _S.read(_v18, "k"))])
		if _S.truth(_S.binary("<", _S.read(_v12, "t"), 0.1)):
			_S.invoke(_S.read(_v12, "p"), "glow", [0, _S.unary("-", 11), 26, _S.prop(_S.read(_v12, "C"), 6), _S.binary("*", 0.45, _S.binary("-", 1, _S.binary("/", _S.read(_v12, "t"), 0.1)))])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "a"), _S.binary("/", 2, _S.read(_e, "FPS")))):
			var _v19 = _S.scope(_e)
			var _v20 = _S.call_value(_S.read(_v19, "rodAt"), [_S.unary("-", 1), _S.binary("+", _S.read(_v19, "H"), 1.5)])
			_S.define(_v19, "xl", _S.prop(_v20, 0))
			_S.define(_v19, "yl", _S.prop(_v20, 1))
			var _v21 = _S.call_value(_S.read(_v19, "rodAt"), [1, _S.binary("+", _S.read(_v19, "H"), 1.5)])
			_S.define(_v19, "xr", _S.prop(_v21, 0))
			_S.define(_v19, "yr", _S.prop(_v21, 1))
			for _v22 in _S.array([[_S.read(_v19, "xl"), _S.read(_v19, "yl"), 1], [_S.read(_v19, "xr"), _S.read(_v19, "yr"), _S.unary("-", 1)]]):
				var _v23 = _S.scope(_v19)
				var _v24 = _v22
				_S.define(_v23, "x0", _S.prop(_v24, 0))
				_S.define(_v23, "y0", _S.prop(_v24, 1))
				_S.define(_v23, "s", _S.prop(_v24, 2))
				_S.call_value(_S.read(_v23, "crackle"), [_S.read(_v23, "p"), _S.call_value(_S.read(_v23, "zigzag"), [_S.read(_v23, "r"), _S.read(_v23, "x0"), _S.read(_v23, "y0"), _S.binary("+", _S.read(_v23, "x0"), _S.binary("*", _S.read(_v23, "s"), _S.invoke(_S.read(_v23, "r"), "range", [5, 9]))), _S.binary("-", _S.read(_v23, "y0"), _S.invoke(_S.read(_v23, "r"), "range", [2, 6])), 0.4, 0.3]), 0.7, _S.read(_v23, "C"), 0.4])
			_S.invoke(_S.read(_v19, "p"), "glow", [0, _S.binary("-", _S.read(_v19, "yl"), 8), 30, _S.prop(_S.read(_v19, "C"), 4), 0.5])
		else:
			if _S.truth(_S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "P"), 0.16))):
				var _v25 = _S.scope(_e)
				if _S.truth(_S.binary("<", _S.invoke(_S.read(_v25, "r"), "next", []), 0.7)):
					_S.call_value(_S.read(_v25, "crackle"), [_S.read(_v25, "p"), _S.call_value(_S.read(_v25, "zigzag"), [_S.read(_v25, "r"), _S.unary("-", 4.5), _S.binary("-", _S.unary("-", 10.5), _S.invoke(_S.read(_v25, "r"), "range", [0, 2])), 4.5, _S.binary("-", _S.unary("-", 10.5), _S.invoke(_S.read(_v25, "r"), "range", [0, 2])), 0.5, 0]), _S.binary("+", 0.4, _S.binary("*", 0.3, _S.invoke(_S.read(_v25, "r"), "next", []))), _S.read(_v25, "C"), 0.35])
	var _v26 = _S.scope(_e)
	_S.define(_v26, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v26, "j"), 3)):
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "born", _S.binary("*", _S.binary("/", _S.binary("+", _S.read(_v27, "j"), 1), 3.2), _S.read(_v27, "SNAP")))
		_S.define(_v27, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v27, "t"), _S.read(_v27, "born")), _S.read(_v27, "P")), _S.read(_v27, "P")), _S.read(_v27, "P")))
		_S.define(_v27, "life", 1)
		if _S.truth(_S.binary(">=", _S.read(_v27, "age"), _S.read(_v27, "life"))):
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "j", 1, "+=", true)
			continue
		_S.define(_v27, "y0", _S.binary("-", _S.binary("-", _S.unary("-", 9), _S.call_value(_S.read(_v27, "height"), [_S.read(_v27, "born")])), 6))
		_S.call_value(_S.read(_v27, "puff"), [_S.read(_v27, "p"), _S.binary("+", (3 if _S.truth(_S.binary("%", _S.read(_v27, "j"), 2)) else _S.unary("-", 3)), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v27, "age"), 3), _S.read(_v27, "j"))]), 2)), _S.binary("-", _S.read(_v27, "y0"), _S.binary("*", _S.read(_v27, "age"), 20)), _S.binary("+", 1.8, _S.binary("*", _S.read(_v27, "j"), 0.3)), _S.binary("/", _S.read(_v27, "age"), _S.read(_v27, "life")), _S.call_value(_S.read(_v27, "mix"), [_S.read(_v27, "ASH"), _S.prop(_S.read(_v27, "C"), 5), 0.3])])
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "j", 1, "+=", true)
	_S.define(_e, "burst", _S.function_value(_e, "_f1"))
	_S.call_value(_S.read(_e, "burst"), [0, 12, 11, _S.function_value(_e, "_f2")])
	_S.call_value(_S.read(_e, "burst"), [_S.read(_e, "SNAP"), 14, 12, _S.function_value(_e, "_f3")])
	for _v32 in _S.array([[0, 0.45], [1, 0.8], [2, 1.15]]):
		var _v33 = _S.scope(_e)
		var _v34 = _v32
		_S.define(_v33, "k", _S.prop(_v34, 0))
		_S.define(_v33, "tt", _S.prop(_v34, 1))
		_S.call_value(_S.read(_v33, "burst"), [_S.read(_v33, "tt"), 2, _S.binary("+", 20, _S.read(_v33, "k")), _S.function_value(_v33, "_f4")])
	if _S.truth(_S.logical("||", _S.read(_e, "climbing"), func(): return _S.binary("<", _S.read(_e, "a"), 0.25))):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.binary("-", _S.unary("-", 9), _S.read(_e, "h")), 3), 26, _S.prop(_S.read(_e, "C"), 4), (0.25 if _S.truth(_S.read(_e, "climbing")) else _S.binary("*", 0.4, _S.binary("-", 1, _S.binary("/", _S.read(_e, "a"), 0.25))))])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t0", _S.arg(_args, 0))
	_S.define(_e, "n", _S.arg(_args, 1))
	_S.define(_e, "salt", _S.arg(_args, 2))
	_S.define(_e, "from", _S.arg(_args, 3))
	_S.define(_e, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "t0")), _S.read(_e, "P")), _S.read(_e, "P")), _S.read(_e, "P")))
	var _v28 = _S.scope(_e)
	_S.define(_v28, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v28, "j"), _S.read(_v28, "n"))):
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "q", _S.call_value(_S.read(_v29, "rng"), [_S.prop(_S.read(_v29, "o"), "seed"), _S.read(_v29, "salt"), _S.read(_v29, "j")]))
		_S.define(_v29, "life", _S.invoke(_S.read(_v29, "q"), "range", [0.25, 0.6]))
		if _S.truth(_S.binary(">=", _S.read(_v29, "age"), _S.read(_v29, "life"))):
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "j", 1, "+=", true)
			continue
		var _v30 = _S.call_value(_S.read(_v29, "from"), [_S.read(_v29, "q"), _S.read(_v29, "j")])
		_S.define(_v29, "x0", _S.prop(_v30, 0))
		_S.define(_v29, "y0", _S.prop(_v30, 1))
		_S.define(_v29, "a0", _S.prop(_v30, 2))
		_S.define(_v29, "spread", _S.prop(_v30, 3))
		_S.define(_v29, "sp0", _S.prop(_v30, 4))
		_S.define(_v29, "sp1", _S.prop(_v30, 5))
		_S.define(_v29, "ang", _S.binary("+", _S.read(_v29, "a0"), _S.invoke(_S.read(_v29, "q"), "range", [_S.unary("-", _S.read(_v29, "spread")), _S.read(_v29, "spread")])))
		_S.define(_v29, "sp", _S.invoke(_S.read(_v29, "q"), "range", [_S.read(_v29, "sp0"), _S.read(_v29, "sp1")]))
		var _v31 = _S.call_value(_S.read(_v29, "flight"), [_S.read(_v29, "x0"), _S.read(_v29, "y0"), _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "cos", [_S.read(_v29, "ang")]), _S.read(_v29, "sp")), _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "sin", [_S.read(_v29, "ang")]), _S.read(_v29, "sp")), _S.read(_v29, "age"), _S.merge([{"floor": 0}])])
		_S.define(_v29, "x", _S.prop(_v31, 0))
		_S.define(_v29, "y", _S.prop(_v31, 1))
		_S.define(_v29, "vx", _S.prop(_v31, 2))
		_S.define(_v29, "vy", _S.prop(_v31, 3))
		_S.call_value(_S.read(_v29, "spark"), [_S.read(_v29, "p"), _S.read(_v29, "x"), _S.read(_v29, "y"), _S.read(_v29, "vx"), _S.read(_v29, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_v29, "age"), _S.read(_v29, "life"))), _S.read(_v29, "S")])
		_v28 = _S.iteration(_v28)
		_S.write(_v28, "j", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.concat([_S.array(_S.call_value(_S.read(_e, "rodAt"), [(1 if _S.truth(_S.binary("%", _S.read(_e, "j"), 2)) else _S.unary("-", 1)), 1.5])), [_S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), (0.6 if _S.truth(_S.binary("%", _S.read(_e, "j"), 2)) else _S.unary("-", 0.6)))], [1], [60], [170]])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return [_S.binary("*", _S.prop(_S.call_value(_S.read(_e, "rodAt"), [1, _S.read(_e, "H")]), 0), _S.invoke(_S.read(_e, "q"), "range", [_S.unary("-", 0.8), 0.8])), _S.binary("-", _S.binary("-", _S.unary("-", 9), _S.read(_e, "H")), 6), _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), 1.3, 50, 160]

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.concat([_S.array(_S.call_value(_S.read(_e, "rodAt"), [(1 if _S.truth(_S.binary("%", _S.read(_e, "j"), 2)) else _S.unary("-", 1)), _S.call_value(_S.read(_e, "height"), [_S.read(_e, "tt")])])), [_S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)], [0.5], [5], [30]])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "h", _S.arg(_args, 1))
	return [_S.binary("*", _S.read(_e, "s"), _S.binary("+", 4.5, _S.binary("*", _S.binary("/", _S.read(_e, "h"), 60), 19.5))), _S.binary("-", _S.unary("-", 9), _S.read(_e, "h"))]

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", 1.5, _S.binary("*", _S.read(_e, "H"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "SNAP"))]), 1.35])))
