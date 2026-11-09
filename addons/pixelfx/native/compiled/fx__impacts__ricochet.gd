@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/ricochet.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "stone", _S.import_value("fx/impacts/_lib.js", "stone"))
	_S.define(_e, "spikes", _S.import_value("fx/impacts/_lib.js", "spikes"))
	_S.define(_e, "star", _S.import_value("fx/impacts/_lib.js", "star"))
	_S.define(_e, "SOOT", _S.import_value("fx/impacts/_lib.js", "SOOT"))
	_S.define(_e, "tracer", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Ricochet"}, {"desc": "A tracer streaks down onto the floor, glances off with a white-hot star and skips away at an angle, leaving a glowing skid while sparks skitter along the ground."}, {"tags": ["impact", "ricochet", "bullet", "tracer", "sparks", "ground", "directional", "one-shot"]}, {"size": [232, 84]}, {"origin": [64, 60]}, {"duration": 1.1}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffe26b", "#fff3a6", "#ffffff"]}, {"stone": "#5b5079"}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIT", 0.05)
	_S.define(_e, "SPEED", 760)
	_S.define(_e, "IN", 0.32)
	_S.define(_e, "OUT", _S.unary("-", 0.21))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "hx", _S.arg(_args, 1))
	_S.define(_e, "hy", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "L", _S.arg(_args, 4))
	_S.define(_e, "C", _S.arg(_args, 5))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "d", 0)
	while _S.truth(_S.binary("<=", _S.read(_v0, "d"), _S.read(_v0, "L"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "u", _S.binary("/", _S.read(_v1, "d"), _S.read(_v1, "L")))
		_S.invoke(_S.read(_v1, "p"), "dot", [_S.binary("-", _S.read(_v1, "hx"), _S.binary("*", _S.read(_v1, "c"), _S.read(_v1, "d"))), _S.binary("-", _S.read(_v1, "hy"), _S.binary("*", _S.read(_v1, "s"), _S.read(_v1, "d"))), (_S.read(_v1, "WHITE") if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.12)) else (_S.prop(_S.read(_v1, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.45)) else (_S.prop(_S.read(_v1, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.75)) else _S.prop(_S.read(_v1, "C"), 2)))), (1 if _S.truth(_S.binary("<", _S.read(_v1, "u"), 0.45)) else _S.binary("*", _S.read(_v1, "k"), _S.binary("-", 1.25, _S.read(_v1, "u"))))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "d", 0.5, "+=", false)
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "hx"), _S.read(_e, "hy"), 9, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.6, _S.read(_e, "k"))])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "sp", _S.call_value(_S.read(_e, "spikes"), [_S.read(_e, "R"), 9, _S.read(_e, "OUT"), _S.merge([{"len": [6, 9]}, {"w": [1.4, 1.9]}, {"fwd": 2.6}, {"back": 0.6}])]))
	for _v2 in _S.array(_S.read(_e, "sp")):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "s", _v2)
		var _v4 = _S.scope(_v3)
		if _S.truth(_S.binary(">", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.prop(_S.read(_v4, "s"), "a")]), 0.2)):
			_S.set_prop(_S.read(_v4, "s"), "len", 0.3, "*=", false)
		if _S.truth(_S.binary(">", _S.invoke(_S.read(_v4, "Math"), "abs", [_S.invoke(_S.read(_v4, "Math"), "sin", [_S.binary("-", _S.prop(_S.read(_v4, "s"), "a"), _S.read(_v4, "OUT"))])]), 0.6)):
			_S.set_prop(_S.read(_v4, "s"), "len", 0.65, "*=", false)
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"drawBack": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v5 = _S.scope(_e)
		_S.write(_v5, "hit", true, "=", false)
		_S.invoke(_S.read(_v5, "lights"), "add", [0, _S.unary("-", 2), 44, _S.prop(_S.read(_v5, "C"), 4), 0.65, 0.25])
		_S.invoke(_S.read(_v5, "lights"), "add", [0, _S.unary("-", 1), 14, _S.read(_v5, "WHITE"), 0.6, 0.06])
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 18)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "low", _S.binary("<", _S.read(_v7, "i"), 12))
			_S.define(_v7, "a", _S.binary("+", _S.read(_v7, "OUT"), (_S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 0.22), 0.12]) if _S.truth(_S.read(_v7, "low")) else _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 0.7), 0.25]))))
			_S.define(_v7, "v", _S.binary("*", _S.invoke(_S.read(_v7, "R"), "range", [260, 520]), (1 if _S.truth(_S.read(_v7, "low")) else 0.7)))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SPARK"), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 1), 2]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "v")), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "v")), _S.binary("*", _S.invoke(_S.read(_v7, "R"), "range", [0.15, 0.42]), (1.3 if _S.truth(_S.read(_v7, "low")) else 1)), _S.read(_v7, "WHITE"), 1, (_S.invoke(_S.read(_v7, "R"), "range", [0, 0.05]) if _S.truth(_S.read(_v7, "low")) else 0)])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
		var _v8 = _S.scope(_v5)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), 7)):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v9, "Math"), "PI")), 2), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 0.2), 0.9])))
			_S.define(_v9, "v", _S.invoke(_S.read(_v9, "R"), "range", [60, 170]))
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "GRIT"), _S.invoke(_S.read(_v9, "R"), "range", [0, 4]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "v")), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "v")), _S.invoke(_S.read(_v9, "R"), "range", [0.6, 0.95]), _S.invoke(_S.read(_v9, "R"), "pick", [[_S.prop(_S.read(_v9, "st"), "light"), _S.prop(_S.read(_v9, "st"), "body"), _S.prop(_S.read(_v9, "st"), "lip")]]), (2 if _S.truth(_S.binary("<", _S.read(_v9, "i"), 2)) else 1)])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
		var _v10 = _S.scope(_v5)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), 4)):
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "DUST"), _S.invoke(_S.read(_v10, "R"), "range", [0, 8]), _S.unary("-", 1), _S.invoke(_S.read(_v10, "R"), "range", [20, 70]), _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [4, 16])), _S.invoke(_S.read(_v10, "R"), "range", [0.25, 0.45]), _S.call_value(_S.read(_v10, "mix"), [_S.prop(_S.read(_v10, "st"), "dust"), _S.read(_v10, "WHITE"), _S.invoke(_S.read(_v10, "R"), "range", [0.1, 0.3])]), _S.invoke(_S.read(_v10, "R"), "range", [1.2, 2])])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")))
	if _S.truth(_S.binary(">=", _S.read(_e, "u"), 0)):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "heat", _S.invoke(_S.read(_v11, "Math"), "pow", [_S.call_value(_S.read(_v11, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.read(_v11, "u"), 0.85))]), 1.2]))
		_S.define(_v11, "fade", _S.binary("-", 1, _S.call_value(_S.read(_v11, "smooth"), [_S.binary("-", _S.read(_v11, "D"), 0.4), _S.binary("-", _S.read(_v11, "D"), 0.05), _S.read(_v11, "t")])))
		_S.define(_v11, "L", _S.binary("*", 12, _S.invoke(_S.read(_v11, "Math"), "min", [1, _S.binary("/", _S.read(_v11, "u"), 0.03)])))
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "x", _S.unary("-", 3))
		while _S.truth(_S.binary("<=", _S.read(_v12, "x"), _S.read(_v12, "L"))):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "q", _S.binary("/", _S.binary("+", _S.read(_v13, "x"), 3), 15))
			_S.define(_v13, "h", _S.binary("*", _S.read(_v13, "heat"), _S.binary("-", 1.15, _S.binary("*", _S.read(_v13, "q"), 0.6))))
			_S.invoke(_S.read(_v13, "p"), "dot", [_S.read(_v13, "x"), 0, (_S.read(_v13, "WHITE") if _S.truth(_S.binary(">", _S.read(_v13, "h"), 0.8)) else (_S.prop(_S.read(_v13, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v13, "h"), 0.55)) else (_S.prop(_S.read(_v13, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v13, "h"), 0.35)) else (_S.prop(_S.read(_v13, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v13, "h"), 0.18)) else (_S.prop(_S.read(_v13, "C"), 2) if _S.truth(_S.binary(">", _S.read(_v13, "h"), 0.08)) else _S.read(_v13, "SOOT")))))), _S.read(_v13, "fade")])
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v13, "x"), _S.unary("-", 2)), func(): return _S.binary("<", _S.read(_v13, "x"), _S.binary("-", _S.read(_v13, "L"), 2))), func(): return _S.binary("===", _S.binary("&", _S.read(_v13, "x"), 1), 0))):
				_S.invoke(_S.read(_v13, "p"), "dot", [_S.read(_v13, "x"), 1, (_S.prop(_S.read(_v13, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v13, "h"), 0.4)) else _S.read(_v13, "SOOT")), _S.binary("*", _S.read(_v13, "fade"), 0.7)])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "x", 1, "+=", true)
		if _S.truth(_S.binary(">", _S.read(_v11, "heat"), 0)):
			_S.invoke(_S.read(_v11, "p"), "glowLine", [_S.unary("-", 3), 0, _S.read(_v11, "L"), 0, 5, _S.prop(_S.read(_v11, "C"), 3), _S.binary("*", 0.45, _S.read(_v11, "heat"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT"))):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "d", _S.binary("*", _S.binary("-", _S.read(_v14, "HIT"), _S.read(_v14, "t")), _S.read(_v14, "SPEED")))
		_S.call_value(_S.read(_v14, "tracer"), [_S.read(_v14, "p"), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "IN")])), _S.read(_v14, "d")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "IN")])), _S.read(_v14, "d")), _S.read(_v14, "IN"), 22, _S.read(_v14, "C")])
	else:
		var _v15 = _S.scope(_e)
		_S.define(_v15, "u", _S.binary("-", _S.read(_v15, "t"), _S.read(_v15, "HIT")))
		if _S.truth(_S.binary("<", _S.read(_v15, "u"), 0.03)):
			_S.call_value(_S.read(_v15, "star"), [_S.read(_v15, "p"), 0, _S.unary("-", 1), _S.read(_v15, "sp"), 1, 1, [_S.prop(_S.read(_v15, "C"), 2), _S.prop(_S.read(_v15, "C"), 5), _S.prop(_S.read(_v15, "C"), 4), _S.read(_v15, "WHITE")], 1, 2])
		else:
			if _S.truth(_S.binary("<", _S.read(_v15, "u"), 0.06)):
				_S.call_value(_S.read(_v15, "star"), [_S.read(_v15, "p"), 0, _S.unary("-", 1), _S.read(_v15, "sp"), 1.25, 0.55, [_S.prop(_S.read(_v15, "C"), 1), _S.prop(_S.read(_v15, "C"), 4), _S.prop(_S.read(_v15, "C"), 3), _S.prop(_S.read(_v15, "C"), 5)], 1, 2])
		if _S.truth(_S.binary("<", _S.read(_v15, "u"), 0.2)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "head", _S.binary("+", 4, _S.binary("*", _S.read(_v16, "u"), _S.read(_v16, "SPEED"))))
			_S.define(_v16, "k", _S.binary("-", 1, _S.binary("/", _S.read(_v16, "u"), 0.2)))
			_S.call_value(_S.read(_v16, "tracer"), [_S.read(_v16, "p"), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "OUT")]), _S.read(_v16, "head")), _S.binary("+", _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "OUT")]), _S.read(_v16, "head"))), _S.read(_v16, "OUT"), _S.invoke(_S.read(_v16, "Math"), "min", [_S.binary("-", _S.read(_v16, "head"), 2), _S.binary("+", 18, _S.binary("*", _S.read(_v16, "u"), 200))]), _S.read(_v16, "C"), _S.read(_v16, "k")])
		_S.define(_v15, "g", _S.binary("/", _S.binary("-", _S.read(_v15, "u"), 0.02), 0.2))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v15, "g"), 0), func(): return _S.binary("<", _S.read(_v15, "g"), 1))):
			var _v17 = _S.scope(_v15)
			_S.define(_v17, "r", _S.binary("+", 5, _S.binary("*", 12, _S.binary("-", 1, _S.invoke(_S.read(_v17, "Math"), "pow", [_S.binary("-", 1, _S.read(_v17, "g")), 3])))))
			_S.define(_v17, "c", (_S.prop(_S.read(_v17, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v17, "g"), 0.3)) else (_S.prop(_S.read(_v17, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v17, "g"), 0.6)) else _S.prop(_S.read(_v17, "C"), 3))))
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "j", 0)
			_S.define(_v18, "n", _S.invoke(_S.read(_v18, "Math"), "ceil", [_S.binary("*", _S.binary("*", _S.read(_v18, "r"), _S.prop(_S.read(_v18, "Math"), "PI")), 1.3)]))
			while _S.truth(_S.binary("<=", _S.read(_v18, "j"), _S.read(_v18, "n"))):
				var _v19 = _S.scope(_v18)
				_S.define(_v19, "a", _S.binary("+", _S.unary("-", _S.prop(_S.read(_v19, "Math"), "PI")), _S.binary("*", _S.binary("/", _S.read(_v19, "j"), _S.read(_v19, "n")), _S.prop(_S.read(_v19, "Math"), "PI"))))
				_S.invoke(_S.read(_v19, "p"), "dot", [_S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "r")), _S.binary("+", _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]), _S.read(_v19, "r"))), _S.read(_v19, "c"), _S.binary("-", 1.15, _S.read(_v19, "g"))])
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "j", 1, "+=", true)
		_S.define(_v15, "pop", _S.invoke(_S.read(_v15, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_v15, "u")), 0.045)]))
		if _S.truth(_S.binary(">", _S.read(_v15, "pop"), 0.02)):
			var _v20 = _S.scope(_v15)
			_S.invoke(_S.read(_v20, "p"), "glow", [0, _S.unary("-", 2), 22, _S.prop(_S.read(_v20, "C"), 3), _S.binary("*", 0.75, _S.read(_v20, "pop"))])
			_S.invoke(_S.read(_v20, "p"), "glow", [0, _S.unary("-", 1), 8, _S.read(_v20, "WHITE"), _S.binary("*", 0.5, _S.read(_v20, "pop"))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
