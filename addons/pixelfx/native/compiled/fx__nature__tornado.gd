@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/tornado.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "bolt", _S.import_value("core/index.js", "bolt"))
	_S.define(_e, "drawRock", _S.import_value("fx/nature/_lib.js", "drawRock"))
	_S.define(_e, "stoneShape", _S.import_value("fx/nature/_lib.js", "stoneShape"))
	_S.define(_e, "drawLeaf", _S.import_value("fx/nature/_lib.js", "drawLeaf"))
	_S.define(_e, "geo", _S.function_value(_e, "_f0"))
	_S.define(_e, "body", _S.function_value(_e, "_f3"))
	_S.define(_e, "bands", _S.function_value(_e, "_f4"))
	_S.define(_e, "blob", _S.function_value(_e, "_f5"))
	_S.define(_e, "crown", _S.function_value(_e, "_f6"))
	_S.define(_e, "debris", _S.function_value(_e, "_f8"))
	_S.define(_e, "skirt", _S.function_value(_e, "_f11"))
	_S.define(_e, "flashAt", _S.function_value(_e, "_f16"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f17"))
	_S.define(_e, "draw", _S.function_value(_e, "_f18"))
	_S.define(_e, "meta", _S.merge([{"name": "Tornado"}, {"desc": "A snaking funnel of spinning wind bands under a flared, churning top that flickers with lightning; leaves and debris whirl round it front and back, dust boils at its foot."}, {"tags": ["nature", "wind", "tornado", "storm", "hazard", "ground", "loop"]}, {"size": [196, 168]}, {"origin": [98, 152]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#141221", "#231f33", "#36314a", "#4d4762", "#68617d", "#8a839e", "#b3adc4", "#e2def0"]}, {"dust": ["#2a2018", "#4e3e2e", "#76624a", "#a08a6a", "#cbb894"]}, {"leaves": ["#4a200c", "#a8541c", "#e8962e", "#ffd27a", "#123818", "#2f7a2a", "#6cb83a", "#c8f070"]}, {"height": 112}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SY", 0.28)
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), _S.prop(_S.read(_e, "meta"), "duration")))
	_S.define(_e, "FH", _S.prop(_S.read(_e, "o"), "height"))
	return _S.merge([{"FH": _S.read(_e, "FH")}, {"ph": _S.read(_e, "ph")}, {"ax": _S.function_value(_e, "_f1")}, {"rad": _S.function_value(_e, "_f2")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("*", _S.binary("*", 8.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.read(_e, "ph"), _S.binary("*", 2.6, _S.read(_e, "u")))])), _S.binary("+", 0.2, _S.binary("*", 0.8, _S.read(_e, "u")))), _S.binary("*", _S.binary("*", 3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("+", _S.binary("*", 2, _S.read(_e, "ph")), 1.3), _S.binary("*", 4.5, _S.read(_e, "u")))])), _S.read(_e, "u")))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", 3, _S.binary("*", 20, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "u"), 1.5]))), _S.binary("*", 17, _S.invoke(_S.read(_e, "Math"), "pow", [_S.call_value(_S.read(_e, "smooth"), [0.78, 1, _S.read(_e, "u")]), 2])))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "Dst", _S.arg(_args, 2))
	_S.define(_e, "g", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "seed", _S.arg(_args, 5))
	var _v0 = _S.read(_e, "g")
	_S.define(_e, "FH", _S.prop(_v0, "FH"))
	_S.define(_e, "ax", _S.prop(_v0, "ax"))
	_S.define(_e, "rad", _S.prop(_v0, "rad"))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "y", _S.binary("+", _S.unary("-", _S.invoke(_S.read(_v1, "Math"), "ceil", [_S.read(_v1, "FH")])), 2))
	while _S.truth(_S.binary("<=", _S.read(_v1, "y"), 0)):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "u", _S.binary("/", _S.unary("-", _S.read(_v2, "y")), _S.read(_v2, "FH")))
		_S.define(_v2, "cx", _S.call_value(_S.read(_v2, "ax"), [_S.read(_v2, "u")]))
		_S.define(_v2, "r", _S.call_value(_S.read(_v2, "rad"), [_S.read(_v2, "u")]))
		_S.define(_v2, "K", _S.binary("+", 2, (1 if _S.truth(_S.binary("<", _S.call_value(_S.read(_v2, "rand"), [_S.read(_v2, "y"), _S.read(_v2, "seed")]), 0.35)) else 0)))
		_S.define(_v2, "rot", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v2, "TAU"), _S.read(_v2, "K")), _S.read(_v2, "t")), _S.prop(_S.read(_v2, "meta"), "duration")))
		_S.define(_v2, "fade", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "min", [1, _S.binary("+", _S.binary("*", _S.read(_v2, "u"), 8), 0.25)]), _S.binary("-", 1, _S.call_value(_S.read(_v2, "smooth"), [0.9, 1.02, _S.read(_v2, "u")]))))
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "x", _S.invoke(_S.read(_v3, "Math"), "floor", [_S.binary("-", _S.read(_v3, "cx"), _S.read(_v3, "r"))]))
		while _S.truth(_S.binary("<=", _S.read(_v3, "x"), _S.invoke(_S.read(_v3, "Math"), "ceil", [_S.binary("+", _S.read(_v3, "cx"), _S.read(_v3, "r"))]))):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "c", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v4, "x"), 0.5), _S.read(_v4, "cx")), _S.read(_v4, "r")))
			if _S.truth(_S.binary(">", _S.invoke(_S.read(_v4, "Math"), "abs", [_S.read(_v4, "c")]), 1)):
				_v3 = _S.iteration(_v3)
				_S.write(_v3, "x", 1, "+=", true)
				continue
			_S.define(_v4, "n", _S.call_value(_S.read(_v4, "tileNoise"), [_S.binary("/", _S.binary("*", _S.binary("+", _S.invoke(_S.read(_v4, "Math"), "acos", [_S.read(_v4, "c")]), _S.read(_v4, "rot")), 6), _S.read(_v4, "TAU")), _S.binary("*", _S.read(_v4, "y"), 0.34), 6, 0, _S.read(_v4, "seed")]))
			_S.define(_v4, "v", _S.binary("+", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v4, "c")), 0.55), 0.15), _S.binary("*", _S.read(_v4, "n"), 0.55)))
			_S.define(_v4, "col", (_S.prop(_S.read(_v4, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v4, "v"), 0.6)) else (_S.prop(_S.read(_v4, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v4, "v"), 0.28)) else (_S.prop(_S.read(_v4, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v4, "v"), _S.unary("-", 0.05))) else (_S.prop(_S.read(_v4, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v4, "v"), _S.unary("-", 0.4))) else _S.prop(_S.read(_v4, "C"), 2))))))
			if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.3)):
				_S.write(_v4, "col", _S.call_value(_S.read(_v4, "mix"), [_S.read(_v4, "col"), _S.prop(_S.read(_v4, "Dst"), (3 if _S.truth(_S.binary(">", _S.read(_v4, "v"), 0.3)) else (2 if _S.truth(_S.binary(">", _S.read(_v4, "v"), _S.unary("-", 0.2))) else 1))), _S.binary("*", 0.7, _S.binary("-", 1, _S.binary("/", _S.read(_v4, "u"), 0.3)))]), "=", false)
			_S.invoke(_S.read(_v4, "p"), "blend", [_S.read(_v4, "x"), _S.read(_v4, "y"), _S.read(_v4, "col"), _S.binary("*", _S.binary("+", 0.14, _S.binary("*", 0.36, _S.invoke(_S.read(_v4, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_v4, "c"), _S.read(_v4, "c")))]))), _S.read(_v4, "fade"))])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "x", 1, "+=", true)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "y", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "g", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "seed", _S.arg(_args, 4))
	_S.define(_e, "back", _S.arg(_args, 5))
	var _v5 = _S.read(_e, "g")
	_S.define(_e, "FH", _S.prop(_v5, "FH"))
	_S.define(_e, "ax", _S.prop(_v5, "ax"))
	_S.define(_e, "rad", _S.prop(_v5, "rad"))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "j"), 58)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "R", _S.call_value(_S.read(_v7, "rng"), [_S.read(_v7, "seed"), _S.read(_v7, "j")]))
		_S.define(_v7, "u", _S.binary("/", _S.binary("+", _S.read(_v7, "j"), _S.invoke(_S.read(_v7, "R"), "range", [0.1, 0.9])), 58))
		_S.define(_v7, "K", _S.invoke(_S.read(_v7, "R"), "int", [2, 4]))
		_S.define(_v7, "span", _S.invoke(_S.read(_v7, "R"), "range", [0.7, 2.1]))
		_S.define(_v7, "lvl", _S.invoke(_S.read(_v7, "R"), "next", []))
		_S.define(_v7, "cx", _S.call_value(_S.read(_v7, "ax"), [_S.read(_v7, "u")]))
		_S.define(_v7, "r", _S.binary("*", _S.call_value(_S.read(_v7, "rad"), [_S.read(_v7, "u")]), _S.invoke(_S.read(_v7, "R"), "range", [1, 1.1])))
		_S.define(_v7, "y0", _S.binary("*", _S.unary("-", _S.read(_v7, "u")), _S.read(_v7, "FH")))
		_S.define(_v7, "head", _S.binary("+", _S.invoke(_S.read(_v7, "R"), "range", [0, _S.read(_v7, "TAU")]), _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v7, "TAU"), _S.read(_v7, "K")), _S.read(_v7, "t")), _S.prop(_S.read(_v7, "meta"), "duration"))))
		if _S.truth(_S.binary(">", _S.read(_v7, "u"), 0.97)):
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "j", 1, "+=", true)
			continue
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "s", 0)
		while _S.truth(_S.binary("<=", _S.read(_v8, "s"), _S.read(_v8, "span"))):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "th", _S.binary("-", _S.read(_v9, "head"), _S.read(_v9, "s")))
			_S.define(_v9, "sn", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "th")]))
			if _S.truth(_S.binary("===", _S.binary(">", _S.read(_v9, "sn"), 0), _S.read(_v9, "back"))):
				_v8 = _S.iteration(_v8)
				_S.write(_v8, "s", _S.binary("/", 0.5, _S.invoke(_S.read(_v8, "Math"), "max", [2, _S.read(_v8, "r")])), "+=", false)
				continue
			_S.define(_v9, "k", _S.binary("/", _S.read(_v9, "s"), _S.read(_v9, "span")))
			_S.define(_v9, "x", _S.binary("+", _S.read(_v9, "cx"), _S.binary("*", _S.read(_v9, "r"), _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "th")]))))
			_S.define(_v9, "y", _S.binary("+", _S.read(_v9, "y0"), _S.binary("*", _S.binary("*", _S.read(_v9, "r"), _S.read(_v9, "SY")), _S.read(_v9, "sn"))))
			_S.define(_v9, "lit", _S.binary("<", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "th")]), 0.2))
			_S.define(_v9, "i", (2 if _S.truth(_S.binary("<", _S.read(_v9, "lvl"), 0.18)) else (7 if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v9, "k"), 0.15), func(): return _S.binary(">", _S.read(_v9, "lvl"), 0.55))) else ((6 if _S.truth(_S.read(_v9, "lit")) else 5) if _S.truth(_S.binary("<", _S.read(_v9, "k"), 0.45)) else (5 if _S.truth(_S.read(_v9, "lit")) else 4)))))
			if _S.truth(_S.read(_v9, "back")):
				_S.write(_v9, "i", _S.invoke(_S.read(_v9, "Math"), "max", [1, _S.binary("-", _S.read(_v9, "i"), 2)]), "=", false)
			if _S.truth(_S.binary("<", _S.read(_v9, "k"), 0.5)):
				_S.invoke(_S.read(_v9, "p"), "dot", [_S.read(_v9, "x"), _S.read(_v9, "y"), _S.prop(_S.read(_v9, "C"), _S.read(_v9, "i"))])
			else:
				_S.invoke(_S.read(_v9, "p"), "blend", [_S.read(_v9, "x"), _S.read(_v9, "y"), _S.prop(_S.read(_v9, "C"), _S.read(_v9, "i")), _S.binary("*", 2, _S.binary("-", 1, _S.read(_v9, "k")))])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "s", _S.binary("/", 0.5, _S.invoke(_S.read(_v8, "Math"), "max", [2, _S.read(_v8, "r")])), "+=", false)
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.unary("!", _S.read(_v7, "back")), func(): return _S.binary(">", _S.read(_v7, "lvl"), 0.6)), func(): return _S.binary(">", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "head")]), 0))):
			var _v10 = _S.scope(_v7)
			_S.define(_v10, "hx", _S.binary("+", _S.read(_v10, "cx"), _S.binary("*", _S.read(_v10, "r"), _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "head")]))))
			_S.define(_v10, "hy", _S.binary("+", _S.read(_v10, "y0"), _S.binary("*", _S.binary("*", _S.read(_v10, "r"), _S.read(_v10, "SY")), _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "head")]))))
			_S.invoke(_S.read(_v10, "p"), "dot", [_S.read(_v10, "hx"), _S.read(_v10, "hy"), _S.read(_v10, "WHITE")])
			_S.invoke(_S.read(_v10, "p"), "glow", [_S.read(_v10, "hx"), _S.read(_v10, "hy"), 5, _S.prop(_S.read(_v10, "C"), 6), 0.3])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "j", 1, "+=", true)
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
	var _v11 = _S.scope(_e)
	_S.define(_v11, "y", _S.invoke(_S.read(_v11, "Math"), "floor", [_S.binary("-", _S.read(_v11, "cy"), _S.read(_v11, "ry"))]))
	while _S.truth(_S.binary("<=", _S.read(_v11, "y"), _S.invoke(_S.read(_v11, "Math"), "ceil", [_S.binary("+", _S.read(_v11, "cy"), _S.read(_v11, "ry"))]))):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "x", _S.invoke(_S.read(_v12, "Math"), "floor", [_S.binary("-", _S.read(_v12, "cx"), _S.read(_v12, "rx"))]))
		while _S.truth(_S.binary("<=", _S.read(_v12, "x"), _S.invoke(_S.read(_v12, "Math"), "ceil", [_S.binary("+", _S.read(_v12, "cx"), _S.read(_v12, "rx"))]))):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "dx", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v13, "x"), 0.5), _S.read(_v13, "cx")), _S.read(_v13, "rx")))
			_S.define(_v13, "dy", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v13, "y"), 0.5), _S.read(_v13, "cy")), _S.read(_v13, "ry")))
			if _S.truth(_S.binary("<=", _S.binary("+", _S.binary("*", _S.read(_v13, "dx"), _S.read(_v13, "dx")), _S.binary("*", _S.read(_v13, "dy"), _S.read(_v13, "dy"))), 1)):
				_S.invoke(_S.read(_v13, "p"), "blend", [_S.read(_v13, "x"), _S.read(_v13, "y"), _S.read(_v13, "c"), _S.read(_v13, "a")])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "x", 1, "+=", true)
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "y", 1, "+=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "g", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "seed", _S.arg(_args, 4))
	_S.define(_e, "back", _S.arg(_args, 5))
	_S.define(_e, "flash", _S.arg(_args, 6))
	var _v14 = _S.read(_e, "g")
	_S.define(_e, "FH", _S.prop(_v14, "FH"))
	_S.define(_e, "ax", _S.prop(_v14, "ax"))
	_S.define(_e, "rad", _S.prop(_v14, "rad"))
	_S.define(_e, "cx", _S.call_value(_S.read(_e, "ax"), [1]))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rad"), [1]))
	_S.define(_e, "L", _S.function_value(_e, "_f7"))
	_S.define(_e, "y0", _S.binary("-", _S.unary("-", _S.read(_e, "FH")), 3))
	if _S.truth(_S.read(_e, "back")):
		var _v15 = _S.scope(_e)
		_S.call_value(_S.read(_v15, "blob"), [_S.read(_v15, "p"), _S.read(_v15, "cx"), _S.binary("+", _S.read(_v15, "y0"), 1), _S.binary("*", _S.read(_v15, "r"), 0.85), 6, _S.prop(_S.read(_v15, "C"), 1), 0.6])
		_S.call_value(_S.read(_v15, "blob"), [_S.read(_v15, "p"), _S.binary("-", _S.read(_v15, "cx"), 4), _S.binary("-", _S.read(_v15, "y0"), 3), _S.binary("*", _S.read(_v15, "r"), 0.6), 3.5, _S.call_value(_S.read(_v15, "L"), [_S.prop(_S.read(_v15, "C"), 3)]), 0.45])
	var _v16 = _S.scope(_e)
	_S.define(_v16, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "j"), 16)):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "R", _S.call_value(_S.read(_v17, "rng"), [_S.read(_v17, "seed"), _S.read(_v17, "j")]))
		_S.define(_v17, "rr", _S.binary("*", _S.read(_v17, "r"), _S.invoke(_S.read(_v17, "R"), "range", [0.4, 1.15])))
		_S.define(_v17, "K", _S.invoke(_S.read(_v17, "R"), "int", [1, 2]))
		_S.define(_v17, "span", _S.invoke(_S.read(_v17, "R"), "range", [1.4, 2.8]))
		_S.define(_v17, "head", _S.binary("+", _S.invoke(_S.read(_v17, "R"), "range", [0, _S.read(_v17, "TAU")]), _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v17, "TAU"), _S.read(_v17, "K")), _S.read(_v17, "t")), _S.prop(_S.read(_v17, "meta"), "duration"))))
		_S.define(_v17, "th0", _S.invoke(_S.read(_v17, "R"), "range", [3.2, 6]))
		_S.define(_v17, "lift", _S.binary("-", _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 4), 3]), _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_v17, "rr"), _S.binary("*", _S.read(_v17, "r"), 1.15))), 5)))
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "s2", 0)
		while _S.truth(_S.binary("<=", _S.read(_v18, "s2"), _S.read(_v18, "span"))):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "th", _S.binary("-", _S.read(_v19, "head"), _S.read(_v19, "s2")))
			_S.define(_v19, "sn", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "th")]))
			if _S.truth(_S.binary("===", _S.binary(">", _S.read(_v19, "sn"), 0), _S.read(_v19, "back"))):
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "s2", _S.binary("/", 0.6, _S.read(_v18, "rr")), "+=", false)
				continue
			_S.define(_v19, "k", _S.binary("/", _S.read(_v19, "s2"), _S.read(_v19, "span")))
			_S.define(_v19, "th2", _S.binary("*", _S.read(_v19, "th0"), _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v19, "Math"), "PI"), _S.invoke(_S.read(_v19, "Math"), "pow", [_S.binary("-", 1, _S.read(_v19, "k")), 0.7]))])))
			_S.define(_v19, "x", _S.binary("+", _S.read(_v19, "cx"), _S.binary("*", _S.read(_v19, "rr"), _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "th")]))))
			_S.define(_v19, "y", _S.binary("+", _S.binary("+", _S.read(_v19, "y0"), _S.read(_v19, "lift")), _S.binary("*", _S.binary("*", _S.read(_v19, "rr"), _S.read(_v19, "SY")), _S.read(_v19, "sn"))))
			_S.define(_v19, "T", _S.invoke(_S.read(_v19, "Math"), "max", [1, _S.invoke(_S.read(_v19, "Math"), "round", [_S.read(_v19, "th2")])]))
			_S.define(_v19, "d", (1 if _S.truth(_S.read(_v19, "back")) else 0))
			_S.define(_v19, "lit", _S.binary("<", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "th")]), 0.3))
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v20, "i"), _S.read(_v20, "T"))):
				var _v21 = _S.scope(_v20)
				_S.define(_v21, "c", (_S.call_value(_S.read(_v21, "L"), [_S.prop(_S.read(_v21, "C"), _S.binary("-", (6 if _S.truth(_S.read(_v21, "lit")) else 5), _S.read(_v21, "d")))]) if _S.truth(_S.binary("===", _S.read(_v21, "i"), 0)) else (_S.prop(_S.read(_v21, "C"), 1) if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v21, "i"), _S.binary("-", _S.read(_v21, "T"), 1)), func(): return _S.binary(">", _S.read(_v21, "T"), 2))) else _S.call_value(_S.read(_v21, "L"), [_S.prop(_S.read(_v21, "C"), _S.binary("-", (4 if _S.truth(_S.binary("===", _S.read(_v21, "i"), 1)) else 3), _S.read(_v21, "d")))]))))
				_S.invoke(_S.read(_v21, "p"), "blend", [_S.read(_v21, "x"), _S.binary("+", _S.binary("-", _S.read(_v21, "y"), _S.binary("/", _S.read(_v21, "T"), 2)), _S.read(_v21, "i")), _S.read(_v21, "c"), _S.binary("*", _S.binary("+", 0.55, _S.binary("*", 0.35, _S.binary("-", 1, _S.read(_v21, "k")))), (0.75 if _S.truth(_S.read(_v21, "back")) else 1))])
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "i", 1, "+=", true)
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "s2", _S.binary("/", 0.6, _S.read(_v18, "rr")), "+=", false)
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "j", 1, "+=", true)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.prop(_S.read(_e, "C"), 7), _S.binary("*", _S.read(_e, "flash"), 0.6)])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "L", _S.arg(_args, 2))
	_S.define(_e, "g", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "seed", _S.arg(_args, 5))
	_S.define(_e, "back", _S.arg(_args, 6))
	_S.define(_e, "S", _S.arg(_args, 7))
	var _v22 = _S.read(_e, "g")
	_S.define(_e, "FH", _S.prop(_v22, "FH"))
	_S.define(_e, "ax", _S.prop(_v22, "ax"))
	_S.define(_e, "rad", _S.prop(_v22, "rad"))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), 24, _S.read(_e, "seed"), _S.function_value(_e, "_f9"), _S.function_value(_e, "_f10")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "q"), "range", [1.3, 1.95])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "sk", _S.invoke(_S.read(_e, "R"), "range", [0.15, 0.3]))
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "k"), _S.read(_e, "sk")), _S.binary("-", 1, _S.read(_e, "sk")))]))
	_S.define(_e, "u", _S.call_value(_S.read(_e, "lerp"), [0.03, 0.98, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "q"), 0.85])]))
	_S.define(_e, "th", _S.binary("+", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [2, 3.2]), _S.read(_e, "TAU")), _S.read(_e, "k"))))
	_S.define(_e, "sn", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]))
	if _S.truth(_S.binary("===", _S.binary(">", _S.read(_e, "sn"), 0), _S.read(_e, "back"))):
		return null
	_S.define(_e, "fling", _S.call_value(_S.read(_e, "smooth"), [0.78, 1, _S.read(_e, "q")]))
	_S.define(_e, "inward", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0, _S.read(_e, "sk"), _S.read(_e, "k")])))
	_S.define(_e, "far", _S.invoke(_S.read(_e, "R"), "range", [26, 44]))
	_S.define(_e, "rr", _S.call_value(_S.read(_e, "lerp"), [_S.invoke(_S.read(_e, "Math"), "min", [68, _S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "rad"), [_S.read(_e, "u")]), _S.binary("+", 1.12, _S.binary("*", _S.read(_e, "fling"), 1.1))), _S.invoke(_S.read(_e, "R"), "range", [2, 7]))]), _S.read(_e, "far"), _S.read(_e, "inward")]))
	_S.define(_e, "x", _S.binary("+", _S.call_value(_S.read(_e, "ax"), [_S.read(_e, "u")]), _S.binary("*", _S.read(_e, "rr"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]))))
	_S.define(_e, "y", _S.invoke(_S.read(_e, "Math"), "min", [_S.unary("-", 1), _S.binary("-", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "u")), _S.read(_e, "FH")), _S.binary("*", _S.binary("*", _S.read(_e, "rr"), _S.read(_e, "SY")), _S.read(_e, "sn"))), _S.binary("*", _S.read(_e, "fling"), 8))]))
	_S.define(_e, "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 8)]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.85, 1, _S.read(_e, "k")]))))
	_S.define(_e, "kind", _S.invoke(_S.read(_e, "R"), "next", []))
	_S.define(_e, "spin", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 14), 14]), _S.read(_e, "age")))
	_S.define(_e, "dk", (1 if _S.truth(_S.read(_e, "back")) else 0))
	if _S.truth(_S.binary("<", _S.read(_e, "kind"), 0.62)):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "o", (0 if _S.truth(_S.binary("<", _S.invoke(_S.read(_v23, "R"), "next", []), 0.5)) else 4))
		_S.define(_v23, "pal", [_S.prop(_S.read(_v23, "L"), _S.read(_v23, "o")), _S.prop(_S.read(_v23, "L"), _S.binary("+", _S.read(_v23, "o"), 1)), _S.prop(_S.read(_v23, "L"), _S.binary("-", _S.binary("+", _S.read(_v23, "o"), 2), _S.read(_v23, "dk"))), _S.prop(_S.read(_v23, "L"), _S.binary("-", _S.binary("+", _S.read(_v23, "o"), 3), _S.read(_v23, "dk")))])
		_S.call_value(_S.read(_v23, "drawLeaf"), [_S.read(_v23, "p"), _S.read(_v23, "x"), _S.read(_v23, "y"), _S.invoke(_S.read(_v23, "R"), "range", [6, 9]), _S.invoke(_S.read(_v23, "R"), "range", [1.8, 2.6]), _S.read(_v23, "spin"), _S.binary("*", _S.read(_v23, "age"), _S.invoke(_S.read(_v23, "R"), "range", [5, 10])), _S.read(_v23, "pal"), _S.read(_v23, "a")])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "kind"), 0.8)):
			var _v24 = _S.scope(_e)
			_S.define(_v24, "ca", _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "cos", [_S.read(_v24, "spin")]), 2.5))
			_S.define(_v24, "sa", _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.read(_v24, "spin")]), 2.5))
			_S.invoke(_S.read(_v24, "p"), "line", [_S.binary("-", _S.read(_v24, "x"), _S.read(_v24, "ca")), _S.binary("-", _S.read(_v24, "y"), _S.read(_v24, "sa")), _S.binary("+", _S.read(_v24, "x"), _S.read(_v24, "ca")), _S.binary("+", _S.read(_v24, "y"), _S.read(_v24, "sa")), (_S.prop(_S.read(_v24, "L"), 0) if _S.truth(_S.read(_v24, "back")) else _S.prop(_S.read(_v24, "L"), 1)), _S.read(_v24, "a")])
			_S.invoke(_S.read(_v24, "p"), "dot", [_S.binary("+", _S.read(_v24, "x"), _S.read(_v24, "ca")), _S.binary("+", _S.read(_v24, "y"), _S.read(_v24, "sa")), _S.prop(_S.read(_v24, "L"), 2), _S.read(_v24, "a")])
		else:
			_S.call_value(_S.read(_e, "drawRock"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.invoke(_S.read(_e, "R"), "range", [1.6, 2.6]), _S.read(_e, "spin"), _S.call_value(_S.read(_e, "stoneShape"), [_S.read(_e, "R"), 5]), _S.read(_e, "S"), _S.read(_e, "a")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "D", _S.arg(_args, 1))
	_S.define(_e, "g", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "seed", _S.arg(_args, 4))
	_S.define(_e, "back", _S.arg(_args, 5))
	_S.define(_e, "cx0", _S.invoke(_S.read(_e, "g"), "ax", [0]))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), 40, _S.read(_e, "seed"), _S.function_value(_e, "_f12"), _S.function_value(_e, "_f13")])
	if _S.truth(_S.read(_e, "back")):
		return null
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), 16, _S.binary("+", _S.read(_e, "seed"), 7), _S.function_value(_e, "_f14"), _S.function_value(_e, "_f15")])
	var _v25 = _S.scope(_e)
	_S.define(_v25, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v25, "j"), 7)):
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "R", _S.call_value(_S.read(_v26, "rng"), [_S.binary("+", _S.read(_v26, "seed"), 3), _S.read(_v26, "j")]))
		_S.define(_v26, "rr", _S.invoke(_S.read(_v26, "R"), "range", [12, 28]))
		_S.define(_v26, "th0", _S.binary("+", _S.invoke(_S.read(_v26, "R"), "range", [0, _S.read(_v26, "TAU")]), _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v26, "TAU"), 3), _S.read(_v26, "t")), _S.prop(_S.read(_v26, "meta"), "duration"))))
		_S.define(_v26, "span", _S.invoke(_S.read(_v26, "R"), "range", [0.5, 1.1]))
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "s", 0)
		while _S.truth(_S.binary("<", _S.read(_v27, "s"), _S.read(_v27, "span"))):
			var _v28 = _S.scope(_v27)
			_S.define(_v28, "th", _S.binary("-", _S.read(_v28, "th0"), _S.read(_v28, "s")))
			_S.invoke(_S.read(_v28, "p"), "dot", [_S.binary("+", _S.read(_v28, "cx0"), _S.binary("*", _S.read(_v28, "rr"), _S.invoke(_S.read(_v28, "Math"), "cos", [_S.read(_v28, "th")]))), _S.binary("+", 0.5, _S.binary("*", _S.binary("*", _S.read(_v28, "rr"), 0.18), _S.invoke(_S.read(_v28, "Math"), "sin", [_S.read(_v28, "th")]))), _S.prop(_S.read(_v28, "D"), (3 if _S.truth(_S.binary("<", _S.read(_v28, "s"), _S.binary("*", _S.read(_v28, "span"), 0.4))) else 2)), _S.binary("-", 1, _S.binary("/", _S.read(_v28, "s"), _S.read(_v28, "span")))])
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "s", _S.binary("/", 0.6, _S.read(_v27, "rr")), "+=", false)
		_v25 = _S.iteration(_v25)
		_S.write(_v25, "j", 1, "+=", true)
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "q"), "range", [0.7, 1.3])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "th", _S.binary("+", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]), _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [5, 9]), _S.read(_e, "age"))))
	_S.define(_e, "sn", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]))
	if _S.truth(_S.binary("===", _S.binary(">", _S.read(_e, "sn"), 0), _S.read(_e, "back"))):
		return null
	_S.define(_e, "rr", _S.binary("+", 4, _S.binary("*", _S.read(_e, "k"), _S.invoke(_S.read(_e, "R"), "range", [14, 28]))))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "cx0"), _S.binary("*", _S.read(_e, "rr"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]))))
	_S.define(_e, "y", _S.binary("+", _S.binary("-", _S.unary("-", 1.5), _S.binary("*", _S.read(_e, "k"), _S.invoke(_S.read(_e, "R"), "range", [4, 16]))), _S.binary("*", _S.binary("*", _S.read(_e, "rr"), 0.3), _S.read(_e, "sn"))))
	_S.define(_e, "s", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [3, 6]), _S.binary("+", 0.6, _S.binary("*", 0.8, _S.read(_e, "k")))))
	_S.define(_e, "a", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 6)]), _S.binary("-", 1, _S.read(_e, "k"))), 0.6))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "s"), 0.2)), _S.read(_e, "s"), _S.prop(_S.read(_e, "D"), (1 if _S.truth(_S.read(_e, "back")) else 2)), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "s"), 0.2)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "s"), 0.3)), _S.binary("*", _S.read(_e, "s"), 0.55), _S.prop(_S.read(_e, "D"), (2 if _S.truth(_S.read(_e, "back")) else 3)), _S.binary("*", _S.read(_e, "a"), 0.8)])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "q"), "range", [0.35, 0.6])

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "v", _S.invoke(_S.read(_e, "R"), "range", [25, 55]))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "cx0"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.binary("+", 4, _S.binary("*", _S.read(_e, "v"), _S.read(_e, "age"))))))
	_S.define(_e, "y", _S.binary("+", _S.binary("-", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]), 2), _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [40, 80]), _S.read(_e, "age"))), _S.binary("*", _S.binary("*", 260, _S.read(_e, "age")), _S.read(_e, "age"))))
	if _S.truth(_S.binary("<", _S.read(_e, "y"), 0.5)):
		_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "min", [0, _S.read(_e, "y")]), (_S.prop(_S.read(_e, "D"), 3) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "R"), "next", []), 0.5)) else _S.prop(_S.read(_e, "D"), 4)), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	return _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "q"), 0.62)]), 0.025))]), _S.binary("*", 0.6, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "q"), 0.69)]), 0.015))])))

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "D", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "dust"), 5]))
	_S.define(_e, "g", _S.call_value(_S.read(_e, "geo"), [_S.read(_e, "o"), _S.read(_e, "t")]))
	_S.define(_e, "f", _S.call_value(_S.read(_e, "flashAt"), [_S.read(_e, "t")]))
	_S.call_value(_S.read(_e, "skirt"), [_S.read(_e, "p"), _S.read(_e, "D"), _S.read(_e, "g"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 5), 1), true])
	_S.call_value(_S.read(_e, "crown"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "g"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7), 2), true, _S.read(_e, "f")])
	_S.call_value(_S.read(_e, "bands"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "g"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 3), 5), true])
	_S.call_value(_S.read(_e, "debris"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "leaves"), 8]), _S.read(_e, "g"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 11), 3), true, _S.read(_e, "C")])
	_S.call_value(_S.read(_e, "body"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "D"), _S.read(_e, "g"), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed")])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "D", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "dust"), 5]))
	_S.define(_e, "g", _S.call_value(_S.read(_e, "geo"), [_S.read(_e, "o"), _S.read(_e, "t")]))
	_S.define(_e, "f", _S.call_value(_S.read(_e, "flashAt"), [_S.read(_e, "t")]))
	_S.define(_e, "cx", _S.invoke(_S.read(_e, "g"), "ax", [1]))
	_S.call_value(_S.read(_e, "bands"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "g"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 3), 5), false])
	_S.call_value(_S.read(_e, "crown"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "g"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7), 2), false, _S.read(_e, "f")])
	_S.call_value(_S.read(_e, "skirt"), [_S.read(_e, "p"), _S.read(_e, "D"), _S.read(_e, "g"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 5), 1), false])
	_S.call_value(_S.read(_e, "debris"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "leaves"), 8]), _S.read(_e, "g"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 11), 3), false, _S.read(_e, "C")])
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.invoke(_S.read(_e, "g"), "ax", [0.1]), _S.binary("*", _S.unary("-", _S.prop(_S.read(_e, "g"), "FH")), 0.1), _S.read(_e, "cx"), _S.binary("*", _S.unary("-", _S.prop(_S.read(_e, "g"), "FH")), 0.9), 26, _S.prop(_S.read(_e, "C"), 5), 0.08])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.invoke(_S.read(_e, "g"), "ax", [0]), _S.unary("-", 2), 30, _S.prop(_S.read(_e, "D"), 3), 0.12])
	if _S.truth(_S.binary(">", _S.read(_e, "f"), 0.05)):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "R", _S.call_value(_S.read(_v29, "rng"), [_S.prop(_S.read(_v29, "o"), "seed"), 99, _S.invoke(_S.read(_v29, "Math"), "floor", [_S.binary("*", _S.binary("/", _S.read(_v29, "t"), _S.prop(_S.read(_v29, "meta"), "duration")), 7)])]))
		_S.define(_v29, "path", _S.call_value(_S.read(_v29, "bolt"), [_S.read(_v29, "R"), _S.binary("-", _S.read(_v29, "cx"), 18), _S.binary("-", _S.unary("-", _S.prop(_S.read(_v29, "g"), "FH")), 6), _S.binary("+", _S.read(_v29, "cx"), 16), _S.binary("+", _S.unary("-", _S.prop(_S.read(_v29, "g"), "FH")), 2), _S.merge([{"jag": 0.3}, {"depth": 3}])]))
		_S.invoke(_S.read(_v29, "p"), "polyline", [_S.read(_v29, "path"), (_S.read(_v29, "WHITE") if _S.truth(_S.binary(">", _S.read(_v29, "f"), 0.6)) else _S.prop(_S.read(_v29, "C"), 7)), _S.invoke(_S.read(_v29, "Math"), "min", [1, _S.binary("*", _S.read(_v29, "f"), 1.5)])])
		_S.invoke(_S.read(_v29, "p"), "glow", [_S.read(_v29, "cx"), _S.binary("-", _S.unary("-", _S.prop(_S.read(_v29, "g"), "FH")), 2), 70, _S.prop(_S.read(_v29, "C"), 7), _S.binary("*", 0.45, _S.read(_v29, "f"))])
	return null
