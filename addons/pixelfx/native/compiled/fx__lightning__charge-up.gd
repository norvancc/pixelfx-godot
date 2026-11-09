@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/charge-up.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "edgeOf", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Charge up"}, {"desc": "Sparks streak and arcs whip in to a crackling core at the caster's hand that swells and pulses faster, then it flashes and bursts: bolts every way, a ring, a spray of sparks."}, {"tags": ["lightning", "electric", "charge", "spell", "power-up", "actor", "one-shot"]}, {"size": [272, 184]}, {"origin": [124, 148]}, {"duration": 2.7}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"charge": 1.6}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HOLD", _S.merge([_S.read(_e, "READY"), {"crouch": 3}, {"lean": _S.unary("-", 2)}, {"fx": 15}, {"fy": _S.unary("-", 21)}, {"bx": 9}, {"by": _S.unary("-", 17)}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "BURST", _S.merge([{"turn": 1.15}, {"y": _S.unary("-", 2)}, {"crouch": 0}, {"lean": _S.unary("-", 2)}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 37)}, {"bx": 14}, {"by": _S.unary("-", 36)}, {"ffx": _S.unary("-", 2)}, {"ffy": _S.unary("-", 6)}, {"fbx": 3}, {"fby": _S.unary("-", 6)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"poses": [[_S.unary("-", 0.36), _S.read(_e, "READY")], [0, _S.read(_e, "HOLD")], [0.8, _S.merge([_S.read(_e, "HOLD"), {"crouch": 4}])], [1.4, _S.merge([_S.read(_e, "HOLD"), {"crouch": 6}, {"lean": 0}])], [1.59, _S.merge([_S.read(_e, "HOLD"), {"crouch": 7}, {"lean": 0}])], [1.6, _S.read(_e, "BURST"), "snap"], [1.95, _S.merge([_S.read(_e, "BURST"), {"y": 0}, {"crouch": 2}, {"fy": _S.unary("-", 30)}, {"by": _S.unary("-", 30)}, {"ffy": _S.unary("-", 4)}, {"fby": _S.unary("-", 4)}])], [2.7, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": 1.6}, {"stop": 0.14}, {"shake": 0.3}, {"amp": 3}])]}, {"dust": [_S.merge([{"t": 1.6}, {"x": 10}, {"n": 6}, {"dir": 1}]), _S.merge([{"t": 1.6}, {"x": _S.unary("-", 10)}, {"n": 6}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "CX", 15)
	_S.define(_e, "CY", _S.unary("-", 21))
	_S.define(_e, "BK", [1, 0.7, 0.95, 0.5, 0.8, 0.35])
	_S.define(_e, "ASH", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "edges", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "A", _S.arg(_args, 0))
	_S.define(_e, "e", _S.invoke(_S.read(_e, "edges"), "get", [_S.prop(_S.read(_e, "A"), "mask")]))
	if _S.truth(_S.read(_e, "e")):
		return _S.read(_e, "e")
	_S.define(_e, "m", _S.prop(_S.read(_e, "A"), "mask"))
	_S.define(_e, "on", _S.function_value(_e, "_f1"))
	_S.write(_e, "e", [], "=", false)
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "y"), _S.prop(_S.read(_v0, "m"), "h"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "x"), _S.prop(_S.read(_v1, "m"), "w"))):
			if _S.truth(_S.logical("&&", _S.call_value(_S.read(_v1, "on"), [_S.read(_v1, "x"), _S.read(_v1, "y")]), func(): return _S.logical("||", _S.logical("||", _S.logical("||", _S.unary("!", _S.call_value(_S.read(_v1, "on"), [_S.binary("-", _S.read(_v1, "x"), 1), _S.read(_v1, "y")])), func(): return _S.unary("!", _S.call_value(_S.read(_v1, "on"), [_S.binary("+", _S.read(_v1, "x"), 1), _S.read(_v1, "y")]))), func(): return _S.unary("!", _S.call_value(_S.read(_v1, "on"), [_S.read(_v1, "x"), _S.binary("-", _S.read(_v1, "y"), 1)]))), func(): return _S.unary("!", _S.call_value(_S.read(_v1, "on"), [_S.read(_v1, "x"), _S.binary("+", _S.read(_v1, "y"), 1)]))))):
				_S.invoke(_S.read(_v1, "e"), "push", [[_S.binary("+", _S.prop(_S.read(_v1, "A"), "x"), _S.read(_v1, "x")), _S.binary("+", _S.prop(_S.read(_v1, "A"), "y"), _S.read(_v1, "y"))]])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "x", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	_S.invoke(_S.read(_e, "edges"), "set", [_S.prop(_S.read(_e, "A"), "mask"), _S.read(_e, "e")])
	return _S.read(_e, "e")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "x"), 0), func(): return _S.binary(">=", _S.read(_e, "y"), 0)), func(): return _S.binary("<", _S.read(_e, "x"), _S.prop(_S.read(_e, "m"), "w"))), func(): return _S.binary("<", _S.read(_e, "y"), _S.prop(_S.read(_e, "m"), "h"))), func(): return _S.prop(_S.prop(_S.read(_e, "m"), "data"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.prop(_S.read(_e, "m"), "w")), _S.read(_e, "x"))))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "REL", _S.prop(_S.read(_e, "o"), "charge"))
	_S.define(_e, "floor", _S.function_value(_e, "_f3"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "bolts", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 8}]), _S.function_value(_e, "_f4")]))
	_S.define(_e, "arcs", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "released", false)
	_S.define(_e, "phase", 0)
	_S.define(_e, "beats", [])
	_S.define(_e, "level", _S.function_value(_e, "_f5"))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f9")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 8), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.25), 0.25])))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "R"), "range", [44, 72]))
	_S.define(_e, "x1", _S.binary("+", _S.read(_e, "CX"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "L"))))
	_S.define(_e, "y1", _S.invoke(_S.read(_e, "Math"), "min", [0, _S.binary("+", _S.read(_e, "CY"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "L")))]))
	return _S.merge([{"x1": _S.read(_e, "x1")}, {"y1": _S.read(_e, "y1")}, {"t0": _S.binary("+", _S.read(_e, "REL"), _S.invoke(_S.read(_e, "R"), "range", [0, 0.05]))}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "REL"))])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "k", _S.call_value(_S.read(_e, "level"), []))
	_S.define(_e, "e", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "k")))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "REL"))):
		var _v2 = _S.scope(_e)
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "acc", _S.binary("*", _S.binary("+", 60, _S.binary("*", 360, _S.read(_v3, "e"))), _S.read(_v3, "dt")))
		while _S.truth(_S.binary(">", _S.read(_v3, "acc"), 0)):
			var _v4 = _S.scope(_v3)
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v4, "acc"), 1), func(): return _S.unary("!", _S.invoke(_S.read(_v4, "R"), "chance", [_S.read(_v4, "acc")])))):
				break
			_S.define(_v4, "a", _S.invoke(_S.read(_v4, "R"), "range", [0, _S.read(_v4, "TAU")]))
			_S.define(_v4, "d", _S.binary("*", _S.invoke(_S.read(_v4, "R"), "range", [30, 72]), _S.binary("-", 1, _S.binary("*", 0.35, _S.read(_v4, "k")))))
			_S.define(_v4, "life", _S.invoke(_S.read(_v4, "R"), "range", [0.16, 0.26]))
			_S.define(_v4, "sp", _S.binary("*", _S.binary("/", _S.read(_v4, "d"), _S.read(_v4, "life")), 0.95))
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "MOTE"), _S.binary("+", _S.read(_v4, "CX"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "d"))), _S.invoke(_S.read(_v4, "Math"), "min", [_S.unary("-", 2), _S.binary("+", _S.read(_v4, "CY"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "d")))]), _S.binary("-", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")])), _S.read(_v4, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "sp")), 0.4)), _S.binary("+", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")])), _S.read(_v4, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "sp")), 0.4)), _S.read(_v4, "life"), _S.invoke(_S.read(_v4, "R"), "pick", [[_S.prop(_S.read(_v4, "C"), 7), _S.prop(_S.read(_v4, "C"), 6), _S.prop(_S.read(_v4, "C"), 5)]]), 1])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "acc", 1, "-=", true)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v2, "k"), 0.2), func(): return _S.invoke(_S.read(_v2, "R"), "chance", [_S.binary("*", _S.binary("+", 2, _S.binary("*", 16, _S.read(_v2, "e"))), _S.read(_v2, "dt"))]))):
			var _v5 = _S.scope(_v2)
			_S.define(_v5, "a", _S.invoke(_S.read(_v5, "R"), "range", [0, _S.read(_v5, "TAU")]))
			_S.define(_v5, "d", _S.invoke(_S.read(_v5, "R"), "range", [20, 40]))
			_S.invoke(_S.read(_v5, "arcs"), "push", [_S.merge([{"x": _S.binary("+", _S.read(_v5, "CX"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "d")))}, {"y": _S.invoke(_S.read(_v5, "Math"), "min", [_S.unary("-", 3), _S.binary("+", _S.read(_v5, "CY"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "d")))])}, {"t": _S.read(_v5, "t")}, {"seed": _S.invoke(_S.read(_v5, "R"), "int", [0, 1000000])}])])
		_S.write(_v2, "phase", _S.binary("*", _S.binary("+", 1.5, _S.binary("*", 11, _S.read(_v2, "e"))), _S.read(_v2, "dt")), "+=", false)
		if _S.truth(_S.binary(">=", _S.read(_v2, "phase"), 1)):
			_S.last([_S.write(_v2, "phase", 1, "-=", false), _S.invoke(_S.read(_v2, "beats"), "push", [_S.read(_v2, "t")])])
		if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [_S.binary("*", _S.binary("*", 4, _S.read(_v2, "e")), _S.read(_v2, "dt"))])):
			_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "STAR"), _S.binary("+", _S.read(_v2, "CX"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 14), 14])), _S.binary("+", _S.read(_v2, "CY"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 14), 10])), 0, _S.unary("-", 4), _S.invoke(_S.read(_v2, "R"), "range", [0.2, 0.35]), _S.prop(_S.read(_v2, "C"), 6), _S.invoke(_S.read(_v2, "R"), "range", [1, 2])])
	else:
		if _S.truth(_S.unary("!", _S.read(_e, "released"))):
			var _v6 = _S.scope(_e)
			_S.write(_v6, "released", true, "=", false)
			_S.invoke(_S.read(_v6, "lights"), "add", [_S.read(_v6, "CX"), _S.read(_v6, "CY"), 110, _S.prop(_S.read(_v6, "C"), 4), 0.8, 0.5])
			_S.invoke(_S.read(_v6, "lights"), "add", [_S.read(_v6, "CX"), _S.read(_v6, "CY"), 28, _S.read(_v6, "WHITE"), 0.6, 0.08])
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v7, "i"), 70)):
				var _v8 = _S.scope(_v7)
				_S.define(_v8, "a", _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")]))
				_S.define(_v8, "sp", _S.binary("*", _S.invoke(_S.read(_v8, "R"), "range", [140, 330]), (0.55 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), 0.4)) else 1)))
				_S.invoke(_S.read(_v8, "ps"), "spawn", [(_S.prop(_S.read(_v8, "P"), "MOTE") if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.unary("-", 0.2)), func(): return _S.invoke(_S.read(_v8, "R"), "chance", [0.35]))) else _S.prop(_S.read(_v8, "P"), "SPARK")), _S.read(_v8, "CX"), _S.read(_v8, "CY"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), _S.invoke(_S.read(_v8, "R"), "range", [0.25, 0.55]), _S.invoke(_S.read(_v8, "R"), "pick", [[_S.prop(_S.read(_v8, "C"), 7), _S.prop(_S.read(_v8, "C"), 6), _S.prop(_S.read(_v8, "C"), 5)]]), _S.invoke(_S.read(_v8, "R"), "range", [0.8, 1.4])])
				_v7 = _S.iteration(_v7)
				_S.write(_v7, "i", 1, "+=", true)
			var _v9 = _S.scope(_v6)
			_S.define(_v9, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v9, "i"), 10)):
				var _v10 = _S.scope(_v9)
				_S.define(_v10, "a", _S.invoke(_S.read(_v10, "R"), "range", [0, _S.read(_v10, "TAU")]))
				_S.define(_v10, "sp", _S.invoke(_S.read(_v10, "R"), "range", [60, 160]))
				_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "STAR"), _S.read(_v10, "CX"), _S.read(_v10, "CY"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.invoke(_S.read(_v10, "R"), "range", [0.4, 0.8]), (_S.prop(_S.read(_v10, "C"), 6) if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.5])) else _S.prop(_S.read(_v10, "C"), 5)), _S.invoke(_S.read(_v10, "R"), "range", [1.2, 2.4])])
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "i", 1, "+=", true)
			var _v11 = _S.scope(_v6)
			_S.define(_v11, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v11, "i"), 4)):
				_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "SMOKE"), _S.binary("+", _S.read(_v11, "CX"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 5), 5])), _S.binary("+", _S.read(_v11, "CY"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 4), 4])), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v11, "R"), "range", [8, 18])), _S.invoke(_S.read(_v11, "R"), "range", [0.6, 0.85]), _S.call_value(_S.read(_v11, "mix"), [_S.read(_v11, "ASH"), _S.prop(_S.read(_v11, "C"), 4), 0.3]), _S.invoke(_S.read(_v11, "R"), "range", [3, 5]), _S.invoke(_S.read(_v11, "R"), "range", [0.05, 0.15])])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "i", 1, "+=", true)
	_S.write(_e, "beats", _S.invoke(_S.read(_e, "beats"), "filter", [_S.function_value(_e, "_f7")]), "=", false)
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", _S.binary("-", _S.prop(_S.read(_v12, "arcs"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v12, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v12, "t"), _S.prop(_S.prop(_S.read(_v12, "arcs"), _S.read(_v12, "i")), "t")), 0.07)):
			_S.invoke(_S.read(_v12, "arcs"), "splice", [_S.read(_v12, "i"), 1])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return _S.binary("<", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "b")), 0.22)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "level"), []))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "REL"))):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("*", _S.read(_e, "CX"), 0.5), _S.unary("-", 3), 40, _S.prop(_S.read(_e, "C"), 3), _S.binary("*", _S.binary("*", 0.3, _S.read(_e, "k")), _S.read(_e, "k"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "level"), []))
	_S.define(_e, "e", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "k")))
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 30), 0.0001)]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "REL"))):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "jit", (_S.binary("*", (1 if _S.truth(_S.binary("%", _S.read(_v13, "f"), 2)) else _S.unary("-", 1)), _S.binary("/", _S.binary("-", _S.read(_v13, "k"), 0.85), 0.15)) if _S.truth(_S.binary(">", _S.read(_v13, "k"), 0.85)) else 0))
		_S.define(_v13, "x", _S.binary("+", _S.read(_v13, "CX"), _S.read(_v13, "jit")))
		_S.define(_v13, "y", _S.read(_v13, "CY"))
		_S.define(_v13, "pr", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v13, "Math"), "sin", [_S.binary("*", _S.read(_v13, "phase"), _S.read(_v13, "TAU"))]))))
		for _v14 in _S.array(_S.call_value(_S.read(_v13, "edgeOf"), [_S.read(_v13, "A")])):
			var _v15 = _S.scope(_v13)
			var _v16 = _v14
			_S.define(_v15, "ex", _S.prop(_v16, 0))
			_S.define(_v15, "ey", _S.prop(_v16, 1))
			var _v17 = _S.scope(_v15)
			_S.define(_v17, "d", _S.invoke(_S.read(_v17, "Math"), "hypot", [_S.binary("-", _S.binary("+", _S.read(_v17, "ex"), 0.5), _S.read(_v17, "x")), _S.binary("-", _S.binary("+", _S.read(_v17, "ey"), 0.5), _S.read(_v17, "y"))]))
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v17, "d"), _S.binary("+", 6, _S.binary("*", 10, _S.read(_v17, "k")))), func(): return _S.binary(">", _S.read(_v17, "e"), 0.08))):
				_S.invoke(_S.read(_v17, "p"), "px", [_S.read(_v17, "ex"), _S.read(_v17, "ey"), (_S.prop(_S.read(_v17, "C"), 6) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v17, "d"), _S.binary("+", 4, _S.binary("*", 6, _S.read(_v17, "k")))), func(): return _S.binary(">", _S.read(_v17, "e"), 0.4))) else _S.prop(_S.read(_v17, "C"), 4))])
		for _v18 in _S.array(_S.read(_v13, "beats")):
			var _v19 = _S.scope(_v13)
			_S.define(_v19, "b", _v18)
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "q", _S.binary("/", _S.binary("-", _S.read(_v20, "t"), _S.read(_v20, "b")), 0.22))
			_S.invoke(_S.read(_v20, "p"), "ring", [_S.read(_v20, "x"), _S.read(_v20, "y"), _S.binary("+", 4, _S.binary("*", _S.binary("*", 20, _S.binary("-", 1, _S.invoke(_S.read(_v20, "ease"), "inQuad", [_S.read(_v20, "q")]))), _S.binary("+", 0.5, _S.read(_v20, "k")))), 1, (_S.prop(_S.read(_v20, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v20, "q"), 0.6)) else _S.prop(_S.read(_v20, "C"), 4)), _S.binary("+", 0.4, _S.binary("*", 0.6, _S.read(_v20, "q")))])
		for _v21 in _S.array(_S.read(_v13, "arcs")):
			var _v22 = _S.scope(_v13)
			_S.define(_v22, "a", _v21)
			_S.call_value(_S.read(_v22, "crackle"), [_S.read(_v22, "p"), _S.call_value(_S.read(_v22, "zigzag"), [_S.call_value(_S.read(_v22, "rng"), [_S.prop(_S.read(_v22, "a"), "seed"), _S.read(_v22, "f")]), _S.prop(_S.read(_v22, "a"), "x"), _S.prop(_S.read(_v22, "a"), "y"), _S.read(_v22, "x"), _S.read(_v22, "y"), 0.35, 0.4]), 0.85, _S.read(_v22, "C"), 0.4])
		_S.define(_v13, "r", _S.binary("+", _S.binary("+", 1.2, _S.binary("*", 6.5, _S.read(_v13, "e"))), _S.binary("*", _S.read(_v13, "pr"), _S.binary("+", 0.5, _S.binary("*", 1.2, _S.read(_v13, "k"))))))
		_S.invoke(_S.read(_v13, "p"), "circle", [_S.read(_v13, "x"), _S.read(_v13, "y"), _S.binary("+", _S.read(_v13, "r"), 1.3), _S.prop(_S.read(_v13, "C"), 2)])
		_S.invoke(_S.read(_v13, "p"), "circle", [_S.read(_v13, "x"), _S.read(_v13, "y"), _S.read(_v13, "r"), _S.prop(_S.read(_v13, "C"), 4)])
		_S.invoke(_S.read(_v13, "p"), "circle", [_S.binary("-", _S.read(_v13, "x"), _S.binary("*", _S.read(_v13, "r"), 0.12)), _S.binary("-", _S.read(_v13, "y"), _S.binary("*", _S.read(_v13, "r"), 0.12)), _S.binary("*", _S.read(_v13, "r"), 0.7), _S.prop(_S.read(_v13, "C"), 5)])
		_S.invoke(_S.read(_v13, "p"), "circle", [_S.read(_v13, "x"), _S.read(_v13, "y"), _S.binary("*", _S.read(_v13, "r"), 0.38), _S.read(_v13, "WHITE")])
		if _S.truth(_S.binary(">", _S.read(_v13, "r"), 3)):
			for _v23 in _S.array([0, _S.prop(_S.read(_v13, "Math"), "PI")]):
				var _v24 = _S.scope(_v13)
				_S.define(_v24, "s", _v23)
				var _v25 = _S.scope(_v24)
				_S.define(_v25, "a", 0)
				while _S.truth(_S.binary("<", _S.read(_v25, "a"), 1.3)):
					var _v26 = _S.scope(_v25)
					_S.define(_v26, "ang", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v26, "t"), 10), _S.read(_v26, "s")), _S.read(_v26, "a")))
					_S.define(_v26, "rr", _S.binary("*", _S.read(_v26, "r"), _S.binary("+", 0.62, _S.binary("*", 0.1, _S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("*", _S.read(_v26, "a"), 3)])))))
					_S.invoke(_S.read(_v26, "p"), "dot", [_S.binary("+", _S.read(_v26, "x"), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "ang")]), _S.read(_v26, "rr"))), _S.binary("+", _S.read(_v26, "y"), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "ang")]), _S.read(_v26, "rr"))), (_S.read(_v26, "WHITE") if _S.truth(_S.binary("<", _S.read(_v26, "a"), 0.5)) else _S.prop(_S.read(_v26, "C"), 6))])
					_v25 = _S.iteration(_v25)
					_S.write(_v25, "a", 0.12, "+=", false)
		if _S.truth(_S.binary(">", _S.read(_v13, "k"), 0.35)):
			var _v27 = _S.scope(_v13)
			_S.define(_v27, "q", _S.call_value(_S.read(_v27, "rng"), [_S.prop(_S.read(_v27, "o"), "seed"), 5, _S.read(_v27, "f")]))
			_S.define(_v27, "a", _S.invoke(_S.read(_v27, "q"), "range", [0, _S.read(_v27, "TAU")]))
			_S.define(_v27, "l", _S.binary("*", _S.invoke(_S.read(_v27, "q"), "range", [3, 6]), _S.binary("+", 0.5, _S.read(_v27, "k"))))
			_S.call_value(_S.read(_v27, "crackle"), [_S.read(_v27, "p"), _S.call_value(_S.read(_v27, "zigzag"), [_S.read(_v27, "q"), _S.binary("+", _S.read(_v27, "x"), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.read(_v27, "r"))), _S.binary("+", _S.read(_v27, "y"), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.read(_v27, "r"))), _S.binary("+", _S.read(_v27, "x"), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.binary("+", _S.read(_v27, "r"), _S.read(_v27, "l")))), _S.binary("+", _S.read(_v27, "y"), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.binary("+", _S.read(_v27, "r"), _S.read(_v27, "l")))), 0.4, 0.3]), 0.7, _S.read(_v27, "C"), 0.3])
		_S.invoke(_S.read(_v13, "p"), "glow", [_S.read(_v13, "x"), _S.read(_v13, "y"), _S.binary("+", 12, _S.binary("*", 30, _S.read(_v13, "k"))), _S.prop(_S.read(_v13, "C"), 4), _S.binary("+", 0.35, _S.binary("*", 0.45, _S.read(_v13, "k")))])
		_S.invoke(_S.read(_v13, "p"), "glow", [_S.read(_v13, "x"), _S.read(_v13, "y"), _S.binary("+", 6, _S.binary("*", 6, _S.read(_v13, "k"))), _S.prop(_S.read(_v13, "C"), 6), _S.binary("+", 0.25, _S.binary("*", 0.3, _S.read(_v13, "k")))])
	else:
		var _v28 = _S.scope(_e)
		_S.define(_v28, "a", _S.binary("-", _S.read(_v28, "t"), _S.read(_v28, "REL")))
		if _S.truth(_S.binary("<", _S.read(_v28, "a"), 0.07)):
			_S.invoke(_S.read(_v28, "p"), "mask", [_S.prop(_S.read(_v28, "A"), "mask"), _S.prop(_S.read(_v28, "A"), "x"), _S.prop(_S.read(_v28, "A"), "y"), (_S.read(_v28, "WHITE") if _S.truth(_S.binary("<", _S.read(_v28, "a"), 0.035)) else _S.prop(_S.read(_v28, "C"), 6))])
		if _S.truth(_S.binary("<", _S.read(_v28, "a"), 0.22)):
			var _v29 = _S.scope(_v28)
			_S.define(_v29, "q", _S.binary("/", _S.read(_v29, "a"), 0.22))
			_S.call_value(_S.read(_v29, "flare"), [_S.read(_v29, "p"), _S.read(_v29, "CX"), _S.read(_v29, "CY"), _S.binary("*", 46, _S.invoke(_S.read(_v29, "Math"), "pow", [_S.binary("-", 1, _S.read(_v29, "q")), 1.4])), _S.binary("-", 1, _S.read(_v29, "q")), _S.read(_v29, "C")])
			if _S.truth(_S.binary("<", _S.read(_v29, "q"), 0.3)):
				_S.invoke(_S.read(_v29, "p"), "circle", [_S.read(_v29, "CX"), _S.read(_v29, "CY"), _S.binary("+", _S.binary("*", 12, _S.binary("-", 1, _S.binary("*", _S.read(_v29, "q"), 2.5))), 1.5), _S.read(_v29, "WHITE")])
		for _v30 in _S.array(_S.invoke(_S.read(_v28, "bolts"), "entries", [])):
			var _v31 = _S.scope(_v28)
			var _v32 = _v30
			_S.define(_v31, "i", _S.prop(_v32, 0))
			_S.define(_v31, "b", _S.prop(_v32, 1))
			var _v33 = _S.scope(_v31)
			_S.define(_v33, "ba", _S.invoke(_S.read(_v33, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v33, "t"), _S.prop(_S.read(_v33, "b"), "t0")), 30), 0.0001)]))
			if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v33, "t"), _S.prop(_S.read(_v33, "b"), "t0")), func(): return _S.binary(">=", _S.read(_v33, "ba"), _S.prop(_S.read(_v33, "BK"), "length")))):
				continue
			_S.call_value(_S.read(_v33, "stroke"), [_S.read(_v33, "p"), _S.call_value(_S.read(_v33, "zigzag"), [_S.call_value(_S.read(_v33, "rng"), [_S.prop(_S.read(_v33, "o"), "seed"), 3, _S.read(_v33, "i"), _S.binary(">>", _S.read(_v33, "ba"), 1)]), _S.read(_v33, "CX"), _S.read(_v33, "CY"), _S.prop(_S.read(_v33, "b"), "x1"), _S.prop(_S.read(_v33, "b"), "y1"), 0.25, 0.75]), _S.prop(_S.read(_v33, "BK"), _S.read(_v33, "ba")), _S.read(_v33, "C"), (0.95 if _S.truth(_S.binary("===", _S.read(_v33, "ba"), 0)) else 0.75), _S.merge([{"hero": _S.binary("===", _S.read(_v33, "ba"), 0)}])])
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v33, "b"), "y1"), _S.unary("-", 1))):
				_S.invoke(_S.read(_v33, "p"), "glow", [_S.prop(_S.read(_v33, "b"), "x1"), _S.unary("-", 3), 18, _S.prop(_S.read(_v33, "C"), 5), _S.binary("*", 0.5, _S.prop(_S.read(_v33, "BK"), _S.read(_v33, "ba")))])
		_S.define(_v28, "q", _S.binary("/", _S.read(_v28, "a"), 0.45))
		if _S.truth(_S.binary("<", _S.read(_v28, "q"), 1)):
			var _v34 = _S.scope(_v28)
			_S.define(_v34, "r", _S.binary("+", 8, _S.binary("*", 80, _S.invoke(_S.read(_v34, "ease"), "outCubic", [_S.read(_v34, "q")]))))
			_S.define(_v34, "hide", _S.function_value(_v34, "_f10"))
			_S.invoke(_S.read(_v34, "p"), "ring", [_S.read(_v34, "CX"), _S.read(_v34, "CY"), _S.read(_v34, "r"), _S.invoke(_S.read(_v34, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_v34, "q")))]), (_S.read(_v34, "WHITE") if _S.truth(_S.binary("<", _S.read(_v34, "q"), 0.25)) else _S.prop(_S.read(_v34, "C"), 5)), _S.call_value(_S.read(_v34, "hide"), [_S.read(_v34, "r")])])
			_S.define(_v34, "r2", _S.binary("+", 6, _S.binary("*", 56, _S.invoke(_S.read(_v34, "ease"), "outCubic", [_S.invoke(_S.read(_v34, "Math"), "min", [1, _S.binary("*", _S.read(_v34, "q"), 1.3)])]))))
			_S.invoke(_S.read(_v34, "p"), "ring", [_S.read(_v34, "CX"), _S.read(_v34, "CY"), _S.read(_v34, "r2"), 1, _S.prop(_S.read(_v34, "C"), 4), _S.function_value(_v34, "_f12")])
			_S.invoke(_S.read(_v34, "p"), "glow", [_S.read(_v34, "CX"), _S.binary("-", _S.read(_v34, "CY"), 6), _S.invoke(_S.read(_v34, "Math"), "min", [_S.binary("*", _S.read(_v34, "r"), 0.9), 46]), _S.prop(_S.read(_v34, "C"), 3), _S.binary("*", _S.binary("*", 0.42, _S.binary("-", 1, _S.read(_v34, "q"))), _S.binary("-", 1, _S.read(_v34, "q")))])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v28, "a"), 0.15), func(): return _S.binary("<", _S.read(_v28, "a"), 0.5))):
			var _v35 = _S.scope(_v28)
			_S.define(_v35, "qq", _S.call_value(_S.read(_v35, "rng"), [_S.prop(_S.read(_v35, "o"), "seed"), 8, _S.read(_v35, "f")]))
			_S.define(_v35, "ang", _S.invoke(_S.read(_v35, "qq"), "range", [0, _S.read(_v35, "TAU")]))
			_S.define(_v35, "l", _S.invoke(_S.read(_v35, "qq"), "range", [5, 10]))
			_S.call_value(_S.read(_v35, "crackle"), [_S.read(_v35, "p"), _S.call_value(_S.read(_v35, "zigzag"), [_S.read(_v35, "qq"), _S.read(_v35, "CX"), _S.read(_v35, "CY"), _S.binary("+", _S.read(_v35, "CX"), _S.binary("*", _S.invoke(_S.read(_v35, "Math"), "cos", [_S.read(_v35, "ang")]), _S.read(_v35, "l"))), _S.binary("+", _S.read(_v35, "CY"), _S.binary("*", _S.invoke(_S.read(_v35, "Math"), "sin", [_S.read(_v35, "ang")]), _S.read(_v35, "l"))), 0.45, 0.3]), _S.binary("+", _S.binary("*", 0.8, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v35, "a"), 0.15), 0.35))), 0.15), _S.read(_v35, "C"), 0.3])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rr", _S.arg(_args, 0))
	return _S.function_value(_e, "_f11")

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "g", _S.arg(_args, 1))
	return (0 if _S.truth(_S.binary(">", _S.binary("+", _S.read(_e, "CY"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), _S.read(_e, "rr"))), _S.unary("-", 1))) else _S.binary("-", 1.1, _S.read(_e, "q")))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "g", _S.arg(_args, 1))
	return (0 if _S.truth(_S.binary(">", _S.binary("+", _S.read(_e, "CY"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), _S.read(_e, "r2"))), _S.unary("-", 1))) else _S.binary("-", 0.8, _S.read(_e, "q")))
