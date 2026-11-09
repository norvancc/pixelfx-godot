@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/hex-sigil.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "Puffs", _S.import_value("fx/shadow/_lib.js", "Puffs"))
	_S.define(_e, "PK", _S.import_value("fx/shadow/_lib.js", "PK"))
	_S.define(_e, "ringFast", _S.import_value("fx/shadow/_lib.js", "ringFast"))
	_S.define(_e, "strokes", _S.function_value(_e, "_f0"))
	_S.define(_e, "glyphs", _S.function_value(_e, "_f4"))
	_S.define(_e, "create", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Hex sigil"}, {"desc": "A burning pen traces a cursed sigil in the air, its glyphs pop in one by one, then it flares white and crumbles into falling embers."}, {"tags": ["shadow", "hex", "sigil", "rune", "curse", "magic", "circle", "one-shot"]}, {"size": [168, 128]}, {"origin": [84, 112]}, {"duration": 4.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CY", _S.unary("-", 50))
	_S.define(_e, "RO", 28)
	_S.define(_e, "RI", 22)
	_S.define(_e, "RC", 6)
	_S.define(_e, "GLYPH", 1.62)
	_S.define(_e, "FLARE", 2.6)
	_S.define(_e, "BREAK", 2.74)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "seed", _S.arg(_args, 0))
	_S.define(_e, "paths", [])
	_S.define(_e, "circle", _S.function_value(_e, "_f1"))
	_S.invoke(_S.read(_e, "paths"), "push", [_S.call_value(_S.read(_e, "circle"), [_S.read(_e, "RO"), _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2)])])
	_S.define(_e, "star", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<=", _S.read(_v0, "i"), 7)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v1, "Math"), "PI")), 2), _S.binary("*", _S.binary("%", _S.binary("*", _S.read(_v1, "i"), 3), 7), _S.binary("/", _S.read(_v1, "TAU"), 7))))
		_S.invoke(_S.read(_v1, "star"), "push", [[_S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "RI")), _S.binary("+", _S.read(_v1, "CY"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "RI")))]])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "paths"), "push", [_S.read(_e, "star")])
	_S.invoke(_S.read(_e, "paths"), "push", [_S.call_value(_S.read(_e, "circle"), [_S.read(_e, "RI"), _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2)])])
	_S.invoke(_S.read(_e, "paths"), "push", [_S.call_value(_S.read(_e, "circle"), [_S.read(_e, "RC"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)])])
	_S.invoke(_S.read(_e, "paths"), "push", [[[0, _S.binary("-", _S.read(_e, "CY"), 3.5)], [2, _S.read(_e, "CY")], [0, _S.binary("+", _S.read(_e, "CY"), 3.5)], [_S.unary("-", 2), _S.read(_e, "CY")], [0, _S.binary("-", _S.read(_e, "CY"), 3.5)]]])
	_S.define(_e, "pts", [])
	_S.define(_e, "speeds", [420, 700, 550, 380, 300])
	_S.define(_e, "t", 0.12)
	_S.invoke(_S.read(_e, "paths"), "forEach", [_S.function_value(_e, "_f3")])
	return _S.merge([{"pts": _S.read(_e, "pts")}, {"end": _S.read(_e, "t")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "a0", _S.arg(_args, 1))
	_S.define(_e, "n", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.binary("+", _S.logical("||", _S.read(_e, "n"), func(): return _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.read(_e, "r"), _S.read(_e, "TAU"))])), 1)}]), _S.function_value(_e, "_f2")])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.read(_e, "a0"), _S.binary("*", _S.binary("/", _S.read(_e, "i"), _S.logical("||", _S.read(_e, "n"), func(): return _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.read(_e, "r"), _S.read(_e, "TAU"))]))), _S.read(_e, "TAU")))]), _S.read(_e, "r")), _S.binary("+", _S.read(_e, "CY"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.read(_e, "a0"), _S.binary("*", _S.binary("/", _S.read(_e, "i"), _S.logical("||", _S.read(_e, "n"), func(): return _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.read(_e, "r"), _S.read(_e, "TAU"))]))), _S.read(_e, "TAU")))]), _S.read(_e, "r")))]

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "path", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 1)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), _S.prop(_S.read(_v2, "path"), "length"))):
		var _v3 = _S.scope(_v2)
		var _v4 = _S.prop(_S.read(_v3, "path"), _S.binary("-", _S.read(_v3, "i"), 1))
		_S.define(_v3, "x0", _S.prop(_v4, 0))
		_S.define(_v3, "y0", _S.prop(_v4, 1))
		var _v5 = _S.prop(_S.read(_v3, "path"), _S.read(_v3, "i"))
		_S.define(_v3, "x1", _S.prop(_v5, 0))
		_S.define(_v3, "y1", _S.prop(_v5, 1))
		_S.define(_v3, "L", _S.invoke(_S.read(_v3, "Math"), "hypot", [_S.binary("-", _S.read(_v3, "x1"), _S.read(_v3, "x0")), _S.binary("-", _S.read(_v3, "y1"), _S.read(_v3, "y0"))]))
		var _v6 = _S.scope(_v3)
		_S.define(_v6, "d", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "d"), _S.read(_v6, "L"))):
			_S.invoke(_S.read(_v6, "pts"), "push", [_S.merge([{"x": _S.binary("+", _S.read(_v6, "x0"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v6, "x1"), _S.read(_v6, "x0")), _S.read(_v6, "d")), _S.read(_v6, "L")))}, {"y": _S.binary("+", _S.read(_v6, "y0"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v6, "y1"), _S.read(_v6, "y0")), _S.read(_v6, "d")), _S.read(_v6, "L")))}, {"t": _S.binary("+", _S.read(_v6, "t"), _S.binary("/", _S.read(_v6, "d"), _S.prop(_S.read(_v6, "speeds"), _S.read(_v6, "k"))))}])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "d", 0.5, "+=", false)
		_S.write(_v3, "t", _S.binary("/", _S.read(_v3, "L"), _S.prop(_S.read(_v3, "speeds"), _S.read(_v3, "k"))), "+=", false)
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	_S.write(_e, "t", 0.04, "+=", false)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "seed", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 7}]), _S.function_value(_e, "_f5")])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rng"), [_S.read(_e, "seed"), _S.read(_e, "i"), 31]))
	_S.define(_e, "segs", [[[1, 0], [1, 2]]])
	var _v7 = _S.scope(_e)
	_S.define(_v7, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "k"), _S.binary("+", 2, (1 if _S.truth(_S.binary("<", _S.invoke(_S.read(_v7, "r"), "next", []), 0.5)) else 0)))):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "a", [_S.invoke(_S.read(_v8, "r"), "int", [0, 2]), _S.invoke(_S.read(_v8, "r"), "int", [0, 2])])
		_S.define(_v8, "b", [_S.invoke(_S.read(_v8, "Math"), "max", [0, _S.invoke(_S.read(_v8, "Math"), "min", [2, _S.binary("+", _S.prop(_S.read(_v8, "a"), 0), _S.invoke(_S.read(_v8, "r"), "int", [_S.unary("-", 1), 1]))])]), _S.invoke(_S.read(_v8, "Math"), "max", [0, _S.invoke(_S.read(_v8, "Math"), "min", [2, _S.binary("+", _S.prop(_S.read(_v8, "a"), 1), _S.invoke(_S.read(_v8, "r"), "int", [_S.unary("-", 1), 1]))])])])
		if _S.truth(_S.logical("||", _S.binary("!==", _S.prop(_S.read(_v8, "a"), 0), _S.prop(_S.read(_v8, "b"), 0)), func(): return _S.binary("!==", _S.prop(_S.read(_v8, "a"), 1), _S.prop(_S.read(_v8, "b"), 1)))):
			_S.invoke(_S.read(_v8, "segs"), "push", [[_S.read(_v8, "a"), _S.read(_v8, "b")]])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "k", 1, "+=", true)
	_S.define(_e, "ang", _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.binary("/", _S.binary("*", _S.read(_e, "i"), _S.read(_e, "TAU")), 7)), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 7)))
	_S.define(_e, "rr", _S.binary("/", _S.binary("+", _S.read(_e, "RO"), _S.read(_e, "RI")), 2))
	return _S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]), _S.read(_e, "rr"))}, {"y": _S.binary("+", _S.read(_e, "CY"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]), _S.read(_e, "rr")))}, {"segs": _S.read(_e, "segs")}, {"t": _S.binary("+", _S.read(_e, "GLYPH"), _S.binary("*", _S.read(_e, "i"), 0.07))}])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f7"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "strokes"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "glyphs"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)]}])]))
	_S.define(_e, "embers", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "puffs", _S.construct(_S.read(_e, "Puffs"), [_S.merge([{"rng": _S.read(_e, "R")}, {"flame": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 0)]}, {"soot": [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), 0.5]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1), 0.5])]}, {"cap": _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2), 0.5])}, {"rim": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"floor": _S.read(_e, "floor")}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "pi", 0)
	_S.define(_e, "flared", false)
	_S.define(_e, "broke", false)
	_S.define(_e, "pen", _S.function_value(_e, "_f8"))
	return _S.merge([{"update": _S.function_value(_e, "_f9")}, {"drawBack": _S.function_value(_e, "_f10")}, {"draw": _S.function_value(_e, "_f11")}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.prop(_S.prop(_S.read(_e, "S"), "pts"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.prop(_S.read(_e, "S"), "pts"), "length"), 1), _S.read(_e, "pi")]))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "pi"), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "S"), "pts"), "length"), 1)), func(): return _S.binary("<=", _S.prop(_S.prop(_S.prop(_S.read(_e, "S"), "pts"), _S.binary("+", _S.read(_e, "pi"), 1)), "t"), _S.read(_e, "t")))):
		_S.write(_e, "pi", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.12), func(): return _S.binary("<", _S.read(_e, "t"), _S.prop(_S.read(_e, "S"), "end")))):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "q", _S.call_value(_S.read(_v9, "pen"), []))
		if _S.truth(_S.invoke(_S.read(_v9, "R"), "chance", [_S.binary("*", _S.read(_v9, "dt"), 70)])):
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "SPARK"), _S.prop(_S.read(_v9, "q"), "x"), _S.prop(_S.read(_v9, "q"), "y"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 70), 70]), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 100), 20]), _S.invoke(_S.read(_v9, "R"), "range", [0.12, 0.35])])
		if _S.truth(_S.invoke(_S.read(_v9, "R"), "chance", [_S.binary("*", _S.read(_v9, "dt"), 10)])):
			_S.invoke(_S.read(_v9, "embers"), "spawn", [_S.prop(_S.read(_v9, "P"), "EMBER"), _S.prop(_S.read(_v9, "q"), "x"), _S.prop(_S.read(_v9, "q"), "y"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 12), 12]), _S.invoke(_S.read(_v9, "R"), "range", [5, 25]), _S.invoke(_S.read(_v9, "R"), "range", [0.5, 0.9])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.2), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "FLARE"), 0.05))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.read(_e, "dt"), _S.binary("+", 8, _S.binary("*", 14, _S.call_value(_S.read(_e, "smooth"), [0.2, _S.read(_e, "FLARE"), _S.read(_e, "t")]))))]))):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "a", _S.invoke(_S.read(_v10, "R"), "range", [0, _S.read(_v10, "TAU")]))
		_S.define(_v10, "D0", _S.invoke(_S.read(_v10, "R"), "range", [40, 60]))
		_S.define(_v10, "T", _S.invoke(_S.read(_v10, "R"), "range", [0.22, 0.32]))
		_S.define(_v10, "v", _S.binary("/", _S.binary("*", _S.read(_v10, "D0"), 3), _S.binary("-", _S.invoke(_S.read(_v10, "Math"), "exp", [_S.binary("*", 3, _S.read(_v10, "T"))]), 1)))
		_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "D0")), _S.binary("+", _S.read(_v10, "CY"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "D0"))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")])), _S.read(_v10, "v")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")])), _S.read(_v10, "v")), _S.read(_v10, "T"), (_S.prop(_S.read(_v10, "C"), 7) if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.5])) else _S.prop(_S.read(_v10, "C"), 6))])
	for _v11 in _S.array(_S.read(_e, "G")):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "g", _v11)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v12, "g"), "popped")), func(): return _S.binary(">=", _S.read(_v12, "t"), _S.prop(_S.read(_v12, "g"), "t")))):
			var _v13 = _S.scope(_v12)
			_S.set_prop(_S.read(_v13, "g"), "popped", true, "=", false)
			_S.invoke(_S.read(_v13, "lights"), "push", [_S.merge([{"x": _S.prop(_S.read(_v13, "g"), "x")}, {"y": _S.prop(_S.read(_v13, "g"), "y")}, {"r": 14}, {"k": 0.7}, {"life": 0.2}, {"max": 0.2}])])
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v14, "i"), 4)):
				_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "SPARK"), _S.prop(_S.read(_v14, "g"), "x"), _S.prop(_S.read(_v14, "g"), "y"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 60), 60]), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 70), 20]), _S.invoke(_S.read(_v14, "R"), "range", [0.1, 0.25])])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FLARE")), func(): return _S.unary("!", _S.read(_e, "flared")))):
		var _v15 = _S.scope(_e)
		_S.write(_v15, "flared", true, "=", false)
		_S.invoke(_S.read(_v15, "lights"), "push", [_S.merge([{"x": 0}, {"y": _S.read(_v15, "CY")}, {"r": 96}, {"k": 1.4}, {"life": 0.45}, {"max": 0.45}]), _S.merge([{"x": 0}, {"y": _S.read(_v15, "CY")}, {"r": 44}, {"k": 1}, {"life": 0.14}, {"max": 0.14}])])
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v16, "i"), 24)):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "a", _S.invoke(_S.read(_v17, "R"), "range", [0, _S.read(_v17, "TAU")]))
			_S.define(_v17, "sp", _S.invoke(_S.read(_v17, "R"), "range", [60, 130]))
			_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), 13), _S.binary("+", _S.read(_v17, "CY"), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), 13)), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), 30), _S.invoke(_S.read(_v17, "R"), "range", [0.2, 0.45])])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BREAK")), func(): return _S.unary("!", _S.read(_e, "broke")))):
		var _v18 = _S.scope(_e)
		_S.write(_v18, "broke", true, "=", false)
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), _S.binary("-", _S.prop(_S.prop(_S.read(_v19, "S"), "pts"), "length"), 1))):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "q", _S.prop(_S.prop(_S.read(_v20, "S"), "pts"), _S.read(_v20, "i")))
			_S.define(_v20, "n", _S.prop(_S.prop(_S.read(_v20, "S"), "pts"), _S.binary("+", _S.read(_v20, "i"), 1)))
			_S.define(_v20, "a", _S.invoke(_S.read(_v20, "Math"), "atan2", [_S.binary("-", _S.prop(_S.read(_v20, "n"), "y"), _S.prop(_S.read(_v20, "q"), "y")), _S.binary("-", _S.prop(_S.read(_v20, "n"), "x"), _S.prop(_S.read(_v20, "q"), "x"))]))
			_S.invoke(_S.read(_v20, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v20, "B"), "SHARD")}, {"x": _S.prop(_S.read(_v20, "q"), "x")}, {"y": _S.prop(_S.read(_v20, "q"), "y")}, {"vx": _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 8), 8])}, {"vy": _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 12), 6])}, {"g": _S.invoke(_S.read(_v20, "R"), "range", [0.22, 0.45])}, {"drag": 0.6}, {"bounce": 0.25}, {"life": _S.invoke(_S.read(_v20, "R"), "range", [0.8, 1.2])}, {"a": _S.read(_v20, "a")}, {"va": _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 3), 3])}, {"s": _S.invoke(_S.read(_v20, "R"), "range", [2.5, 3.5])}, {"c": _S.invoke(_S.read(_v20, "R"), "pick", [[_S.prop(_S.read(_v20, "C"), 7), _S.prop(_S.read(_v20, "C"), 6), _S.prop(_S.read(_v20, "C"), 6), _S.prop(_S.read(_v20, "C"), 5)]])}])])
			if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v20, "i"), 27), 0)):
				_S.invoke(_S.read(_v20, "embers"), "spawn", [_S.prop(_S.read(_v20, "P"), "EMBER"), _S.prop(_S.read(_v20, "q"), "x"), _S.prop(_S.read(_v20, "q"), "y"), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [10, 40])), _S.invoke(_S.read(_v20, "R"), "range", [0.6, 1.1])])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 7, "+=", false)
		for _v21 in _S.array(_S.read(_v18, "G")):
			var _v22 = _S.scope(_v18)
			_S.define(_v22, "g", _v21)
			_S.invoke(_S.read(_v22, "puffs"), "spawn", [_S.prop(_S.read(_v22, "PK"), "SOOT"), _S.prop(_S.read(_v22, "g"), "x"), _S.prop(_S.read(_v22, "g"), "y"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [8, 18])), _S.invoke(_S.read(_v22, "R"), "range", [0.7, 1.1]), _S.invoke(_S.read(_v22, "R"), "range", [3, 5])])
		var _v23 = _S.scope(_v18)
		_S.define(_v23, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "i"), 8)):
			_S.invoke(_S.read(_v23, "puffs"), "spawn", [_S.prop(_S.read(_v23, "PK"), "SOOT"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 20), 20]), _S.binary("+", _S.read(_v23, "CY"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 20), 20])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [6, 16])), _S.invoke(_S.read(_v23, "R"), "range", [0.8, 1.2]), _S.invoke(_S.read(_v23, "R"), "range", [3, 6]), _S.invoke(_S.read(_v23, "R"), "range", [0, 0.15])])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "i", 1, "+=", true)
	var _v24 = _S.scope(_e)
	_S.define(_v24, "i", _S.binary("-", _S.prop(_S.read(_v24, "lights"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v24, "i"), 0)):
		if _S.truth(_S.binary("<=", _S.set_prop(_S.prop(_S.read(_v24, "lights"), _S.read(_v24, "i")), "life", _S.read(_v24, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v24, "lights"), "splice", [_S.read(_v24, "i"), 1])
		_v24 = _S.iteration(_v24)
		_S.write(_v24, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "embers"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "puffs"), "update", [_S.read(_e, "dt")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.invoke(_S.read(_e, "puffs"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "PK"), "SOOT"), _S.merge([{"x": 0}, {"y": _S.read(_e, "CY")}, {"k": (0.3 if _S.truth(_S.read(_e, "broke")) else 0)}, {"reach": 50}])])
	_S.define(_e, "k", (_S.call_value(_S.read(_e, "smooth"), [0.1, 0.6, _S.read(_e, "t")]) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))) else _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "BREAK"), _S.binary("+", _S.read(_e, "BREAK"), 0.6), _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "CY"), 52, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.3, _S.read(_e, "k"))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.unary("!", _S.read(_e, "broke"))):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "hold", (_S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v25, "Math"), "sin", [_S.binary("*", _S.binary("-", _S.read(_v25, "t"), _S.prop(_S.read(_v25, "S"), "end")), 9)]))) if _S.truth(_S.binary(">", _S.read(_v25, "t"), _S.prop(_S.read(_v25, "S"), "end"))) else 0))
		_S.define(_v25, "white", _S.binary(">=", _S.read(_v25, "t"), _S.read(_v25, "FLARE")))
		for _v26 in _S.array(_S.prop(_S.read(_v25, "S"), "pts")):
			var _v27 = _S.scope(_v25)
			_S.define(_v27, "q", _v26)
			var _v28 = _S.scope(_v27)
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v28, "q"), "t"), _S.read(_v28, "t"))):
				break
			_S.define(_v28, "age", _S.binary("-", _S.read(_v28, "t"), _S.prop(_S.read(_v28, "q"), "t")))
			_S.invoke(_S.read(_v28, "p"), "px", [_S.prop(_S.read(_v28, "q"), "x"), _S.prop(_S.read(_v28, "q"), "y"), (_S.read(_v28, "WHITE") if _S.truth(_S.read(_v28, "white")) else (_S.read(_v28, "WHITE") if _S.truth(_S.binary("<", _S.read(_v28, "age"), 0.05)) else (_S.prop(_S.read(_v28, "C"), 7) if _S.truth(_S.binary("<", _S.read(_v28, "age"), 0.15)) else (_S.prop(_S.read(_v28, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v28, "age"), 0.35)) else (_S.prop(_S.read(_v28, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v28, "hold"), 0.75)) else _S.prop(_S.read(_v28, "C"), 5))))))])
		if _S.truth(_S.read(_v25, "white")):
			for _v29 in _S.array(_S.prop(_S.read(_v25, "S"), "pts")):
				var _v30 = _S.scope(_v25)
				_S.define(_v30, "q", _v29)
				if _S.truth(_S.binary("===", _S.binary("%", _S.binary("|", _S.binary("*", _S.prop(_S.read(_v30, "q"), "x"), 2), 0), 3), 0)):
					_S.invoke(_S.read(_v30, "p"), "light", [_S.prop(_S.read(_v30, "q"), "x"), _S.prop(_S.read(_v30, "q"), "y"), _S.prop(_S.read(_v30, "C"), 6), 0.5])
		for _v31 in _S.array(_S.read(_v25, "G")):
			var _v32 = _S.scope(_v25)
			_S.define(_v32, "g", _v31)
			var _v33 = _S.scope(_v32)
			if _S.truth(_S.binary("<", _S.read(_v33, "t"), _S.prop(_S.read(_v33, "g"), "t"))):
				continue
			_S.define(_v33, "age", _S.binary("-", _S.read(_v33, "t"), _S.prop(_S.read(_v33, "g"), "t")))
			_S.define(_v33, "col", (_S.read(_v33, "WHITE") if _S.truth(_S.logical("||", _S.read(_v33, "white"), func(): return _S.binary("<", _S.read(_v33, "age"), 0.06))) else (_S.prop(_S.read(_v33, "C"), 7) if _S.truth(_S.binary("<", _S.read(_v33, "age"), 0.2)) else (_S.prop(_S.read(_v33, "C"), 7) if _S.truth(_S.binary(">", _S.read(_v33, "hold"), 0.75)) else _S.prop(_S.read(_v33, "C"), 6)))))
			for _v34 in _S.array(_S.prop(_S.read(_v33, "g"), "segs")):
				var _v35 = _S.scope(_v33)
				var _v36 = _v34
				_S.define(_v35, "a", _S.prop(_v36, 0))
				_S.define(_v35, "b", _S.prop(_v36, 1))
				_S.invoke(_S.read(_v35, "p"), "line", [_S.binary("+", _S.binary("-", _S.prop(_S.read(_v35, "g"), "x"), 2), _S.binary("*", _S.prop(_S.read(_v35, "a"), 0), 2)), _S.binary("+", _S.binary("-", _S.prop(_S.read(_v35, "g"), "y"), 2), _S.binary("*", _S.prop(_S.read(_v35, "a"), 1), 2)), _S.binary("+", _S.binary("-", _S.prop(_S.read(_v35, "g"), "x"), 2), _S.binary("*", _S.prop(_S.read(_v35, "b"), 0), 2)), _S.binary("+", _S.binary("-", _S.prop(_S.read(_v35, "g"), "y"), 2), _S.binary("*", _S.prop(_S.read(_v35, "b"), 1), 2)), _S.read(_v35, "col")])
			if _S.truth(_S.binary("<", _S.read(_v33, "age"), 0.18)):
				_S.call_value(_S.read(_v33, "ringFast"), [_S.read(_v33, "p"), _S.prop(_S.read(_v33, "g"), "x"), _S.prop(_S.read(_v33, "g"), "y"), _S.binary("+", 2, _S.binary("*", 4, _S.binary("/", _S.read(_v33, "age"), 0.18))), 1, (_S.prop(_S.read(_v33, "C"), 7) if _S.truth(_S.binary("<", _S.read(_v33, "age"), 0.09)) else _S.prop(_S.read(_v33, "C"), 5))])
			_S.invoke(_S.read(_v33, "p"), "glow", [_S.prop(_S.read(_v33, "g"), "x"), _S.prop(_S.read(_v33, "g"), "y"), 6, _S.prop(_S.read(_v33, "C"), 5), 0.25])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v25, "t"), 0.12), func(): return _S.binary("<", _S.read(_v25, "t"), _S.binary("+", _S.prop(_S.read(_v25, "S"), "end"), 0.05)))):
			var _v37 = _S.scope(_v25)
			_S.define(_v37, "q", _S.call_value(_S.read(_v37, "pen"), []))
			_S.call_value(_S.read(_v37, "sparkle"), [_S.read(_v37, "p"), _S.prop(_S.read(_v37, "q"), "x"), _S.prop(_S.read(_v37, "q"), "y"), _S.binary("+", 3, _S.invoke(_S.read(_v37, "Math"), "sin", [_S.binary("*", _S.read(_v37, "t"), 60)])), _S.prop(_S.read(_v37, "C"), 7), _S.prop(_S.read(_v37, "C"), 6), 0.6])
			_S.invoke(_S.read(_v37, "p"), "glow", [_S.prop(_S.read(_v37, "q"), "x"), _S.prop(_S.read(_v37, "q"), "y"), 16, _S.prop(_S.read(_v37, "C"), 6), 0.55])
	_S.define(_e, "fu", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "FLARE")), 0.35))
	_S.define(_e, "bu", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "FLARE")), 0.22))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "bu"), 0), func(): return _S.binary("<", _S.read(_e, "bu"), 1))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.read(_e, "CY"), _S.binary("*", 18, _S.binary("-", 1, _S.read(_e, "bu"))), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.9, _S.binary("-", 1, _S.read(_e, "bu")))])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "fu"), 0), func(): return _S.binary("<", _S.read(_e, "fu"), 1))):
		_S.call_value(_S.read(_e, "ringFast"), [_S.read(_e, "p"), 0, _S.read(_e, "CY"), _S.binary("+", _S.binary("+", _S.read(_e, "RO"), 3), _S.binary("*", 12, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "fu")]))), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_e, "fu")))]), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "fu"), 0.4)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "fu"), 0.7)) else _S.prop(_S.read(_e, "C"), 4)))])
	_S.invoke(_S.read(_e, "bits"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "puffs"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "PK"), "FLAME")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "embers"), "draw", [_S.read(_e, "p")])
	for _v38 in _S.array(_S.read(_e, "lights")):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "l", _v38)
		var _v40 = _S.scope(_v39)
		_S.define(_v40, "q", _S.binary("/", _S.prop(_S.read(_v40, "l"), "life"), _S.prop(_S.read(_v40, "l"), "max")))
		_S.invoke(_S.read(_v40, "p"), "glow", [_S.prop(_S.read(_v40, "l"), "x"), _S.prop(_S.read(_v40, "l"), "y"), _S.binary("*", _S.prop(_S.read(_v40, "l"), "r"), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_v40, "q")))), (_S.prop(_S.read(_v40, "C"), 5) if _S.truth(_S.binary(">", _S.prop(_S.read(_v40, "l"), "k"), 1)) else _S.prop(_S.read(_v40, "C"), 6)), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v40, "l"), "k"), _S.read(_v40, "q")), _S.read(_v40, "q"))])
	return null
