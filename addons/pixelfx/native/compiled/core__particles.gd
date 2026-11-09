@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/particles.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "rng", _S.import_value("core/math.js", "rng"))
	_S.define(_e, "clamp", _S.import_value("core/math.js", "clamp"))
	_S.define(_e, "fly", _S.function_value(_e, "_f0"))
	_S.define(_e, "flyV", _S.function_value(_e, "_f1"))
	_S.define(_e, "burst", _S.function_value(_e, "_f2"))
	_S.define(_e, "cycle", _S.function_value(_e, "_f3"))
	_S.define(_e, "stream", _S.function_value(_e, "_f4"))
	_exports["fly"] = _S.read(_e, "fly")
	_exports["flyV"] = _S.read(_e, "flyV")
	_exports["burst"] = _S.read(_e, "burst")
	_exports["cycle"] = _S.read(_e, "cycle")
	_exports["stream"] = _S.read(_e, "stream")
	_S.define(_e, "Particles", _S.class_value("Particles", _S.function_value(_e, "_f5"), {"add": _S.function_value(_e, "_f6"), "update": _S.function_value(_e, "_f7"), "k": _S.function_value(_e, "_f8")}, {}, {}, null))
	_exports["Particles"] = _S.read(_e, "Particles")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "vy", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "g", _S.coalesce(_S.arg(_args, 5), func(): return 0))
	_S.define(_e, "drag", _S.coalesce(_S.arg(_args, 6), func(): return 0))
	if _S.truth(_S.binary("<=", _S.read(_e, "drag"), 0)):
		return [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "vx"), _S.read(_e, "t"))), _S.binary("+", _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "vy"), _S.read(_e, "t"))), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "g")), _S.read(_e, "t")), _S.read(_e, "t")))]
	_S.define(_e, "f", _S.binary("/", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "drag")), _S.read(_e, "t"))])), _S.read(_e, "drag")))
	_S.define(_e, "vt", _S.binary("/", _S.read(_e, "g"), _S.read(_e, "drag")))
	return [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "vx"), _S.read(_e, "f"))), _S.binary("+", _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "vt"), _S.read(_e, "t"))), _S.binary("*", _S.binary("-", _S.read(_e, "vy"), _S.read(_e, "vt")), _S.read(_e, "f")))]

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "vx", _S.arg(_args, 0))
	_S.define(_e, "vy", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "g", _S.coalesce(_S.arg(_args, 3), func(): return 0))
	_S.define(_e, "drag", _S.coalesce(_S.arg(_args, 4), func(): return 0))
	if _S.truth(_S.binary("<=", _S.read(_e, "drag"), 0)):
		return [_S.read(_e, "vx"), _S.binary("+", _S.read(_e, "vy"), _S.binary("*", _S.read(_e, "g"), _S.read(_e, "t")))]
	_S.define(_e, "e", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "drag")), _S.read(_e, "t"))]))
	_S.define(_e, "vt", _S.binary("/", _S.read(_e, "g"), _S.read(_e, "drag")))
	return [_S.binary("*", _S.read(_e, "vx"), _S.read(_e, "e")), _S.binary("+", _S.read(_e, "vt"), _S.binary("*", _S.binary("-", _S.read(_e, "vy"), _S.read(_e, "vt")), _S.read(_e, "e")))]

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "n", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.arg(_args, 1))
	_S.define(_e, "fn", _S.arg(_args, 2))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.read(_v0, "n"))):
		_S.call_value(_S.read(_v0, "fn"), [_S.call_value(_S.read(_v0, "rng"), [_S.read(_v0, "seed"), _S.read(_v0, "i")]), _S.read(_v0, "i")])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "period", _S.arg(_args, 1))
	_S.define(_e, "count", _S.arg(_args, 2))
	_S.define(_e, "seed", _S.arg(_args, 3))
	_S.define(_e, "life", _S.arg(_args, 4))
	_S.define(_e, "fn", _S.arg(_args, 5))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "i"), _S.read(_v1, "count"))):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "g", _S.call_value(_S.read(_v2, "rng"), [_S.read(_v2, "seed"), _S.read(_v2, "i"), 911]))
		_S.define(_v2, "born", _S.binary("*", _S.invoke(_S.read(_v2, "g"), "next", []), _S.read(_v2, "period")))
		_S.define(_v2, "L", (_S.call_value(_S.read(_v2, "life"), [_S.read(_v2, "g")]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_v2, "life")), "function")) else _S.read(_v2, "life")))
		_S.define(_v2, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v2, "t"), _S.read(_v2, "born")), _S.read(_v2, "period")), _S.read(_v2, "period")), _S.read(_v2, "period")))
		var _v3 = _S.scope(_v2)
		while _S.truth(_S.binary("<", _S.read(_v3, "age"), _S.read(_v3, "L"))):
			_S.call_value(_S.read(_v3, "fn"), [_S.read(_v3, "age"), _S.read(_v3, "L"), _S.call_value(_S.read(_v3, "rng"), [_S.read(_v3, "seed"), _S.read(_v3, "i")]), _S.read(_v3, "i")])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "age", _S.read(_v3, "period"), "+=", false)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "i", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "t0", _S.arg(_args, 1))
	_S.define(_e, "t1", _S.arg(_args, 2))
	_S.define(_e, "rate", _S.arg(_args, 3))
	_S.define(_e, "seed", _S.arg(_args, 4))
	_S.define(_e, "life", _S.arg(_args, 5))
	_S.define(_e, "fn", _S.arg(_args, 6))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "t"), _S.read(_e, "t1")]), _S.read(_e, "t0")), _S.read(_e, "rate"))]))
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<=", _S.read(_v4, "i"), _S.read(_v4, "n"))):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "born", _S.binary("+", _S.read(_v5, "t0"), _S.binary("/", _S.read(_v5, "i"), _S.read(_v5, "rate"))))
		_S.define(_v5, "g", _S.call_value(_S.read(_v5, "rng"), [_S.read(_v5, "seed"), _S.read(_v5, "i"), 911]))
		_S.define(_v5, "L", (_S.call_value(_S.read(_v5, "life"), [_S.read(_v5, "g")]) if _S.truth(_S.binary("===", _S.unary("typeof", _S.read(_v5, "life")), "function")) else _S.read(_v5, "life")))
		_S.define(_v5, "age", _S.binary("-", _S.read(_v5, "t"), _S.read(_v5, "born")))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v5, "age"), 0), func(): return _S.binary("<", _S.read(_v5, "age"), _S.read(_v5, "L")))):
			_S.call_value(_S.read(_v5, "fn"), [_S.read(_v5, "age"), _S.read(_v5, "L"), _S.call_value(_S.read(_v5, "rng"), [_S.read(_v5, "seed"), _S.read(_v5, "i")]), _S.read(_v5, "i")])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.set_prop(_S.read(_e, "p"), "age", 0, "=", false)
	_S.set_prop(_S.read(_e, "p"), "g", 0, "??=", false)
	_S.set_prop(_S.read(_e, "p"), "drag", 0, "??=", false)
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.read(_e, "p")])
	return _S.read(_e, "p")

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v6, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v6, "i"), 0)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "p", _S.prop(_S.prop(_S.read(_v7, "this"), "list"), _S.read(_v7, "i")))
		if _S.truth(_S.binary(">=", _S.set_prop(_S.read(_v7, "p"), "age", _S.read(_v7, "dt"), "+=", false), _S.prop(_S.read(_v7, "p"), "life"))):
			var _v8 = _S.scope(_v7)
			_S.invoke(_S.prop(_S.read(_v8, "this"), "list"), "splice", [_S.read(_v8, "i"), 1])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v7, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v7, "p"), "vx"), _S.prop(_S.read(_v7, "p"), "drag")), _S.read(_v7, "dt")), "-=", false)
		_S.set_prop(_S.read(_v7, "p"), "vy", _S.binary("-", _S.binary("*", _S.prop(_S.read(_v7, "p"), "g"), _S.read(_v7, "dt")), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v7, "p"), "vy"), _S.prop(_S.read(_v7, "p"), "drag")), _S.read(_v7, "dt"))), "+=", false)
		_S.set_prop(_S.read(_v7, "p"), "x", _S.binary("*", _S.prop(_S.read(_v7, "p"), "vx"), _S.read(_v7, "dt")), "+=", false)
		_S.set_prop(_S.read(_v7, "p"), "y", _S.binary("*", _S.prop(_S.read(_v7, "p"), "vy"), _S.read(_v7, "dt")), "+=", false)
		if _S.truth(_S.logical("&&", _S.binary("!==", _S.prop(_S.read(_v7, "p"), "ground"), null), func(): return _S.binary(">", _S.prop(_S.read(_v7, "p"), "y"), _S.prop(_S.read(_v7, "p"), "ground")))):
			var _v9 = _S.scope(_v7)
			_S.set_prop(_S.read(_v9, "p"), "y", _S.prop(_S.read(_v9, "p"), "ground"), "=", false)
			_S.set_prop(_S.read(_v9, "p"), "vy", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v9, "Math"), "abs", [_S.prop(_S.read(_v9, "p"), "vy")])), _S.logical("??", _S.prop(_S.read(_v9, "p"), "bounce"), func(): return 0.3)), "=", false)
			_S.set_prop(_S.read(_v9, "p"), "vx", 0.7, "*=", false)
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "-=", true)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_e, "p"), "age"), _S.prop(_S.read(_e, "p"), "life")))])
