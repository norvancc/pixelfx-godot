@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/crit-number.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "spell", _S.import_value("fx/ui/_lib.js", "spell"))
	_S.define(_e, "drawWord", _S.import_value("fx/ui/_lib.js", "drawWord"))
	_S.define(_e, "shake", _S.import_value("fx/ui/_lib.js", "shake"))
	_S.define(_e, "starburst", _S.function_value(_e, "_f0"))
	_S.define(_e, "tag", _S.function_value(_e, "_f3"))
	_S.define(_e, "speedLines", _S.function_value(_e, "_f5"))
	_S.define(_e, "create", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Crit number"}, {"desc": "CRIT 128! slams in huge and white over a jagged starburst with a hard shake and speed lines, cools to fire, holds with a shine, then pops into sparks."}, {"tags": ["ui", "critical", "damage", "number", "combat", "text", "one-shot"]}, {"size": [152, 120]}, {"origin": [76, 60]}, {"duration": 1.5}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#2a0710", "#5e0f16", "#a3191c", "#e0401c", "#ff7b22", "#ffb93b", "#ffe68a", "#ffffff"]}, {"text": "128!"}, {"label": "CRIT"}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FOLD", 0.92)
	_S.define(_e, "TAGOUT", 0.98)
	_S.define(_e, "POP", 1.06)
	_S.define(_e, "SX", 1.3)
	_S.define(_e, "NS", 4)
	_S.define(_e, "NY", 5)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "cx", _S.arg(_args, 2))
	_S.define(_e, "cy", _S.arg(_args, 3))
	_S.define(_e, "R", _S.arg(_args, 4))
	_S.define(_e, "rot", _S.arg(_args, 5))
	_S.define(_e, "tips", _S.arg(_args, 6))
	_S.define(_e, "heat", _S.arg(_args, 7))
	_S.define(_e, "boil", _S.arg(_args, 8))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 9), func(): return 1))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "R"), 2), func(): return _S.binary("<=", _S.read(_e, "a"), 0))):
		return null
	_S.define(_e, "n", _S.prop(_S.read(_e, "tips"), "length"))
	_S.define(_e, "V", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.binary("*", _S.read(_v0, "n"), 2))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "an", _S.binary("+", _S.read(_v1, "rot"), _S.binary("/", _S.binary("*", _S.read(_v1, "i"), _S.prop(_S.read(_v1, "Math"), "PI")), _S.read(_v1, "n"))))
		_S.define(_v1, "r", _S.binary("*", _S.read(_v1, "R"), (_S.binary("+", 0.6, _S.prop(_S.prop(_S.read(_v1, "tips"), _S.binary(">>", _S.read(_v1, "i"), 1)), "dip")) if _S.truth(_S.binary("%", _S.read(_v1, "i"), 2)) else _S.binary("*", _S.prop(_S.prop(_S.read(_v1, "tips"), _S.binary(">>", _S.read(_v1, "i"), 1)), "len"), _S.binary("+", 1, _S.binary("*", 0.14, _S.binary("-", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "boil"), _S.read(_v1, "i")]), 0.5)))))))
		_S.invoke(_S.read(_v1, "V"), "push", [[_S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "an")]), _S.read(_v1, "r")), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "an")]), _S.read(_v1, "r")), _S.read(_v1, "an")]])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.define(_e, "step", _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "n")))
	_S.define(_e, "edge", _S.function_value(_e, "_f1"))
	_S.define(_e, "M", _S.binary("+", _S.binary("*", _S.read(_e, "R"), 1.15), 2))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "M"), _S.read(_e, "SX"))), _S.binary("-", _S.read(_e, "cy"), _S.read(_e, "M")), _S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "M"), _S.read(_e, "SX"))), _S.binary("+", _S.read(_e, "cy"), _S.read(_e, "M")), _S.function_value(_e, "_f2")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "dx", _S.arg(_args, 0))
	_S.define(_e, "dy", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]), _S.read(_e, "rot")))
	_S.write(_e, "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "a"), _S.read(_e, "TAU"))]), _S.read(_e, "TAU")), "-=", false)
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_e, "V"), "length"), 1), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "a"), _S.read(_e, "step"))])]))
	var _v2 = _S.prop(_S.read(_e, "V"), _S.read(_e, "i"))
	_S.define(_e, "x0", _S.prop(_v2, 0))
	_S.define(_e, "y0", _S.prop(_v2, 1))
	var _v3 = _S.prop(_S.read(_e, "V"), _S.binary("%", _S.binary("+", _S.read(_e, "i"), 1), _S.prop(_S.read(_e, "V"), "length")))
	_S.define(_e, "x1", _S.prop(_v3, 0))
	_S.define(_e, "y1", _S.prop(_v3, 1))
	_S.define(_e, "ex", _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")))
	_S.define(_e, "ey", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0")))
	_S.define(_e, "den", _S.binary("-", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "ey")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ex"))))
	return (_S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x0"), _S.read(_e, "y0")]) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "den")]), 1e-9)) else _S.binary("/", _S.binary("-", _S.binary("*", _S.read(_e, "x0"), _S.read(_e, "ey")), _S.binary("*", _S.read(_e, "y0"), _S.read(_e, "ex"))), _S.read(_e, "den")))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.read(_e, "SX")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.01)):
		return _S.read(_e, "WHITE")
	_S.define(_e, "L", _S.call_value(_S.read(_e, "edge"), [_S.binary("/", _S.read(_e, "dx"), _S.read(_e, "d")), _S.binary("/", _S.read(_e, "dy"), _S.read(_e, "d"))]))
	_S.define(_e, "gap", _S.binary("*", _S.binary("-", _S.read(_e, "L"), _S.read(_e, "d")), _S.binary("+", 1, _S.binary("*", 0.3, _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("/", _S.read(_e, "dx"), _S.read(_e, "d"))])))))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "d"), _S.read(_e, "L")))
	if _S.truth(_S.binary("<", _S.read(_e, "gap"), 0)):
		return null
	_S.set_prop(_S.read(_e, "o"), "a", _S.read(_e, "a"), "=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.85)):
		return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "gap"), 1)) else _S.read(_e, "WHITE"))
	if _S.truth(_S.binary("<", _S.read(_e, "gap"), 1)):
		return _S.prop(_S.read(_e, "C"), 1)
	if _S.truth(_S.binary("<", _S.read(_e, "gap"), 2.2)):
		return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.3)) else _S.prop(_S.read(_e, "C"), 6))
	if _S.truth(_S.binary("<", _S.read(_e, "gap"), 3.4)):
		return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.3)) else _S.prop(_S.read(_e, "C"), 5))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "gap"), 6), func(): return _S.binary("<", _S.read(_e, "gap"), 7))):
		return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.5)) else _S.prop(_S.read(_e, "C"), 4))
	_S.define(_e, "an", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]), _S.read(_e, "rot")))
	_S.define(_e, "sp", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "an"), _S.read(_e, "TAU")), _S.read(_e, "n")), 0.5), 1), 0.5)]), _S.binary("/", _S.read(_e, "TAU"), _S.read(_e, "n"))), _S.read(_e, "d")))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "sp"), 0.6), func(): return _S.binary(">", _S.read(_e, "q"), 0.25))):
		return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.5)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "q"), 0.6)) else _S.prop(_S.read(_e, "C"), 4)))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", (3 if _S.truth(_S.binary(">", _S.read(_e, "q"), 0.72)) else (4 if _S.truth(_S.binary(">", _S.read(_e, "q"), 0.45)) else 5)), _S.binary("*", _S.read(_e, "heat"), 5))]))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<=", _S.read(_e, "i"), 0)) else _S.prop([_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2)], _S.read(_e, "i")))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "h", _S.arg(_args, 5))
	_S.define(_e, "lean", _S.arg(_args, 6))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "x"), 1), _S.binary("-", _S.read(_e, "y"), 1), _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "w")), _S.read(_e, "lean")), 1), _S.binary("+", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "h")), 1), _S.function_value(_e, "_f4")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "lx", _S.binary("-", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")), _S.binary("*", _S.read(_e, "lean"), _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "h")), _S.read(_e, "py")), _S.read(_e, "h")))))
	if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "py"), _S.read(_e, "y")), func(): return _S.binary(">", _S.read(_e, "py"), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "h")))), func(): return _S.binary("<", _S.read(_e, "lx"), 0)), func(): return _S.binary(">", _S.read(_e, "lx"), _S.read(_e, "w")))):
		return null
	if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "lx"), 1), func(): return _S.binary(">", _S.read(_e, "lx"), _S.binary("-", _S.read(_e, "w"), 1))), func(): return _S.binary("<", _S.read(_e, "py"), _S.binary("+", _S.read(_e, "y"), 1))), func(): return _S.binary(">", _S.read(_e, "py"), _S.binary("-", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "h")), 1)))):
		return _S.prop(_S.read(_e, "C"), 0)
	return (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "py"), _S.binary("+", _S.read(_e, "y"), 2))) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary("<", _S.read(_e, "py"), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "h"), 0.55)))) else _S.prop(_S.read(_e, "C"), 2)))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "lines", _S.arg(_args, 3))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "t"), 0.24))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "k"), 0), func(): return _S.binary(">=", _S.read(_e, "k"), 1))):
		return null
	for _v4 in _S.array(_S.read(_e, "lines")):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "l", _v4)
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "r0", _S.binary("*", _S.prop(_S.read(_v6, "l"), "r"), _S.binary("+", 1, _S.binary("*", 0.5, _S.invoke(_S.read(_v6, "ease"), "outExpo", [_S.read(_v6, "k")])))))
		_S.define(_v6, "r1", _S.binary("+", _S.binary("+", _S.read(_v6, "r0"), _S.binary("*", _S.prop(_S.read(_v6, "l"), "len"), _S.binary("-", 1, _S.read(_v6, "k")))), 2))
		_S.define(_v6, "ca", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.prop(_S.read(_v6, "l"), "a")]), 1.2))
		_S.define(_v6, "sa", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.prop(_S.read(_v6, "l"), "a")]), 0.92))
		_S.invoke(_S.read(_v6, "p"), "line", [_S.binary("*", _S.read(_v6, "ca"), _S.read(_v6, "r0")), _S.binary("*", _S.read(_v6, "sa"), _S.read(_v6, "r0")), _S.binary("*", _S.read(_v6, "ca"), _S.read(_v6, "r1")), _S.binary("*", _S.read(_v6, "sa"), _S.read(_v6, "r1")), _S.function_value(_v6, "_f6")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "u"), 0.5), func(): return _S.binary("<", _S.read(_e, "k"), 0.3))) else _S.prop(_S.read(_e, "C"), 6))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "SHADOW", _S.call_value(_S.read(_e, "scale"), [_S.prop(_S.read(_e, "C"), 0), 0.5]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), []))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "num", _S.call_value(_S.read(_e, "spell"), [_S.prop(_S.read(_e, "o"), "text")]))
	_S.define(_e, "lab", _S.call_value(_S.read(_e, "spell"), [_S.prop(_S.read(_e, "o"), "label"), "mini"]))
	_S.define(_e, "tips", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 13}]), _S.function_value(_e, "_f8")]))
	_S.define(_e, "lines", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 18}]), _S.function_value(_e, "_f9")]))
	_S.define(_e, "reach", _S.function_value(_e, "_f10"))
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	_S.define(_e, "t", 0)
	_S.define(_e, "slammed", false)
	_S.define(_e, "stamped", false)
	_S.define(_e, "popped", false)
	_S.define(_e, "tagGone", false)
	_S.define(_e, "spawnStar", _S.function_value(_e, "_f11"))
	_S.define(_e, "sizeAt", _S.function_value(_e, "_f12"))
	return _S.merge([{"update": _S.function_value(_e, "_f13")}, {"draw": _S.function_value(_e, "_f14")}])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.merge([{"len": _S.invoke(_S.read(_e, "R"), "range", [0.86, 1.12])}, {"dip": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.06), 0.06])}])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 18), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.1), 0.1]))}, {"r": _S.invoke(_S.read(_e, "R"), "range", [31, 34])}, {"len": _S.invoke(_S.read(_e, "R"), "range", [8, 15])}])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "d", _S.arg(_args, 1))
	return (9 if _S.truth(_S.binary("<=", _S.read(_e, "v"), _S.binary("*", _S.read(_e, "d"), 2.2))) else _S.binary("/", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "log", [_S.binary("-", 1, _S.binary("/", _S.binary("*", _S.read(_e, "d"), 2.2), _S.read(_e, "v")))])), 2.2))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "vy", _S.arg(_args, 3))
	_S.define(_e, "life", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "size", _S.arg(_args, 6))
	return _S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "vx"), _S.read(_e, "vy"), _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "life"), _S.binary("-", _S.read(_e, "end"), _S.read(_e, "t"))]), _S.read(_e, "c"), _S.read(_e, "size")])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", _S.read(_e, "NS"), _S.binary("*", _S.binary("*", 3, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "t")), 26)])), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "t"), 38)])))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.unary("!", _S.read(_e, "slammed"))):
		var _v7 = _S.scope(_e)
		_S.write(_v7, "slammed", true, "=", false)
		_S.invoke(_S.read(_v7, "lights"), "add", [0, 0, 70, _S.read(_v7, "WHITE"), 0.9, 0.16])
		_S.invoke(_S.read(_v7, "lights"), "add", [0, 0, 60, _S.prop(_S.read(_v7, "C"), 4), 0.45, 0.5])
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), 30)):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "an", _S.invoke(_S.read(_v9, "R"), "range", [0, _S.read(_v9, "TAU")]))
			_S.define(_v9, "sp", _S.invoke(_S.read(_v9, "R"), "range", [140, 300]))
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "an")]), 8), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "an")]), 6), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "an")]), _S.read(_v9, "sp")), 1.15), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "an")]), _S.read(_v9, "sp")), 40), _S.invoke(_S.read(_v9, "Math"), "min", [_S.invoke(_S.read(_v9, "R"), "range", [0.12, 0.32]), _S.call_value(_S.read(_v9, "reach"), [_S.binary("*", _S.read(_v9, "sp"), 1.15), 40])])])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
		var _v10 = _S.scope(_v7)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), 10)):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "an", _S.invoke(_S.read(_v11, "R"), "range", [0, _S.read(_v11, "TAU")]))
			_S.define(_v11, "sp", _S.invoke(_S.read(_v11, "R"), "range", [90, 170]))
			_S.invoke(_S.read(_v11, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v11, "B"), "SHARD")}, {"x": _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "an")]), 10)}, {"y": _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "an")]), 7)}, {"vx": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "an")]), _S.read(_v11, "sp")), 1.15)}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "an")]), _S.read(_v11, "sp")), 60)}, {"g": 0.35}, {"drag": 1.6}, {"life": _S.invoke(_S.read(_v11, "Math"), "min", [_S.invoke(_S.read(_v11, "R"), "range", [0.3, 0.5]), _S.binary("-", _S.read(_v11, "end"), _S.read(_v11, "t"))])}, {"a": _S.invoke(_S.read(_v11, "R"), "range", [0, _S.read(_v11, "TAU")])}, {"va": _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 24), 24])}, {"s": _S.invoke(_S.read(_v11, "R"), "range", [2, 3.5])}, {"c": _S.invoke(_S.read(_v11, "R"), "pick", [[_S.prop(_S.read(_v11, "C"), 7), _S.prop(_S.read(_v11, "C"), 6), _S.prop(_S.read(_v11, "C"), 5)]])}])])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "stamped")), func(): return _S.binary(">=", _S.read(_e, "t"), 0.09))):
		var _v12 = _S.scope(_e)
		_S.write(_v12, "stamped", true, "=", false)
		_S.invoke(_S.read(_v12, "lights"), "add", [_S.unary("-", 4), _S.unary("-", 20), 30, _S.prop(_S.read(_v12, "C"), 6), 0.5, 0.2])
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 6)):
			_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "STAR"), _S.binary("+", _S.unary("-", 4), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 16), 16])), _S.binary("+", _S.unary("-", 20), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 4), 4])), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 40), 40]), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 30), 10]), _S.invoke(_S.read(_v13, "R"), "range", [0.2, 0.4]), _S.prop(_S.read(_v13, "C"), 6), _S.invoke(_S.read(_v13, "R"), "range", [0.5, 1.4])])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "tagGone")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "TAGOUT")))):
		var _v14 = _S.scope(_e)
		_S.write(_v14, "tagGone", true, "=", false)
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 6)):
			_S.call_value(_S.read(_v15, "spawnStar"), [_S.binary("+", _S.unary("-", 10), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 16), 16])), _S.binary("+", _S.unary("-", 14), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 5), 5])), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 50), 50]), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [10, 60])), _S.invoke(_S.read(_v15, "R"), "range", [0.25, 0.4]), _S.invoke(_S.read(_v15, "R"), "pick", [[_S.prop(_S.read(_v15, "C"), 7), _S.prop(_S.read(_v15, "C"), 6)]]), (0.6 if _S.truth(_S.read(_v15, "i")) else 1.6)])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.3), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "FOLD"), 0.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.07]))):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "an", _S.invoke(_S.read(_v16, "R"), "range", [0, _S.read(_v16, "TAU")]))
		_S.define(_v16, "sp", _S.invoke(_S.read(_v16, "R"), "range", [70, 150]))
		_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "SPARK"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "an")]), 30), _S.read(_v16, "SX")), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "an")]), 30), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "an")]), _S.read(_v16, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "an")]), _S.read(_v16, "sp")), 30), _S.invoke(_S.read(_v16, "Math"), "min", [_S.invoke(_S.read(_v16, "R"), "range", [0.12, 0.26]), _S.call_value(_S.read(_v16, "reach"), [_S.read(_v16, "sp"), 14])])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.12), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "FOLD"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.16]))):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "an", _S.invoke(_S.read(_v17, "R"), "range", [0, _S.read(_v17, "TAU")]))
		_S.define(_v17, "r", _S.invoke(_S.read(_v17, "R"), "range", [14, 28]))
		_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "EMBER"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "an")]), _S.read(_v17, "r")), _S.read(_v17, "SX")), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "an")]), _S.read(_v17, "r")), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v17, "R"), "range", [15, 40])), _S.invoke(_S.read(_v17, "Math"), "min", [_S.invoke(_S.read(_v17, "R"), "range", [0.5, 0.9]), _S.binary("-", _S.read(_v17, "end"), _S.read(_v17, "t"))]), _S.prop(_S.read(_v17, "C"), 5), _S.invoke(_S.read(_v17, "R"), "range", [1, 2])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POP"), 0.05)))):
		var _v18 = _S.scope(_e)
		_S.write(_v18, "popped", true, "=", false)
		_S.invoke(_S.read(_v18, "lights"), "add", [0, 0, 44, _S.prop(_S.read(_v18, "C"), 6), 0.7, 0.25])
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), 14)):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v20, "i"), 14), _S.read(_v20, "TAU")), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 0.15), 0.15])))
			_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [60, 130]))
			_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "STAR"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "an")]), 10), _S.read(_v20, "SX")), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "an")]), 7), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "an")]), _S.read(_v20, "sp")), _S.read(_v20, "SX")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "an")]), _S.read(_v20, "sp")), 10), _S.invoke(_S.read(_v20, "Math"), "min", [_S.invoke(_S.read(_v20, "R"), "range", [0.3, 0.42]), _S.binary("-", _S.read(_v20, "end"), _S.read(_v20, "t"))]), _S.invoke(_S.read(_v20, "R"), "pick", [[_S.prop(_S.read(_v20, "C"), 7), _S.prop(_S.read(_v20, "C"), 6), _S.prop(_S.read(_v20, "C"), 5)]]), (0.6 if _S.truth(_S.binary("%", _S.read(_v20, "i"), 3)) else _S.invoke(_S.read(_v20, "R"), "range", [1.3, 2.2]))])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 1, "+=", true)
		var _v21 = _S.scope(_v18)
		_S.define(_v21, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v21, "i"), 8)):
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "an", _S.invoke(_S.read(_v22, "R"), "range", [0, _S.read(_v22, "TAU")]))
			_S.define(_v22, "sp", _S.invoke(_S.read(_v22, "R"), "range", [120, 240]))
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "an")]), 6), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "an")]), 4), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "an")]), _S.read(_v22, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "an")]), _S.read(_v22, "sp")), 30), _S.invoke(_S.read(_v22, "Math"), "min", [_S.invoke(_S.read(_v22, "R"), "range", [0.15, 0.3]), _S.binary("-", _S.read(_v22, "end"), _S.read(_v22, "t")), _S.call_value(_S.read(_v22, "reach"), [_S.read(_v22, "sp"), 40])])])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	var _v23 = _S.call_value(_S.read(_e, "shake"), [_S.read(_e, "t"), 4, 0, 0.32, _S.prop(_S.read(_e, "o"), "seed")])
	_S.define(_e, "sx", _S.prop(_v23, 0))
	_S.define(_e, "sy", _S.prop(_v23, 1))
	var _v24 = _S.call_value(_S.read(_e, "shake"), [_S.read(_e, "t"), 2, 0.09, 0.15, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 3)])
	_S.define(_e, "lx", _S.prop(_v24, 0))
	_S.define(_e, "ly", _S.prop(_v24, 1))
	_S.define(_e, "grow", (1.25 if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.04)) else _S.binary("+", 1, _S.binary("*", 0.1, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_e, "t"), 0.04)), 14)])))))
	_S.define(_e, "fold", _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inBack", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.binary("-", _S.read(_e, "FOLD"), 0.12), _S.read(_e, "FOLD")]), 2.4])))
	_S.define(_e, "heat", (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.035)) else _S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.035), 0.12))])))
	_S.define(_e, "breathe", _S.binary("+", 1, _S.binary("*", 0.04, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 16)]))))
	if _S.truth(_S.binary(">", _S.read(_e, "fold"), 0.02)):
		_S.call_value(_S.read(_e, "starburst"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "sx"), _S.read(_e, "sy"), _S.binary("*", _S.binary("*", _S.binary("*", 31, _S.read(_e, "grow")), _S.read(_e, "fold")), _S.read(_e, "breathe")), _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.binary("*", 0.25, _S.read(_e, "t"))), _S.read(_e, "tips"), _S.read(_e, "heat"), (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.2)) else _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 10)]))])
	_S.call_value(_S.read(_e, "speedLines"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "lines")])
	_S.define(_e, "rk", _S.binary("/", _S.read(_e, "t"), 0.26))
	_S.define(_e, "rr", _S.binary("+", 30, _S.binary("*", 22, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "rk")]))))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "rk"), 0), func(): return _S.binary("<", _S.read(_e, "rk"), 1))):
		_S.invoke(_S.read(_e, "p"), "ellipse", [0, 0, _S.binary("*", _S.read(_e, "rr"), _S.read(_e, "SX")), _S.read(_e, "rr"), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "rk"), 0.35)) else _S.prop(_S.read(_e, "C"), 6)), _S.function_value(_e, "_f15")])
	_S.invoke(_S.read(_e, "bits"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.define(_e, "s", _S.call_value(_S.read(_e, "sizeAt"), [_S.read(_e, "t")]))
	_S.define(_e, "sxN", _S.read(_e, "s"))
	_S.define(_e, "syN", _S.read(_e, "s"))
	_S.define(_e, "flash", (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.035)) else (0.5 if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.07)) else 0)))
	_S.define(_e, "pu", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), 0.05))
	if _S.truth(_S.binary(">=", _S.read(_e, "pu"), 1)):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "k", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v25, "t"), _S.read(_v25, "POP")), 0.05), 0.22))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v25, "k"), 0), func(): return _S.binary("<", _S.read(_v25, "k"), 1))):
			_S.invoke(_S.read(_v25, "p"), "ellipse", [0, 0, _S.binary("*", _S.binary("+", 6, _S.binary("*", 22, _S.invoke(_S.read(_v25, "ease"), "outCubic", [_S.read(_v25, "k")]))), _S.read(_v25, "SX")), _S.binary("+", 6, _S.binary("*", 22, _S.invoke(_S.read(_v25, "ease"), "outCubic", [_S.read(_v25, "k")]))), (_S.read(_v25, "WHITE") if _S.truth(_S.binary("<", _S.read(_v25, "k"), 0.4)) else _S.prop(_S.read(_v25, "C"), 6)), _S.function_value(_v25, "_f16")])
	else:
		var _v26 = _S.scope(_e)
		_S.define(_v26, "sq", _S.call_value(_S.read(_v26, "seg"), [_S.read(_v26, "t"), _S.binary("-", _S.read(_v26, "POP"), 0.07), _S.read(_v26, "POP")]))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v26, "sq"), 0), func(): return _S.binary("<=", _S.read(_v26, "pu"), 0))):
			_S.last([_S.write(_v26, "sxN", _S.binary("*", _S.read(_v26, "NS"), _S.binary("+", 1, _S.binary("*", 0.14, _S.read(_v26, "sq")))), "=", false), _S.write(_v26, "syN", _S.binary("*", _S.read(_v26, "NS"), _S.binary("-", 1, _S.binary("*", 0.12, _S.read(_v26, "sq")))), "=", false)])
		if _S.truth(_S.binary(">", _S.read(_v26, "pu"), 0)):
			_S.last([_S.write(_v26, "sxN", _S.write(_v26, "syN", _S.binary("*", _S.read(_v26, "NS"), _S.binary("+", 1, _S.binary("*", 0.25, _S.read(_v26, "pu")))), "=", false), "=", false), _S.write(_v26, "flash", 1, "=", false)])
		_S.define(_v26, "W", _S.binary("*", _S.prop(_S.read(_v26, "num"), "w"), _S.read(_v26, "sxN")))
		_S.define(_v26, "H", _S.binary("*", 7, _S.read(_v26, "syN")))
		_S.define(_v26, "x0", _S.binary("-", _S.binary("-", _S.read(_v26, "sx"), _S.binary("/", _S.read(_v26, "W"), 2)), 3))
		_S.define(_v26, "y0", _S.binary("-", _S.binary("-", _S.binary("+", _S.read(_v26, "sy"), _S.read(_v26, "NY")), _S.binary("/", _S.read(_v26, "H"), 2)), _S.binary("*", 3, _S.call_value(_S.read(_v26, "smooth"), [0.15, _S.read(_v26, "FOLD"), _S.read(_v26, "t")]))))
		_S.define(_v26, "items", _S.invoke(_S.invoke(_S.prop(_S.read(_v26, "num"), "letters"), "filter", [_S.function_value(_v26, "_f17")]), "map", [_S.function_value(_v26, "_f18")]))
		_S.define(_v26, "sh", _S.call_value(_S.read(_v26, "seg"), [_S.read(_v26, "t"), 0.36, 0.6]))
		_S.define(_v26, "shine", (_S.binary("+", _S.binary("-", _S.read(_v26, "x0"), 10), _S.binary("*", _S.binary("+", _S.read(_v26, "W"), 26), _S.invoke(_S.read(_v26, "ease"), "inOutSine", [_S.read(_v26, "sh")]))) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v26, "sh"), 0), func(): return _S.binary("<", _S.read(_v26, "sh"), 1))) else null))
		_S.call_value(_S.read(_v26, "drawWord"), [_S.read(_v26, "p"), _S.read(_v26, "items"), _S.merge([{"fill": [_S.prop(_S.read(_v26, "C"), 5), _S.prop(_S.read(_v26, "C"), 6), _S.prop(_S.read(_v26, "C"), 6), _S.prop(_S.read(_v26, "C"), 7)]}, {"edge": _S.read(_v26, "WHITE")}, {"under": _S.prop(_S.read(_v26, "C"), 4)}, {"outline": _S.prop(_S.read(_v26, "C"), 0)}, {"ow": 2}, {"shadow": _S.read(_v26, "SHADOW")}, {"shine": _S.read(_v26, "shine")}, {"shineY": _S.read(_v26, "y0")}, {"glint": _S.prop(_S.read(_v26, "C"), 5)}])])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("!==", _S.read(_v26, "shine"), null), func(): return _S.binary(">", _S.read(_v26, "shine"), _S.read(_v26, "x0"))), func(): return _S.binary("<", _S.read(_v26, "shine"), _S.binary("+", _S.read(_v26, "x0"), _S.read(_v26, "W"))))):
			_S.invoke(_S.read(_v26, "p"), "glowLine", [_S.read(_v26, "shine"), _S.read(_v26, "y0"), _S.binary("+", _S.read(_v26, "shine"), _S.binary("*", 0.6, _S.read(_v26, "H"))), _S.binary("+", _S.read(_v26, "y0"), _S.read(_v26, "H")), 8, _S.prop(_S.read(_v26, "C"), 6), 0.3])
		_S.define(_v26, "lk", _S.binary("-", _S.read(_v26, "t"), 0.06))
		_S.define(_v26, "lo", _S.call_value(_S.read(_v26, "seg"), [_S.read(_v26, "t"), _S.binary("-", _S.read(_v26, "TAGOUT"), 0.05), _S.read(_v26, "TAGOUT")]))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v26, "lk"), 0), func(): return _S.binary("<", _S.read(_v26, "t"), _S.read(_v26, "TAGOUT")))):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "ls", (3 if _S.truth(_S.binary("<", _S.read(_v27, "lk"), 0.035)) else (1.8 if _S.truth(_S.binary("<", _S.read(_v27, "lk"), 0.07)) else _S.binary("*", 2, _S.binary("+", 1, _S.binary("*", 0.15, _S.read(_v27, "lo")))))))
			_S.define(_v27, "LW", _S.binary("*", _S.prop(_S.read(_v27, "lab"), "w"), _S.read(_v27, "ls")))
			_S.define(_v27, "lh", _S.binary("*", 5, _S.read(_v27, "ls")))
			_S.define(_v27, "lxo", _S.binary("-", _S.binary("-", _S.binary("+", _S.read(_v27, "sx"), _S.read(_v27, "lx")), 8), _S.binary("/", _S.read(_v27, "LW"), 2)))
			_S.define(_v27, "lyo", _S.binary("-", _S.binary("+", _S.binary("-", _S.binary("-", _S.read(_v27, "y0"), 3), _S.read(_v27, "lh")), _S.read(_v27, "ly")), _S.binary("*", 2, _S.read(_v27, "lo"))))
			if _S.truth(_S.binary(">", _S.read(_v27, "lo"), 0.5)):
				_S.call_value(_S.read(_v27, "tag"), [_S.read(_v27, "p"), _S.merge([{0: _S.read(_v27, "WHITE")}, {2: _S.read(_v27, "WHITE")}, {3: _S.read(_v27, "WHITE")}, {4: _S.read(_v27, "WHITE")}]), _S.binary("-", _S.read(_v27, "lxo"), 4), _S.binary("-", _S.read(_v27, "lyo"), 3), _S.binary("+", _S.read(_v27, "LW"), 8), _S.binary("+", _S.read(_v27, "lh"), 5), 3])
			else:
				_S.call_value(_S.read(_v27, "tag"), [_S.read(_v27, "p"), _S.read(_v27, "C"), _S.binary("-", _S.read(_v27, "lxo"), 4), _S.binary("-", _S.read(_v27, "lyo"), 3), _S.binary("+", _S.read(_v27, "LW"), 8), _S.binary("+", _S.read(_v27, "lh"), 5), 3])
			_S.define(_v27, "lit", _S.invoke(_S.invoke(_S.prop(_S.read(_v27, "lab"), "letters"), "filter", [_S.function_value(_v27, "_f19")]), "map", [_S.function_value(_v27, "_f20")]))
			_S.call_value(_S.read(_v27, "drawWord"), [_S.read(_v27, "p"), _S.read(_v27, "lit"), _S.merge([{"fill": [_S.prop(_S.read(_v27, "C"), 6), _S.prop(_S.read(_v27, "C"), 7), _S.prop(_S.read(_v27, "C"), 7)]}, {"edge": _S.read(_v27, "WHITE")}, {"under": _S.prop(_S.read(_v27, "C"), 5)}, {"outline": 0}, {"shadow": _S.prop(_S.read(_v27, "C"), 1)}])])
		_S.define(_v26, "g", _S.binary("/", _S.binary("-", _S.read(_v26, "t"), 0.6), 0.24))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v26, "g"), 0), func(): return _S.binary("<", _S.read(_v26, "g"), 1))):
			_S.call_value(_S.read(_v26, "sparkle"), [_S.read(_v26, "p"), _S.binary("-", _S.binary("+", _S.read(_v26, "x0"), _S.read(_v26, "W")), 2), _S.binary("+", _S.read(_v26, "y0"), 1), _S.binary("*", 6, _S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("*", _S.read(_v26, "g"), _S.prop(_S.read(_v26, "Math"), "PI"))])), _S.prop(_S.read(_v26, "C"), 6), _S.prop(_S.read(_v26, "C"), 5), 0.6])
	_S.define(_e, "hold", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, 0.1, _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "FOLD"), 0.1), _S.binary("+", _S.read(_e, "POP"), 0.1), _S.read(_e, "t")]))))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "sx"), _S.read(_e, "sy"), 56, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.binary("*", 0.14, _S.read(_e, "hold")), _S.binary("+", 1, _S.binary("*", 0.2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 16)]))))])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.12)):
		_S.invoke(_S.read(_e, "p"), "glow", [0, 0, 64, _S.read(_e, "WHITE"), _S.binary("*", 0.8, _S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.12)))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.binary("-", 1.2, _S.read(_e, "rk")) if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("-", 1, _S.binary("/", 1.6, _S.read(_e, "rr"))))) else 0)

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.binary("-", 1.3, _S.read(_e, "k")) if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("-", 1, _S.binary("/", 1.5, _S.binary("+", 6, _S.binary("*", 22, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))))))) else 0)

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "L"), "g")

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.merge([{"g": _S.prop(_S.read(_e, "L"), "g")}, {"x": _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.prop(_S.read(_e, "L"), "x"), _S.read(_e, "sxN")))}, {"y": _S.read(_e, "y0")}, {"sx": _S.read(_e, "sxN")}, {"sy": _S.read(_e, "syN")}, {"slant": 1}, {"flash": _S.read(_e, "flash")}])

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "L"), "g")

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.merge([{"g": _S.prop(_S.read(_e, "L"), "g")}, {"x": _S.binary("+", _S.binary("+", _S.read(_e, "lxo"), 1), _S.binary("*", _S.prop(_S.read(_e, "L"), "x"), _S.read(_e, "ls")))}, {"y": _S.read(_e, "lyo")}, {"sx": _S.read(_e, "ls")}, {"sy": _S.read(_e, "ls")}, {"slant": 0.5}, {"flash": (1 if _S.truth(_S.binary("<", _S.read(_e, "lk"), 0.035)) else 0)}])
