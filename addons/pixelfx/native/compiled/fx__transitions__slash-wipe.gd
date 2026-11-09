@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/slash-wipe.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "fillConvex", _S.import_value("fx/transitions/_lib.js", "fillConvex"))
	_S.define(_e, "halfPlane", _S.import_value("fx/transitions/_lib.js", "halfPlane"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Slash wipe"}, {"desc": "A white-hot blade edge slices across the screen, light ahead of it and sparks spraying back over the cover; a second cut flashes through and the cover splits apart."}, {"tags": ["slash", "blade", "cut", "sparks", "wipe"]}, {"duration": 1.7}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#b8c9e8", "#e8f1ff", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"seed": 2}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SL", 0.55)
	_S.define(_e, "CS", _S.binary("/", 1, _S.invoke(_S.read(_e, "Math"), "hypot", [1, _S.read(_e, "SL")])))
	_S.define(_e, "HALO", 18)
	_S.define(_e, "T0", 0.06)
	_S.define(_e, "SWEEP", 0.62)
	_S.define(_e, "E0", _S.binary("-", _S.binary("*", _S.unary("-", _S.binary("/", _S.read(_e, "H"), 2)), _S.read(_e, "SL")), 4))
	_S.define(_e, "E1", _S.binary("+", _S.binary("+", _S.read(_e, "W"), _S.binary("*", _S.binary("/", _S.read(_e, "H"), 2), _S.read(_e, "SL"))), 24))
	_S.define(_e, "CUT", 0.84)
	_S.define(_e, "CSW", 0.07)
	_S.define(_e, "CHOLD", 0.05)
	_S.define(_e, "CTRAIL", 0.12)
	_S.define(_e, "SLIP", _S.binary("+", _S.read(_e, "CUT"), 0.12))
	_S.define(_e, "SPLIT", _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "CUT"), _S.read(_e, "CSW")), _S.read(_e, "CHOLD")), _S.read(_e, "CTRAIL")))
	_S.define(_e, "edgeAt", _S.function_value(_e, "_f9"))
	_S.define(_e, "speedAt", _S.function_value(_e, "_f10"))
	_S.define(_e, "xAt", _S.function_value(_e, "_f11"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ink", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "color")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "C"), "length"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "R"), "range", [0.42, 0.56]))
	_S.define(_e, "ux", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]))
	_S.define(_e, "uy", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]))
	_S.define(_e, "nx", _S.read(_e, "uy"))
	_S.define(_e, "ny", _S.unary("-", _S.read(_e, "ux")))
	_S.define(_e, "cx", _S.binary("+", _S.binary("/", _S.read(_e, "W"), 2), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 24), 24])))
	_S.define(_e, "cy", _S.binary("+", _S.binary("/", _S.read(_e, "H"), 2), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 10), 10])))
	_S.define(_e, "area", [[_S.unary("-", 24), _S.unary("-", 24)], [_S.binary("+", _S.read(_e, "W"), 24), _S.unary("-", 24)], [_S.binary("+", _S.read(_e, "W"), 24), _S.binary("+", _S.read(_e, "H"), 24)], [_S.unary("-", 24), _S.binary("+", _S.read(_e, "H"), 24)]])
	_S.define(_e, "ends", _S.invoke([_S.unary("-", 1), 1], "map", [_S.function_value(_e, "_f1")]))
	var _v2 = _S.read(_e, "ends")
	_S.define(_e, "A", _S.prop(_v2, 0))
	_S.define(_e, "B", _S.prop(_v2, 1))
	_S.define(_e, "LC", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.prop(_S.read(_e, "B"), 0), _S.prop(_S.read(_e, "A"), 0)), _S.binary("-", _S.prop(_S.read(_e, "B"), 1), _S.prop(_S.read(_e, "A"), 1))]))
	_S.define(_e, "halves", _S.invoke([1, _S.unary("-", 1)], "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "acc", 0)
	_S.define(_e, "entered", false)
	_S.define(_e, "tipped", false)
	_S.define(_e, "split", false)
	_S.define(_e, "end", _S.binary("-", _S.read(_e, "D"), 0.05))
	_S.define(_e, "placeOf", _S.function_value(_e, "_f3"))
	_S.define(_e, "moved", _S.function_value(_e, "_f4"))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "lo", 0)
	_S.define(_e, "hi", 400)
	var _v0 = _S.scope(_e)
	_S.define(_v0, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "k"), 30)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "m", _S.binary("/", _S.binary("+", _S.read(_v1, "lo"), _S.read(_v1, "hi")), 2))
		_S.define(_v1, "x", _S.binary("+", _S.read(_v1, "cx"), _S.binary("*", _S.binary("*", _S.read(_v1, "s"), _S.read(_v1, "ux")), _S.read(_v1, "m"))))
		_S.define(_v1, "y", _S.binary("+", _S.read(_v1, "cy"), _S.binary("*", _S.binary("*", _S.read(_v1, "s"), _S.read(_v1, "uy")), _S.read(_v1, "m"))))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_v1, "x"), 0), func(): return _S.binary("<=", _S.read(_v1, "x"), _S.read(_v1, "W"))), func(): return _S.binary(">=", _S.read(_v1, "y"), 0)), func(): return _S.binary("<=", _S.read(_v1, "y"), _S.read(_v1, "H")))):
			_S.write(_v1, "lo", _S.read(_v1, "m"), "=", false)
		else:
			_S.write(_v1, "hi", _S.read(_v1, "m"), "=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "k", 1, "+=", true)
	return [_S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.binary("*", _S.read(_e, "s"), _S.read(_e, "ux")), _S.read(_e, "lo"))), _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.binary("*", _S.read(_e, "s"), _S.read(_e, "uy")), _S.read(_e, "lo")))]

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "pts", _S.call_value(_S.read(_e, "halfPlane"), [_S.read(_e, "area"), _S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "s"), _S.read(_e, "nx")), _S.binary("*", _S.read(_e, "s"), _S.read(_e, "ny"))]))
	_S.define(_e, "mx", 0)
	_S.define(_e, "my", 0)
	for _v3 in _S.array(_S.read(_e, "pts")):
		var _v4 = _S.scope(_e)
		var _v5 = _v3
		_S.define(_v4, "x", _S.prop(_v5, 0))
		_S.define(_v4, "y", _S.prop(_v5, 1))
		_S.last([_S.write(_v4, "mx", _S.binary("/", _S.read(_v4, "x"), _S.prop(_S.read(_v4, "pts"), "length")), "+=", false), _S.write(_v4, "my", _S.binary("/", _S.read(_v4, "y"), _S.prop(_S.read(_v4, "pts"), "length")), "+=", false)])
	return _S.merge([{"s": _S.read(_e, "s")}, {"pts": _S.read(_e, "pts")}, {"mx": _S.read(_e, "mx")}, {"my": _S.read(_e, "my")}, {"spin": _S.binary("*", _S.read(_e, "s"), _S.invoke(_S.read(_e, "R"), "range", [0.5, 0.9]))}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "hf", _S.arg(_args, 0))
	_S.define(_e, "slip", _S.binary("*", _S.binary("*", 5, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SLIP")), 0.12)])])), (1 if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "hf"), "s"), 0)) else _S.unary("-", 0.4))))
	_S.define(_e, "u", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SPLIT"))]))
	_S.define(_e, "sep", _S.binary("+", _S.binary("*", 30, _S.read(_e, "u")), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, 1500), _S.read(_e, "u")), _S.read(_e, "u"))))
	_S.define(_e, "rot", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "hf"), "spin"), _S.read(_e, "u")), _S.read(_e, "u")))
	return _S.merge([{"dx": _S.binary("+", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "slip")), _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "hf"), "s"), _S.read(_e, "nx")), _S.read(_e, "sep")))}, {"dy": _S.binary("+", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "slip")), _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "hf"), "s"), _S.read(_e, "ny")), _S.read(_e, "sep")))}, {"rot": _S.read(_e, "rot")}, {"sep": _S.read(_e, "sep")}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "hf", _S.arg(_args, 0))
	_S.define(_e, "pl", _S.arg(_args, 1))
	var _v6 = _S.arg(_args, 2)
	_S.define(_e, "x", _S.prop(_v6, 0))
	_S.define(_e, "y", _S.prop(_v6, 1))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "pl"), "rot")]))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "pl"), "rot")]))
	_S.define(_e, "lx", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "hf"), "mx")))
	_S.define(_e, "ly", _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "hf"), "my")))
	return [_S.binary("+", _S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "hf"), "mx"), _S.binary("*", _S.read(_e, "lx"), _S.read(_e, "c"))), _S.binary("*", _S.read(_e, "ly"), _S.read(_e, "s"))), _S.prop(_S.read(_e, "pl"), "dx")), _S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "hf"), "my"), _S.binary("*", _S.read(_e, "lx"), _S.read(_e, "s"))), _S.binary("*", _S.read(_e, "ly"), _S.read(_e, "c"))), _S.prop(_S.read(_e, "pl"), "dy"))]

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "sp", _S.call_value(_S.read(_e, "speedAt"), [_S.read(_e, "t")]))
	_S.define(_e, "e", _S.call_value(_S.read(_e, "edgeAt"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "entered")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T0")))):
		var _v7 = _S.scope(_e)
		_S.write(_v7, "entered", true, "=", false)
		_S.invoke(_S.read(_v7, "lights"), "add", [4, 4, 60, _S.prop(_S.read(_v7, "C"), 5), 0.6, 0.25])
	var _v8 = _S.scope(_e)
	_S.write(_v8, "acc", _S.binary("*", _S.binary("*", _S.read(_v8, "sp"), _S.read(_v8, "dt")), 0.035), "+=", false)
	while _S.truth(_S.binary(">", _S.read(_v8, "acc"), 1)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "y", _S.invoke(_S.read(_v9, "R"), "range", [4, _S.binary("-", _S.read(_v9, "H"), 4)]))
		_S.define(_v9, "x", _S.binary("-", _S.call_value(_S.read(_v9, "xAt"), [_S.read(_v9, "e"), _S.read(_v9, "y")]), 1))
		_S.define(_v9, "a0", _S.binary("+", _S.prop(_S.read(_v9, "Math"), "PI"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 0.1), 0.6])))
		_S.define(_v9, "n", _S.invoke(_S.read(_v9, "R"), "int", [5, 10]))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v9, "x"), 0), func(): return _S.binary(">=", _S.read(_v9, "x"), _S.read(_v9, "W")))):
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "acc", 1, "-=", true)
			continue
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), _S.read(_v10, "n"))):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "a", _S.binary("+", _S.read(_v11, "a0"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 0.75), 0.75])))
			_S.define(_v11, "v", _S.binary("*", _S.invoke(_S.read(_v11, "R"), "range", [0.2, 1]), _S.binary("+", 140, _S.binary("*", 0.22, _S.read(_v11, "sp")))))
			_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "SPARK"), _S.read(_v11, "x"), _S.binary("+", _S.read(_v11, "y"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "v")), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "v")), _S.invoke(_S.read(_v11, "R"), "range", [0.15, 0.4])])
			if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.4])):
				_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "MOTE"), _S.read(_v11, "x"), _S.read(_v11, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "v")), 0.45), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "v")), 0.45), 20), _S.invoke(_S.read(_v11, "R"), "range", [0.2, 0.5]), (_S.prop(_S.read(_v11, "C"), 6) if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.5])) else _S.prop(_S.read(_v11, "C"), 5)), 0.7])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
		_S.invoke(_S.read(_v9, "lights"), "add", [_S.read(_v9, "x"), _S.read(_v9, "y"), _S.invoke(_S.read(_v9, "R"), "range", [30, 46]), _S.prop(_S.read(_v9, "C"), 5), 0.35, 0.14])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "acc", 1, "-=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "tipped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CUT"), _S.read(_e, "CSW"))))):
		var _v12 = _S.scope(_e)
		_S.write(_v12, "tipped", true, "=", false)
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 12)):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "a", _S.binary("+", _S.invoke(_S.read(_v14, "Math"), "atan2", [_S.read(_v14, "uy"), _S.read(_v14, "ux")]), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 0.5), 0.5])))
			_S.define(_v14, "v", _S.invoke(_S.read(_v14, "R"), "range", [150, 400]))
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "SPARK"), _S.binary("-", _S.prop(_S.read(_v14, "B"), 0), _S.binary("*", _S.read(_v14, "ux"), 2)), _S.binary("-", _S.prop(_S.read(_v14, "B"), 1), _S.binary("*", _S.read(_v14, "uy"), 2)), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "v")), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "v")), _S.invoke(_S.read(_v14, "R"), "range", [0.12, 0.35])])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
		var _v15 = _S.scope(_v12)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 18)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "k", _S.invoke(_S.read(_v16, "R"), "range", [0.1, 1]))
			_S.define(_v16, "x", _S.binary("+", _S.prop(_S.read(_v16, "A"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v16, "B"), 0), _S.prop(_S.read(_v16, "A"), 0)), _S.read(_v16, "k"))))
			_S.define(_v16, "y", _S.binary("+", _S.prop(_S.read(_v16, "A"), 1), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v16, "B"), 1), _S.prop(_S.read(_v16, "A"), 1)), _S.read(_v16, "k"))))
			_S.define(_v16, "s", _S.invoke(_S.read(_v16, "R"), "sign", []))
			_S.define(_v16, "v", _S.invoke(_S.read(_v16, "R"), "range", [30, 100]))
			_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "MOTE"), _S.read(_v16, "x"), _S.read(_v16, "y"), _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v16, "s"), _S.read(_v16, "nx")), _S.read(_v16, "v")), _S.binary("*", _S.read(_v16, "ux"), 20)), _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_v16, "s"), _S.read(_v16, "ny")), _S.read(_v16, "v")), 10), _S.invoke(_S.read(_v16, "R"), "range", [0.25, 0.55]), (_S.prop(_S.read(_v16, "C"), 5) if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.5])) else _S.prop(_S.read(_v16, "C"), 4)), 0.6])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
		var _v17 = _S.scope(_v12)
		_S.define(_v17, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "i"), 5)):
			_S.invoke(_S.read(_v17, "lights"), "add", [_S.binary("+", _S.prop(_S.read(_v17, "A"), 0), _S.binary("/", _S.binary("*", _S.binary("-", _S.prop(_S.read(_v17, "B"), 0), _S.prop(_S.read(_v17, "A"), 0)), _S.binary("+", _S.read(_v17, "i"), 0.5)), 5)), _S.binary("+", _S.prop(_S.read(_v17, "A"), 1), _S.binary("/", _S.binary("*", _S.binary("-", _S.prop(_S.read(_v17, "B"), 1), _S.prop(_S.read(_v17, "A"), 1)), _S.binary("+", _S.read(_v17, "i"), 0.5)), 5)), 46, _S.prop(_S.read(_v17, "C"), 5), 0.45, 0.3])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "split")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SPLIT")))):
		var _v18 = _S.scope(_e)
		_S.write(_v18, "split", true, "=", false)
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), 46)):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "k", _S.invoke(_S.read(_v20, "R"), "range", [0, 1]))
			_S.define(_v20, "x", _S.binary("+", _S.prop(_S.read(_v20, "A"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v20, "B"), 0), _S.prop(_S.read(_v20, "A"), 0)), _S.read(_v20, "k"))))
			_S.define(_v20, "y", _S.binary("+", _S.prop(_S.read(_v20, "A"), 1), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v20, "B"), 1), _S.prop(_S.read(_v20, "A"), 1)), _S.read(_v20, "k"))))
			_S.define(_v20, "s", _S.invoke(_S.read(_v20, "R"), "sign", []))
			_S.define(_v20, "v", _S.invoke(_S.read(_v20, "R"), "range", [80, 320]))
			_S.define(_v20, "a", _S.binary("+", _S.invoke(_S.read(_v20, "Math"), "atan2", [_S.binary("*", _S.read(_v20, "s"), _S.read(_v20, "ny")), _S.binary("*", _S.read(_v20, "s"), _S.read(_v20, "nx"))]), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 0.7), 0.7])))
			_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "SPARK"), _S.read(_v20, "x"), _S.read(_v20, "y"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "v")), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "v")), _S.invoke(_S.read(_v20, "Math"), "min", [_S.invoke(_S.read(_v20, "R"), "range", [0.15, 0.45]), _S.binary("-", _S.read(_v20, "end"), _S.read(_v20, "t"))])])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 1, "+=", true)
		var _v21 = _S.scope(_v18)
		_S.define(_v21, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v21, "i"), 6)):
			_S.invoke(_S.read(_v21, "lights"), "add", [_S.binary("+", _S.prop(_S.read(_v21, "A"), 0), _S.binary("/", _S.binary("*", _S.binary("-", _S.prop(_S.read(_v21, "B"), 0), _S.prop(_S.read(_v21, "A"), 0)), _S.binary("+", _S.read(_v21, "i"), 0.5)), 6)), _S.binary("+", _S.prop(_S.read(_v21, "A"), 1), _S.binary("/", _S.binary("*", _S.binary("-", _S.prop(_S.read(_v21, "B"), 1), _S.prop(_S.read(_v21, "A"), 1)), _S.binary("+", _S.read(_v21, "i"), 0.5)), 6)), 56, _S.prop(_S.read(_v21, "C"), 5), 0.5, 0.35])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p0", _S.arg(_args, 0))
	_S.define(_e, "p", _S.call_value(_S.read(_e, "clipTo"), [_S.read(_e, "p0")]))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "CUT"), _S.read(_e, "CSW")), _S.read(_e, "CHOLD")), 0.02)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SLIP")))):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "e", _S.call_value(_S.read(_v22, "edgeAt"), [_S.read(_v22, "t")]))
		_S.define(_v22, "sp", _S.call_value(_S.read(_v22, "speedAt"), [_S.read(_v22, "t")]))
		_S.define(_v22, "Ls", _S.call_value(_S.read(_v22, "clamp"), [_S.binary("*", _S.read(_v22, "sp"), 0.0065), 1.5, 8]))
		_S.define(_v22, "echo", _S.binary("*", _S.call_value(_S.read(_v22, "clamp"), [_S.binary("/", _S.read(_v22, "sp"), 900)]), 0.6))
		var _v23 = _S.scope(_v22)
		_S.define(_v23, "y", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "y"), _S.read(_v23, "H"))):
			var _v24 = _S.scope(_v23)
			_S.define(_v24, "xe", _S.call_value(_S.read(_v24, "xAt"), [_S.read(_v24, "e"), _S.binary("+", _S.read(_v24, "y"), 0.5)]))
			_S.define(_v24, "ia", _S.call_value(_S.read(_v24, "clamp"), [_S.invoke(_S.read(_v24, "Math"), "floor", [_S.binary("-", _S.read(_v24, "xe"), _S.binary("/", _S.binary("+", _S.read(_v24, "Ls"), 10), _S.read(_v24, "CS")))]), 0, _S.read(_v24, "W")]))
			_S.define(_v24, "ib", _S.call_value(_S.read(_v24, "clamp"), [_S.invoke(_S.read(_v24, "Math"), "ceil", [_S.binary("+", _S.read(_v24, "xe"), _S.binary("/", _S.read(_v24, "HALO"), _S.read(_v24, "CS")))]), 0, _S.read(_v24, "W")]))
			if _S.truth(_S.binary(">", _S.read(_v24, "ia"), 0)):
				_S.call_value(_S.read(_v24, "rect"), [_S.read(_v24, "p0"), 0, _S.read(_v24, "y"), _S.read(_v24, "ia"), 1, _S.read(_v24, "ink")])
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "x", _S.read(_v25, "ia"))
			while _S.truth(_S.binary("<", _S.read(_v25, "x"), _S.read(_v25, "ib"))):
				var _v26 = _S.scope(_v25)
				_S.define(_v26, "d", _S.binary("*", _S.binary("-", _S.read(_v26, "xe"), _S.binary("+", _S.read(_v26, "x"), 0.5)), _S.read(_v26, "CS")))
				if _S.truth(_S.binary("<", _S.read(_v26, "d"), 0)):
					var _v27 = _S.scope(_v26)
					_S.define(_v27, "u", _S.binary("+", 1, _S.binary("/", _S.read(_v27, "d"), _S.read(_v27, "HALO"))))
					_S.invoke(_S.read(_v27, "p0"), "light", [_S.read(_v27, "x"), _S.read(_v27, "y"), _S.prop(_S.read(_v27, "C"), 5), _S.binary("*", _S.binary("*", 0.32, _S.read(_v27, "u")), _S.read(_v27, "u"))])
					if _S.truth(_S.binary(">", _S.read(_v27, "d"), _S.unary("-", 4))):
						_S.invoke(_S.read(_v27, "p0"), "light", [_S.read(_v27, "x"), _S.read(_v27, "y"), _S.read(_v27, "WHITE"), _S.binary("*", 0.3, _S.binary("**", _S.binary("+", 1, _S.binary("/", _S.read(_v27, "d"), 4)), 2))])
					_v25 = _S.iteration(_v25)
					_S.write(_v25, "x", 1, "+=", true)
					continue
				if _S.truth(_S.binary("<", _S.read(_v26, "d"), 1)):
					_S.invoke(_S.read(_v26, "p0"), "px", [_S.read(_v26, "x"), _S.read(_v26, "y"), _S.read(_v26, "WHITE")])
				else:
					if _S.truth(_S.binary("<", _S.read(_v26, "d"), 2)):
						_S.invoke(_S.read(_v26, "p0"), "px", [_S.read(_v26, "x"), _S.read(_v26, "y"), _S.prop(_S.read(_v26, "C"), 6)])
					else:
						var _v28 = _S.scope(_v26)
						_S.define(_v28, "q", _S.binary("/", _S.binary("-", _S.read(_v28, "d"), 2), _S.read(_v28, "Ls")))
						_S.invoke(_S.read(_v28, "p0"), "px", [_S.read(_v28, "x"), _S.read(_v28, "y"), (_S.prop(_S.read(_v28, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v28, "q"), 0.3)) else (_S.prop(_S.read(_v28, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v28, "q"), 0.55)) else (_S.prop(_S.read(_v28, "C"), 3) if _S.truth(_S.binary("<", _S.read(_v28, "q"), 0.8)) else (_S.prop(_S.read(_v28, "C"), 2) if _S.truth(_S.binary("<", _S.read(_v28, "q"), 1)) else _S.read(_v28, "ink")))))])
						if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v28, "echo"), 0), func(): return _S.binary("<", _S.invoke(_S.read(_v28, "Math"), "abs", [_S.binary("-", _S.binary("-", _S.read(_v28, "d"), _S.read(_v28, "Ls")), 7)]), 0.5)), func(): return _S.binary("===", _S.binary("%", _S.binary("+", _S.read(_v28, "x"), _S.read(_v28, "y")), 3), 0))):
							_S.invoke(_S.read(_v28, "p0"), "dot", [_S.read(_v28, "x"), _S.read(_v28, "y"), _S.prop(_S.read(_v28, "C"), 4), _S.read(_v28, "echo")])
				if _S.truth(_S.binary("<", _S.read(_v26, "d"), _S.binary("+", _S.read(_v26, "Ls"), 2))):
					_S.invoke(_S.read(_v26, "p0"), "light", [_S.read(_v26, "x"), _S.read(_v26, "y"), _S.prop(_S.read(_v26, "C"), 5), _S.binary("*", 0.3, _S.binary("-", 1, _S.binary("/", _S.read(_v26, "d"), _S.binary("+", _S.read(_v26, "Ls"), 2))))])
				_v25 = _S.iteration(_v25)
				_S.write(_v25, "x", 1, "+=", true)
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "y", 1, "+=", true)
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SLIP"))):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "heat", _S.binary("-", 1, _S.call_value(_S.read(_v29, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v29, "t"), _S.read(_v29, "CUT")), 0.05), 0.5)])))
		for _v30 in _S.array(_S.read(_v29, "halves")):
			var _v31 = _S.scope(_v29)
			_S.define(_v31, "hf", _v30)
			var _v32 = _S.scope(_v31)
			_S.define(_v32, "pl", _S.call_value(_S.read(_v32, "placeOf"), [_S.read(_v32, "hf")]))
			_S.define(_v32, "pts", _S.invoke(_S.prop(_S.read(_v32, "hf"), "pts"), "map", [_S.function_value(_v32, "_f7")]))
			_S.define(_v32, "a", _S.call_value(_S.read(_v32, "moved"), [_S.read(_v32, "hf"), _S.read(_v32, "pl"), _S.read(_v32, "A")]))
			_S.define(_v32, "b", _S.call_value(_S.read(_v32, "moved"), [_S.read(_v32, "hf"), _S.read(_v32, "pl"), _S.read(_v32, "B")]))
			_S.define(_v32, "c", _S.invoke(_S.read(_v32, "Math"), "cos", [_S.prop(_S.read(_v32, "pl"), "rot")]))
			_S.define(_v32, "sn", _S.invoke(_S.read(_v32, "Math"), "sin", [_S.prop(_S.read(_v32, "pl"), "rot")]))
			_S.define(_v32, "mx", _S.binary("*", _S.prop(_S.read(_v32, "hf"), "s"), _S.binary("-", _S.binary("*", _S.read(_v32, "nx"), _S.read(_v32, "c")), _S.binary("*", _S.read(_v32, "ny"), _S.read(_v32, "sn")))))
			_S.define(_v32, "my", _S.binary("*", _S.prop(_S.read(_v32, "hf"), "s"), _S.binary("+", _S.binary("*", _S.read(_v32, "nx"), _S.read(_v32, "sn")), _S.binary("*", _S.read(_v32, "ny"), _S.read(_v32, "c")))))
			_S.define(_v32, "rim", [(_S.read(_v32, "WHITE") if _S.truth(_S.binary(">", _S.read(_v32, "heat"), 0.55)) else (_S.prop(_S.read(_v32, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v32, "heat"), 0.25)) else _S.prop(_S.read(_v32, "C"), 5))), (_S.prop(_S.read(_v32, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v32, "heat"), 0.4)) else _S.prop(_S.read(_v32, "C"), 4)), (_S.prop(_S.read(_v32, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v32, "heat"), 0.3)) else _S.prop(_S.read(_v32, "C"), 3)), (_S.prop(_S.read(_v32, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v32, "heat"), 0.3)) else _S.read(_v32, "ink"))])
			_S.define(_v32, "deep", _S.call_value(_S.read(_v32, "clamp"), [_S.binary("+", 1, _S.binary("*", _S.prop(_S.read(_v32, "pl"), "sep"), 0.5)), 1, 4]))
			_S.call_value(_S.read(_v32, "fillConvex"), [_S.read(_v32, "p0"), _S.read(_v32, "pts"), _S.function_value(_v32, "_f8")])
			if _S.truth(_S.binary(">", _S.read(_v32, "heat"), 0)):
				var _v34 = _S.scope(_v32)
				_S.define(_v34, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v34, "i"), 8)):
					var _v35 = _S.scope(_v34)
					_S.define(_v35, "k", _S.binary("/", _S.binary("+", _S.read(_v35, "i"), 0.5), 8))
					_S.invoke(_S.read(_v35, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_v35, "a"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v35, "b"), 0), _S.prop(_S.read(_v35, "a"), 0)), _S.read(_v35, "k"))), _S.binary("+", _S.prop(_S.read(_v35, "a"), 1), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v35, "b"), 1), _S.prop(_S.read(_v35, "a"), 1)), _S.read(_v35, "k"))), _S.binary("+", 12, _S.binary("*", _S.prop(_S.read(_v35, "pl"), "sep"), 0.15)), _S.prop(_S.read(_v35, "C"), 5), _S.binary("*", 0.3, _S.read(_v35, "heat"))])
					_v34 = _S.iteration(_v34)
					_S.write(_v34, "i", 1, "+=", true)
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CUT")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "CSW"), _S.read(_e, "CHOLD")), _S.read(_e, "CTRAIL")), 0.25)))):
		var _v36 = _S.scope(_e)
		_S.define(_v36, "head", _S.binary("*", _S.read(_v36, "LC"), _S.invoke(_S.read(_v36, "ease"), "outExpo", [_S.call_value(_S.read(_v36, "clamp"), [_S.binary("/", _S.read(_v36, "u"), _S.read(_v36, "CSW"))])])))
		_S.define(_v36, "tail", _S.binary("*", _S.read(_v36, "LC"), _S.call_value(_S.read(_v36, "smooth"), [_S.binary("+", _S.read(_v36, "CSW"), _S.read(_v36, "CHOLD")), _S.binary("+", _S.binary("+", _S.read(_v36, "CSW"), _S.read(_v36, "CHOLD")), _S.read(_v36, "CTRAIL")), _S.read(_v36, "u")])))
		_S.define(_v36, "age", _S.call_value(_S.read(_v36, "clamp"), [_S.binary("/", _S.read(_v36, "u"), _S.binary("+", _S.binary("+", _S.read(_v36, "CSW"), _S.read(_v36, "CHOLD")), _S.read(_v36, "CTRAIL")))]))
		_S.define(_v36, "Wc", _S.binary("*", 3.6, _S.binary("-", 1, _S.binary("*", _S.binary("/", _S.read(_v36, "tail"), _S.read(_v36, "LC")), 0.55))))
		_S.define(_v36, "span", _S.binary("-", _S.read(_v36, "head"), _S.read(_v36, "tail")))
		_S.define(_v36, "sn", _S.invoke(_S.read(_v36, "Math"), "abs", [_S.read(_v36, "nx")]))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v36, "span"), 1), func(): return _S.binary("<", _S.read(_v36, "tail"), _S.binary("-", _S.read(_v36, "LC"), 1))), func(): return _S.binary("<", _S.read(_v36, "t"), _S.read(_v36, "SPLIT")))):
			var _v37 = _S.scope(_v36)
			_S.define(_v37, "y", 0)
			while _S.truth(_S.binary("<", _S.read(_v37, "y"), _S.read(_v37, "H"))):
				var _v38 = _S.scope(_v37)
				_S.define(_v38, "x0", _S.binary("+", _S.prop(_S.read(_v38, "A"), 0), _S.binary("/", _S.binary("*", _S.binary("-", _S.binary("+", _S.read(_v38, "y"), 0.5), _S.prop(_S.read(_v38, "A"), 1)), _S.read(_v38, "ux")), _S.read(_v38, "uy"))))
				_S.define(_v38, "hw", _S.binary("/", _S.binary("+", _S.read(_v38, "Wc"), 1), _S.read(_v38, "sn")))
				var _v39 = _S.scope(_v38)
				_S.define(_v39, "x", _S.invoke(_S.read(_v39, "Math"), "max", [0, _S.invoke(_S.read(_v39, "Math"), "floor", [_S.binary("-", _S.read(_v39, "x0"), _S.read(_v39, "hw"))])]))
				while _S.truth(_S.binary("<", _S.read(_v39, "x"), _S.invoke(_S.read(_v39, "Math"), "min", [_S.read(_v39, "W"), _S.invoke(_S.read(_v39, "Math"), "ceil", [_S.binary("+", _S.read(_v39, "x0"), _S.read(_v39, "hw"))])]))):
					var _v40 = _S.scope(_v39)
					_S.define(_v40, "px", _S.binary("-", _S.binary("+", _S.read(_v40, "x"), 0.5), _S.prop(_S.read(_v40, "A"), 0)))
					_S.define(_v40, "py", _S.binary("-", _S.binary("+", _S.read(_v40, "y"), 0.5), _S.prop(_S.read(_v40, "A"), 1)))
					_S.define(_v40, "s", _S.binary("+", _S.binary("*", _S.read(_v40, "px"), _S.read(_v40, "ux")), _S.binary("*", _S.read(_v40, "py"), _S.read(_v40, "uy"))))
					_S.define(_v40, "v", _S.binary("/", _S.binary("-", _S.read(_v40, "s"), _S.read(_v40, "tail")), _S.read(_v40, "span")))
					if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v40, "v"), 0), func(): return _S.binary(">", _S.read(_v40, "v"), 1))):
						_v39 = _S.iteration(_v39)
						_S.write(_v39, "x", 1, "+=", true)
						continue
					_S.define(_v40, "w", _S.binary("*", _S.read(_v40, "Wc"), _S.invoke(_S.read(_v40, "Math"), "pow", [_S.invoke(_S.read(_v40, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v40, "Math"), "PI"), _S.invoke(_S.read(_v40, "Math"), "pow", [_S.read(_v40, "v"), 2.2]))]), 0.6])))
					if _S.truth(_S.binary("<", _S.read(_v40, "w"), 0.35)):
						_v39 = _S.iteration(_v39)
						_S.write(_v39, "x", 1, "+=", true)
						continue
					_S.define(_v40, "q", _S.binary("/", _S.invoke(_S.read(_v40, "Math"), "abs", [_S.binary("+", _S.binary("*", _S.read(_v40, "px"), _S.read(_v40, "nx")), _S.binary("*", _S.read(_v40, "py"), _S.read(_v40, "ny")))]), _S.read(_v40, "w")))
					if _S.truth(_S.binary(">", _S.read(_v40, "q"), 1)):
						_v39 = _S.iteration(_v39)
						_S.write(_v39, "x", 1, "+=", true)
						continue
					_S.define(_v40, "ci", (0 if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v40, "q"), 0.34), func(): return _S.binary("<", _S.read(_v40, "age"), 0.5))) else _S.invoke(_S.read(_v40, "Math"), "round", [_S.binary("+", _S.binary("-", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v40, "q"), _S.binary("-", _S.read(_v40, "n"), 1)), 0.75), _S.binary("*", _S.read(_v40, "age"), 2.4)), _S.binary("*", _S.read(_v40, "v"), 0.8)), 0.4)])))
					_S.invoke(_S.read(_v40, "p0"), "dot", [_S.read(_v40, "x"), _S.read(_v40, "y"), _S.prop(_S.read(_v40, "C"), _S.binary("-", _S.binary("-", _S.read(_v40, "n"), 1), _S.call_value(_S.read(_v40, "clamp"), [_S.read(_v40, "ci"), 0, _S.binary("-", _S.read(_v40, "n"), 1)]))), _S.invoke(_S.read(_v40, "Math"), "min", [1, _S.binary("/", _S.read(_v40, "v"), 0.4)])])
					if _S.truth(_S.binary("<", _S.read(_v40, "q"), 0.5)):
						_S.invoke(_S.read(_v40, "p0"), "light", [_S.read(_v40, "x"), _S.read(_v40, "y"), _S.prop(_S.read(_v40, "C"), 5), _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_v40, "age")))])
					_v39 = _S.iteration(_v39)
					_S.write(_v39, "x", 1, "+=", true)
				_v37 = _S.iteration(_v37)
				_S.write(_v37, "y", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v36, "tail"), 2), func(): return _S.binary("<", _S.read(_v36, "t"), _S.read(_v36, "SPLIT")))):
			var _v41 = _S.scope(_v36)
			_S.define(_v41, "s", 0)
			while _S.truth(_S.binary("<", _S.read(_v41, "s"), _S.read(_v41, "tail"))):
				_S.invoke(_S.read(_v41, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v41, "A"), 0), _S.binary("*", _S.read(_v41, "ux"), _S.read(_v41, "s"))), _S.binary("+", _S.prop(_S.read(_v41, "A"), 1), _S.binary("*", _S.read(_v41, "uy"), _S.read(_v41, "s"))), _S.prop(_S.read(_v41, "C"), 5), _S.binary("*", 0.7, _S.binary("+", 0.4, _S.binary("/", _S.binary("*", 0.6, _S.read(_v41, "s")), _S.read(_v41, "LC"))))])
				_v41 = _S.iteration(_v41)
				_S.write(_v41, "s", 1.6, "+=", false)
		if _S.truth(_S.binary("<", _S.read(_v36, "u"), 0.3)):
			var _v42 = _S.scope(_v36)
			_S.define(_v42, "hx", _S.binary("+", _S.prop(_S.read(_v42, "A"), 0), _S.binary("*", _S.read(_v42, "ux"), _S.read(_v42, "head"))))
			_S.define(_v42, "hy", _S.binary("+", _S.prop(_S.read(_v42, "A"), 1), _S.binary("*", _S.read(_v42, "uy"), _S.read(_v42, "head"))))
			_S.invoke(_S.read(_v42, "p"), "glow", [_S.read(_v42, "hx"), _S.read(_v42, "hy"), 46, _S.prop(_S.read(_v42, "C"), 4), _S.binary("*", 0.55, _S.binary("-", 1, _S.binary("/", _S.read(_v42, "u"), 0.3)))])
		_S.define(_v36, "g", _S.binary("-", _S.read(_v36, "u"), _S.binary("*", _S.read(_v36, "CSW"), 0.6)))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v36, "g"), 0), func(): return _S.binary("<", _S.read(_v36, "g"), 0.24))):
			_S.call_value(_S.read(_v36, "sparkle"), [_S.read(_v36, "p"), _S.binary("-", _S.prop(_S.read(_v36, "B"), 0), _S.binary("*", _S.read(_v36, "ux"), 3)), _S.binary("-", _S.prop(_S.read(_v36, "B"), 1), _S.binary("*", _S.read(_v36, "uy"), 3)), _S.binary("*", _S.binary("*", 11, _S.invoke(_S.read(_v36, "ease"), "outBack", [_S.invoke(_S.read(_v36, "Math"), "min", [1, _S.binary("/", _S.read(_v36, "g"), 0.05)])])), _S.binary("-", 1, _S.binary("/", _S.read(_v36, "g"), 0.24))), _S.prop(_S.read(_v36, "C"), 6), _S.prop(_S.read(_v36, "C"), 4), 0.7])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "moved"), [_S.read(_e, "hf"), _S.read(_e, "pl"), _S.read(_e, "q")])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "a"), 0)), _S.read(_e, "mx")), _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "a"), 1)), _S.read(_e, "my"))))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), _S.read(_e, "deep"))):
		var _v33 = _S.scope(_e)
		if _S.truth(_S.binary("<", _S.read(_v33, "d"), 2)):
			_S.invoke(_S.read(_v33, "p0"), "light", [_S.read(_v33, "x"), _S.read(_v33, "y"), _S.prop(_S.read(_v33, "C"), 5), _S.binary("*", _S.binary("*", 0.4, _S.read(_v33, "heat")), _S.binary("-", 1, _S.binary("/", _S.read(_v33, "d"), 2)))])
		return _S.prop(_S.read(_v33, "rim"), _S.invoke(_S.read(_v33, "Math"), "max", [0, _S.invoke(_S.read(_v33, "Math"), "floor", [_S.read(_v33, "d")])]))
	return _S.read(_e, "ink")

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", _S.read(_e, "E0"), _S.binary("*", _S.binary("-", _S.read(_e, "E1"), _S.read(_e, "E0")), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "T0")), _S.read(_e, "SWEEP"))])])))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (0 if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T0")), func(): return _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "T0"), _S.read(_e, "SWEEP"))))) else _S.binary("/", _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_e, "E1"), _S.read(_e, "E0")), 3), _S.binary("**", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "T0")), _S.read(_e, "SWEEP"))), 2)), _S.read(_e, "SWEEP")))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "e", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.binary("+", _S.read(_e, "e"), _S.binary("*", _S.binary("-", _S.binary("/", _S.read(_e, "H"), 2), _S.read(_e, "y")), _S.read(_e, "SL")))
