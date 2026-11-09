@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "beat", _S.function_value(_e, "_f0"))
	_S.define(_e, "wake", _S.function_value(_e, "_f1"))
	_S.define(_e, "puff", _S.function_value(_e, "_f2"))
	_S.define(_e, "cloud", _S.function_value(_e, "_f3"))
	_S.define(_e, "blur", _S.function_value(_e, "_f5"))
	_S.define(_e, "spark", _S.function_value(_e, "_f6"))
	_S.define(_e, "flashShape", _S.function_value(_e, "_f7"))
	_S.define(_e, "flash", _S.function_value(_e, "_f9"))
	_S.define(_e, "casing", _S.function_value(_e, "_f11"))
	_S.define(_e, "drawCasing", _S.function_value(_e, "_f12"))
	_S.define(_e, "turnSprite", _S.function_value(_e, "_f13"))
	_S.define(_e, "pixelShape", _S.function_value(_e, "_f15"))
	_exports["beat"] = _S.read(_e, "beat")
	_exports["wake"] = _S.read(_e, "wake")
	_exports["puff"] = _S.read(_e, "puff")
	_exports["cloud"] = _S.read(_e, "cloud")
	_S.define(_e, "Smoke", _S.class_value("Smoke", _S.function_value(_e, "_f20"), {"add": _S.function_value(_e, "_f21"), "update": _S.function_value(_e, "_f23"), "puffs": _S.function_value(_e, "_f24")}, {"count": _S.function_value(_e, "_f22")}, {}, null))
	_exports["Smoke"] = _S.read(_e, "Smoke")
	_exports["spark"] = _S.read(_e, "spark")
	_exports["flashShape"] = _S.read(_e, "flashShape")
	_S.define(_e, "profile", _S.function_value(_e, "_f25"))
	_exports["flash"] = _S.read(_e, "flash")
	_exports["casing"] = _S.read(_e, "casing")
	_exports["drawCasing"] = _S.read(_e, "drawCasing")
	_exports["turnSprite"] = _S.read(_e, "turnSprite")
	_exports["pixelShape"] = _S.read(_e, "pixelShape")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "period", _S.arg(_args, 1))
	_S.define(_e, "n", _S.arg(_args, 2))
	_S.define(_e, "seed", _S.arg(_args, 3))
	_S.define(_e, "life", _S.arg(_args, 4))
	_S.define(_e, "fn", _S.arg(_args, 5))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.read(_v0, "n"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "L", (_S.call_value(_S.read(_v1, "life"), [_S.call_value(_S.read(_v1, "rng"), [_S.read(_v1, "seed"), _S.read(_v1, "i"), 911])]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_v1, "life")), "function")) else _S.read(_v1, "life")))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "age", _S.call_value(_S.read(_v2, "wrap"), [_S.binary("+", _S.binary("-", _S.read(_v2, "t"), _S.binary("/", _S.binary("*", _S.read(_v2, "i"), _S.read(_v2, "period")), _S.read(_v2, "n"))), 1e-7), _S.read(_v2, "period")]))
		while _S.truth(_S.binary("<", _S.read(_v2, "age"), _S.read(_v2, "L"))):
			_S.call_value(_S.read(_v2, "fn"), [_S.read(_v2, "age"), _S.read(_v2, "L"), _S.call_value(_S.read(_v2, "rng"), [_S.read(_v2, "seed"), _S.read(_v2, "i")]), _S.read(_v2, "i")])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "age", _S.read(_v2, "period"), "+=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "vy", _S.arg(_args, 3))
	_S.define(_e, "age", _S.arg(_args, 4))
	_S.define(_e, "V", _S.arg(_args, 5))
	_S.define(_e, "k", _S.arg(_args, 6))
	_S.define(_e, "g", _S.coalesce(_S.arg(_args, 7), func(): return 0))
	_S.define(_e, "e", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "k")), _S.read(_e, "age"))]))
	_S.define(_e, "f", _S.binary("/", _S.binary("-", 1, _S.read(_e, "e")), _S.read(_e, "k")))
	_S.define(_e, "vt", _S.binary("/", _S.read(_e, "g"), _S.read(_e, "k")))
	return [_S.binary("-", _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "vx"), _S.read(_e, "f"))), _S.binary("*", _S.read(_e, "V"), _S.read(_e, "age"))), _S.binary("+", _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "vt"), _S.read(_e, "age"))), _S.binary("*", _S.binary("-", _S.read(_e, "vy"), _S.read(_e, "vt")), _S.read(_e, "f"))), _S.binary("-", _S.binary("*", _S.read(_e, "vx"), _S.read(_e, "e")), _S.read(_e, "V")), _S.binary("+", _S.read(_e, "vt"), _S.binary("*", _S.binary("-", _S.read(_e, "vy"), _S.read(_e, "vt")), _S.read(_e, "e")))]

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "a", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "cap", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	_S.define(_e, "warm", _S.coalesce(_S.arg(_args, 7), func(): return 0))
	_S.define(_e, "wc", _S.coalesce(_S.arg(_args, 8), func(): return 0))
	_S.define(_e, "wa", _S.coalesce(_S.arg(_args, 9), func(): return 0))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "a"), 0.01), func(): return _S.binary("<", _S.read(_e, "r"), 0.5))):
		return null
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.read(_e, "c"), _S.binary("*", _S.read(_e, "a"), 0.45)])
	_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.05)), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.06)), _S.binary("*", _S.read(_e, "r"), 0.74), _S.read(_e, "c"), _S.binary("*", _S.read(_e, "a"), 0.62)])
	if _S.truth(_S.binary(">", _S.read(_e, "cap"), 0.02)):
		_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.22)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.3)), _S.binary("*", _S.read(_e, "r"), 0.5), _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.read(_e, "WHITE"), 0.14]), _S.binary("*", _S.binary("*", _S.read(_e, "a"), 0.42), _S.read(_e, "cap"))])
	if _S.truth(_S.binary(">", _S.read(_e, "warm"), 0.02)):
		_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "wa")]), _S.read(_e, "r")), 0.32)), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "wa")]), _S.read(_e, "r")), 0.32)), _S.binary("*", _S.read(_e, "r"), 0.55), _S.read(_e, "wc"), _S.binary("*", _S.binary("*", _S.read(_e, "a"), 0.7), _S.read(_e, "warm"))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "list", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "WR", _S.arg(_args, 3))
	var _v3 = _S.coalesce(_S.arg(_args, 4), func(): return _S.merge([]))
	_S.define(_e, "dens", _S.coalesce(_S.prop(_v3, "dens"), func(): return 1.5))
	_S.define(_e, "max", _S.coalesce(_S.prop(_v3, "max"), func(): return 0.86))
	_S.define(_e, "clip", _S.prop(_v3, "clip"))
	_S.define(_e, "lit", _S.coalesce(_S.prop(_v3, "lit"), func(): return 1))
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "list"), "length"))):
		return null
	_S.define(_e, "X0", INF)
	_S.define(_e, "Y0", INF)
	_S.define(_e, "X1", _S.unary("-", INF))
	_S.define(_e, "Y1", _S.unary("-", INF))
	for _v4 in _S.array(_S.read(_e, "list")):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "q", _v4)
		var _v6 = _S.scope(_v5)
		_S.write(_v6, "X0", _S.invoke(_S.read(_v6, "Math"), "min", [_S.read(_v6, "X0"), _S.invoke(_S.read(_v6, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_v6, "q"), "x"), _S.prop(_S.read(_v6, "q"), "r"))])]), "=", false)
		_S.write(_v6, "X1", _S.invoke(_S.read(_v6, "Math"), "max", [_S.read(_v6, "X1"), _S.invoke(_S.read(_v6, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_v6, "q"), "x"), _S.prop(_S.read(_v6, "q"), "r"))])]), "=", false)
		_S.write(_v6, "Y0", _S.invoke(_S.read(_v6, "Math"), "min", [_S.read(_v6, "Y0"), _S.invoke(_S.read(_v6, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_v6, "q"), "y"), _S.prop(_S.read(_v6, "q"), "r"))])]), "=", false)
		_S.write(_v6, "Y1", _S.invoke(_S.read(_v6, "Math"), "max", [_S.read(_v6, "Y1"), _S.invoke(_S.read(_v6, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_v6, "q"), "y"), _S.prop(_S.read(_v6, "q"), "r"))])]), "=", false)
	_S.define(_e, "W", _S.binary("+", _S.binary("-", _S.read(_e, "X1"), _S.read(_e, "X0")), 3))
	_S.define(_e, "H", _S.binary("+", _S.binary("-", _S.read(_e, "Y1"), _S.read(_e, "Y0")), 3))
	_S.define(_e, "D", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "L", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "F", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.last([_S.write(_e, "X0", 1, "-=", true), _S.write(_e, "Y0", 1, "-=", true)])
	for _v7 in _S.array(_S.read(_e, "list")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "q", _v7)
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "r", _S.prop(_S.read(_v9, "q"), "r"))
		_S.define(_v9, "r2", _S.binary("*", _S.read(_v9, "r"), _S.read(_v9, "r")))
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "y", _S.invoke(_S.read(_v10, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_v10, "q"), "y"), _S.read(_v10, "r"))]))
		while _S.truth(_S.binary("<=", _S.read(_v10, "y"), _S.invoke(_S.read(_v10, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_v10, "q"), "y"), _S.read(_v10, "r"))]))):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "dy", _S.binary("-", _S.binary("+", _S.read(_v11, "y"), 0.5), _S.prop(_S.read(_v11, "q"), "y")))
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "x", _S.invoke(_S.read(_v12, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_v12, "q"), "x"), _S.read(_v12, "r"))]))
			while _S.truth(_S.binary("<=", _S.read(_v12, "x"), _S.invoke(_S.read(_v12, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_v12, "q"), "x"), _S.read(_v12, "r"))]))):
				var _v13 = _S.scope(_v12)
				_S.define(_v13, "dx", _S.binary("-", _S.binary("+", _S.read(_v13, "x"), 0.5), _S.prop(_S.read(_v13, "q"), "x")))
				_S.define(_v13, "d2", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_v13, "dx"), _S.read(_v13, "dx")), _S.binary("*", _S.read(_v13, "dy"), _S.read(_v13, "dy"))), _S.read(_v13, "r2")))
				if _S.truth(_S.binary(">=", _S.read(_v13, "d2"), 1)):
					_v12 = _S.iteration(_v12)
					_S.write(_v12, "x", 1, "+=", true)
					continue
				_S.define(_v13, "k", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sqrt", [_S.binary("-", 1, _S.read(_v13, "d2"))]), _S.prop(_S.read(_v13, "q"), "a")))
				_S.define(_v13, "i", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v13, "y"), _S.read(_v13, "Y0")), _S.read(_v13, "W")), _S.binary("-", _S.read(_v13, "x"), _S.read(_v13, "X0"))))
				_S.set_prop(_S.read(_v13, "D"), _S.read(_v13, "i"), _S.read(_v13, "k"), "+=", false)
				_S.set_prop(_S.read(_v13, "L"), _S.read(_v13, "i"), _S.binary("*", _S.read(_v13, "k"), _S.prop(_S.read(_v13, "q"), "b")), "+=", false)
				_S.set_prop(_S.read(_v13, "F"), _S.read(_v13, "i"), _S.binary("*", _S.binary("*", _S.read(_v13, "k"), _S.prop(_S.read(_v13, "q"), "w")), _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_v13, "clamp"), [_S.binary("+", 0.5, _S.binary("/", _S.read(_v13, "dx"), _S.read(_v13, "r")))])))), "+=", false)
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "x", 1, "+=", true)
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "y", 1, "+=", true)
	_S.define(_e, "B", _S.call_value(_S.read(_e, "blur"), [_S.call_value(_S.read(_e, "blur"), [_S.read(_e, "D"), _S.read(_e, "W"), _S.read(_e, "H"), 1, 2]), _S.read(_e, "W"), _S.read(_e, "H"), _S.read(_e, "W"), 2]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "R"), "length"))
	_S.invoke(_S.read(_e, "p"), "each", [_S.binary("+", _S.read(_e, "X0"), 1), _S.binary("+", _S.read(_e, "Y0"), 1), _S.binary("+", _S.read(_e, "X1"), 1), _S.binary("+", _S.read(_e, "Y1"), 1), _S.function_value(_e, "_f4")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "lx", _S.arg(_args, 0))
	_S.define(_e, "ly", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.arg(_args, 2))
	_S.define(_e, "sy", _S.arg(_args, 3))
	_S.define(_e, "cx", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "lx")]), _S.read(_e, "X0")))
	_S.define(_e, "cy", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "ly")]), _S.read(_e, "Y0")))
	if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "cx"), 1), func(): return _S.binary("<", _S.read(_e, "cy"), 1)), func(): return _S.binary(">=", _S.read(_e, "cx"), _S.binary("-", _S.read(_e, "W"), 1))), func(): return _S.binary(">=", _S.read(_e, "cy"), _S.binary("-", _S.read(_e, "H"), 1)))):
		return null
	_S.define(_e, "i", _S.binary("+", _S.binary("*", _S.read(_e, "cy"), _S.read(_e, "W")), _S.read(_e, "cx")))
	_S.define(_e, "d", _S.prop(_S.read(_e, "D"), _S.read(_e, "i")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "d"), 0.05), func(): return _S.logical("&&", _S.read(_e, "clip"), func(): return _S.unary("!", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "lx"), _S.read(_e, "ly")]))))):
		return null
	_S.define(_e, "a", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "max"), _S.binary("/", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "d")), _S.read(_e, "dens"))])), 6)]), 6)]))
	if _S.truth(_S.binary("<", _S.read(_e, "a"), 0.15)):
		return null
	_S.define(_e, "gy", _S.binary("-", _S.prop(_S.read(_e, "B"), _S.binary("+", _S.read(_e, "i"), _S.read(_e, "W"))), _S.prop(_S.read(_e, "B"), _S.binary("-", _S.read(_e, "i"), _S.read(_e, "W")))))
	_S.define(_e, "gx", _S.binary("-", _S.prop(_S.read(_e, "B"), _S.binary("+", _S.read(_e, "i"), 1)), _S.prop(_S.read(_e, "B"), _S.binary("-", _S.read(_e, "i"), 1))))
	_S.define(_e, "up", _S.call_value(_S.read(_e, "clamp"), [_S.binary("+", 0.5, _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "atan", [_S.binary("/", _S.binary("+", _S.binary("*", _S.read(_e, "gy"), 0.9), _S.binary("*", _S.read(_e, "gx"), 0.35)), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "B"), _S.read(_e, "i")), 0.16), 0.03))]), 0.42), _S.read(_e, "lit")))]))
	_S.define(_e, "w", _S.binary("/", _S.prop(_S.read(_e, "F"), _S.read(_e, "i")), _S.read(_e, "d")))
	_S.define(_e, "j", _S.call_value(_S.read(_e, "clamp"), [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.prop(_S.read(_e, "L"), _S.read(_e, "i")), _S.read(_e, "d")), _S.binary("+", 0.3, _S.binary("*", 0.7, _S.read(_e, "up")))), _S.binary("-", _S.read(_e, "n"), 1)), 0.25), _S.binary("*", _S.read(_e, "w"), 1.5))]), 0, _S.binary("-", _S.read(_e, "n"), 1)]))
	_S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), (_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "R"), _S.read(_e, "j")), _S.prop(_S.read(_e, "WR"), _S.read(_e, "j")), _S.invoke(_S.read(_e, "Math"), "min", [0.9, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.read(_e, "w"), 10)]), 10)])]) if _S.truth(_S.binary(">", _S.read(_e, "w"), 0.03)) else _S.prop(_S.read(_e, "R"), _S.read(_e, "j"))), _S.read(_e, "a")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "src", _S.arg(_args, 0))
	_S.define(_e, "w", _S.arg(_args, 1))
	_S.define(_e, "h", _S.arg(_args, 2))
	_S.define(_e, "step", _S.arg(_args, 3))
	_S.define(_e, "r", _S.arg(_args, 4))
	_S.define(_e, "out", _S.construct(_S.read(_e, "Float32Array"), [_S.prop(_S.read(_e, "src"), "length")]))
	_S.define(_e, "n", (_S.read(_e, "w") if _S.truth(_S.binary("===", _S.read(_e, "step"), 1)) else _S.read(_e, "h")))
	_S.define(_e, "lines", (_S.read(_e, "h") if _S.truth(_S.binary("===", _S.read(_e, "step"), 1)) else _S.read(_e, "w")))
	_S.define(_e, "k", _S.binary("/", 1, _S.binary("+", _S.binary("*", 2, _S.read(_e, "r")), 1)))
	var _v14 = _S.scope(_e)
	_S.define(_v14, "l", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "l"), _S.read(_v14, "lines"))):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "base", (_S.binary("*", _S.read(_v15, "l"), _S.read(_v15, "w")) if _S.truth(_S.binary("===", _S.read(_v15, "step"), 1)) else _S.read(_v15, "l")))
		_S.define(_v15, "acc", 0)
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "j", _S.unary("-", _S.read(_v16, "r")))
		while _S.truth(_S.binary("<=", _S.read(_v16, "j"), _S.read(_v16, "r"))):
			_S.write(_v16, "acc", (_S.prop(_S.read(_v16, "src"), _S.binary("+", _S.read(_v16, "base"), _S.binary("*", _S.read(_v16, "j"), _S.read(_v16, "step")))) if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v16, "j"), 0), func(): return _S.binary("<", _S.read(_v16, "j"), _S.read(_v16, "n")))) else 0), "+=", false)
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "j", 1, "+=", true)
		var _v17 = _S.scope(_v15)
		_S.define(_v17, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "j"), _S.read(_v17, "n"))):
			var _v18 = _S.scope(_v17)
			_S.set_prop(_S.read(_v18, "out"), _S.binary("+", _S.read(_v18, "base"), _S.binary("*", _S.read(_v18, "j"), _S.read(_v18, "step"))), _S.binary("*", _S.read(_v18, "acc"), _S.read(_v18, "k")), "=", false)
			_S.define(_v18, "a", _S.binary("-", _S.read(_v18, "j"), _S.read(_v18, "r")))
			_S.define(_v18, "b", _S.binary("+", _S.binary("+", _S.read(_v18, "j"), _S.read(_v18, "r")), 1))
			if _S.truth(_S.binary(">=", _S.read(_v18, "a"), 0)):
				_S.write(_v18, "acc", _S.prop(_S.read(_v18, "src"), _S.binary("+", _S.read(_v18, "base"), _S.binary("*", _S.read(_v18, "a"), _S.read(_v18, "step")))), "-=", false)
			if _S.truth(_S.binary("<", _S.read(_v18, "b"), _S.read(_v18, "n"))):
				_S.write(_v18, "acc", _S.prop(_S.read(_v18, "src"), _S.binary("+", _S.read(_v18, "base"), _S.binary("*", _S.read(_v18, "b"), _S.read(_v18, "step")))), "+=", false)
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "j", 1, "+=", true)
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "l", 1, "+=", true)
	return _S.read(_e, "out")

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "vx", _S.arg(_args, 3))
	_S.define(_e, "vy", _S.arg(_args, 4))
	_S.define(_e, "k", _S.arg(_args, 5))
	_S.define(_e, "S", _S.arg(_args, 6))
	_S.define(_e, "glow", _S.coalesce(_S.arg(_args, 7), func(): return 0.45))
	_S.define(_e, "stretch", _S.coalesce(_S.arg(_args, 8), func(): return 0.022))
	_S.define(_e, "max", _S.coalesce(_S.arg(_args, 9), func(): return 9))
	_S.define(_e, "sp", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "vx"), _S.read(_e, "vy")]), func(): return 1))
	_S.define(_e, "ux", _S.binary("/", _S.read(_e, "vx"), _S.read(_e, "sp")))
	_S.define(_e, "uy", _S.binary("/", _S.read(_e, "vy"), _S.read(_e, "sp")))
	_S.define(_e, "len", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "max"), _S.binary("+", 1, _S.binary("*", _S.read(_e, "sp"), _S.read(_e, "stretch")))]))
	_S.define(_e, "head", (_S.prop(_S.read(_e, "S"), 0) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.6)) else (_S.prop(_S.read(_e, "S"), 1) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.3)) else _S.prop(_S.read(_e, "S"), 2))))
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "len"))), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "len"))), _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "len")), 0.4)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "len")), 0.4)), (_S.read(_e, "head") if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.5)) else _S.prop(_S.read(_e, "S"), 3))])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "len")), 0.45)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "len")), 0.45)), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "head")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.read(_e, "head"), _S.binary("*", _S.read(_e, "glow"), _S.read(_e, "k"))])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "f", _S.arg(_args, 1))
	var _v19 = _S.coalesce(_S.arg(_args, 2), func(): return _S.merge([]))
	_S.define(_e, "size", _S.coalesce(_S.prop(_v19, "size"), func(): return 1))
	_S.define(_e, "spike", _S.coalesce(_S.prop(_v19, "spike"), func(): return [12, 20]))
	_S.define(_e, "diag", _S.coalesce(_S.prop(_v19, "diag"), func(): return [5, 10]))
	_S.define(_e, "cross", _S.coalesce(_S.prop(_v19, "cross"), func(): return [3, 6]))
	_S.define(_e, "back", _S.coalesce(_S.prop(_v19, "back"), func(): return [2, 4.5]))
	_S.define(_e, "core", _S.coalesce(_S.prop(_v19, "core"), func(): return 0.7))
	_S.define(_e, "k", (1 if _S.truth(_S.binary("===", _S.read(_e, "f"), 1)) else 0.6))
	_S.define(_e, "w", (1 if _S.truth(_S.binary("===", _S.read(_e, "f"), 1)) else 0.72))
	_S.define(_e, "S", _S.read(_e, "size"))
	_S.define(_e, "L", [_S.merge([{"off": 0.5}, {"a": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.08), 0.08])}, {"len": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [5.5, 8]), _S.read(_e, "S")), _S.read(_e, "k"))}, {"wid": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [2.1, 2.6]), _S.read(_e, "S")), _S.read(_e, "w"))}, {"core": _S.binary("*", 0.5, _S.read(_e, "core"))}]), _S.merge([{"off": 2}, {"a": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.07), 0.07])}, {"len": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.prop(_S.read(_e, "spike"), 0), _S.prop(_S.read(_e, "spike"), 1)]), _S.read(_e, "S")), _S.read(_e, "k"))}, {"wid": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [1, 1.3]), _S.read(_e, "S")), _S.read(_e, "w"))}, {"core": _S.binary("*", 0.35, _S.read(_e, "core"))}])])
	_S.define(_e, "ray", _S.function_value(_e, "_f8"))
	for _v20 in _S.array([_S.unary("-", 1), 1]):
		var _v21 = _S.scope(_e)
		_S.define(_v21, "s", _v20)
		var _v22 = _S.scope(_v21)
		_S.call_value(_S.read(_v22, "ray"), [_S.binary("*", _S.read(_v22, "s"), _S.invoke(_S.read(_v22, "r"), "range", [0.3, 0.8])), _S.invoke(_S.read(_v22, "r"), "range", [_S.prop(_S.read(_v22, "diag"), 0), _S.prop(_S.read(_v22, "diag"), 1)]), _S.invoke(_S.read(_v22, "r"), "range", [1.1, 1.5]), _S.invoke(_S.read(_v22, "r"), "chance", [0.85])])
		_S.call_value(_S.read(_v22, "ray"), [_S.binary("*", _S.read(_v22, "s"), _S.invoke(_S.read(_v22, "r"), "range", [1.15, 1.7])), _S.invoke(_S.read(_v22, "r"), "range", [_S.prop(_S.read(_v22, "cross"), 0), _S.prop(_S.read(_v22, "cross"), 1)]), _S.invoke(_S.read(_v22, "r"), "range", [1, 1.3]), _S.invoke(_S.read(_v22, "r"), "chance", [0.6])])
		_S.call_value(_S.read(_v22, "ray"), [_S.binary("*", _S.read(_v22, "s"), _S.invoke(_S.read(_v22, "r"), "range", [2, 2.7])), _S.invoke(_S.read(_v22, "r"), "range", [_S.prop(_S.read(_v22, "back"), 0), _S.prop(_S.read(_v22, "back"), 1)]), 1, _S.logical("&&", _S.invoke(_S.read(_v22, "r"), "chance", [0.7]), func(): return _S.binary("===", _S.read(_v22, "f"), 1))])
	return _S.read(_e, "L")

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "len", _S.arg(_args, 1))
	_S.define(_e, "wid", _S.arg(_args, 2))
	_S.define(_e, "on", _S.arg(_args, 3))
	return _S.logical("&&", _S.read(_e, "on"), func(): return _S.invoke(_S.read(_e, "L"), "push", [_S.merge([{"off": _S.invoke(_S.read(_e, "r"), "range", [0.5, 2])}, {"a": _S.read(_e, "a")}, {"len": _S.binary("*", _S.binary("*", _S.read(_e, "len"), _S.read(_e, "S")), _S.read(_e, "k"))}, {"wid": _S.binary("*", _S.binary("*", _S.read(_e, "wid"), _S.read(_e, "S")), _S.read(_e, "w"))}, {"core": _S.binary("*", 0.25, _S.read(_e, "core"))}])]))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "L", _S.arg(_args, 4))
	_S.define(_e, "C", _S.arg(_args, 5))
	_S.define(_e, "seed", _S.arg(_args, 6))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	_S.define(_e, "ext", 2)
	for _v23 in _S.array(_S.read(_e, "L")):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "l", _v23)
		_S.write(_v24, "ext", _S.invoke(_S.read(_v24, "Math"), "max", [_S.read(_v24, "ext"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v24, "l"), "off"), _S.prop(_S.read(_v24, "l"), "len")), 2)]), "=", false)
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "ext")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ext")), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "ext")), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "ext")), _S.function_value(_e, "_f10")])
	return _S.read(_e, "ext")

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")))
	_S.define(_e, "along", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "c")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "s"))))
	_S.define(_e, "across", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "s")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "c"))))
	_S.define(_e, "m", _S.unary("-", 9))
	_S.define(_e, "hot", false)
	_S.define(_e, "warm", false)
	for _v25 in _S.array(_S.read(_e, "L")):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "l", _v25)
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "ca", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.prop(_S.read(_v27, "l"), "a")]))
		_S.define(_v27, "sa", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.prop(_S.read(_v27, "l"), "a")]))
		_S.define(_v27, "lu", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v27, "along"), _S.prop(_S.read(_v27, "l"), "off")), _S.read(_v27, "ca")), _S.binary("*", _S.read(_v27, "across"), _S.read(_v27, "sa"))))
		_S.define(_v27, "lv", _S.binary("+", _S.binary("*", _S.unary("-", _S.binary("-", _S.read(_v27, "along"), _S.prop(_S.read(_v27, "l"), "off"))), _S.read(_v27, "sa")), _S.binary("*", _S.read(_v27, "across"), _S.read(_v27, "ca"))))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v27, "lu"), _S.unary("-", 1.5)), func(): return _S.binary(">", _S.read(_v27, "lu"), _S.binary("+", _S.prop(_S.read(_v27, "l"), "len"), 1)))):
			continue
		_S.define(_v27, "r", _S.call_value(_S.read(_v27, "profile"), [_S.read(_v27, "l"), _S.invoke(_S.read(_v27, "Math"), "max", [0, _S.read(_v27, "lu")])]))
		_S.define(_v27, "mm", _S.binary("-", _S.read(_v27, "r"), _S.invoke(_S.read(_v27, "Math"), "abs", [_S.read(_v27, "lv")])))
		if _S.truth(_S.binary(">", _S.read(_v27, "mm"), _S.read(_v27, "m"))):
			_S.write(_v27, "m", _S.read(_v27, "mm"), "=", false)
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v27, "lu"), _S.binary("*", _S.prop(_S.read(_v27, "l"), "len"), _S.prop(_S.read(_v27, "l"), "core"))), func(): return _S.binary("<=", _S.invoke(_S.read(_v27, "Math"), "abs", [_S.read(_v27, "lv")]), _S.binary("*", _S.read(_v27, "r"), 0.5)))):
			_S.write(_v27, "hot", true, "=", false)
		if _S.truth(_S.binary(">", _S.read(_v27, "mm"), _S.binary("*", _S.read(_v27, "r"), 0.4))):
			_S.write(_v27, "warm", true, "=", false)
	_S.define(_e, "dm", _S.binary("-", 1.6, _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "along"), 0.5), _S.read(_e, "across")])))
	if _S.truth(_S.binary(">", _S.read(_e, "dm"), _S.read(_e, "m"))):
		_S.write(_e, "m", _S.read(_e, "dm"), "=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "dm"), 0.6)):
		_S.write(_e, "hot", true, "=", false)
	_S.write(_e, "m", _S.binary("*", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "px")]), 73), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "py")]), 151)), _S.read(_e, "seed")]), 0.5), 0.5), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "ext"), 14)])), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "m"), _S.unary("-", 0.85))):
		return null
	return (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary("<", _S.read(_e, "m"), 0)) else (_S.prop(_S.read(_e, "C"), 0) if _S.truth(_S.read(_e, "hot")) else (_S.prop(_S.read(_e, "C"), 1) if _S.truth(_S.read(_e, "warm")) else _S.prop(_S.read(_e, "C"), 2))))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "vy", _S.arg(_args, 3))
	_S.define(_e, "va", _S.arg(_args, 4))
	_S.define(_e, "age", _S.arg(_args, 5))
	_S.define(_e, "g", _S.arg(_args, 6))
	_S.define(_e, "floor", _S.arg(_args, 7))
	_S.define(_e, "bounce", _S.coalesce(_S.arg(_args, 8), func(): return 0.42))
	_S.define(_e, "a0", _S.coalesce(_S.arg(_args, 9), func(): return 0))
	_S.define(_e, "t0", 0)
	_S.define(_e, "a", _S.read(_e, "a0"))
	_S.define(_e, "hit", _S.unary("-", 1))
	var _v28 = _S.scope(_e)
	_S.define(_v28, "n", 0)
	while _S.truth(_S.binary("<", _S.read(_v28, "n"), 6)):
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "d", _S.binary("-", _S.read(_v29, "floor"), _S.read(_v29, "y")))
		_S.define(_v29, "T", _S.binary("/", _S.binary("+", _S.unary("-", _S.read(_v29, "vy")), _S.invoke(_S.read(_v29, "Math"), "sqrt", [_S.invoke(_S.read(_v29, "Math"), "max", [0, _S.binary("+", _S.binary("*", _S.read(_v29, "vy"), _S.read(_v29, "vy")), _S.binary("*", _S.binary("*", 2, _S.read(_v29, "g")), _S.read(_v29, "d")))])])), _S.read(_v29, "g")))
		if _S.truth(_S.binary("<", _S.binary("-", _S.read(_v29, "age"), _S.read(_v29, "t0")), _S.read(_v29, "T"))):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "u", _S.binary("-", _S.read(_v30, "age"), _S.read(_v30, "t0")))
			return _S.merge([{"x": _S.binary("+", _S.read(_v30, "x"), _S.binary("*", _S.read(_v30, "vx"), _S.read(_v30, "u")))}, {"y": _S.binary("+", _S.binary("+", _S.read(_v30, "y"), _S.binary("*", _S.read(_v30, "vy"), _S.read(_v30, "u"))), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_v30, "g")), _S.read(_v30, "u")), _S.read(_v30, "u")))}, {"a": _S.binary("+", _S.read(_v30, "a"), _S.binary("*", _S.read(_v30, "va"), _S.read(_v30, "u")))}, {"rest": false}, {"hit": _S.read(_v30, "hit")}])
		_S.write(_v29, "x", _S.binary("*", _S.read(_v29, "vx"), _S.read(_v29, "T")), "+=", false)
		_S.write(_v29, "a", _S.binary("*", _S.read(_v29, "va"), _S.read(_v29, "T")), "+=", false)
		_S.write(_v29, "t0", _S.read(_v29, "T"), "+=", false)
		_S.write(_v29, "hit", _S.binary("-", _S.read(_v29, "age"), _S.read(_v29, "t0")), "=", false)
		_S.define(_v29, "vin", _S.binary("+", _S.read(_v29, "vy"), _S.binary("*", _S.read(_v29, "g"), _S.read(_v29, "T"))))
		_S.write(_v29, "y", _S.read(_v29, "floor"), "=", false)
		if _S.truth(_S.binary("<", _S.binary("*", _S.read(_v29, "vin"), _S.read(_v29, "bounce")), 45)):
			var _v31 = _S.scope(_v29)
			_S.define(_v31, "u", _S.binary("-", _S.read(_v31, "age"), _S.read(_v31, "t0")))
			_S.define(_v31, "k", 7)
			_S.define(_v31, "s", _S.binary("/", _S.binary("-", 1, _S.invoke(_S.read(_v31, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_v31, "k")), _S.read(_v31, "u"))])), _S.read(_v31, "k")))
			return _S.merge([{"x": _S.binary("+", _S.read(_v31, "x"), _S.binary("*", _S.binary("*", _S.read(_v31, "vx"), 0.6), _S.read(_v31, "s")))}, {"y": _S.read(_v31, "floor")}, {"a": _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "round", [_S.binary("/", _S.read(_v31, "a"), _S.prop(_S.read(_v31, "Math"), "PI"))]), _S.prop(_S.read(_v31, "Math"), "PI"))}, {"rest": true}, {"hit": _S.read(_v31, "hit")}])
		_S.write(_v29, "vy", _S.binary("*", _S.unary("-", _S.read(_v29, "vin")), _S.read(_v29, "bounce")), "=", false)
		_S.write(_v29, "vx", 0.55, "*=", false)
		_S.write(_v29, "va", 0.6, "*=", false)
		_v28 = _S.iteration(_v28)
		_S.write(_v28, "n", 1, "+=", true)
	return _S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "floor")}, {"a": _S.binary("*", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("/", _S.read(_e, "a"), _S.prop(_S.read(_e, "Math"), "PI"))]), _S.prop(_S.read(_e, "Math"), "PI"))}, {"rest": true}, {"hit": _S.read(_e, "hit")}])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "B", _S.arg(_args, 2))
	_S.define(_e, "fade", _S.coalesce(_S.arg(_args, 3), func(): return 1))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "k"), "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "k"), "a")]))
	_S.define(_e, "x", _S.prop(_S.read(_e, "k"), "x"))
	_S.define(_e, "y", _S.binary("-", _S.prop(_S.read(_e, "k"), "y"), 0.5))
	_S.invoke(_S.read(_e, "p"), "dot", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "ca")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "sa")), _S.prop(_S.read(_e, "B"), 1), _S.read(_e, "fade")])
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), _S.prop(_S.read(_e, "B"), 2), _S.read(_e, "fade")])
	_S.invoke(_S.read(_e, "p"), "dot", [_S.binary("+", _S.read(_e, "x"), _S.read(_e, "ca")), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "sa")), _S.prop(_S.read(_e, "B"), 3), _S.read(_e, "fade")])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_e, "k"), "hit"), 0), func(): return _S.binary("<", _S.prop(_S.read(_e, "k"), "hit"), 0.07))):
		var _v32 = _S.scope(_e)
		_S.invoke(_S.read(_v32, "p"), "px", [_S.binary("+", _S.read(_v32, "x"), _S.binary("*", _S.read(_v32, "ca"), 0.5)), _S.binary("-", _S.read(_v32, "y"), 1), _S.read(_v32, "WHITE")])
		_S.invoke(_S.read(_v32, "p"), "glow", [_S.read(_v32, "x"), _S.read(_v32, "y"), 5, _S.prop(_S.read(_v32, "B"), 3), _S.binary("*", 0.55, _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_v32, "k"), "hit"), 0.07)))])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "rows", _S.arg(_args, 1))
	_S.define(_e, "pal", _S.arg(_args, 2))
	_S.define(_e, "x", _S.arg(_args, 3))
	_S.define(_e, "y", _S.arg(_args, 4))
	_S.define(_e, "ang", _S.arg(_args, 5))
	_S.define(_e, "px", _S.arg(_args, 6))
	_S.define(_e, "py", _S.arg(_args, 7))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 8), func(): return 1))
	_S.define(_e, "H", _S.prop(_S.read(_e, "rows"), "length"))
	_S.define(_e, "W", _S.prop(_S.prop(_S.read(_e, "rows"), 0), "length"))
	_S.define(_e, "cs", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]))
	_S.define(_e, "sn", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]))
	_S.define(_e, "R", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "px"), _S.binary("-", _S.read(_e, "W"), _S.read(_e, "px"))]), _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "py"), _S.binary("-", _S.read(_e, "H"), _S.read(_e, "py"))])]), 1))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "R")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "R")), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "R")), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "R")), _S.function_value(_e, "_f14")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "lx", _S.arg(_args, 0))
	_S.define(_e, "ly", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "lx"), _S.read(_e, "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "ly"), _S.read(_e, "y")))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "cs")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sn"))), _S.read(_e, "px"))]))
	_S.define(_e, "j", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sn")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "cs"))), _S.read(_e, "py"))]))
	if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "i"), 0), func(): return _S.binary("<", _S.read(_e, "j"), 0)), func(): return _S.binary(">=", _S.read(_e, "i"), _S.read(_e, "W"))), func(): return _S.binary(">=", _S.read(_e, "j"), _S.read(_e, "H")))):
		return null
	_S.define(_e, "c", _S.prop(_S.read(_e, "pal"), _S.prop(_S.prop(_S.read(_e, "rows"), _S.read(_e, "j")), _S.read(_e, "i"))))
	if _S.truth(_S.unary("!", _S.read(_e, "c"))):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", _S.read(_e, "c"), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "a"), "=", false)
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x0", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	_S.define(_e, "w", _S.arg(_args, 2))
	_S.define(_e, "h", _S.arg(_args, 3))
	_S.define(_e, "build", _S.arg(_args, 4))
	_S.define(_e, "g", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "h")}]), _S.function_value(_e, "_f16")]))
	_S.define(_e, "set", _S.function_value(_e, "_f17"))
	_S.call_value(_S.read(_e, "build"), [_S.read(_e, "set")])
	_S.define(_e, "solid", _S.function_value(_e, "_f18"))
	var _v33 = _S.scope(_e)
	_S.define(_v33, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v33, "j"), _S.read(_v33, "h"))):
		var _v34 = _S.scope(_v33)
		_S.define(_v34, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v34, "i"), _S.read(_v34, "w"))):
			if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.prop(_S.read(_v34, "g"), _S.read(_v34, "j")), _S.read(_v34, "i")), "."), func(): return _S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v34, "solid"), [_S.binary("-", _S.read(_v34, "i"), 1), _S.read(_v34, "j")]), func(): return _S.call_value(_S.read(_v34, "solid"), [_S.binary("+", _S.read(_v34, "i"), 1), _S.read(_v34, "j")])), func(): return _S.call_value(_S.read(_v34, "solid"), [_S.read(_v34, "i"), _S.binary("-", _S.read(_v34, "j"), 1)])), func(): return _S.call_value(_S.read(_v34, "solid"), [_S.read(_v34, "i"), _S.binary("+", _S.read(_v34, "j"), 1)])))):
				_S.set_prop(_S.prop(_S.read(_v34, "g"), _S.read(_v34, "j")), _S.read(_v34, "i"), "o", "=", false)
			_v34 = _S.iteration(_v34)
			_S.write(_v34, "i", 1, "+=", true)
		_v33 = _S.iteration(_v33)
		_S.write(_v33, "j", 1, "+=", true)
	return _S.merge([{"rows": _S.invoke(_S.read(_e, "g"), "map", [_S.function_value(_e, "_f19")])}, {"x0": _S.read(_e, "x0")}, {"y0": _S.read(_e, "y0")}])

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.invoke(_S.call_value(_S.read(_e, "Array"), [_S.read(_e, "w")]), "fill", ["."])

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "ch", _S.arg(_args, 2))
	_S.define(_e, "i", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x0")))
	_S.define(_e, "j", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y0")))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "i"), 0), func(): return _S.binary(">=", _S.read(_e, "j"), 0)), func(): return _S.binary("<", _S.read(_e, "i"), _S.read(_e, "w"))), func(): return _S.binary("<", _S.read(_e, "j"), _S.read(_e, "h")))):
		_S.set_prop(_S.prop(_S.read(_e, "g"), _S.read(_e, "j")), _S.read(_e, "i"), _S.read(_e, "ch"), "=", false)
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "i"), 0), func(): return _S.binary(">=", _S.read(_e, "j"), 0)), func(): return _S.binary("<", _S.read(_e, "i"), _S.read(_e, "w"))), func(): return _S.binary("<", _S.read(_e, "j"), _S.read(_e, "h"))), func(): return _S.binary("!==", _S.prop(_S.prop(_S.read(_e, "g"), _S.read(_e, "j")), _S.read(_e, "i")), ".")), func(): return _S.binary("!==", _S.prop(_S.prop(_S.read(_e, "g"), _S.read(_e, "j")), _S.read(_e, "i")), "o"))

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "join", [""])

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "rng", _S.arg(_args, 0))
	_S.set_prop(_S.read(_e, "this"), "R", _S.read(_e, "rng"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	_S.set_prop(_S.read(_e, "this"), "t", 0, "=", false)
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"vx": 0}, {"vy": 0}, {"drag": 2.5}, {"rise": 12}, {"grow": 2}, {"curl": 0}, {"a": 0.6}, {"b": 0.85}, {"warm": 0}, {"delay": 0}, {"age": 0}, {"seed": _S.binary("*", _S.invoke(_S.prop(_S.read(_e, "this"), "R"), "next", []), 100)}, _S.read(_e, "q")])])
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.prop(_S.prop(_S.read(_e, "this"), "list"), "length")

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.set_prop(_S.read(_e, "this"), "t", _S.read(_e, "dt"), "+=", false)
	var _v35 = _S.scope(_e)
	_S.define(_v35, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v35, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v35, "i"), 0)):
		var _v36 = _S.scope(_v35)
		_S.define(_v36, "q", _S.prop(_S.prop(_S.read(_v36, "this"), "list"), _S.read(_v36, "i")))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v36, "q"), "delay"), 0)):
			var _v37 = _S.scope(_v36)
			_S.set_prop(_S.read(_v37, "q"), "delay", _S.read(_v37, "dt"), "-=", false)
			_v35 = _S.iteration(_v35)
			_S.write(_v35, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary(">=", _S.set_prop(_S.read(_v36, "q"), "age", _S.read(_v36, "dt"), "+=", false), _S.prop(_S.read(_v36, "q"), "life"))):
			var _v38 = _S.scope(_v36)
			_S.invoke(_S.prop(_S.read(_v38, "this"), "list"), "splice", [_S.read(_v38, "i"), 1])
			_v35 = _S.iteration(_v35)
			_S.write(_v35, "i", 1, "-=", true)
			continue
		if _S.truth(_S.prop(_S.read(_v36, "q"), "curl")):
			var _v39 = _S.scope(_v36)
			_S.define(_v39, "c", _S.invoke(_S.read(_v39, "Math"), "cos", [_S.binary("*", _S.prop(_S.read(_v39, "q"), "curl"), _S.read(_v39, "dt"))]))
			_S.define(_v39, "s", _S.invoke(_S.read(_v39, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v39, "q"), "curl"), _S.read(_v39, "dt"))]))
			_S.define(_v39, "vx", _S.prop(_S.read(_v39, "q"), "vx"))
			_S.set_prop(_S.read(_v39, "q"), "vx", _S.binary("-", _S.binary("*", _S.read(_v39, "vx"), _S.read(_v39, "c")), _S.binary("*", _S.prop(_S.read(_v39, "q"), "vy"), _S.read(_v39, "s"))), "=", false)
			_S.set_prop(_S.read(_v39, "q"), "vy", _S.binary("+", _S.binary("*", _S.read(_v39, "vx"), _S.read(_v39, "s")), _S.binary("*", _S.prop(_S.read(_v39, "q"), "vy"), _S.read(_v39, "c"))), "=", false)
		_S.set_prop(_S.read(_v36, "q"), "vy", _S.binary("*", _S.prop(_S.read(_v36, "q"), "rise"), _S.read(_v36, "dt")), "-=", false)
		_S.set_prop(_S.read(_v36, "q"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v36, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v36, "this"), "t"), 1.3), _S.prop(_S.read(_v36, "q"), "seed"))]), 8), _S.read(_v36, "dt")), "+=", false)
		_S.set_prop(_S.read(_v36, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v36, "q"), "vx"), _S.prop(_S.read(_v36, "q"), "drag")), _S.read(_v36, "dt")), "-=", false)
		_S.set_prop(_S.read(_v36, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v36, "q"), "vy"), _S.prop(_S.read(_v36, "q"), "drag")), _S.read(_v36, "dt")), "-=", false)
		_S.set_prop(_S.read(_v36, "q"), "x", _S.binary("*", _S.prop(_S.read(_v36, "q"), "vx"), _S.read(_v36, "dt")), "+=", false)
		_S.set_prop(_S.read(_v36, "q"), "y", _S.binary("*", _S.prop(_S.read(_v36, "q"), "vy"), _S.read(_v36, "dt")), "+=", false)
		_v35 = _S.iteration(_v35)
		_S.write(_v35, "i", 1, "-=", true)
	return null

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "out", [])
	for _v40 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v41 = _S.scope(_e)
		_S.define(_v41, "q", _v40)
		var _v42 = _S.scope(_v41)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v42, "q"), "delay"), 0)):
			continue
		_S.define(_v42, "k", _S.binary("/", _S.prop(_S.read(_v42, "q"), "age"), _S.prop(_S.read(_v42, "q"), "life")))
		_S.invoke(_S.read(_v42, "out"), "push", [_S.merge([{"x": _S.prop(_S.read(_v42, "q"), "x")}, {"y": _S.prop(_S.read(_v42, "q"), "y")}, {"r": _S.binary("+", _S.prop(_S.read(_v42, "q"), "r0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v42, "q"), "r1"), _S.prop(_S.read(_v42, "q"), "r0")), _S.binary("-", 1, _S.invoke(_S.read(_v42, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.prop(_S.read(_v42, "q"), "grow")), _S.prop(_S.read(_v42, "q"), "age"))]))))}, {"a": _S.binary("*", _S.binary("*", _S.prop(_S.read(_v42, "q"), "a"), _S.invoke(_S.read(_v42, "Math"), "min", [1, _S.binary("*", _S.prop(_S.read(_v42, "q"), "age"), 30)])), _S.invoke(_S.read(_v42, "Math"), "pow", [_S.binary("-", 1, _S.read(_v42, "k")), 1.3]))}, {"b": _S.binary("*", _S.prop(_S.read(_v42, "q"), "b"), _S.binary("-", 1, _S.binary("*", _S.read(_v42, "k"), 0.5)))}, {"w": _S.binary("*", _S.prop(_S.read(_v42, "q"), "warm"), _S.invoke(_S.read(_v42, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.prop(_S.read(_v42, "q"), "age")), 5)]))}])])
	return _S.read(_e, "out")

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "l", _S.arg(_args, 0))
	_S.define(_e, "u", _S.arg(_args, 1))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "u"), _S.prop(_S.read(_e, "l"), "len")))
	return _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "l"), "wid"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.read(_e, "k"))]), 0.8])), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("+", 0.45, _S.binary("*", _S.read(_e, "k"), 3))]))
