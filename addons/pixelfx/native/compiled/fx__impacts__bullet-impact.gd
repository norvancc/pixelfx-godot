@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/bullet-impact.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "stone", _S.import_value("fx/impacts/_lib.js", "stone"))
	_S.define(_e, "spikes", _S.import_value("fx/impacts/_lib.js", "spikes"))
	_S.define(_e, "star", _S.import_value("fx/impacts/_lib.js", "star"))
	_S.define(_e, "SOOT", _S.import_value("fx/impacts/_lib.js", "SOOT"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Bullet impact"}, {"desc": "A bullet hits a wall on the right: a hot half-star, sparks sprayed back in a cone, a puff of grit, chips that fall and bounce, a pock mark cooling to soot."}, {"tags": ["impact", "bullet", "gun", "wall", "sparks", "debris", "directional", "one-shot"]}, {"size": [152, 100]}, {"origin": [116, 84]}, {"duration": 1.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffe26b", "#fff3a6", "#ffffff"]}, {"stone": "#5b5079"}, {"height": 24}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "X", 0)
	_S.define(_e, "Y", _S.unary("-", _S.prop(_S.read(_e, "o"), "height")))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "N", _S.prop(_S.read(_e, "Math"), "PI"))
	_S.define(_e, "IN", 0.08)
	_S.define(_e, "B", _S.binary("-", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "IN")))
	_S.define(_e, "open", _S.function_value(_e, "_f2"))
	_S.define(_e, "sp", _S.call_value(_S.read(_e, "spikes"), [_S.read(_e, "R"), 9, _S.read(_e, "B"), _S.merge([{"len": [7, 10.5]}, {"w": [1.6, 2.1]}, {"fwd": 1.8}, {"back": 0.4}])]))
	for _v0 in _S.array(_S.read(_e, "sp")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		if _S.truth(_S.binary("<", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.binary("-", _S.prop(_S.read(_v1, "s"), "a"), _S.read(_v1, "N"))]), _S.unary("-", 0.2))):
			_S.set_prop(_S.read(_v1, "s"), "len", 0.3, "*=", false)
	_S.define(_e, "rim", [])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "y", _S.unary("-", 2))
	while _S.truth(_S.binary("<=", _S.read(_v2, "y"), 2)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "x", 0)
		while _S.truth(_S.binary("<=", _S.read(_v3, "x"), 3)):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "d", _S.binary("+", _S.invoke(_S.read(_v4, "Math"), "hypot", [_S.binary("/", _S.binary("-", _S.read(_v4, "x"), 1), 1.6), _S.binary("/", _S.read(_v4, "y"), 2.1)]), _S.binary("*", _S.call_value(_S.read(_v4, "rand"), [_S.read(_v4, "x"), _S.read(_v4, "y"), _S.prop(_S.read(_v4, "o"), "seed")]), 0.35)))
			if _S.truth(_S.binary("<", _S.read(_v4, "d"), 0.75)):
				_S.invoke(_S.read(_v4, "rim"), "push", [[_S.read(_v4, "x"), _S.read(_v4, "y"), 0]])
			else:
				if _S.truth(_S.binary("<", _S.read(_v4, "d"), 1.25)):
					_S.invoke(_S.read(_v4, "rim"), "push", [[_S.read(_v4, "x"), _S.read(_v4, "y"), 1]])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "x", 1, "+=", true)
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "y", 1, "+=", true)
	_S.define(_e, "cracks", _S.invoke([0, 1, 2], "map", [_S.function_value(_e, "_f3")]))
	_S.invoke(_S.read(_e, "lights"), "add", [_S.binary("-", _S.read(_e, "X"), 4), _S.read(_e, "Y"), 40, _S.prop(_S.read(_e, "C"), 4), 0.6, 0.22])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.binary("-", _S.read(_e, "X"), 2), _S.read(_e, "Y"), 14, _S.read(_e, "WHITE"), 0.6, 0.06])
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), 18)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "a", _S.binary("+", _S.read(_v6, "B"), _S.binary("*", _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 1), 1]), 0.8)))
		_S.define(_v6, "v", _S.invoke(_S.read(_v6, "R"), "range", [170, 450]))
		_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "SPARK"), _S.binary("-", _S.read(_v6, "X"), 1), _S.read(_v6, "Y"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "v")), 30), _S.invoke(_S.read(_v6, "R"), "range", [0.12, 0.4]), _S.read(_v6, "WHITE"), 1, (_S.invoke(_S.read(_v6, "R"), "range", [0.01, 0.04]) if _S.truth(_S.binary(">", _S.read(_v6, "i"), 13)) else 0)])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	var _v7 = _S.scope(_e)
	_S.define(_v7, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "i"), 8)):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "a", _S.binary("+", _S.read(_v8, "N"), _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 0.8), 0.6])))
		_S.define(_v8, "v", _S.invoke(_S.read(_v8, "R"), "range", [60, 190]))
		_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "GRIT"), _S.binary("-", _S.read(_v8, "X"), 1), _S.binary("+", _S.read(_v8, "Y"), _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 1), 1])), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "v")), _S.invoke(_S.read(_v8, "R"), "range", [20, 70])), _S.invoke(_S.read(_v8, "R"), "range", [0.9, 1.3]), _S.invoke(_S.read(_v8, "R"), "pick", [[_S.prop(_S.read(_v8, "st"), "light"), _S.prop(_S.read(_v8, "st"), "body"), _S.prop(_S.read(_v8, "st"), "body"), _S.prop(_S.read(_v8, "st"), "lip")]]), (2 if _S.truth(_S.binary("<", _S.read(_v8, "i"), 3)) else 1)])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "i", 1, "+=", true)
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), 9)):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "a", _S.binary("+", _S.read(_v10, "N"), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 1.1), 1.1])))
		_S.define(_v10, "v", _S.invoke(_S.read(_v10, "R"), "range", [15, 60]))
		_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "DUST"), _S.binary("-", _S.read(_v10, "X"), 2), _S.binary("+", _S.read(_v10, "Y"), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "v")), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "v")), _S.invoke(_S.read(_v10, "R"), "range", [0.3, 0.55]), (_S.prop(_S.read(_v10, "st"), "dust") if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.5])) else _S.call_value(_S.read(_v10, "mix"), [_S.prop(_S.read(_v10, "st"), "dust"), _S.read(_v10, "WHITE"), 0.25])), _S.invoke(_S.read(_v10, "R"), "range", [1.2, 2.3])])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "SMOKE"), _S.binary("-", _S.read(_e, "X"), 4), _S.read(_e, "Y"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 10), _S.unary("-", 4)]), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 16), _S.unary("-", 8)]), _S.invoke(_S.read(_e, "R"), "range", [0.8, 1.2]), _S.prop(_S.read(_e, "st"), "dust"), _S.invoke(_S.read(_e, "R"), "range", [1.8, 2.4]), 0.05])
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"drawBack": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("-", _S.read(_e, "a"), _S.read(_e, "N"))]), _S.unary("-", 0.25))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1.2), 1.2]))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "R"), "range", [2, 4.5]))
	return [_S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), 2.2), 1), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 2.2), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.binary("+", 2.2, _S.read(_e, "L"))), 1), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.binary("+", 2.2, _S.read(_e, "L")))]

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "heat", _S.invoke(_S.read(_e, "Math"), "pow", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.9))]), 1.3]))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "D"), 0.45), _S.binary("-", _S.read(_e, "D"), 0.1), _S.read(_e, "t")])))
	if _S.truth(_S.binary(">", _S.read(_e, "fade"), 0)):
		var _v11 = _S.scope(_e)
		for _v12 in _S.array(_S.read(_v11, "cracks")):
			var _v13 = _S.scope(_v11)
			var _v14 = _v12
			_S.define(_v13, "x0", _S.prop(_v14, 0))
			_S.define(_v13, "y0", _S.prop(_v14, 1))
			_S.define(_v13, "x1", _S.prop(_v14, 2))
			_S.define(_v13, "y1", _S.prop(_v14, 3))
			_S.invoke(_S.read(_v13, "p"), "line", [_S.binary("+", _S.read(_v13, "X"), _S.read(_v13, "x0")), _S.binary("+", _S.read(_v13, "Y"), _S.read(_v13, "y0")), _S.binary("+", _S.read(_v13, "X"), _S.read(_v13, "x1")), _S.binary("+", _S.read(_v13, "Y"), _S.read(_v13, "y1")), (_S.prop(_S.read(_v13, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v13, "heat"), 0.5)) else _S.prop(_S.read(_v13, "st"), "shade")), _S.binary("*", _S.read(_v13, "fade"), (1 if _S.truth(_S.binary(">", _S.read(_v13, "heat"), 0.5)) else 0.85))])
		for _v15 in _S.array(_S.read(_v11, "rim")):
			var _v16 = _S.scope(_v11)
			var _v17 = _v15
			_S.define(_v16, "x", _S.prop(_v17, 0))
			_S.define(_v16, "y", _S.prop(_v17, 1))
			_S.define(_v16, "k", _S.prop(_v17, 2))
			var _v18 = _S.scope(_v16)
			_S.define(_v18, "h", _S.binary("*", _S.read(_v18, "heat"), (0.85 if _S.truth(_S.read(_v18, "k")) else 1.15)))
			_S.invoke(_S.read(_v18, "p"), "dot", [_S.binary("+", _S.read(_v18, "X"), _S.read(_v18, "x")), _S.binary("+", _S.read(_v18, "Y"), _S.read(_v18, "y")), (_S.read(_v18, "SOOT") if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v18, "k"), 0), func(): return _S.binary("<", _S.read(_v18, "h"), 0.75))) else (_S.read(_v18, "WHITE") if _S.truth(_S.binary(">", _S.read(_v18, "h"), 0.85)) else (_S.prop(_S.read(_v18, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v18, "h"), 0.6)) else (_S.prop(_S.read(_v18, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v18, "h"), 0.4)) else (_S.prop(_S.read(_v18, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v18, "h"), 0.22)) else (_S.prop(_S.read(_v18, "C"), 2) if _S.truth(_S.binary(">", _S.read(_v18, "h"), 0.1)) else _S.prop(_S.read(_v18, "st"), "shade"))))))), _S.read(_v18, "fade")])
		if _S.truth(_S.binary(">", _S.read(_v11, "heat"), 0)):
			_S.invoke(_S.read(_v11, "p"), "glow", [_S.binary("+", _S.read(_v11, "X"), 1), _S.read(_v11, "Y"), _S.binary("+", 6, _S.binary("*", 6, _S.read(_v11, "heat"))), _S.prop(_S.read(_v11, "C"), 3), _S.binary("*", 0.5, _S.read(_v11, "heat"))])
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.03), 0.18))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), 1))):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "r", _S.binary("+", 5, _S.binary("*", 12, _S.invoke(_S.read(_v19, "ease"), "outCubic", [_S.read(_v19, "u")]))))
		_S.define(_v19, "c", (_S.prop(_S.read(_v19, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v19, "u"), 0.3)) else (_S.prop(_S.read(_v19, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v19, "u"), 0.6)) else _S.prop(_S.read(_v19, "C"), 3))))
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "j", 0)
		_S.define(_v20, "n", _S.invoke(_S.read(_v20, "Math"), "ceil", [_S.binary("*", _S.binary("*", _S.read(_v20, "r"), _S.read(_v20, "TAU")), 1.3)]))
		while _S.truth(_S.binary("<", _S.read(_v20, "j"), _S.read(_v20, "n"))):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "g", _S.binary("*", _S.binary("/", _S.read(_v21, "j"), _S.read(_v21, "n")), _S.read(_v21, "TAU")))
			if _S.truth(_S.call_value(_S.read(_v21, "open"), [_S.read(_v21, "g")])):
				_S.invoke(_S.read(_v21, "p"), "dot", [_S.binary("+", _S.read(_v21, "X"), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "g")]), _S.read(_v21, "r"))), _S.binary("+", _S.read(_v21, "Y"), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "g")]), _S.read(_v21, "r"))), _S.read(_v21, "c"), _S.binary("-", 1.15, _S.read(_v21, "u"))])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "j", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.03)):
		_S.call_value(_S.read(_e, "star"), [_S.read(_e, "p"), _S.read(_e, "X"), _S.read(_e, "Y"), _S.read(_e, "sp"), 1, 1, [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.read(_e, "WHITE")], 1, 2.2])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.06)):
			_S.call_value(_S.read(_e, "star"), [_S.read(_e, "p"), _S.read(_e, "X"), _S.read(_e, "Y"), _S.read(_e, "sp"), 1.25, 0.55, [_S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 5)], 1, 2.2])
	_S.define(_e, "pop", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "t")), 0.045)]))
	if _S.truth(_S.binary(">", _S.read(_e, "pop"), 0.02)):
		var _v22 = _S.scope(_e)
		_S.invoke(_S.read(_v22, "p"), "glow", [_S.binary("-", _S.read(_v22, "X"), 2), _S.read(_v22, "Y"), 22, _S.prop(_S.read(_v22, "C"), 3), _S.binary("*", 0.6, _S.read(_v22, "pop"))])
		_S.invoke(_S.read(_v22, "p"), "glow", [_S.binary("-", _S.read(_v22, "X"), 1), _S.read(_v22, "Y"), 8, _S.read(_v22, "WHITE"), _S.binary("*", 0.5, _S.read(_v22, "pop"))])
		_S.invoke(_S.read(_v22, "p"), "glowLine", [_S.binary("+", _S.read(_v22, "X"), 1), _S.binary("-", _S.read(_v22, "Y"), 16), _S.binary("+", _S.read(_v22, "X"), 1), _S.binary("+", _S.read(_v22, "Y"), 16), 4, _S.prop(_S.read(_v22, "C"), 4), _S.binary("*", 0.4, _S.read(_v22, "pop"))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
