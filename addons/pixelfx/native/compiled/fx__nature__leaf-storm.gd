@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/leaf-storm.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "drawLeaf", _S.import_value("fx/nature/_lib.js", "drawLeaf"))
	_S.define(_e, "leaves", _S.function_value(_e, "_f0"))
	_S.define(_e, "wind", _S.function_value(_e, "_f3"))
	_S.define(_e, "swirl", _S.function_value(_e, "_f4"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f7"))
	_S.define(_e, "draw", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Leaf storm"}, {"desc": "Leaves tumble up a rising spiral round the character, passing behind and in front, turning and flipping, wrapped in bright bands of wind; litter swirls at their feet."}, {"tags": ["nature", "wind", "leaves", "buff", "aura", "actor", "loop"]}, {"size": [112, 104]}, {"origin": [56, 92]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#1a2420", "#2e4038", "#4a6656", "#7a9a84", "#b4d0b8", "#eef8e8"]}, {"leaves": ["#123818", "#2f7a2a", "#6cb83a", "#c8f070", "#4a2a08", "#a8701c", "#e8b42e", "#fff09a", "#3a1010", "#9a2e1c", "#e0642a", "#ffb070"]}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "UP", _S.merge([{"turn": 1.1}, {"crouch": 0}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 37)}, {"bx": 13}, {"by": _S.unary("-", 37)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"poses": [[0, _S.read(_e, "UP")], [0.6, _S.merge([_S.read(_e, "UP"), {"lean": 2}, {"fy": _S.unary("-", 40)}, {"by": _S.unary("-", 33)}])], [1.2, _S.merge([_S.read(_e, "UP"), {"crouch": _S.unary("-", 1)}])], [1.8, _S.merge([_S.read(_e, "UP"), {"lean": _S.unary("-", 2)}, {"fy": _S.unary("-", 33)}, {"by": _S.unary("-", 40)}])], [2.4, _S.read(_e, "UP")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SY", 0.3)
	_S.define(_e, "TOP", 64)
	_S.define(_e, "ringR", _S.function_value(_e, "_f9"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "seed", _S.arg(_args, 3))
	_S.define(_e, "back", _S.arg(_args, 4))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), 28, _S.read(_e, "seed"), _S.function_value(_e, "_f1"), _S.function_value(_e, "_f2")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [1.5, 2.3])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "turns", _S.invoke(_S.read(_e, "R"), "range", [1.4, 2.2]))
	_S.define(_e, "th", _S.binary("+", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]), _S.binary("*", _S.binary("*", _S.read(_e, "turns"), _S.read(_e, "TAU")), _S.read(_e, "k"))))
	_S.define(_e, "sn", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]))
	if _S.truth(_S.binary("===", _S.binary(">", _S.read(_e, "sn"), 0), _S.read(_e, "back"))):
		return null
	_S.define(_e, "y", _S.binary("-", _S.unary("-", _S.call_value(_S.read(_e, "lerp"), [1, _S.read(_e, "TOP"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "k"), 0.9])])), _S.invoke(_S.read(_e, "R"), "range", [0, 6])))
	_S.define(_e, "fling", _S.call_value(_S.read(_e, "smooth"), [0.75, 1, _S.read(_e, "k")]))
	_S.define(_e, "rr", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "ringR"), [_S.read(_e, "y")]), _S.invoke(_S.read(_e, "R"), "range", [0.85, 1.15])), _S.binary("*", _S.read(_e, "fling"), 22)))
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "rr")))
	_S.define(_e, "yy", _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "sn"), _S.read(_e, "rr")), _S.read(_e, "SY"))))
	_S.define(_e, "a", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 7)]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.85, 1, _S.read(_e, "k")]))))
	_S.define(_e, "spin", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 9), 9]), _S.read(_e, "age")), _S.read(_e, "th")))
	_S.define(_e, "fl", _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "R"), "range", [5, 11])))
	_S.define(_e, "o", _S.binary("*", _S.invoke(_S.read(_e, "R"), "int", [0, 2]), 4))
	_S.define(_e, "pal", ([_S.prop(_S.read(_e, "L"), _S.read(_e, "o")), _S.prop(_S.read(_e, "L"), _S.read(_e, "o")), _S.prop(_S.read(_e, "L"), _S.binary("+", _S.read(_e, "o"), 1)), _S.prop(_S.read(_e, "L"), _S.binary("+", _S.read(_e, "o"), 2))] if _S.truth(_S.read(_e, "back")) else [_S.prop(_S.read(_e, "L"), _S.read(_e, "o")), _S.prop(_S.read(_e, "L"), _S.binary("+", _S.read(_e, "o"), 1)), _S.prop(_S.read(_e, "L"), _S.binary("+", _S.read(_e, "o"), 2)), _S.prop(_S.read(_e, "L"), _S.binary("+", _S.read(_e, "o"), 3))]))
	_S.call_value(_S.read(_e, "drawLeaf"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "yy"), _S.invoke(_S.read(_e, "R"), "range", [6.5, 9]), _S.invoke(_S.read(_e, "R"), "range", [2.4, 3.3]), _S.read(_e, "spin"), _S.read(_e, "fl"), _S.read(_e, "pal"), _S.read(_e, "a")])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "back")), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "fl")])]), 0.97))):
		var _v0 = _S.scope(_e)
		_S.invoke(_S.read(_v0, "p"), "px", [_S.read(_v0, "x"), _S.read(_v0, "yy"), _S.read(_v0, "WHITE")])
		_S.invoke(_S.read(_v0, "p"), "glow", [_S.read(_v0, "x"), _S.read(_v0, "yy"), 5, _S.prop(_S.read(_v0, "L"), _S.binary("+", _S.read(_v0, "o"), 3)), _S.binary("*", 0.35, _S.read(_v0, "a"))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "seed", _S.arg(_args, 3))
	_S.define(_e, "back", _S.arg(_args, 4))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "j"), 16)):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "R", _S.call_value(_S.read(_v2, "rng"), [_S.read(_v2, "seed"), _S.read(_v2, "j")]))
		_S.define(_v2, "y0", _S.unary("-", _S.invoke(_S.read(_v2, "R"), "range", [4, _S.binary("-", _S.read(_v2, "TOP"), 4)])))
		_S.define(_v2, "r", _S.binary("*", _S.call_value(_S.read(_v2, "ringR"), [_S.read(_v2, "y0")]), _S.invoke(_S.read(_v2, "R"), "range", [1, 1.25])))
		_S.define(_v2, "K", _S.invoke(_S.read(_v2, "R"), "int", [2, 3]))
		_S.define(_v2, "span", _S.invoke(_S.read(_v2, "R"), "range", [1.1, 2.4]))
		_S.define(_v2, "head", _S.binary("+", _S.invoke(_S.read(_v2, "R"), "range", [0, _S.read(_v2, "TAU")]), _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v2, "TAU"), _S.read(_v2, "K")), _S.read(_v2, "t")), _S.prop(_S.read(_v2, "meta"), "duration"))))
		_S.define(_v2, "rise", _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 0.18), 0.18]))
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "s", 0)
		while _S.truth(_S.binary("<=", _S.read(_v3, "s"), _S.read(_v3, "span"))):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "th", _S.binary("-", _S.read(_v4, "head"), _S.read(_v4, "s")))
			_S.define(_v4, "sn", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "th")]))
			if _S.truth(_S.binary("===", _S.binary(">", _S.read(_v4, "sn"), 0), _S.read(_v4, "back"))):
				_v3 = _S.iteration(_v3)
				_S.write(_v3, "s", _S.binary("/", 0.45, _S.read(_v3, "r")), "+=", false)
				continue
			_S.define(_v4, "k", _S.binary("/", _S.read(_v4, "s"), _S.read(_v4, "span")))
			_S.define(_v4, "x", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "th")]), _S.read(_v4, "r")))
			_S.define(_v4, "y", _S.binary("+", _S.binary("+", _S.read(_v4, "y0"), _S.binary("*", _S.binary("*", _S.read(_v4, "sn"), _S.read(_v4, "r")), _S.read(_v4, "SY"))), _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_v4, "th"), _S.read(_v4, "head")), _S.read(_v4, "rise")), 4)))
			_S.define(_v4, "c", ((_S.prop(_S.read(_v4, "C"), 3) if _S.truth(_S.binary("<", _S.read(_v4, "k"), 0.3)) else _S.prop(_S.read(_v4, "C"), 2)) if _S.truth(_S.read(_v4, "back")) else (_S.read(_v4, "WHITE") if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v4, "k"), 0.06), func(): return _S.binary("<", _S.invoke(_S.read(_v4, "R"), "next", []), 2))) else (_S.prop(_S.read(_v4, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v4, "k"), 0.15)) else (_S.prop(_S.read(_v4, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v4, "k"), 0.4)) else _S.prop(_S.read(_v4, "C"), 3))))))
			if _S.truth(_S.binary("<", _S.read(_v4, "k"), 0.45)):
				_S.invoke(_S.read(_v4, "p"), "dot", [_S.read(_v4, "x"), _S.read(_v4, "y"), _S.read(_v4, "c")])
			else:
				_S.invoke(_S.read(_v4, "p"), "blend", [_S.read(_v4, "x"), _S.read(_v4, "y"), _S.read(_v4, "c"), _S.binary("*", 1.6, _S.binary("-", 1, _S.read(_v4, "k")))])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "s", _S.binary("/", 0.45, _S.read(_v3, "r")), "+=", false)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v2, "back")), func(): return _S.binary(">", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "head")]), 0))):
			_S.invoke(_S.read(_v2, "p"), "glow", [_S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "head")]), _S.read(_v2, "r")), _S.binary("+", _S.read(_v2, "y0"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "head")]), _S.read(_v2, "r")), _S.read(_v2, "SY"))), 5, _S.prop(_S.read(_v2, "C"), 4), 0.25])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "j", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "L", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "seed", _S.arg(_args, 4))
	_S.define(_e, "back", _S.arg(_args, 5))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), 14, _S.read(_e, "seed"), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	var _v5 = _S.scope(_e)
	_S.define(_v5, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "j"), 6)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "R", _S.call_value(_S.read(_v6, "rng"), [_S.binary("+", _S.read(_v6, "seed"), 9), _S.read(_v6, "j")]))
		_S.define(_v6, "rr", _S.invoke(_S.read(_v6, "R"), "range", [12, 24]))
		_S.define(_v6, "th0", _S.binary("+", _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")]), _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v6, "TAU"), 3), _S.read(_v6, "t")), _S.prop(_S.read(_v6, "meta"), "duration"))))
		_S.define(_v6, "span", _S.invoke(_S.read(_v6, "R"), "range", [0.5, 1]))
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "s", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "s"), _S.read(_v7, "span"))):
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "th", _S.binary("-", _S.read(_v8, "th0"), _S.read(_v8, "s")))
			if _S.truth(_S.binary("===", _S.binary(">", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "th")]), 0), _S.read(_v8, "back"))):
				_v7 = _S.iteration(_v7)
				_S.write(_v7, "s", _S.binary("/", 0.6, _S.read(_v7, "rr")), "+=", false)
				continue
			_S.invoke(_S.read(_v8, "p"), "dot", [_S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "th")]), _S.read(_v8, "rr")), _S.binary("+", 0.5, _S.binary("*", _S.binary("*", _S.read(_v8, "rr"), 0.2), _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "th")]))), (_S.prop(_S.read(_v8, "C"), 3) if _S.truth(_S.binary("<", _S.read(_v8, "s"), _S.binary("*", _S.read(_v8, "span"), 0.4))) else _S.prop(_S.read(_v8, "C"), 2)), _S.binary("-", 1, _S.binary("/", _S.read(_v8, "s"), _S.read(_v8, "span")))])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "s", _S.binary("/", 0.6, _S.read(_v7, "rr")), "+=", false)
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "j", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.6, 1.1])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "th", _S.binary("+", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]), _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [6, 9]), _S.read(_e, "age"))))
	_S.define(_e, "sn", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]))
	if _S.truth(_S.binary("===", _S.binary(">", _S.read(_e, "sn"), 0), _S.read(_e, "back"))):
		return null
	_S.define(_e, "rr", _S.binary("+", _S.invoke(_S.read(_e, "R"), "range", [10, 22]), _S.binary("*", _S.read(_e, "k"), 8)))
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "rr")))
	_S.define(_e, "y", _S.binary("+", _S.binary("-", _S.unary("-", 1), _S.binary("*", _S.read(_e, "k"), _S.invoke(_S.read(_e, "R"), "range", [2, 8]))), _S.binary("*", _S.binary("*", _S.read(_e, "sn"), _S.read(_e, "rr")), 0.25)))
	_S.define(_e, "s", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [2, 3.5]), _S.binary("+", 0.6, _S.read(_e, "k"))))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "s"), (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.read(_e, "back")) else _S.prop(_S.read(_e, "C"), 3)), _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_e, "k")), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 6)])), 0.3)])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "L", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "leaves"), 12]))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 30), 46, _S.prop(_S.read(_e, "C"), 4), 0.12])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 2), 26, _S.prop(_S.read(_e, "L"), 2), 0.12])
	_S.call_value(_S.read(_e, "swirl"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "L"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 3), 1), true])
	_S.call_value(_S.read(_e, "wind"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 5), 2), true])
	_S.call_value(_S.read(_e, "leaves"), [_S.read(_e, "p"), _S.read(_e, "L"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7), 3), true])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "L", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "leaves"), 12]))
	_S.call_value(_S.read(_e, "swirl"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "L"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 3), 1), false])
	_S.call_value(_S.read(_e, "wind"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 5), 2), false])
	_S.call_value(_S.read(_e, "leaves"), [_S.read(_e, "p"), _S.read(_e, "L"), _S.read(_e, "t"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7), 3), false])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	return _S.binary("+", 15, _S.binary("*", 9, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.unary("-", _S.read(_e, "y")), _S.read(_e, "TOP"))])))
