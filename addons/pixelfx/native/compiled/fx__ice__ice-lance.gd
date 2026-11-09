@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/ice-lance.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "blade", _S.import_value("fx/ice/_lib.js", "blade"))
	_S.define(_e, "spear", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Ice lance"}, {"desc": "A faceted ice spear flying right: a light pulse runs through its core, rings of cold air shear off the tip, frost peels off into a wake and crystals shed behind it."}, {"tags": ["ice", "lance", "spear", "projectile", "directional", "magic", "loop"]}, {"size": [176, 64]}, {"origin": [146, 32]}, {"duration": 0.8}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"length": 40}, {"seed": 13}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "L", _S.arg(_args, 2))
	_S.define(_e, "pulse", _S.arg(_args, 3))
	_S.define(_e, "glint", _S.arg(_args, 4))
	_S.define(_e, "T", 16)
	_S.define(_e, "H", 3.5)
	_S.define(_e, "half", _S.function_value(_e, "_f1"))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "L")), 1), _S.binary("-", _S.unary("-", _S.read(_e, "H")), 2), 1, _S.binary("+", _S.read(_e, "H"), 2), _S.function_value(_e, "_f2")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return (_S.binary("+", _S.binary("*", _S.read(_e, "H"), _S.binary("/", _S.unary("-", _S.read(_e, "x")), _S.read(_e, "T"))), 0.3) if _S.truth(_S.binary(">", _S.read(_e, "x"), _S.unary("-", _S.read(_e, "T")))) else (_S.binary("*", _S.read(_e, "H"), _S.binary("+", 0.7, _S.binary("*", 0.3, _S.binary("/", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "L")), 3)))) if _S.truth(_S.binary("<", _S.read(_e, "x"), _S.binary("+", _S.unary("-", _S.read(_e, "L")), 3))) else _S.read(_e, "H")))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "x"), 0), func(): return _S.binary("<", _S.read(_e, "x"), _S.unary("-", _S.read(_e, "L"))))):
		return null
	_S.define(_e, "h", _S.call_value(_S.read(_e, "half"), [_S.read(_e, "x")]))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "y")]), _S.binary("+", _S.read(_e, "h"), 0.5))):
		var _v0 = _S.scope(_e)
		if _S.truth(_S.binary("<", _S.invoke(_S.read(_v0, "Math"), "abs", [_S.read(_v0, "y")]), _S.binary("+", _S.read(_v0, "h"), 1.5))):
			_S.set_prop(_S.read(_v0, "o"), "c", _S.prop(_S.read(_v0, "C"), 1), "=", false)
		return null
	_S.define(_e, "v", _S.binary("/", _S.read(_e, "y"), _S.invoke(_S.read(_e, "Math"), "max", [0.5, _S.read(_e, "h")])))
	if _S.truth(_S.binary(">", _S.read(_e, "x"), _S.unary("-", 1.5))):
		return _S.set_prop(_S.read(_e, "o"), "c", _S.read(_e, "WHITE"), "=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "v"), _S.unary("-", 0.3)), func(): return _S.binary("<", _S.read(_e, "v"), 0.35)), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "pulse"))]), 2.5))):
		return _S.set_prop(_S.read(_e, "o"), "c", _S.read(_e, "WHITE"), "=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "v"), _S.unary("-", 0.3)), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "glint"))]), 1))):
		return _S.set_prop(_S.read(_e, "o"), "c", _S.read(_e, "WHITE"), "=", false)
	_S.set_prop(_S.read(_e, "o"), "c", (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "v"), _S.unary("-", 0.72))) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "v"), _S.unary("-", 0.36))) else (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary("<", _S.read(_e, "v"), _S.unary("-", 0.18))) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.38)) else (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.78)) else _S.prop(_S.read(_e, "C"), 1)))))), "=", false)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "L", _S.prop(_S.read(_e, "o"), "length"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.invoke(_S.read(_e, "p"), "each", [_S.binary("-", _S.unary("-", _S.read(_e, "L")), 100), _S.unary("-", 12), _S.binary("+", _S.unary("-", _S.read(_e, "L")), 4), 12, _S.function_value(_e, "_f4")])
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.binary("-", _S.unary("-", _S.read(_e, "L")), 60), 0, 0, 0, 14, _S.prop(_S.read(_e, "C"), 4), 0.22])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 14, _S.read(_e, "S"), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 9, _S.binary("+", _S.read(_e, "S"), 1), _S.function_value(_e, "_f8"), _S.function_value(_e, "_f9")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 12, _S.binary("+", _S.read(_e, "S"), 2), _S.function_value(_e, "_f10"), _S.function_value(_e, "_f11")])
	var _v7 = _S.scope(_e)
	_S.define(_v7, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "i"), 3)):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "q", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_v8, "ph"), 3), _S.binary("/", _S.read(_v8, "i"), 3)), 1))
		_S.define(_v8, "x", _S.binary("-", _S.unary("-", 4), _S.binary("*", _S.read(_v8, "q"), _S.binary("+", _S.read(_v8, "L"), 20))))
		_S.define(_v8, "ry", _S.binary("+", 4.5, _S.binary("*", _S.read(_v8, "q"), 8)))
		_S.define(_v8, "rx", _S.binary("+", 1.2, _S.binary("*", _S.read(_v8, "q"), 2.6)))
		if _S.truth(_S.binary(">", _S.read(_v8, "q"), 0.8)):
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
			continue
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "k"), 40)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "an", _S.binary("*", _S.binary("/", _S.read(_v10, "k"), 40), _S.read(_v10, "TAU")))
			_S.define(_v10, "px", _S.binary("+", _S.read(_v10, "x"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "an")]), _S.read(_v10, "rx"))))
			_S.define(_v10, "py", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "an")]), _S.read(_v10, "ry")))
			if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v10, "Math"), "abs", [_S.read(_v10, "py")]), 4.6), func(): return _S.binary(">", _S.read(_v10, "px"), _S.binary("-", _S.unary("-", _S.read(_v10, "L")), 2)))):
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "k", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v10, "p"), "px", [_S.read(_v10, "px"), _S.read(_v10, "py"), ((_S.read(_v10, "WHITE") if _S.truth(_S.binary("<", _S.read(_v10, "q"), 0.35)) else _S.prop(_S.read(_v10, "C"), 6)) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "an")]), 0)) else (_S.prop(_S.read(_v10, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v10, "q"), 0.4)) else _S.prop(_S.read(_v10, "C"), 4)))])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "k", 1, "+=", true)
		_S.invoke(_S.read(_v8, "p"), "glowRing", [_S.read(_v8, "x"), 0, _S.binary("*", _S.read(_v8, "ry"), 0.75), 3, _S.prop(_S.read(_v8, "C"), 5), _S.binary("*", 0.14, _S.binary("-", 1, _S.read(_v8, "q")))])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "i", 1, "+=", true)
	for _v11 in _S.array([[_S.unary("-", 1), 10, 4], [1, 9, 4], [_S.unary("-", 0.2), 6, 3]]):
		var _v12 = _S.scope(_e)
		var _v13 = _v11
		_S.define(_v12, "dy", _S.prop(_v13, 0))
		_S.define(_v12, "l", _S.prop(_v13, 1))
		_S.define(_v12, "w", _S.prop(_v13, 2))
		_S.call_value(_S.read(_v12, "blade"), [_S.read(_v12, "p"), _S.binary("+", _S.unary("-", _S.read(_v12, "L")), 3), _S.binary("*", _S.read(_v12, "dy"), 1.5), _S.binary("-", _S.binary("+", _S.unary("-", _S.read(_v12, "L")), 3), _S.read(_v12, "l")), _S.binary("*", _S.read(_v12, "dy"), _S.binary("+", 2, _S.binary("*", _S.read(_v12, "l"), 0.5))), _S.read(_v12, "w"), _S.read(_v12, "C")])
	_S.define(_e, "pulse", _S.binary("+", _S.unary("-", _S.read(_e, "L")), _S.binary("*", _S.binary("%", _S.binary("*", _S.read(_e, "ph"), 2), 1), _S.binary("+", _S.read(_e, "L"), 6))))
	_S.define(_e, "glint", _S.binary("*", _S.binary("*", _S.unary("-", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_e, "ph"), 2), 0.5), 1)), _S.read(_e, "L")), 1.2))
	_S.call_value(_S.read(_e, "spear"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "L"), _S.read(_e, "pulse"), _S.read(_e, "glint")])
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.unary("-", _S.read(_e, "L")), 0, 0, 0, 10, _S.prop(_S.read(_e, "C"), 4), 0.1])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "pulse"), 0, 8, _S.prop(_S.read(_e, "C"), 6), 0.3])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, 8, _S.read(_e, "WHITE"), 0.4])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("*", _S.unary("-", _S.read(_e, "L")), 0.4), 0, 30, _S.prop(_S.read(_e, "C"), 3), 0.16])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.arg(_args, 2))
	_S.define(_e, "sy", _S.arg(_args, 3))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.binary("+", _S.unary("-", _S.read(_e, "L")), 4), _S.read(_e, "x")), 104))
	_S.define(_e, "w", _S.binary("+", _S.binary("+", _S.binary("*", 4.5, _S.binary("**", _S.binary("-", 1, _S.read(_e, "u")), 0.7)), 0.5), _S.binary("*", _S.binary("*", 1.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_e, "u"), 9), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2))])), _S.read(_e, "u"))))
	_S.define(_e, "v", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "y")]), _S.read(_e, "w")))
	if _S.truth(_S.binary(">=", _S.read(_e, "v"), 1)):
		return null
	_S.define(_e, "a", _S.binary("*", _S.binary("-", 1, _S.binary("*", _S.read(_e, "v"), _S.read(_e, "v"))), _S.binary("**", _S.binary("-", 1, _S.read(_e, "u")), 1.4)))
	if _S.truth(_S.binary("<", _S.read(_e, "a"), 0.04)):
		return null
	_S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "v"), 0.25), func(): return _S.binary("<", _S.read(_e, "u"), 0.4))) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.6)) else _S.prop(_S.read(_e, "C"), 4))), _S.binary("*", _S.read(_e, "a"), 0.7)])
	if _S.truth(_S.binary(">", _S.read(_e, "a"), 0.3)):
		_S.invoke(_S.read(_e, "p"), "add", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.12, _S.read(_e, "a"))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.35, 0.55])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "x0", _S.invoke(_S.read(_e, "r"), "range", [_S.binary("+", _S.unary("-", _S.read(_e, "L")), 2), _S.unary("-", 8)]))
	var _v1 = _S.call_value(_S.read(_e, "fly"), [_S.read(_e, "x0"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 2.5), 2.5]), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [150, 230])), _S.binary("*", _S.invoke(_S.read(_e, "r"), "sign", []), _S.invoke(_S.read(_e, "r"), "range", [8, 30])), _S.read(_e, "age"), 0, 2.2])
	_S.define(_e, "x", _S.prop(_v1, 0))
	_S.define(_e, "y", _S.prop(_v1, 1))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "rad", _S.binary("+", 1.2, _S.binary("*", 5.5, _S.read(_e, "k"))))
	_S.define(_e, "a", _S.binary("*", 0.5, _S.binary("**", _S.binary("-", 1, _S.read(_e, "k")), 1.3)))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "rad"), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.3)) else _S.prop(_S.read(_e, "C"), 5)), _S.function_value(_e, "_f7")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.read(_e, "rad"), 1.6), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.1, _S.binary("-", 1, _S.read(_e, "k")))])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "a"), _S.binary("-", 1, _S.binary("*", _S.read(_e, "d"), _S.read(_e, "d"))))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.4, 0.6])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	var _v2 = _S.call_value(_S.read(_e, "fly"), [_S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", _S.read(_e, "L")), _S.unary("-", 6)]), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 3), 3]), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [170, 260])), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 35), 35]), _S.read(_e, "age"), 60, 1.2])
	_S.define(_e, "x", _S.prop(_v2, 0))
	_S.define(_e, "y", _S.prop(_v2, 1))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "a", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]), _S.binary("*", _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [10, 18])), _S.invoke(_S.read(_e, "r"), "sign", []))))
	_S.define(_e, "l", _S.invoke(_S.read(_e, "r"), "range", [1.2, 2.2]))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0.85), func(): return _S.binary("<", _S.binary("%", _S.binary("*", _S.read(_e, "age"), 30), 2), 1))):
		return null
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "l"))), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "l"))), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "l"))), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "l"))), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "l"))), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "l"))), _S.read(_e, "WHITE")])
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "a"), 2)]), 0.9)):
		var _v3 = _S.scope(_e)
		for _v4 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
			var _v5 = _S.scope(_v3)
			var _v6 = _v4
			_S.define(_v5, "dx", _S.prop(_v6, 0))
			_S.define(_v5, "dy", _S.prop(_v6, 1))
			_S.invoke(_S.read(_v5, "p"), "px", [_S.binary("+", _S.read(_v5, "x"), _S.read(_v5, "dx")), _S.binary("+", _S.read(_v5, "y"), _S.read(_v5, "dy")), _S.prop(_S.read(_v5, "C"), 6)])
		_S.invoke(_S.read(_v3, "p"), "glow", [_S.read(_v3, "x"), _S.read(_v3, "y"), 6, _S.prop(_S.read(_v3, "C"), 5), 0.45])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.16, 0.26])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "y", _S.binary("*", _S.invoke(_S.read(_e, "r"), "sign", []), _S.invoke(_S.read(_e, "r"), "range", [4, 13])))
	_S.define(_e, "x", _S.binary("-", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 20), 0]), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [280, 380]))))
	_S.define(_e, "l", _S.invoke(_S.read(_e, "r"), "range", [6, 16]))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "l")), _S.read(_e, "y"), _S.function_value(_e, "_f12"), _S.function_value(_e, "_f13")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.7)) else _S.prop(_S.read(_e, "C"), 4))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.read(_e, "u"), _S.binary("-", 1, _S.read(_e, "k"))), 1.4)
