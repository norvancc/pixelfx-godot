@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "GRAVITY", _S.import_value("core/index.js", "GRAVITY"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "stoneShape", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawRock", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawSpike", _S.function_value(_e, "_f6"))
	_S.define(_e, "spikeLook", _S.function_value(_e, "_f10"))
	_S.define(_e, "spikeCrack", _S.function_value(_e, "_f11"))
	_S.define(_e, "floorCrack", _S.function_value(_e, "_f12"))
	_S.define(_e, "drawLeaf", _S.function_value(_e, "_f13"))
	_S.define(_e, "gasPuff", _S.function_value(_e, "_f15"))
	_S.define(_e, "bubble", _S.function_value(_e, "_f16"))
	_exports["stoneShape"] = _S.read(_e, "stoneShape")
	_S.define(_e, "LX", _S.unary("-", 0.6))
	_S.define(_e, "LY", _S.unary("-", 0.8))
	_S.define(_e, "inPoly", _S.function_value(_e, "_f17"))
	_S.define(_e, "MASK", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", 64, 64)]))
	_S.define(_e, "FACE", _S.construct(_S.read(_e, "Int8Array"), [_S.binary("*", 64, 64)]))
	_S.define(_e, "ROWS", 400)
	_S.define(_e, "RL", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "ROWS")]))
	_S.define(_e, "RR", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "ROWS")]))
	_S.define(_e, "RU", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "ROWS")]))
	_exports["drawRock"] = _S.read(_e, "drawRock")
	_exports["drawSpike"] = _S.read(_e, "drawSpike")
	_exports["spikeLook"] = _S.read(_e, "spikeLook")
	_exports["spikeCrack"] = _S.read(_e, "spikeCrack")
	_exports["floorCrack"] = _S.read(_e, "floorCrack")
	_exports["drawLeaf"] = _S.read(_e, "drawLeaf")
	_S.define(_e, "Drops", _S.class_value("Drops", _S.function_value(_e, "_f18"), {"add": _S.function_value(_e, "_f20"), "update": _S.function_value(_e, "_f21"), "draw": _S.function_value(_e, "_f22")}, {}, {}, null))
	_exports["Drops"] = _S.read(_e, "Drops")
	_exports["gasPuff"] = _S.read(_e, "gasPuff")
	_exports["bubble"] = _S.read(_e, "bubble")
	_S.define(_e, "Gas", _S.class_value("Gas", _S.function_value(_e, "_f23"), {"add": _S.function_value(_e, "_f24"), "prune": _S.function_value(_e, "_f25"), "at": _S.function_value(_e, "_f26"), "draw": _S.function_value(_e, "_f27")}, {}, {}, null))
	_exports["Gas"] = _S.read(_e, "Gas")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "n", _S.coalesce(_S.arg(_args, 1), func(): return _S.invoke(_S.read(_e, "R"), "int", [5, 7])))
	_S.define(_e, "pts", [])
	_S.define(_e, "a0", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "squash", _S.invoke(_S.read(_e, "R"), "range", [0.7, 1]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.read(_v0, "n"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.binary("+", _S.read(_v1, "a0"), _S.binary("/", _S.binary("*", _S.binary("+", _S.read(_v1, "i"), _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 0.28), 0.28])), _S.read(_v1, "TAU")), _S.read(_v1, "n"))))
		_S.define(_v1, "r", _S.invoke(_S.read(_v1, "R"), "range", [0.72, 1.12]))
		_S.invoke(_S.read(_v1, "pts"), "push", [[_S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "r")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "r")), _S.read(_v1, "squash"))]])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return _S.read(_e, "pts")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "s", _S.arg(_args, 3))
	_S.define(_e, "a", _S.arg(_args, 4))
	_S.define(_e, "pts", _S.arg(_args, 5))
	_S.define(_e, "S", _S.arg(_args, 6))
	_S.define(_e, "alpha", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	_S.define(_e, "white", _S.coalesce(_S.arg(_args, 8), func(): return false))
	_S.define(_e, "n", _S.prop(_S.read(_e, "S"), "length"))
	_S.define(_e, "top", _S.binary("-", _S.read(_e, "n"), 2))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	if _S.truth(_S.binary("<", _S.read(_e, "s"), 1.4)):
		var _v2 = _S.scope(_e)
		_S.invoke(_S.read(_v2, "p"), "dot", [_S.read(_v2, "x"), _S.read(_v2, "y"), _S.prop(_S.read(_v2, "S"), _S.binary("-", _S.read(_v2, "top"), 1)), _S.read(_v2, "alpha")])
		_S.invoke(_S.read(_v2, "p"), "dot", [_S.binary("+", _S.read(_v2, "x"), 1), _S.read(_v2, "y"), _S.prop(_S.read(_v2, "S"), _S.binary("-", _S.read(_v2, "top"), 3)), _S.read(_v2, "alpha")])
		return null
	_S.define(_e, "V", _S.invoke(_S.read(_e, "pts"), "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "ang", _S.invoke(_S.read(_e, "V"), "map", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "lit", _S.invoke(_S.read(_e, "V"), "map", [_S.function_value(_e, "_f4")]))
	_S.define(_e, "X0", _S.binary("-", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.read(_e, "s"), 1.25)])), 1))
	_S.define(_e, "Y0", _S.binary("-", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.read(_e, "s"), 1.25)])), 1))
	_S.define(_e, "N", _S.invoke(_S.read(_e, "Math"), "min", [62, _S.binary("+", _S.binary("*", 2, _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.read(_e, "s"), 1.25)])), 3)]))
	var _v7 = _S.scope(_e)
	_S.define(_v7, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "j"), _S.read(_v7, "N"))):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), _S.read(_v8, "N"))):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "dx", _S.binary("-", _S.binary("+", _S.binary("+", _S.read(_v9, "X0"), _S.read(_v9, "i")), 0.5), _S.read(_v9, "x")))
			_S.define(_v9, "dy", _S.binary("-", _S.binary("+", _S.binary("+", _S.read(_v9, "Y0"), _S.read(_v9, "j")), 0.5), _S.read(_v9, "y")))
			_S.define(_v9, "k", _S.binary("+", _S.binary("*", _S.read(_v9, "j"), 64), _S.read(_v9, "i")))
			_S.set_prop(_S.read(_v9, "MASK"), _S.read(_v9, "k"), (1 if _S.truth(_S.call_value(_S.read(_v9, "inPoly"), [_S.read(_v9, "V"), _S.read(_v9, "dx"), _S.read(_v9, "dy")])) else 0), "=", false)
			if _S.truth(_S.unary("!", _S.prop(_S.read(_v9, "MASK"), _S.read(_v9, "k")))):
				_v8 = _S.iteration(_v8)
				_S.write(_v8, "i", 1, "+=", true)
				continue
			_S.define(_v9, "g", _S.invoke(_S.read(_v9, "Math"), "atan2", [_S.read(_v9, "dy"), _S.read(_v9, "dx")]))
			_S.define(_v9, "f", 0)
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "q", 0)
			while _S.truth(_S.binary("<", _S.read(_v10, "q"), _S.prop(_S.read(_v10, "ang"), "length"))):
				var _v11 = _S.scope(_v10)
				_S.define(_v11, "a0", _S.prop(_S.read(_v11, "ang"), _S.read(_v11, "q")))
				_S.define(_v11, "a1", _S.prop(_S.read(_v11, "ang"), _S.binary("%", _S.binary("+", _S.read(_v11, "q"), 1), _S.prop(_S.read(_v11, "ang"), "length"))))
				_S.define(_v11, "d", _S.binary("%", _S.binary("-", _S.read(_v11, "g"), _S.read(_v11, "a0")), _S.read(_v11, "TAU")))
				_S.define(_v11, "span", _S.binary("%", _S.binary("-", _S.read(_v11, "a1"), _S.read(_v11, "a0")), _S.read(_v11, "TAU")))
				if _S.truth(_S.binary("<", _S.read(_v11, "d"), 0)):
					_S.write(_v11, "d", _S.read(_v11, "TAU"), "+=", false)
				if _S.truth(_S.binary("<", _S.read(_v11, "span"), 0)):
					_S.write(_v11, "span", _S.read(_v11, "TAU"), "+=", false)
				if _S.truth(_S.binary("<=", _S.read(_v11, "d"), _S.read(_v11, "span"))):
					var _v12 = _S.scope(_v11)
					_S.write(_v12, "f", _S.read(_v12, "q"), "=", false)
					break
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "q", 1, "+=", true)
			_S.set_prop(_S.read(_v9, "FACE"), _S.read(_v9, "k"), _S.read(_v9, "f"), "=", false)
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "j", 1, "+=", true)
	_S.define(_e, "at", _S.function_value(_e, "_f5"))
	var _v13 = _S.scope(_e)
	_S.define(_v13, "j", _S.unary("-", 1))
	while _S.truth(_S.binary("<=", _S.read(_v13, "j"), _S.read(_v13, "N"))):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "i", _S.unary("-", 1))
		while _S.truth(_S.binary("<=", _S.read(_v14, "i"), _S.read(_v14, "N"))):
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "X", _S.binary("+", _S.read(_v15, "X0"), _S.read(_v15, "i")))
			_S.define(_v15, "Y", _S.binary("+", _S.read(_v15, "Y0"), _S.read(_v15, "j")))
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v15, "at"), [_S.read(_v15, "i"), _S.read(_v15, "j")]))):
				var _v16 = _S.scope(_v15)
				if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v16, "at"), [_S.binary("-", _S.read(_v16, "i"), 1), _S.read(_v16, "j")]), func(): return _S.call_value(_S.read(_v16, "at"), [_S.binary("+", _S.read(_v16, "i"), 1), _S.read(_v16, "j")])), func(): return _S.call_value(_S.read(_v16, "at"), [_S.read(_v16, "i"), _S.binary("-", _S.read(_v16, "j"), 1)])), func(): return _S.call_value(_S.read(_v16, "at"), [_S.read(_v16, "i"), _S.binary("+", _S.read(_v16, "j"), 1)]))):
					_S.invoke(_S.read(_v16, "p"), "dot", [_S.read(_v16, "X"), _S.read(_v16, "Y"), _S.prop(_S.read(_v16, "S"), 0), _S.read(_v16, "alpha")])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "i", 1, "+=", true)
				continue
			if _S.truth(_S.read(_v15, "white")):
				var _v17 = _S.scope(_v15)
				_S.invoke(_S.read(_v17, "p"), "dot", [_S.read(_v17, "X"), _S.read(_v17, "Y"), _S.read(_v17, "WHITE"), _S.read(_v17, "alpha")])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "i", 1, "+=", true)
				continue
			_S.define(_v15, "L", _S.prop(_S.read(_v15, "lit"), _S.prop(_S.read(_v15, "FACE"), _S.binary("+", _S.binary("*", _S.read(_v15, "j"), 64), _S.read(_v15, "i")))))
			_S.define(_v15, "edge", _S.logical("||", _S.logical("||", _S.logical("||", _S.unary("!", _S.call_value(_S.read(_v15, "at"), [_S.binary("-", _S.read(_v15, "i"), 1), _S.read(_v15, "j")])), func(): return _S.unary("!", _S.call_value(_S.read(_v15, "at"), [_S.binary("+", _S.read(_v15, "i"), 1), _S.read(_v15, "j")]))), func(): return _S.unary("!", _S.call_value(_S.read(_v15, "at"), [_S.read(_v15, "i"), _S.binary("-", _S.read(_v15, "j"), 1)]))), func(): return _S.unary("!", _S.call_value(_S.read(_v15, "at"), [_S.read(_v15, "i"), _S.binary("+", _S.read(_v15, "j"), 1)]))))
			_S.define(_v15, "c", (_S.prop(_S.read(_v15, "S"), _S.read(_v15, "top")) if _S.truth(_S.binary(">", _S.read(_v15, "L"), 0.55)) else (_S.prop(_S.read(_v15, "S"), _S.binary("-", _S.read(_v15, "top"), 1)) if _S.truth(_S.binary(">", _S.read(_v15, "L"), 0.15)) else (_S.prop(_S.read(_v15, "S"), _S.binary("-", _S.read(_v15, "top"), 2)) if _S.truth(_S.binary(">", _S.read(_v15, "L"), _S.unary("-", 0.3))) else _S.prop(_S.read(_v15, "S"), _S.binary("-", _S.read(_v15, "top"), 3))))))
			if _S.truth(_S.read(_v15, "edge")):
				_S.write(_v15, "c", (_S.prop(_S.read(_v15, "S"), _S.binary("+", _S.read(_v15, "top"), 1)) if _S.truth(_S.binary(">", _S.read(_v15, "L"), 0.3)) else (_S.prop(_S.read(_v15, "S"), _S.invoke(_S.read(_v15, "Math"), "max", [1, _S.binary("-", _S.read(_v15, "top"), 4)])) if _S.truth(_S.binary("<", _S.read(_v15, "L"), _S.unary("-", 0.2))) else _S.read(_v15, "c"))), "=", false)
			_S.invoke(_S.read(_v15, "p"), "dot", [_S.read(_v15, "X"), _S.read(_v15, "Y"), _S.read(_v15, "c"), _S.read(_v15, "alpha")])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "i", 1, "+=", true)
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "j", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v3 = _S.arg(_args, 0)
	_S.define(_e, "u", _S.prop(_v3, 0))
	_S.define(_e, "v", _S.prop(_v3, 1))
	return [_S.binary("*", _S.binary("-", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "v"), _S.read(_e, "sa"))), _S.read(_e, "s")), _S.binary("*", _S.binary("+", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "v"), _S.read(_e, "ca"))), _S.read(_e, "s"))]

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v4 = _S.arg(_args, 0)
	_S.define(_e, "vx", _S.prop(_v4, 0))
	_S.define(_e, "vy", _S.prop(_v4, 1))
	return _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "vy"), _S.read(_e, "vx")])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v5 = _S.arg(_args, 0)
	_S.define(_e, "ax", _S.prop(_v5, 0))
	_S.define(_e, "ay", _S.prop(_v5, 1))
	_S.define(_e, "i", _S.arg(_args, 1))
	var _v6 = _S.prop(_S.read(_e, "V"), _S.binary("%", _S.binary("+", _S.read(_e, "i"), 1), _S.prop(_S.read(_e, "V"), "length")))
	_S.define(_e, "bx", _S.prop(_v6, 0))
	_S.define(_e, "by", _S.prop(_v6, 1))
	_S.define(_e, "ex", _S.binary("-", _S.read(_e, "bx"), _S.read(_e, "ax")))
	_S.define(_e, "ey", _S.binary("-", _S.read(_e, "by"), _S.read(_e, "ay")))
	_S.define(_e, "l", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "ex"), _S.read(_e, "ey")]), func(): return 1))
	_S.define(_e, "nx", _S.binary("/", _S.read(_e, "ey"), _S.read(_e, "l")))
	_S.define(_e, "ny", _S.binary("/", _S.unary("-", _S.read(_e, "ex")), _S.read(_e, "l")))
	if _S.truth(_S.binary("<", _S.binary("+", _S.binary("*", _S.read(_e, "nx"), _S.binary("+", _S.read(_e, "ax"), _S.read(_e, "bx"))), _S.binary("*", _S.read(_e, "ny"), _S.binary("+", _S.read(_e, "ay"), _S.read(_e, "by")))), 0)):
		_S.last([_S.write(_e, "nx", _S.unary("-", _S.read(_e, "nx")), "=", false), _S.write(_e, "ny", _S.unary("-", _S.read(_e, "ny")), "=", false)])
	return _S.binary("+", _S.binary("*", _S.read(_e, "nx"), _S.read(_e, "LX")), _S.binary("*", _S.read(_e, "ny"), _S.read(_e, "LY")))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "i"), 0), func(): return _S.binary(">=", _S.read(_e, "j"), 0)), func(): return _S.binary("<", _S.read(_e, "i"), _S.read(_e, "N"))), func(): return _S.binary("<", _S.read(_e, "j"), _S.read(_e, "N"))), func(): return _S.binary("===", _S.prop(_S.read(_e, "MASK"), _S.binary("+", _S.binary("*", _S.read(_e, "j"), 64), _S.read(_e, "i"))), 1))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "base", _S.arg(_args, 2))
	_S.define(_e, "h", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "lean", _S.arg(_args, 5))
	_S.define(_e, "sp", _S.arg(_args, 6))
	_S.define(_e, "S", _S.arg(_args, 7))
	_S.define(_e, "opts", _S.coalesce(_S.arg(_args, 8), func(): return _S.merge([])))
	if _S.truth(_S.binary("<", _S.read(_e, "h"), 1.5)):
		return null
	_S.define(_e, "a", _S.logical("??", _S.prop(_S.read(_e, "opts"), "a"), func(): return 1))
	_S.define(_e, "white", _S.prop(_S.read(_e, "opts"), "white"))
	_S.define(_e, "glint", _S.logical("??", _S.prop(_S.read(_e, "opts"), "glint"), func(): return _S.unary("-", 1)))
	_S.define(_e, "clip", _S.logical("??", _S.prop(_S.read(_e, "opts"), "clip"), func(): return 1))
	_S.define(_e, "floorY", _S.logical("??", _S.prop(_S.read(_e, "opts"), "floor"), func(): return INF))
	_S.define(_e, "hw", _S.function_value(_e, "_f7"))
	_S.define(_e, "half", _S.logical("??", _S.prop(_S.read(_e, "opts"), "half"), func(): return 0))
	_S.define(_e, "Y0", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "base"), _S.read(_e, "h"))]), 2))
	_S.define(_e, "NR", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "ROWS"), _S.binary("+", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.read(_e, "base")]), _S.read(_e, "Y0")), 2)]))
	var _v20 = _S.scope(_e)
	_S.define(_v20, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v20, "k"), _S.read(_v20, "NR"))):
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "u", _S.binary("/", _S.binary("-", _S.read(_v21, "base"), _S.binary("+", _S.binary("+", _S.read(_v21, "Y0"), _S.read(_v21, "k")), 0.5)), _S.read(_v21, "h")))
		_S.set_prop(_S.read(_v21, "RU"), _S.read(_v21, "k"), _S.read(_v21, "u"), "=", false)
		if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v21, "u"), 0), func(): return _S.binary(">", _S.read(_v21, "u"), 1)), func(): return _S.binary(">", _S.binary("+", _S.binary("+", _S.read(_v21, "Y0"), _S.read(_v21, "k")), 0.5), _S.read(_v21, "floorY")))):
			_S.last([_S.set_prop(_S.read(_v21, "RL"), _S.read(_v21, "k"), INF, "=", false), _S.set_prop(_S.read(_v21, "RR"), _S.read(_v21, "k"), _S.unary("-", INF), "=", false)])
		else:
			_S.last([_S.set_prop(_S.read(_v21, "RL"), _S.read(_v21, "k"), _S.binary("-", _S.binary("+", _S.read(_v21, "x"), _S.binary("*", _S.read(_v21, "lean"), _S.read(_v21, "u"))), _S.call_value(_S.read(_v21, "hw"), [_S.read(_v21, "u"), _S.unary("-", 1)])), "=", false), _S.set_prop(_S.read(_v21, "RR"), _S.read(_v21, "k"), _S.binary("+", _S.binary("+", _S.read(_v21, "x"), _S.binary("*", _S.read(_v21, "lean"), _S.read(_v21, "u"))), _S.call_value(_S.read(_v21, "hw"), [_S.read(_v21, "u"), 1])), "=", false)])
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "k", 1, "+=", true)
	_S.define(_e, "inside", _S.function_value(_e, "_f8"))
	_S.define(_e, "X0", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.binary("-", _S.read(_e, "x"), _S.binary("/", _S.read(_e, "w"), 2)), _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "lean")])), 2)]))
	_S.define(_e, "X1", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.binary("/", _S.read(_e, "w"), 2)), _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "lean")])), 2)]))
	var _v22 = _S.scope(_e)
	_S.define(_v22, "py", _S.binary("-", _S.invoke(_S.read(_v22, "Math"), "floor", [_S.binary("-", _S.read(_v22, "base"), _S.read(_v22, "h"))]), 1))
	while _S.truth(_S.binary("<", _S.read(_v22, "py"), _S.invoke(_S.read(_v22, "Math"), "ceil", [_S.read(_v22, "base")]))):
		var _v23 = _S.scope(_v22)
		_S.define(_v23, "px", _S.read(_v23, "X0"))
		while _S.truth(_S.binary("<=", _S.read(_v23, "px"), _S.read(_v23, "X1"))):
			var _v24 = _S.scope(_v23)
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v24, "inside"), [_S.read(_v24, "px"), _S.read(_v24, "py")]))):
				var _v25 = _S.scope(_v24)
				if _S.truth(_S.logical("&&", _S.binary("<=", _S.binary("+", _S.read(_v25, "py"), 0.5), _S.read(_v25, "floorY")), func(): return _S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v25, "inside"), [_S.binary("-", _S.read(_v25, "px"), 1), _S.read(_v25, "py")]), func(): return _S.call_value(_S.read(_v25, "inside"), [_S.binary("+", _S.read(_v25, "px"), 1), _S.read(_v25, "py")])), func(): return _S.call_value(_S.read(_v25, "inside"), [_S.read(_v25, "px"), _S.binary("+", _S.read(_v25, "py"), 1)])), func(): return _S.logical("&&", _S.call_value(_S.read(_v25, "inside"), [_S.read(_v25, "px"), _S.binary("-", _S.read(_v25, "py"), 1)]), func(): return _S.binary("<", _S.read(_v25, "py"), _S.binary("-", _S.read(_v25, "base"), 1)))))):
					_S.invoke(_S.read(_v25, "p"), "dot", [_S.read(_v25, "px"), _S.read(_v25, "py"), _S.prop(_S.read(_v25, "S"), 0), _S.read(_v25, "a")])
				_v23 = _S.iteration(_v23)
				_S.write(_v23, "px", 1, "+=", true)
				continue
			if _S.truth(_S.read(_v24, "white")):
				var _v26 = _S.scope(_v24)
				_S.invoke(_S.read(_v26, "p"), "dot", [_S.read(_v26, "px"), _S.read(_v26, "py"), _S.read(_v26, "WHITE"), _S.read(_v26, "a")])
				_v23 = _S.iteration(_v23)
				_S.write(_v23, "px", 1, "+=", true)
				continue
			_S.define(_v24, "k0", _S.binary("-", _S.read(_v24, "py"), _S.read(_v24, "Y0")))
			_S.define(_v24, "u", _S.prop(_S.read(_v24, "RU"), _S.read(_v24, "k0")))
			_S.define(_v24, "c", _S.binary("+", _S.read(_v24, "x"), _S.binary("*", _S.read(_v24, "lean"), _S.read(_v24, "u"))))
			_S.define(_v24, "l", _S.prop(_S.read(_v24, "RL"), _S.read(_v24, "k0")))
			_S.define(_v24, "r", _S.prop(_S.read(_v24, "RR"), _S.read(_v24, "k0")))
			_S.define(_v24, "fx", _S.binary("+", _S.read(_v24, "px"), 0.5))
			_S.define(_v24, "band", 0)
			_S.define(_v24, "st", false)
			for _v27 in _S.array(_S.prop(_S.read(_v24, "sp"), "strata")):
				var _v28 = _S.scope(_v24)
				_S.define(_v28, "s", _v27)
				var _v29 = _S.scope(_v28)
				_S.define(_v29, "d", _S.binary("-", _S.binary("-", _S.binary("*", _S.read(_v29, "u"), _S.read(_v29, "h")), _S.binary("*", _S.read(_v29, "s"), _S.read(_v29, "h"))), _S.binary("*", _S.prop(_S.read(_v29, "sp"), "slope"), _S.binary("-", _S.read(_v29, "fx"), _S.read(_v29, "c")))))
				if _S.truth(_S.binary(">", _S.read(_v29, "d"), 0)):
					_S.write(_v29, "band", 1, "+=", true)
				if _S.truth(_S.binary("<", _S.invoke(_S.read(_v29, "Math"), "abs", [_S.read(_v29, "d")]), 0.5)):
					_S.write(_v29, "st", true, "=", false)
			_S.define(_v24, "jog", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v24, "rand"), [_S.read(_v24, "band"), _S.prop(_S.read(_v24, "sp"), "seed")]), 0.5), 0.3))
			_S.define(_v24, "q", _S.binary("-", _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v24, "fx"), _S.read(_v24, "l")), _S.invoke(_S.read(_v24, "Math"), "max", [0.5, _S.binary("-", _S.read(_v24, "r"), _S.read(_v24, "l"))])), 2), 1))
			_S.define(_v24, "qr", _S.binary("+", _S.unary("-", 0.18), _S.read(_v24, "jog")))
			_S.define(_v24, "i", null)
			if _S.truth(_S.binary(">", _S.read(_v24, "u"), 0.93)):
				_S.write(_v24, "i", (7 if _S.truth(_S.binary("<", _S.read(_v24, "q"), _S.binary("+", _S.read(_v24, "qr"), 0.3))) else 5), "=", false)
			else:
				if _S.truth(_S.binary("<", _S.invoke(_S.read(_v24, "Math"), "abs", [_S.binary("-", _S.read(_v24, "q"), _S.read(_v24, "qr"))]), _S.invoke(_S.read(_v24, "Math"), "max", [0.09, _S.binary("/", 0.55, _S.invoke(_S.read(_v24, "Math"), "max", [1, _S.binary("-", _S.read(_v24, "r"), _S.read(_v24, "l"))]))]))):
					_S.write(_v24, "i", 7, "=", false)
				else:
					if _S.truth(_S.binary("<", _S.read(_v24, "q"), _S.read(_v24, "qr"))):
						_S.write(_v24, "i", (7 if _S.truth(_S.binary("<", _S.binary("-", _S.read(_v24, "fx"), _S.read(_v24, "l")), 1)) else (6 if _S.truth(_S.binary("<", _S.read(_v24, "q"), _S.binary("+", _S.unary("-", 0.5), _S.read(_v24, "jog")))) else 5)), "=", false)
					else:
						_S.write(_v24, "i", (3 if _S.truth(_S.binary("<", _S.binary("-", _S.read(_v24, "r"), _S.read(_v24, "fx")), 1)) else (4 if _S.truth(_S.binary("<", _S.read(_v24, "q"), _S.binary("+", 0.38, _S.read(_v24, "jog")))) else 2)), "=", false)
			if _S.truth(_S.logical("&&", _S.read(_v24, "st"), func(): return _S.binary("<", _S.read(_v24, "i"), 7))):
				_S.write(_v24, "i", 1, "-=", false)
			_S.define(_v24, "fleck", _S.call_value(_S.read(_v24, "rand"), [_S.binary("+", _S.binary("*", _S.read(_v24, "px"), 7), 3), _S.binary("+", _S.binary("*", _S.read(_v24, "py"), 13), 5)]))
			if _S.truth(_S.binary("<", _S.read(_v24, "fleck"), 0.035)):
				_S.write(_v24, "i", (7 if _S.truth(_S.binary("<", _S.read(_v24, "q"), _S.read(_v24, "qr"))) else _S.binary("-", _S.read(_v24, "i"), 1)), "=", false)
			else:
				if _S.truth(_S.binary(">", _S.read(_v24, "fleck"), 0.965)):
					_S.write(_v24, "i", 1, "-=", false)
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v24, "glint"), 0), func(): return _S.binary("<", _S.read(_v24, "q"), _S.binary("+", _S.read(_v24, "qr"), 0.1)))):
				var _v30 = _S.scope(_v24)
				_S.define(_v30, "g", _S.invoke(_S.read(_v30, "Math"), "abs", [_S.binary("-", _S.read(_v30, "u"), _S.read(_v30, "glint"))]))
				if _S.truth(_S.binary("<", _S.read(_v30, "g"), 0.035)):
					_S.write(_v30, "i", 8, "=", false)
				else:
					if _S.truth(_S.binary("<", _S.read(_v30, "g"), 0.07)):
						_S.write(_v30, "i", _S.invoke(_S.read(_v30, "Math"), "max", [_S.read(_v30, "i"), 7]), "=", false)
			_S.invoke(_S.read(_v24, "p"), "dot", [_S.read(_v24, "px"), _S.read(_v24, "py"), (_S.read(_v24, "WHITE") if _S.truth(_S.binary(">=", _S.read(_v24, "i"), 8)) else _S.prop(_S.read(_v24, "S"), _S.call_value(_S.read(_v24, "clamp"), [_S.read(_v24, "i"), 0, _S.binary("-", _S.prop(_S.read(_v24, "S"), "length"), 1)]))), _S.read(_v24, "a")])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "px", 1, "+=", true)
		_v22 = _S.iteration(_v22)
		_S.write(_v22, "py", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "opts"), "cracks"), func(): return _S.binary(">", _S.prop(_S.read(_e, "opts"), "crack"), 0))):
		for _v31 in _S.array(_S.prop(_S.read(_e, "opts"), "cracks")):
			var _v32 = _S.scope(_e)
			_S.define(_v32, "path", _v31)
			var _v33 = _S.scope(_v32)
			_S.define(_v33, "m", _S.invoke(_S.read(_v33, "Math"), "max", [1, _S.invoke(_S.read(_v33, "Math"), "floor", [_S.binary("*", _S.prop(_S.read(_v33, "path"), "length"), _S.prop(_S.read(_v33, "opts"), "crack"))])]))
			var _v34 = _S.scope(_v33)
			_S.define(_v34, "k", 1)
			while _S.truth(_S.binary("<", _S.read(_v34, "k"), _S.read(_v34, "m"))):
				var _v35 = _S.scope(_v34)
				var _v36 = _S.prop(_S.read(_v35, "path"), _S.binary("-", _S.read(_v35, "k"), 1))
				_S.define(_v35, "u0", _S.prop(_v36, 0))
				_S.define(_v35, "v0", _S.prop(_v36, 1))
				var _v37 = _S.prop(_S.read(_v35, "path"), _S.read(_v35, "k"))
				_S.define(_v35, "u1", _S.prop(_v37, 0))
				_S.define(_v35, "v1", _S.prop(_v37, 1))
				_S.define(_v35, "P", _S.function_value(_v35, "_f9"))
				var _v39 = _S.call_value(_S.read(_v35, "P"), [[_S.read(_v35, "u0"), _S.read(_v35, "v0")]])
				_S.define(_v35, "ax", _S.prop(_v39, 0))
				_S.define(_v35, "ay", _S.prop(_v39, 1))
				var _v40 = _S.call_value(_S.read(_v35, "P"), [[_S.read(_v35, "u1"), _S.read(_v35, "v1")]])
				_S.define(_v35, "bx", _S.prop(_v40, 0))
				_S.define(_v35, "by", _S.prop(_v40, 1))
				if _S.truth(_S.binary(">", _S.read(_v35, "u1"), _S.read(_v35, "clip"))):
					break
				if _S.truth(_S.logical("||", _S.unary("!", _S.call_value(_S.read(_v35, "inside"), [_S.invoke(_S.read(_v35, "Math"), "floor", [_S.read(_v35, "ax")]), _S.invoke(_S.read(_v35, "Math"), "floor", [_S.read(_v35, "ay")])])), func(): return _S.unary("!", _S.call_value(_S.read(_v35, "inside"), [_S.invoke(_S.read(_v35, "Math"), "floor", [_S.read(_v35, "bx")]), _S.invoke(_S.read(_v35, "Math"), "floor", [_S.read(_v35, "by")])])))):
					_v34 = _S.iteration(_v34)
					_S.write(_v34, "k", 1, "+=", true)
					continue
				_S.define(_v35, "hot", _S.logical("??", _S.prop(_S.read(_v35, "opts"), "heat"), func(): return 0))
				_S.define(_v35, "Gl", _S.prop(_S.read(_v35, "opts"), "glowRamp"))
				if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v35, "hot"), 0.05), func(): return _S.read(_v35, "Gl"))):
					var _v41 = _S.scope(_v35)
					_S.invoke(_S.read(_v41, "p"), "line", [_S.binary("+", _S.read(_v41, "ax"), 1), _S.read(_v41, "ay"), _S.binary("+", _S.read(_v41, "bx"), 1), _S.read(_v41, "by"), _S.prop(_S.read(_v41, "S"), 0), _S.read(_v41, "a")])
					_S.invoke(_S.read(_v41, "p"), "line", [_S.read(_v41, "ax"), _S.read(_v41, "ay"), _S.read(_v41, "bx"), _S.read(_v41, "by"), (_S.prop(_S.read(_v41, "Gl"), 4) if _S.truth(_S.binary(">", _S.read(_v41, "hot"), 0.7)) else (_S.prop(_S.read(_v41, "Gl"), 3) if _S.truth(_S.binary(">", _S.read(_v41, "hot"), 0.4)) else (_S.prop(_S.read(_v41, "Gl"), 2) if _S.truth(_S.binary(">", _S.read(_v41, "hot"), 0.2)) else _S.prop(_S.read(_v41, "Gl"), 1)))), _S.read(_v41, "a")])
					if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v41, "k"), 2), 0)):
						_S.invoke(_S.read(_v41, "p"), "glow", [_S.read(_v41, "bx"), _S.read(_v41, "by"), 7, _S.prop(_S.read(_v41, "Gl"), 2), _S.binary("*", 0.35, _S.read(_v41, "hot"))])
				else:
					var _v42 = _S.scope(_v35)
					_S.invoke(_S.read(_v42, "p"), "line", [_S.read(_v42, "ax"), _S.read(_v42, "ay"), _S.read(_v42, "bx"), _S.read(_v42, "by"), _S.prop(_S.read(_v42, "S"), 0), _S.read(_v42, "a")])
					_S.invoke(_S.read(_v42, "p"), "dot", [_S.binary("+", _S.read(_v42, "bx"), 1), _S.binary("-", _S.read(_v42, "by"), 1), _S.prop(_S.read(_v42, "S"), 6), _S.binary("*", _S.read(_v42, "a"), 0.7)])
				_v34 = _S.iteration(_v34)
				_S.write(_v34, "k", 1, "+=", true)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "side", _S.arg(_args, 1))
	_S.define(_e, "v", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "w"), 2), _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.read(_e, "u"))]), 0.85])), 0.3))
	for _v18 in _S.array(_S.prop(_S.read(_e, "sp"), "notches")):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "n", _v18)
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("===", _S.prop(_S.read(_v19, "n"), "side"), _S.read(_v19, "side")), func(): return _S.binary(">", _S.read(_v19, "u"), _S.prop(_S.read(_v19, "n"), "u"))), func(): return _S.binary("<", _S.read(_v19, "u"), _S.binary("+", _S.prop(_S.read(_v19, "n"), "u"), 0.07)))):
			_S.write(_v19, "v", _S.binary("*", _S.prop(_S.read(_v19, "n"), "d"), _S.binary("-", 1, _S.binary("*", _S.read(_v19, "u"), 0.5))), "-=", false)
	return _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "v")])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "k", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "Y0")))
	_S.define(_e, "fx", _S.binary("+", _S.read(_e, "px"), 0.5))
	if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "k"), 0), func(): return _S.binary(">=", _S.read(_e, "k"), _S.read(_e, "NR"))), func(): return _S.binary("<", _S.read(_e, "fx"), _S.prop(_S.read(_e, "RL"), _S.read(_e, "k")))), func(): return _S.binary(">", _S.read(_e, "fx"), _S.prop(_S.read(_e, "RR"), _S.read(_e, "k"))))):
		return false
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "clip"), 1), func(): return _S.binary(">", _S.prop(_S.read(_e, "RU"), _S.read(_e, "k")), _S.binary("+", _S.read(_e, "clip"), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "px"), 77]), 0.5), 0.07))))):
		return false
	if _S.truth(_S.unary("!", _S.read(_e, "half"))):
		return true
	_S.define(_e, "q", _S.binary("-", _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_e, "fx"), _S.prop(_S.read(_e, "RL"), _S.read(_e, "k"))), _S.invoke(_S.read(_e, "Math"), "max", [0.5, _S.binary("-", _S.prop(_S.read(_e, "RR"), _S.read(_e, "k")), _S.prop(_S.read(_e, "RL"), _S.read(_e, "k")))])), 2), 1))
	return (_S.binary("<", _S.read(_e, "q"), _S.unary("-", 0.18)) if _S.truth(_S.binary("<", _S.read(_e, "half"), 0)) else _S.binary(">=", _S.read(_e, "q"), _S.unary("-", 0.18)))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v38 = _S.arg(_args, 0)
	_S.define(_e, "u", _S.prop(_v38, 0))
	_S.define(_e, "v", _S.prop(_v38, 1))
	return [_S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "lean"), _S.read(_e, "u"))), _S.binary("*", _S.read(_e, "v"), _S.call_value(_S.read(_e, "hw"), [_S.read(_e, "u"), (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0)) else 1)]))), _S.binary("-", _S.read(_e, "base"), _S.binary("*", _S.read(_e, "u"), _S.read(_e, "h")))]

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "notches", [])
	_S.define(_e, "strata", [])
	var _v43 = _S.scope(_e)
	_S.define(_v43, "i", 0)
	_S.define(_v43, "n", _S.invoke(_S.read(_v43, "R"), "int", [3, 5]))
	while _S.truth(_S.binary("<", _S.read(_v43, "i"), _S.read(_v43, "n"))):
		_S.invoke(_S.read(_v43, "notches"), "push", [_S.merge([{"u": _S.invoke(_S.read(_v43, "R"), "range", [0.1, 0.8])}, {"side": _S.invoke(_S.read(_v43, "R"), "sign", [])}, {"d": _S.invoke(_S.read(_v43, "R"), "range", [0.8, 1.8])}])])
		_v43 = _S.iteration(_v43)
		_S.write(_v43, "i", 1, "+=", true)
	var _v44 = _S.scope(_e)
	_S.define(_v44, "i", 0)
	_S.define(_v44, "n", _S.invoke(_S.read(_v44, "R"), "int", [2, 4]))
	while _S.truth(_S.binary("<", _S.read(_v44, "i"), _S.read(_v44, "n"))):
		_S.invoke(_S.read(_v44, "strata"), "push", [_S.invoke(_S.read(_v44, "R"), "range", [0.12, 0.8])])
		_v44 = _S.iteration(_v44)
		_S.write(_v44, "i", 1, "+=", true)
	return _S.merge([{"notches": _S.read(_e, "notches")}, {"strata": _S.read(_e, "strata")}, {"slope": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.25), 0.25])}, {"seed": _S.invoke(_S.read(_e, "R"), "int", [1, 9999])}])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "u0", _S.arg(_args, 1))
	_S.define(_e, "v0", _S.arg(_args, 2))
	_S.define(_e, "dir", _S.arg(_args, 3))
	_S.define(_e, "pts", [[_S.read(_e, "u0"), _S.read(_e, "v0")]])
	_S.define(_e, "u", _S.read(_e, "u0"))
	_S.define(_e, "v", _S.read(_e, "v0"))
	var _v45 = _S.scope(_e)
	_S.define(_v45, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v45, "i"), 9)):
		var _v46 = _S.scope(_v45)
		_S.write(_v46, "u", _S.invoke(_S.read(_v46, "R"), "range", [0.03, 0.08]), "+=", false)
		_S.write(_v46, "v", _S.binary("+", _S.binary("*", _S.read(_v46, "dir"), _S.invoke(_S.read(_v46, "R"), "range", [0.05, 0.28])), _S.invoke(_S.read(_v46, "R"), "range", [_S.unary("-", 0.12), 0.12])), "+=", false)
		if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v46, "u"), 0.95), func(): return _S.binary(">", _S.invoke(_S.read(_v46, "Math"), "abs", [_S.read(_v46, "v")]), 1))):
			break
		_S.invoke(_S.read(_v46, "pts"), "push", [[_S.read(_v46, "u"), _S.read(_v46, "v")]])
		_v45 = _S.iteration(_v45)
		_S.write(_v45, "i", 1, "+=", true)
	return _S.read(_e, "pts")

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "side", _S.arg(_args, 1))
	_S.define(_e, "len", _S.arg(_args, 2))
	_S.define(_e, "pts", [[0, 0]])
	var _v47 = _S.scope(_e)
	_S.define(_v47, "x", 0)
	while _S.truth(_S.binary("<", _S.invoke(_S.read(_v47, "Math"), "abs", [_S.read(_v47, "x")]), _S.read(_v47, "len"))):
		var _v48 = _S.scope(_v47)
		_S.write(_v48, "x", _S.binary("*", _S.read(_v48, "side"), _S.invoke(_S.read(_v48, "R"), "range", [2, 5])), "+=", false)
		_S.invoke(_S.read(_v48, "pts"), "push", [[_S.read(_v48, "x"), _S.invoke(_S.read(_v48, "R"), "int", [0, 2])]])
	return _S.read(_e, "pts")

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "len", _S.arg(_args, 3))
	_S.define(_e, "wid", _S.arg(_args, 4))
	_S.define(_e, "ang", _S.arg(_args, 5))
	_S.define(_e, "fl", _S.arg(_args, 6))
	_S.define(_e, "pal", _S.arg(_args, 7))
	_S.define(_e, "alpha", _S.coalesce(_S.arg(_args, 8), func(): return 1))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]))
	_S.define(_e, "sq", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "fl")]))
	_S.define(_e, "w", _S.invoke(_S.read(_e, "Math"), "max", [0.55, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "sq")]), _S.read(_e, "wid"))]))
	_S.define(_e, "under", _S.binary("<", _S.read(_e, "sq"), 0))
	_S.define(_e, "R", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.binary("/", _S.read(_e, "len"), 2), 2)]))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.define(_e, "inside", _S.function_value(_e, "_f14"))
	var _v49 = _S.scope(_e)
	_S.define(_v49, "j", _S.unary("-", _S.read(_v49, "R")))
	while _S.truth(_S.binary("<=", _S.read(_v49, "j"), _S.read(_v49, "R"))):
		var _v50 = _S.scope(_v49)
		_S.define(_v50, "i", _S.unary("-", _S.read(_v50, "R")))
		while _S.truth(_S.binary("<=", _S.read(_v50, "i"), _S.read(_v50, "R"))):
			var _v51 = _S.scope(_v50)
			_S.define(_v51, "s", _S.call_value(_S.read(_v51, "inside"), [_S.read(_v51, "i"), _S.read(_v51, "j")]))
			if _S.truth(_S.unary("!", _S.read(_v51, "s"))):
				var _v52 = _S.scope(_v51)
				if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v52, "inside"), [_S.binary("-", _S.read(_v52, "i"), 1), _S.read(_v52, "j")]), func(): return _S.call_value(_S.read(_v52, "inside"), [_S.binary("+", _S.read(_v52, "i"), 1), _S.read(_v52, "j")])), func(): return _S.call_value(_S.read(_v52, "inside"), [_S.read(_v52, "i"), _S.binary("-", _S.read(_v52, "j"), 1)])), func(): return _S.call_value(_S.read(_v52, "inside"), [_S.read(_v52, "i"), _S.binary("+", _S.read(_v52, "j"), 1)]))):
					_S.invoke(_S.read(_v52, "p"), "dot", [_S.binary("+", _S.read(_v52, "X"), _S.read(_v52, "i")), _S.binary("+", _S.read(_v52, "Y"), _S.read(_v52, "j")), _S.prop(_S.read(_v52, "pal"), 0), _S.read(_v52, "alpha")])
				_v50 = _S.iteration(_v50)
				_S.write(_v50, "i", 1, "+=", true)
				continue
			_S.define(_v51, "u", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_v51, "i"), 0.5), _S.read(_v51, "ca")), _S.binary("*", _S.binary("+", _S.read(_v51, "j"), 0.5), _S.read(_v51, "sa"))), _S.binary("/", _S.read(_v51, "len"), 2)))
			_S.define(_v51, "v", _S.binary("+", _S.binary("*", _S.unary("-", _S.binary("+", _S.read(_v51, "i"), 0.5)), _S.read(_v51, "sa")), _S.binary("*", _S.binary("+", _S.read(_v51, "j"), 0.5), _S.read(_v51, "ca"))))
			_S.define(_v51, "rib", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v51, "Math"), "abs", [_S.read(_v51, "v")]), 0.5), func(): return _S.binary(">", _S.read(_v51, "u"), _S.binary("*", _S.read(_v51, "len"), 0.12))), func(): return _S.binary("<", _S.read(_v51, "u"), _S.binary("*", _S.read(_v51, "len"), 0.88))), func(): return _S.binary(">", _S.read(_v51, "w"), 1.2)))
			_S.invoke(_S.read(_v51, "p"), "dot", [_S.binary("+", _S.read(_v51, "X"), _S.read(_v51, "i")), _S.binary("+", _S.read(_v51, "Y"), _S.read(_v51, "j")), (_S.prop(_S.read(_v51, "pal"), 1) if _S.truth(_S.read(_v51, "rib")) else (_S.prop(_S.read(_v51, "pal"), 3) if _S.truth(_S.binary("!==", _S.binary("===", _S.read(_v51, "s"), 1), _S.read(_v51, "under"))) else _S.prop(_S.read(_v51, "pal"), 2))), _S.read(_v51, "alpha")])
			_v50 = _S.iteration(_v50)
			_S.write(_v50, "i", 1, "+=", true)
		_v49 = _S.iteration(_v49)
		_S.write(_v49, "j", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "dot", [_S.binary("-", _S.read(_e, "X"), _S.binary("*", _S.read(_e, "ca"), _S.binary("+", _S.binary("/", _S.read(_e, "len"), 2), 1))), _S.binary("-", _S.read(_e, "Y"), _S.binary("*", _S.read(_e, "sa"), _S.binary("+", _S.binary("/", _S.read(_e, "len"), 2), 1))), _S.prop(_S.read(_e, "pal"), 1), _S.read(_e, "alpha")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	_S.define(_e, "u", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_e, "i"), 0.5), _S.read(_e, "ca")), _S.binary("*", _S.binary("+", _S.read(_e, "j"), 0.5), _S.read(_e, "sa"))), _S.binary("/", _S.read(_e, "len"), 2)))
	_S.define(_e, "v", _S.binary("+", _S.binary("*", _S.unary("-", _S.binary("+", _S.read(_e, "i"), 0.5)), _S.read(_e, "sa")), _S.binary("*", _S.binary("+", _S.read(_e, "j"), 0.5), _S.read(_e, "ca"))))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary(">", _S.read(_e, "u"), _S.read(_e, "len")))):
		return 0
	_S.define(_e, "half", _S.binary("*", _S.read(_e, "w"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "u")), _S.read(_e, "len"))]), 0.75])))
	return ((1 if _S.truth(_S.binary("<", _S.read(_e, "v"), 0)) else 2) if _S.truth(_S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), _S.read(_e, "half"))) else 0)

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "a", _S.arg(_args, 4))
	_S.define(_e, "belly", _S.arg(_args, 5))
	_S.define(_e, "body", _S.arg(_args, 6))
	_S.define(_e, "cap", _S.arg(_args, 7))
	_S.define(_e, "hi", _S.coalesce(_S.arg(_args, 8), func(): return 0))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "a"), 0.02), func(): return _S.binary("<", _S.read(_e, "r"), 0.6))):
		return null
	_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.06)), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.28)), _S.binary("*", _S.read(_e, "r"), 0.9), _S.read(_e, "belly"), _S.binary("*", _S.read(_e, "a"), 0.55)])
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.read(_e, "body"), _S.binary("*", _S.read(_e, "a"), 0.45)])
	_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.03)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.02)), _S.binary("*", _S.read(_e, "r"), 0.76), _S.read(_e, "body"), _S.binary("*", _S.read(_e, "a"), 0.5)])
	_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.2)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.34)), _S.binary("*", _S.read(_e, "r"), 0.52), _S.read(_e, "cap"), _S.binary("*", _S.read(_e, "a"), 0.45)])
	if _S.truth(_S.read(_e, "hi")):
		_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.3)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.55)), _S.binary("*", _S.read(_e, "r"), 0.26), _S.read(_e, "hi"), _S.binary("*", _S.read(_e, "a"), 0.32)])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "c1", _S.arg(_args, 4))
	_S.define(_e, "c2", _S.arg(_args, 5))
	_S.define(_e, "fill", _S.arg(_args, 6))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	_S.define(_e, "dome", _S.coalesce(_S.arg(_args, 8), func(): return false))
	_S.define(_e, "R", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.read(_e, "r")]), 1))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	var _v53 = _S.scope(_e)
	_S.define(_v53, "j", _S.unary("-", _S.read(_v53, "R")))
	while _S.truth(_S.binary("<=", _S.read(_v53, "j"), (0 if _S.truth(_S.read(_v53, "dome")) else _S.read(_v53, "R")))):
		var _v54 = _S.scope(_v53)
		_S.define(_v54, "i", _S.unary("-", _S.read(_v54, "R")))
		while _S.truth(_S.binary("<=", _S.read(_v54, "i"), _S.read(_v54, "R"))):
			var _v55 = _S.scope(_v54)
			_S.define(_v55, "d", _S.invoke(_S.read(_v55, "Math"), "hypot", [_S.read(_v55, "i"), _S.read(_v55, "j")]))
			if _S.truth(_S.binary(">", _S.read(_v55, "d"), _S.binary("+", _S.read(_v55, "r"), 0.45))):
				_v54 = _S.iteration(_v54)
				_S.write(_v54, "i", 1, "+=", true)
				continue
			if _S.truth(_S.binary(">", _S.read(_v55, "d"), _S.binary("-", _S.read(_v55, "r"), 0.6))):
				_S.invoke(_S.read(_v55, "p"), "dot", [_S.binary("+", _S.read(_v55, "X"), _S.read(_v55, "i")), _S.binary("+", _S.read(_v55, "Y"), _S.read(_v55, "j")), (_S.read(_v55, "c1") if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v55, "i"), 0), func(): return _S.binary("<", _S.read(_v55, "j"), _S.binary("*", _S.unary("-", _S.read(_v55, "r")), 0.2)))) else _S.read(_v55, "c2")), _S.read(_v55, "a")])
			else:
				_S.invoke(_S.read(_v55, "p"), "blend", [_S.binary("+", _S.read(_v55, "X"), _S.read(_v55, "i")), _S.binary("+", _S.read(_v55, "Y"), _S.read(_v55, "j")), _S.read(_v55, "fill"), _S.binary("*", 0.3, _S.read(_v55, "a"))])
			_v54 = _S.iteration(_v54)
			_S.write(_v54, "i", 1, "+=", true)
		_v53 = _S.iteration(_v53)
		_S.write(_v53, "j", 1, "+=", true)
	if _S.truth(_S.binary(">=", _S.read(_e, "r"), 1.5)):
		_S.invoke(_S.read(_e, "p"), "dot", [_S.binary("-", _S.read(_e, "X"), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "r"), 0.45)])), _S.binary("-", _S.read(_e, "Y"), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "r"), 0.5)])), _S.read(_e, "WHITE"), _S.read(_e, "a")])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "V", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "inside", false)
	var _v56 = _S.scope(_e)
	_S.define(_v56, "i", 0)
	_S.define(_v56, "j", _S.binary("-", _S.prop(_S.read(_v56, "V"), "length"), 1))
	while _S.truth(_S.binary("<", _S.read(_v56, "i"), _S.prop(_S.read(_v56, "V"), "length"))):
		var _v57 = _S.scope(_v56)
		var _v58 = _S.prop(_S.read(_v57, "V"), _S.read(_v57, "i"))
		_S.define(_v57, "xi", _S.prop(_v58, 0))
		_S.define(_v57, "yi", _S.prop(_v58, 1))
		var _v59 = _S.prop(_S.read(_v57, "V"), _S.read(_v57, "j"))
		_S.define(_v57, "xj", _S.prop(_v59, 0))
		_S.define(_v57, "yj", _S.prop(_v59, 1))
		if _S.truth(_S.logical("&&", _S.binary("!==", _S.binary(">", _S.read(_v57, "yi"), _S.read(_v57, "y")), _S.binary(">", _S.read(_v57, "yj"), _S.read(_v57, "y"))), func(): return _S.binary("<", _S.read(_v57, "x"), _S.binary("+", _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v57, "xj"), _S.read(_v57, "xi")), _S.binary("-", _S.read(_v57, "y"), _S.read(_v57, "yi"))), _S.binary("-", _S.read(_v57, "yj"), _S.read(_v57, "yi"))), _S.read(_v57, "xi"))))):
			_S.write(_v57, "inside", _S.unary("!", _S.read(_v57, "inside")), "=", false)
		_v56 = _S.iteration(_v56)
		_S.write(_v56, "j", _S.write(_v56, "i", 1, "+=", true), "=", false)
	return _S.read(_e, "inside")

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "ground", _S.coalesce(_S.arg(_args, 0), func(): return _S.function_value(_e, "_f19")))
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	_S.set_prop(_S.read(_e, "this"), "ground", _S.read(_e, "ground"), "=", false)
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "vy", _S.arg(_args, 3))
	_S.define(_e, "s", _S.coalesce(_S.arg(_args, 4), func(): return 1))
	_S.define(_e, "delay", _S.coalesce(_S.arg(_args, 5), func(): return 0))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"vx": _S.read(_e, "vx")}, {"vy": _S.read(_e, "vy")}, {"s": _S.read(_e, "s")}, {"delay": _S.read(_e, "delay")}])])
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.define(_e, "onLand", _S.arg(_args, 1))
	var _v60 = _S.scope(_e)
	_S.define(_v60, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v60, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v60, "i"), 0)):
		var _v61 = _S.scope(_v60)
		_S.define(_v61, "d", _S.prop(_S.prop(_S.read(_v61, "this"), "list"), _S.read(_v61, "i")))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v61, "d"), "delay"), 0)):
			var _v62 = _S.scope(_v61)
			_S.set_prop(_S.read(_v62, "d"), "delay", _S.read(_v62, "dt"), "-=", false)
			_v60 = _S.iteration(_v60)
			_S.write(_v60, "i", 1, "-=", true)
			continue
		_S.define(_v61, "drag", _S.binary("/", 0.6, _S.prop(_S.read(_v61, "d"), "s")))
		_S.define(_v61, "py", _S.prop(_S.read(_v61, "d"), "y"))
		_S.set_prop(_S.read(_v61, "d"), "vy", _S.binary("*", _S.read(_v61, "GRAVITY"), _S.read(_v61, "dt")), "+=", false)
		_S.set_prop(_S.read(_v61, "d"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v61, "d"), "vx"), _S.read(_v61, "drag")), _S.read(_v61, "dt")), "-=", false)
		_S.set_prop(_S.read(_v61, "d"), "vy", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v61, "d"), "vy"), _S.read(_v61, "drag")), 0.5), _S.read(_v61, "dt")), "-=", false)
		_S.set_prop(_S.read(_v61, "d"), "x", _S.binary("*", _S.prop(_S.read(_v61, "d"), "vx"), _S.read(_v61, "dt")), "+=", false)
		_S.set_prop(_S.read(_v61, "d"), "y", _S.binary("*", _S.prop(_S.read(_v61, "d"), "vy"), _S.read(_v61, "dt")), "+=", false)
		_S.define(_v61, "g", _S.invoke(_S.read(_v61, "this"), "ground", [_S.prop(_S.read(_v61, "d"), "x")]))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v61, "d"), "vy"), 0), func(): return _S.binary("<=", _S.read(_v61, "py"), _S.read(_v61, "g"))), func(): return _S.binary(">=", _S.prop(_S.read(_v61, "d"), "y"), _S.read(_v61, "g")))):
			var _v63 = _S.scope(_v61)
			_S.optional_call(_S.read(_v63, "onLand"), [_S.read(_v63, "d"), _S.read(_v63, "g")])
			_S.invoke(_S.prop(_S.read(_v63, "this"), "list"), "splice", [_S.read(_v63, "i"), 1])
		_v60 = _S.iteration(_v60)
		_S.write(_v60, "i", 1, "-=", true)
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "n", _S.prop(_S.read(_e, "C"), "length"))
	for _v64 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v65 = _S.scope(_e)
		_S.define(_v65, "d", _v64)
		var _v66 = _S.scope(_v65)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v66, "d"), "delay"), 0)):
			continue
		_S.define(_v66, "sp", _S.logical("||", _S.invoke(_S.read(_v66, "Math"), "hypot", [_S.prop(_S.read(_v66, "d"), "vx"), _S.prop(_S.read(_v66, "d"), "vy")]), func(): return 1))
		_S.define(_v66, "ux", _S.binary("/", _S.prop(_S.read(_v66, "d"), "vx"), _S.read(_v66, "sp")))
		_S.define(_v66, "uy", _S.binary("/", _S.prop(_S.read(_v66, "d"), "vy"), _S.read(_v66, "sp")))
		_S.define(_v66, "len", _S.invoke(_S.read(_v66, "Math"), "min", [5, _S.binary("+", 0.5, _S.binary("*", _S.read(_v66, "sp"), 0.012))]))
		_S.invoke(_S.read(_v66, "p"), "line", [_S.binary("-", _S.prop(_S.read(_v66, "d"), "x"), _S.binary("*", _S.read(_v66, "ux"), _S.read(_v66, "len"))), _S.binary("-", _S.prop(_S.read(_v66, "d"), "y"), _S.binary("*", _S.read(_v66, "uy"), _S.read(_v66, "len"))), _S.binary("-", _S.prop(_S.read(_v66, "d"), "x"), _S.read(_v66, "ux")), _S.binary("-", _S.prop(_S.read(_v66, "d"), "y"), _S.read(_v66, "uy")), _S.prop(_S.read(_v66, "C"), _S.binary("-", _S.read(_v66, "n"), 4))])
		_S.invoke(_S.read(_v66, "p"), "px", [_S.prop(_S.read(_v66, "d"), "x"), _S.prop(_S.read(_v66, "d"), "y"), _S.prop(_S.read(_v66, "C"), _S.binary("-", _S.read(_v66, "n"), 1))])
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v66, "d"), "s"), 1)):
			_S.last([_S.invoke(_S.read(_v66, "p"), "px", [_S.binary("-", _S.prop(_S.read(_v66, "d"), "x"), _S.read(_v66, "ux")), _S.binary("-", _S.prop(_S.read(_v66, "d"), "y"), _S.read(_v66, "uy")), _S.prop(_S.read(_v66, "C"), _S.binary("-", _S.read(_v66, "n"), 2))]), _S.invoke(_S.read(_v66, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v66, "d"), "x"), 1), _S.prop(_S.read(_v66, "d"), "y"), _S.prop(_S.read(_v66, "C"), _S.binary("-", _S.read(_v66, "n"), 3))])])
		_S.invoke(_S.read(_v66, "p"), "glow", [_S.prop(_S.read(_v66, "d"), "x"), _S.prop(_S.read(_v66, "d"), "y"), _S.binary("+", 3, _S.binary("*", _S.prop(_S.read(_v66, "d"), "s"), 1.5)), _S.prop(_S.read(_v66, "C"), _S.binary("-", _S.read(_v66, "n"), 2)), 0.3])
	return null

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	_S.set_prop(_S.read(_e, "this"), "n", 0, "=", false)
	return null

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "vx", _S.arg(_args, 3))
	_S.define(_e, "vy", _S.arg(_args, 4))
	_S.define(_e, "r0", _S.arg(_args, 5))
	_S.define(_e, "r1", _S.arg(_args, 6))
	_S.define(_e, "end", _S.arg(_args, 7))
	_S.define(_e, "rise", _S.coalesce(_S.arg(_args, 8), func(): return 0))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"vx": _S.read(_e, "vx")}, {"vy": _S.read(_e, "vy")}, {"r0": _S.read(_e, "r0")}, {"r1": _S.read(_e, "r1")}, {"t0": _S.read(_e, "t")}, {"end": _S.read(_e, "end")}, {"rise": _S.read(_e, "rise")}, {"seed": _S.binary("%", _S.binary("*", _S.set_prop(_S.read(_e, "this"), "n", 1, "+=", true), 37.7), 100)}])])
	return null

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	var _v67 = _S.scope(_e)
	_S.define(_v67, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v67, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v67, "i"), 0)):
		if _S.truth(_S.binary(">", _S.read(_v67, "t"), _S.prop(_S.prop(_S.prop(_S.read(_v67, "this"), "list"), _S.read(_v67, "i")), "end"))):
			_S.invoke(_S.prop(_S.read(_v67, "this"), "list"), "splice", [_S.read(_v67, "i"), 1])
		_v67 = _S.iteration(_v67)
		_S.write(_v67, "i", 1, "-=", true)
	return null

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "age", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "q"), "t0")))
	_S.define(_e, "e", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "age")), 2.2)])))
	_S.define(_e, "sw", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "age")]))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "q"), "x"), _S.binary("*", _S.binary("/", _S.prop(_S.read(_e, "q"), "vx"), 2.2), _S.read(_e, "e"))), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 1.7), _S.prop(_S.read(_e, "q"), "seed"))]), 2.5), _S.read(_e, "sw"))))
	_S.define(_e, "y", _S.binary("+", _S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "q"), "y"), _S.binary("*", _S.binary("/", _S.prop(_S.read(_e, "q"), "vy"), 2.2), _S.read(_e, "e"))), _S.binary("*", _S.prop(_S.read(_e, "q"), "rise"), _S.read(_e, "age"))), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 1.3), _S.binary("*", _S.prop(_S.read(_e, "q"), "seed"), 2))]), 1.5), _S.read(_e, "sw"))))
	_S.define(_e, "u", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "age"), _S.invoke(_S.read(_e, "Math"), "max", [0.01, _S.binary("-", _S.prop(_S.read(_e, "q"), "end"), _S.prop(_S.read(_e, "q"), "t0"))]))]))
	_S.define(_e, "r", _S.binary("+", _S.prop(_S.read(_e, "q"), "r0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_e, "q"), "r1"), _S.prop(_S.read(_e, "q"), "r0")), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "age"), 1.2)])), 3])))))
	return _S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"r": _S.read(_e, "r")}, {"a": _S.binary("*", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "age"), 0.15)]), _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "u"), 0.4), 0.6)])))}, {"u": _S.read(_e, "u")}])

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "belly", _S.arg(_args, 2))
	_S.define(_e, "body", _S.arg(_args, 3))
	_S.define(_e, "cap", _S.arg(_args, 4))
	_S.define(_e, "hi", _S.coalesce(_S.arg(_args, 5), func(): return 0))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	_S.define(_e, "glow", _S.coalesce(_S.arg(_args, 7), func(): return 0))
	for _v68 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v69 = _S.scope(_e)
		_S.define(_v69, "q", _v68)
		var _v70 = _S.scope(_v69)
		_S.define(_v70, "g", _S.invoke(_S.read(_v70, "this"), "at", [_S.read(_v70, "q"), _S.read(_v70, "t")]))
		if _S.truth(_S.binary("<=", _S.prop(_S.read(_v70, "g"), "a"), 0.02)):
			continue
		_S.call_value(_S.read(_v70, "gasPuff"), [_S.read(_v70, "p"), _S.prop(_S.read(_v70, "g"), "x"), _S.prop(_S.read(_v70, "g"), "y"), _S.prop(_S.read(_v70, "g"), "r"), _S.binary("*", _S.prop(_S.read(_v70, "g"), "a"), _S.read(_v70, "k")), _S.read(_v70, "belly"), _S.read(_v70, "body"), _S.read(_v70, "cap"), (_S.read(_v70, "hi") if _S.truth(_S.binary("<", _S.prop(_S.read(_v70, "g"), "u"), 0.5)) else 0)])
		if _S.truth(_S.logical("&&", _S.read(_v70, "glow"), func(): return _S.binary(">", _S.prop(_S.read(_v70, "g"), "r"), 4))):
			_S.invoke(_S.read(_v70, "p"), "glow", [_S.prop(_S.read(_v70, "g"), "x"), _S.prop(_S.read(_v70, "g"), "y"), _S.binary("*", _S.prop(_S.read(_v70, "g"), "r"), 1.6), _S.read(_v70, "glow"), _S.binary("*", _S.binary("*", 0.07, _S.prop(_S.read(_v70, "g"), "a")), _S.read(_v70, "k"))])
	return null
