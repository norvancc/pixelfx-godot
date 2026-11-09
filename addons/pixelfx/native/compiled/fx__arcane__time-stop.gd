@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/time-stop.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hand", _S.function_value(_e, "_f0"))
	_S.define(_e, "clockTime", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "CY", _S.unary("-", 42))
	_S.define(_e, "RC", 26)
	_S.define(_e, "OPEN", 0.3)
	_S.define(_e, "FREEZE", 1.75)
	_S.define(_e, "CRACK", 2.2)
	_S.define(_e, "SHATTER", 2.42)
	_S.define(_e, "TICKS", [0.36, 0.46, 0.57, 0.7, 0.85, 1.03, 1.24, 1.49])
	_S.define(_e, "meta", _S.merge([{"name": "Time stop"}, {"desc": "A clock face springs open, ticks slower and slower, freezes drained of colour, cracks, then shatters into falling shards."}, {"tags": ["arcane", "time", "clock", "freeze", "stop", "shatter", "magic", "one-shot"]}, {"size": [196, 136]}, {"origin": [98, 118]}, {"duration": 3.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 14}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "flow", _S.function_value(_e, "_f17"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "a", 0)
	for _v0 in _S.array(_S.read(_e, "TICKS")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "tk", _v0)
		if _S.truth(_S.binary(">", _S.read(_v1, "t"), _S.read(_v1, "tk"))):
			_S.write(_v1, "a", _S.invoke(_S.read(_v1, "ease"), "outBack", [_S.call_value(_S.read(_v1, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v1, "t"), _S.read(_v1, "tk")), 0.07)]), 3]), "+=", false)
	return _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.binary("*", _S.read(_e, "a"), _S.binary("/", _S.read(_e, "TAU"), 12)))

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "s", 0)
	var _v2 = _S.scope(_e)
	_S.define(_v2, "u", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "u"), _S.invoke(_S.read(_v2, "Math"), "min", [_S.read(_v2, "t"), _S.read(_v2, "FREEZE")]))):
		_S.write(_v2, "s", _S.binary("/", _S.call_value(_S.read(_v2, "flow"), [_S.read(_v2, "u")]), 120), "+=", false)
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "u", _S.binary("/", 1, 120), "+=", false)
	return _S.read(_e, "s")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "face", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawMote", _S.function_value(_e, "_f7"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "G", _S.invoke(_S.read(_e, "C"), "map", [_S.function_value(_e, "_f8")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f9")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.function_value(_e, "_f10")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "motes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 14}]), _S.function_value(_e, "_f11")]))
	_S.define(_e, "ix", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]))
	_S.define(_e, "iy", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]))
	_S.define(_e, "cracks", [])
	_S.define(_e, "walk", _S.function_value(_e, "_f12"))
	var _v15 = _S.scope(_e)
	_S.define(_v15, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v15, "i"), 7)):
		_S.call_value(_S.read(_v15, "walk"), [_S.read(_v15, "ix"), _S.read(_v15, "iy"), _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v15, "i"), 7), _S.read(_v15, "TAU")), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 0.3), 0.3])), 16, 0])
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "tc", 0)
	_S.define(_e, "ticked", 0)
	_S.define(_e, "shattered", false)
	_S.define(_e, "frozen", false)
	return _S.merge([{"update": _S.function_value(_e, "_f13")}, {"drawBack": _S.function_value(_e, "_f14")}, {"draw": _S.function_value(_e, "_f15")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "K", _S.arg(_args, 1))
	_S.define(_e, "s", _S.arg(_args, 2))
	_S.define(_e, "cracked", _S.arg(_args, 3))
	_S.define(_e, "cy", _S.read(_e, "CY"))
	_S.define(_e, "r", _S.binary("*", _S.read(_e, "RC"), _S.read(_e, "s")))
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 1)):
		return null
	_S.invoke(_S.read(_e, "p"), "disc", [0, _S.read(_e, "cy"), _S.read(_e, "r"), _S.prop(_S.read(_e, "K"), 1), _S.function_value(_e, "_f4")])
	_S.invoke(_S.read(_e, "p"), "ring", [0, _S.read(_e, "cy"), _S.binary("+", _S.read(_e, "r"), 0.5), 1, _S.prop(_S.read(_e, "K"), 6)])
	_S.invoke(_S.read(_e, "p"), "ring", [0, _S.read(_e, "cy"), _S.binary("-", _S.read(_e, "r"), 1.5), 1, _S.prop(_S.read(_e, "K"), 4)])
	_S.invoke(_S.read(_e, "p"), "ring", [0, _S.read(_e, "cy"), _S.binary("+", _S.read(_e, "r"), 2), 1, _S.prop(_S.read(_e, "K"), 3), 0.6])
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 60)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "a", _S.binary("*", _S.binary("/", _S.read(_v4, "i"), 60), _S.read(_v4, "TAU")))
		if _S.truth(_S.binary("%", _S.read(_v4, "i"), 5)):
			_S.invoke(_S.read(_v4, "p"), "dot", [_S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.binary("-", _S.read(_v4, "r"), 3.5)), _S.binary("+", _S.read(_v4, "cy"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.binary("-", _S.read(_v4, "r"), 3.5))), _S.prop(_S.read(_v4, "K"), 4), 0.8])
		else:
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "q", _S.binary("===", _S.binary("%", _S.read(_v5, "i"), 15), 0))
			_S.define(_v5, "r0", _S.binary("-", _S.read(_v5, "r"), (8 if _S.truth(_S.read(_v5, "q")) else 6.5)))
			_S.invoke(_S.read(_v5, "p"), "line", [_S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "r0")), _S.binary("+", _S.read(_v5, "cy"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "r0"))), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.binary("-", _S.read(_v5, "r"), 3)), _S.binary("+", _S.read(_v5, "cy"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.binary("-", _S.read(_v5, "r"), 3))), (_S.prop(_S.read(_v5, "K"), 7) if _S.truth(_S.read(_v5, "q")) else _S.prop(_S.read(_v5, "K"), 6))])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "ring", [0, _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "r"), 0.3), 1, _S.prop(_S.read(_e, "K"), 4), 0.8])
	_S.define(_e, "ha", _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.binary("/", _S.binary("+", _S.call_value(_S.read(_e, "hand"), [_S.read(_e, "t")]), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)), 12)), 0.9))
	_S.define(_e, "sa", _S.binary("+", _S.call_value(_S.read(_e, "hand"), [_S.read(_e, "t")]), (_S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 70)]), 0.012) if _S.truth(_S.read(_e, "frozen")) else 0)))
	_S.invoke(_S.read(_e, "p"), "beam", [0, _S.read(_e, "cy"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ha")]), _S.read(_e, "r")), 0.48), _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ha")]), _S.read(_e, "r")), 0.48)), 2.6, _S.function_value(_e, "_f5")])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("*", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "sa")])), 5), _S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "sa")]), 5)), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "sa")]), _S.binary("-", _S.read(_e, "r"), 4)), _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "sa")]), _S.binary("-", _S.read(_e, "r"), 4))), _S.function_value(_e, "_f6")])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("+", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "sa")])), 5), 0.5), _S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "sa")]), 5)), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "sa")])), 2), _S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "sa")]), 2)), _S.prop(_S.read(_e, "K"), 5)])
	_S.invoke(_S.read(_e, "p"), "circle", [0, _S.read(_e, "cy"), 2.2, _S.prop(_S.read(_e, "K"), 5)])
	_S.invoke(_S.read(_e, "p"), "circle", [0, _S.read(_e, "cy"), 1.2, _S.prop(_S.read(_e, "K"), 7)])
	if _S.truth(_S.binary(">", _S.read(_e, "cracked"), 0)):
		for _v6 in _S.array(_S.read(_e, "cracks")):
			var _v7 = _S.scope(_e)
			_S.define(_v7, "pts", _v6)
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "i", 0)
			_S.define(_v8, "n", _S.invoke(_S.read(_v8, "Math"), "floor", [_S.binary("*", _S.prop(_S.read(_v8, "pts"), "length"), _S.read(_v8, "cracked"))]))
			while _S.truth(_S.binary("<", _S.read(_v8, "i"), _S.read(_v8, "n"))):
				var _v9 = _S.scope(_v8)
				var _v10 = _S.prop(_S.read(_v9, "pts"), _S.read(_v9, "i"))
				_S.define(_v9, "x", _S.prop(_v10, 0))
				_S.define(_v9, "y", _S.prop(_v10, 1))
				_S.define(_v9, "fresh", _S.logical("&&", _S.binary(">", _S.read(_v9, "i"), _S.binary("-", _S.read(_v9, "n"), 3)), func(): return _S.binary("<", _S.read(_v9, "cracked"), 1)))
				_S.invoke(_S.read(_v9, "p"), "px", [_S.read(_v9, "x"), _S.binary("+", _S.read(_v9, "cy"), _S.read(_v9, "y")), (_S.read(_v9, "WHITE") if _S.truth(_S.read(_v9, "fresh")) else _S.prop(_S.read(_v9, "K"), 7))])
				if _S.truth(_S.unary("!", _S.read(_v9, "fresh"))):
					_S.invoke(_S.read(_v9, "p"), "px", [_S.read(_v9, "x"), _S.binary("-", _S.binary("+", _S.read(_v9, "cy"), _S.read(_v9, "y")), 1), _S.prop(_S.read(_v9, "K"), 2)])
				_v8 = _S.iteration(_v8)
				_S.write(_v8, "i", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("+", 0.3, _S.binary("*", _S.binary("*", 0.35, _S.read(_e, "d")), _S.read(_e, "d")))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "K"), 6) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.5)) else _S.prop(_S.read(_e, "K"), 4))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "K"), 7) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.75)) else _S.prop(_S.read(_e, "K"), 6))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "m", _S.arg(_args, 1))
	_S.define(_e, "back", _S.arg(_args, 2))
	_S.define(_e, "a", _S.binary("+", _S.prop(_S.read(_e, "m"), "a"), _S.binary("*", _S.prop(_S.read(_e, "m"), "w"), _S.read(_e, "tc"))))
	_S.define(_e, "z", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_e, "z"), 0), _S.read(_e, "back"))):
		return null
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.prop(_S.read(_e, "m"), "r")))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", _S.read(_e, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.prop(_S.read(_e, "m"), "r")), _S.prop(_S.read(_e, "m"), "tilt"))), _S.binary("*", _S.binary("*", _S.read(_e, "z"), _S.prop(_S.read(_e, "m"), "r")), 0.3)))
	_S.define(_e, "cold", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FREEZE")))
	_S.define(_e, "v", _S.binary("*", _S.call_value(_S.read(_e, "flow"), [_S.read(_e, "t")]), _S.prop(_S.read(_e, "m"), "w")))
	_S.define(_e, "c", (_S.prop(_S.read(_e, "G"), 6) if _S.truth(_S.read(_e, "cold")) else _S.prop(_S.read(_e, "m"), "c")))
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "c"), (0.6 if _S.truth(_S.read(_e, "back")) else 1)])
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), 0.2)):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "k", 1)
		while _S.truth(_S.binary("<=", _S.read(_v11, "k"), 3)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "b", _S.binary("-", _S.read(_v12, "a"), _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sign", [_S.prop(_S.read(_v12, "m"), "w")]), _S.read(_v12, "k")), 0.05), _S.invoke(_S.read(_v12, "Math"), "min", [1, _S.invoke(_S.read(_v12, "Math"), "abs", [_S.read(_v12, "v")])]))))
			_S.invoke(_S.read(_v12, "p"), "dot", [_S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "b")]), _S.prop(_S.read(_v12, "m"), "r")), _S.binary("+", _S.binary("+", _S.read(_v12, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "b")]), _S.prop(_S.read(_v12, "m"), "r")), _S.prop(_S.read(_v12, "m"), "tilt"))), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "b")]), _S.prop(_S.read(_v12, "m"), "r")), 0.3)), (_S.prop(_S.read(_v12, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v12, "k"), 2)) else _S.prop(_S.read(_v12, "C"), 4)), _S.binary("*", (0.5 if _S.truth(_S.read(_v12, "back")) else 0.9), _S.binary("-", 1, _S.binary("/", _S.read(_v12, "k"), 4)))])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "k", 1, "+=", true)
	if _S.truth(_S.unary("!", _S.read(_e, "back"))):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 5, (_S.prop(_S.read(_e, "G"), 6) if _S.truth(_S.read(_e, "cold")) else _S.prop(_S.read(_e, "C"), 6)), 0.3])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "l", _S.binary("*", _S.call_value(_S.read(_e, "luma"), [_S.read(_e, "c")]), 255))
	return _S.call_value(_S.read(_e, "rgb"), [_S.binary("*", _S.read(_e, "l"), 0.92), _S.binary("*", _S.read(_e, "l"), 0.96), _S.invoke(_S.read(_e, "Math"), "min", [255, _S.binary("*", _S.read(_e, "l"), 1.06)])])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"a": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}, {"r": _S.binary("+", _S.read(_e, "RC"), _S.invoke(_S.read(_e, "R"), "range", [5, 14]))}, {"w": _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [1.4, 2.6]), (1 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.unary("-", 1)))}, {"tilt": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.5), 0.5])}, {"c": _S.invoke(_S.read(_e, "R"), "pick", [[_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)]])}])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "a", _S.arg(_args, 2))
	_S.define(_e, "len", _S.arg(_args, 3))
	_S.define(_e, "depth", _S.arg(_args, 4))
	_S.define(_e, "pts", [[_S.read(_e, "x"), _S.read(_e, "y")]])
	var _v13 = _S.scope(_e)
	_S.define(_v13, "s", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "s"), _S.read(_v13, "len"))):
		var _v14 = _S.scope(_v13)
		_S.write(_v14, "a", _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 0.55), 0.55]), "+=", false)
		_S.write(_v14, "x", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.invoke(_S.read(_v14, "R"), "range", [1.6, 2.6])), "+=", false)
		_S.write(_v14, "y", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.invoke(_S.read(_v14, "R"), "range", [1.6, 2.6])), "+=", false)
		if _S.truth(_S.binary(">", _S.invoke(_S.read(_v14, "Math"), "hypot", [_S.read(_v14, "x"), _S.read(_v14, "y")]), _S.binary("-", _S.read(_v14, "RC"), 0.5))):
			break
		_S.invoke(_S.read(_v14, "pts"), "push", [[_S.read(_v14, "x"), _S.read(_v14, "y")]])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v14, "depth"), 1), func(): return _S.binary(">", _S.prop(_S.read(_v14, "pts"), "length"), 3)), func(): return _S.invoke(_S.read(_v14, "R"), "chance", [0.14]))):
			_S.call_value(_S.read(_v14, "walk"), [_S.read(_v14, "x"), _S.read(_v14, "y"), _S.binary("+", _S.read(_v14, "a"), _S.binary("*", _S.invoke(_S.read(_v14, "R"), "sign", []), _S.invoke(_S.read(_v14, "R"), "range", [0.6, 1.1]))), _S.binary("/", _S.read(_v14, "len"), 2), _S.binary("+", _S.read(_v14, "depth"), 1)])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "s", 1, "+=", true)
	_S.invoke(_S.read(_e, "cracks"), "push", [_S.read(_e, "pts")])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.write(_e, "tc", _S.call_value(_S.read(_e, "clockTime"), [_S.read(_e, "t")]), "=", false)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "ticked"), _S.prop(_S.read(_e, "TICKS"), "length")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.read(_e, "TICKS"), _S.read(_e, "ticked"))))):
		var _v16 = _S.scope(_e)
		_S.write(_v16, "ticked", 1, "+=", true)
		_S.define(_v16, "a", _S.call_value(_S.read(_v16, "hand"), [_S.binary("+", _S.read(_v16, "t"), 0.1)]))
		_S.invoke(_S.read(_v16, "lights"), "add", [_S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.binary("-", _S.read(_v16, "RC"), 4)), _S.binary("+", _S.read(_v16, "CY"), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.binary("-", _S.read(_v16, "RC"), 4))), 22, _S.prop(_S.read(_v16, "C"), 6), 0.6, 0.12])
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "i"), 3)):
			_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.binary("+", _S.read(_v17, "RC"), 1)), _S.binary("+", _S.read(_v17, "CY"), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.binary("+", _S.read(_v17, "RC"), 1))), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), 30), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 15), 15])), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), 30), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 15), 15])), _S.invoke(_S.read(_v17, "R"), "range", [0.2, 0.4]), _S.invoke(_S.read(_v17, "R"), "pick", [[_S.read(_v17, "WHITE"), _S.prop(_S.read(_v17, "C"), 6)]]), _S.invoke(_S.read(_v17, "R"), "range", [0.7, 1.3])])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "frozen")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FREEZE")))):
		var _v18 = _S.scope(_e)
		_S.write(_v18, "frozen", true, "=", false)
		_S.invoke(_S.read(_v18, "lights"), "add", [0, _S.read(_v18, "CY"), 70, _S.read(_v18, "WHITE"), 0.7, 0.2])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "shattered")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SHATTER")))):
		var _v19 = _S.scope(_e)
		_S.write(_v19, "shattered", true, "=", false)
		_S.invoke(_S.read(_v19, "lights"), "add", [0, _S.read(_v19, "CY"), 80, _S.read(_v19, "WHITE"), 0.8, 0.16])
		_S.invoke(_S.read(_v19, "lights"), "add", [0, _S.read(_v19, "CY"), 100, _S.prop(_S.read(_v19, "C"), 5), 0.6, 0.6])
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 64)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "a", _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "TAU")]))
			_S.define(_v21, "d", _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "RC")]))
			_S.define(_v21, "x", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), _S.read(_v21, "d")))
			_S.define(_v21, "y", _S.binary("+", _S.read(_v21, "CY"), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "a")]), _S.read(_v21, "d"))))
			_S.define(_v21, "sp", _S.invoke(_S.read(_v21, "R"), "range", [40, 140]))
			_S.define(_v21, "dx", _S.binary("-", _S.read(_v21, "x"), _S.read(_v21, "ix")))
			_S.define(_v21, "dy", _S.binary("-", _S.binary("-", _S.read(_v21, "y"), _S.read(_v21, "CY")), _S.read(_v21, "iy")))
			_S.define(_v21, "l", _S.logical("||", _S.invoke(_S.read(_v21, "Math"), "hypot", [_S.read(_v21, "dx"), _S.read(_v21, "dy")]), func(): return 1))
			_S.invoke(_S.read(_v21, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v21, "B"), "SHARD")}, {"x": _S.read(_v21, "x")}, {"y": _S.read(_v21, "y")}, {"vx": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v21, "dx"), _S.read(_v21, "l")), _S.read(_v21, "sp")), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 25), 25]))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v21, "dy"), _S.read(_v21, "l")), _S.read(_v21, "sp")), 0.7), _S.invoke(_S.read(_v21, "R"), "range", [40, 120]))}, {"g": 0.9}, {"drag": 0.5}, {"bounce": 0.25}, {"life": _S.invoke(_S.read(_v21, "R"), "range", [0.8, 1.15])}, {"a": _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "TAU")])}, {"va": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 22), 22])}, {"s": _S.invoke(_S.read(_v21, "R"), "range", [1.5, 3.6])}, {"c": _S.invoke(_S.read(_v21, "R"), "pick", [[_S.prop(_S.read(_v21, "G"), 7), _S.prop(_S.read(_v21, "G"), 6), _S.prop(_S.read(_v21, "G"), 6), _S.prop(_S.read(_v21, "G"), 5)]])}])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		var _v22 = _S.scope(_v19)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 10)):
			var _v23 = _S.scope(_v22)
			_S.define(_v23, "a", _S.invoke(_S.read(_v23, "R"), "range", [0, _S.read(_v23, "TAU")]))
			_S.define(_v23, "sp", _S.invoke(_S.read(_v23, "R"), "range", [40, 110]))
			_S.invoke(_S.read(_v23, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v23, "B"), "CHUNK")}, {"x": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "a")]), _S.read(_v23, "RC")), 0.6)}, {"y": _S.binary("+", _S.read(_v23, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "a")]), _S.read(_v23, "RC")), 0.6))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "a")]), _S.read(_v23, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "a")]), _S.read(_v23, "sp")), 0.6), _S.invoke(_S.read(_v23, "R"), "range", [60, 130]))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v23, "R"), "range", [0.9, 1.15])}, {"a": _S.invoke(_S.read(_v23, "R"), "range", [0, _S.read(_v23, "TAU")])}, {"va": _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.invoke(_S.read(_v23, "R"), "range", [1.6, 3])}, {"ramp": [_S.prop(_S.read(_v23, "G"), 1), _S.prop(_S.read(_v23, "G"), 3), _S.prop(_S.read(_v23, "G"), 4), _S.prop(_S.read(_v23, "G"), 6), _S.prop(_S.read(_v23, "G"), 7)]}])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
		var _v24 = _S.scope(_v19)
		_S.define(_v24, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v24, "i"), 26)):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "a", _S.invoke(_S.read(_v25, "R"), "range", [0, _S.read(_v25, "TAU")]))
			_S.define(_v25, "sp", _S.invoke(_S.read(_v25, "R"), "range", [30, 110]))
			_S.invoke(_S.read(_v25, "ps"), "spawn", [(_S.prop(_S.read(_v25, "P"), "STAR") if _S.truth(_S.binary("%", _S.read(_v25, "i"), 2)) else _S.prop(_S.read(_v25, "P"), "MOTE")), 0, _S.read(_v25, "CY"), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.read(_v25, "a")]), _S.read(_v25, "sp")), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.read(_v25, "a")]), _S.read(_v25, "sp")), _S.invoke(_S.read(_v25, "R"), "range", [0.4, 0.8]), _S.invoke(_S.read(_v25, "R"), "pick", [[_S.read(_v25, "WHITE"), _S.prop(_S.read(_v25, "C"), 6), _S.prop(_S.read(_v25, "C"), 5)]]), _S.invoke(_S.read(_v25, "R"), "range", [0.8, 1.8])])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "i", 1, "+=", true)
		var _v26 = _S.scope(_v19)
		_S.define(_v26, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), 18)):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "a", _S.invoke(_S.read(_v27, "R"), "range", [0, _S.read(_v27, "TAU")]))
			_S.define(_v27, "sp", _S.invoke(_S.read(_v27, "R"), "range", [90, 200]))
			_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "SPARK"), 0, _S.read(_v27, "CY"), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.read(_v27, "sp")), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.read(_v27, "sp")), _S.invoke(_S.read(_v27, "R"), "range", [0.2, 0.45])])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
		var _v28 = _S.scope(_v19)
		_S.define(_v28, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v28, "i"), 12)):
			var _v29 = _S.scope(_v28)
			_S.define(_v29, "a", _S.invoke(_S.read(_v29, "R"), "range", [0, _S.read(_v29, "TAU")]))
			_S.define(_v29, "d", _S.invoke(_S.read(_v29, "R"), "range", [0, _S.binary("*", _S.read(_v29, "RC"), 0.8)]))
			_S.invoke(_S.read(_v29, "ps"), "spawn", [_S.prop(_S.read(_v29, "P"), "VAPOUR"), _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "cos", [_S.read(_v29, "a")]), _S.read(_v29, "d")), _S.binary("+", _S.read(_v29, "CY"), _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "sin", [_S.read(_v29, "a")]), _S.read(_v29, "d"))), _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "cos", [_S.read(_v29, "a")]), _S.invoke(_S.read(_v29, "R"), "range", [10, 40])), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "sin", [_S.read(_v29, "a")]), _S.invoke(_S.read(_v29, "R"), "range", [10, 30])), _S.invoke(_S.read(_v29, "R"), "range", [5, 20])), _S.invoke(_S.read(_v29, "R"), "range", [0.6, 1]), (_S.prop(_S.read(_v29, "G"), 5) if _S.truth(_S.invoke(_S.read(_v29, "R"), "chance", [0.5])) else _S.prop(_S.read(_v29, "C"), 4)), _S.invoke(_S.read(_v29, "R"), "range", [3, 6])])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, _S.read(_e, "OPEN"), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "SHATTER"), _S.binary("+", _S.read(_e, "SHATTER"), 0.5), _S.read(_e, "t")]))))
	_S.define(_e, "cold", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FREEZE")))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 1), 40, (_S.prop(_S.read(_e, "G"), 5) if _S.truth(_S.read(_e, "cold")) else _S.prop(_S.read(_e, "C"), 4)), _S.binary("*", 0.25, _S.read(_e, "k"))])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SHATTER"))):
		for _v30 in _S.array(_S.read(_e, "motes")):
			var _v31 = _S.scope(_e)
			_S.define(_v31, "m", _v30)
			_S.call_value(_S.read(_v31, "drawMote"), [_S.read(_v31, "p"), _S.read(_v31, "m"), true])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "cold", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FREEZE")))
	_S.define(_e, "s", (_S.invoke(_S.read(_e, "ease"), "outBack", [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "OPEN")), 2.6]) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "OPEN"))) else 1))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SHATTER"))):
		var _v32 = _S.scope(_e)
		_S.define(_v32, "white", _S.logical("||", _S.logical("&&", _S.binary(">=", _S.read(_v32, "t"), _S.read(_v32, "FREEZE")), func(): return _S.binary("<", _S.read(_v32, "t"), _S.binary("+", _S.read(_v32, "FREEZE"), 0.06))), func(): return _S.binary(">=", _S.read(_v32, "t"), _S.binary("-", _S.read(_v32, "SHATTER"), 0.05))))
		_S.call_value(_S.read(_v32, "face"), [_S.read(_v32, "p"), (_S.invoke(_S.read(_v32, "G"), "map", [_S.function_value(_v32, "_f16")]) if _S.truth(_S.read(_v32, "white")) else (_S.read(_v32, "G") if _S.truth(_S.read(_v32, "cold")) else _S.read(_v32, "C"))), _S.read(_v32, "s"), _S.call_value(_S.read(_v32, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v32, "t"), _S.read(_v32, "CRACK")), 0.18)])])
		_S.invoke(_S.read(_v32, "p"), "glow", [0, _S.read(_v32, "CY"), _S.binary("*", _S.read(_v32, "RC"), 1.9), (_S.prop(_S.read(_v32, "G"), 5) if _S.truth(_S.read(_v32, "cold")) else _S.prop(_S.read(_v32, "C"), 4)), _S.binary("*", 0.32, _S.read(_v32, "s"))])
		_S.invoke(_S.read(_v32, "p"), "glowRing", [0, _S.read(_v32, "CY"), _S.read(_v32, "RC"), 7, (_S.prop(_S.read(_v32, "G"), 6) if _S.truth(_S.read(_v32, "cold")) else _S.prop(_S.read(_v32, "C"), 5)), _S.binary("*", 0.28, _S.read(_v32, "s"))])
		for _v33 in _S.array(_S.read(_v32, "motes")):
			var _v34 = _S.scope(_v32)
			_S.define(_v34, "m", _v33)
			_S.call_value(_S.read(_v34, "drawMote"), [_S.read(_v34, "p"), _S.read(_v34, "m"), false])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.35)):
		var _v35 = _S.scope(_e)
		_S.define(_v35, "q", _S.binary("/", _S.read(_v35, "t"), 0.35))
		_S.invoke(_S.read(_v35, "p"), "ring", [0, _S.read(_v35, "CY"), _S.binary("*", _S.read(_v35, "RC"), _S.binary("+", 0.4, _S.binary("*", 1.2, _S.invoke(_S.read(_v35, "ease"), "outCubic", [_S.read(_v35, "q")])))), _S.invoke(_S.read(_v35, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_v35, "q")))]), (_S.read(_v35, "WHITE") if _S.truth(_S.binary("<", _S.read(_v35, "q"), 0.3)) else _S.prop(_S.read(_v35, "C"), 6)), _S.binary("-", 1.2, _S.read(_v35, "q"))])
		if _S.truth(_S.binary("<", _S.read(_v35, "q"), 0.5)):
			_S.call_value(_S.read(_v35, "flare"), [_S.read(_v35, "p"), 0, _S.read(_v35, "CY"), _S.binary("+", _S.binary("*", 26, _S.binary("-", 1, _S.binary("*", _S.read(_v35, "q"), 2))), 2), _S.binary("-", 1, _S.binary("*", _S.read(_v35, "q"), 2)), _S.read(_v35, "C")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SHATTER"))):
		for _v36 in _S.array(_S.read(_e, "TICKS")):
			var _v37 = _S.scope(_e)
			_S.define(_v37, "tk", _v36)
			var _v38 = _S.scope(_v37)
			if _S.truth(_S.binary("<", _S.read(_v38, "t"), _S.read(_v38, "tk"))):
				continue
			_S.define(_v38, "q", _S.binary("/", _S.binary("-", _S.read(_v38, "tc"), _S.call_value(_S.read(_v38, "clockTime"), [_S.read(_v38, "tk")])), 0.32))
			if _S.truth(_S.binary(">=", _S.read(_v38, "q"), 1)):
				continue
			_S.invoke(_S.read(_v38, "p"), "ring", [0, _S.read(_v38, "CY"), _S.binary("+", _S.binary("+", _S.read(_v38, "RC"), 3), _S.binary("*", 24, _S.invoke(_S.read(_v38, "ease"), "outCubic", [_S.read(_v38, "q")]))), 1, (_S.prop(_S.read(_v38, "G"), 5) if _S.truth(_S.read(_v38, "cold")) else _S.prop(_S.read(_v38, "C"), 5)), _S.binary("*", (0.6 if _S.truth(_S.read(_v38, "cold")) else 0.8), _S.invoke(_S.read(_v38, "Math"), "pow", [_S.binary("-", 1, _S.read(_v38, "q")), 1.6]))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SHATTER")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SHATTER"), 0.2)))):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "q", _S.binary("/", _S.binary("-", _S.read(_v39, "t"), _S.read(_v39, "SHATTER")), 0.2))
		_S.call_value(_S.read(_v39, "flare"), [_S.read(_v39, "p"), 0, _S.read(_v39, "CY"), _S.binary("+", _S.binary("*", 34, _S.binary("-", 1, _S.read(_v39, "q"))), 2), _S.binary("-", 1, _S.read(_v39, "q")), _S.read(_v39, "C")])
		_S.invoke(_S.read(_v39, "p"), "ring", [0, _S.read(_v39, "CY"), _S.binary("+", _S.read(_v39, "RC"), _S.binary("*", 30, _S.invoke(_S.read(_v39, "ease"), "outCubic", [_S.read(_v39, "q")]))), _S.invoke(_S.read(_v39, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_v39, "q")))]), _S.read(_v39, "WHITE"), _S.binary("-", 1.2, _S.read(_v39, "q"))])
	_S.invoke(_S.read(_e, "bits"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.read(_e, "WHITE")

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "OPEN"))) else _S.binary("**", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "OPEN")), _S.binary("-", _S.read(_e, "FREEZE"), _S.read(_e, "OPEN"))))]), 1.6))
