@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/eclipse.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "halo", _S.import_value("fx/shadow/_lib.js", "halo"))
	_S.define(_e, "unlight", _S.import_value("fx/shadow/_lib.js", "unlight"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Eclipse"}, {"desc": "A black moon over the sun: a breathing pearl corona with long streamers, a thin white rim, and one diamond bead blazing on its edge."}, {"tags": ["shadow", "eclipse", "moon", "sun", "corona", "sky", "magic", "loop"]}, {"size": [160, 144]}, {"origin": [80, 72]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"pearl": ["#5a4f8a", "#a99be0", "#e6defa", "#fffaf2"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "R", 19)
	_S.define(_e, "D", 4)
	_S.define(_e, "BEAD", _S.unary("-", 0.72))
	_S.define(_e, "breathe", _S.function_value(_e, "_f7"))
	_S.define(_e, "STREAMS", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 30}]), _S.function_value(_e, "_f8")]))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "Q", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "pearl"), 4]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 26, _S.read(_e, "S"), _S.function_value(_e, "_f1"), _S.function_value(_e, "_f2")])
	_S.define(_e, "b", _S.binary("+", 1, _S.binary("*", 0.08, _S.call_value(_S.read(_e, "breathe"), [_S.read(_e, "t"), 1, 0]))))
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, _S.binary("*", 72, _S.read(_e, "b")), _S.prop(_S.read(_e, "C"), 4), 0.38])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, _S.binary("*", 46, _S.read(_e, "b")), _S.prop(_S.read(_e, "Q"), 1), 0.34])
	for _v0 in _S.array(_S.read(_e, "STREAMS")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "L", _S.binary("*", _S.prop(_S.read(_v2, "s"), "len"), _S.binary("+", 1, _S.binary("*", 0.18, _S.call_value(_S.read(_v2, "breathe"), [_S.read(_v2, "t"), _S.prop(_S.read(_v2, "s"), "k"), _S.prop(_S.read(_v2, "s"), "ph")])))))
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "d", 4)
		while _S.truth(_S.binary("<=", _S.read(_v3, "d"), _S.read(_v3, "L"))):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "u", _S.binary("/", _S.read(_v4, "d"), _S.read(_v4, "L")))
			_S.define(_v4, "a", _S.binary("+", _S.prop(_S.read(_v4, "s"), "a"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v4, "s"), "curl"), _S.read(_v4, "d")), _S.read(_v4, "d"))))
			_S.define(_v4, "r", _S.binary("+", _S.binary("+", _S.read(_v4, "R"), 1), _S.read(_v4, "d")))
			_S.define(_v4, "x", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "r")))
			_S.define(_v4, "y", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "r")))
			_S.invoke(_S.read(_v4, "p"), "dot", [_S.read(_v4, "x"), _S.read(_v4, "y"), (_S.prop(_S.read(_v4, "Q"), 2) if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.3)) else (_S.prop(_S.read(_v4, "Q"), 1) if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.65)) else _S.prop(_S.read(_v4, "C"), 5))), (1 if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.75)) else _S.binary("*", _S.binary("-", 1, _S.read(_v4, "u")), 4))])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "d", 0.5, "+=", false)
		_S.invoke(_S.read(_v2, "p"), "glowLine", [_S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.prop(_S.read(_v2, "s"), "a")]), _S.binary("+", _S.read(_v2, "R"), 4)), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.prop(_S.read(_v2, "s"), "a")]), _S.binary("+", _S.read(_v2, "R"), 4)), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.prop(_S.read(_v2, "s"), "a")]), _S.binary("+", _S.read(_v2, "R"), _S.binary("*", _S.read(_v2, "L"), 0.6))), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.prop(_S.read(_v2, "s"), "a")]), _S.binary("+", _S.read(_v2, "R"), _S.binary("*", _S.read(_v2, "L"), 0.6))), 3, _S.prop(_S.read(_v2, "Q"), 1), 0.12])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.2, 2.6])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "x", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 78), 78]))
	_S.define(_e, "y", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 70), 70]))
	if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y")]), _S.binary("+", _S.read(_e, "R"), 22))):
		return null
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "age")), _S.read(_e, "L"))]))
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.7)) else _S.prop(_S.read(_e, "Q"), 1)), _S.binary("*", _S.read(_e, "k"), 1.2)])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0.85), func(): return _S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.4))):
		_S.last([_S.invoke(_S.read(_e, "p"), "dot", [_S.binary("-", _S.read(_e, "x"), 1), _S.read(_e, "y"), _S.prop(_S.read(_e, "Q"), 0), 0.8]), _S.invoke(_S.read(_e, "p"), "dot", [_S.binary("+", _S.read(_e, "x"), 1), _S.read(_e, "y"), _S.prop(_S.read(_e, "Q"), 0), 0.8])])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "Q", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "pearl"), 4]))
	_S.define(_e, "b", _S.binary("+", 1, _S.binary("*", 0.08, _S.call_value(_S.read(_e, "breathe"), [_S.read(_e, "t"), 1, 0]))))
	_S.define(_e, "W", _S.binary("+", _S.read(_e, "R"), 10))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", _S.read(_e, "W")), _S.unary("-", _S.read(_e, "W")), _S.read(_e, "W"), _S.read(_e, "W"), _S.function_value(_e, "_f4")])
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", _S.read(_e, "R")), _S.unary("-", _S.read(_e, "R")), _S.read(_e, "R"), _S.read(_e, "R"), _S.function_value(_e, "_f5")])
	_S.define(_e, "bx", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "BEAD")]), _S.binary("+", _S.read(_e, "R"), 0.4)))
	_S.define(_e, "by", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "BEAD")]), _S.binary("+", _S.read(_e, "R"), 0.4)))
	_S.define(_e, "k", _S.binary("+", 0.75, _S.binary("*", 0.25, _S.call_value(_S.read(_e, "breathe"), [_S.read(_e, "t"), 2, 1]))))
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), 8)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "a", _S.binary("+", _S.binary("/", _S.binary("*", _S.read(_v6, "i"), _S.prop(_S.read(_v6, "Math"), "PI")), 4), 0.12))
		_S.define(_v6, "len", _S.binary("*", _S.binary("*", (7 if _S.truth(_S.binary("%", _S.read(_v6, "i"), 2)) else 22), _S.read(_v6, "k")), (1.6 if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v6, "i"), 1), func(): return _S.binary("===", _S.read(_v6, "i"), 5))) else 1)))
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "d", 1)
		while _S.truth(_S.binary("<=", _S.read(_v7, "d"), _S.read(_v7, "len"))):
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "u", _S.binary("/", _S.read(_v8, "d"), _S.read(_v8, "len")))
			_S.define(_v8, "x", _S.binary("+", _S.read(_v8, "bx"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "d"))))
			_S.define(_v8, "y", _S.binary("+", _S.read(_v8, "by"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "d"))))
			if _S.truth(_S.binary("<", _S.binary("+", _S.binary("*", _S.read(_v8, "x"), _S.read(_v8, "x")), _S.binary("*", _S.read(_v8, "y"), _S.read(_v8, "y"))), _S.binary("**", _S.binary("-", _S.read(_v8, "R"), 0.5), 2))):
				break
			_S.invoke(_S.read(_v8, "p"), "dot", [_S.read(_v8, "x"), _S.read(_v8, "y"), (_S.read(_v8, "WHITE") if _S.truth(_S.binary("<", _S.read(_v8, "u"), 0.35)) else (_S.prop(_S.read(_v8, "Q"), 2) if _S.truth(_S.binary("<", _S.read(_v8, "u"), 0.7)) else _S.prop(_S.read(_v8, "Q"), 1))), (1 if _S.truth(_S.binary("<", _S.read(_v8, "u"), 0.5)) else _S.binary("*", _S.binary("-", 1, _S.read(_v8, "u")), 2.2))])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "d", 0.5, "+=", false)
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "bx"), _S.read(_e, "by"), _S.binary("*", 3, _S.read(_e, "k")), _S.prop(_S.read(_e, "Q"), 2)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "bx"), _S.read(_e, "by"), _S.binary("*", 2.2, _S.read(_e, "k")), _S.prop(_S.read(_e, "Q"), 3)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "bx"), _S.read(_e, "by"), 1.4, _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "bx"), _S.read(_e, "by"), _S.binary("*", 46, _S.read(_e, "k")), _S.prop(_S.read(_e, "Q"), 2), _S.binary("*", 0.8, _S.read(_e, "k"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "bx"), _S.read(_e, "by"), 14, _S.read(_e, "WHITE"), 0.8])
	_S.call_value(_S.read(_e, "halo"), [_S.read(_e, "p"), 0, 0, _S.binary("-", _S.read(_e, "R"), 0.5), _S.binary("+", _S.read(_e, "R"), 16), _S.prop(_S.read(_e, "Q"), 2), _S.binary("*", 0.35, _S.read(_e, "b"))])
	_S.call_value(_S.read(_e, "unlight"), [_S.read(_e, "p"), _S.unary("-", _S.read(_e, "R")), _S.unary("-", _S.read(_e, "R")), _S.read(_e, "R"), _S.read(_e, "R"), _S.function_value(_e, "_f6")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "r", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.read(_e, "x")), _S.binary("*", _S.read(_e, "y"), _S.read(_e, "y")))]))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "r"), _S.binary("-", _S.read(_e, "R"), 0.5)), func(): return _S.binary(">", _S.read(_e, "r"), _S.binary("+", _S.read(_e, "R"), _S.binary("*", 9, _S.read(_e, "b")))))):
		return null
	_S.define(_e, "a", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "y"), _S.read(_e, "x")]))
	_S.define(_e, "e", _S.binary("/", _S.binary("-", _S.read(_e, "r"), _S.read(_e, "R")), _S.binary("*", 9, _S.read(_e, "b"))))
	_S.define(_e, "streak", _S.binary("+", _S.binary("+", 0.55, _S.binary("*", 0.3, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("*", _S.read(_e, "a"), 23), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "a"), 5)]), 2))]))), _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("-", _S.binary("*", _S.read(_e, "a"), 41), _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "t")), _S.read(_e, "D")))]))))
	_S.define(_e, "I", _S.binary("*", _S.binary("*", _S.binary("**", _S.binary("-", 1, _S.read(_e, "e")), 2.2), _S.read(_e, "streak")), _S.binary("+", 0.75, _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")])])))))
	if _S.truth(_S.binary("<", _S.read(_e, "r"), _S.binary("+", _S.read(_e, "R"), 0.9))):
		return _S.prop(_S.read(_e, "Q"), 3)
	if _S.truth(_S.binary("<", _S.read(_e, "I"), 0.1)):
		return null
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "I"), 0.45), func(): return _S.binary("===", _S.binary("&", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")])), 1), 0))):
		_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", 0.2, _S.read(_e, "I")), "=", false)
	return (_S.prop(_S.read(_e, "Q"), 2) if _S.truth(_S.binary(">", _S.read(_e, "I"), 0.72)) else (_S.prop(_S.read(_e, "Q"), 1) if _S.truth(_S.binary(">", _S.read(_e, "I"), 0.42)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "I"), 0.22)) else _S.prop(_S.read(_e, "C"), 4))))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "r", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.read(_e, "x")), _S.binary("*", _S.read(_e, "y"), _S.read(_e, "y")))]))
	if _S.truth(_S.binary(">=", _S.read(_e, "r"), _S.binary("-", _S.read(_e, "R"), 0.5))):
		return null
	return (_S.prop(_S.read(_e, "C"), 1) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "r"), _S.binary("-", _S.read(_e, "R"), 2.2)), func(): return _S.binary("<", _S.read(_e, "x"), _S.binary("*", _S.unary("-", _S.read(_e, "R")), 0.45)))) else _S.prop(_S.read(_e, "C"), 0))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.binary("<", _S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.read(_e, "x")), _S.binary("*", _S.read(_e, "y"), _S.read(_e, "y"))), _S.binary("**", _S.binary("-", _S.read(_e, "R"), 0.6), 2))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	return _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), _S.read(_e, "k")), _S.read(_e, "t")), _S.read(_e, "D")), _S.read(_e, "ph"))])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "side", (0 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.prop(_S.read(_e, "Math"), "PI")))
	_S.define(_e, "spread", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 1]), 0.5), (1.3 if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 2]), 0.7)) else 3.1)))
	_S.define(_e, "a", _S.binary("+", _S.read(_e, "side"), _S.read(_e, "spread")))
	_S.define(_e, "eq", _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")])]))
	return _S.merge([{"a": _S.read(_e, "a")}, {"len": _S.binary("*", _S.binary("+", 10, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 3]), 28)), _S.binary("+", 0.45, _S.binary("*", 0.75, _S.read(_e, "eq"))))}, {"curl": _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 4]), 0.5), 0.00018)}, {"k": _S.binary("+", 1, _S.binary("%", _S.read(_e, "i"), 3))}, {"ph": _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 5]), _S.read(_e, "TAU"))}, {"w": _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 6])}])
