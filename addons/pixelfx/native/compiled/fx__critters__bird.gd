@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/bird.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "wing", _S.function_value(_e, "_f0"))
	_S.define(_e, "lift", _S.function_value(_e, "_f1"))
	_S.define(_e, "bird", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Bird"}, {"desc": "A songbird flies in place: bursts of wingbeats that lift its body on each downstroke, a glide on spread wings, its tail fanning, a loose feather drifting away."}, {"tags": ["critter", "bird", "flying", "animal", "loop"]}, {"size": [112, 80]}, {"origin": [56, 40]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0a0e1e", "#18244a", "#24407a", "#3466aa", "#5a94d4", "#9cc8f0", "#eaf6ff"]}, {"breast": ["#4a1a0e", "#a8441c", "#e8783a", "#ffb070"]}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 26), _S.unary("-", 26), 52, 46]))
	_S.define(_e, "BEAK", _S.call_value(_S.read(_e, "hex"), ["#f0b030"]))
	_S.define(_e, "BEAKD", _S.call_value(_S.read(_e, "hex"), ["#a86a18"]))
	_S.define(_e, "POSE", _S.merge([{"up": [[0, 0], [_S.unary("-", 1), _S.unary("-", 8)], [_S.unary("-", 5), _S.unary("-", 15)], [_S.unary("-", 8), _S.unary("-", 13.5)], [_S.unary("-", 10.5), _S.unary("-", 10.5)], [_S.unary("-", 11), _S.unary("-", 7)], [_S.unary("-", 9), _S.unary("-", 3)], [_S.unary("-", 6), 1]]}, {"mid": [[0, 0], [_S.unary("-", 3), _S.unary("-", 2.5)], [_S.unary("-", 9), _S.unary("-", 2.5)], [_S.unary("-", 10.5), _S.unary("-", 0.5)], [_S.unary("-", 10), 1.2], [_S.unary("-", 8.5), 2], [_S.unary("-", 7), 2.2], [_S.unary("-", 5), 2]]}, {"down": [[0, 0], [_S.unary("-", 1), 6], [_S.unary("-", 3.5), 12], [_S.unary("-", 6), 11], [_S.unary("-", 7.5), 8.5], [_S.unary("-", 8), 6], [_S.unary("-", 7), 3], [_S.unary("-", 5), 2]]}, {"fold": [[0, 0], [_S.unary("-", 3), _S.unary("-", 4)], [_S.unary("-", 10), _S.unary("-", 5.5)], [_S.unary("-", 11), _S.unary("-", 4)], [_S.unary("-", 10), _S.unary("-", 2.5)], [_S.unary("-", 8.5), _S.unary("-", 1)], [_S.unary("-", 7), 0.5], [_S.unary("-", 5), 1.5]]}, {"glide": [[0, 0], [_S.unary("-", 2), _S.unary("-", 5)], [_S.unary("-", 7), _S.unary("-", 10)], [_S.unary("-", 10), _S.unary("-", 9)], [_S.unary("-", 12), _S.unary("-", 6.5)], [_S.unary("-", 11.5), _S.unary("-", 3.5)], [_S.unary("-", 9), _S.unary("-", 1)], [_S.unary("-", 6), 1]]}]))
	_S.define(_e, "mixPose", _S.function_value(_e, "_f9"))
	_S.define(_e, "FLAPS", 4)
	_S.define(_e, "GLIDE", 1.5)
	_S.define(_e, "SH", [1, _S.unary("-", 2)])
	_S.define(_e, "wingPts", _S.function_value(_e, "_f11"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.write(_e, "t", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "t"), _S.read(_e, "D")]), "=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "GLIDE"))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "u", _S.binary("%", _S.binary("*", _S.binary("/", _S.read(_v0, "t"), _S.read(_v0, "GLIDE")), _S.read(_v0, "FLAPS")), 1))
		if _S.truth(_S.binary("<", _S.read(_v0, "u"), 0.4)):
			var _v1 = _S.scope(_v0)
			_S.define(_v1, "k", _S.invoke(_S.read(_v1, "ease"), "inOutSine", [_S.binary("/", _S.read(_v1, "u"), 0.4)]))
			return _S.merge([{"pts": (_S.call_value(_S.read(_v1, "mixPose"), [_S.prop(_S.read(_v1, "POSE"), "up"), _S.prop(_S.read(_v1, "POSE"), "mid"), _S.binary("*", _S.read(_v1, "k"), 2)]) if _S.truth(_S.binary("<", _S.read(_v1, "k"), 0.5)) else _S.call_value(_S.read(_v1, "mixPose"), [_S.prop(_S.read(_v1, "POSE"), "mid"), _S.prop(_S.read(_v1, "POSE"), "down"), _S.binary("-", _S.binary("*", _S.read(_v1, "k"), 2), 1)]))}, {"down": true}, {"u": _S.read(_v1, "u")}])
		_S.define(_v0, "k", _S.invoke(_S.read(_v0, "ease"), "inOutSine", [_S.binary("/", _S.binary("-", _S.read(_v0, "u"), 0.4), 0.6)]))
		return _S.merge([{"pts": (_S.call_value(_S.read(_v0, "mixPose"), [_S.prop(_S.read(_v0, "POSE"), "down"), _S.prop(_S.read(_v0, "POSE"), "fold"), _S.binary("*", _S.read(_v0, "k"), 2)]) if _S.truth(_S.binary("<", _S.read(_v0, "k"), 0.5)) else _S.call_value(_S.read(_v0, "mixPose"), [_S.prop(_S.read(_v0, "POSE"), "fold"), _S.prop(_S.read(_v0, "POSE"), "up"), _S.binary("-", _S.binary("*", _S.read(_v0, "k"), 2), 1)]))}, {"down": false}, {"u": _S.read(_v0, "u")}])
	_S.define(_e, "g", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "GLIDE")), _S.binary("-", _S.read(_e, "D"), _S.read(_e, "GLIDE"))))
	_S.define(_e, "into", _S.call_value(_S.read(_e, "smooth"), [0, 0.15, _S.read(_e, "g")]))
	_S.define(_e, "out", _S.call_value(_S.read(_e, "smooth"), [0.85, 1, _S.read(_e, "g")]))
	return _S.merge([{"pts": _S.call_value(_S.read(_e, "mixPose"), [_S.call_value(_S.read(_e, "mixPose"), [_S.prop(_S.read(_e, "POSE"), "up"), _S.prop(_S.read(_e, "POSE"), "glide"), _S.read(_e, "into")]), _S.prop(_S.read(_e, "POSE"), "up"), _S.read(_e, "out")])}, {"down": false}, {"u": 0}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.write(_e, "t", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "t"), _S.read(_e, "D")]), "=", false)
	_S.define(_e, "y", 0)
	var _v2 = _S.scope(_e)
	_S.define(_v2, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "k"), 6)):
		if _S.truth(_S.prop(_S.call_value(_S.read(_v2, "wing"), [_S.binary("-", _S.read(_v2, "t"), _S.binary("*", _S.read(_v2, "k"), 0.02))]), "down")):
			_S.write(_v2, "y", 0.45, "-=", false)
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "k", 1, "+=", true)
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "GLIDE"))):
		_S.write(_e, "y", _S.binary("*", 2.2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "GLIDE")), _S.binary("-", _S.read(_e, "D"), _S.read(_e, "GLIDE"))))])), "+=", false)
	return _S.binary("+", _S.read(_e, "y"), 1.2)

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "Br", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.invoke(_S.read(_e, "g"), "clear", [])
	_S.invoke(_S.read(_e, "g"), "poly", [_S.call_value(_S.read(_e, "wingPts"), [_S.read(_e, "w"), true]), _S.prop(_S.read(_e, "C"), 1)])
	_S.define(_e, "tf", _S.binary("+", 0.25, _S.binary("*", 0.35, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 2)]))))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 3)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "a", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v4, "Math"), "PI"), _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_v4, "i"), 1), _S.read(_v4, "tf")), 0.5)), 0.1))
		_S.define(_v4, "L", _S.binary("-", 9, _S.invoke(_S.read(_v4, "Math"), "abs", [_S.binary("-", _S.read(_v4, "i"), 1)])))
		_S.invoke(_S.read(_v4, "g"), "poly", [[[_S.unary("-", 7), _S.unary("-", 2.4)], [_S.binary("+", _S.unary("-", 7), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "L"))), _S.binary("-", _S.binary("+", _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "L"))), 1.2)], [_S.binary("+", _S.unary("-", 7), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "L"))), _S.binary("+", _S.binary("+", _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "L"))), 1.2)], [_S.unary("-", 7), 0.6]], (_S.prop(_S.read(_v4, "C"), 3) if _S.truth(_S.binary("===", _S.read(_v4, "i"), 0)) else _S.prop(_S.read(_v4, "C"), 2))])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	_S.define(_e, "inBody", _S.function_value(_e, "_f3"))
	_S.invoke(_S.read(_e, "g"), "shade", [_S.unary("-", 10), _S.unary("-", 9), 12, 6, _S.function_value(_e, "_f4")])
	_S.invoke(_S.read(_e, "g"), "poly", [[[10.5, _S.unary("-", 4.5)], [14.5, _S.unary("-", 3)], [10.5, _S.unary("-", 2)]], _S.function_value(_e, "_f5")])
	_S.invoke(_S.read(_e, "g"), "set", [8, _S.unary("-", 4), _S.prop(_S.read(_e, "C"), 0)])
	_S.invoke(_S.read(_e, "g"), "set", [8, _S.unary("-", 5), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "g"), "set", [9, _S.unary("-", 4), _S.prop(_S.read(_e, "C"), 0)])
	_S.invoke(_S.read(_e, "g"), "line", [5, _S.unary("-", 7), 9, _S.unary("-", 6.5), _S.prop(_S.read(_e, "C"), 2)])
	_S.define(_e, "wp", _S.call_value(_S.read(_e, "wingPts"), [_S.read(_e, "w"), false]))
	_S.define(_e, "edge", _S.function_value(_e, "_f6"))
	_S.invoke(_S.read(_e, "g"), "poly", [_S.read(_e, "wp"), _S.function_value(_e, "_f7")])
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 3)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), 7)):
		_S.invoke(_S.read(_v9, "g"), "line", [_S.prop(_S.prop(_S.read(_v9, "wp"), 1), 0), _S.prop(_S.prop(_S.read(_v9, "wp"), 1), 1), _S.call_value(_S.read(_v9, "lerp"), [_S.prop(_S.prop(_S.read(_v9, "wp"), 1), 0), _S.prop(_S.prop(_S.read(_v9, "wp"), _S.read(_v9, "i")), 0), 0.92]), _S.call_value(_S.read(_v9, "lerp"), [_S.prop(_S.prop(_S.read(_v9, "wp"), 1), 1), _S.prop(_S.prop(_S.read(_v9, "wp"), _S.read(_v9, "i")), 1), 0.92]), _S.prop(_S.read(_v9, "C"), 2)])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "g"), "outline", [_S.prop(_S.read(_e, "C"), 0)])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("||", _S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("/", _S.binary("+", _S.read(_e, "x"), 1), 8.5), 2), _S.binary("**", _S.binary("/", _S.read(_e, "y"), 5.2), 2)), 1), func(): return _S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("-", _S.read(_e, "x"), 6.5), 2), _S.binary("**", _S.binary("+", _S.read(_e, "y"), 3), 2)), _S.binary("**", 4.6, 2)))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "inBody"), [_S.read(_e, "x"), _S.read(_e, "y")]))):
		return 0
	_S.define(_e, "top", _S.unary("!", _S.call_value(_S.read(_e, "inBody"), [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 2.2)])))
	_S.define(_e, "under", _S.unary("!", _S.call_value(_S.read(_e, "inBody"), [_S.binary("+", _S.read(_e, "x"), 0.5), _S.binary("+", _S.read(_e, "y"), 1.6)])))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "y"), _S.unary("-", 0.5)), func(): return _S.binary(">", _S.read(_e, "x"), _S.unary("-", 2.5)))):
		return (_S.prop(_S.read(_e, "Br"), 1) if _S.truth(_S.read(_e, "under")) else (_S.prop(_S.read(_e, "Br"), 3) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "x"), 3), func(): return _S.binary("<", _S.read(_e, "y"), 2))) else _S.prop(_S.read(_e, "Br"), 2)))
	if _S.truth(_S.binary(">", _S.read(_e, "y"), 1.5)):
		return (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.read(_e, "under")) else _S.prop(_S.read(_e, "C"), 5))
	return ((_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "x"), 2)) else _S.prop(_S.read(_e, "C"), 4)) if _S.truth(_S.read(_e, "top")) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "y"), _S.unary("-", 3.5)), func(): return _S.binary(">", _S.read(_e, "x"), 3))) else _S.prop(_S.read(_e, "C"), 3)))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return (_S.read(_e, "BEAK") if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 3))) else _S.read(_e, "BEAKD"))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "m", INF)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 1)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), 3)):
		var _v6 = _S.scope(_v5)
		var _v7 = _S.prop(_S.read(_v6, "wp"), _S.binary("-", _S.read(_v6, "i"), 1))
		_S.define(_v6, "ax", _S.prop(_v7, 0))
		_S.define(_v6, "ay", _S.prop(_v7, 1))
		var _v8 = _S.prop(_S.read(_v6, "wp"), _S.read(_v6, "i"))
		_S.define(_v6, "bx", _S.prop(_v8, 0))
		_S.define(_v6, "by", _S.prop(_v8, 1))
		_S.define(_v6, "dx", _S.binary("-", _S.read(_v6, "bx"), _S.read(_v6, "ax")))
		_S.define(_v6, "dy", _S.binary("-", _S.read(_v6, "by"), _S.read(_v6, "ay")))
		_S.define(_v6, "L2", _S.logical("||", _S.binary("+", _S.binary("*", _S.read(_v6, "dx"), _S.read(_v6, "dx")), _S.binary("*", _S.read(_v6, "dy"), _S.read(_v6, "dy"))), func(): return 1))
		_S.define(_v6, "u", _S.call_value(_S.read(_v6, "clamp"), [_S.binary("/", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v6, "x"), _S.read(_v6, "ax")), _S.read(_v6, "dx")), _S.binary("*", _S.binary("-", _S.read(_v6, "y"), _S.read(_v6, "ay")), _S.read(_v6, "dy"))), _S.read(_v6, "L2"))]))
		_S.write(_v6, "m", _S.invoke(_S.read(_v6, "Math"), "min", [_S.read(_v6, "m"), _S.invoke(_S.read(_v6, "Math"), "hypot", [_S.binary("-", _S.binary("+", _S.read(_v6, "ax"), _S.binary("*", _S.read(_v6, "dx"), _S.read(_v6, "u"))), _S.read(_v6, "x")), _S.binary("-", _S.binary("+", _S.read(_v6, "ay"), _S.binary("*", _S.read(_v6, "dy"), _S.read(_v6, "u"))), _S.read(_v6, "y"))])]), "=", false)
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	return _S.read(_e, "m")

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "d", _S.call_value(_S.read(_e, "edge"), [_S.read(_e, "x"), _S.read(_e, "y")]))
	return (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "d"), 1.2)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "d"), 3)) else _S.prop(_S.read(_e, "C"), 3)))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "Br", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "breast"), 4]))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "wing"), [_S.read(_e, "t")]))
	_S.define(_e, "y", _S.call_value(_S.read(_e, "lift"), [_S.read(_e, "t")]))
	_S.define(_e, "g", _S.read(_e, "GRID"))
	if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "w"), "down"), func(): return _S.binary(">", _S.prop(_S.read(_e, "w"), "u"), 0.1))):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "s", _S.binary("-", _S.read(_v10, "t"), 0.05))
		_S.define(_v10, "ws", _S.call_value(_S.read(_v10, "wing"), [_S.read(_v10, "s")]))
		_S.invoke(_S.read(_v10, "g"), "clear", [])
		_S.invoke(_S.read(_v10, "g"), "poly", [_S.call_value(_S.read(_v10, "wingPts"), [_S.read(_v10, "ws"), false]), _S.prop(_S.read(_v10, "C"), 6)])
		_S.invoke(_S.prop(_S.read(_v10, "g"), "a"), "fill", [0.42])
		_S.invoke(_S.read(_v10, "g"), "draw", [_S.read(_v10, "p"), 1, 0, _S.invoke(_S.read(_v10, "Math"), "round", [_S.call_value(_S.read(_v10, "lift"), [_S.read(_v10, "s")])])])
	_S.call_value(_S.read(_e, "bird"), [_S.read(_e, "g"), _S.read(_e, "C"), _S.read(_e, "Br"), _S.read(_e, "t"), _S.read(_e, "w")])
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p"), 1, 0, _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")])])
	_S.define(_e, "fa", _S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), 0.45), _S.read(_e, "D")]))
	if _S.truth(_S.binary("<", _S.read(_e, "fa"), 1.8)):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "fx", _S.binary("-", _S.binary("-", _S.unary("-", 6), _S.binary("*", 14, _S.read(_v11, "fa"))), _S.binary("*", 3, _S.invoke(_S.read(_v11, "Math"), "sin", [_S.binary("*", _S.read(_v11, "fa"), 5)]))))
		_S.define(_v11, "fy", _S.binary("+", _S.binary("+", 4, _S.binary("*", 9, _S.read(_v11, "fa"))), _S.binary("*", _S.binary("*", 1.5, _S.invoke(_S.read(_v11, "Math"), "cos", [_S.binary("*", _S.read(_v11, "fa"), 5)])), _S.read(_v11, "fa"))))
		_S.define(_v11, "rock", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.binary("*", _S.read(_v11, "fa"), 5)]), 0.8))
		_S.define(_v11, "a", _S.invoke(_S.read(_v11, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1.8, _S.read(_v11, "fa")), 2)]))
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "i", _S.unary("-", 2))
		while _S.truth(_S.binary("<=", _S.read(_v12, "i"), 2)):
			_S.invoke(_S.read(_v12, "p"), "dot", [_S.binary("+", _S.read(_v12, "fx"), _S.binary("*", _S.read(_v12, "i"), _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "rock")]))), _S.binary("+", _S.read(_v12, "fy"), _S.binary("*", _S.binary("*", _S.read(_v12, "i"), _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "rock")])), 0.8)), (_S.prop(_S.read(_v12, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v12, "i"), 0)) else _S.prop(_S.read(_v12, "C"), 4)), _S.read(_v12, "a")])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
		_S.invoke(_S.read(_v11, "p"), "dot", [_S.binary("+", _S.read(_v11, "fx"), _S.binary("*", 2.6, _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "rock")]))), _S.binary("+", _S.read(_v11, "fy"), _S.binary("*", _S.binary("*", 2.6, _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "rock")])), 0.8)), _S.prop(_S.read(_v11, "C"), 3), _S.read(_v11, "a")])
	_S.invoke(_S.read(_e, "p"), "glow", [2, _S.binary("-", _S.read(_e, "y"), 6), 16, _S.prop(_S.read(_e, "C"), 5), 0.12])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "u", _S.arg(_args, 2))
	return _S.invoke(_S.read(_e, "a"), "map", [_S.function_value(_e, "_f10")])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v13 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v13, 0))
	_S.define(_e, "y", _S.prop(_v13, 1))
	_S.define(_e, "i", _S.arg(_args, 1))
	return [_S.call_value(_S.read(_e, "lerp"), [_S.read(_e, "x"), _S.prop(_S.prop(_S.read(_e, "b"), _S.read(_e, "i")), 0), _S.read(_e, "u")]), _S.call_value(_S.read(_e, "lerp"), [_S.read(_e, "y"), _S.prop(_S.prop(_S.read(_e, "b"), _S.read(_e, "i")), 1), _S.read(_e, "u")])]

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "w", _S.arg(_args, 0))
	_S.define(_e, "far", _S.arg(_args, 1))
	return _S.invoke(_S.prop(_S.read(_e, "w"), "pts"), "map", [_S.function_value(_e, "_f12")])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v14 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v14, 0))
	_S.define(_e, "y", _S.prop(_v14, 1))
	return [_S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "SH"), 0), _S.read(_e, "x")), (1 if _S.truth(_S.read(_e, "far")) else 0)), _S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "SH"), 1), _S.binary("*", _S.read(_e, "y"), (0.85 if _S.truth(_S.read(_e, "far")) else 1))), (1 if _S.truth(_S.read(_e, "far")) else 0))]
