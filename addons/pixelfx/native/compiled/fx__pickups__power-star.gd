@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/power-star.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "star", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Power star"}, {"desc": "A fat bevelled star rocks side to side and swells on each beat, rays of light turning slowly behind it, sparks spinning off its points."}, {"tags": ["pickup", "star", "power-up", "invincible", "bonus", "loop"]}, {"size": [88, 84]}, {"origin": [44, 76]}, {"duration": 1.6}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#2a1604", "#5e3208", "#a05c0c", "#e09414", "#ffc626", "#ffe866", "#fff8c4", "#ffffff"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [44, 44]))
	_S.define(_e, "HOVER", 25)
	_S.define(_e, "RO", 11.5)
	_S.define(_e, "RI", 5.2)
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#1a0e04"]))
	_S.define(_e, "BEATS", [0.25, 0.75])
	_S.define(_e, "RAYS", 10)
	_S.define(_e, "LA", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.unary("-", 0.8), _S.unary("-", 0.6)]))
	_S.define(_e, "swell", _S.function_value(_e, "_f7"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "cx", _S.arg(_args, 2))
	_S.define(_e, "cy", _S.arg(_args, 3))
	_S.define(_e, "rot", _S.arg(_args, 4))
	_S.define(_e, "sc", _S.arg(_args, 5))
	_S.invoke(_S.read(_e, "L"), "begin", [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cx")]), 21), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cy")]), 21)])
	_S.invoke(_S.read(_e, "L"), "fill", [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cx")]), 21), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cy")]), 21), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cx")]), 20), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cy")]), 20), _S.function_value(_e, "_f1")])
	_S.invoke(_S.invoke(_S.read(_e, "L"), "outline", [_S.read(_e, "INK")]), "draw", [_S.read(_e, "p")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "cx")), _S.read(_e, "sc")))
	_S.define(_e, "dy", _S.binary("/", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "cy")), _S.read(_e, "sc")))
	_S.define(_e, "r", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	if _S.truth(_S.binary(">", _S.read(_e, "r"), _S.binary("+", _S.read(_e, "RO"), 0.5))):
		return 0
	_S.define(_e, "a", _S.binary("+", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]), _S.read(_e, "rot")), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)))
	_S.write(_e, "a", _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "a"), _S.read(_e, "TAU")), _S.read(_e, "TAU")), _S.read(_e, "TAU")), "=", false)
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "a"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 5))]))
	_S.define(_e, "half", _S.binary("%", _S.read(_e, "k"), 2))
	_S.define(_e, "tip", _S.binary("*", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "k"), 2)]), _S.read(_e, "half")), _S.binary("/", _S.binary("*", 2, _S.prop(_S.read(_e, "Math"), "PI")), 5)))
	_S.define(_e, "tA", _S.binary("+", _S.binary("-", _S.read(_e, "tip"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)), _S.read(_e, "rot")))
	_S.define(_e, "iA", _S.binary("+", _S.read(_e, "tA"), _S.binary("*", (_S.unary("-", 1) if _S.truth(_S.read(_e, "half")) else 1), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 5))))
	_S.define(_e, "tx", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "tA")]), _S.read(_e, "RO")))
	_S.define(_e, "ty", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "tA")]), _S.read(_e, "RO")))
	_S.define(_e, "ix", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "iA")]), _S.read(_e, "RI")))
	_S.define(_e, "iy", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "iA")]), _S.read(_e, "RI")))
	_S.define(_e, "ex", _S.binary("-", _S.read(_e, "ix"), _S.read(_e, "tx")))
	_S.define(_e, "ey", _S.binary("-", _S.read(_e, "iy"), _S.read(_e, "ty")))
	_S.define(_e, "side", _S.binary("-", _S.binary("*", _S.binary("-", _S.read(_e, "dx"), _S.read(_e, "tx")), _S.read(_e, "ey")), _S.binary("*", _S.binary("-", _S.read(_e, "dy"), _S.read(_e, "ty")), _S.read(_e, "ex"))))
	_S.define(_e, "cside", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "tx")), _S.read(_e, "ey")), _S.binary("*", _S.read(_e, "ty"), _S.read(_e, "ex"))))
	if _S.truth(_S.binary("<", _S.binary("*", _S.read(_e, "side"), _S.read(_e, "cside")), 0)):
		return 0
	_S.define(_e, "n", _S.binary("+", _S.read(_e, "tA"), _S.binary("*", (_S.unary("-", 1) if _S.truth(_S.read(_e, "half")) else 1), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2))))
	_S.define(_e, "l", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("-", _S.read(_e, "n"), _S.read(_e, "LA"))]))
	_S.define(_e, "ridge", _S.binary("<", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]), _S.read(_e, "tA"))])]), _S.read(_e, "r")), 0.6))
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 1.2)):
		return _S.read(_e, "WHITE")
	_S.define(_e, "toLight", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("-", _S.read(_e, "tA"), _S.read(_e, "LA"))]))
	if _S.truth(_S.read(_e, "ridge")):
		return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "toLight"), 0.3)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "toLight"), _S.unary("-", 0.4))) else _S.prop(_S.read(_e, "C"), 5)))
	return _S.prop(_S.read(_e, "C"), (6 if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.6)) else (5 if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.15)) else (4 if _S.truth(_S.binary(">", _S.read(_e, "l"), _S.unary("-", 0.35))) else (3 if _S.truth(_S.binary(">", _S.read(_e, "l"), _S.unary("-", 0.75))) else 2)))))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", _S.read(_e, "HOVER")), _S.binary("*", 1.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2)]))))
	_S.define(_e, "sw", _S.call_value(_S.read(_e, "swell"), [_S.read(_e, "ph")]))
	_S.call_value(_S.read(_e, "blobShadow"), [_S.read(_e, "p"), 0, _S.binary("+", 9, _S.binary("*", 2, _S.read(_e, "sw"))), 0.7])
	_S.define(_e, "spin", _S.binary("*", _S.read(_e, "ph"), _S.binary("*", _S.binary("/", _S.read(_e, "TAU"), _S.read(_e, "RAYS")), 2)))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.read(_v0, "RAYS"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.binary("+", _S.read(_v1, "spin"), _S.binary("/", _S.binary("*", _S.read(_v1, "i"), _S.read(_v1, "TAU")), _S.read(_v1, "RAYS"))))
		_S.define(_v1, "len", _S.binary("*", (22 if _S.truth(_S.binary("%", _S.read(_v1, "i"), 2)) else 34), _S.binary("+", 1, _S.binary("*", 0.18, _S.read(_v1, "sw")))))
		_S.define(_v1, "ca", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]))
		_S.define(_v1, "sa", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]))
		_S.define(_v1, "w", (0.06 if _S.truth(_S.binary("%", _S.read(_v1, "i"), 2)) else 0.09))
		_S.invoke(_S.read(_v1, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_v1, "len")), 2), _S.binary("-", _S.binary("-", _S.read(_v1, "y"), _S.read(_v1, "len")), 2), _S.binary("+", _S.read(_v1, "len"), 2), _S.binary("+", _S.binary("+", _S.read(_v1, "y"), _S.read(_v1, "len")), 2), _S.function_value(_v1, "_f3")])
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v1, "i"), 2), 0)):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "d0", _S.binary("+", _S.read(_v2, "RO"), 3))
			_S.define(_v2, "d1", _S.invoke(_S.read(_v2, "Math"), "min", [_S.binary("*", _S.read(_v2, "len"), 0.88), (_S.binary("/", _S.binary("-", _S.unary("-", 2), _S.read(_v2, "y")), _S.read(_v2, "sa")) if _S.truth(_S.binary(">", _S.read(_v2, "sa"), 0.05)) else INF)]))
			if _S.truth(_S.binary(">", _S.read(_v2, "d1"), _S.read(_v2, "d0"))):
				_S.invoke(_S.read(_v2, "p"), "line", [_S.binary("*", _S.read(_v2, "ca"), _S.read(_v2, "d0")), _S.binary("+", _S.read(_v2, "y"), _S.binary("*", _S.read(_v2, "sa"), _S.read(_v2, "d0"))), _S.binary("*", _S.read(_v2, "ca"), _S.read(_v2, "d1")), _S.binary("+", _S.read(_v2, "y"), _S.binary("*", _S.read(_v2, "sa"), _S.read(_v2, "d1"))), _S.function_value(_v2, "_f4"), _S.function_value(_v2, "_f5")])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "yy", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "rx", _S.read(_e, "x"))
	_S.define(_e, "ry", _S.binary("-", _S.read(_e, "yy"), _S.read(_e, "y")))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "rx"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "ry"), _S.read(_e, "sa"))))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "d"), 8), func(): return _S.binary(">", _S.read(_e, "d"), _S.read(_e, "len")))):
		return null
	_S.define(_e, "q", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.binary("*", _S.read(_e, "rx"), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "ry"), _S.read(_e, "ca")))]))
	_S.define(_e, "hw", _S.binary("+", 0.5, _S.binary("*", _S.read(_e, "d"), _S.read(_e, "w"))))
	if _S.truth(_S.binary(">", _S.read(_e, "q"), _S.binary("+", _S.read(_e, "hw"), 1.5))):
		return null
	_S.set_prop(_S.read(_e, "out"), "l", (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "q"), _S.binary("*", _S.read(_e, "hw"), 0.5))) else _S.prop(_S.read(_e, "C"), 5)), "=", false)
	_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("+", 0.32, _S.binary("*", 0.22, _S.read(_e, "sw"))), (1 if _S.truth(_S.binary("<", _S.read(_e, "q"), _S.read(_e, "hw"))) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "q"), _S.read(_e, "hw")), 1.5)))), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.read(_e, "d"), _S.read(_e, "len"))), 1.2])), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.binary("-", _S.read(_e, "d"), 8), 4)])), "=", false)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.35)) else _S.prop(_S.read(_e, "C"), 5))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else _S.binary("-", 1.6, _S.binary("*", _S.read(_e, "u"), 1.4))), _S.binary("+", 0.75, _S.binary("*", 0.35, _S.read(_e, "sw"))))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", _S.read(_e, "HOVER")), _S.binary("*", 1.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 2)]))))
	_S.define(_e, "sw", _S.call_value(_S.read(_e, "swell"), [_S.read(_e, "ph")]))
	_S.define(_e, "rot", _S.binary("*", 0.22, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))])))
	_S.define(_e, "sc", _S.binary("+", 1, _S.binary("*", 0.13, _S.read(_e, "sw"))))
	_S.invoke(_S.read(_e, "p"), "glowRing", [0, _S.read(_e, "y"), _S.binary("+", _S.binary("*", _S.read(_e, "RO"), _S.read(_e, "sc")), 3), 13, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.32, _S.binary("*", 0.25, _S.read(_e, "sw")))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "y"), 6, _S.prop(_S.read(_e, "C"), 6), _S.binary("+", 0.12, _S.binary("*", 0.2, _S.read(_e, "sw")))])
	_S.call_value(_S.read(_e, "star"), [_S.read(_e, "p"), _S.read(_e, "C"), 0, _S.read(_e, "y"), _S.read(_e, "rot"), _S.read(_e, "sc")])
	for _v3 in _S.array(_S.read(_e, "BEATS")):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "b", _v3)
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "age", _S.binary("*", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v5, "ph"), _S.read(_v5, "b")), 1), 1), 1), _S.prop(_S.read(_v5, "meta"), "duration")))
		if _S.truth(_S.binary(">", _S.read(_v5, "age"), 0.45)):
			continue
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 5)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "a", _S.binary("-", _S.binary("+", _S.read(_v7, "rot"), _S.binary("/", _S.binary("*", _S.read(_v7, "i"), _S.read(_v7, "TAU")), 5)), _S.binary("/", _S.prop(_S.read(_v7, "Math"), "PI"), 2)))
			_S.define(_v7, "sp", _S.binary("+", 70, _S.binary("*", _S.call_value(_S.read(_v7, "rand"), [_S.read(_v7, "i"), _S.binary("*", _S.read(_v7, "b"), 10), 3]), 30)))
			_S.define(_v7, "tan", 35)
			_S.define(_v7, "vx", _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "tan"))))
			_S.define(_v7, "vy", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "tan"))))
			var _v8 = _S.call_value(_S.read(_v7, "fly"), [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "RO")), _S.read(_v7, "sc")), _S.binary("+", _S.read(_v7, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "RO")), _S.read(_v7, "sc"))), _S.read(_v7, "vx"), _S.read(_v7, "vy"), _S.read(_v7, "age"), 60, 4])
			_S.define(_v7, "x", _S.prop(_v8, 0))
			_S.define(_v7, "yy", _S.prop(_v8, 1))
			_S.define(_v7, "k", _S.binary("-", 1, _S.binary("/", _S.read(_v7, "age"), 0.45)))
			_S.call_value(_S.read(_v7, "glint"), [_S.read(_v7, "p"), _S.read(_v7, "x"), _S.read(_v7, "yy"), _S.invoke(_S.read(_v7, "Math"), "round", [_S.binary("*", 2, _S.read(_v7, "k"))]), (_S.read(_v7, "WHITE") if _S.truth(_S.binary(">", _S.read(_v7, "k"), 0.5)) else _S.prop(_S.read(_v7, "C"), 6)), _S.binary("*", 0.45, _S.read(_v7, "k"))])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "ph"), 24)]))
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), 18)):
		var _v10 = _S.scope(_v9)
		if _S.truth(_S.binary(">", _S.call_value(_S.read(_v10, "rand"), [_S.binary("+", _S.read(_v10, "f"), _S.binary("*", _S.read(_v10, "i"), 3)), _S.read(_v10, "i"), _S.prop(_S.read(_v10, "o"), "seed")]), 0.32)):
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
			continue
		_S.define(_v10, "a", _S.binary("*", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "i"), 1, _S.prop(_S.read(_v10, "o"), "seed")]), _S.read(_v10, "TAU")))
		_S.define(_v10, "d", _S.binary("+", 13, _S.binary("*", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "i"), 2, _S.prop(_S.read(_v10, "o"), "seed")]), 20)))
		_S.define(_v10, "sy", _S.binary("+", _S.read(_v10, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "d")), 0.85)))
		if _S.truth(_S.binary("<", _S.read(_v10, "sy"), _S.unary("-", 2))):
			_S.invoke(_S.read(_v10, "p"), "px", [_S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "d")), _S.read(_v10, "sy"), (_S.read(_v10, "WHITE") if _S.truth(_S.binary("<", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "f"), _S.read(_v10, "i"), 5]), 0.5)) else _S.prop(_S.read(_v10, "C"), 6))])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), 4)):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "life", 0.3)
		_S.define(_v12, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v12, "t"), _S.binary("*", _S.binary("/", _S.binary("+", _S.read(_v12, "i"), 0.3), 4), _S.prop(_S.read(_v12, "meta"), "duration"))), _S.prop(_S.read(_v12, "meta"), "duration")), _S.prop(_S.read(_v12, "meta"), "duration")), _S.prop(_S.read(_v12, "meta"), "duration")))
		if _S.truth(_S.binary(">", _S.read(_v12, "age"), _S.read(_v12, "life"))):
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "+=", true)
			continue
		_S.define(_v12, "a", _S.binary("*", _S.call_value(_S.read(_v12, "rand"), [_S.read(_v12, "i"), 7, _S.prop(_S.read(_v12, "o"), "seed")]), _S.read(_v12, "TAU")))
		_S.define(_v12, "d", _S.binary("+", 15, _S.binary("*", _S.call_value(_S.read(_v12, "rand"), [_S.read(_v12, "i"), 8, _S.prop(_S.read(_v12, "o"), "seed")]), 12)))
		_S.define(_v12, "k", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_v12, "age"), _S.read(_v12, "life")), _S.prop(_S.read(_v12, "Math"), "PI"))]))
		_S.call_value(_S.read(_v12, "glint"), [_S.read(_v12, "p"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "d")), _S.binary("+", _S.read(_v12, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "d")), 0.85)), _S.invoke(_S.read(_v12, "Math"), "round", [_S.binary("*", 2.5, _S.read(_v12, "k"))]), (_S.prop(_S.read(_v12, "C"), 6) if _S.truth(_S.binary("%", _S.read(_v12, "i"), 2)) else _S.read(_v12, "WHITE")), _S.binary("*", 0.4, _S.read(_v12, "k"))])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "+=", true)
	_S.define(_e, "g", _S.binary("/", _S.binary("%", _S.binary("+", _S.read(_e, "ph"), 0.1), 0.5), 0.5))
	if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.14)):
		_S.call_value(_S.read(_e, "glint"), [_S.read(_e, "p"), _S.binary("+", _S.unary("-", 2), _S.binary("*", _S.read(_e, "rot"), 4)), _S.binary("-", _S.read(_e, "y"), 6), _S.binary("*", 3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "g"), 0.14), _S.prop(_S.read(_e, "Math"), "PI"))])), _S.read(_e, "WHITE"), 0.5])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ph", _S.arg(_args, 0))
	_S.define(_e, "s", 0)
	for _v13 in _S.array(_S.read(_e, "BEATS")):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "b", _v13)
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "u", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v15, "ph"), _S.read(_v15, "b")), 1), 1), 1))
		_S.write(_v15, "s", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_v15, "u")), 14)]), (1 if _S.truth(_S.binary(">", _S.binary("-", 1, _S.binary("*", _S.read(_v15, "u"), 2.5)), 0)) else 0)), "+=", false)
	return _S.read(_e, "s")
