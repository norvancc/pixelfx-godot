@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/sleep.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "icon", _S.import_value("fx/status/_lib.js", "icon"))
	_S.define(_e, "bitmap", _S.import_value("fx/status/_lib.js", "bitmap"))
	_S.define(_e, "eyes", _S.import_value("fx/status/_lib.js", "eyes"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "zAt", _S.function_value(_e, "_f0"))
	_S.define(_e, "shut", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Sleep"}, {"desc": "Fast asleep: eyes shut, soft outlined Zs float up off the head one after another, swaying and growing as they rise, dream motes drift, a slow breathing glow."}, {"tags": ["status", "sleep", "zzz", "rest", "debuff", "loop"]}, {"size": [60, 82]}, {"origin": [26, 74]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#1a1636", "#3c3a7a", "#6f78c8", "#a9b8f0", "#dfe6ff", "#ffffff"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "NOD", _S.merge([{"turn": 0.9}, {"crouch": 1}, {"lean": 1}, {"hy": 2}, {"fx": _S.unary("-", 6)}, {"fy": _S.unary("-", 14)}, {"bx": 7}, {"by": _S.unary("-", 14)}, {"ffx": _S.unary("-", 2)}, {"fbx": 3}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "NOD")], [1.2, _S.merge([_S.read(_e, "NOD"), {"crouch": 2}, {"lean": 2}, {"hy": 3}])], [2.4, _S.read(_e, "NOD")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NZ", 3)
	_S.define(_e, "ZS", _S.invoke([["#####", "...#.", "..#..", ".#...", "#####"], ["#######", ".....#.", "....#..", "...#...", "..#....", ".#.....", "#######"], [".#######.", "#########", "......##.", ".....##..", "....##...", "...##....", "..##.....", "#########", ".#######."], [".#########.", "###########", ".......###.", "......###..", ".....###...", "....###....", "...###.....", "..###......", ".###.......", "###########", ".#########."]], "map", [_S.function_value(_e, "_f7")]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "u", _S.arg(_args, 2))
	_S.define(_e, "side", (1 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else 0.6))
	_S.define(_e, "x0", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.binary("*", _S.prop(_S.read(_e, "a"), "w"), 0.78)))
	_S.define(_e, "y0", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), 7))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.binary("*", 13, _S.read(_e, "side")), _S.read(_e, "u"))), _S.binary("*", 2.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "TAU"), 1.1), _S.read(_e, "u")), _S.binary("*", _S.read(_e, "i"), 2.1))]))))
	_S.define(_e, "y", _S.binary("-", _S.read(_e, "y0"), _S.binary("*", 32, _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "u")), 1.35])))))
	_S.define(_e, "size", (0 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.18)) else (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.42)) else (2 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.68)) else 3))))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "u"), 0.06)]))
	return _S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"size": _S.read(_e, "size")}, {"k": _S.read(_e, "k")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	for _v0 in _S.array(_S.call_value(_S.read(_e, "eyes"), [_S.read(_e, "a")])):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "e", _v0)
		var _v2 = _S.scope(_v1)
		for _v3 in _S.array(_S.prop(_S.read(_v2, "e"), "px")):
			var _v4 = _S.scope(_v2)
			var _v5 = _v3
			_S.define(_v4, "x", _S.prop(_v5, 0))
			_S.define(_v4, "y", _S.prop(_v5, 1))
			_S.invoke(_S.read(_v4, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v4, "a"), "x"), _S.read(_v4, "x")), _S.binary("+", _S.prop(_S.read(_v4, "a"), "y"), _S.read(_v4, "y")), _S.prop(_S.read(_v4, "e"), "skin")])
		_S.define(_v2, "lid", _S.logical("||", _S.call_value(_S.read(_v2, "colorAt"), [_S.read(_v2, "a"), _S.binary("-", _S.prop(_S.read(_v2, "e"), "x0"), 1), _S.binary("-", _S.prop(_S.read(_v2, "e"), "y0"), 4)]), func(): return _S.call_value(_S.read(_v2, "colorAt"), [_S.read(_v2, "a"), _S.prop(_S.prop(_S.prop(_S.read(_v2, "e"), "px"), 0), 0), _S.prop(_S.prop(_S.prop(_S.read(_v2, "e"), "px"), 0), 1)])))
		_S.define(_v2, "y", _S.binary("-", _S.binary("+", _S.prop(_S.read(_v2, "a"), "y"), _S.prop(_S.read(_v2, "e"), "y1")), 1))
		var _v6 = _S.scope(_v2)
		_S.define(_v6, "x", _S.prop(_S.read(_v6, "e"), "x0"))
		while _S.truth(_S.binary("<=", _S.read(_v6, "x"), _S.prop(_S.read(_v6, "e"), "x1"))):
			_S.invoke(_S.read(_v6, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v6, "a"), "x"), _S.read(_v6, "x")), _S.read(_v6, "y"), 4280227622])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "x", 1, "+=", true)
		_S.invoke(_S.read(_v2, "p"), "px", [_S.binary("-", _S.binary("+", _S.prop(_S.read(_v2, "a"), "x"), _S.prop(_S.read(_v2, "e"), "x0")), 1), _S.binary("-", _S.read(_v2, "y"), 1), 4280227622])
		_S.invoke(_S.read(_v2, "p"), "px", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v2, "a"), "x"), _S.prop(_S.read(_v2, "e"), "x1")), 1), _S.binary("-", _S.read(_v2, "y"), 1), 4280227622])
		_S.unary("void", _S.read(_v2, "lid"))
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "breath", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 2)]))))
	_S.call_value(_S.read(_e, "shut"), [_S.read(_e, "p"), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), 10), 24, _S.prop(_S.read(_e, "C"), 3), _S.binary("+", 0.1, _S.binary("*", 0.1, _S.read(_e, "breath")))])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 5, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 6), _S.read(_e, "D"), _S.function_value(_e, "_f3")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 14, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 4), _S.function_value(_e, "_f4"), _S.function_value(_e, "_f5")])
	_S.define(_e, "zs", [])
	var _v7 = _S.scope(_e)
	_S.define(_v7, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "i"), _S.read(_v7, "NZ"))):
		_S.invoke(_S.read(_v7, "zs"), "push", [_S.merge([{"i": _S.read(_v7, "i")}, {"u": _S.binary("/", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v7, "t"), _S.binary("/", _S.binary("*", _S.read(_v7, "i"), _S.read(_v7, "D")), _S.read(_v7, "NZ"))), _S.read(_v7, "D")), _S.read(_v7, "D")), _S.read(_v7, "D")), _S.read(_v7, "D"))}])])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "zs"), "sort", [_S.function_value(_e, "_f6")])
	for _v8 in _S.array(_S.read(_e, "zs")):
		var _v9 = _S.scope(_e)
		var _v10 = _v8
		_S.define(_v9, "i", _S.prop(_v10, "i"))
		_S.define(_v9, "u", _S.prop(_v10, "u"))
		var _v11 = _S.scope(_v9)
		_S.define(_v11, "z", _S.call_value(_S.read(_v11, "zAt"), [_S.read(_v11, "a"), _S.read(_v11, "i"), _S.read(_v11, "u")]))
		if _S.truth(_S.binary(">", _S.read(_v11, "u"), 0.9)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "k", _S.binary("/", _S.binary("-", _S.read(_v12, "u"), 0.9), 0.1))
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v13, "j"), 7)):
				var _v14 = _S.scope(_v13)
				_S.define(_v14, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v14, "j"), 7), _S.read(_v14, "TAU")), _S.read(_v14, "i")))
				_S.define(_v14, "d", _S.binary("+", 3, _S.binary("*", 6, _S.invoke(_S.read(_v14, "Math"), "sqrt", [_S.read(_v14, "k")]))))
				_S.invoke(_S.read(_v14, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v14, "z"), "x"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "an")]), _S.read(_v14, "d"))), _S.binary("+", _S.prop(_S.read(_v14, "z"), "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "an")]), _S.read(_v14, "d")), 0.8)), (_S.prop(_S.read(_v14, "C"), 4) if _S.truth(_S.binary("%", _S.read(_v14, "j"), 2)) else _S.prop(_S.read(_v14, "C"), 5)), _S.binary("-", 1.2, _S.read(_v14, "k"))])
				_v13 = _S.iteration(_v13)
				_S.write(_v13, "j", 1, "+=", true)
			_S.invoke(_S.read(_v12, "p"), "glow", [_S.prop(_S.read(_v12, "z"), "x"), _S.prop(_S.read(_v12, "z"), "y"), 10, _S.prop(_S.read(_v12, "C"), 3), _S.binary("*", 0.25, _S.binary("-", 1, _S.read(_v12, "k")))])
			continue
		var _v15 = _S.scope(_v11)
		_S.define(_v15, "j", 1)
		while _S.truth(_S.binary("<=", _S.read(_v15, "j"), 6)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "q", _S.call_value(_S.read(_v16, "zAt"), [_S.read(_v16, "a"), _S.read(_v16, "i"), _S.invoke(_S.read(_v16, "Math"), "max", [0, _S.binary("-", _S.read(_v16, "u"), _S.binary("*", _S.read(_v16, "j"), 0.025))])]))
			if _S.truth(_S.logical("||", _S.binary("===", _S.binary("%", _S.read(_v16, "j"), 2), 0), func(): return _S.binary("<", _S.binary("-", _S.read(_v16, "u"), _S.binary("*", _S.read(_v16, "j"), 0.025)), 0.05))):
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "j", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v16, "p"), "dot", [_S.binary("-", _S.prop(_S.read(_v16, "q"), "x"), 1), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v16, "q"), "y"), 4), _S.prop(_S.read(_v16, "q"), "size")), _S.prop(_S.read(_v16, "C"), 3), _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_v16, "j"), 7)), 0.9)])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "j", 1, "+=", true)
		_S.define(_v11, "old", (1 if _S.truth(_S.binary(">", _S.read(_v11, "u"), 0.78)) else 0))
		_S.define(_v11, "R", ([_S.prop(_S.read(_v11, "C"), 0), _S.prop(_S.read(_v11, "C"), 1), _S.prop(_S.read(_v11, "C"), 2), _S.prop(_S.read(_v11, "C"), 3)] if _S.truth(_S.read(_v11, "old")) else [_S.prop(_S.read(_v11, "C"), 1), _S.prop(_S.read(_v11, "C"), 2), _S.prop(_S.read(_v11, "C"), 3), _S.prop(_S.read(_v11, "C"), 4)]))
		_S.call_value(_S.read(_v11, "icon"), [_S.read(_v11, "p"), _S.prop(_S.read(_v11, "z"), "x"), _S.prop(_S.read(_v11, "z"), "y"), 7, _S.prop(_S.read(_v11, "ZS"), _S.prop(_S.read(_v11, "z"), "size")), _S.read(_v11, "R"), _S.prop(_S.read(_v11, "z"), "k")])
		if _S.truth(_S.unary("!", _S.read(_v11, "old"))):
			_S.invoke(_S.read(_v11, "p"), "px", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_v11, "z"), "x"), 2), _S.prop(_S.read(_v11, "z"), "size")), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v11, "z"), "y"), 2), _S.binary("*", _S.prop(_S.read(_v11, "z"), "size"), 0.8)), _S.prop(_S.read(_v11, "C"), 5)])
		_S.invoke(_S.read(_v11, "p"), "glow", [_S.prop(_S.read(_v11, "z"), "x"), _S.prop(_S.read(_v11, "z"), "y"), _S.binary("+", 7, _S.binary("*", _S.prop(_S.read(_v11, "z"), "size"), 3)), _S.prop(_S.read(_v11, "C"), 3), _S.binary("*", (0.12 if _S.truth(_S.read(_v11, "old")) else 0.26), _S.prop(_S.read(_v11, "z"), "k"))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.binary("*", _S.prop(_S.read(_e, "a"), "w"), _S.invoke(_S.read(_e, "r"), "range", [0.3, 1.1]))), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "TAU")), _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), _S.read(_e, "TAU")))]), 3)))
	_S.define(_e, "y", _S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 6), 8])), _S.binary("*", _S.read(_e, "u"), 10)))
	_S.define(_e, "rad", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [3, 5]), _S.binary("+", 0.8, _S.binary("*", 0.4, _S.read(_e, "u")))))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "u"))]))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.read(_e, "rad"), 2.4), _S.prop(_S.read(_e, "C"), 3), _S.binary("*", 0.1, _S.read(_e, "k"))])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.2, 2])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.binary("*", _S.prop(_S.read(_e, "a"), "w"), _S.invoke(_S.read(_e, "r"), "range", [0.4, 1.1]))), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2), _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), _S.read(_e, "TAU")))]), 2)))
	_S.define(_e, "y", _S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.invoke(_S.read(_e, "r"), "range", [0, 10])), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [10, 18]))))
	_S.define(_e, "tw", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "u"))]), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 9), _S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), _S.read(_e, "TAU")))])))))
	if _S.truth(_S.binary("<", _S.read(_e, "tw"), 0.15)):
		return null
	_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), (1 if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "tw"), 0.7), func(): return _S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.4))) else 0), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.binary("*", 0.3, _S.read(_e, "tw"))])
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "tw"), 0.6)) else _S.prop(_S.read(_e, "C"), 4)), _S.binary("*", _S.read(_e, "tw"), 1.3)])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p1", _S.arg(_args, 0))
	_S.define(_e, "p2", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "p2"), "u"), _S.prop(_S.read(_e, "p1"), "u"))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rows", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "bitmap"), [_S.read(_e, "rows")])
