@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/confused.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "icon", _S.import_value("fx/status/_lib.js", "icon"))
	_S.define(_e, "bitmap", _S.import_value("fx/status/_lib.js", "bitmap"))
	_S.define(_e, "eyes", _S.import_value("fx/status/_lib.js", "eyes"))
	_S.define(_e, "spiral", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Confused"}, {"desc": "Head in a spin: a glowing spiral whirls over the head, question marks pop up round it and bob, the eyes dart left and right."}, {"tags": ["status", "confused", "confusion", "dizzy", "debuff", "loop"]}, {"size": [60, 78]}, {"origin": [30, 70]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#1e0f2e", "#4b2070", "#8a3ab0", "#c66ae0", "#f0a8ff", "#ffffff"]}, {"marks": ["#2a1608", "#b0701a", "#ffd84a", "#fff4b8"]}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SHRUG", _S.merge([{"turn": 1}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 26)}, {"bx": 14}, {"by": _S.unary("-", 26)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.merge([_S.read(_e, "SHRUG"), {"x": 0}, {"lean": _S.unary("-", 2)}])], [0.6, _S.merge([_S.read(_e, "SHRUG"), {"x": 1}, {"lean": 1}, {"crouch": 1}, {"fy": _S.unary("-", 23)}, {"by": _S.unary("-", 29)}, {"fbx": 5}, {"fby": _S.unary("-", 6)}])], [1.2, _S.merge([_S.read(_e, "SHRUG"), {"x": 2}, {"lean": 2}])], [1.8, _S.merge([_S.read(_e, "SHRUG"), {"x": 1}, {"lean": _S.unary("-", 1)}, {"crouch": 1}, {"fy": _S.unary("-", 29)}, {"by": _S.unary("-", 23)}, {"ffx": _S.unary("-", 4)}, {"ffy": _S.unary("-", 6)}])], [2.4, _S.merge([_S.read(_e, "SHRUG"), {"x": 0}, {"lean": _S.unary("-", 2)}])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "QS", _S.invoke([[".###.", "#...#", "....#", "...#.", "..#..", ".....", "..#.."], [".####.", "##..##", "....##", "...##.", "..##..", "..##..", "......", "..##..", "..##.."], [".#####.", "##...##", "##...##", ".....##", "....##.", "...##..", "...##..", ".......", "...##..", "...##.."]], "map", [_S.function_value(_e, "_f6")]))
	_S.define(_e, "MARKS", [_S.merge([{"x": _S.unary("-", 12)}, {"y": _S.unary("-", 5)}, {"t0": 0}, {"big": 2}]), _S.merge([{"x": 12}, {"y": _S.unary("-", 8)}, {"t0": 0.8}, {"big": 1}]), _S.merge([{"x": 1}, {"y": _S.unary("-", 17)}, {"t0": 1.6}, {"big": 2}])])
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
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "rot", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 2))
	_S.define(_e, "turns", 1.8)
	_S.define(_e, "n", 72)
	_S.define(_e, "breathe", _S.binary("+", 1, _S.binary("*", 0.08, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 4)]))))
	_S.define(_e, "at", _S.function_value(_e, "_f1"))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 1)
	while _S.truth(_S.binary("<=", _S.read(_v0, "i"), _S.read(_v0, "n"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "u", _S.binary("/", _S.read(_v1, "i"), _S.read(_v1, "n")))
		var _v2 = _S.call_value(_S.read(_v1, "at"), [_S.binary("/", _S.binary("-", _S.read(_v1, "i"), 1), _S.read(_v1, "n"))])
		_S.define(_v1, "x0", _S.prop(_v2, 0))
		_S.define(_v1, "y0", _S.prop(_v2, 1))
		var _v3 = _S.call_value(_S.read(_v1, "at"), [_S.read(_v1, "u")])
		_S.define(_v1, "x1", _S.prop(_v3, 0))
		_S.define(_v1, "y1", _S.prop(_v3, 1))
		if _S.truth(_S.binary(">", _S.read(_v1, "u"), 0.45)):
			_S.invoke(_S.read(_v1, "p"), "line", [_S.binary("+", _S.read(_v1, "x0"), 0.5), _S.binary("+", _S.read(_v1, "y0"), 0.7), _S.binary("+", _S.read(_v1, "x1"), 0.5), _S.binary("+", _S.read(_v1, "y1"), 0.7), _S.prop(_S.read(_v1, "C"), 1)])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 1)
	while _S.truth(_S.binary("<=", _S.read(_v4, "i"), _S.read(_v4, "n"))):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "u", _S.binary("/", _S.read(_v5, "i"), _S.read(_v5, "n")))
		var _v6 = _S.call_value(_S.read(_v5, "at"), [_S.binary("/", _S.binary("-", _S.read(_v5, "i"), 1), _S.read(_v5, "n"))])
		_S.define(_v5, "x0", _S.prop(_v6, 0))
		_S.define(_v5, "y0", _S.prop(_v6, 1))
		var _v7 = _S.call_value(_S.read(_v5, "at"), [_S.read(_v5, "u")])
		_S.define(_v5, "x1", _S.prop(_v7, 0))
		_S.define(_v5, "y1", _S.prop(_v7, 1))
		_S.invoke(_S.read(_v5, "p"), "line", [_S.read(_v5, "x0"), _S.read(_v5, "y0"), _S.read(_v5, "x1"), _S.read(_v5, "y1"), (_S.prop(_S.read(_v5, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v5, "u"), 0.88)) else (_S.prop(_S.read(_v5, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v5, "u"), 0.62)) else (_S.prop(_S.read(_v5, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v5, "u"), 0.3)) else _S.prop(_S.read(_v5, "C"), 2))))])
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v5, "i"), 6), 0)):
			_S.invoke(_S.read(_v5, "p"), "light", [_S.read(_v5, "x1"), _S.read(_v5, "y1"), _S.prop(_S.read(_v5, "C"), 3), _S.binary("*", 0.4, _S.read(_v5, "u"))])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	var _v8 = _S.call_value(_S.read(_e, "at"), [1])
	_S.define(_e, "hx", _S.prop(_v8, 0))
	_S.define(_e, "hy", _S.prop(_v8, 1))
	_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "hx"), _S.read(_e, "hy"), 2, _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), 0.5])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "cx"), _S.read(_e, "cy"), 13, _S.prop(_S.read(_e, "C"), 3), 0.28])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "th", _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "turns")), _S.read(_e, "TAU")), _S.read(_e, "rot")))
	_S.define(_e, "r", _S.binary("*", _S.binary("+", 0.8, _S.binary("*", 6.6, _S.read(_e, "u"))), _S.read(_e, "breathe")))
	return [_S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "r"))), _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]), _S.read(_e, "r")), 0.9))]

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.prop(_S.read(_e, "a"), "y"), 7), 16, _S.prop(_S.read(_e, "C"), 3), 0.22])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "M", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "marks"), 4]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "look", (1 if _S.truth(_S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), 6)]), 2)) else _S.unary("-", 1)))
	for _v9 in _S.array(_S.call_value(_S.read(_e, "eyes"), [_S.read(_e, "a")])):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "e", _v9)
		var _v11 = _S.scope(_v10)
		for _v12 in _S.array(_S.prop(_S.read(_v11, "e"), "px")):
			var _v13 = _S.scope(_v11)
			var _v14 = _v12
			_S.define(_v13, "x", _S.prop(_v14, 0))
			_S.define(_v13, "y", _S.prop(_v14, 1))
			_S.invoke(_S.read(_v13, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v13, "a"), "x"), _S.read(_v13, "x")), _S.binary("+", _S.prop(_S.read(_v13, "a"), "y"), _S.read(_v13, "y")), 4279702047])
		_S.invoke(_S.read(_v11, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v11, "a"), "x"), (_S.prop(_S.read(_v11, "e"), "x0") if _S.truth(_S.binary("<", _S.read(_v11, "look"), 0)) else _S.prop(_S.read(_v11, "e"), "x1"))), _S.binary("+", _S.prop(_S.read(_v11, "a"), "y"), _S.prop(_S.read(_v11, "e"), "y0")), 4294967295])
	_S.call_value(_S.read(_e, "spiral"), [_S.read(_e, "p"), _S.read(_e, "C"), 0, _S.binary("-", _S.prop(_S.read(_e, "a"), "y"), 7), _S.read(_e, "t")])
	for _v15 in _S.array(_S.read(_e, "MARKS")):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "m", _v15)
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v17, "t"), _S.prop(_S.read(_v17, "m"), "t0")), _S.read(_v17, "D")), _S.read(_v17, "D")), _S.read(_v17, "D")))
		_S.define(_v17, "life", 1.9)
		if _S.truth(_S.binary(">", _S.read(_v17, "age"), _S.read(_v17, "life"))):
			continue
		_S.define(_v17, "u", _S.binary("/", _S.read(_v17, "age"), _S.read(_v17, "life")))
		_S.define(_v17, "pop", _S.invoke(_S.read(_v17, "ease"), "outBack", [_S.call_value(_S.read(_v17, "clamp"), [_S.binary("/", _S.read(_v17, "age"), 0.16)]), 3]))
		_S.define(_v17, "out", _S.call_value(_S.read(_v17, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v17, "u"), 0.82), 0.18)]))
		_S.define(_v17, "size", _S.invoke(_S.read(_v17, "Math"), "max", [0, _S.invoke(_S.read(_v17, "Math"), "round", [_S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v17, "m"), "big"), _S.read(_v17, "pop")), _S.binary("-", 1, _S.read(_v17, "out"))), (1 if _S.truth(_S.binary(">", _S.read(_v17, "pop"), 1.1)) else 0))])]))
		_S.define(_v17, "bob", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v17, "age"), 5), _S.binary("*", _S.prop(_S.read(_v17, "m"), "t0"), 3))]), 1.6))
		_S.define(_v17, "tilt", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v17, "age"), 3.3), _S.prop(_S.read(_v17, "m"), "t0"))]), 0.8))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v17, "pop"), 0.3), func(): return _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v17, "out"), 0), func(): return _S.binary("===", _S.read(_v17, "size"), 0)), func(): return _S.binary(">", _S.read(_v17, "out"), 0.6)))):
			continue
		_S.define(_v17, "x", _S.binary("+", _S.prop(_S.read(_v17, "m"), "x"), _S.read(_v17, "tilt")))
		_S.define(_v17, "y", _S.binary("-", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v17, "a"), "y"), _S.prop(_S.read(_v17, "m"), "y")), _S.read(_v17, "bob")), _S.binary("*", _S.read(_v17, "age"), 2)))
		if _S.truth(_S.binary("<", _S.read(_v17, "age"), 0.2)):
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "k", _S.binary("/", _S.read(_v18, "age"), 0.2))
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v19, "j"), 8)):
				var _v20 = _S.scope(_v19)
				_S.define(_v20, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v20, "j"), 8), _S.read(_v20, "TAU")), 0.2))
				_S.define(_v20, "d0", _S.binary("+", 4, _S.binary("*", 7, _S.read(_v20, "k"))))
				_S.define(_v20, "d1", _S.binary("+", _S.read(_v20, "d0"), _S.binary("*", 3, _S.binary("-", 1, _S.read(_v20, "k")))))
				_S.invoke(_S.read(_v20, "p"), "line", [_S.binary("+", _S.read(_v20, "x"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "an")]), _S.read(_v20, "d0"))), _S.binary("+", _S.read(_v20, "y"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "an")]), _S.read(_v20, "d0"))), _S.binary("+", _S.read(_v20, "x"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "an")]), _S.read(_v20, "d1"))), _S.binary("+", _S.read(_v20, "y"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "an")]), _S.read(_v20, "d1"))), (_S.prop(_S.read(_v20, "M"), 2) if _S.truth(_S.binary("%", _S.read(_v20, "j"), 2)) else _S.prop(_S.read(_v20, "M"), 3)), _S.binary("-", 1, _S.read(_v20, "k"))])
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "j", 1, "+=", true)
			_S.invoke(_S.read(_v18, "p"), "glow", [_S.read(_v18, "x"), _S.read(_v18, "y"), 16, _S.prop(_S.read(_v18, "M"), 2), _S.binary("*", 0.45, _S.binary("-", 1, _S.read(_v18, "k")))])
		_S.call_value(_S.read(_v17, "icon"), [_S.read(_v17, "p"), _S.read(_v17, "x"), _S.read(_v17, "y"), 7, _S.prop(_S.read(_v17, "QS"), _S.invoke(_S.read(_v17, "Math"), "min", [2, _S.read(_v17, "size")])), [_S.prop(_S.read(_v17, "M"), 0), _S.prop(_S.read(_v17, "M"), 1), _S.prop(_S.read(_v17, "M"), 2), _S.prop(_S.read(_v17, "M"), 3)]])
		_S.invoke(_S.read(_v17, "p"), "glow", [_S.read(_v17, "x"), _S.read(_v17, "y"), _S.binary("+", 10, _S.binary("*", _S.read(_v17, "size"), 2)), _S.prop(_S.read(_v17, "M"), 2), _S.binary("*", 0.28, _S.binary("-", 1, _S.read(_v17, "out")))])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 10, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 2), _S.function_value(_e, "_f4"), _S.function_value(_e, "_f5")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.35, 0.6])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "d", _S.binary("+", 6, _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [12, 22]))))
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "d")))
	_S.define(_e, "y", _S.binary("+", _S.binary("-", _S.prop(_S.read(_e, "a"), "y"), 7), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]), _S.read(_e, "d")), 0.8)))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "u"))]), 0.6), func(): return _S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.5))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), 1, _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), 0.3])
	else:
		_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else _S.prop(_S.read(_e, "C"), 4)), _S.binary("-", 1.2, _S.read(_e, "u"))])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rows", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "bitmap"), [_S.read(_e, "rows")])
