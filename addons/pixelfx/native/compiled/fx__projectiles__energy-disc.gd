@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/energy-disc.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "beat", _S.import_value("fx/projectiles/_lib.js", "beat"))
	_S.define(_e, "wake", _S.import_value("fx/projectiles/_lib.js", "wake"))
	_S.define(_e, "spark", _S.import_value("fx/projectiles/_lib.js", "spark"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Energy disc"}, {"desc": "A sawblade of crackling energy spinning flat out as it flies: hooked teeth bright on their leading edges, a white hub, spiral arms churning, sparks flung off the teeth."}, {"tags": ["projectile", "disc", "saw", "energy", "sci-fi", "directional", "loop"]}, {"size": [120, 52]}, {"origin": [92, 26]}, {"duration": 0.5}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0a0f2e", "#172a78", "#2550d0", "#3f8cff", "#7cc8ff", "#c8f0ff", "#ffffff"]}, {"size": 9}, {"teeth": 8}, {"speed": 220}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.prop(_S.read(_e, "o"), "size"))
	_S.define(_e, "N", _S.prop(_S.read(_e, "o"), "teeth"))
	_S.define(_e, "V", _S.prop(_S.read(_e, "o"), "speed"))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "left", _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 2))
	_S.define(_e, "rot", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), 3), _S.read(_e, "t")), _S.read(_e, "D")))
	_S.define(_e, "seg", _S.binary("/", _S.read(_e, "TAU"), _S.read(_e, "N")))
	_S.define(_e, "frac", _S.function_value(_e, "_f1"))
	_S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t"), _S.read(_e, "D"), 8, _S.binary("+", _S.read(_e, "S"), 4), _S.function_value(_e, "_f2"), _S.function_value(_e, "_f3")])
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.unary("-", 2), 0, _S.unary("-", 26), 0, 8, _S.prop(_S.read(_e, "C"), 3), 0.35])
	_S.define(_e, "SP", [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)])
	_S.call_value(_S.read(_e, "beat"), [_S.read(_e, "t"), _S.read(_e, "D"), 20, _S.read(_e, "S"), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "R")), 5), _S.binary("-", _S.unary("-", _S.read(_e, "R")), 5), _S.binary("+", _S.read(_e, "R"), 5), _S.binary("+", _S.read(_e, "R"), 5), _S.function_value(_e, "_f7")])
	_S.define(_e, "fr", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 30), 0.000001)]))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "j"), 3)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "g", _S.call_value(_S.read(_v3, "rng"), [_S.read(_v3, "fr"), _S.read(_v3, "j"), _S.read(_v3, "S")]))
		_S.define(_v3, "a0", _S.invoke(_S.read(_v3, "g"), "range", [0, _S.read(_v3, "TAU")]))
		_S.define(_v3, "pts", [])
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<=", _S.read(_v4, "i"), 4)):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "rr", _S.binary("+", 2.5, _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v5, "R"), 3), _S.read(_v5, "i")), 4)))
			_S.define(_v5, "a", _S.binary("+", _S.binary("+", _S.read(_v5, "a0"), _S.binary("*", _S.read(_v5, "i"), 0.25)), (_S.invoke(_S.read(_v5, "g"), "range", [_S.unary("-", 0.35), 0.35]) if _S.truth(_S.read(_v5, "i")) else 0)))
			_S.invoke(_S.read(_v5, "pts"), "push", [[_S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "rr")), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "rr"))]])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
		_S.invoke(_S.read(_v3, "p"), "polyline", [_S.read(_v3, "pts"), (_S.prop(_S.read(_v3, "C"), 6) if _S.truth(_S.read(_v3, "j")) else _S.read(_v3, "WHITE"))])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "j", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "ring", [0, 0, _S.binary("+", _S.read(_e, "R"), 0.5), 1, _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, 30, _S.prop(_S.read(_e, "C"), 3), 0.4])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, 6, _S.prop(_S.read(_e, "C"), 5), 0.35])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "rot")]), _S.read(_e, "R")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "rot")]), _S.read(_e, "R")), 5, _S.prop(_S.read(_e, "C"), 6), 0.4])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("-", _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.12, 0.22])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "side", (_S.unary("-", 1) if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.5])) else 1))
	_S.define(_e, "x0", _S.binary("-", _S.unary("-", 2), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [180, 260]))))
	_S.define(_e, "len", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [8, 16]), _S.binary("+", 0.5, _S.read(_e, "k"))))
	_S.define(_e, "y", _S.binary("*", _S.read(_e, "side"), _S.binary("+", _S.read(_e, "R"), _S.invoke(_S.read(_e, "r"), "range", [0.5, 3]))))
	if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "x0"), _S.read(_e, "len")), _S.read(_e, "left"))):
		return null
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x0"), _S.read(_e, "y"), _S.binary("-", _S.read(_e, "x0"), _S.read(_e, "len")), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.35)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.7)) else _S.prop(_S.read(_e, "C"), 3))), _S.function_value(_e, "_f4")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.65)) else _S.binary("/", _S.binary("-", 1, _S.read(_e, "u")), 0.35))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.12, 0.3])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "a", _S.binary("+", _S.binary("-", _S.read(_e, "rot"), _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]), 0)), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")])))
	_S.define(_e, "tip", _S.binary("+", _S.read(_e, "R"), 3.5))
	_S.define(_e, "x0", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "tip")))
	_S.define(_e, "y0", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "tip")))
	_S.define(_e, "v", _S.invoke(_S.read(_e, "r"), "range", [120, 230]))
	var _v0 = _S.call_value(_S.read(_e, "wake"), [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")])), _S.read(_e, "v")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "v")), _S.read(_e, "age"), _S.binary("*", _S.read(_e, "V"), 0.6), 2.4, 60])
	_S.define(_e, "x", _S.prop(_v0, 0))
	_S.define(_e, "y", _S.prop(_v0, 1))
	_S.define(_e, "vx", _S.prop(_v0, 2))
	_S.define(_e, "vy", _S.prop(_v0, 3))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "x"), _S.binary("+", _S.read(_e, "left"), 8)), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "y")]), 23))):
		_S.call_value(_S.read(_e, "spark"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "vx"), _S.read(_e, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life"))), _S.read(_e, "SP"), 0.45, 0.014, 7])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "r", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y")]))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "y"), _S.read(_e, "x")]))
	if _S.truth(_S.binary(">", _S.read(_e, "r"), _S.binary("+", _S.read(_e, "R"), 4.6))):
		return null
	if _S.truth(_S.binary("<=", _S.read(_e, "r"), _S.read(_e, "R"))):
		var _v1 = _S.scope(_e)
		if _S.truth(_S.binary("<", _S.read(_v1, "r"), 1.8)):
			return _S.read(_v1, "WHITE")
		if _S.truth(_S.binary("<", _S.read(_v1, "r"), 2.9)):
			return _S.prop(_S.read(_v1, "C"), 1)
		if _S.truth(_S.binary(">", _S.read(_v1, "r"), _S.binary("-", _S.read(_v1, "R"), 1.1))):
			return _S.prop(_S.read(_v1, "C"), 5)
		_S.define(_v1, "arm", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("-", _S.binary("*", 3, _S.binary("-", _S.read(_v1, "th"), _S.binary("*", _S.read(_v1, "rot"), 0.5))), _S.binary("*", _S.read(_v1, "r"), 0.85))]))
		return (_S.prop(_S.read(_v1, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v1, "arm"), 0.65)) else (_S.prop(_S.read(_v1, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v1, "arm"), 0.2)) else (_S.prop(_S.read(_v1, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v1, "arm"), _S.unary("-", 0.3))) else _S.prop(_S.read(_v1, "C"), 2))))
	_S.define(_e, "ph", _S.call_value(_S.read(_e, "frac"), [_S.binary("/", _S.binary("-", _S.read(_e, "th"), _S.read(_e, "rot")), _S.read(_e, "seg"))]))
	_S.define(_e, "h", _S.binary("*", 4.2, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "ph"), 1.4])))
	if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "r"), _S.read(_e, "R")), _S.read(_e, "h"))):
		return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "ph"), 0.86)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "ph"), 0.6)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "ph"), 0.35)) else _S.prop(_S.read(_e, "C"), 4))))
	if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "r"), _S.read(_e, "R")), 1.6)):
		return _S.prop(_S.read(_e, "C"), 2)
	return null
