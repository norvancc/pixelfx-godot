@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/slime.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "curve", _S.import_value("fx/critters/_lib.js", "curve"))
	_S.define(_e, "spring", _S.import_value("fx/critters/_lib.js", "spring"))
	_S.define(_e, "toss", _S.import_value("fx/critters/_lib.js", "toss"))
	_S.define(_e, "lnoise", _S.import_value("fx/critters/_lib.js", "lnoise"))
	_S.define(_e, "pose", _S.function_value(_e, "_f0"))
	_S.define(_e, "halfW", _S.function_value(_e, "_f1"))
	_S.define(_e, "body", _S.function_value(_e, "_f2"))
	_S.define(_e, "face", _S.function_value(_e, "_f5"))
	_S.define(_e, "bubbleIn", _S.function_value(_e, "_f6"))
	_S.define(_e, "droplet", _S.function_value(_e, "_f7"))
	_S.define(_e, "puddleR", _S.function_value(_e, "_f8"))
	_S.define(_e, "draw", _S.function_value(_e, "_f9"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f13"))
	_S.define(_e, "meta", _S.merge([{"name": "Slime"}, {"desc": "A glossy slime hops in place: it squashes to wind up, stretches into the jump, rounds out in the air, splats down flinging droplets that creep back, then wobbles and blinks."}, {"tags": ["critter", "slime", "monster", "hop", "goo", "loop"]}, {"size": [112, 88]}, {"origin": [56, 72]}, {"duration": 1.8}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#061412", "#0b2f2b", "#12594a", "#1f8f4f", "#47c752", "#a6f06a", "#f0ffd2"]}, {"hop": 24}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 30), _S.unary("-", 64), 60, 66]))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "T_SQ", 0.5)
	_S.define(_e, "T_UP", 0.84)
	_S.define(_e, "T_LIFT", 0.9)
	_S.define(_e, "T_LAND", 1.44)
	_S.define(_e, "SNAP", 0.965)
	_S.define(_e, "W0", 30)
	_S.define(_e, "H0", 22)
	_S.define(_e, "VC", 0.4)
	_S.define(_e, "G", 640)
	_S.define(_e, "NDROP", 12)
	_S.define(_e, "inside", _S.function_value(_e, "_f16"))
	_S.define(_e, "POP", 0.4)
	_exports["draw"] = _S.read(_e, "draw")
	_S.define(_e, "DRIPS", [[1.02, _S.unary("-", 4)], [1.18, 3]])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "hop", _S.arg(_args, 1))
	_S.define(_e, "age", _S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "T_LAND")), _S.read(_e, "D")]))
	_S.define(_e, "s", null)
	_S.define(_e, "by", 0)
	_S.define(_e, "lean", 0)
	_S.define(_e, "round", 0.1)
	_S.define(_e, "q", _S.unary("-", 1))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_LIFT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_LAND")))):
		var _v0 = _S.scope(_e)
		_S.write(_v0, "q", _S.binary("/", _S.binary("-", _S.read(_v0, "t"), _S.read(_v0, "T_LIFT")), _S.binary("-", _S.read(_v0, "T_LAND"), _S.read(_v0, "T_LIFT"))), "=", false)
		_S.write(_v0, "by", _S.binary("*", _S.binary("*", _S.binary("*", _S.unary("-", _S.read(_v0, "hop")), 4), _S.read(_v0, "q")), _S.binary("-", 1, _S.read(_v0, "q"))), "=", false)
		_S.write(_v0, "s", _S.call_value(_S.read(_v0, "curve"), [_S.read(_v0, "q"), [[0, 0.36], [0.4, 0.02], [0.55, _S.unary("-", 0.05)], [0.85, 0.08], [1, 0.16]]]), "=", false)
		_S.write(_v0, "round", _S.binary("+", 0.1, _S.binary("*", _S.binary("*", 0.8, _S.call_value(_S.read(_v0, "smooth"), [0, 0.16, _S.read(_v0, "q")])), _S.binary("-", 1, _S.call_value(_S.read(_v0, "smooth"), [0.86, 1, _S.read(_v0, "q")])))), "=", false)
	else:
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_UP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_LIFT")))):
			_S.write(_e, "s", _S.call_value(_S.read(_e, "lerp"), [_S.unary("-", 0.3), 0.36, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "T_UP"), _S.read(_e, "T_LIFT")])])]), "=", false)
		else:
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_SQ")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_UP")))):
				var _v1 = _S.scope(_e)
				_S.define(_v1, "u", _S.call_value(_S.read(_v1, "seg"), [_S.read(_v1, "t"), _S.read(_v1, "T_SQ"), _S.read(_v1, "T_UP")]))
				_S.write(_v1, "s", _S.binary("+", _S.binary("*", _S.unary("-", 0.3), _S.invoke(_S.read(_v1, "ease"), "inOutSine", [_S.read(_v1, "u")])), _S.binary("*", _S.binary("*", 0.018, _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_v1, "t"), _S.read(_v1, "TAU")), 16)])), _S.call_value(_S.read(_v1, "smooth"), [0.55, 1, _S.read(_v1, "u")]))), "=", false)
			else:
				var _v2 = _S.scope(_e)
				_S.write(_v2, "s", (_S.unary("-", 0.46) if _S.truth(_S.binary("<", _S.read(_v2, "age"), 0.06)) else _S.binary("*", _S.unary("-", 0.46), _S.call_value(_S.read(_v2, "spring"), [_S.binary("-", _S.read(_v2, "age"), 0.06), 2.1, 4.6]))), "=", false)
				_S.write(_v2, "lean", _S.binary("*", _S.binary("*", 0.07, _S.invoke(_S.read(_v2, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_v2, "age")), 4)])), _S.invoke(_S.read(_v2, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_v2, "age"), _S.read(_v2, "TAU")), 1.9)])), "=", false)
				if _S.truth(_S.binary("<", _S.read(_v2, "t"), _S.read(_v2, "T_SQ"))):
					_S.write(_v2, "s", _S.binary("*", 0.02, _S.invoke(_S.read(_v2, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_v2, "t"), _S.read(_v2, "T_SQ")), _S.read(_v2, "TAU"))])), "+=", false)
	return _S.merge([{"s": _S.read(_e, "s")}, {"by": _S.read(_e, "by")}, {"lean": _S.read(_e, "lean")}, {"round": _S.read(_e, "round")}, {"q": _S.read(_e, "q")}, {"age": _S.read(_e, "age")}, {"W": _S.binary("/", _S.read(_e, "W0"), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", 1, _S.read(_e, "s"))]))}, {"H": _S.binary("*", _S.read(_e, "H0"), _S.binary("+", 1, _S.read(_e, "s")))}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "P", _S.arg(_args, 1))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "v"), 0), func(): return _S.binary(">", _S.read(_e, "v"), 1))):
		return _S.unary("-", 1)
	var _v3 = _S.read(_e, "P")
	_S.define(_e, "W", _S.prop(_v3, "W"))
	_S.define(_e, "H", _S.prop(_v3, "H"))
	_S.define(_e, "round", _S.prop(_v3, "round"))
	if _S.truth(_S.binary(">=", _S.read(_e, "v"), _S.read(_e, "VC"))):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "q", _S.binary("/", _S.binary("-", _S.read(_v4, "v"), _S.read(_v4, "VC")), _S.binary("-", 1, _S.read(_v4, "VC"))))
		return _S.binary("*", _S.binary("/", _S.read(_v4, "W"), 2), _S.invoke(_S.read(_v4, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_v4, "q"), _S.read(_v4, "q")))]))
	_S.define(_e, "q", _S.binary("/", _S.binary("-", _S.read(_e, "VC"), _S.read(_e, "v")), _S.read(_e, "VC")))
	_S.define(_e, "hb", _S.binary("*", _S.read(_e, "v"), _S.read(_e, "H")))
	_S.define(_e, "rc", 3)
	_S.define(_e, "hw", _S.binary("*", _S.binary("/", _S.read(_e, "W"), 2), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.binary("*", _S.read(_e, "round"), _S.read(_e, "q")), _S.read(_e, "q")))])])))
	if _S.truth(_S.binary("<", _S.read(_e, "hb"), _S.read(_e, "rc"))):
		_S.write(_e, "hw", _S.binary("-", _S.read(_e, "rc"), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", _S.binary("*", _S.read(_e, "rc"), _S.read(_e, "rc")), _S.binary("**", _S.binary("-", _S.read(_e, "rc"), _S.read(_e, "hb")), 2))])), "-=", false)
	return _S.read(_e, "hw")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "P", _S.arg(_args, 2))
	_S.define(_e, "yb", _S.binary("-", _S.prop(_S.read(_e, "P"), "by"), 1))
	_S.define(_e, "half", _S.binary("+", _S.binary("/", _S.prop(_S.read(_e, "P"), "W"), 2), 3))
	_S.define(_e, "cx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "P"), "lean"), 0.45), _S.prop(_S.read(_e, "P"), "H")))
	_S.define(_e, "cy", _S.binary("-", _S.read(_e, "yb"), _S.binary("*", _S.prop(_S.read(_e, "P"), "H"), 0.5)))
	_S.define(_e, "lx", _S.binary("-", _S.read(_e, "cx"), _S.binary("*", _S.prop(_S.read(_e, "P"), "W"), 0.24)))
	_S.define(_e, "ly", _S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.prop(_S.read(_e, "P"), "H"), 0.36)))
	_S.define(_e, "lit", _S.function_value(_e, "_f3"))
	_S.invoke(_S.read(_e, "g"), "clear", [])
	_S.invoke(_S.read(_e, "g"), "shade", [_S.unary("-", _S.read(_e, "half")), _S.binary("-", _S.binary("-", _S.read(_e, "yb"), _S.prop(_S.read(_e, "P"), "H")), 1), _S.read(_e, "half"), _S.read(_e, "yb"), _S.function_value(_e, "_f4")])
	_S.define(_e, "hx", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.read(_e, "cx"), _S.binary("*", _S.prop(_S.read(_e, "P"), "W"), 0.27))]))
	_S.define(_e, "hy", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.prop(_S.read(_e, "P"), "H"), 0.14))]))
	if _S.truth(_S.logical("&&", _S.call_value(_S.read(_e, "inside"), [_S.read(_e, "P"), _S.binary("-", _S.read(_e, "hx"), 1), _S.read(_e, "hy")]), func(): return _S.call_value(_S.read(_e, "inside"), [_S.read(_e, "P"), _S.binary("+", _S.read(_e, "hx"), 1), _S.binary("+", _S.read(_e, "hy"), 1)]))):
		_S.last([_S.invoke(_S.read(_e, "g"), "set", [_S.read(_e, "hx"), _S.read(_e, "hy"), _S.prop(_S.read(_e, "C"), 6)]), _S.invoke(_S.read(_e, "g"), "set", [_S.read(_e, "hx"), _S.binary("+", _S.read(_e, "hy"), 1), _S.prop(_S.read(_e, "C"), 5)])])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "k", _S.arg(_args, 2))
	return _S.call_value(_S.read(_e, "inside"), [_S.read(_e, "P"), _S.binary("+", _S.read(_e, "lx"), _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "lx")), _S.read(_e, "k"))), _S.binary("+", _S.read(_e, "ly"), _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ly")), _S.read(_e, "k")))])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "inside"), [_S.read(_e, "P"), _S.read(_e, "x"), _S.read(_e, "y")]))):
		return 0
	_S.set_prop(_S.read(_e, "o"), "t", 1, "=", false)
	_S.set_prop(_S.read(_e, "o"), "a", 0.92, "=", false)
	_S.define(_e, "i", (5 if _S.truth(_S.call_value(_S.read(_e, "lit"), [_S.read(_e, "x"), _S.read(_e, "y"), 0.42])) else (4 if _S.truth(_S.call_value(_S.read(_e, "lit"), [_S.read(_e, "x"), _S.read(_e, "y"), 0.7])) else 3)))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "yb"), _S.read(_e, "y")), _S.prop(_S.read(_e, "P"), "H")))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "v"), 0.3), func(): return _S.call_value(_S.read(_e, "inside"), [_S.read(_e, "P"), _S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1.4)]))):
		_S.write(_e, "i", (5 if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "inside"), [_S.read(_e, "P"), _S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 2.4)]))) else (4 if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.2)) else _S.read(_e, "i"))), "=", false)
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "inside"), [_S.read(_e, "P"), _S.binary("+", _S.read(_e, "x"), 2), _S.binary("+", _S.read(_e, "y"), 2.4)]))):
		_S.last([_S.write(_e, "i", 2, "=", false), _S.set_prop(_S.read(_e, "o"), "a", 1, "=", false)])
	_S.define(_e, "ang", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")), _S.binary("*", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.binary("/", _S.prop(_S.read(_e, "P"), "H"), _S.prop(_S.read(_e, "P"), "W")))]))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.unary("!", _S.call_value(_S.read(_e, "inside"), [_S.read(_e, "P"), _S.binary("-", _S.read(_e, "x"), 1.6), _S.binary("-", _S.read(_e, "y"), 1.6)])), func(): return _S.call_value(_S.read(_e, "inside"), [_S.read(_e, "P"), _S.binary("-", _S.read(_e, "x"), 0.7), _S.binary("-", _S.read(_e, "y"), 0.7)])), func(): return _S.binary(">", _S.read(_e, "ang"), _S.unary("-", 2.75))), func(): return _S.binary("<", _S.read(_e, "ang"), _S.unary("-", 1.55)))):
		_S.last([_S.write(_e, "i", (6 if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "ang"), _S.unary("-", 2.45)), func(): return _S.binary("<", _S.read(_e, "ang"), _S.unary("-", 1.8)))) else 5), "=", false), _S.set_prop(_S.read(_e, "o"), "a", 1, "=", false)])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary("===", _S.read(_e, "i"), 2), func(): return _S.call_value(_S.read(_e, "inside"), [_S.read(_e, "P"), _S.binary("+", _S.read(_e, "x"), 1), _S.binary("+", _S.read(_e, "y"), 1.2)])), func(): return _S.unary("!", _S.call_value(_S.read(_e, "inside"), [_S.read(_e, "P"), _S.binary("+", _S.read(_e, "x"), 2), _S.binary("+", _S.read(_e, "y"), 2.4)]))), func(): return _S.binary(">", _S.read(_e, "ang"), 0.3)), func(): return _S.binary("<", _S.read(_e, "ang"), 1.5))):
		_S.write(_e, "i", 4, "=", false)
	return _S.prop(_S.read(_e, "C"), _S.read(_e, "i"))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "P", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "yb", _S.binary("-", _S.prop(_S.read(_e, "P"), "by"), 1))
	_S.define(_e, "ev", 0.47)
	_S.define(_e, "ey", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.read(_e, "yb"), _S.binary("*", _S.prop(_S.read(_e, "P"), "H"), _S.read(_e, "ev")))]))
	_S.define(_e, "ex", _S.invoke(_S.read(_e, "Math"), "max", [3, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.prop(_S.read(_e, "P"), "W"), 0.16)])]))
	_S.define(_e, "xc", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "P"), "lean"), _S.read(_e, "ev")), _S.prop(_S.read(_e, "P"), "H"))]))
	_S.define(_e, "air", _S.binary(">=", _S.prop(_S.read(_e, "P"), "q"), 0))
	_S.define(_e, "shut", _S.logical("&&", _S.binary("<", _S.prop(_S.read(_e, "P"), "age"), 0.16), func(): return _S.unary("!", _S.read(_e, "air"))))
	_S.define(_e, "blink", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.22), func(): return _S.binary("<", _S.read(_e, "t"), 0.29)))
	_S.define(_e, "wind", (_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "T_SQ"), _S.read(_e, "T_UP")]) if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_SQ")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_LIFT")))) else 0))
	_S.define(_e, "look", ((_S.unary("-", 1) if _S.truth(_S.binary("<", _S.prop(_S.read(_e, "P"), "q"), 0.45)) else (1 if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "P"), "q"), 0.7)) else 0)) if _S.truth(_S.read(_e, "air")) else 0))
	_S.define(_e, "eh", _S.call_value(_S.read(_e, "clamp"), [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.binary("-", _S.binary("*", 4, _S.binary("+", 1, _S.binary("*", _S.prop(_S.read(_e, "P"), "s"), 0.8))), _S.binary("*", _S.read(_e, "wind"), 2)), (1 if _S.truth(_S.logical("&&", _S.read(_e, "air"), func(): return _S.binary("<", _S.prop(_S.read(_e, "P"), "q"), 0.6))) else 0))]), 1, 5]))
	for _v5 in _S.array([_S.unary("-", 1), 1]):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "side", _v5)
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "x", _S.binary("-", _S.binary("+", _S.read(_v7, "xc"), _S.binary("*", _S.read(_v7, "side"), _S.read(_v7, "ex"))), (1 if _S.truth(_S.binary(">", _S.read(_v7, "side"), 0)) else 0)))
		if _S.truth(_S.read(_v7, "shut")):
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "a", (0 if _S.truth(_S.binary("<", _S.read(_v8, "side"), 0)) else 1))
			_S.define(_v8, "b", _S.binary("-", 1, _S.read(_v8, "a")))
			_S.invoke(_S.read(_v8, "g"), "set", [_S.binary("+", _S.read(_v8, "x"), _S.read(_v8, "a")), _S.binary("-", _S.read(_v8, "ey"), 1), _S.prop(_S.read(_v8, "C"), 0)])
			_S.invoke(_S.read(_v8, "g"), "set", [_S.binary("+", _S.read(_v8, "x"), _S.read(_v8, "b")), _S.read(_v8, "ey"), _S.prop(_S.read(_v8, "C"), 0)])
			_S.invoke(_S.read(_v8, "g"), "set", [_S.binary("+", _S.read(_v8, "x"), _S.read(_v8, "a")), _S.binary("+", _S.read(_v8, "ey"), 1), _S.prop(_S.read(_v8, "C"), 0)])
			continue
		if _S.truth(_S.read(_v7, "blink")):
			var _v9 = _S.scope(_v7)
			_S.invoke(_S.read(_v9, "g"), "set", [_S.read(_v9, "x"), _S.binary("+", _S.read(_v9, "ey"), 1), _S.prop(_S.read(_v9, "C"), 0)])
			_S.invoke(_S.read(_v9, "g"), "set", [_S.binary("+", _S.read(_v9, "x"), 1), _S.binary("+", _S.read(_v9, "ey"), 1), _S.prop(_S.read(_v9, "C"), 0)])
			continue
		_S.define(_v7, "top", _S.binary("+", _S.binary("-", _S.binary("+", _S.read(_v7, "ey"), 2), _S.read(_v7, "eh")), _S.read(_v7, "look")))
		var _v10 = _S.scope(_v7)
		_S.define(_v10, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "k"), _S.read(_v10, "eh"))):
			_S.last([_S.invoke(_S.read(_v10, "g"), "set", [_S.read(_v10, "x"), _S.binary("+", _S.read(_v10, "top"), _S.read(_v10, "k")), _S.prop(_S.read(_v10, "C"), 0)]), _S.invoke(_S.read(_v10, "g"), "set", [_S.binary("+", _S.read(_v10, "x"), 1), _S.binary("+", _S.read(_v10, "top"), _S.read(_v10, "k")), _S.prop(_S.read(_v10, "C"), 0)])])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "k", 1, "+=", true)
		_S.invoke(_S.read(_v7, "g"), "set", [_S.binary("+", _S.read(_v7, "x"), (1 if _S.truth(_S.binary(">", _S.read(_v7, "look"), 0)) else 0)), _S.binary("+", _S.read(_v7, "top"), (1 if _S.truth(_S.binary(">", _S.read(_v7, "look"), 0)) else 0)), _S.prop(_S.read(_v7, "C"), 6)])
		if _S.truth(_S.binary(">=", _S.read(_v7, "eh"), 4)):
			_S.invoke(_S.read(_v7, "g"), "set", [_S.binary("+", _S.read(_v7, "x"), 1), _S.binary("-", _S.binary("+", _S.read(_v7, "top"), _S.read(_v7, "eh")), 1), _S.prop(_S.read(_v7, "C"), 2)])
	_S.define(_e, "my", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.read(_e, "yb"), _S.binary("*", _S.prop(_S.read(_e, "P"), "H"), 0.31))]))
	if _S.truth(_S.logical("&&", _S.read(_e, "air"), func(): return _S.binary("<", _S.prop(_S.read(_e, "P"), "q"), 0.75))):
		_S.last([_S.invoke(_S.read(_e, "g"), "set", [_S.read(_e, "xc"), _S.read(_e, "my"), _S.prop(_S.read(_e, "C"), 0)]), _S.invoke(_S.read(_e, "g"), "set", [_S.binary("-", _S.read(_e, "xc"), 1), _S.read(_e, "my"), _S.prop(_S.read(_e, "C"), 0)]), _S.invoke(_S.read(_e, "g"), "set", [_S.read(_e, "xc"), _S.binary("+", _S.read(_e, "my"), 1), _S.prop(_S.read(_e, "C"), 1)]), _S.invoke(_S.read(_e, "g"), "set", [_S.binary("-", _S.read(_e, "xc"), 1), _S.binary("+", _S.read(_e, "my"), 1), _S.prop(_S.read(_e, "C"), 1)])])
	else:
		if _S.truth(_S.unary("!", _S.read(_e, "shut"))):
			_S.last([_S.invoke(_S.read(_e, "g"), "set", [_S.read(_e, "xc"), _S.read(_e, "my"), _S.prop(_S.read(_e, "C"), 1)]), _S.invoke(_S.read(_e, "g"), "set", [_S.binary("-", _S.read(_e, "xc"), 1), _S.read(_e, "my"), _S.prop(_S.read(_e, "C"), 1)])])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "P", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	if _S.truth(_S.binary(">", _S.read(_e, "t"), _S.read(_e, "POP"))):
		return null
	_S.define(_e, "v", _S.call_value(_S.read(_e, "lerp"), [0.18, 0.86, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "POP"))])]))
	_S.define(_e, "hw", _S.call_value(_S.read(_e, "halfW"), [_S.read(_e, "v"), _S.read(_e, "P")]))
	_S.define(_e, "x", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "P"), "lean"), _S.read(_e, "v")), _S.prop(_S.read(_e, "P"), "H")), _S.binary("*", _S.read(_e, "hw"), _S.call_value(_S.read(_e, "lerp"), [0.35, 0.05, _S.binary("/", _S.read(_e, "t"), _S.read(_e, "POP"))]))))
	_S.define(_e, "y", _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "P"), "by"), 1), _S.binary("*", _S.read(_e, "v"), _S.prop(_S.read(_e, "P"), "H"))))
	_S.invoke(_S.read(_e, "g"), "set", [_S.read(_e, "x"), _S.read(_e, "y"), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("+", _S.read(_e, "x"), 1), _S.read(_e, "y"), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("+", _S.read(_e, "x"), 1), _S.binary("+", _S.read(_e, "y"), 1), _S.prop(_S.read(_e, "C"), 4)])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "o", _S.arg(_args, 1))
	_S.define(_e, "age", _S.arg(_args, 2))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rng"), [_S.prop(_S.read(_e, "o"), "seed"), _S.read(_e, "i"), 7]))
	_S.define(_e, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1.2), 1.2])))
	_S.define(_e, "sp", _S.invoke(_S.read(_e, "r"), "range", [60, 118]))
	_S.define(_e, "size", (1 if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.35])) else (2 if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.7])) else 3)))
	_S.define(_e, "fa", _S.binary("+", _S.read(_e, "a"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)))
	_S.define(_e, "x0", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "fa")]), 21))
	_S.define(_e, "y0", _S.binary("-", _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "fa")]), 12.5)))
	_S.define(_e, "f", _S.call_value(_S.read(_e, "toss"), [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "sp")), 0.75), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "sp")), _S.read(_e, "age"), _S.read(_e, "G"), _S.unary("-", 1)]))
	_S.set_prop(_S.read(_e, "f"), "size", _S.read(_e, "size"), "=", false)
	if _S.truth(_S.prop(_S.read(_e, "f"), "landed")):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "home", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sign", [_S.logical("||", _S.prop(_S.read(_v11, "f"), "lx"), func(): return 1)]), _S.binary("-", _S.binary("/", _S.read(_v11, "W0"), 2), 2)))
		_S.define(_v11, "dur", _S.invoke(_S.read(_v11, "Math"), "min", [0.55, _S.binary("+", 0.22, _S.binary("/", _S.invoke(_S.read(_v11, "Math"), "abs", [_S.binary("-", _S.prop(_S.read(_v11, "f"), "lx"), _S.read(_v11, "home"))]), 60))]))
		_S.define(_v11, "u", _S.call_value(_S.read(_v11, "seg"), [_S.binary("-", _S.binary("-", _S.read(_v11, "age"), _S.prop(_S.read(_v11, "f"), "at")), 0.14), 0, _S.read(_v11, "dur")]))
		_S.set_prop(_S.read(_v11, "f"), "x", _S.call_value(_S.read(_v11, "lerp"), [_S.prop(_S.read(_v11, "f"), "lx"), _S.read(_v11, "home"), _S.invoke(_S.read(_v11, "ease"), "inOutSine", [_S.read(_v11, "u")])]), "=", false)
		_S.set_prop(_S.read(_v11, "f"), "k", _S.binary("-", 1, _S.read(_v11, "u")), "=", false)
		_S.set_prop(_S.read(_v11, "f"), "gone", _S.binary(">=", _S.read(_v11, "u"), 1), "=", false)
		_S.set_prop(_S.read(_v11, "f"), "splat", _S.call_value(_S.read(_v11, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v11, "age"), _S.prop(_S.read(_v11, "f"), "at")), 0.14))]), "=", false)
	return _S.read(_e, "f")

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "P", _S.arg(_args, 1))
	if _S.truth(_S.binary(">=", _S.prop(_S.read(_e, "P"), "q"), 0)):
		return _S.binary("*", _S.binary("+", _S.binary("/", _S.binary("/", _S.read(_e, "W0"), _S.invoke(_S.read(_e, "Math"), "sqrt", [1.36])), 2), 3), _S.binary("-", 1, _S.binary("*", 0.22, _S.prop(_S.read(_e, "P"), "q"))))
	return _S.binary("+", _S.binary("+", _S.binary("/", _S.prop(_S.read(_e, "P"), "W"), 2), 3), _S.binary("*", _S.binary("*", _S.binary("*", 9, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.prop(_S.read(_e, "P"), "age")), 5)])), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.prop(_S.read(_e, "P"), "age")), 40)]))), (1 if _S.truth(_S.logical("||", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_LAND")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_SQ")))) else 0)))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "P", _S.call_value(_S.read(_e, "pose"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "hop")]))
	_S.define(_e, "yb", _S.binary("-", _S.prop(_S.read(_e, "P"), "by"), 1))
	_S.define(_e, "age", _S.prop(_S.read(_e, "P"), "age"))
	_S.define(_e, "g", _S.read(_e, "GRID"))
	_S.call_value(_S.read(_e, "body"), [_S.read(_e, "g"), _S.read(_e, "C"), _S.read(_e, "P")])
	_S.call_value(_S.read(_e, "face"), [_S.read(_e, "g"), _S.read(_e, "C"), _S.read(_e, "P"), _S.read(_e, "t")])
	_S.call_value(_S.read(_e, "bubbleIn"), [_S.read(_e, "g"), _S.read(_e, "C"), _S.read(_e, "P"), _S.read(_e, "t")])
	_S.invoke(_S.read(_e, "g"), "outline", [_S.function_value(_e, "_f10")])
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p")])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POP"), 0.16)))):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "k", _S.binary("/", _S.binary("-", _S.read(_v12, "t"), _S.read(_v12, "POP")), 0.16))
		_S.define(_v12, "x", _S.binary("-", _S.binary("*", _S.prop(_S.read(_v12, "P"), "lean"), _S.prop(_S.read(_v12, "P"), "H")), _S.binary("*", _S.call_value(_S.read(_v12, "halfW"), [0.86, _S.read(_v12, "P")]), 0.05)))
		_S.define(_v12, "y", _S.binary("-", _S.binary("-", _S.read(_v12, "yb"), _S.prop(_S.read(_v12, "P"), "H")), 0.5))
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "a", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "a"), _S.read(_v13, "TAU"))):
			_S.invoke(_S.read(_v13, "p"), "dot", [_S.binary("+", _S.read(_v13, "x"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.binary("+", 1, _S.binary("*", _S.read(_v13, "k"), 3)))), _S.binary("+", _S.read(_v13, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.binary("+", 1, _S.binary("*", _S.read(_v13, "k"), 3))), 0.7)), _S.prop(_S.read(_v13, "C"), 6), _S.binary("-", 1.2, _S.read(_v13, "k"))])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "a", 0.6, "+=", false)
		for _v14 in _S.array([_S.unary("-", 1), 1]):
			var _v15 = _S.scope(_v12)
			_S.define(_v15, "s", _v14)
			_S.invoke(_S.read(_v15, "p"), "dot", [_S.binary("+", _S.read(_v15, "x"), _S.binary("*", _S.read(_v15, "s"), _S.binary("+", 1, _S.binary("*", _S.read(_v15, "k"), 4)))), _S.binary("+", _S.binary("-", _S.binary("-", _S.read(_v15, "y"), 1), _S.binary("*", _S.read(_v15, "k"), 6)), _S.binary("*", _S.binary("*", _S.read(_v15, "k"), _S.read(_v15, "k")), 4)), _S.prop(_S.read(_v15, "C"), 5), _S.binary("-", 1.3, _S.read(_v15, "k"))])
		_S.invoke(_S.read(_v12, "p"), "glow", [_S.read(_v12, "x"), _S.read(_v12, "y"), 6, _S.prop(_S.read(_v12, "C"), 5), _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_v12, "k")))])
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), _S.read(_v16, "NDROP"))):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "f", _S.call_value(_S.read(_v17, "droplet"), [_S.read(_v17, "i"), _S.read(_v17, "o"), _S.read(_v17, "age")]))
		if _S.truth(_S.logical("||", _S.prop(_S.read(_v17, "f"), "landed"), func(): return _S.call_value(_S.read(_v17, "inside"), [_S.read(_v17, "P"), _S.prop(_S.read(_v17, "f"), "x"), _S.prop(_S.read(_v17, "f"), "y")]))):
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
			continue
		_S.define(_v17, "sv", _S.logical("||", _S.invoke(_S.read(_v17, "Math"), "hypot", [_S.prop(_S.read(_v17, "f"), "vx"), _S.prop(_S.read(_v17, "f"), "vy")]), func(): return 1))
		_S.define(_v17, "ux", _S.binary("/", _S.prop(_S.read(_v17, "f"), "vx"), _S.read(_v17, "sv")))
		_S.define(_v17, "uy", _S.binary("/", _S.prop(_S.read(_v17, "f"), "vy"), _S.read(_v17, "sv")))
		_S.define(_v17, "L", _S.invoke(_S.read(_v17, "Math"), "min", [2.5, _S.binary("/", _S.read(_v17, "sv"), 50)]))
		_S.invoke(_S.read(_v17, "p"), "line", [_S.binary("-", _S.prop(_S.read(_v17, "f"), "x"), _S.binary("*", _S.read(_v17, "ux"), _S.read(_v17, "L"))), _S.binary("-", _S.prop(_S.read(_v17, "f"), "y"), _S.binary("*", _S.read(_v17, "uy"), _S.read(_v17, "L"))), _S.prop(_S.read(_v17, "f"), "x"), _S.prop(_S.read(_v17, "f"), "y"), _S.prop(_S.read(_v17, "C"), 3)])
		if _S.truth(_S.binary(">=", _S.prop(_S.read(_v17, "f"), "size"), 2)):
			_S.last([_S.invoke(_S.read(_v17, "p"), "px", [_S.binary("-", _S.prop(_S.read(_v17, "f"), "x"), 1), _S.prop(_S.read(_v17, "f"), "y"), _S.prop(_S.read(_v17, "C"), 4)]), _S.invoke(_S.read(_v17, "p"), "px", [_S.binary("-", _S.prop(_S.read(_v17, "f"), "x"), 1), _S.binary("+", _S.prop(_S.read(_v17, "f"), "y"), 1), _S.prop(_S.read(_v17, "C"), 3)]), _S.invoke(_S.read(_v17, "p"), "px", [_S.prop(_S.read(_v17, "f"), "x"), _S.binary("+", _S.prop(_S.read(_v17, "f"), "y"), 1), _S.prop(_S.read(_v17, "C"), 2)])])
		if _S.truth(_S.binary(">=", _S.prop(_S.read(_v17, "f"), "size"), 3)):
			_S.last([_S.invoke(_S.read(_v17, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v17, "f"), "x"), 1), _S.prop(_S.read(_v17, "f"), "y"), _S.prop(_S.read(_v17, "C"), 3)]), _S.invoke(_S.read(_v17, "p"), "px", [_S.binary("-", _S.prop(_S.read(_v17, "f"), "x"), 1), _S.binary("-", _S.prop(_S.read(_v17, "f"), "y"), 1), _S.prop(_S.read(_v17, "C"), 4)]), _S.invoke(_S.read(_v17, "p"), "px", [_S.prop(_S.read(_v17, "f"), "x"), _S.binary("-", _S.prop(_S.read(_v17, "f"), "y"), 1), _S.prop(_S.read(_v17, "C"), 5)])])
		_S.invoke(_S.read(_v17, "p"), "px", [_S.prop(_S.read(_v17, "f"), "x"), _S.prop(_S.read(_v17, "f"), "y"), (_S.prop(_S.read(_v17, "C"), 6) if _S.truth(_S.binary(">=", _S.prop(_S.read(_v17, "f"), "size"), 2)) else _S.prop(_S.read(_v17, "C"), 5))])
		_S.invoke(_S.read(_v17, "p"), "glow", [_S.prop(_S.read(_v17, "f"), "x"), _S.prop(_S.read(_v17, "f"), "y"), _S.binary("+", 5, _S.prop(_S.read(_v17, "f"), "size")), _S.prop(_S.read(_v17, "C"), 4), 0.32])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 7, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 13), 1), _S.function_value(_e, "_f11"), _S.function_value(_e, "_f12")])
	for _v18 in _S.array(_S.read(_e, "DRIPS")):
		var _v19 = _S.scope(_e)
		var _v20 = _v18
		_S.define(_v19, "t0", _S.prop(_v20, 0))
		_S.define(_v19, "dx", _S.prop(_v20, 1))
		var _v21 = _S.scope(_v19)
		_S.define(_v21, "a2", _S.call_value(_S.read(_v21, "wrap"), [_S.binary("-", _S.read(_v21, "t"), _S.read(_v21, "t0")), _S.read(_v21, "D")]))
		if _S.truth(_S.binary(">", _S.read(_v21, "a2"), 0.6)):
			continue
		_S.define(_v21, "P0", _S.call_value(_S.read(_v21, "pose"), [_S.read(_v21, "t0"), _S.prop(_S.read(_v21, "o"), "hop")]))
		_S.define(_v21, "f", _S.call_value(_S.read(_v21, "toss"), [_S.read(_v21, "dx"), _S.binary("-", _S.prop(_S.read(_v21, "P0"), "by"), 0.5), 0, 12, _S.read(_v21, "a2"), _S.read(_v21, "G"), _S.unary("-", 1)]))
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v21, "f"), "landed"))):
			_S.last([_S.invoke(_S.read(_v21, "p"), "px", [_S.read(_v21, "dx"), _S.prop(_S.read(_v21, "f"), "y"), _S.prop(_S.read(_v21, "C"), 5)]), _S.invoke(_S.read(_v21, "p"), "px", [_S.read(_v21, "dx"), _S.binary("-", _S.prop(_S.read(_v21, "f"), "y"), 1), _S.prop(_S.read(_v21, "C"), 4)]), _S.invoke(_S.read(_v21, "p"), "glow", [_S.read(_v21, "dx"), _S.prop(_S.read(_v21, "f"), "y"), 4, _S.prop(_S.read(_v21, "C"), 4), 0.3])])
		else:
			if _S.truth(_S.binary("<", _S.binary("-", _S.read(_v21, "a2"), _S.prop(_S.read(_v21, "f"), "at")), 0.14)):
				var _v22 = _S.scope(_v21)
				_S.define(_v22, "k", _S.binary("/", _S.binary("-", _S.read(_v22, "a2"), _S.prop(_S.read(_v22, "f"), "at")), 0.14))
				for _v23 in _S.array([_S.unary("-", 1), 1]):
					var _v24 = _S.scope(_v22)
					_S.define(_v24, "s2", _v23)
					_S.invoke(_S.read(_v24, "p"), "dot", [_S.binary("+", _S.read(_v24, "dx"), _S.binary("*", _S.read(_v24, "s2"), _S.binary("+", 1, _S.binary("*", _S.read(_v24, "k"), 3)))), _S.binary("+", _S.binary("-", _S.unary("-", 2), _S.binary("*", _S.read(_v24, "k"), 3)), _S.binary("*", _S.binary("*", _S.read(_v24, "k"), _S.read(_v24, "k")), 3)), _S.prop(_S.read(_v24, "C"), 5), _S.binary("-", 1.2, _S.read(_v24, "k"))])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_e, "P"), "q"), 0.4), func(): return _S.binary("<", _S.prop(_S.read(_e, "P"), "q"), 0.64))):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "k", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v25, "Math"), "PI"), _S.call_value(_S.read(_v25, "seg"), [_S.prop(_S.read(_v25, "P"), "q"), 0.4, 0.64]))]))
		_S.call_value(_S.read(_v25, "sparkle"), [_S.read(_v25, "p"), _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v25, "P"), "lean"), 0.8), _S.prop(_S.read(_v25, "P"), "H")), _S.binary("*", _S.prop(_S.read(_v25, "P"), "W"), 0.21)), _S.binary("-", _S.read(_v25, "yb"), _S.binary("*", _S.prop(_S.read(_v25, "P"), "H"), 0.8)), _S.binary("+", 1, _S.binary("*", 2.5, _S.read(_v25, "k"))), _S.prop(_S.read(_v25, "C"), 6), _S.prop(_S.read(_v25, "C"), 5), _S.binary("*", 0.5, _S.read(_v25, "k"))])
	_S.define(_e, "cx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "P"), "lean"), _S.prop(_S.read(_e, "P"), "H")), 0.4))
	_S.define(_e, "cy", _S.binary("-", _S.read(_e, "yb"), _S.binary("*", _S.prop(_S.read(_e, "P"), "H"), 0.45)))
	_S.define(_e, "near", _S.call_value(_S.read(_e, "clamp"), [_S.binary("+", 1, _S.binary("/", _S.prop(_S.read(_e, "P"), "by"), _S.binary("*", _S.prop(_S.read(_e, "o"), "hop"), 1.1)))]))
	_S.define(_e, "R", _S.call_value(_S.read(_e, "puddleR"), [_S.read(_e, "t"), _S.read(_e, "P")]))
	_S.define(_e, "br", _S.binary("+", 0.9, _S.binary("*", 0.1, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 2)]))))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("*", _S.read(_e, "cx"), 0.5), _S.unary("-", 14), 64, _S.prop(_S.read(_e, "C"), 3), _S.binary("*", 0.3, _S.read(_e, "br"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("+", 30, _S.binary("*", _S.prop(_S.read(_e, "P"), "W"), 0.3)), _S.prop(_S.read(_e, "C"), 4), 0.2])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "cx"), _S.binary("+", _S.read(_e, "cy"), 3), 14, _S.prop(_S.read(_e, "C"), 5), 0.16])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 2), _S.binary("+", _S.binary("*", _S.read(_e, "R"), 1.3), 6), _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.12, _S.binary("*", 0.08, _S.read(_e, "near")))])
	if _S.truth(_S.logical("||", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_LAND")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_SQ")))):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 3), 40, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.42, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "age")), 9)]))])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "nx", _S.arg(_args, 2))
	_S.define(_e, "ny", _S.arg(_args, 3))
	return (_S.prop(_S.read(_e, "C"), 1) if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_e, "ny"), 0), func(): return _S.binary("<=", _S.read(_e, "nx"), 0)), func(): return _S.binary("<", _S.read(_e, "y"), _S.binary("-", _S.read(_e, "yb"), _S.binary("*", _S.prop(_S.read(_e, "P"), "H"), 0.5))))) else _S.prop(_S.read(_e, "C"), 0))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.2, 1.8])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ag", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "ag"), _S.read(_e, "L")))
	_S.define(_e, "x", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 24), 24]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "ag"), 2.1), _S.binary("*", _S.read(_e, "i"), 1.7))]), 3)))
	_S.define(_e, "y", _S.binary("-", _S.binary("-", _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [9, 17]), _S.read(_e, "ag"))), _S.binary("*", _S.binary("*", 5, _S.read(_e, "ag")), _S.read(_e, "ag"))))
	_S.define(_e, "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 4)]), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_e, "k")), 2.5)])))
	_S.define(_e, "tw", _S.binary("+", 0.6, _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "ag"), 7), _S.binary("*", _S.read(_e, "i"), 2.3))]))))
	_S.define(_e, "big", _S.invoke(_S.read(_e, "r"), "chance", [0.35]))
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "tw"), 0.8)) else _S.prop(_S.read(_e, "C"), 5)), _S.read(_e, "a")])
	if _S.truth(_S.read(_e, "big")):
		_S.last([_S.invoke(_S.read(_e, "p"), "dot", [_S.binary("+", _S.read(_e, "x"), 1), _S.read(_e, "y"), _S.prop(_S.read(_e, "C"), 5), _S.read(_e, "a")]), _S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1), _S.prop(_S.read(_e, "C"), 4), _S.read(_e, "a")]), _S.invoke(_S.read(_e, "p"), "dot", [_S.binary("+", _S.read(_e, "x"), 1), _S.binary("+", _S.read(_e, "y"), 1), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.read(_e, "a"), 0.6)])])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), (9 if _S.truth(_S.read(_e, "big")) else 6), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", _S.binary("*", (0.45 if _S.truth(_S.read(_e, "big")) else 0.32), _S.read(_e, "a")), _S.read(_e, "tw"))])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "P", _S.call_value(_S.read(_e, "pose"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "hop")]))
	_S.define(_e, "age", _S.prop(_S.read(_e, "P"), "age"))
	_S.define(_e, "R", _S.call_value(_S.read(_e, "puddleR"), [_S.read(_e, "t"), _S.read(_e, "P")]))
	_S.define(_e, "hp", _S.invoke(_S.read(_e, "Math"), "min", [2.4, _S.binary("+", 0.9, _S.binary("*", _S.read(_e, "R"), 0.06))]))
	var _v26 = _S.scope(_e)
	_S.define(_v26, "x", _S.invoke(_S.read(_v26, "Math"), "floor", [_S.unary("-", _S.read(_v26, "R"))]))
	while _S.truth(_S.binary("<=", _S.read(_v26, "x"), _S.invoke(_S.read(_v26, "Math"), "ceil", [_S.read(_v26, "R")]))):
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "d", _S.binary("/", _S.invoke(_S.read(_v27, "Math"), "abs", [_S.binary("+", _S.read(_v27, "x"), 0.5)]), _S.read(_v27, "R")))
		if _S.truth(_S.binary(">", _S.read(_v27, "d"), 1)):
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "x", 1, "+=", true)
			continue
		_S.define(_v27, "top", _S.binary("-", _S.unary("-", 1), _S.invoke(_S.read(_v27, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_v27, "d"), _S.read(_v27, "d")))]), _S.read(_v27, "hp"))])))
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "y", _S.read(_v28, "top"))
		while _S.truth(_S.binary("<=", _S.read(_v28, "y"), 0)):
			var _v29 = _S.scope(_v28)
			_S.define(_v29, "c", (_S.prop(_S.read(_v29, "C"), 5) if _S.truth(_S.binary("===", _S.read(_v29, "y"), _S.read(_v29, "top"))) else (_S.prop(_S.read(_v29, "C"), 2) if _S.truth(_S.binary("===", _S.read(_v29, "y"), 0)) else _S.prop(_S.read(_v29, "C"), 4))))
			if _S.truth(_S.binary(">", _S.read(_v29, "d"), 0.88)):
				_S.write(_v29, "c", (_S.prop(_S.read(_v29, "C"), 4) if _S.truth(_S.binary("===", _S.read(_v29, "y"), _S.read(_v29, "top"))) else _S.prop(_S.read(_v29, "C"), 3)), "=", false)
			if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v29, "y"), _S.read(_v29, "top")), func(): return _S.binary("<", _S.read(_v29, "d"), 0.88))):
				var _v30 = _S.scope(_v29)
				_S.define(_v30, "n", _S.binary("+", _S.call_value(_S.read(_v30, "lnoise"), [_S.read(_v30, "t"), _S.read(_v30, "D"), 7, _S.binary("*", _S.read(_v30, "x"), 0.18), 3]), _S.binary("*", _S.call_value(_S.read(_v30, "lnoise"), [_S.read(_v30, "t"), _S.read(_v30, "D"), 4, _S.binary("*", _S.read(_v30, "x"), 0.07), 4]), 0.6)))
				if _S.truth(_S.binary(">", _S.read(_v30, "n"), 0.55)):
					_S.write(_v30, "c", _S.prop(_S.read(_v30, "C"), 6), "=", false)
			else:
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("===", _S.read(_v29, "y"), _S.binary("+", _S.read(_v29, "top"), 1)), func(): return _S.binary("<", _S.read(_v29, "d"), 0.8)), func(): return _S.binary(">", _S.call_value(_S.read(_v29, "lnoise"), [_S.read(_v29, "t"), _S.read(_v29, "D"), 3, _S.binary("*", _S.read(_v29, "x"), 0.12), 5]), 0.3))):
					_S.write(_v29, "c", _S.prop(_S.read(_v29, "C"), 5), "=", false)
			_S.invoke(_S.read(_v29, "p"), "px", [_S.read(_v29, "x"), _S.read(_v29, "y"), _S.read(_v29, "c")])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "y", 1, "+=", true)
		if _S.truth(_S.binary(">", _S.read(_v27, "d"), 0.96)):
			_S.invoke(_S.read(_v27, "p"), "px", [_S.read(_v27, "x"), _S.binary("-", _S.read(_v27, "top"), 1), _S.prop(_S.read(_v27, "C"), 1)])
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "x", 1, "+=", true)
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 4, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 17), 3), _S.function_value(_e, "_f14"), _S.function_value(_e, "_f15")])
	var _v39 = _S.scope(_e)
	_S.define(_v39, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v39, "i"), _S.read(_v39, "NDROP"))):
		var _v40 = _S.scope(_v39)
		_S.define(_v40, "f", _S.call_value(_S.read(_v40, "droplet"), [_S.read(_v40, "i"), _S.read(_v40, "o"), _S.read(_v40, "age")]))
		if _S.truth(_S.logical("||", _S.unary("!", _S.prop(_S.read(_v40, "f"), "landed")), func(): return _S.prop(_S.read(_v40, "f"), "gone"))):
			_v39 = _S.iteration(_v39)
			_S.write(_v39, "i", 1, "+=", true)
			continue
		_S.define(_v40, "x", _S.invoke(_S.read(_v40, "Math"), "round", [_S.prop(_S.read(_v40, "f"), "x")]))
		_S.define(_v40, "w", _S.binary("+", _S.prop(_S.read(_v40, "f"), "size"), (1 if _S.truth(_S.binary(">", _S.prop(_S.read(_v40, "f"), "splat"), 0)) else 0)))
		var _v41 = _S.scope(_v40)
		_S.define(_v41, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v41, "j"), _S.read(_v41, "w"))):
			_S.invoke(_S.read(_v41, "p"), "px", [_S.binary("+", _S.binary("-", _S.read(_v41, "x"), _S.binary(">>", _S.read(_v41, "w"), 1)), _S.read(_v41, "j")), _S.unary("-", 1), (_S.prop(_S.read(_v41, "C"), 5) if _S.truth(_S.binary("===", _S.read(_v41, "j"), 0)) else _S.prop(_S.read(_v41, "C"), 4))])
			_v41 = _S.iteration(_v41)
			_S.write(_v41, "j", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v40, "f"), "size"), 2), func(): return _S.binary("<=", _S.prop(_S.read(_v40, "f"), "splat"), 0))):
			_S.last([_S.invoke(_S.read(_v40, "p"), "px", [_S.read(_v40, "x"), _S.unary("-", 2), _S.prop(_S.read(_v40, "C"), 5)]), _S.invoke(_S.read(_v40, "p"), "px", [_S.binary("-", _S.read(_v40, "x"), 1), _S.unary("-", 2), _S.prop(_S.read(_v40, "C"), 4)])])
		_S.invoke(_S.read(_v40, "p"), "px", [_S.read(_v40, "x"), 0, _S.prop(_S.read(_v40, "C"), 3)])
		_S.define(_v40, "dir", _S.invoke(_S.read(_v40, "Math"), "sign", [_S.binary("-", _S.prop(_S.read(_v40, "f"), "lx"), _S.prop(_S.read(_v40, "f"), "x"))]))
		var _v42 = _S.scope(_v40)
		_S.define(_v42, "j", 1)
		while _S.truth(_S.binary("<", _S.read(_v42, "j"), _S.invoke(_S.read(_v42, "Math"), "min", [8, _S.invoke(_S.read(_v42, "Math"), "abs", [_S.binary("-", _S.prop(_S.read(_v42, "f"), "lx"), _S.prop(_S.read(_v42, "f"), "x"))])]))):
			_S.invoke(_S.read(_v42, "p"), "dot", [_S.binary("+", _S.read(_v42, "x"), _S.binary("*", _S.read(_v42, "dir"), _S.read(_v42, "j"))), 0, _S.prop(_S.read(_v42, "C"), 2), _S.binary("-", 0.7, _S.binary("*", _S.read(_v42, "j"), 0.08))])
			_v42 = _S.iteration(_v42)
			_S.write(_v42, "j", 1, "+=", true)
		_S.invoke(_S.read(_v40, "p"), "glow", [_S.read(_v40, "x"), _S.unary("-", 1), 5, _S.prop(_S.read(_v40, "C"), 4), _S.binary("+", _S.binary("*", 0.25, _S.prop(_S.read(_v40, "f"), "k")), 0.1)])
		_v39 = _S.iteration(_v39)
		_S.write(_v39, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_LIFT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SNAP")))):
		var _v43 = _S.scope(_e)
		_S.define(_v43, "bot", _S.binary("-", _S.prop(_S.read(_v43, "P"), "by"), 1))
		_S.define(_v43, "u", _S.binary("/", _S.binary("-", _S.read(_v43, "t"), _S.read(_v43, "T_LIFT")), _S.binary("-", _S.read(_v43, "SNAP"), _S.read(_v43, "T_LIFT"))))
		var _v44 = _S.scope(_v43)
		_S.define(_v44, "y", _S.invoke(_S.read(_v44, "Math"), "floor", [_S.read(_v44, "bot")]))
		while _S.truth(_S.binary("<", _S.read(_v44, "y"), 0)):
			var _v45 = _S.scope(_v44)
			_S.define(_v45, "m", _S.invoke(_S.read(_v45, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v45, "y"), _S.read(_v45, "bot")), _S.unary("-", _S.read(_v45, "bot"))), _S.prop(_S.read(_v45, "Math"), "PI"))]))
			_S.invoke(_S.read(_v45, "p"), "px", [_S.unary("-", 1), _S.read(_v45, "y"), _S.prop(_S.read(_v45, "C"), 4)])
			if _S.truth(_S.binary("<", _S.binary("*", _S.read(_v45, "m"), _S.read(_v45, "u")), 0.45)):
				_S.invoke(_S.read(_v45, "p"), "px", [0, _S.read(_v45, "y"), _S.prop(_S.read(_v45, "C"), 3)])
			_v44 = _S.iteration(_v44)
			_S.write(_v44, "y", 1, "+=", true)
	else:
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SNAP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SNAP"), 0.3)))):
			var _v46 = _S.scope(_e)
			_S.define(_v46, "a2", _S.binary("-", _S.read(_v46, "t"), _S.read(_v46, "SNAP")))
			_S.define(_v46, "ys", _S.binary("-", _S.prop(_S.call_value(_S.read(_v46, "pose"), [_S.read(_v46, "SNAP"), _S.prop(_S.read(_v46, "o"), "hop")]), "by"), 1))
			_S.define(_v46, "f", _S.call_value(_S.read(_v46, "toss"), [_S.unary("-", 1), _S.binary("*", _S.read(_v46, "ys"), 0.45), 0, 0, _S.read(_v46, "a2"), _S.binary("*", _S.read(_v46, "G"), 1.3), _S.unary("-", 2)]))
			if _S.truth(_S.unary("!", _S.prop(_S.read(_v46, "f"), "landed"))):
				_S.last([_S.invoke(_S.read(_v46, "p"), "px", [_S.unary("-", 1), _S.prop(_S.read(_v46, "f"), "y"), _S.prop(_S.read(_v46, "C"), 5)]), _S.invoke(_S.read(_v46, "p"), "px", [_S.unary("-", 1), _S.binary("-", _S.prop(_S.read(_v46, "f"), "y"), 1), _S.prop(_S.read(_v46, "C"), 3)])])
			_S.define(_v46, "nub", _S.binary("*", 3, _S.binary("-", 1, _S.binary("/", _S.read(_v46, "a2"), 0.12))))
			var _v47 = _S.scope(_v46)
			_S.define(_v47, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v47, "j"), _S.read(_v47, "nub"))):
				_S.invoke(_S.read(_v47, "p"), "px", [_S.unary("-", 1), _S.binary("+", _S.prop(_S.read(_v47, "P"), "by"), _S.read(_v47, "j")), (_S.prop(_S.read(_v47, "C"), 3) if _S.truth(_S.binary("===", _S.read(_v47, "j"), 0)) else _S.prop(_S.read(_v47, "C"), 4))])
				_v47 = _S.iteration(_v47)
				_S.write(_v47, "j", 1, "+=", true)
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.45, 0.75])

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ag", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.85), 0.85]), _S.read(_e, "R")))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "ag"), _S.read(_e, "L")))
	_S.define(_e, "rb", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [1.4, 2.6]), _S.binary("+", 0.3, _S.binary("*", 0.7, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 1.25)])])))))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("+", _S.binary("/", _S.prop(_S.read(_e, "P"), "W"), 2), 1)), func(): return _S.binary("<", _S.prop(_S.read(_e, "P"), "q"), 0))):
		return null
	_S.define(_e, "sy", _S.binary("-", _S.unary("-", 1), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("**", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "R")), 2))])]), _S.read(_e, "hp"))])))
	if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.85)):
		var _v31 = _S.scope(_e)
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "y", _S.invoke(_S.read(_v32, "Math"), "floor", [_S.binary("-", _S.read(_v32, "sy"), _S.read(_v32, "rb"))]))
		while _S.truth(_S.binary("<=", _S.read(_v32, "y"), _S.read(_v32, "sy"))):
			var _v33 = _S.scope(_v32)
			_S.define(_v33, "xx", _S.invoke(_S.read(_v33, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_v33, "x"), _S.read(_v33, "rb")), 1)]))
			while _S.truth(_S.binary("<=", _S.read(_v33, "xx"), _S.invoke(_S.read(_v33, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.read(_v33, "x"), _S.read(_v33, "rb")), 1)]))):
				var _v34 = _S.scope(_v33)
				_S.define(_v34, "dx", _S.binary("-", _S.binary("+", _S.read(_v34, "xx"), 0.5), _S.read(_v34, "x")))
				_S.define(_v34, "dy", _S.binary("-", _S.binary("+", _S.read(_v34, "y"), 0.5), _S.read(_v34, "sy")))
				_S.define(_v34, "dd", _S.invoke(_S.read(_v34, "Math"), "hypot", [_S.read(_v34, "dx"), _S.read(_v34, "dy")]))
				if _S.truth(_S.binary(">", _S.read(_v34, "dd"), _S.binary("+", _S.read(_v34, "rb"), 0.5))):
					_v33 = _S.iteration(_v33)
					_S.write(_v33, "xx", 1, "+=", true)
					continue
				if _S.truth(_S.binary(">", _S.read(_v34, "dd"), _S.binary("-", _S.read(_v34, "rb"), 0.7))):
					_S.invoke(_S.read(_v34, "p"), "px", [_S.read(_v34, "xx"), _S.read(_v34, "y"), (_S.prop(_S.read(_v34, "C"), 6) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v34, "dx"), 0), func(): return _S.binary("<", _S.read(_v34, "dy"), _S.binary("*", _S.unary("-", _S.read(_v34, "rb")), 0.3)))) else _S.prop(_S.read(_v34, "C"), 4))])
				else:
					_S.invoke(_S.read(_v34, "p"), "blend", [_S.read(_v34, "xx"), _S.read(_v34, "y"), _S.prop(_S.read(_v34, "C"), 5), 0.3])
				_v33 = _S.iteration(_v33)
				_S.write(_v33, "xx", 1, "+=", true)
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "y", 1, "+=", true)
		_S.invoke(_S.read(_v31, "p"), "glow", [_S.read(_v31, "x"), _S.binary("-", _S.read(_v31, "sy"), _S.binary("*", _S.read(_v31, "rb"), 0.5)), _S.binary("+", _S.binary("*", _S.read(_v31, "rb"), 2), 3), _S.prop(_S.read(_v31, "C"), 5), 0.2])
	else:
		var _v35 = _S.scope(_e)
		_S.define(_v35, "q", _S.binary("/", _S.binary("-", _S.read(_v35, "k"), 0.85), 0.15))
		for _v36 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0.6, _S.unary("-", 0.7)], [_S.unary("-", 0.6), _S.unary("-", 0.7)], [0, _S.unary("-", 1)]]):
			var _v37 = _S.scope(_v35)
			var _v38 = _v36
			_S.define(_v37, "dx", _S.prop(_v38, 0))
			_S.define(_v37, "dy", _S.prop(_v38, 1))
			_S.invoke(_S.read(_v37, "p"), "dot", [_S.binary("+", _S.read(_v37, "x"), _S.binary("*", _S.read(_v37, "dx"), _S.binary("+", 2, _S.binary("*", 3, _S.read(_v37, "q"))))), _S.binary("+", _S.read(_v37, "sy"), _S.binary("*", _S.read(_v37, "dy"), _S.binary("+", 2, _S.binary("*", 3, _S.read(_v37, "q"))))), _S.prop(_S.read(_v37, "C"), 6), _S.binary("-", 1.2, _S.read(_v37, "q"))])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "P", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "P"), "by"), 1), _S.read(_e, "y")), _S.prop(_S.read(_e, "P"), "H")))
	_S.define(_e, "hw", _S.call_value(_S.read(_e, "halfW"), [_S.read(_e, "v"), _S.read(_e, "P")]))
	return _S.logical("&&", _S.binary(">=", _S.read(_e, "hw"), 0), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "P"), "lean"), _S.read(_e, "v")), _S.prop(_S.read(_e, "P"), "H")))]), _S.read(_e, "hw")))
