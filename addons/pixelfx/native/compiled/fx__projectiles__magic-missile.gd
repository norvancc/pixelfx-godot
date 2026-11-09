@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/magic-missile.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Magic missile"}, {"desc": "Motes gather into an arcane orb at a hand `height` px above the floor (the origin); it weaves to its target trailing a twisting ribbon and bursts into a star of light."}, {"tags": ["projectile", "magic", "arcane", "missile", "spell", "directional", "one-shot"]}, {"size": [208, 112]}, {"origin": [24, 104]}, {"duration": 1.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#140a26", "#2b1252", "#481c88", "#6b2cc0", "#9a48ec", "#c684ff", "#ecc8ff", "#ffffff"]}, {"height": 26}, {"reach": 112}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CHARGE", 0.2)
	_S.define(_e, "FLY", 0.62)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "X1", _S.prop(_S.read(_e, "o"), "reach"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "pos", _S.function_value(_e, "_f2"))
	_S.define(_e, "t", 0)
	_S.define(_e, "burst", false)
	_S.define(_e, "trail", [])
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return [_S.binary("+", _S.binary("*", _S.read(_e, "X1"), _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.read(_e, "u")])), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "u"), _S.prop(_S.read(_e, "Math"), "PI"))]), 6)), _S.binary("+", _S.unary("-", _S.read(_e, "H")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "TAU")), 1.5)]), 9), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "u"), _S.prop(_S.read(_e, "Math"), "PI"))])))]

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CHARGE"))):
		var _v0 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v0, "R"), "chance", [0.8])):
			var _v1 = _S.scope(_v0)
			_S.define(_v1, "a", _S.invoke(_S.read(_v1, "R"), "range", [0, _S.read(_v1, "TAU")]))
			_S.define(_v1, "d", _S.invoke(_S.read(_v1, "R"), "range", [12, 26]))
			_S.define(_v1, "sp", _S.binary("/", _S.read(_v1, "d"), 0.14))
			_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "MOTE"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "d")), _S.binary("+", _S.unary("-", _S.read(_v1, "H")), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "d"))), _S.binary("-", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")])), _S.read(_v1, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), 0.5)), _S.binary("+", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")])), _S.read(_v1, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), 0.5)), 0.14, _S.invoke(_S.read(_v1, "R"), "pick", [[_S.prop(_S.read(_v1, "C"), 5), _S.prop(_S.read(_v1, "C"), 6), _S.read(_v1, "WHITE")]]), 0.8])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CHARGE"), _S.read(_e, "FLY")))):
			var _v2 = _S.scope(_e)
			_S.define(_v2, "u", _S.binary("/", _S.binary("-", _S.read(_v2, "t"), _S.read(_v2, "CHARGE")), _S.read(_v2, "FLY")))
			var _v3 = _S.call_value(_S.read(_v2, "pos"), [_S.read(_v2, "u")])
			_S.define(_v2, "x", _S.prop(_v3, 0))
			_S.define(_v2, "y", _S.prop(_v3, 1))
			_S.invoke(_S.read(_v2, "trail"), "push", [_S.merge([{"x": _S.read(_v2, "x")}, {"y": _S.read(_v2, "y")}, {"t": _S.read(_v2, "t")}])])
			if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [0.6])):
				_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "MOTE"), _S.read(_v2, "x"), _S.read(_v2, "y"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 50), 50]), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 50), 50]), _S.invoke(_S.read(_v2, "R"), "range", [0.2, 0.4]), _S.invoke(_S.read(_v2, "R"), "pick", [[_S.prop(_S.read(_v2, "C"), 4), _S.prop(_S.read(_v2, "C"), 5), _S.prop(_S.read(_v2, "C"), 6)]]), 0.7])
			if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [0.25])):
				_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "STAR"), _S.binary("+", _S.read(_v2, "x"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("+", _S.read(_v2, "y"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 3), 3])), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v2, "R"), "range", [0.25, 0.5]), _S.prop(_S.read(_v2, "C"), 6), _S.invoke(_S.read(_v2, "R"), "range", [0.6, 1.6])])
		else:
			if _S.truth(_S.unary("!", _S.read(_e, "burst"))):
				var _v4 = _S.scope(_e)
				_S.write(_v4, "burst", true, "=", false)
				_S.define(_v4, "y", _S.unary("-", _S.read(_v4, "H")))
				_S.invoke(_S.read(_v4, "lights"), "add", [_S.read(_v4, "X1"), _S.read(_v4, "y"), 52, _S.prop(_S.read(_v4, "C"), 4), 0.95, 0.55])
				_S.invoke(_S.read(_v4, "lights"), "add", [_S.read(_v4, "X1"), _S.read(_v4, "y"), 22, _S.read(_v4, "WHITE"), 0.8, 0.12])
				var _v5 = _S.scope(_v4)
				_S.define(_v5, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v5, "i"), 26)):
					var _v6 = _S.scope(_v5)
					_S.define(_v6, "a", _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")]))
					_S.define(_v6, "sp", _S.binary("*", _S.invoke(_S.read(_v6, "R"), "range", [60, 150]), _S.binary("-", 1, _S.binary("*", 0.65, _S.invoke(_S.read(_v6, "Math"), "max", [0, _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")])])))))
					_S.invoke(_S.read(_v6, "ps"), "spawn", [(_S.prop(_S.read(_v6, "P"), "MOTE") if _S.truth(_S.binary("%", _S.read(_v6, "i"), 3)) else _S.prop(_S.read(_v6, "P"), "STAR")), _S.read(_v6, "X1"), _S.read(_v6, "y"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.invoke(_S.read(_v6, "R"), "range", [0.25, 0.45]), _S.invoke(_S.read(_v6, "R"), "pick", [[_S.prop(_S.read(_v6, "C"), 5), _S.prop(_S.read(_v6, "C"), 6), _S.read(_v6, "WHITE")]]), _S.invoke(_S.read(_v6, "R"), "range", [0.8, 1.8])])
					_v5 = _S.iteration(_v5)
					_S.write(_v5, "i", 1, "+=", true)
				var _v7 = _S.scope(_v4)
				_S.define(_v7, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v7, "i"), 18)):
					var _v8 = _S.scope(_v7)
					_S.define(_v8, "a", _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")]))
					_S.define(_v8, "sp", _S.binary("*", _S.invoke(_S.read(_v8, "R"), "range", [110, 240]), _S.binary("-", 1, _S.binary("*", 0.5, _S.invoke(_S.read(_v8, "Math"), "max", [0, _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")])])))))
					_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "SPARK"), _S.read(_v8, "X1"), _S.read(_v8, "y"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), 30), _S.invoke(_S.read(_v8, "R"), "range", [0.12, 0.3])])
					_v7 = _S.iteration(_v7)
					_S.write(_v7, "i", 1, "+=", true)
				var _v9 = _S.scope(_v4)
				_S.define(_v9, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v9, "i"), 14)):
					var _v10 = _S.scope(_v9)
					_S.define(_v10, "a", _S.invoke(_S.read(_v10, "R"), "range", [0, _S.read(_v10, "TAU")]))
					_S.define(_v10, "d", _S.invoke(_S.read(_v10, "R"), "range", [4, 22]))
					_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "STAR"), _S.binary("+", _S.read(_v10, "X1"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "d"))), _S.binary("+", _S.read(_v10, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "d")), 0.8)), 0, _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [2, 8])), _S.invoke(_S.read(_v10, "R"), "range", [0.5, 1.1]), _S.invoke(_S.read(_v10, "R"), "pick", [[_S.prop(_S.read(_v10, "C"), 6), _S.read(_v10, "WHITE"), _S.prop(_S.read(_v10, "C"), 5)]]), _S.invoke(_S.read(_v10, "R"), "range", [0.8, 2.6]), _S.invoke(_S.read(_v10, "R"), "range", [0.05, 0.45])])
					_v9 = _S.iteration(_v9)
					_S.write(_v9, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "now", _S.read(_e, "t"))
	_S.define(_e, "keep", _S.invoke(_S.read(_e, "trail"), "filter", [_S.function_value(_e, "_f5")]))
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 1)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), _S.prop(_S.read(_v11, "keep"), "length"))):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "a", _S.prop(_S.read(_v12, "keep"), _S.binary("-", _S.read(_v12, "i"), 1)))
		_S.define(_v12, "b", _S.prop(_S.read(_v12, "keep"), _S.read(_v12, "i")))
		_S.define(_v12, "dx", _S.binary("-", _S.prop(_S.read(_v12, "b"), "x"), _S.prop(_S.read(_v12, "a"), "x")))
		_S.define(_v12, "dy", _S.binary("-", _S.prop(_S.read(_v12, "b"), "y"), _S.prop(_S.read(_v12, "a"), "y")))
		_S.define(_v12, "l", _S.logical("||", _S.invoke(_S.read(_v12, "Math"), "hypot", [_S.read(_v12, "dx"), _S.read(_v12, "dy")]), func(): return 1))
		_S.define(_v12, "nx", _S.binary("/", _S.unary("-", _S.read(_v12, "dy")), _S.read(_v12, "l")))
		_S.define(_v12, "ny", _S.binary("/", _S.read(_v12, "dx"), _S.read(_v12, "l")))
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "f", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "f"), 1)):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "tt", _S.binary("+", _S.prop(_S.read(_v14, "a"), "t"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v14, "b"), "t"), _S.prop(_S.read(_v14, "a"), "t")), _S.read(_v14, "f"))))
			_S.define(_v14, "k", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v14, "now"), _S.read(_v14, "tt")), 0.32)))
			_S.define(_v14, "tw", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.binary("*", _S.read(_v14, "tt"), 26)]))
			_S.define(_v14, "w", _S.binary("+", _S.binary("*", _S.binary("*", 3.2, _S.read(_v14, "k")), _S.invoke(_S.read(_v14, "Math"), "abs", [_S.read(_v14, "tw")])), 0.4))
			_S.define(_v14, "face", _S.binary(">", _S.read(_v14, "tw"), 0))
			_S.define(_v14, "x", _S.binary("+", _S.prop(_S.read(_v14, "a"), "x"), _S.binary("*", _S.read(_v14, "dx"), _S.read(_v14, "f"))))
			_S.define(_v14, "y", _S.binary("+", _S.prop(_S.read(_v14, "a"), "y"), _S.binary("*", _S.read(_v14, "dy"), _S.read(_v14, "f"))))
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "s", _S.unary("-", _S.read(_v15, "w")))
			while _S.truth(_S.binary("<=", _S.read(_v15, "s"), _S.read(_v15, "w"))):
				var _v16 = _S.scope(_v15)
				_S.define(_v16, "edge", _S.binary(">", _S.invoke(_S.read(_v16, "Math"), "abs", [_S.read(_v16, "s")]), _S.binary("-", _S.read(_v16, "w"), 0.8)))
				_S.define(_v16, "c", ((_S.prop(_S.read(_v16, "C"), 6) if _S.truth(_S.read(_v16, "edge")) else (_S.prop(_S.read(_v16, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v16, "k"), 0.6)) else _S.prop(_S.read(_v16, "C"), 4))) if _S.truth(_S.read(_v16, "face")) else (_S.prop(_S.read(_v16, "C"), 4) if _S.truth(_S.read(_v16, "edge")) else _S.prop(_S.read(_v16, "C"), 2))))
				_S.invoke(_S.read(_v16, "p"), "dot", [_S.binary("+", _S.read(_v16, "x"), _S.binary("*", _S.read(_v16, "nx"), _S.read(_v16, "s"))), _S.binary("+", _S.read(_v16, "y"), _S.binary("*", _S.read(_v16, "ny"), _S.read(_v16, "s"))), _S.read(_v16, "c"), (1 if _S.truth(_S.binary(">", _S.read(_v16, "k"), 0.35)) else _S.binary("/", _S.read(_v16, "k"), 0.35))])
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "s", 0.5, "+=", false)
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "f", _S.binary("/", 0.5, _S.read(_v13, "l")), "+=", false)
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v12, "i"), 3), 0)):
			_S.invoke(_S.read(_v12, "p"), "glow", [_S.prop(_S.read(_v12, "b"), "x"), _S.prop(_S.read(_v12, "b"), "y"), 6, _S.prop(_S.read(_v12, "C"), 4), _S.binary("*", 0.25, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v12, "now"), _S.prop(_S.read(_v12, "b"), "t")), 0.32)))])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CHARGE"), _S.read(_e, "FLY")))):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "k", (_S.binary("/", _S.read(_v17, "t"), _S.read(_v17, "CHARGE")) if _S.truth(_S.binary("<", _S.read(_v17, "t"), _S.read(_v17, "CHARGE"))) else 1))
		var _v18 = ([0, _S.unary("-", _S.read(_v17, "H"))] if _S.truth(_S.binary("<", _S.read(_v17, "t"), _S.read(_v17, "CHARGE"))) else _S.call_value(_S.read(_v17, "pos"), [_S.binary("/", _S.binary("-", _S.read(_v17, "t"), _S.read(_v17, "CHARGE")), _S.read(_v17, "FLY"))]))
		_S.define(_v17, "x", _S.prop(_v18, 0))
		_S.define(_v17, "y", _S.prop(_v18, 1))
		_S.define(_v17, "r", _S.binary("+", 1, _S.binary("*", 3, _S.invoke(_S.read(_v17, "ease"), "outBack", [_S.read(_v17, "k")]))))
		_S.invoke(_S.read(_v17, "p"), "circle", [_S.read(_v17, "x"), _S.read(_v17, "y"), _S.binary("+", _S.read(_v17, "r"), 1.4), _S.prop(_S.read(_v17, "C"), 3)])
		_S.invoke(_S.read(_v17, "p"), "circle", [_S.read(_v17, "x"), _S.read(_v17, "y"), _S.binary("+", _S.read(_v17, "r"), 0.4), _S.prop(_S.read(_v17, "C"), 5)])
		_S.invoke(_S.read(_v17, "p"), "circle", [_S.binary("-", _S.read(_v17, "x"), 0.4), _S.binary("-", _S.read(_v17, "y"), 0.4), _S.binary("*", _S.read(_v17, "r"), 0.55), _S.read(_v17, "WHITE")])
		var _v19 = _S.scope(_v17)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), 3)):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "a", _S.binary("+", _S.binary("*", _S.read(_v20, "t"), 14), _S.binary("/", _S.binary("*", _S.read(_v20, "i"), _S.read(_v20, "TAU")), 3)))
			_S.invoke(_S.read(_v20, "p"), "px", [_S.binary("+", _S.read(_v20, "x"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.binary("+", _S.read(_v20, "r"), 3))), _S.binary("+", _S.read(_v20, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.binary("+", _S.read(_v20, "r"), 3)), 0.6)), (_S.prop(_S.read(_v20, "C"), 6) if _S.truth(_S.read(_v20, "i")) else _S.read(_v20, "WHITE"))])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 1, "+=", true)
		_S.invoke(_S.read(_v17, "p"), "glow", [_S.read(_v17, "x"), _S.read(_v17, "y"), 20, _S.prop(_S.read(_v17, "C"), 4), _S.binary("*", 0.65, _S.read(_v17, "k"))])
		_S.invoke(_S.read(_v17, "p"), "glow", [_S.read(_v17, "x"), _S.read(_v17, "y"), 7, _S.prop(_S.read(_v17, "C"), 6), _S.binary("*", 0.5, _S.read(_v17, "k"))])
	_S.define(_e, "q", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CHARGE")), _S.read(_e, "FLY")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "q"), 0), func(): return _S.binary("<", _S.read(_e, "q"), 0.5))):
		var _v21 = _S.scope(_e)
		_S.define(_v21, "e", _S.binary("/", _S.read(_v21, "q"), 0.5))
		if _S.truth(_S.binary("<", _S.read(_v21, "e"), 0.5)):
			_S.call_value(_S.read(_v21, "flare"), [_S.read(_v21, "p"), _S.read(_v21, "X1"), _S.unary("-", _S.read(_v21, "H")), _S.binary("+", _S.binary("*", 26, _S.invoke(_S.read(_v21, "Math"), "pow", [_S.binary("-", 1, _S.binary("*", _S.read(_v21, "e"), 2)), 1.2])), 2), _S.binary("-", 1, _S.binary("*", _S.read(_v21, "e"), 2)), _S.read(_v21, "C")])
		if _S.truth(_S.binary("<", _S.read(_v21, "e"), 0.12)):
			_S.invoke(_S.read(_v21, "p"), "circle", [_S.read(_v21, "X1"), _S.unary("-", _S.read(_v21, "H")), _S.binary("+", _S.binary("*", 6, _S.binary("-", 1, _S.binary("/", _S.read(_v21, "e"), 0.12))), 1), _S.read(_v21, "WHITE")])
		_S.invoke(_S.read(_v21, "p"), "ring", [_S.read(_v21, "X1"), _S.unary("-", _S.read(_v21, "H")), _S.binary("+", 4, _S.binary("*", 20, _S.invoke(_S.read(_v21, "ease"), "outCubic", [_S.read(_v21, "e")]))), _S.invoke(_S.read(_v21, "Math"), "max", [1, _S.binary("*", 2.5, _S.binary("-", 1, _S.read(_v21, "e")))]), (_S.prop(_S.read(_v21, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v21, "e"), 0.3)) else _S.prop(_S.read(_v21, "C"), 5)), _S.invoke(_S.read(_v21, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_v21, "e")), 1.5)])])
		if _S.truth(_S.binary("<", _S.read(_v21, "e"), 0.4)):
			_S.call_value(_S.read(_v21, "sparkle"), [_S.read(_v21, "p"), _S.read(_v21, "X1"), _S.unary("-", _S.read(_v21, "H")), _S.binary("*", 7, _S.binary("-", 1, _S.binary("/", _S.read(_v21, "e"), 0.4))), _S.prop(_S.read(_v21, "C"), 6), _S.prop(_S.read(_v21, "C"), 4), _S.binary("*", 0.6, _S.binary("-", 1, _S.binary("/", _S.read(_v21, "e"), 0.4)))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	_S.last([_S.unary("void", _S.read(_e, "clamp")), _S.read(_e, "smooth")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.binary("<", _S.binary("-", _S.read(_e, "now"), _S.prop(_S.read(_e, "q"), "t")), 0.32)
