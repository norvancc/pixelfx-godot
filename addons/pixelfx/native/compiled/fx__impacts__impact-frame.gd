@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/impact-frame.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "burst", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Impact frame"}, {"desc": "An anime impact: two frames of white with black burst lines rushing at the hit, two frames inverted, then the lines pull out past the edges and vanish."}, {"tags": ["impact", "hit", "anime", "manga", "flash", "speed-lines", "screen", "one-shot"]}, {"size": [320, 180]}, {"origin": [160, 90]}, {"duration": 0.3}, {"loop": false}, {"fps": 30}, {"bg": "black"}, {"options": _S.merge([{"palette": ["#000000", "#ffffff"]}, {"lines": 64}, {"seed": 19}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FRAME", _S.binary("/", 1, 30))
	_S.define(_e, "spikes", _S.function_value(_e, "_f6"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "n", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "n")}]), _S.function_value(_e, "_f1")])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "thick", _S.invoke(_S.read(_e, "R"), "chance", [0.18]))
	return _S.merge([{"a": _S.binary("*", _S.binary("/", _S.binary("+", _S.read(_e, "i"), _S.invoke(_S.read(_e, "R"), "range", [0.1, 0.9])), _S.read(_e, "n")), _S.read(_e, "TAU"))}, {"inner": (_S.invoke(_S.read(_e, "R"), "range", [30, 48]) if _S.truth(_S.read(_e, "thick")) else _S.invoke(_S.read(_e, "R"), "range", [18, 70]))}, {"w": (_S.invoke(_S.read(_e, "R"), "range", [5, 8]) if _S.truth(_S.read(_e, "thick")) else _S.invoke(_S.read(_e, "R"), "range", [1.2, 3.6]))}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 3]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "INK", _S.prop(_S.read(_e, "C"), 0))
	_S.define(_e, "PAPER", _S.prop(_S.read(_e, "C"), 2))
	var _v0 = _S.prop(_S.read(_e, "meta"), "size")
	_S.define(_e, "W", _S.prop(_v0, 0))
	_S.define(_e, "H", _S.prop(_v0, 1))
	var _v1 = _S.prop(_S.read(_e, "meta"), "origin")
	_S.define(_e, "OX", _S.prop(_v1, 0))
	_S.define(_e, "OY", _S.prop(_v1, 1))
	_S.define(_e, "x0", _S.unary("-", _S.read(_e, "OX")))
	_S.define(_e, "y0", _S.unary("-", _S.read(_e, "OY")))
	_S.define(_e, "sets", [_S.call_value(_S.read(_e, "burst"), [_S.read(_e, "R"), _S.prop(_S.read(_e, "o"), "lines")]), _S.call_value(_S.read(_e, "burst"), [_S.read(_e, "R"), _S.prop(_S.read(_e, "o"), "lines")])])
	_S.define(_e, "jit", [[_S.invoke(_S.read(_e, "Math"), "round", [_S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 2), 2])]), _S.invoke(_S.read(_e, "Math"), "round", [_S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1])])], [_S.invoke(_S.read(_e, "Math"), "round", [_S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 2), 2])]), _S.invoke(_S.read(_e, "Math"), "round", [_S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1])])]])
	_S.define(_e, "ph", [_S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]), _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]), _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]), _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])])
	_S.define(_e, "masks", [])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "f", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "f"), 8)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "m", _S.construct(_S.read(_v3, "Uint8Array"), [_S.binary("*", _S.read(_v3, "W"), _S.read(_v3, "H"))]))
		_S.define(_v3, "set", _S.prop(_S.read(_v3, "sets"), _S.binary("%", _S.read(_v3, "f"), 2)))
		_S.define(_v3, "n", _S.prop(_S.read(_v3, "set"), "length"))
		var _v4 = (_S.prop(_S.read(_v3, "jit"), _S.binary("%", _S.read(_v3, "f"), 2)) if _S.truth(_S.binary("<", _S.read(_v3, "f"), 4)) else [0, 0])
		_S.define(_v3, "jx", _S.prop(_v4, 0))
		_S.define(_v3, "jy", _S.prop(_v4, 1))
		_S.define(_v3, "reach", (0 if _S.truth(_S.binary("<", _S.read(_v3, "f"), 4)) else _S.invoke(_S.read(_v3, "Math"), "pow", [_S.binary("/", _S.binary("-", _S.read(_v3, "f"), 3), 4.5), 1.5])))
		_S.define(_v3, "thin", (1 if _S.truth(_S.binary("<", _S.read(_v3, "f"), 4)) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v3, "f"), 3), 5.5))))
		var _v5 = _S.scope(_v3)
		_S.define(_v5, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "j"), _S.read(_v5, "H"))):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v6, "i"), _S.read(_v6, "W"))):
				var _v7 = _S.scope(_v6)
				_S.define(_v7, "X", _S.binary("-", _S.binary("+", _S.binary("+", _S.read(_v7, "x0"), _S.read(_v7, "i")), 0.5), _S.read(_v7, "jx")))
				_S.define(_v7, "Y", _S.binary("-", _S.binary("+", _S.binary("+", _S.read(_v7, "y0"), _S.read(_v7, "j")), 0.5), _S.read(_v7, "jy")))
				_S.define(_v7, "rho", _S.invoke(_S.read(_v7, "Math"), "hypot", [_S.read(_v7, "X"), _S.binary("*", _S.read(_v7, "Y"), 1.35)]))
				_S.define(_v7, "ang", _S.invoke(_S.read(_v7, "Math"), "atan2", [_S.binary("*", _S.read(_v7, "Y"), 1.35), _S.read(_v7, "X")]))
				_S.define(_v7, "slot", _S.invoke(_S.read(_v7, "Math"), "floor", [_S.binary("/", _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_v7, "ang"), _S.read(_v7, "TAU")), _S.read(_v7, "TAU")), _S.read(_v7, "TAU")), _S.binary("/", _S.read(_v7, "TAU"), _S.read(_v7, "n")))]))
				_S.define(_v7, "line", false)
				var _v8 = _S.scope(_v7)
				_S.define(_v8, "k", _S.unary("-", 1))
				while _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_v8, "k"), 1), func(): return _S.unary("!", _S.read(_v8, "line")))):
					var _v9 = _S.scope(_v8)
					_S.define(_v9, "l", _S.prop(_S.read(_v9, "set"), _S.binary("%", _S.binary("+", _S.binary("+", _S.read(_v9, "slot"), _S.read(_v9, "k")), _S.read(_v9, "n")), _S.read(_v9, "n"))))
					_S.define(_v9, "d", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v9, "ang"), _S.prop(_S.read(_v9, "l"), "a")), _S.read(_v9, "TAU")), _S.read(_v9, "TAU")), _S.read(_v9, "TAU")))
					if _S.truth(_S.binary(">", _S.read(_v9, "d"), _S.prop(_S.read(_v9, "Math"), "PI"))):
						_S.write(_v9, "d", _S.binary("-", _S.read(_v9, "TAU"), _S.read(_v9, "d")), "=", false)
					_S.define(_v9, "inner", _S.binary("+", _S.prop(_S.read(_v9, "l"), "inner"), _S.binary("*", _S.read(_v9, "reach"), 150)))
					_S.define(_v9, "hw", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v9, "l"), "w"), _S.call_value(_S.read(_v9, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v9, "rho"), _S.read(_v9, "inner")), 40)])), _S.read(_v9, "thin")))
					_S.write(_v9, "line", _S.logical("&&", _S.binary(">", _S.read(_v9, "rho"), _S.read(_v9, "inner")), func(): return _S.binary("<", _S.binary("*", _S.read(_v9, "d"), _S.read(_v9, "rho")), _S.invoke(_S.read(_v9, "Math"), "max", [0.5, _S.read(_v9, "hw")]))), "=", false)
					_v8 = _S.iteration(_v8)
					_S.write(_v8, "k", 1, "+=", true)
				if _S.truth(_S.binary("<", _S.read(_v7, "f"), 4)):
					var _v10 = _S.scope(_v7)
					_S.define(_v10, "r2", _S.invoke(_S.read(_v10, "Math"), "hypot", [_S.read(_v10, "X"), _S.binary("*", _S.read(_v10, "Y"), 1.1)]))
					_S.define(_v10, "core", _S.binary("*", _S.call_value(_S.read(_v10, "spikes"), [_S.invoke(_S.read(_v10, "Math"), "atan2", [_S.binary("*", _S.read(_v10, "Y"), 1.1), _S.read(_v10, "X")]), _S.prop(_S.read(_v10, "ph"), _S.read(_v10, "f"))]), (0.85 if _S.truth(_S.binary("===", _S.read(_v10, "f"), 0)) else _S.binary("+", 1, _S.binary("*", _S.read(_v10, "f"), 0.08)))))
					_S.set_prop(_S.read(_v10, "m"), _S.binary("+", _S.binary("*", _S.read(_v10, "j"), _S.read(_v10, "W")), _S.read(_v10, "i")), ((2 if _S.truth(_S.binary("<", _S.read(_v10, "r2"), _S.binary("+", 4, _S.read(_v10, "f")))) else 1) if _S.truth(_S.binary("<", _S.read(_v10, "r2"), _S.read(_v10, "core"))) else (1 if _S.truth(_S.read(_v10, "line")) else 2)), "=", false)
				else:
					_S.set_prop(_S.read(_v7, "m"), _S.binary("+", _S.binary("*", _S.read(_v7, "j"), _S.read(_v7, "W")), _S.read(_v7, "i")), (2 if _S.truth(_S.read(_v7, "line")) else 0), "=", false)
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "i", 1, "+=", true)
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "j", 1, "+=", true)
		_S.invoke(_S.read(_v3, "masks"), "push", [_S.read(_v3, "m")])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "f", 1, "+=", true)
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "FRAME")), 0.000001)]))
	if _S.truth(_S.binary(">=", _S.read(_e, "f"), 8)):
		return null
	_S.define(_e, "m", _S.prop(_S.read(_e, "masks"), _S.read(_e, "f")))
	_S.define(_e, "inv", _S.logical("||", _S.binary("===", _S.read(_e, "f"), 2), func(): return _S.binary("===", _S.read(_e, "f"), 3)))
	_S.define(_e, "ink", (_S.read(_e, "PAPER") if _S.truth(_S.read(_e, "inv")) else _S.read(_e, "INK")))
	_S.define(_e, "paper", (_S.read(_e, "INK") if _S.truth(_S.read(_e, "inv")) else _S.read(_e, "PAPER")))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.binary("+", _S.read(_e, "x0"), _S.read(_e, "W")), _S.binary("+", _S.read(_e, "y0"), _S.read(_e, "H")), _S.function_value(_e, "_f5")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "x0"))]))
	_S.define(_e, "j", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "y"), _S.read(_e, "y0"))]))
	if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "i"), 0), func(): return _S.binary("<", _S.read(_e, "j"), 0)), func(): return _S.binary(">=", _S.read(_e, "i"), _S.read(_e, "W"))), func(): return _S.binary(">=", _S.read(_e, "j"), _S.read(_e, "H")))):
		return null
	_S.define(_e, "v", _S.prop(_S.read(_e, "m"), _S.binary("+", _S.binary("*", _S.read(_e, "j"), _S.read(_e, "W")), _S.read(_e, "i"))))
	return (_S.read(_e, "ink") if _S.truth(_S.binary("===", _S.read(_e, "v"), 1)) else ((_S.read(_e, "paper") if _S.truth(_S.binary("<", _S.read(_e, "f"), 4)) else _S.read(_e, "PAPER")) if _S.truth(_S.binary("===", _S.read(_e, "v"), 2)) else 0))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "ph", _S.arg(_args, 1))
	return _S.binary("+", _S.binary("+", _S.binary("+", 10, _S.binary("*", 6, _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "a"), 5), _S.read(_e, "ph"))])]))), _S.binary("*", 4, _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "a"), 11), _S.binary("*", _S.read(_e, "ph"), 2.7))])]))), _S.binary("*", 2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "a"), 23), _S.read(_e, "ph"))])))
