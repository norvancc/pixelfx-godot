@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/frozen.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "eyes", _S.import_value("fx/status/_lib.js", "eyes"))
	_S.define(_e, "travel", _S.import_value("fx/status/_lib.js", "travel"))
	_S.define(_e, "plan", _S.function_value(_e, "_f0"))
	_S.define(_e, "frost", _S.function_value(_e, "_f24"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f25"))
	_S.define(_e, "draw", _S.function_value(_e, "_f27"))
	_S.define(_e, "meta", _S.merge([{"name": "Frozen"}, {"desc": "Chilled to the bone: frost ferns creep over the body, icicles hang from chin and hands and drip, breath steams, snow settles, a shiver every second, frost spreads underfoot."}, {"tags": ["status", "ice", "freeze", "frozen", "cold", "chill", "debuff", "loop"]}, {"size": [72, 64]}, {"origin": [36, 54]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "STIFF", _S.merge([{"turn": 0.9}, {"crouch": 1}, {"fx": _S.unary("-", 6)}, {"fy": _S.unary("-", 15)}, {"bx": 7}, {"by": _S.unary("-", 15)}, {"ffx": _S.unary("-", 2)}, {"fbx": 3}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.merge([_S.read(_e, "STIFF"), {"crouch": 2}])], [0.22, _S.read(_e, "STIFF")], [1, _S.read(_e, "STIFF")], [1, _S.merge([_S.read(_e, "STIFF"), {"crouch": 2}]), "snap"], [1.22, _S.read(_e, "STIFF")], [2, _S.merge([_S.read(_e, "STIFF"), {"crouch": 2}])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SHIVER", 1)
	_S.define(_e, "since", _S.function_value(_e, "_f32"))
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f33"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_S.define(_e, "shake", _S.function_value(_e, "_f34"))
	_S.define(_e, "PLANS", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.arg(_args, 1))
	_S.define(_e, "m", _S.invoke(_S.read(_e, "PLANS"), "get", [_S.prop(_S.read(_e, "a"), "mask")]))
	if _S.truth(_S.unary("!", _S.read(_e, "m"))):
		_S.invoke(_S.read(_e, "PLANS"), "set", [_S.prop(_S.read(_e, "a"), "mask"), _S.write(_e, "m", _S.construct(_S.read(_e, "Map"), []), "=", false)])
	if _S.truth(_S.invoke(_S.read(_e, "m"), "has", [_S.read(_e, "seed")])):
		return _S.invoke(_S.read(_e, "m"), "get", [_S.read(_e, "seed")])
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "S"), "h"))
	_S.define(_e, "W", _S.prop(_S.read(_e, "S"), "w"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.binary("*", _S.read(_e, "seed"), 11), 1)]))
	_S.define(_e, "ferns", [])
	_S.define(_e, "roots", _S.invoke(_S.invoke(_S.invoke(_S.prop(_S.read(_e, "S"), "side"), "filter", [_S.function_value(_e, "_f1")]), "sort", [_S.function_value(_e, "_f2")]), "slice", [0, 6]))
	_S.invoke(_S.read(_e, "roots"), "forEach", [_S.function_value(_e, "_f3")])
	_S.define(_e, "clear", _S.function_value(_e, "_f4"))
	_S.define(_e, "hangs", _S.invoke(_S.invoke(_S.invoke(_S.prop(_S.read(_e, "S"), "body"), "filter", [_S.function_value(_e, "_f5")]), "map", [_S.function_value(_e, "_f6")]), "filter", [_S.function_value(_e, "_f7")]))
	_S.define(_e, "best", _S.function_value(_e, "_f8"))
	_S.define(_e, "icicles", _S.invoke(_S.invoke([_S.call_value(_S.read(_e, "best"), [_S.function_value(_e, "_f9"), _S.function_value(_e, "_f10")]), _S.call_value(_S.read(_e, "best"), [_S.function_value(_e, "_f11"), _S.function_value(_e, "_f12")]), _S.call_value(_S.read(_e, "best"), [_S.function_value(_e, "_f13"), _S.function_value(_e, "_f14")]), _S.call_value(_S.read(_e, "best"), [_S.function_value(_e, "_f15"), _S.function_value(_e, "_f16")]), _S.call_value(_S.read(_e, "best"), [_S.function_value(_e, "_f17"), _S.function_value(_e, "_f18")]), _S.call_value(_S.read(_e, "best"), [_S.function_value(_e, "_f19"), _S.function_value(_e, "_f20")])], "filter", [_S.read(_e, "Boolean")]), "map", [_S.function_value(_e, "_f21")]))
	_S.define(_e, "snow", _S.invoke(_S.invoke(_S.prop(_S.read(_e, "S"), "up"), "filter", [_S.function_value(_e, "_f22")]), "map", [_S.function_value(_e, "_f23")]))
	_S.define(_e, "E", _S.call_value(_S.read(_e, "eyes"), [_S.read(_e, "a")]))
	_S.define(_e, "mouth", ([_S.binary("/", _S.binary("+", _S.binary("+", _S.prop(_S.prop(_S.read(_e, "E"), 0), "x1"), _S.prop(_S.prop(_S.read(_e, "E"), 1), "x0")), 1), 2), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [_S.prop(_S.prop(_S.read(_e, "E"), 0), "y1"), _S.prop(_S.prop(_S.read(_e, "E"), 1), "y1")]), 2)] if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "E"), "length"), 2)) else [_S.binary("/", _S.read(_e, "W"), 2), _S.binary("*", _S.read(_e, "H"), 0.38)]))
	_S.define(_e, "out", _S.merge([{"ferns": _S.read(_e, "ferns")}, {"icicles": _S.read(_e, "icicles")}, {"snow": _S.read(_e, "snow")}, {"mouth": _S.read(_e, "mouth")}]))
	_S.invoke(_S.read(_e, "m"), "set", [_S.read(_e, "seed"), _S.read(_e, "out")])
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v0 = _S.arg(_args, 0)
	_S.define(_e, "y", _S.prop(_v0, 1))
	return _S.logical("&&", _S.binary(">", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.2)), func(): return _S.binary("<", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.85)))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("-", _S.invoke(_S.read(_e, "R"), "next", []), 0.5)

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v1 = _S.arg(_args, 0)
	_S.define(_e, "x0", _S.prop(_v1, 0))
	_S.define(_e, "y0", _S.prop(_v1, 1))
	_S.define(_e, "dir", _S.prop(_v1, 2))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "x", _S.read(_e, "x0"))
	_S.define(_e, "y", _S.read(_e, "y0"))
	_S.define(_e, "ang", (_S.unary("-", 0.5) if _S.truth(_S.binary("<", _S.read(_e, "dir"), 0)) else _S.binary("+", _S.prop(_S.read(_e, "Math"), "PI"), 0.5)))
	_S.write(_e, "ang", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.4), 0.4]), "+=", false)
	var _v2 = _S.scope(_e)
	_S.define(_v2, "s", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "s"), 9)):
		var _v3 = _S.scope(_v2)
		_S.write(_v3, "x", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "ang")]), 1.1), "+=", false)
		_S.write(_v3, "y", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "ang")]), 1.1), "+=", false)
		_S.define(_v3, "px", _S.invoke(_S.read(_v3, "Math"), "round", [_S.read(_v3, "x")]))
		_S.define(_v3, "py", _S.invoke(_S.read(_v3, "Math"), "round", [_S.read(_v3, "y")]))
		if _S.truth(_S.unary("!", _S.invoke(_S.read(_v3, "S"), "on", [_S.read(_v3, "px"), _S.read(_v3, "py")]))):
			break
		_S.invoke(_S.read(_v3, "ferns"), "push", [[_S.read(_v3, "px"), _S.read(_v3, "py"), _S.binary("/", _S.read(_v3, "s"), 9), _S.read(_v3, "i")]])
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v3, "s"), 2), 1)):
			for _v4 in _S.array([_S.unary("-", 1), 1]):
				var _v5 = _S.scope(_v3)
				_S.define(_v5, "side", _v4)
				var _v6 = _S.scope(_v5)
				_S.define(_v6, "ba", _S.binary("+", _S.read(_v6, "ang"), _S.binary("*", _S.read(_v6, "side"), 1.05)))
				_S.define(_v6, "L", _S.binary("+", 1, _S.invoke(_S.read(_v6, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_v6, "R"), "range", [0, 2]), _S.binary("-", 1, _S.binary("/", _S.read(_v6, "s"), 9)))])))
				var _v7 = _S.scope(_v6)
				_S.define(_v7, "k", 1)
				while _S.truth(_S.binary("<=", _S.read(_v7, "k"), _S.read(_v7, "L"))):
					var _v8 = _S.scope(_v7)
					_S.define(_v8, "bx", _S.invoke(_S.read(_v8, "Math"), "round", [_S.binary("+", _S.read(_v8, "x"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "ba")]), _S.read(_v8, "k")))]))
					_S.define(_v8, "by", _S.invoke(_S.read(_v8, "Math"), "round", [_S.binary("+", _S.read(_v8, "y"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "ba")]), _S.read(_v8, "k")))]))
					if _S.truth(_S.invoke(_S.read(_v8, "S"), "on", [_S.read(_v8, "bx"), _S.read(_v8, "by")])):
						_S.invoke(_S.read(_v8, "ferns"), "push", [[_S.read(_v8, "bx"), _S.read(_v8, "by"), _S.binary("/", _S.binary("+", _S.read(_v8, "s"), _S.binary("*", _S.read(_v8, "k"), 0.6)), 9), _S.read(_v8, "i")]])
					_v7 = _S.iteration(_v7)
					_S.write(_v7, "k", 1, "+=", true)
		_S.write(_v3, "ang", _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 0.25), 0.25]), "+=", false)
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "s", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "n", 0)
	while _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_e, "n"), 7), func(): return _S.binary("<", _S.binary("+", _S.binary("+", _S.read(_e, "y"), 1), _S.read(_e, "n")), _S.read(_e, "H"))), func(): return _S.unary("!", _S.invoke(_S.read(_e, "S"), "on", [_S.read(_e, "x"), _S.binary("+", _S.binary("+", _S.read(_e, "y"), 1), _S.read(_e, "n"))])))):
		_S.write(_e, "n", 1, "+=", true)
	return _S.read(_e, "n")

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v9 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v9, 0))
	_S.define(_e, "y", _S.prop(_v9, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.unary("!", _S.invoke(_S.read(_e, "S"), "on", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1)])), func(): return _S.invoke(_S.read(_e, "S"), "on", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 1)])), func(): return _S.binary("<", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.72))), func(): return _S.binary(">", _S.read(_e, "y"), 4))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v10 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v10, 0))
	_S.define(_e, "y", _S.prop(_v10, 1))
	return [_S.read(_e, "x"), _S.read(_e, "y"), _S.call_value(_S.read(_e, "clear"), [_S.read(_e, "x"), _S.read(_e, "y")])]

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v11 = _S.arg(_args, 0)
	_S.define(_e, "c", _S.prop(_v11, 2))
	return _S.binary(">=", _S.read(_e, "c"), 4)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	_S.define(_e, "key", _S.arg(_args, 1))
	return _S.prop(_S.invoke(_S.invoke(_S.read(_e, "hangs"), "filter", [_S.read(_e, "f")]), "sort", [_S.read(_e, "key")]), 0)

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v12 = _S.arg(_args, 0)
	_S.define(_e, "y", _S.prop(_v12, 1))
	return _S.binary("<", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.36))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "p"), 0), _S.prop(_S.read(_e, "q"), 0))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v13 = _S.arg(_args, 0)
	_S.define(_e, "y", _S.prop(_v13, 1))
	return _S.binary("<", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.36))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "q"), 0), _S.prop(_S.read(_e, "p"), 0))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v14 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v14, 0))
	_S.define(_e, "y", _S.prop(_v14, 1))
	return _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.36)), func(): return _S.binary("<", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.5))), func(): return _S.binary("<", _S.read(_e, "x"), _S.binary("/", _S.read(_e, "W"), 2)))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "q"), 0), _S.prop(_S.read(_e, "p"), 0))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v15 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v15, 0))
	_S.define(_e, "y", _S.prop(_v15, 1))
	return _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.36)), func(): return _S.binary("<", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.5))), func(): return _S.binary(">=", _S.read(_e, "x"), _S.binary("/", _S.read(_e, "W"), 2)))

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "p"), 0), _S.prop(_S.read(_e, "q"), 0))

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v16 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v16, 0))
	_S.define(_e, "y", _S.prop(_v16, 1))
	return _S.logical("&&", _S.binary(">=", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.5)), func(): return _S.binary("<", _S.read(_e, "x"), _S.binary("/", _S.read(_e, "W"), 2)))

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "p"), 0), _S.prop(_S.read(_e, "q"), 0))

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v17 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v17, 0))
	_S.define(_e, "y", _S.prop(_v17, 1))
	return _S.logical("&&", _S.binary(">=", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.5)), func(): return _S.binary(">=", _S.read(_e, "x"), _S.binary("/", _S.read(_e, "W"), 2)))

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "q"), 0), _S.prop(_S.read(_e, "p"), 0))

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v18 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v18, 0))
	_S.define(_e, "y", _S.prop(_v18, 1))
	_S.define(_e, "c", _S.prop(_v18, 2))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"x": _S.read(_e, "x")}, {"y": _S.binary("+", _S.read(_e, "y"), 1)}, {"len": _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "c"), 1), _S.invoke(_S.read(_e, "R"), "range", [3, 5.5])])}, {"phase": _S.invoke(_S.read(_e, "R"), "next", [])}, {"period": (1 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else 2)}])

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v19 = _S.arg(_args, 0)
	_S.define(_e, "y", _S.prop(_v19, 1))
	return _S.binary("<", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.6))

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v20 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v20, 0))
	_S.define(_e, "y", _S.prop(_v20, 1))
	return [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 1, (1 if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "x"), _S.read(_e, "seed"), 3]), 0.45)) else 0))]

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "reach", _S.arg(_args, 3))
	var _v21 = _S.scope(_e)
	_S.define(_v21, "x", _S.binary("-", _S.unary("-", _S.invoke(_S.read(_v21, "Math"), "ceil", [_S.read(_v21, "reach")])), 1))
	while _S.truth(_S.binary("<=", _S.read(_v21, "x"), _S.binary("+", _S.read(_v21, "reach"), 1))):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "q", _S.binary("/", _S.invoke(_S.read(_v22, "Math"), "abs", [_S.binary("+", _S.read(_v22, "x"), 0.5)]), _S.read(_v22, "reach")))
		_S.define(_v22, "h", _S.call_value(_S.read(_v22, "rand"), [_S.read(_v22, "x"), 17]))
		_S.define(_v22, "k", _S.binary("-", 1, _S.binary("*", _S.read(_v22, "q"), _S.read(_v22, "q"))))
		if _S.truth(_S.binary(">", _S.read(_v22, "q"), _S.binary("+", 1, _S.binary("*", _S.read(_v22, "h"), 0.15)))):
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "x", 1, "+=", true)
			continue
		_S.define(_v22, "tw", _S.binary(">", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v22, "t"), _S.read(_v22, "D")), _S.read(_v22, "TAU")), 2), _S.binary("*", _S.call_value(_S.read(_v22, "rand"), [_S.read(_v22, "x"), 3]), _S.read(_v22, "TAU")))]), 0.94))
		_S.invoke(_S.read(_v22, "p"), "px", [_S.read(_v22, "x"), 0, (_S.prop(_S.read(_v22, "C"), 7) if _S.truth(_S.logical("||", _S.read(_v22, "tw"), func(): return _S.binary("<", _S.read(_v22, "h"), 0.3))) else (_S.prop(_S.read(_v22, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v22, "q"), 0.85)) else _S.prop(_S.read(_v22, "C"), 6)))])
		if _S.truth(_S.binary("<", _S.read(_v22, "h"), _S.binary("*", 0.3, _S.read(_v22, "k")))):
			_S.invoke(_S.read(_v22, "p"), "px", [_S.read(_v22, "x"), _S.unary("-", 1), _S.prop(_S.read(_v22, "C"), 6)])
		var _v23 = _S.scope(_v22)
		_S.define(_v23, "j", 1)
		while _S.truth(_S.binary("<=", _S.read(_v23, "j"), _S.binary("+", 1, _S.invoke(_S.read(_v23, "Math"), "round", [_S.binary("*", 2, _S.read(_v23, "k"))])))):
			_S.invoke(_S.read(_v23, "p"), "dot", [_S.read(_v23, "x"), _S.read(_v23, "j"), (_S.prop(_S.read(_v23, "C"), 5) if _S.truth(_S.binary("===", _S.read(_v23, "j"), 1)) else _S.prop(_S.read(_v23, "C"), 4)), _S.binary("*", _S.binary("-", 1.05, _S.binary("/", _S.read(_v23, "j"), 4)), 0.85)])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "j", 1, "+=", true)
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "x", 1, "+=", true)
	return null

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "reach", _S.binary("+", 13, _S.binary("*", 3.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU"))]))))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 28), _S.unary("-", 3), 28, 6, _S.function_value(_e, "_f26")])
	_S.call_value(_S.read(_e, "frost"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "reach")])
	return null

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("/", _S.read(_e, "x"), 24), _S.binary("/", _S.binary("-", _S.read(_e, "y"), 0.5), 4)]))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 1)):
		_S.last([_S.set_prop(_S.read(_e, "out"), "l", _S.prop(_S.read(_e, "C"), 4), "=", false), _S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.binary("*", 0.24, _S.binary("-", 1, _S.read(_e, "d"))), _S.binary("-", 1, _S.read(_e, "d"))), "=", false)])
	return null

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "S"), "h"))
	_S.define(_e, "P", _S.call_value(_S.read(_e, "plan"), [_S.read(_e, "a"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "dx", _S.call_value(_S.read(_e, "shake"), [_S.read(_e, "t")]))
	_S.define(_e, "ph", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t")]))
	_S.define(_e, "X", _S.function_value(_e, "_f28"))
	_S.define(_e, "Y", _S.function_value(_e, "_f29"))
	for _v24 in _S.array(_S.prop(_S.read(_e, "S"), "body")):
		var _v25 = _S.scope(_e)
		var _v26 = _v24
		_S.define(_v25, "mx", _S.prop(_v26, 0))
		_S.define(_v25, "my", _S.prop(_v26, 1))
		var _v27 = _S.scope(_v25)
		_S.define(_v27, "c", _S.call_value(_S.read(_v27, "colorAt"), [_S.read(_v27, "a"), _S.read(_v27, "mx"), _S.read(_v27, "my")]))
		_S.define(_v27, "ice", _S.prop(_S.read(_v27, "C"), _S.call_value(_S.read(_v27, "clamp"), [_S.binary("+", 1, _S.invoke(_S.read(_v27, "Math"), "round", [_S.binary("*", _S.call_value(_S.read(_v27, "luma"), [_S.read(_v27, "c")]), 5.6)])), 1, 7])))
		_S.define(_v27, "rim", _S.logical("||", _S.logical("||", _S.unary("!", _S.invoke(_S.read(_v27, "S"), "on", [_S.binary("-", _S.read(_v27, "mx"), 1), _S.read(_v27, "my")])), func(): return _S.unary("!", _S.invoke(_S.read(_v27, "S"), "on", [_S.read(_v27, "mx"), _S.binary("-", _S.read(_v27, "my"), 1)]))), func(): return _S.unary("!", _S.invoke(_S.read(_v27, "S"), "on", [_S.binary("+", _S.read(_v27, "mx"), 1), _S.read(_v27, "my")]))))
		_S.invoke(_S.read(_v27, "p"), "px", [_S.call_value(_S.read(_v27, "X"), [_S.read(_v27, "mx")]), _S.call_value(_S.read(_v27, "Y"), [_S.read(_v27, "my")]), ((_S.prop(_S.read(_v27, "C"), 5) if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v27, "my"), _S.binary("*", _S.read(_v27, "H"), 0.5)), func(): return _S.unary("!", _S.invoke(_S.read(_v27, "S"), "on", [_S.binary("-", _S.read(_v27, "mx"), 1), _S.read(_v27, "my")])))) else _S.prop(_S.read(_v27, "C"), 3)) if _S.truth(_S.logical("&&", _S.read(_v27, "rim"), func(): return _S.binary("<", _S.call_value(_S.read(_v27, "luma"), [_S.read(_v27, "c")]), 0.3))) else _S.call_value(_S.read(_v27, "mix"), [_S.read(_v27, "c"), _S.read(_v27, "ice"), 0.38]))])
	_S.define(_e, "grow", _S.binary("+", 0.2, _S.binary("*", 0.65, _S.call_value(_S.read(_e, "smooth"), [0.05, 0.95, _S.read(_e, "ph")]))))
	for _v28 in _S.array(_S.prop(_S.read(_e, "P"), "ferns")):
		var _v29 = _S.scope(_e)
		var _v30 = _v28
		_S.define(_v29, "x", _S.prop(_v30, 0))
		_S.define(_v29, "y", _S.prop(_v30, 1))
		_S.define(_v29, "u", _S.prop(_v30, 2))
		if _S.truth(_S.binary("<", _S.read(_v29, "u"), _S.read(_v29, "grow"))):
			_S.invoke(_S.read(_v29, "p"), "px", [_S.call_value(_S.read(_v29, "X"), [_S.read(_v29, "x")]), _S.call_value(_S.read(_v29, "Y"), [_S.read(_v29, "y")]), (_S.read(_v29, "WHITE") if _S.truth(_S.binary(">", _S.read(_v29, "u"), _S.binary("-", _S.read(_v29, "grow"), 0.1))) else (_S.prop(_S.read(_v29, "C"), 6) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v29, "rand"), [_S.read(_v29, "x"), _S.read(_v29, "y"), 5]), 0.5)) else _S.prop(_S.read(_v29, "C"), 5)))])
	for _v31 in _S.array(_S.prop(_S.read(_e, "P"), "snow")):
		var _v32 = _S.scope(_e)
		var _v33 = _v31
		_S.define(_v32, "x", _S.prop(_v33, 0))
		_S.define(_v32, "y", _S.prop(_v33, 1))
		_S.define(_v32, "d", _S.prop(_v33, 2))
		var _v34 = _S.scope(_v32)
		_S.invoke(_S.read(_v34, "p"), "px", [_S.call_value(_S.read(_v34, "X"), [_S.read(_v34, "x")]), _S.binary("-", _S.call_value(_S.read(_v34, "Y"), [_S.read(_v34, "y")]), 1), _S.prop(_S.read(_v34, "C"), 7)])
		if _S.truth(_S.binary(">", _S.read(_v34, "d"), 1)):
			_S.invoke(_S.read(_v34, "p"), "px", [_S.call_value(_S.read(_v34, "X"), [_S.read(_v34, "x")]), _S.binary("-", _S.call_value(_S.read(_v34, "Y"), [_S.read(_v34, "y")]), 2), (_S.prop(_S.read(_v34, "C"), 7) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v34, "rand"), [_S.read(_v34, "x"), _S.read(_v34, "y"), 9]), 0.5)) else _S.prop(_S.read(_v34, "C"), 6))])
	for _v35 in _S.array(_S.prop(_S.read(_e, "P"), "icicles")):
		var _v36 = _S.scope(_e)
		_S.define(_v36, "ic", _v35)
		var _v37 = _S.scope(_v36)
		_S.define(_v37, "per", _S.prop(_S.read(_v37, "ic"), "period"))
		_S.define(_v37, "u", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("+", _S.binary("/", _S.read(_v37, "t"), _S.read(_v37, "per")), _S.prop(_S.read(_v37, "ic"), "phase")), 1), 1), 1))
		_S.define(_v37, "L", _S.binary("*", _S.prop(_S.read(_v37, "ic"), "len"), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.call_value(_S.read(_v37, "smooth"), [0, 0.7, _S.read(_v37, "u")])))))
		_S.define(_v37, "x", _S.call_value(_S.read(_v37, "X"), [_S.prop(_S.read(_v37, "ic"), "x")]))
		_S.define(_v37, "y0", _S.call_value(_S.read(_v37, "Y"), [_S.prop(_S.read(_v37, "ic"), "y")]))
		var _v38 = _S.scope(_v37)
		_S.define(_v38, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v38, "j"), _S.read(_v38, "L"))):
			var _v39 = _S.scope(_v38)
			_S.define(_v39, "v", _S.binary("/", _S.read(_v39, "j"), _S.read(_v39, "L")))
			_S.invoke(_S.read(_v39, "p"), "px", [_S.read(_v39, "x"), _S.binary("+", _S.read(_v39, "y0"), _S.read(_v39, "j")), (_S.read(_v39, "WHITE") if _S.truth(_S.binary(">", _S.read(_v39, "v"), 0.75)) else (_S.prop(_S.read(_v39, "C"), 7) if _S.truth(_S.binary("<", _S.read(_v39, "v"), 0.3)) else _S.prop(_S.read(_v39, "C"), 6)))])
			if _S.truth(_S.binary("<", _S.read(_v39, "v"), 0.5)):
				_S.invoke(_S.read(_v39, "p"), "px", [_S.binary("+", _S.read(_v39, "x"), 1), _S.binary("+", _S.read(_v39, "y0"), _S.read(_v39, "j")), _S.prop(_S.read(_v39, "C"), 4)])
			_v38 = _S.iteration(_v38)
			_S.write(_v38, "j", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v37, "u"), 0.7), func(): return _S.binary("<", _S.read(_v37, "u"), 0.86))):
			_S.invoke(_S.read(_v37, "p"), "px", [_S.read(_v37, "x"), _S.binary("+", _S.read(_v37, "y0"), _S.read(_v37, "L")), _S.prop(_S.read(_v37, "C"), 6)])
		else:
			if _S.truth(_S.binary(">=", _S.read(_v37, "u"), 0.86)):
				var _v40 = _S.scope(_v37)
				_S.define(_v40, "f", _S.binary("*", _S.binary("-", _S.read(_v40, "u"), 0.86), _S.read(_v40, "per")))
				_S.define(_v40, "y", _S.binary("+", _S.binary("+", _S.read(_v40, "y0"), _S.read(_v40, "L")), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, 760), _S.read(_v40, "f")), _S.read(_v40, "f"))))
				if _S.truth(_S.binary("<", _S.read(_v40, "y"), _S.unary("-", 1))):
					_S.last([_S.invoke(_S.read(_v40, "p"), "px", [_S.read(_v40, "x"), _S.read(_v40, "y"), _S.prop(_S.read(_v40, "C"), 6)]), _S.invoke(_S.read(_v40, "p"), "px", [_S.read(_v40, "x"), _S.binary("-", _S.read(_v40, "y"), 1), _S.prop(_S.read(_v40, "C"), 5)])])
		_S.invoke(_S.read(_v37, "p"), "glow", [_S.read(_v37, "x"), _S.binary("+", _S.read(_v37, "y0"), _S.binary("*", _S.read(_v37, "L"), 0.6)), 4, _S.prop(_S.read(_v37, "C"), 5), 0.18])
	var _v41 = _S.prop(_S.read(_e, "P"), "mouth")
	_S.define(_e, "mx0", _S.prop(_v41, 0))
	_S.define(_e, "my0", _S.prop(_v41, 1))
	var _v42 = _S.scope(_e)
	_S.define(_v42, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v42, "i"), 4)):
		var _v43 = _S.scope(_v42)
		_S.define(_v43, "age", _S.binary("-", _S.binary("-", _S.read(_v43, "ph"), 0.35), _S.binary("*", _S.read(_v43, "i"), 0.05)))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v43, "age"), 0), func(): return _S.binary(">", _S.read(_v43, "age"), 0.65))):
			_v42 = _S.iteration(_v42)
			_S.write(_v42, "i", 1, "+=", true)
			continue
		_S.define(_v43, "u", _S.binary("/", _S.read(_v43, "age"), 0.65))
		_S.define(_v43, "x", _S.binary("+", _S.binary("+", _S.binary("+", _S.call_value(_S.read(_v43, "X"), [_S.read(_v43, "mx0")]), 1), _S.call_value(_S.read(_v43, "travel"), [16, 0, 2.2, _S.read(_v43, "age")])), _S.read(_v43, "i")))
		_S.define(_v43, "y", _S.binary("-", _S.binary("-", _S.call_value(_S.read(_v43, "Y"), [_S.read(_v43, "my0")]), _S.call_value(_S.read(_v43, "travel"), [6, 3, 1, _S.read(_v43, "age")])), _S.binary("*", _S.read(_v43, "i"), 0.5)))
		_S.define(_v43, "rad", _S.binary("+", 0.8, _S.binary("*", 2.4, _S.invoke(_S.read(_v43, "Math"), "sqrt", [_S.read(_v43, "u")]))))
		_S.invoke(_S.read(_v43, "p"), "disc", [_S.read(_v43, "x"), _S.read(_v43, "y"), _S.read(_v43, "rad"), _S.prop(_S.read(_v43, "C"), 7), _S.binary("*", _S.binary("*", 0.5, _S.binary("-", 1, _S.read(_v43, "u"))), _S.invoke(_S.read(_v43, "Math"), "min", [1, _S.binary("*", _S.read(_v43, "u"), 8)]))])
		_S.invoke(_S.read(_v43, "p"), "disc", [_S.binary("-", _S.read(_v43, "x"), _S.binary("*", _S.read(_v43, "rad"), 0.2)), _S.binary("-", _S.read(_v43, "y"), _S.binary("*", _S.read(_v43, "rad"), 0.3)), _S.binary("*", _S.read(_v43, "rad"), 0.5), _S.read(_v43, "WHITE"), _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_v43, "u")))])
		_v42 = _S.iteration(_v42)
		_S.write(_v42, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 9, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 2), _S.function_value(_e, "_f30"), _S.function_value(_e, "_f31")])
	if _S.truth(_S.binary("<", _S.read(_e, "ph"), 0.5)):
		var _v44 = _S.scope(_e)
		_S.define(_v44, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v44, "i"), 8)):
			var _v45 = _S.scope(_v44)
			_S.define(_v45, "side", (1 if _S.truth(_S.binary("%", _S.read(_v45, "i"), 2)) else _S.unary("-", 1)))
			_S.define(_v45, "vx", _S.binary("*", _S.read(_v45, "side"), _S.binary("+", 20, _S.binary("*", 30, _S.call_value(_S.read(_v45, "rand"), [_S.read(_v45, "i"), 4])))))
			_S.define(_v45, "vy", _S.unary("-", _S.binary("+", 20, _S.binary("*", 30, _S.call_value(_S.read(_v45, "rand"), [_S.read(_v45, "i"), 5])))))
			_S.define(_v45, "x", _S.binary("+", _S.binary("*", _S.read(_v45, "side"), _S.binary("+", 6, _S.binary("*", 6, _S.call_value(_S.read(_v45, "rand"), [_S.read(_v45, "i"), 6])))), _S.binary("*", _S.read(_v45, "vx"), _S.read(_v45, "ph"))))
			_S.define(_v45, "y", _S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v45, "a"), "y"), _S.binary("*", 3, _S.call_value(_S.read(_v45, "rand"), [_S.read(_v45, "i"), 7]))), _S.binary("*", _S.read(_v45, "vy"), _S.read(_v45, "ph"))), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, 300), _S.read(_v45, "ph")), _S.read(_v45, "ph"))))
			_S.invoke(_S.read(_v45, "p"), "dot", [_S.read(_v45, "x"), _S.read(_v45, "y"), (_S.prop(_S.read(_v45, "C"), 6) if _S.truth(_S.binary("%", _S.read(_v45, "i"), 3)) else _S.read(_v45, "WHITE")), _S.binary("-", 1.2, _S.binary("*", _S.read(_v45, "ph"), 2))])
			_v44 = _S.iteration(_v44)
			_S.write(_v44, "i", 1, "+=", true)
	if _S.truth(_S.binary("<", _S.read(_e, "ph"), 0.25)):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.call_value(_S.read(_e, "X"), [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.prop(_S.read(_e, "S"), "w"), 0.3)])]), _S.call_value(_S.read(_e, "Y"), [4]), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", 3, _S.binary("-", 1, _S.binary("/", _S.read(_e, "ph"), 0.25)))]), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), 0.4])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.binary("*", _S.read(_e, "H"), 0.45)), 30, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.2, _S.binary("*", 0.12, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "ph")), 0.2)])))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), 2), 16, _S.prop(_S.read(_e, "C"), 5), 0.1])
	return null

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "mx", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.read(_e, "mx")), _S.read(_e, "dx"))

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "my", _S.arg(_args, 0))
	return _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.read(_e, "my"))

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.2, 1.8])

static func _f31(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "x", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 14), 14]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 3), _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), _S.read(_e, "TAU")))]), 1.5)))
	_S.define(_e, "y", _S.binary("+", _S.binary("-", _S.prop(_S.read(_e, "a"), "y"), 16), _S.binary("*", _S.read(_e, "age"), 14)))
	if _S.truth(_S.binary(">", _S.read(_e, "y"), _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), 2))):
		return null
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.5)) else _S.prop(_S.read(_e, "C"), 6)), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 4)])])
	return null

static func _f32(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "t"), _S.read(_e, "SHIVER")), _S.read(_e, "SHIVER")), _S.read(_e, "SHIVER"))

static func _f33(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f34(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return ((1 if _S.truth(_S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 50)]), 2)) else _S.unary("-", 1)) if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t")]), 0.22)) else 0)
