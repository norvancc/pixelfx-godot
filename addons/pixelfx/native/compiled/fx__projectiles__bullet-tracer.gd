@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/bullet-tracer.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "beat", _S.import_value("fx/projectiles/_lib.js", "beat"))
	_S.define(_e, "wake", _S.import_value("fx/projectiles/_lib.js", "wake"))
	_S.define(_e, "spark", _S.import_value("fx/projectiles/_lib.js", "spark"))
	_S.define(_e, "cloud", _S.import_value("fx/projectiles/_lib.js", "cloud"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Bullet tracer"}, {"desc": "A white-hot slug tearing along, its tracer burning behind it in a long streak that sputters and cools from white through gold to red, shedding sparks and a thread of smoke."}, {"tags": ["projectile", "bullet", "tracer", "gun", "directional", "loop"]}, {"size": [200, 40]}, {"origin": [184, 18]}, {"duration": 0.6}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"smoke": ["#2e2a36", "#46404f", "#625b6b", "#817a8a", "#a39caa"]}, {"length": 120}, {"speed": 520}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SLUG", ["..oyyp..", ".ypwwwwp", "ywwwwwww", ".ypwwwwp", "..oyyp.."])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "SM", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "smoke"), 5]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "L", _S.prop(_S.read(_e, "o"), "length"))
	_S.define(_e, "V", _S.prop(_S.read(_e, "o"), "speed"))
	_S.define(_e, "fr", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 30), 0.000001)]))
	_S.define(_e, "ph", _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), _S.read(_e, "D")))
	_S.define(_e, "left", _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 2))
	_S.define(_e, "puffs", [])
	_S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t"), _S.read(_e, "D"), 18, _S.binary("+", _S.read(_e, "S"), 7), _S.function_value(_e, "_f1"), _S.function_value(_e, "_f2")])
	_S.call_value(_S.read(_e, "cloud"), [_S.read(_e, "p"), _S.read(_e, "puffs"), _S.read(_e, "SM"), _S.read(_e, "SM"), _S.merge([{"dens": 1.2}, {"max": 0.6}])])
	_S.define(_e, "heat", _S.function_value(_e, "_f3"))
	_S.define(_e, "yAt", _S.function_value(_e, "_f4"))
	_S.define(_e, "HOT", _S.binary("*", _S.read(_e, "L"), 0.32))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "HOT")), 1), _S.unary("-", 4), 1, 5, _S.function_value(_e, "_f5")])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "d", _S.read(_v0, "HOT"))
	while _S.truth(_S.binary("<=", _S.read(_v0, "d"), _S.read(_v0, "L"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "u", _S.binary("/", _S.read(_v1, "d"), _S.read(_v1, "L")))
		_S.define(_v1, "h", _S.call_value(_S.read(_v1, "heat"), [_S.read(_v1, "d")]))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v1, "u"), 0.55), func(): return _S.binary("<", _S.call_value(_S.read(_v1, "rand"), [_S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("/", _S.read(_v1, "d"), 3)]), _S.read(_v1, "fr"), _S.read(_v1, "S")]), _S.binary("*", _S.binary("-", _S.read(_v1, "u"), 0.55), 1.6)))):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "d", 0.5, "+=", false)
			continue
		_S.define(_v1, "c", (_S.prop(_S.read(_v1, "F"), 6) if _S.truth(_S.binary(">", _S.read(_v1, "h"), 0.55)) else (_S.prop(_S.read(_v1, "F"), 5) if _S.truth(_S.binary(">", _S.read(_v1, "h"), 0.42)) else (_S.prop(_S.read(_v1, "F"), 4) if _S.truth(_S.binary(">", _S.read(_v1, "h"), 0.3)) else (_S.prop(_S.read(_v1, "F"), 3) if _S.truth(_S.binary(">", _S.read(_v1, "h"), 0.18)) else (_S.prop(_S.read(_v1, "F"), 2) if _S.truth(_S.binary(">", _S.read(_v1, "h"), 0.08)) else _S.prop(_S.read(_v1, "F"), 1)))))))
		_S.invoke(_S.read(_v1, "p"), "dot", [_S.unary("-", _S.read(_v1, "d")), _S.call_value(_S.read(_v1, "yAt"), [_S.read(_v1, "d")]), _S.read(_v1, "c"), (1 if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.85)) else _S.binary("/", _S.binary("-", 1, _S.read(_v1, "u")), 0.15))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "d", 0.5, "+=", false)
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.unary("-", 2), 1, _S.binary("*", _S.unary("-", _S.read(_e, "L")), 0.45), 1, 6, _S.prop(_S.read(_e, "F"), 4), 0.35])
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.unary("-", 2), 1, _S.binary("*", _S.unary("-", _S.read(_e, "L")), 0.2), 1, 3, _S.prop(_S.read(_e, "F"), 7), 0.3])
	_S.define(_e, "SP", [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 3)])
	_S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t"), _S.read(_e, "D"), 16, _S.binary("+", _S.read(_e, "S"), 2), _S.function_value(_e, "_f6"), _S.function_value(_e, "_f7")])
	_S.invoke(_S.read(_e, "p"), "sprite", [_S.read(_e, "SLUG"), _S.merge([{"w": _S.read(_e, "WHITE")}, {"p": _S.prop(_S.read(_e, "F"), 7)}, {"y": _S.prop(_S.read(_e, "F"), 6)}, {"o": _S.prop(_S.read(_e, "F"), 5)}]), _S.unary("-", 1), _S.unary("-", 1)])
	_S.invoke(_S.read(_e, "p"), "glow", [2, 1, 24, _S.prop(_S.read(_e, "F"), 4), 0.5])
	_S.invoke(_S.read(_e, "p"), "glow", [3, 1, 8, _S.read(_e, "WHITE"), 0.55])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.5, 0.7])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "x", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_e, "L")), _S.invoke(_S.read(_e, "r"), "range", [0.45, 0.8])), _S.binary("*", _S.read(_e, "age"), 90)))
	_S.define(_e, "y", _S.binary("-", _S.binary("+", 0.5, _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 6), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))]), _S.read(_e, "age")), 3)), _S.binary("*", _S.binary("*", _S.read(_e, "age"), _S.read(_e, "age")), 8)))
	if _S.truth(_S.binary("<", _S.read(_e, "x"), _S.binary("+", _S.read(_e, "left"), 6))):
		return null
	_S.invoke(_S.read(_e, "puffs"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"r": _S.binary("+", 1.2, _S.binary("*", _S.read(_e, "age"), 4))}, {"a": _S.binary("*", _S.binary("*", _S.binary("*", 0.55, _S.binary("-", 1, _S.read(_e, "k"))), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 8)])), _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "left"), _S.binary("+", _S.read(_e, "left"), 30), _S.read(_e, "x")]))}, {"b": _S.binary("-", 0.95, _S.binary("*", _S.read(_e, "k"), 0.4))}, {"w": 0}])])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("/", _S.read(_e, "d"), _S.read(_e, "L")), 0.8])), _S.binary("*", _S.call_value(_S.read(_e, "noise"), [_S.binary("-", _S.binary("*", _S.read(_e, "d"), 0.12), _S.binary("*", _S.read(_e, "t"), 40)), _S.read(_e, "S")]), 0.12)), _S.binary("*", 0.08, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_e, "d"), 0.35), _S.binary("*", _S.read(_e, "ph"), 9))])))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("+", 0.5, _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "d"), 0.09), _S.binary("*", _S.read(_e, "ph"), 2))]), _S.binary("/", _S.read(_e, "d"), _S.read(_e, "L"))), 0.8))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "d", _S.unary("-", _S.read(_e, "x")))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "d"), _S.read(_e, "HOT")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary(">", _S.read(_e, "u"), 1))):
		return null
	_S.define(_e, "w", _S.binary("+", 0.7, _S.binary("*", _S.binary("*", 2.3, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "u")), 1.4])), _S.binary("+", 0.9, _S.binary("*", 0.1, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_e, "d"), 0.8), _S.binary("*", _S.read(_e, "ph"), 12))]))))))
	_S.define(_e, "v", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "y"), _S.call_value(_S.read(_e, "yAt"), [_S.read(_e, "d")]))]), _S.read(_e, "w")))
	if _S.truth(_S.binary(">", _S.read(_e, "v"), 1)):
		return null
	_S.define(_e, "h", _S.call_value(_S.read(_e, "heat"), [_S.read(_e, "d")]))
	return ((_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.8)) else _S.prop(_S.read(_e, "F"), 7)) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.38)) else ((_S.prop(_S.read(_e, "F"), 7) if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.75)) else (_S.prop(_S.read(_e, "F"), 6) if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.6)) else _S.prop(_S.read(_e, "F"), 5))) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.7)) else (_S.prop(_S.read(_e, "F"), 5) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else _S.prop(_S.read(_e, "F"), 4))))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.1, 0.28])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	var _v2 = _S.call_value(_S.read(_e, "wake"), [_S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [4, _S.binary("*", _S.read(_e, "L"), 0.5)])), _S.binary("+", 0.5, _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.5), 1])), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [10, 80])), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 60), 50]), _S.read(_e, "age"), _S.binary("*", _S.read(_e, "V"), 0.35), 3, 260])
	_S.define(_e, "x", _S.prop(_v2, 0))
	_S.define(_e, "y", _S.prop(_v2, 1))
	_S.define(_e, "vx", _S.prop(_v2, 2))
	_S.define(_e, "vy", _S.prop(_v2, 3))
	if _S.truth(_S.binary(">", _S.read(_e, "x"), _S.binary("+", _S.read(_e, "left"), 8))):
		_S.call_value(_S.read(_e, "spark"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "vx"), _S.read(_e, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life"))), _S.read(_e, "SP"), 0.45, 0.012, 6])
	return null
