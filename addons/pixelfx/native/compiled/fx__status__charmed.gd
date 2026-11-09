@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/charmed.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "icon", _S.import_value("fx/status/_lib.js", "icon"))
	_S.define(_e, "bitmap", _S.import_value("fx/status/_lib.js", "bitmap"))
	_S.define(_e, "shaped", _S.import_value("fx/status/_lib.js", "shaped"))
	_S.define(_e, "heartShape", _S.import_value("fx/status/_lib.js", "heartShape"))
	_S.define(_e, "eyes", _S.import_value("fx/status/_lib.js", "eyes"))
	_S.define(_e, "hearts", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Charmed"}, {"desc": "Smitten: a big heart beats over the head, throwing a ring and a flush of light with every beat, little hearts float up, the eyes go pink and the cheeks blush."}, {"tags": ["status", "charm", "love", "hearts", "debuff", "loop"]}, {"size": [60, 76]}, {"origin": [30, 68]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#3a0a1e", "#7a1238", "#c4245a", "#f04e86", "#ff8ab0", "#ffc8da", "#ffffff"]}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SWOON", _S.merge([{"turn": 1.1}, {"fx": _S.unary("-", 2)}, {"fy": _S.unary("-", 28)}, {"bx": 2}, {"by": _S.unary("-", 28)}, {"armsFront": true}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.merge([_S.read(_e, "SWOON"), {"lean": _S.unary("-", 2)}])], [0.6, _S.merge([_S.read(_e, "SWOON"), {"lean": 0}, {"crouch": 1}])], [1.2, _S.merge([_S.read(_e, "SWOON"), {"lean": 2}])], [1.8, _S.merge([_S.read(_e, "SWOON"), {"lean": 0}, {"crouch": 1}])], [2.4, _S.merge([_S.read(_e, "SWOON"), {"lean": _S.unary("-", 2)}])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "BEAT", _S.binary("/", _S.read(_e, "D"), 2))
	_S.define(_e, "HEART5", _S.call_value(_S.read(_e, "bitmap"), [[".#.#.", "#####", "#####", ".###.", "..#.."]]))
	_S.define(_e, "HEART7", _S.call_value(_S.read(_e, "bitmap"), [[".##.##.", "#######", "#######", ".#####.", "..###..", "...#..."]]))
	_S.define(_e, "thump", _S.function_value(_e, "_f7"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "a", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "seed", _S.arg(_args, 4))
	_S.define(_e, "back", _S.arg(_args, 5))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 12, _S.binary("+", _S.read(_e, "seed"), 4), _S.function_value(_e, "_f1"), _S.function_value(_e, "_f2")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.3, 1.9])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	if _S.truth(_S.binary("!==", _S.binary("===", _S.binary("%", _S.read(_e, "i"), 3), 0), _S.read(_e, "back"))):
		return null
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "side", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.5)) else 1))
	_S.define(_e, "ph", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "big", _S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.3))
	_S.define(_e, "x", _S.binary("+", _S.binary("*", _S.read(_e, "side"), _S.invoke(_S.read(_e, "r"), "range", [4, 15])), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 4), _S.read(_e, "ph"))]), 2.2)))
	_S.define(_e, "y", _S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.invoke(_S.read(_e, "r"), "range", [8, 30])), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [14, 22]))))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "u"), 6)]))
	if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.88)):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "q", _S.binary("/", _S.binary("-", _S.read(_v0, "u"), 0.88), 0.12))
		_S.call_value(_S.read(_v0, "sparkle"), [_S.read(_v0, "p"), _S.read(_v0, "x"), _S.read(_v0, "y"), _S.invoke(_S.read(_v0, "Math"), "round", [_S.binary("*", 2, _S.binary("-", 1, _S.read(_v0, "q")))]), _S.prop(_S.read(_v0, "C"), 5), _S.prop(_S.read(_v0, "C"), 4), _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_v0, "q")))])
		return null
	_S.define(_e, "R", ([_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3)] if _S.truth(_S.read(_e, "back")) else [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4)]))
	_S.call_value(_S.read(_e, "icon"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), 4, (_S.read(_e, "HEART7") if _S.truth(_S.read(_e, "big")) else _S.read(_e, "HEART5")), _S.read(_e, "R"), _S.read(_e, "k")])
	if _S.truth(_S.unary("!", _S.read(_e, "back"))):
		_S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "x"), (2 if _S.truth(_S.read(_e, "big")) else 1)), _S.binary("-", _S.read(_e, "y"), 1), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 6, _S.prop(_S.read(_e, "C"), 3), _S.binary("*", (0.12 if _S.truth(_S.read(_e, "back")) else 0.22), _S.read(_e, "k"))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "ph", _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "t"), _S.read(_e, "BEAT")), _S.read(_e, "BEAT")), _S.read(_e, "BEAT")))
	_S.define(_e, "th", _S.call_value(_S.read(_e, "thump"), [_S.read(_e, "ph")]))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.prop(_S.read(_e, "a"), "y"), 8), _S.binary("+", 26, _S.binary("*", 8, _S.read(_e, "th"))), _S.prop(_S.read(_e, "C"), 3), _S.binary("+", 0.16, _S.binary("*", 0.22, _S.read(_e, "th")))])
	_S.call_value(_S.read(_e, "hearts"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "a"), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed"), true])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "ph", _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "t"), _S.read(_e, "BEAT")), _S.read(_e, "BEAT")), _S.read(_e, "BEAT")))
	_S.define(_e, "th", _S.call_value(_S.read(_e, "thump"), [_S.read(_e, "ph")]))
	for _v1 in _S.array(_S.call_value(_S.read(_e, "eyes"), [_S.read(_e, "a")])):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "e", _v1)
		var _v3 = _S.scope(_v2)
		for _v4 in _S.array(_S.prop(_S.read(_v3, "e"), "px")):
			var _v5 = _S.scope(_v3)
			var _v6 = _v4
			_S.define(_v5, "x", _S.prop(_v6, 0))
			_S.define(_v5, "y", _S.prop(_v6, 1))
			_S.invoke(_S.read(_v5, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v5, "a"), "x"), _S.read(_v5, "x")), _S.binary("+", _S.prop(_S.read(_v5, "a"), "y"), _S.read(_v5, "y")), (_S.prop(_S.read(_v5, "C"), 3) if _S.truth(_S.binary("===", _S.read(_v5, "y"), _S.prop(_S.read(_v5, "e"), "y0"))) else _S.prop(_S.read(_v5, "C"), 2))])
		_S.invoke(_S.read(_v3, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v3, "a"), "x"), _S.prop(_S.read(_v3, "e"), "x0")), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v3, "a"), "y"), _S.prop(_S.read(_v3, "e"), "y0")), 1), _S.prop(_S.read(_v3, "C"), 6)])
		_S.define(_v3, "blush", _S.call_value(_S.read(_v3, "mix"), [_S.prop(_S.read(_v3, "e"), "skin"), _S.prop(_S.read(_v3, "C"), 3), 0.55]))
		_S.define(_v3, "out", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.prop(_S.read(_v3, "e"), "x0"), _S.binary("/", _S.prop(_S.read(_v3, "a"), "w"), 2))) else 1))
		_S.define(_v3, "bx", (_S.binary("-", _S.prop(_S.read(_v3, "e"), "x0"), 1) if _S.truth(_S.binary("<", _S.read(_v3, "out"), 0)) else _S.prop(_S.read(_v3, "e"), "x1")))
		_S.invoke(_S.read(_v3, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v3, "a"), "x"), _S.read(_v3, "bx")), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v3, "a"), "y"), _S.prop(_S.read(_v3, "e"), "y1")), 1), _S.read(_v3, "blush")])
		_S.invoke(_S.read(_v3, "p"), "px", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v3, "a"), "x"), _S.read(_v3, "bx")), 1), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v3, "a"), "y"), _S.prop(_S.read(_v3, "e"), "y1")), 1), _S.read(_v3, "blush")])
	_S.call_value(_S.read(_e, "hearts"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "a"), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed"), false])
	_S.define(_e, "hx", 0)
	_S.define(_e, "hy", _S.binary("-", _S.prop(_S.read(_e, "a"), "y"), 10))
	_S.define(_e, "s", _S.binary("*", 5.6, _S.binary("+", 1, _S.binary("*", 0.24, _S.read(_e, "th")))))
	for _v7 in _S.array([[0.04, 1], [0.26, 0.6]]):
		var _v8 = _S.scope(_e)
		var _v9 = _v7
		_S.define(_v8, "t0", _S.prop(_v9, 0))
		_S.define(_v8, "kk", _S.prop(_v9, 1))
		var _v10 = _S.scope(_v8)
		_S.define(_v10, "u", _S.binary("/", _S.binary("-", _S.read(_v10, "ph"), _S.read(_v10, "t0")), 0.5))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v10, "u"), 0), func(): return _S.binary(">", _S.read(_v10, "u"), 1))):
			continue
		_S.define(_v10, "S1", _S.binary("*", 5.6, _S.binary("+", 1.25, _S.binary("*", 1.3, _S.read(_v10, "u")))))
		_S.define(_v10, "outer", _S.call_value(_S.read(_v10, "shaped"), [_S.read(_v10, "heartShape"), _S.read(_v10, "S1")]))
		_S.define(_v10, "inner", _S.call_value(_S.read(_v10, "shaped"), [_S.read(_v10, "heartShape"), _S.binary("-", _S.read(_v10, "S1"), 1.3)]))
		_S.define(_v10, "E", _S.binary("+", _S.invoke(_S.read(_v10, "Math"), "ceil", [_S.binary("*", _S.read(_v10, "S1"), 1.2)]), 1))
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "dy", _S.unary("-", _S.read(_v11, "E")))
		while _S.truth(_S.binary("<=", _S.read(_v11, "dy"), _S.read(_v11, "E"))):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "dx", _S.unary("-", _S.read(_v12, "E")))
			while _S.truth(_S.binary("<=", _S.read(_v12, "dx"), _S.read(_v12, "E"))):
				if _S.truth(_S.logical("&&", _S.call_value(_S.read(_v12, "outer"), [_S.read(_v12, "dx"), _S.read(_v12, "dy")]), func(): return _S.unary("!", _S.call_value(_S.read(_v12, "inner"), [_S.read(_v12, "dx"), _S.read(_v12, "dy")])))):
					_S.invoke(_S.read(_v12, "p"), "dot", [_S.binary("+", _S.read(_v12, "hx"), _S.read(_v12, "dx")), _S.binary("+", _S.read(_v12, "hy"), _S.read(_v12, "dy")), (_S.prop(_S.read(_v12, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v12, "u"), 0.3)) else _S.prop(_S.read(_v12, "C"), 4)), _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_v12, "u")), _S.read(_v12, "kk")), 1.3)])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "dx", 1, "+=", true)
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "dy", 1, "+=", true)
	_S.call_value(_S.read(_e, "icon"), [_S.read(_e, "p"), _S.read(_e, "hx"), _S.read(_e, "hy"), 9, _S.call_value(_S.read(_e, "shaped"), [_S.read(_e, "heartShape"), _S.read(_e, "s")]), [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4)]])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "hx"), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "s"), 0.55)])), _S.binary("-", _S.read(_e, "hy"), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "s"), 0.45)])), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.binary("-", _S.read(_e, "hx"), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "s"), 0.55)])), 1), _S.binary("-", _S.read(_e, "hy"), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "s"), 0.45)])), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "hx"), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "s"), 0.55)])), _S.binary("+", _S.binary("-", _S.read(_e, "hy"), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "s"), 0.45)])), 1), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "hx"), _S.read(_e, "hy"), _S.binary("+", 12, _S.binary("*", 6, _S.read(_e, "th"))), _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.3, _S.binary("*", 0.4, _S.read(_e, "th")))])
	if _S.truth(_S.binary(">", _S.read(_e, "th"), 0.5)):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "hx"), _S.binary("*", _S.read(_e, "s"), 0.9)), _S.binary("-", _S.read(_e, "hy"), _S.binary("*", _S.read(_e, "s"), 0.8)), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", 3, _S.read(_e, "th"))]), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.4, _S.read(_e, "th"))])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 8, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 2), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.3, 0.5])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "an", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "r"), "range", [8, 15]))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "hx"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "an")]), _S.read(_e, "d"))), _S.binary("+", _S.read(_e, "hy"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "an")]), _S.read(_e, "d")), 0.8)), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", 1.6, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "u"))]))]), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "u"))]))])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ph", _S.arg(_args, 0))
	return _S.binary("+", _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "ph"), 0.04), 0.07), 2))]), _S.binary("*", 0.6, _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "ph"), 0.26), 0.07), 2))])))
