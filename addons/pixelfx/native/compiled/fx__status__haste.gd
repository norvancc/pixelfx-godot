@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/haste.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "travel", _S.import_value("fx/status/_lib.js", "travel"))
	_S.define(_e, "levels", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f2"))
	_S.define(_e, "lines", _S.function_value(_e, "_f6"))
	_S.define(_e, "draw", _S.function_value(_e, "_f9"))
	_S.define(_e, "meta", _S.merge([{"name": "Haste"}, {"desc": "Sped up: striped after-images stream out behind, speed lines whip past, dust kicks off the heels and the leading edge catches the wind. Faces right."}, {"tags": ["status", "haste", "speed", "fast", "buff", "directional", "loop"]}, {"size": [100, 56]}, {"origin": [64, 48]}, {"duration": 1.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#4c25ab", "#773ae4", "#5b6cff", "#5eb0ff", "#a3dcff", "#ccf6ff", "#ffffff"]}, {"dust": "#8a8090"}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RUN", _S.merge([{"turn": 0.25}, {"lean": 4}]))
	_S.define(_e, "R1", _S.merge([_S.read(_e, "RUN"), {"crouch": 3}, {"ffx": 12}, {"ffy": _S.unary("-", 5)}, {"fbx": _S.unary("-", 10)}, {"fby": _S.unary("-", 8)}, {"toeB": true}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 19)}, {"bx": 12}, {"by": _S.unary("-", 27)}]))
	_S.define(_e, "R2", _S.merge([_S.read(_e, "RUN"), {"crouch": 1}, {"ffx": 4}, {"ffy": _S.unary("-", 8)}, {"fbx": _S.unary("-", 1)}, {"fby": _S.unary("-", 5)}, {"fx": 3}, {"fy": _S.unary("-", 18)}, {"bx": 5}, {"by": _S.unary("-", 19)}]))
	_S.define(_e, "R3", _S.merge([_S.read(_e, "RUN"), {"crouch": 3}, {"ffx": _S.unary("-", 10)}, {"ffy": _S.unary("-", 8)}, {"toeF": true}, {"fbx": 12}, {"fby": _S.unary("-", 5)}, {"fx": 14}, {"fy": _S.unary("-", 27)}, {"bx": _S.unary("-", 5)}, {"by": _S.unary("-", 19)}]))
	_S.define(_e, "R4", _S.merge([_S.read(_e, "RUN"), {"crouch": 1}, {"ffx": _S.unary("-", 1)}, {"ffy": _S.unary("-", 5)}, {"fbx": 4}, {"fby": _S.unary("-", 8)}, {"fx": 5}, {"fy": _S.unary("-", 19)}, {"bx": 3}, {"by": _S.unary("-", 18)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"poses": [[0, _S.read(_e, "R1")], [0.1, _S.read(_e, "R2"), "snap"], [0.2, _S.read(_e, "R3"), "snap"], [0.3, _S.read(_e, "R4"), "snap"], [0.4, _S.read(_e, "R1"), "snap"], [0.5, _S.read(_e, "R2"), "snap"], [0.6, _S.read(_e, "R3"), "snap"], [0.7, _S.read(_e, "R4"), "snap"], [0.8, _S.read(_e, "R1"), "snap"], [0.9, _S.read(_e, "R2"), "snap"], [1, _S.read(_e, "R3"), "snap"], [1.1, _S.read(_e, "R4"), "snap"], [1.2, _S.read(_e, "R1"), "snap"]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "LEVELS", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_S.define(_e, "seed", _S.function_value(_e, "_f10"))
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "l", _S.invoke(_S.read(_e, "LEVELS"), "get", [_S.prop(_S.read(_e, "a"), "mask")]))
	if _S.truth(_S.read(_e, "l")):
		return _S.read(_e, "l")
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.write(_e, "l", _S.invoke(_S.prop(_S.read(_e, "S"), "body"), "map", [_S.function_value(_e, "_f1")]), "=", false)
	_S.invoke(_S.read(_e, "LEVELS"), "set", [_S.prop(_S.read(_e, "a"), "mask"), _S.read(_e, "l")])
	return _S.read(_e, "l")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v0 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v0, 0))
	_S.define(_e, "y", _S.prop(_v0, 1))
	_S.define(_e, "v", _S.call_value(_S.read(_e, "luma"), [_S.call_value(_S.read(_e, "colorAt"), [_S.read(_e, "a"), _S.read(_e, "x"), _S.read(_e, "y")])]))
	return [_S.read(_e, "x"), _S.read(_e, "y"), (1 if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.24)) else (2 if _S.truth(_S.binary("<", _S.read(_e, "v"), 0.66)) else 3))]

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "L", _S.call_value(_S.read(_e, "levels"), [_S.read(_e, "a")]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 30)]))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "g", 3)
	while _S.truth(_S.binary(">=", _S.read(_v1, "g"), 1)):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "dx", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_v2, "g")), 14), _S.invoke(_S.read(_v2, "Math"), "round", [_S.binary("*", _S.call_value(_S.read(_v2, "rand"), [_S.binary(">>", _S.read(_v2, "f"), 1), _S.read(_v2, "g"), 3]), 1.6)])))
		_S.define(_v2, "every", _S.prop([0, 3, 4, 0], _S.read(_v2, "g")))
		_S.invoke(_S.read(_v2, "p"), "outline", [_S.prop(_S.read(_v2, "a"), "mask"), _S.binary("+", _S.prop(_S.read(_v2, "a"), "x"), _S.read(_v2, "dx")), _S.prop(_S.read(_v2, "a"), "y"), _S.function_value(_v2, "_f3")])
		if _S.truth(_S.read(_v2, "every")):
			for _v3 in _S.array(_S.read(_v2, "L")):
				var _v4 = _S.scope(_v2)
				var _v5 = _v3
				_S.define(_v4, "x", _S.prop(_v5, 0))
				_S.define(_v4, "y", _S.prop(_v5, 1))
				_S.define(_v4, "v", _S.prop(_v5, 2))
				var _v6 = _S.scope(_v4)
				if _S.truth(_S.binary("%", _S.binary("+", _S.binary("%", _S.binary("+", _S.read(_v6, "y"), _S.read(_v6, "f")), _S.read(_v6, "every")), _S.read(_v6, "every")), _S.read(_v6, "every"))):
					continue
				_S.invoke(_S.read(_v6, "p"), "px", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v6, "a"), "x"), _S.read(_v6, "x")), _S.read(_v6, "dx")), _S.binary("+", _S.prop(_S.read(_v6, "a"), "y"), _S.read(_v6, "y")), _S.prop(_S.read(_v6, "C"), _S.invoke(_S.read(_v6, "Math"), "max", [0, _S.invoke(_S.read(_v6, "Math"), "min", [6, _S.binary("-", _S.binary("+", _S.binary("-", 5, _S.read(_v6, "g")), _S.read(_v6, "v")), 2)])]))])
		_S.invoke(_S.read(_v2, "p"), "glow", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v2, "a"), "x"), _S.binary("/", _S.prop(_S.read(_v2, "a"), "w"), 2)), _S.read(_v2, "dx")), _S.binary("+", _S.prop(_S.read(_v2, "a"), "y"), _S.binary("*", _S.prop(_S.read(_v2, "a"), "h"), 0.45)), 16, _S.prop(_S.read(_v2, "C"), 3), _S.binary("*", 0.12, _S.binary("-", 1, _S.binary("*", _S.read(_v2, "g"), 0.25)))])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "g", 1, "-=", true)
	for _v7 in _S.array(_S.prop(_S.read(_e, "S"), "side")):
		var _v8 = _S.scope(_e)
		var _v9 = _v7
		_S.define(_v8, "x", _S.prop(_v9, 0))
		_S.define(_v8, "y", _S.prop(_v9, 1))
		_S.define(_v8, "dir", _S.prop(_v9, 2))
		var _v10 = _S.scope(_v8)
		if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v10, "dir"), 0), func(): return _S.binary("%", _S.binary("+", _S.read(_v10, "y"), _S.binary(">>", _S.read(_v10, "f"), 1)), 3))):
			continue
		_S.define(_v10, "len", _S.binary("+", 3, _S.invoke(_S.read(_v10, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "y"), _S.binary(">>", _S.read(_v10, "f"), 1), 5]), 6)])))
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "d", 1)
		while _S.truth(_S.binary("<=", _S.read(_v11, "d"), _S.read(_v11, "len"))):
			_S.invoke(_S.read(_v11, "p"), "dot", [_S.binary("-", _S.binary("+", _S.prop(_S.read(_v11, "a"), "x"), _S.read(_v11, "x")), _S.read(_v11, "d")), _S.binary("+", _S.prop(_S.read(_v11, "a"), "y"), _S.read(_v11, "y")), (_S.prop(_S.read(_v11, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v11, "d"), 3)) else _S.prop(_S.read(_v11, "C"), 4)), _S.binary("-", 1, _S.binary("/", _S.read(_v11, "d"), _S.binary("+", _S.read(_v11, "len"), 1)))])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "d", 1, "+=", true)
	_S.call_value(_S.read(_e, "lines"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "a"), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed"), false])
	_S.define(_e, "dust", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "dust")]))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 12, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 5), _S.function_value(_e, "_f4"), _S.function_value(_e, "_f5")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "mx", _S.arg(_args, 0))
	_S.define(_e, "my", _S.arg(_args, 1))
	return (0 if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_e, "g"), 3), func(): return _S.binary("%", _S.binary("+", _S.read(_e, "mx"), _S.read(_e, "my")), 2))) else _S.prop(_S.read(_e, "C"), _S.binary("-", 5, _S.read(_e, "g"))))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.45, 0.7])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "foot", (_S.unary("-", 7) if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else 3))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "foot"), _S.call_value(_S.read(_e, "travel"), [_S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [50, 100])), 0, 3.5, _S.read(_e, "age")])))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", 1.5), _S.call_value(_S.read(_e, "travel"), [_S.invoke(_S.read(_e, "r"), "range", [6, 18]), 0, 3.5, _S.read(_e, "age")])))
	_S.define(_e, "rad", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [2.6, 4.6]), _S.binary("+", 0.6, _S.binary("*", 1, _S.read(_e, "u")))))
	_S.define(_e, "k", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "u")), 1.2]), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "u"), 10)])))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "rad"), _S.read(_e, "dust"), _S.binary("*", _S.read(_e, "k"), 0.5)])
	_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "rad"), 0.05)), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "rad"), 0.08)), _S.binary("*", _S.read(_e, "rad"), 0.74), _S.read(_e, "dust"), _S.binary("*", _S.read(_e, "k"), 0.62)])
	_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "rad"), 0.22)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "rad"), 0.3)), _S.binary("*", _S.read(_e, "rad"), 0.5), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", _S.read(_e, "k"), 0.25)])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "a", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "seed", _S.arg(_args, 4))
	_S.define(_e, "front", _S.arg(_args, 5))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), (5 if _S.truth(_S.read(_e, "front")) else 11), _S.binary("+", _S.read(_e, "seed"), (9 if _S.truth(_S.read(_e, "front")) else 7)), _S.function_value(_e, "_f7"), _S.function_value(_e, "_f8")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.12, 0.26])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "y", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.invoke(_S.read(_e, "r"), "range", [2, _S.binary("-", _S.prop(_S.read(_e, "a"), "h"), 3)])))
	_S.define(_e, "len", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [10, 26]), (0.7 if _S.truth(_S.read(_e, "front")) else 1)))
	_S.define(_e, "x", _S.binary("-", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 14), 4]), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [160, 240]))))
	var _v12 = _S.scope(_e)
	_S.define(_v12, "d", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "d"), _S.read(_v12, "len"))):
		var _v13 = _S.scope(_v12)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v13, "d"), _S.binary("*", _S.read(_v13, "len"), 0.45)), func(): return _S.binary("%", _S.read(_v13, "d"), 2))):
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "d", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v13, "p"), "dot", [_S.binary("+", _S.read(_v13, "x"), _S.read(_v13, "d")), _S.read(_v13, "y"), (_S.prop(_S.read(_v13, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v13, "d"), 2)) else (_S.prop(_S.read(_v13, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v13, "d"), _S.binary("*", _S.read(_v13, "len"), 0.4))) else _S.prop(_S.read(_v13, "C"), 3))), _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_v13, "d"), _S.read(_v13, "len"))), _S.binary("-", 1, _S.read(_v13, "u"))), (0.7 if _S.truth(_S.read(_v13, "front")) else 1.1))])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "d", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "light", [_S.read(_e, "x"), _S.read(_e, "y"), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_e, "u")))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	for _v14 in _S.array(_S.prop(_S.read(_e, "S"), "side")):
		var _v15 = _S.scope(_e)
		var _v16 = _v14
		_S.define(_v15, "x", _S.prop(_v16, 0))
		_S.define(_v15, "y", _S.prop(_v16, 1))
		_S.define(_v15, "dir", _S.prop(_v16, 2))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v15, "dir"), 0), func(): return _S.binary("<", _S.call_value(_S.read(_v15, "rand"), [_S.read(_v15, "x"), _S.read(_v15, "y"), _S.invoke(_S.read(_v15, "Math"), "floor", [_S.binary("*", _S.read(_v15, "t"), 15)])]), 0.85))):
			_S.invoke(_S.read(_v15, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v15, "a"), "x"), _S.read(_v15, "x")), _S.binary("+", _S.prop(_S.read(_v15, "a"), "y"), _S.read(_v15, "y")), (_S.prop(_S.read(_v15, "C"), 6) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v15, "rand"), [_S.read(_v15, "y"), _S.invoke(_S.read(_v15, "Math"), "floor", [_S.binary("*", _S.read(_v15, "t"), 15)]), 2]), 0.3)) else _S.prop(_S.read(_v15, "C"), 5))])
	_S.call_value(_S.read(_e, "lines"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "a"), _S.read(_e, "t"), _S.call_value(_S.read(_e, "seed"), [_S.read(_e, "o")]), true])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.unary("-", 6), _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.binary("*", _S.prop(_S.read(_e, "a"), "h"), 0.5)), 22, _S.prop(_S.read(_e, "C"), 3), 0.16])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.binary("*", _S.prop(_S.read(_e, "a"), "h"), 0.45)), 30, _S.prop(_S.read(_e, "C"), 3), 0.16])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.prop(_S.read(_e, "a"), "w")), _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.binary("*", _S.prop(_S.read(_e, "a"), "h"), 0.5)), 10, _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.12, _S.binary("*", 0.06, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 3)])))])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "o", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "o"), "seed")
