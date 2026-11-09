@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "GRAVITY", _S.import_value("core/index.js", "GRAVITY"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "move", _S.function_value(_e, "_f0"))
	_S.define(_e, "flash", _S.function_value(_e, "_f1"))
	_S.define(_e, "strokeArc", _S.function_value(_e, "_f2"))
	_S.define(_e, "SOFT", _S.construct(_S.read(_e, "Set"), [[_S.prop(_S.read(_e, "P"), "VAPOUR"), _S.prop(_S.read(_e, "P"), "DUST"), _S.prop(_S.read(_e, "P"), "SMOKE")]]))
	_S.define(_e, "STEP", _S.binary("/", 1, 240))
	_S.define(_e, "Ghosts", _S.class_value("Ghosts", _S.function_value(_e, "_f3"), {"add": _S.function_value(_e, "_f5"), "state": _S.function_value(_e, "_f7"), "at": _S.function_value(_e, "_f8")}, {"count": _S.function_value(_e, "_f6")}, {}, null))
	_exports["Ghosts"] = _S.read(_e, "Ghosts")
	_exports["flash"] = _S.read(_e, "flash")
	_S.define(_e, "since", _S.function_value(_e, "_f9"))
	_exports["since"] = _S.read(_e, "since")
	_exports["strokeArc"] = _S.read(_e, "strokeArc")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "dt", _S.arg(_args, 1))
	_S.define(_e, "age", _S.arg(_args, 2))
	_S.define(_e, "ground", _S.arg(_args, 3))
	var _v0 = _S.prop(_S.read(_e, "q"), "k")
	var _v1 = false
	while true:
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "FIRE")):
			_v1 = true
			_S.set_prop(_S.read(_e, "q"), "vy", _S.binary("*", 95, _S.read(_e, "dt")), "-=", false)
			_S.set_prop(_S.read(_e, "q"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 17), _S.prop(_S.read(_e, "q"), "seed"))]), 30), _S.read(_e, "dt")), "+=", false)
			_S.set_prop(_S.read(_e, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), 5), _S.read(_e, "dt")), "-=", false)
			_S.set_prop(_S.read(_e, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), 3.2), _S.read(_e, "dt")), "-=", false)
			break
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "GRIT")):
			_v1 = true
			var _v2 = _S.scope(_e)
			_S.set_prop(_S.read(_v2, "q"), "vy", _S.binary("*", _S.read(_v2, "GRAVITY"), _S.read(_v2, "dt")), "+=", false)
			_S.set_prop(_S.read(_v2, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v2, "q"), "vx"), 0.8), _S.read(_v2, "dt")), "-=", false)
			_S.define(_v2, "g", _S.call_value(_S.read(_v2, "ground"), [_S.prop(_S.read(_v2, "q"), "x")]))
			_S.define(_v2, "ny", _S.binary("+", _S.prop(_S.read(_v2, "q"), "y"), _S.binary("*", _S.prop(_S.read(_v2, "q"), "vy"), _S.read(_v2, "dt"))))
			_S.set_prop(_S.read(_v2, "q"), "x", _S.binary("*", _S.prop(_S.read(_v2, "q"), "vx"), _S.read(_v2, "dt")), "+=", false)
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v2, "q"), "vy"), 0), func(): return _S.binary("<=", _S.prop(_S.read(_v2, "q"), "y"), _S.read(_v2, "g"))), func(): return _S.binary(">=", _S.read(_v2, "ny"), _S.read(_v2, "g")))):
				var _v3 = _S.scope(_v2)
				_S.set_prop(_S.read(_v3, "q"), "y", _S.binary("-", _S.read(_v3, "g"), 0.25), "=", false)
				if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v3, "q"), "vy"), 130), func(): return _S.binary("<", _S.call_value(_S.read(_v3, "rand"), [_S.binary("*", _S.prop(_S.read(_v3, "q"), "seed"), 1000), _S.set_prop(_S.read(_v3, "q"), "hops", 1, "+=", true)]), 0.4))):
					_S.last([_S.set_prop(_S.read(_v3, "q"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v3, "q"), "vy")), 0.25), "=", false), _S.set_prop(_S.read(_v3, "q"), "vx", _S.binary("*", _S.prop(_S.read(_v3, "q"), "vx"), 0.5), "=", false)])
				else:
					_S.last([_S.set_prop(_S.read(_v3, "q"), "vx", _S.set_prop(_S.read(_v3, "q"), "vy", 0, "=", false), "=", false), _S.set_prop(_S.read(_v3, "q"), "life", _S.invoke(_S.read(_v3, "Math"), "min", [_S.prop(_S.read(_v3, "q"), "life"), 0.5]), "=", false)])
			else:
				_S.set_prop(_S.read(_v2, "q"), "y", _S.read(_v2, "ny"), "=", false)
			return null
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "SPARK")):
			_v1 = true
			var _v4 = _S.scope(_e)
			_S.set_prop(_S.read(_v4, "q"), "vy", _S.binary("*", _S.binary("*", _S.read(_v4, "GRAVITY"), 0.45), _S.read(_v4, "dt")), "+=", false)
			_S.set_prop(_S.read(_v4, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v4, "q"), "vx"), 2.2), _S.read(_v4, "dt")), "-=", false)
			_S.set_prop(_S.read(_v4, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v4, "q"), "vy"), 2.2), _S.read(_v4, "dt")), "-=", false)
			_S.define(_v4, "g", _S.call_value(_S.read(_v4, "ground"), [_S.prop(_S.read(_v4, "q"), "x")]))
			_S.define(_v4, "ny", _S.binary("+", _S.prop(_S.read(_v4, "q"), "y"), _S.binary("*", _S.prop(_S.read(_v4, "q"), "vy"), _S.read(_v4, "dt"))))
			_S.set_prop(_S.read(_v4, "q"), "x", _S.binary("*", _S.prop(_S.read(_v4, "q"), "vx"), _S.read(_v4, "dt")), "+=", false)
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v4, "q"), "vy"), 0), func(): return _S.binary("<=", _S.prop(_S.read(_v4, "q"), "y"), _S.read(_v4, "g"))), func(): return _S.binary(">=", _S.read(_v4, "ny"), _S.read(_v4, "g")))):
				_S.last([_S.set_prop(_S.read(_v4, "q"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v4, "q"), "vy")), 0.45), "=", false), _S.set_prop(_S.read(_v4, "q"), "vx", 0.7, "*=", false), _S.set_prop(_S.read(_v4, "q"), "y", _S.binary("-", _S.read(_v4, "g"), 0.25), "=", false)])
			else:
				_S.set_prop(_S.read(_v4, "q"), "y", _S.read(_v4, "ny"), "=", false)
			return null
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "STREAK")):
			_v1 = true
			_S.last([_S.set_prop(_S.read(_e, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), 3), _S.read(_e, "dt")), "+=", false), _S.set_prop(_S.read(_e, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), 3), _S.read(_e, "dt")), "+=", false)])
			break
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "FLAKE")):
			_v1 = true
			_S.set_prop(_S.read(_e, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), 2.2), _S.read(_e, "dt")), "-=", false)
			_S.set_prop(_S.read(_e, "q"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), 2.2), _S.read(_e, "dt")), _S.binary("*", 35, _S.read(_e, "dt"))), "-=", false)
			_S.set_prop(_S.read(_e, "q"), "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2.5), _S.prop(_S.read(_e, "q"), "seed"))]), 7), _S.read(_e, "dt")), "+=", false)
			break
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "EMBER")):
			_v1 = true
			_S.set_prop(_S.read(_e, "q"), "vy", _S.binary("*", _S.binary("+", _S.unary("-", 30), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 3), _S.prop(_S.read(_e, "q"), "seed"))]), 20)), _S.read(_e, "dt")), "+=", false)
			_S.set_prop(_S.read(_e, "q"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2.3), _S.prop(_S.read(_e, "q"), "seed"))]), 45), _S.read(_e, "dt")), "+=", false)
			_S.set_prop(_S.read(_e, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), 1.6), _S.read(_e, "dt")), "-=", false)
			_S.set_prop(_S.read(_e, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), 1.6), _S.read(_e, "dt")), "-=", false)
			break
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "SMOKE")):
			_v1 = true
			var _v5 = _S.scope(_e)
			_S.define(_v5, "big", _S.binary("&", _S.prop(_S.read(_v5, "q"), "flag"), _S.prop(_S.read(_v5, "PF"), "BIG")))
			_S.set_prop(_S.read(_v5, "q"), "vy", _S.binary("*", (23 if _S.truth(_S.read(_v5, "big")) else 16), _S.read(_v5, "dt")), "-=", false)
			_S.set_prop(_S.read(_v5, "q"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v5, "age"), 1.3), _S.prop(_S.read(_v5, "q"), "seed"))]), 8), _S.read(_v5, "dt")), "+=", false)
			_S.set_prop(_S.read(_v5, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v5, "q"), "vx"), 1.6), _S.read(_v5, "dt")), "-=", false)
			_S.set_prop(_S.read(_v5, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v5, "q"), "vy"), 1.2), _S.read(_v5, "dt")), "-=", false)
			break
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "MOTE")):
			_v1 = true
			_S.set_prop(_S.read(_e, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), 0.6), _S.read(_e, "dt")), "-=", false)
			_S.set_prop(_S.read(_e, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), 0.6), _S.read(_e, "dt")), "-=", false)
			break
		if _v1 or true:
			_v1 = true
			var _v6 = _S.scope(_e)
			_S.define(_v6, "drag", (4 if _S.truth(_S.invoke(_S.read(_v6, "SOFT"), "has", [_S.prop(_S.read(_v6, "q"), "k")])) else 1.6))
			_S.set_prop(_S.read(_v6, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v6, "q"), "vx"), _S.read(_v6, "drag")), _S.read(_v6, "dt")), "-=", false)
			_S.set_prop(_S.read(_v6, "q"), "vy", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v6, "q"), "vy"), _S.read(_v6, "drag")), _S.read(_v6, "dt")), _S.binary("*", 5, _S.read(_v6, "dt"))), "-=", false)
		break
	_S.set_prop(_S.read(_e, "q"), "x", _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), _S.read(_e, "dt")), "+=", false)
	_S.set_prop(_S.read(_e, "q"), "y", _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "dt")), "+=", false)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "t0", _S.arg(_args, 2))
	_S.define(_e, "x", _S.arg(_args, 3))
	_S.define(_e, "y", _S.arg(_args, 4))
	_S.define(_e, "r", _S.arg(_args, 5))
	_S.define(_e, "c", _S.arg(_args, 6))
	_S.define(_e, "k", _S.arg(_args, 7))
	_S.define(_e, "life", _S.arg(_args, 8))
	_S.define(_e, "a", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "t0")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "a"), 0), func(): return _S.binary(">=", _S.read(_e, "a"), _S.read(_e, "life")))):
		return null
	_S.define(_e, "q", _S.binary("-", 1, _S.binary("/", _S.read(_e, "a"), _S.read(_e, "life"))))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.read(_e, "q")))), _S.read(_e, "c"), _S.binary("*", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "q")), _S.read(_e, "q"))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "pts", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 3), func(): return 1))
	_S.define(_e, "w", _S.coalesce(_S.arg(_args, 4), func(): return 1))
	var _v7 = _S.read(_e, "C")
	_S.define(_e, "halo", _S.prop(_v7, 0))
	_S.define(_e, "body", _S.prop(_v7, 1))
	_S.define(_e, "glow", _S.prop(_v7, 2))
	for _v8 in _S.array([0, 1, 2]):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "pass", _v8)
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "i", 1)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), _S.prop(_S.read(_v10, "pts"), "length"))):
			var _v11 = _S.scope(_v10)
			var _v12 = _S.prop(_S.read(_v11, "pts"), _S.binary("-", _S.read(_v11, "i"), 1))
			_S.define(_v11, "ax", _S.prop(_v12, 0))
			_S.define(_v11, "ay", _S.prop(_v12, 1))
			var _v13 = _S.prop(_S.read(_v11, "pts"), _S.read(_v11, "i"))
			_S.define(_v11, "bx", _S.prop(_v13, 0))
			_S.define(_v11, "by", _S.prop(_v13, 1))
			_S.define(_v11, "L", _S.invoke(_S.read(_v11, "Math"), "max", [1, _S.invoke(_S.read(_v11, "Math"), "hypot", [_S.binary("-", _S.read(_v11, "bx"), _S.read(_v11, "ax")), _S.binary("-", _S.read(_v11, "by"), _S.read(_v11, "ay"))])]))
			var _v14 = _S.scope(_v11)
			_S.define(_v14, "d", 0)
			while _S.truth(_S.binary("<=", _S.read(_v14, "d"), _S.read(_v14, "L"))):
				var _v15 = _S.scope(_v14)
				_S.define(_v15, "x", _S.binary("+", _S.read(_v15, "ax"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v15, "bx"), _S.read(_v15, "ax")), _S.read(_v15, "d")), _S.read(_v15, "L"))))
				_S.define(_v15, "y", _S.binary("+", _S.read(_v15, "ay"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v15, "by"), _S.read(_v15, "ay")), _S.read(_v15, "d")), _S.read(_v15, "L"))))
				if _S.truth(_S.binary("===", _S.read(_v15, "pass"), 0)):
					_S.invoke(_S.read(_v15, "p"), "circle", [_S.read(_v15, "x"), _S.read(_v15, "y"), _S.binary("*", (1.6 if _S.truth(_S.binary(">", _S.read(_v15, "k"), 0.6)) else 1.1), _S.read(_v15, "w")), _S.read(_v15, "halo")])
				else:
					if _S.truth(_S.binary("===", _S.read(_v15, "pass"), 1)):
						_S.invoke(_S.read(_v15, "p"), "circle", [_S.read(_v15, "x"), _S.read(_v15, "y"), _S.binary("*", (0.9 if _S.truth(_S.binary(">", _S.read(_v15, "k"), 0.6)) else 0.6), _S.read(_v15, "w")), _S.read(_v15, "body")])
					else:
						if _S.truth(_S.binary(">", _S.read(_v15, "k"), 0.3)):
							_S.invoke(_S.read(_v15, "p"), "px", [_S.read(_v15, "x"), _S.read(_v15, "y"), _S.read(_v15, "WHITE")])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "d", 0.5, "+=", false)
			if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v11, "pass"), 0), func(): return _S.binary("===", _S.binary("%", _S.read(_v11, "i"), 3), 0))):
				_S.invoke(_S.read(_v11, "p"), "glow", [_S.read(_v11, "ax"), _S.read(_v11, "ay"), _S.binary("*", 9, _S.read(_v11, "w")), _S.read(_v11, "glow"), _S.binary("*", 0.45, _S.read(_v11, "k"))])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "period", _S.arg(_args, 0))
	_S.define(_e, "opts", _S.coalesce(_S.arg(_args, 1), func(): return _S.merge([])))
	_S.set_prop(_S.read(_e, "this"), "D", _S.read(_e, "period"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "ground", _S.logical("??", _S.prop(_S.read(_e, "opts"), "ground"), func(): return _S.function_value(_e, "_f4")), "=", false)
	_S.set_prop(_S.read(_e, "this"), "box", _S.logical("??", _S.prop(_S.read(_e, "opts"), "box"), func(): return null), "=", false)
	_S.set_prop(_S.read(_e, "this"), "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"ground": _S.prop(_S.read(_e, "this"), "ground")}, {"sparks": _S.prop(_S.read(_e, "opts"), "sparks")}, {"haze": _S.prop(_S.read(_e, "opts"), "haze")}])]), "=", false)
	_S.set_prop(_S.read(_e, "this"), "specs", [], "=", false)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return INF

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "born", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "vx", _S.arg(_args, 4))
	_S.define(_e, "vy", _S.arg(_args, 5))
	_S.define(_e, "life", _S.arg(_args, 6))
	_S.define(_e, "col", _S.coalesce(_S.arg(_args, 7), func(): return _S.read(_e, "WHITE")))
	_S.define(_e, "size", _S.coalesce(_S.arg(_args, 8), func(): return 1))
	_S.define(_e, "flag", _S.coalesce(_S.arg(_args, 9), func(): return 0))
	_S.define(_e, "n", _S.prop(_S.prop(_S.read(_e, "this"), "specs"), "length"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "this"), "D"))
	_S.define(_e, "seed", _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "n"), 41]), 100))
	if _S.truth(_S.binary("===", _S.read(_e, "k"), _S.prop(_S.read(_e, "P"), "STAR"))):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "m", _S.invoke(_S.read(_v16, "Math"), "ceil", [_S.binary("/", _S.binary("*", 8, _S.read(_v16, "D")), _S.read(_v16, "TAU"))]))
		_S.define(_v16, "f", _S.binary("-", _S.binary("/", _S.binary("*", _S.read(_v16, "TAU"), _S.read(_v16, "m")), _S.read(_v16, "D")), 8))
		if _S.truth(_S.binary("<", _S.read(_v16, "f"), 5)):
			_S.write(_v16, "seed", _S.binary("+", _S.read(_v16, "f"), _S.binary("*", 5, _S.invoke(_S.read(_v16, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v16, "rand"), [_S.read(_v16, "n"), 43]), 19)]))), "=", false)
	_S.invoke(_S.prop(_S.read(_e, "this"), "specs"), "push", [_S.merge([{"born": _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "born"), _S.read(_e, "D")), _S.read(_e, "D")), _S.read(_e, "D"))}, {"k": _S.read(_e, "k")}, {"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"vx": _S.read(_e, "vx")}, {"vy": _S.read(_e, "vy")}, {"life": _S.read(_e, "life")}, {"col": (_S.call_value(_S.read(_e, "hex"), [_S.read(_e, "col")]) if _S.truth(_S.read(_e, "col")) else 0)}, {"size": _S.read(_e, "size")}, {"flag": _S.read(_e, "flag")}, {"seed": _S.read(_e, "seed")}])])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.prop(_S.prop(_S.read(_e, "this"), "specs"), "length")

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "q", _S.merge([{"k": _S.prop(_S.read(_e, "s"), "k")}, {"x": _S.prop(_S.read(_e, "s"), "x")}, {"y": _S.prop(_S.read(_e, "s"), "y")}, {"vx": _S.prop(_S.read(_e, "s"), "vx")}, {"vy": _S.prop(_S.read(_e, "s"), "vy")}, {"life": _S.prop(_S.read(_e, "s"), "life")}, {"max": _S.prop(_S.read(_e, "s"), "life")}, {"col": _S.prop(_S.read(_e, "s"), "col")}, {"size": _S.prop(_S.read(_e, "s"), "size")}, {"seed": _S.prop(_S.read(_e, "s"), "seed")}, {"delay": 0}, {"flag": _S.prop(_S.read(_e, "s"), "flag")}, {"hops": 0}]))
	_S.define(_e, "a", 0)
	while _S.truth(_S.binary("<", _S.read(_e, "a"), _S.binary("-", _S.read(_e, "age"), 1e-9))):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "dt", _S.invoke(_S.read(_v17, "Math"), "min", [_S.read(_v17, "STEP"), _S.binary("-", _S.read(_v17, "age"), _S.read(_v17, "a"))]))
		_S.call_value(_S.read(_v17, "move"), [_S.read(_v17, "q"), _S.read(_v17, "dt"), _S.read(_v17, "a"), _S.prop(_S.read(_v17, "this"), "ground")])
		_S.write(_v17, "a", _S.read(_v17, "dt"), "+=", false)
		_S.set_prop(_S.read(_v17, "q"), "life", _S.read(_v17, "dt"), "-=", false)
		if _S.truth(_S.binary("<=", _S.prop(_S.read(_v17, "q"), "life"), 0)):
			var _v18 = _S.scope(_v17)
			if _S.truth(_S.logical("||", _S.binary("!==", _S.prop(_S.read(_v18, "q"), "k"), _S.prop(_S.read(_v18, "P"), "FIRE")), func(): return _S.unary("!", _S.binary("&", _S.prop(_S.read(_v18, "q"), "flag"), _S.prop(_S.read(_v18, "PF"), "SMOKES"))))):
				return null
			_S.define(_v18, "big", _S.binary("&", _S.prop(_S.read(_v18, "q"), "flag"), _S.prop(_S.read(_v18, "PF"), "BIG")))
			_S.define(_v18, "L", (_S.binary("+", 1.3, _S.call_value(_S.read(_v18, "rand"), [_S.binary("*", _S.prop(_S.read(_v18, "s"), "seed"), 7), 1])) if _S.truth(_S.read(_v18, "big")) else _S.binary("+", 0.8, _S.binary("*", _S.call_value(_S.read(_v18, "rand"), [_S.binary("*", _S.prop(_S.read(_v18, "s"), "seed"), 7), 1]), 0.6))))
			_S.invoke(_S.read(_v18, "Object"), "assign", [_S.read(_v18, "q"), _S.merge([{"k": _S.prop(_S.read(_v18, "P"), "SMOKE")}, {"vx": _S.binary("*", _S.prop(_S.read(_v18, "q"), "vx"), 0.6)}, {"vy": _S.binary("-", _S.binary("*", _S.prop(_S.read(_v18, "q"), "vy"), 0.6), 6)}, {"life": _S.read(_v18, "L")}, {"max": _S.read(_v18, "L")}, {"col": 0}, {"size": _S.binary("*", _S.prop(_S.read(_v18, "q"), "size"), (0.85 if _S.truth(_S.read(_v18, "big")) else 0.7))}, {"flag": (_S.prop(_S.read(_v18, "PF"), "BIG") if _S.truth(_S.read(_v18, "big")) else 0)}])])
	if _S.truth(_S.prop(_S.read(_e, "this"), "box")):
		var _v19 = _S.scope(_e)
		var _v20 = _S.prop(_S.read(_v19, "this"), "box")
		_S.define(_v19, "x0", _S.prop(_v20, 0))
		_S.define(_v19, "y0", _S.prop(_v20, 1))
		_S.define(_v19, "x1", _S.prop(_v20, 2))
		_S.define(_v19, "y1", _S.prop(_v20, 3))
		if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.prop(_S.read(_v19, "q"), "x"), _S.read(_v19, "x0")), func(): return _S.binary(">", _S.prop(_S.read(_v19, "q"), "x"), _S.read(_v19, "x1"))), func(): return _S.binary("<", _S.prop(_S.read(_v19, "q"), "y"), _S.read(_v19, "y0"))), func(): return _S.binary(">", _S.prop(_S.read(_v19, "q"), "y"), _S.read(_v19, "y1")))):
			return null
	return _S.read(_e, "q")

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "D", _S.prop(_S.read(_e, "this"), "D"))
	_S.define(_e, "list", [])
	for _v21 in _S.array(_S.prop(_S.read(_e, "this"), "specs")):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "s", _v21)
		var _v23 = _S.scope(_v22)
		_S.define(_v23, "span", (_S.binary("+", _S.prop(_S.read(_v23, "s"), "life"), 2.4) if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_v23, "s"), "k"), _S.prop(_S.read(_v23, "P"), "FIRE")), func(): return _S.binary("&", _S.prop(_S.read(_v23, "s"), "flag"), _S.prop(_S.read(_v23, "PF"), "SMOKES")))) else _S.prop(_S.read(_v23, "s"), "life")))
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v24, "t"), _S.prop(_S.read(_v24, "s"), "born")), _S.read(_v24, "D")), _S.read(_v24, "D")), _S.read(_v24, "D")))
		while _S.truth(_S.binary("<", _S.read(_v24, "age"), _S.read(_v24, "span"))):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "q", _S.invoke(_S.read(_v25, "this"), "state", [_S.read(_v25, "s"), _S.read(_v25, "age")]))
			if _S.truth(_S.read(_v25, "q")):
				_S.invoke(_S.read(_v25, "list"), "push", [_S.read(_v25, "q")])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "age", _S.read(_v24, "D"), "+=", false)
	_S.set_prop(_S.prop(_S.read(_e, "this"), "ps"), "list", _S.read(_e, "list"), "=", false)
	_S.set_prop(_S.prop(_S.read(_e, "this"), "ps"), "t", _S.read(_e, "t"), "=", false)
	return _S.prop(_S.read(_e, "this"), "ps")

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "t0", _S.arg(_args, 1))
	_S.define(_e, "D", _S.arg(_args, 2))
	return _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "t0")), _S.read(_e, "D")), _S.read(_e, "D")), _S.read(_e, "D"))
