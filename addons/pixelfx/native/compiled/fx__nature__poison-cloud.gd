@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/poison-cloud.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "tongues", _S.function_value(_e, "_f0"))
	_S.define(_e, "height", _S.function_value(_e, "_f1"))
	_S.define(_e, "sheet", _S.function_value(_e, "_f2"))
	_S.define(_e, "plumes", _S.function_value(_e, "_f3"))
	_S.define(_e, "specks", _S.function_value(_e, "_f6"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f9"))
	_S.define(_e, "draw", _S.function_value(_e, "_f11"))
	_S.define(_e, "meta", _S.merge([{"name": "Poison cloud"}, {"desc": "A miasma hugging the floor: ragged sheets of gas lit yellow-green from within, fading to violet, creep out in tongues that curl over at their tips; plumes twist up as ribbons."}, {"tags": ["nature", "poison", "gas", "cloud", "miasma", "toxic", "area", "ground", "loop"]}, {"size": [256, 100]}, {"origin": [128, 86]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0e0816", "#24123a", "#3e2056", "#5a3a62", "#6a6a3a", "#96aa30", "#cce040", "#f4ffa0"]}, {"spread": 1}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SHEETS", [_S.merge([{"h": 36}, {"e": 0.84}, {"a": 0.46}, {"dim": 2}, {"flow": 4}, {"n": 2}, {"back": true}]), _S.merge([{"h": 26}, {"e": 0.96}, {"a": 0.5}, {"dim": 1}, {"flow": 8}, {"n": 2}, {"back": true}]), _S.merge([{"h": 16}, {"e": 1.04}, {"a": 0.56}, {"dim": 0}, {"flow": 8}, {"n": 3}, {"back": false}])])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "sh", _S.arg(_args, 0))
	_S.define(_e, "si", _S.arg(_args, 1))
	_S.define(_e, "E", _S.arg(_args, 2))
	_S.define(_e, "ph", _S.arg(_args, 3))
	_S.define(_e, "out", [])
	for _v0 in _S.array([_S.unary("-", 1), 1]):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v2, "i"), _S.prop(_S.read(_v2, "sh"), "n"))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "q", _S.binary("%", _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_v3, "ph"), _S.binary("/", _S.read(_v3, "i"), _S.prop(_S.read(_v3, "sh"), "n"))), _S.binary("*", _S.read(_v3, "si"), 0.17)), (_S.binary("/", 0.5, _S.prop(_S.read(_v3, "sh"), "n")) if _S.truth(_S.binary(">", _S.read(_v3, "s"), 0)) else 0)), 1))
			_S.invoke(_S.read(_v3, "out"), "push", [_S.merge([{"s": _S.read(_v3, "s")}, {"q": _S.read(_v3, "q")}, {"x": _S.binary("*", _S.binary("*", _S.read(_v3, "s"), _S.read(_v3, "E")), _S.binary("+", 0.3, _S.binary("*", 0.82, _S.read(_v3, "q"))))}, {"h": _S.binary("*", _S.prop(_S.read(_v3, "sh"), "h"), _S.binary("-", 0.75, _S.binary("*", 0.45, _S.read(_v3, "q"))))}])])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "sh", _S.arg(_args, 0))
	_S.define(_e, "si", _S.arg(_args, 1))
	_S.define(_e, "E", _S.arg(_args, 2))
	_S.define(_e, "x", _S.arg(_args, 3))
	_S.define(_e, "ph", _S.arg(_args, 4))
	_S.define(_e, "T", _S.arg(_args, 5))
	_S.define(_e, "seed", _S.arg(_args, 6))
	_S.define(_e, "ax", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]))
	_S.define(_e, "env", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.5, 1, _S.binary("/", _S.read(_e, "ax"), _S.binary("*", _S.read(_e, "E"), _S.prop(_S.read(_e, "sh"), "e")))])))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "tileNoise"), [_S.binary("-", _S.binary("*", _S.read(_e, "ax"), 0.07), _S.binary("*", _S.read(_e, "ph"), _S.prop(_S.read(_e, "sh"), "flow"))), _S.binary("*", _S.read(_e, "si"), 3.7), _S.prop(_S.read(_e, "sh"), "flow"), 0, _S.binary("+", _S.read(_e, "seed"), _S.read(_e, "si"))]))
	_S.define(_e, "h", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "sh"), "h"), _S.read(_e, "env")), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.read(_e, "r")))))
	for _v4 in _S.array(_S.read(_e, "T")):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "g", _v4)
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "behind", _S.binary("*", _S.prop(_S.read(_v6, "g"), "s"), _S.binary("-", _S.prop(_S.read(_v6, "g"), "x"), _S.read(_v6, "x"))))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v6, "behind"), _S.unary("-", 1.5)), func(): return _S.binary(">", _S.read(_v6, "behind"), 30))):
			continue
		_S.write(_v6, "h", _S.invoke(_S.read(_v6, "Math"), "max", [_S.read(_v6, "h"), _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v6, "g"), "h"), _S.invoke(_S.read(_v6, "Math"), "sqrt", [_S.invoke(_S.read(_v6, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.read(_v6, "behind"), 30))])])), _S.call_value(_S.read(_v6, "smooth"), [_S.unary("-", 1.5), 1.5, _S.read(_v6, "behind")])), _S.binary("-", 1, _S.call_value(_S.read(_v6, "smooth"), [0.75, 1, _S.prop(_S.read(_v6, "g"), "q")])))]), "=", false)
	return _S.read(_e, "h")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "sh", _S.arg(_args, 2))
	_S.define(_e, "si", _S.arg(_args, 3))
	_S.define(_e, "E", _S.arg(_args, 4))
	_S.define(_e, "t", _S.arg(_args, 5))
	_S.define(_e, "seed", _S.arg(_args, 6))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "T", _S.call_value(_S.read(_e, "tongues"), [_S.read(_e, "sh"), _S.read(_e, "si"), _S.read(_e, "E"), _S.read(_e, "ph")]))
	_S.define(_e, "d", _S.prop(_S.read(_e, "sh"), "dim"))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.read(_e, "E"), 1.25)]))
	var _v7 = _S.scope(_e)
	_S.define(_v7, "x", _S.unary("-", _S.read(_v7, "X")))
	while _S.truth(_S.binary("<=", _S.read(_v7, "x"), _S.read(_v7, "X"))):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "H", _S.call_value(_S.read(_v8, "height"), [_S.read(_v8, "sh"), _S.read(_v8, "si"), _S.read(_v8, "E"), _S.binary("+", _S.read(_v8, "x"), 0.5), _S.read(_v8, "ph"), _S.read(_v8, "T"), _S.read(_v8, "seed")]))
		if _S.truth(_S.binary("<", _S.read(_v8, "H"), 0.6)):
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "x", 1, "+=", true)
			continue
		_S.define(_v8, "top", _S.unary("-", _S.invoke(_S.read(_v8, "Math"), "round", [_S.read(_v8, "H")])))
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "y", _S.read(_v9, "top"))
		while _S.truth(_S.binary("<=", _S.read(_v9, "y"), 1)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "v", _S.call_value(_S.read(_v10, "clamp"), [_S.binary("/", _S.unary("-", _S.read(_v10, "y")), _S.read(_v10, "H"))]))
			_S.define(_v10, "streak", _S.binary("+", 0.7, _S.binary("*", 0.3, _S.call_value(_S.read(_v10, "tileNoise"), [_S.binary("-", _S.binary("*", _S.read(_v10, "x"), 0.05), _S.binary("*", _S.binary("*", _S.read(_v10, "ph"), _S.prop(_S.read(_v10, "sh"), "flow")), _S.invoke(_S.read(_v10, "Math"), "sign", [_S.logical("||", _S.read(_v10, "x"), func(): return 1)]))), _S.binary("*", _S.read(_v10, "y"), 0.55), _S.prop(_S.read(_v10, "sh"), "flow"), 0, _S.binary("+", _S.binary("+", _S.read(_v10, "seed"), 9), _S.read(_v10, "si"))]))))
			_S.define(_v10, "lv", _S.binary("-", _S.read(_v10, "v"), _S.binary("*", _S.binary("-", _S.read(_v10, "streak"), 0.7), 0.6)))
			_S.define(_v10, "c", (_S.prop(_S.read(_v10, "C"), _S.invoke(_S.read(_v10, "Math"), "max", [1, _S.binary("-", 4, _S.read(_v10, "d"))])) if _S.truth(_S.binary("===", _S.read(_v10, "y"), _S.read(_v10, "top"))) else (_S.prop(_S.read(_v10, "C"), _S.binary("-", 6, _S.read(_v10, "d"))) if _S.truth(_S.binary("<", _S.read(_v10, "lv"), 0.16)) else (_S.prop(_S.read(_v10, "C"), _S.binary("-", 5, _S.read(_v10, "d"))) if _S.truth(_S.binary("<", _S.read(_v10, "lv"), 0.42)) else (_S.prop(_S.read(_v10, "C"), _S.binary("-", 4, _S.read(_v10, "d"))) if _S.truth(_S.binary("<", _S.read(_v10, "lv"), 0.68)) else _S.prop(_S.read(_v10, "C"), _S.invoke(_S.read(_v10, "Math"), "max", [1, _S.binary("-", 3, _S.read(_v10, "d"))])))))))
			_S.invoke(_S.read(_v10, "p"), "blend", [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.read(_v10, "c"), _S.binary("*", _S.prop(_S.read(_v10, "sh"), "a"), (0.65 if _S.truth(_S.binary("===", _S.read(_v10, "y"), _S.read(_v10, "top"))) else _S.binary("*", _S.binary("+", 0.6, _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_v10, "v")))), _S.read(_v10, "streak"))))])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "y", 1, "+=", true)
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "x", 1, "+=", true)
	for _v11 in _S.array(_S.read(_e, "T")):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "g", _v11)
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "k", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v13, "Math"), "PI"), _S.prop(_S.read(_v13, "g"), "q"))]))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v13, "k"), 0.15), func(): return _S.binary("<", _S.prop(_S.read(_v13, "g"), "h"), 4))):
			continue
		_S.define(_v13, "r", _S.binary("+", 1.8, _S.binary("*", _S.prop(_S.read(_v13, "g"), "h"), 0.22)))
		_S.define(_v13, "cx", _S.binary("-", _S.prop(_S.read(_v13, "g"), "x"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v13, "g"), "s"), _S.read(_v13, "r")), 0.6)))
		_S.define(_v13, "cy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v13, "g"), "h")), 0.72))
		_S.define(_v13, "spin", _S.binary("*", _S.binary("*", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v13, "g"), "s")), _S.prop(_S.read(_v13, "g"), "q")), _S.read(_v13, "TAU")), 2.2))
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "a", 0)
		while _S.truth(_S.binary("<", _S.read(_v14, "a"), 4.6)):
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "rr", _S.binary("*", _S.read(_v15, "r"), _S.binary("-", 1, _S.binary("*", _S.read(_v15, "a"), 0.12))))
			_S.define(_v15, "px", _S.binary("+", _S.read(_v15, "cx"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v15, "g"), "s"), _S.invoke(_S.read(_v15, "Math"), "cos", [_S.binary("+", _S.read(_v15, "spin"), _S.read(_v15, "a"))])), _S.read(_v15, "rr"))))
			_S.define(_v15, "py", _S.binary("+", _S.read(_v15, "cy"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.binary("+", _S.read(_v15, "spin"), _S.read(_v15, "a"))]), _S.read(_v15, "rr"))))
			_S.define(_v15, "w", _S.binary("*", 1.6, _S.binary("-", 1, _S.binary("/", _S.read(_v15, "a"), 6))))
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "o", _S.unary("-", _S.read(_v16, "w")))
			while _S.truth(_S.binary("<=", _S.read(_v16, "o"), _S.read(_v16, "w"))):
				var _v17 = _S.scope(_v16)
				_S.define(_v17, "qx", _S.binary("+", _S.read(_v17, "px"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v17, "g"), "s"), _S.invoke(_S.read(_v17, "Math"), "cos", [_S.binary("+", _S.read(_v17, "spin"), _S.read(_v17, "a"))])), _S.read(_v17, "o"))))
				_S.define(_v17, "qy", _S.binary("+", _S.read(_v17, "py"), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.binary("+", _S.read(_v17, "spin"), _S.read(_v17, "a"))]), _S.read(_v17, "o"))))
				_S.invoke(_S.read(_v17, "p"), "blend", [_S.read(_v17, "qx"), _S.read(_v17, "qy"), (_S.prop(_S.read(_v17, "C"), _S.binary("-", 5, _S.read(_v17, "d"))) if _S.truth(_S.binary(">", _S.read(_v17, "o"), _S.binary("*", _S.read(_v17, "w"), 0.4))) else _S.prop(_S.read(_v17, "C"), _S.binary("-", 4, _S.read(_v17, "d")))), _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v17, "sh"), "a"), 0.75), _S.read(_v17, "k")), _S.binary("-", 1, _S.binary("/", _S.read(_v17, "a"), 5.5)))])
				_v16 = _S.iteration(_v16)
				_S.write(_v16, "o", 0.8, "+=", false)
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "a", 0.1, "+=", false)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "E", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "seed", _S.arg(_args, 4))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 5, _S.read(_e, "seed"), _S.function_value(_e, "_f4"), _S.function_value(_e, "_f5")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [2.4, 3.2])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "L")))
	_S.define(_e, "x0", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.55), 0.55]), _S.read(_e, "E")))
	_S.define(_e, "rise", _S.invoke(_S.read(_e, "R"), "range", [13, 19]))
	_S.define(_e, "len", _S.invoke(_S.read(_e, "R"), "range", [34, 48]))
	_S.define(_e, "ph", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "amp", _S.invoke(_S.read(_e, "R"), "range", [3, 5]))
	_S.define(_e, "head", _S.binary("+", 14, _S.binary("*", _S.read(_e, "rise"), _S.read(_e, "age"))))
	_S.define(_e, "tail", _S.invoke(_S.read(_e, "Math"), "max", [10, _S.binary("-", _S.read(_e, "head"), _S.read(_e, "len"))]))
	_S.define(_e, "fade", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, 0.15, _S.read(_e, "u")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.5, 1, _S.read(_e, "u")]))))
	var _v18 = _S.scope(_e)
	_S.define(_v18, "h", _S.read(_v18, "tail"))
	while _S.truth(_S.binary("<=", _S.read(_v18, "h"), _S.read(_v18, "head"))):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "s", _S.binary("/", _S.binary("-", _S.read(_v19, "h"), _S.read(_v19, "tail")), _S.invoke(_S.read(_v19, "Math"), "max", [1, _S.binary("-", _S.read(_v19, "head"), _S.read(_v19, "tail"))])))
		_S.define(_v19, "tw", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v19, "h"), 0.22), _S.binary("*", _S.read(_v19, "age"), 2.4)), _S.read(_v19, "ph"))]))
		_S.define(_v19, "w", _S.binary("+", 0.6, _S.binary("*", _S.binary("*", 2.2, _S.invoke(_S.read(_v19, "Math"), "abs", [_S.read(_v19, "tw")])), _S.binary("-", 1, _S.binary("*", _S.read(_v19, "s"), 0.5)))))
		_S.define(_v19, "x", _S.binary("+", _S.read(_v19, "x0"), _S.binary("*", _S.binary("*", _S.read(_v19, "amp"), _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v19, "h"), 0.12), _S.read(_v19, "age")), _S.read(_v19, "ph"))])), _S.binary("+", 0.4, _S.read(_v19, "s")))))
		_S.define(_v19, "a", _S.binary("*", _S.binary("*", _S.read(_v19, "fade"), _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v19, "Math"), "PI"), _S.invoke(_S.read(_v19, "Math"), "min", [1, _S.binary("*", _S.read(_v19, "s"), 1.2)]))])), 0.32))
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "o", _S.unary("-", _S.read(_v20, "w")))
		while _S.truth(_S.binary("<=", _S.read(_v20, "o"), _S.read(_v20, "w"))):
			_S.invoke(_S.read(_v20, "p"), "blend", [_S.binary("+", _S.read(_v20, "x"), _S.read(_v20, "o")), _S.unary("-", _S.read(_v20, "h")), ((_S.prop(_S.read(_v20, "C"), 6) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v20, "Math"), "abs", [_S.read(_v20, "o")]), _S.binary("*", _S.read(_v20, "w"), 0.5))) else _S.prop(_S.read(_v20, "C"), 5)) if _S.truth(_S.binary(">", _S.read(_v20, "tw"), 0)) else (_S.prop(_S.read(_v20, "C"), 3) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v20, "Math"), "abs", [_S.read(_v20, "o")]), _S.binary("*", _S.read(_v20, "w"), 0.5))) else _S.prop(_S.read(_v20, "C"), 2))), _S.read(_v20, "a")])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "o", 1, "+=", false)
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "h", 0.7, "+=", false)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "E", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "seed", _S.arg(_args, 4))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 30, _S.read(_e, "seed"), _S.function_value(_e, "_f7"), _S.function_value(_e, "_f8")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [1.5, 2.6])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "L")))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "R"), "sign", []))
	_S.define(_e, "x", _S.binary("*", _S.read(_e, "s"), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [0.05, 0.7]), _S.read(_e, "E")), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "R"), "range", [6, 14])))))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [2, 20])), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "R"), "range", [1.5, 3])), _S.binary("*", _S.invoke(_S.read(_e, "R"), "next", []), _S.read(_e, "TAU")))]), 2)))
	_S.define(_e, "a", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "u"), 5)]), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_e, "u")), 3)])), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "R"), "range", [6, 10])), _S.binary("*", _S.invoke(_S.read(_e, "R"), "next", []), _S.read(_e, "TAU")))])))))
	if _S.truth(_S.binary("<", _S.read(_e, "a"), 0.1)):
		return null
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary(">", _S.read(_e, "a"), 0.7)) else _S.prop(_S.read(_e, "C"), 6)), _S.binary("*", _S.read(_e, "a"), 1.3)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 4, _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.3, _S.read(_e, "a"))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "E", _S.binary("*", 96, _S.prop(_S.read(_e, "o"), "spread")))
	_S.define(_e, "pulse", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), 2), _S.read(_e, "D"))]))))
	var _v21 = _S.scope(_e)
	_S.define(_v21, "x", _S.unary("-", _S.read(_v21, "E")))
	while _S.truth(_S.binary("<=", _S.read(_v21, "x"), _S.read(_v21, "E"))):
		_S.invoke(_S.read(_v21, "p"), "glow", [_S.read(_v21, "x"), _S.unary("-", 3), 30, _S.prop(_S.read(_v21, "C"), 5), _S.binary("*", _S.binary("*", 0.14, _S.read(_v21, "pulse")), _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v21, "Math"), "abs", [_S.read(_v21, "x")]), _S.binary("*", _S.read(_v21, "E"), 1.3))))])
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "x", 22, "+=", false)
	var _v22 = _S.scope(_e)
	_S.define(_v22, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v22, "i"), 6)):
		var _v23 = _S.scope(_v22)
		_S.define(_v23, "R", _S.call_value(_S.read(_v23, "rng"), [_S.prop(_S.read(_v23, "o"), "seed"), _S.read(_v23, "i"), 7]))
		_S.define(_v23, "x", _S.binary("+", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.read(_v23, "TAU"), _S.read(_v23, "t")), _S.read(_v23, "D")), _S.invoke(_S.read(_v23, "R"), "range", [0, _S.read(_v23, "TAU")]))]), _S.read(_v23, "E")), _S.invoke(_S.read(_v23, "R"), "range", [0.2, 0.7])), _S.binary("*", _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 0.3), 0.3]), _S.read(_v23, "E"))))
		_S.define(_v23, "k", _S.binary("+", 0.6, _S.binary("*", 0.4, _S.invoke(_S.read(_v23, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v23, "TAU"), _S.read(_v23, "t")), 3), _S.read(_v23, "D")), _S.read(_v23, "i"))]))))
		_S.invoke(_S.read(_v23, "p"), "glow", [_S.read(_v23, "x"), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [4, 10])), _S.invoke(_S.read(_v23, "R"), "range", [14, 22]), _S.prop(_S.read(_v23, "C"), 6), _S.binary("*", 0.2, _S.read(_v23, "k"))])
		_v22 = _S.iteration(_v22)
		_S.write(_v22, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "SHEETS"), "forEach", [_S.function_value(_e, "_f10")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "sh", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.logical("&&", _S.prop(_S.read(_e, "sh"), "back"), func(): return _S.call_value(_S.read(_e, "sheet"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "sh"), _S.read(_e, "i"), _S.read(_e, "E"), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed")]))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "E", _S.binary("*", 96, _S.prop(_S.read(_e, "o"), "spread")))
	_S.call_value(_S.read(_e, "plumes"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "E"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7), 2)])
	_S.invoke(_S.read(_e, "SHEETS"), "forEach", [_S.function_value(_e, "_f12")])
	_S.call_value(_S.read(_e, "specks"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "E"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 11), 5)])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 6), _S.binary("*", _S.read(_e, "E"), 0.9), _S.prop(_S.read(_e, "C"), 5), 0.1])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "sh", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.logical("&&", _S.unary("!", _S.prop(_S.read(_e, "sh"), "back")), func(): return _S.call_value(_S.read(_e, "sheet"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "sh"), _S.read(_e, "i"), _S.read(_e, "E"), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed")]))
