@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/butterfly.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "flapping", _S.function_value(_e, "_f0"))
	_S.define(_e, "fold", _S.function_value(_e, "_f1"))
	_S.define(_e, "at", _S.function_value(_e, "_f2"))
	_S.define(_e, "edgeDist", _S.function_value(_e, "_f3"))
	_S.define(_e, "wingColor", _S.function_value(_e, "_f4"))
	_S.define(_e, "butterfly", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f9"))
	_S.define(_e, "meta", _S.merge([{"name": "Butterfly"}, {"desc": "An iridescent butterfly wanders a loop in bursts of quick wingbeats and open-winged glides, its veined, spotted wings shedding a twinkling trail of glowing dust."}, {"tags": ["critter", "butterfly", "insect", "flying", "magic", "glow", "loop"]}, {"size": [128, 88]}, {"origin": [64, 44]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0b0f24", "#16224f", "#1f3f8a", "#2f74c8", "#4fb4f0", "#a0e6ff", "#ffffff"]}, {"spots": ["#3a1a08", "#c8641a", "#ffb43c", "#fff0b0"]}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 22), _S.unary("-", 20), 44, 40]))
	_S.define(_e, "FORE", [[0, _S.unary("-", 1)], [3, _S.unary("-", 6)], [8, _S.unary("-", 11)], [13, _S.unary("-", 12.5)], [16.5, _S.unary("-", 10.5)], [16.5, _S.unary("-", 6)], [13, _S.unary("-", 1.5)], [7, 1], [2, 1.5]])
	_S.define(_e, "HIND", [[0, 1], [6, 1.5], [11, 4], [12.5, 8.5], [10.5, 12.5], [6.5, 13.5], [3, 11], [0.5, 6]])
	_S.define(_e, "BURSTS", [[0, 0.95], [1.5, 2.55]])
	_S.define(_e, "inPoly", _S.function_value(_e, "_f12"))
	_S.define(_e, "FSPOTS", [[13.2, _S.unary("-", 10.2)], [15.2, _S.unary("-", 8.4)], [14.6, _S.unary("-", 5.6)], [11.6, _S.unary("-", 11.4)]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	for _v0 in _S.array(_S.read(_e, "BURSTS")):
		var _v1 = _S.scope(_e)
		var _v2 = _v0
		_S.define(_v1, "a", _S.prop(_v2, 0))
		_S.define(_v1, "b", _S.prop(_v2, 1))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v1, "t"), _S.read(_v1, "a")), func(): return _S.binary("<", _S.read(_v1, "t"), _S.read(_v1, "b")))):
			return true
	return false

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.write(_e, "t", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "t"), _S.read(_e, "D")]), "=", false)
	for _v3 in _S.array(_S.read(_e, "BURSTS")):
		var _v4 = _S.scope(_e)
		var _v5 = _v3
		_S.define(_v4, "a", _S.prop(_v5, 0))
		_S.define(_v4, "b", _S.prop(_v5, 1))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v4, "t"), _S.read(_v4, "a")), func(): return _S.binary("<", _S.read(_v4, "t"), _S.read(_v4, "b")))):
			var _v6 = _S.scope(_v4)
			_S.define(_v6, "n", _S.invoke(_S.read(_v6, "Math"), "round", [_S.binary("*", _S.binary("-", _S.read(_v6, "b"), _S.read(_v6, "a")), 6.3)]))
			_S.define(_v6, "ph", _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v6, "t"), _S.read(_v6, "a")), _S.binary("-", _S.read(_v6, "b"), _S.read(_v6, "a"))), _S.read(_v6, "n")))
			return _S.binary("+", 0.14, _S.binary("*", 0.86, _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v6, "Math"), "cos", [_S.binary("*", _S.read(_v6, "ph"), _S.read(_v6, "TAU"))])))))
	return 1

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.write(_e, "t", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "t"), _S.read(_e, "D")]), "=", false)
	_S.define(_e, "a", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")))
	_S.define(_e, "lift", 0)
	for _v7 in _S.array(_S.read(_e, "BURSTS")):
		var _v8 = _S.scope(_e)
		var _v9 = _v7
		_S.define(_v8, "s", _S.prop(_v9, 0))
		_S.define(_v8, "e", _S.prop(_v9, 1))
		_S.write(_v8, "lift", _S.binary("*", _S.unary("-", 3), _S.invoke(_S.read(_v8, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v8, "Math"), "PI"), _S.call_value(_S.read(_v8, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v8, "t"), _S.read(_v8, "s")), _S.binary("-", _S.read(_v8, "e"), _S.read(_v8, "s")))]))])), "+=", false)
	return _S.merge([{"x": _S.binary("+", _S.binary("*", 30, _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")])), _S.binary("*", 6, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", 3, _S.read(_e, "a"))])))}, {"y": _S.binary("+", _S.binary("*", 12, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", 2, _S.read(_e, "a")), 0.4)])), _S.read(_e, "lift"))}, {"vx": _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")])}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "m", INF)
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	_S.define(_v10, "j", _S.binary("-", _S.prop(_S.read(_v10, "pts"), "length"), 1))
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), _S.prop(_S.read(_v10, "pts"), "length"))):
		var _v11 = _S.scope(_v10)
		var _v12 = _S.prop(_S.read(_v11, "pts"), _S.read(_v11, "j"))
		_S.define(_v11, "ax", _S.prop(_v12, 0))
		_S.define(_v11, "ay", _S.prop(_v12, 1))
		var _v13 = _S.prop(_S.read(_v11, "pts"), _S.read(_v11, "i"))
		_S.define(_v11, "bx", _S.prop(_v13, 0))
		_S.define(_v11, "by", _S.prop(_v13, 1))
		_S.define(_v11, "dx", _S.binary("-", _S.read(_v11, "bx"), _S.read(_v11, "ax")))
		_S.define(_v11, "dy", _S.binary("-", _S.read(_v11, "by"), _S.read(_v11, "ay")))
		_S.define(_v11, "L2", _S.logical("||", _S.binary("+", _S.binary("*", _S.read(_v11, "dx"), _S.read(_v11, "dx")), _S.binary("*", _S.read(_v11, "dy"), _S.read(_v11, "dy"))), func(): return 1))
		_S.define(_v11, "u", _S.call_value(_S.read(_v11, "clamp"), [_S.binary("/", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v11, "x"), _S.read(_v11, "ax")), _S.read(_v11, "dx")), _S.binary("*", _S.binary("-", _S.read(_v11, "y"), _S.read(_v11, "ay")), _S.read(_v11, "dy"))), _S.read(_v11, "L2"))]))
		_S.define(_v11, "px", _S.binary("-", _S.binary("+", _S.read(_v11, "ax"), _S.binary("*", _S.read(_v11, "dx"), _S.read(_v11, "u"))), _S.read(_v11, "x")))
		_S.define(_v11, "py", _S.binary("-", _S.binary("+", _S.read(_v11, "ay"), _S.binary("*", _S.read(_v11, "dy"), _S.read(_v11, "u"))), _S.read(_v11, "y")))
		_S.write(_v11, "m", _S.invoke(_S.read(_v11, "Math"), "min", [_S.read(_v11, "m"), _S.invoke(_S.read(_v11, "Math"), "hypot", [_S.read(_v11, "px"), _S.read(_v11, "py")])]), "=", false)
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "j", _S.write(_v10, "i", 1, "+=", true), "=", false)
	return _S.read(_e, "m")

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "C", _S.arg(_args, 0))
	_S.define(_e, "Sp", _S.arg(_args, 1))
	_S.define(_e, "hind", _S.arg(_args, 2))
	_S.define(_e, "u", _S.arg(_args, 3))
	_S.define(_e, "v", _S.arg(_args, 4))
	_S.define(_e, "pts", (_S.read(_e, "HIND") if _S.truth(_S.read(_e, "hind")) else _S.read(_e, "FORE")))
	_S.define(_e, "e", _S.call_value(_S.read(_e, "edgeDist"), [_S.read(_e, "pts"), _S.read(_e, "u"), _S.read(_e, "v")]))
	_S.define(_e, "r", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "u"), _S.read(_e, "v")]))
	_S.define(_e, "ang", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "v"), _S.read(_e, "u")]))
	if _S.truth(_S.binary("<", _S.read(_e, "e"), 1)):
		return _S.prop(_S.read(_e, "C"), 0)
	if _S.truth(_S.unary("!", _S.read(_e, "hind"))):
		var _v14 = _S.scope(_e)
		if _S.truth(_S.logical("||", _S.binary(">", _S.binary("+", _S.read(_v14, "u"), _S.binary("*", _S.read(_v14, "v"), _S.unary("-", 0.45))), 14.2), func(): return _S.logical("&&", _S.binary(">", _S.read(_v14, "r"), 12.5), func(): return _S.binary("<", _S.read(_v14, "v"), _S.unary("-", 4))))):
			var _v15 = _S.scope(_v14)
			for _v16 in _S.array(_S.read(_v15, "FSPOTS")):
				var _v17 = _S.scope(_v15)
				var _v18 = _v16
				_S.define(_v17, "sx", _S.prop(_v18, 0))
				_S.define(_v17, "sy", _S.prop(_v18, 1))
				if _S.truth(_S.binary("<", _S.invoke(_S.read(_v17, "Math"), "hypot", [_S.binary("-", _S.read(_v17, "u"), _S.read(_v17, "sx")), _S.binary("-", _S.read(_v17, "v"), _S.read(_v17, "sy"))]), 0.9)):
					return _S.prop(_S.read(_v17, "C"), 6)
			return _S.prop(_S.read(_v15, "C"), 0)
	else:
		var _v19 = _S.scope(_e)
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v19, "e"), 2), func(): return _S.binary(">", _S.read(_v19, "r"), 8))):
			return (_S.prop(_S.read(_v19, "C"), 5) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("*", _S.read(_v19, "ang"), 10)]), 0.5)) else _S.prop(_S.read(_v19, "C"), 1))
		_S.define(_v19, "d", _S.invoke(_S.read(_v19, "Math"), "hypot", [_S.binary("-", _S.read(_v19, "u"), 7.6), _S.binary("-", _S.read(_v19, "v"), 9.4)]))
		if _S.truth(_S.binary("<", _S.read(_v19, "d"), 0.7)):
			return _S.prop(_S.read(_v19, "C"), 6)
		if _S.truth(_S.binary("<", _S.read(_v19, "d"), 1.4)):
			return _S.prop(_S.read(_v19, "C"), 0)
		if _S.truth(_S.binary("<", _S.read(_v19, "d"), 2.2)):
			return _S.prop(_S.read(_v19, "Sp"), 2)
	for _v20 in _S.array(([0.5, 1, 1.45] if _S.truth(_S.read(_e, "hind")) else [_S.unary("-", 1.2), _S.unary("-", 0.75), _S.unary("-", 0.3)])):
		var _v21 = _S.scope(_e)
		_S.define(_v21, "va", _v20)
		if _S.truth(_S.logical("&&", _S.binary("<", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "abs", [_S.binary("-", _S.read(_v21, "ang"), _S.read(_v21, "va"))]), _S.read(_v21, "r")), 0.45), func(): return _S.binary(">", _S.read(_v21, "r"), 3.5))):
			return _S.prop(_S.read(_v21, "C"), 1)
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 3)):
		return _S.prop(_S.read(_e, "C"), 2)
	if _S.truth(_S.binary("<", _S.read(_e, "r"), 6)):
		return _S.prop(_S.read(_e, "C"), 3)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.unary("!", _S.read(_e, "hind")), func(): return _S.binary("<", _S.read(_e, "e"), 2.4)), func(): return _S.binary("<", _S.read(_e, "v"), _S.unary("-", 3)))):
		return _S.prop(_S.read(_e, "C"), 5)
	return _S.prop(_S.read(_e, "C"), 4)

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "Sp", _S.arg(_args, 2))
	_S.define(_e, "w", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.invoke(_S.read(_e, "g"), "clear", [])
	for _v22 in _S.array([_S.unary("-", 1), 1]):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "s", _v22)
		for _v24 in _S.array([true, false]):
			var _v25 = _S.scope(_v23)
			_S.define(_v25, "hind", _v24)
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "pts", (_S.read(_v26, "HIND") if _S.truth(_S.read(_v26, "hind")) else _S.read(_v26, "FORE")))
			_S.invoke(_S.read(_v26, "g"), "shade", [_S.unary("-", 20), _S.unary("-", 15), 20, 16, _S.function_value(_v26, "_f6")])
	_S.invoke(_S.read(_e, "g"), "ellipse", [0, 0.5, 1.6, 2.6, _S.function_value(_e, "_f7")])
	var _v27 = _S.scope(_e)
	_S.define(_v27, "y", 3)
	while _S.truth(_S.binary("<", _S.read(_v27, "y"), 10)):
		_S.last([_S.invoke(_S.read(_v27, "g"), "set", [_S.unary("-", 1), _S.read(_v27, "y"), (_S.prop(_S.read(_v27, "C"), 2) if _S.truth(_S.binary("<", _S.read(_v27, "y"), 6)) else _S.prop(_S.read(_v27, "C"), 1))]), _S.logical("&&", _S.binary("<", _S.read(_v27, "y"), 8), func(): return _S.invoke(_S.read(_v27, "g"), "set", [0, _S.read(_v27, "y"), _S.prop(_S.read(_v27, "C"), 1)]))])
		_v27 = _S.iteration(_v27)
		_S.write(_v27, "y", 1, "+=", true)
	_S.invoke(_S.read(_e, "g"), "set", [_S.unary("-", 1), _S.unary("-", 3), _S.prop(_S.read(_e, "C"), 3)])
	_S.invoke(_S.read(_e, "g"), "set", [0, _S.unary("-", 3), _S.prop(_S.read(_e, "C"), 2)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.unary("-", 1), _S.unary("-", 4), _S.prop(_S.read(_e, "C"), 2)])
	_S.invoke(_S.read(_e, "g"), "set", [0, _S.unary("-", 4), _S.prop(_S.read(_e, "C"), 1)])
	for _v28 in _S.array([_S.unary("-", 1), 1]):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "s", _v28)
		var _v30 = _S.scope(_v29)
		_S.define(_v30, "tip", [_S.binary("-", _S.binary("*", _S.read(_v30, "s"), 4), (0 if _S.truth(_S.binary(">", _S.read(_v30, "s"), 0)) else 1)), _S.unary("-", 9.5)])
		_S.invoke(_S.read(_v30, "g"), "line", [(0 if _S.truth(_S.binary(">", _S.read(_v30, "s"), 0)) else _S.unary("-", 1)), _S.unary("-", 5), _S.prop(_S.read(_v30, "tip"), 0), _S.prop(_S.read(_v30, "tip"), 1), _S.prop(_S.read(_v30, "C"), 2)])
		_S.invoke(_S.read(_v30, "g"), "set", [_S.prop(_S.read(_v30, "tip"), 0), _S.prop(_S.read(_v30, "tip"), 1), _S.prop(_S.read(_v30, "C"), 6)])
	_S.invoke(_S.read(_e, "g"), "outline", [_S.function_value(_e, "_f8")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	if _S.truth(_S.binary("!==", _S.invoke(_S.read(_e, "Math"), "sign", [_S.binary("+", _S.read(_e, "x"), 0.001)]), _S.read(_e, "s"))):
		return 0
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 1), _S.read(_e, "w")))
	_S.define(_e, "v", _S.read(_e, "y"))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.unary("!", _S.call_value(_S.read(_e, "inPoly"), [_S.read(_e, "pts"), _S.read(_e, "u"), _S.read(_e, "v")])))):
		return 0
	_S.define(_e, "c", _S.call_value(_S.read(_e, "wingColor"), [_S.read(_e, "C"), _S.read(_e, "Sp"), _S.read(_e, "hind"), _S.read(_e, "u"), _S.read(_e, "v")]))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "w"), 0.5), func(): return _S.binary("!==", _S.read(_e, "c"), _S.prop(_S.read(_e, "C"), 0)))):
		_S.write(_e, "c", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.prop(_S.read(_e, "C"), 1), _S.binary("*", _S.binary("-", 0.5, _S.read(_e, "w")), 1.6)]), "=", false)
	return _S.read(_e, "c")

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "nx", _S.arg(_args, 0))
	_S.define(_e, "ny", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary("<", _S.binary("+", _S.read(_e, "nx"), _S.read(_e, "ny")), _S.unary("-", 0.4))) else _S.prop(_S.read(_e, "C"), 1))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "nx", _S.arg(_args, 2))
	_S.define(_e, "ny", _S.arg(_args, 3))
	return _S.prop(_S.read(_e, "C"), 0)

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "Sp", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "spots"), 4]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "t")]))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "fold"), [_S.read(_e, "t")]))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 56, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7), 1), _S.function_value(_e, "_f10"), _S.function_value(_e, "_f11")])
	_S.define(_e, "g", _S.read(_e, "GRID"))
	_S.call_value(_S.read(_e, "butterfly"), [_S.read(_e, "g"), _S.read(_e, "C"), _S.read(_e, "Sp"), _S.read(_e, "w"), _S.read(_e, "t")])
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p"), 1, _S.prop(_S.read(_e, "S"), "x"), _S.prop(_S.read(_e, "S"), "y")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "S"), "x"), _S.prop(_S.read(_e, "S"), "y"), 38, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.16, _S.binary("*", 0.14, _S.read(_e, "w")))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "S"), "x"), _S.prop(_S.read(_e, "S"), "y"), 12, _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.12, _S.binary("*", 0.1, _S.read(_e, "w")))])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1, 1.8])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "born", _S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), _S.read(_e, "D")]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "born")]))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "L")))
	if _S.truth(_S.logical("&&", _S.unary("!", _S.call_value(_S.read(_e, "flapping"), [_S.read(_e, "born")])), func(): return _S.invoke(_S.read(_e, "r"), "chance", [0.45]))):
		return null
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "B"), "x"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 9), 9])), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 3), _S.read(_e, "i"))]), 1.5)))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "B"), "y"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 4), 8])), _S.binary("*", 7, _S.read(_e, "age"))), _S.binary("*", _S.binary("*", 3, _S.read(_e, "age")), _S.read(_e, "age"))))
	_S.define(_e, "tw", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 11), _S.binary("*", _S.read(_e, "i"), 2.1))]))))
	_S.define(_e, "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 8)]), _S.binary("-", 1, _S.read(_e, "k"))))
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "tw"), 0.7)) else (_S.prop(_S.read(_e, "Sp"), 2) if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.3])) else _S.prop(_S.read(_e, "C"), 5))), _S.binary("*", _S.read(_e, "a"), 1.2)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 6, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "a")), _S.read(_e, "tw"))])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("===", _S.binary("%", _S.read(_e, "i"), 9), 0), func(): return _S.binary(">", _S.read(_e, "tw"), 0.85)), func(): return _S.binary("<", _S.read(_e, "k"), 0.5))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), 2, _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.3, _S.read(_e, "a"))])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "inside", false)
	var _v31 = _S.scope(_e)
	_S.define(_v31, "i", 0)
	_S.define(_v31, "j", _S.binary("-", _S.prop(_S.read(_v31, "pts"), "length"), 1))
	while _S.truth(_S.binary("<", _S.read(_v31, "i"), _S.prop(_S.read(_v31, "pts"), "length"))):
		var _v32 = _S.scope(_v31)
		var _v33 = _S.prop(_S.read(_v32, "pts"), _S.read(_v32, "i"))
		_S.define(_v32, "xi", _S.prop(_v33, 0))
		_S.define(_v32, "yi", _S.prop(_v33, 1))
		var _v34 = _S.prop(_S.read(_v32, "pts"), _S.read(_v32, "j"))
		_S.define(_v32, "xj", _S.prop(_v34, 0))
		_S.define(_v32, "yj", _S.prop(_v34, 1))
		if _S.truth(_S.logical("&&", _S.binary("!==", _S.binary(">", _S.read(_v32, "yi"), _S.read(_v32, "y")), _S.binary(">", _S.read(_v32, "yj"), _S.read(_v32, "y"))), func(): return _S.binary("<", _S.read(_v32, "x"), _S.binary("+", _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v32, "xj"), _S.read(_v32, "xi")), _S.binary("-", _S.read(_v32, "y"), _S.read(_v32, "yi"))), _S.binary("-", _S.read(_v32, "yj"), _S.read(_v32, "yi"))), _S.read(_v32, "xi"))))):
			_S.write(_v32, "inside", _S.unary("!", _S.read(_v32, "inside")), "=", false)
		_v31 = _S.iteration(_v31)
		_S.write(_v31, "j", _S.write(_v31, "i", 1, "+=", true), "=", false)
	return _S.read(_e, "inside")
