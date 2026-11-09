@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/tractor-beam.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Ghosts", _S.import_value("fx/scifi/_lib.js", "Ghosts"))
	_S.define(_e, "flash", _S.import_value("fx/scifi/_lib.js", "flash"))
	_S.define(_e, "since", _S.import_value("fx/scifi/_lib.js", "since"))
	_S.define(_e, "haul", _S.function_value(_e, "_f0"))
	_S.define(_e, "rockAt", _S.function_value(_e, "_f1"))
	_S.define(_e, "rock", _S.function_value(_e, "_f2"))
	_S.define(_e, "pod", _S.function_value(_e, "_f7"))
	_S.define(_e, "hoop", _S.function_value(_e, "_f10"))
	_S.define(_e, "setup", _S.function_value(_e, "_f11"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f14"))
	_S.define(_e, "draw", _S.function_value(_e, "_f15"))
	_S.define(_e, "meta", _S.merge([{"name": "Tractor beam"}, {"desc": "A hovering pod projects a cone of light to the floor; rocks tear loose in puffs of dust and spiral up spinning into the lens while rings of light climb the beam."}, {"tags": ["scifi", "beam", "tractor", "lift", "abduct", "debris", "ground", "loop"]}, {"size": [120, 132]}, {"origin": [60, 114]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#06161a", "#0b2e33", "#11505a", "#1a7f84", "#2bb5a8", "#7ef0c8", "#d6fff0", "#ffffff"]}, {"hull": ["#0d0f17", "#1c2030", "#2e3448", "#4a5470", "#7a86a8", "#b8c4e0"]}, {"stone": ["#1a1622", "#2e2838", "#4a4258", "#6d6480", "#9a90aa"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "LENS", _S.unary("-", 84))
	_S.define(_e, "TOPW", 5.5)
	_S.define(_e, "BOTW", 32)
	_S.define(_e, "half", _S.function_value(_e, "_f25"))
	_S.define(_e, "POP", 0.1)
	_S.define(_e, "HOVER", 0.32)
	_S.define(_e, "RISE", 1.4)
	_S.define(_e, "LIFE", _S.binary("+", _S.binary("+", _S.read(_e, "POP"), _S.read(_e, "HOVER")), _S.read(_e, "RISE")))
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "r0", _S.arg(_args, 0))
	_S.define(_e, "th0", _S.arg(_args, 1))
	_S.define(_e, "dir", _S.arg(_args, 2))
	_S.define(_e, "turns", _S.arg(_args, 3))
	_S.define(_e, "k", _S.arg(_args, 4))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "pow", [_S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "k")]), 1.8]))
	_S.define(_e, "y", _S.call_value(_S.read(_e, "lerp"), [_S.unary("-", 2), _S.binary("+", _S.read(_e, "LENS"), 5), _S.read(_e, "s")]))
	_S.define(_e, "th", _S.binary("+", _S.read(_e, "th0"), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "dir"), _S.read(_e, "TAU")), _S.read(_e, "turns")), _S.read(_e, "s"))))
	_S.define(_e, "rr", _S.binary("*", _S.binary("*", _S.read(_e, "r0"), _S.binary("/", _S.call_value(_S.read(_e, "half"), [_S.read(_e, "y")]), _S.read(_e, "BOTW"))), _S.binary("-", 1, _S.binary("*", 0.5, _S.read(_e, "s")))))
	return [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "rr")), _S.read(_e, "y"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")])]

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "lift", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "age"), _S.read(_e, "POP")), _S.read(_e, "HOVER")), _S.read(_e, "RISE"))]))
	if _S.truth(_S.binary(">", _S.read(_e, "lift"), 0)):
		var _v0 = _S.scope(_e)
		var _v1 = _S.call_value(_S.read(_v0, "haul"), [_S.prop(_S.read(_v0, "r"), "r0"), _S.prop(_S.read(_v0, "r"), "th0"), _S.prop(_S.read(_v0, "r"), "dir"), 1.3, _S.read(_v0, "lift")])
		_S.define(_v0, "x", _S.prop(_v1, 0))
		_S.define(_v0, "y", _S.prop(_v1, 1))
		_S.define(_v0, "z", _S.prop(_v1, 2))
		var _v2 = _S.call_value(_S.read(_v0, "haul"), [_S.prop(_S.read(_v0, "r"), "r0"), _S.prop(_S.read(_v0, "r"), "th0"), _S.prop(_S.read(_v0, "r"), "dir"), 1.3, _S.binary("-", _S.read(_v0, "lift"), 0.07)])
		_S.define(_v0, "x1", _S.prop(_v2, 0))
		_S.define(_v0, "y1", _S.prop(_v2, 1))
		return _S.merge([{"x": _S.read(_v0, "x")}, {"y": _S.read(_v0, "y")}, {"z": _S.read(_v0, "z")}, {"px": _S.read(_v0, "x1")}, {"py": _S.read(_v0, "y1")}, {"size": _S.binary("*", _S.prop(_S.read(_v0, "r"), "s"), _S.binary("-", 1, _S.binary("*", 0.6, _S.binary("**", _S.read(_v0, "lift"), 2.5))))}, {"a": _S.binary("+", _S.prop(_S.read(_v0, "r"), "a0"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v0, "r"), "va"), _S.read(_v0, "age")), _S.binary("+", 0.3, _S.binary("*", _S.read(_v0, "lift"), 2))))}, {"lift": _S.read(_v0, "lift")}])
	_S.define(_e, "y", (_S.call_value(_S.read(_e, "lerp"), [3, _S.unary("-", 2), _S.binary("/", _S.read(_e, "age"), _S.read(_e, "POP"))]) if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.read(_e, "POP"))) else _S.binary("-", _S.unary("-", 2), _S.binary("*", 2, _S.call_value(_S.read(_e, "smooth"), [0, _S.read(_e, "HOVER"), _S.binary("-", _S.read(_e, "age"), _S.read(_e, "POP"))])))))
	_S.define(_e, "wob", (_S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 55), _S.binary("*", _S.prop(_S.read(_e, "r"), "th0"), 9))]), 0.7) if _S.truth(_S.binary(">", _S.read(_e, "age"), _S.read(_e, "POP"))) else 0))
	return _S.merge([{"x": _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "r"), "th0")]), _S.prop(_S.read(_e, "r"), "r0")), _S.read(_e, "wob"))}, {"y": _S.read(_e, "y")}, {"z": 1}, {"size": _S.prop(_S.read(_e, "r"), "s")}, {"a": _S.binary("+", _S.prop(_S.read(_e, "r"), "a0"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "r"), "va"), _S.read(_e, "age")), 0.3))}, {"lift": 0}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "S", _S.arg(_args, 3))
	_S.define(_e, "C", _S.arg(_args, 4))
	_S.define(_e, "back", _S.arg(_args, 5))
	_S.define(_e, "n", 6)
	_S.define(_e, "R", _S.invoke(_S.read(_e, "Math"), "max", [0.9, _S.prop(_S.read(_e, "q"), "size")]))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "q"), "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "q"), "a")]))
	_S.define(_e, "lit", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "S"), 4), _S.prop(_S.read(_e, "C"), 6), _S.binary("+", 0.3, _S.binary("*", 0.6, _S.prop(_S.read(_e, "q"), "lift")))]))
	_S.define(_e, "rad", _S.function_value(_e, "_f3"))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_e, "q"), "lift"), 0.15), func(): return _S.unary("!", _S.read(_e, "back")))):
		var _v3 = _S.scope(_e)
		_S.invoke(_S.read(_v3, "p"), "line", [_S.prop(_S.read(_v3, "q"), "px"), _S.prop(_S.read(_v3, "q"), "py"), _S.prop(_S.read(_v3, "q"), "x"), _S.prop(_S.read(_v3, "q"), "y"), _S.function_value(_v3, "_f4"), _S.function_value(_v3, "_f5")])
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "i", 1)
		while _S.truth(_S.binary("<=", _S.read(_v4, "i"), 3)):
			_S.invoke(_S.read(_v4, "p"), "disc", [_S.call_value(_S.read(_v4, "lerp"), [_S.prop(_S.read(_v4, "q"), "x"), _S.prop(_S.read(_v4, "q"), "px"), _S.binary("/", _S.read(_v4, "i"), 3)]), _S.binary("+", _S.call_value(_S.read(_v4, "lerp"), [_S.prop(_S.read(_v4, "q"), "y"), _S.prop(_S.read(_v4, "q"), "py"), _S.binary("/", _S.read(_v4, "i"), 3)]), 1), _S.binary("*", _S.read(_v4, "R"), _S.binary("+", 0.5, _S.binary("*", 0.25, _S.read(_v4, "i")))), _S.call_value(_S.read(_v4, "mix"), [_S.prop(_S.read(_v4, "S"), 3), _S.prop(_S.read(_v4, "C"), 5), 0.4]), _S.binary("*", _S.binary("*", 0.22, _S.binary("-", 1, _S.binary("/", _S.read(_v4, "i"), 4))), _S.prop(_S.read(_v4, "q"), "lift"))])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "q"), "x"), _S.read(_e, "R")), 2), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "q"), "y"), _S.read(_e, "R")), 2), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "q"), "x"), _S.read(_e, "R")), 2), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "q"), "y"), _S.read(_e, "R")), 2), _S.function_value(_e, "_f6")])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "back")), func(): return _S.binary(">", _S.prop(_S.read(_e, "q"), "lift"), 0))):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "q"), "x"), _S.binary("-", _S.prop(_S.read(_e, "q"), "y"), _S.read(_e, "R")), _S.binary("+", 5, _S.read(_e, "R")), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.25, _S.prop(_S.read(_e, "q"), "lift"))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ang", _S.arg(_args, 0))
	_S.define(_e, "f", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("*", _S.binary("/", _S.read(_e, "ang"), _S.read(_e, "TAU")), _S.read(_e, "n")), _S.read(_e, "n")), _S.read(_e, "n")), _S.read(_e, "n")))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "f")]))
	_S.define(_e, "k", _S.binary("-", _S.read(_e, "f"), _S.read(_e, "i")))
	return _S.binary("*", _S.read(_e, "R"), _S.binary("+", 0.75, _S.binary("*", 0.35, _S.call_value(_S.read(_e, "lerp"), [_S.call_value(_S.read(_e, "rand"), [_S.prop(_S.read(_e, "r"), "id"), _S.read(_e, "i")]), _S.call_value(_S.read(_e, "rand"), [_S.prop(_S.read(_e, "r"), "id"), _S.binary("%", _S.binary("+", _S.read(_e, "i"), 1), _S.read(_e, "n"))]), _S.read(_e, "k")]))))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "C"), 3))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", 0.7, _S.read(_e, "u"))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "q"), "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "q"), "y")))
	_S.define(_e, "u", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sa"))))
	_S.define(_e, "v", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ca"))))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "u"), _S.read(_e, "v")]))
	_S.define(_e, "e", _S.call_value(_S.read(_e, "rad"), [_S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "v"), _S.read(_e, "u")])]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "e"), 0.8))):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "S"), 0) if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "e"))) else ((_S.prop(_S.read(_e, "S"), 3) if _S.truth(_S.binary("<", _S.read(_e, "dy"), _S.binary("*", _S.unary("-", 0.3), _S.read(_e, "R")))) else _S.prop(_S.read(_e, "S"), 1)) if _S.truth(_S.read(_e, "back")) else ((_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_e, "q"), "lift"), 0.35), func(): return _S.binary(">", _S.read(_e, "d"), _S.binary("-", _S.read(_e, "e"), 1)))) else _S.read(_e, "lit")) if _S.truth(_S.binary("<", _S.read(_e, "dy"), _S.binary("*", _S.unary("-", 0.45), _S.read(_e, "R")))) else ((_S.prop(_S.read(_e, "S"), 4) if _S.truth(_S.binary("<", _S.read(_e, "dx"), 0)) else _S.prop(_S.read(_e, "S"), 3)) if _S.truth(_S.binary("<", _S.read(_e, "dy"), _S.binary("*", _S.unary("-", 0.1), _S.read(_e, "R")))) else (_S.prop(_S.read(_e, "S"), 1) if _S.truth(_S.binary(">", _S.read(_e, "dy"), _S.binary("*", 0.35, _S.read(_e, "R")))) else _S.prop(_S.read(_e, "S"), 2)))))), "=", false)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "H", _S.arg(_args, 3))
	_S.define(_e, "y0", _S.arg(_args, 4))
	_S.define(_e, "y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y0")]))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 21), _S.binary("-", _S.read(_e, "y"), 12), 21, _S.binary("+", _S.read(_e, "y"), 6), _S.function_value(_e, "_f8")])
	var _v7 = _S.scope(_e)
	_S.define(_v7, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "i"), 6)):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "lx", _S.binary("+", _S.unary("-", 15), _S.binary("*", _S.read(_v8, "i"), 6)))
		_S.define(_v8, "k", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v8, "Math"), "cos", [_S.binary("*", _S.read(_v8, "TAU"), _S.binary("-", _S.binary("*", 4, _S.binary("/", _S.read(_v8, "t"), _S.read(_v8, "D"))), _S.binary("/", _S.read(_v8, "i"), 6)))]))))
		_S.invoke(_S.read(_v8, "p"), "px", [_S.read(_v8, "lx"), _S.binary("+", _S.read(_v8, "y"), 1), (_S.read(_v8, "WHITE") if _S.truth(_S.binary(">", _S.read(_v8, "k"), 0.7)) else (_S.prop(_S.read(_v8, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v8, "k"), 0.35)) else _S.prop(_S.read(_v8, "C"), 2)))])
		if _S.truth(_S.binary(">", _S.read(_v8, "k"), 0.5)):
			_S.invoke(_S.read(_v8, "p"), "glow", [_S.read(_v8, "lx"), _S.binary("+", _S.read(_v8, "y"), 1), 5, _S.prop(_S.read(_v8, "C"), 5), _S.binary("*", 0.35, _S.read(_v8, "k"))])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "ellipse", [0, _S.binary("+", _S.read(_e, "y"), 5.5), 7.5, 2.2, _S.function_value(_e, "_f9")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "yy", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "yy"), _S.read(_e, "y")))
	_S.define(_e, "cx", _S.binary("/", _S.read(_e, "x"), 8.5))
	_S.define(_e, "cy", _S.binary("/", _S.binary("+", _S.read(_e, "dy"), 5), 6))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "cy"), 0), func(): return _S.binary("<=", _S.binary("+", _S.binary("*", _S.read(_e, "cx"), _S.read(_e, "cx")), _S.binary("*", _S.read(_e, "cy"), _S.read(_e, "cy"))), 1))):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "d", _S.binary("+", _S.binary("*", _S.read(_v5, "cx"), _S.read(_v5, "cx")), _S.binary("*", _S.read(_v5, "cy"), _S.read(_v5, "cy"))))
		_S.define(_v5, "l", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_v5, "cx")), 0.6), _S.binary("*", _S.read(_v5, "cy"), 0.8)))
		_S.set_prop(_S.read(_v5, "out"), "c", (_S.prop(_S.read(_v5, "H"), 0) if _S.truth(_S.binary(">", _S.read(_v5, "d"), 0.8)) else (_S.read(_v5, "WHITE") if _S.truth(_S.binary(">", _S.read(_v5, "l"), 0.85)) else (_S.prop(_S.read(_v5, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v5, "l"), 0.6)) else (_S.prop(_S.read(_v5, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v5, "l"), 0.2)) else _S.prop(_S.read(_v5, "C"), 3))))), "=", false)
		return null
	_S.define(_e, "hx", _S.binary("/", _S.read(_e, "x"), 20))
	_S.define(_e, "hy", _S.binary("/", _S.binary("+", _S.read(_e, "dy"), 0.5), 4.5))
	if _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_e, "dy"), 0), func(): return _S.binary("<=", _S.binary("+", _S.binary("*", _S.read(_e, "hx"), _S.read(_e, "hx")), _S.binary("*", _S.read(_e, "hy"), _S.read(_e, "hy"))), 1))):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "d", _S.binary("+", _S.binary("*", _S.read(_v6, "hx"), _S.read(_v6, "hx")), _S.binary("*", _S.read(_v6, "hy"), _S.read(_v6, "hy"))))
		_S.define(_v6, "l", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_v6, "hx")), 0.55), _S.binary("*", _S.read(_v6, "hy"), 0.7)))
		_S.set_prop(_S.read(_v6, "out"), "c", (_S.prop(_S.read(_v6, "H"), 0) if _S.truth(_S.binary(">", _S.read(_v6, "d"), 0.88)) else (_S.prop(_S.read(_v6, "H"), 1) if _S.truth(_S.binary("===", _S.read(_v6, "dy"), _S.unary("-", 2))) else (_S.prop(_S.read(_v6, "H"), 5) if _S.truth(_S.binary(">", _S.read(_v6, "l"), 0.55)) else (_S.prop(_S.read(_v6, "H"), 4) if _S.truth(_S.binary(">", _S.read(_v6, "l"), 0.25)) else (_S.prop(_S.read(_v6, "H"), 3) if _S.truth(_S.binary(">", _S.read(_v6, "l"), _S.unary("-", 0.1))) else _S.prop(_S.read(_v6, "H"), 2)))))), "=", false)
		return null
	_S.define(_e, "w", _S.binary("-", 19.5, _S.binary("*", _S.read(_e, "dy"), 2.4)))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "dy"), 0), func(): return _S.binary("<=", _S.read(_e, "dy"), 5)), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.read(_e, "w")))):
		_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "H"), 0) if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("-", _S.read(_e, "w"), 1))) else (_S.prop(_S.read(_e, "H"), 2) if _S.truth(_S.binary("===", _S.read(_e, "dy"), 1)) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "dy"), 4), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 9))) else _S.prop(_S.read(_e, "H"), 1)))), "=", false)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.45)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.75)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.9)) else _S.prop(_S.read(_e, "C"), 3))))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "rx", _S.arg(_args, 2))
	_S.define(_e, "c", _S.arg(_args, 3))
	_S.define(_e, "back", _S.arg(_args, 4))
	_S.define(_e, "ry", _S.binary("*", _S.read(_e, "rx"), 0.17))
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	_S.define(_v9, "n", _S.invoke(_S.read(_v9, "Math"), "ceil", [_S.binary("*", _S.read(_v9, "rx"), 7)]))
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), _S.read(_v9, "n"))):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "g", _S.binary("*", _S.binary("/", _S.read(_v10, "i"), _S.read(_v10, "n")), _S.read(_v10, "TAU")))
		_S.define(_v10, "s", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "g")]))
		if _S.truth(_S.binary("===", _S.binary(">=", _S.read(_v10, "s"), 0), _S.read(_v10, "back"))):
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v10, "p"), "px", [_S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "g")]), _S.read(_v10, "rx")), _S.binary("+", _S.read(_v10, "y"), _S.binary("*", _S.read(_v10, "s"), _S.read(_v10, "ry"))), _S.read(_v10, "c")])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "key", ("" + _S.string(_S.prop(_S.read(_e, "o"), "seed")) + ":" + _S.string(_S.invoke(_S.prop(_S.read(_e, "o"), "palette"), "join", [])) + ":" + _S.string(_S.invoke(_S.prop(_S.read(_e, "o"), "stone"), "join", [])) + ""))
	if _S.truth(_S.invoke(_S.read(_e, "cache"), "has", [_S.read(_e, "key")])):
		return _S.invoke(_S.read(_e, "cache"), "get", [_S.read(_e, "key")])
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "stone"), 5]))
	_S.define(_e, "rn", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "rocks", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 7}]), _S.function_value(_e, "_f12")]))
	_S.define(_e, "g", _S.construct(_S.read(_e, "Ghosts"), [_S.read(_e, "D"), _S.merge([{"ground": _S.function_value(_e, "_f13")}, {"box": [_S.unary("-", 58), _S.unary("-", 112), 58, 14]}])]))
	for _v11 in _S.array(_S.read(_e, "rocks")):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "r", _v11)
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "x", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.prop(_S.read(_v13, "r"), "th0")]), _S.prop(_S.read(_v13, "r"), "r0")))
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v14, "i"), 5)):
			_S.invoke(_S.read(_v14, "g"), "add", [_S.binary("+", _S.prop(_S.read(_v14, "r"), "born"), 0.02), _S.prop(_S.read(_v14, "P"), "DUST"), _S.binary("+", _S.read(_v14, "x"), _S.invoke(_S.read(_v14, "rn"), "range", [_S.unary("-", 3), 3])), _S.unary("-", 1), _S.invoke(_S.read(_v14, "rn"), "range", [_S.unary("-", 34), 34]), _S.unary("-", _S.invoke(_S.read(_v14, "rn"), "range", [8, 26])), _S.invoke(_S.read(_v14, "rn"), "range", [0.5, 0.9]), _S.call_value(_S.read(_v14, "mix"), [_S.prop(_S.read(_v14, "S"), 3), _S.prop(_S.read(_v14, "C"), 4), 0.3]), _S.invoke(_S.read(_v14, "rn"), "range", [2.2, 3.6])])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "i", 1, "+=", true)
		var _v15 = _S.scope(_v13)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 6)):
			_S.invoke(_S.read(_v15, "g"), "add", [_S.binary("+", _S.prop(_S.read(_v15, "r"), "born"), 0.02), _S.prop(_S.read(_v15, "P"), "GRIT"), _S.binary("+", _S.read(_v15, "x"), _S.invoke(_S.read(_v15, "rn"), "range", [_S.unary("-", 2), 2])), _S.unary("-", 2), _S.invoke(_S.read(_v15, "rn"), "range", [_S.unary("-", 45), 45]), _S.unary("-", _S.invoke(_S.read(_v15, "rn"), "range", [60, 150])), _S.invoke(_S.read(_v15, "rn"), "range", [0.5, 0.9]), _S.invoke(_S.read(_v15, "rn"), "pick", [[_S.prop(_S.read(_v15, "S"), 2), _S.prop(_S.read(_v15, "S"), 3), _S.prop(_S.read(_v15, "S"), 4)]]), (2 if _S.truth(_S.invoke(_S.read(_v15, "rn"), "chance", [0.3])) else 1)])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), 16)):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "s", _S.invoke(_S.read(_v17, "rn"), "sign", []))
		_S.invoke(_S.read(_v17, "g"), "add", [_S.invoke(_S.read(_v17, "rn"), "range", [0, _S.read(_v17, "D")]), _S.prop(_S.read(_v17, "P"), "DUST"), _S.binary("*", _S.read(_v17, "s"), _S.invoke(_S.read(_v17, "rn"), "range", [14, 34])), _S.unary("-", _S.invoke(_S.read(_v17, "rn"), "range", [0, 3])), _S.binary("*", _S.unary("-", _S.read(_v17, "s")), _S.invoke(_S.read(_v17, "rn"), "range", [6, 22])), _S.unary("-", _S.invoke(_S.read(_v17, "rn"), "range", [4, 14])), _S.invoke(_S.read(_v17, "rn"), "range", [0.9, 1.5]), _S.call_value(_S.read(_v17, "mix"), [_S.prop(_S.read(_v17, "S"), 3), _S.prop(_S.read(_v17, "C"), 5), 0.3]), _S.invoke(_S.read(_v17, "rn"), "range", [2.6, 4.4])])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	_S.define(_e, "v", _S.merge([{"C": _S.read(_e, "C")}, {"S": _S.read(_e, "S")}, {"rocks": _S.read(_e, "rocks")}, {"g": _S.read(_e, "g")}]))
	_S.invoke(_S.read(_e, "cache"), "set", [_S.read(_e, "key"), _S.read(_e, "v")])
	return _S.read(_e, "v")

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"id": _S.binary("+", _S.read(_e, "i"), _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 31))}, {"born": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 7), _S.read(_e, "D")), _S.invoke(_S.read(_e, "rn"), "range", [_S.unary("-", 0.06), 0.06]))}, {"r0": _S.invoke(_S.read(_e, "rn"), "range", [8, 25])}, {"th0": _S.binary("+", (0 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.prop(_S.read(_e, "Math"), "PI")), _S.invoke(_S.read(_e, "rn"), "range", [_S.unary("-", 0.45), 0.45]))}, {"dir": _S.invoke(_S.read(_e, "rn"), "sign", [])}, {"s": _S.invoke(_S.read(_e, "rn"), "range", [2.4, 4.4])}, {"a0": _S.invoke(_S.read(_e, "rn"), "range", [0, _S.read(_e, "TAU")])}, {"va": _S.invoke(_S.read(_e, "rn"), "range", [_S.unary("-", 7), 7])}])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	var _v18 = _S.call_value(_S.read(_e, "setup"), [_S.read(_e, "o")])
	_S.define(_e, "C", _S.prop(_v18, "C"))
	_S.define(_e, "S", _S.prop(_v18, "S"))
	_S.define(_e, "rocks", _S.prop(_v18, "rocks"))
	_S.define(_e, "g", _S.prop(_v18, "g"))
	var _v19 = _S.scope(_e)
	_S.define(_v19, "y", _S.unary("-", 6))
	while _S.truth(_S.binary("<=", _S.read(_v19, "y"), 6)):
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "x", _S.unary("-", _S.read(_v20, "BOTW")))
		while _S.truth(_S.binary("<=", _S.read(_v20, "x"), _S.read(_v20, "BOTW"))):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "d", _S.invoke(_S.read(_v21, "Math"), "hypot", [_S.binary("/", _S.binary("+", _S.read(_v21, "x"), 0.5), _S.read(_v21, "BOTW")), _S.binary("/", _S.binary("+", _S.read(_v21, "y"), 0.5), 5.5)]))
			if _S.truth(_S.binary("<=", _S.read(_v21, "d"), 1)):
				_S.invoke(_S.read(_v21, "p"), "blend", [_S.binary("+", _S.read(_v21, "x"), 0.5), _S.binary("+", _S.read(_v21, "y"), 0.5), (_S.prop(_S.read(_v21, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v21, "d"), 0.35)) else _S.prop(_S.read(_v21, "C"), 5)), _S.binary("+", 0.2, _S.binary("*", 0.55, _S.binary("**", _S.binary("-", 1, _S.read(_v21, "d")), 1.5)))])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "x", 1, "+=", true)
		_v19 = _S.iteration(_v19)
		_S.write(_v19, "y", 1, "+=", true)
	_S.call_value(_S.read(_e, "hoop"), [_S.read(_e, "p"), 0, _S.binary("+", _S.read(_e, "BOTW"), 1), _S.prop(_S.read(_e, "C"), 5), true])
	_S.invoke(_S.invoke(_S.read(_e, "g"), "at", [_S.read(_e, "t")]), "draw", [_S.read(_e, "p"), "back"])
	for _v22 in _S.array(_S.read(_e, "rocks")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "r", _v22)
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "age", _S.call_value(_S.read(_v24, "since"), [_S.read(_v24, "t"), _S.prop(_S.read(_v24, "r"), "born"), _S.read(_v24, "D")]))
		if _S.truth(_S.binary(">=", _S.read(_v24, "age"), _S.read(_v24, "LIFE"))):
			continue
		_S.define(_v24, "q", _S.call_value(_S.read(_v24, "rockAt"), [_S.read(_v24, "r"), _S.read(_v24, "age")]))
		if _S.truth(_S.logical("&&", _S.binary("<", _S.prop(_S.read(_v24, "q"), "z"), 0), func(): return _S.binary(">", _S.prop(_S.read(_v24, "q"), "lift"), 0))):
			_S.call_value(_S.read(_v24, "rock"), [_S.read(_v24, "p"), _S.read(_v24, "q"), _S.read(_v24, "r"), _S.read(_v24, "S"), _S.read(_v24, "C"), true])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	var _v25 = _S.call_value(_S.read(_e, "setup"), [_S.read(_e, "o")])
	_S.define(_e, "C", _S.prop(_v25, "C"))
	_S.define(_e, "S", _S.prop(_v25, "S"))
	_S.define(_e, "rocks", _S.prop(_v25, "rocks"))
	_S.define(_e, "g", _S.prop(_v25, "g"))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "hull"), 6]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "podY", _S.binary("+", _S.binary("-", _S.read(_e, "LENS"), 5), _S.binary("*", 1.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "TAU"), 2), _S.read(_e, "ph"))]))))
	var _v26 = _S.scope(_e)
	_S.define(_v26, "y", _S.invoke(_S.read(_v26, "Math"), "ceil", [_S.binary("+", _S.read(_v26, "LENS"), 3)]))
	while _S.truth(_S.binary("<", _S.read(_v26, "y"), 0)):
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "w", _S.call_value(_S.read(_v27, "half"), [_S.read(_v27, "y")]))
		_S.define(_v27, "v", _S.binary("/", _S.binary("-", _S.read(_v27, "y"), _S.read(_v27, "LENS")), _S.unary("-", _S.read(_v27, "LENS"))))
		_S.define(_v27, "pulse", (1 if _S.truth(_S.binary("<", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_v27, "v"), 3.2), _S.binary("*", _S.read(_v27, "ph"), 6)), 1), 1), 1), 0.08)) else 0))
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "x", _S.binary("-", _S.invoke(_S.read(_v28, "Math"), "floor", [_S.unary("-", _S.read(_v28, "w"))]), 1))
		while _S.truth(_S.binary("<=", _S.read(_v28, "x"), _S.invoke(_S.read(_v28, "Math"), "ceil", [_S.read(_v28, "w")]))):
			var _v29 = _S.scope(_v28)
			_S.define(_v29, "q", _S.binary("/", _S.invoke(_S.read(_v29, "Math"), "abs", [_S.binary("+", _S.read(_v29, "x"), 0.5)]), _S.read(_v29, "w")))
			if _S.truth(_S.binary(">", _S.read(_v29, "q"), _S.binary("+", 1, _S.binary("/", 1.2, _S.read(_v29, "w"))))):
				_v28 = _S.iteration(_v28)
				_S.write(_v28, "x", 1, "+=", true)
				continue
			if _S.truth(_S.binary(">", _S.read(_v29, "q"), 1)):
				_S.invoke(_S.read(_v29, "p"), "dot", [_S.read(_v29, "x"), _S.read(_v29, "y"), _S.prop(_S.read(_v29, "C"), 4), _S.binary("-", 0.6, _S.binary("*", 0.3, _S.read(_v29, "v")))])
			else:
				if _S.truth(_S.binary(">", _S.read(_v29, "q"), _S.binary("-", 1, _S.binary("/", 1, _S.read(_v29, "w"))))):
					_S.invoke(_S.read(_v29, "p"), "px", [_S.read(_v29, "x"), _S.read(_v29, "y"), (_S.read(_v29, "WHITE") if _S.truth(_S.binary("<", _S.read(_v29, "v"), 0.2)) else (_S.prop(_S.read(_v29, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v29, "v"), 0.45)) else _S.prop(_S.read(_v29, "C"), 5)))])
				else:
					var _v30 = _S.scope(_v29)
					_S.define(_v30, "curtain", 0)
					var _v31 = _S.scope(_v30)
					_S.define(_v31, "s", 0)
					while _S.truth(_S.binary("<", _S.read(_v31, "s"), 4)):
						if _S.truth(_S.binary("<", _S.invoke(_S.read(_v31, "Math"), "abs", [_S.binary("-", _S.binary("-", _S.binary("/", _S.binary("+", _S.read(_v31, "x"), 0.5), _S.read(_v31, "w")), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v31, "rand"), [_S.prop(_S.read(_v31, "o"), "seed"), _S.read(_v31, "s"), 7]), 0.5), 1.4)), _S.binary("*", 0.12, _S.invoke(_S.read(_v31, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v31, "TAU"), _S.read(_v31, "ph")), _S.binary("*", _S.read(_v31, "s"), 1.7))])))]), 0.045)):
							_S.write(_v31, "curtain", 1, "=", false)
						_v31 = _S.iteration(_v31)
						_S.write(_v31, "s", 1, "+=", true)
					_S.define(_v30, "core", _S.binary("*", _S.binary("**", _S.binary("-", 1, _S.read(_v30, "q")), 2), _S.binary("**", _S.binary("-", 1, _S.read(_v30, "v")), 1.6)))
					_S.define(_v30, "a", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", 0.08, _S.binary("*", 0.22, _S.binary("**", _S.read(_v30, "q"), 4))), _S.binary("*", 0.6, _S.read(_v30, "core"))), _S.binary("*", 0.12, _S.read(_v30, "pulse"))), _S.binary("*", 0.18, _S.read(_v30, "curtain"))))
					_S.invoke(_S.read(_v30, "p"), "blend", [_S.binary("+", _S.read(_v30, "x"), 0.5), _S.binary("+", _S.read(_v30, "y"), 0.5), (_S.read(_v30, "WHITE") if _S.truth(_S.binary(">", _S.read(_v30, "core"), 0.45)) else (_S.prop(_S.read(_v30, "C"), 5) if _S.truth(_S.logical("||", _S.logical("||", _S.read(_v30, "curtain"), func(): return _S.read(_v30, "pulse")), func(): return _S.binary("<", _S.read(_v30, "v"), 0.35))) else _S.prop(_S.read(_v30, "C"), 4))), _S.call_value(_S.read(_v30, "clamp"), [_S.read(_v30, "a")])])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "x", 1, "+=", true)
		if _S.truth(_S.binary("===", _S.binary("&", _S.read(_v27, "y"), 3), 0)):
			for _v32 in _S.array([_S.unary("-", 1), 1]):
				var _v33 = _S.scope(_v27)
				_S.define(_v33, "s", _v32)
				_S.invoke(_S.read(_v33, "p"), "glow", [_S.binary("*", _S.read(_v33, "s"), _S.read(_v33, "w")), _S.read(_v33, "y"), 8, _S.prop(_S.read(_v33, "C"), 4), 0.18])
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "y", 1, "+=", true)
	var _v34 = _S.scope(_e)
	_S.define(_v34, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v34, "i"), 5)):
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "k", _S.binary("/", _S.call_value(_S.read(_v35, "since"), [_S.read(_v35, "t"), _S.binary("*", _S.binary("/", _S.read(_v35, "i"), 5), _S.read(_v35, "D")), _S.read(_v35, "D")]), 1.1))
		if _S.truth(_S.binary(">=", _S.read(_v35, "k"), 1)):
			_v34 = _S.iteration(_v34)
			_S.write(_v34, "i", 1, "+=", true)
			continue
		_S.define(_v35, "y", _S.call_value(_S.read(_v35, "lerp"), [0, _S.binary("+", _S.read(_v35, "LENS"), 5), _S.invoke(_S.read(_v35, "ease"), "inQuad", [_S.read(_v35, "k")])]))
		_S.define(_v35, "w", _S.binary("+", _S.call_value(_S.read(_v35, "half"), [_S.read(_v35, "y")]), 1))
		_S.call_value(_S.read(_v35, "hoop"), [_S.read(_v35, "p"), _S.read(_v35, "y"), _S.read(_v35, "w"), _S.prop(_S.read(_v35, "C"), 3), true])
		_S.call_value(_S.read(_v35, "hoop"), [_S.read(_v35, "p"), _S.read(_v35, "y"), _S.read(_v35, "w"), (_S.read(_v35, "WHITE") if _S.truth(_S.binary("<", _S.read(_v35, "k"), 0.12)) else _S.prop(_S.read(_v35, "C"), 6)), false])
		_S.invoke(_S.read(_v35, "p"), "glow", [0, _S.binary("+", _S.read(_v35, "y"), _S.binary("*", _S.read(_v35, "w"), 0.17)), _S.binary("+", _S.read(_v35, "w"), 4), _S.prop(_S.read(_v35, "C"), 5), 0.12])
		_v34 = _S.iteration(_v34)
		_S.write(_v34, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 22, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 1), _S.function_value(_e, "_f16"), _S.function_value(_e, "_f17")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 9, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 3), _S.function_value(_e, "_f19"), _S.function_value(_e, "_f20")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 46, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 2), _S.function_value(_e, "_f21"), _S.function_value(_e, "_f22")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 8, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 4), 0.5, _S.function_value(_e, "_f24")])
	for _v41 in _S.array(_S.read(_e, "rocks")):
		var _v42 = _S.scope(_e)
		_S.define(_v42, "r", _v41)
		var _v43 = _S.scope(_v42)
		_S.define(_v43, "age", _S.call_value(_S.read(_v43, "since"), [_S.read(_v43, "t"), _S.prop(_S.read(_v43, "r"), "born"), _S.read(_v43, "D")]))
		if _S.truth(_S.binary(">=", _S.read(_v43, "age"), _S.read(_v43, "LIFE"))):
			continue
		_S.define(_v43, "q", _S.call_value(_S.read(_v43, "rockAt"), [_S.read(_v43, "r"), _S.read(_v43, "age")]))
		if _S.truth(_S.logical("||", _S.binary(">=", _S.prop(_S.read(_v43, "q"), "z"), 0), func(): return _S.binary("<=", _S.prop(_S.read(_v43, "q"), "lift"), 0))):
			_S.call_value(_S.read(_v43, "rock"), [_S.read(_v43, "p"), _S.read(_v43, "q"), _S.read(_v43, "r"), _S.read(_v43, "S"), _S.read(_v43, "C"), false])
		if _S.truth(_S.binary(">", _S.read(_v43, "age"), _S.binary("-", _S.read(_v43, "LIFE"), 0.1))):
			_S.call_value(_S.read(_v43, "sparkle"), [_S.read(_v43, "p"), _S.prop(_S.read(_v43, "q"), "x"), _S.binary("+", _S.read(_v43, "LENS"), 3), 5, _S.prop(_S.read(_v43, "C"), 6), _S.prop(_S.read(_v43, "C"), 5), 0.5])
	for _v44 in _S.array(_S.read(_e, "rocks")):
		var _v45 = _S.scope(_e)
		_S.define(_v45, "r", _v44)
		_S.call_value(_S.read(_v45, "flash"), [_S.read(_v45, "p"), _S.read(_v45, "t"), _S.binary("-", _S.binary("+", _S.prop(_S.read(_v45, "r"), "born"), _S.read(_v45, "LIFE")), 0.08), 0, _S.binary("+", _S.read(_v45, "LENS"), 3), 30, _S.prop(_S.read(_v45, "C"), 5), 0.7, 0.28])
	_S.invoke(_S.invoke(_S.read(_e, "g"), "at", [_S.read(_e, "t")]), "draw", [_S.read(_e, "p"), "front"])
	_S.call_value(_S.read(_e, "hoop"), [_S.read(_e, "p"), 0, _S.binary("+", _S.read(_e, "BOTW"), 1), _S.read(_e, "WHITE"), false])
	_S.call_value(_S.read(_e, "hoop"), [_S.read(_e, "p"), 1, _S.read(_e, "BOTW"), _S.prop(_S.read(_e, "C"), 5), false])
	_S.call_value(_S.read(_e, "pod"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "C"), _S.read(_e, "H"), _S.read(_e, "podY")])
	_S.define(_e, "fl", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "TAU"), 6), _S.read(_e, "ph"))]))))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.read(_e, "LENS"), 6), 36, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.7, _S.read(_e, "fl"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.read(_e, "LENS"), 6), 12, _S.read(_e, "WHITE"), _S.binary("*", 0.7, _S.read(_e, "fl"))])
	var _v46 = _S.scope(_e)
	_S.define(_v46, "y", _S.binary("+", _S.read(_v46, "LENS"), 16))
	while _S.truth(_S.binary("<", _S.read(_v46, "y"), _S.unary("-", 8))):
		_S.invoke(_S.read(_v46, "p"), "glow", [0, _S.read(_v46, "y"), _S.binary("+", _S.call_value(_S.read(_v46, "half"), [_S.read(_v46, "y")]), 10), _S.prop(_S.read(_v46, "C"), 4), 0.16])
		_v46 = _S.iteration(_v46)
		_S.write(_v46, "y", 14, "+=", false)
	for _v47 in _S.array([_S.unary("-", 20), 0, 20]):
		var _v48 = _S.scope(_e)
		_S.define(_v48, "x", _v47)
		_S.invoke(_S.read(_v48, "p"), "glow", [_S.read(_v48, "x"), _S.unary("-", 2), 22, _S.prop(_S.read(_v48, "C"), 4), 0.26])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.6, 1])

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "y", _S.call_value(_S.read(_e, "lerp"), [_S.unary("-", 2), _S.binary("+", _S.read(_e, "LENS"), 5), _S.binary("*", _S.read(_e, "k"), _S.read(_e, "k"))]))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "half"), [_S.read(_e, "y")]))
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.85), 0.85]), _S.read(_e, "w")))
	_S.define(_e, "L", _S.binary("+", 2, _S.binary("*", 6, _S.read(_e, "k"))))
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "L")), _S.function_value(_e, "_f18"), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_e, "k")), 3)])])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else _S.prop(_S.read(_e, "C"), 5))

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.4, 2])

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	var _v36 = _S.call_value(_S.read(_e, "haul"), [_S.invoke(_S.read(_e, "r"), "range", [8, 26]), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]), _S.invoke(_S.read(_e, "r"), "sign", []), 0.8, _S.read(_e, "k")])
	_S.define(_e, "x", _S.prop(_v36, 0))
	_S.define(_e, "y", _S.prop(_v36, 1))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.call_value(_S.read(_e, "lerp"), [4, 1.5, _S.read(_e, "k")]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "S"), 3), _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.25, _S.binary("*", 0.5, _S.read(_e, "k")))]), _S.binary("*", _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 6)])), _S.binary("-", 1, _S.read(_e, "k")))])
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.8, 1.3])

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "r0", _S.invoke(_S.read(_e, "r"), "range", [6, 30]))
	_S.define(_e, "th0", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "dir", _S.invoke(_S.read(_e, "r"), "sign", []))
	_S.define(_e, "turns", _S.invoke(_S.read(_e, "r"), "range", [1, 1.8]))
	_S.define(_e, "mote", _S.invoke(_S.read(_e, "r"), "chance", [0.45]))
	var _v37 = _S.call_value(_S.read(_e, "haul"), [_S.read(_e, "r0"), _S.read(_e, "th0"), _S.read(_e, "dir"), _S.read(_e, "turns"), _S.read(_e, "k")])
	_S.define(_e, "x", _S.prop(_v37, 0))
	_S.define(_e, "y", _S.prop(_v37, 1))
	_S.define(_e, "z", _S.prop(_v37, 2))
	var _v38 = _S.call_value(_S.read(_e, "haul"), [_S.read(_e, "r0"), _S.read(_e, "th0"), _S.read(_e, "dir"), _S.read(_e, "turns"), _S.binary("-", _S.read(_e, "k"), (0.13 if _S.truth(_S.read(_e, "mote")) else 0.06))])
	_S.define(_e, "x1", _S.prop(_v38, 0))
	_S.define(_e, "y1", _S.prop(_v38, 1))
	_S.define(_e, "c", ((_S.read(_e, "WHITE") if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.5])) else _S.prop(_S.read(_e, "C"), 6)) if _S.truth(_S.read(_e, "mote")) else _S.invoke(_S.read(_e, "r"), "pick", [[_S.prop(_S.read(_e, "S"), 3), _S.prop(_S.read(_e, "S"), 4), _S.prop(_S.read(_e, "S"), 4)]])))
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x1"), _S.read(_e, "y1"), _S.read(_e, "x"), _S.read(_e, "y"), _S.function_value(_e, "_f23")])
	if _S.truth(_S.read(_e, "mote")):
		var _v39 = _S.scope(_e)
		_S.invoke(_S.read(_v39, "p"), "px", [_S.read(_v39, "x"), _S.read(_v39, "y"), _S.read(_v39, "WHITE")])
		_S.invoke(_S.read(_v39, "p"), "glow", [_S.read(_v39, "x"), _S.read(_v39, "y"), 4, _S.prop(_S.read(_v39, "C"), 5), 0.45])
	return null

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return ((_S.read(_e, "c") if _S.truth(_S.binary(">", _S.read(_e, "z"), 0)) else _S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 0.7])) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.5)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.read(_e, "mote")) else _S.prop(_S.read(_e, "S"), 2)))

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	var _v40 = _S.call_value(_S.read(_e, "haul"), [_S.invoke(_S.read(_e, "r"), "range", [4, 24]), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]), _S.invoke(_S.read(_e, "r"), "sign", []), 0.6, _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [0.1, 0.7]), _S.binary("*", _S.read(_e, "k"), 0.15))])
	_S.define(_e, "x", _S.prop(_v40, 0))
	_S.define(_e, "y", _S.prop(_v40, 1))
	_S.define(_e, "arm", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", 2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "k"))]))]))
	if _S.truth(_S.binary(">", _S.read(_e, "arm"), 0)):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "arm"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), 0.4])
	return null

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "lerp"), [_S.read(_e, "BOTW"), _S.read(_e, "TOPW"), _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "y"), _S.read(_e, "LENS"))])])
