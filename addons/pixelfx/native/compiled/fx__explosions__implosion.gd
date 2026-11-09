@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/implosion.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "cull", _S.import_value("fx/explosions/_lib.js", "cull"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Implosion"}, {"desc": "Everything is sucked in: streaks and grit rush inward, rings contract and a dark sphere collapses onto a crushed white point; a beat of stillness, then a sharp pop."}, {"tags": ["implosion", "energy", "magic", "collapse", "pop", "one-shot"]}, {"size": [208, 184]}, {"origin": [104, 92]}, {"duration": 1.65}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#0a0614", "#1c1236", "#3a2470", "#6a44c0", "#a080f0", "#d8c8ff", "#ffffff"]}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SUCK", 0.8)
	_S.define(_e, "STILL", 1.02)
	_S.define(_e, "VOID", _S.call_value(_S.read(_e, "hex"), ["#05040a"]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "grit", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 70}]), _S.function_value(_e, "_f1")]))
	_S.define(_e, "rays", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 4}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t0", _S.invoke(_S.read(_e, "R"), "range", [0, 0.4]))
	return _S.merge([{"a": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}, {"d": _S.invoke(_S.read(_e, "R"), "range", [40, 86])}, {"t0": _S.read(_e, "t0")}, {"T": _S.invoke(_S.read(_e, "R"), "range", [0.3, _S.binary("-", _S.binary("-", _S.read(_e, "SUCK"), 0.04), _S.read(_e, "t0"))])}, {"spin": _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.6]))}, {"c": _S.invoke(_S.read(_e, "R"), "pick", [[_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.call_value(_S.read(_e, "hex"), ["#4a4458"]), _S.call_value(_S.read(_e, "hex"), ["#6e6880"])]])}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.binary("+", _S.binary("/", _S.binary("*", _S.read(_e, "i"), _S.read(_e, "TAU")), 4), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 4))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "SUCK"), 0.26))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "k", _S.binary("/", _S.read(_v0, "t"), _S.read(_v0, "SUCK")))
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "n", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "n"), _S.binary("+", 1, _S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("*", _S.read(_v1, "k"), 4)])))):
			var _v2 = _S.scope(_v1)
			if _S.truth(_S.unary("!", _S.invoke(_S.read(_v2, "R"), "chance", [0.9]))):
				_v1 = _S.iteration(_v1)
				_S.write(_v1, "n", 1, "+=", true)
				continue
			_S.define(_v2, "a", _S.invoke(_S.read(_v2, "R"), "range", [0, _S.read(_v2, "TAU")]))
			_S.define(_v2, "D", _S.binary("*", _S.invoke(_S.read(_v2, "R"), "range", [34, 82]), _S.binary("-", 1, _S.binary("*", 0.3, _S.read(_v2, "k")))))
			_S.define(_v2, "T", _S.invoke(_S.read(_v2, "R"), "range", [0.14, 0.24]))
			_S.define(_v2, "v", _S.binary("/", _S.binary("*", _S.read(_v2, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v2, "Math"), "exp", [_S.binary("*", 3, _S.read(_v2, "T"))]), 1)))
			_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), _S.read(_v2, "D")), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), _S.read(_v2, "D")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")])), _S.read(_v2, "v")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")])), _S.read(_v2, "v")), _S.read(_v2, "T"), (_S.prop(_S.read(_v2, "C"), 5) if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [0.5])) else _S.prop(_S.read(_v2, "C"), 4))])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "n", 1, "+=", true)
		if _S.truth(_S.invoke(_S.read(_v0, "R"), "chance", [_S.binary("*", 14, _S.read(_v0, "dt"))])):
			var _v3 = _S.scope(_v0)
			_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
			_S.define(_v3, "D", _S.invoke(_S.read(_v3, "R"), "range", [50, 80]))
			_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "VAPOUR"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "D")), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "D")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")])), 90), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")])), 90), _S.invoke(_S.read(_v3, "R"), "range", [0.4, 0.6]), _S.prop(_S.read(_v3, "C"), 3), _S.invoke(_S.read(_v3, "R"), "range", [3, 5])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "STILL")))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "popped", true, "=", false)
		_S.invoke(_S.read(_v4, "lights"), "add", [0, 0, 90, _S.prop(_S.read(_v4, "C"), 4), 1, 0.4])
		_S.invoke(_S.read(_v4, "lights"), "add", [0, 0, 30, _S.read(_v4, "WHITE"), 0.9, 0.08])
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 34)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "a", _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")]))
			_S.define(_v6, "sp", _S.invoke(_S.read(_v6, "R"), "range", [120, 330]))
			_S.invoke(_S.read(_v6, "ps"), "spawn", [(_S.prop(_S.read(_v6, "P"), "MOTE") if _S.truth(_S.invoke(_S.read(_v6, "R"), "chance", [0.6])) else _S.prop(_S.read(_v6, "P"), "STAR")), 0, 0, _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.invoke(_S.read(_v6, "R"), "range", [0.2, 0.45]), _S.invoke(_S.read(_v6, "R"), "pick", [[_S.prop(_S.read(_v6, "C"), 6), _S.prop(_S.read(_v6, "C"), 5), _S.prop(_S.read(_v6, "C"), 4)]]), _S.invoke(_S.read(_v6, "R"), "range", [0.8, 1.8])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 3), _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 3), _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 0), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 3), _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 1), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 3)])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "SUCK"))]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "STILL"))):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "vr", _S.binary("+", _S.binary("*", 64, _S.binary("-", 1, _S.invoke(_S.read(_v7, "ease"), "inCubic", [_S.read(_v7, "k")]))), 3))
		if _S.truth(_S.binary("<", _S.read(_v7, "k"), 1)):
			var _v8 = _S.scope(_v7)
			_S.invoke(_S.read(_v8, "p"), "disc", [0, 0, _S.read(_v8, "vr"), _S.read(_v8, "VOID"), _S.binary("+", 0.35, _S.binary("*", 0.35, _S.read(_v8, "k")))])
			_S.invoke(_S.read(_v8, "p"), "ring", [0, 0, _S.binary("+", _S.read(_v8, "vr"), 1), 1, (_S.prop(_S.read(_v8, "C"), 3) if _S.truth(_S.binary("<", _S.read(_v8, "k"), 0.5)) else _S.prop(_S.read(_v8, "C"), 4)), _S.binary("+", 0.5, _S.binary("*", 0.5, _S.read(_v8, "k")))])
			_S.invoke(_S.read(_v8, "p"), "glowRing", [0, 0, _S.read(_v8, "vr"), 5, _S.prop(_S.read(_v8, "C"), 4), _S.binary("+", 0.18, _S.binary("*", 0.3, _S.read(_v8, "k")))])
		var _v9 = _S.scope(_v7)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 4)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "u", _S.binary("/", _S.binary("-", _S.read(_v10, "t"), _S.binary("*", _S.read(_v10, "i"), 0.17)), 0.34))
			if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v10, "u"), 0), func(): return _S.binary(">=", _S.read(_v10, "u"), 1))):
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "i", 1, "+=", true)
				continue
			_S.define(_v10, "r", _S.binary("+", _S.binary("*", _S.binary("-", 70, _S.binary("*", _S.read(_v10, "i"), 8)), _S.binary("-", 1, _S.invoke(_S.read(_v10, "ease"), "inQuad", [_S.read(_v10, "u")]))), 2))
			_S.invoke(_S.read(_v10, "p"), "ring", [0, 0, _S.read(_v10, "r"), (2 if _S.truth(_S.binary(">", _S.read(_v10, "u"), 0.7)) else 1), (_S.prop(_S.read(_v10, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v10, "u"), 0.6)) else _S.prop(_S.read(_v10, "C"), 3)), _S.binary("+", 0.4, _S.binary("*", 0.6, _S.read(_v10, "u")))])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
		for _v11 in _S.array(_S.read(_v7, "grit")):
			var _v12 = _S.scope(_v7)
			_S.define(_v12, "q", _v11)
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "u", _S.binary("/", _S.binary("-", _S.read(_v13, "t"), _S.prop(_S.read(_v13, "q"), "t0")), _S.prop(_S.read(_v13, "q"), "T")))
			if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v13, "u"), 0), func(): return _S.binary(">=", _S.read(_v13, "u"), 1))):
				continue
			_S.define(_v13, "d", _S.binary("*", _S.prop(_S.read(_v13, "q"), "d"), _S.binary("-", 1, _S.invoke(_S.read(_v13, "ease"), "inCubic", [_S.read(_v13, "u")]))))
			_S.define(_v13, "a", _S.binary("+", _S.prop(_S.read(_v13, "q"), "a"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v13, "q"), "spin"), _S.invoke(_S.read(_v13, "ease"), "inQuad", [_S.read(_v13, "u")])), 2)))
			_S.define(_v13, "x", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "d")))
			_S.define(_v13, "y", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "d")))
			_S.define(_v13, "x2", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.binary("-", _S.read(_v13, "a"), _S.binary("*", _S.prop(_S.read(_v13, "q"), "spin"), 0.1))]), _S.binary("+", _S.binary("+", _S.read(_v13, "d"), _S.binary("*", _S.binary("*", 4, _S.read(_v13, "u")), _S.read(_v13, "u"))), 0.5)))
			_S.define(_v13, "y2", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.binary("-", _S.read(_v13, "a"), _S.binary("*", _S.prop(_S.read(_v13, "q"), "spin"), 0.1))]), _S.binary("+", _S.binary("+", _S.read(_v13, "d"), _S.binary("*", _S.binary("*", 4, _S.read(_v13, "u")), _S.read(_v13, "u"))), 0.5)))
			_S.invoke(_S.read(_v13, "p"), "line", [_S.read(_v13, "x2"), _S.read(_v13, "y2"), _S.read(_v13, "x"), _S.read(_v13, "y"), _S.function_value(_v13, "_f5")])
		_S.define(_v7, "still", _S.binary(">", _S.read(_v7, "t"), _S.read(_v7, "SUCK")))
		_S.define(_v7, "jit", ((0.5 if _S.truth(_S.binary("%", _S.invoke(_S.read(_v7, "Math"), "floor", [_S.binary("*", _S.read(_v7, "t"), 40)]), 2)) else _S.unary("-", 0.5)) if _S.truth(_S.read(_v7, "still")) else 0))
		_S.define(_v7, "cr", (1.6 if _S.truth(_S.read(_v7, "still")) else _S.binary("+", 1, _S.binary("*", _S.binary("*", _S.binary("*", 3.5, _S.binary("-", 1, _S.read(_v7, "k"))), _S.read(_v7, "k")), 4))))
		_S.invoke(_S.read(_v7, "p"), "disc", [_S.read(_v7, "jit"), 0, _S.binary("+", _S.read(_v7, "cr"), 3.5), _S.read(_v7, "VOID"), 0.85])
		_S.invoke(_S.read(_v7, "p"), "circle", [_S.read(_v7, "jit"), 0, _S.binary("+", _S.read(_v7, "cr"), 1.2), _S.prop(_S.read(_v7, "C"), 4)])
		_S.invoke(_S.read(_v7, "p"), "circle", [_S.read(_v7, "jit"), 0, _S.read(_v7, "cr"), _S.read(_v7, "WHITE")])
		_S.invoke(_S.read(_v7, "p"), "glow", [0, 0, _S.binary("+", 10, _S.binary("*", 26, _S.read(_v7, "k"))), _S.prop(_S.read(_v7, "C"), 4), _S.binary("+", 0.3, _S.binary("*", 0.5, _S.read(_v7, "k")))])
		if _S.truth(_S.read(_v7, "still")):
			_S.invoke(_S.read(_v7, "p"), "glow", [0, 0, 8, _S.read(_v7, "WHITE"), _S.binary("+", 0.4, _S.binary("*", 0.2, _S.invoke(_S.read(_v7, "Math"), "sin", [_S.binary("*", _S.read(_v7, "t"), 60)])))])
	else:
		var _v14 = _S.scope(_e)
		_S.define(_v14, "q", _S.binary("/", _S.binary("-", _S.read(_v14, "t"), _S.read(_v14, "STILL")), 0.5))
		_S.define(_v14, "e", _S.invoke(_S.read(_v14, "ease"), "outCubic", [_S.call_value(_S.read(_v14, "clamp"), [_S.read(_v14, "q")])]))
		if _S.truth(_S.binary("<", _S.read(_v14, "q"), 0.08)):
			_S.invoke(_S.read(_v14, "p"), "circle", [0, 0, _S.binary("+", _S.binary("*", 6, _S.binary("-", 1, _S.binary("/", _S.read(_v14, "q"), 0.08))), 1), _S.read(_v14, "WHITE")])
		if _S.truth(_S.binary("<", _S.read(_v14, "q"), 0.35)):
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "L", _S.binary("+", _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_v15, "q"), 0.35)), 34), 3))
			for _v16 in _S.array(_S.read(_v15, "rays")):
				var _v17 = _S.scope(_v15)
				_S.define(_v17, "a", _v16)
				var _v18 = _S.scope(_v17)
				_S.define(_v18, "d", 0)
				while _S.truth(_S.binary("<=", _S.read(_v18, "d"), _S.read(_v18, "L"))):
					_S.invoke(_S.read(_v18, "p"), "dot", [_S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.read(_v18, "a")]), _S.read(_v18, "d")), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.read(_v18, "a")]), _S.read(_v18, "d")), (_S.read(_v18, "WHITE") if _S.truth(_S.binary("<", _S.read(_v18, "d"), _S.binary("*", _S.read(_v18, "L"), 0.4))) else _S.prop(_S.read(_v18, "C"), 5)), (1 if _S.truth(_S.binary("<", _S.read(_v18, "d"), _S.binary("*", _S.read(_v18, "L"), 0.7))) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.binary("/", _S.read(_v18, "d"), _S.read(_v18, "L")), 0.7), 0.3)))])
					_v18 = _S.iteration(_v18)
					_S.write(_v18, "d", 0.5, "+=", false)
			for _v19 in _S.array(_S.read(_v15, "rays")):
				var _v20 = _S.scope(_v15)
				_S.define(_v20, "a", _v19)
				var _v21 = _S.scope(_v20)
				_S.define(_v21, "d", 0)
				while _S.truth(_S.binary("<=", _S.read(_v21, "d"), _S.binary("*", _S.read(_v21, "L"), 0.45))):
					_S.invoke(_S.read(_v21, "p"), "dot", [_S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.binary("+", _S.read(_v21, "a"), _S.binary("/", _S.prop(_S.read(_v21, "Math"), "PI"), 4))]), _S.read(_v21, "d")), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.binary("+", _S.read(_v21, "a"), _S.binary("/", _S.prop(_S.read(_v21, "Math"), "PI"), 4))]), _S.read(_v21, "d")), _S.prop(_S.read(_v21, "C"), 5), _S.binary("-", 1, _S.binary("/", _S.read(_v21, "d"), _S.binary("*", _S.read(_v21, "L"), 0.45)))])
					_v21 = _S.iteration(_v21)
					_S.write(_v21, "d", 0.5, "+=", false)
		if _S.truth(_S.binary("<", _S.read(_v14, "q"), 1)):
			var _v22 = _S.scope(_v14)
			_S.invoke(_S.read(_v22, "p"), "ring", [0, 0, _S.binary("+", 4, _S.binary("*", 74, _S.read(_v22, "e"))), _S.invoke(_S.read(_v22, "Math"), "max", [1, _S.binary("*", 2.5, _S.binary("-", 1, _S.read(_v22, "q")))]), (_S.read(_v22, "WHITE") if _S.truth(_S.binary("<", _S.read(_v22, "q"), 0.2)) else _S.prop(_S.read(_v22, "C"), 5)), _S.binary("-", 1.15, _S.read(_v22, "q"))])
			_S.invoke(_S.read(_v22, "p"), "ring", [0, 0, _S.binary("+", 2, _S.binary("*", 40, _S.invoke(_S.read(_v22, "ease"), "outCubic", [_S.call_value(_S.read(_v22, "clamp"), [_S.binary("*", _S.read(_v22, "q"), 1.4)])]))), 1, _S.prop(_S.read(_v22, "C"), 4), _S.binary("-", 1, _S.read(_v22, "q"))])
		if _S.truth(_S.binary("<", _S.read(_v14, "q"), 0.6)):
			_S.call_value(_S.read(_v14, "sparkle"), [_S.read(_v14, "p"), 0, 0, _S.binary("*", 5, _S.binary("-", 1, _S.binary("/", _S.read(_v14, "q"), 0.6))), _S.read(_v14, "WHITE"), _S.prop(_S.read(_v14, "C"), 5), 0.6])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	return (_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "q"), "c"), _S.read(_e, "VOID"), 0.4]) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.5)) else _S.prop(_S.read(_e, "q"), "c"))
