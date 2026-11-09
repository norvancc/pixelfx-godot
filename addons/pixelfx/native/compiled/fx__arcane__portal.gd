@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/portal.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "tone", _S.import_value("fx/arcane/_lib.js", "tone"))
	_S.define(_e, "mote", _S.import_value("fx/arcane/_lib.js", "mote"))
	_S.define(_e, "streak", _S.import_value("fx/arcane/_lib.js", "streak"))
	_S.define(_e, "setup", _S.function_value(_e, "_f0"))
	_S.define(_e, "rift", _S.function_value(_e, "_f4"))
	_S.define(_e, "well", _S.function_value(_e, "_f6"))
	_S.define(_e, "orbit", _S.function_value(_e, "_f9"))
	_S.define(_e, "infall", _S.function_value(_e, "_f10"))
	_S.define(_e, "skaters", _S.function_value(_e, "_f17"))
	_S.define(_e, "floor", _S.function_value(_e, "_f20"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f21"))
	_S.define(_e, "draw", _S.function_value(_e, "_f22"))
	_S.define(_e, "D", 2.4)
	_S.define(_e, "meta", _S.merge([{"name": "Portal"}, {"desc": "An upright rift: fibrous spiral arms wind down into the dark, a lit rim wobbles, motes and streaks are pulled in, the floor glows."}, {"tags": ["arcane", "portal", "rift", "teleport", "magic", "ground", "loop"]}, {"size": [152, 116]}, {"origin": [76, 106]}, {"duration": _S.read(_e, "D")}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"width": 17}, {"height": 29}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "wrapPi", _S.function_value(_e, "_f23"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "o", _S.arg(_args, 1))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "rx", _S.prop(_S.read(_e, "o"), "width"))
	_S.define(_e, "ry", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "CY", _S.unary("-", _S.binary("+", _S.read(_e, "ry"), 5)))
	_S.define(_e, "rim", _S.function_value(_e, "_f1"))
	_S.define(_e, "at", _S.function_value(_e, "_f2"))
	_S.define(_e, "spots", [_S.binary("-", _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2), 0.6), _S.binary("-", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2), _S.prop(_S.read(_e, "Math"), "PI")), 0.6)])
	_S.define(_e, "hot", _S.function_value(_e, "_f3"))
	return _S.merge([{"C": _S.read(_e, "C")}, {"rx": _S.read(_e, "rx")}, {"ry": _S.read(_e, "ry")}, {"ph": _S.read(_e, "ph")}, {"S": _S.read(_e, "S")}, {"CY": _S.read(_e, "CY")}, {"rim": _S.read(_e, "rim")}, {"at": _S.read(_e, "at")}, {"hot": _S.read(_e, "hot")}, {"spots": _S.read(_e, "spots")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "th", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", 1, _S.binary("*", 0.05, _S.call_value(_S.read(_e, "tileNoise"), [_S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "th"), _S.read(_e, "TAU")), 10), _S.binary("*", _S.read(_e, "ph"), 10)), _S.binary("*", _S.read(_e, "ph"), 4), 10, 4, _S.read(_e, "S")]))), _S.binary("*", 0.018, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_e, "th"), 3), _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2))])))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "th", _S.arg(_args, 0))
	_S.define(_e, "rho", _S.arg(_args, 1))
	_S.define(_e, "out", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "rho"), 1)]))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "rho")]))
	return [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.binary("+", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "rx")), _S.binary("*", _S.read(_e, "out"), 21))), _S.invoke(_S.read(_e, "Math"), "min", [_S.unary("-", 1), _S.binary("+", _S.read(_e, "CY"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]), _S.binary("+", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "ry")), _S.binary("*", _S.read(_e, "out"), 16))))])]

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "th", _S.arg(_args, 0))
	return _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [_S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("**", _S.call_value(_S.read(_e, "wrapPi"), [_S.binary("-", _S.read(_e, "th"), _S.prop(_S.read(_e, "spots"), 0))]), 2)), 0.12)]), _S.binary("*", 0.85, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("**", _S.call_value(_S.read(_e, "wrapPi"), [_S.binary("-", _S.read(_e, "th"), _S.prop(_S.read(_e, "spots"), 1))]), 2)), 0.08)]))]), _S.binary("*", 0.35, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.read(_e, "th"), 2.3)])])))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	var _v0 = _S.read(_e, "s")
	_S.define(_e, "C", _S.prop(_v0, "C"))
	_S.define(_e, "rx", _S.prop(_v0, "rx"))
	_S.define(_e, "ry", _S.prop(_v0, "ry"))
	_S.define(_e, "ph", _S.prop(_v0, "ph"))
	_S.define(_e, "CY", _S.prop(_v0, "CY"))
	_S.define(_e, "rim", _S.prop(_v0, "rim"))
	_S.define(_e, "hot", _S.prop(_v0, "hot"))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "rx")), 4), _S.binary("-", _S.binary("-", _S.read(_e, "CY"), _S.read(_e, "ry")), 4), _S.binary("+", _S.read(_e, "rx"), 4), _S.binary("+", _S.binary("+", _S.read(_e, "CY"), _S.read(_e, "ry")), 4), _S.function_value(_e, "_f5")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "rx")))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "CY")), _S.read(_e, "ry")))
	_S.define(_e, "r", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "u"), _S.read(_e, "v")]), func(): return 0.000001))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "v"), _S.read(_e, "u")]))
	_S.define(_e, "R0", _S.call_value(_S.read(_e, "rim"), [_S.read(_e, "th")]))
	_S.define(_e, "g", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("/", _S.read(_e, "u"), _S.read(_e, "rx")), _S.binary("/", _S.read(_e, "v"), _S.read(_e, "ry"))]), _S.read(_e, "r")))
	_S.define(_e, "e", _S.binary("/", _S.binary("-", _S.read(_e, "r"), _S.read(_e, "R0")), _S.read(_e, "g")))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "hot"), [_S.read(_e, "th")]))
	if _S.truth(_S.binary(">", _S.read(_e, "e"), 2.5)):
		return null
	if _S.truth(_S.binary(">", _S.read(_e, "e"), 1.5)):
		var _v1 = _S.scope(_e)
		if _S.truth(_S.binary(">", _S.read(_v1, "h"), 0.6)):
			_S.last([_S.set_prop(_S.read(_v1, "out"), "c", _S.prop(_S.read(_v1, "C"), 3), "=", false), _S.set_prop(_S.read(_v1, "out"), "a", 0.5, "=", false)])
		return null
	if _S.truth(_S.binary(">", _S.read(_e, "e"), 0.5)):
		var _v2 = _S.scope(_e)
		_S.set_prop(_S.read(_v2, "out"), "c", (_S.prop(_S.read(_v2, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v2, "h"), 0.5)) else _S.prop(_S.read(_v2, "C"), 2)), "=", false)
		return null
	if _S.truth(_S.binary(">", _S.read(_e, "e"), _S.unary("-", 0.5))):
		var _v3 = _S.scope(_e)
		_S.set_prop(_S.read(_v3, "out"), "c", (_S.read(_v3, "WHITE") if _S.truth(_S.binary(">", _S.read(_v3, "h"), 0.42)) else _S.prop(_S.read(_v3, "C"), 6)), "=", false)
		_S.set_prop(_S.read(_v3, "out"), "k", _S.binary("+", 0.25, _S.binary("*", 0.4, _S.read(_v3, "h"))), "=", false)
		return null
	_S.define(_e, "d", _S.binary("/", _S.read(_e, "r"), _S.read(_e, "R0")))
	_S.define(_e, "z", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "log", [_S.invoke(_S.read(_e, "Math"), "max", [0.02, _S.read(_e, "d")])])))
	_S.define(_e, "phi", _S.binary("-", _S.binary("+", _S.binary("*", 3, _S.read(_e, "th")), _S.binary("*", 6.5, _S.read(_e, "z"))), _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), 3), _S.read(_e, "ph"))))
	_S.define(_e, "c1", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "phi")]))))
	_S.define(_e, "c2", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("+", _S.read(_e, "phi"), _S.prop(_S.read(_e, "Math"), "PI")), _S.binary("*", 0.6, _S.read(_e, "z")))]))))
	_S.define(_e, "lit", _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "d"), 1.5]))
	_S.define(_e, "sink", _S.call_value(_S.read(_e, "smooth"), [0.2, 0.62, _S.read(_e, "d")]))
	_S.define(_e, "knot", _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("-", _S.binary("*", 4, _S.read(_e, "z")), _S.binary("/", _S.read(_e, "phi"), 3)), _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), 5), _S.read(_e, "ph")))])]), 6]))
	_S.define(_e, "st", _S.binary("+", _S.call_value(_S.read(_e, "smooth"), [0.4, 0.7, _S.read(_e, "d")]), _S.binary("*", 0.6, _S.call_value(_S.read(_e, "smooth"), [0.8, 0.95, _S.read(_e, "d")]))))
	_S.define(_e, "crest", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "c1"), 16]), _S.binary("+", 0.6, _S.binary("*", 5.6, _S.read(_e, "lit")))), _S.binary("+", 1, _S.binary("*", 0.5, _S.read(_e, "knot")))), _S.read(_e, "sink")))
	_S.write(_e, "st", _S.binary("+", _S.read(_e, "crest"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "c1"), 5]), 1.1), _S.read(_e, "lit"))), "+=", false)
	_S.write(_e, "st", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "c2"), 18]), _S.binary("+", 0.3, _S.binary("*", 1.8, _S.read(_e, "lit")))), _S.read(_e, "sink")), "+=", false)
	_S.write(_e, "st", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "TAU"), _S.binary("-", _S.binary("*", _S.read(_e, "z"), 1.5), _S.binary("*", _S.read(_e, "ph"), 2)))]))), 20]), 1.3), _S.read(_e, "sink")), _S.binary("-", 1, _S.binary("*", 0.5, _S.read(_e, "c1")))), "+=", false)
	_S.write(_e, "st", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("+", _S.binary("*", 3, _S.read(_e, "phi")), _S.binary("*", 2, _S.read(_e, "z"))), 1.3)]))), 10]), 1.1), _S.read(_e, "lit")), _S.read(_e, "sink")), "+=", false)
	_S.write(_e, "st", _S.binary("*", _S.binary("*", 2.2, _S.invoke(_S.read(_e, "Math"), "pow", [_S.call_value(_S.read(_e, "smooth"), [0.8, 1, _S.read(_e, "d")]), 2])), _S.binary("+", 0.75, _S.binary("*", 0.45, _S.read(_e, "h")))), "+=", false)
	_S.set_prop(_S.read(_e, "out"), "c", _S.call_value(_S.read(_e, "tone"), [_S.read(_e, "C"), _S.binary("/", _S.read(_e, "st"), 7), _S.read(_e, "x"), _S.read(_e, "y"), 0, 0.65]), "=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "crest"), 2.2)):
		_S.set_prop(_S.read(_e, "out"), "k", _S.binary("+", 0.12, _S.binary("*", 0.05, _S.read(_e, "crest"))), "=", false)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	var _v4 = _S.read(_e, "s")
	_S.define(_e, "C", _S.prop(_v4, "C"))
	_S.define(_e, "rx", _S.prop(_v4, "rx"))
	_S.define(_e, "ry", _S.prop(_v4, "ry"))
	_S.define(_e, "ph", _S.prop(_v4, "ph"))
	_S.define(_e, "S", _S.prop(_v4, "S"))
	_S.define(_e, "CY", _S.prop(_v4, "CY"))
	_S.define(_e, "rim", _S.prop(_v4, "rim"))
	_S.define(_e, "t", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "D")))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 18, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 7), 5), _S.function_value(_e, "_f7"), _S.function_value(_e, "_f8")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [1.1, 1.8])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "th", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]), _S.binary("*", _S.read(_e, "q"), 2.6)))
	_S.define(_e, "rho", _S.binary("*", 0.92, _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.read(_e, "q")]), 0.9))))
	_S.define(_e, "R0", _S.call_value(_S.read(_e, "rim"), [_S.read(_e, "th")]))
	_S.define(_e, "x", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "rho")), _S.read(_e, "R0")), _S.read(_e, "rx")))
	_S.define(_e, "y", _S.binary("+", _S.read(_e, "CY"), _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]), _S.read(_e, "rho")), _S.read(_e, "R0")), _S.read(_e, "ry"))))
	_S.define(_e, "tw", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "r"), "int", [14, 22])), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))]))
	_S.define(_e, "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "q"), 6)]), (1 if _S.truth(_S.binary(">", _S.read(_e, "rho"), 0.25)) else _S.binary("/", _S.read(_e, "rho"), 0.25))))
	if _S.truth(_S.binary(">", _S.read(_e, "tw"), _S.unary("-", 0.3))):
		_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "rho"), 0.6), func(): return _S.binary(">", _S.read(_e, "tw"), 0.6))) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "rho"), 0.45)) else _S.prop(_S.read(_e, "C"), 5))), _S.read(_e, "a")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	var _v5 = _S.read(_e, "s")
	_S.define(_e, "C", _S.prop(_v5, "C"))
	_S.define(_e, "rx", _S.prop(_v5, "rx"))
	_S.define(_e, "ry", _S.prop(_v5, "ry"))
	_S.define(_e, "ph", _S.prop(_v5, "ph"))
	_S.define(_e, "S", _S.prop(_v5, "S"))
	_S.define(_e, "CY", _S.prop(_v5, "CY"))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 7)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "k", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_v7, "ph"), 2), _S.binary("/", _S.read(_v7, "i"), 7)), 1))
		_S.define(_v7, "th", _S.binary("+", _S.binary("+", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_v7, "i"), 2.39), _S.read(_v7, "S")), _S.read(_v7, "TAU")), _S.binary("*", _S.binary("*", _S.read(_v7, "ph"), _S.read(_v7, "TAU")), 2)), _S.binary("*", _S.read(_v7, "k"), 2.5)))
		_S.define(_v7, "rho", _S.binary("-", _S.binary("+", 1.2, _S.binary("*", 0.35, _S.binary("%", _S.binary("*", _S.read(_v7, "i"), 0.618), 1))), _S.binary("*", 0.3, _S.invoke(_S.read(_v7, "ease"), "inQuad", [_S.read(_v7, "k")]))))
		_S.define(_v7, "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "th")]), _S.read(_v7, "rho")), _S.read(_v7, "rx")))
		_S.define(_v7, "y", _S.binary("+", _S.read(_v7, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "th")]), _S.read(_v7, "rho")), _S.read(_v7, "ry"))))
		_S.define(_v7, "a", _S.invoke(_S.read(_v7, "Math"), "min", [1, _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.binary("*", _S.read(_v7, "k"), _S.prop(_S.read(_v7, "Math"), "PI"))]), 2.2)]))
		_S.call_value(_S.read(_v7, "mote"), [_S.read(_v7, "p"), _S.read(_v7, "x"), _S.read(_v7, "y"), _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "th")])), _S.read(_v7, "rx")), 10), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "th")]), _S.read(_v7, "ry")), 10), (_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.binary("%", _S.read(_v7, "i"), 3)) else _S.read(_v7, "WHITE")), 0.6, _S.read(_v7, "a"), 0.3])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	var _v8 = _S.read(_e, "s")
	_S.define(_e, "C", _S.prop(_v8, "C"))
	_S.define(_e, "ph", _S.prop(_v8, "ph"))
	_S.define(_e, "S", _S.prop(_v8, "S"))
	_S.define(_e, "rim", _S.prop(_v8, "rim"))
	_S.define(_e, "at", _S.prop(_v8, "at"))
	_S.define(_e, "t", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "D")))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 60, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 7), 1), _S.function_value(_e, "_f11"), _S.function_value(_e, "_f12")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 12, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 7), 2), _S.function_value(_e, "_f14"), _S.function_value(_e, "_f15")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.3, 0.5])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "a0", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "d0", _S.invoke(_S.read(_e, "r"), "range", [1.8, 3]))
	_S.define(_e, "spin", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0.8, 1.8]), (1 if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.8])) else 0.35)))
	_S.define(_e, "size", _S.invoke(_S.read(_e, "r"), "range", [0.8, 1.5]))
	_S.define(_e, "hue", _S.invoke(_S.read(_e, "r"), "next", []))
	_S.define(_e, "pos", _S.function_value(_e, "_f13"))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	var _v9 = _S.call_value(_S.read(_e, "pos"), [_S.read(_e, "q")])
	_S.define(_e, "x", _S.prop(_v9, 0))
	_S.define(_e, "y", _S.prop(_v9, 1))
	var _v10 = _S.call_value(_S.read(_e, "pos"), [_S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("+", _S.read(_e, "q"), 0.015)])])
	_S.define(_e, "x2", _S.prop(_v10, 0))
	_S.define(_e, "y2", _S.prop(_v10, 1))
	_S.define(_e, "vx", _S.binary("/", _S.binary("-", _S.read(_e, "x2"), _S.read(_e, "x")), _S.binary("*", 0.015, _S.read(_e, "life"))))
	_S.define(_e, "vy", _S.binary("/", _S.binary("-", _S.read(_e, "y2"), _S.read(_e, "y")), _S.binary("*", 0.015, _S.read(_e, "life"))))
	_S.define(_e, "rho", _S.binary("*", _S.read(_e, "d0"), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "q"), 1.4]))))
	_S.define(_e, "R0", _S.call_value(_S.read(_e, "rim"), [_S.binary("+", _S.read(_e, "a0"), _S.binary("*", _S.binary("*", _S.read(_e, "spin"), _S.read(_e, "q")), _S.read(_e, "q")))]))
	_S.define(_e, "fade", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "q"), 5)]))
	if _S.truth(_S.binary(">", _S.read(_e, "rho"), _S.binary("+", _S.read(_e, "R0"), 0.06))):
		_S.call_value(_S.read(_e, "mote"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "vx"), _S.read(_e, "vy"), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "hue"), 0.25)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "hue"), 0.55)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "hue"), 0.8)) else _S.prop(_S.read(_e, "C"), 4)))), (_S.read(_e, "size") if _S.truth(_S.binary("<", _S.read(_e, "hue"), 0.8)) else _S.binary("*", _S.read(_e, "size"), 1.4)), _S.read(_e, "fade"), (0.4 if _S.truth(_S.binary("<", _S.read(_e, "hue"), 0.8)) else 0.15)])
	else:
		if _S.truth(_S.binary(">", _S.read(_e, "rho"), 0.3)):
			_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "rho"), 0.65)) else _S.prop(_S.read(_e, "C"), 5)), _S.read(_e, "rho")])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "at"), [_S.binary("+", _S.read(_e, "a0"), _S.binary("*", _S.binary("*", _S.read(_e, "spin"), _S.read(_e, "q")), _S.read(_e, "q"))), _S.binary("*", _S.read(_e, "d0"), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "q"), 1.4])))])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.36, 0.5])

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "a0", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "d0", _S.invoke(_S.read(_e, "r"), "range", [2.3, 3]))
	_S.define(_e, "spin", _S.invoke(_S.read(_e, "r"), "range", [0.2, 0.5]))
	_S.define(_e, "qc", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("/", 1.05, _S.read(_e, "d0")))]))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "pos", _S.function_value(_e, "_f16"))
	if _S.truth(_S.binary("<", _S.read(_e, "q"), _S.read(_e, "qc"))):
		var _v11 = _S.scope(_e)
		var _v12 = _S.call_value(_S.read(_v11, "pos"), [_S.read(_v11, "q")])
		_S.define(_v11, "x", _S.prop(_v12, 0))
		_S.define(_v11, "y", _S.prop(_v12, 1))
		var _v13 = _S.call_value(_S.read(_v11, "pos"), [_S.binary("+", _S.read(_v11, "q"), 0.015)])
		_S.define(_v11, "x2", _S.prop(_v13, 0))
		_S.define(_v11, "y2", _S.prop(_v13, 1))
		_S.call_value(_S.read(_v11, "streak"), [_S.read(_v11, "p"), _S.read(_v11, "x"), _S.read(_v11, "y"), _S.binary("/", _S.binary("-", _S.read(_v11, "x2"), _S.read(_v11, "x")), _S.binary("*", 0.015, _S.read(_v11, "life"))), _S.binary("/", _S.binary("-", _S.read(_v11, "y2"), _S.read(_v11, "y")), _S.binary("*", 0.015, _S.read(_v11, "life"))), _S.prop(_S.read(_v11, "C"), 6), _S.invoke(_S.read(_v11, "Math"), "min", [1, _S.binary("*", _S.read(_v11, "q"), 5)])])
	else:
		var _v14 = _S.scope(_e)
		_S.define(_v14, "k", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v14, "q"), _S.read(_v14, "qc")), _S.binary("-", 1, _S.read(_v14, "qc")))))
		var _v15 = _S.call_value(_S.read(_v14, "pos"), [_S.read(_v14, "qc")])
		_S.define(_v14, "x", _S.prop(_v15, 0))
		_S.define(_v14, "y", _S.prop(_v15, 1))
		if _S.truth(_S.binary(">", _S.read(_v14, "k"), 0.55)):
			_S.invoke(_S.read(_v14, "p"), "px", [_S.read(_v14, "x"), _S.read(_v14, "y"), _S.read(_v14, "WHITE")])
		_S.invoke(_S.read(_v14, "p"), "glow", [_S.read(_v14, "x"), _S.read(_v14, "y"), 7, _S.prop(_S.read(_v14, "C"), 6), _S.binary("*", _S.binary("*", 0.6, _S.read(_v14, "k")), _S.read(_v14, "k"))])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "at"), [_S.binary("+", _S.read(_e, "a0"), _S.binary("*", _S.binary("*", _S.read(_e, "spin"), _S.read(_e, "q")), _S.read(_e, "q"))), _S.binary("*", _S.read(_e, "d0"), _S.binary("-", 1, _S.binary("*", _S.read(_e, "q"), _S.read(_e, "q"))))])

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	var _v16 = _S.read(_e, "s")
	_S.define(_e, "C", _S.prop(_v16, "C"))
	_S.define(_e, "ph", _S.prop(_v16, "ph"))
	_S.define(_e, "S", _S.prop(_v16, "S"))
	_S.define(_e, "CY", _S.prop(_v16, "CY"))
	_S.define(_e, "ry", _S.prop(_v16, "ry"))
	_S.define(_e, "t", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "D")))
	_S.define(_e, "foot", _S.binary("+", _S.read(_e, "CY"), _S.read(_e, "ry")))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 14, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 7), 3), _S.function_value(_e, "_f18"), _S.function_value(_e, "_f19")])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.7, 1.1])

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "side", _S.invoke(_S.read(_e, "r"), "sign", []))
	_S.define(_e, "x0", _S.binary("*", _S.read(_e, "side"), _S.invoke(_S.read(_e, "r"), "range", [22, 50])))
	_S.define(_e, "y0", _S.binary("-", _S.unary("-", 1), _S.invoke(_S.read(_e, "r"), "range", [0, 1.5])))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "e", _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.read(_e, "q")]))
	_S.define(_e, "x", _S.binary("*", _S.read(_e, "x0"), _S.binary("-", 1, _S.read(_e, "e"))))
	_S.define(_e, "y", _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.binary("+", _S.read(_e, "foot"), 2), _S.call_value(_S.read(_e, "smooth"), [0.55, 1, _S.read(_e, "q")]))))
	var _v17 = [_S.binary("*", _S.read(_e, "x0"), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "q"), 0.04)])]))), _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.binary("+", _S.read(_e, "foot"), 2), _S.call_value(_S.read(_e, "smooth"), [0.55, 1, _S.binary("-", _S.read(_e, "q"), 0.04)])))]
	_S.define(_e, "xb", _S.prop(_v17, 0))
	_S.define(_e, "yb", _S.prop(_v17, 1))
	_S.define(_e, "big", _S.invoke(_S.read(_e, "r"), "chance", [0.3]))
	_S.call_value(_S.read(_e, "mote"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "xb")), 25), _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "yb")), 25), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.read(_e, "big")) else _S.prop(_S.read(_e, "C"), 5)), (0.9 if _S.truth(_S.read(_e, "big")) else 0.6), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "q"), 4)]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.85, 1, _S.read(_e, "q")]))), 0.3])
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	var _v18 = _S.read(_e, "s")
	_S.define(_e, "C", _S.prop(_v18, "C"))
	_S.define(_e, "ph", _S.prop(_v18, "ph"))
	_S.define(_e, "pulse", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2)]))))
	var _v19 = _S.scope(_e)
	_S.define(_v19, "x", _S.unary("-", 36))
	while _S.truth(_S.binary("<=", _S.read(_v19, "x"), 36)):
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "u", _S.binary("/", _S.invoke(_S.read(_v20, "Math"), "abs", [_S.binary("+", _S.read(_v20, "x"), 0.5)]), 36))
		_S.define(_v20, "a", _S.binary("*", (1 if _S.truth(_S.binary("<", _S.read(_v20, "u"), 0.55)) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v20, "u"), 0.55), 0.45))), _S.binary("+", 0.8, _S.binary("*", 0.2, _S.read(_v20, "pulse")))))
		_S.invoke(_S.read(_v20, "p"), "dot", [_S.read(_v20, "x"), 0, (_S.read(_v20, "WHITE") if _S.truth(_S.binary("<", _S.read(_v20, "u"), 0.2)) else (_S.prop(_S.read(_v20, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v20, "u"), 0.5)) else _S.prop(_S.read(_v20, "C"), 5))), _S.read(_v20, "a")])
		if _S.truth(_S.binary("<", _S.read(_v20, "u"), 0.3)):
			_S.invoke(_S.read(_v20, "p"), "dot", [_S.read(_v20, "x"), 1, (_S.prop(_S.read(_v20, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v20, "u"), 0.15)) else _S.prop(_S.read(_v20, "C"), 4)), (1 if _S.truth(_S.binary("<", _S.read(_v20, "u"), 0.15)) else 0.5)])
		_v19 = _S.iteration(_v19)
		_S.write(_v19, "x", 1, "+=", true)
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.call_value(_S.read(_e, "floor"), [_S.read(_e, "p"), _S.call_value(_S.read(_e, "setup"), [_S.read(_e, "t"), _S.read(_e, "o")])])
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "s", _S.call_value(_S.read(_e, "setup"), [_S.read(_e, "t"), _S.read(_e, "o")]))
	var _v21 = _S.read(_e, "s")
	_S.define(_e, "C", _S.prop(_v21, "C"))
	_S.define(_e, "CY", _S.prop(_v21, "CY"))
	_S.define(_e, "rx", _S.prop(_v21, "rx"))
	_S.define(_e, "ry", _S.prop(_v21, "ry"))
	_S.define(_e, "ph", _S.prop(_v21, "ph"))
	_S.define(_e, "rim", _S.prop(_v21, "rim"))
	_S.define(_e, "spots", _S.prop(_v21, "spots"))
	_S.define(_e, "pulse", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2)]))))
	_S.call_value(_S.read(_e, "rift"), [_S.read(_e, "p"), _S.read(_e, "s")])
	_S.call_value(_S.read(_e, "well"), [_S.read(_e, "p"), _S.read(_e, "s")])
	_S.call_value(_S.read(_e, "orbit"), [_S.read(_e, "p"), _S.read(_e, "s")])
	_S.call_value(_S.read(_e, "infall"), [_S.read(_e, "p"), _S.read(_e, "s")])
	_S.call_value(_S.read(_e, "skaters"), [_S.read(_e, "p"), _S.read(_e, "s")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "CY"), _S.binary("*", _S.read(_e, "ry"), 5), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.17, _S.read(_e, "pulse"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "CY"), _S.binary("*", _S.read(_e, "ry"), 2.6), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.1, _S.read(_e, "pulse"))])
	var _v22 = _S.scope(_e)
	_S.define(_v22, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v22, "i"), 16)):
		var _v23 = _S.scope(_v22)
		_S.define(_v23, "th", _S.binary("*", _S.binary("/", _S.read(_v23, "i"), 16), _S.read(_v23, "TAU")))
		_S.define(_v23, "R0", _S.binary("*", _S.call_value(_S.read(_v23, "rim"), [_S.read(_v23, "th")]), 1.08))
		_S.invoke(_S.read(_v23, "p"), "glow", [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "th")]), _S.read(_v23, "R0")), _S.read(_v23, "rx")), _S.binary("+", _S.read(_v23, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "th")]), _S.read(_v23, "R0")), _S.read(_v23, "ry"))), 15, _S.prop(_S.read(_v23, "C"), 4), _S.binary("*", 0.15, _S.read(_v23, "pulse"))])
		_v22 = _S.iteration(_v22)
		_S.write(_v22, "i", 1, "+=", true)
	for _v24 in _S.array(_S.read(_e, "spots")):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "th", _v24)
		_S.invoke(_S.read(_v25, "p"), "glow", [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.read(_v25, "th")]), _S.call_value(_S.read(_v25, "rim"), [_S.read(_v25, "th")])), _S.read(_v25, "rx")), _S.binary("+", _S.read(_v25, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.read(_v25, "th")]), _S.call_value(_S.read(_v25, "rim"), [_S.read(_v25, "th")])), _S.read(_v25, "ry"))), 16, _S.prop(_S.read(_v25, "C"), 6), 0.42])
	var _v26 = _S.scope(_e)
	_S.define(_v26, "i", _S.unary("-", 3))
	while _S.truth(_S.binary("<=", _S.read(_v26, "i"), 3)):
		_S.invoke(_S.read(_v26, "p"), "glow", [_S.binary("*", _S.read(_v26, "i"), 7), _S.unary("-", 1), 16, _S.prop(_S.read(_v26, "C"), 5), _S.binary("*", 0.12, _S.read(_v26, "pulse"))])
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "i", 1, "+=", true)
	return null

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.binary("-", _S.read(_e, "a"), _S.binary("*", _S.read(_e, "TAU"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.binary("+", _S.read(_e, "a"), _S.prop(_S.read(_e, "Math"), "PI")), _S.read(_e, "TAU"))])))
