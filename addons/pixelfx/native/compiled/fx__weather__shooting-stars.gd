@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/shooting-stars.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "at", _S.import_value("core/index.js", "at"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "box", _S.import_value("fx/weather/_lib.js", "box"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "sky", _S.function_value(_e, "_f2"))
	_S.define(_e, "meteor", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Shooting stars"}, {"desc": "Meteors burn across a starry sky, white heads trailing gold and rose; the big ones flare and break up, and each leaves a glowing train that twists and fades."}, {"tags": ["weather", "meteor", "shooting star", "night", "sky", "stars", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 180]}, {"duration": 10}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#3a1e5a", "#7a3a8a", "#e0607a", "#ffa86a", "#ffe6a8", "#ffffff"]}, {"sky": ["#141428", "#2a2a4a", "#4c4c7c", "#8e8ec4", "#dcdcff"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 10)
	_S.define(_e, "METEORS", [_S.merge([{"t0": 0.5}, {"x": 60}, {"y": _S.unary("-", 170)}, {"a": 2.45}, {"v": 260}, {"life": 0.55}, {"s": 0.6}]), _S.merge([{"t0": 1.9}, {"x": _S.unary("-", 40)}, {"y": _S.unary("-", 176)}, {"a": 2.2}, {"v": 220}, {"life": 0.7}, {"s": 0.8}]), _S.merge([{"t0": 3.4}, {"x": 150}, {"y": _S.unary("-", 150)}, {"a": 2.62}, {"v": 300}, {"life": 0.45}, {"s": 0.5}]), _S.merge([{"t0": 4.6}, {"x": 130}, {"y": _S.unary("-", 178)}, {"a": 2.35}, {"v": 240}, {"life": 1.05}, {"s": 1.4}, {"flare": true}]), _S.merge([{"t0": 6.7}, {"x": _S.unary("-", 90)}, {"y": _S.unary("-", 168)}, {"a": 2.05}, {"v": 200}, {"life": 0.6}, {"s": 0.7}]), _S.merge([{"t0": 7.9}, {"x": 20}, {"y": _S.unary("-", 160)}, {"a": 2.5}, {"v": 280}, {"life": 0.5}, {"s": 0.6}]), _S.merge([{"t0": 9.2}, {"x": _S.unary("-", 10)}, {"y": _S.unary("-", 176)}, {"a": 2.28}, {"v": 230}, {"life": 0.8}, {"s": 1}, {"flare": true}])])
	_S.define(_e, "TRAIN", 1.6)
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "box"), [_S.read(_e, "meta")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "K", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "sky"), 5]))
	_S.call_value(_S.read(_e, "sky"), [_S.read(_e, "p"), _S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "K")])
	_S.invoke(_S.read(_e, "METEORS"), "forEach", [_S.function_value(_e, "_f1")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "m", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "meteor"), [_S.read(_e, "q"), _S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "m"), "t0")), _S.read(_e, "D")]), _S.read(_e, "m"), _S.read(_e, "i"), _S.read(_e, "S"), _S.read(_e, "C")])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "S", _S.arg(_args, 3))
	_S.define(_e, "K", _S.arg(_args, 4))
	_S.call_value(_S.read(_e, "rows"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.unary("-", 180), _S.unary("-", 1), _S.function_value(_e, "_f3")])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 130)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "x", _S.binary("+", _S.unary("-", 160), _S.binary("*", _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "S"), _S.read(_v3, "i"), 1]), 320)))
		_S.define(_v3, "y", _S.binary("+", _S.unary("-", 180), _S.binary("*", _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "S"), _S.read(_v3, "i"), 2]), 178)))
		_S.define(_v3, "r", _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "S"), _S.read(_v3, "i"), 3]))
		_S.define(_v3, "c", _S.binary("+", 1, _S.invoke(_S.read(_v3, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "S"), _S.read(_v3, "i"), 4]), 4)])))
		_S.define(_v3, "tw", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v3, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v3, "TAU"), _S.read(_v3, "c")), _S.read(_v3, "t")), _S.read(_v3, "D")), _S.binary("*", _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "S"), _S.read(_v3, "i"), 5]), _S.read(_v3, "TAU")))]))))
		if _S.truth(_S.binary("<", _S.read(_v3, "r"), 0.6)):
			_S.invoke(_S.read(_v3, "q"), "dot", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.prop(_S.read(_v3, "K"), 3), _S.binary("+", 0.35, _S.binary("*", 0.5, _S.read(_v3, "tw")))])
		else:
			if _S.truth(_S.binary("<", _S.read(_v3, "r"), 0.94)):
				_S.last([_S.invoke(_S.read(_v3, "q"), "px", [_S.read(_v3, "x"), _S.read(_v3, "y"), (_S.prop(_S.read(_v3, "K"), 4) if _S.truth(_S.binary("<", _S.read(_v3, "r"), 0.8)) else _S.read(_v3, "WHITE"))]), _S.invoke(_S.read(_v3, "q"), "glow", [_S.binary("+", _S.read(_v3, "x"), 0.5), _S.binary("+", _S.read(_v3, "y"), 0.5), 3, _S.prop(_S.read(_v3, "K"), 3), _S.binary("*", 0.22, _S.read(_v3, "tw"))])])
			else:
				_S.call_value(_S.read(_v3, "sparkle"), [_S.read(_v3, "q"), _S.read(_v3, "x"), _S.read(_v3, "y"), _S.binary("+", 1, _S.invoke(_S.read(_v3, "Math"), "round", [_S.binary("*", _S.read(_v3, "tw"), 2)])), _S.prop(_S.read(_v3, "K"), 4), _S.prop(_S.read(_v3, "K"), 3), _S.binary("*", 0.3, _S.read(_v3, "tw"))])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "R", _S.arg(_args, 1))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 320)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", _S.binary("+", _S.binary("-", _S.read(_v1, "i"), 160), 0.5))
		_S.define(_v1, "d", _S.binary("/", _S.invoke(_S.read(_v1, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_v1, "y"), 110), _S.binary("*", _S.read(_v1, "x"), _S.unary("-", 0.32)))]), 36))
		if _S.truth(_S.binary(">=", _S.read(_v1, "d"), 1)):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "i", 1, "+=", true)
			continue
		_S.define(_v1, "k", _S.binary("*", _S.binary("-", 1, _S.read(_v1, "d")), _S.binary("-", 1, _S.read(_v1, "d"))))
		_S.set_prop(_S.prop(_S.read(_v1, "R"), "l"), _S.read(_v1, "i"), _S.prop(_S.read(_v1, "K"), 2), "=", false)
		_S.set_prop(_S.prop(_S.read(_v1, "R"), "k"), _S.read(_v1, "i"), _S.binary("*", 0.1, _S.read(_v1, "k")), "=", false)
		if _S.truth(_S.binary("<", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "i"), _S.invoke(_S.read(_v1, "Math"), "floor", [_S.read(_v1, "y")]), _S.read(_v1, "S"), 5]), _S.binary("*", 0.05, _S.read(_v1, "k")))):
			_S.last([_S.set_prop(_S.prop(_S.read(_v1, "R"), "c"), _S.read(_v1, "i"), _S.prop(_S.read(_v1, "K"), 2), "=", false), _S.set_prop(_S.prop(_S.read(_v1, "R"), "a"), _S.read(_v1, "i"), 0.7, "=", false)])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "m", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "S", _S.arg(_args, 4))
	_S.define(_e, "C", _S.arg(_args, 5))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "m"), "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "m"), "a")]))
	_S.define(_e, "end", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "m"), "life"), (0.5 if _S.truth(_S.prop(_S.read(_e, "m"), "flare")) else 0)), _S.read(_e, "TRAIN")))
	if _S.truth(_S.binary(">", _S.read(_e, "age"), _S.read(_e, "end"))):
		return null
	_S.define(_e, "pos", _S.function_value(_e, "_f5"))
	_S.define(_e, "burn", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "age"), _S.prop(_S.read(_e, "m"), "life")]))
	var _v4 = _S.call_value(_S.read(_e, "pos"), [_S.read(_e, "burn")])
	_S.define(_e, "hx", _S.prop(_v4, 0))
	_S.define(_e, "hy", _S.prop(_v4, 1))
	_S.define(_e, "trainK", (1 if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.prop(_S.read(_e, "m"), "life"))) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "m"), "life")), _S.binary("+", _S.read(_e, "TRAIN"), (0.5 if _S.truth(_S.prop(_S.read(_e, "m"), "flare")) else 0))))))
	if _S.truth(_S.binary(">", _S.read(_e, "trainK"), 0)):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "len", _S.binary("*", _S.prop(_S.read(_v5, "m"), "v"), _S.read(_v5, "burn")))
		_S.define(_v5, "nx", _S.unary("-", _S.read(_v5, "sa")))
		_S.define(_v5, "ny", _S.read(_v5, "ca"))
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "d", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "d"), _S.read(_v6, "len"))):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "passed", _S.binary("-", _S.read(_v7, "age"), _S.binary("/", _S.read(_v7, "d"), _S.prop(_S.read(_v7, "m"), "v"))))
			if _S.truth(_S.binary("<", _S.read(_v7, "passed"), 0.08)):
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "d", 1, "+=", false)
				continue
			_S.define(_v7, "g", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v7, "trainK"), _S.invoke(_S.read(_v7, "Math"), "min", [1, _S.binary("*", _S.binary("-", _S.read(_v7, "passed"), 0.08), 4)])), _S.binary("+", 0.35, _S.binary("*", 0.65, _S.invoke(_S.read(_v7, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_v7, "Math"), "PI"), _S.read(_v7, "d")), _S.read(_v7, "len"))])))), _S.prop(_S.read(_v7, "m"), "s")))
			_S.define(_v7, "tw", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v7, "d"), 0.09), _S.binary("*", _S.read(_v7, "passed"), 1.7))]), _S.invoke(_S.read(_v7, "Math"), "min", [4, _S.binary("*", _S.read(_v7, "passed"), 3)])))
			_S.define(_v7, "x", _S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v7, "m"), "x"), _S.binary("*", _S.read(_v7, "ca"), _S.read(_v7, "d"))), _S.binary("*", _S.read(_v7, "nx"), _S.read(_v7, "tw"))), _S.binary("*", _S.read(_v7, "passed"), 4)))
			_S.define(_v7, "y", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v7, "m"), "y"), _S.binary("*", _S.read(_v7, "sa"), _S.read(_v7, "d"))), _S.binary("*", _S.read(_v7, "ny"), _S.read(_v7, "tw"))))
			_S.invoke(_S.read(_v7, "q"), "dot", [_S.read(_v7, "x"), _S.read(_v7, "y"), (_S.prop(_S.read(_v7, "C"), 2) if _S.truth(_S.binary("<", _S.read(_v7, "passed"), 0.6)) else _S.prop(_S.read(_v7, "C"), 1)), _S.binary("*", _S.read(_v7, "g"), 0.75)])
			if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v7, "d"), 6), 0)):
				_S.invoke(_S.read(_v7, "q"), "glow", [_S.read(_v7, "x"), _S.read(_v7, "y"), _S.binary("+", 6, _S.binary("*", _S.read(_v7, "passed"), 4)), _S.prop(_S.read(_v7, "C"), 1), _S.binary("*", 0.12, _S.read(_v7, "g"))])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "d", 1, "+=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "age"), _S.binary("+", _S.prop(_S.read(_e, "m"), "life"), (0.5 if _S.truth(_S.prop(_S.read(_e, "m"), "flare")) else 0)))):
		return null
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "m"), "life")))
	_S.define(_e, "k", (_S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "u"), 6)]), (_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "u"), 0.75), 0.25)) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.75)) else 1)) if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.prop(_S.read(_e, "m"), "life"))) else 0))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "L", _S.binary("*", _S.binary("+", 24, _S.binary("*", 40, _S.prop(_S.read(_v8, "m"), "s"))), _S.invoke(_S.read(_v8, "Math"), "min", [1, _S.binary("*", _S.read(_v8, "u"), 3)])))
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "d", 0)
		while _S.truth(_S.binary("<=", _S.read(_v9, "d"), _S.read(_v9, "L"))):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "v", _S.binary("/", _S.read(_v10, "d"), _S.read(_v10, "L")))
			_S.define(_v10, "x", _S.binary("-", _S.read(_v10, "hx"), _S.binary("*", _S.read(_v10, "ca"), _S.read(_v10, "d"))))
			_S.define(_v10, "y", _S.binary("-", _S.read(_v10, "hy"), _S.binary("*", _S.read(_v10, "sa"), _S.read(_v10, "d"))))
			_S.invoke(_S.read(_v10, "q"), "dot", [_S.read(_v10, "x"), _S.read(_v10, "y"), (_S.read(_v10, "WHITE") if _S.truth(_S.binary("<", _S.read(_v10, "v"), 0.08)) else _S.call_value(_S.read(_v10, "at"), [_S.invoke(_S.invoke(_S.read(_v10, "C"), "slice", [1]), "reverse", []), _S.binary("*", _S.read(_v10, "v"), 0.95)])), _S.binary("*", _S.read(_v10, "k"), (1 if _S.truth(_S.binary("<", _S.read(_v10, "v"), 0.6)) else _S.binary("/", _S.binary("-", 1, _S.read(_v10, "v")), 0.4)))])
			if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v10, "m"), "s"), 0.9), func(): return _S.binary("<", _S.read(_v10, "v"), 0.4))):
				_S.invoke(_S.read(_v10, "q"), "dot", [_S.binary("-", _S.read(_v10, "x"), _S.binary("*", _S.read(_v10, "sa"), 0.9)), _S.binary("+", _S.read(_v10, "y"), _S.binary("*", _S.read(_v10, "ca"), 0.9)), (_S.prop(_S.read(_v10, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v10, "v"), 0.15)) else _S.prop(_S.read(_v10, "C"), 3)), _S.binary("*", _S.read(_v10, "k"), _S.binary("-", 1, _S.binary("/", _S.read(_v10, "v"), 0.4)))])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "d", 0.5, "+=", false)
		_S.invoke(_S.read(_v8, "q"), "px", [_S.read(_v8, "hx"), _S.read(_v8, "hy"), _S.read(_v8, "WHITE")])
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v8, "m"), "s"), 0.9)):
			_S.last([_S.invoke(_S.read(_v8, "q"), "px", [_S.binary("+", _S.read(_v8, "hx"), 1), _S.read(_v8, "hy"), _S.read(_v8, "WHITE")]), _S.invoke(_S.read(_v8, "q"), "px", [_S.read(_v8, "hx"), _S.binary("+", _S.read(_v8, "hy"), 1), _S.prop(_S.read(_v8, "C"), 4)])])
		_S.invoke(_S.read(_v8, "q"), "glow", [_S.read(_v8, "hx"), _S.read(_v8, "hy"), _S.binary("+", 8, _S.binary("*", 10, _S.prop(_S.read(_v8, "m"), "s"))), _S.prop(_S.read(_v8, "C"), 4), _S.binary("*", 0.45, _S.read(_v8, "k"))])
		_S.invoke(_S.read(_v8, "q"), "glow", [_S.binary("-", _S.read(_v8, "hx"), _S.binary("*", _S.binary("*", _S.read(_v8, "ca"), _S.read(_v8, "L")), 0.3)), _S.binary("-", _S.read(_v8, "hy"), _S.binary("*", _S.binary("*", _S.read(_v8, "sa"), _S.read(_v8, "L")), 0.3)), _S.binary("+", 10, _S.binary("*", 8, _S.prop(_S.read(_v8, "m"), "s"))), _S.prop(_S.read(_v8, "C"), 3), _S.binary("*", 0.2, _S.read(_v8, "k"))])
	if _S.truth(_S.logical("||", _S.unary("!", _S.prop(_S.read(_e, "m"), "flare")), func(): return _S.binary("<", _S.read(_e, "age"), _S.binary("*", _S.prop(_S.read(_e, "m"), "life"), 0.82)))):
		return null
	_S.define(_e, "f", _S.binary("/", _S.binary("-", _S.read(_e, "age"), _S.binary("*", _S.prop(_S.read(_e, "m"), "life"), 0.82)), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "m"), "life"), 0.18), 0.5)))
	var _v11 = _S.call_value(_S.read(_e, "pos"), [_S.binary("*", _S.prop(_S.read(_e, "m"), "life"), 0.86)])
	_S.define(_e, "fx", _S.prop(_v11, 0))
	_S.define(_e, "fy", _S.prop(_v11, 1))
	if _S.truth(_S.binary("<", _S.read(_e, "f"), 0.35)):
		var _v12 = _S.scope(_e)
		_S.call_value(_S.read(_v12, "sparkle"), [_S.read(_v12, "q"), _S.read(_v12, "fx"), _S.read(_v12, "fy"), _S.binary("+", _S.binary("*", 9, _S.invoke(_S.read(_v12, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_v12, "Math"), "PI"), _S.read(_v12, "f")), 0.35)])), 2), _S.prop(_S.read(_v12, "C"), 4), _S.prop(_S.read(_v12, "C"), 3), 0.6])
		_S.invoke(_S.read(_v12, "q"), "glow", [_S.read(_v12, "fx"), _S.read(_v12, "fy"), 40, _S.prop(_S.read(_v12, "C"), 3), _S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.read(_v12, "f"), 0.35)))])
	var _v13 = _S.scope(_e)
	_S.define(_v13, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "j"), 7)):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "ang", _S.binary("*", _S.call_value(_S.read(_v14, "rand"), [_S.read(_v14, "S"), _S.read(_v14, "i"), _S.read(_v14, "j"), 5]), _S.read(_v14, "TAU")))
		_S.define(_v14, "r", _S.binary("+", 5, _S.binary("*", _S.call_value(_S.read(_v14, "rand"), [_S.read(_v14, "S"), _S.read(_v14, "i"), _S.read(_v14, "j"), 6]), 16)))
		_S.define(_v14, "d0", _S.binary("*", _S.call_value(_S.read(_v14, "rand"), [_S.read(_v14, "S"), _S.read(_v14, "i"), _S.read(_v14, "j"), 7]), 0.3))
		_S.define(_v14, "g", _S.binary("/", _S.binary("-", _S.read(_v14, "f"), _S.read(_v14, "d0")), 0.45))
		if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v14, "g"), 0), func(): return _S.binary(">=", _S.read(_v14, "g"), 1))):
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "j", 1, "+=", true)
			continue
		_S.define(_v14, "sx", _S.binary("+", _S.read(_v14, "fx"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "ang")]), _S.read(_v14, "r")), _S.binary("+", 0.6, _S.binary("*", _S.read(_v14, "g"), 0.5)))))
		_S.define(_v14, "sy", _S.binary("-", _S.binary("+", _S.read(_v14, "fy"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "ang")]), _S.read(_v14, "r")), _S.binary("+", 0.6, _S.binary("*", _S.read(_v14, "g"), 0.5)))), _S.binary("*", _S.read(_v14, "g"), 3)))
		_S.define(_v14, "arm", _S.invoke(_S.read(_v14, "Math"), "round", [_S.binary("*", 2.5, _S.invoke(_S.read(_v14, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v14, "Math"), "PI"), _S.read(_v14, "g"))]))]))
		if _S.truth(_S.binary(">=", _S.read(_v14, "arm"), 1)):
			_S.call_value(_S.read(_v14, "sparkle"), [_S.read(_v14, "q"), _S.read(_v14, "sx"), _S.read(_v14, "sy"), _S.read(_v14, "arm"), (_S.prop(_S.read(_v14, "C"), 4) if _S.truth(_S.binary("%", _S.read(_v14, "j"), 3)) else _S.read(_v14, "WHITE")), _S.prop(_S.read(_v14, "C"), 3), _S.binary("*", 0.3, _S.binary("-", 1, _S.read(_v14, "g")))])
		else:
			_S.invoke(_S.read(_v14, "q"), "px", [_S.read(_v14, "sx"), _S.read(_v14, "sy"), _S.prop(_S.read(_v14, "C"), 4)])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "j", 1, "+=", true)
	var _v15 = _S.scope(_e)
	_S.define(_v15, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v15, "j"), 4)):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "da", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v16, "rand"), [_S.read(_v16, "S"), _S.read(_v16, "i"), _S.read(_v16, "j"), 1]), 0.5), 0.5))
		_S.define(_v16, "sp", _S.binary("*", _S.prop(_S.read(_v16, "m"), "v"), _S.binary("+", 0.5, _S.binary("*", _S.call_value(_S.read(_v16, "rand"), [_S.read(_v16, "S"), _S.read(_v16, "i"), _S.read(_v16, "j"), 2]), 0.4))))
		_S.define(_v16, "tt", _S.binary("*", _S.read(_v16, "f"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v16, "m"), "life"), 0.18), 0.5)))
		_S.define(_v16, "g", _S.binary("-", 1, _S.read(_v16, "f")))
		_S.define(_v16, "x", _S.binary("+", _S.read(_v16, "fx"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.binary("+", _S.prop(_S.read(_v16, "m"), "a"), _S.read(_v16, "da"))]), _S.read(_v16, "sp")), _S.read(_v16, "tt"))))
		_S.define(_v16, "y", _S.binary("+", _S.read(_v16, "fy"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.binary("+", _S.prop(_S.read(_v16, "m"), "a"), _S.read(_v16, "da"))]), _S.read(_v16, "sp")), _S.read(_v16, "tt"))))
		if _S.truth(_S.binary("<=", _S.read(_v16, "g"), 0)):
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "j", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v16, "q"), "line", [_S.binary("-", _S.read(_v16, "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.binary("+", _S.prop(_S.read(_v16, "m"), "a"), _S.read(_v16, "da"))]), 5), _S.read(_v16, "g"))), _S.binary("-", _S.read(_v16, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.binary("+", _S.prop(_S.read(_v16, "m"), "a"), _S.read(_v16, "da"))]), 5), _S.read(_v16, "g"))), _S.read(_v16, "x"), _S.read(_v16, "y"), _S.prop(_S.read(_v16, "C"), 3), _S.read(_v16, "g")])
		_S.invoke(_S.read(_v16, "q"), "px", [_S.read(_v16, "x"), _S.read(_v16, "y"), (_S.read(_v16, "WHITE") if _S.truth(_S.binary(">", _S.read(_v16, "g"), 0.5)) else _S.prop(_S.read(_v16, "C"), 4))])
		_S.invoke(_S.read(_v16, "q"), "glow", [_S.read(_v16, "x"), _S.read(_v16, "y"), 5, _S.prop(_S.read(_v16, "C"), 3), _S.binary("*", 0.35, _S.read(_v16, "g"))])
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "j", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return [_S.binary("+", _S.prop(_S.read(_e, "m"), "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ca"), _S.prop(_S.read(_e, "m"), "v")), _S.read(_e, "tt"))), _S.binary("+", _S.prop(_S.read(_e, "m"), "y"), _S.binary("*", _S.binary("*", _S.read(_e, "sa"), _S.prop(_S.read(_e, "m"), "v")), _S.read(_e, "tt")))]
