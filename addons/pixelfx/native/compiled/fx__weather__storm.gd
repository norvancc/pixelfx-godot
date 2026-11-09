@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/storm.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "pass", _S.import_value("fx/weather/_lib.js", "pass"))
	_S.define(_e, "box", _S.import_value("fx/weather/_lib.js", "box"))
	_S.define(_e, "field", _S.import_value("fx/weather/_lib.js", "field"))
	_S.define(_e, "sample", _S.import_value("fx/weather/_lib.js", "sample"))
	_S.define(_e, "trips", _S.import_value("fx/weather/_lib.js", "trips"))
	_S.define(_e, "tree", _S.import_value("fx/weather/_lib.js", "tree"))
	_S.define(_e, "wave", _S.import_value("fx/weather/_lib.js", "wave"))
	_S.define(_e, "bayer", _S.import_value("fx/weather/_lib.js", "bayer"))
	_S.define(_e, "splash", _S.import_value("fx/weather/_lib.js", "splash"))
	_S.define(_e, "sheetAt", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "sky", _S.function_value(_e, "_f5"))
	_S.define(_e, "rolls", _S.function_value(_e, "_f7"))
	_S.define(_e, "veil", _S.function_value(_e, "_f9"))
	_S.define(_e, "deck", _S.function_value(_e, "_f11"))
	_S.define(_e, "rain", _S.function_value(_e, "_f12"))
	_S.define(_e, "channel", _S.function_value(_e, "_f16"))
	_S.define(_e, "bolt", _S.function_value(_e, "_f18"))
	_S.define(_e, "crawler", _S.function_value(_e, "_f20"))
	_S.define(_e, "stroke", _S.function_value(_e, "_f21"))
	_S.define(_e, "strike", _S.function_value(_e, "_f22"))
	_S.define(_e, "floor", _S.function_value(_e, "_f25"))
	_S.define(_e, "meta", _S.merge([{"name": "Storm"}, {"desc": "Driving rain at two depths under a churning cloud deck; a forked bolt strikes in a double flash that lights the sky and the rain, then sheet lightning glows in the clouds."}, {"tags": ["weather", "storm", "rain", "lightning", "thunder", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 10}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#09080f", "#121120", "#1b1a30", "#262541", "#363a5c", "#4f5d8c", "#7790c6", "#c2d6ff"]}, {"bolt": ["#2a1a6e", "#4835c2", "#6a6cff", "#78b8ff", "#c6ebff", "#ffffff"]}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 10)
	_S.define(_e, "SLANT", 0.42)
	_S.define(_e, "T_LEAD", 2.62)
	_S.define(_e, "T1", 3)
	_S.define(_e, "T2", 3.3)
	_S.define(_e, "T_SHEET", 6.4)
	_S.define(_e, "T_FAR", 8.6)
	_S.define(_e, "BX0", 62)
	_S.define(_e, "BY0", _S.unary("-", 136))
	_S.define(_e, "BX1", 52)
	_S.define(_e, "BY1", 3)
	_S.define(_e, "F1", [1, 0.62, 0.95, 0.4, 0.7, 0.22])
	_S.define(_e, "F2", [0.92, 0.5, 0.8, 0.3, 0.12])
	_S.define(_e, "env", _S.function_value(_e, "_f29"))
	_S.define(_e, "flashAt", _S.function_value(_e, "_f30"))
	_S.define(_e, "blink", _S.function_value(_e, "_f31"))
	_S.define(_e, "farAt", _S.function_value(_e, "_f32"))
	_S.define(_e, "far2At", _S.function_value(_e, "_f33"))
	_S.define(_e, "snap", _S.function_value(_e, "_f34"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_S.define(_e, "ROWS", [_S.merge([{"base": _S.unary("-", 161)}, {"wob": 3}, {"n": 18}, {"rx": [16, 30]}, {"ry": 0.8}, {"drift": 15}, {"life": [4, 7]}, {"tone": [1, 2, 3, 4]}, {"tex": 1}]), _S.merge([{"base": _S.unary("-", 150)}, {"wob": 3}, {"n": 22}, {"rx": [10, 20]}, {"ry": 0.85}, {"drift": 10}, {"life": [3.5, 6.5]}, {"tone": [1, 2, 3, 5]}, {"tex": 1}]), _S.merge([{"base": _S.unary("-", 140)}, {"wob": 3}, {"n": 26}, {"rx": [7, 14]}, {"ry": 0.9}, {"drift": 6}, {"life": [3, 6]}, {"tone": [2, 2, 3, 5]}, {"tex": 0}, {"haze": true}])])
	_S.define(_e, "sag", _S.function_value(_e, "_f35"))
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "a", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "T_SHEET")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "a"), 0), func(): return _S.binary(">", _S.read(_e, "a"), 0.9))):
		return 0
	_S.define(_e, "p1", _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "a"), 0.08), 0.05), 2))]))
	_S.define(_e, "p2", _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "a"), 0.3), 0.09), 2))]))
	_S.define(_e, "tail", (_S.binary("*", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_e, "a"), 0.3)), 6)]), 0.5) if _S.truth(_S.binary(">", _S.read(_e, "a"), 0.3)) else 0))
	return _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("+", _S.binary("+", _S.binary("*", 0.7, _S.read(_e, "p1")), _S.read(_e, "p2")), _S.read(_e, "tail"))]), (0.75 if _S.truth(_S.binary("===", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "a"), 30)]), 3), 1)) else 1))

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.write(_e, "t", _S.call_value(_S.read(_e, "snap"), [_S.read(_e, "t")]), "=", false)
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "box"), [_S.read(_e, "meta")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "V", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "bolt"), 6]))
	_S.define(_e, "f", _S.call_value(_S.read(_e, "flashAt"), [_S.read(_e, "t")]))
	_S.define(_e, "sh", _S.call_value(_S.read(_e, "sheetAt"), [_S.read(_e, "t")]))
	_S.define(_e, "far", _S.call_value(_S.read(_e, "farAt"), [_S.read(_e, "t")]))
	_S.define(_e, "lead", (_S.binary("+", 0.25, _S.binary("*", 0.2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 70)]))) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "T_LEAD")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T1")))) else 0))
	_S.define(_e, "pre", (_S.binary("*", 0.12, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "T_LEAD")), 41)])])) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "T_LEAD"), 0.5)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_LEAD")))) else 0))
	_S.define(_e, "srcs", [])
	if _S.truth(_S.binary(">", _S.binary("+", _S.binary("+", _S.read(_e, "f"), _S.read(_e, "lead")), _S.read(_e, "pre")), 0)):
		_S.invoke(_S.read(_e, "srcs"), "push", [[_S.read(_e, "BX0"), _S.binary("-", _S.read(_e, "BY0"), 6), 150, _S.binary("+", _S.binary("+", _S.read(_e, "f"), _S.binary("*", _S.read(_e, "lead"), 0.5)), _S.read(_e, "pre"))]])
	if _S.truth(_S.binary(">", _S.read(_e, "sh"), 0)):
		_S.invoke(_S.read(_e, "srcs"), "push", [[_S.unary("-", 96), _S.unary("-", 146), 120, _S.read(_e, "sh")]])
	if _S.truth(_S.binary(">", _S.read(_e, "far"), 0)):
		_S.invoke(_S.read(_e, "srcs"), "push", [[128, _S.unary("-", 156), 80, _S.read(_e, "far")]])
	if _S.truth(_S.binary(">", _S.call_value(_S.read(_e, "far2At"), [_S.read(_e, "t")]), 0)):
		_S.invoke(_S.read(_e, "srcs"), "push", [[_S.unary("-", 40), _S.unary("-", 160), 70, _S.call_value(_S.read(_e, "far2At"), [_S.read(_e, "t")])]])
	_S.define(_e, "litAt", _S.function_value(_e, "_f2"))
	_S.call_value(_S.read(_e, "sky"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "f"), _S.read(_e, "V")])
	if _S.truth(_S.binary(">", _S.read(_e, "sh"), 0.05)):
		_S.call_value(_S.read(_e, "pass"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.unary("-", 170), 0, _S.function_value(_e, "_f3")])
	_S.call_value(_S.read(_e, "veil"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), _S.read(_e, "V"), _S.read(_e, "f")])
	_S.call_value(_S.read(_e, "rain"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), _S.read(_e, "V"), _S.read(_e, "f"), 0])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "T_LEAD")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "T2"), 0.7)))):
		_S.call_value(_S.read(_e, "bolt"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "V")])
	_S.call_value(_S.read(_e, "deck"), [_S.read(_e, "q"), _S.read(_e, "B"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), _S.read(_e, "V"), _S.read(_e, "litAt"), _S.binary(">", _S.prop(_S.read(_e, "srcs"), "length"), 0)])
	_S.call_value(_S.read(_e, "crawler"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "V")])
	_S.call_value(_S.read(_e, "floor"), [_S.read(_e, "q"), _S.read(_e, "B"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), _S.read(_e, "V"), _S.read(_e, "f")])
	_S.call_value(_S.read(_e, "strike"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), _S.read(_e, "V")])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "L", 0)
	for _v0 in _S.array(_S.read(_e, "srcs")):
		var _v1 = _S.scope(_e)
		var _v2 = _v0
		_S.define(_v1, "sx", _S.prop(_v2, 0))
		_S.define(_v1, "sy", _S.prop(_v2, 1))
		_S.define(_v1, "R", _S.prop(_v2, 2))
		_S.define(_v1, "k", _S.prop(_v2, 3))
		var _v3 = _S.scope(_v1)
		_S.define(_v3, "d", _S.binary("/", _S.invoke(_S.read(_v3, "Math"), "hypot", [_S.binary("-", _S.read(_v3, "x"), _S.read(_v3, "sx")), _S.binary("*", _S.binary("-", _S.read(_v3, "y"), _S.read(_v3, "sy")), 1.5)]), _S.read(_v3, "R")))
		if _S.truth(_S.binary("<", _S.read(_v3, "d"), 1)):
			_S.write(_v3, "L", _S.binary("*", _S.binary("*", _S.read(_v3, "k"), _S.binary("-", 1, _S.read(_v3, "d"))), _S.binary("-", 1, _S.read(_v3, "d"))), "+=", false)
	return _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "L")])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("+", _S.read(_e, "x"), 96), _S.binary("*", _S.binary("+", _S.read(_e, "y"), 150), 1.3)]), 170))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 1)):
		_S.last([_S.set_prop(_S.read(_e, "out"), "l", _S.prop(_S.read(_e, "V"), 2), "=", false), _S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "sh"), 0.3), _S.binary("-", 1, _S.read(_e, "d"))), _S.binary("-", 1, _S.read(_e, "d"))), "=", false)])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.write(_e, "t", _S.call_value(_S.read(_e, "snap"), [_S.read(_e, "t")]), "=", false)
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clip"), [_S.read(_e, "p"), _S.read(_e, "meta")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "V", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "bolt"), 6]))
	_S.define(_e, "f", _S.call_value(_S.read(_e, "flashAt"), [_S.read(_e, "t")]))
	_S.call_value(_S.read(_e, "rain"), [_S.read(_e, "q"), _S.read(_e, "t"), _S.read(_e, "S"), _S.read(_e, "C"), _S.read(_e, "V"), _S.read(_e, "f"), 1])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "f", _S.arg(_args, 2))
	_S.define(_e, "V", _S.arg(_args, 3))
	_S.define(_e, "k", _S.binary("*", _S.read(_e, "f"), 0.36))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0.01)):
		return null
	_S.define(_e, "c", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "V"), 2), _S.prop(_S.read(_e, "V"), 3), 0.6]))
	_S.call_value(_S.read(_e, "pass"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.unary("-", 170), 9, _S.function_value(_e, "_f6")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "x"), _S.binary("/", _S.binary("+", _S.read(_e, "BX0"), _S.read(_e, "BX1")), 2))]), 230))
	_S.set_prop(_S.read(_e, "out"), "l", _S.read(_e, "c"), "=", false)
	_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.read(_e, "k"), _S.binary("+", 0.2, _S.binary("*", 0.8, _S.binary("**", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.read(_e, "d"))]), 2.2)))), "=", false)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "S", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "ROWS"), "map", [_S.function_value(_e, "_f8")])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "Rw", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	_S.define(_e, "out", [])
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), _S.prop(_S.read(_v4, "Rw"), "n"))):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "L", _S.binary("+", _S.prop(_S.prop(_S.read(_v5, "Rw"), "life"), 0), _S.binary("*", _S.call_value(_S.read(_v5, "rand"), [_S.read(_v5, "S"), _S.read(_v5, "j"), _S.read(_v5, "i"), 1]), _S.binary("-", _S.prop(_S.prop(_S.read(_v5, "Rw"), "life"), 1), _S.prop(_S.prop(_S.read(_v5, "Rw"), "life"), 0)))))
		_S.define(_v5, "age", _S.call_value(_S.read(_v5, "wrap"), [_S.binary("-", _S.read(_v5, "t"), _S.binary("*", _S.call_value(_S.read(_v5, "rand"), [_S.read(_v5, "S"), _S.read(_v5, "j"), _S.read(_v5, "i"), 2]), _S.read(_v5, "D"))), _S.read(_v5, "D")]))
		if _S.truth(_S.binary(">=", _S.read(_v5, "age"), _S.read(_v5, "L"))):
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
			continue
		_S.define(_v5, "u", _S.binary("/", _S.read(_v5, "age"), _S.read(_v5, "L")))
		_S.define(_v5, "g", _S.binary("**", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v5, "Math"), "PI"), _S.read(_v5, "u"))]), 0.6))
		_S.define(_v5, "rx", _S.binary("+", _S.prop(_S.prop(_S.read(_v5, "Rw"), "rx"), 0), _S.binary("*", _S.call_value(_S.read(_v5, "rand"), [_S.read(_v5, "S"), _S.read(_v5, "j"), _S.read(_v5, "i"), 3]), _S.binary("-", _S.prop(_S.prop(_S.read(_v5, "Rw"), "rx"), 1), _S.prop(_S.prop(_S.read(_v5, "Rw"), "rx"), 0)))))
		_S.define(_v5, "ry", _S.binary("*", _S.read(_v5, "rx"), _S.prop(_S.read(_v5, "Rw"), "ry")))
		_S.define(_v5, "x", _S.binary("+", _S.binary("+", _S.unary("-", 200), _S.binary("*", _S.call_value(_S.read(_v5, "rand"), [_S.read(_v5, "S"), _S.read(_v5, "j"), _S.read(_v5, "i"), 4]), 400)), _S.binary("*", _S.prop(_S.read(_v5, "Rw"), "drift"), _S.binary("-", _S.read(_v5, "age"), _S.binary("/", _S.read(_v5, "L"), 2)))))
		_S.invoke(_S.read(_v5, "out"), "push", [_S.merge([{"x": _S.read(_v5, "x")}, {"h": _S.binary("*", _S.binary("*", _S.read(_v5, "ry"), _S.read(_v5, "g")), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.call_value(_S.read(_v5, "rand"), [_S.read(_v5, "S"), _S.read(_v5, "j"), _S.read(_v5, "i"), 5]))))}, {"rx": _S.binary("*", _S.read(_v5, "rx"), _S.binary("+", 0.8, _S.binary("*", 0.2, _S.read(_v5, "g"))))}])])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "V", _S.arg(_args, 4))
	_S.define(_e, "f", _S.arg(_args, 5))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "field"), [_S.binary("+", _S.read(_e, "S"), 11), 256, 128, [4, 8, 16]]))
	_S.define(_e, "shift", _S.binary("/", _S.binary("*", _S.binary("*", 256, 2), _S.read(_e, "t")), _S.read(_e, "D")))
	_S.define(_e, "glow", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "V"), 3), 0.5]))
	_S.call_value(_S.read(_e, "pass"), [_S.read(_e, "p"), _S.read(_e, "meta"), _S.unary("-", 170), _S.unary("-", 0.5), _S.function_value(_e, "_f10")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "n", _S.call_value(_S.read(_e, "sample"), [_S.read(_e, "F"), _S.binary("-", _S.binary("*", _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "y"), _S.read(_e, "SLANT"))), 1.9), _S.read(_e, "shift")), _S.binary("+", _S.binary("*", _S.read(_e, "y"), 0.16), 7)]))
	_S.define(_e, "dens", _S.call_value(_S.read(_e, "clamp"), [_S.binary("+", 0.45, _S.binary("*", _S.binary("-", _S.read(_e, "n"), 0.5), 2.6))]))
	_S.set_prop(_S.read(_e, "out"), "c", (_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 1), _S.read(_e, "glow"), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "f"), _S.read(_e, "dens")), 0.7), _S.invoke(_S.read(_e, "Math"), "max", [0.25, _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "BX1"))]), 220))]))])]) if _S.truth(_S.binary(">", _S.read(_e, "f"), 0.05)) else _S.prop(_S.read(_e, "C"), 1)), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.binary("+", 0.4, _S.binary("*", 0.38, _S.read(_e, "dens"))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "b", 1, "=", false)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "B", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "S", _S.arg(_args, 3))
	_S.define(_e, "C", _S.arg(_args, 4))
	_S.define(_e, "V", _S.arg(_args, 5))
	_S.define(_e, "litAt", _S.arg(_args, 6))
	_S.define(_e, "lit", _S.arg(_args, 7))
	_S.define(_e, "R", _S.call_value(_S.read(_e, "rolls"), [_S.read(_e, "S"), _S.read(_e, "t")]))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "field"), [_S.binary("+", _S.binary("*", _S.read(_e, "S"), 3), 1), 256, 128]))
	_S.define(_e, "drift", _S.binary("/", _S.binary("*", 256, _S.read(_e, "t")), _S.read(_e, "D")))
	_S.define(_e, "n", _S.prop(_S.read(_e, "ROWS"), "length"))
	_S.define(_e, "mo", _S.binary("**", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "t")), _S.read(_e, "D"))]), 2))
	_S.define(_e, "RAMP", [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "V"), 4), _S.read(_e, "WHITE")])
	_S.define(_e, "top", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "n")]))
	_S.define(_e, "bot", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "n")]))
	_S.define(_e, "bulge", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "n")]))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "x", _S.prop(_S.read(_v6, "B"), "x0"))
	while _S.truth(_S.binary("<", _S.read(_v6, "x"), _S.prop(_S.read(_v6, "B"), "x1"))):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "cx", _S.binary("+", _S.read(_v7, "x"), 0.5))
		_S.define(_v7, "low", _S.unary("-", 170))
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "j"), _S.read(_v8, "n"))):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "Rw", _S.prop(_S.read(_v9, "ROWS"), _S.read(_v9, "j")))
			_S.define(_v9, "und", _S.binary("*", _S.binary("-", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_v9, "sample"), [_S.read(_v9, "F"), _S.binary("+", _S.binary("*", _S.read(_v9, "cx"), 0.55), _S.binary("*", _S.read(_v9, "j"), 91)), 3]), _S.read(_v9, "mo")), _S.binary("*", _S.call_value(_S.read(_v9, "sample"), [_S.read(_v9, "F"), _S.binary("+", _S.binary("*", _S.read(_v9, "cx"), 0.55), _S.binary("*", _S.read(_v9, "j"), 91)), 60]), _S.binary("-", 1, _S.read(_v9, "mo")))), 0.5), 2))
			_S.define(_v9, "c", _S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v9, "Rw"), "base"), _S.binary("*", _S.call_value(_S.read(_v9, "sag"), [_S.read(_v9, "cx")]), _S.binary("+", 0.4, _S.binary("*", _S.read(_v9, "j"), 0.3)))), _S.binary("*", 7, _S.read(_v9, "und"))), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v9, "Rw"), "wob"), 2), _S.binary("-", _S.call_value(_S.read(_v9, "sample"), [_S.read(_v9, "F"), _S.binary("-", _S.binary("+", _S.binary("*", _S.read(_v9, "cx"), 1.8), _S.binary("*", _S.read(_v9, "j"), 61)), _S.binary("*", _S.read(_v9, "drift"), _S.binary("-", 0.5, _S.binary("*", _S.read(_v9, "j"), 0.1)))), _S.binary("+", 20, _S.binary("*", _S.read(_v9, "j"), 17))]), 0.5))))
			_S.define(_v9, "bump", 0)
			for _v10 in _S.array(_S.prop(_S.read(_v9, "R"), _S.read(_v9, "j"))):
				var _v11 = _S.scope(_v9)
				_S.define(_v11, "b", _v10)
				var _v12 = _S.scope(_v11)
				_S.define(_v12, "dx", _S.binary("/", _S.binary("-", _S.read(_v12, "cx"), _S.prop(_S.read(_v12, "b"), "x")), _S.prop(_S.read(_v12, "b"), "rx")))
				if _S.truth(_S.binary("<", _S.binary("*", _S.read(_v12, "dx"), _S.read(_v12, "dx")), 1)):
					_S.write(_v12, "bump", _S.invoke(_S.read(_v12, "Math"), "max", [_S.read(_v12, "bump"), _S.binary("*", _S.prop(_S.read(_v12, "b"), "h"), _S.invoke(_S.read(_v12, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_v12, "dx"), _S.read(_v12, "dx")))]))]), "=", false)
			_S.define(_v9, "y1", _S.binary("+", _S.read(_v9, "c"), _S.read(_v9, "bump")))
			_S.set_prop(_S.read(_v9, "top"), _S.read(_v9, "j"), _S.unary("-", 999), "=", false)
			_S.set_prop(_S.read(_v9, "bot"), _S.read(_v9, "j"), _S.read(_v9, "y1"), "=", false)
			_S.set_prop(_S.read(_v9, "bulge"), _S.read(_v9, "j"), _S.read(_v9, "bump"), "=", false)
			_S.write(_v9, "low", _S.invoke(_S.read(_v9, "Math"), "max", [_S.read(_v9, "low"), _S.read(_v9, "y1")]), "=", false)
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "j", 1, "+=", true)
		_S.define(_v7, "prev", _S.unary("-", 1))
		_S.define(_v7, "prevBot", _S.unary("-", 999))
		var _v13 = _S.scope(_v7)
		_S.define(_v13, "y", _S.prop(_S.read(_v13, "B"), "y0"))
		while _S.truth(_S.binary("<", _S.read(_v13, "y"), _S.read(_v13, "low"))):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "cy", _S.binary("+", _S.read(_v14, "y"), 0.5))
			_S.define(_v14, "j", 0)
			while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v14, "j"), _S.read(_v14, "n")), func(): return _S.unary("!", _S.logical("&&", _S.binary(">=", _S.read(_v14, "cy"), _S.prop(_S.read(_v14, "top"), _S.read(_v14, "j"))), func(): return _S.binary("<", _S.read(_v14, "cy"), _S.prop(_S.read(_v14, "bot"), _S.read(_v14, "j"))))))):
				_S.write(_v14, "j", 1, "+=", true)
			if _S.truth(_S.binary(">=", _S.read(_v14, "j"), _S.read(_v14, "n"))):
				var _v15 = _S.scope(_v14)
				_S.write(_v15, "prev", _S.unary("-", 1), "=", false)
				_v13 = _S.iteration(_v13)
				_S.write(_v13, "y", 1, "+=", true)
				continue
			if _S.truth(_S.binary("!==", _S.read(_v14, "j"), _S.read(_v14, "prev"))):
				var _v16 = _S.scope(_v14)
				if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v16, "prev"), 0), func(): return _S.binary("<", _S.read(_v16, "prev"), _S.read(_v16, "j")))):
					_S.write(_v16, "prevBot", _S.read(_v16, "cy"), "=", false)
				_S.write(_v16, "prev", _S.read(_v16, "j"), "=", false)
			_S.define(_v14, "Rw", _S.prop(_S.read(_v14, "ROWS"), _S.read(_v14, "j")))
			_S.define(_v14, "d", _S.binary("-", _S.prop(_S.read(_v14, "bot"), _S.read(_v14, "j")), _S.read(_v14, "cy")))
			_S.define(_v14, "tone", _S.prop(_S.read(_v14, "Rw"), "tone"))
			_S.define(_v14, "th", _S.call_value(_S.read(_v14, "bayer"), [_S.read(_v14, "x"), _S.read(_v14, "y")]))
			_S.define(_v14, "i", null)
			if _S.truth(_S.binary("<", _S.read(_v14, "d"), 1)):
				_S.write(_v14, "i", (_S.prop(_S.read(_v14, "tone"), 3) if _S.truth(_S.binary(">", _S.prop(_S.read(_v14, "bulge"), _S.read(_v14, "j")), 3)) else _S.binary("-", _S.prop(_S.read(_v14, "tone"), 3), 1)), "=", false)
			else:
				if _S.truth(_S.logical("&&", _S.binary("<", _S.binary("-", _S.read(_v14, "cy"), _S.read(_v14, "prevBot")), 1.5), func(): return _S.binary(">", _S.read(_v14, "j"), 0))):
					_S.write(_v14, "i", _S.invoke(_S.read(_v14, "Math"), "max", [0, _S.binary("-", _S.prop(_S.read(_v14, "tone"), 0), 1)]), "=", false)
				else:
					if _S.truth(_S.binary("<", _S.read(_v14, "d"), _S.binary("+", _S.binary("+", 2, _S.binary("*", _S.prop(_S.read(_v14, "bulge"), _S.read(_v14, "j")), 0.25)), _S.binary("*", _S.read(_v14, "th"), 2)))):
						_S.write(_v14, "i", _S.prop(_S.read(_v14, "tone"), 2), "=", false)
					else:
						if _S.truth(_S.binary("<", _S.read(_v14, "d"), _S.binary("+", _S.binary("+", 6, _S.binary("*", _S.prop(_S.read(_v14, "bulge"), _S.read(_v14, "j")), 0.4)), _S.binary("*", _S.read(_v14, "th"), 3)))):
							_S.write(_v14, "i", _S.prop(_S.read(_v14, "tone"), 1), "=", false)
						else:
							var _v17 = _S.scope(_v14)
							_S.define(_v17, "nn", _S.call_value(_S.read(_v17, "sample"), [_S.read(_v17, "F"), _S.binary("-", _S.binary("+", _S.binary("*", _S.read(_v17, "cx"), 0.9), _S.binary("*", _S.read(_v17, "j"), 77)), _S.binary("*", _S.read(_v17, "drift"), _S.binary("-", 0.6, _S.binary("*", _S.read(_v17, "j"), 0.12)))), _S.binary("+", _S.binary("*", _S.read(_v17, "cy"), 1.7), _S.binary("*", _S.read(_v17, "j"), 31))]))
							_S.write(_v17, "i", _S.binary("+", _S.prop(_S.read(_v17, "tone"), 0), (1 if _S.truth(_S.logical("&&", _S.prop(_S.read(_v17, "Rw"), "tex"), func(): return _S.binary(">", _S.read(_v17, "nn"), 0.6))) else 0)), "=", false)
			_S.define(_v14, "lk", 0)
			if _S.truth(_S.read(_v14, "lit")):
				var _v18 = _S.scope(_v14)
				_S.define(_v18, "Lv", _S.call_value(_S.read(_v18, "litAt"), [_S.read(_v18, "cx"), _S.read(_v18, "cy")]))
				if _S.truth(_S.binary(">", _S.read(_v18, "Lv"), 0.02)):
					var _v19 = _S.scope(_v18)
					_S.write(_v19, "i", _S.invoke(_S.read(_v19, "Math"), "min", [8, _S.binary("+", _S.read(_v19, "i"), _S.invoke(_S.read(_v19, "Math"), "round", [_S.binary("*", _S.read(_v19, "Lv"), (4.4 if _S.truth(_S.binary("<", _S.read(_v19, "d"), 1)) else (3.8 if _S.truth(_S.binary("<", _S.read(_v19, "d"), 4)) else 3.1)))]))]), "=", false)
					_S.write(_v19, "lk", _S.read(_v19, "Lv"), "=", false)
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v14, "Rw"), "haze"), func(): return _S.unary("!", _S.read(_v14, "lk"))), func(): return _S.binary(">=", _S.read(_v14, "d"), 1))):
				_S.invoke(_S.read(_v14, "q"), "blend", [_S.read(_v14, "x"), _S.read(_v14, "y"), _S.prop(_S.read(_v14, "RAMP"), _S.read(_v14, "i")), 0.75])
			else:
				_S.invoke(_S.read(_v14, "q"), "px", [_S.read(_v14, "x"), _S.read(_v14, "y"), _S.prop(_S.read(_v14, "RAMP"), _S.invoke(_S.read(_v14, "Math"), "max", [0, _S.read(_v14, "i")]))])
			if _S.truth(_S.binary(">", _S.read(_v14, "lk"), 0.03)):
				_S.invoke(_S.read(_v14, "q"), "light", [_S.read(_v14, "x"), _S.read(_v14, "y"), _S.prop(_S.read(_v14, "V"), 3), _S.binary("*", _S.read(_v14, "lk"), (0.4 if _S.truth(_S.binary("<", _S.read(_v14, "d"), 3)) else 0.22))])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "y", 1, "+=", true)
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "x", 1, "+=", true)
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "V", _S.arg(_args, 4))
	_S.define(_e, "f", _S.arg(_args, 5))
	_S.define(_e, "near", _S.arg(_args, 6))
	_S.define(_e, "litAt", _S.function_value(_e, "_f13"))
	if _S.truth(_S.unary("!", _S.read(_e, "near"))):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "BODY", [_S.prop(_S.read(_v20, "C"), 4), _S.prop(_S.read(_v20, "C"), 4), _S.prop(_S.read(_v20, "C"), 5)])
		_S.define(_v20, "HEAD", [_S.prop(_S.read(_v20, "C"), 5), _S.prop(_S.read(_v20, "C"), 6), _S.prop(_S.read(_v20, "C"), 6)])
		_S.call_value(_S.read(_v20, "trips"), [_S.read(_v20, "t"), _S.read(_v20, "D"), 300, _S.binary("+", _S.binary("*", _S.read(_v20, "S"), 7), 1), 22, 28, _S.function_value(_v20, "_f14")])
		return null
	_S.define(_e, "BODY", [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "V"), 4)])
	_S.define(_e, "HEAD", [_S.prop(_S.read(_e, "C"), 7), _S.read(_e, "WHITE"), _S.read(_e, "WHITE")])
	_S.define(_e, "TAIL", [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "V"), 3)])
	_S.call_value(_S.read(_e, "trips"), [_S.read(_e, "t"), _S.read(_e, "D"), 84, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 7), 2), 30, 38, _S.function_value(_e, "_f15")])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "L", _S.binary("*", _S.read(_e, "f"), _S.binary("+", 0.3, _S.binary("*", 0.7, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "BX1"))]), 170))])))))
	return (2 if _S.truth(_S.binary(">", _S.read(_e, "L"), 0.45)) else (1 if _S.truth(_S.binary(">", _S.read(_e, "L"), 0.15)) else 0))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "m", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "j", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "k"), _S.read(_e, "m")]))
	_S.define(_e, "stop", _S.binary("-", _S.unary("-", 14), _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "i"), _S.read(_e, "j"), 1]), 90)))
	_S.define(_e, "y", _S.binary("+", _S.unary("-", 176), _S.binary("*", _S.binary("+", _S.read(_e, "stop"), 176), _S.read(_e, "u"))))
	_S.define(_e, "x", _S.binary("-", _S.binary("+", _S.unary("-", 170), _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "i"), _S.read(_e, "j"), 2]), 360)), _S.binary("*", _S.binary("-", _S.read(_e, "stop"), _S.read(_e, "y")), _S.read(_e, "SLANT"))))
	_S.define(_e, "L", _S.binary("+", 3, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "i"), _S.read(_e, "j"), 3]), 2)))
	_S.define(_e, "ux", _S.binary("/", _S.read(_e, "SLANT"), _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "SLANT"), 1])))
	_S.define(_e, "uy", _S.binary("/", 1, _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "SLANT"), 1])))
	_S.define(_e, "lit", _S.call_value(_S.read(_e, "litAt"), [_S.read(_e, "x")]))
	_S.define(_e, "body", _S.prop(_S.read(_e, "BODY"), _S.read(_e, "lit")))
	_S.define(_e, "head", _S.prop(_S.read(_e, "HEAD"), _S.read(_e, "lit")))
	_S.invoke(_S.read(_e, "q"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "L"))), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "L"))), _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "L")), 0.4)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "L")), 0.4)), _S.read(_e, "body")])
	_S.invoke(_S.read(_e, "q"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "L")), 0.4)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "L")), 0.4)), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "head")])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "m", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "j", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "k"), _S.read(_e, "m")]))
	_S.define(_e, "z", _S.binary("+", 1, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "i"), _S.read(_e, "j"), 1]), 4)))
	_S.define(_e, "y", _S.binary("+", _S.unary("-", 180), _S.binary("*", _S.binary("+", _S.read(_e, "z"), 180), _S.read(_e, "u"))))
	_S.define(_e, "x", _S.binary("-", _S.binary("+", _S.unary("-", 175), _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "i"), _S.read(_e, "j"), 2]), 370)), _S.binary("*", _S.binary("-", _S.read(_e, "z"), _S.read(_e, "y")), _S.read(_e, "SLANT"))))
	_S.define(_e, "L", _S.binary("+", 9, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "i"), _S.read(_e, "j"), 3]), 5)))
	_S.define(_e, "ux", _S.binary("/", _S.read(_e, "SLANT"), _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "SLANT"), 1])))
	_S.define(_e, "uy", _S.binary("/", 1, _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "SLANT"), 1])))
	_S.define(_e, "lit", _S.call_value(_S.read(_e, "litAt"), [_S.read(_e, "x")]))
	_S.define(_e, "body", _S.prop(_S.read(_e, "BODY"), _S.read(_e, "lit")))
	_S.define(_e, "head", _S.prop(_S.read(_e, "HEAD"), _S.read(_e, "lit")))
	_S.define(_e, "tail", _S.prop(_S.read(_e, "TAIL"), _S.read(_e, "lit")))
	_S.invoke(_S.read(_e, "q"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "L"))), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "L"))), _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "L")), 0.55)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "L")), 0.55)), _S.read(_e, "tail")])
	_S.invoke(_S.read(_e, "q"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "L")), 0.55)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "L")), 0.55)), _S.binary("-", _S.read(_e, "x"), _S.read(_e, "ux")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "uy")), _S.read(_e, "body")])
	_S.invoke(_S.read(_e, "q"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "head")])
	_S.define(_e, "dur", _S.binary("/", _S.read(_e, "D"), _S.read(_e, "m")))
	_S.define(_e, "age", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "dur")))
	if _S.truth(_S.binary("<", _S.read(_e, "age"), 0.4)):
		var _v21 = _S.scope(_e)
		_S.define(_v21, "jp", _S.call_value(_S.read(_v21, "wrap"), [_S.binary("-", _S.read(_v21, "k"), 1), _S.read(_v21, "m")]))
		_S.define(_v21, "zp", _S.binary("+", 1, _S.binary("*", _S.call_value(_S.read(_v21, "rand"), [_S.read(_v21, "S"), _S.read(_v21, "i"), _S.read(_v21, "jp"), 1]), 4)))
		_S.define(_v21, "xp", _S.binary("+", _S.unary("-", 175), _S.binary("*", _S.call_value(_S.read(_v21, "rand"), [_S.read(_v21, "S"), _S.read(_v21, "i"), _S.read(_v21, "jp"), 2]), 370)))
		_S.define(_v21, "lit", _S.call_value(_S.read(_v21, "litAt"), [_S.read(_v21, "xp")]))
		_S.call_value(_S.read(_v21, "splash"), [_S.read(_v21, "q"), _S.read(_v21, "xp"), _S.read(_v21, "zp"), _S.read(_v21, "age"), _S.binary("+", 0.25, _S.binary("/", _S.binary("-", _S.read(_v21, "zp"), 1), 5.3)), _S.merge([{"hot": (_S.read(_v21, "WHITE") if _S.truth(_S.read(_v21, "lit")) else _S.prop(_S.read(_v21, "C"), 7))}, {"cool": _S.prop([_S.prop(_S.read(_v21, "C"), 5), _S.prop(_S.read(_v21, "C"), 6), _S.prop(_S.read(_v21, "V"), 4)], _S.read(_v21, "lit"))}]), _S.call_value(_S.read(_v21, "rand"), [_S.read(_v21, "S"), _S.read(_v21, "i"), _S.read(_v21, "jp"), 4])])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "S", _S.arg(_args, 0))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.binary("*", _S.read(_e, "S"), 31), 1)]))
	_S.define(_e, "P", _S.call_value(_S.read(_e, "tree"), [_S.read(_e, "R"), _S.read(_e, "BX0"), _S.read(_e, "BY0"), _S.read(_e, "BX1"), _S.read(_e, "BY1"), 0.26, 0.18]))
	_S.define(_e, "pts", _S.prop(_S.prop(_S.read(_e, "P"), 0), "pts"))
	_S.define(_e, "side", _S.invoke(_S.read(_e, "R"), "sign", []))
	_S.invoke([0.2, 0.38, 0.55], "forEach", [_S.function_value(_e, "_f17")])
	return _S.read(_e, "P")

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "u"), _S.binary("-", _S.prop(_S.read(_e, "pts"), "length"), 1))]))
	var _v22 = _S.prop(_S.read(_e, "pts"), _S.read(_e, "k"))
	_S.define(_e, "ax", _S.prop(_v22, 0))
	_S.define(_e, "ay", _S.prop(_v22, 1))
	var _v23 = _S.prop(_S.read(_e, "pts"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_e, "pts"), "length"), 1), _S.binary("+", _S.read(_e, "k"), 3)]))
	_S.define(_e, "bx", _S.prop(_v23, 0))
	_S.define(_e, "by", _S.prop(_v23, 1))
	_S.define(_e, "a", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.binary("-", _S.read(_e, "by"), _S.read(_e, "ay")), _S.binary("-", _S.read(_e, "bx"), _S.read(_e, "ax"))]), _S.binary("*", (_S.unary("-", _S.read(_e, "side")) if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.read(_e, "side")), _S.invoke(_S.read(_e, "R"), "range", [0.6, 1]))))
	_S.define(_e, "l", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [36, 56]), _S.binary("-", 1, _S.binary("*", _S.read(_e, "u"), 0.45))))
	_S.invoke(_S.read(_e, "P"), "push", _S.concat([_S.array(_S.call_value(_S.read(_e, "tree"), [_S.read(_e, "R"), _S.read(_e, "ax"), _S.read(_e, "ay"), _S.binary("+", _S.read(_e, "ax"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "l"))), _S.binary("+", _S.read(_e, "ay"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "l"))), 0.3, 0.5, 0.6, 1]))]))
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "V", _S.arg(_args, 3))
	_S.define(_e, "P1", _S.call_value(_S.read(_e, "channel"), [_S.read(_e, "S")]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "T1"))):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "reach", _S.binary("+", _S.read(_v24, "BY0"), _S.binary("*", _S.binary("-", _S.read(_v24, "BY1"), _S.read(_v24, "BY0")), _S.invoke(_S.read(_v24, "Math"), "pow", [_S.binary("/", _S.invoke(_S.read(_v24, "Math"), "floor", [_S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v24, "t"), _S.read(_v24, "T_LEAD")), _S.binary("-", _S.read(_v24, "T1"), _S.read(_v24, "T_LEAD"))), 9)]), 9), 1.25]))))
		for _v25 in _S.array(_S.read(_v24, "P1")):
			var _v26 = _S.scope(_v24)
			_S.define(_v26, "p", _v25)
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v27, "i"), _S.binary("-", _S.prop(_S.prop(_S.read(_v27, "p"), "pts"), "length"), 1))):
				var _v28 = _S.scope(_v27)
				var _v29 = _S.prop(_S.prop(_S.read(_v28, "p"), "pts"), _S.read(_v28, "i"))
				_S.define(_v28, "ax", _S.prop(_v29, 0))
				_S.define(_v28, "ay", _S.prop(_v29, 1))
				var _v30 = _S.prop(_S.prop(_S.read(_v28, "p"), "pts"), _S.binary("+", _S.read(_v28, "i"), 1))
				_S.define(_v28, "bx", _S.prop(_v30, 0))
				_S.define(_v28, "by", _S.prop(_v30, 1))
				if _S.truth(_S.binary(">", _S.read(_v28, "by"), _S.read(_v28, "reach"))):
					break
				_S.invoke(_S.read(_v28, "q"), "line", [_S.read(_v28, "ax"), _S.read(_v28, "ay"), _S.read(_v28, "bx"), _S.read(_v28, "by"), (_S.prop(_S.read(_v28, "V"), 2) if _S.truth(_S.binary(">=", _S.prop(_S.read(_v28, "p"), "w"), 1)) else _S.prop(_S.read(_v28, "V"), 1))])
				if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v28, "i"), 4), 0)):
					_S.invoke(_S.read(_v28, "q"), "glow", [_S.read(_v28, "ax"), _S.read(_v28, "ay"), 6, _S.prop(_S.read(_v28, "V"), 3), _S.binary("*", 0.22, _S.prop(_S.read(_v28, "p"), "w"))])
				_v27 = _S.iteration(_v27)
				_S.write(_v27, "i", 1, "+=", true)
		return null
	_S.define(_e, "P2", _S.concat([[_S.prop(_S.read(_e, "P1"), 0)], _S.array(_S.invoke(_S.invoke(_S.call_value(_S.read(_e, "tree"), [_S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.binary("*", _S.read(_e, "S"), 31), 2)]), _S.read(_e, "BX0"), _S.read(_e, "BY0"), _S.read(_e, "BX1"), _S.read(_e, "BY1"), 0.3, 0.3]), "slice", [1]), "filter", [_S.function_value(_e, "_f19")]))]))
	_S.define(_e, "s", (2 if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T2"))) else 1))
	_S.define(_e, "a", _S.binary("-", _S.read(_e, "t"), (_S.read(_e, "T2") if _S.truth(_S.binary("===", _S.read(_e, "s"), 2)) else _S.read(_e, "T1"))))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "env"), [_S.read(_e, "t"), (_S.read(_e, "T2") if _S.truth(_S.binary("===", _S.read(_e, "s"), 2)) else _S.read(_e, "T1")), (_S.read(_e, "F2") if _S.truth(_S.binary("===", _S.read(_e, "s"), 2)) else _S.read(_e, "F1"))]))
	_S.define(_e, "paths", (_S.read(_e, "P2") if _S.truth(_S.binary("===", _S.read(_e, "s"), 2)) else _S.read(_e, "P1")))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		_S.call_value(_S.read(_e, "stroke"), [_S.read(_e, "q"), _S.read(_e, "paths"), _S.read(_e, "k"), _S.read(_e, "V")])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "a"), 0.5)):
			var _v31 = _S.scope(_e)
			_S.define(_v31, "g", _S.binary("-", 1, _S.binary("/", _S.read(_v31, "a"), 0.5)))
			for _v32 in _S.array(_S.read(_v31, "paths")):
				var _v33 = _S.scope(_v31)
				_S.define(_v33, "p", _v32)
				if _S.truth(_S.binary(">=", _S.prop(_S.read(_v33, "p"), "w"), 1)):
					for _v34 in _S.array(_S.prop(_S.read(_v33, "p"), "pts")):
						var _v35 = _S.scope(_v33)
						var _v36 = _v34
						_S.define(_v35, "x", _S.prop(_v36, 0))
						_S.define(_v35, "y", _S.prop(_v36, 1))
						_S.invoke(_S.read(_v35, "q"), "dot", [_S.read(_v35, "x"), _S.read(_v35, "y"), _S.prop(_S.read(_v35, "V"), 1), _S.binary("*", _S.read(_v35, "g"), 0.9)])
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.binary("<", _S.read(_e, "i"), 2)

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "V", _S.arg(_args, 3))
	_S.define(_e, "a", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "T_SHEET")), 0.22))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "a"), 0), func(): return _S.binary(">", _S.read(_e, "a"), 0.17))):
		return null
	_S.define(_e, "P", _S.call_value(_S.read(_e, "tree"), [_S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.binary("*", _S.read(_e, "S"), 7), 3)]), _S.unary("-", 150), _S.unary("-", 138), _S.unary("-", 26), _S.unary("-", 134), 0.2, 0.7]))
	_S.define(_e, "reach", _S.binary("+", _S.unary("-", 150), _S.binary("*", 130, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "a"), 30)]), 1), 3)]))))
	_S.define(_e, "k", (1 if _S.truth(_S.binary("<", _S.read(_e, "a"), 0.1)) else 0.5))
	for _v37 in _S.array(_S.read(_e, "P")):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "p", _v37)
		var _v39 = _S.scope(_v38)
		_S.define(_v39, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v39, "i"), _S.binary("-", _S.prop(_S.prop(_S.read(_v39, "p"), "pts"), "length"), 1))):
			var _v40 = _S.scope(_v39)
			var _v41 = _S.prop(_S.prop(_S.read(_v40, "p"), "pts"), _S.read(_v40, "i"))
			_S.define(_v40, "ax", _S.prop(_v41, 0))
			_S.define(_v40, "ay", _S.prop(_v41, 1))
			var _v42 = _S.prop(_S.prop(_S.read(_v40, "p"), "pts"), _S.binary("+", _S.read(_v40, "i"), 1))
			_S.define(_v40, "bx", _S.prop(_v42, 0))
			_S.define(_v40, "by", _S.prop(_v42, 1))
			if _S.truth(_S.binary(">", _S.read(_v40, "ax"), _S.read(_v40, "reach"))):
				break
			_S.invoke(_S.read(_v40, "q"), "line", [_S.read(_v40, "ax"), _S.read(_v40, "ay"), _S.read(_v40, "bx"), _S.read(_v40, "by"), (_S.prop(_S.read(_v40, "V"), 4) if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v40, "p"), "w"), 1), func(): return _S.binary(">", _S.read(_v40, "k"), 0.6))) else _S.prop(_S.read(_v40, "V"), 3))])
			if _S.truth(_S.binary(">=", _S.prop(_S.read(_v40, "p"), "w"), 1)):
				_S.invoke(_S.read(_v40, "q"), "dot", [_S.read(_v40, "ax"), _S.binary("+", _S.read(_v40, "ay"), 1), _S.prop(_S.read(_v40, "V"), 2), _S.read(_v40, "k")])
			if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v40, "i"), 3), 0)):
				_S.invoke(_S.read(_v40, "q"), "glow", [_S.read(_v40, "ax"), _S.read(_v40, "ay"), 10, _S.prop(_S.read(_v40, "V"), 3), _S.binary("*", _S.binary("*", 0.35, _S.read(_v40, "k")), _S.prop(_S.read(_v40, "p"), "w"))])
			_v39 = _S.iteration(_v39)
			_S.write(_v39, "i", 1, "+=", true)
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "paths", _S.arg(_args, 1))
	_S.define(_e, "k", _S.arg(_args, 2))
	_S.define(_e, "V", _S.arg(_args, 3))
	for _v43 in _S.array([0, 1, 2]):
		var _v44 = _S.scope(_e)
		_S.define(_v44, "pass", _v43)
		for _v45 in _S.array(_S.read(_v44, "paths")):
			var _v46 = _S.scope(_v44)
			_S.define(_v46, "p", _v45)
			var _v47 = _S.scope(_v46)
			_S.define(_v47, "trunk", _S.binary(">=", _S.prop(_S.read(_v47, "p"), "w"), 1))
			if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v47, "trunk")), func(): return _S.logical("||", _S.binary("<", _S.read(_v47, "k"), 0.4), func(): return _S.logical("&&", _S.binary("===", _S.read(_v47, "pass"), 0), func(): return _S.binary("<", _S.prop(_S.read(_v47, "p"), "w"), 0.5))))):
				continue
			var _v48 = _S.scope(_v47)
			_S.define(_v48, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v48, "i"), _S.binary("-", _S.prop(_S.prop(_S.read(_v48, "p"), "pts"), "length"), 1))):
				var _v49 = _S.scope(_v48)
				var _v50 = _S.prop(_S.prop(_S.read(_v49, "p"), "pts"), _S.read(_v49, "i"))
				_S.define(_v49, "ax", _S.prop(_v50, 0))
				_S.define(_v49, "ay", _S.prop(_v50, 1))
				var _v51 = _S.prop(_S.prop(_S.read(_v49, "p"), "pts"), _S.binary("+", _S.read(_v49, "i"), 1))
				_S.define(_v49, "bx", _S.prop(_v51, 0))
				_S.define(_v49, "by", _S.prop(_v51, 1))
				_S.define(_v49, "l", _S.invoke(_S.read(_v49, "Math"), "max", [1, _S.invoke(_S.read(_v49, "Math"), "hypot", [_S.binary("-", _S.read(_v49, "bx"), _S.read(_v49, "ax")), _S.binary("-", _S.read(_v49, "by"), _S.read(_v49, "ay"))])]))
				var _v52 = _S.scope(_v49)
				_S.define(_v52, "d", 0)
				while _S.truth(_S.binary("<=", _S.read(_v52, "d"), _S.read(_v52, "l"))):
					var _v53 = _S.scope(_v52)
					_S.define(_v53, "x", _S.binary("+", _S.read(_v53, "ax"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v53, "bx"), _S.read(_v53, "ax")), _S.read(_v53, "d")), _S.read(_v53, "l"))))
					_S.define(_v53, "y", _S.binary("+", _S.read(_v53, "ay"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v53, "by"), _S.read(_v53, "ay")), _S.read(_v53, "d")), _S.read(_v53, "l"))))
					if _S.truth(_S.binary("===", _S.read(_v53, "pass"), 0)):
						_S.invoke(_S.read(_v53, "q"), "circle", [_S.read(_v53, "x"), _S.read(_v53, "y"), ((2.3 if _S.truth(_S.binary(">", _S.read(_v53, "k"), 0.6)) else 1.7) if _S.truth(_S.read(_v53, "trunk")) else 1.2), (_S.prop(_S.read(_v53, "V"), 2) if _S.truth(_S.binary(">", _S.read(_v53, "k"), 0.6)) else _S.prop(_S.read(_v53, "V"), 1))])
					else:
						if _S.truth(_S.binary("===", _S.read(_v53, "pass"), 1)):
							_S.invoke(_S.read(_v53, "q"), "circle", [_S.read(_v53, "x"), _S.read(_v53, "y"), ((1.4 if _S.truth(_S.binary(">", _S.read(_v53, "k"), 0.6)) else 0.9) if _S.truth(_S.read(_v53, "trunk")) else 0.6), (_S.prop(_S.read(_v53, "V"), 4) if _S.truth(_S.read(_v53, "trunk")) else _S.prop(_S.read(_v53, "V"), 3))])
						else:
							if _S.truth(_S.read(_v53, "trunk")):
								var _v54 = _S.scope(_v53)
								_S.invoke(_S.read(_v54, "q"), "px", [_S.read(_v54, "x"), _S.read(_v54, "y"), (_S.read(_v54, "WHITE") if _S.truth(_S.binary(">", _S.read(_v54, "k"), 0.3)) else _S.prop(_S.read(_v54, "V"), 4))])
								if _S.truth(_S.binary(">", _S.read(_v54, "k"), 0.85)):
									_S.invoke(_S.read(_v54, "q"), "px", [_S.binary("+", _S.read(_v54, "x"), 1), _S.read(_v54, "y"), _S.read(_v54, "WHITE")])
							else:
								if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v53, "p"), "w"), 0.4), func(): return _S.binary(">", _S.read(_v53, "k"), 0.6))):
									_S.invoke(_S.read(_v53, "q"), "px", [_S.read(_v53, "x"), _S.read(_v53, "y"), _S.prop(_S.read(_v53, "V"), 4)])
					_v52 = _S.iteration(_v52)
					_S.write(_v52, "d", 0.5, "+=", false)
				if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v49, "pass"), 0), func(): return _S.binary("===", _S.binary("%", _S.read(_v49, "i"), 3), 0))):
					_S.invoke(_S.read(_v49, "q"), "glow", [_S.read(_v49, "ax"), _S.read(_v49, "ay"), (18 if _S.truth(_S.read(_v49, "trunk")) else 8), _S.prop(_S.read(_v49, "V"), 3), _S.binary("*", _S.binary("*", (0.5 if _S.truth(_S.read(_v49, "trunk")) else 0.3), _S.read(_v49, "k")), _S.prop(_S.read(_v49, "p"), "w"))])
				_v48 = _S.iteration(_v48)
				_S.write(_v48, "i", 1, "+=", true)
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "S", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "V", _S.arg(_args, 4))
	_S.define(_e, "a", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "T1")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "a"), 0), func(): return _S.binary(">", _S.read(_e, "a"), 1.8))):
		return null
	_S.define(_e, "k", _S.call_value(_S.read(_e, "flashAt"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		var _v55 = _S.scope(_e)
		_S.define(_v55, "fr", _S.invoke(_S.read(_v55, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_v55, "t"), 30), 0.001)]))
		_S.define(_v55, "Rc", _S.construct(_S.read(_v55, "Rng"), [_S.binary("+", _S.binary("*", _S.read(_v55, "S"), 977), _S.read(_v55, "fr"))]))
		var _v56 = _S.scope(_v55)
		_S.define(_v56, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v56, "i"), 4)):
			var _v57 = _S.scope(_v56)
			_S.define(_v57, "side", (1 if _S.truth(_S.binary("%", _S.read(_v57, "i"), 2)) else _S.unary("-", 1)))
			_S.define(_v57, "l", _S.binary("*", _S.invoke(_S.read(_v57, "Rc"), "range", [10, 30]), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_v57, "k")))))
			for _v58 in _S.array(_S.call_value(_S.read(_v57, "tree"), [_S.read(_v57, "Rc"), _S.binary("+", _S.read(_v57, "BX1"), _S.read(_v57, "side")), _S.binary("-", _S.read(_v57, "BY1"), 1), _S.binary("+", _S.read(_v57, "BX1"), _S.binary("*", _S.read(_v57, "side"), _S.read(_v57, "l"))), _S.binary("+", _S.read(_v57, "BY1"), _S.invoke(_S.read(_v57, "Rc"), "range", [_S.unary("-", 2), 3])), 0.35, 0.5, 0.6, 1])):
				var _v59 = _S.scope(_v57)
				_S.define(_v59, "p", _v58)
				var _v60 = _S.scope(_v59)
				_S.invoke(_S.read(_v60, "q"), "polyline", [_S.prop(_S.read(_v60, "p"), "pts"), (_S.prop(_S.read(_v60, "V"), 4) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v60, "k"), 0.6), func(): return _S.binary(">", _S.prop(_S.read(_v60, "p"), "w"), 0.5))) else _S.prop(_S.read(_v60, "V"), 3))])
				_S.invoke(_S.read(_v60, "q"), "glow", [_S.prop(_S.prop(_S.prop(_S.read(_v60, "p"), "pts"), _S.binary(">>", _S.prop(_S.prop(_S.read(_v60, "p"), "pts"), "length"), 1)), 0), _S.prop(_S.prop(_S.prop(_S.read(_v60, "p"), "pts"), _S.binary(">>", _S.prop(_S.prop(_S.read(_v60, "p"), "pts"), "length"), 1)), 1), 8, _S.prop(_S.read(_v60, "V"), 3), _S.binary("*", 0.3, _S.read(_v60, "k"))])
			_v56 = _S.iteration(_v56)
			_S.write(_v56, "i", 1, "+=", true)
		_S.invoke(_S.read(_v55, "q"), "circle", [_S.read(_v55, "BX1"), _S.binary("-", _S.read(_v55, "BY1"), 1), _S.binary("+", 2, _S.binary("*", 3, _S.read(_v55, "k"))), _S.prop(_S.read(_v55, "V"), 4)])
		_S.invoke(_S.read(_v55, "q"), "circle", [_S.read(_v55, "BX1"), _S.binary("-", _S.read(_v55, "BY1"), 1), _S.binary("+", 1, _S.binary("*", 2, _S.read(_v55, "k"))), _S.read(_v55, "WHITE")])
		_S.invoke(_S.read(_v55, "q"), "glow", [_S.read(_v55, "BX1"), _S.binary("-", _S.read(_v55, "BY1"), 12), 95, _S.prop(_S.read(_v55, "V"), 2), _S.binary("*", 0.55, _S.read(_v55, "k"))])
		_S.invoke(_S.read(_v55, "q"), "glow", [_S.read(_v55, "BX1"), _S.binary("-", _S.read(_v55, "BY1"), 4), 40, _S.prop(_S.read(_v55, "V"), 3), _S.binary("*", 0.5, _S.read(_v55, "k"))])
		_S.invoke(_S.read(_v55, "q"), "glow", [_S.read(_v55, "BX1"), _S.binary("-", _S.read(_v55, "BY1"), 2), 14, _S.read(_v55, "WHITE"), _S.binary("*", 0.6, _S.read(_v55, "k"))])
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.binary("*", _S.read(_e, "S"), 13), 5)])}, {"ground": _S.function_value(_e, "_f23")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "V"), 4), _S.prop(_S.read(_e, "V"), 3), _S.prop(_S.read(_e, "V"), 2)]}, {"haze": _S.prop(_S.read(_e, "V"), 2)}])]))
	_S.define(_e, "R", _S.prop(_S.read(_e, "ps"), "R"))
	_S.define(_e, "steam", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "V"), 3), 0.3]))
	_S.define(_e, "burst", _S.function_value(_e, "_f24"))
	_S.call_value(_S.read(_e, "burst"), [48, 1])
	_S.define(_e, "tt", 0)
	_S.define(_e, "second", false)
	var _v65 = _S.scope(_e)
	_S.define(_v65, "dt", _S.binary("/", 1, 120))
	while _S.truth(_S.binary("<=", _S.binary("+", _S.read(_v65, "tt"), _S.read(_v65, "dt")), _S.read(_v65, "a"))):
		var _v66 = _S.scope(_v65)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v66, "second")), func(): return _S.binary(">=", _S.read(_v66, "tt"), _S.binary("-", _S.read(_v66, "T2"), _S.read(_v66, "T1"))))):
			_S.last([_S.write(_v66, "second", true, "=", false), _S.call_value(_S.read(_v66, "burst"), [16, 0.7])])
		_S.invoke(_S.read(_v66, "ps"), "update", [_S.read(_v66, "dt")])
		_v65 = _S.iteration(_v65)
		_S.write(_v65, "tt", _S.read(_v65, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "q")])
	if _S.truth(_S.binary("<", _S.read(_e, "a"), 1.6)):
		_S.invoke(_S.read(_e, "q"), "glow", [_S.read(_e, "BX1"), _S.read(_e, "BY1"), 16, _S.prop(_S.read(_e, "V"), 2), _S.binary("*", 0.4, _S.binary("**", _S.binary("-", 1, _S.binary("/", _S.read(_e, "a"), 1.6)), 2))])
	return null

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 4

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "n", _S.arg(_args, 0))
	_S.define(_e, "pow", _S.arg(_args, 1))
	var _v61 = _S.scope(_e)
	_S.define(_v61, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v61, "i"), _S.read(_v61, "n"))):
		var _v62 = _S.scope(_v61)
		_S.define(_v62, "an", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v62, "Math"), "PI")), 2), _S.invoke(_S.read(_v62, "R"), "range", [_S.unary("-", 1.35), 1.35])))
		_S.define(_v62, "sp", _S.binary("*", _S.invoke(_S.read(_v62, "R"), "range", [110, 420]), _S.read(_v62, "pow")))
		_S.invoke(_S.read(_v62, "ps"), "spawn", [_S.prop(_S.read(_v62, "P"), "SPARK"), _S.read(_v62, "BX1"), _S.binary("-", _S.read(_v62, "BY1"), 1), _S.binary("*", _S.invoke(_S.read(_v62, "Math"), "cos", [_S.read(_v62, "an")]), _S.read(_v62, "sp")), _S.binary("*", _S.invoke(_S.read(_v62, "Math"), "sin", [_S.read(_v62, "an")]), _S.read(_v62, "sp")), _S.invoke(_S.read(_v62, "R"), "range", [0.18, 0.6])])
		_v61 = _S.iteration(_v61)
		_S.write(_v61, "i", 1, "+=", true)
	var _v63 = _S.scope(_e)
	_S.define(_v63, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v63, "i"), _S.binary("*", 6, _S.read(_v63, "pow")))):
		var _v64 = _S.scope(_v63)
		_S.define(_v64, "sd", _S.invoke(_S.read(_v64, "R"), "sign", []))
		_S.invoke(_S.read(_v64, "ps"), "spawn", [_S.prop(_S.read(_v64, "P"), "VAPOUR"), _S.binary("+", _S.read(_v64, "BX1"), _S.binary("*", _S.read(_v64, "sd"), _S.invoke(_S.read(_v64, "R"), "range", [2, 8]))), _S.binary("-", _S.read(_v64, "BY1"), _S.invoke(_S.read(_v64, "R"), "range", [1, 3])), _S.binary("*", _S.read(_v64, "sd"), _S.invoke(_S.read(_v64, "R"), "range", [30, 90])), _S.unary("-", _S.invoke(_S.read(_v64, "R"), "range", [4, 16])), _S.invoke(_S.read(_v64, "R"), "range", [0.6, 1.2]), _S.read(_v64, "steam"), _S.invoke(_S.read(_v64, "R"), "range", [2.5, 4.5]), _S.invoke(_S.read(_v64, "R"), "range", [0, 0.08])])
		_v63 = _S.iteration(_v63)
		_S.write(_v63, "i", 1, "+=", true)
	return null

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "B", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "S", _S.arg(_args, 3))
	_S.define(_e, "C", _S.arg(_args, 4))
	_S.define(_e, "V", _S.arg(_args, 5))
	_S.define(_e, "f", _S.arg(_args, 6))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "field"), [_S.binary("+", _S.read(_e, "S"), 3), 256, 128]))
	_S.define(_e, "M", _S.call_value(_S.read(_e, "field"), [_S.binary("+", _S.read(_e, "S"), 4), 256, 128, [4, 8, 16]]))
	_S.define(_e, "wind", _S.binary("/", _S.binary("*", _S.binary("*", 256, 3), _S.read(_e, "t")), _S.read(_e, "D")))
	_S.call_value(_S.read(_e, "pass"), [_S.read(_e, "q"), _S.read(_e, "meta"), _S.unary("-", 14), _S.unary("-", 0.5), _S.function_value(_e, "_f26")])
	_S.call_value(_S.read(_e, "pass"), [_S.read(_e, "q"), _S.read(_e, "meta"), 0, 9, _S.function_value(_e, "_f27")])
	if _S.truth(_S.binary(">", _S.read(_e, "f"), 0.2)):
		var _v71 = _S.scope(_e)
		_S.define(_v71, "y", 1)
		while _S.truth(_S.binary("<", _S.read(_v71, "y"), 10)):
			if _S.truth(_S.binary("<", _S.call_value(_S.read(_v71, "rand"), [_S.read(_v71, "y"), _S.invoke(_S.read(_v71, "Math"), "floor", [_S.binary("*", _S.read(_v71, "t"), 30)]), 3]), 0.8)):
				_S.invoke(_S.read(_v71, "q"), "dot", [_S.binary("+", _S.read(_v71, "BX1"), _S.binary("*", _S.invoke(_S.read(_v71, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v71, "y"), 1.7), _S.binary("*", _S.read(_v71, "t"), 40))]), 1.2)), _S.read(_v71, "y"), (_S.read(_v71, "WHITE") if _S.truth(_S.binary("<", _S.read(_v71, "y"), 4)) else _S.prop(_S.read(_v71, "V"), 4)), _S.binary("*", _S.read(_v71, "f"), _S.binary("-", 1.1, _S.binary("/", _S.read(_v71, "y"), 12)))])
			_v71 = _S.iteration(_v71)
			_S.write(_v71, "y", 1, "+=", true)
	return null

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "m", _S.binary("-", _S.call_value(_S.read(_e, "sample"), [_S.read(_e, "M"), _S.binary("-", _S.binary("*", _S.read(_e, "x"), 1.1), _S.read(_e, "wind")), _S.binary("+", _S.binary("*", _S.read(_e, "y"), 4), 9)]), 0.4))
	if _S.truth(_S.binary("<=", _S.read(_e, "m"), 0)):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "V"), 3), _S.read(_e, "f")]) if _S.truth(_S.binary(">", _S.read(_e, "f"), 0.1)) else _S.prop(_S.read(_e, "C"), 4)), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [0.3, _S.binary("*", _S.read(_e, "m"), 0.9)]), _S.binary("+", 1, _S.binary("/", _S.read(_e, "y"), 14))), "=", false)
	_S.set_prop(_S.read(_e, "out"), "b", 1, "=", false)
	return null

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "pool", _S.function_value(_e, "_f28"))
	_S.define(_e, "wet", _S.call_value(_S.read(_e, "pool"), [_S.read(_e, "y")]))
	_S.define(_e, "lip", _S.logical("&&", _S.read(_e, "wet"), func(): return _S.unary("!", _S.call_value(_S.read(_e, "pool"), [_S.binary("-", _S.read(_e, "y"), 1)]))))
	_S.set_prop(_S.read(_e, "out"), "b", 1, "=", false)
	_S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "C"), 1), "=", false)
	_S.set_prop(_S.read(_e, "out"), "a", 0.5, "=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "y"), 1)):
		var _v67 = _S.scope(_e)
		_S.set_prop(_S.read(_v67, "out"), "c", (_S.prop(_S.read(_v67, "C"), 4) if _S.truth(_S.binary(">", _S.call_value(_S.read(_v67, "sample"), [_S.read(_v67, "F"), _S.binary("*", _S.read(_v67, "x"), 2), 50]), 0.5)) else _S.prop(_S.read(_v67, "C"), 3)), "=", false)
		_S.set_prop(_S.read(_v67, "out"), "a", 1, "=", false)
		_S.set_prop(_S.read(_v67, "out"), "b", 0, "=", false)
	else:
		if _S.truth(_S.read(_e, "wet")):
			var _v68 = _S.scope(_e)
			_S.define(_v68, "d", _S.binary("/", _S.invoke(_S.read(_v68, "Math"), "abs", [_S.binary("-", _S.read(_v68, "x"), _S.read(_v68, "BX1"))]), 150))
			if _S.truth(_S.binary(">", _S.read(_v68, "f"), 0.06)):
				var _v69 = _S.scope(_v68)
				_S.set_prop(_S.read(_v69, "out"), "c", (_S.prop(_S.read(_v69, "V"), 4) if _S.truth(_S.logical("||", _S.logical("&&", _S.binary("<", _S.read(_v69, "d"), 0.25), func(): return _S.binary(">", _S.read(_v69, "f"), 0.5)), func(): return _S.read(_v69, "lip"))) else _S.prop(_S.read(_v69, "V"), 3)), "=", false)
				_S.set_prop(_S.read(_v69, "out"), "a", _S.call_value(_S.read(_v69, "clamp"), [_S.binary("*", _S.binary("*", _S.read(_v69, "f"), _S.binary("-", 1.35, _S.read(_v69, "d"))), (1.4 if _S.truth(_S.read(_v69, "lip")) else 1))]), "=", false)
				_S.set_prop(_S.read(_v69, "out"), "b", 0, "=", false)
			else:
				var _v70 = _S.scope(_v68)
				_S.set_prop(_S.read(_v70, "out"), "c", (_S.prop(_S.read(_v70, "C"), 5) if _S.truth(_S.read(_v70, "lip")) else _S.prop(_S.read(_v70, "C"), 3)), "=", false)
				_S.set_prop(_S.read(_v70, "out"), "a", (1 if _S.truth(_S.read(_v70, "lip")) else 0.7), "=", false)
			_S.set_prop(_S.read(_v68, "out"), "l", _S.prop(_S.read(_v68, "V"), 3), "=", false)
			_S.set_prop(_S.read(_v68, "out"), "k", _S.binary("*", _S.binary("*", _S.read(_v68, "f"), 0.25), _S.invoke(_S.read(_v68, "Math"), "max", [0, _S.binary("-", 1, _S.read(_v68, "d"))])), "=", false)
	return null

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "yy", _S.arg(_args, 0))
	return _S.binary(">", _S.call_value(_S.read(_e, "sample"), [_S.read(_e, "F"), _S.binary("+", _S.binary("*", _S.read(_e, "x"), 1.3), 31), _S.binary("*", _S.read(_e, "yy"), 9)]), _S.binary("-", 0.6, _S.binary("*", _S.read(_e, "yy"), 0.006)))

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "t0", _S.arg(_args, 1))
	_S.define(_e, "E", _S.arg(_args, 2))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "t0")), 30), 0.001)]))
	return (_S.prop(_S.read(_e, "E"), _S.read(_e, "i")) if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "i"), 0), func(): return _S.binary("<", _S.read(_e, "i"), _S.prop(_S.read(_e, "E"), "length")))) else 0)

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "max", [_S.call_value(_S.read(_e, "env"), [_S.read(_e, "t"), _S.read(_e, "T1"), _S.read(_e, "F1")]), _S.call_value(_S.read(_e, "env"), [_S.read(_e, "t"), _S.read(_e, "T2"), _S.read(_e, "F2")])])

static func _f31(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	return (0 if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "a"), 0), func(): return _S.binary(">", _S.read(_e, "a"), 0.3))) else _S.binary("*", _S.read(_e, "k"), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "a"), 0.06), 0.04), 2))]), _S.binary("*", 0.65, _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "a"), 0.18), 0.05), 2))])))))

static func _f32(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "blink"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "T_FAR")), 0.45])

static func _f33(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "blink"), [_S.binary("-", _S.read(_e, "t"), 0.9), 0.3])

static func _f34(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("/", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "t"), 30000)]), 30000)

static func _f35(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("-", _S.binary("*", 9, _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "x"), 40), 95), 2))])), 3)
