@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/countdown.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "spell", _S.import_value("fx/ui/_lib.js", "spell"))
	_S.define(_e, "drawWord", _S.import_value("fx/ui/_lib.js", "drawWord"))
	_S.define(_e, "shake", _S.import_value("fx/ui/_lib.js", "shake"))
	_S.define(_e, "timer", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Countdown"}, {"desc": "3, 2, 1 slam into a timer ring that drains like a burning fuse, throwing sparks; then GO! bursts out as the ring blows into a shockwave with rays."}, {"tags": ["ui", "countdown", "start", "timer", "text", "one-shot"]}, {"size": [152, 136]}, {"origin": [76, 68]}, {"duration": 3.1}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#0a1030", "#142a66", "#1f4fae", "#2f86e6", "#5cc4ff", "#a8e8ff", "#e6fbff", "#ffffff"]}, {"go": ["#0b2410", "#16501c", "#22882a", "#3cc23a", "#7ee84c", "#c4ff8a", "#f0ffd6", "#ffffff"]}, {"from": 3}, {"word": "GO!"}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "STEP", 0.62)
	_S.define(_e, "R", 30)
	_S.define(_e, "TOP", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "f", _S.arg(_args, 4))
	_S.define(_e, "flash", _S.arg(_args, 5))
	_S.define(_e, "t", _S.arg(_args, 6))
	_S.invoke(_S.read(_e, "p"), "ring", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "R"), 4), 8, _S.function_value(_e, "_f1")])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "j"), 40)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v1, "j"), 40), _S.read(_v1, "TAU")), _S.binary("*", _S.read(_v1, "t"), 0.6)))
		_S.invoke(_S.read(_v1, "p"), "dot", [_S.binary("+", _S.read(_v1, "x"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "an")]), _S.binary("-", _S.read(_v1, "R"), 6))), _S.binary("+", _S.read(_v1, "y"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "an")]), _S.binary("-", _S.read(_v1, "R"), 6))), (_S.prop(_S.read(_v1, "C"), 2) if _S.truth(_S.binary("%", _S.read(_v1, "j"), 5)) else _S.prop(_S.read(_v1, "C"), 4)), 1])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "j", 1, "+=", true)
	_S.define(_e, "head", _S.binary("+", _S.read(_e, "TOP"), _S.binary("*", _S.read(_e, "TAU"), _S.binary("-", 1, _S.read(_e, "f")))))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 12)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "an", _S.binary("+", _S.read(_v3, "TOP"), _S.binary("/", _S.binary("*", _S.read(_v3, "i"), _S.read(_v3, "TAU")), 12)))
		_S.define(_v3, "lit", _S.logical("||", _S.binary(">=", _S.read(_v3, "an"), _S.binary("-", _S.read(_v3, "head"), 0.000001)), func(): return _S.binary(">=", _S.read(_v3, "f"), 0.999)))
		_S.define(_v3, "near", _S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.binary("-", _S.read(_v3, "an"), _S.read(_v3, "head"))]), 0.2), func(): return _S.binary("<", _S.read(_v3, "f"), 0.999)))
		_S.define(_v3, "ca", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "an")]))
		_S.define(_v3, "sa", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "an")]))
		_S.invoke(_S.read(_v3, "p"), "line", [_S.binary("+", _S.read(_v3, "x"), _S.binary("*", _S.read(_v3, "ca"), _S.binary("+", _S.read(_v3, "R"), 6))), _S.binary("+", _S.read(_v3, "y"), _S.binary("*", _S.read(_v3, "sa"), _S.binary("+", _S.read(_v3, "R"), 6))), _S.binary("+", _S.read(_v3, "x"), _S.binary("*", _S.read(_v3, "ca"), _S.binary("+", _S.read(_v3, "R"), 8))), _S.binary("+", _S.read(_v3, "y"), _S.binary("*", _S.read(_v3, "sa"), _S.binary("+", _S.read(_v3, "R"), 8))), (_S.read(_v3, "WHITE") if _S.truth(_S.logical("||", _S.read(_v3, "flash"), func(): return _S.read(_v3, "near"))) else (_S.prop(_S.read(_v3, "C"), 5) if _S.truth(_S.read(_v3, "lit")) else _S.prop(_S.read(_v3, "C"), 2)))])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	if _S.truth(_S.binary("<=", _S.read(_e, "f"), 0.002)):
		return _S.read(_e, "head")
	_S.invoke(_S.read(_e, "p"), "arc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "R"), 2), 5, _S.read(_e, "head"), _S.binary("+", _S.read(_e, "TOP"), _S.read(_e, "TAU")), _S.function_value(_e, "_f2")])
	var _v4 = _S.scope(_e)
	_S.define(_v4, "an", _S.binary("+", _S.read(_v4, "head"), 0.25))
	while _S.truth(_S.binary("<", _S.read(_v4, "an"), _S.binary("+", _S.read(_v4, "TOP"), _S.read(_v4, "TAU")))):
		_S.invoke(_S.read(_v4, "p"), "glow", [_S.binary("+", _S.read(_v4, "x"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "an")]), _S.binary("-", _S.read(_v4, "R"), 0.5))), _S.binary("+", _S.read(_v4, "y"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "an")]), _S.binary("-", _S.read(_v4, "R"), 0.5))), 9, _S.prop(_S.read(_v4, "C"), 4), 0.12])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "an", 0.55, "+=", false)
	_S.define(_e, "hx", _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "head")]), _S.binary("-", _S.read(_e, "R"), 0.5))))
	_S.define(_e, "hy", _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "head")]), _S.binary("-", _S.read(_e, "R"), 0.5))))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "hx"), _S.read(_e, "hy"), 14, _S.prop(_S.read(_e, "C"), 5), 0.5])
	if _S.truth(_S.unary("!", _S.read(_e, "flash"))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "hx"), _S.read(_e, "hy"), _S.binary("+", 2, _S.binary("*", 1.5, _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 40)]))))), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), 0.4])
	return _S.read(_e, "head")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 0) if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "v"), 0.13), func(): return _S.binary(">", _S.read(_e, "v"), 0.87))) else _S.prop(_S.read(_e, "C"), 1))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	_S.define(_e, "d", _S.binary("*", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "TAU")), _S.read(_e, "f")))
	if _S.truth(_S.logical("||", _S.read(_e, "flash"), func(): return _S.binary("<", _S.read(_e, "d"), 0.1))):
		return _S.read(_e, "WHITE")
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.32)):
		return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.5)) else _S.prop(_S.read(_e, "C"), 6))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.75)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.4)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.15)) else _S.prop(_S.read(_e, "C"), 3))))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "go"), 8]))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "n", _S.call_value(_S.read(_e, "clamp"), [_S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "o"), "from")]), 1, 3]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "gs", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"sparks": [_S.prop(_S.read(_e, "G"), 7), _S.prop(_S.read(_e, "G"), 6), _S.prop(_S.read(_e, "G"), 5), _S.prop(_S.read(_e, "G"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "GO", _S.binary("*", _S.read(_e, "n"), _S.read(_e, "STEP")))
	_S.define(_e, "OUT", _S.binary("+", _S.read(_e, "GO"), 0.78))
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	_S.define(_e, "digits", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "n")}]), _S.function_value(_e, "_f4")]))
	_S.define(_e, "word", _S.call_value(_S.read(_e, "spell"), [_S.prop(_S.read(_e, "o"), "word")]))
	_S.define(_e, "rays", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 18}]), _S.function_value(_e, "_f5")]))
	_S.define(_e, "sizeAt", _S.function_value(_e, "_f6"))
	_S.define(_e, "reach", _S.function_value(_e, "_f7"))
	_S.define(_e, "t", 0)
	_S.define(_e, "beat", _S.unary("-", 1))
	_S.define(_e, "went", false)
	_S.define(_e, "popped", false)
	return _S.merge([{"update": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f9")}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "spell"), [_S.call_value(_S.read(_e, "String"), [_S.binary("-", _S.read(_e, "n"), _S.read(_e, "i"))])])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 18), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "Rg"), "range", [_S.unary("-", 0.06), 0.06]))}, {"L": (_S.invoke(_S.read(_e, "Rg"), "range", [10, 16]) if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.invoke(_S.read(_e, "Rg"), "range", [22, 30]))}])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "base", _S.arg(_args, 1))
	_S.define(_e, "big", _S.arg(_args, 2))
	return _S.binary("+", _S.read(_e, "base"), _S.binary("*", _S.binary("*", _S.read(_e, "big"), _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "u")), 26)])), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "u"), 38)])))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "d", _S.arg(_args, 1))
	return (9 if _S.truth(_S.binary("<=", _S.read(_e, "v"), _S.binary("*", _S.read(_e, "d"), 2.2))) else _S.binary("/", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "log", [_S.binary("-", 1, _S.binary("/", _S.binary("*", _S.read(_e, "d"), 2.2), _S.read(_e, "v")))])), 2.2))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "STEP"))]))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "GO")), func(): return _S.binary("!==", _S.read(_e, "i"), _S.read(_e, "beat")))):
		var _v5 = _S.scope(_e)
		_S.write(_v5, "beat", _S.read(_v5, "i"), "=", false)
		_S.invoke(_S.read(_v5, "lights"), "add", [0, 0, 54, _S.prop(_S.read(_v5, "C"), 5), 0.6, 0.35])
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "j"), 14)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v7, "j"), 14), _S.read(_v7, "TAU")), _S.invoke(_S.read(_v7, "Rg"), "range", [_S.unary("-", 0.1), 0.1])))
			_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "Rg"), "range", [90, 200]))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "an")]), _S.binary("+", _S.read(_v7, "R"), 2)), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "an")]), _S.binary("+", _S.read(_v7, "R"), 2)), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "an")]), _S.read(_v7, "sp")), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "an")]), _S.read(_v7, "sp")), _S.invoke(_S.read(_v7, "Math"), "min", [_S.invoke(_S.read(_v7, "Rg"), "range", [0.12, 0.3]), _S.call_value(_S.read(_v7, "reach"), [_S.read(_v7, "sp"), 26])])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "j", 1, "+=", true)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "GO"))):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "k", _S.binary("/", _S.binary("%", _S.read(_v8, "t"), _S.read(_v8, "STEP")), _S.read(_v8, "STEP")))
		_S.define(_v8, "f", _S.binary("-", 1, _S.call_value(_S.read(_v8, "seg"), [_S.read(_v8, "k"), 0.06, 0.97])))
		_S.define(_v8, "head", _S.binary("+", _S.read(_v8, "TOP"), _S.binary("*", _S.read(_v8, "TAU"), _S.binary("-", 1, _S.read(_v8, "f")))))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v8, "f"), 0.01), func(): return _S.binary("<", _S.read(_v8, "f"), 0.99)), func(): return _S.invoke(_S.read(_v8, "Rg"), "chance", [0.7]))):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "hx", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "head")]), _S.read(_v9, "R")))
			_S.define(_v9, "hy", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "head")]), _S.read(_v9, "R")))
			_S.define(_v9, "tx", _S.unary("-", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "head")])))
			_S.define(_v9, "ty", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "head")]))
			_S.define(_v9, "out", _S.invoke(_S.read(_v9, "Rg"), "range", [_S.unary("-", 0.4), 1]))
			_S.define(_v9, "sp", _S.invoke(_S.read(_v9, "Rg"), "range", [60, 150]))
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "SPARK"), _S.read(_v9, "hx"), _S.read(_v9, "hy"), _S.binary("*", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v9, "tx")), 0.8), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "head")]), _S.read(_v9, "out"))), _S.read(_v9, "sp")), _S.binary("-", _S.binary("*", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v9, "ty")), 0.8), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "head")]), _S.read(_v9, "out"))), _S.read(_v9, "sp")), 20), _S.invoke(_S.read(_v9, "Rg"), "range", [0.12, 0.28])])
			if _S.truth(_S.invoke(_S.read(_v9, "Rg"), "chance", [0.15])):
				_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "EMBER"), _S.read(_v9, "hx"), _S.read(_v9, "hy"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "head")]), _S.invoke(_S.read(_v9, "Rg"), "range", [5, 20])), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "head")]), _S.invoke(_S.read(_v9, "Rg"), "range", [5, 20])), _S.invoke(_S.read(_v9, "Rg"), "range", [0.4, 0.8]), _S.prop(_S.read(_v9, "C"), 5), 1])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "went")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "GO")))):
		var _v10 = _S.scope(_e)
		_S.write(_v10, "went", true, "=", false)
		_S.invoke(_S.read(_v10, "lights"), "add", [0, 0, 70, _S.read(_v10, "WHITE"), 0.9, 0.18])
		_S.invoke(_S.read(_v10, "lights"), "add", [0, 0, 64, _S.prop(_S.read(_v10, "G"), 5), 0.7, 0.8])
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v11, "j"), 36)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "an", _S.invoke(_S.read(_v12, "Rg"), "range", [0, _S.read(_v12, "TAU")]))
			_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "Rg"), "range", [120, 300]))
			_S.invoke(_S.read(_v12, "gs"), "spawn", [_S.prop(_S.read(_v12, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "an")]), _S.read(_v12, "R")), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "an")]), _S.read(_v12, "R")), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "an")]), _S.read(_v12, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "an")]), _S.read(_v12, "sp")), 40), _S.invoke(_S.read(_v12, "Math"), "min", [_S.invoke(_S.read(_v12, "Rg"), "range", [0.18, 0.36]), _S.call_value(_S.read(_v12, "reach"), [_S.read(_v12, "sp"), 24])])])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "j", 1, "+=", true)
		var _v13 = _S.scope(_v10)
		_S.define(_v13, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "j"), 18)):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "an", _S.invoke(_S.read(_v14, "Rg"), "range", [0, _S.read(_v14, "TAU")]))
			_S.define(_v14, "sp", _S.invoke(_S.read(_v14, "Rg"), "range", [30, 80]))
			_S.define(_v14, "r", _S.invoke(_S.read(_v14, "Rg"), "range", [10, 28]))
			_S.invoke(_S.read(_v14, "gs"), "spawn", [_S.prop(_S.read(_v14, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "an")]), _S.read(_v14, "r")), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "an")]), _S.read(_v14, "r")), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "an")]), _S.read(_v14, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "an")]), _S.read(_v14, "sp")), 10), _S.invoke(_S.read(_v14, "Rg"), "range", [0.5, 1]), _S.invoke(_S.read(_v14, "Rg"), "pick", [[_S.prop(_S.read(_v14, "G"), 7), _S.prop(_S.read(_v14, "G"), 6), _S.prop(_S.read(_v14, "G"), 5)]]), (_S.invoke(_S.read(_v14, "Rg"), "range", [1.5, 2.5]) if _S.truth(_S.invoke(_S.read(_v14, "Rg"), "chance", [0.4])) else 0.6)])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "j", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "GO"), 0.2)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "OUT"), 0.1))), func(): return _S.invoke(_S.read(_e, "Rg"), "chance", [0.12]))):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "an", _S.invoke(_S.read(_v15, "Rg"), "range", [0, _S.read(_v15, "TAU")]))
		_S.define(_v15, "r", _S.invoke(_S.read(_v15, "Rg"), "range", [30, 46]))
		_S.invoke(_S.read(_v15, "gs"), "spawn", [_S.prop(_S.read(_v15, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "an")]), _S.read(_v15, "r")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "an")]), _S.read(_v15, "r")), 0.8), 0, _S.unary("-", _S.invoke(_S.read(_v15, "Rg"), "range", [4, 12])), _S.invoke(_S.read(_v15, "Rg"), "range", [0.3, 0.6]), _S.invoke(_S.read(_v15, "Rg"), "pick", [[_S.prop(_S.read(_v15, "G"), 7), _S.prop(_S.read(_v15, "G"), 6)]]), (1.6 if _S.truth(_S.invoke(_S.read(_v15, "Rg"), "chance", [0.3])) else 0.6)])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT"), 0.05)))):
		var _v16 = _S.scope(_e)
		_S.write(_v16, "popped", true, "=", false)
		_S.invoke(_S.read(_v16, "lights"), "add", [0, 0, 40, _S.prop(_S.read(_v16, "G"), 6), 0.6, 0.25])
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "j"), 14)):
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v18, "j"), 14), _S.read(_v18, "TAU")), _S.invoke(_S.read(_v18, "Rg"), "range", [_S.unary("-", 0.15), 0.15])))
			_S.define(_v18, "sp", _S.invoke(_S.read(_v18, "Rg"), "range", [60, 130]))
			_S.invoke(_S.read(_v18, "gs"), "spawn", [_S.prop(_S.read(_v18, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.read(_v18, "an")]), 12), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.read(_v18, "an")]), 8), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.read(_v18, "an")]), _S.read(_v18, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.read(_v18, "an")]), _S.read(_v18, "sp")), 0.8), 10), _S.invoke(_S.read(_v18, "Math"), "min", [_S.invoke(_S.read(_v18, "Rg"), "range", [0.3, 0.45]), _S.binary("-", _S.read(_v18, "end"), _S.read(_v18, "t"))]), _S.invoke(_S.read(_v18, "Rg"), "pick", [[_S.prop(_S.read(_v18, "G"), 7), _S.prop(_S.read(_v18, "G"), 6), _S.prop(_S.read(_v18, "G"), 5)]]), (0.6 if _S.truth(_S.binary("%", _S.read(_v18, "j"), 3)) else _S.invoke(_S.read(_v18, "Rg"), "range", [1.3, 2]))])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "j", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "gs"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "GO"))):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "i", _S.invoke(_S.read(_v19, "Math"), "floor", [_S.binary("/", _S.read(_v19, "t"), _S.read(_v19, "STEP"))]))
		_S.define(_v19, "u", _S.binary("-", _S.read(_v19, "t"), _S.binary("*", _S.read(_v19, "i"), _S.read(_v19, "STEP"))))
		_S.define(_v19, "k", _S.binary("/", _S.read(_v19, "u"), _S.read(_v19, "STEP")))
		var _v20 = _S.call_value(_S.read(_v19, "shake"), [_S.read(_v19, "t"), 3, _S.binary("*", _S.read(_v19, "i"), _S.read(_v19, "STEP")), 0.22, _S.binary("+", _S.prop(_S.read(_v19, "o"), "seed"), _S.read(_v19, "i"))])
		_S.define(_v19, "sx", _S.prop(_v20, 0))
		_S.define(_v19, "sy", _S.prop(_v20, 1))
		_S.define(_v19, "f", _S.binary("-", 1, _S.call_value(_S.read(_v19, "seg"), [_S.read(_v19, "k"), 0.06, 0.97])))
		_S.define(_v19, "flash", _S.binary("<", _S.read(_v19, "u"), 0.07))
		_S.define(_v19, "rk", _S.binary("/", _S.read(_v19, "u"), 0.3))
		if _S.truth(_S.binary("<", _S.read(_v19, "rk"), 1)):
			_S.invoke(_S.read(_v19, "p"), "ring", [_S.read(_v19, "sx"), _S.read(_v19, "sy"), _S.binary("+", _S.binary("+", _S.read(_v19, "R"), 6), _S.binary("*", 22, _S.invoke(_S.read(_v19, "ease"), "outCubic", [_S.read(_v19, "rk")]))), _S.binary("+", _S.binary("*", 1.5, _S.binary("-", 1, _S.read(_v19, "rk"))), 1), (_S.read(_v19, "WHITE") if _S.truth(_S.binary("<", _S.read(_v19, "rk"), 0.3)) else _S.prop(_S.read(_v19, "C"), 5)), _S.binary("*", 1.3, _S.binary("-", 1, _S.read(_v19, "rk")))])
		_S.call_value(_S.read(_v19, "timer"), [_S.read(_v19, "p"), _S.read(_v19, "C"), _S.read(_v19, "sx"), _S.read(_v19, "sy"), _S.read(_v19, "f"), _S.read(_v19, "flash"), _S.read(_v19, "t")])
		if _S.truth(_S.binary("<", _S.read(_v19, "u"), 0.035)):
			_S.invoke(_S.read(_v19, "p"), "circle", [_S.read(_v19, "sx"), _S.read(_v19, "sy"), _S.binary("-", _S.read(_v19, "R"), 3), _S.read(_v19, "WHITE")])
		else:
			if _S.truth(_S.binary("<", _S.read(_v19, "u"), 0.07)):
				_S.invoke(_S.read(_v19, "p"), "ring", [_S.read(_v19, "sx"), _S.read(_v19, "sy"), _S.binary("-", _S.read(_v19, "R"), 3), 3, _S.prop(_S.read(_v19, "C"), 6)])
		_S.define(_v19, "s", _S.call_value(_S.read(_v19, "sizeAt"), [_S.read(_v19, "u"), 5, 2]))
		_S.define(_v19, "d", _S.prop(_S.read(_v19, "digits"), _S.read(_v19, "i")))
		_S.define(_v19, "W", _S.binary("*", _S.prop(_S.read(_v19, "d"), "w"), _S.read(_v19, "s")))
		_S.define(_v19, "H", _S.binary("*", 7, _S.read(_v19, "s")))
		_S.define(_v19, "x0", _S.binary("-", _S.read(_v19, "sx"), _S.binary("/", _S.read(_v19, "W"), 2)))
		_S.define(_v19, "y0", _S.binary("-", _S.read(_v19, "sy"), _S.binary("/", _S.read(_v19, "H"), 2)))
		_S.define(_v19, "items", _S.invoke(_S.invoke(_S.prop(_S.read(_v19, "d"), "letters"), "filter", [_S.function_value(_v19, "_f10")]), "map", [_S.function_value(_v19, "_f11")]))
		_S.call_value(_S.read(_v19, "drawWord"), [_S.read(_v19, "p"), _S.read(_v19, "items"), _S.merge([{"fill": [_S.prop(_S.read(_v19, "C"), 4), _S.prop(_S.read(_v19, "C"), 5), _S.prop(_S.read(_v19, "C"), 6), _S.prop(_S.read(_v19, "C"), 7)]}, {"edge": _S.read(_v19, "WHITE")}, {"under": _S.prop(_S.read(_v19, "C"), 3)}, {"outline": _S.prop(_S.read(_v19, "C"), 0)}, {"ow": 2}, {"shadow": _S.call_value(_S.read(_v19, "scale"), [_S.prop(_S.read(_v19, "C"), 0), 0.5])}])])
		_S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "sx"), _S.read(_v19, "sy"), 30, _S.prop(_S.read(_v19, "C"), 4), _S.binary("+", 0.22, (_S.binary("*", 0.6, _S.binary("-", 1, _S.binary("/", _S.read(_v19, "u"), 0.12))) if _S.truth(_S.binary("<", _S.read(_v19, "u"), 0.12)) else 0))])
		_S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "sx"), _S.read(_v19, "sy"), _S.binary("+", _S.read(_v19, "R"), 8), _S.prop(_S.read(_v19, "C"), 3), _S.binary("+", _S.binary("*", 0.2, _S.binary("-", 1, _S.read(_v19, "k"))), 0.08)])
	else:
		var _v21 = _S.scope(_e)
		_S.define(_v21, "u", _S.binary("-", _S.read(_v21, "t"), _S.read(_v21, "GO")))
		var _v22 = _S.call_value(_S.read(_v21, "shake"), [_S.read(_v21, "t"), 4, _S.read(_v21, "GO"), 0.3, _S.binary("+", _S.prop(_S.read(_v21, "o"), "seed"), 9)])
		_S.define(_v21, "sx", _S.prop(_v22, 0))
		_S.define(_v21, "sy", _S.prop(_v22, 1))
		_S.define(_v21, "bk", _S.binary("/", _S.read(_v21, "u"), 0.4))
		if _S.truth(_S.binary("<", _S.read(_v21, "bk"), 1)):
			var _v23 = _S.scope(_v21)
			_S.define(_v23, "r", _S.binary("+", _S.binary("+", _S.read(_v23, "R"), 4), _S.binary("*", 30, _S.invoke(_S.read(_v23, "ease"), "outCubic", [_S.read(_v23, "bk")]))))
			_S.define(_v23, "w", _S.invoke(_S.read(_v23, "Math"), "max", [1, _S.binary("*", 7, _S.binary("-", 1, _S.read(_v23, "bk")))]))
			_S.invoke(_S.read(_v23, "p"), "ring", [0, 0, _S.read(_v23, "r"), _S.read(_v23, "w"), _S.function_value(_v23, "_f12"), _S.binary("*", 1.4, _S.binary("-", 1, _S.read(_v23, "bk")))])
			_S.invoke(_S.read(_v23, "p"), "glowRing", [0, 0, _S.binary("-", _S.read(_v23, "r"), _S.binary("/", _S.read(_v23, "w"), 2)), 8, _S.prop(_S.read(_v23, "G"), 5), _S.binary("*", 0.5, _S.binary("-", 1, _S.read(_v23, "bk")))])
		_S.define(_v21, "ik", _S.binary("/", _S.binary("-", _S.read(_v21, "u"), 0.05), 0.3))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v21, "ik"), 0), func(): return _S.binary("<", _S.read(_v21, "ik"), 1))):
			_S.invoke(_S.read(_v21, "p"), "ring", [0, 0, _S.binary("+", _S.read(_v21, "R"), _S.binary("*", 22, _S.invoke(_S.read(_v21, "ease"), "outCubic", [_S.read(_v21, "ik")]))), 1, _S.prop(_S.read(_v21, "G"), 5), _S.binary("*", 1.2, _S.binary("-", 1, _S.read(_v21, "ik")))])
		_S.define(_v21, "rk", _S.binary("*", _S.invoke(_S.read(_v21, "ease"), "outExpo", [_S.call_value(_S.read(_v21, "clamp"), [_S.binary("/", _S.read(_v21, "u"), 0.18)])]), _S.binary("-", 1, _S.invoke(_S.read(_v21, "ease"), "inQuad", [_S.call_value(_S.read(_v21, "seg"), [_S.read(_v21, "t"), _S.binary("-", _S.read(_v21, "OUT"), 0.25), _S.binary("+", _S.read(_v21, "OUT"), 0.05)])]))))
		for _v24 in _S.array(_S.read(_v21, "rays")):
			var _v25 = _S.scope(_v21)
			_S.define(_v25, "ry", _v24)
			var _v26 = _S.scope(_v25)
			if _S.truth(_S.binary("<=", _S.read(_v26, "rk"), 0.02)):
				break
			_S.define(_v26, "an", _S.binary("+", _S.prop(_S.read(_v26, "ry"), "a"), _S.binary("*", _S.read(_v26, "u"), 0.35)))
			_S.define(_v26, "ca", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "an")]))
			_S.define(_v26, "sa", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "an")]))
			_S.define(_v26, "r0", _S.binary("+", _S.binary("/", 1, _S.invoke(_S.read(_v26, "Math"), "sqrt", [_S.binary("+", _S.binary("**", _S.binary("/", _S.read(_v26, "ca"), 40), 2), _S.binary("**", _S.binary("/", _S.read(_v26, "sa"), 23), 2))])), _S.binary("*", 3, _S.read(_v26, "rk"))))
			_S.define(_v26, "r1", _S.binary("+", _S.read(_v26, "r0"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "ry"), "L"), 0.7), _S.read(_v26, "rk"))))
			_S.invoke(_S.read(_v26, "p"), "line", [_S.binary("*", _S.read(_v26, "ca"), _S.read(_v26, "r0")), _S.binary("*", _S.read(_v26, "sa"), _S.read(_v26, "r0")), _S.binary("*", _S.read(_v26, "ca"), _S.read(_v26, "r1")), _S.binary("*", _S.read(_v26, "sa"), _S.read(_v26, "r1")), _S.function_value(_v26, "_f13"), _S.function_value(_v26, "_f14")])
		_S.define(_v21, "pu", _S.binary("/", _S.binary("-", _S.read(_v21, "t"), _S.read(_v21, "OUT")), 0.06))
		if _S.truth(_S.binary("<", _S.read(_v21, "pu"), 1)):
			var _v27 = _S.scope(_v21)
			_S.define(_v27, "s", _S.call_value(_S.read(_v27, "sizeAt"), [_S.read(_v27, "u"), 5, 3.5]))
			_S.define(_v27, "flash", (1 if _S.truth(_S.binary("<", _S.read(_v27, "u"), 0.035)) else (0.4 if _S.truth(_S.binary("<", _S.read(_v27, "u"), 0.07)) else 0)))
			_S.define(_v27, "throb", _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "max", [0, _S.invoke(_S.read(_v27, "Math"), "sin", [_S.binary("*", _S.binary("-", _S.read(_v27, "u"), 0.25), 9)])]), _S.call_value(_S.read(_v27, "smooth"), [0.25, 0.35, _S.read(_v27, "u")])))
			if _S.truth(_S.binary(">", _S.read(_v27, "pu"), 0)):
				_S.last([_S.write(_v27, "s", _S.binary("*", 5, _S.binary("+", 1, _S.binary("*", 0.25, _S.read(_v27, "pu")))), "=", false), _S.write(_v27, "flash", 1, "=", false)])
			_S.define(_v27, "W", _S.binary("*", _S.prop(_S.read(_v27, "word"), "w"), _S.read(_v27, "s")))
			_S.define(_v27, "H", _S.binary("*", 7, _S.read(_v27, "s")))
			_S.define(_v27, "x0", _S.binary("-", _S.read(_v27, "sx"), _S.binary("/", _S.read(_v27, "W"), 2)))
			_S.define(_v27, "y0", _S.binary("-", _S.read(_v27, "sy"), _S.binary("/", _S.read(_v27, "H"), 2)))
			_S.define(_v27, "items", _S.invoke(_S.invoke(_S.prop(_S.read(_v27, "word"), "letters"), "filter", [_S.function_value(_v27, "_f15")]), "map", [_S.function_value(_v27, "_f16")]))
			_S.define(_v27, "sh", _S.call_value(_S.read(_v27, "seg"), [_S.read(_v27, "u"), 0.32, 0.56]))
			_S.define(_v27, "shine", (_S.binary("+", _S.binary("-", _S.read(_v27, "x0"), 8), _S.binary("*", _S.binary("+", _S.read(_v27, "W"), 22), _S.invoke(_S.read(_v27, "ease"), "inOutSine", [_S.read(_v27, "sh")]))) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v27, "sh"), 0), func(): return _S.binary("<", _S.read(_v27, "sh"), 1))) else null))
			_S.call_value(_S.read(_v27, "drawWord"), [_S.read(_v27, "p"), _S.read(_v27, "items"), _S.merge([{"fill": [_S.prop(_S.read(_v27, "G"), 4), _S.prop(_S.read(_v27, "G"), 5), _S.prop(_S.read(_v27, "G"), 6), _S.prop(_S.read(_v27, "G"), 7)]}, {"edge": _S.read(_v27, "WHITE")}, {"under": _S.prop(_S.read(_v27, "G"), 3)}, {"outline": _S.prop(_S.read(_v27, "G"), 0)}, {"ow": 2}, {"shadow": _S.call_value(_S.read(_v27, "scale"), [_S.prop(_S.read(_v27, "G"), 0), 0.5])}, {"shine": _S.read(_v27, "shine")}, {"shineY": _S.read(_v27, "y0")}, {"glint": _S.prop(_S.read(_v27, "G"), 6)}])])
			_S.invoke(_S.read(_v27, "p"), "glow", [_S.read(_v27, "sx"), _S.read(_v27, "sy"), 46, _S.prop(_S.read(_v27, "G"), 5), _S.binary("+", _S.binary("+", 0.25, _S.binary("*", 0.15, _S.read(_v27, "throb"))), (_S.binary("*", 0.7, _S.binary("-", 1, _S.binary("/", _S.read(_v27, "u"), 0.12))) if _S.truth(_S.binary("<", _S.read(_v27, "u"), 0.12)) else 0))])
		else:
			var _v28 = _S.scope(_v21)
			_S.define(_v28, "k", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v28, "t"), _S.read(_v28, "OUT")), 0.06), 0.22))
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v28, "k"), 0), func(): return _S.binary("<", _S.read(_v28, "k"), 1))):
				_S.invoke(_S.read(_v28, "p"), "ring", [0, 0, _S.binary("+", 8, _S.binary("*", 26, _S.invoke(_S.read(_v28, "ease"), "outCubic", [_S.read(_v28, "k")]))), 1, (_S.read(_v28, "WHITE") if _S.truth(_S.binary("<", _S.read(_v28, "k"), 0.4)) else _S.prop(_S.read(_v28, "G"), 6)), _S.binary("*", 1.3, _S.binary("-", 1, _S.read(_v28, "k")))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "gs"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "L"), "g")

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.merge([{"g": _S.prop(_S.read(_e, "L"), "g")}, {"x": _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.prop(_S.read(_e, "L"), "x"), _S.read(_e, "s")))}, {"y": _S.read(_e, "y0")}, {"sx": _S.read(_e, "s")}, {"sy": _S.read(_e, "s")}, {"flash": (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.035)) else (0.4 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.07)) else 0))}])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "bk"), 0.2), func(): return _S.binary(">", _S.read(_e, "v"), 0.6))) else _S.prop(_S.read(_e, "G"), 6))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.3)) else (_S.prop(_S.read(_e, "G"), 6) if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.65)) else _S.prop(_S.read(_e, "G"), 5)))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return (1.3 if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.6)) else _S.binary("/", _S.binary("*", 1.3, _S.binary("-", 1, _S.read(_e, "q"))), 0.4))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "L"), "g")

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.merge([{"g": _S.prop(_S.read(_e, "L"), "g")}, {"x": _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.prop(_S.read(_e, "L"), "x"), _S.read(_e, "s")))}, {"y": _S.read(_e, "y0")}, {"sx": _S.read(_e, "s")}, {"sy": _S.read(_e, "s")}, {"slant": 1}, {"flash": _S.read(_e, "flash")}])
