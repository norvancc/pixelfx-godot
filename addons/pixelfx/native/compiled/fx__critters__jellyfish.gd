@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/jellyfish.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "bubble", _S.import_value("fx/critters/_lib.js", "bubble"))
	_S.define(_e, "squeeze", _S.function_value(_e, "_f0"))
	_S.define(_e, "lift", _S.function_value(_e, "_f1"))
	_S.define(_e, "bell", _S.function_value(_e, "_f2"))
	_S.define(_e, "halfW", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBell", _S.function_value(_e, "_f4"))
	_S.define(_e, "strand", _S.function_value(_e, "_f9"))
	_S.define(_e, "drawTentacle", _S.function_value(_e, "_f10"))
	_S.define(_e, "drawArms", _S.function_value(_e, "_f11"))
	_S.define(_e, "draw", _S.function_value(_e, "_f12"))
	_S.define(_e, "meta", _S.merge([{"name": "Jellyfish"}, {"desc": "A see-through jellyfish pulses: its bell squeezes to shove it up and relaxes as it sinks, frilled arms and long tentacles trailing, a glow inside, bubbles drifting by."}, {"tags": ["critter", "jellyfish", "sea", "underwater", "glow", "swim", "loop"]}, {"size": [96, 120]}, {"origin": [48, 38]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#140b2b", "#2a1650", "#4b2386", "#7a3cb8", "#b066e0", "#e09cf5", "#ffd6ff", "#ffffff"]}, {"glow": ["#0b3550", "#1f7fa8", "#4fd2e8", "#b8fbff"]}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "BEAT", _S.binary("/", _S.read(_e, "D"), 2))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 22), _S.unary("-", 28), 44, 36]))
	_S.define(_e, "W0", 32)
	_S.define(_e, "H0", 18)
	_S.define(_e, "scallop", _S.function_value(_e, "_f18"))
	_S.define(_e, "ARMS", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 40), _S.unary("-", 40), 80, 100]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "u", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.16)):
		return _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.binary("/", _S.read(_e, "u"), 0.16)])
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.22)):
		return 1
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.72)):
		return _S.call_value(_S.read(_e, "lerp"), [1, _S.unary("-", 0.14), _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.binary("/", _S.binary("-", _S.read(_e, "u"), 0.22), 0.5)])])
	return _S.call_value(_S.read(_e, "lerp"), [_S.unary("-", 0.14), 0, _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.binary("/", _S.binary("-", _S.read(_e, "u"), 0.72), 0.28)])])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.binary("*", _S.unary("-", 6), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "u"), 0.04, 0.42])])) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.42)) else _S.binary("+", _S.unary("-", 6), _S.binary("*", 6, _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.binary("/", _S.binary("-", _S.read(_e, "u"), 0.42), 0.58)]))))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.write(_e, "t", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "t"), _S.read(_e, "D")]), "=", false)
	_S.define(_e, "u", _S.binary("/", _S.binary("%", _S.read(_e, "t"), _S.read(_e, "BEAT")), _S.read(_e, "BEAT")))
	_S.define(_e, "c", _S.call_value(_S.read(_e, "squeeze"), [_S.read(_e, "u")]))
	return _S.merge([{"x": _S.binary("*", 2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU"))]))}, {"y": _S.call_value(_S.read(_e, "lift"), [_S.read(_e, "u")])}, {"c": _S.read(_e, "c")}, {"W": _S.binary("*", _S.read(_e, "W0"), _S.binary("-", 1, _S.binary("*", 0.3, _S.read(_e, "c"))))}, {"H": _S.binary("*", _S.read(_e, "H0"), _S.binary("+", 1, _S.binary("*", 0.24, _S.read(_e, "c"))))}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "h", _S.arg(_args, 0))
	_S.define(_e, "B", _S.arg(_args, 1))
	if _S.truth(_S.binary(">", _S.read(_e, "h"), _S.prop(_S.read(_e, "B"), "H"))):
		return _S.unary("-", 1)
	_S.define(_e, "hw", _S.binary("*", _S.binary("/", _S.prop(_S.read(_e, "B"), "W"), 2), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("**", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "h")]), _S.prop(_S.read(_e, "B"), "H")), 2))])])))
	if _S.truth(_S.binary("<", _S.read(_e, "h"), _S.binary("*", _S.prop(_S.read(_e, "B"), "H"), 0.3))):
		_S.write(_e, "hw", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "B"), "c"), 2.4), _S.binary("-", 1, _S.binary("/", _S.read(_e, "h"), _S.binary("*", _S.prop(_S.read(_e, "B"), "H"), 0.3)))), "-=", false)
	return _S.read(_e, "hw")

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "G", _S.arg(_args, 2))
	_S.define(_e, "B", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "g", _S.invoke(_S.read(_e, "GRID"), "clear", []))
	_S.define(_e, "bx", _S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "B"), "x")]))
	_S.define(_e, "by", _S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "B"), "y")]))
	_S.define(_e, "inside", _S.function_value(_e, "_f5"))
	_S.invoke(_S.read(_e, "g"), "shade", [_S.unary("-", 20), _S.unary("-", 26), 20, 3, _S.function_value(_e, "_f6")])
	_S.invoke(_S.read(_e, "g"), "depths", [4])
	_S.define(_e, "iw", _S.binary("*", _S.prop(_S.read(_e, "B"), "W"), 0.36))
	_S.define(_e, "ih", _S.binary("*", _S.prop(_S.read(_e, "B"), "H"), 0.66))
	_S.define(_e, "lx", _S.binary("-", _S.prop(_S.read(_e, "B"), "x"), _S.binary("*", _S.prop(_S.read(_e, "B"), "W"), 0.22)))
	_S.define(_e, "ly", _S.binary("-", _S.prop(_S.read(_e, "B"), "y"), _S.binary("*", _S.prop(_S.read(_e, "B"), "H"), 0.78)))
	_S.invoke(_S.read(_e, "g"), "recolor", [_S.function_value(_e, "_f7")])
	for _v0 in _S.array([_S.unary("-", 0.62), 0.62]):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		var _v2 = _S.scope(_v1)
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "h", 2)
		while _S.truth(_S.binary("<", _S.read(_v3, "h"), _S.binary("-", _S.prop(_S.read(_v3, "B"), "H"), 2))):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "hw", _S.call_value(_S.read(_v4, "halfW"), [_S.read(_v4, "h"), _S.read(_v4, "B")]))
			_S.define(_v4, "x", _S.binary("+", _S.prop(_S.read(_v4, "B"), "x"), _S.binary("*", _S.binary("*", _S.read(_v4, "s"), _S.read(_v4, "hw")), 0.9)))
			_S.define(_v4, "y", _S.binary("-", _S.prop(_S.read(_v4, "B"), "y"), _S.read(_v4, "h")))
			if _S.truth(_S.binary(">=", _S.invoke(_S.read(_v4, "g"), "depth", [_S.binary("-", _S.read(_v4, "x"), _S.read(_v4, "bx")), _S.binary("-", _S.read(_v4, "y"), _S.read(_v4, "by"))]), 3)):
				_S.invoke(_S.read(_v4, "g"), "set", [_S.binary("-", _S.read(_v4, "x"), _S.read(_v4, "bx")), _S.binary("-", _S.read(_v4, "y"), _S.read(_v4, "by")), _S.prop(_S.read(_v4, "C"), 4), 0.5])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "h", 1, "+=", true)
	_S.define(_e, "pulse", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.prop(_S.read(_e, "B"), "c"))))
	_S.define(_e, "cy", _S.binary("-", _S.prop(_S.read(_e, "B"), "y"), _S.binary("*", _S.prop(_S.read(_e, "B"), "H"), 0.42)))
	_S.define(_e, "rx", _S.binary("*", _S.prop(_S.read(_e, "B"), "W"), 0.2))
	_S.define(_e, "ry", _S.binary("*", _S.prop(_S.read(_e, "B"), "H"), 0.2))
	var _v5 = _S.scope(_e)
	_S.define(_v5, "y", _S.invoke(_S.read(_v5, "Math"), "floor", [_S.binary("-", _S.read(_v5, "cy"), _S.read(_v5, "ry"))]))
	while _S.truth(_S.binary("<=", _S.read(_v5, "y"), _S.binary("+", _S.read(_v5, "cy"), _S.read(_v5, "ry")))):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "x", _S.invoke(_S.read(_v6, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_v6, "B"), "x"), _S.read(_v6, "rx"))]))
		while _S.truth(_S.binary("<=", _S.read(_v6, "x"), _S.binary("+", _S.prop(_S.read(_v6, "B"), "x"), _S.read(_v6, "rx")))):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "d", _S.binary("+", _S.binary("**", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v7, "x"), 0.5), _S.prop(_S.read(_v7, "B"), "x")), _S.read(_v7, "rx")), 2), _S.binary("**", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v7, "y"), 0.5), _S.read(_v7, "cy")), _S.read(_v7, "ry")), 2)))
			if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v7, "d"), 1), func(): return _S.binary("<", _S.invoke(_S.read(_v7, "g"), "depth", [_S.binary("-", _S.read(_v7, "x"), _S.read(_v7, "bx")), _S.binary("-", _S.read(_v7, "y"), _S.read(_v7, "by"))]), 2))):
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "x", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v7, "g"), "set", [_S.binary("-", _S.read(_v7, "x"), _S.read(_v7, "bx")), _S.binary("-", _S.read(_v7, "y"), _S.read(_v7, "by")), (_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v7, "d"), 0.3)) else (_S.prop(_S.read(_v7, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v7, "d"), 0.65)) else _S.prop(_S.read(_v7, "C"), 4))), (0.9 if _S.truth(_S.binary("<", _S.read(_v7, "d"), 0.3)) else 0.6)])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "x", 1, "+=", true)
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "y", 1, "+=", true)
	_S.invoke(_S.read(_e, "g"), "outline", [_S.function_value(_e, "_f8"), 0.9])
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p"), 1, _S.read(_e, "bx"), _S.read(_e, "by")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "B"), "x"), _S.binary("-", _S.prop(_S.read(_e, "B"), "y"), _S.binary("*", _S.prop(_S.read(_e, "B"), "H"), 0.45)), _S.binary("+", 30, _S.binary("*", 6, _S.prop(_S.read(_e, "B"), "c"))), _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.22, _S.binary("*", 0.12, _S.read(_e, "pulse")))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "B"), "x"), _S.binary("-", _S.prop(_S.read(_e, "B"), "y"), _S.binary("*", _S.prop(_S.read(_e, "B"), "H"), 0.45)), 11, _S.prop(_S.read(_e, "C"), 6), _S.binary("+", 0.14, _S.binary("*", 0.16, _S.read(_e, "pulse")))])
	for _v8 in _S.array([_S.unary("-", 1), 1]):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "s", _v8)
		for _v10 in _S.array([0.14, 0.42, 0.78]):
			var _v11 = _S.scope(_v9)
			_S.define(_v11, "q", _v10)
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "x", _S.binary("+", _S.prop(_S.read(_v12, "B"), "x"), _S.binary("*", _S.binary("*", _S.read(_v12, "s"), _S.call_value(_S.read(_v12, "halfW"), [0.5, _S.read(_v12, "B")])), _S.read(_v12, "q"))))
			_S.define(_v12, "y", _S.binary("+", _S.prop(_S.read(_v12, "B"), "y"), 1))
			_S.define(_v12, "tw", _S.binary("+", 0.6, _S.binary("*", 0.4, _S.invoke(_S.read(_v12, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v12, "t"), _S.read(_v12, "D")), _S.read(_v12, "TAU")), 3), _S.binary("*", _S.read(_v12, "q"), 9)), _S.read(_v12, "s"))]))))
			_S.invoke(_S.read(_v12, "p"), "px", [_S.read(_v12, "x"), _S.read(_v12, "y"), (_S.prop(_S.read(_v12, "G"), 3) if _S.truth(_S.binary(">", _S.read(_v12, "tw"), 0.85)) else _S.prop(_S.read(_v12, "G"), 2))])
			_S.invoke(_S.read(_v12, "p"), "glow", [_S.read(_v12, "x"), _S.read(_v12, "y"), 4, _S.prop(_S.read(_v12, "G"), 2), _S.binary("*", 0.4, _S.read(_v12, "tw"))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "B"), "x")))
	_S.define(_e, "h", _S.binary("-", _S.prop(_S.read(_e, "B"), "y"), _S.read(_e, "y")))
	if _S.truth(_S.binary("<", _S.read(_e, "h"), _S.unary("-", _S.call_value(_S.read(_e, "scallop"), [_S.read(_e, "dx"), _S.read(_e, "B")])))):
		return false
	_S.define(_e, "hw", _S.call_value(_S.read(_e, "halfW"), [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "h")]), _S.read(_e, "B")]))
	return _S.logical("&&", _S.binary(">=", _S.read(_e, "hw"), 0), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "dx")]), _S.read(_e, "hw")))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "X", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "bx")))
	_S.define(_e, "Y", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "by")))
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "inside"), [_S.read(_e, "X"), _S.read(_e, "Y")]))):
		return 0
	_S.set_prop(_S.read(_e, "o"), "t", 1, "=", false)
	return _S.prop(_S.read(_e, "C"), 3)

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "tag", _S.arg(_args, 4))
	if _S.truth(_S.binary("!==", _S.read(_e, "tag"), 1)):
		return _S.read(_e, "c")
	_S.define(_e, "X", _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "bx")), 0.5))
	_S.define(_e, "Y", _S.binary("+", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "by")), 0.5))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "g"), "depth", [_S.read(_e, "x"), _S.read(_e, "y")]))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "X"), _S.prop(_S.read(_e, "B"), "x")))
	_S.define(_e, "h", _S.binary("-", _S.prop(_S.read(_e, "B"), "y"), _S.read(_e, "Y")))
	_S.define(_e, "v", _S.binary("/", _S.read(_e, "h"), _S.prop(_S.read(_e, "B"), "H")))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "g"), "idx", [_S.read(_e, "x"), _S.read(_e, "y")]))
	_S.define(_e, "col", _S.prop(_S.read(_e, "C"), 3))
	_S.define(_e, "al", _S.binary("+", 0.26, _S.binary("*", 0.2, _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "v")]))))
	_S.define(_e, "ie", _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_e, "dx"), _S.read(_e, "iw")), 2), _S.binary("**", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "h")]), _S.read(_e, "ih")), 2)))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "ie"), 0.8), func(): return _S.binary("<", _S.read(_e, "ie"), 1.12)), func(): return _S.binary(">", _S.read(_e, "h"), 0.5))):
		_S.last([_S.write(_e, "col", _S.prop(_S.read(_e, "C"), 4), "=", false), _S.write(_e, "al", 0.55, "=", false)])
	if _S.truth(_S.binary("<", _S.read(_e, "h"), 1)):
		_S.last([_S.write(_e, "col", _S.prop(_S.read(_e, "C"), 5), "=", false), _S.write(_e, "al", 0.85, "=", false)])
	if _S.truth(_S.binary("===", _S.read(_e, "d"), 2)):
		_S.last([_S.write(_e, "col", (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "v"), 0.5), func(): return _S.binary("<", _S.read(_e, "dx"), 0))) else _S.prop(_S.read(_e, "C"), 4)), "=", false), _S.write(_e, "al", 0.75, "=", false)])
	if _S.truth(_S.binary("===", _S.read(_e, "d"), 1)):
		_S.last([_S.write(_e, "col", (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "dx"), 0), func(): return _S.binary(">", _S.read(_e, "v"), 0.25))) else _S.prop(_S.read(_e, "C"), 5)), "=", false), _S.write(_e, "al", 0.92, "=", false)])
	_S.define(_e, "gx", _S.binary("-", _S.read(_e, "X"), _S.read(_e, "lx")))
	_S.define(_e, "gy", _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "ly")))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary("===", _S.read(_e, "d"), 2), func(): return _S.binary("<", _S.read(_e, "dx"), _S.unary("-", 1))), func(): return _S.binary(">", _S.read(_e, "v"), 0.45)), func(): return _S.binary("<", _S.binary("+", _S.binary("*", _S.read(_e, "gx"), _S.read(_e, "gx")), _S.binary("*", _S.read(_e, "gy"), _S.read(_e, "gy"))), 26))):
		_S.last([_S.write(_e, "col", _S.prop(_S.read(_e, "C"), 7), "=", false), _S.write(_e, "al", 1, "=", false)])
	_S.set_prop(_S.prop(_S.read(_e, "g"), "a"), _S.read(_e, "i"), _S.read(_e, "al"), "=", false)
	return _S.read(_e, "col")

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "nx", _S.arg(_args, 2))
	_S.define(_e, "ny", _S.arg(_args, 3))
	return (0 if _S.truth(_S.binary(">", _S.read(_e, "ny"), 0)) else _S.prop(_S.read(_e, "C"), 1))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "off", _S.arg(_args, 1))
	_S.define(_e, "len", _S.arg(_args, 2))
	_S.define(_e, "step", _S.arg(_args, 3))
	_S.define(_e, "lag", _S.arg(_args, 4))
	_S.define(_e, "sway", _S.arg(_args, 5))
	_S.define(_e, "ph", _S.arg(_args, 6))
	_S.define(_e, "pull", _S.arg(_args, 7))
	_S.define(_e, "pts", [])
	_S.define(_e, "B1", _S.call_value(_S.read(_e, "bell"), [_S.read(_e, "t")]))
	_S.define(_e, "o1", _S.call_value(_S.read(_e, "off"), [_S.read(_e, "B1")]))
	var _v13 = _S.scope(_e)
	_S.define(_v13, "s", 0)
	while _S.truth(_S.binary("<=", _S.read(_v13, "s"), _S.read(_v13, "len"))):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "B", _S.call_value(_S.read(_v14, "bell"), [_S.binary("-", _S.read(_v14, "t"), _S.binary("*", _S.read(_v14, "s"), _S.read(_v14, "lag")))]))
		_S.define(_v14, "relax", _S.binary("-", 1, _S.call_value(_S.read(_v14, "clamp"), [_S.prop(_S.read(_v14, "B"), "c")])))
		_S.define(_v14, "ox", _S.call_value(_S.read(_v14, "lerp"), [_S.prop(_S.read(_v14, "o1"), 0), _S.prop(_S.call_value(_S.read(_v14, "off"), [_S.read(_v14, "B")]), 0), 0.4]))
		_S.define(_v14, "w", _S.binary("*", _S.binary("*", _S.binary("+", 0.3, _S.binary("*", _S.read(_v14, "s"), _S.read(_v14, "sway"))), _S.binary("+", 0.55, _S.binary("*", 0.65, _S.read(_v14, "relax")))), _S.invoke(_S.read(_v14, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v14, "t"), _S.read(_v14, "D")), _S.read(_v14, "TAU")), 2), _S.binary("*", _S.read(_v14, "s"), 0.11)), _S.read(_v14, "ph"))])))
		_S.invoke(_S.read(_v14, "pts"), "push", [[_S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v14, "B"), "x"), _S.read(_v14, "ox")), _S.read(_v14, "w")), _S.binary("*", _S.binary("*", _S.read(_v14, "ox"), _S.read(_v14, "s")), _S.binary("-", _S.binary("*", 0.009, _S.read(_v14, "relax")), _S.binary("*", _S.binary("*", 0.005, _S.read(_v14, "pull")), _S.prop(_S.read(_v14, "B"), "c"))))), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v14, "B"), "y"), _S.prop(_S.read(_v14, "o1"), 1)), _S.binary("*", _S.read(_v14, "s"), _S.binary("+", 0.88, _S.binary("*", 0.05, _S.prop(_S.read(_v14, "B"), "c")))))]])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "s", _S.read(_v13, "step"), "+=", false)
	return _S.read(_e, "pts")

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "G", _S.arg(_args, 2))
	_S.define(_e, "pts", _S.arg(_args, 3))
	_S.define(_e, "back", _S.arg(_args, 4))
	_S.define(_e, "t", _S.arg(_args, 5))
	_S.define(_e, "i", _S.arg(_args, 6))
	_S.define(_e, "n", _S.prop(_S.read(_e, "pts"), "length"))
	var _v15 = _S.scope(_e)
	_S.define(_v15, "k", 1)
	while _S.truth(_S.binary("<", _S.read(_v15, "k"), _S.read(_v15, "n"))):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "u", _S.binary("/", _S.read(_v16, "k"), _S.binary("-", _S.read(_v16, "n"), 1)))
		var _v17 = _S.prop(_S.read(_v16, "pts"), _S.binary("-", _S.read(_v16, "k"), 1))
		_S.define(_v16, "x0", _S.prop(_v17, 0))
		_S.define(_v16, "y0", _S.prop(_v17, 1))
		var _v18 = _S.prop(_S.read(_v16, "pts"), _S.read(_v16, "k"))
		_S.define(_v16, "x1", _S.prop(_v18, 0))
		_S.define(_v16, "y1", _S.prop(_v18, 1))
		_S.define(_v16, "c", ((_S.prop(_S.read(_v16, "C"), 3) if _S.truth(_S.binary("<", _S.read(_v16, "u"), 0.3)) else (_S.prop(_S.read(_v16, "C"), 2) if _S.truth(_S.binary("<", _S.read(_v16, "u"), 0.7)) else _S.prop(_S.read(_v16, "C"), 1))) if _S.truth(_S.read(_v16, "back")) else (_S.prop(_S.read(_v16, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v16, "u"), 0.2)) else (_S.prop(_S.read(_v16, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v16, "u"), 0.45)) else (_S.prop(_S.read(_v16, "C"), 3) if _S.truth(_S.binary("<", _S.read(_v16, "u"), 0.78)) else _S.prop(_S.read(_v16, "C"), 2))))))
		_S.invoke(_S.read(_v16, "p"), "line", [_S.read(_v16, "x0"), _S.read(_v16, "y0"), _S.read(_v16, "x1"), _S.read(_v16, "y1"), _S.read(_v16, "c")])
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "k", 1, "+=", true)
	if _S.truth(_S.read(_e, "back")):
		return null
	var _v19 = _S.scope(_e)
	_S.define(_v19, "k", 3)
	while _S.truth(_S.binary("<", _S.read(_v19, "k"), _S.read(_v19, "n"))):
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "tw", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v20, "t"), _S.read(_v20, "D")), _S.read(_v20, "TAU")), 2), _S.binary("*", _S.read(_v20, "k"), 0.5)), _S.binary("*", _S.read(_v20, "i"), 1.7))]))
		if _S.truth(_S.binary("<", _S.read(_v20, "tw"), 0.3)):
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "k", 4, "+=", false)
			continue
		var _v21 = _S.prop(_S.read(_v20, "pts"), _S.read(_v20, "k"))
		_S.define(_v20, "x", _S.prop(_v21, 0))
		_S.define(_v20, "y", _S.prop(_v21, 1))
		_S.invoke(_S.read(_v20, "p"), "px", [_S.read(_v20, "x"), _S.read(_v20, "y"), (_S.prop(_S.read(_v20, "G"), 3) if _S.truth(_S.binary(">", _S.read(_v20, "tw"), 0.8)) else _S.prop(_S.read(_v20, "G"), 2))])
		_S.invoke(_S.read(_v20, "p"), "glow", [_S.read(_v20, "x"), _S.read(_v20, "y"), 3.5, _S.prop(_S.read(_v20, "G"), 2), _S.binary("*", 0.35, _S.read(_v20, "tw"))])
		_v19 = _S.iteration(_v19)
		_S.write(_v19, "k", 4, "+=", false)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "list", _S.arg(_args, 2))
	_S.define(_e, "back", _S.arg(_args, 3))
	_S.define(_e, "g", _S.invoke(_S.read(_e, "ARMS"), "clear", []))
	_S.define(_e, "a", (0.6 if _S.truth(_S.read(_e, "back")) else 0.88))
	for _v22 in _S.array(_S.read(_e, "list")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "arm", _v22)
		var _v24 = _S.scope(_v23)
		if _S.truth(_S.binary("!==", _S.prop(_S.read(_v24, "arm"), "back"), _S.read(_v24, "back"))):
			continue
		_S.define(_v24, "pts", _S.prop(_S.read(_v24, "arm"), "pts"))
		_S.define(_v24, "n", _S.prop(_S.read(_v24, "pts"), "length"))
		_S.define(_v24, "lastRow", _S.unary("-", 1000000000))
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "k", 1)
		while _S.truth(_S.binary("<", _S.read(_v25, "k"), _S.read(_v25, "n"))):
			var _v26 = _S.scope(_v25)
			var _v27 = _S.prop(_S.read(_v26, "pts"), _S.binary("-", _S.read(_v26, "k"), 1))
			_S.define(_v26, "x0", _S.prop(_v27, 0))
			_S.define(_v26, "y0", _S.prop(_v27, 1))
			var _v28 = _S.prop(_S.read(_v26, "pts"), _S.read(_v26, "k"))
			_S.define(_v26, "x1", _S.prop(_v28, 0))
			_S.define(_v26, "y1", _S.prop(_v28, 1))
			_S.define(_v26, "m", _S.invoke(_S.read(_v26, "Math"), "max", [1, _S.invoke(_S.read(_v26, "Math"), "ceil", [_S.binary("*", _S.invoke(_S.read(_v26, "Math"), "abs", [_S.binary("-", _S.read(_v26, "y1"), _S.read(_v26, "y0"))]), 2)])]))
			var _v29 = _S.scope(_v26)
			_S.define(_v29, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v29, "j"), _S.read(_v29, "m"))):
				var _v30 = _S.scope(_v29)
				_S.define(_v30, "q", _S.binary("/", _S.read(_v30, "j"), _S.read(_v30, "m")))
				_S.define(_v30, "x", _S.call_value(_S.read(_v30, "lerp"), [_S.read(_v30, "x0"), _S.read(_v30, "x1"), _S.read(_v30, "q")]))
				_S.define(_v30, "y", _S.call_value(_S.read(_v30, "lerp"), [_S.read(_v30, "y0"), _S.read(_v30, "y1"), _S.read(_v30, "q")]))
				_S.define(_v30, "u", _S.binary("/", _S.binary("+", _S.binary("-", _S.read(_v30, "k"), 1), _S.read(_v30, "q")), _S.binary("-", _S.read(_v30, "n"), 1)))
				_S.define(_v30, "wd", _S.call_value(_S.read(_v30, "lerp"), [2.2, 0.6, _S.read(_v30, "u")]))
				var _v31 = _S.scope(_v30)
				_S.define(_v31, "i", _S.unary("-", _S.invoke(_S.read(_v31, "Math"), "ceil", [_S.read(_v31, "wd")])))
				while _S.truth(_S.binary("<=", _S.read(_v31, "i"), _S.invoke(_S.read(_v31, "Math"), "ceil", [_S.read(_v31, "wd")]))):
					var _v32 = _S.scope(_v31)
					if _S.truth(_S.binary(">", _S.invoke(_S.read(_v32, "Math"), "abs", [_S.read(_v32, "i")]), _S.binary("+", _S.read(_v32, "wd"), 0.2))):
						_v31 = _S.iteration(_v31)
						_S.write(_v31, "i", 1, "+=", true)
						continue
					_S.invoke(_S.read(_v32, "g"), "set", [_S.binary("+", _S.read(_v32, "x"), _S.read(_v32, "i")), _S.read(_v32, "y"), (_S.prop(_S.read(_v32, "C"), (4 if _S.truth(_S.read(_v32, "back")) else 6)) if _S.truth(_S.binary("<", _S.read(_v32, "i"), 0)) else (_S.prop(_S.read(_v32, "C"), (2 if _S.truth(_S.read(_v32, "back")) else 4)) if _S.truth(_S.binary(">", _S.read(_v32, "i"), 0)) else _S.prop(_S.read(_v32, "C"), (3 if _S.truth(_S.read(_v32, "back")) else 5)))), _S.read(_v32, "a")])
					_v31 = _S.iteration(_v31)
					_S.write(_v31, "i", 1, "+=", true)
				_S.define(_v30, "row", _S.invoke(_S.read(_v30, "Math"), "floor", [_S.read(_v30, "y")]))
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("!==", _S.read(_v30, "row"), _S.read(_v30, "lastRow")), func(): return _S.binary("===", _S.binary("%", _S.read(_v30, "row"), 3), 0)), func(): return _S.binary("<", _S.read(_v30, "u"), 0.85))):
					_S.invoke(_S.read(_v30, "g"), "set", [_S.binary("+", _S.read(_v30, "x"), (_S.binary("-", _S.unary("-", _S.read(_v30, "wd")), 1.2) if _S.truth(_S.binary("%", _S.binary("/", _S.read(_v30, "row"), 3), 2)) else _S.binary("+", _S.read(_v30, "wd"), 1.2))), _S.read(_v30, "y"), _S.prop(_S.read(_v30, "C"), (4 if _S.truth(_S.read(_v30, "back")) else 6)), _S.read(_v30, "a")])
				_S.write(_v30, "lastRow", _S.read(_v30, "row"), "=", false)
				_v29 = _S.iteration(_v29)
				_S.write(_v29, "j", 1, "+=", true)
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "k", 1, "+=", true)
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "glow"), 4]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "bell"), [_S.read(_e, "t")]))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 16, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 5), 1), _S.read(_e, "D"), _S.function_value(_e, "_f13")])
	_S.define(_e, "tents", [])
	_S.define(_e, "arms", [])
	var _v33 = _S.scope(_e)
	_S.define(_v33, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v33, "i"), 9)):
		var _v34 = _S.scope(_v33)
		_S.define(_v34, "r", _S.call_value(_S.read(_v34, "rng"), [_S.prop(_S.read(_v34, "o"), "seed"), _S.read(_v34, "i"), 4]))
		_S.define(_v34, "q", _S.binary("+", _S.binary("+", _S.unary("-", 0.88), _S.binary("/", _S.binary("*", 1.76, _S.read(_v34, "i")), 8)), _S.invoke(_S.read(_v34, "r"), "range", [_S.unary("-", 0.05), 0.05])))
		_S.define(_v34, "back", _S.binary("===", _S.binary("%", _S.read(_v34, "i"), 2), 1))
		_S.invoke(_S.read(_v34, "tents"), "push", [_S.merge([{"back": _S.read(_v34, "back")}, {"i": _S.read(_v34, "i")}, {"pts": _S.call_value(_S.read(_v34, "strand"), [_S.read(_v34, "t"), _S.function_value(_v34, "_f14"), _S.invoke(_S.read(_v34, "r"), "range", [36, 50]), 1.5, 0.022, 0.065, _S.invoke(_S.read(_v34, "r"), "range", [0, _S.read(_v34, "TAU")]), 1])}])])
		_v33 = _S.iteration(_v33)
		_S.write(_v33, "i", 1, "+=", true)
	var _v35 = _S.scope(_e)
	_S.define(_v35, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v35, "i"), 4)):
		var _v36 = _S.scope(_v35)
		_S.define(_v36, "r", _S.call_value(_S.read(_v36, "rng"), [_S.prop(_S.read(_v36, "o"), "seed"), _S.read(_v36, "i"), 9]))
		_S.define(_v36, "q", _S.prop([_S.unary("-", 0.32), _S.unary("-", 0.1), 0.12, 0.3], _S.read(_v36, "i")))
		_S.define(_v36, "back", _S.logical("||", _S.binary("===", _S.read(_v36, "i"), 1), func(): return _S.binary("===", _S.read(_v36, "i"), 2)))
		_S.invoke(_S.read(_v36, "arms"), "push", [_S.merge([{"back": _S.read(_v36, "back")}, {"pts": _S.call_value(_S.read(_v36, "strand"), [_S.read(_v36, "t"), _S.function_value(_v36, "_f15"), _S.invoke(_S.read(_v36, "r"), "range", [20, 27]), 1, 0.03, 0.06, _S.binary("+", _S.invoke(_S.read(_v36, "r"), "range", [0, _S.read(_v36, "TAU")]), _S.read(_v36, "i")), 0.4])}])])
		_v35 = _S.iteration(_v35)
		_S.write(_v35, "i", 1, "+=", true)
	var _v37 = _S.scope(_e)
	_S.define(_v37, "b", 0)
	while _S.truth(_S.binary("<", _S.read(_v37, "b"), 2)):
		var _v38 = _S.scope(_v37)
		_S.define(_v38, "age", _S.call_value(_S.read(_v38, "wrap"), [_S.binary("-", _S.binary("-", _S.read(_v38, "t"), _S.binary("*", _S.read(_v38, "b"), _S.read(_v38, "BEAT"))), 0.05), _S.read(_v38, "D")]))
		if _S.truth(_S.binary(">", _S.read(_v38, "age"), 0.9)):
			_v37 = _S.iteration(_v37)
			_S.write(_v37, "b", 1, "+=", true)
			continue
		_S.define(_v38, "B0", _S.call_value(_S.read(_v38, "bell"), [_S.binary("+", _S.binary("*", _S.read(_v38, "b"), _S.read(_v38, "BEAT")), 0.05)]))
		_S.define(_v38, "e", _S.invoke(_S.read(_v38, "ease"), "outCubic", [_S.binary("/", _S.read(_v38, "age"), 0.9)]))
		_S.define(_v38, "k", _S.binary("-", 1, _S.binary("/", _S.read(_v38, "age"), 0.9)))
		_S.define(_v38, "cx", _S.prop(_S.read(_v38, "B0"), "x"))
		_S.define(_v38, "cy", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v38, "B0"), "y"), 3), _S.binary("*", 14, _S.read(_v38, "e"))))
		_S.define(_v38, "rx", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v38, "B0"), "W"), 0.32), _S.binary("*", 9, _S.read(_v38, "e"))))
		_S.define(_v38, "ry", _S.binary("+", 1.5, _S.binary("*", 2.5, _S.read(_v38, "e"))))
		var _v39 = _S.scope(_v38)
		_S.define(_v39, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v39, "j"), 8)):
			var _v40 = _S.scope(_v39)
			_S.define(_v40, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v40, "j"), 8), _S.read(_v40, "TAU")), _S.binary("*", _S.read(_v40, "e"), 0.8)))
			_S.invoke(_S.read(_v40, "p"), "glow", [_S.binary("+", _S.read(_v40, "cx"), _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "cos", [_S.read(_v40, "a")]), _S.read(_v40, "rx"))), _S.binary("+", _S.read(_v40, "cy"), _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "sin", [_S.read(_v40, "a")]), _S.read(_v40, "ry"))), _S.binary("+", 5, _S.binary("*", 3, _S.read(_v40, "e"))), _S.prop(_S.read(_v40, "C"), 5), _S.binary("*", 0.14, _S.read(_v40, "k"))])
			_v39 = _S.iteration(_v39)
			_S.write(_v39, "j", 1, "+=", true)
		var _v41 = _S.scope(_v38)
		_S.define(_v41, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v41, "j"), 7)):
			var _v42 = _S.scope(_v41)
			_S.define(_v42, "a", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v42, "j"), 7), _S.read(_v42, "TAU")), _S.binary("*", _S.read(_v42, "e"), 2.4)), _S.read(_v42, "b")))
			_S.define(_v42, "x", _S.binary("+", _S.read(_v42, "cx"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v42, "Math"), "cos", [_S.read(_v42, "a")]), _S.read(_v42, "rx")), 1.05)))
			_S.define(_v42, "y", _S.binary("-", _S.binary("+", _S.read(_v42, "cy"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v42, "Math"), "sin", [_S.read(_v42, "a")]), _S.read(_v42, "ry")), 1.4)), _S.binary("*", _S.invoke(_S.read(_v42, "Math"), "cos", [_S.binary("*", _S.read(_v42, "a"), 2)]), 0.6)))
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v42, "k"), 0.15), func(): return _S.binary("%", _S.read(_v42, "j"), 2))):
				_v41 = _S.iteration(_v41)
				_S.write(_v41, "j", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v42, "p"), "dot", [_S.read(_v42, "x"), _S.read(_v42, "y"), (_S.prop(_S.read(_v42, "G"), 3) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v42, "Math"), "sin", [_S.read(_v42, "a")]), 0)) else _S.prop(_S.read(_v42, "G"), 2)), _S.invoke(_S.read(_v42, "Math"), "min", [1, _S.binary("*", _S.read(_v42, "k"), 2.5)])])
			_S.invoke(_S.read(_v42, "p"), "glow", [_S.read(_v42, "x"), _S.read(_v42, "y"), 3, _S.prop(_S.read(_v42, "G"), 2), _S.binary("*", 0.3, _S.read(_v42, "k"))])
			_v41 = _S.iteration(_v41)
			_S.write(_v41, "j", 1, "+=", true)
		var _v43 = _S.scope(_v38)
		_S.define(_v43, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v43, "i"), 4)):
			var _v44 = _S.scope(_v43)
			_S.define(_v44, "r", _S.call_value(_S.read(_v44, "rng"), [_S.prop(_S.read(_v44, "o"), "seed"), _S.read(_v44, "b"), _S.read(_v44, "i"), 13]))
			_S.define(_v44, "L", _S.invoke(_S.read(_v44, "r"), "range", [1.4, 2.2]))
			_S.define(_v44, "ag", _S.call_value(_S.read(_v44, "wrap"), [_S.binary("-", _S.binary("-", _S.binary("-", _S.read(_v44, "t"), _S.binary("*", _S.read(_v44, "b"), _S.read(_v44, "BEAT"))), 0.08), _S.binary("*", _S.read(_v44, "i"), 0.04)), _S.read(_v44, "D")]))
			if _S.truth(_S.binary(">", _S.read(_v44, "ag"), _S.read(_v44, "L"))):
				_v43 = _S.iteration(_v43)
				_S.write(_v43, "i", 1, "+=", true)
				continue
			_S.define(_v44, "rad", _S.invoke(_S.read(_v44, "r"), "range", [0.6, 1.5]))
			_S.define(_v44, "sx", _S.invoke(_S.read(_v44, "r"), "sign", []))
			_S.define(_v44, "x", _S.binary("+", _S.prop(_S.read(_v44, "B0"), "x"), _S.binary("*", _S.read(_v44, "sx"), _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v44, "B0"), "W"), 0.4), _S.invoke(_S.read(_v44, "r"), "range", [0, 4])), _S.binary("*", _S.read(_v44, "ag"), _S.invoke(_S.read(_v44, "r"), "range", [4, 10]))))))
			_S.define(_v44, "y", _S.binary("+", _S.binary("-", _S.binary("+", _S.prop(_S.read(_v44, "B0"), "y"), 2), _S.binary("*", _S.binary("+", 14, _S.binary("*", 10, _S.read(_v44, "rad"))), _S.read(_v44, "ag"))), _S.binary("*", 6, _S.invoke(_S.read(_v44, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_v44, "ag")), 4)]))))
			if _S.truth(_S.binary("<", _S.read(_v44, "y"), _S.unary("-", 33))):
				_v43 = _S.iteration(_v43)
				_S.write(_v43, "i", 1, "+=", true)
				continue
			_S.call_value(_S.read(_v44, "bubble"), [_S.read(_v44, "p"), _S.binary("+", _S.read(_v44, "x"), _S.binary("*", _S.invoke(_S.read(_v44, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v44, "ag"), 5), _S.read(_v44, "i"))]), 0.8)), _S.read(_v44, "y"), _S.read(_v44, "rad"), [_S.prop(_S.read(_v44, "G"), 3), _S.prop(_S.read(_v44, "G"), 3), _S.prop(_S.read(_v44, "G"), 2), _S.prop(_S.read(_v44, "G"), 1)], _S.invoke(_S.read(_v44, "Math"), "min", [1, _S.binary("*", _S.read(_v44, "ag"), 6), _S.binary("*", _S.binary("-", _S.read(_v44, "L"), _S.read(_v44, "ag")), 3), _S.binary("/", _S.binary("+", _S.read(_v44, "y"), 33), 6)])])
			_v43 = _S.iteration(_v43)
			_S.write(_v43, "i", 1, "+=", true)
		_v37 = _S.iteration(_v37)
		_S.write(_v37, "b", 1, "+=", true)
	for _v45 in _S.array(_S.read(_e, "tents")):
		var _v46 = _S.scope(_e)
		_S.define(_v46, "a", _v45)
		if _S.truth(_S.prop(_S.read(_v46, "a"), "back")):
			_S.call_value(_S.read(_v46, "drawTentacle"), [_S.read(_v46, "p"), _S.read(_v46, "C"), _S.read(_v46, "G"), _S.prop(_S.read(_v46, "a"), "pts"), true, _S.read(_v46, "t"), _S.prop(_S.read(_v46, "a"), "i")])
	_S.call_value(_S.read(_e, "drawArms"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "arms"), true])
	_S.call_value(_S.read(_e, "drawBell"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "G"), _S.read(_e, "B"), _S.read(_e, "t")])
	_S.call_value(_S.read(_e, "drawArms"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "arms"), false])
	for _v47 in _S.array(_S.read(_e, "tents")):
		var _v48 = _S.scope(_e)
		_S.define(_v48, "a", _v47)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v48, "a"), "back"))):
			_S.call_value(_S.read(_v48, "drawTentacle"), [_S.read(_v48, "p"), _S.read(_v48, "C"), _S.read(_v48, "G"), _S.prop(_S.read(_v48, "a"), "pts"), false, _S.read(_v48, "t"), _S.prop(_S.read(_v48, "a"), "i")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 7, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 5), 2), _S.function_value(_e, "_f16"), _S.function_value(_e, "_f17")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "B"), "x"), _S.binary("+", _S.prop(_S.read(_e, "B"), "y"), 6), 58, _S.prop(_S.read(_e, "C"), 3), 0.14])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "x", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 42), 42]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 0.8), _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), 6))]), 3)))
	_S.define(_e, "y", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 34), 66]), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [1, 4]))))
	_S.define(_e, "tw", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2.2), _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), 6))]))
	_S.define(_e, "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 2), _S.binary("*", _S.binary("-", _S.read(_e, "L"), _S.read(_e, "age")), 2)]), _S.binary("+", 0.35, _S.binary("*", 0.35, _S.read(_e, "tw")))))
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "G"), 2) if _S.truth(_S.binary(">", _S.read(_e, "tw"), 0.8)) else _S.prop(_S.read(_e, "C"), 3)), _S.read(_e, "a")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return [_S.binary("*", _S.read(_e, "q"), _S.call_value(_S.read(_e, "halfW"), [0.5, _S.read(_e, "b")])), 0.5]

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return [_S.binary("*", _S.binary("*", _S.read(_e, "q"), _S.prop(_S.read(_e, "b"), "W")), 0.5), _S.unary("-", 1)]

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.8, 3])

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "rad", (_S.invoke(_S.read(_e, "r"), "range", [0.6, 1.4]) if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.6])) else _S.invoke(_S.read(_e, "r"), "range", [1.6, 2.6])))
	_S.define(_e, "x0", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 30), 30]))
	_S.define(_e, "y0", _S.invoke(_S.read(_e, "r"), "range", [10, 70]))
	_S.define(_e, "v", _S.binary("+", 20, _S.binary("*", 13, _S.read(_e, "rad"))))
	_S.define(_e, "end", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "L"), _S.binary("/", _S.binary("+", _S.read(_e, "y0"), 30), _S.read(_e, "v"))]))
	if _S.truth(_S.binary(">", _S.read(_e, "age"), _S.read(_e, "end"))):
		return null
	_S.define(_e, "ph", _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), _S.read(_e, "TAU")))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), _S.binary("+", 4, _S.binary("/", 2, _S.read(_e, "rad")))), _S.read(_e, "ph"))]), _S.binary("+", 0.6, _S.binary("*", _S.read(_e, "rad"), 0.8)))))
	_S.define(_e, "y", _S.binary("-", _S.read(_e, "y0"), _S.binary("*", _S.read(_e, "v"), _S.read(_e, "age"))))
	_S.call_value(_S.read(_e, "bubble"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "rad"), [_S.prop(_S.read(_e, "G"), 3), _S.prop(_S.read(_e, "G"), 3), _S.prop(_S.read(_e, "G"), 2), _S.prop(_S.read(_e, "G"), 1)], _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 3), _S.binary("*", _S.binary("-", _S.read(_e, "end"), _S.read(_e, "age")), 3)]), _S.binary("*", 0.1, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 9), _S.read(_e, "ph"))]))])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "dx", _S.arg(_args, 0))
	_S.define(_e, "B", _S.arg(_args, 1))
	return _S.binary("*", 1.1, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "dx"), _S.binary("/", _S.prop(_S.read(_e, "B"), "W"), 2)), _S.prop(_S.read(_e, "Math"), "PI")), 4), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2))])]))
