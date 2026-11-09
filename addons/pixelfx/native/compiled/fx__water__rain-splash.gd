@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/rain-splash.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "bead", _S.import_value("fx/water/_lib.js", "bead"))
	_S.define(_e, "ring", _S.import_value("fx/water/_lib.js", "ring"))
	_S.define(_e, "drops", _S.function_value(_e, "_f0"))
	_S.define(_e, "field", _S.function_value(_e, "_f2"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f3"))
	_S.define(_e, "crown", _S.function_value(_e, "_f8"))
	_S.define(_e, "draw", _S.function_value(_e, "_f11"))
	_S.define(_e, "meta", _S.merge([{"name": "Rain splash"}, {"desc": "A low close-up on one puddle in the rain: big drops land in crowns that throw beads and a rebound jet, rings spread and interfere, a lamp's reflection wobbles on the water."}, {"tags": ["water", "rain", "splash", "puddle", "close-up", "ambient", "loop"]}, {"size": [176, 80]}, {"origin": [88, 50]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SY", 0.3)
	_S.define(_e, "RX", 92)
	_S.define(_e, "G", 640)
	_S.define(_e, "N", 8)
	_S.define(_e, "LAMP", 34)
	_S.define(_e, "ageOf", _S.function_value(_e, "_f15"))
	_S.define(_e, "ringR", _S.function_value(_e, "_f16"))
	_S.define(_e, "ringK", _S.function_value(_e, "_f17"))
	_S.define(_e, "crownH", _S.function_value(_e, "_f18"))
	_S.define(_e, "crownR", _S.function_value(_e, "_f19"))
	_S.define(_e, "jetH", _S.function_value(_e, "_f20"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "S", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "N")}]), _S.function_value(_e, "_f1")])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"x": _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.read(_e, "S")]), 0.5), 120)}, {"z": _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.binary("+", _S.read(_e, "S"), 1)]), 0.5), 50)}, {"t0": _S.binary("*", _S.binary("/", _S.binary("+", _S.read(_e, "i"), _S.binary("*", 0.25, _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.binary("+", _S.read(_e, "S"), 2)]))), _S.read(_e, "N")), _S.read(_e, "D"))}, {"H": _S.binary("+", 10, _S.binary("*", 4, _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.binary("+", _S.read(_e, "S"), 3)])))}, {"J": _S.binary("+", 7, _S.binary("*", 4, _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.binary("+", _S.read(_e, "S"), 4)])))}, {"spin": _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.binary("+", _S.read(_e, "S"), 5)]), _S.read(_e, "TAU"))}, {"i": _S.read(_e, "i")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "z", _S.arg(_args, 1))
	_S.define(_e, "list", _S.arg(_args, 2))
	_S.define(_e, "h", 0)
	for _v0 in _S.array(_S.read(_e, "list")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "q", _v0)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "dx", _S.binary("-", _S.read(_v2, "x"), _S.prop(_S.read(_v2, "q"), "x")))
		if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v2, "dx"), _S.binary("+", _S.prop(_S.read(_v2, "q"), "R"), 10)), func(): return _S.binary("<", _S.read(_v2, "dx"), _S.binary("-", _S.unary("-", _S.prop(_S.read(_v2, "q"), "R")), 10)))):
			continue
		_S.define(_v2, "d", _S.binary("-", _S.invoke(_S.read(_v2, "Math"), "hypot", [_S.read(_v2, "dx"), _S.binary("-", _S.read(_v2, "z"), _S.prop(_S.read(_v2, "q"), "z"))]), _S.prop(_S.read(_v2, "q"), "R")))
		_S.define(_v2, "w", _S.binary("+", 3.6, _S.binary("*", _S.prop(_S.read(_v2, "q"), "a"), 3)))
		if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v2, "d"), _S.binary("*", 2, _S.read(_v2, "w"))), func(): return _S.binary("<", _S.read(_v2, "d"), _S.binary("*", _S.unary("-", 3), _S.read(_v2, "w"))))):
			continue
		_S.write(_v2, "h", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v2, "q"), "k"), _S.invoke(_S.read(_v2, "Math"), "cos", [_S.binary("*", _S.read(_v2, "d"), 1.1)])), _S.invoke(_S.read(_v2, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.read(_v2, "d"), _S.read(_v2, "w")), 2))])), "+=", false)
	return _S.read(_e, "h")

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "ry", _S.binary("*", _S.read(_e, "RX"), _S.read(_e, "SY")))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "list", _S.invoke(_S.invoke(_S.invoke(_S.call_value(_S.read(_e, "drops"), [_S.read(_e, "S")]), "map", [_S.function_value(_e, "_f4")]), "filter", [_S.function_value(_e, "_f5")]), "map", [_S.function_value(_e, "_f6")]))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "Y", _S.invoke(_S.read(_v3, "Math"), "floor", [_S.unary("-", _S.read(_v3, "ry"))]))
	while _S.truth(_S.binary("<", _S.read(_v3, "Y"), _S.read(_v3, "ry"))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "y", _S.binary("+", _S.read(_v4, "Y"), 0.5))
		_S.define(_v4, "z", _S.binary("/", _S.read(_v4, "y"), _S.read(_v4, "SY")))
		_S.define(_v4, "act", _S.invoke(_S.read(_v4, "list"), "filter", [_S.function_value(_v4, "_f7")]))
		_S.define(_v4, "far", _S.binary("/", _S.binary("+", _S.read(_v4, "y"), _S.read(_v4, "ry")), _S.binary("*", 2, _S.read(_v4, "ry"))))
		_S.define(_v4, "dashW", _S.binary("*", _S.binary("+", 1.5, _S.binary("*", _S.read(_v4, "far"), 4)), _S.binary("+", 0.35, _S.binary("*", 0.65, _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v4, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v4, "Y"), 1.73), _S.binary("*", _S.binary("*", _S.read(_v4, "ph"), _S.read(_v4, "TAU")), 3)), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.binary("*", _S.read(_v4, "Y"), 0.61)]), 3))])))))))
		_S.define(_v4, "hPrev", 0)
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "X", _S.unary("-", 88))
		while _S.truth(_S.binary("<", _S.read(_v5, "X"), 88)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "x", _S.binary("+", _S.read(_v6, "X"), 0.5))
			_S.define(_v6, "d", _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_v6, "x"), _S.read(_v6, "RX")), 2), _S.binary("**", _S.binary("/", _S.read(_v6, "y"), _S.read(_v6, "ry")), 2)))
			if _S.truth(_S.binary(">", _S.read(_v6, "d"), 1)):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "X", 1, "+=", true)
				continue
			_S.define(_v6, "edge", _S.invoke(_S.read(_v6, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_v6, "d")), 6)]))
			_S.invoke(_S.read(_v6, "p"), "blend", [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.prop(_S.read(_v6, "C"), 0), _S.binary("*", _S.binary("+", 0.62, _S.binary("*", 0.2, _S.read(_v6, "far"))), _S.read(_v6, "edge"))])
			if _S.truth(_S.binary("<", _S.read(_v6, "far"), 0.45)):
				_S.invoke(_S.read(_v6, "p"), "blend", [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.prop(_S.read(_v6, "C"), 2), _S.binary("*", _S.binary("*", 0.3, _S.binary("-", 1, _S.binary("/", _S.read(_v6, "far"), 0.45))), _S.read(_v6, "edge"))])
			_S.define(_v6, "h", (_S.call_value(_S.read(_v6, "field"), [_S.read(_v6, "x"), _S.read(_v6, "z"), _S.read(_v6, "act")]) if _S.truth(_S.prop(_S.read(_v6, "act"), "length")) else 0))
			_S.define(_v6, "hx", _S.binary("-", _S.read(_v6, "h"), _S.read(_v6, "hPrev")))
			_S.write(_v6, "hPrev", _S.read(_v6, "h"), "=", false)
			if _S.truth(_S.binary(">", _S.read(_v6, "h"), 0.24)):
				_S.invoke(_S.read(_v6, "p"), "blend", [_S.read(_v6, "x"), _S.read(_v6, "y"), (_S.prop(_S.read(_v6, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v6, "h"), 0.75)) else _S.prop(_S.read(_v6, "C"), 4)), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "min", [0.95, _S.binary("*", _S.binary("-", _S.read(_v6, "h"), 0.24), 2.2)]), _S.read(_v6, "edge"))])
			else:
				if _S.truth(_S.binary("<", _S.read(_v6, "h"), _S.unary("-", 0.4))):
					_S.invoke(_S.read(_v6, "p"), "blend", [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.prop(_S.read(_v6, "C"), 0), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "min", [0.85, _S.binary("*", _S.binary("-", _S.unary("-", _S.read(_v6, "h")), 0.4), 1.8)]), _S.read(_v6, "edge"))])
			if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v6, "x"), _S.binary("-", _S.read(_v6, "LAMP"), 14)), func(): return _S.binary(">", _S.read(_v6, "x"), _S.binary("+", _S.read(_v6, "LAMP"), 14)))):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "X", 1, "+=", true)
				continue
			_S.define(_v6, "lx", _S.invoke(_S.read(_v6, "Math"), "abs", [_S.binary("-", _S.binary("-", _S.binary("-", _S.read(_v6, "x"), _S.read(_v6, "LAMP")), _S.binary("*", _S.read(_v6, "hx"), 9)), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v6, "y"), 0.8), _S.binary("*", _S.binary("*", _S.read(_v6, "ph"), _S.read(_v6, "TAU")), 2))]), 1.4))]))
			if _S.truth(_S.binary("<", _S.read(_v6, "lx"), _S.read(_v6, "dashW"))):
				var _v7 = _S.scope(_v6)
				_S.define(_v7, "k", _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_v7, "lx"), _S.read(_v7, "dashW"))), _S.read(_v7, "edge")))
				_S.invoke(_S.read(_v7, "p"), "px", [_S.read(_v7, "X"), _S.read(_v7, "Y"), (_S.read(_v7, "WHITE") if _S.truth(_S.binary(">", _S.read(_v7, "k"), 0.72)) else (_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v7, "k"), 0.35)) else _S.prop(_S.read(_v7, "C"), 5)))])
				_S.invoke(_S.read(_v7, "p"), "light", [_S.read(_v7, "x"), _S.read(_v7, "y"), _S.prop(_S.read(_v7, "C"), 5), _S.binary("*", 0.2, _S.read(_v7, "k"))])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "X", 1, "+=", true)
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "Y", 1, "+=", true)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "X", _S.unary("-", 82))
	while _S.truth(_S.binary("<", _S.read(_v8, "X"), 82)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "x", _S.binary("+", _S.read(_v9, "X"), 0.5))
		_S.define(_v9, "y", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v9, "Math"), "sqrt", [_S.invoke(_S.read(_v9, "Math"), "max", [0, _S.binary("-", 1, _S.binary("**", _S.binary("/", _S.read(_v9, "x"), _S.read(_v9, "RX")), 2))])])), _S.read(_v9, "ry")))
		_S.invoke(_S.read(_v9, "p"), "px", [_S.read(_v9, "X"), _S.binary("+", _S.read(_v9, "y"), 0.5), (_S.prop(_S.read(_v9, "C"), 6) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v9, "Math"), "abs", [_S.binary("-", _S.read(_v9, "x"), _S.read(_v9, "LAMP"))]), 10)) else _S.prop(_S.read(_v9, "C"), 3))])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "X", 1, "+=", true)
	for _v10 in _S.array(_S.call_value(_S.read(_e, "drops"), [_S.read(_e, "S")])):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "q", _v10)
		_S.call_value(_S.read(_v11, "crown"), [_S.read(_v11, "p"), _S.read(_v11, "C"), _S.read(_v11, "q"), _S.call_value(_S.read(_v11, "ageOf"), [_S.read(_v11, "t"), _S.prop(_S.read(_v11, "q"), "t0")]), true])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "q"), {"a": _S.call_value(_S.read(_e, "ageOf"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "q"), "t0")])}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.binary("<", _S.prop(_S.read(_e, "q"), "a"), 1.8)

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "q"), {"R": _S.call_value(_S.read(_e, "ringR"), [_S.prop(_S.read(_e, "q"), "a")])}, {"k": _S.call_value(_S.read(_e, "ringK"), [_S.prop(_S.read(_e, "q"), "a")])}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "z"), _S.prop(_S.read(_e, "q"), "z"))]), _S.binary("+", _S.prop(_S.read(_e, "q"), "R"), 12))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "q", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "back", _S.arg(_args, 4))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "crownH"), [_S.read(_e, "a"), _S.prop(_S.read(_e, "q"), "H")]))
	if _S.truth(_S.binary("<", _S.read(_e, "h"), 1)):
		return null
	_S.define(_e, "r0", _S.call_value(_S.read(_e, "crownR"), [_S.read(_e, "a")]))
	_S.define(_e, "cy", _S.binary("*", _S.prop(_S.read(_e, "q"), "z"), _S.read(_e, "SY")))
	var _v12 = _S.scope(_e)
	_S.define(_v12, "f", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "f"), 10)):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "ang", _S.binary("+", _S.prop(_S.read(_v13, "q"), "spin"), _S.binary("*", _S.binary("/", _S.read(_v13, "f"), 10), _S.read(_v13, "TAU"))))
		_S.define(_v13, "s", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "ang")]))
		if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_v13, "s"), 0), _S.read(_v13, "back"))):
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "f", 1, "+=", true)
			continue
		_S.define(_v13, "tip", _S.binary("*", _S.read(_v13, "h"), _S.binary("+", 0.75, _S.binary("*", 0.25, _S.call_value(_S.read(_v13, "rand"), [_S.prop(_S.read(_v13, "q"), "i"), _S.read(_v13, "f"), 7])))))
		_S.define(_v13, "lean", _S.binary("*", 0.35, _S.read(_v13, "tip")))
		_S.define(_v13, "x0", _S.binary("+", _S.prop(_S.read(_v13, "q"), "x"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "ang")]), _S.read(_v13, "r0"))))
		_S.define(_v13, "y0", _S.binary("+", _S.read(_v13, "cy"), _S.binary("*", _S.binary("*", _S.read(_v13, "s"), _S.read(_v13, "r0")), _S.read(_v13, "SY"))))
		_S.define(_v13, "x1", _S.binary("+", _S.prop(_S.read(_v13, "q"), "x"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "ang")]), _S.binary("+", _S.read(_v13, "r0"), _S.read(_v13, "lean")))))
		_S.define(_v13, "y1", _S.binary("-", _S.binary("+", _S.read(_v13, "cy"), _S.binary("*", _S.binary("*", _S.read(_v13, "s"), _S.binary("+", _S.read(_v13, "r0"), _S.read(_v13, "lean"))), _S.read(_v13, "SY"))), _S.read(_v13, "tip")))
		_S.invoke(_S.read(_v13, "p"), "line", [_S.read(_v13, "x0"), _S.read(_v13, "y0"), _S.read(_v13, "x1"), _S.read(_v13, "y1"), (_S.function_value(_v13, "_f9") if _S.truth(_S.read(_v13, "back")) else _S.function_value(_v13, "_f10"))])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v13, "a"), 0.08), func(): return _S.binary("<", _S.read(_v13, "a"), 0.17))):
			_S.invoke(_S.read(_v13, "p"), "px", [_S.read(_v13, "x1"), _S.binary("-", _S.read(_v13, "y1"), 1), (_S.prop(_S.read(_v13, "C"), 5) if _S.truth(_S.read(_v13, "back")) else _S.read(_v13, "WHITE"))])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "f", 1, "+=", true)
	if _S.truth(_S.unary("!", _S.read(_e, "back"))):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "q"), "x"), _S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "h"), 0.6)), _S.binary("+", 6, _S.binary("*", _S.read(_e, "h"), 0.6)), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.3, _S.binary("/", _S.read(_e, "h"), _S.prop(_S.read(_e, "q"), "H")))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.7)) else _S.prop(_S.read(_e, "C"), 3))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.75)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.35)) else _S.prop(_S.read(_e, "C"), 5)))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	for _v14 in _S.array(_S.call_value(_S.read(_e, "drops"), [_S.read(_e, "S")])):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "q", _v14)
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "a", _S.call_value(_S.read(_v16, "ageOf"), [_S.read(_v16, "t"), _S.prop(_S.read(_v16, "q"), "t0")]))
		_S.define(_v16, "cy", _S.binary("*", _S.prop(_S.read(_v16, "q"), "z"), _S.read(_v16, "SY")))
		_S.define(_v16, "pre", _S.binary("-", _S.read(_v16, "D"), _S.read(_v16, "a")))
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v16, "pre"), 0.14), func(): return _S.binary(">", _S.binary("-", _S.binary("-", _S.read(_v16, "cy"), _S.binary("*", _S.read(_v16, "pre"), 520)), 10), _S.unary("-", 48)))):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "y", _S.binary("-", _S.read(_v17, "cy"), _S.binary("*", _S.read(_v17, "pre"), 520)))
			_S.invoke(_S.read(_v17, "p"), "line", [_S.prop(_S.read(_v17, "q"), "x"), _S.binary("-", _S.read(_v17, "y"), 10), _S.prop(_S.read(_v17, "q"), "x"), _S.binary("-", _S.read(_v17, "y"), 4), _S.prop(_S.read(_v17, "C"), 4)])
			_S.invoke(_S.read(_v17, "p"), "line", [_S.prop(_S.read(_v17, "q"), "x"), _S.binary("-", _S.read(_v17, "y"), 4), _S.prop(_S.read(_v17, "q"), "x"), _S.read(_v17, "y"), _S.prop(_S.read(_v17, "C"), 6)])
		if _S.truth(_S.binary("<", _S.read(_v16, "a"), 0.05)):
			var _v18 = _S.scope(_v16)
			_S.invoke(_S.read(_v18, "p"), "px", [_S.prop(_S.read(_v18, "q"), "x"), _S.read(_v18, "cy"), _S.read(_v18, "WHITE")])
			_S.invoke(_S.read(_v18, "p"), "glow", [_S.prop(_S.read(_v18, "q"), "x"), _S.binary("-", _S.read(_v18, "cy"), 2), 12, _S.prop(_S.read(_v18, "C"), 5), _S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.read(_v18, "a"), 0.05)))])
		_S.call_value(_S.read(_v16, "crown"), [_S.read(_v16, "p"), _S.read(_v16, "C"), _S.read(_v16, "q"), _S.read(_v16, "a"), false])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v16, "a"), 0.16), func(): return _S.binary("<", _S.read(_v16, "a"), 0.8))):
			var _v19 = _S.scope(_v16)
			_S.define(_v19, "f", 0)
			while _S.truth(_S.binary("<", _S.read(_v19, "f"), 10)):
				var _v20 = _S.scope(_v19)
				_S.define(_v20, "ang", _S.binary("+", _S.prop(_S.read(_v20, "q"), "spin"), _S.binary("*", _S.binary("/", _S.read(_v20, "f"), 10), _S.read(_v20, "TAU"))))
				_S.define(_v20, "tip", _S.binary("*", _S.call_value(_S.read(_v20, "crownH"), [0.16, _S.prop(_S.read(_v20, "q"), "H")]), _S.binary("+", 0.75, _S.binary("*", 0.25, _S.call_value(_S.read(_v20, "rand"), [_S.prop(_S.read(_v20, "q"), "i"), _S.read(_v20, "f"), 7])))))
				_S.define(_v20, "r0", _S.binary("+", _S.call_value(_S.read(_v20, "crownR"), [0.16]), _S.binary("*", _S.read(_v20, "tip"), 0.35)))
				_S.define(_v20, "v", _S.binary("+", 22, _S.binary("*", 18, _S.call_value(_S.read(_v20, "rand"), [_S.prop(_S.read(_v20, "q"), "i"), _S.read(_v20, "f"), 8]))))
				_S.define(_v20, "vh", _S.binary("+", 40, _S.binary("*", 30, _S.call_value(_S.read(_v20, "rand"), [_S.prop(_S.read(_v20, "q"), "i"), _S.read(_v20, "f"), 9]))))
				_S.define(_v20, "tt", _S.binary("-", _S.read(_v20, "a"), 0.16))
				_S.define(_v20, "hh", _S.binary("-", _S.binary("+", _S.read(_v20, "tip"), _S.binary("*", _S.read(_v20, "vh"), _S.read(_v20, "tt"))), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_v20, "G")), _S.read(_v20, "tt")), _S.read(_v20, "tt"))))
				_S.define(_v20, "bx", _S.binary("+", _S.prop(_S.read(_v20, "q"), "x"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "ang")]), _S.binary("+", _S.read(_v20, "r0"), _S.binary("*", _S.read(_v20, "v"), _S.read(_v20, "tt"))))))
				_S.define(_v20, "bz", _S.binary("+", _S.prop(_S.read(_v20, "q"), "z"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "ang")]), _S.binary("+", _S.read(_v20, "r0"), _S.binary("*", _S.read(_v20, "v"), _S.read(_v20, "tt"))))))
				_S.define(_v20, "by", _S.binary("*", _S.read(_v20, "bz"), _S.read(_v20, "SY")))
				if _S.truth(_S.binary(">", _S.read(_v20, "hh"), 0)):
					_S.call_value(_S.read(_v20, "bead"), [_S.read(_v20, "p"), _S.read(_v20, "bx"), _S.binary("-", _S.read(_v20, "by"), _S.read(_v20, "hh")), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "ang")]), _S.read(_v20, "v")), _S.binary("+", _S.unary("-", _S.binary("-", _S.read(_v20, "vh"), _S.binary("*", _S.read(_v20, "G"), _S.read(_v20, "tt")))), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "ang")]), _S.read(_v20, "v")), _S.read(_v20, "SY"))), (2 if _S.truth(_S.binary("<", _S.call_value(_S.read(_v20, "rand"), [_S.prop(_S.read(_v20, "q"), "i"), _S.read(_v20, "f"), 10]), 0.4)) else 1), _S.read(_v20, "C")])
				else:
					var _v21 = _S.scope(_v20)
					_S.define(_v21, "land", _S.binary("/", _S.binary("+", _S.read(_v21, "vh"), _S.invoke(_S.read(_v21, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_v21, "vh"), _S.read(_v21, "vh")), _S.binary("*", _S.binary("*", 2, _S.read(_v21, "G")), _S.read(_v21, "tip")))])), _S.read(_v21, "G")))
					_S.define(_v21, "since", _S.binary("-", _S.read(_v21, "tt"), _S.read(_v21, "land")))
					if _S.truth(_S.binary("<", _S.read(_v21, "since"), 0.05)):
						_S.invoke(_S.read(_v21, "p"), "px", [_S.read(_v21, "bx"), _S.read(_v21, "by"), _S.read(_v21, "WHITE")])
					if _S.truth(_S.binary("<", _S.read(_v21, "since"), 0.35)):
						_S.call_value(_S.read(_v21, "ring"), [_S.read(_v21, "p"), _S.read(_v21, "bx"), _S.read(_v21, "by"), _S.binary("+", 1, _S.binary("*", _S.read(_v21, "since"), 12)), _S.read(_v21, "SY"), _S.binary("-", 1, _S.binary("/", _S.read(_v21, "since"), 0.35)), _S.read(_v21, "C"), _S.merge([{"n": 1}, {"half": 1}, {"seed": _S.binary("+", _S.binary("*", _S.prop(_S.read(_v21, "q"), "i"), 10), _S.read(_v21, "f"))}])])
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "f", 2, "+=", false)
		_S.define(_v16, "jh", _S.call_value(_S.read(_v16, "jetH"), [_S.read(_v16, "a"), _S.prop(_S.read(_v16, "q"), "J")]))
		if _S.truth(_S.binary(">", _S.read(_v16, "jh"), 0.8)):
			var _v22 = _S.scope(_v16)
			_S.invoke(_S.read(_v22, "p"), "line", [_S.prop(_S.read(_v22, "q"), "x"), _S.binary("-", _S.read(_v22, "cy"), 1), _S.prop(_S.read(_v22, "q"), "x"), _S.binary("-", _S.read(_v22, "cy"), _S.read(_v22, "jh")), _S.function_value(_v22, "_f12")])
			_S.invoke(_S.read(_v22, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v22, "q"), "x"), 1), _S.binary("-", _S.read(_v22, "cy"), 1), _S.prop(_S.read(_v22, "C"), 5)])
			if _S.truth(_S.binary("<", _S.read(_v22, "a"), 0.41)):
				_S.invoke(_S.read(_v22, "p"), "circle", [_S.prop(_S.read(_v22, "q"), "x"), _S.binary("-", _S.binary("-", _S.read(_v22, "cy"), _S.read(_v22, "jh")), 0.5), 1.2, _S.prop(_S.read(_v22, "C"), 6)])
			_S.invoke(_S.read(_v22, "p"), "glow", [_S.prop(_S.read(_v22, "q"), "x"), _S.binary("-", _S.read(_v22, "cy"), _S.binary("*", _S.read(_v22, "jh"), 0.6)), 6, _S.prop(_S.read(_v22, "C"), 5), 0.3])
		_S.define(_v16, "ba", _S.binary("-", _S.read(_v16, "a"), 0.41))
		_S.define(_v16, "bh", _S.binary("-", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v16, "q"), "J"), 1), _S.binary("*", 24, _S.read(_v16, "ba"))), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_v16, "G")), _S.read(_v16, "ba")), _S.read(_v16, "ba"))))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v16, "ba"), 0), func(): return _S.binary(">", _S.read(_v16, "bh"), 0))):
			var _v23 = _S.scope(_v16)
			_S.invoke(_S.read(_v23, "p"), "circle", [_S.prop(_S.read(_v23, "q"), "x"), _S.binary("-", _S.read(_v23, "cy"), _S.read(_v23, "bh")), 1.1, _S.prop(_S.read(_v23, "C"), 6)])
			_S.invoke(_S.read(_v23, "p"), "px", [_S.prop(_S.read(_v23, "q"), "x"), _S.binary("-", _S.binary("-", _S.read(_v23, "cy"), _S.read(_v23, "bh")), 1), _S.read(_v23, "WHITE")])
	for _v24 in _S.array(_S.call_value(_S.read(_e, "drops"), [_S.read(_e, "S")])):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "q", _v24)
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "a", _S.call_value(_S.read(_v26, "ageOf"), [_S.read(_v26, "t"), _S.prop(_S.read(_v26, "q"), "t0")]))
		if _S.truth(_S.binary("<", _S.read(_v26, "a"), 1.8)):
			_S.call_value(_S.read(_v26, "ring"), [_S.read(_v26, "p"), _S.prop(_S.read(_v26, "q"), "x"), _S.binary("*", _S.prop(_S.read(_v26, "q"), "z"), _S.read(_v26, "SY")), _S.call_value(_S.read(_v26, "ringR"), [_S.read(_v26, "a")]), _S.read(_v26, "SY"), _S.binary("*", 0.75, _S.call_value(_S.read(_v26, "ringK"), [_S.read(_v26, "a")])), _S.read(_v26, "C"), _S.merge([{"n": 1}, {"half": 1}, {"hot": _S.binary("<", _S.read(_v26, "a"), 0.1)}, {"seed": _S.prop(_S.read(_v26, "q"), "i")}, {"wob": _S.binary("+", 0.5, _S.read(_v26, "a"))}])])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 16, _S.binary("+", _S.read(_e, "S"), 20), 0.5, _S.function_value(_e, "_f13")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "LAMP"), _S.unary("-", 6), 30, _S.prop(_S.read(_e, "C"), 4), 0.16])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "C"), 6))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "x", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 80), 80]))
	_S.define(_e, "z", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 26), 26]))
	_S.define(_e, "y", _S.binary("*", _S.read(_e, "z"), _S.read(_e, "SY")))
	_S.define(_e, "s", _S.binary("-", _S.read(_e, "age"), 0.1))
	if _S.truth(_S.binary("<", _S.read(_e, "s"), 0)):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "yy", _S.binary("-", _S.read(_v27, "y"), _S.binary("*", _S.binary("-", 0.1, _S.read(_v27, "age")), 600)))
		if _S.truth(_S.binary("<", _S.binary("-", _S.read(_v27, "yy"), 6), _S.unary("-", 48))):
			return null
		_S.invoke(_S.read(_v27, "p"), "line", [_S.read(_v27, "x"), _S.binary("-", _S.read(_v27, "yy"), 6), _S.read(_v27, "x"), _S.read(_v27, "yy"), _S.function_value(_v27, "_f14")])
	else:
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "s"), 0.4), func(): return _S.binary("<", _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "RX")), 2), _S.binary("**", _S.binary("/", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "RX"), _S.read(_e, "SY"))), 2)), 0.9))):
			var _v28 = _S.scope(_e)
			if _S.truth(_S.binary("<", _S.read(_v28, "s"), 0.04)):
				_S.invoke(_S.read(_v28, "p"), "px", [_S.read(_v28, "x"), _S.read(_v28, "y"), _S.prop(_S.read(_v28, "C"), 6)])
			_S.call_value(_S.read(_v28, "ring"), [_S.read(_v28, "p"), _S.read(_v28, "x"), _S.read(_v28, "y"), _S.binary("+", 1, _S.binary("*", _S.read(_v28, "s"), 9)), _S.read(_v28, "SY"), _S.binary("*", 0.8, _S.binary("-", 1, _S.binary("/", _S.read(_v28, "s"), 0.4))), _S.read(_v28, "C"), _S.merge([{"n": 1}, {"half": 1}, {"seed": 40}])])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "C"), 3))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "t0", _S.arg(_args, 1))
	return _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "t0")), _S.read(_e, "D")), _S.read(_e, "D")), _S.read(_e, "D"))

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.binary("+", 3, _S.binary("*", 34, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("/", _S.read(_e, "a"), 1.8), 0.7])))

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return (_S.binary("*", _S.binary("*", 1.3, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.read(_e, "a"), 1.8)), 1.3])), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "a"), 0.06)])) if _S.truth(_S.binary("<", _S.read(_e, "a"), 1.8)) else 0)

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "H", _S.arg(_args, 1))
	return _S.binary("*", _S.binary("*", _S.read(_e, "H"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "a"), 0.3)]))]), 0.8])), (1 if _S.truth(_S.binary("<", _S.read(_e, "a"), 0.3)) else 0))

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.binary("+", 1.5, _S.binary("*", 4.5, _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "a"), 0.3)])])))

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "J", _S.arg(_args, 1))
	return (_S.binary("*", _S.read(_e, "J"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.binary("-", _S.read(_e, "a"), 0.26)), 0.3)])) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "a"), 0.26), func(): return _S.binary("<", _S.read(_e, "a"), 0.56))) else 0)
