@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/flying-skull.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "Swarm", _S.import_value("fx/critters/_lib.js", "Swarm"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "lnoise", _S.import_value("fx/critters/_lib.js", "lnoise"))
	_S.define(_e, "tongue", _S.import_value("fx/critters/_lib.js", "tongue"))
	_S.define(_e, "firePuff", _S.import_value("fx/critters/_lib.js", "firePuff"))
	_S.define(_e, "shadow", _S.import_value("fx/critters/_lib.js", "shadow"))
	_S.define(_e, "bounce", _S.import_value("fx/critters/_lib.js", "bounce"))
	_S.define(_e, "at", _S.function_value(_e, "_f0"))
	_S.define(_e, "jaw", _S.function_value(_e, "_f1"))
	_S.define(_e, "skull", _S.function_value(_e, "_f2"))
	_S.define(_e, "inJaw", _S.function_value(_e, "_f8"))
	_S.define(_e, "crown", _S.function_value(_e, "_f9"))
	_S.define(_e, "height", _S.function_value(_e, "_f10"))
	_S.define(_e, "draw", _S.function_value(_e, "_f11"))
	_S.define(_e, "particles", _S.function_value(_e, "_f14"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f24"))
	_S.define(_e, "meta", _S.merge([{"name": "Flying skull"}, {"desc": "A cracked bone skull bobs in the air, jaw chattering, eyes burning, a fire roaring off its crown that sheds flame puffs, embers and smoke and throws warm light."}, {"tags": ["critter", "skull", "undead", "fire", "flying", "monster", "loop"]}, {"size": [96, 132]}, {"origin": [48, 120]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"bone": ["#1a1114", "#3e2b2a", "#6b5144", "#9e8467", "#cdb892", "#efe2bf", "#fffaea"]}, {"hover": 40}, {"floor": true}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 14), _S.unary("-", 20), 28, 40]))
	_S.define(_e, "SOCKET", _S.call_value(_S.read(_e, "hex"), ["#120a0c"]))
	_S.define(_e, "SWARM", _S.construct(_S.read(_e, "Swarm"), []))
	_S.define(_e, "burst", _S.function_value(_e, "_f25"))
	_S.define(_e, "flick", _S.function_value(_e, "_f26"))
	_S.define(_e, "inCranium", _S.function_value(_e, "_f27"))
	_S.define(_e, "inFace", _S.function_value(_e, "_f28"))
	_S.define(_e, "inSkull", _S.function_value(_e, "_f29"))
	_S.define(_e, "browY", _S.function_value(_e, "_f30"))
	_S.define(_e, "inSocket", _S.function_value(_e, "_f31"))
	_S.define(_e, "NOSE", [[_S.unary("-", 1), 1], [0, 1], [_S.unary("-", 2), 2], [_S.unary("-", 1), 2], [0, 2], [1, 2], [_S.unary("-", 2), 3], [1, 3]])
	_S.define(_e, "CRACK", [[4, _S.unary("-", 16)], [4, _S.unary("-", 15)], [5, _S.unary("-", 14)], [5, _S.unary("-", 13)], [4, _S.unary("-", 12)], [5, _S.unary("-", 11)], [6, _S.unary("-", 10)], [6, _S.unary("-", 9)]])
	_S.define(_e, "topY", _S.function_value(_e, "_f32"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "hover", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")))
	return _S.merge([{"x": _S.binary("*", 3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))}, {"y": _S.binary("+", _S.unary("-", _S.read(_e, "hover")), _S.binary("*", 3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", 2, _S.read(_e, "a")), 0.5)])))}, {"vx": _S.binary("/", _S.binary("*", _S.binary("*", 3, _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")])), _S.read(_e, "D"))}, {"vy": _S.binary("/", _S.binary("*", _S.binary("*", 6, _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("*", 2, _S.read(_e, "a")), 0.5)])), _S.read(_e, "D"))}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "ch", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 22)])]))
	_S.define(_e, "b1", _S.call_value(_S.read(_e, "burst"), [_S.read(_e, "t"), 0.15, 0.75]))
	_S.define(_e, "b2", _S.call_value(_S.read(_e, "burst"), [_S.read(_e, "t"), 1.3, 1.95]))
	_S.define(_e, "gape", _S.call_value(_S.read(_e, "burst"), [_S.read(_e, "t"), 1.95, 2.3]))
	return _S.invoke(_S.read(_e, "Math"), "round", [_S.invoke(_S.read(_e, "Math"), "max", [_S.binary("*", _S.binary("*", _S.read(_e, "ch"), 2.4), _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "b1"), _S.read(_e, "b2")])), _S.binary("*", _S.read(_e, "gape"), 3.4)])])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "B", _S.arg(_args, 1))
	_S.define(_e, "F", _S.arg(_args, 2))
	_S.define(_e, "open", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "warm", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "B"), 6), _S.prop(_S.read(_e, "F"), 6), 0.45]))
	_S.define(_e, "rim", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "B"), 5), _S.prop(_S.read(_e, "F"), 5), 0.3]))
	_S.define(_e, "lx", _S.unary("-", 4))
	_S.define(_e, "ly", _S.unary("-", 15))
	_S.define(_e, "lit", _S.function_value(_e, "_f3"))
	_S.invoke(_S.read(_e, "g"), "clear", [])
	_S.invoke(_S.read(_e, "g"), "shade", [_S.unary("-", 12), _S.unary("-", 17), 12, 8, _S.function_value(_e, "_f4")])
	_S.invoke(_S.read(_e, "g"), "shade", [_S.unary("-", 9), _S.unary("-", 7), 9, 1, _S.function_value(_e, "_f5")])
	for _v1 in _S.array(_S.read(_e, "NOSE")):
		var _v2 = _S.scope(_e)
		var _v3 = _v1
		_S.define(_v2, "x", _S.prop(_v3, 0))
		_S.define(_v2, "y", _S.prop(_v3, 1))
		_S.invoke(_S.read(_v2, "g"), "set", [_S.read(_v2, "x"), _S.read(_v2, "y"), (_S.prop(_S.read(_v2, "B"), 1) if _S.truth(_S.binary("===", _S.read(_v2, "y"), 3)) else _S.read(_v2, "SOCKET"))])
	_S.invoke(_S.read(_e, "g"), "set", [_S.unary("-", 1), 3, _S.prop(_S.read(_e, "B"), 2)])
	_S.invoke(_S.read(_e, "g"), "set", [0, 3, _S.prop(_S.read(_e, "B"), 2)])
	for _v4 in _S.array(_S.read(_e, "CRACK")):
		var _v5 = _S.scope(_e)
		var _v6 = _v4
		_S.define(_v5, "x", _S.prop(_v6, 0))
		_S.define(_v5, "y", _S.prop(_v6, 1))
		_S.last([_S.invoke(_S.read(_v5, "g"), "set", [_S.read(_v5, "x"), _S.read(_v5, "y"), _S.prop(_S.read(_v5, "B"), 1)]), _S.invoke(_S.read(_v5, "g"), "set", [_S.binary("-", _S.read(_v5, "x"), 1), _S.read(_v5, "y"), _S.prop(_S.read(_v5, "B"), 5)])])
	_S.invoke(_S.read(_e, "g"), "set", [7, _S.unary("-", 7), _S.prop(_S.read(_e, "B"), 1)])
	_S.invoke(_S.read(_e, "g"), "set", [8, _S.unary("-", 6), _S.prop(_S.read(_e, "B"), 1)])
	_S.define(_e, "jy", _S.binary("+", 8, _S.read(_e, "open")))
	_S.invoke(_S.read(_e, "g"), "shade", [_S.unary("-", 8), 4, 8, _S.binary("+", _S.read(_e, "jy"), 6), _S.function_value(_e, "_f6")])
	if _S.truth(_S.binary(">", _S.read(_e, "open"), 0)):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "y", 8)
		while _S.truth(_S.binary("<", _S.read(_v8, "y"), _S.read(_v8, "jy"))):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "x", _S.unary("-", 6))
			while _S.truth(_S.binary("<=", _S.read(_v9, "x"), 5)):
				_S.invoke(_S.read(_v9, "g"), "set", [_S.read(_v9, "x"), _S.read(_v9, "y"), (_S.call_value(_S.read(_v9, "mix"), [_S.read(_v9, "SOCKET"), _S.prop(_S.read(_v9, "F"), 3), 0.5]) if _S.truth(_S.binary("===", _S.read(_v9, "y"), _S.binary("-", _S.read(_v9, "jy"), 1))) else _S.read(_v9, "SOCKET"))])
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "x", 1, "+=", true)
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "y", 1, "+=", true)
	_S.invoke(_S.read(_e, "g"), "outline", [_S.function_value(_e, "_f7")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "k", _S.arg(_args, 2))
	return _S.call_value(_S.read(_e, "inSkull"), [_S.binary("+", _S.read(_e, "lx"), _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "lx")), _S.read(_e, "k"))), _S.binary("+", _S.read(_e, "ly"), _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ly")), _S.read(_e, "k")))])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "inSkull"), [_S.read(_e, "x"), _S.read(_e, "y")]))):
		return 0
	_S.define(_e, "c", (_S.prop(_S.read(_e, "B"), 5) if _S.truth(_S.call_value(_S.read(_e, "lit"), [_S.read(_e, "x"), _S.read(_e, "y"), 0.45])) else (_S.prop(_S.read(_e, "B"), 4) if _S.truth(_S.call_value(_S.read(_e, "lit"), [_S.read(_e, "x"), _S.read(_e, "y"), 0.74])) else _S.prop(_S.read(_e, "B"), 3))))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 8.2), func(): return _S.binary(">", _S.read(_e, "y"), _S.unary("-", 7))), func(): return _S.binary("<", _S.read(_e, "y"), _S.unary("-", 1)))):
		_S.write(_e, "c", (_S.prop(_S.read(_e, "B"), 3) if _S.truth(_S.binary("<", _S.read(_e, "x"), 0)) else _S.prop(_S.read(_e, "B"), 2)), "=", false)
	if _S.truth(_S.logical("||", _S.unary("!", _S.call_value(_S.read(_e, "inSkull"), [_S.binary("+", _S.read(_e, "x"), 2), _S.binary("+", _S.read(_e, "y"), 2.2)])), func(): return _S.logical("&&", _S.binary(">", _S.read(_e, "x"), 0), func(): return _S.unary("!", _S.call_value(_S.read(_e, "inSkull"), [_S.binary("+", _S.read(_e, "x"), 2.6), _S.read(_e, "y")]))))):
		_S.write(_e, "c", _S.prop(_S.read(_e, "B"), 2), "=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.call_value(_S.read(_e, "inSkull"), [_S.binary("+", _S.read(_e, "x"), 1), _S.binary("+", _S.read(_e, "y"), 1.2)])), func(): return _S.binary(">", _S.read(_e, "y"), 2))):
		_S.write(_e, "c", _S.prop(_S.read(_e, "B"), 1), "=", false)
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "inSkull"), [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 1.5)]))):
		_S.write(_e, "c", (_S.read(_e, "warm") if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 7)) else _S.read(_e, "rim")), "=", false)
	else:
		if _S.truth(_S.logical("&&", _S.unary("!", _S.call_value(_S.read(_e, "inSkull"), [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 2.5)])), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 6))):
			_S.write(_e, "c", _S.read(_e, "rim"), "=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "y"), _S.binary("-", _S.call_value(_S.read(_e, "browY"), [_S.read(_e, "x")]), 1.2)), func(): return _S.binary("<", _S.read(_e, "y"), _S.binary("+", _S.call_value(_S.read(_e, "browY"), [_S.read(_e, "x")]), 0.4))), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 1.6)), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 8.6))):
		_S.write(_e, "c", (_S.prop(_S.read(_e, "B"), 4) if _S.truth(_S.binary("<", _S.read(_e, "x"), 0)) else _S.prop(_S.read(_e, "B"), 3)), "=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 6.2), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 9.2)), func(): return _S.binary(">", _S.read(_e, "y"), 0)), func(): return _S.binary("<", _S.read(_e, "y"), 2))):
		_S.write(_e, "c", (_S.prop(_S.read(_e, "B"), 5) if _S.truth(_S.binary("<", _S.read(_e, "x"), 0)) else _S.prop(_S.read(_e, "B"), 3)), "=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "y"), 6)):
		var _v0 = _S.scope(_e)
		if _S.truth(_S.binary(">", _S.invoke(_S.read(_v0, "Math"), "abs", [_S.read(_v0, "x")]), 6.4)):
			return 0
		_S.define(_v0, "cx", _S.invoke(_S.read(_v0, "Math"), "floor", [_S.read(_v0, "x")]))
		_S.define(_v0, "gap", _S.logical("||", _S.logical("||", _S.logical("||", _S.binary("===", _S.read(_v0, "cx"), _S.unary("-", 6)), func(): return _S.binary("===", _S.read(_v0, "cx"), _S.unary("-", 3))), func(): return _S.binary("===", _S.read(_v0, "cx"), 2)), func(): return _S.binary("===", _S.read(_v0, "cx"), 5)))
		_S.write(_v0, "c", (_S.prop(_S.read(_v0, "B"), 1) if _S.truth(_S.read(_v0, "gap")) else ((_S.prop(_S.read(_v0, "B"), 5) if _S.truth(_S.binary("<", _S.read(_v0, "x"), 0)) else _S.prop(_S.read(_v0, "B"), 4)) if _S.truth(_S.binary("<", _S.read(_v0, "y"), 7)) else (_S.prop(_S.read(_v0, "B"), 3) if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v0, "cx"), _S.unary("-", 1)), func(): return _S.binary("===", _S.read(_v0, "cx"), 0))) else _S.prop(_S.read(_v0, "B"), 4)))), "=", false)
	return _S.read(_e, "c")

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "inSocket"), [_S.read(_e, "x"), _S.read(_e, "y")]))):
		return 0
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "inSocket"), [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1.3)]))):
		return _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "B"), 2), _S.prop(_S.read(_e, "F"), 4), 0.55])
	return _S.read(_e, "SOCKET")

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "ax", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "ax"), 6.6), func(): return _S.binary("<", _S.read(_e, "ax"), 8.1)), func(): return _S.binary(">", _S.read(_e, "y"), 4)), func(): return _S.binary("<", _S.read(_e, "y"), _S.binary("+", _S.read(_e, "jy"), 2)))):
		return (_S.prop(_S.read(_e, "B"), 3) if _S.truth(_S.binary("<", _S.read(_e, "x"), 0)) else _S.prop(_S.read(_e, "B"), 2))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "y"), _S.read(_e, "jy")), func(): return _S.binary(">", _S.read(_e, "y"), _S.binary("+", _S.read(_e, "jy"), 5.5)))):
		return 0
	_S.define(_e, "v", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "jy")))
	_S.define(_e, "hw", _S.binary("-", _S.binary("-", 7.4, _S.binary("*", _S.read(_e, "v"), 0.45)), (_S.binary("*", _S.binary("-", _S.read(_e, "v"), 4), 1.2) if _S.truth(_S.binary(">", _S.read(_e, "v"), 4)) else 0)))
	if _S.truth(_S.binary(">", _S.read(_e, "ax"), _S.read(_e, "hw"))):
		return 0
	if _S.truth(_S.binary("<", _S.read(_e, "v"), 1.5)):
		var _v7 = _S.scope(_e)
		if _S.truth(_S.binary(">", _S.read(_v7, "ax"), 6)):
			return (_S.prop(_S.read(_v7, "B"), 4) if _S.truth(_S.binary("<", _S.read(_v7, "x"), 0)) else _S.prop(_S.read(_v7, "B"), 3))
		_S.define(_v7, "cx", _S.invoke(_S.read(_v7, "Math"), "floor", [_S.read(_v7, "x")]))
		_S.define(_v7, "gap", _S.logical("||", _S.logical("||", _S.logical("||", _S.binary("===", _S.read(_v7, "cx"), _S.unary("-", 5)), func(): return _S.binary("===", _S.read(_v7, "cx"), _S.unary("-", 2))), func(): return _S.binary("===", _S.read(_v7, "cx"), 1)), func(): return _S.binary("===", _S.read(_v7, "cx"), 4)))
		return (_S.prop(_S.read(_v7, "B"), 1) if _S.truth(_S.read(_v7, "gap")) else (_S.prop(_S.read(_v7, "B"), 5) if _S.truth(_S.binary("<", _S.read(_v7, "v"), 1)) else _S.prop(_S.read(_v7, "B"), 4)))
	return (_S.prop(_S.read(_e, "B"), 1) if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "inJaw"), [_S.binary("+", _S.read(_e, "x"), 1.6), _S.binary("+", _S.read(_e, "y"), 1.6), _S.read(_e, "jy")]))) else ((_S.prop(_S.read(_e, "B"), 4) if _S.truth(_S.binary("<", _S.read(_e, "x"), 0)) else _S.prop(_S.read(_e, "B"), 3)) if _S.truth(_S.binary("<", _S.read(_e, "v"), 2.5)) else _S.prop(_S.read(_e, "B"), 3)))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "nx", _S.arg(_args, 2))
	_S.define(_e, "ny", _S.arg(_args, 3))
	return (_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "B"), 0), _S.prop(_S.read(_e, "F"), 1), 0.75]) if _S.truth(_S.binary("<", _S.read(_e, "ny"), 0)) else _S.prop(_S.read(_e, "B"), 0))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "jy", _S.arg(_args, 2))
	_S.define(_e, "v", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "jy")))
	_S.define(_e, "hw", _S.binary("-", _S.binary("-", 7.4, _S.binary("*", _S.read(_e, "v"), 0.45)), (_S.binary("*", _S.binary("-", _S.read(_e, "v"), 4), 1.2) if _S.truth(_S.binary(">", _S.read(_e, "v"), 4)) else 0)))
	return _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "v"), 0), func(): return _S.binary("<=", _S.read(_e, "v"), 5.5)), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.read(_e, "hw")))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "seed", _S.arg(_args, 0))
	_S.define(_e, "out", [])
	var _v10 = _S.scope(_e)
	_S.define(_v10, "x", _S.unary("-", 10))
	while _S.truth(_S.binary("<=", _S.read(_v10, "x"), 10)):
		_S.invoke(_S.read(_v10, "out"), "push", [_S.merge([{"x": _S.read(_v10, "x")}, {"h": _S.binary("+", 13, _S.binary("*", 13, _S.binary("-", 1, _S.binary("**", _S.binary("/", _S.read(_v10, "x"), 11), 2))))}, {"w": _S.binary("+", 2.3, _S.binary("*", _S.call_value(_S.read(_v10, "rand"), [_S.binary("+", _S.read(_v10, "x"), 20), _S.read(_v10, "seed"), 3]), 0.8))}, {"n": _S.binary("+", _S.binary("+", 37, _S.binary("*", _S.read(_v10, "x"), 3)), _S.binary("*", _S.read(_v10, "seed"), 11))}, {"front": false}])])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "x", 2, "+=", false)
	for _v11 in _S.array([_S.unary("-", 1), 1]):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "s", _v11)
		_S.invoke(_S.read(_v12, "out"), "push", [_S.merge([{"x": _S.binary("*", _S.read(_v12, "s"), 11)}, {"y": _S.unary("-", 5)}, {"h": 10}, {"w": 1.8}, {"n": _S.binary("+", _S.binary("+", 61, _S.binary("*", _S.read(_v12, "s"), 13)), _S.binary("*", _S.read(_v12, "seed"), 5))}, {"front": false}])])
	var _v13 = _S.scope(_e)
	_S.define(_v13, "x", _S.unary("-", 5))
	while _S.truth(_S.binary("<=", _S.read(_v13, "x"), 5)):
		_S.invoke(_S.read(_v13, "out"), "push", [_S.merge([{"x": _S.read(_v13, "x")}, {"h": _S.binary("+", 5, _S.binary("*", 3, _S.call_value(_S.read(_v13, "rand"), [_S.binary("+", _S.binary("*", _S.read(_v13, "x"), 4), 20), _S.read(_v13, "seed"), 5])))}, {"w": 1.6}, {"n": _S.binary("+", _S.binary("+", 91, _S.binary("*", _S.read(_v13, "x"), 5)), _S.binary("*", _S.read(_v13, "seed"), 7))}, {"front": true}])])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "x", 2.5, "+=", false)
	return _S.read(_e, "out")

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "f", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "k", _S.arg(_args, 2))
	_S.define(_e, "leap", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.call_value(_S.read(_e, "lnoise"), [_S.read(_e, "t"), _S.read(_e, "D"), 6, _S.binary("*", _S.prop(_S.read(_e, "f"), "n"), 3.1), 70]), 0.55)]), 1.6))
	return _S.binary("*", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "f"), "h"), _S.binary("*", _S.binary("*", 0.25, _S.prop(_S.read(_e, "f"), "h")), _S.call_value(_S.read(_e, "lnoise"), [_S.read(_e, "t"), _S.read(_e, "D"), 8, _S.binary("*", _S.prop(_S.read(_e, "f"), "n"), 1.7), 5]))), _S.binary("*", _S.prop(_S.read(_e, "f"), "h"), _S.read(_e, "leap"))), _S.binary("+", 0.9, _S.binary("*", 0.1, _S.read(_e, "k"))))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "heat", _S.invoke(_S.concat([_S.array(_S.read(_e, "F"))]), "reverse", []))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "bone"), 7]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "flick"), [_S.read(_e, "t")]))
	_S.define(_e, "lean", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "S"), "vx")), 60), _S.unary("-", 0.8), 0.8]))
	_S.define(_e, "stretch", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.prop(_S.read(_e, "S"), "vy"), 90), _S.unary("-", 0.3), 0.45]))
	_S.define(_e, "tongues", _S.invoke(_S.call_value(_S.read(_e, "crown"), [_S.prop(_S.read(_e, "o"), "seed")]), "sort", [_S.function_value(_e, "_f12")]))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "S"), "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "S"), "y")]))
	_S.define(_e, "lick", _S.function_value(_e, "_f13"))
	var _v14 = _S.scope(_e)
	_S.define(_v14, "li", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "li"), 4)):
		for _v15 in _S.array(_S.read(_v14, "tongues")):
			var _v16 = _S.scope(_v14)
			_S.define(_v16, "f", _v15)
			if _S.truth(_S.unary("!", _S.prop(_S.read(_v16, "f"), "front"))):
				_S.call_value(_S.read(_v16, "tongue"), [_S.read(_v16, "p"), _S.binary("+", _S.read(_v16, "X"), _S.prop(_S.read(_v16, "f"), "x")), _S.binary("+", _S.read(_v16, "Y"), _S.logical("??", _S.prop(_S.read(_v16, "f"), "y"), func(): return _S.binary("+", _S.call_value(_S.read(_v16, "topY"), [_S.prop(_S.read(_v16, "f"), "x")]), 3))), _S.binary("*", _S.call_value(_S.read(_v16, "height"), [_S.read(_v16, "f"), _S.read(_v16, "t"), _S.read(_v16, "k")]), _S.binary("+", 1, _S.read(_v16, "stretch"))), _S.binary("*", _S.prop(_S.read(_v16, "f"), "w"), _S.binary("-", 1, _S.binary("*", 0.25, _S.invoke(_S.read(_v16, "Math"), "abs", [_S.read(_v16, "lean")])))), _S.call_value(_S.read(_v16, "lick"), [_S.read(_v16, "f")]), _S.read(_v16, "t"), _S.read(_v16, "D"), _S.prop(_S.read(_v16, "f"), "n"), _S.read(_v16, "heat"), _S.read(_v16, "li")])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "li", 1, "+=", true)
	_S.call_value(_S.read(_e, "particles"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "o"), _S.read(_e, "heat"), _S.read(_e, "F"), true])
	_S.define(_e, "g", _S.read(_e, "GRID"))
	_S.call_value(_S.read(_e, "skull"), [_S.read(_e, "g"), _S.read(_e, "B"), _S.read(_e, "F"), _S.call_value(_S.read(_e, "jaw"), [_S.read(_e, "t")]), _S.read(_e, "t")])
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p"), 1, _S.read(_e, "X"), _S.read(_e, "Y")])
	for _v17 in _S.array([_S.unary("-", 1), 1]):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "s", _v17)
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "ex", _S.binary("-", _S.binary("+", _S.read(_v19, "X"), _S.binary("*", _S.read(_v19, "s"), 5.1)), 0.5))
		_S.define(_v19, "ey", _S.binary("-", _S.read(_v19, "Y"), 2.4))
		_S.define(_v19, "fl", _S.binary("+", 0.75, _S.binary("*", 0.25, _S.call_value(_S.read(_v19, "lnoise"), [_S.read(_v19, "t"), _S.read(_v19, "D"), 30, _S.binary("*", _S.read(_v19, "s"), 9), 12]))))
		_S.invoke(_S.read(_v19, "p"), "px", [_S.read(_v19, "ex"), _S.read(_v19, "ey"), _S.prop(_S.read(_v19, "heat"), 0)])
		_S.invoke(_S.read(_v19, "p"), "px", [_S.binary("+", _S.read(_v19, "ex"), 1), _S.read(_v19, "ey"), _S.prop(_S.read(_v19, "heat"), 1)])
		_S.invoke(_S.read(_v19, "p"), "px", [_S.read(_v19, "ex"), _S.binary("+", _S.read(_v19, "ey"), 1), _S.prop(_S.read(_v19, "heat"), 2)])
		_S.invoke(_S.read(_v19, "p"), "px", [_S.binary("+", _S.read(_v19, "ex"), 1), _S.binary("+", _S.read(_v19, "ey"), 1), _S.prop(_S.read(_v19, "heat"), 3)])
		if _S.truth(_S.binary(">", _S.read(_v19, "fl"), 0.8)):
			_S.last([_S.invoke(_S.read(_v19, "p"), "px", [_S.read(_v19, "ex"), _S.binary("-", _S.read(_v19, "ey"), 1), _S.prop(_S.read(_v19, "heat"), 3)]), _S.invoke(_S.read(_v19, "p"), "px", [_S.binary("+", _S.read(_v19, "ex"), 1), _S.binary("-", _S.read(_v19, "ey"), 1), _S.prop(_S.read(_v19, "heat"), 5)])])
		_S.invoke(_S.read(_v19, "p"), "glow", [_S.binary("+", _S.read(_v19, "ex"), 1), _S.binary("+", _S.read(_v19, "ey"), 1), 6, _S.prop(_S.read(_v19, "F"), 5), _S.binary("*", 0.45, _S.read(_v19, "fl"))])
		_S.invoke(_S.read(_v19, "p"), "glow", [_S.binary("+", _S.read(_v19, "ex"), 1), _S.binary("+", _S.read(_v19, "ey"), 0.5), 3, _S.prop(_S.read(_v19, "F"), 7), _S.binary("*", 0.5, _S.read(_v19, "fl"))])
	_S.define(_e, "open", _S.call_value(_S.read(_e, "jaw"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary(">", _S.read(_e, "open"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "X"), _S.binary("+", _S.binary("+", _S.read(_e, "Y"), 8), _S.binary("*", _S.read(_e, "open"), 0.5)), _S.binary("+", 4, _S.binary("*", _S.read(_e, "open"), 2)), _S.prop(_S.read(_e, "F"), 5), _S.binary("*", 0.25, _S.read(_e, "open"))])
	var _v20 = _S.scope(_e)
	_S.define(_v20, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v20, "i"), 9)):
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "r", _S.call_value(_S.read(_v21, "rng"), [_S.prop(_S.read(_v21, "o"), "seed"), _S.read(_v21, "i"), 21]))
		_S.define(_v21, "born", _S.binary("+", 1.98, _S.binary("*", _S.read(_v21, "i"), 0.03)))
		_S.define(_v21, "age", _S.call_value(_S.read(_v21, "wrap"), [_S.binary("-", _S.read(_v21, "t"), _S.read(_v21, "born")), _S.read(_v21, "D")]))
		_S.define(_v21, "L", _S.invoke(_S.read(_v21, "r"), "range", [0.25, 0.45]))
		if _S.truth(_S.binary(">=", _S.read(_v21, "age"), _S.read(_v21, "L"))):
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
			continue
		_S.define(_v21, "S0", _S.call_value(_S.read(_v21, "at"), [_S.read(_v21, "born"), _S.prop(_S.read(_v21, "o"), "hover")]))
		var _v22 = _S.call_value(_S.read(_v21, "fly"), [_S.binary("+", _S.prop(_S.read(_v21, "S0"), "x"), _S.invoke(_S.read(_v21, "r"), "range", [_S.unary("-", 3), 3])), _S.binary("+", _S.prop(_S.read(_v21, "S0"), "y"), 11), _S.invoke(_S.read(_v21, "r"), "range", [_S.unary("-", 22), 22]), _S.invoke(_S.read(_v21, "r"), "range", [40, 75]), _S.read(_v21, "age"), _S.unary("-", 70), 3.5])
		_S.define(_v21, "x", _S.prop(_v22, 0))
		_S.define(_v21, "y", _S.prop(_v22, 1))
		_S.call_value(_S.read(_v21, "firePuff"), [_S.read(_v21, "p"), _S.read(_v21, "x"), _S.read(_v21, "y"), _S.binary("-", 1, _S.binary("/", _S.read(_v21, "age"), _S.read(_v21, "L"))), _S.invoke(_S.read(_v21, "r"), "range", [1.1, 2]), _S.binary("*", _S.invoke(_S.read(_v21, "r"), "next", []), 100), _S.read(_v21, "heat")])
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "i", 1, "+=", true)
	var _v23 = _S.scope(_e)
	_S.define(_v23, "li", 0)
	while _S.truth(_S.binary("<", _S.read(_v23, "li"), 4)):
		for _v24 in _S.array(_S.read(_v23, "tongues")):
			var _v25 = _S.scope(_v23)
			_S.define(_v25, "f", _v24)
			if _S.truth(_S.prop(_S.read(_v25, "f"), "front")):
				_S.call_value(_S.read(_v25, "tongue"), [_S.read(_v25, "p"), _S.binary("+", _S.read(_v25, "X"), _S.prop(_S.read(_v25, "f"), "x")), _S.binary("+", _S.binary("+", _S.read(_v25, "Y"), _S.call_value(_S.read(_v25, "topY"), [_S.prop(_S.read(_v25, "f"), "x")])), 1.5), _S.binary("*", _S.call_value(_S.read(_v25, "height"), [_S.read(_v25, "f"), _S.read(_v25, "t"), _S.read(_v25, "k")]), _S.binary("+", 1, _S.read(_v25, "stretch"))), _S.prop(_S.read(_v25, "f"), "w"), _S.binary("*", _S.call_value(_S.read(_v25, "lick"), [_S.read(_v25, "f")]), 0.6), _S.read(_v25, "t"), _S.read(_v25, "D"), _S.prop(_S.read(_v25, "f"), "n"), _S.read(_v25, "heat"), _S.read(_v25, "li")])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "li", 1, "+=", true)
	_S.call_value(_S.read(_e, "particles"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "o"), _S.read(_e, "heat"), _S.read(_e, "F"), false])
	_S.define(_e, "br", _S.binary("+", 0.92, _S.binary("*", 0.08, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 2)]))))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.read(_e, "X"), _S.binary("*", _S.read(_e, "lean"), 4)), _S.binary("-", _S.read(_e, "Y"), 20), _S.binary("*", _S.binary("*", 74, _S.read(_e, "br")), _S.binary("+", 0.9, _S.binary("*", 0.1, _S.read(_e, "k")))), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 5), 0.5]), _S.binary("*", 0.48, _S.read(_e, "k"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "X"), _S.binary("-", _S.read(_e, "Y"), 21), 24, _S.prop(_S.read(_e, "F"), 6), _S.binary("*", 0.3, _S.read(_e, "k"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "X"), _S.binary("-", _S.read(_e, "Y"), 15), 9, _S.prop(_S.read(_e, "F"), 8), _S.binary("*", 0.16, _S.read(_e, "k"))])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.invoke(_S.read(_e, "Math"), "abs", [_S.prop(_S.read(_e, "b"), "x")]), _S.invoke(_S.read(_e, "Math"), "abs", [_S.prop(_S.read(_e, "a"), "x")]))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	return _S.binary("-", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "lnoise"), [_S.read(_e, "t"), _S.read(_e, "D"), 5, _S.prop(_S.read(_e, "f"), "n"), 40]), 2), _S.binary("*", _S.binary("*", _S.read(_e, "lean"), _S.call_value(_S.read(_e, "height"), [_S.read(_e, "f"), _S.read(_e, "t"), _S.read(_e, "k")])), 0.9)), _S.call_value(_S.read(_e, "clamp"), [_S.binary("*", _S.prop(_S.read(_e, "f"), "x"), 0.25), _S.unary("-", 2), 2]))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "heat", _S.arg(_args, 3))
	_S.define(_e, "F", _S.arg(_args, 4))
	_S.define(_e, "back", _S.arg(_args, 5))
	_S.define(_e, "sw", _S.invoke(_S.read(_e, "SWARM"), "begin", [_S.read(_e, "t")]))
	_S.set_prop(_S.prop(_S.read(_e, "sw"), "ps"), "sparks", [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 2)], "=", false)
	if _S.truth(_S.read(_e, "back")):
		var _v26 = _S.scope(_e)
		_S.call_value(_S.read(_v26, "cycle"), [_S.read(_v26, "t"), _S.read(_v26, "D"), 15, _S.binary("+", _S.binary("*", _S.prop(_S.read(_v26, "o"), "seed"), 7), 1), _S.function_value(_v26, "_f15"), _S.function_value(_v26, "_f16")])
		_S.invoke(_S.read(_v26, "sw"), "draw", [_S.read(_v26, "p")])
		return null
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 40, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7), 2), _S.function_value(_e, "_f17"), _S.function_value(_e, "_f18")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 18, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7), 3), 0.26, _S.function_value(_e, "_f19")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 24, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7), 4), _S.function_value(_e, "_f20"), _S.function_value(_e, "_f21")])
	if _S.truth(_S.prop(_S.read(_e, "o"), "floor")):
		_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 5, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7), 5), _S.function_value(_e, "_f22"), _S.function_value(_e, "_f23")])
	_S.invoke(_S.read(_e, "sw"), "draw", [_S.read(_e, "p")])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.7, 2.5])

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "S0", _S.call_value(_S.read(_e, "at"), [_S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), _S.read(_e, "D")]), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "x0", _S.binary("+", _S.prop(_S.read(_e, "S0"), "x"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 6), 6])))
	_S.define(_e, "y0", _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "S0"), "y"), 22), _S.invoke(_S.read(_e, "r"), "range", [0, 8])))
	var _v27 = _S.call_value(_S.read(_e, "fly"), [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 5), 5]), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [16, 26])), _S.read(_e, "age"), _S.unary("-", 12), 1.2])
	_S.define(_e, "x", _S.prop(_v27, 0))
	_S.define(_e, "y", _S.prop(_v27, 1))
	_S.invoke(_S.read(_e, "sw"), "add", [_S.prop(_S.read(_e, "P"), "SMOKE"), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 1.3), _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), 6))]), 3), _S.read(_e, "age"))), _S.read(_e, "y"), 0, 0, _S.read(_e, "age"), _S.read(_e, "L"), _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "hex"), ["#5b5566"]), _S.prop(_S.read(_e, "F"), 2), 0.3]), _S.invoke(_S.read(_e, "r"), "range", [2.8, 4.4]), _S.prop(_S.read(_e, "PF"), "BIG")])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.18, 0.36])

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "S0", _S.call_value(_S.read(_e, "at"), [_S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), _S.read(_e, "D")]), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "side", _S.invoke(_S.read(_e, "r"), "chance", [0.3]))
	_S.define(_e, "a", (_S.binary("*", _S.invoke(_S.read(_e, "r"), "sign", []), _S.invoke(_S.read(_e, "r"), "range", [0.9, 1.45])) if _S.truth(_S.read(_e, "side")) else _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.8), 0.8])))
	_S.define(_e, "x0", _S.binary("+", _S.prop(_S.read(_e, "S0"), "x"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 10.5)))
	_S.define(_e, "y0", _S.binary("-", _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "S0"), "y"), 6), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), 10)), (0 if _S.truth(_S.read(_e, "side")) else _S.invoke(_S.read(_e, "r"), "range", [2, 10]))))
	var _v28 = _S.call_value(_S.read(_e, "fly"), [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 6), 6]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 6)), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [18, 34])), _S.read(_e, "age"), _S.unary("-", 95), 3.2])
	_S.define(_e, "x", _S.prop(_v28, 0))
	_S.define(_e, "y", _S.prop(_v28, 1))
	_S.call_value(_S.read(_e, "firePuff"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 17), _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), 6))]), 0.8)), _S.read(_e, "y"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.read(_e, "L"))), _S.invoke(_S.read(_e, "r"), "range", [1, 2.2]), _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), 100), _S.read(_e, "heat")])
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "S0", _S.call_value(_S.read(_e, "at"), [_S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), _S.read(_e, "D")]), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "fx", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 10), 10]))
	_S.define(_e, "x0", _S.binary("+", _S.prop(_S.read(_e, "S0"), "x"), _S.read(_e, "fx")))
	_S.define(_e, "y0", _S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "S0"), "y"), _S.call_value(_S.read(_e, "topY"), [_S.read(_e, "fx")])), _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [4, 16]), _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "fx")]), 14)))))
	_S.define(_e, "kk", _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.read(_e, "L"))))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 3), 3]), _S.read(_e, "age"))))
	_S.define(_e, "y", _S.binary("-", _S.read(_e, "y0"), _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [12, 20]), _S.read(_e, "age"))))
	_S.define(_e, "rr", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0.9, 1.7]), _S.binary("+", 0.4, _S.binary("*", 0.6, _S.read(_e, "kk")))))
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "rr"), 0.6), (_S.prop(_S.read(_e, "heat"), 5) if _S.truth(_S.binary(">", _S.read(_e, "kk"), 0.5)) else _S.prop(_S.read(_e, "heat"), 6))])
	if _S.truth(_S.binary(">", _S.read(_e, "kk"), 0.35)):
		_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 0.3), _S.binary("*", _S.read(_e, "rr"), 0.6), (_S.prop(_S.read(_e, "heat"), 2) if _S.truth(_S.binary(">", _S.read(_e, "kk"), 0.7)) else _S.prop(_S.read(_e, "heat"), 4))])
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1, 2.4])

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "S0", _S.call_value(_S.read(_e, "at"), [_S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), _S.read(_e, "D")]), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "x0", _S.binary("+", _S.prop(_S.read(_e, "S0"), "x"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 11), 11])))
	_S.define(_e, "y0", _S.binary("-", _S.prop(_S.read(_e, "S0"), "y"), _S.invoke(_S.read(_e, "r"), "range", [6, 24])))
	_S.define(_e, "s", _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), 100))
	var _v29 = _S.call_value(_S.read(_e, "fly"), [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 22), 22]), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [25, 70])), _S.read(_e, "age"), _S.unary("-", 20), 1.6])
	_S.define(_e, "x", _S.prop(_v29, 0))
	_S.define(_e, "y", _S.prop(_v29, 1))
	_S.invoke(_S.read(_e, "sw"), "add", [_S.prop(_S.read(_e, "P"), "EMBER"), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2.3), _S.read(_e, "s"))]), 4), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "age")]))), _S.read(_e, "y"), 0, 0, _S.read(_e, "age"), _S.read(_e, "L"), _S.prop(_S.read(_e, "F"), 4), (2 if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.3])) else 1), 0, _S.read(_e, "s")])
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.9, 1.4])

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "S0", _S.call_value(_S.read(_e, "at"), [_S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), _S.read(_e, "D")]), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "bounce"), [_S.binary("+", _S.prop(_S.read(_e, "S0"), "x"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 6), 6])), _S.binary("-", _S.prop(_S.read(_e, "S0"), "y"), _S.invoke(_S.read(_e, "r"), "range", [10, 18])), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 28), 28]), _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [50, 110])), _S.read(_e, "age"), 430, _S.unary("-", 0.5), 0.42]))
	_S.invoke(_S.read(_e, "sw"), "add", [_S.prop(_S.read(_e, "P"), "SPARK"), _S.prop(_S.read(_e, "b"), "x"), _S.prop(_S.read(_e, "b"), "y"), (0.1 if _S.truth(_S.prop(_S.read(_e, "b"), "rest")) else _S.prop(_S.read(_e, "b"), "vx")), (0 if _S.truth(_S.prop(_S.read(_e, "b"), "rest")) else _S.prop(_S.read(_e, "b"), "vy")), _S.read(_e, "age"), _S.read(_e, "L"), 0, 1, 0, _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), 100)])
	return null

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "o"), "floor"))):
		return null
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "flick"), [_S.read(_e, "t")]))
	_S.call_value(_S.read(_e, "shadow"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "S"), "x"), 0, 9, 1.6, _S.call_value(_S.read(_e, "hex"), ["#0d0a12"]), 0.6])
	var _v30 = _S.scope(_e)
	_S.define(_v30, "x", _S.unary("-", 30))
	while _S.truth(_S.binary("<=", _S.read(_v30, "x"), 30)):
		_S.invoke(_S.read(_v30, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_v30, "S"), "x"), _S.read(_v30, "x")), _S.unary("-", 1), 20, _S.call_value(_S.read(_v30, "mix"), [_S.prop(_S.read(_v30, "F"), 4), _S.prop(_S.read(_v30, "F"), 5), 0.5]), _S.binary("*", _S.binary("*", 0.15, _S.read(_v30, "k")), _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v30, "Math"), "abs", [_S.read(_v30, "x")]), 40)))])
		_v30 = _S.iteration(_v30)
		_S.write(_v30, "x", 6, "+=", false)
	return null

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	_S.define(_e, "b", _S.arg(_args, 2))
	return (0 if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "t"), _S.read(_e, "a")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "b")))) else _S.binary("**", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "a")), _S.binary("-", _S.read(_e, "b"), _S.read(_e, "a"))))]), 0.5))

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", 0.74, _S.binary("*", 0.16, _S.call_value(_S.read(_e, "lnoise"), [_S.read(_e, "t"), _S.read(_e, "D"), 18, 0, 1]))), _S.binary("*", 0.1, _S.call_value(_S.read(_e, "lnoise"), [_S.read(_e, "t"), _S.read(_e, "D"), 46, 0, 2])))

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_e, "x"), 11), 2), _S.binary("**", _S.binary("/", _S.binary("+", _S.read(_e, "y"), 6), 10.5), 2)), 1)

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "y"), _S.unary("-", 3)), func(): return _S.binary("<=", _S.read(_e, "y"), 6.5)), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.call_value(_S.read(_e, "lerp"), [10.2, 7.2, _S.binary("/", _S.binary("+", _S.read(_e, "y"), 3), 9.5)])))

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("||", _S.call_value(_S.read(_e, "inCranium"), [_S.read(_e, "x"), _S.read(_e, "y")]), func(): return _S.call_value(_S.read(_e, "inFace"), [_S.read(_e, "x"), _S.read(_e, "y")]))

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("+", _S.unary("-", 6.6), _S.binary("*", _S.binary("-", 8.5, _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")])), 0.3))

static func _f31(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("&&", _S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("/", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 5.1), 3.3), 2), _S.binary("**", _S.binary("/", _S.binary("+", _S.read(_e, "y"), 2.9), 3.3), 2)), 1), func(): return _S.binary(">", _S.read(_e, "y"), _S.call_value(_S.read(_e, "browY"), [_S.read(_e, "x")])))

static func _f32(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("-", _S.unary("-", 6), _S.binary("*", 10.5, _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("**", _S.binary("/", _S.read(_e, "x"), 11), 2))])])))
