@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/key-glint.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "flyV", _S.import_value("core/index.js", "flyV"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "part", _S.function_value(_e, "_f0"))
	_S.define(_e, "key", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Key glint"}, {"desc": "An ornate silver key hovering and rocking; a glint runs from its bow down the shaft to the teeth and bursts off the tip as falling sparks."}, {"tags": ["pickup", "key", "unlock", "item", "loop"]}, {"size": [72, 60]}, {"origin": [36, 54]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0e1018", "#222838", "#3c4660", "#5e6d8e", "#8c9cbc", "#bccae2", "#e6eeff", "#ffffff"]}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [48, 40]))
	_S.define(_e, "HOVER", 19)
	_S.define(_e, "MID", 8)
	_S.define(_e, "TIP", 17.5)
	_S.define(_e, "G0", 0.18)
	_S.define(_e, "G1", 0.5)
	_S.define(_e, "pose", _S.function_value(_e, "_f6"))
	_S.define(_e, "toWorld", _S.function_value(_e, "_f7"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	_S.define(_e, "rb", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "u"), _S.read(_e, "v")]))
	if _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_e, "rb"), 4.6), func(): return _S.binary(">=", _S.read(_e, "rb"), 2.1))):
		return 1
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "u"), 4.3), func(): return _S.binary("<=", _S.read(_e, "u"), 6)), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), 1.9))):
		return 2
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "u"), 6), func(): return _S.binary("<=", _S.read(_e, "u"), _S.read(_e, "TIP"))), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), 1))):
		return 3
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "u"), 12.6), func(): return _S.binary("<=", _S.read(_e, "u"), _S.binary("-", _S.read(_e, "TIP"), 0.3))), func(): return _S.binary(">", _S.read(_e, "v"), 1)), func(): return _S.binary("<=", _S.read(_e, "v"), 4.6)), func(): return _S.unary("!", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "u"), 14.3), func(): return _S.binary("<", _S.read(_e, "u"), 15.4)), func(): return _S.binary(">", _S.read(_e, "v"), 2.7))))):
		return 4
	return 0

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "cx", _S.arg(_args, 2))
	_S.define(_e, "cy", _S.arg(_args, 3))
	_S.define(_e, "a", _S.arg(_args, 4))
	_S.define(_e, "gu", _S.arg(_args, 5))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	_S.invoke(_S.read(_e, "L"), "begin", [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cx")]), 24), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cy")]), 20)])
	_S.invoke(_S.read(_e, "L"), "fill", [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cx")]), 24), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cy")]), 20), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cx")]), 23), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "cy")]), 19), _S.function_value(_e, "_f2")])
	_S.invoke(_S.invoke(_S.read(_e, "L"), "outline", [_S.prop(_S.read(_e, "C"), 0)]), "draw", [_S.read(_e, "p")])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "cx")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "cy")))
	_S.define(_e, "u", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sa"))), _S.read(_e, "MID")))
	_S.define(_e, "v", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ca"))))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "part"), [_S.read(_e, "u"), _S.read(_e, "v")]))
	if _S.truth(_S.unary("!", _S.read(_e, "k"))):
		return 0
	_S.define(_e, "ny", null)
	if _S.truth(_S.binary("===", _S.read(_e, "k"), 1)):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "rb", _S.invoke(_S.read(_v0, "Math"), "hypot", [_S.read(_v0, "u"), _S.read(_v0, "v")]))
		_S.define(_v0, "out", (1 if _S.truth(_S.binary(">", _S.read(_v0, "rb"), 3.4)) else _S.unary("-", 1)))
		_S.define(_v0, "wx", _S.binary("*", _S.binary("/", _S.read(_v0, "u"), _S.read(_v0, "rb")), _S.read(_v0, "out")))
		_S.define(_v0, "wy", _S.binary("*", _S.binary("/", _S.read(_v0, "v"), _S.read(_v0, "rb")), _S.read(_v0, "out")))
		_S.write(_v0, "ny", _S.unary("-", _S.binary("+", _S.binary("*", _S.binary("-", _S.binary("*", _S.read(_v0, "wx"), _S.read(_v0, "ca")), _S.binary("*", _S.read(_v0, "wy"), _S.read(_v0, "sa"))), _S.unary("-", 0.6)), _S.binary("*", _S.binary("+", _S.binary("*", _S.read(_v0, "wx"), _S.read(_v0, "sa")), _S.binary("*", _S.read(_v0, "wy"), _S.read(_v0, "ca"))), _S.unary("-", 0.8)))), "=", false)
	else:
		_S.write(_e, "ny", (0.8 if _S.truth(_S.binary("<", _S.read(_e, "v"), _S.unary("-", 0.35))) else (_S.unary("-", 0.6) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "v"), 0.35), func(): return _S.binary("!==", _S.read(_e, "k"), 4))) else ((_S.unary("-", 0.5) if _S.truth(_S.binary(">", _S.read(_e, "v"), 3.6)) else 0.1) if _S.truth(_S.binary("===", _S.read(_e, "k"), 4)) else 0.2))), "=", false)
	_S.define(_e, "c", (6 if _S.truth(_S.binary(">", _S.read(_e, "ny"), 0.55)) else (4 if _S.truth(_S.binary(">", _S.read(_e, "ny"), 0.15)) else (3 if _S.truth(_S.binary(">", _S.read(_e, "ny"), _S.unary("-", 0.3))) else 2))))
	if _S.truth(_S.binary("===", _S.read(_e, "k"), 2)):
		_S.write(_e, "c", _S.invoke(_S.read(_e, "Math"), "min", [7, _S.binary("+", _S.read(_e, "c"), 1)]), "=", false)
	_S.define(_e, "g", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_e, "u"), _S.binary("*", _S.read(_e, "v"), 0.45)), _S.read(_e, "gu"))]))
	if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.8)):
		return _S.read(_e, "WHITE")
	if _S.truth(_S.binary("<", _S.read(_e, "g"), 2)):
		_S.write(_e, "c", _S.invoke(_S.read(_e, "Math"), "min", [7, _S.binary("+", _S.read(_e, "c"), 2)]), "=", false)
	return _S.prop(_S.read(_e, "C"), _S.read(_e, "c"))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	var _v1 = _S.call_value(_S.read(_e, "pose"), [_S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"))])
	_S.define(_e, "y", _S.prop(_v1, "y"))
	_S.call_value(_S.read(_e, "blobShadow"), [_S.read(_e, "p"), 0, 10, _S.binary("-", 0.8, _S.binary("*", _S.binary("+", _S.binary("-", _S.unary("-", _S.read(_e, "y")), _S.read(_e, "HOVER")), 1.6), 0.06))])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "T", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")))
	var _v2 = _S.call_value(_S.read(_e, "pose"), [_S.read(_e, "ph")])
	_S.define(_e, "y", _S.prop(_v2, "y"))
	_S.define(_e, "a", _S.prop(_v2, "a"))
	_S.define(_e, "q", _S.binary("/", _S.binary("-", _S.read(_e, "ph"), _S.read(_e, "G0")), _S.binary("-", _S.read(_e, "G1"), _S.read(_e, "G0"))))
	_S.define(_e, "gu", (_S.binary("+", _S.unary("-", 5), _S.binary("*", _S.binary("+", _S.read(_e, "TIP"), 7), _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.read(_e, "q")]))) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "q"), 0), func(): return _S.binary("<", _S.read(_e, "q"), 1))) else _S.unary("-", 100)))
	var _v3 = _S.call_value(_S.read(_e, "toWorld"), [0, 0, 0, _S.read(_e, "y"), _S.read(_e, "a")])
	_S.define(_e, "bx", _S.prop(_v3, 0))
	_S.define(_e, "by", _S.prop(_v3, 1))
	var _v4 = _S.call_value(_S.read(_e, "toWorld"), [_S.read(_e, "TIP"), 0, 0, _S.read(_e, "y"), _S.read(_e, "a")])
	_S.define(_e, "ex", _S.prop(_v4, 0))
	_S.define(_e, "ey", _S.prop(_v4, 1))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "y"), 24, _S.prop(_S.read(_e, "C"), 4), 0.3])
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.read(_e, "bx"), _S.read(_e, "by"), _S.read(_e, "ex"), _S.read(_e, "ey"), 7, _S.prop(_S.read(_e, "C"), 5), 0.16])
	_S.call_value(_S.read(_e, "key"), [_S.read(_e, "p"), _S.read(_e, "C"), 0, _S.read(_e, "y"), _S.read(_e, "a"), _S.read(_e, "gu")])
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), 4)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "life", 0.4)
		_S.define(_v6, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v6, "t"), _S.binary("*", _S.binary("/", _S.binary("+", _S.read(_v6, "i"), 0.6), 4), _S.read(_v6, "T"))), _S.read(_v6, "T")), _S.read(_v6, "T")), _S.read(_v6, "T")))
		if _S.truth(_S.binary(">", _S.read(_v6, "age"), _S.read(_v6, "life"))):
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
			continue
		_S.define(_v6, "an", _S.binary("*", _S.call_value(_S.read(_v6, "rand"), [_S.read(_v6, "i"), _S.prop(_S.read(_v6, "o"), "seed"), 8]), _S.read(_v6, "TAU")))
		_S.define(_v6, "d", _S.binary("+", 9, _S.binary("*", _S.call_value(_S.read(_v6, "rand"), [_S.read(_v6, "i"), _S.prop(_S.read(_v6, "o"), "seed"), 9]), 6)))
		_S.define(_v6, "k", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_v6, "age"), _S.read(_v6, "life")), _S.prop(_S.read(_v6, "Math"), "PI"))]))
		_S.call_value(_S.read(_v6, "glint"), [_S.read(_v6, "p"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "an")]), _S.read(_v6, "d")), _S.binary("-", _S.binary("+", _S.read(_v6, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "an")]), _S.read(_v6, "d")), 0.8)), _S.binary("*", _S.read(_v6, "age"), 6)), _S.invoke(_S.read(_v6, "Math"), "round", [_S.binary("*", 1.8, _S.read(_v6, "k"))]), (_S.prop(_S.read(_v6, "C"), 6) if _S.truth(_S.binary("%", _S.read(_v6, "i"), 2)) else _S.read(_v6, "WHITE")), _S.binary("*", 0.35, _S.read(_v6, "k"))])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	if _S.truth(_S.binary(">", _S.read(_e, "gu"), _S.unary("-", 6))):
		var _v7 = _S.scope(_e)
		var _v8 = _S.call_value(_S.read(_v7, "toWorld"), [_S.call_value(_S.read(_v7, "clamp"), [_S.read(_v7, "gu"), 0, _S.read(_v7, "TIP")]), 0, 0, _S.read(_v7, "y"), _S.read(_v7, "a")])
		_S.define(_v7, "gx", _S.prop(_v8, 0))
		_S.define(_v7, "gy", _S.prop(_v8, 1))
		_S.invoke(_S.read(_v7, "p"), "glow", [_S.read(_v7, "gx"), _S.read(_v7, "gy"), 10, _S.prop(_S.read(_v7, "C"), 6), _S.binary("*", 0.45, _S.invoke(_S.read(_v7, "Math"), "sin", [_S.binary("*", _S.read(_v7, "q"), _S.prop(_S.read(_v7, "Math"), "PI"))]))])
	var _v9 = _S.call_value(_S.read(_e, "toWorld"), [_S.read(_e, "TIP"), 0, 0, _S.read(_e, "y"), _S.read(_e, "a")])
	_S.define(_e, "tx", _S.prop(_v9, 0))
	_S.define(_e, "ty", _S.prop(_v9, 1))
	_S.define(_e, "at", _S.binary("*", _S.binary("+", _S.binary("-", _S.read(_e, "ph"), _S.read(_e, "G1")), 0.02), _S.read(_e, "T")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "at"), 0), func(): return _S.binary("<", _S.read(_e, "at"), 0.3))):
		_S.call_value(_S.read(_e, "glint"), [_S.read(_e, "p"), _S.read(_e, "tx"), _S.read(_e, "ty"), _S.binary("*", 4.5, _S.binary("-", 1, _S.binary("/", _S.read(_e, "at"), 0.3))), _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.6, _S.binary("-", 1, _S.binary("/", _S.read(_e, "at"), 0.3)))])
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), 9)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "life", _S.binary("+", 0.32, _S.binary("*", _S.call_value(_S.read(_v11, "rand"), [_S.read(_v11, "i"), _S.prop(_S.read(_v11, "o"), "seed"), 4]), 0.3)))
		_S.define(_v11, "age", _S.binary("-", _S.read(_v11, "at"), _S.binary("*", _S.call_value(_S.read(_v11, "rand"), [_S.read(_v11, "i"), _S.prop(_S.read(_v11, "o"), "seed"), 5]), 0.05)))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v11, "age"), 0), func(): return _S.binary(">", _S.read(_v11, "age"), _S.read(_v11, "life")))):
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
			continue
		_S.define(_v11, "sp", _S.binary("+", 25, _S.binary("*", _S.call_value(_S.read(_v11, "rand"), [_S.read(_v11, "i"), _S.prop(_S.read(_v11, "o"), "seed"), 1]), 45)))
		_S.define(_v11, "an", _S.binary("+", _S.read(_v11, "a"), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v11, "rand"), [_S.read(_v11, "i"), _S.prop(_S.read(_v11, "o"), "seed"), 2]), 0.5), 2.2)))
		var _v12 = _S.call_value(_S.read(_v11, "fly"), [_S.read(_v11, "tx"), _S.read(_v11, "ty"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "an")]), _S.read(_v11, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "an")]), _S.read(_v11, "sp")), 25), _S.read(_v11, "age"), 380, 2.5])
		_S.define(_v11, "x", _S.prop(_v12, 0))
		_S.define(_v11, "yy", _S.prop(_v12, 1))
		var _v13 = _S.call_value(_S.read(_v11, "flyV"), [_S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "an")]), _S.read(_v11, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "an")]), _S.read(_v11, "sp")), 25), _S.read(_v11, "age"), 380, 2.5])
		_S.define(_v11, "vx", _S.prop(_v13, 0))
		_S.define(_v11, "vy", _S.prop(_v13, 1))
		if _S.truth(_S.binary(">", _S.read(_v11, "yy"), _S.unary("-", 0.5))):
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
			continue
		_S.define(_v11, "s", _S.logical("||", _S.invoke(_S.read(_v11, "Math"), "hypot", [_S.read(_v11, "vx"), _S.read(_v11, "vy")]), func(): return 1))
		_S.define(_v11, "L2", _S.invoke(_S.read(_v11, "Math"), "min", [4, _S.binary("+", 1, _S.binary("*", _S.read(_v11, "s"), 0.03))]))
		_S.define(_v11, "k", _S.binary("-", 1, _S.binary("/", _S.read(_v11, "age"), _S.read(_v11, "life"))))
		_S.invoke(_S.read(_v11, "p"), "line", [_S.binary("-", _S.read(_v11, "x"), _S.binary("*", _S.binary("/", _S.read(_v11, "vx"), _S.read(_v11, "s")), _S.read(_v11, "L2"))), _S.binary("-", _S.read(_v11, "yy"), _S.binary("*", _S.binary("/", _S.read(_v11, "vy"), _S.read(_v11, "s")), _S.read(_v11, "L2"))), _S.read(_v11, "x"), _S.read(_v11, "yy"), _S.function_value(_v11, "_f5"), _S.binary("*", _S.read(_v11, "k"), 1.6)])
		_S.invoke(_S.read(_v11, "p"), "glow", [_S.read(_v11, "x"), _S.read(_v11, "yy"), 3, _S.prop(_S.read(_v11, "C"), 5), _S.binary("*", 0.4, _S.read(_v11, "k"))])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "C"), 5))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ph", _S.arg(_args, 0))
	return _S.merge([{"y": _S.binary("-", _S.unary("-", _S.read(_e, "HOVER")), _S.binary("*", 1.6, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))])))}, {"a": _S.binary("+", 0.42, _S.binary("*", 0.11, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 0.9)])))}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	_S.define(_e, "cx", _S.arg(_args, 2))
	_S.define(_e, "cy", _S.arg(_args, 3))
	_S.define(_e, "a", _S.arg(_args, 4))
	return [_S.binary("-", _S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.binary("-", _S.read(_e, "u"), _S.read(_e, "MID")), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))), _S.binary("*", _S.read(_e, "v"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))), _S.binary("+", _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.binary("-", _S.read(_e, "u"), _S.read(_e, "MID")), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))), _S.binary("*", _S.read(_e, "v"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")])))]
