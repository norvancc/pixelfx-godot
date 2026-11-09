@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/electrified.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "flight", _S.import_value("fx/lightning/_lib.js", "flight"))
	_S.define(_e, "spark", _S.import_value("fx/lightning/_lib.js", "spark"))
	_S.define(_e, "edgeOf", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Electrified"}, {"desc": "Current runs through a character: arcs crawl over and leap across the body, sparks spit off, the body flares to an electric silhouette on each jolt, and the feet ground out."}, {"tags": ["lightning", "electric", "status", "shock", "stun", "actor", "loop"]}, {"size": [108, 92]}, {"origin": [54, 76]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "TENSE", _S.merge([{"turn": 0.9}, {"crouch": 3}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 17)}, {"bx": 9}, {"by": _S.unary("-", 17)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "JOLT_A", _S.merge([{"turn": 1.1}, {"crouch": 0}, {"y": _S.unary("-", 1)}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 36)}, {"bx": 13}, {"by": _S.unary("-", 17)}, {"ffx": _S.unary("-", 4)}, {"fbx": 5}]))
	_S.define(_e, "JOLT_B", _S.merge([{"turn": 0.7}, {"crouch": 1}, {"y": _S.unary("-", 1)}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 16)}, {"bx": 13}, {"by": _S.unary("-", 36)}, {"ffx": _S.unary("-", 4)}, {"fbx": 5}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "TENSE")], [0.1, _S.read(_e, "JOLT_A"), "snap"], [0.17, _S.read(_e, "JOLT_B"), "snap"], [0.3, _S.read(_e, "TENSE"), "snap"], [0.733, _S.read(_e, "TENSE")], [0.733, _S.read(_e, "JOLT_B"), "snap"], [0.8, _S.read(_e, "JOLT_A"), "snap"], [0.93, _S.read(_e, "TENSE"), "snap"], [1.367, _S.read(_e, "TENSE")], [1.367, _S.read(_e, "JOLT_A"), "snap"], [1.45, _S.read(_e, "JOLT_B"), "snap"], [1.58, _S.read(_e, "TENSE"), "snap"], [2, _S.read(_e, "TENSE")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "FPS", 30)
	_S.define(_e, "N", 60)
	_S.define(_e, "P", 2)
	_S.define(_e, "JOLTS", [[3, 1], [22, 0.7], [41, 0.9]])
	_S.define(_e, "edges", _S.construct(_S.read(_e, "WeakMap"), []))
	_S.define(_e, "jolt", _S.function_value(_e, "_f6"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "A", _S.arg(_args, 0))
	_S.define(_e, "e", _S.invoke(_S.read(_e, "edges"), "get", [_S.prop(_S.read(_e, "A"), "mask")]))
	if _S.truth(_S.read(_e, "e")):
		return _S.read(_e, "e")
	_S.define(_e, "m", _S.prop(_S.read(_e, "A"), "mask"))
	_S.define(_e, "on", _S.function_value(_e, "_f1"))
	_S.write(_e, "e", [], "=", false)
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "y"), _S.prop(_S.read(_v0, "m"), "h"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "x"), _S.prop(_S.read(_v1, "m"), "w"))):
			if _S.truth(_S.logical("&&", _S.call_value(_S.read(_v1, "on"), [_S.read(_v1, "x"), _S.read(_v1, "y")]), func(): return _S.logical("||", _S.logical("||", _S.logical("||", _S.unary("!", _S.call_value(_S.read(_v1, "on"), [_S.binary("-", _S.read(_v1, "x"), 1), _S.read(_v1, "y")])), func(): return _S.unary("!", _S.call_value(_S.read(_v1, "on"), [_S.binary("+", _S.read(_v1, "x"), 1), _S.read(_v1, "y")]))), func(): return _S.unary("!", _S.call_value(_S.read(_v1, "on"), [_S.read(_v1, "x"), _S.binary("-", _S.read(_v1, "y"), 1)]))), func(): return _S.unary("!", _S.call_value(_S.read(_v1, "on"), [_S.read(_v1, "x"), _S.binary("+", _S.read(_v1, "y"), 1)]))))):
				_S.invoke(_S.read(_v1, "e"), "push", [[_S.binary("+", _S.binary("+", _S.prop(_S.read(_v1, "A"), "x"), _S.read(_v1, "x")), 0.5), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v1, "A"), "y"), _S.read(_v1, "y")), 0.5)]])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "x", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	_S.invoke(_S.read(_e, "edges"), "set", [_S.prop(_S.read(_e, "A"), "mask"), _S.read(_e, "e")])
	return _S.read(_e, "e")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "x"), 0), func(): return _S.binary(">=", _S.read(_e, "y"), 0)), func(): return _S.binary("<", _S.read(_e, "x"), _S.prop(_S.read(_e, "m"), "w"))), func(): return _S.binary("<", _S.read(_e, "y"), _S.prop(_S.read(_e, "m"), "h"))), func(): return _S.prop(_S.prop(_S.read(_e, "m"), "data"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.prop(_S.read(_e, "m"), "w")), _S.read(_e, "x"))))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "f", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), _S.read(_e, "FPS")), 0.000001)]), _S.read(_e, "N")))
	_S.define(_e, "j", _S.call_value(_S.read(_e, "jolt"), [_S.read(_e, "f")]))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rng"), [_S.prop(_S.read(_e, "o"), "seed"), 4, _S.read(_e, "f")]))
	_S.invoke(_S.read(_e, "p"), "outline", [_S.prop(_S.read(_e, "A"), "mask"), _S.prop(_S.read(_e, "A"), "x"), _S.prop(_S.read(_e, "A"), "y"), (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.read(_e, "j")) else (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.5)) else _S.prop(_S.read(_e, "C"), 1)))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 18), 30, _S.prop(_S.read(_e, "C"), 3), (_S.binary("*", 0.55, _S.prop(_S.read(_e, "j"), "k")) if _S.truth(_S.read(_e, "j")) else _S.binary("+", 0.16, _S.binary("*", 0.1, _S.invoke(_S.read(_e, "r"), "next", []))))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 2), 22, _S.prop(_S.read(_e, "C"), 4), 0.18])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "S", _S.invoke(_S.prop(_S.read(_e, "o"), "sparks"), "map", [_S.read(_e, "hex")]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "E", _S.call_value(_S.read(_e, "edgeOf"), [_S.read(_e, "A")]))
	_S.define(_e, "f", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), _S.read(_e, "FPS")), 0.000001)]), _S.read(_e, "N")))
	_S.define(_e, "j", _S.call_value(_S.read(_e, "jolt"), [_S.read(_e, "f")]))
	if _S.truth(_S.read(_e, "j")):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "lift", _S.binary("*", _S.prop([1.1, 0.6, _S.unary("-", 0.2)], _S.prop(_S.read(_v2, "j"), "a")), _S.prop(_S.read(_v2, "j"), "k")))
		_S.define(_v2, "ramp", [_S.prop(_S.read(_v2, "C"), 1), _S.prop(_S.read(_v2, "C"), 2), _S.prop(_S.read(_v2, "C"), 3), _S.prop(_S.read(_v2, "C"), 4), _S.prop(_S.read(_v2, "C"), 5), _S.prop(_S.read(_v2, "C"), 6), _S.prop(_S.read(_v2, "C"), 7)])
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "y", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "y"), _S.prop(_S.read(_v3, "A"), "h"))):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "x", 0)
			while _S.truth(_S.binary("<", _S.read(_v4, "x"), _S.prop(_S.read(_v4, "A"), "w"))):
				var _v5 = _S.scope(_v4)
				_S.define(_v5, "c", _S.prop(_S.prop(_S.read(_v5, "A"), "pixels"), _S.binary("+", _S.binary("*", _S.read(_v5, "y"), _S.prop(_S.read(_v5, "A"), "w")), _S.read(_v5, "x"))))
				if _S.truth(_S.read(_v5, "c")):
					_S.invoke(_S.read(_v5, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v5, "A"), "x"), _S.read(_v5, "x")), _S.binary("+", _S.prop(_S.read(_v5, "A"), "y"), _S.read(_v5, "y")), _S.prop(_S.read(_v5, "ramp"), _S.call_value(_S.read(_v5, "clamp"), [_S.invoke(_S.read(_v5, "Math"), "round", [_S.binary("+", _S.binary("+", 0.4, _S.binary("*", _S.call_value(_S.read(_v5, "luma"), [_S.read(_v5, "c")]), 6)), _S.read(_v5, "lift"))]), 0, 6]))])
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "x", 1, "+=", true)
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "y", 1, "+=", true)
		_S.invoke(_S.read(_v2, "p"), "glow", [0, _S.unary("-", 19), 26, _S.prop(_S.read(_v2, "C"), 5), _S.binary("*", _S.binary("*", 0.5, _S.prop(_S.read(_v2, "j"), "k")), _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_v2, "j"), "a"), 3)))])
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rng"), [_S.prop(_S.read(_e, "o"), "seed"), 7, _S.binary(">>", _S.read(_e, "f"), 1)]))
	_S.define(_e, "n", _S.binary("+", 2, (2 if _S.truth(_S.read(_e, "j")) else _S.invoke(_S.read(_e, "r"), "int", [0, 1]))))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), _S.read(_v6, "n"))):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "a", _S.invoke(_S.read(_v7, "r"), "pick", [_S.read(_v7, "E")]))
		_S.define(_v7, "ang", _S.invoke(_S.read(_v7, "r"), "range", [0, _S.read(_v7, "TAU")]))
		_S.define(_v7, "d", _S.invoke(_S.read(_v7, "r"), "range", [6, 14]))
		_S.define(_v7, "b", [_S.binary("+", _S.prop(_S.read(_v7, "a"), 0), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "ang")]), _S.read(_v7, "d"))), _S.binary("+", _S.prop(_S.read(_v7, "a"), 1), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "ang")]), _S.read(_v7, "d")))])
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "k"), 10)):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "c", _S.invoke(_S.read(_v9, "r"), "pick", [_S.read(_v9, "E")]))
			if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v9, "Math"), "hypot", [_S.binary("-", _S.prop(_S.read(_v9, "c"), 0), _S.prop(_S.read(_v9, "b"), 0)), _S.binary("-", _S.prop(_S.read(_v9, "c"), 1), _S.prop(_S.read(_v9, "b"), 1))]), 5), func(): return _S.binary(">", _S.invoke(_S.read(_v9, "Math"), "hypot", [_S.binary("-", _S.prop(_S.read(_v9, "c"), 0), _S.prop(_S.read(_v9, "a"), 0)), _S.binary("-", _S.prop(_S.read(_v9, "c"), 1), _S.prop(_S.read(_v9, "a"), 1))]), 4))):
				_S.write(_v9, "b", _S.read(_v9, "c"), "=", false)
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "k", 1, "+=", true)
		_S.define(_v7, "k", _S.binary("*", (0.75 if _S.truth(_S.binary("&", _S.read(_v7, "f"), 1)) else 0.95), _S.invoke(_S.read(_v7, "r"), "range", [0.6, 1])))
		_S.call_value(_S.read(_v7, "crackle"), [_S.read(_v7, "p"), _S.call_value(_S.read(_v7, "zigzag"), [_S.call_value(_S.read(_v7, "rng"), [_S.prop(_S.read(_v7, "o"), "seed"), 8, _S.read(_v7, "f"), _S.read(_v7, "i")]), _S.prop(_S.read(_v7, "a"), 0), _S.prop(_S.read(_v7, "a"), 1), _S.prop(_S.read(_v7, "b"), 0), _S.prop(_S.read(_v7, "b"), 1), 0.42, 0.35]), _S.read(_v7, "k"), _S.read(_v7, "C"), 0.4])
		for _v10 in _S.array(_S.read(_v7, "E")):
			var _v11 = _S.scope(_v7)
			var _v12 = _v10
			_S.define(_v11, "x", _S.prop(_v12, 0))
			_S.define(_v11, "y", _S.prop(_v12, 1))
			if _S.truth(_S.logical("||", _S.binary("<", _S.invoke(_S.read(_v11, "Math"), "hypot", [_S.binary("-", _S.read(_v11, "x"), _S.prop(_S.read(_v11, "a"), 0)), _S.binary("-", _S.read(_v11, "y"), _S.prop(_S.read(_v11, "a"), 1))]), 3.5), func(): return _S.binary("<", _S.invoke(_S.read(_v11, "Math"), "hypot", [_S.binary("-", _S.read(_v11, "x"), _S.prop(_S.read(_v11, "b"), 0)), _S.binary("-", _S.read(_v11, "y"), _S.prop(_S.read(_v11, "b"), 1))]), 3))):
				_S.invoke(_S.read(_v11, "p"), "px", [_S.binary("-", _S.read(_v11, "x"), 0.5), _S.binary("-", _S.read(_v11, "y"), 0.5), _S.prop(_S.read(_v11, "C"), 5)])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), (0.9 if _S.truth(_S.read(_e, "j")) else 0.35))):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "s", _S.invoke(_S.read(_v13, "r"), "sign", []))
		_S.define(_v13, "x0", _S.binary("*", _S.read(_v13, "s"), _S.invoke(_S.read(_v13, "r"), "range", [3, 8])))
		_S.call_value(_S.read(_v13, "crackle"), [_S.read(_v13, "p"), _S.call_value(_S.read(_v13, "zigzag"), [_S.call_value(_S.read(_v13, "rng"), [_S.prop(_S.read(_v13, "o"), "seed"), 9, _S.read(_v13, "f")]), _S.read(_v13, "x0"), _S.unary("-", 1.5), _S.binary("+", _S.read(_v13, "x0"), _S.binary("*", _S.read(_v13, "s"), _S.invoke(_S.read(_v13, "r"), "range", [5, 12]))), _S.unary("-", 0.5), 0.45, 0.3]), 0.7, _S.read(_v13, "C"), 0.35])
		_S.invoke(_S.read(_v13, "p"), "glow", [_S.read(_v13, "x0"), _S.unary("-", 1), 10, _S.prop(_S.read(_v13, "C"), 5), 0.35])
	for _v14 in _S.array(_S.read(_e, "JOLTS")):
		var _v15 = _S.scope(_e)
		var _v16 = _v14
		_S.define(_v15, "f0", _S.prop(_v16, 0))
		_S.define(_v15, "k", _S.prop(_v16, 1))
		var _v17 = _S.scope(_v15)
		_S.define(_v17, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v17, "t"), _S.binary("/", _S.read(_v17, "f0"), _S.read(_v17, "FPS"))), _S.read(_v17, "P")), _S.read(_v17, "P")), _S.read(_v17, "P")))
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), 9)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "q", _S.call_value(_S.read(_v19, "rng"), [_S.prop(_S.read(_v19, "o"), "seed"), 21, _S.read(_v19, "f0"), _S.read(_v19, "i")]))
			_S.define(_v19, "life", _S.invoke(_S.read(_v19, "q"), "range", [0.18, 0.4]))
			if _S.truth(_S.binary(">=", _S.read(_v19, "age"), _S.read(_v19, "life"))):
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "i", 1, "+=", true)
				continue
			var _v20 = _S.prop(_S.read(_v19, "E"), _S.invoke(_S.read(_v19, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_v19, "q"), "next", []), _S.prop(_S.read(_v19, "E"), "length"))]))
			_S.define(_v19, "x0", _S.prop(_v20, 0))
			_S.define(_v19, "y0", _S.prop(_v20, 1))
			_S.define(_v19, "ang", _S.binary("+", _S.invoke(_S.read(_v19, "Math"), "atan2", [_S.binary("+", _S.read(_v19, "y0"), 19), _S.read(_v19, "x0")]), _S.invoke(_S.read(_v19, "q"), "range", [_S.unary("-", 0.7), 0.7])))
			_S.define(_v19, "sp", _S.binary("*", _S.invoke(_S.read(_v19, "q"), "range", [60, 150]), _S.read(_v19, "k")))
			var _v21 = _S.call_value(_S.read(_v19, "flight"), [_S.read(_v19, "x0"), _S.read(_v19, "y0"), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "ang")]), _S.read(_v19, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "ang")]), _S.read(_v19, "sp")), 30), _S.read(_v19, "age"), _S.merge([{"floor": 0}])])
			_S.define(_v19, "x", _S.prop(_v21, 0))
			_S.define(_v19, "y", _S.prop(_v21, 1))
			_S.define(_v19, "vx", _S.prop(_v21, 2))
			_S.define(_v19, "vy", _S.prop(_v21, 3))
			_S.call_value(_S.read(_v19, "spark"), [_S.read(_v19, "p"), _S.read(_v19, "x"), _S.read(_v19, "y"), _S.read(_v19, "vx"), _S.read(_v19, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_v19, "age"), _S.read(_v19, "life"))), _S.read(_v19, "S")])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "P"), 8, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 3), _S.function_value(_e, "_f4"), _S.function_value(_e, "_f5")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.15, 0.3])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "q", _S.arg(_args, 2))
	var _v22 = _S.prop(_S.read(_e, "E"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_e, "q"), "next", []), _S.prop(_S.read(_e, "E"), "length"))]))
	_S.define(_e, "x0", _S.prop(_v22, 0))
	_S.define(_e, "y0", _S.prop(_v22, 1))
	_S.define(_e, "ang", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.binary("+", _S.read(_e, "y0"), 19), _S.read(_e, "x0")]), _S.invoke(_S.read(_e, "q"), "range", [_S.unary("-", 0.6), 0.6])))
	_S.define(_e, "sp", _S.invoke(_S.read(_e, "q"), "range", [50, 110]))
	var _v23 = _S.call_value(_S.read(_e, "flight"), [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]), _S.read(_e, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]), _S.read(_e, "sp")), 20), _S.read(_e, "age"), _S.merge([{"floor": 0}])])
	_S.define(_e, "x", _S.prop(_v23, 0))
	_S.define(_e, "y", _S.prop(_v23, 1))
	_S.define(_e, "vx", _S.prop(_v23, 2))
	_S.define(_e, "vy", _S.prop(_v23, 3))
	_S.call_value(_S.read(_e, "spark"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "vx"), _S.read(_e, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life"))), _S.read(_e, "S")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	for _v24 in _S.array(_S.read(_e, "JOLTS")):
		var _v25 = _S.scope(_e)
		var _v26 = _v24
		_S.define(_v25, "f0", _S.prop(_v26, 0))
		_S.define(_v25, "k", _S.prop(_v26, 1))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v25, "f"), _S.read(_v25, "f0")), func(): return _S.binary("<", _S.read(_v25, "f"), _S.binary("+", _S.read(_v25, "f0"), 3)))):
			return _S.merge([{"a": _S.binary("-", _S.read(_v25, "f"), _S.read(_v25, "f0"))}, {"k": _S.read(_v25, "k")}])
	return null
