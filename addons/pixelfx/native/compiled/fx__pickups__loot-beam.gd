@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/loot-beam.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "pool", _S.import_value("fx/pickups/_lib.js", "pool"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "sword", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f6"))
	_S.define(_e, "ring", _S.function_value(_e, "_f7"))
	_S.define(_e, "column", _S.function_value(_e, "_f9"))
	_S.define(_e, "motes", _S.function_value(_e, "_f10"))
	_S.define(_e, "meta", _S.merge([{"name": "Loot beam"}, {"desc": "A dropped sword in a tall pillar of rarity light: a white core thinning to the sky, rings pulsing across the floor, motes streaming up, a glint racing up the shaft."}, {"tags": ["pickup", "loot", "beam", "rarity", "drop", "item", "loop"]}, {"size": [96, 176]}, {"origin": [48, 162]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#140a24", "#2c1250", "#4b1d86", "#7330c0", "#a050f0", "#c890ff", "#ecd4ff", "#ffffff"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "H", 150)
	_S.define(_e, "RINGS", [0.08, 0.58])
	_S.define(_e, "STEEL", _S.invoke(["#151726", "#2c3149", "#4f5775", "#8a93b3", "#d6dcef", "#ffffff"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "GOLD", _S.invoke(["#3a2008", "#7a4a10", "#b8801c", "#e8b432", "#ffe27a", "#fff6cc"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "LEATHER", _S.invoke(["#1e0f0e", "#3e2016", "#633620"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "INK", _S.call_value(_S.read(_e, "hex"), ["#0d0b14"]))
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [40, 24]))
	_S.define(_e, "since", _S.function_value(_e, "_f13"))
	_S.define(_e, "OX", 4)
	_S.define(_e, "axis", _S.function_value(_e, "_f14"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "edgeLit", _S.function_value(_e, "_f1"))
	_S.invoke(_S.read(_e, "L"), "begin", [_S.unary("-", 16), _S.unary("-", 12)])
	_S.set_prop(_S.read(_e, "L"), "set", _S.call_value(_S.function_value(_e, "_f2"), [_S.prop(_S.invoke(_S.read(_e, "Object"), "getPrototypeOf", [_S.read(_e, "L")]), "set")]), "=", false)
	var _v0 = _S.scope(_e)
	_S.define(_v0, "x", _S.unary("-", 11))
	while _S.truth(_S.binary("<=", _S.read(_v0, "x"), 10)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.call_value(_S.read(_v1, "axis"), [_S.read(_v1, "x")]))
		if _S.truth(_S.binary("<=", _S.read(_v1, "x"), _S.unary("-", 9))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "m", _S.binary("+", _S.read(_v2, "x"), 10))
			if _S.truth(_S.binary("===", _S.read(_v2, "m"), 0)):
				_S.last([_S.invoke(_S.read(_v2, "L"), "set", [_S.read(_v2, "x"), _S.binary("-", _S.read(_v2, "a"), 1), _S.prop(_S.read(_v2, "C"), 6)]), _S.invoke(_S.read(_v2, "L"), "set", [_S.read(_v2, "x"), _S.read(_v2, "a"), _S.read(_v2, "WHITE")]), _S.invoke(_S.read(_v2, "L"), "set", [_S.read(_v2, "x"), _S.binary("+", _S.read(_v2, "a"), 1), _S.prop(_S.read(_v2, "C"), 4)])])
			else:
				_S.invoke(_S.read(_v2, "L"), "set", [_S.read(_v2, "x"), _S.read(_v2, "a"), (_S.prop(_S.read(_v2, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v2, "m"), 0)) else _S.prop(_S.read(_v2, "C"), 3))])
		else:
			if _S.truth(_S.binary("<=", _S.read(_v1, "x"), _S.unary("-", 5))):
				var _v3 = _S.scope(_v1)
				_S.invoke(_S.read(_v3, "L"), "set", [_S.read(_v3, "x"), _S.read(_v3, "a"), _S.prop(_S.read(_v3, "LEATHER"), (2 if _S.truth(_S.binary("%", _S.read(_v3, "x"), 2)) else 1))])
				_S.invoke(_S.read(_v3, "L"), "set", [_S.read(_v3, "x"), _S.binary("+", _S.read(_v3, "a"), 1), _S.prop(_S.read(_v3, "LEATHER"), (1 if _S.truth(_S.binary("%", _S.read(_v3, "x"), 2)) else 0))])
			else:
				if _S.truth(_S.binary("<=", _S.read(_v1, "x"), _S.unary("-", 3))):
					var _v4 = _S.scope(_v1)
					var _v5 = _S.scope(_v4)
					_S.define(_v5, "y", _S.binary("-", _S.read(_v5, "a"), 3))
					while _S.truth(_S.binary("<=", _S.read(_v5, "y"), _S.binary("+", _S.read(_v5, "a"), 3))):
						var _v6 = _S.scope(_v5)
						_S.define(_v6, "end", _S.logical("||", _S.binary("===", _S.read(_v6, "y"), _S.binary("-", _S.read(_v6, "a"), 3)), func(): return _S.binary("===", _S.read(_v6, "y"), _S.binary("+", _S.read(_v6, "a"), 3))))
						_S.invoke(_S.read(_v6, "L"), "set", [_S.read(_v6, "x"), _S.read(_v6, "y"), ((_S.prop(_S.read(_v6, "C"), 6) if _S.truth(_S.binary("===", _S.read(_v6, "x"), _S.unary("-", 4))) else _S.prop(_S.read(_v6, "C"), 4)) if _S.truth(_S.binary("===", _S.read(_v6, "y"), _S.read(_v6, "a"))) else ((_S.prop(_S.read(_v6, "GOLD"), 3) if _S.truth(_S.read(_v6, "end")) else _S.call_value(_S.read(_v6, "mix"), [_S.prop(_S.read(_v6, "GOLD"), 4), _S.prop(_S.read(_v6, "C"), 6), 0.3])) if _S.truth(_S.binary("===", _S.read(_v6, "x"), _S.unary("-", 4))) else (_S.prop(_S.read(_v6, "GOLD"), 0) if _S.truth(_S.read(_v6, "end")) else _S.prop(_S.read(_v6, "GOLD"), 1))))])
						_v5 = _S.iteration(_v5)
						_S.write(_v5, "y", 1, "+=", true)
				else:
					var _v7 = _S.scope(_v1)
					_S.define(_v7, "tip", _S.binary("-", _S.read(_v7, "x"), 8))
					if _S.truth(_S.binary("<", _S.read(_v7, "tip"), 1)):
						_S.invoke(_S.read(_v7, "L"), "set", [_S.read(_v7, "x"), _S.binary("-", _S.read(_v7, "a"), 1), _S.call_value(_S.read(_v7, "edgeLit"), [_S.read(_v7, "x")])])
					if _S.truth(_S.binary("<", _S.read(_v7, "tip"), 2)):
						_S.invoke(_S.read(_v7, "L"), "set", [_S.read(_v7, "x"), _S.read(_v7, "a"), (_S.call_value(_S.read(_v7, "edgeLit"), [_S.read(_v7, "x")]) if _S.truth(_S.binary("===", _S.read(_v7, "tip"), 1)) else _S.call_value(_S.read(_v7, "mix"), [_S.prop(_S.read(_v7, "STEEL"), 3), _S.prop(_S.read(_v7, "C"), 4), 0.2]))])
					_S.invoke(_S.read(_v7, "L"), "set", [_S.read(_v7, "x"), _S.binary("+", _S.read(_v7, "a"), 1), (_S.prop(_S.read(_v7, "STEEL"), 2) if _S.truth(_S.binary("===", _S.read(_v7, "tip"), 2)) else _S.prop(_S.read(_v7, "STEEL"), 0))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "x", 1, "+=", true)
	_S.delete_prop(_S.read(_e, "L"), "set")
	_S.invoke(_S.invoke(_S.read(_e, "L"), "outline", [_S.read(_e, "INK")]), "draw", [_S.read(_e, "p")])
	_S.define(_e, "g", _S.binary("/", _S.binary("-", _S.read(_e, "ph"), 0.72), 0.16))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "g"), 0), func(): return _S.binary("<", _S.read(_e, "g"), 1))):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "x", _S.binary("+", _S.unary("-", 1), _S.binary("*", 9, _S.invoke(_S.read(_v8, "ease"), "inOutSine", [_S.read(_v8, "g")]))))
		_S.call_value(_S.read(_v8, "glint"), [_S.read(_v8, "p"), _S.binary("+", _S.read(_v8, "x"), _S.read(_v8, "OX")), _S.binary("-", _S.call_value(_S.read(_v8, "axis"), [_S.invoke(_S.read(_v8, "Math"), "round", [_S.read(_v8, "x")])]), 1), _S.binary("*", 2.6, _S.invoke(_S.read(_v8, "Math"), "sin", [_S.binary("*", _S.read(_v8, "g"), _S.prop(_S.read(_v8, "Math"), "PI"))])), _S.read(_v8, "WHITE"), 0.5])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "OX")), 0.5)]), 6)) else _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "STEEL"), 4), _S.prop(_S.read(_e, "C"), 6), 0.45]))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "set", _S.arg(_args, 0))
	return _S.function_value(_e, "_f3")

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	return _S.invoke(_S.read(_e, "set"), "call", [_S.read(_e, "L"), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "OX")), _S.read(_e, "y"), _S.read(_e, "c")])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "T", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")))
	_S.call_value(_S.read(_e, "pool"), [_S.read(_e, "p"), 0.5, 0, 34, 5, _S.prop(_S.read(_e, "C"), 4), 0.14])
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 30), _S.unary("-", 0.5), 31, 6, _S.function_value(_e, "_f5")])
	var _v9 = _S.scope(_e)
	_S.define(_v9, "x", _S.unary("-", 16))
	while _S.truth(_S.binary("<=", _S.read(_v9, "x"), 16)):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "q", _S.binary("/", _S.invoke(_S.read(_v10, "Math"), "abs", [_S.read(_v10, "x")]), 16.5))
		_S.define(_v10, "a", _S.binary("-", 1.35, _S.binary("*", _S.read(_v10, "q"), 1.25)))
		_S.invoke(_S.read(_v10, "p"), "dot", [_S.read(_v10, "x"), 0, (_S.read(_v10, "WHITE") if _S.truth(_S.binary("<", _S.read(_v10, "q"), 0.3)) else (_S.prop(_S.read(_v10, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v10, "q"), 0.6)) else _S.prop(_S.read(_v10, "C"), 5))), _S.read(_v10, "a")])
		if _S.truth(_S.binary("<", _S.read(_v10, "q"), 0.75)):
			_S.invoke(_S.read(_v10, "p"), "dot", [_S.read(_v10, "x"), 1, (_S.prop(_S.read(_v10, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v10, "q"), 0.3)) else (_S.prop(_S.read(_v10, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v10, "q"), 0.55)) else _S.prop(_S.read(_v10, "C"), 4))), _S.binary("*", _S.read(_v10, "a"), 0.8)])
		if _S.truth(_S.binary("<", _S.read(_v10, "q"), 0.4)):
			_S.invoke(_S.read(_v10, "p"), "dot", [_S.read(_v10, "x"), 2, _S.prop(_S.read(_v10, "C"), 4), _S.binary("*", _S.read(_v10, "a"), 0.5)])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "x", 1, "+=", true)
	var _v11 = _S.scope(_e)
	_S.define(_v11, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "k"), _S.prop(_S.read(_v11, "RINGS"), "length"))):
		_S.call_value(_S.read(_v11, "ring"), [_S.read(_v11, "p"), _S.read(_v11, "C"), _S.binary("*", _S.call_value(_S.read(_v11, "since"), [_S.read(_v11, "ph"), _S.read(_v11, "k")]), _S.read(_v11, "T")), true])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "k", 1, "+=", true)
	_S.call_value(_S.read(_e, "column"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "T")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "x"), 0.5), 30))
	_S.define(_e, "dy", _S.binary("/", _S.read(_e, "y"), 6))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy"))))
	if _S.truth(_S.binary(">=", _S.read(_e, "d"), 1)):
		return null
	_S.set_prop(_S.read(_e, "out"), "l", _S.prop(_S.read(_e, "C"), 5), "=", false)
	_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", 0.4, _S.binary("**", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "d")])), 2)), "=", false)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "T", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")))
	_S.call_value(_S.read(_e, "blobShadow"), [_S.read(_e, "p"), _S.binary("-", _S.read(_e, "OX"), 0.5), 12.5, 0.95])
	_S.call_value(_S.read(_e, "sword"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "ph")])
	var _v12 = _S.scope(_e)
	_S.define(_v12, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "k"), _S.prop(_S.read(_v12, "RINGS"), "length"))):
		_S.call_value(_S.read(_v12, "ring"), [_S.read(_v12, "p"), _S.read(_v12, "C"), _S.binary("*", _S.call_value(_S.read(_v12, "since"), [_S.read(_v12, "ph"), _S.read(_v12, "k")]), _S.read(_v12, "T")), false])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "k", 1, "+=", true)
	_S.call_value(_S.read(_e, "motes"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "T"), _S.prop(_S.read(_e, "o"), "seed")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "a", _S.arg(_args, 2))
	_S.define(_e, "back", _S.arg(_args, 3))
	_S.define(_e, "L1", 1.1)
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "a"), _S.read(_e, "L1")))
	if _S.truth(_S.binary(">=", _S.read(_e, "k"), 1)):
		return null
	_S.define(_e, "r", _S.binary("+", 3, _S.binary("*", 24, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 3.2, _S.binary("-", 1, _S.read(_e, "k")))]))
	_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0.5, 0, _S.read(_e, "r"), 0.2, _S.read(_e, "th"), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", 1.25, _S.binary("-", 1, _S.read(_e, "k")))]), [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)], _S.function_value(_e, "_f8"), _S.binary("<", _S.read(_e, "k"), 0.12)])
	if _S.truth(_S.unary("!", _S.read(_e, "back"))):
		for _v13 in _S.array([_S.unary("-", 1), 1]):
			var _v14 = _S.scope(_e)
			_S.define(_v14, "s", _v13)
			_S.invoke(_S.read(_v14, "p"), "glow", [_S.binary("+", 0.5, _S.binary("*", _S.read(_v14, "s"), _S.read(_v14, "r"))), _S.unary("-", 1), 8, _S.prop(_S.read(_v14, "C"), 5), _S.binary("*", 0.35, _S.binary("-", 1, _S.read(_v14, "k")))])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("===", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "back"))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "T", _S.arg(_args, 3))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")))
	_S.define(_e, "beat", 0)
	var _v15 = _S.scope(_e)
	_S.define(_v15, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v15, "k"), _S.prop(_S.read(_v15, "RINGS"), "length"))):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "s", _S.binary("*", _S.call_value(_S.read(_v16, "since"), [_S.read(_v16, "ph"), _S.read(_v16, "k")]), _S.read(_v16, "T")))
		_S.write(_v16, "beat", _S.invoke(_S.read(_v16, "Math"), "max", [_S.read(_v16, "beat"), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_v16, "s")), 7)]), (1 if _S.truth(_S.binary("<", _S.read(_v16, "s"), 0.5)) else 0)), _S.invoke(_S.read(_v16, "Math"), "exp", [_S.unary("-", _S.binary("*", _S.binary("-", _S.read(_v16, "T"), _S.read(_v16, "s")), 30))])]), "=", false)
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "k", 1, "+=", true)
	_S.define(_e, "gq", _S.binary("/", _S.binary("-", _S.read(_e, "ph"), 0.22), 0.42))
	_S.define(_e, "gh", (_S.binary("+", 4, _S.binary("*", _S.binary("-", _S.read(_e, "H"), 4), _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.read(_e, "gq")]))) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "gq"), 0), func(): return _S.binary("<", _S.read(_e, "gq"), 1))) else _S.unary("-", 100)))
	_S.define(_e, "shimmer", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "ph"), 24)]))
	var _v17 = _S.scope(_e)
	_S.define(_v17, "y", _S.unary("-", 1))
	while _S.truth(_S.binary(">=", _S.read(_v17, "y"), _S.unary("-", _S.read(_v17, "H")))):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "h", _S.binary("-", _S.unary("-", _S.read(_v18, "y")), 0.5))
		_S.define(_v18, "u", _S.binary("/", _S.read(_v18, "h"), _S.read(_v18, "H")))
		_S.define(_v18, "fade", _S.binary("-", 1, _S.call_value(_S.read(_v18, "smooth"), [0.25, 1, _S.read(_v18, "u")])))
		_S.define(_v18, "w", _S.binary("*", _S.binary("+", _S.binary("*", 4.2, _S.binary("-", 1, _S.binary("*", 0.45, _S.read(_v18, "u")))), _S.binary("*", 3.2, _S.invoke(_S.read(_v18, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_v18, "h")), 7)]))), _S.binary("+", 1, _S.binary("*", 0.2, _S.read(_v18, "beat")))))
		_S.define(_v18, "seg", _S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("+", _S.binary("/", _S.read(_v18, "h"), 3), _S.binary("*", _S.call_value(_S.read(_v18, "rand"), [_S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("/", _S.read(_v18, "h"), 9)]), 5]), 2))]))
		_S.define(_v18, "flick", _S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("*", _S.read(_v18, "ph"), 12)]))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v18, "u"), 0.66), func(): return _S.binary(">", _S.call_value(_S.read(_v18, "rand"), [_S.read(_v18, "seg"), _S.read(_v18, "flick"), 7]), _S.binary("-", 1.75, _S.binary("*", _S.read(_v18, "u"), 1.65))))):
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "y", 1, "-=", true)
			continue
		_S.define(_v18, "thread", _S.logical("&&", _S.binary(">", _S.read(_v18, "u"), 0.58), func(): return _S.binary("<", _S.call_value(_S.read(_v18, "rand"), [_S.read(_v18, "seg"), _S.read(_v18, "flick"), 9]), _S.binary("*", _S.binary("-", _S.read(_v18, "u"), 0.58), 3))))
		_S.define(_v18, "climb", (1 if _S.truth(_S.binary("<", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("/", _S.read(_v18, "h"), 30), _S.binary("*", _S.read(_v18, "ph"), 3)), 1), 1), 1), 0.1)) else 0))
		_S.define(_v18, "trail", (_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v18, "gh"), _S.read(_v18, "h")), 18)) if _S.truth(_S.logical("&&", _S.binary(">", _S.binary("-", _S.read(_v18, "gh"), _S.read(_v18, "h")), 0), func(): return _S.binary("<", _S.binary("-", _S.read(_v18, "gh"), _S.read(_v18, "h")), 18))) else 0))
		_S.define(_v18, "X", (0 if _S.truth(_S.read(_v18, "thread")) else _S.invoke(_S.read(_v18, "Math"), "ceil", [_S.binary("*", _S.read(_v18, "w"), 1.6)])))
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "x", _S.unary("-", _S.read(_v19, "X")))
		while _S.truth(_S.binary("<=", _S.read(_v19, "x"), _S.read(_v19, "X"))):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "q", _S.binary("/", _S.invoke(_S.read(_v20, "Math"), "abs", [_S.read(_v20, "x")]), _S.read(_v20, "w")))
			_S.define(_v20, "cw", _S.binary("+", 0.2, _S.binary("*", 0.18, _S.binary("-", 1, _S.call_value(_S.read(_v20, "smooth"), [0, 0.5, _S.read(_v20, "u")])))))
			_S.define(_v20, "lvl", (0 if _S.truth(_S.binary("<", _S.read(_v20, "q"), _S.read(_v20, "cw"))) else (1 if _S.truth(_S.binary("<", _S.read(_v20, "q"), 0.47)) else (2 if _S.truth(_S.binary("<", _S.read(_v20, "q"), 0.72)) else (3 if _S.truth(_S.binary("<", _S.read(_v20, "q"), 1)) else 4)))))
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "s", 0)
			while _S.truth(_S.binary("<", _S.read(_v21, "s"), 3)):
				var _v22 = _S.scope(_v21)
				_S.define(_v22, "sx", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_v22, "s"), 1), _S.read(_v22, "w")), 0.55), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v22, "h"), 0.09), _S.binary("*", _S.binary("*", _S.read(_v22, "ph"), _S.read(_v22, "TAU")), _S.binary("+", _S.read(_v22, "s"), 1))), _S.binary("*", _S.read(_v22, "s"), 2))]), 0.9)))
				if _S.truth(_S.binary("<", _S.invoke(_S.read(_v22, "Math"), "abs", [_S.binary("-", _S.read(_v22, "x"), _S.read(_v22, "sx"))]), 0.5)):
					_S.write(_v22, "lvl", _S.invoke(_S.read(_v22, "Math"), "max", [0, _S.binary("-", _S.read(_v22, "lvl"), 1)]), "=", false)
				_v21 = _S.iteration(_v21)
				_S.write(_v21, "s", 1, "+=", true)
			if _S.truth(_S.logical("&&", _S.binary("<", _S.call_value(_S.read(_v20, "rand"), [_S.read(_v20, "y"), _S.read(_v20, "shimmer"), 3]), 0.05), func(): return _S.binary(">", _S.read(_v20, "lvl"), 0))):
				_S.write(_v20, "lvl", 1, "-=", true)
			if _S.truth(_S.binary("<", _S.read(_v20, "q"), 0.72)):
				_S.write(_v20, "lvl", _S.invoke(_S.read(_v20, "Math"), "max", [0, _S.binary("-", _S.binary("-", _S.read(_v20, "lvl"), _S.read(_v20, "climb")), (1 if _S.truth(_S.binary(">", _S.read(_v20, "trail"), 0.3)) else 0))]), "=", false)
			_S.define(_v20, "a", (1 if _S.truth(_S.binary("<=", _S.read(_v20, "lvl"), 2)) else _S.binary("*", _S.binary("*", _S.binary("/", _S.binary("-", 1.55, _S.read(_v20, "q")), 0.75), _S.read(_v20, "fade")), 1.2)))
			if _S.truth(_S.binary("<=", _S.read(_v20, "a"), 0)):
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "x", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v20, "p"), "dot", [_S.read(_v20, "x"), _S.read(_v20, "y"), ((_S.prop(_S.read(_v20, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v20, "u"), 0.85)) else _S.read(_v20, "WHITE")) if _S.truth(_S.read(_v20, "thread")) else ((_S.prop(_S.read(_v20, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v20, "u"), 0.8)) else _S.read(_v20, "WHITE")) if _S.truth(_S.binary("===", _S.read(_v20, "lvl"), 0)) else _S.prop(_S.read(_v20, "C"), _S.binary("-", 7, _S.read(_v20, "lvl"))))), _S.read(_v20, "a")])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "x", 1, "+=", true)
		_S.define(_v18, "near", _S.call_value(_S.read(_v18, "smooth"), [8, 20, _S.read(_v18, "h")]))
		if _S.truth(_S.binary("===", _S.binary("&", _S.read(_v18, "y"), 3), 0)):
			_S.invoke(_S.read(_v18, "p"), "glow", [0.5, _S.read(_v18, "y"), _S.binary("+", _S.binary("*", _S.read(_v18, "w"), 2.6), 6), _S.prop(_S.read(_v18, "C"), 5), _S.binary("*", _S.binary("*", _S.binary("*", 0.36, _S.read(_v18, "near")), _S.binary("+", 0.3, _S.binary("*", 0.7, _S.read(_v18, "fade")))), _S.binary("+", 1, _S.binary("*", 0.4, _S.read(_v18, "beat"))))])
		if _S.truth(_S.binary("===", _S.binary("&", _S.read(_v18, "y"), 15), 0)):
			_S.invoke(_S.read(_v18, "p"), "glow", [0.5, _S.read(_v18, "y"), 34, _S.prop(_S.read(_v18, "C"), 4), _S.binary("*", _S.binary("*", 0.2, _S.read(_v18, "near")), _S.binary("+", 0.25, _S.binary("*", 0.75, _S.read(_v18, "fade"))))])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "y", 1, "-=", true)
	if _S.truth(_S.binary(">", _S.read(_e, "gh"), 0)):
		var _v23 = _S.scope(_e)
		_S.call_value(_S.read(_v23, "glint"), [_S.read(_v23, "p"), 0, _S.unary("-", _S.read(_v23, "gh")), _S.binary("*", 3.5, _S.binary("-", 1, _S.binary("*", _S.read(_v23, "gq"), 0.5))), _S.prop(_S.read(_v23, "C"), 6), 0.6])
		_S.invoke(_S.read(_v23, "p"), "glow", [0.5, _S.unary("-", _S.read(_v23, "gh")), 14, _S.prop(_S.read(_v23, "C"), 5), 0.45])
	_S.call_value(_S.read(_e, "flare"), [_S.read(_e, "p"), 0.5, _S.unary("-", 5), _S.binary("+", _S.binary("+", 8, _S.binary("*", 3, _S.read(_e, "beat"))), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 4)]), 0.8)), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_e, "beat"))), _S.read(_e, "C")])
	_S.invoke(_S.read(_e, "p"), "glow", [0.5, _S.unary("-", 16), 16, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.12, _S.binary("*", 0.25, _S.read(_e, "beat")))])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "T", _S.arg(_args, 3))
	_S.define(_e, "seed", _S.arg(_args, 4))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "T"), 30, _S.read(_e, "seed"), _S.function_value(_e, "_f11"), _S.function_value(_e, "_f12")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [1, 2.2])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "inner", _S.invoke(_S.read(_e, "r"), "chance", [0.3]))
	_S.define(_e, "side", _S.invoke(_S.read(_e, "r"), "sign", []))
	_S.define(_e, "x0", (_S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 3), 3]) if _S.truth(_S.read(_e, "inner")) else _S.binary("*", _S.read(_e, "side"), _S.invoke(_S.read(_e, "r"), "range", [4, 15]))))
	_S.define(_e, "vy", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [22, 52]), (1.5 if _S.truth(_S.read(_e, "inner")) else 1)))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [1.5, 3.5])), _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))]), 1.6)))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [1, 10])), _S.binary("*", _S.read(_e, "vy"), _S.read(_e, "age"))))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "age"), 0.25), _S.binary("/", _S.binary("-", _S.read(_e, "life"), _S.read(_e, "age")), 0.5)]))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "y"), _S.unary("-", _S.read(_e, "H"))))):
		return null
	if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.22])):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "tw", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v24, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v24, "age"), _S.invoke(_S.read(_v24, "r"), "range", [9, 14])), _S.invoke(_S.read(_v24, "r"), "range", [0, _S.read(_v24, "TAU")]))]))))
		if _S.truth(_S.binary(">", _S.binary("*", _S.read(_v24, "tw"), _S.read(_v24, "k")), 0.3)):
			_S.call_value(_S.read(_v24, "glint"), [_S.read(_v24, "p"), _S.read(_v24, "x"), _S.read(_v24, "y"), (2 if _S.truth(_S.binary(">", _S.read(_v24, "tw"), 0.75)) else 1), _S.prop(_S.read(_v24, "C"), 6), _S.binary("*", 0.4, _S.read(_v24, "k"))])
		return null
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.read(_e, "inner")) else _S.prop(_S.read(_e, "C"), 6)), _S.binary("*", _S.read(_e, "k"), 1.5)])
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.read(_e, "inner")) else _S.prop(_S.read(_e, "C"), 4)), _S.read(_e, "k")])
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 2), _S.prop(_S.read(_e, "C"), 3), _S.binary("*", _S.read(_e, "k"), 0.6)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.read(_e, "x"), 0.5), _S.binary("+", _S.read(_e, "y"), 0.5), 3.5, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.35, _S.read(_e, "k"))])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ph", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	return _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "ph"), _S.prop(_S.read(_e, "RINGS"), _S.read(_e, "k"))), 1), 1), 1)

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("+", _S.unary("-", 4), _S.binary("/", _S.binary("+", _S.read(_e, "x"), 4), 7)), 0.5)])
