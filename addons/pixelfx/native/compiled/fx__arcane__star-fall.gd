@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/star-fall.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "N", 11)
	_S.define(_e, "SPREAD", 46)
	_S.define(_e, "H", 124)
	_S.define(_e, "SLANT", 0.38)
	_S.define(_e, "TRAIL", 0.17)
	_S.define(_e, "meta", _S.merge([{"name": "Star fall"}, {"desc": "Stars streak down on long trails across an area, each landing with a white flash, a ring across the floor and a kick of sparks."}, {"tags": ["arcane", "star", "meteor", "rain", "aoe", "magic", "ground", "one-shot"]}, {"size": [232, 172]}, {"origin": [124, 150]}, {"duration": 2.5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 13}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "star", _S.function_value(_e, "_f1"))
	_S.define(_e, "hit", _S.function_value(_e, "_f2"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f4")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "xs", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "N")}]), _S.function_value(_e, "_f5")]))
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", _S.binary("-", _S.read(_v5, "N"), 1))
	while _S.truth(_S.binary(">", _S.read(_v5, "i"), 0)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "j", _S.invoke(_S.read(_v6, "R"), "int", [0, _S.read(_v6, "i")]))
		_S.destructure(_v6, [null,null], [_S.prop(_S.read(_v6, "xs"), _S.read(_v6, "j")), _S.prop(_S.read(_v6, "xs"), _S.read(_v6, "i"))])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "-=", true)
	_S.define(_e, "stars", _S.invoke(_S.read(_e, "xs"), "map", [_S.function_value(_e, "_f6")]))
	_S.define(_e, "hits", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "at", _S.function_value(_e, "_f7"))
	return _S.merge([{"update": _S.function_value(_e, "_f8")}, {"drawBack": _S.function_value(_e, "_f9")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	var _v0 = _S.call_value(_S.read(_e, "at"), [_S.read(_e, "s"), _S.read(_e, "t")])
	_S.define(_e, "x", _S.prop(_v0, 0))
	_S.define(_e, "y", _S.prop(_v0, 1))
	_S.define(_e, "q", _S.prop(_v0, 2))
	_S.define(_e, "n", 20)
	var _v1 = _S.scope(_e)
	_S.define(_v1, "k", _S.read(_v1, "n"))
	while _S.truth(_S.binary(">=", _S.read(_v1, "k"), 1)):
		var _v2 = _S.scope(_v1)
		var _v3 = _S.call_value(_S.read(_v2, "at"), [_S.read(_v2, "s"), _S.binary("-", _S.read(_v2, "t"), _S.binary("/", _S.binary("*", _S.read(_v2, "k"), _S.read(_v2, "TRAIL")), _S.read(_v2, "n")))])
		_S.define(_v2, "ax", _S.prop(_v3, 0))
		_S.define(_v2, "ay", _S.prop(_v3, 1))
		var _v4 = _S.call_value(_S.read(_v2, "at"), [_S.read(_v2, "s"), _S.binary("-", _S.read(_v2, "t"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v2, "k"), 1), _S.read(_v2, "TRAIL")), _S.read(_v2, "n")))])
		_S.define(_v2, "bx", _S.prop(_v4, 0))
		_S.define(_v2, "by", _S.prop(_v4, 1))
		_S.define(_v2, "u", _S.binary("/", _S.read(_v2, "k"), _S.read(_v2, "n")))
		if _S.truth(_S.binary("<", _S.binary("-", _S.read(_v2, "t"), _S.binary("/", _S.binary("*", _S.read(_v2, "k"), _S.read(_v2, "TRAIL")), _S.read(_v2, "n"))), _S.prop(_S.read(_v2, "s"), "t0"))):
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "k", 1, "-=", true)
			continue
		_S.define(_v2, "c", (_S.read(_v2, "WHITE") if _S.truth(_S.binary("<", _S.read(_v2, "u"), 0.15)) else (_S.prop(_S.read(_v2, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v2, "u"), 0.4)) else (_S.prop(_S.read(_v2, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v2, "u"), 0.7)) else _S.prop(_S.read(_v2, "C"), 4)))))
		if _S.truth(_S.binary("<", _S.read(_v2, "u"), (0.55 if _S.truth(_S.prop(_S.read(_v2, "s"), "big")) else 0.35))):
			_S.invoke(_S.read(_v2, "p"), "line", [_S.binary("+", _S.read(_v2, "ax"), 1), _S.read(_v2, "ay"), _S.binary("+", _S.read(_v2, "bx"), 1), _S.read(_v2, "by"), (_S.prop(_S.read(_v2, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v2, "u"), 0.2)) else _S.prop(_S.read(_v2, "C"), 5)), _S.binary("-", 1.1, _S.binary("*", _S.read(_v2, "u"), 1.4))])
		_S.invoke(_S.read(_v2, "p"), "line", [_S.read(_v2, "ax"), _S.read(_v2, "ay"), _S.read(_v2, "bx"), _S.read(_v2, "by"), _S.read(_v2, "c"), _S.binary("-", 1.3, _S.read(_v2, "u"))])
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v2, "k"), 3), 0)):
			_S.invoke(_S.read(_v2, "p"), "glow", [_S.read(_v2, "ax"), _S.read(_v2, "ay"), _S.binary("+", _S.binary("*", 7, _S.binary("-", 1, _S.read(_v2, "u"))), 2), _S.prop(_S.read(_v2, "C"), 5), _S.binary("*", 0.3, _S.binary("-", 1, _S.read(_v2, "u")))])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "k", 1, "-=", true)
	if _S.truth(_S.prop(_S.read(_e, "s"), "big")):
		_S.call_value(_S.read(_e, "flare"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 7, _S.binary("*", 1.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 40), _S.prop(_S.read(_e, "s"), "ph"))]))), 0.8, _S.read(_e, "C")])
	else:
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 3.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 40), _S.prop(_S.read(_e, "s"), "ph"))])), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), 0.6])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), (1.6 if _S.truth(_S.prop(_S.read(_e, "s"), "big")) else 1.1), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), (18 if _S.truth(_S.prop(_S.read(_e, "s"), "big")) else 13), _S.prop(_S.read(_e, "C"), 5), 0.6])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 5, _S.read(_e, "WHITE"), 0.35])
	return _S.read(_e, "q")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "h", _S.arg(_args, 1))
	_S.define(_e, "far", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "h"), "t")), 0.45))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "k"), 0), func(): return _S.binary(">=", _S.read(_e, "k"), 1))):
		return null
	_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "h"), "x"), _S.prop(_S.read(_e, "h"), "y"), _S.binary("+", 3, _S.binary("*", (22 if _S.truth(_S.prop(_S.read(_e, "h"), "big")) else 16), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))), 0.26, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 2.5, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE")], _S.function_value(_e, "_f3"), _S.binary("<", _S.read(_e, "k"), 0.2)])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("===", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "far"))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.binary("+", _S.unary("-", _S.read(_e, "SPREAD")), _S.binary("/", _S.binary("*", _S.binary("*", _S.binary("+", _S.read(_e, "i"), _S.invoke(_S.read(_e, "R"), "range", [0.2, 0.8])), 2), _S.read(_e, "SPREAD")), _S.read(_e, "N")))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "y", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 3), 2]))
	_S.define(_e, "h", _S.binary("*", _S.read(_e, "H"), _S.invoke(_S.read(_e, "R"), "range", [0.85, 1])))
	return _S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"sx": _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "h"), _S.read(_e, "SLANT")))}, {"sy": _S.binary("-", _S.read(_e, "y"), _S.read(_e, "h"))}, {"t0": _S.binary("+", _S.binary("+", 0.04, _S.binary("*", _S.read(_e, "i"), 0.105)), _S.invoke(_S.read(_e, "R"), "range", [0, 0.05]))}, {"T": _S.invoke(_S.read(_e, "R"), "range", [0.3, 0.4])}, {"landed": false}, {"big": _S.invoke(_S.read(_e, "R"), "chance", [0.35])}, {"ph": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	_S.define(_e, "q", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "tt"), _S.prop(_S.read(_e, "s"), "t0")), _S.prop(_S.read(_e, "s"), "T"))]))
	_S.define(_e, "e", _S.binary("*", _S.read(_e, "q"), _S.binary("+", 0.35, _S.binary("*", 0.65, _S.read(_e, "q")))))
	return [_S.binary("+", _S.prop(_S.read(_e, "s"), "sx"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_e, "s"), "x"), _S.prop(_S.read(_e, "s"), "sx")), _S.read(_e, "e"))), _S.binary("+", _S.prop(_S.read(_e, "s"), "sy"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_e, "s"), "y"), _S.prop(_S.read(_e, "s"), "sy")), _S.read(_e, "e"))), _S.read(_e, "q")]

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v7 in _S.array(_S.read(_e, "stars")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "s", _v7)
		var _v9 = _S.scope(_v8)
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v9, "t"), _S.prop(_S.read(_v9, "s"), "t0")), func(): return _S.prop(_S.read(_v9, "s"), "landed"))):
			continue
		var _v10 = _S.call_value(_S.read(_v9, "at"), [_S.read(_v9, "s"), _S.read(_v9, "t")])
		_S.define(_v9, "x", _S.prop(_v10, 0))
		_S.define(_v9, "y", _S.prop(_v10, 1))
		_S.define(_v9, "q", _S.prop(_v10, 2))
		if _S.truth(_S.invoke(_S.read(_v9, "R"), "chance", [0.55])):
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "STAR"), _S.binary("+", _S.read(_v9, "x"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.binary("+", _S.read(_v9, "y"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 12), 12]), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 8), 4]), _S.invoke(_S.read(_v9, "R"), "range", [0.35, 0.7]), _S.invoke(_S.read(_v9, "R"), "pick", [[_S.read(_v9, "WHITE"), _S.prop(_S.read(_v9, "C"), 6), _S.prop(_S.read(_v9, "C"), 5)]]), (_S.invoke(_S.read(_v9, "R"), "range", [0.4, 0.9]) if _S.truth(_S.invoke(_S.read(_v9, "R"), "chance", [0.7])) else _S.invoke(_S.read(_v9, "R"), "range", [1.2, 1.8]))])
		if _S.truth(_S.binary(">=", _S.read(_v9, "q"), 1)):
			var _v11 = _S.scope(_v9)
			_S.set_prop(_S.read(_v11, "s"), "landed", true, "=", false)
			_S.invoke(_S.read(_v11, "hits"), "push", [_S.merge([{"x": _S.prop(_S.read(_v11, "s"), "x")}, {"y": _S.prop(_S.read(_v11, "s"), "y")}, {"t": _S.read(_v11, "t")}, {"big": _S.prop(_S.read(_v11, "s"), "big")}])])
			_S.invoke(_S.read(_v11, "lights"), "add", [_S.prop(_S.read(_v11, "s"), "x"), _S.binary("-", _S.prop(_S.read(_v11, "s"), "y"), 12), (46 if _S.truth(_S.prop(_S.read(_v11, "s"), "big")) else 38), _S.prop(_S.read(_v11, "C"), 5), 0.9, 0.32])
			_S.invoke(_S.read(_v11, "lights"), "add", [_S.prop(_S.read(_v11, "s"), "x"), _S.binary("-", _S.prop(_S.read(_v11, "s"), "y"), 3), 16, _S.read(_v11, "WHITE"), 0.8, 0.08])
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v12, "i"), (14 if _S.truth(_S.prop(_S.read(_v12, "s"), "big")) else 9))):
				var _v13 = _S.scope(_v12)
				_S.define(_v13, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v13, "Math"), "PI")), 2), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 1.35), 1.35])))
				_S.define(_v13, "sp", _S.invoke(_S.read(_v13, "R"), "range", [50, 150]))
				_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "SPARK"), _S.prop(_S.read(_v13, "s"), "x"), _S.invoke(_S.read(_v13, "Math"), "min", [_S.unary("-", 1), _S.binary("-", _S.prop(_S.read(_v13, "s"), "y"), 1)]), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.invoke(_S.read(_v13, "R"), "range", [0.2, 0.5])])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "i", 1, "+=", true)
			var _v14 = _S.scope(_v11)
			_S.define(_v14, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v14, "i"), 4)):
				_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v14, "s"), "x"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 4), 4])), _S.binary("-", _S.prop(_S.read(_v14, "s"), "y"), _S.invoke(_S.read(_v14, "R"), "range", [2, 8])), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [10, 35])), _S.invoke(_S.read(_v14, "R"), "range", [0.4, 0.8]), _S.invoke(_S.read(_v14, "R"), "pick", [[_S.read(_v14, "WHITE"), _S.prop(_S.read(_v14, "C"), 6)]]), _S.invoke(_S.read(_v14, "R"), "range", [0.8, 2])])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("*", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), 0.3)]), _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), 1.7), 0.7)]))))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		for _v15 in _S.array([_S.unary("-", 36), 0, 36]):
			var _v16 = _S.scope(_e)
			_S.define(_v16, "x", _v15)
			_S.invoke(_S.read(_v16, "p"), "glow", [_S.read(_v16, "x"), _S.unary("-", 1), 40, _S.prop(_S.read(_v16, "C"), 4), _S.binary("*", 0.14, _S.read(_v16, "k"))])
	for _v17 in _S.array(_S.read(_e, "hits")):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "h", _v17)
		_S.call_value(_S.read(_v18, "hit"), [_S.read(_v18, "p"), _S.read(_v18, "h"), true])
	for _v19 in _S.array(_S.read(_e, "hits")):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "h", _v19)
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "k2", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v21, "t"), _S.prop(_S.read(_v21, "h"), "t")), 0.7)))
		if _S.truth(_S.binary("<=", _S.read(_v21, "k2"), 0)):
			continue
		_S.invoke(_S.read(_v21, "p"), "dot", [_S.prop(_S.read(_v21, "h"), "x"), _S.prop(_S.read(_v21, "h"), "y"), (_S.read(_v21, "WHITE") if _S.truth(_S.binary(">", _S.read(_v21, "k2"), 0.6)) else _S.prop(_S.read(_v21, "C"), 6)), _S.binary("*", _S.read(_v21, "k2"), 1.5)])
		for _v22 in _S.array([_S.unary("-", 1), 1]):
			var _v23 = _S.scope(_v21)
			_S.define(_v23, "dx", _v22)
			_S.invoke(_S.read(_v23, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v23, "h"), "x"), _S.read(_v23, "dx")), _S.prop(_S.read(_v23, "h"), "y"), _S.prop(_S.read(_v23, "C"), 5), _S.binary("*", _S.read(_v23, "k2"), 1.2)])
		_S.invoke(_S.read(_v21, "p"), "glow", [_S.prop(_S.read(_v21, "h"), "x"), _S.binary("-", _S.prop(_S.read(_v21, "h"), "y"), 1), 10, _S.prop(_S.read(_v21, "C"), 5), _S.binary("*", 0.35, _S.read(_v21, "k2"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v24 in _S.array(_S.read(_e, "stars")):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "s", _v24)
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v25, "t"), _S.prop(_S.read(_v25, "s"), "t0")), func(): return _S.unary("!", _S.prop(_S.read(_v25, "s"), "landed")))):
			_S.call_value(_S.read(_v25, "star"), [_S.read(_v25, "p"), _S.read(_v25, "s")])
	for _v26 in _S.array(_S.read(_e, "hits")):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "h", _v26)
		var _v28 = _S.scope(_v27)
		_S.call_value(_S.read(_v28, "hit"), [_S.read(_v28, "p"), _S.read(_v28, "h"), false])
		_S.define(_v28, "k", _S.binary("/", _S.binary("-", _S.read(_v28, "t"), _S.prop(_S.read(_v28, "h"), "t")), 0.22))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v28, "k"), 0), func(): return _S.binary(">=", _S.read(_v28, "k"), 1))):
			continue
		if _S.truth(_S.binary("<", _S.read(_v28, "k"), 0.35)):
			_S.invoke(_S.read(_v28, "p"), "circle", [_S.prop(_S.read(_v28, "h"), "x"), _S.binary("-", _S.prop(_S.read(_v28, "h"), "y"), 2), _S.binary("+", _S.binary("*", 5, _S.binary("-", 1, _S.binary("/", _S.read(_v28, "k"), 0.35))), 1), _S.read(_v28, "WHITE")])
		_S.call_value(_S.read(_v28, "flare"), [_S.read(_v28, "p"), _S.prop(_S.read(_v28, "h"), "x"), _S.binary("-", _S.prop(_S.read(_v28, "h"), "y"), 2), _S.binary("+", _S.binary("*", (16 if _S.truth(_S.prop(_S.read(_v28, "h"), "big")) else 12), _S.invoke(_S.read(_v28, "Math"), "pow", [_S.binary("-", 1, _S.read(_v28, "k")), 1.5])), 2), _S.binary("-", 1, _S.read(_v28, "k")), _S.read(_v28, "C")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
