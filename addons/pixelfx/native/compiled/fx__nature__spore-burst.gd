@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/spore-burst.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Gas", _S.import_value("fx/nature/_lib.js", "Gas"))
	_S.define(_e, "toadstool", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Spore burst"}, {"desc": "A toadstool pushes up, swells and trembles as its gills glow, then squashes and puffs a lumpy cloud of glowing spores that billows up and drifts down twinkling."}, {"tags": ["nature", "mushroom", "spores", "poison", "cloud", "ground", "one-shot"]}, {"size": [212, 132]}, {"origin": [106, 118]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#06141c", "#0c2a34", "#11484e", "#17706a", "#22a08a", "#4cd0a8", "#a8f4d0", "#f0fff6"]}, {"cap": ["#1a0c1e", "#3a1438", "#62204e", "#8e3462", "#bc5276", "#e88a96"]}, {"stem": ["#2a2230", "#5a4e5e", "#9a8e98", "#d8ccd0", "#f6eeee"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "GROW", 0.32)
	_S.define(_e, "PUFF", 0.8)
	_S.define(_e, "SINK", 2.15)
	_S.define(_e, "SPOTS", [[_S.unary("-", 0.45), 0.45, 1.4], [0.1, 0.72, 1.8], [0.55, 0.38, 1.2], [_S.unary("-", 0.12), 0.25, 1], [0.3, 0.12, 0.9], [_S.unary("-", 0.7), 0.16, 0.8]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "K", _S.arg(_args, 1))
	_S.define(_e, "Sm", _S.arg(_args, 2))
	_S.define(_e, "Cs", _S.arg(_args, 3))
	_S.define(_e, "g", _S.arg(_args, 4))
	_S.define(_e, "sx", _S.arg(_args, 5))
	_S.define(_e, "sy", _S.arg(_args, 6))
	_S.define(_e, "glow", _S.arg(_args, 7))
	_S.define(_e, "sink", _S.arg(_args, 8))
	_S.define(_e, "H", _S.binary("*", 17, _S.read(_e, "g")))
	_S.define(_e, "cw", _S.binary("*", _S.binary("*", 17, _S.read(_e, "sx")), _S.read(_e, "g")))
	_S.define(_e, "ch", _S.binary("*", _S.binary("*", 13, _S.read(_e, "sy")), _S.read(_e, "g")))
	_S.define(_e, "base", _S.read(_e, "sink"))
	_S.define(_e, "top", _S.binary("-", _S.read(_e, "base"), _S.read(_e, "H")))
	if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.05)):
		return null
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", _S.invoke(_S.read(_v0, "Math"), "floor", [_S.read(_v0, "top")]))
	while _S.truth(_S.binary("<=", _S.read(_v0, "y"), _S.invoke(_S.read(_v0, "Math"), "min", [0, _S.read(_v0, "base")]))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", _S.unary("-", 4))
		while _S.truth(_S.binary("<=", _S.read(_v1, "x"), 4)):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "w", _S.binary("+", 3, _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v2, "y"), _S.read(_v2, "top")), _S.read(_v2, "H")), 1)))
			if _S.truth(_S.binary(">", _S.invoke(_S.read(_v2, "Math"), "abs", [_S.binary("+", _S.read(_v2, "x"), 0.5)]), _S.read(_v2, "w"))):
				_v1 = _S.iteration(_v1)
				_S.write(_v1, "x", 1, "+=", true)
				continue
			_S.define(_v2, "q", _S.binary("/", _S.binary("+", _S.binary("+", _S.read(_v2, "x"), 0.5), _S.read(_v2, "w")), _S.binary("*", 2, _S.read(_v2, "w"))))
			_S.invoke(_S.read(_v2, "p"), "px", [_S.read(_v2, "x"), _S.read(_v2, "y"), (_S.prop(_S.read(_v2, "Sm"), 1) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v2, "Math"), "abs", [_S.binary("+", _S.read(_v2, "x"), 0.5)]), _S.binary("-", _S.read(_v2, "w"), 0.8))) else (_S.prop(_S.read(_v2, "Sm"), 4) if _S.truth(_S.binary("<", _S.read(_v2, "q"), 0.4)) else (_S.prop(_S.read(_v2, "Sm"), 3) if _S.truth(_S.binary("<", _S.read(_v2, "q"), 0.7)) else _S.prop(_S.read(_v2, "Sm"), 2))))])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "x", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	_S.define(_e, "ring", _S.binary("+", _S.read(_e, "top"), _S.binary("*", _S.read(_e, "H"), 0.3)))
	if _S.truth(_S.binary("<=", _S.read(_e, "ring"), 0)):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "x", _S.unary("-", 5))
		while _S.truth(_S.binary("<=", _S.read(_v3, "x"), 5)):
			_S.invoke(_S.read(_v3, "p"), "px", [_S.read(_v3, "x"), _S.binary("+", _S.read(_v3, "ring"), (1 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.read(_v3, "x")]), 3)) else 0)), (_S.prop(_S.read(_v3, "Sm"), 1) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.read(_v3, "x")]), 4)) else _S.prop(_S.read(_v3, "Sm"), 3))])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "x", 1, "+=", true)
	_S.define(_e, "gy", _S.binary("+", _S.read(_e, "top"), 1))
	if _S.truth(_S.binary("<=", _S.read(_e, "gy"), 0)):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "x", _S.invoke(_S.read(_v4, "Math"), "floor", [_S.unary("-", _S.read(_v4, "cw"))]))
		while _S.truth(_S.binary("<=", _S.read(_v4, "x"), _S.invoke(_S.read(_v4, "Math"), "ceil", [_S.read(_v4, "cw")]))):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "d", _S.binary("/", _S.invoke(_S.read(_v5, "Math"), "abs", [_S.binary("+", _S.read(_v5, "x"), 0.5)]), _S.read(_v5, "cw")))
			if _S.truth(_S.binary(">", _S.read(_v5, "d"), 0.95)):
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "x", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v5, "p"), "px", [_S.read(_v5, "x"), _S.read(_v5, "gy"), (_S.prop(_S.read(_v5, "Cs"), 0) if _S.truth(_S.binary("<", _S.read(_v5, "d"), 0.3)) else (_S.prop(_S.read(_v5, "Sm"), 2) if _S.truth(_S.binary("&", _S.read(_v5, "x"), 1)) else _S.prop(_S.read(_v5, "Sm"), 3)))])
			if _S.truth(_S.binary(">", _S.read(_v5, "glow"), 0.05)):
				_S.invoke(_S.read(_v5, "p"), "px", [_S.read(_v5, "x"), _S.read(_v5, "gy"), (_S.prop(_S.read(_v5, "K"), 7) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v5, "glow"), 0.6), func(): return _S.binary("&", _S.read(_v5, "x"), 1))) else _S.prop(_S.read(_v5, "K"), 5))])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "x", 1, "+=", true)
	if _S.truth(_S.binary(">", _S.read(_e, "glow"), 0.05)):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.read(_e, "gy"), 2), _S.binary("+", _S.binary("*", _S.read(_e, "cw"), 1.5), 6), _S.prop(_S.read(_e, "K"), 5), _S.binary("*", 0.5, _S.read(_e, "glow"))])
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "cw")), 1), _S.binary("-", _S.binary("-", _S.read(_e, "top"), _S.read(_e, "ch")), 1), _S.binary("+", _S.read(_e, "cw"), 1), _S.binary("+", _S.read(_e, "top"), 1), _S.function_value(_e, "_f1")])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("*", _S.unary("-", _S.read(_e, "cw")), 0.45), _S.binary("-", _S.read(_e, "top"), _S.binary("*", _S.read(_e, "ch"), 0.8)), _S.prop(_S.read(_e, "Cs"), 5)])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "cw")))
	_S.define(_e, "dy", _S.binary("/", _S.binary("-", _S.read(_e, "top"), _S.read(_e, "y")), _S.read(_e, "ch")))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy"))))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "dy"), _S.unary("-", 0.12)), func(): return _S.binary(">", _S.read(_e, "d"), 1.12)), func(): return _S.binary(">", _S.read(_e, "y"), 0))):
		return null
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		return _S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "Cs"), 0), "=", false)
	_S.define(_e, "i", (5 if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "dx"), _S.unary("-", 0.35)), func(): return _S.binary(">", _S.read(_e, "dy"), 0.45))) else (4 if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "dx"), 0.05), func(): return _S.binary(">", _S.read(_e, "dy"), 0.3))) else (2 if _S.truth(_S.binary("<", _S.read(_e, "dy"), 0.18)) else (2 if _S.truth(_S.binary(">", _S.read(_e, "dx"), 0.55)) else 3)))))
	for _v6 in _S.array(_S.read(_e, "SPOTS")):
		var _v7 = _S.scope(_e)
		var _v8 = _v6
		_S.define(_v7, "sx0", _S.prop(_v8, 0))
		_S.define(_v7, "sy0", _S.prop(_v8, 1))
		_S.define(_v7, "r", _S.prop(_v8, 2))
		var _v9 = _S.scope(_v7)
		_S.define(_v9, "ex", _S.binary("*", _S.binary("-", _S.read(_v9, "dx"), _S.read(_v9, "sx0")), _S.read(_v9, "cw")))
		_S.define(_v9, "ey", _S.binary("*", _S.binary("-", _S.read(_v9, "dy"), _S.read(_v9, "sy0")), _S.read(_v9, "ch")))
		if _S.truth(_S.binary("<", _S.binary("+", _S.binary("*", _S.read(_v9, "ex"), _S.read(_v9, "ex")), _S.binary("*", _S.binary("*", _S.read(_v9, "ey"), _S.read(_v9, "ey")), 1.6)), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v9, "r"), _S.read(_v9, "r")), _S.read(_v9, "g")), _S.read(_v9, "g")))):
			_S.write(_v9, "i", (9 if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v9, "ex"), 0), func(): return _S.binary(">", _S.read(_v9, "ey"), 0))) else 8), "=", false)
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "Sm"), 4) if _S.truth(_S.binary("===", _S.read(_e, "i"), 9)) else (_S.prop(_S.read(_e, "Sm"), 3) if _S.truth(_S.binary("===", _S.read(_e, "i"), 8)) else _S.prop(_S.read(_e, "Cs"), _S.read(_e, "i")))), "=", false)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "K", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "Cs", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "cap"), 6]))
	_S.define(_e, "Sm", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "stem"), 5]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f3"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "K"), 7), _S.prop(_S.read(_e, "K"), 6), _S.prop(_S.read(_e, "K"), 5), _S.prop(_S.read(_e, "K"), 4)]}, {"haze": _S.prop(_S.read(_e, "K"), 5)}])]))
	_S.define(_e, "gas", _S.construct(_S.read(_e, "Gas"), []))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "t", 0)
	_S.define(_e, "puffed", false)
	_S.define(_e, "grown", false)
	_S.define(_e, "g", _S.function_value(_e, "_f4"))
	_S.define(_e, "charge", _S.function_value(_e, "_f5"))
	_S.define(_e, "shape", _S.function_value(_e, "_f6"))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f9")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("*", _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "GROW"))]), 1.6]), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SINK")), 0.45)])])))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "GROW"), _S.read(_e, "PUFF"), _S.read(_e, "t")])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "PUFF"))):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "k", _S.call_value(_S.read(_v10, "charge"), []))
		_S.define(_v10, "j", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.binary("*", _S.read(_v10, "t"), 70)]), 0.04), _S.read(_v10, "k")))
		return [_S.binary("+", _S.binary("+", 1, _S.binary("*", 0.28, _S.read(_v10, "k"))), _S.read(_v10, "j")), _S.binary("-", _S.binary("+", 1, _S.binary("*", 0.22, _S.read(_v10, "k"))), _S.read(_v10, "j"))]
	_S.define(_e, "e", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "PUFF")))
	_S.define(_e, "sp", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "e")), 7)]), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "e"), 26)])))
	return [_S.binary("+", 1, _S.binary("*", 0.25, _S.read(_e, "sp"))), _S.binary("-", 1, _S.binary("*", 0.35, _S.read(_e, "sp")))]

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "dt"), 120)]))
	if _S.truth(_S.unary("!", _S.read(_e, "grown"))):
		var _v11 = _S.scope(_e)
		_S.write(_v11, "grown", true, "=", false)
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), 10)):
			_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "GRIT"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 1), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 50), 50]), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [40, 120])), _S.invoke(_S.read(_v12, "R"), "range", [0.5, 0.8]), _S.invoke(_S.read(_v12, "R"), "pick", [[_S.prop(_S.read(_v12, "Sm"), 1), _S.prop(_S.read(_v12, "Sm"), 2)]]), 1])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
		var _v13 = _S.scope(_v11)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 4)):
			_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "DUST"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v13, "R"), "sign", []), _S.invoke(_S.read(_v13, "R"), "range", [10, 40])), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [4, 12])), _S.invoke(_S.read(_v13, "R"), "range", [0.4, 0.7]), _S.prop(_S.read(_v13, "Sm"), 1), _S.invoke(_S.read(_v13, "R"), "range", [2, 3])])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "GROW")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "PUFF"), 0.05))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.25, _S.read(_e, "f"))]))):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "a", _S.invoke(_S.read(_v14, "R"), "range", [_S.binary("*", _S.prop(_S.read(_v14, "Math"), "PI"), 1.05), _S.binary("*", _S.prop(_S.read(_v14, "Math"), "PI"), 1.95)]))
		_S.define(_v14, "d", _S.invoke(_S.read(_v14, "R"), "range", [20, 38]))
		_S.define(_v14, "x", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "d")))
		_S.define(_v14, "y", _S.binary("+", _S.unary("-", 18), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "d")), 0.7)))
		_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "STREAK"), _S.read(_v14, "x"), _S.read(_v14, "y"), _S.binary("*", _S.unary("-", _S.read(_v14, "x")), 3), _S.binary("*", _S.binary("-", _S.unary("-", 18), _S.read(_v14, "y")), 3), _S.invoke(_S.read(_v14, "R"), "range", [0.2, 0.3]), _S.prop(_S.read(_v14, "K"), 6)])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "puffed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "PUFF")))):
		var _v15 = _S.scope(_e)
		_S.write(_v15, "puffed", true, "=", false)
		_S.invoke(_S.read(_v15, "lights"), "add", [0, _S.unary("-", 22), 30, _S.read(_v15, "WHITE"), 0.6, 0.1])
		_S.invoke(_S.read(_v15, "lights"), "add", [0, _S.unary("-", 28), 70, _S.prop(_S.read(_v15, "K"), 5), 0.55, 0.9])
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v16, "i"), 30)):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v17, "Math"), "PI")), 2), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 1.1), 1.1])))
			_S.define(_v17, "sp", _S.invoke(_S.read(_v17, "R"), "range", [15, 95]))
			_S.invoke(_S.read(_v17, "gas"), "add", [_S.read(_v17, "t"), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 8), 8]), _S.binary("+", _S.unary("-", 20), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), 1.3), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), 10), _S.invoke(_S.read(_v17, "R"), "range", [3, 5]), _S.invoke(_S.read(_v17, "R"), "range", [8, 14]), _S.binary("+", _S.read(_v17, "t"), _S.invoke(_S.read(_v17, "R"), "range", [1.6, 2.2])), _S.invoke(_S.read(_v17, "R"), "range", [5, 10])])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
		var _v18 = _S.scope(_v15)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), 6)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "sd", _S.invoke(_S.read(_v19, "R"), "sign", []))
			_S.invoke(_S.read(_v19, "gas"), "add", [_S.read(_v19, "t"), _S.binary("*", _S.read(_v19, "sd"), _S.invoke(_S.read(_v19, "R"), "range", [6, 12])), _S.unary("-", 5), _S.binary("*", _S.read(_v19, "sd"), _S.invoke(_S.read(_v19, "R"), "range", [30, 70])), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [2, 14])), _S.invoke(_S.read(_v19, "R"), "range", [2, 3]), _S.invoke(_S.read(_v19, "R"), "range", [4, 6]), _S.binary("+", _S.read(_v19, "t"), _S.invoke(_S.read(_v19, "R"), "range", [0.8, 1.1])), _S.invoke(_S.read(_v19, "R"), "range", [4, 8])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
		var _v20 = _S.scope(_v15)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 40)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v21, "Math"), "PI")), 2), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 1.4), 1.4])))
			_S.define(_v21, "sp", _S.invoke(_S.read(_v21, "R"), "range", [40, 160]))
			_S.define(_v21, "mote", _S.invoke(_S.read(_v21, "R"), "chance", [0.5]))
			_S.define(_v21, "k", (0.35 if _S.truth(_S.read(_v21, "mote")) else 0.7))
			_S.invoke(_S.read(_v21, "ps"), "spawn", [(_S.prop(_S.read(_v21, "P"), "MOTE") if _S.truth(_S.read(_v21, "mote")) else _S.prop(_S.read(_v21, "P"), "FLAKE")), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", 20), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), _S.read(_v21, "sp")), _S.read(_v21, "k")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "a")]), _S.read(_v21, "sp")), _S.read(_v21, "k")), _S.invoke(_S.read(_v21, "R"), "range", [1, 2]), _S.invoke(_S.read(_v21, "R"), "pick", [[_S.prop(_S.read(_v21, "K"), 7), _S.prop(_S.read(_v21, "K"), 6), _S.prop(_S.read(_v21, "K"), 6), _S.prop(_S.read(_v21, "K"), 5)]]), _S.invoke(_S.read(_v21, "R"), "range", [0.6, 1.6])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		var _v22 = _S.scope(_v15)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 6)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "STAR"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [12, 40])), 0, _S.unary("-", 6), _S.invoke(_S.read(_v22, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v22, "K"), 7), _S.invoke(_S.read(_v22, "R"), "range", [1, 2.4]), _S.invoke(_S.read(_v22, "R"), "range", [0.05, 0.4])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
		var _v23 = _S.scope(_v15)
		_S.define(_v23, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "i"), 8)):
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "DUST"), _S.binary("*", _S.invoke(_S.read(_v23, "R"), "sign", []), _S.invoke(_S.read(_v23, "R"), "range", [4, 10])), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v23, "R"), "sign", []), _S.invoke(_S.read(_v23, "R"), "range", [30, 90])), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [2, 10])), _S.invoke(_S.read(_v23, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v23, "K"), 3), _S.invoke(_S.read(_v23, "R"), "range", [2, 3.5])])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "puffed"), func(): return _S.binary("<", _S.read(_e, "t"), 2.6)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.12, _S.read(_e, "f"))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "FLAKE"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 40), 40]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [30, 70])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 8), 8]), _S.invoke(_S.read(_e, "R"), "range", [4, 14]), _S.invoke(_S.read(_e, "Math"), "min", [_S.invoke(_S.read(_e, "R"), "range", [0.9, 1.5]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05), _S.read(_e, "t"))]), (_S.prop(_S.read(_e, "K"), 7) if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])) else _S.prop(_S.read(_e, "K"), 6)), _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.5])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "SINK")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SINK"), 0.4))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.15, _S.read(_e, "f"))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "DUST"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), _S.invoke(_S.read(_e, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [2, 8])), _S.invoke(_S.read(_e, "R"), "range", [0.3, 0.5]), _S.prop(_S.read(_e, "Sm"), 1), _S.invoke(_S.read(_e, "R"), "range", [1.5, 2.5])])
	_S.invoke(_S.read(_e, "gas"), "prune", [_S.read(_e, "t")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("*", _S.call_value(_S.read(_e, "charge"), []), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "PUFF"), 0.2), _S.binary("+", _S.read(_e, "PUFF"), 1.2), _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "x", _S.unary("-", 20))
		while _S.truth(_S.binary("<=", _S.read(_v24, "x"), 20)):
			_S.invoke(_S.read(_v24, "p"), "dot", [_S.read(_v24, "x"), 0, (_S.prop(_S.read(_v24, "K"), 5) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v24, "Math"), "abs", [_S.read(_v24, "x")]), 10)) else _S.prop(_S.read(_v24, "K"), 4)), _S.binary("*", _S.read(_v24, "k"), _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v24, "Math"), "abs", [_S.read(_v24, "x")]), 21)))])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "x", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 2), 30, _S.prop(_S.read(_e, "K"), 4), _S.binary("*", 0.25, _S.read(_e, "k"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	var _v25 = _S.call_value(_S.read(_e, "shape"), [])
	_S.define(_e, "sx", _S.prop(_v25, 0))
	_S.define(_e, "sy", _S.prop(_v25, 1))
	_S.define(_e, "gl", (_S.binary("*", _S.call_value(_S.read(_e, "charge"), []), _S.binary("+", 0.75, _S.binary("*", 0.25, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), _S.binary("+", 20, _S.binary("*", 30, _S.call_value(_S.read(_e, "charge"), []))))])))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "PUFF"))) else _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "PUFF")), 1.5))])))
	_S.call_value(_S.read(_e, "toadstool"), [_S.read(_e, "p"), _S.read(_e, "K"), _S.read(_e, "Sm"), _S.read(_e, "Cs"), _S.call_value(_S.read(_e, "g"), []), _S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "gl"), _S.binary("*", _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SINK")), 0.45)])]), 20)])
	_S.invoke(_S.read(_e, "gas"), "draw", [_S.read(_e, "p"), _S.read(_e, "t"), _S.prop(_S.read(_e, "K"), 2), _S.prop(_S.read(_e, "K"), 4), _S.prop(_S.read(_e, "K"), 6), _S.prop(_S.read(_e, "K"), 7), 0.62, _S.prop(_S.read(_e, "K"), 6)])
	if _S.truth(_S.prop(_S.prop(_S.read(_e, "gas"), "list"), "length")):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "cx", 0)
		_S.define(_v26, "cy", 0)
		_S.define(_v26, "n", 0)
		for _v27 in _S.array(_S.prop(_S.read(_v26, "gas"), "list")):
			var _v28 = _S.scope(_v26)
			_S.define(_v28, "q", _v27)
			var _v29 = _S.scope(_v28)
			_S.define(_v29, "g2", _S.invoke(_S.read(_v29, "gas"), "at", [_S.read(_v29, "q"), _S.read(_v29, "t")]))
			_S.last([_S.write(_v29, "cx", _S.binary("*", _S.prop(_S.read(_v29, "g2"), "x"), _S.prop(_S.read(_v29, "g2"), "a")), "+=", false), _S.write(_v29, "cy", _S.binary("*", _S.prop(_S.read(_v29, "g2"), "y"), _S.prop(_S.read(_v29, "g2"), "a")), "+=", false), _S.write(_v29, "n", _S.prop(_S.read(_v29, "g2"), "a"), "+=", false)])
		if _S.truth(_S.binary(">", _S.read(_v26, "n"), 0.2)):
			_S.invoke(_S.read(_v26, "p"), "glow", [_S.binary("/", _S.read(_v26, "cx"), _S.read(_v26, "n")), _S.binary("/", _S.read(_v26, "cy"), _S.read(_v26, "n")), 46, _S.prop(_S.read(_v26, "K"), 5), _S.invoke(_S.read(_v26, "Math"), "min", [0.32, _S.binary("*", 0.03, _S.read(_v26, "n"))])])
	_S.define(_e, "e", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "PUFF")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "e"), 0), func(): return _S.binary("<", _S.read(_e, "e"), 0.1))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.unary("-", 20), _S.binary("*", 10, _S.binary("-", 1, _S.binary("/", _S.read(_e, "e"), 0.1))), _S.prop(_S.read(_e, "K"), 7), _S.prop(_S.read(_e, "K"), 6), 0.6])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
