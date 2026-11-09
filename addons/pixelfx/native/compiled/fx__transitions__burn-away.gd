@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/burn-away.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "fbm", _S.import_value("core/index.js", "fbm"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "noise2", _S.import_value("core/index.js", "noise2"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "SMOKE_RAMP", _S.import_value("core/index.js", "SMOKE_RAMP"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "field", _S.import_value("fx/transitions/_lib.js", "field"))
	_S.define(_e, "pixels", _S.import_value("fx/transitions/_lib.js", "pixels"))
	_S.define(_e, "lifeLeft", _S.import_value("fx/transitions/_lib.js", "lifeLeft"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "inField", _S.function_value(_e, "_f0"))
	_S.define(_e, "outField", _S.function_value(_e, "_f2"))
	_S.define(_e, "tongue", _S.function_value(_e, "_f5"))
	_S.define(_e, "create", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Burn away"}, {"desc": "The screen burns in from its edges behind a ragged ember line of licking flames, embers and smoke; then the black smoulders and burns open from the middle."}, {"tags": ["burn", "fire", "embers", "smoke", "wipe"]}, {"duration": 3}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"seed": 3}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "CLOSE", 1.18)
	_S.define(_e, "COVER", 1.35)
	_S.define(_e, "SMOULDER", 1.5)
	_S.define(_e, "POP", 1.8)
	_S.define(_e, "OPEN", 2.62)
	_S.define(_e, "SC", 90)
	_S.define(_e, "HALO", 24)
	_S.define(_e, "POOL", 48)
	_S.define(_e, "ASH", ["#a39cab", "#7b7484", "#5c5664", "#433e4b"])
	_S.define(_e, "LAYERS", [[1, 1, 2], [0.76, 0.86, 4], [0.54, 0.68, 6], [0.3, 0.42, 8]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "seed", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "field"), [_S.function_value(_e, "_f1")])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "ux", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.binary("/", _S.read(_e, "W"), 2)), _S.binary("/", _S.read(_e, "W"), 2)))
	_S.define(_e, "uy", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.binary("/", _S.read(_e, "H"), 2)), _S.binary("/", _S.read(_e, "H"), 2)))
	_S.define(_e, "m", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("+", _S.binary("**", _S.read(_e, "ux"), 4), _S.binary("**", _S.read(_e, "uy"), 4)), 0.25]))
	return _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("-", 1, _S.read(_e, "m")), _S.read(_e, "SC")), _S.binary("*", 14, _S.call_value(_S.read(_e, "fbm"), [_S.binary("/", _S.read(_e, "x"), 44), _S.binary("/", _S.read(_e, "y"), 44), _S.read(_e, "seed"), 3]))), _S.binary("*", 2.4, _S.call_value(_S.read(_e, "fbm"), [_S.binary("/", _S.read(_e, "x"), 7), _S.binary("/", _S.read(_e, "y"), 7), _S.binary("+", _S.read(_e, "seed"), 9), 2]))), _S.binary("*", 7, _S.binary("-", 0.5, _S.binary("/", _S.read(_e, "y"), _S.read(_e, "H")))))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "seed", _S.arg(_args, 0))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.binary("*", _S.read(_e, "seed"), 31), 5)]))
	_S.define(_e, "ox", _S.binary("+", _S.binary("/", _S.read(_e, "W"), 2), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 26), 26])))
	_S.define(_e, "oy", _S.binary("+", _S.binary("/", _S.read(_e, "H"), 2), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 14), 6])))
	_S.define(_e, "sats", _S.invoke([_S.unary("-", 1), 1], "map", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "f", _S.call_value(_S.read(_e, "field"), [_S.function_value(_e, "_f4")]))
	_S.set_prop(_S.read(_e, "f"), "ox", _S.read(_e, "ox"), "=", false)
	_S.set_prop(_S.read(_e, "f"), "oy", _S.read(_e, "oy"), "=", false)
	return _S.read(_e, "f")

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.merge([{"x": _S.binary("+", _S.read(_e, "ox"), _S.binary("*", _S.read(_e, "s"), _S.invoke(_S.read(_e, "R"), "range", [70, 110])))}, {"y": _S.binary("+", _S.read(_e, "oy"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 40), 40]))}, {"d": _S.invoke(_S.read(_e, "R"), "range", [30, 44])}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "v", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "ox")), _S.binary("/", _S.read(_e, "W"), 2)), _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "oy")), _S.binary("/", _S.read(_e, "H"), 2))]), _S.read(_e, "SC")))
	for _v0 in _S.array(_S.read(_e, "sats")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		_S.write(_v1, "v", _S.invoke(_S.read(_v1, "Math"), "min", [_S.read(_v1, "v"), _S.binary("+", _S.prop(_S.read(_v1, "s"), "d"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "hypot", [_S.binary("/", _S.binary("-", _S.read(_v1, "x"), _S.prop(_S.read(_v1, "s"), "x")), _S.binary("/", _S.read(_v1, "W"), 2)), _S.binary("/", _S.binary("-", _S.read(_v1, "y"), _S.prop(_S.read(_v1, "s"), "y")), _S.binary("/", _S.read(_v1, "H"), 2))]), _S.read(_v1, "SC")), 1.15))]), "=", false)
	return _S.binary("+", _S.binary("+", _S.read(_e, "v"), _S.binary("*", 13, _S.call_value(_S.read(_e, "fbm"), [_S.binary("/", _S.read(_e, "x"), 40), _S.binary("/", _S.read(_e, "y"), 40), _S.binary("+", _S.read(_e, "seed"), 21), 3]))), _S.binary("*", 2.4, _S.call_value(_S.read(_e, "fbm"), [_S.binary("/", _S.read(_e, "x"), 7), _S.binary("/", _S.read(_e, "y"), 7), _S.binary("+", _S.read(_e, "seed"), 33), 2])))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "F", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "h", _S.arg(_args, 4))
	_S.define(_e, "w", _S.arg(_args, 5))
	_S.define(_e, "sway", _S.arg(_args, 6))
	_S.define(_e, "t", _S.arg(_args, 7))
	_S.define(_e, "n", _S.arg(_args, 8))
	for _v2 in _S.array(_S.read(_e, "LAYERS")):
		var _v3 = _S.scope(_e)
		var _v4 = _v2
		_S.define(_v3, "lw", _S.prop(_v4, 0))
		_S.define(_v3, "lh", _S.prop(_v4, 1))
		_S.define(_v3, "ri", _S.prop(_v4, 2))
		var _v5 = _S.scope(_v3)
		_S.define(_v5, "Ht", _S.binary("*", _S.read(_v5, "h"), _S.read(_v5, "lh")))
		_S.define(_v5, "col", _S.prop(_S.read(_v5, "F"), _S.read(_v5, "ri")))
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "r", 0)
		while _S.truth(_S.binary("<=", _S.read(_v6, "r"), _S.read(_v6, "Ht"))):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "u", _S.binary("/", _S.read(_v7, "r"), _S.invoke(_S.read(_v7, "Math"), "max", [1, _S.read(_v7, "Ht")])))
			_S.define(_v7, "half", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v7, "w"), _S.read(_v7, "lw")), _S.invoke(_S.read(_v7, "Math"), "pow", [_S.binary("-", 1, _S.read(_v7, "u")), 0.85])), _S.invoke(_S.read(_v7, "Math"), "min", [1, _S.binary("/", _S.binary("+", _S.read(_v7, "r"), 1.5), 3.5)])), _S.binary("*", _S.call_value(_S.read(_v7, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v7, "t"), 9), _S.binary("*", _S.read(_v7, "r"), 0.45)), _S.read(_v7, "n")]), 0.5)))
			if _S.truth(_S.binary("<", _S.read(_v7, "half"), 0.3)):
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "r", 1, "+=", true)
				continue
			_S.define(_v7, "cx", _S.binary("+", _S.binary("+", _S.read(_v7, "x"), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v7, "sway"), _S.read(_v7, "u")), _S.read(_v7, "u")), _S.read(_v7, "lh"))), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v7, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v7, "t"), 4), _S.binary("*", _S.read(_v7, "r"), 0.2)), _S.binary("+", _S.read(_v7, "n"), 7)]), _S.read(_v7, "u")), 1.1)))
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "px", _S.invoke(_S.read(_v8, "Math"), "round", [_S.binary("-", _S.read(_v8, "cx"), _S.read(_v8, "half"))]))
			while _S.truth(_S.binary("<=", _S.read(_v8, "px"), _S.invoke(_S.read(_v8, "Math"), "round", [_S.binary("+", _S.read(_v8, "cx"), _S.read(_v8, "half"))]))):
				_S.invoke(_S.read(_v8, "p"), "px", [_S.read(_v8, "px"), _S.invoke(_S.read(_v8, "Math"), "round", [_S.binary("-", _S.read(_v8, "y"), _S.read(_v8, "r"))]), _S.read(_v8, "col")])
				_v8 = _S.iteration(_v8)
				_S.write(_v8, "px", 1, "+=", true)
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "r", 1, "+=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "ink", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "color")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "seed", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 13))
	_S.define(_e, "CHAR", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "ink"), _S.prop(_S.read(_e, "F"), 0), 0.45]))
	_S.define(_e, "SCORCH", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "ink"), _S.call_value(_S.read(_e, "hex"), ["#3a2216"]), 0.6]))
	_S.define(_e, "WARM", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 5), 0.4]))
	_S.define(_e, "SMOKE", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "hex"), ["#8a7276"]), _S.prop(_S.read(_e, "F"), 2), 0.2]))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "inField"), [_S.read(_e, "seed")]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "outField"), [_S.binary("+", _S.read(_e, "seed"), 1)]))
	_S.define(_e, "heat", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "ph", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "fleck", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "jit", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "vein", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), _S.binary("*", _S.read(_v9, "W"), _S.read(_v9, "H")))):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "x", _S.binary("%", _S.read(_v10, "i"), _S.read(_v10, "W")))
		_S.define(_v10, "y", _S.binary("|", _S.binary("/", _S.read(_v10, "i"), _S.read(_v10, "W")), 0))
		_S.set_prop(_S.read(_v10, "heat"), _S.read(_v10, "i"), _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_v10, "noise2"), [_S.binary("/", _S.read(_v10, "x"), 13), _S.binary("/", _S.read(_v10, "y"), 13), _S.binary("+", _S.read(_v10, "seed"), 41)]))), "=", false)
		_S.set_prop(_S.read(_v10, "ph"), _S.read(_v10, "i"), _S.invoke(_S.read(_v10, "Math"), "min", [63, _S.invoke(_S.read(_v10, "Math"), "floor", [_S.binary("*", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_v10, "noise2"), [_S.binary("/", _S.read(_v10, "x"), 23), _S.binary("/", _S.read(_v10, "y"), 23), _S.binary("+", _S.read(_v10, "seed"), 43)]))), 64)])]), "=", false)
		_S.set_prop(_S.read(_v10, "fleck"), _S.read(_v10, "i"), (_S.binary("+", 9, _S.binary("*", 22, _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.binary("+", _S.read(_v10, "seed"), 47)]))) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.binary("+", _S.read(_v10, "seed"), 45)]), 0.04)) else 0), "=", false)
		_S.set_prop(_S.read(_v10, "jit"), _S.read(_v10, "i"), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.binary("+", _S.read(_v10, "seed"), 49)]), 0.5), 1.5), "=", false)
		_S.define(_v10, "rx", _S.binary("+", _S.binary("*", _S.read(_v10, "x"), 0.8), _S.binary("*", _S.read(_v10, "y"), 0.6)))
		_S.define(_v10, "ry", _S.binary("-", _S.binary("*", _S.read(_v10, "y"), 0.8), _S.binary("*", _S.read(_v10, "x"), 0.6)))
		_S.set_prop(_S.read(_v10, "vein"), _S.read(_v10, "i"), _S.invoke(_S.read(_v10, "Math"), "min", [_S.invoke(_S.read(_v10, "Math"), "abs", [_S.call_value(_S.read(_v10, "noise2"), [_S.binary("/", _S.read(_v10, "rx"), 11), _S.binary("/", _S.read(_v10, "ry"), 9), _S.binary("+", _S.read(_v10, "seed"), 61)])]), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "abs", [_S.call_value(_S.read(_v10, "noise2"), [_S.binary("/", _S.read(_v10, "ry"), 5.5), _S.binary("/", _S.read(_v10, "rx"), 5), _S.binary("+", _S.read(_v10, "seed"), 63)])]), 1.5)]), "=", false)
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	_S.define(_e, "FL", _S.construct(_S.read(_e, "Float32Array"), [64]))
	_S.define(_e, "HV", _S.construct(_S.read(_e, "Float32Array"), [64]))
	_S.define(_e, "TW", _S.construct(_S.read(_e, "Uint8Array"), [64]))
	_S.define(_e, "kIn", _S.function_value(_e, "_f7"))
	_S.define(_e, "kOut", _S.function_value(_e, "_f8"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 2)]}])]))
	_S.define(_e, "ash", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": _S.read(_e, "ASH")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "line", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "pin", 0)
	_S.define(_e, "pout", 0)
	_S.define(_e, "closed", false)
	_S.define(_e, "popped", false)
	_S.define(_e, "RATE", _S.merge([{"in": [0.006, 0.0014, 0.0006, 0.0024, 0.0012, 0.0004]}, {"out": [0.006, 0.0005, 0.0004, 0.0012, 0.0004, 0.0004]}]))
	_S.define(_e, "shed", _S.function_value(_e, "_f9"))
	_S.define(_e, "LIT", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "hex"), ["#8a7276"]), _S.prop(_S.read(_e, "F"), 3), 0.25]))
	_S.define(_e, "DIM", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "SMOKE_RAMP"), 3)]))
	_S.define(_e, "drawSmoke", _S.function_value(_e, "_f10"))
	return _S.merge([{"update": _S.function_value(_e, "_f11")}, {"draw": _S.function_value(_e, "_f12")}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("-", _S.prop(_S.read(_e, "A"), "lo"), 8), _S.binary("*", _S.binary("+", _S.binary("-", _S.prop(_S.read(_e, "A"), "hi"), _S.prop(_S.read(_e, "A"), "lo")), 8), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("/", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "t")]), _S.read(_e, "CLOSE")), 1.25])))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (_S.binary("+", _S.binary("-", _S.prop(_S.read(_e, "B"), "lo"), 24), _S.binary("*", 24, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SMOULDER")), _S.binary("-", _S.read(_e, "POP"), _S.read(_e, "SMOULDER")))])]))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))) else _S.binary("+", _S.prop(_S.read(_e, "B"), "lo"), _S.binary("*", _S.binary("+", _S.binary("-", _S.prop(_S.read(_e, "B"), "hi"), _S.prop(_S.read(_e, "B"), "lo")), 16), _S.invoke(_S.read(_e, "ease"), "outQuad", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), _S.binary("-", _S.read(_e, "OPEN"), _S.read(_e, "POP")))])]))))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "inA", _S.arg(_args, 1))
	var _v11 = (_S.prop(_S.read(_e, "RATE"), "in") if _S.truth(_S.read(_e, "inA")) else _S.prop(_S.read(_e, "RATE"), "out"))
	_S.define(_e, "fl", _S.prop(_v11, 0))
	_S.define(_e, "em", _S.prop(_v11, 1))
	_S.define(_e, "sm", _S.prop(_v11, 2))
	_S.define(_e, "sh", _S.prop(_v11, 3))
	_S.define(_e, "as", _S.prop(_v11, 4))
	_S.define(_e, "li", _S.prop(_v11, 5))
	_S.define(_e, "x", _S.binary("+", _S.binary("%", _S.read(_e, "i"), _S.read(_e, "W")), 0.5))
	_S.define(_e, "y", _S.binary("+", _S.binary("|", _S.binary("/", _S.read(_e, "i"), _S.read(_e, "W")), 0), 0.5))
	_S.define(_e, "end", (_S.binary("+", _S.read(_e, "POP"), 0.1) if _S.truth(_S.read(_e, "inA")) else _S.binary("-", _S.read(_e, "D"), 0.05)))
	_S.define(_e, "r", _S.invoke(_S.read(_e, "R"), "next", []))
	if _S.truth(_S.binary("<", _S.write(_e, "r", _S.read(_e, "fl"), "-=", false), 0)):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "life", _S.call_value(_S.read(_v12, "lifeLeft"), [_S.invoke(_S.read(_v12, "R"), "range", [0.18, 0.4]), _S.read(_v12, "t"), _S.read(_v12, "end")]))
		if _S.truth(_S.binary(">", _S.read(_v12, "life"), 0.08)):
			_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "FIRE"), _S.read(_v12, "x"), _S.binary("-", _S.read(_v12, "y"), 3), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [25, 50])), _S.read(_v12, "life"), 0, _S.invoke(_S.read(_v12, "R"), "range", [0.8, 1.7])])
	else:
		if _S.truth(_S.binary("<", _S.write(_e, "r", _S.read(_e, "em"), "-=", false), 0)):
			var _v13 = _S.scope(_e)
			_S.define(_v13, "life", _S.call_value(_S.read(_v13, "lifeLeft"), [(_S.invoke(_S.read(_v13, "R"), "range", [0.6, 1.3]) if _S.truth(_S.read(_v13, "inA")) else _S.invoke(_S.read(_v13, "R"), "range", [0.5, 1])), _S.read(_v13, "t"), _S.read(_v13, "end")]))
			if _S.truth(_S.binary(">", _S.read(_v13, "life"), 0.2)):
				_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "EMBER"), _S.read(_v13, "x"), _S.binary("-", _S.read(_v13, "y"), 2), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [40, 100])), _S.read(_v13, "life"), 0, (2 if _S.truth(_S.invoke(_S.read(_v13, "R"), "chance", [0.25])) else 1)])
		else:
			if _S.truth(_S.binary("<", _S.write(_e, "r", _S.binary("+", _S.read(_e, "sm"), _S.binary("*", _S.read(_e, "sh"), _S.binary("**", _S.prop(_S.read(_e, "heat"), _S.read(_e, "i")), 2))), "-=", false), 0)):
				var _v14 = _S.scope(_e)
				_S.define(_v14, "n", _S.invoke(_S.read(_v14, "R"), "int", [4, 6]))
				_S.define(_v14, "vx", _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 6), 6]))
				_S.define(_v14, "up", _S.binary("<", _S.prop(_S.prop((_S.read(_v14, "A") if _S.truth(_S.read(_v14, "inA")) else _S.read(_v14, "B")), "ny"), _S.read(_v14, "i")), _S.unary("-", 0.25)))
				var _v15 = _S.scope(_v14)
				_S.define(_v15, "j", 0)
				while _S.truth(_S.binary("<", _S.read(_v15, "j"), _S.read(_v15, "n"))):
					var _v16 = _S.scope(_v15)
					_S.define(_v16, "life", _S.call_value(_S.read(_v16, "lifeLeft"), [(_S.invoke(_S.read(_v16, "R"), "range", [0.8, 1.3]) if _S.truth(_S.read(_v16, "up")) else _S.invoke(_S.read(_v16, "R"), "range", [0.35, 0.65])), _S.binary("+", _S.read(_v16, "t"), _S.binary("*", _S.read(_v16, "j"), 0.05)), _S.read(_v16, "end")]))
					if _S.truth(_S.binary(">", _S.read(_v16, "life"), 0.4)):
						_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "SMOKE"), _S.binary("+", _S.read(_v16, "x"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 3.5), 3.5])), _S.binary("-", _S.binary("-", _S.read(_v16, "y"), 4), _S.binary("*", _S.read(_v16, "j"), 1.2)), _S.binary("+", _S.read(_v16, "vx"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 3), 3])), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [18, 34])), _S.read(_v16, "life"), _S.read(_v16, "SMOKE"), _S.invoke(_S.read(_v16, "R"), "range", [2.8, 4.8]), _S.binary("*", _S.read(_v16, "j"), 0.05)])
					_v15 = _S.iteration(_v15)
					_S.write(_v15, "j", 1, "+=", true)
			else:
				if _S.truth(_S.binary("<", _S.write(_e, "r", _S.read(_e, "as"), "-=", false), 0)):
					var _v17 = _S.scope(_e)
					_S.define(_v17, "life", _S.call_value(_S.read(_v17, "lifeLeft"), [_S.invoke(_S.read(_v17, "R"), "range", [0.9, 1.6]), _S.read(_v17, "t"), _S.read(_v17, "end")]))
					if _S.truth(_S.binary(">", _S.read(_v17, "life"), 0.3)):
						_S.invoke(_S.read(_v17, "ash"), "spawn", [_S.prop(_S.read(_v17, "P"), "EMBER"), _S.read(_v17, "x"), _S.binary("-", _S.read(_v17, "y"), 2), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 18), 18]), _S.unary("-", _S.invoke(_S.read(_v17, "R"), "range", [25, 60])), _S.read(_v17, "life")])
				else:
					if _S.truth(_S.binary("<", _S.write(_e, "r", _S.read(_e, "li"), "-=", false), 0)):
						_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 4), _S.invoke(_S.read(_e, "R"), "range", [20, 32]), _S.read(_e, "WARM"), _S.invoke(_S.read(_e, "R"), "range", [0.14, 0.26]), _S.invoke(_S.read(_e, "R"), "range", [0.18, 0.4])])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "p0", _S.arg(_args, 1))
	_S.define(_e, "inPhase", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "COVER")))
	_S.define(_e, "open", _S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SMOULDER")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OPEN"), 0.25))))
	_S.define(_e, "k", (_S.call_value(_S.read(_e, "kIn"), [_S.read(_e, "t")]) if _S.truth(_S.read(_e, "inPhase")) else _S.call_value(_S.read(_e, "kOut"), [_S.read(_e, "t")])))
	_S.define(_e, "f", (_S.prop(_S.read(_e, "A"), "f") if _S.truth(_S.read(_e, "inPhase")) else _S.prop(_S.read(_e, "B"), "f")))
	for _v18 in _S.array(_S.prop(_S.read(_e, "ps"), "list")):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "q", _v18)
		var _v20 = _S.scope(_v19)
		if _S.truth(_S.logical("||", _S.binary("!==", _S.prop(_S.read(_v20, "q"), "k"), _S.prop(_S.read(_v20, "P"), "SMOKE")), func(): return _S.binary(">", _S.prop(_S.read(_v20, "q"), "delay"), 0))):
			continue
		_S.define(_v20, "kk", _S.binary("/", _S.prop(_S.read(_v20, "q"), "life"), _S.prop(_S.read(_v20, "q"), "max")))
		_S.define(_v20, "age", _S.binary("-", 1, _S.read(_v20, "kk")))
		_S.define(_v20, "r", _S.binary("*", _S.prop(_S.read(_v20, "q"), "size"), _S.binary("+", _S.binary("+", 0.65, _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "min", [1, _S.binary("*", _S.read(_v20, "age"), 2.5)]), 0.45)), _S.binary("*", _S.read(_v20, "age"), 0.4))))
		_S.define(_v20, "i", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_v20, "clamp"), [_S.invoke(_S.read(_v20, "Math"), "floor", [_S.prop(_S.read(_v20, "q"), "y")]), 0, _S.binary("-", _S.read(_v20, "H"), 1)]), _S.read(_v20, "W")), _S.call_value(_S.read(_v20, "clamp"), [_S.invoke(_S.read(_v20, "Math"), "floor", [_S.prop(_S.read(_v20, "q"), "x")]), 0, _S.binary("-", _S.read(_v20, "W"), 1)])))
		_S.define(_v20, "e", ((_S.binary("-", _S.read(_v20, "k"), _S.prop(_S.read(_v20, "f"), _S.read(_v20, "i"))) if _S.truth(_S.read(_v20, "inPhase")) else _S.binary("-", _S.prop(_S.read(_v20, "f"), _S.read(_v20, "i")), _S.read(_v20, "k"))) if _S.truth(_S.logical("||", _S.read(_v20, "inPhase"), func(): return _S.read(_v20, "open"))) else 99))
		_S.define(_v20, "lit", _S.call_value(_S.read(_v20, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v20, "Math"), "abs", [_S.read(_v20, "e")]), 30))]))
		_S.define(_v20, "a", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "min", [1, _S.binary("*", _S.read(_v20, "age"), 12)]), _S.invoke(_S.read(_v20, "Math"), "min", [1, _S.binary("*", _S.read(_v20, "kk"), 2.4)])), 0.58), (_S.binary("+", 0.05, _S.binary("*", 0.95, _S.read(_v20, "lit"))) if _S.truth(_S.binary(">", _S.read(_v20, "e"), 0)) else (1 if _S.truth(_S.read(_v20, "inPhase")) else _S.binary("+", 0.2, _S.binary("*", 0.8, _S.read(_v20, "lit")))))))
		if _S.truth(_S.binary("<", _S.read(_v20, "a"), 0.04)):
			continue
		_S.define(_v20, "c", _S.call_value(_S.read(_v20, "mix"), [_S.call_value(_S.read(_v20, "mix"), [_S.read(_v20, "DIM"), _S.read(_v20, "LIT"), _S.read(_v20, "lit")]), _S.prop(_S.read(_v20, "SMOKE_RAMP"), 2), _S.binary("*", _S.read(_v20, "age"), 0.5)]))
		_S.define(_v20, "d", (_S.read(_v20, "p0") if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.binary("-", _S.prop(_S.read(_v20, "q"), "x"), _S.read(_v20, "r")), 0), func(): return _S.binary(">", _S.binary("-", _S.prop(_S.read(_v20, "q"), "y"), _S.read(_v20, "r")), 0)), func(): return _S.binary("<", _S.binary("+", _S.prop(_S.read(_v20, "q"), "x"), _S.read(_v20, "r")), _S.binary("-", _S.read(_v20, "W"), 1))), func(): return _S.binary("<", _S.binary("+", _S.prop(_S.read(_v20, "q"), "y"), _S.read(_v20, "r")), _S.binary("-", _S.read(_v20, "H"), 1)))) else _S.read(_v20, "p")))
		_S.invoke(_S.read(_v20, "d"), "disc", [_S.prop(_S.read(_v20, "q"), "x"), _S.prop(_S.read(_v20, "q"), "y"), _S.read(_v20, "r"), _S.read(_v20, "c"), _S.binary("*", _S.read(_v20, "a"), 0.45)])
		_S.invoke(_S.read(_v20, "d"), "disc", [_S.binary("+", _S.prop(_S.read(_v20, "q"), "x"), _S.binary("*", _S.read(_v20, "r"), 0.05)), _S.binary("+", _S.prop(_S.read(_v20, "q"), "y"), _S.binary("*", _S.read(_v20, "r"), 0.06)), _S.binary("*", _S.read(_v20, "r"), 0.74), _S.read(_v20, "c"), _S.binary("*", _S.read(_v20, "a"), 0.62)])
		if _S.truth(_S.binary("<", _S.read(_v20, "age"), 0.5)):
			_S.invoke(_S.read(_v20, "d"), "disc", [_S.binary("-", _S.prop(_S.read(_v20, "q"), "x"), _S.binary("*", _S.read(_v20, "r"), 0.22)), _S.binary("-", _S.prop(_S.read(_v20, "q"), "y"), _S.binary("*", _S.read(_v20, "r"), 0.3)), _S.binary("*", _S.read(_v20, "r"), 0.5), _S.call_value(_S.read(_v20, "mix"), [_S.read(_v20, "c"), _S.read(_v20, "WHITE"), 0.15]), _S.binary("*", _S.binary("*", _S.read(_v20, "a"), 0.4), _S.binary("-", 1, _S.binary("*", _S.read(_v20, "age"), 2)))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "COVER"))):
		var _v21 = _S.scope(_e)
		_S.define(_v21, "k", _S.call_value(_S.read(_v21, "kIn"), [_S.read(_v21, "t")]))
		while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v21, "pin"), _S.prop(_S.prop(_S.read(_v21, "A"), "order"), "length")), func(): return _S.binary("<=", _S.prop(_S.prop(_S.read(_v21, "A"), "f"), _S.prop(_S.prop(_S.read(_v21, "A"), "order"), _S.read(_v21, "pin"))), _S.read(_v21, "k")))):
			_S.call_value(_S.read(_v21, "shed"), [_S.prop(_S.prop(_S.read(_v21, "A"), "order"), _S.write(_v21, "pin", 1, "+=", true)), true])
		if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v21, "closed")), func(): return _S.binary(">=", _S.read(_v21, "t"), _S.read(_v21, "CLOSE")))):
			var _v22 = _S.scope(_v21)
			_S.write(_v22, "closed", true, "=", false)
			_S.define(_v22, "i", _S.prop(_S.prop(_S.read(_v22, "A"), "order"), _S.binary("-", _S.prop(_S.prop(_S.read(_v22, "A"), "order"), "length"), 1)))
			_S.define(_v22, "x", _S.binary("%", _S.read(_v22, "i"), _S.read(_v22, "W")))
			_S.define(_v22, "y", _S.binary("|", _S.binary("/", _S.read(_v22, "i"), _S.read(_v22, "W")), 0))
			_S.invoke(_S.read(_v22, "lights"), "add", [_S.read(_v22, "x"), _S.read(_v22, "y"), 64, _S.read(_v22, "WARM"), 0.5, 0.4])
			var _v23 = _S.scope(_v22)
			_S.define(_v23, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v23, "j"), 12)):
				_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "EMBER"), _S.binary("+", _S.read(_v23, "x"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 6), 6])), _S.binary("+", _S.read(_v23, "y"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 3), 3])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 50), 50]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [40, 120])), _S.invoke(_S.read(_v23, "R"), "range", [0.5, 0.75]), 0, (2 if _S.truth(_S.invoke(_S.read(_v23, "R"), "chance", [0.3])) else 1)])
				_v23 = _S.iteration(_v23)
				_S.write(_v23, "j", 1, "+=", true)
			var _v24 = _S.scope(_v22)
			_S.define(_v24, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v24, "j"), 5)):
				_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "SMOKE"), _S.binary("+", _S.read(_v24, "x"), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 8), 8])), _S.binary("+", _S.read(_v24, "y"), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 4), 2])), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [12, 28])), _S.invoke(_S.read(_v24, "R"), "range", [1.1, 1.6]), _S.read(_v24, "SMOKE"), _S.invoke(_S.read(_v24, "R"), "range", [3.5, 5.5]), _S.invoke(_S.read(_v24, "R"), "range", [0, 0.15])])
				_v24 = _S.iteration(_v24)
				_S.write(_v24, "j", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SMOULDER")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.1]))):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "i", _S.prop(_S.prop(_S.read(_v25, "B"), "order"), _S.invoke(_S.read(_v25, "R"), "int", [0, 400])))
		_S.define(_v25, "x", _S.binary("+", _S.binary("%", _S.read(_v25, "i"), _S.read(_v25, "W")), 0.5))
		_S.define(_v25, "y", _S.binary("+", _S.binary("|", _S.binary("/", _S.read(_v25, "i"), _S.read(_v25, "W")), 0), 0.5))
		if _S.truth(_S.invoke(_S.read(_v25, "R"), "chance", [0.6])):
			_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "SMOKE"), _S.read(_v25, "x"), _S.read(_v25, "y"), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [8, 16])), _S.call_value(_S.read(_v25, "lifeLeft"), [_S.invoke(_S.read(_v25, "R"), "range", [0.9, 1.4]), _S.read(_v25, "t"), _S.binary("-", _S.read(_v25, "D"), 0.05)]), _S.read(_v25, "SMOKE"), _S.invoke(_S.read(_v25, "R"), "range", [2, 3.5])])
		else:
			_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "EMBER"), _S.read(_v25, "x"), _S.read(_v25, "y"), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [15, 40])), _S.invoke(_S.read(_v25, "R"), "range", [0.4, 0.8])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")))):
		var _v26 = _S.scope(_e)
		_S.write(_v26, "popped", true, "=", false)
		_S.invoke(_S.read(_v26, "lights"), "add", [_S.prop(_S.read(_v26, "B"), "ox"), _S.prop(_S.read(_v26, "B"), "oy"), 90, _S.read(_v26, "WARM"), 0.6, 0.45])
		_S.invoke(_S.read(_v26, "lights"), "add", [_S.prop(_S.read(_v26, "B"), "ox"), _S.prop(_S.read(_v26, "B"), "oy"), 34, _S.prop(_S.read(_v26, "F"), 7), 0.7, 0.12])
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v27, "j"), 12)):
			var _v28 = _S.scope(_v27)
			_S.define(_v28, "a", _S.invoke(_S.read(_v28, "R"), "range", [0, _S.read(_v28, "TAU")]))
			_S.define(_v28, "sp", _S.invoke(_S.read(_v28, "R"), "range", [50, 150]))
			_S.invoke(_S.read(_v28, "ps"), "spawn", [_S.prop(_S.read(_v28, "P"), "EMBER"), _S.binary("+", _S.prop(_S.read(_v28, "B"), "ox"), _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "cos", [_S.read(_v28, "a")]), 3)), _S.binary("+", _S.prop(_S.read(_v28, "B"), "oy"), _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "sin", [_S.read(_v28, "a")]), 2)), _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "cos", [_S.read(_v28, "a")]), _S.read(_v28, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "sin", [_S.read(_v28, "a")]), _S.read(_v28, "sp")), 0.7), 40), _S.invoke(_S.read(_v28, "R"), "range", [0.4, 0.9]), 0, (2 if _S.truth(_S.invoke(_S.read(_v28, "R"), "chance", [0.3])) else 1)])
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "j", 1, "+=", true)
		var _v29 = _S.scope(_v26)
		_S.define(_v29, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "j"), 10)):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "a", _S.invoke(_S.read(_v30, "R"), "range", [0, _S.read(_v30, "TAU")]))
			_S.define(_v30, "sp", _S.invoke(_S.read(_v30, "R"), "range", [120, 260]))
			_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "SPARK"), _S.prop(_S.read(_v30, "B"), "ox"), _S.prop(_S.read(_v30, "B"), "oy"), _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "a")]), _S.read(_v30, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "a")]), _S.read(_v30, "sp")), 50), _S.invoke(_S.read(_v30, "R"), "range", [0.15, 0.35])])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "j", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OPEN"), 0.2)))):
		var _v31 = _S.scope(_e)
		_S.define(_v31, "k", _S.call_value(_S.read(_v31, "kOut"), [_S.read(_v31, "t")]))
		while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v31, "pout"), _S.prop(_S.prop(_S.read(_v31, "B"), "order"), "length")), func(): return _S.binary("<=", _S.prop(_S.prop(_S.read(_v31, "B"), "f"), _S.prop(_S.prop(_S.read(_v31, "B"), "order"), _S.read(_v31, "pout"))), _S.read(_v31, "k")))):
			_S.call_value(_S.read(_v31, "shed"), [_S.prop(_S.prop(_S.read(_v31, "B"), "order"), _S.write(_v31, "pout", 1, "+=", true)), false])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ash"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p0", _S.arg(_args, 0))
	_S.define(_e, "p", _S.call_value(_S.read(_e, "clipTo"), [_S.read(_e, "p0")]))
	_S.set_prop(_S.read(_e, "line"), "length", 0, "=", false)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "COVER")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SMOULDER")))):
		_S.call_value(_S.read(_e, "rect"), [_S.read(_e, "p0"), 0, 0, _S.read(_e, "W"), _S.read(_e, "H"), _S.read(_e, "ink")])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OPEN"), 0.25))):
			var _v32 = _S.scope(_e)
			_S.define(_v32, "inPhase", _S.binary("<", _S.read(_v32, "t"), _S.read(_v32, "COVER")))
			_S.define(_v32, "k", (_S.call_value(_S.read(_v32, "kIn"), [_S.read(_v32, "t")]) if _S.truth(_S.read(_v32, "inPhase")) else _S.call_value(_S.read(_v32, "kOut"), [_S.read(_v32, "t")])))
			_S.define(_v32, "Fd", (_S.read(_v32, "A") if _S.truth(_S.read(_v32, "inPhase")) else _S.read(_v32, "B")))
			_S.define(_v32, "f", _S.prop(_S.read(_v32, "Fd"), "f"))
			_S.define(_v32, "g", _S.prop(_S.read(_v32, "Fd"), "g"))
			_S.define(_v32, "fade", (_S.binary("-", 1, _S.call_value(_S.read(_v32, "smooth"), [_S.binary("-", _S.read(_v32, "COVER"), 0.15), _S.read(_v32, "COVER"), _S.read(_v32, "t")])) if _S.truth(_S.read(_v32, "inPhase")) else 1))
			var _v33 = _S.scope(_v32)
			_S.define(_v33, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v33, "j"), 64)):
				var _v34 = _S.scope(_v33)
				_S.define(_v34, "q", _S.binary("/", _S.read(_v34, "j"), 63))
				_S.set_prop(_S.read(_v34, "FL"), _S.read(_v34, "j"), _S.binary("+", 0.75, _S.binary("*", 0.25, _S.invoke(_S.read(_v34, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v34, "t"), 7), _S.binary("*", _S.read(_v34, "q"), 9))]))), "=", false)
				_S.set_prop(_S.read(_v34, "HV"), _S.read(_v34, "j"), _S.binary("*", 0.3, _S.invoke(_S.read(_v34, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v34, "t"), 5.5), _S.binary("*", _S.read(_v34, "q"), 11))])), "=", false)
				_S.set_prop(_S.read(_v34, "TW"), _S.read(_v34, "j"), (1 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v34, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v34, "t"), 13), _S.binary("*", _S.read(_v34, "q"), 40))]), _S.unary("-", 0.5))) else 0), "=", false)
				_v33 = _S.iteration(_v33)
				_S.write(_v33, "j", 1, "+=", true)
			_S.define(_v32, "px", _S.call_value(_S.read(_v32, "pixels"), [_S.read(_v32, "p0")]))
			_S.define(_v32, "ord", _S.prop(_S.read(_v32, "Fd"), "order"))
			_S.define(_v32, "N", _S.prop(_S.read(_v32, "ord"), "length"))
			_S.define(_v32, "su", _S.call_value(_S.read(_v32, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v32, "t"), _S.read(_v32, "SMOULDER")), _S.binary("-", _S.read(_v32, "POP"), _S.read(_v32, "SMOULDER")))]))
			_S.define(_v32, "SR", _S.binary("+", 5, _S.binary("*", 17, _S.read(_v32, "su"))))
			_S.define(_v32, "sk", (0 if _S.truth(_S.logical("||", _S.read(_v32, "inPhase"), func(): return _S.binary("<", _S.read(_v32, "t"), _S.read(_v32, "SMOULDER")))) else (_S.binary("+", 0.3, _S.binary("*", 0.7, _S.read(_v32, "su"))) if _S.truth(_S.binary("<", _S.read(_v32, "t"), _S.read(_v32, "POP"))) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v32, "t"), _S.read(_v32, "POP")), 0.3)))))
			_S.define(_v32, "shadeAt", _S.function_value(_v32, "_f13"))
			_S.define(_v32, "lo", _S.invoke(_S.read(_v32, "Fd"), "below", [_S.binary("-", _S.read(_v32, "k"), (33 if _S.truth(_S.read(_v32, "inPhase")) else _S.read(_v32, "POOL")))]))
			_S.define(_v32, "hi", _S.invoke(_S.read(_v32, "Fd"), "below", [_S.invoke(_S.read(_v32, "Math"), "max", [_S.binary("+", _S.read(_v32, "k"), (_S.read(_v32, "POOL") if _S.truth(_S.read(_v32, "inPhase")) else 33)), (_S.binary("+", _S.prop(_S.read(_v32, "B"), "lo"), _S.read(_v32, "SR")) if _S.truth(_S.binary(">", _S.read(_v32, "sk"), 0)) else _S.unary("-", 1000000000))])]))
			var _v41 = ([0, _S.read(_v32, "lo"), _S.read(_v32, "lo"), _S.read(_v32, "hi")] if _S.truth(_S.read(_v32, "inPhase")) else [_S.read(_v32, "hi"), _S.read(_v32, "N"), _S.read(_v32, "lo"), _S.read(_v32, "hi")])
			_S.define(_v32, "c0", _S.prop(_v41, 0))
			_S.define(_v32, "c1", _S.prop(_v41, 1))
			_S.define(_v32, "a0", _S.prop(_v41, 2))
			_S.define(_v32, "a1", _S.prop(_v41, 3))
			var _v42 = _S.scope(_v32)
			_S.define(_v42, "j", _S.read(_v42, "c0"))
			while _S.truth(_S.binary("<", _S.read(_v42, "j"), _S.read(_v42, "c1"))):
				var _v43 = _S.scope(_v42)
				_S.define(_v43, "i", _S.prop(_S.read(_v43, "ord"), _S.read(_v43, "j")))
				if _S.truth(_S.prop(_S.read(_v43, "fleck"), _S.read(_v43, "i"))):
					_S.call_value(_S.read(_v43, "shadeAt"), [_S.read(_v43, "i")])
				else:
					_S.last([_S.invoke(_S.read(_v43, "px"), "at", [_S.read(_v43, "i")]), _S.invoke(_S.read(_v43, "px"), "put", [_S.read(_v43, "ink")])])
				_v42 = _S.iteration(_v42)
				_S.write(_v42, "j", 1, "+=", true)
			var _v44 = _S.scope(_v32)
			_S.define(_v44, "j", _S.read(_v44, "a0"))
			while _S.truth(_S.binary("<", _S.read(_v44, "j"), _S.read(_v44, "a1"))):
				_S.call_value(_S.read(_v44, "shadeAt"), [_S.prop(_S.read(_v44, "ord"), _S.read(_v44, "j"))])
				_v44 = _S.iteration(_v44)
				_S.write(_v44, "j", 1, "+=", true)
			for _v45 in _S.array(_S.read(_v32, "line")):
				var _v46 = _S.scope(_v32)
				_S.define(_v46, "i", _v45)
				var _v47 = _S.scope(_v46)
				_S.define(_v47, "x", _S.binary("%", _S.read(_v47, "i"), _S.read(_v47, "W")))
				_S.define(_v47, "y", _S.binary("|", _S.binary("/", _S.read(_v47, "i"), _S.read(_v47, "W")), 0))
				_S.define(_v47, "dn", (_S.unary("-", _S.prop(_S.prop(_S.read(_v47, "Fd"), "ny"), _S.read(_v47, "i"))) if _S.truth(_S.read(_v47, "inPhase")) else _S.prop(_S.prop(_S.read(_v47, "Fd"), "ny"), _S.read(_v47, "i"))))
				_S.define(_v47, "h0", _S.call_value(_S.read(_v47, "rand"), [_S.read(_v47, "x"), _S.binary(">>", _S.read(_v47, "y"), 3), _S.binary("+", _S.read(_v47, "seed"), 51)]))
				if _S.truth(_S.binary(">", _S.read(_v47, "h0"), _S.binary("+", 0.12, _S.binary("*", 0.6, _S.invoke(_S.read(_v47, "Math"), "max", [0, _S.read(_v47, "dn")]))))):
					continue
				_S.define(_v47, "n", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_v47, "x"), 7), _S.binary("*", _S.binary(">>", _S.read(_v47, "y"), 4), 131)), 977))
				_S.define(_v47, "hv", _S.prop(_S.read(_v47, "heat"), _S.read(_v47, "i")))
				_S.define(_v47, "leap", _S.binary("+", 1, _S.binary("*", _S.invoke(_S.read(_v47, "Math"), "max", [0, _S.binary("-", _S.call_value(_S.read(_v47, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v47, "t"), 2.6), _S.binary("*", _S.read(_v47, "n"), 3.1)), _S.binary("+", _S.read(_v47, "n"), 70)]), 0.5)]), 1.8)))
				_S.define(_v47, "h", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("+", 5, _S.binary("*", 7, _S.call_value(_S.read(_v47, "rand"), [_S.read(_v47, "x"), 1, _S.binary("+", _S.read(_v47, "seed"), 53)]))), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.call_value(_S.read(_v47, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v47, "t"), 3.3), _S.binary("*", _S.read(_v47, "n"), 1.7)), _S.read(_v47, "n")])))), _S.binary("+", 0.6, _S.binary("*", 0.6, _S.read(_v47, "hv")))), _S.read(_v47, "leap")), _S.read(_v47, "fade")), (_S.binary("+", 0.65, _S.binary("*", 0.5, _S.read(_v47, "dn"))) if _S.truth(_S.binary(">", _S.read(_v47, "dn"), 0)) else 0.5)))
				if _S.truth(_S.binary(">=", _S.read(_v47, "h"), 1.5)):
					_S.call_value(_S.read(_v47, "tongue"), [_S.read(_v47, "p"), _S.read(_v47, "F"), _S.binary("+", _S.read(_v47, "x"), 0.5), _S.binary("+", _S.read(_v47, "y"), 1), _S.read(_v47, "h"), _S.binary("*", _S.binary("+", 1.1, _S.binary("*", 0.7, _S.read(_v47, "hv"))), _S.binary("+", 0.8, _S.binary("/", _S.read(_v47, "h"), 16))), _S.binary("*", _S.call_value(_S.read(_v47, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v47, "t"), 2.2), _S.read(_v47, "n")), _S.binary("+", _S.read(_v47, "n"), 40)]), 1.5), _S.read(_v47, "t"), _S.read(_v47, "n")])
	_S.call_value(_S.read(_e, "drawSmoke"), [_S.read(_e, "p"), _S.read(_e, "p0")])
	_S.invoke(_S.read(_e, "ash"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "e", (_S.binary("-", _S.read(_e, "k"), _S.prop(_S.read(_e, "f"), _S.read(_e, "i"))) if _S.truth(_S.read(_e, "inPhase")) else _S.binary("-", _S.prop(_S.read(_e, "f"), _S.read(_e, "i")), _S.read(_e, "k"))))
	_S.define(_e, "s", _S.binary("*", _S.read(_e, "e"), _S.prop(_S.read(_e, "g"), _S.read(_e, "i"))))
	_S.invoke(_S.read(_e, "px"), "at", [_S.read(_e, "i")])
	if _S.truth(_S.binary("<", _S.read(_e, "e"), 0)):
		var _v35 = _S.scope(_e)
		if _S.truth(_S.logical("&&", _S.read(_v35, "inPhase"), func(): return _S.binary(">", _S.read(_v35, "s"), _S.unary("-", 2.5)))):
			_S.invoke(_S.read(_v35, "px"), "blend", [_S.read(_v35, "SCORCH"), _S.binary("*", 0.5, _S.binary("+", 1, _S.binary("/", _S.read(_v35, "s"), 2.5)))])
		_S.define(_v35, "u", _S.invoke(_S.read(_v35, "Math"), "max", [0, _S.binary("+", 1, _S.binary("/", _S.read(_v35, "e"), _S.read(_v35, "HALO")))]))
		_S.define(_v35, "v", _S.binary("+", 1, _S.binary("/", _S.read(_v35, "e"), _S.read(_v35, "POOL"))))
		_S.invoke(_S.read(_v35, "px"), "add", [_S.read(_v35, "WARM"), _S.binary("*", _S.binary("+", _S.binary("*", _S.binary("*", 0.3, _S.read(_v35, "u")), _S.read(_v35, "u")), _S.binary("*", _S.binary("*", 0.12, _S.read(_v35, "v")), _S.read(_v35, "v"))), _S.prop(_S.read(_v35, "FL"), _S.prop(_S.read(_v35, "ph"), _S.read(_v35, "i"))))])
		return null
	_S.define(_e, "hv", _S.call_value(_S.read(_e, "clamp"), [_S.binary("+", _S.prop(_S.read(_e, "heat"), _S.read(_e, "i")), _S.prop(_S.read(_e, "HV"), _S.prop(_S.read(_e, "ph"), _S.read(_e, "i"))))]))
	_S.define(_e, "th", _S.binary("+", 0.6, _S.binary("*", 0.6, _S.read(_e, "hv"))))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "s"), _S.read(_e, "th")))
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 6.4)):
		var _v36 = _S.scope(_e)
		if _S.truth(_S.binary("<", _S.read(_v36, "u"), 0.9)):
			_S.invoke(_S.read(_v36, "line"), "push", [_S.read(_v36, "i")])
		_S.invoke(_S.read(_v36, "px"), "put", [((_S.prop(_S.read(_v36, "F"), 8) if _S.truth(_S.binary(">", _S.read(_v36, "hv"), 0.6)) else _S.prop(_S.read(_v36, "F"), 7)) if _S.truth(_S.binary("<", _S.read(_v36, "u"), 0.9)) else (_S.prop(_S.read(_v36, "F"), 6) if _S.truth(_S.binary("<", _S.read(_v36, "u"), 1.7)) else (_S.prop(_S.read(_v36, "F"), 5) if _S.truth(_S.binary("<", _S.read(_v36, "u"), 2.4)) else (_S.prop(_S.read(_v36, "F"), 4) if _S.truth(_S.binary("<", _S.read(_v36, "u"), 3.1)) else (_S.prop(_S.read(_v36, "F"), 3) if _S.truth(_S.binary("<", _S.read(_v36, "u"), 3.8)) else (_S.prop(_S.read(_v36, "F"), 2) if _S.truth(_S.binary("<", _S.read(_v36, "u"), 4.6)) else (_S.prop(_S.read(_v36, "F"), 1) if _S.truth(_S.binary("<", _S.read(_v36, "u"), 5.5)) else _S.prop(_S.read(_v36, "F"), 0))))))))])
		if _S.truth(_S.binary("<", _S.read(_v36, "u"), 4.6)):
			_S.invoke(_S.read(_v36, "px"), "add", [_S.read(_v36, "WARM"), _S.binary("*", _S.binary("*", 0.45, _S.binary("-", 1, _S.binary("/", _S.read(_v36, "u"), 4.6))), _S.binary("+", 0.7, _S.binary("*", 0.3, _S.read(_v36, "hv"))))])
		return null
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "sk"), 0), func(): return _S.binary("<", _S.prop(_S.read(_e, "f"), _S.read(_e, "i")), _S.binary("+", _S.prop(_S.read(_e, "B"), "lo"), _S.read(_e, "SR"))))):
		var _v37 = _S.scope(_e)
		_S.define(_v37, "hm", _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.prop(_S.read(_v37, "f"), _S.read(_v37, "i")), _S.prop(_S.read(_v37, "B"), "lo")), _S.read(_v37, "SR"))), _S.read(_v37, "sk")), _S.binary("+", 0.7, _S.binary("*", 0.6, _S.read(_v37, "hv")))))
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v37, "vein"), _S.read(_v37, "i")), _S.binary("+", 0.04, _S.binary("*", 0.08, _S.read(_v37, "hm"))))):
			var _v38 = _S.scope(_v37)
			_S.invoke(_S.read(_v38, "px"), "put", [(_S.prop(_S.read(_v38, "F"), 6) if _S.truth(_S.binary(">", _S.read(_v38, "hm"), 0.95)) else (_S.prop(_S.read(_v38, "F"), 5) if _S.truth(_S.binary(">", _S.read(_v38, "hm"), 0.75)) else (_S.prop(_S.read(_v38, "F"), 4) if _S.truth(_S.binary(">", _S.read(_v38, "hm"), 0.55)) else (_S.prop(_S.read(_v38, "F"), 3) if _S.truth(_S.binary(">", _S.read(_v38, "hm"), 0.38)) else (_S.prop(_S.read(_v38, "F"), 2) if _S.truth(_S.binary(">", _S.read(_v38, "hm"), 0.22)) else _S.prop(_S.read(_v38, "F"), 1))))))])
			_S.invoke(_S.read(_v38, "px"), "add", [_S.read(_v38, "WARM"), _S.binary("*", 0.4, _S.read(_v38, "hm"))])
			return null
		_S.invoke(_S.read(_v37, "px"), "add", [_S.read(_v37, "WARM"), _S.binary("*", _S.binary("*", 0.2, _S.read(_v37, "hm")), _S.read(_v37, "hm"))])
	_S.define(_e, "L", _S.binary("*", _S.prop(_S.read(_e, "fleck"), _S.read(_e, "i")), _S.binary("+", 0.8, _S.binary("*", 0.4, _S.read(_e, "hv")))))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "L"), 0), func(): return _S.binary("<", _S.read(_e, "s"), _S.read(_e, "L")))):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "v", _S.binary("/", _S.binary("-", _S.read(_v39, "s"), _S.binary("*", 6.4, _S.read(_v39, "th"))), _S.invoke(_S.read(_v39, "Math"), "max", [1, _S.binary("-", _S.read(_v39, "L"), _S.binary("*", 6.4, _S.read(_v39, "th")))])))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v39, "v"), 1), func(): return _S.prop(_S.read(_v39, "TW"), _S.binary("&", _S.binary("*", _S.prop(_S.read(_v39, "ph"), _S.read(_v39, "i")), 5), 63))), func(): return _S.unary("!", _S.logical("&&", _S.binary("<", _S.read(_v39, "fade"), 1), func(): return _S.binary("<=", _S.read(_v39, "fade"), _S.binary("+", _S.binary("/", _S.prop(_S.read(_v39, "jit"), _S.read(_v39, "i")), 1.5), 0.5)))))):
			var _v40 = _S.scope(_v39)
			_S.invoke(_S.read(_v40, "px"), "put", [(_S.prop(_S.read(_v40, "F"), 4) if _S.truth(_S.binary("<", _S.read(_v40, "v"), 0.3)) else (_S.prop(_S.read(_v40, "F"), 3) if _S.truth(_S.binary("<", _S.read(_v40, "v"), 0.55)) else (_S.prop(_S.read(_v40, "F"), 2) if _S.truth(_S.binary("<", _S.read(_v40, "v"), 0.8)) else _S.prop(_S.read(_v40, "F"), 1))))])
			_S.invoke(_S.read(_v40, "px"), "add", [_S.read(_v40, "WARM"), _S.binary("*", 0.3, _S.binary("-", 1, _S.read(_v40, "v")))])
			return null
	if _S.truth(_S.binary("<", _S.read(_e, "e"), 22)):
		_S.invoke(_S.read(_e, "px"), "add", [_S.read(_e, "WARM"), _S.binary("*", 0.2, _S.binary("**", _S.binary("-", 1, _S.binary("/", _S.read(_e, "e"), 22)), 2))])
	_S.invoke(_S.read(_e, "px"), "put", [(_S.read(_e, "CHAR") if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "u"), 6.4), _S.binary("+", _S.binary("*", 1.6, _S.read(_e, "th")), _S.prop(_S.read(_e, "jit"), _S.read(_e, "i"))))) else _S.read(_e, "ink"))])
	return null
